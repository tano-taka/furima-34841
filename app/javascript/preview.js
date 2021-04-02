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
  
      // 最上のinputがあったら隠してリセットボタン作成
      const clickElement = document.querySelector('.click-upload')
      if(clickElement) {
        const removeElement = document.createElement('input')
        removeElement.setAttribute('type', 'button')
        removeElement.setAttribute('value', ' 画像リセット ')
        removeElement.setAttribute('id', 'remove_image')

        const imgUpload = document.querySelector('.img-upload')
        imgUpload.appendChild(removeElement)
        clickElement.setAttribute('class', 'hidden add_input')
      }
     
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
   
    document.getElementById('item-image').addEventListener('change', function(e){
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
      
    });
     // 画像リセットボタン押すと画像が全て消える
    document.getElementById('item-image').addEventListener('change', function(e){
      const removeButton = document.getElementById('remove_image')
      removeButton.addEventListener('click', function(){
        const allForm = document.querySelectorAll('.hidden');
        const allImages = document.querySelectorAll('img');
        allImages.forEach(function( image ) {
          image.remove() 
        })
        allForm.forEach(function( form ) {
          form.remove() 
        })
        
        const addInputElement = document.querySelector('.add_input')
        addInputElement.remove()
        removeButton.remove()
        // inputボタン再設置

        const imgUpload = document.querySelector('.img-upload')
        const inputHTML = document.createElement('input')
        let imageElementNum = document.querySelectorAll('.image-element').length
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
        inputHTML.setAttribute('class', 'add_input')

        imgUpload.appendChild(inputHTML)
      })
    })
  });
}