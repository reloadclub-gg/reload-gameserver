const express = require('express');


const app = express();
const serverPort = GetConvar('api_serverPort', 3000);

app.use(express.json());

app.post('/matches', async (req, res) => {
    try {
        emit('createMatch', JSON.stringify(req.body));
        return res.status(201).send();
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
});

app.listen(serverPort, () => console.log('API listen on ', serverPort));
