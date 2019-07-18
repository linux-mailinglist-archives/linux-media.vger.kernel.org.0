Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7BD6C3D0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 02:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbfGRAg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 20:36:56 -0400
Received: from jpvw.nl ([80.127.100.2]:34508 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727792AbfGRAg4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 20:36:56 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hnuPm-0002ri-J0; Thu, 18 Jul 2019 02:36:54 +0200
Date:   Thu, 18 Jul 2019 02:36:54 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>
Subject: Re: [PATCH V3.6.1 2/2] linux-media: dvbsky: add support for Mygica
 T230C v2
Message-ID: <20190718003654.GA10710@jpvw.nl>
References: <20190717180544.GA5356@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717180544.GA5356@jpvw.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The T230C v2 hardware needs a mode of the si2168 chip to be
set for which the si2168 driver previously had no support.
This patch uses a specific measure to configure this on the
T230C v2 hardware only - see the flag passed via the ts_mode
attribute and its dependency on USB_PID_MYGICA_T230C2.

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
---
diff -ru a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
--- a/drivers/media/dvb-frontends/si2168.c	2019-07-08 00:41:56.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.c	2019-07-18 01:57:35.036592424 +0200
@@ -82,8 +82,19 @@
 
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
 	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+	if (dev->ts_mode & SI2168_TS_CLK_MANUAL)
+		cmd.args[4] = SI2168_TS_CLK_MANUAL;
 	if (acquire)
 		cmd.args[4] |= dev->ts_mode;
 	else
diff -ru a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
--- a/drivers/media/dvb-frontends/si2168.h	2019-07-08 00:41:56.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.h	2019-07-16 06:29:53.913009262 +0200
@@ -30,6 +30,7 @@
 #define SI2168_TS_PARALLEL	0x06
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
+#define SI2168_TS_CLK_MANUAL	0x20
 	u8 ts_mode;
 
 	/* TS clock inverted */
