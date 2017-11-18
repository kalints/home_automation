# Home Automation

Small Ruby based project to automate stuff.

It's based on main.rb which calls modules. The idea is to have small files with single purpose. I call them modules.

* modules/wifi_check.rb - checks my WiFi connection to see if I'm connected to the correct network
* modules/internet_check.rb - checks Internet availability

__Example output:__

```
I, [2017-11-18 14:55:36#61341]  INFO -- : WiFi --> MacOS detected
I, [2017-11-18 14:55:36#61341]  INFO -- : WiFi --> Running wifi_check...
W, [2017-11-18 14:55:36#61341]  WARN -- : WiFi --> WiFi connected to wrong network!
I, [2017-11-18 14:55:39#61341]  INFO -- : WiFi --> WiFi reconnected to correct network!
I, [2017-11-18 14:55:40#61341]  INFO -- : Internet --> Running Internet checks...
I, [2017-11-18 14:55:40#61341]  INFO -- : Internet --> Resolving OK
I, [2017-11-18 14:55:40#61341]  INFO -- : Internet --> Ping OK
```