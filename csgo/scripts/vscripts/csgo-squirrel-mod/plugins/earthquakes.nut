// Example plugin that creates earthquakes

this.QuakeDelayMin <- 120.0;
this.QuakeDelayMax <- 180.0;

function MakeQuake() {
	RunConsoleCommand("ent_create env_shake TempQuakeMaker");
	EntFire("TempQuakeMaker", "Amplitude", 16);
	EntFire("TempQuakeMaker", "AddOutput", "EffectRadius 99999999999999999999");
}

function OnMapLoad() {

}

function OnNewRound() {

}
