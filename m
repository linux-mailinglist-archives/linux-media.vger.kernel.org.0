Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AC53A275
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 01:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfFHX0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 19:26:01 -0400
Received: from mxc2.seznam.cz ([77.75.77.23]:53014 "EHLO mxc2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727528AbfFHX0B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 19:26:01 -0400
Received: from email.seznam.cz
        by email-smtpc4a.ng.seznam.cz (email-smtpc4a.ng.seznam.cz [10.23.10.105])
        id 0b08c64fdcb37f2a0ba0d888;
        Sun, 09 Jun 2019 01:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1560036357; bh=n4m06TLETRoRZ7K6IPvepBEJXUyf0pgUi/gJxbOPzSk=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         X-mailer:Content-type:Content-transfer-encoding:
         Content-description;
        b=U+oTrc1lhpLTsrwIwlF8q5PYF5LVgqmMQxLKngDMnou3XvzIOTsJLW32YRfrG6W0H
         C8bSJuSZCiYHP5VdOhHbd1MA4meT/swH5Oxs4RJy62gOzHswxwFdS4jsGIe7UhZNot
         ntRh5a0iLcoIGqUaqIEYR6BJlQFZCdWd9MELaO9E=
Received: from [192.168.12.172] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay9.ng.seznam.cz (Seznam SMTPD 1.3.106) with ESMTP;
        Sun, 09 Jun 2019 01:25:55 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Sun, 09 Jun 2019 01:25:53 +0200
MIME-Version: 1.0
Subject: [PATCH] dvb_usb_dvbsky: add support for Mygica T230C2
Message-ID: <5CFC4401.1017.2468FB6D@Frantisek.Rysanek.post.cz>
X-mailer: Pegasus Mail for Windows (4.63)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds support for the Mygica T230C2 into the "dvbsky" driver.
An addition is also needed in the "si2168" demodulator driver,
and a PCI ID in dvb-usb-ids.h .
Tested by patch author on a T230C2 and on a T230.
Tested by Frank Rysanek on a T230C2.
Applies cleanly against Linux 5.1.7.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
---

diff -uprN a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
--- a/drivers/media/dvb-frontends/si2168.c	2019-06-09 00:09:54.675000890 +0200
+++ b/drivers/media/dvb-frontends/si2168.c	2019-06-09 00:12:27.146467325 +0200
@@ -91,8 +91,17 @@ static int si2168_ts_bus_ctrl(struct dvb
 
 	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
 
+	/* set ts clock freq to 10Mhz */
+	memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
+	cmd.wlen = 6;
+	cmd.rlen = 4;
+	ret = si2168_cmd_execute(client, &cmd);
+	if (ret)
+		return ret;
+
 	/* set TS_MODE property */
-	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+	memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
+	cmd.args[4] = dev->ts_mode & 0x30;
 	if (acquire)
 		cmd.args[4] |= dev->ts_mode;
 	else
diff -uprN a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-06-09 00:09:57.423062211 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-06-08 23:53:36.323438801 +0200
@@ -560,6 +560,8 @@ static int dvbsky_mygica_t230c_attach(st
 	si2168_config.i2c_adapter = &i2c_adapter;
 	si2168_config.fe = &adap->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
+	if (d->udev->descriptor.idProduct == USB_PID_MYGICA_T230C2)
+		si2168_config.ts_mode |= 0x20;
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
--- a/include/media/dvb-usb-ids.h	2019-06-09 00:09:58.503086324 +0200
+++ b/include/media/dvb-usb-ids.h	2019-06-08 23:54:13.647616577 +0200
@@ -387,6 +387,7 @@
 #define USB_PID_MYGICA_D689				0xd811
 #define USB_PID_MYGICA_T230				0xc688
 #define USB_PID_MYGICA_T230C				0xc689
+#define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f
