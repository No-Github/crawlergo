# 修改版
# 存到 /root/.cache/rod/browser/chromium-*
#!/bin/bash
LASTCHANGE_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2FLAST_CHANGE?alt=media"
REVISION=$(curl -s -S $LASTCHANGE_URL)

echo "latest revision is $REVISION"

ZIP_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F$REVISION%2Fchrome-linux.zip?alt=media"
ZIP_FILE="${REVISION}chrome-linux.zip"

echo "fetching $ZIP_URL"

mkdir -p /root/.cache/rod/browser/
cd /root/.cache/rod/browser/
curl -o /root/.cache/rod/browser/$ZIP_FILE $ZIP_URL
echo "unzipping.."
cd /root/.cache/rod/browser/
unzip $ZIP_FILE
mv chrome-linux chromium-${REVISION}