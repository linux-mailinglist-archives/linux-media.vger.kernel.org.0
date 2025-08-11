Return-Path: <linux-media+bounces-39412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 647BDB201B2
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65A43189EBCC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5732DC341;
	Mon, 11 Aug 2025 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L4Z/ZBz6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2462DAFC0;
	Mon, 11 Aug 2025 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900524; cv=none; b=S0eIViCjcbLvvVVIw0JiazMXgPxIRgoehK09xmJEuQpnIifiij0cBrxLtfDebarhx/yUO2BIP9DXsEJYMPFj0pfpMtMu1VZGEXmTyvcHu0OXcXPQm306rpEp56Pi76H4E45u5DO35bFCJWaWaqpvZWDXFaGh0zG+uNz9hPKIOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900524; c=relaxed/simple;
	bh=jzbVzOZLbFJDdM45eNJhA5bxMSlCDO4muvB/sqqj1Lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFtMwqqVp7I3MXX6gJYqtuNkzx6zUyvX0bOIpNbIteVH6d/7McgzHdDGb8iROj3xcTQjpjeUZnEaT2RfSuFiE+toYjHENOVyhqqg7fLKjb1upatJfcwnfawOkdQXz2G8tK9tq44KAwE8ZVaSFqWVrna3HqcstWZXAYQ4mn/QyRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L4Z/ZBz6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD86E82A;
	Mon, 11 Aug 2025 10:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900469;
	bh=jzbVzOZLbFJDdM45eNJhA5bxMSlCDO4muvB/sqqj1Lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L4Z/ZBz6auHujdIXox6h/SGKYy+voT6IEbOFa4Kbyl6bB6pjzvkSTYeCs0AKrZw7I
	 tTQRkGrl9TDzhZGaCyQFXvgbY9ktbJ0oxVThE0NU7/0ZPOIYG8D9+T1msTdwUc3gGF
	 eQBrLEL2Udv8EfNlR6PdryzchU9JG80RPBb2QPxU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 11 Aug 2025 13:50:17 +0530
Subject: [PATCH v4 5/6] media: cadence: cdns-csi2rx: Support multiple
 pixels per clock cycle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-probe_fixes-v4-5-aae22290f1d0@ideasonboard.com>
References: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
In-Reply-To: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8193;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=jzbVzOZLbFJDdM45eNJhA5bxMSlCDO4muvB/sqqj1Lk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafVSOoPtqbUqxjyhE/38aSgVucG8S2gFHay1
 3XTAE9wnoiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmn1QAKCRBD3pH5JJpx
 RaOmD/9BVbfsJc8gswHB1M0+W+CoDHk134KBip5XUu7ym/xQ0A51iKXmNe6SG23075VvR7cieNu
 2TEo6Zf6Wat3pyzYd56TecjYjn5sSjJwtJypuaKnf2jz+DmA0RFkfWNosInSfKjb/xo+rfy4E8F
 8tkusXrF8vBna5fAvKq/uibag6MCJvqnU3MCntHrADShmC2RL4FbmwxgJJkPjDqXs8b9TWL9SB7
 eCNOeSsHvZp8yky61A8Ug4xb7vFOGcLslednCJVOgJKIaNalwtCq+/ji1NPOmy3Yn/KMpaetaLN
 E3SVWP5C1o7Krx6MrQ8UaRuwJEMdHswzq8CmpCG6obv7W82Itrv+SbAttlf055PuP6fWU8inaaP
 LEJLxuZdzWqnjG+gLhYsy8fcTBVs1k4d8uUJ3P9f1vbF7g9+kWdBjKroE0XwoyG7/fJpHrfYG/o
 kEp+1m/YucYLNLAZsAtqMhO1L/kcJMkiXFj5xfx2uT0PTOYYS3XqdbPZv73gMH/xecEgfvabmzQ
 DqA5sRFHxvPPKShMiSpnfF9AlHsI3hJOtK2YfdK8zCGB90j8cMnq8kw+wjV0zvmRaES4vucA7WJ
 XSeK+feAaEWTuv39ePx5F//PPn8rnk5bcLmDRKsUa3OhB/iWlLuqP3Eg4aJwOdeXL2MF8T0oGAX
 2tpYZYF8grrdi6g==
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
 drivers/media/platform/cadence/cdns-csi2rx.c | 74 +++++++++++++++++++++-------
 include/media/cadence/cdns-csi2rx.h          | 19 +++++++
 3 files changed, 76 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..eca3bb8b35926db5114d92c50bb59b90b6ad2d90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5354,6 +5354,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cdns,*.txt
 F:	Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
 F:	drivers/media/platform/cadence/cdns-csi2*
+F:	include/media/cadence/cdns-csi2*
 
 CADENCE NAND DRIVER
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index c232047487852d431957434c4c97f84dbb66acad..828b4ba4301d3e96c73f7695a7e254ae5f681060 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2017 Cadence Design Systems Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -17,6 +19,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include <media/cadence/cdns-csi2rx.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -52,7 +55,9 @@
 #define CSI2RX_STREAM_DATA_CFG_VC_SELECT(n)		BIT((n) + 16)
 
 #define CSI2RX_STREAM_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x00c)
-#define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF		(1 << 8)
+#define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF		BIT(8)
+#define CSI2RX_STREAM_CFG_NUM_PIXELS_MASK		GENMASK(5, 4)
+#define CSI2RX_STREAM_CFG_NUM_PIXELS(n)			((n) >> 1U)
 
 #define CSI2RX_LANES_MAX	4
 #define CSI2RX_STREAMS_MAX	4
@@ -87,7 +92,10 @@ enum csi2rx_pads {
 
 struct csi2rx_fmt {
 	u32				code;
+	/* width of a single pixel on CSI-2 bus */
 	u8				bpp;
+	/* max pixels per clock supported on output bus */
+	u8				max_pixels;
 };
 
 struct csi2rx_event {
@@ -132,6 +140,7 @@ struct csi2rx_priv {
 	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
 	struct phy			*dphy;
 
+	u8				num_pixels[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -149,22 +158,22 @@ struct csi2rx_priv {
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
 
 static void csi2rx_configure_error_irq_mask(void __iomem *base,
@@ -370,7 +379,9 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 		reset_control_deassert(csi2rx->pixel_rst[i]);
 
-		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
+		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
+			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
+					  csi2rx->num_pixels[i]),
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
 
 		/*
@@ -569,6 +580,33 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
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
2.50.1


