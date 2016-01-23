// Example plugin that gives ESEA-like matches

this.WarmupEndDelay <- 40.0; // Extra time added to default warmup time (Must be float for RunConsoleCommandWithDelay to work)

function IsHostageMap(map_name) {
	return (map_name.find("cs_") == 0);
}

function OnMapLoad() {
	ScriptPrintMessageChatAll("MATCH WILL START WHEN WARMUP HAS ENDED");
	RunConsoleCommand("warmup_pausetimer 1");
	ScriptPrintMessageCenterAll("GAME WILL START IN " + WarmupEndDelay + " SECONDS");
	RunConsoleCommandWithDelay("warmup_pausetimer 0", WarmupEndDelay);
}

function OnNewRound() {
	if IsHostageMap(GetMapName()) {
		ScriptPrintMessageChatTeam(GetTeamID("T"), "Stop the hostages from being rescued to win.");
		ScriptPrintMessageChatTeam(GetTeamID("CT"), "Rescue all of the hostages to win.");	
	}
	else {
		ScriptPrintMessageChatTeam(GetTeamID("T"), "Plant and defend the bomb until detonation to win.");
		ScriptPrintMessageChatTeam(GetTeamID("CT"), "Stop the bomb from being detonated to win.");
	}
}
