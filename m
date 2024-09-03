Return-Path: <linux-media+bounces-17436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD24969451
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BA59B22C70
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 06:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33461D6DDA;
	Tue,  3 Sep 2024 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa173ihd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513901D61B8;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346638; cv=none; b=Hv91hXCEErBT69HT7t6MXiTrFTBesPqNZVQVEs072igOTgIDRxB+JOeV+AJOTlsBu0+HdClaOyjZtu33xp/gNxAYQMeVKN8mAJyHgMNsh6PLXqE7fj8pFKFRSjliVtO1xFVmVF0dMzdl1uxg4RabiTPfRQI2FaGus4RuAc2qyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346638; c=relaxed/simple;
	bh=XNY8mKWXenqz0m1auufw9aokTMifTG2zkIupQf4UTRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kq0cMKKCUH1mVTf44/8i+x++54iOYBO/nFFyVTbg6+wkoDq87C2daKbqIB4k/b9XknQx/30sPNeqv9E49tTF4kifTIt7mpuDiiZ3m+KNcrZWQY9Qu7qSpfS61RoXVvD+OMYzok4o8Cxw7TaBgDiVyQB7pVuerl1o4+5bpqbIl8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa173ihd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13B6AC4CED5;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346638;
	bh=XNY8mKWXenqz0m1auufw9aokTMifTG2zkIupQf4UTRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Aa173ihdwEZuT2FR/FZl2ZLcmZ+w8gAIoSf/dTiGZhSNdm9Lmd6eD2gknfQW7Xu46
	 o9q7fag9N4V631RWXZG4a5n4qAAHqBpXyd2ltjVAqDPRGuxV6+qMMuRePPbsEIm6rO
	 3wb2NP5j2CF0Y0cntk+TdsMbfPLOeg6EE921SjaQhVoVjYgMReeMZ5oaIGdL89KRG+
	 1hH4gUWgcE6/hFzyrZSBfWTcoR68uI5BPTHsRNXz6U1U0slbgJyYEA+vm++Dfaaq8b
	 wFTtio+Aof3eYuqnpbUpws62XynOngexROHkqaL0d6PrVFTnczRon7XxkllekK3rlf
	 kBrYpez2sbVeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08896CD342D;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 14:57:11 +0800
Subject: [PATCH 7/9] media: platform: Add c3 ISP driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-c3isp-v1-7-8af0edcc13c8@amlogic.com>
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
In-Reply-To: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346629; l=193814;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=KEk9tr87RERRr5TrI5G7mj+GQaEA90wd4PaeQ4UzQek=;
 b=u3rTz/PJjo9dfvN8sW/ILGTIvCZBNRyvXadeg3wfsv8GFyYXqAhXu+J7VFciFRF92AKVAfM8b
 rDrL6LwTcxWC9rZRAg/pvtcanIcGrV7YTgJ4LHiis9jBCkfIEfCJmwS
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

The C3 ISP supports multi-camera and muti-exposure
high dynamic range (HDR). It brings together some
advanced imaging technologies to provide good
image quality.
This driver mainly responsible for driving ISP
pipeline to process raw image.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 drivers/media/platform/amlogic/Kconfig             |   1 +
 drivers/media/platform/amlogic/Makefile            |   1 +
 drivers/media/platform/amlogic/c3-isp/Kconfig      |  17 +
 drivers/media/platform/amlogic/c3-isp/Makefile     |  10 +
 .../media/platform/amlogic/c3-isp/c3-isp-capture.c | 788 ++++++++++++++++++
 .../media/platform/amlogic/c3-isp/c3-isp-common.h  | 327 ++++++++
 .../media/platform/amlogic/c3-isp/c3-isp-core.c    | 696 ++++++++++++++++
 drivers/media/platform/amlogic/c3-isp/c3-isp-dev.c | 484 +++++++++++
 .../media/platform/amlogic/c3-isp/c3-isp-params.c  | 888 +++++++++++++++++++++
 .../media/platform/amlogic/c3-isp/c3-isp-regs.h    | 683 ++++++++++++++++
 .../media/platform/amlogic/c3-isp/c3-isp-resizer.c | 778 ++++++++++++++++++
 .../media/platform/amlogic/c3-isp/c3-isp-stats.c   | 491 ++++++++++++
 .../amlogic/c3-isp/include/uapi/c3-isp-config.h    | 537 +++++++++++++
 13 files changed, 5701 insertions(+)

diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
index df09717b28d0..ebda6b7edc2d 100644
--- a/drivers/media/platform/amlogic/Kconfig
+++ b/drivers/media/platform/amlogic/Kconfig
@@ -2,6 +2,7 @@
 
 comment "Amlogic media platform drivers"
 
+source "drivers/media/platform/amlogic/c3-isp/Kconfig"
 source "drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig"
 source "drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig"
 source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
index b370154b090c..d0d9363d4d8d 100644
--- a/drivers/media/platform/amlogic/Makefile
+++ b/drivers/media/platform/amlogic/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-y += c3-isp/
 obj-y += c3-mipi-adapter/
 obj-y += c3-mipi-csi2/
 obj-y += meson-ge2d/
diff --git a/drivers/media/platform/amlogic/c3-isp/Kconfig b/drivers/media/platform/amlogic/c3-isp/Kconfig
new file mode 100644
index 000000000000..e317c1e81750
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/Kconfig
@@ -0,0 +1,17 @@
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
+	help
+	  Video4Linux2 driver for Amlogic C3 ISP pipeline.
+	  C3 ISP pipeline mainly for processing raw image
+	  and output result to memory.
+
+	  To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/amlogic/c3-isp/Makefile b/drivers/media/platform/amlogic/c3-isp/Makefile
new file mode 100644
index 000000000000..b1b064170b57
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/Makefile
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
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-capture.c b/drivers/media/platform/amlogic/c3-isp/c3-isp-capture.c
new file mode 100644
index 000000000000..90b66696dc52
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-capture.c
@@ -0,0 +1,788 @@
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
+static const struct c3_isp_capture_format cap_formats[] = {
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.depth = 8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.depth = 12,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.depth = 12,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.depth = 16,
+	}, {
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.depth = 16,
+	},
+};
+
+/* Hardware configuration */
+
+/* Set the address of wrmifx3(write memory interface) */
+static void c3_isp_cap_wrmifx3_buff(struct c3_isp_capture *cap)
+{
+	struct v4l2_pix_format *pix = &cap->vfmt.fmt.pix;
+	struct c3_isp_vb2_buffer *buff = cap->buff;
+	u32 offset;
+
+	c3_isp_write(cap->isp,
+		     C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_BADDR, cap->id),
+		     WRMIFX3_CH0_BADDR(buff->paddr));
+
+	if (pix->pixelformat == V4L2_PIX_FMT_NV12 ||
+	    pix->pixelformat == V4L2_PIX_FMT_NV21 ||
+	    pix->pixelformat == V4L2_PIX_FMT_NV16 ||
+	    pix->pixelformat == V4L2_PIX_FMT_NV61) {
+		offset = pix->width * pix->height;
+		c3_isp_write(cap->isp,
+			     C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_BADDR, cap->id),
+			     WRMIFX3_CH1_BADDR(buff->paddr + offset));
+	}
+}
+
+static void c3_isp_cap_output_size(struct c3_isp_capture *cap)
+{
+	struct v4l2_pix_format *pix = &cap->vfmt.fmt.pix;
+
+	c3_isp_update_bits(cap->isp,
+			   C3_DISP_REG(DISP0_TOP_OUT_SIZE, cap->id),
+			   DISP_OUT_VSIZE_MASK, pix->height);
+	c3_isp_update_bits(cap->isp,
+			   C3_DISP_REG(DISP0_TOP_OUT_SIZE, cap->id),
+			   DISP_OUT_HSIZE_MASK,
+			   pix->width << DISP_OUT_HSIZE_SHIFT);
+}
+
+static void c3_isp_cap_wrmifx3_grey(struct c3_isp_capture *cap)
+{
+	struct v4l2_pix_format *fmt = &cap->vfmt.fmt.pix;
+	u32 stride;
+
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_IBITS_MASK,
+			   WRMIFX3_FMT_MTX_IBITS_8BIT);
+
+	/* Grey has 1 plane*/
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_PLANE_MASK,
+			   WRMIFX3_FMT_MTX_PLANE_X1 << WRMIFX3_FMT_MTX_PLANE_SHIFT);
+
+	/* Set Y only as output format */
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MODE_OUT_MASK,
+			   WRMIFX3_FMT_MODE_OUT_Y_ONLY << WRMIFX3_FMT_MODE_OUT_SHIFT);
+
+	/* The unit of stride is 128 bits */
+	stride = DIV_ROUND_UP(fmt->width * 8, 128);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL0, cap->id),
+			   WRMIFX3_CH0_STRIDE_MASK,
+			   stride << WRMIFX3_CH0_STRIDE_SHIFT);
+
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL1, cap->id),
+			   WRMIFX3_CH0_PIX_BITS_MODE_MASK,
+			   WRMIFX3_CH0_PIX_BITS_8BITS << WRMIFX3_CH0_PIX_BITS_MODE_SHIFT);
+}
+
+static void c3_isp_cap_wrmifx3_yuv420(struct c3_isp_capture *cap, u32 swap_uv)
+{
+	struct v4l2_pix_format *fmt = &cap->vfmt.fmt.pix;
+	u32 stride;
+
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_IBITS_MASK,
+			   WRMIFX3_FMT_MTX_IBITS_8BIT);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_UV_SWAP_MASK,
+			   swap_uv << WRMIFX3_FMT_MTX_UV_SWAP_SHIFT);
+
+	/* NV12 or NV21 has 2 planes*/
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_PLANE_MASK,
+			   WRMIFX3_FMT_MTX_PLANE_X2 << WRMIFX3_FMT_MTX_PLANE_SHIFT);
+
+	/* Set YUV420 as output format */
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MODE_OUT_MASK,
+			   WRMIFX3_FMT_MODE_OUT_YUV420 << WRMIFX3_FMT_MODE_OUT_SHIFT);
+
+	/* The unit of stride is 128 bits */
+	stride = DIV_ROUND_UP(fmt->width * 8, 128);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL0, cap->id),
+			   WRMIFX3_CH0_STRIDE_MASK,
+			   stride << WRMIFX3_CH0_STRIDE_SHIFT);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_CTRL0, cap->id),
+			   WRMIFX3_CH1_STRIDE_MASK,
+			   stride << WRMIFX3_CH1_STRIDE_SHIFT);
+
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL1, cap->id),
+			   WRMIFX3_CH0_PIX_BITS_MODE_MASK,
+			   WRMIFX3_CH0_PIX_BITS_8BITS << WRMIFX3_CH0_PIX_BITS_MODE_SHIFT);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_CTRL1, cap->id),
+			   WRMIFX3_CH1_PIX_BITS_MODE_MASK,
+			   WRMIFX3_CH1_PIX_BITS_16BITS << WRMIFX3_CH1_PIX_BITS_MODE_SHIFT);
+}
+
+static void c3_isp_cap_wrmifx3_yuv422(struct c3_isp_capture *cap, u32 swap_uv)
+{
+	struct v4l2_pix_format *fmt = &cap->vfmt.fmt.pix;
+	u32 stride;
+
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_IBITS_MASK,
+			   WRMIFX3_FMT_MTX_IBITS_16BIT);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_UV_SWAP_MASK,
+			   swap_uv << WRMIFX3_FMT_MTX_UV_SWAP_SHIFT);
+
+	/* NV16 or NV61 has 2 planes*/
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MTX_PLANE_MASK,
+			   WRMIFX3_FMT_MTX_PLANE_X2 << WRMIFX3_FMT_MTX_PLANE_SHIFT);
+
+	/* Set YUV422 as output format */
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_CTRL, cap->id),
+			   WRMIFX3_FMT_MODE_OUT_MASK,
+			   WRMIFX3_FMT_MODE_OUT_YUV422 << WRMIFX3_FMT_MODE_OUT_SHIFT);
+
+	/* The unit of stride is 128 bits */
+	stride = DIV_ROUND_UP(fmt->width * 16, 128);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL0, cap->id),
+			   WRMIFX3_CH0_STRIDE_MASK,
+			   stride << WRMIFX3_CH0_STRIDE_SHIFT);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_CTRL0, cap->id),
+			   WRMIFX3_CH1_STRIDE_MASK,
+			   stride << WRMIFX3_CH1_STRIDE_SHIFT);
+
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH0_CTRL1, cap->id),
+			   WRMIFX3_CH0_PIX_BITS_MODE_MASK,
+			   WRMIFX3_CH0_PIX_BITS_16BITS << WRMIFX3_CH0_PIX_BITS_MODE_SHIFT);
+	c3_isp_update_bits(cap->isp,
+			   C3_WRMIFX3_REG(ISP_WRMIFX3_0_CH1_CTRL1, cap->id),
+			   WRMIFX3_CH1_PIX_BITS_MODE_MASK,
+			   WRMIFX3_CH1_PIX_BITS_32BITS << WRMIFX3_CH1_PIX_BITS_MODE_SHIFT);
+}
+
+static void c3_isp_cap_wrmifx3_size(struct c3_isp_capture *cap)
+{
+	struct v4l2_pix_format *fmt = &cap->vfmt.fmt.pix;
+
+	if (fmt->pixelformat == V4L2_PIX_FMT_GREY)
+		c3_isp_cap_wrmifx3_grey(cap);
+	else if (fmt->pixelformat == V4L2_PIX_FMT_NV12)
+		c3_isp_cap_wrmifx3_yuv420(cap, WRMIFX3_FMT_MTX_UV_SWAP_UV);
+	else if (fmt->pixelformat == V4L2_PIX_FMT_NV21)
+		c3_isp_cap_wrmifx3_yuv420(cap, WRMIFX3_FMT_MTX_UV_SWAP_VU);
+	else if (fmt->pixelformat == V4L2_PIX_FMT_NV16)
+		c3_isp_cap_wrmifx3_yuv422(cap, WRMIFX3_FMT_MTX_UV_SWAP_UV);
+	else if (fmt->pixelformat == V4L2_PIX_FMT_NV61)
+		c3_isp_cap_wrmifx3_yuv422(cap, WRMIFX3_FMT_MTX_UV_SWAP_VU);
+
+	c3_isp_write(cap->isp,
+		     C3_WRMIFX3_REG(ISP_WRMIFX3_0_FMT_SIZE, cap->id),
+		     WRMIFX3_FMT_HSIZE(fmt->width) |
+		     WRMIFX3_FMT_VSIZE(fmt->height));
+
+	c3_isp_update_bits(cap->isp, C3_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_LUMA_H, cap->id),
+			   WRMIFX3_WIN_LUMA_HEND_MASK,
+			   WRMIFX3_WIN_LUMA_HEND(fmt->width) << WRMIFX3_WIN_LUMA_HEND_SHIFT);
+	c3_isp_update_bits(cap->isp, C3_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_LUMA_V, cap->id),
+			   WRMIFX3_WIN_LUMA_VEND_MASK,
+			   WRMIFX3_WIN_LUMA_VEND(fmt->height) << WRMIFX3_WIN_LUMA_VEND_SHIFT);
+
+	c3_isp_update_bits(cap->isp, C3_WRMIFX3_REG(ISP_WRMIFX3_0_CRP_HSIZE, cap->id),
+			   WRMIFX3_CROP_HEND_MASK,
+			   WRMIFX3_CROP_HEND(fmt->width) << WRMIFX3_CROP_HEND_SHIFT);
+	c3_isp_update_bits(cap->isp, C3_WRMIFX3_REG(ISP_WRMIFX3_0_CRP_VSIZE, cap->id),
+			   WRMIFX3_CROP_VEND_MASK,
+			   WRMIFX3_CROP_VEND(fmt->height) << WRMIFX3_CROP_VEND_SHIFT);
+
+	c3_isp_update_bits(cap->isp, C3_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_CHROM_H, cap->id),
+			   WRMIFX3_WIN_CHROM_HEND_MASK,
+			   WRMIFX3_WIN_CHROM_HEND(fmt->width) << WRMIFX3_WIN_CHROM_HEND_SHIFT);
+	c3_isp_update_bits(cap->isp, C3_WRMIFX3_REG(ISP_WRMIFX3_0_WIN_CHROM_V, cap->id),
+			   WRMIFX3_WIN_CHROM_VEND_MASK,
+			   WRMIFX3_WIN_CHROM_VEND(fmt->height) << WRMIFX3_WIN_CHROM_VEND_SHIFT);
+}
+
+static void c3_isp_cap_cfg_buff(struct c3_isp_capture *cap)
+{
+	cap->buff = list_first_entry_or_null(&cap->pending,
+					     struct c3_isp_vb2_buffer, list);
+	if (cap->buff) {
+		c3_isp_cap_wrmifx3_buff(cap);
+		list_del(&cap->buff->list);
+	}
+}
+
+static void c3_isp_cap_start(struct c3_isp_capture *cap)
+{
+	c3_isp_cap_cfg_buff(cap);
+
+	c3_isp_cap_output_size(cap);
+	c3_isp_cap_wrmifx3_size(cap);
+
+	c3_isp_update_bits(cap->isp, ISP_TOP_PATH_EN,
+			   TOP_WRMIF_EN(cap->id), TOP_WRMIF_EN(cap->id));
+
+	cap->is_streaming = true;
+}
+
+static void c3_isp_cap_stop(struct c3_isp_capture *cap)
+{
+	cap->is_streaming = false;
+
+	c3_isp_update_bits(cap->isp, ISP_TOP_PATH_EN,
+			   TOP_WRMIF_EN(cap->id), 0);
+}
+
+static int c3_isp_cap_done(struct c3_isp_capture *cap)
+{
+	struct c3_isp_vb2_buffer *buff = cap->buff;
+	unsigned long flags;
+
+	if (!cap->is_streaming)
+		return -EINVAL;
+
+	spin_lock_irqsave(&cap->buff_lock, flags);
+
+	if (buff) {
+		buff->vb.sequence = cap->isp->frm_sequence;
+		buff->vb.vb2_buf.timestamp = ktime_get();
+		buff->vb.field = V4L2_FIELD_NONE;
+		vb2_buffer_done(&buff->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	c3_isp_cap_cfg_buff(cap);
+
+	spin_unlock_irqrestore(&cap->buff_lock, flags);
+
+	return 0;
+}
+
+/* V4L2 video operations */
+
+static const struct c3_isp_capture_format
+*c3_cap_find_fmt(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cap_formats); i++) {
+		if (cap_formats[i].fourcc == fourcc)
+			return &cap_formats[i];
+	}
+
+	return NULL;
+}
+
+static void c3_cap_try_fmt(struct c3_isp_capture *cap,
+			   struct v4l2_pix_format *pix)
+{
+	const struct c3_isp_capture_format *fmt;
+
+	fmt = c3_cap_find_fmt(pix->pixelformat);
+	if (!fmt)
+		fmt = &cap_formats[0];
+
+	pix->width = clamp(pix->width, C3_ISP_MIN_WIDTH, C3_ISP_MAX_WIDTH);
+	pix->height = clamp(pix->height, C3_ISP_MIN_HEIGHT, C3_ISP_MAX_HEIGHT);
+	pix->pixelformat = fmt->fourcc;
+	pix->field = V4L2_FIELD_NONE;
+	pix->colorspace = V4L2_COLORSPACE_SRGB;
+	pix->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
+	/* ISP hardware requires 16 bytes alignment */
+	pix->bytesperline = ALIGN(pix->width, 16);
+	pix->sizeimage = pix->bytesperline * pix->height * fmt->depth / 8;
+}
+
+static void c3_isp_cap_return_buffers(struct c3_isp_capture *cap,
+				      enum vb2_buffer_state state)
+{
+	unsigned long flags;
+	struct c3_isp_vb2_buffer *buff;
+
+	spin_lock_irqsave(&cap->buff_lock, flags);
+
+	if (cap->buff) {
+		vb2_buffer_done(&cap->buff->vb.vb2_buf, state);
+		cap->buff = NULL;
+	}
+
+	while (!list_empty(&cap->pending)) {
+		buff = list_first_entry(&cap->pending,
+					struct c3_isp_vb2_buffer, list);
+		list_del(&buff->list);
+		vb2_buffer_done(&buff->vb.vb2_buf, state);
+	}
+
+	spin_unlock_irqrestore(&cap->buff_lock, flags);
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
+	const struct c3_isp_capture_format *fmt;
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
+static int c3_isp_cap_g_fmt(struct file *file, void *fh,
+			    struct v4l2_format *f)
+{
+	struct c3_isp_capture *cap = video_drvdata(file);
+
+	f->fmt.pix = cap->vfmt.fmt.pix;
+
+	return 0;
+}
+
+static int c3_isp_cap_s_fmt(struct file *file, void *fh,
+			    struct v4l2_format *f)
+{
+	struct c3_isp_capture *cap = video_drvdata(file);
+
+	c3_cap_try_fmt(cap, &f->fmt.pix);
+	cap->vfmt = *f;
+
+	return 0;
+}
+
+static int c3_isp_cap_try_fmt(struct file *file, void *fh,
+			      struct v4l2_format *f)
+{
+	struct c3_isp_capture *cap = video_drvdata(file);
+
+	c3_cap_try_fmt(cap, &f->fmt.pix);
+
+	return 0;
+}
+
+static int c3_isp_cap_enum_frmsize(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	const struct c3_isp_capture_format *fmt;
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
+	.vidioc_g_fmt_vid_cap		= c3_isp_cap_g_fmt,
+	.vidioc_s_fmt_vid_cap		= c3_isp_cap_s_fmt,
+	.vidioc_try_fmt_vid_cap		= c3_isp_cap_try_fmt,
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
+	struct v4l2_pix_format *pix_fmt = &cap->vfmt.fmt.pix;
+	struct v4l2_subdev_format src_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	const struct c3_isp_capture_format *cap_fmt =
+				c3_cap_find_fmt(pix_fmt->pixelformat);
+	int ret;
+
+	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &src_fmt);
+	if (ret)
+		return ret;
+
+	if (src_fmt.format.width != pix_fmt->width ||
+	    src_fmt.format.height != pix_fmt->height ||
+	    src_fmt.format.code != cap_fmt->mbus_code) {
+		dev_err(cap->isp->dev,
+			"link %s: %u -> %s: %u not valid: 0x%04x/%ux%u not match 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			src_fmt.format.code, src_fmt.format.width,
+			src_fmt.format.height, cap_fmt->mbus_code,
+			pix_fmt->width, pix_fmt->height);
+
+		return -EPIPE;
+	};
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
+	struct v4l2_pix_format *pix = &cap->vfmt.fmt.pix;
+
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] < pix->sizeimage)
+		return -EINVAL;
+
+	*num_planes = 1;
+	sizes[0] = pix->sizeimage;
+
+	return 0;
+}
+
+static void c3_isp_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_vb2_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_vb2_buffer, vb);
+	struct c3_isp_capture *cap = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long flags;
+
+	spin_lock_irqsave(&cap->buff_lock, flags);
+
+	list_add_tail(&buf->list, &cap->pending);
+
+	spin_unlock_irqrestore(&cap->buff_lock, flags);
+}
+
+static int c3_isp_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned int size = cap->vfmt.fmt.pix.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(cap->isp->dev,
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
+static int c3_isp_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_vb2_buffer *buf =
+		container_of(v4l2_buf, struct c3_isp_vb2_buffer, vb);
+	struct c3_isp_capture *cap = vb2_get_drv_priv(vb->vb2_queue);
+
+	buf->vaddr = vb2_plane_vaddr(vb, 0);
+	buf->paddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	memset(buf->vaddr, 0, cap->vfmt.fmt.pix.sizeimage);
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
+	guard(mutex)(&cap->isp->lock);
+
+	ret = pm_runtime_resume_and_get(cap->isp->dev);
+	if (ret)
+		return ret;
+
+	ret = video_device_pipeline_start(&cap->vdev, &cap->isp->pipe);
+	if (ret) {
+		dev_err(cap->isp->dev,
+			"Failed to start cap%u pipeline: %d\n", cap->id, ret);
+		goto err_pm_put;
+	}
+
+	if (c3_isp_pipeline_ready(cap->isp)) {
+		ret = v4l2_subdev_enable_streams(&cap->isp->core.sd,
+						 C3_ISP_CORE_PAD_SOURCE_VIDEO,
+						 BIT(0));
+		if (ret)
+			goto err_pipeline_stop;
+	}
+
+	c3_isp_rsz_start(cap->rsz);
+	c3_isp_cap_start(cap);
+
+	return 0;
+
+err_pipeline_stop:
+	video_device_pipeline_stop(&cap->vdev);
+err_pm_put:
+	pm_runtime_put(cap->isp->dev);
+	c3_isp_cap_return_buffers(cap, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void c3_isp_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct c3_isp_capture *cap = vb2_get_drv_priv(q);
+
+	guard(mutex)(&cap->isp->lock);
+
+	c3_isp_cap_stop(cap);
+	c3_isp_rsz_stop(cap->rsz);
+	c3_isp_cap_return_buffers(cap, VB2_BUF_STATE_ERROR);
+
+	if (cap->isp->pipe.start_count == 1)
+		v4l2_subdev_disable_streams(&cap->isp->core.sd,
+					    C3_ISP_CORE_PAD_SOURCE_VIDEO,
+					    BIT(0));
+
+	video_device_pipeline_stop(&cap->vdev);
+	pm_runtime_put(cap->isp->dev);
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
+	snprintf(vdev->name, sizeof(vdev->name), "isp-cap%u", cap->id);
+	vdev->fops = &isp_cap_v4l2_fops;
+	vdev->ioctl_ops = &isp_cap_v4l2_ioctl_ops;
+	vdev->v4l2_dev = &cap->isp->v4l2_dev;
+	vdev->entity.ops = &isp_cap_entity_ops;
+	vdev->lock = &cap->lock;
+	vdev->minor = -1;
+	vdev->queue = vb2_q;
+	vdev->release = video_device_release_empty;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_RX;
+	video_set_drvdata(vdev, cap);
+
+	vb2_q->drv_priv = cap;
+	vb2_q->mem_ops = &vb2_dma_contig_memops;
+	vb2_q->ops = &isp_video_vb2_ops;
+	vb2_q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vb2_q->io_modes = VB2_DMABUF | VB2_MMAP;
+	vb2_q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2_q->buf_struct_size = sizeof(struct c3_isp_vb2_buffer);
+	vb2_q->dev = cap->isp->dev;
+	vb2_q->lock = &cap->lock;
+	vb2_q->min_queued_buffers = 2;
+
+	ret = vb2_queue_init(vb2_q);
+	if (ret < 0)
+		goto err_destroy;
+
+	cap->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vdev->entity, 1, &cap->pad);
+	if (ret < 0)
+		goto err_queue_release;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
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
+		cap->vfmt.fmt.pix.width = C3_ISP_DEFAULT_WIDTH;
+		cap->vfmt.fmt.pix.height = C3_ISP_DEFAULT_HEIGHT;
+		cap->vfmt.fmt.pix.field = V4L2_FIELD_NONE;
+		cap->vfmt.fmt.pix.pixelformat = V4L2_PIX_FMT_NV21;
+		cap->vfmt.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+
+		c3_cap_try_fmt(cap, &cap->vfmt.fmt.pix);
+
+		cap->id = i;
+		if (cap->id == C3_ISP_CAP_DEV_0)
+			cap->rsz = &isp->resizers[C3_ISP_RSZ_0];
+		else if (cap->id == C3_ISP_CAP_DEV_1)
+			cap->rsz = &isp->resizers[C3_ISP_RSZ_1];
+		else
+			cap->rsz = &isp->resizers[C3_ISP_RSZ_2];
+
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
+void c3_isp_captures_done(struct c3_isp_device *isp)
+{
+	c3_isp_cap_done(&isp->caps[C3_ISP_CAP_DEV_0]);
+	c3_isp_cap_done(&isp->caps[C3_ISP_CAP_DEV_1]);
+	c3_isp_cap_done(&isp->caps[C3_ISP_CAP_DEV_2]);
+}
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-common.h b/drivers/media/platform/amlogic/c3-isp/c3-isp-common.h
new file mode 100644
index 000000000000..26b72e364725
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-common.h
@@ -0,0 +1,327 @@
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
+#define C3_ISP_DRIVER_NAME            "c3-isp"
+#define C3_ISP_CLOCK_NUM_MAX          3
+
+#define C3_ISP_CORE_DEF_SINK_PAD_FMT  MEDIA_BUS_FMT_SRGGB10_1X10
+#define C3_ISP_CORE_DEF_SRC_PAD_FMT   MEDIA_BUS_FMT_YUYV8_1_5X8
+#define C3_ISP_RSZ_DEF_PAD_FMT        MEDIA_BUS_FMT_YUYV8_1_5X8
+#define C3_ISP_DEFAULT_WIDTH          1920
+#define C3_ISP_DEFAULT_HEIGHT         1080
+#define C3_ISP_MAX_WIDTH              2888
+#define C3_ISP_MAX_HEIGHT             2240
+#define C3_ISP_MIN_WIDTH              160
+#define C3_ISP_MIN_HEIGHT             120
+
+#define C3_DISP_INTER                 0x400
+#define C3_DISP_REG(base, id)         ((base) + (id) * C3_DISP_INTER)
+#define C3_WRMIFX3_INTER              0x100
+#define C3_WRMIFX3_REG(base, id)      ((base) + (id) * C3_WRMIFX3_INTER)
+#define C3_PPS_TAP4_S11_H_NUM         33
+#define C3_PPS_LUT_CTYPE_0            0
+#define C3_PPS_LUT_CTYPE_2            2
+#define C3_SCALE_EN                   1
+#define C3_SCALE_DIS                  0
+
+#define C3_ISP_PHASE_OFFSET_0         0
+#define C3_ISP_PHASE_OFFSET_1         1
+#define C3_ISP_PHASE_OFFSET_NONE      0xff
+
+enum c3_isp_core_pads {
+	C3_ISP_CORE_PAD_SINK_VIDEO,
+	C3_ISP_CORE_PAD_SINK_PARAMS,
+	C3_ISP_CORE_PAD_SOURCE_STATS,
+	C3_ISP_CORE_PAD_SOURCE_VIDEO,
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
+	C3_ISP_RESIZER_PAD_SINK,
+	C3_ISP_RESIZER_PAD_SOURCE,
+	C3_ISP_RESIZER_PAD_MAX
+};
+
+enum c3_isp_cap_devs {
+	C3_ISP_CAP_DEV_0,
+	C3_ISP_CAP_DEV_1,
+	C3_ISP_CAP_DEV_2,
+	C3_ISP_NUM_CAP_DEVS
+};
+
+/**
+ * struct c3_isp_pps_io_size - isp scaler input and output size
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
+/**
+ * @mbus_code: the mbus code
+ * @pads: save the pad flag of this mbus_code
+ * @xofst: horizontal phase offset of hardware
+ * @yofst: vertical phase offset of hardware
+ */
+struct c3_isp_mbus_format_info {
+	u32 mbus_code;
+	u32 pads;
+	u8 xofst;
+	u8 yofst;
+};
+
+/**
+ * @mbus_code: the mbus code
+ * @fourcc: pixel format
+ * @depth: pixel width
+ */
+struct c3_isp_capture_format {
+	u32 mbus_code;
+	u32 fourcc;
+	u8 depth;
+};
+
+/**
+ * struct c3_isp_vb2_buffer - A container of vb2 buffer
+ *
+ * @vb: vb2 buffer
+ * @vaddr: buffer virtual address
+ * @paddr: buffer physical address
+ * @list: entry of the buffer in the queue
+ */
+struct c3_isp_vb2_buffer {
+	struct vb2_v4l2_buffer vb;
+	void *vaddr;
+	dma_addr_t paddr;
+	struct list_head list;
+};
+
+/**
+ * struct c3_isp_core - ISP core subdev
+ *
+ * @sd: ISP sub-device
+ * @pads: ISP sub-device pads
+ * @src_sd: source sub-device
+ * @isp: pointer to c3_isp_device
+ * @src_sd_pad: source sub-device pad
+ */
+struct c3_isp_core {
+	struct v4l2_subdev sd;
+	struct media_pad pads[C3_ISP_CORE_PAD_MAX];
+	struct v4l2_subdev *src_sd;
+	u16 src_sd_pad;
+	struct c3_isp_device *isp;
+};
+
+/**
+ * struct c3_isp_resizer - ISP resizer subdev
+ *
+ * @id: resizer id
+ * @sd: resizer sub-device
+ * @pads: resizer sub-device pads
+ * @isp: pointer to c3_isp_device
+ * @cap: pointer to c3_isp_capture
+ */
+struct c3_isp_resizer {
+	enum c3_isp_resizer_ids id;
+	struct v4l2_subdev sd;
+	struct media_pad pads[C3_ISP_RESIZER_PAD_MAX];
+	struct c3_isp_device *isp;
+	struct c3_isp_capture *cap;
+};
+
+/**
+ * struct c3_isp_stats - ISP statistics device
+ *
+ * @vb2_q: vb2 buffer queue
+ * @vdev: video node
+ * @vfmt: v4l2_format of the metadata format
+ * @pad: media pad
+ * @lock: protects vb2_q, vdev
+ * @is_streaming: stats status
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
+	bool is_streaming;
+	struct c3_isp_device *isp;
+
+	struct c3_isp_vb2_buffer *buff;
+	spinlock_t buff_lock; /* Protects stream buffer */
+	struct list_head pending;
+};
+
+/**
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
+	struct c3_isp_vb2_buffer *buff;
+	spinlock_t buff_lock; /* Protects stream buffer */
+	struct list_head pending;
+};
+
+/**
+ * struct c3_isp_capture - ISP capture device
+ *
+ * @id: capture device ID
+ * @vb2_q: vb2 buffer queue
+ * @vdev: video node
+ * @vfmt: v4l2_format of the capture format
+ * @pad: media pad
+ * @lock: protects vb2_q, vdev
+ * @is_streaming: capture device status
+ * @isp: pointer to c3_isp_device
+ * @rsz: pointer to c3_isp_resizer
+ * @buff: in use buffer
+ * @buff_lock: protects capture buffer
+ * @pending: capture buffer list head
+ */
+struct c3_isp_capture {
+	enum c3_isp_cap_devs id;
+	struct vb2_queue vb2_q;
+	struct video_device vdev;
+	struct v4l2_format vfmt;
+	struct media_pad pad;
+
+	struct mutex lock; /* Protects vb2_q, vdev */
+	bool is_streaming;
+	struct c3_isp_device *isp;
+	struct c3_isp_resizer *rsz;
+
+	struct c3_isp_vb2_buffer *buff;
+	spinlock_t buff_lock; /* Protects stream buffer */
+	struct list_head pending;
+};
+
+/**
+ * struct c3_isp_info - ISP information
+ *
+ * @clock: array of ISP clock names
+ * @clock_rate: array of ISP clock rate
+ * @clock_num: actual clock number
+ */
+struct c3_isp_info {
+	char *clocks[C3_ISP_CLOCK_NUM_MAX];
+	u32 clock_rate[C3_ISP_CLOCK_NUM_MAX];
+	u32 clock_num;
+};
+
+/**
+ * struct c3_isp_device - ISP platform device
+ *
+ * @dev: pointer to the struct device
+ * @base: base register address
+ * @clock: array of clocks
+ * @notifier: notifier to register on the v4l2-async API
+ * @v4l2_dev: v4l2_device variable
+ * @media_dev: media device variable
+ * @pipe: media pipeline
+ * @core: ISP core subdev
+ * @resizer: ISP resizer subdev
+ * @stats: ISP stats device
+ * @params: ISP params device
+ * @caps: array of ISP capture device
+ * @frm_sequence: used to record frame id
+ * @lock: protect ISP device
+ * @info: version-specific ISP information
+ */
+struct c3_isp_device {
+	struct device *dev;
+	void __iomem *base;
+	struct clk_bulk_data clock[C3_ISP_CLOCK_NUM_MAX];
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
+	struct mutex lock; /* Protect ISP device */
+	const struct c3_isp_info *info;
+};
+
+u32 c3_isp_read(struct c3_isp_device *isp, u32 reg);
+void c3_isp_write(struct c3_isp_device *isp, u32 reg, u32 val);
+void c3_isp_update_bits(struct c3_isp_device *isp, u32 reg, u32 mask, u32 val);
+bool c3_isp_pipeline_ready(struct c3_isp_device *isp);
+
+int c3_isp_core_register(struct c3_isp_device *isp);
+void c3_isp_core_unregister(struct c3_isp_device *isp);
+int c3_isp_resizers_register(struct c3_isp_device *isp);
+void c3_isp_resizers_unregister(struct c3_isp_device *isp);
+void c3_isp_rsz_start(struct c3_isp_resizer *rsz);
+void c3_isp_rsz_stop(struct c3_isp_resizer *rsz);
+int c3_isp_captures_register(struct c3_isp_device *isp);
+void c3_isp_captures_unregister(struct c3_isp_device *isp);
+void c3_isp_captures_done(struct c3_isp_device *isp);
+int c3_isp_stats_register(struct c3_isp_device *isp);
+void c3_isp_stats_unregister(struct c3_isp_device *isp);
+int c3_isp_stats_done(struct c3_isp_device *isp);
+int c3_isp_params_register(struct c3_isp_device *isp);
+void c3_isp_params_unregister(struct c3_isp_device *isp);
+int c3_isp_params_done(struct c3_isp_device *isp);
+
+#endif
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-core.c b/drivers/media/platform/amlogic/c3-isp/c3-isp-core.c
new file mode 100644
index 000000000000..9248b49194ce
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-core.c
@@ -0,0 +1,696 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/pm_runtime.h>
+
+#include "c3-isp-common.h"
+#include "c3-isp-regs.h"
+#include "include/uapi/c3-isp-config.h"
+
+#define C3_ISP_CORE_SUBDEV_NAME        "isp-core"
+
+static const struct c3_isp_mbus_format_info c3_isp_core_mbus_formats[] = {
+	/* RAW formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_1,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_0,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.pads		= BIT(C3_ISP_CORE_PAD_SINK_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_1,
+		.yofst		= C3_ISP_PHASE_OFFSET_0,
+	},
+	/* YUV formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.pads		= BIT(C3_ISP_CORE_PAD_SOURCE_VIDEO),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+	},
+};
+
+static const struct c3_isp_mbus_format_info
+*core_find_format_by_code(u32 code, u32 pad)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(c3_isp_core_mbus_formats); i++) {
+		const struct c3_isp_mbus_format_info *info =
+			&c3_isp_core_mbus_formats[i];
+
+		if (info->mbus_code == code && info->pads & BIT(pad))
+			return info;
+	}
+
+	return NULL;
+}
+
+static const struct c3_isp_mbus_format_info
+*core_find_format_by_index(u32 index, u32 pad)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(c3_isp_core_mbus_formats); i++) {
+		const struct c3_isp_mbus_format_info *info =
+			&c3_isp_core_mbus_formats[i];
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
+	/* Select the line sync signal */
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_LINE_THRD,
+			   TOP_IRQ_DIN_HSYNC, TOP_IRQ_DIN_HSYNC);
+
+	/* Enable frame done and stats error irq */
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_EN,
+			   TOP_IRQ_FRAME_DONE, TOP_IRQ_FRAME_DONE);
+	c3_isp_update_bits(isp, ISP_TOP_IRQ_EN,
+			   TOP_IRQ_STATS_ERR, TOP_IRQ_STATS_ERR);
+
+	/* Enable image data to ISP core */
+	c3_isp_update_bits(isp, ISP_TOP_PATH_SEL,
+			   TOP_DATA_PATH_MASK, TOP_PATH_MIPI_TO_CORE);
+}
+
+static void c3_isp_core_disable(struct c3_isp_device *isp)
+{
+	/* Disable image data to ISP core */
+	c3_isp_update_bits(isp, ISP_TOP_PATH_SEL,
+			   TOP_DATA_PATH_MASK, 0x0);
+
+	/* Disable all irq */
+	c3_isp_write(isp, ISP_TOP_IRQ_EN, 0x0);
+}
+
+/* Set the phase offset of blc, wb and lns */
+static void c3_isp_core_lswb_ofst(struct c3_isp_device *isp,
+				  u8 xofst, u8 yofst)
+{
+	c3_isp_update_bits(isp, ISP_LSWB_BLC_PHSOFST,
+			   LSWB_BLC_XPHS_OFST_MASK,
+			   xofst << LSWB_BLC_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_LSWB_BLC_PHSOFST,
+			   LSWB_BLC_YPHS_OFST_MASK, yofst);
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_PHSOFST,
+			   LSWB_WB_XPHS_OFST_MASK,
+			   xofst << LSWB_WB_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_LSWB_WB_PHSOFST,
+			   LSWB_WB_YPHS_OFST_MASK, yofst);
+
+	c3_isp_update_bits(isp, ISP_LSWB_LNS_PHSOFST,
+			   LSWB_LNS_XPHS_OFST_MASK,
+			   xofst << LSWB_LNS_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_LSWB_LNS_PHSOFST,
+			   LSWB_LNS_YPHS_OFST_MASK, yofst);
+}
+
+/* Set the phase offset of af, ae and awb */
+static void c3_isp_core_3a_ofst(struct c3_isp_device *isp,
+				u8 xofst, u8 yofst)
+{
+	c3_isp_update_bits(isp, ISP_AF_CTRL,
+			   AF_CTRL_XPHS_OFST_MASK,
+			   xofst << AF_CTRL_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_AF_CTRL,
+			   AF_CTRL_YPHS_OFST_MASK,
+			   yofst << AF_CTRL_YPHS_OFST_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AE_CTRL,
+			   AE_CTRL_XPHS_OFST_MASK,
+			   xofst << AE_CTRL_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_AE_CTRL,
+			   AE_CTRL_YPHS_OFST_MASK,
+			   yofst << AE_CTRL_YPHS_OFST_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AWB_CTRL,
+			   AWB_CTRL_XPHS_OFST_MASK,
+			   xofst << AWB_CTRL_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_AWB_CTRL,
+			   AWB_CTRL_YPHS_OFST_MASK, yofst);
+}
+
+/* Set the phase offset of demosaic */
+static void c3_isp_core_dms_ofst(struct c3_isp_device *isp,
+				 u8 xofst, u8 yofst)
+{
+	c3_isp_update_bits(isp, ISP_DMS_COMMON_PARAM0,
+			   DMS_COMMON_XPHS_OFST_MASK,
+			   xofst << DMS_COMMON_XPHS_OFST_SHIFT);
+	c3_isp_update_bits(isp, ISP_DMS_COMMON_PARAM0,
+			   DMS_COMMON_YPHS_OFST_MASK, yofst);
+}
+
+static void c3_isp_core_cfg_ofst(struct c3_isp_device *isp,
+				 struct v4l2_mbus_framefmt *fmt)
+{
+	const struct c3_isp_mbus_format_info *isp_fmt =
+			core_find_format_by_code(fmt->code, C3_ISP_CORE_PAD_SINK_VIDEO);
+
+	c3_isp_core_lswb_ofst(isp, isp_fmt->xofst, isp_fmt->yofst);
+	c3_isp_core_3a_ofst(isp, isp_fmt->xofst, isp_fmt->yofst);
+	c3_isp_core_dms_ofst(isp, isp_fmt->xofst, isp_fmt->yofst);
+}
+
+/* Set format of the hardware control module */
+static void c3_isp_core_top_fmt(struct c3_isp_device *isp,
+				struct v4l2_mbus_framefmt *fmt)
+{
+	c3_isp_write(isp, ISP_TOP_INPUT_SIZE,
+		     TOP_INPUT_HSIZE(fmt->width) |
+		     TOP_INPUT_VSIZE(fmt->height));
+
+	c3_isp_write(isp, ISP_TOP_FRM_SIZE,
+		     TOP_FRM_CORE_IHSIZE(fmt->width) |
+		     TOP_FRM_CORE_IVSIZE(fmt->height));
+
+	c3_isp_update_bits(isp, ISP_TOP_HOLD_SIZE,
+			   TOP_HOLD_HSIZE_MASK,
+			   fmt->width << TOP_HOLD_HSIZE_SHIFT);
+}
+
+static void c3_isp_core_af_fmt(struct c3_isp_device *isp,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	u32 hidx;
+	u32 vidx;
+	int i;
+
+	c3_isp_update_bits(isp, ISP_AF_HV_BLKNUM,
+			   AF_HV_STAT_HBLK_NUM_MASK,
+			   AF_STAT_BLKH_NUM << AF_HV_STAT_HBLK_NUM_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AF_HV_BLKNUM,
+			   AF_HV_STAT_VBLK_NUM_MASK,
+			   AF_STAT_BLKV_NUM);
+
+	c3_isp_write(isp, ISP_AF_HV_SIZE,
+		     AF_HV_STAT_HSIZE(fmt->width) |
+		     AF_HV_STAT_VSIZE(fmt->height));
+
+	/* Set the index address to 0 position */
+	c3_isp_write(isp, ISP_AF_IDX_ADDR, 0);
+	/*
+	 * Calculate and set the coordinates of points in the grid.
+	 * hidx and vidx need to be aligned with 2.
+	 */
+	for (i = 0; i <= AF_STAT_BLKH_NUM; i++) {
+		hidx = i * fmt->width / AF_STAT_BLKH_NUM;
+		hidx = ALIGN_DOWN(hidx, 2);
+
+		vidx = i * fmt->height / AF_STAT_BLKV_NUM;
+		vidx = min(vidx, fmt->height);
+		vidx = ALIGN_DOWN(vidx, 2);
+		c3_isp_write(isp, ISP_AF_IDX_DATA,
+			     AF_IDX_HIDX_DATA(hidx) |
+			     AF_IDX_VIDX_DATA(vidx));
+	}
+}
+
+static void c3_isp_core_ae_fmt(struct c3_isp_device *isp,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	u32 hidx;
+	u32 vidx;
+	int i;
+
+	c3_isp_update_bits(isp, ISP_AE_HV_BLKNUM,
+			   AE_HV_STAT_HBLK_NUM_MASK,
+			   AE_STAT_BLKH_NUM << AE_HV_STAT_HBLK_NUM_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AE_HV_BLKNUM,
+			   AE_HV_STAT_VBLK_NUM_MASK,
+			   AE_STAT_BLKV_NUM);
+
+	c3_isp_write(isp, ISP_AE_HV_SIZE,
+		     AE_HV_STAT_HSIZE(fmt->width) |
+		     AE_HV_STAT_VSIZE(fmt->height));
+
+	/* Set the index address to 0 position */
+	c3_isp_write(isp, ISP_AE_IDX_ADDR, 0);
+	/*
+	 * Calculate and set the coordinates of points in the grid.
+	 * hidx and vidx need to be aligned with 2.
+	 */
+	for (i = 0; i <= AE_STAT_BLKH_NUM; i++) {
+		hidx = i * fmt->width / AE_STAT_BLKH_NUM;
+		hidx = ALIGN_DOWN(hidx, 2);
+
+		vidx = i * fmt->height / AE_STAT_BLKV_NUM;
+		vidx = min(vidx, fmt->height);
+		vidx = ALIGN_DOWN(vidx, 2);
+
+		c3_isp_write(isp, ISP_AE_IDX_DATA,
+			     AE_IDX_HIDX_DATA(hidx) |
+			     AE_IDX_VIDX_DATA(vidx));
+	}
+}
+
+static void c3_isp_core_awb_fmt(struct c3_isp_device *isp,
+				struct v4l2_mbus_framefmt *fmt)
+{
+	u32 hidx;
+	u32 vidx;
+	int i;
+
+	c3_isp_update_bits(isp, ISP_AWB_HV_BLKNUM,
+			   AWB_HV_STAT_HBLK_NUM_MASK,
+			   AWB_STAT_BLKH_NUM << AWB_HV_STAT_HBLK_NUM_SHIFT);
+	c3_isp_update_bits(isp, ISP_AWB_HV_BLKNUM,
+			   AWB_HV_STAT_VBLK_NUM_MASK,
+			   AWB_STAT_BLKV_NUM);
+
+	c3_isp_write(isp, ISP_AWB_HV_SIZE,
+		     AWB_HV_STAT_HSIZE(fmt->width) |
+		     AWB_HV_STAT_VSIZE(fmt->height));
+
+	/* Set the index address to 0 position */
+	c3_isp_write(isp, ISP_AWB_IDX_ADDR, 0);
+	/*
+	 * Calculate and set the coordinates of points in the grid.
+	 * hidx and vidx need to be aligned with 2.
+	 */
+	for (i = 0; i <= AWB_STAT_BLKH_NUM; i++) {
+		hidx = i * fmt->width / AWB_STAT_BLKH_NUM;
+		hidx = ALIGN_DOWN(hidx, 2);
+
+		vidx = i * fmt->height / AWB_STAT_BLKV_NUM;
+		vidx = min(vidx, fmt->height);
+		vidx = ALIGN_DOWN(vidx, 2);
+
+		c3_isp_write(isp, ISP_AWB_IDX_DATA,
+			     AWB_IDX_HIDX_DATA(hidx) |
+			     AWB_IDX_VIDX_DATA(vidx));
+	}
+}
+
+static void c3_isp_core_cfg_format(struct c3_isp_device *isp,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_VIDEO);
+
+	c3_isp_core_cfg_ofst(isp, fmt);
+	c3_isp_core_top_fmt(isp, fmt);
+	c3_isp_core_af_fmt(isp, fmt);
+	c3_isp_core_ae_fmt(isp, fmt);
+	c3_isp_core_awb_fmt(isp, fmt);
+}
+
+static int c3_isp_core_enable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct c3_isp_core *core = v4l2_get_subdevdata(sd);
+	u64 sink_streams;
+	int ret;
+
+	core->isp->frm_sequence = 0;
+	c3_isp_core_cfg_format(core->isp, state);
+	c3_isp_core_enable(core->isp);
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       C3_ISP_CORE_PAD_SINK_VIDEO,
+						       &streams_mask);
+	ret = v4l2_subdev_enable_streams(core->src_sd,
+					 core->src_sd_pad, sink_streams);
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
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       C3_ISP_CORE_PAD_SINK_VIDEO,
+						       &streams_mask);
+	ret = v4l2_subdev_disable_streams(core->src_sd,
+					  core->src_sd_pad, sink_streams);
+	if (ret)
+		return ret;
+
+	c3_isp_core_disable(core->isp);
+
+	return 0;
+}
+
+static int c3_isp_core_cfg_routing(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = C3_ISP_DEFAULT_WIDTH,
+		.height = C3_ISP_DEFAULT_HEIGHT,
+		.code = C3_ISP_CORE_DEF_SRC_PAD_FMT,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int c3_isp_core_init_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[2];
+	struct v4l2_subdev_krouting routing;
+
+	routes[0].sink_pad = C3_ISP_CORE_PAD_SINK_VIDEO;
+	routes[0].sink_stream = 0;
+	routes[0].source_pad = C3_ISP_CORE_PAD_SOURCE_STATS;
+	routes[0].source_stream = 0;
+	routes[0].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+
+	routes[1].sink_pad = C3_ISP_CORE_PAD_SINK_VIDEO;
+	routes[1].sink_stream = 0;
+	routes[1].source_pad = C3_ISP_CORE_PAD_SOURCE_VIDEO;
+	routes[1].source_stream = 0;
+	routes[1].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+
+	routing.num_routes = ARRAY_SIZE(routes);
+	routing.routes = routes;
+
+	return c3_isp_core_cfg_routing(sd, state, &routing);
+}
+
+static int c3_isp_core_set_routing(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   enum v4l2_subdev_format_whence which,
+				   struct v4l2_subdev_krouting *routing)
+{
+	bool is_streaming = v4l2_subdev_is_streaming(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
+		return -EBUSY;
+
+	return c3_isp_core_cfg_routing(sd, state, routing);
+}
+
+static int c3_isp_core_enum_mbus_code(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct c3_isp_mbus_format_info *info;
+	int ret = 0;
+
+	switch (code->pad) {
+	case C3_ISP_CORE_PAD_SINK_VIDEO:
+	case C3_ISP_CORE_PAD_SOURCE_VIDEO:
+		info = core_find_format_by_index(code->index, code->pad);
+		if (info)
+			code->code = info->mbus_code;
+		else
+			ret = -EINVAL;
+
+		break;
+	case C3_ISP_CORE_PAD_SINK_PARAMS:
+	case C3_ISP_CORE_PAD_SOURCE_STATS:
+		if (code->index)
+			ret = -EINVAL;
+		else
+			code->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
+		break;
+	default:
+		ret = -ENOTTY;
+	}
+
+	return ret;
+}
+
+static void c3_isp_core_set_sink_fmt(struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	const struct c3_isp_mbus_format_info *isp_fmt;
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
+
+	format->format = *sink_fmt;
+}
+
+static void c3_isp_core_set_source_fmt(struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_format *format)
+{
+	const struct c3_isp_mbus_format_info *isp_fmt;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(state, format->pad);
+
+	isp_fmt = core_find_format_by_code(format->format.code, format->pad);
+	if (!isp_fmt)
+		src_fmt->code = C3_ISP_CORE_DEF_SRC_PAD_FMT;
+	else
+		src_fmt->code = format->format.code;
+
+	/* The source size must be same with the sink size. */
+	src_fmt->width  = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+
+	format->format = *src_fmt;
+}
+
+static int c3_isp_core_set_fmt(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	switch (format->pad) {
+	case C3_ISP_CORE_PAD_SINK_VIDEO:
+		c3_isp_core_set_sink_fmt(state, format);
+		break;
+	case C3_ISP_CORE_PAD_SINK_PARAMS:
+	case C3_ISP_CORE_PAD_SOURCE_STATS:
+		fmt = v4l2_subdev_state_get_format(state, format->pad);
+		format->format = *fmt;
+		break;
+	case C3_ISP_CORE_PAD_SOURCE_VIDEO:
+		c3_isp_core_set_source_fmt(state, format);
+		break;
+	default:
+		return -ENOTTY;
+	}
+
+	return 0;
+}
+
+static int c3_isp_core_init_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+
+	/* Video sink pad */
+	sink_fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_VIDEO);
+	sink_fmt->width = C3_ISP_DEFAULT_WIDTH;
+	sink_fmt->height = C3_ISP_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = C3_ISP_CORE_DEF_SINK_PAD_FMT;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	/* Video source pad */
+	src_fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SOURCE_VIDEO);
+	src_fmt->width = C3_ISP_DEFAULT_WIDTH;
+	src_fmt->height = C3_ISP_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = C3_ISP_CORE_DEF_SRC_PAD_FMT;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
+	/* Parameters pad */
+	sink_fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SINK_PARAMS);
+	sink_fmt->width = 0;
+	sink_fmt->height = 0;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
+	/* Statistics pad */
+	src_fmt = v4l2_subdev_state_get_format(state, C3_ISP_CORE_PAD_SOURCE_STATS);
+	src_fmt->width = 0;
+	src_fmt->height = 0;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
+	return c3_isp_core_init_routing(sd, state);
+}
+
+static const struct v4l2_subdev_pad_ops c3_isp_core_pad_ops = {
+	.enum_mbus_code = c3_isp_core_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = c3_isp_core_set_fmt,
+	.enable_streams = c3_isp_core_enable_streams,
+	.disable_streams = c3_isp_core_disable_streams,
+	.set_routing = c3_isp_core_set_routing,
+};
+
+static const struct v4l2_subdev_ops c3_isp_core_subdev_ops = {
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
+int c3_isp_core_register(struct c3_isp_device *isp)
+{
+	struct c3_isp_core *core = &isp->core;
+	struct v4l2_subdev *sd = &core->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &c3_isp_core_subdev_ops);
+	sd->owner = THIS_MODULE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
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
+	core->pads[C3_ISP_CORE_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, C3_ISP_CORE_PAD_MAX, core->pads);
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
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-dev.c b/drivers/media/platform/amlogic/c3-isp/c3-isp-dev.c
new file mode 100644
index 000000000000..e4538abedc93
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-dev.c
@@ -0,0 +1,484 @@
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
+bool c3_isp_pipeline_ready(struct c3_isp_device *isp)
+{
+	struct media_pipeline_entity_iter iter;
+	unsigned int n_video_devices = 0;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(&isp->pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(&isp->pipe, &iter, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return n_video_devices == isp->pipe.start_count;
+}
+
+/* PM runtime suspend */
+static int __maybe_unused c3_isp_runtime_suspend(struct device *dev)
+{
+	struct c3_isp_device *isp = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(isp->info->clock_num, isp->clock);
+
+	return 0;
+}
+
+/* PM runtime resume */
+static int __maybe_unused c3_isp_runtime_resume(struct device *dev)
+{
+	struct c3_isp_device *isp = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(isp->info->clock_num, isp->clock);
+}
+
+static const struct dev_pm_ops c3_isp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(c3_isp_runtime_suspend,
+			   c3_isp_runtime_resume, NULL)
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
+	if (status & TOP_IRQ_FRAME_DONE) {
+		c3_isp_stats_done(isp);
+		c3_isp_params_done(isp);
+		c3_isp_captures_done(isp);
+		isp->frm_sequence++;
+	}
+
+	if (status & TOP_IRQ_STATS_ERR)
+		dev_dbg(isp->dev, "ISP IRQ Stats DMA Error\n");
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
+	struct c3_isp_core *core = &isp->core;
+	struct media_pad *sink = &core->sd.entity.pads[C3_ISP_CORE_PAD_SINK_VIDEO];
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&sd->entity,
+					  sd->fwnode, MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(isp->dev, "Failed to find pad for %s\n", sd->name);
+		return ret;
+	}
+
+	core->src_sd = sd;
+	core->src_sd_pad = ret;
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
+					       MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static int c3_isp_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct c3_isp_device *isp =
+		container_of(notifier, struct c3_isp_device, notifier);
+	int ret;
+
+	ret = v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"Failed to register subdev nodes: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(isp->dev, "notify complete\n");
+
+	return media_device_register(&isp->media_dev);
+}
+
+static void c3_isp_notify_destroy(struct v4l2_async_connection *asc)
+{
+	struct c3_isp_device *isp =
+		container_of(asc->notifier, struct c3_isp_device, notifier);
+
+	media_device_unregister(&isp->media_dev);
+}
+
+static const struct v4l2_async_notifier_operations c3_isp_notify_ops = {
+	.bound = c3_isp_notify_bound,
+	.complete = c3_isp_notify_complete,
+	.destroy = c3_isp_notify_destroy,
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
+	if (IS_ERR(asc)) {
+		fwnode_handle_put(ep);
+		return PTR_ERR(asc);
+	}
+
+	fwnode_handle_put(ep);
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
+static int c3_isp_v4l2_register(struct c3_isp_device *isp)
+{
+	struct media_device *media_dev = &isp->media_dev;
+	struct v4l2_device *v4l2_dev = &isp->v4l2_dev;
+	int ret;
+
+	/* Initialize media device */
+	strscpy(media_dev->model, C3_ISP_DRIVER_NAME,
+		sizeof(media_dev->model));
+	media_dev->dev = isp->dev;
+
+	media_device_init(media_dev);
+
+	/* Initialize v4l2 device */
+	v4l2_dev->mdev = media_dev;
+	strscpy(v4l2_dev->name, C3_ISP_DRIVER_NAME,
+		sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(isp->dev, v4l2_dev);
+	if (ret) {
+		media_device_cleanup(media_dev);
+		dev_err(isp->dev,
+			"Failed to register V4L2 device: %d\n", ret);
+	}
+
+	return ret;
+}
+
+static void c3_isp_v4l2_unregister(struct c3_isp_device *isp)
+{
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
+					    C3_ISP_RESIZER_PAD_SOURCE,
+					    &isp->resizers[i].cap->vdev.entity,
+					    0, MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			dev_err(isp->dev, "Failed to link resizer %u and capture %u\n", i, i);
+			goto err_remove_links;
+		}
+
+		ret = media_create_pad_link(&isp->core.sd.entity,
+					    C3_ISP_CORE_PAD_SOURCE_VIDEO,
+					    &isp->resizers[i].sd.entity,
+					    C3_ISP_RESIZER_PAD_SINK,
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			dev_err(isp->dev, "Failed to link core and resizer %u\n", i);
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
+static int c3_isp_cfg_clocks(struct c3_isp_device *isp)
+{
+	const struct c3_isp_info *info = isp->info;
+	int ret;
+	u32 i;
+
+	for (i = 0; i < info->clock_num; i++)
+		isp->clock[i].id = info->clocks[i];
+
+	ret = devm_clk_bulk_get(isp->dev, info->clock_num, isp->clock);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < info->clock_num; i++) {
+		if (!info->clock_rate[i])
+			continue;
+		clk_set_rate(isp->clock[i].clk, info->clock_rate[i]);
+	}
+
+	return 0;
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
+		return PTR_ERR(isp->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = c3_isp_cfg_clocks(isp);
+	if (ret) {
+		dev_err(dev, "Failed to configure clocks: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, isp);
+
+	pm_runtime_enable(dev);
+
+	ret = c3_isp_v4l2_register(isp);
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
+	ret = c3_isp_videos_register(isp);
+	if (ret)
+		goto err_nf_unregister;
+
+	ret = devm_request_irq(dev, irq,
+			       c3_isp_irq_handler, IRQF_SHARED,
+			       dev_driver_string(dev), isp);
+	if (ret) {
+		dev_err(dev, "Request irq failed: %d\n", ret);
+		goto err_streams_unregister;
+	}
+
+	mutex_init(&isp->lock);
+
+	return 0;
+
+err_streams_unregister:
+	c3_isp_videos_unregister(isp);
+err_nf_unregister:
+	c3_isp_async_nf_unregister(isp);
+err_resizers_unregister:
+	c3_isp_resizers_unregister(isp);
+err_core_unregister:
+	c3_isp_core_unregister(isp);
+err_v4l2_unregister:
+	c3_isp_v4l2_unregister(isp);
+err_runtime_disable:
+	pm_runtime_disable(dev);
+	return ret;
+};
+
+static void c3_isp_remove(struct platform_device *pdev)
+{
+	struct c3_isp_device *isp = platform_get_drvdata(pdev);
+
+	mutex_destroy(&isp->lock);
+	c3_isp_videos_unregister(isp);
+	c3_isp_async_nf_unregister(isp);
+	c3_isp_core_unregister(isp);
+	c3_isp_resizers_unregister(isp);
+	c3_isp_v4l2_unregister(isp);
+	pm_runtime_disable(isp->dev);
+};
+
+static const struct c3_isp_info isp_info = {
+	.clocks = {"vapb", "isp0"},
+	.clock_rate = {0, 400000000},
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
+	.remove_new = c3_isp_remove,
+	.driver = {
+		.name = "c3-isp",
+		.of_match_table = c3_isp_of_match,
+		.pm = &c3_isp_pm_ops,
+	},
+};
+
+module_platform_driver(c3_isp_driver);
+
+MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
+MODULE_DESCRIPTION("Amlogic C3 ISP pipeline");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3-isp/c3-isp-params.c
new file mode 100644
index 000000000000..75bcda674819
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-params.c
@@ -0,0 +1,888 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
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
+#include "include/uapi/c3-isp-config.h"
+
+typedef void (*block_handler)(struct c3_isp_device *isp,
+			      struct c3_isp_param_block_header *block);
+
+struct c3_isp_block_handler {
+	size_t size;
+	block_handler handler;
+};
+
+/* Hardware configuration */
+
+static void c3_isp_params_cfg_wb_change(struct c3_isp_device *isp,
+					struct c3_isp_param_block_header *block)
+{
+	struct wb_change_cfg *wb = (struct wb_change_cfg *)block;
+
+	if (!block->enabled) {
+		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+				   TOP_BEO_CTRL_WB_EN, false);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+			   TOP_BEO_CTRL_WB_EN, TOP_BEO_CTRL_WB_EN);
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN0,
+			   LSWB_WB_GAIN0_MASK,
+			   wb->wb_gain[0] << LSWB_WB_GAIN0_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN0,
+			   LSWB_WB_GAIN1_MASK, wb->wb_gain[1]);
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN1,
+			   LSWB_WB_GAIN2_MASK,
+			   wb->wb_gain[2] << LSWB_WB_GAIN2_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN1,
+			   LSWB_WB_GAIN3_MASK, wb->wb_gain[3]);
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_GAIN2,
+			   LSWB_WB_GAIN4_MASK, wb->wb_gain[4]);
+
+	c3_isp_write(isp, ISP_LSWB_WB_LIMIT0,
+		     LSWB_WB_LIMIT0(wb->wb_limit[0]) |
+		     LSWB_WB_LIMIT1(wb->wb_limit[1]));
+
+	c3_isp_write(isp, ISP_LSWB_WB_LIMIT1,
+		     LSWB_WB_LIMIT2(wb->wb_limit[2]) |
+		     LSWB_WB_LIMIT3(wb->wb_limit[3]));
+
+	c3_isp_update_bits(isp, ISP_LSWB_WB_LIMIT2, LSWB_WB_LIMIT4_MASK,
+			   wb->wb_limit[4]);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_0, AE_CRTL2_BL12_GRBGI0_MASK,
+			   wb->ae_bl12_grbgi[0]);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_0, AE_CRTL2_GAIN_GRBGI0_MASK,
+			   wb->ae_gain_grbgi[0] << AE_CRTL2_GAIN_GRBGI0_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_1, AE_CRTL2_BL12_GRBGI1_MASK,
+			   wb->ae_bl12_grbgi[1]);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_1, AE_CRTL2_GAIN_GRBGI1_MASK,
+			   wb->ae_gain_grbgi[1] << AE_CRTL2_GAIN_GRBGI1_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_2, AE_CRTL2_BL12_GRBGI2_MASK,
+			   wb->ae_bl12_grbgi[2]);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_2, AE_CRTL2_GAIN_GRBGI2_MASK,
+			   wb->ae_gain_grbgi[2] << AE_CRTL2_GAIN_GRBGI2_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_3, AE_CRTL2_BL12_GRBGI3_MASK,
+			   wb->ae_bl12_grbgi[3]);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_3, AE_CRTL2_GAIN_GRBGI3_MASK,
+			   wb->ae_gain_grbgi[3] << AE_CRTL2_GAIN_GRBGI3_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_4, AE_CRTL2_BL12_GRBGI4_MASK,
+			   wb->ae_bl12_grbgi[4]);
+
+	c3_isp_update_bits(isp, ISP_AE_CRTL2_4, AE_CRTL2_GAIN_GRBGI4_MASK,
+			   wb->ae_gain_grbgi[4] << AE_CRTL2_GAIN_GRBGI4_SHIFT);
+}
+
+static void c3_isp_params_cfg_wb_luma(struct c3_isp_device *isp,
+				      struct c3_isp_param_block_header *block)
+{
+	struct wb_luma_cfg *wb_luma = (struct wb_luma_cfg *)block;
+
+	if (!block->enabled)
+		return;
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BLC20_0,
+			   AWB_STAT_BLC20_GR_MASK, wb_luma->awb_stat_blc20[0]);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BLC20_1,
+			   AWB_STAT_BLC20_R_MASK, wb_luma->awb_stat_blc20[1]);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BLC20_2,
+			   AWB_STAT_BLC20_B_MASK, wb_luma->awb_stat_blc20[2]);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BLC20_3,
+			   AWB_STAT_BLC20_GB_MASK, wb_luma->awb_stat_blc20[3]);
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_GAIN10_0,
+			   AWB_STAT_GAIN10_GR_MASK, wb_luma->awb_stat_gain10[0]);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_GAIN10_1,
+			   AWB_STAT_GAIN10_R_MASK, wb_luma->awb_stat_gain10[1]);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_GAIN10_2,
+			   AWB_STAT_GAIN10_B_MASK, wb_luma->awb_stat_gain10[2]);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_GAIN10_3,
+			   AWB_STAT_GAIN10_GB_MASK, wb_luma->awb_stat_gain10[3]);
+
+	c3_isp_write(isp, ISP_AWB_STAT_SATUR_CTRL,
+		     AWB_STAT_SATUR_LOW(wb_luma->awb_stat_satur_low) |
+		     AWB_STAT_SATUR_HIGH(wb_luma->awb_stat_satur_high));
+}
+
+static void c3_isp_params_cfg_wb_triangle(struct c3_isp_device *isp,
+					  struct c3_isp_param_block_header *block)
+{
+	struct wb_triangle_cfg *wb = (struct wb_triangle_cfg *)block;
+
+	if (!block->enabled)
+		return;
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_CTRL2,
+			   AWB_STAT_SATUR_VALID_MASK, wb->awb_stat_satur_vald);
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG,
+			   AWB_STAT_RG_MIN_MASK, wb->awb_stat_rg_min);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG,
+			   AWB_STAT_RG_MAX_MASK,
+			   wb->awb_stat_rg_max << AWB_STAT_RG_MAX_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG,
+			   AWB_STAT_BG_MIN_MASK, wb->awb_stat_bg_min);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG,
+			   AWB_STAT_BG_MAX_MASK,
+			   wb->awb_stat_bg_max << AWB_STAT_BG_MAX_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG_HL,
+			   AWB_STAT_RG_LOW_MASK, wb->awb_stat_rg_low);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_RG_HL,
+			   AWB_STAT_RG_HIGH_MASK,
+			   wb->awb_stat_rg_high << AWB_STAT_RG_HIGH_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG_HL,
+			   AWB_STAT_BG_LOW_MASK, wb->awb_stat_bg_low);
+	c3_isp_update_bits(isp, ISP_AWB_STAT_BG_HL,
+			   AWB_STAT_BG_HIGH_MASK,
+			   wb->awb_stat_bg_high << AWB_STAT_BG_HIGH_SHIFT);
+}
+
+static void c3_isp_params_cfg_awb_stats(struct c3_isp_device *isp,
+					struct c3_isp_param_block_header *block)
+{
+	struct awb_stats_cfg *awb_stats = (struct awb_stats_cfg *)block;
+	u32 *weight = awb_stats->awb_stat_blk_weight;
+	int idx_base;
+	int group;
+	int i;
+
+	if (!block->enabled)
+		return;
+
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL, TOP_3A_AWB_STAT_SWITCH_MASK,
+			   awb_stats->awb_stat_switch << TOP_3A_AWB_STAT_SWITCH_SHIFT);
+
+	/* Calculate the group number */
+	group = AWB_BLOCK_WT_NUM / AWB_BLK_WT_DATA_NUM_OF_GROUP;
+
+	/* Set the weight address to 0 position */
+	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
+	for (i = 0; i < group; i++) {
+		idx_base = i * AWB_BLK_WT_DATA_NUM_OF_GROUP;
+		c3_isp_write(isp, ISP_AWB_BLK_WT_DATA,
+			     AWB_BLK_WT_DATA0(weight[idx_base + 0]) |
+			     AWB_BLK_WT_DATA1(weight[idx_base + 1]) |
+			     AWB_BLK_WT_DATA2(weight[idx_base + 2]) |
+			     AWB_BLK_WT_DATA3(weight[idx_base + 3]) |
+			     AWB_BLK_WT_DATA4(weight[idx_base + 4]) |
+			     AWB_BLK_WT_DATA5(weight[idx_base + 5]) |
+			     AWB_BLK_WT_DATA6(weight[idx_base + 6]) |
+			     AWB_BLK_WT_DATA7(weight[idx_base + 7]));
+	}
+}
+
+static void c3_isp_params_cfg_ae_stats(struct c3_isp_device *isp,
+				       struct c3_isp_param_block_header *block)
+{
+	struct ae_stats_cfg *ae_stats = (struct ae_stats_cfg *)block;
+	u32 *weight = ae_stats->ae_stat_blk_weight;
+	int idx_base;
+	int group;
+	int i;
+
+	if (!block->enabled)
+		return;
+
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL, TOP_3A_AE_STAT_SWITCH_MASK,
+			   ae_stats->ae_stat_switch << TOP_3A_AE_STAT_SWITCH_SHIFT);
+
+	/* Calculate the group number */
+	group = AE_BLOCK_WT_NUM / AE_BLK_WT_DATA_NUM_OF_GROUP;
+
+	/* Set the weight address to 0 position */
+	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
+	for (i = 0; i < group; i++) {
+		idx_base = i * AE_BLK_WT_DATA_NUM_OF_GROUP;
+		c3_isp_write(isp, ISP_AE_BLK_WT_DATA,
+			     AE_BLK_WT_DATA0(weight[idx_base + 0]) |
+			     AE_BLK_WT_DATA1(weight[idx_base + 1]) |
+			     AE_BLK_WT_DATA2(weight[idx_base + 2]) |
+			     AE_BLK_WT_DATA3(weight[idx_base + 3]) |
+			     AE_BLK_WT_DATA4(weight[idx_base + 4]) |
+			     AE_BLK_WT_DATA5(weight[idx_base + 5]) |
+			     AE_BLK_WT_DATA6(weight[idx_base + 6]) |
+			     AE_BLK_WT_DATA7(weight[idx_base + 7]));
+	}
+
+	/* Write the last weight data */
+	idx_base = i * AE_BLK_WT_DATA_NUM_OF_GROUP;
+	c3_isp_write(isp, ISP_AE_BLK_WT_DATA,
+		     AE_BLK_WT_DATA0(weight[idx_base + 0]) |
+		     AE_BLK_WT_DATA1(weight[idx_base + 1]) |
+		     AE_BLK_WT_DATA2(weight[idx_base + 2]) |
+		     AE_BLK_WT_DATA3(weight[idx_base + 3]) |
+		     AE_BLK_WT_DATA4(weight[idx_base + 4]) |
+		     AE_BLK_WT_DATA5(weight[idx_base + 5]) |
+		     AE_BLK_WT_DATA6(weight[idx_base + 6]));
+}
+
+static void c3_isp_params_cfg_af_stats(struct c3_isp_device *isp,
+				       struct c3_isp_param_block_header *block)
+{
+	struct af_stats_cfg *af_stats = (struct af_stats_cfg *)block;
+
+	if (!block->enabled)
+		return;
+
+	c3_isp_update_bits(isp, ISP_TOP_3A_STAT_CRTL, TOP_3A_AF_STAT_SWITCH_MASK,
+			   af_stats->af_stat_switch << TOP_3A_AF_STAT_SWITCH_SHIFT);
+}
+
+static void c3_isp_params_cfg_pst_gamma(struct c3_isp_device *isp,
+					struct c3_isp_param_block_header *block)
+{
+	struct pst_gamma_cfg *gamma = (struct pst_gamma_cfg *)block;
+	int idx_base;
+	int i, j;
+
+	if (!block->enabled) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   TOP_BED_GAMMA_EN, false);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   TOP_BED_GAMMA_EN, TOP_BED_GAMMA_EN);
+
+	for (j = 0; j < GAMMA_LUT_GROUP_NUM; j++) {
+		c3_isp_write(isp, ISP_PST_GAMMA_LUT_ADDR, PST_GAMMA_LUT_ADDR(j));
+
+		/* Calculate the block number */
+		for (i = 0; i < GAMMA_LUT_POINT_NUM / GAMMA_LUT_DATA_NUM_OF_GROUP; i++) {
+			idx_base = i * GAMMA_LUT_DATA_NUM_OF_GROUP;
+			c3_isp_write(isp, ISP_PST_GAMMA_LUT_DATA,
+				     PST_GAMMA_LUT_DATA0(gamma->pst_gamma_lut[j][idx_base]) |
+				     PST_GAMMA_LUT_DATA1(gamma->pst_gamma_lut[j][idx_base + 1]));
+		}
+
+		/* Write the last one lut data of group j */
+		idx_base = i * GAMMA_LUT_DATA_NUM_OF_GROUP;
+		c3_isp_write(isp, ISP_PST_GAMMA_LUT_DATA,
+			     PST_GAMMA_LUT_DATA0(gamma->pst_gamma_lut[j][idx_base]));
+	}
+}
+
+static void c3_isp_params_cfg_dmsc(struct c3_isp_device *isp,
+				   struct c3_isp_param_block_header *block)
+{
+	if (!block->enabled) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   TOP_BED_DMSC_EN, false);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   TOP_BED_DMSC_EN, TOP_BED_DMSC_EN);
+}
+
+/* Configure 4 x 3 ccm matrix */
+static void c3_isp_params_cfg_ccm(struct c3_isp_device *isp,
+				  struct c3_isp_param_block_header *block)
+{
+	struct ccm_cfg *ccm = (struct ccm_cfg *)block;
+
+	if (!block->enabled) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   TOP_BED_CCM_EN, false);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   TOP_BED_CCM_EN, TOP_BED_CCM_EN);
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_00_01, CCM_MTX_00_MASK,
+			   ccm->ccm_4x3matrix[0][0]);
+	c3_isp_update_bits(isp, ISP_CCM_MTX_00_01, CCM_MTX_01_MASK,
+			   ccm->ccm_4x3matrix[0][1] << CCM_MTX_01_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_02_03, CCM_MTX_02_MASK,
+			   ccm->ccm_4x3matrix[0][2]);
+	c3_isp_update_bits(isp, ISP_CCM_MTX_02_03, CCM_MTX_03_MASK,
+			   ccm->ccm_4x3matrix[0][3] << CCM_MTX_03_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_10_11, CCM_MTX_10_MASK,
+			   ccm->ccm_4x3matrix[1][0]);
+	c3_isp_update_bits(isp, ISP_CCM_MTX_10_11, CCM_MTX_11_MASK,
+			   ccm->ccm_4x3matrix[1][1] << CCM_MTX_11_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_12_13, CCM_MTX_12_MASK,
+			   ccm->ccm_4x3matrix[1][2]);
+	c3_isp_update_bits(isp, ISP_CCM_MTX_12_13, CCM_MTX_13_MASK,
+			   ccm->ccm_4x3matrix[1][3] << CCM_MTX_13_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_20_21, CCM_MTX_20_MASK,
+			   ccm->ccm_4x3matrix[2][0]);
+	c3_isp_update_bits(isp, ISP_CCM_MTX_20_21, CCM_MTX_21_MASK,
+			   ccm->ccm_4x3matrix[2][1] << CCM_MTX_21_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CCM_MTX_22_23_RS, CCM_MTX_22_MASK,
+			   ccm->ccm_4x3matrix[2][2]);
+	c3_isp_update_bits(isp, ISP_CCM_MTX_22_23_RS, CCM_MTX_23_MASK,
+			   ccm->ccm_4x3matrix[2][3] << CCM_MTX_23_SHIFT);
+}
+
+/* Configure color space conversion matrix parameters */
+static void c3_isp_params_cfg_csc(struct c3_isp_device *isp,
+				  struct c3_isp_param_block_header *block)
+{
+	struct csc_cfg *csc = (struct csc_cfg *)block;
+
+	if (!block->enabled) {
+		c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+				   TOP_BED_CM0_EN, false);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_BED_CTRL,
+			   TOP_BED_CM0_EN, TOP_BED_CM0_EN);
+
+	c3_isp_update_bits(isp, ISP_CM0_INP_OFST01,
+			   CM0_INP_OFST0_MASK, csc->cm0_offset_inp[0]);
+	c3_isp_update_bits(isp, ISP_CM0_INP_OFST01,
+			   CM0_INP_OFST1_MASK,
+			   csc->cm0_offset_inp[1] << CM0_INP_OFST1_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CM0_INP_OFST2,
+			   CM0_INP_OFST2_MASK, csc->cm0_offset_inp[2]);
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF00_01,
+			   CM0_MTX_00_MASK, csc->cm0_3x3matrix[0][0]);
+	c3_isp_update_bits(isp, ISP_CM0_COEF00_01,
+			   CM0_MTX_01_MASK,
+			   csc->cm0_3x3matrix[0][1] << CM0_MTX_01_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF02_10,
+			   CM0_MTX_02_MASK, csc->cm0_3x3matrix[0][2]);
+	c3_isp_update_bits(isp, ISP_CM0_COEF02_10,
+			   CM0_MTX_10_MASK,
+			   csc->cm0_3x3matrix[1][0] << CM0_MTX_10_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF11_12,
+			   CM0_MTX_11_MASK, csc->cm0_3x3matrix[1][1]);
+	c3_isp_update_bits(isp, ISP_CM0_COEF11_12,
+			   CM0_MTX_12_MASK,
+			   csc->cm0_3x3matrix[1][2] << CM0_MTX_12_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF20_21,
+			   CM0_MTX_20_MASK, csc->cm0_3x3matrix[2][0]);
+	c3_isp_update_bits(isp, ISP_CM0_COEF20_21,
+			   CM0_MTX_21_MASK,
+			   csc->cm0_3x3matrix[2][1] << CM0_MTX_21_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CM0_COEF22_OUP_OFST0,
+			   CM0_MTX_22_MASK, csc->cm0_3x3matrix[2][2]);
+	c3_isp_update_bits(isp, ISP_CM0_COEF22_OUP_OFST0,
+			   CM0_OFST_OUP0_MASK,
+			   csc->cm0_offset_oup[0] << CM0_OFST_OUP0_SHIFT);
+
+	c3_isp_update_bits(isp, ISP_CM0_OUP_OFST12_RS,
+			   CM0_OFST_OUP1_MASK, csc->cm0_offset_oup[1]);
+	c3_isp_update_bits(isp, ISP_CM0_OUP_OFST12_RS,
+			   CM0_OFST_OUP2_MASK,
+			   csc->cm0_offset_oup[2] << CM0_OFST_OUP2_SHIFT);
+	c3_isp_update_bits(isp, ISP_CM0_OUP_OFST12_RS,
+			   CM0_MTX_RS_MASK,
+			   csc->cm0_3x3mtrx_rs << CM0_MTX_RS_SHIFT);
+}
+
+/* Set blc offset of each color channel */
+static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
+				  struct c3_isp_param_block_header *block)
+{
+	struct blc_cfg *blc = (struct blc_cfg *)block;
+
+	if (!block->enabled) {
+		c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+				   TOP_BEO_CTRL_BLC_EN, false);
+		return;
+	}
+
+	c3_isp_update_bits(isp, ISP_TOP_BEO_CTRL,
+			   TOP_BEO_CTRL_BLC_EN, TOP_BEO_CTRL_BLC_EN);
+
+	c3_isp_write(isp, ISP_FED_BL_OFST_GR,
+		     FED_BL_GR_OFST(blc->fe_bl_ofst[0]));
+	c3_isp_write(isp, ISP_FED_BL_OFST_R,
+		     FED_BL_R_OFST(blc->fe_bl_ofst[1]));
+	c3_isp_write(isp, ISP_FED_BL_OFST_B,
+		     FED_BL_B_OFST(blc->fe_bl_ofst[2]));
+	c3_isp_write(isp, ISP_FED_BL_OFST_GB,
+		     FED_BL_GB_OFST(blc->fe_bl_ofst[3]));
+	c3_isp_write(isp, ISP_FED_BL_OFST_IR,
+		     FED_BL_IR_OFST(blc->fe_bl_ofst[4]));
+
+	c3_isp_write(isp, ISP_LSWB_BLC_OFST0,
+		     LSWB_BLC_OFST0(blc->blc_ofst[0]) |
+		     LSWB_BLC_OFST1(blc->blc_ofst[1]));
+	c3_isp_write(isp, ISP_LSWB_BLC_OFST1,
+		     LSWB_BLC_OFST2(blc->blc_ofst[2]) |
+		     LSWB_BLC_OFST3(blc->blc_ofst[3]));
+	c3_isp_write(isp, ISP_LSWB_BLC_OFST2,
+		     LSWB_BLC_OFST4(blc->blc_ofst[4]));
+}
+
+static const struct c3_isp_block_handler c3_isp_block_handlers[] = {
+	[C3_ISP_PARAM_BLOCK_WB_CHANGE] = {
+		.size = sizeof(struct wb_change_cfg),
+		.handler = c3_isp_params_cfg_wb_change,
+	},
+	[C3_ISP_PARAM_BLOCK_WB_LUMA] = {
+		.size = sizeof(struct wb_luma_cfg),
+		.handler = c3_isp_params_cfg_wb_luma,
+	},
+	[C3_ISP_PARAM_BLOCK_WB_TRIANGLE] = {
+		.size = sizeof(struct wb_triangle_cfg),
+		.handler = c3_isp_params_cfg_wb_triangle,
+	},
+	[C3_ISP_PARAM_BLOCK_AWB_STATS] = {
+		.size = sizeof(struct awb_stats_cfg),
+		.handler = c3_isp_params_cfg_awb_stats,
+	},
+	[C3_ISP_PARAM_BLOCK_AE_STATS] = {
+		.size = sizeof(struct ae_stats_cfg),
+		.handler = c3_isp_params_cfg_ae_stats,
+	},
+	[C3_ISP_PARAM_BLOCK_AF_STATS] = {
+		.size = sizeof(struct af_stats_cfg),
+		.handler = c3_isp_params_cfg_af_stats,
+	},
+	[C3_ISP_PARAM_BLOCK_PST_GAMMA] = {
+		.size = sizeof(struct pst_gamma_cfg),
+		.handler = c3_isp_params_cfg_pst_gamma,
+	},
+	[C3_ISP_PARAM_BLOCK_DMSC] = {
+		.size = sizeof(struct dmsc_cfg),
+		.handler = c3_isp_params_cfg_dmsc,
+	},
+	[C3_ISP_PARAM_BLOCK_CCM] = {
+		.size = sizeof(struct ccm_cfg),
+		.handler = c3_isp_params_cfg_ccm,
+	},
+	[C3_ISP_PARAM_BLOCK_CSC] = {
+		.size = sizeof(struct csc_cfg),
+		.handler = c3_isp_params_cfg_csc,
+	},
+	[C3_ISP_PARAM_BLOCK_BLC] = {
+		.size = sizeof(struct blc_cfg),
+		.handler = c3_isp_params_cfg_blc,
+	},
+};
+
+static enum vb2_buffer_state
+c3_isp_params_cfg_blocks(struct c3_isp_params *params)
+{
+	struct c3_isp_params_buffer *config = params->buff->vaddr;
+	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
+	size_t block_offset = 0;
+	size_t max_offset = 0;
+
+	if (config->total_size > C3_ISP_PARAMS_MAX_SIZE) {
+		dev_dbg(params->isp->dev, "Invalid parameters buffer size %lu\n",
+			config->total_size);
+		state = VB2_BUF_STATE_ERROR;
+		goto err_return_state;
+	}
+
+	/* Ensure config->data has a full struct c3_isp_param_block_header */
+	max_offset = config->total_size - sizeof(struct c3_isp_param_block_header);
+
+	while (block_offset <= max_offset) {
+		const struct c3_isp_block_handler *block_handler;
+		struct c3_isp_param_block_header *block;
+
+		block = (struct c3_isp_param_block_header *)
+			 &config->data[block_offset];
+
+		if (block->type >= C3_ISP_PARAM_BLOCK_SENTINEL) {
+			dev_dbg(params->isp->dev, "Invalid parameters block type\n");
+			state = VB2_BUF_STATE_ERROR;
+			goto err_return_state;
+		}
+
+		block_handler = &c3_isp_block_handlers[block->type];
+		if (block->size != block_handler->size) {
+			dev_dbg(params->isp->dev, "Invalid parameters block size\n");
+			state = VB2_BUF_STATE_ERROR;
+			goto err_return_state;
+		}
+
+		block_handler->handler(params->isp, block);
+
+		block_offset += block->size;
+	}
+
+err_return_state:
+	return state;
+}
+
+/* Initialize ISP pipeline */
+static int c3_isp_params_start(struct c3_isp_params *params)
+{
+	enum vb2_buffer_state state;
+	unsigned long flags;
+
+	/* Reset these controllers */
+	c3_isp_write(params->isp, ISP_TOP_FEO_CTRL0, TOP_FEO_CTRL0_ALL_DIS);
+	c3_isp_write(params->isp, ISP_TOP_FEO_CTRL1_0, TOP_FEO_CTRL1_0_ALL_DIS);
+	c3_isp_write(params->isp, ISP_TOP_FEO_CTRL1_1, TOP_FEO_CTRL1_1_ALL_DIS);
+	c3_isp_write(params->isp, ISP_TOP_FED_CTRL, TOP_FED_CTRL_ALL_DIS);
+	c3_isp_write(params->isp, ISP_TOP_BEO_CTRL, TOP_BEO_CTRL_ALL_DIS);
+	c3_isp_write(params->isp, ISP_TOP_BED_CTRL, TOP_BED_CTRL_ALL_DIS);
+
+	spin_lock_irqsave(&params->buff_lock, flags);
+
+	/* Only use the first buffer to initialize ISP */
+	params->buff = list_first_entry_or_null(&params->pending,
+						struct c3_isp_vb2_buffer, list);
+	if (!params->buff) {
+		spin_unlock_irqrestore(&params->buff_lock, flags);
+		return -EINVAL;
+	}
+
+	state = c3_isp_params_cfg_blocks(params);
+
+	spin_unlock_irqrestore(&params->buff_lock, flags);
+
+	return 0;
+}
+
+/* V4L2 video operations */
+
+static void c3_isp_params_return_buffers(struct c3_isp_params *params,
+					 enum vb2_buffer_state state)
+{
+	unsigned long flags;
+	struct c3_isp_vb2_buffer *buff;
+
+	spin_lock_irqsave(&params->buff_lock, flags);
+
+	while (!list_empty(&params->pending)) {
+		buff = list_first_entry(&params->pending,
+					struct c3_isp_vb2_buffer, list);
+		list_del(&buff->list);
+		vb2_buffer_done(&buff->vb.vb2_buf, state);
+	}
+
+	spin_unlock_irqrestore(&params->buff_lock, flags);
+}
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
+	.vidioc_subscribe_event         = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
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
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] != sizeof(struct c3_isp_params_buffer))
+		return -EINVAL;
+
+	*num_planes = 1;
+	sizes[0] = sizeof(struct c3_isp_params_buffer);
+
+	return 0;
+}
+
+static void c3_isp_params_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_vb2_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_vb2_buffer, vb);
+	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long flags;
+
+	spin_lock_irqsave(&params->buff_lock, flags);
+
+	list_add_tail(&buf->list, &params->pending);
+
+	spin_unlock_irqrestore(&params->buff_lock, flags);
+}
+
+static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned int size = params->vfmt.fmt.meta.buffersize;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(params->isp->dev,
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
+static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct c3_isp_vb2_buffer *buf =
+		container_of(v4l2_buf, struct c3_isp_vb2_buffer, vb);
+	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+
+	buf->vaddr = vb2_plane_vaddr(vb, 0);
+	buf->paddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	memset(buf->vaddr, 0, params->vfmt.fmt.meta.buffersize);
+
+	return 0;
+}
+
+static int c3_isp_params_vb2_start_streaming(struct vb2_queue *q,
+					     unsigned int count)
+{
+	struct c3_isp_params *params = vb2_get_drv_priv(q);
+	int ret;
+
+	guard(mutex)(&params->isp->lock);
+
+	ret = pm_runtime_resume_and_get(params->isp->dev);
+	if (ret)
+		return ret;
+
+	ret = video_device_pipeline_start(&params->vdev, &params->isp->pipe);
+	if (ret) {
+		dev_err(params->isp->dev,
+			"Failed to start params pipeline: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	if (c3_isp_pipeline_ready(params->isp)) {
+		ret = v4l2_subdev_enable_streams(&params->isp->core.sd,
+						 C3_ISP_CORE_PAD_SOURCE_VIDEO,
+						 BIT(0));
+		if (ret)
+			goto err_pipeline_stop;
+	}
+
+	c3_isp_params_start(params);
+
+	return 0;
+
+err_pipeline_stop:
+	video_device_pipeline_stop(&params->vdev);
+err_pm_put:
+	pm_runtime_put(params->isp->dev);
+	c3_isp_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void c3_isp_params_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct c3_isp_params *params = vb2_get_drv_priv(q);
+
+	guard(mutex)(&params->isp->lock);
+
+	c3_isp_params_return_buffers(params, VB2_BUF_STATE_ERROR);
+
+	if (params->isp->pipe.start_count == 1)
+		v4l2_subdev_disable_streams(&params->isp->core.sd,
+					    C3_ISP_CORE_PAD_SOURCE_VIDEO,
+					    BIT(0));
+
+	video_device_pipeline_stop(&params->vdev);
+	pm_runtime_put(params->isp->dev);
+}
+
+static const struct vb2_ops isp_params_vb2_ops = {
+	.queue_setup = c3_isp_params_vb2_queue_setup,
+	.buf_queue = c3_isp_params_vb2_buf_queue,
+	.buf_prepare = c3_isp_params_vb2_buf_prepare,
+	.buf_init = c3_isp_params_vb2_buf_init,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = c3_isp_params_vb2_start_streaming,
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
+	params->vfmt.fmt.meta.buffersize = sizeof(struct c3_isp_params_buffer);
+	params->isp = isp;
+	INIT_LIST_HEAD(&params->pending);
+	spin_lock_init(&params->buff_lock);
+	mutex_init(&params->lock);
+
+	snprintf(vdev->name, sizeof(vdev->name), "isp-params");
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
+	vb2_q->mem_ops = &vb2_dma_contig_memops;
+	vb2_q->ops = &isp_params_vb2_ops;
+	vb2_q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	vb2_q->io_modes = VB2_DMABUF | VB2_MMAP;
+	vb2_q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2_q->buf_struct_size = sizeof(struct c3_isp_vb2_buffer);
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
+int c3_isp_params_done(struct c3_isp_device *isp)
+{
+	struct c3_isp_params *params = &isp->params;
+	enum vb2_buffer_state state;
+	unsigned long flags;
+
+	spin_lock_irqsave(&params->buff_lock, flags);
+
+	params->buff = list_first_entry_or_null(&params->pending,
+						struct c3_isp_vb2_buffer, list);
+	if (!params->buff) {
+		spin_unlock_irqrestore(&params->buff_lock, flags);
+		return -EINVAL;
+	}
+
+	list_del(&params->buff->list);
+
+	state = c3_isp_params_cfg_blocks(params);
+
+	params->buff->vb.sequence = params->isp->frm_sequence;
+	params->buff->vb.vb2_buf.timestamp = ktime_get();
+	params->buff->vb.field = V4L2_FIELD_NONE;
+	vb2_buffer_done(&params->buff->vb.vb2_buf, state);
+
+	spin_unlock_irqrestore(&params->buff_lock, flags);
+
+	return 0;
+}
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-regs.h b/drivers/media/platform/amlogic/c3-isp/c3-isp-regs.h
new file mode 100644
index 000000000000..de1938f7c354
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-regs.h
@@ -0,0 +1,683 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __C3_ISP_REGS_H__
+#define __C3_ISP_REGS_H__
+
+#define ISP_TOP_INPUT_SIZE                       0x0000
+#define TOP_INPUT_HSIZE(x)                       (((x) & 0xffff) << 16)
+#define TOP_INPUT_VSIZE(x)                       ((x) & 0xffff)
+
+#define ISP_TOP_FRM_SIZE                         0x0004
+#define TOP_FRM_CORE_IHSIZE(x)                   (((x) & 0xffff) << 16)
+#define TOP_FRM_CORE_IVSIZE(x)                   ((x) & 0xffff)
+
+#define ISP_TOP_HOLD_SIZE                        0x0008
+#define TOP_HOLD_HSIZE_MASK                      GENMASK(31, 16)
+#define TOP_HOLD_HSIZE_SHIFT                     16
+
+#define ISP_TOP_PATH_EN                          0x0010
+#define TOP_DISP_EN(x)                           BIT((x))
+#define TOP_WRMIF_EN(x)                          BIT((x) + 8)
+
+#define ISP_TOP_PATH_SEL                         0x0014
+#define TOP_DATA_PATH_MASK                       GENMASK(18, 16)
+#define TOP_PATH_MIPI_TO_CORE                    BIT(16)
+
+#define ISP_TOP_IRQ_EN                           0x0080
+#define TOP_IRQ_FRAME_DONE                       BIT(0)
+#define TOP_IRQ_STATS_ERR                        BIT(5)
+
+#define ISP_TOP_IRQ_CLR                          0x0084
+#define ISP_TOP_IRQ_LINE_THRD                    0x0088
+#define TOP_IRQ_DIN_HSYNC                        BIT(16)
+
+#define ISP_TOP_RO_IRQ_STAT                      0x01c4
+#define ISP_TOP_MODE_CTRL                        0x0400
+#define ISP_TOP_FEO_CTRL0                        0x040c
+#define TOP_FEO_CTRL0_ALL_DIS                    0
+#define TOP_FEO_INPUT_FMT_EN                     BIT(8)
+
+#define ISP_TOP_FEO_CTRL1_0                      0x0410
+#define TOP_FEO_CTRL1_0_ALL_DIS                  0
+
+#define ISP_TOP_FEO_CTRL1_1                      0x0414
+#define TOP_FEO_CTRL1_1_ALL_DIS                  0
+
+#define ISP_TOP_FED_CTRL                         0x0418
+#define TOP_FED_CTRL_ALL_DIS                     0
+
+#define ISP_TOP_BEO_CTRL                         0x041c
+#define TOP_BEO_CTRL_ALL_DIS                     0
+#define TOP_BEO_CTRL_GTM_EN                      BIT(2)
+#define TOP_BEO_CTRL_WB_EN                       BIT(6)
+#define TOP_BEO_CTRL_BLC_EN                      BIT(7)
+#define TOP_BEO_CTRL_IDGAIN_EN                   BIT(8)
+#define TOP_BEO_CTRL_EOTF_EN                     BIT(9)
+
+#define ISP_TOP_BED_CTRL                         0x0420
+#define TOP_BED_CTRL_ALL_DIS                     0
+#define TOP_BED_CM0_EN                           BIT(14)
+#define TOP_BED_GAMMA_EN                         BIT(16)
+#define TOP_BED_CCM_EN                           BIT(18)
+#define TOP_BED_DMSC_EN                          BIT(19)
+
+#define ISP_TOP_3A_STAT_CRTL                     0x0424
+#define TOP_3A_AE_STAT_EN                        BIT(0)
+#define TOP_3A_AWB_STAT_EN                       BIT(1)
+#define TOP_3A_AF_STAT_EN                        BIT(2)
+#define TOP_3A_AWB_STAT_SWITCH_MASK              GENMASK(6, 4)
+#define TOP_3A_AWB_STAT_SWITCH_SHIFT             4
+#define TOP_3A_AWB_STAT_SWITCH_BEFORE_WB         2
+
+#define TOP_3A_AE_STAT_SWITCH_MASK               GENMASK(9, 8)
+#define TOP_3A_AE_STAT_SWITCH_SHIFT              8
+#define TOP_3A_AE_STAT_SWITCH_FROM_MLS           1
+#define TOP_3A_AF_STAT_SWITCH_MASK               GENMASK(13, 12)
+#define TOP_3A_AF_STAT_SWITCH_SHIFT              12
+#define TOP_3A_AF_STAT_SWITCH_FROM_SNR            0
+
+#define ISP_FED_BL_OFST_GR                       0x2018
+#define FED_BL_GR_OFST(x)                        ((x) & 0x1fffff)
+
+#define ISP_FED_BL_OFST_R                        0x201c
+#define FED_BL_R_OFST(x)                         ((x) & 0x1fffff)
+
+#define ISP_FED_BL_OFST_B                        0x2020
+#define FED_BL_B_OFST(x)                         ((x) & 0x1fffff)
+
+#define ISP_FED_BL_OFST_GB                       0x2024
+#define FED_BL_GB_OFST(x)                        ((x) & 0x1fffff)
+
+#define ISP_FED_BL_OFST_IR                       0x2028
+#define FED_BL_IR_OFST(x)                        ((x) & 0x1fffff)
+
+#define ISP_LSWB_BLC_OFST0                       0x4028
+#define LSWB_BLC_OFST1_MASK                      GENMASK(15, 0)
+#define LSWB_BLC_OFST1(x)                        ((x) & 0xffff)
+#define LSWB_BLC_OFST1_EXT(x)                    ((x) & 0xffff)
+#define LSWB_BLC_OFST0_MASK                      GENMASK(31, 16)
+#define LSWB_BLC_OFST0(x)                        (((x) & 0xffff) << 16)
+#define LSWB_BLC_OFST0_EXT(x)                    (((x) >> 16) & 0xffff)
+
+#define ISP_LSWB_BLC_OFST1                       0x402c
+#define LSWB_BLC_OFST3_MASK                      GENMASK(15, 0)
+#define LSWB_BLC_OFST3(x)                        ((x) & 0xffff)
+#define LSWB_BLC_OFST3_EXT(x)                    ((x) & 0xffff)
+#define LSWB_BLC_OFST2_MASK                      GENMASK(31, 16)
+#define LSWB_BLC_OFST2(x)                        (((x) & 0xffff) << 16)
+#define LSWB_BLC_OFST2_EXT(x)                    (((x) >> 16) & 0xffff)
+
+#define ISP_LSWB_BLC_OFST2                       0x4030
+#define LSWB_BLC_OFST4_MASK                      GENMASK(15, 0)
+#define LSWB_BLC_OFST4(x)                        ((x) & 0xffff)
+#define LSWB_BLC_OFST4_EXT(x)                    ((x) & 0xffff)
+
+#define ISP_LSWB_BLC_PHSOFST                     0x4034
+#define LSWB_BLC_YPHS_OFST_MASK                  GENMASK(1, 0)
+#define LSWB_BLC_XPHS_OFST_MASK                  GENMASK(3, 2)
+#define LSWB_BLC_XPHS_OFST_SHIFT                 2
+
+#define ISP_LSWB_WB_GAIN0                        0x4038
+#define LSWB_WB_GAIN1_MASK                       GENMASK(11, 0)
+#define LSWB_WB_GAIN0_MASK                       GENMASK(27, 16)
+#define LSWB_WB_GAIN0_SHIFT                      16
+
+#define ISP_LSWB_WB_GAIN1                        0x403c
+#define LSWB_WB_GAIN3_MASK                       GENMASK(11, 0)
+#define LSWB_WB_GAIN2_MASK                       GENMASK(27, 16)
+#define LSWB_WB_GAIN2_SHIFT                      16
+
+#define ISP_LSWB_WB_GAIN2                        0x4040
+#define LSWB_WB_GAIN4_MASK                       GENMASK(11, 0)
+
+#define ISP_LSWB_WB_LIMIT0                       0x4044
+#define LSWB_WB_LIMIT1(x)                        ((x) & 0xffff)
+#define LSWB_WB_LIMIT0(x)                        (((x) & 0xffff) << 16)
+
+#define ISP_LSWB_WB_LIMIT1                       0x4048
+#define LSWB_WB_LIMIT3(x)                        ((x) & 0xffff)
+#define LSWB_WB_LIMIT2(x)                        (((x) & 0xffff) << 16)
+
+#define ISP_LSWB_WB_LIMIT2                       0x404c
+#define LSWB_WB_LIMIT4_MASK                      GENMASK(15, 0)
+
+#define ISP_LSWB_WB_PHSOFST                      0x4050
+#define LSWB_WB_YPHS_OFST_MASK                   GENMASK(1, 0)
+#define LSWB_WB_XPHS_OFST_MASK                   GENMASK(3, 2)
+#define LSWB_WB_XPHS_OFST_SHIFT                  2
+
+#define ISP_LSWB_LNS_PHSOFST                     0x4054
+#define LSWB_LNS_YPHS_OFST_MASK                  GENMASK(1, 0)
+#define LSWB_LNS_XPHS_OFST_MASK                  GENMASK(3, 2)
+#define LSWB_LNS_XPHS_OFST_SHIFT                 2
+
+#define ISP_DMS_COMMON_PARAM0                    0x5000
+#define DMS_COMMON_YPHS_OFST_MASK                GENMASK(1, 0)
+#define DMS_COMMON_XPHS_OFST_MASK                GENMASK(3, 2)
+#define DMS_COMMON_XPHS_OFST_SHIFT               2
+
+#define ISP_CM0_INP_OFST01                       0x6040
+#define CM0_INP_OFST0_MASK                       GENMASK(12, 0)
+#define CM0_INP_OFST1_MASK                       GENMASK(28, 16)
+#define CM0_INP_OFST1_SHIFT                      16
+
+#define ISP_CM0_INP_OFST2                        0x6044
+#define CM0_INP_OFST2_MASK                       GENMASK(12, 0)
+
+#define ISP_CM0_COEF00_01                        0x6048
+#define CM0_MTX_00_MASK                          GENMASK(12, 0)
+#define CM0_MTX_01_MASK                          GENMASK(28, 16)
+#define CM0_MTX_01_SHIFT                         16
+
+#define ISP_CM0_COEF02_10                        0x604c
+#define CM0_MTX_02_MASK                          GENMASK(12, 0)
+#define CM0_MTX_10_MASK                          GENMASK(28, 16)
+#define CM0_MTX_10_SHIFT                         16
+
+#define ISP_CM0_COEF11_12                        0x6050
+#define CM0_MTX_11_MASK                          GENMASK(12, 0)
+#define CM0_MTX_12_MASK                          GENMASK(28, 16)
+#define CM0_MTX_12_SHIFT                         16
+
+#define ISP_CM0_COEF20_21                        0x6054
+#define CM0_MTX_20_MASK                          GENMASK(12, 0)
+#define CM0_MTX_21_MASK                          GENMASK(28, 16)
+#define CM0_MTX_21_SHIFT                         16
+
+#define ISP_CM0_COEF22_OUP_OFST0                 0x6058
+#define CM0_MTX_22_MASK                          GENMASK(12, 0)
+#define CM0_OFST_OUP0_MASK                       GENMASK(28, 16)
+#define CM0_OFST_OUP0_SHIFT                      16
+
+#define ISP_CM0_OUP_OFST12_RS                    0x605c
+#define CM0_OFST_OUP1_MASK                       GENMASK(12, 0)
+#define CM0_OFST_OUP2_MASK                       GENMASK(28, 16)
+#define CM0_OFST_OUP2_SHIFT                      16
+#define CM0_MTX_RS_MASK                          GENMASK(31, 30)
+#define CM0_MTX_RS_SHIFT                         30
+
+#define ISP_CCM_MTX_00_01                        0x6098
+#define CCM_MTX_00_MASK                          GENMASK(12, 0)
+#define CCM_MTX_01_MASK                          GENMASK(28, 16)
+#define CCM_MTX_01_SHIFT                         16
+
+#define ISP_CCM_MTX_02_03                        0x609c
+#define CCM_MTX_02_MASK                          GENMASK(12, 0)
+#define CCM_MTX_03_MASK                          GENMASK(28, 16)
+#define CCM_MTX_03_SHIFT                         16
+
+#define ISP_CCM_MTX_10_11                        0x60A0
+#define CCM_MTX_10_MASK                          GENMASK(12, 0)
+#define CCM_MTX_11_MASK                          GENMASK(28, 16)
+#define CCM_MTX_11_SHIFT                         16
+
+#define ISP_CCM_MTX_12_13                        0x60A4
+#define CCM_MTX_12_MASK                          GENMASK(12, 0)
+#define CCM_MTX_13_MASK                          GENMASK(28, 16)
+#define CCM_MTX_13_SHIFT                         16
+
+#define ISP_CCM_MTX_20_21                        0x60A8
+#define CCM_MTX_20_MASK                          GENMASK(12, 0)
+#define CCM_MTX_21_MASK                          GENMASK(28, 16)
+#define CCM_MTX_21_SHIFT                         16
+
+#define ISP_CCM_MTX_22_23_RS                     0x60Ac
+#define CCM_MTX_22_MASK                          GENMASK(12, 0)
+#define CCM_MTX_23_MASK                          GENMASK(28, 16)
+#define CCM_MTX_23_SHIFT                         16
+
+#define ISP_PST_GAMMA_MODE                       0x60C0
+#define PST_GAMMA_MODE                           BIT(0)
+#define PST_GAMMA_MODE_EXT(x)                    ((x) & 0x1)
+
+#define ISP_PST_GAMMA_LUT_ADDR                   0x60cc
+#define PST_GAMMA_LUT_ADDR(x)                    ((x) << 7)
+
+#define ISP_PST_GAMMA_LUT_DATA                   0x60d0
+#define PST_GAMMA_LUT_DATA0(x)                   ((x) & 0xffff)
+#define PST_GAMMA_LUT_DATA1(x)                   (((x) & 0xffff) << 16)
+
+#define DISP0_TOP_TOP_CTRL                       0x8000
+#define DISP_CRP2_EN                             BIT(5)
+
+#define DISP0_TOP_CRP2_START                     0x8004
+#define DISP_CRP2_VSTART_MASK                    GENMASK(15, 0)
+#define DISP_CRP2_VSTART(x)                      ((x) & 0xffff)
+#define DISP_CRP2_HSTART_MASK                    GENMASK(31, 16)
+#define DISP_CRP2_HSTART(x)                      (((x) & 0xffff) << 16)
+
+#define DISP0_TOP_CRP2_SIZE                      0x8008
+#define DISP_CRP2_VSIZE_MASK                     GENMASK(15, 0)
+#define DISP_CRP2_VSIZE(x)                       ((x) & 0xffff)
+#define DISP_CRP2_HSIZE_MASK                     GENMASK(31, 16)
+#define DISP_CRP2_HSIZE(x)                       (((x) & 0xffff) << 16)
+
+#define DISP0_TOP_OUT_SIZE                       0x800c
+#define DISP_OUT_VSIZE_MASK                      GENMASK(12, 0)
+#define DISP_OUT_HSIZE_MASK                      GENMASK(28, 16)
+#define DISP_OUT_HSIZE_SHIFT                     16
+
+#define ISP_DISP0_TOP_IN_SIZE                    0x804c
+#define DISP_TOP_IN_VSIZE(x)                     ((x) & 0x1fff)
+#define DISP_TOP_IN_HSIZE(x)                     (((x) & 0x1fff) << 16)
+
+#define DISP0_PPS_SCALE_EN                       0x8200
+#define PPS_VSC_TAP_NUM_MASK                     GENMASK(3, 0)
+#define PPS_HSC_TAP_NUM_MASK                     GENMASK(7, 4)
+#define PPS_HSC_TAP_NUM_SHIFT                    4
+#define PPS_HSC_TAP_NUM_INIT                     4
+#define PPS_PREVSC_FLT_NUM_MASK                  GENMASK(11, 8)
+#define PPS_PREVSC_FLT_NUM_SHIFT                 8
+#define PPS_PREHSC_FLT_NUM_MASK                  GENMASK(15, 12)
+#define PPS_PREHSC_FLT_NUM_SHIFT                 12
+#define PPS_PREHSC_FLT_NUM_INIT                  8
+#define PPS_PREVSC_RATE_MASK                     GENMASK(17, 16)
+#define PPS_PREVSC_RATE_SHIFT                    16
+#define PPS_PREHSC_RATE_MASK                     GENMASK(19, 18)
+#define PPS_PREHSC_RATE_SHIFT                    18
+#define PPS_HSC_EN_MASK                          BIT(20)
+#define PPS_HSC_EN_SHIFT                         20
+#define PPS_VSC_EN_MASK                          BIT(21)
+#define PPS_VSC_EN_SHIFT                         21
+#define PPS_PREVSC_EN_MASK                       BIT(22)
+#define PPS_PREVSC_EN_SHIFT                      22
+#define PPS_PREHSC_EN_MASK                       BIT(23)
+#define PPS_PREHSC_EN_SHIFT                      23
+#define PPS_HSC_NOR_RS_BITS_MASK                 GENMASK(27, 24)
+#define PPS_HSC_NOR_RS_BITS_SHIFT                24
+#define PPS_HSC_NOR_RS_BITS_INIT                 9
+#define PPS_VSC_NOR_RS_BITS_MASK                 GENMASK(31, 28)
+#define PPS_VSC_NOR_RS_BITS_SHIFT                28
+#define PPS_VSC_NOR_RS_BITS_INIT                 9
+
+#define DISP0_PPS_PRE_HSCALE_COEF_0              0x8204
+#define PPS_PREHSC_LUMA_COEF0_MASK               GENMASK(9, 0)
+#define PPS_PREHSC_LUMA_COEF0_INIT               128
+#define PPS_PREHSC_LUMA_COEF1_MASK               GENMASK(25, 16)
+#define PPS_PREHSC_LUMA_COEF1_SHIFT              16
+#define PPS_PREHSC_LUMA_COEF1_INIT               128
+
+#define DISP0_PPS_PRE_HSCALE_COEF_1              0x8208
+#define PPS_PREHSC_LUMA_COEF2_MASK               GENMASK(9, 0)
+#define PPS_PREHSC_LUMA_COEF2_INIT               32
+#define PPS_PREHSC_LUMA_COEF3_MASK               GENMASK(25, 16)
+#define PPS_PREHSC_LUMA_COEF3_SHIFT              16
+#define PPS_PREHSC_LUMA_COEF3_INIT               32
+
+#define DISP0_PPS_VSC_START_PHASE_STEP           0x8224
+#define PPS_VSC_FRACTION_PART_MASK               GENMASK(23, 0)
+#define PPS_VSC_INTEGER_PART_MASK                GENMASK(27, 24)
+#define PPS_VSC_INTEGER_PART_SHIFT               24
+
+#define DISP0_PPS_HSC_START_PHASE_STEP           0x8230
+#define PPS_HSC_FRACTION_PART_MASK               GENMASK(23, 0)
+#define PPS_HSC_INTEGER_PART_MASK                GENMASK(27, 24)
+#define PPS_HSC_INTEGER_PART_SHIFT               24
+
+#define DISP0_PPS_444TO422                       0x823c
+#define PPS_444TO422_EN_MASK                     BIT(0)
+
+#define ISP_SCALE0_COEF_IDX_LUMA                 0x8240
+#define SCALE_LUMA_COEF_S11_MODE                 BIT(9)
+#define SCALE_LUMA_CTYPE(x)                      (((x) & 0x7) << 10)
+
+#define ISP_SCALE0_COEF_LUMA                     0x8244
+#define SCALE_COEF_LUMA_DATA1(x)                 ((x) & 0x7ff)
+#define SCALE_COEF_LUMA_DATA0(x)                 (((x) & 0x7ff) << 16)
+
+#define ISP_SCALE0_COEF_IDX_CHRO                 0x8248
+#define SCALE_CHRO_COEF_S11_MODE                 BIT(9)
+#define SCALE_CHRO_CTYPE(x)                      (((x) & 0x7) << 10)
+
+#define ISP_SCALE0_COEF_CHRO                     0x824c
+#define SCALE_COEF_CHRO_DATA1(x)                 ((x) & 0x7ff)
+#define SCALE_COEF_CHRO_DATA0(x)                 (((x) & 0x7ff) << 16)
+
+#define ISP_AF_ROI0_WIN01                        0xa00c
+#define AF_ROI_XYWIN_00_INIT                     (50 & 0xffff)
+#define AF_ROI_XYWIN_01_INIT                     ((50 & 0xffff) << 16)
+
+#define ISP_AF_ROI1_WIN01                        0xa010
+#define AF_ROI_XYWIN_10_INIT                     (100 & 0xffff)
+#define AF_ROI_XYWIN_11_INIT                     ((50 & 0xffff) << 16)
+
+#define ISP_AF_ROI0_WIN23                        0xa014
+#define AF_ROI_XYWIN_02_INIT                     (80 & 0xffff)
+#define AF_ROI_XYWIN_03_INIT                     ((40 & 0xffff) << 16)
+
+#define ISP_AF_ROI1_WIN23                        0xa018
+#define AF_ROI_XYWIN_12_INIT                     (80 & 0xffff)
+#define AF_ROI_XYWIN_13_INIT                     ((40 & 0xffff) << 16)
+
+#define ISP_AF_CTRL                              0xa044
+#define AF_CTRL_YPHS_OFST_MASK                   GENMASK(15, 14)
+#define AF_CTRL_YPHS_OFST_SHIFT                  14
+#define AF_CTRL_XPHS_OFST_MASK                   GENMASK(17, 16)
+#define AF_CTRL_XPHS_OFST_SHIFT                  16
+
+#define ISP_AF_HV_SIZE                           0xa04c
+#define AF_HV_STAT_VSIZE(x)                      ((x) & 0xffff)
+#define AF_HV_STAT_HSIZE(x)                      (((x) & 0xffff) << 16)
+
+#define ISP_AF_HV_BLKNUM                         0xa050
+#define AF_HV_STAT_VBLK_NUM_MASK                 GENMASK(5, 0)
+#define AF_HV_STAT_VBLK_NUM_EXT(x)               ((x) & 0x3f)
+#define AF_HV_STAT_HBLK_NUM_MASK                 GENMASK(21, 16)
+#define AF_HV_STAT_HBLK_NUM_SHIFT                16
+
+#define ISP_AF_EN_CTRL                           0xa054
+#define AF_STAT_SELECT                           BIT(21)
+#define AF_STAT_SELECT_SHIFT                     21
+
+#define ISP_RO_AF_GLB_STAT_PCK0                  0xa0e0
+#define ISP_RO_AF_GLB_STAT_PCK1                  0xa0e4
+#define ISP_RO_AF_GLB_STAT_PCK2                  0xa0e8
+#define ISP_RO_AF_GLB_STAT_PCK3                  0xa0eC
+#define ISP_AF_IDX_ADDR                          0xa1c0
+#define ISP_AF_IDX_DATA                          0xa1c4
+#define AF_IDX_VIDX_DATA(x)                      ((x) & 0xffff)
+#define AF_IDX_HIDX_DATA(x)                      (((x) & 0xffff) << 16)
+
+#define ISP_AE_ROI0_WIN01                        0xa40c
+#define AE_ROI_XYWIN_00_INIT                     (50 & 0xffff)
+#define AE_ROI_XYWIN_01_INIT                     ((50 & 0xffff) << 16)
+
+#define ISP_AE_ROI1_WIN01                        0xa410
+#define AE_ROI_XYWIN_10_INIT                     (100 & 0xffff)
+#define AE_ROI_XYWIN_11_INIT                     ((50 & 0xffff) << 16)
+
+#define ISP_AE_ROI0_WIN23                        0xa414
+#define AE_ROI_XYWIN_02_INIT                     (80 & 0xffff)
+#define AE_ROI_XYWIN_03_INIT                     ((40 & 0xffff) << 16)
+
+#define ISP_AE_ROI1_WIN23                        0xa418
+#define AE_ROI_XYWIN_12_INIT                     (80 & 0xffff)
+#define AE_ROI_XYWIN_13_INIT                     ((40 & 0xffff) << 16)
+
+#define ISP_RO_AE_ROI_STAT_PCK0_0                0xa424
+#define ISP_RO_AE_ROI_STAT_PCK1_0                0xa428
+#define ISP_RO_AE_ROI_STAT_PCK0_1                0xa42c
+#define ISP_RO_AE_ROI_STAT_PCK1_1                0xa430
+#define ISP_AE_CTRL                              0xa448
+#define AE_CTRL_AE_STAT_LOCAL_MODE               GENMASK(3, 2)
+#define AE_CTRL_AE_STAT_LOCAL_MODE_EXT(x)        (((x) >> 2) & 0x3)
+#define AE_CTRL_INPUT_2LINE_TOGETHER             BIT(7)
+#define AE_CTRL_LUMA_MODE_MASK                   GENMASK(9, 8)
+#define AE_CTRL_LUMA_MODE_SHIFT                  8
+#define AE_CTRL_LUMA_MODE_FILTER                 2
+#define AE_CTRL_YPHS_OFST_MASK                   GENMASK(25, 24)
+#define AE_CTRL_YPHS_OFST_SHIFT                  24
+#define AE_CTRL_XPHS_OFST_MASK                   GENMASK(27, 26)
+#define AE_CTRL_XPHS_OFST_SHIFT                  26
+
+#define ISP_AE_CRTL2_0                           0xa44c
+#define AE_CRTL2_BL12_GRBGI0_MASK                GENMASK(11, 0)
+#define AE_CRTL2_GAIN_GRBGI0_MASK                GENMASK(23, 16)
+#define AE_CRTL2_GAIN_GRBGI0_SHIFT               16
+
+#define ISP_AE_CRTL2_1                           0xa450
+#define AE_CRTL2_BL12_GRBGI1_MASK                GENMASK(11, 0)
+#define AE_CRTL2_GAIN_GRBGI1_MASK                GENMASK(23, 16)
+#define AE_CRTL2_GAIN_GRBGI1_SHIFT               16
+
+#define ISP_AE_CRTL2_2                           0xa454
+#define AE_CRTL2_BL12_GRBGI2_MASK                GENMASK(11, 0)
+#define AE_CRTL2_GAIN_GRBGI2_MASK                GENMASK(23, 16)
+#define AE_CRTL2_GAIN_GRBGI2_SHIFT               16
+
+#define ISP_AE_CRTL2_3                           0xa458
+#define AE_CRTL2_BL12_GRBGI3_MASK                GENMASK(11, 0)
+#define AE_CRTL2_GAIN_GRBGI3_MASK                GENMASK(23, 16)
+#define AE_CRTL2_GAIN_GRBGI3_SHIFT               16
+
+#define ISP_AE_CRTL2_4                           0xa45C
+#define AE_CRTL2_BL12_GRBGI4_MASK                GENMASK(11, 0)
+#define AE_CRTL2_GAIN_GRBGI4_MASK                GENMASK(23, 16)
+#define AE_CRTL2_GAIN_GRBGI4_SHIFT               16
+
+#define ISP_AE_HV_SIZE                           0xa464
+#define AE_HV_STAT_VSIZE(x)                      ((x) & 0xffff)
+#define AE_HV_STAT_HSIZE(x)                      (((x) & 0xffff) << 16)
+
+#define ISP_AE_HV_BLKNUM                         0xa468
+#define AE_HV_STAT_VBLK_NUM_MASK                 GENMASK(6, 0)
+#define AE_HV_STAT_VBLK_NUM_EXT(x)               ((x) & 0x7f)
+#define AE_HV_STAT_HBLK_NUM_MASK                 GENMASK(22, 16)
+#define AE_HV_STAT_HBLK_NUM_SHIFT                16
+
+#define ISP_AE_STAT_THD01                        0xa46c
+#define AE_STAT_THRD0_INIT                       (13107 & 0xffff)
+#define AE_STAT_THRD1_INIT                       ((26214 & 0xffff) << 16)
+
+#define ISP_AE_STAT_THD23                        0xa470
+#define AE_STAT_THRD2_INIT                       (39321 & 0xffff)
+#define AE_STAT_THRD3_INIT                       ((52428 & 0xffff) << 16)
+
+#define ISP_RO_AE_STAT_GPNUM                     0xa49c
+#define ISP_AE_IDX_ADDR                          0xa600
+#define ISP_AE_IDX_DATA                          0xa604
+#define AE_IDX_VIDX_DATA(x)                      ((x) & 0xffff)
+#define AE_IDX_HIDX_DATA(x)                      (((x) & 0xffff) << 16)
+
+#define ISP_AE_BLK_WT_ADDR                       0xa608
+#define ISP_AE_BLK_WT_DATA                       0xa60c
+#define AE_BLK_WT_DATA0(x)                       ((x) & 0xf)
+#define AE_BLK_WT_DATA1(x)                       (((x) & 0xf) << 4)
+#define AE_BLK_WT_DATA2(x)                       (((x) & 0xf) << 8)
+#define AE_BLK_WT_DATA3(x)                       (((x) & 0xf) << 12)
+#define AE_BLK_WT_DATA4(x)                       (((x) & 0xf) << 16)
+#define AE_BLK_WT_DATA5(x)                       (((x) & 0xf) << 20)
+#define AE_BLK_WT_DATA6(x)                       (((x) & 0xf) << 24)
+#define AE_BLK_WT_DATA7(x)                       (((x) & 0xf) << 28)
+
+#define ISP_AWB_CTRL                             0xa834
+#define AWB_CTRL_YPHS_OFST_MASK                  GENMASK(1, 0)
+#define AWB_CTRL_XPHS_OFST_MASK                  GENMASK(3, 2)
+#define AWB_CTRL_XPHS_OFST_SHIFT                 2
+#define AWB_CTRL_STAT_RATIO_MODE                 BIT(4)
+
+#define ISP_AWB_HV_SIZE                          0xa83c
+#define AWB_HV_STAT_VSIZE(x)                     ((x) & 0xffff)
+#define AWB_HV_STAT_HSIZE(x)                     (((x) & 0xffff) << 16)
+
+#define ISP_AWB_STAT_ROI0_WIN01                  0xa80c
+#define AWB_ROI_XYWIN_00_INIT                    (32 & 0xffff)
+#define AWB_ROI_XYWIN_01_INIT                    ((62 & 0xffff) << 16)
+
+#define ISP_AWB_STAT_ROI1_WIN01                  0xa810
+#define AWB_ROI_XYWIN_10_INIT                    (32 & 0xffff)
+#define AWB_ROI_XYWIN_11_INIT                    ((82 & 0xffff) << 16)
+
+#define ISP_AWB_STAT_ROI0_WIN23                  0xa814
+#define AWB_ROI_XYWIN_02_INIT                    (32 & 0xffff)
+#define AWB_ROI_XYWIN_03_INIT                    ((42 & 0xffff) << 16)
+
+#define ISP_AWB_STAT_ROI1_WIN23                  0xa818
+#define AWB_ROI_XYWIN_12_INIT                    (64 & 0xffff)
+#define AWB_ROI_XYWIN_13_INIT                    ((52 & 0xffff) << 16)
+
+#define ISP_AWB_HV_BLKNUM                        0xa840
+#define AWB_HV_STAT_VBLK_NUM_MASK                GENMASK(5, 0)
+#define AWB_HV_STAT_VBLK_NUM_EXT(x)              ((x) & 0x3f)
+#define AWB_HV_STAT_HBLK_NUM_MASK                GENMASK(21, 16)
+#define AWB_HV_STAT_HBLK_NUM_SHIFT               16
+
+#define ISP_AWB_STAT_RG                          0xa848
+#define AWB_STAT_RG_MIN_MASK                     GENMASK(11, 0)
+#define AWB_STAT_RG_MAX_MASK                     GENMASK(27, 16)
+#define AWB_STAT_RG_MAX_SHIFT                    16
+
+#define ISP_AWB_STAT_BG                          0xa84c
+#define AWB_STAT_BG_MIN_MASK                     GENMASK(11, 0)
+#define AWB_STAT_BG_MAX_MASK                     GENMASK(27, 16)
+#define AWB_STAT_BG_MAX_SHIFT                    16
+
+#define ISP_AWB_STAT_RG_HL                       0xa850
+#define AWB_STAT_RG_LOW_MASK                     GENMASK(11, 0)
+#define AWB_STAT_RG_HIGH_MASK                    GENMASK(27, 16)
+#define AWB_STAT_RG_HIGH_SHIFT                   16
+
+#define ISP_AWB_STAT_BG_HL                       0xa854
+#define AWB_STAT_BG_LOW_MASK                     GENMASK(11, 0)
+#define AWB_STAT_BG_HIGH_MASK                    GENMASK(27, 16)
+#define AWB_STAT_BG_HIGH_SHIFT                   16
+
+#define ISP_AWB_STAT_CTRL2                       0xa858
+#define AWB_STAT_SATUR_VALID_MASK                BIT(0)
+#define AWB_STAT_LOCAL_MODE                      BIT(2)
+#define AWB_STAT_LOCAL_MODE_EXT(x)               (((x) >> 2) & 0x1)
+#define AWB_STAT_LUMA_DIV_MODE                   GENMASK(4, 3)
+#define AWB_STAT_LUMA_DIV_MODE_EXT(x)            (((x) >> 3) & 0x3)
+
+#define ISP_AWB_STAT_BLC20_0                     0xa85c
+#define AWB_STAT_BLC20_GR_MASK                   GENMASK(19, 0)
+
+#define ISP_AWB_STAT_BLC20_1                     0xa860
+#define AWB_STAT_BLC20_R_MASK                    GENMASK(19, 0)
+
+#define ISP_AWB_STAT_BLC20_2                     0xa864
+#define AWB_STAT_BLC20_B_MASK                    GENMASK(19, 0)
+
+#define ISP_AWB_STAT_BLC20_3                     0xa868
+#define AWB_STAT_BLC20_GB_MASK                   GENMASK(19, 0)
+
+#define ISP_AWB_STAT_GAIN10_0                    0xa86c
+#define AWB_STAT_GAIN10_GR_MASK                  GENMASK(9, 0)
+
+#define ISP_AWB_STAT_GAIN10_1                    0xa870
+#define AWB_STAT_GAIN10_R_MASK                   GENMASK(9, 0)
+
+#define ISP_AWB_STAT_GAIN10_2                    0xa874
+#define AWB_STAT_GAIN10_B_MASK                   GENMASK(9, 0)
+
+#define ISP_AWB_STAT_GAIN10_3                    0xa878
+#define AWB_STAT_GAIN10_GB_MASK                  GENMASK(9, 0)
+
+#define ISP_AWB_STAT_SATUR_CTRL                  0xa884
+#define AWB_STAT_SATUR_LOW(x)                    ((x) & 0xffff)
+#define AWB_STAT_SATUR_HIGH(x)                   (((x) & 0xffff) << 16)
+
+#define ISP_AWB_IDX_ADDR                         0xaa00
+#define ISP_AWB_IDX_DATA                         0xaa04
+#define AWB_IDX_VIDX_DATA(x)                     ((x) & 0xffff)
+#define AWB_IDX_HIDX_DATA(x)                     (((x) & 0xffff) << 16)
+
+#define ISP_AWB_BLK_WT_ADDR                      0xaa08
+#define ISP_AWB_BLK_WT_DATA                      0xaa0c
+#define AWB_BLK_WT_DATA0(x)                      ((x) & 0xf)
+#define AWB_BLK_WT_DATA1(x)                      (((x) & 0xf) << 4)
+#define AWB_BLK_WT_DATA2(x)                      (((x) & 0xf) << 8)
+#define AWB_BLK_WT_DATA3(x)                      (((x) & 0xf) << 12)
+#define AWB_BLK_WT_DATA4(x)                      (((x) & 0xf) << 16)
+#define AWB_BLK_WT_DATA5(x)                      (((x) & 0xf) << 20)
+#define AWB_BLK_WT_DATA6(x)                      (((x) & 0xf) << 24)
+#define AWB_BLK_WT_DATA7(x)                      (((x) & 0xf) << 28)
+
+#define ISP_WRMIFX3_0_CH0_CTRL0                  0xc400
+#define WRMIFX3_CH0_STRIDE_MASK                  GENMASK(28, 16)
+#define WRMIFX3_CH0_STRIDE_SHIFT                 16
+
+#define ISP_WRMIFX3_0_CH0_CTRL1                  0xc404
+#define WRMIFX3_CH0_PIX_BITS_MODE_MASK           GENMASK(30, 27)
+#define WRMIFX3_CH0_PIX_BITS_MODE_SHIFT          27
+#define WRMIFX3_CH0_PIX_BITS_8BITS               1
+#define WRMIFX3_CH0_PIX_BITS_16BITS              2
+
+#define ISP_WRMIFX3_0_CH1_CTRL0                  0xc408
+#define WRMIFX3_CH1_STRIDE_MASK                  GENMASK(28, 16)
+#define WRMIFX3_CH1_STRIDE_SHIFT                 16
+
+#define ISP_WRMIFX3_0_CH1_CTRL1                  0xc40c
+#define WRMIFX3_CH1_PIX_BITS_MODE_MASK           GENMASK(30, 27)
+#define WRMIFX3_CH1_PIX_BITS_MODE_SHIFT          27
+#define WRMIFX3_CH1_PIX_BITS_16BITS              2
+#define WRMIFX3_CH1_PIX_BITS_32BITS              3
+
+#define ISP_WRMIFX3_0_CH0_BADDR                  0xc440
+/* WRMIF base address need 16 bits alignment */
+#define WRMIFX3_CH0_BADDR(x)                     (((x) >> 4) & 0xffffffff)
+
+#define ISP_WRMIFX3_0_CH1_BADDR                  0xc444
+#define WRMIFX3_CH1_BADDR(x)                     (((x) >> 4) & 0xffffffff)
+
+#define ISP_WRMIFX3_0_FMT_SIZE                   0xc464
+#define WRMIFX3_FMT_HSIZE(x)                     ((x) & 0xffff)
+#define WRMIFX3_FMT_VSIZE(x)                     (((x) & 0xffff) << 16)
+
+#define ISP_WRMIFX3_0_FMT_CTRL                   0xc468
+#define WRMIFX3_FMT_MTX_IBITS_MASK               GENMASK(1, 0)
+#define WRMIFX3_FMT_MTX_IBITS_8BIT               0
+#define WRMIFX3_FMT_MTX_IBITS_10BIT              1
+#define WRMIFX3_FMT_MTX_IBITS_12BIT              2
+#define WRMIFX3_FMT_MTX_IBITS_16BIT              3
+#define WRMIFX3_FMT_MTX_UV_SWAP_MASK             BIT(2)
+#define WRMIFX3_FMT_MTX_UV_SWAP_SHIFT            2
+#define WRMIFX3_FMT_MTX_UV_SWAP_VU               0
+#define WRMIFX3_FMT_MTX_UV_SWAP_UV               1
+#define WRMIFX3_FMT_MTX_PLANE_MASK               GENMASK(5, 4)
+#define WRMIFX3_FMT_MTX_PLANE_SHIFT              4
+#define WRMIFX3_FMT_MTX_PLANE_X1                 0
+#define WRMIFX3_FMT_MTX_PLANE_X2                 1
+#define WRMIFX3_FMT_MODE_OUT_MASK                GENMASK(18, 16)
+#define WRMIFX3_FMT_MODE_OUT_SHIFT               16
+#define WRMIFX3_FMT_MODE_OUT_YUV422              1
+#define WRMIFX3_FMT_MODE_OUT_YUV420              2
+#define WRMIFX3_FMT_MODE_OUT_Y_ONLY              3
+
+#define ISP_WRMIFX3_0_WIN_LUMA_H                 0xc420
+#define WRMIFX3_WIN_LUMA_HEND_MASK               GENMASK(28, 16)
+#define WRMIFX3_WIN_LUMA_HEND_SHIFT              16
+#define WRMIFX3_WIN_LUMA_HEND(x)                 ((x) - 1)
+
+#define ISP_WRMIFX3_0_WIN_LUMA_V                 0xc424
+#define WRMIFX3_WIN_LUMA_VEND_MASK               GENMASK(28, 16)
+#define WRMIFX3_WIN_LUMA_VEND_SHIFT              16
+#define WRMIFX3_WIN_LUMA_VEND(x)                 ((x) - 1)
+
+#define ISP_WRMIFX3_0_WIN_CHROM_H                0xc428
+#define WRMIFX3_WIN_CHROM_HEND_MASK              GENMASK(28, 16)
+#define WRMIFX3_WIN_CHROM_HEND_SHIFT             16
+#define WRMIFX3_WIN_CHROM_HEND(x)                (((x) >> 1) - 1)
+
+#define ISP_WRMIFX3_0_WIN_CHROM_V                0xc42c
+#define WRMIFX3_WIN_CHROM_VEND_MASK              GENMASK(28, 16)
+#define WRMIFX3_WIN_CHROM_VEND_SHIFT             16
+#define WRMIFX3_WIN_CHROM_VEND(x)                (((x) >> 1) - 1)
+
+#define ISP_WRMIFX3_0_CRP_HSIZE                  0xc48c
+#define WRMIFX3_CROP_HEND_MASK                   GENMASK(31, 16)
+#define WRMIFX3_CROP_HEND_SHIFT                  16
+#define WRMIFX3_CROP_HEND(x)                     ((x) - 1)
+
+#define ISP_WRMIFX3_0_CRP_VSIZE                  0xc490
+#define WRMIFX3_CROP_VEND_MASK                   GENMASK(31, 16)
+#define WRMIFX3_CROP_VEND_SHIFT                  16
+#define WRMIFX3_CROP_VEND(x)                     ((x) - 1)
+
+#define VIU_DMAWR_BADDR0                         0xc840
+#define VIU_DMAWR_AF_BADDR_MASK                  GENMASK(27, 0)
+/* AF base address need 16 bits alignment */
+#define VIU_DMAWR_AF_BADDR(x)                    ((x) >> 4)
+
+#define VIU_DMAWR_BADDR1                         0xc844
+#define VIU_DMAWR_AWB_BADDR_MASK                  GENMASK(27, 0)
+/* AWB base address need 16 bits alignment */
+#define VIU_DMAWR_AWB_BADDR(x)                    ((x) >> 4)
+
+#define VIU_DMAWR_BADDR2                         0xc848
+#define VIU_DMAWR_AE_BADDR_MASK                  GENMASK(27, 0)
+/* AE base address need 16 bits alignment */
+#define VIU_DMAWR_AE_BADDR(x)                    ((x) >> 4)
+
+#define VIU_DMAWR_SIZE0                          0xc854
+#define VIU_DMAWR_SIZE_AF_MASK                   GENMASK(15, 0)
+#define VIU_DMAWR_SIZE_AWB_MASK                  GENMASK(31, 16)
+#define VIU_DMAWR_SIZE_AWB_SHIFT                 16
+
+#define VIU_DMAWR_SIZE1                          0xc858
+#define VIU_DMAWR_SIZE_AE_MASK                   GENMASK(15, 0)
+
+#endif
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-resizer.c b/drivers/media/platform/amlogic/c3-isp/c3-isp-resizer.c
new file mode 100644
index 000000000000..620a9243a9cd
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-resizer.c
@@ -0,0 +1,778 @@
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
+static const struct c3_isp_mbus_format_info c3_isp_rsz_mbus_formats[] = {
+	/* YUV formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
+		.pads		= BIT(C3_ISP_RESIZER_PAD_SINK)
+				| BIT(C3_ISP_RESIZER_PAD_SOURCE),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.pads		= BIT(C3_ISP_RESIZER_PAD_SINK)
+				| BIT(C3_ISP_RESIZER_PAD_SOURCE),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.pads		= BIT(C3_ISP_RESIZER_PAD_SINK)
+				| BIT(C3_ISP_RESIZER_PAD_SOURCE),
+		.xofst		= C3_ISP_PHASE_OFFSET_NONE,
+		.yofst		= C3_ISP_PHASE_OFFSET_NONE,
+	},
+};
+
+/* The normal parameters of pps module */
+static const int pps_lut_tap4_s11[C3_PPS_TAP4_S11_H_NUM][4] =  {
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
+static const struct c3_isp_mbus_format_info
+*rsz_find_format_by_code(u32 code, u32 pad)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(c3_isp_rsz_mbus_formats); i++) {
+		const struct c3_isp_mbus_format_info *info =
+			&c3_isp_rsz_mbus_formats[i];
+
+		if (info->mbus_code == code && info->pads & BIT(pad))
+			return info;
+	}
+
+	return NULL;
+}
+
+static void c3_isp_rsz_cfg_fmt(struct c3_isp_resizer *rsz,
+			       struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, C3_ISP_RESIZER_PAD_SINK);
+
+	c3_isp_write(rsz->isp, C3_DISP_REG(ISP_DISP0_TOP_IN_SIZE, rsz->id),
+		     DISP_TOP_IN_HSIZE(fmt->width) | DISP_TOP_IN_VSIZE(fmt->height));
+}
+
+static void c3_isp_rsz_crop_enable(struct c3_isp_resizer *rsz,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_rect *crop;
+
+	crop = v4l2_subdev_state_get_crop(state, C3_ISP_RESIZER_PAD_SINK);
+
+	c3_isp_write(rsz->isp, C3_DISP_REG(DISP0_TOP_CRP2_START, rsz->id),
+		     DISP_CRP2_VSTART(crop->top) | DISP_CRP2_HSTART(crop->left));
+	c3_isp_write(rsz->isp, C3_DISP_REG(DISP0_TOP_CRP2_SIZE, rsz->id),
+		     DISP_CRP2_VSIZE(crop->height) | DISP_CRP2_HSIZE(crop->width));
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_TOP_TOP_CTRL, rsz->id),
+			   DISP_CRP2_EN, DISP_CRP2_EN);
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
+	int step_h_integer, step_v_integer;
+	int step_h_fraction, step_v_fraction;
+	int yuv444to422_en;
+
+	/* Calculate the integer part of horizonal scaler step */
+	step_h_integer = thsize / ohsize;
+
+	/* Calculate the vertical part of horizonal scaler step */
+	step_v_integer = tvsize / ovsize;
+
+	/*
+	 * Calculate the fraction part of horizonal scaler step.
+	 * step_h_fraction = (source / dest) * 2^24,
+	 * so step_h_fraction = ((source << 12) / dest) << 12.
+	 */
+	step_h_fraction = ((thsize << 12) / ohsize) << 12;
+
+	/*
+	 * Calculate the fraction part of vertical scaler step
+	 * step_v_fraction = (source / dest) * 2^24,
+	 * so step_v_fraction = ((source << 12) / dest) << 12.
+	 */
+	 step_v_fraction = ((tvsize << 12) / ovsize) << 12;
+
+	yuv444to422_en = ihsize > (max_hsize / 2) ? 1 : 0;
+
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_444TO422, rsz->id),
+			   PPS_444TO422_EN_MASK, yuv444to422_en);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_VSC_START_PHASE_STEP, rsz->id),
+			   PPS_VSC_FRACTION_PART_MASK, step_v_fraction);
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_VSC_START_PHASE_STEP, rsz->id),
+			   PPS_VSC_INTEGER_PART_MASK,
+			   step_v_integer << PPS_VSC_INTEGER_PART_SHIFT);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_HSC_START_PHASE_STEP, rsz->id),
+			   PPS_HSC_FRACTION_PART_MASK, step_h_fraction);
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_HSC_START_PHASE_STEP, rsz->id),
+			   PPS_HSC_INTEGER_PART_MASK,
+			   step_h_integer << PPS_HSC_INTEGER_PART_SHIFT);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_PRE_HSCALE_COEF_0, rsz->id),
+			   PPS_PREHSC_LUMA_COEF0_MASK,
+			   PPS_PREHSC_LUMA_COEF0_INIT);
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_PRE_HSCALE_COEF_0, rsz->id),
+			   PPS_PREHSC_LUMA_COEF1_MASK,
+			   PPS_PREHSC_LUMA_COEF1_INIT << PPS_PREHSC_LUMA_COEF1_SHIFT);
+
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_PRE_HSCALE_COEF_1, rsz->id),
+			   PPS_PREHSC_LUMA_COEF2_MASK,
+			   PPS_PREHSC_LUMA_COEF2_INIT);
+	c3_isp_update_bits(rsz->isp,
+			   C3_DISP_REG(DISP0_PPS_PRE_HSCALE_COEF_1, rsz->id),
+			   PPS_PREHSC_LUMA_COEF3_MASK,
+			   PPS_PREHSC_LUMA_COEF3_INIT << PPS_PREHSC_LUMA_COEF3_SHIFT);
+}
+
+static void c3_isp_rsz_pps_lut(struct c3_isp_resizer *rsz, u32 ctype)
+{
+	int i;
+
+	/*
+	 * Default value of this register is 0,
+	 * so only need to set SCALE_LUMA_COEF_S11_MODE
+	 * and SCALE_LUMA_CTYPE.
+	 * This register needs to be written in one time.
+	 */
+	c3_isp_write(rsz->isp, C3_DISP_REG(ISP_SCALE0_COEF_IDX_LUMA, rsz->id),
+		     SCALE_LUMA_COEF_S11_MODE | SCALE_LUMA_CTYPE(ctype));
+
+	for (i = 0; i < C3_PPS_TAP4_S11_H_NUM; i++) {
+		c3_isp_write(rsz->isp, C3_DISP_REG(ISP_SCALE0_COEF_LUMA, rsz->id),
+			     SCALE_COEF_LUMA_DATA0(pps_lut_tap4_s11[i][0]) |
+			     SCALE_COEF_LUMA_DATA1(pps_lut_tap4_s11[i][1]));
+		c3_isp_write(rsz->isp, C3_DISP_REG(ISP_SCALE0_COEF_LUMA, rsz->id),
+			     SCALE_COEF_LUMA_DATA0(pps_lut_tap4_s11[i][2]) |
+			     SCALE_COEF_LUMA_DATA1(pps_lut_tap4_s11[i][3]));
+	}
+
+	/*
+	 * Default value of this register is 0,
+	 * so only need to set SCALE_CHRO_COEF_S11_MODE
+	 * and SCALE_CHRO_CTYPE.
+	 * This register needs to be written in one time.
+	 */
+	c3_isp_write(rsz->isp, C3_DISP_REG(ISP_SCALE0_COEF_IDX_CHRO, rsz->id),
+		     SCALE_CHRO_COEF_S11_MODE | SCALE_CHRO_CTYPE(ctype));
+
+	for (i = 0; i < C3_PPS_TAP4_S11_H_NUM; i++) {
+		c3_isp_write(rsz->isp, C3_DISP_REG(ISP_SCALE0_COEF_CHRO, rsz->id),
+			     SCALE_COEF_CHRO_DATA0(pps_lut_tap4_s11[i][0]) |
+			     SCALE_COEF_CHRO_DATA1(pps_lut_tap4_s11[i][1]));
+		c3_isp_write(rsz->isp, C3_DISP_REG(ISP_SCALE0_COEF_CHRO, rsz->id),
+			     SCALE_COEF_CHRO_DATA0(pps_lut_tap4_s11[i][2]) |
+			     SCALE_COEF_CHRO_DATA1(pps_lut_tap4_s11[i][3]));
+	}
+}
+
+static void c3_isp_rsz_pps_disable(struct c3_isp_resizer *rsz)
+{
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_HSC_EN_MASK, 0);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_VSC_EN_MASK, 0);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREVSC_EN_MASK, 0);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREHSC_EN_MASK, 0);
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
+	u32 reg_prehsc_rate;
+	u32 reg_prevsc_flt_num;
+	int pre_vscale_max_hsize;
+	u32 ihsize_after_pre_hsc;
+	u32 ihsize_after_pre_hsc_alt;
+	u32 reg_vsc_tap_num_alt;
+	u32 ihsize;
+	u32 ivsize;
+	struct c3_isp_pps_io_size io_size;
+
+	crop = v4l2_subdev_state_get_crop(state, C3_ISP_RESIZER_PAD_SINK);
+	cmps = v4l2_subdev_state_get_compose(state, C3_ISP_RESIZER_PAD_SINK);
+
+	ihsize = crop->width;
+	ivsize = crop->height;
+
+	hsc_en = (ihsize == cmps->width) ? C3_SCALE_DIS : C3_SCALE_EN;
+	vsc_en = (ivsize == cmps->height) ? C3_SCALE_DIS : C3_SCALE_EN;
+
+	/* Disable pps when there no need to use pps */
+	if (!hsc_en && !vsc_en) {
+		c3_isp_rsz_pps_disable(rsz);
+		return 0;
+	}
+
+	/*
+	 * Pre-scale needs to be enable
+	 * if the down scaling factor exceeds 4.
+	 */
+	preh_en = (ihsize > cmps->width * 4) ? C3_SCALE_EN : C3_SCALE_DIS;
+	prev_en = (ivsize > cmps->height * 4) ? C3_SCALE_EN : C3_SCALE_DIS;
+
+	if (rsz->id == C3_ISP_RSZ_2) {
+		max_hsize = C3_ISP_MAX_WIDTH;
+		/*
+		 * Set vertical tap number and
+		 * the max hsize of pre-vertical scale.
+		 */
+		reg_prevsc_flt_num = 4;
+		pre_vscale_max_hsize = max_hsize / 2;
+	} else {
+		max_hsize = C3_ISP_DEFAULT_WIDTH;
+		preh_en  = (ihsize > max_hsize) ? C3_SCALE_EN : C3_SCALE_DIS;
+		/*
+		 * Set vertical tap number and
+		 * the max hsize of pre-vertical scale.
+		 */
+		if (ihsize > (max_hsize / 2) &&
+		    ihsize <= max_hsize && prev_en) {
+			reg_prevsc_flt_num = 2;
+			pre_vscale_max_hsize = max_hsize;
+		} else {
+			reg_prevsc_flt_num = 4;
+			pre_vscale_max_hsize = max_hsize / 2;
+		}
+	}
+
+	/*
+	 * Set pre-horizonal scale rate and
+	 * the hsize of after pre-horizonal scale.
+	 */
+	if (preh_en) {
+		reg_prehsc_rate = 1;
+		ihsize_after_pre_hsc = DIV_ROUND_UP(ihsize, 2);
+	} else {
+		reg_prehsc_rate = 0;
+		ihsize_after_pre_hsc = ihsize;
+	}
+
+	/* Change pre-horizonal scale rate */
+	if (prev_en && ihsize_after_pre_hsc >= pre_vscale_max_hsize)
+		reg_prehsc_rate += 1;
+
+	/* Set the actual hsize of after pre-horizonal scale */
+	if (preh_en)
+		ihsize_after_pre_hsc_alt =
+			DIV_ROUND_UP(ihsize, 1 << reg_prehsc_rate);
+	else
+		ihsize_after_pre_hsc_alt = ihsize;
+
+	/* Set vertical scaler bank length */
+	if (ihsize_after_pre_hsc_alt <= (max_hsize / 2))
+		reg_vsc_tap_num_alt = 4;
+	else if (ihsize_after_pre_hsc_alt <= max_hsize)
+		reg_vsc_tap_num_alt = prev_en ? 2 : 4;
+	else
+		reg_vsc_tap_num_alt = prev_en ? 4 : 2;
+
+	io_size.thsize = ihsize_after_pre_hsc_alt;
+	io_size.tvsize = prev_en ? DIV_ROUND_UP(ivsize, 2) : ivsize;
+	io_size.ohsize = cmps->width;
+	io_size.ovsize = cmps->height;
+	io_size.ihsize = ihsize;
+	io_size.max_hsize = max_hsize;
+
+	c3_isp_rsz_pps_size(rsz, &io_size);
+	c3_isp_rsz_pps_lut(rsz, C3_PPS_LUT_CTYPE_0);
+	c3_isp_rsz_pps_lut(rsz, C3_PPS_LUT_CTYPE_2);
+
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_VSC_TAP_NUM_MASK, reg_vsc_tap_num_alt);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_HSC_TAP_NUM_MASK,
+			   PPS_HSC_TAP_NUM_INIT << PPS_HSC_TAP_NUM_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREVSC_FLT_NUM_MASK,
+			   reg_prevsc_flt_num << PPS_PREVSC_FLT_NUM_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREHSC_FLT_NUM_MASK,
+			   PPS_PREHSC_FLT_NUM_INIT << PPS_PREHSC_FLT_NUM_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREVSC_RATE_MASK,
+			   prev_en << PPS_PREVSC_RATE_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREHSC_RATE_MASK,
+			   reg_prehsc_rate << PPS_PREHSC_RATE_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_HSC_EN_MASK, hsc_en << PPS_HSC_EN_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_VSC_EN_MASK, vsc_en << PPS_VSC_EN_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREVSC_EN_MASK, prev_en << PPS_PREVSC_EN_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_PREHSC_EN_MASK, preh_en << PPS_PREHSC_EN_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_HSC_NOR_RS_BITS_MASK,
+			   PPS_HSC_NOR_RS_BITS_INIT << PPS_HSC_NOR_RS_BITS_SHIFT);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_PPS_SCALE_EN, rsz->id),
+			   PPS_VSC_NOR_RS_BITS_MASK,
+			   PPS_VSC_NOR_RS_BITS_INIT << PPS_VSC_NOR_RS_BITS_SHIFT);
+
+	return 0;
+}
+
+void c3_isp_rsz_start(struct c3_isp_resizer *rsz)
+{
+	struct v4l2_subdev_state *state;
+
+	state = v4l2_subdev_lock_and_get_active_state(&rsz->sd);
+
+	c3_isp_rsz_cfg_fmt(rsz, state);
+	c3_isp_rsz_crop_enable(rsz, state);
+	c3_isp_rsz_pps_enable(rsz, state);
+
+	c3_isp_update_bits(rsz->isp, ISP_TOP_PATH_EN,
+			   TOP_DISP_EN(rsz->id), TOP_DISP_EN(rsz->id));
+
+	v4l2_subdev_unlock_state(state);
+}
+
+void c3_isp_rsz_stop(struct c3_isp_resizer *rsz)
+{
+	c3_isp_update_bits(rsz->isp, ISP_TOP_PATH_EN,
+			   TOP_DISP_EN(rsz->id), 0);
+	c3_isp_update_bits(rsz->isp, C3_DISP_REG(DISP0_TOP_TOP_CTRL, rsz->id),
+			   DISP_CRP2_EN, 0x0);
+
+	c3_isp_rsz_pps_disable(rsz);
+}
+
+static int c3_isp_rsz_cfg_routing(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = C3_ISP_DEFAULT_WIDTH,
+		.height = C3_ISP_DEFAULT_HEIGHT,
+		.code = C3_ISP_RSZ_DEF_PAD_FMT,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int c3_isp_rsz_init_routing(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes;
+	struct v4l2_subdev_krouting routing;
+
+	routes.sink_pad = C3_ISP_RESIZER_PAD_SINK;
+	routes.sink_stream = 0;
+	routes.source_pad = C3_ISP_RESIZER_PAD_SOURCE;
+	routes.source_stream = 0;
+	routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+
+	routing.num_routes = 1;
+	routing.routes = &routes;
+
+	return c3_isp_rsz_cfg_routing(sd, state, &routing);
+}
+
+static int c3_isp_rsz_set_routing(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  enum v4l2_subdev_format_whence which,
+				  struct v4l2_subdev_krouting *routing)
+{
+	bool is_streaming = v4l2_subdev_is_streaming(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
+		return -EBUSY;
+
+	return c3_isp_rsz_cfg_routing(sd, state, routing);
+}
+
+static int c3_isp_rsz_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(c3_isp_rsz_mbus_formats))
+		return -EINVAL;
+
+	code->code = c3_isp_rsz_mbus_formats[code->index].mbus_code;
+
+	return 0;
+}
+
+static void c3_isp_rsz_set_sink_fmt(struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	const struct c3_isp_mbus_format_info *isp_fmt;
+	struct v4l2_rect *sink_crop;
+	struct v4l2_rect *sink_cmps;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, format->pad);
+	sink_crop = v4l2_subdev_state_get_crop(state, format->pad);
+	sink_cmps = v4l2_subdev_state_get_compose(state, format->pad);
+
+	isp_fmt = rsz_find_format_by_code(format->format.code, format->pad);
+	if (!isp_fmt)
+		sink_fmt->code = C3_ISP_RSZ_DEF_PAD_FMT;
+	else
+		sink_fmt->code = format->format.code;
+
+	sink_fmt->width = clamp_t(u32, format->format.width,
+				  C3_ISP_MIN_WIDTH, C3_ISP_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, format->format.height,
+				   C3_ISP_MIN_HEIGHT, C3_ISP_MAX_HEIGHT);
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
+	format->format = *sink_fmt;
+}
+
+static void c3_isp_rsz_set_source_fmt(struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_format *format)
+{
+	const struct c3_isp_mbus_format_info *rsz_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *sink_crop;
+	struct v4l2_rect *sink_cmps;
+
+	src_fmt = v4l2_subdev_state_get_format(state, format->pad);
+	sink_cmps = v4l2_subdev_state_get_compose(state, C3_ISP_RESIZER_PAD_SINK);
+	sink_crop = v4l2_subdev_state_get_crop(state, C3_ISP_RESIZER_PAD_SINK);
+
+	rsz_fmt = rsz_find_format_by_code(format->format.code, format->pad);
+	if (!rsz_fmt)
+		src_fmt->code = C3_ISP_RSZ_DEF_PAD_FMT;
+	else
+		src_fmt->code = format->format.code;
+
+	src_fmt->width = clamp_t(u32, format->format.width,
+				 C3_ISP_MIN_WIDTH, sink_crop->width);
+	src_fmt->height = clamp_t(u32, format->format.height,
+				  C3_ISP_MIN_HEIGHT, sink_crop->height);
+
+	/* The sink compose size must be same with the source size. */
+	sink_cmps->width = src_fmt->width;
+	sink_cmps->height = src_fmt->height;
+
+	format->format = *src_fmt;
+}
+
+static int c3_isp_rsz_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_format *format)
+{
+	if (format->pad == C3_ISP_RESIZER_PAD_SINK)
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
+	if (sel->pad == C3_ISP_RESIZER_PAD_SOURCE)
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
+	struct v4l2_rect *crop;
+	struct v4l2_rect *cmps;
+
+	if (sel->pad == C3_ISP_RESIZER_PAD_SOURCE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		fmt = v4l2_subdev_state_get_format(state, sel->pad);
+		crop = v4l2_subdev_state_get_crop(state, sel->pad);
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
+		sel->r = *crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		crop = v4l2_subdev_state_get_crop(state, sel->pad);
+		cmps = v4l2_subdev_state_get_compose(state, sel->pad);
+
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = clamp(sel->r.width, C3_ISP_MIN_WIDTH, crop->width);
+		sel->r.height = clamp(sel->r.height, C3_ISP_MIN_HEIGHT, crop->height);
+
+		cmps->width = ALIGN(sel->r.width, 2);
+		cmps->height = ALIGN(sel->r.height, 2);
+		cmps->left = sel->r.left;
+		cmps->top = sel->r.top;
+
+		sel->r = *cmps;
+
+		fmt = v4l2_subdev_state_get_format(state, C3_ISP_RESIZER_PAD_SOURCE);
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
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *crop;
+	struct v4l2_rect *cmps;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, C3_ISP_RESIZER_PAD_SINK);
+	sink_fmt->width = C3_ISP_DEFAULT_WIDTH;
+	sink_fmt->height = C3_ISP_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = C3_ISP_RSZ_DEF_PAD_FMT;
+	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
+	crop = v4l2_subdev_state_get_crop(state, C3_ISP_RESIZER_PAD_SINK);
+	crop->width = C3_ISP_DEFAULT_WIDTH;
+	crop->height = C3_ISP_DEFAULT_HEIGHT;
+	crop->left = 0;
+	crop->top = 0;
+
+	cmps = v4l2_subdev_state_get_compose(state, C3_ISP_RESIZER_PAD_SINK);
+	cmps->width = C3_ISP_DEFAULT_WIDTH;
+	cmps->height = C3_ISP_DEFAULT_HEIGHT;
+	cmps->left = 0;
+	cmps->top = 0;
+
+	src_fmt = v4l2_subdev_state_get_format(state, C3_ISP_RESIZER_PAD_SOURCE);
+	*src_fmt = *sink_fmt;
+
+	return c3_isp_rsz_init_routing(sd, state);
+}
+
+static const struct v4l2_subdev_pad_ops c3_isp_rsz_pad_ops = {
+	.enum_mbus_code = c3_isp_rsz_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = c3_isp_rsz_set_fmt,
+	.get_selection = c3_isp_rsz_get_selection,
+	.set_selection = c3_isp_rsz_set_selection,
+	.set_routing = c3_isp_rsz_set_routing,
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
+	snprintf(sd->name, sizeof(sd->name), "isp-resizer%u", rsz->id);
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	sd->entity.ops = &c3_isp_rsz_entity_ops;
+
+	sd->dev = rsz->isp->dev;
+	v4l2_set_subdevdata(sd, rsz);
+
+	rsz->pads[C3_ISP_RESIZER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	rsz->pads[C3_ISP_RESIZER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, C3_ISP_RESIZER_PAD_MAX, rsz->pads);
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
+	u32 i;
+	int ret;
+
+	for (i = C3_ISP_RSZ_0; i < C3_ISP_NUM_RSZ; i++) {
+		struct c3_isp_resizer *rsz = &isp->resizers[i];
+
+		rsz->id = i;
+		rsz->isp = isp;
+
+		if (rsz->id == C3_ISP_RSZ_0)
+			rsz->cap = &isp->caps[C3_ISP_CAP_DEV_0];
+		else if (rsz->id == C3_ISP_RSZ_1)
+			rsz->cap = &isp->caps[C3_ISP_CAP_DEV_1];
+		else
+			rsz->cap = &isp->caps[C3_ISP_CAP_DEV_2];
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
+	u32 i;
+
+	for (i = C3_ISP_RSZ_0; i < C3_ISP_NUM_RSZ; i++) {
+		struct c3_isp_resizer *rsz = &isp->resizers[i];
+
+		if (rsz->isp)
+			c3_isp_rsz_unregister(rsz);
+	};
+}
diff --git a/drivers/media/platform/amlogic/c3-isp/c3-isp-stats.c b/drivers/media/platform/amlogic/c3-isp/c3-isp-stats.c
new file mode 100644
index 000000000000..394232b0b15d
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/c3-isp-stats.c
@@ -0,0 +1,491 @@
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
+#include "include/uapi/c3-isp-config.h"
+
+/* Hardware configuration */
+
+static void c3_isp_stats_af_init(struct c3_isp_stats *stats)
+{
+	c3_isp_write(stats->isp, ISP_AF_ROI0_WIN01,
+		     AF_ROI_XYWIN_00_INIT | AF_ROI_XYWIN_01_INIT);
+
+	c3_isp_write(stats->isp, ISP_AF_ROI0_WIN23,
+		     AF_ROI_XYWIN_02_INIT | AF_ROI_XYWIN_03_INIT);
+
+	c3_isp_write(stats->isp, ISP_AF_ROI1_WIN01,
+		     AF_ROI_XYWIN_10_INIT | AF_ROI_XYWIN_11_INIT);
+
+	c3_isp_write(stats->isp, ISP_AF_ROI1_WIN23,
+		     AF_ROI_XYWIN_12_INIT | AF_ROI_XYWIN_13_INIT);
+
+	/* 0: old statistics output, 1: new statistics output. */
+	c3_isp_update_bits(stats->isp, ISP_AF_EN_CTRL,
+			   AF_STAT_SELECT, 0x1 << AF_STAT_SELECT_SHIFT);
+}
+
+static void c3_isp_stats_ae_init(struct c3_isp_stats *stats)
+{
+	c3_isp_write(stats->isp, ISP_AE_ROI0_WIN01,
+		     AE_ROI_XYWIN_00_INIT | AE_ROI_XYWIN_01_INIT);
+
+	c3_isp_write(stats->isp, ISP_AE_ROI0_WIN23,
+		     AE_ROI_XYWIN_02_INIT | AE_ROI_XYWIN_03_INIT);
+
+	c3_isp_write(stats->isp, ISP_AE_ROI1_WIN01,
+		     AE_ROI_XYWIN_10_INIT | AE_ROI_XYWIN_11_INIT);
+
+	c3_isp_write(stats->isp, ISP_AE_ROI1_WIN23,
+		     AE_ROI_XYWIN_12_INIT | AE_ROI_XYWIN_13_INIT);
+
+	c3_isp_write(stats->isp, ISP_AE_STAT_THD01,
+		     AE_STAT_THRD0_INIT | AE_STAT_THRD1_INIT);
+
+	c3_isp_write(stats->isp, ISP_AE_STAT_THD23,
+		     AE_STAT_THRD2_INIT | AE_STAT_THRD3_INIT);
+
+	/* Set 0 when ae_stat_switch is not 0 */
+	c3_isp_update_bits(stats->isp, ISP_AE_CTRL,
+			   AE_CTRL_INPUT_2LINE_TOGETHER, 0);
+
+	/* Configure ae luma mode */
+	c3_isp_update_bits(stats->isp, ISP_AE_CTRL,
+			   AE_CTRL_LUMA_MODE_MASK,
+			   AE_CTRL_LUMA_MODE_FILTER << AE_CTRL_LUMA_MODE_SHIFT);
+}
+
+static void c3_isp_stats_awb_init(struct c3_isp_stats *stats)
+{
+	/* Initialize the awb statistics rectangle of image */
+	c3_isp_write(stats->isp, ISP_AWB_STAT_ROI0_WIN01,
+		     AWB_ROI_XYWIN_00_INIT | AWB_ROI_XYWIN_01_INIT);
+	c3_isp_write(stats->isp, ISP_AWB_STAT_ROI0_WIN23,
+		     AWB_ROI_XYWIN_02_INIT | AWB_ROI_XYWIN_03_INIT);
+
+	c3_isp_write(stats->isp, ISP_AWB_STAT_ROI1_WIN01,
+		     AWB_ROI_XYWIN_10_INIT | AWB_ROI_XYWIN_11_INIT);
+	c3_isp_write(stats->isp, ISP_AWB_STAT_ROI1_WIN23,
+		     AWB_ROI_XYWIN_12_INIT | AWB_ROI_XYWIN_13_INIT);
+}
+
+static void c3_isp_stats_cfg_dmawr_addr(struct c3_isp_stats *stats)
+{
+	struct c3_isp_device *isp = stats->isp;
+	struct c3_isp_stats_info *stats_info = stats->buff->vaddr;
+	u32 awb_dma_size = sizeof(stats_info->awb_stats);
+	u32 ae_dma_size = sizeof(stats_info->ae_stats);
+	u32 awb_dma_addr = stats->buff->paddr;
+	u32 af_dma_addr;
+	u32 ae_dma_addr;
+
+	ae_dma_addr = awb_dma_addr + awb_dma_size;
+	af_dma_addr = ae_dma_addr + ae_dma_size;
+
+	c3_isp_update_bits(isp, VIU_DMAWR_BADDR0,
+			   VIU_DMAWR_AF_BADDR_MASK,
+			   VIU_DMAWR_AF_BADDR(af_dma_addr));
+	c3_isp_update_bits(isp, VIU_DMAWR_BADDR1,
+			   VIU_DMAWR_AWB_BADDR_MASK,
+			   VIU_DMAWR_AWB_BADDR(awb_dma_addr));
+	c3_isp_update_bits(isp, VIU_DMAWR_BADDR2,
+			   VIU_DMAWR_AE_BADDR_MASK,
+			   VIU_DMAWR_AE_BADDR(ae_dma_addr));
+}
+
+static void c3_isp_stats_enable(struct c3_isp_stats *stats)
+{
+	c3_isp_update_bits(stats->isp, ISP_TOP_3A_STAT_CRTL,
+			   TOP_3A_AE_STAT_EN, TOP_3A_AE_STAT_EN);
+	c3_isp_update_bits(stats->isp, ISP_TOP_3A_STAT_CRTL,
+			   TOP_3A_AWB_STAT_EN, TOP_3A_AWB_STAT_EN);
+	c3_isp_update_bits(stats->isp, ISP_TOP_3A_STAT_CRTL,
+			   TOP_3A_AF_STAT_EN, TOP_3A_AF_STAT_EN);
+}
+
+static void c3_isp_stats_disable(struct c3_isp_stats *stats)
+{
+	c3_isp_update_bits(stats->isp, ISP_TOP_3A_STAT_CRTL,
+			   TOP_3A_AE_STAT_EN, 0);
+	c3_isp_update_bits(stats->isp, ISP_TOP_3A_STAT_CRTL,
+			   TOP_3A_AWB_STAT_EN, 0);
+	c3_isp_update_bits(stats->isp, ISP_TOP_3A_STAT_CRTL,
+			   TOP_3A_AF_STAT_EN, 0);
+}
+
+/* The unit of dma_size is 16 bytes */
+static void c3_isp_stats_cfg_dmawr_size(struct c3_isp_stats *stats)
+{
+	u32 dma_size;
+
+	dma_size = sizeof(struct af_stats_info) / 16;
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_SIZE0,
+			   VIU_DMAWR_SIZE_AF_MASK, dma_size);
+
+	dma_size = sizeof(struct awb_stats_info) / 16;
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_SIZE0,
+			   VIU_DMAWR_SIZE_AWB_MASK,
+			   dma_size << VIU_DMAWR_SIZE_AWB_SHIFT);
+
+	dma_size = sizeof(struct ae_stats_info) / 16;
+	c3_isp_update_bits(stats->isp, VIU_DMAWR_SIZE1,
+			   VIU_DMAWR_SIZE_AE_MASK, dma_size);
+}
+
+static void c3_isp_stats_cfg_buff(struct c3_isp_stats *stats)
+{
+	stats->buff = list_first_entry_or_null(&stats->pending,
+					       struct c3_isp_vb2_buffer, list);
+	if (stats->buff) {
+		c3_isp_stats_cfg_dmawr_addr(stats);
+		list_del(&stats->buff->list);
+	}
+}
+
+static void c3_isp_stats_start(struct c3_isp_stats *stats)
+{
+	c3_isp_stats_af_init(stats);
+	c3_isp_stats_ae_init(stats);
+	c3_isp_stats_awb_init(stats);
+
+	c3_isp_stats_cfg_dmawr_size(stats);
+	c3_isp_stats_cfg_buff(stats);
+	c3_isp_stats_enable(stats);
+
+	stats->is_streaming = true;
+}
+
+static void c3_isp_stats_stop(struct c3_isp_stats *stats)
+{
+	stats->is_streaming = false;
+
+	c3_isp_stats_disable(stats);
+}
+
+static void c3_isp_stats_return_buffers(struct c3_isp_stats *stats,
+					enum vb2_buffer_state state)
+{
+	unsigned long flags;
+	struct c3_isp_vb2_buffer *buff;
+
+	spin_lock_irqsave(&stats->buff_lock, flags);
+
+	if (stats->buff) {
+		vb2_buffer_done(&stats->buff->vb.vb2_buf, state);
+		stats->buff = NULL;
+	}
+
+	while (!list_empty(&stats->pending)) {
+		buff = list_first_entry(&stats->pending,
+					struct c3_isp_vb2_buffer, list);
+		list_del(&buff->list);
+		vb2_buffer_done(&buff->vb.vb2_buf, state);
+	}
+
+	spin_unlock_irqrestore(&stats->buff_lock, flags);
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
+	.vidioc_subscribe_event         = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
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
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] != sizeof(struct c3_isp_stats_info))
+		return -EINVAL;
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
+	struct c3_isp_vb2_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_vb2_buffer, vb);
+	struct c3_isp_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long flags;
+
+	spin_lock_irqsave(&stats->buff_lock, flags);
+
+	list_add_tail(&buf->list, &stats->pending);
+
+	spin_unlock_irqrestore(&stats->buff_lock, flags);
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
+	struct c3_isp_vb2_buffer *buf =
+			container_of(v4l2_buf, struct c3_isp_vb2_buffer, vb);
+	struct c3_isp_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+
+	buf->vaddr = vb2_plane_vaddr(vb, 0);
+	buf->paddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	memset(buf->vaddr, 0, stats->vfmt.fmt.meta.buffersize);
+
+	return 0;
+}
+
+static int c3_isp_stats_vb2_start_streaming(struct vb2_queue *q,
+					    unsigned int count)
+{
+	struct c3_isp_stats *stats = vb2_get_drv_priv(q);
+	int ret;
+
+	guard(mutex)(&stats->isp->lock);
+
+	ret = pm_runtime_resume_and_get(stats->isp->dev);
+	if (ret)
+		return ret;
+
+	ret = video_device_pipeline_start(&stats->vdev, &stats->isp->pipe);
+	if (ret) {
+		dev_err(stats->isp->dev,
+			"Failed to start stats pipeline: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	if (c3_isp_pipeline_ready(stats->isp)) {
+		ret = v4l2_subdev_enable_streams(&stats->isp->core.sd,
+						 C3_ISP_CORE_PAD_SOURCE_STATS,
+						 BIT(0));
+		if (ret)
+			goto err_pipeline_stop;
+	}
+
+	c3_isp_stats_start(stats);
+
+	return 0;
+
+err_pipeline_stop:
+	video_device_pipeline_stop(&stats->vdev);
+err_pm_put:
+	pm_runtime_put(stats->isp->dev);
+	c3_isp_stats_return_buffers(stats, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void c3_isp_stats_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct c3_isp_stats *stats = vb2_get_drv_priv(q);
+
+	guard(mutex)(&stats->isp->lock);
+
+	c3_isp_stats_stop(stats);
+	c3_isp_stats_return_buffers(stats, VB2_BUF_STATE_ERROR);
+
+	if (stats->isp->pipe.start_count == 1)
+		v4l2_subdev_disable_streams(&stats->isp->core.sd,
+					    C3_ISP_CORE_PAD_SOURCE_STATS,
+					    BIT(0));
+
+	video_device_pipeline_stop(&stats->vdev);
+	pm_runtime_put(stats->isp->dev);
+}
+
+static const struct vb2_ops isp_stats_vb2_ops = {
+	.queue_setup = c3_isp_stats_vb2_queue_setup,
+	.buf_queue = c3_isp_stats_vb2_buf_queue,
+	.buf_prepare = c3_isp_stats_vb2_buf_prepare,
+	.buf_init = c3_isp_stats_vb2_buf_init,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = c3_isp_stats_vb2_start_streaming,
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
+	snprintf(vdev->name, sizeof(vdev->name), "isp-stats");
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
+	vb2_q->buf_struct_size = sizeof(struct c3_isp_vb2_buffer);
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
+int c3_isp_stats_done(struct c3_isp_device *isp)
+{
+	struct c3_isp_stats *stats = &isp->stats;
+	struct c3_isp_vb2_buffer *buff = stats->buff;
+	unsigned long flags;
+
+	if (!stats->is_streaming)
+		return -EINVAL;
+
+	spin_lock_irqsave(&stats->buff_lock, flags);
+
+	if (buff) {
+		buff->vb.sequence = stats->isp->frm_sequence;
+		buff->vb.vb2_buf.timestamp = ktime_get();
+		buff->vb.field = V4L2_FIELD_NONE;
+		vb2_buffer_done(&buff->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	c3_isp_stats_cfg_buff(stats);
+
+	spin_unlock_irqrestore(&stats->buff_lock, flags);
+
+	return 0;
+}
diff --git a/drivers/media/platform/amlogic/c3-isp/include/uapi/c3-isp-config.h b/drivers/media/platform/amlogic/c3-isp/include/uapi/c3-isp-config.h
new file mode 100644
index 000000000000..84ff5741357a
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-isp/include/uapi/c3-isp-config.h
@@ -0,0 +1,537 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __C3_ISP_CONFIG_H__
+#define __C3_ISP_CONFIG_H__
+
+#define AF_STAT_BLKH_NUM             17
+#define AF_STAT_BLKV_NUM             15
+#define AF_STAT_BLK_NUM              (AF_STAT_BLKH_NUM * AF_STAT_BLKV_NUM)
+/* AF stats block size need to be aligned with 2 */
+#define AF_STAT_BLK_SIZE             ALIGN(AF_STAT_BLK_NUM, 2)
+#define AE_HISTOGRAM_SIZE	     1024
+#define AE_STAT_BLKH_NUM             17
+#define AE_STAT_BLKV_NUM             15
+#define AE_STAT_BLK_NUM              (AE_STAT_BLKH_NUM * AE_STAT_BLKV_NUM)
+/* AE stats block size need to be aligned with 2 */
+#define AE_STAT_BLK_SIZE             ALIGN(AE_STAT_BLK_NUM, 2)
+#define AE_BLOCK_WT_NUM              255
+#define AE_BLK_WT_DATA_NUM_OF_GROUP  8
+#define AWB_STAT_BLKH_NUM            32
+#define AWB_STAT_BLKV_NUM            24
+#define AWB_STAT_BLK_NUM             (AWB_STAT_BLKH_NUM * AWB_STAT_BLKV_NUM)
+/* AWB stats block size need to be aligned with 2 */
+#define AWB_STAT_BLK_SIZE            ALIGN(AWB_STAT_BLK_NUM, 2)
+#define AWB_BLOCK_WT_NUM             768
+#define AWB_BLK_WT_DATA_NUM_OF_GROUP 8
+#define AWB_STAT_BLC20_NUM           4
+#define AWB_STAT_GAIN10_NUM          4
+#define BLC_OFFSET_NUM               5
+#define GAMMA_LUT_GROUP_NUM          4
+#define GAMMA_LUT_POINT_NUM          129
+#define GAMMA_LUT_DATA_NUM_OF_GROUP  2
+
+/**
+ * struct awb_zone_stats - AWB statistics of a block
+ *
+ * AWB zone stats is aligned with 8 bytes
+ *
+ * @rg: the ratio of R / G in a zone
+ * @bg: the ratio of B / G in a zone
+ * @pixel_sum: the total number of pixels used in a zone
+ */
+struct awb_zone_stats {
+	u16 rg;
+	u16 bg;
+	u32 pixel_sum;
+};
+
+/**
+ * struct awb_stats_info - Auto white balance statistics information.
+ *
+ * AWB statistical information of all blocks.
+ *
+ * @awb_stats: array of auto white balance statistics
+ */
+struct awb_stats_info {
+	struct awb_zone_stats awb_stats[AWB_STAT_BLK_SIZE];
+};
+
+/**
+ * struct ae_zone_stats - AE statistics of a block
+ *
+ * AE zone stats is aligned with 8 bytes.
+ * This is a 5-bin histogram and the total sum is
+ * normalized to 0xffff.
+ * So hist2 = 0xffff - (hist0 + hist1 + hist3 + hist4)
+ *
+ * @hist0: the global normalized pixel count for bin 0
+ * @hist1: the global normalized pixel count for bin 1
+ * @hist3: the global normalized pixel count for bin 3
+ * @hist4: the global normalized pixel count for bin 4
+ */
+struct ae_zone_stats {
+	u16 hist0;
+	u16 hist1;
+	u16 hist3;
+	u16 hist4;
+};
+
+/**
+ * struct ae_stats_info - Exposure statistics information
+ *
+ * AE statistical information consists of
+ * all blocks information and a 1024-bin histogram.
+ *
+ * @ae_stats: array of auto exposure block statistics
+ * @hist: a 1024-bin histogram for the entire image
+ */
+struct ae_stats_info {
+	struct ae_zone_stats ae_stats[AE_STAT_BLK_SIZE];
+	u32 hist[AE_HISTOGRAM_SIZE];
+};
+
+/**
+ * struct af_zone_stats - AF statistics of a block
+ *
+ * AF block stats is aligned with 8 bytes.
+ * The zonal accumulated contrast metrics are stored
+ * in floating point format with 16 bits mantissa and
+ * 5 or 6 bits exponent.
+ * Apart from contrast metrics we accumulate squared image and
+ * quartic image data over the zone.
+ *
+ * @i2_mat: the mantissa of zonal squared image pixel sum
+ * @i4_mat: the mantissa of zonal quartic image pixel sum
+ * @e4_mat: the mantissa of zonal multi-directional quartic edge sum
+ * @i2_exp: the exponent of zonal squared image pixel sum
+ * @i4_exp: the exponent of zonal quartic image pixel sum
+ * @e4_exp: the exponent of zonal multi-directional quartic edge sum
+ */
+struct af_zone_stats {
+	u16 i2_mat;
+	u16 i4_mat;
+	u16 e4_mat;
+	u16 i2_exp: 5;
+	u16 i4_exp: 6;
+	u16 e4_exp: 5;
+};
+
+/**
+ * struct af_stats_info - Auto Focus statistics information
+ *
+ * AF statistical information of each block
+ *
+ * @af_stats: array of auto focus block statistics
+ */
+struct af_stats_info {
+	struct af_zone_stats af_stats[AF_STAT_BLK_SIZE];
+};
+
+/**
+ * struct c3_isp_stats_info - V4L2_META_FMT_C3ISP_STATS
+ *
+ * Contains ISP statistics
+ *
+ * @awb_stats: auto white balance stats
+ * @ae_stats: auto exposure stats
+ * @af_stats: auto focus stats
+ */
+struct c3_isp_stats_info {
+	struct awb_stats_info awb_stats;
+	struct ae_stats_info ae_stats;
+	struct af_stats_info af_stats;
+};
+
+/**
+ * enum c3_isp_param_buffer_version -  C3 ISP parameters block versioning
+ *
+ * @C3_ISP_PARAM_BUFFER_V0: First version of C3 ISP parameters block
+ */
+enum c3_isp_param_buffer_version {
+	C3_ISP_PARAM_BUFFER_V0,
+};
+
+/**
+ * enum c3_isp_param_block_type - Enumeration of C3 ISP parameter blocks
+ *
+ * Each block configures a specific processing block of the C3 ISP.
+ * The block type allows the driver to correctly interpret
+ * the parameters block data.
+ *
+ * @C3_ISP_PARAM_BLOCK_WB_CHANGE: White balance change parameters
+ * @C3_ISP_PARAM_BLOCK_WB_LUMA: White balance Luma-based parameters
+ * @C3_ISP_PARAM_BLOCK_WB_TRIANGLE: White balance triangle parameters
+ * @C3_ISP_PARAM_BLOCK_AWB_STATS: AWB statistics parameters
+ * @C3_ISP_PARAM_BLOCK_AE_STATS: AE statistics parameters
+ * @C3_ISP_PARAM_BLOCK_AF_STATS: AF statistics parameters
+ * @C3_ISP_PARAM_BLOCK_PST_GAMMA: post gamma parameters
+ * @C3_ISP_PARAM_BLOCK_DMSC: demosaic parameters
+ * @C3_ISP_PARAM_BLOCK_CCM: Color correction matrix parameters
+ * @C3_ISP_PARAM_BLOCK_CSC: Color space conversion parameters
+ * @C3_ISP_PARAM_BLOCK_BLC: Black level correction parameters
+ * @C3_ISP_PARAM_BLOCK_SENTINEL: First non-valid block index
+ */
+enum c3_isp_param_block_type {
+	C3_ISP_PARAM_BLOCK_WB_CHANGE,
+	C3_ISP_PARAM_BLOCK_WB_LUMA,
+	C3_ISP_PARAM_BLOCK_WB_TRIANGLE,
+	C3_ISP_PARAM_BLOCK_AWB_STATS,
+	C3_ISP_PARAM_BLOCK_AE_STATS,
+	C3_ISP_PARAM_BLOCK_AF_STATS,
+	C3_ISP_PARAM_BLOCK_PST_GAMMA,
+	C3_ISP_PARAM_BLOCK_DMSC,
+	C3_ISP_PARAM_BLOCK_CCM,
+	C3_ISP_PARAM_BLOCK_CSC,
+	C3_ISP_PARAM_BLOCK_BLC,
+	C3_ISP_PARAM_BLOCK_SENTINEL
+};
+
+/**
+ * struct c3_isp_param_block_header - C3 ISP parameter block header
+ *
+ * This structure represents the common part of all the ISP configuration
+ * blocks. Each parameters block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration data. The
+ * driver inspects this common header to discern the block type and its size and
+ * properly handle the block content by casting it to the correct block-specific
+ * type.
+ *
+ * @type: The parameters block type (enum c3_isp_param_block_type)
+ * @enabled: Block enabled/disabled flag
+ * @size: Size (in bytes) of parameters block
+ */
+
+struct c3_isp_param_block_header {
+	enum c3_isp_param_block_type type;
+	bool enabled;
+	size_t size;
+};
+
+/**
+ * struct wb_change_cfg - White Balance configuration
+ *
+ * @header: The C3 ISP parameters block header
+ * @wb_gain: white balance gain of each color
+ *	wb_gain[0]: Gr gain, range 0~0xfff
+ *	wb_gain[1]: R gain, range 0~0xfff
+ *	wb_gain[2]: B gain, range 0~0xfff
+ *	wb_gain[3]: Gb gain, range 0~0xfff
+ *	wb_gain[4]: Ir gain, range 0~0xfff
+ * @wb_limit: white balance limit of each color
+ *	wb_limit[0]: Gr limit, 16 bits float
+ *	wb_limit[1]: R limit, 16 bits float
+ *	wb_limit[2]: B limit, 16 bits float
+ *	wb_limit[3]: Gb limit, 16 bits float
+ *	wb_limit[4]: Ir limit, 16 bits float
+ * @ae_gain_grbgi: Gain of each color before blending to luma
+ *	ae_gain_grbgi[0]: Gr gain, range 0~255
+ *	ae_gain_grbgi[1]: R gain, range 0~255
+ *	ae_gain_grbgi[2]: B gain, range 0~255
+ *	ae_gain_grbgi[3]: Gb gain, range 0~255
+ *	ae_gain_grbgi[4]: Ir gain, range 0~255
+ * @ae_bl12_grbgi: Offset of each color before ae_gain_grbgi
+ *	ae_bl12_grbgi[0]: Gr offset, range 0~4095
+ *	ae_bl12_grbgi[1]: R offset, range 0~4095
+ *	ae_bl12_grbgi[2]: B offset, range 0~4095
+ *	ae_bl12_grbgi[3]: Gb offset, range 0~4095
+ *	ae_bl12_grbgi[4]: Ir offset, range 0~4095
+ */
+struct wb_change_cfg {
+	struct c3_isp_param_block_header header;
+	u32 wb_gain[5];
+	u32 wb_limit[5];
+	u32 ae_gain_grbgi[5];
+	u32 ae_bl12_grbgi[5];
+};
+
+/**
+ * struct wb_luma_cfg - White Balance Luma-based configuration
+ *
+ * @header: The C3 ISP parameters block header
+ * @awb_stat_blc20: BLC in AWB statistic
+ *	awb_stat_blc20[0]: Gr blc, range 0~0xfffff
+ *	awb_stat_blc20[1]: R blc, range 0~0xfffff
+ *	awb_stat_blc20[2]: B blc, range 0~0xfffff
+ *	awb_stat_blc20[3]: Gb blc, range 0~0xfffff
+ * @awb_stat_gain10: Gain in AWB statistic
+ *	awb_stat_gain10[0]: Gr gain, range 0~1023
+ *	awb_stat_gain10[1]: R gain, range 0~1023
+ *	awb_stat_gain10[2]: B gain, range 0~1023
+ *	awb_stat_gain10[3]: Gb gain, range 0~1023
+ * @awb_stat_satur_low: AWB statistic under-saturation threshold
+ *	value: range 0~65535
+ * @awb_stat_satur_high: AWB statistic over-saturation threshold
+ *	value: range 0~65535
+ */
+struct wb_luma_cfg {
+	struct c3_isp_param_block_header header;
+	u32 awb_stat_blc20[AWB_STAT_BLC20_NUM];
+	u32 awb_stat_gain10[AWB_STAT_GAIN10_NUM];
+	u32 awb_stat_satur_low;
+	u32 awb_stat_satur_high;
+};
+
+/**
+ * struct wb_triangle_cfg - White Balance Triangle
+ *
+ * @header: The C3 ISP parameters block header
+ * @awb_stat_satur_vald: AWB statistic over saturation control
+ *	value: 0: disable, 1: enable
+ * @awb_stat_rg_min: min value of r/g
+ *	value: 0~4095
+ * @awb_stat_rg_max: max value of r/g
+ *	value: 0~4095
+ * @awb_stat_bg_min: min value of b/g
+ *	value: 0~4095
+ * @awb_stat_bg_max: max value of b/g
+ *	value: 0~4095
+ * @awb_stat_rg_low: low value of r/g
+ *	value: 0~4095
+ * @awb_stat_rg_high: high value of r/g
+ *	value: 0~4095
+ * @awb_stat_bg_low: low value of b/g
+ *	value: 0~4095
+ * @awb_stat_bg_high: high value of b/g
+ *	value: 0~4095
+ */
+struct wb_triangle_cfg {
+	struct c3_isp_param_block_header header;
+	u32 awb_stat_satur_vald;
+	u32 awb_stat_rg_min;
+	u32 awb_stat_rg_max;
+	u32 awb_stat_bg_min;
+	u32 awb_stat_bg_max;
+	u32 awb_stat_rg_low;
+	u32 awb_stat_rg_high;
+	u32 awb_stat_bg_low;
+	u32 awb_stat_bg_high;
+};
+
+/**
+ * struct awb_stats_cfg - AWB statistics configuration
+ *
+ * This structure contains AWB statistics control information.
+ *
+ * @header: The C3 ISP parameters block header
+ * @awb_stat_switch: the switch of AWB statistics
+ *	value: 0~7
+ * @awb_stat_blk_weight: Array of weights for AWB statistics blocks
+ *	value: 0~15
+ */
+struct awb_stats_cfg {
+	struct c3_isp_param_block_header header;
+	u8 awb_stat_switch;
+	u32 awb_stat_blk_weight[AWB_BLOCK_WT_NUM];
+};
+
+/**
+ * struct ae_stats_cfg - AE statistics configuration
+ *
+ * This structure contains AE statistics control information.
+ *
+ * @header: The C3 ISP parameters block header
+ * @ae_stat_switch: the switch of AE statistics
+ *	value: 0~3
+ * @ae_stat_blk_weight: Array of weights for AE statistics blocks
+ *	value: 0~15
+ */
+struct ae_stats_cfg {
+	struct c3_isp_param_block_header header;
+	u8 ae_stat_switch;
+	u32 ae_stat_blk_weight[AE_BLOCK_WT_NUM];
+};
+
+/**
+ * struct af_stats_cfg - AF statistics configuration
+ *
+ * This structure contains AF statistics control information.
+ *
+ * @header: The C3 ISP parameters block header
+ * @af_stat_switch: the switch of AF statistics
+ *	value: 0~3
+ */
+struct af_stats_cfg {
+	struct c3_isp_param_block_header header;
+	u8 af_stat_switch;
+};
+
+/**
+ * struct pst_gamma_cfg - Post gamma configuration
+ *
+ * This structure contains post gamma parameters
+ *
+ * @header: The C3 ISP parameters block header
+ * @pst_gamma_lut: LUT for P-Stitch gamma
+ *	value: 0~65535
+ */
+struct pst_gamma_cfg {
+	struct c3_isp_param_block_header header;
+	u32 pst_gamma_lut[GAMMA_LUT_GROUP_NUM][GAMMA_LUT_POINT_NUM];
+};
+
+/**
+ * struct dmsc_cfg - Demosaic configuration
+ *
+ * This structure contains demosaic parameters
+ *
+ * @header: The C3 ISP parameters block header
+ */
+struct dmsc_cfg {
+	struct c3_isp_param_block_header header;
+};
+
+/**
+ * struct ccm_cfg - ISP CCM configuration
+ *
+ * This structure holds the parameters for configuring the CCM,
+ * which is used for color correction.
+ *
+ * @header: The C3 ISP parameters block header
+ * @ccm_4x3matrix: A 3x4 matrix used for color correction
+ *	value: 0~8191
+ */
+struct ccm_cfg {
+	struct c3_isp_param_block_header header;
+	u32 ccm_4x3matrix[3][4];
+};
+
+/**
+ * struct csc_cfg - ISP Color Space Conversion configuration
+ *
+ * This structure contains settings for color space conversion.
+ *
+ * @header: The C3 ISP parameters block header
+ * @cm0_offset_inp: Input offset values for the 0-order color matrix
+ *	value: 0~8191
+ * @cm0_offset_oup: Output offset values for the 0-order color matrix
+ *	value: 0~8191
+ * @cm0_3x3mtrx_rs: matrix right shift for cm0
+ *	value: 0~3
+ * @cm0_3x3matrix: A 3x3 matrix used for the color matrix
+ *	value: 0~8191
+ */
+struct csc_cfg {
+	struct c3_isp_param_block_header header;
+	u32 cm0_offset_inp[3];
+	u32 cm0_offset_oup[3];
+	u32 cm0_3x3mtrx_rs;
+	u32 cm0_3x3matrix[3][3];
+};
+
+/**
+ * struct blc_cfg - ISP Black Level Correction (BLC) configuration
+ *
+ * This structure holds the parameters for BLC in image processing.
+ *
+ * @header: The C3 ISP parameters block header
+ * @fe_bl_ofst: Array of front-end BLC offsets for each color each channels
+ *	fe_bl_ofst[0]: Gr blc offset, range 0~0x1fffff
+ *	fe_bl_ofst[1]: R blc offset, range 0~0x1fffff
+ *	fe_bl_ofst[2]: B blc offset, range 0~0x1fffff
+ *	fe_bl_ofst[3]: Gb blc offset, range 0~0x1fffff
+ *	fe_bl_ofst[4]: Ir blc offset, range 0~0x1fffff
+ * @blc_ofst: Array of LSWB BLC offsets
+ *	blc_ofst[0]: Gr blc offset, 16 bits float
+ *	blc_ofst[1]: R blc offset, 16 bits float
+ *	blc_ofst[2]: B blc offset, 16 bits float
+ *	blc_ofst[3]: Gb blc offset, 16 bits float
+ *	blc_ofst[4]: Ir blc offset, 16 bits float
+ */
+struct blc_cfg {
+	struct c3_isp_param_block_header header;
+	u32 fe_bl_ofst[BLC_OFFSET_NUM];
+	u32 blc_ofst[BLC_OFFSET_NUM];
+};
+
+/**
+ * define C3_ISP_PARAMS_MAX_SIZE - Maximum size of all C3 ISP Parameters
+ *
+ * Though the parameters for the C3 ISP are passed as optional blocks, the
+ * driver still needs to know the absolute maximum size so that it can allocate
+ * a buffer sized appropriately to accommodate userspace attempting to set all
+ * possible parameters in a single frame.
+ */
+#define C3_ISP_PARAMS_MAX_SIZE                 \
+	(sizeof(struct wb_change_cfg) +        \
+	sizeof(struct wb_luma_cfg)   +         \
+	sizeof(struct wb_triangle_cfg) +       \
+	sizeof(struct awb_stats_cfg) +          \
+	sizeof(struct ae_stats_cfg) +           \
+	sizeof(struct af_stats_cfg) +           \
+	sizeof(struct pst_gamma_cfg) +         \
+	sizeof(struct dmsc_cfg) +              \
+	sizeof(struct ccm_cfg) +               \
+	sizeof(struct csc_cfg) +               \
+	sizeof(struct blc_cfg))
+
+/**
+ * struct c3_isp_params_buffer - C3 ISP configuration parameters
+ *
+ * This struct contains the configuration parameters of the C3 ISP
+ * algorithms, serialized by userspace into an opaque data buffer. Each
+ * configuration parameter block is represented by a block-specific structure
+ * which contains a :c:type:`c3_isp_param_block_header` entry as first
+ * member. Userspace populates the @data buffer with configuration parameters
+ * for the blocks that it intends to configure. As a consequence, the data
+ * buffer effective size changes according to the number of ISP blocks that
+ * userspace intends to configure.
+ *
+ * The parameters buffer is versioned by the @version field to allow modifying
+ * and extending its definition. Userspace should populate the @version field to
+ * inform the driver about the version it intends to use. The driver will parse
+ * and handle the @data buffer according to the data layout specific to the
+ * indicated revision and return an error if the desired revision is not
+ * supported.
+ *
+ * For each ISP block that userspace wants to configure, a block-specific
+ * structure is appended to the @data buffer, one after the other without gaps
+ * in between nor overlaps. Userspace shall populate the @total_size field with
+ * the effective size, in bytes, of the @data buffer.
+ *
+ * The expected memory layout of the parameters buffer is::
+ *
+ *	+-------------------- struct c3_isp_params_buffer ------------------+
+ *	| version = C3_ISP_PARAM_BUFFER_V0;                                   |
+ *	| total_size = sizeof(sizeof(struct wb_change_cfg))                   |
+ *	|              sizeof(sizeof(struct wb_luma_cfg));                    |
+ *	| +------------------------- data  ---------------------------------+ |
+ *	| | +------------------ struct wb_change_cfg) --------------------+ | |
+ *	| | | +---------  struct c3_isp_param_block_header header  -----+ | | |
+ *	| | | | type = C3_ISP_PARAM_BLOCK_WB_CHANGE;                    | | | |
+ *	| | | | enabled = true;                                            | | | |
+ *	| | | | size =                                                  | | | |
+ *	| | | |    sizeof(struct c3_isp_param_block_header header);     | | | |
+ *	| | | +---------------------------------------------------------+ | | |
+ *	| | | wb_gain[5] = ...;                                           | | |
+ *	| | | wb_limit[5] = ...;                                          | | |
+ *	| | | ae_gain_grbgi[5] = ...;                                     | | |
+ *	| | | ae_bl12_grbgi[5] = ...;                                     | | |
+ *	| | +------------------ struct wb_luma_cfg -----------------------+ | |
+ *	| | | +---------- struct c3_isp_param_block_header header ------+ | | |
+ *	| | | | type = C3_ISP_PARAM_BLOCK_WB_LUMA;                      | | | |
+ *	| | | | enabled = true;                                            | | | |
+ *	| | | | size = sizeof(struct wb_luma_cfg);                      | | | |
+ *	| | | +---------------------------------------------------------+ | | |
+ *	| | | awb_stat_blc20[4] = ...;                                    | | |
+ *	| | | awb_stat_gain10[4] = ...;                                   | | |
+ *	| | | awb_stat_satur_low = ...;                                   | | |
+ *	| | | awb_stat_satur_high = ...;                                  | | |
+ *	| | +-------------------------------------------------------------+ | |
+ *	| +-----------------------------------------------------------------+ |
+ *	+---------------------------------------------------------------------+
+ *
+ * @version: The C3 ISP parameters buffer version
+ * @total_size: The C3 ISP configuration data effective size,
+ *		excluding this header
+ * @data: The C3 ISP configuration blocks data
+ */
+struct c3_isp_params_buffer {
+	enum c3_isp_param_buffer_version version;
+	size_t total_size;
+	u8 data[C3_ISP_PARAMS_MAX_SIZE];
+};
+
+#endif

-- 
2.45.2



