require_relative "common"

def run(number)
  Person.delete_all

  names = number.times.map { random_name }

  names.each do |name|
    Person.create(name: name)
  end

  records = Person.all.to_a

  File.open("people.txt", "w") { |out| out << records.to_json }
end
