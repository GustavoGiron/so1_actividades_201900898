# Proceso de instalación del servicio

## Paso 1

Crea un archivo de unidad de systemd para el servicio.  "saludo_fecha.service":

```
sudo nano /etc/systemd/system/saludo_fecha.service
```

## Paso 2

Agrega el siguiente contenido al archivo:

```
[Unit]
Description=Saludo y fecha infinito

[Service]
ExecStart=/ruta/al/script/saludo_fecha.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

## Paso 3

Habilita y comienza el servicio:

```
sudo systemctl daemon-reload
sudo systemctl enable saludo_fecha.service
sudo systemctl start saludo_fecha.service
```