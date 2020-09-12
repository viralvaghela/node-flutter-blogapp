const mongooes = require('mongoose');

const postScheme = new mongooes.Schema({
    title:{
        type:String,
        min:5,
        required:true
        
    },
    body:{
        type:String,
        min:5,
        max:5000,
        required:true
    },
    date:{
        type:Date,
        required:true
    }
});

module.exports = mongooes.model('Post',postScheme);