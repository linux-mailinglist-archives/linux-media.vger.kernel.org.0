Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8DF1491D0
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbgAXXUw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:52 -0500
Received: from mailoutvs52.siol.net ([185.57.226.243]:37447 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387406AbgAXXUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 106745228E8;
        Sat, 25 Jan 2020 00:20:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id eFCOWNOfq5fO; Sat, 25 Jan 2020 00:20:39 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id E55C05228E9;
        Sat, 25 Jan 2020 00:20:39 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 81E1F5228E8;
        Sat, 25 Jan 2020 00:20:37 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 6/8] media: sun8i: Add Allwinner A83T Rotate driver
Date:   Sat, 25 Jan 2020 00:20:12 +0100
Message-Id: <20200124232014.574989-7-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner A83T contains rotation core which can rotate and flip images.

Add a driver for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 MAINTAINERS                                   |   8 +
 drivers/media/platform/Kconfig                |  12 +
 drivers/media/platform/sunxi/Makefile         |   1 +
 .../platform/sunxi/sun8i-rotate/Makefile      |   2 +
 .../sunxi/sun8i-rotate/sun8i-formats.c        | 273 ++++++
 .../sunxi/sun8i-rotate/sun8i-formats.h        |  25 +
 .../sunxi/sun8i-rotate/sun8i-rotate.c         | 924 ++++++++++++++++++
 .../sunxi/sun8i-rotate/sun8i-rotate.h         | 135 +++
 8 files changed, 1380 insertions(+)
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-forma=
ts.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-forma=
ts.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotat=
e.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotat=
e.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 98cf0b034f61..6aab509b8a2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14322,6 +14322,14 @@ F:	include/net/rose.h
 F:	include/uapi/linux/rose.h
 F:	net/rose/
=20
+ROTATION DRIVER FOR ALLWINNER A83T
+M:	Jernej Skrabec <jernej.skrabec@siol.net>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/platform/sunxi/sun8i-rot/
+F:	Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-rotate.y=
aml
+
 RTL2830 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kcon=
fig
index 995f4c67f764..fc2c8a009b2f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -507,6 +507,18 @@ config VIDEO_SUN8I_DEINTERLACE
 	   capability found on some SoCs, like H3.
 	   To compile this driver as a module choose m here.
=20
+config VIDEO_SUN8I_ROTATE
+	tristate "Allwinner DE2 rotation driver"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on COMMON_CLK && OF
+	depends on PM
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	   Support for the Allwinner DE2 rotation unit.
+	   To compile this driver as a module choose m here.
+
 endif # V4L_MEM2MEM_DRIVERS
=20
 # TI VIDEO PORT Helper Modules
diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platfo=
rm/sunxi/Makefile
index 3878cb4efdc2..ff0993f70dc3 100644
--- a/drivers/media/platform/sunxi/Makefile
+++ b/drivers/media/platform/sunxi/Makefile
@@ -1,3 +1,4 @@
 obj-y		+=3D sun4i-csi/
 obj-y		+=3D sun6i-csi/
 obj-y		+=3D sun8i-di/
+obj-y		+=3D sun8i-rotate/
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/Makefile b/drivers=
/media/platform/sunxi/sun8i-rotate/Makefile
new file mode 100644
index 000000000000..2f815f4af126
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-rotate/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_SUN8I_ROTATE) +=3D sun8i-rotate.o sun8i-formats.o
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.c b/=
drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.c
new file mode 100644
index 000000000000..cebfbc5def38
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2020 Jernej Skrabec <jernej.skrabec@siol.net> */
+
+#include "sun8i-formats.h"
+#include "sun8i-rotate.h"
+
+/*
+ * Formats not included in array:
+ * ROTATE_FORMAT_BGR565
+ * ROTATE_FORMAT_VYUV
+ */
+
+static const struct rotate_format rotate_formats[] =3D {
+	{
+		.fourcc =3D V4L2_PIX_FMT_ARGB32,
+		.hw_format =3D ROTATE_FORMAT_ARGB32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_ABGR32,
+		.hw_format =3D ROTATE_FORMAT_ABGR32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_RGBA32,
+		.hw_format =3D ROTATE_FORMAT_RGBA32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_BGRA32,
+		.hw_format =3D ROTATE_FORMAT_BGRA32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_XRGB32,
+		.hw_format =3D ROTATE_FORMAT_XRGB32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_XBGR32,
+		.hw_format =3D ROTATE_FORMAT_XBGR32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_RGB32,
+		.hw_format =3D ROTATE_FORMAT_RGBX32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_BGR32,
+		.hw_format =3D ROTATE_FORMAT_BGRX32,
+		.planes =3D 1,
+		.bpp =3D { 4, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_RGB24,
+		.hw_format =3D ROTATE_FORMAT_RGB24,
+		.planes =3D 1,
+		.bpp =3D { 3, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_BGR24,
+		.hw_format =3D ROTATE_FORMAT_BGR24,
+		.planes =3D 1,
+		.bpp =3D { 3, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_RGB565,
+		.hw_format =3D ROTATE_FORMAT_RGB565,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_ARGB444,
+		.hw_format =3D ROTATE_FORMAT_ARGB4444,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_ABGR444,
+		.hw_format =3D ROTATE_FORMAT_ABGR4444,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_RGBA444,
+		.hw_format =3D ROTATE_FORMAT_RGBA4444,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_BGRA444,
+		.hw_format =3D ROTATE_FORMAT_BGRA4444,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_ARGB555,
+		.hw_format =3D ROTATE_FORMAT_ARGB1555,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_ABGR555,
+		.hw_format =3D ROTATE_FORMAT_ABGR1555,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_RGBA555,
+		.hw_format =3D ROTATE_FORMAT_RGBA5551,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_BGRA555,
+		.hw_format =3D ROTATE_FORMAT_BGRA5551,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 1,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_OUTPUT
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_YVYU,
+		.hw_format =3D ROTATE_FORMAT_YVYU,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 2,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_UYVY,
+		.hw_format =3D ROTATE_FORMAT_UYVY,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 2,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_YUYV,
+		.hw_format =3D ROTATE_FORMAT_YUYV,
+		.planes =3D 1,
+		.bpp =3D { 2, 0, 0 },
+		.hsub =3D 2,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_NV61,
+		.hw_format =3D ROTATE_FORMAT_NV61,
+		.planes =3D 2,
+		.bpp =3D { 1, 2, 0 },
+		.hsub =3D 2,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_NV16,
+		.hw_format =3D ROTATE_FORMAT_NV16,
+		.planes =3D 2,
+		.bpp =3D { 1, 2, 0 },
+		.hsub =3D 2,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_YUV422P,
+		.hw_format =3D ROTATE_FORMAT_YUV422P,
+		.planes =3D 3,
+		.bpp =3D { 1, 1, 1 },
+		.hsub =3D 2,
+		.vsub =3D 1,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_NV21,
+		.hw_format =3D ROTATE_FORMAT_NV21,
+		.planes =3D 2,
+		.bpp =3D { 1, 2, 0 },
+		.hsub =3D 2,
+		.vsub =3D 2,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_NV12,
+		.hw_format =3D ROTATE_FORMAT_NV12,
+		.planes =3D 2,
+		.bpp =3D { 1, 2, 0 },
+		.hsub =3D 2,
+		.vsub =3D 2,
+		.flags =3D ROTATE_FLAG_YUV
+	}, {
+		.fourcc =3D V4L2_PIX_FMT_YUV420,
+		.hw_format =3D ROTATE_FORMAT_YUV420P,
+		.planes =3D 3,
+		.bpp =3D { 1, 1, 1 },
+		.hsub =3D 2,
+		.vsub =3D 2,
+		.flags =3D ROTATE_FLAG_YUV | ROTATE_FLAG_OUTPUT
+	},
+};
+
+const struct rotate_format *rotate_find_format(u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(rotate_formats); i++)
+		if (rotate_formats[i].fourcc =3D=3D pixelformat)
+			return &rotate_formats[i];
+
+	return NULL;
+}
+
+int rotate_enum_fmt(struct v4l2_fmtdesc *f, bool dst)
+{
+	int i, index;
+
+	index =3D 0;
+
+	for (i =3D 0; i < ARRAY_SIZE(rotate_formats); i++) {
+		/* not all formats can be used for capture buffers */
+		if (dst && !(rotate_formats[i].flags & ROTATE_FLAG_OUTPUT))
+			continue;
+
+		if (index =3D=3D f->index) {
+			f->pixelformat =3D rotate_formats[i].fourcc;
+
+			return 0;
+		}
+
+		index++;
+	}
+
+	return -EINVAL;
+}
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h b/=
drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h
new file mode 100644
index 000000000000..697cd5fadd5f
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2020 Jernej Skrabec <jernej.skrabec@siol.net> */
+
+#ifndef _SUN8I_FORMATS_H_
+#define _SUN8I_FORMATS_H_
+
+#include <linux/videodev2.h>
+
+#define ROTATE_FLAG_YUV    BIT(0)
+#define ROTATE_FLAG_OUTPUT BIT(1)
+
+struct rotate_format {
+	u32 fourcc;
+	u32 hw_format;
+	int planes;
+	int bpp[3];
+	int hsub;
+	int vsub;
+	unsigned int flags;
+};
+
+const struct rotate_format *rotate_find_format(u32 pixelformat);
+int rotate_enum_fmt(struct v4l2_fmtdesc *f, bool dst);
+
+#endif
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.c b/d=
rivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.c
new file mode 100644
index 000000000000..63bfa349d2b8
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.c
@@ -0,0 +1,924 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner sun8i DE2 rotation driver
+ *
+ * Copyright (C) 2020 Jernej Skrabec <jernej.skrabec@siol.net>
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "sun8i-formats.h"
+#include "sun8i-rotate.h"
+
+static inline u32 rotate_read(struct rotate_dev *dev, u32 reg)
+{
+	return readl(dev->base + reg);
+}
+
+static inline void rotate_write(struct rotate_dev *dev, u32 reg, u32 val=
ue)
+{
+	writel(value, dev->base + reg);
+}
+
+static inline void rotate_set_bits(struct rotate_dev *dev, u32 reg, u32 =
bits)
+{
+	writel(readl(dev->base + reg) | bits, dev->base + reg);
+}
+
+static void rotate_calc_addr_pitch(dma_addr_t buffer,
+				   u32 bytesperline, u32 height,
+				   const struct rotate_format *fmt,
+				   dma_addr_t *addr, u32 *pitch)
+{
+	u32 size;
+	int i;
+
+	for (i =3D 0; i < fmt->planes; i++) {
+		pitch[i] =3D bytesperline;
+		addr[i] =3D buffer;
+		if (i > 0)
+			pitch[i] /=3D fmt->hsub / fmt->bpp[i];
+		size =3D pitch[i] * height;
+		if (i > 0)
+			size /=3D fmt->vsub;
+		buffer +=3D size;
+	}
+}
+
+static void rotate_device_run(void *priv)
+{
+	struct rotate_ctx *ctx =3D priv;
+	struct rotate_dev *dev =3D ctx->dev;
+	struct vb2_v4l2_buffer *src, *dst;
+	const struct rotate_format *fmt;
+	dma_addr_t addr[3];
+	u32 val, pitch[3];
+
+	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	v4l2_m2m_buf_copy_metadata(src, dst, true);
+
+	val =3D ROTATE_GLB_CTL_MODE(ROTATE_MODE_COPY_ROTATE);
+	if (ctx->hflip)
+		val |=3D ROTATE_GLB_CTL_HFLIP;
+	if (ctx->vflip)
+		val |=3D ROTATE_GLB_CTL_VFLIP;
+	val |=3D ROTATE_GLB_CTL_ROTATION(ctx->rotate / 90);
+	if (ctx->rotate !=3D 90 && ctx->rotate !=3D 270)
+		val |=3D ROTATE_GLB_CTL_BURST_LEN(ROTATE_BURST_64);
+	else
+		val |=3D ROTATE_GLB_CTL_BURST_LEN(ROTATE_BURST_8);
+	rotate_write(dev, ROTATE_GLB_CTL, val);
+
+	fmt =3D rotate_find_format(ctx->src_fmt.pixelformat);
+	if (!fmt)
+		return;
+
+	rotate_write(dev, ROTATE_IN_FMT, ROTATE_IN_FMT_FORMAT(fmt->hw_format));
+
+	rotate_calc_addr_pitch(vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0),
+			       ctx->src_fmt.bytesperline, ctx->src_fmt.height,
+			       fmt, addr, pitch);
+
+	rotate_write(dev, ROTATE_IN_SIZE,
+		     ROTATE_SIZE(ctx->src_fmt.width, ctx->src_fmt.height));
+
+	rotate_write(dev, ROTATE_IN_PITCH0, pitch[0]);
+	rotate_write(dev, ROTATE_IN_PITCH1, pitch[1]);
+	rotate_write(dev, ROTATE_IN_PITCH2, pitch[2]);
+
+	rotate_write(dev, ROTATE_IN_ADDRL0, addr[0]);
+	rotate_write(dev, ROTATE_IN_ADDRL1, addr[1]);
+	rotate_write(dev, ROTATE_IN_ADDRL2, addr[2]);
+
+	rotate_write(dev, ROTATE_IN_ADDRH0, 0);
+	rotate_write(dev, ROTATE_IN_ADDRH1, 0);
+	rotate_write(dev, ROTATE_IN_ADDRH2, 0);
+
+	fmt =3D rotate_find_format(ctx->dst_fmt.pixelformat);
+	if (!fmt)
+		return;
+
+	rotate_calc_addr_pitch(vb2_dma_contig_plane_dma_addr(&dst->vb2_buf, 0),
+			       ctx->dst_fmt.bytesperline, ctx->dst_fmt.height,
+			       fmt, addr, pitch);
+
+	rotate_write(dev, ROTATE_OUT_SIZE,
+		     ROTATE_SIZE(ctx->dst_fmt.width, ctx->dst_fmt.height));
+
+	rotate_write(dev, ROTATE_OUT_PITCH0, pitch[0]);
+	rotate_write(dev, ROTATE_OUT_PITCH1, pitch[1]);
+	rotate_write(dev, ROTATE_OUT_PITCH2, pitch[2]);
+
+	rotate_write(dev, ROTATE_OUT_ADDRL0, addr[0]);
+	rotate_write(dev, ROTATE_OUT_ADDRL1, addr[1]);
+	rotate_write(dev, ROTATE_OUT_ADDRL2, addr[2]);
+
+	rotate_write(dev, ROTATE_OUT_ADDRH0, 0);
+	rotate_write(dev, ROTATE_OUT_ADDRH1, 0);
+	rotate_write(dev, ROTATE_OUT_ADDRH2, 0);
+
+	rotate_set_bits(dev, ROTATE_INT, ROTATE_INT_FINISH_IRQ_EN);
+	rotate_set_bits(dev, ROTATE_GLB_CTL, ROTATE_GLB_CTL_START);
+}
+
+static irqreturn_t rotate_irq(int irq, void *data)
+{
+	struct vb2_v4l2_buffer *buffer;
+	struct rotate_dev *dev =3D data;
+	struct rotate_ctx *ctx;
+	unsigned int val;
+
+	ctx =3D v4l2_m2m_get_curr_priv(dev->m2m_dev);
+	if (!ctx) {
+		v4l2_err(&dev->v4l2_dev,
+			 "Instance released before the end of transaction\n");
+		return IRQ_NONE;
+	}
+
+	val =3D rotate_read(dev, ROTATE_INT);
+	if (!(val & ROTATE_INT_FINISH_IRQ))
+		return IRQ_NONE;
+
+	/* clear flag and disable irq */
+	rotate_write(dev, ROTATE_INT, ROTATE_INT_FINISH_IRQ);
+
+	buffer =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_DONE);
+
+	buffer =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_DONE);
+
+	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+
+	return IRQ_HANDLED;
+}
+
+static inline struct rotate_ctx *rotate_file2ctx(struct file *file)
+{
+	return container_of(file->private_data, struct rotate_ctx, fh);
+}
+
+static void rotate_prepare_format(struct v4l2_pix_format *pix_fmt)
+{
+	unsigned int height, width, alignment, sizeimage, size, bpl;
+	const struct rotate_format *fmt;
+	int i;
+
+	fmt =3D rotate_find_format(pix_fmt->pixelformat);
+	if (!fmt)
+		return;
+
+	width =3D ALIGN(pix_fmt->width, fmt->hsub);
+	height =3D ALIGN(pix_fmt->height, fmt->vsub);
+
+	/* all pitches have to be 16 byte aligned */
+	alignment =3D 16;
+	if (fmt->planes > 1)
+		alignment *=3D fmt->hsub / fmt->bpp[1];
+	bpl =3D ALIGN(width * fmt->bpp[0], alignment);
+
+	sizeimage =3D 0;
+	for (i =3D 0; i < fmt->planes; i++) {
+		size =3D bpl * height;
+		if (i > 0) {
+			size *=3D fmt->bpp[i];
+			size /=3D fmt->hsub;
+			size /=3D fmt->vsub;
+		}
+		sizeimage +=3D size;
+	}
+
+	pix_fmt->width =3D width;
+	pix_fmt->height =3D height;
+	pix_fmt->bytesperline =3D bpl;
+	pix_fmt->sizeimage =3D sizeimage;
+}
+
+static int rotate_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, ROTATE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, ROTATE_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", ROTATE_NAME);
+
+	return 0;
+}
+
+static int rotate_enum_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	return rotate_enum_fmt(f, true);
+}
+
+static int rotate_enum_fmt_vid_out(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	return rotate_enum_fmt(f, false);
+}
+
+static int rotate_enum_framesizes(struct file *file, void *priv,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	const struct rotate_format *fmt;
+
+	if (fsize->index !=3D 0)
+		return -EINVAL;
+
+	fmt =3D rotate_find_format(fsize->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width =3D ROTATE_MIN_WIDTH;
+	fsize->stepwise.min_height =3D ROTATE_MIN_HEIGHT;
+	fsize->stepwise.max_width =3D ROTATE_MAX_WIDTH;
+	fsize->stepwise.max_height =3D ROTATE_MAX_HEIGHT;
+	fsize->stepwise.step_width =3D fmt->hsub;
+	fsize->stepwise.step_height =3D fmt->vsub;
+
+	return 0;
+}
+
+static int rotate_set_cap_format(struct rotate_ctx *ctx,
+				 struct v4l2_pix_format *f,
+				 u32 rotate)
+{
+	const struct rotate_format *fmt;
+
+	fmt =3D rotate_find_format(ctx->src_fmt.pixelformat);
+	if (!fmt)
+		return -EINVAL;
+
+	if (fmt->flags & ROTATE_FLAG_YUV)
+		f->pixelformat =3D V4L2_PIX_FMT_YUV420;
+	else
+		f->pixelformat =3D ctx->src_fmt.pixelformat;
+
+	f->field =3D V4L2_FIELD_NONE;
+
+	if (rotate =3D=3D 90 || rotate =3D=3D 270) {
+		f->width =3D ctx->src_fmt.height;
+		f->height =3D ctx->src_fmt.width;
+	} else {
+		f->width =3D ctx->src_fmt.width;
+		f->height =3D ctx->src_fmt.height;
+	}
+
+	rotate_prepare_format(f);
+
+	return 0;
+}
+
+static int rotate_g_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rotate_ctx *ctx =3D rotate_file2ctx(file);
+
+	f->fmt.pix =3D ctx->dst_fmt;
+
+	return 0;
+}
+
+static int rotate_g_fmt_vid_out(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rotate_ctx *ctx =3D rotate_file2ctx(file);
+
+	f->fmt.pix =3D ctx->src_fmt;
+
+	return 0;
+}
+
+static int rotate_try_fmt_vid_cap(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct rotate_ctx *ctx =3D rotate_file2ctx(file);
+
+	return rotate_set_cap_format(ctx, &f->fmt.pix, ctx->rotate);
+}
+
+static int rotate_try_fmt_vid_out(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	if (!rotate_find_format(f->fmt.pix.pixelformat))
+		f->fmt.pix.pixelformat =3D V4L2_PIX_FMT_ARGB32;
+
+	if (f->fmt.pix.width < ROTATE_MIN_WIDTH)
+		f->fmt.pix.width =3D ROTATE_MIN_WIDTH;
+	if (f->fmt.pix.height < ROTATE_MIN_HEIGHT)
+		f->fmt.pix.height =3D ROTATE_MIN_HEIGHT;
+
+	if (f->fmt.pix.width > ROTATE_MAX_WIDTH)
+		f->fmt.pix.width =3D ROTATE_MAX_WIDTH;
+	if (f->fmt.pix.height > ROTATE_MAX_HEIGHT)
+		f->fmt.pix.height =3D ROTATE_MAX_HEIGHT;
+
+	f->fmt.pix.field =3D V4L2_FIELD_NONE;
+
+	rotate_prepare_format(&f->fmt.pix);
+
+	return 0;
+}
+
+static int rotate_s_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rotate_ctx *ctx =3D rotate_file2ctx(file);
+	struct vb2_queue *vq;
+	int ret;
+
+	ret =3D rotate_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	ctx->dst_fmt =3D f->fmt.pix;
+
+	return 0;
+}
+
+static int rotate_s_fmt_vid_out(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rotate_ctx *ctx =3D rotate_file2ctx(file);
+	struct vb2_queue *vq;
+	int ret;
+
+	ret =3D rotate_try_fmt_vid_out(file, priv, f);
+	if (ret)
+		return ret;
+
+	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	/*
+	 * Capture queue has to be also checked, because format and size
+	 * depends on output format and size.
+	 */
+	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	ctx->src_fmt =3D f->fmt.pix;
+
+	/* Propagate colorspace information to capture. */
+	ctx->dst_fmt.colorspace =3D f->fmt.pix.colorspace;
+	ctx->dst_fmt.xfer_func =3D f->fmt.pix.xfer_func;
+	ctx->dst_fmt.ycbcr_enc =3D f->fmt.pix.ycbcr_enc;
+	ctx->dst_fmt.quantization =3D f->fmt.pix.quantization;
+
+	return rotate_set_cap_format(ctx, &ctx->dst_fmt, ctx->rotate);
+}
+
+static const struct v4l2_ioctl_ops rotate_ioctl_ops =3D {
+	.vidioc_querycap		=3D rotate_querycap,
+
+	.vidioc_enum_framesizes		=3D rotate_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap	=3D rotate_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap		=3D rotate_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		=3D rotate_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		=3D rotate_s_fmt_vid_cap,
+
+	.vidioc_enum_fmt_vid_out	=3D rotate_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out		=3D rotate_g_fmt_vid_out,
+	.vidioc_try_fmt_vid_out		=3D rotate_try_fmt_vid_out,
+	.vidioc_s_fmt_vid_out		=3D rotate_s_fmt_vid_out,
+
+	.vidioc_reqbufs			=3D v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		=3D v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf			=3D v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			=3D v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf		=3D v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs		=3D v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf			=3D v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_streamon		=3D v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		=3D v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_log_status		=3D v4l2_ctrl_log_status,
+	.vidioc_subscribe_event		=3D v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	=3D v4l2_event_unsubscribe,
+};
+
+static int rotate_queue_setup(struct vb2_queue *vq, unsigned int *nbuffe=
rs,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct rotate_ctx *ctx =3D vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix_fmt;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		pix_fmt =3D &ctx->src_fmt;
+	else
+		pix_fmt =3D &ctx->dst_fmt;
+
+	if (*nplanes) {
+		if (sizes[0] < pix_fmt->sizeimage)
+			return -EINVAL;
+	} else {
+		sizes[0] =3D pix_fmt->sizeimage;
+		*nplanes =3D 1;
+	}
+
+	return 0;
+}
+
+static int rotate_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq =3D vb->vb2_queue;
+	struct rotate_ctx *ctx =3D vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix_fmt;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		pix_fmt =3D &ctx->src_fmt;
+	else
+		pix_fmt =3D &ctx->dst_fmt;
+
+	if (vb2_plane_size(vb, 0) < pix_fmt->sizeimage)
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
+
+	return 0;
+}
+
+static void rotate_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct rotate_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static void rotate_queue_cleanup(struct vb2_queue *vq, u32 state)
+{
+	struct rotate_ctx *ctx =3D vb2_get_drv_priv(vq);
+	struct vb2_v4l2_buffer *vbuf;
+
+	do {
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+		if (vbuf)
+			v4l2_m2m_buf_done(vbuf, state);
+	} while (vbuf);
+}
+
+static int rotate_start_streaming(struct vb2_queue *vq, unsigned int cou=
nt)
+{
+	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		struct rotate_ctx *ctx =3D vb2_get_drv_priv(vq);
+		struct device *dev =3D ctx->dev->dev;
+		int ret;
+
+		ret =3D pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			dev_err(dev, "Failed to enable module\n");
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void rotate_stop_streaming(struct vb2_queue *vq)
+{
+	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		struct rotate_ctx *ctx =3D vb2_get_drv_priv(vq);
+
+		pm_runtime_put(ctx->dev->dev);
+	}
+
+	rotate_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops rotate_qops =3D {
+	.queue_setup		=3D rotate_queue_setup,
+	.buf_prepare		=3D rotate_buf_prepare,
+	.buf_queue		=3D rotate_buf_queue,
+	.start_streaming	=3D rotate_start_streaming,
+	.stop_streaming		=3D rotate_stop_streaming,
+	.wait_prepare		=3D vb2_ops_wait_prepare,
+	.wait_finish		=3D vb2_ops_wait_finish,
+};
+
+static int rotate_queue_init(void *priv, struct vb2_queue *src_vq,
+			     struct vb2_queue *dst_vq)
+{
+	struct rotate_ctx *ctx =3D priv;
+	int ret;
+
+	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv =3D ctx;
+	src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
+	src_vq->min_buffers_needed =3D 1;
+	src_vq->ops =3D &rotate_qops;
+	src_vq->mem_ops =3D &vb2_dma_contig_memops;
+	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock =3D &ctx->dev->dev_mutex;
+	src_vq->dev =3D ctx->dev->dev;
+
+	ret =3D vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv =3D ctx;
+	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
+	dst_vq->min_buffers_needed =3D 2;
+	dst_vq->ops =3D &rotate_qops;
+	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
+	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock =3D &ctx->dev->dev_mutex;
+	dst_vq->dev =3D ctx->dev->dev;
+
+	ret =3D vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rotate_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct rotate_ctx *ctx =3D container_of(ctrl->handler,
+					      struct rotate_ctx,
+					      ctrl_handler);
+	struct v4l2_pix_format fmt;
+
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		ctx->hflip =3D ctrl->val;
+		break;
+	case V4L2_CID_VFLIP:
+		ctx->vflip =3D ctrl->val;
+		break;
+	case V4L2_CID_ROTATE:
+		rotate_set_cap_format(ctx, &fmt, ctrl->val);
+
+		/* Check if capture format needs to be changed */
+		if (fmt.width !=3D ctx->dst_fmt.width ||
+		    fmt.height !=3D ctx->dst_fmt.height ||
+		    fmt.bytesperline !=3D ctx->dst_fmt.bytesperline ||
+		    fmt.sizeimage !=3D ctx->dst_fmt.sizeimage) {
+			struct vb2_queue *vq;
+
+			vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					     V4L2_BUF_TYPE_VIDEO_CAPTURE);
+			if (vb2_is_busy(vq))
+				return -EBUSY;
+
+			rotate_set_cap_format(ctx, &ctx->dst_fmt, ctrl->val);
+		}
+
+		ctx->rotate =3D ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops rotate_ctrl_ops =3D {
+	.s_ctrl =3D rotate_s_ctrl,
+};
+
+static int rotate_setup_ctrls(struct rotate_ctx *ctx)
+{
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 3);
+
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rotate_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rotate_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rotate_ctrl_ops,
+			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+
+	if (ctx->ctrl_handler.error) {
+		int err =3D ctx->ctrl_handler.error;
+
+		v4l2_err(&ctx->dev->v4l2_dev, "control setup failed!\n");
+		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+		return err;
+	}
+
+	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
+}
+
+static int rotate_open(struct file *file)
+{
+	struct rotate_dev *dev =3D video_drvdata(file);
+	struct rotate_ctx *ctx =3D NULL;
+	int ret;
+
+	if (mutex_lock_interruptible(&dev->dev_mutex))
+		return -ERESTARTSYS;
+
+	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		mutex_unlock(&dev->dev_mutex);
+		return -ENOMEM;
+	}
+
+	/* default output format */
+	ctx->src_fmt.pixelformat =3D V4L2_PIX_FMT_ARGB32;
+	ctx->src_fmt.field =3D V4L2_FIELD_NONE;
+	ctx->src_fmt.width =3D 640;
+	ctx->src_fmt.height =3D 480;
+	rotate_prepare_format(&ctx->src_fmt);
+
+	/* default capture format */
+	rotate_set_cap_format(ctx, &ctx->dst_fmt, ctx->rotate);
+
+	v4l2_fh_init(&ctx->fh, video_devdata(file));
+	file->private_data =3D &ctx->fh;
+	ctx->dev =3D dev;
+
+	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev, ctx,
+					    &rotate_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
+		goto err_free;
+	}
+
+	v4l2_fh_add(&ctx->fh);
+
+	ret =3D rotate_setup_ctrls(ctx);
+	if (ret)
+		goto err_free;
+
+	ctx->fh.ctrl_handler =3D &ctx->ctrl_handler;
+
+	mutex_unlock(&dev->dev_mutex);
+
+	return 0;
+
+err_free:
+	kfree(ctx);
+	mutex_unlock(&dev->dev_mutex);
+
+	return ret;
+}
+
+static int rotate_release(struct file *file)
+{
+	struct rotate_dev *dev =3D video_drvdata(file);
+	struct rotate_ctx *ctx =3D container_of(file->private_data,
+						   struct rotate_ctx, fh);
+
+	mutex_lock(&dev->dev_mutex);
+
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+
+	kfree(ctx);
+
+	mutex_unlock(&dev->dev_mutex);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations rotate_fops =3D {
+	.owner		=3D THIS_MODULE,
+	.open		=3D rotate_open,
+	.release	=3D rotate_release,
+	.poll		=3D v4l2_m2m_fop_poll,
+	.unlocked_ioctl	=3D video_ioctl2,
+	.mmap		=3D v4l2_m2m_fop_mmap,
+};
+
+static const struct video_device rotate_video_device =3D {
+	.name		=3D ROTATE_NAME,
+	.vfl_dir	=3D VFL_DIR_M2M,
+	.fops		=3D &rotate_fops,
+	.ioctl_ops	=3D &rotate_ioctl_ops,
+	.minor		=3D -1,
+	.release	=3D video_device_release_empty,
+	.device_caps	=3D V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
+};
+
+static const struct v4l2_m2m_ops rotate_m2m_ops =3D {
+	.device_run	=3D rotate_device_run,
+};
+
+static int rotate_probe(struct platform_device *pdev)
+{
+	struct rotate_dev *dev;
+	struct video_device *vfd;
+	int irq, ret;
+
+	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->vfd =3D rotate_video_device;
+	dev->dev =3D &pdev->dev;
+
+	irq =3D platform_get_irq(pdev, 0);
+	if (irq <=3D 0) {
+		dev_err(dev->dev, "Failed to get IRQ\n");
+
+		return irq;
+	}
+
+	ret =3D devm_request_irq(dev->dev, irq, rotate_irq,
+			       0, dev_name(dev->dev), dev);
+	if (ret) {
+		dev_err(dev->dev, "Failed to request IRQ\n");
+
+		return ret;
+	}
+
+	dev->base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->base))
+		return PTR_ERR(dev->base);
+
+	dev->bus_clk =3D devm_clk_get(dev->dev, "bus");
+	if (IS_ERR(dev->bus_clk)) {
+		dev_err(dev->dev, "Failed to get bus clock\n");
+
+		return PTR_ERR(dev->bus_clk);
+	}
+
+	dev->mod_clk =3D devm_clk_get(dev->dev, "mod");
+	if (IS_ERR(dev->mod_clk)) {
+		dev_err(dev->dev, "Failed to get mod clock\n");
+
+		return PTR_ERR(dev->mod_clk);
+	}
+
+	dev->rstc =3D devm_reset_control_get(dev->dev, NULL);
+	if (IS_ERR(dev->rstc)) {
+		dev_err(dev->dev, "Failed to get reset control\n");
+
+		return PTR_ERR(dev->rstc);
+	}
+
+	mutex_init(&dev->dev_mutex);
+
+	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		dev_err(dev->dev, "Failed to register V4L2 device\n");
+
+		return ret;
+	}
+
+	vfd =3D &dev->vfd;
+	vfd->lock =3D &dev->dev_mutex;
+	vfd->v4l2_dev =3D &dev->v4l2_dev;
+
+	snprintf(vfd->name, sizeof(vfd->name), "%s",
+		 rotate_video_device.name);
+	video_set_drvdata(vfd, dev);
+
+	ret =3D video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
+
+		goto err_v4l2;
+	}
+
+	v4l2_info(&dev->v4l2_dev,
+		  "Device registered as /dev/video%d\n", vfd->num);
+
+	dev->m2m_dev =3D v4l2_m2m_init(&rotate_m2m_ops);
+	if (IS_ERR(dev->m2m_dev)) {
+		v4l2_err(&dev->v4l2_dev,
+			 "Failed to initialize V4L2 M2M device\n");
+		ret =3D PTR_ERR(dev->m2m_dev);
+
+		goto err_video;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	pm_runtime_enable(dev->dev);
+
+	return 0;
+
+err_video:
+	video_unregister_device(&dev->vfd);
+err_v4l2:
+	v4l2_device_unregister(&dev->v4l2_dev);
+
+	return ret;
+}
+
+static int rotate_remove(struct platform_device *pdev)
+{
+	struct rotate_dev *dev =3D platform_get_drvdata(pdev);
+
+	v4l2_m2m_release(dev->m2m_dev);
+	video_unregister_device(&dev->vfd);
+	v4l2_device_unregister(&dev->v4l2_dev);
+
+	pm_runtime_force_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static int rotate_runtime_resume(struct device *device)
+{
+	struct rotate_dev *dev =3D dev_get_drvdata(device);
+	int ret;
+
+	ret =3D clk_prepare_enable(dev->bus_clk);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable bus clock\n");
+
+		return ret;
+	}
+
+	ret =3D clk_prepare_enable(dev->mod_clk);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable mod clock\n");
+
+		goto err_bus_clk;
+	}
+
+	ret =3D reset_control_deassert(dev->rstc);
+	if (ret) {
+		dev_err(dev->dev, "Failed to apply reset\n");
+
+		goto err_mod_clk;
+	}
+
+	return 0;
+
+err_mod_clk:
+	clk_disable_unprepare(dev->mod_clk);
+err_bus_clk:
+	clk_disable_unprepare(dev->bus_clk);
+
+	return ret;
+}
+
+static int rotate_runtime_suspend(struct device *device)
+{
+	struct rotate_dev *dev =3D dev_get_drvdata(device);
+
+	reset_control_assert(dev->rstc);
+
+	clk_disable_unprepare(dev->mod_clk);
+	clk_disable_unprepare(dev->bus_clk);
+
+	return 0;
+}
+
+static const struct of_device_id rotate_dt_match[] =3D {
+	{ .compatible =3D "allwinner,sun8i-a83t-de2-rotate" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rotate_dt_match);
+
+static const struct dev_pm_ops rotate_pm_ops =3D {
+	.runtime_resume		=3D rotate_runtime_resume,
+	.runtime_suspend	=3D rotate_runtime_suspend,
+};
+
+static struct platform_driver rotate_driver =3D {
+	.probe		=3D rotate_probe,
+	.remove		=3D rotate_remove,
+	.driver		=3D {
+		.name		=3D ROTATE_NAME,
+		.of_match_table	=3D rotate_dt_match,
+		.pm		=3D &rotate_pm_ops,
+	},
+};
+module_platform_driver(rotate_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@siol.net>");
+MODULE_DESCRIPTION("Allwinner DE2 rotate driver");
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h b/d=
rivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
new file mode 100644
index 000000000000..32ade97ba572
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Allwinner DE2 rotation driver
+ *
+ * Copyright (C) 2020 Jernej Skrabec <jernej.skrabec@siol.net>
+ */
+
+#ifndef _SUN8I_ROTATE_H_
+#define _SUN8I_ROTATE_H_
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include <linux/platform_device.h>
+
+#define ROTATE_NAME		"sun8i-rotate"
+
+#define ROTATE_GLB_CTL			0x00
+#define ROTATE_GLB_CTL_START			BIT(31)
+#define ROTATE_GLB_CTL_RESET			BIT(30)
+#define ROTATE_GLB_CTL_BURST_LEN(x)		((x) << 16)
+#define ROTATE_GLB_CTL_HFLIP			BIT(7)
+#define ROTATE_GLB_CTL_VFLIP			BIT(6)
+#define ROTATE_GLB_CTL_ROTATION(x)		((x) << 4)
+#define ROTATE_GLB_CTL_MODE(x)			((x) << 0)
+
+#define ROTATE_INT			0x04
+#define ROTATE_INT_FINISH_IRQ_EN		BIT(16)
+#define ROTATE_INT_FINISH_IRQ			BIT(0)
+
+#define ROTATE_IN_FMT			0x20
+#define ROTATE_IN_FMT_FORMAT(x)			((x) << 0)
+
+#define ROTATE_IN_SIZE			0x24
+#define ROTATE_IN_PITCH0		0x30
+#define ROTATE_IN_PITCH1		0x34
+#define ROTATE_IN_PITCH2		0x38
+#define ROTATE_IN_ADDRL0		0x40
+#define ROTATE_IN_ADDRH0		0x44
+#define ROTATE_IN_ADDRL1		0x48
+#define ROTATE_IN_ADDRH1		0x4c
+#define ROTATE_IN_ADDRL2		0x50
+#define ROTATE_IN_ADDRH2		0x54
+#define ROTATE_OUT_SIZE			0x84
+#define ROTATE_OUT_PITCH0		0x90
+#define ROTATE_OUT_PITCH1		0x94
+#define ROTATE_OUT_PITCH2		0x98
+#define ROTATE_OUT_ADDRL0		0xA0
+#define ROTATE_OUT_ADDRH0		0xA4
+#define ROTATE_OUT_ADDRL1		0xA8
+#define ROTATE_OUT_ADDRH1		0xAC
+#define ROTATE_OUT_ADDRL2		0xB0
+#define ROTATE_OUT_ADDRH2		0xB4
+
+#define ROTATE_BURST_8			0x07
+#define ROTATE_BURST_16			0x0f
+#define ROTATE_BURST_32			0x1f
+#define ROTATE_BURST_64			0x3f
+
+#define ROTATE_MODE_COPY_ROTATE		0x01
+
+#define ROTATE_FORMAT_ARGB32		0x00
+#define ROTATE_FORMAT_ABGR32		0x01
+#define ROTATE_FORMAT_RGBA32		0x02
+#define ROTATE_FORMAT_BGRA32		0x03
+#define ROTATE_FORMAT_XRGB32		0x04
+#define ROTATE_FORMAT_XBGR32		0x05
+#define ROTATE_FORMAT_RGBX32		0x06
+#define ROTATE_FORMAT_BGRX32		0x07
+#define ROTATE_FORMAT_RGB24		0x08
+#define ROTATE_FORMAT_BGR24		0x09
+#define ROTATE_FORMAT_RGB565		0x0a
+#define ROTATE_FORMAT_BGR565		0x0b
+#define ROTATE_FORMAT_ARGB4444		0x0c
+#define ROTATE_FORMAT_ABGR4444		0x0d
+#define ROTATE_FORMAT_RGBA4444		0x0e
+#define ROTATE_FORMAT_BGRA4444		0x0f
+#define ROTATE_FORMAT_ARGB1555		0x10
+#define ROTATE_FORMAT_ABGR1555		0x11
+#define ROTATE_FORMAT_RGBA5551		0x12
+#define ROTATE_FORMAT_BGRA5551		0x13
+
+#define ROTATE_FORMAT_YUYV		0x20
+#define ROTATE_FORMAT_UYVY		0x21
+#define ROTATE_FORMAT_YVYU		0x22
+#define ROTATE_FORMAT_VYUV		0x23
+#define ROTATE_FORMAT_NV61		0x24
+#define ROTATE_FORMAT_NV16		0x25
+#define ROTATE_FORMAT_YUV422P		0x26
+#define ROTATE_FORMAT_NV21		0x28
+#define ROTATE_FORMAT_NV12		0x29
+#define ROTATE_FORMAT_YUV420P		0x2A
+
+#define ROTATE_SIZE(w, h)	(((h) - 1) << 16 | ((w) - 1))
+
+#define ROTATE_MIN_WIDTH	8U
+#define ROTATE_MIN_HEIGHT	8U
+#define ROTATE_MAX_WIDTH	4096U
+#define ROTATE_MAX_HEIGHT	4096U
+
+struct rotate_ctx {
+	struct v4l2_fh		fh;
+	struct rotate_dev	*dev;
+
+	struct v4l2_pix_format	src_fmt;
+	struct v4l2_pix_format	dst_fmt;
+
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	u32 hflip;
+	u32 vflip;
+	u32 rotate;
+};
+
+struct rotate_dev {
+	struct v4l2_device	v4l2_dev;
+	struct video_device	vfd;
+	struct device		*dev;
+	struct v4l2_m2m_dev	*m2m_dev;
+
+	/* Device file mutex */
+	struct mutex		dev_mutex;
+
+	void __iomem		*base;
+
+	struct clk		*bus_clk;
+	struct clk		*mod_clk;
+
+	struct reset_control	*rstc;
+};
+
+#endif
--=20
2.25.0


