<?php
    $title_1 = "Dodaj kategorię";
    $title_2 = "Usuń kategorię";
    $query_result = "none";
    require_once('session-control.php');
    require_once('header.php');
    require_once('db_connect.php');
    if(isset($_POST['category-name'])){
      $query = $db -> prepare('INSERT INTO kategorie (nazwa) VALUES (?)');
      $state = $query -> execute([$_POST['category-name']]);
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
          <h4 class="m-0 font-weight-bold text-primary"><?php if(isset($title_1)) echo $title_1; ?></h4>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-area" style="height: auto;">
            <form action="category_add.php" method="POST">
              <div class="form-group">
                <input type="text" class="form-control form-control-user" name="category-name" placeholder="Nazwa kategorii" required>
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary btn-user btn-block" value="Dodaj nową kategorię" >
              </div>
            </form>
            <?php
              if($query_result === "true"){
            ?>
            <div class="alert alert-primary" role="alert">
              Dodano kategorię.
            </div>
            <?php
              } else if ($query_result === "false") {
            ?>
            <div class="alert alert-danger" role="alert">
              Dodanie kategorii nie powiodło się.
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