:: Define command to execute tabcmd

set tabcmd=C:\Program Files\Tableau\Tableau Server\9.3\extras\Command Line Utility\tabcmd.exe



:: Define StartDate

set start_date=%1



:: Define Sign-Off Start Date. This date must be 14 days before the date above.

set sign-off_start_date=%2



:: Define ReportMonth

set report_month=%3



::Define ReportYear

set report_year=%4



::Define CurrentMonth

set current_month=%3



:: Define CurrentYear

set current_year=%4



:: Logging into Tableau Server

"%tabcmd%" login -s <server_name_redacted>:8000 -u <user_name_redacted> -p <password_redacted>
