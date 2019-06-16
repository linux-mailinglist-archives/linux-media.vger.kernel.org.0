Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E277472A4
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 02:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfFPAoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 20:44:14 -0400
Received: from jpvw.nl ([80.127.100.2]:50910 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbfFPAoO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 20:44:14 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hcJHH-0001RN-QZ; Sun, 16 Jun 2019 02:44:11 +0200
Date:   Sun, 16 Jun 2019 02:44:11 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        Jan Pieter van <jp@jpvw.nl>
Subject: Re: [PATCH 2/2] dvbsky: add support for "Mygica T230C v2"
Message-ID: <20190616004411.GF4518@jpvw.nl>
References: <20190616003929.GE4518@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616003929.GE4518@jpvw.nl>
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
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-06-04 07:59:45.000000000 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-06-08 19:49:01.688181437 +0200
@@ -560,6 +560,8 @@
 	si2168_config.i2c_adapter = &i2c_adapter;
 	si2168_config.fe = &adap->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2)
+		si2168_config.ts_mode |= SI2168_TS_CLK_MANUAL;
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
--- a/include/media/dvb-usb-ids.h	2019-06-04 07:59:45.000000000 +0200
+++ b/include/media/dvb-usb-ids.h	2019-06-07 23:38:06.679688490 +0200
@@ -387,6 +387,7 @@
 #define USB_PID_MYGICA_D689				0xd811
 #define USB_PID_MYGICA_T230				0xc688
 #define USB_PID_MYGICA_T230C				0xc689
+#define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f
