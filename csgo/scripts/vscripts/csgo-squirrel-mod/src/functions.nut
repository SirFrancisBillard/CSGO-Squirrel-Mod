// Source file for custom functions

this.gameIsOnPC				<- true; // True by default

function SetGameIsOnPC(OnPC) { // Function only used by map prefab
	gameIsOnPC = OnPC;
}

function GameIsOnPC() {
	return gameIsOnPC;
}

function RunConsoleCommand(cmd) {
	EntFire("SquirrelHooks_CommandCenter", "command " + cmd);
}

function RunConsoleCommandWithDelay(cmd, delay) {
	EntFire("SquirrelHooks_CommandCenter", "command " + cmd, delay);
}

function GiveAllPlayersItem(item_class) {
	RunConsoleCommand("ent_create game_player_equip targetname TEMP_EQUIP_SQUIRREL")
	EntFire("TEMP_EQUIP_SQUIRREL", "AddOutput " + item_class + " 1")
	EntFire("TEMP_EQUIP_SQUIRREL", "Kill")
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
