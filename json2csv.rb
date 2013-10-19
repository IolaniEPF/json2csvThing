#!/usr/bin/env ruby
require 'csv'
require 'json'

CSV.open("birth.csv", "w") do |csv| #open new file for write
  is_first_row = true
  JSON.parse(File.open("birth.json").read).each do |hash| #open json to parse
    if is_first_row
      csv << hash.keys
      is_first_row = false
    end
    csv << hash.values #write value to file
  end
end