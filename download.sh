#!/bin/sh
# This script will do following:

# 1. Download the BEIS.zip file
# 2. Check the download file is not corrupt.

#Author: Vivek Thakur

#echo  "########################################################"
#echo  "#       Welcome to Harman Connected Services           #"
#echo  "########################################################"

download_BEIS()
{

	if [ ! -f BEIS_8.4.zip ]
	then
		i=937214104
		wget -O BEIS_8.4.zip "https://download.flexnetoperations.com/439214/1194/27/11146027/BEIS_8.4.zip?ftpRequestID=1884591293&server=download.flexnetoperations.com&dtm=DTM20171107062158OTk4NzUyNjEw&authparam=1510064518_2ccca473e4ca9de11bab7a8e2d8024a2&ext=.zip"
		cksum BEIS_8.4.zip>temp.txt
		j=`cat temp.txt|awk -F" " '{print $1}'`
		if [ $i -eq $j ]
		then
			sleep 3
			echo "Downloaded file is correct"
			echo "### Will continue the process ###"
		else
			echo "Downloaded file is corrupt"
		fi
	else
		echo "### BEIS_8.4.zip file already exist .... Skipping this step ###"
	fi
	
	rm -f tmp.txt

	echo " Starting to transfer the required script on job sub server  "
        sleep 3
        ./transfer_scripts_job.sh
	sleep 3
		
}
download_BEIS
echo "END of Script......"
rm -f temp.txt
