let mysql = require("mysql");
let conexion = mysql.createConnection({
    host:"localhost",
    database:"votacionesdb",
    user:"root",
    password:""
});

conexion.connect(function(err){
if(err){
    throw err;

}
else {
    console.log("se logro la conexion");
}
});

const elecciones = "SELECT * FROM elecciones";
conexion.query(elecciones,function(error,listas){
    if(error){
        throw error;
    }else{
        console.log(listas);
        
    }
});

conexion.end();
