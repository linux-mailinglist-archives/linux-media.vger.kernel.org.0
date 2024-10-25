Return-Path: <linux-media+bounces-20345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62509B0CFE
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 20:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F23961C22BD1
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29C220BB57;
	Fri, 25 Oct 2024 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wZy9dXlv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9D682485
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880240; cv=none; b=JVYqUkig41U8Xm/1Tny4Lq7GTNHasvhKyo4V2PuDvhjx8eRIUaYNDYjuwSkuSv8Y+zZh9YBpL1C6uHQ3bWAqNt6M0n+BpU5gJE74qMcft+/08xJm/B+kQedadcXkvacPdHtoIb0ar/8ZnO/pbpWLwwLRdaxwwKxgduiJWUWq+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880240; c=relaxed/simple;
	bh=IPpQ/+Lhug+r4sCsnVJhTkhgk62vORinPJMdb7/Wndw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEAsC/ihgX8SKjHQrnyXzjzqcmD5+DhpUsey77l8evhNl4C4Z/rCF7IWsW5YRasDPFRQ1s5jLi6HT6ZSWG2nTmwyOhyrVxFUaZFa7p4xFXgsHhMjRJvcbuK5OqWqHilPDvBUYclloYgsmVBzwqAyu2OZMZ7i/YppFyczuc2i0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wZy9dXlv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFF48D21;
	Fri, 25 Oct 2024 20:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729880127;
	bh=IPpQ/+Lhug+r4sCsnVJhTkhgk62vORinPJMdb7/Wndw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wZy9dXlvo8ZCoA3Ywv1vTk5rDS6F3HPFgCjM6DcNBwIQGzWaj40AnpwWX3idphohf
	 tdMpmnCBBl3hoaagi7Ed6ylqZN8Kh+5r+nrSAPOCtC8KyjBlRomsKp4+1W8POACy5m
	 eX1fd3Sv/g3y550QMQ6iKEXqunjA/6/zzxAwc3jg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH 1/2] media: i2c: mt9p031: Drop support for legacy platform data
Date: Fri, 25 Oct 2024 21:17:07 +0300
Message-ID: <20241025181708.20648-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
References: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
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
index d8735c246e52..70851f296142 100644
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
+	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
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


