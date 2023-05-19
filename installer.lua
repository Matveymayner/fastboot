local URLs = {
EFI = "https://raw.githubusercontent.com/Matveymayner/fastboot/main/bios%201.1",
local web = require("web")
component.eeprom.set(web.request(URLs.EFI))
component.eeprom.setLabel("FastBoot-BIOS")
