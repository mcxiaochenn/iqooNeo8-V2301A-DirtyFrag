#!/usr/bin/env bash
# 人工介入通知：文本 -> 中文语音 -> 本机播放
# 用法: tools/notify.sh "需要人工介入的原因"
set -u
TEXT="${1:-需要人工介入}"
OUT="$(dirname "$0")/../.notify-$(date +%s).mp3"
VENV="C:/Users/mcxiaochen/AppData/Local/hermes/installs/05d8b0e9b5299ce0/environments/a0995792d7fa4e139b14e4df265e2d22/venv/Scripts"
"$VENV/edge-tts.exe" --voice zh-CN-YunxiNeural --text "$TEXT" --write-media "$OUT" >/dev/null 2>&1
if [ ! -s "$OUT" ]; then
  echo "TTS_FAIL"
  exit 1
fi
ffplay -nodisp -autoexit -loglevel error "$OUT" >/dev/null 2>&1
RC=$?
rm -f "$OUT"
exit $RC
