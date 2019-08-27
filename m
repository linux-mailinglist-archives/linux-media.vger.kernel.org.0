Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB539EBC6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 17:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfH0PCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 11:02:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43917 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfH0PCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 11:02:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id v12so14290251pfn.10
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7SlE2aa666dXHnwY5r/fAMvQnmaT2MNgvCaijlyocYM=;
        b=c8ni349xdIVyCKDzMB9HtqhjKyKkApAe3/UF+i8o/vjBgMiuzb9JraCuPn5iT3ASr0
         1S0CFTfOgYDJz/nGkxrtiddXdtgBcKioyJFsM2u46weathoar0mxUGUeTdLo9fwcWkE8
         jbbjWsvPVefKBceVBhjMPYxMw+CyE3mDNFEgLDbLrNoyAvr7K4FgmStJa8z4yrWhXKYG
         5+lJ0FoaZafHpkZ7WGUaqs4uJwsDibhVd1vpjvbzvF03sCEeHp92WGXFcIiA4IeWRCXE
         B8nadLkvCr00xATZffBtGhLuKa9SRJ+NrTllx3AsOo0PxlOQXE3C8/umZ+48HgUUxo+8
         Um/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7SlE2aa666dXHnwY5r/fAMvQnmaT2MNgvCaijlyocYM=;
        b=XD2ISKkukYAdqEaN5k28LgvMwVcexNz0Qo2QwdcTBIiWPCdbfoBuUhQQWGCJd4Hu5m
         Tup9JqO5PgV0qju5hgSQ+IZrxjqd25Ng4wV3D+kH9k52adiEsgAiFNBGkGmv9vEp0b50
         /S+/fyV6b0H+C2uIf30DYEzHdkqA+u8tm/hOpodSVQkvMJNnvw79fXQkt685V+zs/bC3
         zmzwSbcN4MkAe02wer//r4C3UIc0erXJPw+euanjwXgf92XW4Ttg6TNWHoHcANUbs8iW
         2HyJvcfa1qJz6w+QjUE8mhYbvo055K2jwP7riBaKP/+jLrjsw5eBO9E+WjXrdVel8nop
         qXzQ==
X-Gm-Message-State: APjAAAV5CLqpJCmiyYOStzka9VYR15KarQMyfG3Y6P9En4q/BiGB56/g
        UvafUP9CpYXd2DWqajxPGzT6FZXi
X-Google-Smtp-Source: APXvYqwDDx4XQi9q8aAwQPJISwQwVx6a+9U0cT+Sp9zy4fk5KowcInTOCjAy549f3oWpeGn5f6AIYA==
X-Received: by 2002:a62:5c5:: with SMTP id 188mr26717793pff.227.1566918121363;
        Tue, 27 Aug 2019 08:02:01 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id p20sm14845699pgj.47.2019.08.27.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 08:02:00 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH 1/2] dvb-usb-v2/gl861: remove device-specific i2c algo
Date:   Wed, 28 Aug 2019 00:01:40 +0900
Message-Id: <20190827150141.10240-2-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827150141.10240-1-tskd08@gmail.com>
References: <20190827150141.10240-1-tskd08@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Akihiro Tsukada <tskd08@gmail.com>

For Friio dvb cards, a dintinct I2C algo was provided to support
some "long" I2C messages used in relaying tuner I2C via demod.
Since the other (generic) i2c algo in this module has been patched
to support those messages in a more generic way,
this patch replaces and integrates the device-specific i2c algo
with the generic one and simplify the code.

Signed-off-by: Akihiro Tsukada <tskd08@gmail.com>
---
depends on the patch: "gl861: re-implement i2c adapter logic"
    https://patchwork.linuxtv.org/patch/58340/

 drivers/media/usb/dvb-usb-v2/gl861.c | 234 +++------------------------
 1 file changed, 26 insertions(+), 208 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index ead6268af7a..7e5bcf49896 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -21,7 +21,6 @@ struct gl861 {
 	struct i2c_adapter *demod_sub_i2c;
 	struct i2c_client  *i2c_client_demod;
 	struct i2c_client  *i2c_client_tuner;
-	struct i2c_adapter tuner_adap;
 };
 
 #define CMD_WRITE_SHORT     0x01
@@ -79,6 +78,12 @@ static int gl861_ctrl_msg(struct dvb_usb_device *d, u8 request, u16 value,
 	return ret;
 }
 
+static int gl861_short_write(struct dvb_usb_device *d, u8 addr, u8 reg, u8 val)
+{
+	return gl861_ctrl_msg(d, CMD_WRITE_SHORT,
+			      (addr << 9) | val, reg, NULL, 0);
+}
+
 static int gl861_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				 int num)
 {
@@ -162,55 +167,6 @@ static struct i2c_algorithm gl861_i2c_algo = {
 	.functionality = gl861_i2c_functionality,
 };
 
-static int gl861_i2c_msg(struct dvb_usb_device *d, u8 addr,
-			 u8 *wbuf, u16 wlen, u8 *rbuf, u16 rlen)
-{
-	u16 index;
-	u16 value = addr << (8 + 1);
-	int wo = (rbuf == NULL || rlen == 0); /* write-only */
-	u8 req, type;
-	u8 *buf;
-	int ret;
-
-	if (wo) {
-		req = GL861_REQ_I2C_WRITE;
-		type = GL861_WRITE;
-		buf = kmemdup(wbuf, wlen, GFP_KERNEL);
-	} else { /* rw */
-		req = GL861_REQ_I2C_READ;
-		type = GL861_READ;
-		buf = kmalloc(rlen, GFP_KERNEL);
-	}
-	if (!buf)
-		return -ENOMEM;
-
-	switch (wlen) {
-	case 1:
-		index = wbuf[0];
-		break;
-	case 2:
-		index = wbuf[0];
-		value = value + wbuf[1];
-		break;
-	default:
-		dev_err(&d->udev->dev, "%s: wlen=%d, aborting\n",
-				KBUILD_MODNAME, wlen);
-		kfree(buf);
-		return -EINVAL;
-	}
-
-	usleep_range(1000, 2000); /* avoid I2C errors */
-
-	ret = usb_control_msg(d->udev, usb_rcvctrlpipe(d->udev, 0), req, type,
-			      value, index, buf, rlen, 2000);
-
-	if (!wo && ret > 0)
-		memcpy(rbuf, buf, rlen);
-
-	kfree(buf);
-	return ret;
-}
-
 /* Callbacks for DVB USB */
 static struct zl10353_config gl861_zl10353_config = {
 	.demod_address = 0x0f,
@@ -289,129 +245,6 @@ static const struct friio_config friio_config = {
 	.tuner_info = { I2C_BOARD_INFO("tua6034_friio", 0x60), },
 };
 
-/* For another type of I2C:
- * message sent by a USB control-read/write transaction with data stage.
- * Used in init/config of Friio.
- */
-static int
-gl861_i2c_write_ex(struct dvb_usb_device *d, u8 addr, u8 *wbuf, u16 wlen)
-{
-	u8 *buf;
-	int ret;
-
-	buf = kmemdup(wbuf, wlen, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(d->udev, usb_sndctrlpipe(d->udev, 0),
-				 GL861_REQ_I2C_RAW, GL861_WRITE,
-				 addr << (8 + 1), 0x0100, buf, wlen, 2000);
-	kfree(buf);
-	return ret;
-}
-
-static int
-gl861_i2c_read_ex(struct dvb_usb_device *d, u8 addr, u8 *rbuf, u16 rlen)
-{
-	u8 *buf;
-	int ret;
-
-	buf = kmalloc(rlen, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(d->udev, usb_rcvctrlpipe(d->udev, 0),
-				 GL861_REQ_I2C_READ, GL861_READ,
-				 addr << (8 + 1), 0x0100, buf, rlen, 2000);
-	if (ret > 0 && rlen > 0)
-		memcpy(buf, rbuf, rlen);
-	kfree(buf);
-	return ret;
-}
-
-/* For I2C transactions to the tuner of Friio (dvb_pll).
- *
- * Friio uses irregular USB encapsulation for tuner i2c transactions:
- * write transacions are encapsulated with a different USB 'request' value.
- *
- * Although all transactions are sent via the demod(tc90522)
- * and the demod provides an i2c adapter for them, it cannot be used in Friio
- * since it assumes using the same parent adapter with the demod,
- * which does not use the request value and uses same one for both read/write.
- * So we define a dedicated i2c adapter here.
- */
-
-static int
-friio_i2c_tuner_read(struct dvb_usb_device *d, struct i2c_msg *msg)
-{
-	struct gl861 *priv;
-	u8 addr;
-
-	priv = d_to_priv(d);
-	addr = priv->i2c_client_demod->addr;
-	return gl861_i2c_read_ex(d, addr, msg->buf, msg->len);
-}
-
-static int
-friio_i2c_tuner_write(struct dvb_usb_device *d, struct i2c_msg *msg)
-{
-	u8 *buf;
-	int ret;
-	struct gl861 *priv;
-
-	priv = d_to_priv(d);
-
-	if (msg->len < 1)
-		return -EINVAL;
-
-	buf = kmalloc(msg->len + 1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-	buf[0] = msg->addr << 1;
-	memcpy(buf + 1, msg->buf, msg->len);
-
-	ret = usb_control_msg(d->udev, usb_sndctrlpipe(d->udev, 0),
-				 GL861_REQ_I2C_RAW, GL861_WRITE,
-				 priv->i2c_client_demod->addr << (8 + 1),
-				 0xFE, buf, msg->len + 1, 2000);
-	kfree(buf);
-	return ret;
-}
-
-static int friio_tuner_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
-				int num)
-{
-	struct dvb_usb_device *d = i2c_get_adapdata(adap);
-	int i;
-
-	if (num > 2)
-		return -EINVAL;
-
-	if (mutex_lock_interruptible(&d->i2c_mutex) < 0)
-		return -EAGAIN;
-
-	for (i = 0; i < num; i++) {
-		int ret;
-
-		if (msg[i].flags & I2C_M_RD)
-			ret = friio_i2c_tuner_read(d, &msg[i]);
-		else
-			ret = friio_i2c_tuner_write(d, &msg[i]);
-
-		if (ret < 0)
-			break;
-
-		usleep_range(1000, 2000); /* avoid I2C errors */
-	}
-
-	mutex_unlock(&d->i2c_mutex);
-	return i;
-}
-
-static struct i2c_algorithm friio_tuner_i2c_algo = {
-	.master_xfer   = friio_tuner_i2c_xfer,
-	.functionality = gl861_i2c_functionality,
-};
 
 /* GPIO control in Friio */
 
@@ -479,9 +312,11 @@ static int friio_ext_ctl(struct dvb_usb_device *d,
 /* init/config of gl861 for Friio */
 /* NOTE:
  * This function cannot be moved to friio_init()/dvb_usbv2_init(),
- * because the init defined here must be done before any activities like I2C,
+ * because the init defined here includes a whole device reset,
+ * it must be run early before any activities like I2C,
  * but friio_init() is called by dvb-usbv2 after {_frontend, _tuner}_attach(),
  * where I2C communication is used.
+ * In addition, this reset is required in reset_resume() as well.
  * Thus this function is set to be called from _power_ctl().
  *
  * Since it will be called on the early init stage
@@ -491,7 +326,7 @@ static int friio_ext_ctl(struct dvb_usb_device *d,
 static int friio_reset(struct dvb_usb_device *d)
 {
 	int i, ret;
-	u8 wbuf[2], rbuf[2];
+	u8 wbuf[1], rbuf[2];
 
 	static const u8 friio_init_cmds[][2] = {
 		{0x33, 0x08}, {0x37, 0x40}, {0x3a, 0x1f}, {0x3b, 0xff},
@@ -503,16 +338,12 @@ static int friio_reset(struct dvb_usb_device *d)
 	if (ret < 0)
 		return ret;
 
-	wbuf[0] = 0x11;
-	wbuf[1] = 0x02;
-	ret = gl861_i2c_msg(d, 0x00, wbuf, 2, NULL, 0);
+	ret = gl861_short_write(d, 0x00, 0x11, 0x02);
 	if (ret < 0)
 		return ret;
 	usleep_range(2000, 3000);
 
-	wbuf[0] = 0x11;
-	wbuf[1] = 0x00;
-	ret = gl861_i2c_msg(d, 0x00, wbuf, 2, NULL, 0);
+	ret = gl861_short_write(d, 0x00, 0x11, 0x00);
 	if (ret < 0)
 		return ret;
 
@@ -522,14 +353,13 @@ static int friio_reset(struct dvb_usb_device *d)
 	 */
 
 	usleep_range(1000, 2000);
-	wbuf[0] = 0x03;
-	wbuf[1] = 0x80;
-	ret = gl861_i2c_write_ex(d, 0x09, wbuf, 2);
+	wbuf[0] = 0x80;
+	ret = gl861_ctrl_msg(d, CMD_WRITE, 0x09 << 9, 0x03, wbuf, 1);
 	if (ret < 0)
 		return ret;
 
 	usleep_range(2000, 3000);
-	ret = gl861_i2c_read_ex(d, 0x09, rbuf, 2);
+	ret = gl861_ctrl_msg(d, CMD_READ, 0x09 << 9, 0x0100, rbuf, 2);
 	if (ret < 0)
 		return ret;
 	if (rbuf[0] != 0xff || rbuf[1] != 0xff)
@@ -537,38 +367,33 @@ static int friio_reset(struct dvb_usb_device *d)
 
 
 	usleep_range(1000, 2000);
-	ret = gl861_i2c_write_ex(d, 0x48, wbuf, 2);
+	wbuf[0] = 0x80;
+	ret = gl861_ctrl_msg(d, CMD_WRITE, 0x48 << 9, 0x03, wbuf, 1);
 	if (ret < 0)
 		return ret;
 
 	usleep_range(2000, 3000);
-	ret = gl861_i2c_read_ex(d, 0x48, rbuf, 2);
+	ret = gl861_ctrl_msg(d, CMD_READ, 0x48 << 9, 0x0100, rbuf, 2);
 	if (ret < 0)
 		return ret;
 	if (rbuf[0] != 0xff || rbuf[1] != 0xff)
 		return -ENODEV;
 
-	wbuf[0] = 0x30;
-	wbuf[1] = 0x04;
-	ret = gl861_i2c_msg(d, 0x00, wbuf, 2, NULL, 0);
+	ret = gl861_short_write(d, 0x00, 0x30, 0x04);
 	if (ret < 0)
 		return ret;
 
-	wbuf[0] = 0x00;
-	wbuf[1] = 0x01;
-	ret = gl861_i2c_msg(d, 0x00, wbuf, 2, NULL, 0);
+	ret = gl861_short_write(d, 0x00, 0x00, 0x01);
 	if (ret < 0)
 		return ret;
 
-	wbuf[0] = 0x06;
-	wbuf[1] = 0x0f;
-	ret = gl861_i2c_msg(d, 0x00, wbuf, 2, NULL, 0);
+	ret = gl861_short_write(d, 0x00, 0x06, 0x0f);
 	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(friio_init_cmds); i++) {
-		ret = gl861_i2c_msg(d, 0x00, (u8 *)friio_init_cmds[i], 2,
-				      NULL, 0);
+		ret = gl861_short_write(d, 0x00, friio_init_cmds[i][0],
+					friio_init_cmds[i][1]);
 		if (ret < 0)
 			return ret;
 	}
@@ -593,6 +418,7 @@ static int friio_frontend_attach(struct dvb_usb_adapter *adap)
 	struct gl861 *priv;
 
 	info = &friio_config.demod_info;
+	cfg = friio_config.demod_cfg;
 	d = adap_to_d(adap);
 	cl = dvb_module_probe("tc90522", info->type,
 			      &d->i2c_adap, info->addr, &cfg);
@@ -600,17 +426,10 @@ static int friio_frontend_attach(struct dvb_usb_adapter *adap)
 		return -ENODEV;
 	adap->fe[0] = cfg.fe;
 
-	/* ignore cfg.tuner_i2c and create new one */
 	priv = adap_to_priv(adap);
 	priv->i2c_client_demod = cl;
-	priv->tuner_adap.algo = &friio_tuner_i2c_algo;
-	priv->tuner_adap.dev.parent = &d->udev->dev;
-	strscpy(priv->tuner_adap.name, d->name, sizeof(priv->tuner_adap.name));
-	strlcat(priv->tuner_adap.name, "-tuner", sizeof(priv->tuner_adap.name));
-	priv->demod_sub_i2c = &priv->tuner_adap;
-	i2c_set_adapdata(&priv->tuner_adap, d);
-
-	return i2c_add_adapter(&priv->tuner_adap);
+	priv->demod_sub_i2c = cfg.tuner_i2c;
+	return 0;
 }
 
 static int friio_frontend_detach(struct dvb_usb_adapter *adap)
@@ -618,7 +437,6 @@ static int friio_frontend_detach(struct dvb_usb_adapter *adap)
 	struct gl861 *priv;
 
 	priv = adap_to_priv(adap);
-	i2c_del_adapter(&priv->tuner_adap);
 	dvb_module_release(priv->i2c_client_demod);
 	return 0;
 }
-- 
2.23.0

