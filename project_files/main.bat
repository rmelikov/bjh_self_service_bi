@echo off

pushd "S:\PCS\Ramin\Scripts\Box"

set /p start_date="Enter Start Date (YYYY-MM-DD): "

set /p sign-off_start_date="Enter Sign-Off Start Date (YYYY-MM-DD): "

set /p month="Enter Current Month (M): "

set /p year="Enter Current Year (YYYY): "

call settings %start_date% %sign-off_start_date% %month% %year%

call vp01

call vp02
