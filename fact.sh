#!/bin/bash
set +x
 file="$Home/var/lib/jenkins/workspace/XYZ.exe" 


				if[[ -f "$file" ]] && rm -f "$file"
					pwd; chmod 777 build; ./build 1> /dev/null
					
				echo -e "\n\n**************************** This is a Deploy JOB for $file**************************** "
				if [[ -f "$file" ]]; then 
				count=1
				
				for i in {1..5}
				do
					oe=$((1000 + RANDOM % 10000))
					fact=$((1 + RANDOM % 15))
					num1=$((1 + RANDOM % 100))
					num2=$((1 + RANDOM % 1000))
					
						echo -e "\n-------------------------- TEST_CASE ($count) --------------------------"
						$file -v -i <<<"$fact $oe $num1 $num2"
					
					if [ $? -eq 0 ]; then
						echo -e "\n      RESULT -> TEST_CASE (${count}): SUCCESS" 
					else  
						echo -e "\n      RESULT -> TEST_CASE (${count}): FAILED"
						exit 1
					fi

					echo "-------------------------------------------------------------------"
					((count++))
				done
				else 
					 echo -e "**************** ERROR *********************\n"
					  echo "Build - XYZ.exe notfound $file "
					  echo -e "********************************************\n"
					  exit 1
				fi
