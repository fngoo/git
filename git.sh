#GSIL

#创建目录

i=1

for line in `cat $var`
do

mkdir dir_$i
dot=`echo $line | grep -o -P ".*(?=\.)"`

echo '#!/bin/bash' >> dir_$i/${i}.sh
echo "cp -r /root/script/git/GSIL/* dir_$i" >> dir_$i/${i}.sh
echo "cd dir_$i" >> dir_$i/${i}.sh
echo "sed -e \"s/dot/${dot}/g\" rules.gsil > 1.txt ; mv 1.txt rules.gsil" >> dir_$i/${i}.sh
echo "sed -e \"s/test/${line}/g\" rules.gsil > 1.txt ; mv 1.txt rules.gsil" >> dir_$i/${i}.sh
echo "python3 gsil.py ${dot}" >> dir_$i/${i}.sh
echo "cd ../ ; rm -r dir_$i" >> dir_$i/${i}.sh
echo "bash dir_$i/${i}.sh" >> exe.sh
i=$((i+1))

done
cat exe.sh | parallel --jobs 1 --delay 60
rm exe.sh
rm dir_* -r

python3 /root/script/git/GSIL/gsil.py --report
ls
