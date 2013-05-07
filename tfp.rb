require 'rbconfig'
require './lib/determineos.rb'
require './lib/headerrow.rb'
require './lib/filecompare.rb'

os_select = Determineos.new
os_decided = os_select.os.to_s
filename = []
udir_list = []

# Read in pre and post installation files, generate unique master_list.txt file
file_manip = Filecompare.new
puts file_manip.master_list.to_s


# Print the CSV header row from an array stored in headerrow.rb
head_move = Headerrow.new
thebigrow = head_move.thelist
thebigrow.each {|headmovenow| print headmovenow, "|" }
puts "" # adds an extra line after the last element

# If the operating system is a Unix, Linux, OS X, or other BSD system
if os_decided == "nix" 
# Take file name from STDIN 
#  ARGV.each do |arg|
#   filename << arg
#  end
# Run each file input
  filename.each do |spaniel|
# Creates the full path to the file
    currentpath = Dir.pwd+"/"+spaniel
# Opens the file for reading, line by line
    File.open(currentpath, "r").each_line do |pelement|
# [[Element Type ($PTYPE) | File Presence ($PFILE)]] 
      	if file_exists = File.exist?(pelement.chomp)
		puts "#{pelement.chomp}|File|Y|"
	end
      	if file_exists2 = File.directory?(pelement.chomp!)
		puts "#{pelement.chomp}|Directory|N|"
       	end
     end
end
# If the operating system is a Windows system
else
# Take file name from STDIN 
  ARGV.each do |arg|
   filename << arg
  end
# Run each file input
  filename.each do |spaniel|
# Creates the full path to the file
    currentpath = Dir.pwd+"/"+spaniel
# Opens the file for reading, line by line
    File.open(currentpath, "r").each_line do |line|
# prints the line to the screen
    puts line
  end
end
end
