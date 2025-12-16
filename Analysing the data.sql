 ## tamil songs have an average popularity of around 13 
   select min(popularity) as min_popularity,
   max(popularity) as max_popularity,
   avg(popularity) as avg_popularity
   from track_detail;
   
   
   ##popularity of tamil songs over years
   select avg(popularity),released_year 
   from track_detail
   group by released_year 
   order by released_year desc;
   
   
   ##popularity vs  danceability
   select max(danceability)
   from track_detail;
   select 
     case
        when danceability<0.5 then 'low'
         when danceability between 0.5 and 1 then 'high'
	  end as danceability_level,
      avg(popularity) as average_popularity
      from track_detail
      group by danceability_level;
      
      
      ##popularity vs  energy
      select max(energy) from track_detail;
	select 
	case
        when energy<0.5 then 'low'
         when energy between 0.5 and 1 then 'high'
	  end as energy_level,
      avg(popularity) as popularity_average
      from track_detail
       group by energy_level;
       
       
	##time duartion vs popularity
    select min(duration_minutes) from track_detail;
	select 
	case
        when duration_minutes<3 then 'less_duration'
         when duration_minutes between 3 and 60 then 'high_duration'
	  end as duration_level,
      avg(popularity) as popularity_average, count(*)
      from track_detail
       group by duration_level;
       
       ##top 10 artist based on popularity
       select artist_name,avg(popularity),count(*)
       from track_detail
       group by artist_name
       having count(*)>=5
       order by avg(popularity) desc
       limit 10;
       
       ##mood vs popularity
		select min(valence) from track_detail;
       select 
	case
        when valence<=0.2 then 'sad_song'
         when valence>0.2 then 'happy_song'
	  end as mood_level,
      avg(popularity) as popularity_average, count(*)
      from track_detail
       group by mood_level;