#!/usr/bin/env ruby

# Libraries

require 'pry'
require 'resolv'
require 'logger'
require 'net/ping'

# Logger settings

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

logger.info("Internet --> Running Internet checks...")

def check_resolv
  begin
    resolved = Resolv.getaddress('google.com')
    resolved
  rescue
    return false
  end
  resolved
end

def up?(host)
    check = Net::Ping::External.new(host)
    check.ping?
end

if resolved_host = check_resolv
  logger.info("Internet --> Resolving OK")
else
  logger.fatal("Internet --> unable to resolve URLs - check DNS!")
end

if resolved_host
  up?(resolved_host) && logger.info("Internet --> Ping OK")
else
  logger.fatal("Internet --> cannot ping!")
  load "modules/internet_restore.rb"
end