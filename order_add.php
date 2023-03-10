<?php
    $title = "Dodaj zlecenie";
    $query_result = "none";
    require_once('session-control.php');
    require_once('header.php');
    require_once('db_connect.php');
    if(isset($_POST['adr']) && isset($_POST['des']) && isset($_POST['cat']) && isset($_POST['dri'])){
      $today = date("Y-m-d");
      $query = $db -> prepare('INSERT INTO zlecenia (adres, kategoria_id, opis, pracownicy_id, data, realizacja, datakoncowa) VALUES (?,?,?,?,?,?,?)');
      $state = $query -> execute([$_POST['adr'], $_POST['cat'], $_POST['des'], $_POST['dri'], $today, '0']);
      if($state > 0){
        $query_result = "true";
      }
      else{
        $query_result = "false";
      }
    }
    if(isset($_SESSION['user-permissions'])){
?>
<!-- Begin Page Content -->
<div class="container-fluid">

  <div class="row">

    <!-- Area Chart -->
    <div class="col-xl-12 col-lg-12">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h4 class="m-0 font-weight-bold text-primary"><?php if(isset($title)) echo $title; ?></h4>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-area" style="height: auto;">
            <form action="order_add.php" method="POST">
              <div class="form-group">
                <input type="text" class="form-control form-control-user" name="adr" placeholder="Adres" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control form-control-user" name="des" placeholder="Opis zlecenia" required>
              </div>
              <div class="form-group">
                <select class="form-control form-control-user" name="cat" required>
                <?php
                  $query = $db -> prepare('SELECT * FROM kategorie');
                  $query -> execute();
                  foreach($query as $row){
                      echo "<option value=", $row['id_kategorii'] ,">", $row['nazwa'], "</option>";
                  }
                ?>
                </select>
              </div>
              <div class="form-group">
                <select class="form-control form-control-user" name="dri" required>
                <?php
                  $query = $db -> prepare('SELECT * FROM pracownicy');
                  $query -> execute();
                  foreach($query as $row){
                      echo "<option value=", $row['id_pracownicy'] ,">", $row['imie'], " ", $row['nazwisko'], " ", $row["numer telefonu"], " ", "</option>";
                  }
                ?>
                </select>
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary btn-user btn-block" value="Dodaj zlecenie do bazy" >
              </div>
            </form>
            <?php
              if($query_result === "true"){
            ?>
            <div class="alert alert-primary" role="alert">
              Dodano zlecenie. Przejdź do zakładki 
              <a class="link" href="index.php">
                <span>Aktywne zlecenia</span>
              </a>
            </div>
            <?php
              } else if ($query_result === "false") {
            ?>
            <div class="alert alert-danger" role="alert">
              Dodanie zlecenia nie powiodło się. Przejdź do zakładki 
              <a class="link" href="index.php">
                <span>Aktywne zlecenia</span>
              </a>
            </div>
            <?php
              } 
            ?>
          </div>
        </div>
      </div>
    </div>
  
  </div>

</div>
<!-- /.container-fluid --> 
<?php
  }
  else{
    header("Location: welcome.php");
  }
  require_once('footer.php');
?>