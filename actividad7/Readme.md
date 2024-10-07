# Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es el planificador de procesos utilizado por el núcleo de Linux. Se diseñó para proporcionar una distribución equitativa del tiempo de CPU entre los procesos, maximizando la eficiencia y la capacidad de respuesta del sistema.

## Características Principales

1. **Justicia**:
   - CFS se basa en la idea de que cada tarea debe recibir una parte justa del tiempo de CPU. Utiliza un algoritmo de "tiempo de ejecución proporcional" para garantizar que todos los procesos obtengan un tiempo de CPU justo, en función de su prioridad.

2. **Uso de un Árbol Rojo-Negrita**:
   - CFS implementa una estructura de datos conocida como un árbol rojo-negrita para mantener un seguimiento de los procesos. Esta estructura permite una inserción, eliminación y búsqueda eficientes, lo que permite al planificador seleccionar el proceso que debe ejecutarse a continuación de manera rápida.

3. **Tiempo de Ejecución Virtual**:
   - Cada proceso tiene un "tiempo de ejecución virtual" que se utiliza para determinar cuánto tiempo ha utilizado realmente el proceso. CFS prioriza los procesos con menos tiempo de ejecución, permitiendo así que los procesos que han utilizado menos CPU se ejecuten más rápidamente.

4. **Prioridades Dinámicas**:
   - Las prioridades de los procesos en CFS son dinámicas. A medida que un proceso utiliza CPU, su prioridad se ajusta, y los procesos que no están utilizando CPU pueden aumentar su prioridad, permitiendo una distribución más justa del tiempo de CPU.

5. **No Basado en Cuotas**:
   - A diferencia de otros planificadores, CFS no asigna cuotas fijas de tiempo de CPU a los procesos. En su lugar, distribuye el tiempo de CPU de manera dinámica y equitativa.

## Funcionamiento

1. **Selección del Proceso**:
   - Cuando el núcleo de Linux necesita seleccionar un proceso para ejecutar, consulta el árbol rojo-negrita para encontrar el proceso con el menor tiempo de ejecución virtual. Este proceso es el que se ejecutará a continuación.

2. **Despertar y Suspensión**:
   - Cuando un proceso se despierta o se suspende, su tiempo de ejecución se ajusta en el árbol. Si un proceso se bloquea (por ejemplo, espera I/O), no ocupa tiempo de CPU y su tiempo de ejecución virtual no se incrementa.

3. **Context Switching**:
   - En cada cambio de contexto, CFS asegura que el tiempo de CPU se distribuya equitativamente. Si un proceso ha utilizado su "cuota" de tiempo de CPU, será menos probable que se seleccione para su ejecución inmediata en comparación con otros procesos con menos tiempo utilizado.

4. **Tiempos de Latencia**:
   - CFS tiene una configuración que permite a los usuarios ajustar la latencia y el comportamiento del planificador, permitiendo un equilibrio entre la equidad y la capacidad de respuesta.

## Conclusión

El Completely Fair Scheduler (CFS) es un planificador eficaz que busca maximizar la equidad en la asignación del tiempo de CPU entre procesos, utilizando estructuras de datos eficientes y un enfoque dinámico hacia la priorización de procesos. Esto ayuda a garantizar que el sistema operativo Linux ofrezca un rendimiento equilibrado y una buena capacidad de respuesta, incluso bajo cargas de trabajo intensivas.
