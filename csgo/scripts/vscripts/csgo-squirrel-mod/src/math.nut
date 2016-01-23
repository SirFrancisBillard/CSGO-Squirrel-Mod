function Distance2D(vec1,vec2) {
	local a = (vec2.x-vec1.x);
	local b = (vec2.y-vec1.y);
	return sqrt((a*a)+(b*b));
}

function Distance3D(vec1,vec2)
{
	local a = (vec2.x-vec1.x);
	local b = (vec2.y-vec1.y);
	local c = (vec2.z-vec1.z);
	return sqrt((a*a)+(b*b)+(c*c));
}

function AngleBetween2(vec1,vec2)
{
	local aZ = atan2((vec1.z - vec2.z),(vec1.x - vec2.x))+Pi;	
	local aY = atan2((vec1.z - vec2.z),(vec1.y - vec2.y))+Pi;
	return Vector(aY,aZ,0.0);
}

function AngleDiff(angle0,angle1)
{
	return (abs((angle0 + Pi -  angle1)%(Pi*2.)) - Pi);
}

function NormalizeVector(vec)
{
	local len = vec.Length();
	return Vector(vec.x/len,vec.y/len,vec.z/len);
}
