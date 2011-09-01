
APP_ROOT = '/home/aileron/cat'

listen "#{APP_ROOT}/tmp/sockets/unicorn.sock", :backlog => 64

timeout 30
preload_app  true
worker_processes 5
pid "#{APP_ROOT}/tmp/pids/unicorn.pid"
stderr_path "#{APP_ROOT}/log/unicorn.log"
stdout_path "#{APP_ROOT}/log/unicorn.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
