#!/sbin/sh

overlay_path="/system/vendor/overlay"
backup_path="/tmp/backup"
overlay_backup_path="$backup_path/overlay"
backup_file_list="/tmp/backup/overlay_file_list.txt"
mkdir -p $backup_path
mkdir -p $overlay_backup_path

backup_overlays() {
	ls "$overlay_path" >> "$backup_file_list"
	while read -r line
	do
		cp "$overlay_path/$line" "$overlay_backup_path/$line"
		ui_print "Backing up $overlay_path/$line"
	done < "$backup_file_list"
}

restore_overlays() {
	mkdir -p "$overlay_path"
	while read -r line
	do
		cp "$overlay_backup_path/$line" "$overlay_path/$line"
	done < "$backup_file_list"
}

case "$1" in
    backup)
        backup_overlays
        ;;
    restore)
        restore_overlays
        ;;
    pre-backup)
        ;;
    post-backup)
        ;;
    pre-restore)
        ;;
    post-restore)
        ;;
esac
exit 0
