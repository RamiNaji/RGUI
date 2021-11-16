
local Player = game.Players.LocalPlayer
local frame = script.Parent.Frame.Frame
local NameBox = frame.SuspendPlayer
local RankButton = frame.Suspend



local function getPlayerFromPartialName(PartialName)
	local foundName = nil
	local Players = game.Players:GetPlayers()
	for i = 1, #Players do
		local PossiblePlayer = Players[i]
		if string.find(string.lower(PossiblePlayer.Name), string.lower(PartialName)) then
			foundName = PossiblePlayer.Name
		end
	end
	
	if not foundName then
		return nil
	else
		return foundName
	end
end
RankButton.MouseButton1Click:Connect(function()
	local NameBoxText = NameBox.Text
	if NameBoxText ~= "" then
		local playerName = getPlayerFromPartialName(NameBoxText)
		if playerName then
			print("Found player" .. playerName)
			game.ReplicatedStorage.SuspendPlayer:FireServer(playerName)
			NameBox.Text = ""
			NameBox.PlaceholderText = "Suspended!"
			wait(1)
			NameBox.PlaceholderText = "Player Name Here"
		else
			NameBox.Text = ""
			NameBox.PlaceholderText = "Player Not Found!"
			wait(1)
			NameBox.PlaceholderText = "Player Name Here"

		end
	end
end)
