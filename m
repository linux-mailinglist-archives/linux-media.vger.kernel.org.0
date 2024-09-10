Return-Path: <linux-media+bounces-18095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FF973E1F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256C51C2534F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0491A4E6B;
	Tue, 10 Sep 2024 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diT24a0Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C961A3BD3;
	Tue, 10 Sep 2024 17:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987987; cv=none; b=acOuCgJJPe9UZ5xPf4dxhYmNKlr04JmqxJtD9Z9SWlUCGmwxUDk2sB+oUeDBE4dQXAlUXzOEXWzdCKdeh+8OZZ9VY1izOciwbBpy/OzzfqARWanYPAln/eeIDBc756LSFHcBkg1+BEkR6XxNFTtNuAFHb4AjWhgqbGwDiViFg3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987987; c=relaxed/simple;
	bh=Zx3pVc2b4AnAFqjVntb6HlOm0c6VIoOxfvWt+DeZo3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=odw1sGM4tMECNeycRbpvblWeqWiNW5NL7YCiiIVYprGG8Fia8z96aif40rbO7WuEVzw5SrAhTcKjRJcaR3t3/NJGhALLmfjITrML14R4RBpoQzDTmDVIXNIPT8++wA5AaD5r3AS6/yy9CBmC+AjrLzrUh5r/oSzoRDpS4zaBnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diT24a0Z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53661a131b4so4031046e87.1;
        Tue, 10 Sep 2024 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987982; x=1726592782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UAP/rOntP4qOrF9+5G6CAAVYJ5+O5YrbzDGPOIRXPU=;
        b=diT24a0Z9xl1SxnA4fzIJI17NiS57HtVZy6XKNotC8nRr0FU6E9KH0sWzfauxCI5Ru
         Gv8oLmrEOvWNAxmeR8JrN058VWbRb8YvCRGQv60NlkcWE/d+QxNIZ2m8yWRLkS6xo/QN
         n/+m8FtDXLN0/W+NAOso+S1eMOGlp1WJ2+zDeTA+nQO09qe+ywA8AixwY3/c58HHbrNt
         DWFm9Jar2ANI+vQIM+057MgaDU3yegcIiqEWCveobBt7ttU2+vYGScuP2d55HoEtp9EI
         H5LeoAt21dhKFlumkUccBa4gwR1o0fKW4vMmXk5uqsHKuh9A2a/dsD4m4D8Mr/2kRkcB
         PaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987982; x=1726592782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UAP/rOntP4qOrF9+5G6CAAVYJ5+O5YrbzDGPOIRXPU=;
        b=SyAR2SlUdJGDthTo+JpAjCPblt5Y/6Q1leAjGjngIFk6u6TR5j4hZ7tQqiEAJF+nIm
         lOIh69TpCC2IQFYamNtcftHRHoCZfg7Y97uqaxubH0kZkocExvHCb+JcKHSZG+JuEJ7E
         vbDuS68Z8fL8kJU8ap6JZNLBFK350PAbtig4OLSBjfYcse/4V6cbJDqDaO8R5PvlA/Il
         Z5sjmscOrEKDSBuQgp0Ch8JJdSOM7zoEXoaWmwCc1m80Pt0sL7EhzzN22sIoK92LNdBj
         7ZoZboF7dymsx9eDBHqb2fomwIb5weXxVkrfnVt5ykPse8tLoKzgVtmsEOnNkwNy+vC+
         kIlw==
X-Forwarded-Encrypted: i=1; AJvYcCVPyqdOFC1Ua7AdGVPlRwCipXCv4Ci3sak9LH+mRV36BqK7fPP8bYouUoV6b6wTS6cE8AefKLd8UvAOxyl0hiEGPu8=@vger.kernel.org, AJvYcCVoYdbmlfBxhZtlSJjaLcpaTm5ifVzGqfRyGyX3ec8iL4Ieph4+Zrh45T/YgzSrdusslCqNkthmuigTRiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIV6iY7ewyyVBZmq/B9Ozpc/LoeB/P6B5Ne6UTnvb9Dc9KwL78
	rbX8zjAg1hrRpszzdEmIFr9Xv2PKOG6VtCzaXaEfsbUd8eopVKS2
X-Google-Smtp-Source: AGHT+IGmShqFyHM8JrfCwRA8tVcctYpiWEFyfpNyqpdz5qs5PVm2XykcOyIlUyrpFRk3fyie5spYMQ==
X-Received: by 2002:a05:6512:3b2a:b0:530:aa82:a50a with SMTP id 2adb3069b0e04-536587fc670mr9344826e87.45.1725987982070;
        Tue, 10 Sep 2024 10:06:22 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 04/11] media: i2c: ov5645: Use dev_err_probe instead of dev_err
Date: Tue, 10 Sep 2024 18:06:03 +0100
Message-Id: <20240910170610.226189-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


