#!/bin/sh
bundle exec unicorn_rails -c config/unicorn.rb -E production -D
