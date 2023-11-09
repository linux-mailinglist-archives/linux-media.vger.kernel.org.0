Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60FC47E7344
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 22:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345368AbjKIVES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 16:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345308AbjKIVEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 16:04:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C3A478C;
        Thu,  9 Nov 2023 13:03:46 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.64])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24768AF2;
        Thu,  9 Nov 2023 22:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699563802;
        bh=5LywDht04vZZ1Qmp5P2O+2mQRlbHnl2ZJw1RULxKFu4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dCcUBMyQPuwASrF5BnziAo8mBBDomt2OdjTKfTKxedb2nItxI973XXnkyD5V1kFBq
         urCgTmtNdQanopmOVfsafukuylyHscivlhyopoCbtgBDw+Vgz2/fsfUh0DUUblFtVn
         XQgd9lHWS3f9P/CGBdWMbDa0DiRRNrVP7XSk52p0=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>,
        Dan Carpenter <error27@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Naushir Patuck <naush@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 10/15] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
Date:   Thu,  9 Nov 2023 16:03:02 -0500
Message-ID: <20231109210309.638594-11-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109210309.638594-1-umang.jain@ideasonboard.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Naushir Patuck <naush@raspberrypi.com>

Driver for the BCM2835 ISP hardware block.  This driver uses the MMAL
component to program the ISP hardware through the VC firmware.

The ISP component can produce two video stream outputs, and Bayer
image statistics. This can't be encompassed in a simple V4L2
M2M device, so create a new device that registers 4 video nodes.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 MAINTAINERS                                   |    9 +
 drivers/staging/vc04_services/Kconfig         |    2 +
 drivers/staging/vc04_services/Makefile        |    1 +
 .../staging/vc04_services/bcm2835-isp/Kconfig |   14 +
 .../vc04_services/bcm2835-isp/Makefile        |    4 +
 .../bcm2835-isp/bcm2835-isp-ctrls.h           |   72 +
 .../bcm2835-isp/bcm2835-isp-fmts.h            |  482 +++++
 .../bcm2835-isp/bcm2835-v4l2-isp.c            | 1712 +++++++++++++++++
 .../vc04_services/vchiq-mmal/mmal-encodings.h |    4 +
 .../vchiq-mmal/mmal-parameters.h              |  165 +-
 include/uapi/linux/bcm2835-isp.h              |   27 +
 11 files changed, 2491 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Kconfig
 create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Makefile
 create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-ctrls.h
 create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
 create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0748cc15588c..8670a8d95400 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3976,6 +3976,15 @@ F:	Documentation/devicetree/bindings/mips/brcm/
 F:	arch/mips/bcm47xx/*
 F:	arch/mips/include/asm/mach-bcm47xx/*
 
+BROADCOM BCM2835 ISP DRIVER
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
+F:	Documentation/media/v4l-drivers/bcm2835-isp.rst
+F:	drivers/staging/vc04_services/bcm2835-isp
+F:	include/uapi/linux/bcm2835-isp.h
+
 BROADCOM BCM4908 ETHERNET DRIVER
 M:	Rafał Miłecki <rafal@milecki.pl>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index 6c0e77d64376..e71e5a8b820a 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -44,6 +44,8 @@ source "drivers/staging/vc04_services/bcm2835-audio/Kconfig"
 
 source "drivers/staging/vc04_services/bcm2835-camera/Kconfig"
 
+source "drivers/staging/vc04_services/bcm2835-isp/Kconfig"
+
 source "drivers/staging/vc04_services/vchiq-mmal/Kconfig"
 
 source "drivers/staging/vc04_services/vc-sm-cma/Kconfig"
diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index 1f61a263f22d..2cebf92525a0 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
 obj-$(CONFIG_VIDEO_BCM2835)		+= bcm2835-camera/
 obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
 obj-$(CONFIG_BCM_VC_SM_CMA)		+= vc-sm-cma/
+obj-$(CONFIG_VIDEO_ISP_BCM2835) 	+= bcm2835-isp/
diff --git a/drivers/staging/vc04_services/bcm2835-isp/Kconfig b/drivers/staging/vc04_services/bcm2835-isp/Kconfig
new file mode 100644
index 000000000000..6222799ebe16
--- /dev/null
+++ b/drivers/staging/vc04_services/bcm2835-isp/Kconfig
@@ -0,0 +1,14 @@
+config VIDEO_ISP_BCM2835
+	tristate "BCM2835 ISP support"
+	depends on MEDIA_SUPPORT
+	depends on VIDEO_DEV && (ARCH_BCM2835 || COMPILE_TEST)
+	depends on MEDIA_CONTROLLER
+	select BCM2835_VCHIQ_MMAL
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  This is the V4L2 driver for the Broadcom BCM2835 ISP hardware.
+	  This operates over the VCHIQ interface to a service running on
+	  VideoCore.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called bcm2835-isp.
diff --git a/drivers/staging/vc04_services/bcm2835-isp/Makefile b/drivers/staging/vc04_services/bcm2835-isp/Makefile
new file mode 100644
index 000000000000..2c78163264a9
--- /dev/null
+++ b/drivers/staging/vc04_services/bcm2835-isp/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+bcm2835-isp-objs := bcm2835-v4l2-isp.o
+
+obj-$(CONFIG_VIDEO_ISP_BCM2835) += bcm2835-isp.o
diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-ctrls.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-ctrls.h
new file mode 100644
index 000000000000..172605718cdf
--- /dev/null
+++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-ctrls.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Broadcom BCM2835 ISP driver
+ *
+ * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ */
+
+#ifndef BCM2835_ISP_CTRLS
+#define BCM2835_ISP_CTRLS
+
+#include <linux/bcm2835-isp.h>
+
+struct bcm2835_isp_custom_ctrl {
+	const char *name;
+	u32 id;
+	u32 size;
+	u32 flags;
+};
+
+static const struct bcm2835_isp_custom_ctrl custom_ctrls[] = {
+	{
+		.name	= "Colour Correction Matrix",
+		.id	= V4L2_CID_USER_BCM2835_ISP_CC_MATRIX,
+		.size	= sizeof(struct bcm2835_isp_custom_ccm),
+		.flags  = 0
+	}, {
+		.name	= "Lens Shading",
+		.id	= V4L2_CID_USER_BCM2835_ISP_LENS_SHADING,
+		.size	= sizeof(struct bcm2835_isp_lens_shading),
+		.flags  = V4L2_CTRL_FLAG_EXECUTE_ON_WRITE
+	}, {
+		.name	= "Black Level",
+		.id	= V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL,
+		.size	= sizeof(struct bcm2835_isp_black_level),
+		.flags  = 0
+	}, {
+		.name	= "Green Equalisation",
+		.id	= V4L2_CID_USER_BCM2835_ISP_GEQ,
+		.size	= sizeof(struct bcm2835_isp_geq),
+		.flags  = 0
+	}, {
+		.name	= "Gamma",
+		.id	= V4L2_CID_USER_BCM2835_ISP_GAMMA,
+		.size	= sizeof(struct bcm2835_isp_gamma),
+		.flags  = 0
+	}, {
+		.name	= "Sharpen",
+		.id	= V4L2_CID_USER_BCM2835_ISP_SHARPEN,
+		.size	= sizeof(struct bcm2835_isp_sharpen),
+		.flags  = 0
+	}, {
+		.name	= "Denoise",
+		.id	= V4L2_CID_USER_BCM2835_ISP_DENOISE,
+		.size	= sizeof(struct bcm2835_isp_denoise),
+		.flags  = 0
+	}, {
+		.name	= "Colour Denoise",
+		.id	= V4L2_CID_USER_BCM2835_ISP_CDN,
+		.size	= sizeof(struct bcm2835_isp_cdn),
+		.flags  = 0
+	}, {
+		.name	= "Defective Pixel Correction",
+		.id	= V4L2_CID_USER_BCM2835_ISP_DPC,
+		.size	= sizeof(struct bcm2835_isp_dpc),
+		.flags  = 0
+	}
+};
+
+#endif
diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
new file mode 100644
index 000000000000..6dcd196fc6a5
--- /dev/null
+++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
@@ -0,0 +1,482 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Broadcom BCM2835 ISP driver
+ *
+ * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ */
+
+#ifndef BCM2835_ISP_FMTS
+#define BCM2835_ISP_FMTS
+
+#include <linux/videodev2.h>
+
+#include "../vchiq-mmal/mmal-encodings.h"
+
+struct bcm2835_isp_fmt {
+	u32 fourcc;
+	int depth;
+	int bytesperline_align;
+	u32 mmal_fmt;
+	int size_multiplier_x2;
+	enum v4l2_colorspace colorspace;
+	unsigned int step_size;
+};
+
+static const struct bcm2835_isp_fmt supported_formats[] = {
+	{
+		/* YUV formats */
+		.fourcc		    = V4L2_PIX_FMT_YUV420,
+		.depth		    = 8,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_I420,
+		.size_multiplier_x2 = 3,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_YVU420,
+		.depth		    = 8,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_YV12,
+		.size_multiplier_x2 = 3,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_NV12,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_NV12,
+		.size_multiplier_x2 = 3,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_NV21,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_NV21,
+		.size_multiplier_x2 = 3,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_YUYV,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_YUYV,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_UYVY,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_UYVY,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_YVYU,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_YVYU,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_VYUY,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_VYUY,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		/* RGB formats */
+		.fourcc		    = V4L2_PIX_FMT_RGB24,
+		.depth		    = 24,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_RGB24,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_RGB565,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_RGB16,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_BGR24,
+		.depth		    = 24,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BGR24,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_XBGR32,
+		.depth		    = 32,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_BGRA,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_RGBX32,
+		.depth		    = 32,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_RGBA,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		/* Bayer formats */
+		/* 8 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB8,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR8,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG8,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG8,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 16 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB16,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR16,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG16,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG16,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* Bayer formats unpacked to 16bpp */
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* Monochrome MIPI formats */
+		/* 8 bit */
+		.fourcc		    = V4L2_PIX_FMT_GREY,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_GREY,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y10P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y12P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y14P,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 16 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y16,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 10 bit as 16bpp */
+		.fourcc		    = V4L2_PIX_FMT_Y10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y10,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit as 16bpp */
+		.fourcc		    = V4L2_PIX_FMT_Y12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y12,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit as 16bpp */
+		.fourcc		    = V4L2_PIX_FMT_Y14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y14,
+		.size_multiplier_x2 = 2,
+		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_META_FMT_BCM2835_ISP_STATS,
+		.depth		    = 8,
+		.mmal_fmt	    = MMAL_ENCODING_BRCM_STATS,
+		/* The rest are not valid fields for stats. */
+	}
+};
+
+#endif
diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
new file mode 100644
index 000000000000..f1ea56b4849e
--- /dev/null
+++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
@@ -0,0 +1,1712 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Broadcom BCM2835 ISP driver
+ *
+ * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ */
+
+#include <linux/module.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "../vchiq-mmal/mmal-msg.h"
+#include "../vchiq-mmal/mmal-parameters.h"
+#include "../vchiq-mmal/mmal-vchiq.h"
+
+#include "../vc-sm-cma/vc_sm_knl.h"
+
+#include "../interface/vchiq_arm/vchiq_bus.h"
+#include "bcm2835-isp-ctrls.h"
+#include "bcm2835-isp-fmts.h"
+
+MODULE_IMPORT_NS(DMA_BUF);
+
+static unsigned int debug;
+module_param(debug, uint, 0644);
+MODULE_PARM_DESC(debug, "activates debug info");
+
+static unsigned int video_nr = 13;
+module_param(video_nr, uint, 0644);
+MODULE_PARM_DESC(video_nr, "base video device number");
+
+#define BCM2835_ISP_NAME "bcm2835-isp"
+#define BCM2835_ISP_ENTITY_NAME_LEN 32
+
+#define BCM2835_ISP_NUM_OUTPUTS 1
+#define BCM2835_ISP_NUM_CAPTURES 2
+#define BCM2835_ISP_NUM_METADATA 1
+
+#define BCM2835_ISP_NUM_NODES						\
+		(BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES +	\
+		 BCM2835_ISP_NUM_METADATA)
+
+/* Default frame dimension of 1280 pixels. */
+#define DEFAULT_DIM 1280U
+/*
+ * Maximum frame dimension of 16384 pixels.  Even though the ISP runs in tiles,
+ * have a sensible limit so that we do not create an excessive number of tiles
+ * to process.
+ */
+#define MAX_DIM 16384U
+/*
+ * Minimum frame dimension of 64 pixels.  Anything lower, and the tiling
+ * algorithm may not be able to cope when applying filter context.
+ */
+#define MIN_DIM 64U
+
+/* Timeout for stop_streaming to allow all buffers to return */
+#define COMPLETE_TIMEOUT (2 * HZ)
+
+/* Per-queue, driver-specific private data */
+struct bcm2835_isp_q_data {
+	/*
+	 * These parameters should be treated as gospel, with everything else
+	 * being determined from them.
+	 */
+	unsigned int bytesperline;
+	unsigned int width;
+	unsigned int height;
+	unsigned int sizeimage;
+	const struct bcm2835_isp_fmt *fmt;
+};
+
+/*
+ * Structure to describe a single node /dev/video<N> which represents a single
+ * input or output queue to the ISP device.
+ */
+struct bcm2835_isp_node {
+	int vfl_dir;
+	unsigned int id;
+	const char *name;
+	struct vchiq_mmal_port *port;
+	struct video_device vfd;
+	struct media_pad pad;
+	struct media_intf_devnode *intf_devnode;
+	struct media_link *intf_link;
+	struct mutex lock; /* top level device node lock */
+	struct mutex queue_lock;
+
+	struct vb2_queue queue;
+	unsigned int sequence;
+
+	/* The list of formats supported on the node. */
+	struct bcm2835_isp_fmt const **supported_fmts;
+	unsigned int num_supported_fmts;
+
+	struct bcm2835_isp_q_data q_data;
+
+	/* Parent device structure */
+	struct bcm2835_isp_dev *dev;
+
+	bool registered;
+	bool media_node_registered;
+};
+
+/*
+ * Structure representing the entire ISP device, comprising several input and
+ * output nodes /dev/video<N>.
+ */
+struct bcm2835_isp_dev {
+	struct v4l2_device v4l2_dev;
+	struct device *dev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_device mdev;
+	struct media_entity entity;
+	bool media_device_registered;
+	bool media_entity_registered;
+	struct vchiq_mmal_instance *mmal_instance;
+	struct vchiq_mmal_component *component;
+	struct completion frame_cmplt;
+
+	struct bcm2835_isp_node node[BCM2835_ISP_NUM_NODES];
+	struct media_pad pad[BCM2835_ISP_NUM_NODES];
+	atomic_t num_streaming;
+
+	/* Image pipeline controls. */
+	int r_gain;
+	int b_gain;
+};
+
+struct bcm2835_isp_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct mmal_buffer mmal;
+};
+
+static
+inline struct bcm2835_isp_dev *node_get_dev(struct bcm2835_isp_node *node)
+{
+	return node->dev;
+}
+
+static inline bool node_is_output(struct bcm2835_isp_node *node)
+{
+	return node->queue.type == V4L2_BUF_TYPE_VIDEO_OUTPUT;
+}
+
+static inline bool node_is_capture(struct bcm2835_isp_node *node)
+{
+	return node->queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
+}
+
+static inline bool node_is_stats(struct bcm2835_isp_node *node)
+{
+	return node->queue.type == V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+static inline enum v4l2_buf_type index_to_queue_type(int index)
+{
+	if (index < BCM2835_ISP_NUM_OUTPUTS)
+		return V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	else if (index < BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES)
+		return V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	else
+		return V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+static int set_isp_param(struct bcm2835_isp_node *node, u32 parameter,
+			 void *value, u32 value_size)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	return vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
+					     parameter, value, value_size);
+}
+
+static int set_wb_gains(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct mmal_parameter_awbgains gains = {
+		.r_gain = { dev->r_gain, 1000 },
+		.b_gain = { dev->b_gain, 1000 }
+	};
+
+	return set_isp_param(node, MMAL_PARAMETER_CUSTOM_AWB_GAINS,
+			     &gains, sizeof(gains));
+}
+
+static int set_digital_gain(struct bcm2835_isp_node *node, uint32_t gain)
+{
+	struct s32_fract digital_gain = {
+		.numerator = gain,
+		.denominator = 1000
+	};
+
+	return set_isp_param(node, MMAL_PARAMETER_DIGITAL_GAIN,
+			     &digital_gain, sizeof(digital_gain));
+}
+
+static const struct bcm2835_isp_fmt *get_fmt(u32 mmal_fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
+		if (supported_formats[i].mmal_fmt == mmal_fmt)
+			return &supported_formats[i];
+	}
+	return NULL;
+}
+
+static const
+struct bcm2835_isp_fmt *find_format_by_fourcc(unsigned int fourcc,
+					      struct bcm2835_isp_node *node)
+{
+	const struct bcm2835_isp_fmt *fmt;
+	unsigned int i;
+
+	for (i = 0; i < node->num_supported_fmts; i++) {
+		fmt = node->supported_fmts[i];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static const
+struct bcm2835_isp_fmt *find_format(struct v4l2_format *f,
+				    struct bcm2835_isp_node *node)
+{
+	return find_format_by_fourcc(node_is_stats(node) ?
+				     f->fmt.meta.dataformat :
+				     f->fmt.pix.pixelformat,
+				     node);
+}
+
+/* vb2_to_mmal_buffer() - converts vb2 buffer header to MMAL
+ *
+ * Copies all the required fields from a VB2 buffer to the MMAL buffer header,
+ * ready for sending to the VPU.
+ */
+static void vb2_to_mmal_buffer(struct mmal_buffer *buf,
+			       struct vb2_v4l2_buffer *vb2)
+{
+	u64 pts;
+
+	buf->mmal_flags = 0;
+	if (vb2->flags & V4L2_BUF_FLAG_KEYFRAME)
+		buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_KEYFRAME;
+
+	/* Data must be framed correctly as one frame per buffer. */
+	buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_FRAME_END;
+
+	buf->length = vb2->vb2_buf.planes[0].bytesused;
+	/*
+	 * Minor ambiguity in the V4L2 spec as to whether passing in a 0 length
+	 * buffer, or one with V4L2_BUF_FLAG_LAST set denotes end of stream.
+	 * Handle either.
+	 */
+	if (!buf->length || vb2->flags & V4L2_BUF_FLAG_LAST)
+		buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_EOS;
+
+	/* vb2 timestamps in nsecs, mmal in usecs */
+	pts = vb2->vb2_buf.timestamp;
+	do_div(pts, 1000);
+	buf->pts = pts;
+	buf->dts = MMAL_TIME_UNKNOWN;
+}
+
+static void mmal_buffer_cb(struct vchiq_mmal_instance *instance,
+			   struct vchiq_mmal_port *port, int status,
+			   struct mmal_buffer *mmal_buf)
+{
+	struct bcm2835_isp_buffer *q_buf;
+	struct bcm2835_isp_node *node = port->cb_ctx;
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct vb2_v4l2_buffer *vb2;
+
+	q_buf = container_of(mmal_buf, struct bcm2835_isp_buffer, mmal);
+	vb2 = &q_buf->vb;
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "%s: port:%s[%d], status:%d, buf:%p, dmabuf:%p, length:%lu, flags %u, pts %lld\n",
+		 __func__, node_is_output(node) ? "input" : "output", node->id,
+		 status, mmal_buf, mmal_buf->dma_buf, mmal_buf->length,
+		 mmal_buf->mmal_flags, mmal_buf->pts);
+
+	if (mmal_buf->cmd)
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Unexpected event on output callback - %08x\n",
+			 __func__, mmal_buf->cmd);
+
+	if (status) {
+		/* error in transfer */
+		if (vb2) {
+			/* there was a buffer with the error so return it */
+			vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+		return;
+	}
+
+	/* vb2 timestamps in nsecs, mmal in usecs */
+	vb2->vb2_buf.timestamp = mmal_buf->pts * 1000;
+	vb2->sequence = node->sequence++;
+	vb2_set_plane_payload(&vb2->vb2_buf, 0, mmal_buf->length);
+	vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_DONE);
+
+	if (!port->enabled)
+		complete(&dev->frame_cmplt);
+}
+
+static void setup_mmal_port_format(struct bcm2835_isp_node *node,
+				   struct vchiq_mmal_port *port)
+{
+	struct bcm2835_isp_q_data *q_data = &node->q_data;
+
+	port->format.encoding = q_data->fmt->mmal_fmt;
+	/* Raw image format - set width/height */
+	port->es.video.width = (q_data->bytesperline << 3) / q_data->fmt->depth;
+	port->es.video.height = q_data->height;
+	port->es.video.crop.width = q_data->width;
+	port->es.video.crop.height = q_data->height;
+	port->es.video.crop.x = 0;
+	port->es.video.crop.y = 0;
+};
+
+static int setup_mmal_port(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	unsigned int enable = 1;
+	int ret;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: setup %s[%d]\n", __func__,
+		 node->name, node->id);
+
+	vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
+				      MMAL_PARAMETER_ZERO_COPY, &enable,
+				      sizeof(enable));
+	setup_mmal_port_format(node, node->port);
+	ret = vchiq_mmal_port_set_format(dev->mmal_instance, node->port);
+	if (ret < 0) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: vchiq_mmal_port_set_format failed\n",
+			 __func__);
+		return ret;
+	}
+
+	if (node->q_data.sizeimage < node->port->minimum_buffer.size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "buffer size mismatch sizeimage %u < min size %u\n",
+			 node->q_data.sizeimage,
+			 node->port->minimum_buffer.size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
+{
+	mmal_vchi_buffer_cleanup(mmal_buf);
+
+	if (mmal_buf->dma_buf) {
+		dma_buf_put(mmal_buf->dma_buf);
+		mmal_buf->dma_buf = NULL;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_node_queue_setup(struct vb2_queue *q,
+					unsigned int *nbuffers,
+					unsigned int *nplanes,
+					unsigned int sizes[],
+					struct device *alloc_devs[])
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
+	unsigned int size;
+
+	if (setup_mmal_port(node))
+		return -EINVAL;
+
+	size = node->q_data.sizeimage;
+	if (size == 0) {
+		v4l2_info(&node_get_dev(node)->v4l2_dev,
+			  "%s: Image size unset in queue_setup for node %s[%d]\n",
+			  __func__, node->name, node->id);
+		return -EINVAL;
+	}
+
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	node->port->current_buffer.size = size;
+
+	if (*nbuffers < node->port->minimum_buffer.num)
+		*nbuffers = node->port->minimum_buffer.num;
+
+	node->port->current_buffer.num = *nbuffers;
+
+	v4l2_dbg(2, debug, &node_get_dev(node)->v4l2_dev,
+		 "%s: Image size %u, nbuffers %u for node %s[%d]\n",
+		 __func__, sizes[0], *nbuffers, node->name, node->id);
+	return 0;
+}
+
+static int bcm2835_isp_buf_init(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
+	struct bcm2835_isp_buffer *buf =
+		container_of(vb2, struct bcm2835_isp_buffer, vb);
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: vb %p\n", __func__, vb);
+
+	buf->mmal.buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	buf->mmal.buffer_size = vb2_plane_size(&buf->vb.vb2_buf, 0);
+	mmal_vchi_buffer_init(dev->mmal_instance, &buf->mmal);
+	return 0;
+}
+
+static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
+	struct bcm2835_isp_buffer *buf =
+		container_of(vb2, struct bcm2835_isp_buffer, vb);
+	struct dma_buf *dma_buf;
+	int ret;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
+		 __func__, vb->vb2_queue->type, vb);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vb2->field == V4L2_FIELD_ANY)
+			vb2->field = V4L2_FIELD_NONE;
+		if (vb2->field != V4L2_FIELD_NONE) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s field isn't supported\n", __func__);
+			return -EINVAL;
+		}
+	}
+
+	if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s data will not fit into plane (%lu < %lu)\n",
+			 __func__, vb2_plane_size(vb, 0),
+			 (long)node->q_data.sizeimage);
+		return -EINVAL;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
+
+	switch (vb->memory) {
+	case VB2_MEMORY_DMABUF:
+		dma_buf = dma_buf_get(vb->planes[0].m.fd);
+
+		if (dma_buf != buf->mmal.dma_buf) {
+			/*
+			 * dmabuf either hasn't already been mapped, or it has
+			 * changed.
+			 */
+			if (buf->mmal.dma_buf) {
+				v4l2_err(&dev->v4l2_dev,
+					 "%s Buffer changed - why did the core not call cleanup?\n",
+					 __func__);
+				bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
+			}
+
+			buf->mmal.dma_buf = dma_buf;
+		} else {
+			/*
+			 * Already have a reference to the buffer, so release it
+			 * here.
+			 */
+			dma_buf_put(dma_buf);
+		}
+		ret = 0;
+		break;
+	case VB2_MEMORY_MMAP:
+		/*
+		 * We want to do this at init, but vb2_core_expbuf checks that
+		 * the index < q->num_buffers, and q->num_buffers only gets
+		 * updated once all the buffers are allocated.
+		 */
+		if (!buf->mmal.dma_buf) {
+			buf->mmal.dma_buf = vb2_core_expbuf_dmabuf(vb->vb2_queue,
+								   vb->vb2_queue->type,
+								   vb->index, 0, O_CLOEXEC);
+			v4l2_dbg(3, debug, &dev->v4l2_dev,
+				 "%s: exporting ptr %p to dmabuf %p\n",
+				 __func__, vb, buf->mmal.dma_buf);
+			if (IS_ERR(buf->mmal.dma_buf)) {
+				ret = PTR_ERR(buf->mmal.dma_buf);
+				v4l2_err(&dev->v4l2_dev,
+					 "%s: Failed to expbuf idx %d, ret %d\n",
+					 __func__, vb->index, ret);
+			}
+		} else {
+			ret = 0;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static void bcm2835_isp_node_buffer_queue(struct vb2_buffer *buf)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(buf->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf =
+		container_of(buf, struct vb2_v4l2_buffer, vb2_buf);
+	struct bcm2835_isp_buffer *buffer =
+		container_of(vbuf, struct bcm2835_isp_buffer, vb);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: node %s[%d], buffer %p\n",
+		 __func__, node->name, node->id, buffer);
+
+	vb2_to_mmal_buffer(&buffer->mmal, &buffer->vb);
+	v4l2_dbg(3, debug, &dev->v4l2_dev,
+		 "%s: node %s[%d] - submitting  mmal dmabuf %p\n", __func__,
+		 node->name, node->id, buffer->mmal.dma_buf);
+	vchiq_mmal_submit_buffer(dev->mmal_instance, node->port, &buffer->mmal);
+}
+
+static void bcm2835_isp_buffer_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
+	struct bcm2835_isp_buffer *buffer =
+		container_of(vb2, struct bcm2835_isp_buffer, vb);
+
+	bcm2835_isp_mmal_buf_cleanup(&buffer->mmal);
+}
+
+static int bcm2835_isp_node_start_streaming(struct vb2_queue *q,
+					    unsigned int count)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	int ret;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d] (count %u)\n",
+		 __func__, node->name, node->id, count);
+
+	ret = vchiq_mmal_component_enable(dev->mmal_instance, dev->component);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "%s: Failed enabling component, ret %d\n",
+			 __func__, ret);
+		return -EIO;
+	}
+
+	node->sequence = 0;
+	node->port->cb_ctx = node;
+	ret = vchiq_mmal_port_enable(dev->mmal_instance, node->port,
+				     mmal_buffer_cb);
+	if (!ret)
+		atomic_inc(&dev->num_streaming);
+	else
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Failed enabling port, ret %d\n", __func__, ret);
+
+	return ret;
+}
+
+static void bcm2835_isp_node_stop_streaming(struct vb2_queue *q)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	int ret;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d], mmal port %p\n",
+		 __func__, node->name, node->id, node->port);
+
+	init_completion(&dev->frame_cmplt);
+
+	/* Disable MMAL port - this will flush buffers back */
+	ret = vchiq_mmal_port_disable(dev->mmal_instance, node->port);
+	if (ret)
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Failed disabling %s port, ret %d\n", __func__,
+			 node_is_output(node) ? "i/p" : "o/p",
+			 ret);
+
+	while (atomic_read(&node->port->buffers_with_vpu)) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: Waiting for buffers to be returned - %d outstanding\n",
+			 __func__, atomic_read(&node->port->buffers_with_vpu));
+		ret = wait_for_completion_timeout(&dev->frame_cmplt,
+						  COMPLETE_TIMEOUT);
+		if (ret <= 0) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s: Timeout waiting for buffers to be returned - %d outstanding\n",
+				 __func__,
+				 atomic_read(&node->port->buffers_with_vpu));
+			break;
+		}
+	}
+
+	atomic_dec(&dev->num_streaming);
+	/* If all ports disabled, then disable the component */
+	if (atomic_read(&dev->num_streaming) == 0) {
+		struct bcm2835_isp_lens_shading ls;
+		/*
+		 * The ISP component on the firmware has a reference to the
+		 * dmabuf handle for the lens shading table.  Pass a null handle
+		 * to remove that reference now.
+		 */
+		memset(&ls, 0, sizeof(ls));
+		/* Must set a valid grid size for the FW */
+		ls.grid_cell_size = 16;
+		set_isp_param(&dev->node[0],
+			      MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+			      &ls, sizeof(ls));
+
+		ret = vchiq_mmal_component_disable(dev->mmal_instance,
+						   dev->component);
+		if (ret) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s: Failed disabling component, ret %d\n",
+				 __func__, ret);
+		}
+	}
+
+	/*
+	 * Simply wait for any vb2 buffers to finish. We could take steps to
+	 * make them complete more quickly if we care, or even return them
+	 * ourselves.
+	 */
+	vb2_wait_for_all_buffers(&node->queue);
+}
+
+static const struct vb2_ops bcm2835_isp_node_queue_ops = {
+	.queue_setup		= bcm2835_isp_node_queue_setup,
+	.buf_init		= bcm2835_isp_buf_init,
+	.buf_prepare		= bcm2835_isp_buf_prepare,
+	.buf_queue		= bcm2835_isp_node_buffer_queue,
+	.buf_cleanup		= bcm2835_isp_buffer_cleanup,
+	.start_streaming	= bcm2835_isp_node_start_streaming,
+	.stop_streaming		= bcm2835_isp_node_stop_streaming,
+};
+
+static const
+struct bcm2835_isp_fmt *get_default_format(struct bcm2835_isp_node *node)
+{
+	return node->supported_fmts[0];
+}
+
+static inline unsigned int get_bytesperline(int width,
+					    const struct bcm2835_isp_fmt *fmt)
+{
+	/* GPU aligns 24bpp images to a multiple of 32 pixels (not bytes). */
+	if (fmt->depth == 24)
+		return ALIGN(width, 32) * 3;
+	else
+		return ALIGN((width * fmt->depth) >> 3, fmt->bytesperline_align);
+}
+
+static inline unsigned int get_sizeimage(int bpl, int width, int height,
+					 const struct bcm2835_isp_fmt *fmt)
+{
+	return (bpl * height * fmt->size_multiplier_x2) >> 1;
+}
+
+static int bcm2835_isp_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct bcm2835_isp_dev *dev =
+	      container_of(ctrl->handler, struct bcm2835_isp_dev, ctrl_handler);
+	struct bcm2835_isp_node *node = &dev->node[0];
+	int ret = 0;
+
+	/*
+	 * The ISP firmware driver will ensure these settings are applied on
+	 * a frame boundary, so we are safe to write them as they come in.
+	 *
+	 * Note that the bcm2835_isp_* param structures are identical to the
+	 * mmal-parameters.h definitions.  This avoids the need for unnecessary
+	 * field-by-field copying between structures.
+	 */
+	switch (ctrl->id) {
+	case V4L2_CID_RED_BALANCE:
+		dev->r_gain = ctrl->val;
+		ret = set_wb_gains(node);
+		break;
+	case V4L2_CID_BLUE_BALANCE:
+		dev->b_gain = ctrl->val;
+		ret = set_wb_gains(node);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = set_digital_gain(node, ctrl->val);
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_CC_MATRIX:
+		ret = set_isp_param(node, MMAL_PARAMETER_CUSTOM_CCM,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_custom_ccm));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_LENS_SHADING:
+	{
+		struct bcm2835_isp_lens_shading *v4l2_ls;
+		struct mmal_parameter_lens_shading_v2 ls;
+		struct dma_buf *dmabuf;
+		void *vcsm_handle;
+
+		v4l2_ls = (struct bcm2835_isp_lens_shading *)ctrl->p_new.p_u8;
+		/*
+		 * struct bcm2835_isp_lens_shading and struct
+		 * mmal_parameter_lens_shading_v2 match so that we can do a
+		 * simple memcpy here.
+		 * Only the dmabuf to the actual table needs any manipulation.
+		 */
+		memcpy(&ls, v4l2_ls, sizeof(ls));
+
+		dmabuf = dma_buf_get(v4l2_ls->dmabuf);
+		if (IS_ERR_OR_NULL(dmabuf))
+			return -EINVAL;
+
+		ret = vc_sm_cma_import_dmabuf(dmabuf, &vcsm_handle);
+		if (ret) {
+			dma_buf_put(dmabuf);
+			return -EINVAL;
+		}
+
+		ls.mem_handle_table = vc_sm_cma_int_handle(vcsm_handle);
+		if (ls.mem_handle_table)
+			/* The VPU will take a reference on the vcsm handle,
+			 * which in turn will retain a reference on the dmabuf.
+			 * This code can therefore safely release all
+			 * references to the buffer.
+			 */
+			ret = set_isp_param(node,
+					    MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+					    &ls,
+					    sizeof(ls));
+		else
+			ret = -EINVAL;
+
+		vc_sm_cma_free(vcsm_handle);
+		dma_buf_put(dmabuf);
+		break;
+	}
+	case V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL:
+		ret = set_isp_param(node, MMAL_PARAMETER_BLACK_LEVEL,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_black_level));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_GEQ:
+		ret = set_isp_param(node, MMAL_PARAMETER_GEQ,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_geq));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_GAMMA:
+		ret = set_isp_param(node, MMAL_PARAMETER_GAMMA,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_gamma));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_DENOISE:
+		ret = set_isp_param(node, MMAL_PARAMETER_DENOISE,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_denoise));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_CDN:
+		ret = set_isp_param(node, MMAL_PARAMETER_CDN,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_cdn));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_SHARPEN:
+		ret = set_isp_param(node, MMAL_PARAMETER_SHARPEN,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_sharpen));
+		break;
+	case V4L2_CID_USER_BCM2835_ISP_DPC:
+		ret = set_isp_param(node, MMAL_PARAMETER_DPC,
+				    ctrl->p_new.p_u8,
+				    sizeof(struct bcm2835_isp_dpc));
+		break;
+	default:
+		v4l2_info(&dev->v4l2_dev, "Unrecognised control\n");
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "%s: Failed setting ctrl \"%s\" (%08x), err %d\n",
+			 __func__, ctrl->name, ctrl->id, ret);
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops bcm2835_isp_ctrl_ops = {
+	.s_ctrl = bcm2835_isp_s_ctrl,
+};
+
+static const struct v4l2_file_operations bcm2835_isp_fops = {
+	.owner		= THIS_MODULE,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap		= vb2_fop_mmap
+};
+
+static int populate_qdata_fmt(struct v4l2_format *f,
+			      struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct bcm2835_isp_q_data *q_data = &node->q_data;
+	int ret;
+
+	if (!node_is_stats(node)) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: Setting pix format for type %d, wxh: %ux%u, fmt: %08x, size %u\n",
+			 __func__, f->type, f->fmt.pix.width, f->fmt.pix.height,
+			 f->fmt.pix.pixelformat, f->fmt.pix.sizeimage);
+
+		q_data->fmt = find_format(f, node);
+		q_data->width = f->fmt.pix.width;
+		q_data->height = f->fmt.pix.height;
+		q_data->height = f->fmt.pix.height;
+
+		/* All parameters should have been set correctly by try_fmt */
+		q_data->bytesperline = f->fmt.pix.bytesperline;
+		q_data->sizeimage = f->fmt.pix.sizeimage;
+	} else {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: Setting meta format for fmt: %08x, size %u\n",
+			 __func__, f->fmt.meta.dataformat,
+			 f->fmt.meta.buffersize);
+
+		q_data->fmt = find_format(f, node);
+		q_data->width = 0;
+		q_data->height = 0;
+		q_data->bytesperline = 0;
+		q_data->sizeimage = f->fmt.meta.buffersize;
+	}
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "%s: Calculated bpl as %u, size %u\n", __func__,
+		 q_data->bytesperline, q_data->sizeimage);
+
+	setup_mmal_port_format(node, node->port);
+	ret = vchiq_mmal_port_set_format(dev->mmal_instance, node->port);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Failed vchiq_mmal_port_set_format on port, ret %d\n",
+			 __func__, ret);
+		ret = -EINVAL;
+	}
+
+	if (q_data->sizeimage < node->port->minimum_buffer.size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Current buffer size of %u < min buf size %u - driver mismatch to MMAL\n",
+			 __func__,
+			 q_data->sizeimage,
+			 node->port->minimum_buffer.size);
+	}
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "%s: Set format for type %d, wxh: %dx%d, fmt: %08x, size %u\n",
+		 __func__, f->type, q_data->width, q_data->height,
+		 q_data->fmt->fourcc, q_data->sizeimage);
+
+	return ret;
+}
+
+static int bcm2835_isp_node_querycap(struct file *file, void *priv,
+				     struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, BCM2835_ISP_NAME, sizeof(cap->driver));
+	strscpy(cap->card, BCM2835_ISP_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 BCM2835_ISP_NAME);
+
+	return 0;
+}
+
+static int bcm2835_isp_node_g_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	if (node_is_stats(node)) {
+		f->fmt.meta.dataformat = V4L2_META_FMT_BCM2835_ISP_STATS;
+		f->fmt.meta.buffersize =
+			node->port->minimum_buffer.size;
+	} else {
+		struct bcm2835_isp_q_data *q_data = &node->q_data;
+
+		f->fmt.pix.width = q_data->width;
+		f->fmt.pix.height = q_data->height;
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+		f->fmt.pix.pixelformat = q_data->fmt->fourcc;
+		f->fmt.pix.bytesperline = q_data->bytesperline;
+		f->fmt.pix.sizeimage = q_data->sizeimage;
+		f->fmt.pix.colorspace = q_data->fmt->colorspace;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_node_enum_fmt(struct file *file, void  *priv,
+				     struct v4l2_fmtdesc *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	if (f->index < node->num_supported_fmts) {
+		/* Format found */
+		f->pixelformat = node->supported_fmts[f->index]->fourcc;
+		f->flags = 0;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int bcm2835_isp_enum_framesizes(struct file *file, void *priv,
+				       struct v4l2_frmsizeenum *fsize)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	const struct bcm2835_isp_fmt *fmt;
+
+	if (node_is_stats(node) || fsize->index)
+		return -EINVAL;
+
+	fmt = find_format_by_fourcc(fsize->pixel_format, node);
+	if (!fmt) {
+		v4l2_err(&dev->v4l2_dev, "Invalid pixel code: %x\n",
+			 fsize->pixel_format);
+		return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = MIN_DIM;
+	fsize->stepwise.max_width = MAX_DIM;
+	fsize->stepwise.step_width = fmt->step_size;
+
+	fsize->stepwise.min_height = MIN_DIM;
+	fsize->stepwise.max_height = MAX_DIM;
+	fsize->stepwise.step_height = fmt->step_size;
+
+	return 0;
+}
+
+static int bcm2835_isp_node_try_fmt(struct file *file, void *priv,
+				    struct v4l2_format *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	const struct bcm2835_isp_fmt *fmt;
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	fmt = find_format(f, node);
+	if (!fmt)
+		fmt = get_default_format(node);
+
+	if (!node_is_stats(node)) {
+		f->fmt.pix.width = max(min(f->fmt.pix.width, MAX_DIM),
+				       MIN_DIM);
+		f->fmt.pix.height = max(min(f->fmt.pix.height, MAX_DIM),
+					MIN_DIM);
+
+		f->fmt.pix.pixelformat = fmt->fourcc;
+		f->fmt.pix.colorspace = fmt->colorspace;
+		f->fmt.pix.bytesperline = get_bytesperline(f->fmt.pix.width,
+							   fmt);
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+		f->fmt.pix.sizeimage =
+			get_sizeimage(f->fmt.pix.bytesperline, f->fmt.pix.width,
+				      f->fmt.pix.height, fmt);
+	} else {
+		f->fmt.meta.dataformat = fmt->fourcc;
+		f->fmt.meta.buffersize = node->port->minimum_buffer.size;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_node_s_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	int ret;
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	ret = bcm2835_isp_node_try_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	v4l2_dbg(1, debug, &node_get_dev(node)->v4l2_dev,
+		 "%s: Set format for node %s[%d]\n",
+		 __func__, node->name, node->id);
+
+	return populate_qdata_fmt(f, node);
+}
+
+static int bcm2835_isp_node_s_selection(struct file *file, void *fh,
+					struct v4l2_selection *s)
+{
+	struct mmal_parameter_crop crop;
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	/* This return value is required for V4L2 compliance. */
+	if (node_is_stats(node))
+		return -ENOTTY;
+
+	if (!s->r.width || !s->r.height)
+		return -EINVAL;
+
+	/* We can only set crop on the input. */
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		/*
+		 * Adjust the crop window if it goes outside of the frame
+		 * dimensions.
+		 */
+		s->r.left = min((unsigned int)max(s->r.left, 0),
+				node->q_data.width - MIN_DIM);
+		s->r.top = min((unsigned int)max(s->r.top, 0),
+			       node->q_data.height - MIN_DIM);
+		s->r.width = max(min(s->r.width,
+				     node->q_data.width - s->r.left), MIN_DIM);
+		s->r.height = max(min(s->r.height,
+				      node->q_data.height - s->r.top), MIN_DIM);
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		/* Default (i.e. no) crop window. */
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = node->q_data.width;
+		s->r.height = node->q_data.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	crop.rect.x = s->r.left;
+	crop.rect.y = s->r.top;
+	crop.rect.width = s->r.width;
+	crop.rect.height = s->r.height;
+
+	return vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
+					     MMAL_PARAMETER_CROP,
+					     &crop, sizeof(crop));
+}
+
+static int bcm2835_isp_node_g_selection(struct file *file, void *fh,
+					struct v4l2_selection *s)
+{
+	struct mmal_parameter_crop crop;
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	u32 crop_size = sizeof(crop);
+	int ret;
+
+	/* We can only return out an input crop. */
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		ret = vchiq_mmal_port_parameter_get(dev->mmal_instance,
+						    node->port,
+						    MMAL_PARAMETER_CROP,
+						    &crop, &crop_size);
+		if (!ret) {
+			s->r.left = crop.rect.x;
+			s->r.top = crop.rect.y;
+			s->r.width = crop.rect.width;
+			s->r.height = crop.rect.height;
+		}
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		/* Default (i.e. no) crop window. */
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = node->q_data.width;
+		s->r.height = node->q_data.height;
+		ret = 0;
+		break;
+	default:
+		ret =  -EINVAL;
+	}
+
+	return ret;
+}
+
+static int bcm3285_isp_subscribe_event(struct v4l2_fh *fh,
+				       const struct v4l2_event_subscription *s)
+{
+	switch (s->type) {
+	/* Cannot change source parameters dynamically at runtime. */
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return -EINVAL;
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, s);
+	default:
+		return v4l2_event_subscribe(fh, s, 4, NULL);
+	}
+}
+
+static const struct v4l2_ioctl_ops bcm2835_isp_node_ioctl_ops = {
+	.vidioc_querycap		= bcm2835_isp_node_querycap,
+	.vidioc_g_fmt_vid_cap		= bcm2835_isp_node_g_fmt,
+	.vidioc_g_fmt_vid_out		= bcm2835_isp_node_g_fmt,
+	.vidioc_g_fmt_meta_cap		= bcm2835_isp_node_g_fmt,
+	.vidioc_s_fmt_vid_cap		= bcm2835_isp_node_s_fmt,
+	.vidioc_s_fmt_vid_out		= bcm2835_isp_node_s_fmt,
+	.vidioc_s_fmt_meta_cap		= bcm2835_isp_node_s_fmt,
+	.vidioc_try_fmt_vid_cap		= bcm2835_isp_node_try_fmt,
+	.vidioc_try_fmt_vid_out		= bcm2835_isp_node_try_fmt,
+	.vidioc_try_fmt_meta_cap	= bcm2835_isp_node_try_fmt,
+	.vidioc_s_selection		= bcm2835_isp_node_s_selection,
+	.vidioc_g_selection		= bcm2835_isp_node_g_selection,
+
+	.vidioc_enum_fmt_vid_cap	= bcm2835_isp_node_enum_fmt,
+	.vidioc_enum_fmt_vid_out	= bcm2835_isp_node_enum_fmt,
+	.vidioc_enum_fmt_meta_cap	= bcm2835_isp_node_enum_fmt,
+	.vidioc_enum_framesizes		= bcm2835_isp_enum_framesizes,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_subscribe_event		= bcm3285_isp_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/*
+ * Size of the array to provide to the VPU when asking for the list of supported
+ * formats.
+ *
+ * The ISP component currently advertises 62 input formats, so add a small
+ * overhead on that. Should the component advertise more formats then the excess
+ * will be dropped and a warning logged.
+ */
+#define MAX_SUPPORTED_ENCODINGS 70
+
+/* Populate node->supported_fmts with the formats supported by those ports. */
+static int bcm2835_isp_get_supported_fmts(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct bcm2835_isp_fmt const **list;
+	unsigned int i, j, num_encodings;
+	u32 fourccs[MAX_SUPPORTED_ENCODINGS];
+	u32 param_size = sizeof(fourccs);
+	int ret;
+
+	ret = vchiq_mmal_port_parameter_get(dev->mmal_instance, node->port,
+					    MMAL_PARAMETER_SUPPORTED_ENCODINGS,
+					    &fourccs, &param_size);
+
+	if (ret) {
+		if (ret == MMAL_MSG_STATUS_ENOSPC) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s: port has more encodings than we provided space for. Some are dropped (%zu vs %u).\n",
+				 __func__, param_size / sizeof(u32),
+				 MAX_SUPPORTED_ENCODINGS);
+			num_encodings = MAX_SUPPORTED_ENCODINGS;
+		} else {
+			v4l2_err(&dev->v4l2_dev, "%s: get_param ret %u.\n",
+				 __func__, ret);
+			return -EINVAL;
+		}
+	} else {
+		num_encodings = param_size / sizeof(u32);
+	}
+
+	/*
+	 * Assume at this stage that all encodings will be supported in V4L2.
+	 * Any that aren't supported will waste a very small amount of memory.
+	 */
+	list = devm_kzalloc(dev->dev,
+			    sizeof(struct bcm2835_isp_fmt *) * num_encodings,
+			    GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+	node->supported_fmts = list;
+
+	for (i = 0, j = 0; i < num_encodings; i++) {
+		const struct bcm2835_isp_fmt *fmt = get_fmt(fourccs[i]);
+
+		if (fmt) {
+			list[j] = fmt;
+			j++;
+		}
+	}
+	node->num_supported_fmts = j;
+
+	return 0;
+}
+
+/*
+ * Register a device node /dev/video<N> to go along with one of the ISP's input
+ * or output nodes.
+ */
+static int register_node(struct bcm2835_isp_dev *dev,
+			 struct bcm2835_isp_node *node,
+			 int index)
+{
+	struct video_device *vfd;
+	struct vb2_queue *queue;
+	int ret;
+
+	mutex_init(&node->lock);
+	mutex_init(&node->queue_lock);
+
+	node->dev = dev;
+	vfd = &node->vfd;
+	queue = &node->queue;
+	queue->type = index_to_queue_type(index);
+	/*
+	 * Setup the node type-specific params.
+	 *
+	 * Only the OUTPUT node can set controls and crop windows. However,
+	 * we must allow the s/g_selection ioctl on the stats node as v4l2
+	 * compliance expects it to return a -ENOTTY, and the framework
+	 * does not handle it if the ioctl is disabled.
+	 */
+	switch (queue->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		vfd->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		node->id = index;
+		node->vfl_dir = VFL_DIR_TX;
+		node->name = "output";
+		node->port = &dev->component->input[node->id];
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		/* First Capture node starts at id 0, etc. */
+		node->id = index - BCM2835_ISP_NUM_OUTPUTS;
+		node->vfl_dir = VFL_DIR_RX;
+		node->name = "capture";
+		node->port = &dev->component->output[node->id];
+		v4l2_disable_ioctl(&node->vfd, VIDIOC_S_CTRL);
+		v4l2_disable_ioctl(&node->vfd, VIDIOC_S_SELECTION);
+		v4l2_disable_ioctl(&node->vfd, VIDIOC_G_SELECTION);
+		break;
+	case V4L2_BUF_TYPE_META_CAPTURE:
+		vfd->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		node->id = index - BCM2835_ISP_NUM_OUTPUTS;
+		node->vfl_dir = VFL_DIR_RX;
+		node->name = "stats";
+		node->port = &dev->component->output[node->id];
+		v4l2_disable_ioctl(&node->vfd, VIDIOC_S_CTRL);
+		v4l2_disable_ioctl(&node->vfd, VIDIOC_S_SELECTION);
+		v4l2_disable_ioctl(&node->vfd, VIDIOC_G_SELECTION);
+		break;
+	}
+
+	/* We use the selection API instead of the old crop API. */
+	v4l2_disable_ioctl(vfd, VIDIOC_CROPCAP);
+	v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
+	v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
+
+	ret = bcm2835_isp_get_supported_fmts(node);
+	if (ret)
+		return ret;
+
+	/* Initialise the video node. */
+	vfd->vfl_type	= VFL_TYPE_VIDEO;
+	vfd->fops	= &bcm2835_isp_fops,
+	vfd->ioctl_ops	= &bcm2835_isp_node_ioctl_ops,
+	vfd->minor	= -1,
+	vfd->release	= video_device_release_empty,
+	vfd->queue	= &node->queue;
+	vfd->lock	= &node->lock;
+	vfd->v4l2_dev	= &dev->v4l2_dev;
+	vfd->vfl_dir	= node->vfl_dir;
+
+	node->q_data.fmt = get_default_format(node);
+	node->q_data.width = DEFAULT_DIM;
+	node->q_data.height = DEFAULT_DIM;
+	node->q_data.bytesperline =
+		get_bytesperline(DEFAULT_DIM, node->q_data.fmt);
+	node->q_data.sizeimage = node_is_stats(node) ?
+				 node->port->recommended_buffer.size :
+				 get_sizeimage(node->q_data.bytesperline,
+					       node->q_data.width,
+					       node->q_data.height,
+					       node->q_data.fmt);
+
+	queue->io_modes = VB2_MMAP | VB2_DMABUF;
+	queue->drv_priv = node;
+	queue->ops = &bcm2835_isp_node_queue_ops;
+	queue->mem_ops = &vb2_dma_contig_memops;
+	queue->buf_struct_size = sizeof(struct bcm2835_isp_buffer);
+	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	queue->dev = dev->dev;
+	queue->lock = &node->queue_lock;
+
+	ret = vb2_queue_init(queue);
+	if (ret < 0) {
+		v4l2_info(&dev->v4l2_dev, "vb2_queue_init failed\n");
+		return ret;
+	}
+
+	/* Set some controls and defaults, but only on the VIDEO_OUTPUT node. */
+	if (node_is_output(node)) {
+		unsigned int i;
+
+		/* Use this ctrl template to assign custom ISP ctrls. */
+		struct v4l2_ctrl_config ctrl_template = {
+			.ops		= &bcm2835_isp_ctrl_ops,
+			.type		= V4L2_CTRL_TYPE_U8,
+			.def		= 0,
+			.min		= 0x00,
+			.max		= 0xff,
+			.step		= 1,
+		};
+
+		/* 3 standard controls, and an array of custom controls */
+		ret = v4l2_ctrl_handler_init(&dev->ctrl_handler,
+					     3 + ARRAY_SIZE(custom_ctrls));
+		if (ret) {
+			v4l2_err(&dev->v4l2_dev, "ctrl_handler init failed (%d)\n",
+				 ret);
+			goto queue_cleanup;
+		}
+
+		dev->r_gain = 1000;
+		dev->b_gain = 1000;
+
+		v4l2_ctrl_new_std(&dev->ctrl_handler,  &bcm2835_isp_ctrl_ops,
+				  V4L2_CID_RED_BALANCE, 1, 0xffff, 1,
+				  dev->r_gain);
+
+		v4l2_ctrl_new_std(&dev->ctrl_handler, &bcm2835_isp_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE, 1, 0xffff, 1,
+				  dev->b_gain);
+
+		v4l2_ctrl_new_std(&dev->ctrl_handler, &bcm2835_isp_ctrl_ops,
+				  V4L2_CID_DIGITAL_GAIN, 1, 0xffff, 1, 1000);
+
+		for (i = 0; i < ARRAY_SIZE(custom_ctrls); i++) {
+			ctrl_template.name = custom_ctrls[i].name;
+			ctrl_template.id = custom_ctrls[i].id;
+			ctrl_template.dims[0] = custom_ctrls[i].size;
+			ctrl_template.flags = custom_ctrls[i].flags;
+			v4l2_ctrl_new_custom(&dev->ctrl_handler,
+					     &ctrl_template, NULL);
+		}
+
+		node->vfd.ctrl_handler = &dev->ctrl_handler;
+		if (dev->ctrl_handler.error) {
+			ret = dev->ctrl_handler.error;
+			v4l2_err(&dev->v4l2_dev, "controls init failed (%d)\n",
+				 ret);
+			v4l2_ctrl_handler_free(&dev->ctrl_handler);
+			goto ctrl_cleanup;
+		}
+	}
+
+	/* Define the device names */
+	snprintf(vfd->name, sizeof(node->vfd.name), "%s-%s%d", BCM2835_ISP_NAME,
+		 node->name, node->id);
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr + index);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "Failed to register video %s[%d] device node\n",
+			 node->name, node->id);
+		goto ctrl_cleanup;
+	}
+
+	node->registered = true;
+	video_set_drvdata(vfd, node);
+
+	v4l2_info(&dev->v4l2_dev,
+		  "Device node %s[%d] registered as /dev/video%d\n",
+		  node->name, node->id, vfd->num);
+
+	return 0;
+
+ctrl_cleanup:
+	if (node_is_output(node))
+		v4l2_ctrl_handler_free(&dev->ctrl_handler);
+queue_cleanup:
+	vb2_queue_release(&node->queue);
+	return ret;
+}
+
+/* Unregister one of the /dev/video<N> nodes associated with the ISP. */
+static void bcm2835_isp_unregister_node(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	v4l2_info(&dev->v4l2_dev,
+		  "Unregistering node %s[%d] device node /dev/video%d\n",
+		  node->name, node->id, node->vfd.num);
+
+	if (node->registered) {
+		video_unregister_device(&node->vfd);
+		if (node_is_output(node))
+			v4l2_ctrl_handler_free(&dev->ctrl_handler);
+		vb2_queue_release(&node->queue);
+	}
+
+	/*
+	 * node->supported_fmts.list is free'd automatically
+	 * as a managed resource.
+	 */
+	node->supported_fmts = NULL;
+	node->num_supported_fmts = 0;
+	node->vfd.ctrl_handler = NULL;
+	node->registered = false;
+}
+
+static void media_controller_unregister(struct bcm2835_isp_dev *dev)
+{
+	unsigned int i;
+
+	v4l2_info(&dev->v4l2_dev, "Unregister from media controller\n");
+
+	if (dev->media_device_registered) {
+		media_device_unregister(&dev->mdev);
+		media_device_cleanup(&dev->mdev);
+		dev->media_device_registered = false;
+	}
+
+	kfree(dev->entity.name);
+	dev->entity.name = NULL;
+
+	if (dev->media_entity_registered) {
+		media_device_unregister_entity(&dev->entity);
+		dev->media_entity_registered = false;
+	}
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		struct bcm2835_isp_node *node = &dev->node[i];
+
+		if (node->media_node_registered) {
+			media_remove_intf_links(node->intf_link->intf);
+			media_entity_remove_links(&dev->node[i].vfd.entity);
+			media_devnode_remove(node->intf_devnode);
+			media_device_unregister_entity(&node->vfd.entity);
+			kfree(node->vfd.entity.name);
+		}
+		node->media_node_registered = false;
+	}
+
+	dev->v4l2_dev.mdev = NULL;
+}
+
+static int media_controller_register_node(struct bcm2835_isp_dev *dev, int num)
+{
+	struct bcm2835_isp_node *node = &dev->node[num];
+	struct media_entity *entity = &node->vfd.entity;
+	int output = node_is_output(node);
+	char *name;
+	int ret;
+
+	v4l2_info(&dev->v4l2_dev,
+		  "Register %s node %d with media controller\n",
+		  output ? "output" : "capture", num);
+	entity->obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
+	entity->function = MEDIA_ENT_F_IO_V4L;
+	entity->info.dev.major = VIDEO_MAJOR;
+	entity->info.dev.minor = node->vfd.minor;
+	name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto error_no_mem;
+	}
+	snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "%s0-%s%d",
+		 BCM2835_ISP_NAME, output ? "output" : "capture", num);
+	entity->name = name;
+	node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(entity, 1, &node->pad);
+	if (ret)
+		goto error_pads_init;
+	ret = media_device_register_entity(&dev->mdev, entity);
+	if (ret)
+		goto error_register_entity;
+
+	node->intf_devnode = media_devnode_create(&dev->mdev,
+						  MEDIA_INTF_T_V4L_VIDEO, 0,
+						  VIDEO_MAJOR, node->vfd.minor);
+	if (!node->intf_devnode) {
+		ret = -ENOMEM;
+		goto error_devnode_create;
+	}
+
+	node->intf_link = media_create_intf_link(entity,
+						 &node->intf_devnode->intf,
+						 MEDIA_LNK_FL_IMMUTABLE |
+						 MEDIA_LNK_FL_ENABLED);
+	if (!node->intf_link) {
+		ret = -ENOMEM;
+		goto error_create_intf_link;
+	}
+
+	if (output)
+		ret = media_create_pad_link(entity, 0, &dev->entity, num,
+					    MEDIA_LNK_FL_IMMUTABLE |
+						    MEDIA_LNK_FL_ENABLED);
+	else
+		ret = media_create_pad_link(&dev->entity, num, entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto error_create_pad_link;
+
+	dev->node[num].media_node_registered = true;
+	return 0;
+
+error_create_pad_link:
+	media_remove_intf_links(&node->intf_devnode->intf);
+error_create_intf_link:
+	media_devnode_remove(node->intf_devnode);
+error_devnode_create:
+	media_device_unregister_entity(&node->vfd.entity);
+error_register_entity:
+error_pads_init:
+	kfree(entity->name);
+	entity->name = NULL;
+error_no_mem:
+	if (ret)
+		v4l2_info(&dev->v4l2_dev, "Error registering node\n");
+
+	return ret;
+}
+
+static int media_controller_register(struct bcm2835_isp_dev *dev)
+{
+	char *name;
+	unsigned int i;
+	int ret;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media controller\n");
+	dev->mdev.dev = dev->dev;
+	strscpy(dev->mdev.model, "bcm2835-isp",
+		sizeof(dev->mdev.model));
+	strscpy(dev->mdev.bus_info, "platform:bcm2835-isp",
+		sizeof(dev->mdev.bus_info));
+	media_device_init(&dev->mdev);
+	dev->v4l2_dev.mdev = &dev->mdev;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev, "Register entity for nodes\n");
+
+	name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto done;
+	}
+	snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835_isp0");
+	dev->entity.name = name;
+	dev->entity.obj_type = MEDIA_ENTITY_TYPE_BASE;
+	dev->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		dev->pad[i].flags = node_is_output(&dev->node[i]) ?
+					MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	}
+
+	ret = media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_NODES,
+				     dev->pad);
+	if (ret)
+		goto done;
+
+	ret = media_device_register_entity(&dev->mdev, &dev->entity);
+	if (ret)
+		goto done;
+
+	dev->media_entity_registered = true;
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		ret = media_controller_register_node(dev, i);
+		if (ret)
+			goto done;
+	}
+
+	ret = media_device_register(&dev->mdev);
+	if (!ret)
+		dev->media_device_registered = true;
+done:
+	return ret;
+}
+
+static void bcm2835_isp_remove(struct vchiq_device *device)
+{
+	struct bcm2835_isp_dev *dev = vchiq_get_drvdata(device);
+	unsigned int i;
+
+	media_controller_unregister(dev);
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++)
+		bcm2835_isp_unregister_node(&dev->node[i]);
+
+	v4l2_device_unregister(&dev->v4l2_dev);
+
+	if (dev->component)
+		vchiq_mmal_component_finalise(dev->mmal_instance,
+					      dev->component);
+
+	vchiq_mmal_finalise(dev->mmal_instance);
+}
+
+static int bcm2835_isp_probe(struct vchiq_device *device)
+{
+	struct bcm2835_isp_dev *dev;
+	unsigned int i;
+	int ret;
+
+	dev = devm_kzalloc(&device->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->dev = &device->dev;
+
+	ret = v4l2_device_register(&device->dev, &dev->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = vchiq_mmal_init(&dev->mmal_instance);
+	if (ret) {
+		v4l2_device_unregister(&dev->v4l2_dev);
+		return ret;
+	}
+
+	ret = vchiq_mmal_component_init(dev->mmal_instance, "ril.isp",
+					&dev->component);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: failed to create ril.isp component\n", __func__);
+		goto error;
+	}
+
+	if (dev->component->inputs < BCM2835_ISP_NUM_OUTPUTS ||
+	    dev->component->outputs < BCM2835_ISP_NUM_CAPTURES +
+					BCM2835_ISP_NUM_METADATA) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: ril.isp returned %d i/p (%d expected), %d o/p (%d expected) ports\n",
+			  __func__, dev->component->inputs,
+			  BCM2835_ISP_NUM_OUTPUTS,
+			  dev->component->outputs,
+			  BCM2835_ISP_NUM_CAPTURES + BCM2835_ISP_NUM_METADATA);
+		goto error;
+	}
+
+	atomic_set(&dev->num_streaming, 0);
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		struct bcm2835_isp_node *node = &dev->node[i];
+
+		ret = register_node(dev, node, i);
+		if (ret)
+			goto error;
+	}
+
+	ret = media_controller_register(dev);
+	if (ret)
+		goto error;
+
+	vchiq_set_drvdata(device, dev);
+	v4l2_info(&dev->v4l2_dev, "Loaded V4L2 %s\n", BCM2835_ISP_NAME);
+	return 0;
+
+error:
+	bcm2835_isp_remove(device);
+
+	return ret;
+}
+
+static struct vchiq_device_id device_id_table[] = {
+        { .name = "bcm2835-isp" },
+        {}
+};
+MODULE_DEVICE_TABLE(vchiq, device_id_table);
+
+static struct vchiq_driver bcm2835_isp = {
+	.probe = bcm2835_isp_probe,
+	.remove = bcm2835_isp_remove,
+	.id_table = device_id_table,
+	.driver = {
+			.name = BCM2835_ISP_NAME,
+	},
+};
+
+module_vchiq_driver(bcm2835_isp);
+
+MODULE_DESCRIPTION("BCM2835 ISP driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1.0");
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
index 4711877a9711..538c347db433 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
@@ -135,6 +135,10 @@
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
 
+/** ISP image statistics format
+ */
+#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
+
 /* }@ */
 
 /** \name Pre-defined audio encodings */
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index a0cdd28101f2..5e6276aca143 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -223,6 +223,63 @@ enum mmal_parameter_camera_type {
 	MMAL_PARAMETER_SHUTTER_SPEED,
 		/**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
 	MMAL_PARAMETER_CUSTOM_AWB_GAINS,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
+	MMAL_PARAMETER_CAMERA_SETTINGS,
+		/**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
+	MMAL_PARAMETER_PRIVACY_INDICATOR,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_STILLS_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
+	MMAL_PARAMETER_ANNOTATE,
+		/**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
+	MMAL_PARAMETER_STEREOSCOPIC_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
+	MMAL_PARAMETER_CAMERA_INTERFACE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
+	MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
+	MMAL_PARAMETER_CAMERA_RX_CONFIG,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
+	MMAL_PARAMETER_CAMERA_RX_TIMING,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_DPF_CONFIG,
+	/* 0x50 */
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
+	MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_BLACK_LEVEL,
+		/**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
+	MMAL_PARAMETER_RESIZE_PARAMS,
+		/**< Takes a @ref MMAL_PARAMETER_CROP_T */
+	MMAL_PARAMETER_CROP,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_OUTPUT_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_CCM_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
+	MMAL_PARAMETER_CUSTOM_CCM,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_ANALOG_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_DIGITAL_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
+	MMAL_PARAMETER_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
+	MMAL_PARAMETER_SHARPEN,
+		/**< Takes a @ref MMAL_PARAMETER_GEQ_T */
+	MMAL_PARAMETER_GEQ,
+		/**< Tales a @ref MMAP_PARAMETER_DPC_T */
+	MMAL_PARAMETER_DPC,
+		/**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
+	MMAL_PARAMETER_GAMMA,
+		/**< Takes a @ref MMAL_PARAMETER_CDN_T */
+	MMAL_PARAMETER_CDN,
 };
 
 enum mmal_parameter_camera_config_timestamp_mode {
@@ -746,7 +803,113 @@ struct mmal_parameter_camera_info {
 	struct mmal_parameter_camera_info_camera
 		cameras[MMAL_PARAMETER_CAMERA_INFO_MAX_CAMERAS];
 	struct mmal_parameter_camera_info_flash
-				flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
+		flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
+};
+
+struct mmal_parameter_ccm {
+	struct s32_fract cm[3][3];
+	s32 offsets[3];
+};
+
+struct mmal_parameter_custom_ccm {
+	u32 enabled; /**< Enable the custom CCM. */
+	struct mmal_parameter_ccm ccm; /**< CCM to be used. */
+};
+
+struct mmal_parameter_lens_shading {
+	u32 enabled;
+	u32 grid_cell_size;
+	u32 grid_width;
+	u32 grid_stride;
+	u32 grid_height;
+	u32 mem_handle_table;
+	u32 ref_transform;
+};
+
+enum mmal_parameter_ls_gain_format_type {
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 = 0,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 = 1,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 = 2,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 = 3,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 = 4,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 = 5,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 = 6,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  = 7,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
+};
+
+struct mmal_parameter_lens_shading_v2 {
+	u32 enabled;
+	u32 grid_cell_size;
+	u32 grid_width;
+	u32 grid_stride;
+	u32 grid_height;
+	u32 mem_handle_table;
+	u32 ref_transform;
+	u32 corner_sampled;
+	enum mmal_parameter_ls_gain_format_type gain_format;
+};
+
+struct mmal_parameter_black_level {
+	u32 enabled;
+	u16 black_level_r;
+	u16 black_level_g;
+	u16 black_level_b;
+	u8 pad_[2]; /* Unused */
+};
+
+struct mmal_parameter_geq {
+	u32 enabled;
+	u32 offset;
+	struct s32_fract slope;
+};
+
+#define MMAL_NUM_GAMMA_PTS 33
+struct mmal_parameter_gamma {
+	u32 enabled;
+	u16 x[MMAL_NUM_GAMMA_PTS];
+	u16 y[MMAL_NUM_GAMMA_PTS];
+};
+
+enum mmal_parameter_cdn_mode {
+	MMAL_PARAM_CDN_FAST = 0,
+	MMAL_PARAM_CDN_HIGH_QUALITY = 1,
+	MMAL_PARAM_CDN_DUMMY  = 0x7FFFFFFF
+};
+
+struct mmal_parameter_colour_denoise {
+	u32 enabled;
+	enum mmal_parameter_cdn_mode mode;
+};
+
+struct mmal_parameter_denoise {
+	u32 enabled;
+	u32 constant;
+	struct s32_fract slope;
+	struct s32_fract strength;
+};
+
+struct mmal_parameter_sharpen {
+	u32 enabled;
+	struct s32_fract threshold;
+	struct s32_fract strength;
+	struct s32_fract limit;
+};
+
+enum mmal_dpc_mode {
+	MMAL_DPC_MODE_OFF = 0,
+	MMAL_DPC_MODE_NORMAL = 1,
+	MMAL_DPC_MODE_STRONG = 2,
+	MMAL_DPC_MODE_MAX = 0x7FFFFFFF,
+};
+
+struct mmal_parameter_dpc {
+	u32 enabled;
+	u32 strength;
+};
+
+struct mmal_parameter_crop {
+	struct vchiq_mmal_rect rect;
 };
 
 #endif
diff --git a/include/uapi/linux/bcm2835-isp.h b/include/uapi/linux/bcm2835-isp.h
index cf8c0437f159..c50e3ca81565 100644
--- a/include/uapi/linux/bcm2835-isp.h
+++ b/include/uapi/linux/bcm2835-isp.h
@@ -31,6 +31,8 @@
 				(V4L2_CID_USER_BCM2835_ISP_BASE + 0x0007)
 #define V4L2_CID_USER_BCM2835_ISP_DPC		\
 				(V4L2_CID_USER_BCM2835_ISP_BASE + 0x0008)
+#define V4L2_CID_USER_BCM2835_ISP_CDN \
+				(V4L2_CID_USER_BCM2835_ISP_BASE + 0x0009)
 
 /*
  * All structs below are directly mapped onto the equivalent structs in
@@ -175,6 +177,31 @@ struct bcm2835_isp_gamma {
 	__u16 y[BCM2835_NUM_GAMMA_PTS];
 };
 
+/**
+ * enum bcm2835_isp_cdn_mode - Mode of operation for colour denoise.
+ *
+ * @CDN_MODE_FAST:		Fast (but lower quality) colour denoise
+ *				algorithm, typically used for video recording.
+ * @CDN_HIGH_QUALITY:		High quality (but slower) colour denoise
+ *				algorithm, typically used for stills capture.
+ */
+enum bcm2835_isp_cdn_mode {
+	CDN_MODE_FAST = 0,
+	CDN_MODE_HIGH_QUALITY = 1,
+};
+
+/**
+ * struct bcm2835_isp_cdn - Colour denoise parameters set with the
+ *			    V4L2_CID_USER_BCM2835_ISP_CDN ctrl.
+ *
+ * @enabled:	Enable colour denoise.
+ * @mode:	Colour denoise operating mode (see enum &bcm2835_isp_cdn_mode)
+ */
+struct bcm2835_isp_cdn {
+	__u32 enabled;
+	__u32 mode;
+};
+
 /**
  * struct bcm2835_isp_denoise - Denoise parameters set with the
  *				V4L2_CID_USER_BCM2835_ISP_DENOISE ctrl.
-- 
2.41.0

