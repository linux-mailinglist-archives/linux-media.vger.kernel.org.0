Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4662817DD15
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgCIKOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:48 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44381 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgCIKOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:48 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003ml-6N; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001mE-Ts; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 13/19] media: tvp5150: move irq en-/disable into runtime-pm ops
Date:   Mon,  9 Mar 2020 11:14:22 +0100
Message-Id: <20200309101428.15267-14-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
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

As documented in [1] the runtime-pm ops are used to set the device into
a fully 'workable' state. Therefore it can be used to enable or disable
the irqs.

[1] https://www.kernel.org/doc/html/latest/power/runtime_pm.html

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v12:
- change commit header and message -> former "media: tvp5150: add s_power callback"
- drop s_power() callback and use pm_runtime callbacks instead

 drivers/media/i2c/tvp5150.c | 61 +++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 1da0ff1ffc55..313d2a43d79e 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -1356,16 +1357,51 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
 /****************************************************************************
 			I2C Command
  ****************************************************************************/
+static int __maybe_unused tvp5150_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tvp5150 *decoder = to_tvp5150(sd);
+
+	if (decoder->irq)
+		/* Disable lock interrupt */
+		return regmap_update_bits(decoder->regmap,
+					  TVP5150_INT_ENABLE_REG_A,
+					  TVP5150_INT_A_LOCK, 0);
+	return 0;
+}
+
+static int __maybe_unused tvp5150_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tvp5150 *decoder = to_tvp5150(sd);
+
+	if (decoder->irq)
+		/* Enable lock interrupt */
+		return regmap_update_bits(decoder->regmap,
+					  TVP5150_INT_ENABLE_REG_A,
+					  TVP5150_INT_A_LOCK,
+					  TVP5150_INT_A_LOCK);
+	return 0;
+}
 
 static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
-	unsigned int mask, val = 0, int_val = 0;
+	unsigned int mask, val = 0;
+	int ret;
 
 	mask = TVP5150_MISC_CTL_YCBCR_OE | TVP5150_MISC_CTL_SYNC_OE |
 	       TVP5150_MISC_CTL_CLOCK_OE;
 
 	if (enable) {
+		ret = pm_runtime_get_sync(sd->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(sd->dev);
+			return ret;
+		}
+
 		tvp5150_enable(sd);
 
 		/* Enable outputs if decoder is locked */
@@ -1373,15 +1409,13 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 			val = decoder->lock ? decoder->oe : 0;
 		else
 			val = decoder->oe;
-		int_val = TVP5150_INT_A_LOCK;
+
 		v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
+	} else {
+		pm_runtime_put(sd->dev);
 	}
 
 	regmap_update_bits(decoder->regmap, TVP5150_MISC_CTL, mask, val);
-	if (decoder->irq)
-		/* Enable / Disable lock interrupt */
-		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
-				   TVP5150_INT_A_LOCK, int_val);
 
 	return 0;
 }
@@ -2077,6 +2111,11 @@ static int tvp5150_probe(struct i2c_client *c)
 
 	if (debug > 1)
 		tvp5150_log_status(sd);
+
+	pm_runtime_set_active(&c->dev);
+	pm_runtime_enable(&c->dev);
+	pm_runtime_idle(&c->dev);
+
 	return 0;
 
 err:
@@ -2100,11 +2139,20 @@ static int tvp5150_remove(struct i2c_client *c)
 		media_device_unregister_entity(&decoder->connectors[i].ent);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&decoder->hdl);
+	pm_runtime_disable(&c->dev);
+	pm_runtime_set_suspended(&c->dev);
+
 	return 0;
 }
 
 /* ----------------------------------------------------------------------- */
 
+static const struct dev_pm_ops tvp5150_pm_ops = {
+	SET_RUNTIME_PM_OPS(tvp5150_runtime_suspend,
+			   tvp5150_runtime_resume,
+			   NULL)
+};
+
 static const struct i2c_device_id tvp5150_id[] = {
 	{ "tvp5150", 0 },
 	{ }
@@ -2123,6 +2171,7 @@ static struct i2c_driver tvp5150_driver = {
 	.driver = {
 		.of_match_table = of_match_ptr(tvp5150_of_match),
 		.name	= "tvp5150",
+		.pm	= &tvp5150_pm_ops,
 	},
 	.probe_new	= tvp5150_probe,
 	.remove		= tvp5150_remove,
-- 
2.20.1

