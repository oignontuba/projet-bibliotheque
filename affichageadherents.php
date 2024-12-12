<html>
    <body>
      <?php
        @include"connexion.php";
        $requete="select * from adherents";
        $resultat=mysqli_query($conn,$requete);
        ?>
        <center>
            <table border="1">
            <tr> <td>Reference_livre  </td> <td>Nbre_pages </td> <td>ID_Auteur </td> <td>Date_publication </td> <td>Genre </td> <td>Disponibilite </td> <td>Nbre_emprunts </td>  <td>Nbre_exemplaire </td></tr>
            <?php while ($enreg = mysqli_fetch_array($resultat))
            {?>

                <tr>
                <td><?php echo $enreg["ID_Adherent"];?></td>
                <td><?php echo $enreg["Nom"];?></td>
                <td><?php echo $enreg["Prenom"];?></td>
                <td><?php echo $enreg["Date_naissance"];?></td>
                <td><?php echo $enreg["Date_adhesion"];?></td>
                <td><?php echo $enreg["Adresse"];?></td>
                <td><?php echo $enreg["Num_tel"];?></td>
                <td><?php echo $enreg["mail"];?></td>
               
                
                </tr>
            <?php } ?>
             ?>
            </table>
        </center>
        <?php 
        mysqli_close($conn);
        ?>
        <a href="index.html">retour à accueil</a>
    </body>
</html>