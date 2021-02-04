DELETE FROM
 Authors -- change table name to delete duplicates in every table
 where rowid in (
 select rowid from
  (select
     rowid,
     row_number()
    over
     (partition by Name order by AuthorID) dup -- change partition for each table
    from Authors -- put current table
    )
 where dup > 1 );