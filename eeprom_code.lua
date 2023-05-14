local component = require("component")
local computer = require("computer")
local fs = require("filesystem")
 
-- Функция для загрузки и выполнения файла
local function runFile(filename)
  local handle = io.open(filename, "r")
  if handle then
    local contents = handle:read("*a")
    handle:close()
    load(contents)()
  else
    print("Ошибка: Файл не найден!")
  end
end
 
-- Функция для вывода текста на экран
local function printCentered(text, y)
  local width, height = component.gpu.getResolution()
  local x = (width - string.len(text)) / 2
  component.gpu.set(x, y, text)
end
 
-- Инициализация
component.gpu.setResolution(80, 25)
component.gpu.fill(1, 1, 80, 25, " ")
 
-- Вывод надписи "fastboot"
printCentered("fastboot", 10)
 
-- Вывод надписи "by matveymayner"
printCentered("by matveymayner", 20)
wait(4) 

runFile("OS.lua")
runFile("HIPOSAV.lua")
runFile("init.lua")
 
-- Очистка экрана после выполнения файлов
component.gpu.fill(1, 1, 80, 25, " ")
