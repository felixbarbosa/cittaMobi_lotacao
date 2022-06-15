import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  const Login({Key? key,}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  
  String dia = "0";
  String mes = "0";
  String ano = "0";
  bool clicouEntrar = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[850],
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.grey[700]!,
              ],
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(
                0.0), //Padding de 20 para ficar normal , padding de 0 para ficar a barra toda dps do appbar
            child: ListView(
              key: _formKey,
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  width: 220,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 0), //espaco da logo
                  ),
                ),
                Text(
                  "Wisell Community",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Wisely Selling',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blue[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      labelText: 'E-mail',
                      contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      labelStyle: TextStyle(
                        color:  Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.white)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      labelText: 'Senha',
                      contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      labelStyle: TextStyle(
                        color:  Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.white)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                    ),
                    color: clicouEntrar ? Colors.grey : Colors.blue[400],
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 42,
                    onPressed: () {
                      if(!clicouEntrar){
                        setState(() {
                          clicouEntrar = true;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 16,
                ),
                widgetButtonInferior()
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[700],
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Text(
              'V1.2022.05.19',
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }

  widgetButtonInferior() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: FlatButton(
              onPressed: () {

              },
              child: Text(
                "Ativar conta WISELL",
                style: TextStyle(
                  fontSize: 18.0, 
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              )),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
          // padding: EdgeInsets.all(20.0),
          child: FlatButton(
              onPressed: () {
                
              },
              child: Text(
                "Esqueci a senha",
                style: TextStyle(fontSize: 15.0, color: Colors.blue),
              )),
        ),
      ],
    );
  }
}

