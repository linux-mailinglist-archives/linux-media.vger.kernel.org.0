Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A8A6EAB9
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 20:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbfGSSft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 14:35:49 -0400
Received: from jpvw.nl ([80.127.100.2]:37726 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728670AbfGSSft (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 14:35:49 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hoXjK-0006hw-Eh; Fri, 19 Jul 2019 20:35:42 +0200
Date:   Fri, 19 Jul 2019 20:35:42 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     James Hutchinson <jahutchinson99@googlemail.com>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Thomas Hollstegge <thomas.hollstegge@gmail.com>
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
Message-ID: <20190719183542.GA25609@jpvw.nl>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dvbsky: add MyGica T230.
Moved from cxusb driver as that driver can't handle FX2 FIFO issue.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
---
diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-08 00:41:56.000000000 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-19 17:50:54.671341146 +0200
@@ -561,11 +561,18 @@
 
 	/* attach tuner */
 	si2157_config.fe = adap->fe[0];
-	si2157_config.if_port = 0;
-
-	state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230) {
+		si2157_config.if_port = 1;
+		state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
+						   i2c_adapter,
+						   0x60, &si2157_config);
+	}
+	else {
+		si2157_config.if_port = 0;
+		state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
 						   i2c_adapter,
 						   0x60, &si2157_config);
+	}
 	if (!state->i2c_client_tuner) {
 		dvb_module_release(state->i2c_client_demod);
 		return -ENODEV;
@@ -787,6 +794,9 @@
 	{ DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R4,
 		&dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
 		RC_MAP_DVBSKY) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
+		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230",
+		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
