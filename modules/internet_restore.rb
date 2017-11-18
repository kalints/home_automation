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

# The next code is developed for TL-WR740N, not tested on other models.
# It will probably not work but the idea should be the same.

browser = Watir::Browser.new :chrome
browser.goto("http://192.168.0.1")

logger.info("Internet Restore --> Router #{browser.title} detected!")

browser.input(id: "userName").text_field(id: "userName").set "#{ROUTER_U}" # input username
browser.input(id: "pcPassword").text_field(id: "pcPassword").set "#{ROUTER_P}" # input username
browser.label(id: "loginBtn").click # click the login button

# Unfortunately this won't work:
# dyn_string = browser.url.match(/192.168.0.1\/(.*)\/userRpm\/Index.htm/)[1]  # match the URL dynamic string
# browser.goto("http://192.168.0.1/#{dyn_string}/userRpm/DateTimeCfgRpm.htm")
# browser.goto("http://192.168.0.1/#{dyn_string}/userRpm/SysRebootRpm.htm")
# I'll have to match and click or I'll get this nasty message: "You have no authority to access this router!"

browser.frameset.frame(name: "bottomLeftFrame").body.a(id: "a48").click # Click on "System Tools"
browser.frameset.frame(name: "bottomLeftFrame").body.a(id: "a54").click # Click on "System Tools -> Reboot"
browser.frameset.frame(name: "mainFrame").body.input(name: "Reboot").click # Click the Reboot button
browser.alert.ok # hit OK to reboot the router !

binding.pry