require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    # p filename
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      Legislator.create(row.to_hash)
      # l = Legislator.new
      # row.each do |field, value|
      #   l.send(field, value)
      # end
      # l.save
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
