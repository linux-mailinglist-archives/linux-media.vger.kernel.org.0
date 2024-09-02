Return-Path: <linux-media+bounces-17403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA9968F3B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24AD3283D09
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546CC188010;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW53hbBR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8661A4E66;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314031; cv=none; b=q+p3YsWXTgAOXpKjmTgykmNSUNbz7/gIfc9Vpo4h0OzN5dQr5AtAvVBQ5E5xnKg00d2qQ2vAlFKwxqbgLcW5xmYOzgrruesWyUh7gCKFTJC5dmm3EN+jKpEvtynovBNjxsjyOAlDWZwnqa/qzIsEEcvEkWt8aU9t2HtmdrjjXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314031; c=relaxed/simple;
	bh=nx6mflakyBqpsC86VIKsBabKD0rMD6XVS+cKSb+sgyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SS5XomudYJTEQqri1o0wXkE0g9PuwgCzTSGCI+iGWFkMgZvGHBckfKmNzHkzJzdGQw9Axp9734UOzS+wjCwey1PDyBpEaU4nTBQUhON45xNwVrVV9H8RanNm7zdqWbQmKVBJ19jqHJ6fg2CpHafWFJgjWSbhVdlyqcQ83Avabx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW53hbBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C403C4CECB;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=nx6mflakyBqpsC86VIKsBabKD0rMD6XVS+cKSb+sgyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bW53hbBRC1rbtLS3qOQqISQ5aEVQnBK8BCPJ9ZrRce4HH4yz4D9W/R2JS529+vvhm
	 lrbuQmQCKZG3GGHypelQlksyjswjDJKFqmVLamd16s0cAfen4qnh0wBvUUjCgOkpYB
	 jNpbITQNKrm06LIFTfEcy5Qwp5zE2ofHDp/QWzHkPrVdPcQ8zJ2CFBKMUMj/GuqZTt
	 vPzsyACkHCM9nf4ls1FpomuyuhcblxfAQy/+suWOJLMWX0BDpCcpTcbLMXLq2Onvjr
	 iitGqJtqe7uqc1tXqMcf1Git0s+T+OaW1t3kC3+L9NtNFTDJvXWu9XNFkG55mYIMYm
	 D7qEUvurSK2BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606D2CA0ED3;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:30 +0200
Subject: [PATCH 03/13] media: i2c: imx214: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-3-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=3828;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=gQb6ABvE7D9OIIvQC6eeLkEiGYSYlYhKFugiTcrk54I=;
 b=CHlB9EoW0YTY/z/zjbcYbo9G5I5Oypzx6xukEVXJY0i6txasFpjDRfeaVhnUEiRgotZY9ZYbK
 DOHqvJHvo2zDw6UMnJgQYDTJ8QPkKPskhns1VRu0qIm6MMp7y/QfonP
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 52 ++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 283d4783c22e..ad2f1db6baeb 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -931,14 +931,12 @@ static int imx214_parse_fwnode(struct device *dev)
 	int ret;
 
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
-	if (!endpoint) {
-		dev_err(dev, "endpoint node not found\n");
-		return -EINVAL;
-	}
+	if (!endpoint)
+		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
 	if (ret) {
-		dev_err(dev, "parsing endpoint node failed\n");
+		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
 		goto done;
 	}
 
@@ -947,8 +945,9 @@ static int imx214_parse_fwnode(struct device *dev)
 			break;
 
 	if (i == bus_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "link-frequencies %d not supported, Please review your DT\n",
-			IMX214_DEFAULT_LINK_FREQ);
+		dev_err_probe(dev, -EINVAL,
+			      "link-frequencies %d not supported, Please review your DT\n",
+			      IMX214_DEFAULT_LINK_FREQ);
 		ret = -EINVAL;
 		goto done;
 	}
@@ -976,34 +975,27 @@ static int imx214_probe(struct i2c_client *client)
 	imx214->dev = dev;
 
 	imx214->xclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(imx214->xclk)) {
-		dev_err(dev, "could not get xclk");
-		return PTR_ERR(imx214->xclk);
-	}
+	if (IS_ERR(imx214->xclk))
+		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
+				     "failed to get xclk\n");
 
 	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set xclk frequency\n");
 
 	ret = imx214_get_regulators(dev, imx214);
-	if (ret < 0) {
-		dev_err(dev, "cannot get regulators\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	imx214->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(imx214->enable_gpio)) {
-		dev_err(dev, "cannot get enable gpio\n");
-		return PTR_ERR(imx214->enable_gpio);
-	}
+	if (IS_ERR(imx214->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(imx214->enable_gpio),
+				     "failed to get enable gpio\n");
 
 	imx214->regmap = devm_regmap_init_i2c(client, &sensor_regmap_config);
-	if (IS_ERR(imx214->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(imx214->regmap);
-	}
+	if (IS_ERR(imx214->regmap))
+		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
+				     "regmap init failed\n");
 
 	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
 	imx214->sd.internal_ops = &imx214_internal_ops;
@@ -1029,20 +1021,20 @@ static int imx214_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&imx214->sd.entity, 1, &imx214->pad);
 	if (ret < 0) {
-		dev_err(dev, "could not register media entity\n");
+		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto free_ctrl;
 	}
 
 	imx214->sd.state_lock = imx214->ctrls.lock;
 	ret = v4l2_subdev_init_finalize(&imx214->sd);
 	if (ret < 0) {
-		dev_err(dev, "subdev init error: %d\n", ret);
+		dev_err_probe(dev, ret, "subdev init error\n");
 		goto free_entity;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
-		dev_err(dev, "could not register v4l2 device\n");
+		dev_err_probe(dev, ret, "failed to register sensor sub-device\n");
 		goto error_subdev_cleanup;
 	}
 

-- 
2.46.0



