// Remember: Include source code and prefab before workshop release!

this.Plugin_LongName <- "Global Offensive Roleplay";
this.Plugin_ShortName <- "GORP";
this.Plugin_Description <- "Step back from competitive and play the classic mode where wits are more powerful than bullets.";
this.Plugin_Version <- "0.4";
this.Plugin_Author <- "Sir Francis Billard";

this.JobNames <- {};
this.JobTeams <- {};
this.JobLimits <- {};
this.JobItems <- {};

this.DefaultLotteryCost <- 150;

function CreateJob(id, name, team, limit, items) {
	JobNames[id] <- name;
	JobTeams[id] <- team;
	JobLimits[id] <- limit;
	JobItems[id] <- items;
}

function CreateDefaultRPJobs() {
	CreateJob(10, "Citizen", GetTeamID("T"), 9999, {});
	CreateJob(20, "Police Officer", GetTeamID("CT"), 3, {"weapon_revolver", "weapon_taser"});
	CreateJob(30, "Gangster", GetTeamID("T"), 4, {"weapon_glock"});
	CreateJob(40, "Gun Dealer", GetTeamID("T"), 2, {});
	CreateJob(50, "Mayor", GetTeamID("CT"), 1, {});
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
	RunConsoleCommand("mp_give_player_c4 0");
	RunConsoleCommand("mp_buytime 99999999999999");
	RunConsoleCommand("mp_startmoney 200");
	RunConsoleCommand("mp_maxmoney 200000");
	RunConsoleCommand("mp_maxmoney 200000");
	RunConsoleCommand("mp_playercashawards 0");
	RunConsoleCommand("mp_afterroundmoney 0");
	RunConsoleCommand("mp_teamcashawards 0");
	RunConsoleCommand("mp_weapons_allow_map_placed 1");
	RunConsoleCommand("mp_weapons_glow_on_ground 1");
	RunConsoleCommand("mp_maxrounds 9999");
	RunConsoleCommand("mp_roundtime 99999999");
	RunConsoleCommand("mp_roundtime_defuse 99999999");
	RunConsoleCommand("mp_roundtime_hostage 99999999");
	RunConsoleCommand("mp_radar_showall 1");
	RunConsoleCommand("mp_respawn_on_death_t 1");
	RunConsoleCommand("mp_respawn_on_death_ct 1");
	RunConsoleCommand("sv_deadtalk 0");
	RunConsoleCommand("sv_alltalk 1");
	RunConsoleCommand("sv_allow_votes 0");
}

function SetPlayerJob(ply, job_id) {
	if not JobIsOverLimit(job_id) {
		SetTargetName(ply, JobNames[job_id]);
		ply.SetTeam(JobTeams[job_id]);
		foreach(curItem in JobItems[job_id]) {
			GivePlayerItem(ply, curItem);
		}
	}
}

function LockdownStatus(isLockdown) {
	if (isLockdown) {
		RunConsoleCommand("ent_fire GORP_LockdownSound PlaySound");
		ScriptPrintMessageCenterTeam(2, "The mayor has initiated a lockdown. Please return to your homes.");
		ScriptPrintMessageCenterTeam(3, "The mayor has initiated a lockdown. Patrol the city and protect the mayor.");
	} else {
		RunConsoleCommand("ent_fire GORP_LockdownSound StopSound");
		ScriptPrintMessageCenterTeam(2, "The lockdown has ended. You may leave your homes.");
		ScriptPrintMessageCenterTeam(3, "The lockdown has ended. You may return to the station.");
	}
}

function LotteryStart(money) {
	if (money == 0) {
		money = DefaultLotteryCost;
	}
	ScriptPrintMessageCenterAll("The mayor has started a lottery. Go to the casino to participate.")
	RunConsoleCommand("ent_fire GORP_EnterLotteryButtons Enable")
}

function OnMapLoad() {
	RPSettings()
	CreateDefaultRPJobs()
}

function OnNewRound() {

}
