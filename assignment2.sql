use moviedb; -- we have to choose the schema to run our queries
-- Let's answer the questions
# 1.  SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.
select a.act_id,
concat(act_fname, '  ' , act_lname) as act_name,
role
from 
actors as a
inner join movie_cast as mc on a.act_id = mc.act_id
where mov_id = 911;
-- here we have inner join two table actors and movie_cast so that we can know which actor is casted in which movie
-- also used where clause to select particular row


# 2. SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.
select 
mov_title,
concat(dir_fname , '  ' , dir_lname) as dir_name
from 
movie as m
inner join movie_direction as md on m.mov_id = md.mov_id
inner join director as d on d.dir_id = md.dir_id
where mov_title = 'eyes wide shut';
-- here we first inner join movie and movie_direction based on mov_id then inner joined the output to the director table based on dir_id
-- used where cluase to select the desired movie title


# 3. SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
select 
mov_title,
concat(dir_fname , '  ' , dir_lname) as dir_name
from
movie_cast as mc
inner join movie_direction as md on mc.mov_id = md.mov_id
inner join director as d on d.dir_id = md.dir_id 
inner join movie as m on m.mov_id = mc.mov_id 
where role = 'Sean Maguire';
-- here we inner joined 4 tables based on dir_id and mov_id so that we can extract different columns of different table
-- and used where clause to select the role


#4.SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year. 
select 
act_fname,
act_lname,
mov_title,
mov_year
from 
movie as m
inner join movie_cast as mc on m.mov_id = mc.mov_id
inner join actors as a on a.act_id = mc.act_id
where mov_year not between 1990 and 2000;
-- here again we joined three tables 1st on mov_id then act_id
-- used not between to answer the question


#5 . SQL query to find the directors with the number of genres of movies. Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres of movies.
select 
dir_fname,
dir_lname,
count(gen_title) as num_of_genre
from 
director as d
inner join movie_direction as md on d.dir_id = md.dir_id
inner join movie_genres as mg on mg.mov_id= md.mov_id
inner join genres as g on g.gen_id = mg.gen_id
GROUP BY dir_fname, dir_lname,gen_title
ORDER BY dir_fname,dir_lname asc;
-- here we inner joined 4 tables based onm dir_id, mov_id,gen_id then used group by and order by clause
-- then selected columns which we want in output also used count funtion to count the no. of genres


# 6.SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
select 
mov_title,
mov_year,
gen_title
from
movie as m
inner join movie_genres as mg on mg.mov_id = m.mov_id
inner join genres as g on g.gen_id = mg.gen_id;
-- used inner join to join three tables based on mov_id and gen_id
-- then selected particular columns


# 7.  SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release.
SELECT 
mov_title,
mov_dt_rel,
mov_year,
mov_time,
dir_fname,
dir_lname
from
movie as m
inner join movie_direction as md on md.mov_id = m.mov_id
inner join director as d on d.dir_id = md.dir_id
where mov_dt_rel < '1989-01-01'
order by mov_dt_rel desc;
-- we joined the desired tables based on mov_id and dir_id
-- used where clause to find set of rows we want
-- we ordered it by movie date of release
-- then we selected the columns we want


# 8 .  SQL query to compute the average time and count the number of movies for each genre.
select
gen_title,
avg(mov_time) as average_time,
count(m.mov_id) as num_of_mov
from
movie as m
inner join movie_genres as mg on mg.mov_id = m.mov_id
inner join genres as g on g.gen_id = mg.gen_id
group by g.gen_id;
-- we 1st inner joined tables
-- then grouped them by genres
-- used count function to count the number of movies in each genre
-- also used average funtion the find the average time of each genre

#9 . SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role
select  
mov_title,
mov_year,
dir_fname,
dir_lname,
act_fname,
act_lname,
role
from
movie as m
inner join movie_cast as mc on mc.mov_id=m.mov_id
inner join actors as a on a.act_id = mc.act_id
inner join movie_direction as md on md.mov_id = mc.mov_id
inner join director as d on d.dir_id = md.dir_id
where mov_time = (select MIN(mov_time) from movie);
-- here we inner joined 5 tables based on related id's to get desired related columns
-- used where clause to find the lowest movie time