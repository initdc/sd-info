#!/usr/bin/env ruby

def sd_info disk
  dir = "/sys/block/#{disk}/device/"

  d = Dir.new dir
  Dir.chdir dir do
    d.children.sort!.each do |child|
      if File.file?(child)
        puts "#{dir}#{child}"
        IO.popen("cat #{child}") do |r|
          puts r.readlines
        end
        puts
      end
    end
  end
end

sd_info ARGV[0]