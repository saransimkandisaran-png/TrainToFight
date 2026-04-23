local RS = game:GetService("ReplicatedStorage")

local TrainEvent = RS:WaitForChild("TrainEvent")

local data = {}

game.Players.PlayerAdded:Connect(function(player)
    data[player] = {
        Strength = 0,
        Level = 1,
        Style = "Normal",
        Speed = 16
    }
end)

game.Players.PlayerRemoving:Connect(function(player)
    data[player] = nil
end)

-- TRAIN SYSTEM
TrainEvent.OnServerEvent:Connect(function(player)
    local d = data[player]
    if not d then return end

    -- FAST TRAIN
    d.Strength += 20

    -- LEVEL UP
    if d.Strength >= d.Level * 50 then
        d.Level += 1
        print(player.Name.." LEVEL UP! "..d.Level)
    end

    -- STYLE UNLOCK
    if d.Strength >= 50 and d.Style == "Normal" then
        d.Style = "Fast"
        d.Speed = 24
        print("Fast Style Unlocked")
    end

    if d.Strength >= 150 and d.Style == "Fast" then
        d.Style = "Ultra"
        d.Speed = 32
        print("Ultra Style Unlocked")
    end

    -- APPLY SPEED
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = d.Speed
    end
end)
