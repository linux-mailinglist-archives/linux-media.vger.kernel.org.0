Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8848EADC
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 13:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731253AbfHOL6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 07:58:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46097 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730442AbfHOL6B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 07:58:01 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEOA-00042q-KJ; Thu, 15 Aug 2019 13:57:54 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEO5-0006IR-0O; Thu, 15 Aug 2019 13:57:49 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v7 09/13] media: tvp5150: add s_power callback
Date:   Thu, 15 Aug 2019 13:57:43 +0200
Message-Id: <20190815115747.24018-10-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815115747.24018-1-m.felsch@pengutronix.de>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't en-/disable the interrupts during s_stream because someone can
disable the stream but wants to get informed if the stream is locked
again. So keep the interrupts enabled the whole time the pipeline is
opened.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tvp5150.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 26a156da3ab4..9a812d5f45d7 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1354,11 +1354,26 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
 /****************************************************************************
 			I2C Command
  ****************************************************************************/
+static int tvp5150_s_power(struct  v4l2_subdev *sd, int on)
+{
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	unsigned int val = 0;
+
+	if (on)
+		val = TVP5150_INT_A_LOCK;
+
+	if (decoder->irq)
+		/* Enable / Disable lock interrupt */
+		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
+				   TVP5150_INT_A_LOCK, val);
+
+	return 0;
+}
 
 static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
-	unsigned int mask, val = 0, int_val = 0;
+	unsigned int mask, val = 0;
 
 	mask = TVP5150_MISC_CTL_YCBCR_OE | TVP5150_MISC_CTL_SYNC_OE |
 	       TVP5150_MISC_CTL_CLOCK_OE;
@@ -1371,15 +1386,10 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 			val = decoder->lock ? decoder->oe : 0;
 		else
 			val = decoder->oe;
-		int_val = TVP5150_INT_A_LOCK;
 		v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
 	}
 
 	regmap_update_bits(decoder->regmap, TVP5150_MISC_CTL, mask, val);
-	if (decoder->irq)
-		/* Enable / Disable lock interrupt */
-		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
-				   TVP5150_INT_A_LOCK, int_val);
 
 	return 0;
 }
@@ -1575,6 +1585,7 @@ static const struct v4l2_subdev_core_ops tvp5150_core_ops = {
 	.g_register = tvp5150_g_register,
 	.s_register = tvp5150_s_register,
 #endif
+	.s_power = tvp5150_s_power,
 };
 
 static const struct v4l2_subdev_tuner_ops tvp5150_tuner_ops = {
-- 
2.20.1

