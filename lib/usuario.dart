class Usuario{
  String _nome = "";
  String _email = "";
  String _senha = "";

  Usuario( this._email, this._senha,this._nome);
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      
      json['email'] as String,
      json['senha'] as String,
      json['nome'] as String,
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
     
      'email': email,
      'senha': senha,
       'nome': nome,
    };
  }

 String get nome => this._nome;

 set nome(String value) => this._nome = value;

  get email => this._email;

 set email( value) => this._email = value;

  get senha => this._senha;

 set senha( value) => this._senha = value;
}