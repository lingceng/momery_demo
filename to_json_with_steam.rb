require_relative "common"
require "json-write-stream"

print_usage_before_and_after do
  file = File.open("people.txt", "w")
  JsonWriteStream.from_stream(file) do |writer|
    writer.write_object do |obj_writer|
      obj_writer.write_array("people") do |arr_writer|
        Person.find_each do |people|
          arr_writer.write_element people.as_json
        end
      end
    end
  end
end
