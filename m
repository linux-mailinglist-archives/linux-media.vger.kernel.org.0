Return-Path: <linux-media+bounces-7384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E43880B9D
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB221F237AD
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 07:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBBE1DFEA;
	Wed, 20 Mar 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wFAHSV9v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239CE2208B
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710918041; cv=none; b=JX7J/b09DjhmMQIMQm6cYXul4GX43tBozzQSHAI7tq9xcHmr+F4qfs27zUMwu9NoJNr7rtkPqvDBIzt6ERFEj2wEYkhS5VjNpDrcOwhAr63yfOgfE+/tuJLff6vAqnfw6nj6/C5QMsiD5IlBa3bNTDhwPXG5Ysr0u6H1rWdLcMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710918041; c=relaxed/simple;
	bh=s0gmy0rcWFoFsk0aeh8EjRu57fJeBy3dr6lss4vZ0r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekxupLj1NR6yNWlyEepF5TCdgbRGtMLLx7KOXoWNO/EEXCIDjpheRoq0V7Cy63UmdNtYkn/Ff9GCvcbPf1NMWWOGhv+HkrzD2/fpAbnLICz4b/nvLmjV4Ci2znhYEV92ZICFyPpL70CkQ5k7rzyBBnN3nuVMRSPfXo5tIBBipMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wFAHSV9v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6472B3F1;
	Wed, 20 Mar 2024 08:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710918010;
	bh=s0gmy0rcWFoFsk0aeh8EjRu57fJeBy3dr6lss4vZ0r0=;
	h=From:To:Cc:Subject:Date:From;
	b=wFAHSV9vpq7IkrAYgln8rHPlPqRtur07OL4EBu4MG1LSBAIP2rOH0NTfeNt0D4A8L
	 wQTHZwLgGrJrMwQuf2pJTB2Pj+EMwJt6QHtlMN8lzH/+ONIMkFSaGSfohd6nYiScAU
	 ETyU4Yc9g69bflYCpCnsTI43+19N+LlcLouh0Yjo=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2] media: i2c: imx219: Use dev_err_probe on probe
Date: Wed, 20 Mar 2024 12:30:27 +0530
Message-ID: <20240320070027.77194-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop dev_err() and use the dev_err_probe() helper on probe path.

No functional changes intended.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
changes in v2:
- style fix : Leave out { } braces for single return statements
---
 drivers/media/i2c/imx219.c | 77 +++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e17ef2e9d9d0..51ebf5453fce 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -551,8 +551,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
-			__func__, ret);
+		dev_err_probe(&client->dev, ret, "Control init failed\n");
 		goto error;
 	}
 
@@ -1024,17 +1023,15 @@ static int imx219_identify_module(struct imx219 *imx219)
 	u64 val;
 
 	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
-	if (ret) {
-		dev_err(&client->dev, "failed to read chip id %x\n",
-			IMX219_CHIP_ID);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX219_CHIP_ID);
 
-	if (val != IMX219_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
-			IMX219_CHIP_ID, val);
-		return -EIO;
-	}
+	if (val != IMX219_CHIP_ID)
+		return dev_err_probe(&client->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     IMX219_CHIP_ID, val);
 
 	return 0;
 }
@@ -1048,35 +1045,36 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	int ret = -EINVAL;
 
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
-	if (!endpoint) {
-		dev_err(dev, "endpoint node not found\n");
-		return -EINVAL;
-	}
+	if (!endpoint)
+		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
 	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
-		dev_err(dev, "could not parse endpoint\n");
+		dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
 		goto error_out;
 	}
 
 	/* Check the number of MIPI CSI2 data lanes */
 	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
 	    ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
-		dev_err(dev, "only 2 or 4 data lanes are currently supported\n");
+		dev_err_probe(dev, -EINVAL,
+			      "only 2 or 4 data lanes are currently supported\n");
 		goto error_out;
 	}
 	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
 
 	/* Check the link frequency set in device tree */
 	if (!ep_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "link-frequency property not found in DT\n");
+		dev_err_probe(dev, -EINVAL,
+			      "link-frequency property not found in DT\n");
 		goto error_out;
 	}
 
 	if (ep_cfg.nr_of_link_frequencies != 1 ||
 	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
 	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
-		dev_err(dev, "Link frequency not supported: %lld\n",
-			ep_cfg.link_frequencies[0]);
+		dev_err_probe(dev, -EINVAL,
+			      "Link frequency not supported: %lld\n",
+			      ep_cfg.link_frequencies[0]);
 		goto error_out;
 	}
 
@@ -1107,31 +1105,25 @@ static int imx219_probe(struct i2c_client *client)
 		return -EINVAL;
 
 	imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
-	if (IS_ERR(imx219->regmap)) {
-		ret = PTR_ERR(imx219->regmap);
-		dev_err(dev, "failed to initialize CCI: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx219->regmap))
+		return dev_err_probe(dev, PTR_ERR(imx219->regmap),
+				     "failed to initialize CCI\n");
 
 	/* Get system clock (xclk) */
 	imx219->xclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(imx219->xclk)) {
-		dev_err(dev, "failed to get xclk\n");
-		return PTR_ERR(imx219->xclk);
-	}
+	if (IS_ERR(imx219->xclk))
+		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
+				     "failed to get xclk\n");
 
 	imx219->xclk_freq = clk_get_rate(imx219->xclk);
-	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
-		dev_err(dev, "xclk frequency not supported: %d Hz\n",
-			imx219->xclk_freq);
-		return -EINVAL;
-	}
+	if (imx219->xclk_freq != IMX219_XCLK_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     imx219->xclk_freq);
 
 	ret = imx219_get_regulators(imx219);
-	if (ret) {
-		dev_err(dev, "failed to get regulators\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	/* Request optional enable pin */
 	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
@@ -1183,20 +1175,21 @@ static int imx219_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
 	if (ret) {
-		dev_err(dev, "failed to init entity pads: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
 	}
 
 	imx219->sd.state_lock = imx219->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&imx219->sd);
 	if (ret < 0) {
-		dev_err(dev, "subdev init error: %d\n", ret);
+		dev_err_probe(dev, ret, "subdev init error\n");
 		goto error_media_entity;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
 	if (ret < 0) {
-		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
+		dev_err_probe(dev, ret,
+			      "failed to register sensor sub-device\n");
 		goto error_subdev_cleanup;
 	}
 
-- 
2.43.0


