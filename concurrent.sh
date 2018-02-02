#!/bin/bash


output_dir="./output"
requests_dir="./requests"
testcases_dir="./testcases"

init(){

if [ "$1" == "--help" ]; then
	echo "Help : ./run.sh with optional option --refresh which will regenerate requests and run tests."
	echo "Example: ./run.sh"
	echo "Example: ./run.sh --refresh"
	exit 1;
fi

if [! -d ${output_dir}]; then
	mkdir ${output_dir};
fi

if [ "$1" == "--refresh" ]; then
	echo "cleaning up directories..."
	rm -rf ${requests_dir}/*;
	rm -rf ${output_dir}/*;
	generate_requests
fi

if [! -d ${requests_dir}]; then
	mkdir ${requests_dir};
	generate_requests
fi



}

init "$1"

generate_requests(){
	echo "generating requests..."
			
}


echo "running requests please wait...";
for (( i=1; i<2; i++)) ; do
 #curl -i --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:retrieveEnrichedDocument" --data @request.xml http://16.150.57.169/nexch/services/ZANTAZ_StoreAndRetrieveService 1> "${output_dir}/request${i}.txt" 2> "${output_dir}/request${i}.err" &
done
echo "done!"
