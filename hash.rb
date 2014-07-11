params = {:users => {:from => {"age" => "", "pay" => "", "weigh" => "200", "stature" => ""}, :to => {"age" => "", "pay" => "", "weigh" => "20", "stature" => ""}}}


from = params[:users][:from]
to   = params[:users][:to]

p = []


from.each do |f|
	if !f[1].empty?
		to[f[0]].empty? ? p.push("#{f[0]} = #{f[1]}") : to[f[0]] >= f[1] ? p.push("#{f[0]} BETWEEN #{f[1]} and #{to[f[0]]}") : "no"
	end
end

p = p.join(" AND ")
print "#{p}"