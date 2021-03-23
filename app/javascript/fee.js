function tax (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', () => {
    const taxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit')
    const taxValue = Math.floor(itemPrice.value / 10)    

    taxPrice.innerHTML = taxValue
    profit.innerHTML = itemPrice.value - taxValue
  });
}

window.addEventListener('load', tax);
