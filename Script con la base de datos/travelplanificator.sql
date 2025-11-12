CREATE DATABASE IF NOT EXISTS travelplanificator 
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE travelplanificator;

-- Tabla Usuarios PONER CONTRASEÑA VARCHAR 255
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contraseña VARCHAR(255) NOT NULL
);

-- Tabla Viajes
CREATE TABLE Viajes (
    id_viaje INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_viaje VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    presupuesto_total DECIMAL(10 , 2 ) NOT NULL,
    id_usuario INT,
    ruta_imagen VARCHAR(255) NULL,
    CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario)
        REFERENCES Usuarios (id_usuario)
        ON DELETE CASCADE
);

-- Tabla Destinos
CREATE TABLE Destinos (
    id_destino INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_destino VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    id_viaje INT,
    CONSTRAINT id_viaje_fk FOREIGN KEY (id_viaje)
        REFERENCES Viajes (id_viaje)
         ON DELETE CASCADE
);

-- Tabla Actividades PONER NULL
CREATE TABLE Actividades (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_actividad VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha DATE,
    duracion TIME,
    Precio DECIMAL(10 , 2 ),
    id_destino INT,
    CONSTRAINT id_destino_fk FOREIGN KEY (id_destino)
        REFERENCES Destinos (id_destino)
         ON DELETE CASCADE
);

-- Inserts para Usuarios con constraseña Hash
INSERT INTO Usuarios (nombre, email, contraseña) VALUES
('test1', 'test1@gmail.com', '$2y$10$0Yp.PLyYDpmRQ0se4w/24.7ybP1UkAfRZ5f4USQHmy1x2b8Grkg8q'), 
('test2', 'test2@gmail.com', '$2y$10$hce8UfvOC3PaN8fRuh5boOvF8H09Esf3BmdumzSJn571Ajq0ShoDO');
-- test1 1234
-- test2 4321

-- Inserts para Viajes para Usuario 1
INSERT INTO Viajes (nombre_viaje, fecha_inicio, fecha_fin, presupuesto_total,ruta_imagen, id_usuario) VALUES
('Francia', '2024-03-15', '2024-03-20', 1500.00,'francia.jpeg', 1),
('Italia', '2024-04-10', '2024-04-15', 2000.00,'italia.jpg', 1),
('Japón', '2024-05-05', '2024-05-15', 3000.00,'japon.jpeg', 1),
('Alemania', '2024-06-10', '2024-06-15', 2500.00,'alemania.jpg', 1);

-- Viaje a Francia
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('París', '2024-03-15', '2024-03-16', 1),
('Marsella', '2024-03-17', '2024-03-18', 1),
('Lyon', '2024-03-19', '2024-03-20', 1),
('Niza', '2024-03-21', '2024-03-22', 1),
('Bordeaux', '2024-03-23', '2024-03-24', 1);

-- Viaje a Italia
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Roma', '2024-04-10', '2024-04-11', 2),
('Venecia', '2024-04-12', '2024-04-13', 2),
('Florencia', '2024-04-14', '2024-04-15', 2),
('Milán', '2024-04-16', '2024-04-17', 2),
('Nápoles', '2024-04-18', '2024-04-19', 2);

-- Viaje a Japón
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Tokio', '2024-05-05', '2024-05-06', 3),
('Kioto', '2024-05-07', '2024-05-08', 3),
('Osaka', '2024-05-09', '2024-05-10', 3),
('Hiroshima', '2024-05-11', '2024-05-12', 3),
('Nara', '2024-05-13', '2024-05-14', 3);

-- Viaje a Alemania
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Berlín', '2024-06-10', '2024-06-11', 4),
('Múnich', '2024-06-12', '2024-06-13', 4),
('Hamburgo', '2024-06-14', '2024-06-15', 4),
('Colonia', '2024-06-16', '2024-06-17', 4),
('Frankfurt', '2024-06-18', '2024-06-19', 4);

-- FRANCIA
-- Actividades en París
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Torre Eiffel', 'Recorrido por la famosa torre de París', '2024-03-15', '02:00:00', 50.00, 1),
('Cena en restaurante cercano', 'Disfrutar de la comida francesa', '2024-03-15', '01:30:00', 75.00, 1),
('Paseo en barco por el Sena', 'Navegación por el río Sena', '2024-03-16', '02:30:00', 60.00, 1),
('Visita al Louvre', 'Exploración de una de las galerías de arte más grandes del mundo', '2024-03-17', '03:00:00', 40.00, 1),
('Cata de vinos en un viñedo cercano', 'Degustación de vinos franceses', '2024-03-18', '02:00:00', 65.00, 1),
('Espectáculo en el Moulin Rouge', 'Disfrute de un espectáculo de cabaret icónico', '2024-03-19', '02:30:00', 80.00, 1),
('Visita al Palacio de Versalles', 'Exploración del majestuoso palacio y sus jardines', '2024-03-20', '04:00:00', 55.00, 1),
('Tour gastronómico por Montmartre', 'Degustación de especialidades culinarias en el barrio bohemio', '2024-03-21', '03:00:00', 70.00, 1),
('Visita a la Catedral de Notre Dame', 'Exploración de la famosa catedral gótica', '2024-03-22', '02:00:00', 45.00, 1),
('Recorrido por el Museo de Orsay', 'Exploración de una impresionante colección de arte impresionista', '2024-03-23', '03:30:00', 50.00, 1);

-- Actividades en Marsella
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Puerto Viejo de Marsella', 'Exploración de la historia portuaria', '2024-03-17', '02:00:00', 35.00, 2),
('Paseo en barco por las Calanques', 'Navegación por la costa rocosa de Calanques', '2024-03-18', '03:00:00', 50.00, 2),
('Tour gastronómico por el Viejo Puerto', 'Degustación de platos tradicionales', '2024-03-19', '02:30:00', 45.00, 2);

-- Actividades en Lyon
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Basílica de Notre-Dame de Fourvière', 'Exploración de la arquitectura religiosa', '2024-03-19', '02:00:00', 30.00, 3),
('Recorrido por el barrio de Vieux Lyon', 'Exploración de las calles empedradas y las traboules', '2024-03-20', '02:30:00', 40.00, 3),
('Degustación de queso en Les Halles de Lyon Paul Bocuse', 'Degustación de quesos franceses en un mercado cubierto', '2024-03-21', '01:30:00', 25.00, 3);

-- Actividades en Niza
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Paseo por el Paseo de los Ingleses', 'Disfrute de las vistas al mar Mediterráneo', '2024-03-21', '01:30:00', 20.00, 4),
('Visita al Mercado de las Flores de Cours Saleya', 'Exploración del mercado de flores al aire libre', '2024-03-22', '01:00:00', 15.00, 4),
('Cata de vinos rosados en un viñedo cercano', 'Degustación de vinos rosados provenzales', '2024-03-23', '02:00:00', 30.00, 4);

-- ITALIA
-- Actividades en Roma
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Coliseo Romano', 'Exploración del famoso anfiteatro romano', '2024-06-10', '02:00:00', 20.00, 6),
('Recorrido por el Foro Romano', 'Exploración de las ruinas antiguas del centro de la ciudad', '2024-06-11', '03:00:00', 15.00, 6),
('Cena en un restaurante típico italiano', 'Degustación de platos tradicionales romanos', '2024-06-12', '02:30:00', 25.00, 3),
('Visita a la Plaza de España y la Escalinata de Trinità dei Monti', 'Exploración de uno de los lugares más emblemáticos de Roma', '2024-06-13', '02:30:00', 20.00, 6),
('Tour por el Vaticano y la Capilla Sixtina', 'Exploración de los museos del Vaticano y la famosa capilla', '2024-06-14', '04:00:00', 30.00, 6),
('Paseo por el Trastevere', 'Recorrido por el barrio bohemio con calles empedradas', '2024-06-15', '03:00:00', 20.00, 6),
('Visita al Panteón de Agripa', 'Exploración del antiguo templo romano', '2024-06-16', '02:30:00', 25.00, 6),
('Degustación de helado en la Gelateria della Palma', 'Pruebe los sabores artesanales en una famosa heladería', '2024-06-17', '01:30:00', 10.00, 6),
('Recorrido por la Fontana di Trevi', 'Exploración de la famosa fuente barroca', '2024-06-18', '02:00:00', 15.00, 6),
('Visita al Castillo de Sant-Angelo', 'Exploración del antiguo mausoleo y fortaleza', '2024-06-19', '02:00:00', 20.00, 6);

-- Actividades en Florencia
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Galería Uffizi', 'Exploración de la extensa colección de arte renacentista', '2024-06-10', '02:00:00', 20.00, 8),
('Recorrido por el Ponte Vecchio', 'Exploración del famoso puente medieval', '2024-06-11', '03:00:00', 15.00, 8),
('Cena en un restaurante típico florentino', 'Degustación de platos tradicionales toscanos', '2024-06-12', '02:30:00', 25.00, 8),
('Visita al Duomo de Florencia', 'Exploración de la impresionante catedral renacentista', '2024-06-13', '02:30:00', 20.00, 8);

-- Actividades en Venecia
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Paseo en góndola por los canales de Venecia', 'Exploración de la ciudad a través de sus famosos canales', '2024-06-10', '02:00:00', 30.00, 7),
('Visita a la Plaza de San Marcos y la Basílica de San Marcos', 'Exploración de los principales lugares de interés de Venecia', '2024-06-11', '03:00:00', 25.00, 7),
('Cena en un restaurante con vistas al Gran Canal', 'Degustación de platos venecianos con vistas panorámicas', '2024-06-12', '02:30:00', 35.00, 7),
('Recorrido por el barrio de Cannaregio', 'Exploración del barrio menos turístico de Venecia', '2024-06-13', '02:30:00', 20.00, 7);

-- Actividades en Milán
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Catedral de Milán', 'Exploración de la impresionante catedral gótica', '2024-06-10', '02:00:00', 20.00, 9),
('Recorrido por la Galería Vittorio Emanuele II', 'Exploración del famoso centro comercial cubierto', '2024-06-11', '03:00:00', 15.00, 9),
('Cena en un restaurante de alta cocina milanés', 'Degustación de platos modernos en un restaurante de renombre', '2024-06-12', '02:30:00', 40.00, 9),
('Visita al Teatro alla Scala', 'Exploración del famoso teatro de ópera', '2024-06-13', '02:30:00', 25.00, 9);

-- JAPÓN
-- Actividades en Tokio
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Templo Senso-ji', 'Exploración del templo budista más antiguo de Tokio', '2024-06-10', '02:00:00', 15.00, 11),
('Recorrido por el Barrio de Akihabara', 'Exploración del paraíso de la electrónica y los videojuegos', '2024-06-11', '03:00:00', 20.00, 11),
('Cena en un restaurante de sushi tradicional', 'Degustación de sushi fresco en un restaurante auténtico', '2024-06-12', '02:30:00', 25.00, 11),
('Visita al Palacio Imperial de Tokio', 'Exploración del antiguo palacio del emperador', '2024-06-13', '02:30:00', 20.00, 11),
('Tour en barco por la Bahía de Tokio', 'Navegación por la bahía con vistas panorámicas de la ciudad', '2024-06-14', '04:00:00', 30.00,11),
('Paseo por el Parque Yoyogi', 'Disfrute de un tranquilo paseo por el parque urbano', '2024-06-15', '03:00:00', 20.00, 11),
('Visita al Santuario Meiji', 'Exploración del santuario sintoísta en el corazón de Tokio', '2024-06-16', '02:30:00', 25.00, 11),
('Degustación de ramen en un puesto callejero', 'Pruebe el popular plato de fideos en un puesto callejero', '2024-06-17', '01:30:00', 10.00,11),
('Recorrido por el Mercado de Tsukiji', 'Exploración del mercado de pescado más grande y famoso de Tokio', '2024-06-18', '02:00:00', 15.00, 11),
('Visita al Museo Ghibli', 'Exploración del museo dedicado a las obras de Studio Ghibli', '2024-06-19', '02:00:00', 20.00, 11);

-- Actividades en Kioto
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Templo Kinkaku-ji', 'Exploración del famoso pabellón dorado', '2024-06-10', '02:00:00', 20.00, 12),
('Recorrido por el Barrio de Gion', 'Exploración del famoso distrito de geishas', '2024-06-11', '03:00:00', 15.00, 12),
('Cena en un restaurante tradicional de kaiseki', 'Degustación de una cena de varios platos japoneses', '2024-06-12', '02:30:00', 30.00, 12),
('Visita al Templo Kiyomizu-dera', 'Exploración del templo situado en lo alto de una colina', '2024-06-13', '02:30:00', 25.00, 12);

-- Actividades en Osaka
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Castillo de Osaka', 'Exploración del imponente castillo japonés', '2024-06-10', '02:00:00', 15.00, 13),
('Recorrido por el Mercado Kuromon Ichiba', 'Exploración del mercado de alimentos frescos', '2024-06-11', '03:00:00', 20.00, 13),
('Cena en un restaurante de okonomiyaki', 'Degustación de la popular comida japonesa estilo panqueque', '2024-06-12', '02:30:00', 25.00, 13),
('Visita al Universal Studios Japan', 'Exploración del parque temático con atracciones basadas en películas', '2024-06-13', '02:30:00', 30.00, 13);

-- Actividades en Nara
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Parque de Nara', 'Exploración del parque con ciervos y templos', '2024-06-10', '02:00:00', 15.00, 15),
('Recorrido por el Templo Todai-ji', 'Exploración del templo con la estatua de Buda más grande de Japón', '2024-06-11', '03:00:00', 20.00, 15),
('Cena en un restaurante de fideos udon', 'Degustación de los gruesos fideos japoneses en caldo', '2024-06-12', '02:30:00', 25.00, 15),
('Visita al Parque de los Ciervos', 'Disfrute de interactuar con los ciervos en su hábitat natural', '2024-06-13', '02:30:00', 20.00, 15);

-- ALEMANIA
-- Actividades en Berlín
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Muro de Berlín', 'Exploración del famoso monumento histórico', '2024-06-10', '02:00:00', 15.00, 16),
('Recorrido por el Museo de Pérgamo', 'Exploración de las antigüedades en el museo', '2024-06-11', '03:00:00', 20.00, 16),
('Tour por el Reichstag', 'Visita al edificio del parlamento alemán', '2024-06-12', '02:30:00', 25.00, 16),
('Paseo por el Parque Tiergarten', 'Disfrute de un tranquilo paseo por el parque', '2024-06-13', '01:30:00', 10.00, 16),
('Cena en un restaurante típico alemán', 'Degustación de platos tradicionales', '2024-06-14', '02:00:00', 30.00, 16),
('Visita a la Isla de los Museos', 'Exploración de los museos en la isla del río Spree', '2024-06-15', '04:00:00', 25.00, 16),
('Recorrido por el Barrio Judío', 'Exploración de la historia judía de Berlín', '2024-06-16', '02:30:00', 20.00, 16),
('Tour en bicicleta por la ciudad', 'Recorrido por los lugares emblemáticos en bicicleta', '2024-06-17', '03:00:00', 15.00, 16),
('Visita al Monumento a los Judíos de Europa Asesinados', 'Exploración del monumento conmemorativo', '2024-06-18', '01:30:00', 10.00, 16),
('Espectáculo de luz en la Puerta de Brandeburgo', 'Disfrute de un espectáculo de luz nocturno', '2024-06-19', '01:00:00', 10.00, 16);

-- Actividades en Múnich
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Marienplatz', 'Exploración de la plaza principal de Múnich', '2024-06-10', '02:00:00', 10.00, 17),
('Recorrido por el Englischer Garten', 'Disfrute de un paseo por el parque urbano más grande', '2024-06-11', '03:00:00', 15.00, 17),
('Degustación de cerveza en un Biergarten', 'Pruebe la cerveza alemana en un jardín de cerveza tradicional', '2024-06-12', '02:30:00', 20.00, 17),
('Visita al Palacio de Nymphenburg', 'Exploración del palacio barroco y sus jardines', '2024-06-13', '02:30:00', 20.00, 17);

-- Actividades en Hamburgo
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Tour en barco por el Puerto de Hamburgo', 'Navegación por el segundo puerto más grande de Europa', '2024-06-10', '02:00:00', 20.00, 18),
('Recorrido por el Barrio de St. Pauli', 'Exploración del barrio bohemio y cultural', '2024-06-11', '03:00:00', 15.00, 18),
('Visita al Miniatur Wunderland', 'Exploración del museo de trenes en miniatura más grande del mundo', '2024-06-12', '02:30:00', 25.00, 18),
('Paseo por el Lago Alster', 'Disfrute de un tranquilo paseo en barco por el lago', '2024-06-13', '01:30:00', 15.00, 18);

-- Actividades en Colonia
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Catedral de Colonia', 'Exploración de la famosa catedral gótica', '2024-06-10', '02:00:00', 15.00, 19),
('Recorrido por el Barrio Belga', 'Exploración del barrio con una amplia oferta gastronómica', '2024-06-11', '03:00:00', 20.00, 19),
('Degustación de Kölsch en una cervecería local', 'Pruebe la cerveza Kölsch en una cervecería tradicional', '2024-06-12', '02:30:00', 25.00, 19),
('Visita al Museo Romano-Germánico', 'Exploración del museo que muestra la historia de la ciudad', '2024-06-13', '02:30:00', 20.00, 19);

-- Inserts para Viajes de Usuario 2
INSERT INTO Viajes (nombre_viaje, fecha_inicio, fecha_fin, presupuesto_total, id_usuario) VALUES
('España', '2024-03-15', '2024-03-20', 2000.00, 2),
('Grecia', '2024-04-10', '2024-04-15', 2500.00, 2),
('Australia', '2024-05-05', '2024-05-15', 3000.00, 2),
('Canadá', '2024-06-10', '2024-06-15', 3500.00, 2);

-- Inserts de destinos
-- Viaje a España
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Madrid', '2024-03-15', '2024-03-16', 5),
('Barcelona', '2024-03-17', '2024-03-18', 5),
('Sevilla', '2024-03-19', '2024-03-20', 5),
('Valencia', '2024-03-21', '2024-03-22', 5),
('Granada', '2024-03-23', '2024-03-24', 5);

-- Viaje a Grecia
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Atenas', '2024-04-10', '2024-04-11', 6),
('Santorini', '2024-04-12', '2024-04-13', 6),
('Mikonos', '2024-04-14', '2024-04-15', 6),
('Corfú', '2024-04-16', '2024-04-17', 6),
('Rodas', '2024-04-18', '2024-04-19', 6);

-- Viaje a Australia
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Sídney', '2024-05-05', '2024-05-06', 7),
('Melbourne', '2024-05-07', '2024-05-08', 7),
('Brisbane', '2024-05-09', '2024-05-10', 7),
('Cairns', '2024-05-11', '2024-05-12', 7),
('Gold Coast', '2024-05-13', '2024-05-14', 7);

-- Viaje a Canadá
INSERT INTO Destinos (nombre_destino, fecha_inicio, fecha_fin, id_viaje) VALUES
('Toronto', '2024-06-10', '2024-06-11', 8),
('Montreal', '2024-06-12', '2024-06-13', 8),
('Vancouver', '2024-06-14', '2024-06-15', 8),
('Quebec', '2024-06-16', '2024-06-17', 8),
('Niágara', '2024-06-18', '2024-06-19', 8);

-- ESPAÑA
-- Actividades en Madrid
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Museo del Prado', 'Exploración de una de las mejores colecciones de arte del mundo', '2024-03-15', '02:00:00', 20.00, 21),
('Recorrido por el Parque del Retiro', 'Paseo por uno de los parques más famosos de Madrid', '2024-03-16', '01:30:00', 15.00, 21),
('Cena en la Plaza Mayor', 'Disfrute de la gastronomía española en un lugar emblemático', '2024-03-17', '02:00:00', 30.00, 21),
('Visita al Palacio Real', 'Exploración del impresionante palacio y sus jardines', '2024-03-18', '02:30:00', 25.00, 21),
('Tour de tapas por La Latina', 'Degustación de tapas en los bares tradicionales de Madrid', '2024-03-19', '02:00:00', 25.00, 21),
('Excursión a Toledo', 'Visita a la ciudad histórica de Toledo', '2024-03-20', '06:00:00', 50.00, 9),
('Tour por el Estadio Santiago Bernabéu', 'Exploración del estadio del Real Madrid', '2024-03-21', '02:30:00', 40.00, 21),
('Espectáculo de flamenco en Tablao Villa Rosa', 'Disfrute de una auténtica experiencia de flamenco', '2024-03-22', '02:00:00', 35.00, 21),
('Visita al Templo de Debod', 'Exploración del templo egipcio en pleno centro de Madrid', '2024-03-23', '01:30:00', 10.00, 21),
('Recorrido por el Mercado de San Miguel', 'Degustación de productos gourmet en un mercado histórico', '2024-03-24', '01:30:00', 20.00, 21);

-- Actividades en Barcelona
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Sagrada Familia', 'Exploración de la famosa basílica de Gaudí', '2024-03-17', '02:00:00', 30.00, 22),
('Paseo por Las Ramblas', 'Recorrido por la famosa calle llena de vida y actividad', '2024-03-18', '01:30:00', 15.00, 22),
('Visita al Parque Güell', 'Exploración del parque con impresionantes vistas de la ciudad', '2024-03-19', '02:30:00', 25.00, 22);

-- Actividades en Sevilla
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Catedral de Sevilla', 'Exploración de la impresionante catedral gótica', '2024-03-19', '02:00:00', 20.00, 23),
('Recorrido por el Barrio de Santa Cruz', 'Exploración del laberinto de estrechas calles', '2024-03-20', '02:30:00', 25.00, 23),
('Espectáculo de Flamenco en La Carbonería', 'Disfrute de una auténtica experiencia de flamenco', '2024-03-21', '02:00:00', 35.00, 23);

-- Actividades en Valencia
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Ciudad de las Artes y las Ciencias', 'Exploración del complejo arquitectónico', '2024-03-21', '03:00:00', 25.00, 24),
('Paseo por el Jardín del Turia', 'Recorrido por el parque urbano en el antiguo cauce del río', '2024-03-22', '02:00:00', 20.00, 24),
('Cena en un restaurante de paella', 'Disfrute de la especialidad culinaria valenciana', '2024-03-23', '02:00:00', 30.00, 24);

-- CANADA
-- Actividades en Toronto
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita a la Torre CN', 'Exploración de la torre más alta de Toronto', '2024-03-15', '02:00:00', 25.00, 36),
('Recorrido por el Barrio Distillery', 'Exploración del barrio histórico y sus galerías de arte', '2024-03-16', '03:00:00', 20.00, 36),
('Cena en la CN Tower', 'Disfrute de una cena panorámica en la torre más alta de Toronto', '2024-03-17', '02:00:00', 50.00, 36),
('Paseo por el Parque High Park', 'Disfrute de un paseo por el parque más grande de Toronto', '2024-03-18', '02:30:00', 15.00, 36),
('Visita al Royal Ontario Museum', 'Exploración del museo de historia natural y cultura mundial', '2024-03-19', '04:00:00', 30.00, 36),
('Recorrido en bicicleta por el Waterfront Trail', 'Exploración de la costa del lago Ontario en bicicleta', '2024-03-20', '03:00:00', 20.00, 36),
('Visita a la Casa Loma', 'Exploración del castillo gótico revival', '2024-03-21', '02:30:00', 25.00, 36),
('Cata de vinos en el distrito de Niagara-on-the-Lake', 'Degustación de vinos en una de las regiones vitivinícolas más importantes de Canadá', '2024-03-22', '02:00:00', 40.00, 36),
('Tour en barco por las Cataratas del Niágara', 'Navegación por las impresionantes cataratas', '2024-03-23', '01:30:00', 35.00, 36),
('Visita a la Galería de Arte de Ontario', 'Exploración de la extensa colección de arte canadiense', '2024-03-24', '02:00:00', 20.00, 36);

-- Actividades en Montreal
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Viejo Montreal', 'Exploración del barrio histórico con calles adoquinadas', '2024-04-10', '02:00:00', 20.00, 37),
('Recorrido por el Parque Mont-Royal', 'Disfrute de las vistas panorámicas de la ciudad desde el monte', '2024-04-11', '03:00:00', 15.00, 37),
('Cena en un restaurante típico de poutine', 'Degustación del plato tradicional de Quebec', '2024-04-12', '02:30:00', 25.00, 37),
('Visita al Museo de Bellas Artes de Montreal', 'Exploración de la colección de arte europeo y contemporáneo', '2024-04-13', '02:30:00', 20.00, 37);

-- Actividades en Vancouver
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Parque Stanley', 'Exploración del parque urbano más grande de Canadá', '2024-05-05', '02:00:00', 20.00, 38),
('Recorrido por el Barrio de Gastown', 'Exploración del barrio histórico con calles adoquinadas', '2024-05-06', '03:00:00', 15.00, 38),
('Paseo en bicicleta por el Puente Lions Gate', 'Recorrido en bicicleta por el icónico puente', '2024-05-07', '02:30:00', 25.00, 38),
('Visita a Granville Island', 'Exploración de la isla con su mercado público y galerías de arte', '2024-05-08', '02:30:00', 20.00, 38);

-- Actividades en Quebec
INSERT INTO Actividades (nombre_actividad, descripcion, fecha, duracion, Precio, id_destino) VALUES
('Visita al Viejo Quebec', 'Exploración del barrio histórico con calles empedradas', '2024-06-10', '02:00:00', 20.00, 39),
('Recorrido por las murallas de la ciudad', 'Exploración de las fortificaciones históricas', '2024-06-11', '03:00:00', 15.00, 39),
('Cena en un restaurante con vistas al río San Lorenzo', 'Disfrute de la gastronomía local con vistas panorámicas', '2024-06-12', '02:30:00', 25.00, 39),
('Visita a la Plaza de Armas', 'Exploración de la plaza principal con su estatua de Samuel de Champlain', '2024-06-13', '02:30:00', 20.00, 39);



-- drop database travelplanificator;