-- name: StartWorkday :exec
INSERT INTO workdays (
	start, goal, is_active
	) VALUES (
		datetime('now'), ?, TRUE	
	)
	RETURNING start;

-- name: StartSession :exec
INSERT INTO sessions (
	start, workday_id
) VALUES (
		datetime(), ?
	);

-- name: EndSession :exec
UPDATE sessions
SET end = datetime('now')
WHERE workday_id = (SELECT id FROM workdays WHERE is_active = TRUE ORDER BY start DESC LIMIT 1)
AND end IS NULL;

-- name: EndWorkday :exec
UPDATE workdays
SET is_active = FALSE
WHERE id = (SELECT id FROM workdays WHERE is_active = TRUE ORDER BY start DESC LIMIT 1);

-- name: GetCurrentDayTotal :one
SELECT SUM((strftime('%s', COALESCE(end, datetime('now'))) - strftime('%s', start)) / 3600.0) AS total_hours
FROM sessions
WHERE workday_id = (SELECT id FROM workdays ORDER BY start DESC LIMIT 1);
