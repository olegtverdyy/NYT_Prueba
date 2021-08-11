#  NYT Prueba

Aplicacion desarrollada en Xcode 12.5 usando como target minimo la version de iOS 12.3.
Esta se basa en la consulta de la **The Most Popular API**, con la cual se realiza un filtro de busqueda para la representacion del resultado en un listado de elementos.

http://developer.nytimes.com/docs/most_popular_api

## Librerias externas

Para el desarrollo de esta aplicacion se han usado las siguientes librerias externas, todas usando Swift Package Manager:

- Para mostrar un elemento cargando: https://github.com/JonasGessner/JGProgressHUD
- Para mostrar las imagenes recibidas de la API: https://github.com/onevcat/Kingfisher
- Para mostrar un selector stepper multiple: https://github.com/yonat/MultiSelectSegmentedControl

## Llamadas a la API

Para realizar las llamadas de la API se ha realizado una clase que usa URLSession para hacer dichas llamadas, para posteriormente realizar un parseo a nuestros modelos usando Codable.

## Capturas aplicacion

![CleanShot 2021-08-11 at 09 38 52](https://user-images.githubusercontent.com/76475720/128989259-844f5bf1-48fb-46e8-b8d7-1e65c1afdb37.png)

![CleanShot 2021-08-11 at 09 38 52](https://user-images.githubusercontent.com/76475720/128989308-03d613ce-664a-412a-9e47-04b37608937a.png)

![CleanShot 2021-08-11 at 09 42 04](https://user-images.githubusercontent.com/76475720/128989699-73b25eb2-06a4-4371-b9a9-87da14eb299d.png)

