USE Insight_Base
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'Get_RoleData') AND OBJECTPROPERTY(id, N'ISPROCEDURE') = 1)
DROP PROCEDURE Get_RoleData
GO


/*****�洢���̣���ȡ����ģ��͹��ܲ����б�*****/

CREATE PROCEDURE Get_RoleData (@RoleId UNIQUEIDENTIFIER)

AS
BEGIN

SET NOCOUNT ON;

with
Mode as (
  select 0 as Mode, '�޹���' as Name union all
  select 1 as Mode, '������' as Name union all
  select 2 as Mode, '��������' as Name union all
  select 3 as Mode, '����������' as Name union all
  select 4 as Mode, '����������' as Name union all
  select 5 as Mode, '����������' as Name),
Groups as (
  select ID, null as ParentId, [Index], 0 as Type, Name, null as Permit, null as Description
  from SYS_ModuleGroup),
Modules as (
  select M.ID, M.ModuleGroupId as ParentId, isnull(G.[Index], 10) * 10 + M.[Index] as [Index],
  1 as Type, M.Name + '����' as Name
  from SYS_Module M
  join Groups G on G.ID = M.ModuleGroupId
  where M.Type = 1),
Actions as(
select case when D.ID is null then newid() else D.ID end as ID, M.ID as ParentId, M.[Index] * 10 + O.Mode as [Index], O.Mode + 2 as Type, O.Name,
D.Permission as Permit, case when D.Permission = 0 then 'ֻ��' when D.Permission = 1 then '��д' end as Description
from Modules M
join Mode O on O.Mode = O.Mode
left join SYS_RolePerm_Data D on D.ModuleId = M.ID
  and D.RoleId = @RoleId
  and D.Mode = O.Mode)

select *, Permit as state from Actions
union all
select distinct M.*, case when P.ID is not null then 1 end as Permit, null as Description, null as state
from Modules M
left join SYS_RolePerm_Data P on P.ModuleId = M.ID
  and P.RoleId = @RoleId
union all
select distinct G.*, null as state
from Groups G
join Modules M on M.ParentId = G.ID
order by [Index]

END

GO