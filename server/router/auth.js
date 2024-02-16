const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

const authrouter = express.Router();

authrouter.post('/api/signup', async (req, resp) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });

        if (existingUser) {
            return resp.status(400).json({ msg: "Email already exists" });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            name,
            email,
            password: hashedPassword
        })

        user = await user.save();
        resp.json(user);
    }catch(e){
        resp.status(500).json({
            error: e.message
        });
    }
})

authrouter.post('/api/signin', async(req, resp)=>{
    try{
        const {email, password} = req.body;
        const user = await User.findOne({ email });
        
        if(!user){
            return resp.status(400).json({msg: 'Email does not exists!'});
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if(!isMatch){
            return resp.status(400).json({msg: 'Incorrect Password.'});
        }

        const token = jwt.sign({id: user._id}, "passwordkey");
        resp.json({token, ...user._doc});

    }catch(e){
        resp.status(500).json({
            error: e.message
        });
    }
})

module.exports = authrouter;