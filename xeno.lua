-- ts file was generated at discord.gg/25ms

local fenv = getfenv()
local _call5 = game:GetService('TweenService')
local _call10 = Instance.new('ScreenGui', game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui'))

_call10.ResetOnSpawn = false
_call10.Name = 'BypassGUI'

local _call12 = Instance.new('Frame', _call10)

_call12.Size = UDim2.new(1, 0, 1, 0)
_call12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_call12.BackgroundTransparency = 1

local _call18 = Instance.new('TextLabel', _call12)

_call18.Size = UDim2.new(1, 0, 1, 0)
_call18.BackgroundTransparency = 1
_call18.TextColor3 = Color3.fromRGB(255, 255, 255)
_call18.TextScaled = true
_call18.Font = Enum.Font.GothamBlack
_call18.TextTransparency = 1
_call18.Text = 'WAIT A SEC...'

local _call28 = _call5:Create(_call12, TweenInfo.new(1), {BackgroundTransparency = 0})

_call28:Play()

local _call34 = _call5:Create(_call18, TweenInfo.new(1), {TextTransparency = 0})

_call34:Play()
task.wait(3)

_call18.Text = 'ATLANTIC.DEV IS BACK ????????????'

task.wait(2)

local _call40 = _call5:Create(_call12, TweenInfo.new(1), {BackgroundTransparency = 1})

_call40:Play()

local _call46 = _call5:Create(_call18, TweenInfo.new(1), {TextTransparency = 1})

_call46:Play()
task.wait(1)
_call10:Destroy()

local _Actions52 = workspace.FE.Actions

_Actions52:FindFirstChild('KeepYourHeadUp_')
_Actions52.KeepYourHeadUp_:Destroy()

local _call59 = Instance.new('RemoteEvent')

_call59.Name = 'KeepYourHeadUp_'
_call59.Parent = _Actions52

local _call69 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Twistzzmassivescripts/UI_Libarys/refs/heads/main/MY%20OWN%20LIBARYS/Vernum%20Gui%20Libary'))():Window({
    Config = {
        Size = UDim2.new(0, 600, 0, 500),
        Keybind = Enum.KeyCode.K,
    },
    Title = 'v0x dev | TPS Low Unc Executors | By Twistzz',
    CloseUIButton = {
        Enabled = true,
        Text = 'v0x dev',
    },
    Theme = 'Blue',
    Icon = 105059922903197,
    Desc = 'Yes ITS FINNALY BACK !!!',
})
local _call71 = Instance.new('Frame')

_call71.Size = UDim2.new(0, 1, 1, 0)
_call71.Position = UDim2.new(0, 140, 0, 0)
_call71.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
_call71.BorderSizePixel = 0
_call71.ZIndex = 5
_call71.Name = 'SidebarLine'
_call71.Parent = game:GetService('CoreGui')

local _call81 = _call69:Tab({
    Title = 'Read',
    Icon = 'badge-info',
})

_call81:Section({
    Title = 'Read',
})
_call81:Code({
    Title = 'Beta Version',
    Code = 'First time using this UI library.\nReport bugs: discord.gg/twistzzscripts',
})

local _call87 = _call69:Tab({
    Title = 'Reach Methods',
    Icon = 'circle-user-round',
})

_call87:Section({
    Title = 'Reach Method 1 [Recommand this one]',
})

local _LocalPlayer94 = game:GetService('Players').LocalPlayer

_call87:Toggle({
    Value = false,
    Callback = function(_97, _97_2)
        local _Character98 = _LocalPlayer94.Character

        _Character98:WaitForChild('Right Leg')
        _Character98:FindFirstChild('Right Leg')

        local _RightLeg105 = _Character98['Right Leg']

        _RightLeg105.Transparency = 1

        _Character98:FindFirstChild('Left Leg')

        local _LeftLeg108 = _Character98['Left Leg']

        _LeftLeg108.Transparency = 1

        _Character98:FindFirstChild('Right Hip', true):Destroy()
        game:GetService('RunService').RenderStepped:Connect(function(_116)
            local _ = (workspace.TPSSystem.TPS.Position - _Character98:WaitForChild('HumanoidRootPart').Position).Magnitude

            error('line 1: attempt to compare table <= number')
        end)
    end,
    Title = 'Enable / Disable Reach',
    Desc = 'Recommended to use this reach method.',
})
_call87:Slider({
    Min = 1,
    Title = 'Reach Size',
    Max = 25,
    Value = 10,
    Callback = function(v)
        _G.ReachSize = v
    end,
    Rounding = 0,
})
_call87:Button({
    Callback = function()
        local _ = _LocalPlayer94.Character:WaitForChild('Humanoid').RigType == Enum.HumanoidRigType.R6
    end,
    Title = 'Fake Legs',
    Desc = 'Using this your legs will appear normal.',
})
_call87:Section({
    Title = 'Reach Method 2 ',
})

local _LocalPlayer142 = game:GetService('Players').LocalPlayer
local _call144 = Vector3.new(10, 10, 10)
local _call146 = Instance.new('Part')

_call146.Anchored = true
_call146.CanCollide = false
_call146.Transparency = 1
_call146.Material = Enum.Material.Neon
_call146.Color = Color3.fromRGB(255, 0, 0)
_call146.Size = _call144
_call146.Parent = workspace

_call87:Toggle({
    Value = false,
    Callback = function(_153, _153_2, _153_3, _153_4, _153_5)
        local _Character154 = _LocalPlayer142.Character
        local _call156 = _Character154:WaitForChild('HumanoidRootPart')
        local _call158 = _Character154:WaitForChild('Right Leg')

        _Character154:FindFirstChild('Right Leg')

        local _RightLeg161 = _Character154['Right Leg']

        _RightLeg161.Transparency = 1

        _Character154:FindFirstChild('Left Leg')

        local _LeftLeg164 = _Character154['Left Leg']

        _LeftLeg164.Transparency = 1

        local _ = _call158.CFrame

        _Character154:FindFirstChild('Right Hip', true):Destroy()
        game:GetService('RunService').RenderStepped:Connect(function(_173, _173_2, _173_3)
            local _call177 = workspace:FindFirstChild('TPSSystem'):FindFirstChild('TPS')

            _call146.Size = _call144
            _call146.CFrame = _call156.CFrame

            local _CFrame179 = _call156.CFrame
            local _CFrame180 = _call177.CFrame
            local _Size181 = _call177.Size
            local _184 = (_CFrame179.Position - (_call144 / 2))
            local _187 = (_CFrame179.Position + (_call144 / 2))
            local _190 = (_CFrame180.Position - (_Size181 / 2))
            local _193 = (_CFrame180.Position + (_Size181 / 2))
            local _ = _184.X <= _193.X
            local _ = _190.X <= _187.X
            local _ = _184.Y <= _193.Y
            local _ = _190.Y <= _187.Y
            local _ = _184.Z <= _193.Z
            local _ = _190.Z <= _187.Z

            _call158.CFrame = _call177.CFrame
        end)
    end,
    Title = 'Enable / Disable Reach',
    Desc = '',
})
_call87:Toggle({
    Value = false,
    Callback = function(_215, _215_2, _215_3) end,
    Title = 'Enable / Disable Auto Enable After Death / Reset',
    Desc = '',
})
_call87:Dropdown({
    Value = 'Right Leg',
    Callback = function(_218, _218_2, _218_3)
        local _ = _218[1]
        local _ = fenv.Toggle

        error("line 1: attempt to index nil with 'Set'")
    end,
    Title = 'Choose Your Leg',
    List = {
        [1] = 'Right Leg',
        [2] = 'Left Leg',
    },
})
_call87:Slider({
    Min = 1,
    Title = 'Box Size X',
    Max = 20,
    Value = 1,
    Callback = function(_223, _223_2, _223_3)
        Vector3.new(_223, _call144.Y, _call144.Z)
    end,
    Rounding = 0,
})
_call87:Slider({
    Min = 1,
    Title = 'Box Size Y',
    Max = 20,
    Value = 1,
    Callback = function(_230, _230_2, _230_3, _230_4)
        Vector3.new(_call227.X, _230, _call227.Z)
    end,
    Rounding = 0,
})
_call87:Slider({
    Min = 1,
    Title = 'Box Size Z',
    Max = 20,
    Value = 1,
    Callback = function(_237, _237_2, _237_3, _237_4)
        Vector3.new(_call234.X, _call234.Y, _237)
    end,
    Rounding = 0,
})
_call87:Slider({
    Min = 1,
    Title = 'Box Size XYZ',
    Max = 20,
    Value = 1,
    Callback = function(_244, _244_2, _244_3, _244_4, _244_5)
        Vector3.new(_244, _244, _244)
    end,
    Rounding = 0,
})
_call87:Textbox({
    Placeholder = 'Number',
    Title = 'Box Size XYZ',
    Value = '',
    ClearTextOnFocus = false,
    Callback = function(_249)
        Vector3.new(_249, _249, _249)
    end,
    Desc = 'Custom Size',
})
_call87:Textbox({
    Placeholder = 'Number',
    Title = 'Box Transperncy',
    Value = '',
    ClearTextOnFocus = false,
    Callback = function(_254, _254_2, _254_3, _254_4)
        _call146.Transparency = 0.5
    end,
    Desc = '0-1',
})
_call87:Toggle({
    Value = false,
    Callback = function(_257, _257_2, _257_3, _257_4, _257_5)
        local _call260 = _LocalPlayer142.Character:WaitForChild('Humanoid')
        local _ = _call260.RigType == Enum.HumanoidRigType.R6
        local _ = _call260.RigType == Enum.HumanoidRigType.R15
    end,
    Title = 'Appear Normal',
    Desc = '',
})
_LocalPlayer142.CharacterAdded:Connect(function(_272)
    _272:WaitForChild('Humanoid').Died:Connect(function(_278) end)
    task.wait(5)
    error("line 1: attempt to index nil with 'Set'")
end)

local _call280 = _call69:Tab({
    Title = 'Reacts',
    Icon = 'apple',
})

_call280:Section({
    Title = 'Twistzz React',
})
_call280:Button({
    Callback = function(_285, _285_2)
        local _LocalPlayer290 = game:GetService('Players').LocalPlayer
        local _Character291 = _LocalPlayer290.Character

        _Character291:WaitForChild('Right Leg')
        _Character291:FindFirstChild('Right Leg')

        local _RightLeg298 = _Character291['Right Leg']

        _RightLeg298.Transparency = 1

        _Character291:FindFirstChild('Left Leg')

        local _LeftLeg301 = _Character291['Left Leg']

        _LeftLeg301.Transparency = 1

        _Character291:FindFirstChild('Right Hip', true):Destroy()
        game:GetService('RunService').RenderStepped:Connect(function(_309, _309_2)
            local _call311 = workspace:FindFirstChild('TPSSystem')
            local _ = (_call311:FindFirstChild('TPS').Position - _Character291:WaitForChild('HumanoidRootPart').Position).Magnitude

            error('line 1: attempt to compare table <= number')
        end)

        local _ = _LocalPlayer290.Character:WaitForChild('Humanoid').RigType == Enum.HumanoidRigType.R6

        game:GetService('Players').LocalPlayer.CharacterAdded:Connect(function(_331, _331_2, _331_3, _331_4)
            local _LocalPlayer336 = game:GetService('Players').LocalPlayer
            local _Character337 = _LocalPlayer336.Character

            _Character337:WaitForChild('Right Leg')
            _Character337:FindFirstChild('Right Leg')

            local _RightLeg344 = _Character337['Right Leg']

            _RightLeg344.Transparency = 1

            _Character337:FindFirstChild('Left Leg')

            local _LeftLeg347 = _Character337['Left Leg']

            _LeftLeg347.Transparency = 1

            _Character337:FindFirstChild('Right Hip', true):Destroy()
            game:GetService('RunService').RenderStepped:Connect(function(_355, _355_2)
                local _call357 = workspace:FindFirstChild('TPSSystem')
                local _ = (_call357:FindFirstChild('TPS').Position - _Character337:WaitForChild('HumanoidRootPart').Position).Magnitude

                error('line 1: attempt to compare table <= number')
            end)

            local _ = _LocalPlayer336.Character:WaitForChild('Humanoid').RigType == Enum.HumanoidRigType.R6
        end)
        _call69:Notify({
            Time = 3,
            Title = 'React',
            Desc = 'Action performed successfully.',
        })
    end,
    Title = 'OP REACT NEW ITS FIREEEEEE',
    Desc = 'W REACT BY TWISTZZ ',
})

local _ = game:GetService('Players').LocalPlayer

_call280:Section({
    Title = 'Better React',
})
_call280:Button({
    Callback = function(_382, _382_2, _382_3)
        local _TPS385 = game.Workspace.TPSSystem.TPS

        _TPS385.Velocity = Vector3.new(100, 100, 100)

        _call69:Notify({
            Time = 3,
            Title = 'Better React',
            Desc = 'React enabled successfully',
        })
    end,
    Title = 'Better React',
    Desc = 'Activate Better React',
})
_call280:Section({
    Title = 'Alz React',
})
_call280:Button({
    Callback = function(_394, _394_2, _394_3)
        local _TPS397 = game.Workspace.TPSSystem.TPS

        _TPS397.Velocity = Vector3.new(100, 100, 100)

        _call69:Notify({
            Time = 3,
            Title = 'Alz React',
            Desc = 'React enabled successfully',
        })
    end,
    Title = 'Alz React',
    Desc = 'Activate Alz React',
})
_call280:Section({
    Title = 'Foxtede React',
})
_call280:Button({
    Callback = function(_406, _406_2, _406_3)
        local _TPS409 = game.Workspace.TPSSystem.TPS

        _TPS409.Velocity = Vector3.new(110, 110, 110)

        _call69:Notify({
            Time = 3,
            Title = 'Foxtede React',
            Desc = 'React enabled successfully',
        })
    end,
    Title = 'Foxtede React',
    Desc = 'Activate Foxtede React',
})
_call280:Section({
    Title = 'Goalkeeper React',
})
_call280:Button({
    Callback = function(_416, _416_2, _416_3)
        local _callgetrawmetatable417 = getrawmetatable(game)
        local __namecall418 = _callgetrawmetatable417.__namecall

        setreadonly(_callgetrawmetatable417, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call422 = __namecall418(...)

            return _call422
        end)

        _callgetrawmetatable417.__namecall = function(...)
            getnamecallmethod()

            local _call425 = __namecall418(...)

            return _call425
        end

        setreadonly(_callgetrawmetatable417, true)

        local _callgetrawmetatable427 = getrawmetatable(game)
        local __namecall428 = _callgetrawmetatable427.__namecall

        setreadonly(_callgetrawmetatable427, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call432 = __namecall428(...)

            return _call432
        end)

        _callgetrawmetatable427.__namecall = function(...)
            getnamecallmethod()

            local _call435 = __namecall428(...)

            return _call435
        end

        setreadonly(_callgetrawmetatable427, true)

        local _callgetrawmetatable437 = getrawmetatable(game)
        local __namecall438 = _callgetrawmetatable437.__namecall

        setreadonly(_callgetrawmetatable437, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call442 = __namecall438(...)

            return _call442
        end)

        _callgetrawmetatable437.__namecall = function(...)
            getnamecallmethod()

            local _call445 = __namecall438(...)

            return _call445
        end

        setreadonly(_callgetrawmetatable437, true)

        local _callgetrawmetatable447 = getrawmetatable(game)
        local __namecall448 = _callgetrawmetatable447.__namecall

        setreadonly(_callgetrawmetatable447, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call452 = __namecall448(...)

            return _call452
        end)

        _callgetrawmetatable447.__namecall = function(...)
            getnamecallmethod()

            local _call455 = __namecall448(...)

            return _call455
        end

        setreadonly(_callgetrawmetatable447, true)

        local _callgetrawmetatable457 = getrawmetatable(game)
        local __namecall458 = _callgetrawmetatable457.__namecall

        setreadonly(_callgetrawmetatable457, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call462 = __namecall458(...)

            return _call462
        end)

        _callgetrawmetatable457.__namecall = function(...)
            getnamecallmethod()

            local _call465 = __namecall458(...)

            return _call465
        end

        setreadonly(_callgetrawmetatable457, true)

        local _callgetrawmetatable467 = getrawmetatable(game)
        local __namecall468 = _callgetrawmetatable467.__namecall

        setreadonly(_callgetrawmetatable467, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call472 = __namecall468(...)

            return _call472
        end)

        _callgetrawmetatable467.__namecall = function(...)
            getnamecallmethod()

            local _call475 = __namecall468(...)

            return _call475
        end

        setreadonly(_callgetrawmetatable467, true)

        local _callgetrawmetatable477 = getrawmetatable(game)
        local __namecall478 = _callgetrawmetatable477.__namecall

        setreadonly(_callgetrawmetatable477, false)
        newcclosure(function(...)
            getnamecallmethod()

            local _call482 = __namecall478(...)

            return _call482
        end)

        _callgetrawmetatable477.__namecall = function(...)
            getnamecallmethod()

            local _call485 = __namecall478(...)

            return _call485
        end

        setreadonly(_callgetrawmetatable477, true)
        _call69:Notify({
            Time = 3,
            Title = 'Goalkeeper React',
            Desc = 'React enabled successfully',
        })
    end,
    Title = 'Goalkeeper React',
    Desc = 'Activate Goalkeeper React',
})

local _call490 = _call69:Tab({
    Title = 'Moss & Head Reach',
    Icon = 'headset',
})

_call490:Section({
    Title = 'Moss',
})

local _LocalPlayer495 = game:GetService('Players').LocalPlayer
local _call498 = _LocalPlayer495.Character:WaitForChild('Head')
local _ = _call498.Size
local _ = _call498.Position.Y

_LocalPlayer495.CharacterAdded:Connect(function(_505, _505_2)
    local _call507 = _505:WaitForChild('Head')
    local _ = _call507.Size
    local _ = _call507.Position.Y
end)
_call490:Toggle({
    Value = false,
    Callback = function(v)
        _G.MossEnabled = v
        
        local Plr = game:GetService('Players').LocalPlayer
        local Char = Plr.Character
        if Char and Char:FindFirstChild("Head") then
             local Head = Char.Head
             if v then
                 _G.OriginalHeadSize = Head.Size
                 _G.OriginalHeadY = Head.Position.Y
                 Head.Transparency = 0.5
                 Head.Size = Vector3.new(_G.MossX or 5, _G.MossY or 5, _G.MossZ or 5)
                 Head.CanCollide = false
             else
                 if _G.OriginalHeadSize then
                     Head.Size = _G.OriginalHeadSize
                     Head.Transparency = 0
                 end
             end
        end
    end,
    Title = 'Enable / Disable Moss',
    Desc = 'Head Reach',
})
_call490:Slider({
    Min = 1,
    Title = 'Set Size X',
    Max = 10,
    Value = 5,
    Callback = function(v)
        _G.MossX = v
        local Char = game.Players.LocalPlayer.Character
        if Char and Char:FindFirstChild("Head") and _G.MossEnabled then
            Char.Head.Size = Vector3.new(v, Char.Head.Size.Y, Char.Head.Size.Z)
        end
    end,
    Rounding = 0,
})
_call490:Slider({
    Min = 1,
    Title = 'Set Size Y',
    Max = 10,
    Value = 5,
    Callback = function(_561, _561_2, _561_3, _561_4, _561_5, _561_6)
        local _call563 = Vector3.new(_544, _561, 5)

        _call507.Size = _call563
        _call507.Position = Vector3.new(_call507.Position.X, (_Y516 + (((_call563.Y - _Size514.Y) / 2) + 0.5)), _call507.Position.Z)
    end,
    Rounding = 0,
})
_call490:Slider({
    Min = 1,
    Title = 'Set Size Z',
    Max = 10,
    Value = 5,
    Callback = function(_578, _578_2, _578_3)
        local _call580 = Vector3.new(_544, _561, _578)

        _call507.Size = _call580
        _call507.Position = Vector3.new(_call507.Position.X, (_Y516 + (((_call580.Y - _Size514.Y) / 2) + 0.5)), _call507.Position.Z)
    end,
    Rounding = 0,
})
game:GetService('RunService')
_call490:Toggle({
    Value = false,
    Callback = function(_597, _597_2, _597_3, _597_4, _597_5) end,
    Title = 'Enable / Disable After Reset',
    Desc = 'Reapply on Respawn',
})

local _call599 = _call69:Tab({
    Title = 'Help',
    Icon = 'circle-help',
})

_call599:Section({
    Title = 'Air Dribble Helper',
})
_call599:Toggle({
    Value = false,
    Callback = function(_604) end,
    Title = 'Enable / Disable Air Dribble Helper',
    Desc = 'Shows helper under the ball',
})
_call599:Slider({
    Min = 0,
    Title = 'Air Dribble Helper Size',
    Max = 100,
    Value = 10,
    Callback = function(_607)
        local _call609 = Instance.new('Part')

        _call609.Name = 'TPS'
        _call609.Size = Vector3.new(_607, 0.001, _607)
        _call609.Anchored = true
        _call609.Transparency = 1
        _call609.BrickColor = BrickColor.new('Bright red')
        _call609.Parent = workspace

        local _call615 = workspace:FindFirstChild('TPSSystem')

        game:GetService('RunService').RenderStepped:Connect(function(_623, _623_2, _623_3, _623_4, _623_5)
            _call609.Position = (_call615:FindFirstChild('TPS').Position - Vector3.new(0, 1, 0))
        end)
    end,
    Rounding = 0,
})
_call599:Section({
    Title = 'ZZZZ Helper',
})
_call599:Toggle({
    Value = false,
    Callback = function(_632, _632_2, _632_3)
        local _call634 = Instance.new('Part')

        _call634.Name = 'TPS1'
        _call634.Size = Vector3.new(9, 0.001, 9)
        _call634.Anchored = true
        _call634.Transparency = 1
        _call634.BrickColor = BrickColor.new('Bright red')
        _call634.Parent = workspace

        local _call640 = workspace:FindFirstChild('TPSSystem')

        game:GetService('RunService').RenderStepped:Connect(function(_648, _648_2)
            _call634.Position = (_call640:FindFirstChild('TPS').Position - Vector3.new(0, 1, 0))
        end)
    end,
    Title = 'ZZZZ Helper',
    Desc = 'Static helper under ball',
})
_call599:Section({
    Title = 'Infinite Dribble Helper',
})

local _LocalPlayer656 = game.Players.LocalPlayer
local _ = _LocalPlayer656.Character
local _ = workspace.TPSSystem.TPS
local _call661 = game:GetService('UserInputService')

_call661.InputBegan:Connect(function(_667, _667_2, _667_3, _667_4, _667_5, _667_6, _667_7)
    local _ = _667.KeyCode == Enum.KeyCode.B
end)
_call661.InputEnded:Connect(function(_675, _675_2) end)
game:GetService('RunService').RenderStepped:Connect(function() end)
_LocalPlayer656.CharacterAdded:Connect(function(_683, _683_2) end)
_call599:Toggle({
    Value = false,
    Callback = function(_686, _686_2, _686_3, _686_4) end,
    Title = 'Infinite Dribble Helper (B to Toggle)',
    Desc = 'Automatically follows the ball',
})

local _call688 = _call69:Tab({
    Title = 'Game Modifaction',
    Icon = 'volleyball',
})

_call688:Section({
    Title = 'Ball Modification',
})
_call688:Textbox({
    Placeholder = '',
    Title = 'Ball Size',
    Value = '',
    ClearTextOnFocus = false,
    Callback = function(_693, _693_2, _693_3, _693_4)
        local _TPS697 = game:GetService('Workspace').TPSSystem.TPS

        _TPS697.Size = Vector3.new(_693, _693, _693)

        local _ = game.Workspace.FollowerPart
        local _FollowerPart703 = game.Workspace.FollowerPart

        _FollowerPart703.Size = Vector3.new(_693, _693, _693)
    end,
    Desc = '',
})
_call688:Button({
    Callback = function(_708, _708_2, _708_3, _708_4)
        local _TPS712 = game:GetService('Workspace').TPSSystem.TPS

        _TPS712.Size = Vector3.new(2.5, 2.5, 2.5)

        local _ = game.Workspace.FollowerPart
        local _FollowerPart718 = game.Workspace.FollowerPart

        _FollowerPart718.Size = Vector3.new(2.5, 2.5, 2.5)

        _call69:Notify({
            Time = 3,
            Title = 'Ball Size Returned Back To Normal',
            Desc = 'Action performed successfully.',
        })
    end,
    Title = 'Default Ball Size',
    Desc = 'Press this shit to reset the ball size',
})
_call688:Toggle({
    Value = false,
    Callback = function(_725, _725_2, _725_3, _725_4, _725_5)
        local _call729 = workspace:WaitForChild('TPSSystem'):WaitForChild('TPS')
        local _call731 = Instance.new('Part')

        _call731.Name = 'FollowerPart'
        _call731.Shape = Enum.PartType.Ball
        _call731.Anchored = true
        _call731.CanCollide = true
        _call731.Material = Enum.Material.Air
        _call731.Color = _call729.Color
        _call731.Parent = workspace

        game:GetService('RunService').Heartbeat:Connect(function(_742, _742_2)
            _call731.Size = _call729.Size
            _call731.CFrame = _call729.CFrame
            _call731.Color = _call729.Color
        end)
    end,
    Title = 'Ball Collision',
    Desc = 'gives back old collision (2019).',
})
_call688:Toggle({
    Value = false,
    Callback = function(_748)
        local _call752 = game:GetService('Workspace')
        local _TPS754 = workspace.TPSSystem.TPS
        local _ = _call752.Gravity
        local _ = _G.BallPredictionFolder
        local _call757 = Instance.new('Folder', _call752)

        _call757.Name = 'BallPrediction'
        _G.BallPredictionFolder = _call757

        local _call759 = Instance.new('Attachment')

        _call759.WorldPosition = _TPS754.Position
        _call759.Parent = _call757

        local _call762 = Instance.new('Attachment')

        _call762.WorldPosition = _TPS754.Position
        _call762.Parent = _call757

        local _call765 = Instance.new('Attachment')

        _call765.WorldPosition = _TPS754.Position
        _call765.Parent = _call757

        local _call768 = Instance.new('Attachment')

        _call768.WorldPosition = _TPS754.Position
        _call768.Parent = _call757

        local _call771 = Instance.new('Attachment')

        _call771.WorldPosition = _TPS754.Position
        _call771.Parent = _call757

        local _call774 = Instance.new('Attachment')

        _call774.WorldPosition = _TPS754.Position
        _call774.Parent = _call757

        local _call777 = Instance.new('Attachment')

        _call777.WorldPosition = _TPS754.Position
        _call777.Parent = _call757

        local _call780 = Instance.new('Attachment')

        _call780.WorldPosition = _TPS754.Position
        _call780.Parent = _call757

        local _call783 = Instance.new('Attachment')

        _call783.WorldPosition = _TPS754.Position
        _call783.Parent = _call757

        local _call786 = Instance.new('Attachment')

        _call786.WorldPosition = _TPS754.Position
        _call786.Parent = _call757

        local _call789 = Instance.new('Attachment')

        _call789.WorldPosition = _TPS754.Position
        _call789.Parent = _call757

        local _call792 = Instance.new('Attachment')

        _call792.WorldPosition = _TPS754.Position
        _call792.Parent = _call757

        local _call795 = Instance.new('Attachment')

        _call795.WorldPosition = _TPS754.Position
        _call795.Parent = _call757

        local _call798 = Instance.new('Attachment')

        _call798.WorldPosition = _TPS754.Position
        _call798.Parent = _call757

        local _call801 = Instance.new('Attachment')

        _call801.WorldPosition = _TPS754.Position
        _call801.Parent = _call757

        local _call804 = Instance.new('Attachment')

        _call804.WorldPosition = _TPS754.Position
        _call804.Parent = _call757

        local _call807 = Instance.new('Attachment')

        _call807.WorldPosition = _TPS754.Position
        _call807.Parent = _call757

        local _call810 = Instance.new('Attachment')

        _call810.WorldPosition = _TPS754.Position
        _call810.Parent = _call757

        local _call813 = Instance.new('Attachment')

        _call813.WorldPosition = _TPS754.Position
        _call813.Parent = _call757

        local _call816 = Instance.new('Attachment')

        _call816.WorldPosition = _TPS754.Position
        _call816.Parent = _call757
        _G.BallPredictionAttachments = {
            [1] = _call759,
            [2] = _call762,
            [3] = _call765,
            [4] = _call768,
            [5] = _call771,
            [6] = _call774,
            [7] = _call777,
            [8] = _call780,
            [9] = _call783,
            [10] = _call786,
            [11] = _call789,
            [12] = _call792,
            [13] = _call795,
            [14] = _call798,
            [15] = _call801,
            [16] = _call804,
            [17] = _call807,
            [18] = _call810,
            [19] = _call813,
            [20] = _call816,
        }

        local _call819 = Instance.new('Beam')

        _call819.Attachment0 = _call759
        _call819.Attachment1 = _call816
        _call819.FaceCamera = true
        _call819.Width0 = 0.18
        _call819.Width1 = 0.18
        _call819.Color = ColorSequence.new(Color3.fromRGB(0, 150, 255))
        _call819.Transparency = NumberSequence.new(0.25)
        _call819.LightEmission = 1
        _call819.Segments = 40
        _call819.Parent = _call757
        _call819.Enabled = false
        _G.BallPredictionBeam = _call819

        local _call827 = RaycastParams.new()

        _call827.FilterDescendantsInstances = {[1] = _TPS754}
        _call827.FilterType = Enum.RaycastFilterType.Blacklist

        local _ = _G.BallPredictionConn
        local _call832 = game:GetService('RunService').RenderStepped:Connect(function()
            if not _TPS754 or not _TPS754.Parent then return end
            
            -- Simple Ball Prediction Logic
            local Gravity = Vector3.new(0, -workspace.Gravity, 0)
            local Position = _TPS754.Position
            local Velocity = _TPS754.Velocity
            
            -- Update Attachments for beam path
            for i, Attachment in ipairs(_G.BallPredictionAttachments) do
                local Time = i * 0.1 -- 0.1s steps
                local PredPos = Position + (Velocity * Time) + (0.5 * Gravity * Time * Time)
                Attachment.WorldPosition = PredPos
            end
            
            if _G.BallPredictionBeam then
                _G.BallPredictionBeam.Enabled = true
            end
        end)

        _G.BallPredictionConn = _call832
    end,
    Title = 'Ball Predication',
    Desc = '',
})
_call688:Toggle({
    Value = false,
    Callback = function(_839) end,
    Title = 'Block Ball',
    Desc = 'Minecraft ball (it gives some crazy ass react for ball.)',
})
_call688:Section({
    Title = 'CFGS (Recommand using ball collision with it.)',
})
_call688:Button({
    Callback = function(_844, _844_2) end,
    Title = 'Best CFG',
    Desc = '',
})
_call688:Button({
    Callback = function() end,
    Title = 'ZZZZ CFG',
    Desc = '',
})
_call688:Button({
    Callback = function(_850) end,
    Title = 'Inf Dribble CFG',
    Desc = '',
})

local _call852 = _call69:Tab({
    Title = 'Player',
    Icon = 'user',
})

_call852:Section({
    Title = 'Walkspeed',
})
_call852:Toggle({
    Value = false,
    Callback = function(_857, _857_2, _857_3) end,
    Title = 'Enable / Disable Walkspeed',
    Desc = '',
})
_call852:Slider({
    Min = 23,
    Title = 'Set Speed',
    Max = 75,
    Value = 23,
    Callback = function(_860, _860_2, _860_3, _860_4, _860_5) end,
    Rounding = 0,
})
_call852:Section({
    Title = 'Jump Power',
})
_call852:Toggle({
    Value = false,
    Callback = function(v)
        _G.JumpPowerEnabled = v
        local Char = game.Players.LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            if v then
                Char.Humanoid.UseJumpPower = true
                Char.Humanoid.JumpPower = _G.JumpPowerValue or 50
            else
                Char.Humanoid.JumpPower = 50
            end
        end
    end,
    Title = 'Enable / Disable Jumppower',
    Desc = '',
})
_call852:Slider({
    Min = 50,
    Title = 'Set JumpPower',
    Max = 300,
    Value = 50,
    Callback = function(v)
        _G.JumpPowerValue = v
        local Char = game.Players.LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") and _G.JumpPowerEnabled then
            Char.Humanoid.JumpPower = v
        end
    end,
    Rounding = 0,
})
_call852:Section({
    Title = 'Avatar Stolen',
})
game:GetService('Players').LocalPlayer.CharacterAdded:Connect(function(_877, _877_2) end)
_call852:Toggle({
    Value = false,
    Callback = function(_880, _880_2) end,
    Title = 'Enable / Disable Avatar Stolen',
    Desc = '',
})
_call852:Textbox({
    Placeholder = '',
    Title = 'Avatar Stolen',
    Value = '',
    ClearTextOnFocus = false,
    Callback = function(_883, _883_2, _883_3, _883_4) end,
    Desc = '',
})

local _call885 = _call69:Tab({
    Title = 'Sky Changer',
    Icon = 'cloud-cog',
})

_call885:Section({
    Title = 'Sky Changers',
})
game:GetService('Lighting')
_call885:Button({
    Callback = function(_892, _892_2, _892_3) end,
    Title = 'Night Sky',
    Desc = 'Apply night skybox',
})
_call885:Button({
    Callback = function(_895, _895_2, _895_3) end,
    Title = 'Scary Night',
    Desc = 'Dark scary atmosphere',
})
_call885:Button({
    Callback = function(_898, _898_2, _898_3) end,
    Title = 'Sakura Sky',
    Desc = 'Soft pink sakura sky',
})
_call885:Button({
    Callback = function(_901, _901_2, _901_3, _901_4) end,
    Title = 'Galaxy Planets',
    Desc = 'Planets & galaxy theme',
})
_call885:Button({
    Callback = function() end,
    Title = 'Purple Night Sky',
    Desc = 'Purple themed night',
})
_call885:Button({
    Callback = function(_907, _907_2, _907_3) end,
    Title = 'Sunset Orange',
    Desc = 'Orange sunset sky',
})
_call885:Button({
    Callback = function(_910, _910_2, _910_3, _910_4, _910_5) end,
    Title = 'Purple Sky',
    Desc = 'Classic purple sky',
})
_call885:Button({
    Callback = function(_913, _913_2) end,
    Title = 'Gray Sky',
    Desc = 'Foggy gray sky',
})
_call885:Button({
    Callback = function(_916) end,
    Title = 'Mountain Sky',
    Desc = 'Mountain landscape sky',
})
_call885:Button({
    Callback = function(_919, _919_2, _919_3) end,
    Title = 'Pinkie Preppy Sky',
    Desc = 'Cute pink aesthetic sky',
})
_call885:Button({
    Callback = function(_922, _922_2, _922_3, _922_4) end,
    Title = 'Mountain Sky 2',
    Desc = 'Alternate mountain sky',
})
_call885:Button({
    Callback = function(_925, _925_2, _925_3) end,
    Title = 'Sunset Mountain Sky',
    Desc = 'Sunset over mountains',
})
_call69:Notify({
    Time = 4,
    Title = 'v0x dev',
    Desc = 'All components loaded successfully!',
})
