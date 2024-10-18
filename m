Return-Path: <linux-media+bounces-19893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03039A4278
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FF11F21B76
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6CD2036F8;
	Fri, 18 Oct 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwGEXr6I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC99202F65;
	Fri, 18 Oct 2024 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265580; cv=none; b=lEIQElKpuck23r3psiy6LAXrcDA3nWbOVysKc2k8QoYw35Hd7UqqE2uFu7/WlND7AQ+Bc8y382Tb4K5WFT2r/a+giyKX/WaeGA65XwjVvTk4cyDR8lcnZAQC9IBWUYVuPCq58kJjEQt+kNuQtIEq1j852gC73nvROlHQi+G/FuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265580; c=relaxed/simple;
	bh=yrWF35/dNMc72YT4zMmLUT+3bTaQVxAD7kA1YsWeC2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dq0GmyLM5qKGadlFd9N4zX7yKupbkjhCGwXQMEkbFAueNg9pJdYf2jZX0HamJgGx7nv/F/o5Bbxw/4IcGa72xJhgth7Lyf6yXKncpUmEMT/H61bKO8hed91dQcjcqa8yemqFkPLYlpvIT0iOVf9HlNKmkv8gDcfemZeLp4VvHdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwGEXr6I; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431195c3538so20466755e9.3;
        Fri, 18 Oct 2024 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265577; x=1729870377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ak7qQZDlmR6GF+E90WUPjFiNANs7N2Lm3Ygdr+BPMw=;
        b=CwGEXr6IfJmChM4VYCfM+5L5FUiUCKIHJbaekobhAdLyQ6nY2tjPnzkcjZQG9toaqP
         l0PNIdWKZo/ZWhraEj138UG599p3khi6cPY+l+oqIXzkfrsbSHuuPoBywWWsoVEIfJr2
         z6UyUjKyraRP6XC2bzgDYGaU8PefHGiCoi8iF6udBmW5GgK/gIao5xh+y+98ho7L0Q82
         3hr++PjibB9sFCKdLDkGtlQ8hM3IVhBIRqBU3HlFpPC8xWikXKkJShPi3UztUMNskhul
         OA8Ibkr6Vg7zglHpf9X8vJqtSTuIeetplXqtKilJDSMCRSH7lczzHqZr1C8/roaGFM7s
         3MrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265577; x=1729870377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ak7qQZDlmR6GF+E90WUPjFiNANs7N2Lm3Ygdr+BPMw=;
        b=U0Ij60MM/gIovfeEvS3r9BRDL/5k+5ec4vuai+qPn6+5m+ZMKvMm6BCv0o0LjV1TmB
         dEtYIKcCkef3AcJfiNpflHZRHrY/EykbSFoKoaYCouA4Rsa7gx8kTxa2L4ktiodpJIrp
         1ze8PJ+kzczMoRip6sw0ILbvF3gG58YQJhcdLaPA0PX5IT60UDQu7FB/Mp6FtGJzi/JG
         QCFh9u0SWY932Xn4KIWzC2TXrHQRW/pI/6BlqbiqQ1vHuFsBykkI97Vp88V2Gh9qWauV
         fQXpgaTqgnmUrRSw9/PytPaG583jcsXOjZrAY/Ig5Z27hsAm07npyt//NLeFUaR48yRx
         8Nuw==
X-Forwarded-Encrypted: i=1; AJvYcCV9YoQ2miZ1rSjQk2vaBiRvQH43VroQ/9RyCXft7IEKYfui3aEhvbC1mLlFGjZo6mh0WJZfv7lpx5CxMtJE2OzEBbc=@vger.kernel.org, AJvYcCWXBY6CU+wfOFC8+0LWhx7HB5kbuIpGJ9lBHahM4FyxoEEKIiARajDCSOpmLsvfracaaCL1RD99jopL3EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAy/G4HwTZhMHgqQ3oS3yTe7dHpNiFAAvx9VX4u9kyfseoQR5
	am4jwThsTVzjKnMS0E+W6d8so9q7AueyLJz+LnwmW1Dai3kWtR5G
X-Google-Smtp-Source: AGHT+IGTztyZ7k4VkLcrKyOaLL44YU5/0TpXGy6jus3jHNKK3D4bPW9rPFFCA7n+icPBZO/XTsoMRA==
X-Received: by 2002:a05:600c:458e:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-43161647f5dmr19656895e9.19.1729265576377;
        Fri, 18 Oct 2024 08:32:56 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 03/10] media: i2c: ov5645: Replace dev_err with dev_err_probe in probe function
Date: Fri, 18 Oct 2024 16:32:23 +0100
Message-ID: <20241018153230.235647-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor error handling in the ov5645_probe() function by replacing
multiple dev_err() calls with dev_err_probe().

- Note that during this process, the error string "external clock
  frequency %u is not supported" was replaced with "unsupported xclk
  frequency %u" to ensure it wraps at 80 columns.
- Additionally, the error string for control initialization failure was
  changed from "%s: control initialization error %d\n" to "failed to add
  controls\n" as there is no need to print the function name and error code
  in the string, since dev_err_probe() already provides this information.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 82 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index d344d3447a95..520afd3d2aa3 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1076,51 +1076,44 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->dev = dev;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (!endpoint) {
-		dev_err(dev, "endpoint node not found\n");
-		return -EINVAL;
-	}
+	if (!endpoint)
+		return dev_err_probe(dev, -EINVAL,
+				     "endpoint node not found\n");
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
 					 &ov5645->ep);
 
 	of_node_put(endpoint);
 
-	if (ret < 0) {
-		dev_err(dev, "parsing endpoint node failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "parsing endpoint node failed\n");
 
-	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "invalid bus type, must be CSI2\n");
-		return -EINVAL;
-	}
+	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid bus type, must be CSI2\n");
 
 	/* get system clock (xclk) */
 	ov5645->xclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ov5645->xclk)) {
-		dev_err(dev, "could not get xclk");
-		return PTR_ERR(ov5645->xclk);
-	}
+	if (IS_ERR(ov5645->xclk))
+		return dev_err_probe(dev, PTR_ERR(ov5645->xclk),
+				     "could not get xclk");
 
 	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not get xclk frequency\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not get xclk frequency\n");
 
 	/* external clock must be 24MHz, allow 1% tolerance */
-	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
-		dev_err(dev, "external clock frequency %u is not supported\n",
-			xclk_freq);
-		return -EINVAL;
-	}
+	if (xclk_freq < 23760000 || xclk_freq > 24240000)
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported xclk frequency %u\n",
+				     xclk_freq);
 
 	ret = clk_set_rate(ov5645->xclk, xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not set xclk frequency\n");
 
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
 		ov5645->supplies[i].supply = ov5645_supply_name[i];
@@ -1131,16 +1124,14 @@ static int ov5645_probe(struct i2c_client *client)
 		return ret;
 
 	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
-	if (IS_ERR(ov5645->enable_gpio)) {
-		dev_err(dev, "cannot get enable gpio\n");
-		return PTR_ERR(ov5645->enable_gpio);
-	}
+	if (IS_ERR(ov5645->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio),
+				     "cannot get enable gpio\n");
 
 	ov5645->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ov5645->rst_gpio)) {
-		dev_err(dev, "cannot get reset gpio\n");
-		return PTR_ERR(ov5645->rst_gpio);
-	}
+	if (IS_ERR(ov5645->rst_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio),
+				     "cannot get reset gpio\n");
 
 	mutex_init(&ov5645->power_lock);
 
@@ -1177,9 +1168,8 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->sd.ctrl_handler = &ov5645->ctrls;
 
 	if (ov5645->ctrls.error) {
-		dev_err(dev, "%s: control initialization error %d\n",
-		       __func__, ov5645->ctrls.error);
 		ret = ov5645->ctrls.error;
+		dev_err_probe(dev, ret, "failed to add controls\n");
 		goto free_ctrl;
 	}
 
@@ -1193,7 +1183,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
 	if (ret < 0) {
-		dev_err(dev, "could not register media entity\n");
+		dev_err_probe(dev, ret, "could not register media entity\n");
 		goto free_ctrl;
 	}
 
@@ -1203,14 +1193,14 @@ static int ov5645_probe(struct i2c_client *client)
 
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
 
@@ -1219,24 +1209,24 @@ static int ov5645_probe(struct i2c_client *client)
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
 
@@ -1248,7 +1238,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev(&ov5645->sd);
 	if (ret < 0) {
-		dev_err(dev, "could not register v4l2 device\n");
+		dev_err_probe(dev, ret, "could not register v4l2 device\n");
 		goto err_pm_runtime;
 	}
 
-- 
2.43.0


