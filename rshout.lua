local GlitchURL = 'cesnored'

function rankUser(message)
	game:GetService("HttpService"):GetAsync(GlitchURL .. "shout?message=" .. message)
end


game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(player, text)
	print(text)
	rankUser(text)
end)
