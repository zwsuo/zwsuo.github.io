#!/bin/bash

### zwsuo ###

featureBranch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')


#检查代码是否有冲突
checkConfict(){

	result=$(git status |grep "both modified")
	echo ""
	echo $result
	echo ""
	#sleep 3
	if [ -n "$result" ];
	then
		echo ""
		echo -e "\033[31m有冲突！\033[0m\n"
		exit
	fi
}

checkConfict

git add \.
git commit -a -m 'auto commit by shell'
git pull origin $featureBranch

checkConfict

git push origin $featureBranch
echo "[\033[32mOK\033[0m] $featureBranch 分支push完成"
