class Usuario{
  String _nome = "";
  String _email = "";
  String _senha = "";

  Usuario(this._nome, this._email, this._senha);
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      json['nome'] as String,
      json['email'] as String,
      json['senha'] as String,
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

 String get nome => this._nome;

 set nome(String value) => this._nome = value;

  get email => this._email;

 set email( value) => this._email = value;

  get senha => this._senha;

 set senha( value) => this._senha = value;
}