



if type(game) ~= "userdata" then
    while true do
        print("NYX antitamper active")
    end
    error("NYX Antitamper")
    return "NYX antitamper"
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer
local MAIN_COLOR = Color3.fromRGB(12, 35, 64)

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BackgroundTransparency = 1
bg.Parent = gui
TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.fromScale(0.31, 0.31)
logo.Position = UDim2.fromScale(0.5, 0.42)
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://111332566639573"
logo.ImageTransparency = 1
logo.Parent = bg
TweenService:Create(logo, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

local barBG = Instance.new("Frame")
barBG.Size = UDim2.fromScale(0.26, 0.01)
barBG.Position = UDim2.fromScale(0.5, 0.585)
barBG.AnchorPoint = Vector2.new(0.5, 0.5)
barBG.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
barBG.BorderSizePixel = 0
barBG.Parent = bg
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.fromScale(0, 1)
barFill.BackgroundColor3 = MAIN_COLOR
barFill.BorderSizePixel = 0
barFill.Parent = barBG
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.fromScale(1, 1)
percentText.BackgroundTransparency = 1
percentText.TextColor3 = Color3.new(1, 1, 1)
percentText.TextScaled = true
percentText.Font = Enum.Font.GothamBold
percentText.Text = "0%"
percentText.Parent = barBG

local status = Instance.new("TextLabel")
status.Size = UDim2.fromScale(1, 0.026)
status.Position = UDim2.fromScale(0.5, 0.625)
status.AnchorPoint = Vector2.new(0.5, 0.5)
status.BackgroundTransparency = 1
status.TextColor3 = MAIN_COLOR
status.TextScaled = true
status.Font = Enum.Font.GothamMedium
status.Text = "LOADING..."
status.Parent = bg

task.spawn(function()
    local messages = {
        "LOADING...",
        "LOADING BYPASS...",
        "SUCCESSFULLY INITIALIZED",
        "ENJOY NYX ."
    }
    for _, msg in ipairs(messages) do
        status.Text = msg
        task.wait(1.25)
    end
end)

local startTime = tick()
local duration = 5
local connection
connection = RunService.RenderStepped:Connect(function()
    local elapsed = tick() - startTime
    local progress = math.clamp(elapsed / duration, 0, 1)
    barFill.Size = UDim2.fromScale(progress, 1)
    percentText.Text = math.floor(progress * 100) .. "%"
    if progress >= 1 then
        connection:Disconnect()
    end
end)

local numDots = 20
local dots = {}
local velocities = {}
for i = 1, numDots do
    local dot = Instance.new("Frame")
    dot.Size = UDim2.fromOffset(6, 6)
    dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
    dot.BackgroundColor3 = MAIN_COLOR
    dot.BackgroundTransparency = 0.3 + math.random() * 0.4
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.BorderSizePixel = 0
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    dot.Parent = bg
    table.insert(dots, dot)
    velocities[dot] = Vector2.new((math.random()-0.5)*0.4, (math.random()-0.5)*0.4)
end

task.spawn(function()
    while bg.Parent do
        for _, dot in ipairs(dots) do
            local vel = velocities[dot]
            local pos = dot.Position
            local x = pos.X.Scale + vel.X * 0.03
            local y = pos.Y.Scale + vel.Y * 0.03
            if x < 0 then vel = Vector2.new(math.abs(vel.X), vel.Y); x = 0 end
            if x > 1 then vel = Vector2.new(-math.abs(vel.X), vel.Y); x = 1 end
            if y < 0 then vel = Vector2.new(vel.X, math.abs(vel.Y)); y = 0 end
            if y > 1 then vel = Vector2.new(vel.X, -math.abs(vel.Y)); y = 1 end
            velocities[dot] = vel
            dot.Position = UDim2.new(x, 0, y, 0)
        end
        task.wait(0.03)
    end
end)

local killCharacterAfterLoader = false

task.delay(5, function()
    TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    task.wait(0.6)
    gui:Destroy()
    task.wait(1)
    if killCharacterAfterLoader and player.Character then
        player.Character:BreakJoints()
    end

    local TS = TweenService
    local UIS = UserInputService
    local CoreGui = game:GetService("CoreGui")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer

    local execCount = 1
    local counterFile = "NYX.txt"
    local counterFileAlt = "nyx.txt"

    local function tryReadNumber(path)
        local readfileFunc = getfenv().readfile or nil
        if not readfileFunc or type(readfileFunc) ~= "function" then return nil end
        local ok, content = pcall(readfileFunc, path)
        if not ok then return nil end
        return tonumber(content)
    end

    local isfileFunc = getfenv().isfile or nil
    if isfileFunc and type(isfileFunc) == "function" then
        if isfileFunc(counterFile) then
            local n = tryReadNumber(counterFile)
            if n then execCount = n + 1 end
        elseif isfileFunc(counterFileAlt) then
            local n = tryReadNumber(counterFileAlt)
            if n then execCount = n + 1 end
        end
    end
    local writefileFunc = getfenv().writefile or nil
    if writefileFunc and type(writefileFunc) == "function" then
        pcall(function()
            writefileFunc(counterFile, tostring(execCount))
        end)
    end

    local executorName = "Unknown"
    local identifyExecutorFunc = getfenv().identifyexecutor or getfenv().getexecutor or nil
    if identifyExecutorFunc and type(identifyExecutorFunc) == "function" then
        local success, result = pcall(identifyExecutorFunc)
        if success and result then
            executorName = result
        end
    end
    local lowerName = string.lower(executorName)
    local isSolara = string.find(lowerName, "solara") ~= nil
    local isXeno = string.find(lowerName, "xeno") ~= nil
    local isSupportedExecutor = isSolara or isXeno

    local isTPSLike = false
    local isRealTPS = false
    local success, productInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if success and productInfo and productInfo.Name then
        local nameUpper = string.upper(productInfo.Name)
        if string.find(nameUpper, "TPS") or string.find(nameUpper, "67") or string.find(nameUpper, "UWU") or string.find(nameUpper, "CRINGE") then
            isTPSLike = true
        end
        if string.sub(nameUpper, 1, 3) == "TPS" then
            isRealTPS = true
        end
    end

    local UI = Instance.new("ScreenGui")
    UI.Name = "KyroMPS"
    UI.ResetOnSpawn = false
    UI.IgnoreGuiInset = true
    
    local success, err = pcall(function()
        UI.Parent = CoreGui
    end)
    if not success then
        local PlayerGui = player:FindFirstChild("PlayerGui")
        if PlayerGui then
            UI.Parent = PlayerGui
        else
            warn("NYX: Could not parent UI to CoreGui or PlayerGui")
            return
        end
    end

    local isMobile = UIS.TouchEnabled or false

    local function computeMainSize()
        local cam = Workspace.CurrentCamera
        local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
        local pad = isMobile and 16 or 40
        local maxW = math.max(320, vp.X - pad)
        local maxH = math.max(260, vp.Y - pad)
        local w = math.min(640, maxW)
        local h = math.min(470, maxH)
        if isMobile then
            local portrait = vp.Y > vp.X
            local targetW = portrait and 0.94 or 0.86
            local targetH = portrait and 0.62 or 0.72
            w = math.min(w, math.floor(vp.X * targetW))
            h = math.min(h, math.floor(vp.Y * targetH))
        end
        return UDim2.fromOffset(w, h)
    end

    local mainSize = computeMainSize()

    local FloatButton = Instance.new("TextButton")
    local floatSize = isMobile and 66 or 60
    FloatButton.Size = UDim2.new(0, floatSize, 0, floatSize)
    FloatButton.AnchorPoint = Vector2.new(1, 0)
    FloatButton.Position = UDim2.new(1, -10, 0, 10)
    FloatButton.BackgroundColor3 = Color3.new(0, 0, 0)
    FloatButton.Text = "NYX"
    FloatButton.TextColor3 = Color3.new(1, 1, 1)
    FloatButton.Font = Enum.Font.GothamBlack
    FloatButton.TextSize = isMobile and 22 or 20
    FloatButton.Visible = false
    FloatButton.ZIndex = 999
    FloatButton.Active = true
    FloatButton.Parent = UI
    Instance.new("UICorner", FloatButton).CornerRadius = UDim.new(1, 0)
    local fbStroke = Instance.new("UIStroke", FloatButton)
    fbStroke.Color = MAIN_COLOR
    fbStroke.Thickness = 2.5
    fbStroke.Transparency = 0.5

    local floatDragging = false
    local floatDragStart
    local floatStartPos

    local function beginFloatDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            floatDragStart = input.Position
            floatStartPos = FloatButton.Position
            floatDragging = false
        end
    end

    local function updateFloatDrag(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and floatDragStart then
            local delta = input.Position - floatDragStart
            if delta.Magnitude > 20 then
                floatDragging = true
                FloatButton.Position = UDim2.new(floatStartPos.X.Scale, floatStartPos.X.Offset + delta.X, floatStartPos.Y.Scale, floatStartPos.Y.Offset + delta.Y)
            end
        end
    end

    local function endFloatDrag(input)
        floatDragStart = nil
        floatStartPos = nil
        floatDragging = false
    end

    FloatButton.InputBegan:Connect(beginFloatDrag)
    FloatButton.InputChanged:Connect(updateFloatDrag)
    FloatButton.InputEnded:Connect(endFloatDrag)

    FloatButton.Activated:Connect(function()
        SetMinimized(false)
    end)

    if UserInputService.TouchEnabled then
        FloatButton.MouseButton1Down:Connect(function()
            if not floatDragging then
                SetMinimized(false)
            end
        end)

        UserInputService.TouchTapInWorld:Connect(function(position, processed)
            if processed then return end
            local guiObjects = Player.PlayerGui:GetGuiObjectsAtPosition(position.X, position.Y)
            for _, obj in ipairs(guiObjects) do
                if obj == FloatButton then
                    SetMinimized(false)
                    break
                end
            end
        end)
    end

    local Main = Instance.new("Frame")
    Main.Size = mainSize
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Position = UDim2.fromScale(0.5, 0.5)
    Main.BackgroundColor3 = Color3.new(0,0,0)
    Main.BackgroundTransparency = 0.15
    Main.ClipsDescendants = true
    Main.Parent = UI
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)
    local mainStroke = Instance.new("UIStroke", Main)
    mainStroke.Color = MAIN_COLOR
    mainStroke.Thickness = 1.5
    mainStroke.Transparency = 0.7

    if isMobile and Workspace.CurrentCamera then
        pcall(function()
            Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
                mainSize = computeMainSize()
                Main.Size = mainSize
                Main.Position = UDim2.fromScale(0.5, 0.5)
            end)
        end)
    end

    local Title = Instance.new("TextLabel")
    Title.AutomaticSize = Enum.AutomaticSize.X
    Title.Size = UDim2.new(0,0,0,40)
    Title.Position = UDim2.new(0.5, 0, 0, 4)
    Title.AnchorPoint = Vector2.new(0.5, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "NYX"
    Title.TextColor3 = MAIN_COLOR
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.Parent = Main
    Title.Active = true

    local TitleStroke = Instance.new("UIStroke", Title)
    TitleStroke.Color = Color3.fromRGB(40,40,40)
    TitleStroke.Thickness = 1.2
    TitleStroke.Transparency = 0.5

    Title.MouseEnter:Connect(function()
        TS:Create(TitleStroke, TweenInfo.new(0.25), {Transparency = 0}):Play()
        TS:Create(Title, TweenInfo.new(0.25), {TextSize = 22}):Play()
    end)
    Title.MouseLeave:Connect(function()
        TS:Create(TitleStroke, TweenInfo.new(0.25), {Transparency = 0.5}):Play()
        TS:Create(Title, TweenInfo.new(0.25), {TextSize = 20}):Play()
    end)

    local TopLeftLogo = Instance.new("ImageLabel")
    TopLeftLogo.Size = UDim2.new(0, 42, 0, 42)
    TopLeftLogo.Position = UDim2.new(0, 12, 0, 6)
    TopLeftLogo.BackgroundTransparency = 1
    TopLeftLogo.Image = "rbxassetid://126523640461668"
    TopLeftLogo.ImageColor3 = Color3.new(1, 1, 1)
    TopLeftLogo.ScaleType = Enum.ScaleType.Fit
    TopLeftLogo.Parent = Main
    TopLeftLogo.Active = true
    TopLeftLogo.ZIndex = 100

    TopLeftLogo.MouseEnter:Connect(function()
        TS:Create(TopLeftLogo, TweenInfo.new(0.2), {Size = UDim2.new(0, 46, 0, 46)}):Play()
    end)
    TopLeftLogo.MouseLeave:Connect(function()
        TS:Create(TopLeftLogo, TweenInfo.new(0.2), {Size = UDim2.new(0, 42, 0, 42)}):Play()
    end)

    local Minimize = Instance.new("TextButton")
    local topBtnSize = isMobile and 42 or 32
    Minimize.Size = UDim2.new(0,topBtnSize,0,topBtnSize)
    Minimize.Position = UDim2.new(1,-(topBtnSize*2 + 8),0,6)
    Minimize.BackgroundTransparency = 1
    Minimize.Text = "-"
    Minimize.TextColor3 = Color3.fromRGB(200,200,200)
    Minimize.Font = Enum.Font.GothamBold
    Minimize.TextSize = isMobile and 30 or 26
    Minimize.Active = true
    Minimize.ZIndex = 100
    Minimize.Parent = Main

    local Close = Instance.new("TextButton")
    Close.Size = UDim2.new(0,topBtnSize,0,topBtnSize)
    Close.Position = UDim2.new(1,-(topBtnSize + 6),0,6)
    Close.BackgroundTransparency = 1
    Close.Text = "X"
    Close.TextColor3 = MAIN_COLOR
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = isMobile and 22 or 19
    Close.Active = true
    Close.ZIndex = 100
    Close.Parent = Main

    local Status = Instance.new("Frame")
    Status.Size = UDim2.new(0,120,0,20)
    Status.Position = UDim2.new(0,14,1,-34)
    Status.BackgroundTransparency = 1
    Status.ZIndex = 10
    Status.Parent = Main

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0,8,0,8)
    Dot.Position = UDim2.new(0,0,0.5,-4)
    Dot.BackgroundColor3 = Color3.fromRGB(255,0,0)
    Dot.ZIndex = 10
    Dot.Parent = Status
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1,0)

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1,-12,1,0)
    StatusLabel.Position = UDim2.new(0,12,0,0)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "NOT CONNECTED"
    StatusLabel.TextColor3 = Color3.fromRGB(255,0,0)
    StatusLabel.Font = Enum.Font.GothamBold
    StatusLabel.TextSize = isMobile and 12 or 10
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.ZIndex = 10
    StatusLabel.Parent = Status

    local dragging = false
    local dragStart, startPos

    local topBarHeight = isMobile and 44 or 48

    local TopBarArea = Instance.new("Frame")
    TopBarArea.Size = UDim2.new(1, 0, 0, topBarHeight)
    TopBarArea.BackgroundTransparency = 1
    TopBarArea.ZIndex = 10
    TopBarArea.Active = true
    TopBarArea.Parent = Main

    local function beginWindowDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            local moveConn
            local endConn
            moveConn = UIS.InputChanged:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
                    local delta = inp.Position - dragStart
                    Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
            endConn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    moveConn:Disconnect()
                    endConn:Disconnect()
                end
            end)
        end
    end

    TopBarArea.InputBegan:Connect(beginWindowDrag)
    Title.InputBegan:Connect(beginWindowDrag)
    TopLeftLogo.InputBegan:Connect(beginWindowDrag)

    local minimized = false
    local function SetMinimized(state)
        minimized = state
        Minimize.Text = state and "+" or "-"
        if state then
            TS:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Quart), {Size = UDim2.new(0,0,0,0)}):Play()
            task.delay(0.36, function() Main.Visible = false end)
            FloatButton.Visible = true
        else
            Main.Visible = true
            FloatButton.Visible = false
            TS:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Quart), {Size = mainSize}):Play()
        end
    end

    Minimize.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            SetMinimized(not minimized)
        end
    end)
    Close.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            UI:Destroy()
        end
    end)

    UIS.InputBegan:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.RightShift then
            SetMinimized(not minimized)
        end
    end)

    local Body = Instance.new("Frame")
    Body.Size = UDim2.new(1,0,1,-topBarHeight)
    Body.Position = UDim2.new(0,0,0,topBarHeight)
    Body.BackgroundTransparency = 1
    Body.Parent = Main

    local function computeSidebarWidth()
        local cam = Workspace.CurrentCamera
        local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
        local base = math.floor(vp.X * 0.18)
        return math.clamp(base, 84, 112)
    end

    local sidebarWidth = isMobile and computeSidebarWidth() or 120

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0,sidebarWidth,1,0)
    Sidebar.BackgroundColor3 = Color3.new(0,0,0)
    Sidebar.BackgroundTransparency = 0.92
    Sidebar.Parent = Body

    local SidebarScroll = Instance.new("ScrollingFrame")
    SidebarScroll.Size = UDim2.new(1,0,1,0)
    SidebarScroll.BackgroundTransparency = 1
    SidebarScroll.ScrollBarThickness = isMobile and 3 or 0
    SidebarScroll.CanvasSize = UDim2.new(0,0,0,0)
    SidebarScroll.Parent = Sidebar

    local blur = Instance.new("BlurEffect")
    blur.Size = 8
    blur.Parent = Sidebar

    local leftShadow = Instance.new("Frame")
    leftShadow.Size = UDim2.new(0,2,1,0)
    leftShadow.BackgroundColor3 = Color3.new(0,0,0)
    leftShadow.BackgroundTransparency = 0.6
    leftShadow.BorderSizePixel = 0
    leftShadow.Parent = Sidebar

    local Content = Instance.new("ScrollingFrame")
    Content.Size = UDim2.new(1,-sidebarWidth,1,0)
    Content.Position = UDim2.new(0,sidebarWidth,0,0)
    Content.BackgroundTransparency = 1
    Content.ScrollBarThickness = isMobile and 3 or 0
    Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Content.Parent = Body

    local TabButtons = {}
    local TabContainers = {}
    local CurrentContainer = nil

    local tabButtonHeight = isMobile and 36 or 34
    local tabButtonSpacing = isMobile and 42 or 40
    local tabButtonX = isMobile and 6 or 7
    local tabButtonHoverX = tabButtonX + 3
    local tabTopOffset = isMobile and 10 or 12

    local function AddTab(name)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1,-(tabButtonX*2),0,tabButtonHeight)
        btn.Position = UDim2.new(0,tabButtonX,0,#TabButtons * tabButtonSpacing + tabTopOffset)
        btn.BackgroundTransparency = 1
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(200,200,220)
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = isMobile and 14 or 13
        btn.Parent = SidebarScroll
        local stroke = Instance.new("UIStroke", btn)
        stroke.Color = Color3.fromRGB(40,40,40)
        stroke.Thickness = 1
        stroke.Transparency = 0.5

        table.insert(TabButtons, btn)

        local cont = Instance.new("Frame")
        cont.Size = UDim2.new(1,0,0,100)
        cont.BackgroundTransparency = 1
        cont.Visible = false
        cont.Parent = Content

        local layout = Instance.new("UIListLayout", cont)
        layout.Padding = UDim.new(0,9)
        layout.FillDirection = Enum.FillDirection.Vertical
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        table.insert(TabContainers, cont)

        btn.MouseEnter:Connect(function()
            if CurrentContainer == cont then return end
            TS:Create(stroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
            TS:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(230,230,240), Position = UDim2.new(0,tabButtonHoverX,btn.Position.Y.Scale,btn.Position.Y.Offset)}):Play()
        end)

        btn.MouseLeave:Connect(function()
            if CurrentContainer == cont then return end
            TS:Create(stroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
            TS:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200,200,220), Position = UDim2.new(0,tabButtonX,btn.Position.Y.Scale,btn.Position.Y.Offset)}):Play()
        end)

        btn.Activated:Connect(function()
            if CurrentContainer then CurrentContainer.Visible = false end
            for _, b in ipairs(TabButtons) do
                b.TextColor3 = Color3.fromRGB(200,200,220)
                local s = b:FindFirstChildOfClass("UIStroke")
                if s then s.Transparency = 0.5 end
            end
            cont.Visible = true
            CurrentContainer = cont
        end)

        return cont
    end

    local HomeTab = AddTab("Home")
    local SolaraLegTab = nil
    local LegTab = nil
    local ArmTab = nil
    local HeadReachTab = nil
    local ReactTab = nil
    local PlayerTab = nil
    local HeadTab = nil

    if isTPSLike and isSupportedExecutor then
        SolaraLegTab = AddTab("R6 Leg Reach")
        HeadReachTab = AddTab("Head Reach")
        ReactTab = AddTab("React")
        PlayerTab = AddTab("Player")
    else
        LegTab = AddTab("Leg Reach")
        ArmTab = AddTab("Arm Reach")
        HeadTab = AddTab("Head Reach")
        if isTPSLike then ReactTab = AddTab("React") end
        PlayerTab = AddTab("Player")
    end

    TabButtons[1].TextColor3 = Color3.fromRGB(200,200,220)
    if TabButtons[1]:FindFirstChildOfClass("UIStroke") then
        TabButtons[1]:FindFirstChildOfClass("UIStroke").Transparency = 0.5
    end
    TabContainers[1].Visible = true
    CurrentContainer = TabContainers[1]

    for i, btn in ipairs(TabButtons) do
        btn.Position = UDim2.new(0,tabButtonX,0,(i-1) * tabButtonSpacing + tabTopOffset)
    end

    do
        local total = (#TabButtons - 1) * tabButtonSpacing + tabTopOffset + tabButtonHeight + 12
        SidebarScroll.CanvasSize = UDim2.new(0, 0, 0, total)
    end

    local Avatar = Instance.new("ImageLabel")
    Avatar.Size = UDim2.new(0,50,0,50)
    Avatar.Position = UDim2.new(0,16,0,16)
    Avatar.BackgroundTransparency = 1
    pcall(function()
        Avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    Avatar.Parent = HomeTab
    Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1,0)

    local Welcome = Instance.new("TextLabel")
    Welcome.Text = "Welcome, " .. player.DisplayName .. "!"
    Welcome.Size = UDim2.new(0,300,0,30)
    Welcome.Position = UDim2.new(0,80,0,26)
    Welcome.BackgroundTransparency = 1
    Welcome.TextColor3 = Color3.new(1,1,1)
    Welcome.Font = Enum.Font.GothamBold
    Welcome.TextSize = 17
    Welcome.TextXAlignment = Enum.TextXAlignment.Left
    Welcome.Parent = HomeTab

    local function HL(txt)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1,-40,0,22)
        l.BackgroundTransparency = 1
        l.Text = txt
        l.TextColor3 = Color3.new(1,1,1)
        l.Font = Enum.Font.Gotham
        l.TextSize = 15
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = HomeTab
        return l
    end

    HL("Executor: " .. executorName)
    HL("Access: free")
    HL("Executed: " .. execCount .. " time(s)")
    HL("Players: " .. #Players:GetPlayers())
    HL("Status: UNDETECTED")
    local gameStatusLabel = HL("Game: Detecting...")
    gameStatusLabel.Text = isTPSLike and "Game: TPS Detected" or "Game: Non-TPS"

    local function CreateToggle(parent, text, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1,-20,0,isMobile and 38 or 32)
        f.BackgroundColor3 = Color3.fromRGB(18,18,18)
        f.BackgroundTransparency = 0.2
        f.Parent = parent
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)

        local l = Instance.new("TextLabel")
        l.Text = text
        l.Size = UDim2.new(1,-70,1,0)
        l.Position = UDim2.new(0,12,0,0)
        l.BackgroundTransparency = 1
        l.TextColor3 = Color3.new(1,1,1)
        l.Font = Enum.Font.GothamSemibold
        l.TextSize = isMobile and 15 or 14
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = f

        local t = Instance.new("Frame")
        local toggleW = isMobile and 52 or 44
        local toggleH = isMobile and 26 or 22
        t.Size = UDim2.new(0,toggleW,0,toggleH)
        t.Position = UDim2.new(1,-(toggleW + 12),0.5,-(toggleH/2))
        t.BackgroundColor3 = Color3.fromRGB(50,50,50)
        t.Parent = f
        Instance.new("UICorner", t).CornerRadius = UDim.new(0,math.floor(toggleH/2))

        local c = Instance.new("Frame")
        local knobSize = isMobile and 22 or 18
        c.Size = UDim2.new(0,knobSize,0,knobSize)
        c.Position = UDim2.new(0,2,0.5,-(knobSize/2))
        c.BackgroundColor3 = Color3.new(1,1,1)
        c.Parent = t
        Instance.new("UICorner", c).CornerRadius = UDim.new(1,0)

        local on = false
        local function render()
            TS:Create(t, TweenInfo.new(0.2), {BackgroundColor3 = on and MAIN_COLOR or Color3.fromRGB(50,50,50)}):Play()
            TS:Create(c, TweenInfo.new(0.2), {Position = on and UDim2.new(1,-(knobSize+2),0.5,-(knobSize/2)) or UDim2.new(0,2,0.5,-(knobSize/2))}):Play()
        end

        local function setState(v, fireCallback)
            if on == v then return end
            on = v
            render()
            if fireCallback then
                callback(on)
            end
        end

        f.Active = true
        f.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                setState(not on, true)
            end
        end)

        return {
            Frame = f,
            Set = function(_, v, fireCallback)
                setState(v, fireCallback == true)
            end,
            Get = function()
                return on
            end,
        }
    end

    local activeSlider = nil
    local sliderInputReady = false

    local function CreateSlider(parent, text, min, max, def, step, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1,-20,0,isMobile and 60 or 52)
        f.BackgroundColor3 = Color3.fromRGB(18,18,18)
        f.BackgroundTransparency = 0.2
        f.Parent = parent
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)

        local l = Instance.new("TextLabel")
        l.Text = text .. ": " .. string.format("%.1f", def)
        l.Size = UDim2.new(1,0,0,22)
        l.Position = UDim2.new(0,12,0,4)
        l.BackgroundTransparency = 1
        l.TextColor3 = Color3.new(1,1,1)
        l.Font = Enum.Font.GothamSemibold
        l.TextSize = isMobile and 15 or 14
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = f

        local s = Instance.new("Frame")
        local barH = isMobile and 8 or 6
        s.Size = UDim2.new(1,-24,0,barH)
        s.Position = UDim2.new(0,12,0,isMobile and 38 or 32)
        s.BackgroundColor3 = Color3.fromRGB(40,40,40)
        s.Parent = f
        Instance.new("UICorner", s).CornerRadius = UDim.new(0,math.floor(barH/2))

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((def-min)/(max-min),0,1,0)
        fill.BackgroundColor3 = MAIN_COLOR
        fill.Parent = s
        Instance.new("UICorner", fill).CornerRadius = UDim.new(0,math.floor(barH/2))

        local knob = Instance.new("Frame")
        local knobPx = isMobile and 20 or 16
        knob.Size = UDim2.new(0,knobPx,0,knobPx)
        knob.Position = UDim2.new((def-min)/(max-min), -(knobPx/2), 0.5, -(knobPx/2))
        knob.BackgroundColor3 = Color3.new(1,1,1)
        knob.Parent = s
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

        local sliderState = {
            bar = s,
            fill = fill,
            knob = knob,
            label = l,
            text = text,
            min = min,
            max = max,
            step = step,
            callback = callback,
            lastVal = def,
        }

        local function setFromX(x)
            local rel = math.clamp((x - sliderState.bar.AbsolutePosition.X) / sliderState.bar.AbsoluteSize.X, 0, 1)
            local val = sliderState.min + rel * (sliderState.max - sliderState.min)
            val = math.floor(val / sliderState.step + 0.5) * sliderState.step

            sliderState.fill.Size = UDim2.new(rel, 0, 1, 0)
            sliderState.knob.Position = UDim2.new(rel, -(knobPx/2), 0.5, -(knobPx/2))
            sliderState.label.Text = sliderState.text .. ": " .. string.format("%.1f", val)

            if val ~= sliderState.lastVal then
                sliderState.lastVal = val
                sliderState.callback(val)
            end
        end

        if not sliderInputReady then
            sliderInputReady = true
            UIS.InputChanged:Connect(function(i)
                local s2 = activeSlider
                if not s2 then return end
                if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
                    s2.setFromX(i.Position.X)
                end
            end)
            UIS.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    activeSlider = nil
                end
            end)
        end

        local function beginDrag(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                activeSlider = { setFromX = setFromX }
                setFromX(i.Position.X)
            end
        end

        s.InputBegan:Connect(beginDrag)
        knob.InputBegan:Connect(beginDrag)
    end

    local autoInfFastKey = Enum.KeyCode.E
    local autoInfFastToggleEnabled = false
    local autoFollowEnabled = false

    local zzzHelperKey = Enum.KeyCode.G
    local zzzHelperToggleEnabled = false
    local zzzHelperEnabled = false
    local zzzMarker = nil
    local originalBallSize = nil

    local airDribbleKey = Enum.KeyCode.K
    local airDribbleHelperToggleEnabled = false
    local airDribbleEnabled = false
    local airDribblePart = nil
    local airDribbleSize = 4.5

    local updateZZZHelper
    local updateAirDribbleHelper

    local function CreateActionButton(parent, labelText, onClick)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -20, 0, isMobile and 38 or 32)
        frame.BackgroundTransparency = 0.4
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.Parent = parent
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 1, -10)
        btn.Position = UDim2.new(0, 5, 0, 5)
        btn.BackgroundTransparency = 0.35
        btn.BackgroundColor3 = MAIN_COLOR
        btn.Text = labelText
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = isMobile and 14 or 13
        btn.TextWrapped = true
        btn.Active = true
        btn.Parent = frame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.Activated:Connect(onClick)
        return btn
    end

    local function CreateKeybindButton(parent, currentKey, labelText, onChange)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -20, 0, 32)
        frame.BackgroundTransparency = 0.4
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.Parent = parent
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 1, -10)
        btn.Position = UDim2.new(0, 5, 0, 5)
        btn.BackgroundTransparency = 0.6
        btn.Text = labelText .. " (Current: " .. currentKey.Name .. ")"
        btn.TextColor3 = Color3.new(0.9, 0.9, 0.9)
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 13
        btn.TextWrapped = true
        btn.Parent = frame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        local isBinding = false
        btn.Activated:Connect(function()
            if isBinding then return end
            isBinding = true
            btn.Text = "Press any key..."
            local conn
            conn = UIS.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    onChange(input.KeyCode)
                    btn.Text = labelText .. " (Current: " .. input.KeyCode.Name .. ")"
                    isBinding = false
                    conn:Disconnect()
                end
            end)
        end)
        return frame
    end

    local ballList = {}
    local ballNames = {AIFA=true,VEF=true,VRF=true,CBM=true,TRS=true,TPS=true,Bomb=true,bomb=true,Ball=true,Football=true,SAML=true,SSS=true,RSA=true,IFF=true,MPS=true}

    local function isBall(p)
        return p:IsA("BasePart") and ballNames[p.Name]
    end

    for _, v in ipairs(Workspace:GetDescendants()) do
        if isBall(v) then table.insert(ballList, v) end
    end

    Workspace.DescendantAdded:Connect(function(v)
        if isBall(v) then table.insert(ballList, v) end
    end)

    Workspace.DescendantRemoving:Connect(function(v)
        for i = #ballList, 1, -1 do
            if ballList[i] == v then table.remove(ballList, i) end
        end
    end)

    local character = player.Character or pcall(function() return player.CharacterAdded:Wait() end) or player.Character
    local headPart, legs, arms = nil, {}, {}

    local legNames = {"LL","RL","Left Leg","Right Leg","Fake_LL","Fake_RL","LeftLowerLeg","LeftUpperLeg","RightLowerLeg","RightUpperLeg","LeftFoot","RightFoot"}
    local armNames = {"LA","RA","Left Arm","Right Arm","Fake_LA","Fake_RA","LeftLowerArm","LeftUpperArm","RightLowerArm","RightUpperArm","LeftHand","RightHand"}

    local function updateLimbs(c)
        if not c then return end
        legs = {}
        arms = {}
        for _, n in ipairs(legNames) do
            local p = c:FindFirstChild(n)
            if p and p:IsA("BasePart") then table.insert(legs, p) end
        end
        for _, n in ipairs(armNames) do
            local p = c:FindFirstChild(n)
            if p and p:IsA("BasePart") then table.insert(arms, p) end
        end
        headPart = c:FindFirstChild("Head") or c:FindFirstChild("H")
    end

    pcall(function() updateLimbs(character) end)

    player.CharacterAdded:Connect(function(c)
        character = c
        task.wait(isMobile and 1.5 or 1)
        pcall(function() updateLimbs(c) end)
    end)

    local legVis, armVis, headVis = nil, nil, nil

    local function makeVis(color)
        local p = Instance.new("Part")
        p.Anchored = true
        p.CanCollide = false
        p.Transparency = 0.65
        p.Material = Enum.Material.ForceField
        p.Color = color
        p.Shape = Enum.PartType.Ball
        p.Size = Vector3.new(1,1,1)
        p.Parent = Workspace
        return p
    end

    local legOn, legX, legY, legZ = false, isMobile and 8 or 3.5, isMobile and 8 or 3.5, isMobile and 8 or 3.5
    local legShow = false
    local armOn, armX, armY, armZ = false, isMobile and 10 or 4, isMobile and 10 or 4, isMobile and 10 or 4
    local armShow = false
    local headOn, headSize = false, 3.5
    local headShow = false

    local legBurst = 1
    local armBurst = 2
    local headBurst = 2

    local reachSmart = true
    local reachPredict = true
    local reachPredictTime = isMobile and 0.08 or 0.05
    local reachUpdateInterval = isMobile and 0.016 or 0.01
    local reachMaxPartsPerBall = isMobile and 8 or 5
    local lastReachUpdate = 0

    local reactBetterSpeed = 2000
    local reactOpSpeed = 2800
    local reactBetterYBoost = 0.5
    local reactImpulse = true

    local fireTouchFunc = nil
    local hasFireTouchInterest = false
    pcall(function()
        if type(firetouchinterest) == "function" then
            fireTouchFunc = firetouchinterest
            hasFireTouchInterest = true
        end
    end)
    if not hasFireTouchInterest then
        pcall(function()
            local env = getfenv(0)
            if env and type(env.firetouchinterest) == "function" then
                fireTouchFunc = env.firetouchinterest
                hasFireTouchInterest = true
            end
        end)
    end
    if not hasFireTouchInterest then
        pcall(function()
            local env = getfenv(1)
            if env and type(env.firetouchinterest) == "function" then
                fireTouchFunc = env.firetouchinterest
                hasFireTouchInterest = true
            end
        end)
    end
    if not hasFireTouchInterest then
        pcall(function()
            local env = getfenv(2)
            if env and type(env.firetouchinterest) == "function" then
                fireTouchFunc = env.firetouchinterest
                hasFireTouchInterest = true
            end
        end)
    end
    if not hasFireTouchInterest and type(debug) == "table" and type(debug.getregistry) == "function" then
        pcall(function()
            local registry = debug.getregistry()
            if registry then
                for _, v in pairs(registry) do
                    if type(v) == "table" and type(v.firetouchinterest) == "function" then
                        fireTouchFunc = v.firetouchinterest
                        hasFireTouchInterest = true
                        break
                    end
                end
            end
        end)
    end
    if not hasFireTouchInterest then
        warn("NYX: firetouchinterest no encontrado. El reach puede no funcionar.")
    end
    local fireTouchSwap = false

    local function fireTouch(a, b, state)
        if not fireTouchFunc then return end
        if not a or not b then return end
        local x, y = a, b
        if fireTouchSwap then
            x, y = b, a
        end
        local ok = pcall(fireTouchFunc, x, y, state)
        if ok then return end
        local ok2 = pcall(fireTouchFunc, y, x, state)
        if ok2 then
            fireTouchSwap = not fireTouchSwap
            return
        end
    end

    local function touchBurst(ball, part, burst)
        if not ball or not part then return end
        if fireTouchFunc then
            for _ = 1, burst do
                fireTouch(ball, part, 0)
                fireTouch(ball, part, 1)
            end
        else
            local originalPos = part.Position
            local originalCFrame = part.CFrame
            local ballPos = ball.Position
            local dir = (ballPos - originalPos).Unit
            local hitPos = ballPos + (originalPos - ballPos).Unit * (ball.Size.Magnitude / 2 + part.Size.Magnitude / 2)
            local velVec = dir * 80
            
            for i = 1, burst do
                pcall(function()
                    part.CFrame = CFrame.new(hitPos, ballPos)
                end)
                
                pcall(function()
                    part.AssemblyLinearVelocity = velVec
                end)
                
                pcall(function()
                    part.Velocity = velVec
                end)
                
                if part.CanCollide then
                    pcall(function()
                        part.CanCollide = false
                        part.CanCollide = true
                    end)
                end
                
                pcall(function()
                    part.CFrame = originalCFrame
                end)
            end
        end
    end

    local lastPartPos = setmetatable({}, {__mode = "k"})
    local lastPartTime = setmetatable({}, {__mode = "k"})

    local function getAssemblyVelocity(p)
        local v = Vector3.zero
        pcall(function() v = p.AssemblyLinearVelocity end)
        if v.Magnitude == 0 then
            pcall(function() v = p.Velocity end)
        end

        local now = os.clock()
        local pos = p.Position
        local lastPos = lastPartPos[p]
        local lastT = lastPartTime[p]

        if lastPos and lastT then
            local dt = now - lastT
            if dt > 0 and dt < 0.35 then
                local derived = (pos - lastPos) / dt
                if derived.Magnitude > v.Magnitude then
                    v = derived
                end
            end
        end

        lastPartPos[p] = pos
        lastPartTime[p] = now
        return v
    end

    local function aabbInside(delta, x, y, z)
        return math.abs(delta.X) <= x and math.abs(delta.Y) <= y and math.abs(delta.Z) <= z
    end

    local function checkRaycastCollision(ball, part, reachX, reachY, reachZ)
        if not ball or not part then return false end
        local ballPos = ball.Position
        local partPos = part.Position
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {player.Character}
        
        local directions = {
            Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0),
            Vector3.new(0, 1, 0), Vector3.new(0, -1, 0),
            Vector3.new(0, 0, 1), Vector3.new(0, 0, -1)
        }
        
        for _, dir in ipairs(directions) do
            local targetPos = partPos + dir * Vector3.new(reachX, reachY, reachZ).Magnitude
            local rayResult = Workspace:Raycast(ballPos, (targetPos - ballPos).Unit * ((targetPos - ballPos).Magnitude + 2), params)
            if rayResult and rayResult.Instance == part then
                return true
            end
        end
        return false
    end

    local function applyReactVelocity(part, desiredVel)
        local curVel = Vector3.zero
        pcall(function() curVel = part.AssemblyLinearVelocity end)
        if curVel.Magnitude == 0 then
            pcall(function() curVel = part.Velocity end)
        end

        pcall(function() part.AssemblyLinearVelocity = desiredVel end)
        pcall(function() part.Velocity = desiredVel end)

        if reactImpulse and part.ApplyImpulse then
            local delta = desiredVel - curVel
            local mass = 1
            pcall(function() mass = part.AssemblyMass end)
            pcall(function() part:ApplyImpulse(delta * mass) end)
        end
    end

    local noBallDelayOn = false
    local betterReactOn = false
    local opReactOn = false
    local attackerReactOn = false
    local midfielderReactOn = false
    local defenderReactOn = false
    local gkReactOn = false
    local currentHook = nil
    local currentHookMode = nil

    local noBallDelayRemotes = {
        KickG1 = true, KickG2 = true, KickC1 = true, KickC2 = true, KickP1 = true, KickP2 = true,
        Tackle = true, Header = true,
        SaveRA = true, SaveLA = true, SaveRL = true, SaveLL = true, SaveT = true,
    }

    local function getLLCL()
        local ch = player.Character
        local hum = ch and ch:FindFirstChildOfClass("Humanoid")
        return hum and hum:FindFirstChild("LLCL")
    end

    local function setLLCLArg(args, llcl)
        if args.n >= 2 then
            args[2] = llcl
        elseif args.n == 1 then
            args[1] = llcl
        else
            args.n = 1
            args[1] = llcl
        end
    end

    local removeHook

    local function installNoBallDelayHook()
        removeHook()
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        currentHook = old
        currentHookMode = "NoBallDelay"
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local args = table.pack(...)
            local method = getnamecallmethod()
            if method == "FireServer" and noBallDelayOn then
                local remoteName = tostring(self)
                if noBallDelayRemotes[remoteName] then
                    local llcl = getLLCL()
                    if llcl then
                        setLLCLArg(args, llcl)
                        return old(self, table.unpack(args, 1, args.n))
                    end
                end
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end

    removeHook = function()
        if currentHook then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            mt.__namecall = currentHook
            setreadonly(mt, true)
            currentHook = nil
            currentHookMode = nil
        end
    end

    if PlayerTab then
        local stealerFrame = Instance.new("Frame")
        stealerFrame.Size = UDim2.new(1, -20, 0, 80)
        stealerFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
        stealerFrame.BackgroundTransparency = 0.2
        stealerFrame.Parent = PlayerTab
        Instance.new("UICorner", stealerFrame).CornerRadius = UDim.new(0,8)

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, 0, 0, 24)
        titleLabel.Position = UDim2.new(0, 12, 0, 8)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = "Avatar Stealer"
        titleLabel.TextColor3 = MAIN_COLOR
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 16
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = stealerFrame

        local inputBox = Instance.new("TextBox")
        inputBox.Size = UDim2.new(0.65, 0, 0, 32)
        inputBox.Position = UDim2.new(0, 12, 0, 38)
        inputBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
        inputBox.TextColor3 = Color3.new(1,1,1)
        inputBox.PlaceholderText = "Enter username here..."
        inputBox.Font = Enum.Font.Gotham
        inputBox.TextSize = 14
        inputBox.ClearTextOnFocus = false
        inputBox.Parent = stealerFrame
        Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0,6)

        local applyBtn = Instance.new("TextButton")
        applyBtn.Size = UDim2.new(0.3, 0, 0, 32)
        applyBtn.Position = UDim2.new(0.68, 0, 0, 38)
        applyBtn.BackgroundColor3 = MAIN_COLOR
        applyBtn.Text = "Apply"
        applyBtn.TextColor3 = Color3.new(1,1,1)
        applyBtn.Font = Enum.Font.GothamBold
        applyBtn.TextSize = 14
        applyBtn.Parent = stealerFrame
        Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0,6)

        local currentStealTarget = nil

        local function RemoveOldAppearance(character)
            for _, v in ipairs(character:GetChildren()) do
                if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") or v:IsA("ShirtGraphic") then
                    v:Destroy()
                end
            end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local emptyDesc = Instance.new("HumanoidDescription")
                humanoid:ApplyDescriptionClientServer(emptyDesc)
            end
        end

        local function ApplyAvatarSteal(character, username)
            if not character or not username or username == "" then return end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then
                task.delay(0.6, function() ApplyAvatarSteal(character, username) end)
                return
            end
            RemoveOldAppearance(character)
            task.spawn(function()
                local success, result = pcall(function()
                    local userId = Players:GetUserIdFromNameAsync(username)
                    local desc = Players:GetHumanoidDescriptionFromUserId(userId)
                    humanoid:ApplyDescriptionClientServer(desc)
                end)
                if success then
                    currentStealTarget = username
                    print("[Avatar Stealer] Applied @" .. username .. " avatar!")
                else
                    warn("[Avatar Stealer] Failed for @" .. username .. " → " .. tostring(result))
                end
            end)
        end

        player.CharacterAdded:Connect(function(char)
            task.wait(0.8)
            if currentStealTarget then
                ApplyAvatarSteal(char, currentStealTarget)
            end
        end)

        applyBtn.Activated:Connect(function()
            local username = inputBox.Text:gsub("^%s*(.-)%s*$", "%1")
            if username ~= "" and player.Character then
                ApplyAvatarSteal(player.Character, username)
            end
        end)

        applyBtn.MouseEnter:Connect(function()
            TS:Create(applyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 169, 255)}):Play()
        end)

        applyBtn.MouseLeave:Connect(function()
            TS:Create(applyBtn, TweenInfo.new(0.2), {BackgroundColor3 = MAIN_COLOR}):Play()
        end)

        local autoInfQuickBtn, zzzQuickBtn, airDribbleQuickBtn

        CreateToggle(PlayerTab, "Auto Inf Fast", function(enabled)
            autoInfFastToggleEnabled = enabled
            if not enabled then
                autoFollowEnabled = false
            end
            if isMobile and autoInfQuickBtn then
                autoInfQuickBtn.Text = "Auto Inf Fast: " .. (autoFollowEnabled and "ON" or "OFF")
            end
        end)

        if isMobile then
            autoInfQuickBtn = CreateActionButton(PlayerTab, "Auto Inf Fast: OFF", function()
                if autoInfFastToggleEnabled then
                    autoFollowEnabled = not autoFollowEnabled
                else
                    autoFollowEnabled = false
                end
                autoInfQuickBtn.Text = "Auto Inf Fast: " .. (autoFollowEnabled and "ON" or "OFF")
            end)
        else
            CreateKeybindButton(PlayerTab, autoInfFastKey, "Auto Inf Fast Keybind", function(newKey)
                autoInfFastKey = newKey
            end)
        end

        updateZZZHelper = function(enabled)
            zzzHelperEnabled = enabled
            local tpsSystem = Workspace:FindFirstChild("TPSSystem")
            if not tpsSystem then return end
            local Ball = tpsSystem:FindFirstChild("TPS")
            if not Ball then return end
            if enabled then
                if not originalBallSize then
                    originalBallSize = Ball.Size
                end
                Ball.Size = Vector3.new(2.89, 2.89, 2.89)
                if not zzzMarker then
                    zzzMarker = Instance.new("Part")
                    zzzMarker.Name = "TPS"
                    zzzMarker.Size = Vector3.new(5, 0, 5)
                    zzzMarker.Anchored = true
                    zzzMarker.Transparency = 1
                    zzzMarker.Parent = Ball.Parent
                end
            else
                if originalBallSize then
                    Ball.Size = originalBallSize
                end
                if zzzMarker then
                    zzzMarker:Destroy()
                    zzzMarker = nil
                end
            end
            if isMobile and zzzQuickBtn then
                zzzQuickBtn.Text = "ZZZ Helper: " .. (zzzHelperEnabled and "ON" or "OFF")
            end
        end

        CreateToggle(PlayerTab, "ZZZ Helper", function(enabled)
            zzzHelperToggleEnabled = enabled
            if enabled then
                updateZZZHelper(true)
            else
                updateZZZHelper(false)
            end
        end)

        if isMobile then
            zzzQuickBtn = CreateActionButton(PlayerTab, "ZZZ Helper: OFF", function()
                if zzzHelperToggleEnabled then
                    updateZZZHelper(not zzzHelperEnabled)
                else
                    updateZZZHelper(false)
                end
            end)
        else
            CreateKeybindButton(PlayerTab, zzzHelperKey, "ZZZ Helper Keybind", function(newKey)
                zzzHelperKey = newKey
            end)
        end

        updateAirDribbleHelper = function(enabled)
            airDribbleEnabled = enabled
            if enabled then
                local tpsSystem = workspace:FindFirstChild("TPSSystem")
                if not tpsSystem then return end
                local ball = tpsSystem:FindFirstChild("TPS")
                if not ball then return end
                if not airDribblePart or not airDribblePart.Parent then
                    airDribblePart = Instance.new("Part")
                    airDribblePart.Name = "AirDribbleHelper"
                    airDribblePart.Size = Vector3.new(airDribbleSize, 0.001, airDribbleSize)
                    airDribblePart.Transparency = 1
                    airDribblePart.CanCollide = true
                    airDribblePart.Anchored = true
                    airDribblePart.Massless = true
                    airDribblePart.Parent = ball
                end
                task.spawn(function()
                    while airDribblePart and airDribblePart.Parent and airDribbleEnabled do
                        if ball and ball.Parent then
                            local pos = ball.Position
                            local sizeY = ball.Size.Y
                            airDribblePart.CFrame = CFrame.new(pos.X, pos.Y - sizeY/2, pos.Z)
                        end
                        task.wait()
                    end
                end)
            else
                if airDribblePart then
                    airDribblePart:Destroy()
                    airDribblePart = nil
                end
            end
            if isMobile and airDribbleQuickBtn then
                airDribbleQuickBtn.Text = "Air Dribble: " .. (airDribbleEnabled and "ON" or "OFF")
            end
        end

        CreateToggle(PlayerTab, "Air Dribble Helper", function(enabled)
            airDribbleHelperToggleEnabled = enabled
            updateAirDribbleHelper(enabled)
        end)

        if isMobile then
            airDribbleQuickBtn = CreateActionButton(PlayerTab, "Air Dribble: OFF", function()
                if airDribbleHelperToggleEnabled then
                    updateAirDribbleHelper(not airDribbleEnabled)
                else
                    updateAirDribbleHelper(false)
                end
            end)
        else
            CreateKeybindButton(PlayerTab, airDribbleKey, "Air Dribble Helper Keybind", function(newKey)
                airDribbleKey = newKey
            end)
        end

        CreateSlider(PlayerTab, "Air Dribble Size", 1, 12, airDribbleSize, 0.5, function(value)
            airDribbleSize = value
            if airDribblePart and airDribblePart.Parent then
                airDribblePart.Size = Vector3.new(value, 0.001, value)
            end
        end)
    end

    if ReactTab then
        local NoBallDelayToggle = CreateToggle(ReactTab, "No Ball Delay", function(v)
            noBallDelayOn = v
            if v then
                if not (attackerReactOn or midfielderReactOn or defenderReactOn or gkReactOn) then
                    installNoBallDelayHook()
                end
            else
                if currentHookMode == "NoBallDelay" then
                    removeHook()
                end
            end
        end)

        local BetterReactToggle
        local OPReactToggle
        BetterReactToggle = CreateToggle(ReactTab, "Better React", function(on)
            betterReactOn = on
            opReactOn = false
            if on and OPReactToggle then
                OPReactToggle:Set(false, false)
            end
        end)
        OPReactToggle = CreateToggle(ReactTab, "OP React", function(on)
            opReactOn = on
            betterReactOn = false
            if on and BetterReactToggle then
                BetterReactToggle:Set(false, false)
            end
        end)

        local AttackerToggle
        local MidfielderToggle
        local DefenderToggle
        local GKToggle

        AttackerToggle = CreateToggle(ReactTab, "Attacker React", function(on)
            attackerReactOn = on
            if on then
                removeHook()
                local mt = getrawmetatable(game)
                local old = mt.__namecall
                currentHook = old
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(self, ...)
                    local args = table.pack(...)
                    local method = getnamecallmethod()
                    if method == "FireServer" then
                        local remoteName = tostring(self)
                        if noBallDelayOn and noBallDelayRemotes[remoteName] then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                        if remoteName == "KickG1" or remoteName == "KickG2" or remoteName == "KickC1" or remoteName == "KickC2" or remoteName == "KickP1" or remoteName == "KickP2" then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                    end
                    return old(self, ...)
                end)
                setreadonly(mt, true)
            else
                removeHook()
                if noBallDelayOn then
                    installNoBallDelayHook()
                end
            end
            if on then
                midfielderReactOn = false
                defenderReactOn = false
                gkReactOn = false
                if MidfielderToggle then MidfielderToggle:Set(false, false) end
                if DefenderToggle then DefenderToggle:Set(false, false) end
                if GKToggle then GKToggle:Set(false, false) end
            end
        end)
        MidfielderToggle = CreateToggle(ReactTab, "Midfielder React", function(on)
            midfielderReactOn = on
            if on then
                removeHook()
                local mt = getrawmetatable(game)
                local old = mt.__namecall
                currentHook = old
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(self, ...)
                    local args = table.pack(...)
                    local method = getnamecallmethod()
                    if method == "FireServer" then
                        local remoteName = tostring(self)
                        if noBallDelayOn and noBallDelayRemotes[remoteName] then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                        if remoteName == "Tackle" or remoteName == "Header" or remoteName == "KickG1" or remoteName == "KickG2" or remoteName == "KickC1" or remoteName == "KickC2" or remoteName == "KickP1" or remoteName == "KickP2" then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                    end
                    return old(self, ...)
                end)
                setreadonly(mt, true)
            else
                removeHook()
                if noBallDelayOn then
                    installNoBallDelayHook()
                end
            end
            if on then
                attackerReactOn = false
                defenderReactOn = false
                gkReactOn = false
                if AttackerToggle then AttackerToggle:Set(false, false) end
                if DefenderToggle then DefenderToggle:Set(false, false) end
                if GKToggle then GKToggle:Set(false, false) end
            end
        end)
        DefenderToggle = CreateToggle(ReactTab, "Defender React", function(on)
            defenderReactOn = on
            if on then
                removeHook()
                local mt = getrawmetatable(game)
                local old = mt.__namecall
                currentHook = old
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(self, ...)
                    local args = table.pack(...)
                    local method = getnamecallmethod()
                    if method == "FireServer" then
                        local remoteName = tostring(self)
                        if noBallDelayOn and noBallDelayRemotes[remoteName] then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                        if remoteName == "Tackle" or remoteName == "Header" then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                    end
                    return old(self, ...)
                end)
                setreadonly(mt, true)
            else
                removeHook()
                if noBallDelayOn then
                    installNoBallDelayHook()
                end
            end
            if on then
                attackerReactOn = false
                midfielderReactOn = false
                gkReactOn = false
                if AttackerToggle then AttackerToggle:Set(false, false) end
                if MidfielderToggle then MidfielderToggle:Set(false, false) end
                if GKToggle then GKToggle:Set(false, false) end
            end
        end)
        GKToggle = CreateToggle(ReactTab, "GK React", function(on)
            gkReactOn = on
            if on then
                removeHook()
                local mt = getrawmetatable(game)
                local old = mt.__namecall
                currentHook = old
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(self, ...)
                    local args = table.pack(...)
                    local method = getnamecallmethod()
                    if method == "FireServer" then
                        local remoteName = tostring(self)
                        if noBallDelayOn and noBallDelayRemotes[remoteName] then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                        if remoteName == "SaveRA" or remoteName == "SaveLA" or remoteName == "SaveRL" or remoteName == "SaveLL" or remoteName == "SaveT" or remoteName == "Tackle" or remoteName == "Header" then
                            local llcl = getLLCL()
                            if llcl then
                                setLLCLArg(args, llcl)
                                return old(self, table.unpack(args, 1, args.n))
                            end
                        end
                    end
                    return old(self, ...)
                end)
                setreadonly(mt, true)
            else
                removeHook()
                if noBallDelayOn then
                    installNoBallDelayHook()
                end
            end
            if on then
                attackerReactOn = false
                midfielderReactOn = false
                defenderReactOn = false
                if AttackerToggle then AttackerToggle:Set(false, false) end
                if MidfielderToggle then MidfielderToggle:Set(false, false) end
                if DefenderToggle then DefenderToggle:Set(false, false) end
            end
        end)
    end

    local lastStatusUpdate = 0
    local statusUpdateInterval = 0.25

    local lastReactUpdate = 0
    local reactUpdateInterval = isMobile and 0.02 or 0.015

    RunService.Heartbeat:Connect(function()
        local TPSSystem = Workspace:FindFirstChild("TPSSystem")
        local tpsBall = TPSSystem and TPSSystem:FindFirstChild("TPS")
        local connected = TPSSystem and (tpsBall ~= nil) or (#ballList > 0)

        local now = os.clock()
        if now - lastStatusUpdate >= statusUpdateInterval then
            lastStatusUpdate = now
            Dot.BackgroundColor3 = connected and MAIN_COLOR or Color3.fromRGB(255,0,0)
            StatusLabel.Text = connected and "CONNECTED" or "NOT CONNECTED"
            StatusLabel.TextColor3 = connected and MAIN_COLOR or Color3.fromRGB(255,0,0)
        end

        local hrp = character and character:FindFirstChild("HumanoidRootPart")

        local reactBall = nil
        if tpsBall and tpsBall:IsA("BasePart") then
            reactBall = tpsBall
        elseif #ballList > 0 then
            if hrp then
                local best, bestD = nil, math.huge
                for _, b in ipairs(ballList) do
                    if b and b.Parent and b:IsA("BasePart") then
                        local d = (b.Position - hrp.Position).Magnitude
                        if d < bestD then
                            bestD = d
                            best = b
                        end
                    end
                end
                reactBall = best
            else
                reactBall = ballList[1]
            end
        end

        if reactBall and (betterReactOn or opReactOn) then
            local nowReact = os.clock()
            if (nowReact - lastReactUpdate) >= reactUpdateInterval then
                lastReactUpdate = nowReact

                local curVel = getAssemblyVelocity(reactBall)

                local baseSpeed = betterReactOn and reactBetterSpeed or reactOpSpeed
                local speed = baseSpeed
                local dir
                if curVel.Magnitude > 4 then
                    dir = curVel.Unit
                elseif hrp then
                    dir = hrp.CFrame.LookVector
                else
                    dir = Vector3.new(1, 0, 0)
                end

                local yBoost = betterReactOn and (reactBetterYBoost * speed) or 0
                local desiredVel = dir * speed + Vector3.new(0, yBoost, 0)
                applyReactVelocity(reactBall, desiredVel)
            end
        end
        if legShow and legVis and #legs > 0 and hrp then
            local sum = Vector3.new()
            for _, l in ipairs(legs) do sum = sum + l.Position end
            local center = sum / #legs
            local offset = hrp.CFrame:PointToObjectSpace(center)
            legVis.CFrame = hrp.CFrame * CFrame.new(offset)
            legVis.Size = Vector3.new(legX*2, legY*2, legZ*2)
            legVis.Shape = Enum.PartType.Block
        end
        if armShow and armVis and #arms > 0 and hrp then
            local sum = Vector3.new()
            for _, a in ipairs(arms) do sum = sum + a.Position end
            local center = sum / #arms
            local offset = hrp.CFrame:PointToObjectSpace(center)
            armVis.CFrame = hrp.CFrame * CFrame.new(offset)
            armVis.Size = Vector3.new(armX*2, armY*2, armZ*2)
            armVis.Shape = Enum.PartType.Block
        end
        if headShow and headVis and headPart then
            headVis.CFrame = headPart.CFrame
            headVis.Size = Vector3.new(headSize * 2, headSize * 2, headSize * 2)
            headVis.Shape = Enum.PartType.Ball
        end

        if (legOn or armOn or headOn) and (#ballList > 0 or tpsBall) then
            local now2 = os.clock()
            if reachUpdateInterval <= 0 or (now2 - lastReachUpdate) >= reachUpdateInterval then
                lastReachUpdate = now2

                local reachMaxSize = 0
                if legOn then reachMaxSize = math.max(reachMaxSize, legX, legY, legZ) end
                if armOn then reachMaxSize = math.max(reachMaxSize, armX, armY, armZ) end
                if headOn then reachMaxSize = math.max(reachMaxSize, headSize) end
                local reachDist = 40 + reachMaxSize * 4
                local reachDistSq = reachDist * reachDist
                local hrpPos = hrp and hrp.Position

                local function processBall(ball)
                    if not ball or not ball.Parent then return end

                    if hrpPos then
                        local dp = ball.Position - hrpPos
                        if (dp.X * dp.X + dp.Y * dp.Y + dp.Z * dp.Z) > reachDistSq then
                            return
                        end
                    end

                    local pos = ball.Position
                    if reachPredict then
                        local vel = getAssemblyVelocity(ball)
                        pos = pos + vel * reachPredictTime
                    end

                    local touchedParts = 0

                    if legOn and #legs > 0 then
                        if reachSmart then
                            for _, l in ipairs(legs) do
                                local delta = pos - l.Position
                                local insideAABB = aabbInside(delta, legX, legY, legZ)
                                local hitByRay = false
                                if not insideAABB or not fireTouchFunc then
                                    hitByRay = checkRaycastCollision(ball, l, legX, legY, legZ)
                                end
                                if insideAABB or hitByRay then
                                    touchBurst(ball, l, legBurst)
                                    touchedParts += 1
                                    if touchedParts >= reachMaxPartsPerBall then break end
                                end
                            end
                        else
                            for _, l in ipairs(legs) do
                                local delta = pos - l.Position
                                local insideAABB = aabbInside(delta, legX, legY, legZ)
                                local hitByRay = false
                                if not insideAABB or not fireTouchFunc then
                                    hitByRay = checkRaycastCollision(ball, l, legX, legY, legZ)
                                end
                                if insideAABB or hitByRay then
                                    touchBurst(ball, l, legBurst)
                                    touchedParts += 1
                                    if touchedParts >= reachMaxPartsPerBall then break end
                                end
                            end
                        end
                    end

                    if armOn and #arms > 0 and touchedParts < reachMaxPartsPerBall then
                        if reachSmart then
                            for _, a in ipairs(arms) do
                                local delta = pos - a.Position
                                local insideAABB = aabbInside(delta, armX, armY, armZ)
                                local hitByRay = false
                                if not insideAABB or not fireTouchFunc then
                                    hitByRay = checkRaycastCollision(ball, a, armX, armY, armZ)
                                end
                                if insideAABB or hitByRay then
                                    touchBurst(ball, a, armBurst)
                                    touchedParts += 1
                                    if touchedParts >= reachMaxPartsPerBall then break end
                                end
                            end
                        else
                            for _, a in ipairs(arms) do
                                local delta = pos - a.Position
                                local insideAABB = aabbInside(delta, armX, armY, armZ)
                                local hitByRay = false
                                if not insideAABB or not fireTouchFunc then
                                    hitByRay = checkRaycastCollision(ball, a, armX, armY, armZ)
                                end
                                if insideAABB or hitByRay then
                                    touchBurst(ball, a, armBurst)
                                    touchedParts += 1
                                    if touchedParts >= reachMaxPartsPerBall then break end
                                end
                            end
                        end
                    end

                    if headOn and headPart and touchedParts < reachMaxPartsPerBall then
                        local d = pos - headPart.Position
                        local insideAABB = (d.X * d.X + d.Y * d.Y + d.Z * d.Z) <= (headSize * headSize)
                        local hitByRay = false
                        if not insideAABB or not fireTouchFunc then
                            hitByRay = checkRaycastCollision(ball, headPart, headSize, headSize, headSize)
                        end
                        if insideAABB or hitByRay then
                            touchBurst(ball, headPart, headBurst)
                            touchedParts += 1
                        end
                    end
                end

                if tpsBall and tpsBall:IsA("BasePart") then
                    processBall(tpsBall)
                end
                for _, ball in ipairs(ballList) do
                    if ball ~= tpsBall then
                        processBall(ball)
                    end
                end
            end
        end
    end)

    UIS.InputBegan:Connect(function(input, gpe)
        if gpe then return end

        if input.KeyCode == autoInfFastKey then
            if autoInfFastToggleEnabled then
                autoFollowEnabled = not autoFollowEnabled
            end
        end

        if input.KeyCode == zzzHelperKey then
            if zzzHelperToggleEnabled then
                zzzHelperEnabled = not zzzHelperEnabled
                updateZZZHelper(zzzHelperEnabled)
            end
        end

        if input.KeyCode == airDribbleKey then
            if airDribbleHelperToggleEnabled then
                if updateAirDribbleHelper then
                    updateAirDribbleHelper(not airDribbleEnabled)
                else
                    airDribbleEnabled = not airDribbleEnabled
                end
            end
        end
    end)

    local lastAutoFollow = 0
    local autoFollowInterval = isMobile and 0.14 or 0.1
    local autoFollowPredictTime = 0.12

    RunService.Heartbeat:Connect(function()
        if not autoFollowEnabled then return end
        local now = os.clock()
        if now - lastAutoFollow < autoFollowInterval then return end
        lastAutoFollow = now

        if player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                local tpsSystem = Workspace:FindFirstChild("TPSSystem")
                if tpsSystem then
                    local ball = tpsSystem:FindFirstChild("TPS")
                    if ball and ball:IsA("BasePart") then
                        local target = ball.Position
                        local vel = getAssemblyVelocity(ball)
                        if vel.Magnitude > 2 then
                            target = target + vel * autoFollowPredictTime
                            target = Vector3.new(target.X, ball.Position.Y, target.Z)
                        end
                        hum:MoveTo(target)
                    end
                end
            end
        end
    end)

    local solaraEnabled = false
    local legReachX, legReachZ = 1, 1
    local visualTransparency = 0
    local fakeLeftLeg, fakeRightLeg = nil, nil
    local headReachEnabled = false
    local headReachX, headReachY, headReachZ = 2, 2, 2
    local originalHeadSize = nil
    local headVisSolara = nil

    local function makeVisualizer(color)
        local p = Instance.new("Part")
        p.Anchored = true
        p.CanCollide = false
        p.Transparency = 0.65
        p.Material = Enum.Material.ForceField
        p.Color = color
        p.Shape = Enum.PartType.Block
        p.Size = Vector3.new(1,1,1)
        p.Parent = Workspace
        return p
    end

    local function applySolaraChanges()
        local char = player.Character
        if not char or char:FindFirstChild("Humanoid").RigType ~= Enum.HumanoidRigType.R6 then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if not originalHeadSize then originalHeadSize = head.Size end
        if solaraEnabled then
            local realLeft = char:FindFirstChild("Left Leg")
            local realRight = char:FindFirstChild("Right Leg")
            if not realLeft or not realRight then return end
            realLeft.Size = Vector3.new(legReachX, 2, legReachZ)
            realRight.Size = Vector3.new(legReachX, 2, legReachZ)
            realLeft.Transparency = 1
            realRight.Transparency = 1
            realLeft.CanCollide = false
            realRight.CanCollide = false
            realLeft.Massless = true
            realRight.Massless = true
            fakeLeftLeg = Instance.new("Part")
            fakeLeftLeg.Name = "Left Leg"
            fakeLeftLeg.Size = Vector3.new(1, 2, 1)
            fakeLeftLeg.Color = realLeft.Color
            fakeLeftLeg.Transparency = visualTransparency
            fakeLeftLeg.CanCollide = false
            fakeLeftLeg.Massless = true
            fakeLeftLeg.CFrame = realLeft.CFrame
            fakeLeftLeg.Parent = char
            local weldL = Instance.new("WeldConstraint", realLeft)
            weldL.Part0 = realLeft
            weldL.Part1 = fakeLeftLeg
            local leftAtt = Instance.new("Attachment", realLeft)
            leftAtt.Name = "LeftFootAttachment"
            leftAtt.Position = Vector3.new(0, -1, 0)

            fakeRightLeg = Instance.new("Part")
            fakeRightLeg.Name = "Right Leg"
            fakeRightLeg.Size = Vector3.new(1, 2, 1)
            fakeRightLeg.Color = realRight.Color
            fakeRightLeg.Transparency = visualTransparency
            fakeRightLeg.CanCollide = false
            fakeRightLeg.Massless = true
            fakeRightLeg.CFrame = realRight.CFrame
            fakeRightLeg.Parent = char
            local weldR = Instance.new("WeldConstraint", realRight)
            weldR.Part0 = realRight
            weldR.Part1 = fakeRightLeg
            local rightAtt = Instance.new("Attachment", realRight)
            rightAtt.Name = "RightFootAttachment"
            rightAtt.Position = Vector3.new(0, -1, 0)
        end
        if headReachEnabled then
            head.Size = Vector3.new(headReachX, headReachY, headReachZ)
            head.CanCollide = false
            head.Massless = true
        end
        task.wait(0.15)
        if solaraEnabled or headReachEnabled then
            hum:ApplyDescription(hum:GetAppliedDescription())
        end
    end

    local function resetSolaraChanges()
        local char = player.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        local realLeft = char:FindFirstChild("Left Leg")
        local realRight = char:FindFirstChild("Right Leg")
        if realLeft then
            realLeft.Size = Vector3.new(1,2,1)
            realLeft.Transparency = 0
            realLeft.CanCollide = true
            realLeft.Massless = false
        end
        if realRight then
            realRight.Size = Vector3.new(1,2,1)
            realRight.Transparency = 0
            realRight.CanCollide = true
            realRight.Massless = false
        end
        if head and originalHeadSize then
            head.Size = originalHeadSize
            head.CanCollide = true
            head.Massless = false
        end
        if fakeLeftLeg then fakeLeftLeg:Destroy() end
        if fakeRightLeg then fakeRightLeg:Destroy() end
        fakeLeftLeg, fakeRightLeg = nil, nil
        originalHeadSize = nil
    end

    if isTPSLike and isSupportedExecutor then
        if SolaraLegTab then
            CreateToggle(SolaraLegTab, "Enable R6 Leg Reach", function(enabled)
                solaraEnabled = enabled
                resetSolaraChanges()
                if enabled then applySolaraChanges() end
            end)
            CreateSlider(SolaraLegTab, "Leg Reach X", 1, 20, 1, 1, function(v)
                legReachX = v
                resetSolaraChanges()
                if solaraEnabled then applySolaraChanges() end
            end)
            CreateSlider(SolaraLegTab, "Leg Reach Z", 1, 20, 1, 1, function(v)
                legReachZ = v
                resetSolaraChanges()
                if solaraEnabled then applySolaraChanges() end
            end)
            CreateSlider(SolaraLegTab, "Visual Legs Transparency", 0, 1, 0, 0.05, function(v)
                visualTransparency = v
                if fakeLeftLeg then fakeLeftLeg.Transparency = v end
                if fakeRightLeg then fakeRightLeg.Transparency = v end
            end)
            local resetBtn = Instance.new("TextButton")
            resetBtn.Size = UDim2.new(1,-20,0,40)
            resetBtn.BackgroundColor3 = MAIN_COLOR
            resetBtn.Text = "Reset All Reach"
            resetBtn.TextColor3 = Color3.new(1,1,1)
            resetBtn.Font = Enum.Font.GothamBold
            resetBtn.TextSize = 15
            resetBtn.Parent = SolaraLegTab
            Instance.new("UICorner", resetBtn).CornerRadius = UDim.new(0,8)
            resetBtn.Activated:Connect(function()
                resetSolaraChanges()
                if solaraEnabled then applySolaraChanges() end
            end)
        end
        if HeadReachTab then
            CreateToggle(HeadReachTab, "Head Reach Enabled", function(v)
                headReachEnabled = v
                resetSolaraChanges()
                if v or solaraEnabled then applySolaraChanges() else resetSolaraChanges() end
            end)
            CreateSlider(HeadReachTab, "Head X Size", 1, 6, 2, 0.1, function(v)
                headReachX = v
                resetSolaraChanges()
                if headReachEnabled or solaraEnabled then applySolaraChanges() end
            end)
            CreateSlider(HeadReachTab, "Head Y Size", 1, 6, 2, 0.1, function(v)
                headReachY = v
                resetSolaraChanges()
                if headReachEnabled or solaraEnabled then applySolaraChanges() end
            end)
            CreateSlider(HeadReachTab, "Head Z Size", 1, 6, 2, 0.1, function(v)
                headReachZ = v
                resetSolaraChanges()
                if headReachEnabled or solaraEnabled then applySolaraChanges() end
            end)
            CreateToggle(HeadReachTab, "Head Visualizer", function(v)
                if v and not headVisSolara then
                    headVisSolara = makeVisualizer(Color3.fromRGB(255,80,80))
                elseif not v and headVisSolara then
                    headVisSolara:Destroy()
                    headVisSolara = nil
                end
            end)
        end
        player.CharacterAdded:Connect(function(newChar)
            task.wait(1)
            if solaraEnabled or headReachEnabled then applySolaraChanges() end
        end)
    end

    if not (isTPSLike and isSupportedExecutor) then
        CreateToggle(LegTab, "Leg Reach Enabled", function(v) legOn = v end)
        CreateSlider(LegTab, "Leg X Reach", 0, isMobile and 25 or 15, isMobile and 8 or 3.5, 0.1, function(v) legX = v end)
        CreateSlider(LegTab, "Leg Y Reach", 0, isMobile and 25 or 15, isMobile and 8 or 3.5, 0.1, function(v) legY = v end)
        CreateSlider(LegTab, "Leg Z Reach", 0, isMobile and 25 or 15, isMobile and 8 or 3.5, 0.1, function(v) legZ = v end)
        CreateSlider(LegTab, "Leg Touch Burst", 1, 5, legBurst, 1, function(v) legBurst = v end)
        CreateToggle(LegTab, "Leg Visualizer", function(v)
            legShow = v
            if v and not legVis then
                legVis = makeVis(MAIN_COLOR)
            elseif not v and legVis then
                legVis:Destroy()
                legVis = nil
            end
        end)
        CreateToggle(ArmTab, "Arm Reach Enabled", function(v) armOn = v end)
        CreateSlider(ArmTab, "Arm X Reach", 0, isMobile and 25 or 10, isMobile and 10 or 4, 0.1, function(v) armX = v end)
        CreateSlider(ArmTab, "Arm Y Reach", 0, isMobile and 25 or 10, isMobile and 10 or 4, 0.1, function(v) armY = v end)
        CreateSlider(ArmTab, "Arm Z Reach", 0, isMobile and 25 or 10, isMobile and 10 or 4, 0.1, function(v) armZ = v end)
        CreateSlider(ArmTab, "Arm Touch Burst", 1, 8, armBurst, 1, function(v) armBurst = v end)
        CreateToggle(ArmTab, "Arm Visualizer", function(v)
            armShow = v
            if v and not armVis then
                armVis = makeVis(Color3.fromRGB(255,170,0))
            elseif not v and armVis then
                armVis:Destroy()
                armVis = nil
            end
        end)
        CreateToggle(HeadTab, "Head Reach Enabled", function(v) headOn = v end)
        CreateSlider(HeadTab, "Head Reach Size", 1, 5, 3.5, 0.25, function(v) headSize = v end)
        CreateSlider(HeadTab, "Head Touch Burst", 1, 5, headBurst, 1, function(v) headBurst = v end)
        CreateToggle(HeadTab, "Head Visualizer", function(v)
            headShow = v
            if v and not headVis then
                headVis = makeVis(Color3.fromRGB(255,80,80))
            elseif not v and headVis then
                headVis:Destroy()
                headVis = nil
            end
        end)
    end

    if player.Character and isTPSLike and isSupportedExecutor then
        applySolaraChanges()
    end

    task.spawn(function()
        if not isRealTPS then
            return
        end
        
        local fe = workspace:FindFirstChild("FE")
        local a = fe and fe:FindFirstChild("Actions")
        if not a then
            local lp = game.Players.LocalPlayer
            if lp then
                lp:Kick("Anti-Cheat Updated! Send a photo of this Message in our Discord Server or alert a developer so we can fix it.")
            end
            return
        end
        if a:FindFirstChild("KeepYourHeadUp_") then
            a.KeepYourHeadUp_:Destroy()
            local r = Instance.new("RemoteEvent")
            r.Name = "KeepYourHeadUp_"
            r.Parent = a
        else
            game.Players.LocalPlayer:Kick("Anti-Cheat Updated! Send a photo of this Message in our Discord Server or alert a developer so we can fix it.")
        end
    end)
end)
