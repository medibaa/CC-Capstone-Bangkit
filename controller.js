'use strict'
var conne= require('./connection')
var md5 = require('md5')
const { nanoid } = require('nanoid')


exports.index= function(req, res){
    res.status(200).json({
        success: true,
        message: 'My REST API works'
    })
}

exports.showUserDataHistory = function(req, res){
    conne.query('select * from user', function(error, rows, fields){
        res.send(
            {status:200, 
            error: false, 
            rows})
    })
};

exports.profileUserId = function (req, res) {
    let id = req.params.id

    conne.query('select * from user where id_user = ?', [id], function (error, rows) {
        
        res.send(
            {status:200, 
            error: false, 
            profile: ({
                data:rows
            })
            }
        )
    });
};

//delete with params(OK)
exports.deleteUser = function (req, res) {
    let id = req.params.id

    conne.query('delete from user where id_user = ?', [id], function (error, rows) {
        if (!error) {
            
            res.send(
                {status:200, 
                error: true, 
                message: 'Success deletes id = '+id
                }
            )
        } else if (error) {
            res.send(
                {status:500, 
                error: false, 
                message: 'Fail deletes id'
                }
            )
        }
    });
};

//update with params(OK)
exports.editProfile= function (req, res){
    //let id= req.body.id;
    let id = req.params.id
    let username=req.body.username;
   // let password=md5(req.body.password);
    let email=req.body.email;
    //let full_name=req.body.full_name;
    let birth_date=req.body.birth_date;
    let birth_place=req.body.birth_place;
    let phone_number=req.body.phone_number;

    conne.query('update user set username = ?, email = ?, birth_date = ?, birth_place = ?,  phone_number=?  where id_user = ?',
    [username, email, birth_date, birth_place, phone_number,id ], 
        function (error, rows, fields){
            if (error){
                res.send(
                    {status:500, 
                    error: true, 
                    message: 'Fail updates id'
                    }
                )
            } else if (!error) {                
                res.send(
                    {status:200, 
                    error: true, 
                    message: 'Success updates id = '+id
                    }
                )
            }
        }
    )
}

exports.addUser = function(req, res){
    var email = req.body.email
    var id  = nanoid(16)
    var username =req.body.username
    var password = md5(req.body.password)
    var phone_number = req.body.phone_number
    var birth_date=req.body.birth_date
    var birth_place=req.body.birth_place 
    conne.query('select email from user where email = ?',email, function (error, rows) {
        if (rows.length == 1){
            res.send({
                status:400,
                error: true,
                message: 'Email has been taken. Try with another email'
            })
        } else if(rows.length == 0){
            let values =[id, email, username, password, phone_number, birth_date, birth_place] 
            conne.query('insert into user (id_user, email, username, password, phone_number, birth_date, birth_place) values (?,?,?,?,?,?,?)', values, function(error, rows, fields){
                if(error){
                    res.send(
                        {status:500, 
                        error: true, 
                        error
                        }
                    )
                }else{
                    res.send({
                        status:200,
                        error: false,
                        message: 'Email registered successfully'
                    })
                }
            })
        }
    })
}

