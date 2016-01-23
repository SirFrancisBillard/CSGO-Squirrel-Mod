// Example plugin that kind of sucks but tries to be like TTT

this.MaxTraitors <- 5;
this.MaxDetectives <- 2;

function AssignRoles() {
	local ply = null;
	while (Entities.FindByClassname(ply, "player") != null) {
		ply = Entities.FindByClassname(ply, "player");
		if (RandomPickTraitor()) {
			MakeTraitor(ply);
		} else if (RandomPickDetective()) {
			MakeDetective(ply);
		}
	}
}

function OnMapLoad() {

}

function OnNewRound() {

}
