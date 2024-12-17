Return-Path: <linux-media+bounces-23656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E979F58DF
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DD5E7A3D40
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E45D1FBC8B;
	Tue, 17 Dec 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+NXYLBt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85261F9F6F;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471563; cv=none; b=UrdMcS24O2x1HUTVRqlkSXLeVxe/Z53ALHoMjAXnaD2CDja8I4TBy5mdPOojB6/EwLiixlKSZjFF9g+y+bGG6Ix+0aHAc927MhyGp8RqFm1sLukzeL8QKgOKhxxGu8leyIlJjP5YeG0u2mTYNQS+KqPhlc8znGNzz97EBm32Deo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471563; c=relaxed/simple;
	bh=Ld7YTXvBxZPDIj+jtmVBVzOpYRHENGO3HL8vAxNnog4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HsbHFG/opVR61jkNOA6nOKdzo2EMezHKsjuyCRwZUUIN6nZY2XF3Q7xXHCCjKL2lKWAdce6A1u2iishUguj8b8kRW0O9DHe0aiSW53DkfMp47C8eBWdviVb0hONe6BhoZSCVvOgyjAs789npXXUkXEX7bbozZX6YUsNpBycYCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+NXYLBt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72265C4CEEA;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471563;
	bh=Ld7YTXvBxZPDIj+jtmVBVzOpYRHENGO3HL8vAxNnog4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z+NXYLBtlSRA8DoDB8PM3dM3vXU4Z7MbS+p1SNn9nT7gm+0xmSsH7mRLyuWTJXhOX
	 V1h4veRUcHqnFkekQ9zZGhw8i80e2SaEpoWqSrVFyjIc+TF2VmNinuj1/jCfA38wvJ
	 HosHdksJsTPQO+ljGS+V4cgVfHWUADZADnG62EK5TRGk/dyuRdXjU9wqFYREud0QRp
	 svfpQk7qFUQHzLBC1rgjTy0o0CFFGWVOfvnN4iVvoCfIO5op18ctD/mrgtGG1C2ho0
	 todJaW7qxGNOh3Rw/q9zyLxlq7j4jZV4FLM8kHQel8KIhZAgT03w9glaC4+biYU3Im
	 LaLaovsQJQUNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662DAE77184;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 17 Dec 2024 22:39:18 +0100
Subject: [PATCH v5 06/13] media: i2c: imx214: Check number of lanes from
 device tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-imx214-v5-6-387f52adef4d@apitzsch.eu>
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=2286;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=kGBTGQW3yjp+KF2H7SRL1ipKMVJ3Z0zLTnYkR0YvOEk=;
 b=Qgm7rqRfRVxSEOVY0uH4SAuseMbAkofrQ+QOW0y2XqCu8SyH3pb1Ow5LNG0hseyiXMpKhkNtr
 uL6bo9HwD8cDhILhYgmfWVe7YrffPefPrKGqVn1EY+5YODySIYNHKNb
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

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4e9a8e0e2c5f2ac3fd72be06906979dcd3aaa2a4..4f6c4f845a7ab36c7674a4ce8c1664d48e46c4d0 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -197,7 +197,6 @@ struct imx214 {
 
 /*From imx214_mode_tbls.h*/
 static const struct cci_reg_sequence mode_4096x2304[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -270,7 +269,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 };
 
 static const struct cci_reg_sequence mode_1920x1080[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -787,6 +785,13 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
+			IMX214_CSI_4_LANE_MODE, NULL);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure lanes\n");
+		return ret;
+	}
+
 	state = v4l2_subdev_get_locked_active_state(&imx214->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
 	mode = v4l2_find_nearest_size(imx214_modes, ARRAY_SIZE(imx214_modes),
@@ -951,6 +956,13 @@ static int imx214_parse_fwnode(struct device *dev)
 		goto done;
 	}
 
+	/* Check the number of MIPI CSI2 data lanes */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "only 4 data lanes are currently supported\n");
+		goto done;
+	}
+
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
 			break;

-- 
2.47.1



