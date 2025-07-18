-- ESP-скрипт для Roblox: показывает ник игрока, расстояние до открытия базы и самого игрока (не распространяется на себя)

local player = game.Players.LocalPlayer
local basePositionValue = player:FindFirstChild("BasePosition")

-- Функция для создания ESP над головой другого игрока
local function createESP(targetPlayer)
    if targetPlayer == player then return end -- не показывать ESP на себе
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        if targetPlayer.Character.Head:FindFirstChild("ESP_GUI") then return end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_GUI"
        billboard.Adornee = targetPlayer.Character.Head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextStrokeTransparency = 0.5
        textLabel.TextScaled = true
        textLabel.Parent = billboard

        billboard.Parent = targetPlayer.Character.Head

        -- Обновление текста
        game:GetService("RunService").RenderStepped:Connect(function()
            local distance = 0
            if basePositionValue and basePositionValue:IsA("Vector3Value") then
                local basePos = basePositionValue.Value
                if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    distance = (targetPlayer.Character.HumanoidRootPart.Position - basePos).Magnitude
                end
            end
            textLabel.Text = string.format("Ник: %s\nДо базы: %.1f", targetPlayer.Name, distance)
        end)
    end
end

-- Создаём ESP для всех других игроков
for _, plr in pairs(game.Players:GetPlayers()) do
    createESP(plr)
end

-- Следим за появлением новых игроков
game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        createESP(plr)
    end)
end)
