// Example plugin that kind of sucks but tries to be like TTT

this.MaxTraitors <- 5;
this.MaxDetectives <- 2;

function GiveDefaultItems() {
	GiveAllPlayersItem("weapon_knife");
	GiveAllPlayersItem("item_assaultsuit");
}

function MakeTraitor(ply) {
	ply.SetTeam(GetTeamID("T"));
	GivePlayerItem(ply, "weapon_mp7");
	GivePlayerItem(ply, "weapon_deagle");
	GivePlayerItem(ply, "weapon_molotov");
	GivePlayerItem(ply, "weapon_smokegrenade");
	GivePlayerItem(ply, "weapon_hegrenade");
}

function MakeDetective(ply) {
	ply.SetTeam(GetTeamID("CT"));
	GivePlayerItem(ply, "weapon_p90");
	GivePlayerItem(ply, "weapon_revolver");
	GivePlayerItem(ply, "weapon_flashbang");
	GivePlayerItem(ply, "weapon_taser");
}

function MakeInnocent(ply) {
	ply.SetTeam(GetTeamID("T"));
	GivePlayerItem(ply, "weapon_nova");
	GivePlayerItem(ply, "weapon_p250");
}

function AssignRoles() {
	local ply = null;
	while (Entities.FindByClassname(ply, "player") != null) {
		ply = Entities.FindByClassname(ply, "player");
		if (RandomPickTraitor()) {
			MakeTraitor(ply);
		} else if (RandomPickDetective()) {
			MakeDetective(ply);
		} else {
			MakeInnocent(ply);
		}
	}
}

function OnMapLoad() {

}

function OnNewRound() {
	GiveDefaultItems()
	AssignRoles()
	ScriptPrintMessageChatAll("Traitors have been chosen! Watch your backs!")
}
