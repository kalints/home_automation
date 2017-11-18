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
  logger.info("WiFi --> MacOS detected")
else
  logger.fatal("WiFi --> Sorry, I cannot run on your system.")
  exit(0)
end

logger.info("WiFi --> Running wifi_check...")  

wifi_connected = %x{/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I}.match(/\ SSID: (.*)/)[1]

if wifi_connected == ENV['wifi_net']
  logger.info("WiFi --> WiFi OK")
else
  logger.warn("WiFi --> WiFi connected to wrong network!")
  if ENV['wifi_pass'] == nil
    logger.fatal("WiFi --> Cannot connect to the correct network. Set your pass to ENV['wifi_pass']!")
  else
    %x{/usr/sbin/networksetup -setairportnetwork en0 #{ENV['wifi_net']} #{ENV['wifi_pass']}} || logger.fatal("WiFi: Cannot connect to correct WiFi network!")
    wifi_connected = %x{/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I}.match(/\ SSID: (.*)/)[1]
    if wifi_connected == ENV['wifi_net']
      logger.info("WiFi --> WiFi reconnected to correct network!")
    end
  end
end
