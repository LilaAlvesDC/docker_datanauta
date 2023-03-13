# Docker: Guía teorico - práctica para principiantes en ciencia de datos

  

## ¿Qué es Docker y cómo funciona?

Docker es una herramienta de virtualización de contenedores que permite a los usuarios crear y ejecutar contenedores de software en diferentes sistemas operativos. En otras palabras, Docker te permite crear entornos de trabajo portátiles y reproducibles que contienen todas las bibliotecas y herramientas necesarias para tus proyectos de ciencia de datos.

  

## Imágenes de Docker

Una imagen de Docker es un archivo estático que contiene todas las dependencias y configuraciones necesarias para ejecutar una aplicación en un contenedor de Docker. Por ejemplo, si deseas ejecutar una aplicación Python en un contenedor de Docker, deberás crear una imagen de Docker que contenga Python y todas las bibliotecas necesarias para ejecutar la aplicación.

  

La imágenes se construyen con el siguiente comando a partir de los parámetros indicados en el archivo Dockerfile ubicado en el mismo directorio:

  
  

    docker  build -t nombre-de-tu-imagen .

## Contenedores de Docker

Un contenedor de Docker es una instancia de una imagen de Docker que se ejecuta como un proceso aislado en el sistema operativo host. Los contenedores de Docker son ligeros y portátiles, lo que los hace ideales para ejecutar aplicaciones en diferentes entornos de forma consistente.

  

Una vez que se ha construido la imagen, se puede ejecutar el siguiente comando para iniciar un contenedor a partir de la imagen:

  

    docker run -p puerto-del-contenedor:puerto-del-host nombre-de-la-imagen

  
  

Donde `"puerto-del-contenedor"` es el puerto en el que el contenedor está escuchando y `"puerto-del-host"` es el puerto en el que se desea que se conecte desde el host. `"nombre-de-la-imagen"` es el nombre que se le dio a la imagen cuando se construyó.

  

## Volumenes

Un volumen en Docker es un directorio o un archivo en el host que se monta en el contenedor. Este montaje se realiza de tal manera que el directorio o archivo en el host y el contenedor son los mismos, y cualquier cambio realizado en uno se reflejará en el otro. Los volúmenes son muy útiles para almacenar datos persistentes como bases de datos, archivos de configuración, archivos de registro, etc.

  

Un volumen puede crearse de la siguiente manera:

  

    docker volume create mi-volumen

## Ventajas de usar Docker en ciencia de datos

Las ventajas de usar Docker en proyectos de ciencia de datos incluyen la portabilidad, la reproducibilidad y la escalabilidad.

-   Docker permite a los usuarios crear entornos de trabajo portátiles que pueden ejecutarse en diferentes sistemas operativos, lo que facilita la colaboración y la distribución de aplicaciones.
    
-   Además, Docker permite a los usuarios crear entornos de trabajo reproducibles que evitan problemas de incompatibilidad entre diferentes bibliotecas y herramientas.
    
-   Docker es escalable y permite a los usuarios ejecutar aplicaciones en múltiples contenedores, lo que es útil para proyectos de ciencia de datos de gran escala.
    

  
  

# Guía Práctica

## Instalación de Docker

Para comenzar con Docker, primero necesitas instalarlo en tu ordenador. Una vez que lo hayas instalado, puedes comenzar a trabajar con imágenes de Docker.

  

### Paso 1: Verificar los requisitos del sistema

Antes de instalar Docker, es importante verificar los requisitos del sistema para asegurarte de que tu ordenador sea compatible con Docker. Asegúrate de tener una versión de 64 bits de Windows 10, Windows Server 2016 o una versión posterior. Para sistemas operativos Linux, consulta la documentación de Docker para obtener información específica sobre los requisitos del sistema.

  

Window: [https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/)

Linux: [https://docs.docker.com/desktop/install/linux-install/](https://docs.docker.com/desktop/install/linux-install/)

Mac: [https://docs.docker.com/desktop/install/mac-install/](https://docs.docker.com/desktop/install/mac-install/)

  

### Paso 2: Descargar e instalar Docker

Una vez que hayas verificado los requisitos del sistema, puedes descargar e instalar Docker. Puedes descargar la versión adecuada de Docker para tu sistema operativo desde el sitio web oficial de Docker ([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)).

  

### Paso 3: Ejecutar Docker

Después de instalar Docker, puedes ejecutarlo en tu ordenador. Docker Desktop es la forma más fácil de comenzar con Docker en Windows y Mac. Docker Desktop proporciona una GUI y una CLI para administrar contenedores de Docker. En Linux, se utiliza la CLI de Docker para administrar contenedores.

 ![docker desktop](https://github.com/LilaAlvesDC/docker_datanauta/blob/main/str/docker_desktop.JPG)

  

### Paso 4: Verificar la instalación

Para verificar que Docker se haya instalado correctamente, puedes ejecutar el siguiente comando en la CLI de Docker:

  
  

    docker --version

  

  

Este comando debería devolver la versión actual de Docker que está instalada en tu ordenador. Si el comando no funciona, asegúrate de que Docker esté instalado correctamente y que tu PATH esté configurado correctamente para acceder a Docker.

  

## Creación de una imagen de Docker con Dockerfile

### Paso 1: Crear un archivo Dockerfile

Lo primero que necesitas hacer para crear una imagen de Docker es crear un archivo Dockerfile. Un Dockerfile es un archivo de texto que contiene una serie de instrucciones para crear una imagen de Docker.

    /  
    ├── app  
    │ ├── __init__.py  
    │ ├── main.py  
    │ └── requirements.txt  
    ├── Dockerfile  
    └── README.md

### Paso 2: Escribir las instrucciones en el Dockerfile

En el archivo Dockerfile, deberás incluir las instrucciones necesarias para crear la imagen de Docker. Las instrucciones pueden incluir la instalación de software, la copia de archivos, la definición de variables de entorno y más.

  

Por ejemplo, si deseas crear una imagen de Docker que contenga una aplicación Python, puedes escribir un Dockerfile que instale Python y todas las bibliotecas necesarias. Aquí hay un ejemplo de un Dockerfile básico para una aplicación Python:

  
    FROM python:3.9
    
    # Directorio de trabajo
    WORKDIR /app
    
    # Copiar archivos necesarios
    COPY ../requirements.txt .
    COPY ../app.py .
      
    # Instalar dependencias
    RUN pip install -r requirements.txt
         
    # Establecer punto de montaje para el volumen persistente
    
    VOLUME /app/Docker/datanauta
        
    EXPOSE 8501
            
    # Comando para ejecutar la aplicación
    CMD ["streamlit", "run", "app.py"]

 En un archivo Dockerfile se definen las instrucciones para construir una imagen de Docker. A continuación, te explicamos los comandos más comunes utilizados en Dockerfile:

1.  `FROM`: Este comando especifica la imagen base que se utilizará para construir la nueva imagen. Es la primera línea que se escribe en el archivo Dockerfile y es obligatorio.
    
2.  `RUN`: Este comando se utiliza para ejecutar comandos dentro del contenedor durante la construcción de la imagen. Se utiliza para instalar paquetes, configurar el entorno y realizar otras tareas de configuración.
    
3.  `COPY`: Este comando se utiliza para copiar archivos y directorios desde el sistema de archivos del host al sistema de archivos del contenedor.
    
4.  `ADD`: Este comando funciona de manera similar al comando COPY, pero también permite agregar archivos y directorios desde una URL o archivo comprimido.
    
5.  `WORKDIR`: Este comando se utiliza para cambiar el directorio de trabajo dentro del contenedor.
    
6.  `EXPOSE`: Este comando se utiliza para especificar el puerto en el que se ejecutará el contenedor.
    
7.  `CMD`: Este comando se utiliza para especificar el comando que se ejecutará cuando se inicie el contenedor. Es el último comando en el archivo Dockerfile y solo puede aparecer una vez.
    

### Paso 3: Crear requirements.txt

`requirements.txt` es un archivo de texto que se utiliza en proyectos de Python para especificar las dependencias y bibliotecas de Python que se necesitan para que el proyecto se ejecute correctamente. Este archivo es utilizado por herramientas de administración de paquetes de Python, como pip, para instalar automáticamente todas las bibliotecas necesarias para el proyecto.

  

El archivo requirements.txt contiene una lista de paquetes de Python y sus versiones correspondientes que se necesitan para ejecutar el proyecto. Cada línea del archivo debe contener el nombre del paquete y la versión correspondiente, separados por el símbolo `==`. 
Por ejemplo, la línea `numpy==1.16.4` especifica que se necesita la biblioteca de NumPy versión 1.16.4.

  
    python==3.8  
    pandas==1.2.4  
    matplotlib==3.4.2  
    streamlit==1.20.0

### Paso 4: Construir la imagen de Docker

Una vez que hayas escrito las instrucciones en el Dockerfile, puedes construir la imagen de Docker. Para construir la imagen, utiliza el siguiente comando en la CLI de Docker:

  

    docker  build -t docker_datanauta .

  

Este comando construirá la imagen de Docker utilizando el Dockerfile que acabas de crear. El argumento `-t` especifica el nombre que deseas darle a la imagen, y el `.` especifica la ubicación del Dockerfile.

  

### Paso 5: Verificar la imagen de Docker

Para verificar que la imagen de Docker se haya construido correctamente, puedes ejecutar el siguiente comando en la CLI de Docker:

  

    docker images

  

Este comando debería devolver una lista de todas las imágenes de Docker que están disponibles en tu ordenador, incluida la nueva imagen que acabas de crear.

  

### Paso 6: Crear contenedor

  

Una vez que se ha construido la imagen, se puede ejecutar el siguiente comando para iniciar un contenedor a partir de la imagen:

  

    docker run -it --name datanauta -p 8501:8501 --mount source=datanauta-vol,target=/app/Docker/datanauta --restart=always docker_datanauta

  


Este código ejecuta el comando docker run para iniciar un nuevo contenedor a partir de la imagen docker_datanauta. Los diferentes parámetros que se le pasan al comando son los siguientes:

  

`-it:` Este parámetro indica que el contenedor se iniciará en modo interactivo, es decir, que se podrá interactuar con él a través de la consola.

`--name` datanauta: Este parámetro establece el nombre que se le dará al contenedor, en este caso datanauta.

`-p 8501:8501:` Este parámetro establece la redirección de puertos, indicando que el puerto 8501 del contenedor se mapeará al puerto 8501 del host.

`--mount source=datanauta-vol,target=/app/Docker/datanauta:` Este parámetro establece la creación de un volumen persistente con el nombre datanauta-vol que se montará en la ruta /app/Docker/datanauta dentro del contenedor. Este volumen permitirá persistir los datos de la aplicación.

`--restart=always:` Este parámetro indica que el contenedor se reiniciará automáticamente en caso de fallo o cierre inesperado.

`docker_datanauta:` Este es el nombre de la imagen que se utilizará para crear el contenedor.

  

### Paso 7: Visualizar contener en navegador

  

Una vez que hayas ejecutado la aplicación de Streamlit en tu máquina, puedes visualizar el contenido en tu navegador web visitando la dirección [http://localhost:8501/](http://localhost:8501/). Esto abrirá la aplicación en tu navegador y podrás interactuar con ella como cualquier otra página web. Asegúrate de tener la aplicación en ejecución en tu máquina antes de intentar acceder a ella a través del navegador.

 ![streamlit](https://github.com/LilaAlvesDC/docker_datanauta/blob/main/str/streamlit.JPG)  
  

Esperamos que hayas disfrutado esta guía.

  

No te olvides de visitarnos en: https://datanauta.space/
