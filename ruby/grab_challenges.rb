#!/usr/bin/env ruby
# grab the "challenge" text from .Rmd files
# (in a set of lines that start with >)
# and put each in the center of a slide

ifiles = ["dplyr.Rmd", "ggplot2.Rmd"]
ofile = "challenge_slides.Rmd"

output = []

ifiles.each do |ifile|

    ifilep = File.open(ifile)
    ifilep.each do |line|

        if line =~ /^> \*\*Challenge/
            this_output = line.sub(/^>\s\*\*Challenge\*\*:\s*/, '')
            while !(ifilep.eof?) and (line2 = ifilep.readline()) =~ /^>/
                if line2 =~ /^>\s+$/
                    line2 = "\n"
                else
                    line2.sub!(/^>\s?/, "")
                end
                this_output += line2
            end
            output.push(this_output)
        end
    end
end

print "#{output.length} challenges\n"

ofilep = File.open(ofile, 'w')
ofilep.write("---\n")
ofilep.write("output: slidy_presentation\n")


challenge = 1
repeated8 = false
output.each do |ochunk|
    ofilep.write("---\n\n")
    ofilep.write("# Challenge #{challenge}\n\n")
    ofilep.write(ochunk)
    ofilep.write("\n")
    if challenge != 8 or repeated8 # challenge 8 is repeated; this could be done better but I'm in a hurry...
        challenge += 1
    else
        repeated8 = true
    end
end
