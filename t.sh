#!/bin/bash
echo "hello world!"
for i in $(ls); do
    echo $i
    if [ $i = "t.sh" ]
    then
        a="tmp"
        echo "file exists!($a)"
    else
        echo "not exists!"
    fi
done
############
for RPM in  "a" "b" "c"
do
    echo $RPM
done
####################################
myUrl="http://www.w3cschool.cc"
echo $myUrl
unset myUrl
echo $myUrl
#readonly myUrl
#myUrl="http://www.runoob.com"

your_name='qinjx'
str="Hello, I know your are \"$your_name\"! \n"
echo $str
#拼接字符串
your_name="qinjx"
greeting="hello, $your_name !"
greeting_1="hello, ${your_name} !"
echo $greeting $greeting_1
#获取字符串长度
string="abcd"
echo ${#string} #输出 4

#查找子字符串
#查找字符 "i 或 s" 的位置：
string="runoob is a great company"
echo `expr index "$string" is`  # 输出 8
echo $(expr index "$string" is)  # 输出 8

#数组
array_name=(value0 value1 value2 valu3)
echo ${array_name[2]}
# 取得数组元素的个数
len1=${#array_name[@]}
# 或者
len2=${#array_name[*]}
# 取得数组单个元素的长度
lenn=${#array_name[3]}
echo $len1,$len2,$lenn
echo $?,$$,$*,$@,
echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i #一个字符
done
for i in $*; do
    echo $i
done

echo "-- \$@ 演示 ---"
for i in $@; do
    echo $i
done
for i in "$@"; do
    echo $i
done
echo \"It is a test\"

#read 命令从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量
#read name b
#echo "$name $b It is a test"
echo "It it a test"
echo -n "OK1   "
echo -e "OK! \n" # -e 开启转义
echo -e "abc \c" # -e 开启转义 \c 不换行
echo "def ##" 
echo `date`
echo $(date)

printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876 
printf "%s\n" abc def
printf "%s %s %s\t" a b c d e f g h i j;echo -e "\n\n";
printf "%s %s %s\n" a b c d e f g h i j
printf "%s %s %s\f" a b c d e f g h i j
echo "";
### 计数效果
#for i in {1..100000}; do
#    printf "%s\b\b\b\b\b\b\b" $i
#done
a=3
b=10
c=$[a+b]
d=$[b*a]
echo $a,$b,$c,$d

### shell 精度浮点数计算 借助bc
#res=$(printf "%.5f" `echo "scale=5;1/3"|bc`) ###精度为小数点后5位
#echo "scale=5;1/3"|bc
#echo "scale=5;10/3"|bc

if [ $(ps -ef | grep -c "bin") -gt 1 ]; then echo "true"; fi
a=10
b=10
if [ $a == $b ]
#if [ $a -eq $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi
#### 循环
int=1
while(( $int<=5 ))
do
    if [ $int -eq 3 ]; then
        let int++
        continue
        echo "continue 3"
    elif [ $int -eq 4 ]; then
        echo $int
        let int++
        break
    else
        echo $int
        let int++
    fi

done

#echo '按下 <CTRL-D> 退出'
#echo -n '输入你最喜欢的电影名: '
#while read FILM
#do
#    echo "是的！$FILM 是一部好电影"
#done

### 无限循环
#while true
#do
#    date
#done

funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73 
ls &
#注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
echo $$,$! 
# $$	脚本运行的当前进程ID号
# $!	后台运行的最后一个进程的ID号

#for i in $(ls); do
#    echo $i
#    wc -l < $i >>wc.out
#done

wc -l << EOF
    欢迎来到
    菜鸟教程
    www.runoob.com
EOF
a= << EOF
    欢迎来到
    菜鸟教程
    www.runoob.com
EOF
echo $a

# command > file 2>&1
. ./t2.sh
echo $url
#for i in $(ping $url); do
#    echo $i
#done

function fSum()
{
    echo $1,$2;
    return $(($1+$2));
}
echo fSum 1 2;
echo $(fSum 1 2);
total=$(fSum 7 8); ### 函数调用
echo $? ###获得函数返回值
echo $total,$?;###获得上一个命令返回值
echo $?  ###获得上一个命令返回值
