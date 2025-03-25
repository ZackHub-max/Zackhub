-- Create GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create buttons for teleport, auto-farming, and auto-kill
local teleportButton = Instance.new("TextButton")
teleportButton.Parent = screenGui
teleportButton.Text = "Teleport to Island"
teleportButton.Position = UDim2.new(0, 50, 0, 50)
teleportButton.Size = UDim2.new(0, 200, 0, 50)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Parent = screenGui
autoFarmButton.Text = "Start Auto Farm"
autoFarmButton.Position = UDim2.new(0, 50, 0, 120)
autoFarmButton.Size = UDim2.new(0, 200, 0, 50)
autoFarmButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local autoKillButton = Instance.new("TextButton")
autoKillButton.Parent = screenGui
autoKillButton.Text = "Start Auto Kill"
autoKillButton.Position = UDim2.new(0, 50, 0, 190)
autoKillButton.Size = UDim2.new(0, 200, 0, 50)
autoKillButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)

-- Define teleport function
function teleportToIsland(islandName)
    local island = game.Workspace:FindFirstChild(islandName)
    if island then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = island.CFrame
    end
end

-- Define Auto Farm function
function autoFarm()
    while true do
        -- Target and attack NPCs (modify as needed)
        local targetNPC = game.Workspace:FindFirstChild("NPCName")
        if targetNPC then
            local player = game.Players.LocalPlayer
            player.Character:FindFirstChild("Humanoid").Health = 0  -- For instant kill
        end
        wait(1)  -- Adjust timing for auto farm speed
    end
end

-- Auto Attack function (Instant kill NPCs)
function autoAttack()
    while true do
        -- Find and attack all NPCs in the game
        for _, npc in pairs(game.Workspace:GetChildren()) do
            if npc:FindFirstChild("NPC") then  -- Add the specific NPC tag name here
                -- Instant kill NPCs
                npc.Humanoid.Health = 0  -- Instant kill (modify as needed)
            end
        end
        wait(0.5)  -- Adjust delay to control speed
    end
end

-- Auto Kill function
function autoKill()
    while true do
        -- Instant kill all NPCs in the game
        for _, npc in pairs(game.Workspace:GetChildren()) do
            if npc:FindFirstChild("Humanoid") then
                npc.Humanoid.Health = 0  -- Instant kill NPC
            end
        end
        wait(0.5)  -- Adjust speed of auto kill
    end
end

-- Example call to teleport to a specific island
teleportButton.MouseButton1Click:Connect(function()
    teleportToIsland("IslandName")  -- Replace with your island name
end)

-- Start Auto Farm Button
autoFarmButton.MouseButton1Click:Connect(function()
    autoFarm()
end)

-- Start Auto Kill Button
autoKillButton.MouseButton1Click:Connect(function()
    autoKill()
end)
