Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4DA3A475
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 11:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfFIJVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 05:21:21 -0400
Received: from mxc1.seznam.cz ([77.75.79.23]:10248 "EHLO mxc1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727720AbfFIJVV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 9 Jun 2019 05:21:21 -0400
Received: from email.seznam.cz
        by email-smtpc5b.ko.seznam.cz (email-smtpc5b.ko.seznam.cz [10.53.13.135])
        id 73d856aea463efcb73704869;
        Sun, 09 Jun 2019 11:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1560072079; bh=gZQOLKY9rZuZs5aDMkl4yTwb48f8HDwgg0p12BSVRDs=;
        h=Received:From:To:Date:MIME-Version:Subject:CC:Message-ID:Priority:
         X-mailer:Content-type:Content-transfer-encoding:
         Content-description;
        b=EovEmYhM1n9pb7U4RZlbvsjlSK3T+Nhbq6Ejoj1SMUC3L1Cx6hl3Kfp+6wsBq1eQj
         gVY5vR2M2O8byzL7EywK9nSZDyZ1ZJETk6XMxr6fEEF/5CAdPaZeJ9oiibjjI64yz6
         ovI8I10Ylb4RzD5JNE14Hg99N5mLr5KY6YD4Eus4=
Received: from [192.168.12.172] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay2.ko.seznam.cz (Seznam SMTPD 1.3.106) with ESMTP;
        Sun, 09 Jun 2019 11:21:17 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Sun, 09 Jun 2019 11:21:14 +0200
MIME-Version: 1.0
Subject: [PATCH v3] dvb_usb_dvbsky: add support for Mygica T230C2
CC:     jp@jpvw.nl
Message-ID: <5CFCCF8A.26152.268A0BEC@Frantisek.Rysanek.post.cz>
X-mailer: Pegasus Mail for Windows (4.63)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds support for the Mygica T230C2 into the "dvbsky" driver.
A small enhancement is also needed in the "si2168" demodulator driver,
and a USB device ID in dvb-usb-ids.h .

The T230C2 hardware uses a manual clock mode of the si2168 chip,
for which the si2168 driver previously had no explicit support.
And, the frequency manually configured is 10 MHz.
This patch uses a specific measure to only configure this
on the T230C2 hardware - see the flag passed via the ts_mode attribute
and its dependency on USB_PID_MYGICA_T230C2 .

This is v3 of the proposed patch, based on feedback from Sean Young.
Tested by patch author on a T230C2 and on a T230.
Tested by Frank Rysanek on a T230C2: can tune into locally
available DVB-T and DVB-T2 muxes, video and audio playback works.
Applies cleanly against Linux 5.1.7.
Checkpatch.pl warns about 1 line longer than 80 characters. Ahh well.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
---

diff -uprN a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
--- a/drivers/media/dvb-frontends/si2168.c	2019-06-09 10:47:30.353289411 +0200
+++ b/drivers/media/dvb-frontends/si2168.c	2019-06-09 10:48:18.849568333 +0200
@@ -91,8 +91,18 @@ static int si2168_ts_bus_ctrl(struct dvb
 
 	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
 
+	/* set ts clock freq to 10Mhz */
+	if (dev->ts_mode | SI2168_TS_CLOCK_MANUAL) {
+		memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2168_cmd_execute(client, &cmd);
+		if (ret)
+			return ret;
+	}
 	/* set TS_MODE property */
-	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+	memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
+	cmd.args[4] = dev->ts_mode & (SI2168_TS_CLOCK_AUTO|SI2168_TS_CLOCK_MANUAL);
 	if (acquire)
 		cmd.args[4] |= dev->ts_mode;
 	else
diff -uprN a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
--- a/drivers/media/dvb-frontends/si2168.h	2019-06-09 10:47:30.813292446 +0200
+++ b/drivers/media/dvb-frontends/si2168.h	2019-06-09 10:01:29.200647903 +0200
@@ -39,6 +39,8 @@ struct si2168_config {
 #define SI2168_TS_PARALLEL	0x06
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
+#define SI2168_TS_CLOCK_AUTO	0x10
+#define SI2168_TS_CLOCK_MANUAL	0x20
 	u8 ts_mode;
 
 	/* TS clock inverted */
diff -uprN a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-06-09 10:47:31.169294788 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-06-09 10:01:29.204647956 +0200
@@ -560,6 +560,8 @@ static int dvbsky_mygica_t230c_attach(st
 	si2168_config.i2c_adapter = &i2c_adapter;
 	si2168_config.fe = &adap->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2)
+		si2168_config.ts_mode |= SI2168_TS_CLOCK_MANUAL;
 	si2168_config.ts_clock_inv = 1;
 
 	state->i2c_client_demod = dvb_module_probe("si2168", NULL,
@@ -799,6 +801,9 @@ static const struct usb_device_id dvbsky
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
+		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C2",
+		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
diff -uprN a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
--- a/include/media/dvb-usb-ids.h	2019-06-09 10:47:31.521297095 +0200
+++ b/include/media/dvb-usb-ids.h	2019-06-09 10:01:29.204647956 +0200
@@ -387,6 +387,7 @@
 #define USB_PID_MYGICA_D689				0xd811
 #define USB_PID_MYGICA_T230				0xc688
 #define USB_PID_MYGICA_T230C				0xc689
+#define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f
