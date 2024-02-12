const express = require('express');
const authRouter = require('./router/auth');
const mongoose = require('mongoose');

const db = 'mongodb+srv://shivdhannikam:nikam12345@cluster0.5mf3bkz.mongodb.net/?retryWrites=true&w=majority';

mongoose.connect(db).then(()=>{
    console.log("connected");
}).catch((e)=>{
    console.log(e)
})

const app = express();
app.use(express.json());
app.use(authRouter);

const PORT = 3000;

app.listen(PORT,()=>{
    console.log('Connected at port ',PORT);
}); 



