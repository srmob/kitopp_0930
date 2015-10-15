(function(){
    
    var funcManageProduct = function($scope,$stateParams,$state,commonAppService,ManageProduct,ProductInfo,$ionicPopup,$cordovaCamera,$cordovaDevice, $cordovaFile, $ionicPlatform, $ionicActionSheet, ImageService,ApiEndpoint,$timeout,base64){
        $scope.productFlag = "0";
        $scope.product = {};
        $scope.editProduct = "";
        $scope.products = {};
        $scope.items=[];
        $scope.onlyNumbers = /^[1-9]+[0-9]*/;
        $scope.decimalNumbers = /^\d{0,9}(\.\d{1,9})?$/;
        $scope.subCatgCheckboxes={};
        $scope.imgURI="";
        $scope.cameraButtonClicked = false;
        
        $scope.userId = commonAppService.getloggedInUserId();
        $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
        
        $scope.urlForImage = function(imageName) {
            var trueOrigin = cordova.file.dataDirectory + imageName;
            return trueOrigin;
        }
        
        $scope.fetchMasterCategoryList = function(){
            ManageProduct.fetchMasterCategory().then(function(result){
                console.log("Master category in controller from DB is"+result);
                $scope.masterCategory = result;
                
                angular.forEach($scope.masterCategory,function(value,key){
                  /* console.log("key is "+key);
                   console.log("value is "+JSON.stringify(value));*/
                    angular.forEach(angular.fromJson(value.sub_category_list),function(val1,key1){
                        if(val1.exist){
                            console.log("subg cat id"+val1.sub_category_id)
                            //$scope.subCatgCheckboxes.push({sub_category_id:val1.sub_category_id});
                            $scope.subCatgCheckboxes.sub_category_id.push({
                                 sub_category_id: val1.sub_category_id
                            });
                            console.log("subg cat id in "+JSON.stringify($scope.subCatgCheckboxes));
                        }
                    });
                    
                });
            });
        }
        $scope.fetchMasterCategoryList();
        
         /*$scope.checkBoxCatgClicked = function(subCatgId,list){
             console.log(" sub catg clicked"+subCatgId+" list "+JSON.stringify(list));
             
             
         }*/
        $scope.getAllProductCategories = function() {
            ProductInfo.getAllProdCatg($scope.userId).then(function(products){
              $scope.productCatg = products;
            });
        }
        
        /*$scope.masterCategory= [{"category_id":401,"category_name":"electronics","sub_category_list":[{"sub_category_id":4011,"sub_category_name":"computers","exists":false},{"sub_category_id":4021,"sub_category_name":"home and kitchen",exists:true},{"sub_category_id":4031,"sub_category_name":"mobile phones",exists:false}]},{"category_id":404,"category_name":"toys","sub_category_list":[{"sub_category_id":4045,"sub_category_name":"puzzles"},{"sub_category_id":4047,"sub_category_name":"stuffed toys",exists:true},{"sub_category_id":4042,"sub_category_name":"art craft figure",exists:false},{"sub_category_id":4044,"sub_category_name":"learning toys",exists:false},{"sub_category_id":4046,"sub_category_name":"remote control toys",exists:false},{"sub_category_id":4041,"sub_category_name":"baby rattle",exists:false},{"sub_category_id":4048,"sub_category_name":"pogo toys"},{"sub_category_id":4043,"sub_category_name":"musical toys",exists:false},{"sub_category_id":4117,"sub_category_name":"baby rattle",exists:false},{"sub_category_id":4112,"sub_category_name":"action figure",exists:false},{"sub_category_id":4114,"sub_category_name":"toy sports",exists:true},{"sub_category_id":4116,"sub_category_name":"dolls n doll houses",exists:false},{"sub_category_id":4111,"sub_category_name":"stacking stuffed toys",exists:false},{"sub_category_id":4049,"sub_category_name":"magic kit",exists:false},{"sub_category_id":4113,"sub_category_name":"role play toys",exists:false},{"sub_category_id":4115,"sub_category_name":"electric ride ons",exists:true}]}];*/
        
        $scope.showsublist = function(idx) {
           $scope.masterCategory[idx].sublist = !$scope.masterCategory[idx].sublist;    
        };
        
        $scope.toggleGroup = function(group) {
            if ($scope.isGroupShown(group)) {
              $scope.shownGroup = null;
            } else {
              $scope.shownGroup = group;
            }
          };
          $scope.isGroupShown = function(group) {
            return $scope.shownGroup === group;
          };
        
        
        
        /*$scope.addMedia = function() {
            $scope.hideSheet = $ionicActionSheet.show({
              buttons: [
                { text: 'Take photo' },
                { text: 'Photo from library' }
              ],
              titleText: 'Add images',
              cancelText: 'Cancel',
              buttonClicked: function(index) {
                $scope.addImage(index);
              }
            });
        }*/
        $scope.addImage = function(type) {
            console.log(" type is "+type);
            //$scope.hideSheet();
            $timeout(function(){
                ImageService.handleMediaDialog(type).then(function(imageURL) {
                    $scope.imgURI = imageURL;
                    console.log("Imaeege uri in add is "+$scope.imgURI);
                    $scope.cameraButtonClicked = true;
                });
            });
        }
        
        $scope.addGeneric= function(){
            $scope.hideSheet = $ionicActionSheet.show({
              buttons: [
                { text: 'Add Product' },
                { text: 'Add Category' }
              ],
              titleText: 'Add',
              cancelText: 'Cancel',
              buttonClicked: function(index) {
                addChoose(index);
              }
            });
        };
        function addChoose(type) {
            console.log(" Add chosen is "+type);
            switch (type) {
              case 0:
                switchToAddProduct();
                break;
              case 1:
               switchToAddCategory();
                break;
            }
        }
        function switchToAddProduct() {
            console.log("add product called");
            $scope.hideSheet();
            $scope.productFlag="add";
            $state.go("app.seller.manageProduct.add");
            $scope.product = "";
        };
        function switchToAddCategory() {
            $scope.hideSheet();
            console.log("add category called");
            $state.go("app.seller.manageProduct.category");
        };
        
        $scope.addSubCatgToCatg = function(catgId,catgName) {
            console.log("Category ID "+catgId);
            $ionicPopup.prompt({
                title: 'Add a sub-category for - '+catgName,
                inputType: 'text'
            })
            .then(function(result) {
                if(result !== undefined) {
                    ManageProduct.addSubCatgToCatg(catgId,result).then(function(result){
                        console.log("entered value is ss "+JSON.stringify(result));
                        console.log("status in "+JSON.stringify(result.status));
                       if (result.status == 200) {
                            $scope.fetchMasterCategoryList();
                            $state.go("app.seller.manageProduct.category");
                        }else{
                            $scope.alertProductCategory_error();
                        }

                    });
                    
                } else {
                    console.log("Action not completed");
                }
            });
        };
       
        $scope.addCatgAndSubCatg = function() {
            $scope.data = {}
            $ionicPopup.show({
              templateUrl: 'templates/popup-category.html',
              title: 'Category and Sub-category',
              scope: $scope,
              buttons: [
                { text: 'Cancel', onTap: function(e) { return true; } },
                {
                  text: '<b>Save</b>',
                  type: 'button-calm',
                  onTap: function(e) {
                    return $scope.data;
                  }
                },
              ]
              }).then(function(res) {
                console.log('Tapped!', res);
                  ManageProduct.addCatgaAndSubCatg(res.catg,res.subCatg).then(function(result){
                        console.log("entered value is catg and subcatg "+JSON.stringify(result));
                        console.log("status in "+JSON.stringify(result.status));
                       if (result.status == 200) {
                            $scope.fetchMasterCategoryList();
                            $state.go("app.seller.manageProduct.category");
                        }else{
                            $scope.alertProductCategory_error();
                        }

                    });
              }, function(err) {
                console.log('Err:', err);
              }, function(msg) {
                console.log('message:', msg);
              });

        }
        
        $scope.alertProductCategory_error = function(catgName) {
               var alertPopup = $ionicPopup.alert({
                 title: 'Error while adding sub category for'+catgName,
                 template: 'Sorry, something went wrong - Try Again !!!'
               });
               alertPopup.then(function(res) {
                 console.log('Alert confirmed for error while adding product');
                 $state.go("app.seller.manageProduct.category");
               });
        };
                  
        $scope.enableCatgAndSubCatgToSeller = function() {
            var list = "";
            /*var urlValues = "";
            angular.forEach(list, function (value){
                urlValues += "orderList[]="+value+"&"; // prepare the list for http processing
            });*/
            angular.forEach($scope.subCatgCheckboxes.sub_category_id,function(val,key){
               console.log("list inside is "+val);
               list += "sub_category_list[]="+val+"&";
            });
                  console.log("list is "+list);
            ManageProduct.enableCatgAndSubCatg(list).then(function(results){
                console.log("resutl in enable catg is "+JSON.stringify(results));
                $state.go("app.seller.manageProduct.category");
            }); 
        };
        
        $scope.add = function(){
            console.log("add product called");
            $scope.productFlag="add";
        };
        /*$scope.addCategory = function(){
            console.log("add category called");
        };*/
        $scope.edit = function(){
            $scope.productFlag="edit";
        };
        $scope.clearSearch = function(){
            $scope.searchProduct='';
        };
        
        $scope.addProduct = function(){
            
            var saveProductToDB ="product[product_catg_id]="+$scope.product.product_catg_id+"&product[product_sub_catg_id]="+$scope.product.product_sub_catg_id+"&product[product_name]="+$scope.product.name+"&product[product_desc]="+$scope.product.desc+"&product[product_mfc_name]="+$scope.product.mfrName+"&product[product_min_qty]="+$scope.product.minQty+"&product[plan][1]="+$scope.product.price_platinum+"&product[plan][2]="+$scope.product.price_gold+"&product[plan][3]="+$scope.product.price_silver+"&product[plan][4]="+$scope.product.price_normal;
            
            if($scope.imgURI) {
                var imageStringB64 =  base64.encode($scope.imgURI);
                  console.log(" Image URI in add product iss"+$scope.imgURI);
                saveProductToDB +="&product[product_img_id1]="+imageStringB64;
                  $scope.product.imageString = imageStringB64;
            }
            
            
            
            
            ManageProduct.addSellerProduct($scope.userId,saveProductToDB,$scope.product).then(function(result){
               if (result == 200) {
                    $scope.alertProductAdd();
                }else{
                    $scope.alertProductAdd_error();
                }
               
            });
        }
        
        $scope.alertProductAdd = function() {
               var alertPopup = $ionicPopup.alert({
                 title: 'Product Addedd Successfully!',
                 template: 'Thank YOU!'
               });
               alertPopup.then(function(res) {
                 $scope.getProductsForSeller();
                 $scope.productFlag = "0";
                 $state.go('app.seller.manageProduct');
               });
        };
        $scope.alertProductAdd_error = function() {
               var alertPopup = $ionicPopup.alert({
                 title: 'Error while adding product, please try again!',
                 template: 'Sorry, something went wrong - OopS!'
               });
               alertPopup.then(function(res) {
                 console.log('Alert confirmed for error while adding product');
                 $scope.productFlag = "0";
                 $state.go('app.seller.manageProduct');
               });
        };
        
        $scope.editProduct = function(){
            //console.log("Product Edit "+JSON.stringify($scope.product));
        }
        $scope.resetProduct = function(){
            $scope.product = {};
            $scope.productFlag="";
            $state.go('app.seller.manageProduct');
            
        }
    
        
        // Populate the drop down list for category and related subcategories
        $scope.getAllProductCategories = function() {
            ProductInfo.getAllProdCatg($scope.userId).then(function(products){
              $scope.productCatg = products;
            });
        }
        $scope.getAllProductCategories();
        
        
        $scope.getProductsForSeller = function(){
            ManageProduct.getSellersProducts($scope.userId).then(function(results){
                $scope.products  = results;
                
                //console.log("products in management is "+JSON.stringify($scope.products));
                  
                  //Below code was used to display images as gallery - reference ionic gallery
                angular.forEach(angular.fromJson(results),function(val,key){
                  //console.log("Val in prod mgmt"+val.product_id);
                    $scope.items.push({
                        src: $scope.productImageUrl+val.product_id+"/index/0",
                        sub: val.product_name+"["+val.product_id+"]"
                    });
                  });
                  
                  console.log("Items values is"+JSON.stringify($scope.items));
                
            });
        }
        $timeout($scope.getProductsForSeller(),1000);
        //$scope.getProductsForSeller();
        
        
        $scope.selectProductEdit = function(product_id){
            console.log("Edit product id : "+product_id+"-for seller id-"+$scope.userId);
            $state.go("app.seller.manageProduct.edit",{productId:product_id,sellerId:$scope.userId});
        }
        
        
        $scope.takePicture = function() {
            var options = { 
                quality : 75, 
                destinationType : Camera.DestinationType.DATA_URL, 
                sourceType : Camera.PictureSourceType.CAMERA, 
                allowEdit : false,
                encodingType: Camera.EncodingType.JPEG,
                targetWidth: 100,
                targetHeight: 100,
                popoverOptions: CameraPopoverOptions,
                saveToPhotoAlbum: false
            };

            $cordovaCamera.getPicture(options).then(function(imageData) {
                console.log(" &&&&& Image from camera is--->"+imageData)
                $scope.imgURI = "data:image/jpeg;base64," + imageData;
            }, function(err) {
                // An error occured. Show a message to the user
                 console.log(" *** Error in camera function--->"+err);
            });
        };
    
    };
    
    kitApp.controller('sellerManageProductCtrl',funcManageProduct) ;
    
     var funcEditProduct = function($scope,$stateParams,$state,commonAppService,ManageProduct,ProductInfo,$ionicPopup,ApiEndpoint,$ionicActionSheet,base64,$timeout,ImageService){
         
        $scope.product = "";
        $scope.onlyNumbers = /^[1-9]+[0-9]*/;
        $scope.imgURI="";
        $scope.cameraButtonClicked = false;
         
         console.log(" Image URI in edit prod controller is : "+$scope.imgURI);
        
        $scope.userId = commonAppService.getloggedInUserId();
        
        $scope.resetProduct = function(){
            $scope.product = "";
            $state.go('app.seller.manageProduct');
            //console.log("Product"+JSON.stringify($scope.product));
        }
        
        // Populate the drop down list for category and related subcategories
        $scope.getAllProductCategories = function() {
            
            ProductInfo.getAllProdCatg($scope.userId).then(function(products){
              $scope.productCatg = products;
                console.log(" Product category "+JSON.stringify($scope.productCatg)+" User id : "+$scope.userId);
            });
        }
        $scope.getAllProductCategories();
         
         //Camera functionality starts
         /*$scope.addMedia = function() {
            $scope.hideSheet = $ionicActionSheet.show({
              buttons: [
                { text: 'Take photo' },
                { text: 'Photo from library' }
              ],
              titleText: 'Add images',
              cancelText: 'Cancel',
              buttonClicked: function(index) {
                $scope.addImage(index);
              }
            });
        }*/
        $scope.addImage = function(type) {
            //$scope.hideSheet();
            $timeout(function(){
                ImageService.handleMediaDialog(type).then(function(imageURL) {
                     $scope.imgURI = imageURL;
                     console.log(" Image URI "+$scope.imgURI);
                    $scope.cameraButtonClicked = true;
                });
            });
        }
         //Camera functionality ends
         
        
        $scope.editProductDetails = function(){
            product_id = $stateParams.productId;
            
            ManageProduct.getProductDetailsForEdit(product_id).then(function(results){
                var prices =results.data.price;
                console.log("Edit product id  in edit(): "+product_id+"-for seller id-"+$scope.userId+"- and details are :-"+JSON.stringify(results));
                if(prices.length < 4 ) {
                    var price_category = {1:"platinum", 2:"gold", 3:"silver", 4:"normal"};
                    for(var i=1 ; i <= 4 ; i++ ){
                        var flag = false;
                        angular.forEach(prices,function(val,key){
                            if(val.category_id == i){
                                  flag = true;
                            }
                        })
                        if (!flag) {
                            prices.push({
                            category_id: i,
                            category_name: price_category[i],
                            product_price: ""
                        });
                        }
                    }
                }
                $scope.product  = results.data;
            });
        }
        $scope.editProductDetails();
        //$scope.product= productDetails;
        $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
         
        $scope.editProduct = function(product){
            product_id = $stateParams.productId;
            
            var price_platinum, price_gold, price_silver;
            angular.forEach($scope.product.price,function(value,key){
                if(value.category_id == 1 ) {
                    price_platinum = value.product_price;
                }else if(value.category_id == 2 ) {
                    price_gold = value.product_price;
                }else if(value.category_id == 3 ) {
                    price_silver = value.product_price;
                }else if(value.category_id == 4 ) {
                    price_normal = value.product_price;
                }
                            
            });
            
            var updateProductDetails ="product[product_catg_id]="+$scope.product.product_catg_id+"&product[product_sub_catg_id]="+$scope.product.product_sub_catg_id+"&product[product_name]="+$scope.product.product_name+"&product[product_desc]="+$scope.product.product_desc+"&product[product_mfc_name]="+$scope.product.product_mfc_name+"&product[product_min_qty]="+$scope.product.product_min_qty+"&product[plan][1]="+price_platinum+"&product[plan][2]="+price_gold+"&product[plan][3]="+price_silver+"&product[plan][4]="+price_normal;
            
            console.log("update table"+ updateProductDetails);
            if($scope.imgURI) {
                console.log("Image taken in edit"+$scope.imgURI);
                var imageStringB64 =  base64.encode($scope.imgURI);
                updateProductDetails +="&product[product_img_id1]="+imageStringB64;
                $scope.cameraButtonClicked = true;
            }
            
            console.log("Details being edited and updated in edit Product are --"+updateProductDetails);
            ManageProduct.updateProductDetails(product_id,updateProductDetails,$scope.userId).then(function(results){
                console.log(" Update Product clicked"+JSON.stringify(results));
                if (results.status == 200) {
                    $scope.alertProductEdit();
                }
            });
        }
        
        $scope.alertProductEdit = function() {
               var alertPopup = $ionicPopup.alert({
                 title: 'Product Updated Successfully!',
                 template: 'Thank YOU!'
               });
               alertPopup.then(function(res) {
                 $scope.productFlag = "0";
                 $state.go('app.seller.manageProduct');
               });
        };
        
    };
    
    kitApp.controller('editProductCtrl',funcEditProduct) ;
    

}());