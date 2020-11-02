Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0812A3078
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 17:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgKBQxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 11:53:43 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49207 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgKBQxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 11:53:42 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2408D200004;
        Mon,  2 Nov 2020 16:53:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, nsaenzjulienne@suse.de,
        mchehab+huawei@kernel.org
Subject: [PATCH v3 4/5] media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface
Date:   Mon,  2 Nov 2020 17:52:57 +0100
Message-Id: <20201102165258.408049-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102165258.408049-1-jacopo@jmondi.org>
References: <20201102165258.408049-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Naushir Patuck <naush@raspberrypi.com>

Add a driver for the Unicam camera receiver block on BCM283x processors.
Compared to the bcm2835-camera driver present in staging, this driver
handles the Unicam block only (CSI-2 receiver), and doesn't depend on
the VC4 firmware running on the VPU.

The commit is made up of a series of changes cherry-picked from the
rpi-5.9.y branch of https://github.com/raspberrypi/linux/ at revision
commit be371a8ffc012
("media: bcm2835-unicam: change minimum number of vb2_queue buffers to 1")
with additional enhancements, forward-ported to the mainline kernel.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 MAINTAINERS                                   |    7 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/bcm2835-unicam/Kconfig  |   21 +
 drivers/staging/media/bcm2835-unicam/Makefile |    3 +
 .../media/bcm2835-unicam/bcm2835-unicam.c     | 2800 +++++++++++++++++
 .../media/bcm2835-unicam/vc4-regs-unicam.h    |  253 ++
 7 files changed, 3087 insertions(+)
 create mode 100644 drivers/staging/media/bcm2835-unicam/Kconfig
 create mode 100644 drivers/staging/media/bcm2835-unicam/Makefile
 create mode 100644 drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
 create mode 100644 drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29d..98e70d7bb4638 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3410,6 +3410,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 CAMERA DRIVER
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
+F:	drivers/staging/media/bcm2835/
+
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafał Miłecki <zajec5@gmail.com>
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 747c6cf1d795e..b734e882f63c9 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -46,4 +46,6 @@ source "drivers/staging/media/ipu3/Kconfig"
 
 source "drivers/staging/media/rkisp1/Kconfig"
 
+source "drivers/staging/media/bcm2835-unicam/Kconfig"
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index b59571826ba69..93d819ef243f1 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_VIDEO_ALLEGRO_DVT)	+= allegro-dvt/
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
+obj-$(CONFIG_VIDEO_BCM2835_UNICAM)	+= bcm2835-unicam/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
diff --git a/drivers/staging/media/bcm2835-unicam/Kconfig b/drivers/staging/media/bcm2835-unicam/Kconfig
new file mode 100644
index 0000000000000..bd13701996509
--- /dev/null
+++ b/drivers/staging/media/bcm2835-unicam/Kconfig
@@ -0,0 +1,21 @@
+# Broadcom VideoCore4 V4L2 camera support
+
+config VIDEO_BCM2835_UNICAM
+	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
+	depends on VIDEO_V4L2
+	depends on ARCH_BCM2835 || COMPILE_TEST
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
+	  This is a V4L2 driver that controls the CSI-2 receiver directly,
+	  independently from the VC4 firmware.
+	  This driver is mutually exclusive with the use of bcm2835-camera. The
+	  firmware will disable all access to the peripheral from within the
+	  firmware if it finds a DT node using it, and bcm2835-camera will
+	  therefore fail to probe.
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called bcm2835-unicam.
diff --git a/drivers/staging/media/bcm2835-unicam/Makefile b/drivers/staging/media/bcm2835-unicam/Makefile
new file mode 100644
index 0000000000000..a98aba03598ab
--- /dev/null
+++ b/drivers/staging/media/bcm2835-unicam/Makefile
@@ -0,0 +1,3 @@
+# Makefile for BCM2835 Unicam driver
+
+obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
diff --git a/drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c b/drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
new file mode 100644
index 0000000000000..7b3d7ea1f45d3
--- /dev/null
+++ b/drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
@@ -0,0 +1,2800 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * BCM283x / BCM271x Unicam Capture Driver
+ *
+ * Copyright (C) 2017-2020 - Raspberry Pi (Trading) Ltd.
+ *
+ * Dave Stevenson <dave.stevenson@raspberrypi.com>
+ *
+ * Based on TI am437x driver by
+ *   Benoit Parrot <bparrot@ti.com>
+ *   Lad, Prabhakar <prabhakar.csengg@gmail.com>
+ *
+ * and TI CAL camera interface driver by
+ *    Benoit Parrot <bparrot@ti.com>
+ *
+ *
+ * There are two camera drivers in the kernel for BCM283x - this one
+ * and bcm2835-camera (currently in staging).
+ *
+ * This driver directly controls the Unicam peripheral - there is no
+ * involvement with the VideoCore firmware. Unicam receives CSI-2 or
+ * CCP2 data and writes it into SDRAM.
+ * The only potential processing options are to repack Bayer data into an
+ * alternate format, and applying windowing.
+ * The repacking does not shift the data, so can repack V4L2_PIX_FMT_Sxxxx10P
+ * to V4L2_PIX_FMT_Sxxxx10, or V4L2_PIX_FMT_Sxxxx12P to V4L2_PIX_FMT_Sxxxx12,
+ * but not generically up to V4L2_PIX_FMT_Sxxxx16. The driver will add both
+ * formats where the relevant formats are defined, and will automatically
+ * configure the repacking as required.
+ * Support for windowing may be added later.
+ *
+ * It should be possible to connect this driver to any sensor with a
+ * suitable output interface and V4L2 subdevice driver.
+ *
+ * bcm2835-camera uses the VideoCore firmware to control the sensor,
+ * Unicam, ISP, and all tuner control loops. Fully processed frames are
+ * delivered to the driver by the firmware. It only has sensor drivers
+ * for Omnivision OV5647, and Sony IMX219 sensors.
+ *
+ * The two drivers are mutually exclusive for the same Unicam instance.
+ * The VideoCore firmware checks the device tree configuration during boot.
+ * If it finds device tree nodes called csi0 or csi1 it will block the
+ * firmware from accessing the peripheral, and bcm2835-camera will
+ * not be able to stream data.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-fwnode.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "vc4-regs-unicam.h"
+
+#define UNICAM_MODULE_NAME	"unicam"
+#define UNICAM_VERSION		"0.1.0"
+
+/*
+ * Unicam must request a minimum of 250Mhz from the VPU clock.
+ * Otherwise the input FIFOs overrun and cause image corruption.
+ */
+#define MIN_VPU_CLOCK_RATE (250 * 1000 * 1000)
+/*
+ * To protect against a dodgy sensor driver never returning an error from
+ * enum_mbus_code, set a maximum index value to be used.
+ */
+#define MAX_ENUM_MBUS_CODE	128
+
+/*
+ * Stride is a 16 bit register, but also has to be a multiple of 32.
+ */
+#define BPL_ALIGNMENT		32
+#define MAX_BYTESPERLINE	((1 << 16) - BPL_ALIGNMENT)
+/*
+ * Max width is therefore determined by the max stride divided by
+ * the number of bits per pixel. Take 32bpp as a
+ * worst case.
+ * No imposed limit on the height, so adopt a square image for want
+ * of anything better.
+ */
+#define MAX_WIDTH		(MAX_BYTESPERLINE / 4)
+#define MAX_HEIGHT		MAX_WIDTH
+/* Define a nominal minimum image size */
+#define MIN_WIDTH		16
+#define MIN_HEIGHT		16
+/* Default size of the embedded buffer */
+#define UNICAM_EMBEDDED_SIZE	8192
+
+/*
+ * Size of the dummy buffer. Can be any size really, but the DMA
+ * allocation works in units of page sizes.
+ */
+#define DUMMY_BUF_SIZE		(PAGE_SIZE)
+
+enum pad_types {
+	IMAGE_PAD,
+	METADATA_PAD,
+	MAX_NODES
+};
+
+/*
+ * struct unicam_fmt - Unicam media bus format information
+ * @pixelformat: V4L2 pixel format FCC identifier. 0 if n/a.
+ * @repacked_fourcc: V4L2 pixel format FCC identifier if the data is expanded
+ * out to 16bpp. 0 if n/a.
+ * @code: V4L2 media bus format code.
+ * @depth: Bits per pixel as delivered from the source.
+ * @csi_dt: CSI data type.
+ * @check_variants: Flag to denote that there are multiple mediabus formats
+ *		still in the list that could match this V4L2 format.
+ */
+struct unicam_fmt {
+	u32	fourcc;
+	u32	repacked_fourcc;
+	u32	code;
+	u8	depth;
+	u8	csi_dt;
+	u8	check_variants;
+};
+
+static const struct unicam_fmt formats[] = {
+	/* YUV Formats */
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+		.check_variants = 1,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+		.check_variants = 1,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+		.check_variants = 1,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+		.check_variants = 1,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth		= 16,
+		.csi_dt		= 0x1e,
+	}, {
+	/* RGB Formats */
+		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.depth		= 16,
+		.csi_dt		= 0x22,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.depth		= 16,
+		.csi_dt		= 0x22
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
+		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
+		.depth		= 16,
+		.csi_dt		= 0x21,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
+		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
+		.depth		= 16,
+		.csi_dt		= 0x21,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
+		.code		= MEDIA_BUS_FMT_RGB888_1X24,
+		.depth		= 24,
+		.csi_dt		= 0x24,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
+		.code		= MEDIA_BUS_FMT_BGR888_1X24,
+		.depth		= 24,
+		.csi_dt		= 0x24,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
+		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
+		.depth		= 32,
+		.csi_dt		= 0x0,
+	}, {
+	/* Bayer Formats */
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth		= 8,
+		.csi_dt		= 0x2a,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth		= 8,
+		.csi_dt		= 0x2a,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth		= 8,
+		.csi_dt		= 0x2a,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth		= 8,
+		.csi_dt		= 0x2a,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR10P,
+		.repacked_fourcc = V4L2_PIX_FMT_SBGGR10,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth		= 10,
+		.csi_dt		= 0x2b,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG10P,
+		.repacked_fourcc = V4L2_PIX_FMT_SGBRG10,
+		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth		= 10,
+		.csi_dt		= 0x2b,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG10P,
+		.repacked_fourcc = V4L2_PIX_FMT_SGRBG10,
+		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth		= 10,
+		.csi_dt		= 0x2b,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB10P,
+		.repacked_fourcc = V4L2_PIX_FMT_SRGGB10,
+		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth		= 10,
+		.csi_dt		= 0x2b,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR12P,
+		.repacked_fourcc = V4L2_PIX_FMT_SBGGR12,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth		= 12,
+		.csi_dt		= 0x2c,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG12P,
+		.repacked_fourcc = V4L2_PIX_FMT_SGBRG12,
+		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth		= 12,
+		.csi_dt		= 0x2c,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG12P,
+		.repacked_fourcc = V4L2_PIX_FMT_SGRBG12,
+		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth		= 12,
+		.csi_dt		= 0x2c,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB12P,
+		.repacked_fourcc = V4L2_PIX_FMT_SRGGB12,
+		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth		= 12,
+		.csi_dt		= 0x2c,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR14P,
+		.code		= MEDIA_BUS_FMT_SBGGR14_1X14,
+		.depth		= 14,
+		.csi_dt		= 0x2d,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG14P,
+		.code		= MEDIA_BUS_FMT_SGBRG14_1X14,
+		.depth		= 14,
+		.csi_dt		= 0x2d,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG14P,
+		.code		= MEDIA_BUS_FMT_SGRBG14_1X14,
+		.depth		= 14,
+		.csi_dt		= 0x2d,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB14P,
+		.code		= MEDIA_BUS_FMT_SRGGB14_1X14,
+		.depth		= 14,
+		.csi_dt		= 0x2d,
+	}, {
+	/*
+	 * 16 bit Bayer formats could be supported, but there is no CSI2
+	 * data_type defined for raw 16, and no sensors that produce it at
+	 * present.
+	 */
+
+	/* Greyscale formats */
+		.fourcc		= V4L2_PIX_FMT_GREY,
+		.code		= MEDIA_BUS_FMT_Y8_1X8,
+		.depth		= 8,
+		.csi_dt		= 0x2a,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_Y10P,
+		.repacked_fourcc = V4L2_PIX_FMT_Y10,
+		.code		= MEDIA_BUS_FMT_Y10_1X10,
+		.depth		= 10,
+		.csi_dt		= 0x2b,
+	}, {
+		/* NB There is no packed V4L2 fourcc for this format. */
+		.repacked_fourcc = V4L2_PIX_FMT_Y12,
+		.code		= MEDIA_BUS_FMT_Y12_1X12,
+		.depth		= 12,
+		.csi_dt		= 0x2c,
+	},
+	/* Embedded data format */
+	{
+		.fourcc		= V4L2_META_FMT_SENSOR_DATA,
+		.code		= MEDIA_BUS_FMT_SENSOR_DATA,
+		.depth		= 8,
+	}
+};
+
+struct unicam_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+};
+
+static inline struct unicam_buffer *to_unicam_buffer(struct vb2_buffer *vb)
+{
+	return container_of(vb, struct unicam_buffer, vb.vb2_buf);
+}
+
+struct unicam_node {
+	bool registered;
+	int open;
+	bool streaming;
+	unsigned int pad_id;
+	/* Pointer pointing to current v4l2_buffer */
+	struct unicam_buffer *cur_frm;
+	/* Pointer pointing to next v4l2_buffer */
+	struct unicam_buffer *next_frm;
+	/* video capture */
+	const struct unicam_fmt *fmt;
+	/* Used to store current pixel format */
+	struct v4l2_format v_fmt;
+	/* Used to store current mbus frame format */
+	struct v4l2_mbus_framefmt m_fmt;
+	/* Buffer queue used in video-buf */
+	struct vb2_queue buffer_queue;
+	/* Queue of filled frames */
+	struct list_head dma_queue;
+	/* IRQ lock for DMA queue */
+	spinlock_t dma_queue_lock;
+	/* lock used to access this structure */
+	struct mutex lock;
+	/* Identifies video device for this channel */
+	struct video_device video_dev;
+	/* Pointer to the parent handle */
+	struct unicam_device *dev;
+	struct media_pad pad;
+	unsigned int embedded_lines;
+	/*
+	 * Dummy buffer intended to be used by unicam
+	 * if we have no other queued buffers to swap to.
+	 */
+	void *dummy_buf_cpu_addr;
+	dma_addr_t dummy_buf_dma_addr;
+};
+
+struct unicam_device {
+	struct kref kref;
+	struct device *dev;
+
+	/* V4l2 specific parameters */
+	struct v4l2_async_subdev asd;
+
+	/* peripheral base address */
+	void __iomem *base;
+	/* clock gating base address */
+	void __iomem *clk_gate_base;
+	/* lp clock handle */
+	struct clk *clock;
+	/* vpu clock handle */
+	struct clk *vpu_clock;
+	/* V4l2 device */
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+
+	/* subdevice async Notifier */
+	struct v4l2_async_notifier notifier;
+	unsigned int sequence;
+
+	/* ptr to  sub device */
+	struct v4l2_subdev *sensor;
+	/* Pad config for the sensor */
+	struct v4l2_subdev_pad_config *sensor_config;
+
+	enum v4l2_mbus_type bus_type;
+	/*
+	 * Stores bus.mipi_csi2.flags for CSI2 sensors, or
+	 * bus.mipi_csi1.strobe for CCP2.
+	 */
+	unsigned int bus_flags;
+	unsigned int max_data_lanes;
+	unsigned int active_data_lanes;
+	bool sensor_embedded_data;
+
+	struct unicam_node node[MAX_NODES];
+	struct v4l2_ctrl_handler ctrl_handler;
+};
+
+static inline struct unicam_device *
+to_unicam_device(struct v4l2_device *v4l2_dev)
+{
+	return container_of(v4l2_dev, struct unicam_device, v4l2_dev);
+}
+
+static char *print_fourcc(u32 fmt)
+{
+	static char code[16];
+
+	code[0] = (unsigned char)(fmt & 0xff);
+	code[1] = (unsigned char)((fmt >> 8) & 0xff);
+	code[2] = (unsigned char)((fmt >> 16) & 0xff);
+	code[3] = (unsigned char)((fmt >> 24) & 0xff);
+	snprintf(&code[4], 12, "=0x%8x", fmt);
+
+	return code;
+}
+
+/* Hardware access */
+static inline void clk_write(struct unicam_device *dev, u32 val)
+{
+	writel(val | 0x5a000000, dev->clk_gate_base);
+}
+
+static inline u32 reg_read(struct unicam_device *dev, u32 offset)
+{
+	return readl(dev->base + offset);
+}
+
+static inline void reg_write(struct unicam_device *dev, u32 offset, u32 val)
+{
+	writel(val, dev->base + offset);
+}
+
+static inline int get_field(u32 value, u32 mask)
+{
+	return (value & mask) >> __ffs(mask);
+}
+
+static inline void set_field(u32 *valp, u32 field, u32 mask)
+{
+	u32 val = *valp;
+
+	val &= ~mask;
+	val |= (field << __ffs(mask)) & mask;
+	*valp = val;
+}
+
+static inline u32 reg_read_field(struct unicam_device *dev, u32 offset,
+				 u32 mask)
+{
+	return get_field(reg_read(dev, offset), mask);
+}
+
+static inline void reg_write_field(struct unicam_device *dev, u32 offset,
+				   u32 field, u32 mask)
+{
+	u32 val = reg_read(dev, offset);
+
+	set_field(&val, field, mask);
+	reg_write(dev, offset, val);
+}
+
+/* Format setup functions */
+static const struct unicam_fmt *find_format_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].code == code)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static int check_mbus_format(struct unicam_device *dev,
+			     const struct unicam_fmt *format)
+{
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; !ret && i < MAX_ENUM_MBUS_CODE; i++) {
+		struct v4l2_subdev_mbus_code_enum mbus_code = {
+			.index = i,
+			.pad = IMAGE_PAD,
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
+
+		ret = v4l2_subdev_call(dev->sensor, pad, enum_mbus_code,
+				       NULL, &mbus_code);
+
+		if (!ret && mbus_code.code == format->code)
+			return 1;
+	}
+
+	return 0;
+}
+
+static const struct unicam_fmt *find_format_by_pix(struct unicam_device *dev,
+						   u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].fourcc == pixelformat ||
+		    formats[i].repacked_fourcc == pixelformat) {
+			if (formats[i].check_variants &&
+			    !check_mbus_format(dev, &formats[i]))
+				continue;
+			return &formats[i];
+		}
+	}
+
+	return NULL;
+}
+
+static unsigned int bytes_per_line(u32 width, const struct unicam_fmt *fmt,
+				   u32 v4l2_fourcc)
+{
+	if (v4l2_fourcc == fmt->repacked_fourcc)
+		/* Repacking always goes to 16bpp */
+		return ALIGN(width << 1, BPL_ALIGNMENT);
+	else
+		return ALIGN((width * fmt->depth) >> 3, BPL_ALIGNMENT);
+}
+
+static int __subdev_get_format(struct unicam_device *dev,
+			       struct v4l2_mbus_framefmt *fmt, int pad_id)
+{
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = pad_id
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(dev->sensor, pad, get_fmt, dev->sensor_config,
+			       &sd_fmt);
+	if (ret < 0)
+		return ret;
+
+	*fmt = sd_fmt.format;
+
+	dev_dbg(dev->dev, "%s %dx%d code:%04x\n", __func__,
+		fmt->width, fmt->height, fmt->code);
+
+	return 0;
+}
+
+static int __subdev_set_format(struct unicam_device *dev,
+			       struct v4l2_mbus_framefmt *fmt, int pad_id)
+{
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = pad_id
+	};
+	int ret;
+
+	sd_fmt.format = *fmt;
+
+	ret = v4l2_subdev_call(dev->sensor, pad, set_fmt, dev->sensor_config,
+			       &sd_fmt);
+	if (ret < 0)
+		return ret;
+
+	*fmt = sd_fmt.format;
+
+	if (pad_id == IMAGE_PAD)
+		dev_dbg(dev->dev, "%s %dx%d code:%04x\n", __func__, fmt->width,
+			fmt->height, fmt->code);
+	else
+		dev_dbg(dev->dev, "%s Embedded data code:%04x\n", __func__,
+			sd_fmt.format.code);
+
+	return 0;
+}
+
+static int unicam_calc_format_size_bpl(struct unicam_device *dev,
+				       const struct unicam_fmt *fmt,
+				       struct v4l2_format *f)
+{
+	unsigned int min_bytesperline;
+
+	v4l_bound_align_image(&f->fmt.pix.width, MIN_WIDTH, MAX_WIDTH, 2,
+			      &f->fmt.pix.height, MIN_HEIGHT, MAX_HEIGHT, 0,
+			      0);
+
+	min_bytesperline = bytes_per_line(f->fmt.pix.width, fmt,
+					  f->fmt.pix.pixelformat);
+
+	if (f->fmt.pix.bytesperline > min_bytesperline &&
+	    f->fmt.pix.bytesperline <= MAX_BYTESPERLINE)
+		f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.bytesperline,
+						BPL_ALIGNMENT);
+	else
+		f->fmt.pix.bytesperline = min_bytesperline;
+
+	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
+
+	dev_dbg(dev->dev, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
+		__func__, print_fourcc(f->fmt.pix.pixelformat),
+		f->fmt.pix.width, f->fmt.pix.height, f->fmt.pix.bytesperline,
+		f->fmt.pix.sizeimage);
+
+	return 0;
+}
+
+static int unicam_reset_format(struct unicam_node *node)
+{
+	struct unicam_device *dev = node->dev;
+	struct v4l2_mbus_framefmt mbus_fmt;
+	int ret;
+
+	if (dev->sensor_embedded_data || node->pad_id != METADATA_PAD) {
+		ret = __subdev_get_format(dev, &mbus_fmt, node->pad_id);
+		if (ret) {
+			dev_err(dev->dev, "Failed to get_format - ret %d\n", ret);
+			return ret;
+		}
+
+		if (mbus_fmt.code != node->fmt->code) {
+			dev_err(dev->dev, "code mismatch - fmt->code %08x, mbus_fmt.code %08x\n",
+				node->fmt->code, mbus_fmt.code);
+			return ret;
+		}
+	}
+
+	if (node->pad_id == IMAGE_PAD) {
+		v4l2_fill_pix_format(&node->v_fmt.fmt.pix, &mbus_fmt);
+		node->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		unicam_calc_format_size_bpl(dev, node->fmt, &node->v_fmt);
+	} else {
+		node->v_fmt.type = V4L2_BUF_TYPE_META_CAPTURE;
+		node->v_fmt.fmt.meta.dataformat = V4L2_META_FMT_SENSOR_DATA;
+		if (dev->sensor_embedded_data) {
+			node->v_fmt.fmt.meta.buffersize =
+					mbus_fmt.width * mbus_fmt.height;
+			node->embedded_lines = mbus_fmt.height;
+		} else {
+			node->v_fmt.fmt.meta.buffersize = UNICAM_EMBEDDED_SIZE;
+			node->embedded_lines = 1;
+		}
+	}
+
+	node->m_fmt = mbus_fmt;
+	return 0;
+}
+
+static void unicam_wr_dma_addr(struct unicam_device *dev, dma_addr_t dmaaddr,
+			       unsigned int buffer_size, int pad_id)
+{
+	dma_addr_t endaddr = dmaaddr + buffer_size;
+
+	if (pad_id == IMAGE_PAD) {
+		reg_write(dev, UNICAM_IBSA0, dmaaddr);
+		reg_write(dev, UNICAM_IBEA0, endaddr);
+	} else {
+		reg_write(dev, UNICAM_DBSA0, dmaaddr);
+		reg_write(dev, UNICAM_DBEA0, endaddr);
+	}
+}
+
+static unsigned int unicam_get_lines_done(struct unicam_device *dev)
+{
+	dma_addr_t start_addr, cur_addr;
+	unsigned int stride = dev->node[IMAGE_PAD].v_fmt.fmt.pix.bytesperline;
+	struct unicam_buffer *frm = dev->node[IMAGE_PAD].cur_frm;
+
+	if (!frm)
+		return 0;
+
+	start_addr = vb2_dma_contig_plane_dma_addr(&frm->vb.vb2_buf, 0);
+	cur_addr = reg_read(dev, UNICAM_IBWP);
+	return (unsigned int)(cur_addr - start_addr) / stride;
+}
+
+static void unicam_schedule_next_buffer(struct unicam_node *node)
+{
+	struct unicam_device *dev = node->dev;
+	struct unicam_buffer *buf;
+	unsigned int size;
+	dma_addr_t addr;
+
+	buf = list_first_entry(&node->dma_queue, struct unicam_buffer, list);
+	node->next_frm = buf;
+	list_del(&buf->list);
+
+	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	size = (node->pad_id == IMAGE_PAD) ?
+			node->v_fmt.fmt.pix.sizeimage :
+			node->v_fmt.fmt.meta.buffersize;
+
+	unicam_wr_dma_addr(dev, addr, size, node->pad_id);
+}
+
+static void unicam_schedule_dummy_buffer(struct unicam_node *node)
+{
+	struct unicam_device *dev = node->dev;
+
+	dev_dbg(dev->dev, "Scheduling dummy buffer for node %d\n",
+		node->pad_id);
+
+	unicam_wr_dma_addr(dev, node->dummy_buf_dma_addr, DUMMY_BUF_SIZE,
+			   node->pad_id);
+	node->next_frm = NULL;
+}
+
+static void unicam_process_buffer_complete(struct unicam_node *node,
+					   unsigned int sequence)
+{
+	node->cur_frm->vb.field = node->m_fmt.field;
+	node->cur_frm->vb.sequence = sequence;
+
+	vb2_buffer_done(&node->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static void unicam_queue_event_sof(struct unicam_device *unicam)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.u.frame_sync.frame_sequence = unicam->sequence,
+	};
+
+	v4l2_event_queue(&unicam->node[IMAGE_PAD].video_dev, &event);
+}
+
+/*
+ * unicam_isr : ISR handler for unicam capture
+ * @irq: irq number
+ * @dev_id: dev_id ptr
+ *
+ * It changes status of the captured buffer, takes next buffer from the queue
+ * and sets its address in unicam registers
+ */
+static irqreturn_t unicam_isr(int irq, void *dev)
+{
+	struct unicam_device *unicam = dev;
+	unsigned int lines_done = unicam_get_lines_done(dev);
+	unsigned int sequence = unicam->sequence;
+	unsigned int i;
+	u32 ista, sta;
+	u64 ts;
+
+	sta = reg_read(unicam, UNICAM_STA);
+	/* Write value back to clear the interrupts */
+	reg_write(unicam, UNICAM_STA, sta);
+
+	ista = reg_read(unicam, UNICAM_ISTA);
+	/* Write value back to clear the interrupts */
+	reg_write(unicam, UNICAM_ISTA, ista);
+
+	dev_dbg(unicam->dev,
+		"ISR: ISTA: 0x%X, STA: 0x%X, sequence %d, lines done %d",
+		ista, sta, sequence, lines_done);
+
+	if (!(sta & (UNICAM_IS | UNICAM_PI0)))
+		return IRQ_HANDLED;
+
+	/*
+	 * We must run the frame end handler first. If we have a valid next_frm
+	 * and we get a simultaneout FE + FS interrupt, running the FS handler
+	 * first would null out the next_frm ptr and we would have lost the
+	 * buffer forever.
+	 */
+	if (ista & UNICAM_FEI || sta & UNICAM_PI0) {
+		/*
+		 * Ensure we have swapped buffers already as we can't
+		 * stop the peripheral. If no buffer is available, use a
+		 * dummy buffer to dump out frames until we get a new buffer
+		 * to use.
+		 */
+		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+			if (!unicam->node[i].streaming)
+				continue;
+
+			if (unicam->node[i].cur_frm)
+				unicam_process_buffer_complete(&unicam->node[i],
+							       sequence);
+			unicam->node[i].cur_frm = unicam->node[i].next_frm;
+		}
+		unicam->sequence++;
+	}
+
+	if (ista & UNICAM_FSI) {
+		/*
+		 * Timestamp is to be when the first data byte was captured,
+		 * aka frame start.
+		 */
+		ts = ktime_get_ns();
+		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+			if (!unicam->node[i].streaming)
+				continue;
+
+			if (unicam->node[i].cur_frm)
+				unicam->node[i].cur_frm->vb.vb2_buf.timestamp =
+								ts;
+			/*
+			 * Set the next frame output to go to a dummy frame
+			 * if we have not managed to obtain another frame
+			 * from the queue.
+			 */
+			unicam_schedule_dummy_buffer(&unicam->node[i]);
+		}
+
+		unicam_queue_event_sof(unicam);
+	}
+
+	/*
+	 * Cannot swap buffer at frame end, there may be a race condition
+	 * where the HW does not actually swap it if the new frame has
+	 * already started.
+	 */
+	if (ista & (UNICAM_FSI | UNICAM_LCI) && !(ista & UNICAM_FEI)) {
+		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+			if (!unicam->node[i].streaming)
+				continue;
+
+			spin_lock(&unicam->node[i].dma_queue_lock);
+			if (!list_empty(&unicam->node[i].dma_queue) &&
+			    !unicam->node[i].next_frm)
+				unicam_schedule_next_buffer(&unicam->node[i]);
+			spin_unlock(&unicam->node[i].dma_queue_lock);
+		}
+	}
+
+	if (reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
+		/* Switch out of trigger mode if selected */
+		reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
+		reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
+	}
+	return IRQ_HANDLED;
+}
+
+static int unicam_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
+
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", dev_name(dev->dev));
+
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_VIDEO_CAPTURE |
+			    V4L2_CAP_META_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_STREAMING;
+	return 0;
+}
+
+static int unicam_enum_fmt_vid_cap(struct file *file, void  *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	unsigned int index = 0;
+	unsigned int i;
+	int ret = 0;
+
+	if (node->pad_id != IMAGE_PAD)
+		return -EINVAL;
+
+	for (i = 0; !ret && i < MAX_ENUM_MBUS_CODE; i++) {
+		struct v4l2_subdev_mbus_code_enum mbus_code = {
+			.index = i,
+			.pad = IMAGE_PAD,
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
+		const struct unicam_fmt *fmt;
+
+		ret = v4l2_subdev_call(dev->sensor, pad, enum_mbus_code,
+				       NULL, &mbus_code);
+		if (ret < 0) {
+			dev_dbg(dev->dev,
+				"subdev->enum_mbus_code idx %d = %d\n",
+				i, ret);
+			return -EINVAL;
+		}
+
+		fmt = find_format_by_code(mbus_code.code);
+		if (fmt) {
+			if (fmt->fourcc) {
+				if (index == f->index) {
+					f->pixelformat = fmt->fourcc;
+					break;
+				}
+				index++;
+			}
+			if (fmt->repacked_fourcc) {
+				if (index == f->index) {
+					f->pixelformat = fmt->repacked_fourcc;
+					break;
+				}
+				index++;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int unicam_g_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct v4l2_mbus_framefmt mbus_fmt = {0};
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	const struct unicam_fmt *fmt = NULL;
+	int ret;
+
+	if (node->pad_id != IMAGE_PAD)
+		return -EINVAL;
+
+	/*
+	 * If a flip has occurred in the sensor, the fmt code might have
+	 * changed. So we will need to re-fetch the format from the subdevice.
+	 */
+	ret = __subdev_get_format(dev, &mbus_fmt, node->pad_id);
+	if (ret)
+		return -EINVAL;
+
+	/* Find the V4L2 format from mbus code. We must match a known format. */
+	fmt = find_format_by_code(mbus_fmt.code);
+	if (!fmt)
+		return -EINVAL;
+
+	if (node->fmt != fmt) {
+		/*
+		 * The sensor format has changed so the pixelformat needs to
+		 * be updated. Try and retain the packed/unpacked choice if
+		 * at all possible.
+		 */
+		if (node->fmt->repacked_fourcc ==
+						node->v_fmt.fmt.pix.pixelformat)
+			/* Using the repacked format */
+			node->v_fmt.fmt.pix.pixelformat = fmt->repacked_fourcc;
+		else
+			/* Using the native format */
+			node->v_fmt.fmt.pix.pixelformat = fmt->fourcc;
+
+		node->fmt = fmt;
+	}
+
+	*f = node->v_fmt;
+
+	return 0;
+}
+
+static const struct unicam_fmt *
+get_first_supported_format(struct unicam_device *dev)
+{
+	struct v4l2_subdev_mbus_code_enum mbus_code;
+	const struct unicam_fmt *fmt = NULL;
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; ret != -EINVAL && ret != -ENOIOCTLCMD; ++i) {
+		memset(&mbus_code, 0, sizeof(mbus_code));
+		mbus_code.index = i;
+		mbus_code.pad = IMAGE_PAD;
+		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
+		ret = v4l2_subdev_call(dev->sensor, pad, enum_mbus_code, NULL,
+				       &mbus_code);
+		if (ret < 0) {
+			dev_dbg(dev->dev,
+				"subdev->enum_mbus_code idx %u = %d - continue\n",
+				i, ret);
+			continue;
+		}
+
+		dev_dbg(dev->dev, "subdev %s: code: 0x%08x idx: %u\n",
+			dev->sensor->name, mbus_code.code, i);
+
+		fmt = find_format_by_code(mbus_code.code);
+		dev_dbg(dev->dev,
+			"fmt 0x%08x returned as %p, V4L2 FOURCC %s, csi_dt 0x%02x\n",
+			mbus_code.code, fmt,
+			print_fourcc(fmt ? fmt->fourcc : 0),
+			fmt ? fmt->csi_dt : 0);
+		if (fmt)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static int unicam_try_fmt_vid_cap(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = IMAGE_PAD
+	};
+	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	const struct unicam_fmt *fmt;
+	int ret;
+
+	if (node->pad_id != IMAGE_PAD)
+		return -EINVAL;
+
+	fmt = find_format_by_pix(dev, f->fmt.pix.pixelformat);
+	if (!fmt) {
+		/*
+		 * Pixel format not supported by unicam. Choose the first
+		 * supported format, and let the sensor choose something else.
+		 */
+		dev_dbg(dev->dev, "Fourcc %s not found. Use first one.\n",
+			print_fourcc(f->fmt.pix.pixelformat));
+
+		fmt = &formats[0];
+		f->fmt.pix.pixelformat = fmt->fourcc;
+	}
+
+	v4l2_fill_mbus_format(mbus_fmt, &f->fmt.pix, fmt->code);
+	/*
+	 * No support for receiving interlaced video, so never
+	 * request it from the sensor subdev.
+	 */
+	mbus_fmt->field = V4L2_FIELD_NONE;
+
+	ret = v4l2_subdev_call(dev->sensor, pad, set_fmt, dev->sensor_config,
+			       &sd_fmt);
+	if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV)
+		return ret;
+
+	if (mbus_fmt->field != V4L2_FIELD_NONE)
+		dev_info(dev->dev,
+			 "Sensor trying to send interlaced video - results may be unpredictable\n");
+
+	v4l2_fill_pix_format(&f->fmt.pix, &sd_fmt.format);
+	if (mbus_fmt->code != fmt->code) {
+		/* Sensor has returned an alternate format */
+		fmt = find_format_by_code(mbus_fmt->code);
+		if (!fmt) {
+			/*
+			 * The alternate format is one unicam can't support.
+			 * Find the first format that is supported by both, and
+			 * then set that.
+			 */
+			fmt = get_first_supported_format(dev);
+			mbus_fmt->code = fmt->code;
+
+			ret = v4l2_subdev_call(dev->sensor, pad, set_fmt,
+					       dev->sensor_config, &sd_fmt);
+			if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV)
+				return ret;
+
+			if (mbus_fmt->field != V4L2_FIELD_NONE)
+				dev_info(dev->dev,
+					 "Sensor trying to send interlaced video - results may be unpredictable\n");
+
+			v4l2_fill_pix_format(&f->fmt.pix, &sd_fmt.format);
+
+			if (mbus_fmt->code != fmt->code) {
+				/*
+				 * We've set a format that the sensor reports
+				 * as being supported, but it refuses to set it.
+				 * Not much else we can do.
+				 * Assume that the sensor driver may accept the
+				 * format when it is set (rather than tried).
+				 */
+				dev_err(dev->dev,
+					"Sensor won't accept default format, and Unicam can't support sensor default\n");
+			}
+		}
+
+		if (fmt->fourcc)
+			f->fmt.pix.pixelformat = fmt->fourcc;
+		else
+			f->fmt.pix.pixelformat = fmt->repacked_fourcc;
+	}
+
+	return unicam_calc_format_size_bpl(dev, fmt, f);
+}
+
+static int unicam_s_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	struct vb2_queue *q = &node->buffer_queue;
+	struct v4l2_mbus_framefmt mbus_fmt = {0};
+	const struct unicam_fmt *fmt;
+	int ret;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	ret = unicam_try_fmt_vid_cap(file, priv, f);
+	if (ret < 0)
+		return ret;
+
+	fmt = find_format_by_pix(dev, f->fmt.pix.pixelformat);
+	if (!fmt) {
+		/*
+		 * Unknown pixel format - adopt a default.
+		 * This shouldn't happen as try_fmt should have resolved any
+		 * issues first.
+		 */
+		fmt = get_first_supported_format(dev);
+		if (!fmt)
+			/*
+			 * It shouldn't be possible to get here with no
+			 * supported formats
+			 */
+			return -EINVAL;
+		f->fmt.pix.pixelformat = fmt->fourcc;
+		return -EINVAL;
+	}
+
+	v4l2_fill_mbus_format(&mbus_fmt, &f->fmt.pix, fmt->code);
+
+	ret = __subdev_set_format(dev, &mbus_fmt, node->pad_id);
+	if (ret) {
+		dev_err(dev->dev, "%s set_format failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	/* Just double check nothing has gone wrong */
+	if (mbus_fmt.code != fmt->code) {
+		dev_dbg(dev->dev,
+			"%s subdev changed format, this should not happen\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	node->fmt = fmt;
+	node->v_fmt.fmt.pix.pixelformat = f->fmt.pix.pixelformat;
+	node->v_fmt.fmt.pix.bytesperline = f->fmt.pix.bytesperline;
+	unicam_reset_format(node);
+
+	dev_dbg(dev->dev,
+		"%s %dx%d, mbus_fmt 0x%08X, V4L2 pix %s.\n",
+		__func__, node->v_fmt.fmt.pix.width,
+		node->v_fmt.fmt.pix.height, mbus_fmt.code,
+		print_fourcc(node->v_fmt.fmt.pix.pixelformat));
+
+	*f = node->v_fmt;
+
+	return 0;
+}
+
+static int unicam_enum_fmt_meta_cap(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	const struct unicam_fmt *fmt;
+	u32 code;
+	int ret = 0;
+
+	if (node->pad_id != METADATA_PAD || f->index != 0)
+		return -EINVAL;
+
+	if (dev->sensor_embedded_data) {
+		struct v4l2_subdev_mbus_code_enum mbus_code = {
+			.index = f->index,
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+			.pad = METADATA_PAD,
+		};
+
+		ret = v4l2_subdev_call(dev->sensor, pad, enum_mbus_code, NULL,
+				       &mbus_code);
+		if (ret < 0) {
+			dev_err(dev->dev,
+				"subdev->enum_mbus_code idx 0 = %d - invalid\n",
+				ret);
+			return -EINVAL;
+		}
+
+		code = mbus_code.code;
+	} else {
+		code = MEDIA_BUS_FMT_SENSOR_DATA;
+	}
+
+	fmt = find_format_by_code(code);
+	if (fmt)
+		f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int unicam_g_fmt_meta_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	if (node->pad_id != METADATA_PAD)
+		return -EINVAL;
+
+	*f = node->v_fmt;
+
+	return 0;
+}
+
+static int unicam_queue_setup(struct vb2_queue *vq,
+			      unsigned int *nbuffers,
+			      unsigned int *nplanes,
+			      unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct unicam_node *node = vb2_get_drv_priv(vq);
+	struct unicam_device *dev = node->dev;
+	unsigned int size = node->pad_id == IMAGE_PAD ?
+				    node->v_fmt.fmt.pix.sizeimage :
+				    node->v_fmt.fmt.meta.buffersize;
+
+	if (vq->num_buffers + *nbuffers < 3)
+		*nbuffers = 3 - vq->num_buffers;
+
+	if (*nplanes) {
+		if (sizes[0] < size) {
+			dev_err(dev->dev, "sizes[0] %i < size %u\n", sizes[0],
+				size);
+			return -EINVAL;
+		}
+		size = sizes[0];
+	}
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	return 0;
+}
+
+static int unicam_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct unicam_device *dev = node->dev;
+	struct unicam_buffer *buf = to_unicam_buffer(vb);
+	unsigned long size;
+
+	if (WARN_ON(!node->fmt))
+		return -EINVAL;
+
+	size = node->pad_id == IMAGE_PAD ? node->v_fmt.fmt.pix.sizeimage :
+					   node->v_fmt.fmt.meta.buffersize;
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(dev->dev, "data will not fit into plane (%lu < %lu)\n",
+			vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
+	return 0;
+}
+
+static void unicam_buffer_queue(struct vb2_buffer *vb)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct unicam_buffer *buf = to_unicam_buffer(vb);
+	unsigned long flags;
+
+	spin_lock_irqsave(&node->dma_queue_lock, flags);
+	list_add_tail(&buf->list, &node->dma_queue);
+	spin_unlock_irqrestore(&node->dma_queue_lock, flags);
+}
+
+static void unicam_set_packing_config(struct unicam_device *dev)
+{
+	u32 pack, unpack;
+	u32 val;
+
+	if (dev->node[IMAGE_PAD].v_fmt.fmt.pix.pixelformat ==
+	    dev->node[IMAGE_PAD].fmt->fourcc) {
+		unpack = UNICAM_PUM_NONE;
+		pack = UNICAM_PPM_NONE;
+	} else {
+		switch (dev->node[IMAGE_PAD].fmt->depth) {
+		case 8:
+			unpack = UNICAM_PUM_UNPACK8;
+			break;
+		case 10:
+			unpack = UNICAM_PUM_UNPACK10;
+			break;
+		case 12:
+			unpack = UNICAM_PUM_UNPACK12;
+			break;
+		case 14:
+			unpack = UNICAM_PUM_UNPACK14;
+			break;
+		case 16:
+			unpack = UNICAM_PUM_UNPACK16;
+			break;
+		default:
+			unpack = UNICAM_PUM_NONE;
+			break;
+		}
+
+		/* Repacking is always to 16bpp */
+		pack = UNICAM_PPM_PACK16;
+	}
+
+	val = 0;
+	set_field(&val, unpack, UNICAM_PUM_MASK);
+	set_field(&val, pack, UNICAM_PPM_MASK);
+	reg_write(dev, UNICAM_IPIPE, val);
+}
+
+static void unicam_cfg_image_id(struct unicam_device *dev)
+{
+	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		/* CSI2 mode, hardcode VC 0 for now. */
+		reg_write(dev, UNICAM_IDI0,
+			  (0 << 6) | dev->node[IMAGE_PAD].fmt->csi_dt);
+	} else {
+		/* CCP2 mode */
+		reg_write(dev, UNICAM_IDI0,
+			  0x80 | dev->node[IMAGE_PAD].fmt->csi_dt);
+	}
+}
+
+static void unicam_enable_ed(struct unicam_device *dev)
+{
+	u32 val = reg_read(dev, UNICAM_DCS);
+
+	set_field(&val, 2, UNICAM_EDL_MASK);
+	/* Do not wrap at the end of the embedded data buffer */
+	set_field(&val, 0, UNICAM_DBOB);
+
+	reg_write(dev, UNICAM_DCS, val);
+}
+
+static void unicam_start_rx(struct unicam_device *dev, dma_addr_t *addr)
+{
+	int line_int_freq = dev->node[IMAGE_PAD].v_fmt.fmt.pix.height >> 2;
+	unsigned int size, i;
+	u32 val;
+
+	if (line_int_freq < 128)
+		line_int_freq = 128;
+
+	/* Enable lane clocks */
+	val = 1;
+	for (i = 0; i < dev->active_data_lanes; i++)
+		val = val << 2 | 1;
+	clk_write(dev, val);
+
+	/* Basic init */
+	reg_write(dev, UNICAM_CTRL, UNICAM_MEM);
+
+	/* Enable analogue control, and leave in reset. */
+	val = UNICAM_AR;
+	set_field(&val, 7, UNICAM_CTATADJ_MASK);
+	set_field(&val, 7, UNICAM_PTATADJ_MASK);
+	reg_write(dev, UNICAM_ANA, val);
+	usleep_range(1000, 2000);
+
+	/* Come out of reset */
+	reg_write_field(dev, UNICAM_ANA, 0, UNICAM_AR);
+
+	/* Peripheral reset */
+	reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_CPR);
+	reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPR);
+
+	reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPE);
+
+	/* Enable Rx control. */
+	val = reg_read(dev, UNICAM_CTRL);
+	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		set_field(&val, UNICAM_CPM_CSI2, UNICAM_CPM_MASK);
+		set_field(&val, UNICAM_DCM_STROBE, UNICAM_DCM_MASK);
+	} else {
+		set_field(&val, UNICAM_CPM_CCP2, UNICAM_CPM_MASK);
+		set_field(&val, dev->bus_flags, UNICAM_DCM_MASK);
+	}
+	/* Packet framer timeout */
+	set_field(&val, 0xf, UNICAM_PFT_MASK);
+	set_field(&val, 128, UNICAM_OET_MASK);
+	reg_write(dev, UNICAM_CTRL, val);
+
+	reg_write(dev, UNICAM_IHWIN, 0);
+	reg_write(dev, UNICAM_IVWIN, 0);
+
+	/* AXI bus access QoS setup */
+	val = reg_read(dev, UNICAM_PRI);
+	set_field(&val, 0, UNICAM_BL_MASK);
+	set_field(&val, 0, UNICAM_BS_MASK);
+	set_field(&val, 0xe, UNICAM_PP_MASK);
+	set_field(&val, 8, UNICAM_NP_MASK);
+	set_field(&val, 2, UNICAM_PT_MASK);
+	set_field(&val, 1, UNICAM_PE);
+	reg_write(dev, UNICAM_PRI, val);
+
+	reg_write_field(dev, UNICAM_ANA, 0, UNICAM_DDL);
+
+	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
+	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
+	set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
+	reg_write(dev, UNICAM_ICTL, val);
+	reg_write(dev, UNICAM_STA, UNICAM_STA_MASK_ALL);
+	reg_write(dev, UNICAM_ISTA, UNICAM_ISTA_MASK_ALL);
+
+	/* tclk_term_en */
+	reg_write_field(dev, UNICAM_CLT, 2, UNICAM_CLT1_MASK);
+	/* tclk_settle */
+	reg_write_field(dev, UNICAM_CLT, 6, UNICAM_CLT2_MASK);
+	/* td_term_en */
+	reg_write_field(dev, UNICAM_DLT, 2, UNICAM_DLT1_MASK);
+	/* ths_settle */
+	reg_write_field(dev, UNICAM_DLT, 6, UNICAM_DLT2_MASK);
+	/* trx_enable */
+	reg_write_field(dev, UNICAM_DLT, 0, UNICAM_DLT3_MASK);
+
+	reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_SOE);
+
+	/* Packet compare setup - required to avoid missing frame ends */
+	val = 0;
+	set_field(&val, 1, UNICAM_PCE);
+	set_field(&val, 1, UNICAM_GI);
+	set_field(&val, 1, UNICAM_CPH);
+	set_field(&val, 0, UNICAM_PCVC_MASK);
+	set_field(&val, 1, UNICAM_PCDT_MASK);
+	reg_write(dev, UNICAM_CMP0, val);
+
+	/* Enable clock lane and set up terminations */
+	val = 0;
+	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		/* CSI2 */
+		set_field(&val, 1, UNICAM_CLE);
+		set_field(&val, 1, UNICAM_CLLPE);
+		if (dev->bus_flags & V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) {
+			set_field(&val, 1, UNICAM_CLTRE);
+			set_field(&val, 1, UNICAM_CLHSE);
+		}
+	} else {
+		/* CCP2 */
+		set_field(&val, 1, UNICAM_CLE);
+		set_field(&val, 1, UNICAM_CLHSE);
+		set_field(&val, 1, UNICAM_CLTRE);
+	}
+	reg_write(dev, UNICAM_CLK, val);
+
+	/*
+	 * Enable required data lanes with appropriate terminations.
+	 * The same value needs to be written to UNICAM_DATn registers for
+	 * the active lanes, and 0 for inactive ones.
+	 */
+	val = 0;
+	if (dev->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		/* CSI2 */
+		set_field(&val, 1, UNICAM_DLE);
+		set_field(&val, 1, UNICAM_DLLPE);
+		if (dev->bus_flags & V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) {
+			set_field(&val, 1, UNICAM_DLTRE);
+			set_field(&val, 1, UNICAM_DLHSE);
+		}
+	} else {
+		/* CCP2 */
+		set_field(&val, 1, UNICAM_DLE);
+		set_field(&val, 1, UNICAM_DLHSE);
+		set_field(&val, 1, UNICAM_DLTRE);
+	}
+	reg_write(dev, UNICAM_DAT0, val);
+
+	if (dev->active_data_lanes == 1)
+		val = 0;
+	reg_write(dev, UNICAM_DAT1, val);
+
+	if (dev->max_data_lanes > 2) {
+		/*
+		 * Registers UNICAM_DAT2 and UNICAM_DAT3 only valid if the
+		 * instance supports more than 2 data lanes.
+		 */
+		if (dev->active_data_lanes == 2)
+			val = 0;
+		reg_write(dev, UNICAM_DAT2, val);
+
+		if (dev->active_data_lanes == 3)
+			val = 0;
+		reg_write(dev, UNICAM_DAT3, val);
+	}
+
+	reg_write(dev, UNICAM_IBLS,
+		  dev->node[IMAGE_PAD].v_fmt.fmt.pix.bytesperline);
+	size = dev->node[IMAGE_PAD].v_fmt.fmt.pix.sizeimage;
+	unicam_wr_dma_addr(dev, addr[IMAGE_PAD], size, IMAGE_PAD);
+	unicam_set_packing_config(dev);
+	unicam_cfg_image_id(dev);
+
+	val = reg_read(dev, UNICAM_MISC);
+	set_field(&val, 1, UNICAM_FL0);
+	set_field(&val, 1, UNICAM_FL1);
+	reg_write(dev, UNICAM_MISC, val);
+
+	if (dev->node[METADATA_PAD].streaming && dev->sensor_embedded_data) {
+		size = dev->node[METADATA_PAD].v_fmt.fmt.meta.buffersize;
+		unicam_enable_ed(dev);
+		unicam_wr_dma_addr(dev, addr[METADATA_PAD], size, METADATA_PAD);
+	}
+
+	/* Enable peripheral */
+	reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_CPE);
+
+	/* Load image pointers */
+	reg_write_field(dev, UNICAM_ICTL, 1, UNICAM_LIP_MASK);
+
+	/* Load embedded data buffer pointers if needed */
+	if (dev->node[METADATA_PAD].streaming && dev->sensor_embedded_data)
+		reg_write_field(dev, UNICAM_DCS, 1, UNICAM_LDP);
+
+	/*
+	 * Enable trigger only for the first frame to
+	 * sync correctly to the FS from the source.
+	 */
+	reg_write_field(dev, UNICAM_ICTL, 1, UNICAM_TFC);
+}
+
+static void unicam_disable(struct unicam_device *dev)
+{
+	/* Analogue lane control disable */
+	reg_write_field(dev, UNICAM_ANA, 1, UNICAM_DDL);
+
+	/* Stop the output engine */
+	reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_SOE);
+
+	/* Disable the data lanes. */
+	reg_write(dev, UNICAM_DAT0, 0);
+	reg_write(dev, UNICAM_DAT1, 0);
+
+	if (dev->max_data_lanes > 2) {
+		reg_write(dev, UNICAM_DAT2, 0);
+		reg_write(dev, UNICAM_DAT3, 0);
+	}
+
+	/* Peripheral reset */
+	reg_write_field(dev, UNICAM_CTRL, 1, UNICAM_CPR);
+	usleep_range(50, 100);
+	reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPR);
+
+	/* Disable peripheral */
+	reg_write_field(dev, UNICAM_CTRL, 0, UNICAM_CPE);
+
+	/* Clear ED setup */
+	reg_write(dev, UNICAM_DCS, 0);
+
+	/* Disable all lane clocks */
+	clk_write(dev, 0);
+}
+
+static void unicam_return_buffers(struct unicam_node *node,
+				  enum vb2_buffer_state state)
+{
+	struct unicam_buffer *buf, *tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&node->dma_queue_lock, flags);
+	list_for_each_entry_safe(buf, tmp, &node->dma_queue, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	if (node->cur_frm)
+		vb2_buffer_done(&node->cur_frm->vb.vb2_buf,
+				state);
+	if (node->next_frm && node->cur_frm != node->next_frm)
+		vb2_buffer_done(&node->next_frm->vb.vb2_buf,
+				state);
+
+	node->cur_frm = NULL;
+	node->next_frm = NULL;
+	spin_unlock_irqrestore(&node->dma_queue_lock, flags);
+}
+
+static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vq);
+	struct unicam_device *dev = node->dev;
+	dma_addr_t buffer_addr[MAX_NODES] = { 0 };
+	unsigned long flags;
+	unsigned int i;
+	int ret;
+
+	node->streaming = true;
+	if (!(dev->node[IMAGE_PAD].open && dev->node[IMAGE_PAD].streaming &&
+	      (!dev->node[METADATA_PAD].open ||
+	       dev->node[METADATA_PAD].streaming))) {
+		/*
+		 * Metadata pad must be enabled before image pad if it is
+		 * wanted.
+		 */
+		dev_dbg(dev->dev, "Not all nodes are streaming yet.");
+		return 0;
+	}
+
+	dev->sequence = 0;
+	ret = pm_runtime_get_sync(dev->dev);
+	if (ret < 0) {
+		dev_err(dev->dev, "pm_runtime_get failed\n");
+		goto err_streaming;
+	}
+
+	/*
+	 * TODO: Retrieve the number of active data lanes from the connected
+	 * subdevice.
+	 */
+	dev->active_data_lanes = dev->max_data_lanes;
+
+	ret = clk_set_min_rate(dev->vpu_clock, MIN_VPU_CLOCK_RATE);
+	if (ret) {
+		dev_err(dev->dev, "failed to set up VPU clock\n");
+		goto err_pm_put;
+	}
+
+	ret = clk_prepare_enable(dev->vpu_clock);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable VPU clock: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	ret = clk_set_rate(dev->clock, 100 * 1000 * 1000);
+	if (ret) {
+		dev_err(dev->dev, "failed to set up CSI clock\n");
+		goto err_vpu_clock;
+	}
+
+	ret = clk_prepare_enable(dev->clock);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable CSI clock: %d\n", ret);
+		goto err_vpu_clock;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dev->node); i++) {
+		struct unicam_buffer *buf;
+
+		if (!dev->node[i].streaming)
+			continue;
+
+		spin_lock_irqsave(&dev->node[i].dma_queue_lock, flags);
+		buf = list_first_entry(&dev->node[i].dma_queue,
+				       struct unicam_buffer, list);
+		dev->node[i].cur_frm = buf;
+		dev->node[i].next_frm = buf;
+		list_del(&buf->list);
+		spin_unlock_irqrestore(&dev->node[i].dma_queue_lock, flags);
+
+		buffer_addr[i] =
+			vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	}
+
+	unicam_start_rx(dev, buffer_addr);
+
+	ret = v4l2_subdev_call(dev->sensor, video, s_stream, 1);
+	if (ret < 0) {
+		dev_err(dev->dev, "stream on failed in subdev\n");
+		goto err_disable_unicam;
+	}
+
+	return 0;
+
+err_disable_unicam:
+	unicam_disable(dev);
+	clk_disable_unprepare(dev->clock);
+err_vpu_clock:
+	ret = clk_set_min_rate(dev->vpu_clock, 0);
+	if (ret)
+		dev_err(dev->dev, "failed to reset the VPU clock\n");
+	clk_disable_unprepare(dev->vpu_clock);
+err_pm_put:
+	pm_runtime_put_sync(dev->dev);
+err_streaming:
+	unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
+	node->streaming = false;
+
+	return ret;
+}
+
+static void unicam_stop_streaming(struct vb2_queue *vq)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vq);
+	struct unicam_device *dev = node->dev;
+
+	node->streaming = false;
+
+	if (node->pad_id == IMAGE_PAD) {
+		int ret;
+
+		/*
+		 * Stop streaming the sensor and disable the peripheral.
+		 * We cannot continue streaming embedded data with the
+		 * image pad disabled.
+		 */
+		if (v4l2_subdev_call(dev->sensor, video, s_stream, 0) < 0)
+			dev_err(dev->dev, "stream off failed in subdev\n");
+
+		unicam_disable(dev);
+
+		ret = clk_set_min_rate(dev->vpu_clock, 0);
+		if (ret)
+			dev_err(dev->dev, "failed to reset the min VPU clock\n");
+
+		clk_disable_unprepare(dev->vpu_clock);
+		clk_disable_unprepare(dev->clock);
+		pm_runtime_put_sync(dev->dev);
+
+	} else if (node->pad_id == METADATA_PAD) {
+		/*
+		 * Allow the hardware to spin in the dummy buffer.
+		 * This is only really needed if the embedded data pad is
+		 * disabled before the image pad.
+		 */
+		unicam_wr_dma_addr(dev, node->dummy_buf_dma_addr,
+				   DUMMY_BUF_SIZE, METADATA_PAD);
+	}
+
+	/* Clear all queued buffers for the node */
+	unicam_return_buffers(node, VB2_BUF_STATE_ERROR);
+}
+
+static int unicam_enum_input(struct file *file, void *priv,
+			     struct v4l2_input *inp)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	if (inp->index != 0)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	if (v4l2_subdev_has_op(dev->sensor, video, s_dv_timings)) {
+		inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+		inp->std = 0;
+	} else if (v4l2_subdev_has_op(dev->sensor, video, s_std)) {
+		inp->capabilities = V4L2_IN_CAP_STD;
+		if (v4l2_subdev_call(dev->sensor, video, g_tvnorms, &inp->std) < 0)
+			inp->std = V4L2_STD_ALL;
+	} else {
+		inp->capabilities = 0;
+		inp->std = 0;
+	}
+	strscpy(inp->name, "Camera 0", sizeof(inp->name));
+	return 0;
+}
+
+static int unicam_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+
+	return 0;
+}
+
+static int unicam_s_input(struct file *file, void *priv, unsigned int i)
+{
+	/*
+	 * FIXME: Ideally we would like to be able to query the source
+	 * subdevice for information over the input connectors it supports,
+	 * and map that through in to a call to video_ops->s_routing.
+	 * There is no infrastructure support for defining that within
+	 * devicetree at present. Until that is implemented we can't
+	 * map a user physical connector number to s_routing input number.
+	 */
+	if (i > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int unicam_querystd(struct file *file, void *priv,
+			   v4l2_std_id *std)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, video, querystd, std);
+}
+
+static int unicam_g_std(struct file *file, void *priv, v4l2_std_id *std)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, video, g_std, std);
+}
+
+static int unicam_s_std(struct file *file, void *priv, v4l2_std_id std)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	int ret;
+	v4l2_std_id current_std;
+
+	ret = v4l2_subdev_call(dev->sensor, video, g_std, &current_std);
+	if (ret)
+		return ret;
+
+	if (std == current_std)
+		return 0;
+
+	if (vb2_is_busy(&node->buffer_queue))
+		return -EBUSY;
+
+	ret = v4l2_subdev_call(dev->sensor, video, s_std, std);
+
+	/* Force recomputation of bytesperline */
+	node->v_fmt.fmt.pix.bytesperline = 0;
+
+	unicam_reset_format(node);
+
+	return ret;
+}
+
+static int unicam_s_edid(struct file *file, void *priv, struct v4l2_edid *edid)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, pad, set_edid, edid);
+}
+
+static int unicam_g_edid(struct file *file, void *priv, struct v4l2_edid *edid)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, pad, get_edid, edid);
+}
+
+static int unicam_s_selection(struct file *file, void *priv,
+			      struct v4l2_selection *sel)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = sel->target,
+		.flags = sel->flags,
+		.r = sel->r,
+	};
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	return v4l2_subdev_call(dev->sensor, pad, set_selection, NULL, &sdsel);
+}
+
+static int unicam_g_selection(struct file *file, void *priv,
+			      struct v4l2_selection *sel)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = sel->target,
+	};
+	int ret;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(dev->sensor, pad, get_selection, NULL, &sdsel);
+	if (!ret)
+		sel->r = sdsel.r;
+
+	return ret;
+}
+
+static int unicam_enum_framesizes(struct file *file, void *priv,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	const struct unicam_fmt *fmt;
+	struct v4l2_subdev_frame_size_enum fse;
+	int ret;
+
+	/* check for valid format */
+	fmt = find_format_by_pix(dev, fsize->pixel_format);
+	if (!fmt) {
+		dev_err(dev->dev,
+			"Invalid pixel code: %x\n", fsize->pixel_format);
+		return -EINVAL;
+	}
+	fse.code = fmt->code;
+
+	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fse.index = fsize->index;
+	fse.pad = node->pad_id;
+
+	ret = v4l2_subdev_call(dev->sensor, pad, enum_frame_size, NULL, &fse);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev->dev, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
+		__func__, fse.index, fse.code, fse.min_width, fse.max_width,
+		fse.min_height, fse.max_height);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = fse.max_width;
+	fsize->discrete.height = fse.max_height;
+
+	return 0;
+}
+
+static int unicam_enum_frameintervals(struct file *file, void *priv,
+				      struct v4l2_frmivalenum *fival)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	const struct unicam_fmt *fmt;
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.index = fival->index,
+		.width = fival->width,
+		.height = fival->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	fmt = find_format_by_pix(dev, fival->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fie.code = fmt->code;
+	ret = v4l2_subdev_call(dev->sensor, pad, enum_frame_interval,
+			       NULL, &fie);
+	if (ret)
+		return ret;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = fie.interval;
+
+	return 0;
+}
+
+static int unicam_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_g_parm_cap(video_devdata(file), dev->sensor, a);
+}
+
+static int unicam_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_s_parm_cap(video_devdata(file), dev->sensor, a);
+}
+
+static int unicam_g_dv_timings(struct file *file, void *priv,
+			       struct v4l2_dv_timings *timings)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, video, g_dv_timings, timings);
+}
+
+static int unicam_s_dv_timings(struct file *file, void *priv,
+			       struct v4l2_dv_timings *timings)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	struct v4l2_dv_timings current_timings;
+	int ret;
+
+	ret = v4l2_subdev_call(dev->sensor, video, g_dv_timings,
+			       &current_timings);
+
+	if (ret < 0)
+		return ret;
+
+	if (v4l2_match_dv_timings(timings, &current_timings, 0, false))
+		return 0;
+
+	if (vb2_is_busy(&node->buffer_queue))
+		return -EBUSY;
+
+	ret = v4l2_subdev_call(dev->sensor, video, s_dv_timings, timings);
+
+	/* Force recomputation of bytesperline */
+	node->v_fmt.fmt.pix.bytesperline = 0;
+
+	unicam_reset_format(node);
+
+	return ret;
+}
+
+static int unicam_query_dv_timings(struct file *file, void *priv,
+				   struct v4l2_dv_timings *timings)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, video, query_dv_timings, timings);
+}
+
+static int unicam_enum_dv_timings(struct file *file, void *priv,
+				  struct v4l2_enum_dv_timings *timings)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, pad, enum_dv_timings, timings);
+}
+
+static int unicam_dv_timings_cap(struct file *file, void *priv,
+				 struct v4l2_dv_timings_cap *cap)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+
+	return v4l2_subdev_call(dev->sensor, pad, dv_timings_cap, cap);
+}
+
+static int unicam_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 2, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_event_subscribe(fh, sub, 4, NULL);
+	}
+
+	return v4l2_ctrl_subscribe_event(fh, sub);
+}
+
+static int unicam_log_status(struct file *file, void *fh)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	u32 reg;
+
+	/* status for sub devices */
+	v4l2_device_call_all(&dev->v4l2_dev, 0, core, log_status);
+
+	dev_info(dev->dev, "-----Receiver status-----\n");
+	dev_info(dev->dev, "V4L2 width/height:   %ux%u\n",
+		 node->v_fmt.fmt.pix.width, node->v_fmt.fmt.pix.height);
+	dev_info(dev->dev, "Mediabus format:     %08x\n", node->fmt->code);
+	dev_info(dev->dev, "V4L2 format:         %08x\n",
+		 node->v_fmt.fmt.pix.pixelformat);
+	reg = reg_read(dev, UNICAM_IPIPE);
+	dev_info(dev->dev, "Unpacking/packing:   %u / %u\n",
+		 get_field(reg, UNICAM_PUM_MASK),
+		 get_field(reg, UNICAM_PPM_MASK));
+	dev_info(dev->dev, "----Live data----\n");
+	dev_info(dev->dev, "Programmed stride:   %4u\n",
+		 reg_read(dev, UNICAM_IBLS));
+	dev_info(dev->dev, "Detected resolution: %ux%u\n",
+		 reg_read(dev, UNICAM_IHSTA),
+		 reg_read(dev, UNICAM_IVSTA));
+	dev_info(dev->dev, "Write pointer:       %08x\n",
+		 reg_read(dev, UNICAM_IBWP));
+
+	return 0;
+}
+
+static void unicam_notify(struct v4l2_subdev *sd,
+			  unsigned int notification, void *arg)
+{
+	struct unicam_device *dev = to_unicam_device(sd->v4l2_dev);
+
+	switch (notification) {
+	case V4L2_DEVICE_NOTIFY_EVENT:
+		v4l2_event_queue(&dev->node[IMAGE_PAD].video_dev, arg);
+		break;
+	default:
+		break;
+	}
+}
+
+static const struct vb2_ops unicam_video_qops = {
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.queue_setup		= unicam_queue_setup,
+	.buf_prepare		= unicam_buffer_prepare,
+	.buf_queue		= unicam_buffer_queue,
+	.start_streaming	= unicam_start_streaming,
+	.stop_streaming		= unicam_stop_streaming,
+};
+
+/*
+ * unicam_v4l2_open : This function is based on the v4l2_fh_open helper
+ * function. It has been augmented to handle sensor subdevice power management,
+ */
+static int unicam_v4l2_open(struct file *file)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	int ret;
+
+	mutex_lock(&node->lock);
+
+	ret = v4l2_fh_open(file);
+	if (ret) {
+		dev_err(dev->dev, "v4l2_fh_open failed\n");
+		goto unlock;
+	}
+
+	node->open++;
+
+	if (!v4l2_fh_is_singular_file(file))
+		goto unlock;
+
+	ret = v4l2_subdev_call(dev->sensor, core, s_power, 1);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		v4l2_fh_release(file);
+		node->open--;
+		goto unlock;
+	}
+
+	ret = 0;
+
+unlock:
+	mutex_unlock(&node->lock);
+	return ret;
+}
+
+static int unicam_v4l2_release(struct file *file)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *dev = node->dev;
+	struct v4l2_subdev *sd = dev->sensor;
+	bool fh_singular;
+	int ret;
+
+	mutex_lock(&node->lock);
+
+	fh_singular = v4l2_fh_is_singular_file(file);
+
+	ret = _vb2_fop_release(file, NULL);
+
+	if (fh_singular)
+		v4l2_subdev_call(sd, core, s_power, 0);
+
+	node->open--;
+	mutex_unlock(&node->lock);
+
+	return ret;
+}
+
+/* unicam capture driver file operations */
+static const struct v4l2_file_operations unicam_fops = {
+	.owner		= THIS_MODULE,
+	.open		= unicam_v4l2_open,
+	.release	= unicam_v4l2_release,
+	.read		= vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= vb2_fop_mmap,
+};
+
+/* unicam capture ioctl operations */
+static const struct v4l2_ioctl_ops unicam_ioctl_ops = {
+	.vidioc_querycap		= unicam_querycap,
+	.vidioc_enum_fmt_vid_cap	= unicam_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap		= unicam_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= unicam_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= unicam_try_fmt_vid_cap,
+
+	.vidioc_enum_fmt_meta_cap	= unicam_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap		= unicam_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap		= unicam_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap	= unicam_g_fmt_meta_cap,
+
+	.vidioc_enum_input		= unicam_enum_input,
+	.vidioc_g_input			= unicam_g_input,
+	.vidioc_s_input			= unicam_s_input,
+
+	.vidioc_querystd		= unicam_querystd,
+	.vidioc_s_std			= unicam_s_std,
+	.vidioc_g_std			= unicam_g_std,
+
+	.vidioc_g_edid			= unicam_g_edid,
+	.vidioc_s_edid			= unicam_s_edid,
+
+	.vidioc_enum_framesizes		= unicam_enum_framesizes,
+	.vidioc_enum_frameintervals	= unicam_enum_frameintervals,
+
+	.vidioc_g_selection		= unicam_g_selection,
+	.vidioc_s_selection		= unicam_s_selection,
+
+	.vidioc_g_parm			= unicam_g_parm,
+	.vidioc_s_parm			= unicam_s_parm,
+
+	.vidioc_s_dv_timings		= unicam_s_dv_timings,
+	.vidioc_g_dv_timings		= unicam_g_dv_timings,
+	.vidioc_query_dv_timings	= unicam_query_dv_timings,
+	.vidioc_enum_dv_timings		= unicam_enum_dv_timings,
+	.vidioc_dv_timings_cap		= unicam_dv_timings_cap,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_log_status		= unicam_log_status,
+	.vidioc_subscribe_event		= unicam_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+static int unicam_async_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *subdev,
+			      struct v4l2_async_subdev *asd)
+{
+	struct unicam_device *unicam = to_unicam_device(notifier->v4l2_dev);
+
+	if (unicam->sensor) {
+		dev_info(unicam->dev, "Rejecting subdev %s (Already set!!)",
+			 subdev->name);
+		return 0;
+	}
+
+	unicam->sensor = subdev;
+	dev_dbg(unicam->dev, "Using sensor %s for capture\n", subdev->name);
+
+	return 0;
+}
+
+static void unicam_release(struct kref *kref)
+{
+	struct unicam_device *unicam =
+		container_of(kref, struct unicam_device, kref);
+
+	v4l2_ctrl_handler_free(&unicam->ctrl_handler);
+	media_device_cleanup(&unicam->mdev);
+
+	if (unicam->sensor_config)
+		v4l2_subdev_free_pad_config(unicam->sensor_config);
+
+	kfree(unicam);
+}
+
+static void unicam_put(struct unicam_device *unicam)
+{
+	kref_put(&unicam->kref, unicam_release);
+}
+
+static void unicam_get(struct unicam_device *unicam)
+{
+	kref_get(&unicam->kref);
+}
+
+static void unicam_node_release(struct video_device *vdev)
+{
+	struct unicam_node *node = video_get_drvdata(vdev);
+
+	unicam_put(node->dev);
+}
+
+static int register_node(struct unicam_device *unicam, struct unicam_node *node,
+			 enum v4l2_buf_type type, int pad_id)
+{
+	struct video_device *vdev;
+	struct vb2_queue *q;
+	struct v4l2_mbus_framefmt mbus_fmt = {0};
+	const struct unicam_fmt *fmt;
+	int ret;
+
+	if (pad_id == IMAGE_PAD) {
+		ret = __subdev_get_format(unicam, &mbus_fmt, pad_id);
+		if (ret) {
+			dev_err(unicam->dev, "Failed to get_format - ret %d\n",
+				ret);
+			return ret;
+		}
+
+		fmt = find_format_by_code(mbus_fmt.code);
+		if (!fmt) {
+			/*
+			 * Find the first format that the sensor and unicam both
+			 * support
+			 */
+			fmt = get_first_supported_format(unicam);
+
+			if (!fmt)
+				/* No compatible formats */
+				return -EINVAL;
+
+			mbus_fmt.code = fmt->code;
+			ret = __subdev_set_format(unicam, &mbus_fmt, pad_id);
+			if (ret)
+				return -EINVAL;
+		}
+		if (mbus_fmt.field != V4L2_FIELD_NONE) {
+			/* Interlaced not supported - disable it now. */
+			mbus_fmt.field = V4L2_FIELD_NONE;
+			ret = __subdev_set_format(unicam, &mbus_fmt, pad_id);
+			if (ret)
+				return -EINVAL;
+		}
+
+		node->v_fmt.fmt.pix.pixelformat = fmt->fourcc ? fmt->fourcc
+						: fmt->repacked_fourcc;
+	} else {
+		/* Fix this node format as embedded data. */
+		fmt = find_format_by_code(MEDIA_BUS_FMT_SENSOR_DATA);
+		node->v_fmt.fmt.meta.dataformat = fmt->fourcc;
+	}
+
+	node->dev = unicam;
+	node->pad_id = pad_id;
+	node->fmt = fmt;
+
+	/* Read current subdev format */
+	unicam_reset_format(node);
+
+	if (v4l2_subdev_has_op(unicam->sensor, video, s_std)) {
+		v4l2_std_id tvnorms;
+
+		if (WARN_ON(!v4l2_subdev_has_op(unicam->sensor, video,
+						g_tvnorms)))
+			/*
+			 * Subdevice should not advertise s_std but not
+			 * g_tvnorms
+			 */
+			return -EINVAL;
+
+		ret = v4l2_subdev_call(unicam->sensor, video,
+				       g_tvnorms, &tvnorms);
+		if (WARN_ON(ret))
+			return -EINVAL;
+		node->video_dev.tvnorms |= tvnorms;
+	}
+
+	spin_lock_init(&node->dma_queue_lock);
+	mutex_init(&node->lock);
+
+	vdev = &node->video_dev;
+	if (pad_id == IMAGE_PAD) {
+		/* Add controls from the subdevice */
+		ret = v4l2_ctrl_add_handler(&unicam->ctrl_handler,
+					    unicam->sensor->ctrl_handler, NULL,
+					    true);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * If the sensor subdevice has any controls, associate the node
+		 *  with the ctrl handler to allow access from userland.
+		 */
+		if (!list_empty(&unicam->ctrl_handler.ctrls))
+			vdev->ctrl_handler = &unicam->ctrl_handler;
+	}
+
+	q = &node->buffer_queue;
+	q->type = type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = node;
+	q->ops = &unicam_video_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct unicam_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &node->lock;
+	q->min_buffers_needed = 1;
+	q->dev = unicam->dev;
+
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(unicam->dev, "vb2_queue_init() failed\n");
+		return ret;
+	}
+
+	INIT_LIST_HEAD(&node->dma_queue);
+
+	vdev->release = unicam_node_release;
+	vdev->fops = &unicam_fops;
+	vdev->ioctl_ops = &unicam_ioctl_ops;
+	vdev->v4l2_dev = &unicam->v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->queue = q;
+	vdev->lock = &node->lock;
+	vdev->device_caps = (pad_id == IMAGE_PAD) ?
+				V4L2_CAP_VIDEO_CAPTURE : V4L2_CAP_META_CAPTURE;
+	vdev->device_caps |= V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
+
+	/* Define the device names */
+	snprintf(vdev->name, sizeof(vdev->name), "%s-%s", UNICAM_MODULE_NAME,
+		 pad_id == IMAGE_PAD ? "image" : "embedded");
+
+	video_set_drvdata(vdev, node);
+	if (pad_id == IMAGE_PAD)
+		vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
+	node->pad.flags = MEDIA_PAD_FL_SINK;
+	media_entity_pads_init(&vdev->entity, 1, &node->pad);
+
+	node->dummy_buf_cpu_addr = dma_alloc_coherent(unicam->dev,
+						      DUMMY_BUF_SIZE,
+						      &node->dummy_buf_dma_addr,
+						      GFP_KERNEL);
+	if (!node->dummy_buf_cpu_addr) {
+		dev_err(unicam->dev, "Unable to allocate dummy buffer.\n");
+		return -ENOMEM;
+	}
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, video, s_std)) {
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_S_STD);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_G_STD);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_ENUMSTD);
+	}
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, video, querystd))
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_QUERYSTD);
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, video, s_dv_timings)) {
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_S_EDID);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_G_EDID);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_DV_TIMINGS_CAP);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_G_DV_TIMINGS);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_S_DV_TIMINGS);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_ENUM_DV_TIMINGS);
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_QUERY_DV_TIMINGS);
+	}
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, pad, enum_frame_interval))
+		v4l2_disable_ioctl(&node->video_dev,
+				   VIDIOC_ENUM_FRAMEINTERVALS);
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, video, g_frame_interval))
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_G_PARM);
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, video, s_frame_interval))
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_S_PARM);
+
+	if (pad_id == METADATA_PAD ||
+	    !v4l2_subdev_has_op(unicam->sensor, pad, enum_frame_size))
+		v4l2_disable_ioctl(&node->video_dev, VIDIOC_ENUM_FRAMESIZES);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register video device %s\n",
+			vdev->name);
+		return ret;
+	}
+
+	/*
+	 * Acquire a reference to unicam, which will be released when the video
+	 * device will be unregistered and userspace will have closed all open
+	 * file handles.
+	 */
+	unicam_get(unicam);
+	node->registered = true;
+
+	if (pad_id != METADATA_PAD || unicam->sensor_embedded_data) {
+		ret = media_create_pad_link(&unicam->sensor->entity, pad_id,
+					    &node->video_dev.entity, 0,
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+		if (ret)
+			dev_err(unicam->dev, "Unable to create link for %s\n",
+				vdev->name);
+	}
+
+	return ret;
+}
+
+static void unregister_nodes(struct unicam_device *unicam)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+		struct unicam_node *node = &unicam->node[i];
+
+		if (node->dummy_buf_cpu_addr) {
+			dma_free_coherent(unicam->dev, DUMMY_BUF_SIZE,
+					  node->dummy_buf_cpu_addr,
+					  node->dummy_buf_dma_addr);
+		}
+
+		if (node->registered) {
+			node->registered = false;
+			video_unregister_device(&node->video_dev);
+		}
+	}
+}
+
+static int unicam_async_complete(struct v4l2_async_notifier *notifier)
+{
+	struct unicam_device *unicam = to_unicam_device(notifier->v4l2_dev);
+	int ret;
+
+	unicam->v4l2_dev.notify = unicam_notify;
+
+	unicam->sensor_config = v4l2_subdev_alloc_pad_config(unicam->sensor);
+	if (!unicam->sensor_config)
+		return -ENOMEM;
+
+	unicam->sensor_embedded_data = (unicam->sensor->entity.num_pads >= 2);
+
+	ret = register_node(unicam, &unicam->node[IMAGE_PAD],
+			    V4L2_BUF_TYPE_VIDEO_CAPTURE, IMAGE_PAD);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register image video device.\n");
+		goto unregister;
+	}
+
+	ret = register_node(unicam, &unicam->node[METADATA_PAD],
+			    V4L2_BUF_TYPE_META_CAPTURE, METADATA_PAD);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register metadata video device.\n");
+		goto unregister;
+	}
+
+	ret = v4l2_device_register_ro_subdev_nodes(&unicam->v4l2_dev);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register subdev nodes.\n");
+		goto unregister;
+	}
+
+	/*
+	 * Release the initial reference, all references are now owned by the
+	 * video devices.
+	 */
+	unicam_put(unicam);
+
+	return 0;
+
+unregister:
+	unregister_nodes(unicam);
+	unicam_put(unicam);
+
+	return ret;
+}
+
+static const struct v4l2_async_notifier_operations unicam_async_ops = {
+	.bound = unicam_async_bound,
+	.complete = unicam_async_complete,
+};
+
+static int of_unicam_connect_subdevs(struct unicam_device *dev)
+{
+	struct v4l2_fwnode_endpoint ep = { 0 };
+	struct device_node *ep_node;
+	int ret;
+
+	if (of_property_read_u32(dev->dev->of_node, "brcm,num-data-lanes",
+				 &dev->max_data_lanes) < 0) {
+		dev_err(dev->dev, "number of data lanes not set\n");
+		return -EINVAL;
+	}
+
+	/* Get the local endpoint and remote device. */
+	ep_node = of_graph_get_next_endpoint(dev->dev->of_node, NULL);
+	if (!ep_node) {
+		dev_err(dev->dev, "can't get next endpoint\n");
+		return -EINVAL;
+	}
+
+	/* Parse the local endpoint and validate its configuration. */
+	v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
+	dev->bus_type = ep.bus_type;
+
+	switch (ep.bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
+		switch (ep.bus.mipi_csi2.num_data_lanes) {
+		case 1:
+		case 2:
+		case 4:
+			break;
+
+		default:
+			dev_err(dev->dev, "%u data lanes not supported\n",
+				ep.bus.mipi_csi2.num_data_lanes);
+			goto err_ep_config;
+		}
+
+		if (ep.bus.mipi_csi2.num_data_lanes > dev->max_data_lanes) {
+			dev_err(dev->dev,
+				"%u lanes requested when %u are supported\n",
+				ep.bus.mipi_csi2.num_data_lanes,
+				dev->max_data_lanes);
+			goto err_ep_config;
+		}
+
+		dev->max_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
+		dev->bus_flags = ep.bus.mipi_csi2.flags;
+		break;
+
+	case V4L2_MBUS_CCP2:
+		if (ep.bus.mipi_csi1.clock_lane != 0 ||
+		    ep.bus.mipi_csi1.data_lane != 1) {
+			dev_err(dev->dev, "unsupported lanes configuration\n");
+			goto err_ep_config;
+		}
+
+		dev->max_data_lanes = 1;
+		dev->bus_flags = ep.bus.mipi_csi1.strobe;
+		break;
+
+	default:
+		/* Unsupported bus type */
+		dev_err(dev->dev, " unsupported bus type %u\n", ep.bus_type);
+		goto err_ep_config;
+	}
+
+	/* Initialize and register the async notifier. */
+	v4l2_async_notifier_init(&dev->notifier);
+	dev->notifier.ops = &unicam_async_ops;
+
+	ret = v4l2_async_notifier_add_fwnode_remote_subdev(&dev->notifier,
+				of_fwnode_handle(ep_node), &dev->asd);
+	of_node_put(ep_node);
+	if (ret) {
+		dev_err(dev->dev, "Error adding subdevice: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_async_notifier_register(&dev->v4l2_dev, &dev->notifier);
+	if (ret) {
+		dev_err(dev->dev, "Error registering async notifier: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+
+err_ep_config:
+	of_node_put(ep_node);
+	return -EINVAL;
+}
+
+static int unicam_probe(struct platform_device *pdev)
+{
+	struct unicam_device *unicam;
+	int ret;
+
+	unicam = kzalloc(sizeof(*unicam), GFP_KERNEL);
+	if (!unicam)
+		return -ENOMEM;
+
+	kref_init(&unicam->kref);
+	unicam->dev = &pdev->dev;
+
+	unicam->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(unicam->base)) {
+		dev_err(unicam->dev, "Failed to get main io block\n");
+		ret = PTR_ERR(unicam->base);
+		goto err_unicam_put;
+	}
+
+	unicam->clk_gate_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(unicam->clk_gate_base)) {
+		dev_err(unicam->dev, "Failed to get 2nd io block\n");
+		ret = PTR_ERR(unicam->clk_gate_base);
+		goto err_unicam_put;
+	}
+
+	unicam->clock = devm_clk_get(&pdev->dev, "lp");
+	if (IS_ERR(unicam->clock)) {
+		dev_err(unicam->dev, "Failed to get lp clock\n");
+		ret = PTR_ERR(unicam->clock);
+		goto err_unicam_put;
+	}
+
+	unicam->vpu_clock = devm_clk_get(&pdev->dev, "vpu");
+	if (IS_ERR(unicam->vpu_clock)) {
+		dev_err(unicam->dev, "Failed to get vpu clock\n");
+		ret = PTR_ERR(unicam->vpu_clock);
+		goto err_unicam_put;
+	}
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret <= 0) {
+		dev_err(&pdev->dev, "No IRQ resource\n");
+		ret = -EINVAL;
+		goto err_unicam_put;
+	}
+
+	ret = devm_request_irq(&pdev->dev, ret, unicam_isr, 0,
+			       "unicam_capture0", unicam);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to request interrupt\n");
+		ret = -EINVAL;
+		goto err_unicam_put;
+	}
+
+	unicam->mdev.dev = &pdev->dev;
+	strscpy(unicam->mdev.model, UNICAM_MODULE_NAME,
+		sizeof(unicam->mdev.model));
+	strscpy(unicam->mdev.serial, "", sizeof(unicam->mdev.serial));
+	snprintf(unicam->mdev.bus_info, sizeof(unicam->mdev.bus_info),
+		 "platform:%s", dev_name(&pdev->dev));
+	unicam->mdev.hw_revision = 0;
+
+	media_device_init(&unicam->mdev);
+
+	unicam->v4l2_dev.mdev = &unicam->mdev;
+
+	ret = v4l2_device_register(&pdev->dev, &unicam->v4l2_dev);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register v4l2 device.\n");
+		goto err_unicam_put;
+	}
+
+	ret = media_device_register(&unicam->mdev);
+	if (ret < 0) {
+		dev_err(unicam->dev, "Unable to register media device.\n");
+		goto err_v4l2_unregister;
+	}
+
+	/* Reserve space for the controls */
+	ret = v4l2_ctrl_handler_init(&unicam->ctrl_handler, 16);
+	if (ret < 0)
+		goto err_media_unregister;
+
+	/* set the driver data in platform device */
+	platform_set_drvdata(pdev, unicam);
+
+	ret = of_unicam_connect_subdevs(unicam);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to connect subdevs\n");
+		goto err_media_unregister;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+
+err_media_unregister:
+	media_device_unregister(&unicam->mdev);
+err_v4l2_unregister:
+	v4l2_device_unregister(&unicam->v4l2_dev);
+err_unicam_put:
+	unicam_put(unicam);
+
+	return ret;
+}
+
+static int unicam_remove(struct platform_device *pdev)
+{
+	struct unicam_device *unicam = platform_get_drvdata(pdev);
+
+	v4l2_async_notifier_unregister(&unicam->notifier);
+	v4l2_device_unregister(&unicam->v4l2_dev);
+	media_device_unregister(&unicam->mdev);
+	unregister_nodes(unicam);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id unicam_of_match[] = {
+	{ .compatible = "brcm,bcm2835-unicam", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, unicam_of_match);
+
+static struct platform_driver unicam_driver = {
+	.probe		= unicam_probe,
+	.remove		= unicam_remove,
+	.driver = {
+		.name	= UNICAM_MODULE_NAME,
+		.of_match_table = of_match_ptr(unicam_of_match),
+	},
+};
+
+module_platform_driver(unicam_driver);
+
+MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
+MODULE_DESCRIPTION("BCM2835 Unicam driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION(UNICAM_VERSION);
diff --git a/drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h b/drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h
new file mode 100644
index 0000000000000..ae059a171d0fe
--- /dev/null
+++ b/drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Copyright (C) 2017-2020 Raspberry Pi Trading.
+ * Dave Stevenson <dave.stevenson@raspberrypi.com>
+ */
+
+#ifndef VC4_REGS_UNICAM_H
+#define VC4_REGS_UNICAM_H
+
+/*
+ * The following values are taken from files found within the code drop
+ * made by Broadcom for the BCM21553 Graphics Driver, predominantly in
+ * brcm_usrlib/dag/vmcsx/vcinclude/hardware_vc4.h.
+ * They have been modified to be only the register offset.
+ */
+#define UNICAM_CTRL	0x000
+#define UNICAM_STA	0x004
+#define UNICAM_ANA	0x008
+#define UNICAM_PRI	0x00c
+#define UNICAM_CLK	0x010
+#define UNICAM_CLT	0x014
+#define UNICAM_DAT0	0x018
+#define UNICAM_DAT1	0x01c
+#define UNICAM_DAT2	0x020
+#define UNICAM_DAT3	0x024
+#define UNICAM_DLT	0x028
+#define UNICAM_CMP0	0x02c
+#define UNICAM_CMP1	0x030
+#define UNICAM_CAP0	0x034
+#define UNICAM_CAP1	0x038
+#define UNICAM_ICTL	0x100
+#define UNICAM_ISTA	0x104
+#define UNICAM_IDI0	0x108
+#define UNICAM_IPIPE	0x10c
+#define UNICAM_IBSA0	0x110
+#define UNICAM_IBEA0	0x114
+#define UNICAM_IBLS	0x118
+#define UNICAM_IBWP	0x11c
+#define UNICAM_IHWIN	0x120
+#define UNICAM_IHSTA	0x124
+#define UNICAM_IVWIN	0x128
+#define UNICAM_IVSTA	0x12c
+#define UNICAM_ICC	0x130
+#define UNICAM_ICS	0x134
+#define UNICAM_IDC	0x138
+#define UNICAM_IDPO	0x13c
+#define UNICAM_IDCA	0x140
+#define UNICAM_IDCD	0x144
+#define UNICAM_IDS	0x148
+#define UNICAM_DCS	0x200
+#define UNICAM_DBSA0	0x204
+#define UNICAM_DBEA0	0x208
+#define UNICAM_DBWP	0x20c
+#define UNICAM_DBCTL	0x300
+#define UNICAM_IBSA1	0x304
+#define UNICAM_IBEA1	0x308
+#define UNICAM_IDI1	0x30c
+#define UNICAM_DBSA1	0x310
+#define UNICAM_DBEA1	0x314
+#define UNICAM_MISC	0x400
+
+/*
+ * The following bitmasks are from the kernel released by Broadcom
+ * for Android - https://android.googlesource.com/kernel/bcm/
+ * The Rhea, Hawaii, and Java chips all contain the same VideoCore4
+ * Unicam block as BCM2835, as defined in eg
+ * arch/arm/mach-rhea/include/mach/rdb_A0/brcm_rdb_cam.h and similar.
+ * Values reworked to use the kernel BIT and GENMASK macros.
+ *
+ * Some of the bit mnenomics have been amended to match the datasheet.
+ */
+/* UNICAM_CTRL Register */
+#define UNICAM_CPE		BIT(0)
+#define UNICAM_MEM		BIT(1)
+#define UNICAM_CPR		BIT(2)
+#define UNICAM_CPM_MASK		GENMASK(3, 3)
+#define UNICAM_CPM_CSI2		0
+#define UNICAM_CPM_CCP2		1
+#define UNICAM_SOE		BIT(4)
+#define UNICAM_DCM_MASK		GENMASK(5, 5)
+#define UNICAM_DCM_STROBE	0
+#define UNICAM_DCM_DATA		1
+#define UNICAM_SLS		BIT(6)
+#define UNICAM_PFT_MASK		GENMASK(11, 8)
+#define UNICAM_OET_MASK		GENMASK(20, 12)
+
+/* UNICAM_STA Register */
+#define UNICAM_SYN		BIT(0)
+#define UNICAM_CS		BIT(1)
+#define UNICAM_SBE		BIT(2)
+#define UNICAM_PBE		BIT(3)
+#define UNICAM_HOE		BIT(4)
+#define UNICAM_PLE		BIT(5)
+#define UNICAM_SSC		BIT(6)
+#define UNICAM_CRCE		BIT(7)
+#define UNICAM_OES		BIT(8)
+#define UNICAM_IFO		BIT(9)
+#define UNICAM_OFO		BIT(10)
+#define UNICAM_BFO		BIT(11)
+#define UNICAM_DL		BIT(12)
+#define UNICAM_PS		BIT(13)
+#define UNICAM_IS		BIT(14)
+#define UNICAM_PI0		BIT(15)
+#define UNICAM_PI1		BIT(16)
+#define UNICAM_FSI_S		BIT(17)
+#define UNICAM_FEI_S		BIT(18)
+#define UNICAM_LCI_S		BIT(19)
+#define UNICAM_BUF0_RDY		BIT(20)
+#define UNICAM_BUF0_NO		BIT(21)
+#define UNICAM_BUF1_RDY		BIT(22)
+#define UNICAM_BUF1_NO		BIT(23)
+#define UNICAM_DI		BIT(24)
+
+#define UNICAM_STA_MASK_ALL \
+		(UNICAM_DL + \
+		UNICAM_SBE + \
+		UNICAM_PBE + \
+		UNICAM_HOE + \
+		UNICAM_PLE + \
+		UNICAM_SSC + \
+		UNICAM_CRCE + \
+		UNICAM_IFO + \
+		UNICAM_OFO + \
+		UNICAM_PS + \
+		UNICAM_PI0 + \
+		UNICAM_PI1)
+
+/* UNICAM_ANA Register */
+#define UNICAM_APD		BIT(0)
+#define UNICAM_BPD		BIT(1)
+#define UNICAM_AR		BIT(2)
+#define UNICAM_DDL		BIT(3)
+#define UNICAM_CTATADJ_MASK	GENMASK(7, 4)
+#define UNICAM_PTATADJ_MASK	GENMASK(11, 8)
+
+/* UNICAM_PRI Register */
+#define UNICAM_PE		BIT(0)
+#define UNICAM_PT_MASK		GENMASK(2, 1)
+#define UNICAM_NP_MASK		GENMASK(7, 4)
+#define UNICAM_PP_MASK		GENMASK(11, 8)
+#define UNICAM_BS_MASK		GENMASK(15, 12)
+#define UNICAM_BL_MASK		GENMASK(17, 16)
+
+/* UNICAM_CLK Register */
+#define UNICAM_CLE		BIT(0)
+#define UNICAM_CLPD		BIT(1)
+#define UNICAM_CLLPE		BIT(2)
+#define UNICAM_CLHSE		BIT(3)
+#define UNICAM_CLTRE		BIT(4)
+#define UNICAM_CLAC_MASK	GENMASK(8, 5)
+#define UNICAM_CLSTE		BIT(29)
+
+/* UNICAM_CLT Register */
+#define UNICAM_CLT1_MASK	GENMASK(7, 0)
+#define UNICAM_CLT2_MASK	GENMASK(15, 8)
+
+/* UNICAM_DATn Registers */
+#define UNICAM_DLE		BIT(0)
+#define UNICAM_DLPD		BIT(1)
+#define UNICAM_DLLPE		BIT(2)
+#define UNICAM_DLHSE		BIT(3)
+#define UNICAM_DLTRE		BIT(4)
+#define UNICAM_DLSM		BIT(5)
+#define UNICAM_DLFO		BIT(28)
+#define UNICAM_DLSTE		BIT(29)
+
+#define UNICAM_DAT_MASK_ALL (UNICAM_DLSTE + UNICAM_DLFO)
+
+/* UNICAM_DLT Register */
+#define UNICAM_DLT1_MASK	GENMASK(7, 0)
+#define UNICAM_DLT2_MASK	GENMASK(15, 8)
+#define UNICAM_DLT3_MASK	GENMASK(23, 16)
+
+/* UNICAM_ICTL Register */
+#define UNICAM_FSIE		BIT(0)
+#define UNICAM_FEIE		BIT(1)
+#define UNICAM_IBOB		BIT(2)
+#define UNICAM_FCM		BIT(3)
+#define UNICAM_TFC		BIT(4)
+#define UNICAM_LIP_MASK		GENMASK(6, 5)
+#define UNICAM_LCIE_MASK	GENMASK(28, 16)
+
+/* UNICAM_IDI0/1 Register */
+#define UNICAM_ID0_MASK		GENMASK(7, 0)
+#define UNICAM_ID1_MASK		GENMASK(15, 8)
+#define UNICAM_ID2_MASK		GENMASK(23, 16)
+#define UNICAM_ID3_MASK		GENMASK(31, 24)
+
+/* UNICAM_ISTA Register */
+#define UNICAM_FSI		BIT(0)
+#define UNICAM_FEI		BIT(1)
+#define UNICAM_LCI		BIT(2)
+
+#define UNICAM_ISTA_MASK_ALL (UNICAM_FSI + UNICAM_FEI + UNICAM_LCI)
+
+/* UNICAM_IPIPE Register */
+#define UNICAM_PUM_MASK		GENMASK(2, 0)
+		/* Unpacking modes */
+		#define UNICAM_PUM_NONE		0
+		#define UNICAM_PUM_UNPACK6	1
+		#define UNICAM_PUM_UNPACK7	2
+		#define UNICAM_PUM_UNPACK8	3
+		#define UNICAM_PUM_UNPACK10	4
+		#define UNICAM_PUM_UNPACK12	5
+		#define UNICAM_PUM_UNPACK14	6
+		#define UNICAM_PUM_UNPACK16	7
+#define UNICAM_DDM_MASK		GENMASK(6, 3)
+#define UNICAM_PPM_MASK		GENMASK(9, 7)
+		/* Packing modes */
+		#define UNICAM_PPM_NONE		0
+		#define UNICAM_PPM_PACK8	1
+		#define UNICAM_PPM_PACK10	2
+		#define UNICAM_PPM_PACK12	3
+		#define UNICAM_PPM_PACK14	4
+		#define UNICAM_PPM_PACK16	5
+#define UNICAM_DEM_MASK		GENMASK(11, 10)
+#define UNICAM_DEBL_MASK	GENMASK(14, 12)
+#define UNICAM_ICM_MASK		GENMASK(16, 15)
+#define UNICAM_IDM_MASK		GENMASK(17, 17)
+
+/* UNICAM_ICC Register */
+#define UNICAM_ICFL_MASK	GENMASK(4, 0)
+#define UNICAM_ICFH_MASK	GENMASK(9, 5)
+#define UNICAM_ICST_MASK	GENMASK(12, 10)
+#define UNICAM_ICLT_MASK	GENMASK(15, 13)
+#define UNICAM_ICLL_MASK	GENMASK(31, 16)
+
+/* UNICAM_DCS Register */
+#define UNICAM_DIE		BIT(0)
+#define UNICAM_DIM		BIT(1)
+#define UNICAM_DBOB		BIT(3)
+#define UNICAM_FDE		BIT(4)
+#define UNICAM_LDP		BIT(5)
+#define UNICAM_EDL_MASK		GENMASK(15, 8)
+
+/* UNICAM_DBCTL Register */
+#define UNICAM_DBEN		BIT(0)
+#define UNICAM_BUF0_IE		BIT(1)
+#define UNICAM_BUF1_IE		BIT(2)
+
+/* UNICAM_CMP[0,1] register */
+#define UNICAM_PCE		BIT(31)
+#define UNICAM_GI		BIT(9)
+#define UNICAM_CPH		BIT(8)
+#define UNICAM_PCVC_MASK	GENMASK(7, 6)
+#define UNICAM_PCDT_MASK	GENMASK(5, 0)
+
+/* UNICAM_MISC register */
+#define UNICAM_FL0		BIT(6)
+#define UNICAM_FL1		BIT(9)
+
+#endif
-- 
2.29.1

