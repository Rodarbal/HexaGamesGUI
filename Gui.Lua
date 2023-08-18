local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

getgenv().autoPull = false

function fastPull()
    spawn(function()    
        while autoPull do
            game:GetService("ReplicatedStorage").RE.Pull:FireServer()
            wait(0.05)
        end
    end)
end

function teleportTo(placeCFrame)
    if game.Players.LocalPlayer then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = placeCFrame;
    end
end

local MainUI = UILibrary.Load("Hexa Games GUI v3 | Made by Duck#8250")
local FirstPage = MainUI.AddPage('Discord')
local SecondPage = MainUI.AddPage('Game 1')
local ThirdPage = MainUI.AddPage('Game 2')
local FourthPage = MainUI.AddPage('Lights Out')
local FifthPage = MainUI.AddPage('Game 3')
local SixthPage = MainUI.AddPage('Game 5')
local SeventhPage = MainUI.AddPage('Game 6')

local sixthButton = FirstPage.AddButton('Copy Discord Invite', function()
    setclipboard("https://discord.gg/k269aB9xhF")
    game.StarterGui:SetCore("SendNotification", {
	Title = "Discord"; 
	Text = "Discord invite has been copied";
	Duration = 5; 
})
end)
local secondLabel = FirstPage.AddLabel('Join our discord for more free scripts')

local firstButton = SecondPage.AddButton('Red Light Green Light End TP', function()
    teleportTo(game:GetService("Workspace").Doll.Head.CFrame)
end)
local selectedShape;
local firstDropdown = ThirdPage.AddDropdown('Shape', {'Star', 'Umbrella', 'Triangle', 'Circle'}, function(value)
    selectedShape = value;
end)

local secondButton = ThirdPage.AddButton('Shape Selected', function()
    if selectedShape then
        teleportTo(game:GetService("Workspace")[selectedShape].Part.CFrame)
    end
end)

local firstLabel = ThirdPage.AddLabel('Use Shape Selected after choosing from the dropdown')

local thirdButton = FourthPage.AddButton('Lights Out Hide', function()
    teleportTo(game:GetService("Workspace").ShapeSpawns.Part.CFrame)
end)

local firstToggle = FifthPage.AddToggle('Auto Pull', false, function(bool)
    autoPull = bool
    fastPull()
end)


local glassAmount
local secondDropdown = SixthPage.AddDropdown('Glass Panes', {1,2,3,4,5,6,7,8,9,10}, function(value)
    glassAmount = value
end)

local thirdLabel = SixthPage.AddLabel('Select number of Glass Panes before teleporting')

local fifthButton = SixthPage.AddButton('TP to End', function()
    glassAmount = glassAmount * 11 - 351
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-536.160522, -147.270889, glassAmount)
end)

local secondToggle = SeventhPage.AddToggle('Auto Punch', function(bool)
    while bool do
        local args = {[1] = "NormalStart"}
        game:GetService("Players").LocalPlayer.Character.Punch.Remote:FireServer(unpack(args))
        wait(0.5)
    end
end)
