var exp=require('express')
var app=exp();
app.use(exp.static('scripts'));

var mysql=require('mysql2');

var con=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"root",
    database:"shoppingdb"
})

con.connect(function(err)
{
    if(!err)
    console.log("db connect")
    else
    console.log("db not connect")
})

app.get('/home',function(req,res){
    res.send("<h1>home page</h1>");

})

app.get('/userform',function(req,res){
    res.sendFile(__dirname+"/Ajax_using_jquery2.html")
})

app.get('/check',function(req,res){
    var a=req.query.userid;
    console.log(a);

    con.query('select * from users',function(err,result){
   // con.query("select * from users where u_id ='"+a+"'",function(err,result){
        if(!err)
        {
            flag=false;
            result.forEach(function(v){
                if(v.u_id==a)
                {
                    flag=true;
                }
            })
            if(result.length!=0)
                res.send("uid found")
            else
                res.send("uid not found")
        }
        else
        {
            console.log("error");
        }
    })
})
app.listen(9000,function(req,res){
    console.log("server started at 9000")
})

