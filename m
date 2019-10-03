Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB5BCA248
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 18:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732122AbfJCQDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 12:03:45 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34463 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732186AbfJCQDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 12:03:44 -0400
Received: by mail-ed1-f66.google.com with SMTP id p10so3047518edq.1;
        Thu, 03 Oct 2019 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NGQymOeii/8u7ybBEVyOrKWvkTVy5HWB9no5Hp5H0h0=;
        b=ZeibTNY2FtTM/tdwEP3KO4172JAvF6xxOyq4PV1tZOfmuAfpA67VZHGoAmK3C1zsPH
         q4Fymypmi+QDBEueRZijaf232ms/2LmmCIYTTsDoMT5qAO/9O4DPiaQ2GJ1IZ5pqGjOs
         q2VmpWiRFwKCGPrpXg/H6Fo1yUlPxy+PZjNG37oBgPGZHG0h9VkR+L13oY7MFZ2rh7wz
         ARN2ZU3Lp/IfF+8DrGDjP6paXF028NM1briRU4jKgKPpDZYtctuTuGDmgNpg3KhUoNso
         Z1KxxmX/pMs4z5JbgKZDuizSMLp5K/zLGQZyItrF9vLi7pgM4v3zel03U5O7eXCmMxmj
         tVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NGQymOeii/8u7ybBEVyOrKWvkTVy5HWB9no5Hp5H0h0=;
        b=Sy3BR/UhBYlNj+hexMuCwMFWYyX8nFklDQkdtT5AKDtHV9B98I12hT4JFRAScKlP2T
         xbZK2D5Ml78ONyieZQa0uMmSXR/JxaBNFXc7S8c36kYHM1CJxzrQRKPo0wntHZIq03uM
         uACSaJSy0Kdo27wNT9bZc88aJYgB6YRtJ/yglQrDDzBMxjANxzJ76wsu+g/VyV9h9hVW
         mUFtQ5/S19Rh+uMBzJV9Gc2AUgzPhpeKe72ole1BUBD/R1zcsOM5dnClfNdSD8Of+GBe
         0vzjUVuATNgomrRe7LufAUywZTYSyg62PQYIZqAbss+OJC8keYz1P35bob0U/F7msfgB
         0RVQ==
X-Gm-Message-State: APjAAAXlBxI2VGwH1fTsD+b+rsHBG8d9av+9WUNjuf15NIcsru4JXtSy
        0j6uaBu6k1GghcjRdKXGE1k=
X-Google-Smtp-Source: APXvYqxRmO9j0Q/sT5w1mZZciooBAqG+upOU5i9nXg7bjBom7MLxYstxtRekd6C9Iq4uTpJsr/aVsA==
X-Received: by 2002:a50:ab58:: with SMTP id t24mr10313327edc.131.1570118621685;
        Thu, 03 Oct 2019 09:03:41 -0700 (PDT)
Received: from Limone ([46.114.33.103])
        by smtp.gmail.com with ESMTPSA id gl4sm298708ejb.6.2019.10.03.09.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:03:39 -0700 (PDT)
Date:   Thu, 3 Oct 2019 18:03:36 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003160336.GA5125@Limone>
References: <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org>
 <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan>
 <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003120238.75811da6@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> With the original patch you proposed, what are the logs?

With the following patch applied to media_tree master:

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..4c1ab0b6876a 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -129,13 +129,14 @@ static int si2157_init(struct dvb_frontend *fe)
 	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
 			cmd.args[4] << 0;
 
-	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
-	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
-	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
-	#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
-	#define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
-	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
-	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
+	#define SI2177_A30 ('A' << 24 |  77 << 16 | '3' << 8 | '0' << 0)
+	#define SI2158_A20 ('A' << 24 |  58 << 16 | '2' << 8 | '0' << 0)
+	#define SI2148_A20 ('A' << 24 |  48 << 16 | '2' << 8 | '0' << 0)
+	#define SI2157_A30 ('A' << 24 |  57 << 16 | '3' << 8 | '0' << 0)
+	#define SI2147_A30 ('A' << 24 |  47 << 16 | '3' << 8 | '0' << 0)
+	#define SI2146_A10 ('A' << 24 |  46 << 16 | '1' << 8 | '0' << 0)
+	#define SI2141_A10 ('A' << 24 |  41 << 16 | '1' << 8 | '0' << 0)
+	#define SI_BOGUS   (255 << 24 | 255 << 16 | 255 << 8 | 255 << 0)
 
 	switch (chip_id) {
 	case SI2158_A20:
@@ -148,6 +149,10 @@ static int si2157_init(struct dvb_frontend *fe)
 	case SI2177_A30:
 		fw_name = SI2157_A30_FIRMWARE;
 		break;
+	case SI_BOGUS:
+		dev_info(&client->dev, "Bogus chip version, trying with no firmware\n");
+		fw_name = NULL;
+		break;
 	case SI2157_A30:
 	case SI2147_A30:
 	case SI2146_A10:
@@ -225,6 +230,7 @@ static int si2157_init(struct dvb_frontend *fe)
 
 	dev_info(&client->dev, "firmware version: %c.%c.%d\n",
 			cmd.args[6], cmd.args[7], cmd.args[8]);
 warm:
 	/* init statistics in order signal app which are supported */
 	c->strength.len = 1;
diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 3afd18733614..a8d59cf06b1e 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1197,6 +1197,11 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
 	return ret;
 }
 
+/* I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed))
+ * 7 equals ~400k, 26 ~100k and 260 ~10k.
+ * */
+#define I2C_SPEED_REGISTER 7
+
 static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct state *state = adap_to_priv(adap);
@@ -1208,13 +1213,13 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 
 	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
 
-	/* I2C master bus 2 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+	/* I2C master bus 2 clock speed */
+	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
-	/* I2C master bus 1,3 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f103, 0x07);
+	/* I2C master bus 1,3 clock speed */
+	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
@@ -2119,6 +2124,8 @@ static const struct usb_device_id af9035_id_table[] = {
 	/* IT930x devices */
 	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
 		&it930x_props, "ITE 9303 Generic", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+		&it930x_props, "Logilink VG0022A", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
 		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
 	{ }

the Messages at boot time are

[    4.262882] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
[    4.262884] si2168 1-0067: firmware version: B 4.0.2
[    4.262902] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon Labs Si2168)...
[    4.262908] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs Si2168' registered.
[    4.289776] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158 successfully attached

and the messages when running vlc (successfully) are

[  486.537128] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
[  487.795436] si2168 1-0067: firmware version: B 4.0.25
[  487.807614] si2157 2-0063: Bogus chip version, trying with no firmware
[  487.807618] si2157 2-0063: found a 'Silicon Labs Si21255-\xff\xff\xff'
[  487.833876] si2157 2-0063: firmware version: \xff.\xff.255

g

