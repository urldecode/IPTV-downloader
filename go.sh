#下载ts文件并合并成mp4文件脚本

#!/bin/bash
mkdir down
mkdir output

printf "URL地址为wireshark捕获到的ts文件的地址，比如http://xxxx.xxx/123(0-xxx).ts,则输入http://xxx.xxx/123\n"

read -p "输入URL：" URL
read -p "预估文件数：" Num

#对比文件分别为404，405
wget -q -O 405 ${URL}$Num.ts
wget -q -O 404 ${URL}$Num.ts


#文件对比，
while diff 405 404 > "/dev/null";do
	wget -q -O 405 ${URL}$Num.ts;
	let Num=Num-1
done;

let Num=Num+1
echo "请稍候，正在计算文件数量";
echo "文件尾数为：$Num";

#把文件地址循环输入download.txt文件
for ((i=0;i<=Num;i++));do
	echo ${URL}$i.ts >> download.txt ;
done;

echo "请稍候，正在下载文件"
#按次序下载文件
wget -q -P down -i download.txt

#获取文件列表，并合并文件
ls -rt1 "down/" > list.txt
sed "s/^/file 'down\//" list.txt | sed "s/$/'/" > filelist.txt
read -p "一切都已完成请输入保存的文件名：" FileName
ffmpeg -f concat -i filelist.txt -c copy output/$FileName.mp4

rm down/*
rm *.txt
rm 404
rm 405

exit;
