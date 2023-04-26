// Set the cookie expiration time to 1 hour from now
var expiration = new Date();
expiration.setTime(expiration.getTime() + (60 * 60 * 1000)); // 1 hour in milliseconds

// Generate a unique session ID
var sessionId = Math.floor(Math.random() * Number.MAX_SAFE_INTEGER);

// Set the session cookie with the session ID and expiration time
document.cookie = "session=" + sessionId + "; expires=" + expiration.toUTCString() + "; path=/";
