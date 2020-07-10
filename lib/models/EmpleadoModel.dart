class EmpleadoModel {
    EmpleadoModel({
        this.id,
        this.nombre,
        this.apellidos,
        this.email,
        this.createAt,
    });

    int id;
    String nombre;
    String apellidos;
    String email;
    String createAt;

    factory EmpleadoModel.fromJson(Map<String, dynamic> json) => EmpleadoModel(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        createAt: json["createAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "createAt": createAt
    };

    




}
