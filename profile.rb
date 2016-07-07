require "memory_profiler"
require_relative "people"

report = MemoryProfiler.report do
  run(1000)
end
report.pretty_print(to_file: "profile.txt")
