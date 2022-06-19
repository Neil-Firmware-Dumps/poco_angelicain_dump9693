#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:096c92ee26b69333e7c90f899b3f39db529d7ad6; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:6eff812ee522a88b06333dbf91c789cde42103a3 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:096c92ee26b69333e7c90f899b3f39db529d7ad6 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
