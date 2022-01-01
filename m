Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560CE482833
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbiAAS2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbiAAS2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:21 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 733671C05;
        Sat,  1 Jan 2022 19:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061700;
        bh=IjEZByg+EYOjp53P6k2Hf4M2XaAnkA1LCq9LArT6bac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dINaZ6xqNw9FJZ2LW9C3wBM9BZOLkcVygwCK09qm2+Mzz79RtcSmg6bH3VtM99D7I
         I9ZCDo+VQQyvCUWal4+BLLxgdcR0Lz0MAgc16gfqEw1zeki4PSSvQ4jVMHDANxpzks
         UGavg515ASneek2d/j7vMcbeUN0KKyNHd95ExdJE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 09/11] media: i2c: max9286: Configure remote I2C speed from device tree
Date:   Sat,  1 Jan 2022 20:28:04 +0200
Message-Id: <20220101182806.19311-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read the maxim,i2c-clock-frequency DT property that specifies the speed
of the remote I2C bus, and configure the MAX9286 accordingly. The remote
serializers must all have a matching configuration.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 56 +++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 4b69bd036ca6..d88a4d8e63ab 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -143,6 +143,11 @@ struct max9286_format_info {
 	u8 datatype;
 };
 
+struct max9286_i2c_speed {
+	u32 rate;
+	u8 mstbt;
+};
+
 struct max9286_source {
 	struct v4l2_subdev *sd;
 	struct fwnode_handle *fwnode;
@@ -176,6 +181,7 @@ struct max9286_priv {
 	/* The initial reverse control channel amplitude. */
 	u32 init_rev_chan_mv;
 	u32 rev_chan_mv;
+	u8 i2c_mstbt;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate_ctrl;
@@ -250,6 +256,17 @@ static const struct max9286_format_info max9286_formats[] = {
 	},
 };
 
+static const struct max9286_i2c_speed max9286_i2c_speeds[] = {
+	{ .rate =   8470, .mstbt = MAX9286_I2CMSTBT_8KBPS },
+	{ .rate =  28300, .mstbt = MAX9286_I2CMSTBT_28KBPS },
+	{ .rate =  84700, .mstbt = MAX9286_I2CMSTBT_84KBPS },
+	{ .rate = 105000, .mstbt = MAX9286_I2CMSTBT_105KBPS },
+	{ .rate = 173000, .mstbt = MAX9286_I2CMSTBT_173KBPS },
+	{ .rate = 339000, .mstbt = MAX9286_I2CMSTBT_339KBPS },
+	{ .rate = 533000, .mstbt = MAX9286_I2CMSTBT_533KBPS },
+	{ .rate = 837000, .mstbt = MAX9286_I2CMSTBT_837KBPS },
+};
+
 /* -----------------------------------------------------------------------------
  * I2C IO
  */
@@ -370,7 +387,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
 static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
 {
 	u8 config = MAX9286_I2CSLVSH_469NS_234NS | MAX9286_I2CSLVTO_1024US |
-		    MAX9286_I2CMSTBT_105KBPS;
+		    priv->i2c_mstbt;
 
 	if (localack)
 		config |= MAX9286_I2CLOCACK;
@@ -1320,6 +1337,8 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	struct device_node *node = NULL;
 	unsigned int i2c_mux_mask = 0;
 	u32 reverse_channel_microvolt;
+	u32 i2c_clk_freq = 105000;
+	unsigned int i;
 
 	/* Balance the of_node_put() performed by of_find_node_by_name(). */
 	of_node_get(dev->of_node);
@@ -1410,6 +1429,23 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	of_property_read_u32(dev->of_node, "maxim,i2c-clock-frequency",
+			     &i2c_clk_freq);
+	for (i = 0; i < ARRAY_SIZE(max9286_i2c_speeds); ++i) {
+		const struct max9286_i2c_speed *speed = &max9286_i2c_speeds[i];
+
+		if (speed->rate == i2c_clk_freq) {
+			priv->i2c_mstbt = speed->mstbt;
+			break;
+		}
+	}
+
+	if (i == ARRAY_SIZE(max9286_i2c_speeds)) {
+		dev_err(dev, "Invalid %s value %u\n",
+			"maxim,i2c-clock-frequency", i2c_clk_freq);
+		return -EINVAL;
+	}
+
 	/*
 	 * Parse the initial value of the reverse channel amplitude from
 	 * the firmware interface and convert it to millivolts.
@@ -1484,10 +1520,16 @@ static int max9286_probe(struct i2c_client *client)
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
+	ret = max9286_parse_dt(priv);
+	if (ret)
+		goto err_cleanup_dt;
+
 	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
 						   GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_pwdn))
-		return PTR_ERR(priv->gpiod_pwdn);
+	if (IS_ERR(priv->gpiod_pwdn)) {
+		ret = PTR_ERR(priv->gpiod_pwdn);
+		goto err_cleanup_dt;
+	}
 
 	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
@@ -1514,10 +1556,6 @@ static int max9286_probe(struct i2c_client *client)
 	if (ret)
 		goto err_powerdown;
 
-	ret = max9286_parse_dt(priv);
-	if (ret)
-		goto err_cleanup_dt;
-
 	ret = max9286_get_poc_supplies(priv);
 	if (ret)
 		goto err_cleanup_dt;
@@ -1528,10 +1566,10 @@ static int max9286_probe(struct i2c_client *client)
 
 	return 0;
 
-err_cleanup_dt:
-	max9286_cleanup_dt(priv);
 err_powerdown:
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
+err_cleanup_dt:
+	max9286_cleanup_dt(priv);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

