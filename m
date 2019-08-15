Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A83AE8F0B7
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731383AbfHOQhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:37:35 -0400
Received: from jp.dhs.org ([62.251.46.73]:34908 "EHLO jpvw.nl"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728348AbfHOQhf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:37:35 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hyIkn-00075T-Jz; Thu, 15 Aug 2019 18:37:33 +0200
Date:   Thu, 15 Aug 2019 18:37:33 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     Sean Young <sean@mess.org>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, thomas.hollstegge@gmail.com
Subject: Re: [PATCH 1/2] media: dvb-usb: move T230 to dvbsky
Message-ID: <20190815163733.GB26765@jpvw.nl>
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

add t230 to dvbsky

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
Tested-by: James Hutchinson <jahutchinson99@googlemail.com>
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
+	} else {
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
