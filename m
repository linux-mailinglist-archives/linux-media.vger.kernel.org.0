Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7729063B33
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 20:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfGISje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 14:39:34 -0400
Received: from jpvw.nl ([80.127.100.2]:39694 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726133AbfGISje (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jul 2019 14:39:34 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hkv1Y-0000cF-VX; Tue, 09 Jul 2019 20:39:32 +0200
Date:   Tue, 9 Jul 2019 20:39:32 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>
Subject: PATCH V3.5 1/2] dvbsky: add support for "Mygica T230C v2"
Message-ID: <20190709183932.GA2311@jpvw.nl>
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

This is v3.5 of the proposed patch, based on feedback from Sean
Young and Antti Palosaari.
Tested by patch author on DVB(T/T2/C).
Tested by Frank Rysanek on a T230C v2: can tune into locally
available DVB-T and DVB-T2 muxes, video and audio playback works.
Applies cleanly against Linux 5.2 .

The T230C v2 hardware needs a mode of the si2168 chip to be
set for which the si2168 driver previously had no support.
This patch uses a specific measure to configure this on the
T230C v2 hardware only - see the flag passed via the ts_mode
attribute and its dependency on USB_PID_MYGICA_T230C2. Other
devices using the si2168 demodulator driver are not affected.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
---
diff -ru a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
--- a/drivers/media/dvb-frontends/si2168.c	2019-07-08 00:41:56.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.c	2019-07-09 18:47:59.514873658 +0200
@@ -82,8 +82,18 @@
 
 	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
 
+	/* set manual value */
+	if (dev->ts_mode & SI2168_TS_CLK_MANUAL) {
+		memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2168_cmd_execute(client, &cmd);
+		if (ret)
+			return ret;
+	}
 	/* set TS_MODE property */
-	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+	memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
+	cmd.args[4] = dev->ts_mode & (SI2168_TS_CLK_AUTO|SI2168_TS_CLK_MANUAL);
 	if (acquire)
 		cmd.args[4] |= dev->ts_mode;
 	else
diff -ru a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
--- a/drivers/media/dvb-frontends/si2168.h	2019-07-08 00:41:56.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.h	2019-07-09 18:47:59.514873658 +0200
@@ -30,6 +30,8 @@
 #define SI2168_TS_PARALLEL	0x06
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
+#define SI2168_TS_CLK_AUTO	0x10
+#define SI2168_TS_CLK_MANUAL	0x20
 	u8 ts_mode;
 
 	/* TS clock inverted */
