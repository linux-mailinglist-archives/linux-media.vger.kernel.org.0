Return-Path: <linux-media+bounces-6780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0199877C2D
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 10:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23061C20FFA
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 09:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FA412E4A;
	Mon, 11 Mar 2024 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qtn3rAa5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED3134CD
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710147659; cv=none; b=PuFMw1ZOnyEcOtETKdzBEFsuSzEdncO0z31mOD2vqYyrNLS5giDUyOTgea4XGCdKRSCU0BRSENSY2f9Rkf/pIPTRDiaVkOVSmMlWf8dmcxmED5loFabx2ivaTUjlSn6U6mXaCRdEtlMRbkplo72/FAO319njKWL398B3xyFZlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710147659; c=relaxed/simple;
	bh=5LfTEm+2GAcPhW5eEjwx+hGvI07MOdaneM/UtfmeQsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGzzR3fJIyBZyrZYKFqs/6v6oGMGhgON8TC4V6r6UWqIaykFa2ouF8hBwrxRB2LL7uGyVZHrYgI2Bmda8zRyolZGyfhgYqwwEBN0nOHNS3dO8c7vB7MlTCDZ206yiHHL0Up2V9yz2kwcd8avqRrTBpqZBv6jU2CS+629EUOtcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qtn3rAa5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF9186BE;
	Mon, 11 Mar 2024 10:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710147628;
	bh=5LfTEm+2GAcPhW5eEjwx+hGvI07MOdaneM/UtfmeQsY=;
	h=From:To:Cc:Subject:Date:From;
	b=qtn3rAa5oFIyl1MvZA0F8+77GAgP7v0ccSpNP9pZj03c/zkWhuRqNtuNepW4DyHGl
	 RNvX+SGgaL2hLJ92VEy+7X8SS9FkfQFRsiSyhakotioDxarKCwCnJjqbz9Ppad4lyR
	 VpOsupm61nVmV9lzOdD7sefUAt1HO3ZZuAatNmPU=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	sakari.ailus@linux.intel.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Date: Mon, 11 Mar 2024 14:30:42 +0530
Message-ID: <20240311090042.30280-1-umang.jain@ideasonboard.com>
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
 drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e17ef2e9d9d0..acd27e2ef849 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
-			__func__, ret);
+		dev_err_probe(&client->dev, ret,
+			      "%s control init failed\n",
+			      __func__);
 		goto error;
 	}
 
@@ -1025,15 +1026,15 @@ static int imx219_identify_module(struct imx219 *imx219)
 
 	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
 	if (ret) {
-		dev_err(&client->dev, "failed to read chip id %x\n",
-			IMX219_CHIP_ID);
-		return ret;
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX219_CHIP_ID);
 	}
 
 	if (val != IMX219_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
-			IMX219_CHIP_ID, val);
-		return -EIO;
+		return dev_err_probe(&client->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     IMX219_CHIP_ID, val);
 	}
 
 	return 0;
@@ -1048,35 +1049,36 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
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
 
@@ -1108,30 +1110,27 @@ static int imx219_probe(struct i2c_client *client)
 
 	imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(imx219->regmap)) {
-		ret = PTR_ERR(imx219->regmap);
-		dev_err(dev, "failed to initialize CCI: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(imx219->regmap),
+				     "failed to initialize CCI\n");
 	}
 
 	/* Get system clock (xclk) */
 	imx219->xclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(imx219->xclk)) {
-		dev_err(dev, "failed to get xclk\n");
-		return PTR_ERR(imx219->xclk);
+		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
+				     "failed to get xclk\n");
 	}
 
 	imx219->xclk_freq = clk_get_rate(imx219->xclk);
 	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
-		dev_err(dev, "xclk frequency not supported: %d Hz\n",
-			imx219->xclk_freq);
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     imx219->xclk_freq);
 	}
 
 	ret = imx219_get_regulators(imx219);
-	if (ret) {
-		dev_err(dev, "failed to get regulators\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	/* Request optional enable pin */
 	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
@@ -1183,20 +1182,21 @@ static int imx219_probe(struct i2c_client *client)
 
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


