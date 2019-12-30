#!/bin/ksh
pathToFile="$(pwd)/users.txt"
decodeBase64(){
    cmd=$(echo "$1" | openssl enc -base64 -d)
}

isInUsers(){
    decodeBase64 $1
    decodedData=$cmd
    user="$(echo $decodedData | cut -f1 -d:)"
    password="$(echo $decodedData | cut -f2 -d:)"
    isInFile=false

    while read -r v1 v2
    do
        if [[ $user == $v1 && $password == $v2 ]]; then
            isInFile=true
            break
        fi
    done < "$pathToFile"
}
asd="QXNkOmFhZHdhZAo="
isInUsers "$asd"
echo "$isInFile"
