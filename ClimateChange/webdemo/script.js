function showSection(sectionId, event) {
    // Hide all sections
    document.querySelectorAll('.section').forEach(sec => sec.classList.remove('active'));
    // Show selected section
    document.getElementById(sectionId).classList.add('active');
    // Update nav link active state
    document.querySelectorAll('.nav-links a').forEach(link => link.classList.remove('active'));
    if (event) event.target.classList.add('active');
}

// Show Home by default
showSection('home');