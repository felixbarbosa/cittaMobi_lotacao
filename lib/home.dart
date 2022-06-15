import 'package:citta_mobi/onibus.dart';
import 'package:citta_mobi/secondTela.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { nome, cnpj }

class Home extends StatefulWidget {


  const Home(
    {
      Key? key, 
    }
  ) : super(key: key);

  @override
  _HomeState createState() => _HomeState(
  );
}

bool termoMaiorTres = false;

class _HomeState extends State<Home> {


  _HomeState(
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
  bool clienteSelecionado = false;
  String idSelecionado = "";
  bool isButtonDisable = false;
  int minutos = 0;
  int hora = 0;
  String horaFormatada = "";
  String minutosFormatado = "";
  String horaFormatadaProx = "";
  String minutosFormatadoProx = "";

  
  List pedido_por_clientes = [];
  List<Onibus> onibus = [];
  

  @override
  void initState() {
    super.initState();

    onibus.add(
      Onibus(
        id: 2935,
        numero: 2920,
        acessivel: true,
        climatizado: true,
        nome: "Rio Doce / CDU",
        tempo: 5,
        lotacao: 3
      ),
    );
    onibus.add(
      Onibus(
        id: 935,
        numero: 910,
        acessivel: true,
        climatizado: false,
        nome: "Piedade / T.I Rio Doce (Catamarã) Shopping RioMar",
        tempo: 20,
        lotacao: 3
      ),
    );
    onibus.add(
      Onibus(
        id: 1980,
        numero: 1987,
        acessivel: true,
        climatizado: false,
        nome: "T.I Rio Doce / Príncipe",
        tempo: 7,
        lotacao: 1
      ),
    );
    onibus.add(
      Onibus(
        id: 1980,
        numero: 1981,
        acessivel: true,
        climatizado: false,
        nome: "T.I Rio Doce / Cde da Boa Vista",
        tempo: 1,
        lotacao: 2
      ),
    );

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
    //50, 75, 80
    print(MediaQuery.of(context).size.width/7.8);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
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
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.purple[900],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a 424m",
                      style: TextStyle(
                        fontSize:12
                      )
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Casa",
                      style: TextStyle(
                        fontSize:17,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 20),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value) {
                        setState(() {
                          print("Pressionou");
                          if(termo.text.length >= 3){
                            loading = true;
                            termoMaiorTres = true;
                            clienteSelecionado = false;
                            FocusScope.of(context).requestFocus(new FocusNode());
                            //indicadorProgresso();
                          }else{
                            loading = true;
                            termoMaiorTres = false;
                          }
                          
                        });
                      },
                      controller: termo,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Encontre sua linha',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                print("Pressionou");
                                if(termo.text.length >= 3){
                                  loading = true;
                                  termoMaiorTres = true;
                                  clienteSelecionado = false;
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  //indicadorProgresso();
                                }else{
                                  loading = true;
                                  termoMaiorTres = false;
                                }
                                
                              });
                              
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: Colors.orange
                      )
                    ),
                    elevation: 1,
                    color: Colors.grey[200],
                    textColor: Colors.white,
                    height: 50,
                    onPressed: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Reportar Atraso",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.orange
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                child: Text(
                  "Favoritos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
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
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/7.9, 0, 0, 0),
                      child: Icon(
                        Icons.map_outlined,
                        color: Colors.purple[900],
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/5, 0, 0, 0),
                      child: Icon(
                        Icons.gps_fixed_outlined,
                        color: Colors.grey,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/5.3, 0, MediaQuery.of(context).size.width/7.8, 0),
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
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  hora = DateTime.now().hour;
                  minutos = DateTime.now().minute;

                  if(onibus[index].tempo! > 1){

                    if(minutos + onibus[index].tempo! > 59){

                      hora++;

                      minutos = (minutos + onibus[index].tempo!) - 60;

                    }else{
                      minutos = (minutos + onibus[index].tempo!);
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

                  if(minutos + 10 > 59){

                    hora++;

                    minutos = (minutos + 10) - 60;

                  }else{
                    minutos = (minutos + 10);
                  }

                  return ListTile(
                      title: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              MaterialButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SecondTela(
                                        acessivelGlobal: onibus[index].acessivel!,
                                        climatizadoGlobal: onibus[index].climatizado!,
                                        idGlobal: onibus[index].id!,
                                        numeroGlobal: onibus[index].numero!,
                                        tempoGlobal: onibus[index].tempo!,
                                        nomeGlobal: onibus[index].nome!,
                                        lotacaoGlobal: onibus[index].lotacao!,
                                      ),
                                    ),
                                  );

                                },
                                child: Container(
                                    //height: 70,
                                    width: MediaQuery.of(context).size.width/1.127,
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
                                                        Icons.star,
                                                        color: Colors.yellow
                                                      ),
                                                      SizedBox(
                                                        width:10
                                                      ),
                                                      Icon(
                                                        Icons.directions_bus,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width:10
                                                      ),
                                                      Text(
                                                        "${onibus[index].numero}",
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
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              onibus[index].lotacao == 1 ? "VAZIO" : onibus[index].lotacao == 2 ? "NORMAL" : onibus[index].lotacao == 3 ? "LOTADO" : "-",
                                                              style: TextStyle(
                                                                color: onibus[index].lotacao == 1 ? Colors.lightGreenAccent[700] : onibus[index].lotacao == 2 ? Colors.yellow : onibus[index].lotacao == 3 ? Colors.red : Colors.black,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Icon(
                                                              Icons.wifi,
                                                              color: Colors.lightBlue,
                                                            ),
                                                            SizedBox(
                                                              width:12
                                                            ),
                                                            Text(
                                                              onibus[index].tempo == 1 ? "< ${onibus[index].tempo}" : "${onibus[index].tempo}",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold
                                                              )
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 35
                                                      ),
                                                      Text(
                                                        "${onibus[index].nome}",  
                                                        overflow: TextOverflow.fade,                          
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13.0,
                                                          fontWeight: FontWeight.normal
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 14,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 35
                                                      ),
                                                      Text(
                                                        "Próximos",                            
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15
                                                      ),
                                                      Icon(
                                                        Icons.wifi,
                                                        color: Colors.lightBlue
                                                      ),
                                                      Text(
                                                        "$horaFormatada:$minutosFormatado",                            
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15
                                                      ),
                                                      Icon(
                                                        Icons.wifi_off,
                                                        color: Colors.grey
                                                      ),
                                                      Text(
                                                        "$hora:$minutos",                            
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      )
                                                    ],
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

 