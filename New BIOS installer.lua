os.execute("wget -q https://raw.githubusercontent.com/Matveymayner/fastboot/main/eeprom_code.lua")
flash -q eeprom_code.lua FastBoot BIOS
