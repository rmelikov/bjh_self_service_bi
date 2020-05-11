# BI Self-Service Solution for BJH

Here is how it works:

**main.bat**

It starts off with the `main.bat` file which makes calls to the rest of the files, `settings.bat`, `vp01.bat`, and `vp02.bat`. It asks for some parameters, like `month`, `year`, etc, then sets the settings for the project using the `settings.bat` file, and then completes jobs for each VP in their respective files. Additional VPs could be added later.

**settings.bat**

In the `settings.bat` file, the main thing is that it sets the location of the `tabcmd.exe` file into a `tabcmd` variable to make it so that you don't have to type out the path to `tabcmd.exe` each time.

Another main thing for this file is that it contains the username, password, and the server name to the Tableau server. This, of course, could be parametrized as well for security reasons.

And finally, the parameters from the `main.bat` file are passed into the `settings.bat`.

**vp01.bat and vp02.bat**

The main ideas here is that inside of this file we are making calls to the Tableau server one at a time to retrieve certain views as `PDF` documents. Some dashboards have many views but not all of them are needed by the VPs. So, we have to specify which views are needed to be extracted from Tableau server. These views are then put into new groupped `PDFs`, using a utility called `pdftk`. After the groups of `PDFs` are created, the single `PDFs` are deleted. Also, each call is numbered so that in case of an error during the call, an error message is logged into an error log. After each call there is an error check by looking at a Windows environment variable `errorlevel`. It it is not `0`, then there is an error and the script logs a message into a log, identifying which call had a problem. After that, it resets the `errorlevel` variable. There is also some file organization happening in there.
