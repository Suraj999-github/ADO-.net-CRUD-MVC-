
CREATE procedure [dbo].[sp_User]       
(   
@Flag NVARCHAR(100) =null, 
@Name NVARCHAR(100) =NULL,  
@Mobile NVARCHAR(20) =NULL,  
@UserId  NVARCHAR(20) =NULL, 
@Address NVARCHAR(100) =NULL
 
)      
As       
Begin       
   if(@Flag='Insert') 
BEGIN
	INSERT INTO tbl_User([Name],[Address],Mobile)
	Values(@Name,@Mobile,@Address)

	select '0' as ErrorCode,'Sucessfully Added' as Msg
END
   if(@Flag='List') 
BEGIN
	select * from tbl_User
END

   if(@Flag='Delete') 
BEGIN
	delete from tbl_User where UserId=@UserId

	select '0' as ErrorCode,'Sucessfully Deleted' as Msg
END

   if(@Flag='Update') 
BEGIN
if not  exists (select 'X' from tbl_User where UserId=@UserId)
begin
select '1' as ErrorCode,'Sorry User already deleted' as Msg
return;
end
else
begin
update tbl_User set [Name]=@Name,[Address]=@Address,Mobile=@Mobile where UserId=@UserId
select '0' as ErrorCode,'Sucessfully Updated' as Msg
end	
	
END



End  



       