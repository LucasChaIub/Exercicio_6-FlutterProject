class Client {
  final int cod;
  final String nome;
  final String email;
  final String? cpf;
  final String? sexo;
  final String? telefone;

  const Client({
    required this.cod,
    required this.nome,
    required this.email,
    this.cpf,
    this.sexo,
    this.telefone,
  });
}
