##  Serie I – Caminos con suma objetivo en árbol binario
Descripción
Este ejercicio resuelve el problema de encontrar todas las rutas desde la raíz hasta las hojas en un árbol binario, donde la suma de los valores de los nodos sea igual a un valor objetivo (targetSum). La solución está implementada en Java, en la clase Serie1.

Implementación
Se utilizó una técnica de backtracking con búsqueda en profundidad (DFS) para explorar todas las rutas posibles. Si al llegar a una hoja, la suma acumulada coincide con el targetSum, esa ruta se guarda en la lista de resultados.

La clase principal es Serie1.

El método público es pathSum(TreeNode root, int targetSum).

Se apoyó en un método privado recursivo findPaths que realiza la lógica central.

Buenas prácticas
Se aplicó el Principio de Responsabilidad Única (SRP): cada método hace una sola tarea.

Se respetó el Principio Open/Closed (OCP): el diseño permite extender funcionalidades sin modificar el código base.

Comentarios claros en el código para facilitar su lectura y mantenimiento.

🧪 Ejecución
Puedes ejecutar el archivo Serie1.java para ver un ejemplo funcional del árbol y los caminos válidos con suma 22.


Caminos con suma 22:
[5, 4, 11, 2]
 Nota
Este ejercicio corresponde a mi carnet: 7690-23-18731.

# Proyecto COVID-19 Serie ll

Este proyecto en Java Spring Boot consume una API pública de estadísticas COVID-19 (RapidAPI) y guarda la información en una base de datos MySQL. Se enfoca en seguir buenas prácticas como separación por capas, principios SOLID y uso de JPA para persistencia.



##  Estructura del Proyecto

com.miumgcovid.tarea.miumg
├── controllers # Controladores REST
│ └── MainController.java
├── models # Entidades del modelo de datos
│ ├── RegionAPI.java
│ ├── ProvinciaAPI.java
│ └── ReporteAPI.java
├── repositories # Repositorios JPA
│ ├── repositorioRegion.java
│ ├── RepositorioProvincia.java
│ ├── RepositorioReporte.java
│ └── RepositorioHiloProceso.java
├── services # Lógica de negocio
│ └── ServicioPeticion.java





## 🔧 Tecnologías Usadas

- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- MySQL
- RestTemplate
- Jackson (ObjectMapper)
- RapidAPI (COVID-19 Stats)
- Maven

---

##  Funcionalidades

###  Proceso automático con hilo
- `GET /api/ejecutar`: inicia un hilo que hace peticiones a la API y guarda regiones, provincias y reportes.

###  Endpoints para descargar y guardar datos
- `GET /api/regiones`: descarga regiones desde la API y las guarda.
- `GET /api/provinciaapi`: descarga provincias desde la API y las guarda.
- `GET /api/reportes`: descarga reportes desde la API y los guarda si no existen previamente (control por `iso` y `date`).

###  Endpoints para consultar datos locales
- `GET /api/regiones/ver`: ver todas las regiones guardadas.
- `GET /api/provinciaapi/ver`: ver todas las provincias guardadas.
- `GET /api/reportes/ver`: ver todos los reportes guardados.
- `GET /api/reportes/{iso}/{date}`: ver reportes por código de país (`iso`) y fecha.
- `GET /api/reportes/agrupados?iso=XXX&date=YYYY-MM-DD`: ver reportes sin duplicados por provincia usando `TreeMap`.

---

##  Buenas Prácticas Aplicadas

- Separación por capas (Controller, Service, Repository, Model).
- Inyección de dependencias con `@Autowired`.
- Principio de Responsabilidad Única (SRP).
- Evita duplicados al guardar usando `existsByDateAndIso`.
- Control de ejecuciones con hilos y logs informativos.

---

## ⚙ Configuración de Base de Datos


properties:
--
spring.datasource.url=jdbc:mysql://localhost:3306/covid_19_dbd
spring.datasource.username=root
spring.datasource.password=contrasena123
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
--
