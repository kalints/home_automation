# Home Automation

Small Ruby based project to automate stuff.

It's based on main.rb which calls modules. The idea is to have small files with single purpose. I call them modules.

* modules/wifi_check.rb - checks my WiFi connection to see if I'm connected to the correct network
* modules/internet_check.rb - checks Internet availability

__Example output:__

```
I, [2017-11-18 14:27:46#59727]  INFO -- : WiFi --> MacOS detected
I, [2017-11-18 14:27:46#59727]  INFO -- : WiFi --> Running wifi_check...
W, [2017-11-18 14:27:46#59727]  WARN -- : WiFi --> WiFi connected to wrong network!
I, [2017-11-18 14:27:52#59727]  INFO -- : WiFi --> WiFi reconnected to correct network!
I, [2017-11-18 14:27:52#59727]  INFO -- : Internet --> resolving OK!
```