Return-Path: <linux-media+bounces-20461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDEC9B3C19
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 21:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39654283831
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B532D1E0DEA;
	Mon, 28 Oct 2024 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kebxaf7f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9331E0B7A
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148295; cv=none; b=qgvXJTgsL7mQEDWaKOyjHbMeTVes5M/LN+FHoYLnJatm4B8gO3IklUzPv35GFl/3OiOJfDQuOLDpn4tgl5KkNPtS4GsCNaSj/a/Mlhle0CP34ouQn9sMoSZvNTy35u6lUH2tRtAlKD3wg1RYVQcdv6HDqCeVFDv4BskIsWYxvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148295; c=relaxed/simple;
	bh=R/r3RlADKJF3JD6yNrbn+b1NJNjcv2TV/JTrIrD/hdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUH1Hqza9k031x8DL7X0gfBUUo05kemcpwaUfIntTEZfRQhg9f16SAEWMYUw5nHT/013vsLYUpGk6iCllYK1BgccMbHlhMizktj50FXkRwtprnotAXvAUV/AtD58yQNaoNQMK1TAKOk7WoW6eEyroDYgp8+E98JD/W/6KnJ8duY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kebxaf7f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D12CC641;
	Mon, 28 Oct 2024 21:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730148289;
	bh=R/r3RlADKJF3JD6yNrbn+b1NJNjcv2TV/JTrIrD/hdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kebxaf7fOh8Y+Woz2lIuFGNK38jiblJj8VSxDg2FGbKdkTlngb+eNs4I8LWwQUQCg
	 71bQOO4qNtP7bL7dxMPWBNTBr/dI6IOS7fAoMAgfwKU0/6JRthsfi75Af2bd+3xBlt
	 ogfhs3MaZhhDnIE5tEE7Aza2szy+VHx6akXXfse4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH v2 1/3] media: i2c: mt9p031: Drop support for legacy platform data
Date: Mon, 28 Oct 2024 22:44:41 +0200
Message-ID: <20241028204443.22426-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
References: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No user of the mt9p031_platform_data legacy platform data for board
files exist in the kernel anymore. Drop support from the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
Changes since v1:

- Drop IS_ENABLED(CONFIG_OF) check
---
 MAINTAINERS                 |  1 -
 drivers/media/i2c/mt9p031.c | 71 +++++++++++++++++--------------------
 include/media/i2c/mt9p031.h | 18 ----------
 3 files changed, 33 insertions(+), 57 deletions(-)
 delete mode 100644 include/media/i2c/mt9p031.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a14891a8fa9..99bab0c359c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15839,7 +15839,6 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
 F:	drivers/media/i2c/mt9p031.c
-F:	include/media/i2c/mt9p031.h
 
 MT9T112 APTINA CAMERA SENSOR
 M:	Jacopo Mondi <jacopo@jmondi.org>
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index d8735c246e52..9dcb8a0962a4 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -24,7 +24,6 @@
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
-#include <media/i2c/mt9p031.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -118,13 +117,16 @@ struct mt9p031 {
 	struct media_pad pad;
 	struct v4l2_rect crop;  /* Sensor window */
 	struct v4l2_mbus_framefmt format;
-	struct mt9p031_platform_data *pdata;
 	struct mutex power_lock; /* lock to protect power_count */
 	int power_count;
 
 	struct clk *clk;
 	struct regulator_bulk_data regulators[3];
 
+	unsigned int pixclk_pol:1;
+	int ext_freq;
+	int target_freq;
+
 	u32 code;
 	struct aptina_pll pll;
 	unsigned int clk_div;
@@ -225,7 +227,6 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
 	};
 
 	struct i2c_client *client = v4l2_get_subdevdata(&mt9p031->subdev);
-	struct mt9p031_platform_data *pdata = mt9p031->pdata;
 	unsigned long ext_freq;
 	int ret;
 
@@ -233,7 +234,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
 	if (IS_ERR(mt9p031->clk))
 		return PTR_ERR(mt9p031->clk);
 
-	ret = clk_set_rate(mt9p031->clk, pdata->ext_freq);
+	ret = clk_set_rate(mt9p031->clk, mt9p031->ext_freq);
 	if (ret < 0)
 		return ret;
 
@@ -245,7 +246,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
 	if (ext_freq > limits.ext_clock_max) {
 		unsigned int div;
 
-		div = DIV_ROUND_UP(ext_freq, pdata->target_freq);
+		div = DIV_ROUND_UP(ext_freq, mt9p031->target_freq);
 		div = roundup_pow_of_two(div) / 2;
 
 		mt9p031->clk_div = min_t(unsigned int, div, 64);
@@ -255,7 +256,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
 	}
 
 	mt9p031->pll.ext_clock = ext_freq;
-	mt9p031->pll.pix_clock = pdata->target_freq;
+	mt9p031->pll.pix_clock = mt9p031->target_freq;
 	mt9p031->use_pll = true;
 
 	return aptina_pll_calculate(&client->dev, &limits, &mt9p031->pll);
@@ -376,7 +377,7 @@ static int __mt9p031_set_power(struct mt9p031 *mt9p031, bool on)
 	}
 
 	/* Configure the pixel clock polarity */
-	if (mt9p031->pdata && mt9p031->pdata->pixclk_pol) {
+	if (mt9p031->pixclk_pol) {
 		ret = mt9p031_write(client, MT9P031_PIXEL_CLOCK_CONTROL,
 				MT9P031_PIXEL_CLOCK_INVERT);
 		if (ret < 0)
@@ -1057,53 +1058,42 @@ static const struct v4l2_subdev_internal_ops mt9p031_subdev_internal_ops = {
  * Driver initialization and probing
  */
 
-static struct mt9p031_platform_data *
-mt9p031_get_pdata(struct i2c_client *client)
+static int mt9p031_parse_of(struct mt9p031 *mt9p031, struct device *dev)
 {
-	struct mt9p031_platform_data *pdata = NULL;
 	struct device_node *np;
 	struct v4l2_fwnode_endpoint endpoint = {
 		.bus_type = V4L2_MBUS_PARALLEL
 	};
+	int ret;
 
-	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
-		return client->dev.platform_data;
+	if (!dev->of_node)
+		return -EINVAL;
 
-	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
+	np = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!np)
-		return NULL;
+		return -EINVAL;
 
-	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
-		goto done;
-
-	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		goto done;
-
-	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
-	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
-
-	pdata->pixclk_pol = !!(endpoint.bus.parallel.flags &
-			       V4L2_MBUS_PCLK_SAMPLE_RISING);
-
-done:
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint);
 	of_node_put(np);
-	return pdata;
+	if (ret)
+		return ret;
+
+	of_property_read_u32(np, "input-clock-frequency", &mt9p031->ext_freq);
+	of_property_read_u32(np, "pixel-clock-frequency", &mt9p031->target_freq);
+
+	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
+				 V4L2_MBUS_PCLK_SAMPLE_RISING);
+
+	return 0;
 }
 
 static int mt9p031_probe(struct i2c_client *client)
 {
-	struct mt9p031_platform_data *pdata = mt9p031_get_pdata(client);
 	struct i2c_adapter *adapter = client->adapter;
 	struct mt9p031 *mt9p031;
 	unsigned int i;
 	int ret;
 
-	if (pdata == NULL) {
-		dev_err(&client->dev, "No platform data\n");
-		return -EINVAL;
-	}
-
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&client->dev,
 			"I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
@@ -1114,7 +1104,12 @@ static int mt9p031_probe(struct i2c_client *client)
 	if (mt9p031 == NULL)
 		return -ENOMEM;
 
-	mt9p031->pdata = pdata;
+	ret = mt9p031_parse_of(mt9p031, &client->dev);
+	if (ret) {
+		dev_err(&client->dev, "Failed to parse DT properties\n");
+		return ret;
+	}
+
 	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
 	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
 	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
@@ -1145,8 +1140,8 @@ static int mt9p031_probe(struct i2c_client *client)
 	v4l2_ctrl_new_std(&mt9p031->ctrls, &mt9p031_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(&mt9p031->ctrls, &mt9p031_ctrl_ops,
-			  V4L2_CID_PIXEL_RATE, pdata->target_freq,
-			  pdata->target_freq, 1, pdata->target_freq);
+			  V4L2_CID_PIXEL_RATE, mt9p031->target_freq,
+			  mt9p031->target_freq, 1, mt9p031->target_freq);
 	v4l2_ctrl_new_std_menu_items(&mt9p031->ctrls, &mt9p031_ctrl_ops,
 			  V4L2_CID_TEST_PATTERN,
 			  ARRAY_SIZE(mt9p031_test_pattern_menu) - 1, 0,
diff --git a/include/media/i2c/mt9p031.h b/include/media/i2c/mt9p031.h
deleted file mode 100644
index f933cd0be8e5..000000000000
--- a/include/media/i2c/mt9p031.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef MT9P031_H
-#define MT9P031_H
-
-struct v4l2_subdev;
-
-/*
- * struct mt9p031_platform_data - MT9P031 platform data
- * @ext_freq: Input clock frequency
- * @target_freq: Pixel clock frequency
- */
-struct mt9p031_platform_data {
-	unsigned int pixclk_pol:1;
-	int ext_freq;
-	int target_freq;
-};
-
-#endif
-- 
Regards,

Laurent Pinchart


