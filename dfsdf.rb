str = "**[word]** \\[word]\\ ((name1/name2/name3[string])) Someword ((name4/name5/name6[string]))"

replacements = [['**[', '<b>'],[']**', '</b>'],['\\[','<i>'],[']\\','</i>'],]

replacements.each do |replacement|
	str.gsub!(replacement[0], replacement[1])
end

str.scan(/\(\([\w]+\/[\w]+\/[\w]+\[\w+\]\)\)/).each do |r|
	link_without_string = r.sub(/\[[\w\s]+\]/,'').scan(/\(\(([\w\W]+)\)\)/)[0][0]
	string = r.scan(/\[([\w]+)\]/)[0][0]
	str.gsub!(r,"<a href=\"#{link_without_string}\">#{string}</a>")
end

print str