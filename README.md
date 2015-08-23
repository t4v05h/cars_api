# cars_api
HOW TO SET IT UP:

	1. Create the table vehicle_data in a Postgresql database.  The file “vehicle_data.backup” can be find in: https://github.com/t4v05h/cars_api
	2. In the file distance.rb the name of the database, the user and the password should be set:  (This file can be also find in github: https://github.com/t4v05h/cars_api)
HOW TO RUN IT:
The only data that the file “distance.rb” needs are the coordites of the actual position separated by a blank space, for example:
  
>ruby distance.rb 51.54.44104 -0.22707
HOW DOES IT WORKS:
The typed coordinates to call the program, are inserted in the next PostGIS query:

SELECT ST_DISTANCE(ST_MakePoint(51.5444204,-0.22707), geom) as distance,
       description, latitude, longitude
FROM vehicle_data
ORDER BY distance ASC 
LIMIT(10)

The result of this query is turned in an json object and then is displayed on the screen:

The image example.jpg shows the result of running the ruby file distance.rb (also available on https://github.com/t4v05h/cars_api)
