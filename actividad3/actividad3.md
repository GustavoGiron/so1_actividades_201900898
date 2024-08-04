
### Parte 1: Gestion de Usuarios

#### 1. Creación de Usuarios

```bash

sudo useradd usuario1

sudo useradd usuario2

sudo useradd usuario3

```

#### 2. Asignación de Contraseñas

```bash

sudo passwd usuario1

# Ingresar la nueva contraseña para usuario1

sudo passwd usuario2

# Ingresar la nueva contraseña para usuario2

sudo passwd usuario3

# Ingresar la nueva contraseña para usuario3

```

#### 3. Información de Usuarios

```bash

id usuario1

```bash

**Resultado esperado:**

```bash

uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1)

```

#### 4. Eliminación de Usuarios

```bash

sudo userdel -r usuario3

```

### Parte 2: Gestión de Grupos

#### 1. Creación de Grupos

```bash

sudo groupadd grupo1

sudo groupadd grupo2

```

#### 2. Agregar Usuarios a Grupos

```bash

sudo usermod -aG grupo1 usuario1

sudo usermod -aG grupo2 usuario2

```

#### 3. Verificar Membresía

```bash

groups usuario1

```

**Resultado esperado:**

```

usuario1 : usuario1 grupo1

```

```bash

groups usuario2

```

**Resultado esperado:**

```bash

usuario2 : usuario2 grupo2

```

#### 4. Eliminar Grupo

```bash

sudo groupdel grupo2

```

### Parte 3: Gestión de Permisos

#### 1. Creación de Archivos y Directorios

**Como `usuario1`:**

```bash

su - usuario1

echo "Contenido de archivo1" > archivo1.txt

mkdir directorio1

echo "Contenido de archivo2" > directorio1/archivo2.txt

```

#### 2. Verificar Permisos

```bash

ls -l archivo1.txt

```

**Resultado esperado:**

```bash

-rw-r--r-- 1 usuario1 usuario1 19 Aug  4 12:34 archivo1.txt

```

```bash

ls -ld directorio1

```

**Resultado esperado:**

```bash

drwxr-xr-x 2 usuario1 usuario1 4096 Aug  4 12:34 directorio1

```

#### 3. Modificar Permisos usando `chmod` con Modo Numérico

```bash

chmod 640 archivo1.txt

```

#### 4. Modificar Permisos usando `chmod` con Modo Simbólico

```bash

chmod u+x directorio1/archivo2.txt

```

#### 5. Cambiar el Grupo Propietario

```bash

chown :grupo1 directorio1/archivo2.txt

```

#### 6. Configurar Permisos de Directorio

```bash

chmod 740 directorio1

```

#### 7. Comprobación de Acceso

**Como `usuario2`:**

```bash

su - usuario2

cat /home/usuario1/archivo1.txt

# Debería poder leerlo porque tiene permisos de lectura para el grupo

cat /home/usuario1/directorio1/archivo2.txt

# Debería dar un error de permiso denegado porque usuario2 no puede entrar al directorio1

```

#### 8. Verificación Final

```bash

ls -l /home/usuario1/archivo1.txt

```

**Resultado esperado:**

```bash

-rw-r----- 1 usuario1 usuario1 19 Aug  4 12:34 /home/usuario1/archivo1.txt

```

```bash

ls -ld /home/usuario1/directorio1

```

**Resultado esperado:**

```bash

drwxr----- 2 usuario1 usuario1 4096 Aug  4 12:34 /home/usuario1/directorio1

```

```bash

ls -l /home/usuario1/directorio1/archivo2.txt

```

**Resultado esperado:**

```bash

-rwxr-xr-- 1 usuario1 grupo1 19 Aug  4 12:34 /home/usuario1/directorio1/archivo2.txt

```
