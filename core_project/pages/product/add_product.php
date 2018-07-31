<?php

  if(isset($_POST["btnSubmit"])){
	  
	  $barcode=$_POST["txtBarcode"];
	  $name=$_POST["txtProductName"];	  
	  
	  $category_id=$_POST["cmbCategoryId"];
	  $type_id=$_POST["cmbType"];
	  $uom_id=$_POST["cmbUoM"];
	  
	  $mfg=$_POST["txtMfg"];
	  $desc=$_POST["txtDesc"];
	  
	  
	  $photo_tmp=$_FILES["file"]["tmp_name"];
	  $photo_name=$_FILES["file"]["name"];
	 
	  $photo_loc="../img/";
	  
	  $db->query("insert into item(barcode,name,type_id,uom_id,category_id,description,manufacturer,photo)values('$barcode','$name','$type_id','$uom_id','$category_id','$desc','$mfg','')");
	  
	  
	  if(!empty($photo_name)){
		  
	   copy($photo_tmp,$photo_loc.$db->insert_id.".jpg");	   
	  $db->query("update item set photo='$db->insert_id.jpg' where id='$db->insert_id'");
	  
	  
	  }
	  
	  
	  echo "Success";
	  
	  
	  
  }

?>
<form action="#" method="post" enctype="multipart/form-data">
 <div>Category<br/>
   <select name="cmbCategoryId">
     <?php
       $cate_table=$db->query("select id,name from item_category");
	   while(list($id,$name)=$cate_table->fetch_row()){
		   echo "<option value='$id'>$name</option>";
		}
	 
	 ?>
   </select>
 </div>
 <div>
 Type<br/>
   <select name="cmbType">
      <?php
       $type_table=$db->query("select id,name from item_type");
	   while(list($id,$name)=$type_table->fetch_row()){
		   echo "<option value='$id'>$name</option>";
		}
	 
	 ?>
   </select>
 </div>
 <div>
    Barcode<br/>
    <input type="text" name="txtBarcode" />
 </div>
 <div>
    Product Name<br/>
    <input type="text" name="txtProductName" />
 </div>
 
 
 <div>
 UoM<br/>
   <select name="cmbUoM">
      <?php
       $uom_table=$db->query("select id,name from item_uom");
	   while(list($id,$name)=$uom_table->fetch_row()){
		   echo "<option value='$id'>$name</option>";
		}
	 
	 ?>
   </select>
 </div>
 <div>
    Manufacturer<br/>
    <input type="text" name="txtMfg" />
 </div>
 
 <div>
    Description<br/>
    <textarea name="txtDesc"></textarea>
 </div>
 <div>
   Photo<br/>
   <input  type="file" name="file" />
 </div>
 <br/>
 <div>
 <input type="submit" name="btnSubmit" value="Submit" />
 </div>
 
</form>