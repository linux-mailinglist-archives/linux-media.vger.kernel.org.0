Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B93E785
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 18:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbfD2QRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 12:17:47 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:56348 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728846AbfD2QRr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 12:17:47 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hL8yJ-0002qE-Kf; Mon, 29 Apr 2019 18:17:39 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v12 6/8] [media] cxusb: implement Medion MD95700 digital / analog coexistence
Date:   Mon, 29 Apr 2019 18:16:57 +0200
Message-Id: <633ca7a8d6558ea63ec664c0ba42aa694d7f9237.1556554056.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1556554056.git.mail@maciej.szmigiero.name>
References: <cover.1556554056.git.mail@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch prepares cxusb driver for supporting the analog part of
Medion 95700 (previously only the digital - DVB - mode was supported).

Specifically, it adds support for:
* switching the device between analog and digital modes of operation,
* enforcing that only one mode is active at the same time due to hardware
limitations.

Actual implementation of the analog mode will be provided by the next
commit.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/media/usb/dvb-usb/cxusb.c        | 449 ++++++++++++++++++++---
 drivers/media/usb/dvb-usb/cxusb.h        |  48 +++
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c  |   5 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c |  13 +
 drivers/media/usb/dvb-usb/dvb-usb.h      |  10 +
 5 files changed, 472 insertions(+), 53 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index 9ddb2000249e..68b0543abbdc 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -16,6 +16,7 @@
  * Copyright (C) 2005 Patrick Boettcher (patrick.boettcher@posteo.de)
  * Copyright (C) 2006 Michael Krufky (mkrufky@linuxtv.org)
  * Copyright (C) 2006, 2007 Chris Pascoe (c.pascoe@itee.uq.edu.au)
+ * Copyright (C) 2011, 2017 Maciej S. Szmigiero (mail@maciej.szmigiero.name)
  *
  *   This program is free software; you can redistribute it and/or modify it
  *   under the terms of the GNU General Public License as published by the Free
@@ -24,9 +25,12 @@
  * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
  */
 #include <media/tuner.h>
-#include <linux/vmalloc.h>
-#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/vmalloc.h>
 
 #include "cxusb.h"
 
@@ -47,17 +51,45 @@
 #include "si2157.h"
 
 /* debug */
-static int dvb_usb_cxusb_debug;
+int dvb_usb_cxusb_debug;
 module_param_named(debug, dvb_usb_cxusb_debug, int, 0644);
-MODULE_PARM_DESC(debug, "set debugging level (1=rc (or-able))." DVB_USB_DEBUG_STATUS);
+MODULE_PARM_DESC(debug, "set debugging level (see cxusb.h)."
+		 DVB_USB_DEBUG_STATUS);
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
-#define deb_info(args...)   dprintk(dvb_usb_cxusb_debug, 0x03, args)
-#define deb_i2c(args...)    dprintk(dvb_usb_cxusb_debug, 0x02, args)
+#define deb_info(args...)   dprintk(dvb_usb_cxusb_debug, CXUSB_DBG_MISC, args)
+#define deb_i2c(args...)    dprintk(dvb_usb_cxusb_debug, CXUSB_DBG_I2C, args)
+
+enum cxusb_table_index {
+	MEDION_MD95700,
+	DVICO_BLUEBIRD_LG064F_COLD,
+	DVICO_BLUEBIRD_LG064F_WARM,
+	DVICO_BLUEBIRD_DUAL_1_COLD,
+	DVICO_BLUEBIRD_DUAL_1_WARM,
+	DVICO_BLUEBIRD_LGZ201_COLD,
+	DVICO_BLUEBIRD_LGZ201_WARM,
+	DVICO_BLUEBIRD_TH7579_COLD,
+	DVICO_BLUEBIRD_TH7579_WARM,
+	DIGITALNOW_BLUEBIRD_DUAL_1_COLD,
+	DIGITALNOW_BLUEBIRD_DUAL_1_WARM,
+	DVICO_BLUEBIRD_DUAL_2_COLD,
+	DVICO_BLUEBIRD_DUAL_2_WARM,
+	DVICO_BLUEBIRD_DUAL_4,
+	DVICO_BLUEBIRD_DVB_T_NANO_2,
+	DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM,
+	AVERMEDIA_VOLAR_A868R,
+	DVICO_BLUEBIRD_DUAL_4_REV_2,
+	CONEXANT_D680_DMB,
+	MYGICA_D689,
+	MYGICA_T230,
+	NR__cxusb_table_index
+};
+
+static struct usb_device_id cxusb_table[];
 
-static int cxusb_ctrl_msg(struct dvb_usb_device *d,
-			  u8 cmd, const u8 *wbuf, int wlen, u8 *rbuf, int rlen)
+int cxusb_ctrl_msg(struct dvb_usb_device *d,
+		   u8 cmd, const u8 *wbuf, int wlen, u8 *rbuf, int rlen)
 {
 	struct cxusb_state *st = d->priv;
 	int ret;
@@ -89,7 +121,8 @@ static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 	struct cxusb_state *st = d->priv;
 	u8 o[2], i;
 
-	if (st->gpio_write_state[GPIO_TUNER] == onoff)
+	if (st->gpio_write_state[GPIO_TUNER] == onoff &&
+	    !st->gpio_write_refresh[GPIO_TUNER])
 		return;
 
 	o[0] = GPIO_TUNER;
@@ -100,6 +133,7 @@ static void cxusb_gpio_tuner(struct dvb_usb_device *d, int onoff)
 		deb_info("gpio_write failed.\n");
 
 	st->gpio_write_state[GPIO_TUNER] = onoff;
+	st->gpio_write_refresh[GPIO_TUNER] = false;
 }
 
 static int cxusb_bluebird_gpio_rw(struct dvb_usb_device *d, u8 changemask,
@@ -259,7 +293,7 @@ static int cxusb_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 
 static u32 cxusb_i2c_func(struct i2c_adapter *adapter)
 {
-	return I2C_FUNC_I2C;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
 static struct i2c_algorithm cxusb_i2c_algo = {
@@ -267,15 +301,48 @@ static struct i2c_algorithm cxusb_i2c_algo = {
 	.functionality = cxusb_i2c_func,
 };
 
-static int cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
+static int _cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	u8 b = 0;
+
+	deb_info("setting power %s\n", onoff ? "ON" : "OFF");
+
 	if (onoff)
 		return cxusb_ctrl_msg(d, CMD_POWER_ON, &b, 1, NULL, 0);
 	else
 		return cxusb_ctrl_msg(d, CMD_POWER_OFF, &b, 1, NULL, 0);
 }
 
+static int cxusb_power_ctrl(struct dvb_usb_device *d, int onoff)
+{
+	bool is_medion = d->props.devices[0].warm_ids[0] ==
+		&cxusb_table[MEDION_MD95700];
+	int ret;
+
+	if (is_medion && !onoff) {
+		struct cxusb_medion_dev *cxdev = d->priv;
+
+		mutex_lock(&cxdev->open_lock);
+
+		if (cxdev->open_type == CXUSB_OPEN_ANALOG) {
+			deb_info("preventing DVB core from setting power OFF while we are in analog mode\n");
+			ret = -EBUSY;
+			goto ret_unlock;
+		}
+	}
+
+	ret = _cxusb_power_ctrl(d, onoff);
+
+ret_unlock:
+	if (is_medion && !onoff) {
+		struct cxusb_medion_dev *cxdev = d->priv;
+
+		mutex_unlock(&cxdev->open_lock);
+	}
+
+	return ret;
+}
+
 static int cxusb_aver_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	int ret;
@@ -353,11 +420,26 @@ static int cxusb_d680_dmb_power_ctrl(struct dvb_usb_device *d, int onoff)
 
 static int cxusb_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 {
+	struct dvb_usb_device *dvbdev = adap->dev;
+	bool is_medion = dvbdev->props.devices[0].warm_ids[0] ==
+		&cxusb_table[MEDION_MD95700];
 	u8 buf[2] = { 0x03, 0x00 };
+
+	if (is_medion && onoff) {
+		int ret;
+
+		ret = cxusb_medion_get(dvbdev, CXUSB_OPEN_DIGITAL);
+		if (ret != 0)
+			return ret;
+	}
+
 	if (onoff)
-		cxusb_ctrl_msg(adap->dev, CMD_STREAMING_ON, buf, 2, NULL, 0);
+		cxusb_ctrl_msg(dvbdev, CMD_STREAMING_ON, buf, 2, NULL, 0);
 	else
-		cxusb_ctrl_msg(adap->dev, CMD_STREAMING_OFF, NULL, 0, NULL, 0);
+		cxusb_ctrl_msg(dvbdev, CMD_STREAMING_OFF, NULL, 0, NULL, 0);
+
+	if (is_medion && !onoff)
+		cxusb_medion_put(dvbdev);
 
 	return 0;
 }
@@ -630,9 +712,21 @@ static struct max2165_config mygica_d689_max2165_cfg = {
 /* Callbacks for DVB USB */
 static int cxusb_fmd1216me_tuner_attach(struct dvb_usb_adapter *adap)
 {
+	struct dvb_usb_device *dvbdev = adap->dev;
+	bool is_medion = dvbdev->props.devices[0].warm_ids[0] ==
+		&cxusb_table[MEDION_MD95700];
+
 	dvb_attach(simple_tuner_attach, adap->fe_adap[0].fe,
-		   &adap->dev->i2c_adap, 0x61,
+		   &dvbdev->i2c_adap, 0x61,
 		   TUNER_PHILIPS_FMD1216ME_MK3);
+
+	if (is_medion && adap->fe_adap[0].fe != NULL)
+		/*
+		 * make sure that DVB core won't put to sleep (reset, really)
+		 * tuner when we might be open in analog mode
+		 */
+		adap->fe_adap[0].fe->ops.tuner_ops.sleep = NULL;
+
 	return 0;
 }
 
@@ -736,20 +830,105 @@ static int cxusb_mygica_d689_tuner_attach(struct dvb_usb_adapter *adap)
 	return (fe == NULL) ? -EIO : 0;
 }
 
-static int cxusb_cx22702_frontend_attach(struct dvb_usb_adapter *adap)
+static int cxusb_medion_fe_ts_bus_ctrl(struct dvb_frontend *fe, int acquire)
 {
+	struct dvb_usb_adapter *adap = fe->dvb->priv;
+	struct dvb_usb_device *dvbdev = adap->dev;
+
+	if (acquire)
+		return cxusb_medion_get(dvbdev, CXUSB_OPEN_DIGITAL);
+
+	cxusb_medion_put(dvbdev);
+
+	return 0;
+}
+
+static int cxusb_medion_set_mode(struct dvb_usb_device *dvbdev, bool digital)
+{
+	struct cxusb_state *st = dvbdev->priv;
+	int ret;
 	u8 b;
-	if (usb_set_interface(adap->dev->udev, 0, 6) < 0)
-		err("set interface failed");
+	unsigned int i;
+
+	/*
+	 * switching mode while doing an I2C transaction often causes
+	 * the device to crash
+	 */
+	mutex_lock(&dvbdev->i2c_mutex);
+
+	if (digital) {
+		ret = usb_set_interface(dvbdev->udev, 0, 6);
+		if (ret != 0) {
+			dev_err(&dvbdev->udev->dev,
+				"digital interface selection failed (%d)\n",
+				ret);
+			goto ret_unlock;
+		}
+	} else {
+		ret = usb_set_interface(dvbdev->udev, 0, 1);
+		if (ret != 0) {
+			dev_err(&dvbdev->udev->dev,
+				"analog interface selection failed (%d)\n",
+				ret);
+			goto ret_unlock;
+		}
+	}
+
+	/* pipes need to be cleared after setting interface */
+	ret = usb_clear_halt(dvbdev->udev, usb_rcvbulkpipe(dvbdev->udev, 1));
+	if (ret != 0)
+		dev_warn(&dvbdev->udev->dev,
+			 "clear halt on IN pipe failed (%d)\n",
+			 ret);
+
+	ret = usb_clear_halt(dvbdev->udev, usb_sndbulkpipe(dvbdev->udev, 1));
+	if (ret != 0)
+		dev_warn(&dvbdev->udev->dev,
+			 "clear halt on OUT pipe failed (%d)\n",
+			 ret);
+
+	ret = cxusb_ctrl_msg(dvbdev, digital ? CMD_DIGITAL : CMD_ANALOG,
+			     NULL, 0, &b, 1);
+	if (ret != 0) {
+		dev_err(&dvbdev->udev->dev, "mode switch failed (%d)\n",
+			ret);
+		goto ret_unlock;
+	}
+
+	/* mode switch seems to reset GPIO states */
+	for (i = 0; i < ARRAY_SIZE(st->gpio_write_refresh); i++)
+		st->gpio_write_refresh[i] = true;
 
-	cxusb_ctrl_msg(adap->dev, CMD_DIGITAL, NULL, 0, &b, 1);
+ret_unlock:
+	mutex_unlock(&dvbdev->i2c_mutex);
+
+	return ret;
+}
+
+static int cxusb_cx22702_frontend_attach(struct dvb_usb_adapter *adap)
+{
+	struct dvb_usb_device *dvbdev = adap->dev;
+	bool is_medion = dvbdev->props.devices[0].warm_ids[0] ==
+		&cxusb_table[MEDION_MD95700];
+
+	if (is_medion) {
+		int ret;
+
+		ret = cxusb_medion_set_mode(dvbdev, true);
+		if (ret)
+			return ret;
+	}
 
 	adap->fe_adap[0].fe = dvb_attach(cx22702_attach, &cxusb_cx22702_config,
-					 &adap->dev->i2c_adap);
-	if ((adap->fe_adap[0].fe) != NULL)
-		return 0;
+					 &dvbdev->i2c_adap);
+	if (adap->fe_adap[0].fe == NULL)
+		return -EIO;
 
-	return -EIO;
+	if (is_medion)
+		adap->fe_adap[0].fe->ops.ts_bus_ctrl =
+			cxusb_medion_fe_ts_bus_ctrl;
+
+	return 0;
 }
 
 static int cxusb_lgdt3303_frontend_attach(struct dvb_usb_adapter *adap)
@@ -1312,6 +1491,101 @@ static int bluebird_patch_dvico_firmware_download(struct usb_device *udev,
 	return -EINVAL;
 }
 
+int cxusb_medion_get(struct dvb_usb_device *dvbdev,
+		     enum cxusb_open_type open_type)
+{
+	struct cxusb_medion_dev *cxdev = dvbdev->priv;
+	int ret = 0;
+
+	mutex_lock(&cxdev->open_lock);
+
+	if (WARN_ON((cxdev->open_type == CXUSB_OPEN_INIT ||
+		     cxdev->open_type == CXUSB_OPEN_NONE) &&
+		    cxdev->open_ctr != 0)) {
+		ret = -EINVAL;
+		goto ret_unlock;
+	}
+
+	if (cxdev->open_type == CXUSB_OPEN_INIT) {
+		ret = -EAGAIN;
+		goto ret_unlock;
+	}
+
+	if (cxdev->open_ctr == 0) {
+		if (cxdev->open_type != open_type) {
+			deb_info("will acquire and switch to %s\n",
+				 open_type == CXUSB_OPEN_ANALOG ?
+				 "analog" : "digital");
+
+			if (open_type == CXUSB_OPEN_ANALOG) {
+				ret = _cxusb_power_ctrl(dvbdev, 1);
+				if (ret != 0)
+					dev_warn(&dvbdev->udev->dev,
+						 "powerup for analog switch failed (%d)\n",
+						 ret);
+
+				ret = cxusb_medion_set_mode(dvbdev, false);
+				if (ret != 0)
+					goto ret_unlock;
+
+				ret = cxusb_medion_analog_init(dvbdev);
+				if (ret != 0)
+					goto ret_unlock;
+			} else { /* digital */
+				ret = _cxusb_power_ctrl(dvbdev, 1);
+				if (ret != 0)
+					dev_warn(&dvbdev->udev->dev,
+						 "powerup for digital switch failed (%d)\n",
+						 ret);
+
+				ret = cxusb_medion_set_mode(dvbdev, true);
+				if (ret != 0)
+					goto ret_unlock;
+			}
+
+			cxdev->open_type = open_type;
+		} else
+			deb_info("reacquired idle %s\n",
+				 open_type == CXUSB_OPEN_ANALOG ?
+				 "analog" : "digital");
+
+		cxdev->open_ctr = 1;
+	} else if (cxdev->open_type == open_type) {
+		cxdev->open_ctr++;
+		deb_info("acquired %s\n", open_type == CXUSB_OPEN_ANALOG ?
+			 "analog" : "digital");
+	} else
+		ret = -EBUSY;
+
+ret_unlock:
+	mutex_unlock(&cxdev->open_lock);
+
+	return ret;
+}
+
+void cxusb_medion_put(struct dvb_usb_device *dvbdev)
+{
+	struct cxusb_medion_dev *cxdev = dvbdev->priv;
+
+	mutex_lock(&cxdev->open_lock);
+
+	if (cxdev->open_type == CXUSB_OPEN_INIT) {
+		WARN_ON(cxdev->open_ctr != 0);
+		cxdev->open_type = CXUSB_OPEN_NONE;
+		goto unlock;
+	}
+
+	if (!WARN_ON(cxdev->open_ctr < 1)) {
+		cxdev->open_ctr--;
+
+		deb_info("release %s\n", cxdev->open_type ==
+			 CXUSB_OPEN_ANALOG ? "analog" : "digital");
+	}
+
+unlock:
+	mutex_unlock(&cxdev->open_lock);
+}
+
 /* DVB USB Driver stuff */
 static struct dvb_usb_device_properties cxusb_medion_properties;
 static struct dvb_usb_device_properties cxusb_bluebird_lgh064f_properties;
@@ -1327,12 +1601,101 @@ static struct dvb_usb_device_properties cxusb_d680_dmb_properties;
 static struct dvb_usb_device_properties cxusb_mygica_d689_properties;
 static struct dvb_usb_device_properties cxusb_mygica_t230_properties;
 
+static int cxusb_medion_priv_init(struct dvb_usb_device *dvbdev)
+{
+	struct cxusb_medion_dev *cxdev = dvbdev->priv;
+
+	cxdev->dvbdev = dvbdev;
+	cxdev->open_type = CXUSB_OPEN_INIT;
+	mutex_init(&cxdev->open_lock);
+
+	return 0;
+}
+
+static void cxusb_medion_priv_destroy(struct dvb_usb_device *dvbdev)
+{
+	struct cxusb_medion_dev *cxdev = dvbdev->priv;
+
+	mutex_destroy(&cxdev->open_lock);
+}
+
+static bool cxusb_medion_check_altsetting(struct usb_host_interface *as)
+{
+	unsigned int ctr;
+
+	for (ctr = 0; ctr < as->desc.bNumEndpoints; ctr++) {
+		if ((as->endpoint[ctr].desc.bEndpointAddress &
+		     USB_ENDPOINT_NUMBER_MASK) != 2)
+			continue;
+
+		if (as->endpoint[ctr].desc.bEndpointAddress & USB_DIR_IN &&
+		    ((as->endpoint[ctr].desc.bmAttributes &
+		      USB_ENDPOINT_XFERTYPE_MASK) == USB_ENDPOINT_XFER_ISOC))
+			return true;
+
+		break;
+	}
+
+	return false;
+}
+
+static bool cxusb_medion_check_intf(struct usb_interface *intf)
+{
+	unsigned int ctr;
+
+	if (intf->num_altsetting < 2) {
+		dev_err(intf->usb_dev, "no alternate interface");
+
+		return false;
+	}
+
+	for (ctr = 0; ctr < intf->num_altsetting; ctr++) {
+		if (intf->altsetting[ctr].desc.bAlternateSetting != 1)
+			continue;
+
+		if (cxusb_medion_check_altsetting(&intf->altsetting[ctr]))
+			return true;
+
+		break;
+	}
+
+	dev_err(intf->usb_dev, "no iso interface");
+
+	return false;
+}
+
 static int cxusb_probe(struct usb_interface *intf,
 		       const struct usb_device_id *id)
 {
+	struct dvb_usb_device *dvbdev;
+	int ret;
+
+	/* Medion 95700 */
 	if (0 == dvb_usb_device_init(intf, &cxusb_medion_properties,
-				     THIS_MODULE, NULL, adapter_nr) ||
-	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_lgh064f_properties,
+				     THIS_MODULE, &dvbdev, adapter_nr)) {
+		if (!cxusb_medion_check_intf(intf)) {
+			ret = -ENODEV;
+			goto ret_uninit;
+		}
+
+		_cxusb_power_ctrl(dvbdev, 1);
+		ret = cxusb_medion_set_mode(dvbdev, false);
+		if (ret)
+			goto ret_uninit;
+
+		ret = cxusb_medion_register_analog(dvbdev);
+
+		cxusb_medion_set_mode(dvbdev, true);
+		_cxusb_power_ctrl(dvbdev, 0);
+
+		if (ret != 0)
+			goto ret_uninit;
+
+		/* release device from INIT mode to normal operation */
+		cxusb_medion_put(dvbdev);
+
+		return 0;
+	} else if (0 == dvb_usb_device_init(intf, &cxusb_bluebird_lgh064f_properties,
 				     THIS_MODULE, NULL, adapter_nr) ||
 	    0 == dvb_usb_device_init(intf, &cxusb_bluebird_dee1601_properties,
 				     THIS_MODULE, NULL, adapter_nr) ||
@@ -1362,6 +1725,11 @@ static int cxusb_probe(struct usb_interface *intf,
 		return 0;
 
 	return -EINVAL;
+
+ret_uninit:
+	dvb_usb_device_exit(intf);
+
+	return ret;
 }
 
 static void cxusb_disconnect(struct usb_interface *intf)
@@ -1370,6 +1738,9 @@ static void cxusb_disconnect(struct usb_interface *intf)
 	struct cxusb_state *st = d->priv;
 	struct i2c_client *client;
 
+	if (d->props.devices[0].warm_ids[0] == &cxusb_table[MEDION_MD95700])
+		cxusb_medion_unregister_analog(d);
+
 	/* remove I2C client for tuner */
 	client = st->i2c_client_tuner;
 	if (client) {
@@ -1387,31 +1758,6 @@ static void cxusb_disconnect(struct usb_interface *intf)
 	dvb_usb_device_exit(intf);
 }
 
-enum cxusb_table_index {
-	MEDION_MD95700,
-	DVICO_BLUEBIRD_LG064F_COLD,
-	DVICO_BLUEBIRD_LG064F_WARM,
-	DVICO_BLUEBIRD_DUAL_1_COLD,
-	DVICO_BLUEBIRD_DUAL_1_WARM,
-	DVICO_BLUEBIRD_LGZ201_COLD,
-	DVICO_BLUEBIRD_LGZ201_WARM,
-	DVICO_BLUEBIRD_TH7579_COLD,
-	DVICO_BLUEBIRD_TH7579_WARM,
-	DIGITALNOW_BLUEBIRD_DUAL_1_COLD,
-	DIGITALNOW_BLUEBIRD_DUAL_1_WARM,
-	DVICO_BLUEBIRD_DUAL_2_COLD,
-	DVICO_BLUEBIRD_DUAL_2_WARM,
-	DVICO_BLUEBIRD_DUAL_4,
-	DVICO_BLUEBIRD_DVB_T_NANO_2,
-	DVICO_BLUEBIRD_DVB_T_NANO_2_NFW_WARM,
-	AVERMEDIA_VOLAR_A868R,
-	DVICO_BLUEBIRD_DUAL_4_REV_2,
-	CONEXANT_D680_DMB,
-	MYGICA_D689,
-	MYGICA_T230,
-	NR__cxusb_table_index
-};
-
 static struct usb_device_id cxusb_table[NR__cxusb_table_index + 1] = {
 	[MEDION_MD95700] = {
 		USB_DEVICE(USB_VID_MEDION, USB_PID_MEDION_MD95700)
@@ -1485,7 +1831,9 @@ static struct dvb_usb_device_properties cxusb_medion_properties = {
 
 	.usb_ctrl = CYPRESS_FX2,
 
-	.size_of_priv     = sizeof(struct cxusb_state),
+	.size_of_priv     = sizeof(struct cxusb_medion_dev),
+	.priv_init        = cxusb_medion_priv_init,
+	.priv_destroy     = cxusb_medion_priv_destroy,
 
 	.num_adapters = 1,
 	.adapter = {
@@ -2198,6 +2546,7 @@ module_usb_driver(cxusb_driver);
 MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_AUTHOR("Michael Krufky <mkrufky@linuxtv.org>");
 MODULE_AUTHOR("Chris Pascoe <c.pascoe@itee.uq.edu.au>");
+MODULE_AUTHOR("Maciej S. Szmigiero <mail@maciej.szmigiero.name>");
 MODULE_DESCRIPTION("Driver for Conexant USB2.0 hybrid reference design");
 MODULE_VERSION("1.0-alpha");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/usb/dvb-usb/cxusb.h b/drivers/media/usb/dvb-usb/cxusb.h
index 88f9b9804b25..f586d61a7bf8 100644
--- a/drivers/media/usb/dvb-usb/cxusb.h
+++ b/drivers/media/usb/dvb-usb/cxusb.h
@@ -2,6 +2,9 @@
 #ifndef _DVB_USB_CXUSB_H_
 #define _DVB_USB_CXUSB_H_
 
+#include <linux/i2c.h>
+#include <linux/mutex.h>
+
 #define DVB_USB_LOG_PREFIX "cxusb"
 #include "dvb-usb.h"
 
@@ -34,6 +37,7 @@
 
 struct cxusb_state {
 	u8 gpio_write_state[3];
+	bool gpio_write_refresh[3];
 	struct i2c_client *i2c_client_demod;
 	struct i2c_client *i2c_client_tuner;
 
@@ -45,4 +49,48 @@ struct cxusb_state {
 		enum fe_status *status);
 };
 
+enum cxusb_open_type {
+	CXUSB_OPEN_INIT, CXUSB_OPEN_NONE,
+	CXUSB_OPEN_ANALOG, CXUSB_OPEN_DIGITAL
+};
+
+struct cxusb_medion_dev {
+	/* has to be the first one */
+	struct cxusb_state state;
+
+	struct dvb_usb_device *dvbdev;
+
+	enum cxusb_open_type open_type;
+	unsigned int open_ctr;
+	struct mutex open_lock;
+};
+
+/* defines for "debug" module parameter */
+#define CXUSB_DBG_RC BIT(0)
+#define CXUSB_DBG_I2C BIT(1)
+#define CXUSB_DBG_MISC BIT(2)
+
+extern int dvb_usb_cxusb_debug;
+
+int cxusb_ctrl_msg(struct dvb_usb_device *d,
+		   u8 cmd, const u8 *wbuf, int wlen, u8 *rbuf, int rlen);
+
+static inline int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
+{
+	return -EINVAL;
+}
+
+static inline int cxusb_medion_register_analog(struct dvb_usb_device *dvbdev)
+{
+	return 0;
+}
+
+static inline void cxusb_medion_unregister_analog(struct dvb_usb_device *dvbdev)
+{
+}
+
+int cxusb_medion_get(struct dvb_usb_device *dvbdev,
+		     enum cxusb_open_type open_type);
+void cxusb_medion_put(struct dvb_usb_device *dvbdev);
+
 #endif
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 8056053c9ab0..0a7f8ba90992 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -56,9 +56,6 @@ static int dvb_usb_ctrl_feed(struct dvb_demux_feed *dvbdmxfeed, int onoff)
 	 * for reception.
 	 */
 	if (adap->feedcount == onoff && adap->feedcount > 0) {
-		deb_ts("submitting all URBs\n");
-		usb_urb_submit(&adap->fe_adap[adap->active_fe].stream);
-
 		deb_ts("controlling pid parser\n");
 		if (adap->props.fe[adap->active_fe].caps & DVB_USB_ADAP_HAS_PID_FILTER &&
 			adap->props.fe[adap->active_fe].caps &
@@ -80,6 +77,8 @@ static int dvb_usb_ctrl_feed(struct dvb_demux_feed *dvbdmxfeed, int onoff)
 			}
 		}
 
+		deb_ts("submitting all URBs\n");
+		usb_urb_submit(&adap->fe_adap[adap->active_fe].stream);
 	}
 	return 0;
 }
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 99951e02a880..7241ec3663db 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -133,6 +133,10 @@ static int dvb_usb_exit(struct dvb_usb_device *d)
 	dvb_usb_i2c_exit(d);
 	deb_info("state should be zero now: %x\n", d->state);
 	d->state = DVB_USB_STATE_INIT;
+
+	if (d->priv != NULL && d->props.priv_destroy != NULL)
+		d->props.priv_destroy(d);
+
 	kfree(d->priv);
 	kfree(d);
 	return 0;
@@ -154,6 +158,15 @@ static int dvb_usb_init(struct dvb_usb_device *d, short *adapter_nums)
 			err("no memory for priv in 'struct dvb_usb_device'");
 			return -ENOMEM;
 		}
+
+		if (d->props.priv_init != NULL) {
+			ret = d->props.priv_init(d);
+			if (ret != 0) {
+				kfree(d->priv);
+				d->priv = NULL;
+				return ret;
+			}
+		}
 	}
 
 	/* check the capabilities and set appropriate variables */
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 32829bdd5f22..2eb0e24e8943 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -129,6 +129,9 @@ struct usb_data_stream_properties {
  * @frontend_ctrl: called to power on/off active frontend.
  * @streaming_ctrl: called to start and stop the MPEG2-TS streaming of the
  *  device (not URB submitting/killing).
+ *  This callback will be called without data URBs being active - data URBs
+ *  will be submitted only after streaming_ctrl(1) returns successfully and
+ *  they will be killed before streaming_ctrl(0) gets called.
  * @pid_filter_ctrl: called to en/disable the PID filter, if any.
  * @pid_filter: called to set/unset a PID for filtering.
  * @frontend_attach: called to attach the possible frontends (fill fe-field
@@ -234,6 +237,11 @@ enum dvb_usb_mode {
  *
  * @size_of_priv: how many bytes shall be allocated for the private field
  *  of struct dvb_usb_device.
+ * @priv_init: optional callback to initialize the variable that private field
+ * of struct dvb_usb_device has pointer to just after it had been allocated and
+ * zeroed.
+ * @priv_destroy: just like priv_init, only called before deallocating
+ * the memory pointed by private field of struct dvb_usb_device.
  *
  * @power_ctrl: called to enable/disable power of the device.
  * @read_mac_address: called to read the MAC address of the device.
@@ -275,6 +283,8 @@ struct dvb_usb_device_properties {
 	int        no_reconnect;
 
 	int size_of_priv;
+	int (*priv_init)(struct dvb_usb_device *);
+	void (*priv_destroy)(struct dvb_usb_device *);
 
 	int num_adapters;
 	struct dvb_usb_adapter_properties adapter[MAX_NO_OF_ADAPTER_PER_DEVICE];
