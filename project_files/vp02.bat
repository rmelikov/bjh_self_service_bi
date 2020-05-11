:: Define VP directories

set vp02=S:\PCS\Box Drive\Box Sync\Coreen Vlodarchyk\

::set pcs_archive=S:\PCS\URC_KPI\PCS_Audit\2017\PCS_PrintedReport\Archive\
set pcs_archive=S:\PCS\URC_KPI\PCS_Audit\%current_year%\PCS_PrintedReport\Archive\



:: Defining VP user ID

set vp02_nt_id=crv0122



:: Defining VP employee ID

set vp02_emp_id=0046401226



:: Changing directory to vp02

pushd %vp02%



::Creating a log file

echo %date% > ../vp02_log.txt
echo: >> ../vp02_log.txt



:: Setting ErrorLevel to 0

(call )



:: 001

:: Getting the view for Dashboard1 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EmployeeMovementExecHR/Dashboard1?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "01_EM_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 001 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 002

:: Getting the view for Dashboard2 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EmployeeMovementExecHR/Dashboard2?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "02_EM_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 002 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 003

:: Getting the view for Definitions and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EmployeeMovementExecHR/Definitions?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "03_EM_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 003 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 004

:: Combining all of the single views that were created into a single PDF document

pdftk "*EM_%vp02_nt_id%.pdf" cat output "BJH_Employee_Movement.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 004 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 005

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*EM_%vp02_nt_id%.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 005 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 006

:: Getting the view for "Cancel-Meal" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/CANCEL-MEAL-VP/CANCEL-MEAL?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "04_HC_CM_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 006 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 007

:: Getting the view for "Early-In" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EARLY-IN-VP/EARLY-IN?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "05_HC_EI_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 007 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 008

:: Getting the view for "Emp-Movement" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EMP-MOVEMENT-VP/EMP-MOVEMENT?emp=%vp02_emp_id%" --pdf -f "02_HC_EM_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 008 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 009

:: Getting the view for "Late-Out" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/LATE-OUT-VP/LATE-OUT?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "06_HC_LO_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 009 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 010

:: Getting the view for "Pay" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PAY?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "01_HC_P_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 010 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 011

:: Getting the view for "Sign-Off" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/SIGN-OFF-VP/SIGN-OFF?emp=%vp02_emp_id%&StartDate=%sign-off_start_date%" --pdf -f "03_HC_SO_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 011 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 012

:: Combining all of the single views that were created into a single PDF document

pdftk "*HC*%vp02_nt_id%.pdf" cat output "VP_Human_Capital_Bi-Weekly.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 012 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 013

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*HC*%vp02_nt_id%.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 013 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 014

:: Getting the view for "Premium Pay 1" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PremiumPayActualTargetandVarianceCurrentYearYTDReport1forVP?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "Premium_Pay_1_Actual_Target_Variance_Current_Year_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 014 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 015

:: Getting the view for "Premium Pay 2" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PremiumPayActualTargetandVarianceCurrentYearYTDReport2forVP?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "Premium_Pay_2_Actual_Target_Variance_Current_Year_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 015 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 016

:: Getting the view for "Premium Pay 3" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PremiumPayActualforBJHGDPCategorybyUnitsReport3forVP?emp=%vp02_emp_id%&StartDate=%start_date%" --pdf -f "Premium_Pay_3_Actual_for_BJH_GDP_Category_by_Units.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 016 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 017

:: Getting the view for "BJH Human Capital Summary" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Summary/BJHHumanCapitalExecutiveSummary?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "01_BJH_HC_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 017 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 018

:: Getting the view for "BJH Human Capital Summary Definitions" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Summary/BJHHumanCapitalSummaryDefinitions" --pdf -f "02_BJH_HC_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 018 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 019

:: Combining all of the single views that were created into a single PDF document

pdftk "*BJH_HC_%vp02_nt_id%.pdf" cat output "BJH_Human_Capital_Summary.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 019 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 020

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*HC*%vp02_nt_id%.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 020 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 021

:: Getting the view for "BJH Human Capital Executive Summary" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Executive/BJHHumanCapitalExecutiveSummary?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "01_BJH_HC_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 021 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 022

:: Getting the view for "BJH Human Capital Executive Summary Definitions" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Executive/BJHHumanCapitalExecutiveSummaryDefinitions" --pdf -f "02_BJH_HC_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 022 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 023

:: Combining all of the single views that were created into a single PDF document

pdftk "*BJH_HC_%vp02_nt_id%.pdf" cat output "BJH_Human_Capital_Executive_Scorecard.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 023 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 024

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*HC*%vp02_nt_id%.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 024 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 025

:: Getting the view for "VP Supply Page 1" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyExpenses-Page1c?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp02_emp_id%" --pdf -f "01_Supply_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 025 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 026

:: Getting the view for "VP Supply Page 2" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyExpenses-Page3?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp02_emp_id%" --pdf -f "02_Supply_%vp02_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 026 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 027

:: Combining all of the single views that were created into a single PDF document

pdftk "*Supply_%vp02_nt_id%.pdf" cat output "VP_Supply_Expenses.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 027 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 028

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*Supply_%vp02_nt_id%.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 028 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 029

:: Getting the view for "VP Supply Report 1" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyReport1-CurrentMonthSupplyScorecard?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp02_emp_id%" --pdf -f "VP_Supply_1_Current_Month.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 029 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 030

:: Getting the view for "VP Supply Report 2" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyReport2-YTDSupplyScorecard?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp02_emp_id%" --pdf -f "VP_Supply_2_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 030 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 031

:: Getting the view for "VP Supply Report 3" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyReport3?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp02_emp_id%" --pdf -f "VP_Supply_3_YTD_Variance.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 031 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 032

:: Getting the view for "VP Supply Report" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyReport?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp02_emp_id%" --pdf -f "VP_Supply_4_CM_and_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 032 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 033

:: Going to the PCS Archive directory, finding the latest *book1* file and storing its location and name into a variable

for /f "delims=|" %%i in ('dir "%pcs_archive%*book1*.pdf" /b /o:d') do set book1=%pcs_archive%%%~i



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 033 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 034

:: Going to the PCS Archive directory, finding the latest *book2* file and storing its location and name into a variable

for /f "delims=|" %%i in ('dir "%pcs_archive%*book2*.pdf" /b /o:d') do set book2=%pcs_archive%%%~i



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 034 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 035

:: Going to the PCS Archive directory, finding the latest *key metrics* file and storing its location and name into a variable

for /f "delims=|" %%i in ('dir "%pcs_archive%*key*.pdf" /b /o:d') do set keymtrcs=%pcs_archive%%%~i



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 035 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 036

:: Copying book1, book2, and key metrics to current directory

for %%i in ("%book1%", "%book2%", "%keymtrcs%") do xcopy /y %%i .



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 036 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 037

:: Deleting older files so that only the latest files are kept

for /f "skip=1 eol=: delims=" %%i in ('dir "*book1*.pdf" /b /o-d') do @del "%%i"
for /f "skip=1 eol=: delims=" %%i in ('dir "*book2*.pdf" /b /o-d') do @del "%%i"
for /f "skip=1 eol=: delims=" %%i in ('dir "*keymetrics*.pdf" /b /o-d') do @del "%%i"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 037 generated an error >> ../vp02_log.txt
	echo: >> ../vp02_log.txt
)



:: Leaving directory vp02

popd
