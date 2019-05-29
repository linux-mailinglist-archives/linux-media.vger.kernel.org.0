Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E90A2D996
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 11:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfE2Jyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 05:54:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47695 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfE2Jye (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 05:54:34 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hVvHz-0002DF-2g; Wed, 29 May 2019 11:54:31 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 1/9] rockchip/vpu: rename from rockchip to hantro
Date:   Wed, 29 May 2019 11:54:16 +0200
Message-Id: <20190529095424.23614-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529095424.23614-1-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
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
Changes since v1 [1]:
 - Rebased onto "[PATCH v6] Add MPEG-2 decoding to Rockchip VPU" series.

[1] https://patchwork.linuxtv.org/patch/56283/
---
 MAINTAINERS                                   |   4 +-
 drivers/staging/media/Kconfig                 |   2 +-
 drivers/staging/media/Makefile                |   2 +-
 .../media/{rockchip/vpu => hantro}/Kconfig    |  11 +-
 drivers/staging/media/hantro/Makefile         |  13 +
 .../media/{rockchip/vpu => hantro}/TODO       |   0
 .../vpu/rockchip_vpu.h => hantro/hantro.h}    | 136 +++++-----
 .../hantro_drv.c}                             | 251 +++++++++---------
 .../hantro_g1_mpeg2_dec.c}                    |  55 ++--
 .../hantro_h1_jpeg_enc.c}                     |  44 +--
 drivers/staging/media/hantro/hantro_hw.h      | 102 +++++++
 .../hantro_jpeg.c}                            |  18 +-
 drivers/staging/media/hantro/hantro_jpeg.h    |  13 +
 .../hantro_mpeg2.c}                           |  14 +-
 .../hantro_v4l2.c}                            | 234 ++++++++--------
 .../hantro_v4l2.h}                            |  16 +-
 .../{rockchip/vpu => hantro}/rk3288_vpu_hw.c  |  64 ++---
 .../vpu => hantro}/rk3288_vpu_regs.h          |   2 +-
 .../{rockchip/vpu => hantro}/rk3399_vpu_hw.c  |  64 ++---
 .../vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c   |  32 +--
 .../vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c  |  37 ++-
 .../vpu => hantro}/rk3399_vpu_regs.h          |   2 +-
 drivers/staging/media/rockchip/vpu/Makefile   |  14 -
 .../media/rockchip/vpu/rockchip_vpu_hw.h      | 103 -------
 .../media/rockchip/vpu/rockchip_vpu_jpeg.h    |  14 -
 25 files changed, 616 insertions(+), 631 deletions(-)
 rename drivers/staging/media/{rockchip/vpu => hantro}/Kconfig (59%)
 create mode 100644 drivers/staging/media/hantro/Makefile
 rename drivers/staging/media/{rockchip/vpu => hantro}/TODO (100%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu.h => hantro/hantro.h} (69%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_drv.c => hantro/hantro_drv.c} (74%)
 rename drivers/staging/media/{rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c => hantro/hantro_g1_mpeg2_dec.c} (87%)
 rename drivers/staging/media/{rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c => hantro/hantro_h1_jpeg_enc.c} (76%)
 create mode 100644 drivers/staging/media/hantro/hantro_hw.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_jpeg.c => hantro/hantro_jpeg.c} (95%)
 create mode 100644 drivers/staging/media/hantro/hantro_jpeg.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_mpeg2.c => hantro/hantro_mpeg2.c} (79%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.c => hantro/hantro_v4l2.c} (69%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.h => hantro/hantro_v4l2.h} (53%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3288_vpu_hw.c (68%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3288_vpu_regs.h (99%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw.c (69%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c (86%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c (92%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_regs.h (99%)
 delete mode 100644 drivers/staging/media/rockchip/vpu/Makefile
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
index f77f5eee7fc2..1ce605a93408 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -28,7 +28,7 @@ source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/omap4iss/Kconfig"
 
-source "drivers/staging/media/rockchip/vpu/Kconfig"
+source "drivers/staging/media/hantro/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
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
diff --git a/drivers/staging/media/rockchip/vpu/Kconfig b/drivers/staging/media/hantro/Kconfig
similarity index 59%
rename from drivers/staging/media/rockchip/vpu/Kconfig
rename to drivers/staging/media/hantro/Kconfig
index 842b003e08b8..660cca358f04 100644
--- a/drivers/staging/media/rockchip/vpu/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-config VIDEO_ROCKCHIP_VPU
-	tristate "Rockchip VPU driver"
+config VIDEO_HANTRO
+	tristate "Hantro VPU driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
 	depends on MEDIA_CONTROLLER_REQUEST_API
@@ -8,7 +8,8 @@ config VIDEO_ROCKCHIP_VPU
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	help
-	  Support for the Video Processing Unit present on Rockchip SoC,
-	  which accelerates video and image encoding and decoding.
+	  Support for the Hantro IP based Video Processing Unit present on
+	  Rockchip SoC, which accelerates video and image encoding and
+	  decoding.
 	  To compile this driver as a module, choose M here: the module
-	  will be called rockchip-vpu.
+	  will be called hantro-vpu.
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
new file mode 100644
index 000000000000..14f17a4e48cb
--- /dev/null
+++ b/drivers/staging/media/hantro/Makefile
@@ -0,0 +1,13 @@
+obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
+
+hantro-vpu-y += \
+		hantro_drv.o \
+		hantro_v4l2.o \
+		rk3288_vpu_hw.o \
+		hantro_h1_jpeg_enc.o \
+		hantro_g1_mpeg2_dec.o \
+		rk3399_vpu_hw.o \
+		rk3399_vpu_hw_jpeg_enc.o \
+		rk3399_vpu_hw_mpeg2_dec.o \
+		hantro_jpeg.o \
+		hantro_mpeg2.o
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
index 2e22009b6583..f01d1ed10d4a 100644
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
@@ -408,29 +405,28 @@ static int rockchip_vpu_release(struct file *filp)
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
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
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
@@ -460,8 +456,8 @@ static int rockchip_vpu_register_entity(struct media_device *mdev,
 	return 0;
 }
 
-static int rockchip_attach_func(struct rockchip_vpu_dev *vpu,
-				struct rockchip_vpu_func *func)
+static int hantro_attach_func(struct hantro_dev *vpu,
+			      struct hantro_func *func)
 {
 	struct media_device *mdev = &vpu->mdev;
 	struct media_link *link;
@@ -469,24 +465,24 @@ static int rockchip_attach_func(struct rockchip_vpu_dev *vpu,
 
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
 
@@ -552,7 +548,7 @@ static int rockchip_attach_func(struct rockchip_vpu_dev *vpu,
 	return ret;
 }
 
-static void rockchip_detach_func(struct rockchip_vpu_func *func)
+static void hantro_detach_func(struct hantro_func *func)
 {
 	media_devnode_remove(func->intf_devnode);
 	media_entity_remove_links(&func->sink);
@@ -563,15 +559,14 @@ static void rockchip_detach_func(struct rockchip_vpu_func *func)
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
@@ -581,13 +576,13 @@ static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
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
 
@@ -604,7 +599,7 @@ static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
 		return ret;
 	}
 
-	ret = rockchip_attach_func(vpu, func);
+	ret = hantro_attach_func(vpu, func);
 	if (ret) {
 		v4l2_err(&vpu->v4l2_dev,
 			 "Failed to attach functionality to the media device\n");
@@ -620,26 +615,26 @@ static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
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
@@ -649,29 +644,29 @@ static void rockchip_vpu_remove_func(struct rockchip_vpu_dev *vpu,
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
 
@@ -684,10 +679,10 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	mutex_init(&vpu->vpu_mutex);
 	spin_lock_init(&vpu->irqlock);
 
-	match = of_match_node(of_rockchip_vpu_match, pdev->dev.of_node);
+	match = of_match_node(of_hantro_match, pdev->dev.of_node);
 	vpu->variant = match->data;
 
-	INIT_DELAYED_WORK(&vpu->watchdog_work, rockchip_vpu_watchdog);
+	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
 	for (i = 0; i < vpu->variant->num_clocks; i++)
 		vpu->clocks[i].id = vpu->variant->clk_names[i];
@@ -778,16 +773,16 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
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
@@ -802,9 +797,9 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
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
@@ -817,15 +812,15 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
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
@@ -835,24 +830,24 @@ static int rockchip_vpu_remove(struct platform_device *pdev)
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
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
similarity index 87%
rename from drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
rename to drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index e9eee47fcea1..56b25943e957 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
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
 
@@ -82,27 +82,26 @@
 #define PICT_FRAME         3
 
 static void
-rk3288_vpu_mpeg2_dec_set_quantization(struct rockchip_vpu_dev *vpu,
-				      struct rockchip_vpu_ctx *ctx)
+hantro_g1_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
+				     struct hantro_ctx *ctx)
 {
 	struct v4l2_ctrl_mpeg2_quantization *quantization;
 
-	quantization = rockchip_vpu_get_ctrl(ctx,
-				V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
-	rockchip_vpu_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
-					   quantization);
+	quantization = hantro_get_ctrl(ctx,
+				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
+				     quantization);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
 			   VDPU_REG_QTABLE_BASE);
 }
 
 static void
-rk3288_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
-				 struct rockchip_vpu_ctx *ctx,
-				 struct vb2_buffer *src_buf,
-				 struct vb2_buffer *dst_buf,
-				 const struct v4l2_mpeg2_sequence *sequence,
-				 const struct v4l2_mpeg2_picture *picture,
-				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
+hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
+				struct vb2_buffer *src_buf,
+				struct vb2_buffer *dst_buf,
+				const struct v4l2_mpeg2_sequence *sequence,
+				const struct v4l2_mpeg2_picture *picture,
+				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
@@ -112,12 +111,12 @@ rk3288_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
 
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
@@ -159,9 +158,9 @@ rk3288_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
 	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
 }
 
-void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
+void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
 	const struct v4l2_mpeg2_sequence *sequence;
@@ -175,8 +174,8 @@ void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
-	slice_params = rockchip_vpu_get_ctrl(ctx,
-				V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+	slice_params = hantro_get_ctrl(ctx,
+				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
 	sequence = &slice_params->sequence;
 	picture = &slice_params->picture;
 
@@ -243,11 +242,11 @@ void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
 	reg = VDPU_REG_APF_THRESHOLD(8);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(55));
 
-	rk3288_vpu_mpeg2_dec_set_quantization(vpu, ctx);
+	hantro_g1_mpeg2_dec_set_quantization(vpu, ctx);
 
-	rk3288_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
-					 &dst_buf->vb2_buf,
-					 sequence, picture, slice_params);
+	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
+					&dst_buf->vb2_buf,
+					sequence, picture, slice_params);
 
 	/* Controls no longer in-use, we can complete them */
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
similarity index 76%
rename from drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
rename to drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index 68176e91330a..26d8f79c4a4a 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -1,22 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
  */
 
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
 #include "rk3288_vpu_regs.h"
 
 #define VEPU_JPEG_QUANT_TABLE_COUNT 16
 
-static void rk3288_vpu_set_src_img_ctrl(struct rockchip_vpu_dev *vpu,
-					struct rockchip_vpu_ctx *ctx)
+static void hantro_h1_set_src_img_ctrl(struct hantro_dev *vpu,
+				       struct hantro_ctx *ctx)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
 	u32 reg;
@@ -28,9 +28,9 @@ static void rk3288_vpu_set_src_img_ctrl(struct rockchip_vpu_dev *vpu,
 	vepu_write_relaxed(vpu, reg, VEPU_REG_IN_IMG_CTRL);
 }
 
-static void rk3288_vpu_jpeg_enc_set_buffers(struct rockchip_vpu_dev *vpu,
-					    struct rockchip_vpu_ctx *ctx,
-					    struct vb2_buffer *src_buf)
+static void hantro_h1_jpeg_enc_set_buffers(struct hantro_dev *vpu,
+					   struct hantro_ctx *ctx,
+					   struct vb2_buffer *src_buf)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
 	dma_addr_t src[3];
@@ -62,9 +62,9 @@ static void rk3288_vpu_jpeg_enc_set_buffers(struct rockchip_vpu_dev *vpu,
 }
 
 static void
-rk3288_vpu_jpeg_enc_set_qtable(struct rockchip_vpu_dev *vpu,
-			       unsigned char *luma_qtable,
-			       unsigned char *chroma_qtable)
+hantro_h1_jpeg_enc_set_qtable(struct hantro_dev *vpu,
+			      unsigned char *luma_qtable,
+			      unsigned char *chroma_qtable)
 {
 	u32 reg, i;
 
@@ -77,11 +77,11 @@ rk3288_vpu_jpeg_enc_set_qtable(struct rockchip_vpu_dev *vpu,
 	}
 }
 
-void rk3288_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
+void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct rockchip_vpu_jpeg_ctx jpeg_ctx;
+	struct hantro_jpeg_ctx jpeg_ctx;
 	u32 reg;
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
@@ -92,17 +92,17 @@ void rk3288_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
 	jpeg_ctx.width = ctx->dst_fmt.width;
 	jpeg_ctx.height = ctx->dst_fmt.height;
 	jpeg_ctx.quality = ctx->jpeg_quality;
-	rockchip_vpu_jpeg_header_assemble(&jpeg_ctx);
+	hantro_jpeg_header_assemble(&jpeg_ctx);
 
 	/* Switch to JPEG encoder mode before writing registers */
 	vepu_write_relaxed(vpu, VEPU_REG_ENC_CTRL_ENC_MODE_JPEG,
 			   VEPU_REG_ENC_CTRL);
 
-	rk3288_vpu_set_src_img_ctrl(vpu, ctx);
-	rk3288_vpu_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
-	rk3288_vpu_jpeg_enc_set_qtable(vpu,
-				       rockchip_vpu_jpeg_get_qtable(&jpeg_ctx, 0),
-				       rockchip_vpu_jpeg_get_qtable(&jpeg_ctx, 1));
+	hantro_h1_set_src_img_ctrl(vpu, ctx);
+	hantro_h1_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
+	hantro_h1_jpeg_enc_set_qtable(vpu,
+				      hantro_jpeg_get_qtable(&jpeg_ctx, 0),
+				      hantro_jpeg_get_qtable(&jpeg_ctx, 1));
 
 	reg = VEPU_REG_AXI_CTRL_OUTPUT_SWAP16
 		| VEPU_REG_AXI_CTRL_INPUT_SWAP16
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
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
similarity index 68%
rename from drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
rename to drivers/staging/media/hantro/rk3288_vpu_hw.c
index 003143c77d37..38adf74037fc 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
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
 #include "rk3288_vpu_regs.h"
 
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
@@ -18,30 +18,30 @@
  * Supported formats.
  */
 
-static const struct rockchip_vpu_fmt rk3288_vpu_enc_fmts[] = {
+static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
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
@@ -55,14 +55,14 @@ static const struct rockchip_vpu_fmt rk3288_vpu_enc_fmts[] = {
 	},
 };
 
-static const struct rockchip_vpu_fmt rk3288_vpu_dec_fmts[] = {
+static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
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
@@ -77,7 +77,7 @@ static const struct rockchip_vpu_fmt rk3288_vpu_dec_fmts[] = {
 
 static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 {
-	struct rockchip_vpu_dev *vpu = dev_id;
+	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
 	u32 status, bytesused;
 
@@ -89,14 +89,14 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
 
-	rockchip_vpu_irq_done(vpu, bytesused, state);
+	hantro_irq_done(vpu, bytesused, state);
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
 {
-	struct rockchip_vpu_dev *vpu = dev_id;
+	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -107,30 +107,30 @@ static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
 	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, VDPU_REG_CONFIG_DEC_CLK_GATE_E, VDPU_REG_CONFIG);
 
-	rockchip_vpu_irq_done(vpu, 0, state);
+	hantro_irq_done(vpu, 0, state);
 
 	return IRQ_HANDLED;
 }
 
-static int rk3288_vpu_hw_init(struct rockchip_vpu_dev *vpu)
+static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
 	clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
 	return 0;
 }
 
-static void rk3288_vpu_enc_reset(struct rockchip_vpu_ctx *ctx)
+static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENC_CTRL);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
 }
 
-static void rk3288_vpu_dec_reset(struct rockchip_vpu_ctx *ctx)
+static void rk3288_vpu_dec_reset(struct hantro_ctx *ctx)
 {
-	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct hantro_dev *vpu = ctx->dev;
 
 	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, VDPU_REG_CONFIG_DEC_CLK_GATE_E, VDPU_REG_CONFIG);
@@ -141,18 +141,18 @@ static void rk3288_vpu_dec_reset(struct rockchip_vpu_ctx *ctx)
  * Supported codec ops.
  */
 
-static const struct rockchip_vpu_codec_ops rk3288_vpu_codec_ops[] = {
-	[RK_VPU_MODE_JPEG_ENC] = {
-		.run = rk3288_vpu_jpeg_enc_run,
+static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = hantro_h1_jpeg_enc_run,
 		.reset = rk3288_vpu_enc_reset,
-		.init = rockchip_vpu_jpeg_enc_init,
-		.exit = rockchip_vpu_jpeg_enc_exit,
+		.init = hantro_jpeg_enc_init,
+		.exit = hantro_jpeg_enc_exit,
 	},
-	[RK_VPU_MODE_MPEG2_DEC] = {
-		.run = rk3288_vpu_mpeg2_dec_run,
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
 		.reset = rk3288_vpu_dec_reset,
-		.init = rockchip_vpu_mpeg2_dec_init,
-		.exit = rockchip_vpu_mpeg2_dec_exit,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
 	},
 };
 
@@ -160,14 +160,14 @@ static const struct rockchip_vpu_codec_ops rk3288_vpu_codec_ops[] = {
  * VPU variant.
  */
 
-const struct rockchip_vpu_variant rk3288_vpu_variant = {
+const struct hantro_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3288_vpu_enc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
 	.dec_offset = 0x400,
 	.dec_fmts = rk3288_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
-	.codec = RK_VPU_JPEG_ENCODER | RK_VPU_MPEG2_DECODER,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
 	.vepu_irq = rk3288_vepu_irq,
 	.vdpu_irq = rk3288_vdpu_irq,
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h b/drivers/staging/media/hantro/rk3288_vpu_regs.h
similarity index 99%
rename from drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
rename to drivers/staging/media/hantro/rk3288_vpu_regs.h
index c9631b713804..1fe2835a2d75 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
+++ b/drivers/staging/media/hantro/rk3288_vpu_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Rockchip VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright 2018 Google LLC.
  *	Tomasz Figa <tfiga@chromium.org>
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

