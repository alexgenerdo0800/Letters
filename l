<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Secret Garden Letters</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Caveat:wght@400;700&family=Playfair+Display:wght@400;500;700&display=swap');

        :root {
            --forest-green: #1E3F20;
            --soft-pink: #FFCAD4;
            --deep-pink: #D4A373;
            --accent-pink: #E8AEB7;
            --cream: #FAEDCD;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Playfair Display', serif;
            background-color: var(--forest-green);
            color: var(--cream);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-x: hidden;
            position: relative;
        }

        .lily-decoration {
            position: fixed;
            font-size: 5rem;
            opacity: 0.15;
            pointer-events: none;
            z-index: 1;
            user-select: none;
        }
        .lily-top-left { top: 20px; left: 20px; transform: rotate(-15deg); }
        .lily-bottom-right { bottom: 20px; right: 20px; transform: rotate(165deg); }

        .container {
            width: 90%;
            max-width: 650px;
            background: rgba(30, 63, 32, 0.85);
            border: 3px double var(--soft-pink);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            z-index: 2;
            margin: 40px 0;
        }

        h1 {
            font-family: 'Caveat', cursive;
            color: var(--soft-pink);
            text-align: center;
            font-size: 3.5rem;
            margin-top: 0;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        #lock-screen {
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #lock-screen p {
            font-style: italic;
            font-size: 1.2rem;
            color: var(--soft-pink);
        }

        .input-group {
            margin-bottom: 20px;
            width: 100%;
        }

        label {
            display: block;
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: var(--soft-pink);
        }

        input[type="text"], input[type="password"], textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid var(--soft-pink);
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-family: 'Playfair Display', serif;
            font-size: 1rem;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input:focus, textarea:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 10px var(--soft-pink);
        }

        textarea {
            height: 150px;
            resize: vertical;
        }

        button {
            background-color: var(--soft-pink);
            color: var(--forest-green);
            border: none;
            padding: 12px 30px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Caveat', cursive;
            font-size: 1.5rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        button:hover {
            background-color: #fff;
            transform: scale(1.05);
            box-shadow: 0 6px 15px var(--soft-pink);
        }

        #app-screen {
            display: none;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .archive-section {
            margin-top: 40px;
            border-top: 2px dashed var(--soft-pink);
            padding-top: 20px;
        }

        .archive-title {
            font-family: 'Caveat', cursive;
            color: var(--soft-pink);
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 20px;
        }

        #letters-container {
            max-height: 400px;
            overflow-y: auto;
            padding-right: 10px;
        }

        #letters-container::-webkit-scrollbar {
            width: 6px;
        }
        #letters-container::-webkit-scrollbar-thumb {
            background: var(--soft-pink);
            border-radius: 10px;
        }

        .letter-card {
            background: rgba(255, 255, 255, 0.05);
            border-left: 4px solid var(--soft-pink);
            padding: 15px;
            border-radius: 0 12px 12px 0;
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease;
            position: relative;
        }

        .letter-meta {
            font-size: 0.9rem;
            color: var(--soft-pink);
            margin-bottom: 8px;
            display: flex;
            justify-content: space-between;
            font-style: italic;
        }

        .letter-body {
            line-height: 1.6;
            white-space: pre-wrap;
        }

        .letter-card::after {
            content: '💮';
            position: absolute;
            bottom: 8px;
            right: 12px;
            opacity: 0.3;
            font-size: 1.2rem;
        }

        #error-msg {
            color: #ff6b6b;
            margin-top: 15px;
            font-weight: bold;
            min-height: 20px;
        }

        .empty-state {
            text-align: center;
            color: var(--soft-pink);
            font-style: italic;
            opacity: 0.8;
            padding: 20px 0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            .container {
                padding: 20px;
            }
            h1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="lily-decoration lily-top-left">🪷</div>
    <div class="lily-decoration lily-bottom-right">🪷</div>

    <div class="container">
        <div id="lock-screen">
            <h1>Our Secret Garden</h1>
            <p>Enter the magic code to see our letters...</p>
            <div class="input-group" style="max-width: 300px;">
                <input type="password" id="secret-code" placeholder="••••••••" style="text-align: center; letter-spacing: 3px;">
            </div>
            <button onclick="unlockGarden()">Unlock</button>
            <div id="error-msg"></div>
        </div>

        <div id="app-screen">
            <h1>Write a Letter</h1>

            <div class="form-row">
                <div class="input-group">
                    <label for="from-input">From:</label>
                    <input type="text" id="from-input" placeholder="Your name...">
                </div>
                <div class="input-group">
                    <label for="to-input">To:</label>
                    <input type="text" id="to-input" placeholder="Her name...">
                </div>
            </div>

            <div class="input-group">
                <label for="message-input">What's on your mind?</label>
                <textarea id="message-input" placeholder="Type your thoughts here, love..."></textarea>
            </div>

            <div style="text-align: center;">
                <button onclick="sendLetter()">Send into the Garden</button>
            </div>

            <div class="archive-section">
                <div class="archive-title">Our Shared Letters</div>
                <div id="letters-container"></div>
            </div>
        </div>
    </div>

    <script>
        const REQUIRED_CODE = "03250904";
        const STORAGE_KEY = "secret-garden-letters";

        document.getElementById('secret-code').addEventListener('keypress', function (e) {
            if (e.key === 'Enter') unlockGarden();
        });

        function unlockGarden() {
            const enteredCode = document.getElementById('secret-code').value;
            const errorMsg = document.getElementById('error-msg');

            if (enteredCode === REQUIRED_CODE) {
                document.getElementById('lock-screen').style.display = 'none';
                document.getElementById('app-screen').style.display = 'block';
                displayLetters();
            } else {
                errorMsg.innerText = "The code isn't right, love. Try again! 🌸";
                document.getElementById('secret-code').value = '';
            }
        }

        function loadLetters() {
            try {
                return JSON.parse(localStorage.getItem(STORAGE_KEY)) || [];
            } catch (error) {
                return [];
            }
        }

        function saveLetters(letters) {
            localStorage.setItem(STORAGE_KEY, JSON.stringify(letters));
        }

        function displayLetters() {
            const letters = loadLetters();
            const container = document.getElementById('letters-container');

            if (!letters.length) {
                container.innerHTML = '<div class="empty-state">No letters in the garden yet. Write one for a sweet start.</div>';
                return;
            }

            container.innerHTML = letters.map((letter) => `
                <div class="letter-card">
                    <div class="letter-meta">
                        <span>From: ${escapeHtml(letter.from)}</span>
                        <span>To: ${escapeHtml(letter.to)}</span>
                    </div>
                    <div class="letter-meta">
                        <span>${escapeHtml(letter.date)}</span>
                    </div>
                    <div class="letter-body">${escapeHtml(letter.body)}</div>
                </div>
            `).join('');
        }

        function escapeHtml(str) {
            return String(str)
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;')
                .replace(/'/g, '&#039;');
        }

        function sendLetter() {
            const fromName = document.getElementById('from-input').value.trim();
            const toName = document.getElementById('to-input').value.trim();
            const message = document.getElementById('message-input').value.trim();

            if (!fromName || !toName || !message) {
                alert("Please fill out all fields before sending! 🌿");
                return;
            }

            const newLetter = {
                from: fromName,
                to: toName,
                body: message,
                date: new Date().toLocaleDateString('en-US', {
                    month: 'short',
                    day: 'numeric',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                })
            };

            const letters = loadLetters();
            letters.unshift(newLetter);
            saveLetters(letters);

            document.getElementById('from-input').value = '';
            document.getElementById('to-input').value = '';
            document.getElementById('message-input').value = '';

            displayLetters();
        }
    </script>
</body>
</html>
