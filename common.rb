require "active_record"
require "active_support/all"
require "get_process_mem"
require "sqlite3"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "people.sqlite3"
)

unless ActiveRecord::Base.connection.data_source_exists? 'people'
  ActiveRecord::Schema.define do
    create_table :people do |t|
      t.string :name
    end
  end
end

class Person < ActiveRecord::Base; end

def print_usage(description)
  mb = GetProcessMem.new.mb
  puts "#{ description } - MEMORY USAGE(MB): #{ mb.round }"
end

def print_usage_before_and_after
  print_usage("Before")
  yield
  print_usage("After")
end

def random_name
  (0...20).map { (97 + rand(26)).chr }.join
end
