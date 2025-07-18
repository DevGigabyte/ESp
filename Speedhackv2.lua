

local player = game.Players.LocalPlayer
local SPEED = 32 -- скорость, которую вы хотите установить (можно изменить)

local function setSpeed()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = SPEED
    end
end

-- Устанавливаем скорость при появлении персонажа
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    setSpeed()
end)

-- На всякий случай обновляем скорость каждую секунду
while true do
    setSpeed()
    wait(1)
end
