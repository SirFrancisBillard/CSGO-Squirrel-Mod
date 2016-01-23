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
