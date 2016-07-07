require_relative "common"

ARRAY_SIZE = 1_000_000

times = ARGV.first.to_i

print_usage(0)
(1..times).each do |n|
  foo = []
  ARRAY_SIZE.times { foo << {some: "stuff"} }

  print_usage(n)
end
