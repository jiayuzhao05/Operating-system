# 编辑器

vi,vm
Emacs
nano
gedit
kwrite


#!/bin/bash

$ chmod 755 hello_world
“755” 将授予我们读取、写入和执行权限。其他所有人将仅获得读取和执行权限。要将脚本设为私有（即只有我们可以读取和执行），请使用“700”。

echo $PATH

export PATH=$PATH:directory


mkdir ~/bin
如果我们将脚本移动或复制到新bin目录中，一切就都设置好了。

hello_world
大多数发行版都会~/bin 将目录添加到 PATH 中，但在某些发行版中，尤其是 Ubuntu（以及其他基于 Debian 的发行版），我们可能需要重新启动终端会话，才能将新创建的bin目录添加到 PATH 中。

# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH


if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PATH



alias name=value
alias l='ls -l'
alias today='date +"%A, %B %-d, %Y"'

today() {
    echo -n "Today's date is: "
    date +"%A, %B %-d, %Y"
}



<html>
<head>
    <title>
    The title of your page
    </title>
</head>

<body>
    Your page content goes here.
</body>
</html>



#!/bin/bash

# sysinfo_page - A script to produce an html file

echo "<html>"
echo "<head>"
echo "  <title>"
echo "  The title of your page"
echo "  </title>"
echo "</head>"
echo ""
echo "<body>"
echo "  Your page content goes here."
echo "</body>"
echo "</html>"


sysinfo_page > sysinfo_page.html

# Environment Variables
#!/bin/bash

# sysinfo_page - A script to produce an HTML file

##### Constants

title="My System Information"
right_now="$(date +"%x %r %Z")"
time_stamp="Updated on $right_now by $USER"

##### Functions

system_info()
{
    echo "<h2>System release info</h2>"
    echo "<p>Function not yet implemented</p>"
}


show_uptime()
{
    echo "<h2>System uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"
}


drive_space()
{
    echo "<h2>Filesystem space</h2>"
    echo "<pre>"
    df
    echo "</pre>"
}


home_space()
{
    echo "<h2>Home directory space by user</h2>"
    echo "<pre>"
    echo "Bytes Directory"
    du -s /home/* | sort -nr
    echo "</pre>"
}

##### Main

cat <<- _EOF_
    <html>
    <head>
        <title>
        $title $HOSTNAME $USER # if this is my system, it will just show $title.
        </title>
    </head>

    <body>
    <h1>$title $HOSTNAME</h1>
    <p>$TIME_STAMP</p>
        $(system_info)
        $(show_uptime)
        $(drive_space)
        $(home_space)
    </body>
    </html>
_EOF_


if commands; then
    commands
[elif commands; then
    commands...]
[else
    commands]
fi

# test 命令的工作原理很简单。如果给定的表达式为 true， 则 test 以 status 为零退出;否则，它将以 Status 1 退出。

if [ -f .bash_profile ]; then
    echo "You have a .bash_profile. Things are fine."
else
    echo "Yikes! You have no .bash_profile!"
fi


-e file
True if file exists.

-f file
True if file exists and is a regular file.

-d directory
True if file exists and is a directory.

-n string
True if string is not null.

-z string
True if string is null.

# Preferred form

if [ -f .bash_profile ]; then
    echo "You have a .bash_profile. Things are fine."
else
    echo "Yikes! You have no .bash_profile!"
fi

# Another alternate form

if [ -f .bash_profile ]
then echo "You have a .bash_profile. Things are fine."
else echo "Yikes! You have no .bash_profile!"
fi

# stop the script if the user is not the superuser
if [ "$(id -u)" != "0" ]; then
    echo "You must be the superuser to run this script" >&2
    exit 1
fi

function home_space {
    # Only the superuser can get this information

    if [ "$(id -u)" = "0" ]; then
        echo "<h2>Home directory space by user</h2>"
        echo "<pre>"
        echo "Bytes Directory"
            du -s /home/* | sort -nr
        echo "</pre>"
    fi

}   # end of home_space



#!/bin/bash

number=1

if [ $number = "1" ]; then
    echo "Number equals 1
#else
#   echo "Number does not equal 1"
fi
set +x  # Use set -x to turn tracing on and set +x to turn tracing off



echo -n "Enter some text > "
read text
echo "You entered: $text"


#!/bin/bash

echo -n "Hurry up and type something! > "
if read -t 3 response; then
    echo "Great, you made it in time!"
else
    echo "Sorry, you are too slow!"
fi



#!/bin/bash

echo -n "Enter some text > "
read text
echo "You entered: $text"
#!/bin/bash

read -p "Enter some text > " text
echo "You entered: $text"

#!/bin/bash

echo -n "Hurry up and type something! > "
if read -t 3 response; then
    echo "Great, you made it in time!"
else
    echo "Sorry, you are too slow!"
fi


#!/bin/bash

first_num=0
second_num=0

read -p "Enter the first number --> " first_num
read -p "Enter the second number -> " second_num

echo "first number + second number = $((first_num + second_num))"
echo "first number - second number = $((first_num - second_num))"
echo "first number * second number = $((first_num * second_num))"
echo "first number / second number = $((first_num / second_num))"
echo "first number % second number = $((first_num % second_num))"
echo "first number raised to the"
echo "power of the second number   = $((first_num ** second_num))"



#!/bin/bash

number=0

read -p "Enter a number > " number

echo "Number is $number"
if [ $((number % 2)) -eq 0 ]; then
    echo "Number is even"
else
    echo "Number is odd"
fi 

seconds=0

read -p "Enter number of seconds > " seconds

hours=$((seconds / 3600))
seconds=$((seconds % 3600))
minutes=$((seconds / 60))
seconds=$((seconds % 60))

echo "$hours hour(s) $minutes minute(s) $seconds second(s)"



#!/bin/bash

read -p "Enter a number between 1 and 3 inclusive > " character
if [ "$character" = "1" ]; then
    echo "You entered one."
elif [ "$character" = "2" ]; then
    echo "You entered two."
elif [ "$character" = "3" ]; then
    echo "You entered three."
else
    echo "You did not enter a number between 1 and 3."
fi



#!/bin/bash

read -p "Enter a number between 1 and 3 inclusive > " character
case $character in
    1 ) echo "You entered one."
        ;;
    2 ) echo "You entered two."
        ;;
    3 ) echo "You entered three."
        ;;
    * ) echo "You did not enter a number between 1 and 3."
esac
#!/bin/bash


#!/bin/bash

read -p "Type a digit or a letter > " character
case $character in
                                # Check for letters
    [[:lower:]] | [[:upper:]] ) echo "You typed the letter $character"
                                ;;

                                # Check for digits
    [0-9] )                     echo "You typed the digit $character"
                                ;;

                                # Check for anything else
    * )                         echo "You did not type a letter or a digit"
esac


#!/bin/bash

number=0
while [ "$number" -lt 10 ]; do
    echo "Number = $number"
    number=$((number + 1))
done


#!/bin/bash

number=0
until [ "$number" -ge 10 ]; do
    echo "Number = $number"
    number=$((number + 1))
done



#!/bin/bash

selection=
until [ "$selection" = "0" ]; do
    echo "
    PROGRAM MENU
    1 - Display free disk space
    2 - Display free memory

    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) df ;;
        2 ) free ;;
        0 ) exit ;;
        * ) echo "Please enter 1, 2, or 0"
    esac
done



#!/bin/bash

press_enter()
{
    echo -en "\nPress Enter to continue"
    read
    clear
}

selection=
until [ "$selection" = "0" ]; do
    echo "
    PROGRAM MENU
    1 - display free disk space
    2 - display free memory

    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) df ; press_enter ;;
        2 ) free ; press_enter ;;
        0 ) exit ;;
        * ) echo "Please enter 1, 2, or 0"; press_enter
    esac
done



#!/bin/bash

# sysinfo_page - A script to produce a system information HTML file

##### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW="$(date +"%x %r %Z")"
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

##### Functions

system_info()
{
    echo "<h2>System release info</h2>"
    echo "<p>Function not yet implemented</p>"

}   # end of system_info


show_uptime()
{
    echo "<h2>System uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"

}   # end of show_uptime


drive_space()
{
    echo "<h2>Filesystem space</h2>"
    echo "<pre>"
    df
    echo "</pre>"

}   # end of drive_space


home_space()
{
    # Only the superuser can get this information

    if [ "$(id -u)" = "0" ]; then
        echo "<h2>Home directory space by user</h2>"
        echo "<pre>"
        echo "Bytes Directory"
        du -s /home/* | sort -nr
        echo "</pre>"
    fi

}   # end of home_space



##### Main

cat <<- _EOF_
  <html>
  <head>
      <title>$TITLE</title>
  </head>
  <body>
      <h1>$TITLE</h1>
      <p>$TIME_STAMP</p>
      $(system_info)
      $(show_uptime)
      $(drive_space)
      $(home_space)
  </body>
  </html>
_EOF_


#!/bin/bash

echo "Positional Parameters"
echo '$0 = ' $0
echo '$1 = ' $1
echo '$2 = ' $2
echo '$3 = ' $3



#!/bin/bash

if [ "$1" != "" ]; then
    echo "Positional parameter 1 contains something"
else
    echo "Positional parameter 1 is empty"
fi



#!/bin/bash

if [ $# -gt 0 ]; then
    echo "Your command line contains $# arguments"
else
    echo "Your command line contains no arguments"
fi


#!/bin/bash

echo "You start with $# positional parameters"

# Loop until all parameters are used up
while [ "$1" != "" ]; do
    echo "Parameter 1 equals $1"
    echo "You now have $# positional parameters"

    # Shift all the parameters down by one
    shift

done



#!/bin/bash

# sysinfo_page - A script to produce a system information HTML file

##### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW="$(date +"%x %r %Z")"
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

##### Functions

system_info()
{
    echo "<h2>System release info</h2>"
    echo "<p>Function not yet implemented</p>"

}   # end of system_info


show_uptime()
{
    echo "<h2>System uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"

}   # end of show_uptime


drive_space()
{
    echo "<h2>Filesystem space</h2>"
    echo "<pre>"
    df
    echo "</pre>"

}   # end of drive_space


home_space()
{
    # Only the superuser can get this information

    if [ "$(id -u)" = "0" ]; then
        echo "<h2>Home directory space by user</h2>"
        echo "<pre>"
        echo "Bytes Directory"
        du -s /home/* | sort -nr
        echo "</pre>"
    fi

}   # end of home_space


write_page()
{
    cat <<- _EOF_
    <html>
        <head>
        <title>$TITLE</title>
        </head>
        <body>
        <h1>$TITLE</h1>
        <p>$TIME_STAMP</p>
        $(system_info)
        $(show_uptime)
        $(drive_space)
        $(home_space)
        </body>
    </html>
_EOF_

}

usage()
{
    echo "usage: sysinfo_page [[[-f file ] [-i]] | [-h]]"
}


##### Main

interactive=
filename=~/sysinfo_page.html

while [ "$1" != "" ]; do
    case $1 in
        -f | --file )           shift
                                filename=$1
                                ;;
        -i | --interactive )    interactive=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done


# Test code to verify command line processing

if [ "$interactive" = "1" ]; then
  echo "interactive is on"
else
  echo "interactive is off"
fi
echo "output file = $filename"


# Write page (comment out until testing is complete)

# write_page > $filename



if [ "$interactive" = "1" ]; then

    response=

    read -p "Enter name of output file [$filename] > " response
    if [ -n "$response" ]; then
        filename="$response"
    fi

    if [ -f $filename ]; then
        echo -n "Output file exists. Overwrite? (y/n) > "
        read response
        if [ "$response" != "y" ]; then
            echo "Exiting program."
            exit 1
        fi
    fi
fi




#!/bin/bash

count=0
for i in $(cat ~/.bash_profile); do
    count=$((count + 1))
    echo "Word $count ($i) contains $(echo -n $i | wc -c) characters"
done



#!/bin/bash

for filename in "$@"; do
    result=
    if [ -f "$filename" ]; then
        result="$filename is a regular file"
    else
        if [ -d "$filename" ]; then
            result="$filename is a directory"
        fi
    fi
    if [ -w "$filename" ]; then
        result="$result and it is writable"
    else
        result="$result and it is not writable"
    fi
    echo "$result"
done


#!/bin/bash

# cmp_dir - program to compare two directories

# Check for required arguments
if [ $# -ne 2 ]; then
    echo "usage: $0 directory_1 directory_2" 1>&2
    exit 1
fi

# Make sure both arguments are directories
if [ ! -d "$1" ]; then
    echo "$1 is not a directory!" 1>&2
    exit 1
fi

if [ ! -d "$2" ]; then
    echo "$2 is not a directory!" 1>&2
    exit 1
fi

# Process each file in directory_1, comparing it to directory_2
missing=0
for filename in "$1"/*; do
    fn=$(basename "$filename")
    if [ -f "$filename" ]; then
        if [ ! -f "$2/$fn" ]; then
            echo "$fn is missing from $2"
            missing=$((missing + 1))
        fi
    fi
done
echo "$missing files missing"




home_space()
{
    # Only the superuser can get this information

    if [ "$(id -u)" = "0" ]; then
        echo "<h2>Home directory space by user</h2>"
        echo "<pre>"
        echo "Bytes Directory"
        du -s /home/* | sort -nr
        echo "</pre>"
    fi

}   # end of home_space



home_space() {
    echo "<h2>Home directory space by user</h2>"
    echo "<pre>"
    format="%8s%10s%10s   %-s\n"
    printf "$format" "Dirs" "Files" "Blocks" "Directory"
    printf "$format" "----" "-----" "------" "---------"
    if [ $(id -u) = "0" ]; then
        dir_list="/home/*"
    else
        dir_list=$HOME
    fi
    for home_dir in $dir_list; do
        total_dirs=$(find $home_dir -type d | wc -l)
        total_files=$(find $home_dir -type f | wc -l)
        total_blocks=$(du -s $home_dir)
        printf "$format" "$total_dirs" "$total_files" "$total_blocks"
    done
    echo "</pre>"

}   # end of home_space
home_space（） {



system_info() {
    # Find any release files in /etc

    if ls /etc/*release 1>/dev/null 2>&1; then
        echo "<h2>System release info</h2>"
        echo "<pre>"
        for i in /etc/*release; do

            # Since we can't be sure of the
            # length of the file, only
            # display the first line.

            head -n 1 "$i"
        done
        uname -orp
        echo "</pre>"
    fi

}   # end of system_info



# A better way

if cd "$some_directory"; then
  rm ./*
else
  echo "Could not change directory! Aborting." 1>&2
  exit 1
fi



#!/bin/bash

# A slicker error handling routine

# I put a variable in my scripts named PROGNAME which
# holds the name of the program being run.  You can get this
# value from the first item on the command line ($0).

PROGNAME="$(basename $0)"

error_exit()
{

# ----------------------------------------------------------------
# Function for exit due to fatal program error
#   Accepts 1 argument:
#     string containing descriptive error message
# ----------------------------------------------------------------


  echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  exit 1
}

# Example call of the error_exit function.  Note the inclusion
# of the LINENO environment variable.  It contains the current
# line number.

echo "Example of error with line number and message"
error_exit "$LINENO: An error has occurred."



#!/bin/bash

# Program to print a text file with headers and footers

TEMP_FILE=/tmp/printfile.txt

pr $1 > "$TEMP_FILE"

read -p "Print file? [y/n]: "
if [ "$REPLY" = "y" ]; then
  lpr "$TEMP_FILE"
fi



#!/bin/bash

# Program to print a text file with headers and footers

TEMP_FILE=/tmp/printfile.txt

trap "rm $TEMP_FILE; exit" SIGHUP SIGINT SIGTERM

pr $1 > "$TEMP_FILE"

read -p "Print file? [y/n]: "
if [ "$REPLY" = "y" ]; then
  lpr "$TEMP_FILE"
fi
rm "$TEMP_FILE"


#!/bin/bash

# Program to print a text file with headers and footers

TEMP_FILE=/tmp/printfile.txt

clean_up() {

  # Perform program exit housekeeping
  rm "$TEMP_FILE"
  exit
}

trap clean_up SIGHUP SIGINT SIGTERM

pr $1 > "$TEMP_FILE"

read -p "Print file? [y/n]: "
if [ "$REPLY" = "y" ]; then
  lpr "$TEMP_FILE"
fi
clean_up




#!/bin/bash

# Program to print a text file with headers and footers

# Usage: printfile file

PROGNAME="$(basename $0)"

# Create a temporary file name that gives preference
# to the user's local tmp directory and has a name
# that is resistant to tmp race attacks

if [ -d "~/tmp" ]; then
  TEMP_DIR=~/tmp
else
  TEMP_DIR=/tmp
fi
TEMP_FILE="$TEMP_DIR/$PROGNAME.$$.$RANDOM"

usage() {

  # Display usage message on standard error
  echo "Usage: $PROGNAME file" 1>&2
}

clean_up() {

  # Perform program exit housekeeping
  # Optionally accepts an exit status
  rm -f "$TEMP_FILE"
  exit $1
}

error_exit() {

  # Display error message and exit
  echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  clean_up 1
}

trap clean_up SIGHUP SIGINT SIGTERM

if [ $# != "1" ]; then
  usage
  error_exit "one file to print must be specified"
fi
if [ ! -f "$1" ]; then
  error_exit "file $1 cannot be read"
fi

pr $1 > "$TEMP_FILE" || error_exit "cannot format file"

read -p "Print file? [y/n]: "
if [ "$REPLY" = "y" ]; then
  lpr "$TEMP_FILE" || error_exit "cannot print file"
fi
clean_up

# 仅凭进程 ID 并不足以使文件安全，因此我们添加了 $RANDOM shell 变量将随机数附加到文件名。 有了这个 技术，我们创建一个既易于识别又 不可预知的。