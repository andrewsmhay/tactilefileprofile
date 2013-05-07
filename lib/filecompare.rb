class Filecompare 
	def master_list 
		filename = []
		ARGV.each do |arg|
  			filename << arg
		end
		f1 = IO.readlines(ARGV[0]).map(&:chomp)
		f2 = IO.readlines(ARGV[1]).map(&:chomp)
		f_final = f1+f2
		full_final = f_final.to_s
		File.open("master_list.txt", "w"){ |f| f.write((f1+f2).uniq!.join("\n")) }
	end
end
