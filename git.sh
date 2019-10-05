#规则循环
cd /root/script/git/github_dis

for line in `cat $var`
do
echo "\"$line\"" > keyword.txt
python github.py
grep -o -P "(?<=http).*" github.txt >> $output/github.txt
sed "s,s://,https://,g" $output/github.txt >> $output/github1.txt ; mv $output/github1.txt $output/github.txt
> github.txt
done

#Eyeiwtness
cd /root/script/4_getjs/EyeWitness
python EyeWitness.py -f $output/github.txt --threads 1 --jitter 3 --web --no-prompt -d $output/git_Github

cd /root/script/git/github_dis
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

done

rm 11.txt









ls
