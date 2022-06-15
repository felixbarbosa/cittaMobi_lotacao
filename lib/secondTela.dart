import 'dart:math';

import 'package:citta_mobi/onibus.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { nome, cnpj }

class SecondTela extends StatefulWidget {

  final int numeroGlobal;
  final int tempoGlobal;
  final String nomeGlobal;
  final bool acessivelGlobal;
  final bool climatizadoGlobal;
  final int idGlobal;
  final int lotacaoGlobal;

  const SecondTela(
    {
      Key? key, 
      required this.acessivelGlobal,
      required this.climatizadoGlobal,
      required this.idGlobal,
      required this.numeroGlobal,
      required this.tempoGlobal,
      required this.nomeGlobal,
      required this.lotacaoGlobal
    }
  ) : super(key: key);

  @override
  _SecondTelaState createState() => _SecondTelaState(
    acessivelLocal: acessivelGlobal,
    climatizadoLocal: climatizadoGlobal,
    idLocal: idGlobal,
    numeroLocal: numeroGlobal,
    tempoLocal: tempoGlobal,
    nomeLocal: nomeGlobal,
    lotacaoLocal: lotacaoGlobal
  );
}

bool termoMaiorTres = false;

class _SecondTelaState extends State<SecondTela> {

  final int numeroLocal;
  final int tempoLocal;
  final String nomeLocal;
  final bool acessivelLocal;
  final bool climatizadoLocal;
  final int idLocal;
  final int lotacaoLocal;

  _SecondTelaState(
    {
      required this.numeroLocal,
      required this.tempoLocal,
      required this.acessivelLocal,
      required this.climatizadoLocal,
      required this.idLocal,
      required this.nomeLocal, 
      required this.lotacaoLocal
    }
  );

  SingingCharacter? _character = SingingCharacter.nome;

  final _formKey = GlobalKey<FormState>();
  final termo = TextEditingController();

  String clienteQueryId = "";
  String pedidoId = "";
  String status = "";
  //String responsavelId = "Pegar id do usuario logado";
  double valorMetaQuery = 0.0;
  String abertura = "";
  String fechamento = "";
  String clienteNome = "";
  //String entidadeIdQuery = entidadeId; 

  bool loading = false;
  bool chegou = false;
  bool enviou = false;
  bool clienteSelecionado = false;
  String idSelecionado = "";
  bool isButtonDisable = false;
  int minutos = 0;
  int hora = 0;
  String horaFormatada = "";
  String minutosFormatado = "";
  String horaFormatadaProx = "";
  String minutosFormatadoProx = "";
  int tempoLocalVariado = 0;
  int numAleatorio = 0;
  int acessivelAleatorio = 0;
  int lotacaoAleatorio = 0;
  int notificar = 0;
  bool isCheckVazio = false;
  bool isCheckNormal = false;
  bool isCheckLotado = false;

  
  List pedido_por_clientes = [];
  List<Onibus> onibus = [];
  
  Random random = new Random();

  @override
  void initState() {
    super.initState();

    tempoLocalVariado = tempoLocal;

    hora = DateTime.now().hour;
    minutos = DateTime.now().minute;
    horaFormatada = hora.toString();
    minutosFormatado = minutos.toString();

    int count = 0;

    while(count < 5){

      tempoLocalVariado = tempoLocalVariado + 10;

      //numAleatorio = random.nextInt(7) + 4; // 5 -> 10
      //numAleatorio = random.nextInt(15 - 6 + 1) + 6; // 6 -> 15

      acessivelAleatorio = random.nextInt(2);

      lotacaoAleatorio = random.nextInt(3);

      numAleatorio = random.nextInt((idLocal + 150) - (idLocal - 150) + 1) + (idLocal - 150); // 2785 -> 3085

      onibus.add(
        Onibus(
          id: numAleatorio,
          acessivel: acessivelAleatorio == 1 ? true : false,
          climatizado: climatizadoLocal,
          tempo: tempoLocalVariado,
          lotacao: lotacaoAleatorio
        ),
      );

      count++;

    }

    

    if(tempoLocal > 1){

      if(minutos + tempoLocal > 59){

        hora++;

        minutos = (minutos + tempoLocal) - 60;

      }else{
        minutos = (minutos + tempoLocal);
      }

    }

    if(hora.toString().length == 1 && minutos.toString().length == 1){

      horaFormatada = "0" + hora.toString();
      minutosFormatado = "0" + minutos.toString();

    }else if(hora.toString().length == 1){

      horaFormatada = "0" + hora.toString();

    }else if(minutos.toString().length == 1){

      minutosFormatado = "0" + minutos.toString();

    }else{
      horaFormatada = hora.toString();
      minutosFormatado = minutos.toString();
    }

    setState(() {
      loading = true;
      termoMaiorTres = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/4.1,
                  ),
                  Text(
                    "$numeroLocal",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/3.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.more_vert_outlined
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.purple[900],
          centerTitle: false,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PRÓXIMO",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      acessivelLocal ?
                      Icon(
                        Icons.accessible,
                        color: Colors.black,
                      ) : Container(),
                      SizedBox(
                        width: 10,
                      ),
                      climatizadoLocal ?
                      Icon(
                        Icons.ac_unit,
                        color: Colors.black
                      ) : Container(width: 15),
                      Text(
                        lotacaoLocal == 1 ? "Vazio" : lotacaoLocal == 2 ? "Normal" : lotacaoLocal == 3 ? "Lotado" : "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: lotacaoLocal == 1 ? Colors.green : lotacaoLocal == 2 ? Colors.yellow[800] : lotacaoLocal == 3 ? Colors.red : Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/7,
                      ),
                      Icon(
                        Icons.wifi,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "$tempoLocal min",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      Container(
                        height: 22,
                        child: VerticalDivider(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "$horaFormatada:$minutosFormatado",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    topLeft: Radius.circular(6),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.directions_bus,
                            color: Colors.black,
                          ),
                          Text(
                            "Linha",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$numeroLocal",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            " ($idLocal)",
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          nomeLocal,
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      (tempoLocal == 1 && !chegou) ? 
                      RaisedButton(
                        
                        onPressed: (){

                          setState(() {
                            chegou = true;
                          });

                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Text(
                            "Esse ônibus chegou",

                          ),
                        ),
                        color: Colors.orange,
                      ) : (tempoLocal == 1 && chegou && !enviou) ? 
                      Center(
                        child: Text(
                          "Esse ônibus está:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                      : Container(),
                      tempoLocal == 1 ? 
                      SizedBox(
                        height: 10,
                      ) : Container(),
                      (tempoLocal == 1 && !chegou) ?
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.orange
                          )
                        ),
                        elevation: 0,
                        onPressed: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Text(
                            "Informar Atraso",
                            style: TextStyle(
                              color: Colors.orange
                            ),
                          ),
                        ),
                        color: Colors.white,
                      ) : (tempoLocal == 1 && chegou && !enviou) ? 
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  value: isCheckVazio, 
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckVazio = value!;
                                      if(isCheckVazio == true){
                                        isCheckNormal = false;
                                        isCheckLotado = false;
                                        notificar = 1;
                                      }else{
                                        notificar = 0;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Vazio',
                                style: TextStyle(
                                  color: Colors.black
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  value: isCheckNormal, 
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckNormal = value!;
                                      if(isCheckNormal == true){
                                        isCheckVazio = false;
                                        isCheckLotado = false;
                                        notificar = 1;
                                      }else{
                                        notificar = 0;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Normal',
                                style: TextStyle(
                                  color: Colors.black
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  value: isCheckLotado, 
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckLotado = value!;
                                      if(isCheckLotado == true){
                                        isCheckNormal = false;
                                        isCheckVazio = false;
                                        notificar = 1;
                                      }else{
                                        notificar = 0;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Lotado',
                                style: TextStyle(
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                          RaisedButton(
                            onPressed: (){

                              setState(() {
                                enviou = true;
                              });

                            },
                            child: Text(
                              "Enviar"
                            ),
                            color: Colors.orange,
                          )
                        ],
                      ) : (tempoLocal == 1 && chegou && enviou) ?
                      Center(
                        child: Text(
                          "Obrigado pelo feedback!",
                          style: TextStyle(
                            color: Colors.green
                          ),
                        ),
                      )
                      : Container()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6)
                  )
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.compass_calibration_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Programe sua viagem",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mudar ponto de origem",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12
                                        ),
                                      ),
                                      Text(
                                        "Casa",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Divider(
                                color: Colors.grey
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.gps_fixed_outlined,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Selecione o destino",
                                    style: TextStyle(
                                      color: Colors.amber
                                    )
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6)
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Próximos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  )
                ),
              ),
            ),
            widgetListaRolagem(),
            SizedBox(
              height: 2,
            ),
            ButtonTheme(
              child: Container(
                color: Colors.white,
                child: ButtonBar(
                  buttonMinWidth: 100,
                  alignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Icon(
                        Icons.map_outlined,
                        color: Colors.purple[900],
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: Icon(
                        Icons.gps_fixed_outlined,
                        color: Colors.grey,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(75, 0, 50, 0),
                      child: Icon(
                        Icons.list,
                        color: Colors.grey,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
          ),
        )
    );
  }

  widgetListaRolagem() {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {

                  hora = DateTime.now().hour;
                  minutos = DateTime.now().minute;
                  horaFormatada = hora.toString();
                  minutosFormatado = minutos.toString();

                  print("Hora inicial = $hora");
                  print("Minuto inicial = $minutos");
                  print("Tempo do onibus = ${onibus[index].tempo}");

                  if(onibus[index].tempo! > 1){

                    print("Tempo maior que 1");

                    if(minutos + onibus[index].tempo! > 59){

                      print("Maior ou igual a 60");

                      hora++;

                      horaFormatada = hora.toString();

                      print("Hora aumentada = $hora");

                      minutos = (minutos + onibus[index].tempo!) - 60;

                    }else{
                      print("Menor ou igual a 60");
                      minutos = (minutos + onibus[index].tempo!);
                    }

                  }

                  if(hora.toString().length == 1 && minutos.toString().length == 1){

                    horaFormatada = "0" + hora.toString();
                    minutosFormatado = "0" + minutos.toString();

                    print("Hora e minuto menores que 10");

                  }else if(hora.toString().length == 1){

                    horaFormatada = "0" + hora.toString();

                    print("Hora menor que 10");

                  }else if(minutos.toString().length == 1){

                    minutosFormatado = "0" + minutos.toString();

                    print("Minuto menor que 10");

                  }else{
                    horaFormatada = hora.toString();
                    minutosFormatado = minutos.toString();
                  }

                  print("Minutos = $minutos");

                  return ListTile(
                      title: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              MaterialButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {

                                },
                                child: Container(
                                    //height: 70,
                                    width: MediaQuery.of(context).size.width/1.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4.0),
                                        bottomRight: Radius.circular(4.0),
                                        topLeft: Radius.circular(4.0),
                                        bottomLeft: Radius.circular(4.0)
                                      )
                                    ),
                                    //padding: EdgeInsets.all(2.0),
                                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Flexible(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.directions_bus,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width:10
                                                      ),
                                                      Text(
                                                        "${onibus[index].id}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold
                                                        )
                                                      ),
                                                      SizedBox(
                                                        width:10
                                                      ),
                                                      onibus[index].acessivel! ?
                                                      Icon(
                                                        Icons.accessible,
                                                        color: Colors.black,
                                                      ) : Container(),
                                                      onibus[index].climatizado! ?
                                                      Icon(
                                                        Icons.ac_unit,
                                                        color: Colors.black
                                                      ) : Container(),
                                                      Text(
                                                        onibus[index].lotacao == 0 ? "Vazio" : onibus[index].lotacao == 1 ? "Normal" : onibus[index].lotacao == 2 ? "Lotado" : "-",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: onibus[index].lotacao == 0 ? Colors.green : onibus[index].lotacao == 1 ? Colors.yellow[800] : onibus[index].lotacao == 2 ? Colors.red : Colors.black,
                                                        ),

                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            Icon(
                                                              Icons.wifi,
                                                              size: 20,
                                                              color: Colors.lightBlue,
                                                            ),
                                                            SizedBox(
                                                              width:12
                                                            ),
                                                            Text(
                                                              "${onibus[index].tempo} min",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.bold
                                                              )
                                                            ),
                                                            Container(
                                                              height: 22,
                                                              child: VerticalDivider(
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            Text(
                                                              "$horaFormatada:$minutosFormatado",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 15
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Divider(
                                                    color: Colors.grey
                                                  )
                                                ],
                                              ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
                itemCount: onibus.length
            ),
          ),
        )
    );
  }
}

indicadorProgresso(){
  return Expanded(
      child: Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Container(
        child: Center(
          child: termoMaiorTres ? CircularProgressIndicator() : avisoMaisCaracter()
        )
      ),
    ),
  );
}

avisoMaisCaracter(){
  return Text(
    "Digite 3 ou mais caracteres",
    style: TextStyle(
      color: Colors.red
    ),
  );
}

 