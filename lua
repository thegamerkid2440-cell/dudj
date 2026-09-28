--========================================================--
-- THEGAMERKID24300
-- TINY FLOATING MOBILE MENU
-- FOR YOUR OWN ROBLOX STUDIO GAME
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--========================================================--
-- SETTINGS
--========================================================--

local Settings = {
	AimAssist = false,
	ESP = false,

	TeamCheck = true,
	WallCheck = true,
	AliveCheck = true,

	FOV = 80,
	Smoothness = 0.18,

	TargetPart = "Head"
}

--========================================================--
-- GUI
--========================================================--

local Gui = Instance.new("ScreenGui")
Gui.Name = "thegamerkid24300"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

--========================================================--
-- TINY BUTTON
--========================================================--

local Tiny = Instance.new("TextButton")
Tiny.Name = "TinyButton"
Tiny.Size = UDim2.fromOffset(45,45)
Tiny.Position = UDim2.new(1,-60,0.5,-22)
Tiny.BackgroundColor3 = Color3.fromRGB(18,18,21)
Tiny.BorderSizePixel = 0
Tiny.Text = "TG"
Tiny.TextColor3 = Color3.fromRGB(255,255,255)
Tiny.TextSize = 14
Tiny.Font = Enum.Font.GothamBold
Tiny.AutoButtonColor = true
Tiny.Parent = Gui

local TinyCorner = Instance.new("UICorner")
TinyCorner.CornerRadius = UDim.new(0,12)
TinyCorner.Parent = Tiny

local TinyStroke = Instance.new("UIStroke")
TinyStroke.Color = Color3.fromRGB(90,90,95)
TinyStroke.Thickness = 1.5
TinyStroke.Parent = Tiny

--========================================================--
-- COMPACT MENU
--========================================================--

local Menu = Instance.new("Frame")
Menu.Name = "CompactMenu"
Menu.Size = UDim2.fromOffset(225,255)
Menu.BackgroundColor3 = Color3.fromRGB(7,7,9)
Menu.BorderSizePixel = 0
Menu.Visible = false
Menu.Parent = Gui

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0,15)
MenuCorner.Parent = Menu

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Color = Color3.fromRGB(48,48,53)
MenuStroke.Thickness = 1.5
MenuStroke.Parent = Menu

--========================================================--
-- MENU HEADER
--========================================================--

local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1,-45,0,38)
Header.Position = UDim2.fromOffset(10,3)
Header.BackgroundTransparency = 1
Header.Text = "thegamerkid24300"
Header.TextColor3 = Color3.fromRGB(255,255,255)
Header.TextSize = 14
Header.Font = Enum.Font.GothamBold
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.Parent = Menu

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(30,30)
Close.Position = UDim2.new(1,-36,0,5)
Close.BackgroundColor3 = Color3.fromRGB(45,45,48)
Close.Text = "×"
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.TextSize = 21
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = true
Close.Parent = Menu

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,9)
CloseCorner.Parent = Close

--========================================================--
-- BUTTON CREATOR
--========================================================--

local function MakeButton(text, x, y, width)

	local button = Instance.new("TextButton")

	button.Size = UDim2.fromOffset(width or 100,36)
	button.Position = UDim2.fromOffset(x,y)

	button.BackgroundColor3 = Color3.fromRGB(38,38,42)
	button.BorderSizePixel = 0

	button.Text = text
	button.TextColor3 = Color3.fromRGB(245,245,245)
	button.TextSize = 12
	button.Font = Enum.Font.Gotham

	button.AutoButtonColor = true
	button.Parent = Menu

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,9)
	corner.Parent = button

	return button
end

--========================================================--
-- MAIN CONTROLS
--========================================================--

local AimButton =
	MakeButton("Aim: OFF",8,43,100)

local ESPButton =
	MakeButton("ESP: OFF",117,43,100)

local TeamButton =
	MakeButton("Team: ON",8,85,100)

local WallButton =
	MakeButton("Wall: ON",117,85,100)

local AliveButton =
	MakeButton("Alive: ON",8,127,100)

local TargetButton =
	MakeButton("Head",117,127,100)

--========================================================--
-- FOV
--========================================================--

local FOVLabel = Instance.new("TextLabel")
FOVLabel.Size = UDim2.fromOffset(65,20)
FOVLabel.Position = UDim2.fromOffset(8,170)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV: 80"
FOVLabel.TextColor3 = Color3.fromRGB(255,255,255)
FOVLabel.TextSize = 12
FOVLabel.Font = Enum.Font.Gotham
FOVLabel.TextXAlignment = Enum.TextXAlignment.Left
FOVLabel.Parent = Menu

local FOVBar = Instance.new("Frame")
FOVBar.Size = UDim2.fromOffset(145,8)
FOVBar.Position = UDim2.fromOffset(72,176)
FOVBar.BackgroundColor3 = Color3.fromRGB(55,55,59)
FOVBar.BorderSizePixel = 0
FOVBar.Parent = Menu

local FOVBarCorner = Instance.new("UICorner")
FOVBarCorner.CornerRadius = UDim.new(1,0)
FOVBarCorner.Parent = FOVBar

local FOVKnob = Instance.new("Frame")
FOVKnob.Size = UDim2.fromOffset(16,16)
FOVKnob.AnchorPoint = Vector2.new(.5,.5)
FOVKnob.Position = UDim2.new(
	(Settings.FOV-30)/170,
	0,.5,0
)
FOVKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
FOVKnob.BorderSizePixel = 0
FOVKnob.Parent = FOVBar

local FOVKnobCorner = Instance.new("UICorner")
FOVKnobCorner.CornerRadius = UDim.new(1,0)
FOVKnobCorner.Parent = FOVKnob

--========================================================--
-- SMOOTHNESS
--========================================================--

local SmoothLabel = Instance.new("TextLabel")
SmoothLabel.Size = UDim2.fromOffset(65,20)
SmoothLabel.Position = UDim2.fromOffset(8,202)
SmoothLabel.BackgroundTransparency = 1
SmoothLabel.Text = "Smooth: 18%"
SmoothLabel.TextColor3 = Color3.fromRGB(255,255,255)
SmoothLabel.TextSize = 12
SmoothLabel.Font = Enum.Font.Gotham
SmoothLabel.TextXAlignment = Enum.TextXAlignment.Left
SmoothLabel.Parent = Menu

local SmoothBar = Instance.new("Frame")
SmoothBar.Size = UDim2.fromOffset(145,8)
SmoothBar.Position = UDim2.fromOffset(72,208)
SmoothBar.BackgroundColor3 = Color3.fromRGB(55,55,59)
SmoothBar.BorderSizePixel = 0
SmoothBar.Parent = Menu

local SmoothBarCorner = Instance.new("UICorner")
SmoothBarCorner.CornerRadius = UDim.new(1,0)
SmoothBarCorner.Parent = SmoothBar

local SmoothKnob = Instance.new("Frame")
SmoothKnob.Size = UDim2.fromOffset(16,16)
SmoothKnob.AnchorPoint = Vector2.new(.5,.5)
SmoothKnob.Position = UDim2.new(
	Settings.Smoothness,
	0,.5,0
)
SmoothKnob.BackgroundColor3 = Color3.fromRGB(255,255,255)
SmoothKnob.BorderSizePixel = 0
SmoothKnob.Parent = SmoothBar

local SmoothKnobCorner = Instance.new("UICorner")
SmoothKnobCorner.CornerRadius = UDim.new(1,0)
SmoothKnobCorner.Parent = SmoothKnob

--========================================================--
-- FPS
--========================================================--

local FPS = Instance.new("TextLabel")
FPS.Size = UDim2.fromOffset(65,25)
FPS.Position = UDim2.new(1,-75,0,10)
FPS.BackgroundColor3 = Color3.fromRGB(12,12,15)
FPS.Text = "FPS: 0"
FPS.TextColor3 = Color3.fromRGB(255,255,255)
FPS.TextSize = 12
FPS.Font = Enum.Font.GothamBold
FPS.Parent = Gui

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0,8)
FPSCorner.Parent = FPS

local frames = 0
local lastFPS = os.clock()

RunService.RenderStepped:Connect(function()

	frames += 1

	local now = os.clock()

	if now - lastFPS >= 1 then

		FPS.Text = "FPS: "..frames

		frames = 0
		lastFPS = now

	end

end)

--========================================================--
-- OPEN MENU BASED ON BUTTON LOCATION
--========================================================--

local function PositionMenu()

	local cameraSize = Camera.ViewportSize

	local buttonPosition = Tiny.AbsolutePosition
	local buttonSize = Tiny.AbsoluteSize

	local centerX =
		buttonPosition.X + buttonSize.X/2

	local centerY =
		buttonPosition.Y + buttonSize.Y/2

	local menuWidth = Menu.AbsoluteSize.X
	local menuHeight = Menu.AbsoluteSize.Y

	local x
	local y

	-- Horizontal direction
	if centerX < cameraSize.X/2 then

		-- Button is on left.
		-- Menu opens to the right.

		x = buttonPosition.X + buttonSize.X + 8

	else

		-- Button is on right.
		-- Menu opens to the left.

		x = buttonPosition.X - menuWidth - 8

	end

	-- Vertical direction
	if centerY < cameraSize.Y/2 then

		y = buttonPosition.Y

	else

		y = buttonPosition.Y +
			buttonSize.Y -
			menuHeight

	end

	-- Keep menu on screen.
	x = math.clamp(
		x,
		5,
		cameraSize.X-menuWidth-5
	)

	y = math.clamp(
		y,
		5,
		cameraSize.Y-menuHeight-5
	)

	Menu.Position =
		UDim2.fromOffset(x,y)

end

--========================================================--
-- OPEN / CLOSE
--========================================================--

Tiny.Activated:Connect(function()

	if Menu.Visible then

		Menu.Visible = false

	else

		PositionMenu()

		Menu.Visible = true

	end

end)

Close.Activated:Connect(function()

	Menu.Visible = false

end)

--========================================================--
-- SAFE DRAGGING FOR TINY BUTTON
--========================================================--

local dragging = false
local moved = false
local activeInput = nil

local dragStart
local buttonStart

Tiny.InputBegan:Connect(function(input)

	if input.UserInputType ~= Enum.UserInputType.Touch
	and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end

	activeInput = input
	dragStart = input.Position
	buttonStart = Tiny.Position

	dragging = false
	moved = false

end)

UserInputService.InputChanged:Connect(function(input)

	if input ~= activeInput then
		return
	end

	local delta =
		input.Position - dragStart

	-- Must actually move the finger.
	if delta.Magnitude < 8 then
		return
	end

	dragging = true
	moved = true

	Tiny.Position = UDim2.new(
		buttonStart.X.Scale,
		buttonStart.X.Offset + delta.X,

		buttonStart.Y.Scale,
		buttonStart.Y.Offset + delta.Y
	)

	-- If menu is open, follow the button.
	if Menu.Visible then
		PositionMenu()
	end

end)

UserInputService.InputEnded:Connect(function(input)

	if input ~= activeInput then
		return
	end

	activeInput = nil
	dragging = false

	-- A tap opens the menu.
	-- A drag does NOT open it.
	if not moved then

		PositionMenu()
		Menu.Visible = true

	end

	moved = false

end)

--========================================================--
-- AIM BUTTON
--========================================================--

AimButton.Activated:Connect(function()

	Settings.AimAssist =
		not Settings.AimAssist

	if Settings.AimAssist then

		AimButton.Text = "Aim: ON"
		AimButton.BackgroundColor3 =
			Color3.fromRGB(40,120,65)

	else

		AimButton.Text = "Aim: OFF"
		AimButton.BackgroundColor3 =
			Color3.fromRGB(38,38,42)

	end

end)

--========================================================--
-- ESP
--========================================================--

local ESPObjects = {}

local function RemoveESP(player)

	local data = ESPObjects[player]

	if not data then
		return
	end

	if data.Highlight then
		data.Highlight:Destroy()
	end

	if data.NameTag then
		data.NameTag:Destroy()
	end

	ESPObjects[player] = nil

end

local function CreateESP(player)

	if player == LocalPlayer then
		return
	end

	local character = player.Character

	if not character then
		return
	end

	RemoveESP(player)

	local teammate =
		player.Team ~= nil
		and LocalPlayer.Team ~= nil
		and player.Team == LocalPlayer.Team

	local color

	if teammate then
		color = Color3.fromRGB(0,255,80)
	else
		color = Color3.fromRGB(255,50,50)
	end

	local highlight =
		Instance.new("Highlight")

	highlight.Name =
		"TheGamerKidESP"

	highlight.Adornee =
		character

	highlight.FillColor =
		color

	highlight.OutlineColor =
		color

	highlight.FillTransparency = .75
	highlight.OutlineTransparency = 0

	highlight.DepthMode =
		Enum.HighlightDepthMode.AlwaysOnTop

	highlight.Parent =
		character

	local head =
		character:FindFirstChild("Head")

	local nameTag

	if head then

		local billboard =
			Instance.new("BillboardGui")

		billboard.Name =
			"TheGamerKidName"

		billboard.Adornee =
			head

		billboard.Size =
			UDim2.fromOffset(135,22)

		billboard.StudsOffset =
			Vector3.new(0,2.3,0)

		billboard.AlwaysOnTop = true
		billboard.Parent = head

		local label =
			Instance.new("TextLabel")

		label.Size =
			UDim2.fromScale(1,1)

		label.BackgroundTransparency = 1

		if teammate then
			label.Text =
				"TEAM • "..player.DisplayName
		else
			label.Text =
				"ENEMY • "..player.DisplayName
		end

		label.TextColor3 =
			color

		label.TextStrokeTransparency = 0
		label.TextSize = 11
		label.Font = Enum.Font.GothamBold
		label.Parent = billboard

		nameTag = billboard

	end

	ESPObjects[player] = {
		Highlight = highlight,
		NameTag = nameTag
	}

end

local function RefreshESP()

	for _,player in ipairs(
		Players:GetPlayers()
	) do

		if player ~= LocalPlayer then

			if Settings.ESP then
				CreateESP(player)
			else
				RemoveESP(player)
			end

		end

	end

end

ESPButton.Activated:Connect(function()

	Settings.ESP =
		not Settings.ESP

	if Settings.ESP then

		ESPButton.Text =
			"ESP: ON"

		ESPButton.BackgroundColor3 =
			Color3.fromRGB(40,120,65)

		RefreshESP()

	else

		ESPButton.Text =
			"ESP: OFF"

		ESPButton.BackgroundColor3 =
			Color3.fromRGB(38,38,42)

		for player in pairs(ESPObjects) do
			RemoveESP(player)
		end

	end

end)

--========================================================--
-- PLAYER UPDATES
--========================================================--

local function SetupPlayer(player)

	if player == LocalPlayer then
		return
	end

	player.CharacterAdded:Connect(function()

		task.wait(.4)

		if Settings.ESP then
			CreateESP(player)
		end

	end)

	player:GetPropertyChangedSignal(
		"Team"
	):Connect(function()

		if Settings.ESP then
			CreateESP(player)
		end

	end)

end

for _,player in ipairs(
	Players:GetPlayers()
) do
	SetupPlayer(player)
end

Players.PlayerAdded:Connect(
	SetupPlayer
)

Players.PlayerRemoving:Connect(function(player)

	RemoveESP(player)

end)

LocalPlayer:GetPropertyChangedSignal(
	"Team"
):Connect(function()

	if Settings.ESP then
		RefreshESP()
	end

end)

--========================================================--
-- OTHER BUTTONS
--========================================================--

TeamButton.Activated:Connect(function()

	Settings.TeamCheck =
		not Settings.TeamCheck

	TeamButton.Text =
		"Team: " ..
		(Settings.TeamCheck and "ON" or "OFF")

end)

WallButton.Activated:Connect(function()

	Settings.WallCheck =
		not Settings.WallCheck

	WallButton.Text =
		"Wall: " ..
		(Settings.WallCheck and "ON" or "OFF")

end)

AliveButton.Activated:Connect(function()

	Settings.AliveCheck =
		not Settings.AliveCheck

	AliveButton.Text =
		"Alive: " ..
		(Settings.AliveCheck and "ON" or "OFF")

end)

TargetButton.Activated:Connect(function()

	if Settings.TargetPart == "Head" then

		Settings.TargetPart =
			"HumanoidRootPart"

		TargetButton.Text = "Root"

	else

		Settings.TargetPart =
			"Head"

		TargetButton.Text = "Head"

	end

end)

--========================================================--
-- FOV CONTROL
--========================================================--

local function SetFOVFromX(x)

	local percent =
		math.clamp(
			(x - FOVBar.AbsolutePosition.X)
			/
			FOVBar.AbsoluteSize.X,
			0,
			1
		)

	Settings.FOV =
		math.floor(
			30 + percent * 170
		)

	FOVKnob.Position =
		UDim2.new(
			percent,
			0,
			.5,
			0
		)

	FOVLabel.Text =
		"FOV: "..Settings.FOV

end

local fovInput = nil

FOVBar.InputBegan:Connect(function(input)

	if input.UserInputType ==
		Enum.UserInputType.Touch
		or input.UserInputType ==
		Enum.UserInputType.MouseButton1 then

		fovInput = input
		SetFOVFromX(input.Position.X)

	end

end)

UserInputService.InputChanged:Connect(function(input)

	if input == fovInput then
		SetFOVFromX(input.Position.X)
	end

end)

UserInputService.InputEnded:Connect(function(input)

	if input == fovInput then
		fovInput = nil
	end

end)

--========================================================--
-- SMOOTHNESS CONTROL
--========================================================--

local function SetSmoothFromX(x)

	local percent =
		math.clamp(
			(x - SmoothBar.AbsolutePosition.X)
			/
			SmoothBar.AbsoluteSize.X,
			.05,
			1
		)

	Settings.Smoothness =
		percent

	SmoothKnob.Position =
		UDim2.new(
			percent,
			0,
			.5,
			0
		)

	SmoothLabel.Text =
		"Smooth: " ..
		math.floor(percent*100) ..
		"%"

end

local smoothInput = nil

SmoothBar.InputBegan:Connect(function(input)

	if input.UserInputType ==
		Enum.UserInputType.Touch
		or input.UserInputType ==
		Enum.UserInputType.MouseButton1 then

		smoothInput = input
		SetSmoothFromX(input.Position.X)

	end

end)

UserInputService.InputChanged:Connect(function(input)

	if input == smoothInput then
		SetSmoothFromX(input.Position.X)
	end

end)

UserInputService.InputEnded:Connect(function(input)

	if input == smoothInput then
		smoothInput = nil
	end

end)

--========================================================--
-- TARGET CHECK
--========================================================--

local function IsVisible(target)

	if not Settings.WallCheck then
		return true
	end

	local origin =
		Camera.CFrame.Position

	local direction =
		target.Position - origin

	local params =
		RaycastParams.new()

	params.FilterType =
		Enum.RaycastFilterType.Exclude

	params.FilterDescendantsInstances = {
		LocalPlayer.Character
	}

	local result =
		workspace:Raycast(
			origin,
			direction,
			params
		)

	if not result then
		return true
	end

	return result.Instance:IsDescendantOf(
		target.Parent
	)

end

local function GetClosestTarget()

	local closest = nil
	local closestDistance = math.huge

	local center =
		Vector2.new(
			Camera.ViewportSize.X/2,
			Camera.ViewportSize.Y/2
		)

	for _,player in ipairs(
		Players:GetPlayers()
	) do

		if player == LocalPlayer then
			continue
		end

		if Settings.TeamCheck
		and player.Team == LocalPlayer.Team then
			continue
		end

		local character =
			player.Character

		if not character then
			continue
		end

		local humanoid =
			character:FindFirstChildOfClass(
				"Humanoid"
			)

		if Settings.AliveCheck
		and (
			not humanoid
			or humanoid.Health <= 0
		) then
			continue
		end

		local target =
			character:FindFirstChild(
				Settings.TargetPart
			)

		if not target then
			continue
		end

		if not IsVisible(target) then
			continue
		end

		local screen,onScreen =
			Camera:WorldToViewportPoint(
				target.Position
			)

		if not onScreen then
			continue
		end

		local distance =
			(
				Vector2.new(
					screen.X,
					screen.Y
				) - center
			).Magnitude

		if distance <= Settings.FOV
		and distance < closestDistance then

			closestDistance = distance
			closest = target

		end

	end

	return closest

end

--========================================================--
-- AIM LOOP
--========================================================--

RunService.RenderStepped:Connect(function()

	if not Settings.AimAssist then
		return
	end

	local target =
		GetClosestTarget()

	if not target then
		return
	end

	local desired =
		CFrame.lookAt(
			Camera.CFrame.Position,
			target.Position
		)

	Camera.CFrame =
		Camera.CFrame:Lerp(
			desired,
			Settings.Smoothness
		)

end)

print(
	"thegamerkid24300 tiny menu loaded!"
)