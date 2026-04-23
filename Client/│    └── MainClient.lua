local RS = game:GetService("ReplicatedStorage")
local TrainEvent = RS:WaitForChild("TrainEvent")

local UIS = game:GetService("UserInputService")

-- Tap = Train
UIS.InputBegan:Connect(function(input, processed)
    if processed then return end

    if input.UserInputType == Enum.UserInputType.Touch 
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        TrainEvent:FireServer()
    end
end)
