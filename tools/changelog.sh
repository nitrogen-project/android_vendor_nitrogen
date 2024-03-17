#!/bin/sh

export Changelog=Changelog.txt

DEVICE=$(echo $TARGET_PRODUCT | cut -d "_" -f2)

if [ -f $Changelog ];
then
    rm -f $Changelog
fi

touch $Changelog

for i in $(seq 7);
do
export After_Date=`/usr/bin/date --date="$i days ago" +%F`
k=$(expr $i - 1)
export Until_Date=`/usr/bin/date --date="$k days ago" +%F`
echo "====================" >> $Changelog;
echo "     $Until_Date    " >> $Changelog;
echo "====================" >> $Changelog;
while read path;
do
    # https://www.cyberciti.biz/faq/unix-linux-bash-script-check-if-variable-is-empty/
    Git_log=`git --git-dir ./${path}/.git log --after=$After_Date --until=$Until_Date --pretty=tformat:"%h  %s  [%an]" --abbrev-commit --abbrev=7`
    if [ ! -z "${Git_log}" ]; then
        printf "\n* ${path}\n${Git_log}\n" >> $Changelog;
    fi
done < ./.repo/project.list;

echo "" >> $Changelog;
done

sed -i 's/[/]$//' $Changelog

if [ -e $OUT_DIR/target/product/$DEVICE/$Changelog ]
then
    rm $OUT_DIR/out/target/product/$DEVICE/$Changelog
fi

if [ -e $OUT_DIR/target/product/$DEVICE/system/etc/$Changelog ]
then
    rm $OUT_DIR/target/product/$DEVICE/system/etc/$Changelog
fi

cp $Changelog $OUT_DIR/target/product/$DEVICE/
rm $Changelog
