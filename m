Return-Path: <linux-media+bounces-40073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1941B2986E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD3A20481D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB8326D4DA;
	Mon, 18 Aug 2025 04:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Bt+qW+Qg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094A2652AC
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491913; cv=none; b=El0/b+z5sFl3mVnAdvTaS1eN/i5rwMOgtcGSqwAmDnCMtIOqc67GNa/UisF3bNpCIdUt/G5Fjs6khx9RPpFPJmJ0Viw0DgXtnUn0AwdkAt5rS2VmcWb3UEKn0zT8xX/7S2wtE1l6wMLVmcvhFasp+k4hdVTH48gWJoYl7p70tMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491913; c=relaxed/simple;
	bh=Afp169Mw9Thiw/jTfY4bKaRVPZnfRNrh2rTN03/+nOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=I8Fmx8zbrukXZRvWUgQiihSiu6J5qxyF05g8dwDQEJU02AtOce9atF2sOt6lOxMoafv+Yr3yvfyQ1ifJxCFJKmEK39Ov7nbusKLaft+BORdb5ogZZnwtZGTjf16/bC/XGAZUotOI0HT8ZWT0bPI3GfjMHH6u5+N50vXXTXaQQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Bt+qW+Qg; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818043826epoutp04bbd12726fa6140ec460cab27db11597b~cwpab_PMf2925129251epoutp04D
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818043826epoutp04bbd12726fa6140ec460cab27db11597b~cwpab_PMf2925129251epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491906;
	bh=mHe6rdzE7HSfy2fVUdqaVawVkv8jtLYJBKjeNPO7sHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bt+qW+Qg89PjyOOB5EXjzbVFxdjcRRq98pwRGSv4pErjgRvx8j6slein1TRg5RzUK
	 5NWzIfrzQIzB6+CS31nybxh++qElN3TuvOZVJOTWU53U/MFxsQKQT+6O/0vzwYNOYE
	 /yZtzE0M1YcsqpT7QZkYazLpb9exzSH+F/lOxMH4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043824epcas5p4957c0934bca4ddfc7c4aa7a95d0bbfc5~cwpYhTXVP2156321563epcas5p4o;
	Mon, 18 Aug 2025 04:38:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50Mg5Gk7z6B9mK; Mon, 18 Aug
	2025 04:38:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1~bp4OIZ_Uc1324813248epcas5p1-;
	Thu, 14 Aug 2025 14:11:03 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141058epsmtip27fc64b097a08fb133f27985964aeaf16~bp4KKtC_91850318503epsmtip2T;
	Thu, 14 Aug 2025 14:10:58 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
Date: Thu, 14 Aug 2025 19:39:43 +0530
Message-ID: <20250814140943.22531-13-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1@epcas5p1.samsung.com>

FSD CSIS IP bundles DMA engine for receiving frames from MIPI-CSI2 bus.
Add support internal DMA controller to capture the frames.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 MAINTAINERS                                   |    8 +
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../media/platform/samsung/fsd-csis/Kconfig   |   18 +
 .../media/platform/samsung/fsd-csis/Makefile  |    3 +
 .../platform/samsung/fsd-csis/fsd-csis.c      | 1709 +++++++++++++++++
 6 files changed, 1740 insertions(+)
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Kconfig
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Makefile
 create mode 100644 drivers/media/platform/samsung/fsd-csis/fsd-csis.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd62ad58a47f..1e17fb0581d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3334,6 +3334,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
 F:	drivers/media/platform/samsung/s5p-mfc/
 
+ARM/SAMSUNG FSD BRIDGE DRIVER
+M:	Inbaraj E <inbaraj.e@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
+F:	drivers/media/platform/samsung/fsd-csis/fsd-csis.c
+
 ARM/SOCFPGA ARCHITECTURE
 M:	Dinh Nguyen <dinguyen@kernel.org>
 S:	Maintained
diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 0e34c5fc1dfc..4cebe2ae24a3 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -4,6 +4,7 @@ comment "Samsung media platform drivers"
 
 source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
 source "drivers/media/platform/samsung/exynos4-is/Kconfig"
+source "drivers/media/platform/samsung/fsd-csis/Kconfig"
 source "drivers/media/platform/samsung/s3c-camif/Kconfig"
 source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
 source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
index 21fea3330e4b..fde1b9626713 100644
--- a/drivers/media/platform/samsung/Makefile
+++ b/drivers/media/platform/samsung/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += exynos-gsc/
 obj-y += exynos4-is/
+obj-y += fsd-csis/
 obj-y += s3c-camif/
 obj-y += s5p-g2d/
 obj-y += s5p-jpeg/
diff --git a/drivers/media/platform/samsung/fsd-csis/Kconfig b/drivers/media/platform/samsung/fsd-csis/Kconfig
new file mode 100644
index 000000000000..99803e924682
--- /dev/null
+++ b/drivers/media/platform/samsung/fsd-csis/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# FSD MIPI CSI-2 Rx controller configurations
+
+config VIDEO_FSD_CSIS
+	tristate "FSD SoC MIPI-CSI2 media controller driver"
+	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
+	depends on HAS_DMA
+	depends on OF
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  This is a video4linux2 driver for FSD SoC MIPI-CSI2 Rx.
+	  The driver provides interface for capturing frames.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called fsd-csis.
+
diff --git a/drivers/media/platform/samsung/fsd-csis/Makefile b/drivers/media/platform/samsung/fsd-csis/Makefile
new file mode 100644
index 000000000000..eba8c0c6a7cc
--- /dev/null
+++ b/drivers/media/platform/samsung/fsd-csis/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_VIDEO_FSD_CSIS) += fsd-csis.o
diff --git a/drivers/media/platform/samsung/fsd-csis/fsd-csis.c b/drivers/media/platform/samsung/fsd-csis/fsd-csis.c
new file mode 100644
index 000000000000..74f46038d506
--- /dev/null
+++ b/drivers/media/platform/samsung/fsd-csis/fsd-csis.c
@@ -0,0 +1,1709 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ *
+ * FSD CSIS V4L2 Capture driver for FSD SoC.
+ */
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-mc.h>
+
+#define FSD_CSIS_DMA_COHERENT_MASK_SIZE		32
+#define FSD_CSIS_NB_MIN_CH			2
+#define FSD_CSIS_NB_VC				4
+#define FSD_CSIS_MEDIA_NUM_PADS			2
+#define FSD_CSIS_NB_DMA_OUT_CH			8
+#define FSD_CSIS_MAX_VC				4
+#define FSD_CSIS_NB_CLOCK			2
+#define FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS	2
+#define FSD_CSIS_DMA_LINE_ALIGN_SIZE		128
+#define FSD_CSIS_DMA_CH_OFFSET			0x100
+
+/**
+ * (Interrupt Source & mask register 1)
+ */
+#define FSD_CSIS_DMA_OTF_OVERLAP_MASK	GENMASK(17, 14)
+#define FSD_CSIS_DMA_ABORT_DONE_MASK	BIT(13)
+#define FSD_CSIS_DMA_ERROR_MASK		BIT(12)
+#define FSD_CSIS_INT_SRC1_ERR_ALL_MASK	(FSD_CSIS_DMA_ERROR_MASK | \
+					FSD_CSIS_DMA_ABORT_DONE_MASK | \
+					FSD_CSIS_DMA_ERROR_MASK)
+#define FDS_CSIS_DMA_FRM_END_MASK	GENMASK(11, 8)
+#define FSD_CSIS_DMA_FRM_START_MASK	GENMASK(7, 4)
+#define FSD_CSIS_LINE_END_MASK		GENMASK(3, 0)
+#define FSD_CSIS_DMA_CH0_MASK		0x4111U
+
+/* DMA Reg offsets */
+#define FSD_CSIS_DMA0_CTRL	0x0
+#define FSD_CSIS_DMA_CTRL(vc)	(FSD_CSIS_DMA0_CTRL + (vc) * FSD_CSIS_DMA_CH_OFFSET)
+#define FSD_CSIS_DMA_DISABLE	BIT(0)
+
+#define FSD_CSIS_DMA0_FMT	0x4
+#define FSD_CSIS_DMA_FMT(vc)	(FSD_CSIS_DMA0_FMT + (vc) * FSD_CSIS_DMA_CH_OFFSET)
+#define FSD_CSIS_DMA_DIM	BIT(15)
+#define FSD_CSIS_DMA_DUMP	BIT(13)
+
+#define FSD_CSIS_DMA0_ADDR1     0x10
+#define FSD_CSIS_DMA_ADDR1(vc)	(FSD_CSIS_DMA0_ADDR1 + (vc) * FSD_CSIS_DMA_CH_OFFSET)
+
+#define FSD_CSIS_DMA0_ACT_CTRL		0x30
+#define FSD_CSIS_DMA_ACT_CTRL(vc)	(FSD_CSIS_DMA0_ACT_CTRL + (vc) * FSD_CSIS_DMA_CH_OFFSET)
+#define FSD_CSIS_ACTIVE_DMA_PACK_MASK		GENMASK(17, 16)
+#define FSD_CSIS_ACTIVE_DMA_PACK(n)		((n) << 16)
+#define FSD_CSIS_ACTIVE_DMA_FRAMEPTR_MASK	GENMASK(4, 2)
+
+#define FSD_CSIS_DMA_ERR_CODE		0x404
+#define FSD_CSIS_DMAFIFO_FULL_MASK	BIT_MASK(5)
+#define FSD_CSIS_TRXFIFO_FULL_MASK	BIT_MASK(4)
+
+#define FSD_CSIS_DMA_CLK_CTRL			0x408
+#define FSD_CSIS_DMA_CLK_GATE_TRAIL_MASK	GENMASK(4, 1)
+#define FSD_CSIS_DMA_CLK_GATE_TRAIL(n)		((n) << 1)
+#define FSD_CSIS_DMA_CLK_GATE_EN		BIT(0)
+
+enum CSIS_DMA_PACK {
+	DMA_PACK_NORMAL,
+	DMA_PACK_10,
+	DMA_PACK_12,
+	DMA_PACK_14,
+	DMA_PACK_18,
+	DMA_PACK_20,
+};
+
+static const char * const fsd_csis_clk_id[] = {
+	"aclk",
+	"pclk",
+};
+
+struct fsd_csis_pixfmt {
+	u32 fourcc;
+	const u32 *codes;
+	int bpp;
+	bool is_yuv;
+};
+
+struct fsd_csis_vb2_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	const struct fsd_csis_pixfmt *fmt;
+	unsigned long sequence_num;
+};
+
+struct fsd_csis {
+	struct device *dev;
+	const struct fsd_csis_info *info;
+	struct clk_bulk_data *clks;
+	struct clk *pll;
+	struct media_device mdev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_async_notifier notifier;
+	struct media_pipeline pipe;
+
+	/* source node */
+	struct {
+		struct v4l2_subdev *subdev;
+		struct media_pad *pad;
+	} source;
+
+	/* Internal subdev */
+	struct {
+		struct v4l2_subdev sd;
+		struct media_pad pad[FSD_CSIS_MEDIA_NUM_PADS];
+	} subdev;
+
+	struct video_device *vdev;
+	struct media_pad vdev_pad;
+	struct vb2_queue q;
+	struct mutex vdev_mutex;
+	struct mutex mutex_csis_dma_reg;
+	spinlock_t lock_buf;
+	void __iomem *dma_base;
+	int irq;
+	u64 frame_addr[FSD_CSIS_NB_DMA_OUT_CH];
+	struct fsd_csis_vb2_buffer *frame[FSD_CSIS_NB_DMA_OUT_CH];
+	struct v4l2_pix_format vdev_fmt;
+	const struct fsd_csis_pixfmt *vdev_cc;
+	struct v4l2_rect vdev_compose;
+	u32 num_reqbufs;
+	u8 prev_dma_ptr;
+	u8 current_dma_ptr;
+	u8 number_of_ready_bufs;
+	u32 prev_frame_counter;
+	u32 current_frame_counter;
+	unsigned int num_active_fmt;
+	struct list_head ready_q;
+	spinlock_t q_lock;
+	unsigned int current_vc;
+	unsigned long sequence;
+	u32 dma_error;
+	struct mutex mutex;
+	int is_streaming;
+};
+
+static inline u32 get_bits(u32 value, u32 mask)
+{
+	return (((value) & (mask)) >> (ffs(mask) - 1));
+}
+
+static inline u32 bytes_per_line(u32 width, int bpp)
+{
+	return (ALIGN((width * bpp), FSD_CSIS_DMA_LINE_ALIGN_SIZE) >> 3);
+}
+
+static inline uint8_t fsd_csis_current_dma_ptr(struct fsd_csis *csis)
+
+{
+	return (readl(csis->dma_base + FSD_CSIS_DMA_ACT_CTRL(csis->current_vc))
+			& 0x01C) >> 2;
+}
+
+#define FSD_CSIS_MODULE_NAME	"fsd-csis-media"
+#define FSD_CSIS_MODULE_VERSION	"0.0.1"
+
+#define FSD_CSIS_DEF_MBUS_CODE		MEDIA_BUS_FMT_RGB888_1X24
+#define FSD_CSIS_DEF_PIX_FORMAT		V4L2_PIX_FMT_RGB24
+#define FSD_CSIS_DEF_PIX_WIDTH		1280
+#define FSD_CSIS_DEF_PIX_HEIGHT		964
+
+#define FSD_CSIS_PAD_SINK	0
+#define FSD_CSIS_PAD_SRC	1
+#define FSD_CSIS_PADS_NUM	2
+
+#define FSD_CSIS_BUS_FMTS(fmt...) ((const u32[]) {fmt, 0 })
+
+static const struct v4l2_mbus_framefmt fsd_csis_default_format = {
+	.width = 640,
+	.height = 480,
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.field = V4L2_FIELD_NONE,
+};
+
+static const struct fsd_csis_pixfmt pixel_formats[] = {
+	/* YUV formats start here */
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.codes  = FSD_CSIS_BUS_FMTS(
+			MEDIA_BUS_FMT_UYVY8_2X8,
+			MEDIA_BUS_FMT_UYVY8_1X16
+		),
+		.is_yuv    = true,
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codes  = FSD_CSIS_BUS_FMTS(
+			MEDIA_BUS_FMT_YUYV8_2X8,
+			MEDIA_BUS_FMT_YUYV8_1X16
+		),
+		.is_yuv    = true,
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
+		.bpp    = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
+		.bpp    = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
+		.bpp    = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
+		.bpp    = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SBGGR12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGBRG12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGRBG12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SRGGB12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SBGGR14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGBRG14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SGRBG14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_SRGGB14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_Y8_1X8),
+		.bpp    = 8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y12,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
+		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y14,
+		.codes  = FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_Y14_1X14),
+		.bpp    = 16,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_RGB24,
+		.codes	= FSD_CSIS_BUS_FMTS(MEDIA_BUS_FMT_RGB888_1X24),
+		.bpp	= 24,
+	}
+};
+
+static void fsd_csis_dma_enable(struct fsd_csis *csis, bool en_dma)
+{
+	unsigned int dma_ctrl, vc = csis->current_vc;
+
+	dma_ctrl = readl(csis->dma_base + FSD_CSIS_DMA_CTRL(vc));
+	dma_ctrl |= FSD_CSIS_DMA_DISABLE;
+
+	if (en_dma)
+		dma_ctrl &= ~FSD_CSIS_DMA_DISABLE;
+
+	writel(dma_ctrl, csis->dma_base + FSD_CSIS_DMA_CTRL(vc));
+}
+
+static void fsd_csis_set_dma_clk(struct fsd_csis *csis)
+{
+	unsigned int dma_clk_ctrl;
+
+	dma_clk_ctrl = readl(csis->dma_base + FSD_CSIS_DMA_CLK_CTRL);
+
+	dma_clk_ctrl &= ~FSD_CSIS_DMA_CLK_GATE_EN;
+	dma_clk_ctrl &= ~FSD_CSIS_DMA_CLK_GATE_TRAIL_MASK;
+	dma_clk_ctrl |= FSD_CSIS_DMA_CLK_GATE_TRAIL(0x7);
+
+	writel(dma_clk_ctrl, csis->dma_base + FSD_CSIS_DMA_CLK_CTRL);
+}
+
+static void fsd_csis_set_pack(struct fsd_csis *csis, u32 vc,
+		enum CSIS_DMA_PACK dma_pack)
+{
+	u32 dma_fmt;
+
+	dma_fmt = readl(csis->dma_base + FSD_CSIS_DMA_CTRL(vc));
+	dma_fmt &= ~FSD_CSIS_ACTIVE_DMA_PACK_MASK;
+	dma_fmt |= FSD_CSIS_ACTIVE_DMA_PACK(dma_pack);
+	writel(dma_fmt, csis->dma_base + FSD_CSIS_DMA_CTRL(vc));
+}
+
+static void fsd_csis_set_dma_dump(struct fsd_csis *csis, unsigned int vc,
+		bool set_dump)
+{
+	u32 dma_fmt;
+
+	dma_fmt = readl(csis->dma_base + FSD_CSIS_DMA_CTRL(vc));
+	dma_fmt &= ~FSD_CSIS_DMA_DUMP;
+
+	if (set_dump)
+		dma_fmt |= FSD_CSIS_DMA_DUMP;
+
+	writel(dma_fmt, csis->dma_base + FSD_CSIS_DMA_CTRL(vc));
+}
+
+static void fsd_csis_set_dma_dimension(struct fsd_csis *csis, u32 vc, bool set_dim)
+{
+	u32 dma_fmt;
+
+	dma_fmt = readl(csis->dma_base + FSD_CSIS_DMA_FMT(vc));
+	dma_fmt &= ~FSD_CSIS_DMA_DIM;
+
+	if (set_dim)
+		dma_fmt |= FSD_CSIS_DMA_DIM;
+
+	writel(dma_fmt, csis->dma_base + FSD_CSIS_DMA_FMT(vc));
+}
+
+static void fsd_csis_set_dma_format(struct fsd_csis *csis,
+		const struct fsd_csis_pixfmt *cc)
+{
+	unsigned int fourcc = cc->fourcc;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		fsd_csis_set_pack(csis, csis->current_vc, DMA_PACK_10);
+		break;
+	case V4L2_PIX_FMT_SBGGR12:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SRGGB12:
+		fsd_csis_set_pack(csis, csis->current_vc, DMA_PACK_12);
+		break;
+	case V4L2_PIX_FMT_SBGGR14P:
+		fsd_csis_set_pack(csis, csis->current_vc, DMA_PACK_14);
+		break;
+	case V4L2_PIX_FMT_BGR666:
+		fsd_csis_set_pack(csis, csis->current_vc, DMA_PACK_18);
+		break;
+	case V4L2_PIX_FMT_UYVY:
+		fsd_csis_set_pack(csis, csis->current_vc, DMA_PACK_NORMAL);
+		break;
+	default:
+		dev_err(csis->dev, "Set DMA format %x not supported\n", fourcc);
+		break;
+	}
+
+	fsd_csis_set_dma_dump(csis, csis->current_vc, false);
+	fsd_csis_set_dma_dimension(csis, csis->current_vc, false);
+}
+
+static inline struct fsd_csis *notifier_to_csis(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct fsd_csis, notifier);
+}
+
+static int fsd_queue_setup(struct vb2_queue *vq,
+		unsigned int *nbuffers, unsigned int *nplanes,
+		unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct fsd_csis *csis = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix = &csis->vdev_fmt;
+	unsigned int size = pix->sizeimage;
+
+	if (*nplanes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+		size = sizes[0];
+	}
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	dev_info(csis->dev, "nbuffers %d size %d\n", *nbuffers, sizes[0]);
+
+	return 0;
+}
+
+static int fsd_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct fsd_csis *csis = vb2_get_drv_priv(vb->vb2_queue);
+	struct fsd_csis_vb2_buffer *buf = container_of(vb, struct fsd_csis_vb2_buffer,
+			vb.vb2_buf);
+	unsigned long size;
+
+	if (WARN_ON(!csis->vdev_cc))
+		return -EINVAL;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_info(csis->dev, "Data will not fit into plane (%lu < %lu)\n",
+				vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
+
+	return 0;
+}
+
+static void fsd_buffer_queue(struct vb2_buffer *vb)
+{
+	unsigned long flags;
+	struct fsd_csis *csis = vb2_get_drv_priv(vb->vb2_queue);
+	struct fsd_csis_vb2_buffer *buf =
+		container_of(vb, struct fsd_csis_vb2_buffer, vb.vb2_buf);
+
+	spin_lock_irqsave(&csis->q_lock, flags);
+	list_add_tail(&buf->list, &csis->ready_q);
+	buf->sequence_num = csis->sequence++;
+	spin_unlock_irqrestore(&csis->q_lock, flags);
+}
+
+static void fsd_csis_dma_set_vid_base_addr(struct fsd_csis *csis, int frm_no,
+		unsigned long addr)
+{
+	unsigned int dma_addr;
+
+	dma_addr = FSD_CSIS_DMA_ADDR1(csis->current_vc);
+	dma_addr = dma_addr + (frm_no * 4);
+	mutex_lock(&csis->mutex_csis_dma_reg);
+	writel(addr, csis->dma_base + dma_addr);
+	mutex_unlock(&csis->mutex_csis_dma_reg);
+}
+
+static void fsd_csis_add_to_ring_buffer(struct fsd_csis *csis,
+		struct fsd_csis_vb2_buffer *buf, uint8_t index)
+{
+	uint8_t modulo_addr;
+	unsigned int i;
+
+	for (i = 0; i < FSD_CSIS_NB_DMA_OUT_CH;
+			i += FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS) {
+		modulo_addr = (index + i) % FSD_CSIS_NB_DMA_OUT_CH;
+		csis->frame[modulo_addr] = buf;
+		csis->frame_addr[modulo_addr] =
+			vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		fsd_csis_dma_set_vid_base_addr(csis, modulo_addr,
+				csis->frame_addr[modulo_addr]);
+	}
+}
+
+static int fsd_csis_get_vc(struct fsd_csis *csis)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	struct media_pad *remote_pad;
+	int ret;
+
+	remote_pad = media_pad_remote_pad_unique(&csis->subdev.pad[FSD_CSIS_PAD_SINK]);
+	ret = v4l2_subdev_call(csis->source.subdev, pad, get_frame_desc, remote_pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(csis->dev, "get_frame_desc failed on source subdev\n");
+		return ret;
+	}
+
+	/* If remote subdev does not implement ..get_frame_desc default to VC0 */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (!fd.num_entries) {
+		dev_err(csis->dev, "get_frame_desc returned zero entries\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
+static int fsd_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct fsd_csis *csis = vb2_get_drv_priv(q);
+	struct fsd_csis_vb2_buffer *buf, *tmp;
+	unsigned long flags;
+	uint8_t i;
+	int ret;
+
+	mutex_lock(&csis->mdev.graph_mutex);
+
+	ret = __video_device_pipeline_start(csis->vdev, &csis->pipe);
+	if (ret)
+		goto err_unlock;
+
+	ret = fsd_csis_get_vc(csis);
+
+	if (ret < 0)
+		goto err_unlock;
+
+	csis->current_vc = ret;
+
+	ret = v4l2_subdev_enable_streams(&csis->subdev.sd, FSD_CSIS_PAD_SRC,
+					BIT(0));
+	if (ret) {
+		dev_err(csis->dev, "stream on failed in subdev\n");
+		goto err_stop;
+	}
+
+	mutex_unlock(&csis->mdev.graph_mutex);
+	fsd_csis_set_dma_clk(csis);
+	fsd_csis_set_dma_format(csis, csis->vdev_cc);
+
+	for (i = 0; i < FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS; i++) {
+
+		spin_lock_irqsave(&csis->q_lock, flags);
+		if (list_empty(&csis->ready_q)) {
+			spin_unlock_irqrestore(&csis->q_lock, flags);
+			dev_err(csis->dev, "Failed to fill buffer address!\n");
+			return -EIO;
+		}
+
+		buf = list_entry(csis->ready_q.next, struct fsd_csis_vb2_buffer, list);
+		list_del(&buf->list);
+		fsd_csis_add_to_ring_buffer(csis, buf, i);
+		spin_unlock_irqrestore(&csis->q_lock, flags);
+	}
+
+	fsd_csis_dma_enable(csis, true);
+
+	return 0;
+err_stop:
+	v4l2_subdev_disable_streams(&csis->subdev.sd, FSD_CSIS_PAD_SRC,
+					BIT(0));
+	__video_device_pipeline_stop(csis->vdev);
+err_unlock:
+	mutex_unlock(&csis->mdev.graph_mutex);
+
+	spin_lock_irqsave(&csis->q_lock, flags);
+	list_for_each_entry_safe(buf, tmp, &csis->ready_q, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	spin_unlock_irqrestore(&csis->q_lock, flags);
+
+	dev_err(csis->dev, "pipeline start failed with %d\n", ret);
+	return ret;
+}
+
+/**
+ * fsd_stop_streaming() - stop streaming for CSI context
+ * @q: pointer to vb2_queue in use
+ * Return: none
+ */
+static void fsd_stop_streaming(struct vb2_queue *q)
+{
+	unsigned long flags;
+	struct fsd_csis *csis = vb2_get_drv_priv(q);
+	struct fsd_csis_vb2_buffer *buf, *tmp;
+	unsigned int timeout_cnt = 0;
+	int i;
+	void __iomem *dma_act_ctrl = 0;
+
+	fsd_csis_dma_enable(csis, false);
+
+	dma_act_ctrl = csis->dma_base + FSD_CSIS_DMA_ACT_CTRL(csis->current_vc);
+
+	while ((readl(dma_act_ctrl) & 0x1) == 0x0) {
+		if (timeout_cnt > 50) {
+			dev_dbg(csis->dev, "DMA did not finish in 500ms.\n");
+			break;
+		}
+		usleep_range(10000, 20000); /* Wait min 10ms, max 20ms */
+		timeout_cnt++;
+	}
+
+	mutex_lock(&csis->mdev.graph_mutex);
+	v4l2_subdev_disable_streams(&csis->subdev.sd, FSD_CSIS_PAD_SRC,
+					BIT(0));
+	__video_device_pipeline_stop(csis->vdev);
+	mutex_unlock(&csis->mdev.graph_mutex);
+	/*
+	 * If still DMA operation exists after disabled irq, it will
+	 * update dma_done part in interrupt source register. For next
+	 * streaming session, this could be interpreted as current session's
+	 * first frame done. To prevent this incorrect dma_done receiving,
+	 * clearing interrupt source register here.
+	 */
+
+	/* Release all active buffers */
+	spin_lock_irqsave(&csis->q_lock, flags);
+	list_for_each_entry_safe(buf, tmp, &csis->ready_q, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	spin_unlock_irqrestore(&csis->q_lock, flags);
+
+	for (i = 0; i < FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS; i++) {
+		buf = csis->frame[i];
+		if (buf)
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static int fsd_csis_video_open(struct file *file)
+{
+	struct fsd_csis *csis = video_drvdata(file);
+	int ret;
+	struct vb2_queue *q = &csis->q;
+
+	if (vb2_is_busy(q)) {
+		dev_err(csis->dev, "device busy\n");
+		return -EBUSY;
+	}
+
+	ret = pm_runtime_resume_and_get(csis->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_fh_open(file);
+
+	if (ret) {
+		dev_err(csis->dev, "v4l2_fh_open failed\n");
+		goto err;
+	}
+
+	return ret;
+
+err:
+	pm_runtime_put(csis->dev);
+	return ret;
+}
+
+static void fsd_csis_irq_worker(struct fsd_csis *csis)
+{
+	struct fsd_csis_vb2_buffer *buf_from;
+	struct fsd_csis_vb2_buffer *buf_to;
+	struct v4l2_subdev *subdev = csis->source.subdev;
+	uint8_t i;
+	void __iomem *dma_act_ctrl;
+	unsigned long flags;
+
+	dma_act_ctrl = csis->dma_base + FSD_CSIS_DMA_ACT_CTRL(csis->current_vc);
+	csis->current_dma_ptr = readl(dma_act_ctrl);
+	csis->current_dma_ptr = get_bits(csis->current_dma_ptr,
+					FSD_CSIS_ACTIVE_DMA_FRAMEPTR_MASK);
+
+	v4l2_subdev_call(subdev, core, command, 5,
+			&csis->current_frame_counter);
+
+	if (csis->dma_error) {
+		dev_err(csis->dev, "prev_dma: %d, cur_dma: %d, prev_frm: %d, cur_frm: %d\n",
+				csis->prev_dma_ptr, csis->current_dma_ptr,
+				csis->prev_frame_counter, csis->current_frame_counter);
+		csis->prev_dma_ptr = csis->current_dma_ptr;
+		goto update_prev_counters;
+	}
+
+	if (csis->current_dma_ptr >= csis->prev_dma_ptr)
+		csis->number_of_ready_bufs =
+			csis->current_dma_ptr - csis->prev_dma_ptr;
+	else
+		csis->number_of_ready_bufs =
+			FSD_CSIS_NB_DMA_OUT_CH - csis->prev_dma_ptr
+			+ csis->current_dma_ptr;
+
+
+	if ((csis->number_of_ready_bufs >= FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS)
+			|| ((csis->current_frame_counter - csis->prev_frame_counter)
+				>= FSD_CSIS_NB_DMA_OUT_CH)) {
+		/* In case of CSIS_NB_OF_BUFS_ON_DMA_CHANNELS or CSIS_NUM_DMA_OUT_CH number
+		 * of frames delays or more, set how many recent frames are ready to be read
+		 * in the next interrupt. This cannot be more than
+		 * CSIS_NB_OF_BUFS_ON_DMA_CHANNELS-1 frames.
+		 */
+		csis->number_of_ready_bufs = FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS - 1;
+		csis->prev_dma_ptr = (csis->current_dma_ptr -
+					FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS)
+					& (FSD_CSIS_NB_DMA_OUT_CH - 1);
+		dev_err(csis->dev, "interrupt delayed %d frames\n",
+					csis->number_of_ready_bufs);
+	}
+
+	if (csis->number_of_ready_bufs == 0) {
+		dev_err(csis->dev, "Interrupt burst number_of_ready_bufs: %d\n",
+							csis->number_of_ready_bufs);
+		goto update_prev_counters;
+	} else {
+		if (csis->number_of_ready_bufs > 1) {
+			/*
+			 * Interrupt has been missed. Do not populate DMA_ACT_CTRL pointer.
+			 * Notify buffers ready until (DMA_ACT_CTRL - 1) pointer.
+			 * Because,the delayed interrupt might be arrived in DMA active
+			 * time.
+			 */
+			csis->number_of_ready_bufs--;
+			dev_err(csis->dev, "interrupt got delayed %d frames\n",
+						csis->number_of_ready_bufs);
+		}
+	}
+
+	for (i = 0; i < csis->number_of_ready_bufs; i++) {
+		bool is_same_modulo;
+
+		csis->prev_dma_ptr = (csis->prev_dma_ptr + 1) % FSD_CSIS_NB_DMA_OUT_CH;
+		is_same_modulo = !((csis->prev_dma_ptr - (csis->current_dma_ptr + 1)) %
+					FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS);
+
+		spin_lock_irqsave(&csis->q_lock, flags);
+
+		/*
+		 * Before dequeuing buffer from DMA at least
+		 * one buffer should be ready in vb2_queue
+		 */
+		if (list_empty(&csis->ready_q)) {
+			spin_unlock_irqrestore(&csis->q_lock, flags);
+			csis->prev_dma_ptr = csis->current_dma_ptr;
+			goto update_prev_counters;
+
+		} else {
+
+			buf_from = list_entry(csis->ready_q.next,
+					struct fsd_csis_vb2_buffer, list);
+			list_del(&buf_from->list);
+		}
+
+		spin_unlock_irqrestore(&csis->q_lock, flags);
+
+		buf_to = csis->frame[csis->prev_dma_ptr];
+
+		if (is_same_modulo) {
+			if (csis->current_dma_ptr != fsd_csis_current_dma_ptr(csis)) {
+				spin_lock_irqsave(&csis->q_lock, flags);
+				list_add_tail(&buf_from->list, &csis->ready_q);
+				spin_unlock_irqrestore(&csis->q_lock, flags);
+				continue;
+			}
+		}
+
+		fsd_csis_add_to_ring_buffer(csis, buf_from, csis->prev_dma_ptr);
+
+		if (buf_to) {
+			buf_to->vb.vb2_buf.timestamp = ktime_get_ns();
+			vb2_buffer_done(&buf_to->vb.vb2_buf,
+					VB2_BUF_STATE_DONE);
+		}
+
+	}
+
+update_prev_counters:
+	csis->prev_frame_counter = csis->current_frame_counter;
+
+}
+
+static irqreturn_t csis_irq_handler(int irq_csis, void *data)
+{
+	struct fsd_csis *csis = data;
+	struct v4l2_subdev *subdev = csis->source.subdev;
+	unsigned int vc;
+	unsigned int int_src1 = 0x0;
+	unsigned int int1_err = 0x0;
+	unsigned int dma_error = 0x0, dma_err_code = 0x0, dma_error_vc = 0x0;
+	unsigned int err = 0x0;
+	unsigned int dma_frame_end = 0x0, dma_frame_end_vc = 0x0, dma_frame_start = 0x0;
+	int i;
+
+	vc = csis->current_vc;
+
+	v4l2_subdev_call(subdev, core, command, 2, &int_src1);
+	int1_err = get_bits(int_src1, FSD_CSIS_INT_SRC1_ERR_ALL_MASK);
+
+	dma_frame_start = get_bits(int_src1, FSD_CSIS_DMA_FRM_START_MASK);
+	dma_frame_end = get_bits(int_src1, FDS_CSIS_DMA_FRM_END_MASK);
+
+	if (int1_err) {
+		err = get_bits(int_src1, FSD_CSIS_DMA_OTF_OVERLAP_MASK);
+		if (err)
+			dev_err(csis->dev, "DMA OTF OVERLAP %x\n", err);
+
+		dma_error = get_bits(int_src1, FSD_CSIS_DMA_ERROR_MASK);
+
+		if (dma_error) {
+			dev_err(csis->dev, "DMA ERROR %x\n", dma_error);
+			dma_err_code = readl(csis->dma_base + FSD_CSIS_DMA_ERR_CODE);
+			dev_err(csis->dev, "Error code %x", dma_err_code);
+		}
+	}
+
+	if (dma_frame_end || dma_error) {
+
+		for (i = 0; i < FSD_CSIS_MAX_VC; i++) {
+			dma_frame_end_vc = (dma_frame_end >> i) & 0x01;
+			if (dma_error) {
+				dma_error_vc = int_src1 & (FSD_CSIS_DMA_CH0_MASK << i);
+				dma_error_vc |= ((dma_err_code & (FSD_CSIS_DMAFIFO_FULL_MASK |
+								FSD_CSIS_TRXFIFO_FULL_MASK |
+								0x01 << i)) << 18);
+			}
+
+			if (dma_frame_end_vc || dma_error_vc) {
+				csis->dma_error = dma_error_vc;
+				fsd_csis_irq_worker(csis);
+			}
+		}
+	}
+
+	v4l2_subdev_call(subdev, core, command, 3, &int_src1);
+
+	return IRQ_HANDLED;
+}
+
+static int fsd_csis_video_release(struct file *file)
+{
+	struct fsd_csis *csis = video_drvdata(file);
+	int ret;
+
+	ret = vb2_fop_release(file);
+
+	if (ret)
+		return ret;
+
+	pm_runtime_put(csis->dev);
+
+	return ret;
+}
+
+static int fsd_csis_video_querycap(struct file *file, void *priv,
+					struct v4l2_capability *cap)
+{
+	struct fsd_csis *csis = video_drvdata(file);
+
+	strscpy(cap->driver, FSD_CSIS_MODULE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, FSD_CSIS_MODULE_NAME, sizeof(cap->card));
+
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+			"platform:%s", dev_name(csis->dev));
+	return 0;
+}
+
+static int fsd_csis_video_enum_fmt_vid_cap(struct file *file, void *priv,
+					struct v4l2_fmtdesc *f)
+{
+	unsigned int index = f->index;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct fsd_csis_pixfmt *fmt = &pixel_formats[i];
+
+		if (f->mbus_code) {
+			unsigned int j;
+
+			if (!fmt->codes)
+				continue;
+
+			for (j = 0; fmt->codes[j]; j++) {
+				if (f->mbus_code == fmt->codes[j])
+					break;
+			}
+
+			if (!fmt->codes[j])
+				continue;
+		}
+
+		if (index == 0) {
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
+}
+
+/*
+ * Search in the pixel_formats[] array for an entry with the given fourcc
+ * return it.
+ */
+static const struct fsd_csis_pixfmt *fsd_csis_find_pixel_format(u32 fourcc)
+{
+	const struct fsd_csis_pixfmt *fmt;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		fmt = &pixel_formats[i];
+
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+/*
+ * Search in the pixel_formats[] array for an entry with the given media
+ * bus code and return it.
+ */
+static const struct fsd_csis_pixfmt *fsd_csis_find_mbus_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct fsd_csis_pixfmt *fmt = &pixel_formats[i];
+		unsigned int j;
+
+		if (!fmt->codes)
+			continue;
+
+		for (j = 0; fmt->codes[j]; j++) {
+			if (code == fmt->codes[j])
+				return fmt;
+		}
+	}
+
+	return NULL;
+}
+
+static int fsd_csis_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					const struct v4l2_mbus_framefmt *mbus,
+					const struct fsd_csis_pixfmt *cc)
+{
+	u32 width;
+	u32 stride;
+
+	if (!cc) {
+		cc = fsd_csis_find_mbus_format(mbus->code);
+		if (!cc)
+			return -EINVAL;
+	}
+
+	/* Round up width for minimum burst size */
+	width = round_up(mbus->width, 8);
+
+	/* Round up stride for IDMAC line start address alignment */
+	stride = round_up((width * cc->bpp) >> 3, 8);
+
+	pix->width = width;
+	pix->height = mbus->height;
+	pix->pixelformat = cc->fourcc;
+	pix->colorspace = mbus->colorspace;
+	pix->xfer_func = mbus->xfer_func;
+	pix->ycbcr_enc = mbus->ycbcr_enc;
+	pix->quantization = mbus->quantization;
+	pix->field = mbus->field;
+	pix->bytesperline = stride;
+	pix->sizeimage = stride * pix->height;
+
+	return 0;
+}
+
+static const struct fsd_csis_pixfmt *__fsd_csis_video_try_fmt_vid_cap(
+		struct fsd_csis *csis, struct v4l2_pix_format *pixfmt)
+{
+	struct v4l2_mbus_framefmt fmt_src;
+	const struct fsd_csis_pixfmt *cc;
+	struct v4l2_rect *compose = &csis->vdev_compose;
+
+	/*
+	 * Find the pixel format, default to the first supported format if not
+	 * found.
+	 */
+	cc = fsd_csis_find_pixel_format(pixfmt->pixelformat);
+
+	if (!cc) {
+		pixfmt->pixelformat = FSD_CSIS_DEF_PIX_FORMAT;
+		pixfmt->height = FSD_CSIS_DEF_PIX_HEIGHT;
+		pixfmt->width = FSD_CSIS_DEF_PIX_WIDTH;
+		pixfmt->colorspace = V4L2_COLORSPACE_SRGB;
+		pixfmt->field = V4L2_FIELD_NONE;
+		cc = fsd_csis_find_pixel_format(pixfmt->pixelformat);
+	}
+
+	v4l2_fill_mbus_format(&fmt_src, pixfmt, cc->codes[0]);
+	fsd_csis_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+
+	compose->width = fmt_src.width;
+	compose->height = fmt_src.height;
+
+	csis->vdev_fmt = *pixfmt;
+	return cc;
+}
+
+static int fsd_csis_video_try_fmt_vid_cap(struct file *file, void *fh,
+						struct v4l2_format *f)
+{
+	struct fsd_csis *csis = video_drvdata(file);
+
+	__fsd_csis_video_try_fmt_vid_cap(csis, &f->fmt.pix);
+	return 0;
+}
+
+static int fsd_csis_video_s_fmt_vid_cap(struct file *file, void *priv,
+		struct v4l2_format *f)
+{
+	struct fsd_csis *csis = video_drvdata(file);
+	struct v4l2_subdev *sd = &csis->subdev.sd;
+	const struct fsd_csis_pixfmt *cc;
+	struct vb2_queue *q = &csis->q;
+	int ret;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = 0,
+	};
+
+	if (vb2_is_busy(q)) {
+		dev_err(csis->dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	cc = __fsd_csis_video_try_fmt_vid_cap(csis, &f->fmt.pix);
+	v4l2_fill_mbus_format(&fmt.format, &f->fmt.pix, cc->codes[0]);
+	ret = v4l2_subdev_call(sd, pad, set_fmt, sd->active_state, &fmt);
+
+	if (ret < 0) {
+		dev_err(csis->dev, "subdev format set failed %d\n", ret);
+		return ret;
+	}
+
+	csis->vdev_cc = cc;
+	csis->vdev_fmt = f->fmt.pix;
+	return 0;
+}
+
+static int fsd_csis_video_g_fmt_vid_cap(struct file *file, void *priv,
+		struct v4l2_format *f)
+{
+	struct fsd_csis *csis = video_drvdata(file);
+
+	f->fmt.pix = csis->vdev_fmt;
+
+	return 0;
+}
+
+static const struct vb2_ops fsd_csis_video_qops = {
+	.queue_setup            = fsd_queue_setup,
+	.buf_prepare            = fsd_buffer_prepare,
+	.buf_queue              = fsd_buffer_queue,
+	.start_streaming        = fsd_start_streaming,
+	.stop_streaming         = fsd_stop_streaming,
+	.wait_prepare           = vb2_ops_wait_prepare,
+	.wait_finish            = vb2_ops_wait_finish,
+};
+
+static const struct v4l2_ioctl_ops fsd_csis_video_ioctl_ops = {
+	.vidioc_querycap      = fsd_csis_video_querycap,
+
+	.vidioc_enum_fmt_vid_cap  = fsd_csis_video_enum_fmt_vid_cap,
+
+	.vidioc_try_fmt_vid_cap   = fsd_csis_video_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap     = fsd_csis_video_s_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap     = fsd_csis_video_g_fmt_vid_cap,
+
+	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
+	.vidioc_querybuf      = vb2_ioctl_querybuf,
+	.vidioc_qbuf          = vb2_ioctl_qbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
+	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
+	.vidioc_streamon      = vb2_ioctl_streamon,
+	.vidioc_streamoff     = vb2_ioctl_streamoff,
+};
+
+/**
+ * V4L2 File operations
+ */
+static const struct v4l2_file_operations fsd_csis_video_fops = {
+	.owner          = THIS_MODULE,
+	.open           = fsd_csis_video_open,
+	.release        = fsd_csis_video_release,
+	.read           = vb2_fop_read,
+	.poll           = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = vb2_fop_mmap,
+};
+
+static int fsd_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_connection *asd)
+{
+	struct fsd_csis *csis = notifier_to_csis(notifier);
+	struct media_pad *sink = &csis->subdev.pad[FSD_CSIS_PAD_SINK];
+	struct media_pad *source;
+	int ret;
+
+	dev_dbg(csis->dev, "Hooked csis subdevice: %s to parent\n",
+			subdev->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(subdev, sink, MEDIA_LNK_FL_ENABLED);
+
+	if (ret)
+		return ret;
+
+	source = media_pad_remote_pad_unique(sink);
+	if (IS_ERR(source)) {
+		dev_err(csis->dev, "No connected source pad\n");
+		return PTR_ERR(source);
+	}
+
+	csis->source.subdev = subdev;
+	csis->source.pad = source;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations fsd_csi_notify_ops = {
+	.bound = fsd_csi_notify_bound,
+};
+
+static const struct media_device_ops fsd_csis_media_ops = {
+	.link_notify = v4l2_pipeline_link_notify,
+};
+
+static const struct media_entity_operations fsd_csis_entity_ops = {
+	.link_validate  = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int fsd_csis_media_dev_init(struct fsd_csis *csis)
+{
+	int ret;
+
+
+	strscpy(csis->mdev.model, "fsd-csis-media", sizeof(csis->mdev.model));
+	csis->mdev.ops = &fsd_csis_media_ops;
+	csis->mdev.dev = csis->dev;
+
+	csis->v4l2_dev.mdev = &csis->mdev;
+	strscpy(csis->v4l2_dev.name, "fsd-csis-media",
+			sizeof(csis->v4l2_dev.name));
+	snprintf(csis->mdev.bus_info, sizeof(csis->mdev.bus_info),
+			"platform:%s", dev_name(csis->mdev.dev));
+
+	media_device_init(&csis->mdev);
+
+	ret = v4l2_device_register(csis->dev, &csis->v4l2_dev);
+
+	if (ret < 0) {
+		v4l2_err(&csis->v4l2_dev,
+				"Failed to register v4l2_device: %d\n", ret);
+		goto cleanup;
+	}
+
+	return 0;
+
+cleanup:
+	media_device_cleanup(&csis->mdev);
+
+	return ret;
+}
+
+static void fsd_csis_media_cleanup(struct fsd_csis *csis)
+{
+	v4l2_device_unregister(&csis->v4l2_dev);
+	media_device_unregister(&csis->mdev);
+	v4l2_subdev_cleanup(&csis->subdev.sd);
+	media_device_cleanup(&csis->mdev);
+}
+
+static int fsd_csis_video_init(struct fsd_csis *csis)
+{
+	struct video_device *vdev;
+	struct vb2_queue *vq;
+	int ret;
+
+	mutex_init(&csis->vdev_mutex);
+	INIT_LIST_HEAD(&csis->ready_q);
+	spin_lock_init(&csis->q_lock);
+
+	/* Allocate and initialize the video device.*/
+	vdev = video_device_alloc();
+	if (!vdev)
+		return -ENOMEM;
+
+	vdev->fops = &fsd_csis_video_fops;
+	vdev->ioctl_ops = &fsd_csis_video_ioctl_ops;
+	vdev->minor = -1;
+	vdev->release = video_device_release;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->lock = &csis->vdev_mutex;
+	vdev->queue = &csis->q;
+
+	snprintf(vdev->name, sizeof(vdev->name), "%s capture", csis->subdev.sd.name);
+
+	video_set_drvdata(vdev, csis);
+	csis->vdev = vdev;
+
+	/* Initialize the video device pad. */
+	csis->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &csis->vdev_pad);
+	if (ret) {
+		video_device_release(vdev);
+		return ret;
+	}
+
+	/* Initialize the vb2 queue. */
+	vq = &csis->q;
+	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	vq->drv_priv = csis;
+	vq->buf_struct_size = sizeof(struct fsd_csis_vb2_buffer);
+	vq->ops = &fsd_csis_video_qops;
+	vq->mem_ops = &vb2_dma_contig_memops;
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vq->lock = &csis->vdev_mutex;
+	vq->min_reqbufs_allocation = FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS + 1;
+	vq->min_queued_buffers = FSD_CSIS_NB_MIN_CH;
+	vq->dev = csis->dev;
+
+	ret = vb2_queue_init(vq);
+	if (ret) {
+		dev_err(csis->dev, "vb2_queue_init failed\n");
+		video_device_release(vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void fsd_csis_video_init_format(struct fsd_csis *csis)
+{
+
+	csis->vdev_fmt.width = FSD_CSIS_DEF_PIX_WIDTH;
+	csis->vdev_fmt.height = FSD_CSIS_DEF_PIX_HEIGHT;
+	csis->vdev_fmt.pixelformat = FSD_CSIS_DEF_PIX_FORMAT;
+	csis->vdev_fmt.colorspace = V4L2_COLORSPACE_SRGB;
+	csis->vdev_fmt.field = V4L2_FIELD_NONE;
+
+	csis->vdev_cc = fsd_csis_find_pixel_format(csis->vdev_fmt.pixelformat);
+
+	csis->vdev_fmt.bytesperline = bytes_per_line(FSD_CSIS_DEF_PIX_WIDTH,
+					csis->vdev_cc->bpp);
+	csis->vdev_fmt.sizeimage = csis->vdev_fmt.bytesperline *
+					csis->vdev_fmt.height;
+}
+
+static int fsd_csis_video_register(struct fsd_csis *csis)
+{
+	struct v4l2_subdev *sd = &csis->subdev.sd;
+	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
+	struct video_device *vdev = csis->vdev;
+	int ret;
+
+	vdev->v4l2_dev = v4l2_dev;
+
+	/* Initialize the default format and compose rectangle. */
+	fsd_csis_video_init_format(csis);
+
+	/* Register the video device. */
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(csis->dev, "Failed to register video device\n");
+		return ret;
+	}
+
+	dev_info(csis->dev, "Registered %s as /dev/%s\n", vdev->name,
+			video_device_node_name(vdev));
+
+	/* Create the link from the CSI subdev to the video device. */
+	ret = media_create_pad_link(&sd->entity, FSD_CSIS_PAD_SRC,
+			&vdev->entity, 0, MEDIA_LNK_FL_IMMUTABLE |
+			MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(csis->dev, "failed to create link to device node\n");
+		video_unregister_device(vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void fsd_csis_video_unregister(struct fsd_csis *csis)
+{
+	media_entity_cleanup(&csis->vdev->entity);
+	video_unregister_device(csis->vdev);
+}
+
+static int fsd_csis_registered(struct v4l2_subdev *sd)
+{
+	struct fsd_csis *csis = v4l2_get_subdevdata(sd);
+	int ret;
+
+	ret = fsd_csis_video_init(csis);
+	if (ret)
+		return ret;
+
+	ret = fsd_csis_video_register(csis);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register_subdev_nodes(&csis->v4l2_dev);
+	if (ret)
+		goto err_unregister;
+
+	ret = media_device_register(&csis->mdev);
+	if (ret)
+		goto err_unregister;
+
+	return 0;
+
+err_unregister:
+	fsd_csis_video_unregister(csis);
+
+	return ret;
+}
+
+static void fsd_csis_unregistered(struct v4l2_subdev *sd)
+{
+	struct fsd_csis *csis = v4l2_get_subdevdata(sd);
+
+	fsd_csis_video_unregister(csis);
+}
+
+static int fsd_csis_sd_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_format *sdformat)
+{
+	struct fsd_csis *csis = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *subdev = csis->source.subdev;
+	struct v4l2_mbus_framefmt *fmt;
+	const struct fsd_csis_pixfmt *cc;
+
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE && csis->is_streaming)
+		return -EBUSY;
+
+	if (sdformat->pad == FSD_CSIS_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	if (sdformat->pad != FSD_CSIS_PAD_SINK)
+		return -EINVAL;
+
+	cc = fsd_csis_find_mbus_format(sdformat->format.code);
+	if (!cc)
+		cc = fsd_csis_find_mbus_format(FSD_CSIS_DEF_MBUS_CODE);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+
+	fmt->code = cc->codes[0];
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
+	fmt->field = V4L2_FIELD_NONE;
+
+	sdformat->format = *fmt;
+
+	/* Propagate the format from sink to source. */
+	fmt = v4l2_subdev_state_get_format(sd_state, FSD_CSIS_PAD_SRC);
+	*fmt = sdformat->format;
+
+	return v4l2_subdev_call(subdev, pad, set_fmt, subdev->active_state, sdformat);
+}
+
+static int __fsd_csis_sd_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+			V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret)
+		return ret;
+
+	for_each_active_route(&state->routing, route) {
+		const struct v4l2_mbus_framefmt *def_fmt;
+		struct v4l2_mbus_framefmt *fmt;
+
+		def_fmt = &fsd_csis_default_format;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+				route->sink_stream);
+		*fmt = *def_fmt;
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+				route->source_stream);
+		*fmt = *def_fmt;
+	}
+
+	return 0;
+}
+
+static int fsd_csis_sd_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					enum v4l2_subdev_format_whence which,
+					struct v4l2_subdev_krouting *routing)
+{
+	struct fsd_csis *csis = v4l2_get_subdevdata(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csis->is_streaming)
+		return -EBUSY;
+
+	return __fsd_csis_sd_set_routing(sd, state, routing);
+}
+
+static int fsd_csis_sd_enable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+
+	struct fsd_csis *csis = v4l2_get_subdevdata(sd);
+
+	return v4l2_subdev_enable_streams(csis->source.subdev,
+					FSD_CSIS_PAD_SRC, BIT(0));
+}
+
+static int fsd_csis_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct fsd_csis *csis = v4l2_get_subdevdata(sd);
+
+	return v4l2_subdev_disable_streams(csis->source.subdev,
+					FSD_CSIS_PAD_SRC, BIT(0));
+}
+
+static int fsd_csis_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = FSD_CSIS_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = FSD_CSIS_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __fsd_csis_sd_set_routing(sd, state, &routing);
+}
+
+static const struct v4l2_subdev_internal_ops fsd_csis_internal_ops = {
+	.init_state	= fsd_csis_init_state,
+	.registered	= fsd_csis_registered,
+	.unregistered	= fsd_csis_unregistered,
+};
+
+static const struct v4l2_subdev_pad_ops fsd_csis_pad_ops = {
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= fsd_csis_sd_set_fmt,
+	.set_routing		= fsd_csis_sd_set_routing,
+	.enable_streams		= fsd_csis_sd_enable_streams,
+	.disable_streams	= fsd_csis_sd_disable_streams,
+};
+
+static const struct v4l2_subdev_ops fsd_csis_subdev_ops = {
+	.pad = &fsd_csis_pad_ops,
+};
+
+static int fsd_csis_media_init(struct fsd_csis *csis)
+{
+	struct v4l2_subdev *sd = &csis->subdev.sd;
+	int ret, i;
+
+	/* add media device */
+	ret = fsd_csis_media_dev_init(csis);
+	if (ret)
+		return ret;
+
+	v4l2_subdev_init(sd, &fsd_csis_subdev_ops);
+	v4l2_set_subdevdata(sd, csis);
+	sd->internal_ops = &fsd_csis_internal_ops;
+	sd->entity.ops = &fsd_csis_entity_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->dev = csis->dev;
+	sd->owner = THIS_MODULE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	snprintf(sd->name, sizeof(sd->name), "csis");
+
+	for (i = 0; i < FSD_CSIS_PADS_NUM; i++)
+		csis->subdev.pad[i].flags = (i == FSD_CSIS_PAD_SINK) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, FSD_CSIS_PADS_NUM,
+					csis->subdev.pad);
+
+	if (ret)
+		goto error;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto error;
+
+	ret = v4l2_device_register_subdev(&csis->v4l2_dev, sd);
+	if (ret)
+		goto error;
+
+	return 0;
+error:
+	fsd_csis_media_cleanup(csis);
+	return ret;
+}
+
+static int fsd_csis_async_register(struct fsd_csis *csis)
+{
+	struct v4l2_async_connection *asd;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_nf_init(&csis->notifier, &csis->v4l2_dev);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+
+	if (ep) {
+		asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
+						struct v4l2_async_connection);
+		fwnode_handle_put(ep);
+
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
+			/* OK if asd already exists */
+			if (ret != -EEXIST)
+				goto error;
+		}
+	}
+
+	csis->notifier.ops = &fsd_csi_notify_ops;
+
+	ret = v4l2_async_nf_register(&csis->notifier);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	v4l2_async_nf_cleanup(&csis->notifier);
+	return ret;
+}
+
+static int fsd_csis_enable_pll(struct fsd_csis *csis)
+{
+	csis->pll = devm_clk_get(csis->dev, "pll");
+
+	if (IS_ERR(csis->pll))
+		return PTR_ERR(csis->pll);
+
+	return clk_prepare_enable(csis->pll);
+}
+
+static int fsd_csis_clk_get(struct fsd_csis *csis)
+{
+	int i;
+
+	csis->clks = devm_kcalloc(csis->dev, FSD_CSIS_NB_CLOCK, sizeof(*csis->clks), GFP_KERNEL);
+
+	if (!csis->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < FSD_CSIS_NB_CLOCK; i++)
+		csis->clks[i].id = fsd_csis_clk_id[i];
+
+	return devm_clk_bulk_get(csis->dev, FSD_CSIS_NB_CLOCK, csis->clks);
+}
+
+static int fsd_csis_runtime_suspend(struct device *dev)
+{
+	struct fsd_csis *csis = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(FSD_CSIS_NB_CLOCK, csis->clks);
+
+	return 0;
+}
+
+static int fsd_csis_runtime_resume(struct device *dev)
+{
+	struct fsd_csis *csis = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(FSD_CSIS_NB_CLOCK, csis->clks);
+}
+
+static const struct dev_pm_ops fsd_csis_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsd_csis_runtime_suspend, fsd_csis_runtime_resume,
+			NULL)
+};
+
+static int fsd_csis_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fsd_csis *csis;
+	int ret = 0;
+	int irq;
+
+	csis = devm_kzalloc(dev, sizeof(*csis), GFP_KERNEL);
+	if (!csis)
+		return -ENOMEM;
+
+	csis->dev = dev;
+	csis->info = of_device_get_match_data(dev);
+
+	csis->dma_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csis->dma_base))
+		return PTR_ERR(csis->dma_base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq,
+			csis_irq_handler, IRQF_SHARED, pdev->name, csis);
+
+	ret = fsd_csis_clk_get(csis);
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = fsd_csis_runtime_resume(dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	platform_set_drvdata(pdev, csis);
+
+	ret = fsd_csis_enable_pll(csis);
+	if (ret)
+		return ret;
+
+	ret = fsd_csis_media_init(csis);
+	if (ret)
+		return ret;
+
+	ret = fsd_csis_async_register(csis);
+	if (ret)
+		goto err_media_cleanup;
+
+	return 0;
+
+err_media_cleanup:
+	fsd_csis_media_cleanup(csis);
+
+	return ret;
+}
+
+static void fsd_csis_remove(struct platform_device *pdev)
+{
+	struct fsd_csis *csis = platform_get_drvdata(pdev);
+
+	fsd_csis_media_cleanup(csis);
+
+	v4l2_async_nf_unregister(&csis->notifier);
+	v4l2_async_nf_cleanup(&csis->notifier);
+	v4l2_async_unregister_subdev(&csis->subdev.sd);
+
+	if (!pm_runtime_enabled(csis->dev))
+		fsd_csis_runtime_suspend(csis->dev);
+
+	pm_runtime_disable(csis->dev);
+	pm_runtime_set_suspended(csis->dev);
+}
+
+static const struct of_device_id fsd_csis_of_match[] = {
+	{ .compatible = "tesla,fsd-csis-media", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, fsd_csis_of_match);
+
+static struct platform_driver fsd_csis_driver = {
+	.probe		= fsd_csis_probe,
+	.remove		= fsd_csis_remove,
+	.driver		= {
+		.name		= FSD_CSIS_MODULE_NAME,
+		.of_match_table = of_match_ptr(fsd_csis_of_match),
+		.pm		= &fsd_csis_pm_ops,
+	},
+};
+
+module_platform_driver(fsd_csis_driver);
+
+MODULE_DESCRIPTION("FSD CSIS Driver");
+MODULE_AUTHOR("Inbaraj E <inbaraj.e@samsung.com>");
+MODULE_LICENSE("GPL");
+
-- 
2.49.0


