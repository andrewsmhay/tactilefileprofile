require './lib/ignore.rb'

class Filecompare 
	def master_list 
		output_file = "master_list.txt"
		filename = []
		ARGV.each do |arg|
  			filename << arg
		end
		f1 = IO.readlines(ARGV[0]).map(&:chomp)
		f2 = IO.readlines(ARGV[1]).map(&:chomp)
		f_final = f1+f2
		full_final = f_final.to_s
		File.open(output_file, "w"){ |f| f.write((f1+f2).uniq!.join("\n")) }
	end
	def master_list_excludes
		output_file = "master_list.txt"
                filename = []
                ARGV.each do |arg|
                        filename << arg
                end
                f1 = IO.readlines(ARGV[0]).map(&:chomp)
                f2 = IO.readlines(ARGV[1]).map(&:chomp)
                f_final = f1+f2
                full_final = f_final.to_s
                File.open(output_file, "w"){ |f| f.write((f1+f2).uniq!.join("\n")) }
        end
end
