local URLs = {
EFI = "https://raw.githubusercontent.com/alexexe82/HIPOSAV/master/master/bios.lua",
local web = require("web")
component.eeprom.set(web.request(URLs.EFI))
component.eeprom.setLabel("FastBoot-BIOS")
