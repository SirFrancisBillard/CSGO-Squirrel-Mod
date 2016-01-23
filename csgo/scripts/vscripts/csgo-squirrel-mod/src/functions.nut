// Source file for custom functions

this.gameIsOnPC				<- true; // True by default

function SetGameIsOnPC(OnPC) { // Function only used by map prefab
	gameIsOnPC = OnPC;
}

function GameIsOnPC() {
	return gameIsOnPC;
}

function RunConsoleCommand(cmd) {
	EntFire("SquirrelHooks_ServerCommand", "command " + cmd);
}

function RunConsoleCommandWithDelay(cmd, delay) {
	EntFire("SquirrelHooks_ServerCommand", "command " + cmd, delay);
}

function GivePlayerItem(ply, item_class) {
	RunConsoleCommand("ent_create game_player_equip targetname TEMP_ITEM_EQUIP_SQUIRREL");
	RunConsoleCommand("ent_fire TEMP_ITEM_EQUIP_SQUIRREL addoutput " + item_class + " 1");
	DoEntFire("TEMP_ITEM_EQUIP_SQUIRREL", "Use", null, 0.0, ply, ply);
	RunConsoleCommand("ent_fire TEMP_ITEM_EQUIP_SQUIRREL Kill");
}

function GiveAllPlayersItem(item_class) {
	RunConsoleCommand("ent_create game_player_equip targetname TEMP_EQUIP_SQUIRREL");
	RunConsoleCommand("ent_fire TEMP_EQUIP_SQUIRREL AddOutput " + item_class + " 1");
	RunConsoleCommand("ent_fire TEMP_EQUIP_SQUIRREL TriggerForAllPlayers");
	RunConsoleCommand("ent_fire TEMP_EQUIP_SQUIRREL Kill");
}

function GetTeamID(team_name) {
	if (team_name == "unassigned") {
		return 0;
	}
	if (team_name == "spectators") {
		return 1;
	}
	if (team_name == "T") {
		return 2;
	}
	if (team_name == "CT") {
		return 3;
	}
}

function GetGameInfo() {
	local gM = ScriptGetGameMode();
	local gT = ScriptGetGameType();
	if (gT == 0) {
		if (gM == 0) {
			return "casual";
		}
		if (gM == 1) {
			return "competitive";
		}
	} else if (gT == 1) {
		if (gM == 0) {
			return "arms race";
		}
		if (gM == 1) {
			return "demolition";
		}
		if (gM == 2) {
			return "deathmatch";
		}
	} else {
		return "unknown";
	}
}

function GetAllPlayers() {
	local ply = null;
	local plyAmt = 0;
	while (Entities.FindByClassname(ply, "player") != null) {
		ply = Entities.FindByClassname(ply, "player");
		plyAmt = plyAmt + 1;
	}
	return plyAmt;
}
