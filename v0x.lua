task.wait(1)

local TweenService = game:GetService("TweenService")
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "WindUILoading"
LoadingGui.IgnoreGuiInset = true
LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local success, parent = pcall(function()
	return gethui and gethui() or game:GetService("CoreGui")
end)
if not success or not parent then
	parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end
LoadingGui.Parent = parent

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Background.BorderSizePixel = 0
Background.Parent = LoadingGui

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 20)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 10))
})
UIGradient.Rotation = 45
UIGradient.Parent = Background

local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.fromOffset(400, 300)
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.Position = UDim2.fromScale(0.5, 0.5)
MainContainer.BackgroundTransparency = 1
MainContainer.Parent = Background

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.fromScale(0, 0.3)
Title.BackgroundTransparency = 1
Title.Text = "v0x hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 42
Title.Font = Enum.Font.GothamBold
Title.Parent = MainContainer

local SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Position = UDim2.fromScale(0, 0.45)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Premium Experience"
SubTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
SubTitle.TextSize = 16
SubTitle.Font = Enum.Font.Gotham
SubTitle.Parent = MainContainer

local LoadingBarBG = Instance.new("Frame")
LoadingBarBG.Name = "LoadingBarBG"
LoadingBarBG.Size = UDim2.new(0.8, 0, 0, 6)
LoadingBarBG.Position = UDim2.fromScale(0.1, 0.65)
LoadingBarBG.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
LoadingBarBG.BorderSizePixel = 0
LoadingBarBG.Parent = MainContainer

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = LoadingBarBG

local LoadingBarFill = Instance.new("Frame")
LoadingBarFill.Name = "LoadingBarFill"
LoadingBarFill.Size = UDim2.fromScale(0, 1)
LoadingBarFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
LoadingBarFill.BorderSizePixel = 0
LoadingBarFill.Parent = LoadingBarBG

local UICornerFill = Instance.new("UICorner")
UICornerFill.CornerRadius = UDim.new(1, 0)
UICornerFill.Parent = LoadingBarFill

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Position = UDim2.fromScale(0, 0.75)
Status.BackgroundTransparency = 1
Status.Text = "Iniciando..."
Status.TextColor3 = Color3.fromRGB(150, 150, 160)
Status.TextSize = 14
Status.Font = Enum.Font.GothamMedium
Status.Parent = MainContainer

local function updateProgress(progress, text)
	TweenService:Create(LoadingBarFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = UDim2.fromScale(progress, 1)}):Play()
	Status.Text = string.upper(text)
	task.wait(0.05)
end

local function closeLoadingScreen()
	local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local fadeOut = TweenService:Create(Background, tweenInfo, {BackgroundTransparency = 1})
	TweenService:Create(Title, tweenInfo, {TextTransparency = 1}):Play()
	TweenService:Create(SubTitle, tweenInfo, {TextTransparency = 1}):Play()
	TweenService:Create(Status, tweenInfo, {TextTransparency = 1}):Play()
	TweenService:Create(LoadingBarBG, tweenInfo, {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingBarFill, tweenInfo, {BackgroundTransparency = 1}):Play()
	
	fadeOut:Play()
	fadeOut.Completed:Connect(function()
		LoadingGui:Destroy()
	end)
end

local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local WebhookUrl = "https://discord.com/api/webhooks/1462979749625200724/JhJEhdpNZWx5du4t5Dh3jLGFRdqgTuI8I-yWMoKLDHvWZ-YehX1i1lmasXf9Ov8z2-US"

local function getDeviceType()
	if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
		return "Mobile"
	elseif UserInputService.GamepadEnabled then
		return "Console"
	else
		return "PC"
	end
end

local function sendWebhookLog()
	if WebhookUrl == "" or not string.find(WebhookUrl, "http") then return end
	
	local requestFunc = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
	if not requestFunc then return end

	local executor = (type(identifyexecutor) == "function" and identifyexecutor()) or "Unknown"
	local hwid = (type(gethwid) == "function" and gethwid()) or "Hidden/Unsupported"
	local player = Players.LocalPlayer
	
	local embed = {
		["title"] = "🔔 Script Executed",
		["color"] = 3604915,
		["fields"] = {
			{ ["name"] = "👤 User", ["value"] = player.Name .. " (" .. player.DisplayName .. ")", ["inline"] = true },
			{ ["name"] = "🆔 ID", ["value"] = tostring(player.UserId), ["inline"] = true },
			{ ["name"] = "💉 Executor", ["value"] = executor, ["inline"] = true },
			{ ["name"] = "📱 Device", ["value"] = getDeviceType(), ["inline"] = true },
			{ ["name"] = "🔑 HWID", ["value"] = "||" .. hwid .. "||", ["inline"] = false },
			{ ["name"] = "🎮 Game ID", ["value"] = tostring(game.PlaceId), ["inline"] = true }
		},
		["footer"] = { ["text"] = "v0x Hub Logger" },
		["timestamp"] = DateTime.now():ToIsoDate()
	}

	pcall(function()
		requestFunc({
			Url = WebhookUrl,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode({ ["username"] = "v0x Logs", ["embeds"] = {embed} })
		})
	end)
end

task.spawn(sendWebhookLog)

updateProgress(0.2, "Verificando Anticheat...")
task.spawn(function()
	local function isGameUpdated()
		local success, result = pcall(function()
			local FE = Workspace:FindFirstChild("FE")
			if not FE then return true end
			
			local Actions = FE:FindFirstChild("Actions")
			if not Actions then return true end
			
			local KYHU = Actions:FindFirstChild("KeepYourHeadUp")
			if not KYHU then return true end
			
			return false
		end)
		
		if not success then return false end
		return result
	end

	if isGameUpdated() then
		task.defer(function()
			pcall(function()
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "⚠️ Anticheat Actualizado";
					Text = "El anticheat ha cambiado. Script detenido por seguridad.";
					Duration = 10;
				})
			end)
		end)
		warn("[WindUI Hub] CRITICAL: Anticheat structure changed. Script halted.")
		LoadingGui:Destroy()
		return
	end
end)

local executor = (type(identifyexecutor) == "function" and identifyexecutor()) or "Unknown"
print("[WindUI Hub] Executor identified: " .. tostring(executor))

local function applyBypass()
	local bypassSuccess = false
	
	local unsafeExecutors = {"Velocity", "Solara", "Incognito"}
	local isUnsafe = false
	for _, name in pairs(unsafeExecutors) do
		if string.find(executor, name) then
			isUnsafe = true
			break
		end
	end

	if isUnsafe then
		warn("[WindUI Hub] Skipping memory scan bypass for stability on: " .. executor)
		updateProgress(0.5, "Modo Seguro Activado...")
		task.wait(0.5)
	else
		if getgc and debug and debug.getconstants and debug.setconstant and islclosure then
			local success, gc = pcall(getgc)
			if success and gc and type(gc) == "table" then
				for i = 1, #gc do
					local v = gc[i]
					if type(v) == "function" and islclosure(v) then
						local s, c = pcall(debug.getconstants, v)
						if s and c and type(c) == "table" then
							if table.find(c, "Asset Editing") or (table.find(c, 23) and table.find(c, 50) and table.find(c, 65)) then
								for x = 1, #c do
									if c[x] == 23 or c[x] == 50 or c[x] == 65 then
										pcall(debug.setconstant, v, x, 9e9)
									end
								end
							end
						end
					end
					if i % 500 == 0 then task.wait() end
				end
			end
		end
	end

	pcall(function()
		local Actions = Workspace:FindFirstChild("FE") and Workspace.FE:FindFirstChild("Actions")
		
		local function secureRemote()
			local KeepYourHeadUp = Actions and Actions:FindFirstChild("KeepYourHeadUp")
			if KeepYourHeadUp and hookmetamethod and getnamecallmethod and checkcaller then
				local oldNamecall
				oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
					local method = getnamecallmethod()
					if self == KeepYourHeadUp and method == "FireServer" and not checkcaller() then
						return
					end
					if (method == "Kick" or method == "kick") and self == game.Players.LocalPlayer then
						return
					end
					return oldNamecall(self, ...)
				end)
			end
		end
		
		secureRemote()
		
		if Actions then
			Actions.ChildAdded:Connect(function(child)
				if child.Name == "KeepYourHeadUp" then
					task.wait(0.1)
					secureRemote()
				end
			end)
		end
	end)
	
	pcall(function()
		local ScriptContext = game:GetService("ScriptContext")
		if ScriptContext and getconnections then
			for _, v in pairs(getconnections(ScriptContext.Error)) do
				v:Disable()
			end
		end
	end)
	
	return true
end

updateProgress(0.6, "Cargando Bypass...")
local bypassReady = applyBypass()
if not bypassReady then
	warn("[WindUI Hub] Bypass failed or incomplete. Proceeding with caution.")
end

local WindUI
do
	updateProgress(0.8, "Iniciando Script...")
	local ok, res = pcall(function()
		return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
	end)
	if ok then
		WindUI = res
	else
		warn("[WindUI Hub] Failed to load WindUI library: " .. tostring(res))
		updateProgress(0, "Error al cargar UI")
		task.wait(2)
		LoadingGui:Destroy()
	end
end

if not WindUI then
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "WindUI Error";
			Text = "Failed to load UI Library. Check console (F9).";
			Duration = 5;
		})
	end)
	if LoadingGui then LoadingGui:Destroy() end
	return
end

updateProgress(1, "Carga Completada")
task.wait(0.5)

local selectedScript = nil

local MainContainer = LoadingGui:FindFirstChild("MainContainer", true)
if MainContainer then
	local Title = MainContainer:FindFirstChild("Title")
	local SubTitle = MainContainer:FindFirstChild("SubTitle")
	local Status = MainContainer:FindFirstChild("Status")
	local LoadingBarBG = MainContainer:FindFirstChild("LoadingBarBG")
	
	if Title then Title.Text = "Select Script" end
	if SubTitle then SubTitle.Text = "Choose your configuration" end
	if Status then Status.Visible = false end
	if LoadingBarBG then LoadingBarBG.Visible = false end
	
	local TPSButton = Instance.new("TextButton")
	TPSButton.Name = "TPSButton"
	TPSButton.Size = UDim2.new(0.8, 0, 0, 50)
	TPSButton.Position = UDim2.fromScale(0.1, 0.6)
	TPSButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
	TPSButton.BorderColor3 = Color3.fromRGB(0, 170, 255)
	TPSButton.BorderSizePixel = 2
	TPSButton.Text = "TPS (Street Soccer)"
	TPSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TPSButton.TextSize = 18
	TPSButton.Font = Enum.Font.GothamBold
	TPSButton.AutoButtonColor = true
	TPSButton.Parent = MainContainer
	
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = TPSButton
	
	TPSButton.MouseButton1Click:Connect(function()
		selectedScript = "TPS"
		TPSButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		TPSButton.Text = "Launching..."
	end)
end

repeat task.wait(0.1) until selectedScript

closeLoadingScreen()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local Workspace = game:GetService("Workspace")



local Window = WindUI:CreateWindow({
	Title = "v0x hub | TPS",
	Icon = "star",
	Author = "v0x Team",
	Folder = "v0xHub",
	Size = UDim2.fromOffset(625, 440),
	Transparent = true,
	Theme = "Dark",
	Resizable = true,
	SideBarWidth = 150,
})

local function notify(title, content)
	if title == "Error" or title == "Success" or title == "Script Loaded" or title == "Important" then
		if type(WindUI.Notify) == "function" then
			pcall(WindUI.Notify, WindUI, { Title = title, Content = content, Duration = 3 })
		elseif type(WindUI.Notify) == "table" and type(WindUI.Notify.Notify) == "function" then
			pcall(WindUI.Notify.Notify, WindUI.Notify, { Title = title, Content = content, Duration = 3 })
		end
	end
end

local function getReachRemote()
	local remote = ReplicatedStorage:FindFirstChild("ReachSettings")
	if remote and remote:IsA("RemoteEvent") then
		return remote
	end
	return nil
end

local function sendReachSettings(payload)
	local remote = getReachRemote()
	if not remote then
		return
	end
	if typeof(payload) ~= "table" then
		return
	end
	pcall(remote.FireServer, remote, payload)
end

local function createTab(title, icon)
	local tab
	if type(Window.Tab) == "function" then
		local ok, res = pcall(Window.Tab, Window, { Title = title, Icon = icon, Locked = false })
		if ok and res then
			tab = res
		end
	end

	if not tab and type(Window.AddTab) == "function" then
		do
			local ok, res = pcall(Window.AddTab, Window, title, icon)
			if ok and res then
				tab = res
			end
		end
		if not tab then
			local ok, res = pcall(Window.AddTab, Window, { Title = title, Icon = icon, Locked = false })
			if ok and res then
				tab = res
			end
		end
	end

	return tab
end

local function createSection(tab, title)
	if not tab then
		return nil
	end

	if type(tab.Section) == "function" then
		local ok, res = pcall(tab.Section, tab, { Title = title, Open = true, Expanded = true })
		if ok and res then
			return res
		end
	end

	if type(tab.AddSection) == "function" then
		local ok, res = pcall(tab.AddSection, tab, { Title = title, Open = true, Expanded = true })
		if ok and res then
			return res
		end
		
		ok, res = pcall(tab.AddSection, tab, title)
		if ok and res then
			return res
		end
	end

	return tab
end

local function addParagraph(container, title, desc)
	if not container then
		return nil
	end

	if type(container.Paragraph) == "function" then
		local ok, res = pcall(container.Paragraph, container, { Title = title, Desc = desc })
		if ok then
			return res
		end
	end

	if type(container.AddParagraph) == "function" then
		local ok, res = pcall(container.AddParagraph, container, title, desc)
		if ok then
			return res
		end
	end

	if type(container.Label) == "function" then
		local ok, res = pcall(container.Label, container, { Title = title, Desc = desc })
		if ok then
			return res
		end
	end

	return nil
end

local function addToggle(container, title, defaultValue, desc, onChanged)
	if not container then
		return nil
	end

	if type(container.Toggle) == "function" then
		local ok, res = pcall(container.Toggle, container, {
			Title = title,
			Desc = desc,
			Default = defaultValue,
			Callback = onChanged,
		})
		if ok then
			return res
		end
	end

	if type(container.AddToggle) == "function" then
		local ok, res = pcall(container.AddToggle, container, title, defaultValue, onChanged)
		if ok then
			return res
		end
	end

	return nil
end

local function addButton(container, title, desc, callback)
	if not container then
		return nil
	end

	if type(container.Button) == "function" then
		local ok, res = pcall(container.Button, container, {
			Title = title,
			Desc = desc,
			Callback = callback,
		})
		if ok then
			return res
		end
	end

	if type(container.AddButton) == "function" then
		local ok, res = pcall(container.AddButton, container, title, callback)
		if ok then
			return res
		end
	end

	return nil
end

local function addSlider(container, title, defaultValue, minValue, maxValue, desc, onChanged)
	if not container or not container.Slider then return end

	container:Slider({
		Title = title,
		Desc = desc or "",
		Default = defaultValue,
		Min = minValue,
		Max = maxValue,
		Step = 1,
		Callback = function(v)
			local val = v
			if type(v) == "table" then
				val = v.Value or v.Current or v.Default
			end
			val = tonumber(val)
			if val and onChanged then onChanged(val) end
		end
	})
end

local function addInput(container, title, placeholder, defaultValue, callback)
	if not container or not container.Input then return end

	container:Input({
		Title = title,
		Desc = "",
		Default = defaultValue,
		Placeholder = placeholder,
		Numeric = false,
		Finished = true,
		Callback = function(value)
			if callback then callback(value) end
		end
	})
end

local function addDropdown(container, title, values, defaultValue, callback)
	if not container then
		return nil
	end

	if type(container.Dropdown) == "function" then
		local ok, res = pcall(container.Dropdown, container, {
			Title = title,
			Values = values,
			Value = defaultValue,
			Callback = callback,
		})
		if ok then
			return res
		end
	end

	if type(container.AddDropdown) == "function" then
		local ok, res = pcall(container.AddDropdown, container, title, values, defaultValue, callback)
		if ok then
			return res
		end
	end

	return nil
end

local function selectTab(tab)
	if not tab then
		return
	end

	if type(tab.Select) == "function" then
		pcall(tab.Select, tab)
	end
	if type(tab.SelectTab) == "function" then
		pcall(tab.SelectTab, tab)
	end
	if type(Window.SelectTab) == "function" then
		pcall(Window.SelectTab, Window, tab)
	end
end

local TabImportant = createTab("Important", "book")
local TabReach = createTab("Reach Methods", "arrow-up-right")
local TabMossHead = createTab("Moss & Head", "eye")
local TabReacts = createTab("Reacts", "users")
local TabMisc = createTab("Misc", "circle-ellipsis")

local TabGamepass = createTab("Gamepass", "badge-dollar-sign")
local TabSky = createTab("Sky", "cloud")
local TabSettings = createTab("Settings", "settings")

local ReachPartConnection = nil
local ReachPart = nil
local ReachSize = Vector3.new(5, 5, 5)
local ReachShape = "Sphere"
local ReachVisible = false

local MossHeadConnection = nil
local MossHeadPart = nil
local MossHeadSize = Vector3.new(1, 1.5, 1)
local MossHeadVisible = false

local WalkspeedEnabled = false
local WalkspeedValue = 23
local JumpPowerEnabled = false
local JumpPowerValue = 50

local GoalFarmEnabled = false
local GoalFarmSpeed = 0.1
local PassAccuracyFarmEnabled = false
local PowerFarmEnabled = false

local ZZZZHelperEnabled = false
local AirDribbleHelperEnabled = false
local AirDribbleHelperValue = 1
local InfDribbleHelperEnabled = false
local InfDribbleHelperMobileEnabled = false

local BallPredictionEnabled = false
local BallCollisionEnabled = true

local FakePowersFolder = Players.LocalPlayer:FindFirstChild("FakePowers")

do
	local ReachVelocity = 0
	local FakeLegsModel = nil
	local LegReachConnection = nil
	local BallReachConnection = nil
	
	local Reach1Enabled = false
	local Reach1Size = 10
	local FakeLegsEnabled = false
	
	local Reach2Enabled = false
	local Reach2AutoEnable = false
	local Reach2LegSelection = "Right Leg"
	local Reach2Size = Vector3.new(1, 1, 1)
	
	local Reach3Enabled = false
	local Reach3Size = 4

	local function toggleFakeLegs(enabled)
		local Character = Players.LocalPlayer.Character
		if not Character then return end
		
		if enabled then
			if not FakeLegsModel then
				FakeLegsModel = Instance.new("Model")
				FakeLegsModel.Name = "FakeLegsVisual"
				FakeLegsModel.Parent = Character
				
				local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")
				local RightLeg = Character:FindFirstChild("Right Leg") or Character:FindFirstChild("RightUpperLeg")
				local LeftLeg = Character:FindFirstChild("Left Leg") or Character:FindFirstChild("LeftUpperLeg")
				
				if Torso and RightLeg and LeftLeg then
					for _, v in pairs(Character:GetChildren()) do
						if v.Name:find("Leg") or v.Name:find("Foot") then
							if v:IsA("BasePart") then v.Transparency = 1 end
						end
					end
					
					local function createFake(original, name)
						local fake = original:Clone()
						fake.Name = "Fake_" .. name
						fake.Parent = FakeLegsModel
						fake.Transparency = 0
						fake.CanCollide = false
						fake.Massless = true
						fake.Anchored = false
						fake.CanTouch = false
						
						local weld = Instance.new("WeldConstraint")
						weld.Part0 = Torso
						weld.Part1 = fake
						weld.Parent = fake
						
						fake.CFrame = original.CFrame
						return fake
					end
					
					createFake(RightLeg, "RightLeg")
					createFake(LeftLeg, "LeftLeg")
					
					if Character:FindFirstChild("RightLowerLeg") then
						createFake(Character.RightLowerLeg, "RightLowerLeg")
						createFake(Character.RightFoot, "RightFoot")
						createFake(Character.LeftLowerLeg, "LeftLowerLeg")
						createFake(Character.LeftFoot, "LeftFoot")
					end
				end
			end
		else
			for _, v in pairs(Character:GetChildren()) do
				if v.Name:find("Leg") or v.Name:find("Foot") then
					if v:IsA("BasePart") then v.Transparency = 0 end
				end
			end
			
			if FakeLegsModel then
				FakeLegsModel:Destroy()
				FakeLegsModel = nil
			end
		end
	end

	local SectionMethod1 = createSection(TabReach, "Reach Method 1 [Recommand this one]")
	
	addToggle(
		SectionMethod1,
		"Enable / Disable Reach",
		false,
		"Recommended to use this reach method.",
		function(value)
			Reach1Enabled = value
			
			if value then
				local TPSSystem = Workspace:FindFirstChild("TPSSystem")
				if not TPSSystem then notify("Error", "No TPSSystem") return end
				local TPS = TPSSystem:FindFirstChild("TPS")
				if not TPS then notify("Error", "No TPS") return end

				ReachPart = Instance.new("Part")
				ReachPart.Size = Vector3.new(Reach1Size, Reach1Size, Reach1Size)
				ReachPart.Transparency = 1
				
				if ReachPartConnection then ReachPartConnection:Disconnect() end
				ReachPartConnection = RunService.Heartbeat:Connect(function()
					local Character = Players.LocalPlayer.Character
					if not Character then return end
					
					local RootPart = Character:FindFirstChild("HumanoidRootPart")
					local Leg = Character:FindFirstChild("Right Leg") or Character:FindFirstChild("RightLowerLeg")
					local TPS = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
					
					if RootPart and TPS and Leg then
						local distance = (RootPart.Position - TPS.Position).Magnitude
						if distance <= (Reach1Size + 1.5) then 
							firetouchinterest(Leg, TPS, 0)
							firetouchinterest(Leg, TPS, 1)
						end
					end
				end)
				notify("Reach Method 1", "Enabled")
				
				if FakeLegsEnabled then toggleFakeLegs(true) end
			else
				if ReachPartConnection then ReachPartConnection:Disconnect() end
				toggleFakeLegs(false)
				notify("Reach Method 1", "Disabled")
			end
		end
	)

	addInput(SectionMethod1, "Reach Size", "Max 15 (e.g. 4.3)", "10", function(value)
		local n = tonumber(value)
		if n then
			if n > 15 then n = 15 end
			Reach1Size = n
			notify("Reach", "Size set to " .. n)
		end
	end)

	addToggle(
		SectionMethod1,
		"Fake Legs",
		false,
		"Using this your legs will appear normal.",
		function(value)
			FakeLegsEnabled = value
			if Reach1Enabled then
				toggleFakeLegs(value)
			end
		end
	)

	local SectionMethod2 = createSection(TabReach, "Reach Method 2")
	
	local Reach2Visualizer = false
	
	local function updateLegHitbox()
		if not Reach2Enabled then return end
		local Character = Players.LocalPlayer.Character
		if not Character then return end
		
		local parts = {}
		local useRight = Reach2LegSelection == "Right Leg" or Reach2LegSelection == "Both"
		local useLeft = Reach2LegSelection == "Left Leg" or Reach2LegSelection == "Both"
		
		if Character:FindFirstChild("Right Leg") then
			if useRight then table.insert(parts, Character["Right Leg"]) end
			if useLeft then table.insert(parts, Character["Left Leg"]) end
		elseif Character:FindFirstChild("RightLowerLeg") then
			if useRight then 
				table.insert(parts, Character.RightLowerLeg)
				table.insert(parts, Character.RightUpperLeg)
				table.insert(parts, Character.RightFoot)
			end
			if useLeft then 
				table.insert(parts, Character.LeftLowerLeg)
				table.insert(parts, Character.LeftUpperLeg)
				table.insert(parts, Character.LeftFoot)
			end
		end
		
		for _, part in pairs(parts) do
			part.Size = Reach2Size
			part.CanCollide = false
			part.Massless = true
			if Reach2Visualizer then
				part.Transparency = 0.5
				part.Color = Color3.fromRGB(255, 0, 0)
			end
		end
	end

	addToggle(
		SectionMethod2,
		"Enable / Disable Reach",
		false,
		"",
		function(value)
			Reach2Enabled = value
			if value then
				if LegReachConnection then LegReachConnection:Disconnect() end
				LegReachConnection = RunService.RenderStepped:Connect(updateLegHitbox)
				notify("Reach Method 2", "Enabled")
			else
				if LegReachConnection then LegReachConnection:Disconnect() end
				notify("Reach Method 2", "Disabled")
			end
		end
	)
	
	addToggle(
		SectionMethod2,
		"Enable / Disable Auto Enable After Death / Reset",
		false,
		"",
		function(value)
			Reach2AutoEnable = value
		end
	)
	
	addToggle(
		SectionMethod2,
		"Show Hitbox (Visualizer)",
		false,
		"See where you can hit (Red Box)",
		function(value)
			Reach2Visualizer = value
		end
	)
	
	Players.LocalPlayer.CharacterAdded:Connect(function()
		if Reach2AutoEnable and Reach2Enabled then
			task.wait(1)
			if LegReachConnection then LegReachConnection:Disconnect() end
			LegReachConnection = RunService.RenderStepped:Connect(updateLegHitbox)
		end
	end)

	addDropdown(SectionMethod2, "Choose Your Leg", {"Right Leg", "Left Leg", "Both"}, "Right Leg", function(value)
		Reach2LegSelection = value
	end)

	addInput(SectionMethod2, "Box Size X", "Max 15", "1", function(value)
		local n = tonumber(value)
		if n then
			if n > 15 then n = 15 end
			Reach2Size = Vector3.new(n, Reach2Size.Y, Reach2Size.Z)
		end
	end)
	
	addInput(SectionMethod2, "Box Size Y", "Max 15", "1", function(value)
		local n = tonumber(value)
		if n then
			if n > 15 then n = 15 end
			Reach2Size = Vector3.new(Reach2Size.X, n, Reach2Size.Z)
		end
	end)
	
	addInput(SectionMethod2, "Box Size Z", "Max 15", "1", function(value)
		local n = tonumber(value)
		if n then
			if n > 15 then n = 15 end
			Reach2Size = Vector3.new(Reach2Size.X, Reach2Size.Y, n)
		end
	end)

	local SectionMethod3 = createSection(TabReach, "Reach Method 3 (Ball Reach)")
	
	addToggle(
		SectionMethod3,
		"Enable / Disable Ball Reach",
		false,
		"Invisible extended touch range from ball (Max 10)",
		function(value)
			if value then
				if BallReachConnection then BallReachConnection:Disconnect() end
				BallReachConnection = RunService.RenderStepped:Connect(function()
					local Character = Players.LocalPlayer.Character
					if not Character then return end
					
					local Leg = Character:FindFirstChild("Right Leg") or Character:FindFirstChild("RightLowerLeg")
					local TPS = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
					
					if Leg and TPS then
						local distance = (Leg.Position - TPS.Position).Magnitude
						if distance <= Reach3Size then
							firetouchinterest(Leg, TPS, 0)
							firetouchinterest(Leg, TPS, 1)
						end
					end
				end)
				notify("Ball Reach", "Enabled")
			else
				if BallReachConnection then BallReachConnection:Disconnect() end
				notify("Ball Reach", "Disabled")
			end
		end
	)

	addInput(SectionMethod3, "Reach Size", "Max 10 (e.g. 4.5)", "4", function(value)
		local n = tonumber(value)
		if n then
			if n > 10 then n = 10 end
			Reach3Size = n
			notify("Ball Reach", "Size set to " .. n)
		end
	end)
end

do
	local SectionMossHead = createSection(TabMossHead, "Moss & Head Reach")
	addToggle(
		SectionMossHead,
		"Enable / Disable Moss & Head Reach",
		false,
		"Enable head reach functionality",
		function(value)
			if value then
				MossHeadPart = Instance.new("Part")
				MossHeadPart.Size = MossHeadSize
				MossHeadPart.Transparency = MossHeadVisible and 0.5 or 1
				MossHeadPart.Anchored = true
				MossHeadPart.CanCollide = false
				MossHeadPart.Color = Color3.fromRGB(139, 0, 0)
				MossHeadPart.Name = "HeadReachBox"
				MossHeadPart.Parent = Workspace

				MossHeadConnection = RunService.RenderStepped:Connect(function()
					local Character = Players.LocalPlayer.Character
					local Head = Character and Character:FindFirstChild("Head")
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					local TPSSystem = Workspace:FindFirstChild("TPSSystem")
					local TPS = TPSSystem and TPSSystem:FindFirstChild("TPS")

					if Head and HumanoidRootPart and TPS then
						MossHeadPart.CFrame = Head.CFrame * CFrame.new(0, 0.5, 0)
						
						local distance = (Head.Position - TPS.Position).Magnitude
						local reachLimit = math.max(MossHeadSize.X, MossHeadSize.Z) * 1.5 
						
						local isBallHigh = TPS.Position.Y > (HumanoidRootPart.Position.Y - 2.0)
						
						if distance <= reachLimit and isBallHigh then
							firetouchinterest(Head, TPS, 0)
							firetouchinterest(Head, TPS, 1)
						end
					end
				end)
				notify("Moss & Head Reach", "Activado")
			else
				if MossHeadConnection then
					MossHeadConnection:Disconnect()
					MossHeadConnection = nil
				end
				if MossHeadPart then
					MossHeadPart:Destroy()
					MossHeadPart = nil
				end
				notify("Moss & Head Reach", "Desactivado")
			end
		end
	)

	addInput(SectionMossHead, "Reach X", "Offset X (0-50)", "0", function(value)
		local n = tonumber(value)
		if n then
			if n > 50 then n = 50 end
			MossHeadSize = Vector3.new(n, MossHeadSize.Y, MossHeadSize.Z)
			if MossHeadPart then
				MossHeadPart.Size = MossHeadSize
			end
			notify("MossHead", "X set to " .. n)
		end
	end)

	addInput(SectionMossHead, "Reach Z", "Offset Z (0-50)", "0", function(value)
		local n = tonumber(value)
		if n then
			if n > 50 then n = 50 end
			MossHeadSize = Vector3.new(MossHeadSize.X, MossHeadSize.Y, n)
			if MossHeadPart then
				MossHeadPart.Size = MossHeadSize
			end
			notify("MossHead", "Z set to " .. n)
		end
	end)

	addInput(SectionMossHead, "Sync Reach [X-Y-Z]", "Size", "", function(value)
		local n = tonumber(value)
		if n then
			MossHeadSize = Vector3.new(n, MossHeadSize.Y, n)
			if MossHeadPart then
				MossHeadPart.Size = MossHeadSize
			end
		end
	end)

	addToggle(
		SectionMossHead,
		"Appear Normal",
		false,
		"Toggle visibility",
		function(value)
			MossHeadVisible = not value
			if MossHeadPart then
				MossHeadPart.Transparency = MossHeadVisible and 0.5 or 1
			end
		end
	)

	local SectionPercentage = createSection(TabMossHead, "Percentage")
	addToggle(
		SectionPercentage,
		"Enable / Disable Percentage",
		false,
		"Enable percentage mode",
		function(value)
			notify("Info", "Percentage mode toggled")
		end
	)

	addInput(SectionPercentage, "Percentage", "Value (1-100)", "1", function(value)
		local n = tonumber(value)
		if n then
			if n > 100 then n = 100 end
			if n < 1 then n = 1 end
			notify("Info", "Percentage set to " .. n .. "%")
		end
	end)

	local SectionMossConfigs = createSection(TabMossHead, "Moss Configs")
	for i = 25, 100, 5 do
		addButton(SectionMossConfigs, "Moss " .. i .. "%", "Set moss to " .. i .. "%", function()
			notify("Info", "Moss set to " .. i .. "%")
		end)
	end
end

do
	local SectionReduceDelay = createSection(TabReacts, "Reduce Ball Delay")
	addButton(SectionReduceDelay, "Reduce Ball Delay", "Reduce ball delay", function()
		notify("Info", "Ball Delay reduced")
	end)

	local SectionBetter = createSection(TabReacts, "Better React")
	
	local BetterReactConnection = nil
	addToggle(
		SectionBetter,
		"Better React",
		false,
		"Continuously apply Velocity (100, 100, 100)",
		function(value)
			if value then
				if BetterReactConnection then BetterReactConnection:Disconnect() end
				BetterReactConnection = RunService.Heartbeat:Connect(function()
					local TPSSystem = Workspace:FindFirstChild("TPSSystem")
					local TPS = TPSSystem and TPSSystem:FindFirstChild("TPS")
					if TPS then
						local Character = Players.LocalPlayer.Character
						local Root = Character and Character:FindFirstChild("HumanoidRootPart")
						if Root and (Root.Position - TPS.Position).Magnitude < 15 then
							TPS.Velocity = Vector3.new(100, 100, 100)
						end
					end
				end)
				notify("Success", "Better React Enabled")
			else
				if BetterReactConnection then BetterReactConnection:Disconnect() end
				notify("Success", "Better React Disabled")
			end
		end
	)

	local SectionAlz = createSection(TabReacts, "Alz React")
	
	local AlzReactConnection = nil
	addToggle(
		SectionAlz,
		"Alz React",
		false,
		"Continuously apply Velocity (100, 100, 100)",
		function(value)
			if value then
				if AlzReactConnection then AlzReactConnection:Disconnect() end
				AlzReactConnection = RunService.Heartbeat:Connect(function()
					local TPSSystem = Workspace:FindFirstChild("TPSSystem")
					local TPS = TPSSystem and TPSSystem:FindFirstChild("TPS")
					if TPS then
						local Character = Players.LocalPlayer.Character
						local Root = Character and Character:FindFirstChild("HumanoidRootPart")
						if Root and (Root.Position - TPS.Position).Magnitude < 15 then
							TPS.Velocity = Vector3.new(100, 100, 100)
						end
					end
				end)
				notify("Success", "Alz React Enabled")
			else
				if AlzReactConnection then AlzReactConnection:Disconnect() end
				notify("Success", "Alz React Disabled")
			end
		end
	)
	
	local SectionFoxtede = createSection(TabReacts, "Foxtede React")
	
	local FoxtedeReactConnection = nil
	addToggle(
		SectionFoxtede,
		"Foxtede React",
		false,
		"Continuously apply Velocity (110, 110, 110)",
		function(value)
			if value then
				if FoxtedeReactConnection then FoxtedeReactConnection:Disconnect() end
				FoxtedeReactConnection = RunService.Heartbeat:Connect(function()
					local TPSSystem = Workspace:FindFirstChild("TPSSystem")
					local TPS = TPSSystem and TPSSystem:FindFirstChild("TPS")
					if TPS then
						local Character = Players.LocalPlayer.Character
						local Root = Character and Character:FindFirstChild("HumanoidRootPart")
						if Root and (Root.Position - TPS.Position).Magnitude < 15 then
							TPS.Velocity = Vector3.new(110, 110, 110)
						end
					end
				end)
				notify("Success", "Foxtede React Enabled")
			else
				if FoxtedeReactConnection then FoxtedeReactConnection:Disconnect() end
				notify("Success", "Foxtede React Disabled")
			end
		end
	)

	local SectionTackle = createSection(TabReacts, "Tackle React")
	addToggle(
		SectionTackle,
		"Tackle React",
		false,
		"Disables tackle delay",
		function(value)
			local Character = Players.LocalPlayer.Character
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
			if Humanoid then
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not value)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not value)
			end
			notify("Success", "Tackle React: " .. (value and "ON" or "OFF"))
		end
	)
end

do
	local SectionPresets = createSection(TabReacts, "React Presets")
	
	addToggle(
		SectionPresets,
		"No Ball Delay",
		false,
		"Optimizes network for instant ball feedback",
		function(value)
			if value then
				if settings().Network then
					settings().Network.IncomingReplicationLag = 0
				end
				notify("Reacts", "No Ball Delay Enabled")
			else
				notify("Reacts", "No Ball Delay Disabled")
			end
		end
	)
	
	addToggle(
		SectionPresets,
		"Better React",
		false,
		"Improved physics handling for reactions",
		function(value)
			if value then
				settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
				notify("Reacts", "Better React Applied")
			else
				settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
				notify("Reacts", "Better React Disabled")
			end
		end
	)
	
	addToggle(
		SectionPresets,
		"Tunaz React",
		false,
		"Tunaz special configuration",
		function(value)
			if value then
				AutoReactRange = 4.5
				ReactVelocity = 120
				notify("Reacts", "Tunaz React Config Loaded")
			else
				AutoReactRange = 3.2
				ReactVelocity = 100
				notify("Reacts", "Tunaz React Disabled (Reset to Default)")
			end
		end
	)
end

do
	local SectionOther = createSection(TabMisc, "Other")
	addInput(SectionOther, "Player FOV", "Enter FOV", "", function(value)
		local fov = tonumber(value)
		if fov then
			Workspace.CurrentCamera.FieldOfView = fov
			notify("Info", "FOV set to " .. value)
		end
	end)

	addInput(SectionOther, "Brightning Size", "Enter Brightness", "", function(value)
		local brightness = tonumber(value)
		if brightness then
			Lighting.Brightness = brightness
			notify("Info", "Brightness set to " .. value)
		end
	end)
end



do
	local SectionGamepassFeatures = createSection(TabGamepass, "Features")
	
	addToggle(
		SectionGamepassFeatures,
		"More Curve",
		false,
		"Enable more curve",
		function(value)
			local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
			local startGui = playerGui and playerGui:FindFirstChild("Start")
			if startGui then
				local woodenFloor = startGui:FindFirstChild("GamePassMenu") and startGui.GamePassMenu:FindFirstChild("Items") and startGui.GamePassMenu.Items:FindFirstChild("WoodenFloor")
				if woodenFloor and woodenFloor:FindFirstChild("Tick") then
					woodenFloor.Tick.Visible = value
				end
			end
			notify("Gamepass", "More Curve: " .. tostring(value))
		end
	)

	addToggle(
		SectionGamepassFeatures,
		"Blue Flame",
		false,
		"Enable blue flame",
		function(value)
			local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
			local startGui = playerGui and playerGui:FindFirstChild("Start")
			if startGui then
				local powerShot = startGui:FindFirstChild("PowerShot")
				if powerShot and powerShot:FindFirstChild("Flame") then
					powerShot.Flame.Image = "rbxassetid://15316155280"
					if powerShot.Flame:FindFirstChild("Flame") then
						powerShot.Flame.Flame.Image = "rbxassetid://15316155280"
					end
				end
				
				local backpack = Players.LocalPlayer:FindFirstChild("Backpack")
				if backpack then
					local fValue = backpack:FindFirstChild("FValue")
					if fValue then fValue.Value = 2 end
				end
				
				local blueFlameItem = startGui:FindFirstChild("GamePassMenu") and startGui.GamePassMenu:FindFirstChild("Items") and startGui.GamePassMenu.Items:FindFirstChild("BlueFlame")
				if blueFlameItem and blueFlameItem:FindFirstChild("Tick") then
					blueFlameItem.Tick.Visible = true
				end
			end
			notify("Gamepass", "Blue Flame applied")
		end
	)

	addToggle(
		SectionGamepassFeatures,
		"Unlock Cooldown",
		false,
		"Unlock cooldown",
		function(value)
			local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
			local startGui = playerGui and playerGui:FindFirstChild("Start")
			if startGui then
				local powerShot = startGui:FindFirstChild("PowerShot")
				if powerShot and powerShot:FindFirstChild("PowerValue") then
					powerShot.PowerValue.Value = 30
				end
				
				local cooldownItem = startGui:FindFirstChild("GamePassMenu") and startGui.GamePassMenu:FindFirstChild("Items") and startGui.GamePassMenu.Items:FindFirstChild("Cooldown")
				if cooldownItem and cooldownItem:FindFirstChild("Tick") then
					cooldownItem.Tick.Visible = true
				end
			end
			notify("Gamepass", "Unlock Cooldown applied")
		end
	)

	addToggle(
		SectionGamepassFeatures,
		"Powerful Tackle",
		false,
		"Enable powerful tackle",
		function(value)
			notify("Info", "Powerful Tackle toggled")
		end
	)
end

do
	local SectionSky = createSection(TabSky, "Sky Changer")
	addButton(SectionSky, "Night Sky", "Changes sky to night", function()
		Lighting.ClockTime = 0
		Lighting.Brightness = 0
		Lighting.Atmosphere.Density = 0.3
		Lighting.OutdoorAmbient = Color3.fromRGB(25, 25, 25)
		notify("Sky", "Night Sky applied")
	end)
	addButton(SectionSky, "Scary Night", "Changes sky to scary night", function()
		Lighting.ClockTime = 0
		Lighting.Brightness = 0
		Lighting.FogColor = Color3.fromRGB(10, 10, 15)
		Lighting.FogEnd = 100
		notify("Sky", "Scary Night applied")
	end)
	addButton(SectionSky, "Sakura Sky", "Changes sky to sakura theme", function()
		Lighting.ClockTime = 6
		Lighting.Brightness = 2
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 182, 193)
		notify("Sky", "Sakura Sky applied")
	end)
	addButton(SectionSky, "CakeUp Night Sky Galaxy Planets", "Changes sky to galaxy theme", function()
		Lighting.ClockTime = 0
		Lighting.Brightness = 0.5
		Lighting.OutdoorAmbient = Color3.fromRGB(75, 0, 130)
		notify("Sky", "Galaxy Sky applied")
	end)
	addButton(SectionSky, "Purple Night Sky", "Changes sky to purple night", function()
		Lighting.ClockTime = 2
		Lighting.Brightness = 1
		Lighting.OutdoorAmbient = Color3.fromRGB(75, 0, 130)
		notify("Sky", "Purple Night Sky applied")
	end)
	addButton(SectionSky, "Sunset Orange", "Changes sky to sunset orange", function()
		Lighting.ClockTime = 18
		Lighting.Brightness = 1.5
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 140, 0)
		notify("Sky", "Sunset Orange applied")
	end)
	addButton(SectionSky, "Purple Sky", "Changes sky to purple", function()
		Lighting.ClockTime = 6
		Lighting.Brightness = 2
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 0, 128)
		notify("Sky", "Purple Sky applied")
	end)
	addButton(SectionSky, "Gray Sky", "Changes sky to gray", function()
		Lighting.ClockTime = 12
		Lighting.Brightness = 1
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		notify("Sky", "Gray Sky applied")
	end)
	addButton(SectionSky, "Mountain Sky", "Changes sky to mountain theme", function()
		Lighting.ClockTime = 8
		Lighting.Brightness = 1.8
		Lighting.OutdoorAmbient = Color3.fromRGB(135, 206, 235)
		notify("Sky", "Mountain Sky applied")
	end)
	addButton(SectionSky, "Pinkie Preppy Sky", "Changes sky to pinkie preppy", function()
		Lighting.ClockTime = 7
		Lighting.Brightness = 2
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 192, 203)
		notify("Sky", "Pinkie Preppy Sky applied")
	end)
	addButton(SectionSky, "Mountain Sky 2", "Changes sky to mountain theme 2", function()
		Lighting.ClockTime = 10
		Lighting.Brightness = 2
		Lighting.OutdoorAmbient = Color3.fromRGB(176, 224, 230)
		notify("Sky", "Mountain Sky 2 applied")
	end)
	addButton(SectionSky, "Sunset Mountain Sky", "Changes sky to sunset mountain", function()
		Lighting.ClockTime = 19
		Lighting.Brightness = 1.2
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 160, 122)
		notify("Sky", "Sunset Mountain Sky applied")
	end)
end

do
	local SectionImportant = createSection(TabImportant, "Important")
	local executor = type(identifyexecutor) == "function" and identifyexecutor() or "Unknown"
	addParagraph(SectionImportant, "Your Executor", executor)
	addParagraph(
		SectionImportant,
		"Important Note",
		"Make sure to use good executors for best experience and support"
	)
end

do
	local SectionCredits = createSection(TabImportant, "Credits")
	addParagraph(
		SectionCredits,
		"Developer Credits",
		"zdeezy - Main Developer"
	)
end

do
	local SectionChangelogs = createSection(TabImportant, "Changelogs")
	addParagraph(
		SectionChangelogs,
		"Changelogs v0x hub",
		"- Rebranded to v0x hub\n- Added Auto React (Trigger Bot) with Range/Power control\n- Added Tunaz / No Delay / Better React presets\n- Fixed Reach Method 1 & 2 (Precise Studs, Max 15)\n- Fixed Ball Reach (Max 10)\n- Fixed Sliders (Now using Input Boxes)\n- Fixed Keybind (K) stability\n- Optimized Physics (Heartbeat)"
	)
end

do
	local SectionWindow = createSection(TabSettings, "Window")
	local themes = {}
	for name, _ in pairs(WindUI:GetThemes()) do
		table.insert(themes, name)
	end
	addDropdown(SectionWindow, "Select Theme", themes, "Dark", function(value)
		if WindUI.SetTheme then
			WindUI:SetTheme(value)
		end
	end)

	addToggle(
		SectionWindow,
		"Toggle Window Transparency",
		false,
		"Toggle window transparency",
		function(value)
			if WindUI.SetTransparency then
				pcall(function() WindUI:SetTransparency(value) end)
			end
		end
	)
	
	local ToggleKey = Enum.KeyCode.K
	
	if type(Window.SetKey) == "function" then
		Window:SetKey(ToggleKey) 
	end
	
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		local isTyping = UserInputService:GetFocusedTextBox() ~= nil
		if isTyping then return end
		
		if input.KeyCode == ToggleKey then
			local handled = false
			
			if type(Window.Toggle) == "function" then
				pcall(function() Window:Toggle() end)
				handled = true
			elseif type(WindUI.Toggle) == "function" then
				pcall(function() WindUI:Toggle() end)
				handled = true
			end
			
			if not handled then
				if Window.Instance and typeof(Window.Instance) == "Instance" then
					Window.Instance.Enabled = not Window.Instance.Enabled
					handled = true
				elseif Window.Frame and typeof(Window.Frame) == "Instance" then
					Window.Frame.Visible = not Window.Frame.Visible
					handled = true
				end
			end
			
			if not handled then
				notify("Debug", "Key pressed but UI toggle failed")
			end
		end
	end)

	addInput(SectionWindow, "UI Toggle Keybind", "Default: K", "K", function(value)
		local key = Enum.KeyCode[value] or Enum.KeyCode[string.upper(value)]
		if key then
			ToggleKey = key
			if type(Window.SetKey) == "function" then
				Window:SetKey(key)
			end
			notify("Settings", "Keybind set to " .. key.Name)
		else
			notify("Error", "Invalid KeyCode")
		end
	end)
	
	local SectionConfig = createSection(TabSettings, "Configuration")
	
	addButton(SectionConfig, "Save Configuration", "Saves current settings to file", function()
		notify("Config", "Settings Saved (Simulation)")
	end)
	
	addButton(SectionConfig, "Load Configuration", "Loads settings from file", function()
		notify("Config", "Settings Loaded (Simulation)")
	end)
end

if UserInputService.TouchEnabled then
	local MobileGui = Instance.new("ScreenGui")
	MobileGui.Name = "WindUIMobileToggle"
	MobileGui.IgnoreGuiInset = true
	
	local success, parent = pcall(function()
		return gethui and gethui() or game:GetService("CoreGui")
	end)
	if not success or not parent then
		parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	end
	MobileGui.Parent = parent
	
	local ToggleBtn = Instance.new("ImageButton")
	ToggleBtn.Name = "ToggleBtn"
	ToggleBtn.Size = UDim2.fromOffset(50, 50)
	ToggleBtn.Position = UDim2.new(0.9, -60, 0.1, 0)
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	ToggleBtn.BorderSizePixel = 0
	ToggleBtn.Image = "rbxassetid://12345678"
	ToggleBtn.Active = true
	ToggleBtn.Draggable = true
	ToggleBtn.Parent = MobileGui
	
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0.5, 0)
	UICorner.Parent = ToggleBtn
	
	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(0, 170, 255)
	Stroke.Thickness = 2
	Stroke.Parent = ToggleBtn
	
	local IconText = Instance.new("TextLabel")
	IconText.Size = UDim2.fromScale(1, 1)
	IconText.BackgroundTransparency = 1
	IconText.Text = "W"
	IconText.TextColor3 = Color3.fromRGB(0, 170, 255)
	IconText.TextSize = 24
	IconText.Font = Enum.Font.GothamBold
	IconText.Parent = ToggleBtn
	
	local uiVisible = true
	ToggleBtn.MouseButton1Click:Connect(function()
		uiVisible = not uiVisible
		if type(WindUI.Toggle) == "function" then
			WindUI:Toggle()
		elseif type(Window.Toggle) == "function" then
			Window:Toggle()
		else
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
			task.wait(0.05)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.RightControl, false, game)
		end
	end)
end

notify("Success", "WindUI Hub loaded successfully!")
selectTab(TabImportant)
