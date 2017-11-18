#!/usr/bin/env ruby

# Libraries

require 'pry'
require 'logger'
require 'watir'

# Credentials

ROUTER_U = ENV['router_user']
ROUTER_P = ENV['router_pass']

# Logger settings

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
logger.datetime_format = '%Y-%m-%d %H:%M:%S'

logger.info("Internet Restore --> Engaged!")

browser = Watir::Browser.new :chrome
browser.goto("http://192.168.0.1")

logger.info("Internet Restore --> Router #{browser.title} detected!")

browser.input(id: "userName").text_field(id: "userName").set "#{ROUTER_U}"
browser.input(id: "pcPassword").text_field(id: "pcPassword").set "#{ROUTER_P}"
browser.label(id: "loginBtn").click

#TODO: now that it's logged in we should navigate to the proper tab and reboot the router

binding.pry