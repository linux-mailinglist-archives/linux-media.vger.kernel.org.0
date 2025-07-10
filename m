Return-Path: <linux-media+bounces-37360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B5B00A83
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE9676080D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE6A2F2C44;
	Thu, 10 Jul 2025 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QwiGZbmF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE9B279DB6
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169750; cv=none; b=q1SELQ9XskUZQMW1bYBPZNYm1PQbUTXxe9WhSabPln88ekeMjDvyI3LzfO17EOoUjeUtJKUbM5baMgkGB8e5PZFQqwsbQNGYbJSX0wH8TQGziu0+2H9jTtQSjjBcfw8hOlmPMSLLCJmOHpaF1DS2EXqqyCjT5jCLVSBHuuCnyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169750; c=relaxed/simple;
	bh=qlWfdMVMCQXmNaN+1KdNFlOBWbCFwjJQNLD+XKWUF9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isnnarrc8tCEF/mlXfRAN0pOLQmOJWsTLj7P37GHx9BvBfU3IUvv/Sl5rkkAucB7VhytiZpYXYGO4eJth0UxTbd5YzcFHHICb11nFiEjaGelwyOksefnNRmFL4iVl25GZW6QO3A9JgGg58eoGj/JGHIx/NhmtiC9cHw8hL09pds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QwiGZbmF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6E50BC0B;
	Thu, 10 Jul 2025 19:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169717;
	bh=qlWfdMVMCQXmNaN+1KdNFlOBWbCFwjJQNLD+XKWUF9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwiGZbmFaEDKkZR2CyedVjuX+irr3WOBGht9NueFk1tvM60SeMylemSgEM6c4RCGT
	 XYWqoaJxf3nhDaqCDbtsJfMNQswQ9imyrErt8gEJ7Pt9M4Uz/7J5VqzkNgFeL7vAoB
	 5n58y8uWdRXw4K0FTch4N/J+ZEgSoxPyUnp494l4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Matthias Fend <matthias.fend@emfend.at>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>
Subject: [PATCH 17/72] media: i2c: mt9v032: Drop support for platform data
Date: Thu, 10 Jul 2025 20:47:13 +0300
Message-ID: <20250710174808.5361-18-laurent.pinchart@ideasonboard.com>
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

The last user of the mt9v032 driver through board files and platform
data has long been removed. Drop support for platform data from the
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS                 |  1 -
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9v032.c | 66 +++++++++++++++----------------------
 include/media/i2c/mt9v032.h | 12 -------
 4 files changed, 28 insertions(+), 52 deletions(-)
 delete mode 100644 include/media/i2c/mt9v032.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ef99240a57e..2c9924b83a86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16980,7 +16980,6 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
 F:	drivers/media/i2c/mt9v032.c
-F:	include/media/i2c/mt9v032.h
 
 MT9V111 APTINA CAMERA SENSOR
 M:	Jacopo Mondi <jacopo@jmondi.org>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6237fe804a5c..13859ab21d2c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -317,6 +317,7 @@ config VIDEO_MT9V011
 
 config VIDEO_MT9V032
 	tristate "Micron MT9V032 sensor support"
+	depends on OF
 	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Micron
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 888f3280378d..d4359d5b92bb 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -24,7 +24,6 @@
 #include <linux/v4l2-mediabus.h>
 #include <linux/videodev2.h>
 
-#include <media/i2c/mt9v032.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -182,6 +181,13 @@ static const struct mt9v032_model_version mt9v032_versions[] = {
 	{ MT9V034_CHIP_ID_REV1, "MT9V024/MT9V034 rev1" },
 };
 
+struct mt9v032_platform_data {
+	unsigned int clk_pol:1;
+
+	const s64 *link_freqs;
+	s64 link_def_freq;
+};
+
 struct mt9v032 {
 	struct device *dev;
 
@@ -207,7 +213,7 @@ struct mt9v032 {
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *standby_gpio;
 
-	struct mt9v032_platform_data *pdata;
+	struct mt9v032_platform_data pdata;
 	const struct mt9v032_model_info *model;
 	const struct mt9v032_model_version *version;
 
@@ -332,7 +338,7 @@ static int __mt9v032_set_power(struct mt9v032 *mt9v032, bool on)
 		return ret;
 
 	/* Configure the pixel clock polarity */
-	if (mt9v032->pdata && mt9v032->pdata->clk_pol) {
+	if (mt9v032->pdata.clk_pol) {
 		ret = regmap_write(map, mt9v032->model->data->pclk_reg,
 				MT9V032_PIXEL_CLOCK_INV_PXL_CLK);
 		if (ret < 0)
@@ -683,7 +689,7 @@ static int mt9v032_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (mt9v032->link_freq == NULL)
 			break;
 
-		freq = mt9v032->pdata->link_freqs[mt9v032->link_freq->val];
+		freq = mt9v032->pdata.link_freqs[mt9v032->link_freq->val];
 		*mt9v032->pixel_rate->p_new.p_s64 = freq;
 		mt9v032->sysclk = freq;
 		break;
@@ -996,26 +1002,19 @@ static const struct regmap_config mt9v032_regmap_config = {
  * Driver initialization and probing
  */
 
-static struct mt9v032_platform_data *mt9v032_get_pdata(struct mt9v032 *mt9v032)
+static int mt9v032_get_pdata(struct mt9v032 *mt9v032)
 {
-	struct mt9v032_platform_data *pdata = NULL;
+	struct mt9v032_platform_data *pdata = &mt9v032->pdata;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
-	struct device_node *np;
+	struct device_node *np __free(device_node) = NULL;
 	struct property *prop;
 
-	if (!IS_ENABLED(CONFIG_OF) || !mt9v032->dev->of_node)
-		return mt9v032->dev->platform_data;
-
 	np = of_graph_get_endpoint_by_regs(mt9v032->dev->of_node, 0, -1);
 	if (!np)
-		return NULL;
+		return -EINVAL;
 
 	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
-		goto done;
-
-	pdata = devm_kzalloc(mt9v032->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		goto done;
+		return -EINVAL;
 
 	prop = of_find_property(np, "link-frequencies", NULL);
 	if (prop) {
@@ -1025,11 +1024,11 @@ static struct mt9v032_platform_data *mt9v032_get_pdata(struct mt9v032 *mt9v032)
 		link_freqs = devm_kcalloc(mt9v032->dev, size,
 					  sizeof(*link_freqs), GFP_KERNEL);
 		if (!link_freqs)
-			goto done;
+			return -EINVAL;
 
 		if (of_property_read_u64_array(np, "link-frequencies",
 					       link_freqs, size) < 0)
-			goto done;
+			return -EINVAL;
 
 		pdata->link_freqs = link_freqs;
 		pdata->link_def_freq = link_freqs[0];
@@ -1038,9 +1037,7 @@ static struct mt9v032_platform_data *mt9v032_get_pdata(struct mt9v032 *mt9v032)
 	pdata->clk_pol = !!(endpoint.bus.parallel.flags &
 			    V4L2_MBUS_PCLK_SAMPLE_RISING);
 
-done:
-	of_node_put(np);
-	return pdata;
+	return 0;
 }
 
 static int mt9v032_probe(struct i2c_client *client)
@@ -1075,8 +1072,13 @@ static int mt9v032_probe(struct i2c_client *client)
 		return PTR_ERR(mt9v032->standby_gpio);
 
 	mutex_init(&mt9v032->power_lock);
-	mt9v032->pdata = mt9v032_get_pdata(mt9v032);
-	mt9v032->model = i2c_get_match_data(client);
+
+	ret = mt9v032_get_pdata(mt9v032);
+	if (ret)
+		return dev_err_probe(mt9v032->dev, -EINVAL,
+				     "Failed to parse DT properties\n");
+
+	mt9v032->model = device_get_match_data(mt9v032->dev);
 
 	v4l2_ctrl_handler_init(&mt9v032->ctrls, 11 +
 			       ARRAY_SIZE(mt9v032_aegc_controls));
@@ -1121,8 +1123,8 @@ static int mt9v032_probe(struct i2c_client *client)
 		v4l2_ctrl_new_std(&mt9v032->ctrls, &mt9v032_ctrl_ops,
 				  V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1, 1);
 
-	if (mt9v032->pdata && mt9v032->pdata->link_freqs) {
-		const struct mt9v032_platform_data *pdata = mt9v032->pdata;
+	if (mt9v032->pdata.link_freqs) {
+		const struct mt9v032_platform_data *pdata = &mt9v032->pdata;
 		unsigned int def = 0;
 
 		for (i = 0; pdata->link_freqs[i]; ++i) {
@@ -1264,19 +1266,6 @@ static const struct mt9v032_model_info mt9v032_models[] = {
 	},
 };
 
-static const struct i2c_device_id mt9v032_id[] = {
-	{ "mt9v022", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V022_COLOR] },
-	{ "mt9v022m", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V022_MONO] },
-	{ "mt9v024", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V024_COLOR] },
-	{ "mt9v024m", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V024_MONO] },
-	{ "mt9v032", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V032_COLOR] },
-	{ "mt9v032m", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V032_MONO] },
-	{ "mt9v034", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V034_COLOR] },
-	{ "mt9v034m", (kernel_ulong_t)&mt9v032_models[MT9V032_MODEL_V034_MONO] },
-	{ /* Sentinel */ }
-};
-MODULE_DEVICE_TABLE(i2c, mt9v032_id);
-
 static const struct of_device_id mt9v032_of_match[] = {
 	{ .compatible = "aptina,mt9v022", .data = &mt9v032_models[MT9V032_MODEL_V022_COLOR] },
 	{ .compatible = "aptina,mt9v022m", .data = &mt9v032_models[MT9V032_MODEL_V022_MONO] },
@@ -1297,7 +1286,6 @@ static struct i2c_driver mt9v032_driver = {
 	},
 	.probe		= mt9v032_probe,
 	.remove		= mt9v032_remove,
-	.id_table	= mt9v032_id,
 };
 
 module_i2c_driver(mt9v032_driver);
diff --git a/include/media/i2c/mt9v032.h b/include/media/i2c/mt9v032.h
deleted file mode 100644
index 83a37ccfb649..000000000000
--- a/include/media/i2c/mt9v032.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _MEDIA_MT9V032_H
-#define _MEDIA_MT9V032_H
-
-struct mt9v032_platform_data {
-	unsigned int clk_pol:1;
-
-	const s64 *link_freqs;
-	s64 link_def_freq;
-};
-
-#endif
-- 
Regards,

Laurent Pinchart


