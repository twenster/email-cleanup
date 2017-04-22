#!/usr/bin/env ruby

# http://codereview.stackexchange.com/questions/42539/removing-list-of-words-from-a-text-file-in-ruby
require 'csv'

path = ".";
sourceFile = "emails.csv";
toRemoveFile = "emails-dictionary.txt";
cleanFile = "emails-cleaned.csv";

#
# DO NOT EDIT BELOW
#

# defines the opposite of string#chomp: Removes the first character.
class String
  def rchomp(sep = $/)
    self.start_with?(sep) ? self[sep.size..-1] : self
  end
end

#
# Readinf email adresses to remove
#
removeArray = Array.new
removeFile = File.read(toRemoveFile)

# and tranform the content into an array
open(File.join(path, toRemoveFile)).each_line do |removeLine|
  removeArray.push removeLine.chomp
end

# Creating a new file with the parse content
open(cleanFile, "w") do |output|

  # Reading the source file to parse
  open(File.join(path, sourceFile)).each_line do |sourceLine|

    # getting the email address for the current record
    # record format: [0] forename, [1] surname, [2] email, [3] country
    sourceArray = sourceLine.split(',')
    sourceEmail = sourceArray[2].rchomp('"').chomp('"')

    # If the email address in the current row is included in the email
    # addresses removing array, we skip this line.
    unless removeArray.include?(sourceEmail)

      output.write(sourceLine)

    end

  end
end

