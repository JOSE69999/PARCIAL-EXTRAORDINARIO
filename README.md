# Proyecto COVID-19 - Consumo de API Pública con Spring Boot

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

## ⚙️ Configuración de Base de Datos


properties:
spring.datasource.url=jdbc:mysql://localhost:3306/covid_19_dbd
spring.datasource.username=root
spring.datasource.password=contrasena123
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
