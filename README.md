# kabum-ios

- O app foi totalmente desenvolvido com auto layout, adaptado para todos os tamanhos de telas, inclusive iPad.
- A fonte dos textos não foi especificada no projeto, portanto utilizei a fonte padrão do sistema. O ideal seria ser fornecido pelo designer.
- As cores utilizadas nos wireframes não foram especificadas, tentei me aproximar o máximo possível das utilizadas na screenshot. O ideal seria ser fornecido pelo designer.
- A busca poderia ter sido implementada por um BarButtonItem na NavigationBar (semelhante ao Android) ou utilizando uma UISearchController na TableView.

- A estrutura do app ficou da seguinte forma:
TabBarController -> NavigationController -> TableViewController (pode ser observado no arquivo Main.storyboard)

- Models criados:
Banner - Fabricante - Oferta - Produto (Todos adaptados para receberem a string JSON e serem criados automaticamente)
