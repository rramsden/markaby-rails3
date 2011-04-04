require "../lib/markaby"
require "benchmark"

mab = Markaby::Builder.new

time = Benchmark.realtime do 
  1_000.times {
    mab.html do
      head { title "Boats.com" }
      body do
        h1 "Boats.com has great deals"
        ul do
          li "$49 for a canoe"
          li "$39 for a raft"
          li "$29 for a huge boot that floats and can fit 5 people"
        end
      end
    end
  }
end

puts "Time elapsed #{time*1000} milliseconds"
