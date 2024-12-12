<?php





 @include("connexion.php");



 $a=$_POST["Reference_livre"];

$b = $_POST["Nbre_pages"];

 $c=$_POST["ID_Auteur"];

 $d = $_POST["Date_publication"];

 $e = $_POST["Genre"];

 $f = $_POST["Disponibilite"];

 $g= $_POST["Nbre_emprunts"];

  $h=$_POST["Etat"];

 $i=$_POST["Nbre_exemplaire"];



 $req1 = "INSERT INTO livres (Reference_livre, Nbre_pages, ID_Auteur, Date_publication, Genre, Disponibilite, Nbre_emprunts, Etat, Nbre_exemplaire)

 VALUES  ('$a', '$b', '$c', '$d', '$e', '$f', '$g', '$h','$i')";



 if (mysqli_query($conn, $req1)) {

 echo '<center><p>Enregistrement effectue</p></center>';

 }
else {

 echo '<center><p>Erreur: mysqli_error($conn).</p></center>';

 }



 echo '<center><a href="index.html">Retour</a></center>';



 mysqli_close($conn);

 ?>

