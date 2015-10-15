(function(){
   var funcBrwseProd = function($scope,ProductInfo,$state, $stateParams,ProductInfo,$filter,$ionicModal,$ionicLoading,commonAppService,ApiEndpoint){
        $scope.shopName = $stateParams.shopName;
        $scope.sellerID = $stateParams.uid_seller;
        $scope.buyerId = $stateParams.buyer_uid;
        $scope.productCatg = [];
        $scope.products = [] ;
        $scope.selectedProducts = [];
        $scope.onlyNumbers = /^[1-9]+[0-9]*/;
        $scope.onlyNumbers1 = /^[0-9]+[0-9]*/;
        
        if ($scope.buyerId == null || $scope.buyerId == 0 ){
            $scope.buyerId = commonAppService.getloggedInUserId();
        }
       $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
        // Populate the drop down list for category and related subcategories
        $scope.getAllCategories = function() {
            ProductInfo.getAllProdCatg($scope.sellerID).then(function(products){
              $scope.productCatg = products;
              $scope.shopURL = ApiEndpoint+"/user/fetchShopImage/uid/"+$scope.sellerID;
            });
        }
        $scope.getAllCategories();
        
        // Get the items for particular seller , selected Product and Sub Product Category to a drop down from DB
        
        $scope.getProductsForID = function(selectedDept){
            var prodCatgID = selectedDept.product_catg_id;
            var product_sub_catg_id = selectedDept.product_sub_catg_id;
                    ProductInfo.getProductsListsForSellerID($stateParams.uid_seller,prodCatgID,product_sub_catg_id,$scope.buyerId).then(function(items){
                //console.log(" In getProductsForID controller method  , prod_sub_catg_id = "+subProdId);
                $scope.products = items;
                angular.forEach($scope.products,function(value,key){
                    $scope.products[key].order_qty=1;
                    $scope.products[key].checked=false;
                    $scope.products[key].imgurl=$scope.productImageUrl+value.product_id+"/index/0";
                    
                });
                console.log("products in buyer is"+JSON.stringify($scope.products));
                
            });
        }
        
        
        $ionicModal.fromTemplateUrl('templates/moreProductInfo.html', {
            scope: $scope, 
            animation: 'slide-in-up'
        }).then(function(modal) {
            $scope.modal = modal;
        });

        // Triggered in the login modal to close it
        $scope.closeProductInfo = function() {
            $scope.modal.hide();
        };

        // Open the login modal
        $scope.productInfo = function(row) {
            $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
            $scope.modalRow = row;
            $scope.modal.show();
        };

        
        $scope.more = function(row){
            $scope.productInfo(row);
        }
        
        $scope.checkboxes = {prodid:[]};
        $scope.btnEnabled = false;
        $scope.checkBoxClicked = function(idx){
            $scope.products[idx].checked = !$scope.products[idx].checked;
        }
        
        
        $scope.saveSelectedProducts=function(categoryName){
            $scope.finalProducts=[ ];
            angular.forEach($scope.checkboxes.prodid,function(chkValue,chkKey) {
                angular.forEach($scope.products, function(value,key) {
                  if (value.product_id == chkValue ) {
                      $scope.finalProducts.push({
                            uid_buyer: $scope.buyerId,
                            product_id: value.product_id,
                            price_id: value.price_id,
                            lot_size: value.product_min_qty,
                            order_qty: value.order_qty,
                            order_date: new Date(),
                            order_price: value.product_price,
                            order_tot_amount: value.product_price,
                            order_status: "new",
                            uid_seller: $scope.sellerID,
                            product_name: value.product_name,
                            product_desc: value.product_desc,
                            product_sub_catg_name: categoryName
                        });
                  }
                });
            });
            
            
            var data= angular.fromJson($scope.finalProducts);
            
            if ($scope.finalProducts.length > 0 ) {
                ProductInfo.saveProductsList(data).then(function(item){
                    $scope.modal.remove();
                    $state.go('app.buyer.buyProducts.summary',{reload: true});
                });
            }
            
        };
        
    };
    
    kitApp.controller('ProductslistsCtrl',funcBrwseProd);
        
    var funcOrderItem = function($scope,$stateParams,ProductInfo,$ionicScrollDelegate,OrderInfo,$ionicModal,$ionicPopup,$state,LoadAppInfo,$ionicLoading,commonAppService,ApiEndpoint){
            $scope.orders=[];
            $scope.buyerId = $stateParams.Uid;
            $scope.sellerName = $stateParams.sellerName;
            $scope.onlyNumbers = /^[1-9]+[0-9]*/;
           
            if ($scope.buyerId == null || $scope.buyerId == 0 ){
                $scope.buyerId = commonAppService.getloggedInUserId();
            }
            $scope.shopName = commonAppService.getloggedInShopName();
            //TO DISPLAY PRODUCT IMAGES
            $scope.productImageUrl =ApiEndpoint+"/product/productImage/productId/";
        
            // LIST OF BUYER ORDERS FROM SQLITE TABLES 
            $scope.getBuyerSummaryOrders = function(){
                ProductInfo.getOrders($scope.buyerId).then(function(items){
                    $scope.orders = items;
                });
            };
            $scope.getBuyerSummaryOrders();
        
            
        
           

             $scope.alertOrderConfirmed = function() {
               var alertPopup = $ionicPopup.alert({
                 title: 'You\'r order is in process!',
                 template: 'Thank YOU for placing the order'
               });
               alertPopup.then(function(res) {
                 LoadAppInfo.getSellersForBuyer().then(function(sellers){
                    $scope.sellersAssociated = sellers;
                    angular.forEach($scope.sellersAssociated,function(value,key){
                        $scope.sellersAssociated[key].imgPath="img/sellers/images-"+key+".jpeg";
                    });

                });
                 $state.go('app.buyer');
               });
             };
            
            $scope.placeOrder = function(){
                var list = [];
                angular.forEach($scope.orders,function(value,key){
                     list.push(value.product_id+"-"+value.order_qty);
                });
                console.log("--List- "+JSON.stringify(list));
                OrderInfo.placeOrder(list,$scope.buyerId).then(function(item){
                    if (list.length == item[0].rows_added ) {
                        OrderInfo.clearOrderDetailTemp($scope.buyerId).then(function(count){ 
                     });
                    }

                    $scope.alertOrderConfirmed();
                });
            };
            
            $scope.setOrderTotal = function(items){
                $scope.orderTotal = 0;
                angular.forEach(items,function(value,key){
                    if(value.order_qty){
                        var rowTotal = value.order_price * value.order_qty;
                        $scope.orderTotal = $scope.orderTotal + rowTotal;
                    }
                });
            }
        };
        
    kitApp.controller('OrderItemCtrl',funcOrderItem ) ;
}());