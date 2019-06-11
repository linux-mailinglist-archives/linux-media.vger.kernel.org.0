Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9B73CC31
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389224AbfFKMvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:51:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44711 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387610AbfFKMvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:51:09 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hagEw-00077w-Gz; Tue, 11 Jun 2019 14:51:02 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v4 01/10] rockchip/vpu: rename from rockchip to hantro
Date:   Tue, 11 Jun 2019 14:50:49 +0200
Message-Id: <20190611125058.13470-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611125058.13470-1-p.zabel@pengutronix.de>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the driver and all relevant identifiers from Rockchip to Hantro,
as other Hantro IP based VPU implementations can be supported by the
same driver.
The RK3288 decoder is Hantro G1 based, the encoder is Hantro H1.

This patch just renames, no functional changes.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v3 [1]:
 - Split rk3288_vpu_regs.h into hantro_g1_regs.h and hantro_h1_regs.h,
   rename VDPU register defines to G1 and VEPU register defines to H1.
 - Make Rockchip support configurable.
 - Keep staging/media Kconfig in alphabetic order.

[1] https://patchwork.linuxtv.org/patch/56469/
---
 MAINTAINERS                                   |   4 +-
 drivers/staging/media/Kconfig                 |   4 +-
 drivers/staging/media/Makefile                |   2 +-
 drivers/staging/media/hantro/Kconfig          |  23 +
 drivers/staging/media/hantro/Makefile         |  15 +
 .../media/{rockchip/vpu => hantro}/TODO       |   0
 .../vpu/rockchip_vpu.h => hantro/hantro.h}    | 136 +++---
 .../hantro_drv.c}                             | 253 +++++-----
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 260 ++++++++++
 drivers/staging/media/hantro/hantro_g1_regs.h | 301 ++++++++++++
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 125 +++++
 drivers/staging/media/hantro/hantro_h1_regs.h | 154 ++++++
 drivers/staging/media/hantro/hantro_hw.h      | 102 ++++
 .../hantro_jpeg.c}                            |  18 +-
 drivers/staging/media/hantro/hantro_jpeg.h    |  13 +
 .../hantro_mpeg2.c}                           |  14 +-
 .../hantro_v4l2.c}                            | 234 +++++----
 .../hantro_v4l2.h}                            |  16 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 178 +++++++
 .../{rockchip/vpu => hantro}/rk3399_vpu_hw.c  |  64 +--
 .../vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c   |  32 +-
 .../vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c  |  37 +-
 .../vpu => hantro}/rk3399_vpu_regs.h          |   2 +-
 drivers/staging/media/rockchip/vpu/Kconfig    |  14 -
 drivers/staging/media/rockchip/vpu/Makefile   |  14 -
 .../media/rockchip/vpu/rk3288_vpu_hw.c        | 177 -------
 .../rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c     | 125 -----
 .../rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c    | 261 -----------
 .../media/rockchip/vpu/rk3288_vpu_regs.h      | 443 ------------------
 .../media/rockchip/vpu/rockchip_vpu_hw.h      | 103 ----
 .../media/rockchip/vpu/rockchip_vpu_jpeg.h    |  14 -
 31 files changed, 1574 insertions(+), 1564 deletions(-)
 create mode 100644 drivers/staging/media/hantro/Kconfig
 create mode 100644 drivers/staging/media/hantro/Makefile
 rename drivers/staging/media/{rockchip/vpu => hantro}/TODO (100%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu.h => hantro/hantro.h} (69%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_drv.c => hantro/hantro_drv.c} (74%)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g1_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
 create mode 100644 drivers/staging/media/hantro/hantro_h1_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hw.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_jpeg.c => hantro/hantro_jpeg.c} (95%)
 create mode 100644 drivers/staging/media/hantro/hantro_jpeg.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_mpeg2.c => hantro/hantro_mpeg2.c} (79%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.c => hantro/hantro_v4l2.c} (69%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.h => hantro/hantro_v4l2.h} (53%)
 create mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw.c (69%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c (86%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c (92%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_regs.h (99%)
 delete mode 100644 drivers/staging/media/rockchip/vpu/Kconfig
 delete mode 100644 drivers/staging/media/rockchip/vpu/Makefile
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 429c6c624861..6ffce5f4a964 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13481,11 +13481,11 @@ S:	Maintained
 F:	drivers/media/platform/rockchip/rga/
 F:	Documentation/devicetree/bindings/media/rockchip-rga.txt
 
-ROCKCHIP VPU CODEC DRIVER
+HANTRO VPU CODEC DRIVER
 M:	Ezequiel Garcia <ezequiel@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	drivers/staging/media/platform/rockchip/vpu/
+F:	drivers/staging/media/platform/hantro/
 F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
 
 ROCKER DRIVER
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index f77f5eee7fc2..2957267d698f 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -24,12 +24,12 @@ source "drivers/staging/media/bcm2048/Kconfig"
 
 source "drivers/staging/media/davinci_vpfe/Kconfig"
 
+source "drivers/staging/media/hantro/Kconfig"
+
 source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/omap4iss/Kconfig"
 
-source "drivers/staging/media/rockchip/vpu/Kconfig"
-
 source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-vde/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 99218bfc997f..76f9aa64a669 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -5,6 +5,6 @@ obj-$(CONFIG_VIDEO_DM365_VPFE)	+= davinci_vpfe/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
-obj-$(CONFIG_VIDEO_ROCKCHIP_VPU) += rockchip/vpu/
+obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_SOC_CAMERA)	+= soc_camera/
diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
new file mode 100644
index 000000000000..de77fe6554e7
--- /dev/null
+++ b/drivers/staging/media/hantro/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_HANTRO
+	tristate "Hantro VPU driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on MEDIA_CONTROLLER_REQUEST_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_MEM2MEM_DEV
+	help
+	  Support for the Hantro IP based Video Processing Unit present on
+	  Rockchip SoC, which accelerates video and image encoding and
+	  decoding.
+	  To compile this driver as a module, choose M here: the module
+	  will be called hantro-vpu.
+
+config VIDEO_HANTRO_ROCKCHIP
+	bool "Hantro VPU Rockchip support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	default y
+	help
+	  Enable support for RK3288, RK3328, and RK3399 SoCs.
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
new file mode 100644
index 000000000000..1584acdbf4a3
--- /dev/null
+++ b/drivers/staging/media/hantro/Makefile
@@ -0,0 +1,15 @@
+obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
+
+hantro-vpu-y += \
+		hantro_drv.o \
+		hantro_v4l2.o \
+		hantro_h1_jpeg_enc.o \
+		hantro_g1_mpeg2_dec.o \
+		rk3399_vpu_hw_jpeg_enc.o \
+		rk3399_vpu_hw_mpeg2_dec.o \
+		hantro_jpeg.o \
+		hantro_mpeg2.o
+
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
+		rk3288_vpu_hw.o \
+		rk3399_vpu_hw.o
diff --git a/drivers/staging/media/rockchip/vpu/TODO b/drivers/staging/media/hantro/TODO
similarity index 100%
rename from drivers/staging/media/rockchip/vpu/TODO
rename to drivers/staging/media/hantro/TODO
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h b/drivers/staging/media/hantro/hantro.h
similarity index 69%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu.h
rename to drivers/staging/media/hantro/hantro.h
index 3093821440c0..14e685428203 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright 2018 Google LLC.
  *	Tomasz Figa <tfiga@chromium.org>
@@ -9,8 +9,8 @@
  * Copyright (C) 2011 Samsung Electronics Co., Ltd.
  */
 
-#ifndef ROCKCHIP_VPU_H_
-#define ROCKCHIP_VPU_H_
+#ifndef HANTRO_H_
+#define HANTRO_H_
 
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
@@ -23,9 +23,9 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "rockchip_vpu_hw.h"
+#include "hantro_hw.h"
 
-#define ROCKCHIP_VPU_MAX_CLOCKS		4
+#define HANTRO_MAX_CLOCKS		4
 
 #define MPEG2_MB_DIM			16
 #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
@@ -35,17 +35,17 @@
 #define JPEG_MB_WIDTH(w)		DIV_ROUND_UP(w, JPEG_MB_DIM)
 #define JPEG_MB_HEIGHT(h)		DIV_ROUND_UP(h, JPEG_MB_DIM)
 
-struct rockchip_vpu_ctx;
-struct rockchip_vpu_codec_ops;
+struct hantro_ctx;
+struct hantro_codec_ops;
 
-#define RK_VPU_JPEG_ENCODER	BIT(0)
-#define RK_VPU_ENCODERS		0x0000ffff
+#define HANTRO_JPEG_ENCODER	BIT(0)
+#define HANTRO_ENCODERS		0x0000ffff
 
-#define RK_VPU_MPEG2_DECODER	BIT(16)
-#define RK_VPU_DECODERS		0xffff0000
+#define HANTRO_MPEG2_DECODER	BIT(16)
+#define HANTRO_DECODERS		0xffff0000
 
 /**
- * struct rockchip_vpu_variant - information about VPU hardware variant
+ * struct hantro_variant - information about VPU hardware variant
  *
  * @enc_offset:			Offset from VPU base to encoder registers.
  * @dec_offset:			Offset from VPU base to decoder registers.
@@ -61,48 +61,48 @@ struct rockchip_vpu_codec_ops;
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
  */
-struct rockchip_vpu_variant {
+struct hantro_variant {
 	unsigned int enc_offset;
 	unsigned int dec_offset;
-	const struct rockchip_vpu_fmt *enc_fmts;
+	const struct hantro_fmt *enc_fmts;
 	unsigned int num_enc_fmts;
-	const struct rockchip_vpu_fmt *dec_fmts;
+	const struct hantro_fmt *dec_fmts;
 	unsigned int num_dec_fmts;
 	unsigned int codec;
-	const struct rockchip_vpu_codec_ops *codec_ops;
-	int (*init)(struct rockchip_vpu_dev *vpu);
+	const struct hantro_codec_ops *codec_ops;
+	int (*init)(struct hantro_dev *vpu);
 	irqreturn_t (*vepu_irq)(int irq, void *priv);
 	irqreturn_t (*vdpu_irq)(int irq, void *priv);
-	const char *clk_names[ROCKCHIP_VPU_MAX_CLOCKS];
+	const char *clk_names[HANTRO_MAX_CLOCKS];
 	int num_clocks;
 };
 
 /**
- * enum rockchip_vpu_codec_mode - codec operating mode.
- * @RK_VPU_MODE_NONE:  No operating mode. Used for RAW video formats.
- * @RK_VPU_MODE_JPEG_ENC: JPEG encoder.
- * @RK_VPU_MODE_MPEG2_DEC: MPEG-2 decoder.
+ * enum hantro_codec_mode - codec operating mode.
+ * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
+ * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
+ * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
  */
-enum rockchip_vpu_codec_mode {
-	RK_VPU_MODE_NONE = -1,
-	RK_VPU_MODE_JPEG_ENC,
-	RK_VPU_MODE_MPEG2_DEC,
+enum hantro_codec_mode {
+	HANTRO_MODE_NONE = -1,
+	HANTRO_MODE_JPEG_ENC,
+	HANTRO_MODE_MPEG2_DEC,
 };
 
 /*
- * struct rockchip_vpu_ctrl - helper type to declare supported controls
+ * struct hantro_ctrl - helper type to declare supported controls
  * @id:		V4L2 control ID (V4L2_CID_xxx)
- * @codec:	codec id this control belong to (RK_VPU_JPEG_ENCODER, etc.)
+ * @codec:	codec id this control belong to (HANTRO_JPEG_ENCODER, etc.)
  * @cfg:	control configuration
  */
-struct rockchip_vpu_ctrl {
+struct hantro_ctrl {
 	unsigned int id;
 	unsigned int codec;
 	struct v4l2_ctrl_config cfg;
 };
 
 /*
- * struct rockchip_vpu_func - rockchip VPU functionality
+ * struct hantro_func - Hantro VPU functionality
  *
  * @id:			processing functionality ID (can be
  *			%MEDIA_ENT_F_PROC_VIDEO_ENCODER or
@@ -119,7 +119,7 @@ struct rockchip_vpu_ctrl {
  *
  * Contains everything needed to attach the video device to the media device.
  */
-struct rockchip_vpu_func {
+struct hantro_func {
 	unsigned int id;
 	struct video_device vdev;
 	struct media_pad source_pad;
@@ -130,14 +130,14 @@ struct rockchip_vpu_func {
 	struct media_intf_devnode *intf_devnode;
 };
 
-static inline struct rockchip_vpu_func *
-rockchip_vpu_vdev_to_func(struct video_device *vdev)
+static inline struct hantro_func *
+hantro_vdev_to_func(struct video_device *vdev)
 {
-	return container_of(vdev, struct rockchip_vpu_func, vdev);
+	return container_of(vdev, struct hantro_func, vdev);
 }
 
 /**
- * struct rockchip_vpu_dev - driver data
+ * struct hantro_dev - driver data
  * @v4l2_dev:		V4L2 device to register video devices for.
  * @m2m_dev:		mem2mem device associated to this device.
  * @mdev:		media device associated to this device.
@@ -156,27 +156,27 @@ rockchip_vpu_vdev_to_func(struct video_device *vdev)
  * @variant:		Hardware variant-specific parameters.
  * @watchdog_work:	Delayed work for hardware timeout handling.
  */
-struct rockchip_vpu_dev {
+struct hantro_dev {
 	struct v4l2_device v4l2_dev;
 	struct v4l2_m2m_dev *m2m_dev;
 	struct media_device mdev;
-	struct rockchip_vpu_func *encoder;
-	struct rockchip_vpu_func *decoder;
+	struct hantro_func *encoder;
+	struct hantro_func *decoder;
 	struct platform_device *pdev;
 	struct device *dev;
-	struct clk_bulk_data clocks[ROCKCHIP_VPU_MAX_CLOCKS];
+	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
 	void __iomem *base;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
-	const struct rockchip_vpu_variant *variant;
+	const struct hantro_variant *variant;
 	struct delayed_work watchdog_work;
 };
 
 /**
- * struct rockchip_vpu_ctx - Context (instance) private data.
+ * struct hantro_ctx - Context (instance) private data.
  *
  * @dev:		VPU driver data to which the context belongs.
  * @fh:			V4L2 file handler.
@@ -199,52 +199,52 @@ struct rockchip_vpu_dev {
  * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
  */
-struct rockchip_vpu_ctx {
-	struct rockchip_vpu_dev *dev;
+struct hantro_ctx {
+	struct hantro_dev *dev;
 	struct v4l2_fh fh;
 
 	u32 sequence_cap;
 	u32 sequence_out;
 
-	const struct rockchip_vpu_fmt *vpu_src_fmt;
+	const struct hantro_fmt *vpu_src_fmt;
 	struct v4l2_pix_format_mplane src_fmt;
-	const struct rockchip_vpu_fmt *vpu_dst_fmt;
+	const struct hantro_fmt *vpu_dst_fmt;
 	struct v4l2_pix_format_mplane dst_fmt;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
 
-	int (*buf_finish)(struct rockchip_vpu_ctx *ctx,
+	int (*buf_finish)(struct hantro_ctx *ctx,
 			  struct vb2_buffer *buf,
 			  unsigned int bytesused);
 
-	const struct rockchip_vpu_codec_ops *codec_ops;
+	const struct hantro_codec_ops *codec_ops;
 
 	/* Specific for particular codec modes. */
 	union {
-		struct rockchip_vpu_jpeg_enc_hw_ctx jpeg_enc;
-		struct rockchip_vpu_mpeg2_dec_hw_ctx mpeg2_dec;
+		struct hantro_jpeg_enc_hw_ctx jpeg_enc;
+		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
 	};
 };
 
 /**
- * struct rockchip_vpu_fmt - information about supported video formats.
+ * struct hantro_fmt - information about supported video formats.
  * @name:	Human readable name of the format.
  * @fourcc:	FourCC code of the format. See V4L2_PIX_FMT_*.
  * @codec_mode:	Codec mode related to this format. See
- *		enum rockchip_vpu_codec_mode.
+ *		enum hantro_codec_mode.
  * @header_size: Optional header size. Currently used by JPEG encoder.
  * @max_depth:	Maximum depth, for bitstream formats
  * @enc_fmt:	Format identifier for encoder registers.
  * @frmsize:	Supported range of frame sizes (only for bitstream formats).
  */
-struct rockchip_vpu_fmt {
+struct hantro_fmt {
 	char *name;
 	u32 fourcc;
-	enum rockchip_vpu_codec_mode codec_mode;
+	enum hantro_codec_mode codec_mode;
 	int header_size;
 	int max_depth;
-	enum rockchip_vpu_enc_fmt enc_fmt;
+	enum hantro_enc_fmt enc_fmt;
 	struct v4l2_frmsize_stepwise frmsize;
 };
 
@@ -265,11 +265,11 @@ struct rockchip_vpu_fmt {
  * bit 5 - detail function enter/leave trace information
  * bit 6 - register write/read information
  */
-extern int rockchip_vpu_debug;
+extern int hantro_debug;
 
 #define vpu_debug(level, fmt, args...)				\
 	do {							\
-		if (rockchip_vpu_debug & BIT(level))		\
+		if (hantro_debug & BIT(level))		\
 			pr_info("%s:%d: " fmt,	                \
 				 __func__, __LINE__, ##args);	\
 	} while (0)
@@ -278,26 +278,26 @@ extern int rockchip_vpu_debug;
 	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
 
 /* Structure access helpers. */
-static inline struct rockchip_vpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
+static inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
 {
-	return container_of(fh, struct rockchip_vpu_ctx, fh);
+	return container_of(fh, struct hantro_ctx, fh);
 }
 
 /* Register accessors. */
-static inline void vepu_write_relaxed(struct rockchip_vpu_dev *vpu,
+static inline void vepu_write_relaxed(struct hantro_dev *vpu,
 				      u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
 	writel_relaxed(val, vpu->enc_base + reg);
 }
 
-static inline void vepu_write(struct rockchip_vpu_dev *vpu, u32 val, u32 reg)
+static inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
 	writel(val, vpu->enc_base + reg);
 }
 
-static inline u32 vepu_read(struct rockchip_vpu_dev *vpu, u32 reg)
+static inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->enc_base + reg);
 
@@ -305,20 +305,20 @@ static inline u32 vepu_read(struct rockchip_vpu_dev *vpu, u32 reg)
 	return val;
 }
 
-static inline void vdpu_write_relaxed(struct rockchip_vpu_dev *vpu,
+static inline void vdpu_write_relaxed(struct hantro_dev *vpu,
 				      u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
 	writel_relaxed(val, vpu->dec_base + reg);
 }
 
-static inline void vdpu_write(struct rockchip_vpu_dev *vpu, u32 val, u32 reg)
+static inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
 	writel(val, vpu->dec_base + reg);
 }
 
-static inline u32 vdpu_read(struct rockchip_vpu_dev *vpu, u32 reg)
+static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->dec_base + reg);
 
@@ -326,9 +326,9 @@ static inline u32 vdpu_read(struct rockchip_vpu_dev *vpu, u32 reg)
 	return val;
 }
 
-bool rockchip_vpu_is_encoder_ctx(const struct rockchip_vpu_ctx *ctx);
+bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx);
 
-void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id);
-dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts);
+void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id);
+dma_addr_t hantro_get_ref(struct vb2_queue *q, u64 ts);
 
-#endif /* ROCKCHIP_VPU_H_ */
+#endif /* HANTRO_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/hantro/hantro_drv.c
similarity index 74%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
rename to drivers/staging/media/hantro/hantro_drv.c
index 2e22009b6583..34a646da834b 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Collabora, Ltd.
  * Copyright 2018 Google LLC.
@@ -24,18 +24,18 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include "rockchip_vpu_v4l2.h"
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_hw.h"
+#include "hantro_v4l2.h"
+#include "hantro.h"
+#include "hantro_hw.h"
 
-#define DRIVER_NAME "rockchip-vpu"
+#define DRIVER_NAME "hantro-vpu"
 
-int rockchip_vpu_debug;
-module_param_named(debug, rockchip_vpu_debug, int, 0644);
+int hantro_debug;
+module_param_named(debug, hantro_debug, int, 0644);
 MODULE_PARM_DESC(debug,
 		 "Debug level - higher value produces more verbose messages");
 
-void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id)
+void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id)
 {
 	struct v4l2_ctrl *ctrl;
 
@@ -43,7 +43,7 @@ void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id)
 	return ctrl ? ctrl->p_cur.p : NULL;
 }
 
-dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts)
+dma_addr_t hantro_get_ref(struct vb2_queue *q, u64 ts)
 {
 	int index;
 
@@ -54,9 +54,8 @@ dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts)
 }
 
 static int
-rockchip_vpu_enc_buf_finish(struct rockchip_vpu_ctx *ctx,
-			    struct vb2_buffer *buf,
-			    unsigned int bytesused)
+hantro_enc_buf_finish(struct hantro_ctx *ctx, struct vb2_buffer *buf,
+		      unsigned int bytesused)
 {
 	size_t avail_size;
 
@@ -79,19 +78,18 @@ rockchip_vpu_enc_buf_finish(struct rockchip_vpu_ctx *ctx,
 }
 
 static int
-rockchip_vpu_dec_buf_finish(struct rockchip_vpu_ctx *ctx,
-			    struct vb2_buffer *buf,
-			    unsigned int bytesused)
+hantro_dec_buf_finish(struct hantro_ctx *ctx, struct vb2_buffer *buf,
+		      unsigned int bytesused)
 {
 	/* For decoders set bytesused as per the output picture. */
 	buf->planes[0].bytesused = ctx->dst_fmt.plane_fmt[0].sizeimage;
 	return 0;
 }
 
-static void rockchip_vpu_job_finish(struct rockchip_vpu_dev *vpu,
-				    struct rockchip_vpu_ctx *ctx,
-				    unsigned int bytesused,
-				    enum vb2_buffer_state result)
+static void hantro_job_finish(struct hantro_dev *vpu,
+			      struct hantro_ctx *ctx,
+			      unsigned int bytesused,
+			      enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
@@ -123,11 +121,10 @@ static void rockchip_vpu_job_finish(struct rockchip_vpu_dev *vpu,
 	v4l2_m2m_job_finish(vpu->m2m_dev, ctx->fh.m2m_ctx);
 }
 
-void rockchip_vpu_irq_done(struct rockchip_vpu_dev *vpu,
-			   unsigned int bytesused,
-			   enum vb2_buffer_state result)
+void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
+		     enum vb2_buffer_state result)
 {
-	struct rockchip_vpu_ctx *ctx =
+	struct hantro_ctx *ctx =
 		v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 
 	/*
@@ -136,27 +133,27 @@ void rockchip_vpu_irq_done(struct rockchip_vpu_dev *vpu,
 	 * and will take care of finishing the job.
 	 */
 	if (cancel_delayed_work(&vpu->watchdog_work))
-		rockchip_vpu_job_finish(vpu, ctx, bytesused, result);
+		hantro_job_finish(vpu, ctx, bytesused, result);
 }
 
-void rockchip_vpu_watchdog(struct work_struct *work)
+void hantro_watchdog(struct work_struct *work)
 {
-	struct rockchip_vpu_dev *vpu;
-	struct rockchip_vpu_ctx *ctx;
+	struct hantro_dev *vpu;
+	struct hantro_ctx *ctx;
 
 	vpu = container_of(to_delayed_work(work),
-			   struct rockchip_vpu_dev, watchdog_work);
+			   struct hantro_dev, watchdog_work);
 	ctx = v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 	if (ctx) {
 		vpu_err("frame processing timed out!\n");
 		ctx->codec_ops->reset(ctx);
-		rockchip_vpu_job_finish(vpu, ctx, 0, VB2_BUF_STATE_ERROR);
+		hantro_job_finish(vpu, ctx, 0, VB2_BUF_STATE_ERROR);
 	}
 }
 
 static void device_run(void *priv)
 {
-	struct rockchip_vpu_ctx *ctx = priv;
+	struct hantro_ctx *ctx = priv;
 	int ret;
 
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
@@ -170,12 +167,12 @@ static void device_run(void *priv)
 	return;
 
 err_cancel_job:
-	rockchip_vpu_job_finish(ctx->dev, ctx, 0, VB2_BUF_STATE_ERROR);
+	hantro_job_finish(ctx->dev, ctx, 0, VB2_BUF_STATE_ERROR);
 }
 
-bool rockchip_vpu_is_encoder_ctx(const struct rockchip_vpu_ctx *ctx)
+bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx)
 {
-	return ctx->buf_finish == rockchip_vpu_enc_buf_finish;
+	return ctx->buf_finish == hantro_enc_buf_finish;
 }
 
 static struct v4l2_m2m_ops vpu_m2m_ops = {
@@ -185,13 +182,13 @@ static struct v4l2_m2m_ops vpu_m2m_ops = {
 static int
 queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 {
-	struct rockchip_vpu_ctx *ctx = priv;
+	struct hantro_ctx *ctx = priv;
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
-	src_vq->ops = &rockchip_vpu_queue_ops;
+	src_vq->ops = &hantro_queue_ops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 
 	/*
@@ -218,7 +215,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	 *
 	 * For the DMA destination buffer, we use a bounce buffer.
 	 */
-	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+	if (hantro_is_encoder_ctx(ctx)) {
 		dst_vq->mem_ops = &vb2_vmalloc_memops;
 	} else {
 		dst_vq->bidirectional = true;
@@ -230,7 +227,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
-	dst_vq->ops = &rockchip_vpu_queue_ops;
+	dst_vq->ops = &hantro_queue_ops;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->vpu_mutex;
@@ -239,12 +236,12 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	return vb2_queue_init(dst_vq);
 }
 
-static int rockchip_vpu_s_ctrl(struct v4l2_ctrl *ctrl)
+static int hantro_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct rockchip_vpu_ctx *ctx;
+	struct hantro_ctx *ctx;
 
 	ctx = container_of(ctrl->handler,
-			   struct rockchip_vpu_ctx, ctrl_handler);
+			   struct hantro_ctx, ctrl_handler);
 
 	vpu_debug(1, "s_ctrl: id = %d, val = %d\n", ctrl->id, ctrl->val);
 
@@ -259,14 +256,14 @@ static int rockchip_vpu_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static const struct v4l2_ctrl_ops rockchip_vpu_ctrl_ops = {
-	.s_ctrl = rockchip_vpu_s_ctrl,
+static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
+	.s_ctrl = hantro_s_ctrl,
 };
 
-static struct rockchip_vpu_ctrl controls[] = {
+static struct hantro_ctrl controls[] = {
 	{
 		.id = V4L2_CID_JPEG_COMPRESSION_QUALITY,
-		.codec = RK_VPU_JPEG_ENCODER,
+		.codec = HANTRO_JPEG_ENCODER,
 		.cfg = {
 			.min = 5,
 			.max = 100,
@@ -275,22 +272,22 @@ static struct rockchip_vpu_ctrl controls[] = {
 		},
 	}, {
 		.id = V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
-		.codec = RK_VPU_MPEG2_DECODER,
+		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.elem_size = sizeof(struct v4l2_ctrl_mpeg2_slice_params),
 		},
 	}, {
 		.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
-		.codec = RK_VPU_MPEG2_DECODER,
+		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantization),
 		},
 	},
 };
 
-static int rockchip_vpu_ctrls_setup(struct rockchip_vpu_dev *vpu,
-				    struct rockchip_vpu_ctx *ctx,
-				    int allowed_codecs)
+static int hantro_ctrls_setup(struct hantro_dev *vpu,
+			      struct hantro_ctx *ctx,
+			      int allowed_codecs)
 {
 	int i, num_ctrls = ARRAY_SIZE(controls);
 
@@ -301,7 +298,7 @@ static int rockchip_vpu_ctrls_setup(struct rockchip_vpu_dev *vpu,
 			continue;
 		if (!controls[i].cfg.elem_size) {
 			v4l2_ctrl_new_std(&ctx->ctrl_handler,
-					  &rockchip_vpu_ctrl_ops,
+					  &hantro_ctrl_ops,
 					  controls[i].id, controls[i].cfg.min,
 					  controls[i].cfg.max,
 					  controls[i].cfg.step,
@@ -327,12 +324,12 @@ static int rockchip_vpu_ctrls_setup(struct rockchip_vpu_dev *vpu,
  * V4L2 file operations.
  */
 
-static int rockchip_vpu_open(struct file *filp)
+static int hantro_open(struct file *filp)
 {
-	struct rockchip_vpu_dev *vpu = video_drvdata(filp);
+	struct hantro_dev *vpu = video_drvdata(filp);
 	struct video_device *vdev = video_devdata(filp);
-	struct rockchip_vpu_func *func = rockchip_vpu_vdev_to_func(vdev);
-	struct rockchip_vpu_ctx *ctx;
+	struct hantro_func *func = hantro_vdev_to_func(vdev);
+	struct hantro_ctx *ctx;
 	int allowed_codecs, ret;
 
 	/*
@@ -350,13 +347,13 @@ static int rockchip_vpu_open(struct file *filp)
 
 	ctx->dev = vpu;
 	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
-		allowed_codecs = vpu->variant->codec & RK_VPU_ENCODERS;
-		ctx->buf_finish = rockchip_vpu_enc_buf_finish;
+		allowed_codecs = vpu->variant->codec & HANTRO_ENCODERS;
+		ctx->buf_finish = hantro_enc_buf_finish;
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
 						    queue_init);
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
-		allowed_codecs = vpu->variant->codec & RK_VPU_DECODERS;
-		ctx->buf_finish = rockchip_vpu_dec_buf_finish;
+		allowed_codecs = vpu->variant->codec & HANTRO_DECODERS;
+		ctx->buf_finish = hantro_dec_buf_finish;
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
 						    queue_init);
 	} else {
@@ -372,9 +369,9 @@ static int rockchip_vpu_open(struct file *filp)
 	filp->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
 
-	rockchip_vpu_reset_fmts(ctx);
+	hantro_reset_fmts(ctx);
 
-	ret = rockchip_vpu_ctrls_setup(vpu, ctx, allowed_codecs);
+	ret = hantro_ctrls_setup(vpu, ctx, allowed_codecs);
 	if (ret) {
 		vpu_err("Failed to set up controls\n");
 		goto err_fh_free;
@@ -390,10 +387,10 @@ static int rockchip_vpu_open(struct file *filp)
 	return ret;
 }
 
-static int rockchip_vpu_release(struct file *filp)
+static int hantro_release(struct file *filp)
 {
-	struct rockchip_vpu_ctx *ctx =
-		container_of(filp->private_data, struct rockchip_vpu_ctx, fh);
+	struct hantro_ctx *ctx =
+		container_of(filp->private_data, struct hantro_ctx, fh);
 
 	/*
 	 * No need for extra locking because this was the last reference
@@ -408,29 +405,30 @@ static int rockchip_vpu_release(struct file *filp)
 	return 0;
 }
 
-static const struct v4l2_file_operations rockchip_vpu_fops = {
+static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
-	.open = rockchip_vpu_open,
-	.release = rockchip_vpu_release,
+	.open = hantro_open,
+	.release = hantro_release,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
 };
 
-static const struct of_device_id of_rockchip_vpu_match[] = {
+static const struct of_device_id of_hantro_match[] = {
+#ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
+#endif
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, of_rockchip_vpu_match);
-
-static int rockchip_vpu_register_entity(struct media_device *mdev,
-					struct media_entity *entity,
-					const char *entity_name,
-					struct media_pad *pads, int num_pads,
-					int function,
-					struct video_device *vdev)
+MODULE_DEVICE_TABLE(of, of_hantro_match);
+
+static int hantro_register_entity(struct media_device *mdev,
+				  struct media_entity *entity,
+				  const char *entity_name,
+				  struct media_pad *pads, int num_pads,
+				  int function, struct video_device *vdev)
 {
 	char *name;
 	int ret;
@@ -460,8 +458,8 @@ static int rockchip_vpu_register_entity(struct media_device *mdev,
 	return 0;
 }
 
-static int rockchip_attach_func(struct rockchip_vpu_dev *vpu,
-				struct rockchip_vpu_func *func)
+static int hantro_attach_func(struct hantro_dev *vpu,
+			      struct hantro_func *func)
 {
 	struct media_device *mdev = &vpu->mdev;
 	struct media_link *link;
@@ -469,24 +467,24 @@ static int rockchip_attach_func(struct rockchip_vpu_dev *vpu,
 
 	/* Create the three encoder entities with their pads */
 	func->source_pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = rockchip_vpu_register_entity(mdev, &func->vdev.entity,
-					   "source", &func->source_pad, 1,
-					   MEDIA_ENT_F_IO_V4L, &func->vdev);
+	ret = hantro_register_entity(mdev, &func->vdev.entity, "source",
+				     &func->source_pad, 1, MEDIA_ENT_F_IO_V4L,
+				     &func->vdev);
 	if (ret)
 		return ret;
 
 	func->proc_pads[0].flags = MEDIA_PAD_FL_SINK;
 	func->proc_pads[1].flags = MEDIA_PAD_FL_SOURCE;
-	ret = rockchip_vpu_register_entity(mdev, &func->proc, "proc",
-					   func->proc_pads, 2, func->id,
-					   &func->vdev);
+	ret = hantro_register_entity(mdev, &func->proc, "proc",
+				     func->proc_pads, 2, func->id,
+				     &func->vdev);
 	if (ret)
 		goto err_rel_entity0;
 
 	func->sink_pad.flags = MEDIA_PAD_FL_SINK;
-	ret = rockchip_vpu_register_entity(mdev, &func->sink, "sink",
-					   &func->sink_pad, 1,
-					   MEDIA_ENT_F_IO_V4L, &func->vdev);
+	ret = hantro_register_entity(mdev, &func->sink, "sink",
+				     &func->sink_pad, 1, MEDIA_ENT_F_IO_V4L,
+				     &func->vdev);
 	if (ret)
 		goto err_rel_entity1;
 
@@ -552,7 +550,7 @@ static int rockchip_attach_func(struct rockchip_vpu_dev *vpu,
 	return ret;
 }
 
-static void rockchip_detach_func(struct rockchip_vpu_func *func)
+static void hantro_detach_func(struct hantro_func *func)
 {
 	media_devnode_remove(func->intf_devnode);
 	media_entity_remove_links(&func->sink);
@@ -563,15 +561,14 @@ static void rockchip_detach_func(struct rockchip_vpu_func *func)
 	media_device_unregister_entity(&func->vdev.entity);
 }
 
-static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
-				 unsigned int funcid)
+static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 {
 	const struct of_device_id *match;
-	struct rockchip_vpu_func *func;
+	struct hantro_func *func;
 	struct video_device *vfd;
 	int ret;
 
-	match = of_match_node(of_rockchip_vpu_match, vpu->dev->of_node);
+	match = of_match_node(of_hantro_match, vpu->dev->of_node);
 	func = devm_kzalloc(vpu->dev, sizeof(*func), GFP_KERNEL);
 	if (!func) {
 		v4l2_err(&vpu->v4l2_dev, "Failed to allocate video device\n");
@@ -581,13 +578,13 @@ static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
 	func->id = funcid;
 
 	vfd = &func->vdev;
-	vfd->fops = &rockchip_vpu_fops;
+	vfd->fops = &hantro_fops;
 	vfd->release = video_device_release_empty;
 	vfd->lock = &vpu->vpu_mutex;
 	vfd->v4l2_dev = &vpu->v4l2_dev;
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
-	vfd->ioctl_ops = &rockchip_vpu_ioctl_ops;
+	vfd->ioctl_ops = &hantro_ioctl_ops;
 	snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
 		 funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "enc" : "dec");
 
@@ -604,7 +601,7 @@ static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
 		return ret;
 	}
 
-	ret = rockchip_attach_func(vpu, func);
+	ret = hantro_attach_func(vpu, func);
 	if (ret) {
 		v4l2_err(&vpu->v4l2_dev,
 			 "Failed to attach functionality to the media device\n");
@@ -620,26 +617,26 @@ static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
 	return ret;
 }
 
-static int rockchip_vpu_add_enc_func(struct rockchip_vpu_dev *vpu)
+static int hantro_add_enc_func(struct hantro_dev *vpu)
 {
 	if (!vpu->variant->enc_fmts)
 		return 0;
 
-	return rockchip_vpu_add_func(vpu, MEDIA_ENT_F_PROC_VIDEO_ENCODER);
+	return hantro_add_func(vpu, MEDIA_ENT_F_PROC_VIDEO_ENCODER);
 }
 
-static int rockchip_vpu_add_dec_func(struct rockchip_vpu_dev *vpu)
+static int hantro_add_dec_func(struct hantro_dev *vpu)
 {
 	if (!vpu->variant->dec_fmts)
 		return 0;
 
-	return rockchip_vpu_add_func(vpu, MEDIA_ENT_F_PROC_VIDEO_DECODER);
+	return hantro_add_func(vpu, MEDIA_ENT_F_PROC_VIDEO_DECODER);
 }
 
-static void rockchip_vpu_remove_func(struct rockchip_vpu_dev *vpu,
-				     unsigned int funcid)
+static void hantro_remove_func(struct hantro_dev *vpu,
+			       unsigned int funcid)
 {
-	struct rockchip_vpu_func *func;
+	struct hantro_func *func;
 
 	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER)
 		func = vpu->encoder;
@@ -649,29 +646,29 @@ static void rockchip_vpu_remove_func(struct rockchip_vpu_dev *vpu,
 	if (!func)
 		return;
 
-	rockchip_detach_func(func);
+	hantro_detach_func(func);
 	video_unregister_device(&func->vdev);
 }
 
-static void rockchip_vpu_remove_enc_func(struct rockchip_vpu_dev *vpu)
+static void hantro_remove_enc_func(struct hantro_dev *vpu)
 {
-	rockchip_vpu_remove_func(vpu, MEDIA_ENT_F_PROC_VIDEO_ENCODER);
+	hantro_remove_func(vpu, MEDIA_ENT_F_PROC_VIDEO_ENCODER);
 }
 
-static void rockchip_vpu_remove_dec_func(struct rockchip_vpu_dev *vpu)
+static void hantro_remove_dec_func(struct hantro_dev *vpu)
 {
-	rockchip_vpu_remove_func(vpu, MEDIA_ENT_F_PROC_VIDEO_DECODER);
+	hantro_remove_func(vpu, MEDIA_ENT_F_PROC_VIDEO_DECODER);
 }
 
-static const struct media_device_ops rockchip_m2m_media_ops = {
+static const struct media_device_ops hantro_m2m_media_ops = {
 	.req_validate = vb2_request_validate,
 	.req_queue = v4l2_m2m_request_queue,
 };
 
-static int rockchip_vpu_probe(struct platform_device *pdev)
+static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
-	struct rockchip_vpu_dev *vpu;
+	struct hantro_dev *vpu;
 	struct resource *res;
 	int i, ret;
 
@@ -684,10 +681,10 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	mutex_init(&vpu->vpu_mutex);
 	spin_lock_init(&vpu->irqlock);
 
-	match = of_match_node(of_rockchip_vpu_match, pdev->dev.of_node);
+	match = of_match_node(of_hantro_match, pdev->dev.of_node);
 	vpu->variant = match->data;
 
-	INIT_DELAYED_WORK(&vpu->watchdog_work, rockchip_vpu_watchdog);
+	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
 	for (i = 0; i < vpu->variant->num_clocks; i++)
 		vpu->clocks[i].id = vpu->variant->clk_names[i];
@@ -778,16 +775,16 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	strscpy(vpu->mdev.bus_info, "platform: " DRIVER_NAME,
 		sizeof(vpu->mdev.model));
 	media_device_init(&vpu->mdev);
-	vpu->mdev.ops = &rockchip_m2m_media_ops;
+	vpu->mdev.ops = &hantro_m2m_media_ops;
 	vpu->v4l2_dev.mdev = &vpu->mdev;
 
-	ret = rockchip_vpu_add_enc_func(vpu);
+	ret = hantro_add_enc_func(vpu);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register encoder\n");
 		goto err_m2m_rel;
 	}
 
-	ret = rockchip_vpu_add_dec_func(vpu);
+	ret = hantro_add_dec_func(vpu);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register decoder\n");
 		goto err_rm_enc_func;
@@ -802,9 +799,9 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	return 0;
 
 err_rm_dec_func:
-	rockchip_vpu_remove_dec_func(vpu);
+	hantro_remove_dec_func(vpu);
 err_rm_enc_func:
-	rockchip_vpu_remove_enc_func(vpu);
+	hantro_remove_enc_func(vpu);
 err_m2m_rel:
 	media_device_cleanup(&vpu->mdev);
 	v4l2_m2m_release(vpu->m2m_dev);
@@ -817,15 +814,15 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_vpu_remove(struct platform_device *pdev)
+static int hantro_remove(struct platform_device *pdev)
 {
-	struct rockchip_vpu_dev *vpu = platform_get_drvdata(pdev);
+	struct hantro_dev *vpu = platform_get_drvdata(pdev);
 
 	v4l2_info(&vpu->v4l2_dev, "Removing %s\n", pdev->name);
 
 	media_device_unregister(&vpu->mdev);
-	rockchip_vpu_remove_dec_func(vpu);
-	rockchip_vpu_remove_enc_func(vpu);
+	hantro_remove_dec_func(vpu);
+	hantro_remove_enc_func(vpu);
 	media_device_cleanup(&vpu->mdev);
 	v4l2_m2m_release(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
@@ -835,24 +832,24 @@ static int rockchip_vpu_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct dev_pm_ops rockchip_vpu_pm_ops = {
+static const struct dev_pm_ops hantro_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
 
-static struct platform_driver rockchip_vpu_driver = {
-	.probe = rockchip_vpu_probe,
-	.remove = rockchip_vpu_remove,
+static struct platform_driver hantro_driver = {
+	.probe = hantro_probe,
+	.remove = hantro_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
-		   .of_match_table = of_match_ptr(of_rockchip_vpu_match),
-		   .pm = &rockchip_vpu_pm_ops,
+		   .of_match_table = of_match_ptr(of_hantro_match),
+		   .pm = &hantro_pm_ops,
 	},
 };
-module_platform_driver(rockchip_vpu_driver);
+module_platform_driver(hantro_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Alpha Lin <Alpha.Lin@Rock-Chips.com>");
 MODULE_AUTHOR("Tomasz Figa <tfiga@chromium.org>");
 MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
-MODULE_DESCRIPTION("Rockchip VPU codec driver");
+MODULE_DESCRIPTION("Hantro VPU codec driver");
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
new file mode 100644
index 000000000000..e592c1b66375
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ */
+
+#include <asm/unaligned.h>
+#include <linux/bitfield.h>
+#include <media/v4l2-mem2mem.h>
+#include "hantro.h"
+#include "hantro_hw.h"
+
+#define G1_SWREG(nr)			((nr) * 4)
+
+#define G1_REG_RLC_VLC_BASE		G1_SWREG(12)
+#define G1_REG_DEC_OUT_BASE		G1_SWREG(13)
+#define G1_REG_REFER0_BASE		G1_SWREG(14)
+#define G1_REG_REFER1_BASE		G1_SWREG(15)
+#define G1_REG_REFER2_BASE		G1_SWREG(16)
+#define G1_REG_REFER3_BASE		G1_SWREG(17)
+#define G1_REG_QTABLE_BASE		G1_SWREG(40)
+#define G1_REG_DEC_E(v)			((v) ? BIT(0) : 0)
+
+#define G1_REG_DEC_AXI_RD_ID(v)		(((v) << 24) & GENMASK(31, 24))
+#define G1_REG_DEC_TIMEOUT_E(v)		((v) ? BIT(23) : 0)
+#define G1_REG_DEC_STRSWAP32_E(v)	((v) ? BIT(22) : 0)
+#define G1_REG_DEC_STRENDIAN_E(v)	((v) ? BIT(21) : 0)
+#define G1_REG_DEC_INSWAP32_E(v)	((v) ? BIT(20) : 0)
+#define G1_REG_DEC_OUTSWAP32_E(v)	((v) ? BIT(19) : 0)
+#define G1_REG_DEC_DATA_DISC_E(v)	((v) ? BIT(18) : 0)
+#define G1_REG_DEC_LATENCY(v)		(((v) << 11) & GENMASK(16, 11))
+#define G1_REG_DEC_CLK_GATE_E(v)	((v) ? BIT(10) : 0)
+#define G1_REG_DEC_IN_ENDIAN(v)		((v) ? BIT(9) : 0)
+#define G1_REG_DEC_OUT_ENDIAN(v)	((v) ? BIT(8) : 0)
+#define G1_REG_DEC_ADV_PRE_DIS(v)	((v) ? BIT(6) : 0)
+#define G1_REG_DEC_SCMD_DIS(v)		((v) ? BIT(5) : 0)
+#define G1_REG_DEC_MAX_BURST(v)		(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_DEC_MODE(v)		(((v) << 28) & GENMASK(31, 28))
+#define G1_REG_RLC_MODE_E(v)		((v) ? BIT(27) : 0)
+#define G1_REG_PIC_INTERLACE_E(v)	((v) ? BIT(23) : 0)
+#define G1_REG_PIC_FIELDMODE_E(v)	((v) ? BIT(22) : 0)
+#define G1_REG_PIC_B_E(v)		((v) ? BIT(21) : 0)
+#define G1_REG_PIC_INTER_E(v)		((v) ? BIT(20) : 0)
+#define G1_REG_PIC_TOPFIELD_E(v)	((v) ? BIT(19) : 0)
+#define G1_REG_FWD_INTERLACE_E(v)	((v) ? BIT(18) : 0)
+#define G1_REG_FILTERING_DIS(v)		((v) ? BIT(14) : 0)
+#define G1_REG_WRITE_MVS_E(v)		((v) ? BIT(12) : 0)
+#define G1_REG_DEC_AXI_WR_ID(v)		(((v) << 0) & GENMASK(7, 0))
+
+#define G1_REG_PIC_MB_WIDTH(v)		(((v) << 23) & GENMASK(31, 23))
+#define G1_REG_PIC_MB_HEIGHT_P(v)	(((v) << 11) & GENMASK(18, 11))
+#define G1_REG_ALT_SCAN_E(v)		((v) ? BIT(6) : 0)
+#define G1_REG_TOPFIELDFIRST_E(v)	((v) ? BIT(5) : 0)
+
+#define G1_REG_STRM_START_BIT(v)	(((v) << 26) & GENMASK(31, 26))
+#define G1_REG_QSCALE_TYPE(v)		((v) ? BIT(24) : 0)
+#define G1_REG_CON_MV_E(v)		((v) ? BIT(4) : 0)
+#define G1_REG_INTRA_DC_PREC(v)		(((v) << 2) & GENMASK(3, 2))
+#define G1_REG_INTRA_VLC_TAB(v)		((v) ? BIT(1) : 0)
+#define G1_REG_FRAME_PRED_DCT(v)	((v) ? BIT(0) : 0)
+
+#define G1_REG_INIT_QP(v)		(((v) << 25) & GENMASK(30, 25))
+#define G1_REG_STREAM_LEN(v)		(((v) << 0) & GENMASK(23, 0))
+
+#define G1_REG_ALT_SCAN_FLAG_E(v)	((v) ? BIT(19) : 0)
+#define G1_REG_FCODE_FWD_HOR(v)		(((v) << 15) & GENMASK(18, 15))
+#define G1_REG_FCODE_FWD_VER(v)		(((v) << 11) & GENMASK(14, 11))
+#define G1_REG_FCODE_BWD_HOR(v)		(((v) << 7) & GENMASK(10, 7))
+#define G1_REG_FCODE_BWD_VER(v)		(((v) << 3) & GENMASK(6, 3))
+#define G1_REG_MV_ACCURACY_FWD(v)	((v) ? BIT(2) : 0)
+#define G1_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
+
+#define G1_REG_STARTMB_X(v)		(((v) << 23) & GENMASK(31, 23))
+#define G1_REG_STARTMB_Y(v)		(((v) << 15) & GENMASK(22, 15))
+
+#define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
+
+#define PICT_TOP_FIELD     1
+#define PICT_BOTTOM_FIELD  2
+#define PICT_FRAME         3
+
+static void
+hantro_g1_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
+				     struct hantro_ctx *ctx)
+{
+	struct v4l2_ctrl_mpeg2_quantization *quantization;
+
+	quantization = hantro_get_ctrl(ctx,
+				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
+				     quantization);
+	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
+			   G1_REG_QTABLE_BASE);
+}
+
+static void
+hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
+				struct vb2_buffer *src_buf,
+				struct vb2_buffer *dst_buf,
+				const struct v4l2_mpeg2_sequence *sequence,
+				const struct v4l2_mpeg2_picture *picture,
+				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
+{
+	dma_addr_t forward_addr = 0, backward_addr = 0;
+	dma_addr_t current_addr, addr;
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+
+	switch (picture->picture_coding_type) {
+	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+		backward_addr = hantro_get_ref(vq,
+					       slice_params->backward_ref_ts);
+		/* fall-through */
+	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+		forward_addr = hantro_get_ref(vq,
+					      slice_params->forward_ref_ts);
+	}
+
+	/* Source bitstream buffer */
+	addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+	vdpu_write_relaxed(vpu, addr, G1_REG_RLC_VLC_BASE);
+
+	/* Destination frame buffer */
+	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	current_addr = addr;
+
+	if (picture->picture_structure == PICT_BOTTOM_FIELD)
+		addr += ALIGN(ctx->dst_fmt.width, 16);
+	vdpu_write_relaxed(vpu, addr, G1_REG_DEC_OUT_BASE);
+
+	if (!forward_addr)
+		forward_addr = current_addr;
+	if (!backward_addr)
+		backward_addr = current_addr;
+
+	/* Set forward ref frame (top/bottom field) */
+	if (picture->picture_structure == PICT_FRAME ||
+	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
+	    (picture->picture_structure == PICT_TOP_FIELD &&
+	     picture->top_field_first) ||
+	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
+	     !picture->top_field_first)) {
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
+	} else if (picture->picture_structure == PICT_TOP_FIELD) {
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
+		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER1_BASE);
+	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
+		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER0_BASE);
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
+	}
+
+	/* Set backward ref frame (top/bottom field) */
+	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER2_BASE);
+	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER3_BASE);
+}
+
+void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
+	const struct v4l2_mpeg2_sequence *sequence;
+	const struct v4l2_mpeg2_picture *picture;
+	u32 reg;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	/* Apply request controls if any */
+	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
+				&ctx->ctrl_handler);
+
+	slice_params = hantro_get_ctrl(ctx,
+				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+	sequence = &slice_params->sequence;
+	picture = &slice_params->picture;
+
+	reg = G1_REG_DEC_AXI_RD_ID(0) |
+	      G1_REG_DEC_TIMEOUT_E(1) |
+	      G1_REG_DEC_STRSWAP32_E(1) |
+	      G1_REG_DEC_STRENDIAN_E(1) |
+	      G1_REG_DEC_INSWAP32_E(1) |
+	      G1_REG_DEC_OUTSWAP32_E(1) |
+	      G1_REG_DEC_DATA_DISC_E(0) |
+	      G1_REG_DEC_LATENCY(0) |
+	      G1_REG_DEC_CLK_GATE_E(1) |
+	      G1_REG_DEC_IN_ENDIAN(1) |
+	      G1_REG_DEC_OUT_ENDIAN(1) |
+	      G1_REG_DEC_ADV_PRE_DIS(0) |
+	      G1_REG_DEC_SCMD_DIS(0) |
+	      G1_REG_DEC_MAX_BURST(16);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(2));
+
+	reg = G1_REG_DEC_MODE(5) |
+	      G1_REG_RLC_MODE_E(0) |
+	      G1_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
+	      G1_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
+	      G1_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
+	      G1_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
+	      G1_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
+	      G1_REG_FWD_INTERLACE_E(0) |
+	      G1_REG_FILTERING_DIS(1) |
+	      G1_REG_WRITE_MVS_E(0) |
+	      G1_REG_DEC_AXI_WR_ID(0);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(3));
+
+	reg = G1_REG_PIC_MB_WIDTH(MPEG2_MB_WIDTH(ctx->dst_fmt.width)) |
+	      G1_REG_PIC_MB_HEIGHT_P(MPEG2_MB_HEIGHT(ctx->dst_fmt.height)) |
+	      G1_REG_ALT_SCAN_E(picture->alternate_scan) |
+	      G1_REG_TOPFIELDFIRST_E(picture->top_field_first);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
+
+	reg = G1_REG_STRM_START_BIT(slice_params->data_bit_offset) |
+	      G1_REG_QSCALE_TYPE(picture->q_scale_type) |
+	      G1_REG_CON_MV_E(picture->concealment_motion_vectors) |
+	      G1_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
+	      G1_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
+	      G1_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
+
+	reg = G1_REG_INIT_QP(1) |
+	      G1_REG_STREAM_LEN(slice_params->bit_size >> 3);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
+
+	reg = G1_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
+	      G1_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
+	      G1_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
+	      G1_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
+	      G1_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
+	      G1_REG_MV_ACCURACY_FWD(1) |
+	      G1_REG_MV_ACCURACY_BWD(1);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(18));
+
+	reg = G1_REG_STARTMB_X(0) |
+	      G1_REG_STARTMB_Y(0);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(48));
+
+	reg = G1_REG_APF_THRESHOLD(8);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(55));
+
+	hantro_g1_mpeg2_dec_set_quantization(vpu, ctx);
+
+	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
+					&dst_buf->vb2_buf,
+					sequence, picture, slice_params);
+
+	/* Controls no longer in-use, we can complete them */
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->ctrl_handler);
+
+	/* Kick the watchdog and start decoding */
+	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
+
+	reg = G1_REG_DEC_E(1);
+	vdpu_write(vpu, reg, G1_SWREG(1));
+}
diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
new file mode 100644
index 000000000000..5c0ea7994336
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -0,0 +1,301 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright 2018 Google LLC.
+ *	Tomasz Figa <tfiga@chromium.org>
+ */
+
+#ifndef HANTRO_G1_REGS_H_
+#define HANTRO_G1_REGS_H_
+
+/* Decoder registers. */
+#define G1_REG_INTERRUPT				0x004
+#define     G1_REG_INTERRUPT_DEC_PIC_INF		BIT(24)
+#define     G1_REG_INTERRUPT_DEC_TIMEOUT		BIT(18)
+#define     G1_REG_INTERRUPT_DEC_SLICE_INT		BIT(17)
+#define     G1_REG_INTERRUPT_DEC_ERROR_INT		BIT(16)
+#define     G1_REG_INTERRUPT_DEC_ASO_INT		BIT(15)
+#define     G1_REG_INTERRUPT_DEC_BUFFER_INT		BIT(14)
+#define     G1_REG_INTERRUPT_DEC_BUS_INT		BIT(13)
+#define     G1_REG_INTERRUPT_DEC_RDY_INT		BIT(12)
+#define     G1_REG_INTERRUPT_DEC_IRQ			BIT(8)
+#define     G1_REG_INTERRUPT_DEC_IRQ_DIS		BIT(4)
+#define     G1_REG_INTERRUPT_DEC_E			BIT(0)
+#define G1_REG_CONFIG					0x008
+#define     G1_REG_CONFIG_DEC_AXI_RD_ID(x)		(((x) & 0xff) << 24)
+#define     G1_REG_CONFIG_DEC_TIMEOUT_E			BIT(23)
+#define     G1_REG_CONFIG_DEC_STRSWAP32_E		BIT(22)
+#define     G1_REG_CONFIG_DEC_STRENDIAN_E		BIT(21)
+#define     G1_REG_CONFIG_DEC_INSWAP32_E		BIT(20)
+#define     G1_REG_CONFIG_DEC_OUTSWAP32_E		BIT(19)
+#define     G1_REG_CONFIG_DEC_DATA_DISC_E		BIT(18)
+#define     G1_REG_CONFIG_TILED_MODE_MSB		BIT(17)
+#define     G1_REG_CONFIG_DEC_OUT_TILED_E		BIT(17)
+#define     G1_REG_CONFIG_DEC_LATENCY(x)		(((x) & 0x3f) << 11)
+#define     G1_REG_CONFIG_DEC_CLK_GATE_E		BIT(10)
+#define     G1_REG_CONFIG_DEC_IN_ENDIAN			BIT(9)
+#define     G1_REG_CONFIG_DEC_OUT_ENDIAN		BIT(8)
+#define     G1_REG_CONFIG_PRIORITY_MODE(x)		(((x) & 0x7) << 5)
+#define     G1_REG_CONFIG_TILED_MODE_LSB		BIT(7)
+#define     G1_REG_CONFIG_DEC_ADV_PRE_DIS		BIT(6)
+#define     G1_REG_CONFIG_DEC_SCMD_DIS			BIT(5)
+#define     G1_REG_CONFIG_DEC_MAX_BURST(x)		(((x) & 0x1f) << 0)
+#define G1_REG_DEC_CTRL0				0x00c
+#define     G1_REG_DEC_CTRL0_DEC_MODE(x)		(((x) & 0xf) << 28)
+#define     G1_REG_DEC_CTRL0_RLC_MODE_E			BIT(27)
+#define     G1_REG_DEC_CTRL0_SKIP_MODE			BIT(26)
+#define     G1_REG_DEC_CTRL0_DIVX3_E			BIT(25)
+#define     G1_REG_DEC_CTRL0_PJPEG_E			BIT(24)
+#define     G1_REG_DEC_CTRL0_PIC_INTERLACE_E		BIT(23)
+#define     G1_REG_DEC_CTRL0_PIC_FIELDMODE_E		BIT(22)
+#define     G1_REG_DEC_CTRL0_PIC_B_E			BIT(21)
+#define     G1_REG_DEC_CTRL0_PIC_INTER_E		BIT(20)
+#define     G1_REG_DEC_CTRL0_PIC_TOPFIELD_E		BIT(19)
+#define     G1_REG_DEC_CTRL0_FWD_INTERLACE_E		BIT(18)
+#define     G1_REG_DEC_CTRL0_SORENSON_E			BIT(17)
+#define     G1_REG_DEC_CTRL0_REF_TOPFIELD_E		BIT(16)
+#define     G1_REG_DEC_CTRL0_DEC_OUT_DIS		BIT(15)
+#define     G1_REG_DEC_CTRL0_FILTERING_DIS		BIT(14)
+#define     G1_REG_DEC_CTRL0_WEBP_E			BIT(13)
+#define     G1_REG_DEC_CTRL0_MVC_E			BIT(13)
+#define     G1_REG_DEC_CTRL0_PIC_FIXED_QUANT		BIT(13)
+#define     G1_REG_DEC_CTRL0_WRITE_MVS_E		BIT(12)
+#define     G1_REG_DEC_CTRL0_REFTOPFIRST_E		BIT(11)
+#define     G1_REG_DEC_CTRL0_SEQ_MBAFF_E		BIT(10)
+#define     G1_REG_DEC_CTRL0_PICORD_COUNT_E		BIT(9)
+#define     G1_REG_DEC_CTRL0_DEC_AHB_HLOCK_E		BIT(8)
+#define     G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(x)		(((x) & 0xff) << 0)
+#define G1_REG_DEC_CTRL1				0x010
+#define     G1_REG_DEC_CTRL1_PIC_MB_WIDTH(x)		(((x) & 0x1ff) << 23)
+#define     G1_REG_DEC_CTRL1_MB_WIDTH_OFF(x)		(((x) & 0xf) << 19)
+#define     G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(x)		(((x) & 0xff) << 11)
+#define     G1_REG_DEC_CTRL1_MB_HEIGHT_OFF(x)		(((x) & 0xf) << 7)
+#define     G1_REG_DEC_CTRL1_ALT_SCAN_E			BIT(6)
+#define     G1_REG_DEC_CTRL1_TOPFIELDFIRST_E		BIT(5)
+#define     G1_REG_DEC_CTRL1_REF_FRAMES(x)		(((x) & 0x1f) << 0)
+#define     G1_REG_DEC_CTRL1_PIC_MB_W_EXT(x)		(((x) & 0x7) << 3)
+#define     G1_REG_DEC_CTRL1_PIC_MB_H_EXT(x)		(((x) & 0x7) << 0)
+#define     G1_REG_DEC_CTRL1_PIC_REFER_FLAG		BIT(0)
+#define G1_REG_DEC_CTRL2				0x014
+#define     G1_REG_DEC_CTRL2_STRM_START_BIT(x)		(((x) & 0x3f) << 26)
+#define     G1_REG_DEC_CTRL2_SYNC_MARKER_E		BIT(25)
+#define     G1_REG_DEC_CTRL2_TYPE1_QUANT_E		BIT(24)
+#define     G1_REG_DEC_CTRL2_CH_QP_OFFSET(x)		(((x) & 0x1f) << 19)
+#define     G1_REG_DEC_CTRL2_CH_QP_OFFSET2(x)		(((x) & 0x1f) << 14)
+#define     G1_REG_DEC_CTRL2_FIELDPIC_FLAG_E		BIT(0)
+#define     G1_REG_DEC_CTRL2_INTRADC_VLC_THR(x)		(((x) & 0x7) << 16)
+#define     G1_REG_DEC_CTRL2_VOP_TIME_INCR(x)		(((x) & 0xffff) << 0)
+#define     G1_REG_DEC_CTRL2_DQ_PROFILE			BIT(24)
+#define     G1_REG_DEC_CTRL2_DQBI_LEVEL			BIT(23)
+#define     G1_REG_DEC_CTRL2_RANGE_RED_FRM_E		BIT(22)
+#define     G1_REG_DEC_CTRL2_FAST_UVMC_E		BIT(20)
+#define     G1_REG_DEC_CTRL2_TRANSDCTAB			BIT(17)
+#define     G1_REG_DEC_CTRL2_TRANSACFRM(x)		(((x) & 0x3) << 15)
+#define     G1_REG_DEC_CTRL2_TRANSACFRM2(x)		(((x) & 0x3) << 13)
+#define     G1_REG_DEC_CTRL2_MB_MODE_TAB(x)		(((x) & 0x7) << 10)
+#define     G1_REG_DEC_CTRL2_MVTAB(x)			(((x) & 0x7) << 7)
+#define     G1_REG_DEC_CTRL2_CBPTAB(x)			(((x) & 0x7) << 4)
+#define     G1_REG_DEC_CTRL2_2MV_BLK_PAT_TAB(x)		(((x) & 0x3) << 2)
+#define     G1_REG_DEC_CTRL2_4MV_BLK_PAT_TAB(x)		(((x) & 0x3) << 0)
+#define     G1_REG_DEC_CTRL2_QSCALE_TYPE		BIT(24)
+#define     G1_REG_DEC_CTRL2_CON_MV_E			BIT(4)
+#define     G1_REG_DEC_CTRL2_INTRA_DC_PREC(x)		(((x) & 0x3) << 2)
+#define     G1_REG_DEC_CTRL2_INTRA_VLC_TAB		BIT(1)
+#define     G1_REG_DEC_CTRL2_FRAME_PRED_DCT		BIT(0)
+#define     G1_REG_DEC_CTRL2_JPEG_QTABLES(x)		(((x) & 0x3) << 11)
+#define     G1_REG_DEC_CTRL2_JPEG_MODE(x)		(((x) & 0x7) << 8)
+#define     G1_REG_DEC_CTRL2_JPEG_FILRIGHT_E		BIT(7)
+#define     G1_REG_DEC_CTRL2_JPEG_STREAM_ALL		BIT(6)
+#define     G1_REG_DEC_CTRL2_CR_AC_VLCTABLE		BIT(5)
+#define     G1_REG_DEC_CTRL2_CB_AC_VLCTABLE		BIT(4)
+#define     G1_REG_DEC_CTRL2_CR_DC_VLCTABLE		BIT(3)
+#define     G1_REG_DEC_CTRL2_CB_DC_VLCTABLE		BIT(2)
+#define     G1_REG_DEC_CTRL2_CR_DC_VLCTABLE3		BIT(1)
+#define     G1_REG_DEC_CTRL2_CB_DC_VLCTABLE3		BIT(0)
+#define     G1_REG_DEC_CTRL2_STRM1_START_BIT(x)		(((x) & 0x3f) << 18)
+#define     G1_REG_DEC_CTRL2_HUFFMAN_E			BIT(17)
+#define     G1_REG_DEC_CTRL2_MULTISTREAM_E		BIT(16)
+#define     G1_REG_DEC_CTRL2_BOOLEAN_VALUE(x)		(((x) & 0xff) << 8)
+#define     G1_REG_DEC_CTRL2_BOOLEAN_RANGE(x)		(((x) & 0xff) << 0)
+#define     G1_REG_DEC_CTRL2_ALPHA_OFFSET(x)		(((x) & 0x1f) << 5)
+#define     G1_REG_DEC_CTRL2_BETA_OFFSET(x)		(((x) & 0x1f) << 0)
+#define G1_REG_DEC_CTRL3				0x018
+#define     G1_REG_DEC_CTRL3_START_CODE_E		BIT(31)
+#define     G1_REG_DEC_CTRL3_INIT_QP(x)			(((x) & 0x3f) << 25)
+#define     G1_REG_DEC_CTRL3_CH_8PIX_ILEAV_E		BIT(24)
+#define     G1_REG_DEC_CTRL3_STREAM_LEN_EXT(x)		(((x) & 0xff) << 24)
+#define     G1_REG_DEC_CTRL3_STREAM_LEN(x)		(((x) & 0xffffff) << 0)
+#define G1_REG_DEC_CTRL4				0x01c
+#define     G1_REG_DEC_CTRL4_CABAC_E			BIT(31)
+#define     G1_REG_DEC_CTRL4_BLACKWHITE_E		BIT(30)
+#define     G1_REG_DEC_CTRL4_DIR_8X8_INFER_E		BIT(29)
+#define     G1_REG_DEC_CTRL4_WEIGHT_PRED_E		BIT(28)
+#define     G1_REG_DEC_CTRL4_WEIGHT_BIPR_IDC(x)		(((x) & 0x3) << 26)
+#define     G1_REG_DEC_CTRL4_AVS_H264_H_EXT		BIT(25)
+#define     G1_REG_DEC_CTRL4_FRAMENUM_LEN(x)		(((x) & 0x1f) << 16)
+#define     G1_REG_DEC_CTRL4_FRAMENUM(x)		(((x) & 0xffff) << 0)
+#define     G1_REG_DEC_CTRL4_BITPLANE0_E		BIT(31)
+#define     G1_REG_DEC_CTRL4_BITPLANE1_E		BIT(30)
+#define     G1_REG_DEC_CTRL4_BITPLANE2_E		BIT(29)
+#define     G1_REG_DEC_CTRL4_ALT_PQUANT(x)		(((x) & 0x1f) << 24)
+#define     G1_REG_DEC_CTRL4_DQ_EDGES(x)		(((x) & 0xf) << 20)
+#define     G1_REG_DEC_CTRL4_TTMBF			BIT(19)
+#define     G1_REG_DEC_CTRL4_PQINDEX(x)			(((x) & 0x1f) << 14)
+#define     G1_REG_DEC_CTRL4_VC1_HEIGHT_EXT		BIT(13)
+#define     G1_REG_DEC_CTRL4_BILIN_MC_E			BIT(12)
+#define     G1_REG_DEC_CTRL4_UNIQP_E			BIT(11)
+#define     G1_REG_DEC_CTRL4_HALFQP_E			BIT(10)
+#define     G1_REG_DEC_CTRL4_TTFRM(x)			(((x) & 0x3) << 8)
+#define     G1_REG_DEC_CTRL4_2ND_BYTE_EMUL_E		BIT(7)
+#define     G1_REG_DEC_CTRL4_DQUANT_E			BIT(6)
+#define     G1_REG_DEC_CTRL4_VC1_ADV_E			BIT(5)
+#define     G1_REG_DEC_CTRL4_PJPEG_FILDOWN_E		BIT(26)
+#define     G1_REG_DEC_CTRL4_PJPEG_WDIV8		BIT(25)
+#define     G1_REG_DEC_CTRL4_PJPEG_HDIV8		BIT(24)
+#define     G1_REG_DEC_CTRL4_PJPEG_AH(x)		(((x) & 0xf) << 20)
+#define     G1_REG_DEC_CTRL4_PJPEG_AL(x)		(((x) & 0xf) << 16)
+#define     G1_REG_DEC_CTRL4_PJPEG_SS(x)		(((x) & 0xff) << 8)
+#define     G1_REG_DEC_CTRL4_PJPEG_SE(x)		(((x) & 0xff) << 0)
+#define     G1_REG_DEC_CTRL4_DCT1_START_BIT(x)		(((x) & 0x3f) << 26)
+#define     G1_REG_DEC_CTRL4_DCT2_START_BIT(x)		(((x) & 0x3f) << 20)
+#define     G1_REG_DEC_CTRL4_CH_MV_RES			BIT(13)
+#define     G1_REG_DEC_CTRL4_INIT_DC_MATCH0(x)		(((x) & 0x7) << 9)
+#define     G1_REG_DEC_CTRL4_INIT_DC_MATCH1(x)		(((x) & 0x7) << 6)
+#define     G1_REG_DEC_CTRL4_VP7_VERSION		BIT(5)
+#define G1_REG_DEC_CTRL5				0x020
+#define     G1_REG_DEC_CTRL5_CONST_INTRA_E		BIT(31)
+#define     G1_REG_DEC_CTRL5_FILT_CTRL_PRES		BIT(30)
+#define     G1_REG_DEC_CTRL5_RDPIC_CNT_PRES		BIT(29)
+#define     G1_REG_DEC_CTRL5_8X8TRANS_FLAG_E		BIT(28)
+#define     G1_REG_DEC_CTRL5_REFPIC_MK_LEN(x)		(((x) & 0x7ff) << 17)
+#define     G1_REG_DEC_CTRL5_IDR_PIC_E			BIT(16)
+#define     G1_REG_DEC_CTRL5_IDR_PIC_ID(x)		(((x) & 0xffff) << 0)
+#define     G1_REG_DEC_CTRL5_MV_SCALEFACTOR(x)		(((x) & 0xff) << 24)
+#define     G1_REG_DEC_CTRL5_REF_DIST_FWD(x)		(((x) & 0x1f) << 19)
+#define     G1_REG_DEC_CTRL5_REF_DIST_BWD(x)		(((x) & 0x1f) << 14)
+#define     G1_REG_DEC_CTRL5_LOOP_FILT_LIMIT(x)		(((x) & 0xf) << 14)
+#define     G1_REG_DEC_CTRL5_VARIANCE_TEST_E		BIT(13)
+#define     G1_REG_DEC_CTRL5_MV_THRESHOLD(x)		(((x) & 0x7) << 10)
+#define     G1_REG_DEC_CTRL5_VAR_THRESHOLD(x)		(((x) & 0x3ff) << 0)
+#define     G1_REG_DEC_CTRL5_DIVX_IDCT_E		BIT(8)
+#define     G1_REG_DEC_CTRL5_DIVX3_SLICE_SIZE(x)	(((x) & 0xff) << 0)
+#define     G1_REG_DEC_CTRL5_PJPEG_REST_FREQ(x)		(((x) & 0xffff) << 0)
+#define     G1_REG_DEC_CTRL5_RV_PROFILE(x)		(((x) & 0x3) << 30)
+#define     G1_REG_DEC_CTRL5_RV_OSV_QUANT(x)		(((x) & 0x3) << 28)
+#define     G1_REG_DEC_CTRL5_RV_FWD_SCALE(x)		(((x) & 0x3fff) << 14)
+#define     G1_REG_DEC_CTRL5_RV_BWD_SCALE(x)		(((x) & 0x3fff) << 0)
+#define     G1_REG_DEC_CTRL5_INIT_DC_COMP0(x)		(((x) & 0xffff) << 16)
+#define     G1_REG_DEC_CTRL5_INIT_DC_COMP1(x)		(((x) & 0xffff) << 0)
+#define G1_REG_DEC_CTRL6				0x024
+#define     G1_REG_DEC_CTRL6_PPS_ID(x)			(((x) & 0xff) << 24)
+#define     G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(x)		(((x) & 0x1f) << 19)
+#define     G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(x)		(((x) & 0x1f) << 14)
+#define     G1_REG_DEC_CTRL6_POC_LENGTH(x)		(((x) & 0xff) << 0)
+#define     G1_REG_DEC_CTRL6_ICOMP0_E			BIT(24)
+#define     G1_REG_DEC_CTRL6_ISCALE0(x)			(((x) & 0xff) << 16)
+#define     G1_REG_DEC_CTRL6_ISHIFT0(x)			(((x) & 0xffff) << 0)
+#define     G1_REG_DEC_CTRL6_STREAM1_LEN(x)		(((x) & 0xffffff) << 0)
+#define     G1_REG_DEC_CTRL6_PIC_SLICE_AM(x)		(((x) & 0x1fff) << 0)
+#define     G1_REG_DEC_CTRL6_COEFFS_PART_AM(x)		(((x) & 0xf) << 24)
+#define G1_REG_FWD_PIC(i)				(0x028 + ((i) * 0x4))
+#define     G1_REG_FWD_PIC_PINIT_RLIST_F5(x)		(((x) & 0x1f) << 25)
+#define     G1_REG_FWD_PIC_PINIT_RLIST_F4(x)		(((x) & 0x1f) << 20)
+#define     G1_REG_FWD_PIC_PINIT_RLIST_F3(x)		(((x) & 0x1f) << 15)
+#define     G1_REG_FWD_PIC_PINIT_RLIST_F2(x)		(((x) & 0x1f) << 10)
+#define     G1_REG_FWD_PIC_PINIT_RLIST_F1(x)		(((x) & 0x1f) << 5)
+#define     G1_REG_FWD_PIC_PINIT_RLIST_F0(x)		(((x) & 0x1f) << 0)
+#define     G1_REG_FWD_PIC1_ICOMP1_E			BIT(24)
+#define     G1_REG_FWD_PIC1_ISCALE1(x)			(((x) & 0xff) << 16)
+#define     G1_REG_FWD_PIC1_ISHIFT1(x)			(((x) & 0xffff) << 0)
+#define     G1_REG_FWD_PIC1_SEGMENT_BASE(x)		((x) << 0)
+#define     G1_REG_FWD_PIC1_SEGMENT_UPD_E		BIT(1)
+#define     G1_REG_FWD_PIC1_SEGMENT_E			BIT(0)
+#define G1_REG_DEC_CTRL7				0x02c
+#define     G1_REG_DEC_CTRL7_PINIT_RLIST_F15(x)		(((x) & 0x1f) << 25)
+#define     G1_REG_DEC_CTRL7_PINIT_RLIST_F14(x)		(((x) & 0x1f) << 20)
+#define     G1_REG_DEC_CTRL7_PINIT_RLIST_F13(x)		(((x) & 0x1f) << 15)
+#define     G1_REG_DEC_CTRL7_PINIT_RLIST_F12(x)		(((x) & 0x1f) << 10)
+#define     G1_REG_DEC_CTRL7_PINIT_RLIST_F11(x)		(((x) & 0x1f) << 5)
+#define     G1_REG_DEC_CTRL7_PINIT_RLIST_F10(x)		(((x) & 0x1f) << 0)
+#define     G1_REG_DEC_CTRL7_ICOMP2_E			BIT(24)
+#define     G1_REG_DEC_CTRL7_ISCALE2(x)			(((x) & 0xff) << 16)
+#define     G1_REG_DEC_CTRL7_ISHIFT2(x)			(((x) & 0xffff) << 0)
+#define     G1_REG_DEC_CTRL7_DCT3_START_BIT(x)		(((x) & 0x3f) << 24)
+#define     G1_REG_DEC_CTRL7_DCT4_START_BIT(x)		(((x) & 0x3f) << 18)
+#define     G1_REG_DEC_CTRL7_DCT5_START_BIT(x)		(((x) & 0x3f) << 12)
+#define     G1_REG_DEC_CTRL7_DCT6_START_BIT(x)		(((x) & 0x3f) << 6)
+#define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
+#define G1_REG_ADDR_STR					0x030
+#define G1_REG_ADDR_DST					0x034
+#define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
+#define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
+#define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
+#define G1_REG_REF_PIC(i)				(0x078 + ((i) * 0x4))
+#define     G1_REG_REF_PIC_FILT_TYPE_E			BIT(31)
+#define     G1_REG_REF_PIC_FILT_SHARPNESS(x)		(((x) & 0x7) << 28)
+#define     G1_REG_REF_PIC_MB_ADJ_0(x)			(((x) & 0x7f) << 21)
+#define     G1_REG_REF_PIC_MB_ADJ_1(x)			(((x) & 0x7f) << 14)
+#define     G1_REG_REF_PIC_MB_ADJ_2(x)			(((x) & 0x7f) << 7)
+#define     G1_REG_REF_PIC_MB_ADJ_3(x)			(((x) & 0x7f) << 0)
+#define     G1_REG_REF_PIC_REFER1_NBR(x)		(((x) & 0xffff) << 16)
+#define     G1_REG_REF_PIC_REFER0_NBR(x)		(((x) & 0xffff) << 0)
+#define     G1_REG_REF_PIC_LF_LEVEL_0(x)		(((x) & 0x3f) << 18)
+#define     G1_REG_REF_PIC_LF_LEVEL_1(x)		(((x) & 0x3f) << 12)
+#define     G1_REG_REF_PIC_LF_LEVEL_2(x)		(((x) & 0x3f) << 6)
+#define     G1_REG_REF_PIC_LF_LEVEL_3(x)		(((x) & 0x3f) << 0)
+#define     G1_REG_REF_PIC_QUANT_DELTA_0(x)		(((x) & 0x1f) << 27)
+#define     G1_REG_REF_PIC_QUANT_DELTA_1(x)		(((x) & 0x1f) << 22)
+#define     G1_REG_REF_PIC_QUANT_0(x)			(((x) & 0x7ff) << 11)
+#define     G1_REG_REF_PIC_QUANT_1(x)			(((x) & 0x7ff) << 0)
+#define G1_REG_LT_REF					0x098
+#define G1_REG_VALID_REF				0x09c
+#define G1_REG_ADDR_QTABLE				0x0a0
+#define G1_REG_ADDR_DIR_MV				0x0a4
+#define G1_REG_BD_REF_PIC(i)				(0x0a8 + ((i) * 0x4))
+#define     G1_REG_BD_REF_PIC_BINIT_RLIST_B2(x)		(((x) & 0x1f) << 25)
+#define     G1_REG_BD_REF_PIC_BINIT_RLIST_F2(x)		(((x) & 0x1f) << 20)
+#define     G1_REG_BD_REF_PIC_BINIT_RLIST_B1(x)		(((x) & 0x1f) << 15)
+#define     G1_REG_BD_REF_PIC_BINIT_RLIST_F1(x)		(((x) & 0x1f) << 10)
+#define     G1_REG_BD_REF_PIC_BINIT_RLIST_B0(x)		(((x) & 0x1f) << 5)
+#define     G1_REG_BD_REF_PIC_BINIT_RLIST_F0(x)		(((x) & 0x1f) << 0)
+#define     G1_REG_BD_REF_PIC_PRED_TAP_2_M1(x)		(((x) & 0x3) << 10)
+#define     G1_REG_BD_REF_PIC_PRED_TAP_2_4(x)		(((x) & 0x3) << 8)
+#define     G1_REG_BD_REF_PIC_PRED_TAP_4_M1(x)		(((x) & 0x3) << 6)
+#define     G1_REG_BD_REF_PIC_PRED_TAP_4_4(x)		(((x) & 0x3) << 4)
+#define     G1_REG_BD_REF_PIC_PRED_TAP_6_M1(x)		(((x) & 0x3) << 2)
+#define     G1_REG_BD_REF_PIC_PRED_TAP_6_4(x)		(((x) & 0x3) << 0)
+#define     G1_REG_BD_REF_PIC_QUANT_DELTA_2(x)		(((x) & 0x1f) << 27)
+#define     G1_REG_BD_REF_PIC_QUANT_DELTA_3(x)		(((x) & 0x1f) << 22)
+#define     G1_REG_BD_REF_PIC_QUANT_2(x)		(((x) & 0x7ff) << 11)
+#define     G1_REG_BD_REF_PIC_QUANT_3(x)		(((x) & 0x7ff) << 0)
+#define G1_REG_BD_P_REF_PIC				0x0bc
+#define     G1_REG_BD_P_REF_PIC_QUANT_DELTA_4(x)	(((x) & 0x1f) << 27)
+#define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(x)	(((x) & 0x1f) << 25)
+#define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(x)	(((x) & 0x1f) << 20)
+#define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F1(x)	(((x) & 0x1f) << 15)
+#define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(x)	(((x) & 0x1f) << 10)
+#define     G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(x)	(((x) & 0x1f) << 5)
+#define     G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(x)	(((x) & 0x1f) << 0)
+#define G1_REG_ERR_CONC					0x0c0
+#define     G1_REG_ERR_CONC_STARTMB_X(x)		(((x) & 0x1ff) << 23)
+#define     G1_REG_ERR_CONC_STARTMB_Y(x)		(((x) & 0xff) << 15)
+#define G1_REG_PRED_FLT					0x0c4
+#define     G1_REG_PRED_FLT_PRED_BC_TAP_0_0(x)		(((x) & 0x3ff) << 22)
+#define     G1_REG_PRED_FLT_PRED_BC_TAP_0_1(x)		(((x) & 0x3ff) << 12)
+#define     G1_REG_PRED_FLT_PRED_BC_TAP_0_2(x)		(((x) & 0x3ff) << 2)
+#define G1_REG_REF_BUF_CTRL				0x0cc
+#define     G1_REG_REF_BUF_CTRL_REFBU_E			BIT(31)
+#define     G1_REG_REF_BUF_CTRL_REFBU_THR(x)		(((x) & 0xfff) << 19)
+#define     G1_REG_REF_BUF_CTRL_REFBU_PICID(x)		(((x) & 0x1f) << 14)
+#define     G1_REG_REF_BUF_CTRL_REFBU_EVAL_E		BIT(13)
+#define     G1_REG_REF_BUF_CTRL_REFBU_FPARMOD_E		BIT(12)
+#define     G1_REG_REF_BUF_CTRL_REFBU_Y_OFFSET(x)	(((x) & 0x1ff) << 0)
+#define G1_REG_REF_BUF_CTRL2				0x0dc
+#define     G1_REG_REF_BUF_CTRL2_REFBU2_BUF_E		BIT(31)
+#define     G1_REG_REF_BUF_CTRL2_REFBU2_THR(x)		(((x) & 0xfff) << 19)
+#define     G1_REG_REF_BUF_CTRL2_REFBU2_PICID(x)	(((x) & 0x1f) << 14)
+#define     G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
+#define G1_REG_SOFT_RESET				0x194
+
+#endif /* HANTRO_G1_REGS_H_ */
diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
new file mode 100644
index 000000000000..0c1e3043dc7e
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ */
+
+#include <asm/unaligned.h>
+#include <media/v4l2-mem2mem.h>
+#include "hantro_jpeg.h"
+#include "hantro.h"
+#include "hantro_v4l2.h"
+#include "hantro_hw.h"
+#include "hantro_h1_regs.h"
+
+#define H1_JPEG_QUANT_TABLE_COUNT 16
+
+static void hantro_h1_set_src_img_ctrl(struct hantro_dev *vpu,
+				       struct hantro_ctx *ctx)
+{
+	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
+	u32 reg;
+
+	reg = H1_REG_IN_IMG_CTRL_ROW_LEN(pix_fmt->width)
+		| H1_REG_IN_IMG_CTRL_OVRFLR_D4(0)
+		| H1_REG_IN_IMG_CTRL_OVRFLB_D4(0)
+		| H1_REG_IN_IMG_CTRL_FMT(ctx->vpu_src_fmt->enc_fmt);
+	vepu_write_relaxed(vpu, reg, H1_REG_IN_IMG_CTRL);
+}
+
+static void hantro_h1_jpeg_enc_set_buffers(struct hantro_dev *vpu,
+					   struct hantro_ctx *ctx,
+					   struct vb2_buffer *src_buf)
+{
+	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
+	dma_addr_t src[3];
+
+	WARN_ON(pix_fmt->num_planes > 3);
+
+	vepu_write_relaxed(vpu, ctx->jpeg_enc.bounce_buffer.dma,
+			   H1_REG_ADDR_OUTPUT_STREAM);
+	vepu_write_relaxed(vpu, ctx->jpeg_enc.bounce_buffer.size,
+			   H1_REG_STR_BUF_LIMIT);
+
+	if (pix_fmt->num_planes == 1) {
+		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+		/* single plane formats we supported are all interlaced */
+		vepu_write_relaxed(vpu, src[0], H1_REG_ADDR_IN_PLANE_0);
+	} else if (pix_fmt->num_planes == 2) {
+		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
+		vepu_write_relaxed(vpu, src[0], H1_REG_ADDR_IN_PLANE_0);
+		vepu_write_relaxed(vpu, src[1], H1_REG_ADDR_IN_PLANE_1);
+	} else {
+		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
+		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
+		vepu_write_relaxed(vpu, src[0], H1_REG_ADDR_IN_PLANE_0);
+		vepu_write_relaxed(vpu, src[1], H1_REG_ADDR_IN_PLANE_1);
+		vepu_write_relaxed(vpu, src[2], H1_REG_ADDR_IN_PLANE_2);
+	}
+}
+
+static void
+hantro_h1_jpeg_enc_set_qtable(struct hantro_dev *vpu,
+			      unsigned char *luma_qtable,
+			      unsigned char *chroma_qtable)
+{
+	u32 reg, i;
+
+	for (i = 0; i < H1_JPEG_QUANT_TABLE_COUNT; i++) {
+		reg = get_unaligned_be32(&luma_qtable[i]);
+		vepu_write_relaxed(vpu, reg, H1_REG_JPEG_LUMA_QUAT(i));
+
+		reg = get_unaligned_be32(&chroma_qtable[i]);
+		vepu_write_relaxed(vpu, reg, H1_REG_JPEG_CHROMA_QUAT(i));
+	}
+}
+
+void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct hantro_jpeg_ctx jpeg_ctx;
+	u32 reg;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
+	jpeg_ctx.buffer = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
+	jpeg_ctx.width = ctx->dst_fmt.width;
+	jpeg_ctx.height = ctx->dst_fmt.height;
+	jpeg_ctx.quality = ctx->jpeg_quality;
+	hantro_jpeg_header_assemble(&jpeg_ctx);
+
+	/* Switch to JPEG encoder mode before writing registers */
+	vepu_write_relaxed(vpu, H1_REG_ENC_CTRL_ENC_MODE_JPEG,
+			   H1_REG_ENC_CTRL);
+
+	hantro_h1_set_src_img_ctrl(vpu, ctx);
+	hantro_h1_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
+	hantro_h1_jpeg_enc_set_qtable(vpu,
+				      hantro_jpeg_get_qtable(&jpeg_ctx, 0),
+				      hantro_jpeg_get_qtable(&jpeg_ctx, 1));
+
+	reg = H1_REG_AXI_CTRL_OUTPUT_SWAP16
+		| H1_REG_AXI_CTRL_INPUT_SWAP16
+		| H1_REG_AXI_CTRL_BURST_LEN(16)
+		| H1_REG_AXI_CTRL_OUTPUT_SWAP32
+		| H1_REG_AXI_CTRL_INPUT_SWAP32
+		| H1_REG_AXI_CTRL_OUTPUT_SWAP8
+		| H1_REG_AXI_CTRL_INPUT_SWAP8;
+	/* Make sure that all registers are written at this point. */
+	vepu_write(vpu, reg, H1_REG_AXI_CTRL);
+
+	reg = H1_REG_ENC_CTRL_WIDTH(JPEG_MB_WIDTH(ctx->src_fmt.width))
+		| H1_REG_ENC_CTRL_HEIGHT(JPEG_MB_HEIGHT(ctx->src_fmt.height))
+		| H1_REG_ENC_CTRL_ENC_MODE_JPEG
+		| H1_REG_ENC_PIC_INTRA
+		| H1_REG_ENC_CTRL_EN_BIT;
+	/* Kick the watchdog and start encoding */
+	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
+	vepu_write(vpu, reg, H1_REG_ENC_CTRL);
+}
diff --git a/drivers/staging/media/hantro/hantro_h1_regs.h b/drivers/staging/media/hantro/hantro_h1_regs.h
new file mode 100644
index 000000000000..d6e9825bb5c7
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_h1_regs.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright 2018 Google LLC.
+ *	Tomasz Figa <tfiga@chromium.org>
+ */
+
+#ifndef HANTRO_H1_REGS_H_
+#define HANTRO_H1_REGS_H_
+
+/* Encoder registers. */
+#define H1_REG_INTERRUPT				0x004
+#define     H1_REG_INTERRUPT_FRAME_RDY			BIT(2)
+#define     H1_REG_INTERRUPT_DIS_BIT			BIT(1)
+#define     H1_REG_INTERRUPT_BIT			BIT(0)
+#define H1_REG_AXI_CTRL					0x008
+#define     H1_REG_AXI_CTRL_OUTPUT_SWAP16		BIT(15)
+#define     H1_REG_AXI_CTRL_INPUT_SWAP16		BIT(14)
+#define     H1_REG_AXI_CTRL_BURST_LEN(x)		((x) << 8)
+#define     H1_REG_AXI_CTRL_GATE_BIT			BIT(4)
+#define     H1_REG_AXI_CTRL_OUTPUT_SWAP32		BIT(3)
+#define     H1_REG_AXI_CTRL_INPUT_SWAP32		BIT(2)
+#define     H1_REG_AXI_CTRL_OUTPUT_SWAP8		BIT(1)
+#define     H1_REG_AXI_CTRL_INPUT_SWAP8			BIT(0)
+#define H1_REG_ADDR_OUTPUT_STREAM			0x014
+#define H1_REG_ADDR_OUTPUT_CTRL				0x018
+#define H1_REG_ADDR_REF_LUMA				0x01c
+#define H1_REG_ADDR_REF_CHROMA				0x020
+#define H1_REG_ADDR_REC_LUMA				0x024
+#define H1_REG_ADDR_REC_CHROMA				0x028
+#define H1_REG_ADDR_IN_PLANE_0				0x02c
+#define H1_REG_ADDR_IN_PLANE_1				0x030
+#define H1_REG_ADDR_IN_PLANE_2				0x034
+#define H1_REG_ENC_CTRL					0x038
+#define     H1_REG_ENC_CTRL_TIMEOUT_EN			BIT(31)
+#define     H1_REG_ENC_CTRL_NAL_MODE_BIT		BIT(29)
+#define     H1_REG_ENC_CTRL_WIDTH(w)			((w) << 19)
+#define     H1_REG_ENC_CTRL_HEIGHT(h)			((h) << 10)
+#define     H1_REG_ENC_PIC_INTER			(0x0 << 3)
+#define     H1_REG_ENC_PIC_INTRA			(0x1 << 3)
+#define     H1_REG_ENC_PIC_MVCINTER			(0x2 << 3)
+#define     H1_REG_ENC_CTRL_ENC_MODE_H264		(0x3 << 1)
+#define     H1_REG_ENC_CTRL_ENC_MODE_JPEG		(0x2 << 1)
+#define     H1_REG_ENC_CTRL_ENC_MODE_VP8		(0x1 << 1)
+#define     H1_REG_ENC_CTRL_EN_BIT			BIT(0)
+#define H1_REG_IN_IMG_CTRL				0x03c
+#define     H1_REG_IN_IMG_CTRL_ROW_LEN(x)		((x) << 12)
+#define     H1_REG_IN_IMG_CTRL_OVRFLR_D4(x)		((x) << 10)
+#define     H1_REG_IN_IMG_CTRL_OVRFLB_D4(x)		((x) << 6)
+#define     H1_REG_IN_IMG_CTRL_FMT(x)			((x) << 2)
+#define H1_REG_ENC_CTRL0				0x040
+#define    H1_REG_ENC_CTRL0_INIT_QP(x)			((x) << 26)
+#define    H1_REG_ENC_CTRL0_SLICE_ALPHA(x)		((x) << 22)
+#define    H1_REG_ENC_CTRL0_SLICE_BETA(x)		((x) << 18)
+#define    H1_REG_ENC_CTRL0_CHROMA_QP_OFFSET(x)		((x) << 13)
+#define    H1_REG_ENC_CTRL0_FILTER_DIS(x)		((x) << 5)
+#define    H1_REG_ENC_CTRL0_IDR_PICID(x)		((x) << 1)
+#define    H1_REG_ENC_CTRL0_CONSTR_INTRA_PRED		BIT(0)
+#define H1_REG_ENC_CTRL1				0x044
+#define    H1_REG_ENC_CTRL1_PPS_ID(x)			((x) << 24)
+#define    H1_REG_ENC_CTRL1_INTRA_PRED_MODE(x)		((x) << 16)
+#define    H1_REG_ENC_CTRL1_FRAME_NUM(x)		((x))
+#define H1_REG_ENC_CTRL2				0x048
+#define    H1_REG_ENC_CTRL2_DEBLOCKING_FILETER_MODE(x)	((x) << 30)
+#define    H1_REG_ENC_CTRL2_H264_SLICE_SIZE(x)		((x) << 23)
+#define    H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV	BIT(22)
+#define    H1_REG_ENC_CTRL2_TRANS8X8_MODE_EN		BIT(21)
+#define    H1_REG_ENC_CTRL2_CABAC_INIT_IDC(x)		((x) << 19)
+#define    H1_REG_ENC_CTRL2_ENTROPY_CODING_MODE		BIT(18)
+#define    H1_REG_ENC_CTRL2_H264_INTER4X4_MODE		BIT(17)
+#define    H1_REG_ENC_CTRL2_H264_STREAM_MODE		BIT(16)
+#define    H1_REG_ENC_CTRL2_INTRA16X16_MODE(x)		((x))
+#define H1_REG_ENC_CTRL3				0x04c
+#define    H1_REG_ENC_CTRL3_MUTIMV_EN			BIT(30)
+#define    H1_REG_ENC_CTRL3_MV_PENALTY_1_4P(x)		((x) << 20)
+#define    H1_REG_ENC_CTRL3_MV_PENALTY_4P(x)		((x) << 10)
+#define    H1_REG_ENC_CTRL3_MV_PENALTY_1P(x)		((x))
+#define H1_REG_ENC_CTRL4				0x050
+#define    H1_REG_ENC_CTRL4_MV_PENALTY_16X8_8X16(x)	((x) << 20)
+#define    H1_REG_ENC_CTRL4_MV_PENALTY_8X8(x)		((x) << 10)
+#define    H1_REG_ENC_CTRL4_8X4_4X8(x)			((x))
+#define H1_REG_ENC_CTRL5				0x054
+#define    H1_REG_ENC_CTRL5_MACROBLOCK_PENALTY(x)	((x) << 24)
+#define    H1_REG_ENC_CTRL5_COMPLETE_SLICES(x)		((x) << 16)
+#define    H1_REG_ENC_CTRL5_INTER_MODE(x)		((x))
+#define H1_REG_STR_HDR_REM_MSB				0x058
+#define H1_REG_STR_HDR_REM_LSB				0x05c
+#define H1_REG_STR_BUF_LIMIT				0x060
+#define H1_REG_MAD_CTRL					0x064
+#define    H1_REG_MAD_CTRL_QP_ADJUST(x)			((x) << 28)
+#define    H1_REG_MAD_CTRL_MAD_THREDHOLD(x)		((x) << 22)
+#define    H1_REG_MAD_CTRL_QP_SUM_DIV2(x)		((x))
+#define H1_REG_ADDR_VP8_PROB_CNT			0x068
+#define H1_REG_QP_VAL					0x06c
+#define    H1_REG_QP_VAL_LUM(x)				((x) << 26)
+#define    H1_REG_QP_VAL_MAX(x)				((x) << 20)
+#define    H1_REG_QP_VAL_MIN(x)				((x) << 14)
+#define    H1_REG_QP_VAL_CHECKPOINT_DISTAN(x)		((x))
+#define H1_REG_VP8_QP_VAL(i)				(0x06c + ((i) * 0x4))
+#define H1_REG_CHECKPOINT(i)				(0x070 + ((i) * 0x4))
+#define     H1_REG_CHECKPOINT_CHECK0(x)			(((x) & 0xffff))
+#define     H1_REG_CHECKPOINT_CHECK1(x)			(((x) & 0xffff) << 16)
+#define     H1_REG_CHECKPOINT_RESULT(x)			((((x) >> (16 - 16 \
+							 * (i & 1))) & 0xffff) \
+							 * 32)
+#define H1_REG_CHKPT_WORD_ERR(i)			(0x084 + ((i) * 0x4))
+#define     H1_REG_CHKPT_WORD_ERR_CHK0(x)		(((x) & 0xffff))
+#define     H1_REG_CHKPT_WORD_ERR_CHK1(x)		(((x) & 0xffff) << 16)
+#define H1_REG_VP8_BOOL_ENC				0x08c
+#define H1_REG_CHKPT_DELTA_QP				0x090
+#define     H1_REG_CHKPT_DELTA_QP_CHK0(x)		(((x) & 0x0f) << 0)
+#define     H1_REG_CHKPT_DELTA_QP_CHK1(x)		(((x) & 0x0f) << 4)
+#define     H1_REG_CHKPT_DELTA_QP_CHK2(x)		(((x) & 0x0f) << 8)
+#define     H1_REG_CHKPT_DELTA_QP_CHK3(x)		(((x) & 0x0f) << 12)
+#define     H1_REG_CHKPT_DELTA_QP_CHK4(x)		(((x) & 0x0f) << 16)
+#define     H1_REG_CHKPT_DELTA_QP_CHK5(x)		(((x) & 0x0f) << 20)
+#define     H1_REG_CHKPT_DELTA_QP_CHK6(x)		(((x) & 0x0f) << 24)
+#define H1_REG_VP8_CTRL0				0x090
+#define H1_REG_RLC_CTRL					0x094
+#define     H1_REG_RLC_CTRL_STR_OFFS_SHIFT		23
+#define     H1_REG_RLC_CTRL_STR_OFFS_MASK		(0x3f << 23)
+#define     H1_REG_RLC_CTRL_RLC_SUM(x)			((x))
+#define H1_REG_MB_CTRL					0x098
+#define     H1_REG_MB_CNT_OUT(x)			(((x) & 0xffff))
+#define     H1_REG_MB_CNT_SET(x)			(((x) & 0xffff) << 16)
+#define H1_REG_ADDR_NEXT_PIC				0x09c
+#define	H1_REG_JPEG_LUMA_QUAT(i)			(0x100 + ((i) * 0x4))
+#define	H1_REG_JPEG_CHROMA_QUAT(i)			(0x140 + ((i) * 0x4))
+#define H1_REG_STABILIZATION_OUTPUT			0x0A0
+#define H1_REG_ADDR_CABAC_TBL				0x0cc
+#define H1_REG_ADDR_MV_OUT				0x0d0
+#define H1_REG_RGB_YUV_COEFF(i)				(0x0d4 + ((i) * 0x4))
+#define H1_REG_RGB_MASK_MSB				0x0dc
+#define H1_REG_INTRA_AREA_CTRL				0x0e0
+#define H1_REG_CIR_INTRA_CTRL				0x0e4
+#define H1_REG_INTRA_SLICE_BITMAP(i)			(0x0e8 + ((i) * 0x4))
+#define H1_REG_ADDR_VP8_DCT_PART(i)			(0x0e8 + ((i) * 0x4))
+#define H1_REG_FIRST_ROI_AREA				0x0f0
+#define H1_REG_SECOND_ROI_AREA				0x0f4
+#define H1_REG_MVC_CTRL					0x0f8
+#define	H1_REG_MVC_CTRL_MV16X16_FAVOR(x)		((x) << 28)
+#define H1_REG_VP8_INTRA_PENALTY(i)			(0x100 + ((i) * 0x4))
+#define H1_REG_ADDR_VP8_SEG_MAP				0x11c
+#define H1_REG_VP8_SEG_QP(i)				(0x120 + ((i) * 0x4))
+#define H1_REG_DMV_4P_1P_PENALTY(i)			(0x180 + ((i) * 0x4))
+#define     H1_REG_DMV_4P_1P_PENALTY_BIT(x, i)		((x) << (i) * 8)
+#define H1_REG_DMV_QPEL_PENALTY(i)			(0x200 + ((i) * 0x4))
+#define     H1_REG_DMV_QPEL_PENALTY_BIT(x, i)		((x) << (i) * 8)
+#define H1_REG_VP8_CTRL1				0x280
+#define H1_REG_VP8_BIT_COST_GOLDEN			0x284
+#define H1_REG_VP8_LOOP_FLT_DELTA(i)			(0x288 + ((i) * 0x4))
+
+#endif /* HANTRO_H1_REGS_H_ */
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
new file mode 100644
index 000000000000..3c361c2e9b88
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright 2018 Google LLC.
+ *	Tomasz Figa <tfiga@chromium.org>
+ */
+
+#ifndef HANTRO_HW_H_
+#define HANTRO_HW_H_
+
+#include <linux/interrupt.h>
+#include <linux/v4l2-controls.h>
+#include <media/mpeg2-ctrls.h>
+#include <media/videobuf2-core.h>
+
+struct hantro_dev;
+struct hantro_ctx;
+struct hantro_buf;
+struct hantro_variant;
+
+/**
+ * struct hantro_aux_buf - auxiliary DMA buffer for hardware data
+ * @cpu:	CPU pointer to the buffer.
+ * @dma:	DMA address of the buffer.
+ * @size:	Size of the buffer.
+ */
+struct hantro_aux_buf {
+	void *cpu;
+	dma_addr_t dma;
+	size_t size;
+};
+
+/**
+ * struct hantro_jpeg_enc_hw_ctx
+ * @bounce_buffer:	Bounce buffer
+ */
+struct hantro_jpeg_enc_hw_ctx {
+	struct hantro_aux_buf bounce_buffer;
+};
+
+/**
+ * struct hantro_mpeg2_dec_hw_ctx
+ * @qtable:		Quantization table
+ */
+struct hantro_mpeg2_dec_hw_ctx {
+	struct hantro_aux_buf qtable;
+};
+
+/**
+ * struct hantro_codec_ops - codec mode specific operations
+ *
+ * @init:	If needed, can be used for initialization.
+ *		Optional and called from process context.
+ * @exit:	If needed, can be used to undo the .init phase.
+ *		Optional and called from process context.
+ * @run:	Start single {en,de)coding job. Called from atomic context
+ *		to indicate that a pair of buffers is ready and the hardware
+ *		should be programmed and started.
+ * @done:	Read back processing results and additional data from hardware.
+ * @reset:	Reset the hardware in case of a timeout.
+ */
+struct hantro_codec_ops {
+	int (*init)(struct hantro_ctx *ctx);
+	void (*exit)(struct hantro_ctx *ctx);
+	void (*run)(struct hantro_ctx *ctx);
+	void (*done)(struct hantro_ctx *ctx, enum vb2_buffer_state);
+	void (*reset)(struct hantro_ctx *ctx);
+};
+
+/**
+ * enum hantro_enc_fmt - source format ID for hardware registers.
+ */
+enum hantro_enc_fmt {
+	RK3288_VPU_ENC_FMT_YUV420P = 0,
+	RK3288_VPU_ENC_FMT_YUV420SP = 1,
+	RK3288_VPU_ENC_FMT_YUYV422 = 2,
+	RK3288_VPU_ENC_FMT_UYVY422 = 3,
+};
+
+extern const struct hantro_variant rk3399_vpu_variant;
+extern const struct hantro_variant rk3328_vpu_variant;
+extern const struct hantro_variant rk3288_vpu_variant;
+
+void hantro_watchdog(struct work_struct *work);
+void hantro_run(struct hantro_ctx *ctx);
+void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
+		     enum vb2_buffer_state result);
+
+void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
+void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
+int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
+void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
+
+void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
+void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
+void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
+	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
+int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
+void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
+
+#endif /* HANTRO_HW_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
similarity index 95%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.c
rename to drivers/staging/media/hantro/hantro_jpeg.c
index 30b97d207dc5..125eb41f2ede 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -9,8 +9,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
-#include "rockchip_vpu_jpeg.h"
-#include "rockchip_vpu.h"
+#include "hantro_jpeg.h"
+#include "hantro.h"
 
 #define LUMA_QUANT_OFF		7
 #define CHROMA_QUANT_OFF	72
@@ -118,7 +118,7 @@ static const unsigned char chroma_ac_table[] = {
  * and we'll use fixed offsets to change the width, height
  * quantization tables, etc.
  */
-static const unsigned char rockchip_vpu_jpeg_header[JPEG_HEADER_SIZE] = {
+static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
 	/* SOI */
 	0xff, 0xd8,
 
@@ -262,19 +262,19 @@ static void jpeg_set_quality(unsigned char *buffer, int quality)
 }
 
 unsigned char *
-rockchip_vpu_jpeg_get_qtable(struct rockchip_vpu_jpeg_ctx *ctx, int index)
+hantro_jpeg_get_qtable(struct hantro_jpeg_ctx *ctx, int index)
 {
 	if (index == 0)
 		return ctx->buffer + LUMA_QUANT_OFF;
 	return ctx->buffer + CHROMA_QUANT_OFF;
 }
 
-void rockchip_vpu_jpeg_header_assemble(struct rockchip_vpu_jpeg_ctx *ctx)
+void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
 {
 	char *buf = ctx->buffer;
 
-	memcpy(buf, rockchip_vpu_jpeg_header,
-	       sizeof(rockchip_vpu_jpeg_header));
+	memcpy(buf, hantro_jpeg_header,
+	       sizeof(hantro_jpeg_header));
 
 	buf[HEIGHT_OFF + 0] = ctx->height >> 8;
 	buf[HEIGHT_OFF + 1] = ctx->height;
@@ -291,7 +291,7 @@ void rockchip_vpu_jpeg_header_assemble(struct rockchip_vpu_jpeg_ctx *ctx)
 	jpeg_set_quality(buf, ctx->quality);
 }
 
-int rockchip_vpu_jpeg_enc_init(struct rockchip_vpu_ctx *ctx)
+int hantro_jpeg_enc_init(struct hantro_ctx *ctx)
 {
 	ctx->jpeg_enc.bounce_buffer.size =
 		ctx->dst_fmt.plane_fmt[0].sizeimage -
@@ -309,7 +309,7 @@ int rockchip_vpu_jpeg_enc_init(struct rockchip_vpu_ctx *ctx)
 	return 0;
 }
 
-void rockchip_vpu_jpeg_enc_exit(struct rockchip_vpu_ctx *ctx)
+void hantro_jpeg_enc_exit(struct hantro_ctx *ctx)
 {
 	dma_free_attrs(ctx->dev->dev,
 		       ctx->jpeg_enc.bounce_buffer.size,
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
new file mode 100644
index 000000000000..9e8397c71388
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_jpeg.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#define JPEG_HEADER_SIZE	601
+
+struct hantro_jpeg_ctx {
+	int width;
+	int height;
+	int quality;
+	unsigned char *buffer;
+};
+
+unsigned char *hantro_jpeg_get_qtable(struct hantro_jpeg_ctx *ctx, int index);
+void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx);
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c b/drivers/staging/media/hantro/hantro_mpeg2.c
similarity index 79%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c
rename to drivers/staging/media/hantro/hantro_mpeg2.c
index 5a5b9ea1f6b5..1d334e6fcd06 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c
+++ b/drivers/staging/media/hantro/hantro_mpeg2.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  */
 
-#include "rockchip_vpu.h"
+#include "hantro.h"
 
 static const u8 zigzag[64] = {
 	0,   1,  8, 16,  9,  2,  3, 10,
@@ -18,7 +18,7 @@ static const u8 zigzag[64] = {
 	53, 60, 61, 54, 47, 55, 62, 63
 };
 
-void rockchip_vpu_mpeg2_dec_copy_qtable(u8 *qtable,
+void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 	const struct v4l2_ctrl_mpeg2_quantization *ctrl)
 {
 	int i, n;
@@ -35,9 +35,9 @@ void rockchip_vpu_mpeg2_dec_copy_qtable(u8 *qtable,
 	}
 }
 
-int rockchip_vpu_mpeg2_dec_init(struct rockchip_vpu_ctx *ctx)
+int hantro_mpeg2_dec_init(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 
 	ctx->mpeg2_dec.qtable.size = ARRAY_SIZE(zigzag) * 4;
 	ctx->mpeg2_dec.qtable.cpu =
@@ -50,9 +50,9 @@ int rockchip_vpu_mpeg2_dec_init(struct rockchip_vpu_ctx *ctx)
 	return 0;
 }
 
-void rockchip_vpu_mpeg2_dec_exit(struct rockchip_vpu_ctx *ctx)
+void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 
 	dma_free_coherent(vpu->dev,
 			  ctx->mpeg2_dec.qtable.size,
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
similarity index 69%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
rename to drivers/staging/media/hantro/hantro_v4l2.c
index 1b80a45df8fe..9af3a6c3f666 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Collabora, Ltd.
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
@@ -26,17 +26,16 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-sg.h>
 
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_hw.h"
-#include "rockchip_vpu_v4l2.h"
+#include "hantro.h"
+#include "hantro_hw.h"
+#include "hantro_v4l2.h"
 
-static const struct rockchip_vpu_fmt *
-rockchip_vpu_get_formats(const struct rockchip_vpu_ctx *ctx,
-			 unsigned int *num_fmts)
+static const struct hantro_fmt *
+hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts)
 {
-	const struct rockchip_vpu_fmt *formats;
+	const struct hantro_fmt *formats;
 
-	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+	if (hantro_is_encoder_ctx(ctx)) {
 		formats = ctx->dev->variant->enc_fmts;
 		*num_fmts = ctx->dev->variant->num_enc_fmts;
 	} else {
@@ -47,9 +46,9 @@ rockchip_vpu_get_formats(const struct rockchip_vpu_ctx *ctx,
 	return formats;
 }
 
-static const struct rockchip_vpu_fmt *
-rockchip_vpu_find_format(const struct rockchip_vpu_fmt *formats,
-			 unsigned int num_fmts, u32 fourcc)
+static const struct hantro_fmt *
+hantro_find_format(const struct hantro_fmt *formats, unsigned int num_fmts,
+		   u32 fourcc)
 {
 	unsigned int i;
 
@@ -59,14 +58,15 @@ rockchip_vpu_find_format(const struct rockchip_vpu_fmt *formats,
 	return NULL;
 }
 
-static const struct rockchip_vpu_fmt *
-rockchip_vpu_get_default_fmt(const struct rockchip_vpu_fmt *formats,
-			     unsigned int num_fmts, bool bitstream)
+static const struct hantro_fmt *
+hantro_get_default_fmt(const struct hantro_fmt *formats, unsigned int num_fmts,
+		       bool bitstream)
 {
 	unsigned int i;
 
 	for (i = 0; i < num_fmts; i++) {
-		if (bitstream == (formats[i].codec_mode != RK_VPU_MODE_NONE))
+		if (bitstream == (formats[i].codec_mode !=
+				  HANTRO_MODE_NONE))
 			return &formats[i];
 	}
 	return NULL;
@@ -75,7 +75,7 @@ rockchip_vpu_get_default_fmt(const struct rockchip_vpu_fmt *formats,
 static int vidioc_querycap(struct file *file, void *priv,
 			   struct v4l2_capability *cap)
 {
-	struct rockchip_vpu_dev *vpu = video_drvdata(file);
+	struct hantro_dev *vpu = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
 
 	strscpy(cap->driver, vpu->dev->driver->name, sizeof(cap->driver));
@@ -88,8 +88,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 static int vidioc_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	const struct rockchip_vpu_fmt *formats, *fmt;
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	const struct hantro_fmt *formats, *fmt;
 	unsigned int num_fmts;
 
 	if (fsize->index != 0) {
@@ -98,8 +98,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
-	fmt = rockchip_vpu_find_format(formats, num_fmts, fsize->pixel_format);
+	formats = hantro_get_formats(ctx, &num_fmts);
+	fmt = hantro_find_format(formats, num_fmts, fsize->pixel_format);
 	if (!fmt) {
 		vpu_debug(0, "unsupported bitstream format (%08x)\n",
 			  fsize->pixel_format);
@@ -107,7 +107,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	}
 
 	/* This only makes sense for coded formats */
-	if (fmt->codec_mode == RK_VPU_MODE_NONE)
+	if (fmt->codec_mode == HANTRO_MODE_NONE)
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
@@ -120,8 +120,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f, bool capture)
 
 {
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	const struct rockchip_vpu_fmt *fmt, *formats;
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	const struct hantro_fmt *fmt, *formats;
 	unsigned int num_fmts, i, j = 0;
 	bool skip_mode_none;
 
@@ -135,11 +135,11 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	 *    not MODE_NONE.
 	 *  - on the output side we want to filter out all MODE_NONE formats.
 	 */
-	skip_mode_none = capture == rockchip_vpu_is_encoder_ctx(ctx);
+	skip_mode_none = capture == hantro_is_encoder_ctx(ctx);
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	formats = hantro_get_formats(ctx, &num_fmts);
 	for (i = 0; i < num_fmts; i++) {
-		bool mode_none = formats[i].codec_mode == RK_VPU_MODE_NONE;
+		bool mode_none = formats[i].codec_mode == HANTRO_MODE_NONE;
 
 		if (skip_mode_none == mode_none)
 			continue;
@@ -169,7 +169,7 @@ static int vidioc_g_fmt_out_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
 
 	vpu_debug(4, "f->type = %d\n", f->type);
 
@@ -182,7 +182,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
 
 	vpu_debug(4, "f->type = %d\n", f->type);
 
@@ -194,13 +194,13 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 			  bool capture)
 {
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	const struct rockchip_vpu_fmt *formats, *fmt, *vpu_fmt;
+	const struct hantro_fmt *formats, *fmt, *vpu_fmt;
 	unsigned int num_fmts;
 	bool coded;
 
-	coded = capture == rockchip_vpu_is_encoder_ctx(ctx);
+	coded = capture == hantro_is_encoder_ctx(ctx);
 
 	vpu_debug(4, "trying format %c%c%c%c\n",
 		  (pix_mp->pixelformat & 0x7f),
@@ -208,17 +208,17 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		  (pix_mp->pixelformat >> 16) & 0x7f,
 		  (pix_mp->pixelformat >> 24) & 0x7f);
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
-	fmt = rockchip_vpu_find_format(formats, num_fmts, pix_mp->pixelformat);
+	formats = hantro_get_formats(ctx, &num_fmts);
+	fmt = hantro_find_format(formats, num_fmts, pix_mp->pixelformat);
 	if (!fmt) {
-		fmt = rockchip_vpu_get_default_fmt(formats, num_fmts, coded);
+		fmt = hantro_get_default_fmt(formats, num_fmts, coded);
 		f->fmt.pix_mp.pixelformat = fmt->fourcc;
 	}
 
 	if (coded) {
 		pix_mp->num_planes = 1;
 		vpu_fmt = fmt;
-	} else if (rockchip_vpu_is_encoder_ctx(ctx)) {
+	} else if (hantro_is_encoder_ctx(ctx)) {
 		vpu_fmt = ctx->vpu_dst_fmt;
 	} else {
 		vpu_fmt = ctx->vpu_src_fmt;
@@ -265,8 +265,8 @@ static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
 }
 
 static void
-rockchip_vpu_reset_fmt(struct v4l2_pix_format_mplane *fmt,
-		       const struct rockchip_vpu_fmt *vpu_fmt)
+hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
+		 const struct hantro_fmt *vpu_fmt)
 {
 	memset(fmt, 0, sizeof(*fmt));
 
@@ -279,16 +279,16 @@ rockchip_vpu_reset_fmt(struct v4l2_pix_format_mplane *fmt,
 }
 
 static void
-rockchip_vpu_reset_encoded_fmt(struct rockchip_vpu_ctx *ctx)
+hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 {
-	const struct rockchip_vpu_fmt *vpu_fmt, *formats;
+	const struct hantro_fmt *vpu_fmt, *formats;
 	struct v4l2_pix_format_mplane *fmt;
 	unsigned int num_fmts;
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
-	vpu_fmt = rockchip_vpu_get_default_fmt(formats, num_fmts, true);
+	formats = hantro_get_formats(ctx, &num_fmts);
+	vpu_fmt = hantro_get_default_fmt(formats, num_fmts, true);
 
-	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+	if (hantro_is_encoder_ctx(ctx)) {
 		ctx->vpu_dst_fmt = vpu_fmt;
 		fmt = &ctx->dst_fmt;
 	} else {
@@ -296,7 +296,7 @@ rockchip_vpu_reset_encoded_fmt(struct rockchip_vpu_ctx *ctx)
 		fmt = &ctx->src_fmt;
 	}
 
-	rockchip_vpu_reset_fmt(fmt, vpu_fmt);
+	hantro_reset_fmt(fmt, vpu_fmt);
 	fmt->num_planes = 1;
 	fmt->width = vpu_fmt->frmsize.min_width;
 	fmt->height = vpu_fmt->frmsize.min_height;
@@ -305,16 +305,16 @@ rockchip_vpu_reset_encoded_fmt(struct rockchip_vpu_ctx *ctx)
 }
 
 static void
-rockchip_vpu_reset_raw_fmt(struct rockchip_vpu_ctx *ctx)
+hantro_reset_raw_fmt(struct hantro_ctx *ctx)
 {
-	const struct rockchip_vpu_fmt *raw_vpu_fmt, *formats;
+	const struct hantro_fmt *raw_vpu_fmt, *formats;
 	struct v4l2_pix_format_mplane *raw_fmt, *encoded_fmt;
 	unsigned int num_fmts;
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
-	raw_vpu_fmt = rockchip_vpu_get_default_fmt(formats, num_fmts, false);
+	formats = hantro_get_formats(ctx, &num_fmts);
+	raw_vpu_fmt = hantro_get_default_fmt(formats, num_fmts, false);
 
-	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+	if (hantro_is_encoder_ctx(ctx)) {
 		ctx->vpu_src_fmt = raw_vpu_fmt;
 		raw_fmt = &ctx->src_fmt;
 		encoded_fmt = &ctx->dst_fmt;
@@ -324,21 +324,20 @@ rockchip_vpu_reset_raw_fmt(struct rockchip_vpu_ctx *ctx)
 		encoded_fmt = &ctx->src_fmt;
 	}
 
-	rockchip_vpu_reset_fmt(raw_fmt, raw_vpu_fmt);
+	hantro_reset_fmt(raw_fmt, raw_vpu_fmt);
 	v4l2_fill_pixfmt_mp(raw_fmt, raw_vpu_fmt->fourcc,
 			    encoded_fmt->width,
 			    encoded_fmt->height);
 }
 
-void rockchip_vpu_reset_fmts(struct rockchip_vpu_ctx *ctx)
+void hantro_reset_fmts(struct hantro_ctx *ctx)
 {
-	rockchip_vpu_reset_encoded_fmt(ctx);
-	rockchip_vpu_reset_raw_fmt(ctx);
+	hantro_reset_encoded_fmt(ctx);
+	hantro_reset_raw_fmt(ctx);
 }
 
 static void
-rockchip_vpu_update_requires_request(struct rockchip_vpu_ctx *ctx,
-				     u32 fourcc)
+hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
 {
 	switch (fourcc) {
 	case V4L2_PIX_FMT_JPEG:
@@ -356,8 +355,8 @@ static int
 vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	const struct rockchip_vpu_fmt *formats;
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	const struct hantro_fmt *formats;
 	unsigned int num_fmts;
 	struct vb2_queue *vq;
 	int ret;
@@ -367,7 +366,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	if (!rockchip_vpu_is_encoder_ctx(ctx)) {
+	if (!hantro_is_encoder_ctx(ctx)) {
 		struct vb2_queue *peer_vq;
 
 		/*
@@ -385,9 +384,9 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	if (ret)
 		return ret;
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
-	ctx->vpu_src_fmt = rockchip_vpu_find_format(formats, num_fmts,
-						    pix_mp->pixelformat);
+	formats = hantro_get_formats(ctx, &num_fmts);
+	ctx->vpu_src_fmt = hantro_find_format(formats, num_fmts,
+					      pix_mp->pixelformat);
 	ctx->src_fmt = *pix_mp;
 
 	/*
@@ -396,11 +395,11 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	 * keep internal driver state sane. User is mandated to set
 	 * the raw format again after we return, so we don't need
 	 * anything smarter.
-	 * Note that rockchip_vpu_reset_raw_fmt() also propagates size
+	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (!rockchip_vpu_is_encoder_ctx(ctx))
-		rockchip_vpu_reset_raw_fmt(ctx);
+	if (!hantro_is_encoder_ctx(ctx))
+		hantro_reset_raw_fmt(ctx);
 
 	/* Colorimetry information are always propagated. */
 	ctx->dst_fmt.colorspace = pix_mp->colorspace;
@@ -408,7 +407,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	ctx->dst_fmt.xfer_func = pix_mp->xfer_func;
 	ctx->dst_fmt.quantization = pix_mp->quantization;
 
-	rockchip_vpu_update_requires_request(ctx, pix_mp->pixelformat);
+	hantro_update_requires_request(ctx, pix_mp->pixelformat);
 
 	vpu_debug(0, "OUTPUT codec mode: %d\n", ctx->vpu_src_fmt->codec_mode);
 	vpu_debug(0, "fmt - w: %d, h: %d\n",
@@ -420,8 +419,8 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	const struct rockchip_vpu_fmt *formats;
+	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	const struct hantro_fmt *formats;
 	struct vb2_queue *vq;
 	unsigned int num_fmts;
 	int ret;
@@ -431,7 +430,7 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+	if (hantro_is_encoder_ctx(ctx)) {
 		struct vb2_queue *peer_vq;
 
 		/*
@@ -452,9 +451,9 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
-	ctx->vpu_dst_fmt = rockchip_vpu_find_format(formats, num_fmts,
-						    pix_mp->pixelformat);
+	formats = hantro_get_formats(ctx, &num_fmts);
+	ctx->vpu_dst_fmt = hantro_find_format(formats, num_fmts,
+					      pix_mp->pixelformat);
 	ctx->dst_fmt = *pix_mp;
 
 	/*
@@ -463,11 +462,11 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 	 * keep internal driver state sane. User is mandated to set
 	 * the raw format again after we return, so we don't need
 	 * anything smarter.
-	 * Note that rockchip_vpu_reset_raw_fmt() also propagates size
+	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (rockchip_vpu_is_encoder_ctx(ctx))
-		rockchip_vpu_reset_raw_fmt(ctx);
+	if (hantro_is_encoder_ctx(ctx))
+		hantro_reset_raw_fmt(ctx);
 
 	/* Colorimetry information are always propagated. */
 	ctx->src_fmt.colorspace = pix_mp->colorspace;
@@ -479,12 +478,12 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 	vpu_debug(0, "fmt - w: %d, h: %d\n",
 		  pix_mp->width, pix_mp->height);
 
-	rockchip_vpu_update_requires_request(ctx, pix_mp->pixelformat);
+	hantro_update_requires_request(ctx, pix_mp->pixelformat);
 
 	return 0;
 }
 
-const struct v4l2_ioctl_ops rockchip_vpu_ioctl_ops = {
+const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_framesizes = vidioc_enum_framesizes,
 
@@ -513,13 +512,11 @@ const struct v4l2_ioctl_ops rockchip_vpu_ioctl_ops = {
 };
 
 static int
-rockchip_vpu_queue_setup(struct vb2_queue *vq,
-			 unsigned int *num_buffers,
-			 unsigned int *num_planes,
-			 unsigned int sizes[],
-			 struct device *alloc_devs[])
+hantro_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
+		   unsigned int *num_planes, unsigned int sizes[],
+		   struct device *alloc_devs[])
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vq);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(vq);
 	struct v4l2_pix_format_mplane *pixfmt;
 	int i;
 
@@ -551,9 +548,8 @@ rockchip_vpu_queue_setup(struct vb2_queue *vq,
 }
 
 static int
-rockchip_vpu_buf_plane_check(struct vb2_buffer *vb,
-			     const struct rockchip_vpu_fmt *vpu_fmt,
-			     struct v4l2_pix_format_mplane *pixfmt)
+hantro_buf_plane_check(struct vb2_buffer *vb, const struct hantro_fmt *vpu_fmt,
+		       struct v4l2_pix_format_mplane *pixfmt)
 {
 	unsigned int sz;
 	int i;
@@ -570,38 +566,36 @@ rockchip_vpu_buf_plane_check(struct vb2_buffer *vb,
 	return 0;
 }
 
-static int rockchip_vpu_buf_prepare(struct vb2_buffer *vb)
+static int hantro_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vq);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(vq);
 
 	if (V4L2_TYPE_IS_OUTPUT(vq->type))
-		return rockchip_vpu_buf_plane_check(vb, ctx->vpu_src_fmt,
-						    &ctx->src_fmt);
+		return hantro_buf_plane_check(vb, ctx->vpu_src_fmt,
+						  &ctx->src_fmt);
 
-	return rockchip_vpu_buf_plane_check(vb, ctx->vpu_dst_fmt,
-					    &ctx->dst_fmt);
+	return hantro_buf_plane_check(vb, ctx->vpu_dst_fmt, &ctx->dst_fmt);
 }
 
-static void rockchip_vpu_buf_queue(struct vb2_buffer *vb)
+static void hantro_buf_queue(struct vb2_buffer *vb)
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }
 
-static bool rockchip_vpu_vq_is_coded(struct vb2_queue *q)
+static bool hantro_vq_is_coded(struct vb2_queue *q)
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 
-	return rockchip_vpu_is_encoder_ctx(ctx) != V4L2_TYPE_IS_OUTPUT(q->type);
+	return hantro_is_encoder_ctx(ctx) != V4L2_TYPE_IS_OUTPUT(q->type);
 }
 
-static int rockchip_vpu_start_streaming(struct vb2_queue *q,
-					unsigned int count)
+static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 	int ret = 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
@@ -609,8 +603,8 @@ static int rockchip_vpu_start_streaming(struct vb2_queue *q,
 	else
 		ctx->sequence_cap = 0;
 
-	if (rockchip_vpu_vq_is_coded(q)) {
-		enum rockchip_vpu_codec_mode codec_mode;
+	if (hantro_vq_is_coded(q)) {
+		enum hantro_codec_mode codec_mode;
 
 		if (V4L2_TYPE_IS_OUTPUT(q->type))
 			codec_mode = ctx->vpu_src_fmt->codec_mode;
@@ -627,10 +621,10 @@ static int rockchip_vpu_start_streaming(struct vb2_queue *q,
 }
 
 static void
-rockchip_vpu_return_bufs(struct vb2_queue *q,
-			 struct vb2_v4l2_buffer *(*buf_remove)(struct v4l2_m2m_ctx *))
+hantro_return_bufs(struct vb2_queue *q,
+		   struct vb2_v4l2_buffer *(*buf_remove)(struct v4l2_m2m_ctx *))
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 
 	for (;;) {
 		struct vb2_v4l2_buffer *vbuf;
@@ -644,11 +638,11 @@ rockchip_vpu_return_bufs(struct vb2_queue *q,
 	}
 }
 
-static void rockchip_vpu_stop_streaming(struct vb2_queue *q)
+static void hantro_stop_streaming(struct vb2_queue *q)
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 
-	if (rockchip_vpu_vq_is_coded(q)) {
+	if (hantro_vq_is_coded(q)) {
 		if (ctx->codec_ops && ctx->codec_ops->exit)
 			ctx->codec_ops->exit(ctx);
 	}
@@ -659,19 +653,19 @@ static void rockchip_vpu_stop_streaming(struct vb2_queue *q)
 	 * it is safe to return all the buffers.
 	 */
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
-		rockchip_vpu_return_bufs(q, v4l2_m2m_src_buf_remove);
+		hantro_return_bufs(q, v4l2_m2m_src_buf_remove);
 	else
-		rockchip_vpu_return_bufs(q, v4l2_m2m_dst_buf_remove);
+		hantro_return_bufs(q, v4l2_m2m_dst_buf_remove);
 }
 
-static void rockchip_vpu_buf_request_complete(struct vb2_buffer *vb)
+static void hantro_buf_request_complete(struct vb2_buffer *vb)
 {
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct hantro_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_handler);
 }
 
-static int rockchip_vpu_buf_out_validate(struct vb2_buffer *vb)
+static int hantro_buf_out_validate(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 
@@ -679,14 +673,14 @@ static int rockchip_vpu_buf_out_validate(struct vb2_buffer *vb)
 	return 0;
 }
 
-const struct vb2_ops rockchip_vpu_queue_ops = {
-	.queue_setup = rockchip_vpu_queue_setup,
-	.buf_prepare = rockchip_vpu_buf_prepare,
-	.buf_queue = rockchip_vpu_buf_queue,
-	.buf_out_validate = rockchip_vpu_buf_out_validate,
-	.buf_request_complete = rockchip_vpu_buf_request_complete,
-	.start_streaming = rockchip_vpu_start_streaming,
-	.stop_streaming = rockchip_vpu_stop_streaming,
+const struct vb2_ops hantro_queue_ops = {
+	.queue_setup = hantro_queue_setup,
+	.buf_prepare = hantro_buf_prepare,
+	.buf_queue = hantro_buf_queue,
+	.buf_out_validate = hantro_buf_out_validate,
+	.buf_request_complete = hantro_buf_request_complete,
+	.start_streaming = hantro_start_streaming,
+	.stop_streaming = hantro_stop_streaming,
 	.wait_prepare = vb2_ops_wait_prepare,
 	.wait_finish = vb2_ops_wait_finish,
 };
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h b/drivers/staging/media/hantro/hantro_v4l2.h
similarity index 53%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
rename to drivers/staging/media/hantro/hantro_v4l2.h
index 493e8751d22d..18bc682c8556 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
+++ b/drivers/staging/media/hantro/hantro_v4l2.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  *	Alpha Lin <Alpha.Lin@rock-chips.com>
@@ -13,14 +13,14 @@
  * Copyright (C) 2011 Samsung Electronics Co., Ltd.
  */
 
-#ifndef ROCKCHIP_VPU_V4L2_H_
-#define ROCKCHIP_VPU_V4L2_H_
+#ifndef HANTRO_V4L2_H_
+#define HANTRO_V4L2_H_
 
-#include "rockchip_vpu.h"
+#include "hantro.h"
 
-extern const struct v4l2_ioctl_ops rockchip_vpu_ioctl_ops;
-extern const struct vb2_ops rockchip_vpu_queue_ops;
+extern const struct v4l2_ioctl_ops hantro_ioctl_ops;
+extern const struct vb2_ops hantro_queue_ops;
 
-void rockchip_vpu_reset_fmts(struct rockchip_vpu_ctx *ctx);
+void hantro_reset_fmts(struct hantro_ctx *ctx);
 
-#endif /* ROCKCHIP_VPU_V4L2_H_ */
+#endif /* HANTRO_V4L2_H_ */
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
new file mode 100644
index 000000000000..f0d3f0eec07b
--- /dev/null
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <linux/clk.h>
+
+#include "hantro.h"
+#include "hantro_jpeg.h"
+#include "hantro_g1_regs.h"
+#include "hantro_h1_regs.h"
+
+#define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.codec_mode = HANTRO_MODE_JPEG_ENC,
+		.max_depth = 2,
+		.header_size = JPEG_HEADER_SIZE,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 8192,
+			.step_width = JPEG_MB_DIM,
+			.min_height = 32,
+			.max_height = 8192,
+			.step_height = JPEG_MB_DIM,
+		},
+	},
+};
+
+static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1920,
+			.step_width = MPEG2_MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MPEG2_MB_DIM,
+		},
+	},
+};
+
+static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status, bytesused;
+
+	status = vepu_read(vpu, H1_REG_INTERRUPT);
+	bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
+	state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vepu_write(vpu, 0, H1_REG_INTERRUPT);
+	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+
+	hantro_irq_done(vpu, bytesused, state);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, G1_REG_INTERRUPT);
+	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
+	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
+
+	hantro_irq_done(vpu, 0, state);
+
+	return IRQ_HANDLED;
+}
+
+static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
+{
+	/* Bump ACLK to max. possible freq. to improve performance. */
+	clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
+	return 0;
+}
+
+static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
+	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
+	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+}
+
+static void rk3288_vpu_dec_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_IRQ_DIS, G1_REG_INTERRUPT);
+	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
+	vdpu_write(vpu, 1, G1_REG_SOFT_RESET);
+}
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = hantro_h1_jpeg_enc_run,
+		.reset = rk3288_vpu_enc_reset,
+		.init = hantro_jpeg_enc_init,
+		.exit = hantro_jpeg_enc_exit,
+	},
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.reset = rk3288_vpu_dec_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+};
+
+/*
+ * VPU variant.
+ */
+
+const struct hantro_variant rk3288_vpu_variant = {
+	.enc_offset = 0x0,
+	.enc_fmts = rk3288_vpu_enc_fmts,
+	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
+	.dec_offset = 0x400,
+	.dec_fmts = rk3288_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
+	.codec_ops = rk3288_vpu_codec_ops,
+	.vepu_irq = rk3288_vepu_irq,
+	.vdpu_irq = rk3288_vdpu_irq,
+	.init = rk3288_vpu_hw_init,
+	.clk_names = {"aclk", "hclk"},
+	.num_clocks = 2
+};
diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
similarity index 69%
rename from drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
rename to drivers/staging/media/hantro/rk3399_vpu_hw.c
index 341f8d69c33d..5e51def41f57 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  *	Jeffy Chen <jeffy.chen@rock-chips.com>
@@ -8,8 +8,8 @@
 
 #include <linux/clk.h>
 
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_jpeg.h"
+#include "hantro.h"
+#include "hantro_jpeg.h"
 #include "rk3399_vpu_regs.h"
 
 #define RK3399_ACLK_MAX_FREQ (400 * 1000 * 1000)
@@ -18,30 +18,30 @@
  * Supported formats.
  */
 
-static const struct rockchip_vpu_fmt rk3399_vpu_enc_fmts[] = {
+static const struct hantro_fmt rk3399_vpu_enc_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUV420M,
-		.codec_mode = RK_VPU_MODE_NONE,
+		.codec_mode = HANTRO_MODE_NONE,
 		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
-		.codec_mode = RK_VPU_MODE_NONE,
+		.codec_mode = HANTRO_MODE_NONE,
 		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUYV,
-		.codec_mode = RK_VPU_MODE_NONE,
+		.codec_mode = HANTRO_MODE_NONE,
 		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_UYVY,
-		.codec_mode = RK_VPU_MODE_NONE,
+		.codec_mode = HANTRO_MODE_NONE,
 		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_JPEG,
-		.codec_mode = RK_VPU_MODE_JPEG_ENC,
+		.codec_mode = HANTRO_MODE_JPEG_ENC,
 		.max_depth = 2,
 		.header_size = JPEG_HEADER_SIZE,
 		.frmsize = {
@@ -55,14 +55,14 @@ static const struct rockchip_vpu_fmt rk3399_vpu_enc_fmts[] = {
 	},
 };
 
-static const struct rockchip_vpu_fmt rk3399_vpu_dec_fmts[] = {
+static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
-		.codec_mode = RK_VPU_MODE_NONE,
+		.codec_mode = HANTRO_MODE_NONE,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
-		.codec_mode = RK_VPU_MODE_MPEG2_DEC,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = 48,
@@ -77,7 +77,7 @@ static const struct rockchip_vpu_fmt rk3399_vpu_dec_fmts[] = {
 
 static irqreturn_t rk3399_vepu_irq(int irq, void *dev_id)
 {
-	struct rockchip_vpu_dev *vpu = dev_id;
+	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
 	u32 status, bytesused;
 
@@ -89,14 +89,14 @@ static irqreturn_t rk3399_vepu_irq(int irq, void *dev_id)
 	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
 
-	rockchip_vpu_irq_done(vpu, bytesused, state);
+	hantro_irq_done(vpu, bytesused, state);
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t rk3399_vdpu_irq(int irq, void *dev_id)
 {
-	struct rockchip_vpu_dev *vpu = dev_id;
+	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -107,30 +107,30 @@ static irqreturn_t rk3399_vdpu_irq(int irq, void *dev_id)
 	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
 
-	rockchip_vpu_irq_done(vpu, 0, state);
+	hantro_irq_done(vpu, 0, state);
 
 	return IRQ_HANDLED;
 }
 
-static int rk3399_vpu_hw_init(struct rockchip_vpu_dev *vpu)
+static int rk3399_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
 	clk_set_rate(vpu->clocks[0].clk, RK3399_ACLK_MAX_FREQ);
 	return 0;
 }
 
-static void rk3399_vpu_enc_reset(struct rockchip_vpu_ctx *ctx)
+static void rk3399_vpu_enc_reset(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
 }
 
-static void rk3399_vpu_dec_reset(struct rockchip_vpu_ctx *ctx)
+static void rk3399_vpu_dec_reset(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 
 	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
@@ -141,18 +141,18 @@ static void rk3399_vpu_dec_reset(struct rockchip_vpu_ctx *ctx)
  * Supported codec ops.
  */
 
-static const struct rockchip_vpu_codec_ops rk3399_vpu_codec_ops[] = {
-	[RK_VPU_MODE_JPEG_ENC] = {
+static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
 		.run = rk3399_vpu_jpeg_enc_run,
 		.reset = rk3399_vpu_enc_reset,
-		.init = rockchip_vpu_jpeg_enc_init,
-		.exit = rockchip_vpu_jpeg_enc_exit,
+		.init = hantro_jpeg_enc_init,
+		.exit = hantro_jpeg_enc_exit,
 	},
-	[RK_VPU_MODE_MPEG2_DEC] = {
+	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = rk3399_vpu_mpeg2_dec_run,
 		.reset = rk3399_vpu_dec_reset,
-		.init = rockchip_vpu_mpeg2_dec_init,
-		.exit = rockchip_vpu_mpeg2_dec_exit,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
 	},
 };
 
@@ -160,14 +160,14 @@ static const struct rockchip_vpu_codec_ops rk3399_vpu_codec_ops[] = {
  * VPU variant.
  */
 
-const struct rockchip_vpu_variant rk3399_vpu_variant = {
+const struct hantro_variant rk3399_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3399_vpu_enc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(rk3399_vpu_enc_fmts),
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = RK_VPU_JPEG_ENCODER | RK_VPU_MPEG2_DECODER,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.vepu_irq = rk3399_vepu_irq,
 	.vdpu_irq = rk3399_vdpu_irq,
@@ -176,11 +176,11 @@ const struct rockchip_vpu_variant rk3399_vpu_variant = {
 	.num_clocks = 2
 };
 
-const struct rockchip_vpu_variant rk3328_vpu_variant = {
+const struct hantro_variant rk3328_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = RK_VPU_MPEG2_DECODER,
+	.codec = HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.vdpu_irq = rk3399_vdpu_irq,
 	.init = rk3399_vpu_hw_init,
diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
similarity index 86%
rename from drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
rename to drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
index 460edc5ebe4d..ae66354d2d93 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  *
@@ -25,16 +25,16 @@
 
 #include <asm/unaligned.h>
 #include <media/v4l2-mem2mem.h>
-#include "rockchip_vpu_jpeg.h"
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_v4l2.h"
-#include "rockchip_vpu_hw.h"
+#include "hantro_jpeg.h"
+#include "hantro.h"
+#include "hantro_v4l2.h"
+#include "hantro_hw.h"
 #include "rk3399_vpu_regs.h"
 
 #define VEPU_JPEG_QUANT_TABLE_COUNT 16
 
-static void rk3399_vpu_set_src_img_ctrl(struct rockchip_vpu_dev *vpu,
-					struct rockchip_vpu_ctx *ctx)
+static void rk3399_vpu_set_src_img_ctrl(struct hantro_dev *vpu,
+					struct hantro_ctx *ctx)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
 	u32 reg;
@@ -60,8 +60,8 @@ static void rk3399_vpu_set_src_img_ctrl(struct rockchip_vpu_dev *vpu,
 	vepu_write_relaxed(vpu, reg, VEPU_REG_ENC_CTRL1);
 }
 
-static void rk3399_vpu_jpeg_enc_set_buffers(struct rockchip_vpu_dev *vpu,
-					    struct rockchip_vpu_ctx *ctx,
+static void rk3399_vpu_jpeg_enc_set_buffers(struct hantro_dev *vpu,
+					    struct hantro_ctx *ctx,
 					    struct vb2_buffer *src_buf)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
@@ -93,7 +93,7 @@ static void rk3399_vpu_jpeg_enc_set_buffers(struct rockchip_vpu_dev *vpu,
 }
 
 static void
-rk3399_vpu_jpeg_enc_set_qtable(struct rockchip_vpu_dev *vpu,
+rk3399_vpu_jpeg_enc_set_qtable(struct hantro_dev *vpu,
 			       unsigned char *luma_qtable,
 			       unsigned char *chroma_qtable)
 {
@@ -108,11 +108,11 @@ rk3399_vpu_jpeg_enc_set_qtable(struct rockchip_vpu_dev *vpu,
 	}
 }
 
-void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
+void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct rockchip_vpu_jpeg_ctx jpeg_ctx;
+	struct hantro_jpeg_ctx jpeg_ctx;
 	struct media_request *src_req;
 	u32 reg;
 
@@ -127,7 +127,7 @@ void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
 	jpeg_ctx.width = ctx->dst_fmt.width;
 	jpeg_ctx.height = ctx->dst_fmt.height;
 	jpeg_ctx.quality = ctx->jpeg_quality;
-	rockchip_vpu_jpeg_header_assemble(&jpeg_ctx);
+	hantro_jpeg_header_assemble(&jpeg_ctx);
 
 	/* Switch to JPEG encoder mode before writing registers */
 	vepu_write_relaxed(vpu, VEPU_REG_ENCODE_FORMAT_JPEG,
@@ -136,8 +136,8 @@ void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
 	rk3399_vpu_set_src_img_ctrl(vpu, ctx);
 	rk3399_vpu_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
 	rk3399_vpu_jpeg_enc_set_qtable(vpu,
-				       rockchip_vpu_jpeg_get_qtable(&jpeg_ctx, 0),
-				       rockchip_vpu_jpeg_get_qtable(&jpeg_ctx, 1));
+				       hantro_jpeg_get_qtable(&jpeg_ctx, 0),
+				       hantro_jpeg_get_qtable(&jpeg_ctx, 1));
 
 	reg = VEPU_REG_OUTPUT_SWAP32
 		| VEPU_REG_OUTPUT_SWAP16
diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
similarity index 92%
rename from drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c
rename to drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index c4c092c2004a..8685bddfbcab 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  */
@@ -8,8 +8,8 @@
 #include <asm/unaligned.h>
 #include <linux/bitfield.h>
 #include <media/v4l2-mem2mem.h>
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_hw.h"
+#include "hantro.h"
+#include "hantro_hw.h"
 
 #define VDPU_SWREG(nr)			((nr) * 4)
 
@@ -84,22 +84,21 @@
 #define PICT_FRAME         3
 
 static void
-rk3399_vpu_mpeg2_dec_set_quantization(struct rockchip_vpu_dev *vpu,
-				      struct rockchip_vpu_ctx *ctx)
+rk3399_vpu_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
+				      struct hantro_ctx *ctx)
 {
 	struct v4l2_ctrl_mpeg2_quantization *quantization;
 
-	quantization = rockchip_vpu_get_ctrl(ctx,
-				V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
-	rockchip_vpu_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
-					   quantization);
+	quantization = hantro_get_ctrl(ctx,
+				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, quantization);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
 			   VDPU_REG_QTABLE_BASE);
 }
 
 static void
-rk3399_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
-				 struct rockchip_vpu_ctx *ctx,
+rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
+				 struct hantro_ctx *ctx,
 				 struct vb2_buffer *src_buf,
 				 struct vb2_buffer *dst_buf,
 				 const struct v4l2_mpeg2_sequence *sequence,
@@ -114,12 +113,12 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
 
 	switch (picture->picture_coding_type) {
 	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
-		backward_addr = rockchip_vpu_get_ref(vq,
-						slice_params->backward_ref_ts);
+		backward_addr = hantro_get_ref(vq,
+					       slice_params->backward_ref_ts);
 		/* fall-through */
 	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
-		forward_addr = rockchip_vpu_get_ref(vq,
-						slice_params->forward_ref_ts);
+		forward_addr = hantro_get_ref(vq,
+					      slice_params->forward_ref_ts);
 	}
 
 	/* Source bitstream buffer */
@@ -161,9 +160,9 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
 	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
 }
 
-void rk3399_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
+void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
 	const struct v4l2_mpeg2_sequence *sequence;
@@ -177,8 +176,8 @@ void rk3399_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
-	slice_params = rockchip_vpu_get_ctrl(ctx,
-				V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+	slice_params = hantro_get_ctrl(ctx,
+				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
 	sequence = &slice_params->sequence;
 	picture = &slice_params->picture;
 
diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_regs.h b/drivers/staging/media/hantro/rk3399_vpu_regs.h
similarity index 99%
rename from drivers/staging/media/rockchip/vpu/rk3399_vpu_regs.h
rename to drivers/staging/media/hantro/rk3399_vpu_regs.h
index fbe294177ec9..88d096920f30 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_regs.h
+++ b/drivers/staging/media/hantro/rk3399_vpu_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  *	Alpha Lin <alpha.lin@rock-chips.com>
diff --git a/drivers/staging/media/rockchip/vpu/Kconfig b/drivers/staging/media/rockchip/vpu/Kconfig
deleted file mode 100644
index 842b003e08b8..000000000000
--- a/drivers/staging/media/rockchip/vpu/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config VIDEO_ROCKCHIP_VPU
-	tristate "Rockchip VPU driver"
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on MEDIA_CONTROLLER_REQUEST_API
-	select VIDEOBUF2_DMA_CONTIG
-	select VIDEOBUF2_VMALLOC
-	select V4L2_MEM2MEM_DEV
-	help
-	  Support for the Video Processing Unit present on Rockchip SoC,
-	  which accelerates video and image encoding and decoding.
-	  To compile this driver as a module, choose M here: the module
-	  will be called rockchip-vpu.
diff --git a/drivers/staging/media/rockchip/vpu/Makefile b/drivers/staging/media/rockchip/vpu/Makefile
deleted file mode 100644
index be278157d196..000000000000
--- a/drivers/staging/media/rockchip/vpu/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIDEO_ROCKCHIP_VPU) += rockchip-vpu.o
-
-rockchip-vpu-y += \
-		rockchip_vpu_drv.o \
-		rockchip_vpu_v4l2.o \
-		rk3288_vpu_hw.o \
-		rk3288_vpu_hw_jpeg_enc.o \
-		rk3288_vpu_hw_mpeg2_dec.o \
-		rk3399_vpu_hw.o \
-		rk3399_vpu_hw_jpeg_enc.o \
-		rk3399_vpu_hw_mpeg2_dec.o \
-		rockchip_vpu_jpeg.o \
-		rockchip_vpu_mpeg2.o
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
deleted file mode 100644
index 003143c77d37..000000000000
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Rockchip VPU codec driver
- *
- * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
- *	Jeffy Chen <jeffy.chen@rock-chips.com>
- */
-
-#include <linux/clk.h>
-
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_jpeg.h"
-#include "rk3288_vpu_regs.h"
-
-#define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
-
-/*
- * Supported formats.
- */
-
-static const struct rockchip_vpu_fmt rk3288_vpu_enc_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_YUV420M,
-		.codec_mode = RK_VPU_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12M,
-		.codec_mode = RK_VPU_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUYV,
-		.codec_mode = RK_VPU_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_UYVY,
-		.codec_mode = RK_VPU_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_JPEG,
-		.codec_mode = RK_VPU_MODE_JPEG_ENC,
-		.max_depth = 2,
-		.header_size = JPEG_HEADER_SIZE,
-		.frmsize = {
-			.min_width = 96,
-			.max_width = 8192,
-			.step_width = JPEG_MB_DIM,
-			.min_height = 32,
-			.max_height = 8192,
-			.step_height = JPEG_MB_DIM,
-		},
-	},
-};
-
-static const struct rockchip_vpu_fmt rk3288_vpu_dec_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_NV12,
-		.codec_mode = RK_VPU_MODE_NONE,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
-		.codec_mode = RK_VPU_MODE_MPEG2_DEC,
-		.max_depth = 2,
-		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
-			.step_width = MPEG2_MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
-			.step_height = MPEG2_MB_DIM,
-		},
-	},
-};
-
-static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
-{
-	struct rockchip_vpu_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status, bytesused;
-
-	status = vepu_read(vpu, VEPU_REG_INTERRUPT);
-	bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
-	state = (status & VEPU_REG_INTERRUPT_FRAME_RDY) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
-	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
-
-	rockchip_vpu_irq_done(vpu, bytesused, state);
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
-{
-	struct rockchip_vpu_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
-	state = (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
-	vdpu_write(vpu, VDPU_REG_CONFIG_DEC_CLK_GATE_E, VDPU_REG_CONFIG);
-
-	rockchip_vpu_irq_done(vpu, 0, state);
-
-	return IRQ_HANDLED;
-}
-
-static int rk3288_vpu_hw_init(struct rockchip_vpu_dev *vpu)
-{
-	/* Bump ACLK to max. possible freq. to improve performance. */
-	clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
-	return 0;
-}
-
-static void rk3288_vpu_enc_reset(struct rockchip_vpu_ctx *ctx)
-{
-	struct rockchip_vpu_dev *vpu = ctx->dev;
-
-	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
-	vepu_write(vpu, 0, VEPU_REG_ENC_CTRL);
-	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
-}
-
-static void rk3288_vpu_dec_reset(struct rockchip_vpu_ctx *ctx)
-{
-	struct rockchip_vpu_dev *vpu = ctx->dev;
-
-	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
-	vdpu_write(vpu, VDPU_REG_CONFIG_DEC_CLK_GATE_E, VDPU_REG_CONFIG);
-	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
-}
-
-/*
- * Supported codec ops.
- */
-
-static const struct rockchip_vpu_codec_ops rk3288_vpu_codec_ops[] = {
-	[RK_VPU_MODE_JPEG_ENC] = {
-		.run = rk3288_vpu_jpeg_enc_run,
-		.reset = rk3288_vpu_enc_reset,
-		.init = rockchip_vpu_jpeg_enc_init,
-		.exit = rockchip_vpu_jpeg_enc_exit,
-	},
-	[RK_VPU_MODE_MPEG2_DEC] = {
-		.run = rk3288_vpu_mpeg2_dec_run,
-		.reset = rk3288_vpu_dec_reset,
-		.init = rockchip_vpu_mpeg2_dec_init,
-		.exit = rockchip_vpu_mpeg2_dec_exit,
-	},
-};
-
-/*
- * VPU variant.
- */
-
-const struct rockchip_vpu_variant rk3288_vpu_variant = {
-	.enc_offset = 0x0,
-	.enc_fmts = rk3288_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
-	.dec_offset = 0x400,
-	.dec_fmts = rk3288_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
-	.codec = RK_VPU_JPEG_ENCODER | RK_VPU_MPEG2_DECODER,
-	.codec_ops = rk3288_vpu_codec_ops,
-	.vepu_irq = rk3288_vepu_irq,
-	.vdpu_irq = rk3288_vdpu_irq,
-	.init = rk3288_vpu_hw_init,
-	.clk_names = {"aclk", "hclk"},
-	.num_clocks = 2
-};
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
deleted file mode 100644
index 68176e91330a..000000000000
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
+++ /dev/null
@@ -1,125 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Rockchip VPU codec driver
- *
- * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
- */
-
-#include <asm/unaligned.h>
-#include <media/v4l2-mem2mem.h>
-#include "rockchip_vpu_jpeg.h"
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_v4l2.h"
-#include "rockchip_vpu_hw.h"
-#include "rk3288_vpu_regs.h"
-
-#define VEPU_JPEG_QUANT_TABLE_COUNT 16
-
-static void rk3288_vpu_set_src_img_ctrl(struct rockchip_vpu_dev *vpu,
-					struct rockchip_vpu_ctx *ctx)
-{
-	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
-	u32 reg;
-
-	reg = VEPU_REG_IN_IMG_CTRL_ROW_LEN(pix_fmt->width)
-		| VEPU_REG_IN_IMG_CTRL_OVRFLR_D4(0)
-		| VEPU_REG_IN_IMG_CTRL_OVRFLB_D4(0)
-		| VEPU_REG_IN_IMG_CTRL_FMT(ctx->vpu_src_fmt->enc_fmt);
-	vepu_write_relaxed(vpu, reg, VEPU_REG_IN_IMG_CTRL);
-}
-
-static void rk3288_vpu_jpeg_enc_set_buffers(struct rockchip_vpu_dev *vpu,
-					    struct rockchip_vpu_ctx *ctx,
-					    struct vb2_buffer *src_buf)
-{
-	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
-	dma_addr_t src[3];
-
-	WARN_ON(pix_fmt->num_planes > 3);
-
-	vepu_write_relaxed(vpu, ctx->jpeg_enc.bounce_buffer.dma,
-			   VEPU_REG_ADDR_OUTPUT_STREAM);
-	vepu_write_relaxed(vpu, ctx->jpeg_enc.bounce_buffer.size,
-			   VEPU_REG_STR_BUF_LIMIT);
-
-	if (pix_fmt->num_planes == 1) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		/* single plane formats we supported are all interlaced */
-		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
-	} else if (pix_fmt->num_planes == 2) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
-		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
-	} else {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
-		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
-		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
-		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);
-	}
-}
-
-static void
-rk3288_vpu_jpeg_enc_set_qtable(struct rockchip_vpu_dev *vpu,
-			       unsigned char *luma_qtable,
-			       unsigned char *chroma_qtable)
-{
-	u32 reg, i;
-
-	for (i = 0; i < VEPU_JPEG_QUANT_TABLE_COUNT; i++) {
-		reg = get_unaligned_be32(&luma_qtable[i]);
-		vepu_write_relaxed(vpu, reg, VEPU_REG_JPEG_LUMA_QUAT(i));
-
-		reg = get_unaligned_be32(&chroma_qtable[i]);
-		vepu_write_relaxed(vpu, reg, VEPU_REG_JPEG_CHROMA_QUAT(i));
-	}
-}
-
-void rk3288_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
-{
-	struct rockchip_vpu_dev *vpu = ctx->dev;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct rockchip_vpu_jpeg_ctx jpeg_ctx;
-	u32 reg;
-
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
-
-	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
-	jpeg_ctx.buffer = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
-	jpeg_ctx.width = ctx->dst_fmt.width;
-	jpeg_ctx.height = ctx->dst_fmt.height;
-	jpeg_ctx.quality = ctx->jpeg_quality;
-	rockchip_vpu_jpeg_header_assemble(&jpeg_ctx);
-
-	/* Switch to JPEG encoder mode before writing registers */
-	vepu_write_relaxed(vpu, VEPU_REG_ENC_CTRL_ENC_MODE_JPEG,
-			   VEPU_REG_ENC_CTRL);
-
-	rk3288_vpu_set_src_img_ctrl(vpu, ctx);
-	rk3288_vpu_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
-	rk3288_vpu_jpeg_enc_set_qtable(vpu,
-				       rockchip_vpu_jpeg_get_qtable(&jpeg_ctx, 0),
-				       rockchip_vpu_jpeg_get_qtable(&jpeg_ctx, 1));
-
-	reg = VEPU_REG_AXI_CTRL_OUTPUT_SWAP16
-		| VEPU_REG_AXI_CTRL_INPUT_SWAP16
-		| VEPU_REG_AXI_CTRL_BURST_LEN(16)
-		| VEPU_REG_AXI_CTRL_OUTPUT_SWAP32
-		| VEPU_REG_AXI_CTRL_INPUT_SWAP32
-		| VEPU_REG_AXI_CTRL_OUTPUT_SWAP8
-		| VEPU_REG_AXI_CTRL_INPUT_SWAP8;
-	/* Make sure that all registers are written at this point. */
-	vepu_write(vpu, reg, VEPU_REG_AXI_CTRL);
-
-	reg = VEPU_REG_ENC_CTRL_WIDTH(JPEG_MB_WIDTH(ctx->src_fmt.width))
-		| VEPU_REG_ENC_CTRL_HEIGHT(JPEG_MB_HEIGHT(ctx->src_fmt.height))
-		| VEPU_REG_ENC_CTRL_ENC_MODE_JPEG
-		| VEPU_REG_ENC_PIC_INTRA
-		| VEPU_REG_ENC_CTRL_EN_BIT;
-	/* Kick the watchdog and start encoding */
-	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
-	vepu_write(vpu, reg, VEPU_REG_ENC_CTRL);
-}
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
deleted file mode 100644
index e9eee47fcea1..000000000000
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
+++ /dev/null
@@ -1,261 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Rockchip VPU codec driver
- *
- * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
- */
-
-#include <asm/unaligned.h>
-#include <linux/bitfield.h>
-#include <media/v4l2-mem2mem.h>
-#include "rockchip_vpu.h"
-#include "rockchip_vpu_hw.h"
-
-#define VDPU_SWREG(nr)			((nr) * 4)
-
-#define VDPU_REG_RLC_VLC_BASE		VDPU_SWREG(12)
-#define VDPU_REG_DEC_OUT_BASE		VDPU_SWREG(13)
-#define VDPU_REG_REFER0_BASE		VDPU_SWREG(14)
-#define VDPU_REG_REFER1_BASE		VDPU_SWREG(15)
-#define VDPU_REG_REFER2_BASE		VDPU_SWREG(16)
-#define VDPU_REG_REFER3_BASE		VDPU_SWREG(17)
-#define VDPU_REG_QTABLE_BASE		VDPU_SWREG(40)
-#define VDPU_REG_DEC_E(v)		((v) ? BIT(0) : 0)
-
-#define VDPU_REG_DEC_AXI_RD_ID(v)	(((v) << 24) & GENMASK(31, 24))
-#define VDPU_REG_DEC_TIMEOUT_E(v)	((v) ? BIT(23) : 0)
-#define VDPU_REG_DEC_STRSWAP32_E(v)	((v) ? BIT(22) : 0)
-#define VDPU_REG_DEC_STRENDIAN_E(v)	((v) ? BIT(21) : 0)
-#define VDPU_REG_DEC_INSWAP32_E(v)	((v) ? BIT(20) : 0)
-#define VDPU_REG_DEC_OUTSWAP32_E(v)	((v) ? BIT(19) : 0)
-#define VDPU_REG_DEC_DATA_DISC_E(v)	((v) ? BIT(18) : 0)
-#define VDPU_REG_DEC_LATENCY(v)		(((v) << 11) & GENMASK(16, 11))
-#define VDPU_REG_DEC_CLK_GATE_E(v)	((v) ? BIT(10) : 0)
-#define VDPU_REG_DEC_IN_ENDIAN(v)	((v) ? BIT(9) : 0)
-#define VDPU_REG_DEC_OUT_ENDIAN(v)	((v) ? BIT(8) : 0)
-#define VDPU_REG_DEC_ADV_PRE_DIS(v)	((v) ? BIT(6) : 0)
-#define VDPU_REG_DEC_SCMD_DIS(v)	((v) ? BIT(5) : 0)
-#define VDPU_REG_DEC_MAX_BURST(v)	(((v) << 0) & GENMASK(4, 0))
-
-#define VDPU_REG_DEC_MODE(v)		(((v) << 28) & GENMASK(31, 28))
-#define VDPU_REG_RLC_MODE_E(v)		((v) ? BIT(27) : 0)
-#define VDPU_REG_PIC_INTERLACE_E(v)	((v) ? BIT(23) : 0)
-#define VDPU_REG_PIC_FIELDMODE_E(v)	((v) ? BIT(22) : 0)
-#define VDPU_REG_PIC_B_E(v)		((v) ? BIT(21) : 0)
-#define VDPU_REG_PIC_INTER_E(v)		((v) ? BIT(20) : 0)
-#define VDPU_REG_PIC_TOPFIELD_E(v)	((v) ? BIT(19) : 0)
-#define VDPU_REG_FWD_INTERLACE_E(v)	((v) ? BIT(18) : 0)
-#define VDPU_REG_FILTERING_DIS(v)	((v) ? BIT(14) : 0)
-#define VDPU_REG_WRITE_MVS_E(v)		((v) ? BIT(12) : 0)
-#define VDPU_REG_DEC_AXI_WR_ID(v)	(((v) << 0) & GENMASK(7, 0))
-
-#define VDPU_REG_PIC_MB_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
-#define VDPU_REG_PIC_MB_HEIGHT_P(v)	(((v) << 11) & GENMASK(18, 11))
-#define VDPU_REG_ALT_SCAN_E(v)		((v) ? BIT(6) : 0)
-#define VDPU_REG_TOPFIELDFIRST_E(v)	((v) ? BIT(5) : 0)
-
-#define VDPU_REG_STRM_START_BIT(v)	(((v) << 26) & GENMASK(31, 26))
-#define VDPU_REG_QSCALE_TYPE(v)		((v) ? BIT(24) : 0)
-#define VDPU_REG_CON_MV_E(v)		((v) ? BIT(4) : 0)
-#define VDPU_REG_INTRA_DC_PREC(v)	(((v) << 2) & GENMASK(3, 2))
-#define VDPU_REG_INTRA_VLC_TAB(v)	((v) ? BIT(1) : 0)
-#define VDPU_REG_FRAME_PRED_DCT(v)	((v) ? BIT(0) : 0)
-
-#define VDPU_REG_INIT_QP(v)		(((v) << 25) & GENMASK(30, 25))
-#define VDPU_REG_STREAM_LEN(v)		(((v) << 0) & GENMASK(23, 0))
-
-#define VDPU_REG_ALT_SCAN_FLAG_E(v)	((v) ? BIT(19) : 0)
-#define VDPU_REG_FCODE_FWD_HOR(v)	(((v) << 15) & GENMASK(18, 15))
-#define VDPU_REG_FCODE_FWD_VER(v)	(((v) << 11) & GENMASK(14, 11))
-#define VDPU_REG_FCODE_BWD_HOR(v)	(((v) << 7) & GENMASK(10, 7))
-#define VDPU_REG_FCODE_BWD_VER(v)	(((v) << 3) & GENMASK(6, 3))
-#define VDPU_REG_MV_ACCURACY_FWD(v)	((v) ? BIT(2) : 0)
-#define VDPU_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
-
-#define VDPU_REG_STARTMB_X(v)		(((v) << 23) & GENMASK(31, 23))
-#define VDPU_REG_STARTMB_Y(v)		(((v) << 15) & GENMASK(22, 15))
-
-#define VDPU_REG_APF_THRESHOLD(v)	(((v) << 0) & GENMASK(13, 0))
-
-#define PICT_TOP_FIELD     1
-#define PICT_BOTTOM_FIELD  2
-#define PICT_FRAME         3
-
-static void
-rk3288_vpu_mpeg2_dec_set_quantization(struct rockchip_vpu_dev *vpu,
-				      struct rockchip_vpu_ctx *ctx)
-{
-	struct v4l2_ctrl_mpeg2_quantization *quantization;
-
-	quantization = rockchip_vpu_get_ctrl(ctx,
-				V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
-	rockchip_vpu_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
-					   quantization);
-	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
-			   VDPU_REG_QTABLE_BASE);
-}
-
-static void
-rk3288_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
-				 struct rockchip_vpu_ctx *ctx,
-				 struct vb2_buffer *src_buf,
-				 struct vb2_buffer *dst_buf,
-				 const struct v4l2_mpeg2_sequence *sequence,
-				 const struct v4l2_mpeg2_picture *picture,
-				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
-{
-	dma_addr_t forward_addr = 0, backward_addr = 0;
-	dma_addr_t current_addr, addr;
-	struct vb2_queue *vq;
-
-	vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
-
-	switch (picture->picture_coding_type) {
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
-		backward_addr = rockchip_vpu_get_ref(vq,
-						slice_params->backward_ref_ts);
-		/* fall-through */
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
-		forward_addr = rockchip_vpu_get_ref(vq,
-						slice_params->forward_ref_ts);
-	}
-
-	/* Source bitstream buffer */
-	addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-	vdpu_write_relaxed(vpu, addr, VDPU_REG_RLC_VLC_BASE);
-
-	/* Destination frame buffer */
-	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
-	current_addr = addr;
-
-	if (picture->picture_structure == PICT_BOTTOM_FIELD)
-		addr += ALIGN(ctx->dst_fmt.width, 16);
-	vdpu_write_relaxed(vpu, addr, VDPU_REG_DEC_OUT_BASE);
-
-	if (!forward_addr)
-		forward_addr = current_addr;
-	if (!backward_addr)
-		backward_addr = current_addr;
-
-	/* Set forward ref frame (top/bottom field) */
-	if (picture->picture_structure == PICT_FRAME ||
-	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
-	    (picture->picture_structure == PICT_TOP_FIELD &&
-	     picture->top_field_first) ||
-	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
-	     !picture->top_field_first)) {
-		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
-		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_TOP_FIELD) {
-		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
-		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
-		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER0_BASE);
-		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
-	}
-
-	/* Set backward ref frame (top/bottom field) */
-	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER2_BASE);
-	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
-}
-
-void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
-{
-	struct rockchip_vpu_dev *vpu = ctx->dev;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
-	u32 reg;
-
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
-
-	/* Apply request controls if any */
-	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
-				&ctx->ctrl_handler);
-
-	slice_params = rockchip_vpu_get_ctrl(ctx,
-				V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
-
-	reg = VDPU_REG_DEC_AXI_RD_ID(0) |
-	      VDPU_REG_DEC_TIMEOUT_E(1) |
-	      VDPU_REG_DEC_STRSWAP32_E(1) |
-	      VDPU_REG_DEC_STRENDIAN_E(1) |
-	      VDPU_REG_DEC_INSWAP32_E(1) |
-	      VDPU_REG_DEC_OUTSWAP32_E(1) |
-	      VDPU_REG_DEC_DATA_DISC_E(0) |
-	      VDPU_REG_DEC_LATENCY(0) |
-	      VDPU_REG_DEC_CLK_GATE_E(1) |
-	      VDPU_REG_DEC_IN_ENDIAN(1) |
-	      VDPU_REG_DEC_OUT_ENDIAN(1) |
-	      VDPU_REG_DEC_ADV_PRE_DIS(0) |
-	      VDPU_REG_DEC_SCMD_DIS(0) |
-	      VDPU_REG_DEC_MAX_BURST(16);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(2));
-
-	reg = VDPU_REG_DEC_MODE(5) |
-	      VDPU_REG_RLC_MODE_E(0) |
-	      VDPU_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
-	      VDPU_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
-	      VDPU_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
-	      VDPU_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
-	      VDPU_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
-	      VDPU_REG_FWD_INTERLACE_E(0) |
-	      VDPU_REG_FILTERING_DIS(1) |
-	      VDPU_REG_WRITE_MVS_E(0) |
-	      VDPU_REG_DEC_AXI_WR_ID(0);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(3));
-
-	reg = VDPU_REG_PIC_MB_WIDTH(MPEG2_MB_WIDTH(ctx->dst_fmt.width)) |
-	      VDPU_REG_PIC_MB_HEIGHT_P(MPEG2_MB_HEIGHT(ctx->dst_fmt.height)) |
-	      VDPU_REG_ALT_SCAN_E(picture->alternate_scan) |
-	      VDPU_REG_TOPFIELDFIRST_E(picture->top_field_first);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(4));
-
-	reg = VDPU_REG_STRM_START_BIT(slice_params->data_bit_offset) |
-	      VDPU_REG_QSCALE_TYPE(picture->q_scale_type) |
-	      VDPU_REG_CON_MV_E(picture->concealment_motion_vectors) |
-	      VDPU_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
-	      VDPU_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
-	      VDPU_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(5));
-
-	reg = VDPU_REG_INIT_QP(1) |
-	      VDPU_REG_STREAM_LEN(slice_params->bit_size >> 3);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(6));
-
-	reg = VDPU_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
-	      VDPU_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
-	      VDPU_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
-	      VDPU_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
-	      VDPU_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
-	      VDPU_REG_MV_ACCURACY_FWD(1) |
-	      VDPU_REG_MV_ACCURACY_BWD(1);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(18));
-
-	reg = VDPU_REG_STARTMB_X(0) |
-	      VDPU_REG_STARTMB_Y(0);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(48));
-
-	reg = VDPU_REG_APF_THRESHOLD(8);
-	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(55));
-
-	rk3288_vpu_mpeg2_dec_set_quantization(vpu, ctx);
-
-	rk3288_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
-					 &dst_buf->vb2_buf,
-					 sequence, picture, slice_params);
-
-	/* Controls no longer in-use, we can complete them */
-	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
-				   &ctx->ctrl_handler);
-
-	/* Kick the watchdog and start decoding */
-	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
-
-	reg = VDPU_REG_DEC_E(1);
-	vdpu_write(vpu, reg, VDPU_SWREG(1));
-}
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h b/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
deleted file mode 100644
index c9631b713804..000000000000
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
+++ /dev/null
@@ -1,443 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Rockchip VPU codec driver
- *
- * Copyright 2018 Google LLC.
- *	Tomasz Figa <tfiga@chromium.org>
- */
-
-#ifndef RK3288_VPU_REGS_H_
-#define RK3288_VPU_REGS_H_
-
-/* Encoder registers. */
-#define VEPU_REG_INTERRUPT			0x004
-#define     VEPU_REG_INTERRUPT_FRAME_RDY	BIT(2)
-#define     VEPU_REG_INTERRUPT_DIS_BIT		BIT(1)
-#define     VEPU_REG_INTERRUPT_BIT		BIT(0)
-#define VEPU_REG_AXI_CTRL			0x008
-#define     VEPU_REG_AXI_CTRL_OUTPUT_SWAP16	BIT(15)
-#define     VEPU_REG_AXI_CTRL_INPUT_SWAP16	BIT(14)
-#define     VEPU_REG_AXI_CTRL_BURST_LEN(x)	((x) << 8)
-#define     VEPU_REG_AXI_CTRL_GATE_BIT		BIT(4)
-#define     VEPU_REG_AXI_CTRL_OUTPUT_SWAP32	BIT(3)
-#define     VEPU_REG_AXI_CTRL_INPUT_SWAP32	BIT(2)
-#define     VEPU_REG_AXI_CTRL_OUTPUT_SWAP8	BIT(1)
-#define     VEPU_REG_AXI_CTRL_INPUT_SWAP8	BIT(0)
-#define VEPU_REG_ADDR_OUTPUT_STREAM		0x014
-#define VEPU_REG_ADDR_OUTPUT_CTRL		0x018
-#define VEPU_REG_ADDR_REF_LUMA			0x01c
-#define VEPU_REG_ADDR_REF_CHROMA		0x020
-#define VEPU_REG_ADDR_REC_LUMA			0x024
-#define VEPU_REG_ADDR_REC_CHROMA		0x028
-#define VEPU_REG_ADDR_IN_PLANE_0		0x02c
-#define VEPU_REG_ADDR_IN_PLANE_1		0x030
-#define VEPU_REG_ADDR_IN_PLANE_2		0x034
-#define VEPU_REG_ENC_CTRL			0x038
-#define     VEPU_REG_ENC_CTRL_TIMEOUT_EN	BIT(31)
-#define     VEPU_REG_ENC_CTRL_NAL_MODE_BIT	BIT(29)
-#define     VEPU_REG_ENC_CTRL_WIDTH(w)		((w) << 19)
-#define     VEPU_REG_ENC_CTRL_HEIGHT(h)		((h) << 10)
-#define     VEPU_REG_ENC_PIC_INTER		(0x0 << 3)
-#define     VEPU_REG_ENC_PIC_INTRA		(0x1 << 3)
-#define     VEPU_REG_ENC_PIC_MVCINTER		(0x2 << 3)
-#define     VEPU_REG_ENC_CTRL_ENC_MODE_H264	(0x3 << 1)
-#define     VEPU_REG_ENC_CTRL_ENC_MODE_JPEG	(0x2 << 1)
-#define     VEPU_REG_ENC_CTRL_ENC_MODE_VP8	(0x1 << 1)
-#define     VEPU_REG_ENC_CTRL_EN_BIT		BIT(0)
-#define VEPU_REG_IN_IMG_CTRL			0x03c
-#define     VEPU_REG_IN_IMG_CTRL_ROW_LEN(x)	((x) << 12)
-#define     VEPU_REG_IN_IMG_CTRL_OVRFLR_D4(x)	((x) << 10)
-#define     VEPU_REG_IN_IMG_CTRL_OVRFLB_D4(x)	((x) << 6)
-#define     VEPU_REG_IN_IMG_CTRL_FMT(x)		((x) << 2)
-#define VEPU_REG_ENC_CTRL0			0x040
-#define    VEPU_REG_ENC_CTRL0_INIT_QP(x)		((x) << 26)
-#define    VEPU_REG_ENC_CTRL0_SLICE_ALPHA(x)		((x) << 22)
-#define    VEPU_REG_ENC_CTRL0_SLICE_BETA(x)		((x) << 18)
-#define    VEPU_REG_ENC_CTRL0_CHROMA_QP_OFFSET(x)	((x) << 13)
-#define    VEPU_REG_ENC_CTRL0_FILTER_DIS(x)		((x) << 5)
-#define    VEPU_REG_ENC_CTRL0_IDR_PICID(x)		((x) << 1)
-#define    VEPU_REG_ENC_CTRL0_CONSTR_INTRA_PRED	BIT(0)
-#define VEPU_REG_ENC_CTRL1			0x044
-#define    VEPU_REG_ENC_CTRL1_PPS_ID(x)			((x) << 24)
-#define    VEPU_REG_ENC_CTRL1_INTRA_PRED_MODE(x)	((x) << 16)
-#define    VEPU_REG_ENC_CTRL1_FRAME_NUM(x)		((x))
-#define VEPU_REG_ENC_CTRL2			0x048
-#define    VEPU_REG_ENC_CTRL2_DEBLOCKING_FILETER_MODE(x)	((x) << 30)
-#define    VEPU_REG_ENC_CTRL2_H264_SLICE_SIZE(x)		((x) << 23)
-#define    VEPU_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV		BIT(22)
-#define    VEPU_REG_ENC_CTRL2_TRANS8X8_MODE_EN			BIT(21)
-#define    VEPU_REG_ENC_CTRL2_CABAC_INIT_IDC(x)			((x) << 19)
-#define    VEPU_REG_ENC_CTRL2_ENTROPY_CODING_MODE		BIT(18)
-#define    VEPU_REG_ENC_CTRL2_H264_INTER4X4_MODE		BIT(17)
-#define    VEPU_REG_ENC_CTRL2_H264_STREAM_MODE			BIT(16)
-#define    VEPU_REG_ENC_CTRL2_INTRA16X16_MODE(x)		((x))
-#define VEPU_REG_ENC_CTRL3			0x04c
-#define    VEPU_REG_ENC_CTRL3_MUTIMV_EN			BIT(30)
-#define    VEPU_REG_ENC_CTRL3_MV_PENALTY_1_4P(x)	((x) << 20)
-#define    VEPU_REG_ENC_CTRL3_MV_PENALTY_4P(x)		((x) << 10)
-#define    VEPU_REG_ENC_CTRL3_MV_PENALTY_1P(x)		((x))
-#define VEPU_REG_ENC_CTRL4			0x050
-#define    VEPU_REG_ENC_CTRL4_MV_PENALTY_16X8_8X16(x)	((x) << 20)
-#define    VEPU_REG_ENC_CTRL4_MV_PENALTY_8X8(x)		((x) << 10)
-#define    VEPU_REG_ENC_CTRL4_8X4_4X8(x)		((x))
-#define VEPU_REG_ENC_CTRL5			0x054
-#define    VEPU_REG_ENC_CTRL5_MACROBLOCK_PENALTY(x)	((x) << 24)
-#define    VEPU_REG_ENC_CTRL5_COMPLETE_SLICES(x)	((x) << 16)
-#define    VEPU_REG_ENC_CTRL5_INTER_MODE(x)		((x))
-#define VEPU_REG_STR_HDR_REM_MSB		0x058
-#define VEPU_REG_STR_HDR_REM_LSB		0x05c
-#define VEPU_REG_STR_BUF_LIMIT			0x060
-#define VEPU_REG_MAD_CTRL			0x064
-#define    VEPU_REG_MAD_CTRL_QP_ADJUST(x)	((x) << 28)
-#define    VEPU_REG_MAD_CTRL_MAD_THREDHOLD(x)	((x) << 22)
-#define    VEPU_REG_MAD_CTRL_QP_SUM_DIV2(x)	((x))
-#define VEPU_REG_ADDR_VP8_PROB_CNT		0x068
-#define VEPU_REG_QP_VAL				0x06c
-#define    VEPU_REG_QP_VAL_LUM(x)		((x) << 26)
-#define    VEPU_REG_QP_VAL_MAX(x)		((x) << 20)
-#define    VEPU_REG_QP_VAL_MIN(x)		((x) << 14)
-#define    VEPU_REG_QP_VAL_CHECKPOINT_DISTAN(x)	((x))
-#define VEPU_REG_VP8_QP_VAL(i)			(0x06c + ((i) * 0x4))
-#define VEPU_REG_CHECKPOINT(i)			(0x070 + ((i) * 0x4))
-#define     VEPU_REG_CHECKPOINT_CHECK0(x)	(((x) & 0xffff))
-#define     VEPU_REG_CHECKPOINT_CHECK1(x)	(((x) & 0xffff) << 16)
-#define     VEPU_REG_CHECKPOINT_RESULT(x)	((((x) >> (16 - 16 \
-						 * (i & 1))) & 0xffff) \
-						 * 32)
-#define VEPU_REG_CHKPT_WORD_ERR(i)		(0x084 + ((i) * 0x4))
-#define     VEPU_REG_CHKPT_WORD_ERR_CHK0(x)	(((x) & 0xffff))
-#define     VEPU_REG_CHKPT_WORD_ERR_CHK1(x)	(((x) & 0xffff) << 16)
-#define VEPU_REG_VP8_BOOL_ENC			0x08c
-#define VEPU_REG_CHKPT_DELTA_QP			0x090
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK0(x)	(((x) & 0x0f) << 0)
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK1(x)	(((x) & 0x0f) << 4)
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK2(x)	(((x) & 0x0f) << 8)
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK3(x)	(((x) & 0x0f) << 12)
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK4(x)	(((x) & 0x0f) << 16)
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK5(x)	(((x) & 0x0f) << 20)
-#define     VEPU_REG_CHKPT_DELTA_QP_CHK6(x)	(((x) & 0x0f) << 24)
-#define VEPU_REG_VP8_CTRL0			0x090
-#define VEPU_REG_RLC_CTRL			0x094
-#define     VEPU_REG_RLC_CTRL_STR_OFFS_SHIFT	23
-#define     VEPU_REG_RLC_CTRL_STR_OFFS_MASK	(0x3f << 23)
-#define     VEPU_REG_RLC_CTRL_RLC_SUM(x)	((x))
-#define VEPU_REG_MB_CTRL			0x098
-#define     VEPU_REG_MB_CNT_OUT(x)		(((x) & 0xffff))
-#define     VEPU_REG_MB_CNT_SET(x)		(((x) & 0xffff) << 16)
-#define VEPU_REG_ADDR_NEXT_PIC			0x09c
-#define	VEPU_REG_JPEG_LUMA_QUAT(i)		(0x100 + ((i) * 0x4))
-#define	VEPU_REG_JPEG_CHROMA_QUAT(i)		(0x140 + ((i) * 0x4))
-#define VEPU_REG_STABILIZATION_OUTPUT		0x0A0
-#define VEPU_REG_ADDR_CABAC_TBL			0x0cc
-#define VEPU_REG_ADDR_MV_OUT			0x0d0
-#define VEPU_REG_RGB_YUV_COEFF(i)		(0x0d4 + ((i) * 0x4))
-#define VEPU_REG_RGB_MASK_MSB			0x0dc
-#define VEPU_REG_INTRA_AREA_CTRL		0x0e0
-#define VEPU_REG_CIR_INTRA_CTRL			0x0e4
-#define VEPU_REG_INTRA_SLICE_BITMAP(i)		(0x0e8 + ((i) * 0x4))
-#define VEPU_REG_ADDR_VP8_DCT_PART(i)		(0x0e8 + ((i) * 0x4))
-#define VEPU_REG_FIRST_ROI_AREA			0x0f0
-#define VEPU_REG_SECOND_ROI_AREA		0x0f4
-#define VEPU_REG_MVC_CTRL			0x0f8
-#define	VEPU_REG_MVC_CTRL_MV16X16_FAVOR(x)	((x) << 28)
-#define VEPU_REG_VP8_INTRA_PENALTY(i)		(0x100 + ((i) * 0x4))
-#define VEPU_REG_ADDR_VP8_SEG_MAP		0x11c
-#define VEPU_REG_VP8_SEG_QP(i)			(0x120 + ((i) * 0x4))
-#define VEPU_REG_DMV_4P_1P_PENALTY(i)		(0x180 + ((i) * 0x4))
-#define     VEPU_REG_DMV_4P_1P_PENALTY_BIT(x, i)	((x) << (i) * 8)
-#define VEPU_REG_DMV_QPEL_PENALTY(i)		(0x200 + ((i) * 0x4))
-#define     VEPU_REG_DMV_QPEL_PENALTY_BIT(x, i)	((x) << (i) * 8)
-#define VEPU_REG_VP8_CTRL1			0x280
-#define VEPU_REG_VP8_BIT_COST_GOLDEN		0x284
-#define VEPU_REG_VP8_LOOP_FLT_DELTA(i)		(0x288 + ((i) * 0x4))
-
-/* Decoder registers. */
-#define VDPU_REG_INTERRUPT			0x004
-#define     VDPU_REG_INTERRUPT_DEC_PIC_INF		BIT(24)
-#define     VDPU_REG_INTERRUPT_DEC_TIMEOUT		BIT(18)
-#define     VDPU_REG_INTERRUPT_DEC_SLICE_INT		BIT(17)
-#define     VDPU_REG_INTERRUPT_DEC_ERROR_INT		BIT(16)
-#define     VDPU_REG_INTERRUPT_DEC_ASO_INT		BIT(15)
-#define     VDPU_REG_INTERRUPT_DEC_BUFFER_INT		BIT(14)
-#define     VDPU_REG_INTERRUPT_DEC_BUS_INT		BIT(13)
-#define     VDPU_REG_INTERRUPT_DEC_RDY_INT		BIT(12)
-#define     VDPU_REG_INTERRUPT_DEC_IRQ			BIT(8)
-#define     VDPU_REG_INTERRUPT_DEC_IRQ_DIS		BIT(4)
-#define     VDPU_REG_INTERRUPT_DEC_E			BIT(0)
-#define VDPU_REG_CONFIG				0x008
-#define     VDPU_REG_CONFIG_DEC_AXI_RD_ID(x)		(((x) & 0xff) << 24)
-#define     VDPU_REG_CONFIG_DEC_TIMEOUT_E		BIT(23)
-#define     VDPU_REG_CONFIG_DEC_STRSWAP32_E		BIT(22)
-#define     VDPU_REG_CONFIG_DEC_STRENDIAN_E		BIT(21)
-#define     VDPU_REG_CONFIG_DEC_INSWAP32_E		BIT(20)
-#define     VDPU_REG_CONFIG_DEC_OUTSWAP32_E		BIT(19)
-#define     VDPU_REG_CONFIG_DEC_DATA_DISC_E		BIT(18)
-#define     VDPU_REG_CONFIG_TILED_MODE_MSB		BIT(17)
-#define     VDPU_REG_CONFIG_DEC_OUT_TILED_E		BIT(17)
-#define     VDPU_REG_CONFIG_DEC_LATENCY(x)		(((x) & 0x3f) << 11)
-#define     VDPU_REG_CONFIG_DEC_CLK_GATE_E		BIT(10)
-#define     VDPU_REG_CONFIG_DEC_IN_ENDIAN		BIT(9)
-#define     VDPU_REG_CONFIG_DEC_OUT_ENDIAN		BIT(8)
-#define     VDPU_REG_CONFIG_PRIORITY_MODE(x)		(((x) & 0x7) << 5)
-#define     VDPU_REG_CONFIG_TILED_MODE_LSB		BIT(7)
-#define     VDPU_REG_CONFIG_DEC_ADV_PRE_DIS		BIT(6)
-#define     VDPU_REG_CONFIG_DEC_SCMD_DIS		BIT(5)
-#define     VDPU_REG_CONFIG_DEC_MAX_BURST(x)		(((x) & 0x1f) << 0)
-#define VDPU_REG_DEC_CTRL0			0x00c
-#define     VDPU_REG_DEC_CTRL0_DEC_MODE(x)		(((x) & 0xf) << 28)
-#define     VDPU_REG_DEC_CTRL0_RLC_MODE_E		BIT(27)
-#define     VDPU_REG_DEC_CTRL0_SKIP_MODE		BIT(26)
-#define     VDPU_REG_DEC_CTRL0_DIVX3_E			BIT(25)
-#define     VDPU_REG_DEC_CTRL0_PJPEG_E			BIT(24)
-#define     VDPU_REG_DEC_CTRL0_PIC_INTERLACE_E		BIT(23)
-#define     VDPU_REG_DEC_CTRL0_PIC_FIELDMODE_E		BIT(22)
-#define     VDPU_REG_DEC_CTRL0_PIC_B_E			BIT(21)
-#define     VDPU_REG_DEC_CTRL0_PIC_INTER_E		BIT(20)
-#define     VDPU_REG_DEC_CTRL0_PIC_TOPFIELD_E		BIT(19)
-#define     VDPU_REG_DEC_CTRL0_FWD_INTERLACE_E		BIT(18)
-#define     VDPU_REG_DEC_CTRL0_SORENSON_E		BIT(17)
-#define     VDPU_REG_DEC_CTRL0_REF_TOPFIELD_E		BIT(16)
-#define     VDPU_REG_DEC_CTRL0_DEC_OUT_DIS		BIT(15)
-#define     VDPU_REG_DEC_CTRL0_FILTERING_DIS		BIT(14)
-#define     VDPU_REG_DEC_CTRL0_WEBP_E			BIT(13)
-#define     VDPU_REG_DEC_CTRL0_MVC_E			BIT(13)
-#define     VDPU_REG_DEC_CTRL0_PIC_FIXED_QUANT		BIT(13)
-#define     VDPU_REG_DEC_CTRL0_WRITE_MVS_E		BIT(12)
-#define     VDPU_REG_DEC_CTRL0_REFTOPFIRST_E		BIT(11)
-#define     VDPU_REG_DEC_CTRL0_SEQ_MBAFF_E		BIT(10)
-#define     VDPU_REG_DEC_CTRL0_PICORD_COUNT_E		BIT(9)
-#define     VDPU_REG_DEC_CTRL0_DEC_AHB_HLOCK_E		BIT(8)
-#define     VDPU_REG_DEC_CTRL0_DEC_AXI_WR_ID(x)		(((x) & 0xff) << 0)
-#define VDPU_REG_DEC_CTRL1			0x010
-#define     VDPU_REG_DEC_CTRL1_PIC_MB_WIDTH(x)		(((x) & 0x1ff) << 23)
-#define     VDPU_REG_DEC_CTRL1_MB_WIDTH_OFF(x)		(((x) & 0xf) << 19)
-#define     VDPU_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(x)	(((x) & 0xff) << 11)
-#define     VDPU_REG_DEC_CTRL1_MB_HEIGHT_OFF(x)		(((x) & 0xf) << 7)
-#define     VDPU_REG_DEC_CTRL1_ALT_SCAN_E		BIT(6)
-#define     VDPU_REG_DEC_CTRL1_TOPFIELDFIRST_E		BIT(5)
-#define     VDPU_REG_DEC_CTRL1_REF_FRAMES(x)		(((x) & 0x1f) << 0)
-#define     VDPU_REG_DEC_CTRL1_PIC_MB_W_EXT(x)		(((x) & 0x7) << 3)
-#define     VDPU_REG_DEC_CTRL1_PIC_MB_H_EXT(x)		(((x) & 0x7) << 0)
-#define     VDPU_REG_DEC_CTRL1_PIC_REFER_FLAG		BIT(0)
-#define VDPU_REG_DEC_CTRL2			0x014
-#define     VDPU_REG_DEC_CTRL2_STRM_START_BIT(x)	(((x) & 0x3f) << 26)
-#define     VDPU_REG_DEC_CTRL2_SYNC_MARKER_E		BIT(25)
-#define     VDPU_REG_DEC_CTRL2_TYPE1_QUANT_E		BIT(24)
-#define     VDPU_REG_DEC_CTRL2_CH_QP_OFFSET(x)		(((x) & 0x1f) << 19)
-#define     VDPU_REG_DEC_CTRL2_CH_QP_OFFSET2(x)		(((x) & 0x1f) << 14)
-#define     VDPU_REG_DEC_CTRL2_FIELDPIC_FLAG_E		BIT(0)
-#define     VDPU_REG_DEC_CTRL2_INTRADC_VLC_THR(x)	(((x) & 0x7) << 16)
-#define     VDPU_REG_DEC_CTRL2_VOP_TIME_INCR(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_DEC_CTRL2_DQ_PROFILE		BIT(24)
-#define     VDPU_REG_DEC_CTRL2_DQBI_LEVEL		BIT(23)
-#define     VDPU_REG_DEC_CTRL2_RANGE_RED_FRM_E		BIT(22)
-#define     VDPU_REG_DEC_CTRL2_FAST_UVMC_E		BIT(20)
-#define     VDPU_REG_DEC_CTRL2_TRANSDCTAB		BIT(17)
-#define     VDPU_REG_DEC_CTRL2_TRANSACFRM(x)		(((x) & 0x3) << 15)
-#define     VDPU_REG_DEC_CTRL2_TRANSACFRM2(x)		(((x) & 0x3) << 13)
-#define     VDPU_REG_DEC_CTRL2_MB_MODE_TAB(x)		(((x) & 0x7) << 10)
-#define     VDPU_REG_DEC_CTRL2_MVTAB(x)			(((x) & 0x7) << 7)
-#define     VDPU_REG_DEC_CTRL2_CBPTAB(x)		(((x) & 0x7) << 4)
-#define     VDPU_REG_DEC_CTRL2_2MV_BLK_PAT_TAB(x)	(((x) & 0x3) << 2)
-#define     VDPU_REG_DEC_CTRL2_4MV_BLK_PAT_TAB(x)	(((x) & 0x3) << 0)
-#define     VDPU_REG_DEC_CTRL2_QSCALE_TYPE		BIT(24)
-#define     VDPU_REG_DEC_CTRL2_CON_MV_E			BIT(4)
-#define     VDPU_REG_DEC_CTRL2_INTRA_DC_PREC(x)		(((x) & 0x3) << 2)
-#define     VDPU_REG_DEC_CTRL2_INTRA_VLC_TAB		BIT(1)
-#define     VDPU_REG_DEC_CTRL2_FRAME_PRED_DCT		BIT(0)
-#define     VDPU_REG_DEC_CTRL2_JPEG_QTABLES(x)		(((x) & 0x3) << 11)
-#define     VDPU_REG_DEC_CTRL2_JPEG_MODE(x)		(((x) & 0x7) << 8)
-#define     VDPU_REG_DEC_CTRL2_JPEG_FILRIGHT_E		BIT(7)
-#define     VDPU_REG_DEC_CTRL2_JPEG_STREAM_ALL		BIT(6)
-#define     VDPU_REG_DEC_CTRL2_CR_AC_VLCTABLE		BIT(5)
-#define     VDPU_REG_DEC_CTRL2_CB_AC_VLCTABLE		BIT(4)
-#define     VDPU_REG_DEC_CTRL2_CR_DC_VLCTABLE		BIT(3)
-#define     VDPU_REG_DEC_CTRL2_CB_DC_VLCTABLE		BIT(2)
-#define     VDPU_REG_DEC_CTRL2_CR_DC_VLCTABLE3		BIT(1)
-#define     VDPU_REG_DEC_CTRL2_CB_DC_VLCTABLE3		BIT(0)
-#define     VDPU_REG_DEC_CTRL2_STRM1_START_BIT(x)	(((x) & 0x3f) << 18)
-#define     VDPU_REG_DEC_CTRL2_HUFFMAN_E		BIT(17)
-#define     VDPU_REG_DEC_CTRL2_MULTISTREAM_E		BIT(16)
-#define     VDPU_REG_DEC_CTRL2_BOOLEAN_VALUE(x)		(((x) & 0xff) << 8)
-#define     VDPU_REG_DEC_CTRL2_BOOLEAN_RANGE(x)		(((x) & 0xff) << 0)
-#define     VDPU_REG_DEC_CTRL2_ALPHA_OFFSET(x)		(((x) & 0x1f) << 5)
-#define     VDPU_REG_DEC_CTRL2_BETA_OFFSET(x)		(((x) & 0x1f) << 0)
-#define VDPU_REG_DEC_CTRL3			0x018
-#define     VDPU_REG_DEC_CTRL3_START_CODE_E		BIT(31)
-#define     VDPU_REG_DEC_CTRL3_INIT_QP(x)		(((x) & 0x3f) << 25)
-#define     VDPU_REG_DEC_CTRL3_CH_8PIX_ILEAV_E		BIT(24)
-#define     VDPU_REG_DEC_CTRL3_STREAM_LEN_EXT(x)	(((x) & 0xff) << 24)
-#define     VDPU_REG_DEC_CTRL3_STREAM_LEN(x)		(((x) & 0xffffff) << 0)
-#define VDPU_REG_DEC_CTRL4			0x01c
-#define     VDPU_REG_DEC_CTRL4_CABAC_E			BIT(31)
-#define     VDPU_REG_DEC_CTRL4_BLACKWHITE_E		BIT(30)
-#define     VDPU_REG_DEC_CTRL4_DIR_8X8_INFER_E		BIT(29)
-#define     VDPU_REG_DEC_CTRL4_WEIGHT_PRED_E		BIT(28)
-#define     VDPU_REG_DEC_CTRL4_WEIGHT_BIPR_IDC(x)	(((x) & 0x3) << 26)
-#define     VDPU_REG_DEC_CTRL4_AVS_H264_H_EXT		BIT(25)
-#define     VDPU_REG_DEC_CTRL4_FRAMENUM_LEN(x)		(((x) & 0x1f) << 16)
-#define     VDPU_REG_DEC_CTRL4_FRAMENUM(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_DEC_CTRL4_BITPLANE0_E		BIT(31)
-#define     VDPU_REG_DEC_CTRL4_BITPLANE1_E		BIT(30)
-#define     VDPU_REG_DEC_CTRL4_BITPLANE2_E		BIT(29)
-#define     VDPU_REG_DEC_CTRL4_ALT_PQUANT(x)		(((x) & 0x1f) << 24)
-#define     VDPU_REG_DEC_CTRL4_DQ_EDGES(x)		(((x) & 0xf) << 20)
-#define     VDPU_REG_DEC_CTRL4_TTMBF			BIT(19)
-#define     VDPU_REG_DEC_CTRL4_PQINDEX(x)		(((x) & 0x1f) << 14)
-#define     VDPU_REG_DEC_CTRL4_VC1_HEIGHT_EXT		BIT(13)
-#define     VDPU_REG_DEC_CTRL4_BILIN_MC_E		BIT(12)
-#define     VDPU_REG_DEC_CTRL4_UNIQP_E			BIT(11)
-#define     VDPU_REG_DEC_CTRL4_HALFQP_E			BIT(10)
-#define     VDPU_REG_DEC_CTRL4_TTFRM(x)			(((x) & 0x3) << 8)
-#define     VDPU_REG_DEC_CTRL4_2ND_BYTE_EMUL_E		BIT(7)
-#define     VDPU_REG_DEC_CTRL4_DQUANT_E			BIT(6)
-#define     VDPU_REG_DEC_CTRL4_VC1_ADV_E		BIT(5)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_FILDOWN_E		BIT(26)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_WDIV8		BIT(25)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_HDIV8		BIT(24)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_AH(x)		(((x) & 0xf) << 20)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_AL(x)		(((x) & 0xf) << 16)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_SS(x)		(((x) & 0xff) << 8)
-#define     VDPU_REG_DEC_CTRL4_PJPEG_SE(x)		(((x) & 0xff) << 0)
-#define     VDPU_REG_DEC_CTRL4_DCT1_START_BIT(x)	(((x) & 0x3f) << 26)
-#define     VDPU_REG_DEC_CTRL4_DCT2_START_BIT(x)	(((x) & 0x3f) << 20)
-#define     VDPU_REG_DEC_CTRL4_CH_MV_RES		BIT(13)
-#define     VDPU_REG_DEC_CTRL4_INIT_DC_MATCH0(x)	(((x) & 0x7) << 9)
-#define     VDPU_REG_DEC_CTRL4_INIT_DC_MATCH1(x)	(((x) & 0x7) << 6)
-#define     VDPU_REG_DEC_CTRL4_VP7_VERSION		BIT(5)
-#define VDPU_REG_DEC_CTRL5			0x020
-#define     VDPU_REG_DEC_CTRL5_CONST_INTRA_E		BIT(31)
-#define     VDPU_REG_DEC_CTRL5_FILT_CTRL_PRES		BIT(30)
-#define     VDPU_REG_DEC_CTRL5_RDPIC_CNT_PRES		BIT(29)
-#define     VDPU_REG_DEC_CTRL5_8X8TRANS_FLAG_E		BIT(28)
-#define     VDPU_REG_DEC_CTRL5_REFPIC_MK_LEN(x)		(((x) & 0x7ff) << 17)
-#define     VDPU_REG_DEC_CTRL5_IDR_PIC_E		BIT(16)
-#define     VDPU_REG_DEC_CTRL5_IDR_PIC_ID(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_DEC_CTRL5_MV_SCALEFACTOR(x)	(((x) & 0xff) << 24)
-#define     VDPU_REG_DEC_CTRL5_REF_DIST_FWD(x)		(((x) & 0x1f) << 19)
-#define     VDPU_REG_DEC_CTRL5_REF_DIST_BWD(x)		(((x) & 0x1f) << 14)
-#define     VDPU_REG_DEC_CTRL5_LOOP_FILT_LIMIT(x)	(((x) & 0xf) << 14)
-#define     VDPU_REG_DEC_CTRL5_VARIANCE_TEST_E		BIT(13)
-#define     VDPU_REG_DEC_CTRL5_MV_THRESHOLD(x)		(((x) & 0x7) << 10)
-#define     VDPU_REG_DEC_CTRL5_VAR_THRESHOLD(x)		(((x) & 0x3ff) << 0)
-#define     VDPU_REG_DEC_CTRL5_DIVX_IDCT_E		BIT(8)
-#define     VDPU_REG_DEC_CTRL5_DIVX3_SLICE_SIZE(x)	(((x) & 0xff) << 0)
-#define     VDPU_REG_DEC_CTRL5_PJPEG_REST_FREQ(x)	(((x) & 0xffff) << 0)
-#define     VDPU_REG_DEC_CTRL5_RV_PROFILE(x)		(((x) & 0x3) << 30)
-#define     VDPU_REG_DEC_CTRL5_RV_OSV_QUANT(x)		(((x) & 0x3) << 28)
-#define     VDPU_REG_DEC_CTRL5_RV_FWD_SCALE(x)		(((x) & 0x3fff) << 14)
-#define     VDPU_REG_DEC_CTRL5_RV_BWD_SCALE(x)		(((x) & 0x3fff) << 0)
-#define     VDPU_REG_DEC_CTRL5_INIT_DC_COMP0(x)		(((x) & 0xffff) << 16)
-#define     VDPU_REG_DEC_CTRL5_INIT_DC_COMP1(x)		(((x) & 0xffff) << 0)
-#define VDPU_REG_DEC_CTRL6			0x024
-#define     VDPU_REG_DEC_CTRL6_PPS_ID(x)		(((x) & 0xff) << 24)
-#define     VDPU_REG_DEC_CTRL6_REFIDX1_ACTIVE(x)	(((x) & 0x1f) << 19)
-#define     VDPU_REG_DEC_CTRL6_REFIDX0_ACTIVE(x)	(((x) & 0x1f) << 14)
-#define     VDPU_REG_DEC_CTRL6_POC_LENGTH(x)		(((x) & 0xff) << 0)
-#define     VDPU_REG_DEC_CTRL6_ICOMP0_E			BIT(24)
-#define     VDPU_REG_DEC_CTRL6_ISCALE0(x)		(((x) & 0xff) << 16)
-#define     VDPU_REG_DEC_CTRL6_ISHIFT0(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_DEC_CTRL6_STREAM1_LEN(x)		(((x) & 0xffffff) << 0)
-#define     VDPU_REG_DEC_CTRL6_PIC_SLICE_AM(x)		(((x) & 0x1fff) << 0)
-#define     VDPU_REG_DEC_CTRL6_COEFFS_PART_AM(x)	(((x) & 0xf) << 24)
-#define VDPU_REG_FWD_PIC(i)			(0x028 + ((i) * 0x4))
-#define     VDPU_REG_FWD_PIC_PINIT_RLIST_F5(x)		(((x) & 0x1f) << 25)
-#define     VDPU_REG_FWD_PIC_PINIT_RLIST_F4(x)		(((x) & 0x1f) << 20)
-#define     VDPU_REG_FWD_PIC_PINIT_RLIST_F3(x)		(((x) & 0x1f) << 15)
-#define     VDPU_REG_FWD_PIC_PINIT_RLIST_F2(x)		(((x) & 0x1f) << 10)
-#define     VDPU_REG_FWD_PIC_PINIT_RLIST_F1(x)		(((x) & 0x1f) << 5)
-#define     VDPU_REG_FWD_PIC_PINIT_RLIST_F0(x)		(((x) & 0x1f) << 0)
-#define     VDPU_REG_FWD_PIC1_ICOMP1_E			BIT(24)
-#define     VDPU_REG_FWD_PIC1_ISCALE1(x)		(((x) & 0xff) << 16)
-#define     VDPU_REG_FWD_PIC1_ISHIFT1(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_FWD_PIC1_SEGMENT_BASE(x)		((x) << 0)
-#define     VDPU_REG_FWD_PIC1_SEGMENT_UPD_E		BIT(1)
-#define     VDPU_REG_FWD_PIC1_SEGMENT_E			BIT(0)
-#define VDPU_REG_DEC_CTRL7			0x02c
-#define     VDPU_REG_DEC_CTRL7_PINIT_RLIST_F15(x)	(((x) & 0x1f) << 25)
-#define     VDPU_REG_DEC_CTRL7_PINIT_RLIST_F14(x)	(((x) & 0x1f) << 20)
-#define     VDPU_REG_DEC_CTRL7_PINIT_RLIST_F13(x)	(((x) & 0x1f) << 15)
-#define     VDPU_REG_DEC_CTRL7_PINIT_RLIST_F12(x)	(((x) & 0x1f) << 10)
-#define     VDPU_REG_DEC_CTRL7_PINIT_RLIST_F11(x)	(((x) & 0x1f) << 5)
-#define     VDPU_REG_DEC_CTRL7_PINIT_RLIST_F10(x)	(((x) & 0x1f) << 0)
-#define     VDPU_REG_DEC_CTRL7_ICOMP2_E			BIT(24)
-#define     VDPU_REG_DEC_CTRL7_ISCALE2(x)		(((x) & 0xff) << 16)
-#define     VDPU_REG_DEC_CTRL7_ISHIFT2(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_DEC_CTRL7_DCT3_START_BIT(x)	(((x) & 0x3f) << 24)
-#define     VDPU_REG_DEC_CTRL7_DCT4_START_BIT(x)	(((x) & 0x3f) << 18)
-#define     VDPU_REG_DEC_CTRL7_DCT5_START_BIT(x)	(((x) & 0x3f) << 12)
-#define     VDPU_REG_DEC_CTRL7_DCT6_START_BIT(x)	(((x) & 0x3f) << 6)
-#define     VDPU_REG_DEC_CTRL7_DCT7_START_BIT(x)	(((x) & 0x3f) << 0)
-#define VDPU_REG_ADDR_STR			0x030
-#define VDPU_REG_ADDR_DST			0x034
-#define VDPU_REG_ADDR_REF(i)			(0x038 + ((i) * 0x4))
-#define     VDPU_REG_ADDR_REF_FIELD_E			BIT(1)
-#define     VDPU_REG_ADDR_REF_TOPC_E			BIT(0)
-#define VDPU_REG_REF_PIC(i)			(0x078 + ((i) * 0x4))
-#define     VDPU_REG_REF_PIC_FILT_TYPE_E		BIT(31)
-#define     VDPU_REG_REF_PIC_FILT_SHARPNESS(x)	(((x) & 0x7) << 28)
-#define     VDPU_REG_REF_PIC_MB_ADJ_0(x)		(((x) & 0x7f) << 21)
-#define     VDPU_REG_REF_PIC_MB_ADJ_1(x)		(((x) & 0x7f) << 14)
-#define     VDPU_REG_REF_PIC_MB_ADJ_2(x)		(((x) & 0x7f) << 7)
-#define     VDPU_REG_REF_PIC_MB_ADJ_3(x)		(((x) & 0x7f) << 0)
-#define     VDPU_REG_REF_PIC_REFER1_NBR(x)		(((x) & 0xffff) << 16)
-#define     VDPU_REG_REF_PIC_REFER0_NBR(x)		(((x) & 0xffff) << 0)
-#define     VDPU_REG_REF_PIC_LF_LEVEL_0(x)		(((x) & 0x3f) << 18)
-#define     VDPU_REG_REF_PIC_LF_LEVEL_1(x)		(((x) & 0x3f) << 12)
-#define     VDPU_REG_REF_PIC_LF_LEVEL_2(x)		(((x) & 0x3f) << 6)
-#define     VDPU_REG_REF_PIC_LF_LEVEL_3(x)		(((x) & 0x3f) << 0)
-#define     VDPU_REG_REF_PIC_QUANT_DELTA_0(x)	(((x) & 0x1f) << 27)
-#define     VDPU_REG_REF_PIC_QUANT_DELTA_1(x)	(((x) & 0x1f) << 22)
-#define     VDPU_REG_REF_PIC_QUANT_0(x)			(((x) & 0x7ff) << 11)
-#define     VDPU_REG_REF_PIC_QUANT_1(x)			(((x) & 0x7ff) << 0)
-#define VDPU_REG_LT_REF				0x098
-#define VDPU_REG_VALID_REF			0x09c
-#define VDPU_REG_ADDR_QTABLE			0x0a0
-#define VDPU_REG_ADDR_DIR_MV			0x0a4
-#define VDPU_REG_BD_REF_PIC(i)			(0x0a8 + ((i) * 0x4))
-#define     VDPU_REG_BD_REF_PIC_BINIT_RLIST_B2(x)	(((x) & 0x1f) << 25)
-#define     VDPU_REG_BD_REF_PIC_BINIT_RLIST_F2(x)	(((x) & 0x1f) << 20)
-#define     VDPU_REG_BD_REF_PIC_BINIT_RLIST_B1(x)	(((x) & 0x1f) << 15)
-#define     VDPU_REG_BD_REF_PIC_BINIT_RLIST_F1(x)	(((x) & 0x1f) << 10)
-#define     VDPU_REG_BD_REF_PIC_BINIT_RLIST_B0(x)	(((x) & 0x1f) << 5)
-#define     VDPU_REG_BD_REF_PIC_BINIT_RLIST_F0(x)	(((x) & 0x1f) << 0)
-#define     VDPU_REG_BD_REF_PIC_PRED_TAP_2_M1(x)	(((x) & 0x3) << 10)
-#define     VDPU_REG_BD_REF_PIC_PRED_TAP_2_4(x)		(((x) & 0x3) << 8)
-#define     VDPU_REG_BD_REF_PIC_PRED_TAP_4_M1(x)	(((x) & 0x3) << 6)
-#define     VDPU_REG_BD_REF_PIC_PRED_TAP_4_4(x)		(((x) & 0x3) << 4)
-#define     VDPU_REG_BD_REF_PIC_PRED_TAP_6_M1(x)	(((x) & 0x3) << 2)
-#define     VDPU_REG_BD_REF_PIC_PRED_TAP_6_4(x)		(((x) & 0x3) << 0)
-#define     VDPU_REG_BD_REF_PIC_QUANT_DELTA_2(x)	(((x) & 0x1f) << 27)
-#define     VDPU_REG_BD_REF_PIC_QUANT_DELTA_3(x)	(((x) & 0x1f) << 22)
-#define     VDPU_REG_BD_REF_PIC_QUANT_2(x)		(((x) & 0x7ff) << 11)
-#define     VDPU_REG_BD_REF_PIC_QUANT_3(x)		(((x) & 0x7ff) << 0)
-#define VDPU_REG_BD_P_REF_PIC			0x0bc
-#define     VDPU_REG_BD_P_REF_PIC_QUANT_DELTA_4(x)	(((x) & 0x1f) << 27)
-#define     VDPU_REG_BD_P_REF_PIC_PINIT_RLIST_F3(x)	(((x) & 0x1f) << 25)
-#define     VDPU_REG_BD_P_REF_PIC_PINIT_RLIST_F2(x)	(((x) & 0x1f) << 20)
-#define     VDPU_REG_BD_P_REF_PIC_PINIT_RLIST_F1(x)	(((x) & 0x1f) << 15)
-#define     VDPU_REG_BD_P_REF_PIC_PINIT_RLIST_F0(x)	(((x) & 0x1f) << 10)
-#define     VDPU_REG_BD_P_REF_PIC_BINIT_RLIST_B15(x)	(((x) & 0x1f) << 5)
-#define     VDPU_REG_BD_P_REF_PIC_BINIT_RLIST_F15(x)	(((x) & 0x1f) << 0)
-#define VDPU_REG_ERR_CONC			0x0c0
-#define     VDPU_REG_ERR_CONC_STARTMB_X(x)		(((x) & 0x1ff) << 23)
-#define     VDPU_REG_ERR_CONC_STARTMB_Y(x)		(((x) & 0xff) << 15)
-#define VDPU_REG_PRED_FLT			0x0c4
-#define     VDPU_REG_PRED_FLT_PRED_BC_TAP_0_0(x)	(((x) & 0x3ff) << 22)
-#define     VDPU_REG_PRED_FLT_PRED_BC_TAP_0_1(x)	(((x) & 0x3ff) << 12)
-#define     VDPU_REG_PRED_FLT_PRED_BC_TAP_0_2(x)	(((x) & 0x3ff) << 2)
-#define VDPU_REG_REF_BUF_CTRL			0x0cc
-#define     VDPU_REG_REF_BUF_CTRL_REFBU_E		BIT(31)
-#define     VDPU_REG_REF_BUF_CTRL_REFBU_THR(x)		(((x) & 0xfff) << 19)
-#define     VDPU_REG_REF_BUF_CTRL_REFBU_PICID(x)	(((x) & 0x1f) << 14)
-#define     VDPU_REG_REF_BUF_CTRL_REFBU_EVAL_E		BIT(13)
-#define     VDPU_REG_REF_BUF_CTRL_REFBU_FPARMOD_E	BIT(12)
-#define     VDPU_REG_REF_BUF_CTRL_REFBU_Y_OFFSET(x)	(((x) & 0x1ff) << 0)
-#define VDPU_REG_REF_BUF_CTRL2			0x0dc
-#define     VDPU_REG_REF_BUF_CTRL2_REFBU2_BUF_E		BIT(31)
-#define     VDPU_REG_REF_BUF_CTRL2_REFBU2_THR(x)	(((x) & 0xfff) << 19)
-#define     VDPU_REG_REF_BUF_CTRL2_REFBU2_PICID(x)	(((x) & 0x1f) << 14)
-#define     VDPU_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
-#define VDPU_REG_SOFT_RESET			0x194
-
-#endif /* RK3288_VPU_REGS_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
deleted file mode 100644
index 3d6b97af90fb..000000000000
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
+++ /dev/null
@@ -1,103 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Rockchip VPU codec driver
- *
- * Copyright 2018 Google LLC.
- *	Tomasz Figa <tfiga@chromium.org>
- */
-
-#ifndef ROCKCHIP_VPU_HW_H_
-#define ROCKCHIP_VPU_HW_H_
-
-#include <linux/interrupt.h>
-#include <linux/v4l2-controls.h>
-#include <media/mpeg2-ctrls.h>
-#include <media/videobuf2-core.h>
-
-struct rockchip_vpu_dev;
-struct rockchip_vpu_ctx;
-struct rockchip_vpu_buf;
-struct rockchip_vpu_variant;
-
-/**
- * struct rockchip_vpu_aux_buf - auxiliary DMA buffer for hardware data
- * @cpu:	CPU pointer to the buffer.
- * @dma:	DMA address of the buffer.
- * @size:	Size of the buffer.
- */
-struct rockchip_vpu_aux_buf {
-	void *cpu;
-	dma_addr_t dma;
-	size_t size;
-};
-
-/**
- * struct rockchip_vpu_jpeg_enc_hw_ctx
- * @bounce_buffer:	Bounce buffer
- */
-struct rockchip_vpu_jpeg_enc_hw_ctx {
-	struct rockchip_vpu_aux_buf bounce_buffer;
-};
-
-/**
- * struct rockchip_vpu_mpeg2_dec_hw_ctx
- * @qtable:		Quantization table
- */
-struct rockchip_vpu_mpeg2_dec_hw_ctx {
-	struct rockchip_vpu_aux_buf qtable;
-};
-
-/**
- * struct rockchip_vpu_codec_ops - codec mode specific operations
- *
- * @init:	If needed, can be used for initialization.
- *		Optional and called from process context.
- * @exit:	If needed, can be used to undo the .init phase.
- *		Optional and called from process context.
- * @run:	Start single {en,de)coding job. Called from atomic context
- *		to indicate that a pair of buffers is ready and the hardware
- *		should be programmed and started.
- * @done:	Read back processing results and additional data from hardware.
- * @reset:	Reset the hardware in case of a timeout.
- */
-struct rockchip_vpu_codec_ops {
-	int (*init)(struct rockchip_vpu_ctx *ctx);
-	void (*exit)(struct rockchip_vpu_ctx *ctx);
-	void (*run)(struct rockchip_vpu_ctx *ctx);
-	void (*done)(struct rockchip_vpu_ctx *ctx, enum vb2_buffer_state);
-	void (*reset)(struct rockchip_vpu_ctx *ctx);
-};
-
-/**
- * enum rockchip_vpu_enc_fmt - source format ID for hardware registers.
- */
-enum rockchip_vpu_enc_fmt {
-	RK3288_VPU_ENC_FMT_YUV420P = 0,
-	RK3288_VPU_ENC_FMT_YUV420SP = 1,
-	RK3288_VPU_ENC_FMT_YUYV422 = 2,
-	RK3288_VPU_ENC_FMT_UYVY422 = 3,
-};
-
-extern const struct rockchip_vpu_variant rk3399_vpu_variant;
-extern const struct rockchip_vpu_variant rk3328_vpu_variant;
-extern const struct rockchip_vpu_variant rk3288_vpu_variant;
-
-void rockchip_vpu_watchdog(struct work_struct *work);
-void rockchip_vpu_run(struct rockchip_vpu_ctx *ctx);
-void rockchip_vpu_irq_done(struct rockchip_vpu_dev *vpu,
-			   unsigned int bytesused,
-			   enum vb2_buffer_state result);
-
-void rk3288_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx);
-void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx);
-int rockchip_vpu_jpeg_enc_init(struct rockchip_vpu_ctx *ctx);
-void rockchip_vpu_jpeg_enc_exit(struct rockchip_vpu_ctx *ctx);
-
-void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx);
-void rk3399_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx);
-void rockchip_vpu_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
-int rockchip_vpu_mpeg2_dec_init(struct rockchip_vpu_ctx *ctx);
-void rockchip_vpu_mpeg2_dec_exit(struct rockchip_vpu_ctx *ctx);
-
-#endif /* ROCKCHIP_VPU_HW_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h
deleted file mode 100644
index 72645d8e2ade..000000000000
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-
-#define JPEG_HEADER_SIZE	601
-
-struct rockchip_vpu_jpeg_ctx {
-	int width;
-	int height;
-	int quality;
-	unsigned char *buffer;
-};
-
-unsigned char *
-rockchip_vpu_jpeg_get_qtable(struct rockchip_vpu_jpeg_ctx *ctx, int index);
-void rockchip_vpu_jpeg_header_assemble(struct rockchip_vpu_jpeg_ctx *ctx);
-- 
2.20.1

