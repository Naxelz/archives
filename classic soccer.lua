-[[
    V0x Soccer Engine 2026 - Remastered
    Target: The Classic Soccer / MPS
    Optimized for performance, reliability, and security.
]]

-- 1. Services & Cleanup
local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    Workspace = game:GetService("Workspace"),
    CoreGui = game:GetService("CoreGui"),
    TweenService = game:GetService("TweenService"),
    Stats = game:GetService("Stats"),
    StarterGui = game:GetService("StarterGui")
}

local LocalPlayer = Services.Players.LocalPlayer
local Camera = Services.Workspace.CurrentCamera

-- Cleanup previous instances
if _G.V0xConnections then
    for _, conn in pairs(_G.V0xConnections) do conn:Disconnect() end
end
_G.V0xConnections = {}

if _G.V0xGui and _G.V0xGui.Parent then _G.V0xGui:Destroy() end

-- 2. Configuration & State
local Config = {
    Reach = {
        Enabled = false,
        Size = 2.0,
        Active = false,
        Visualizer = true
    },
    Leg = "Right", -- "Right" or "Left"
    Hotkey = Enum.KeyCode.RightControl
}

local UIColors = {
    Background = Color3.fromRGB(20, 20, 20),
    Accent = Color3.fromRGB(0, 140, 255),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(150, 150, 150),
    Success = Color3.fromRGB(50, 255, 50),
    Failure = Color3.fromRGB(255, 50, 50)
}

-- 3. Utilities
local function Notify(title, text, type)
    Services.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 3
    })
end

local function GetBall()
    -- Optimized ball search
    local ballNames = { "TPS", "MPS", "Ball", "SoccerBall" }
    for _, name in ipairs(ballNames) do
        local ball = Services.Workspace:FindFirstChild(name)
        if ball then return ball end
    end
    -- Fallback: Search nearby parts if specific names fail (optional, disabled for perf)
    return nil
end

-- 4. UI Library (Minimal & Modern)
local UI = {}
function UI.CreateWindow()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "V0xHub"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = Services.CoreGui
    _G.V0xGui = ScreenGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 550, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
    MainFrame.BackgroundColor3 = UIColors.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = UIColors.Accent
    UIStroke.Thickness = 1.5
    UIStroke.Transparency = 0.4
    UIStroke.Parent = MainFrame

    -- Dragging Logic
    local Dragging, DragInput, DragStart, StartPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)
    Services.UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local delta = input.Position - DragStart
            MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
        end
    end)

    -- Title Bar
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = "V0x Engine | The Classic Soccer"
    TitleLabel.Size = UDim2.new(1, -20, 0, 40)
    TitleLabel.Position = UDim2.new(0, 20, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = UIColors.Text
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = MainFrame

    -- Container for Elements
    local Container = Instance.new("ScrollingFrame")
    Container.Size = UDim2.new(1, -20, 1, -50)
    Container.Position = UDim2.new(0, 10, 0, 45)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 2
    Container.Parent = MainFrame
    
    local UIList = Instance.new("UIListLayout")
    UIList.Padding = UDim.new(0, 10)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.Parent = Container

    return Container, ScreenGui, MainFrame
end

function UI.CreateToggle(parent, text, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 40)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = text
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = UIColors.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 40, 0, 20)
    Button.Position = UDim2.new(1, -50, 0.5, -10)
    Button.BackgroundColor3 = default and UIColors.Accent or Color3.fromRGB(40, 40, 40)
    Button.Text = ""
    Button.Parent = Frame

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = Button

    local State = default
    Button.MouseButton1Click:Connect(function()
        State = not State
        Services.TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = State and UIColors.Accent or Color3.fromRGB(40, 40, 40)
        }):Play()
        callback(State)
    end)
end

function UI.CreateSlider(parent, text, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = text .. ": " .. default
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = UIColors.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local SliderBar = Instance.new("TextButton")
    SliderBar.Text = ""
    SliderBar.Size = UDim2.new(1, -20, 0, 4)
    SliderBar.Position = UDim2.new(0, 10, 0, 30)
    SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SliderBar.AutoButtonColor = false
    SliderBar.Parent = Frame

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = UIColors.Accent
    Fill.BorderSizePixel = 0
    Fill.Parent = SliderBar

    local Trigger = false
    
    local function Update(input)
        local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        local value = math.floor((min + (max - min) * pos) * 10) / 10
        Fill.Size = UDim2.new(pos, 0, 1, 0)
        Label.Text = text .. ": " .. value
        callback(value)
    end

    SliderBar.MouseButton1Down:Connect(function() Trigger = true end)
    Services.UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then Trigger = false end
    end)
    Services.UserInputService.InputChanged:Connect(function(input)
        if Trigger and (input.UserInputType == Enum.UserInputType.MouseMovement) then
            Update(input)
        end
    end)
end

function UI.CreateLabel(parent, text)
    local Label = Instance.new("TextLabel")
    Label.Text = text
    Label.Size = UDim2.new(1, -20, 0, 30)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = UIColors.TextDim
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = parent
    
    local Padding = Instance.new("UIPadding")
    Padding.PaddingLeft = UDim.new(0, 10)
    Padding.Parent = Label
end

-- 5. Main Execution
local Container, ScreenGui, MainFrame = UI.CreateWindow()

-- Header Stats
local StatsLabel = Instance.new("TextLabel")
StatsLabel.Text = "FPS: 60 | Ping: 0ms"
StatsLabel.Size = UDim2.new(1, 0, 0, 20)
StatsLabel.Position = UDim2.new(0, 0, 1, -25)
StatsLabel.BackgroundTransparency = 1
StatsLabel.TextColor3 = UIColors.TextDim
StatsLabel.Font = Enum.Font.Code
StatsLabel.TextSize = 12
StatsLabel.Parent = MainFrame

Services.RunService.Heartbeat:Connect(function()
    local ping = math.floor(Services.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local fps = math.floor(1 / Services.RunService.Heartbeat:Wait())
    StatsLabel.Text = string.format("FPS: %d | Ping: %dms", fps, ping)
end)

-- Features Setup
UI.CreateLabel(Container, "COMBAT & REACH")

UI.CreateToggle(Container, "Enable Reach (Hitbox Expansion)", false, function(val)
    Config.Reach.Enabled = val
    Notify("Reach", val and "Enabled" or "Disabled", val and "Success" or "Failure")
end)

UI.CreateSlider(Container, "Reach Size", 1, 30, 2, function(val)
    Config.Reach.Size = val
end)

UI.CreateToggle(Container, "Visualizer (Show Range)", true, function(val)
    Config.Reach.Visualizer = val
end)

UI.CreateToggle(Container, "Click Reach (Teleport)", false, function(val)
    Config.ClickReach.Enabled = val
end)

UI.CreateLabel(Container, "CHARACTER")

UI.CreateLabel(Container, "Current Leg: " .. Config.Leg .. " (Press LeftCtrl to switch)")

Services.UserInputService.InputBegan:Connect(function(input, processed)
    if not processed then
        if input.KeyCode == Enum.KeyCode.LeftControl then
            Config.Leg = Config.Leg == "Right" and "Left" or "Right"
            Notify("Leg Switched", "Active: " .. Config.Leg .. " Leg", "Success")
        elseif input.KeyCode == Config.Hotkey then
            MainFrame.Visible = not MainFrame.Visible
        end
        
        -- Click Reach Logic
        if input.UserInputType == Enum.UserInputType.MouseButton1 and Config.ClickReach.Enabled then
            local mouse = LocalPlayer:GetMouse()
            local target = mouse.Target
            if target and (target.Name == "TPS" or target.Name == "MPS" or target.Name == "Ball" or target.Name == "SoccerBall") then
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root and (root.Position - mouse.Hit.Position).Magnitude <= Config.Reach.Size * 3 then
                    local leg = LocalPlayer.Character:FindFirstChild(Config.Leg .. " Leg")
                    if leg then
                        firetouchinterest(target, leg, 0)
                        firetouchinterest(target, leg, 1)
                    end
                end
            end
        end
    end
end)

-- 6. Core Systems (Reach Logic)
local ReachHitbox = nil
local VisualizerPart = nil

Services.RunService.Heartbeat:Connect(function()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local root = LocalPlayer.Character.HumanoidRootPart
    
    -- Visualizer Logic
    if Config.Reach.Enabled and Config.Reach.Visualizer then
        if not VisualizerPart then
            -- Use SelectionBox for a cleaner "wireframe" look (like classicsoccer.txt but optimized)
            local part = Instance.new("Part")
            part.Name = "ReachVisualizerRoot"
            part.Anchored = true
            part.CanCollide = false
            part.Transparency = 1
            part.Size = Vector3.new(1,1,1)
            part.Parent = Services.Workspace
            VisualizerPart = part

            local box = Instance.new("SelectionBox")
            box.Name = "ReachBox"
            box.Adornee = part
            box.LineThickness = 0.05
            box.Color3 = UIColors.Accent
            box.Transparency = 0.5
            box.SurfaceTransparency = 0.8 -- Slight fill
            box.SurfaceColor3 = UIColors.Accent
            box.Parent = part
        end
        VisualizerPart.Size = Vector3.new(Config.Reach.Size*2, Config.Reach.Size*2, Config.Reach.Size*2) -- Visualizer is usually diameter/box size
        VisualizerPart.CFrame = root.CFrame
    elseif VisualizerPart then
        VisualizerPart:Destroy()
        VisualizerPart = nil
    end

    -- Hitbox Expansion Logic
    if Config.Reach.Enabled then
        if not ReachHitbox then
            ReachHitbox = Instance.new("Part")
            ReachHitbox.Name = "ReachHitbox"
            ReachHitbox.Size = Vector3.new(Config.Reach.Size, 5, Config.Reach.Size)
            ReachHitbox.CanCollide = false
            ReachHitbox.Transparency = 1
            ReachHitbox.Parent = Services.Workspace
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = root
            weld.Part1 = ReachHitbox
            weld.Parent = ReachHitbox
        end
        
        ReachHitbox.Size = Vector3.new(Config.Reach.Size, 5, Config.Reach.Size)
        ReachHitbox.CFrame = root.CFrame
        
        -- Active Detection
        local overlapParams = OverlapParams.new()
        overlapParams.FilterDescendantsInstances = {LocalPlayer.Character, ReachHitbox, VisualizerPart}
        overlapParams.FilterType = Enum.RaycastFilterType.Exclude
        
        local parts = Services.Workspace:GetPartBoundsInBox(ReachHitbox.CFrame, ReachHitbox.Size, overlapParams)
        
        for _, part in ipairs(parts) do
            if part.Name == "TPS" or part.Name == "MPS" or part.Name == "Ball" or part.Name == "SoccerBall" then
                local leg = LocalPlayer.Character:FindFirstChild(Config.Leg .. " Leg") or LocalPlayer.Character:FindFirstChild("Right Leg") or LocalPlayer.Character:FindFirstChild("RightFoot")
                if leg then
                    -- Client-side touch (often enough for visual/local prediction)
                    firetouchinterest(part, leg, 0)
                    firetouchinterest(part, leg, 1)

                    -- Game-specific Remote (Critical for MPS/Classic Soccer)
                    -- Matches classicsoccer.txt logic: Workspace.FE.Actions.Touch:FireServer(Ball, Leg)
                    task.spawn(function()
                        pcall(function()
                            local fe = Services.Workspace:FindFirstChild("FE")
                            local actions = fe and fe:FindFirstChild("Actions")
                            local touch = actions and actions:FindFirstChild("Touch")
                            if touch then
                                touch:FireServer(part, leg)
                            end
                        end)
                    end)
                end
            end
        end
    else
        if ReachHitbox then
            ReachHitbox:Destroy()
            ReachHitbox = nil
        end
    end
end)

-- 7. Character Enhancements (Speed/Jump)
local CharacterLoop
CharacterLoop = Services.RunService.Heartbeat:Connect(function()
    if not LocalPlayer.Character then return end
    local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    if not humanoid then return end

    if Config.Speed and Config.Speed.Enabled then
        humanoid.WalkSpeed = Config.Speed.Value
    end
    
    if Config.Jump and Config.Jump.Enabled then
        humanoid.JumpPower = Config.Jump.Value
    end
end)
table.insert(_G.V0xConnections, CharacterLoop)

Notify("V0x Loaded", "Welcome " .. LocalPlayer.DisplayName, "Success")
