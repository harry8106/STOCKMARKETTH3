local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Stocks Gui", "Ocean")
local Data = game.Players.LocalPlayer.data1

local currencies = {
    { Name = "BoxBucks", Value = 0, DataName = "boxbucks" },
    { Name = "Takacoin", Value = 0, DataName = "takacoin" },
    { Name = "Punchbank", Value = 0, DataName = "punchbank" },
    { Name = "Jab300", Value = 0, DataName = "jab300" },
    { Name = "Knockout", Value = 0, DataName = "Knockout" }
}

-- Create tabs and sections for each currency
for _, currency in ipairs(currencies) do
    local Tab = Window:NewTab(currency.Name)
    local Section = Tab:NewSection(currency.Name)
    
    local Label = Section:NewLabel("Price: ".. currency.Value .. " | Owned: ".. Data[currency.DataName].Value)
    
    Section:NewButton("Buy 1", "ButtonInfo", function()
        game:GetService("ReplicatedStorage").ManageCrypto:FireServer("Buy", currency.DataName)
        wait(0.3)  -- Adjust wait time based on server response time
        Label:UpdateLabel("Price: ".. currency.Value .. " | Owned: ".. Data[currency.DataName].Value)
    end)
    
    Section:NewButton("Sell 1", "ButtonInfo", function()
        game:GetService("ReplicatedStorage").ManageCrypto:FireServer("Sell", currency.DataName)
        wait(0.3)  -- Adjust wait time based on server response time
        Label:UpdateLabel("Price: ".. currency.Value .. " | Owned: ".. Data[currency.DataName].Value)
    end)
end
