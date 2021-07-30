function math.sign(n)
	return n>0 and 1 or n<0 and -1 or 0
end

function math.clamp(n, min, max)
	return n<min and min or n>max and max or n
end

function math.lerp(a, b, t)
	return a+(b-a)*t
end