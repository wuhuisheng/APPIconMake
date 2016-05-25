#!/bin/sh

curPath=$(cd `dirname $0`; pwd)
echo  $curPath
iconPaths=`ls $curPath`
# echo  $curPath
for file in $iconPaths; do
   if [ "${file##*.}" = "png" ]; then
        dirname="$curPath/icon"
        mkdir $dirname

        name_array=("Icon@2x.png" "Icon.png" "Icon-60@2x.png" "Icon-60@3x.png" "Icon-76.png" "Icon-76@2x.png" "Icon-Small-40.png" "Icon-Small-40@2x.png" "Icon-Small-40@3x.png" "Icon-Small.png" "Icon-Small@2x.png" "Icon-Small@3x.png")
        size_array=("114" "57" "120" "180" "76" "152" "40" "80" "120" "29" "58" "87")

        for ((i=0;i<${#name_array[@]}; ++i));
        do
        m_dir=$dirname/${name_array[i]}
        echo  $m_dir
        cp "$curPath/$file" "$m_dir"
        sips -Z ${size_array[i]} $m_dir
        done
    fi
done


