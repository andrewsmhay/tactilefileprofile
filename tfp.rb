require 'rbconfig'
require 'digest'

# Initializes the array
directories = []
singlefile = []
fileyfile = [] 
fileytype = []

# If the operating system is a Unix, Linux, OS X, or other BSD system
if os == :nix 
# Put the header row
    puts "file|filetype|user|group|acl|hash"
# Glob the directory
#       directories = ['/root']
  directories = Dir.glob('/'"**/")
# Count the number of files, per directory
  directories.each do |countycount|
    fileyfile << Dir.glob(File.join(countycount, '**', '*'))
  end
  fileyfile.each do |filey|
    sha256 = Digest::SHA256.new
    digest = sha256.digest filey.to_s
    fileyfile.map {|elem| digest(elem) }
  end
#  fileyfile.each do |fstype|
# fileytype << File.ftype(fstype).to_s
# 
# puts "#{fileytype.sort}"
#  end
# Print the directory and count of files in '|' delimited format
# 
#end
end
