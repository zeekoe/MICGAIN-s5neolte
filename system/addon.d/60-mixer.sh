#!/sbin/sh
# 
# /system/addon.d/60-mixer.sh
#
# Correct file has this md5sum:
# s5neolte:/system/vendor/etc $ md5sum mixer_paths_0.xml
# 712d34aa4c80d16b80c355899b8c9ceb  mixer_paths_0.xml
. /tmp/backuptool.functions

list_files() {
cat <<EOF
vendor/etc/mixer_paths_0.xml
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file "$S"/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file "$S"/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac


