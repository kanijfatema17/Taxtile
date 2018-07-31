<?php
      
	  if(isset($_POST["btnDelete"])){
		  $product_id=$_POST["txtId"];
		  
		  $db->query("delete from item where id='$product_id'");
		  echo "Deleted";
		  
	   }
	   
   $con_table=$db->query("select i.id, i.barcode,i.name,t.name,u.name,c.name,i.manufacturer,i.description from item i,item_category c,item_type t,item_uom u where c.id=i.category_id and t.id=i.type_id and u.id=i.uom_id");
   
   echo "<table class='table'>";
   echo "<tr><th>Id</th><th>Barcode</th><th>Name</th><th>Type</th><th>UoM</th><th>Category</th><th>Manufacturer</th><th>Description</th><th>&nbsp;</th></tr>";
   
 while(list($id,$barcode,$item_name,$type,$uom,$category,$mfg,$desc)=$con_table->fetch_row()){
	   
	   //$added_on=date("d M Y h:i A",strtotime($added_on));
	   
	   
	 echo "<tr><td>$id</td><td>$barcode</td><td>$item_name</td><td>$type</td><td>$uom</td><td>$category</td><td>$mfg</td><td>$desc</td><td><form action='home.php?page=10' method='post' style='display:inline'>
<input type='hidden' name='txtId' value='$id' />
<input type='submit' name='btnEdit' class='material-icons red600' value='edit'>
</form><form action='home.php?page=8' method='post' style='display:inline' onsubmit='return confirm(\"Are you sure?\")'><input type='hidden' name='txtId' value='$id' /><input type='submit' name='btnDelete' class='material-icons red600' value='delete'></form></td></tr>";  
   }
   
   echo "</table>";
   
?>