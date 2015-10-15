kitApp.factory('ImageService', function($cordovaCamera,  $q, $cordovaFile) {
 
  function optionsForType(type) {
    var source;
    
      console.log(" Source type is "+type);
    switch (type) {
      case 0:
        source = Camera.PictureSourceType.CAMERA;
        break;
      case 1:
        source = Camera.PictureSourceType.PHOTOLIBRARY;
        break;
    }
    return {
      //destinationType: Camera.DestinationType.FILE_URI ,
      destinationType: Camera.DestinationType.DATA_URL,
      quality : 100, 
      targetWidth : 200,
      targetHeight : 150, 
      sourceType: source,
      allowEdit: true,
      saveToPhotoAlbum: true,
      encodingType: Camera.EncodingType.JPEG,
      popoverOptions: CameraPopoverOptions
    };
  }
 
  function saveMedia(type) {
      
        return $q(function(resolve, reject) {
              var options = optionsForType(type);
              $cordovaCamera.getPicture(options).then(function(imageUrl) {
                  resolve(imageUrl);
              }, function(e) {
                reject();
              });
        })
  }
  return {
    handleMediaDialog: saveMedia
  }
});