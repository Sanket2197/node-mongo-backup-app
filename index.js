const scheduleTz = require("node-schedule-tz");
const {exec} = require("child_process");

const frequency = "*/1 * * * *";
const timezone = "Asia/Kolkata";

scheduleTz.scheduleJob("node-mongo-backup-app",frequency,timezone,()=>{
    const startTime = new Date();
    console.log("Mongo Backup Start...@:-" ,new Date());

    exec("sh ./scripts/backup_mongo.sh",(error,stdout,stderr)=>{
        if(error!==null){
            console.log(error);
        }

        console.log("Mongo Backup End...@:-",new Date());
    })

})