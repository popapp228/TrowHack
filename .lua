-- Глобальные переменные для сохранения состояния
local isGUIVisible = true
local mainFramePosition = UDim2.new(0.435, 0, 0.273, 0)
local toggleIconPosition = UDim2.new(0, 20, 1, -85)
local bliztLoaded = false

-- Функция создания диалога предупреждения
local function createWarningDialog(callback)
    local WarningGui = Instance.new("ScreenGui")
    WarningGui.Name = "WarningDialog"
    WarningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    WarningGui.DisplayOrder = 1000
    WarningGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local WarningFrame = Instance.new("Frame")
    WarningFrame.Size = UDim2.new(0, 350, 0, 180)
    WarningFrame.Position = UDim2.new(0.5, -175, 0.5, -90)
    WarningFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    WarningFrame.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
    WarningFrame.BorderSizePixel = 0
    WarningFrame.Parent = WarningGui

    local WarningCorner = Instance.new("UICorner")
    WarningCorner.CornerRadius = UDim.new(0, 12)
    WarningCorner.Parent = WarningFrame

    local WarningStroke = Instance.new("UIStroke")
    WarningStroke.Thickness = 2
    WarningStroke.Color = Color3.fromRGB(80, 0, 0)
    WarningStroke.Parent = WarningFrame

    local WarningText = Instance.new("TextLabel")
    WarningText.Size = UDim2.new(1, -40, 0, 80)
    WarningText.Position = UDim2.new(0, 20, 0, 20)
    WarningText.BackgroundTransparency = 1
    WarningText.Text = "Are you sure you want to execute Infinite Yield?\nBlizT will not load if you continue!"
    WarningText.TextColor3 = Color3.fromRGB(255, 150, 150)
    WarningText.TextSize = 14
    WarningText.Font = Enum.Font.GothamBold
    WarningText.TextWrapped = true
    WarningText.Parent = WarningFrame

    local ExecuteButton = Instance.new("TextButton")
    ExecuteButton.Size = UDim2.new(0, 120, 0, 30)
    ExecuteButton.Position = UDim2.new(0, 40, 0, 120)
    ExecuteButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
    ExecuteButton.Text = "EXECUTING"
    ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecuteButton.TextSize = 14
    ExecuteButton.Font = Enum.Font.GothamBold
    ExecuteButton.Parent = WarningFrame

    local ExecuteCorner = Instance.new("UICorner")
    ExecuteCorner.CornerRadius = UDim.new(0, 6)
    ExecuteCorner.Parent = ExecuteButton

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 120, 0, 30)
    CloseButton.Position = UDim2.new(1, -160, 0, 120)
    CloseButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
    CloseButton.Text = "CLOSE"
    CloseButton.TextColor3 = Color3.fromRGB(255, 200, 200)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = WarningFrame

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton

    ExecuteButton.MouseButton1Click:Connect(function()
        WarningGui:Destroy()
        if callback then
            callback()
        end
    end)

    CloseButton.MouseButton1Click:Connect(function()
        WarningGui:Destroy()
    end)
end

-- Функция создания всего GUI
local function createFullGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TrowHackGUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 251, 0, 332)
    MainFrame.Position = mainFramePosition
    MainFrame.BackgroundColor3 = Color3.fromRGB(60, 255, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = isGUIVisible
    MainFrame.Parent = ScreenGui

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 12)
    FrameCorner.Parent = MainFrame

    local FrameStroke = Instance.new("UIStroke")
    FrameStroke.Thickness = 2
    FrameStroke.Color = Color3.fromRGB(0, 80, 0)
    FrameStroke.Parent = MainFrame

    local LogoButton = Instance.new("ImageButton")
    LogoButton.Name = "Logo"
    LogoButton.Size = UDim2.new(0, 225, 0, 150)
    LogoButton.Position = UDim2.new(0.052, 0, -0.453, 0)
    LogoButton.Image = "rbxassetid://118649291600769"
    LogoButton.ImageTransparency = 0.03
    LogoButton.BackgroundTransparency = 1
    LogoButton.BorderSizePixel = 0
    LogoButton.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
    Title.BackgroundTransparency = 0.3
    Title.Text = "TROWHACK"
    Title.TextColor3 = Color3.fromRGB(150, 255, 150)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Position = UDim2.new(1, -30, 0, 8)
    CloseButton.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 200, 200)
    CloseButton.TextSize = 12
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = Title

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton

    local ToggleIcon = Instance.new("ImageButton")
    ToggleIcon.Name = "ToggleIcon"
    ToggleIcon.Size = UDim2.new(0, 75, 0, 75)
    ToggleIcon.Position = toggleIconPosition
    ToggleIcon.AnchorPoint = Vector2.new(0, 1)
    ToggleIcon.BackgroundTransparency = 1
    ToggleIcon.Image = "rbxassetid://99997475083040"
    ToggleIcon.BorderSizePixel = 0
    ToggleIcon.Visible = not isGUIVisible
    ToggleIcon.Parent = ScreenGui

    local ButtonsFrame = Instance.new("Frame")
    ButtonsFrame.Size = UDim2.new(1, -30, 0, 280)
    ButtonsFrame.Position = UDim2.new(0, 15, 0, 50)
    ButtonsFrame.BackgroundTransparency = 1
    ButtonsFrame.Parent = MainFrame

    local InfiniteYieldButton = Instance.new("TextButton")
    InfiniteYieldButton.Size = UDim2.new(1, 0, 0, 60)
    InfiniteYieldButton.Position = UDim2.new(0, 0, 0, 0)
    InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
    InfiniteYieldButton.Text = "Infinite Yield"
    InfiniteYieldButton.TextColor3 = Color3.fromRGB(200, 255, 200)
    InfiniteYieldButton.TextSize = 16
    InfiniteYieldButton.Font = Enum.Font.GothamBold
    InfiniteYieldButton.Parent = ButtonsFrame

    local InfiniteYieldCorner = Instance.new("UICorner")
    InfiniteYieldCorner.CornerRadius = UDim.new(0, 8)
    InfiniteYieldCorner.Parent = InfiniteYieldButton

    local BlizTButton = Instance.new("TextButton")
    BlizTButton.Size = UDim2.new(1, 0, 0, 60)
    BlizTButton.Position = UDim2.new(0, 0, 0, 70)
    BlizTButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
    BlizTButton.Text = "BlizT"
    BlizTButton.TextColor3 = Color3.fromRGB(200, 255, 200)
    BlizTButton.TextSize = 16
    BlizTButton.Font = Enum.Font.GothamBold
    BlizTButton.Parent = ButtonsFrame

    local BlizTCorner = Instance.new("UICorner")
    BlizTCorner.CornerRadius = UDim.new(0, 8)
    BlizTCorner.Parent = BlizTButton

    local CosmicButton = Instance.new("TextButton")
    CosmicButton.Size = UDim2.new(1, 0, 0, 60)
    CosmicButton.Position = UDim2.new(0, 0, 0, 140)
    CosmicButton.BackgroundColor3 = Color3.fromRGB(40, 30, 80)
    CosmicButton.Text = "Cosmic"
    CosmicButton.TextColor3 = Color3.fromRGB(220, 200, 255)
    CosmicButton.TextSize = 16
    CosmicButton.Font = Enum.Font.GothamBold
    CosmicButton.Parent = ButtonsFrame

    local CosmicCorner = Instance.new("UICorner")
    CosmicCorner.CornerRadius = UDim.new(0, 8)
    CosmicCorner.Parent = CosmicButton

    -- НОВАЯ КНОПКА TELEGRAM С ДИЗАЙНОМ
    local TelegramButton = Instance.new("TextButton")
    TelegramButton.Size = UDim2.new(1, 0, 0, 60)
    TelegramButton.Position = UDim2.new(0, 0, 0, 210)
    TelegramButton.BackgroundColor3 = Color3.fromRGB(30, 60, 90)
    TelegramButton.Text = ""
    TelegramButton.TextColor3 = Color3.fromRGB(200, 220, 255)
    TelegramButton.TextSize = 16
    TelegramButton.Font = Enum.Font.GothamBold
    TelegramButton.Parent = ButtonsFrame

    local TelegramCorner = Instance.new("UICorner")
    TelegramCorner.CornerRadius = UDim.new(0, 8)
    TelegramCorner.Parent = TelegramButton

    -- Изображение для кнопки Telegram
    local TelegramImage = Instance.new("ImageLabel")
    TelegramImage.Size = UDim2.new(1, 0, 1, 0)
    TelegramImage.Position = UDim2.new(0, 0, 0, 0)
    TelegramImage.BackgroundTransparency = 1
    TelegramImage.Image = "rbxassetid://119191473940948"
    TelegramImage.ScaleType = Enum.ScaleType.Fit
    TelegramImage.Parent = TelegramButton

    local function loadInfiniteYield()
        InfiniteYieldButton.Text = "Loading..."
        InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
        
        local success = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
        
        if success then
            InfiniteYieldButton.Text = "Loaded!"
            InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
            task.wait(2)
        else
            InfiniteYieldButton.Text = "Error!"
            InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
            task.wait(2)
        end
        
        InfiniteYieldButton.Text = "Infinite Yield"
        InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
    end

    local function loadBlizT()
        BlizTButton.Text = "Loading..."
        BlizTButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
        
        local success = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/FTAP.lua"))()
        end)
        
        if success then
            BlizTButton.Text = "Loaded!"
            BlizTButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
            bliztLoaded = true
            task.wait(2)
        else
            BlizTButton.Text = "Error!"
            BlizTButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
            task.wait(2)
        end
        
        BlizTButton.Text = "BlizT"
        BlizTButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
    end

    local function loadCosmic()
        CosmicButton.Text = "Loading..."
        CosmicButton.BackgroundColor3 = Color3.fromRGB(60, 50, 120)
        
        local success = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/popapp228/TrowHack/refs/heads/main/lua"))()
        end)
        
        if success then
            CosmicButton.Text = "Loaded!"
            CosmicButton.BackgroundColor3 = Color3.fromRGB(80, 70, 160)
            task.wait(2)
        else
            CosmicButton.Text = "Error!"
            CosmicButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
            task.wait(2)
        end
        
        CosmicButton.Text = "Cosmic"
        CosmicButton.BackgroundColor3 = Color3.fromRGB(40, 30, 80)
    end

    local function copyToClipboard(text)
        local SetClipboard = setclipboard or toclipboard or set_clipboard
        if SetClipboard then
            SetClipboard(text)
            return true
        end
        return false
    end

    local function onCosmicClick()
        local success = copyToClipboard("Cosmic123")
        
        if success then
            CosmicButton.Text = "Copied!"
            CosmicButton.BackgroundColor3 = Color3.fromRGB(80, 70, 160)
            task.wait(1.5)
            CosmicButton.Text = "Cosmic"
            CosmicButton.BackgroundColor3 = Color3.fromRGB(40, 30, 80)
            
            task.wait(0.5)
            loadCosmic()
        else
            CosmicButton.Text = "Copy Failed!"
            CosmicButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
            task.wait(1.5)
            CosmicButton.Text = "Cosmic"
            CosmicButton.BackgroundColor3 = Color3.fromRGB(40, 30, 80)
        end
    end

    local function onTelegramClick()
        local telegramLink = "t.me/TrowHack"
        local success = copyToClipboard(telegramLink)
        
        if success then
            -- Временное изменение изображения при успешном копировании
            local originalImage = TelegramImage.Image
            TelegramImage.Image = "rbxassetid://119191473940948" -- Можно использовать другую иконку для "Copied"
            task.wait(1.5)
            TelegramImage.Image = originalImage
        else
            -- Временное изменение изображения при ошибке
            local originalImage = TelegramImage.Image
            TelegramImage.Image = "rbxassetid://119191473940948" -- Можно использовать другую иконку для "Error"
            task.wait(1.5)
            TelegramImage.Image = originalImage
        end
    end

    -- Измененное подключение Infinite Yield
    InfiniteYieldButton.MouseButton1Click:Connect(function()
        if bliztLoaded then
            loadInfiniteYield()
        else
            createWarningDialog(loadInfiniteYield)
        end
    end)

    BlizTButton.MouseButton1Click:Connect(loadBlizT)
    CosmicButton.MouseButton1Click:Connect(onCosmicClick)
    TelegramButton.MouseButton1Click:Connect(onTelegramClick)

    local function hideGUI()
        isGUIVisible = false
        MainFrame.Visible = false
        ToggleIcon.Visible = true
    end

    local function showGUI()
        isGUIVisible = true
        MainFrame.Visible = true
        ToggleIcon.Visible = false
    end

    local function toggleGUI()
        if isGUIVisible then
            hideGUI()
        else
            showGUI()
        end
    end

    CloseButton.MouseButton1Click:Connect(hideGUI)

    local UserInputService = game:GetService("UserInputService")
    local dragging = false
    local dragStart, startPos

    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    Title.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFramePosition = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X,
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
            MainFrame.Position = mainFramePosition
        end
    end)

    Title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    local iconDragging = false
    local iconDragStart, iconStartPos
    local iconMoved = false

    ToggleIcon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            iconDragging = true
            iconDragStart = input.Position
            iconStartPos = ToggleIcon.Position
            iconMoved = false
        end
    end)

    ToggleIcon.InputChanged:Connect(function(input)
        if iconDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - iconDragStart
            local moveDistance = math.abs(delta.X) + math.abs(delta.Y)
            
            if moveDistance > 5 then
                iconMoved = true
            end
            
            toggleIconPosition = UDim2.new(
                iconStartPos.X.Scale, 
                iconStartPos.X.Offset + delta.X,
                iconStartPos.Y.Scale, 
                iconStartPos.Y.Offset + delta.Y
            )
            ToggleIcon.Position = toggleIconPosition
        end
    end)

    ToggleIcon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if not iconMoved then
                showGUI()
            end
            iconDragging = false
            iconMoved = false
        end
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.G then
            toggleGUI()
        end
    end)
end

local function setupCharacterHandling()
    local player = game.Players.LocalPlayer
    
    local function onCharacterAdded(character)
        createFullGUI()
    end
    
    player.CharacterAdded:Connect(onCharacterAdded)
    
    if player.Character then
        createFullGUI()
    end
end

setupCharacterHandling()
