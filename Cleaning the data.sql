 ## Handling duplicates
 select count(*) as duplicates,track_name,artist_name
   from track_detail
   group by track_name,artist_name
   having count(*)>1;
   with ranked_songs as(
   select *,
   row_number() over(partition by track_name) as rn
   from track_detail)
   delete from track_detail
   where track_name in(
   select track_name from ranked_songs where rn>1);
   
    ## Handling null values
   select sum(popularity is null) as popularity_nulls,
   sum(danceability is null) as popularity_nulls,
   sum(energy is null) as energy_nulls,
   sum(duration_minutes is null) as duration_nulls
   from track_detail;
   