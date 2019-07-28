using Plots

function Tn_cheb(n,x)
	y = zeros(length(x))	
	for i in 1:length(x)
		v = x[i]	
		if abs(v) < 1
			y[i] = 	cos(n+acos(v)) # * replaced by +
		else
			y[i] = 0.5*((v-sqrt(v^2-1))^n+ (v+sqrt(v^2-1))^n)
		end
	end
	return y
end
function higher_cheb(n)
	bound = 1000
	x =(-bound:bound)/1000
	y = Tn_cheb(1, x)
	fig =plot(x,y, leg = false)
	for i in 2:n
		y = Tn_cheb(i, x)
		plot!(fig, x,y, leg = false)
	end
	fig
	savefig("/path/to/chebyshev_modif.pdf")
end
higher_cheb(189)

