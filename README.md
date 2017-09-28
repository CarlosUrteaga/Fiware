# Fiware

## Prerequisitos

###Equipo

* Memoria 8 GB o 12 GB si es Windows (para la virtualización)
* Espacio en disco duro  16 GB (para las máquinas virtuales)

###Software

Para ejecutar el ambiente de prueba se requiere de instalar los siguientes programas. 
* Vagrant <https://www.vagrantup.com>
* Virtual Box <https://www.virtualbox.org>
* Insomnia client <https://insomnia.rest>
* git <https://git-scm.com/downloads>


### Configuración
Para iniciar la instalación  se requiere abrir la consola, en el caso de Linux o Mac se utiliza la terminal pero para windows se debe de utilizar el git bash.

#### Set up
# crear carpeta
	mkdir curso
	# cambiar de directorio
	cd curso
	# bajar estructura de las máquinas virtuales
	git clone https://github.com/CarlosUrteaga/Fiware.git
	# Cambiar a directorio Fiware
	cd Fiware

### Servidor
	#Dentro de la carpeta de Fiware que anteriormente se descargo
	# cambiar de directorio a  la máquina virtual orion
	cd vm-fiware-orion
	# iniciar máquina virtual de Orion
	vagrant up
	# conectar a máquina virutal por medio de SSH
	vagrant ssh
	#iniciar docker de OCB
	docker-compose up
	##Esto empezará a descargar paquetes y 
	##cuando aparesca el siguiente mensaje 
	*mongo_1  | 2017-09 ... *
	##Oprimir las teclas ctr  y C (esto detendrá el servicio)
	#salir de la máquina virtual
	exit
	#detener la máquina virtual
	vagrant halt
	cd ..

### Cliente
	#Dentro de la carpeta de Fiware que anteriormente se descargo
	cd vm-fiware-consumer
	# iniciar máquina virtual de Orion
	vagrant up
	vagrant halt