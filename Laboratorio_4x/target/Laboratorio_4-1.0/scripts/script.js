//presentar la informacion en un modal
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('show.bs.modal', () => {
    myInput.focus()
})