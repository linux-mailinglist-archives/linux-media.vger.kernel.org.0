Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C1F1054E7
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 15:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUOz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 09:55:26 -0500
Received: from gofer.mess.org ([88.97.38.141]:58577 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfKUOz0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 09:55:26 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 315CCC646C; Thu, 21 Nov 2019 14:55:25 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: cxusb: use dev_dbg() rather than hand-rolled debug
Date:   Thu, 21 Nov 2019 14:55:25 +0000
Message-Id: <20191121145525.3286-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This solves the following compiler warnings:

drivers/media/usb/dvb-usb/cxusb.c: In function ‘cxusb_gpio_tuner’:
drivers/media/usb/dvb-usb/cxusb.c:128:35: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
  128 |   deb_info("gpio_write failed.\n");
      |                                   ^
drivers/media/usb/dvb-usb/cxusb.c: In function ‘cxusb_bluebird_gpio_rw’:
drivers/media/usb/dvb-usb/cxusb.c:145:44: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
  145 |   deb_info("bluebird_gpio_write failed.\n");
      |                                            ^
drivers/media/usb/dvb-usb/cxusb.c: In function ‘cxusb_i2c_xfer’:
drivers/media/usb/dvb-usb/cxusb.c:251:42: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
  251 |     deb_i2c("i2c read may have failed\n");
      |                                          ^
drivers/media/usb/dvb-usb/cxusb.c:274:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
  274 |     deb_i2c("i2c write may have failed\n");
      |                                           ^

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/cxusb.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index fac19ec46089..b634f9e86d61 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -54,9 +54,6 @@ MODULE_PARM_DESC(debug, "set debugging level (see cxusb.h)."
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
-#define deb_info(args...)   dprintk(dvb_usb_cxusb_debug, CXUSB_DBG_MISC, args)
-#define deb_i2c(args...)    dprintk(dvb_usb_cxusb_debug, CXUSB_DBG_I2C, args)
-
 enum cxusb_table_index {
 	MEDION_MD95700,
 	DVICO_BLUEBIRD_LG064F_COLD,
@@ -125,7 +122,7 @@ static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 	cxusb_ctrl_msg(d, CMD_GPIO_WRITE, o, 2, &i, 1);
 
 	if (i != 0x01)
-		deb_info("gpio_write failed.\n");
+		dev_info(&d->udev->dev, "gpio_write failed.\n");
 
 	st->gpio_write_state[GPIO_TUNER] = onoff;
 	st->gpio_write_refresh[GPIO_TUNER] = false;
@@ -142,7 +139,7 @@ static int cxusb_bluebird_gpio_rw(struct dvb_usb_device *d, u8 changemask,
 
 	rc = cxusb_ctrl_msg(d, CMD_BLUEBIRD_GPIO_RW, o, 2, &gpio_state, 1);
 	if (rc < 0 || (gpio_state & changemask) != (newval & changemask))
-		deb_info("bluebird_gpio_write failed.\n");
+		dev_info(&d->udev->dev, "bluebird_gpio_write failed.\n");
 
 	return rc < 0 ? rc : gpio_state;
 }
@@ -174,7 +171,7 @@ static int cxusb_d680_dmb_gpio_tuner(struct dvb_usb_device *d,
 	if (i == 0x01)
 		return 0;
 
-	deb_info("gpio_write failed.\n");
+	dev_info(&d->udev->dev, "gpio_write failed.\n");
 	return -EIO;
 }
 
@@ -248,7 +245,7 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				break;
 
 			if (ibuf[0] != 0x08)
-				deb_i2c("i2c read may have failed\n");
+				dev_info(&d->udev->dev, "i2c read may have failed\n");
 
 			memcpy(msg[i + 1].buf, &ibuf[1], msg[i + 1].len);
 
@@ -271,7 +268,7 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 					   2 + msg[i].len, &ibuf, 1) < 0)
 				break;
 			if (ibuf != 0x08)
-				deb_i2c("i2c write may have failed\n");
+				dev_info(&d->udev->dev, "i2c write may have failed\n");
 		}
 	}
 
@@ -299,7 +296,7 @@ static int _cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	u8 b = 0;
 
-	deb_info("setting power %s\n", onoff ? "ON" : "OFF");
+	dev_info(&d->udev->dev, "setting power %s\n", onoff ? "ON" : "OFF");
 
 	if (onoff)
 		return cxusb_ctrl_msg(d, CMD_POWER_ON, &b, 1, NULL, 0);
@@ -318,7 +315,7 @@ static int cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
 		mutex_lock(&cxdev->open_lock);
 
 		if (cxdev->open_type == CXUSB_OPEN_ANALOG) {
-			deb_info("preventing DVB core from setting power OFF while we are in analog mode\n");
+			dev_info(&d->udev->dev, "preventing DVB core from setting power OFF while we are in analog mode\n");
 			ret = -EBUSY;
 			goto ret_unlock;
 		}
@@ -754,16 +751,16 @@ static int dvico_bluebird_xc2028_callback(void *ptr, int component,
 
 	switch (command) {
 	case XC2028_TUNER_RESET:
-		deb_info("%s: XC2028_TUNER_RESET %d\n", __func__, arg);
+		dev_info(&d->udev->dev, "XC2028_TUNER_RESET %d\n", arg);
 		cxusb_bluebird_gpio_pulse(d, 0x01, 1);
 		break;
 	case XC2028_RESET_CLK:
-		deb_info("%s: XC2028_RESET_CLK %d\n", __func__, arg);
+		dev_info(&d->udev->dev, "XC2028_RESET_CLK %d\n", arg);
 		break;
 	case XC2028_I2C_FLUSH:
 		break;
 	default:
-		deb_info("%s: unknown command %d, arg %d\n", __func__,
+		dev_info(&d->udev->dev, "unknown command %d, arg %d\n",
 			 command, arg);
 		return -EINVAL;
 	}
@@ -1444,7 +1441,7 @@ int cxusb_medion_get(struct dvb_usb_device *dvbdev,
 
 	if (cxdev->open_ctr == 0) {
 		if (cxdev->open_type != open_type) {
-			deb_info("will acquire and switch to %s\n",
+			dev_info(&dvbdev->udev->dev, "will acquire and switch to %s\n",
 				 open_type == CXUSB_OPEN_ANALOG ?
 				 "analog" : "digital");
 
@@ -1476,7 +1473,7 @@ int cxusb_medion_get(struct dvb_usb_device *dvbdev,
 
 			cxdev->open_type = open_type;
 		} else {
-			deb_info("reacquired idle %s\n",
+			dev_info(&dvbdev->udev->dev, "reacquired idle %s\n",
 				 open_type == CXUSB_OPEN_ANALOG ?
 				 "analog" : "digital");
 		}
@@ -1484,7 +1481,7 @@ int cxusb_medion_get(struct dvb_usb_device *dvbdev,
 		cxdev->open_ctr = 1;
 	} else if (cxdev->open_type == open_type) {
 		cxdev->open_ctr++;
-		deb_info("acquired %s\n", open_type == CXUSB_OPEN_ANALOG ?
+		dev_info(&dvbdev->udev->dev, "acquired %s\n", open_type == CXUSB_OPEN_ANALOG ?
 			 "analog" : "digital");
 	} else {
 		ret = -EBUSY;
@@ -1511,7 +1508,7 @@ void cxusb_medion_put(struct dvb_usb_device *dvbdev)
 	if (!WARN_ON(cxdev->open_ctr < 1)) {
 		cxdev->open_ctr--;
 
-		deb_info("release %s\n",
+		dev_info(&dvbdev->udev->dev, "release %s\n",
 			 cxdev->open_type == CXUSB_OPEN_ANALOG ?
 			 "analog" : "digital");
 	}
-- 
2.23.0

