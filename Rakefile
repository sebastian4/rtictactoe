task default: %w[timed spaces main spaced]
task test: %w[timed spaces test11]

task :main do
  ruby "ttt_main.rb"
end

task :test11 do
  ruby "tc_ttt_main.rb"
end

task :timed do
  time1 = Time.new
  puts "Current Time : " + time1.inspect
end

task :spaces do
    puts "\n\n\n\n \n\n\n\n \n\n\n\n \n\n\n\n \n\n\n\n"
end

task :spaced do
  puts "\n\n\n\n"
end

=begin
=end
