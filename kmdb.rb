# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Studio.destroy_all
Agent.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

#in terminal: rails generate model Movie
#in db file: t.string "title", t.integer "year_released", t.string "rated", t.integer "studio_id"
#
#in terminal: rails generate model Studio
#in db file: t.string "name"
#
#in terminal: rails generate model Actor
#in db file: t.string "name", t.integer "agent_id"
#
#in terminal: rails generate model Role
#in db file: t.integer "movie_id", t.integer "actor_id", t.string "character_name"
#in terminal: rails generate model Agent
#in db file: t.string "name"

#In terminal: rail db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# populate agent table
agent = Agent.new
agent["name"] = "Nick Stagl"
agent.save
p agent

#Populate studio table
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save
p studio
#populating movies creating studio_id's first
wb = Studio.find_by({"name" => "Warner Bros."})
movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["rated"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["rated"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["rated"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save

#populating actor table and defining the agent foreign key
ns = Agent.find_by({"name" => "Nick Stagl"})
actor = Actor.new
actor["name"] = "Christian Bale"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Michael Caine"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Liam Neeson"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Katie Holmes"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Gary Oldman"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Cillian Murphy"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Heath Ledger"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Morgan Freeman"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Tom Hardy"
actor["agent_id"] = ns["id"]
actor.save 

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor["agent_id"] = ns["id"]
actor.save 

# Populate the Characters table and define actor and movie foreign keys
cb = Actor.find_by({"name" => "Christian Bale"})
mc = Actor.find_by({"name" => "Michael Caine"})
ln = Actor.find_by({"name" => "Liam Neeson"})
kh = Actor.find_by({"name" => "Katie Holmes"})
go = Actor.find_by({"name" => "Gary Oldman"})
cm = Actor.find_by({"name" => "Cillian Murphy"})
hl = Actor.find_by({"name" => "Heath Ledger"})
ae = Actor.find_by({"name" => "Aaron Eckhart"})
mg = Actor.find_by({"name" => "Maggie Gyllenhaal"})
mf = Actor.find_by({"name" => "Morgan Freeman"})
ah = Actor.find_by({"name" => "Anne Hathaway"})
th = Actor.find_by({"name" => "Tom Hardy"})
jg = Actor.find_by({"name" => "Jospeh Gordon-Levitt"})

bb = Movie.find_by({"title" => "Batman Begins"})
dk = Movie.find_by({"title" => "The Dark Knight"})
dkr = Movie.find_by({"title" => "The Dark Knight Rises"})

role = Role.new
role["character_name"] = "Bruce Wayne"
role["actor_id"] = cb["id"]
role["movie_id"] = bb["id"]
role.save

role = Role.new
role["character_name"] = "Alfred Pennyworth"
role["actor_id"] = mc["id"]
role["movie_id"] = bb["id"]
role.save

role = Role.new
role["character_name"] = "Ra's al Ghul"
role["actor_id"] = ln["id"]
role["movie_id"] = bb["id"]
role.save

role = Role.new
role["character_name"] = "Rachel Dawes"
role["actor_id"] = kh["id"]
role["movie_id"] = bb["id"]
role.save

role = Role.new
role["character_name"] = "James Gordon"
role["actor_id"] = go["id"]
role["movie_id"] = bb["id"]
role.save

role = Role.new
role["character_name"] = "Joanthan Crane"
role["actor_id"] = cm["id"]
role["movie_id"] = bb["id"]
role.save

role = Role.new
role["character_name"] = "Bruce Wayne"
role["actor_id"] = cb["id"]
role["movie_id"] = dk["id"]
role.save

role = Role.new
role["character_name"] = "Joker"
role["actor_id"] = hl["id"]
role["movie_id"] = dk["id"]
role.save

role = Role.new
role["character_name"] = "Harvey Dent"
role["actor_id"] = ae["id"]
role["movie_id"] = dk["id"]
role.save

role = Role.new
role["character_name"] = "Rachel Dawes"
role["actor_id"] = mg["id"]
role["movie_id"] = dk["id"]
role.save

role = Role.new
role["character_name"] = "James Gordon"
role["actor_id"] = go["id"]
role["movie_id"] = dk["id"]
role.save

role = Role.new
role["character_name"] = "Lucius Fox"
role["actor_id"] = mf["id"]
role["movie_id"] = dk["id"]
role.save

role = Role.new
role["character_name"] = "Bruce Wayne"
role["actor_id"] = cb["id"]
role["movie_id"] = dkr["id"]
role.save

role = Role.new
role["character_name"] = "Selina Kyle"
role["actor_id"] = ah["id"]
role["movie_id"] = dkr["id"]
role.save

role = Role.new
role["character_name"] = "Bane"
role["actor_id"] = th["id"]
role["movie_id"] = dkr["id"]
role.save

role = Role.new
role["character_name"] = "James Gordon"
role["actor_id"] = go["id"]
role["movie_id"] = dkr["id"]
role.save

role = Role.new
role["character_name"] = "Lucius Fox"
role["actor_id"] = mf["id"]
role["movie_id"] = dkr["id"]
role.save

role = Role.new
role["character_name"] = "John Blake"
role["actor_id"] = jg["id"]
role["movie_id"] = dkr["id"]
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
