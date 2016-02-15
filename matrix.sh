#!/bin/bash
##################################
## Matrix 0.1                   ##
## Author: Shatrix              ##
##   sherif.e.mousa@gmail.com   ##
######################################################################
## the matrix-ish display at the end                                ##
## Author: Brett Terpstra 2012 <http://brettterpstra.com>           ##
## Contributors: Lauri Ranta and Carl <http://blog.carlsensei.com/> ##
######################################################################

if [ $# -eq 0 ]
then
	echo "Error: no arguments"
	echo "Usage:"
	echo "./matrix.sh YOUR_NAME"
else
  print_to_screen () {
	clear
	_length=$(echo $1 | wc -c)
	_loop=$(echo $(($_length -1)))
	for i in $(seq $_loop)
	do
	        sleep 0.2
	        tput cup 0 $i
	        echo $1 | cut -c $i
	done
  }

  print_to_screen "Wake up, $1"
  sleep 2
  print_to_screen "The Matrix has you..."
  sleep 2
  print_to_screen "Follow the white rabbit."
  sleep 4
  clear
  echo "Knock. Knock. $1"
  sleep 3

	### Customization:
	blue="\033[0;34m"
	brightblue="\033[1;34m"
	cyan="\033[0;36m"
	brightcyan="\033[1;36m"
	green="\033[0;32m"
	brightgreen="\033[1;32m"
	red="\033[0;31m"
	brightred="\033[1;31m"
	white="\033[1;37m"
	black="\033[0;30m"
	grey="\033[0;37m"
	darkgrey="\033[1;30m"
	# Choose the colors that will be used from the above list
	# space-separated list
	# e.g. `colors=($green $brightgreen $darkgrey $white)`
	colors=($green $brightgreen)
	### End customization

	### Do not edit below this line
	spacing=${1:-100} # the likelihood of a character being left in place
	scroll=${2:-0} # 0 for static, positive integer determines scroll speed
	spacing=10
	scroll=1
	screenlines=$(expr `tput lines` - 1 + $scroll)
	screencols=$(expr `tput cols` / 2 - 1)

	# chars=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 ^)
	# charset via Carl:
	chars=(ｱ ｲ ｳ ｴ ｵ ｶ ｷ ｸ ｹ ｺ ｻ ｼ ｽ ｾ ｿ ﾀ ﾁ ﾂ ﾃ ﾄ ﾅ ﾆ ﾇ ﾈ ﾉ ﾊ ﾋ ﾌ ﾍ ﾎ ﾏ ﾐ ﾑ ﾒ ﾓ ﾔ ﾕ ﾖ ﾗ ﾘ ﾙ ﾚ ﾛ ﾜ ﾝ)

	count=${#chars[@]}
	colorcount=${#colors[@]}

	trap "tput sgr0; clear; exit" SIGTERM SIGINT


	clear
	tput cup 0 0
	while :
		do for i in $(eval echo {1..$screenlines})
			do for i in $(eval echo {1..$screencols})
				do rand=$(($RANDOM%$spacing))
					case $rand in
						0)
							printf "${colors[$RANDOM%$colorcount]}${chars[$RANDOM%$count]} "
							;;
						1)
							printf "  "
							;;
						*)
							printf "\033[2C"
							;;
					esac
				done
				printf "\n"

				# sleep .005
			done
			tput cup 0 0
		done

fi
