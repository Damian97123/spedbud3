<?php
    $title = "Witaj w aplikacji Spedbud";
    require_once('session-control.php');
    require_once('header.php');
    require_once('db_connect.php');
?>
<!-- Begin Page Content -->
<div class="container-fluid">

  <div class="row">

    <!-- Area Chart -->
    <div class="col-xl-12 col-lg-12">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-center">
          <h4 class="m-0 font-weight-bold text-primary"><?php if(isset($title)) echo $title; ?></h4>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-area d-flex flex-column justify-content-center" style="height: auto;">     
              <p class="text-center">
                  Aplikacja przeznaczona do wspierania zarządzania firma budowlaną <br/> 
                  
              </p>
              <div class="align-self-center" style="background-image: url('images/landing-img.svg'); width: 450px; height: 300px; background-position: center; background-color: transparent; background-repeat: no-repeat; background-size: auto 300px;"></div>
          </div>
        </div>
      </div>
    </div>
  
  </div>

</div>
<!-- /.container-fluid --> 
<?php
  require_once('footer.php');
?>