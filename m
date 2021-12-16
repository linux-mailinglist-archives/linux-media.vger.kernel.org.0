Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABDB477FE3
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 23:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241453AbhLPWJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 17:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241209AbhLPWJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 17:09:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B54C06173E;
        Thu, 16 Dec 2021 14:09:57 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 101731209;
        Thu, 16 Dec 2021 23:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639692595;
        bh=hLx2ebGM+okJSxhT9tMuHTZ4OjNTfkXx4j7pZttIUKE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Eojp+s6GwxFap4MUY9/OxkeNvEHiR/ayZjI8puA3E1TLCD1zgcjRJ1va2i2gG5S/q
         KEF5YZw68mDOce5QbqKNSWNyNTGW/iGHSj6LZ2TefD7X4Q7R1g2XelZac4sCcqzFnp
         WlgnGeMjKlOGGoyLqN0lBVvez5HTDvairtxv7eXc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH 2/3] media: i2c: max9286: Add support for port regulators
Date:   Fri, 17 Dec 2021 00:09:45 +0200
Message-Id: <20211216220946.20771-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thomas Nizan <tnizan@witekio.com>

Allow users to use one PoC regulator per port, instead of a global
regulator.

The properties '^port[0-3]-poc-supply$' in the DT node are used to
indicate the regulators for individual ports.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 112 +++++++++++++++++++++++++++++++-----
 1 file changed, 98 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c663fd587bb..fa2f6a823fe6 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -136,8 +136,10 @@
 #define MAX9286_SRC_PAD			4
 
 struct max9286_source {
+	unsigned int index;
 	struct v4l2_subdev *sd;
 	struct fwnode_handle *fwnode;
+	struct regulator *regulator;
 };
 
 struct max9286_asd {
@@ -1072,6 +1074,49 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	return ret;
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
+	/* Otherwise use the per-port regulators. */
+	for_each_source(priv, source) {
+		ret = regulator_enable(source->regulator);
+		if (ret < 0)
+			goto error;
+
+		enabled |= BIT(source->index);
+	}
+
+	return 0;
+
+error:
+	for_each_source(priv, source) {
+		if (enabled & BIT(source->index))
+			regulator_disable(source->regulator);
+	}
+
+	return ret;
+}
+
+static void max9286_poc_power_off(struct max9286_priv *priv)
+{
+	struct max9286_source *source;
+
+	if (priv->regulator) {
+		regulator_disable(priv->regulator);
+		return;
+	}
+
+	for_each_source(priv, source)
+		regulator_disable(source->regulator);
+}
+
 static int max9286_init(struct device *dev)
 {
 	struct max9286_priv *priv;
@@ -1082,9 +1127,9 @@ static int max9286_init(struct device *dev)
 	priv = i2c_get_clientdata(client);
 
 	/* Enable the bus power. */
-	ret = regulator_enable(priv->regulator);
+	ret = max9286_poc_power_on(priv);
 	if (ret < 0) {
-		dev_err(&client->dev, "Unable to turn PoC on\n");
+		dev_err(dev, "Unable to turn PoC on\n");
 		return ret;
 	}
 
@@ -1118,7 +1163,7 @@ static int max9286_init(struct device *dev)
 err_v4l2_register:
 	max9286_v4l2_unregister(priv);
 err_regulator:
-	regulator_disable(priv->regulator);
+	max9286_poc_power_off(priv);
 
 	return ret;
 }
@@ -1215,6 +1260,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 		}
 
 		source = &priv->sources[ep.port];
+		source->index = ep.port;
 		source->fwnode = fwnode_graph_get_remote_endpoint(
 						of_fwnode_handle(node));
 		if (!source->fwnode) {
@@ -1249,6 +1295,50 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	return 0;
 }
 
+static int max9286_get_poc_supplies(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct max9286_source *source;
+
+	/*
+	 * Start by getting the global regulator. Usage of the exclusive API is
+	 * required to receive an error in case the supply isn't specified in
+	 * the device tree.
+	 */
+	priv->regulator = devm_regulator_get_exclusive(dev, "poc");
+	if (!IS_ERR(priv->regulator))
+		return 0;
+
+	if (PTR_ERR(priv->regulator) != -ENODEV) {
+		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get PoC regulator: %ld\n",
+				PTR_ERR(priv->regulator));
+		return PTR_ERR(priv->regulator);
+	}
+
+	/* If there's no global regulator, get per-port regulators. */
+	dev_dbg(dev,
+		"No global PoC regulator, looking for per-port regulators\n");
+	priv->regulator = NULL;
+
+	for_each_source(priv, source) {
+		char name[10];
+
+		snprintf(name, sizeof(name), "port%u-poc", source->index);
+		source->regulator = devm_regulator_get_exclusive(dev, name);
+		if (IS_ERR(source->regulator)) {
+			if (PTR_ERR(source->regulator) != -EPROBE_DEFER)
+				dev_err(dev,
+					"Unable to get port %u PoC regulator: %ld\n",
+					source->index,
+					PTR_ERR(source->regulator));
+			return PTR_ERR(source->regulator);
+		}
+	}
+
+	return 0;
+}
+
 static int max9286_probe(struct i2c_client *client)
 {
 	struct max9286_priv *priv;
@@ -1293,17 +1383,11 @@ static int max9286_probe(struct i2c_client *client)
 	if (ret)
 		goto err_powerdown;
 
-	priv->regulator = devm_regulator_get(&client->dev, "poc");
-	if (IS_ERR(priv->regulator)) {
-		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Unable to get PoC regulator (%ld)\n",
-				PTR_ERR(priv->regulator));
-		ret = PTR_ERR(priv->regulator);
-		goto err_powerdown;
-	}
-
 	ret = max9286_parse_dt(priv);
+	if (ret)
+		goto err_cleanup_dt;
+
+	ret = max9286_get_poc_supplies(priv);
 	if (ret)
 		goto err_powerdown;
 
@@ -1329,7 +1413,7 @@ static int max9286_remove(struct i2c_client *client)
 
 	max9286_v4l2_unregister(priv);
 
-	regulator_disable(priv->regulator);
+	max9286_poc_power_off(priv);
 
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
 
-- 
Regards,

Laurent Pinchart

