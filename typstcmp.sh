if [ -z "$1" ]; then
	echo "Usage: $0 <path_to_file.typ>"
	exit 1
fi

if ! [ -e ~/.config/typstcmp/config ]; then
	echo "Config file not exists. Using default. Path: ~/.config/typstcmp/config"
	echo "COMMAND="evince"
LOG_FILE_PATH="/tmp/typstcmplog.log"" > ~/.config/typstcmp/config
fi
source ~/.config/typstcmp/config
path_to_typ_file="$1"
path_to_pdf_file="${path_to_typ_file%.*}.pdf"

nohup typst w $1 > $LOG_FILE_PATH 2>&1 > /dev/null &
nohup $COMMAND $path_to_pdf_file > /dev/null &

tail -f $LOG_FILE_PATH
