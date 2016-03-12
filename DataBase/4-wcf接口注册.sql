use Insight_Base
go

IF EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'SYS_Interface') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE SYS_Interface
GO
/*****ģ���*****/

CREATE TABLE SYS_Interface(
[ID]               UNIQUEIDENTIFIER CONSTRAINT IX_SYS_Interface PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
[SN]               BIGINT IDENTITY(1,1),                                                                               --��������
[Port]             VARCHAR(8),                                                                                         --����˿ں�
[Path]             VARCHAR(16),                                                                                        --����·��
[NameSpace]        VARCHAR(128) NOT NULL,                                                                              --���������ռ�
[Interface]        VARCHAR(64) NOT NULL,                                                                               --�ӿ�����
[Service]          VARCHAR(64) NOT NULL,                                                                               --����������
[ServiceFile]      NVARCHAR(MAX)  NOT NULL,                                                                            --�ļ�·��
)
GO

insert SYS_Interface (Port, Path, NameSpace, Interface, Service, ServiceFile)
select NULL, NULL, 'Insight.WS.Base', 'IVerify', 'Verify', 'Services\Verify.dll' union all
select NULL, 'modules', 'Insight.WS.Base', 'IModule', 'Modules', 'Services\Modules.dll' union all
select NULL, 'orgs', 'Insight.WS.Base', 'IOrganizations', 'Organizations', 'Services\Organizations.dll' union all
select NULL, 'users', 'Insight.WS.Base', 'IUsers', 'Users', 'Services\Users.dll' union all
select NULL, 'roles', 'Insight.WS.Base', 'IRoles', 'Roles', 'Services\Roles.dll' union all
select NULL, 'codes', 'Insight.WS.Base', 'ICodes', 'Codes', 'Services\Codes.dll'
