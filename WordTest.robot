| *** Settings *** |

| Library	   | RPA.Desktop
| Library    | Process
| Library    | OperatingSystem
| Library	   | String
| Suite Teardown | Terminate All Processes | kill=True
| *** Variables *** |
| ${Writerexe}      | C:/\Program Files (x86)/\OpenOffice 4/\program/\swriter.exe

| *** Tasks *** |
| WordTest	|
|			| ${pid} =   | Open Writer
|			| Log | PID is ${pid} | console=yes
|			| Sleep	   | 5s
|			| ${result}= | Generate Random String | 5-10
|			| Log	       | ${result}		 	  | console=yes
|			| Switch Window | locator = NEW
	
|			| Run keyword | Close Writer		  |${pid}

| *** Keywords *** |
| Open Writer	|
|				| ${process} = | Start Process | ${Writerexe} | alias=word_process
|				| RETURN |	${process.pid}

| Close Writer	|
|				| [Arguments] |	${pid}
# This is needed since Writer swapn openoffice instance, and the spawned instance has to be closed to have the writer closed.
|				| Run | taskkill /F /T /PID ${pid}


