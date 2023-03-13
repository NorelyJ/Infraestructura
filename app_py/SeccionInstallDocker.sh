1) 
           # Ejecucion
            echo "-----------------------------------------------------------------------------"
            echo "Inicia instalacion docker CE                                                 "
            echo "-----------------------------------------------------------------------------"
            read -p ">> Paso 1: Desea Instalar Docker (y/n)? " answer

            if [[ $answer =~ ^[Yy]$ ]]
                then
                    cd ~/

                    echo "-----------------------------------------------------------------------------"
                    echo "Instalación Prerequisitios"
                    echo "-----------------------------------------------------------------------------"
                    sudo apt-get update -y
                    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - -y
                    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
                    sudo apt update -y
                    apt-cache policy docker-ce -y
                    sudo apt install docker-ce -y

                    echo "-----------------------------------------------------------------------------"
                    echo "Verificar Version"
                    echo "-----------------------------------------------------------------------------"
                    docker --version

                    echo "-----------------------------------------------------------------------------"
                    echo "Iniciar docker con el sistema"
                    echo "-----------------------------------------------------------------------------"
                    sudo systemctl enable docker
                    sudo systemctl start docker
                    
                    echo "-----------------------------------------------------------------------------"
                    echo "Crear usuario de Docker"
                    echo "-----------------------------------------------------------------------------"
                    sudo adduser docker

                    
                    echo "-----------------------------------------------------------------------------"
                    echo "Agregar permisos usuario ubunutu al grupo Docker"
                    echo "-----------------------------------------------------------------------------"
                    user=$(whoami)
                    sudo usermod -G docker $user
                    grep $user /etc/group

                    echo "-----------------------------------------------------------------------------"
                    echo "folder docker"
                    echo "-----------------------------------------------------------------------------"
                    folder=/Images
                    sudo mkdir -p $folder/$user
                    sudo mkdir -p $folder/$user/Data
                    sudo chown -R $user:$user $folder/$user
                    sudo chown -R $user:$user $folder/$user/Data
                    ls -ltr $folder/

                    read -p "Press [Enter] key to continue..." readEnterKey

                    echo "-----------------------------------------------------------------------------"
                    echo "Inicia instalacion Docker Compose                                            "
                    echo "-----------------------------------------------------------------------------"

                    sudo mkdir -p /usr/local/bin
                    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

                    sudo chmod +x /usr/local/bin/docker-compose

                    echo "-----------------------------------------------------------------------------"
                    echo "Verificar docker-compose"
                    echo "-----------------------------------------------------------------------------"
                    sudo docker-compose --version

                    read -p "Press [Enter] key to continue..." readEnterKey


                    echo "-----------------------------------------------------------------------------"
                    echo "Fin instalacion Docker                                                       "
                    echo "-----------------------------------------------------------------------------"

                    read -p "Press [Enter] key to continue..." readEnterKey
            fi
            echo "-----------------------------------------------------------------------------"
            echo "Sin Ajustes!!"
            echo "-----------------------------------------------------------------------------"
                
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;