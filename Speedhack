

local player = game.Players.LocalPlayer
local NORMAL_SPEED = 16      -- стандартная скорость Roblox
local BRAINROT_SPEED = 24    -- средняя скорость с брейнротом (можно изменить)

local function updateSpeed()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        if player:FindFirstChild("HasBrainrot") and player.HasBrainrot.Value == true then
            player.Character.Humanoid.WalkSpeed = BRAINROT_SPEED
        else
            player.Character.Humanoid.WalkSpeed = NORMAL_SPEED
        end
    end
end

-- Обновляем скорость при появлении персонажа
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    updateSpeed()
end)

-- Следим за изменением значения HasBrainrot
local hasBrainrot = player:FindFirstChild("HasBrainrot")
if hasBrainrot then
    hasBrainrot:GetPropertyChangedSignal("Value"):Connect(updateSpeed)
end
ц
-- На всякий случай обновляем скорость каждую секунду
while true do
    updateSpeed()
    wait(1)
