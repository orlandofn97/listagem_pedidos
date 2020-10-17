import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Listagem Pedidos";

    List cardapios = const [
      const Cardapio(
          title: 'Pizza de Portuguesa',
          price: 'R\$40.00',
          description:
              'Cebola, Molho de Tomate, Mussarela, Orégano, Ovos, Pimentão, Presunto.',
          imglink:
              'https://s2.glbimg.com/DmTSD_XkA7mkwdBX2smQlO5nUHw=/0x0:400x268/984x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/06/13/15/30/58/110/ppp.jpg'),
      const Cardapio(
          title: 'Hamburguer com Fritas',
          price: 'R\$35.00',
          description:
              '180g, cheddar, cebola caramelizada, bacon e maionese no pão australiano.',
          imglink:
              'https://cdn.jornaldebrasilia.com.br/wp-content/uploads/2020/05/BierFass-Lago-hamb%C3%BArguer-de-Picanha-cr%C3%A9dito-Inove-Aceleradora-2048x1365.jpg'),
      const Cardapio(
          title: 'Esfirra de Carne',
          price: 'R\$01,50',
          description: 'Carne, cebola, tomate e pimentão.',
          imglink:
              'https://img.itdg.com.br/tdg/images/recipes/000/194/267/288427/288427_original.jpg?mode=crop&width=710&height=400'),
      const Cardapio(
          title: 'Milkshake de Morango',
          price: 'R\$09,99',
          description: 'Morango 400 ml.',
          imglink:
              'https://i.pinimg.com/originals/f5/46/88/f54688bb6671418cec45869c18a8a87f.jpg'),
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: List.generate(cardapios.length, (index) {
                  return Center(
                    child: CardapioCard(
                        cardapio: cardapios[index], item: cardapios[index]),
                  );
                }))));
  }
}

class Cardapio {
  final String title;
  final String price;
  final String description;
  final String imglink;

  const Cardapio({this.title, this.price, this.description, this.imglink});
}

class CardapioCard extends StatelessWidget {
  const CardapioCard(
      {Key key,
      this.cardapio,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Cardapio cardapio;

  final VoidCallback onTap;

  final Cardapio item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        color: Colors.white,
        child: Column(
          children: [
            new Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(cardapio.imglink)),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardapio.title,
                      style: Theme.of(context).textTheme.title),
                  Text(cardapio.price, style: TextStyle(color: Colors.black)),
                  Text(cardapio.description),
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
