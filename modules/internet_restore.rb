#!/usr/bin/env ruby

# Libraries

require 'pry'
require 'logger'

# Logger settings

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

logger.info("Internet Restore --> Engaged!")

