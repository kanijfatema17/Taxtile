<?php
      
	 
	   
   $con_table=$db->query("select i.id, i.barcode,i.name,t.name,u.name,c.name,i.manufacturer,i.description from item i,item_category c,item_type t,item_uom u where c.id=i.category_id and t.id=i.type_id and u.id=i.uom_id");
   
   echo "<table class='table'>";
   echo "<tr><th>Id</th><th>Barcode</th><th>Name</th><th>Type</th><th>UoM</th><th>Category</th><th>Manufacturer</th><th>Description</th></tr>";
   
   while(list($id,$barcode,$item_name,$type,$uom,$category,$mfg,$desc)=$con_table->fetch_row()){
	   
	   //$added_on=date("d M Y h:i A",strtotime($added_on));
	   
	   
	 echo "<tr><td>$id</td><td>$barcode</td><td>$item_name</td><td>$type</td><td>$uom</td><td>$category</td><td>$mfg</td><td>$desc</td></tr>";  
   }
   
   echo "</table>";
   
?>