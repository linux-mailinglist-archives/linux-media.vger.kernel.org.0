Return-Path: <linux-media+bounces-36060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77BAEAC37
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51A64176A1A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC0D19992D;
	Fri, 27 Jun 2025 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q/A69MPp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FA149C6F;
	Fri, 27 Jun 2025 01:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986439; cv=none; b=XI2vsAd+qKmRoWNKyXU1xYwYWWvj7mgCvzgB+QN/1qiMrKKuRO4L9M3G85vbt7zMCQGbbCK/7QWGAdA+z29GFF2BBx2BdtfTWLxVhiMpkLgTakPi8XqKUDlvja5fXyz2zZGi7RFV9ZEf806sEfDNhDOIlviFKr4OYlPEpccab7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986439; c=relaxed/simple;
	bh=JYZxRd0pBC2id3BgE5miqwLdMjIE0vJMuRQlJq33F+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvrG44U9QGySBS/vWx1W1zSjwhezDq29xPPxN/SIcD1FixHhQjnR2mmg1/uhIxlwo3PimSTx/dK7rz6z4mKd17RYsx8E8SYRaph9u7zrlgD224fRYKrRrALJDIixaVsgo2qugbyITctMbaJ/yRV8q4J6nsNPYtB7fpfhegxnhy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q/A69MPp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFD7A6BE;
	Fri, 27 Jun 2025 03:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986415;
	bh=JYZxRd0pBC2id3BgE5miqwLdMjIE0vJMuRQlJq33F+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q/A69MPpRZyb6TpbTtvf6GK/y6EOkF3QB56WIPsHDHeUwJ1Hf0K2h2EHFMIa5Cnk2
	 kc84O9Q9fQcaDOz0zA1I/HC5yLjhMysLaSwaB1ZuuMO8R1YiWfeEWu5iycdih5AT15
	 um6eyru/f4OEF5tx1+EdeRpmG9GFDLIeMSc7ms7A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Jun 2025 18:06:10 -0700
Subject: [PATCH v3 5/6] media: cadence: cdns-csi2rx: Support multiple
 pixels per clock cycle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-probe_fixes-v3-5-83e735ae466e@ideasonboard.com>
References: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
In-Reply-To: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8107;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=JYZxRd0pBC2id3BgE5miqwLdMjIE0vJMuRQlJq33F+Y=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6m9kDJIUTferUglO4kND7vkObMb0+Rl/6Ej
 JNr92fAQriJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3upgAKCRBD3pH5JJpx
 RcQZEADJwOQ7cU6vPZw1z3AcqM0nnD2W30PBOpQNmW9ThEVUXRE4ANGHc7KwkN/ASqECALL8WDt
 WwAyZEd2uLLWeFdkdBEx6vLHPk4zzbkhtye2FSWiJc+cHtKbJfzPuEK7QzEDnDnOVX2xewDfEUd
 5/lqNc3IWVgyiDqhVTDqqDHMCrPR1zrsk2D3H9Qs9gruYwPZnswaxzYMm/YXQuYL/uOTvgvTEci
 1ayiNBPmcIdSLEkDtulR208fTqAwEcNHB6Gd2SuxKtmWSViHeYugagefr1YBsfELzfFnWS/3V42
 i50R0ZKcUbKgY8B0m5dZ9IFyh0bEZ9qwXz7qMHQERBKrnFmrTxnAmlSNLLD4gEdXg7jGc4BMI41
 vAn5LxHv5x8AwxaCmp7aOdfcn9ZA2gU7vI2fUN3f2arjjANq+KjTpFfNVC8d8VDnATynMSznfCH
 MsJufz48ZiTw0VAFwr8tfOxV309972RH4PtELc/96CySmkTK6csDKTmAk3ovkKCbM8uhumczlf1
 tZ2WqtPLoMT8c6EYH7tp2lMDh5HqHO7LH7sWQGQoQv6XHGqg9aNGVsi7+h4y/reJmoHVWtBS3PB
 eLjuFZA1uBckB8j/QNntrs72//BGmbCb6naUY8DCcB2RG1D2Fpz2/oRXG9YyXdh7FJxUyIxFm+J
 Df2evm0DXEnKsug==
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
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Move cdns-csi2rx header to include/media/cadence and update
  MAINTAINERS file
- Export symbol from cdns-csi2rx.c to be used only through the
  j721e-csi2rx.c module namespace
- Other minor fixes suggested by Sakari
---
 MAINTAINERS                                  |  1 +
 drivers/media/platform/cadence/cdns-csi2rx.c | 73 +++++++++++++++++++++-------
 include/media/cadence/cdns-csi2rx.h          | 19 ++++++++
 3 files changed, 75 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..10600895fd5c8fdc8cc86bb86ff003ffd04ab8f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5251,6 +5251,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cdns,*.txt
 F:	Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
 F:	drivers/media/platform/cadence/cdns-csi2*
+F:	include/media/cadence/cdns-csi2*
 
 CADENCE NAND DRIVER
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 608298c72462031515d9ad01c6b267bf7375a5bf..819f43f1b3a09f3ccd6e944345c56241069bc8c4 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Cadence Design Systems Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -17,6 +18,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include <media/cadence/cdns-csi2rx.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -52,7 +54,9 @@
 #define CSI2RX_STREAM_DATA_CFG_VC_SELECT(n)		BIT((n) + 16)
 
 #define CSI2RX_STREAM_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x00c)
-#define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF		(1 << 8)
+#define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF		BIT(8)
+#define CSI2RX_STREAM_CFG_NUM_PIXELS_MASK		GENMASK(5, 4)
+#define CSI2RX_STREAM_CFG_NUM_PIXELS(n)			((n) >> 1U)
 
 #define CSI2RX_LANES_MAX	4
 #define CSI2RX_STREAMS_MAX	4
@@ -68,7 +72,10 @@ enum csi2rx_pads {
 
 struct csi2rx_fmt {
 	u32				code;
+	/* width of a single pixel on CSI-2 bus */
 	u8				bpp;
+	/* max pixels per clock supported on output bus */
+	u8				max_pixels;
 };
 
 struct csi2rx_priv {
@@ -90,6 +97,7 @@ struct csi2rx_priv {
 	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
 	struct phy			*dphy;
 
+	u8				num_pixels[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -106,22 +114,22 @@ struct csi2rx_priv {
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
@@ -276,7 +284,9 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 		reset_control_deassert(csi2rx->pixel_rst[i]);
 
-		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
+		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
+			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
+					  csi2rx->num_pixels[i]),
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
 
 		/*
@@ -458,6 +468,33 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
 	return csi2rx_set_fmt(subdev, state, &format);
 }
 
+int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
+			      u8 *ppc)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	const struct csi2rx_fmt *csi_fmt;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
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
+	return 0;
+}
+EXPORT_SYMBOL_GPL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
diff --git a/include/media/cadence/cdns-csi2rx.h b/include/media/cadence/cdns-csi2rx.h
new file mode 100644
index 0000000000000000000000000000000000000000..782d03fc36d1fc06fddab04c4f8081af62c3766f
--- /dev/null
+++ b/include/media/cadence/cdns-csi2rx.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef _CDNS_CSI2RX_H
+#define _CDNS_CSI2RX_H
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


