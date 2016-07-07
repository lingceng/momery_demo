require_relative "common"

print_usage_before_and_after do
  File.open("people.txt", "w") { |out| out << Person.all.to_json }
end
