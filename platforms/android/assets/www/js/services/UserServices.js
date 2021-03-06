(function(){
    var funcUserInfo = function(DBA,$http,ApiEndpoint,DBA) {
        var self = this;
        self.getUserCategories = function() {
            return $http.get(ApiEndpoint + '/user/userRoles',{skipAuthorization: true})
              .then(function(result){
                console.log(" User Category Result is ;"+JSON.stringify(result));
                return DBA.processResultSethttp(result);
              },function(error) {
                    console.log("Error in Service(UserInfo); funcUserInfo; "+JSON.stringify(error));
            });
          }
        
        self.addUser = function(userDetails) {
            console.log("user details in services is "+JSON.stringify(userDetails));
           
            
            
            saveToDB ="registerForm[shop_name]="+userDetails[0].shop_name+"&registerForm[user_type_id]="+userDetails[0].type_id+"&registerForm[first_name]="+userDetails[0].first_name+"&registerForm[last_name]="+userDetails[0].last_name+"&registerForm[phone_num]="+userDetails[0].phone_num+"&registerForm[email_id]="+userDetails[0].email_id+"&registerForm[imie_id]="+userDetails[0].imie_id;
            
            if(userDetails[0].user_img != undefined || userDetails[0].user_img != null  ) {
                saveToDB +="&registerForm[user_img]="+userDetails[0].user_img;
            }
            if(userDetails[0].shop_img != undefined || userDetails[0].shop_img != null ) {
                
                saveToDB +="&registerForm[shop_img]="+userDetails[0].shop_img;
            }
            console.log("type id "+userDetails[0].type_id);
            if(userDetails[0].type_id == 3  ){ 
            
               
                saveToDB +="&registerForm[tin_num]="+userDetails[0].tin_num+"&registerForm[gender]="+userDetails[0].gender+"&registerForm[st_num]="+userDetails[0].st_num+"&registerForm[alternate_phone_num]="+userDetails[0].alternate_phone_num;
                
            
            }
            
            console.log(" save to DB is " +saveToDB);
            return $http.post(ApiEndpoint + '/user/register?',saveToDB,{
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                }
            })
              .then(function(result){
                //return DBA.processResultSethttp(result);
                console.log(" returned data from server is ;"+JSON.stringify(result));
                console.log(" returned result from server is is ;"+JSON.stringify(result.data.result));
                console.log(" returned pin from server is is ;"+JSON.stringify(result.data.pin));
                console.log(" returned message from server is is ;"+JSON.stringify(result.data.message));
                //If Saved in server
                if(result.data.result){
                    var user_type = "seller";
                    var query="";
                    var parameters=[];
                    if (userDetails[0].type_id == 2 ) {
                        user_type="buyer";
                        parameters=                                                                                         [userDetails[0].imie_id,userDetails[0].email_id,result.data.pin,1,user_type,userDetails[0].type_id];
                        query="insert into user_auth (device_id,email_id,pin,auth_f,user_type, user_role_id) values (?,?,?,?,?,?)";
                    }else if (userDetails[0].type_id == 3 ){
                        query="update user_auth set user_role_id = 3, where device_id = (?)";
                        parameters=[userDetails[0].imie_id];
                    }
                    
                    
                    return DBA.query(query , parameters).then(function(dbResult){
                        console.log("in user service krishna"+dbResult);
                        if(dbResult.rowsAffected == 1 ) {
                            return result.data.result;
                        }
                    },function(error) {
                            console.log("Error in DBA-> Service(UserInfo); function(funcUserInfo); "+error.message);
                        });
                }
                
                console.log("status is"+result.data.result);
                return result.data.result;
              },function(error) {
                    console.log("Error in Service(UserInfo); funcUserInfo; "+JSON.stringify(error));
            });
          }
        return self;
    };
    
    //UserInfo.$inject('DBA',$http,'ApiEndpoint');
    kitApp.factory('UserInfo',funcUserInfo);    
}());