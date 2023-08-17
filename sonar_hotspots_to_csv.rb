require_relative 'lib/sonar_hotspots_to_csv'

# take filename from command line, check it exists
filename = ARGV[0]
throw "No filename given" unless filename
throw "File not found" unless File.exist?(filename)

# read file
json = File.read(filename)

# convert to csv
puts SonarHotspotsToCSV.new(json).to_csv
