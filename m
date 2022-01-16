Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C53548FC53
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 12:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiAPLa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 06:30:28 -0500
Received: from mcv99outg.rz.uni-leipzig.de ([139.18.1.195]:35939 "EHLO
        mcv99outg.rz.uni-leipzig.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234901AbiAPLa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 06:30:27 -0500
Received: from mcv2outg.rz.uni-leipzig.de (mcv2outg.rz.uni-leipzig.de [139.18.1.194])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mcv99outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCN32ZSMz11JT
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 12:23:47 +0100 (CET)
Received: from v1.rz.uni-leipzig.de (v1.rz.uni-leipzig.de [139.18.1.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mcv2outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCN22Pc4z11Q9;
        Sun, 16 Jan 2022 12:23:46 +0100 (CET)
Received: from server1.rz.uni-leipzig.de (server1.rz.uni-leipzig.de [139.18.1.1])
        by v1.rz.uni-leipzig.de (Postfix) with ESMTPS id 5112D205F2;
        Sun, 16 Jan 2022 12:23:46 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (gg1.iat.uni-leipzig.de [141.39.226.97])
        by server1.rz.uni-leipzig.de (Postfix) with ESMTPS id 5D1D394003;
        Sun, 16 Jan 2022 12:23:44 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (localhost [127.0.0.1])
        by gg1.iat.uni-leipzig.de (Postfix) with ESMTP id 5608284079B;
        Sun, 16 Jan 2022 12:23:44 +0100 (CET)
Received: (from localhost) by gg1.iat.uni-leipzig.de (MSCAN) id 6/gg1.iat.uni-leipzig.de/smtp-gw/mscan; Sun Jan 16 12:23:44
     2022
From:   Michael Bunk <micha@freedict.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     vasilyev@ispras.ru, crope@iki.fi, Michael Bunk <micha@freedict.org>
Subject: [PATCH 4/4] media: dw2102: Fix minor issues
Date:   Sun, 16 Jan 2022 12:22:38 +0100
Message-Id: <20220116112238.74171-4-micha@freedict.org>
In-Reply-To: <20220116112238.74171-1-micha@freedict.org>
References: <20220116112238.74171-1-micha@freedict.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Score: 0.00
X-ExSBR-Direction: Incoming
X-Rspamd-UID: 3b06fc
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found by checkpatch.

Signed-off-by: Michael Bunk <micha@freedict.org>
---
 drivers/media/usb/dvb-usb/dw2102.c | 106 +++++++++++++++--------------
 1 file changed, 56 insertions(+), 50 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-u=
sb/dw2102.c
index 165d72d6d712..79a6675877a2 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -53,10 +53,10 @@
 #define DW2102_FIRMWARE "dvb-usb-dw2102.fw"
 #define DW2104_FIRMWARE "dvb-usb-dw2104.fw"
 #define DW3101_FIRMWARE "dvb-usb-dw3101.fw"
-#define S630_FIRMWARE   "dvb-usb-s630.fw"
-#define S660_FIRMWARE   "dvb-usb-s660.fw"
-#define P1100_FIRMWARE  "dvb-usb-p1100.fw"
-#define P7500_FIRMWARE  "dvb-usb-p7500.fw"
+#define S630_FIRMWARE	"dvb-usb-s630.fw"
+#define S660_FIRMWARE	"dvb-usb-s660.fw"
+#define P1100_FIRMWARE	"dvb-usb-p1100.fw"
+#define P7500_FIRMWARE	"dvb-usb-p7500.fw"
=20
 #define	err_str "did not find the firmware file '%s'. You can use <kerne=
l_dir>/scripts/get_dvb_firmware to get the firmware"
=20
@@ -87,7 +87,7 @@ MODULE_PARM_DESC(demod, "demod to probe (1=3Dcx24116 2=3D=
stv0903+stv6110 4=3Dstv0903+s
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
=20
 static int dw210x_op_rw(struct usb_device *dev, u8 request, u16 value,
-			u16 index, u8 * data, u16 len, int flags)
+			u16 index, u8 *data, u16 len, int flags)
 {
 	int ret;
 	u8 *u8buf;
@@ -103,7 +103,7 @@ static int dw210x_op_rw(struct usb_device *dev, u8 re=
quest, u16 value,
 	if (flags =3D=3D DW210X_WRITE_MSG)
 		memcpy(u8buf, data, len);
 	ret =3D usb_control_msg(dev, pipe, request, request_type | USB_TYPE_VEN=
DOR,
-				value, index , u8buf, len, 2000);
+				value, index, u8buf, len, 2000);
=20
 	if (flags =3D=3D DW210X_READ_MSG)
 		memcpy(data, u8buf, len);
@@ -298,7 +298,7 @@ static int dw2102_earda_i2c_transfer(struct i2c_adapt=
er *adap, struct i2c_msg ms
 		dw210x_op_rw(d->udev, 0xc2, 0, 0,
 				obuf, msg[0].len + 2, DW210X_WRITE_MSG);
 		/* second read registers */
-		dw210x_op_rw(d->udev, 0xc3, 0xd1 , 0,
+		dw210x_op_rw(d->udev, 0xc3, 0xd1, 0,
 				ibuf, msg[1].len + 2, DW210X_READ_MSG);
 		memcpy(msg[1].buf, ibuf + 2, msg[1].len);
=20
@@ -344,13 +344,15 @@ static int dw2102_earda_i2c_transfer(struct i2c_ada=
pter *adap, struct i2c_msg ms
 		}
 		case(DW2102_RC_QUERY): {
 			u8 ibuf[2];
+
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 					ibuf, 2, DW210X_READ_MSG);
-			memcpy(msg[0].buf, ibuf , 2);
+			memcpy(msg[0].buf, ibuf, 2);
 			break;
 		}
 		case(DW2102_VOLTAGE_CTRL): {
 			u8 obuf[2];
+
 			obuf[0] =3D 0x30;
 			obuf[1] =3D msg[0].buf[0];
 			dw210x_op_rw(d->udev, 0xb2, 0, 0,
@@ -382,23 +384,26 @@ static int dw2104_i2c_transfer(struct i2c_adapter *=
adap, struct i2c_msg msg[], i
 		switch (msg[j].addr) {
 		case(DW2102_RC_QUERY): {
 			u8 ibuf[2];
+
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 					ibuf, 2, DW210X_READ_MSG);
-			memcpy(msg[j].buf, ibuf , 2);
+			memcpy(msg[j].buf, ibuf, 2);
 			break;
 		}
 		case(DW2102_VOLTAGE_CTRL): {
 			u8 obuf[2];
+
 			obuf[0] =3D 0x30;
 			obuf[1] =3D msg[j].buf[0];
 			dw210x_op_rw(d->udev, 0xb2, 0, 0,
 					obuf, 2, DW210X_WRITE_MSG);
 			break;
 		}
-		/*case 0x55: cx24116
-		case 0x6a: stv0903
-		case 0x68: ds3000, stv0903
-		case 0x60: ts2020, stv6110, stb6100 */
+		/* case 0x55: cx24116
+		 * case 0x6a: stv0903
+		 * case 0x68: ds3000, stv0903
+		 * case 0x60: ts2020, stv6110, stb6100
+		 */
 		default: {
 			if (msg[j].flags =3D=3D I2C_M_RD) {
 				/* read registers */
@@ -423,6 +428,7 @@ static int dw2104_i2c_transfer(struct i2c_adapter *ad=
ap, struct i2c_msg msg[], i
 						(msg[j].addr =3D=3D 0x55))) {
 				/* write firmware */
 				u8 obuf[19];
+
 				obuf[0] =3D msg[j].addr << 1;
 				obuf[1] =3D (msg[j].len > 15 ? 17 : msg[j].len);
 				obuf[2] =3D msg[j].buf[0];
@@ -503,7 +509,7 @@ static int dw3101_i2c_transfer(struct i2c_adapter *ad=
ap, struct i2c_msg msg[],
 		dw210x_op_rw(d->udev, 0xc2, 0, 0,
 				obuf, msg[0].len + 2, DW210X_WRITE_MSG);
 		/* second read registers */
-		dw210x_op_rw(d->udev, 0xc3, 0x19 , 0,
+		dw210x_op_rw(d->udev, 0xc3, 0x19, 0,
 				ibuf, msg[1].len + 2, DW210X_READ_MSG);
 		memcpy(msg[1].buf, ibuf + 2, msg[1].len);
=20
@@ -531,9 +537,10 @@ static int dw3101_i2c_transfer(struct i2c_adapter *a=
dap, struct i2c_msg msg[],
 		}
 		case(DW2102_RC_QUERY): {
 			u8 ibuf[2];
+
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 					ibuf, 2, DW210X_READ_MSG);
-			memcpy(msg[0].buf, ibuf , 2);
+			memcpy(msg[0].buf, ibuf, 2);
 			break;
 		}
 		}
@@ -570,6 +577,7 @@ static int s6x0_i2c_transfer(struct i2c_adapter *adap=
, struct i2c_msg msg[],
 		switch (msg[j].addr) {
 		case (DW2102_RC_QUERY): {
 			u8 ibuf[5];
+
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 					ibuf, 5, DW210X_READ_MSG);
 			memcpy(msg[j].buf, ibuf + 3, 2);
@@ -597,11 +605,12 @@ static int s6x0_i2c_transfer(struct i2c_adapter *ad=
ap, struct i2c_msg msg[],
 					obuf, 2, DW210X_WRITE_MSG);
 			break;
 		}
-		/*case 0x55: cx24116
-		case 0x6a: stv0903
-		case 0x68: ds3000, stv0903, rs2000
-		case 0x60: ts2020, stv6110, stb6100
-		case 0xa0: eeprom */
+		/* case 0x55: cx24116
+		 * case 0x6a: stv0903
+		 * case 0x68: ds3000, stv0903, rs2000
+		 * case 0x60: ts2020, stv6110, stb6100
+		 * case 0xa0: eeprom
+		 */
 		default: {
 			if (msg[j].flags =3D=3D I2C_M_RD) {
 				/* read registers */
@@ -623,6 +632,7 @@ static int s6x0_i2c_transfer(struct i2c_adapter *adap=
, struct i2c_msg msg[],
 						(msg[j].addr =3D=3D 0x68)) {
 				/* write firmware */
 				u8 obuf[19];
+
 				obuf[0] =3D (msg[j].len > 16 ?
 						18 : msg[j].len + 1);
 				obuf[1] =3D msg[j].addr << 1;
@@ -854,13 +864,13 @@ static int dw210x_read_mac_address(struct dvb_usb_d=
evice *d, u8 mac[6])
 	u8 eeprom[256], eepromline[16];
=20
 	for (i =3D 0; i < 256; i++) {
-		if (dw210x_op_rw(d->udev, 0xb6, 0xa0 , i, ibuf, 2, DW210X_READ_MSG) < =
0) {
+		if (dw210x_op_rw(d->udev, 0xb6, 0xa0, i, ibuf, 2, DW210X_READ_MSG) < 0=
) {
 			err("read eeprom failed.");
 			return -1;
-		} else {
-			eepromline[i%16] =3D ibuf[0];
-			eeprom[i] =3D ibuf[0];
 		}
+		eepromline[i%16] =3D ibuf[0];
+		eeprom[i] =3D ibuf[0];
+
 		if ((i % 16) =3D=3D 15) {
 			deb_xfer("%02x: ", i - 15);
 			debug_dump(eepromline, 16, deb_xfer);
@@ -896,11 +906,11 @@ static int s6x0_read_mac_address(struct dvb_usb_dev=
ice *d, u8 mac[6])
 		if (ret !=3D 2) {
 			err("read eeprom failed.");
 			return -1;
-		} else {
-			eepromline[i % 16] =3D ibuf[0];
-			eeprom[i] =3D ibuf[0];
 		}
=20
+		eepromline[i % 16] =3D ibuf[0];
+		eeprom[i] =3D ibuf[0];
+
 		if ((i % 16) =3D=3D 15) {
 			deb_xfer("%02x: ", i - 15);
 			debug_dump(eepromline, 16, deb_xfer);
@@ -973,8 +983,7 @@ static int su3000_read_mac_address(struct dvb_usb_dev=
ice *d, u8 mac[6])
 		obuf[1] =3D 0xf0 + i;
 		if (i2c_transfer(&d->i2c_adap, msg, 2) !=3D 2)
 			break;
-		else
-			mac[i] =3D ibuf[0];
+		mac[i] =3D ibuf[0];
 	}
=20
 	return 0;
@@ -985,8 +994,6 @@ static int su3000_identify_state(struct usb_device *u=
dev,
 				 const struct dvb_usb_device_description **desc,
 				 int *cold)
 {
-	info("%s", __func__);
-
 	*cold =3D 0;
 	return 0;
 }
@@ -1346,7 +1353,7 @@ static int stv0288_frontend_attach(struct dvb_usb_a=
dapter *d)
 	if (d->fe_adap[0].fe =3D=3D NULL)
 		return -EIO;
=20
-	if (NULL =3D=3D dvb_attach(stb6000_attach, d->fe_adap[0].fe, 0x61, &d->=
dev->i2c_adap))
+	if (dvb_attach(stb6000_attach, d->fe_adap[0].fe, 0x61, &d->dev->i2c_ada=
p) =3D=3D NULL)
 		return -EIO;
=20
 	d->fe_adap[0].fe->ops.set_voltage =3D dw210x_set_voltage;
@@ -1889,7 +1896,7 @@ static int dw2102_load_firmware(struct usb_device *=
dev,
 		memcpy(p, fw->data, fw->size);
 		for (i =3D 0; i < fw->size; i +=3D 0x40) {
 			b =3D (u8 *) p + i;
-			if (dw210x_op_rw(dev, 0xa0, i, 0, b , 0x40,
+			if (dw210x_op_rw(dev, 0xa0, i, 0, b, 0x40,
 					DW210X_WRITE_MSG) !=3D 0x40) {
 				err("error while transferring firmware");
 				ret =3D -EINVAL;
@@ -1936,19 +1943,18 @@ static int dw2102_load_firmware(struct usb_device=
 *dev,
 				dw2102_properties.i2c_algo =3D &dw2102_i2c_algo;
 				dw2102_properties.adapter->fe[0].tuner_attach =3D &dw2102_tuner_atta=
ch;
 				break;
-			} else {
-				/* check STV0288 frontend  */
-				reset16[0] =3D 0xd0;
-				reset16[1] =3D 1;
-				reset16[2] =3D 0;
-				dw210x_op_rw(dev, 0xc2, 0, 0, &reset16[0], 3,
-						DW210X_WRITE_MSG);
-				dw210x_op_rw(dev, 0xc3, 0xd1, 0, &reset16[0], 3,
-						DW210X_READ_MSG);
-				if (reset16[2] =3D=3D 0x11) {
-					dw2102_properties.i2c_algo =3D &dw2102_earda_i2c_algo;
-					break;
-				}
+			}
+			/* check STV0288 frontend  */
+			reset16[0] =3D 0xd0;
+			reset16[1] =3D 1;
+			reset16[2] =3D 0;
+			dw210x_op_rw(dev, 0xc2, 0, 0, &reset16[0], 3,
+					DW210X_WRITE_MSG);
+			dw210x_op_rw(dev, 0xc3, 0xd1, 0, &reset16[0], 3,
+					DW210X_READ_MSG);
+			if (reset16[2] =3D=3D 0x11) {
+				dw2102_properties.i2c_algo =3D &dw2102_earda_i2c_algo;
+				break;
 			}
 			fallthrough;
 		case 0x2101:
@@ -2575,15 +2581,15 @@ static int dw2102_probe(struct usb_interface *int=
f,
 		const struct usb_device_id *id)
 {
 	if (!(dvb_usb_device_init(intf, &dw2102_properties,
-			          THIS_MODULE, NULL, adapter_nr) &&
+				  THIS_MODULE, NULL, adapter_nr) &&
 	      dvb_usb_device_init(intf, &dw2104_properties,
 				  THIS_MODULE, NULL, adapter_nr) &&
 	      dvb_usb_device_init(intf, &dw3101_properties,
-			          THIS_MODULE, NULL, adapter_nr) &&
+				  THIS_MODULE, NULL, adapter_nr) &&
 	      dvb_usb_device_init(intf, &s6x0_properties,
-			          THIS_MODULE, NULL, adapter_nr) &&
+				  THIS_MODULE, NULL, adapter_nr) &&
 	      dvb_usb_device_init(intf, &p1100_properties,
-			          THIS_MODULE, NULL, adapter_nr) &&
+				  THIS_MODULE, NULL, adapter_nr) &&
 	      dvb_usb_device_init(intf, &s660_properties,
 				  THIS_MODULE, NULL, adapter_nr) &&
 	      dvb_usb_device_init(intf, &p7500_properties,
--=20
2.34.1

