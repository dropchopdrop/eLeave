<!DOCTYPE html>

<html>
<head>
<style>
p {text-align:center;}

</style>
<script>
function validateForm() {
if (document.loginForm.username.value == "") {
     document.getElementById('usernameErrors').innerHTML="Username should not be null";
     return false;
}
if (document.loginForm.username.length > 11) {
     document.getElementById('usernameErrors').innerHTML="Incorrect username";
     return false;
}

if (document.loginForm.password.value == "") {
     document.getElementById('passwordErrors').innerHTML="Password should not be null";
     return false;
}
if (document.loginForm.password.length > 11) {
     document.getElementById('usernameErrors').innerHTML="Incorrect username";
     return false;
}

}
</script>
</head>
<body>


<p>Welcome to LMS</p>

<form name="loginForm" method="post" action="login.php" onsubmit="return validateForm();">
<table align="center">
<tr>
  <td>Username:</td>
  <td><input type="text" name="username"><td>
</tr>
<tr>
  <td><div id ="usernameErrors"/></td>
</tr>
<tr>
  <td>Password:</td>
  <td><input type="password" name="password"></td>
</tr>
<tr>
  <td><div id ="passwordErrors"/></td>
</tr>
</table>
<p><input type="submit" name="button" value="Login" /></p>
</form>

</body>
</html>
