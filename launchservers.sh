# Launch command example (cappingsettings with port offset 6 on the PUG Login Server): 
# ./taserver.sh -d cappingsettings -c CookedPC -p 6 -q "ta.dodgesdomain.com"

PS3='Which server would you like to start: '
options=("PUG Server" "Mixer Server" "2v2 Server" "PUB Server" "Com PUB Server" "Com 2v2 Server" "Exit Script")
select opt in "${options[@]}"
do
    case $opt in
        "PUG Server")
            echo "Starting PUG Server!"
            ./taserver.sh -d PUG_PUG -q
            break
            ;;
        "Com PUB Server")
            echo "Starting PUB Server!"
            ./taservercom.sh -d COMpubsettings -p 2
            break
            ;;
        "PUB Server")
            echo "Starting PUB Server!"
            ./taserver.sh -d pubsettings -p 4
            break
            ;;
        "2v2 Server")
            echo "Starting 2v2 Server!"
            ./taserver.sh -d 2v2settings -p 8
            break
            ;;
        "Com 2v2 Server")
            echo "Starting 2v2 Server!"
            ./taservercom.sh -d COM2v2settings -p 10
            break
            ;;                    
        "Mixer Server")
            echo "Starting Mixer Server!"
            ./taserver.sh -d mixersettings -p 12
            break
            ;;
        "Exit Script")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
echo "Running Tribes Servers:"
docker ps --format "{{.Names}}" --filter "name=taserver_"