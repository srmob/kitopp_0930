(function(){
       
    var funcSellerOrders = function($scope,$stateParams,SellerInfo,$filter,$state,$cordovaEmailComposer,$ionicLoading,commonAppService,$ionicModal,$ionicPopup,ApiEndpoint,$ionicHistory,$timeout ){
            
        $scope.userId = commonAppService.getloggedInUserId();
        $scope.userType = commonAppService.getloggedInUserType();
        
        $scope.orderChkbox = {item_id:[]};
        $scope.onlyNumbers = /^[1-9]+[0-9]*/;
        
        $scope.OrderedItemCheckBoxClicked = function(idx,orderItem){
            if (idx != undefined) {
                //Flip the checked flag
                orderItem.checked = !orderItem.checked;
                $scope.orderItemDetails[idx] = orderItem;
            }
        }
        
        $scope.viewOrderDetails = function(){
            $scope.orderId = $stateParams.orderId;
            $scope.orderDetails=[];
            $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
            SellerInfo.getOrdersDetails($stateParams.orderId).then(function(details){
                $scope.orderItemDetails = [];
                angular.forEach(angular.fromJson(JSON.stringify(details)),function(value,key){
                   angular.forEach(value.items,function(value1,key1){
                       value1.checked = false;
                   });
                   $scope.orderItemDetails = value.items;
                });
                //Fixed Defect 36
                $scope.orderStatus  = true;
                if (details[0].order_status == 'closed' || details[0].order_status == 'confirmed' ) {
                    $scope.orderStatus = false;
                }
                $scope.orderDetails = details;
            });
       }; 
        //if($ionicHistory.backView().stateName == 'app.seller') {
        $scope.viewOrderDetails();
        //}
       
        var finalOrders=[];
        //console.log("final orders before process=  "+JSON.stringify($scope.finalOrders));
        $scope.checkStatus = false;
        
        
        //Function to update the flag value, if user has selected any of items in Screen 9
        $scope.updateCheckFlag = function(flag) {
            $scope.checkStatus = flag; 
            //console.log("Order Details in Screen 9 checked flag"+$scope.checkStatus);
        };
        //Click of process button on Seller Order Details
        $scope.processOrder = function(orderId){
            var selllerFulfilledOrderList = [];
            
            
            angular.forEach($scope.orderItemDetails,function(value,key){
                //console.log("checked value "+value.checked+"- Item ID"+value.item_id)
                if(value.checked) {
                    //console.log("checked value "+value.checked+"- Item ID"+value.item_id)
                    selllerFulfilledOrderList.push(value.item_id+"-"+value.order_qty);
                }
            });
            
            SellerInfo.fulFillOrder(selllerFulfilledOrderList).then(function(resultFlag){
                    $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
                    if (resultFlag){
                        //$state.go("app.seller.orderDetails.conf",{orderId:orderId});
                        SellerInfo.getOrdersDetails(orderId).then(function(details){
                            console.log("In fulfillOrder of SellerOrderCtrl--"+JSON.stringify(details));
                            //$state.go("app.seller.orderDetails.conf",{orderId:orderId,orderDetails:details});
                            //commonAppService.setOrderDetails(details);
                            SellerInfo.setProcessedOrders(details);
                            $state.go("app.seller.orderDetails.conf",{orderId:orderId});
                            //$scope.orderConfItemDetails = [];
                            $scope.orderItemDetails = [];
                           
                        });
                        //$state.go("app.seller.orderDetails.conf",);
                    }else{
                        console.log(" Something went wrong for processing order ID# "+orderId);
                    }
            });
            
        };
        
        $ionicModal.fromTemplateUrl('templates/buyerInfo.html', {
            scope: $scope,
            animation: 'mh-slide'
          }).then(function(modal) {
            $scope.modal = modal;
          });
        

        // Triggered in the login modal to close it
        $scope.closeBuyerInfo = function() {
            $scope.modal.hide();
            
        };

        // Open the login modal
         //$timeout(function() {
        $scope.buyerInfo = function() {
            $scope.modal.show();
        };
         //});
        $scope.emailOrder = function(buyerDetails){
            $scope.alertWIP();
        };
        $scope.confirmOrderProcess = function(buyerId,orderId){
            SellerInfo.confirmOrder(orderId).then(function(details){
                $state.go("app.seller");
            });
            
        }
        $scope.alertWIP = function() {
                console.log("Alert WIP clicked");
               var alertPopup = $ionicPopup.alert({
                 title: 'WIP!',
                 template: 'Work-in-progress !!'
               });
               alertPopup.then(function(res) {
                });
                 
        };
        $scope.finalOrders = finalOrders ;
    };
        
    kitApp.controller('SellerOrderCtrl',funcSellerOrders) ;
    
    
    
    var funcSellerOrderConf = function($scope,$stateParams,SellerInfo,$state,$ionicLoading,commonAppService,$ionicModal,$ionicPopup,ApiEndpoint,$ionicHistory,$timeout,$q ){
        $scope.orderDetails  = angular.fromJson(JSON.stringify(SellerInfo.getProcessedOrders()));
        $scope.orderConfItemDetails = [];
        $scope.orderId = $stateParams.orderId;
        $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
        //Fetch the Item details from main order list
        angular.forEach(angular.fromJson($scope.orderDetails),function(value,key){
                $scope.orderConfItemDetails = value.items;
            });
        
        $scope.confirmOrderProcess = function(buyerId,orderId){
            SellerInfo.confirmOrder(orderId).then(function(details){
                $state.go("app.seller");
            });
            
        };
        
        $ionicModal.fromTemplateUrl('templates/buyerInfo.html', {
            scope: $scope,
            animation: 'mh-slide'
          }).then(function(modal) {
            $scope.modal = modal;
          });
        

        // Triggered in the login modal to close it
        $scope.closeBuyerInfo = function() {
            $scope.modal.hide();
            
        };

        // Open the buyer info modal
         //$timeout(function() {
        $scope.buyerInfo = function() {
            $scope.modal.show();
        };
    }
    kitApp.controller('SellerOrderConfCtrl',funcSellerOrderConf) ;
    
    var funcCustMgmt = function($scope,$stateParams,SellerInfo,commonAppService){
        
        $scope.userId = commonAppService.getloggedInUserId();
        $scope.userType = commonAppService.getloggedInUserType();
       
        $scope.getUserPlans = function(){
           $scope.userPlans=[{"id":1,"name":"platinum"},{"id":2,"name":"gold"},{"id":3,"name":"silver"}];
        }
        $scope.getUserPlans();
        
        $scope.buyersList = [{"name":"Shirdi Enterprises ltd",id:1,checked:true},{"name":"Boeing corporation",id:2,checked:true},{"name":"Checkmark India",id:3,checked:false}];
        
    };
    kitApp.controller('sellerCustomerMgmtCtrl',funcCustMgmt) ;
    
    var funcSellerShop = function($scope,$stateParams,$state,commonAppService,ProductInfo,ManageProduct,$ionicPopup,$cordovaCamera, $ionicPlatform, $ionicActionSheet, ImageService,ApiEndpoint,$timeout,base64){
        
        $scope.product = {};
        
        $scope.products = {};
        
        $scope.userId = commonAppService.getloggedInUserId();
        $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
        $scope.myShopImgUrl = ApiEndpoint+"/user/fetchShopImage/uid/"+$scope.userId;
        
        $scope.addMedia = function() {
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
        }
        
        $scope.addImage = function(type) {
            $scope.hideSheet();
            $timeout(function(){
                ImageService.handleMediaDialog(type).then(function(imageURL) {
                    $scope.imgURI = imageURL;
                });
            });
        }
        
        
        /*$scope.updateImage = function(){
            var imageStringB64 =  base64.encode($scope.imgURI);
            
            var saveProductToDB ="product[product_img_id1]="+imageStringB64+"&product[product_catg_id]="+$scope.product.product_catg_id+"&product[product_sub_catg_id]="+$scope.product.product_sub_catg_id+"&product[product_name]="+$scope.product.name+"&product[product_desc]="+$scope.product.desc+"&product[product_mfc_name]="+$scope.product.mfrName+"&product[product_min_qty]="+$scope.product.minQty+"&product[plan][1]="+$scope.product.price_platinum+"&product[plan][2]="+$scope.product.price_gold+"&product[plan][3]="+$scope.product.price_silver;
            
            ManageProduct.addSellerProduct($scope.userId,saveProductToDB).then(function(result){
               if (result == 200) {
                    $scope.alertProductAdd();
                }else{
                    $scope.alertProductAdd_error();
                }
               
            });
        }*/
        
        
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
                console.log("Products in my shop are"+JSON.stringify($scope.products));
                
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
    
    kitApp.controller('sellerShopCtrl',funcSellerShop) ;
}());