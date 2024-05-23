import express from 'express';
import { config } from 'dotenv';
import ruta from './routes';


config();
const app = express();



app.use(express.json());
// inicializador
app.set("port", process.env.PORT);
// ruras

app.use("/",ruta);
export default app;