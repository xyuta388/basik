const conteners = document.querySelector('.conteners');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');

registerBtn.addEventListener('click', () => {
    conteners.classList.add('active');
});

loginBtn.addEventListener('click', () => {
    conteners.classList.remove('active');
});