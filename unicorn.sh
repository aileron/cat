#!/bin/sh

case $1 in
stop)
    kill -QUIT $(cat tmp/pids/unicorn.pid);;
reload)
    kill -HUP $(cat tmp/pids/unicorn.pid);;
start)
    bundle exec unicorn_rails -c config/unicorn.rb -E production -D;;
*) echo "unicorn [start|stop|restart]"
esac

