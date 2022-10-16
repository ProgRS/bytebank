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
               appBar: AppBar(title: Text('Criando Tranferencia'),),
               body: Column(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: TextField(
                       controller: _controladorCampoNumeroConta,
                       style: TextStyle(
                          fontSize: 24.0
                       ),
                       decoration: InputDecoration(
                          labelText: 'Número da conta',
                          hintText: '0000'
                       ),
                       keyboardType: TextInputType.number,
                     ),
                   ),Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: TextField(
                       controller: _controladorCampoValor,
                       style: TextStyle(
                          fontSize: 24.0
                       ),
                       decoration: InputDecoration(
                          icon: Icon(Icons.monetization_on),
                          labelText: 'Valor',
                          hintText: '0.00'
                       ),
                       keyboardType: TextInputType.number,
                     ),
                   ),
                ElevatedButton(
                    child: Text('Comfirmar'),
                    onPressed: (){
                      final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
                      final double? valor =  double.tryParse(_controladorCampoValor.text);
                      if(numeroConta != null && valor != null) {
                      final transferenciaCriada =  Transferencia(valor, numeroConta);
                       debugPrint('$transferenciaCriada');
                      }
                    }
                    )
                 ],
               ));
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