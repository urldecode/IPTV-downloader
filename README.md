# IPTV-downloader

电信IPTV VIP电影下载，不限于电信IPTV

用法，
./go.sh

比如捕获到这样一些ts
http://xxxxx.xxx/12340.ts
http://xxxxx.xxx/12341.ts
http://xxxxx.xxx/1234(xxx).ts

后面的数字递增，则只需要前面的http://xxxxx.xxx/1234 即可
或者会首先捕获到一个m3u8文件，下载这个文件，里面有文件名等

预估数量为ts文件的数量
保存的文件默认为mp4文件，保存文件名不需要填写后缀
