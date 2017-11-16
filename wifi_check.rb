#!/usr/bin/env ruby

# Libraries

require 'logger'
require 'pry'

# Logger settings

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

os_check = %x{uname}.strip
if os_check == "Darwin"
  logger.info("MacOS detected")
else
  logger.fatal("Sorry, I cannot run on your system.")
  exit(0)
end

logger.info("Running wifi_check...")	

wifi_connected = %x{/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I}

binding.pry