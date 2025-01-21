# Walk Hard

This is a basic time-tracking CLI tool because I am curious about how many
hours I am actually putting in a day.

## Commands I Want

- **start**
  - Starts clock for the day.
- **end**
  - Ends the clock for the day, saves total time to SQLite database.
  - Want to use specific command instead of just going by midnight
    because some days I might work past midnight and I want the entire
    same work period to be counted as the same day/shift.
- **pause**
  - Used for temporary clock stop.
  - Should have an option to set a warning to print to cli every _n_ minutes.
- **resume**
  - Starts clock again after a pause.
- **status**
  - Check current time total.
  - Options for the current day/shift, the current week, the current month, etc.,.
