-- // XENO REMASTERED (Solara/Low-UNC Supported) //
-- Credits: v0x Dev (Logic), Twistzz (UI Lib)

task.wait(0.5)

-- // SERVICES //
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- // SAFE BYPASS SYSTEM (Solara Optimized) //
local function applySafeBypass()
    -- 1. Remote Protection (Anti-Report)
    pcall(function()
        local Actions = Workspace:FindFirstChild("FE") and Workspace.FE:FindFirstChild("Actions")
        if Actions then
            local RealKYHU = Actions:FindFirstChild("KeepYourHeadUp")
            if RealKYHU then
                RealKYHU:Destroy()
                local Fake = Instance.new("RemoteEvent")
                Fake.Name = "KeepYourHeadUp"
                Fake.Parent = Actions
            end
        end
    end)

    -- 2. Error Suppression
    pcall(function()
        game:GetService("ScriptContext").Error:Connect(function() end)
    end)
    
    -- 3. Low-Level Hooking (If supported)
    if hookmetamethod and getnamecallmethod and checkcaller then
        pcall(function()
            local old
            old = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                if (method == "Kick" or method == "kick") and self == LocalPlayer then return end
                if method == "FireServer" and not checkcaller() then
                    local name = self.Name:lower()
                    if name:find("ban") or name:find("kick") or name:find("log") then return end
                end
                return old(self, ...)
            end)
        end)
    end
end

applySafeBypass()

-- // UTILS //
local function getBall()
    local tps = Workspace:FindFirstChild("TPSSystem")
    return tps and tps:FindFirstChild("TPS")
end

local function getLeg(char, side)
    if side == "Right" then
        return char:FindFirstChild("Right Leg") or char:FindFirstChild("RightFoot")
    else
        return char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftFoot")
    end
end

-- // CONFIGS //
_G.ReachEnabled = false
_G.ReachSize = 10
_G.ActiveLeg = "Right"

_G.ReactEnabled = false
_G.ReactRange = 15
_G.ReactPower = 100
_G.ReactType = "Normal" -- Normal, Better, Alz, Foxtede

_G.MossEnabled = false
_G.MossSize = Vector3.new(5,5,5)

_G.BallPredEnabled = false
_G.BallPredBeam = nil

-- // LOGIC LOOPS //
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    local ball = getBall()
    
    if char and ball then
        local root = char:FindFirstChild("HumanoidRootPart")
        
        -- REACH LOGIC
        if _G.ReachEnabled and root then
            local dist = (root.Position - ball.Position).Magnitude
            if dist <= _G.ReachSize then
                local leg = getLeg(char, _G.ActiveLeg)
                if leg then
                    firetouchinterest(leg, ball, 0)
                    firetouchinterest(leg, ball, 1)
                end
            end
        end
        
        -- REACT LOGIC
        if _G.ReactEnabled and root then
            local dist = (root.Position - ball.Position).Magnitude
            if dist <= _G.ReactRange then
                local power = _G.ReactPower
                if _G.ReactType == "Better" then power = 100 end
                if _G.ReactType == "Alz" then power = 100 end
                if _G.ReactType == "Foxtede" then power = 110 end
                
                ball.Velocity = Vector3.new(power, power, power)
            end
        end
        
        -- MOSS LOGIC
        if _G.MossEnabled and char:FindFirstChild("Head") then
            char.Head.Size = _G.MossSize
            char.Head.Transparency = 0.5
            char.Head.CanCollide = false
            -- Head Reach Logic
            local distHead = (char.Head.Position - ball.Position).Magnitude
            if distHead <= math.max(_G.MossSize.X, _G.MossSize.Y) then
                 firetouchinterest(char.Head, ball, 0)
                 firetouchinterest(char.Head, ball, 1)
            end
        end
        
        -- BALL PREDICTION
        if _G.BallPredEnabled then
            if not _G.BallPredBeam then
                -- Setup Beam
                local att1 = Instance.new("Attachment", Workspace.Terrain)
                local att2 = Instance.new("Attachment", Workspace.Terrain)
                local beam = Instance.new("Beam", Workspace.Terrain)
                beam.Attachment0 = att1
                beam.Attachment1 = att2
                beam.Width0 = 0.5
                beam.Width1 = 0.1
                beam.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
                beam.FaceCamera = true
                _G.BallPredBeam = {beam, att1, att2}
            end
            
            local beamData = _G.BallPredBeam
            beamData[2].WorldPosition = ball.Position
            beamData[3].WorldPosition = ball.Position + (ball.Velocity * 0.5) -- Simple forecast
        elseif _G.BallPredBeam then
            _G.BallPredBeam[1]:Destroy()
            _G.BallPredBeam[2]:Destroy()
            _G.BallPredBeam[3]:Destroy()
            _G.BallPredBeam = nil
        end
    end
end)

-- // UI SETUP (Vernum Lib Original) //
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Twistzzmassivescripts/UI_Libarys/refs/heads/main/MY%20OWN%20LIBARYS/Vernum%20Gui%20Libary'))()
local Window = Library:Window({
    Config = {
        Size = UDim2.new(0, 600, 0, 500),
        Keybind = Enum.KeyCode.K,
    },
    Title = 'v0x dev | TPS Low Unc Executors',
    CloseUIButton = {
        Enabled = true,
        Text = 'v0x dev',
    },
    Theme = 'Blue',
    Icon = 105059922903197,
    Desc = 'XENO REMASTERED',
})

local TabInfo = Window:Tab({ Title = 'Info', Icon = 'badge-info' })
TabInfo:Section({ Title = 'Information' })
TabInfo:Code({ Title = 'Status', Code = 'Solara/Low-UNC: Supported\nBypass: Active' })

local TabReach = Window:Tab({ Title = 'Reach Methods', Icon = 'circle-user-round' })

TabReach:Section({ Title = 'Reach Configuration' })
TabReach:Toggle({
    Title = 'Enable Reach',
    Desc = 'Legit Reach (Extends hitbox)',
    Value = false,
    Callback = function(v) _G.ReachEnabled = v end,
})

TabReach:Slider({
    Title = 'Reach Size',
    Min = 1,
    Max = 25,
    Value = 10,
    Rounding = 1,
    Callback = function(v) _G.ReachSize = v end,
})

TabReach:Dropdown({
    Title = 'Leg Selection',
    List = {'Right', 'Left'},
    Value = 'Right',
    Callback = function(v) _G.ActiveLeg = v end,
})

TabReach:Button({
    Title = 'Apply Fake Legs',
    Desc = 'Visuals only',
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v.Name:find("Leg") or v.Name:find("Foot") then
                    v.Transparency = 0
                end
            end
        end
    end,
})

local TabReacts = Window:Tab({ Title = 'Reacts', Icon = 'apple' })
TabReacts:Section({ Title = 'React Modes' })

TabReacts:Toggle({
    Title = 'Enable Auto React',
    Desc = 'Velocity boost on touch range',
    Value = false,
    Callback = function(v) _G.ReactEnabled = v end,
})

TabReacts:Slider({
    Title = 'React Range',
    Min = 5,
    Max = 30,
    Value = 15,
    Rounding = 1,
    Callback = function(v) _G.ReactRange = v end,
})

TabReacts:Section({ Title = 'Presets' })
TabReacts:Button({
    Title = 'Twistzz React',
    Desc = 'Default Power',
    Callback = function() 
        _G.ReactType = "Normal" 
        _G.ReactPower = 100 
        Library:Notify({Title="React", Desc="Mode: Twistzz"})
    end,
})
TabReacts:Button({
    Title = 'Better React',
    Desc = 'Power 100 Constant',
    Callback = function() 
        _G.ReactType = "Better" 
        _G.ReactPower = 100
        Library:Notify({Title="React", Desc="Mode: Better"})
    end,
})
TabReacts:Button({
    Title = 'Foxtede React',
    Desc = 'Power 110',
    Callback = function() 
        _G.ReactType = "Foxtede" 
        _G.ReactPower = 110
        Library:Notify({Title="React", Desc="Mode: Foxtede"})
    end,
})

local TabMoss = Window:Tab({ Title = 'Moss & Head', Icon = 'headset' })
TabMoss:Section({ Title = 'Head Configuration' })

TabMoss:Toggle({
    Title = 'Enable Moss/HeadReach',
    Desc = 'Expands head hitbox',
    Value = false,
    Callback = function(v) _G.MossEnabled = v end,
})

TabMoss:Slider({
    Title = 'Head Size X/Y/Z',
    Min = 1,
    Max = 10,
    Value = 5,
    Rounding = 1,
    Callback = function(v) _G.MossSize = Vector3.new(v,v,v) end,
})

local TabMods = Window:Tab({ Title = 'Game Mods', Icon = 'volleyball' })
TabMods:Section({ Title = 'Ball Mods' })

TabMods:Toggle({
    Title = 'Ball Prediction',
    Desc = 'Visual beam',
    Value = false,
    Callback = function(v) _G.BallPredEnabled = v end,
})

TabMods:Toggle({
    Title = 'Block Ball',
    Desc = 'Client sided shape change',
    Value = false,
    Callback = function(v)
        local ball = getBall()
        if ball then ball.Shape = v and Enum.PartType.Block or Enum.PartType.Ball end
    end,
})

TabMods:Section({ Title = 'CFG Loaders' })
TabMods:Button({
    Title = 'Load Legit CFG',
    Desc = 'Reach 5, React OFF',
    Callback = function()
        _G.ReachSize = 5
        _G.ReactEnabled = false
        Library:Notify({Title="Config", Desc="Legit Loaded"})
    end,
})
TabMods:Button({
    Title = 'Load Rage CFG',
    Desc = 'Reach 15, React ON',
    Callback = function()
        _G.ReachSize = 15
        _G.ReactEnabled = true
        _G.ReactPower = 150
        Library:Notify({Title="Config", Desc="Rage Loaded"})
    end,
})

local TabPlayer = Window:Tab({ Title = 'Player', Icon = 'user' })
TabPlayer:Section({ Title = 'Stats' })

TabPlayer:Slider({
    Title = 'WalkSpeed',
    Min = 16,
    Max = 100,
    Value = 16,
    Rounding = 0,
    Callback = function(v)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    end,
})

TabPlayer:Slider({
    Title = 'JumpPower',
    Min = 50,
    Max = 200,
    Value = 50,
    Rounding = 0,
    Callback = function(v)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = v
        end
    end,
})

local TabSky = Window:Tab({ Title = 'Sky Changer', Icon = 'cloud-cog' })
TabSky:Section({ Title = 'Themes' })

local function setSky(id)
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if not sky then
        sky = Instance.new("Sky", Lighting)
    end
    sky.SkyboxBk = "rbxassetid://" .. id
    sky.SkyboxDn = "rbxassetid://" .. id
    sky.SkyboxFt = "rbxassetid://" .. id
    sky.SkyboxLf = "rbxassetid://" .. id
    sky.SkyboxRt = "rbxassetid://" .. id
    sky.SkyboxUp = "rbxassetid://" .. id
end

TabSky:Button({ Title = 'Purple Sky', Callback = function() setSky(1510620023) end })
TabSky:Button({ Title = 'Night Sky', Callback = function() setSky(1510620023) end }) -- Placeholder IDs
TabSky:Button({ Title = 'Pink Sky', Callback = function() setSky(271042516) end })

Library:Notify({
    Time = 5,
    Title = 'v0x dev',
    Desc = 'XENO Remastered Loaded!',
})
