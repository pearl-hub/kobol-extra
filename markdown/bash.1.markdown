
# Bash - Bourne shell


## history

Show the commands history.

To show the last *num* commands:

    history num

To remove all commands

    history -c

The file containing the command history is located in  ~/.bash\_history.


The most recent command containing the "string":

    !?string


Take the command that either is in the row "num" (it can be negative) or has "string" as prefix:

    !n
    !string

Substitute string1 with string2 in the previous command:

    ^string1^string2^

To execute the last command with sudo:

    sudo !!

To run command with the last argument of the most recent command:

    sudo vi !$


## multitasking ##

Stop the execution of the script until all the background jobs have finished or until
the specified job has finished:

    wait %job


Bring the process as foreground:

    fg %job


Execute directly a job in background:

    comando &


Execute a job in background:

    bg %job


Kill a background job:

    kill %job


List all the current jobs:

    jobs


ctrl+c kill the current job, ctrl+z suspend the current job:

    ctrl+c e ctrl+z



## redirection i/o and pipe ##

Il ; consente l'esecuzione sequenziale dei comandi:
`comand1 ; comand2`

Esegue comand2 solo se comand1 è stato eseguito con successo:
`comand1 &amp;&amp; comand2`

Esegue comand2 solo se comand1 ha generato un errore:
`comand1 || comand2`

Permette l'esecuzione simultanea:
`comand1 &amp; comand2 &amp; comand3`



`:> file opp >file`


Redirige e accoda lo stdOut nel file "file".
0=stdIn, 1=stdOut, 2=stdErr.
&amp;>"file" redirige stdErr e stdOut in "file":

`comando 1>>file`


Sopprime l'output:
`comando 1>/dev/null`

Legge le righe contenute nel file con descittore 3:

`while read riga <&amp;3 do {echo riga}`

To redirect both sdtout and stderr to file (The 2>&1 goes always at the end):
`command >file 2>&1`



## bash binding

To get the list of the current bindings:
`bind -p`

To bind an action with a key:
`bind '"\C-p": beginning-of-line'`

To unset a bind:
`bind '"\C-a": '`

To list all input sequences associated with the action:
`bind -p | grep beginning-of-line`



## bash shortcuts

Ctrl-a          Move to the start of the line.
Ctrl-e          Move to the end of the line.
Ctrl-b          Move back one character.
Alt-b           Move back one word.
Ctrl-f          Move forward one character.
Alt-f           Move forward one word.
Ctrl-] x        Where x is any character, moves the cursor forward to the next occurance of x.
Alt-Ctrl-] x    Where x is any character, moves the cursor backwards to the previous occurance of x.
Ctrl-u          Delete from the cursor to the beginning of the line.
Ctrl-k          Delete from the cursor to the end of the line.
Ctrl-w          Delete from the cursor to the start of the word.
Esc-Del         Delete previous word (may not work, instead try Esc followed by Backspace)
Ctrl-y          Pastes text from the clipboard.
Ctrl-l          Clear the screen leaving the current line at the top of the screen.
Ctrl-x Ctrl-u   Undo the last changes. Ctrl-\_ does the same
Alt-r           Undo all changes to the line.
Alt-Ctrl-e      Expand command line.
Ctrl-r          Incremental reverse search of history.
Alt-p           Non-incremental reverse search of history.
!!              Execute last command in history
!abc            Execute last command in history beginning with abc
!abc:p          Print last command in history beginning with abc
!n              Execute nth command in history
!$              Last argument of last command
!^              First argument of last command
^abc^xyz        Replace first occurance of abc with xyz in last command and execute it



## array

To define an array:



-  One value array
array[0]=value
-  Empty array
declare -a arrayB
-  Another declaration
declare -a array=('valore' 'valore' 'valore')
-  Again another declaration
array=('valore' 'valore' 'valore')



To assign a value to the array:



arrayB[$i]=10



To iterate among the elements:



for v in ${arrayA[@]};do
echo $v
done




To define an ASSOCIATIVE ARRAY:



declare -A userpass
userpass=( ["Ennio"]="123456" ["Pippo"]="1q2w3e4r" ["Luigi"]="B0sc0l4nd14" )




Other possible options of declare:
*  -i Declare an array with only integers.
*  -r Declare an array read-only.
*  -u Convert the values of the array in uppercase.
*  -l Convert the values of the array in lowercase.

To get the lenght of the array:

echo "${- array[@]}"



To extract the elements of an array:



echo ${array[@]:3} -  Extract the elements beginning to the third elements
echo ${array[@]:0:3} -  Extract the first three elements.
echo ${array[-1]} -  Extract the last element




To change elements inside an array:



echo ${array[@],} -  i primi caratteri di ogni parola si visualizzeranno in minuscolo
echo ${array[@],,} -  tutti i caratteri di ogni parola saranno in minuscolo
echo ${array[@]^} -  i primi caratteri di ogni parola si visualizzeranno in maiuscolo
echo ${array[@]^^} -  tutti i caratteri di ogni parola saranno in maiuscolo

echo ${array[@]/uno/} -  Delete the first occurrence on every element.
echo ${array[@]//uno/} -  Delete all the occurrences on every element.

echo ${array[@]/t/a} -  Substitute the first occurrence "t" with "a".
echo ${array[@]//t/a} -  Substitute all the occurrences "t" with "a".



## Variables

$@: Array variable of the parameters
$- : Number of parameters
${FUNCNAME}: Array variable containing the function in the execution call stack



## alias

Per abbreviare la digitazione di comandi con molte opzioni è possibile utilizzare gli alias

## export

assegna un valore ad una variabile name=value. Es. export PATH=$PATH:/usr/local/bin. Di solito si usa un delimitatore per valutare cio che e' variabile e cio che non lo e'. Es. PATH=${PATH}:.:${HOME}/myScripts. e' possibile all'interno di uno scripts dichiarare una variabile cosi CICCIO='ciao' opp MARIO='come va?' e successivamente esportarli in qst modo export CICCIO MARIO




## compgen

Provides completion generation.
To get the list of pearl function: 
`compgen -abck pearl_`


## trap ##

Consente di catturare segnali inviati tramite il comando kill da un altro processo. La sintassi e':
`trap arg sig`
 Dove arg rappresenta una funzione da eseguire una volta ricevuto il segnale specificato. Se arg è : vuol dire che quel segnale viene ignorato dal processo. Mentre se arg è - viene ripristinato al valore iniziale nullo.
Ad esempio:



sigquit()
{
echo "signal QUIT received"
}

sigint()
{
echo "signal INT received, script ending"
exit 0
}

trap 'sigquit' QUIT
trap 'sigint'  INT
trap ':'       HUP      -  ignore the specified signals
echo "test script started. My PID is $$"



Su un'altra shell possiamo eseguire i seguenti comandi:
`kill -HUP  25309`

`$ kill -QUIT 25309`

`kill -INT  25309`

che verranno opportunamente gestiti tramite trap.

Allo stesso modo puoi consentire comunicazioni tra i processi.



config="our.config.file"
sigusr1()
{
echo "(SIGUSR1: re-reading config file)"
. $config
}

trap sigusr1 USR1       -  catch -USR1 signal

echo "Daemon started. Assigned PID is $$"




Per far rileggere il file di configurazione basta fare:
`kill -USR1 25843`



#  colori



## echo -e \E[GRASSETTO;COLORE1;COLORE2mQui va inserito il testo.


GRASSETTO vale 1 (attivo) oppure 0 (nn attivo). \E[0m ripristina le impostazioni precedenti
Colore  Primo piano Sfondo
30          40
nero
31          41
rosso
32          42
verde
33          43
giallo
34          44
blu
35          45
magenta
36          46
cyan
37          47
bianco





