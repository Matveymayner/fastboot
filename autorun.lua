local component = require("component")
local internet = require("internet")

-- Функция для загрузки файла с удаленного сервера
local function downloadFile(url, path)
  local file, reason = io.open(path, "w")
  if not file then
    io.stderr:write("Failed to open file for writing: " .. reason .. "\n")
    return false
  end

  local result, response = pcall(internet.request, url)
  if result then
    for chunk in response do
      file:write(chunk)
    end
    file:close()
    return true
  else
    io.stderr:write("Failed to download file: " .. response .. "\n")
    return false
  end
end

-- URL файла, который необходимо загрузить
local url = "https://raw.githubusercontent.com/Matveymayner/fastboot/main/bios.lua"
-- Путь, куда сохранить загруженный файл
local path = "/path/to/bios.lua"  -- Замените на нужный путь

-- Загрузка файла
if downloadFile(url, path) then
  -- Запуск загруженного файла
  local success, reason = loadfile(path)
  if success then
    success()
  else
    io.stderr:write("Failed to run file: " .. reason .. "\n")
  end
else
  io.stderr:write("Failed to download the file. Exiting...\n")
end
