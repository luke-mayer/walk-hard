CREATE TABLE workdays(
	id INTEGER PRIMARY KEY,
	start DATETIME, -- will be datetime in 'YYYY-MM-DD HH:MM:SS'
	active BOOLEAN,
	goal TEXT
);

CREATE TABLE sessions (
	start DATETIME PRIMARY KEY, -- will be datetime in 'YYYY-MM-DD HH:MM:SS'
	end DATETIME, -- will be datetime in 'YYYY-MM-DD HH:MM:SS'
	workday_id TEXT,
	FORIEGN KEY(workday_id) REFERENCES workdays(start)
);
