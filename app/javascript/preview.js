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
        clickElement.setAttribute('class', 'hidden')
      }
      // 画像リセットボタン押すと画像が全て消える
      const removeButton = document.getElementById('remove_image')
      removeButton.addEventListener('click', function(){
        const allImages = document.querySelector('.image-element')
        allImages.remove()

        const clickElement = document.querySelector('#item-image')
        clickElement.remove()
        removeButton.remove()
        // inputボタン再設置
        const imgUpload = document.querySelector('.img-upload')
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
        imgUpload.appendChild(inputHTML)
      })

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        createImageHTML(blob)
        const hiddenInput = document.querySelector(`#item_image_${imageElementNum}`)
        if(hiddenInput){
          hiddenInput.setAttribute('class', 'hidden')
        }
      })
    }
   
    document.getElementById('item-image').addEventListener('change', function(e){
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
      
    });
  });
}