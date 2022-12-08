if [ "$1" ] ; then
  num="$1"
else
  num=1
fi

TW_PORT=490$num \
iex --sname tw_playground_$num -S mix phx.server
