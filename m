Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A74C8AA8
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfJBOON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:14:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41925 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJBOOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:14:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id q9so1075730wrm.8;
        Wed, 02 Oct 2019 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1NOrxGO9sDfoAK9z5f8PBvguSPeKYle0P3g3YxqTBJ0=;
        b=WZ+qOh6eqMP3twz0vO+H1aYtJYBerwhiv+LdMxwbyqzQjQCmkOOhvCmRoUPX0Wu8YW
         2PGQPezxKV8aVXMDxF2PfSlNndx5A9KgTsx4bCQU8dnq28MY8y4sboDup4g3FmXddI3D
         6CKohJx83mfbN2sMdvKMO/GxwCPBzA6PdU9jyfbxacJB7Gli14wbi4Gq4p7Pc2yPybIj
         85cJPr9GeprsgbG3ypjvosJgW42Q+ysSlVSWdZLkJ4CYQVuREiH115zrSLJbC9vKnk0g
         y2q97QFWgS+llBrQnuYi6Hr+4kdhtMwnTZPpw6MCMHUTrOC7eob24Gki/sX6PPFyPufd
         xTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NOrxGO9sDfoAK9z5f8PBvguSPeKYle0P3g3YxqTBJ0=;
        b=jBdB2PHFf8rrXQlf/+a0U2Y+/y6E3Uqf9Gn8rwRVWzUWAdVOn2XuF3VPPcIIicELak
         fEpVzwOxhqn+ZSsEpMlGXhXLPmkkwu5ZEj7N8ADiBuvaeY8MsvB853AAS7Cqc59PXjDx
         RmKf9VLOCv+vH7rJHLhnk+sl3ZryF+Zd0eTlt6Y/4LwEeWU8mTDJhfY1z5Dvi51u5/zh
         c+75WP65zm/YFoqf8TXwFjo7ZLl1oodYFv9tsg8UPpqtpFuzATeeoNt8aM2SCRQKSpH+
         cJFb0KPD62yKg856CwluZOtYyaavhJw7kHrbbxGUho+Yg/F3eMGE5HdPPgz4iQhV3MfI
         Q/MQ==
X-Gm-Message-State: APjAAAW2L5CN9nV2lN76BvKohFHu2vTpnnynTpt83svNC2b43XcvsDil
        Rj38lCSqQoXNx0JZMt6x728=
X-Google-Smtp-Source: APXvYqyTtjZVFnEwDn/qGwcbvGmTDhoYwVzdLSZnJun7VvbsQAhiidoXG67yOu4GrAIZmzUptVVK6w==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr3012338wrr.334.1570025649617;
        Wed, 02 Oct 2019 07:14:09 -0700 (PDT)
Received: from Limone.filmuniversitaet.de ([195.37.64.251])
        by smtp.googlemail.com with ESMTPSA id d193sm8781121wmd.0.2019.10.02.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:14:08 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH] si2157: Add support for Logilink VG0022A.
Date:   Wed,  2 Oct 2019 16:13:59 +0200
Message-Id: <20191002141359.30166-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002141359.30166-1-gonsolo@gmail.com>
References: <20191001205203.4b1a5fb6@coco.lan>
 <20191002141359.30166-1-gonsolo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

---
 drivers/media/tuners/si2157.c         | 68 +++++++++++++++++----------
 drivers/media/tuners/si2157_priv.h    |  1 +
 drivers/media/usb/dvb-usb-v2/af9035.c | 47 ++++++++++++++++++
 3 files changed, 90 insertions(+), 26 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..8f9df2485d51 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -66,6 +66,24 @@ static int si2157_cmd_execute(struct i2c_client *client, struct si2157_cmd *cmd)
 	return ret;
 }
 
+static int si2157_power_up(struct si2157_dev *dev, struct i2c_client *client)
+{
+	struct si2157_cmd cmd;
+
+	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
+		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
+		cmd.wlen = 9;
+	} else if (dev->chiptype == SI2157_CHIPTYPE_SI2141) {
+		memcpy(cmd.args, "\xc0\x00\x0d\x0e\x00\x01\x01\x01\x01\x03", 10);
+		cmd.wlen = 10;
+	} else {
+		memcpy(cmd.args, "\xc0\x00\x0c\x00\x00\x01\x01\x01\x01\x01\x01\x02\x00\x00\x01", 15);
+		cmd.wlen = 15;
+	}
+	cmd.rlen = 1;
+	return si2157_cmd_execute(client, &cmd);
+}
+
 static int si2157_init(struct dvb_frontend *fe)
 {
 	struct i2c_client *client = fe->tuner_priv;
@@ -75,7 +93,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	struct si2157_cmd cmd;
 	const struct firmware *fw;
 	const char *fw_name;
-	unsigned int uitmp, chip_id;
+	unsigned int uitmp;
 
 	dev_dbg(&client->dev, "\n");
 
@@ -93,19 +111,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	if (uitmp == dev->if_frequency / 1000)
 		goto warm;
 
-	/* power up */
-	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
-		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
-		cmd.wlen = 9;
-	} else if (dev->chiptype == SI2157_CHIPTYPE_SI2141) {
-		memcpy(cmd.args, "\xc0\x00\x0d\x0e\x00\x01\x01\x01\x01\x03", 10);
-		cmd.wlen = 10;
-	} else {
-		memcpy(cmd.args, "\xc0\x00\x0c\x00\x00\x01\x01\x01\x01\x01\x01\x02\x00\x00\x01", 15);
-		cmd.wlen = 15;
-	}
-	cmd.rlen = 1;
-	ret = si2157_cmd_execute(client, &cmd);
+	ret = si2157_power_up(dev, client);
 	if (ret)
 		goto err;
 
@@ -118,17 +124,6 @@ static int si2157_init(struct dvb_frontend *fe)
 			goto err;
 	}
 
-	/* query chip revision */
-	memcpy(cmd.args, "\x02", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 13;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
-
-	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
-			cmd.args[4] << 0;
-
 	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
 	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
 	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
@@ -137,7 +132,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
 	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
 
-	switch (chip_id) {
+	switch (dev->chip_id) {
 	case SI2158_A20:
 	case SI2148_A20:
 		fw_name = SI2158_A20_FIRMWARE;
@@ -456,6 +451,27 @@ static int si2157_probe(struct i2c_client *client,
 	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
 	fe->tuner_priv = client;
 
+	ret = si2157_power_up(dev, client);
+	if (ret)
+		goto err;
+	/* query chip revision */
+	/* hack: do it here because after the si2168 gets 0101, commands will
+	 * still be executed here but no result
+	 */
+	memcpy(cmd.args, "\x02", 1);
+	cmd.wlen = 1;
+	cmd.rlen = 13;
+	ret = si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err_kfree;
+	dev->chip_id = cmd.args[1] << 24 |
+		cmd.args[2] << 16 |
+		cmd.args[3] << 8 |
+		cmd.args[4] << 0;
+	dev_info(&client->dev, "found a 'Silicon Labs Si21%d-%c%c%c'\n",
+		cmd.args[2], cmd.args[1], cmd.args[3], cmd.args[4]);
+
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 	if (cfg->mdev) {
 		dev->mdev = cfg->mdev;
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
index 2bda903358da..9ab7c88b01b4 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -28,6 +28,7 @@ struct si2157_dev {
 	u8 chiptype;
 	u8 if_port;
 	u32 if_frequency;
+	u32 chip_id;
 	struct delayed_work stat_work;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 3afd18733614..83e243df59b9 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1246,6 +1246,51 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 
 	msleep(200);
 
+	if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK) {
+
+		ret = af9035_wr_reg_mask(d, 0xd8b7, 0x01, 0x01);
+		if (ret < 0)
+			goto err;
+
+		/* I2C master bus 2 clock speed 300k */
+		ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+		if (ret < 0)
+			goto err;
+
+		/* I2C master bus 1,3 clock speed 300k */
+		ret = af9035_wr_reg(d, 0x00f103, 0x07);
+		if (ret < 0)
+			goto err;
+
+		/* set gpio11 low */
+		ret = af9035_wr_reg_mask(d, 0xd8d4, 0x01, 0x01);
+		if (ret < 0)
+			goto err;
+
+		ret = af9035_wr_reg_mask(d, 0xd8d5, 0x01, 0x01);
+		if (ret < 0)
+			goto err;
+
+		ret = af9035_wr_reg_mask(d, 0xd8d3, 0x01, 0x01);
+		if (ret < 0)
+			goto err;
+
+		/* Tuner enable using gpiot2_en, gpiot2_on and gpiot2_o (reset) */
+		ret = af9035_wr_reg_mask(d, 0xd8b8, 0x01, 0x01);
+		if (ret < 0)
+			goto err;
+
+		ret = af9035_wr_reg_mask(d, 0xd8b9, 0x01, 0x01);
+		if (ret < 0)
+			goto err;
+
+		ret = af9035_wr_reg_mask(d, 0xd8b7, 0x00, 0x01);
+		if (ret < 0)
+			goto err;
+
+		msleep(200);
+	}
+
 	ret = af9035_wr_reg_mask(d, 0xd8b7, 0x01, 0x01);
 	if (ret < 0)
 		goto err;
@@ -2119,6 +2164,8 @@ static const struct usb_device_id af9035_id_table[] = {
 	/* IT930x devices */
 	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
 		&it930x_props, "ITE 9303 Generic", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+		&it930x_props, "Logilink VG0022A", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
 		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
 	{ }
-- 
2.20.1

