if (document.URL.match( /items/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length
      imageElement.setAttribute('id', `image_element_${imageElementNum}`)

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'item_preview');
      blobImage.setAttribute('id', `blob_image_${imageElementNum}`)

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('class', 'add_input')


      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)
  
      //inputを隠して
      const clickElement = document.querySelector('.add_input')
      clickElement.setAttribute('class', 'hidden add_input')
      document.querySelector('p').innerHTML = "※画像を変更する際はリロードして初めからやり直してください※"

      
      // // リセットボタン作成
      // removeImage = document.querySelector('#remove_image')
      // if (!removeImage) {
      //   const removeElement = document.createElement('input')
      //   removeElement.setAttribute('type', 'button')
      //   removeElement.setAttribute('value', ' 画像リセット ')
      //   removeElement.setAttribute('id', 'remove_image')
      //   const imgUpload = document.querySelector('.img-upload')
      //   imgUpload.appendChild(removeElement)
      // }

      
     
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        createImageHTML(blob)
        const hiddenInput = document.querySelector(`#item_image_${imageElementNum}`)
        if(hiddenInput){
          hiddenInput.setAttribute('class', 'hidden add_input')
        }
      })
    }
   
    document.querySelector('.add_input').addEventListener('change', function(e){
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
      
    });
     // 画像リセットボタン押すと画像が全て消える
  });

}