# ✈️ Gestor de Viajes Mytra- Proyecto Final de DAW

**Autora:** Alejandra Valencia Ocampo  
**Ciclo Formativo:** Desarrollo de Aplicaciones Web (DAW)  
**Tecnologías:** PHP, JavaScript, CSS, Bootstrap, MySQL, phpMyAdmin

---

## 📖 Descripción

Este proyecto es mi **Proyecto de Finalización del Ciclo de DAW**.  
Se trata de un **gestor de viajes**, donde se pueden:

- Crear, modificar y eliminar viajes.
- Gestionar reservas y usuarios.
- Visualizar información de manera interactiva y moderna.

Está desarrollado con:

- **Frontend:** HTML, CSS, Bootstrap y JavaScript
- **Backend:** PHP
- **Base de datos:** MySQL, gestionada con phpMyAdmin

---

## 🛠️ Requisitos

Antes de ejecutar el proyecto, necesitas:

- [XAMPP](https://www.apachefriends.org/es/index.html) (PHP + MySQL + phpMyAdmin)
- Navegador web moderno (Chrome, Firefox, Edge...)
- Archivo `.sql` de la base de datos (incluido en el proyecto)
- Código fuente completo del proyecto

---

## 🚀 Instalación y Configuración

### 1️⃣ Instalar XAMPP

1. Descarga XAMPP desde [apachefriends.org](https://www.apachefriends.org/es/index.html).
2. Instálalo con **opciones por defecto** (Apache + MySQL).
3. Abre el **Panel de Control de XAMPP** y arranca:
   - **Apache** ✅
   - **MySQL** ✅

---

### 2️⃣ Copiar el proyecto

1. Localiza la carpeta `htdocs` de XAMPP
2. Copia la carpeta de tu proyecto dentro de `htdocs`

---

### 3️⃣ Importar la base de datos

1. Abre phpMyAdmin:  
   [http://localhost/phpmyadmin](http://localhost/phpmyadmin)
2. Crea una **nueva base de datos** con un nombre descriptivo, por ejemplo:
3. Selecciona la base de datos y haz clic en **Importar**.
4. Selecciona el archivo `.sql` del proyecto y pulsa **Continuar** ✅

---

### 4️⃣ Configurar la conexión a la base de datos

Abre el archivo `conexion.php` y asegúrate de que los datos coinciden con tu entorno:

```php
$host = "localhost";
$user = "root";
$password = "";
$database = "travelplanificator";

---

### 5️⃣ Ejecutar la aplicación

1. Abre tu navegador.
2. Accede a:
    http://localhost/gestor_viajes
3. Comprueba que todo funciona correctamente: crear viajes, visualizar reservas, etc.
```
