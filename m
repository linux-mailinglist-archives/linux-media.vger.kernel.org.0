Return-Path: <linux-media+bounces-17624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9D96C932
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3912A1C24EDC
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED57F18454D;
	Wed,  4 Sep 2024 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbohhZ1r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E01916F839;
	Wed,  4 Sep 2024 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484071; cv=none; b=HvbkALoWuEU1Xd4VItwuGt54DIks/5p/xyJC5SGQXai3a4E7cHD1DD2R3tGftj/Dy3T1LG8FBav36R6Vb2NtaVbcH6WUGY9jzhZA1WqIEOQz7AR9sEycNd0mr6o0VgETKweZCFvTySoJF/xbpQOqQaSuPK/ZHSE5ES7alv+QjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484071; c=relaxed/simple;
	bh=Zx3pVc2b4AnAFqjVntb6HlOm0c6VIoOxfvWt+DeZo3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kx9OJN7QDC5pkdSlq/39itmDbrvebs7UccvtTQfwlQZE0P96GxG9yZBw47yh7iWOxpxTfrFAgYZpIhTXGGgYUJ0qk0Tb9FFqwJHwGgaVgiSev6dB17q/QZXe0zW5XgCM0liEo47WuaQwAzYem5PD2TM14Q+6Y2kbugDGpZoPCL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbohhZ1r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42c7856ed66so39626555e9.3;
        Wed, 04 Sep 2024 14:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484068; x=1726088868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UAP/rOntP4qOrF9+5G6CAAVYJ5+O5YrbzDGPOIRXPU=;
        b=YbohhZ1rr9CeANvE8D3oMDJJHZqcZMAu7ESoLX6ydDM8DmKGYNSjr3zZft74B7dh02
         Y3PVUJXqLQkPEYU//+pLMpy2dfkaaS7PlGF0kL3kaA39aEKfPneMOsBLwPxfUu1cEZ03
         tep1zQ8mBB0+8Qr6lg+oQ5gbmhTLFJoq4W+ADPTCscMWSGL6YCeOpuA7bo0CXoywiOk6
         a9YIOLHO96f235G2oNNgcsav9vYLmkcXAnrRsTYf8V7y//jGpnSecWxVFATagiFha5/2
         eIgak5P8cAXoM5erkz5vi7RZ99rmghncmREmUVZlE3+LHOJ7YDiTPmnH/dB/AiHZZAKA
         UHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484068; x=1726088868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UAP/rOntP4qOrF9+5G6CAAVYJ5+O5YrbzDGPOIRXPU=;
        b=bX3MVInWV0dLltCtRnRBL4phBS8i5QGJwtZ5Xt2fQjm0FWJw07xDGIxot7Sm8lu019
         H3WEsTztl9oxJN5BOiEx/aN7ClI8twDMdRBVRzm1xxwzcCG/y7RiFXAp9zjwvjxqujPI
         poDDR/yoebUhED/DE0vRhDl+Q60MgewaRHuZ4OxxdWaUrbBVtNw0VZbpmmTpaDJd5XKU
         5mdf6tLJDDfiYV7r1BzMocJFSYR3nDt9EBfDFeGobAydkE7uHg4lVsl2/IdxdCYEgYBb
         cp25/PaR1FSCipWUv7W0GiKWRsWrgfp1EEfnmAO7y3LOEae8oycQjaRfgG2Ki1Hn+1JQ
         ptJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0pt+Tmhj4xCXM/mDozodbJQYUs+uTbN2zw68LrdkhsePmOzuJIUrdCyQ8Y8OBA+Z6Bu4XrkzmAi9A06A=@vger.kernel.org, AJvYcCVuX/quDrn5awgI1i3ISmfzBya2hEwGQB3z2m4ml8pGK/c8qfQjBYDt+6TJSy5HrXEJlQFBssFnEbQ5q9yWfMJdOvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+xGQ8Ya4UfDdBnZV8Vw/z3pRtkn3bnra65gwEX3I5S76SZlb
	oS3PsPrLkyhOhdtxcTmCxxCihzohiGrzpKWhtsZ3bs0qYBeaSRfH
X-Google-Smtp-Source: AGHT+IHx1plvaNYUp7UTL7Mk4GJERbS7EP/coTqNDtFuvopxMzHj3TstBPxHvkbwbgLbXXjqiWKFeg==
X-Received: by 2002:a05:600c:4685:b0:428:150e:4f13 with SMTP id 5b1f17b1804b1-42bb27bc4cbmr146300705e9.33.1725484067747;
        Wed, 04 Sep 2024 14:07:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 04/12] media: i2c: ov5645: Use dev_err_probe instead of dev_err
Date: Wed,  4 Sep 2024 22:07:11 +0100
Message-Id: <20240904210719.52466-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop dev_err() and use the dev_err_probe() helper on probe path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 74 +++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 78b86438c798..9e6ff1f1b9ac 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1076,51 +1076,37 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->dev = dev;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (!endpoint) {
-		dev_err(dev, "endpoint node not found\n");
-		return -EINVAL;
-	}
+	if (!endpoint)
+		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
 					 &ov5645->ep);
 
 	of_node_put(endpoint);
 
-	if (ret < 0) {
-		dev_err(dev, "parsing endpoint node failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "parsing endpoint node failed\n");
 
-	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "invalid bus type, must be CSI2\n");
-		return -EINVAL;
-	}
+	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
+		return dev_err_probe(dev, -EINVAL, "invalid bus type, must be CSI2\n");
 
 	/* get system clock (xclk) */
 	ov5645->xclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ov5645->xclk)) {
-		dev_err(dev, "could not get xclk");
-		return PTR_ERR(ov5645->xclk);
-	}
+	if (IS_ERR(ov5645->xclk))
+		return dev_err_probe(dev, PTR_ERR(ov5645->xclk), "could not get xclk");
 
 	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not get xclk frequency\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "could not get xclk frequency\n");
 
 	/* external clock must be 24MHz, allow 1% tolerance */
-	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
-		dev_err(dev, "external clock frequency %u is not supported\n",
-			xclk_freq);
-		return -EINVAL;
-	}
+	if (xclk_freq < 23760000 || xclk_freq > 24240000)
+		return dev_err_probe(dev, -EINVAL, "external clock frequency %u is not supported\n",
+				     xclk_freq);
 
 	ret = clk_set_rate(ov5645->xclk, xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "could not set xclk frequency\n");
 
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
 		ov5645->supplies[i].supply = ov5645_supply_name[i];
@@ -1131,16 +1117,12 @@ static int ov5645_probe(struct i2c_client *client)
 		return ret;
 
 	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
-	if (IS_ERR(ov5645->enable_gpio)) {
-		dev_err(dev, "cannot get enable gpio\n");
-		return PTR_ERR(ov5645->enable_gpio);
-	}
+	if (IS_ERR(ov5645->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio), "cannot get enable gpio\n");
 
 	ov5645->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ov5645->rst_gpio)) {
-		dev_err(dev, "cannot get reset gpio\n");
-		return PTR_ERR(ov5645->rst_gpio);
-	}
+	if (IS_ERR(ov5645->rst_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio), "cannot get reset gpio\n");
 
 	mutex_init(&ov5645->power_lock);
 
@@ -1177,9 +1159,9 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->sd.ctrl_handler = &ov5645->ctrls;
 
 	if (ov5645->ctrls.error) {
-		dev_err(dev, "%s: control initialization error %d\n",
-		       __func__, ov5645->ctrls.error);
 		ret = ov5645->ctrls.error;
+		dev_err_probe(dev, ret, "%s: control initialization error %d\n",
+			      __func__, ov5645->ctrls.error);
 		goto free_ctrl;
 	}
 
@@ -1192,7 +1174,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
 	if (ret < 0) {
-		dev_err(dev, "could not register media entity\n");
+		dev_err_probe(dev, ret, "could not register media entity\n");
 		goto free_ctrl;
 	}
 
@@ -1202,14 +1184,14 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_HIGH, &chip_id_high);
 	if (ret < 0 || chip_id_high != OV5645_CHIP_ID_HIGH_BYTE) {
-		dev_err(dev, "could not read ID high\n");
 		ret = -ENODEV;
+		dev_err_probe(dev, ret, "could not read ID high\n");
 		goto power_down;
 	}
 	ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_LOW, &chip_id_low);
 	if (ret < 0 || chip_id_low != OV5645_CHIP_ID_LOW_BYTE) {
-		dev_err(dev, "could not read ID low\n");
 		ret = -ENODEV;
+		dev_err_probe(dev, ret, "could not read ID low\n");
 		goto power_down;
 	}
 
@@ -1218,24 +1200,24 @@ static int ov5645_probe(struct i2c_client *client)
 	ret = ov5645_read_reg(ov5645, OV5645_AEC_PK_MANUAL,
 			      &ov5645->aec_pk_manual);
 	if (ret < 0) {
-		dev_err(dev, "could not read AEC/AGC mode\n");
 		ret = -ENODEV;
+		dev_err_probe(dev, ret, "could not read AEC/AGC mode\n");
 		goto power_down;
 	}
 
 	ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG20,
 			      &ov5645->timing_tc_reg20);
 	if (ret < 0) {
-		dev_err(dev, "could not read vflip value\n");
 		ret = -ENODEV;
+		dev_err_probe(dev, ret, "could not read vflip value\n");
 		goto power_down;
 	}
 
 	ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG21,
 			      &ov5645->timing_tc_reg21);
 	if (ret < 0) {
-		dev_err(dev, "could not read hflip value\n");
 		ret = -ENODEV;
+		dev_err_probe(dev, ret, "could not read hflip value\n");
 		goto power_down;
 	}
 
@@ -1243,7 +1225,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev(&ov5645->sd);
 	if (ret < 0) {
-		dev_err(dev, "could not register v4l2 device\n");
+		dev_err_probe(dev, ret, "could not register v4l2 device\n");
 		goto power_down;
 	}
 
-- 
2.34.1


