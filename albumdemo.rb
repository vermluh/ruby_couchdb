require 'json/ext'
require 'couchrest'

@db = "http://127.0.0.1:5984/albums"

@conn = CouchRest.database(@db)
puts @conn.inspect
#s = CouchRest.get(@db + '6e1295ed6c29495e54cc05947f18c8af')
s = @conn.get('6e1295ed6c29495e54cc05947f18c8af')
puts s.inspect
puts s
