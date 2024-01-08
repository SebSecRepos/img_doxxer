# img_doxxer
> Herramienta en bash que permite obtener información de una persona y su dispositivo mediante su acceso a una url web, utilizando un servidor web, ssh y serveo.net.
> Si la persona ingresa a la url, obtenemos la información en nuestro servidor, el servidor web se monta en python de forma local y se tuneliza mediante el uso de serveo.net, proporcionandonos un enlace con un dominio
> el cuál debe ser enviado a la víctima. Esta herramienta tiene fines educativos y/o defensivos, no me hago cargo del uso irresponsable de la misma.

## Requisitos 
- python
- ssh
- Enlace a una imagen si o si JPEG o JPG
----

## Importante!
> Esta herramienta tuneliza la aplicación web de su equipo hacia internet sin abrir puertos, sin embargo puede exponer su equipo a ataques, luego de ejecutar la herramienta, ejecutar el script "clean.sh", para
> cerrar los procesos asociados al tunneling por ssh y el servicio web.
> La previsualización del enlace puede demorar unos minutos en mostrarse al enviarla si el servicio fue ejecutado recientemente, recarge las aplicaciones y limpie el caché antes de enviar el enlace a la víctima.

## Parámetros
1. Url de una imagen para utilizar en la web, como previsualización y para colocar en la página web
2. Puerto del servicio web local
2. Descripción, este texto se previsualiza como el title de la página y en las etiquetas de previsualización dándole un toque mas creíble.

![imagen](https://github.com/SebSecRepos/img_doxxer/assets/130188315/569336e8-011b-46e2-bb62-bf5d9be2bcae)
----
![imagen](https://github.com/SebSecRepos/img_doxxer/assets/130188315/81c6ed44-e48d-45e4-b7c2-7c9344e41fa3)
----
![imagen](https://github.com/SebSecRepos/img_doxxer/assets/130188315/1207ef64-af37-4297-bc78-9f1a82fa9934)
----


## Ejemplo de uso 

Primero hacer un portforwarding de cualquier puerto con serveo y ssh para dejar la conexión autorizada antes de ejecutar el script, luego darle 'yes' y cerrar la conexión.
```bash
  ssh -R 80:localhost:80 serveo.net
  # ctrl + c
```

```bash
  ./index.sh "https://i.ibb.co/BsSvGRW/Sin-t-tulo.jpg" 80 "Whatsapp code" 
```
> Si algún ciberdelincuente quisiera realizar un secuestro de nuestra cuenta de whatsapp pidiendo el código que nos llega al smarthphone podríamos utilizar ingeniería social enviandole el enlace con la preview del SMS y obtener cierta información de el.



