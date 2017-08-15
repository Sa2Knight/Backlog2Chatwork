# coding: utf-8

@path = '/root/WebHookTest'
@path.chomp!
worker_processes 1
working_directory @path
timeout 300
preload_app true
listen 8090
pid "#{@path}/shared/tmp/unicorn.pid"
