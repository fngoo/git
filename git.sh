#规则循环
cd /root/script/git/github_dis
> github.txt
for line in `cat $var`
do
echo "\"$line\"" > keyword.txt
python github.py
grep -o -P "(?<=http).*" github.txt >> $output/github.txt
> github.txt
done
sed "s,s://,https://,g" $output/github.txt >> $output/github1.txt ; mv $output/github1.txt $output/github.txt



cd /root/script/git/github_dis
> 11.txt
for line in `cat $output/github.txt`
do
line=`echo ${line} | grep -o -P ".*(?=blob)"`
echo $line >> 11.txt
done
sort -u 11.txt -o 11.txt


for line in `cat 11.txt`
do

echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo "${line}" >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt

trufflehog ${line} --regex --entropy=False >> $output/git_hog.txt

echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt
echo ' ' >> $output/git_hog.txt

num=`cat $output/git_hog.txt | wc -l`
if [ $num -eq 14 ]
then
rm $output/git_hog.txt
else
sed "s,localhost,123123123123,g" $output/git_hog.txt >> $output/git_hog1.txt ; mv $output/git_hog1.txt $output/git_hog.txt
sed "s,example,123123123123,g" $output/git_hog.txt >> $output/git_hog1.txt ; mv $output/git_hog1.txt $output/git_hog.txt
sed "s,user:password@,123123123123,g" $output/git_hog.txt >> $output/git_hog1.txt ; mv $output/git_hog1.txt $output/git_hog.txt
sed "s,user:pwd@,123123123123,g" $output/git_hog.txt >> $output/git_hog1.txt ; mv $output/git_hog1.txt $output/git_hog.txt
num=`cat $output/git_hog.txt | wc -l`
if [ "$num" != "6" ]
then
cat $output/git_hog.txt >> $output/0_git_trufflehog_usedate.txt
fi
rm $output/git_hog.txt
fi
done


awk=`grep 123123123123 -n $output/0_git_trufflehog_usedate.txt | awk -F: '{print $1}'`
echo $awk >> a.txt

if [ -s a.txt ]
then
for delete in $awk
do
num=$((delete-8))
sed -i "${num},${delete}d" $output/0_git_trufflehog_usedate.txt ; cat $output/0_git_trufflehog_usedate.txt >> $output/git_hog1.txt ; mv $output/git_hog1.txt $output/0_git_trufflehog_usedate.txt
done
fi
rm a.txt


rm 11.txt
rm $output/git_hog.txt
rm $output/git_hog.txt

rm $output/git_hog.txt

rm $output/git_hog.txt



ls
date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt ; echo 'git' >> /root/date.txt
rm $output/git_hog.txt

