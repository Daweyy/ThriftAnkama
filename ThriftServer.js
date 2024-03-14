import { TBinaryProtocol, TBufferedTransport, createServer } from "thrift";
import ZaapService from "./gen-nodejs/ZaapService.js";

const ZaapHandler = {
	connect: (gameName, releaseName, instanceId, hash, result) => {
		console.log(`[connect] ${gameName}/${releaseName} ${instanceId} ${hash}`);
		result(null, "random_token");
	},
	hasPremiumAccess: (gameSession, result) => {
		console.log(`[hasPremiumAccess] ${gameSession}`);
		result(null, "true"); // YOLO (°~°)
	},
	userInfo_get: (gameSession, result) => {
		console.log(`[userInfo_get] ${gameSession}`);
		result(null, '{"nickname":"[ANKAMA]","tag":0}');
	},
};

const serverOptions = {
	protocol: TBinaryProtocol,
	transport: TBufferedTransport,
};

const PORT = process.env.PORT || 26116; // Set the same port as in credentials.json in your game folder

createServer(ZaapService, ZaapHandler, serverOptions)
	.on("error", (error) => {
		console.log(error);
	})
	.listen(PORT);
console.log(`Thrift Server running on port: ${PORT}`);
