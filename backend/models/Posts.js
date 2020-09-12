const mongooes = require('mongoose');

const postScheme = new mongooes.Schema({
    title:{
        type:String,
        min:5,
        
        
    },
    body:{
        type:String,
        min:5,
        max:5000,
       
    },
    date:{
        type:Date,
        
    }
});

module.exports = mongooes.model('Post',postScheme);