Return-Path: <linux-media+bounces-19938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4029A5742
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B9C281C6E
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E410519AA46;
	Sun, 20 Oct 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nj3/vHV4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996631991AF;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462452; cv=none; b=k3P3l06hoKxxRSnlM047UAsreW7yVHcI6NYt24w2pUAsqIzvElzd3vwMvHyVsM2WrSdezzResV1ppSRq0zoCG590SODyVnyNz2HhYOit/w+X3z6R9wZbUdvVobiSCZc2llUyzlXFCreJJgbTcLjehdb1Q1ulvsgYObAX3VK/c6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462452; c=relaxed/simple;
	bh=z6YUXTxQxOlJqtYBRZspT//oAQ1nWbbRO1Qm40xIS2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9AYSu11nmaP0cpW/949hYYce+NyK+JslmOX4kwaOss7xcT+uedjThH3poa0cIUm7FFa2M3E42C1i50HZoqTKPKALEkyepPTZcErQfjVmy5g1LPRiRWbl6/ukFHihn5Kw0l1lX/Z/byYu4GjFxYQ9byqrMRLoylLoVqDRR21WLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nj3/vHV4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B01FC4CEF1;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462452;
	bh=z6YUXTxQxOlJqtYBRZspT//oAQ1nWbbRO1Qm40xIS2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nj3/vHV4Av+mKboN9yskiN6Z+60B+GAKNFajFTtL4Jsh69cY6LUifnYpALZ/0niBO
	 ir69/YyO5+kb09CQ8rqRFlfegqeU509Ys+CsedrAQZ5nsR0GT3sti7lau+q/Crhz1o
	 U0PYflOUOqXDU49KNZvmp109xICOfxl0ahhwQPQLpu2nO/bycJDtwh2JLME4d5fYL/
	 t21Fi0nc50fn/YQbOpHzxBjlaHpnOvwg+fgN9OEga3sf+GxFycwp/rzuth4+E8CU75
	 BfRek8hollQre1m7AQ+3bS8BdWlv6x9c5Tnsj8HjX2/4YfCpJXgzaTycJ6vBHBe89o
	 3XJL+R0hV9wUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4028D3C937;
	Sun, 20 Oct 2024 22:14:11 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 21 Oct 2024 00:13:27 +0200
Subject: [PATCH v2 07/13] media: i2c: imx214: Check number of lanes from
 device tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241021-imx214-v2-7-fbd23e99541e@apitzsch.eu>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=2978;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CBPDBnfB8DBiUcxll9P6I0H8kikZ+GlZj0ctfGMDhYE=;
 b=jJZEoSUE6ANmxYOiJY/K5XDWKlD6rnS7nx3pzhUZBzNWr6EKC6V6d4FkfE7d1WKz+VFhvqOo6
 RlkNKt27XWoAbQReJr9vxbMQw7/IXvcB3HfjMfE4yH1Pxh50Bks/w39
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The imx214 camera is capable of either two-lane or four-lane operation.

Currently only the four-lane mode is supported, as proper pixel rates
and link frequences for the two-lane mode are unknown.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 0c83149bcc3e3b833a087d26104eb7dfaafdf904..497baad616ad7374a92a3da2b7c1096b1d72a0c7 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -199,7 +199,6 @@ struct imx214 {
 
 /*From imx214_mode_tbls.h*/
 static const struct cci_reg_sequence mode_4096x2304[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -272,7 +271,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 };
 
 static const struct cci_reg_sequence mode_1920x1080[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -791,6 +789,13 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
+			IMX214_CSI_4_LANE_MODE, NULL);
+	if (ret) {
+		dev_err(imx214->dev, "%s failed to configure lanes\n", __func__);
+		return ret;
+	}
+
 	ret = cci_multi_reg_write(imx214->regmap, imx214->cur_mode->reg_table,
 				  imx214->cur_mode->num_of_regs, NULL);
 	if (ret < 0) {
@@ -932,7 +937,7 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
 				       imx214->supplies);
 }
 
-static int imx214_parse_fwnode(struct device *dev)
+static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 {
 	struct fwnode_handle *endpoint;
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -951,6 +956,13 @@ static int imx214_parse_fwnode(struct device *dev)
 		goto done;
 	}
 
+	/* Check the number of MIPI CSI2 data lanes */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		dev_err_probe(dev, -EINVAL,
+			      "only 4 data lanes are currently supported\n");
+		goto done;
+	}
+
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
 			break;
@@ -975,14 +987,14 @@ static int imx214_probe(struct i2c_client *client)
 	struct imx214 *imx214;
 	int ret;
 
-	ret = imx214_parse_fwnode(dev);
-	if (ret)
-		return ret;
-
 	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
 	if (!imx214)
 		return -ENOMEM;
 
+	ret = imx214_parse_fwnode(dev, imx214);
+	if (ret)
+		return ret;
+
 	imx214->dev = dev;
 
 	imx214->xclk = devm_clk_get(dev, NULL);

-- 
2.47.0



