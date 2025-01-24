<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

  <div class="container-fluid">
    <a class="navbar-brand" href="../index.jsp">Expense Tracker </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item"><a class="nav-link active" href="../user/home.jsp">Home</a>
        </li>
      <li class="nav-item">
          <a class="nav-link active" href="addexp.jsp">Add Expense</a>
        </li>
         <li class="nav-item"><a class="nav-link active" href="viewexp.jsp">View Expense</a>
        </li>
      <li class="nav-item"><a class="nav-link active" href="budget.jsp">Budget</a>
        </li>
        
        
        
      </ul>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
      <li class="nav-item">
          <a class="nav-link active" href=""><i class="fa-solid fa-user"></i> ${LoginUser.name }</a>
        </li>
        
         <li class="nav-item"><a class="nav-link active"  href="../login.jsp">Sign out</a>
        </li>
        
        
      </ul>
      
      
        
      
    </div>
  </div>
</nav>