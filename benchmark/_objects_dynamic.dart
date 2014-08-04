library ormicida.benchmarks._objects_dynamic;

final bookObj = {
  'id': 0,
  'title': 'An Awesome Book Title',
  'releaseDate': '2010-12-25',
  'author': {'id':0,'name':'Bro Coli'},
  'price': {'amount':45.67,'currency':'€'}
};
final bookList = [
  bookObj, bookObj, bookObj, bookObj, bookObj, bookObj, bookObj, bookObj,
  bookObj, bookObj, bookObj, bookObj, bookObj, bookObj, bookObj, bookObj
];
final userObj = {
  'id': 0,
  'age': 33,
  'birthday': '1980-12-12',
  'name': 'Jonathan Wakeontime',
  'email': 'jonathan.wakeontime@someserver.com',
  'address':{'street':'Aqui 56, Ali','code':'2967-012','city':'Acolá','country':'PT'},
  'books': bookList
};
final userList = [
  userObj, userObj, userObj, userObj, userObj, userObj, userObj, userObj,
  userObj, userObj, userObj, userObj, userObj, userObj, userObj, userObj
];
final shortObj = {
  'success': true,
  'result': 45,
  'error': null
};
final mediumObj =  {
  'success': 1,
  'result': [bookObj, bookObj, bookObj, bookObj, bookObj],
  'error': {
    'code': 'http.bind.unexpectedClose',
    'argument': 'OS Error: some freaking error message'
  }
};
final longObj =  {
  'success': 1,
  'result': userList,
  'error': {
    'code': 'http.bind.unexpectedClose',
    'argument': 'OS Error: some freaking error message'
  }
};
