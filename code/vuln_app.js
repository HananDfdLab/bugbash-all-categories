/**
 * Intentionally vulnerable JavaScript application for security scanning tests.
 */

// Dangerous use of eval() with user input
function unsafeEval(userInput) {
    return eval(userInput);
}

// Pushing few lines for scanner
// Pushing few lines for scanner
// Pushing few lines for scanner

// DOM-based XSS via innerHTML
function displayMessage(message) {
    document.getElementById("output").innerHTML = message;
}

// No input sanitization
function processQuery(req, res) {
    const query = req.query.search;
    const html = `<div>Results for: ${query}</div>`;
    res.send(html);
}

// Prototype pollution risk
function merge(target, source) {
    for (const key in source) {
        target[key] = source[key];
    }
    return target;
}

module.exports = { unsafeEval, displayMessage, processQuery, merge };
