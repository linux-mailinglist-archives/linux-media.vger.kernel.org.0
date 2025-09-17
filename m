Return-Path: <linux-media+bounces-42665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CAB7E552
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC6B3AD15E
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 11:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6024335084C;
	Wed, 17 Sep 2025 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eosiQvRq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E812EC0B9;
	Wed, 17 Sep 2025 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107797; cv=none; b=lfiiQc6TJfLk/OimSsPDeNvXKW5rkyZNIHK3DdbwpCAq8zMsQvvpNPX65yTH+YsPZLFhEc9rMNVy46k4otRKKhui3LwbLhhTCOa1l05hDkGdXdGrsK5Bj+3UcN51yPhEa6cJG1A2EkAzsb+QmvwcX/6Pt8W0Us8S23mb71iLeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107797; c=relaxed/simple;
	bh=Y+3nIrnvAgbnHI5g9PJ6WJ/KzCKFqJfuSMVVefbpSho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7X0m/WsqfxRHBm7oTpfAU+EZoEpOU3cQ9scpIrFuXiN3FOFfg+7B6y3sMzh9ueM4dLq+XUB69pmFShdLtABcfALM8HbSiighd2OJJ1Qz9xBxHpMdVK6YTgkX6JwBcfYYkCTFVtgQp4cAPgBeLwQGeM8gvsjekhwwwMK4rq4tHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eosiQvRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEEEC4CEF5;
	Wed, 17 Sep 2025 11:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758107797;
	bh=Y+3nIrnvAgbnHI5g9PJ6WJ/KzCKFqJfuSMVVefbpSho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eosiQvRq93/I0qbVOx7KCYCNCQ24Pki1pJ4jPP9OFmkQDG1PrlHw+X7sZBhSJ6v8u
	 HuXXU09bgoqrDwUr59yAoWiPsI1lNRwSVWT7YaoO8t8SbmUmsWo692bmHlWt9XxKMf
	 iuKYGrHly3HmcyZqBklZC//2sH3cn4GQyF0K8W7oZAZ1Xf9a+6TVZVQtNFLOVK6TAN
	 zMbftgn3Tl2vt6GI3PL34iMY5uO8eps/6NisIWO1nugRexye6P3+tCTbC2YHfVFbuo
	 wQJZSYEfYjXPF+Muf//8EgiTO6ZIGKqeTWNecoAU+neR7q4gaGddH8gzzXCd2kdzDs
	 oNcqyc+vwLSuQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 13:16:14 +0200
Subject: [PATCH v3 4/4] media: gc2145: Fix the RGB MBUS format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi-bgr-rgb-v3-4-0145571b3aa4@kernel.org>
References: <20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org>
In-Reply-To: <20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3387; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Y+3nIrnvAgbnHI5g9PJ6WJ/KzCKFqJfuSMVVefbpSho=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnZrR96y7SUXrs5tVudyVCzyVv87ppRXEJCgv/r6ovK
 +TYkbqoYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEtI+xhjOkklV0qtyEbh7h
 7k0GD8oe8Jbb/Hiu2XLyy1PnNFmer4luosz1z17uelnauMzurv0kxoZVXBeU8ip3HVpiE85caJg
 2LWO1vGi9+KepNi3HeJn5+NJ3uPAJ9y5RN8qSz1R0u5EgDwA=
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
 drivers/media/i2c/gc2145.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index 559a851669aaf57cfba4d8834d04de9a3e3d91e0..88c3d92accb71108d23fa305d2ccf5bca2dd1079 100644
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
@@ -658,12 +673,17 @@ static inline struct v4l2_subdev *gc2145_ctrl_to_sd(struct v4l2_ctrl *ctrl)
 }
 
 static const struct gc2145_format *
 gc2145_get_format_code(struct gc2145 *gc2145, u32 code)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
 	unsigned int i;
 
+	if (code == MEDIA_BUS_FMT_RGB565_1X16)
+		dev_warn_once(&client->dev,
+			      "RGB format isn't actually supported by the hardware. The application should be fixed to use BGR.");
+
 	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
 		if (supported_formats[i].code == code)
 			break;
 	}
 
@@ -696,11 +716,11 @@ static int gc2145_init_state(struct v4l2_subdev *sd,
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


