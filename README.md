# kabum-ios

- O app foi totalmente desenvolvido com auto layout, adaptado para todos os tamanhos de telas, inclusive iPad.
- A fonte dos textos não foi especificada no projeto, portanto utilizei a fonte padrão do sistema. O ideal seria ser fornecido pelo designer.
- As cores a serem utilizadas não foram especificadas, tentei me aproximar o máximo possível das utilizadas na screenshot. O ideal seria ser fornecido pelo designer.
- A busca poderia ter sido implementada por um BarButtonItem na NavigationBar (semelhante ao Android) ou utilizando uma UISearchController na TableView.

- A estrutura do layout do app ficou da seguinte forma:
TabBarController -> NavigationController -> TableViewController (pode ser observado no arquivo Main.storyboard)

- As Third-party APIs utilizadas foram:
Cosmos (Estrelas de rating utilizadas no layout)
Kingfisher (Download assíncrono e cache de imagens para utilizar em ImageViews)
Alamofire (Requests HTTP com tratamento de JSON integrado)
SwiftyJSON (Auxiliar no manuseio dos objetos JSON)
MXParallaxHeader (Adiciona o efeito Parallax no header da TableView)

- A estrutura utilizada no projeto foi a MVC (Model-View-Controller). O Model é responsável por estruturar os dados e administrar o comportamento desses dados. A View é responsável por exibir o layout, utilizando os dados dos Models. O Controller é responsável por receber os inputs do usuário e controlar as modificações tanto nos Models quanto nas Views.

- Models criados:
Banner - Fabricante - Oferta - Produto (Todos adaptados para receberem a string JSON e serem criados automaticamente)