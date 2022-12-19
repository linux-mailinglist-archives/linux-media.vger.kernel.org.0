Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA365063B
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 03:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiLSCS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Dec 2022 21:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLSCS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Dec 2022 21:18:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD51636B;
        Sun, 18 Dec 2022 18:18:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B63C825;
        Mon, 19 Dec 2022 03:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671416304;
        bh=H6yrZhYu8f7yDckTkv9HZg/BSu0BBpkshhmHadC10Zo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GWzPgDoBGQaoUTBp9BTntTATahYRST4NDHqzV+nCZfoSE5CvZb+YrUtbrIarfob2N
         1ojsOVULj56eVcVIn2pBXTzhGzqqRZ8tSd0kj1ogOVR4t3zjOZ7Jql7nJrQRSyoW7Q
         jgfEYg2hHRfIT3Z3ShB6VLWi9N9r/15pJCQKRAxw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v3.1 04/12] media: i2c: max9286: Add support for port regulators
Date:   Mon, 19 Dec 2022 04:18:20 +0200
Message-Id: <20221219021820.24596-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221214233825.13050-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thomas Nizan <tnizan@witekio.com>

Allow users to use one PoC regulator per port, instead of a global
regulator.

The properties '^port[0-3]-poc-supply$' in the DT node are used to
indicate the regulators for individual ports.

Signed-off-by: Thomas Nizan <tnizan@witekio.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:

- Use dev_err_probe() everywhere

Changes since v2:

- Adapt to the poc-gpio support

Changes since v1:

- Use to_index()
- Use dev_err_probe()
- Fix error path in probe()
- Use devm_regulator_get_optional() instead of
  devm_regulator_get_exclusive()
---
 drivers/media/i2c/max9286.c | 135 ++++++++++++++++++++++++++++++------
 1 file changed, 112 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9c083cf14231..a65457b1e7e0 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -139,6 +139,7 @@
 struct max9286_source {
 	struct v4l2_subdev *sd;
 	struct fwnode_handle *fwnode;
+	struct regulator *regulator;
 };
 
 struct max9286_asd {
@@ -169,6 +170,7 @@ struct max9286_priv {
 	u32 init_rev_chan_mv;
 	u32 rev_chan_mv;
 
+	bool use_gpio_poc;
 	u32 gpio_poc[2];
 
 	struct v4l2_ctrl_handler ctrls;
@@ -1088,9 +1090,6 @@ static int max9286_parse_gpios(struct max9286_priv *priv)
 	struct device *dev = &priv->client->dev;
 	int ret;
 
-	/* GPIO values default to high */
-	priv->gpio_state = BIT(0) | BIT(1);
-
 	/*
 	 * Parse the "gpio-poc" vendor property. If the property is not
 	 * specified the camera power is controlled by a regulator.
@@ -1102,18 +1101,7 @@ static int max9286_parse_gpios(struct max9286_priv *priv)
 		 * If gpio lines are not used for the camera power, register
 		 * a gpio controller for consumers.
 		 */
-		ret = max9286_register_gpio(priv);
-		if (ret)
-			return ret;
-
-		priv->regulator = devm_regulator_get(dev, "poc");
-		if (IS_ERR(priv->regulator)) {
-			return dev_err_probe(dev, PTR_ERR(priv->regulator),
-					     "Unable to get PoC regulator (%ld)\n",
-					     PTR_ERR(priv->regulator));
-		}
-
-		return 0;
+		return max9286_register_gpio(priv);
 	}
 
 	/* If the property is specified make sure it is well formed. */
@@ -1124,21 +1112,75 @@ static int max9286_parse_gpios(struct max9286_priv *priv)
 		return -EINVAL;
 	}
 
+	priv->use_gpio_poc = true;
 	return 0;
 }
 
+static int max9286_poc_power_on(struct max9286_priv *priv)
+{
+	struct max9286_source *source;
+	unsigned int enabled = 0;
+	int ret;
+
+	/* Enable the global regulator if available. */
+	if (priv->regulator)
+		return regulator_enable(priv->regulator);
+
+	if (priv->use_gpio_poc)
+		return max9286_gpio_set(priv, priv->gpio_poc[0],
+					!priv->gpio_poc[1]);
+
+	/* Otherwise use the per-port regulators. */
+	for_each_source(priv, source) {
+		ret = regulator_enable(source->regulator);
+		if (ret < 0)
+			goto error;
+
+		enabled |= BIT(to_index(priv, source));
+	}
+
+	return 0;
+
+error:
+	for_each_source(priv, source) {
+		if (enabled & BIT(to_index(priv, source)))
+			regulator_disable(source->regulator);
+	}
+
+	return ret;
+}
+
+static int max9286_poc_power_off(struct max9286_priv *priv)
+{
+	struct max9286_source *source;
+	int ret = 0;
+
+	if (priv->regulator)
+		return regulator_disable(priv->regulator);
+
+	if (priv->use_gpio_poc)
+		return max9286_gpio_set(priv, priv->gpio_poc[0],
+					priv->gpio_poc[1]);
+
+	for_each_source(priv, source) {
+		int err;
+
+		err = regulator_disable(source->regulator);
+		if (!ret)
+			ret = err;
+	}
+
+	return ret;
+}
+
 static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
 {
 	int ret;
 
-	/* If the regulator is not available, use gpio to control power. */
-	if (!priv->regulator)
-		ret = max9286_gpio_set(priv, priv->gpio_poc[0],
-				       enable ^ priv->gpio_poc[1]);
-	else if (enable)
-		ret = regulator_enable(priv->regulator);
+	if (enable)
+		ret = max9286_poc_power_on(priv);
 	else
-		ret = regulator_disable(priv->regulator);
+		ret = max9286_poc_power_off(priv);
 
 	if (ret < 0)
 		dev_err(&priv->client->dev, "Unable to turn power %s\n",
@@ -1317,6 +1359,44 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	return 0;
 }
 
+static int max9286_get_poc_supplies(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct max9286_source *source;
+	int ret;
+
+	/* Start by getting the global regulator. */
+	priv->regulator = devm_regulator_get_optional(dev, "poc");
+	if (!IS_ERR(priv->regulator))
+		return 0;
+
+	if (PTR_ERR(priv->regulator) != -ENODEV)
+		return dev_err_probe(dev, PTR_ERR(priv->regulator),
+				     "Unable to get PoC regulator\n");
+
+	/* If there's no global regulator, get per-port regulators. */
+	dev_dbg(dev,
+		"No global PoC regulator, looking for per-port regulators\n");
+	priv->regulator = NULL;
+
+	for_each_source(priv, source) {
+		unsigned int index = to_index(priv, source);
+		char name[10];
+
+		snprintf(name, sizeof(name), "port%u-poc", index);
+		source->regulator = devm_regulator_get(dev, name);
+		if (IS_ERR(source->regulator)) {
+			ret = PTR_ERR(source->regulator);
+			dev_err_probe(dev, ret,
+				      "Unable to get port %u PoC regulator\n",
+				      index);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int max9286_probe(struct i2c_client *client)
 {
 	struct max9286_priv *priv;
@@ -1330,6 +1410,9 @@ static int max9286_probe(struct i2c_client *client)
 
 	priv->client = client;
 
+	/* GPIO values default to high */
+	priv->gpio_state = BIT(0) | BIT(1);
+
 	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpiod_pwdn))
@@ -1362,7 +1445,13 @@ static int max9286_probe(struct i2c_client *client)
 
 	ret = max9286_parse_dt(priv);
 	if (ret)
-		goto err_powerdown;
+		goto err_cleanup_dt;
+
+	if (!priv->use_gpio_poc) {
+		ret = max9286_get_poc_supplies(priv);
+		if (ret)
+			goto err_cleanup_dt;
+	}
 
 	ret = max9286_init(priv);
 	if (ret < 0)
-- 
Regards,

Laurent Pinchart

