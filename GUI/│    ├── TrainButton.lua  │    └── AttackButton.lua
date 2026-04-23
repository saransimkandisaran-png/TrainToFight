local RS = game:GetService("ReplicatedStorage")
local TrainEvent = RS:WaitForChild("TrainEvent")

script.Parent.MouseButton1Click:Connect(function()
    TrainEvent:FireServer()
end)
