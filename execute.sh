#! /bin/bash


turnStep=4
turnCount=0
turnWait=25
turnStable=5

user=USER
server=SERVER_URL
sshport=SERVER_SSH_PORT
path=SERVER_REMOTE_IMAGE_COPY_PATH

move () {
	for i in `seq 1 $1`:
	do
		./movex.out 1 $2
		sleep 1
	done
}

movefw () {
	move $1 1
}

movebk () {
	move $1 0
}

passonce () {
	turnCount=0
	for i in `seq 1 9`;
	do
		# inform user
		# take picture
		sh getPic.sh p$((i)).jpeg
		# and now push to server
#		echo "pushing P1"
		scp -P $sshport p$((i)).jpeg ${user}@${server}:${path}p1.jpeg 
		# wait time for pics
		sleep $turnWait
		# move camera
		movefw $turnStep
		sleep $turnStable
		turnCount=$((turnCount + turnStep))
		echo $turnCount
	done

	echo "returning"
	movebk $turnCount
}

# startup -> sync position to start
movebk 36


# steady state -> run loop
while true
do
	passonce
done


