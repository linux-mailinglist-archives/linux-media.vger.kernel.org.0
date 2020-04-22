Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB9F1B3761
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 08:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgDVGTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 02:19:31 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3224 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgDVGTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 02:19:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9fe19c0000>; Tue, 21 Apr 2020 23:18:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 23:19:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 23:19:06 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 06:19:05 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 22 Apr 2020 06:19:05 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e9fe1d90000>; Tue, 21 Apr 2020 23:19:05 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
Date:   Tue, 21 Apr 2020 23:18:56 -0700
Message-ID: <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587536284; bh=oCgfRxJpmpuXxmCFhS72O4wu8id1nxDAtanmbMAtpss=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=UBF89ViRP7CBUnYdvZqKGDLW1NRDKWZpv0KAR/a7MBoYcrA7aZUDG4NfJ5iyAJpZS
         FBJVNOBT/RdbCfldV5CAllz5kKf72TKU7cNlWLc7ZD5ASunR5fuvTIlS0zpVYQx5hx
         SlZPlZLfcRvfiaa5A7zMcVmuUzNI09fI6KrjaKK7XeAGGB5gYBWbJqo+mFrFq0oHOy
         MOvWjDfqBwVVbZy/di5QgYkyVdMtV79LTJBYWwE54Niat5EUvCb0FOY8aGpoZQYohK
         8GzQa6YHKRjjTBOhB9xq0XQ1rLckJdFNA0zKp1ipSKy0np7n2ew7b10G2tYkCmdw9S
         j3M8SwayApxxA==
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

This patch adds a v4l2 capture driver with media interface for
Tegra210 built-in CSI to VI test pattern generator.

This patch includes TPG support only and all the video pipeline
configuration happens through the video device node.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/Kconfig          |    2 +
 drivers/staging/media/Makefile         |    1 +
 drivers/staging/media/tegra/Kconfig    |   13 +
 drivers/staging/media/tegra/Makefile   |    8 +
 drivers/staging/media/tegra/TODO       |   10 +
 drivers/staging/media/tegra/common.h   |  262 ++++++++
 drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
 drivers/staging/media/tegra/csi.h      |  149 +++++
 drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
 drivers/staging/media/tegra/tegra210.h |  190 ++++++
 drivers/staging/media/tegra/vi.c       | 1132 ++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra/vi.h       |   83 +++
 drivers/staging/media/tegra/video.c    |  153 +++++
 drivers/staging/media/tegra/video.h    |   34 +
 14 files changed, 3352 insertions(+)
 create mode 100644 drivers/staging/media/tegra/Kconfig
 create mode 100644 drivers/staging/media/tegra/Makefile
 create mode 100644 drivers/staging/media/tegra/TODO
 create mode 100644 drivers/staging/media/tegra/common.h
 create mode 100644 drivers/staging/media/tegra/csi.c
 create mode 100644 drivers/staging/media/tegra/csi.h
 create mode 100644 drivers/staging/media/tegra/tegra210.c
 create mode 100644 drivers/staging/media/tegra/tegra210.h
 create mode 100644 drivers/staging/media/tegra/vi.c
 create mode 100644 drivers/staging/media/tegra/vi.h
 create mode 100644 drivers/staging/media/tegra/video.c
 create mode 100644 drivers/staging/media/tegra/video.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e59a846..093a1a8 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -32,6 +32,8 @@ source "drivers/staging/media/omap4iss/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
+source "drivers/staging/media/tegra/Kconfig"
+
 source "drivers/staging/media/tegra-vde/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 23c6824..586a590 100644
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
index 0000000..1513f8b
--- /dev/null
+++ b/drivers/staging/media/tegra/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_TEGRA
+	tristate "NVIDIA Tegra VI driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	select VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select TEGRA_HOST1X
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Choose this option if you have an NVIDIA Tegra SoC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called tegra-video.
diff --git a/drivers/staging/media/tegra/Makefile b/drivers/staging/media/tegra/Makefile
new file mode 100644
index 0000000..c0e24b5
--- /dev/null
+++ b/drivers/staging/media/tegra/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+tegra-video-objs := \
+		video.o \
+		vi.o \
+		csi.o \
+		tegra210.o
+
+obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra/TODO b/drivers/staging/media/tegra/TODO
new file mode 100644
index 0000000..5dcb7a8
--- /dev/null
+++ b/drivers/staging/media/tegra/TODO
@@ -0,0 +1,10 @@
+TODO list
+* Currently driver supports Tegra build-in TPG only with direct media links
+  from CSI to VI. Update the driver to do TPG Vs Sensor media links based on
+  the kernel config CONFIG_VIDEO_TEGRA_TPG.
+* Add real camera sensor capture support
+* Add RAW10 packed video format support to Tegra210 video formats
+* Add Tegra CSI MIPI pads calibration
+* Add MIPI clock Settle time computation based on the data rate
+* Add support for Ganged mode
+* Make sure v4l2-compliance tests pass with all of the above implementations.
diff --git a/drivers/staging/media/tegra/common.h b/drivers/staging/media/tegra/common.h
new file mode 100644
index 0000000..663bb21
--- /dev/null
+++ b/drivers/staging/media/tegra/common.h
@@ -0,0 +1,262 @@
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
+#include "vi.h"
+#include "csi.h"
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
+ *
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
+#define TEGRA_VIDEO_FORMAT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP,	\
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
+ *
+ * @list: list head for this entry
+ * @video: V4L2 video device associated with the video channel
+ * @video_lock: protects the @format and @queue fields
+ * @pad: media pad for the video device entity
+ *
+ * @vi: Tegra video input device structure
+ * @frame_start_sp: host1x syncpoint pointer to synchronize programmed capture
+ *		start condition with hardware frame start events through host1x
+ *		syncpoint counters.
+ * @mw_ack_sp: host1x syncpoint pointer to synchronize programmed memory write
+ *		ack trigger condition with hardware memory write done at end of
+ *		frame through host1x syncpoint counters.
+ * @sp_incr_lock: protects cpu syncpoint increment.
+ *
+ * @kthread_start_capture: kthread to start capture of single frame when
+ *		vb buffer is available. This thread programs VI CSI hardware
+ *		for single frame capture and waits for frame start event from
+ *		the hardware. On receiving frame start event, it wakes up
+ *		kthread_finish_capture thread to wait for finishing frame data
+ *		write to the memory. In case of missing frame start event, this
+ *		thread returns buffer back to vb with VB2_BUF_STATE_ERROR.
+ * @start_wait: waitqueue for starting frame capture when buffer is available.
+ * @kthread_finish_capture: kthread to finish the buffer capture and return to.
+ *		This thread is woken up by kthread_start_capture on receiving
+ *		frame start event from the hardware and this thread waits for
+ *		MW_ACK_DONE event which indicates completion of writing frame
+ *		data to the memory. On receiving MW_ACK_DONE event, buffer is
+ *		returned back to vb with VB2_BUF_STATE_DONE and in case of
+ *		missing MW_ACK_DONE event, buffer is returned back to vb with
+ *		VB2_BUF_STATE_ERROR.
+ * @done_wait: waitqueue for finishing capture data writes to memory.
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
+ * @portno: VI channel port number
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
+	struct host1x_syncpt *frame_start_sp;
+	struct host1x_syncpt *mw_ack_sp;
+	/* protects the cpu syncpoint increment */
+	spinlock_t sp_incr_lock;
+
+	struct task_struct *kthread_start_capture;
+	wait_queue_head_t start_wait;
+	struct task_struct *kthread_finish_capture;
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
+ *
+ * @buf: vb2 buffer base object
+ * @queue: buffer list entry in the channel queued buffers list
+ * @chan: channel that uses the buffer
+ * @addr: Tegra IOVA buffer address for VI output
+ * @mw_ack_sp_thresh: MW_ACK_DONE syncpoint threshold corresponding
+ *		      to the capture buffer.
+ */
+struct tegra_channel_buffer {
+	struct vb2_v4l2_buffer buf;
+	struct list_head queue;
+	struct tegra_vi_channel *chan;
+	dma_addr_t addr;
+	u32 mw_ack_sp_thresh;
+};
+
+struct v4l2_subdev *
+tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan);
+int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
+void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
+				   enum vb2_buffer_state state);
+#endif
diff --git a/drivers/staging/media/tegra/csi.c b/drivers/staging/media/tegra/csi.c
new file mode 100644
index 0000000..c458871
--- /dev/null
+++ b/drivers/staging/media/tegra/csi.c
@@ -0,0 +1,606 @@
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
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "video.h"
+#include "common.h"
+#include "csi.h"
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
+ * CSI is a separate subdevice which has 6 source pads to generate
+ * test pattern. CSI subdevice pad ops are used only for TPG and
+ * allows below TPG formats.
+ */
+static const struct v4l2_mbus_framefmt tegra_csi_tpg_fmts[] = {
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
+	},
+};
+
+static const struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
+	{ 1280, 720 },
+	{ 1920, 1080 },
+	{ 3840, 2160 },
+};
+
+/*
+ * Frame rate table with horizontal and vertical blanking intervals
+ * used by CSI TPG with corresponding format and resolution.
+ * Blanking intervals are tuned values from design team for max TPG
+ * clock rate.
+ */
+static const struct tpg_framerate tegra210_tpg_frmrate_table[] = {
+	{
+		.frmsize = { 1280, 720 },
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.framerate = 120,
+		.h_blank = 512,
+		.v_blank = 8,
+	},
+	{
+		.frmsize = { 1920, 1080 },
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.framerate = 60,
+		.h_blank = 512,
+		.v_blank = 8,
+	},
+	{
+		.frmsize = { 3840, 2160 },
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.framerate = 20,
+		.h_blank = 8,
+		.v_blank = 8,
+	},
+	{
+		.frmsize = { 1280, 720 },
+		.code = MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+		.framerate = 60,
+		.h_blank = 512,
+		.v_blank = 8,
+	},
+	{
+		.frmsize = { 1920, 1080 },
+		.code = MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+		.framerate = 30,
+		.h_blank = 512,
+		.v_blank = 8,
+	},
+	{
+		.frmsize = { 3840, 2160 },
+		.code = MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+		.framerate = 8,
+		.h_blank = 8,
+		.v_blank = 8,
+	},
+};
+
+/*
+ * V4L2 Subdevice Pad Operations
+ */
+
+static int csi_enum_bus_code(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(tegra_csi_tpg_fmts))
+		return -EINVAL;
+
+	code->code = tegra_csi_tpg_fmts[code->index].code;
+
+	return 0;
+}
+
+static int csi_get_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+
+	fmt->format = csi_chan->format;
+
+	return 0;
+}
+
+static int csi_get_frmrate_table_index(struct tegra_csi *csi, u32 code,
+				       u32 width, u32 height)
+{
+	const struct tpg_framerate *frmrate;
+	unsigned int i;
+
+	frmrate = csi->soc->tpg_frmrate_table;
+	for (i = 0; i < csi->soc->tpg_frmrate_table_size; i++) {
+		if (frmrate[i].code == code &&
+		    frmrate[i].frmsize.width == width &&
+		    frmrate[i].frmsize.height == height) {
+			return i;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static void csi_chan_update_blank_intervals(struct tegra_csi_channel *csi_chan,
+					    u32 code, u32 width, u32 height)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	const struct tpg_framerate *frmrate = csi->soc->tpg_frmrate_table;
+	int index;
+
+	index = csi_get_frmrate_table_index(csi_chan->csi, code,
+					    width, height);
+	if (index >= 0) {
+		csi_chan->h_blank = frmrate[index].h_blank;
+		csi_chan->v_blank = frmrate[index].v_blank;
+		csi_chan->framerate = frmrate[index].framerate;
+	}
+}
+
+static int csi_enum_framesizes(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	unsigned int i;
+
+	if (fse->index >= ARRAY_SIZE(tegra_csi_tpg_sizes))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++)
+		if (fse->code == tegra_csi_tpg_fmts[i].code)
+			break;
+
+	if (i == ARRAY_SIZE(tegra_csi_tpg_fmts))
+		return -EINVAL;
+
+	fse->min_width = tegra_csi_tpg_sizes[fse->index].width;
+	fse->max_width = tegra_csi_tpg_sizes[fse->index].width;
+	fse->min_height = tegra_csi_tpg_sizes[fse->index].height;
+	fse->max_height = tegra_csi_tpg_sizes[fse->index].height;
+
+	return 0;
+}
+
+static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
+	const struct tpg_framerate *frmrate = csi->soc->tpg_frmrate_table;
+	int index;
+
+	/* one framerate per format and resolution */
+	if (fie->index > 0)
+		return -EINVAL;
+
+	index = csi_get_frmrate_table_index(csi_chan->csi, fie->code,
+					    fie->width, fie->height);
+	if (index < 0)
+		return -EINVAL;
+
+	fie->interval.numerator = 1;
+	fie->interval.denominator = frmrate[index].framerate;
+
+	return 0;
+}
+
+static int csi_set_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct v4l2_mbus_framefmt *format = &fmt->format;
+	const struct v4l2_frmsize_discrete *sizes;
+	unsigned int i;
+
+	sizes = v4l2_find_nearest_size(tegra_csi_tpg_sizes,
+				       ARRAY_SIZE(tegra_csi_tpg_sizes),
+				       width, height,
+				       format->width, format->width);
+	format->width = sizes->width;
+	format->height = sizes->height;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++)
+		if (format->code == tegra_csi_tpg_fmts[i].code)
+			break;
+
+	if (i == ARRAY_SIZE(tegra_csi_tpg_fmts))
+		i = 0;
+
+	format->code = tegra_csi_tpg_fmts[i].code;
+	format->field = V4L2_FIELD_NONE;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	/* update blanking intervals from frame rate table and format */
+	csi_chan_update_blank_intervals(csi_chan, format->code,
+					format->width, format->height);
+	csi_chan->format = *format;
+
+	return 0;
+}
+
+/*
+ * V4L2 Subdevice Video Operations
+ */
+static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
+				      struct v4l2_subdev_frame_interval *vfi)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+
+	vfi->interval.numerator = 1;
+	vfi->interval.denominator = csi_chan->framerate;
+
+	return 0;
+}
+
+static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
+
+	return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
+}
+
+/*
+ * V4L2 Subdevice Operations
+ */
+static const struct v4l2_subdev_video_ops tegra_csi_video_ops = {
+	.s_stream = tegra_csi_s_stream,
+	.g_frame_interval = tegra_csi_g_frame_interval,
+	.s_frame_interval = tegra_csi_g_frame_interval,
+};
+
+static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
+	.enum_mbus_code		= csi_enum_bus_code,
+	.enum_frame_size	= csi_enum_framesizes,
+	.enum_frame_interval	= csi_enum_frameintervals,
+	.get_fmt		= csi_get_format,
+	.set_fmt		= csi_set_format,
+};
+
+static const struct v4l2_subdev_ops tegra_csi_ops = {
+	.video  = &tegra_csi_video_ops,
+	.pad    = &tegra_csi_pad_ops,
+};
+
+static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
+{
+	struct device_node *node = csi->dev->of_node;
+	unsigned int port_num;
+	struct tegra_csi_channel *chan;
+	unsigned int tpg_channels = csi->soc->csi_max_channels;
+
+	/* allocate CSI channel for each CSI x2 ports */
+	for (port_num = 0; port_num < tpg_channels; port_num++) {
+		chan = kzalloc(sizeof(*chan), GFP_KERNEL);
+		if (!chan)
+			return -ENOMEM;
+
+		list_add_tail(&chan->list, &csi->csi_chans);
+		chan->csi = csi;
+		chan->csi_port_num = port_num;
+		chan->numlanes = 2;
+		chan->of_node = node;
+		chan->numpads = 1;
+		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
+	}
+
+	return 0;
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
+	csi_chan_update_blank_intervals(chan, chan->format.code,
+					chan->format.width,
+					chan->format.height);
+	/* initialize V4L2 subdevice and media entity */
+	subdev = &chan->subdev;
+	v4l2_subdev_init(subdev, &tegra_csi_ops);
+	subdev->dev = csi->dev;
+	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
+		 chan->csi_port_num);
+
+	v4l2_set_subdevdata(subdev, chan);
+	subdev->fwnode = of_fwnode_handle(chan->of_node);
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	/* initialize media entity pads */
+	ret = media_entity_pads_init(&subdev->entity, chan->numpads,
+				     chan->pads);
+	if (ret < 0) {
+		dev_err(csi->dev,
+			"failed to initialize media entity: %d\n", ret);
+		subdev->dev = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+void tegra_csi_error_recover(struct v4l2_subdev *sd)
+{
+	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(sd);
+	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
+	struct tegra_csi *csi = csi_chan->csi;
+
+	/* stop streaming during error recovery */
+	csi->ops->csi_streaming(csi_chan, chan->pg_mode, false);
+	csi->ops->csi_err_recover(csi_chan);
+	csi->ops->csi_streaming(csi_chan, chan->pg_mode, true);
+}
+
+static int tegra_csi_channels_init(struct tegra_csi *csi)
+{
+	struct tegra_csi_channel *chan;
+	int ret;
+
+	list_for_each_entry(chan, &csi->csi_chans, list) {
+		ret = tegra_csi_channel_init(chan);
+		if (ret) {
+			dev_err(csi->dev,
+				"failed to initialize channel-%d: %d\n",
+				chan->csi_port_num, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
+{
+	struct v4l2_subdev *subdev;
+	struct tegra_csi_channel *chan, *tmp;
+
+	list_for_each_entry_safe(chan, tmp, &csi->csi_chans, list) {
+		subdev = &chan->subdev;
+		if (subdev->dev)
+			media_entity_cleanup(&subdev->entity);
+		list_del(&chan->list);
+		kfree(chan);
+	}
+}
+
+static int __maybe_unused csi_runtime_suspend(struct device *dev)
+{
+	struct tegra_csi *csi = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi->soc->num_clks, csi->clks);
+
+	return 0;
+}
+
+static int __maybe_unused csi_runtime_resume(struct device *dev)
+{
+	struct tegra_csi *csi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(csi->soc->num_clks, csi->clks);
+	if (ret < 0) {
+		dev_err(csi->dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tegra_csi_init(struct host1x_client *client)
+{
+	struct tegra_csi *csi = host1x_client_to_csi(client);
+	struct tegra_video_device *vid = dev_get_drvdata(client->host);
+	int ret;
+
+	INIT_LIST_HEAD(&csi->csi_chans);
+
+	ret = pm_runtime_get_sync(csi->dev);
+	if (ret < 0) {
+		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
+		pm_runtime_put_noidle(csi->dev);
+		return ret;
+	}
+
+	ret = tegra_csi_tpg_channels_alloc(csi);
+	if (ret < 0) {
+		dev_err(csi->dev,
+			"failed to allocate tpg channels: %d\n", ret);
+		goto cleanup;
+	}
+
+	ret = tegra_csi_channels_init(csi);
+	if (ret < 0)
+		goto cleanup;
+
+	vid->csi = csi;
+
+	return 0;
+
+cleanup:
+	tegra_csi_channels_cleanup(csi);
+	pm_runtime_put_sync(csi->dev);
+	return ret;
+}
+
+static int tegra_csi_exit(struct host1x_client *client)
+{
+	struct tegra_csi *csi = host1x_client_to_csi(client);
+
+	tegra_csi_channels_cleanup(csi);
+	pm_runtime_put_sync(csi->dev);
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
+	unsigned int i;
+	int ret;
+
+	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
+	if (!csi)
+		return -ENOMEM;
+
+	csi->iomem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi->iomem))
+		return PTR_ERR(csi->iomem);
+
+	csi->soc = of_device_get_match_data(&pdev->dev);
+
+	csi->clks = devm_kcalloc(&pdev->dev, csi->soc->num_clks,
+				 sizeof(*csi->clks), GFP_KERNEL);
+	if (!csi->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < csi->soc->num_clks; i++)
+		csi->clks[i].id = csi->soc->clk_names[i];
+
+	ret = devm_clk_bulk_get(&pdev->dev, csi->soc->num_clks, csi->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get the clocks: %d\n", ret);
+		return ret;
+	}
+
+	if (!pdev->dev.pm_domain) {
+		ret = -ENOENT;
+		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
+		return ret;
+	}
+
+	csi->dev = &pdev->dev;
+	csi->ops = csi->soc->ops;
+	platform_set_drvdata(pdev, csi);
+	pm_runtime_enable(&pdev->dev);
+
+	/* initialize host1x interface */
+	INIT_LIST_HEAD(&csi->client.list);
+	csi->client.ops = &csi_client_ops;
+	csi->client.dev = &pdev->dev;
+
+	ret = host1x_client_register(&csi->client);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"failed to register host1x client: %d\n", ret);
+		goto rpm_disable;
+	}
+
+	return 0;
+
+rpm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int tegra_csi_remove(struct platform_device *pdev)
+{
+	struct tegra_csi *csi = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&csi->client);
+	if (err < 0) {
+		dev_err(&pdev->dev,
+			"failed to unregister host1x client: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const char * const tegra210_csi_cil_clks[] = {
+	"csi",
+	"cilab",
+	"cilcd",
+	"cile",
+	"csi_tpg",
+};
+
+static const struct tegra_csi_ops tegra210_csi_ops = {
+	.csi_streaming = tegra210_csi_streaming,
+	.csi_err_recover = tegra210_csi_error_recover,
+};
+
+static const struct tegra_csi_soc tegra210_csi_soc = {
+	.ops = &tegra210_csi_ops,
+	.csi_max_channels = 6,
+	.clk_names = tegra210_csi_cil_clks,
+	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
+	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
+	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
+};
+
+static const struct of_device_id tegra_csi_of_id_table[] = {
+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_csi_of_id_table);
+
+static const struct dev_pm_ops tegra_csi_pm_ops = {
+	SET_RUNTIME_PM_OPS(csi_runtime_suspend, csi_runtime_resume, NULL)
+};
+
+struct platform_driver tegra_csi_driver = {
+	.driver = {
+		.name		= "tegra-csi",
+		.of_match_table	= tegra_csi_of_id_table,
+		.pm		= &tegra_csi_pm_ops,
+	},
+	.probe			= tegra_csi_probe,
+	.remove			= tegra_csi_remove,
+};
+
+MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra/csi.h b/drivers/staging/media/tegra/csi.h
new file mode 100644
index 0000000..7dd0e55
--- /dev/null
+++ b/drivers/staging/media/tegra/csi.h
@@ -0,0 +1,149 @@
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
+/**
+ * struct tegra_csi_channel - Tegra CSI channel
+ *
+ * @list: list head for this entry
+ * @subdev: V4L2 subdevice associated with this channel
+ * @pads: media pads for the subdevice entity
+ * @numpads: number of pads.
+ * @csi: Tegra CSI device structure
+ * @of_node: csi device tree node
+ * @numlanes: number of lanes used per port/channel
+ * @csi_port_num: CSI channel port number
+ * @format: active format of the channel
+ * @framerate: active framerate for TPG
+ * @h_blank: horizontal blanking for TPG active format
+ * @v_blank: vertical blanking for TPG active format
+ */
+struct tegra_csi_channel {
+	struct list_head list;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[TEGRA_CSI_PADS_NUM];
+	unsigned int numpads;
+	struct tegra_csi *csi;
+	struct device_node *of_node;
+	unsigned int numlanes;
+	u8 csi_port_num;
+	struct v4l2_mbus_framefmt format;
+	unsigned int framerate;
+	unsigned int h_blank;
+	unsigned int v_blank;
+};
+
+/**
+ * struct tpg_framerate - Tegra CSI TPG framerate configuration
+ *
+ * @frmsize: frame resolution
+ * @code: media bus format code
+ * @h_blank: horizontal blanking used for TPG
+ * @v_blank: vertical blanking interval used for TPG
+ * @framerate: framerate achieved with the corresponding blanking intervals,
+ *		format and resolution.
+ */
+struct tpg_framerate {
+	struct v4l2_frmsize_discrete frmsize;
+	u32 code;
+	unsigned int h_blank;
+	unsigned int v_blank;
+	unsigned int framerate;
+};
+
+/**
+ * struct tegra_csi_ops - Tegra CSI operations
+ *
+ * @csi_streaming: programs csi hardware to enable or disable streaming.
+ * @csi_err_recover: csi hardware block recovery in case of any capture errors
+ *		due to missing source stream or due to improper csi input from
+ *		the external source.
+ */
+struct tegra_csi_ops {
+	int (*csi_streaming)(struct tegra_csi_channel *csi_chan, u8 pg_mode,
+			     int enable);
+	void (*csi_err_recover)(struct tegra_csi_channel *csi_chan);
+};
+
+/**
+ * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
+ *
+ * @ops: csi hardware operations
+ * @csi_max_channels: supported max streaming channels
+ * @clk_names: csi and cil clock names
+ * @num_clks: total clocks count
+ * @tpg_frmrate_table: csi tpg frame rate table with blanking intervals
+ * @tpg_frmrate_table_size: size of frame rate table
+ */
+struct tegra_csi_soc {
+	const struct tegra_csi_ops *ops;
+	unsigned int csi_max_channels;
+	const char * const *clk_names;
+	unsigned int num_clks;
+	const struct tpg_framerate *tpg_frmrate_table;
+	unsigned int tpg_frmrate_table_size;
+};
+
+/**
+ * struct tegra_csi - NVIDIA Tegra CSI device structure
+ *
+ * @dev: device struct
+ * @client: host1x_client struct
+ * @iomem: register base
+ * @clks: clock for CSI and CIL
+ * @soc: pointer to SoC data structure
+ * @ops: csi operations
+ * @channels: list head for CSI channels
+ */
+struct tegra_csi {
+	struct device *dev;
+	struct host1x_client client;
+	void __iomem *iomem;
+	struct clk_bulk_data *clks;
+	const struct tegra_csi_soc *soc;
+	const struct tegra_csi_ops *ops;
+	struct list_head csi_chans;
+};
+
+void tegra_csi_error_recover(struct v4l2_subdev *subdev);
+
+void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan);
+int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
+			   int enable);
+#endif
diff --git a/drivers/staging/media/tegra/tegra210.c b/drivers/staging/media/tegra/tegra210.c
new file mode 100644
index 0000000..5c27bb1
--- /dev/null
+++ b/drivers/staging/media/tegra/tegra210.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+/*
+ * This source file contains both VI and CSI specific operations and
+ * registers accessors.
+ */
+#include <linux/clk.h>
+#include <linux/clk/tegra.h>
+#include <linux/delay.h>
+#include <linux/freezer.h>
+#include <linux/completion.h>
+
+#include "common.h"
+#include "csi.h"
+#include "vi.h"
+#include "tegra210.h"
+
+#define TEGRA210_CSI_PORT_OFFSET		0x34
+#define TEGRA210_CSI_CIL_OFFSET			0x0f4
+#define TEGRA210_CSI_TPG_OFFSET			0x18c
+
+#define CSI_PP_OFFSET(block)			((block) * 0x800)
+#define TEGRA210_VI_CSI_BASE(x)			(0x100 + (x) * 0x100)
+
+/* Tegra210 VI registers accessors */
+static void tegra_vi_write(struct tegra_vi_channel *chan, unsigned int addr,
+			   u32 val)
+{
+	writel_relaxed(val, chan->vi->iomem + addr);
+}
+
+static u32 tegra_vi_read(struct tegra_vi_channel *chan, unsigned int addr)
+{
+	return readl_relaxed(chan->vi->iomem + addr);
+}
+
+/* Tegra210 VI_CSI registers accessors */
+static void vi_csi_write(struct tegra_vi_channel *chan, unsigned int addr,
+			 u32 val)
+{
+	void __iomem *vi_csi_base;
+
+	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
+
+	writel_relaxed(val, vi_csi_base + addr);
+}
+
+static u32 vi_csi_read(struct tegra_vi_channel *chan, unsigned int addr)
+{
+	void __iomem *vi_csi_base;
+
+	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
+
+	return readl_relaxed(vi_csi_base + addr);
+}
+
+/*
+ * Tegra210 VI channel capture operations
+ */
+static int tegra_channel_capture_setup(struct tegra_vi_channel *chan)
+{
+	u32 height = chan->format.height;
+	u32 width = chan->format.width;
+	u32 format = chan->fmtinfo->img_fmt;
+	u32 data_type = chan->fmtinfo->img_dt;
+	u32 word_count = (width * chan->fmtinfo->bit_width) / 8;
+
+	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xffffffff);
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
+static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
+{
+	/* disable clock gating to enable continuous clock */
+	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
+	/*
+	 * Soft reset memory client interface, pixel format logic, sensor
+	 * control logic, and a shadow copy logic to bring VI to clean state.
+	 */
+	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
+	usleep_range(100, 200);
+	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
+
+	/* enable back VI clock gating */
+	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
+}
+
+static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan)
+{
+	struct v4l2_subdev *subdev;
+	u32 val;
+
+	/*
+	 * Recover VI and CSI hardware blocks in case of missing frame start
+	 * events due to source not streaming or noisy csi inputs from the
+	 * external source or many outstanding frame start or MW_ACK_DONE
+	 * events which can cause CSI and VI hardware hang.
+	 * This helps to have a clean capture for next frame.
+	 */
+	val = vi_csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
+	dev_dbg(&chan->video.dev, "TEGRA_VI_CSI_ERROR_STATUS 0x%08x\n", val);
+	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
+
+	val = tegra_vi_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR);
+	dev_dbg(&chan->video.dev,
+		"TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR 0x%08x\n", val);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
+
+	/* recover VI by issuing software reset and re-setup for capture */
+	tegra_channel_vi_soft_reset(chan);
+	tegra_channel_capture_setup(chan);
+
+	/* recover CSI block */
+	subdev = tegra_channel_get_remote_subdev(chan);
+	tegra_csi_error_recover(subdev);
+}
+
+static struct tegra_channel_buffer *
+dequeue_buf_done(struct tegra_vi_channel *chan)
+{
+	struct tegra_channel_buffer *buf = NULL;
+
+	spin_lock(&chan->done_lock);
+	if (list_empty(&chan->done)) {
+		spin_unlock(&chan->done_lock);
+		return NULL;
+	}
+
+	buf = list_first_entry(&chan->done,
+			       struct tegra_channel_buffer, queue);
+	if (buf)
+		list_del_init(&buf->queue);
+
+	spin_unlock(&chan->done_lock);
+
+	return buf;
+}
+
+static void release_buffer(struct tegra_vi_channel *chan,
+			   struct tegra_channel_buffer *buf,
+			   enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vb = &buf->buf;
+
+	vb->sequence = chan->sequence++;
+	vb->field = V4L2_FIELD_NONE;
+	vb->vb2_buf.timestamp = ktime_get_ns();
+	vb2_buffer_done(&vb->vb2_buf, state);
+}
+
+static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
+				       struct tegra_channel_buffer *buf)
+{
+	int err = 0;
+	u32 thresh, value, frame_start, mw_ack_done;
+	int bytes_per_line = chan->format.bytesperline;
+
+	/* program buffer address by using surface 0 */
+	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
+		     (u64)buf->addr >> 32);
+	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
+	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
+
+	/*
+	 * Tegra VI block interacts with host1x syncpt for synchronizing
+	 * programmed condition of capture state and hardware operation.
+	 * Frame start and Memory write acknowledge syncpts has their own
+	 * FIFO of depth 2.
+	 *
+	 * Syncpoint trigger conditions set through VI_INCR_SYNCPT register
+	 * are added to HW syncpt FIFO and when the HW triggers, syncpt
+	 * condition is removed from the FIFO and counter at syncpoint index
+	 * will be incremented by the hardware and software can wait for
+	 * counter to reach threshold to synchronize capturing frame with the
+	 * hardware capture events.
+	 */
+
+	/* increase channel syncpoint threshold for FRAME_START */
+	thresh = host1x_syncpt_incr_max(chan->frame_start_sp, 1);
+
+	/* Program FRAME_START trigger condition syncpt request */
+	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
+	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
+		host1x_syncpt_id(chan->frame_start_sp);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+
+	/* increase channel syncpoint threshold for MW_ACK_DONE */
+	buf->mw_ack_sp_thresh = host1x_syncpt_incr_max(chan->mw_ack_sp, 1);
+
+	/* Program MW_ACK_DONE trigger condition syncpt request */
+	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
+	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
+		host1x_syncpt_id(chan->mw_ack_sp);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+
+	/* enable single shot capture */
+	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
+
+	/* wait for syncpt counter to reach frame start event threshold */
+	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
+				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
+	if (err) {
+		dev_err_ratelimited(&chan->video.dev,
+				    "frame start syncpt timeout: %d\n", err);
+		/* increment syncpoint counter for timedout events */
+		host1x_syncpt_incr(chan->frame_start_sp);
+		spin_lock(&chan->sp_incr_lock);
+		host1x_syncpt_incr(chan->mw_ack_sp);
+		spin_unlock(&chan->sp_incr_lock);
+		/* clear errors and recover */
+		tegra_channel_capture_error_recover(chan);
+		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
+		return err;
+	}
+
+	/* move buffer to capture done queue */
+	spin_lock(&chan->done_lock);
+	list_add_tail(&buf->queue, &chan->done);
+	spin_unlock(&chan->done_lock);
+
+	/* wait up kthread for capture done */
+	wake_up_interruptible(&chan->done_wait);
+
+	return 0;
+}
+
+static void tegra_channel_capture_done(struct tegra_vi_channel *chan,
+				       struct tegra_channel_buffer *buf)
+{
+	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
+	u32 value;
+	int ret;
+
+	/* wait for syncpt counter to reach MW_ACK_DONE event threshold */
+	ret = host1x_syncpt_wait(chan->mw_ack_sp, buf->mw_ack_sp_thresh,
+				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
+	if (ret) {
+		dev_err_ratelimited(&chan->video.dev,
+				    "MW_ACK_DONE syncpt timeout: %d\n", ret);
+		state = VB2_BUF_STATE_ERROR;
+		/* increment syncpoint counter for timedout event */
+		spin_lock(&chan->sp_incr_lock);
+		host1x_syncpt_incr(chan->mw_ack_sp);
+		spin_unlock(&chan->sp_incr_lock);
+	}
+
+	release_buffer(chan, buf, state);
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
+
+		if (kthread_should_stop())
+			break;
+
+		/*
+		 * Source is not streaming if error is non-zero.
+		 * So, do not dequeue buffers on capture error.
+		 */
+		if (err)
+			continue;
+
+		/* dequeue the buffer and start capture */
+		spin_lock(&chan->start_lock);
+		if (list_empty(&chan->capture)) {
+			spin_unlock(&chan->start_lock);
+			continue;
+		}
+
+		buf = list_first_entry(&chan->capture,
+				       struct tegra_channel_buffer, queue);
+		list_del_init(&buf->queue);
+		spin_unlock(&chan->start_lock);
+
+		err = tegra_channel_capture_frame(chan, buf);
+		if (err)
+			vb2_queue_error(&chan->queue);
+	}
+
+	return 0;
+}
+
+static int chan_capture_kthread_finish(void *data)
+{
+	struct tegra_vi_channel *chan = data;
+	struct tegra_channel_buffer *buf;
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
+		/* dequeue buffers and finish capture */
+		buf = dequeue_buf_done(chan);
+		while (buf) {
+			tegra_channel_capture_done(chan, buf);
+			buf = dequeue_buf_done(chan);
+		}
+
+		if (kthread_should_stop())
+			break;
+	}
+
+	return 0;
+}
+
+int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+	struct media_pipeline *pipe = &chan->video.pipe;
+	u32 val;
+	int ret;
+
+	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
+
+	/* clear errors */
+	val = vi_csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
+	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
+
+	val = tegra_vi_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR);
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
+
+	/*
+	 * Sync point FIFO full stalls the host interface.
+	 * Setting NO_STALL will drop INCR_SYNCPT methods when fifos are
+	 * full and the corresponding condition bits in INCR_SYNCPT_ERROR
+	 * register will be set.
+	 * This allows SW to process error recovery.
+	 */
+	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL,
+		       TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL);
+
+	/* start the pipeline */
+	ret = media_pipeline_start(&chan->video.entity, pipe);
+	if (ret < 0)
+		goto error_pipeline_start;
+
+	tegra_channel_capture_setup(chan);
+	ret = tegra_channel_set_stream(chan, true);
+	if (ret < 0)
+		goto error_set_stream;
+
+	chan->sequence = 0;
+
+	/* start kthreads to capture data to buffer and return them */
+	chan->kthread_start_capture = kthread_run(chan_capture_kthread_start,
+						  chan, "%s:0",
+						  chan->video.name);
+	if (IS_ERR(chan->kthread_start_capture)) {
+		ret = PTR_ERR(chan->kthread_start_capture);
+		chan->kthread_start_capture = NULL;
+		dev_err(&chan->video.dev,
+			"failed to run capture start kthread: %d\n", ret);
+		goto error_kthread_start;
+	}
+
+	chan->kthread_finish_capture = kthread_run(chan_capture_kthread_finish,
+						   chan, "%s:1",
+						   chan->video.name);
+	if (IS_ERR(chan->kthread_finish_capture)) {
+		ret = PTR_ERR(chan->kthread_finish_capture);
+		chan->kthread_finish_capture = NULL;
+		dev_err(&chan->video.dev,
+			"failed to run capture finish kthread: %d\n", ret);
+		goto error_kthread_done;
+	}
+
+	return 0;
+
+error_kthread_done:
+	kthread_stop(chan->kthread_start_capture);
+error_kthread_start:
+	tegra_channel_set_stream(chan, false);
+error_set_stream:
+	media_pipeline_stop(&chan->video.entity);
+error_pipeline_start:
+	vq->start_streaming_called = 0;
+	tegra_channel_release_buffers(chan, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+void tegra210_vi_stop_streaming(struct vb2_queue *vq)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+
+	if (chan->kthread_start_capture) {
+		kthread_stop(chan->kthread_start_capture);
+		chan->kthread_start_capture = NULL;
+	}
+
+	if (chan->kthread_finish_capture) {
+		kthread_stop(chan->kthread_finish_capture);
+		chan->kthread_finish_capture = NULL;
+	}
+
+	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
+	tegra_channel_set_stream(chan, false);
+	media_pipeline_stop(&chan->video.entity);
+}
+
+/* Tegra210 CSI PHY registers accessors */
+static void csi_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
+		      u32 val)
+{
+	void __iomem *csi_pp_base;
+
+	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
+
+	writel_relaxed(val, csi_pp_base + addr);
+}
+
+/* Tegra210 CSI Pixel parser registers accessors */
+static void pp_write(struct tegra_csi *csi, u8 portno, u32 addr, u32 val)
+{
+	void __iomem *csi_pp_base;
+	unsigned int offset;
+
+	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
+
+	writel_relaxed(val, csi_pp_base + offset + addr);
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
+	return readl_relaxed(csi_pp_base + offset + addr);
+}
+
+/* Tegra210 CSI CIL A/B port registers accessors */
+static void cil_write(struct tegra_csi *csi, u8 portno, u32 addr, u32 val)
+{
+	void __iomem *csi_cil_base;
+	unsigned int offset;
+
+	csi_cil_base = csi->iomem + CSI_PP_OFFSET(portno >> 1) +
+		       TEGRA210_CSI_CIL_OFFSET;
+	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
+
+	writel_relaxed(val, csi_cil_base + offset + addr);
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
+	return readl_relaxed(csi_cil_base + offset + addr);
+}
+
+/* Tegra210 CSI Test pattern generator registers accessor */
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
+	writel_relaxed(val, csi_pp_base + offset + addr);
+}
+
+/*
+ * Tegra210 CSI operations
+ */
+void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int port_num = csi_chan->csi_port_num;
+	u32 val;
+
+	/*
+	 * Recover CSI hardware in case of capture errors by issuing
+	 * software reset to CSICIL sensor, pixel parser, and clear errors
+	 * to have clean capture on  next streaming.
+	 */
+	val = pp_read(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS);
+	dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n", val);
+
+	val = cil_read(csi, port_num, TEGRA_CSI_CIL_STATUS);
+	dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
+
+	val = cil_read(csi, port_num, TEGRA_CSI_CILX_STATUS);
+	dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
+
+	if (csi_chan->numlanes == 4) {
+		/* reset CSI CIL sensor */
+		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
+		cil_write(csi, port_num + 1,
+			  TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
+		/*
+		 * SW_STATUS_RESET resets all status bits of PPA, PPB, CILA,
+		 * CILB status registers and debug counters.
+		 * So, SW_STATUS_RESET can be used only when CSI Brick is in
+		 * x4 mode.
+		 */
+		csi_write(csi, port_num, TEGRA_CSI_CSI_SW_STATUS_RESET, 0x1);
+
+		/* sleep for 20 clock cycles to drain the FIFO */
+		usleep_range(10, 20);
+
+		cil_write(csi, port_num + 1,
+			  TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
+		csi_write(csi, port_num, TEGRA_CSI_CSI_SW_STATUS_RESET, 0x0);
+	} else {
+		/* reset CSICIL sensor */
+		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
+		usleep_range(10, 20);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
+
+		/* clear the errors */
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS,
+			 0xffffffff);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, 0xffffffff);
+		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, 0xffffffff);
+	}
+}
+
+int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
+			   int enable)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int port_num = csi_chan->csi_port_num;
+	u32 val;
+
+	if (enable) {
+		csi_write(csi, port_num, TEGRA_CSI_CLKEN_OVERRIDE, 0);
+
+		/* clean up status */
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS,
+			 0xffffffff);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, 0xffffffff);
+		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, 0xffffffff);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
+
+		/* CIL PHY registers setup */
+		cil_write(csi, port_num, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_PHY_CONTROL, 0xa);
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
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_STATUS, 0xffffffff);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CILX_STATUS, 0xffffffff);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
+
+			cil_write(csi, port_num,
+				  TEGRA_CSI_CIL_PAD_CONFIG0, BRICK_CLOCK_A_4X);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
+			cil_write(csi, port_num + 1,
+				  TEGRA_CSI_CIL_PHY_CONTROL, 0xa);
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE);
+		} else {
+			val = ((port_num & 1) == PORT_A) ?
+			      CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_NOP :
+			      CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_NOP;
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  val);
+		}
+
+		/* CSI pixel parser registers setup */
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
+			 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
+			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_RST);
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK,
+			 0x0);
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_CONTROL0,
+			 CSI_PP_PACKET_HEADER_SENT |
+			 CSI_PP_DATA_IDENTIFIER_ENABLE |
+			 CSI_PP_WORD_COUNT_SELECT_HEADER |
+			 CSI_PP_CRC_CHECK_ENABLE |  CSI_PP_WC_CHECK |
+			 CSI_PP_OUTPUT_FORMAT_STORE | CSI_PPA_PAD_LINE_NOPAD |
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
+			tpg_write(csi, port_num, TEGRA_CSI_PG_BLANK,
+				  csi_chan->v_blank << PG_VBLANK_OFFSET |
+				  csi_chan->h_blank);
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
+			 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
+			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_ENABLE);
+	} else {
+		val = pp_read(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS);
+
+		dev_dbg(csi->dev,
+			"TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n", val);
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS, val);
+
+		val = cil_read(csi, port_num, TEGRA_CSI_CIL_STATUS);
+		dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
+		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, val);
+
+		val = cil_read(csi, port_num, TEGRA_CSI_CILX_STATUS);
+		dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
+		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, val);
+
+		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
+			 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
+			 CSI_PP_DISABLE);
+
+		if (pg_mode) {
+			tpg_write(csi, port_num,
+				  TEGRA_CSI_PATTERN_GENERATOR_CTRL,
+				  PG_DISABLE);
+			return 0;
+		}
+
+		if (csi_chan->numlanes == 4) {
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  CSI_A_PHY_CIL_DISABLE |
+				  CSI_B_PHY_CIL_DISABLE);
+
+		} else {
+			val = ((port_num & 1) == PORT_A) ?
+			      CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
+			      CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
+			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
+				  val);
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/tegra/tegra210.h b/drivers/staging/media/tegra/tegra210.h
new file mode 100644
index 0000000..0786270
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
+#define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
+#define TEGRA_VI_CFG_VI_INCR_SYNCPT			0x000
+#define   VI_CFG_VI_INCR_SYNCPT_COND(x)			(((x) & 0xff) << 8)
+#define   VI_CSI_PP_LINE_START(port)			(4 + (port) * 4)
+#define   VI_CSI_PP_FRAME_START(port)			(5 + (port) * 4)
+#define   VI_CSI_MW_REQ_DONE(port)			(6 + (port) * 4)
+#define   VI_CSI_MW_ACK_DONE(port)			(7 + (port) * 4)
+
+#define TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL		0x004
+#define TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL		BIT(8)
+#define TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR		0x008
+#define TEGRA_VI_CFG_CTXSW				0x020
+#define TEGRA_VI_CFG_INTSTATUS				0x024
+#define TEGRA_VI_CFG_PWM_CONTROL			0x038
+#define TEGRA_VI_CFG_PWM_HIGH_PULSE			0x03c
+#define TEGRA_VI_CFG_PWM_LOW_PULSE			0x040
+#define TEGRA_VI_CFG_PWM_SELECT_PULSE_A			0x044
+#define TEGRA_VI_CFG_PWM_SELECT_PULSE_B			0x048
+#define TEGRA_VI_CFG_PWM_SELECT_PULSE_C			0x04c
+#define TEGRA_VI_CFG_PWM_SELECT_PULSE_D			0x050
+#define TEGRA_VI_CFG_VGP1				0x064
+#define TEGRA_VI_CFG_VGP2				0x068
+#define TEGRA_VI_CFG_VGP3				0x06c
+#define TEGRA_VI_CFG_VGP4				0x070
+#define TEGRA_VI_CFG_VGP5				0x074
+#define TEGRA_VI_CFG_VGP6				0x078
+#define TEGRA_VI_CFG_INTERRUPT_MASK			0x08c
+#define TEGRA_VI_CFG_INTERRUPT_TYPE_SELECT		0x090
+#define TEGRA_VI_CFG_INTERRUPT_POLARITY_SELECT		0x094
+#define TEGRA_VI_CFG_INTERRUPT_STATUS			0x098
+#define TEGRA_VI_CFG_VGP_SYNCPT_CONFIG			0x0ac
+#define TEGRA_VI_CFG_VI_SW_RESET			0x0b4
+#define TEGRA_VI_CFG_CG_CTRL				0x0b8
+#define   VI_CG_2ND_LEVEL_EN				0x1
+#define TEGRA_VI_CFG_VI_MCCIF_FIFOCTRL			0x0e4
+#define TEGRA_VI_CFG_TIMEOUT_WCOAL_VI			0x0e8
+#define TEGRA_VI_CFG_DVFS				0x0f0
+#define TEGRA_VI_CFG_RESERVE				0x0f4
+#define TEGRA_VI_CFG_RESERVE_1				0x0f8
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
+#define   CSI_PPA_PAD_LINE_NOPAD			(0x2 << 24)
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
+#endif
diff --git a/drivers/staging/media/tegra/vi.c b/drivers/staging/media/tegra/vi.c
new file mode 100644
index 0000000..db07658
--- /dev/null
+++ b/drivers/staging/media/tegra/vi.c
@@ -0,0 +1,1132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
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
+#include <linux/pm_runtime.h>
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
+#include "video.h"
+#include "common.h"
+#include "vi.h"
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
+struct v4l2_subdev *
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
+int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
+{
+	struct v4l2_subdev *subdev;
+	int ret;
+
+	/* stream CSI */
+	subdev = tegra_channel_get_remote_subdev(chan);
+	ret = v4l2_subdev_call(subdev, video, s_stream, on);
+	if (on && ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	return 0;
+}
+
+void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
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
+
+	spin_lock(&chan->done_lock);
+	list_for_each_entry_safe(buf, nbuf, &chan->done, queue) {
+		vb2_buffer_done(&buf->buf.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+
+	spin_unlock(&chan->done_lock);
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
+	struct tegra_vi_channel *chan = video_drvdata(file);
+
+	strscpy(cap->driver, "tegra-video", sizeof(cap->driver));
+	strscpy(cap->card, chan->video.name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(chan->vi->dev));
+
+	return 0;
+}
+
+static int tegra_channel_g_parm(struct file *file, void *fh,
+				struct v4l2_streamparm *a)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_subdev(chan);
+	return v4l2_g_parm_cap(&chan->video, subdev, a);
+}
+
+static int tegra_channel_s_parm(struct file *file, void *fh,
+				struct v4l2_streamparm *a)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_subdev(chan);
+	return v4l2_s_parm_cap(&chan->video, subdev, a);
+}
+
+static int tegra_channel_enum_framesizes(struct file *file, void *fh,
+					 struct v4l2_frmsizeenum *sizes)
+{
+	int ret;
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.index = sizes->index,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, sizes->pixel_format);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	fse.code = fmtinfo->code;
+
+	subdev = tegra_channel_get_remote_subdev(chan);
+	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
+	if (ret)
+		return ret;
+
+	sizes->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	sizes->discrete.width = fse.max_width;
+	sizes->discrete.height = fse.max_height;
+
+	return 0;
+}
+
+static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
+					     struct v4l2_frmivalenum *ivals)
+{
+	int ret;
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.index = ivals->index,
+		.width = ivals->width,
+		.height = ivals->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, ivals->pixel_format);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	fie.code = fmtinfo->code;
+
+	subdev = tegra_channel_get_remote_subdev(chan);
+	ret = v4l2_subdev_call(subdev, pad, enum_frame_interval, NULL, &fie);
+	if (ret)
+		return ret;
+
+	ivals->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	ivals->discrete.numerator = fie.interval.numerator;
+	ivals->discrete.denominator = fie.interval.denominator;
+
+	return 0;
+}
+
+static int tegra_channel_enum_format(struct file *file, void *fh,
+				     struct v4l2_fmtdesc *f)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
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
+	struct tegra_vi_channel *chan = video_drvdata(file);
+
+	format->fmt.pix = chan->format;
+
+	return 0;
+}
+
+static void tegra_channel_fmt_align(struct tegra_vi_channel *chan,
+				    struct v4l2_pix_format *pix,
+				    unsigned int bpp)
+{
+	unsigned int align;
+	unsigned int min_width;
+	unsigned int max_width;
+	unsigned int width;
+	unsigned int min_bpl;
+	unsigned int max_bpl;
+	unsigned int bpl;
+
+	/*
+	 * The transfer alignment requirements are expressed in bytes. Compute
+	 * minimum and maximum values, clamp the requested width and convert
+	 * it back to pixels. Use bytesperline to adjust the width.
+	 */
+	align = lcm(SURFACE_ALIGN_BYTES, bpp);
+	min_width = roundup(TEGRA_MIN_WIDTH, align);
+	max_width = rounddown(TEGRA_MAX_WIDTH, align);
+	width = roundup(pix->width * bpp, align);
+
+	pix->width = clamp(width, min_width, max_width) / bpp;
+	pix->height = clamp(pix->height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
+
+	/* Clamp the requested bytes per line value. If the maximum bytes per
+	 * line value is zero, the module doesn't support user configurable
+	 * line sizes. Override the requested value with the minimum in that
+	 * case.
+	 */
+	min_bpl = pix->width * bpp;
+	max_bpl = rounddown(TEGRA_MAX_WIDTH, SURFACE_ALIGN_BYTES);
+	bpl = roundup(pix->bytesperline, SURFACE_ALIGN_BYTES);
+
+	pix->bytesperline = clamp(bpl, min_bpl, max_bpl);
+	pix->sizeimage = pix->bytesperline * pix->height;
+}
+
+static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
+				      struct v4l2_pix_format *pix)
+{
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev *subdev;
+	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev_pad_config *pad_cfg;
+
+	subdev = tegra_channel_get_remote_subdev(chan);
+	pad_cfg = v4l2_subdev_alloc_pad_config(subdev);
+	if (!pad_cfg)
+		return -ENOMEM;
+	/*
+	 * Retrieve the format information and if requested format isn't
+	 * supported, keep the current format.
+	 */
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+	if (!fmtinfo) {
+		pix->pixelformat = chan->format.pixelformat;
+		pix->colorspace = chan->format.colorspace;
+		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
+						     pix->pixelformat);
+	}
+
+	pix->field = V4L2_FIELD_NONE;
+	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
+	fmt.pad = 0;
+	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
+	v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
+	v4l2_fill_pix_format(pix, &fmt.format);
+	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
+
+	v4l2_subdev_free_pad_config(pad_cfg);
+
+	return 0;
+}
+
+static int tegra_channel_try_format(struct file *file, void *fh,
+				    struct v4l2_format *format)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+
+	return __tegra_channel_try_format(chan, &format->fmt.pix);
+}
+
+static int tegra_channel_set_format(struct file *file, void *fh,
+				    struct v4l2_format *format)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev *subdev;
+	struct v4l2_pix_format *pix = &format->fmt.pix;
+	int ret;
+
+	if (vb2_is_busy(&chan->queue))
+		return -EBUSY;
+
+	/* get supported format by try_fmt */
+	ret = __tegra_channel_try_format(chan, pix);
+	if (ret)
+		return ret;
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.pad = 0;
+	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
+	subdev = tegra_channel_get_remote_subdev(chan);
+	v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
+	v4l2_fill_pix_format(pix, &fmt.format);
+	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
+
+	chan->format = *pix;
+	chan->fmtinfo = fmtinfo;
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
+
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
+	.vidioc_g_parm			= tegra_channel_g_parm,
+	.vidioc_s_parm			= tegra_channel_s_parm,
+	.vidioc_enum_framesizes		= tegra_channel_enum_framesizes,
+	.vidioc_enum_frameintervals	= tegra_channel_enum_frameintervals,
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
+static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
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
+		return ret;
+	}
+
+	return 0;
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
+static void tegra_channel_cleanup(struct tegra_vi_channel *chan)
+{
+	v4l2_ctrl_handler_free(&chan->ctrl_handler);
+	media_entity_cleanup(&chan->video.entity);
+	host1x_syncpt_free(chan->mw_ack_sp);
+	host1x_syncpt_free(chan->frame_start_sp);
+	mutex_destroy(&chan->video_lock);
+}
+
+void tegra_channels_cleanup(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan, *tmp;
+
+	if (!vi)
+		return;
+
+	list_for_each_entry_safe(chan, tmp, &vi->vi_chans, list) {
+		tegra_channel_cleanup(chan);
+		list_del(&chan->list);
+		kfree(chan);
+	}
+}
+
+static int tegra_channel_init(struct tegra_vi_channel *chan)
+{
+	struct tegra_vi *vi = chan->vi;
+	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
+	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
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
+	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+
+	chan->frame_start_sp = host1x_syncpt_request(&vi->client, flags);
+	if (!chan->frame_start_sp) {
+		dev_err(vi->dev, "failed to request frame start syncpoint\n");
+		return -ENOMEM;
+	}
+
+	chan->mw_ack_sp = host1x_syncpt_request(&vi->client, flags);
+	if (!chan->mw_ack_sp) {
+		dev_err(vi->dev, "failed to request memory ack syncpoint\n");
+		ret = -ENOMEM;
+		goto free_fs_syncpt;
+	}
+
+	/* initialize the media entity */
+	chan->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&chan->video.entity, 1, &chan->pad);
+	if (ret < 0) {
+		dev_err(vi->dev,
+			"failed to initialize media entity: %d\n", ret);
+		goto free_mw_ack_syncpt;
+	}
+
+	ret = v4l2_ctrl_handler_init(&chan->ctrl_handler, MAX_CID_CONTROLS);
+	if (chan->ctrl_handler.error) {
+		dev_err(vi->dev,
+			"failed to initialize v4l2 ctrl handler: %d\n", ret);
+		goto cleanup_media;
+	}
+
+	/* initialize the video_device */
+	chan->video.fops = &tegra_channel_fops;
+	chan->video.v4l2_dev = &vid->v4l2_dev;
+	chan->video.release = video_device_release_empty;
+	chan->video.queue = &chan->queue;
+	snprintf(chan->video.name, sizeof(chan->video.name), "%s-%s-%u",
+		 dev_name(vi->dev), "output", chan->portno);
+	chan->video.vfl_type = VFL_TYPE_VIDEO;
+	chan->video.vfl_dir = VFL_DIR_RX;
+	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
+	chan->video.ctrl_handler = &chan->ctrl_handler;
+	chan->video.lock = &chan->video_lock;
+	chan->video.device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				  V4L2_CAP_STREAMING |
+				  V4L2_CAP_READWRITE;
+	video_set_drvdata(&chan->video, chan);
+
+	chan->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	chan->queue.io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	chan->queue.lock = &chan->video_lock;
+	chan->queue.drv_priv = chan;
+	chan->queue.buf_struct_size = sizeof(struct tegra_channel_buffer);
+	chan->queue.ops = &tegra_channel_queue_qops;
+	chan->queue.mem_ops = &vb2_dma_contig_memops;
+	chan->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	chan->queue.min_buffers_needed = 2;
+	chan->queue.dev = vi->dev;
+	ret = vb2_queue_init(&chan->queue);
+	if (ret < 0) {
+		dev_err(vi->dev, "failed to initialize vb2 queue: %d\n", ret);
+		goto free_v4l2_ctrl_hdl;
+	}
+
+	return 0;
+
+free_v4l2_ctrl_hdl:
+	v4l2_ctrl_handler_free(&chan->ctrl_handler);
+cleanup_media:
+	media_entity_cleanup(&chan->video.entity);
+free_mw_ack_syncpt:
+	host1x_syncpt_free(chan->mw_ack_sp);
+free_fs_syncpt:
+	host1x_syncpt_free(chan->frame_start_sp);
+	return ret;
+}
+
+static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan;
+	unsigned int port_num;
+	unsigned int nchannels = vi->soc->vi_max_channels;
+	int ret = 0;
+
+	for (port_num = 0; port_num < nchannels; port_num++) {
+		/*
+		 * Do not use devm_kzalloc as memory is freed immediately
+		 * when device instance is unbound but application might still
+		 * be holding the device node open. Channel memory allocated
+		 * with kzalloc is freed during video device release callback.
+		 */
+		chan = kzalloc(sizeof(*chan), GFP_KERNEL);
+		if (!chan) {
+			ret = -ENOMEM;
+			return ret;
+		}
+
+		chan->vi = vi;
+		chan->portno = port_num;
+		list_add_tail(&chan->list, &vi->vi_chans);
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
+			dev_err(vi->dev,
+				"failed to initialize channel-%d: %d\n",
+				chan->portno, ret);
+			goto cleanup;
+		}
+	}
+
+	return 0;
+
+cleanup:
+	list_for_each_entry_continue_reverse(chan, &vi->vi_chans, list)
+		tegra_channel_cleanup(chan);
+
+	return ret;
+}
+
+void tegra_v4l2_nodes_cleanup_tpg(struct tegra_video_device *vid)
+{
+	struct tegra_vi *vi = vid->vi;
+	struct tegra_csi *csi = vid->csi;
+	struct tegra_csi_channel *csi_chan;
+	struct tegra_vi_channel *chan;
+
+	if (!vi || !csi)
+		return;
+
+	list_for_each_entry(chan, &vi->vi_chans, list) {
+		video_unregister_device(&chan->video);
+		mutex_lock(&chan->video_lock);
+		vb2_queue_release(&chan->queue);
+		mutex_unlock(&chan->video_lock);
+	}
+
+	list_for_each_entry(csi_chan, &csi->csi_chans, list)
+		v4l2_device_unregister_subdev(&csi_chan->subdev);
+}
+
+int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
+{
+	struct tegra_vi *vi = vid->vi;
+	struct tegra_csi *csi = vid->csi;
+	struct tegra_vi_channel *vi_chan;
+	struct tegra_csi_channel *csi_chan;
+	u32 link_flags = MEDIA_LNK_FL_ENABLED;
+	int ret = 0;
+
+	if (!vi || !csi)
+		return -ENODEV;
+
+	csi_chan = list_first_entry(&csi->csi_chans,
+				    struct tegra_csi_channel, list);
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
+			dev_err(vi->dev,
+				"failed to register subdev: %d\n", ret);
+			goto cleanup;
+		}
+
+		ret = video_register_device(&vi_chan->video,
+					    VFL_TYPE_VIDEO, -1);
+		if (ret < 0) {
+			dev_err(vi->dev,
+				"failed to register video device: %d\n", ret);
+			goto cleanup;
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
+			goto cleanup;
+		}
+
+		ret = tegra_channel_setup_ctrl_handler(vi_chan);
+		if (ret < 0)
+			goto cleanup;
+
+		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
+		vi_tpg_fmts_bitmap_init(vi_chan);
+		csi_chan = list_next_entry(csi_chan, list);
+	}
+
+	return 0;
+
+cleanup:
+	tegra_v4l2_nodes_cleanup_tpg(vid);
+	return ret;
+}
+
+static int __maybe_unused vi_runtime_resume(struct device *dev)
+{
+	struct tegra_vi *vi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(vi->vdd);
+	if (ret) {
+		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
+	if (ret) {
+		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	ret = clk_prepare_enable(vi->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable vi clock: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	return 0;
+
+disable_vdd:
+	regulator_disable(vi->vdd);
+	return ret;
+}
+
+static int __maybe_unused vi_runtime_suspend(struct device *dev)
+{
+	struct tegra_vi *vi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(vi->clk);
+
+	regulator_disable(vi->vdd);
+
+	return 0;
+}
+
+static int tegra_vi_init(struct host1x_client *client)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(client->host);
+	struct tegra_vi *vi = host1x_client_to_vi(client);
+	struct tegra_vi_channel *chan, *tmp;
+	int ret;
+
+	vid->media_dev.hw_revision = vi->soc->hw_revision;
+	snprintf(vid->media_dev.bus_info, sizeof(vid->media_dev.bus_info),
+		 "platform:%s", dev_name(vi->dev));
+
+	INIT_LIST_HEAD(&vi->vi_chans);
+
+	ret = pm_runtime_get_sync(vi->dev);
+	if (ret < 0) {
+		dev_err(vi->dev, "failed to get runtime PM: %d\n", ret);
+		pm_runtime_put_noidle(vi->dev);
+		return ret;
+	}
+
+	ret = tegra_vi_tpg_channels_alloc(vi);
+	if (ret < 0) {
+		dev_err(vi->dev, "failed to allocate tpg channels: %d\n", ret);
+		goto free_chans;
+	}
+
+	ret = tegra_vi_channels_init(vi);
+	if (ret < 0)
+		goto free_chans;
+
+	vid->vi = vi;
+
+	return 0;
+
+free_chans:
+	list_for_each_entry_safe(chan, tmp, &vi->vi_chans, list) {
+		list_del(&chan->list);
+		kfree(chan);
+	}
+
+	pm_runtime_put_sync(vi->dev);
+	return ret;
+}
+
+static int tegra_vi_exit(struct host1x_client *client)
+{
+	struct tegra_vi *vi = host1x_client_to_vi(client);
+
+	/*
+	 * Do not cleanup the channels here as application might still be
+	 * holding video device nodes. Channels cleanup will happen during
+	 * v4l2_device release callback which gets called after all video
+	 * device nodes are released.
+	 */
+
+	pm_runtime_put_sync(vi->dev);
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
+	struct tegra_vi *vi;
+	int ret;
+
+	vi = devm_kzalloc(&pdev->dev, sizeof(*vi), GFP_KERNEL);
+	if (!vi)
+		return -ENOMEM;
+
+	vi->iomem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vi->iomem))
+		return PTR_ERR(vi->iomem);
+
+	vi->soc = of_device_get_match_data(&pdev->dev);
+
+	vi->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(vi->clk)) {
+		ret = PTR_ERR(vi->clk);
+		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
+		return ret;
+	}
+
+	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
+	if (IS_ERR(vi->vdd)) {
+		ret = PTR_ERR(vi->vdd);
+		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
+		return ret;
+	}
+
+	if (!pdev->dev.pm_domain) {
+		ret = -ENOENT;
+		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"failed to populate vi child device: %d\n", ret);
+		return ret;
+	}
+
+	vi->dev = &pdev->dev;
+	vi->ops = vi->soc->ops;
+	platform_set_drvdata(pdev, vi);
+	pm_runtime_enable(&pdev->dev);
+
+	/* initialize host1x interface */
+	INIT_LIST_HEAD(&vi->client.list);
+	vi->client.ops = &vi_client_ops;
+	vi->client.dev = &pdev->dev;
+
+	ret = host1x_client_register(&vi->client);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"failed to register host1x client: %d\n", ret);
+		goto rpm_disable;
+	}
+
+	return 0;
+
+rpm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int tegra_vi_remove(struct platform_device *pdev)
+{
+	struct tegra_vi *vi = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&vi->client);
+	if (err < 0) {
+		dev_err(&pdev->dev,
+			"failed to unregister host1x client: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_disable(&pdev->dev);
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
+	.vi_max_clk_hz = 499200000,
+};
+
+static const struct of_device_id tegra_vi_of_id_table[] = {
+	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_vi_of_id_table);
+
+static const struct dev_pm_ops tegra_vi_pm_ops = {
+	SET_RUNTIME_PM_OPS(vi_runtime_suspend, vi_runtime_resume, NULL)
+};
+
+struct platform_driver tegra_vi_driver = {
+	.driver = {
+		.name = "tegra-vi",
+		.of_match_table = tegra_vi_of_id_table,
+		.pm = &tegra_vi_pm_ops,
+	},
+	.probe = tegra_vi_probe,
+	.remove = tegra_vi_remove,
+};
+
+MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra/vi.h b/drivers/staging/media/tegra/vi.h
new file mode 100644
index 0000000..147b86b
--- /dev/null
+++ b/drivers/staging/media/tegra/vi.h
@@ -0,0 +1,83 @@
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
+#include "common.h"
+
+/**
+ * struct tegra_vi_ops - Tegra VI operations
+ * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
+ *		VI for capture and runs capture start and capture finish
+ *		kthreads for capturing frames to buffer and returns them back.
+ * @vi_stop_streaming: stops media pipeline and subdevice streaming and returns
+ *		back any queued buffers.
+ */
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
+ * @clk: main clock for VI block
+ * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
+ * @soc: pointer to SoC data structure
+ * @ops: vi operations
+ * @vi_chans: list head for VI channels
+ */
+struct tegra_vi {
+	struct device *dev;
+	struct host1x_client client;
+	void __iomem *iomem;
+	struct clk *clk;
+	struct regulator *vdd;
+	const struct tegra_vi_soc *soc;
+	const struct tegra_vi_ops *ops;
+	struct list_head vi_chans;
+};
+
+void tegra_channels_cleanup(struct tegra_vi *vi);
+void tegra210_vi_stop_streaming(struct vb2_queue *vq);
+int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count);
+#endif
diff --git a/drivers/staging/media/tegra/video.c b/drivers/staging/media/tegra/video.c
new file mode 100644
index 0000000..bd88aec
--- /dev/null
+++ b/drivers/staging/media/tegra/video.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/host1x.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "video.h"
+
+static void tegra_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	struct tegra_video_device *vid;
+
+	vid = container_of(v4l2_dev, struct tegra_video_device, v4l2_dev);
+
+	/* cleanup channels here as all video device nodes are released */
+	tegra_channels_cleanup(vid->vi);
+
+	v4l2_device_unregister(v4l2_dev);
+	media_device_unregister(&vid->media_dev);
+	media_device_cleanup(&vid->media_dev);
+	kfree(vid);
+}
+
+static int host1x_video_probe(struct host1x_device *dev)
+{
+	struct tegra_video_device *vid;
+	int ret;
+
+	vid = kzalloc(sizeof(*vid), GFP_KERNEL);
+	if (!vid)
+		return -ENOMEM;
+
+	dev_set_drvdata(&dev->dev, vid);
+
+	vid->media_dev.dev = &dev->dev;
+	strscpy(vid->media_dev.model, "NVIDIA Tegra Video Input Device",
+		sizeof(vid->media_dev.model));
+
+	media_device_init(&vid->media_dev);
+	ret = media_device_register(&vid->media_dev);
+	if (ret < 0) {
+		dev_err(&dev->dev,
+			"failed to register media device: %d\n", ret);
+		goto cleanup;
+	}
+
+	vid->v4l2_dev.mdev = &vid->media_dev;
+	vid->v4l2_dev.release = tegra_v4l2_dev_release;
+	ret = v4l2_device_register(&dev->dev, &vid->v4l2_dev);
+	if (ret < 0) {
+		dev_err(&dev->dev,
+			"V4L2 device registration failed: %d\n", ret);
+		goto unregister_media;
+	}
+
+	ret = host1x_device_init(dev);
+	if (ret < 0)
+		goto unregister_v4l2;
+
+	/*
+	 * Both vi and csi channels are available now.
+	 * Register v4l2 nodes and create media links for TPG.
+	 */
+	ret = tegra_v4l2_nodes_setup_tpg(vid);
+	if (ret < 0) {
+		dev_err(&dev->dev,
+			"failed to setup tpg graph: %d\n", ret);
+		goto device_exit;
+	}
+
+	return 0;
+
+device_exit:
+	host1x_device_exit(dev);
+	/* vi exit ops does not clean channels, so clean them here */
+	tegra_channels_cleanup(vid->vi);
+unregister_v4l2:
+	v4l2_device_unregister(&vid->v4l2_dev);
+unregister_media:
+	media_device_unregister(&vid->media_dev);
+cleanup:
+	media_device_cleanup(&vid->media_dev);
+	kfree(vid);
+	return ret;
+}
+
+static int host1x_video_remove(struct host1x_device *dev)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
+
+	tegra_v4l2_nodes_cleanup_tpg(vid);
+
+	host1x_device_exit(dev);
+
+	/* This calls v4l2_dev release callback on last reference */
+	v4l2_device_put(&vid->v4l2_dev);
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
diff --git a/drivers/staging/media/tegra/video.h b/drivers/staging/media/tegra/video.h
new file mode 100644
index 0000000..72c83e0
--- /dev/null
+++ b/drivers/staging/media/tegra/video.h
@@ -0,0 +1,34 @@
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
+#include "vi.h"
+#include "csi.h"
+
+struct tegra_video_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device media_dev;
+	struct tegra_vi *vi;
+	struct tegra_csi *csi;
+};
+
+int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid);
+void tegra_v4l2_nodes_cleanup_tpg(struct tegra_video_device *vid);
+
+extern struct platform_driver tegra_vi_driver;
+extern struct platform_driver tegra_csi_driver;
+#endif
-- 
2.7.4

