Return-Path: <linux-media+bounces-28013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7DA5BBC2
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35663B0A42
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30869233156;
	Tue, 11 Mar 2025 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh4vSkFG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE04522CBD3;
	Tue, 11 Mar 2025 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741684280; cv=none; b=HV1q9HRoy3Yc9PMii2Q2T0D2hqCQTYH4N/0BLXqc/x9QynweoRD18G3cv4Mrb0gMBK6bIjQ8U+oK14u4AZ7CfW7VhzNRINHlFkRwYFnj50dd3Zz2F8K6oLZPKKETOSU77nY1Z9atyWf1NS5WLwj+6QiYFvvKYaVT3pgq3I3ULy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741684280; c=relaxed/simple;
	bh=mJLFtEsdoFW9z8xYvGJzQlPYpHIs13a3cM+bGI75nxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bphMhD8AY5Em/vT5gA1o7pZcjDyO1hy1hl5iaBEUG+KH4n0LJnbuUm7eMCi9sAqjBavBerTEUtyGsU6cZAZW+D99JiIo12w2h2ReK30MkHOrgUozrVXrhpxZ9L21yG+k7qqfCiiimIQnvqqwbYHllE8WaYJ2CpGa4Rz6yuZ+3LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh4vSkFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82087C4CEFF;
	Tue, 11 Mar 2025 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741684279;
	bh=mJLFtEsdoFW9z8xYvGJzQlPYpHIs13a3cM+bGI75nxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zh4vSkFGLcKgwwzNR6ehkbktLoZ1s/y2gQ69yOtAn8j9YWdrJbbPy5FLwWl82cCQZ
	 vGsb/C59/EYgKGt1o3rDS6aFiRkJZ026qBMFyOE7MYwzoZhZCpM1LI+R0UcsPLZtN/
	 jXuBGAk3ZLB1CBTr3+ayr/a1PZnFGpRJ8TP4A873G/+of0v+/EupBnU+SfQLXPGlA+
	 K6qEyddHuIO+rxcZMvkucPLeyi3b32z4B21dHV4XPwxkI8twx+VmqfZ13OmH8pJghK
	 HfBL3S8m0XU9g38/a8euQhLtx2S3DhWhtRmvZa1Xr6bYS7csqZauXgJbOsCCqZiqQG
	 Mbs4NYFNnaijQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7791FC28B2E;
	Tue, 11 Mar 2025 09:11:19 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 11 Mar 2025 17:11:18 +0800
Subject: [PATCH v7 08/10] media: platform: Add C3 ISP driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
References: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
In-Reply-To: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741684276; l=171222;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=qn8NpFWYl/UgXXhoV6gxi7piWBgc6re0aA9tkgCEy6c=;
 b=NtsIGJpJI2+NhSlgGxTTmtoji74PQ9xmV06t9k9rNcXNN9iaGEgmwe6gfRYz6V8gDw6g+CTB2
 mljEvlEZFNTCTxvUzzckzugYOxLmKpWKPkgTeiXateNy4+5Pg22bbWQ
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

The C3 ISP supports multi-camera and muti-exposure
high dynamic range (HDR). It brings together some
advanced imaging technologies to provide good image quality.
This driver mainly responsible for driving ISP pipeline
to process raw image.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 MAINTAINERS                                        |    1 +
 drivers/media/platform/amlogic/c3/Kconfig          |    1 +
 drivers/media/platform/amlogic/c3/Makefile         |    1 +
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   18 +
 drivers/media/platform/amlogic/c3/isp/Makefile     |   10 +
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  806 ++++++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-common.h  |  340 +++++++
 .../media/platform/amlogic/c3/isp/c3-isp-core.c    |  641 +++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c |  421 ++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 1010 ++++++++++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-regs.h    |  618 ++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-resizer.c |  892 +++++++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |  328 +++++++
 13 files changed, 5087 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d60a14e7da1..c332ec53dca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1257,6 +1257,7 @@ M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+F:	drivers/media/platform/amlogic/c3/isp/
 F:	include/uapi/linux/media/amlogic/
 
 AMLOGIC MIPI ADAPTER DRIVER
diff --git a/drivers/media/platform/amlogic/c3/Kconfig b/drivers/media/platform/amlogic/c3/Kconfig
index a504a1eb22e6..d355d3a9358d 100644
--- a/drivers/media/platform/amlogic/c3/Kconfig
+++ b/drivers/media/platform/amlogic/c3/Kconfig
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+source "drivers/media/platform/amlogic/c3/isp/Kconfig"
 source "drivers/media/platform/amlogic/c3/mipi-adapter/Kconfig"
 source "drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig"
diff --git a/drivers/media/platform/amlogic/c3/Makefile b/drivers/media/platform/amlogic/c3/Makefile
index 770b2a2903ad..14f305a493d2 100644
--- a/drivers/media/platform/amlogic/c3/Makefile
+++ b/drivers/media/platform/amlogic/c3/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-y += isp/
 obj-y += mipi-adapter/
 obj-y += mipi-csi2/
diff --git a/drivers/media/platform/amlogic/c3/isp/Kconfig b/drivers/media/platform/amlogic/c3/isp/Kconfig
new file mode 100644
index 000000000000..02c62a50a5e8
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_C3_ISP
+	tristate "Amlogic C3 Image Signal Processor (ISP) driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on OF
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	help
+	  Video4Linux2 driver for Amlogic C3 ISP pipeline.
+	  The C3 ISP is used for processing raw images and
+	  outputing results to memory.
+
+	  To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/amlogic/c3/isp/Makefile b/drivers/media/platform/amlogic/c3/isp/Makefile
new file mode 100644
index 000000000000..b1b064170b57
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+c3-isp-objs := c3-isp-dev.o \
+	       c3-isp-params.o \
+	       c3-isp-stats.o \
+	       c3-isp-capture.o \
+	       c3-isp-core.o \
+	       c3-isp-resizer.o
+
+obj-$(CONFIG_VIDEO_C3_ISP) += c3-isp.o
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
new file mode 100644
index 000000000000..3518609837ba
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
@@ -0,0 +1,806 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/cleanup.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+
+#define C3_ISP_WRMIFX3_REG(addr, id)	((addr) + (id) * 0x100)
+
+static const struct c3_isp_cap_format_info cap_formats[] = {
+	/* YUV formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUV10_1X30,
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_Y_ONLY,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X1,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_8BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_8BIT,
+		.hdiv = 1,
+		.vdiv = 1,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUV10_1X30,
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_YUV420,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X2,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_8BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_UV,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_8BIT,
+		.hdiv = 2,
+		.vdiv = 2,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUV10_1X30,
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_YUV420,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X2,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_8BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_8BIT,
+		.hdiv = 2,
+		.vdiv = 2,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUV10_1X30,
+		.fourcc = V4L2_PIX_FMT_NV16M,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_YUV422,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X2,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_8BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_UV,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_8BIT,
+		.hdiv = 1,
+		.vdiv = 2
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUV10_1X30,
+		.fourcc = V4L2_PIX_FMT_NV61M,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_YUV422,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X2,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_8BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_8BIT,
+		.hdiv = 1,
+		.vdiv = 2,
+	},
+	/* RAW formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_RAW,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X1,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_16BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_16BIT,
+		.hdiv = 1,
+		.vdiv = 1,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_RAW,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X1,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_16BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_16BIT,
+		.hdiv = 1,
+		.vdiv = 1,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_RAW,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X1,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_16BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_16BIT,
+		.hdiv = 1,
+		.vdiv = 1,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.format = ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_RAW,
+		.planes = ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X1,
+		.ch0_pix_bits = ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_16BITS,
+		.uv_swap = ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU,
+		.in_bits = ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_16BIT,
+		.hdiv = 1,
+		.vdiv = 1,
+	},
+};
+
+/* Hardware configuration */
+
+/* Set the address of wrmifx3(write memory interface) */
+static void c3_isp_cap_wrmifx3_buff(struct c3_isp_capture *cap)
+{
+	dma_addr_t y_dma_addr;
+	dma_addr_t uv_dma_addr;
+
+	if (cap->buff) {
+		y_dma_addr = cap->buff->dma_addr[C3_ISP_PLANE_Y];
+		uv_dma_addr = cap->buff->dma_addr[C3_ISP_PLANE_UV];
+	} else {
+		y_dma_addr = cap->dummy_buff.dma_addr;
+		uv_dma_addr = cap->dummy_buff.dma_addr;
+	}
+
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_BADDR, cap->id),
+		     ISP_WRMIFX3_0_CH0_BASE_ADDR(y_dma_addr));
+
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_BADDR, cap->id),
+		     ISP_WRMIFX3_0_CH1_BASE_ADDR(uv_dma_addr));
+}
+
+static void c3_isp_cap_wrmifx3_format(struct c3_isp_capture *cap)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &cap->format.pix_mp;
+	const struct c3_isp_cap_format_info *info = cap->format.info;
+	u32 stride;
+	u32 chrom_h;
+	u32 chrom_v;
+
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_SIZE, cap->id),
+		     ISP_WRMIFX3_0_FMT_SIZE_HSIZE(pix_mp->width) |
+		     ISP_WRMIFX3_0_FMT_SIZE_VSIZE(pix_mp->height));
+
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_MASK, info->format);
+
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_MASK,
+			   info->in_bits);
+
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_MASK, info->planes);
+
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_MASK,
+			   info->uv_swap);
+
+	stride = DIV_ROUND_UP(pix_mp->plane_fmt[C3_ISP_PLANE_Y].bytesperline,
+			      C3_ISP_DMA_SIZE_ALIGN_BYTES);
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL0, cap->id),
+			   ISP_WRMIFX3_0_CH0_CTRL0_STRIDE_MASK,
+			   ISP_WRMIFX3_0_CH0_CTRL0_STRIDE(stride));
+
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL1, cap->id),
+			   ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_MODE_MASK,
+			   info->ch0_pix_bits);
+
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_LUMA_H, cap->id),
+		     ISP_WRMIFX3_0_WIN_LUMA_H_LUMA_HEND(pix_mp->width));
+
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_LUMA_V, cap->id),
+		     ISP_WRMIFX3_0_WIN_LUMA_V_LUMA_VEND(pix_mp->height));
+
+	stride = DIV_ROUND_UP(pix_mp->plane_fmt[C3_ISP_PLANE_UV].bytesperline,
+			      C3_ISP_DMA_SIZE_ALIGN_BYTES);
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_CTRL0, cap->id),
+			   ISP_WRMIFX3_0_CH1_CTRL0_STRIDE_MASK,
+			   ISP_WRMIFX3_0_CH1_CTRL0_STRIDE(stride));
+
+	c3_isp_update_bits(cap->isp,
+			   C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_CTRL1, cap->id),
+			   ISP_WRMIFX3_0_CH1_CTRL1_PIX_BITS_MODE_MASK,
+			   ISP_WRMIFX3_0_CH1_CTRL1_PIX_BITS_16BITS);
+
+	chrom_h = DIV_ROUND_UP(pix_mp->width, info->hdiv);
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_CHROM_H, cap->id),
+		     ISP_WRMIFX3_0_WIN_CHROM_H_CHROM_HEND(chrom_h));
+
+	chrom_v = DIV_ROUND_UP(pix_mp->height, info->vdiv);
+	c3_isp_write(cap->isp,
+		     C3_ISP_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_CHROM_V, cap->id),
+		     ISP_WRMIFX3_0_WIN_CHROM_V_CHROM_VEND(chrom_v));
+}
+
+static int c3_isp_cap_dummy_buff_create(struct c3_isp_capture *cap)
+{
+	struct c3_isp_dummy_buffer *dummy_buff = &cap->dummy_buff;
+	struct v4l2_pix_format_mplane *pix_mp = &cap->format.pix_mp;
+
+	if (pix_mp->num_planes == 1)
+		dummy_buff->size = pix_mp->plane_fmt[C3_ISP_PLANE_Y].sizeimage;
+	else
+		dummy_buff->size =
+			max(pix_mp->plane_fmt[C3_ISP_PLANE_Y].sizeimage,
+			    pix_mp->plane_fmt[C3_ISP_PLANE_UV].sizeimage);
+
+	/* The driver never access vaddr, no mapping is required */
+	dummy_buff->vaddr = dma_alloc_attrs(cap->isp->dev, dummy_buff->size,
+					    &dummy_buff->dma_addr, GFP_KERNEL,
+					    DMA_ATTR_NO_KERNEL_MAPPING);
+	if (!dummy_buff->vaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void c3_isp_cap_dummy_buff_destroy(struct c3_isp_capture *cap)
+{
+	dma_free_attrs(cap->isp->dev, cap->dummy_buff.size,
+		       cap->dummy_buff.vaddr, cap->dummy_buff.dma_addr,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+}
+
+static void c3_isp_cap_cfg_buff(struct c3_isp_capture *cap)
+{
+	cap->buff = list_first_entry_or_null(&cap->pending,
+					     struct c3_isp_cap_buffer, list);
+
+	c3_isp_cap_wrmifx3_buff(cap);
+
+	if (cap->buff)
+		list_del(&cap->buff->list);
+}
+
+static void c3_isp_cap_start(struct c3_isp_capture *cap)
+{
+	u32 mask;
+	u32 val;
+
+	scoped_guard(spinlock_irqsave, &cap->buff_lock)
+		c3_isp_cap_cfg_buff(cap);
+
+	c3_isp_cap_wrmifx3_format(cap);
+
+	if (cap->id == C3_ISP_CAP_DEV_0) {
+		mask = ISP_TOP_PATH_EN_WRMIF0_EN_MASK;
+		val = ISP_TOP_PATH_EN_WRMIF0_EN;
+	} else if (cap->id == C3_ISP_CAP_DEV_1) {
+		mask = ISP_TOP_PATH_EN_WRMIF1_EN_MASK;
+		val = ISP_TOP_PATH_EN_WRMIF1_EN;
+	} else {
+		mask = ISP_TOP_PATH_EN_WRMIF2_EN_MASK;
+		val = ISP_TOP_PATH_EN_WRMIF2_EN;
+	}
+
+	c3_isp_update_bits(cap->isp, ISP_TOP_PATH_EN, mask, val);
+}
+
+static void c3_isp_cap_stop(struct c3_isp_capture *cap)
+{
+	u32 mask;
+	u32 val;
+
+	if (cap->id == C3_ISP_CAP_DEV_0) {
+		mask = ISP_TOP_PATH_EN_WRMIF0_EN_MASK;
+		val = ISP_TOP_PATH_EN_WRMIF0_DIS;
+	} else if (cap->id == C3_ISP_CAP_DEV_1) {
+		mask = ISP_TOP_PATH_EN_WRMIF1_EN_MASK;
+		val = ISP_TOP_PATH_EN_WRMIF1_DIS;
+	} else {
+		mask = ISP_TOP_PATH_EN_WRMIF2_EN_MASK;
+		val = ISP_TOP_PATH_EN_WRMIF2_DIS;
+	}
+
+	c3_isp_update_bits(cap->isp, ISP_TOP_PATH_EN, mask, val);
+}
+
+static void c3_isp_cap_done(struct c3_isp_capture *cap)
+{
+	struct c3_isp_cap_buffer *buff = cap->buff;
+
+	guard(spinlock_irqsave)(&cap->buff_lock);
+
+	if (buff) {
+		buff->vb.sequence = cap->isp->frm_sequence;
+		buff->vb.vb2_buf.timestamp = ktime_get();
+		buff->vb.field = V4L2_FIELD_NONE;
+		vb2_buffer_done(&buff->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	c3_isp_cap_cfg_buff(cap);
+}
+
+/* V4L2 video operations */
+
+static const struct c3_isp_cap_format_info *c3_cap_find_fmt(u32 fourcc)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(cap_formats); i++) {
+		if (cap_formats[i].fourcc == fourcc)
+			return &cap_formats[i];
+	}
+
+	return NULL;
+}
+
+static void c3_cap_try_fmt(struct v4l2_pix_format_mplane *pix_mp)
+{
+	const struct c3_isp_cap_format_info *fmt;
+	const struct v4l2_format_info *info;
+	struct v4l2_plane_pix_format *plane;
+
+	fmt = c3_cap_find_fmt(pix_mp->pixelformat);
+	if (!fmt)
+		fmt = &cap_formats[0];
+
+	pix_mp->width = clamp(pix_mp->width, C3_ISP_MIN_WIDTH,
+			      C3_ISP_MAX_WIDTH);
+	pix_mp->height = clamp(pix_mp->height, C3_ISP_MIN_HEIGHT,
+			       C3_ISP_MAX_HEIGHT);
+	pix_mp->pixelformat = fmt->fourcc;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pix_mp->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
+	info = v4l2_format_info(fmt->fourcc);
+	pix_mp->num_planes = info->mem_planes;
+	memset(pix_mp->plane_fmt, 0, sizeof(pix_mp->plane_fmt));
+
+	for (unsigned int i = 0; i < info->comp_planes; i++) {
+		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
+		unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
+
+		plane = &pix_mp->plane_fmt[i];
+
+		plane->bytesperline = DIV_ROUND_UP(pix_mp->width, hdiv) *
+				      info->bpp[i] / info->bpp_div[i];
+		plane->bytesperline = ALIGN(plane->bytesperline,
+					    C3_ISP_DMA_SIZE_ALIGN_BYTES);
+		plane->sizeimage = plane->bytesperline *
+				   DIV_ROUND_UP(pix_mp->height, vdiv);
+	}
+}
+
+static void c3_isp_cap_return_buffers(struct c3_isp_capture *cap,
+				      enum vb2_buffer_state state)
+{
+	struct c3_isp_cap_buffer *buff;
+
+	guard(spinlock_irqsave)(&cap->buff_lock);
+
+	if (cap->buff) {
+		vb2_buffer_done(&cap->buff->vb.vb2_buf, state);
+		cap->buff = NULL;
+	}
+
+	while (!list_empty(&cap->pending)) {
+		buff = list_first_entry(&cap->pending,
+					struct c3_isp_cap_buffer, list);
+		list_del(&buff->list);
+		vb2_buffer_done(&buff->vb.vb2_buf, state);
+	}
+}
+
+static int c3_isp_cap_querycap(struct file *file, void *fh,
+			       struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, C3_ISP_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "AML C3 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static int c3_isp_cap_enum_fmt(struct file *file, void *fh,
+			       struct v4l2_fmtdesc *f)
+{
+	const struct c3_isp_cap_format_info *fmt;
+	unsigned int index = 0;
+	unsigned int i;
+
+	if (!f->mbus_code) {
+		if (f->index >= ARRAY_SIZE(cap_formats))
+			return -EINVAL;
+
+		fmt = &cap_formats[f->index];
+		f->pixelformat = fmt->fourcc;
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cap_formats); i++) {
+		fmt = &cap_formats[i];
+		if (f->mbus_code != fmt->mbus_code)
+			continue;
+
+		if (index++ == f->index) {
+			f->pixelformat = cap_formats[i].fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int c3_isp_cap_g_fmt_mplane(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct c3_isp_capture *cap = video_drvdata(file);
+
+	f->fmt.pix_mp = cap->format.pix_mp;
+
+	return 0;
+}
+
+static int c3_isp_cap_s_fmt_mplane(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct c3_isp_capture *cap = video_drvdata(file);
+
+	c3_cap_try_fmt(&f->fmt.pix_mp);
+
+	cap->format.pix_mp = f->fmt.pix_mp;
+	cap->format.info = c3_cap_find_fmt(f->fmt.pix_mp.pixelformat);
+
+	return 0;
+}
+
+static int c3_isp_cap_try_fmt_mplane(struct file *file, void *fh,
+				     struct v4l2_format *f)
+{
+	c3_cap_try_fmt(&f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int c3_isp_cap_enum_frmsize(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	const struct c3_isp_cap_format_info *fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	fmt = c3_cap_find_fmt(fsize->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = C3_ISP_MIN_WIDTH;
+	fsize->stepwise.min_height = C3_ISP_MIN_HEIGHT;
+	fsize->stepwise.max_width = C3_ISP_MAX_WIDTH;
+	fsize->stepwise.max_height = C3_ISP_MAX_HEIGHT;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops isp_cap_v4l2_ioctl_ops = {
+	.vidioc_querycap		= c3_isp_cap_querycap,
+	.vidioc_enum_fmt_vid_cap	= c3_isp_cap_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane	= c3_isp_cap_g_fmt_mplane,
+	.vidioc_s_fmt_vid_cap_mplane	= c3_isp_cap_s_fmt_mplane,
+	.vidioc_try_fmt_vid_cap_mplane	= c3_isp_cap_try_fmt_mplane,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+	.vidioc_enum_framesizes         = c3_isp_cap_enum_frmsize,
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations isp_cap_v4l2_fops = {
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int c3_isp_cap_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *sd =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct c3_isp_capture *cap = video_get_drvdata(vdev);
+	struct v4l2_subdev_format src_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &src_fmt);
+	if (ret)
+		return ret;
+
+	if (src_fmt.format.width != cap->format.pix_mp.width ||
+	    src_fmt.format.height != cap->format.pix_mp.height ||
+	    src_fmt.format.code != cap->format.info->mbus_code) {
+		dev_err(cap->isp->dev,
+			"link %s: %u -> %s: %u not valid: 0x%04x/%ux%u not match 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			src_fmt.format.code, src_fmt.format.width,
+			src_fmt.format.height, cap->format.info->mbus_code,
+			cap->format.pix_mp.width, cap->format.pix_mp.height);
+
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations isp_cap_entity_ops = {
+	.link_validate = c3_isp_cap_link_validate,
+};
+
+static int c3_isp_vb2_queue_setup(struct vb2_queue *q,
+				  unsigned int *num_buffers,
+				  unsigned int *num_planes,
+				  unsigned int sizes[],
+				  struct device *alloc_devs[])
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(q);
+	const struct v4l2_pix_format_mplane *pix_mp = &cap->format.pix_mp;
+	unsigned int i;
+
+	if (*num_planes) {
+		if (*num_planes != pix_mp->num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < pix_mp->num_planes; i++)
+			if (sizes[i] < pix_mp->plane_fmt[i].sizeimage)
+				return -EINVAL;
+
+		return 0;
+	}
+
+	*num_planes = pix_mp->num_planes;
+	for (i = 0; i < pix_mp->num_planes; i++)
+		sizes[i] = pix_mp->plane_fmt[i].sizeimage;
+
+	return 0;
+}
+
+static void c3_isp_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_cap_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_cap_buffer, vb);
+	struct c3_isp_capture *cap = vb2_get_drv_priv(vb->vb2_queue);
+
+	guard(spinlock_irqsave)(&cap->buff_lock);
+
+	list_add_tail(&buf->list, &cap->pending);
+}
+
+static int c3_isp_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long size;
+
+	for (unsigned int i = 0; i < cap->format.pix_mp.num_planes; i++) {
+		size = cap->format.pix_mp.plane_fmt[i].sizeimage;
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(cap->isp->dev,
+				"User buffer too small (%ld < %lu)\n",
+				vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	return 0;
+}
+
+static int c3_isp_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_cap_buffer *buf =
+		container_of(v4l2_buf, struct c3_isp_cap_buffer, vb);
+
+	for (unsigned int i = 0; i < cap->format.pix_mp.num_planes; i++)
+		buf->dma_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+
+	return 0;
+}
+
+static int c3_isp_vb2_start_streaming(struct vb2_queue *q,
+				      unsigned int count)
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(q);
+	int ret;
+
+	ret = video_device_pipeline_start(&cap->vdev, &cap->isp->pipe);
+	if (ret) {
+		dev_err(cap->isp->dev,
+			"Failed to start cap%u pipeline: %d\n", cap->id, ret);
+		goto err_return_buffers;
+	}
+
+	ret = c3_isp_cap_dummy_buff_create(cap);
+	if (ret)
+		goto err_pipeline_stop;
+
+	ret = pm_runtime_resume_and_get(cap->isp->dev);
+	if (ret)
+		goto err_dummy_destroy;
+
+	c3_isp_cap_start(cap);
+
+	ret = v4l2_subdev_enable_streams(&cap->rsz->sd, C3_ISP_RSZ_PAD_SOURCE,
+					 BIT(0));
+	if (ret)
+		goto err_pm_put;
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put(cap->isp->dev);
+err_dummy_destroy:
+	c3_isp_cap_dummy_buff_destroy(cap);
+err_pipeline_stop:
+	video_device_pipeline_stop(&cap->vdev);
+err_return_buffers:
+	c3_isp_cap_return_buffers(cap, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void c3_isp_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(q);
+
+	c3_isp_cap_stop(cap);
+
+	c3_isp_cap_return_buffers(cap, VB2_BUF_STATE_ERROR);
+
+	v4l2_subdev_disable_streams(&cap->rsz->sd, C3_ISP_RSZ_PAD_SOURCE,
+				    BIT(0));
+
+	pm_runtime_put(cap->isp->dev);
+
+	c3_isp_cap_dummy_buff_destroy(cap);
+
+	video_device_pipeline_stop(&cap->vdev);
+}
+
+static const struct vb2_ops isp_video_vb2_ops = {
+	.queue_setup = c3_isp_vb2_queue_setup,
+	.buf_queue = c3_isp_vb2_buf_queue,
+	.buf_prepare = c3_isp_vb2_buf_prepare,
+	.buf_init = c3_isp_vb2_buf_init,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = c3_isp_vb2_start_streaming,
+	.stop_streaming = c3_isp_vb2_stop_streaming,
+};
+
+static int c3_isp_register_capture(struct c3_isp_capture *cap)
+{
+	struct video_device *vdev = &cap->vdev;
+	struct vb2_queue *vb2_q = &cap->vb2_q;
+	int ret;
+
+	snprintf(vdev->name, sizeof(vdev->name), "c3-isp-cap%u", cap->id);
+	vdev->fops = &isp_cap_v4l2_fops;
+	vdev->ioctl_ops = &isp_cap_v4l2_ioctl_ops;
+	vdev->v4l2_dev = &cap->isp->v4l2_dev;
+	vdev->entity.ops = &isp_cap_entity_ops;
+	vdev->lock = &cap->lock;
+	vdev->minor = -1;
+	vdev->queue = vb2_q;
+	vdev->release = video_device_release_empty;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			    V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_RX;
+	video_set_drvdata(vdev, cap);
+
+	vb2_q->drv_priv = cap;
+	vb2_q->mem_ops = &vb2_dma_contig_memops;
+	vb2_q->ops = &isp_video_vb2_ops;
+	vb2_q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	vb2_q->io_modes = VB2_DMABUF | VB2_MMAP;
+	vb2_q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2_q->buf_struct_size = sizeof(struct c3_isp_cap_buffer);
+	vb2_q->dev = cap->isp->dev;
+	vb2_q->lock = &cap->lock;
+
+	ret = vb2_queue_init(vb2_q);
+	if (ret)
+		goto err_destroy;
+
+	cap->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vdev->entity, 1, &cap->pad);
+	if (ret)
+		goto err_queue_release;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(cap->isp->dev,
+			"Failed to register %s: %d\n", vdev->name, ret);
+		goto err_entity_cleanup;
+	}
+
+	return 0;
+
+err_entity_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_queue_release:
+	vb2_queue_release(vb2_q);
+err_destroy:
+	mutex_destroy(&cap->lock);
+	return ret;
+}
+
+int c3_isp_captures_register(struct c3_isp_device *isp)
+{
+	int ret;
+	unsigned int i;
+	struct c3_isp_capture *cap;
+
+	for (i = C3_ISP_CAP_DEV_0; i < C3_ISP_NUM_CAP_DEVS; i++) {
+		cap = &isp->caps[i];
+		memset(cap, 0, sizeof(*cap));
+
+		cap->format.pix_mp.width = C3_ISP_DEFAULT_WIDTH;
+		cap->format.pix_mp.height = C3_ISP_DEFAULT_HEIGHT;
+		cap->format.pix_mp.field = V4L2_FIELD_NONE;
+		cap->format.pix_mp.pixelformat = V4L2_PIX_FMT_NV12M;
+		cap->format.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+		cap->format.info =
+			c3_cap_find_fmt(cap->format.pix_mp.pixelformat);
+
+		c3_cap_try_fmt(&cap->format.pix_mp);
+
+		cap->id = i;
+		cap->rsz = &isp->resizers[i];
+		cap->isp = isp;
+		INIT_LIST_HEAD(&cap->pending);
+		spin_lock_init(&cap->buff_lock);
+		mutex_init(&cap->lock);
+
+		ret = c3_isp_register_capture(cap);
+		if (ret) {
+			cap->isp = NULL;
+			mutex_destroy(&cap->lock);
+			c3_isp_captures_unregister(isp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void c3_isp_captures_unregister(struct c3_isp_device *isp)
+{
+	unsigned int i;
+	struct c3_isp_capture *cap;
+
+	for (i = C3_ISP_CAP_DEV_0; i < C3_ISP_NUM_CAP_DEVS; i++) {
+		cap = &isp->caps[i];
+
+		if (!cap->isp)
+			continue;
+		vb2_queue_release(&cap->vb2_q);
+		media_entity_cleanup(&cap->vdev.entity);
+		video_unregister_device(&cap->vdev);
+		mutex_destroy(&cap->lock);
+	}
+}
+
+void c3_isp_captures_isr(struct c3_isp_device *isp)
+{
+	c3_isp_cap_done(&isp->caps[C3_ISP_CAP_DEV_0]);
+	c3_isp_cap_done(&isp->caps[C3_ISP_CAP_DEV_1]);
+	c3_isp_cap_done(&isp->caps[C3_ISP_CAP_DEV_2]);
+}
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h b/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
new file mode 100644
index 000000000000..cb470802e61e
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
@@ -0,0 +1,340 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __C3_ISP_COMMON_H__
+#define __C3_ISP_COMMON_H__
+
+#include <linux/clk.h>
+
+#include <media/media-device.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#define C3_ISP_DRIVER_NAME		"c3-isp"
+#define C3_ISP_CLOCK_NUM_MAX		3
+
+#define C3_ISP_DEFAULT_WIDTH		1920
+#define C3_ISP_DEFAULT_HEIGHT		1080
+#define C3_ISP_MAX_WIDTH		2888
+#define C3_ISP_MAX_HEIGHT		2240
+#define C3_ISP_MIN_WIDTH		160
+#define C3_ISP_MIN_HEIGHT		120
+
+#define C3_ISP_DMA_SIZE_ALIGN_BYTES	16
+
+enum c3_isp_core_pads {
+	C3_ISP_CORE_PAD_SINK_VIDEO,
+	C3_ISP_CORE_PAD_SINK_PARAMS,
+	C3_ISP_CORE_PAD_SOURCE_STATS,
+	C3_ISP_CORE_PAD_SOURCE_VIDEO_0,
+	C3_ISP_CORE_PAD_SOURCE_VIDEO_1,
+	C3_ISP_CORE_PAD_SOURCE_VIDEO_2,
+	C3_ISP_CORE_PAD_MAX
+};
+
+enum c3_isp_resizer_ids {
+	C3_ISP_RSZ_0,
+	C3_ISP_RSZ_1,
+	C3_ISP_RSZ_2,
+	C3_ISP_NUM_RSZ
+};
+
+enum c3_isp_resizer_pads {
+	C3_ISP_RSZ_PAD_SINK,
+	C3_ISP_RSZ_PAD_SOURCE,
+	C3_ISP_RSZ_PAD_MAX
+};
+
+enum c3_isp_cap_devs {
+	C3_ISP_CAP_DEV_0,
+	C3_ISP_CAP_DEV_1,
+	C3_ISP_CAP_DEV_2,
+	C3_ISP_NUM_CAP_DEVS
+};
+
+enum c3_isp_planes {
+	C3_ISP_PLANE_Y,
+	C3_ISP_PLANE_UV,
+	C3_ISP_NUM_PLANES
+};
+
+/*
+ * struct c3_isp_cap_format_info - The image format of capture device
+ *
+ * @mbus_code: the mbus code
+ * @fourcc: the pixel format
+ * @format: defines the output format of hardware
+ * @planes: defines the mutil plane of hardware
+ * @ch0_pix_bits: defines the channel 0 pixel bits mode of hardware
+ * @uv_swap: defines the uv swap flag of hardware
+ * @in_bits: defines the input bits of hardware
+ * @hdiv: horizontal chroma subsampling factor of hardware
+ * @vdiv: vertical chroma subsampling factor of hardware
+ */
+struct c3_isp_cap_format_info {
+	u32 mbus_code;
+	u32 fourcc;
+	u32 format;
+	u32 planes;
+	u32 ch0_pix_bits;
+	u8 uv_swap;
+	u8 in_bits;
+	u8 hdiv;
+	u8 vdiv;
+};
+
+/*
+ * struct c3_isp_cap_buffer - A container of vb2 buffer used by the video
+ *                            devices: capture video devices
+ *
+ * @vb: vb2 buffer
+ * @dma_addr: buffer physical address
+ * @list: entry of the buffer in the queue
+ */
+struct c3_isp_cap_buffer {
+	struct vb2_v4l2_buffer vb;
+	dma_addr_t dma_addr[C3_ISP_NUM_PLANES];
+	struct list_head list;
+};
+
+/*
+ * struct c3_isp_stats_dma_buffer - A container of vb2 buffer used by the video
+ *                                  devices: stats video devices
+ *
+ * @vb: vb2 buffer
+ * @dma_addr: buffer physical address
+ * @list: entry of the buffer in the queue
+ */
+struct c3_isp_stats_buffer {
+	struct vb2_v4l2_buffer vb;
+	dma_addr_t dma_addr;
+	struct list_head list;
+};
+
+/*
+ * struct c3_isp_params_buffer - A container of vb2 buffer used by the
+ *                               params video device
+ *
+ * @vb: vb2 buffer
+ * @cfg: scratch buffer used for caching the ISP configuration parameters
+ * @list: entry of the buffer in the queue
+ */
+struct c3_isp_params_buffer {
+	struct vb2_v4l2_buffer vb;
+	void *cfg;
+	struct list_head list;
+};
+
+/*
+ * struct c3_isp_dummy_buffer - A buffer to write the next frame to in case
+ *				there are no vb2 buffers available.
+ *
+ * @vaddr:	return value of call to dma_alloc_attrs
+ * @dma_addr:	dma address of the buffer
+ * @size:	size of the buffer
+ */
+struct c3_isp_dummy_buffer {
+	void *vaddr;
+	dma_addr_t dma_addr;
+	u32 size;
+};
+
+/*
+ * struct c3_isp_core - ISP core subdev
+ *
+ * @sd: ISP sub-device
+ * @pads: ISP sub-device pads
+ * @src_pad: source sub-device pad
+ * @isp: pointer to c3_isp_device
+ */
+struct c3_isp_core {
+	struct v4l2_subdev sd;
+	struct media_pad pads[C3_ISP_CORE_PAD_MAX];
+	struct media_pad *src_pad;
+	struct c3_isp_device *isp;
+};
+
+/*
+ * struct c3_isp_resizer - ISP resizer subdev
+ *
+ * @id: resizer id
+ * @sd: resizer sub-device
+ * @pads: resizer sub-device pads
+ * @src_sd: source sub-device
+ * @isp: pointer to c3_isp_device
+ * @src_pad: the pad of source sub-device
+ */
+struct c3_isp_resizer {
+	enum c3_isp_resizer_ids id;
+	struct v4l2_subdev sd;
+	struct media_pad pads[C3_ISP_RSZ_PAD_MAX];
+	struct v4l2_subdev *src_sd;
+	struct c3_isp_device *isp;
+	u32 src_pad;
+};
+
+/*
+ * struct c3_isp_stats - ISP statistics device
+ *
+ * @vb2_q: vb2 buffer queue
+ * @vdev: video node
+ * @vfmt: v4l2_format of the metadata format
+ * @pad: media pad
+ * @lock: protects vb2_q, vdev
+ * @isp: pointer to c3_isp_device
+ * @buff: in use buffer
+ * @buff_lock: protects stats buffer
+ * @pending: stats buffer list head
+ */
+struct c3_isp_stats {
+	struct vb2_queue vb2_q;
+	struct video_device vdev;
+	struct v4l2_format vfmt;
+	struct media_pad pad;
+
+	struct mutex lock; /* Protects vb2_q, vdev */
+	struct c3_isp_device *isp;
+
+	struct c3_isp_stats_buffer *buff;
+	spinlock_t buff_lock; /* Protects stats buffer */
+	struct list_head pending;
+};
+
+/*
+ * struct c3_isp_params - ISP parameters device
+ *
+ * @vb2_q: vb2 buffer queue
+ * @vdev: video node
+ * @vfmt: v4l2_format of the metadata format
+ * @pad: media pad
+ * @lock: protects vb2_q, vdev
+ * @isp: pointer to c3_isp_device
+ * @buff: in use buffer
+ * @buff_lock: protects stats buffer
+ * @pending: stats buffer list head
+ */
+struct c3_isp_params {
+	struct vb2_queue vb2_q;
+	struct video_device vdev;
+	struct v4l2_format vfmt;
+	struct media_pad pad;
+
+	struct mutex lock; /* Protects vb2_q, vdev */
+	struct c3_isp_device *isp;
+
+	struct c3_isp_params_buffer *buff;
+	spinlock_t buff_lock; /* Protects params buffer */
+	struct list_head pending;
+};
+
+/*
+ * struct c3_isp_capture - ISP capture device
+ *
+ * @id: capture device ID
+ * @vb2_q: vb2 buffer queue
+ * @vdev: video node
+ * @pad: media pad
+ * @lock: protects vb2_q, vdev
+ * @isp: pointer to c3_isp_device
+ * @rsz: pointer to c3_isp_resizer
+ * @buff: in use buffer
+ * @buff_lock: protects capture buffer
+ * @pending: capture buffer list head
+ * @format.info: a pointer to the c3_isp_capture_format of the pixel format
+ * @format.fmt: buffer format
+ */
+struct c3_isp_capture {
+	enum c3_isp_cap_devs id;
+	struct vb2_queue vb2_q;
+	struct video_device vdev;
+	struct media_pad pad;
+
+	struct mutex lock; /* Protects vb2_q, vdev */
+	struct c3_isp_device *isp;
+	struct c3_isp_resizer *rsz;
+
+	struct c3_isp_dummy_buffer dummy_buff;
+	struct c3_isp_cap_buffer *buff;
+	spinlock_t buff_lock; /* Protects stream buffer */
+	struct list_head pending;
+	struct {
+		const struct c3_isp_cap_format_info *info;
+		struct v4l2_pix_format_mplane pix_mp;
+	} format;
+};
+
+/**
+ * struct c3_isp_info - ISP information
+ *
+ * @clocks: array of ISP clock names
+ * @clock_num: actual clock number
+ */
+struct c3_isp_info {
+	char *clocks[C3_ISP_CLOCK_NUM_MAX];
+	u32 clock_num;
+};
+
+/**
+ * struct c3_isp_device - ISP platform device
+ *
+ * @dev: pointer to the struct device
+ * @base: base register address
+ * @clks: array of clocks
+ * @notifier: notifier to register on the v4l2-async API
+ * @v4l2_dev: v4l2_device variable
+ * @media_dev: media device variable
+ * @pipe: media pipeline
+ * @core: ISP core subdev
+ * @resizers: ISP resizer subdev
+ * @stats: ISP stats device
+ * @params: ISP params device
+ * @caps: array of ISP capture device
+ * @frm_sequence: used to record frame id
+ * @info: version-specific ISP information
+ */
+struct c3_isp_device {
+	struct device *dev;
+	void __iomem *base;
+	struct clk_bulk_data clks[C3_ISP_CLOCK_NUM_MAX];
+
+	struct v4l2_async_notifier notifier;
+	struct v4l2_device v4l2_dev;
+	struct media_device media_dev;
+	struct media_pipeline pipe;
+
+	struct c3_isp_core core;
+	struct c3_isp_resizer resizers[C3_ISP_NUM_RSZ];
+	struct c3_isp_stats stats;
+	struct c3_isp_params params;
+	struct c3_isp_capture caps[C3_ISP_NUM_CAP_DEVS];
+
+	u32 frm_sequence;
+	const struct c3_isp_info *info;
+};
+
+u32 c3_isp_read(struct c3_isp_device *isp, u32 reg);
+void c3_isp_write(struct c3_isp_device *isp, u32 reg, u32 val);
+void c3_isp_update_bits(struct c3_isp_device *isp, u32 reg, u32 mask, u32 val);
+
+void c3_isp_core_queue_sof(struct c3_isp_device *isp);
+int c3_isp_core_register(struct c3_isp_device *isp);
+void c3_isp_core_unregister(struct c3_isp_device *isp);
+int c3_isp_resizers_register(struct c3_isp_device *isp);
+void c3_isp_resizers_unregister(struct c3_isp_device *isp);
+int c3_isp_captures_register(struct c3_isp_device *isp);
+void c3_isp_captures_unregister(struct c3_isp_device *isp);
+void c3_isp_captures_isr(struct c3_isp_device *isp);
+void c3_isp_stats_pre_cfg(struct c3_isp_device *isp);
+int c3_isp_stats_register(struct c3_isp_device *isp);
+void c3_isp_stats_unregister(struct c3_isp_device *isp);
+void c3_isp_stats_isr(struct c3_isp_device *isp);
+void c3_isp_params_pre_cfg(struct c3_isp_device *isp);
+int c3_isp_params_register(struct c3_isp_device *isp);
+void c3_isp_params_unregister(struct c3_isp_device *isp);
+void c3_isp_params_isr(struct c3_isp_device *isp);
+
+#endif
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
new file mode 100644
index 000000000000..ff6413fff889
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
@@ -0,0 +1,641 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/media/amlogic/c3-isp-config.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-event.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+
+#define C3_ISP_CORE_SUBDEV_NAME		"c3-isp-core"
+
+#define C3_ISP_PHASE_OFFSET_0		0
+#define C3_ISP_PHASE_OFFSET_1		1
+#define C3_ISP_PHASE_OFFSET_NONE	0xff
+
+#define C3_ISP_CORE_DEF_SINK_PAD_FMT	MEDIA_BUS_FMT_SRGGB10_1X10
+#define C3_ISP_CORE_DEF_SRC_PAD_FMT	MEDIA_BUS_FMT_YUV10_1X30
+
+/*
+ * struct c3_isp_core_format_info - ISP core format information
+ *
+ * @mbus_code: the mbus code
+ * @pads: bitmask detailing valid pads for this mbus_code
+ * @xofst: horizontal phase offset of hardware
+ * @yofst: vertical phase offset of hardware
+ * @is_raw: the raw format flag of mbus code
+ */
+struct c3_isp_core_format_info {
+	u32 mbus_code;
+	u32 pads;
+	u8 xofst;
+	u8 yofst;
+	bool is_raw;
+};
+
+static const struct c3_isp_core_format_info c3_isp_core_fmts[] = {
+	/* RAW formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_0)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_1)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_2),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_0)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_1)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_2),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_0)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_1)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_2),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.is_raw		= true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_0)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_1)
+				| BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_2),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.is_raw		= true,
+	},
+	/* YUV formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUV10_1X30,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_0) |
+				  BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_1) |
+				  BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO_2),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.is_raw		= false,
+	},
+};
+
+static const struct c3_isp_core_format_info
+*core_find_format_by_code(u32 code, u32 pad)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(c3_isp_core_fmts); i++) {
+		const struct c3_isp_core_format_info *info =
+			&c3_isp_core_fmts[i];
+
+		if (info->mbus_code == code && info->pads & BIT(pad))
+			return info;
+	}
+
+	return NULL;
+}
+
+static const struct c3_isp_core_format_info
+*core_find_format_by_index(u32 index, u32 pad)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(c3_isp_core_fmts); i++) {
+		const struct c3_isp_core_format_info *info =
+			&c3_isp_core_fmts[i];
+
+		if (!(info->pads & BIT(pad)))
+			continue;
+
+		if (!index)
+			return info;
+
+		index--;
+	}
+
+	return NULL;
+}
+
+static void c3_isp_core_enable(struct c3_isp_device *isp)
+{
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_EN, ISP_TOP_IRQ_EN_FRM_END_MASK,
+			   ISP_TOP_IRQ_EN_FRM_END_EN);
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_EN, ISP_TOP_IRQ_EN_FRM_RST_MASK,
+			   ISP_TOP_IRQ_EN_FRM_RST_EN);
+
+	/* Enable image data to ISP core */
+	c3_isp_update_bits(isp, ISP_TOP_PATH_SEL, ISP_TOP_PATH_SEL_CORE_MASK,
+			   ISP_TOP_PATH_SEL_CORE_MIPI_CORE);
+}
+
+static void c3_isp_core_disable(struct c3_isp_device *isp)
+{
+	/* Disable image data to ISP core */
+	c3_isp_update_bits(isp, ISP_TOP_PATH_SEL, ISP_TOP_PATH_SEL_CORE_MASK,
+			   ISP_TOP_PATH_SEL_CORE_CORE_DIS);
+
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_EN, ISP_TOP_IRQ_EN_FRM_END_MASK,
+			   ISP_TOP_IRQ_EN_FRM_END_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_EN, ISP_TOP_IRQ_EN_FRM_RST_MASK,
+			   ISP_TOP_IRQ_EN_FRM_RST_DIS);
+}
+
+/* Set the phase offset of blc, wb and lns */
+static void c3_isp_core_lswb_ofst(struct c3_isp_device *isp,
+				  u8 xofst, u8 yofst)
+{
+	c3_isp_update_bits(isp, ISP_LSWB_BLC_PHSOFST,
+			   ISP_LSWB_BLC_PHSOFST_HORIZ_OFST_MASK,
+			   ISP_LSWB_BLC_PHSOFST_HORIZ_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_LSWB_BLC_PHSOFST,
+			   ISP_LSWB_BLC_PHSOFST_VERT_OFST_MASK,
+			   ISP_LSWB_BLC_PHSOFST_VERT_OFST(yofst));
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_PHSOFST,
+			   ISP_LSWB_WB_PHSOFST_HORIZ_OFST_MASK,
+			   ISP_LSWB_WB_PHSOFST_HORIZ_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_LSWB_WB_PHSOFST,
+			   ISP_LSWB_WB_PHSOFST_VERT_OFST_MASK,
+			   ISP_LSWB_WB_PHSOFST_VERT_OFST(yofst));
+
+	c3_isp_update_bits(isp, ISP_LSWB_LNS_PHSOFST,
+			   ISP_LSWB_LNS_PHSOFST_HORIZ_OFST_MASK,
+			   ISP_LSWB_LNS_PHSOFST_HORIZ_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_LSWB_LNS_PHSOFST,
+			   ISP_LSWB_LNS_PHSOFST_VERT_OFST_MASK,
+			   ISP_LSWB_LNS_PHSOFST_VERT_OFST(yofst));
+}
+
+/* Set the phase offset of af, ae and awb */
+static void c3_isp_core_3a_ofst(struct c3_isp_device *isp,
+				u8 xofst, u8 yofst)
+{
+	c3_isp_update_bits(isp, ISP_AF_CTRL, ISP_AF_CTRL_HORIZ_OFST_MASK,
+			   ISP_AF_CTRL_HORIZ_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_AF_CTRL, ISP_AF_CTRL_VERT_OFST_MASK,
+			   ISP_AF_CTRL_VERT_OFST(yofst));
+
+	c3_isp_update_bits(isp, ISP_AE_CTRL, ISP_AE_CTRL_HORIZ_OFST_MASK,
+			   ISP_AE_CTRL_HORIZ_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_AE_CTRL, ISP_AE_CTRL_VERT_OFST_MASK,
+			   ISP_AE_CTRL_VERT_OFST(yofst));
+
+	c3_isp_update_bits(isp, ISP_AWB_CTRL, ISP_AWB_CTRL_HORIZ_OFST_MASK,
+			   ISP_AWB_CTRL_HORIZ_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_AWB_CTRL, ISP_AWB_CTRL_VERT_OFST_MASK,
+			   ISP_AWB_CTRL_VERT_OFST(yofst));
+}
+
+/* Set the phase offset of demosaic */
+static void c3_isp_core_dms_ofst(struct c3_isp_device *isp,
+				 u8 xofst, u8 yofst)
+{
+	c3_isp_update_bits(isp, ISP_DMS_COMMON_PARAM0,
+			   ISP_DMS_COMMON_PARAM0_HORIZ_PHS_OFST_MASK,
+			   ISP_DMS_COMMON_PARAM0_HORIZ_PHS_OFST(xofst));
+	c3_isp_update_bits(isp, ISP_DMS_COMMON_PARAM0,
+			   ISP_DMS_COMMON_PARAM0_VERT_PHS_OFST_MASK,
+			   ISP_DMS_COMMON_PARAM0_VERT_PHS_OFST(yofst));
+}
+
+static void c3_isp_core_cfg_format(struct c3_isp_device *isp,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	const struct c3_isp_core_format_info *isp_fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_VIDEO);
+	isp_fmt = core_find_format_by_code(fmt->code,
+					   C3_ISP_CORE_PAD_SINK_VIDEO);
+
+	c3_isp_write(isp, ISP_TOP_INPUT_SIZE,
+		     ISP_TOP_INPUT_SIZE_HORIZ_SIZE(fmt->width) |
+		     ISP_TOP_INPUT_SIZE_VERT_SIZE(fmt->height));
+	c3_isp_write(isp, ISP_TOP_FRM_SIZE,
+		     ISP_TOP_FRM_SIZE_CORE_HORIZ_SIZE(fmt->width) |
+		     ISP_TOP_FRM_SIZE_CORE_VERT_SIZE(fmt->height));
+
+	c3_isp_update_bits(isp, ISP_TOP_HOLD_SIZE,
+			   ISP_TOP_HOLD_SIZE_CORE_HORIZ_SIZE_MASK,
+			   ISP_TOP_HOLD_SIZE_CORE_HORIZ_SIZE(fmt->width));
+
+	c3_isp_write(isp, ISP_AF_HV_SIZE,
+		     ISP_AF_HV_SIZE_GLB_WIN_XSIZE(fmt->width) |
+		     ISP_AF_HV_SIZE_GLB_WIN_YSIZE(fmt->height));
+	c3_isp_write(isp, ISP_AE_HV_SIZE,
+		     ISP_AE_HV_SIZE_HORIZ_SIZE(fmt->width) |
+		     ISP_AE_HV_SIZE_VERT_SIZE(fmt->height));
+	c3_isp_write(isp, ISP_AWB_HV_SIZE,
+		     ISP_AWB_HV_SIZE_HORIZ_SIZE(fmt->width) |
+		     ISP_AWB_HV_SIZE_VERT_SIZE(fmt->height));
+
+	c3_isp_core_lswb_ofst(isp, isp_fmt->xofst, isp_fmt->yofst);
+	c3_isp_core_3a_ofst(isp, isp_fmt->xofst, isp_fmt->yofst);
+	c3_isp_core_dms_ofst(isp, isp_fmt->xofst, isp_fmt->yofst);
+}
+
+static bool c3_isp_core_streams_ready(struct c3_isp_core *core)
+{
+	unsigned int n_links = 0;
+	struct media_link *link;
+
+	for_each_media_entity_data_link(&core->sd.entity, link) {
+		if ((link->source->index == C3_ISP_CORE_PAD_SOURCE_VIDEO_0 ||
+		     link->source->index == C3_ISP_CORE_PAD_SOURCE_VIDEO_1 ||
+		     link->source->index == C3_ISP_CORE_PAD_SOURCE_VIDEO_2) &&
+		    link->flags == MEDIA_LNK_FL_ENABLED)
+			n_links++;
+	}
+
+	return n_links == core->isp->pipe.start_count;
+}
+
+static int c3_isp_core_enable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct c3_isp_core *core = v4l2_get_subdevdata(sd);
+	struct media_pad *sink_pad;
+	struct v4l2_subdev *src_sd;
+	int ret;
+
+	if (!c3_isp_core_streams_ready(core))
+		return 0;
+
+	core->isp->frm_sequence = 0;
+	c3_isp_core_cfg_format(core->isp, state);
+	c3_isp_core_enable(core->isp);
+
+	sink_pad = &core->pads[C3_ISP_CORE_PAD_SINK_VIDEO];
+	core->src_pad = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(core->src_pad)) {
+		dev_dbg(core->isp->dev,
+			"Failed to get source pad for ISP core\n");
+		return -EPIPE;
+	}
+
+	src_sd = media_entity_to_v4l2_subdev(core->src_pad->entity);
+
+	ret = v4l2_subdev_enable_streams(src_sd, core->src_pad->index, BIT(0));
+	if (ret) {
+		c3_isp_core_disable(core->isp);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int c3_isp_core_disable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       u32 pad, u64 streams_mask)
+{
+	struct c3_isp_core *core = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *src_sd;
+
+	if (core->isp->pipe.start_count != 1)
+		return 0;
+
+	if (core->src_pad) {
+		src_sd = media_entity_to_v4l2_subdev(core->src_pad->entity);
+		v4l2_subdev_disable_streams(src_sd, core->src_pad->index,
+					    BIT(0));
+	}
+	core->src_pad = NULL;
+
+	c3_isp_core_disable(core->isp);
+
+	return 0;
+}
+
+static int c3_isp_core_enum_mbus_code(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct c3_isp_core_format_info *info;
+
+	switch (code->pad) {
+	case C3_ISP_CORE_PAD_SINK_VIDEO:
+	case C3_ISP_CORE_PAD_SOURCE_VIDEO_0:
+	case C3_ISP_CORE_PAD_SOURCE_VIDEO_1:
+	case C3_ISP_CORE_PAD_SOURCE_VIDEO_2:
+		info = core_find_format_by_index(code->index, code->pad);
+		if (!info)
+			return -EINVAL;
+
+		code->code = info->mbus_code;
+
+		break;
+	case C3_ISP_CORE_PAD_SINK_PARAMS:
+	case C3_ISP_CORE_PAD_SOURCE_STATS:
+		if (code->index)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void c3_isp_core_set_sink_fmt(struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	const struct c3_isp_core_format_info *isp_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, format->pad);
+
+	isp_fmt = core_find_format_by_code(format->format.code, format->pad);
+	if (!isp_fmt)
+		sink_fmt->code = C3_ISP_CORE_DEF_SINK_PAD_FMT;
+	else
+		sink_fmt->code = format->format.code;
+
+	sink_fmt->width = clamp_t(u32, format->format.width,
+				  C3_ISP_MIN_WIDTH, C3_ISP_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, format->format.height,
+				   C3_ISP_MIN_HEIGHT, C3_ISP_MAX_HEIGHT);
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	for (unsigned int i = C3_ISP_CORE_PAD_SOURCE_VIDEO_0;
+	     i < C3_ISP_CORE_PAD_MAX; i++) {
+		src_fmt = v4l2_subdev_state_get_format(state, i);
+
+		src_fmt->width  = sink_fmt->width;
+		src_fmt->height = sink_fmt->height;
+	}
+
+	format->format = *sink_fmt;
+}
+
+static void c3_isp_core_set_source_fmt(struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_format *format)
+{
+	const struct c3_isp_core_format_info *isp_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						C3_ISP_CORE_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(state, format->pad);
+
+	isp_fmt = core_find_format_by_code(format->format.code, format->pad);
+	if (!isp_fmt)
+		src_fmt->code = C3_ISP_CORE_DEF_SRC_PAD_FMT;
+	else
+		src_fmt->code = format->format.code;
+
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+	if (isp_fmt && isp_fmt->is_raw) {
+		src_fmt->colorspace = V4L2_COLORSPACE_RAW;
+		src_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	} else {
+		src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+		src_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+
+	format->format = *src_fmt;
+}
+
+static int c3_isp_core_set_fmt(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_format *format)
+{
+	if (format->pad == C3_ISP_CORE_PAD_SINK_VIDEO)
+		c3_isp_core_set_sink_fmt(state, format);
+	else if (format->pad == C3_ISP_CORE_PAD_SOURCE_VIDEO_0 ||
+		 format->pad == C3_ISP_CORE_PAD_SOURCE_VIDEO_1 ||
+		 format->pad == C3_ISP_CORE_PAD_SOURCE_VIDEO_2)
+		c3_isp_core_set_source_fmt(state, format);
+	else
+		format->format =
+			*v4l2_subdev_state_get_format(state, format->pad);
+
+	return 0;
+}
+
+static int c3_isp_core_init_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	/* Video sink pad */
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_VIDEO);
+	fmt->width = C3_ISP_DEFAULT_WIDTH;
+	fmt->height = C3_ISP_DEFAULT_HEIGHT;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = C3_ISP_CORE_DEF_SINK_PAD_FMT;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	/* Video source pad */
+	for (unsigned int i = C3_ISP_CORE_PAD_SOURCE_VIDEO_0;
+	     i < C3_ISP_CORE_PAD_MAX; i++) {
+		fmt = v4l2_subdev_state_get_format(state, i);
+		fmt->width = C3_ISP_DEFAULT_WIDTH;
+		fmt->height = C3_ISP_DEFAULT_HEIGHT;
+		fmt->field = V4L2_FIELD_NONE;
+		fmt->code = C3_ISP_CORE_DEF_SRC_PAD_FMT;
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
+		fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+		fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+
+	/* Parameters pad */
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_PARAMS);
+	fmt->width = 0;
+	fmt->height = 0;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
+	/* Statistics pad */
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SOURCE_STATS);
+	fmt->width = 0;
+	fmt->height = 0;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
+	return 0;
+}
+
+static int c3_isp_core_subscribe_event(struct v4l2_subdev *sd,
+				       struct v4l2_fh *fh,
+				       struct v4l2_event_subscription *sub)
+{
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return -EINVAL;
+
+	/* V4L2_EVENT_FRAME_SYNC doesn't need id, so should set 0 */
+	if (sub->id != 0)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, NULL);
+}
+
+static const struct v4l2_subdev_pad_ops c3_isp_core_pad_ops = {
+	.enum_mbus_code = c3_isp_core_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = c3_isp_core_set_fmt,
+	.enable_streams = c3_isp_core_enable_streams,
+	.disable_streams = c3_isp_core_disable_streams,
+};
+
+static const struct v4l2_subdev_core_ops c3_isp_core_core_ops = {
+	.subscribe_event = c3_isp_core_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops c3_isp_core_subdev_ops = {
+	.core = &c3_isp_core_core_ops,
+	.pad = &c3_isp_core_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops c3_isp_core_internal_ops = {
+	.init_state = c3_isp_core_init_state,
+};
+
+static int c3_isp_core_link_validate(struct media_link *link)
+{
+	if (link->sink->index == C3_ISP_CORE_PAD_SINK_PARAMS)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
+/* Media entity operations */
+static const struct media_entity_operations c3_isp_core_entity_ops = {
+	.link_validate = c3_isp_core_link_validate,
+};
+
+void c3_isp_core_queue_sof(struct c3_isp_device *isp)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	event.u.frame_sync.frame_sequence = isp->frm_sequence;
+	v4l2_event_queue(isp->core.sd.devnode, &event);
+}
+
+int c3_isp_core_register(struct c3_isp_device *isp)
+{
+	struct c3_isp_core *core = &isp->core;
+	struct v4l2_subdev *sd = &core->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &c3_isp_core_subdev_ops);
+	sd->owner = THIS_MODULE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->internal_ops = &c3_isp_core_internal_ops;
+	snprintf(sd->name, sizeof(sd->name), "%s", C3_ISP_CORE_SUBDEV_NAME);
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &c3_isp_core_entity_ops;
+
+	core->isp = isp;
+	sd->dev = isp->dev;
+	v4l2_set_subdevdata(sd, core);
+
+	core->pads[C3_ISP_CORE_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK;
+	core->pads[C3_ISP_CORE_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
+	core->pads[C3_ISP_CORE_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	core->pads[C3_ISP_CORE_PAD_SOURCE_VIDEO_0].flags = MEDIA_PAD_FL_SOURCE;
+	core->pads[C3_ISP_CORE_PAD_SOURCE_VIDEO_1].flags = MEDIA_PAD_FL_SOURCE;
+	core->pads[C3_ISP_CORE_PAD_SOURCE_VIDEO_2].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, C3_ISP_CORE_PAD_MAX,
+				     core->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_device_register_subdev(&isp->v4l2_dev, sd);
+	if (ret)
+		goto err_subdev_cleanup;
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+void c3_isp_core_unregister(struct c3_isp_device *isp)
+{
+	struct c3_isp_core *core = &isp->core;
+	struct v4l2_subdev *sd = &core->sd;
+
+	v4l2_device_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+}
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c
new file mode 100644
index 000000000000..c3b779f63088
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+
+u32 c3_isp_read(struct c3_isp_device *isp, u32 reg)
+{
+	return readl(isp->base + reg);
+}
+
+void c3_isp_write(struct c3_isp_device *isp, u32 reg, u32 val)
+{
+	writel(val, isp->base + reg);
+}
+
+void c3_isp_update_bits(struct c3_isp_device *isp, u32 reg, u32 mask, u32 val)
+{
+	u32 orig, tmp;
+
+	orig = c3_isp_read(isp, reg);
+
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+
+	if (tmp != orig)
+		c3_isp_write(isp, reg, tmp);
+}
+
+/* PM runtime suspend */
+static int c3_isp_runtime_suspend(struct device *dev)
+{
+	struct c3_isp_device *isp = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(isp->info->clock_num, isp->clks);
+
+	return 0;
+}
+
+/* PM runtime resume */
+static int c3_isp_runtime_resume(struct device *dev)
+{
+	struct c3_isp_device *isp = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(isp->info->clock_num, isp->clks);
+}
+
+static const struct dev_pm_ops c3_isp_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+			    pm_runtime_force_resume)
+	RUNTIME_PM_OPS(c3_isp_runtime_suspend,
+		       c3_isp_runtime_resume, NULL)
+};
+
+/* IRQ handling */
+static irqreturn_t c3_isp_irq_handler(int irq, void *dev)
+{
+	struct c3_isp_device *isp = dev;
+	u32 status;
+
+	/* Get irq status and clear irq status */
+	status = c3_isp_read(isp, ISP_TOP_RO_IRQ_STAT);
+	c3_isp_write(isp, ISP_TOP_IRQ_CLR, status);
+
+	if (status & ISP_TOP_RO_IRQ_STAT_FRM_END_MASK) {
+		c3_isp_stats_isr(isp);
+		c3_isp_params_isr(isp);
+		c3_isp_captures_isr(isp);
+		isp->frm_sequence++;
+	}
+
+	if (status & ISP_TOP_RO_IRQ_STAT_FRM_RST_MASK)
+		c3_isp_core_queue_sof(isp);
+
+	return IRQ_HANDLED;
+}
+
+/* Subdev notifier register */
+static int c3_isp_notify_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *sd,
+			       struct v4l2_async_connection *asc)
+{
+	struct c3_isp_device *isp =
+		container_of(notifier, struct c3_isp_device, notifier);
+	struct media_pad *sink =
+		&isp->core.sd.entity.pads[C3_ISP_CORE_PAD_SINK_VIDEO];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
+					       MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static int c3_isp_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct c3_isp_device *isp =
+		container_of(notifier, struct c3_isp_device, notifier);
+
+	return v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations c3_isp_notify_ops = {
+	.bound = c3_isp_notify_bound,
+	.complete = c3_isp_notify_complete,
+};
+
+static int c3_isp_async_nf_register(struct c3_isp_device *isp)
+{
+	struct v4l2_async_connection *asc;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_nf_init(&isp->notifier, &isp->v4l2_dev);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	asc = v4l2_async_nf_add_fwnode_remote(&isp->notifier, ep,
+					      struct v4l2_async_connection);
+	fwnode_handle_put(ep);
+
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
+
+	isp->notifier.ops = &c3_isp_notify_ops;
+	ret = v4l2_async_nf_register(&isp->notifier);
+	if (ret)
+		v4l2_async_nf_cleanup(&isp->notifier);
+
+	return ret;
+}
+
+static void c3_isp_async_nf_unregister(struct c3_isp_device *isp)
+{
+	v4l2_async_nf_unregister(&isp->notifier);
+	v4l2_async_nf_cleanup(&isp->notifier);
+}
+
+static int c3_isp_media_register(struct c3_isp_device *isp)
+{
+	struct media_device *media_dev = &isp->media_dev;
+	struct v4l2_device *v4l2_dev = &isp->v4l2_dev;
+	int ret;
+
+	/* Initialize media device */
+	strscpy(media_dev->model, C3_ISP_DRIVER_NAME, sizeof(media_dev->model));
+	media_dev->dev = isp->dev;
+
+	media_device_init(media_dev);
+
+	/* Initialize v4l2 device */
+	v4l2_dev->mdev = media_dev;
+	strscpy(v4l2_dev->name, C3_ISP_DRIVER_NAME, sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(isp->dev, v4l2_dev);
+	if (ret)
+		goto err_media_dev_cleanup;
+
+	ret = media_device_register(&isp->media_dev);
+	if (ret) {
+		dev_err(isp->dev, "Failed to register media device: %d\n", ret);
+		goto err_unreg_v4l2_dev;
+	}
+
+	return 0;
+
+err_unreg_v4l2_dev:
+	v4l2_device_unregister(&isp->v4l2_dev);
+err_media_dev_cleanup:
+	media_device_cleanup(media_dev);
+	return ret;
+}
+
+static void c3_isp_media_unregister(struct c3_isp_device *isp)
+{
+	media_device_unregister(&isp->media_dev);
+	v4l2_device_unregister(&isp->v4l2_dev);
+	media_device_cleanup(&isp->media_dev);
+}
+
+static void c3_isp_remove_links(struct c3_isp_device *isp)
+{
+	unsigned int i;
+
+	media_entity_remove_links(&isp->core.sd.entity);
+
+	for (i = 0; i < C3_ISP_NUM_RSZ; i++)
+		media_entity_remove_links(&isp->resizers[i].sd.entity);
+
+	for (i = 0; i < C3_ISP_NUM_CAP_DEVS; i++)
+		media_entity_remove_links(&isp->caps[i].vdev.entity);
+}
+
+static int c3_isp_create_links(struct c3_isp_device *isp)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < C3_ISP_NUM_RSZ; i++) {
+		ret = media_create_pad_link(&isp->resizers[i].sd.entity,
+					    C3_ISP_RSZ_PAD_SOURCE,
+					    &isp->caps[i].vdev.entity, 0,
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+		if (ret) {
+			dev_err(isp->dev,
+				"Failed to link rsz %u and cap %u\n", i, i);
+			goto err_remove_links;
+		}
+
+		ret = media_create_pad_link(&isp->core.sd.entity,
+					    C3_ISP_CORE_PAD_SOURCE_VIDEO_0 + i,
+					    &isp->resizers[i].sd.entity,
+					    C3_ISP_RSZ_PAD_SINK,
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			dev_err(isp->dev,
+				"Failed to link core and rsz %u\n", i);
+			goto err_remove_links;
+		}
+	}
+
+	ret = media_create_pad_link(&isp->core.sd.entity,
+				    C3_ISP_CORE_PAD_SOURCE_STATS,
+				    &isp->stats.vdev.entity,
+				    0, MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(isp->dev, "Failed to link core and stats\n");
+		goto err_remove_links;
+	}
+
+	ret = media_create_pad_link(&isp->params.vdev.entity, 0,
+				    &isp->core.sd.entity,
+				    C3_ISP_CORE_PAD_SINK_PARAMS,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(isp->dev, "Failed to link params and core\n");
+		goto err_remove_links;
+	}
+
+	return 0;
+
+err_remove_links:
+	c3_isp_remove_links(isp);
+	return ret;
+}
+
+static int c3_isp_videos_register(struct c3_isp_device *isp)
+{
+	int ret;
+
+	ret = c3_isp_captures_register(isp);
+	if (ret)
+		return ret;
+
+	ret = c3_isp_stats_register(isp);
+	if (ret)
+		goto err_captures_unregister;
+
+	ret = c3_isp_params_register(isp);
+	if (ret)
+		goto err_stats_unregister;
+
+	ret = c3_isp_create_links(isp);
+	if (ret)
+		goto err_params_unregister;
+
+	return 0;
+
+err_params_unregister:
+	c3_isp_params_unregister(isp);
+err_stats_unregister:
+	c3_isp_stats_unregister(isp);
+err_captures_unregister:
+	c3_isp_captures_unregister(isp);
+	return ret;
+}
+
+static void c3_isp_videos_unregister(struct c3_isp_device *isp)
+{
+	c3_isp_remove_links(isp);
+	c3_isp_params_unregister(isp);
+	c3_isp_stats_unregister(isp);
+	c3_isp_captures_unregister(isp);
+}
+
+static int c3_isp_get_clocks(struct c3_isp_device *isp)
+{
+	const struct c3_isp_info *info = isp->info;
+
+	for (unsigned int i = 0; i < info->clock_num; i++)
+		isp->clks[i].id = info->clocks[i];
+
+	return devm_clk_bulk_get(isp->dev, info->clock_num, isp->clks);
+}
+
+static int c3_isp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct c3_isp_device *isp;
+	int irq;
+	int ret;
+
+	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
+	if (!isp)
+		return -ENOMEM;
+
+	isp->info = of_device_get_match_data(dev);
+	isp->dev = dev;
+
+	isp->base = devm_platform_ioremap_resource_byname(pdev, "isp");
+	if (IS_ERR(isp->base))
+		return dev_err_probe(dev, PTR_ERR(isp->base),
+				     "Failed to ioremap resource\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = c3_isp_get_clocks(isp);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	platform_set_drvdata(pdev, isp);
+
+	pm_runtime_enable(dev);
+
+	ret = c3_isp_media_register(isp);
+	if (ret)
+		goto err_runtime_disable;
+
+	ret = c3_isp_core_register(isp);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	ret = c3_isp_resizers_register(isp);
+	if (ret)
+		goto err_core_unregister;
+
+	ret = c3_isp_async_nf_register(isp);
+	if (ret)
+		goto err_resizers_unregister;
+
+	ret = devm_request_irq(dev, irq,
+			       c3_isp_irq_handler, IRQF_SHARED,
+			       dev_driver_string(dev), isp);
+	if (ret)
+		goto err_nf_unregister;
+
+	ret = c3_isp_videos_register(isp);
+	if (ret)
+		goto err_nf_unregister;
+
+	return 0;
+
+err_nf_unregister:
+	c3_isp_async_nf_unregister(isp);
+err_resizers_unregister:
+	c3_isp_resizers_unregister(isp);
+err_core_unregister:
+	c3_isp_core_unregister(isp);
+err_v4l2_unregister:
+	c3_isp_media_unregister(isp);
+err_runtime_disable:
+	pm_runtime_disable(dev);
+	return ret;
+};
+
+static void c3_isp_remove(struct platform_device *pdev)
+{
+	struct c3_isp_device *isp = platform_get_drvdata(pdev);
+
+	c3_isp_videos_unregister(isp);
+	c3_isp_async_nf_unregister(isp);
+	c3_isp_core_unregister(isp);
+	c3_isp_resizers_unregister(isp);
+	c3_isp_media_unregister(isp);
+	pm_runtime_disable(isp->dev);
+};
+
+static const struct c3_isp_info isp_info = {
+	.clocks = {"vapb", "isp0"},
+	.clock_num = 2
+};
+
+static const struct of_device_id c3_isp_of_match[] = {
+	{ .compatible = "amlogic,c3-isp",
+	  .data = &isp_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, c3_isp_of_match);
+
+static struct platform_driver c3_isp_driver = {
+	.probe = c3_isp_probe,
+	.remove = c3_isp_remove,
+	.driver = {
+		.name = "c3-isp",
+		.of_match_table = c3_isp_of_match,
+		.pm = pm_ptr(&c3_isp_pm_ops),
+	},
+};
+
+module_platform_driver(c3_isp_driver);
+
+MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
+MODULE_DESCRIPTION("Amlogic C3 ISP pipeline");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
new file mode 100644
index 000000000000..0e0b5d61654a
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -0,0 +1,1010 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/cleanup.h>
+#include <linux/media/amlogic/c3-isp-config.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+
+/*
+ * union c3_isp_params_block - Generalisation of a parameter block
+ *
+ * This union allows the driver to treat a block as a generic struct to this
+ * union and safely access the header and block-specific struct without having
+ * to resort to casting. The header member is accessed first, and the type field
+ * checked which allows the driver to determine which of the other members
+ * should be used.
+ *
+ * @header:		The shared header struct embedded as the first member
+ *			of all the possible other members. This member would be
+ *			accessed first and the type field checked to determine
+ *			which of the other members should be accessed.
+ * @awb_gains:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_GAINS
+ * @awb_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AWB_CONFIG
+ * @ae_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AE_CONFIG
+ * @af_cfg:		For header.type == C3_ISP_PARAMS_BLOCK_AF_CONFIG
+ * @pst_gamma:		For header.type == C3_ISP_PARAMS_BLOCK_PST_GAMMA
+ * @ccm:		For header.type == C3_ISP_PARAMS_BLOCK_CCM
+ * @csc:		For header.type == C3_ISP_PARAMS_BLOCK_CSC
+ * @blc:		For header.type == C3_ISP_PARAMS_BLOCK_BLC
+ */
+union c3_isp_params_block {
+	struct c3_isp_params_block_header header;
+	struct c3_isp_params_awb_gains awb_gains;
+	struct c3_isp_params_awb_config awb_cfg;
+	struct c3_isp_params_ae_config ae_cfg;
+	struct c3_isp_params_af_config af_cfg;
+	struct c3_isp_params_pst_gamma pst_gamma;
+	struct c3_isp_params_ccm ccm;
+	struct c3_isp_params_csc csc;
+	struct c3_isp_params_blc blc;
+};
+
+typedef void (*c3_isp_block_handler)(struct c3_isp_device *isp,
+				     const union c3_isp_params_block *block);
+
+struct c3_isp_params_handler {
+	size_t size;
+	c3_isp_block_handler handler;
+};
+
+#define to_c3_isp_params_buffer(vbuf) \
+	container_of(vbuf, struct c3_isp_params_buffer, vb)
+
+/* Hardware configuration */
+
+static void c3_isp_params_cfg_awb_gains(struct c3_isp_device *isp,
+					const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_awb_gains *awb_gains = &block->awb_gains;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
+				   ISP_TOP_BEO_CTRL_WB_DIS);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN0,
+			   ISP_LSWB_WB_GAIN0_GR_GAIN_MASK,
+			   ISP_LSWB_WB_GAIN0_GR_GAIN(awb_gains->gr_gain));
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN0,
+			   ISP_LSWB_WB_GAIN0_R_GAIN_MASK,
+			   ISP_LSWB_WB_GAIN0_R_GAIN(awb_gains->r_gain));
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN1,
+			   ISP_LSWB_WB_GAIN1_B_GAIN_MASK,
+			   ISP_LSWB_WB_GAIN1_B_GAIN(awb_gains->b_gain));
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN1,
+			   ISP_LSWB_WB_GAIN1_GB_GAIN_MASK,
+			   ISP_LSWB_WB_GAIN1_GB_GAIN(awb_gains->gb_gain));
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN2,
+			   ISP_LSWB_WB_GAIN2_IR_GAIN_MASK,
+			   ISP_LSWB_WB_GAIN2_IR_GAIN(awb_gains->gb_gain));
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+				   ISP_TOP_BEO_CTRL_WB_EN_MASK,
+				   ISP_TOP_BEO_CTRL_WB_EN);
+}
+
+static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
+				 const struct c3_isp_params_awb_config *cfg)
+{
+	unsigned int zones_num;
+	unsigned int base;
+	unsigned int data;
+	unsigned int i;
+
+	/* Set the weight address to 0 position */
+	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
+
+	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+
+	/* Need to write 8 weights at once */
+	for (i = 0; i < zones_num / 8; i++) {
+		base = i * 8;
+		data = ISP_AWB_BLK_WT_DATA_WT(0, cfg->zone_weight[base + 0]) |
+		       ISP_AWB_BLK_WT_DATA_WT(1, cfg->zone_weight[base + 1]) |
+		       ISP_AWB_BLK_WT_DATA_WT(2, cfg->zone_weight[base + 2]) |
+		       ISP_AWB_BLK_WT_DATA_WT(3, cfg->zone_weight[base + 3]) |
+		       ISP_AWB_BLK_WT_DATA_WT(4, cfg->zone_weight[base + 4]) |
+		       ISP_AWB_BLK_WT_DATA_WT(5, cfg->zone_weight[base + 5]) |
+		       ISP_AWB_BLK_WT_DATA_WT(6, cfg->zone_weight[base + 6]) |
+		       ISP_AWB_BLK_WT_DATA_WT(7, cfg->zone_weight[base + 7]);
+		c3_isp_write(isp, ISP_AWB_BLK_WT_DATA, data);
+	}
+
+	if (zones_num % 8 == 0)
+		return;
+
+	data = 0;
+	base = i * 8;
+
+	for (i = 0; i < zones_num % 8; i++)
+		data |= ISP_AWB_BLK_WT_DATA_WT(i, cfg->zone_weight[base + i]);
+
+	c3_isp_write(isp, ISP_AWB_BLK_WT_DATA, data);
+}
+
+static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
+				   const struct c3_isp_params_awb_config *cfg)
+{
+	unsigned int max_point_num;
+
+	/* The number of points is one more than the number of edges */
+	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+
+	/* Set the index address to 0 position */
+	c3_isp_write(isp, ISP_AWB_IDX_ADDR, 0);
+
+	for (unsigned int i = 0; i < max_point_num; i++)
+		c3_isp_write(isp, ISP_AWB_IDX_DATA,
+			     ISP_AWB_IDX_DATA_HIDX_DATA(cfg->horiz_coord[i]) |
+			     ISP_AWB_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
+}
+
+static void c3_isp_params_cfg_awb_config(struct c3_isp_device *isp,
+					 const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_awb_config *awb_cfg = &block->awb_cfg;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
+				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+			   ISP_TOP_3A_STAT_CRTL_AWB_POINT_MASK,
+			   ISP_TOP_3A_STAT_CRTL_AWB_POINT(awb_cfg->tap_point));
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_CTRL2,
+			   ISP_AWB_STAT_CTRL2_SATUR_CTRL_MASK,
+			   ISP_AWB_STAT_CTRL2_SATUR_CTRL(awb_cfg->satur_vald));
+
+	c3_isp_update_bits(isp, ISP_AWB_HV_BLKNUM,
+			   ISP_AWB_HV_BLKNUM_H_NUM_MASK,
+			   ISP_AWB_HV_BLKNUM_H_NUM(awb_cfg->horiz_zones_num));
+	c3_isp_update_bits(isp, ISP_AWB_HV_BLKNUM,
+			   ISP_AWB_HV_BLKNUM_V_NUM_MASK,
+			   ISP_AWB_HV_BLKNUM_V_NUM(awb_cfg->vert_zones_num));
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG, ISP_AWB_STAT_RG_MIN_VALUE_MASK,
+			   ISP_AWB_STAT_RG_MIN_VALUE(awb_cfg->rg_min));
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG, ISP_AWB_STAT_RG_MAX_VALUE_MASK,
+			   ISP_AWB_STAT_RG_MAX_VALUE(awb_cfg->rg_max));
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG, ISP_AWB_STAT_BG_MIN_VALUE_MASK,
+			   ISP_AWB_STAT_BG_MIN_VALUE(awb_cfg->bg_min));
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG, ISP_AWB_STAT_BG_MAX_VALUE_MASK,
+			   ISP_AWB_STAT_BG_MAX_VALUE(awb_cfg->bg_max));
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG_HL,
+			   ISP_AWB_STAT_RG_HL_LOW_VALUE_MASK,
+			   ISP_AWB_STAT_RG_HL_LOW_VALUE(awb_cfg->rg_low));
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG_HL,
+			   ISP_AWB_STAT_RG_HL_HIGH_VALUE_MASK,
+			   ISP_AWB_STAT_RG_HL_HIGH_VALUE(awb_cfg->rg_high));
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG_HL,
+			   ISP_AWB_STAT_BG_HL_LOW_VALUE_MASK,
+			   ISP_AWB_STAT_BG_HL_LOW_VALUE(awb_cfg->bg_low));
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG_HL,
+			   ISP_AWB_STAT_BG_HL_HIGH_VALUE_MASK,
+			   ISP_AWB_STAT_BG_HL_HIGH_VALUE(awb_cfg->bg_high));
+
+	c3_isp_params_awb_wt(isp, awb_cfg);
+	c3_isp_params_awb_cood(isp, awb_cfg);
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
+				   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN);
+}
+
+static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
+				const struct c3_isp_params_ae_config *cfg)
+{
+	unsigned int zones_num;
+	unsigned int base;
+	unsigned int data;
+	unsigned int i;
+
+	/* Set the weight address to 0 position */
+	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
+
+	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+
+	/* Need to write 8 weights at once */
+	for (i = 0; i < zones_num / 8; i++) {
+		base = i * 8;
+		data = ISP_AE_BLK_WT_DATA_WT(0, cfg->zone_weight[base + 0]) |
+		       ISP_AE_BLK_WT_DATA_WT(1, cfg->zone_weight[base + 1]) |
+		       ISP_AE_BLK_WT_DATA_WT(2, cfg->zone_weight[base + 2]) |
+		       ISP_AE_BLK_WT_DATA_WT(3, cfg->zone_weight[base + 3]) |
+		       ISP_AE_BLK_WT_DATA_WT(4, cfg->zone_weight[base + 4]) |
+		       ISP_AE_BLK_WT_DATA_WT(5, cfg->zone_weight[base + 5]) |
+		       ISP_AE_BLK_WT_DATA_WT(6, cfg->zone_weight[base + 6]) |
+		       ISP_AE_BLK_WT_DATA_WT(7, cfg->zone_weight[base + 7]);
+		c3_isp_write(isp, ISP_AE_BLK_WT_DATA, data);
+	}
+
+	if (zones_num % 8 == 0)
+		return;
+
+	data = 0;
+	base = i * 8;
+
+	/* Write the last weights data */
+	for (i = 0; i < zones_num % 8; i++)
+		data |= ISP_AE_BLK_WT_DATA_WT(i, cfg->zone_weight[base + i]);
+
+	c3_isp_write(isp, ISP_AE_BLK_WT_DATA, data);
+}
+
+static void c3_isp_params_ae_cood(struct c3_isp_device *isp,
+				  const struct c3_isp_params_ae_config *cfg)
+{
+	unsigned int max_point_num;
+
+	/* The number of points is one more than the number of edges */
+	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+
+	/* Set the index address to 0 position */
+	c3_isp_write(isp, ISP_AE_IDX_ADDR, 0);
+
+	for (unsigned int i = 0; i < max_point_num; i++)
+		c3_isp_write(isp, ISP_AE_IDX_DATA,
+			     ISP_AE_IDX_DATA_HIDX_DATA(cfg->horiz_coord[i]) |
+			     ISP_AE_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
+}
+
+static void c3_isp_params_cfg_ae_config(struct c3_isp_device *isp,
+					const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_ae_config *ae_cfg = &block->ae_cfg;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
+				   ISP_TOP_3A_STAT_CRTL_AE_STAT_DIS);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+			   ISP_TOP_3A_STAT_CRTL_AE_POINT_MASK,
+			   ISP_TOP_3A_STAT_CRTL_AE_POINT(ae_cfg->tap_point));
+
+	if (ae_cfg->tap_point == C3_ISP_AE_STATS_TAP_GE)
+		c3_isp_update_bits(isp, ISP_AE_CTRL,
+				   ISP_AE_CTRL_INPUT_2LINE_MASK,
+				   ISP_AE_CTRL_INPUT_2LINE_EN);
+	else
+		c3_isp_update_bits(isp, ISP_AE_CTRL,
+				   ISP_AE_CTRL_INPUT_2LINE_MASK,
+				   ISP_AE_CTRL_INPUT_2LINE_DIS);
+
+	c3_isp_update_bits(isp, ISP_AE_HV_BLKNUM,
+			   ISP_AE_HV_BLKNUM_H_NUM_MASK,
+			   ISP_AE_HV_BLKNUM_H_NUM(ae_cfg->horiz_zones_num));
+	c3_isp_update_bits(isp, ISP_AE_HV_BLKNUM,
+			   ISP_AE_HV_BLKNUM_V_NUM_MASK,
+			   ISP_AE_HV_BLKNUM_V_NUM(ae_cfg->vert_zones_num));
+
+	c3_isp_params_ae_wt(isp, ae_cfg);
+	c3_isp_params_ae_cood(isp, ae_cfg);
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
+				   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN);
+}
+
+static void c3_isp_params_af_cood(struct c3_isp_device *isp,
+				  const struct c3_isp_params_af_config *cfg)
+{
+	unsigned int max_point_num;
+
+	/* The number of points is one more than the number of edges */
+	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+
+	/* Set the index address to 0 position */
+	c3_isp_write(isp, ISP_AF_IDX_ADDR, 0);
+
+	for (unsigned int i = 0; i < max_point_num; i++)
+		c3_isp_write(isp, ISP_AF_IDX_DATA,
+			     ISP_AF_IDX_DATA_HIDX_DATA(cfg->horiz_coord[i]) |
+			     ISP_AF_IDX_DATA_VIDX_DATA(cfg->vert_coord[i]));
+}
+
+static void c3_isp_params_cfg_af_config(struct c3_isp_device *isp,
+					const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_af_config *af_cfg = &block->af_cfg;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
+				   ISP_TOP_3A_STAT_CRTL_AF_STAT_DIS);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+			   ISP_TOP_3A_STAT_CRTL_AF_POINT_MASK,
+			   ISP_TOP_3A_STAT_CRTL_AF_POINT(af_cfg->tap_point));
+
+	c3_isp_update_bits(isp, ISP_AF_HV_BLKNUM,
+			   ISP_AF_HV_BLKNUM_H_NUM_MASK,
+			   ISP_AF_HV_BLKNUM_H_NUM(af_cfg->horiz_zones_num));
+	c3_isp_update_bits(isp, ISP_AF_HV_BLKNUM,
+			   ISP_AF_HV_BLKNUM_V_NUM_MASK,
+			   ISP_AF_HV_BLKNUM_V_NUM(af_cfg->vert_zones_num));
+
+	c3_isp_params_af_cood(isp, af_cfg);
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
+				   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN);
+}
+
+static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
+					const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_pst_gamma *gm = &block->pst_gamma;
+	unsigned int base;
+	unsigned int i;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
+				   ISP_TOP_BED_CTRL_PST_GAMMA_DIS);
+		return;
+	}
+
+	/* R, G and B channels use the same gamma lut */
+	for (unsigned int j = 0; j < 3; j++) {
+		/* Set the channel lut address */
+		c3_isp_write(isp, ISP_PST_GAMMA_LUT_ADDR,
+			     ISP_PST_GAMMA_LUT_ADDR_IDX_ADDR(j));
+
+		/* Need to write 2 lut values at once */
+		for (i = 0; i < ARRAY_SIZE(gm->lut) / 2; i++) {
+			base = i * 2;
+			c3_isp_write(isp, ISP_PST_GAMMA_LUT_DATA,
+				     ISP_PST_GM_LUT_DATA0(gm->lut[base]) |
+				     ISP_PST_GM_LUT_DATA1(gm->lut[base + 1]));
+		}
+
+		/* Write the last one */
+		if (ARRAY_SIZE(gm->lut) % 2) {
+			base = i * 2;
+			c3_isp_write(isp, ISP_PST_GAMMA_LUT_DATA,
+				     ISP_PST_GM_LUT_DATA0(gm->lut[base]));
+		}
+	}
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK,
+				   ISP_TOP_BED_CTRL_PST_GAMMA_EN);
+}
+
+/* Configure 3 x 3 ccm matrix */
+static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
+				  const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_ccm *ccm = &block->ccm;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
+				   ISP_TOP_BED_CTRL_CCM_DIS);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_00_01,
+			   ISP_CCM_MTX_00_01_MTX_00_MASK,
+			   ISP_CCM_MTX_00_01_MTX_00(ccm->matrix[0][0]));
+	c3_isp_update_bits(isp, ISP_CCM_MTX_00_01,
+			   ISP_CCM_MTX_00_01_MTX_01_MASK,
+			   ISP_CCM_MTX_00_01_MTX_01(ccm->matrix[0][1]));
+	c3_isp_update_bits(isp, ISP_CCM_MTX_02_03,
+			   ISP_CCM_MTX_02_03_MTX_02_MASK,
+			   ISP_CCM_MTX_02_03_MTX_02(ccm->matrix[0][2]));
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_10_11,
+			   ISP_CCM_MTX_10_11_MTX_10_MASK,
+			   ISP_CCM_MTX_10_11_MTX_10(ccm->matrix[1][0]));
+	c3_isp_update_bits(isp, ISP_CCM_MTX_10_11,
+			   ISP_CCM_MTX_10_11_MTX_11_MASK,
+			   ISP_CCM_MTX_10_11_MTX_11(ccm->matrix[1][1]));
+	c3_isp_update_bits(isp, ISP_CCM_MTX_12_13,
+			   ISP_CCM_MTX_12_13_MTX_12_MASK,
+			   ISP_CCM_MTX_12_13_MTX_12(ccm->matrix[1][2]));
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_20_21,
+			   ISP_CCM_MTX_20_21_MTX_20_MASK,
+			   ISP_CCM_MTX_20_21_MTX_20(ccm->matrix[2][0]));
+	c3_isp_update_bits(isp, ISP_CCM_MTX_20_21,
+			   ISP_CCM_MTX_20_21_MTX_21_MASK,
+			   ISP_CCM_MTX_20_21_MTX_21(ccm->matrix[2][1]));
+	c3_isp_update_bits(isp, ISP_CCM_MTX_22_23_RS,
+			   ISP_CCM_MTX_22_23_RS_MTX_22_MASK,
+			   ISP_CCM_MTX_22_23_RS_MTX_22(ccm->matrix[2][2]));
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   ISP_TOP_BED_CTRL_CCM_EN_MASK,
+				   ISP_TOP_BED_CTRL_CCM_EN);
+}
+
+/* Configure color space conversion matrix parameters */
+static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
+				  const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_csc *csc = &block->csc;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
+				   ISP_TOP_BED_CTRL_CM0_DIS);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF00_01,
+			   ISP_CM0_COEF00_01_MTX_00_MASK,
+			   ISP_CM0_COEF00_01_MTX_00(csc->matrix[0][0]));
+	c3_isp_update_bits(isp, ISP_CM0_COEF00_01,
+			   ISP_CM0_COEF00_01_MTX_01_MASK,
+			   ISP_CM0_COEF00_01_MTX_01(csc->matrix[0][1]));
+	c3_isp_update_bits(isp, ISP_CM0_COEF02_10,
+			   ISP_CM0_COEF02_10_MTX_02_MASK,
+			   ISP_CM0_COEF02_10_MTX_02(csc->matrix[0][2]));
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF02_10,
+			   ISP_CM0_COEF02_10_MTX_10_MASK,
+			   ISP_CM0_COEF02_10_MTX_10(csc->matrix[1][0]));
+	c3_isp_update_bits(isp, ISP_CM0_COEF11_12,
+			   ISP_CM0_COEF11_12_MTX_11_MASK,
+			   ISP_CM0_COEF11_12_MTX_11(csc->matrix[1][1]));
+	c3_isp_update_bits(isp, ISP_CM0_COEF11_12,
+			   ISP_CM0_COEF11_12_MTX_12_MASK,
+			   ISP_CM0_COEF11_12_MTX_12(csc->matrix[1][2]));
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF20_21,
+			   ISP_CM0_COEF20_21_MTX_20_MASK,
+			   ISP_CM0_COEF20_21_MTX_20(csc->matrix[2][0]));
+	c3_isp_update_bits(isp, ISP_CM0_COEF20_21,
+			   ISP_CM0_COEF20_21_MTX_21_MASK,
+			   ISP_CM0_COEF20_21_MTX_21(csc->matrix[2][1]));
+	c3_isp_update_bits(isp, ISP_CM0_COEF22_OUP_OFST0,
+			   ISP_CM0_COEF22_OUP_OFST0_MTX_22_MASK,
+			   ISP_CM0_COEF22_OUP_OFST0_MTX_22(csc->matrix[2][2]));
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   ISP_TOP_BED_CTRL_CM0_EN_MASK,
+				   ISP_TOP_BED_CTRL_CM0_EN);
+}
+
+/* Set blc offset of each color channel */
+static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
+				  const union c3_isp_params_block *block)
+{
+	const struct c3_isp_params_blc *blc = &block->blc;
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_DISABLE) {
+		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
+				   ISP_TOP_BEO_CTRL_BLC_DIS);
+		return;
+	}
+
+	c3_isp_write(isp, ISP_LSWB_BLC_OFST0,
+		     ISP_LSWB_BLC_OFST0_R_OFST(blc->r_ofst) |
+		     ISP_LSWB_BLC_OFST0_GR_OFST(blc->gr_ofst));
+	c3_isp_write(isp, ISP_LSWB_BLC_OFST1,
+		     ISP_LSWB_BLC_OFST1_GB_OFST(blc->gb_ofst) |
+		     ISP_LSWB_BLC_OFST1_B_OFST(blc->b_ofst));
+
+	if (block->header.flags & C3_ISP_PARAMS_BLOCK_FL_ENABLE)
+		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+				   ISP_TOP_BEO_CTRL_BLC_EN_MASK,
+				   ISP_TOP_BEO_CTRL_BLC_EN);
+}
+
+static const struct c3_isp_params_handler c3_isp_params_handlers[] = {
+	[C3_ISP_PARAMS_BLOCK_AWB_GAINS] = {
+		.size = sizeof(struct c3_isp_params_awb_gains),
+		.handler = c3_isp_params_cfg_awb_gains,
+	},
+	[C3_ISP_PARAMS_BLOCK_AWB_CONFIG] = {
+		.size = sizeof(struct c3_isp_params_awb_config),
+		.handler = c3_isp_params_cfg_awb_config,
+	},
+	[C3_ISP_PARAMS_BLOCK_AE_CONFIG] = {
+		.size = sizeof(struct c3_isp_params_ae_config),
+		.handler = c3_isp_params_cfg_ae_config,
+	},
+	[C3_ISP_PARAMS_BLOCK_AF_CONFIG] = {
+		.size = sizeof(struct c3_isp_params_af_config),
+		.handler = c3_isp_params_cfg_af_config,
+	},
+	[C3_ISP_PARAMS_BLOCK_PST_GAMMA] = {
+		.size = sizeof(struct c3_isp_params_pst_gamma),
+		.handler = c3_isp_params_cfg_pst_gamma,
+	},
+	[C3_ISP_PARAMS_BLOCK_CCM] = {
+		.size = sizeof(struct c3_isp_params_ccm),
+		.handler = c3_isp_params_cfg_ccm,
+	},
+	[C3_ISP_PARAMS_BLOCK_CSC] = {
+		.size = sizeof(struct c3_isp_params_csc),
+		.handler = c3_isp_params_cfg_csc,
+	},
+	[C3_ISP_PARAMS_BLOCK_BLC] = {
+		.size = sizeof(struct c3_isp_params_blc),
+		.handler = c3_isp_params_cfg_blc,
+	},
+};
+
+static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
+{
+	struct c3_isp_params_cfg *config = params->buff->cfg;
+	size_t block_offset = 0;
+
+	if (WARN_ON(!config))
+		return;
+
+	/* Walk the list of parameter blocks and process them */
+	while (block_offset < config->data_size) {
+		const struct c3_isp_params_handler *block_handler;
+		const union c3_isp_params_block *block;
+
+		block = (const union c3_isp_params_block *)
+			 &config->data[block_offset];
+
+		block_handler = &c3_isp_params_handlers[block->header.type];
+		block_handler->handler(params->isp, block);
+
+		block_offset += block->header.size;
+	}
+}
+
+void c3_isp_params_pre_cfg(struct c3_isp_device *isp)
+{
+	struct c3_isp_params *params = &isp->params;
+
+	/* Disable some unused modules */
+	c3_isp_update_bits(isp, ISP_TOP_FEO_CTRL0,
+			   ISP_TOP_FEO_CTRL0_INPUT_FMT_EN_MASK,
+			   ISP_TOP_FEO_CTRL0_INPUT_FMT_DIS);
+
+	c3_isp_update_bits(isp, ISP_TOP_FEO_CTRL1_0,
+			   ISP_TOP_FEO_CTRL1_0_DPC_EN_MASK,
+			   ISP_TOP_FEO_CTRL1_0_DPC_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FEO_CTRL1_0,
+			   ISP_TOP_FEO_CTRL1_0_OG_EN_MASK,
+			   ISP_TOP_FEO_CTRL1_0_OG_DIS);
+
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL, ISP_TOP_FED_CTRL_PDPC_EN_MASK,
+			   ISP_TOP_FED_CTRL_PDPC_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL,
+			   ISP_TOP_FED_CTRL_RAWCNR_EN_MASK,
+			   ISP_TOP_FED_CTRL_RAWCNR_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL, ISP_TOP_FED_CTRL_SNR1_EN_MASK,
+			   ISP_TOP_FED_CTRL_SNR1_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL, ISP_TOP_FED_CTRL_TNR0_EN_MASK,
+			   ISP_TOP_FED_CTRL_TNR0_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL,
+			   ISP_TOP_FED_CTRL_CUBIC_CS_EN_MASK,
+			   ISP_TOP_FED_CTRL_CUBIC_CS_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL, ISP_TOP_FED_CTRL_SQRT_EN_MASK,
+			   ISP_TOP_FED_CTRL_SQRT_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_FED_CTRL,
+			   ISP_TOP_FED_CTRL_DGAIN_EN_MASK,
+			   ISP_TOP_FED_CTRL_DGAIN_DIS);
+
+	c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+			   ISP_TOP_BEO_CTRL_INV_DGAIN_EN_MASK,
+			   ISP_TOP_BEO_CTRL_INV_DGAIN_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL, ISP_TOP_BEO_CTRL_EOTF_EN_MASK,
+			   ISP_TOP_BEO_CTRL_EOTF_DIS);
+
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   ISP_TOP_BED_CTRL_YHS_STAT_EN_MASK,
+			   ISP_TOP_BED_CTRL_YHS_STAT_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   ISP_TOP_BED_CTRL_GRPH_STAT_EN_MASK,
+			   ISP_TOP_BED_CTRL_GRPH_STAT_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   ISP_TOP_BED_CTRL_FMETER_EN_MASK,
+			   ISP_TOP_BED_CTRL_FMETER_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL, ISP_TOP_BED_CTRL_BSC_EN_MASK,
+			   ISP_TOP_BED_CTRL_BSC_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL, ISP_TOP_BED_CTRL_CNR2_EN_MASK,
+			   ISP_TOP_BED_CTRL_CNR2_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL, ISP_TOP_BED_CTRL_CM1_EN_MASK,
+			   ISP_TOP_BED_CTRL_CM1_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   ISP_TOP_BED_CTRL_LUT3D_EN_MASK,
+			   ISP_TOP_BED_CTRL_LUT3D_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   ISP_TOP_BED_CTRL_PST_TNR_LITE_EN_MASK,
+			   ISP_TOP_BED_CTRL_PST_TNR_LITE_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL, ISP_TOP_BED_CTRL_AMCM_EN_MASK,
+			   ISP_TOP_BED_CTRL_AMCM_DIS);
+
+	/*
+	 * Disable AE, AF and AWB stat module. Please configure the parameters
+	 * in userspace algorithm if need to enable these switch.
+	 */
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+			   ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK,
+			   ISP_TOP_3A_STAT_CRTL_AE_STAT_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+			   ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK,
+			   ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS);
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL,
+			   ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK,
+			   ISP_TOP_3A_STAT_CRTL_AF_STAT_DIS);
+
+	c3_isp_write(isp, ISP_LSWB_WB_LIMIT0,
+		     ISP_LSWB_WB_LIMIT0_WB_LIMIT_R_MAX |
+		     ISP_LSWB_WB_LIMIT0_WB_LIMIT_GR_MAX);
+	c3_isp_write(isp, ISP_LSWB_WB_LIMIT1,
+		     ISP_LSWB_WB_LIMIT1_WB_LIMIT_GB_MAX |
+		     ISP_LSWB_WB_LIMIT1_WB_LIMIT_B_MAX);
+
+	guard(spinlock_irqsave)(&params->buff_lock);
+
+	/* Only use the first buffer to initialize ISP */
+	params->buff =
+		list_first_entry_or_null(&params->pending,
+					 struct c3_isp_params_buffer, list);
+	if (params->buff)
+		c3_isp_params_cfg_blocks(params);
+}
+
+/* V4L2 video operations */
+
+static int c3_isp_params_querycap(struct file *file, void *fh,
+				  struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, C3_ISP_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "AML C3 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static int c3_isp_params_enum_fmt(struct file *file, void *fh,
+				  struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_C3ISP_PARAMS;
+
+	return 0;
+}
+
+static int c3_isp_params_g_fmt(struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct c3_isp_params *params = video_drvdata(file);
+
+	f->fmt.meta = params->vfmt.fmt.meta;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops isp_params_v4l2_ioctl_ops = {
+	.vidioc_querycap                = c3_isp_params_querycap,
+	.vidioc_enum_fmt_meta_out       = c3_isp_params_enum_fmt,
+	.vidioc_g_fmt_meta_out          = c3_isp_params_g_fmt,
+	.vidioc_s_fmt_meta_out          = c3_isp_params_g_fmt,
+	.vidioc_try_fmt_meta_out        = c3_isp_params_g_fmt,
+	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
+	.vidioc_querybuf                = vb2_ioctl_querybuf,
+	.vidioc_qbuf                    = vb2_ioctl_qbuf,
+	.vidioc_expbuf                  = vb2_ioctl_expbuf,
+	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
+	.vidioc_streamon                = vb2_ioctl_streamon,
+	.vidioc_streamoff               = vb2_ioctl_streamoff,
+};
+
+static const struct v4l2_file_operations isp_params_v4l2_fops = {
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int c3_isp_params_vb2_queue_setup(struct vb2_queue *q,
+					 unsigned int *num_buffers,
+					 unsigned int *num_planes,
+					 unsigned int sizes[],
+					 struct device *alloc_devs[])
+{
+	if (*num_planes) {
+		if (*num_planes != 1)
+			return -EINVAL;
+
+		if (sizes[0] < sizeof(struct c3_isp_params_cfg))
+			return -EINVAL;
+
+		return 0;
+	}
+
+	*num_planes = 1;
+	sizes[0] = sizeof(struct c3_isp_params_cfg);
+
+	return 0;
+}
+
+static void c3_isp_params_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(v4l2_buf);
+	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+
+	guard(spinlock_irqsave)(&params->buff_lock);
+
+	list_add_tail(&buf->list, &params->pending);
+}
+
+static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
+	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct c3_isp_params_cfg *cfg = buf->cfg;
+	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
+	size_t block_offset = 0;
+	size_t cfg_size;
+
+	/* Payload size can't be greater than the destination buffer size */
+	if (payload_size > params->vfmt.fmt.meta.buffersize) {
+		dev_dbg(params->isp->dev,
+			"Payload size is too large: %zu\n", payload_size);
+		return -EINVAL;
+	}
+
+	/* Payload size can't be smaller than the header size */
+	if (payload_size < header_size) {
+		dev_dbg(params->isp->dev,
+			"Payload size is too small: %zu\n", payload_size);
+		return -EINVAL;
+	}
+
+	/*
+	 * Use the internal scratch buffer to avoid userspace modifying
+	 * the buffer content while the driver is processing it.
+	 */
+	memcpy(cfg, usr_cfg, payload_size);
+
+	/* Only v0 is supported at the moment */
+	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
+		dev_dbg(params->isp->dev,
+			"Invalid params buffer version: %u\n", cfg->version);
+		return -EINVAL;
+	}
+
+	/* Validate the size reported in the parameter buffer header */
+	cfg_size = header_size + cfg->data_size;
+	if (cfg_size != payload_size) {
+		dev_dbg(params->isp->dev,
+			"Data size %zu and payload size %zu are different\n",
+			cfg_size, payload_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of parameter blocks and validate them */
+	cfg_size = cfg->data_size;
+	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
+		const struct c3_isp_params_block_header *block;
+		const struct c3_isp_params_handler *handler;
+
+		block = (struct c3_isp_params_block_header *)
+			&cfg->data[block_offset];
+
+		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
+			dev_dbg(params->isp->dev,
+				"Invalid params block type\n");
+			return -EINVAL;
+		}
+
+		if (block->size > cfg_size) {
+			dev_dbg(params->isp->dev,
+				"Block size is greater than cfg size\n");
+			return -EINVAL;
+		}
+
+		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
+				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
+		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
+		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
+			dev_dbg(params->isp->dev,
+				"Invalid parameters block flags\n");
+			return -EINVAL;
+		}
+
+		handler = &c3_isp_params_handlers[block->type];
+		if (block->size != handler->size) {
+			dev_dbg(params->isp->dev,
+				"Invalid params block size\n");
+			return -EINVAL;
+		}
+
+		block_offset += block->size;
+		cfg_size -= block->size;
+	}
+
+	if (cfg_size) {
+		dev_dbg(params->isp->dev,
+			"Unexpected data after the params buffer end\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(v4l2_buf);
+
+	buf->cfg = kvmalloc(params->vfmt.fmt.meta.buffersize, GFP_KERNEL);
+	if (!buf->cfg)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void c3_isp_params_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(v4l2_buf);
+
+	kvfree(buf->cfg);
+	buf->cfg = NULL;
+}
+
+static void c3_isp_params_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct c3_isp_params *params = vb2_get_drv_priv(q);
+	struct c3_isp_params_buffer *buff;
+
+	guard(spinlock_irqsave)(&params->buff_lock);
+
+	while (!list_empty(&params->pending)) {
+		buff = list_first_entry(&params->pending,
+					struct c3_isp_params_buffer, list);
+		list_del(&buff->list);
+		vb2_buffer_done(&buff->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops isp_params_vb2_ops = {
+	.queue_setup = c3_isp_params_vb2_queue_setup,
+	.buf_queue = c3_isp_params_vb2_buf_queue,
+	.buf_prepare = c3_isp_params_vb2_buf_prepare,
+	.buf_init = c3_isp_params_vb2_buf_init,
+	.buf_cleanup = c3_isp_params_vb2_buf_cleanup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.stop_streaming = c3_isp_params_vb2_stop_streaming,
+};
+
+int c3_isp_params_register(struct c3_isp_device *isp)
+{
+	struct c3_isp_params *params = &isp->params;
+	struct video_device *vdev = &params->vdev;
+	struct vb2_queue *vb2_q = &params->vb2_q;
+	int ret;
+
+	memset(params, 0, sizeof(*params));
+	params->vfmt.fmt.meta.dataformat = V4L2_META_FMT_C3ISP_PARAMS;
+	params->vfmt.fmt.meta.buffersize = sizeof(struct c3_isp_params_cfg);
+	params->isp = isp;
+	INIT_LIST_HEAD(&params->pending);
+	spin_lock_init(&params->buff_lock);
+	mutex_init(&params->lock);
+
+	snprintf(vdev->name, sizeof(vdev->name), "c3-isp-params");
+	vdev->fops = &isp_params_v4l2_fops;
+	vdev->ioctl_ops = &isp_params_v4l2_ioctl_ops;
+	vdev->v4l2_dev = &isp->v4l2_dev;
+	vdev->lock = &params->lock;
+	vdev->minor = -1;
+	vdev->queue = vb2_q;
+	vdev->release = video_device_release_empty;
+	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_TX;
+	video_set_drvdata(vdev, params);
+
+	vb2_q->drv_priv = params;
+	vb2_q->mem_ops = &vb2_vmalloc_memops;
+	vb2_q->ops = &isp_params_vb2_ops;
+	vb2_q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	vb2_q->io_modes = VB2_DMABUF | VB2_MMAP;
+	vb2_q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2_q->buf_struct_size = sizeof(struct c3_isp_params_buffer);
+	vb2_q->dev = isp->dev;
+	vb2_q->lock = &params->lock;
+	vb2_q->min_queued_buffers = 1;
+
+	ret = vb2_queue_init(vb2_q);
+	if (ret)
+		goto err_detroy;
+
+	params->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&vdev->entity, 1, &params->pad);
+	if (ret)
+		goto err_queue_release;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"Failed to register %s: %d\n", vdev->name, ret);
+		goto err_entity_cleanup;
+	}
+
+	return 0;
+
+err_entity_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_queue_release:
+	vb2_queue_release(vb2_q);
+err_detroy:
+	mutex_destroy(&params->lock);
+	return ret;
+}
+
+void c3_isp_params_unregister(struct c3_isp_device *isp)
+{
+	struct c3_isp_params *params = &isp->params;
+
+	vb2_queue_release(&params->vb2_q);
+	media_entity_cleanup(&params->vdev.entity);
+	video_unregister_device(&params->vdev);
+	mutex_destroy(&params->lock);
+}
+
+void c3_isp_params_isr(struct c3_isp_device *isp)
+{
+	struct c3_isp_params *params = &isp->params;
+
+	guard(spinlock_irqsave)(&params->buff_lock);
+
+	params->buff =
+		list_first_entry_or_null(&params->pending,
+					 struct c3_isp_params_buffer, list);
+	if (!params->buff)
+		return;
+
+	list_del(&params->buff->list);
+
+	c3_isp_params_cfg_blocks(params);
+
+	params->buff->vb.sequence = params->isp->frm_sequence;
+	params->buff->vb.vb2_buf.timestamp = ktime_get();
+	params->buff->vb.field = V4L2_FIELD_NONE;
+	vb2_buffer_done(&params->buff->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-regs.h b/drivers/media/platform/amlogic/c3/isp/c3-isp-regs.h
new file mode 100644
index 000000000000..fa249985a771
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-regs.h
@@ -0,0 +1,618 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __C3_ISP_REGS_H__
+#define __C3_ISP_REGS_H__
+
+#define ISP_TOP_INPUT_SIZE				0x0000
+#define ISP_TOP_INPUT_SIZE_VERT_SIZE_MASK		GENMASK(15, 0)
+#define ISP_TOP_INPUT_SIZE_VERT_SIZE(x)			((x) << 0)
+#define ISP_TOP_INPUT_SIZE_HORIZ_SIZE_MASK		GENMASK(31, 16)
+#define ISP_TOP_INPUT_SIZE_HORIZ_SIZE(x)		((x) << 16)
+
+#define ISP_TOP_FRM_SIZE				0x0004
+#define ISP_TOP_FRM_SIZE_CORE_VERT_SIZE_MASK		GENMASK(15, 0)
+#define ISP_TOP_FRM_SIZE_CORE_VERT_SIZE(x)		((x) << 0)
+#define ISP_TOP_FRM_SIZE_CORE_HORIZ_SIZE_MASK		GENMASK(31, 16)
+#define ISP_TOP_FRM_SIZE_CORE_HORIZ_SIZE(x)		((x) << 16)
+
+#define ISP_TOP_HOLD_SIZE				0x0008
+#define ISP_TOP_HOLD_SIZE_CORE_HORIZ_SIZE_MASK		GENMASK(31, 16)
+#define ISP_TOP_HOLD_SIZE_CORE_HORIZ_SIZE(x)		((x) << 16)
+
+#define ISP_TOP_PATH_EN					0x0010
+#define ISP_TOP_PATH_EN_DISP0_EN_MASK			BIT(0)
+#define ISP_TOP_PATH_EN_DISP0_EN			BIT(0)
+#define ISP_TOP_PATH_EN_DISP0_DIS			(0 << 0)
+#define ISP_TOP_PATH_EN_DISP1_EN_MASK			BIT(1)
+#define ISP_TOP_PATH_EN_DISP1_EN			BIT(1)
+#define ISP_TOP_PATH_EN_DISP1_DIS			(0 << 1)
+#define ISP_TOP_PATH_EN_DISP2_EN_MASK			BIT(2)
+#define ISP_TOP_PATH_EN_DISP2_EN			BIT(2)
+#define ISP_TOP_PATH_EN_DISP2_DIS			(0 << 2)
+#define ISP_TOP_PATH_EN_WRMIF0_EN_MASK			BIT(8)
+#define ISP_TOP_PATH_EN_WRMIF0_EN			BIT(8)
+#define ISP_TOP_PATH_EN_WRMIF0_DIS			(0 << 8)
+#define ISP_TOP_PATH_EN_WRMIF1_EN_MASK			BIT(9)
+#define ISP_TOP_PATH_EN_WRMIF1_EN			BIT(9)
+#define ISP_TOP_PATH_EN_WRMIF1_DIS			(0 << 9)
+#define ISP_TOP_PATH_EN_WRMIF2_EN_MASK			BIT(10)
+#define ISP_TOP_PATH_EN_WRMIF2_EN			BIT(10)
+#define ISP_TOP_PATH_EN_WRMIF2_DIS			(0 << 10)
+
+#define ISP_TOP_PATH_SEL				0x0014
+#define ISP_TOP_PATH_SEL_CORE_MASK			GENMASK(18, 16)
+#define ISP_TOP_PATH_SEL_CORE_CORE_DIS			(0 << 16)
+#define ISP_TOP_PATH_SEL_CORE_MIPI_CORE			BIT(16)
+
+#define ISP_TOP_DISPIN_SEL				0x0018
+#define ISP_TOP_DISPIN_SEL_DISP0_MASK			GENMASK(3, 0)
+#define ISP_TOP_DISPIN_SEL_DISP0_CORE_OUT		(0 << 0)
+#define ISP_TOP_DISPIN_SEL_DISP0_MIPI_OUT		(2 << 0)
+#define ISP_TOP_DISPIN_SEL_DISP1_MASK			GENMASK(7, 4)
+#define ISP_TOP_DISPIN_SEL_DISP1_CORE_OUT		(0 << 4)
+#define ISP_TOP_DISPIN_SEL_DISP1_MIPI_OUT		(2 << 4)
+#define ISP_TOP_DISPIN_SEL_DISP2_MASK			GENMASK(11, 8)
+#define ISP_TOP_DISPIN_SEL_DISP2_CORE_OUT		(0 << 8)
+#define ISP_TOP_DISPIN_SEL_DISP2_MIPI_OUT		(2 << 8)
+
+#define ISP_TOP_IRQ_EN					0x0080
+#define ISP_TOP_IRQ_EN_FRM_END_MASK			BIT(0)
+#define ISP_TOP_IRQ_EN_FRM_END_EN			BIT(0)
+#define ISP_TOP_IRQ_EN_FRM_END_DIS			(0 << 0)
+#define ISP_TOP_IRQ_EN_FRM_RST_MASK			BIT(1)
+#define ISP_TOP_IRQ_EN_FRM_RST_EN			BIT(1)
+#define ISP_TOP_IRQ_EN_FRM_RST_DIS			(0 << 1)
+#define ISP_TOP_IRQ_EN_3A_DMA_ERR_MASK			BIT(5)
+#define ISP_TOP_IRQ_EN_3A_DMA_ERR_EN			BIT(5)
+#define ISP_TOP_IRQ_EN_3A_DMA_ERR_DIS			(0 << 5)
+
+#define ISP_TOP_IRQ_CLR					0x0084
+#define ISP_TOP_RO_IRQ_STAT				0x01c4
+#define ISP_TOP_RO_IRQ_STAT_FRM_END_MASK		BIT(0)
+#define ISP_TOP_RO_IRQ_STAT_FRM_RST_MASK		BIT(1)
+#define ISP_TOP_RO_IRQ_STAT_3A_DMA_ERR_MASK		BIT(5)
+
+#define ISP_TOP_MODE_CTRL				0x0400
+#define ISP_TOP_FEO_CTRL0				0x040c
+#define ISP_TOP_FEO_CTRL0_INPUT_FMT_EN_MASK		BIT(8)
+#define ISP_TOP_FEO_CTRL0_INPUT_FMT_DIS			(0 << 8)
+#define ISP_TOP_FEO_CTRL0_INPUT_FMT_EN			BIT(8)
+
+#define ISP_TOP_FEO_CTRL1_0				0x0410
+#define ISP_TOP_FEO_CTRL1_0_DPC_EN_MASK			BIT(3)
+#define ISP_TOP_FEO_CTRL1_0_DPC_DIS			(0 << 3)
+#define ISP_TOP_FEO_CTRL1_0_DPC_EN			BIT(3)
+#define ISP_TOP_FEO_CTRL1_0_OG_EN_MASK			BIT(5)
+#define ISP_TOP_FEO_CTRL1_0_OG_DIS			(0 << 5)
+#define ISP_TOP_FEO_CTRL1_0_OG_EN			BIT(5)
+
+#define ISP_TOP_FED_CTRL				0x0418
+#define ISP_TOP_FED_CTRL_PDPC_EN_MASK			BIT(1)
+#define ISP_TOP_FED_CTRL_PDPC_DIS			(0 << 1)
+#define ISP_TOP_FED_CTRL_PDPC_EN			BIT(1)
+#define ISP_TOP_FED_CTRL_RAWCNR_EN_MASK			GENMASK(6, 5)
+#define ISP_TOP_FED_CTRL_RAWCNR_DIS			(0 << 5)
+#define ISP_TOP_FED_CTRL_RAWCNR_EN			BIT(5)
+#define ISP_TOP_FED_CTRL_SNR1_EN_MASK			BIT(9)
+#define ISP_TOP_FED_CTRL_SNR1_DIS			(0 << 9)
+#define ISP_TOP_FED_CTRL_SNR1_EN			BIT(9)
+#define ISP_TOP_FED_CTRL_TNR0_EN_MASK			BIT(11)
+#define ISP_TOP_FED_CTRL_TNR0_DIS			(0 << 11)
+#define ISP_TOP_FED_CTRL_TNR0_EN			BIT(11)
+#define ISP_TOP_FED_CTRL_CUBIC_CS_EN_MASK		BIT(12)
+#define ISP_TOP_FED_CTRL_CUBIC_CS_DIS			(0 << 12)
+#define ISP_TOP_FED_CTRL_CUBIC_CS_EN			BIT(12)
+#define ISP_TOP_FED_CTRL_SQRT_EN_MASK			BIT(14)
+#define ISP_TOP_FED_CTRL_SQRT_DIS			(0 << 14)
+#define ISP_TOP_FED_CTRL_SQRT_EN			BIT(14)
+#define ISP_TOP_FED_CTRL_DGAIN_EN_MASK			BIT(16)
+#define ISP_TOP_FED_CTRL_DGAIN_DIS			(0 << 16)
+#define ISP_TOP_FED_CTRL_DGAIN_EN			BIT(16)
+
+#define ISP_TOP_BEO_CTRL				0x041c
+#define ISP_TOP_BEO_CTRL_WB_EN_MASK			BIT(6)
+#define ISP_TOP_BEO_CTRL_WB_DIS				(0 << 6)
+#define ISP_TOP_BEO_CTRL_WB_EN				BIT(6)
+#define ISP_TOP_BEO_CTRL_BLC_EN_MASK			BIT(7)
+#define ISP_TOP_BEO_CTRL_BLC_DIS			(0 << 7)
+#define ISP_TOP_BEO_CTRL_BLC_EN				BIT(7)
+#define ISP_TOP_BEO_CTRL_INV_DGAIN_EN_MASK		BIT(8)
+#define ISP_TOP_BEO_CTRL_INV_DGAIN_DIS			(0 << 8)
+#define ISP_TOP_BEO_CTRL_INV_DGAIN_EN			BIT(8)
+#define ISP_TOP_BEO_CTRL_EOTF_EN_MASK			BIT(9)
+#define ISP_TOP_BEO_CTRL_EOTF_DIS			(0 << 9)
+#define ISP_TOP_BEO_CTRL_EOTF_EN			BIT(9)
+
+#define ISP_TOP_BED_CTRL				0x0420
+#define ISP_TOP_BED_CTRL_YHS_STAT_EN_MASK		GENMASK(1, 0)
+#define ISP_TOP_BED_CTRL_YHS_STAT_DIS			(0 << 0)
+#define ISP_TOP_BED_CTRL_YHS_STAT_EN			BIT(0)
+#define ISP_TOP_BED_CTRL_GRPH_STAT_EN_MASK		BIT(2)
+#define ISP_TOP_BED_CTRL_GRPH_STAT_DIS			(0 << 2)
+#define ISP_TOP_BED_CTRL_GRPH_STAT_EN			BIT(2)
+#define ISP_TOP_BED_CTRL_FMETER_EN_MASK			BIT(3)
+#define ISP_TOP_BED_CTRL_FMETER_DIS			(0 << 3)
+#define ISP_TOP_BED_CTRL_FMETER_EN			BIT(3)
+#define ISP_TOP_BED_CTRL_BSC_EN_MASK			BIT(10)
+#define ISP_TOP_BED_CTRL_BSC_DIS			(0 << 10)
+#define ISP_TOP_BED_CTRL_BSC_EN				BIT(10)
+#define ISP_TOP_BED_CTRL_CNR2_EN_MASK			BIT(11)
+#define ISP_TOP_BED_CTRL_CNR2_DIS			(0 << 11)
+#define ISP_TOP_BED_CTRL_CNR2_EN			BIT(11)
+#define ISP_TOP_BED_CTRL_CM1_EN_MASK			BIT(13)
+#define ISP_TOP_BED_CTRL_CM1_DIS			(0 << 13)
+#define ISP_TOP_BED_CTRL_CM1_EN				BIT(13)
+#define ISP_TOP_BED_CTRL_CM0_EN_MASK			BIT(14)
+#define ISP_TOP_BED_CTRL_CM0_DIS			(0 << 14)
+#define ISP_TOP_BED_CTRL_CM0_EN				BIT(14)
+#define ISP_TOP_BED_CTRL_PST_GAMMA_EN_MASK		BIT(16)
+#define ISP_TOP_BED_CTRL_PST_GAMMA_DIS			(0 << 16)
+#define ISP_TOP_BED_CTRL_PST_GAMMA_EN			BIT(16)
+#define ISP_TOP_BED_CTRL_LUT3D_EN_MASK			BIT(17)
+#define ISP_TOP_BED_CTRL_LUT3D_DIS			(0 << 17)
+#define ISP_TOP_BED_CTRL_LUT3D_EN			BIT(17)
+#define ISP_TOP_BED_CTRL_CCM_EN_MASK			BIT(18)
+#define ISP_TOP_BED_CTRL_CCM_DIS			(0 << 18)
+#define ISP_TOP_BED_CTRL_CCM_EN				BIT(18)
+#define ISP_TOP_BED_CTRL_PST_TNR_LITE_EN_MASK		BIT(21)
+#define ISP_TOP_BED_CTRL_PST_TNR_LITE_DIS		(0 << 21)
+#define ISP_TOP_BED_CTRL_PST_TNR_LITE_EN		BIT(21)
+#define ISP_TOP_BED_CTRL_AMCM_EN_MASK			BIT(25)
+#define ISP_TOP_BED_CTRL_AMCM_DIS			(0 << 25)
+#define ISP_TOP_BED_CTRL_AMCM_EN			BIT(25)
+
+#define ISP_TOP_3A_STAT_CRTL				0x0424
+#define ISP_TOP_3A_STAT_CRTL_AE_STAT_EN_MASK		BIT(0)
+#define ISP_TOP_3A_STAT_CRTL_AE_STAT_DIS		(0 << 0)
+#define ISP_TOP_3A_STAT_CRTL_AE_STAT_EN			BIT(0)
+#define ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN_MASK		BIT(1)
+#define ISP_TOP_3A_STAT_CRTL_AWB_STAT_DIS		(0 << 1)
+#define ISP_TOP_3A_STAT_CRTL_AWB_STAT_EN		BIT(1)
+#define ISP_TOP_3A_STAT_CRTL_AF_STAT_EN_MASK		BIT(2)
+#define ISP_TOP_3A_STAT_CRTL_AF_STAT_DIS		(0 << 2)
+#define ISP_TOP_3A_STAT_CRTL_AF_STAT_EN			BIT(2)
+#define ISP_TOP_3A_STAT_CRTL_AWB_POINT_MASK		GENMASK(6, 4)
+#define ISP_TOP_3A_STAT_CRTL_AWB_POINT(x)		((x) << 4)
+#define ISP_TOP_3A_STAT_CRTL_AE_POINT_MASK		GENMASK(9, 8)
+#define ISP_TOP_3A_STAT_CRTL_AE_POINT(x)		((x) << 8)
+#define ISP_TOP_3A_STAT_CRTL_AF_POINT_MASK		GENMASK(13, 12)
+#define ISP_TOP_3A_STAT_CRTL_AF_POINT(x)		((x) << 12)
+
+#define ISP_LSWB_BLC_OFST0				0x4028
+#define ISP_LSWB_BLC_OFST0_R_OFST_MASK			GENMASK(15, 0)
+#define ISP_LSWB_BLC_OFST0_R_OFST(x)			((x) << 0)
+#define ISP_LSWB_BLC_OFST0_GR_OFST_MASK			GENMASK(31, 16)
+#define ISP_LSWB_BLC_OFST0_GR_OFST(x)			((x) << 16)
+
+#define ISP_LSWB_BLC_OFST1				0x402c
+#define ISP_LSWB_BLC_OFST1_GB_OFST_MASK			GENMASK(15, 0)
+#define ISP_LSWB_BLC_OFST1_GB_OFST(x)			((x) << 0)
+#define ISP_LSWB_BLC_OFST1_B_OFST_MASK			GENMASK(31, 16)
+#define ISP_LSWB_BLC_OFST1_B_OFST(x)			((x) << 16)
+
+#define ISP_LSWB_BLC_PHSOFST				0x4034
+#define ISP_LSWB_BLC_PHSOFST_VERT_OFST_MASK		GENMASK(1, 0)
+#define ISP_LSWB_BLC_PHSOFST_VERT_OFST(x)		((x) << 0)
+#define ISP_LSWB_BLC_PHSOFST_HORIZ_OFST_MASK		GENMASK(3, 2)
+#define ISP_LSWB_BLC_PHSOFST_HORIZ_OFST(x)		((x) << 2)
+
+#define ISP_LSWB_WB_GAIN0				0x4038
+#define ISP_LSWB_WB_GAIN0_R_GAIN_MASK			GENMASK(11, 0)
+#define ISP_LSWB_WB_GAIN0_R_GAIN(x)			((x) << 0)
+#define ISP_LSWB_WB_GAIN0_GR_GAIN_MASK			GENMASK(27, 16)
+#define ISP_LSWB_WB_GAIN0_GR_GAIN(x)			((x) << 16)
+
+#define ISP_LSWB_WB_GAIN1				0x403c
+#define ISP_LSWB_WB_GAIN1_GB_GAIN_MASK			GENMASK(11, 0)
+#define ISP_LSWB_WB_GAIN1_GB_GAIN(x)			((x) << 0)
+#define ISP_LSWB_WB_GAIN1_B_GAIN_MASK			GENMASK(27, 16)
+#define ISP_LSWB_WB_GAIN1_B_GAIN(x)			((x) << 16)
+
+#define ISP_LSWB_WB_GAIN2				0x4040
+#define ISP_LSWB_WB_GAIN2_IR_GAIN_MASK			GENMASK(11, 0)
+#define ISP_LSWB_WB_GAIN2_IR_GAIN(x)			((x) << 0)
+
+#define ISP_LSWB_WB_LIMIT0				0x4044
+#define ISP_LSWB_WB_LIMIT0_WB_LIMIT_R_MASK		GENMASK(15, 0)
+#define ISP_LSWB_WB_LIMIT0_WB_LIMIT_R(x)		((x) << 0)
+#define ISP_LSWB_WB_LIMIT0_WB_LIMIT_R_MAX		(0x8fff << 0)
+#define ISP_LSWB_WB_LIMIT0_WB_LIMIT_GR_MASK		GENMASK(31, 16)
+#define ISP_LSWB_WB_LIMIT0_WB_LIMIT_GR(x)		((x) << 16)
+#define ISP_LSWB_WB_LIMIT0_WB_LIMIT_GR_MAX		(0x8fff << 16)
+
+#define ISP_LSWB_WB_LIMIT1				0x4048
+#define ISP_LSWB_WB_LIMIT1_WB_LIMIT_GB_MASK		GENMASK(15, 0)
+#define ISP_LSWB_WB_LIMIT1_WB_LIMIT_GB(x)		((x) << 0)
+#define ISP_LSWB_WB_LIMIT1_WB_LIMIT_GB_MAX		(0x8fff << 0)
+#define ISP_LSWB_WB_LIMIT1_WB_LIMIT_B_MASK		GENMASK(31, 16)
+#define ISP_LSWB_WB_LIMIT1_WB_LIMIT_B(x)		((x) << 16)
+#define ISP_LSWB_WB_LIMIT1_WB_LIMIT_B_MAX		(0x8fff << 16)
+
+#define ISP_LSWB_WB_PHSOFST				0x4050
+#define ISP_LSWB_WB_PHSOFST_VERT_OFST_MASK		GENMASK(1, 0)
+#define ISP_LSWB_WB_PHSOFST_VERT_OFST(x)		((x) << 0)
+#define ISP_LSWB_WB_PHSOFST_HORIZ_OFST_MASK		GENMASK(3, 2)
+#define ISP_LSWB_WB_PHSOFST_HORIZ_OFST(x)		((x) << 2)
+
+#define ISP_LSWB_LNS_PHSOFST				0x4054
+#define ISP_LSWB_LNS_PHSOFST_VERT_OFST_MASK		GENMASK(1, 0)
+#define ISP_LSWB_LNS_PHSOFST_VERT_OFST(x)		((x) << 0)
+#define ISP_LSWB_LNS_PHSOFST_HORIZ_OFST_MASK		GENMASK(3, 2)
+#define ISP_LSWB_LNS_PHSOFST_HORIZ_OFST(x)		((x) << 2)
+
+#define ISP_DMS_COMMON_PARAM0				0x5000
+#define ISP_DMS_COMMON_PARAM0_VERT_PHS_OFST_MASK	GENMASK(1, 0)
+#define ISP_DMS_COMMON_PARAM0_VERT_PHS_OFST(x)		((x) << 0)
+#define ISP_DMS_COMMON_PARAM0_HORIZ_PHS_OFST_MASK	GENMASK(3, 2)
+#define ISP_DMS_COMMON_PARAM0_HORIZ_PHS_OFST(x)		((x) << 2)
+
+#define ISP_CM0_COEF00_01				0x6048
+#define ISP_CM0_COEF00_01_MTX_00_MASK			GENMASK(12, 0)
+#define ISP_CM0_COEF00_01_MTX_00(x)			((x) << 0)
+#define ISP_CM0_COEF00_01_MTX_01_MASK			GENMASK(28, 16)
+#define ISP_CM0_COEF00_01_MTX_01(x)			((x) << 16)
+
+#define ISP_CM0_COEF02_10				0x604c
+#define ISP_CM0_COEF02_10_MTX_02_MASK			GENMASK(12, 0)
+#define ISP_CM0_COEF02_10_MTX_02(x)			((x) << 0)
+#define ISP_CM0_COEF02_10_MTX_10_MASK			GENMASK(28, 16)
+#define ISP_CM0_COEF02_10_MTX_10(x)			((x) << 16)
+
+#define ISP_CM0_COEF11_12				0x6050
+#define ISP_CM0_COEF11_12_MTX_11_MASK			GENMASK(12, 0)
+#define ISP_CM0_COEF11_12_MTX_11(x)			((x) << 0)
+#define ISP_CM0_COEF11_12_MTX_12_MASK			GENMASK(28, 16)
+#define ISP_CM0_COEF11_12_MTX_12(x)			((x) << 16)
+
+#define ISP_CM0_COEF20_21				0x6054
+#define ISP_CM0_COEF20_21_MTX_20_MASK			GENMASK(12, 0)
+#define ISP_CM0_COEF20_21_MTX_20(x)			((x) << 0)
+#define ISP_CM0_COEF20_21_MTX_21_MASK			GENMASK(28, 16)
+#define ISP_CM0_COEF20_21_MTX_21(x)			((x) << 16)
+
+#define ISP_CM0_COEF22_OUP_OFST0			0x6058
+#define ISP_CM0_COEF22_OUP_OFST0_MTX_22_MASK		GENMASK(12, 0)
+#define ISP_CM0_COEF22_OUP_OFST0_MTX_22(x)		((x) << 0)
+
+#define ISP_CCM_MTX_00_01				0x6098
+#define ISP_CCM_MTX_00_01_MTX_00_MASK			GENMASK(12, 0)
+#define ISP_CCM_MTX_00_01_MTX_00(x)			((x) << 0)
+#define ISP_CCM_MTX_00_01_MTX_01_MASK			GENMASK(28, 16)
+#define ISP_CCM_MTX_00_01_MTX_01(x)			((x) << 16)
+
+#define ISP_CCM_MTX_02_03				0x609c
+#define ISP_CCM_MTX_02_03_MTX_02_MASK			GENMASK(12, 0)
+#define ISP_CCM_MTX_02_03_MTX_02(x)			((x) << 0)
+
+#define ISP_CCM_MTX_10_11				0x60A0
+#define ISP_CCM_MTX_10_11_MTX_10_MASK			GENMASK(12, 0)
+#define ISP_CCM_MTX_10_11_MTX_10(x)			((x) << 0)
+#define ISP_CCM_MTX_10_11_MTX_11_MASK			GENMASK(28, 16)
+#define ISP_CCM_MTX_10_11_MTX_11(x)			((x) << 16)
+
+#define ISP_CCM_MTX_12_13				0x60A4
+#define ISP_CCM_MTX_12_13_MTX_12_MASK			GENMASK(12, 0)
+#define ISP_CCM_MTX_12_13_MTX_12(x)			((x) << 0)
+
+#define ISP_CCM_MTX_20_21				0x60A8
+#define ISP_CCM_MTX_20_21_MTX_20_MASK			GENMASK(12, 0)
+#define ISP_CCM_MTX_20_21_MTX_20(x)			((x) << 0)
+#define ISP_CCM_MTX_20_21_MTX_21_MASK			GENMASK(28, 16)
+#define ISP_CCM_MTX_20_21_MTX_21(x)			((x) << 16)
+
+#define ISP_CCM_MTX_22_23_RS				0x60Ac
+#define ISP_CCM_MTX_22_23_RS_MTX_22_MASK		GENMASK(12, 0)
+#define ISP_CCM_MTX_22_23_RS_MTX_22(x)			((x) << 0)
+
+#define ISP_PST_GAMMA_LUT_ADDR				0x60cc
+#define ISP_PST_GAMMA_LUT_ADDR_IDX_ADDR(x)		((x) << 7)
+
+#define ISP_PST_GAMMA_LUT_DATA				0x60d0
+#define ISP_PST_GM_LUT_DATA0(x)		(((x) & GENMASK(15, 0)) << 0)
+#define ISP_PST_GM_LUT_DATA1(x)		(((x) & GENMASK(15, 0)) << 16)
+
+#define DISP0_TOP_TOP_CTRL				0x8000
+#define DISP0_TOP_TOP_CTRL_CROP2_EN_MASK		BIT(5)
+#define DISP0_TOP_TOP_CTRL_CROP2_EN			BIT(5)
+#define DISP0_TOP_TOP_CTRL_CROP2_DIS			(0 << 5)
+
+#define DISP0_TOP_CRP2_START				0x8004
+#define DISP0_TOP_CRP2_START_V_START_MASK		GENMASK(15, 0)
+#define DISP0_TOP_CRP2_START_V_START(x)			((x) << 0)
+#define DISP0_TOP_CRP2_START_H_START_MASK		GENMASK(31, 16)
+#define DISP0_TOP_CRP2_START_H_START(x)			((x) << 16)
+
+#define DISP0_TOP_CRP2_SIZE				0x8008
+#define DISP0_TOP_CRP2_SIZE_V_SIZE_MASK			GENMASK(15, 0)
+#define DISP0_TOP_CRP2_SIZE_V_SIZE(x)			((x) << 0)
+#define DISP0_TOP_CRP2_SIZE_H_SIZE_MASK			GENMASK(31, 16)
+#define DISP0_TOP_CRP2_SIZE_H_SIZE(x)			((x) << 16)
+
+#define DISP0_TOP_OUT_SIZE				0x800c
+#define DISP0_TOP_OUT_SIZE_SCL_OUT_HEIGHT_MASK		GENMASK(12, 0)
+#define DISP0_TOP_OUT_SIZE_SCL_OUT_HEIGHT(x)		((x) << 0)
+#define DISP0_TOP_OUT_SIZE_SCL_OUT_WIDTH_MASK		GENMASK(28, 16)
+#define DISP0_TOP_OUT_SIZE_SCL_OUT_WIDTH(x)		((x) << 16)
+
+#define ISP_DISP0_TOP_IN_SIZE				0x804c
+#define ISP_DISP0_TOP_IN_SIZE_VSIZE_MASK		GENMASK(12, 0)
+#define ISP_DISP0_TOP_IN_SIZE_VSIZE(x)			((x) << 0)
+#define ISP_DISP0_TOP_IN_SIZE_HSIZE_MASK		GENMASK(28, 16)
+#define ISP_DISP0_TOP_IN_SIZE_HSIZE(x)			((x) << 16)
+
+#define DISP0_PPS_SCALE_EN				0x8200
+#define DISP0_PPS_SCALE_EN_VSC_TAP_NUM_MASK		GENMASK(3, 0)
+#define DISP0_PPS_SCALE_EN_VSC_TAP_NUM(x)		((x) << 0)
+#define DISP0_PPS_SCALE_EN_HSC_TAP_NUM_MASK		GENMASK(7, 4)
+#define DISP0_PPS_SCALE_EN_HSC_TAP_NUM(x)		((x) << 4)
+#define DISP0_PPS_SCALE_EN_PREVSC_FLT_NUM_MASK		GENMASK(11, 8)
+#define DISP0_PPS_SCALE_EN_PREVSC_FLT_NUM(x)		((x) << 8)
+#define DISP0_PPS_SCALE_EN_PREHSC_FLT_NUM_MASK		GENMASK(15, 12)
+#define DISP0_PPS_SCALE_EN_PREHSC_FLT_NUM(x)		((x) << 12)
+#define DISP0_PPS_SCALE_EN_PREVSC_RATE_MASK		GENMASK(17, 16)
+#define DISP0_PPS_SCALE_EN_PREVSC_RATE(x)		((x) << 16)
+#define DISP0_PPS_SCALE_EN_PREHSC_RATE_MASK		GENMASK(19, 18)
+#define DISP0_PPS_SCALE_EN_PREHSC_RATE(x)		((x) << 18)
+#define DISP0_PPS_SCALE_EN_HSC_EN_MASK			BIT(20)
+#define DISP0_PPS_SCALE_EN_HSC_EN(x)			((x) << 20)
+#define DISP0_PPS_SCALE_EN_HSC_DIS			(0 << 20)
+#define DISP0_PPS_SCALE_EN_VSC_EN_MASK			BIT(21)
+#define DISP0_PPS_SCALE_EN_VSC_EN(x)			((x) << 21)
+#define DISP0_PPS_SCALE_EN_VSC_DIS			(0 << 21)
+#define DISP0_PPS_SCALE_EN_PREVSC_EN_MASK		BIT(22)
+#define DISP0_PPS_SCALE_EN_PREVSC_EN(x)			((x) << 22)
+#define DISP0_PPS_SCALE_EN_PREVSC_DIS			(0 << 22)
+#define DISP0_PPS_SCALE_EN_PREHSC_EN_MASK		BIT(23)
+#define DISP0_PPS_SCALE_EN_PREHSC_EN(x)			((x) << 23)
+#define DISP0_PPS_SCALE_EN_PREHSC_DIS			(0 << 23)
+#define DISP0_PPS_SCALE_EN_HSC_NOR_RS_BITS_MASK		GENMASK(27, 24)
+#define DISP0_PPS_SCALE_EN_HSC_NOR_RS_BITS(x)		((x) << 24)
+#define DISP0_PPS_SCALE_EN_VSC_NOR_RS_BITS_MASK		GENMASK(31, 28)
+#define DISP0_PPS_SCALE_EN_VSC_NOR_RS_BITS(x)		((x) << 28)
+
+#define DISP0_PPS_VSC_START_PHASE_STEP			0x8224
+#define DISP0_PPS_VSC_START_PHASE_STEP_VERT_FRAC_MASK	GENMASK(23, 0)
+#define DISP0_PPS_VSC_START_PHASE_STEP_VERT_FRAC(x)	((x) << 0)
+#define DISP0_PPS_VSC_START_PHASE_STEP_VERT_INTE_MASK	GENMASK(27, 24)
+#define DISP0_PPS_VSC_START_PHASE_STEP_VERT_INTE(x)	((x) << 24)
+
+#define DISP0_PPS_HSC_START_PHASE_STEP			0x8230
+#define DISP0_PPS_HSC_START_PHASE_STEP_HORIZ_FRAC_MASK	GENMASK(23, 0)
+#define DISP0_PPS_HSC_START_PHASE_STEP_HORIZ_FRAC(x)	((x) << 0)
+#define DISP0_PPS_HSC_START_PHASE_STEP_HORIZ_INTE_MASK	GENMASK(27, 24)
+#define DISP0_PPS_HSC_START_PHASE_STEP_HORIZ_INTE(x)	((x) << 24)
+
+#define DISP0_PPS_444TO422				0x823c
+#define DISP0_PPS_444TO422_EN_MASK			BIT(0)
+#define DISP0_PPS_444TO422_EN(x)			((x) << 0)
+
+#define ISP_SCALE0_COEF_IDX_LUMA			0x8240
+#define ISP_SCALE0_COEF_IDX_LUMA_COEF_S11_MODE_MASK	BIT(9)
+#define ISP_SCALE0_COEF_IDX_LUMA_COEF_S11_MODE_EN	BIT(9)
+#define ISP_SCALE0_COEF_IDX_LUMA_COEF_S11_MODE_DIS	(0 << 9)
+#define ISP_SCALE0_COEF_IDX_LUMA_CTYPE_MASK		GENMASK(12, 10)
+#define ISP_SCALE0_COEF_IDX_LUMA_CTYPE(x)		((x) << 10)
+
+#define ISP_SCALE0_COEF_LUMA				0x8244
+#define ISP_SCALE0_COEF_LUMA_DATA1(x)		(((x) & GENMASK(10, 0)) << 0)
+#define ISP_SCALE0_COEF_LUMA_DATA0(x)		(((x) & GENMASK(10, 0)) << 16)
+
+#define ISP_SCALE0_COEF_IDX_CHRO			0x8248
+#define ISP_SCALE0_COEF_IDX_CHRO_COEF_S11_MODE_MASK	BIT(9)
+#define ISP_SCALE0_COEF_IDX_CHRO_COEF_S11_MODE_EN	BIT(9)
+#define ISP_SCALE0_COEF_IDX_CHRO_COEF_S11_MODE_DIS	(0 << 9)
+#define ISP_SCALE0_COEF_IDX_CHRO_CTYPE_MASK		GENMASK(12, 10)
+#define ISP_SCALE0_COEF_IDX_CHRO_CTYPE(x)		((x) << 10)
+
+#define ISP_SCALE0_COEF_CHRO				0x824c
+#define ISP_SCALE0_COEF_CHRO_DATA1(x)		(((x) & GENMASK(10, 0)) << 0)
+#define ISP_SCALE0_COEF_CHRO_DATA0(x)		(((x) & GENMASK(10, 0)) << 16)
+
+#define ISP_AF_CTRL					0xa044
+#define ISP_AF_CTRL_VERT_OFST_MASK			GENMASK(15, 14)
+#define ISP_AF_CTRL_VERT_OFST(x)			((x) << 14)
+#define ISP_AF_CTRL_HORIZ_OFST_MASK			GENMASK(17, 16)
+#define ISP_AF_CTRL_HORIZ_OFST(x)			((x) << 16)
+
+#define ISP_AF_HV_SIZE					0xa04c
+#define ISP_AF_HV_SIZE_GLB_WIN_YSIZE_MASK		GENMASK(15, 0)
+#define ISP_AF_HV_SIZE_GLB_WIN_YSIZE(x)			((x) << 0)
+#define ISP_AF_HV_SIZE_GLB_WIN_XSIZE_MASK		GENMASK(31, 16)
+#define ISP_AF_HV_SIZE_GLB_WIN_XSIZE(x)			((x) << 16)
+
+#define ISP_AF_HV_BLKNUM				0xa050
+#define ISP_AF_HV_BLKNUM_V_NUM_MASK			GENMASK(5, 0)
+#define ISP_AF_HV_BLKNUM_V_NUM(x)			((x) << 0)
+#define ISP_AF_HV_BLKNUM_H_NUM_MASK			GENMASK(21, 16)
+#define ISP_AF_HV_BLKNUM_H_NUM(x)			((x) << 16)
+
+#define ISP_AF_EN_CTRL					0xa054
+#define ISP_AF_EN_CTRL_STAT_SEL_MASK			BIT(21)
+#define ISP_AF_EN_CTRL_STAT_SEL_OLD			(0 << 21)
+#define ISP_AF_EN_CTRL_STAT_SEL_NEW			BIT(21)
+
+#define ISP_AF_IDX_ADDR					0xa1c0
+#define ISP_AF_IDX_DATA					0xa1c4
+#define ISP_AF_IDX_DATA_VIDX_DATA(x)		(((x) & GENMASK(15, 0)) << 0)
+#define ISP_AF_IDX_DATA_HIDX_DATA(x)		(((x) & GENMASK(15, 0)) << 16)
+
+#define ISP_AE_CTRL					0xa448
+#define ISP_AE_CTRL_INPUT_2LINE_MASK			BIT(7)
+#define ISP_AE_CTRL_INPUT_2LINE_EN			BIT(7)
+#define ISP_AE_CTRL_INPUT_2LINE_DIS			(0 << 7)
+#define ISP_AE_CTRL_LUMA_MODE_MASK			GENMASK(9, 8)
+#define ISP_AE_CTRL_LUMA_MODE_CUR			(0 << 8)
+#define ISP_AE_CTRL_LUMA_MODE_MAX			BIT(8)
+#define ISP_AE_CTRL_LUMA_MODE_FILTER			(2 << 8)
+#define ISP_AE_CTRL_VERT_OFST_MASK			GENMASK(25, 24)
+#define ISP_AE_CTRL_VERT_OFST(x)			((x) << 24)
+#define ISP_AE_CTRL_HORIZ_OFST_MASK			GENMASK(27, 26)
+#define ISP_AE_CTRL_HORIZ_OFST(x)			((x) << 26)
+
+#define ISP_AE_HV_SIZE					0xa464
+#define ISP_AE_HV_SIZE_VERT_SIZE_MASK			GENMASK(15, 0)
+#define ISP_AE_HV_SIZE_VERT_SIZE(x)			((x) << 0)
+#define ISP_AE_HV_SIZE_HORIZ_SIZE_MASK			GENMASK(31, 16)
+#define ISP_AE_HV_SIZE_HORIZ_SIZE(x)			((x) << 16)
+
+#define ISP_AE_HV_BLKNUM				0xa468
+#define ISP_AE_HV_BLKNUM_V_NUM_MASK			GENMASK(6, 0)
+#define ISP_AE_HV_BLKNUM_V_NUM(x)			((x) << 0)
+#define ISP_AE_HV_BLKNUM_H_NUM_MASK			GENMASK(22, 16)
+#define ISP_AE_HV_BLKNUM_H_NUM(x)			((x) << 16)
+
+#define ISP_AE_IDX_ADDR					0xa600
+#define ISP_AE_IDX_DATA					0xa604
+#define ISP_AE_IDX_DATA_VIDX_DATA(x)		(((x) & GENMASK(15, 0)) << 0)
+#define ISP_AE_IDX_DATA_HIDX_DATA(x)		(((x) & GENMASK(15, 0)) << 16)
+
+#define ISP_AE_BLK_WT_ADDR				0xa608
+#define ISP_AE_BLK_WT_DATA				0xa60c
+#define ISP_AE_BLK_WT_DATA_WT(i, x)	(((x) & GENMASK(3, 0)) << ((i) * 4))
+
+#define ISP_AWB_CTRL					0xa834
+#define ISP_AWB_CTRL_VERT_OFST_MASK			GENMASK(1, 0)
+#define ISP_AWB_CTRL_VERT_OFST(x)			((x) << 0)
+#define ISP_AWB_CTRL_HORIZ_OFST_MASK			GENMASK(3, 2)
+#define ISP_AWB_CTRL_HORIZ_OFST(x)			((x) << 2)
+
+#define ISP_AWB_HV_SIZE					0xa83c
+#define ISP_AWB_HV_SIZE_VERT_SIZE_MASK			GENMASK(15, 0)
+#define ISP_AWB_HV_SIZE_VERT_SIZE(x)			((x) << 0)
+#define ISP_AWB_HV_SIZE_HORIZ_SIZE_MASK			GENMASK(31, 16)
+#define ISP_AWB_HV_SIZE_HORIZ_SIZE(x)			((x) << 16)
+
+#define ISP_AWB_HV_BLKNUM				0xa840
+#define ISP_AWB_HV_BLKNUM_V_NUM_MASK			GENMASK(5, 0)
+#define ISP_AWB_HV_BLKNUM_V_NUM(x)			((x) << 0)
+#define ISP_AWB_HV_BLKNUM_H_NUM_MASK			GENMASK(21, 16)
+#define ISP_AWB_HV_BLKNUM_H_NUM(x)			((x) << 16)
+
+#define ISP_AWB_STAT_RG					0xa848
+#define ISP_AWB_STAT_RG_MIN_VALUE_MASK			GENMASK(11, 0)
+#define ISP_AWB_STAT_RG_MIN_VALUE(x)			((x) << 0)
+#define ISP_AWB_STAT_RG_MAX_VALUE_MASK			GENMASK(27, 16)
+#define ISP_AWB_STAT_RG_MAX_VALUE(x)			((x) << 16)
+
+#define ISP_AWB_STAT_BG					0xa84c
+#define ISP_AWB_STAT_BG_MIN_VALUE_MASK			GENMASK(11, 0)
+#define ISP_AWB_STAT_BG_MIN_VALUE(x)			((x) << 0)
+#define ISP_AWB_STAT_BG_MAX_VALUE_MASK			GENMASK(27, 16)
+#define ISP_AWB_STAT_BG_MAX_VALUE(x)			((x) << 16)
+
+#define ISP_AWB_STAT_RG_HL				0xa850
+#define ISP_AWB_STAT_RG_HL_LOW_VALUE_MASK		GENMASK(11, 0)
+#define ISP_AWB_STAT_RG_HL_LOW_VALUE(x)			((x) << 0)
+#define ISP_AWB_STAT_RG_HL_HIGH_VALUE_MASK		GENMASK(27, 16)
+#define ISP_AWB_STAT_RG_HL_HIGH_VALUE(x)		((x) << 16)
+
+#define ISP_AWB_STAT_BG_HL				0xa854
+#define ISP_AWB_STAT_BG_HL_LOW_VALUE_MASK		GENMASK(11, 0)
+#define ISP_AWB_STAT_BG_HL_LOW_VALUE(x)			((x) << 0)
+#define ISP_AWB_STAT_BG_HL_HIGH_VALUE_MASK		GENMASK(27, 16)
+#define ISP_AWB_STAT_BG_HL_HIGH_VALUE(x)		((x) << 16)
+
+#define ISP_AWB_STAT_CTRL2				0xa858
+#define ISP_AWB_STAT_CTRL2_SATUR_CTRL_MASK		BIT(0)
+#define ISP_AWB_STAT_CTRL2_SATUR_CTRL(x)		((x) << 0)
+
+#define ISP_AWB_IDX_ADDR				0xaa00
+#define ISP_AWB_IDX_DATA				0xaa04
+#define ISP_AWB_IDX_DATA_VIDX_DATA(x)		(((x) & GENMASK(15, 0)) << 0)
+#define ISP_AWB_IDX_DATA_HIDX_DATA(x)		(((x) & GENMASK(15, 0)) << 16)
+
+#define ISP_AWB_BLK_WT_ADDR				0xaa08
+#define ISP_AWB_BLK_WT_DATA				0xaa0c
+#define ISP_AWB_BLK_WT_DATA_WT(i, x)	(((x) & GENMASK(3, 0)) << ((i) * 4))
+
+#define ISP_WRMIFX3_0_CH0_CTRL0				0xc400
+#define ISP_WRMIFX3_0_CH0_CTRL0_STRIDE_MASK		GENMASK(28, 16)
+#define ISP_WRMIFX3_0_CH0_CTRL0_STRIDE(x)		((x) << 16)
+
+#define ISP_WRMIFX3_0_CH0_CTRL1				0xc404
+#define ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_MODE_MASK	GENMASK(30, 27)
+#define ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_8BITS		BIT(27)
+#define ISP_WRMIFX3_0_CH0_CTRL1_PIX_BITS_16BITS		(2 << 27)
+
+#define ISP_WRMIFX3_0_CH1_CTRL0				0xc408
+#define ISP_WRMIFX3_0_CH1_CTRL0_STRIDE_MASK		GENMASK(28, 16)
+#define ISP_WRMIFX3_0_CH1_CTRL0_STRIDE(x)		((x) << 16)
+
+#define ISP_WRMIFX3_0_CH1_CTRL1				0xc40c
+#define ISP_WRMIFX3_0_CH1_CTRL1_PIX_BITS_MODE_MASK	GENMASK(30, 27)
+#define ISP_WRMIFX3_0_CH1_CTRL1_PIX_BITS_8BITS		BIT(27)
+#define ISP_WRMIFX3_0_CH1_CTRL1_PIX_BITS_16BITS		(2 << 27)
+#define ISP_WRMIFX3_0_CH1_CTRL1_PIX_BITS_32BITS		(3 << 27)
+
+#define ISP_WRMIFX3_0_WIN_LUMA_H			0xc420
+#define ISP_WRMIFX3_0_WIN_LUMA_H_LUMA_HEND_MASK		GENMASK(28, 16)
+#define ISP_WRMIFX3_0_WIN_LUMA_H_LUMA_HEND(x)		(((x) - 1) << 16)
+
+#define ISP_WRMIFX3_0_WIN_LUMA_V			0xc424
+#define ISP_WRMIFX3_0_WIN_LUMA_V_LUMA_VEND_MASK		GENMASK(28, 16)
+#define ISP_WRMIFX3_0_WIN_LUMA_V_LUMA_VEND(x)		(((x) - 1) << 16)
+
+#define ISP_WRMIFX3_0_WIN_CHROM_H			0xc428
+#define ISP_WRMIFX3_0_WIN_CHROM_H_CHROM_HEND_MASK	GENMASK(28, 16)
+#define ISP_WRMIFX3_0_WIN_CHROM_H_CHROM_HEND(x)		(((x) - 1) << 16)
+
+#define ISP_WRMIFX3_0_WIN_CHROM_V			0xc42c
+#define ISP_WRMIFX3_0_WIN_CHROM_V_CHROM_VEND_MASK	GENMASK(28, 16)
+#define ISP_WRMIFX3_0_WIN_CHROM_V_CHROM_VEND(x)		(((x) - 1) << 16)
+
+#define ISP_WRMIFX3_0_CH0_BADDR				0xc440
+#define ISP_WRMIFX3_0_CH0_BASE_ADDR(x)			((x) >> 4)
+
+#define ISP_WRMIFX3_0_CH1_BADDR				0xc444
+#define ISP_WRMIFX3_0_CH1_BASE_ADDR(x)			((x) >> 4)
+
+#define ISP_WRMIFX3_0_FMT_SIZE				0xc464
+#define ISP_WRMIFX3_0_FMT_SIZE_HSIZE_MASK		GENMASK(15, 0)
+#define ISP_WRMIFX3_0_FMT_SIZE_HSIZE(x)			((x) << 0)
+#define ISP_WRMIFX3_0_FMT_SIZE_VSIZE_MASK		GENMASK(31, 16)
+#define ISP_WRMIFX3_0_FMT_SIZE_VSIZE(x)			((x) << 16)
+
+#define ISP_WRMIFX3_0_FMT_CTRL				0xc468
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_MASK		GENMASK(1, 0)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_8BIT		(0 << 0)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_10BIT		BIT(0)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_12BIT		(2 << 0)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_IBITS_16BIT		(3 << 0)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_MASK		BIT(2)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_VU		(0 << 2)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_UV_SWAP_UV		BIT(2)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_MASK		GENMASK(5, 4)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X1		(0 << 4)
+#define ISP_WRMIFX3_0_FMT_CTRL_MTX_PLANE_X2		BIT(4)
+#define ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_MASK		GENMASK(18, 16)
+#define ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_YUV422		BIT(16)
+#define ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_YUV420		(2 << 16)
+#define ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_Y_ONLY		(3 << 16)
+#define ISP_WRMIFX3_0_FMT_CTRL_MODE_OUT_RAW		(4 << 16)
+
+#define VIU_DMAWR_BADDR0				0xc840
+#define VIU_DMAWR_BADDR0_AF_STATS_BASE_ADDR_MASK	GENMASK(27, 0)
+#define VIU_DMAWR_BADDR0_AF_STATS_BASE_ADDR(x)		((x) >> 4)
+
+#define VIU_DMAWR_BADDR1				0xc844
+#define VIU_DMAWR_BADDR1_AWB_STATS_BASE_ADDR_MASK	GENMASK(27, 0)
+#define VIU_DMAWR_BADDR1_AWB_STATS_BASE_ADDR(x)		((x) >> 4)
+
+#define VIU_DMAWR_BADDR2				0xc848
+#define VIU_DMAWR_BADDR2_AE_STATS_BASE_ADDR_MASK	GENMASK(27, 0)
+#define VIU_DMAWR_BADDR2_AE_STATS_BASE_ADDR(x)		((x) >> 4)
+
+#define VIU_DMAWR_SIZE0					0xc854
+#define VIU_DMAWR_SIZE0_AF_STATS_SIZE_MASK		GENMASK(15, 0)
+#define VIU_DMAWR_SIZE0_AF_STATS_SIZE(x)		((x) << 0)
+#define VIU_DMAWR_SIZE0_AWB_STATS_SIZE_MASK		GENMASK(31, 16)
+#define VIU_DMAWR_SIZE0_AWB_STATS_SIZE(x)		((x) << 16)
+
+#define VIU_DMAWR_SIZE1					0xc858
+#define VIU_DMAWR_SIZE1_AE_STATS_SIZE_MASK		GENMASK(15, 0)
+#define VIU_DMAWR_SIZE1_AE_STATS_SIZE(x)		((x) << 0)
+
+#endif
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
new file mode 100644
index 000000000000..453a889e0b27
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
@@ -0,0 +1,892 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/pm_runtime.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+
+#define C3_ISP_RSZ_DEF_PAD_FMT		MEDIA_BUS_FMT_YUV10_1X30
+#define C3_ISP_DISP_REG(base, id)	((base) + (id) * 0x400)
+#define C3_ISP_PPS_LUT_H_NUM		33
+#define C3_ISP_PPS_LUT_CTYPE_0		0
+#define C3_ISP_PPS_LUT_CTYPE_2		2
+#define C3_ISP_SCL_EN			1
+#define C3_ISP_SCL_DIS			0
+
+/*
+ * struct c3_isp_rsz_format_info - ISP resizer format information
+ *
+ * @mbus_code: the mbus code
+ * @pads: bitmask detailing valid pads for this mbus_code
+ * @is_raw: the raw format flag of mbus code
+ */
+struct c3_isp_rsz_format_info {
+	u32 mbus_code;
+	u32 pads;
+	bool is_raw;
+};
+
+static const struct c3_isp_rsz_format_info c3_isp_rsz_fmts[] = {
+	/* RAW formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(C3_ISP_RSZ_PAD_SINK)
+				| BIT(C3_ISP_RSZ_PAD_SOURCE),
+		.is_raw = true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(C3_ISP_RSZ_PAD_SINK)
+				| BIT(C3_ISP_RSZ_PAD_SOURCE),
+		.is_raw = true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(C3_ISP_RSZ_PAD_SINK)
+				| BIT(C3_ISP_RSZ_PAD_SOURCE),
+		.is_raw = true,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(C3_ISP_RSZ_PAD_SINK)
+				| BIT(C3_ISP_RSZ_PAD_SOURCE),
+		.is_raw = true,
+	},
+	/* YUV formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUV10_1X30,
+		.pads		= BIT(C3_ISP_RSZ_PAD_SINK)
+				| BIT(C3_ISP_RSZ_PAD_SOURCE),
+		.is_raw = false,
+	},
+};
+
+/*
+ * struct c3_isp_pps_io_size - ISP scaler input and output size
+ *
+ * @thsize: input horizontal size of after preprocessing
+ * @tvsize: input vertical size of after preprocessing
+ * @ohsize: output horizontal size
+ * @ovsize: output vertical size
+ * @ihsize: input horizontal size
+ * @max_hsize: maximum horizontal size
+ */
+struct c3_isp_pps_io_size {
+	u32 thsize;
+	u32 tvsize;
+	u32 ohsize;
+	u32 ovsize;
+	u32 ihsize;
+	u32 max_hsize;
+};
+
+/* The normal parameters of pps module */
+static const int c3_isp_pps_lut[C3_ISP_PPS_LUT_H_NUM][4] =  {
+	{  0, 511,   0,   0}, { -5, 511,   5,   0}, {-10, 511,  11,   0},
+	{-14, 510,  17,  -1}, {-18, 508,  23,  -1}, {-22, 506,  29,  -1},
+	{-25, 503,  36,  -2}, {-28, 500,  43,  -3}, {-32, 496,  51,  -3},
+	{-34, 491,  59,  -4}, {-37, 487,  67,  -5}, {-39, 482,  75,  -6},
+	{-41, 476,  84,  -7}, {-42, 470,  92,  -8}, {-44, 463, 102,  -9},
+	{-45, 456, 111, -10}, {-45, 449, 120, -12}, {-47, 442, 130, -13},
+	{-47, 434, 140, -15}, {-47, 425, 151, -17}, {-47, 416, 161, -18},
+	{-47, 407, 172, -20}, {-47, 398, 182, -21}, {-47, 389, 193, -23},
+	{-46, 379, 204, -25}, {-45, 369, 215, -27}, {-44, 358, 226, -28},
+	{-43, 348, 237, -30}, {-43, 337, 249, -31}, {-41, 326, 260, -33},
+	{-40, 316, 271, -35}, {-39, 305, 282, -36}, {-37, 293, 293, -37}
+};
+
+static const struct c3_isp_rsz_format_info
+*rsz_find_format_by_code(u32 code, u32 pad)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(c3_isp_rsz_fmts); i++) {
+		const struct c3_isp_rsz_format_info *info = &c3_isp_rsz_fmts[i];
+
+		if (info->mbus_code == code && info->pads & BIT(pad))
+			return info;
+	}
+
+	return NULL;
+}
+
+static const struct c3_isp_rsz_format_info
+*rsz_find_format_by_index(u32 index, u32 pad)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(c3_isp_rsz_fmts); i++) {
+		const struct c3_isp_rsz_format_info *info = &c3_isp_rsz_fmts[i];
+
+		if (!(info->pads & BIT(pad)))
+			continue;
+
+		if (!index)
+			return info;
+
+		index--;
+	}
+
+	return NULL;
+}
+
+static void c3_isp_rsz_pps_size(struct c3_isp_resizer *rsz,
+				struct c3_isp_pps_io_size *io_size)
+{
+	int thsize = io_size->thsize;
+	int tvsize = io_size->tvsize;
+	u32 ohsize = io_size->ohsize;
+	u32 ovsize = io_size->ovsize;
+	u32 ihsize = io_size->ihsize;
+	u32 max_hsize = io_size->max_hsize;
+	int h_int;
+	int v_int;
+	int h_fract;
+	int v_fract;
+	int yuv444to422_en;
+
+	/* Calculate the integer part of horizonal scaler step */
+	h_int = thsize / ohsize;
+
+	/* Calculate the vertical part of horizonal scaler step */
+	v_int = tvsize / ovsize;
+
+	/*
+	 * Calculate the fraction part of horizonal scaler step.
+	 * step_h_fraction = (source / dest) * 2^24,
+	 * so step_h_fraction = ((source << 12) / dest) << 12.
+	 */
+	h_fract = ((thsize << 12) / ohsize) << 12;
+
+	/*
+	 * Calculate the fraction part of vertical scaler step
+	 * step_v_fraction = (source / dest) * 2^24,
+	 * so step_v_fraction = ((source << 12) / dest) << 12.
+	 */
+	v_fract = ((tvsize << 12) / ovsize) << 12;
+
+	yuv444to422_en = ihsize > (max_hsize / 2) ? 1 : 0;
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_444TO422, rsz->id),
+			   DISP0_PPS_444TO422_EN_MASK,
+			   DISP0_PPS_444TO422_EN(yuv444to422_en));
+
+	c3_isp_write(rsz->isp,
+		     C3_ISP_DISP_REG(DISP0_PPS_VSC_START_PHASE_STEP, rsz->id),
+		     DISP0_PPS_VSC_START_PHASE_STEP_VERT_FRAC(v_fract) |
+		     DISP0_PPS_VSC_START_PHASE_STEP_VERT_INTE(v_int));
+
+	c3_isp_write(rsz->isp,
+		     C3_ISP_DISP_REG(DISP0_PPS_HSC_START_PHASE_STEP, rsz->id),
+		     DISP0_PPS_HSC_START_PHASE_STEP_HORIZ_FRAC(h_fract) |
+		     DISP0_PPS_HSC_START_PHASE_STEP_HORIZ_INTE(h_int));
+}
+
+static void c3_isp_rsz_pps_lut(struct c3_isp_resizer *rsz, u32 ctype)
+{
+	unsigned int i;
+
+	/*
+	 * Default value of this register is 0, so only need to set
+	 * SCALE_LUMA_COEF_S11_MODE and SCALE_LUMA_CTYPE. This register needs
+	 * to be written in one time.
+	 */
+	c3_isp_write(rsz->isp,
+		     C3_ISP_DISP_REG(ISP_SCALE0_COEF_IDX_LUMA, rsz->id),
+		     ISP_SCALE0_COEF_IDX_LUMA_COEF_S11_MODE_EN |
+		     ISP_SCALE0_COEF_IDX_LUMA_CTYPE(ctype));
+
+	for (i = 0; i < C3_ISP_PPS_LUT_H_NUM; i++) {
+		c3_isp_write(rsz->isp,
+			     C3_ISP_DISP_REG(ISP_SCALE0_COEF_LUMA, rsz->id),
+			     ISP_SCALE0_COEF_LUMA_DATA0(c3_isp_pps_lut[i][0]) |
+			     ISP_SCALE0_COEF_LUMA_DATA1(c3_isp_pps_lut[i][1]));
+		c3_isp_write(rsz->isp,
+			     C3_ISP_DISP_REG(ISP_SCALE0_COEF_LUMA, rsz->id),
+			     ISP_SCALE0_COEF_LUMA_DATA0(c3_isp_pps_lut[i][2]) |
+			     ISP_SCALE0_COEF_LUMA_DATA1(c3_isp_pps_lut[i][3]));
+	}
+
+	/*
+	 * Default value of this register is 0, so only need to set
+	 * SCALE_CHRO_COEF_S11_MODE and SCALE_CHRO_CTYPE. This register needs
+	 * to be written in one time.
+	 */
+	c3_isp_write(rsz->isp,
+		     C3_ISP_DISP_REG(ISP_SCALE0_COEF_IDX_CHRO, rsz->id),
+		     ISP_SCALE0_COEF_IDX_CHRO_COEF_S11_MODE_EN |
+		     ISP_SCALE0_COEF_IDX_CHRO_CTYPE(ctype));
+
+	for (i = 0; i < C3_ISP_PPS_LUT_H_NUM; i++) {
+		c3_isp_write(rsz->isp,
+			     C3_ISP_DISP_REG(ISP_SCALE0_COEF_CHRO, rsz->id),
+			     ISP_SCALE0_COEF_CHRO_DATA0(c3_isp_pps_lut[i][0]) |
+			     ISP_SCALE0_COEF_CHRO_DATA1(c3_isp_pps_lut[i][1]));
+		c3_isp_write(rsz->isp,
+			     C3_ISP_DISP_REG(ISP_SCALE0_COEF_CHRO, rsz->id),
+			     ISP_SCALE0_COEF_CHRO_DATA0(c3_isp_pps_lut[i][2]) |
+			     ISP_SCALE0_COEF_CHRO_DATA1(c3_isp_pps_lut[i][3]));
+	}
+}
+
+static void c3_isp_rsz_pps_disable(struct c3_isp_resizer *rsz)
+{
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_HSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_HSC_DIS);
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_VSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_VSC_DIS);
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREVSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_PREVSC_DIS);
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREHSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_PREHSC_DIS);
+}
+
+static int c3_isp_rsz_pps_enable(struct c3_isp_resizer *rsz,
+				 struct v4l2_subdev_state *state)
+{
+	struct v4l2_rect *crop;
+	struct v4l2_rect *cmps;
+	int max_hsize;
+	int hsc_en, vsc_en;
+	int preh_en, prev_en;
+	u32 prehsc_rate;
+	u32 prevsc_flt_num;
+	int pre_vscale_max_hsize;
+	u32 ihsize_after_pre_hsc;
+	u32 ihsize_after_pre_hsc_alt;
+	u32 vsc_tap_num_alt;
+	u32 ihsize;
+	u32 ivsize;
+	struct c3_isp_pps_io_size io_size;
+
+	crop = v4l2_subdev_state_get_crop(state, C3_ISP_RSZ_PAD_SINK);
+	cmps = v4l2_subdev_state_get_compose(state, C3_ISP_RSZ_PAD_SINK);
+
+	ihsize = crop->width;
+	ivsize = crop->height;
+
+	hsc_en = (ihsize == cmps->width) ? C3_ISP_SCL_DIS : C3_ISP_SCL_EN;
+	vsc_en = (ivsize == cmps->height) ? C3_ISP_SCL_DIS : C3_ISP_SCL_EN;
+
+	/* Disable pps when there no need to use pps */
+	if (!hsc_en && !vsc_en) {
+		c3_isp_rsz_pps_disable(rsz);
+		return 0;
+	}
+
+	/* Pre-scale needs to be enable if the down scaling factor exceeds 4 */
+	preh_en = (ihsize > cmps->width * 4) ? C3_ISP_SCL_EN : C3_ISP_SCL_DIS;
+	prev_en = (ivsize > cmps->height * 4) ? C3_ISP_SCL_EN : C3_ISP_SCL_DIS;
+
+	if (rsz->id == C3_ISP_RSZ_2) {
+		max_hsize = C3_ISP_MAX_WIDTH;
+
+		/* Set vertical tap number */
+		prevsc_flt_num = 4;
+
+		/* Set the max hsize of pre-vertical scale */
+		pre_vscale_max_hsize = max_hsize / 2;
+	} else {
+		max_hsize = C3_ISP_DEFAULT_WIDTH;
+
+		/* Set vertical tap number and the max hsize of pre-vertical */
+		if (ihsize > (max_hsize / 2) &&
+		    ihsize <= max_hsize && prev_en) {
+			prevsc_flt_num = 2;
+			pre_vscale_max_hsize = max_hsize;
+		} else {
+			prevsc_flt_num = 4;
+			pre_vscale_max_hsize = max_hsize / 2;
+		}
+	}
+
+	/*
+	 * Set pre-horizonal scale rate and the hsize of after
+	 * pre-horizonal scale.
+	 */
+	if (preh_en) {
+		prehsc_rate = 1;
+		ihsize_after_pre_hsc = DIV_ROUND_UP(ihsize, 2);
+	} else {
+		prehsc_rate = 0;
+		ihsize_after_pre_hsc = ihsize;
+	}
+
+	/* Change pre-horizonal scale rate */
+	if (prev_en && ihsize_after_pre_hsc >= pre_vscale_max_hsize)
+		prehsc_rate += 1;
+
+	/* Set the actual hsize of after pre-horizonal scale */
+	if (preh_en)
+		ihsize_after_pre_hsc_alt =
+			DIV_ROUND_UP(ihsize, 1 << prehsc_rate);
+	else
+		ihsize_after_pre_hsc_alt = ihsize;
+
+	/* Set vertical scaler bank length */
+	if (ihsize_after_pre_hsc_alt <= (max_hsize / 2))
+		vsc_tap_num_alt = 4;
+	else if (ihsize_after_pre_hsc_alt <= max_hsize)
+		vsc_tap_num_alt = prev_en ? 2 : 4;
+	else
+		vsc_tap_num_alt = prev_en ? 4 : 2;
+
+	io_size.thsize = ihsize_after_pre_hsc_alt;
+	io_size.tvsize = prev_en ? DIV_ROUND_UP(ivsize, 2) : ivsize;
+	io_size.ohsize = cmps->width;
+	io_size.ovsize = cmps->height;
+	io_size.ihsize = ihsize;
+	io_size.max_hsize = max_hsize;
+
+	c3_isp_rsz_pps_size(rsz, &io_size);
+	c3_isp_rsz_pps_lut(rsz, C3_ISP_PPS_LUT_CTYPE_0);
+	c3_isp_rsz_pps_lut(rsz, C3_ISP_PPS_LUT_CTYPE_2);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_VSC_TAP_NUM_MASK,
+			   DISP0_PPS_SCALE_EN_VSC_TAP_NUM(vsc_tap_num_alt));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREVSC_FLT_NUM_MASK,
+			   DISP0_PPS_SCALE_EN_PREVSC_FLT_NUM(prevsc_flt_num));
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREVSC_RATE_MASK,
+			   DISP0_PPS_SCALE_EN_PREVSC_RATE(prev_en));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREHSC_RATE_MASK,
+			   DISP0_PPS_SCALE_EN_PREHSC_RATE(prehsc_rate));
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_HSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_HSC_EN(hsc_en));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_VSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_VSC_EN(vsc_en));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREVSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_PREVSC_EN(prev_en));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_PREHSC_EN_MASK,
+			   DISP0_PPS_SCALE_EN_PREHSC_EN(preh_en));
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_HSC_NOR_RS_BITS_MASK,
+			   DISP0_PPS_SCALE_EN_HSC_NOR_RS_BITS(9));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   DISP0_PPS_SCALE_EN_VSC_NOR_RS_BITS_MASK,
+			   DISP0_PPS_SCALE_EN_VSC_NOR_RS_BITS(9));
+
+	return 0;
+}
+
+static void c3_isp_rsz_start(struct c3_isp_resizer *rsz,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	const struct c3_isp_rsz_format_info *rsz_fmt;
+	struct v4l2_rect *sink_crop;
+	u32 mask;
+	u32 val;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, C3_ISP_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_state_get_crop(state, C3_ISP_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, C3_ISP_RSZ_PAD_SOURCE);
+	rsz_fmt = rsz_find_format_by_code(sink_fmt->code, C3_ISP_RSZ_PAD_SINK);
+
+	if (rsz->id == C3_ISP_RSZ_0) {
+		mask = ISP_TOP_DISPIN_SEL_DISP0_MASK;
+		val = rsz_fmt->is_raw ? ISP_TOP_DISPIN_SEL_DISP0_MIPI_OUT
+				      : ISP_TOP_DISPIN_SEL_DISP0_CORE_OUT;
+	} else if (rsz->id == C3_ISP_RSZ_1) {
+		mask = ISP_TOP_DISPIN_SEL_DISP1_MASK;
+		val = rsz_fmt->is_raw ? ISP_TOP_DISPIN_SEL_DISP1_MIPI_OUT
+				      : ISP_TOP_DISPIN_SEL_DISP1_CORE_OUT;
+	} else {
+		mask = ISP_TOP_DISPIN_SEL_DISP2_MASK;
+		val = rsz_fmt->is_raw ? ISP_TOP_DISPIN_SEL_DISP2_MIPI_OUT
+				      : ISP_TOP_DISPIN_SEL_DISP2_CORE_OUT;
+	}
+
+	c3_isp_update_bits(rsz->isp, ISP_TOP_DISPIN_SEL, mask, val);
+
+	c3_isp_write(rsz->isp, C3_ISP_DISP_REG(ISP_DISP0_TOP_IN_SIZE, rsz->id),
+		     ISP_DISP0_TOP_IN_SIZE_HSIZE(sink_fmt->width) |
+		     ISP_DISP0_TOP_IN_SIZE_VSIZE(sink_fmt->height));
+
+	c3_isp_write(rsz->isp, C3_ISP_DISP_REG(DISP0_TOP_CRP2_START, rsz->id),
+		     DISP0_TOP_CRP2_START_V_START(sink_crop->top) |
+		     DISP0_TOP_CRP2_START_H_START(sink_crop->left));
+
+	c3_isp_write(rsz->isp, C3_ISP_DISP_REG(DISP0_TOP_CRP2_SIZE, rsz->id),
+		     DISP0_TOP_CRP2_SIZE_V_SIZE(sink_crop->height) |
+		     DISP0_TOP_CRP2_SIZE_H_SIZE(sink_crop->width));
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_TOP_TOP_CTRL, rsz->id),
+			   DISP0_TOP_TOP_CTRL_CROP2_EN_MASK,
+			   DISP0_TOP_TOP_CTRL_CROP2_EN);
+
+	if (!rsz_fmt->is_raw)
+		c3_isp_rsz_pps_enable(rsz, state);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_TOP_OUT_SIZE, rsz->id),
+			   DISP0_TOP_OUT_SIZE_SCL_OUT_HEIGHT_MASK,
+			   DISP0_TOP_OUT_SIZE_SCL_OUT_HEIGHT(src_fmt->height));
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_TOP_OUT_SIZE, rsz->id),
+			   DISP0_TOP_OUT_SIZE_SCL_OUT_WIDTH_MASK,
+			   DISP0_TOP_OUT_SIZE_SCL_OUT_WIDTH(src_fmt->width));
+
+	if (rsz->id == C3_ISP_RSZ_0) {
+		mask = ISP_TOP_PATH_EN_DISP0_EN_MASK;
+		val = ISP_TOP_PATH_EN_DISP0_EN;
+	} else if (rsz->id == C3_ISP_RSZ_1) {
+		mask = ISP_TOP_PATH_EN_DISP1_EN_MASK;
+		val = ISP_TOP_PATH_EN_DISP1_EN;
+	} else {
+		mask = ISP_TOP_PATH_EN_DISP2_EN_MASK;
+		val = ISP_TOP_PATH_EN_DISP2_EN;
+	}
+
+	c3_isp_update_bits(rsz->isp, ISP_TOP_PATH_EN, mask, val);
+}
+
+static void c3_isp_rsz_stop(struct c3_isp_resizer *rsz)
+{
+	u32 mask;
+	u32 val;
+
+	if (rsz->id == C3_ISP_RSZ_0) {
+		mask = ISP_TOP_PATH_EN_DISP0_EN_MASK;
+		val = ISP_TOP_PATH_EN_DISP0_DIS;
+	} else if (rsz->id == C3_ISP_RSZ_1) {
+		mask = ISP_TOP_PATH_EN_DISP1_EN_MASK;
+		val = ISP_TOP_PATH_EN_DISP1_DIS;
+	} else {
+		mask = ISP_TOP_PATH_EN_DISP2_EN_MASK;
+		val = ISP_TOP_PATH_EN_DISP2_DIS;
+	}
+
+	c3_isp_update_bits(rsz->isp, ISP_TOP_PATH_EN, mask, val);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_ISP_DISP_REG(DISP0_TOP_TOP_CTRL, rsz->id),
+			   DISP0_TOP_TOP_CTRL_CROP2_EN_MASK,
+			   DISP0_TOP_TOP_CTRL_CROP2_DIS);
+
+	c3_isp_rsz_pps_disable(rsz);
+}
+
+static int c3_isp_rsz_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct c3_isp_resizer *rsz = v4l2_get_subdevdata(sd);
+
+	c3_isp_rsz_start(rsz, state);
+
+	c3_isp_params_pre_cfg(rsz->isp);
+	c3_isp_stats_pre_cfg(rsz->isp);
+
+	return v4l2_subdev_enable_streams(rsz->src_sd, rsz->src_pad, BIT(0));
+}
+
+static int c3_isp_rsz_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct c3_isp_resizer *rsz = v4l2_get_subdevdata(sd);
+
+	c3_isp_rsz_stop(rsz);
+
+	return v4l2_subdev_disable_streams(rsz->src_sd, rsz->src_pad, BIT(0));
+}
+
+static int c3_isp_rsz_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct c3_isp_rsz_format_info *info;
+
+	info = rsz_find_format_by_index(code->index, code->pad);
+	if (!info)
+		return -EINVAL;
+
+	code->code = info->mbus_code;
+
+	return 0;
+}
+
+static void c3_isp_rsz_set_sink_fmt(struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *sink_crop;
+	struct v4l2_rect *sink_cmps;
+	const struct c3_isp_rsz_format_info *rsz_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, format->pad);
+	sink_crop = v4l2_subdev_state_get_crop(state, format->pad);
+	sink_cmps = v4l2_subdev_state_get_compose(state, format->pad);
+	src_fmt = v4l2_subdev_state_get_format(state, C3_ISP_RSZ_PAD_SOURCE);
+
+	rsz_fmt = rsz_find_format_by_code(format->format.code, format->pad);
+	if (rsz_fmt)
+		sink_fmt->code = format->format.code;
+	else
+		sink_fmt->code = C3_ISP_RSZ_DEF_PAD_FMT;
+
+	sink_fmt->width = clamp_t(u32, format->format.width,
+				  C3_ISP_MIN_WIDTH, C3_ISP_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, format->format.height,
+				   C3_ISP_MIN_HEIGHT, C3_ISP_MAX_HEIGHT);
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+	if (rsz_fmt && rsz_fmt->is_raw) {
+		sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+		sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	} else {
+		sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+		sink_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+		sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+
+	sink_crop->width = sink_fmt->width;
+	sink_crop->height = sink_fmt->height;
+	sink_crop->left = 0;
+	sink_crop->top = 0;
+
+	sink_cmps->width = sink_crop->width;
+	sink_cmps->height = sink_crop->height;
+	sink_cmps->left = 0;
+	sink_cmps->top = 0;
+
+	src_fmt->code = sink_fmt->code;
+	src_fmt->width = sink_cmps->width;
+	src_fmt->height = sink_cmps->height;
+
+	format->format = *sink_fmt;
+}
+
+static void c3_isp_rsz_set_source_fmt(struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *sink_cmps;
+	const struct c3_isp_rsz_format_info *rsz_fmt;
+
+	src_fmt = v4l2_subdev_state_get_format(state, format->pad);
+	sink_fmt = v4l2_subdev_state_get_format(state, C3_ISP_RSZ_PAD_SINK);
+	sink_cmps = v4l2_subdev_state_get_compose(state, C3_ISP_RSZ_PAD_SINK);
+
+	src_fmt->code = sink_fmt->code;
+	src_fmt->width = sink_cmps->width;
+	src_fmt->height = sink_cmps->height;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+	rsz_fmt = rsz_find_format_by_code(src_fmt->code, format->pad);
+	if (rsz_fmt->is_raw) {
+		src_fmt->colorspace = V4L2_COLORSPACE_RAW;
+		src_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	} else {
+		src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+		src_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+
+	format->format = *src_fmt;
+}
+
+static int c3_isp_rsz_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_format *format)
+{
+	if (format->pad == C3_ISP_RSZ_PAD_SINK)
+		c3_isp_rsz_set_sink_fmt(state, format);
+	else
+		c3_isp_rsz_set_source_fmt(state, format);
+
+	return 0;
+}
+
+static int c3_isp_rsz_get_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+	struct v4l2_rect *cmps;
+
+	if (sel->pad == C3_ISP_RSZ_PAD_SOURCE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		fmt = v4l2_subdev_state_get_format(state, sel->pad);
+		sel->r.width = fmt->width;
+		sel->r.height = fmt->height;
+		sel->r.left = 0;
+		sel->r.top = 0;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		crop = v4l2_subdev_state_get_crop(state, sel->pad);
+		sel->r.width = crop->width;
+		sel->r.height = crop->height;
+		sel->r.left = 0;
+		sel->r.top = 0;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		crop = v4l2_subdev_state_get_crop(state, sel->pad);
+		sel->r = *crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		cmps = v4l2_subdev_state_get_compose(state, sel->pad);
+		sel->r = *cmps;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int c3_isp_rsz_set_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *crop;
+	struct v4l2_rect *cmps;
+
+	if (sel->pad == C3_ISP_RSZ_PAD_SOURCE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		fmt = v4l2_subdev_state_get_format(state, sel->pad);
+		crop = v4l2_subdev_state_get_crop(state, sel->pad);
+		cmps = v4l2_subdev_state_get_compose(state, sel->pad);
+		src_fmt = v4l2_subdev_state_get_format(state,
+						       C3_ISP_RSZ_PAD_SOURCE);
+
+		sel->r.left = clamp_t(s32, sel->r.left, 0, fmt->width - 1);
+		sel->r.top = clamp_t(s32, sel->r.top, 0, fmt->height - 1);
+		sel->r.width = clamp(sel->r.width, C3_ISP_MIN_WIDTH,
+				     fmt->width - sel->r.left);
+		sel->r.height = clamp(sel->r.height, C3_ISP_MIN_HEIGHT,
+				      fmt->height - sel->r.top);
+
+		crop->width = ALIGN(sel->r.width, 2);
+		crop->height = ALIGN(sel->r.height, 2);
+		crop->left = sel->r.left;
+		crop->top = sel->r.top;
+
+		*cmps = *crop;
+
+		src_fmt->code = fmt->code;
+		src_fmt->width = cmps->width;
+		src_fmt->height = cmps->height;
+
+		sel->r = *crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		crop = v4l2_subdev_state_get_crop(state, sel->pad);
+		cmps = v4l2_subdev_state_get_compose(state, sel->pad);
+
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = clamp(sel->r.width, C3_ISP_MIN_WIDTH,
+				     crop->width);
+		sel->r.height = clamp(sel->r.height, C3_ISP_MIN_HEIGHT,
+				      crop->height);
+
+		cmps->width = ALIGN(sel->r.width, 2);
+		cmps->height = ALIGN(sel->r.height, 2);
+		cmps->left = sel->r.left;
+		cmps->top = sel->r.top;
+
+		sel->r = *cmps;
+
+		fmt = v4l2_subdev_state_get_format(state,
+						   C3_ISP_RSZ_PAD_SOURCE);
+		fmt->width = cmps->width;
+		fmt->height = cmps->height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int c3_isp_rsz_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+	struct v4l2_rect *cmps;
+
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_RSZ_PAD_SINK);
+	fmt->width = C3_ISP_DEFAULT_WIDTH;
+	fmt->height = C3_ISP_DEFAULT_HEIGHT;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = C3_ISP_RSZ_DEF_PAD_FMT;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
+	crop = v4l2_subdev_state_get_crop(state, C3_ISP_RSZ_PAD_SINK);
+	crop->width = C3_ISP_DEFAULT_WIDTH;
+	crop->height = C3_ISP_DEFAULT_HEIGHT;
+	crop->left = 0;
+	crop->top = 0;
+
+	cmps = v4l2_subdev_state_get_compose(state, C3_ISP_RSZ_PAD_SINK);
+	cmps->width = C3_ISP_DEFAULT_WIDTH;
+	cmps->height = C3_ISP_DEFAULT_HEIGHT;
+	cmps->left = 0;
+	cmps->top = 0;
+
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_RSZ_PAD_SOURCE);
+	fmt->width = cmps->width;
+	fmt->height = cmps->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = C3_ISP_RSZ_DEF_PAD_FMT;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops c3_isp_rsz_pad_ops = {
+	.enum_mbus_code = c3_isp_rsz_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = c3_isp_rsz_set_fmt,
+	.get_selection = c3_isp_rsz_get_selection,
+	.set_selection = c3_isp_rsz_set_selection,
+	.enable_streams = c3_isp_rsz_enable_streams,
+	.disable_streams = c3_isp_rsz_disable_streams,
+};
+
+static const struct v4l2_subdev_ops c3_isp_rsz_subdev_ops = {
+	.pad = &c3_isp_rsz_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops c3_isp_rsz_internal_ops = {
+	.init_state = c3_isp_rsz_init_state,
+};
+
+/* Media entity operations */
+static const struct media_entity_operations c3_isp_rsz_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int c3_isp_rsz_register(struct c3_isp_resizer *rsz)
+{
+	struct v4l2_subdev *sd = &rsz->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &c3_isp_rsz_subdev_ops);
+	sd->owner = THIS_MODULE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->internal_ops = &c3_isp_rsz_internal_ops;
+	snprintf(sd->name, sizeof(sd->name), "c3-isp-resizer%u", rsz->id);
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	sd->entity.ops = &c3_isp_rsz_entity_ops;
+
+	sd->dev = rsz->isp->dev;
+	v4l2_set_subdevdata(sd, rsz);
+
+	rsz->pads[C3_ISP_RSZ_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	rsz->pads[C3_ISP_RSZ_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, C3_ISP_RSZ_PAD_MAX,
+				     rsz->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_device_register_subdev(&rsz->isp->v4l2_dev, sd);
+	if (ret)
+		goto err_subdev_cleanup;
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static void c3_isp_rsz_unregister(struct c3_isp_resizer *rsz)
+{
+	struct v4l2_subdev *sd = &rsz->sd;
+
+	v4l2_device_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+int c3_isp_resizers_register(struct c3_isp_device *isp)
+{
+	int ret;
+
+	for (unsigned int i = C3_ISP_RSZ_0; i < C3_ISP_NUM_RSZ; i++) {
+		struct c3_isp_resizer *rsz = &isp->resizers[i];
+
+		rsz->id = i;
+		rsz->isp = isp;
+		rsz->src_sd = &isp->core.sd;
+		rsz->src_pad = C3_ISP_CORE_PAD_SOURCE_VIDEO_0 + i;
+
+		ret = c3_isp_rsz_register(rsz);
+		if (ret) {
+			rsz->isp = NULL;
+			c3_isp_resizers_unregister(isp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void c3_isp_resizers_unregister(struct c3_isp_device *isp)
+{
+	for (unsigned int i = C3_ISP_RSZ_0; i < C3_ISP_NUM_RSZ; i++) {
+		struct c3_isp_resizer *rsz = &isp->resizers[i];
+
+		if (rsz->isp)
+			c3_isp_rsz_unregister(rsz);
+	}
+}
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
new file mode 100644
index 000000000000..21c8567def78
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/cleanup.h>
+#include <linux/media/amlogic/c3-isp-config.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+
+/* Hardware configuration */
+
+static void c3_isp_stats_cfg_dmawr_addr(struct c3_isp_stats *stats)
+{
+	u32 awb_dma_size = sizeof(struct c3_isp_awb_stats);
+	u32 ae_dma_size = sizeof(struct c3_isp_ae_stats);
+	u32 awb_dma_addr = stats->buff->dma_addr;
+	u32 af_dma_addr;
+	u32 ae_dma_addr;
+
+	ae_dma_addr = awb_dma_addr + awb_dma_size;
+	af_dma_addr = ae_dma_addr + ae_dma_size;
+
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_BADDR0,
+			   VIU_DMAWR_BADDR0_AF_STATS_BASE_ADDR_MASK,
+			   VIU_DMAWR_BADDR0_AF_STATS_BASE_ADDR(af_dma_addr));
+
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_BADDR1,
+			   VIU_DMAWR_BADDR1_AWB_STATS_BASE_ADDR_MASK,
+			   VIU_DMAWR_BADDR1_AWB_STATS_BASE_ADDR(awb_dma_addr));
+
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_BADDR2,
+			   VIU_DMAWR_BADDR2_AE_STATS_BASE_ADDR_MASK,
+			   VIU_DMAWR_BADDR2_AE_STATS_BASE_ADDR(ae_dma_addr));
+}
+
+static void c3_isp_stats_cfg_buff(struct c3_isp_stats *stats)
+{
+	stats->buff =
+		list_first_entry_or_null(&stats->pending,
+					 struct c3_isp_stats_buffer, list);
+	if (stats->buff) {
+		c3_isp_stats_cfg_dmawr_addr(stats);
+		list_del(&stats->buff->list);
+	}
+}
+
+void c3_isp_stats_pre_cfg(struct c3_isp_device *isp)
+{
+	struct c3_isp_stats *stats = &isp->stats;
+	u32 dma_size;
+
+	c3_isp_update_bits(stats->isp, ISP_AF_EN_CTRL,
+			   ISP_AF_EN_CTRL_STAT_SEL_MASK,
+			   ISP_AF_EN_CTRL_STAT_SEL_NEW);
+	c3_isp_update_bits(stats->isp, ISP_AE_CTRL,
+			   ISP_AE_CTRL_LUMA_MODE_MASK,
+			   ISP_AE_CTRL_LUMA_MODE_FILTER);
+
+	/* The unit of dma_size is 16 bytes */
+	dma_size = sizeof(struct c3_isp_af_stats) / C3_ISP_DMA_SIZE_ALIGN_BYTES;
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_SIZE0,
+			   VIU_DMAWR_SIZE0_AF_STATS_SIZE_MASK,
+			   VIU_DMAWR_SIZE0_AF_STATS_SIZE(dma_size));
+
+	dma_size = sizeof(struct c3_isp_awb_stats) /
+		   C3_ISP_DMA_SIZE_ALIGN_BYTES;
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_SIZE0,
+			   VIU_DMAWR_SIZE0_AWB_STATS_SIZE_MASK,
+			   VIU_DMAWR_SIZE0_AWB_STATS_SIZE(dma_size));
+
+	dma_size = sizeof(struct c3_isp_ae_stats) / C3_ISP_DMA_SIZE_ALIGN_BYTES;
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_SIZE1,
+			   VIU_DMAWR_SIZE1_AE_STATS_SIZE_MASK,
+			   VIU_DMAWR_SIZE1_AE_STATS_SIZE(dma_size));
+
+	guard(spinlock_irqsave)(&stats->buff_lock);
+
+	c3_isp_stats_cfg_buff(stats);
+}
+
+static int c3_isp_stats_querycap(struct file *file, void *fh,
+				 struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, C3_ISP_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "AML C3 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static int c3_isp_stats_enum_fmt(struct file *file, void *fh,
+				 struct v4l2_fmtdesc *f)
+{
+	struct c3_isp_stats *stats = video_drvdata(file);
+
+	if (f->index > 0 || f->type != stats->vb2_q.type)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_C3ISP_STATS;
+
+	return 0;
+}
+
+static int c3_isp_stats_g_fmt(struct file *file, void *fh,
+			      struct v4l2_format *f)
+{
+	struct c3_isp_stats *stats = video_drvdata(file);
+
+	f->fmt.meta = stats->vfmt.fmt.meta;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops isp_stats_v4l2_ioctl_ops = {
+	.vidioc_querycap                = c3_isp_stats_querycap,
+	.vidioc_enum_fmt_meta_cap       = c3_isp_stats_enum_fmt,
+	.vidioc_g_fmt_meta_cap          = c3_isp_stats_g_fmt,
+	.vidioc_s_fmt_meta_cap          = c3_isp_stats_g_fmt,
+	.vidioc_try_fmt_meta_cap        = c3_isp_stats_g_fmt,
+	.vidioc_reqbufs	                = vb2_ioctl_reqbufs,
+	.vidioc_querybuf                = vb2_ioctl_querybuf,
+	.vidioc_qbuf                    = vb2_ioctl_qbuf,
+	.vidioc_expbuf                  = vb2_ioctl_expbuf,
+	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
+	.vidioc_streamon                = vb2_ioctl_streamon,
+	.vidioc_streamoff               = vb2_ioctl_streamoff,
+};
+
+static const struct v4l2_file_operations isp_stats_v4l2_fops = {
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int c3_isp_stats_vb2_queue_setup(struct vb2_queue *q,
+					unsigned int *num_buffers,
+					unsigned int *num_planes,
+					unsigned int sizes[],
+					struct device *alloc_devs[])
+{
+	if (*num_planes) {
+		if (*num_planes != 1)
+			return -EINVAL;
+
+		if (sizes[0] < sizeof(struct c3_isp_stats_info))
+			return -EINVAL;
+
+		return 0;
+	}
+
+	*num_planes = 1;
+	sizes[0] = sizeof(struct c3_isp_stats_info);
+
+	return 0;
+}
+
+static void c3_isp_stats_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_stats_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_stats_buffer, vb);
+	struct c3_isp_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+
+	guard(spinlock_irqsave)(&stats->buff_lock);
+
+	list_add_tail(&buf->list, &stats->pending);
+}
+
+static int c3_isp_stats_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct c3_isp_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned int size = stats->vfmt.fmt.meta.buffersize;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(stats->isp->dev,
+			"User buffer too small (%ld < %u)\n",
+			vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+
+	return 0;
+}
+
+static int c3_isp_stats_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_stats_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_stats_buffer, vb);
+
+	buf->dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	return 0;
+}
+
+static void c3_isp_stats_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct c3_isp_stats *stats = vb2_get_drv_priv(q);
+
+	guard(spinlock_irqsave)(&stats->buff_lock);
+
+	if (stats->buff) {
+		vb2_buffer_done(&stats->buff->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		stats->buff = NULL;
+	}
+
+	while (!list_empty(&stats->pending)) {
+		struct c3_isp_stats_buffer *buff;
+
+		buff = list_first_entry(&stats->pending,
+					struct c3_isp_stats_buffer, list);
+		list_del(&buff->list);
+		vb2_buffer_done(&buff->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops isp_stats_vb2_ops = {
+	.queue_setup = c3_isp_stats_vb2_queue_setup,
+	.buf_queue = c3_isp_stats_vb2_buf_queue,
+	.buf_prepare = c3_isp_stats_vb2_buf_prepare,
+	.buf_init = c3_isp_stats_vb2_buf_init,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.stop_streaming = c3_isp_stats_vb2_stop_streaming,
+};
+
+int c3_isp_stats_register(struct c3_isp_device *isp)
+{
+	struct c3_isp_stats *stats = &isp->stats;
+	struct video_device *vdev = &stats->vdev;
+	struct vb2_queue *vb2_q = &stats->vb2_q;
+	int ret;
+
+	memset(stats, 0, sizeof(*stats));
+	stats->vfmt.fmt.meta.dataformat = V4L2_META_FMT_C3ISP_STATS;
+	stats->vfmt.fmt.meta.buffersize = sizeof(struct c3_isp_stats_info);
+	stats->isp = isp;
+	INIT_LIST_HEAD(&stats->pending);
+	spin_lock_init(&stats->buff_lock);
+
+	mutex_init(&stats->lock);
+
+	snprintf(vdev->name, sizeof(vdev->name), "c3-isp-stats");
+	vdev->fops = &isp_stats_v4l2_fops;
+	vdev->ioctl_ops = &isp_stats_v4l2_ioctl_ops;
+	vdev->v4l2_dev = &isp->v4l2_dev;
+	vdev->lock = &stats->lock;
+	vdev->minor = -1;
+	vdev->queue = vb2_q;
+	vdev->release = video_device_release_empty;
+	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_RX;
+	video_set_drvdata(vdev, stats);
+
+	vb2_q->drv_priv = stats;
+	vb2_q->mem_ops = &vb2_dma_contig_memops;
+	vb2_q->ops = &isp_stats_vb2_ops;
+	vb2_q->type = V4L2_BUF_TYPE_META_CAPTURE;
+	vb2_q->io_modes = VB2_DMABUF | VB2_MMAP;
+	vb2_q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2_q->buf_struct_size = sizeof(struct c3_isp_stats_buffer);
+	vb2_q->dev = isp->dev;
+	vb2_q->lock = &stats->lock;
+	vb2_q->min_queued_buffers = 2;
+
+	ret = vb2_queue_init(vb2_q);
+	if (ret)
+		goto err_destroy;
+
+	stats->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vdev->entity, 1, &stats->pad);
+	if (ret)
+		goto err_queue_release;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(isp->dev,
+			"Failed to register %s: %d\n", vdev->name, ret);
+		goto err_entity_cleanup;
+	}
+
+	return 0;
+
+err_entity_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_queue_release:
+	vb2_queue_release(vb2_q);
+err_destroy:
+	mutex_destroy(&stats->lock);
+	return ret;
+}
+
+void c3_isp_stats_unregister(struct c3_isp_device *isp)
+{
+	struct c3_isp_stats *stats = &isp->stats;
+
+	vb2_queue_release(&stats->vb2_q);
+	media_entity_cleanup(&stats->vdev.entity);
+	video_unregister_device(&stats->vdev);
+	mutex_destroy(&stats->lock);
+}
+
+void c3_isp_stats_isr(struct c3_isp_device *isp)
+{
+	struct c3_isp_stats *stats = &isp->stats;
+
+	guard(spinlock_irqsave)(&stats->buff_lock);
+
+	if (stats->buff) {
+		stats->buff->vb.sequence = stats->isp->frm_sequence;
+		stats->buff->vb.vb2_buf.timestamp = ktime_get();
+		stats->buff->vb.field = V4L2_FIELD_NONE;
+		vb2_buffer_done(&stats->buff->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	c3_isp_stats_cfg_buff(stats);
+}

-- 
2.48.1



