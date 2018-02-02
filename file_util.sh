

# checks if two files same contentwise
# cmp stops at first difference of content so should be faster than diff.

function are_same_contents {
	echo "comparing $1 and $2"
	cmp -s $1 $2
	if [[ $? == 0 ]]; then
		echo "true";
	else
		echo "false";
	fi
}

# compares md5sum for two files and cehcks if they are same

function are_same_binaries {
	echo "comparing $1 and $2"
	local md51=$(md5sum $1 | awk '{print $1}');
	local md52=$(md5sum $2 | awk '{print $1}');
	if [[ "${md51}" == "${md52}" ]]; then
		echo "true";
	else
		echo "false"
	fi
}

# couunt number of files in a dir
# $1 = directory
# $2 = optional file pattern like .txt

function count_files_in_dir {
	local pattern="*";
	if [[ ! -z $2 ]]; then
		pattern="*$2";
	fi
	# -l switch for wc is for number of new lines
	# wc can be used to count words in a file and many other things. @see --help
	echo $(ls $1/$pattern | wc -l);
}

# finds size of file or dir. For human readble format we should use -sh switch
# $1 = dir/file , $2 pattern to exclude eg *.err

function size_of {
	du --exclude=$2 $1 | awk '{print $1}'
}


# monitor a dirctory for number of files and size

function monitor {
	local dir_size=$( du $1 | awk '{print $1}' );
	local file_count=$(ls $1 | wc -l);
	echo "Initial state: size = $dir_size, count = $file_count";
	local counter=1;
	while [ true ]; do
		let increase_dir_size=$(( $(du $1 | awk '{print $1}') - $dir_size ));
		let increase_file_count=$(( $(ls $1 | wc -l) - $file_count ));
		echo "$counter: size: $increase_dir_size, count: $increase_file_count";
		sleep 1;
	done
}





######################### TEST ################################

monitor ./output
