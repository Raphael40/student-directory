def method;"def method;;end;puts method()[0, 11] + 34.chr + method + 34.chr + method()[11, method.length-11]";end;
puts method()[0, 11] + 34.chr + method + 34.chr + method()[11, method.length-11]

eval s="print 'eval s=' ;p s"

File.open(__FILE__, "r") do |file|
  file.readlines.each do |line|
    puts line.chomp
  end
end