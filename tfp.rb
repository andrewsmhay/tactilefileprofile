require './lib/determineos.rb'
require './lib/headerrow.rb'
require './lib/filecompare.rb'

os_select = Determineos.new
os_decided = os_select.os.to_s
pacl_array = []
pdacl_array = []
final_file = "final.csv"
f_file = []
f_dir = []

# Read in pre and post installation files, generate unique master_list.txt file
file_manip = Filecompare.new
puts file_manip.master_list.to_s


# Print the CSV header row from an array stored in headerrow.rb
#head_move = Headerrow.new
#thebigrow = head_move.thelist
#thebigrow.each {|headmovenow| print headmovenow, "|" }
#puts "" # adds an extra line after the last element

# If the operating system is a Unix, Linux, OS X, or other BSD system
if os_decided == "nix" 
# Creates the full path to the file
    currentpath = Dir.pwd+"/"+"master_list.txt"
# Opens the file for reading, line by line
    File.open(currentpath, "r").each_line do |pelement|
# [[Element Type ($PTYPE) | File Presence ($PFILE)]] 
	if (File.exist?(pelement.chomp) && ! File.directory?(pelement.chomp))
		pfuser = File.stat(pelement.chomp).uid
		pfgroup = File.stat(pelement.chomp).gid
		if File.stat(pelement.chomp).setuid?
			pfsuid = "Y"
		else
			pfsuid = "N"
		end
                if File.stat(pelement.chomp).setgid?
                        pfsgid = "Y"
                else
                        pfsgid = "N"
                end
		pacl_pre = File.stat(pelement.chomp).mode.to_s(8)
		pacl_array << pacl_pre.split(//)
		pacl = "#{pacl_array.last[-3..-1].join}"
		f_file << "Y|#{pelement.chomp!}|File||Y|#{pacl}|#{pfuser}|#{pfgroup}|#{pfsuid}|#{pfsgid}|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL"
	end
	if (File.exist?(pelement.chomp) && File.directory?(pelement.chomp))
		pduser = File.stat(pelement.chomp).uid
                pdgroup = File.stat(pelement.chomp).gid
		if File.stat(pelement.chomp).setuid?
                        pfsuid2 = "Y"
                else
                        pfsuid2 = "N"
                end
                if File.stat(pelement.chomp).setgid?
                        pfsgid2 = "Y"
                else
                        pfsgid2 = "N"
                end	
		if File.stat(pelement.chomp).sticky?
                        pwwd = "Y"
                else
                        pwwd = "N"
                end
		pdacl_pre = File.stat(pelement.chomp).mode.to_s(8)
                pdacl_array << pdacl_pre.split(//)
                pdacl = "#{pdacl_array.last[-3..-1].join}"
		f_dir << "Y|#{pelement.chomp!}|Directory||N|NULL|NULL|NULL|#{pfsuid2}|#{pfsgid2}|#{pdacl}|#{pduser}|#{pdgroup}|#{pwwd}|NULL|NULL|NULL|NULL|NULL|NULL"
	end
	File.open(final_file, "w"){ |f| f.write((f_file+f_dir).join("\n")) }
    end
# If the operating system is a Windows system
end
