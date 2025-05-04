# 📋 Aplicativo de Gerenciamento de Tarefas

Este é um aplicativo simples em Flutter que demonstra uma lista de tarefas e navegação entre telas utilizando um `TabNavigator`. O aplicativo possui duas telas: uma tela inicial e uma tela de lista de tarefas onde o usuário pode marcar as tarefas como concluídas ou pendentes.

## ✨ Funcionalidades

- 🏠 **Tela Inicial**: Uma tela simples com uma mensagem de saudação.
- ✅ **Tela de Lista de Tarefas**: Lista de tarefas que podem ser marcadas como concluídas.
- 🔽 **Navegação Inferior**: Barra de navegação entre as duas telas.

## 🚀 Instalação

Para rodar este projeto, você precisa ter o Flutter instalado em sua máquina. Siga os passos abaixo para começar:

```bash
git clone <repository_url>
cd <project_directory>
flutter pub get
flutter run
```

> Substitua `<repository_url>` e `<project_directory>` pelos valores corretos.

## 🧠 Estrutura do Código

### 📁 main.dart

```dart
import 'package:flutter/material.dart';
import 'package:my_app/taskListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabNavigator(),
    );
  }
}

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomeScreen(),
    TaskListScreen()
  ];

  void _onTabSelected(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tela Inicial'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tarefas'
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Tela Inicial",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
```

### 📁 taskListScreen.dart

```dart
import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<String> tasks = [
    'Tarefa 1',
    'Tarefa 2',
    'Tarefa 3',
    'Tarefa 4'
  ];

  late List<bool> completed;

  @override
  void initState() {
    super.initState();
    completed = List.filled(tasks.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              completed[index] ? Icons.check_circle : Icons.radio_button_unchecked,
              color: completed[index] ? Colors.green : null,
            ),
            title: Text(tasks[index]),
            onTap: () {
              setState(() {
                completed[index] = !completed[index];
              });
            },
          );
        },
      ),
    );
  }
}
```

## 🤝 Contribuindo

Sinta-se à vontade para contribuir com melhorias ou sugestões. Basta:

1. Fazer um fork do projeto.
2. Criar uma branch para sua feature:
   ```bash
   git checkout -b minha-feature
   ```
3. Commitar suas mudanças:
   ```bash
   git commit -m 'Minha nova feature'
   ```
4. Fazer push para a branch:
   ```bash
   git push origin minha-feature
   ```
5. Abrir um Pull Request.

## 📄 Licença

Este projeto está sob a licença [MIT](https://opensource.org/licenses/MIT).
