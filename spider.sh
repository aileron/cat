#!/bin/sh
bundle exec rails runner spider/daemon.rb > spider/daemon.log 2>&1 &
