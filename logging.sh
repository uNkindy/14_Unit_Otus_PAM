
#!/bin/bash

### Variable admin
admin="admin"

### Variable flag
flag=0

### Find group "admin" in all groups of PAM_USER.
for group in  $(id -Gn $PAM_USER)

do

        if [ $admin == $group ]; then

                flag=1

        fi

done

# If $flag=0, we check a day.If today not Sat or Sun, continue logging. If $flag=1, we continue logging
if [ $flag -eq 0 ]; then

        if [ $(date +%a) == "Sat" ] || [ $(date +%a) == "Sat" ]; then

                exit 1

        else

                exit 0

        fi


else

        exit 0

fi
