import { Router } from "express";
import {metodos} from "../controller/controler.cita"
const rutacita = Router();

rutacita.get("/cita/:id", metodos.mostrarusuario);
rutacita.get("/cita",metodos.listarusuario);
rutacita.post("/cita", metodos.agregarusuario);
rutacita.put("/cita", metodos.modificarusuario);
rutacita.delete("/cita", metodos.eliminarusuario);


export default rutacita;
