require 'pg'
require 'json'

# Getting the information from the arguments
p_long =ARGV[0]
p_lat = ARGV[1]

# Connection to the Database:
@conn = PG.connect(:dbname => 'postgres',
                   :user => 'postgres',
                   :password => 'superadmin')

# Executing the Query:
@conn.exec( "SELECT ST_DISTANCE(ST_MakePoint(" + p_long + "," + p_lat + "), geom) as distance,
                    description, latitude, longitude
               FROM vehicle_data
               ORDER BY distance ASC
               LIMIT(10)" ) do |result|

# Creating an answer in json:
  my_json = '{"cars": []}'
  cars_in = JSON[my_json]
  result.each{ |row|
    cars_in['cars'] << {description: row["description"], latitud: row["latitude"], longitude: row["longitude"]}
  }
  cars_in.to_json

  puts JSON.pretty_generate(cars_in)
end
