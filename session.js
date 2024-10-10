// session.js

// Check if the user is logged in and session hasn't expired
window.addEventListener('load', function () {
    const isLoggedIn = sessionStorage.getItem('isLoggedIn');
    const expirationTime = sessionStorage.getItem('expirationTime');

    // If not logged in or session expired, redirect to login page
    if (!isLoggedIn || Date.now() > expirationTime) {
        alert('Session expired or not logged in. Please log in again.');
        window.location.href = 'index.html'; // Redirect to login page
    }

    // Reset the expiration time on each page load (to extend the session if user is active)
    const newExpirationTime = Date.now() + 5 * 60 * 1000; // 5 more minutes
    sessionStorage.setItem('expirationTime', newExpirationTime);
});
