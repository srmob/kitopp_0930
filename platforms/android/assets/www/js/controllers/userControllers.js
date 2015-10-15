(function(){
   var funcUserReg = function($scope,$state, $stateParams,commonAppService,UserInfo,$ionicLoading,$filter,$ionicPopup,$ionicActionSheet,$timeout,ImageService,base64,ApiEndpoint,$http,$jrCrop,base64){
        var ab = this;
        $scope.user={gender:"M"};
        $scope.userId = commonAppService.getloggedInUserId();
        $scope.userType = commonAppService.getloggedInUserType();
        $scope.imeiID = commonAppService.getDeviceId();
        $scope.userPhoneNum = commonAppService.getloggedInUserPhoneNum();
        $scope.gender=[{"id":"M","value":"Male","selected":true},{"id":"F","value":"Female","selected":false}];
        $scope.onlyNumbers = /^[1-9]+[0-9]*/;
        $scope.cameraButtonClickedForUserImage = false;
        $scope.cameraButtonClickedForShopImage = false;
        
       
       
       
       $scope.getUserCategory = function(){
           //$scope.userCategory = ["buyer","seller","both"];
          // $scope.userCategory=[{"id":1,"name":"Seller"},{"id":2,"name":"Buyer"},{"id":3,"name":"Buyer & Seller"}];
           $scope.userCategory=[{"id":2,"name":"Buyer Only"},{"id":3,"name":"Buyer & Seller"}];
           
           $http.get(ApiEndpoint + '/user/checkDevice/deviceId/'+commonAppService.getDeviceId(),{skipAuthorization: true}).then(function(result){
                //http://117.218.228.220:8080/kitaki/user/checkDevice/deviceId/8ef01a374e602841
                 console.log("Device Check Status in User controller is "+JSON.stringify(result));
                if(result.data.role_id == 2 ){
                    $scope.userCategory=[{"id":3,"name":"Buyer & Seller"}];
                }/*else if(result.data.role_id == 1 ){
                     $scope.bothRegistered = false;
                }*/
            }
           );
           
       }
        $scope.getUserCategory();
       
        $scope.clearUserRegForm = function(){
            $scope.user = "";
            $state.go("welcome");
        }
        //For Back button on top, go to home page
        $scope.goBackToWelcome = function(){ 
            $state.go("welcome");
        }
        
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
        $scope.addImage = function(value) {
            console.log("Click User Image"+value);
            //$scope.hideSheet();
            $timeout(function(){
                ImageService.handleMediaDialog(value).then(function(imageURL) {
                    $scope.imgURI = imageURL;
                    $scope.cameraButtonClickedForUserImage = true;
                    console.log("User image taken is "+$scope.imgURI);
                    //console.log(" Calling crop");
                    //onImageSuccess($scope.imgURI);
                    //imageCrop(imageURL);
                    
                    
                });
            });
        }
        
         
        
        /*$scope.pickGalleryUserImage = function() {
            console.log("Pick User Image");
            //$scope.hideSheet();
            $timeout(function(){
                ImageService.handleMediaDialog("1").then(function(imageURL) {
                    $scope.imgURI = imageURL;
                    console.log("User image taken is "+$scope.imgURI);
                    console.log(" Calling crop");
                    //imageCrop($scope.imgURI);
                    
                    
                });
            });
        }
        /*imageCrop = function(image) {
            console.log(" within ImageCrop for "+image);
            $jrCrop.crop({url: image,width: 400,height: 620}).then(function(canvas) {
                                // success!
                                console.log("Image within crop is"+url);
                                console.log("canvas  is"+canvas);
                                var image = canvas.toDataURL();
                                console.log("canvas image taken is "+image);
                            }, function() {
                                console.log("User Cancelled ");
                            });
            
        };*/
        
        $scope.addMedia_shop = function() {
            $scope.hideSheet = $ionicActionSheet.show({
              buttons: [
                { text: 'Take photo' },
                { text: 'Photo from library' }
              ],
              titleText: 'Add images',
              cancelText: 'Cancel',
              buttonClicked: function(index) {
                $scope.addImage_shop(index);
              }
            });
        }
        $scope.addImage_shop = function(type) {
            //$scope.hideSheet();
             console.log("Add shop image id type is"+type);
            $timeout(function(){
                ImageService.handleMediaDialog(type).then(function(imageURL) {
                    $scope.imgURI_shop = imageURL;
                    //$scope.imgURI_shop = "data:image/jpeg;base64," + imageURL;
                    $scope.cameraButtonClickedForShopImage = true;
                    console.log("shop image taken is "+$scope.imgURI_shop);
                    //onImageSuccess1($scope.imgURI_shop);
                });
            });
        }
       
        /*function onImageSuccess(fileURI) {
         createFileEntry(fileURI);
        }
        function createFileEntry(fileURI) {
            console.log("fileURi is "+fileURI);
            window.resolveLocalFileSystemURL(fileURI, copyFile, fail);
        }
       function copyFile(fileEntry) {
            console.log("fileEntry is "+fileEntry);
            var name = fileEntry.fullPath.substr(fileEntry.fullPath.lastIndexOf('/') + 1);
            var newName = makeid() + name;
            console.log("Name and New Name is "+name+"-"+newName);
            window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function(fileSystem2) {
                fileEntry.copyTo(fileSystem2,newName,onCopySuccess,fail);
             },fail);
       }

         // 6
        function onCopySuccess(entry) {
             $scope.$apply(function () {
               // $scope.images.push(entry.nativeURL);
                 console.log("native url is "+entry.nativeURL);
                 $scope.userImage=entry.nativeURL;
                 console.log("user image-->"+$scope.userImage);
                
                 $scope.imageData = base64.encode(entry.nativeURL);
                 console.log("Image Data is  "+$scope.imageData);
                 
             });
        }

         function fail(error) {
            console.log("fail: " + error.code);
            console.log("fail: " + JSON.stringify(error));
         }
        

         function makeid() {
             var text = "";
             var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

             for (var i=0; i < 5; i++) {
                text += possible.charAt(Math.floor(Math.random() * possible.length));
             }
            return text;
         }
       
       
        function onImageSuccess1(fileURI) {
         createFileEntry1(fileURI);
        }
        function createFileEntry1(fileURI) {
            console.log("fileURi is "+fileURI);
            window.resolveLocalFileSystemURL(fileURI, copyFile1, fail1);
        }
       function copyFile1(fileEntry) {
            console.log("fileEntry is "+fileEntry);
            var name = fileEntry.fullPath.substr(fileEntry.fullPath.lastIndexOf('/') + 1);
            var newName = makeid1() + name;
            console.log("Name and New Name is "+name+"-"+newName);
            window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function(fileSystem2) {
                fileEntry.copyTo(fileSystem2,newName,onCopySuccess1,fail1);
             },fail);
       }

         // 6
        function onCopySuccess1(entry) {
             $scope.$apply(function () {
               // $scope.images.push(entry.nativeURL);
                 console.log("native url is "+entry.nativeURL);
                  $scope.shopImage = entry.nativeURL;
                  console.log("shop image -->"+$scope.shopImage);
                
                 $scope.imageData = base64.encode(entry.nativeURL);
                 console.log("Image Data is  "+$scope.imageData);
                 
             });
        }

         function fail1(error) {
            console.log("fail111: " + error.code);
            console.log("fail111: " + JSON.stringify(error));
         }
        

         function makeid1() {
             var text = "";
             var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

             for (var i=0; i < 5; i++) {
                text += possible.charAt(Math.floor(Math.random() * possible.length));
             }
            return text;
         }
       $scope.urlForImage = function(imageName) {
          var name = imageName.substr(imageName.lastIndexOf('/') + 1);
          var trueOrigin = cordova.file.dataDirectory + name;
          return trueOrigin;
        }*/
        // Populate the drop down list for category and related subcategories
        $scope.registerUser = function(user) {
           
            console.log("In register controller");
            /*saveToDB ="registerForm[shop_name]="+user.shopName+"&registerForm[user_type_id]="+user.category+"&registerForm[first_name]="+user.firstName+"&registerForm[last_name]="+user.lastName+"&registerForm[phone_num]="+user.phone+"&registerForm[email_id]="+user.email+"&registerForm[imie_id]="+commonAppService.getDeviceId();*/
            
            var userDetails = [];
            
            userDetails.push({"shop_name":user.shopName ,                      
                              "type_id":user.category,
                              "first_name":user.firstName,
                              "last_name":user.lastName,
                              "phone_num":user.phone,
                              "email_id":user.email,
                              "imie_id":commonAppService.getDeviceId(),
                              "user_img":"",
                              "shop_img":"",
                              "tin_num":"",
                              "gender":"",
                              "st_num":"",
                              "alternate_phone_num":""
                             });
            
            console.log("User Details Array is "+JSON.stringify(userDetails));
            
            var userImageTaken = false;
            var shopImageTaken = false;
            
            if($scope.imgURI) {
                var imageStringB64 =  base64.encode($scope.imgURI);
                //var imageStringB64 =  base64.encode($scope.imageData);
                console.log("imageStringB64 is "+imageStringB64);
                userImageTaken = true;
                //saveToDB +="&registerForm[user_img]="+imageStringB64;
                userDetails[0].user_img=imageStringB64;
                /*userDetails.push({"user_img":imageStringB64});
                userDetails[0].concat(userDetails);*/
            }
            if($scope.imgURI_shop) {
                var imageStringB64_shop =  base64.encode($scope.imgURI_shop);
                shopImageTaken = true;
                //saveToDB +="&registerForm[shop_img]="+imageStringB64_shop
               // userDetails.push({"shop_img":imageStringB64_shop});
                userDetails[0].shop_img=imageStringB64_shop;
               // userDetails[0]["shop_img"].push({"shop_img":imageStringB64_shop});
                //userDetails[0].concat(userDetails);
                
            }
            
           
            console.log("image string is "+imageStringB64);
            console.log("image shop string is "+imageStringB64_shop);
            console.log(" User Categorys "+user.category);
            
            
            
            //if seller
            if(user.category == 3  ){
                /*saveToDB +="&registerForm[tin_num]="+user.tinNumber+"&registerForm[gender]="+user.gender+"&registerForm[st_num]="+user.stNumber+"&registerForm[alternate_phone_num]="+commonAppService.getloggedInUserPhoneNum();*/
                console.log("user details before concat  "+JSON.stringify(userDetails));
                userDetails[0].tin_num = user.tinNumber;
                userDetails[0].gender = user.gender;
                userDetails[0].st_num = user.stNumber;
                userDetails[0].alternate_phone_num = commonAppService.getloggedInUserPhoneNum();
            
                 /*userDetails.({"tin_num":user.tinNumber,
                                  "gender":user.gender,
                                  "st_num":user.stNumber,
                                  "alternate_phone_num":commonAppService.getloggedInUserPhoneNum()});*/
                //userDetails[0].concat(userDetails);
                console.log("user details after concat  "+JSON.stringify(userDetails));
                //saveToDB +="&registerForm[tin_num]="+user.tinNumber+"&registerForm[gender]="+user.gender+"&registerForm[st_num]="+user.stNumber+"&registerForm[date_of_birth]="+$filter('date')(user.dob, 'dd/MM/yyyy')+"&registerForm[alternate_phone_num]="+commonAppService.getloggedInUserPhoneNum();
            }
            
            //console.log("userDetails concate")
            UserInfo.addUser(userDetails).then(function(result){
                console.log("result in user controller on save /add user is "+JSON.stringify(result));
                //if (data == 200) {
                if (result) {
                    $scope.alertUserAdded();
                }else if(!result || result == 'undefined'){
                    $scope.alertUserAdd_error();
                }
            });
            
            
        };
       $scope.alertUserAdded = function() {
           var alertPopup = $ionicPopup.alert({
             title: 'User Registration!',
             template: 'Registration Success, please check SMS for pin !!'
           });
           alertPopup.then(function(res) {
               $state.go('welcome',{},{reload: true});
            });
        };
       $scope.alertUserAdd_error = function() {
           var alertPopup = $ionicPopup.alert({
             title: 'User Registration Failed',
             template: 'Some error please re-try !!'
           });
           alertPopup.then(function(res) {
               $state.go('welcome');
            });
        };
        
    };
    //UserRegCtrl.$inject($scope,$state, $stateParams,'commonAppService','UserInfo');
    kitApp.controller('UserRegCtrl',funcUserReg);
}());