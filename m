Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7D762BEC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 00:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbfGHWlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 18:41:22 -0400
Received: from jpvw.nl ([80.127.100.2]:37916 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfGHWlW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 18:41:22 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hkcK0-0001R2-Kg; Tue, 09 Jul 2019 00:41:20 +0200
Date:   Tue, 9 Jul 2019 00:41:20 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        Jan Pieter van Woerkom <jp@jpvw.nl>
Subject: [PATCH v4 2/1] dvbsky: add support for "Mygica T230C v2"
Message-ID: <20190708224120.GC5377@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jan Pieter van Woerkom <jp@jpvw.nl>

Adds support for the "Mygica T230C v2" into the "dvbsky" driver.
A small enhancement is also needed in the si2168 demodulator
driver, and a USB device ID in dvb-usb-ids.h .

This is v4 of the proposed patch, based on feedback from Sean
Young and Antti Palosaari.
Tested by patch author: can tune into DVB-(T/T2/C) muxes, AV
playback & data all work.
Tested by Frank Rysanek: can tune into locally available DVB-T
and DVB-T2 muxes, video and audio playback works.
Applies cleanly against Linux 5.1.* .

The T230C v2 hardware needs a mode of the si2168 chip to be set
for which the si2168 driver previously had no support. This patch
uses a specific measure to configure this on the T230C v2 hardware
only - see the flag passed via the  ts_clk_special attribute and
its dependency on USB_PID_MYGICA_T230C2. Other devices using the
si2168 demodulator driver are not affected in any way.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
---
diff -ru a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
--- a/drivers/media/dvb-frontends/si2168.c	2019-07-03 13:13:45.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.c	2019-07-07 23:33:06.186303149 +0200
@@ -91,8 +91,20 @@
 
 	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
 
+	/* set ts clock freq to 10Mhz */
+	if (dev->ts_clk_special) {
+		memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2168_cmd_execute(client, &cmd);
+		if (ret)
+			return ret;
+	}
+
 	/* set TS_MODE property */
 	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+	if (dev->ts_clk_special)
+		cmd.args[4] = 0x20;
 	if (acquire)
 		cmd.args[4] |= dev->ts_mode;
 	else
@@ -804,6 +816,7 @@
 	*config->i2c_adapter = dev->muxc->adapter[0];
 	*config->fe = &dev->fe;
 	dev->ts_mode = config->ts_mode;
+	dev->ts_clk_special = config->ts_clk_special;
 	dev->ts_clock_inv = config->ts_clock_inv;
 	dev->ts_clock_gapped = config->ts_clock_gapped;
 	dev->spectral_inversion = config->spectral_inversion;
diff -ru a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
--- a/drivers/media/dvb-frontends/si2168.h	2019-07-03 13:13:45.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.h	2019-07-07 23:35:27.111462066 +0200
@@ -40,6 +40,7 @@
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
 	u8 ts_mode;
+	bool ts_clk_special;
 
 	/* TS clock inverted */
 	bool ts_clock_inv;
diff -ru a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
--- a/drivers/media/dvb-frontends/si2168_priv.h	2019-07-03 13:13:45.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168_priv.h	2019-07-07 23:36:34.726130136 +0200
@@ -46,6 +46,7 @@
 	bool active;
 	bool warm;
 	u8 ts_mode;
+	bool ts_clk_special;
 	bool ts_clock_inv;
 	bool ts_clock_gapped;
 	bool spectral_inversion;
