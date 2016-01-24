// My attempt at making some sort of RP gamemode in CSGO

this.JobNames = {};
this.JobTeams = {};
this.JobLimits = {};
this.JobItems = {};

function CreateJob(id, name, team, limit, items) {
	JobNames[id] <- name;
	JobTeams[id] <- team;
	JobLimits[id] <- limit;
	JobItems[id] <- items;
}

function CreateDefaultRPJobs() {
	CreateJob(10, "Citizen", GetTeamID("T"), 9999, {});
	CreateJob(20, "Police Officer", GetTeamID("CT"), 3, {"weapon_p250", "weapon_taser"})
	CreateJob(30, "Gangster", GetTeamID("T"), 4, {"weapon_mac10"})
	CreateJob(40, "Gun Dealer", GetTeamID("T"), 2, {})
}

function JobIsOverLimit(job_id) {
	local jobAmt = GetAllPlayersWithTarget(JobNames[job_id]);
	if (jobAmt > TableValue(JobLimits[job_id])) {
		return true;
	} else {
		return false;
	}
}

function RPSettings() {
	RunConsoleCommand("mp_teammates_are_enemies 1");
	RunConsoleCommand("mp_damage_scale_ct_head 0.5");
	RunConsoleCommand("mp_damage_scale_ct_body 0.5");
	RunConsoleCommand("sv_deadtalk 0");
	RunConsoleCommand("sv_alltalk 1");
	RunConsoleCommand("sv_allow_votes 0");
}

function SetPlayerJob(ply, job_id) {
	SetTargetName(ply, JobNames[job_id]);
	ply.SetTeam(JobTeams[job_id]);
	foreach(curItem in JobItems[job_id]) {
		GivePlayerItem(ply, curItem);
	}
}

function GiveDefaultItems() {
	GiveAllPlayersItem("weapon_knife");
}

function OnMapLoad() {

}

function OnNewRound() {

}
