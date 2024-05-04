Return-Path: <linux-media+bounces-10772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EB8BBD3E
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 18:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8051F2156B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 16:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CF56AFB6;
	Sat,  4 May 2024 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb39St9m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295B5DF1C;
	Sat,  4 May 2024 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840916; cv=none; b=cEBUdC/4KBKLh8W6t0psvSIwv3EdSQN+j/uIfgPxPmlVMsUNjCWYY0KjoEf14ibirYJUGP93idjo5TQDEx0leL+YzdQE88FfIqMI+HInIKienQ24tAdRxb8IvwaXLCzbVM/q/kNt4+5gppwtB7jqJL15HRh4DkBe6s7c4UkI1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840916; c=relaxed/simple;
	bh=nd8auf1E030iZxwEK18x3hBgOLwMWvigSUGa0hBYSXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fav5udRmlSclNk5JJ9MjqpuO9c5y9vKNRDYDL3C3VVsbDs1pQeOgP1cTcXffObsDRys09bcfoOkeJXRQauN2uaJHhQQ4chJf2u/OGY+4XqOi2K1aDxdAAAAOvRp4e6tqMEmn/Z6x7hYHyceXoKux2PbSIc2qPEaR17scBWOotZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb39St9m; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so8484751fa.2;
        Sat, 04 May 2024 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714840912; x=1715445712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvuBElpLIjGxzjO7db7ym6Relup8kmUL2RNSIZ6gPx8=;
        b=Yb39St9m9ZiaERYWls3QqX0av6bjjpy0+uX56muH813yN8HUvmMzY4RCRy4YU+QIZO
         TZbp4JMVx66PYll9bqBGBWSvEcSV2Nu7bjjJ/rp7Lmjv2OCV3XLU2Kz2XEyYpKWgkNjJ
         WKEW/l4TtRAyLUvI3DsfFmKUf7mry4J1C3YwPA0TU6U6DraOBkeYTd8TsBPyPtuL4UZq
         T4/k/W+ZPbAIzbXMboyzO1XFEZJr2XhkYPwJw0wb5zTHD3brEQYWDuas3KVDKcQk0TKX
         F6wa5c6qbpe+8IDygDnW8gqD5JVeGlZ8ByTwl+10ccaDQdR5kVAFkM9IXuJAKdzwzSx+
         w9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714840912; x=1715445712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvuBElpLIjGxzjO7db7ym6Relup8kmUL2RNSIZ6gPx8=;
        b=gUsyN4dqF81SSb3cMShkId32A4poLGXtLLA8xUKq0RjcBfyKYjB1cG9kssQAAAO+PQ
         bJRz/GfsAJya4IneBkaGkzYTfTxollQ7sGqxYjdGGQXsq7EwYaVLo/pCjkIFokLEOxh3
         FWUM+s14xCKr0zxlFSG/ZthWy+PGnIxxdm1ctxQxFqV78PG9z5jJTddR7bNQ6aIgCVsY
         dTxfynlOYlxqdIEqtJ8ehcrQDt/eqpfXb2pJq50+DNrgg08VFm8sf4aLMZgXMkh+UJbD
         PhAazu5C++IPYahFzR0oNE871V+whuDrGpv9GMYd7RPZzLG72badJY9luTOVrRtFL7mg
         hQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnDh4P0fm4O7/byMS5ML3yorOwPdEU6Ii10J7Q6eSmKNrJG40SgJsTYQP5iAQVKcxCA3pt8PnYwtJPnJlnFr3D8O4yPGpE/3L1AhhK9+qyepsYktDqMRSkPjNxAFZSQKkZTHtz4zH9FVh19PaMtMWzksIDxaozV5PmIhzFlobRw8qNW1L/
X-Gm-Message-State: AOJu0Yw5OtqeZe1muhEHcyJbMYc0rurXc9pWkviiNvpUquAmJzYBUpRI
	SDbFjkeF2mPKNDKqskmnP5jQwRksy2yCnI4eVS9r3wpN0VQV6kM9RBh7ibkL
X-Google-Smtp-Source: AGHT+IEocSmjq4X37cUz6nwR7vn6BOdcVpC0zCot1/iG18BC37v1gjN+YjXW0tR++phm4L3LJFvPZA==
X-Received: by 2002:ac2:5105:0:b0:51f:c112:9d67 with SMTP id q5-20020ac25105000000b0051fc1129d67mr2590494lfb.51.1714840912404;
        Sat, 04 May 2024 09:41:52 -0700 (PDT)
Received: from localhost.localdomain ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id q14-20020ac246ee000000b0051d2075cacbsm938267lfo.82.2024.05.04.09.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 09:41:52 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v3 2/2] media: gc2145: implement basic dvp bus support
Date: Sat,  4 May 2024 19:41:15 +0300
Message-ID: <20240504164115.64603-3-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
References: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That was tested on PinePhone with libcamera-based GNOME
screenshot (45.2).

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 drivers/media/i2c/gc2145.c | 112 ++++++++++++++++++++++++++++---------
 1 file changed, 86 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index bef7b0e056a8..9808bd0ab6ae 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -39,6 +39,10 @@
 #define GC2145_REG_ANALOG_MODE1	CCI_REG8(0x17)
 #define GC2145_REG_OUTPUT_FMT	CCI_REG8(0x84)
 #define GC2145_REG_SYNC_MODE	CCI_REG8(0x86)
+#define GC2145_SYNC_MODE_VSYNC_POL	BIT(0)
+#define GC2145_SYNC_MODE_HSYNC_POL	BIT(1)
+#define GC2145_SYNC_MODE_OPCLK_POL	BIT(2)
+#define GC2145_SYNC_MODE_OPCLK_GATE	BIT(3)
 #define GC2145_SYNC_MODE_COL_SWITCH	BIT(4)
 #define GC2145_SYNC_MODE_ROW_SWITCH	BIT(5)
 #define GC2145_REG_BYPASS_MODE	CCI_REG8(0x89)
@@ -598,6 +602,7 @@ struct gc2145 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
+	struct v4l2_fwnode_endpoint ep; /* the parsed DT endpoint info */
 	struct regmap *regmap;
 	struct clk *xclk;
 
@@ -773,6 +778,36 @@ static int gc2145_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int gc2145_config_dvp_mode(struct gc2145 *gc2145,
+				  const struct gc2145_format *gc2145_format)
+{
+	int ret = 0;
+	u64 sync_mode;
+	int flags = gc2145->ep.bus.parallel.flags;
+
+	ret = cci_read(gc2145->regmap, GC2145_REG_SYNC_MODE, &sync_mode, NULL);
+	if (ret)
+		return ret;
+
+	sync_mode &= ~(GC2145_SYNC_MODE_VSYNC_POL |
+		       GC2145_SYNC_MODE_HSYNC_POL |
+		       GC2145_SYNC_MODE_OPCLK_POL);
+
+	if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+		sync_mode |= GC2145_SYNC_MODE_VSYNC_POL;
+
+	if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+		sync_mode |= GC2145_SYNC_MODE_HSYNC_POL;
+
+	if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
+		sync_mode |= GC2145_SYNC_MODE_OPCLK_POL;
+
+	cci_write(gc2145->regmap, GC2145_REG_SYNC_MODE, sync_mode, &ret);
+	cci_write(gc2145->regmap, GC2145_REG_PAD_IO, 0x0f, &ret);
+
+	return ret;
+}
+
 static const struct cci_reg_sequence gc2145_common_mipi_regs[] = {
 	{GC2145_REG_PAGE_SELECT, 0x03},
 	{GC2145_REG_DPHY_ANALOG_MODE1, GC2145_DPHY_MODE_PHY_CLK_EN |
@@ -895,10 +930,13 @@ static int gc2145_start_streaming(struct gc2145 *gc2145,
 		goto err_rpm_put;
 	}
 
-	/* Perform MIPI specific configuration */
-	ret = gc2145_config_mipi_mode(gc2145, gc2145_format);
+	/* Perform interface specific configuration */
+	if (gc2145->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+		ret = gc2145_config_mipi_mode(gc2145, gc2145_format);
+	else
+		ret = gc2145_config_dvp_mode(gc2145, gc2145_format);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to write mipi conf\n",
+		dev_err(&client->dev, "%s failed to write interface conf\n",
 			__func__);
 		goto err_rpm_put;
 	}
@@ -924,6 +962,9 @@ static void gc2145_stop_streaming(struct gc2145 *gc2145)
 			GC2145_CSI2_MODE_EN | GC2145_CSI2_MODE_MIPI_EN, 0,
 			&ret);
 	cci_write(gc2145->regmap, GC2145_REG_PAGE_SELECT, 0x00, &ret);
+
+	/* Disable dvp streaming */
+	cci_write(gc2145->regmap, GC2145_REG_PAD_IO, 0x00, &ret);
 	if (ret)
 		dev_err(&client->dev, "%s failed to write regs\n", __func__);
 
@@ -1233,9 +1274,8 @@ static int gc2145_init_controls(struct gc2145 *gc2145)
 static int gc2145_check_hwcfg(struct device *dev)
 {
 	struct fwnode_handle *endpoint;
-	struct v4l2_fwnode_endpoint ep_cfg = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY
-	};
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc2145 *gc2145 = to_gc2145(sd);
 	int ret;
 
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
@@ -1244,36 +1284,55 @@ static int gc2145_check_hwcfg(struct device *dev)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
+	gc2145->ep.bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &gc2145->ep);
+	if (ret) {
+		gc2145->ep.bus_type = V4L2_MBUS_PARALLEL;
+		ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &gc2145->ep);
+	}
 	fwnode_handle_put(endpoint);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "could not parse endpoint\n");
 		return ret;
-
-	/* Check the number of MIPI CSI2 data lanes */
-	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
-		dev_err(dev, "only 2 data lanes are currently supported\n");
-		ret = -EINVAL;
-		goto out;
 	}
 
-	/* Check the link frequency set in device tree */
-	if (!ep_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "link-frequency property not found in DT\n");
+	switch (gc2145->ep.bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
+		/* Check the number of MIPI CSI2 data lanes */
+		if (gc2145->ep.bus.mipi_csi2.num_data_lanes != 2) {
+			dev_err(dev, "only 2 data lanes are currently supported\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* Check the link frequency set in device tree */
+		if (!gc2145->ep.nr_of_link_frequencies) {
+			dev_err(dev, "link-frequencies property not found in DT\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (gc2145->ep.nr_of_link_frequencies != 3 ||
+		    gc2145->ep.link_frequencies[0] != GC2145_640_480_LINKFREQ ||
+		    gc2145->ep.link_frequencies[1] != GC2145_1280_720_LINKFREQ ||
+		    gc2145->ep.link_frequencies[2] != GC2145_1600_1200_LINKFREQ) {
+			dev_err(dev, "Invalid link-frequencies provided\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		break;
+	case V4L2_MBUS_PARALLEL:
+		break;
+	default:
+		dev_err(dev, "unsupported bus type %u\n", gc2145->ep.bus_type);
 		ret = -EINVAL;
 		goto out;
 	}
 
-	if (ep_cfg.nr_of_link_frequencies != 3 ||
-	    ep_cfg.link_frequencies[0] != GC2145_640_480_LINKFREQ ||
-	    ep_cfg.link_frequencies[1] != GC2145_1280_720_LINKFREQ ||
-	    ep_cfg.link_frequencies[2] != GC2145_1600_1200_LINKFREQ) {
-		dev_err(dev, "Invalid link-frequencies provided\n");
-		ret = -EINVAL;
-	}
+	return 0;
 
 out:
-	v4l2_fwnode_endpoint_free(&ep_cfg);
-
+	v4l2_fwnode_endpoint_free(&gc2145->ep);
 	return ret;
 }
 
@@ -1421,6 +1480,7 @@ static void gc2145_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		gc2145_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_fwnode_endpoint_free(&gc2145->ep);
 }
 
 static const struct of_device_id gc2145_dt_ids[] = {
-- 
2.43.0


