import { Router } from "express";
import rutacita from "./ruta.cita";

const ruta = Router();

ruta.use("/api",rutacita);

export default ruta;


