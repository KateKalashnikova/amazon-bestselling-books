-- Create trigger to auto-populate columns Created, CreatedBy, Updated, UpdatedBy
create or replace TRIGGER "WKSP_KATE"."AUTHORS_BIU" -- change trigger name to create trigger for each table
  BEFORE INSERT OR UPDATE ON "WKSP_KATE"."AUTHORS" -- change table name
  REFERENCING FOR EACH ROW
  begin 
    if inserting then 
        :new.Created := localtimestamp; 
        :new.CreatedBy := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.Updated := localtimestamp; 
    :new.UpdatedBy := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end AUTHORS_BIU; -- change trigger name