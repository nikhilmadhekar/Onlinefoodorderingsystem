var exp=require('express');
var app=exp();
var path=require('path');
app.use(exp.static(path.join(__dirname,'Ajax')))

var mysql=require('mysql2');
var con=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"root",
    database:"dac"
})

con.connect(function(err){
    if(!err)
    console.log("db connect")
    else
    console.log("db not connect")
})


app.get('/home',function(req,res){
    res.send("<h1>welcome home page</h1>")
})

app.get('/empform',function(req,res){
    res.sendFile(__dirname+"/empformJAVAS.html")
})

app.get('/getname',function(req,res){
    var eid=req.query.empid;
    console.log(eid);

    con.query('select * from student where roll='+eid,function(err,result){
        if(!err)
        {
            str="";
            str+="<h1>";
            console.log("in if"+result.length);
            str+="welcome"+result[0].name
            str+="</h1>";
            console.log(str);
            res.send(str);
        }
    })
})

app.listen(9000,function(req,res){
    console.log("server started at 9000")  
})