Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 618B698AD9
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 07:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbfHVFfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 01:35:45 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:47067 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbfHVFfo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 01:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Z8UuS1k5hN+RZ4cZ6EkbZG+1upWl9T9zW74dAN/gRBY=; b=AFR3a1lCW151TyX3BEyYp/MjFZ
        S/IEIdfzfh3IXxGR1uB+M3UtltPV/0QxXoRnKiIkpPvyULHLjHs8f3cheZ22cwp3eRroX2wRM9aE1
        YVB/8NI2vdXCWWPcdppOWvZnqa5Mh8zDf9Dgs5sGoWkTUVCGq4BWMebTlkzpmebZh/E526PGqv0cd
        sZBBYAejJ+AYHTjVaQgPVpjGBxZMf0pxtjspkjOGM4cfqdFRSqgdJOG2us8ZAngep8iyPBM1rGmnn
        yDFbswosy3qrvcinQfNuYh/OEHCw68SIcgzNYVC10OtEBpPP1ODbx48GbZuMivuJzLCagO4WFgXh2
        37Enn8Bw==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.lan)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1i0fl8-0006t1-Jq; Thu, 22 Aug 2019 08:35:42 +0300
From:   Antti Palosaari <crope@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>, Akihiro TSUKADA <tskd08@gmail.com>
Subject: [PATCH] gl861: re-implement i2c adapter logic
Date:   Thu, 22 Aug 2019 08:34:52 +0300
Message-Id: <20190822053452.20168-1-crope@iki.fi>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::64c
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Device I2C adapter is capable of writing and reading large messages.
For I2C writes there is 2 methods: simple for max 2 byte messages and
usb_control_msg() with payload data for larger I2C messages. Add I2C
adapter logic which selects suitable method according to message size.

Cc: Akihiro TSUKADA <tskd08@gmail.com>
Signed-off-by: Antti Palosaari <crope@iki.fi>
---
 drivers/media/usb/dvb-usb-v2/gl861.c | 206 +++++++++++++++++++--------
 1 file changed, 149 insertions(+), 57 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index b784d9da1a82..b8358cd2e4b7 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -14,6 +14,144 @@
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
+struct gl861 {
+	/* USB control message buffer */
+	u8 buf[16];
+
+	struct i2c_adapter *demod_sub_i2c;
+	struct i2c_client  *i2c_client_demod;
+	struct i2c_client  *i2c_client_tuner;
+	struct i2c_adapter tuner_adap;
+};
+
+#define CMD_WRITE_SHORT     0x01
+#define CMD_READ            0x02
+#define CMD_WRITE           0x03
+
+static int gl861_ctrl_msg(struct dvb_usb_device *d, u8 request, u16 value,
+			  u16 index, void *data, u16 size)
+{
+	struct gl861 *ctx = d_to_priv(d);
+	struct usb_interface *intf = d->intf;
+	int ret;
+	unsigned int pipe;
+	u8 requesttype;
+
+	mutex_lock(&d->usb_mutex);
+
+	switch (request) {
+	case CMD_WRITE_SHORT:
+		pipe = usb_sndctrlpipe(d->udev, 0);
+		requesttype = USB_TYPE_VENDOR | USB_DIR_OUT;
+		break;
+	case CMD_READ:
+		pipe = usb_rcvctrlpipe(d->udev, 0);
+		requesttype = USB_TYPE_VENDOR | USB_DIR_IN;
+		break;
+	case CMD_WRITE:
+		pipe = usb_sndctrlpipe(d->udev, 0);
+		requesttype = USB_TYPE_VENDOR | USB_DIR_OUT;
+		memcpy(ctx->buf, data, size);
+		break;
+	default:
+		ret = -EINVAL;
+		goto err_mutex_unlock;
+	}
+
+	ret = usb_control_msg(d->udev, pipe, request, requesttype, value,
+			      index, ctx->buf, size, 200);
+	dev_dbg(&intf->dev, "%d | %02x %02x %*ph %*ph %*ph %s %*ph\n",
+		ret, requesttype, request, 2, &value, 2, &index, 2, &size,
+		(requesttype & USB_DIR_IN) ? "<<<" : ">>>", size, ctx->buf);
+	if (ret < 0)
+		goto err_mutex_unlock;
+
+	if (request == CMD_READ)
+		memcpy(data, ctx->buf, size);
+
+	usleep_range(1000, 2000); /* Avoid I2C errors */
+
+	mutex_unlock(&d->usb_mutex);
+
+	return 0;
+
+err_mutex_unlock:
+	mutex_unlock(&d->usb_mutex);
+	dev_dbg(&intf->dev, "failed %d\n", ret);
+	return ret;
+}
+
+static int gl861_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
+				 int num)
+{
+	struct dvb_usb_device *d = i2c_get_adapdata(adap);
+	struct usb_interface *intf = d->intf;
+	struct gl861 *ctx = d_to_priv(d);
+	int ret;
+	u8 request, *data;
+	u16 value, index, size;
+
+	/* XXX: I2C adapter maximum data lengths are not tested */
+	if (num == 1 && !(msg[0].flags & I2C_M_RD)) {
+		/* I2C write */
+		if (msg[0].len < 2 || msg[0].len > sizeof(ctx->buf)) {
+			ret = -EOPNOTSUPP;
+			goto err;
+		}
+
+		value = (msg[0].addr << 1) << 8;
+		index = msg[0].buf[0];
+
+		if (msg[0].len == 2) {
+			request = CMD_WRITE_SHORT;
+			value |= msg[0].buf[1];
+			size = 0;
+			data = NULL;
+		} else {
+			request = CMD_WRITE;
+			size = msg[0].len - 1;
+			data = &msg[0].buf[1];
+		}
+
+		ret = gl861_ctrl_msg(d, request, value, index, data, size);
+	} else if (num == 2 && !(msg[0].flags & I2C_M_RD) &&
+		   (msg[1].flags & I2C_M_RD)) {
+		/* I2C write + read */
+		if (msg[0].len > 1 || msg[1].len > sizeof(ctx->buf)) {
+			ret = -EOPNOTSUPP;
+			goto err;
+		}
+
+		value = (msg[0].addr << 1) << 8;
+		index = msg[0].buf[0];
+		request = CMD_READ;
+
+		ret = gl861_ctrl_msg(d, request, value, index,
+				     msg[1].buf, msg[1].len);
+	} else {
+		/* Unsupported I2C message */
+		dev_dbg(&intf->dev, "unknown i2c msg, num %u\n", num);
+		ret = -EOPNOTSUPP;
+	}
+	if (ret)
+		goto err;
+
+	return num;
+err:
+	dev_dbg(&intf->dev, "failed %d\n", ret);
+	return ret;
+}
+
+static u32 gl861_i2c_functionality(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C;
+}
+
+static struct i2c_algorithm gl861_i2c_algo = {
+	.master_xfer   = gl861_i2c_master_xfer,
+	.functionality = gl861_i2c_functionality,
+};
+
 static int gl861_i2c_msg(struct dvb_usb_device *d, u8 addr,
 			 u8 *wbuf, u16 wlen, u8 *rbuf, u16 rlen)
 {
@@ -63,46 +201,6 @@ static int gl861_i2c_msg(struct dvb_usb_device *d, u8 addr,
 	return ret;
 }
 
-/* I2C */
-static int gl861_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
-			  int num)
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
-		/* write/read request */
-		if (i+1 < num && (msg[i+1].flags & I2C_M_RD)) {
-			if (gl861_i2c_msg(d, msg[i].addr, msg[i].buf,
-				msg[i].len, msg[i+1].buf, msg[i+1].len) < 0)
-				break;
-			i++;
-		} else
-			if (gl861_i2c_msg(d, msg[i].addr, msg[i].buf,
-					  msg[i].len, NULL, 0) < 0)
-				break;
-	}
-
-	mutex_unlock(&d->i2c_mutex);
-	return i;
-}
-
-static u32 gl861_i2c_func(struct i2c_adapter *adapter)
-{
-	return I2C_FUNC_I2C;
-}
-
-static struct i2c_algorithm gl861_i2c_algo = {
-	.master_xfer   = gl861_i2c_xfer,
-	.functionality = gl861_i2c_func,
-};
-
 /* Callbacks for DVB USB */
 static struct zl10353_config gl861_zl10353_config = {
 	.demod_address = 0x0f,
@@ -149,6 +247,8 @@ static struct dvb_usb_device_properties gl861_props = {
 	.owner = THIS_MODULE,
 	.adapter_nr = adapter_nr,
 
+	.size_of_priv = sizeof(struct gl861),
+
 	.i2c_algo = &gl861_i2c_algo,
 	.frontend_attach = gl861_frontend_attach,
 	.tuner_attach = gl861_tuner_attach,
@@ -166,14 +266,6 @@ static struct dvb_usb_device_properties gl861_props = {
 /*
  * For Friio
  */
-
-struct friio_priv {
-	struct i2c_adapter *demod_sub_i2c;
-	struct i2c_client  *i2c_client_demod;
-	struct i2c_client  *i2c_client_tuner;
-	struct i2c_adapter tuner_adap;
-};
-
 struct friio_config {
 	struct i2c_board_info demod_info;
 	struct tc90522_config demod_cfg;
@@ -242,7 +334,7 @@ gl861_i2c_read_ex(struct dvb_usb_device *d, u8 addr, u8 *rbuf, u16 rlen)
 static int
 friio_i2c_tuner_read(struct dvb_usb_device *d, struct i2c_msg *msg)
 {
-	struct friio_priv *priv;
+	struct gl861 *priv;
 	u8 addr;
 
 	priv = d_to_priv(d);
@@ -255,7 +347,7 @@ friio_i2c_tuner_write(struct dvb_usb_device *d, struct i2c_msg *msg)
 {
 	u8 *buf;
 	int ret;
-	struct friio_priv *priv;
+	struct gl861 *priv;
 
 	priv = d_to_priv(d);
 
@@ -308,7 +400,7 @@ static int friio_tuner_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 
 static struct i2c_algorithm friio_tuner_i2c_algo = {
 	.master_xfer   = friio_tuner_i2c_xfer,
-	.functionality = gl861_i2c_func,
+	.functionality = gl861_i2c_functionality,
 };
 
 /* GPIO control in Friio */
@@ -488,7 +580,7 @@ static int friio_frontend_attach(struct dvb_usb_adapter *adap)
 	struct dvb_usb_device *d;
 	struct tc90522_config cfg;
 	struct i2c_client *cl;
-	struct friio_priv *priv;
+	struct gl861 *priv;
 
 	info = &friio_config.demod_info;
 	d = adap_to_d(adap);
@@ -513,7 +605,7 @@ static int friio_frontend_attach(struct dvb_usb_adapter *adap)
 
 static int friio_frontend_detach(struct dvb_usb_adapter *adap)
 {
-	struct friio_priv *priv;
+	struct gl861 *priv;
 
 	priv = adap_to_priv(adap);
 	i2c_del_adapter(&priv->tuner_adap);
@@ -526,7 +618,7 @@ static int friio_tuner_attach(struct dvb_usb_adapter *adap)
 	const struct i2c_board_info *info;
 	struct dvb_pll_config cfg;
 	struct i2c_client *cl;
-	struct friio_priv *priv;
+	struct gl861 *priv;
 
 	priv = adap_to_priv(adap);
 	info = &friio_config.tuner_info;
@@ -543,7 +635,7 @@ static int friio_tuner_attach(struct dvb_usb_adapter *adap)
 
 static int friio_tuner_detach(struct dvb_usb_adapter *adap)
 {
-	struct friio_priv *priv;
+	struct gl861 *priv;
 
 	priv = adap_to_priv(adap);
 	dvb_module_release(priv->i2c_client_tuner);
@@ -554,7 +646,7 @@ static int friio_init(struct dvb_usb_device *d)
 {
 	int i;
 	int ret;
-	struct friio_priv *priv;
+	struct gl861 *priv;
 
 	static const u8 demod_init[][2] = {
 		{0x01, 0x40}, {0x04, 0x38}, {0x05, 0x40}, {0x07, 0x40},
@@ -606,7 +698,7 @@ static struct dvb_usb_device_properties friio_props = {
 	.owner = THIS_MODULE,
 	.adapter_nr = adapter_nr,
 
-	.size_of_priv = sizeof(struct friio_priv),
+	.size_of_priv = sizeof(struct gl861),
 
 	.i2c_algo = &gl861_i2c_algo,
 	.power_ctrl = friio_power_ctrl,
-- 
2.21.0

