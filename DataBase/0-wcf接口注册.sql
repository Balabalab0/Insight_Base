IF EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'SYS_Interface') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE SYS_Interface
GO
/*****ģ���*****/

CREATE TABLE SYS_Interface(
[ID]               UNIQUEIDENTIFIER CONSTRAINT IX_SYS_Interface PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
[SN]               BIGINT IDENTITY(1,1),                                                                               --��������
[Binding]          VARCHAR(32) NOT NULL,                                                                               --������
[Port]             VARCHAR(32) NOT NULL,                                                                               --����˿ں�
[Name]             VARCHAR(32) NOT NULL,                                                                               --ģ������
[Class]            VARCHAR(64) NOT NULL,                                                                               --ʵ���������ռ�
[Interface]        VARCHAR(64) NOT NULL,                                                                               --�ӿ��������ռ�
[Location]         NVARCHAR(MAX),                                                                                      --�ļ����·��
)
GO

insert SYS_Interface (Binding, Port, Name, Class, Interface, Location)
select 'HTTP', '80', 'Interface', 'Insight.WS.Service.Interface', 'Insight.WS.Service.IInterface', 'Services'
