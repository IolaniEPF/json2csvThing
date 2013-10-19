#!/usr/bin/env ruby
require 'csv'
require 'json'

INPUT_DIR = "INPUT"
OUTPUT_DIR = "OUTPUT"

def convertToCSVFromJSON(json_name)
  CSV.open("#{OUTPUT_DIR}/#{json_name}.csv", "w") do |csv| #open new file for write
    JSON.parse(File.open("#{INPUT_DIR}/#{json_name}.json").read).each do |hash| #open json to parse
      results = hash[1]

      # write column headers
      csv << results.first.keys

      # write each row
      results.each do |row|
        csv << row.values #write value to file
      end
    end
  end
end

# names = [
#   "Avatar",
#   "Background",
#   "Badges",
#   "Balances", 
#   "GlobalStatus",
#   "NewBalances",
#   "NewStory",
#   "Transactions",
#   "XPTransactions"
# ]
names = [
  "Transactions"
]

names.each do |name|
  convertToCSVFromJSON name
end