const jwt = require('jsonwebtoken');

const auth = async(req, resp, next)=>{
    try{
        const token = req.header('x-auth-token');
        if(!token){
            return resp.status(401).json({msg: "Token not found, access denied."});
        }

        const verified = await jwt.verify(token, 'passwordkey');

        if(!verified){
            return resp.status(401).json({msg: "Token is not valid, access denied."});
        }

        req.user = verified.id;
        req.token = token;
        next();
    }catch(e){
        return resp.status(500).json({error: e.message});
    }
}

module.exports = auth;