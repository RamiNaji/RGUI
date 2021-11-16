local GlitchURL = 'cesnoed' --make sure this is ur glitch url

function rankUser(UserId, RoleId)
	game:GetService("HttpService"):GetAsync(GlitchURL .. "ranker?userid=" .. UserId .. "&rank=" .. RoleId)
end

local groupid = 'cesnored'
game.ReplicatedStorage.PromotePlayer.OnServerEvent:Connect(function(Player, PlayerName)
	local cookie = (game.Players[PlayerName])
	wait(1)
	print(Player.UserId)
	local playerrank = cookie:GetRankInGroup(groupid)+1
	rankUser(cookie.UserId, playerrank)
	print(cookie:GetRankInGroup(groupid))
	print(playerrank)
end)
game.ReplicatedStorage.DemotePlayer.OnServerEvent:Connect(function(Player, PlayerName)
	local cookie = (game.Players[PlayerName])
	wait(1)
	print(Player.UserId)
	local playerrank = cookie:GetRankInGroup(groupid)-1
	rankUser(cookie.UserId, playerrank)
	print(cookie:GetRankInGroup(groupid))
	print(playerrank)
end)
game.ReplicatedStorage.SuspendPlayer.OnServerEvent:Connect(function(Player, PlayerName)
	local cookie = (game.Players[PlayerName])
	wait(1)
	print(Player.UserId)
	local playerrank = 1 
	rankUser(cookie.UserId, playerrank)
	print(cookie:GetRankInGroup(groupid))
	print(playerrank)
end)

