var exp=require('express');
var bp=require('body-parser');

var app=exp();
app.use(bp.urlencoded({extended:false}))


app.get('/getform',function(req,res){
    res.sendFile(__dirname+"/getform.html");
})


app.post('/getDataTable',function(req,res){
    var myname = req.body.name;
    var mybdate = req.body.bdate;
    var myemail = req.body.emailid;
    var myquali = req.body.qualification;
    var str = "";
    str += "<table border=1 > ";
    str += "<tr>";
    str += "<td>" + myname + "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td>" + mybdate + "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td>" + myemail + "</td>";
    str += "</tr>";
    str += "<tr>";
    str += "<td>" + myquali + "</td>";
    str += "</tr>";
    str += "</table>";
    res.send(str);
});




app.listen(9000,function(){
    console.log('server started at 9000')
})