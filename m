Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4C648FC52
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 12:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbiAPLaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 06:30:22 -0500
Received: from mcv99outg.rz.uni-leipzig.de ([139.18.1.195]:37371 "EHLO
        mcv99outg.rz.uni-leipzig.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbiAPLaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 06:30:21 -0500
Received: from mcv2outg.rz.uni-leipzig.de (mcv2outg.rz.uni-leipzig.de [139.18.1.194])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mcv99outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCMq0t7Tz11Hw
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 12:23:35 +0100 (CET)
Received: from v1.rz.uni-leipzig.de (v1.rz.uni-leipzig.de [139.18.1.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mcv2outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCMl3WvBz11QQ;
        Sun, 16 Jan 2022 12:23:31 +0100 (CET)
Received: from server1.rz.uni-leipzig.de (server1.rz.uni-leipzig.de [139.18.1.1])
        by v1.rz.uni-leipzig.de (Postfix) with ESMTPS id 6BAC121385;
        Sun, 16 Jan 2022 12:23:31 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (gg1.iat.uni-leipzig.de [141.39.226.97])
        by server1.rz.uni-leipzig.de (Postfix) with ESMTPS id 6EDA294003;
        Sun, 16 Jan 2022 12:23:29 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (localhost [127.0.0.1])
        by gg1.iat.uni-leipzig.de (Postfix) with ESMTP id 5645B840799;
        Sun, 16 Jan 2022 12:23:29 +0100 (CET)
Received: (from localhost) by gg1.iat.uni-leipzig.de (MSCAN) id 6/gg1.iat.uni-leipzig.de/smtp-gw/mscan; Sun Jan 16 12:23:29
     2022
From:   Michael Bunk <micha@freedict.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     vasilyev@ispras.ru, crope@iki.fi, Michael Bunk <micha@freedict.org>
Subject: [PATCH 2/4] media: dw2102: Don't translate i2c read into write
Date:   Sun, 16 Jan 2022 12:22:36 +0100
Message-Id: <20220116112238.74171-2-micha@freedict.org>
In-Reply-To: <20220116112238.74171-1-micha@freedict.org>
References: <20220116112238.74171-1-micha@freedict.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Score: 0.00
X-ExSBR-Direction: Incoming
X-Rspamd-UID: da8653
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code ignored the I2C_M_RD flag on I2C messages.  Instead it assumed
an i2c transaction with a single message must be a write operation and a
transaction with two messages would be a read operation.

Though this works for the driver code, it leads to problems once the i2c
device is exposed to code not knowing this convention.  For example,
I did "insmod i2c-dev" and issued read requests from userspace, which
were translated into write requests and destroyed the EEPROM of my
device.

So, just check and respect the I2C_M_READ flag, which indicates a read
when set on a message.  If it is absent, it is a write message.

Incidentally, changing from the case statement to a while loop allows
the code to lift the limitation to two i2c messages per transaction.

There are 4 more *_i2c_transfer functions affected by the same behaviour
and limitation that should be fixed in the same way.

Signed-off-by: Michael Bunk <micha@freedict.org>
---
 drivers/media/usb/dvb-usb/dw2102.c | 120 ++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 47 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-u=
sb/dw2102.c
index ca75ebdc10b3..60dd82f9dedc 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -692,6 +692,7 @@ static int su3000_i2c_transfer(struct i2c_adapter *ad=
ap, struct i2c_msg msg[],
 {
 	struct dvb_usb_device *d =3D i2c_get_adapdata(adap);
 	struct dw2102_state *state;
+	int j;
=20
 	if (!d)
 		return -ENODEV;
@@ -705,11 +706,11 @@ static int su3000_i2c_transfer(struct i2c_adapter *=
adap, struct i2c_msg msg[],
 		return -EAGAIN;
 	}
=20
-	switch (num) {
-	case 1:
-		switch (msg[0].addr) {
+	j =3D 0;
+	while (j < num) {
+		switch (msg[j].addr) {
 		case SU3000_STREAM_CTRL:
-			state->data[0] =3D msg[0].buf[0] + 0x36;
+			state->data[0] =3D msg[j].buf[0] + 0x36;
 			state->data[1] =3D 3;
 			state->data[2] =3D 0;
 			if (dvb_usb_generic_rw(d, state->data, 3,
@@ -721,61 +722,86 @@ static int su3000_i2c_transfer(struct i2c_adapter *=
adap, struct i2c_msg msg[],
 			if (dvb_usb_generic_rw(d, state->data, 1,
 					state->data, 2, 0) < 0)
 				err("i2c transfer failed.");
-			msg[0].buf[1] =3D state->data[0];
-			msg[0].buf[0] =3D state->data[1];
+			msg[j].buf[1] =3D state->data[0];
+			msg[j].buf[0] =3D state->data[1];
 			break;
 		default:
-			if (3 + msg[0].len > sizeof(state->data)) {
-				warn("i2c wr: len=3D%d is too big!\n",
-				     msg[0].len);
+			/* if the current write msg is followed by a another
+			 * read msg to/from the same address
+			 */
+			if ((j+1 < num) && (msg[j+1].flags & I2C_M_RD) &&
+			    (msg[j].addr =3D=3D msg[j+1].addr)) {
+				/* join both i2c msgs to one usb read command */
+				if (4 + msg[j].len > sizeof(state->data)) {
+					warn("i2c combined wr/rd: write len=3D%d is too big!\n",
+					    msg[j].len);
+					num =3D -EOPNOTSUPP;
+					break;
+				}
+				if (1 + msg[j+1].len > sizeof(state->data)) {
+					warn("i2c combined wr/rd: read len=3D%d is too big!\n",
+					    msg[j+1].len);
+					num =3D -EOPNOTSUPP;
+					break;
+				}
+
+				state->data[0] =3D 0x09;
+				state->data[1] =3D msg[j].len;
+				state->data[2] =3D msg[j+1].len;
+				state->data[3] =3D msg[j].addr;
+				memcpy(&state->data[4], msg[j].buf, msg[j].len);
+
+				if (dvb_usb_generic_rw(d, state->data, msg[j].len + 4,
+					state->data, msg[j+1].len + 1, 0) < 0)
+					err("i2c transfer failed.");
+
+				memcpy(msg[j+1].buf, &state->data[1], msg[j+1].len);
+				j++;
+				break;
+			}
+
+			if (msg[j].flags & I2C_M_RD) {
+				/* single read */
+				if (1 + msg[j].len > sizeof(state->data)) {
+					warn("i2c rd: len=3D%d is too big!\n", msg[j].len);
+					num =3D -EOPNOTSUPP;
+					break;
+				}
+
+				state->data[0] =3D 0x09;
+				state->data[1] =3D 0;
+				state->data[2] =3D msg[j].len;
+				state->data[3] =3D msg[j].addr;
+				memcpy(&state->data[4], msg[j].buf, msg[j].len);
+
+				if (dvb_usb_generic_rw(d, state->data, 4,
+					state->data, msg[j].len + 1, 0) < 0)
+					err("i2c transfer failed.");
+
+				memcpy(msg[j].buf, &state->data[1], msg[j].len);
+				break;
+			}
+
+			/* single write */
+			if (3 + msg[j].len > sizeof(state->data)) {
+				warn("i2c wr: len=3D%d is too big!\n", msg[j].len);
 				num =3D -EOPNOTSUPP;
 				break;
 			}
=20
-			/* always i2c write*/
 			state->data[0] =3D 0x08;
-			state->data[1] =3D msg[0].addr;
-			state->data[2] =3D msg[0].len;
+			state->data[1] =3D msg[j].addr;
+			state->data[2] =3D msg[j].len;
=20
-			memcpy(&state->data[3], msg[0].buf, msg[0].len);
+			memcpy(&state->data[3], msg[j].buf, msg[j].len);
=20
-			if (dvb_usb_generic_rw(d, state->data, msg[0].len + 3,
+			if (dvb_usb_generic_rw(d, state->data, msg[j].len + 3,
 						state->data, 1, 0) < 0)
 				err("i2c transfer failed.");
+		} // switch
+		j++;
=20
-		}
-		break;
-	case 2:
-		/* always i2c read */
-		if (4 + msg[0].len > sizeof(state->data)) {
-			warn("i2c rd: len=3D%d is too big!\n",
-			     msg[0].len);
-			num =3D -EOPNOTSUPP;
-			break;
-		}
-		if (1 + msg[1].len > sizeof(state->data)) {
-			warn("i2c rd: len=3D%d is too big!\n",
-			     msg[1].len);
-			num =3D -EOPNOTSUPP;
-			break;
-		}
-
-		state->data[0] =3D 0x09;
-		state->data[1] =3D msg[0].len;
-		state->data[2] =3D msg[1].len;
-		state->data[3] =3D msg[0].addr;
-		memcpy(&state->data[4], msg[0].buf, msg[0].len);
-
-		if (dvb_usb_generic_rw(d, state->data, msg[0].len + 4,
-					state->data, msg[1].len + 1, 0) < 0)
-			err("i2c transfer failed.");
-
-		memcpy(msg[1].buf, &state->data[1], msg[1].len);
-		break;
-	default:
-		warn("more than 2 i2c messages at a time is not handled yet.");
-		break;
-	}
+	} // while
 	mutex_unlock(&d->data_mutex);
 	mutex_unlock(&d->i2c_mutex);
 	return num;
--=20
2.34.1

