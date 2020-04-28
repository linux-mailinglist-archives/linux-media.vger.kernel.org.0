Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4B41BB528
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 06:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgD1EWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 00:22:08 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3110 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgD1EVv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 00:21:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea7af1c0000>; Mon, 27 Apr 2020 21:20:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 27 Apr 2020 21:21:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 27 Apr 2020 21:21:50 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 04:21:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Apr 2020 04:21:49 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea7af5c0001>; Mon, 27 Apr 2020 21:21:49 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <digetx@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 4/5] media: tegra-video: Rearrange SoC specific to Tegra210 and cleanup files
Date:   Mon, 27 Apr 2020 21:20:49 -0700
Message-ID: <1588047650-29402-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588047644; bh=2OLRTEVVpOlbCOOwV+7HiOPg3RETORYr1mYjcXdHnr0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ieFERz/EM+b5F3i4mKDmlyPeorPq5WIqCl57dm9GGvJzBServUPW45puvTyAqlEUE
         ezXJw65fUgflVy+yeNSw/R1QKc5aoat4kLhHWIuLW+MzkBOFrTwy/pAFPQt4+n4SOG
         zt+TWZBa3A+pm/RD8lQIFuFOJFuyQQfqqIyB7CMt9k6zWy9wxt3IJJkNatapa13s/s
         k5kSaLhlUo9C/Oov7sV0ldfroQjPw+n7KeSyaDc5XFWP0QfHkbiBuBKNuqAI7R/FWZ
         zoSi90fFlXzCAwKEBQPm6erFjxKOMMTHL7I8IM2/x/C3Q2R+XiX28dXYgpmuS98Gs9
         oA3YZtMLl9Rmw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra supported video format enums are SoC specific. So, this patch
moves video format enums, supported video format list, SoC data and
register defines into Tegra210 file and removes common.h and tegra210.h

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/Makefile   |   4 +-
 drivers/staging/media/tegra-video/common.h   | 259 -----------------
 drivers/staging/media/tegra-video/csi.c      |  76 +----
 drivers/staging/media/tegra-video/csi.h      |   8 +-
 drivers/staging/media/tegra-video/tegra210.c | 402 ++++++++++++++++++++++++++-
 drivers/staging/media/tegra-video/tegra210.h | 190 -------------
 drivers/staging/media/tegra-video/vi.c       |  52 +---
 drivers/staging/media/tegra-video/vi.h       | 190 ++++++++++++-
 drivers/staging/media/tegra-video/video.c    |   2 +
 9 files changed, 586 insertions(+), 597 deletions(-)
 delete mode 100644 drivers/staging/media/tegra-video/common.h
 delete mode 100644 drivers/staging/media/tegra-video/tegra210.h

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index c0e24b5..dfa2ef8 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -2,7 +2,7 @@
 tegra-video-objs := \
 		video.o \
 		vi.o \
-		csi.o \
-		tegra210.o
+		csi.o
 
+tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/common.h b/drivers/staging/media/tegra-video/common.h
deleted file mode 100644
index 973573e..0000000
--- a/drivers/staging/media/tegra-video/common.h
+++ /dev/null
@@ -1,259 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
- */
-
-#ifndef __TEGRA_COMMON_H__
-#define __TEGRA_COMMON_H__
-
-#include <linux/host1x.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-
-#include <media/media-entity.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
-#include <media/v4l2-dev.h>
-#include <media/v4l2-subdev.h>
-#include <media/videobuf2-v4l2.h>
-
-#include "vi.h"
-
-#define TEGRA_MIN_WIDTH		32U
-#define TEGRA_MAX_WIDTH		32768U
-#define TEGRA_MIN_HEIGHT	32U
-#define TEGRA_MAX_HEIGHT	32768U
-
-#define TEGRA_DEF_WIDTH		1920
-#define TEGRA_DEF_HEIGHT	1080
-#define TEGRA_IMAGE_FORMAT_DEF	32
-
-#define MAX_FORMAT_NUM		64
-
-/*
- * VI channel input data type enum.
- * These data type enum value gets programmed into corresponding Tegra VI
- * channel register bits.
- */
-enum tegra_image_dt {
-	TEGRA_IMAGE_DT_YUV420_8 = 24,
-	TEGRA_IMAGE_DT_YUV420_10,
-
-	TEGRA_IMAGE_DT_YUV420CSPS_8 = 28,
-	TEGRA_IMAGE_DT_YUV420CSPS_10,
-	TEGRA_IMAGE_DT_YUV422_8,
-	TEGRA_IMAGE_DT_YUV422_10,
-	TEGRA_IMAGE_DT_RGB444,
-	TEGRA_IMAGE_DT_RGB555,
-	TEGRA_IMAGE_DT_RGB565,
-	TEGRA_IMAGE_DT_RGB666,
-	TEGRA_IMAGE_DT_RGB888,
-
-	TEGRA_IMAGE_DT_RAW6 = 40,
-	TEGRA_IMAGE_DT_RAW7,
-	TEGRA_IMAGE_DT_RAW8,
-	TEGRA_IMAGE_DT_RAW10,
-	TEGRA_IMAGE_DT_RAW12,
-	TEGRA_IMAGE_DT_RAW14,
-};
-
-/*
- * Pixel memory format enum for Tegra VI channel.
- * These format enum value gets programmed into corresponding Tegra VI
- * channel register bits.
- */
-enum tegra_image_format {
-	TEGRA_IMAGE_FORMAT_T_L8 = 16,
-
-	TEGRA_IMAGE_FORMAT_T_R16_I = 32,
-	TEGRA_IMAGE_FORMAT_T_B5G6R5,
-	TEGRA_IMAGE_FORMAT_T_R5G6B5,
-	TEGRA_IMAGE_FORMAT_T_A1B5G5R5,
-	TEGRA_IMAGE_FORMAT_T_A1R5G5B5,
-	TEGRA_IMAGE_FORMAT_T_B5G5R5A1,
-	TEGRA_IMAGE_FORMAT_T_R5G5B5A1,
-	TEGRA_IMAGE_FORMAT_T_A4B4G4R4,
-	TEGRA_IMAGE_FORMAT_T_A4R4G4B4,
-	TEGRA_IMAGE_FORMAT_T_B4G4R4A4,
-	TEGRA_IMAGE_FORMAT_T_R4G4B4A4,
-
-	TEGRA_IMAGE_FORMAT_T_A8B8G8R8 = 64,
-	TEGRA_IMAGE_FORMAT_T_A8R8G8B8,
-	TEGRA_IMAGE_FORMAT_T_B8G8R8A8,
-	TEGRA_IMAGE_FORMAT_T_R8G8B8A8,
-	TEGRA_IMAGE_FORMAT_T_A2B10G10R10,
-	TEGRA_IMAGE_FORMAT_T_A2R10G10B10,
-	TEGRA_IMAGE_FORMAT_T_B10G10R10A2,
-	TEGRA_IMAGE_FORMAT_T_R10G10B10A2,
-
-	TEGRA_IMAGE_FORMAT_T_A8Y8U8V8 = 193,
-	TEGRA_IMAGE_FORMAT_T_V8U8Y8A8,
-
-	TEGRA_IMAGE_FORMAT_T_A2Y10U10V10 = 197,
-	TEGRA_IMAGE_FORMAT_T_V10U10Y10A2,
-	TEGRA_IMAGE_FORMAT_T_Y8_U8__Y8_V8,
-	TEGRA_IMAGE_FORMAT_T_Y8_V8__Y8_U8,
-	TEGRA_IMAGE_FORMAT_T_U8_Y8__V8_Y8,
-	TEGRA_IMAGE_FORMAT_T_V8_Y8__U8_Y8,
-
-	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N444 = 224,
-	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N444,
-	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N444,
-	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N422,
-	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N422,
-	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N422,
-	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N420,
-	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N420,
-	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N420,
-	TEGRA_IMAGE_FORMAT_T_X2LC10LB10LA10,
-	TEGRA_IMAGE_FORMAT_T_A2R6R6R6R6R6,
-};
-
-/**
- * struct tegra_video_format - Tegra video format description
- *
- * @img_dt: image data type
- * @bit_width: format width in bits per component
- * @code: media bus format code
- * @bpp: bytes per pixel (when stored in memory)
- * @img_fmt: image format
- * @fourcc: V4L2 pixel format FCC identifier
- */
-struct tegra_video_format {
-	enum tegra_image_dt img_dt;
-	unsigned int bit_width;
-	unsigned int code;
-	unsigned int bpp;
-	u32 img_fmt;
-	u32 fourcc;
-};
-
-#define TEGRA_VIDEO_FORMAT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP,	\
-			   FORMAT, FOURCC)				\
-{									\
-	TEGRA_IMAGE_DT_##DATA_TYPE,					\
-	BIT_WIDTH,							\
-	MEDIA_BUS_FMT_##MBUS_CODE,					\
-	BPP,								\
-	TEGRA_IMAGE_FORMAT_##FORMAT,					\
-	V4L2_PIX_FMT_##FOURCC,						\
-}
-
-enum tegra_vi_pg_mode {
-	TEGRA_VI_PG_DISABLED = 0,
-	TEGRA_VI_PG_DIRECT,
-	TEGRA_VI_PG_PATCH,
-};
-
-/**
- * struct tegra_vi_channel - Tegra video channel
- *
- * @list: list head for this entry
- * @video: V4L2 video device associated with the video channel
- * @video_lock: protects the @format and @queue fields
- * @pad: media pad for the video device entity
- *
- * @vi: Tegra video input device structure
- * @frame_start_sp: host1x syncpoint pointer to synchronize programmed capture
- *		start condition with hardware frame start events through host1x
- *		syncpoint counters.
- * @mw_ack_sp: host1x syncpoint pointer to synchronize programmed memory write
- *		ack trigger condition with hardware memory write done at end of
- *		frame through host1x syncpoint counters.
- * @sp_incr_lock: protects cpu syncpoint increment.
- *
- * @kthread_start_capture: kthread to start capture of single frame when
- *		vb buffer is available. This thread programs VI CSI hardware
- *		for single frame capture and waits for frame start event from
- *		the hardware. On receiving frame start event, it wakes up
- *		kthread_finish_capture thread to wait for finishing frame data
- *		write to the memory. In case of missing frame start event, this
- *		thread returns buffer back to vb with VB2_BUF_STATE_ERROR.
- * @start_wait: waitqueue for starting frame capture when buffer is available.
- * @kthread_finish_capture: kthread to finish the buffer capture and return to.
- *		This thread is woken up by kthread_start_capture on receiving
- *		frame start event from the hardware and this thread waits for
- *		MW_ACK_DONE event which indicates completion of writing frame
- *		data to the memory. On receiving MW_ACK_DONE event, buffer is
- *		returned back to vb with VB2_BUF_STATE_DONE and in case of
- *		missing MW_ACK_DONE event, buffer is returned back to vb with
- *		VB2_BUF_STATE_ERROR.
- * @done_wait: waitqueue for finishing capture data writes to memory.
- *
- * @format: active V4L2 pixel format
- * @fmtinfo: format information corresponding to the active @format
- * @queue: vb2 buffers queue
- * @sequence: V4L2 buffers sequence number
- *
- * @capture: list of queued buffers for capture
- * @start_lock: protects the capture queued list
- * @done: list of capture done queued buffers
- * @done_lock: protects the capture done queue list
- *
- * @portno: VI channel port number
- *
- * @ctrl_handler: V4L2 control handler of this video channel
- * @tpg_fmts_bitmap: a bitmap for supported TPG formats
- * @pg_mode: test pattern generator mode (disabled/direct/patch)
- */
-struct tegra_vi_channel {
-	struct list_head list;
-	struct video_device video;
-	/* protects the @format and @queue fields */
-	struct mutex video_lock;
-	struct media_pad pad;
-
-	struct tegra_vi *vi;
-	struct host1x_syncpt *frame_start_sp;
-	struct host1x_syncpt *mw_ack_sp;
-	/* protects the cpu syncpoint increment */
-	spinlock_t sp_incr_lock;
-
-	struct task_struct *kthread_start_capture;
-	wait_queue_head_t start_wait;
-	struct task_struct *kthread_finish_capture;
-	wait_queue_head_t done_wait;
-
-	struct v4l2_pix_format format;
-	const struct tegra_video_format *fmtinfo;
-	struct vb2_queue queue;
-	u32 sequence;
-
-	struct list_head capture;
-	/* protects the capture queued list */
-	spinlock_t start_lock;
-	struct list_head done;
-	/* protects the capture done queue list */
-	spinlock_t done_lock;
-
-	unsigned char portno;
-
-	struct v4l2_ctrl_handler ctrl_handler;
-	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
-	enum tegra_vi_pg_mode pg_mode;
-};
-
-/**
- * struct tegra_channel_buffer - video channel buffer
- *
- * @buf: vb2 buffer base object
- * @queue: buffer list entry in the channel queued buffers list
- * @chan: channel that uses the buffer
- * @addr: Tegra IOVA buffer address for VI output
- * @mw_ack_sp_thresh: MW_ACK_DONE syncpoint threshold corresponding
- *		      to the capture buffer.
- */
-struct tegra_channel_buffer {
-	struct vb2_v4l2_buffer buf;
-	struct list_head queue;
-	struct tegra_vi_channel *chan;
-	dma_addr_t addr;
-	u32 mw_ack_sp_thresh;
-};
-
-struct v4l2_subdev *
-tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan);
-int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
-void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
-				   enum vb2_buffer_state state);
-#endif
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 29ccdae..eda6a42 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include "common.h"
 #include "csi.h"
 #include "video.h"
 
@@ -57,57 +56,6 @@ static const struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
 };
 
 /*
- * Frame rate table with horizontal and vertical blanking intervals
- * used by CSI TPG with corresponding format and resolution.
- * Blanking intervals are tuned values from design team for max TPG
- * clock rate.
- */
-static const struct tpg_framerate tegra210_tpg_frmrate_table[] = {
-	{
-		.frmsize = { 1280, 720 },
-		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.framerate = 120,
-		.h_blank = 512,
-		.v_blank = 8,
-	},
-	{
-		.frmsize = { 1920, 1080 },
-		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.framerate = 60,
-		.h_blank = 512,
-		.v_blank = 8,
-	},
-	{
-		.frmsize = { 3840, 2160 },
-		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.framerate = 20,
-		.h_blank = 8,
-		.v_blank = 8,
-	},
-	{
-		.frmsize = { 1280, 720 },
-		.code = MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-		.framerate = 60,
-		.h_blank = 512,
-		.v_blank = 8,
-	},
-	{
-		.frmsize = { 1920, 1080 },
-		.code = MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-		.framerate = 30,
-		.h_blank = 512,
-		.v_blank = 8,
-	},
-	{
-		.frmsize = { 3840, 2160 },
-		.code = MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-		.framerate = 8,
-		.h_blank = 8,
-		.v_blank = 8,
-	},
-};
-
-/*
  * V4L2 Subdevice Pad Operations
  */
 
@@ -566,30 +514,10 @@ static int tegra_csi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const char * const tegra210_csi_cil_clks[] = {
-	"csi",
-	"cilab",
-	"cilcd",
-	"cile",
-	"csi_tpg",
-};
-
-static const struct tegra_csi_ops tegra210_csi_ops = {
-	.csi_streaming = tegra210_csi_streaming,
-	.csi_err_recover = tegra210_csi_error_recover,
-};
-
-static const struct tegra_csi_soc tegra210_csi_soc = {
-	.ops = &tegra210_csi_ops,
-	.csi_max_channels = 6,
-	.clk_names = tegra210_csi_cil_clks,
-	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
-	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
-	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
-};
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_csi_of_id_table);
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 4781b83..8fc4c12 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -138,9 +138,9 @@ struct tegra_csi {
 	atomic_t clk_refcnt;
 };
 
-void tegra_csi_error_recover(struct v4l2_subdev *subdev);
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
 
-void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan);
-int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
-			   int enable);
+void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 #endif
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 8659c6a..960749a 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -4,26 +4,209 @@
  */
 
 /*
- * This source file contains both VI and CSI specific operations and
- * registers accessors.
+ * This source file contains Tegra210 supported video formats,
+ * VI and CSI SoC specific data, operations and registers accessors.
  */
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/delay.h>
 #include <linux/freezer.h>
+#include <linux/host1x.h>
 #include <linux/kthread.h>
 
-#include "common.h"
 #include "csi.h"
 #include "vi.h"
-#include "tegra210.h"
 
-#define TEGRA210_CSI_PORT_OFFSET		0x34
-#define TEGRA210_CSI_CIL_OFFSET			0x0f4
-#define TEGRA210_CSI_TPG_OFFSET			0x18c
-
-#define CSI_PP_OFFSET(block)			((block) * 0x800)
-#define TEGRA210_VI_CSI_BASE(x)			(0x100 + (x) * 0x100)
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
+
+#define TEGRA210_CSI_PORT_OFFSET			0x34
+#define TEGRA210_CSI_CIL_OFFSET				0x0f4
+#define TEGRA210_CSI_TPG_OFFSET				0x18c
+
+#define CSI_PP_OFFSET(block)				((block) * 0x800)
+#define TEGRA210_VI_CSI_BASE(x)				(0x100 + (x) * 0x100)
+
+/* -------------------------------------------------------------------- */
 
 /* Tegra210 VI registers accessors */
 static void tegra_vi_write(struct tegra_vi_channel *chan, unsigned int addr,
@@ -330,7 +513,7 @@ static int chan_capture_kthread_finish(void *data)
 	return 0;
 }
 
-int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
+static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 {
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	struct media_pipeline *pipe = &chan->video.pipe;
@@ -405,7 +588,7 @@ int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 	return ret;
 }
 
-void tegra210_vi_stop_streaming(struct vb2_queue *vq)
+static void tegra210_vi_stop_streaming(struct vb2_queue *vq)
 {
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 
@@ -424,6 +607,120 @@ void tegra210_vi_stop_streaming(struct vb2_queue *vq)
 	media_pipeline_stop(&chan->video.entity);
 }
 
+/*
+ * Tegra210 VI Pixel memory format enum.
+ * These format enum value gets programmed into corresponding Tegra VI
+ * channel register bits.
+ */
+enum tegra210_image_format {
+	TEGRA210_IMAGE_FORMAT_T_L8 = 16,
+
+	TEGRA210_IMAGE_FORMAT_T_R16_I = 32,
+	TEGRA210_IMAGE_FORMAT_T_B5G6R5,
+	TEGRA210_IMAGE_FORMAT_T_R5G6B5,
+	TEGRA210_IMAGE_FORMAT_T_A1B5G5R5,
+	TEGRA210_IMAGE_FORMAT_T_A1R5G5B5,
+	TEGRA210_IMAGE_FORMAT_T_B5G5R5A1,
+	TEGRA210_IMAGE_FORMAT_T_R5G5B5A1,
+	TEGRA210_IMAGE_FORMAT_T_A4B4G4R4,
+	TEGRA210_IMAGE_FORMAT_T_A4R4G4B4,
+	TEGRA210_IMAGE_FORMAT_T_B4G4R4A4,
+	TEGRA210_IMAGE_FORMAT_T_R4G4B4A4,
+
+	TEGRA210_IMAGE_FORMAT_T_A8B8G8R8 = 64,
+	TEGRA210_IMAGE_FORMAT_T_A8R8G8B8,
+	TEGRA210_IMAGE_FORMAT_T_B8G8R8A8,
+	TEGRA210_IMAGE_FORMAT_T_R8G8B8A8,
+	TEGRA210_IMAGE_FORMAT_T_A2B10G10R10,
+	TEGRA210_IMAGE_FORMAT_T_A2R10G10B10,
+	TEGRA210_IMAGE_FORMAT_T_B10G10R10A2,
+	TEGRA210_IMAGE_FORMAT_T_R10G10B10A2,
+
+	TEGRA210_IMAGE_FORMAT_T_A8Y8U8V8 = 193,
+	TEGRA210_IMAGE_FORMAT_T_V8U8Y8A8,
+
+	TEGRA210_IMAGE_FORMAT_T_A2Y10U10V10 = 197,
+	TEGRA210_IMAGE_FORMAT_T_V10U10Y10A2,
+	TEGRA210_IMAGE_FORMAT_T_Y8_U8__Y8_V8,
+	TEGRA210_IMAGE_FORMAT_T_Y8_V8__Y8_U8,
+	TEGRA210_IMAGE_FORMAT_T_U8_Y8__V8_Y8,
+	TEGRA210_IMAGE_FORMAT_T_V8_Y8__U8_Y8,
+
+	TEGRA210_IMAGE_FORMAT_T_Y8__U8__V8_N444 = 224,
+	TEGRA210_IMAGE_FORMAT_T_Y8__U8V8_N444,
+	TEGRA210_IMAGE_FORMAT_T_Y8__V8U8_N444,
+	TEGRA210_IMAGE_FORMAT_T_Y8__U8__V8_N422,
+	TEGRA210_IMAGE_FORMAT_T_Y8__U8V8_N422,
+	TEGRA210_IMAGE_FORMAT_T_Y8__V8U8_N422,
+	TEGRA210_IMAGE_FORMAT_T_Y8__U8__V8_N420,
+	TEGRA210_IMAGE_FORMAT_T_Y8__U8V8_N420,
+	TEGRA210_IMAGE_FORMAT_T_Y8__V8U8_N420,
+	TEGRA210_IMAGE_FORMAT_T_X2LC10LB10LA10,
+	TEGRA210_IMAGE_FORMAT_T_A2R6R6R6R6R6,
+};
+
+#define TEGRA210_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP,	\
+			   FORMAT, FOURCC)				\
+{									\
+	TEGRA_IMAGE_DT_##DATA_TYPE,					\
+	BIT_WIDTH,							\
+	MEDIA_BUS_FMT_##MBUS_CODE,					\
+	BPP,								\
+	TEGRA210_IMAGE_FORMAT_##FORMAT,					\
+	V4L2_PIX_FMT_##FOURCC,						\
+}
+
+/* Tegra210 supported video formats */
+const struct tegra_video_format tegra210_video_formats[] = {
+	/* RAW 8 */
+	TEGRA210_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
+	TEGRA210_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
+	TEGRA210_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 1, T_L8, SGBRG8),
+	TEGRA210_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 1, T_L8, SBGGR8),
+	/* RAW 10 */
+	TEGRA210_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 2, T_R16_I, SRGGB10),
+	TEGRA210_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 2, T_R16_I, SGRBG10),
+	TEGRA210_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 2, T_R16_I, SGBRG10),
+	TEGRA210_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 2, T_R16_I, SBGGR10),
+	/* RAW 12 */
+	TEGRA210_VIDEO_FMT(RAW12, 12, SRGGB12_1X12, 2, T_R16_I, SRGGB12),
+	TEGRA210_VIDEO_FMT(RAW12, 12, SGRBG12_1X12, 2, T_R16_I, SGRBG12),
+	TEGRA210_VIDEO_FMT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
+	TEGRA210_VIDEO_FMT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
+	/* RGB888 */
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
+			   XBGR32),
+	/* YUV422 */
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, UYVY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, VYUY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, YUYV),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, T_Y8__V8U8_N422, NV16),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, UYVY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, VYUY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, YUYV),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, YVYU),
+};
+
+/* Tegra210 VI operations */
+static const struct tegra_vi_ops tegra210_vi_ops = {
+	.vi_start_streaming = tegra210_vi_start_streaming,
+	.vi_stop_streaming = tegra210_vi_stop_streaming,
+};
+
+/* Tegra210 VI SoC data */
+const struct tegra_vi_soc tegra210_vi_soc = {
+	.video_formats = tegra210_video_formats,
+	.nformats = ARRAY_SIZE(tegra210_video_formats),
+	.ops = &tegra210_vi_ops,
+	.hw_revision = 3,
+	.vi_max_channels = 6,
+	.vi_max_clk_hz = 499200000,
+};
+
+/* -------------------------------------------------------------------- */
+
 /* Tegra210 CSI PHY registers accessors */
 static void csi_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
 		      u32 val)
@@ -500,7 +797,7 @@ static void tpg_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
 /*
  * Tegra210 CSI operations
  */
-void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
+static void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
 {
 	struct tegra_csi *csi = csi_chan->csi;
 	unsigned int port_num = csi_chan->csi_port_num;
@@ -554,8 +851,8 @@ void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
 	}
 }
 
-int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
-			   int enable)
+static int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan,
+				  u8 pg_mode, int enable)
 {
 	struct tegra_csi *csi = csi_chan->csi;
 	unsigned int port_num = csi_chan->csi_port_num;
@@ -706,3 +1003,78 @@ int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
 
 	return 0;
 }
+
+/*
+ * Tegra210 CSI TPG frame rate table with horizontal and vertical
+ * blanking intervals for corresponding format and resolution.
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
+static const char * const tegra210_csi_cil_clks[] = {
+	"csi",
+	"cilab",
+	"cilcd",
+	"cile",
+	"csi_tpg",
+};
+
+/* Tegra210 CSI operations */
+static const struct tegra_csi_ops tegra210_csi_ops = {
+	.csi_streaming = tegra210_csi_streaming,
+	.csi_err_recover = tegra210_csi_error_recover,
+};
+
+/* Tegra210 CSI SoC data */
+const struct tegra_csi_soc tegra210_csi_soc = {
+	.ops = &tegra210_csi_ops,
+	.csi_max_channels = 6,
+	.clk_names = tegra210_csi_cil_clks,
+	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
+	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
+	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
+};
diff --git a/drivers/staging/media/tegra-video/tegra210.h b/drivers/staging/media/tegra-video/tegra210.h
deleted file mode 100644
index 0786270..0000000
--- a/drivers/staging/media/tegra-video/tegra210.h
+++ /dev/null
@@ -1,190 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
- */
-
-#ifndef __TEGRA210_H__
-#define __TEGRA210_H__
-
-/* Tegra210 VI registers */
-#define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
-#define TEGRA_VI_CFG_VI_INCR_SYNCPT			0x000
-#define   VI_CFG_VI_INCR_SYNCPT_COND(x)			(((x) & 0xff) << 8)
-#define   VI_CSI_PP_LINE_START(port)			(4 + (port) * 4)
-#define   VI_CSI_PP_FRAME_START(port)			(5 + (port) * 4)
-#define   VI_CSI_MW_REQ_DONE(port)			(6 + (port) * 4)
-#define   VI_CSI_MW_ACK_DONE(port)			(7 + (port) * 4)
-
-#define TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL		0x004
-#define TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL		BIT(8)
-#define TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR		0x008
-#define TEGRA_VI_CFG_CTXSW				0x020
-#define TEGRA_VI_CFG_INTSTATUS				0x024
-#define TEGRA_VI_CFG_PWM_CONTROL			0x038
-#define TEGRA_VI_CFG_PWM_HIGH_PULSE			0x03c
-#define TEGRA_VI_CFG_PWM_LOW_PULSE			0x040
-#define TEGRA_VI_CFG_PWM_SELECT_PULSE_A			0x044
-#define TEGRA_VI_CFG_PWM_SELECT_PULSE_B			0x048
-#define TEGRA_VI_CFG_PWM_SELECT_PULSE_C			0x04c
-#define TEGRA_VI_CFG_PWM_SELECT_PULSE_D			0x050
-#define TEGRA_VI_CFG_VGP1				0x064
-#define TEGRA_VI_CFG_VGP2				0x068
-#define TEGRA_VI_CFG_VGP3				0x06c
-#define TEGRA_VI_CFG_VGP4				0x070
-#define TEGRA_VI_CFG_VGP5				0x074
-#define TEGRA_VI_CFG_VGP6				0x078
-#define TEGRA_VI_CFG_INTERRUPT_MASK			0x08c
-#define TEGRA_VI_CFG_INTERRUPT_TYPE_SELECT		0x090
-#define TEGRA_VI_CFG_INTERRUPT_POLARITY_SELECT		0x094
-#define TEGRA_VI_CFG_INTERRUPT_STATUS			0x098
-#define TEGRA_VI_CFG_VGP_SYNCPT_CONFIG			0x0ac
-#define TEGRA_VI_CFG_VI_SW_RESET			0x0b4
-#define TEGRA_VI_CFG_CG_CTRL				0x0b8
-#define   VI_CG_2ND_LEVEL_EN				0x1
-#define TEGRA_VI_CFG_VI_MCCIF_FIFOCTRL			0x0e4
-#define TEGRA_VI_CFG_TIMEOUT_WCOAL_VI			0x0e8
-#define TEGRA_VI_CFG_DVFS				0x0f0
-#define TEGRA_VI_CFG_RESERVE				0x0f4
-#define TEGRA_VI_CFG_RESERVE_1				0x0f8
-
-/* Tegra210 CSI registers */
-#define TEGRA_VI_CSI_SW_RESET				0x000
-#define TEGRA_VI_CSI_SINGLE_SHOT			0x004
-#define   SINGLE_SHOT_CAPTURE				0x1
-#define TEGRA_VI_CSI_SINGLE_SHOT_STATE_UPDATE		0x008
-#define TEGRA_VI_CSI_IMAGE_DEF				0x00c
-#define   BYPASS_PXL_TRANSFORM_OFFSET			24
-#define   IMAGE_DEF_FORMAT_OFFSET			16
-#define   IMAGE_DEF_DEST_MEM				0x1
-#define TEGRA_VI_CSI_RGB2Y_CTRL				0x010
-#define TEGRA_VI_CSI_MEM_TILING				0x014
-#define TEGRA_VI_CSI_IMAGE_SIZE				0x018
-#define   IMAGE_SIZE_HEIGHT_OFFSET			16
-#define TEGRA_VI_CSI_IMAGE_SIZE_WC			0x01c
-#define TEGRA_VI_CSI_IMAGE_DT				0x020
-#define TEGRA_VI_CSI_SURFACE0_OFFSET_MSB		0x024
-#define TEGRA_VI_CSI_SURFACE0_OFFSET_LSB		0x028
-#define TEGRA_VI_CSI_SURFACE1_OFFSET_MSB		0x02c
-#define TEGRA_VI_CSI_SURFACE1_OFFSET_LSB		0x030
-#define TEGRA_VI_CSI_SURFACE2_OFFSET_MSB		0x034
-#define TEGRA_VI_CSI_SURFACE2_OFFSET_LSB		0x038
-#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_MSB		0x03c
-#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_LSB		0x040
-#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_MSB		0x044
-#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_LSB		0x048
-#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_MSB		0x04c
-#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_LSB		0x050
-#define TEGRA_VI_CSI_SURFACE0_STRIDE			0x054
-#define TEGRA_VI_CSI_SURFACE1_STRIDE			0x058
-#define TEGRA_VI_CSI_SURFACE2_STRIDE			0x05c
-#define TEGRA_VI_CSI_SURFACE_HEIGHT0			0x060
-#define TEGRA_VI_CSI_ISPINTF_CONFIG			0x064
-#define TEGRA_VI_CSI_ERROR_STATUS			0x084
-#define TEGRA_VI_CSI_ERROR_INT_MASK			0x088
-#define TEGRA_VI_CSI_WD_CTRL				0x08c
-#define TEGRA_VI_CSI_WD_PERIOD				0x090
-
-/* Tegra210 CSI Pixel Parser registers: Starts from 0x838, offset 0x0 */
-#define TEGRA_CSI_INPUT_STREAM_CONTROL                  0x000
-#define   CSI_SKIP_PACKET_THRESHOLD_OFFSET		16
-
-#define TEGRA_CSI_PIXEL_STREAM_CONTROL0			0x004
-#define   CSI_PP_PACKET_HEADER_SENT			BIT(4)
-#define   CSI_PP_DATA_IDENTIFIER_ENABLE			BIT(5)
-#define   CSI_PP_WORD_COUNT_SELECT_HEADER		BIT(6)
-#define   CSI_PP_CRC_CHECK_ENABLE			BIT(7)
-#define   CSI_PP_WC_CHECK				BIT(8)
-#define   CSI_PP_OUTPUT_FORMAT_STORE			(0x3 << 16)
-#define   CSI_PPA_PAD_LINE_NOPAD			(0x2 << 24)
-#define   CSI_PP_HEADER_EC_DISABLE			(0x1 << 27)
-#define   CSI_PPA_PAD_FRAME_NOPAD			(0x2 << 28)
-
-#define TEGRA_CSI_PIXEL_STREAM_CONTROL1                 0x008
-#define   CSI_PP_TOP_FIELD_FRAME_OFFSET			0
-#define   CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET		4
-
-#define TEGRA_CSI_PIXEL_STREAM_GAP                      0x00c
-#define   PP_FRAME_MIN_GAP_OFFSET			16
-
-#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND               0x010
-#define   CSI_PP_ENABLE					0x1
-#define   CSI_PP_DISABLE				0x2
-#define   CSI_PP_RST					0x3
-#define   CSI_PP_SINGLE_SHOT_ENABLE			(0x1 << 2)
-#define   CSI_PP_START_MARKER_FRAME_MAX_OFFSET		12
-
-#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME           0x014
-#define TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK           0x018
-#define TEGRA_CSI_PIXEL_PARSER_STATUS                   0x01c
-#define TEGRA_CSI_CSI_SW_SENSOR_RESET                   0x020
-
-/* Tegra210 CSI PHY registers */
-/* CSI_PHY_CIL_COMMAND_0 offset 0x0d0 from TEGRA_CSI_PIXEL_PARSER_0_BASE */
-#define TEGRA_CSI_PHY_CIL_COMMAND                       0x0d0
-#define   CSI_A_PHY_CIL_NOP				0x0
-#define   CSI_A_PHY_CIL_ENABLE				0x1
-#define   CSI_A_PHY_CIL_DISABLE				0x2
-#define   CSI_A_PHY_CIL_ENABLE_MASK			0x3
-#define   CSI_B_PHY_CIL_NOP				(0x0 << 8)
-#define   CSI_B_PHY_CIL_ENABLE				(0x1 << 8)
-#define   CSI_B_PHY_CIL_DISABLE				(0x2 << 8)
-#define   CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 8)
-
-#define TEGRA_CSI_CIL_PAD_CONFIG0                       0x000
-#define   BRICK_CLOCK_A_4X				(0x1 << 16)
-#define   BRICK_CLOCK_B_4X				(0x2 << 16)
-#define TEGRA_CSI_CIL_PAD_CONFIG1                       0x004
-#define TEGRA_CSI_CIL_PHY_CONTROL                       0x008
-#define TEGRA_CSI_CIL_INTERRUPT_MASK                    0x00c
-#define TEGRA_CSI_CIL_STATUS                            0x010
-#define TEGRA_CSI_CILX_STATUS                           0x014
-#define TEGRA_CSI_CIL_ESCAPE_MODE_COMMAND               0x018
-#define TEGRA_CSI_CIL_ESCAPE_MODE_DATA                  0x01c
-#define TEGRA_CSI_CIL_SW_SENSOR_RESET                   0x020
-
-#define TEGRA_CSI_PATTERN_GENERATOR_CTRL		0x000
-#define   PG_MODE_OFFSET				2
-#define   PG_ENABLE					0x1
-#define   PG_DISABLE					0x0
-
-#define PG_VBLANK_OFFSET				16
-#define TEGRA_CSI_PG_BLANK				0x004
-#define TEGRA_CSI_PG_PHASE				0x008
-#define TEGRA_CSI_PG_RED_FREQ				0x00c
-#define   PG_RED_VERT_INIT_FREQ_OFFSET			16
-#define   PG_RED_HOR_INIT_FREQ_OFFSET			0
-
-#define TEGRA_CSI_PG_RED_FREQ_RATE			0x010
-#define TEGRA_CSI_PG_GREEN_FREQ				0x014
-#define   PG_GREEN_VERT_INIT_FREQ_OFFSET		16
-#define   PG_GREEN_HOR_INIT_FREQ_OFFSET			0
-
-#define TEGRA_CSI_PG_GREEN_FREQ_RATE			0x018
-#define TEGRA_CSI_PG_BLUE_FREQ				0x01c
-#define   PG_BLUE_VERT_INIT_FREQ_OFFSET			16
-#define   PG_BLUE_HOR_INIT_FREQ_OFFSET			0
-
-#define TEGRA_CSI_PG_BLUE_FREQ_RATE			0x020
-#define TEGRA_CSI_PG_AOHDR				0x024
-
-#define TEGRA_CSI_DPCM_CTRL_A				0xa2c
-#define TEGRA_CSI_DPCM_CTRL_B				0xa30
-
-/* Other CSI registers: Starts from 0xa44, offset 0x20c */
-#define TEGRA_CSI_STALL_COUNTER				0x20c
-#define TEGRA_CSI_CSI_READONLY_STATUS			0x210
-#define TEGRA_CSI_CSI_SW_STATUS_RESET			0x214
-#define TEGRA_CSI_CLKEN_OVERRIDE			0x218
-#define TEGRA_CSI_DEBUG_CONTROL				0x21c
-#define TEGRA_CSI_DEBUG_COUNTER_0			0x220
-#define TEGRA_CSI_DEBUG_COUNTER_1			0x224
-#define TEGRA_CSI_DEBUG_COUNTER_2			0x228
-
-/* Tegra210 CSI Pixel Parser registers */
-#define TEGRA_CSI_PIXEL_PARSER_0_BASE			0x0838
-#define TEGRA_CSI_PIXEL_PARSER_1_BASE			0x086c
-#define TEGRA_CSI_PIXEL_PARSER_2_BASE			0x1038
-#define TEGRA_CSI_PIXEL_PARSER_3_BASE			0x106c
-#define TEGRA_CSI_PIXEL_PARSER_4_BASE			0x1838
-#define TEGRA_CSI_PIXEL_PARSER_5_BASE			0x186c
-#endif
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index cd4c08d..bdf2560 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
-#include <linux/reset.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 
 #include <media/v4l2-event.h>
@@ -27,7 +25,6 @@
 
 #include <soc/tegra/pmc.h>
 
-#include "common.h"
 #include "vi.h"
 #include "video.h"
 
@@ -1063,55 +1060,10 @@ static int tegra_vi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/* Tegra supported video formats */
-const struct tegra_video_format tegra210_video_formats[] = {
-	/* RAW 8 */
-	TEGRA_VIDEO_FORMAT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
-	TEGRA_VIDEO_FORMAT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
-	TEGRA_VIDEO_FORMAT(RAW8, 8, SGBRG8_1X8, 1, T_L8, SGBRG8),
-	TEGRA_VIDEO_FORMAT(RAW8, 8, SBGGR8_1X8, 1, T_L8, SBGGR8),
-	/* RAW 10 */
-	TEGRA_VIDEO_FORMAT(RAW10, 10, SRGGB10_1X10, 2, T_R16_I, SRGGB10),
-	TEGRA_VIDEO_FORMAT(RAW10, 10, SGRBG10_1X10, 2, T_R16_I, SGRBG10),
-	TEGRA_VIDEO_FORMAT(RAW10, 10, SGBRG10_1X10, 2, T_R16_I, SGBRG10),
-	TEGRA_VIDEO_FORMAT(RAW10, 10, SBGGR10_1X10, 2, T_R16_I, SBGGR10),
-	/* RAW 12 */
-	TEGRA_VIDEO_FORMAT(RAW12, 12, SRGGB12_1X12, 2, T_R16_I, SRGGB12),
-	TEGRA_VIDEO_FORMAT(RAW12, 12, SGRBG12_1X12, 2, T_R16_I, SGRBG12),
-	TEGRA_VIDEO_FORMAT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
-	TEGRA_VIDEO_FORMAT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
-	/* RGB888 */
-	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
-	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
-			   XBGR32),
-	/* YUV422 */
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, UYVY),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, VYUY),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, YUYV),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, YVYU),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_1X16, 1, T_Y8__V8U8_N422, NV16),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, UYVY),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, VYUY),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, YUYV),
-	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, YVYU),
-};
-
-static const struct tegra_vi_ops tegra210_vi_ops = {
-	.vi_start_streaming = tegra210_vi_start_streaming,
-	.vi_stop_streaming = tegra210_vi_stop_streaming,
-};
-
-static const struct tegra_vi_soc tegra210_vi_soc = {
-	.video_formats = tegra210_video_formats,
-	.nformats = ARRAY_SIZE(tegra210_video_formats),
-	.ops = &tegra210_vi_ops,
-	.hw_revision = 3,
-	.vi_max_channels = 6,
-	.vi_max_clk_hz = 499200000,
-};
-
 static const struct of_device_id tegra_vi_of_id_table[] = {
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_vi_of_id_table);
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index b7a5439..2786c64 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -9,7 +9,32 @@
 #include <linux/host1x.h>
 #include <linux/list.h>
 
-#include "common.h"
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
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
+enum tegra_vi_pg_mode {
+	TEGRA_VI_PG_DISABLED = 0,
+	TEGRA_VI_PG_DIRECT,
+	TEGRA_VI_PG_PATCH,
+};
 
 /**
  * struct tegra_vi_ops - Tegra VI operations
@@ -68,7 +93,166 @@ struct tegra_vi {
 	atomic_t power_on_refcnt;
 };
 
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
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_vi_soc tegra210_vi_soc;
+#endif
+
+struct v4l2_subdev *
+tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan);
+int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
+void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
+				   enum vb2_buffer_state state);
 void tegra_channels_cleanup(struct tegra_vi *vi);
-void tegra210_vi_stop_streaming(struct vb2_queue *vq);
-int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count);
 #endif
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index bd88aec..30816aa 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -102,8 +102,10 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
 	{ .compatible = "nvidia,tegra210-vi", },
+#endif
 	{ }
 };
 
-- 
2.7.4

