


pid=`ps aux | grep "ssh -f -N" | grep -v grep | awk '{print $2}' | sed -n 1p`


stopssh () {
	kill $pid
}
startssh () {
	ssh -f -N -T -R25552:localhost:22 SERVER_URL -p SERVER_PORT
}




# check if pid is running
if [ ! -z "$pid" ]
then
	echo "stop"
	stopssh
else
	echo "start"
	startssh
fi
