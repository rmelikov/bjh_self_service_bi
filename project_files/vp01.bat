:: Define VP directory

set vp01=S:\PCS\Box Drive\Box Sync\Mark Krieger\



:: Defining VP user ID

set vp01_nt_id=mhk9413



:: Defining VP employee ID

set vp01_emp_id=0095294132



:: Changing directory to vp01

pushd %vp01%



::Creating a log file

echo %date% > ../vp01_log.txt
echo: >> ../vp01_log.txt



:: Setting ErrorLevel to 0

(call )



:: 001

:: Getting the view for BJH Pay-1 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-BJH/PAYPage1?StartDate=%start_date%" --pdf -f "01_HC_P1_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 001 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 002

:: Getting the view for BJH Pay-2 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-BJH/PAYPage2?StartDate=%start_date%" --pdf -f "02_HC_P2_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 002 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 003

:: Getting the view for BJH Pay-3 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-BJH/PAYPage3?StartDate=%start_date%" --pdf -f "03_HC_P3_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 003 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 004

:: Getting the view for BJH Emp-Movement and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EMP-MOVEMENT-BJH/EMP-MOVEMENT" --pdf -f "04_HC_EM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 004 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 005

:: Getting the view for BJH Sign-Off and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/SIGN-OFF-BJH/SIGN-OFF?StartDate=%sign-off_start_date%" --pdf -f "05_HC_SO_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 005 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 006

:: Getting the view for BJH Cancel-Meal and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/CANCEL-MEAL-BJH/CANCEL-MEAL?StartDate=%start_date%" --pdf -f "06_HC_CM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 006 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 007

::Getting the view for BJH Early-In and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EARLY-IN-BJH/EARLY-IN?StartDate=%start_date%" --pdf -f "07_HC_EI_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 007 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 008

:: Getting the view for BJH Late-Out and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/LATE-OUT-BJH/LATE-OUT?StartDate=%start_date%" --pdf -f "08_HC_LO_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 008 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 009

:: Combining all of the single views that were created into a single PDF

pdftk "*HC*%vp01_nt_id%.pdf" cat output "BJH_Human_Capital_Bi-Weekly.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 009 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 010

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*HC*%vp01_nt_id%*.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 010 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 011

:: Getting the view for BJH Premium Pay by BJH GDP Pay Category and PPE for Last 6 MOs and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-BJH/BJHPremiumPaybyBJHGDPPayCategoryandPPEforLast6MOsReport1?StartDate=%start_date%" --pdf -f "BJH_Premium_Pay_by_GDP_Pay_Category_and_PPE_for_Last_6_MOs.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 011 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 012

:: Getting the view for BJH Premium Pay YTD per Unit - Sort by Premium Pay Variance and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-BJH/BJHPremiumPayYTDforUnitwithVarianceSortOrderReport2?StartDate=%start_date%" --pdf -f "BJH_Premium_Pay_YTD_per_Unit_Sort_by_Premium_Pay_Variance.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 012 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 013

:: Getting the view for BJH Premium Pay YTD per Unit - Sort by Pay Amount and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-BJH/BJHPremiumPayYTDforUnitwithPayAmountSortOrderReport3?StartDate=%start_date%" --pdf -f "BJH_Premium_Pay_YTD_per_Unit_Sort_by_Pay_Amount.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 013 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 014

:: Getting the view for page 1 of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyExpenses-Page1?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "01_BJH_Supply_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 014 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 015

:: Getting the view for page 2 of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyExpenses-Page2?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "02_BJH_Supply_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 015 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 016

:: Getting the view for page 3 of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyExpenses-Page3?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "03_BJH_Supply_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 016 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 017

:: Getting the view for page 4 of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyExpenses-Page4?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "04_BJH_Supply_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 017 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 018

:: Getting the view for page 5 of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyExpenses-Page5?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "05_BJH_Supply_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 018 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 019

:: Combining all of the single views that were created into a single PDF

pdftk "*BJH_Supply_%vp01_nt_id%.pdf" cat output "BJH_Supply_Expenses.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 019 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 020

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*BJH_Supply*%vp01_nt_id%*.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 020 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 021

:: Getting the view for "BJH Supply Report 1 - Current Month" of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyReport1-CurrentMonthSupplyScorecard?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "BJH_Supply_Report_1_Current_Month.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 021 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 022

:: Getting the view for "BJH Supply Report 2 - YTD" of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyReport2-YTDSupplyScorecard?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "BJH_Supply_Report_2_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 022 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 023

:: Getting the view for "BJH Supply Report 3 - YTD Variance" of BJH level supply and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/BJHSupply/BJHSupplyReport3?CurrentMonth=%current_month%&CurrentYear=%current_year%" --pdf -f "BJH_Supply_Report_3_YTD_Variance.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 023 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 024

:: Getting the view for Dashboard1 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EmployeeMovementExecHR/Dashboard1?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "01_EM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 024 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 025

:: Getting the view for Dashboard2 and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EmployeeMovementExecHR/Dashboard2?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "02_EM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 025 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 026

:: Getting the view for Definitions and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EmployeeMovementExecHR/Definitions?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "03_EM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 026 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 027

:: Combining all of the single views that were created into a single PDF document

pdftk "*EM_%vp01_nt_id%.pdf" cat output "BJH_Employee_Movement.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 027 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 028

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*EM_%vp01_nt_id%*.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 028 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 029

:: Getting the view for Cancel-Meal and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/CANCEL-MEAL-VP/CANCEL-MEAL?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "04_HC_CM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 029 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 030

:: Getting the view for Early-In and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EARLY-IN-VP/EARLY-IN?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "05_HC_EI_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 030 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 031

:: Getting the view for Emp-Movement and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/EMP-MOVEMENT-VP/EMP-MOVEMENT?emp=%vp01_emp_id%" --pdf -f "02_HC_EM_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 031 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 032

:: Getting the view for Late-Out and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/LATE-OUT-VP/LATE-OUT?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "06_HC_LO_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 032 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 033

:: Getting the view for Pay-VP and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PAY?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "01_HC_P_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 033 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 034

:: Getting the view for Sign-Off and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/SIGN-OFF-VP/SIGN-OFF?emp=%vp01_emp_id%&StartDate=%sign-off_start_date%" --pdf -f "03_HC_SO_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 034 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 035

:: Combining all of the single views that were created into a single PDF document

pdftk "*HC*%vp01_nt_id%.pdf" cat output "VP_Human_Capital_Bi-Weekly.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 035 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 036

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*HC*%vp01_nt_id%*.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 036 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 037

:: Getting the view for VP level "Premium Pay 1" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PremiumPayActualTargetandVarianceCurrentYearYTDReport1forVP?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "Premium_Pay_1_Actual_Target_Variance_Current_Year_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 037 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 038

:: Getting the view for VP level "Premium Pay 2" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PremiumPayActualTargetandVarianceCurrentYearYTDReport2forVP?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "Premium_Pay_2_Actual_Target_Variance_Current_Year_YTD.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 038 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 039

:: Getting the view for VP level "Premium Pay 3" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/PAY-VP/PremiumPayActualforBJHGDPCategorybyUnitsReport3forVP?emp=%vp01_emp_id%&StartDate=%start_date%" --pdf -f "Premium_Pay_3_Actual_for_BJH_GDP_Category_by_Units.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 039 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 040

:: Getting the view for "BJH Human Capital Summary" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Summary/BJHHumanCapitalExecutiveSummary?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "01_BJH_HC_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 040 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 041

:: Getting the view for "BJH Human Capital Summary Definitions" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Summary/BJHHumanCapitalSummaryDefinitions" --pdf -f "02_BJH_HC_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 041 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 042

:: Combining all of the single views that were created into a single PDF document

pdftk "*BJH_HC_%vp01_nt_id%.pdf" cat output "BJH_Human_Capital_Summary.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 042 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 043

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*BJH_HC*%vp01_nt_id%*.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 043 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 044

:: Getting the view for "BJH Human Capital Executive Summary" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Executive/BJHHumanCapitalExecutiveSummary?ReportMonth=%report_month%&ReportYear=%report_year%" --pdf -f "01_BJH_HC_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 044 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 045

:: Getting the view for "BJH Human Capital Executive Summary Definitions" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/Human_Capital_Executive/BJHHumanCapitalExecutiveSummaryDefinitions" --pdf -f "02_BJH_HC_%vp01_nt_id%.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 045 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 046

:: Combining all of the single views that were created into a single PDF document

pdftk "*BJH_HC_%vp01_nt_id%.pdf" cat output "BJH_Human_Capital_Executive_Scorecard.pdf"



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 046 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 047

:: Deleting all of the single views that were created and combined into a single PDF above

for /f "delims=" %%i in ("*BJH_HC*%vp01_nt_id%*.pdf") do del "%%i" /s/q



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 047 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 048

:: Getting the view for "VP Supply Expenses" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyExpenses-Page1a?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp01_emp_id%" --pdf -f "VP_Supply_Expenses.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 048 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Setting ErrorLevel to 0

(call )



:: 049

:: Getting the view for "VP Supply Report" and storing it in PDF format into the corresponding Box folder

"%tabcmd%" export "/VPSupply/VPSupplyReport?CurrentMonth=%current_month%&CurrentYear=%current_year%&emp=%vp01_emp_id%" --pdf -f "VP_Supply_Report.pdf" --timeout 300



:: Checking for errors and generating a log for the above command and storing it to a new line in log.txt

if %errorlevel% neq 0 (
	echo 049 generated an error >> ../vp01_log.txt
	echo: >> ../vp01_log.txt
)



:: Leaving directory vp01

popd
