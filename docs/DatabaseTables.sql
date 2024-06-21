
CREATE TABLE TAG_MONITORING_HISTORY (
    ID int IDENTITY(1,1) NOT NULL,
    PLC_NAME varchar(50) NOT NULL,
    TAG_NAME varchar(50) NOT NULL,
    TAG_READ_DATE DateTime NOT NULL,
    TAG_VALUE_AS_STRING varchar(100) NOT NULL,
    DATE_INSERTED DateTime NOT NULL,
	CONSTRAINT PK_TAG_MONITORING_HISTORY PRIMARY KEY (PLC_NAME, TAG_NAME, TAG_READ_DATE)
);

--read most current plc tag value
select top 1 [PLC_NAME], [TAG_NAME], [TAG_READ_DATE], [TAG_VALUE_AS_STRING] from TAG_MONITORING_HISTORY
where upper([PLC_NAME]) = upper('DRAGON PLC') and Upper([TAG_NAME]) = Upper('FIREVALVE')
order by TAG_READ_DATE desc


--grouping
select top 1 [PLC_NAME], [TAG_NAME], [TAG_READ_DATE] from TAG_MONITORING_HISTORY
group by [PLC_NAME], [TAG_NAME], [TAG_READ_DATE] 
having upper([PLC_NAME]) = upper('DRAGON PLC') and Upper([TAG_NAME]) = Upper('FIREVALVE')
order by TAG_READ_DATE desc


CREATE TABLE FRIENDLY_TAG_NAME (
    PLC_NAME varchar(50) NOT NULL,
    TAG_NAME varchar(50) NOT NULL,
    FRIENDLY_NAME varchar(50) NOT NULL,
	CONSTRAINT PK_FRIENDLY_TAG_NAME PRIMARY KEY (PLC_NAME, FRIENDLY_NAME)
);

insert into FRIENDLY_TAG_NAME(PLC_NAME, TAG_NAME, FRIENDLY_NAME) values ('TATA TEA', 'CTask_JFile[3].Item[0].Actual', 'A');   --possible friendly name: C3I0 Actual
insert into FRIENDLY_TAG_NAME(PLC_NAME, TAG_NAME, FRIENDLY_NAME) values ('TATA TEA', 'CTask_JFile[3].Item[0].Code', 'B');     --possible friendly name: C3I0 Code
insert into FRIENDLY_TAG_NAME(PLC_NAME, TAG_NAME, FRIENDLY_NAME) values ('TATA TEA', 'CTask_JFile[3].Item[0].Request', 'C');  --possible friendly name: C3I0 Request
insert into FRIENDLY_TAG_NAME(PLC_NAME, TAG_NAME, FRIENDLY_NAME) values ('TATA TEA', 'CTask_JFile[3].Item[0].Status.Complete', 'D');  --possible friendly name: C3I0 Status

--read most current plc tag value by friendly name
select top 1 tmh.PLC_NAME, tmh.TAG_NAME, tmh.TAG_READ_DATE, tmh.TAG_VALUE_AS_STRING from TAG_MONITORING_HISTORY tmh
inner join FRIENDLY_TAG_NAME ftm on (ftm.TAG_NAME = tmh.TAG_NAME and ftm.PLC_NAME = tmh.PLC_NAME)
where upper(ftm.PLC_NAME) = upper('TATA TEA') and Upper(ftm.FRIENDLY_NAME) = Upper('A')
order by TAG_READ_DATE desc

