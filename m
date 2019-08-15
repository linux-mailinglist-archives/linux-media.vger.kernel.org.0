Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4B18F112
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbfHOQmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:42:00 -0400
Received: from jp.dhs.org ([62.251.46.73]:35044 "EHLO jpvw.nl"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729627AbfHOQmA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:42:00 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hyIp4-00076q-6T; Thu, 15 Aug 2019 18:41:58 +0200
Date:   Thu, 15 Aug 2019 18:41:58 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     Sean Young <sean@mess.org>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, thomas.hollstegge@gmail.com
Subject: Re: [PATCH 2b/2] media: dvb-usb: move T230 to dvbsky
Message-ID: <20190815164158.GD26765@jpvw.nl>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl>
 <CAD+OKUoCXV1LLM40Frm8VGoFDzhKmO__ALdsnttmfr=nueBFAg@mail.gmail.com>
 <2dcec967-35b0-315c-4cdf-0bcfe8e71cbc@jpvw.nl>
 <20190815101436.m73vlybkei7ij4oz@gofer.mess.org>
 <20190815163447.GA26765@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815163447.GA26765@jpvw.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove t230 from cxusb (for linux >= 5.3)

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
---
diff -ru a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
--- a/drivers/media/usb/dvb-usb/cxusb.c	2019-08-11 22:26:41.000000000 +0200
+++ b/drivers/media/usb/dvb-usb/cxusb.c	2019-08-13 03:13:48.496221952 +0200
@@ -78,7 +78,6 @@
 	DVICO_BLUEBIRD_DUAL_4_REV_2,
 	CONEXANT_D680_DMB,
 	MYGICA_D689,
-	MYGICA_T230,
 	NR__cxusb_table_index
 };
 
@@ -456,26 +455,6 @@
 	return 0;
 }
 
-static int cxusb_read_status(struct dvb_frontend *fe,
-			     enum fe_status *status)
-{
-	struct dvb_usb_adapter *adap = (struct dvb_usb_adapter *)fe->dvb->priv;
-	struct cxusb_state *state = (struct cxusb_state *)adap->dev->priv;
-	int ret;
-
-	ret = state->fe_read_status(fe, status);
-
-	/* it need resync slave fifo when signal change from unlock to lock.*/
-	if ((*status & FE_HAS_LOCK) && (!state->last_lock)) {
-		mutex_lock(&state->stream_mutex);
-		cxusb_streaming_ctrl(adap, 1);
-		mutex_unlock(&state->stream_mutex);
-	}
-
-	state->last_lock = (*status & FE_HAS_LOCK) ? 1 : 0;
-	return ret;
-}
-
 static void cxusb_d680_dmb_drain_message(struct dvb_usb_device *d)
 {
 	int       ep = d->props.generic_bulk_ctrl_endpoint;
@@ -1374,86 +1353,6 @@
 	return 0;
 }
 
-static int cxusb_mygica_t230_frontend_attach(struct dvb_usb_adapter *adap)
-{
-	struct dvb_usb_device *d = adap->dev;
-	struct cxusb_state *st = d->priv;
-	struct i2c_adapter *adapter;
-	struct i2c_client *client_demod;
-	struct i2c_client *client_tuner;
-	struct i2c_board_info info;
-	struct si2168_config si2168_config;
-	struct si2157_config si2157_config;
-
-	/* Select required USB configuration */
-	if (usb_set_interface(d->udev, 0, 0) < 0)
-		err("set interface failed");
-
-	/* Unblock all USB pipes */
-	usb_clear_halt(d->udev,
-		       usb_sndbulkpipe(d->udev,
-				       d->props.generic_bulk_ctrl_endpoint));
-	usb_clear_halt(d->udev,
-		       usb_rcvbulkpipe(d->udev,
-				       d->props.generic_bulk_ctrl_endpoint));
-	usb_clear_halt(d->udev,
-		       usb_rcvbulkpipe(d->udev,
-				       d->props.adapter[0].fe[0].stream.endpoint));
-
-	/* attach frontend */
-	si2168_config.i2c_adapter = &adapter;
-	si2168_config.fe = &adap->fe_adap[0].fe;
-	si2168_config.ts_mode = SI2168_TS_PARALLEL;
-	si2168_config.ts_clock_inv = 1;
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	strscpy(info.type, "si2168", I2C_NAME_SIZE);
-	info.addr = 0x64;
-	info.platform_data = &si2168_config;
-	request_module(info.type);
-	client_demod = i2c_new_device(&d->i2c_adap, &info);
-	if (!client_demod || !client_demod->dev.driver)
-		return -ENODEV;
-
-	if (!try_module_get(client_demod->dev.driver->owner)) {
-		i2c_unregister_device(client_demod);
-		return -ENODEV;
-	}
-
-	st->i2c_client_demod = client_demod;
-
-	/* attach tuner */
-	memset(&si2157_config, 0, sizeof(si2157_config));
-	si2157_config.fe = adap->fe_adap[0].fe;
-	si2157_config.if_port = 1;
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	strscpy(info.type, "si2157", I2C_NAME_SIZE);
-	info.addr = 0x60;
-	info.platform_data = &si2157_config;
-	request_module(info.type);
-	client_tuner = i2c_new_device(adapter, &info);
-	if (!client_tuner || !client_tuner->dev.driver) {
-		module_put(client_demod->dev.driver->owner);
-		i2c_unregister_device(client_demod);
-		return -ENODEV;
-	}
-	if (!try_module_get(client_tuner->dev.driver->owner)) {
-		i2c_unregister_device(client_tuner);
-		module_put(client_demod->dev.driver->owner);
-		i2c_unregister_device(client_demod);
-		return -ENODEV;
-	}
-
-	st->i2c_client_tuner = client_tuner;
-
-	/* hook fe: need to resync the slave fifo when signal locks. */
-	mutex_init(&st->stream_mutex);
-	st->last_lock = 0;
-	st->fe_read_status = adap->fe_adap[0].fe->ops.read_status;
-	adap->fe_adap[0].fe->ops.read_status = cxusb_read_status;
-
-	return 0;
-}
-
 /*
  * DViCO has shipped two devices with the same USB ID, but only one of them
  * needs a firmware download.  Check the device class details to see if they
@@ -1633,7 +1532,6 @@
 static struct dvb_usb_device_properties cxusb_aver_a868r_properties;
 static struct dvb_usb_device_properties cxusb_d680_dmb_properties;
 static struct dvb_usb_device_properties cxusb_mygica_d689_properties;
-static struct dvb_usb_device_properties cxusb_mygica_t230_properties;
 
 static int cxusb_medion_priv_init(struct dvb_usb_device *dvbdev)
 {
@@ -1759,8 +1657,6 @@
 					THIS_MODULE, NULL, adapter_nr) ||
 		   !dvb_usb_device_init(intf, &cxusb_mygica_d689_properties,
 					THIS_MODULE, NULL, adapter_nr) ||
-		   !dvb_usb_device_init(intf, &cxusb_mygica_t230_properties,
-					THIS_MODULE, NULL, adapter_nr) ||
 		   0)
 		return 0;
 
@@ -1862,9 +1758,6 @@
 	[MYGICA_D689] = {
 		USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_D689)
 	},
-	[MYGICA_T230] = {
-		USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230)
-	},
 	{}		/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, cxusb_table);
@@ -2534,60 +2427,6 @@
 		},
 	}
 };
-
-static struct dvb_usb_device_properties cxusb_mygica_t230_properties = {
-	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
-
-	.usb_ctrl         = CYPRESS_FX2,
-
-	.size_of_priv     = sizeof(struct cxusb_state),
-
-	.num_adapters = 1,
-	.adapter = {
-		{
-		.num_frontends = 1,
-		.fe = {{
-			.streaming_ctrl   = cxusb_streaming_ctrl,
-			.frontend_attach  = cxusb_mygica_t230_frontend_attach,
-
-			/* parameter for the MPEG2-data transfer */
-			.stream = {
-				.type = USB_BULK,
-				.count = 5,
-				.endpoint = 0x02,
-				.u = {
-					.bulk = {
-						.buffersize = 8192,
-					}
-				}
-			},
-		} },
-		},
-	},
-
-	.power_ctrl       = cxusb_d680_dmb_power_ctrl,
-
-	.i2c_algo         = &cxusb_i2c_algo,
-
-	.generic_bulk_ctrl_endpoint = 0x01,
-
-	.rc.core = {
-		.rc_interval	= 100,
-		.rc_codes	= RC_MAP_D680_DMB,
-		.module_name	= KBUILD_MODNAME,
-		.rc_query       = cxusb_d680_dmb_rc_query,
-		.allowed_protos = RC_PROTO_BIT_UNKNOWN,
-	},
-
-	.num_device_descs = 1,
-	.devices = {
-		{
-			"Mygica T230 DVB-T/T2/C",
-			{ NULL },
-			{ &cxusb_table[MYGICA_T230], NULL },
-		},
-	}
-};
 
 static struct usb_driver cxusb_driver = {
 	.name		= "dvb_usb_cxusb",
