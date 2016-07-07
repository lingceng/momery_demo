require_relative "common"
require "ox"

class Handler < ::Ox::Sax
  def initialize(&block)
    @yield_to = block
  end

  def start_element(name)
    case name
    when :continent
      @in_continent = true
    end
  end

  def end_element(name)
    case name
    when :continent
      @yield_to.call(@name) if @name
      @in_continent = false
      @name = nil
    end
  end

  def attr(name, value)
    case name
    when :name
      @name = value if @in_continent
    end
  end
end

print_usage_before_and_after do
  # From http://www.cs.washington.edu/research/xmldatasets/data/mondial/mondial-3.0.xml
  file = File.open("mondial-3.0.xml")
  continents = []
  handler = Handler.new do |continent|
    continents << continent
  end
  Ox.sax_parse(handler, file)

  puts continents.join(", ")
end
