#!/bin/bash

SEEDS="./seeds.txt"

VM="192.168.56.101"
STARTVM="VBoxHeadless --startvm ic "

RBNAME="/root/edosyst/bin"
RUSERNAME="root"

SSHPASS="d8fef51d"

N="15"
W="1000"
S="104857600"
TC="10"
TS="50"

CMD1="cd $RBNAME &&"
CMD3="shutdown -h now"

export DISPLAY=dummydisplay:0
rmpass() {
    rm "$TMPSSHPASS"
}
trap 'rmpass' SIGHUP SIGINT SIGQUIT SIGABRT SIGKILL SIGALRM SIGTERM

for SEED in $(cat $SEEDS)
do
	#start vm
	echo "." && $STARTVM & > /dev/null

	#wait vm start
	while true
	do
		sleep 1
		ping -q -c2 $VM > /dev/null
		if [ $? -eq 0 ]
		then
			break
		else
			continue
		fi
	done

	TMPSSHPASS=$(mktemp)
	chmod 700 "$TMPSSHPASS"
	echo "#!/bin/bash\necho $SSHPASS" > $TMPSSHPASS
	export SSH_ASKPASS=$TMPSSHPASS

	CMD2="java -jar MemoryAnalizer.jar $N $W $S $TC $TS $SEED file-$SEED.csv &&"
	#CMD2="touch file-$SEED.csv &&"
	FULLCMD="$CMD1 $CMD2 $CMD3"

	#wait vm: sshd up
	sleep 2

	#ssh execute remote command
	setsid ssh -o StrictHostKeyChecking=no -t $RUSERNAME@$VM "$FULLCMD"
	rmpass

	#wait vm stop
	while true
	do
		sleep 1
		ping -q -c2 $VM > /dev/null
		if [ $? -eq 0 ]
		then
			continue
		else
			break
		fi
	done
done
