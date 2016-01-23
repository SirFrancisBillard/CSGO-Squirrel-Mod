// Key inputs and outputs
this.PlayerActivated <- false;
this.PlayerPressingLeft <- false;
this.PlayerPressingRight <- false;
this.PlayerPressingForward <- false;
this.PlayerPressingBack <- false;
this.PlayerPressingAttack = false;
this.PlayerPressingAttack2 = false;

// Player activated

function GetPlayerActivated() {
	return PlayerActivated;
}

function PlayerActivatedDisable() {
	PlayerActivated = false;
}

function PlayerActivatedEnable() {
	PlayerActivated = true;
}

// Player pressing left

function GetPlayerPressingLeft() {
	return PlayerPressingLeft;
}

function PlayerPressingLeftDisable() {
	PlayerPressingLeft = false;
}

function PlayerPressingLeftEnable() {
	PlayerPressingLeft = true;
}

// Player pressing right

function GetPlayerPressingRight() {
	return PlayerPressingRight;
}

function PlayerPressingRightDisable() {
	PlayerPressingRight = false;
}

function PlayerPressingRightEnable() {
	PlayerPressingRight = true;
}
