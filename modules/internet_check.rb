#!/usr/bin/env ruby

# Libraries

require 'pry'
require 'resolv'
require 'logger'

# Logger settings

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

def check_resolv
	begin
		Resolv.getaddress('google.com')
		return true
	rescue
		return false
	end
end

check_resolv ? logger.info("Internet --> resolving OK!") : logger.fatal("Internet --> unable to resolve URLs - check DNS!")

# binding.pry