#encoding: utf-8

require 'awesome_print'
require 'benchmark'
require 'couchrest'
require 'json/ext'

def read_parse_insert()
  json_mps = File.open("mp_log.json").read          # read measurements from file
  json_mps.gsub!(/[\n\r]/, '')                      # remove bad characters
  json_mps = "[" + json_mps.gsub("}{", "},{") + "]" # transform to JSON array
  mp = JSON.parse json_mps
  db = CouchRest.database! "http://127.0.0.1:5984/messungen"
  mp.each do |messung|
    response = db.save_doc(messung)
    ap response
  end
end

puts "operation took #{Benchmark.realtime { read_parse_insert } } seconds"
