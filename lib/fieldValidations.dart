class Validations {
  String _name;
  String _email;
  String _pass;

  Validations()
      : _name = "Invalid name",
        _email = "Invalid email",
        _pass = "Invalid password";

  String name(String name) {
    RegExp regex = new RegExp(r'[A-Z]{1,}[a-z]{2}');
    if (!regex.hasMatch(name) && name.isNotEmpty) {
      return _name;
    } else {
      return null;
    }
  }

  String email(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email) && email.isNotEmpty)
      return _email;
    else
      return null;
  }



  String pass(String pass) {
    RegExp regex = new RegExp(r'[A-Z]{1}[A-Za-z0-9]{7,}');
    if (!regex.hasMatch(pass) && pass.isNotEmpty)
      return _pass;
    else
      return null;
  }
}
