Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9872C153A24
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 22:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbgBEVX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 16:23:59 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4134 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbgBEVX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 16:23:58 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3b325b0000>; Wed, 05 Feb 2020 13:23:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Feb 2020 13:23:53 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Feb 2020 13:23:53 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 21:23:53 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Feb 2020 21:23:53 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.216]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e3b32680001>; Wed, 05 Feb 2020 13:23:52 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v2 4/6] media: tegra: Add Tegra210 Video input driver
Date:   Wed, 5 Feb 2020 13:23:24 -0800
Message-ID: <1580937806-17376-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580937819; bh=unfXJMdPZwebjsYYxOZJ1ZJHHuNowduLGod5/Pt2pb4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DRIsnnsYJLWXjCFcpZ3+OpoiP+f8Nb/XXhtL9PXykrS/JZt+3Rdc0oPwm5VKt8xr+
         0ZgcX9Naq1C4UUsaqsx6kltZi2Ek9pifejBEjAUm1Epw2Z292zetEhR6SbXqW2PjF2
         3uX1OSONXdrmq+kLVmJh4Y+kSkIxsxvjFguL9ydyce5eLd2fFcW50H65+mbE9zs8vO
         BwWegMfAlYMlWeykdwdOd/J8GhTjp4uzxeTBsb+kebith01hqhCcWotprgfGqcXcZX
         ysH6d9fRqimqKeb9d76sBcapoOrYshtK0bMy8vgo0/3aK10Gi3GKbXYuxu3STHoqVg
         KakRaXuxqIsKg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 contains a powerful Video Input (VI) hardware controller
which can support up to 6 MIPI CSI camera sensors.

Each Tegra CSI port can be one-to-one mapped to VI channel and can
capture from an external camera sensor connected to CSI or from
built-in test pattern generator.

Tegra210 supports built-in test pattern generator from CSI to VI.

This patch adds a V4L2 media controller and capture driver support
for Tegra210 built-in CSI to VI test pattern generator.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/Kconfig              |   2 +
 drivers/staging/media/Makefile             |   1 +
 drivers/staging/media/tegra/Kconfig        |  10 +
 drivers/staging/media/tegra/Makefile       |   8 +
 drivers/staging/media/tegra/TODO           |  10 +
 drivers/staging/media/tegra/tegra-common.h | 237 +++++++
 drivers/staging/media/tegra/tegra-csi.c    | 374 +++++++++++
 drivers/staging/media/tegra/tegra-csi.h    | 116 ++++
 drivers/staging/media/tegra/tegra-vi.c     | 998 +++++++++++++++++++++++++++++
 drivers/staging/media/tegra/tegra-vi.h     |  82 +++
 drivers/staging/media/tegra/tegra-video.c  | 118 ++++
 drivers/staging/media/tegra/tegra-video.h  |  32 +
 drivers/staging/media/tegra/tegra210.c     | 698 ++++++++++++++++++++
 drivers/staging/media/tegra/tegra210.h     | 190 ++++++
 14 files changed, 2876 insertions(+)
 create mode 100644 drivers/staging/media/tegra/Kconfig
 create mode 100644 drivers/staging/media/tegra/Makefile
 create mode 100644 drivers/staging/media/tegra/TODO
 create mode 100644 drivers/staging/media/tegra/tegra-common.h
 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
 create mode 100644 drivers/staging/media/tegra/tegra-csi.h
 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
 create mode 100644 drivers/staging/media/tegra/tegra-video.c
 create mode 100644 drivers/staging/media/tegra/tegra-video.h
 create mode 100644 drivers/staging/media/tegra/tegra210.c
 create mode 100644 drivers/staging/media/tegra/tegra210.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index c394abffea86..f063511ad4e4 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -32,6 +32,8 @@ source "drivers/staging/media/omap4iss/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
+source "drivers/staging/media/tegra/Kconfig"
+
 source "drivers/staging/media/tegra-vde/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index ea9fce8014bb..d696d059be09 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
+obj-$(CONFIG_VIDEO_TEGRA)	+= tegra/
 obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media/tegra/Kconfig
new file mode 100644
index 000000000000..e54d1baf2fbf
--- /dev/null
+++ b/drivers/staging/media/tegra/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_TEGRA
+	tristate "NVIDIA Tegra VI driver"
+	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CONTROLLER
+	select TEGRA_HOST1X
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Say yes here to enable support for Tegra video input hardware
diff --git a/drivers/staging/media/tegra/Makefile b/drivers/staging/media/tegra/Makefile
new file mode 100644
index 000000000000..488c6efec317
--- /dev/null
+++ b/drivers/staging/media/tegra/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+tegra-video-y := \
+		tegra-video.o \
+		tegra-vi.o \
+		tegra-csi.o \
+		tegra210.o
+
+obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra/TODO b/drivers/staging/media/tegra/TODO
new file mode 100644
index 000000000000..d7d64b13535e
--- /dev/null
+++ b/drivers/staging/media/tegra/TODO
@@ -0,0 +1,10 @@
+TODO list
+* Currently driver supports Tegra build-in TPG Only with direct media links from CSI to VI.
+  Update the driver to do TPG Vs Sensor media links based on the kernel config CONFIG_VIDEO_TEGRA_TPG.
+* Add real camera sensor capture support
+* Add RAW10 packed video format support to Tegra210 video formats
+* Add Tegra CSI MIPI pads calibration
+* Add MIPI clock Settle time computation based on the data rate
+* Add support for Ganged mode
+* Make sure v4l2-compliance tests pass with all of the above implementations.
+* Add SMMU support for VI to avoid cma_alloc failures with higher resolutions of some video formats.
diff --git a/drivers/staging/media/tegra/tegra-common.h b/drivers/staging/media/tegra/tegra-common.h
new file mode 100644
index 000000000000..9e37a54b97a6
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-common.h
@@ -0,0 +1,237 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef __TEGRA_COMMON_H__
+#define __TEGRA_COMMON_H__
+
+#include <linux/host1x.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "tegra-vi.h"
+#include "tegra-csi.h"
+
+#define TEGRA_MIN_WIDTH		32U
+#define TEGRA_MAX_WIDTH		32768U
+#define TEGRA_MIN_HEIGHT	32U
+#define TEGRA_MAX_HEIGHT	32768U
+
+#define TEGRA_DEF_WIDTH		1920
+#define TEGRA_DEF_HEIGHT	1080
+#define TEGRA_IMAGE_FORMAT_DEF	32
+
+#define MAX_FORMAT_NUM		64
+
+/*
+ * VI channel input data type enum.
+ * These data type enum value gets programmed into corresponding Tegra VI
+ * channel register bits.
+ */
+enum tegra_image_dt {
+	TEGRA_IMAGE_DT_YUV420_8 = 24,
+	TEGRA_IMAGE_DT_YUV420_10,
+
+	TEGRA_IMAGE_DT_YUV420CSPS_8 = 28,
+	TEGRA_IMAGE_DT_YUV420CSPS_10,
+	TEGRA_IMAGE_DT_YUV422_8,
+	TEGRA_IMAGE_DT_YUV422_10,
+	TEGRA_IMAGE_DT_RGB444,
+	TEGRA_IMAGE_DT_RGB555,
+	TEGRA_IMAGE_DT_RGB565,
+	TEGRA_IMAGE_DT_RGB666,
+	TEGRA_IMAGE_DT_RGB888,
+
+	TEGRA_IMAGE_DT_RAW6 = 40,
+	TEGRA_IMAGE_DT_RAW7,
+	TEGRA_IMAGE_DT_RAW8,
+	TEGRA_IMAGE_DT_RAW10,
+	TEGRA_IMAGE_DT_RAW12,
+	TEGRA_IMAGE_DT_RAW14,
+};
+
+/*
+ * Pixel memory format enum for Tegra VI channel.
+ * These format enum value gets programmed into corresponding Tegra VI
+ * channel register bits.
+ */
+enum tegra_image_format {
+	TEGRA_IMAGE_FORMAT_T_L8 = 16,
+
+	TEGRA_IMAGE_FORMAT_T_R16_I = 32,
+	TEGRA_IMAGE_FORMAT_T_B5G6R5,
+	TEGRA_IMAGE_FORMAT_T_R5G6B5,
+	TEGRA_IMAGE_FORMAT_T_A1B5G5R5,
+	TEGRA_IMAGE_FORMAT_T_A1R5G5B5,
+	TEGRA_IMAGE_FORMAT_T_B5G5R5A1,
+	TEGRA_IMAGE_FORMAT_T_R5G5B5A1,
+	TEGRA_IMAGE_FORMAT_T_A4B4G4R4,
+	TEGRA_IMAGE_FORMAT_T_A4R4G4B4,
+	TEGRA_IMAGE_FORMAT_T_B4G4R4A4,
+	TEGRA_IMAGE_FORMAT_T_R4G4B4A4,
+
+	TEGRA_IMAGE_FORMAT_T_A8B8G8R8 = 64,
+	TEGRA_IMAGE_FORMAT_T_A8R8G8B8,
+	TEGRA_IMAGE_FORMAT_T_B8G8R8A8,
+	TEGRA_IMAGE_FORMAT_T_R8G8B8A8,
+	TEGRA_IMAGE_FORMAT_T_A2B10G10R10,
+	TEGRA_IMAGE_FORMAT_T_A2R10G10B10,
+	TEGRA_IMAGE_FORMAT_T_B10G10R10A2,
+	TEGRA_IMAGE_FORMAT_T_R10G10B10A2,
+
+	TEGRA_IMAGE_FORMAT_T_A8Y8U8V8 = 193,
+	TEGRA_IMAGE_FORMAT_T_V8U8Y8A8,
+
+	TEGRA_IMAGE_FORMAT_T_A2Y10U10V10 = 197,
+	TEGRA_IMAGE_FORMAT_T_V10U10Y10A2,
+	TEGRA_IMAGE_FORMAT_T_Y8_U8__Y8_V8,
+	TEGRA_IMAGE_FORMAT_T_Y8_V8__Y8_U8,
+	TEGRA_IMAGE_FORMAT_T_U8_Y8__V8_Y8,
+	TEGRA_IMAGE_FORMAT_T_V8_Y8__U8_Y8,
+
+	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N444 = 224,
+	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N444,
+	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N444,
+	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N422,
+	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N422,
+	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N422,
+	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N420,
+	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N420,
+	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N420,
+	TEGRA_IMAGE_FORMAT_T_X2LC10LB10LA10,
+	TEGRA_IMAGE_FORMAT_T_A2R6R6R6R6R6,
+};
+
+/**
+ * struct tegra_video_format - Tegra video format description
+ * @img_dt: image data type
+ * @bit_width: format width in bits per component
+ * @code: media bus format code
+ * @bpp: bytes per pixel (when stored in memory)
+ * @img_fmt: image format
+ * @fourcc: V4L2 pixel format FCC identifier
+ */
+struct tegra_video_format {
+	enum tegra_image_dt img_dt;
+	unsigned int bit_width;
+	unsigned int code;
+	unsigned int bpp;
+	u32 img_fmt;
+	u32 fourcc;
+};
+
+#define	TEGRA_VIDEO_FORMAT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP,	\
+			   FORMAT, FOURCC)				\
+{									\
+	TEGRA_IMAGE_DT_##DATA_TYPE,					\
+	BIT_WIDTH,							\
+	MEDIA_BUS_FMT_##MBUS_CODE,					\
+	BPP,								\
+	TEGRA_IMAGE_FORMAT_##FORMAT,					\
+	V4L2_PIX_FMT_##FOURCC,						\
+}
+
+enum tegra_vi_pg_mode {
+	TEGRA_VI_PG_DISABLED = 0,
+	TEGRA_VI_PG_DIRECT,
+	TEGRA_VI_PG_PATCH,
+};
+
+/**
+ * struct tegra_vi_channel - Tegra video channel
+ * @list: list head for this entry
+ * @video: V4L2 video device associated with the video channel
+ * @video_lock: protects the @format and @queue fields
+ * @pad: media pad for the video device entity
+ *
+ * @vi: composite device DT node port number for the channel
+ * @sp: host1x syncpoint pointer
+ *
+ * @kthread_capture_start: capture start kthread of this video channel
+ * @start_wait: wait queue used by capture start kthread
+ * @kthread_capture_done: capture done kthread of this video channel
+ * @done_wait: wait queue used by capture done kthread
+ *
+ * @format: active V4L2 pixel format
+ * @fmtinfo: format information corresponding to the active @format
+ * @queue: vb2 buffers queue
+ * @sequence: V4L2 buffers sequence number
+ *
+ * @capture: list of queued buffers for capture
+ * @start_lock: protects the capture queued list
+ * @done: list of capture done queued buffers
+ * @done_lock: protects the capture done queue list
+ *
+ * @portno: CSI port number of this video channel
+ *
+ * @ctrl_handler: V4L2 control handler of this video channel
+ * @tpg_fmts_bitmap: a bitmap for supported TPG formats
+ * @pg_mode: test pattern generator mode (disabled/direct/patch)
+ */
+struct tegra_vi_channel {
+	struct list_head list;
+	struct video_device video;
+	/* protects the @format and @queue fields */
+	struct mutex video_lock;
+	struct media_pad pad;
+
+	struct tegra_vi *vi;
+	struct host1x_syncpt *sp;
+
+	struct task_struct *kthread_capture_start;
+	wait_queue_head_t start_wait;
+	struct task_struct *kthread_capture_done;
+	wait_queue_head_t done_wait;
+
+	struct v4l2_pix_format format;
+	const struct tegra_video_format *fmtinfo;
+	struct vb2_queue queue;
+	u32 sequence;
+
+	struct list_head capture;
+	/* protects the capture queued list */
+	spinlock_t start_lock;
+	struct list_head done;
+	/* protects the capture done queue list */
+	spinlock_t done_lock;
+
+	unsigned char portno;
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
+	enum tegra_vi_pg_mode pg_mode;
+};
+
+/**
+ * struct tegra_channel_buffer - video channel buffer
+ * @buf: vb2 buffer base object
+ * @queue: buffer list entry in the channel queued buffers list
+ * @chan: channel that uses the buffer
+ * @addr: Tegra IOVA buffer address for VI output
+ */
+struct tegra_channel_buffer {
+	struct tegra_vi_channel *chan;
+	struct vb2_v4l2_buffer buf;
+	struct list_head queue;
+	dma_addr_t addr;
+};
+
+int tegra_channel_init(struct tegra_vi_channel *chan);
+int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan);
+int tegra_channel_cleanup(struct tegra_vi_channel *chan);
+int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
+void tegra_channel_queued_buf_done(struct tegra_vi_channel *chan,
+				   enum vb2_buffer_state state);
+int tegra_channel_csi_error_status(struct tegra_vi_channel *chan);
+
+#endif
diff --git a/drivers/staging/media/tegra/tegra-csi.c b/drivers/staging/media/tegra/tegra-csi.c
new file mode 100644
index 000000000000..966f0eee57fa
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-csi.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk/tegra.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/host1x.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+
+#include "tegra-video.h"
+#include "tegra-common.h"
+#include "tegra-csi.h"
+
+static inline struct tegra_csi *
+host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
+/*
+ * Only use this subdevice media bus ops for test pattern generator,
+ * because CSI device is an separated subdevice which has 6 source
+ * pads to generate test pattern.
+ */
+static struct v4l2_mbus_framefmt tegra_csi_tpg_fmts[] = {
+	{
+		TEGRA_DEF_WIDTH,
+		TEGRA_DEF_HEIGHT,
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		V4L2_FIELD_NONE,
+		V4L2_COLORSPACE_SRGB
+	},
+	{
+		TEGRA_DEF_WIDTH,
+		TEGRA_DEF_HEIGHT,
+		MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+		V4L2_FIELD_NONE,
+		V4L2_COLORSPACE_SRGB
+	}
+
+};
+
+static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
+	{1280, 720},
+	{1920, 1080},
+	{3840, 2160},
+};
+
+/*
+ * V4L2 Subdevice Video Operations
+ */
+static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
+	struct tegra_vi_channel *chan = subdev->host_priv;
+
+	return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
+}
+
+/*
+ * V4L2 Subdevice Pad Operations
+ */
+
+static int tegra_csi_enum_bus_code(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(tegra_csi_tpg_fmts))
+		return -EINVAL;
+
+	code->code = tegra_csi_tpg_fmts[code->index].code;
+	return 0;
+}
+
+static int tegra_csi_get_format(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_format *fmt)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+
+	fmt->format = csi_chan->format;
+	return 0;
+}
+
+static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
+				   struct v4l2_mbus_framefmt *mfmt)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
+	const struct v4l2_frmsize_discrete *sizes;
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++) {
+		struct v4l2_mbus_framefmt *mbus_fmt = &tegra_csi_tpg_fmts[i];
+
+		if (mfmt->code == mbus_fmt->code) {
+			for (j = 0; j < ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
+				sizes = &tegra_csi_tpg_sizes[j];
+				if (mfmt->width == sizes->width &&
+				    mfmt->height == sizes->height) {
+					return;
+				}
+			}
+		}
+	}
+
+	dev_dbg(csi->dev, "using Tegra default format SRGGB10 1920x1080\n");
+	*mfmt = tegra_csi_tpg_fmts[0];
+}
+
+static int tegra_csi_set_format(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_format *fmt)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct v4l2_mbus_framefmt *format = &fmt->format;
+
+	tegra_csi_try_mbus_fmt(subdev, format);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	csi_chan->format = *format;
+	return 0;
+}
+
+/*
+ * V4L2 Subdevice Operations
+ */
+static struct v4l2_subdev_video_ops tegra_csi_video_ops = {
+	.s_stream = tegra_csi_s_stream,
+};
+
+static struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
+	.enum_mbus_code		= tegra_csi_enum_bus_code,
+	.get_fmt		= tegra_csi_get_format,
+	.set_fmt		= tegra_csi_set_format,
+	.link_validate		= v4l2_subdev_link_validate_default,
+};
+
+static struct v4l2_subdev_ops tegra_csi_ops = {
+	.video  = &tegra_csi_video_ops,
+	.pad    = &tegra_csi_pad_ops,
+};
+
+/*
+ * Media Operations
+ */
+static const struct media_entity_operations tegra_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
+{
+	struct device_node *node = csi->dev->of_node;
+	unsigned int port_num;
+	int ret;
+	struct tegra_csi_channel *item;
+	unsigned int tpg_channels = csi->soc->csi_max_channels;
+
+	/* allocate CSI channel for each CSI x2 ports */
+	for (port_num = 0; port_num < tpg_channels; port_num++) {
+		item = devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
+		if (!item) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		list_add_tail(&item->list, &csi->csi_chans);
+		item->csi = csi;
+		item->csi_port_num = port_num;
+		item->numlanes = 2;
+		item->of_node = node;
+		item->numpads = 1;
+		item->pads[0].flags = MEDIA_PAD_FL_SOURCE;
+	}
+
+	return 0;
+
+error:
+	list_for_each_entry(item, &csi->csi_chans, list)
+		list_del(&item->list);
+	return ret;
+}
+
+static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
+{
+	struct tegra_csi *csi = chan->csi;
+	struct v4l2_subdev *subdev;
+	int ret;
+
+	/* initialize the default format */
+	chan->format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	chan->format.field = V4L2_FIELD_NONE;
+	chan->format.colorspace = V4L2_COLORSPACE_SRGB;
+	chan->format.width = TEGRA_DEF_WIDTH;
+	chan->format.height = TEGRA_DEF_HEIGHT;
+
+	/* initialize V4L2 subdevice and media entity */
+	subdev = &chan->subdev;
+	v4l2_subdev_init(subdev, &tegra_csi_ops);
+	subdev->dev = csi->dev;
+	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
+		 chan->csi_port_num);
+
+	v4l2_set_subdevdata(subdev, chan);
+	subdev->fwnode = of_fwnode_handle(chan->of_node);
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	subdev->entity.ops = &tegra_csi_media_ops;
+	subdev->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* initialize media entity pads */
+	ret = media_entity_pads_init(&subdev->entity, chan->numpads,
+				     chan->pads);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_async_register_subdev(subdev);
+	if (ret < 0) {
+		dev_err(csi->dev, "failed to register subdev: %d\n", ret);
+		media_entity_cleanup(&subdev->entity);
+	}
+
+	return ret;
+}
+
+void tegra_csi_error_status(struct v4l2_subdev *subdev)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
+
+	csi->ops->csi_err_status(csi_chan);
+}
+
+static int tegra_csi_init(struct host1x_client *client)
+{
+	struct tegra_csi *csi = host1x_client_to_csi(client);
+	struct tegra_video_device *vid = dev_get_drvdata(client->host);
+	struct tegra_csi_channel *item;
+	int ret;
+
+	vid->csi = csi;
+
+	INIT_LIST_HEAD(&csi->csi_chans);
+
+	ret = tegra_csi_tpg_channels_alloc(csi);
+	if (ret < 0)
+		return ret;
+
+	list_for_each_entry(item, &csi->csi_chans, list) {
+		ret = tegra_csi_channel_init(item);
+		if (ret)
+			return ret;
+	}
+
+	ret = csi->ops->hw_init(csi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int tegra_csi_exit(struct host1x_client *client)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(client->host);
+	struct v4l2_subdev *subdev;
+	struct tegra_csi_channel *chan;
+
+	if (!vid->csi)
+		return 0;
+
+	list_for_each_entry(chan, &vid->csi->csi_chans, list) {
+		subdev = &chan->subdev;
+		media_entity_cleanup(&subdev->entity);
+		v4l2_async_unregister_subdev(subdev);
+	}
+
+	return 0;
+}
+
+static const struct host1x_client_ops csi_client_ops = {
+	.init = tegra_csi_init,
+	.exit = tegra_csi_exit,
+};
+
+static int tegra_csi_probe(struct platform_device *pdev)
+{
+	struct tegra_csi *csi;
+	struct resource *res;
+	int ret;
+
+	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
+	if (!csi)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	csi->iomem = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(csi->iomem))
+		return PTR_ERR(csi->iomem);
+
+	csi->soc = of_device_get_match_data(&pdev->dev);
+	if (!csi->soc)
+		return -ENODATA;
+
+	csi->dev = &pdev->dev;
+	csi->ops = csi->soc->ops;
+	platform_set_drvdata(pdev, csi);
+
+	/* initialize host1x interface */
+	INIT_LIST_HEAD(&csi->client.list);
+	csi->client.ops = &csi_client_ops;
+	csi->client.dev = &pdev->dev;
+
+	ret = host1x_client_register(&csi->client);
+	if (ret < 0) {
+		dev_err(csi->dev, "failed to register host1x client: %d\n",
+			ret);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int tegra_csi_remove(struct platform_device *pdev)
+{
+	struct tegra_csi *csi = platform_get_drvdata(pdev);
+
+	host1x_client_unregister(&csi->client);
+	return 0;
+}
+
+static const struct tegra_csi_ops tegra210_csi_ops = {
+	.hw_init = tegra210_csi_hw_init,
+	.csi_streaming = tegra210_csi_streaming,
+	.csi_err_status = tegra210_csi_error_status,
+};
+
+static struct tegra_csi_soc tegra210_csi_soc = {
+	.ops = &tegra210_csi_ops,
+	.cil_max_clk_hz = 102000000,
+	.csi_max_channels = 6,
+};
+
+static const struct of_device_id tegra_csi_of_id_table[] = {
+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_csi_of_id_table);
+
+struct platform_driver tegra_csi_driver = {
+	.driver = {
+		.name		= "tegra-csi",
+		.of_match_table	= tegra_csi_of_id_table,
+	},
+	.probe			= tegra_csi_probe,
+	.remove			= tegra_csi_remove,
+};
+
+MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra/tegra-csi.h b/drivers/staging/media/tegra/tegra-csi.h
new file mode 100644
index 000000000000..e42b6ea7378f
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-csi.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef __TEGRA_CSI_H__
+#define __TEGRA_CSI_H__
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/videobuf2-v4l2.h>
+
+/*
+ * Each CSI brick supports max of 4 lanes that can be used as either
+ * one x4 port using both CILA and CILB partitions of a CSI brick or can
+ * be used as two x2 ports with one x2 from CILA and the other x2 from
+ * CILB.
+ */
+#define CSI_PORTS_PER_BRICK	2
+
+/* each CSI channel can have one sink and one source pads */
+#define TEGRA_CSI_PADS_NUM	2
+
+enum tegra_csi_cil_port {
+	PORT_A = 0,
+	PORT_B,
+};
+
+enum tegra_csi_block {
+	CSI_CIL_AB = 0,
+	CSI_CIL_CD,
+	CSI_CIL_EF,
+};
+
+struct tegra_csi;
+
+struct tegra_csi_channel {
+	struct list_head list;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[TEGRA_CSI_PADS_NUM];
+	struct device_node *of_node;
+	struct tegra_csi *csi;
+	unsigned int numlanes;
+	unsigned int numpads;
+	u8 csi_port_num;
+
+	/* one pair of sink/source pad has one format */
+	struct v4l2_mbus_framefmt format;
+};
+
+struct tegra_csi_ops {
+	int (*hw_init)(struct tegra_csi *csi);
+	int (*csi_streaming)(struct tegra_csi_channel *csi_chan, u8 pg_mode,
+			     int enable);
+	void (*csi_err_status)(struct tegra_csi_channel *csi_chan);
+};
+
+/**
+ * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
+ * @ops: csi operations
+ * @cil_max_clk_hz: cil clock max frequency
+ * @csi_max_channels: supported max streaming channels
+ */
+struct tegra_csi_soc {
+	const struct tegra_csi_ops *ops;
+	unsigned int cil_max_clk_hz;
+	unsigned int csi_max_channels;
+};
+
+/**
+ * struct tegra_csi - NVIDIA Tegra CSI device structure
+ * @dev: device struct
+ * @client: host1x_client struct
+ *
+ * @iomem: register base
+ * @csi_clk: clock for CSI
+ * @cilab_clk: clock for CIL AB
+ * @cilcd_clk: clock for CIL CD
+ * @cilef_clk: clock for CIL EF
+ * @tpg_clk: clock for internal CSI TPG logic
+ *
+ * @soc: pointer to SoC data structure
+ * @ops: csi operations
+ *
+ * @channels: list head for CSI channels
+ */
+struct tegra_csi {
+	struct device *dev;
+	struct host1x_client client;
+
+	void __iomem *iomem;
+	struct clk *csi_clk;
+	struct clk *cilab_clk;
+	struct clk *cilcd_clk;
+	struct clk *cilef_clk;
+	struct clk *tpg_clk;
+	atomic_t clk_refcnt;
+
+	const struct tegra_csi_soc *soc;
+	const struct tegra_csi_ops *ops;
+
+	struct list_head csi_chans;
+};
+
+void tegra_csi_error_status(struct v4l2_subdev *subdev);
+
+void tegra210_csi_error_status(struct tegra_csi_channel *csi_chan);
+int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
+			   int enable);
+int tegra210_csi_hw_init(struct tegra_csi *csi);
+
+#endif
diff --git a/drivers/staging/media/tegra/tegra-vi.c b/drivers/staging/media/tegra/tegra-vi.c
new file mode 100644
index 000000000000..619c0b3191e2
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-vi.c
@@ -0,0 +1,998 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/clk.h>
+#include <linux/host1x.h>
+#include <linux/kthread.h>
+#include <linux/lcm.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include <soc/tegra/pmc.h>
+
+#include "tegra-video.h"
+#include "tegra-common.h"
+#include "tegra-vi.h"
+
+#define SURFACE_ALIGN_BYTES		64
+#define MAX_CID_CONTROLS		1
+
+static const struct tegra_video_format tegra_default_format = {
+	.img_dt = TEGRA_IMAGE_DT_RAW10,
+	.bit_width = 10,
+	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	.bpp = 2,
+	.img_fmt = TEGRA_IMAGE_FORMAT_DEF,
+	.fourcc = V4L2_PIX_FMT_SRGGB10,
+};
+
+static inline struct tegra_vi *
+host1x_client_to_vi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_vi, client);
+}
+
+static inline
+struct tegra_vi_channel *to_tegra_vi_channel(struct video_device *vdev)
+{
+	return container_of(vdev, struct tegra_vi_channel, video);
+}
+
+static inline struct tegra_channel_buffer *
+to_tegra_channel_buffer(struct vb2_v4l2_buffer *vb)
+{
+	return container_of(vb, struct tegra_channel_buffer, buf);
+}
+
+static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
+					unsigned int code)
+{
+	unsigned int i;
+
+	for (i = 0; i < vi->soc->nformats; ++i) {
+		if (vi->soc->video_formats[i].code == code)
+			return i;
+	}
+
+	return -1;
+}
+
+static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
+					  unsigned int index)
+{
+	if (index >= vi->soc->nformats)
+		return -EINVAL;
+
+	return vi->soc->video_formats[index].fourcc;
+}
+
+static const struct tegra_video_format *
+tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < vi->soc->nformats; ++i) {
+		if (vi->soc->video_formats[i].fourcc == fourcc)
+			return &vi->soc->video_formats[i];
+	}
+
+	return NULL;
+}
+
+/* VI only support 2 formats in TPG mode */
+static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
+{
+	int index;
+
+	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
+
+	index = tegra_get_format_idx_by_code(chan->vi,
+					     MEDIA_BUS_FMT_SRGGB10_1X10);
+	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+
+	index = tegra_get_format_idx_by_code(chan->vi,
+					     MEDIA_BUS_FMT_RGB888_1X32_PADHI);
+	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+}
+
+/*
+ * videobuf2 queue operations
+ */
+static int tegra_channel_queue_setup(struct vb2_queue *vq,
+				     unsigned int *nbuffers,
+				     unsigned int *nplanes,
+				     unsigned int sizes[],
+				     struct device *alloc_devs[])
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+
+	if (*nplanes)
+		return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
+
+	*nplanes = 1;
+	sizes[0] = chan->format.sizeimage;
+	alloc_devs[0] = chan->vi->dev;
+
+	return 0;
+}
+
+static int tegra_channel_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct tegra_channel_buffer *buf = to_tegra_channel_buffer(vbuf);
+	unsigned long size = chan->format.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		v4l2_err(chan->video.v4l2_dev,
+			 "buffer too small (%lu < %lu)\n",
+			 vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+	buf->chan = chan;
+	buf->addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	return 0;
+}
+
+static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct tegra_channel_buffer *buf = to_tegra_channel_buffer(vbuf);
+
+	/* put buffer into the capture queue */
+	spin_lock(&chan->start_lock);
+	list_add_tail(&buf->queue, &chan->capture);
+	spin_unlock(&chan->start_lock);
+
+	/* wait up kthread for capture */
+	wake_up_interruptible(&chan->start_wait);
+}
+
+static struct v4l2_subdev *
+tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+	struct media_entity *entity;
+
+	pad = media_entity_remote_pad(&chan->pad);
+	entity = pad->entity;
+	subdev = media_entity_to_v4l2_subdev(entity);
+
+	return subdev;
+}
+
+int tegra_channel_csi_error_status(struct tegra_vi_channel *chan)
+{
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_subdev(chan);
+	tegra_csi_error_status(subdev);
+
+	return 0;
+}
+
+int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
+{
+	struct v4l2_subdev *subdev;
+	int ret;
+
+	/* stream CSI */
+	subdev = tegra_channel_get_remote_subdev(chan);
+	v4l2_set_subdev_hostdata(subdev, chan);
+	ret = v4l2_subdev_call(subdev, video, s_stream, on);
+	if (on && ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	return 0;
+}
+
+void tegra_channel_queued_buf_done(struct tegra_vi_channel *chan,
+				   enum vb2_buffer_state state)
+{
+	struct tegra_channel_buffer *buf, *nbuf;
+
+	spin_lock(&chan->start_lock);
+	list_for_each_entry_safe(buf, nbuf, &chan->capture, queue) {
+		vb2_buffer_done(&buf->buf.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+
+	spin_unlock(&chan->start_lock);
+}
+
+static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+
+	return chan->vi->ops->vi_start_streaming(vq, count);
+}
+
+static void tegra_channel_stop_streaming(struct vb2_queue *vq)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+
+	chan->vi->ops->vi_stop_streaming(vq);
+}
+
+static const struct vb2_ops tegra_channel_queue_qops = {
+	.queue_setup = tegra_channel_queue_setup,
+	.buf_prepare = tegra_channel_buffer_prepare,
+	.buf_queue = tegra_channel_buffer_queue,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = tegra_channel_start_streaming,
+	.stop_streaming = tegra_channel_stop_streaming,
+};
+
+/*
+ * V4L2 ioctls
+ */
+static int tegra_channel_querycap(struct file *file, void *fh,
+				  struct v4l2_capability *cap)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct tegra_vi_channel *chan = to_tegra_vi_channel(vfh->vdev);
+
+	strscpy(cap->driver, "tegra-video", sizeof(cap->driver));
+	strscpy(cap->card, chan->video.name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(chan->vi->dev));
+
+	return 0;
+}
+
+static int tegra_channel_enum_format(struct file *file, void *fh,
+				     struct v4l2_fmtdesc *f)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct tegra_vi_channel *chan = to_tegra_vi_channel(vfh->vdev);
+	unsigned int index = 0, i;
+	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
+
+	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+		return -EINVAL;
+
+	for (i = 0; i < f->index + 1; i++, index++)
+		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
+
+	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+
+	return 0;
+}
+
+static int tegra_channel_get_format(struct file *file, void *fh,
+				    struct v4l2_format *format)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct tegra_vi_channel *chan = to_tegra_vi_channel(vfh->vdev);
+
+	format->fmt.pix = chan->format;
+	return 0;
+}
+
+static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
+				      struct v4l2_pix_format *pix,
+				      const struct tegra_video_format **vfmt)
+{
+	const struct tegra_video_format *fmt_info;
+	unsigned int align;
+	unsigned int min_width;
+	unsigned int max_width;
+	unsigned int width;
+	unsigned int min_bpl;
+	unsigned int max_bpl;
+	unsigned int bpl;
+
+	/*
+	 * Retrieve the format information and if requested format isn't
+	 * supported, keep the current format.
+	 */
+	fmt_info = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+	if (!fmt_info) {
+		pix->pixelformat = chan->format.pixelformat;
+		pix->colorspace = chan->format.colorspace;
+		fmt_info = tegra_get_format_by_fourcc(chan->vi,
+						      pix->pixelformat);
+	}
+
+	/*
+	 * The transfer alignment requirements are expressed in bytes. Compute
+	 * minimum and maximum values, clamp the requested width and convert
+	 * it back to pixels. Use bytesperline to adjust the width.
+	 */
+	align = lcm(SURFACE_ALIGN_BYTES, fmt_info->bpp);
+	min_width = roundup(TEGRA_MIN_WIDTH, align);
+	max_width = rounddown(TEGRA_MAX_WIDTH, align);
+	width = roundup(pix->width * fmt_info->bpp, align);
+
+	pix->width = clamp(width, min_width, max_width) / fmt_info->bpp;
+	pix->height = clamp(pix->height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
+
+	/* Clamp the requested bytes per line value. If the maximum bytes per
+	 * line value is zero, the module doesn't support user configurable
+	 * line sizes. Override the requested value with the minimum in that
+	 * cases.
+	 */
+	min_bpl = pix->width * fmt_info->bpp;
+	max_bpl = rounddown(TEGRA_MAX_WIDTH, SURFACE_ALIGN_BYTES);
+	bpl = roundup(pix->bytesperline, SURFACE_ALIGN_BYTES);
+
+	pix->bytesperline = clamp(bpl, min_bpl, max_bpl);
+	pix->sizeimage = pix->bytesperline * pix->height;
+	pix->field = V4L2_FIELD_NONE;
+
+	if (vfmt)
+		*vfmt = fmt_info;
+
+	return 0;
+}
+
+static int tegra_channel_try_format(struct file *file, void *fh,
+				    struct v4l2_format *format)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct tegra_vi_channel *chan = to_tegra_vi_channel(vfh->vdev);
+
+	return __tegra_channel_try_format(chan, &format->fmt.pix, NULL);
+}
+
+static int tegra_channel_set_format(struct file *file, void *fh,
+				    struct v4l2_format *format)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct tegra_vi_channel *chan = to_tegra_vi_channel(vfh->vdev);
+	const struct tegra_video_format *info;
+
+	if (vb2_is_busy(&chan->queue))
+		return -EBUSY;
+
+	/* get supported format by try_fmt */
+	__tegra_channel_try_format(chan, &format->fmt.pix, &info);
+
+	chan->format = format->fmt.pix;
+	chan->fmtinfo = info;
+
+	return 0;
+}
+
+static int tegra_channel_enum_input(struct file *file, void *fh,
+				    struct v4l2_input *inp)
+{
+	/* currently driver supports internal TPG only */
+	if (inp->index)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
+
+	return 0;
+}
+
+static int tegra_channel_g_input(struct file *file, void *priv,
+				 unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int tegra_channel_s_input(struct file *file, void *priv,
+				 unsigned int input)
+{
+	if (input > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
+	.vidioc_querycap		= tegra_channel_querycap,
+	.vidioc_enum_fmt_vid_cap	= tegra_channel_enum_format,
+	.vidioc_g_fmt_vid_cap		= tegra_channel_get_format,
+	.vidioc_s_fmt_vid_cap		= tegra_channel_set_format,
+	.vidioc_try_fmt_vid_cap		= tegra_channel_try_format,
+	.vidioc_enum_input		= tegra_channel_enum_input,
+	.vidioc_g_input			= tegra_channel_g_input,
+	.vidioc_s_input			= tegra_channel_s_input,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/*
+ * V4L2 file operations
+ */
+static const struct v4l2_file_operations tegra_channel_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= video_ioctl2,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.read		= vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+};
+
+static const char *const vi_pattern_strings[] = {
+	"Black/White Direct Mode",
+	"Color Patch Mode",
+};
+
+static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct tegra_vi_channel *chan = container_of(ctrl->handler,
+						     struct tegra_vi_channel,
+						     ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		/* pattern change takes effect on next stream */
+		chan->pg_mode = ctrl->val + 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops vi_ctrl_ops = {
+	.s_ctrl	= vi_s_ctrl,
+};
+
+int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
+{
+	int ret;
+
+	/* add test pattern control handler to v4l2 device */
+	v4l2_ctrl_new_std_menu_items(&chan->ctrl_handler, &vi_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(vi_pattern_strings) - 1,
+				     0, 0, vi_pattern_strings);
+	if (chan->ctrl_handler.error) {
+		dev_err(chan->vi->dev, "failed to add TPG ctrl handler: %d\n",
+			chan->ctrl_handler.error);
+		v4l2_ctrl_handler_free(&chan->ctrl_handler);
+		return chan->ctrl_handler.error;
+	}
+
+	/* setup the controls */
+	ret = v4l2_ctrl_handler_setup(&chan->ctrl_handler);
+	if (ret < 0) {
+		dev_err(chan->vi->dev,
+			"failed to setup v4l2 ctrl handler: %d\n", ret);
+		goto free_hdl;
+	}
+
+	return 0;
+
+free_hdl:
+	v4l2_ctrl_handler_free(&chan->ctrl_handler);
+	return ret;
+}
+
+static int tegra_chan_video_link_validate(struct media_link *link)
+{
+	struct video_device *vdev = container_of(link->sink->entity,
+						 struct video_device, entity);
+	struct tegra_vi_channel *chan = to_tegra_vi_channel(vdev);
+	struct v4l2_subdev_format src_fmt;
+	struct media_pad *src_pad;
+	struct v4l2_subdev *sd;
+
+	if (!media_entity_remote_pad(link->sink->entity->pads)) {
+		dev_err(chan->vi->dev, "video %s pad is not connected\n",
+			vdev->name);
+		return -ENOTCONN;
+	}
+
+	src_pad = link->source;
+
+	if (is_media_entity_v4l2_subdev(src_pad->entity)) {
+		sd = media_entity_to_v4l2_subdev(src_pad->entity);
+
+		src_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		src_fmt.pad = src_pad->index;
+		v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
+
+		if (src_fmt.format.width != chan->format.width ||
+		    src_fmt.format.height != chan->format.height) {
+			dev_err(chan->vi->dev,
+				"wrong widthxheight %ux%u (expected %ux%u)\n",
+				chan->format.width, chan->format.height,
+				src_fmt.format.width, src_fmt.format.height);
+			return -EINVAL;
+		}
+
+		if (src_fmt.format.code != chan->fmtinfo->code) {
+			dev_err(chan->vi->dev,
+				"wrong mbus code: 0x%x (expected 0x%x)\n",
+				chan->fmtinfo->code, src_fmt.format.code);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations tegra_chan_video_media_ops = {
+	.link_validate = tegra_chan_video_link_validate
+};
+
+int tegra_channel_init(struct tegra_vi_channel *chan)
+{
+	struct tegra_vi *vi = chan->vi;
+	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
+	int ret;
+
+	mutex_init(&chan->video_lock);
+	INIT_LIST_HEAD(&chan->capture);
+	INIT_LIST_HEAD(&chan->done);
+	spin_lock_init(&chan->start_lock);
+	spin_lock_init(&chan->done_lock);
+	init_waitqueue_head(&chan->start_wait);
+	init_waitqueue_head(&chan->done_wait);
+
+	/* initialize the video format */
+	chan->fmtinfo = &tegra_default_format;
+	chan->format.pixelformat = chan->fmtinfo->fourcc;
+	chan->format.colorspace = V4L2_COLORSPACE_SRGB;
+	chan->format.field = V4L2_FIELD_NONE;
+	chan->format.width = TEGRA_DEF_WIDTH;
+	chan->format.height = TEGRA_DEF_HEIGHT;
+	chan->format.bytesperline = TEGRA_DEF_WIDTH * chan->fmtinfo->bpp;
+	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
+
+	/* initialize the media entity */
+	chan->pad.flags = MEDIA_PAD_FL_SINK;
+	chan->video.entity.ops = &tegra_chan_video_media_ops;
+	ret = media_entity_pads_init(&chan->video.entity, 1, &chan->pad);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_ctrl_handler_init(&chan->ctrl_handler, MAX_CID_CONTROLS);
+	if (chan->ctrl_handler.error) {
+		dev_err(vi->dev,
+			"V4L2 controls handler init failed: %d\n", ret);
+		goto ctrl_init_error;
+	}
+
+	/* initialize the video_device */
+	chan->video.fops = &tegra_channel_fops;
+	chan->video.v4l2_dev = &vid->v4l2_dev;
+	chan->video.queue = &chan->queue;
+	snprintf(chan->video.name, sizeof(chan->video.name), "%s-%s-%u",
+		 dev_name(vi->dev), "output", chan->portno);
+	chan->video.vfl_type = VFL_TYPE_GRABBER;
+	chan->video.vfl_dir = VFL_DIR_RX;
+	chan->video.release = video_device_release_empty;
+	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
+	chan->video.ctrl_handler = &chan->ctrl_handler;
+	chan->video.lock = &chan->video_lock;
+	chan->video.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				  V4L2_CAP_READWRITE;
+
+	video_set_drvdata(&chan->video, chan);
+	chan->sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_HAS_BASE);
+	if (!chan->sp) {
+		dev_err(vi->dev, "failed to request syncpoint\n");
+		ret = -ENOMEM;
+		goto host1x_sp_error;
+	}
+
+	chan->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	chan->queue.io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	chan->queue.lock = &chan->video_lock;
+	chan->queue.drv_priv = chan;
+	chan->queue.buf_struct_size = sizeof(struct tegra_channel_buffer);
+	chan->queue.ops = &tegra_channel_queue_qops;
+	chan->queue.mem_ops = &vb2_dma_contig_memops;
+	chan->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	chan->queue.dev = vi->dev;
+	ret = vb2_queue_init(&chan->queue);
+	if (ret < 0) {
+		dev_err(vi->dev, "failed to initialize VB2 queue: %d\n", ret);
+		goto vb2_init_error;
+	}
+
+	ret = video_register_device(&chan->video, VFL_TYPE_GRABBER, -1);
+	if (ret < 0) {
+		dev_err(&chan->video.dev,
+			"failed to register video device: %d\n", ret);
+		goto video_register_error;
+	}
+
+	return 0;
+
+video_register_error:
+	vb2_queue_release(&chan->queue);
+vb2_init_error:
+	host1x_syncpt_free(chan->sp);
+host1x_sp_error:
+	v4l2_ctrl_handler_free(&chan->ctrl_handler);
+ctrl_init_error:
+	media_entity_cleanup(&chan->video.entity);
+	return ret;
+}
+
+int tegra_channel_cleanup(struct tegra_vi_channel *chan)
+{
+	if (video_is_registered(&chan->video)) {
+		video_unregister_device(&chan->video);
+		vb2_queue_release(&chan->queue);
+		media_entity_cleanup(&chan->video.entity);
+	}
+
+	host1x_syncpt_free(chan->sp);
+	v4l2_ctrl_handler_free(&chan->ctrl_handler);
+
+	return 0;
+}
+
+int tegra_vi_power_on(struct tegra_vi *vi)
+{
+	int ret;
+
+	ret = regulator_enable(vi->vi_reg);
+	if (ret) {
+		dev_err(vi->dev, "failed to enable VDD supply: %d\n", ret);
+		return ret;
+	}
+
+	ret = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VENC,
+						vi->vi_clk, vi->vi_rst);
+	if (ret) {
+		dev_err(vi->dev, "failed to power partition: %d\n", ret);
+		goto error_power_up;
+	}
+
+	ret = clk_set_rate(vi->vi_clk, vi->soc->vi_max_clk_hz);
+	if (ret) {
+		dev_err(vi->dev, "failed to set vi clock rate: %d\n", ret);
+		goto error_clk_set_rate;
+	}
+
+	ret = clk_prepare_enable(vi->vi_clk);
+	if (ret) {
+		dev_err(vi->dev, "failed to enable vi clock: %d\n", ret);
+		goto error_clk_set_rate;
+	}
+
+	return 0;
+
+error_clk_set_rate:
+	tegra_powergate_power_off(TEGRA_POWERGATE_VENC);
+
+error_power_up:
+	regulator_disable(vi->vi_reg);
+
+	return ret;
+}
+
+void tegra_vi_power_off(struct tegra_vi *vi)
+{
+	reset_control_assert(vi->vi_rst);
+	clk_disable_unprepare(vi->vi_clk);
+	tegra_powergate_power_off(TEGRA_POWERGATE_VENC);
+	regulator_disable(vi->vi_reg);
+}
+
+static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan;
+	unsigned int port_num;
+	unsigned int nchannels = vi->soc->vi_max_channels;
+
+	for (port_num = 0; port_num < nchannels; port_num++) {
+		chan = devm_kzalloc(vi->dev, sizeof(*chan), GFP_KERNEL);
+		if (!chan)
+			return -ENOMEM;
+
+		list_add_tail(&chan->list, &vi->vi_chans);
+		chan->vi = vi;
+		chan->portno = port_num;
+	}
+
+	return 0;
+}
+
+static int tegra_vi_channels_init(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan;
+	int ret;
+
+	list_for_each_entry(chan, &vi->vi_chans, list) {
+		ret = tegra_channel_init(chan);
+		if (ret < 0) {
+			dev_err(vi->dev, "channel %d init failed: %d\n",
+				chan->portno, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int tegra_vi_channels_cleanup(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan;
+
+	list_for_each_entry(chan, &vi->vi_chans, list)
+		tegra_channel_cleanup(chan);
+
+	return 0;
+}
+
+static int tegra_vi_tpg_graph_init(struct tegra_vi *vi)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
+	struct tegra_csi *csi = vid->csi;
+	struct tegra_vi_channel *vi_chan;
+	struct tegra_csi_channel *csi_chan;
+	u32 link_flags = MEDIA_LNK_FL_ENABLED;
+	int ret = 0;
+
+	csi_chan = list_first_entry(&csi->csi_chans, struct tegra_csi_channel,
+				    list);
+
+	list_for_each_entry(vi_chan, &vi->vi_chans, list) {
+		struct media_entity *source = &csi_chan->subdev.entity;
+		struct media_entity *sink = &vi_chan->video.entity;
+		struct media_pad *source_pad = csi_chan->pads;
+		struct media_pad *sink_pad = &vi_chan->pad;
+
+		ret = v4l2_device_register_subdev(&vid->v4l2_dev,
+						  &csi_chan->subdev);
+		if (ret) {
+			dev_err(vi->dev, "failed to register subdev: %d\n",
+				ret);
+			goto register_fail;
+		}
+
+		dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
+			source->name, source_pad->index,
+			sink->name, sink_pad->index);
+
+		ret = media_create_pad_link(source, source_pad->index,
+					    sink, sink_pad->index,
+					    link_flags);
+		if (ret < 0) {
+			dev_err(vi->dev,
+				"failed to create %s:%u -> %s:%u link: %d\n",
+				source->name, source_pad->index,
+				sink->name, sink_pad->index, ret);
+			goto register_fail;
+		}
+
+		vi_tpg_fmts_bitmap_init(vi_chan);
+		tegra_channel_setup_ctrl_handler(vi_chan);
+
+		csi_chan = list_next_entry(csi_chan, list);
+	}
+
+	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
+
+register_fail:
+	list_for_each_entry(csi_chan, &csi->csi_chans, list)
+		v4l2_device_unregister_subdev(&csi_chan->subdev);
+
+	return ret;
+}
+
+static int tegra_vi_init(struct host1x_client *client)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(client->host);
+	struct tegra_vi *vi = host1x_client_to_vi(client);
+	int ret;
+
+	vid->vi = vi;
+	vid->media_dev.hw_revision = vi->soc->hw_revision;
+	snprintf(vid->media_dev.bus_info, sizeof(vid->media_dev.bus_info),
+		 "platform:%s", dev_name(vi->dev));
+
+	if (!vid->csi) {
+		dev_err(vi->dev, "csi host1x client is not initialized\n");
+		return -ENODEV;
+	}
+
+	INIT_LIST_HEAD(&vi->vi_chans);
+
+	/* create all TPG channels */
+	ret = tegra_vi_tpg_channels_alloc(vi);
+	if (ret < 0)
+		return ret;
+
+	/* initialize Tegra VI channels */
+	ret = tegra_vi_channels_init(vi);
+	if (ret < 0)
+		return ret;
+
+	/* setup media links between Tegra VI and CSI for TPG */
+	ret = tegra_vi_tpg_graph_init(vi);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tegra_vi_exit(struct host1x_client *client)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(client->host);
+
+	if (vid->vi)
+		tegra_vi_channels_cleanup(vid->vi);
+
+	return 0;
+}
+
+static const struct host1x_client_ops vi_client_ops = {
+	.init = tegra_vi_init,
+	.exit = tegra_vi_exit,
+};
+
+static int tegra_vi_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct tegra_vi *vi;
+	int ret;
+
+	vi = devm_kzalloc(&pdev->dev, sizeof(*vi), GFP_KERNEL);
+	if (!vi)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	vi->iomem = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(vi->iomem))
+		return PTR_ERR(vi->iomem);
+
+	vi->soc = of_device_get_match_data(&pdev->dev);
+	if (!vi->soc)
+		return -ENODATA;
+
+	vi->vi_rst = devm_reset_control_get(&pdev->dev, "vi");
+	if (IS_ERR(vi->vi_rst)) {
+		ret = PTR_ERR(vi->vi_rst);
+		dev_err(&pdev->dev, "failed to get vi reset: %d\n", ret);
+		return ret;
+	}
+
+	vi->vi_clk = devm_clk_get(&pdev->dev, "vi");
+	if (IS_ERR(vi->vi_clk)) {
+		ret = PTR_ERR(vi->vi_clk);
+		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
+		return ret;
+	}
+
+	vi->vi_reg = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
+	if (IS_ERR(vi->vi_reg)) {
+		ret = PTR_ERR(vi->vi_reg);
+		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret)
+		return ret;
+
+	vi->dev = &pdev->dev;
+	vi->ops = vi->soc->ops;
+	platform_set_drvdata(pdev, vi);
+
+	/* initialize host1x interface */
+	INIT_LIST_HEAD(&vi->client.list);
+	vi->client.ops = &vi_client_ops;
+	vi->client.dev = &pdev->dev;
+
+	ret = host1x_client_register(&vi->client);
+	if (ret < 0) {
+		dev_err(vi->dev, "failed to register host1x client: %d\n",
+			ret);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int tegra_vi_remove(struct platform_device *pdev)
+{
+	struct tegra_vi *vi = platform_get_drvdata(pdev);
+
+	host1x_client_unregister(&vi->client);
+
+	return 0;
+}
+
+/* Tegra supported video formats */
+const struct tegra_video_format tegra210_video_formats[] = {
+	/* RAW 8 */
+	TEGRA_VIDEO_FORMAT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
+	TEGRA_VIDEO_FORMAT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
+	TEGRA_VIDEO_FORMAT(RAW8, 8, SGBRG8_1X8, 1, T_L8, SGBRG8),
+	TEGRA_VIDEO_FORMAT(RAW8, 8, SBGGR8_1X8, 1, T_L8, SBGGR8),
+	/* RAW 10 */
+	TEGRA_VIDEO_FORMAT(RAW10, 10, SRGGB10_1X10, 2, T_R16_I, SRGGB10),
+	TEGRA_VIDEO_FORMAT(RAW10, 10, SGRBG10_1X10, 2, T_R16_I, SGRBG10),
+	TEGRA_VIDEO_FORMAT(RAW10, 10, SGBRG10_1X10, 2, T_R16_I, SGBRG10),
+	TEGRA_VIDEO_FORMAT(RAW10, 10, SBGGR10_1X10, 2, T_R16_I, SBGGR10),
+	/* RAW 12 */
+	TEGRA_VIDEO_FORMAT(RAW12, 12, SRGGB12_1X12, 2, T_R16_I, SRGGB12),
+	TEGRA_VIDEO_FORMAT(RAW12, 12, SGRBG12_1X12, 2, T_R16_I, SGRBG12),
+	TEGRA_VIDEO_FORMAT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
+	TEGRA_VIDEO_FORMAT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
+	/* RGB888 */
+	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
+	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
+			   XBGR32),
+	/* YUV422 */
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, UYVY),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, VYUY),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, YUYV),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, YVYU),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_1X16, 1, T_Y8__V8U8_N422, NV16),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, UYVY),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, VYUY),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, YUYV),
+	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, YVYU),
+};
+
+static const struct tegra_vi_ops tegra210_vi_ops = {
+	.vi_start_streaming = tegra210_vi_start_streaming,
+	.vi_stop_streaming = tegra210_vi_stop_streaming,
+};
+
+static const struct tegra_vi_soc tegra210_vi_soc = {
+	.video_formats = tegra210_video_formats,
+	.nformats = ARRAY_SIZE(tegra210_video_formats),
+	.ops = &tegra210_vi_ops,
+	.hw_revision = 3,
+	.vi_max_channels = 6,
+	.vi_max_clk_hz = 998400000,
+};
+
+static const struct of_device_id tegra_vi_of_id_table[] = {
+	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_vi_of_id_table);
+
+struct platform_driver tegra_vi_driver = {
+	.driver = {
+		.name = "tegra-vi",
+		.of_match_table = tegra_vi_of_id_table,
+	},
+	.probe = tegra_vi_probe,
+	.remove = tegra_vi_remove,
+};
+
+MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra/tegra-vi.h b/drivers/staging/media/tegra/tegra-vi.h
new file mode 100644
index 000000000000..74d8667c6a3d
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-vi.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef __TEGRA_VI_H__
+#define __TEGRA_VI_H__
+
+#include <linux/host1x.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/videodev2.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "tegra-common.h"
+
+struct tegra_vi_ops {
+	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
+	void (*vi_stop_streaming)(struct vb2_queue *vq);
+};
+
+/**
+ * struct tegra_vi_soc - NVIDIA Tegra Video Input SoC structure
+ *
+ * @video_formats: supported video formats
+ * @nformats: total video formats
+ * @ops: vi operations
+ * @hw_revision: VI hw_revision
+ * @vi_max_channels: supported max streaming channels
+ * @vi_max_clk_hz: VI clock max frequency
+ */
+struct tegra_vi_soc {
+	const struct tegra_video_format *video_formats;
+	const unsigned int nformats;
+	const struct tegra_vi_ops *ops;
+	u32 hw_revision;
+	unsigned int vi_max_channels;
+	unsigned int vi_max_clk_hz;
+};
+
+/**
+ * struct tegra_vi - NVIDIA Tegra Video Input device structure
+ *
+ * @dev: device struct
+ * @client: host1x_client struct
+ * @iomem: register base
+ * @vi_clk: main clock for VI block
+ * @vi_rst: reset controller
+ * @vi_reg: regulator for VI hardware, normally it avdd_dsi_csi
+ * @power_on_refcnt: reference count for power on/off operations
+ * @soc_data: pointer to SoC data structure
+ * @fops: vi operations
+ * @channels: list head for VI channels
+ */
+struct tegra_vi {
+	struct device *dev;
+	struct host1x_client client;
+	void __iomem *iomem;
+	struct clk *vi_clk;
+	struct reset_control *vi_rst;
+	struct regulator *vi_reg;
+	atomic_t power_on_refcnt;
+	const struct tegra_vi_soc *soc;
+	const struct tegra_vi_ops *ops;
+	struct list_head vi_chans;
+};
+
+int tegra_vi_power_on(struct tegra_vi *vi);
+void tegra_vi_power_off(struct tegra_vi *vi);
+
+void tegra210_vi_stop_streaming(struct vb2_queue *vq);
+int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count);
+
+#endif /* __TEGRA_VI_H__ */
diff --git a/drivers/staging/media/tegra/tegra-video.c b/drivers/staging/media/tegra/tegra-video.c
new file mode 100644
index 000000000000..6ec41d0e05f9
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-video.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/host1x.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "tegra-video.h"
+
+static int host1x_video_probe(struct host1x_device *dev)
+{
+	struct tegra_video_device *vid;
+	int ret;
+
+	vid = devm_kzalloc(&dev->dev, sizeof(*vid), GFP_KERNEL);
+	if (!vid)
+		return -ENOMEM;
+
+	vid->media_dev.dev = get_device(&dev->dev);
+	strscpy(vid->media_dev.model, "NVIDIA Tegra Video Input Device",
+		sizeof(vid->media_dev.model));
+
+	media_device_init(&vid->media_dev);
+	ret = media_device_register(&vid->media_dev);
+	if (ret < 0) {
+		dev_err(vid->media_dev.dev,
+			"failed to register media device: %d\n", ret);
+		return ret;
+	}
+
+	vid->v4l2_dev.mdev = &vid->media_dev;
+	dev_set_drvdata(&dev->dev, vid);
+	ret = v4l2_device_register(vid->media_dev.dev, &vid->v4l2_dev);
+	if (ret < 0) {
+		dev_err(vid->media_dev.dev,
+			"V4L2 device registration failed: %d\n", ret);
+		goto clean_media;
+	}
+
+	ret = host1x_device_init(dev);
+	if (ret < 0)
+		goto unregister_v4l2;
+
+	return 0;
+
+unregister_v4l2:
+	v4l2_device_unregister(&vid->v4l2_dev);
+clean_media:
+	media_device_unregister(&vid->media_dev);
+	media_device_cleanup(&vid->media_dev);
+
+	return ret;
+}
+
+static int host1x_video_remove(struct host1x_device *dev)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
+
+	host1x_device_exit(dev);
+	v4l2_device_unregister(&vid->v4l2_dev);
+	media_device_unregister(&vid->media_dev);
+	media_device_cleanup(&vid->media_dev);
+
+	return 0;
+}
+
+static const struct of_device_id host1x_video_subdevs[] = {
+	{ .compatible = "nvidia,tegra210-csi", },
+	{ .compatible = "nvidia,tegra210-vi", },
+	{ }
+};
+
+static struct host1x_driver host1x_video_driver = {
+	.driver = {
+		.name = "tegra-video",
+	},
+	.probe = host1x_video_probe,
+	.remove = host1x_video_remove,
+	.subdevs = host1x_video_subdevs,
+};
+
+static struct platform_driver * const drivers[] = {
+	&tegra_csi_driver,
+	&tegra_vi_driver,
+};
+
+static int __init host1x_video_init(void)
+{
+	int err;
+
+	err = host1x_driver_register(&host1x_video_driver);
+	if (err < 0)
+		return err;
+
+	err = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
+	if (err < 0)
+		goto unregister_host1x;
+
+	return 0;
+
+unregister_host1x:
+	host1x_driver_unregister(&host1x_video_driver);
+	return err;
+}
+module_init(host1x_video_init);
+
+static void __exit host1x_video_exit(void)
+{
+	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
+	host1x_driver_unregister(&host1x_video_driver);
+}
+module_exit(host1x_video_exit);
+
+MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra Host1x Video driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra/tegra-video.h b/drivers/staging/media/tegra/tegra-video.h
new file mode 100644
index 000000000000..1e2ae647a4e2
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra-video.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef __TEGRA_VIDEO_H__
+#define __TEGRA_VIDEO_H__
+
+#include <linux/host1x.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "tegra-vi.h"
+#include "tegra-csi.h"
+
+struct tegra_video_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device media_dev;
+	struct tegra_vi *vi;
+	struct tegra_csi *csi;
+};
+
+extern struct platform_driver tegra_vi_driver;
+extern struct platform_driver tegra_csi_driver;
+
+#endif
diff --git a/drivers/staging/media/tegra/tegra210.c b/drivers/staging/media/tegra/tegra210.c
new file mode 100644
index 000000000000..34f4f66ff072
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra210.c
@@ -0,0 +1,698 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk/tegra.h>
+#include <linux/delay.h>
+#include <linux/freezer.h>
+
+#include "tegra-common.h"
+#include "tegra-csi.h"
+#include "tegra-vi.h"
+#include "tegra210.h"
+
+#define	TEGRA210_TPG_CLOCK			594000000
+#define TEGRA210_CSI_PORT_OFFSET		0x34
+#define TEGRA210_CSI_CIL_OFFSET			0x0f4
+#define TEGRA210_CSI_TPG_OFFSET			0x18c
+
+#define CSI_PP_OFFSET(block)			((block) * 0x800)
+#define	TEGRA210_VI_CSI_BASE(x)			(0x100 + (x) * 0x100)
+
+/* CSI PHY register write accessor */
+static void csi_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
+		      u32 val)
+{
+	void __iomem *csi_pp_base;
+
+	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
+
+	writel(val, csi_pp_base + addr);
+}
+
+/* Pixel parser registers accessors */
+static void pp_write(struct tegra_csi *csi, u8 portno, u32 addr, u32 val)
+{
+	void __iomem *csi_pp_base;
+	unsigned int offset;
+
+	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
+
+	writel(val, csi_pp_base + offset + addr);
+}
+
+static u32 pp_read(struct tegra_csi *csi, u8 portno, u32 addr)
+{
+	void __iomem *csi_pp_base;
+	unsigned int offset;
+
+	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
+
+	return readl(csi_pp_base + offset + addr);
+}
+
+/* CSI CIL A/B port registers accessors */
+static void cil_write(struct tegra_csi *csi, u8 portno, u32 addr, u32 val)
+{
+	void __iomem *csi_cil_base;
+	unsigned int offset;
+
+	csi_cil_base = csi->iomem + CSI_PP_OFFSET(portno >> 1) +
+		       TEGRA210_CSI_CIL_OFFSET;
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
+
+	writel(val, csi_cil_base + offset + addr);
+}
+
+static u32 cil_read(struct tegra_csi *csi, u8 portno, u32 addr)
+{
+	void __iomem *csi_cil_base;
+	unsigned int offset;
+
+	csi_cil_base = csi->iomem + CSI_PP_OFFSET(portno >> 1) +
+		       TEGRA210_CSI_CIL_OFFSET;
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
+
+	return readl(csi_cil_base + offset + addr);
+}
+
+/* Test pattern generator registers accessor */
+static void tpg_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
+		      u32 val)
+{
+	void __iomem *csi_pp_base;
+	unsigned int offset;
+
+	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET +
+		 TEGRA210_CSI_TPG_OFFSET;
+
+	writel(val, csi_pp_base + offset + addr);
+}
+
+/* Tegra VI registers accessors */
+static void tegra_vi_write(struct tegra_vi_channel *chan, unsigned int addr,
+			   u32 val)
+{
+	writel(val, chan->vi->iomem + addr);
+}
+
+static u32 tegra_vi_read(struct tegra_vi_channel *chan, unsigned int addr)
+{
+	return readl(chan->vi->iomem + addr);
+}
+
+/* VI_CSI registers accessors */
+static void vi_csi_write(struct tegra_vi_channel *chan, unsigned int addr,
+			 u32 val)
+{
+	void __iomem *vi_csi_base;
+
+	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
+
+	writel(val, vi_csi_base + addr);
+}
+
+static u32 vi_csi_read(struct tegra_vi_channel *chan, unsigned int addr)
+{
+	void __iomem *vi_csi_base;
+
+	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
+
+	return readl(vi_csi_base + addr);
+}
+
+/*
+ * Tegra channel frame setup and capture operations
+ */
+static int tegra_channel_capture_setup(struct tegra_vi_channel *chan)
+{
+	u32 height = chan->format.height;
+	u32 width = chan->format.width;
+	u32 format = chan->fmtinfo->img_fmt;
+	u32 data_type = chan->fmtinfo->img_dt;
+	u32 word_count = (width * chan->fmtinfo->bit_width) / 8;
+
+	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xFFFFFFFF);
+	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF,
+		     ((chan->pg_mode ? 0 : 1) << BYPASS_PXL_TRANSFORM_OFFSET) |
+		     (format << IMAGE_DEF_FORMAT_OFFSET) |
+		     IMAGE_DEF_DEST_MEM);
+	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DT, data_type);
+	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE_WC, word_count);
+	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE,
+		     (height << IMAGE_SIZE_HEIGHT_OFFSET) | width);
+	return 0;
+}
+
+static void tegra_channel_capture_error_status(struct tegra_vi_channel *chan)
+{
+	u32 val;
+
+	val = vi_csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
+	dev_err(&chan->video.dev, "TEGRA_VI_CSI_ERROR_STATUS 0x%08x\n", val);
+	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
+
+	val = tegra_vi_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR);
+	dev_err(&chan->video.dev,
+		"TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR 0x%08x\n", val);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
+	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xF);
+	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
+
+	tegra_channel_csi_error_status(chan);
+}
+
+static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
+				       struct tegra_channel_buffer *buf)
+{
+	int err = 0;
+	u32 thresh, value, frame_start;
+	int bytes_per_line = chan->format.bytesperline;
+
+	/* program buffer address by using surface 0 */
+	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB, 0x0);
+	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
+	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
+
+	/* increase syncpoint max */
+	thresh = host1x_syncpt_incr_max(chan->sp, 1);
+
+	/* program syncpoint */
+	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
+	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
+		host1x_syncpt_id(chan->sp);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+
+	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
+
+	/* move buffer to capture done queue */
+	spin_lock(&chan->done_lock);
+	list_add_tail(&buf->queue, &chan->done);
+	spin_unlock(&chan->done_lock);
+
+	/* wait up kthread for capture done */
+	wake_up_interruptible(&chan->done_wait);
+
+	/* use syncpoint to wake up */
+	err = host1x_syncpt_wait(chan->sp, thresh,
+				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
+	if (err) {
+		dev_err(&chan->video.dev,
+			"frame start syncpt timeout: %d\n", err);
+		tegra_channel_capture_error_status(chan);
+	}
+
+	return err;
+}
+
+static int tegra_channel_capture_done(struct tegra_vi_channel *chan,
+				      struct tegra_channel_buffer *buf)
+{
+	struct vb2_v4l2_buffer *vb = &buf->buf;
+	u32 thresh, value, mw_ack_done;
+	int ret = 0;
+
+	/* increase syncpoint max */
+	thresh = host1x_syncpt_incr_max(chan->sp, 1);
+
+	/* program syncpoint */
+	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
+	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
+		host1x_syncpt_id(chan->sp);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+
+	if (!vi_csi_read(chan, TEGRA_VI_CSI_SINGLE_SHOT))
+		vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT,
+			     SINGLE_SHOT_CAPTURE);
+
+	/* use syncpoint to wake up */
+	ret = host1x_syncpt_wait(chan->sp, thresh,
+				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
+	if (ret)
+		dev_err(&chan->video.dev,
+			"MW_ACK_DONE syncpoint timeout: %d\n", ret);
+
+	/* captured one frame */
+	vb->sequence = chan->sequence++;
+	vb->field = V4L2_FIELD_NONE;
+	vb->vb2_buf.timestamp = ktime_get_ns();
+	vb2_buffer_done(&vb->vb2_buf,
+			ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+	return ret;
+}
+
+static int chan_capture_kthread_start(void *data)
+{
+	struct tegra_vi_channel *chan = data;
+	struct tegra_channel_buffer *buf;
+	int err = 0;
+
+	set_freezable();
+
+	while (1) {
+		try_to_freeze();
+
+		wait_event_interruptible(chan->start_wait,
+					 !list_empty(&chan->capture) ||
+					 kthread_should_stop());
+		if (kthread_should_stop())
+			break;
+
+		if (err)
+			continue;
+
+		spin_lock(&chan->start_lock);
+		if (list_empty(&chan->capture)) {
+			spin_unlock(&chan->start_lock);
+			continue;
+		}
+
+		buf = list_entry(chan->capture.next,
+				 struct tegra_channel_buffer, queue);
+		list_del_init(&buf->queue);
+		spin_unlock(&chan->start_lock);
+		err = tegra_channel_capture_frame(chan, buf);
+	}
+
+	return 0;
+}
+
+static int chan_capture_kthread_done(void *data)
+{
+	struct tegra_vi_channel *chan = data;
+	struct tegra_channel_buffer *buf;
+	int err = 0;
+
+	set_freezable();
+
+	while (1) {
+		try_to_freeze();
+
+		wait_event_interruptible(chan->done_wait,
+					 !list_empty(&chan->done) ||
+					 kthread_should_stop());
+
+		if (kthread_should_stop())
+			break;
+
+		spin_lock(&chan->done_lock);
+		if (list_empty(&chan->done)) {
+			spin_unlock(&chan->done_lock);
+			continue;
+		}
+
+		buf = list_entry(chan->done.next, struct tegra_channel_buffer,
+				 queue);
+		if (!buf)
+			continue;
+
+		list_del_init(&buf->queue);
+		spin_unlock(&chan->done_lock);
+		err = tegra_channel_capture_done(chan, buf);
+	}
+
+	return 0;
+}
+
+int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+	struct media_pipeline *pipe = &chan->video.pipe;
+	int ret = 0;
+
+	/* turn on the power on first open */
+	if (atomic_add_return(1, &chan->vi->power_on_refcnt) == 1) {
+		ret = tegra_vi_power_on(chan->vi);
+		if (ret < 0)
+			goto error_vi_power_on;
+
+		usleep_range(5, 100);
+		tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
+		usleep_range(10, 15);
+	}
+
+	/* clean up status */
+	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xFFFFFFFF);
+
+	/*
+	 * Sync point FIFO full stalls the host interface.
+	 * Setting NO_STALL will drop INCR_SYNCPT methods when fifos are
+	 * full and corresponding condition bits in INCR_SYNCPT_ERROR
+	 * register will be set.
+	 * This allows SW to process error recovery.
+	 */
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL,
+		       TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL);
+
+	ret = media_pipeline_start(&chan->video.entity, pipe);
+	if (ret < 0)
+		goto error_pipeline_start;
+
+	/* start the pipeline */
+	ret = tegra_channel_set_stream(chan, true);
+	if (ret < 0)
+		goto error_set_stream;
+
+	/* program VI registers after TPG, sensors and CSI streaming */
+	ret = tegra_channel_capture_setup(chan);
+	if (ret < 0)
+		goto error_capture_setup;
+
+	chan->sequence = 0;
+
+	/* start kthread to capture data to buffer */
+	chan->kthread_capture_start = kthread_run(chan_capture_kthread_start,
+						  chan, "%s:0",
+						  chan->video.name);
+	if (IS_ERR(chan->kthread_capture_start)) {
+		ret = PTR_ERR(chan->kthread_capture_start);
+		chan->kthread_capture_start = NULL;
+		dev_err(&chan->video.dev,
+			"failed capture start kthread: %d\n", ret);
+		goto error_capture_setup;
+	}
+
+	chan->kthread_capture_done = kthread_run(chan_capture_kthread_done,
+						 chan, "%s:1",
+						 chan->video.name);
+	if (IS_ERR(chan->kthread_capture_done)) {
+		ret = PTR_ERR(chan->kthread_capture_done);
+		chan->kthread_capture_done = NULL;
+		dev_err(&chan->video.dev,
+			"failed capture done kthread: %d\n", ret);
+		goto error_capture_setup;
+	}
+
+	return 0;
+
+error_capture_setup:
+	tegra_channel_set_stream(chan, false);
+
+error_set_stream:
+	media_pipeline_stop(&chan->video.entity);
+
+error_pipeline_start:
+	tegra_channel_queued_buf_done(chan, VB2_BUF_STATE_QUEUED);
+
+error_vi_power_on:
+	if (atomic_dec_and_test(&chan->vi->power_on_refcnt))
+		tegra_vi_power_off(chan->vi);
+	return ret;
+}
+
+void tegra210_vi_stop_streaming(struct vb2_queue *vq)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+
+	/* stop the kthread for capture */
+	kthread_stop(chan->kthread_capture_start);
+	chan->kthread_capture_start = NULL;
+	kthread_stop(chan->kthread_capture_done);
+	chan->kthread_capture_done = NULL;
+
+	/* disable clock gating to enable continuous clock */
+	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
+
+	/* clear single shot if armed at close */
+	if (vi_csi_read(chan, TEGRA_VI_CSI_SINGLE_SHOT)) {
+		vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xF);
+		vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
+	}
+
+	/* enable clock gating so VI can be clock gated if necessary */
+	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
+
+	tegra_channel_set_stream(chan, false);
+
+	media_pipeline_stop(&chan->video.entity);
+
+	/* turn off power on the last release */
+	if (atomic_dec_and_test(&chan->vi->power_on_refcnt))
+		tegra_vi_power_off(chan->vi);
+
+	tegra_channel_queued_buf_done(chan, VB2_BUF_STATE_ERROR);
+}
+
+void tegra210_csi_error_status(struct tegra_csi_channel *csi_chan)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int port_num = csi_chan->csi_port_num;
+	u32 val;
+
+	val = pp_read(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS);
+	dev_err(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n", val);
+
+	val = cil_read(csi, port_num, TEGRA_CSI_CIL_STATUS);
+	dev_err(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
+
+	val = cil_read(csi, port_num, TEGRA_CSI_CILX_STATUS);
+	dev_err(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
+
+	cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
+	csi_write(csi, port_num, TEGRA_CSI_CSI_SW_STATUS_RESET, 0x1);
+	/* sleep for 20 clock cycles to drain the FIFO*/
+	usleep_range(10, 20);
+	cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
+	csi_write(csi, port_num, TEGRA_CSI_CSI_SW_STATUS_RESET, 0x0);
+}
+
+int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
+			   int enable)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int port_num = csi_chan->csi_port_num;
+	unsigned int block = port_num >> 1;
+	struct clk *cil_clk;
+	int ret;
+
+	if (block == CSI_CIL_AB)
+		cil_clk = csi->cilab_clk;
+	else if (block == CSI_CIL_CD)
+		cil_clk = csi->cilcd_clk;
+	else
+		cil_clk = csi->cilef_clk;
+
+	if (enable) {
+		ret = clk_set_rate(cil_clk, csi->soc->cil_max_clk_hz);
+		if (ret)
+			dev_warn(csi->dev,
+				 "failed to set cil clock rate: %d\n", ret);
+
+		/* enable CIL clock on first open */
+		if (atomic_add_return(1, &csi->clk_refcnt) == 1) {
+			ret = clk_prepare_enable(cil_clk);
+			if (ret) {
+				dev_err(csi->dev,
+					"failed to enable cil clock: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		/*
+		 * On Tegra210, TPG internal logic uses PLLD out along with
+		 * the CIL clock.
+		 * So, enable TPG clock during TPG mode streaming.
+		 */
+		if (pg_mode) {
+			ret = clk_set_rate(csi->tpg_clk, TEGRA210_TPG_CLOCK);
+			if (ret)
+				dev_err(csi->dev,
+					"failed to set tpg clock rate: %d\n",
+					ret);
+
+			ret = clk_prepare_enable(csi->tpg_clk);
+			if (ret) {
+				dev_err(csi->dev,
+					"failed to enable tpg clock: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		csi_write(csi, port_num, TEGRA_CSI_CLKEN_OVERRIDE, 0);
+
+		/* clean up status */
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS,
+			 0xFFFFFFFF);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, 0xFFFFFFFF);
+		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, 0xFFFFFFFF);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
+
+		/* CIL PHY registers setup */
+		cil_write(csi, port_num, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
+
+		/*
+		 * The CSI unit provides for connection of up to six cameras in
+		 * the system and is organized as three identical instances of
+		 * two MIPI support blocks, each with a separate 4-lane
+		 * interface that can be configured as a single camera with 4
+		 * lanes or as a dual camera with 2 lanes available for each
+		 * camera.
+		 */
+		if (csi_chan->numlanes == 4) {
+			cil_write(csi, port_num, TEGRA_CSI_CIL_PAD_CONFIG0,
+				  BRICK_CLOCK_A_4X);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE);
+		} else {
+			u32 val = ((port_num & 1) == PORT_A) ?
+				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_NOP :
+				  CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_NOP;
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  val);
+		}
+
+		/* CSI pixel parser registers setup */
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
+			 (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
+			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_RST);
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK,
+			 0x0);
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_CONTROL0,
+			 CSI_PP_PACKET_HEADER_SENT |
+			 CSI_PP_DATA_IDENTIFIER_ENABLE |
+			 CSI_PP_WORD_COUNT_SELECT_HEADER |
+			 CSI_PP_CRC_CHECK_ENABLE |  CSI_PP_WC_CHECK |
+			 CSI_PP_OUTPUT_FORMAT_STORE |
+			 CSI_PP_HEADER_EC_DISABLE | CSI_PPA_PAD_FRAME_NOPAD |
+			 (port_num & 1));
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_CONTROL1,
+			 (0x1 << CSI_PP_TOP_FIELD_FRAME_OFFSET) |
+			 (0x1 << CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET));
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_GAP,
+			 0x14 << PP_FRAME_MIN_GAP_OFFSET);
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME,
+			 0x0);
+		pp_write(csi, port_num, TEGRA_CSI_INPUT_STREAM_CONTROL,
+			 (0x3f << CSI_SKIP_PACKET_THRESHOLD_OFFSET) |
+			 (csi_chan->numlanes - 1));
+
+		/* TPG setup */
+		if (pg_mode) {
+			tpg_write(csi, port_num,
+				  TEGRA_CSI_PATTERN_GENERATOR_CTRL,
+				  ((pg_mode - 1) << PG_MODE_OFFSET) |
+				  PG_ENABLE);
+			tpg_write(csi, port_num, TEGRA_CSI_PG_PHASE, 0x0);
+			tpg_write(csi, port_num, TEGRA_CSI_PG_RED_FREQ,
+				  (0x10 << PG_RED_VERT_INIT_FREQ_OFFSET) |
+				  (0x10 << PG_RED_HOR_INIT_FREQ_OFFSET));
+			tpg_write(csi, port_num, TEGRA_CSI_PG_RED_FREQ_RATE,
+				  0x0);
+			tpg_write(csi, port_num, TEGRA_CSI_PG_GREEN_FREQ,
+				  (0x10 << PG_GREEN_VERT_INIT_FREQ_OFFSET) |
+				  (0x10 << PG_GREEN_HOR_INIT_FREQ_OFFSET));
+			tpg_write(csi, port_num, TEGRA_CSI_PG_GREEN_FREQ_RATE,
+				  0x0);
+			tpg_write(csi, port_num, TEGRA_CSI_PG_BLUE_FREQ,
+				  (0x10 << PG_BLUE_VERT_INIT_FREQ_OFFSET) |
+				  (0x10 << PG_BLUE_HOR_INIT_FREQ_OFFSET));
+			tpg_write(csi, port_num, TEGRA_CSI_PG_BLUE_FREQ_RATE,
+				  0x0);
+		}
+
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
+			 (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
+			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_ENABLE);
+	} else {
+		u32 val = pp_read(csi, port_num,
+				  TEGRA_CSI_PIXEL_PARSER_STATUS);
+
+		dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n",
+			val);
+
+		val = cil_read(csi, port_num, TEGRA_CSI_CIL_STATUS);
+		dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
+
+		val = cil_read(csi, port_num, TEGRA_CSI_CILX_STATUS);
+		dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
+
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
+			 (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
+			 CSI_PP_DISABLE);
+
+		if (pg_mode) {
+			tpg_write(csi, port_num,
+				  TEGRA_CSI_PATTERN_GENERATOR_CTRL,
+				  ((pg_mode - 1) << PG_MODE_OFFSET) |
+				  PG_DISABLE);
+			clk_disable_unprepare(csi->tpg_clk);
+		}
+
+		if (csi_chan->numlanes == 4) {
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  CSI_A_PHY_CIL_DISABLE |
+				  CSI_B_PHY_CIL_DISABLE);
+
+		} else {
+			u32 val = ((port_num & 1) == PORT_A) ?
+				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
+				  CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  val);
+		}
+	}
+
+	return 0;
+}
+
+int tegra210_csi_hw_init(struct tegra_csi *csi)
+{
+	int ret;
+
+	csi->cilab_clk = devm_clk_get(csi->dev, "cilab");
+	if (IS_ERR(csi->cilab_clk)) {
+		ret = PTR_ERR(csi->cilab_clk);
+		dev_err(csi->dev, "failed to get cilab clock: %d\n", ret);
+		return ret;
+	}
+
+	csi->cilcd_clk = devm_clk_get(csi->dev, "cilcd");
+	if (IS_ERR(csi->cilcd_clk)) {
+		ret = PTR_ERR(csi->cilcd_clk);
+		dev_err(csi->dev, "failed to get cilcd clock: %d\n", ret);
+		return ret;
+	}
+
+	csi->cilef_clk = devm_clk_get(csi->dev, "cile");
+	if (IS_ERR(csi->cilef_clk)) {
+		ret = PTR_ERR(csi->cilef_clk);
+		dev_err(csi->dev, "failed to get cile clock: %d\n", ret);
+		return ret;
+	}
+
+	csi->tpg_clk = devm_clk_get(csi->dev, "csi_tpg");
+	if (IS_ERR(csi->tpg_clk)) {
+		ret = PTR_ERR(csi->tpg_clk);
+		dev_err(csi->dev, "failed to get csi_tpg clock: %d\n", ret);
+		return ret;
+	}
+
+	csi->csi_clk = devm_clk_get(csi->dev, "csi");
+	if (IS_ERR(csi->csi_clk)) {
+		ret = PTR_ERR(csi->csi_clk);
+		dev_err(csi->dev, "failed to get csi clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(csi->csi_clk);
+	if (ret) {
+		dev_err(csi->dev, "failed to enable csi clock: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/tegra/tegra210.h b/drivers/staging/media/tegra/tegra210.h
new file mode 100644
index 000000000000..7249bf152ce9
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra210.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef __TEGRA210_H__
+#define __TEGRA210_H__
+
+/* Tegra210 VI registers */
+#define	TEGRA_VI_SYNCPT_WAIT_TIMEOUT			200
+#define	TEGRA_VI_CFG_VI_INCR_SYNCPT			0x000
+#define   VI_CFG_VI_INCR_SYNCPT_COND(x)			(((x) & 0xff) << 8)
+#define	  VI_CSI_PP_LINE_START(port)			(4 + (port) * 4)
+#define	  VI_CSI_PP_FRAME_START(port)			(5 + (port) * 4)
+#define	  VI_CSI_MW_REQ_DONE(port)			(6 + (port) * 4)
+#define	  VI_CSI_MW_ACK_DONE(port)			(7 + (port) * 4)
+
+#define	TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL		0x004
+#define	  TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL		BIT(8)
+#define	TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR		0x008
+#define	TEGRA_VI_CFG_CTXSW				0x020
+#define	TEGRA_VI_CFG_INTSTATUS				0x024
+#define	TEGRA_VI_CFG_PWM_CONTROL			0x038
+#define	TEGRA_VI_CFG_PWM_HIGH_PULSE			0x03c
+#define	TEGRA_VI_CFG_PWM_LOW_PULSE			0x040
+#define	TEGRA_VI_CFG_PWM_SELECT_PULSE_A			0x044
+#define	TEGRA_VI_CFG_PWM_SELECT_PULSE_B			0x048
+#define	TEGRA_VI_CFG_PWM_SELECT_PULSE_C			0x04c
+#define	TEGRA_VI_CFG_PWM_SELECT_PULSE_D			0x050
+#define	TEGRA_VI_CFG_VGP1				0x064
+#define	TEGRA_VI_CFG_VGP2				0x068
+#define	TEGRA_VI_CFG_VGP3				0x06c
+#define	TEGRA_VI_CFG_VGP4				0x070
+#define	TEGRA_VI_CFG_VGP5				0x074
+#define	TEGRA_VI_CFG_VGP6				0x078
+#define	TEGRA_VI_CFG_INTERRUPT_MASK			0x08c
+#define	TEGRA_VI_CFG_INTERRUPT_TYPE_SELECT		0x090
+#define	TEGRA_VI_CFG_INTERRUPT_POLARITY_SELECT		0x094
+#define	TEGRA_VI_CFG_INTERRUPT_STATUS			0x098
+#define	TEGRA_VI_CFG_VGP_SYNCPT_CONFIG			0x0ac
+#define	TEGRA_VI_CFG_VI_SW_RESET			0x0b4
+#define	TEGRA_VI_CFG_CG_CTRL				0x0b8
+#define   VI_CG_2ND_LEVEL_EN				0x1
+#define	TEGRA_VI_CFG_VI_MCCIF_FIFOCTRL			0x0e4
+#define	TEGRA_VI_CFG_TIMEOUT_WCOAL_VI			0x0e8
+#define	TEGRA_VI_CFG_DVFS				0x0f0
+#define	TEGRA_VI_CFG_RESERVE				0x0f4
+#define	TEGRA_VI_CFG_RESERVE_1				0x0f8
+
+/* Tegra210 CSI registers */
+#define TEGRA_VI_CSI_SW_RESET				0x000
+#define TEGRA_VI_CSI_SINGLE_SHOT			0x004
+#define   SINGLE_SHOT_CAPTURE				0x1
+#define TEGRA_VI_CSI_SINGLE_SHOT_STATE_UPDATE		0x008
+#define TEGRA_VI_CSI_IMAGE_DEF				0x00c
+#define   BYPASS_PXL_TRANSFORM_OFFSET			24
+#define   IMAGE_DEF_FORMAT_OFFSET			16
+#define   IMAGE_DEF_DEST_MEM				0x1
+#define TEGRA_VI_CSI_RGB2Y_CTRL				0x010
+#define TEGRA_VI_CSI_MEM_TILING				0x014
+#define TEGRA_VI_CSI_IMAGE_SIZE				0x018
+#define   IMAGE_SIZE_HEIGHT_OFFSET			16
+#define TEGRA_VI_CSI_IMAGE_SIZE_WC			0x01c
+#define TEGRA_VI_CSI_IMAGE_DT				0x020
+#define TEGRA_VI_CSI_SURFACE0_OFFSET_MSB		0x024
+#define TEGRA_VI_CSI_SURFACE0_OFFSET_LSB		0x028
+#define TEGRA_VI_CSI_SURFACE1_OFFSET_MSB		0x02c
+#define TEGRA_VI_CSI_SURFACE1_OFFSET_LSB		0x030
+#define TEGRA_VI_CSI_SURFACE2_OFFSET_MSB		0x034
+#define TEGRA_VI_CSI_SURFACE2_OFFSET_LSB		0x038
+#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_MSB		0x03c
+#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_LSB		0x040
+#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_MSB		0x044
+#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_LSB		0x048
+#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_MSB		0x04c
+#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_LSB		0x050
+#define TEGRA_VI_CSI_SURFACE0_STRIDE			0x054
+#define TEGRA_VI_CSI_SURFACE1_STRIDE			0x058
+#define TEGRA_VI_CSI_SURFACE2_STRIDE			0x05c
+#define TEGRA_VI_CSI_SURFACE_HEIGHT0			0x060
+#define TEGRA_VI_CSI_ISPINTF_CONFIG			0x064
+#define TEGRA_VI_CSI_ERROR_STATUS			0x084
+#define TEGRA_VI_CSI_ERROR_INT_MASK			0x088
+#define TEGRA_VI_CSI_WD_CTRL				0x08c
+#define TEGRA_VI_CSI_WD_PERIOD				0x090
+
+/* Tegra210 CSI Pixel Parser registers: Starts from 0x838, offset 0x0 */
+#define TEGRA_CSI_INPUT_STREAM_CONTROL                  0x000
+#define   CSI_SKIP_PACKET_THRESHOLD_OFFSET		16
+
+#define TEGRA_CSI_PIXEL_STREAM_CONTROL0			0x004
+#define   CSI_PP_PACKET_HEADER_SENT			BIT(4)
+#define   CSI_PP_DATA_IDENTIFIER_ENABLE			BIT(5)
+#define   CSI_PP_WORD_COUNT_SELECT_HEADER		BIT(6)
+#define   CSI_PP_CRC_CHECK_ENABLE			BIT(7)
+#define   CSI_PP_WC_CHECK				BIT(8)
+#define   CSI_PP_OUTPUT_FORMAT_STORE			(0x3 << 16)
+#define   CSI_PP_HEADER_EC_DISABLE			(0x1 << 27)
+#define   CSI_PPA_PAD_FRAME_NOPAD			(0x2 << 28)
+
+#define TEGRA_CSI_PIXEL_STREAM_CONTROL1                 0x008
+#define   CSI_PP_TOP_FIELD_FRAME_OFFSET			0
+#define   CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET		4
+
+#define TEGRA_CSI_PIXEL_STREAM_GAP                      0x00c
+#define   PP_FRAME_MIN_GAP_OFFSET			16
+
+#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND               0x010
+#define   CSI_PP_ENABLE					0x1
+#define   CSI_PP_DISABLE				0x2
+#define   CSI_PP_RST					0x3
+#define   CSI_PP_SINGLE_SHOT_ENABLE			(0x1 << 2)
+#define   CSI_PP_START_MARKER_FRAME_MAX_OFFSET		12
+
+#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME           0x014
+#define TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK           0x018
+#define TEGRA_CSI_PIXEL_PARSER_STATUS                   0x01c
+#define TEGRA_CSI_CSI_SW_SENSOR_RESET                   0x020
+
+/* Tegra210 CSI PHY registers */
+/* CSI_PHY_CIL_COMMAND_0 offset 0x0d0 from TEGRA_CSI_PIXEL_PARSER_0_BASE */
+#define TEGRA_CSI_PHY_CIL_COMMAND                       0x0d0
+#define   CSI_A_PHY_CIL_NOP				0x0
+#define   CSI_A_PHY_CIL_ENABLE				0x1
+#define   CSI_A_PHY_CIL_DISABLE				0x2
+#define   CSI_A_PHY_CIL_ENABLE_MASK			0x3
+#define   CSI_B_PHY_CIL_NOP				(0x0 << 8)
+#define   CSI_B_PHY_CIL_ENABLE				(0x1 << 8)
+#define   CSI_B_PHY_CIL_DISABLE				(0x2 << 8)
+#define   CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 8)
+
+#define TEGRA_CSI_CIL_PAD_CONFIG0                       0x000
+#define   BRICK_CLOCK_A_4X				(0x1 << 16)
+#define   BRICK_CLOCK_B_4X				(0x2 << 16)
+#define TEGRA_CSI_CIL_PAD_CONFIG1                       0x004
+#define TEGRA_CSI_CIL_PHY_CONTROL                       0x008
+#define TEGRA_CSI_CIL_INTERRUPT_MASK                    0x00c
+#define TEGRA_CSI_CIL_STATUS                            0x010
+#define TEGRA_CSI_CILX_STATUS                           0x014
+#define TEGRA_CSI_CIL_ESCAPE_MODE_COMMAND               0x018
+#define TEGRA_CSI_CIL_ESCAPE_MODE_DATA                  0x01c
+#define TEGRA_CSI_CIL_SW_SENSOR_RESET                   0x020
+
+#define TEGRA_CSI_PATTERN_GENERATOR_CTRL		0x000
+#define   PG_MODE_OFFSET				2
+#define   PG_ENABLE					0x1
+#define   PG_DISABLE					0x0
+
+#define PG_VBLANK_OFFSET				16
+#define TEGRA_CSI_PG_BLANK				0x004
+#define TEGRA_CSI_PG_PHASE				0x008
+#define TEGRA_CSI_PG_RED_FREQ				0x00c
+#define   PG_RED_VERT_INIT_FREQ_OFFSET			16
+#define   PG_RED_HOR_INIT_FREQ_OFFSET			0
+
+#define TEGRA_CSI_PG_RED_FREQ_RATE			0x010
+#define TEGRA_CSI_PG_GREEN_FREQ				0x014
+#define   PG_GREEN_VERT_INIT_FREQ_OFFSET		16
+#define   PG_GREEN_HOR_INIT_FREQ_OFFSET			0
+
+#define TEGRA_CSI_PG_GREEN_FREQ_RATE			0x018
+#define TEGRA_CSI_PG_BLUE_FREQ				0x01c
+#define   PG_BLUE_VERT_INIT_FREQ_OFFSET			16
+#define   PG_BLUE_HOR_INIT_FREQ_OFFSET			0
+
+#define TEGRA_CSI_PG_BLUE_FREQ_RATE			0x020
+#define TEGRA_CSI_PG_AOHDR				0x024
+
+#define TEGRA_CSI_DPCM_CTRL_A				0xa2c
+#define TEGRA_CSI_DPCM_CTRL_B				0xa30
+
+/* Other CSI registers: Starts from 0xa44, offset 0x20c */
+#define TEGRA_CSI_STALL_COUNTER				0x20c
+#define TEGRA_CSI_CSI_READONLY_STATUS			0x210
+#define TEGRA_CSI_CSI_SW_STATUS_RESET			0x214
+#define TEGRA_CSI_CLKEN_OVERRIDE			0x218
+#define TEGRA_CSI_DEBUG_CONTROL				0x21c
+#define TEGRA_CSI_DEBUG_COUNTER_0			0x220
+#define TEGRA_CSI_DEBUG_COUNTER_1			0x224
+#define TEGRA_CSI_DEBUG_COUNTER_2			0x228
+
+/* Tegra210 CSI Pixel Parser registers */
+#define TEGRA_CSI_PIXEL_PARSER_0_BASE			0x0838
+#define TEGRA_CSI_PIXEL_PARSER_1_BASE			0x086c
+#define TEGRA_CSI_PIXEL_PARSER_2_BASE			0x1038
+#define TEGRA_CSI_PIXEL_PARSER_3_BASE			0x106c
+#define TEGRA_CSI_PIXEL_PARSER_4_BASE			0x1838
+#define TEGRA_CSI_PIXEL_PARSER_5_BASE			0x186c
+
+#endif
-- 
2.7.4

