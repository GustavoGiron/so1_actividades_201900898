## Instrucciones

### 1. Crear el script

Primero, necesitas crear un script que se encargue de imprimir el saludo y la fecha actual. Sigue estos pasos:

1. Crea el script `greeting.sh` en la ubicación deseada:

    ```bash
    nano /ruta/al/script/greeting.sh
    ```

2. Agrega el siguiente contenido al script:

    ```bash
    #!/bin/bash
    while true
    do
        echo "Hola, la fecha actual es: $(date)"
        sleep 1
    done
    ```

3. Haz que el script sea ejecutable:

    ```bash
    chmod +x /ruta/al/script/greeting.sh
    ```

### 2. Crear el archivo de la unidad de `systemd`

Ahora, necesitas crear el archivo de configuración del servicio de `systemd`.

1. Crea un archivo llamado `greeting.service` en `/etc/systemd/system/`:

    ```bash
    sudo nano /etc/systemd/system/greeting.service
    ```

2. Agrega el siguiente contenido al archivo:

    ```ini
    [Unit]
    Description=Servicio que imprime un saludo y la fecha actual infinitamente

    [Service]
    ExecStart=/ruta/al/script/greeting.sh
    Restart=always
    User=tu_usuario
    WorkingDirectory=/ruta/al/script/
    StandardOutput=journal
    StandardError=journal

    [Install]
    WantedBy=multi-user.target
    ```

3. Guarda el archivo y cierra el editor.

### 3. Recargar `systemd`, habilitar e iniciar el servicio

1. Recarga `systemd` para que reconozca el nuevo servicio:

    ```bash
    sudo systemctl daemon-reload
    ```

2. Habilita el servicio para que se inicie automáticamente con el sistema:

    ```bash
    sudo systemctl enable greeting.service
    ```

3. Inicia el servicio:

    ```bash
    sudo systemctl start greeting.service
    ```

### 4. Verificar el estado del servicio

Para verificar que el servicio está funcionando correctamente, puedes usar el siguiente comando:

```bash
sudo systemctl status greeting.service
