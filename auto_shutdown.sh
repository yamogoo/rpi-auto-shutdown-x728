#! /bin/bash
PATH=/bin/sbin:/usr/bin/
### BEGIN INIT INFO
# Provides: auto_shutdown.sh
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote-fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
### END INIT INFO

NAME="auto_shutdown"

case "$1" in
	start)
		echo "Start $NAME.py"
		/usr/local/bin/$NAME.py &
	;;
	stop)
		echo "Stop $NAME.py"
		pkill -f /usr/local/bin/$NAME.py &
	;;
	*)
		exit 1
	;;
esac

exit 0