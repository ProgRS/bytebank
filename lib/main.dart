import 'package:flutter/material.dart';

void main() => runApp( BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
    body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget{

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
      @override
      Widget build(BuildContext context){
         return
           Scaffold(
               appBar: AppBar(title: Text('Criando Tranferencia'),
               ),
               body: Column(
                 children: <Widget>[
                  Editor(
                      controlador: _controladorCampoNumeroConta,
                      dica: '000',
                      rotulo: 'Numero da conta',
                      icone: Icons.monetization_on
                  ),
                  Editor(dica: '0.00',
                    controlador: _controladorCampoValor ,
                     rotulo: 'Valor',
                     icone: Icons.monetization_on ),
                RaisedButton(
                    child: Text('Comfirmar'),
                    onPressed: (){
                      _criaTransferencia();
                    }
                    )
                 ],
               ));
      }

      void _criaTransferencia() {
         final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
        final double? valor =  double.tryParse(_controladorCampoValor.text);
        if(numeroConta != null && valor != null) {
        final transferenciaCriada =  Transferencia(valor, numeroConta);
         debugPrint('$transferenciaCriada');
        }
      }

}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  const Editor({Key? key, required this.controlador, required this.rotulo, required this.dica, required this.icone}) : super(key: key);

  //const Editor({required this.controlador,  required this.rotulo, required this.dica, required this.icone});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
            icon: icone != null ?  Icon(icone) : null,
            labelText: rotulo,
            hintText: dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}



class ListaTransferencias extends StatelessWidget{

  @override
  Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('Tranferencias'),),

       body: Column(
       children: <Widget>[
         ItemTransferencia(Transferencia(100.00, 1000)),
         ItemTransferencia(Transferencia(200.00, 2000)),
         ItemTransferencia(Transferencia(300.00, 3000)),
         ItemTransferencia(Transferencia(400.00, 4000)),

       ],

        ),
         floatingActionButton: FloatingActionButton(
           onPressed: () {  },
           child: Icon(Icons.add),

         ),
     );
  }
}

class ItemTransferencia extends StatelessWidget{
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return  Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numeroConta.toString()),
          ),
        ) ;
  }
     
}

class Transferencia{
     final double valor;
     final int numeroConta;

     Transferencia(this.valor, this.numeroConta);

     @override
    String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}