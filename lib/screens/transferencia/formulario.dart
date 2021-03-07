import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import '../../components/editor.dart';

const _appBarTitle = 'Criando Transferência';
const _editorRotuloNConta = 'Número da conta';
const _editorDicaNConta = '1234';
const _editorRotuloValor = 'Valor';
const _editorDicaValor = '100.40';
const _textButtonConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                rotulo: _editorRotuloNConta,
                dica: _editorDicaNConta,
                controlador: _controladorNumeroConta),
            Editor(
                rotulo: _editorRotuloValor,
                dica: _editorDicaValor,
                controlador: _controladorValor,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_textButtonConfirmar),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && valor != null) {
      Navigator.pop(context, Transferencia(valor, numeroConta));
    }
  }
}
