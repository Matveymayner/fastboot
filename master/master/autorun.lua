local success, reason = pcall(loadfile("eeprom_code.lua")); if not success then print("Ошибка: " .. tostring(reason)) end
