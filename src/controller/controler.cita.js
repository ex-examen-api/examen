import pool from "../db/db";
import mensaje from "../res/mesa"
import { config } from "dotenv";
config();
// mostrar uno solo
const mostrarusuario =async(req, res)=>{
    const id= req.params.id;
    try {
        const respuesta = await pool.query(`CALL sp_mostrar_cita(${id})`)
        mensaje.success(req, res, 200, respuesta[0])
    } catch (error) {
        mensaje.error(req, res,500, error);
    }
};
const listarusuario =async(req, res)=>{
    try {
        const respuesta = await pool.query(`CALL sp_listar_cita();`)
        mensaje.success(req, res, 200, respuesta[0]);
    } catch (error) {
        mensaje.error(req, res, error);
    }
};
const agregarusuario = async(req, res)=>{
    const {citas} = req.body;
    try {
        const respuesta = await pool.query(`CALL sp_agregar_cita(?);`,[citas]);
        if (respuesta[0].affectedRows==1) {
            mensaje.success(req, res, 200, "usuario creado");
        }else{
            mensaje.error(req, res, 400, "usuario no creado");
        }
    } catch (error) {
        mensaje.error(req, res,500, error);
    }
};
const modificarusuario =async(req, res)=>{
    const   {idcita, citas} = req.body;
    try {
        const respuesta = await pool.query(`CALL sp_modificar_cita(?,?);`,[idcita, citas]);
        if (respuesta[0].affectedRows==1) {
            mensaje.success(req, res, 200, "usuario modificado");
        }else{
            mensaje.error(req, res, 400, "usuario no modificado");
        }
    } catch (error) {
        mensaje.error(req, res,500, error);
    }
};
const eliminarusuario =async(req, res)=>{
    const {id} = req.body;
    try {
        const respuesta = await pool.query(`CALL sp_eliminar_cita(?);`,[id]);
        if (respuesta[0].affectedRows==1 ){
            mensaje.success(req,res,200, "usuario elimindo");
        } else {
            mensaje.error(req, res, 500, "usuario no eliminado")
        }
    } catch (error) {
        mensaje.error(req, res,500, error);
    }
};

export const  metodos = {
    mostrarusuario,
    listarusuario,
    agregarusuario,
    modificarusuario,
    eliminarusuario
}