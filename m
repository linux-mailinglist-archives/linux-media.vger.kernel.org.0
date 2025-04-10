Return-Path: <linux-media+bounces-29867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB23A839D7
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA491715FA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F2020AF8A;
	Thu, 10 Apr 2025 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FHx1PcZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB1C20468C;
	Thu, 10 Apr 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267806; cv=none; b=Odo5zCmDw/MCS94JQ9yPj1+lgZqBXvDjpeENBE/NrCTQzQMyGeOVDVN1qzrjNX+GrU2AdVbWsE1DcO7VZJV86OMXca1c5UVse4Ff0tB/vYts7eejFkTD3rtsWTn4FnTRbU2+Rvq0lGklOehFsqi1XQzrRIytjpyvcO9vpqSjj7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267806; c=relaxed/simple;
	bh=nCnnDofJha84+eIcewsfKIHBiGBGP2QkbQJkJ/ggr40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4WCvZ4V/e360SZ9Gl9m9nNB2+T4rhJ9IEt6ViyGINiH3dh6zDBel3BARb8tHZf5CsrbFMsLvn7HO9Diy44EcVAL812MwCacJs+Q4Du5HpFQsJrLgd3mB8aB3w4NX6POJ7QqAZSE9Id6puXfiU2jND86uh87813f8udEsLwwBSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FHx1PcZ8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3255BEE4;
	Thu, 10 Apr 2025 08:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267684;
	bh=nCnnDofJha84+eIcewsfKIHBiGBGP2QkbQJkJ/ggr40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FHx1PcZ8RbQPBY0GRpLaWEWv3Fb4kOn706WM7rrO8oDI57yGIkQXOoAT7HDQ54tLs
	 P2uATbIKOA0f0ccLrxApsefaKFvZa5RoS+4/mC4i3zVVDx84kwbsQ0so8h24e1tocH
	 RNLBKlYY2dHgUh5gtC9Y2TZBCVwV3rCSpzcr4HYA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 10 Apr 2025 12:19:03 +0530
Subject: [PATCH v2 5/6] media: cadence: cdns-csi2rx: Support multiple
 pixels per clock cycle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-probe_fixes-v2-5-801bc6eebdea@ideasonboard.com>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7258;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=nCnnDofJha84+eIcewsfKIHBiGBGP2QkbQJkJ/ggr40=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n4rYoJJ20IyA3AaDA7QvGnpIRBhVG+/A7ZB
 t7J1IwX6HWJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp+AAKCRBD3pH5JJpx
 RVfeD/9YMsGbc81g2pDu2Gjjmp1y9cN036hObyjnMI9pczxKcKEfY1wlIlZOpRSBhMOreBDAlwE
 p9GdtFjZjizXVWEZpL1PvuDL1dy6tj9kvl79X8ZWfLRgPKNkrU8exR6S5jkqtOBpXG1v9k/Hfw5
 XCRuZDgHL8C4jxIC4zFdC16KfeTpLstitw5yJ389323Oluwil2CzbeI+11rxYvduPCt8dtqC02i
 c5g8A4sUqFw4hXsSV6bGk4SPUw2JICJvf2HgZvftIfX3dsr1HN8taFU8JtJlM79AS6AcfrQjPV2
 kzQ13KGccApHcRyWxh96mOzSoBBWVlwLS+/Z1bsc2mJFnSFxFSEm8iLNqzEtEz/UrcjUTT+qMAz
 cTgnjzfYSsU7msc50/HqiJLghQjPFZRMYpq5IqnpL/lTTfsE1IjUanEdDJp9kBAaBCiDGUNhE1l
 XELY6eCMbT+Ay3razDMQJKZrAk5ZuimqWWUMIUWOf+a/+1Z5U8oWAnOBn4a3z3zNnxwEKz9hFwA
 O771qkqco2aybe05TMbQsJrWyq0Fzp32zZNVGAjK5JUCm+XaUlQXo34nn0QLxfCsbIYb8fqAz3l
 XZ7fbmvW/LF5w3H9hmZop6P4OSo1oU4Zd90w0Dy3ZfzfJs4kqOuuJMEIVJhbq4Gp8CAmhYuVT+Z
 ZVbFokUSkIwlNpw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The output pixel interface is a parallel bus (32 bits), which
supports sending multiple pixels (1, 2 or 4) per clock cycle for
smaller pixel widths like RAW8-RAW16.

Dual-pixel and Quad-pixel modes can be a requirement if the export rate
of the Cadence IP in Single-pixel mode maxes out before the maximum
supported DPHY-RX frequency, which is the case with TI's integration of
this IP [1].

So, we export a function that lets the downstream hardware block request
a higher pixel-per-clock on a particular output pad.

We check if we can support the requested pixels per clock given the
known maximum for the currently configured format. If not, we set it
to the highest feasible value and return this value to the caller.

[1] Section 12.6.1.4.8.14 CSI_RX_IF Programming Restrictions of AM62 TRM

Link: https://www.ti.com/lit/pdf/spruj16
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 75 +++++++++++++++++++++-------
 drivers/media/platform/cadence/cdns-csi2rx.h | 19 +++++++
 2 files changed, 76 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 608298c72462031515d9ad01c6b267bf7375a5bf..154eaacc39ad294db0524e88be888bd0929af071 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Cadence Design Systems Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -22,6 +23,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "cdns-csi2rx.h"
+
 #define CSI2RX_DEVICE_CFG_REG			0x000
 
 #define CSI2RX_SOFT_RESET_REG			0x004
@@ -53,6 +56,8 @@
 
 #define CSI2RX_STREAM_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x00c)
 #define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF		(1 << 8)
+#define CSI2RX_STREAM_CFG_NUM_PIXELS_MASK		GENMASK(5, 4)
+#define CSI2RX_STREAM_CFG_NUM_PIXELS(n)			((n) >> 1)
 
 #define CSI2RX_LANES_MAX	4
 #define CSI2RX_STREAMS_MAX	4
@@ -68,7 +73,10 @@ enum csi2rx_pads {
 
 struct csi2rx_fmt {
 	u32				code;
+	/* width of a single pixel on CSI-2 bus */
 	u8				bpp;
+	/* max pixels per clock supported on output bus */
+	u8				max_pixels;
 };
 
 struct csi2rx_priv {
@@ -90,6 +98,7 @@ struct csi2rx_priv {
 	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
 	struct phy			*dphy;
 
+	u8				num_pixels[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -106,22 +115,22 @@ struct csi2rx_priv {
 };
 
 static const struct csi2rx_fmt formats[] = {
-	{ .code	= MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, },
-	{ .code	= MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, },
-	{ .code	= MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, },
-	{ .code	= MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, },
-	{ .code	= MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, },
-	{ .code	= MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
-	{ .code	= MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
-	{ .code	= MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
-	{ .code	= MEDIA_BUS_FMT_Y8_1X8,     .bpp = 8, },
-	{ .code	= MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
-	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
-	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
-	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
-	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, },
-	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, },
-	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
+	{ .code	= MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, .max_pixels = 4, },
+	{ .code	= MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, .max_pixels = 4, },
+	{ .code	= MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, .max_pixels = 4, },
+	{ .code	= MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, .max_pixels = 4, },
+	{ .code	= MEDIA_BUS_FMT_Y8_1X8,     .bpp = 8, .max_pixels = 4, },
+	{ .code	= MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
+	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
+	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
 };
 
 static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
@@ -276,8 +285,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 		reset_control_deassert(csi2rx->pixel_rst[i]);
 
-		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
-		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
+		reg = CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF;
+		reg |= FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
+				  csi2rx->num_pixels[i]);
+		writel(reg, csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
 
 		/*
 		 * Enable one virtual channel. When multiple virtual channels
@@ -458,6 +469,34 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
 	return csi2rx_set_fmt(subdev, state, &format);
 }
 
+int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
+			      u8 *ppc)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	const struct csi2rx_fmt *csi_fmt;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+	fmt = v4l2_subdev_state_get_format(state, pad);
+	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+
+	/* Reduce requested PPC if it is too high */
+	*ppc = min(*ppc, csi_fmt->max_pixels);
+
+	v4l2_subdev_unlock_state(state);
+
+	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
+		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
+
+	return ret;
+}
+EXPORT_SYMBOL(cdns_csi2rx_negotiate_ppc);
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.h b/drivers/media/platform/cadence/cdns-csi2rx.h
new file mode 100644
index 0000000000000000000000000000000000000000..128d47e8513c99c083f49e249e876be6d19389f6
--- /dev/null
+++ b/drivers/media/platform/cadence/cdns-csi2rx.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef CDNS_CSI2RX_H
+#define CDNS_CSI2RX_H
+
+#include <media/v4l2-subdev.h>
+
+/**
+ * cdns_csi2rx_negotiate_ppc - Negotiate pixel-per-clock on output interface
+ *
+ * @subdev: point to &struct v4l2_subdev
+ * @pad: pad number of the source pad
+ * @ppc: pointer to requested pixel-per-clock value
+ *
+ * Returns 0 on success, negative error code otherwise.
+ */
+int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
+			      u8 *ppc);
+
+#endif

-- 
2.49.0


