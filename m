Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11AFEC997F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 10:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfJCIGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 04:06:47 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:55328 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfJCIGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 04:06:46 -0400
Received: by mail-wm1-f53.google.com with SMTP id a6so1452842wma.5;
        Thu, 03 Oct 2019 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRPQHGpHdN0l1FAcvIRZnhu1XvTqhWoSJcInIbDzpP8=;
        b=s8wHPDY794bA14cj37soblRocJonom101d0wSedC+Wb8RTr85KpabUe56OjDjtVwlB
         t8iy8ZiztPeiuvUcrsDxx5+6C8PQJI8bJ7TW6CwUqaofMfaeboFC2uSsJLrND12eXF+b
         rJ5NVfi0UyOJeP/k+XbyoQW2VtTcNUF9rmjrv1VL9KPuLhNFfV2VCrBHAYk/8fa2TveP
         h/5ST67yh0Ro8l/EGuVVlqqh3tvq1yU9qU3vAgJJ6GKJ9yxwyU9sNib0vsvTSwNdeYai
         hQkM5XHTZIQjt+lZmLCpGJx8xM6JTTcbusYgVFjYk+7zcMfOJibWS+Nzq4oR4luOUpHr
         vN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRPQHGpHdN0l1FAcvIRZnhu1XvTqhWoSJcInIbDzpP8=;
        b=BLhnVGytjXkmlDV2RxDnS896lssop6PdAflwE5DtRsMZJHSoHmJufynScU6jG64gpD
         HSRgBKQ51Hjb5++z6FIttmqecx8Y/H3HJgwettMg0Zr85lr1CS6D34vxOvOvGCwcp4Cd
         g2BpU7UnQz9j0MFpVOIJP4Rzsxdq5qRZYuYLzeTirYCzQUaUywbtlN8NhpMRMtXGrXe3
         31EpNOWhtM7lThkGvWzdDrrfQC3xtDnU0aZIJFzV0GElX1afJh0fwxk8pVDfyqSZyRmY
         8o1BkzfDJdt7pkzvcJGJ31wG2VEJRfSLJYcLPZQ7F5NLXeQN7Icj5gFJoYdhMcFVy4ud
         A4aQ==
X-Gm-Message-State: APjAAAX8HiDfU9gDK//7n4MuNz3s97NpXHxUnSLcmXWc5nvlHYXC+LEE
        K5ODhIevRm5xmezIHmtt1Eg=
X-Google-Smtp-Source: APXvYqyXTMBlLg6zaaBxaLMwu+/Ofs/SNMofugEGi2lz5gtU0zaSi0l/IFy3CNQ4THnNrH2qqaxHrw==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr5664345wmi.108.1570090004442;
        Thu, 03 Oct 2019 01:06:44 -0700 (PDT)
Received: from localhost.localdomain ([46.114.33.168])
        by smtp.googlemail.com with ESMTPSA id w7sm2355064wmd.22.2019.10.03.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 01:06:43 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 1/1] Test Mauros timing patch.
Date:   Thu,  3 Oct 2019 10:06:20 +0200
Message-Id: <20191003080620.3885-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002154922.7f1cfc76@coco.lan>
References: <20191002154922.7f1cfc76@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/tuners/si2157.c         | 32 ++++++++++++++++-----------
 drivers/media/usb/dvb-usb-v2/af9035.c | 14 ++++++++----
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index d389f1fc237a..9e20727b7e84 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -75,6 +75,24 @@ static int si2157_cmd_execute(struct i2c_client *client, struct si2157_cmd *cmd)
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
@@ -102,19 +120,7 @@ static int si2157_init(struct dvb_frontend *fe)
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
 
diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 80d3bd3a0f24..c4d4994e0079 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1207,6 +1207,9 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
 	return ret;
 }
 
+/* I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed)) */
+#define I2C_SPEED_REGISTER 26
+
 static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct state *state = adap_to_priv(adap);
@@ -1575,13 +1578,13 @@ static int it930x_tuner_attach(struct dvb_usb_adapter *adap)
 
 	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
 
-	/* I2C master bus 2 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+	/* I2C master bus 2 clock speed ~100k */
+	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
-	/* I2C master bus 1,3 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f103, 0x07);
+	/* I2C master bus 1,3 clock speed ~100k */
+	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
@@ -2128,6 +2131,9 @@ static const struct usb_device_id af9035_id_table[] = {
 	/* IT930x devices */
 	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
 		&it930x_props, "ITE 9303 Generic", NULL) },
+
+	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+		&it930x_props, "Logilink VG0022A", NULL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, af9035_id_table);
-- 
2.20.1

