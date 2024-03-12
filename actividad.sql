--NoSQL

-- Mostrar Todas las Bases de Datos
show dbs;

-- Mostrar Todos los Usuarios
db.users.find();

-- Nombres, Apellidos y Edad de 20 años
db.users.find({ edad: 20 }, { nombres: 1, apellidos: 1, edad: 1 });

-- Nombres, Apellidos, Edad y Género de Hombres entre 20 y 30 Años
db.users.find({ genero: 'M', edad: { $gte: 20, $lte: 30 } }, { nombres: 1, apellidos: 1, edad: 1, genero: 1 });

-- Usuario Más Joven
db.users.find().sort({ edad: 1 }).limit(1);

-- Primeros 5 Usuarios Ordenados por ID
db.users.find({}, { nombres: 1, apellidos: 1, edad: 1, genero: 1 }).sort({ id: 1 }).limit(5);

-- Últimos 10 Usuarios Ordenados por ID Descendente
db.users.find({}, { nombres: 1, apellidos: 1, edad: 1, genero: 1 }).sort({ id: -1 }).limit(10);

-- Contar el Número Total de Usuarios
db.users.count();

-- Nombres, Apellidos y Correo de Usuarios con Correo que Termina en '.net'
db.users.find({ correo: /\.net$/ }, { nombres: 1, apellidos: 1, correo: 1 });

-- Nombres, Apellidos y País de Usuarios que No Son de Colombia
db.users.find({ pais: { $ne: 'Colombia' } }, { nombres: 1, apellidos: 1, pais: 1 });

-- Nombres, Apellidos y País de Usuarios que No Son de Ecuador o Panamá
db.users.find({ pais: { $nin: ['Ecuador', 'Panamá'] } }, { nombres: 1, apellidos: 1, pais: 1 });

-- Contar Usuarios de Colombia a los que Les Gusta el Rock
db.users.count({ pais: 'Colombia', musica: 'rock' });

-- Actualizar Género Musical de 'Metal' a 'Carranga'
db.users.updateMany({ musica: 'metal' }, { $set: { musica: 'carranga' } });

-- Usuarios Hombres de Colombia a los que Les Gusta la 'Carranga' y Tienen entre 10 y 20 Años
db.users.find({ musica: 'carranga', genero: 'H', pais: 'Colombia', edad: { $gte: 10, $lte: 20 } });

-- Actualizar Género Musical a 'Carranga' para Usuarios de 99 Años
db.users.updateMany({ edad: 99 }, { $set: { musica: 'carranga' } });

-- Nombres de Usuarios que Inician con 'A'
db.users.find({ nombres: /^A/ }, { nombres: 1 });

-- Apellidos de Usuarios que Terminan con 'Z'
db.users.find({ apellidos: /Z$/ }, { apellidos: 1 });

-- Actualizar Género Musical a NULL para Usuarios de 50 Años
db.users.updateMany({ edad: 50 }, { $set: { musica: null } });

-- Usuarios con Género Musical NULL
db.users.find({ musica: null });

-- Suma de Edades de Todos los Usuarios
db.users.aggregate([{ $group: { _id: null, totalEdades: { $sum: '$edad' } } }]);

-- Contar Usuarios de Ecuador
db.users.count({ pais: 'Ecuador' });

-- Contar Usuarios de Colombia a los que Les Gusta el Vallenato
db.users.count({ pais: 'Colombia', musica: 'vallenato' });