# cars_api
HOW TO SET IT UP:

	1. Create the table vehicle_data in a Postgresql database.  In order to do this, please use the table back up in the file “vehicle_data.backup".
	2. In the file distance.rb the name of the database, the user and the password should be set:  
	# Connection to the Database:
	@conn = PG.connect(:dbname => 'postgres',
                   	   :user => 'postgres',
                   	   :password => 'superadmin')	

HOW TO RUN IT:
The only data that the file “distance.rb” needs are the coordinates of the actual position separated by a blank space, for example:
  >ruby distance.rb 51.54.44104 -0.22707
  
HOW DOES IT WORKS:
The typed coordinates to call the program, are inserted in the next PostGIS query:

SELECT ST_DISTANCE(ST_MakePoint(51.5444204,-0.22707), geom) as distance,
       description, latitude, longitude
FROM vehicle_data
ORDER BY distance ASC 
LIMIT(10)

The result of this query is turned in an json object and then is displayed on the screen:

The image example.jpg shows the result of running the ruby file distance.rb
