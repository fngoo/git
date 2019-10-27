#规则循环
cd /root/script/git/github_dis
> github.txt
for line in `cat $var`
do
echo "\"$line\"" > keyword.txt
python github.py
echo $var >> $output/github.txt
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

echo "trufflehog ${line} --regex --entropy=False >> $output/git_hog.txt" > 1.sh ; timeout 666 bash 1.sh ; rm 1.sh
trufflehog --cleanup ${line}
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


grep -oPn "123123123123" $output/0_git_trufflehog_usedate.txt | grep -oP ".*?(?=\:)" > a.txt ; sort -u a.txt -o a.txt

if [ -s a.txt ]
then
while [ -s a.txt ]
do
> a.txt ; grep -oPn "123123123123" $output/0_git_trufflehog_usedate.txt | grep -oP ".*?(?=\:)" > a.txt ; sort -u a.txt -o a.txt

delete=`head -1 a.txt`
num=$((delete-8))
delete=$((delete+1))
sed -i "${num},${delete}d" $output/0_git_trufflehog_usedate.txt ; cat $output/0_git_trufflehog_usedate.txt >> $output/git_hog1.txt ; mv $output/git_hog1.txt $output/0_git_trufflehog_usedate.txt ; wc -l $output/0_git_trufflehog_usedate.txt
done
fi

rm a.txt
rm 11.txt




ls
date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt ; echo 'git' >> /root/date.txt
rm $output/git_hog.txt

