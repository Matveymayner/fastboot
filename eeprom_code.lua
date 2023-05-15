local component = require("component")
local computer = require("computer")
local event = require("event")

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

-- Функция для вывода синего текста на экран
local function printCenteredBlue(text, y)
  local width, height = component.gpu.getResolution()
  local x = (width - string.len(text)) / 2
  component.gpu.setForeground(0x0000FF)  -- Синий цвет текста
  component.gpu.set(x, y, text)
  component.gpu.setForeground(0xFFFFFF)  -- Восстановление белого цвета текста
end

-- Инициализация
component.gpu.setResolution(80, 25)
component.gpu.fill(1, 1, 80, 25, " ")

-- Вывод синей надписи "fastboot"
printCenteredBlue("fastboot", 10)

-- Вывод надписи "by matveymayner"
printCentered("by matveymayner", 20)

-- Ожидание 3 секунд
local startTime = computer.uptime()
while computer.uptime() - startTime < 5 do
  -- Ждем 0.1 секунду
  local _, _, _, _, _, currentEvent = event.pull(0.1)
  if currentEvent == "interrupted" then
    return
  end
end

-- Запуск файлов
runFile("OS.lua")
runFile("HIPOSAV.lua")
runFile("init.lua")
runFile("mayneros_v4.lua")

-- Очистка экрана после выполнения файлов
component.gpu.fill(1, 1, 80, 25, " ")
