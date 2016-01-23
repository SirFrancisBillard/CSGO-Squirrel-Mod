// Example plugin that makes a very simple deathmatch mode

this.SpawnWithArmor <- true;

function OnMapLoad() {
	SendToConsole("mp_teammates_are_enemies 1");
	SendToConsole("mp_buy_anywhere 1");
	SendToConsole("mp_respawn_on_death_t 1");
	SendToConsole("mp_respawn_on_death_ct 1");
	if (SpawnWithArmor) {
		SendToConsole("mp_free_armor 1");
	}
}

function OnNewRound() {
	// There are no new rounds, this is deathmatch
}
