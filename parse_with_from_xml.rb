require_relative "common"

print_usage_before_and_after do
  # From http://www.cs.washington.edu/research/xmldatasets/data/mondial/mondial-3.0.xml
  file = File.open("mondial-3.0.xml")
  hash = Hash.from_xml(file)["mondial"]["continent"]
  puts hash.map { |c| c["name"] }.join(", ")
end
