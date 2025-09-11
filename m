Return-Path: <linux-media+bounces-42278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E9B52CD3
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0979F1691BA
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115BD2EA73B;
	Thu, 11 Sep 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9Uo4UU/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A752EA485;
	Thu, 11 Sep 2025 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582150; cv=none; b=Z3PRPD2zNSij8kgppPBWMmzu7IiCWD9x23NjRSR39+Z2eOXjN0vNBFgOM5WmuLYMYLnVNrE5bs/CbKpcO/TyRJQGMbXZkYwOAskNyx/ubFSlwqSup+9mQzAenoa6UGoMVV2GQzpFOn14E9s9X7KAt0d5qOsgAy+xLwfei6h/Vbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582150; c=relaxed/simple;
	bh=7kN8g8jWps+OAHrQ5Wj8PfMisBek8dcqdJrCMUM3QpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLYOoglO60J0C8Di12nWf8hwY3VvbOsKq9hkFqu/mSD75Xnkuxf0n0/dJsXgmSblT4I7tATSlobt6AmzHzuxtOMonyIR808IHnaofu6chXSPGp/DsaThFRk+fODNpa2pmZuSmW/9QUjJ8duxmsW5X521zeYq6kHI9SiHx3YqaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9Uo4UU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94572C4CEFC;
	Thu, 11 Sep 2025 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757582149;
	bh=7kN8g8jWps+OAHrQ5Wj8PfMisBek8dcqdJrCMUM3QpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9Uo4UU/N9uv+cQ+Cb+rSNCnWJJKX2SLbHpzkP2T2as7Mx/5mXBa8DDjCwWh69muI
	 o+/E6kEDpYaobLs5PHIPDe4439adeDWoXwVekMNzF16du48zaLXOSZGMUqavSJDNqR
	 sgCTqId0d2519pF6ChA8VI39v6EBjAtY2+kReR6LHdYxj2cGiyZjhbGKN8YakRZ7th
	 cuvKcrLP0XnOIoYs5ZH9FOisgTrLocD43vdVJujhDgHKUJvaAS1T1gEqIn/aXy7GDK
	 dgMnh+rDI7TCBg0aUE6FvQkAXzbAd7d9vRLimYL+zfL+wOntKzYVIhb5GEM/Iobosr
	 zzNqwQD0Dlh9g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 11 Sep 2025 11:15:35 +0200
Subject: [PATCH v2 4/4] media: gc2145: Fix the RGB MBUS format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-csi-bgr-rgb-v2-4-e6c6b10c1040@kernel.org>
References: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
In-Reply-To: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3305; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7kN8g8jWps+OAHrQ5Wj8PfMisBek8dcqdJrCMUM3QpY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmHJptfa3F4KzXplMkP17hmBt6Xu14u8JnNs3Jz6Nmln
 vu4/ulP75jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATmfOPsWHOzuf3VkbsvGPT
 1t+Tlac171xzWrsi4yrZ4Jj7M1qm6SmF799r4cq8NNHqgXoIWzTDVsb6ENbVO3z37Fa1u/5QJ/D
 udDHT87khbktYfHe1BS1SU/g2Keto/and377JXWSem3Zx4ssaAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The GalaxyCore GC2145 is an MIPI-CSI2 sensor. Among others, it support
the MIPI-CSI2 RGB565 format, listed in the driver as
MEDIA_BUS_FMT_RGB565_1X16.

Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB565_1X16 to
V4L2_PIX_FMT_RGB565.

However, V4L2_PIX_FMT_RGB565 is defined as having its color components
in the R, G and B order, from left to right. MIPI-CSI2 however defines
the RGB565 format with blue first.

This essentially means that the R and B will be swapped compared to what
V4L2_PIX_FMT_RGB565 defines.

The proper MBUS format would be BGR565, so let's use that.

Fixes: 03cc7fefbb09 ("media: i2c: gc2145: Galaxy Core GC2145 sensor support")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/i2c/gc2145.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index 559a851669aaf57cfba4d8834d04de9a3e3d91e0..59a0e51c70c84fe1045701d246d02bb1cf97388c 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -579,11 +579,11 @@ static const struct gc2145_format supported_formats[] = {
 		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_YUV422_8B,
 		.output_fmt	= 0x03,
 	},
 	{
-		.code		= MEDIA_BUS_FMT_RGB565_1X16,
+		.code		= MEDIA_BUS_FMT_BGR565_1X16,
 		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_RGB565,
 		.output_fmt	= 0x06,
 		.switch_bit	= true,
 	},
@@ -613,10 +613,25 @@ static const struct gc2145_format supported_formats[] = {
 		.colorspace     = V4L2_COLORSPACE_RAW,
 		.datatype       = MIPI_CSI2_DT_RAW8,
 		.output_fmt     = 0x17,
 		.row_col_switch = GC2145_SYNC_MODE_ROW_SWITCH,
 	},
+	{
+	/*
+	 * The driver was initially introduced with RGB565 support, but
+	 * CSI really means BGR.
+	 *
+	 * Since we might have applications that would have hard-coded
+	 * the RGB565, let's support both, with RGB being last to make
+	 * sure it's only a last resort.
+	 */
+		.code		= MEDIA_BUS_FMT_RGB565_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.datatype	= MIPI_CSI2_DT_RGB565,
+		.output_fmt	= 0x06,
+		.switch_bit	= true,
+	},
 };
 
 struct gc2145_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *pixel_rate;
@@ -660,10 +675,14 @@ static inline struct v4l2_subdev *gc2145_ctrl_to_sd(struct v4l2_ctrl *ctrl)
 static const struct gc2145_format *
 gc2145_get_format_code(struct gc2145 *gc2145, u32 code)
 {
 	unsigned int i;
 
+	if (code == MEDIA_BUS_FMT_RGB565_1X16)
+		v4l2_warn(&gc2145->sd,
+			  "RGB format isn't actually supported by the hardware. The application should be fixed to use BGR.");
+
 	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
 		if (supported_formats[i].code == code)
 			break;
 	}
 
@@ -696,11 +715,11 @@ static int gc2145_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 
 	/* Initialize pad format */
 	format = v4l2_subdev_state_get_format(state, 0);
 	gc2145_update_pad_format(gc2145, &supported_modes[0], format,
-				 MEDIA_BUS_FMT_RGB565_1X16,
+				 MEDIA_BUS_FMT_BGR565_1X16,
 				 V4L2_COLORSPACE_SRGB);
 
 	/* Initialize crop rectangle. */
 	crop = v4l2_subdev_state_get_crop(state, 0);
 	*crop = supported_modes[0].crop;

-- 
2.50.1


