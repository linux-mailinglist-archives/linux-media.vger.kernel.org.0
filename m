Return-Path: <linux-media+bounces-44268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7DBD2AF9
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AADD4E96D9
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC1E305E0D;
	Mon, 13 Oct 2025 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYHE+Ell"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66930597C;
	Mon, 13 Oct 2025 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353309; cv=none; b=lszhDEz94mGNBLhgk5Lbra6dCxj9tOZ34j6RELY98qvYebjwqDVV1c6A4f0zyQtzL64pXUG3WhvQA/VB9f0UmRdnqFTw/Xka+3My+8BIeOWHbHrTfo4sLtj1xgnRPECFTTt6X9lcVJCbEIMZo1WfXYBv6l350Cxw3UrylsKXKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353309; c=relaxed/simple;
	bh=iJSBhGjVFS2FVaaRfzW2soMJOd6n5yz2PYztK0cwd4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMYPnauaL2dgAEhcJc5SKtJ0mXNqKq+YZROrTlQs9D3QTDBypfbXrW+iTq3bGLXUQnNJgglAICBUjevD9KW6ijAS7I7k3R/KQUFlNXhiQILHHHV5YEUA7x7XoLi123vkCNdn0blTVfvLJnyiikE8coGT5xpxGnQOQqApvJJFIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYHE+Ell; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBE6C4CEE7;
	Mon, 13 Oct 2025 11:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353308;
	bh=iJSBhGjVFS2FVaaRfzW2soMJOd6n5yz2PYztK0cwd4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qYHE+EllJhmRU+D56qVc+dAOrylJIHOKGzpINrZEig247PthLBHRyUI4i9k9kTQ4a
	 xSGGd0UBCiv+NLrmrhB53L9QD63R11IoUn7917laDAhtS1g/lLloAR59PbYKAqBSVi
	 8f6Y0OqTyhSQuai+GGiv/uYI+c8ea3NMX9AIQYaXf1Hg45gln+58dkvD6AmnepXEMl
	 SWbxO6eD8sTcuXTf5n/UMpfK9mfUo87xCgcxjaKMb0SawmvScKWz/HBbl+L2oWxL9E
	 o2C/3jVkRXLbA+t4sDZQ12zeSplEfdBOsE02bJo6ZX39XEotqyd2kt4OL4fTdvSgOB
	 YV3cbGST/I72g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 13:01:36 +0200
Subject: [PATCH v4 4/4] media: gc2145: Fix the RGB MBUS format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-csi-bgr-rgb-v4-4-55eab2caa69f@kernel.org>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
In-Reply-To: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

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
index b215963a2648b7423fc0ca42b300b6c586d2b994..3c179ccf19cd7ed016699d4de4eb81271c1e11ab 100644
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
2.51.0


