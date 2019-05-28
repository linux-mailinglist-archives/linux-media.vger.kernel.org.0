Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 518A92D11D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 23:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfE1VnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 17:43:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44282 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE1VnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 17:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mrKUE3njdm4fZPzu8TtRbOKGMWSjbmiImTmUz9x9dPg=; b=h6GRjvXeo2m5pp3KDlu/0TMlgI
        fkzpOeel7bG9mQbEZCVDc7SQne2AN22LpAAJ5AJ5inwvtmQyOHAVWG80ycvDTikVqGuQnYbrpCPdv
        C0iYjtpu0Y5e3cgve79TMTOs27m6lwxkk6LzfMnmXnQtL+v/+2CaAYvlmQIeJ30Ggf58r7iidfOxV
        qoNpMe/NkGKOcfIrXJqZg5tKcir8lbmsScn5ZQHhvrJ3L6a359fUGjRWeeQNwbQ+bhUkAL3iI/MN1
        1tt0upDWKa7pN8g4l0tdUWXMJ12vP3GEIJ+7ZhNwp7ZXt8FVAEY5+1wAD0qO9Myth/wl1bOmkDYiZ
        KhgzYFGA==;
Received: from [187.58.202.19] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVjsF-0000Ga-KX; Tue, 28 May 2019 21:43:16 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hVjs2-000AYi-Sq; Tue, 28 May 2019 17:42:58 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Michael Krufky <mkrufky@linuxtv.org>
Subject: [PATCH 2/2] media: cxusb: fix several coding style issues
Date:   Tue, 28 May 2019 17:42:57 -0400
Message-Id: <9ee3b0687c42d65d6f2db0c35e6ecb2ab725277f.1559079754.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <373dc495b36ae4a96af0bf042303954eec493fd3.1559079754.git.mchehab+samsung@kernel.org>
References: <373dc495b36ae4a96af0bf042303954eec493fd3.1559079754.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As this driver had a major change, let's take the opportunity
and do some coding style cleanup, in order to make it compliant
with Kernel's style.

This patch was partially done with the help of two tools:

	./scripts/checkpatch.pl --fix-inplace --strict
	astyle --indent=tab=8 --style=linux

But manually adjusted in order to fit our style.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/usb/dvb-usb/cxusb.c | 365 +++++++++++++++++-------------
 drivers/media/usb/dvb-usb/cxusb.h |   8 +-
 2 files changed, 217 insertions(+), 156 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index 8b754ea069bc..cc61315b675c 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -136,7 +136,7 @@ static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 }
 
 static int cxusb_bluebird_gpio_rw(struct dvb_usb_device *d, u8 changemask,
-				 u8 newval)
+				  u8 newval)
 {
 	u8 o[2], gpio_state;
 	int rc;
@@ -164,7 +164,7 @@ static void cxusb_nano2_led(struct dvb_usb_device *d, int onoff)
 }
 
 static int cxusb_d680_dmb_gpio_tuner(struct dvb_usb_device *d,
-		u8 addr, int onoff)
+				     u8 addr, int onoff)
 {
 	u8  o[2] = {addr, onoff};
 	u8  i;
@@ -174,12 +174,12 @@ static int cxusb_d680_dmb_gpio_tuner(struct dvb_usb_device *d,
 
 	if (rc < 0)
 		return rc;
+
 	if (i == 0x01)
 		return 0;
-	else {
-		deb_info("gpio_write failed.\n");
-		return -EIO;
-	}
+
+	deb_info("gpio_write failed.\n");
+	return -EIO;
 }
 
 /* I2C */
@@ -194,7 +194,6 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 		return -EAGAIN;
 
 	for (i = 0; i < num; i++) {
-
 		if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_MEDION)
 			switch (msg[i].addr) {
 			case 0x63:
@@ -220,13 +219,13 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			obuf[2] = msg[i].addr;
 			if (cxusb_ctrl_msg(d, CMD_I2C_READ,
 					   obuf, 3,
-					   ibuf, 1+msg[i].len) < 0) {
+					   ibuf, 1 + msg[i].len) < 0) {
 				warn("i2c read failed");
 				break;
 			}
 			memcpy(msg[i].buf, &ibuf[1], msg[i].len);
-		} else if (i+1 < num && (msg[i+1].flags & I2C_M_RD) &&
-			   msg[i].addr == msg[i+1].addr) {
+		} else if (i + 1 < num && (msg[i + 1].flags & I2C_M_RD) &&
+			   msg[i].addr == msg[i + 1].addr) {
 			/* write to then read from same address */
 			u8 obuf[MAX_XFER_SIZE], ibuf[MAX_XFER_SIZE];
 
@@ -243,19 +242,19 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				goto unlock;
 			}
 			obuf[0] = msg[i].len;
-			obuf[1] = msg[i+1].len;
+			obuf[1] = msg[i + 1].len;
 			obuf[2] = msg[i].addr;
 			memcpy(&obuf[3], msg[i].buf, msg[i].len);
 
 			if (cxusb_ctrl_msg(d, CMD_I2C_READ,
-					   obuf, 3+msg[i].len,
-					   ibuf, 1+msg[i+1].len) < 0)
+					   obuf, 3 + msg[i].len,
+					   ibuf, 1 + msg[i + 1].len) < 0)
 				break;
 
 			if (ibuf[0] != 0x08)
 				deb_i2c("i2c read may have failed\n");
 
-			memcpy(msg[i+1].buf, &ibuf[1], msg[i+1].len);
+			memcpy(msg[i + 1].buf, &ibuf[1], msg[i + 1].len);
 
 			i++;
 		} else {
@@ -273,7 +272,7 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			memcpy(&obuf[2], msg[i].buf, msg[i].len);
 
 			if (cxusb_ctrl_msg(d, CMD_I2C_WRITE, obuf,
-					   2+msg[i].len, &ibuf,1) < 0)
+					   2 + msg[i].len, &ibuf, 1) < 0)
 				break;
 			if (ibuf != 0x08)
 				deb_i2c("i2c write may have failed\n");
@@ -314,8 +313,7 @@ static int _cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
 
 static int cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
-	bool is_medion = d->props.devices[0].warm_ids[0] ==
-		&cxusb_table[MEDION_MD95700];
+	bool is_medion = d->props.devices[0].warm_ids[0] == &cxusb_table[MEDION_MD95700];
 	int ret;
 
 	if (is_medion && !onoff) {
@@ -345,17 +343,23 @@ static int cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
 static int cxusb_aver_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	int ret;
+
 	if (!onoff)
 		return cxusb_ctrl_msg(d, CMD_POWER_OFF, NULL, 0, NULL, 0);
 	if (d->state == DVB_USB_STATE_INIT &&
 	    usb_set_interface(d->udev, 0, 0) < 0)
 		err("set interface failed");
-	do {} while (!(ret = cxusb_ctrl_msg(d, CMD_POWER_ON, NULL, 0, NULL, 0)) &&
-		   !(ret = cxusb_ctrl_msg(d, 0x15, NULL, 0, NULL, 0)) &&
-		   !(ret = cxusb_ctrl_msg(d, 0x17, NULL, 0, NULL, 0)) && 0);
+	do {
+		/* Nothing */
+	} while (!(ret = cxusb_ctrl_msg(d, CMD_POWER_ON, NULL, 0, NULL, 0)) &&
+		 !(ret = cxusb_ctrl_msg(d, 0x15, NULL, 0, NULL, 0)) &&
+		 !(ret = cxusb_ctrl_msg(d, 0x17, NULL, 0, NULL, 0)) && 0);
+
 	if (!ret) {
-		/* FIXME: We don't know why, but we need to configure the
-		 * lgdt3303 with the register settings below on resume */
+		/*
+		 * FIXME: We don't know why, but we need to configure the
+		 * lgdt3303 with the register settings below on resume
+		 */
 		int i;
 		u8 buf;
 		static const u8 bufs[] = {
@@ -373,7 +377,7 @@ static int cxusb_aver_power_ctrl(struct dvb_usb_device *d, int onoff)
 		msleep(20);
 		for (i = 0; i < ARRAY_SIZE(bufs); i += 4 / sizeof(u8)) {
 			ret = cxusb_ctrl_msg(d, CMD_I2C_WRITE,
-					     bufs+i, 4, &buf, 1);
+					     bufs + i, 4, &buf, 1);
 			if (ret)
 				break;
 			if (buf != 0x8)
@@ -386,6 +390,7 @@ static int cxusb_aver_power_ctrl(struct dvb_usb_device *d, int onoff)
 static int cxusb_bluebird_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	u8 b = 0;
+
 	if (onoff)
 		return cxusb_ctrl_msg(d, CMD_POWER_ON, &b, 1, NULL, 0);
 	else
@@ -407,6 +412,7 @@ static int cxusb_d680_dmb_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	int ret;
 	u8  b;
+
 	ret = cxusb_power_ctrl(d, onoff);
 	if (!onoff)
 		return ret;
@@ -454,7 +460,7 @@ static int cxusb_aver_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 }
 
 static int cxusb_read_status(struct dvb_frontend *fe,
-				  enum fe_status *status)
+			     enum fe_status *status)
 {
 	struct dvb_usb_adapter *adap = (struct dvb_usb_adapter *)fe->dvb->priv;
 	struct cxusb_state *state = (struct cxusb_state *)adap->dev->priv;
@@ -487,8 +493,8 @@ static void cxusb_d680_dmb_drain_message(struct dvb_usb_device *d)
 		return;
 	while (1) {
 		if (usb_bulk_msg(d->udev,
-			usb_rcvbulkpipe(d->udev, ep),
-			junk, junk_len, &rd_count, timeout) < 0)
+				 usb_rcvbulkpipe(d->udev, ep),
+				 junk, junk_len, &rd_count, timeout) < 0)
 			break;
 		if (!rd_count)
 			break;
@@ -510,8 +516,8 @@ static void cxusb_d680_dmb_drain_video(struct dvb_usb_device *d)
 		return;
 	while (1) {
 		if (usb_bulk_msg(d->udev,
-			usb_rcvbulkpipe(d->udev, p->endpoint),
-			junk, junk_len, &rd_count, timeout) < 0)
+				 usb_rcvbulkpipe(d->udev, p->endpoint),
+				 junk, junk_len, &rd_count, timeout) < 0)
 			break;
 		if (!rd_count)
 			break;
@@ -519,17 +525,18 @@ static void cxusb_d680_dmb_drain_video(struct dvb_usb_device *d)
 	kfree(junk);
 }
 
-static int cxusb_d680_dmb_streaming_ctrl(
-		struct dvb_usb_adapter *adap, int onoff)
+static int cxusb_d680_dmb_streaming_ctrl(struct dvb_usb_adapter *adap,
+					 int onoff)
 {
 	if (onoff) {
 		u8 buf[2] = { 0x03, 0x00 };
+
 		cxusb_d680_dmb_drain_video(adap->dev);
 		return cxusb_ctrl_msg(adap->dev, CMD_STREAMING_ON,
-			buf, sizeof(buf), NULL, 0);
+				      buf, sizeof(buf), NULL, 0);
 	} else {
 		int ret = cxusb_ctrl_msg(adap->dev,
-			CMD_STREAMING_OFF, NULL, 0, NULL, 0);
+					 CMD_STREAMING_OFF, NULL, 0, NULL, 0);
 		return ret;
 	}
 }
@@ -549,8 +556,12 @@ static int cxusb_rc_query(struct dvb_usb_device *d)
 static int cxusb_bluebird2_rc_query(struct dvb_usb_device *d)
 {
 	u8 ircode[4];
-	struct i2c_msg msg = { .addr = 0x6b, .flags = I2C_M_RD,
-			       .buf = ircode, .len = 4 };
+	struct i2c_msg msg = {
+		.addr = 0x6b,
+		.flags = I2C_M_RD,
+		.buf = ircode,
+		.len = 4
+	};
 
 	if (cxusb_i2c_xfer(&d->i2c_adap, &msg, 1) != 1)
 		return 0;
@@ -574,13 +585,13 @@ static int cxusb_d680_dmb_rc_query(struct dvb_usb_device *d)
 	return 0;
 }
 
-static int cxusb_dee1601_demod_init(struct dvb_frontend* fe)
+static int cxusb_dee1601_demod_init(struct dvb_frontend *fe)
 {
-	static u8 clock_config []  = { CLOCK_CTL,  0x38, 0x28 };
-	static u8 reset []         = { RESET,      0x80 };
-	static u8 adc_ctl_1_cfg [] = { ADC_CTL_1,  0x40 };
-	static u8 agc_cfg []       = { AGC_TARGET, 0x28, 0x20 };
-	static u8 gpp_ctl_cfg []   = { GPP_CTL,    0x33 };
+	static u8 clock_config[]   = { CLOCK_CTL,  0x38, 0x28 };
+	static u8 reset[]          = { RESET,      0x80 };
+	static u8 adc_ctl_1_cfg[]  = { ADC_CTL_1,  0x40 };
+	static u8 agc_cfg[]        = { AGC_TARGET, 0x28, 0x20 };
+	static u8 gpp_ctl_cfg[]    = { GPP_CTL,    0x33 };
 	static u8 capt_range_cfg[] = { CAPT_RANGE, 0x32 };
 
 	mt352_write(fe, clock_config,   sizeof(clock_config));
@@ -595,13 +606,14 @@ static int cxusb_dee1601_demod_init(struct dvb_frontend* fe)
 	return 0;
 }
 
-static int cxusb_mt352_demod_init(struct dvb_frontend* fe)
-{	/* used in both lgz201 and th7579 */
-	static u8 clock_config []  = { CLOCK_CTL,  0x38, 0x29 };
-	static u8 reset []         = { RESET,      0x80 };
-	static u8 adc_ctl_1_cfg [] = { ADC_CTL_1,  0x40 };
-	static u8 agc_cfg []       = { AGC_TARGET, 0x24, 0x20 };
-	static u8 gpp_ctl_cfg []   = { GPP_CTL,    0x33 };
+static int cxusb_mt352_demod_init(struct dvb_frontend *fe)
+{
+	/* used in both lgz201 and th7579 */
+	static u8 clock_config[]   = { CLOCK_CTL,  0x38, 0x29 };
+	static u8 reset[]          = { RESET,      0x80 };
+	static u8 adc_ctl_1_cfg[]  = { ADC_CTL_1,  0x40 };
+	static u8 agc_cfg[]        = { AGC_TARGET, 0x24, 0x20 };
+	static u8 gpp_ctl_cfg[]    = { GPP_CTL,    0x33 };
 	static u8 capt_range_cfg[] = { CAPT_RANGE, 0x32 };
 
 	mt352_write(fe, clock_config,   sizeof(clock_config));
@@ -719,7 +731,7 @@ static int cxusb_fmd1216me_tuner_attach(struct dvb_usb_adapter *adap)
 		   &dvbdev->i2c_adap, 0x61,
 		   TUNER_PHILIPS_FMD1216ME_MK3);
 
-	if (is_medion && adap->fe_adap[0].fe != NULL)
+	if (is_medion && adap->fe_adap[0].fe)
 		/*
 		 * make sure that DVB core won't put to sleep (reset, really)
 		 * tuner when we might be open in analog mode
@@ -738,7 +750,8 @@ static int cxusb_dee1601_tuner_attach(struct dvb_usb_adapter *adap)
 
 static int cxusb_lgz201_tuner_attach(struct dvb_usb_adapter *adap)
 {
-	dvb_attach(dvb_pll_attach, adap->fe_adap[0].fe, 0x61, NULL, DVB_PLL_LG_Z201);
+	dvb_attach(dvb_pll_attach, adap->fe_adap[0].fe, 0x61,
+		   NULL, DVB_PLL_LG_Z201);
 	return 0;
 }
 
@@ -798,7 +811,7 @@ static int cxusb_dvico_xc3028_tuner_attach(struct dvb_usb_adapter *adap)
 	adap->fe_adap[0].fe->callback = dvico_bluebird_xc2028_callback;
 
 	fe = dvb_attach(xc2028_attach, adap->fe_adap[0].fe, &cfg);
-	if (fe == NULL || fe->ops.tuner_ops.set_config == NULL)
+	if (!fe || !fe->ops.tuner_ops.set_config)
 		return -EIO;
 
 	fe->ops.tuner_ops.set_config(fe, &ctl);
@@ -816,17 +829,19 @@ static int cxusb_mxl5003s_tuner_attach(struct dvb_usb_adapter *adap)
 static int cxusb_d680_dmb_tuner_attach(struct dvb_usb_adapter *adap)
 {
 	struct dvb_frontend *fe;
+
 	fe = dvb_attach(mxl5005s_attach, adap->fe_adap[0].fe,
 			&adap->dev->i2c_adap, &d680_dmb_tuner);
-	return (fe == NULL) ? -EIO : 0;
+	return (!fe) ? -EIO : 0;
 }
 
 static int cxusb_mygica_d689_tuner_attach(struct dvb_usb_adapter *adap)
 {
 	struct dvb_frontend *fe;
+
 	fe = dvb_attach(max2165_attach, adap->fe_adap[0].fe,
 			&adap->dev->i2c_adap, &mygica_d689_max2165_cfg);
-	return (fe == NULL) ? -EIO : 0;
+	return (!fe) ? -EIO : 0;
 }
 
 static int cxusb_medion_fe_ts_bus_ctrl(struct dvb_frontend *fe, int acquire)
@@ -920,7 +935,7 @@ static int cxusb_cx22702_frontend_attach(struct dvb_usb_adapter *adap)
 
 	adap->fe_adap[0].fe = dvb_attach(cx22702_attach, &cxusb_cx22702_config,
 					 &dvbdev->i2c_adap);
-	if (adap->fe_adap[0].fe == NULL)
+	if (!adap->fe_adap[0].fe)
 		return -EIO;
 
 	if (is_medion)
@@ -941,7 +956,7 @@ static int cxusb_lgdt3303_frontend_attach(struct dvb_usb_adapter *adap)
 					 &cxusb_lgdt3303_config,
 					 0x0e,
 					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	return -EIO;
@@ -953,7 +968,7 @@ static int cxusb_aver_lgdt3303_frontend_attach(struct dvb_usb_adapter *adap)
 					 &cxusb_aver_lgdt3303_config,
 					 0x0e,
 					 &adap->dev->i2c_adap);
-	if (adap->fe_adap[0].fe != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	return -EIO;
@@ -969,7 +984,7 @@ static int cxusb_mt352_frontend_attach(struct dvb_usb_adapter *adap)
 
 	adap->fe_adap[0].fe = dvb_attach(mt352_attach, &cxusb_mt352_config,
 					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	return -EIO;
@@ -984,13 +999,13 @@ static int cxusb_dee1601_frontend_attach(struct dvb_usb_adapter *adap)
 
 	adap->fe_adap[0].fe = dvb_attach(mt352_attach, &cxusb_dee1601_config,
 					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	adap->fe_adap[0].fe = dvb_attach(zl10353_attach,
 					 &cxusb_zl10353_dee1601_config,
 					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	return -EIO;
@@ -1000,8 +1015,12 @@ static int cxusb_dualdig4_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	u8 ircode[4];
 	int i;
-	struct i2c_msg msg = { .addr = 0x6b, .flags = I2C_M_RD,
-			       .buf = ircode, .len = 4 };
+	struct i2c_msg msg = {
+		.addr = 0x6b,
+		.flags = I2C_M_RD,
+		.buf = ircode,
+		.len = 4
+	};
 
 	if (usb_set_interface(adap->dev->udev, 0, 1) < 0)
 		err("set interface failed");
@@ -1017,7 +1036,7 @@ static int cxusb_dualdig4_frontend_attach(struct dvb_usb_adapter *adap)
 		dvb_attach(zl10353_attach,
 			   &cxusb_zl10353_xc3028_config_no_i2c_gate,
 			   &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) == NULL)
+	if (!adap->fe_adap[0].fe)
 		return -EIO;
 
 	/* try to determine if there is no IR decoder on the I2C bus */
@@ -1115,7 +1134,7 @@ static struct dib7000p_config cxusb_dualdig4_rev2_config = {
 };
 
 struct dib0700_adapter_state {
-	int (*set_param_save)(struct dvb_frontend *);
+	int (*set_param_save)(struct dvb_frontend *fe);
 	struct dib7000p_ops dib7000p_ops;
 };
 
@@ -1134,14 +1153,15 @@ static int cxusb_dualdig4_rev2_frontend_attach(struct dvb_usb_adapter *adap)
 		return -ENODEV;
 
 	if (state->dib7000p_ops.i2c_enumeration(&adap->dev->i2c_adap, 1, 18,
-				       &cxusb_dualdig4_rev2_config) < 0) {
-		printk(KERN_WARNING "Unable to enumerate dib7000p\n");
+						&cxusb_dualdig4_rev2_config) < 0) {
+		pr_warn("Unable to enumerate dib7000p\n");
 		return -ENODEV;
 	}
 
-	adap->fe_adap[0].fe = state->dib7000p_ops.init(&adap->dev->i2c_adap, 0x80,
-					      &cxusb_dualdig4_rev2_config);
-	if (adap->fe_adap[0].fe == NULL)
+	adap->fe_adap[0].fe = state->dib7000p_ops.init(&adap->dev->i2c_adap,
+						       0x80,
+						       &cxusb_dualdig4_rev2_config);
+	if (!adap->fe_adap[0].fe)
 		return -EIO;
 
 	return 0;
@@ -1174,11 +1194,16 @@ static int dib7070_set_param_override(struct dvb_frontend *fe)
 	struct dib0700_adapter_state *state = adap->priv;
 
 	u16 offset;
-	u8 band = BAND_OF_FREQUENCY(p->frequency/1000);
+	u8 band = BAND_OF_FREQUENCY(p->frequency / 1000);
+
 	switch (band) {
-	case BAND_VHF: offset = 950; break;
+	case BAND_VHF:
+		offset = 950;
+		break;
 	default:
-	case BAND_UHF: offset = 550; break;
+	case BAND_UHF:
+		offset = 550;
+		break;
 	}
 
 	state->dib7000p_ops.set_wbd_ref(fe, offset + dib0070_wbd_offset(fe));
@@ -1200,7 +1225,7 @@ static int cxusb_dualdig4_rev2_tuner_attach(struct dvb_usb_adapter *adap)
 					DIBX000_I2C_INTERFACE_TUNER, 1);
 
 	if (dvb_attach(dib0070_attach, adap->fe_adap[0].fe, tun_i2c,
-	    &dib7070p_dib0070_config) == NULL)
+		       &dib7070p_dib0070_config) == NULL)
 		return -ENODEV;
 
 	st->set_param_save = adap->fe_adap[0].fe->ops.tuner_ops.set_params;
@@ -1223,13 +1248,13 @@ static int cxusb_nano2_frontend_attach(struct dvb_usb_adapter *adap)
 	adap->fe_adap[0].fe = dvb_attach(zl10353_attach,
 					 &cxusb_zl10353_xc3028_config,
 					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	adap->fe_adap[0].fe = dvb_attach(mt352_attach,
 					 &cxusb_mt352_xc3028_config,
 					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
+	if (adap->fe_adap[0].fe)
 		return 0;
 
 	return -EIO;
@@ -1260,11 +1285,14 @@ static int cxusb_d680_dmb_frontend_attach(struct dvb_usb_adapter *adap)
 
 	/* Unblock all USB pipes */
 	usb_clear_halt(d->udev,
-		usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		       usb_sndbulkpipe(d->udev,
+				       d->props.generic_bulk_ctrl_endpoint));
 	usb_clear_halt(d->udev,
-		usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		       usb_rcvbulkpipe(d->udev,
+				       d->props.generic_bulk_ctrl_endpoint));
 	usb_clear_halt(d->udev,
-		usb_rcvbulkpipe(d->udev, d->props.adapter[0].fe[0].stream.endpoint));
+		       usb_rcvbulkpipe(d->udev,
+				       d->props.adapter[0].fe[0].stream.endpoint));
 
 	/* Drain USB pipes to avoid hang after reboot */
 	for (n = 0;  n < 5;  n++) {
@@ -1286,8 +1314,9 @@ static int cxusb_d680_dmb_frontend_attach(struct dvb_usb_adapter *adap)
 	msleep(100);
 
 	/* Attach frontend */
-	adap->fe_adap[0].fe = dvb_attach(lgs8gxx_attach, &d680_lgs8gl5_cfg, &d->i2c_adap);
-	if (adap->fe_adap[0].fe == NULL)
+	adap->fe_adap[0].fe = dvb_attach(lgs8gxx_attach,
+					 &d680_lgs8gl5_cfg, &d->i2c_adap);
+	if (!adap->fe_adap[0].fe)
 		return -EIO;
 
 	return 0;
@@ -1317,12 +1346,14 @@ static int cxusb_mygica_d689_frontend_attach(struct dvb_usb_adapter *adap)
 
 	/* Unblock all USB pipes */
 	usb_clear_halt(d->udev,
-		usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		       usb_sndbulkpipe(d->udev,
+				       d->props.generic_bulk_ctrl_endpoint));
 	usb_clear_halt(d->udev,
-		usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		       usb_rcvbulkpipe(d->udev,
+				       d->props.generic_bulk_ctrl_endpoint));
 	usb_clear_halt(d->udev,
-		usb_rcvbulkpipe(d->udev, d->props.adapter[0].fe[0].stream.endpoint));
-
+		       usb_rcvbulkpipe(d->udev,
+				       d->props.adapter[0].fe[0].stream.endpoint));
 
 	/* Reset the tuner */
 	if (cxusb_d680_dmb_gpio_tuner(d, 0x07, 0) < 0) {
@@ -1337,9 +1368,10 @@ static int cxusb_mygica_d689_frontend_attach(struct dvb_usb_adapter *adap)
 	msleep(100);
 
 	/* Attach frontend */
-	adap->fe_adap[0].fe = dvb_attach(atbm8830_attach, &mygica_d689_atbm8830_cfg,
-		&d->i2c_adap);
-	if (adap->fe_adap[0].fe == NULL)
+	adap->fe_adap[0].fe = dvb_attach(atbm8830_attach,
+					 &mygica_d689_atbm8830_cfg,
+					 &d->i2c_adap);
+	if (!adap->fe_adap[0].fe)
 		return -EIO;
 
 	return 0;
@@ -1362,11 +1394,14 @@ static int cxusb_mygica_t230_frontend_attach(struct dvb_usb_adapter *adap)
 
 	/* Unblock all USB pipes */
 	usb_clear_halt(d->udev,
-		usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		       usb_sndbulkpipe(d->udev,
+				       d->props.generic_bulk_ctrl_endpoint));
 	usb_clear_halt(d->udev,
-		usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		       usb_rcvbulkpipe(d->udev,
+				       d->props.generic_bulk_ctrl_endpoint));
 	usb_clear_halt(d->udev,
-		usb_rcvbulkpipe(d->udev, d->props.adapter[0].fe[0].stream.endpoint));
+		       usb_rcvbulkpipe(d->udev,
+				       d->props.adapter[0].fe[0].stream.endpoint));
 
 	/* attach frontend */
 	si2168_config.i2c_adapter = &adapter;
@@ -1379,7 +1414,7 @@ static int cxusb_mygica_t230_frontend_attach(struct dvb_usb_adapter *adap)
 	info.platform_data = &si2168_config;
 	request_module(info.type);
 	client_demod = i2c_new_device(&d->i2c_adap, &info);
-	if (client_demod == NULL || client_demod->dev.driver == NULL)
+	if (!client_demod || !client_demod->dev.driver)
 		return -ENODEV;
 
 	if (!try_module_get(client_demod->dev.driver->owner)) {
@@ -1399,7 +1434,7 @@ static int cxusb_mygica_t230_frontend_attach(struct dvb_usb_adapter *adap)
 	info.platform_data = &si2157_config;
 	request_module(info.type);
 	client_tuner = i2c_new_device(adapter, &info);
-	if (client_tuner == NULL || client_tuner->dev.driver == NULL) {
+	if (!client_tuner || !client_tuner->dev.driver) {
 		module_put(client_demod->dev.driver->owner);
 		i2c_unregister_device(client_demod);
 		return -ENODEV;
@@ -1543,18 +1578,20 @@ int cxusb_medion_get(struct dvb_usb_device *dvbdev,
 			}
 
 			cxdev->open_type = open_type;
-		} else
+		} else {
 			deb_info("reacquired idle %s\n",
 				 open_type == CXUSB_OPEN_ANALOG ?
 				 "analog" : "digital");
+		}
 
 		cxdev->open_ctr = 1;
 	} else if (cxdev->open_type == open_type) {
 		cxdev->open_ctr++;
 		deb_info("acquired %s\n", open_type == CXUSB_OPEN_ANALOG ?
 			 "analog" : "digital");
-	} else
+	} else {
 		ret = -EBUSY;
+	}
 
 ret_unlock:
 	mutex_unlock(&cxdev->open_lock);
@@ -1577,8 +1614,9 @@ void cxusb_medion_put(struct dvb_usb_device *dvbdev)
 	if (!WARN_ON(cxdev->open_ctr < 1)) {
 		cxdev->open_ctr--;
 
-		deb_info("release %s\n", cxdev->open_type ==
-			 CXUSB_OPEN_ANALOG ? "analog" : "digital");
+		deb_info("release %s\n",
+			 cxdev->open_type == CXUSB_OPEN_ANALOG ?
+			 "analog" : "digital");
 	}
 
 unlock:
@@ -1670,8 +1708,8 @@ static int cxusb_probe(struct usb_interface *intf,
 	int ret;
 
 	/* Medion 95700 */
-	if (0 == dvb_usb_device_init(intf, &cxusb_medion_properties,
-				     THIS_MODULE, &dvbdev, adapter_nr)) {
+	if (!dvb_usb_device_init(intf, &cxusb_medion_properties,
+				 THIS_MODULE, &dvbdev, adapter_nr)) {
 		if (!cxusb_medion_check_intf(intf)) {
 			ret = -ENODEV;
 			goto ret_uninit;
@@ -1694,33 +1732,39 @@ static int cxusb_probe(struct usb_interface *intf,
 		cxusb_medion_put(dvbdev);
 
 		return 0;
-	} else if (0 == dvb_usb_device_init(intf, &cxusb_bluebird_lgh064f_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_dee1601_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_lgz201_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_dtt7579_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_dualdig4_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_nano2_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf,
-				&cxusb_bluebird_nano2_needsfirmware_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_aver_a868r_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf,
-				     &cxusb_bluebird_dualdig4_rev2_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_d680_dmb_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_mygica_d689_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_mygica_t230_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0)
+	} else if (!dvb_usb_device_init(intf,
+					&cxusb_bluebird_lgh064f_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_dee1601_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_lgz201_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_dtt7579_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_dualdig4_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_nano2_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_nano2_needsfirmware_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf, &cxusb_aver_a868r_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf,
+					&cxusb_bluebird_dualdig4_rev2_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf, &cxusb_d680_dmb_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf, &cxusb_mygica_d689_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   !dvb_usb_device_init(intf, &cxusb_mygica_t230_properties,
+					THIS_MODULE, NULL, adapter_nr) ||
+		   0)
 		return 0;
 
 	return -EINVAL;
@@ -1786,10 +1830,12 @@ static struct usb_device_id cxusb_table[NR__cxusb_table_index + 1] = {
 		USB_DEVICE(USB_VID_DVICO, USB_PID_DVICO_BLUEBIRD_TH7579_WARM)
 	},
 	[DIGITALNOW_BLUEBIRD_DUAL_1_COLD] = {
-		USB_DEVICE(USB_VID_DVICO, USB_PID_DIGITALNOW_BLUEBIRD_DUAL_1_COLD)
+		USB_DEVICE(USB_VID_DVICO,
+			   USB_PID_DIGITALNOW_BLUEBIRD_DUAL_1_COLD)
 	},
 	[DIGITALNOW_BLUEBIRD_DUAL_1_WARM] = {
-		USB_DEVICE(USB_VID_DVICO, USB_PID_DIGITALNOW_BLUEBIRD_DUAL_1_WARM)
+		USB_DEVICE(USB_VID_DVICO,
+			   USB_PID_DIGITALNOW_BLUEBIRD_DUAL_1_WARM)
 	},
 	[DVICO_BLUEBIRD_DUAL_2_COLD] = {
 		USB_DEVICE(USB_VID_DVICO, USB_PID_DVICO_BLUEBIRD_DUAL_2_COLD)
@@ -1804,7 +1850,8 @@ static struct usb_device_id cxusb_table[NR__cxusb_table_index + 1] = {
 		USB_DEVICE(USB_VID_DVICO, USB_PID_DVICO_BLUEBIRD_DVB_T_NANO_2)
 	},
 	[DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM] = {
-		USB_DEVICE(USB_VID_DVICO, USB_PID_DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM)
+		USB_DEVICE(USB_VID_DVICO,
+			   USB_PID_DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM)
 	},
 	[AVERMEDIA_VOLAR_A868R] = {
 		USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_VOLAR_A868R)
@@ -1823,7 +1870,7 @@ static struct usb_device_id cxusb_table[NR__cxusb_table_index + 1] = {
 	},
 	{}		/* Terminating entry */
 };
-MODULE_DEVICE_TABLE (usb, cxusb_table);
+MODULE_DEVICE_TABLE(usb, cxusb_table);
 
 static struct dvb_usb_device_properties cxusb_medion_properties = {
 	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
@@ -1853,7 +1900,7 @@ static struct dvb_usb_device_properties cxusb_medion_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 	.power_ctrl       = cxusb_power_ctrl,
@@ -1864,7 +1911,8 @@ static struct dvb_usb_device_properties cxusb_medion_properties = {
 
 	.num_device_descs = 1,
 	.devices = {
-		{   "Medion MD95700 (MDUSBTV-HYBRID)",
+		{
+			"Medion MD95700 (MDUSBTV-HYBRID)",
 			{ NULL },
 			{ &cxusb_table[MEDION_MD95700], NULL },
 		},
@@ -1877,8 +1925,10 @@ static struct dvb_usb_device_properties cxusb_bluebird_lgh064f_properties = {
 	.usb_ctrl          = DEVICE_SPECIFIC,
 	.firmware          = "dvb-usb-bluebird-01.fw",
 	.download_firmware = bluebird_patch_dvico_firmware_download,
-	/* use usb alt setting 0 for EP4 transfer (dvb-t),
-	   use usb alt setting 7 for EP2 transfer (atsc) */
+	/*
+	 * use usb alt setting 0 for EP4 transfer (dvb-t),
+	 * use usb alt setting 7 for EP2 transfer (atsc)
+	 */
 
 	.size_of_priv     = sizeof(struct cxusb_state),
 
@@ -1902,7 +1952,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_lgh064f_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -1935,8 +1985,10 @@ static struct dvb_usb_device_properties cxusb_bluebird_dee1601_properties = {
 	.usb_ctrl          = DEVICE_SPECIFIC,
 	.firmware          = "dvb-usb-bluebird-01.fw",
 	.download_firmware = bluebird_patch_dvico_firmware_download,
-	/* use usb alt setting 0 for EP4 transfer (dvb-t),
-	   use usb alt setting 7 for EP2 transfer (atsc) */
+	/*
+	 * use usb alt setting 0 for EP4 transfer (dvb-t),
+	 * use usb alt setting 7 for EP2 transfer (atsc)
+	 */
 
 	.size_of_priv     = sizeof(struct cxusb_state),
 
@@ -1959,7 +2011,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_dee1601_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -1984,7 +2036,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_dee1601_properties = {
 			{ &cxusb_table[DVICO_BLUEBIRD_DUAL_1_WARM], NULL },
 		},
 		{   "DigitalNow DVB-T Dual USB",
-			{ &cxusb_table[DIGITALNOW_BLUEBIRD_DUAL_1_COLD],  NULL },
+			{ &cxusb_table[DIGITALNOW_BLUEBIRD_DUAL_1_COLD], NULL },
 			{ &cxusb_table[DIGITALNOW_BLUEBIRD_DUAL_1_WARM], NULL },
 		},
 		{   "DViCO FusionHDTV DVB-T Dual Digital 2",
@@ -2000,8 +2052,10 @@ static struct dvb_usb_device_properties cxusb_bluebird_lgz201_properties = {
 	.usb_ctrl          = DEVICE_SPECIFIC,
 	.firmware          = "dvb-usb-bluebird-01.fw",
 	.download_firmware = bluebird_patch_dvico_firmware_download,
-	/* use usb alt setting 0 for EP4 transfer (dvb-t),
-	   use usb alt setting 7 for EP2 transfer (atsc) */
+	/*
+	 * use usb alt setting 0 for EP4 transfer (dvb-t),
+	 * use usb alt setting 7 for EP2 transfer (atsc)
+	 */
 
 	.size_of_priv     = sizeof(struct cxusb_state),
 
@@ -2025,7 +2079,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_lgz201_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 	.power_ctrl       = cxusb_bluebird_power_ctrl,
@@ -2056,8 +2110,11 @@ static struct dvb_usb_device_properties cxusb_bluebird_dtt7579_properties = {
 	.usb_ctrl          = DEVICE_SPECIFIC,
 	.firmware          = "dvb-usb-bluebird-01.fw",
 	.download_firmware = bluebird_patch_dvico_firmware_download,
-	/* use usb alt setting 0 for EP4 transfer (dvb-t),
-	   use usb alt setting 7 for EP2 transfer (atsc) */
+
+	/*
+	 * use usb alt setting 0 for EP4 transfer (dvb-t),
+	 * use usb alt setting 7 for EP2 transfer (atsc)
+	 */
 
 	.size_of_priv     = sizeof(struct cxusb_state),
 
@@ -2081,7 +2138,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_dtt7579_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 	.power_ctrl       = cxusb_bluebird_power_ctrl,
@@ -2133,7 +2190,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_dualdig4_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -2187,7 +2244,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_nano2_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -2214,7 +2271,8 @@ static struct dvb_usb_device_properties cxusb_bluebird_nano2_properties = {
 	}
 };
 
-static struct dvb_usb_device_properties cxusb_bluebird_nano2_needsfirmware_properties = {
+static struct dvb_usb_device_properties
+cxusb_bluebird_nano2_needsfirmware_properties = {
 	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
 
 	.usb_ctrl          = DEVICE_SPECIFIC,
@@ -2243,7 +2301,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_nano2_needsfirmware_prope
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -2262,10 +2320,11 @@ static struct dvb_usb_device_properties cxusb_bluebird_nano2_needsfirmware_prope
 	},
 
 	.num_device_descs = 1,
-	.devices = {
-		{   "DViCO FusionHDTV DVB-T NANO2 w/o firmware",
+	.devices = { {
+			"DViCO FusionHDTV DVB-T NANO2 w/o firmware",
 			{ &cxusb_table[DVICO_BLUEBIRD_DVB_T_NANO_2], NULL },
-			{ &cxusb_table[DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM], NULL },
+			{ &cxusb_table[DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM],
+			  NULL },
 		},
 	}
 };
@@ -2296,7 +2355,7 @@ static struct dvb_usb_device_properties cxusb_aver_a868r_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 	.power_ctrl       = cxusb_aver_power_ctrl,
@@ -2342,7 +2401,7 @@ struct dvb_usb_device_properties cxusb_bluebird_dualdig4_rev2_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -2396,7 +2455,7 @@ static struct dvb_usb_device_properties cxusb_d680_dmb_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
@@ -2451,7 +2510,7 @@ static struct dvb_usb_device_properties cxusb_mygica_d689_properties = {
 					}
 				}
 			},
-		}},
+		} },
 		},
 	},
 
diff --git a/drivers/media/usb/dvb-usb/cxusb.h b/drivers/media/usb/dvb-usb/cxusb.h
index 35e72f571a2c..eb70fbb02680 100644
--- a/drivers/media/usb/dvb-usb/cxusb.h
+++ b/drivers/media/usb/dvb-usb/cxusb.h
@@ -77,12 +77,14 @@ struct cxusb_state {
 	struct mutex stream_mutex;
 	u8 last_lock;
 	int (*fe_read_status)(struct dvb_frontend *fe,
-		enum fe_status *status);
+			      enum fe_status *status);
 };
 
 enum cxusb_open_type {
-	CXUSB_OPEN_INIT, CXUSB_OPEN_NONE,
-	CXUSB_OPEN_ANALOG, CXUSB_OPEN_DIGITAL
+	CXUSB_OPEN_INIT,
+	CXUSB_OPEN_NONE,
+	CXUSB_OPEN_ANALOG,
+	CXUSB_OPEN_DIGITAL
 };
 
 struct cxusb_medion_auxbuf {
-- 
2.21.0

