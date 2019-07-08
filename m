Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB4862C0F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 00:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfGHWqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 18:46:23 -0400
Received: from jpvw.nl ([80.127.100.2]:37932 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfGHWqW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 18:46:22 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hkcOr-0001SH-Ie; Tue, 09 Jul 2019 00:46:21 +0200
Date:   Tue, 9 Jul 2019 00:46:21 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        Jan Pieter van Woerkom <jp@jpvw.nl>
Subject: [PATCH v4 2/2] dvbsky: add support for "Mygica T230C v2"
Message-ID: <20190708224621.GA5550@jpvw.nl>
References: <20190708224120.GC5377@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708224120.GC5377@jpvw.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jan Pieter van Woerkom <jp@jpvw.nl>

Adds support for the "Mygica T230C v2" into the "dvbsky" driver.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
---
diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-03 13:13:45.000000000 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-07 23:40:06.450035907 +0200
@@ -560,6 +560,8 @@
 	si2168_config.i2c_adapter = &i2c_adapter;
 	si2168_config.fe = &adap->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2)
+		si2168_config.ts_clk_special = 1;
 	si2168_config.ts_clock_inv = 1;
 
 	state->i2c_client_demod = dvb_module_probe("si2168", NULL,
@@ -799,6 +801,9 @@
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
+		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C v2",
+		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
diff -ru a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
--- a/include/media/dvb-usb-ids.h	2019-07-03 13:13:45.000000000 +0200
+++ b/include/media/dvb-usb-ids.h	2019-07-07 20:34:57.491309334 +0200
@@ -387,6 +387,7 @@
 #define USB_PID_MYGICA_D689				0xd811
 #define USB_PID_MYGICA_T230				0xc688
 #define USB_PID_MYGICA_T230C				0xc689
+#define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f
