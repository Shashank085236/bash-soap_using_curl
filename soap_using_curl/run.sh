echo "running requests please wait...";
n=2000
for (( i=1; i<$n; i++)) ; do
 curl -i --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:submitQuery" --data @request.xml http://16.150.57.169/nexch/services/SOAPQueryServer 1> "./output/output${i}.txt" 2> "./output/output${i}.err" &
done
echo "done!"

wc=$(ls ./output/*.txt | wc -l)
echo "Number of success: " +$wc