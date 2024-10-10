// login.js

// Hardcoded username and password for demo purposes
const USERNAME = 'admin';
const PASSWORD = 'password123';

document.getElementById('loginForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (username === USERNAME && password === PASSWORD) {
        // Store login status in sessionStorage
        sessionStorage.setItem('isLoggedIn', 'true');
        
        // Store login expiration time (5 minutes from now)
        const expirationTime = Date.now() + 5 * 60 * 1000; // 5 minutes in milliseconds
        sessionStorage.setItem('expirationTime', expirationTime);

        // Redirect to the attendance page
        window.location.href = 'attendance.html';
    } else {
        document.getElementById('error-message').style.display = 'block';
    }
});
