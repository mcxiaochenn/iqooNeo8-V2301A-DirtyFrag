# 使用手册

DirtyFrag 通过内核漏洞（CVE-2026-43284）临时拿到 root，重启即恢复，不做任何持久化。整个过程在手机上完成，不需要电脑，也不需要 Shizuku。

## 适用条件

- **设备**：iQOO Neo8（PD2301 / V2301A），OriginOS 6 / Android 16
- **内核**：`5.10.246-gki-g8c3d0d7851ff`（vivo 定制，vermagic 必须逐字节一致）
- **已装 root 管理器**：KernelSU / FinaSU / KernelSU Next / BakaSU / SukiSU Ultra 之一，且其 `libksud.so` 存在

内核版本对不上时 exploit 会直接失败，不会写坏系统。

## 步骤

1. 装好 root 管理器（不需要它已经拿到 root，只要 App 在、`libksud.so` 在）
2. 在「ROOT管理器」里选你装的那个；选错或没装会在日志里提示
3. 点「一键越狱」，等日志跑完
4. 成功后状态卡会变成「临时 root 已激活」，管理器能正常拿到 su

## 失败时看哪里

- **`libksud.so not found`**：管理器版本不对，换个带该库的版本
- **`dfroot.ko` 加载失败**：内核版本不是 `5.10.246-gki-g8c3d0d7851ff`，或者系统更新过
- **`ERROR: ...`**：把日志整段发出来，里面带具体异常
- **手机重启**：临时 root 会消失，这是设计如此；重新点一次即可

## 注意

- 只在本机内核上验证过，其他机型不要直接装
- 越狱后不要卸载管理器，`ksud` 的后续操作依赖它
- 系统 OTA 后内核版本会变，ko 需要重新对
