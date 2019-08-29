Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAFAA13F0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 10:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfH2IjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 04:39:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45839 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfH2IjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 04:39:00 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so1236213plr.12
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 01:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdMzQlPZh5Jt6vXf/A/c/+H+d76fPQ64s/j3DHXKw6g=;
        b=dofKZck0vH59gehcmJSOUqD+n06nqOg2xb744/Ysl+mLdpCE7A8gO1vddcKk3tKjUb
         8HZn7Dbg1u/GbtbkdBfxRFLcnrvPV5lDuxvzMI4tGcCIftN0i44kqO7BUL1mUuk/JZlq
         G+YPlgIL5AUA8ZZYvZPV43OFamNfDkGk8LrC1PRlJGSCJTsEpIy4FrZIC54jb72KP3I6
         AQpvjAFS8CVp6rkk9Y8ylh6TMCeDp8/gNMsBm15sYdkMY9yE+WFYq9c4h8weOl4GE1o0
         GUApC3GDehftz2NvDHZuM6rtNkzUVvBHyH5nvTEGiB0d+PJgQmESWKaVhK9cnTTjqSGW
         UfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdMzQlPZh5Jt6vXf/A/c/+H+d76fPQ64s/j3DHXKw6g=;
        b=c8IRU5hpzku9p+j8FW5WpwozzAYJoIGsnk4I7U9M1BAYrNrAinVdsCPUqeNyyKE4hZ
         qwHSl+AtRSNxZOuvxuOHMLBp2P/+Dk99nWqNz7uhQ+LuW8Oudas7TMClWd13oeSElZmL
         kEYN45IWmvwvW89aMlr5Jgn8boZmke+XZaZD58Zp1rWw7XR1T3nvl8w2tmbM5lAUysnK
         yNB9CvCdYK//R/34a0lMsdgG3iEPMjVmJbO8tCMxIlSzvb5YnN94mKZD/bTGKoinXni9
         IXkYvDbIfTyFkCc4XO7Ww7S459a22MEjvxjk6t3mtWqmMUz4PYa6mDZoISf9hLD2XoEe
         FtQQ==
X-Gm-Message-State: APjAAAVVHhZPcevWKW91IF1K0/P4nnu6Hm7PrauVMo5qqeemVuj0QyYo
        e4yA/wo4OYYqYu4wnKaCOFIab8bN
X-Google-Smtp-Source: APXvYqxyFOtllOnF1q3/Q8gV1zEKZJWoi1oqSX6ifJLEC2dzpVx4TA69WcZ8gj1zu8dZ44lt2CmUsw==
X-Received: by 2002:a17:902:1a6:: with SMTP id b35mr8332821plb.228.1567067939191;
        Thu, 29 Aug 2019 01:38:59 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id g10sm3498518pfb.95.2019.08.29.01.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 01:38:58 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH v2 1/4] dvb-usb-v2/gl861: remove device-specific i2c algo
Date:   Thu, 29 Aug 2019 17:38:19 +0900
Message-Id: <20190829083822.3670-2-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829083822.3670-1-tskd08@gmail.com>
References: <20190829083822.3670-1-tskd08@gmail.com>
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

depends on the patch: "gl861: re-implement i2c adapter logic"
    https://patchwork.linuxtv.org/patch/58340/

Signed-off-by: Akihiro Tsukada <tskd08@gmail.com>
---
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

