local MathGui = Instance.new("ScreenGui")
MathGui.Name = "MathCheck"
MathGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MathGui.DisplayOrder = 1000
MathGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MathFrame = Instance.new("Frame")
MathFrame.Size = UDim2.new(0, 300, 0, 200)
MathFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MathFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MathFrame.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
MathFrame.BorderSizePixel = 0
MathFrame.Parent = MathGui

local MathCorner = Instance.new("UICorner")
MathCorner.CornerRadius = UDim.new(0, 12)
MathCorner.Parent = MathFrame

local MathStroke = Instance.new("UIStroke")
MathStroke.Thickness = 2
MathStroke.Color = Color3.fromRGB(0, 80, 0)
MathStroke.Parent = MathFrame

local MathTitle = Instance.new("TextLabel")
MathTitle.Size = UDim2.new(1, 0, 0, 40)
MathTitle.Position = UDim2.new(0, 0, 0, 0)
MathTitle.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
MathTitle.BackgroundTransparency = 0.3
MathTitle.Text = "MATH CHECK"
MathTitle.TextColor3 = Color3.fromRGB(150, 255, 150)
MathTitle.TextSize = 18
MathTitle.Font = Enum.Font.GothamBold
MathTitle.Parent = MathFrame

local MathDragFrame = Instance.new("Frame")
MathDragFrame.Size = UDim2.new(1, 0, 0, 40)
MathDragFrame.Position = UDim2.new(0, 0, 0, 0)
MathDragFrame.BackgroundTransparency = 1
MathDragFrame.Parent = MathFrame

local QuestionText = Instance.new("TextLabel")
QuestionText.Size = UDim2.new(1, -40, 0, 40)
QuestionText.Position = UDim2.new(0, 20, 0, 50)
QuestionText.BackgroundTransparency = 1
QuestionText.Text = "2 + 2 = ?"
QuestionText.TextColor3 = Color3.fromRGB(200, 255, 200)
QuestionText.TextSize = 16
QuestionText.Font = Enum.Font.GothamBold
QuestionText.Parent = MathFrame

local AnswerBox = Instance.new("TextBox")
AnswerBox.Size = UDim2.new(1, -40, 0, 30)
AnswerBox.Position = UDim2.new(0, 20, 0, 100)
AnswerBox.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
AnswerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AnswerBox.Text = ""
AnswerBox.PlaceholderText = "Enter answer..."
AnswerBox.TextSize = 14
AnswerBox.Font = Enum.Font.Gotham
AnswerBox.Parent = MathFrame

local AnswerCorner = Instance.new("UICorner")
AnswerCorner.CornerRadius = UDim.new(0, 6)
AnswerCorner.Parent = AnswerBox

local CheckButton = Instance.new("TextButton")
CheckButton.Size = UDim2.new(1, -40, 0, 30)
CheckButton.Position = UDim2.new(0, 20, 0, 140)
CheckButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
CheckButton.Text = "CHECK ANSWER"
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.TextSize = 14
CheckButton.Font = Enum.Font.GothamBold
CheckButton.Parent = MathFrame

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 6)
CheckCorner.Parent = CheckButton

local function setupMathDrag()
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        MathFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MathDragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MathFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MathDragFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

setupMathDrag()

local function createSpamGUI()
    local symbols = {"!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "+", "=", "~", "`", "[", "]", "{", "}", "|", "\\", ":", ";", "\"", "'", "<", ">", ",", ".", "?", "/"}
    local spamGuis = {}
    local guiCount = 1000
    local createdCount = 0
    
    local function createSingleGUI(index)
        local SpamGui = Instance.new("ScreenGui")
        SpamGui.Name = "SpamGUI_" .. index
        SpamGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        SpamGui.DisplayOrder = 1001 + index
        SpamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local SpamFrame = Instance.new("Frame")
        SpamFrame.Size = UDim2.new(0, math.random(80, 150), 0, math.random(60, 100))
        SpamFrame.Position = UDim2.new(
            math.random() * 0.7, 
            math.random(-50, 50), 
            math.random() * 0.7, 
            math.random(-50, 50)
        )
        SpamFrame.BackgroundColor3 = Color3.fromRGB(
            math.random(50, 255),
            math.random(50, 255), 
            math.random(50, 255)
        )
        SpamFrame.BorderSizePixel = 0
        SpamFrame.Parent = SpamGui
        
        local SpamCorner = Instance.new("UICorner")
        SpamCorner.CornerRadius = UDim.new(0, 6)
        SpamCorner.Parent = SpamFrame
        
        local RandomText = ""
        for j = 1, math.random(5, 15) do
            RandomText = RandomText .. symbols[math.random(1, #symbols)]
        end
        
        local SpamLabel = Instance.new("TextLabel")
        SpamLabel.Size = UDim2.new(1, -10, 1, -10)
        SpamLabel.Position = UDim2.new(0, 5, 0, 5)
        SpamLabel.BackgroundTransparency = 1
        SpamLabel.Text = RandomText
        SpamLabel.TextColor3 = Color3.fromRGB(
            math.random(200, 255),
            math.random(200, 255),
            math.random(200, 255)
        )
        SpamLabel.TextSize = math.random(10, 16)
        SpamLabel.TextWrapped = true
        SpamLabel.Font = Enum.Font.GothamBold
        SpamLabel.Parent = SpamFrame
        
        table.insert(spamGuis, {
            Gui = SpamGui,
            Frame = SpamFrame,
            SpeedX = math.random(-5, 5),
            SpeedY = math.random(-5, 5)
        })
        
        createdCount = createdCount + 1
    end
    
    local function animateGUIs()
        while #spamGuis > 0 do
            for i, spamData in ipairs(spamGuis) do
                if spamData.Frame and spamData.Frame.Parent then
                    local currentPos = spamData.Frame.Position
                    local newX = currentPos.X.Scale + (spamData.SpeedX * 0.001)
                    local newY = currentPos.Y.Scale + (spamData.SpeedY * 0.001)
                    
                    if newX < 0 or newX > 0.85 then
                        spamData.SpeedX = -spamData.SpeedX
                        newX = math.max(0, math.min(0.85, newX))
                    end
                    
                    if newY < 0 or newY > 0.85 then
                        spamData.SpeedY = -spamData.SpeedY
                        newY = math.max(0, math.min(0.85, newY))
                    end
                    
                    spamData.Frame.Position = UDim2.new(newX, currentPos.X.Offset, newY, currentPos.Y.Offset)
                end
            end
            task.wait(0.03)
        end
    end
    
    task.spawn(animateGUIs)
    
    for i = 1, guiCount do
        task.spawn(function()
            local delayTime = math.random(0, 200) / 10
            task.wait(delayTime)
            
            createSingleGUI(i)
        end)
    end
    
    task.wait(20)
    game.Players.LocalPlayer:Kick("We are stopped services.")
end

local TrowHackData = {
    guiVisible = false,
    closeClickCount = 0,
    mainFramePosition = UDim2.new(0.5, -175, 0.5, -140),
    bliztLoaded = false
}

local function checkAnswer()
    local answer = tonumber(AnswerBox.Text)
    
    MathGui:Destroy()
    
    if answer == 4 then
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "TrowHack"
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        ScreenGui.DisplayOrder = 999
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        local LocalPlayer = Players.LocalPlayer

        local mainFrame
        local notification
        local isloading = false

        local function createWarningDialog(callback)
            local WarningGui = Instance.new("ScreenGui")
            WarningGui.Name = "WarningDialog"
            WarningGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            WarningGui.DisplayOrder = 1001
            WarningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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
            WarningText.Text = "BlizT not enter continue?"
            WarningText.TextColor3 = Color3.fromRGB(255, 150, 150)
            WarningText.TextSize = 16
            WarningText.Font = Enum.Font.GothamBold
            WarningText.TextWrapped = true
            WarningText.Parent = WarningFrame

            local EnterButton = Instance.new("TextButton")
            EnterButton.Size = UDim2.new(0, 120, 0, 30)
            EnterButton.Position = UDim2.new(0, 40, 0, 120)
            EnterButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
            EnterButton.Text = "ENTER"
            EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            EnterButton.TextSize = 14
            EnterButton.Font = Enum.Font.GothamBold
            EnterButton.Parent = WarningFrame

            local EnterCorner = Instance.new("UICorner")
            EnterCorner.CornerRadius = UDim.new(0, 6)
            EnterCorner.Parent = EnterButton

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

            EnterButton.MouseButton1Click:Connect(function()
                WarningGui:Destroy()
                if callback then
                    callback()
                end
            end)

            CloseButton.MouseButton1Click:Connect(function()
                WarningGui:Destroy()
            end)
        end

        local function createDeathSequence()
            local DeathGui = Instance.new("ScreenGui")
            DeathGui.Name = "DeathGui"
            DeathGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            DeathGui.DisplayOrder = 1002
            DeathGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            local DeathFrame = Instance.new("Frame")
            DeathFrame.Size = UDim2.new(1, 0, 1, 0)
            DeathFrame.Position = UDim2.new(0, 0, 0, 0)
            DeathFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            DeathFrame.BorderSizePixel = 0
            DeathFrame.Parent = DeathGui

            local DeathText = Instance.new("TextLabel")
            DeathText.Size = UDim2.new(1, 0, 1, 0)
            DeathText.Position = UDim2.new(0, 0, 0, 0)
            DeathText.BackgroundTransparency = 1
            DeathText.Text = "U DIE"
            DeathText.TextColor3 = Color3.fromRGB(255, 0, 0)
            DeathText.TextSize = 50
            DeathText.Font = Enum.Font.GothamBold
            DeathText.Parent = DeathFrame

            task.wait(3)
            game.Players.LocalPlayer:Kick("DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE DIE")
        end

        local function createDialog(isSecondClick)
            local DialogGui = Instance.new("ScreenGui")
            DialogGui.Name = "DialogGui"
            DialogGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            DialogGui.DisplayOrder = 1000
            DialogGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            local DialogFrame = Instance.new("Frame")
            DialogFrame.Name = "DialogFrame"
            DialogFrame.Size = UDim2.new(0, 300, 0, 150)
            DialogFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
            DialogFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            DialogFrame.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
            DialogFrame.BorderSizePixel = 0
            DialogFrame.BackgroundTransparency = 0
            DialogFrame.Parent = DialogGui

            local DialogCorner = Instance.new("UICorner")
            DialogCorner.CornerRadius = UDim.new(0, 12)
            DialogCorner.Parent = DialogFrame

            local DialogStroke = Instance.new("UIStroke")
            DialogStroke.Thickness = 2
            DialogStroke.Color = Color3.fromRGB(0, 80, 0)
            DialogStroke.Parent = DialogFrame

            local MessageText = Instance.new("TextLabel")
            MessageText.Name = "MessageText"
            MessageText.Size = UDim2.new(1, -40, 1, -60)
            MessageText.Position = UDim2.new(0, 20, 0, 20)
            MessageText.BackgroundTransparency = 1
            if isSecondClick then
                MessageText.Text = "you tried to kill me"
            else
                MessageText.Text = "u not kill me"
            end
            MessageText.TextColor3 = Color3.fromRGB(150, 255, 150)
            MessageText.TextSize = 18
            MessageText.Font = Enum.Font.GothamBold
            MessageText.TextWrapped = true
            MessageText.Parent = DialogFrame

            local CloseDialogButton = Instance.new("TextButton")
            CloseDialogButton.Name = "CloseDialogButton"
            CloseDialogButton.Size = UDim2.new(0, 25, 0, 25)
            CloseDialogButton.Position = UDim2.new(1, -30, 0, 8)
            CloseDialogButton.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
            CloseDialogButton.Text = "X"
            CloseDialogButton.TextColor3 = Color3.fromRGB(255, 200, 200)
            CloseDialogButton.TextSize = 12
            CloseDialogButton.Font = Enum.Font.GothamBold
            CloseDialogButton.Parent = DialogFrame

            local CloseDialogCorner = Instance.new("UICorner")
            CloseDialogCorner.CornerRadius = UDim.new(0, 6)
            CloseDialogCorner.Parent = CloseDialogButton

            CloseDialogButton.MouseEnter:Connect(function()
                TweenService:Create(CloseDialogButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 40, 40)}):Play()
            end)
            
            CloseDialogButton.MouseLeave:Connect(function()
                TweenService:Create(CloseDialogButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 30, 30)}):Play()
            end)

            CloseDialogButton.MouseButton1Click:Connect(function()
                TweenService:Create(DialogFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                TweenService:Create(MessageText, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                TweenService:Create(CloseDialogButton, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
                task.wait(0.3)
                DialogGui:Destroy()
                
                if isSecondClick then
                    createDeathSequence()
                end
            end)
        end

        local function createMainGUI()
            mainFrame = Instance.new("Frame")
            mainFrame.Name = "MainFrame"
            mainFrame.Size = UDim2.new(0, 350, 0, 280)
            mainFrame.Position = TrowHackData.mainFramePosition
            mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            mainFrame.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
            mainFrame.BorderSizePixel = 0
            mainFrame.BackgroundTransparency = 0.05
            mainFrame.Visible = TrowHackData.guiVisible
            mainFrame.Parent = ScreenGui

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 12)
            UICorner.Parent = mainFrame

            local UIStroke = Instance.new("UIStroke")
            UIStroke.Thickness = 2
            UIStroke.Color = Color3.fromRGB(0, 80, 0)
            UIStroke.Parent = mainFrame

            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Size = UDim2.new(1, 0, 0, 40)
            Title.Position = UDim2.new(0, 0, 0, 0)
            Title.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
            Title.BackgroundTransparency = 0.3
            Title.Text = "TROWHACK"
            Title.TextColor3 = Color3.fromRGB(150, 255, 150)
            Title.TextSize = 18
            Title.Font = Enum.Font.GothamBold
            Title.Parent = mainFrame

            local DragFrame = Instance.new("Frame")
            DragFrame.Name = "DragFrame"
            DragFrame.Size = UDim2.new(1, 0, 0, 40)
            DragFrame.Position = UDim2.new(0, 0, 0, 0)
            DragFrame.BackgroundTransparency = 1
            DragFrame.Parent = mainFrame

            local ButtonsFrame = Instance.new("Frame")
            ButtonsFrame.Name = "ButtonsFrame"
            ButtonsFrame.Size = UDim2.new(1, -30, 0, 210)
            ButtonsFrame.Position = UDim2.new(0, 15, 0, 50)
            ButtonsFrame.BackgroundTransparency = 1
            ButtonsFrame.Parent = mainFrame

            local InfiniteYieldButton = Instance.new("TextButton")
            InfiniteYieldButton.Name = "InfiniteYieldButton"
            InfiniteYieldButton.Size = UDim2.new(1, 0, 0, 60)
            InfiniteYieldButton.Position = UDim2.new(0, 0, 0, 0)
            InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
            InfiniteYieldButton.AutoButtonColor = false
            InfiniteYieldButton.Text = ""
            InfiniteYieldButton.Parent = ButtonsFrame

            local IYCorner = Instance.new("UICorner")
            IYCorner.CornerRadius = UDim.new(0, 8)
            IYCorner.Parent = InfiniteYieldButton

            local IYContent = Instance.new("Frame")
            IYContent.Name = "IYContent"
            IYContent.Size = UDim2.new(1, -15, 1, -15)
            IYContent.Position = UDim2.new(0, 7.5, 0, 7.5)
            IYContent.BackgroundTransparency = 1
            IYContent.Parent = InfiniteYieldButton

            local IYImage = Instance.new("ImageLabel")
            IYImage.Name = "IYImage"
            IYImage.Size = UDim2.new(0, 40, 0, 40)
            IYImage.Position = UDim2.new(0, 5, 0.5, -20)
            IYImage.BackgroundTransparency = 1
            IYImage.Image = "rbxassetid://138373512366713"
            IYImage.ScaleType = Enum.ScaleType.Fit
            IYImage.Parent = IYContent

            local IYText = Instance.new("TextLabel")
            IYText.Name = "IYText"
            IYText.Size = UDim2.new(1, -55, 1, 0)
            IYText.Position = UDim2.new(0, 50, 0, 0)
            IYText.BackgroundTransparency = 1
            IYText.Text = "Infinite Yield"
            IYText.TextColor3 = Color3.fromRGB(200, 255, 200)
            IYText.TextSize = 14
            IYText.Font = Enum.Font.GothamBold
            IYText.TextXAlignment = Enum.TextXAlignment.Left
            IYText.Parent = IYContent

            local BlizTButton = Instance.new("TextButton")
            BlizTButton.Name = "BlizTButton"
            BlizTButton.Size = UDim2.new(1, 0, 0, 60)
            BlizTButton.Position = UDim2.new(0, 0, 0, 75)
            BlizTButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
            BlizTButton.Text = "BlizT"
            BlizTButton.TextColor3 = Color3.fromRGB(200, 255, 200)
            BlizTButton.TextSize = 16
            BlizTButton.Font = Enum.Font.GothamBold
            BlizTButton.Parent = ButtonsFrame

            local BlizTCorner = Instance.new("UICorner")
            BlizTCorner.CornerRadius = UDim.new(0, 8)
            BlizTCorner.Parent = BlizTButton

            local TelegramButton = Instance.new("TextButton")
            TelegramButton.Name = "TelegramButton"
            TelegramButton.Size = UDim2.new(1, 0, 0, 60)
            TelegramButton.Position = UDim2.new(0, 0, 0, 150)
            TelegramButton.BackgroundColor3 = Color3.fromRGB(30, 60, 90)
            TelegramButton.Text = "Telegram"
            TelegramButton.TextColor3 = Color3.fromRGB(200, 220, 255)
            TelegramButton.TextSize = 16
            TelegramButton.Font = Enum.Font.GothamBold
            TelegramButton.Parent = ButtonsFrame

            local TelegramCorner = Instance.new("UICorner")
            TelegramCorner.CornerRadius = UDim.new(0, 8)
            TelegramCorner.Parent = TelegramButton

            local CloseButton = Instance.new("TextButton")
            CloseButton.Name = "CloseButton"
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

            local function setupButtonHover(button)
                local originalColor = button.BackgroundColor3
                
                button.MouseEnter:Connect(function()
                    if button == TelegramButton then
                        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 80, 120)}):Play()
                    else
                        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 90, 50)}):Play()
                    end
                end)
                
                button.MouseLeave:Connect(function()
                    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
                end)
            end

            setupButtonHover(InfiniteYieldButton)
            setupButtonHover(BlizTButton)
            setupButtonHover(TelegramButton)
            setupButtonHover(CloseButton)

            local function setButtonsEnabled(enabled)
                InfiniteYieldButton.Active = enabled
                BlizTButton.Active = enabled
                TelegramButton.Active = enabled
                
                if enabled then
                    InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
                    BlizTButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
                    TelegramButton.BackgroundColor3 = Color3.fromRGB(30, 60, 90)
                    IYText.TextColor3 = Color3.fromRGB(200, 255, 200)
                    BlizTButton.TextColor3 = Color3.fromRGB(200, 255, 200)
                    TelegramButton.TextColor3 = Color3.fromRGB(200, 220, 255)
                else
                    InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    BlizTButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    TelegramButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
                    IYText.TextColor3 = Color3.fromRGB(150, 150, 150)
                    BlizTButton.TextColor3 = Color3.fromRGB(150, 150, 150)
                    TelegramButton.TextColor3 = Color3.fromRGB(150, 150, 170)
                end
            end

            local function loadInfiniteYield()
                if isloading then return end
                isloading = true
                setButtonsEnabled(false)
                
                local originalText = IYText.Text
                IYText.Text = "Loading..."
                InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
                
                local success, err = pcall(function()
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                end)
                
                if success then
                    IYText.Text = "Loaded!"
                    InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
                    task.wait(2)
                else
                    IYText.Text = "Error!"
                    InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
                    task.wait(2)
                end
                
                IYText.Text = originalText
                task.wait(1)
                setButtonsEnabled(true)
                isloading = false
            end

            local function loadBlizT()
                if isloading then return end
                isloading = true
                setButtonsEnabled(false)
                
                local originalText = BlizTButton.Text
                BlizTButton.Text = "Loading..."
                BlizTButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
                
                local success, err = pcall(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/FTAP.lua"))()
                end)
                
                if success then
                    BlizTButton.Text = "Loaded!"
                    BlizTButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
                    TrowHackData.bliztLoaded = true
                    task.wait(2)
                else
                    BlizTButton.Text = "Error!"
                    BlizTButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
                    task.wait(2)
                end
                
                BlizTButton.Text = originalText
                task.wait(1)
                setButtonsEnabled(true)
                isloading = false
            end

            local function copyToClipboard(text)
                local SetClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
                if SetClipboard then
                    SetClipboard(text)
                    return true
                end
                return false
            end

            local function onTelegramClick()
                local telegramLink = "t.me/TrowHack"
                local success = copyToClipboard(telegramLink)
                
                if success then
                    local originalText = TelegramButton.Text
                    TelegramButton.Text = "Copied!"
                    TelegramButton.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
                    task.wait(1.5)
                    TelegramButton.Text = originalText
                    TelegramButton.BackgroundColor3 = Color3.fromRGB(30, 60, 90)
                else
                    local originalText = TelegramButton.Text
                    TelegramButton.Text = "Copy Failed!"
                    TelegramButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
                    task.wait(1.5)
                    TelegramButton.Text = originalText
                    TelegramButton.BackgroundColor3 = Color3.fromRGB(30, 60, 90)
                end
            end

            InfiniteYieldButton.MouseButton1Click:Connect(function()
                if TrowHackData.bliztLoaded then
                    loadInfiniteYield()
                else
                    createWarningDialog(loadInfiniteYield)
                end
            end)

            BlizTButton.MouseButton1Click:Connect(loadBlizT)
            TelegramButton.MouseButton1Click:Connect(onTelegramClick)
            
            CloseButton.MouseButton1Click:Connect(function()
                TrowHackData.closeClickCount = TrowHackData.closeClickCount + 1
                if TrowHackData.closeClickCount == 1 then
                    createDialog(false)
                elseif TrowHackData.closeClickCount == 2 then
                    createDialog(true)
                end
            end)

            local dragging, dragInput, dragStart, startPos

            local function update(input)
                local delta = input.Position - dragStart
                mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                TrowHackData.mainFramePosition = mainFrame.Position
            end

            DragFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    dragStart = input.Position
                    startPos = mainFrame.Position
                    
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)

            DragFrame.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    dragInput = input
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    update(input)
                end
            end)
        end

        local function createNotification()
            notification = Instance.new("Frame")
            notification.Name = "Notification"
            notification.Size = UDim2.new(0, 200, 0, 40)
            notification.Position = UDim2.new(0, 10, 1, -50)
            notification.AnchorPoint = Vector2.new(0, 1)
            notification.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
            notification.BackgroundTransparency = 0.1
            notification.Parent = ScreenGui

            local NotificationCorner = Instance.new("UICorner")
            NotificationCorner.CornerRadius = UDim.new(0, 8)
            NotificationCorner.Parent = notification

            local NotificationStroke = Instance.new("UIStroke")
            NotificationStroke.Thickness = 1
            NotificationStroke.Color = Color3.fromRGB(0, 80, 0)
            NotificationStroke.Parent = notification

            local NotificationText = Instance.new("TextLabel")
            NotificationText.Name = "NotificationText"
            NotificationText.Size = UDim2.new(1, -10, 1, -10)
            NotificationText.Position = UDim2.new(0, 5, 0, 5)
            NotificationText.BackgroundTransparency = 1
            NotificationText.Text = "Press G to hide/show"
            NotificationText.TextColor3 = Color3.fromRGB(150, 255, 150)
            NotificationText.TextSize = 12
            NotificationText.Font = Enum.Font.Gotham
            NotificationText.TextXAlignment = Enum.TextXAlignment.Left
            NotificationText.Parent = notification

            task.spawn(function()
                task.wait(3)
                if notification then
                    TweenService:Create(notification, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(NotificationText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
                    task.wait(0.5)
                    if notification then
                        notification:Destroy()
                        notification = nil
                    end
                end
            end)
        end

        local function updateCamera()
            if TrowHackData.guiVisible then
                LocalPlayer.CameraMode = Enum.CameraMode.Classic
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            else
                LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
                UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
            end
        end

        local function toggleGUI()
            TrowHackData.guiVisible = not TrowHackData.guiVisible
            
            if mainFrame then
                if TrowHackData.guiVisible then
                    mainFrame.Visible = true
                    TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0.05}):Play()
                else
                    TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                    task.wait(0.3)
                    mainFrame.Visible = false
                end
            end
            
            updateCamera()
        end

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == Enum.KeyCode.G then
                toggleGUI()
            end
        end)

        createMainGUI()
        createNotification()
        updateCamera()

        local function restoreGUI()
            task.wait(3)
            
            if ScreenGui and ScreenGui.Parent then
                if mainFrame then
                    mainFrame:Destroy()
                    mainFrame = nil
                end
                if notification then
                    notification:Destroy()
                    notification = nil
                end
                
                TrowHackData.guiVisible = false
                
                createMainGUI()
                createNotification()
                updateCamera()
            end
        end

        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        if character then
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.Died:Connect(function()
                restoreGUI()
            end)
        end

        LocalPlayer.CharacterAdded:Connect(function(newCharacter)
            local newHumanoid = newCharacter:WaitForChild("Humanoid")
            newHumanoid.Died:Connect(function()
                restoreGUI()
            end)
        end)
        
    else
        createSpamGUI()
    end
end

CheckButton.MouseButton1Click:Connect(checkAnswer)

AnswerBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkAnswer()
    end
end)
