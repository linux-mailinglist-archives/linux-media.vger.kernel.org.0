Return-Path: <linux-media+bounces-37359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6F5B00A82
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F3E5C1A52
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8821D2F273D;
	Thu, 10 Jul 2025 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sSXSEJQu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA02F0E5A
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169749; cv=none; b=SHFvA8TqqpFrft36lR4IchBP31SL/noCBgYbvkAJhcbkPLEzlYThflhFAoEr67xQX9g60U9sOM9N3GEC1Jtb/CggHLtpjWfYSp+xDoWcNGHAAmMRFAZ8S83cE/xlr/KjurWCX2XsURvJ5LWwMVY49rYHy0kdgpEbjaQO9G0Evfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169749; c=relaxed/simple;
	bh=YAahzBNwp1ANZ1lrApJjqzvSGqraVtkpkK3wGBesHU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfmbFqGQR4t+53rRj+/H8Yrma4bBxQQy1SBt+COMpUEVmQOkmaZIVUp3poZYM7+Gi2vSgkuTJKy5jvpmpNwKNvKUBeXMG88X5sUKIlCJQffQ96k+Fn8w47R457Q+r8/vMthRzYUlzKM3nyuUjVbvyiuVEWyUbpSK1tCXo/bqecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sSXSEJQu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D11EE111D;
	Thu, 10 Jul 2025 19:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169716;
	bh=YAahzBNwp1ANZ1lrApJjqzvSGqraVtkpkK3wGBesHU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSXSEJQuKFJDyq/K976lIRHX+py8wDHThYK0lq4Y3ipPqUelSQwGajcPv+CJ8thLV
	 QDJkhUVMG3wOKBGDRBkPceKmiYtYkUzJo6XxwFlyeEdqB1k8nrEwcwdf1T3PIi2BKn
	 1MuPViRclGhTR1xHv2Zi84orJEZpSncELS2Dphlc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 16/72] media: i2c: mt9v032: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:12 +0300
Message-ID: <20250710174808.5361-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver needs to access the struct device in many places, and
retrieves it from the i2c_client itself retrieved with
v4l2_get_subdevdata(). Store it as a pointer in struct mt9v032 and
access it from there instead, to simplify the driver.

While at it, fix mistakes in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9v032.c | 52 +++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 9f4b4cb9853e..888f3280378d 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -15,14 +15,14 @@
 #include <linux/i2c.h>
 #include <linux/log2.h>
 #include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/videodev2.h>
 #include <linux/v4l2-mediabus.h>
-#include <linux/module.h>
+#include <linux/videodev2.h>
 
 #include <media/i2c/mt9v032.h>
 #include <media/v4l2-ctrls.h>
@@ -183,6 +183,8 @@ static const struct mt9v032_model_version mt9v032_versions[] = {
 };
 
 struct mt9v032 {
+	struct device *dev;
+
 	struct v4l2_subdev subdev;
 	struct media_pad pad;
 
@@ -473,13 +475,12 @@ static int mt9v032_get_format(struct v4l2_subdev *subdev,
 
 static void mt9v032_configure_pixel_rate(struct mt9v032 *mt9v032)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&mt9v032->subdev);
 	int ret;
 
 	ret = v4l2_ctrl_s_ctrl_int64(mt9v032->pixel_rate,
 				     mt9v032->sysclk / mt9v032->hratio);
 	if (ret < 0)
-		dev_warn(&client->dev, "failed to set pixel rate (%d)\n", ret);
+		dev_warn(mt9v032->dev, "failed to set pixel rate (%d)\n", ret);
 }
 
 static unsigned int mt9v032_calc_ratio(unsigned int input, unsigned int output)
@@ -883,12 +884,12 @@ static int mt9v032_registered(struct v4l2_subdev *subdev)
 	u32 version;
 	int ret;
 
-	dev_info(&client->dev, "Probing MT9V032 at address 0x%02x\n",
+	dev_info(mt9v032->dev, "Probing MT9V032 at address 0x%02x\n",
 			client->addr);
 
 	ret = mt9v032_power_on(mt9v032);
 	if (ret < 0) {
-		dev_err(&client->dev, "MT9V032 power up failed\n");
+		dev_err(mt9v032->dev, "MT9V032 power up failed\n");
 		return ret;
 	}
 
@@ -898,7 +899,7 @@ static int mt9v032_registered(struct v4l2_subdev *subdev)
 	mt9v032_power_off(mt9v032);
 
 	if (ret < 0) {
-		dev_err(&client->dev, "Failed reading chip version\n");
+		dev_err(mt9v032->dev, "Failed reading chip version\n");
 		return ret;
 	}
 
@@ -910,12 +911,12 @@ static int mt9v032_registered(struct v4l2_subdev *subdev)
 	}
 
 	if (mt9v032->version == NULL) {
-		dev_err(&client->dev, "Unsupported chip version 0x%04x\n",
+		dev_err(mt9v032->dev, "Unsupported chip version 0x%04x\n",
 			version);
 		return -ENODEV;
 	}
 
-	dev_info(&client->dev, "%s detected at address 0x%02x\n",
+	dev_info(mt9v032->dev, "%s detected at address 0x%02x\n",
 		 mt9v032->version->name, client->addr);
 
 	mt9v032_configure_pixel_rate(mt9v032);
@@ -995,25 +996,24 @@ static const struct regmap_config mt9v032_regmap_config = {
  * Driver initialization and probing
  */
 
-static struct mt9v032_platform_data *
-mt9v032_get_pdata(struct i2c_client *client)
+static struct mt9v032_platform_data *mt9v032_get_pdata(struct mt9v032 *mt9v032)
 {
 	struct mt9v032_platform_data *pdata = NULL;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
 	struct device_node *np;
 	struct property *prop;
 
-	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
-		return client->dev.platform_data;
+	if (!IS_ENABLED(CONFIG_OF) || !mt9v032->dev->of_node)
+		return mt9v032->dev->platform_data;
 
-	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
+	np = of_graph_get_endpoint_by_regs(mt9v032->dev->of_node, 0, -1);
 	if (!np)
 		return NULL;
 
 	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
 		goto done;
 
-	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(mt9v032->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		goto done;
 
@@ -1022,7 +1022,7 @@ mt9v032_get_pdata(struct i2c_client *client)
 		u64 *link_freqs;
 		size_t size = prop->length / sizeof(*link_freqs);
 
-		link_freqs = devm_kcalloc(&client->dev, size,
+		link_freqs = devm_kcalloc(mt9v032->dev, size,
 					  sizeof(*link_freqs), GFP_KERNEL);
 		if (!link_freqs)
 			goto done;
@@ -1045,7 +1045,6 @@ mt9v032_get_pdata(struct i2c_client *client)
 
 static int mt9v032_probe(struct i2c_client *client)
 {
-	struct mt9v032_platform_data *pdata = mt9v032_get_pdata(client);
 	struct mt9v032 *mt9v032;
 	unsigned int i;
 	int ret;
@@ -1054,27 +1053,29 @@ static int mt9v032_probe(struct i2c_client *client)
 	if (!mt9v032)
 		return -ENOMEM;
 
+	mt9v032->dev = &client->dev;
+
 	mt9v032->regmap = devm_regmap_init_i2c(client, &mt9v032_regmap_config);
 	if (IS_ERR(mt9v032->regmap))
 		return PTR_ERR(mt9v032->regmap);
 
-	mt9v032->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	mt9v032->clk = devm_v4l2_sensor_clk_get(mt9v032->dev, NULL);
 	if (IS_ERR(mt9v032->clk))
-		return dev_err_probe(&client->dev, PTR_ERR(mt9v032->clk),
+		return dev_err_probe(mt9v032->dev, PTR_ERR(mt9v032->clk),
 				     "failed to get the clock\n");
 
-	mt9v032->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+	mt9v032->reset_gpio = devm_gpiod_get_optional(mt9v032->dev, "reset",
 						      GPIOD_OUT_HIGH);
 	if (IS_ERR(mt9v032->reset_gpio))
 		return PTR_ERR(mt9v032->reset_gpio);
 
-	mt9v032->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
+	mt9v032->standby_gpio = devm_gpiod_get_optional(mt9v032->dev, "standby",
 							GPIOD_OUT_LOW);
 	if (IS_ERR(mt9v032->standby_gpio))
 		return PTR_ERR(mt9v032->standby_gpio);
 
 	mutex_init(&mt9v032->power_lock);
-	mt9v032->pdata = pdata;
+	mt9v032->pdata = mt9v032_get_pdata(mt9v032);
 	mt9v032->model = i2c_get_match_data(client);
 
 	v4l2_ctrl_handler_init(&mt9v032->ctrls, 11 +
@@ -1120,7 +1121,8 @@ static int mt9v032_probe(struct i2c_client *client)
 		v4l2_ctrl_new_std(&mt9v032->ctrls, &mt9v032_ctrl_ops,
 				  V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1, 1);
 
-	if (pdata && pdata->link_freqs) {
+	if (mt9v032->pdata && mt9v032->pdata->link_freqs) {
+		const struct mt9v032_platform_data *pdata = mt9v032->pdata;
 		unsigned int def = 0;
 
 		for (i = 0; pdata->link_freqs[i]; ++i) {
@@ -1140,7 +1142,7 @@ static int mt9v032_probe(struct i2c_client *client)
 	mt9v032->subdev.ctrl_handler = &mt9v032->ctrls;
 
 	if (mt9v032->ctrls.error) {
-		dev_err(&client->dev, "control initialization error %d\n",
+		dev_err(mt9v032->dev, "control initialization error %d\n",
 			mt9v032->ctrls.error);
 		ret = mt9v032->ctrls.error;
 		goto err;
@@ -1178,7 +1180,7 @@ static int mt9v032_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto err;
 
-	mt9v032->subdev.dev = &client->dev;
+	mt9v032->subdev.dev = mt9v032->dev;
 	ret = v4l2_async_register_subdev(&mt9v032->subdev);
 	if (ret < 0)
 		goto err;
-- 
Regards,

Laurent Pinchart


