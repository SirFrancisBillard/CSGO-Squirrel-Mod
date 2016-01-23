// Math

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

// Drawing

function DrawAxis(pos,s,nocull,time)
{
	DebugDrawLine(Vector(pos.x-s,pos.y,pos.z), Vector(pos.x+s,pos.y,pos.z), 255, 0, 0, nocull, time);
	DebugDrawLine(Vector(pos.x,pos.y-s,pos.z), Vector(pos.x,pos.y+s,pos.z), 0, 255, 0, nocull, time);
	DebugDrawLine(Vector(pos.x,pos.y,pos.z-s), Vector(pos.x,pos.y,pos.z+s), 0, 0, 255, nocull, time);
}

function DrawEntityBBox(ent,r,g,b,a,time)
{
	DebugDrawBox(ent.GetOrigin(),ent.GetBoundingMins(), ent.GetBoundingMaxs(), r, g, b, a, time)
}


// Tracers

class TraceInfo 
{
	constructor(h,d)
	{
		Hit = h;
		Dist = d;
	}
	Hit = null;
	Dist = null;
}

function TraceVec(start, end, filter)
{
	local dir = (end-start);
	local frac = TraceLine(start,end,filter);
	return TraceInfo(start+(dir*frac),dir.Length());
}

function TraceDir(orig, dir, maxd, filter)
{
	local frac = TraceLine(orig,orig+dir*maxd,filter);
	if(frac == 1.0) { return TraceInfo(orig+(dir*maxd),0.0);}
	return TraceInfo(orig+(dir*(maxd*frac)),maxd*frac);
}
