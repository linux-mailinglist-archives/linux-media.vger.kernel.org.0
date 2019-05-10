Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9361119680
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 04:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfEJCDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 22:03:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5089 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726855AbfEJCDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 22:03:33 -0400
X-UUID: 44d9acf7031a481883944063b2641927-20190510
X-UUID: 44d9acf7031a481883944063b2641927-20190510
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 120011750; Fri, 10 May 2019 10:03:13 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 May 2019 10:03:10 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 10:03:10 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <seraph.huang@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC,V2,08/11] media: platform: Add Mediatek ISP P1 V4L2 functions
Date:   Fri, 10 May 2019 09:58:02 +0800
Message-ID: <20190510015755.51495-9-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement standard V4L2 video driver that utilizes V4L2
and media framework APIs. In this driver, supports one media
device, one sub-device and six video devices during
initialization. Moreover, it also connects with sensor and
senif drivers with V4L2 async APIs.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
This patch dependeds on "media: support Mediatek sensor interface driver"[1].

ISP P1 sub-device communicates with seninf sub-device with CIO.

[1]. media: support Mediatek sensor interface driver
https://patchwork.kernel.org/cover/10852957/
---
---
 .../platform/mtk-isp/isp_50/cam/Makefile      |   19 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam-dev.c |  758 ++++++++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam-dev.h |  250 ++++
 .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c    | 1086 +++++++++++++++++
 .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h    |   43 +
 5 files changed, 2156 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h

diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
new file mode 100644
index 000000000000..5a581ab65945
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
@@ -0,0 +1,19 @@
+#
+# Copyright (C) 2018 MediaTek Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+# GNU General Public License for more details.
+#
+
+mtk-cam-isp-objs += \
+	mtk_cam.o mtk_cam-dev.o \
+	mtk_cam-ctrl.o mtk_cam-scp.o \
+	mtk_cam-v4l2-util.o mtk_cam-smem-dev.o
+
+obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1_SUPPORT) += mtk-cam-isp.o
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.c
new file mode 100644
index 000000000000..dda8a7b161ee
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.c
@@ -0,0 +1,758 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Mediatek Corporation.
+ * Copyright (c) 2017 Intel Corporation.
+ * Copyright (C) 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * MTK_CAM-dev is highly based on Intel IPU3 ImgU driver.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-dev.h"
+#include "mtk_cam-smem.h"
+#include "mtk_cam-v4l2-util.h"
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_videoc_querycap,
+	.vidioc_enum_framesizes = mtk_cam_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap_mplane = mtk_cam_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_cam_videoc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_cam_videoc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_cam_videoc_try_fmt,
+	.vidioc_enum_input = mtk_cam_vidioc_enum_input,
+	.vidioc_g_input = mtk_cam_vidioc_g_input,
+	.vidioc_s_input = mtk_cam_vidioc_s_input,
+	/* buffer queue management */
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_subscribe_event = mtk_cam_vidioc_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_vout_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_videoc_querycap,
+	.vidioc_enum_framesizes = mtk_cam_enum_framesizes,
+	.vidioc_enum_fmt_vid_out_mplane = mtk_cam_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane = mtk_cam_videoc_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane = mtk_cam_videoc_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane = mtk_cam_videoc_try_fmt,
+	.vidioc_enum_input = mtk_cam_vidioc_enum_input,
+	.vidioc_g_input = mtk_cam_vidioc_g_input,
+	.vidioc_s_input = mtk_cam_vidioc_s_input,
+	/* buffer queue management */
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_videoc_querycap,
+	.vidioc_enum_fmt_meta_cap = mtk_cam_meta_enum_format,
+	.vidioc_g_fmt_meta_cap = mtk_cam_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_cap = mtk_cam_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_cap = mtk_cam_videoc_g_meta_fmt,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_out_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_videoc_querycap,
+	.vidioc_enum_fmt_meta_out = mtk_cam_meta_enum_format,
+	.vidioc_g_fmt_meta_out = mtk_cam_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_out = mtk_cam_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_out = mtk_cam_videoc_g_meta_fmt,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static struct v4l2_format meta_fmts[] = {
+	{
+		.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_PARAMS,
+			.buffersize = 128 * PAGE_SIZE,
+		},
+	},
+	{
+		.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_3A,
+			.buffersize = 300 * PAGE_SIZE,
+		},
+	},
+	{
+		.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_AF,
+			.buffersize = 160 * PAGE_SIZE,
+		},
+	},
+	{
+		.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_LCS,
+			.buffersize = 72 * PAGE_SIZE,
+		},
+	},
+	{
+		.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_LMV,
+			.buffersize = 256,
+		},
+	},
+};
+
+/* Need to update mtk_cam_dev_fmt_set_img for default format configuration */
+static struct v4l2_format stream_out_fmts[] = {
+	{
+		.fmt.pix_mp = {
+			.width = IMG_MAX_WIDTH,
+			.height = IMG_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_B8,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_SRGB,
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.pix_mp = {
+			.width = IMG_MAX_WIDTH,
+			.height = IMG_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_B10,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_SRGB,
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.pix_mp = {
+			.width = IMG_MAX_WIDTH,
+			.height = IMG_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_B12,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_SRGB,
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.pix_mp = {
+			.width = IMG_MAX_WIDTH,
+			.height = IMG_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_B14,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_SRGB,
+			.num_planes = 1,
+		},
+	},
+};
+
+static struct v4l2_format bin_out_fmts[] = {
+	{
+		.fmt.pix_mp = {
+			.width = RRZ_MAX_WIDTH,
+			.height = RRZ_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_F8,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_RAW,
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.pix_mp = {
+			.width = RRZ_MAX_WIDTH,
+			.height = RRZ_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_F10,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_RAW,
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.pix_mp = {
+			.width = RRZ_MAX_WIDTH,
+			.height = RRZ_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_F12,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_RAW,
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.pix_mp = {
+			.width = RRZ_MAX_WIDTH,
+			.height = RRZ_MAX_HEIGHT,
+			.pixelformat = V4L2_PIX_FMT_MTISP_F14,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_RAW,
+			.num_planes = 1,
+		},
+	},
+};
+
+static const struct
+mtk_cam_dev_node_desc output_queues[MTK_CAM_P1_TOTAL_OUTPUT] = {
+	{
+		.id = MTK_CAM_P1_META_IN_0,
+		.name = "meta input",
+		.description = "ISP tuning parameters",
+		.cap = V4L2_CAP_META_OUTPUT,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.link_flags = 0,
+		.capture = false,
+		.image = false,
+		.smem_alloc = true,
+		.fmts = meta_fmts,
+		.num_fmts = ARRAY_SIZE(meta_fmts),
+		.default_fmt_idx = 0,
+		.max_buf_count = 10,
+		.ioctl_ops = &mtk_cam_v4l2_meta_out_ioctl_ops,
+	},
+};
+
+static const struct
+mtk_cam_dev_node_desc capture_queues[MTK_CAM_P1_TOTAL_CAPTURE] = {
+	{
+		.id = MTK_CAM_P1_MAIN_STREAM_OUT,
+		.name = "main stream",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.link_flags = 0,
+		.capture = true,
+		.image = true,
+		.smem_alloc = false,
+		.dma_port = R_IMGO,
+		.fmts = stream_out_fmts,
+		.num_fmts = ARRAY_SIZE(stream_out_fmts),
+		.default_fmt_idx = 0,
+		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
+	},
+	{
+		.id = MTK_CAM_P1_PACKED_BIN_OUT,
+		.name = "packed out",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.link_flags = 0,
+		.capture = true,
+		.image = true,
+		.smem_alloc = false,
+		.dma_port = R_RRZO,
+		.fmts = bin_out_fmts,
+		.num_fmts = ARRAY_SIZE(bin_out_fmts),
+		.default_fmt_idx = 1,
+		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
+	},
+	{
+		.id = MTK_CAM_P1_META_OUT_0,
+		.name = "partial meta 0",
+		.description = "AE/AWB histogram",
+		.cap = V4L2_CAP_META_CAPTURE,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.link_flags = 0,
+		.capture = true,
+		.image = false,
+		.smem_alloc = false,
+		.dma_port = R_AAO | R_FLKO | R_PSO,
+		.fmts = meta_fmts,
+		.num_fmts = ARRAY_SIZE(meta_fmts),
+		.default_fmt_idx = 1,
+		.max_buf_count = 5,
+		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
+	},
+	{
+		.id = MTK_CAM_P1_META_OUT_1,
+		.name = "partial meta 1",
+		.description = "AF histogram",
+		.cap = V4L2_CAP_META_CAPTURE,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.link_flags = 0,
+		.capture = true,
+		.image = false,
+		.smem_alloc = false,
+		.dma_port = R_AFO,
+		.fmts = meta_fmts,
+		.num_fmts = ARRAY_SIZE(meta_fmts),
+		.default_fmt_idx = 2,
+		.max_buf_count = 5,
+		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
+	},
+	{
+		.id = MTK_CAM_P1_META_OUT_2,
+		.name = "partial meta 2",
+		.description = "Local contrast enhanced statistics",
+		.cap = V4L2_CAP_META_CAPTURE,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.link_flags = MEDIA_LNK_FL_DYNAMIC,
+		.capture = true,
+		.image = false,
+		.smem_alloc = false,
+		.dma_port = R_LCSO,
+		.fmts = meta_fmts,
+		.num_fmts = ARRAY_SIZE(meta_fmts),
+		.default_fmt_idx = 3,
+		.max_buf_count = 10,
+		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
+	},
+	{
+		.id = MTK_CAM_P1_META_OUT_3,
+		.name = "partial meta 3",
+		.description = "Local motion vector histogram",
+		.cap = V4L2_CAP_META_CAPTURE,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.link_flags = MEDIA_LNK_FL_DYNAMIC,
+		.capture = true,
+		.image = false,
+		.smem_alloc = false,
+		.dma_port = R_LMVO,
+		.fmts = meta_fmts,
+		.num_fmts = ARRAY_SIZE(meta_fmts),
+		.default_fmt_idx = 4,
+		.max_buf_count = 10,
+		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
+	},
+};
+
+static const struct mtk_cam_dev_queues_setting queues_setting = {
+	.output_node_descs = output_queues,
+	.total_output_nodes = MTK_CAM_P1_TOTAL_OUTPUT,
+	.capture_node_descs = capture_queues,
+	.total_capture_nodes = MTK_CAM_P1_TOTAL_CAPTURE,
+};
+
+static __u32 get_pixel_byte_by_fmt(__u32 pix_fmt)
+{
+	switch (pix_fmt) {
+	case V4L2_PIX_FMT_MTISP_B8:
+	case V4L2_PIX_FMT_MTISP_F8:
+		return 8;
+	case V4L2_PIX_FMT_MTISP_B10:
+	case V4L2_PIX_FMT_MTISP_F10:
+		return 10;
+	case V4L2_PIX_FMT_MTISP_B12:
+	case V4L2_PIX_FMT_MTISP_F12:
+		return 12;
+	case V4L2_PIX_FMT_MTISP_B14:
+	case V4L2_PIX_FMT_MTISP_F14:
+		return 14;
+	case V4L2_PIX_FMT_MTISP_U8:
+	case V4L2_PIX_FMT_MTISP_U10:
+	case V4L2_PIX_FMT_MTISP_U12:
+	case V4L2_PIX_FMT_MTISP_U14:
+		return 16;
+	default:
+		return 0;
+	}
+}
+
+static __u32 align_main_stream_size(__u32 size, unsigned int pix_mode)
+{
+	switch (pix_mode) {
+	case default_pixel_mode:
+	case four_pixel_mode:
+		return ALIGN(size, 8);
+	case two_pixel_mode:
+		return ALIGN(size, 4);
+	case one_pixel_mode:
+		return ALIGN(size, 2);
+	default:
+		break;
+	}
+	return 0;
+}
+
+static unsigned int align_packetd_out_size(__u32 size,
+					   unsigned int pix_mode,
+					   __u32 fmt)
+{
+	switch (pix_mode) {
+	case default_pixel_mode:
+	case four_pixel_mode:
+		return ALIGN(size, 16);
+	case two_pixel_mode:
+		return ALIGN(size, 8);
+	case one_pixel_mode:
+		if (fmt == V4L2_PIX_FMT_MTISP_F10)
+			return ALIGN(size, 4);
+		else
+			return ALIGN(size, 8);
+	default:
+		return ALIGN(size, 16);
+	}
+	return 0;
+}
+
+static __u32 cal_main_stream_stride(struct device *dev,
+				    __u32 width,
+				    __u32 pix_fmt,
+				    __u32 pix_mode)
+{
+	__u32 stride;
+	__u32 pixel_byte = get_pixel_byte_by_fmt(pix_fmt);
+
+	width = ALIGN(width, 4);
+	stride = ALIGN(DIV_ROUND_UP(width * pixel_byte, 8), 2);
+	/* expand stride, instead of shrink width */
+	stride = align_main_stream_size(stride, pix_mode);
+
+	dev_dbg(dev,
+		"main width:%d, pix_mode:%d, stride:%d\n",
+		width, pix_mode, stride);
+	return stride;
+}
+
+static __u32 cal_packed_out_stride(struct device *dev,
+				   __u32 width,
+				   __u32 pix_fmt,
+				   __u32 pix_mode)
+{
+	__u32 stride;
+	__u32 pixel_byte = get_pixel_byte_by_fmt(pix_fmt);
+
+	width = ALIGN(width, 4);
+	stride = DIV_ROUND_UP(width * 3, 2);
+	stride = DIV_ROUND_UP(stride * pixel_byte, 8);
+	/* expand stride, instead of shrink width */
+	stride = align_packetd_out_size(stride, pix_mode, pix_fmt);
+
+	dev_dbg(dev,
+		"packed width:%d, pix_mode:%d, stride:%d\n",
+		width, pix_mode, stride);
+
+	return stride;
+}
+
+static __u32 cal_img_stride(struct device *dev,
+			    int node_id,
+			    __u32 width,
+			    __u32 pix_fmt)
+{
+	__u32 bpl;
+
+	/* Currently, only support one_pixel_mode */
+	if (node_id == MTK_CAM_P1_MAIN_STREAM_OUT)
+		bpl = cal_main_stream_stride(dev, width, pix_fmt,
+					     one_pixel_mode);
+	else if (node_id == MTK_CAM_P1_PACKED_BIN_OUT)
+		bpl = cal_packed_out_stride(dev, width, pix_fmt,
+					    one_pixel_mode);
+
+	/* For DIP HW constrained, it needs 4 byte alignment */
+	bpl = ALIGN(bpl, 4);
+
+	return bpl;
+}
+
+struct v4l2_format *
+mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *desc, u32 format)
+{
+	unsigned int i;
+	struct v4l2_format *dev_fmt;
+
+	for (i = 0; i < desc->num_fmts; i++) {
+		dev_fmt = &desc->fmts[i];
+		if (dev_fmt->fmt.pix_mp.pixelformat == format)
+			return dev_fmt;
+	}
+
+	return NULL;
+}
+
+/* The helper to configure the device context */
+void mtk_cam_dev_queue_setup(struct mtk_cam_dev *cam_dev,
+			     const struct mtk_cam_dev_queues_setting *setting)
+{
+	unsigned int i, node_idx;
+
+	node_idx = 0;
+
+	/* Setup the output queue */
+	for (i = 0; i < setting->total_output_nodes; i++)
+		cam_dev->mem2mem2_nodes[node_idx++].desc =
+			setting->output_node_descs[i];
+
+	/* Setup the capture queue */
+	for (i = 0; i < setting->total_capture_nodes; i++)
+		cam_dev->mem2mem2_nodes[node_idx++].desc =
+			setting->capture_node_descs[i];
+
+	cam_dev->dev_node_num = node_idx;
+}
+
+int mtk_cam_dev_job_finish(struct mtk_cam_dev *cam_dev,
+			   struct mtk_cam_dev_finish_param *fram_param)
+{
+	struct mtk_cam_dev_buffer *buf, *b0;
+
+	if (!cam_dev->streaming)
+		return 0;
+
+	dev_dbg(&cam_dev->pdev->dev,
+		"job recvied request fd:%d, frame_seq:%d state:%d\n",
+		fram_param->request_fd,
+		fram_param->frame_seq_no,
+		fram_param->state);
+
+	/*
+	 * Set the buffer's VB2 status so that the user can dequeue
+	 * the buffer.
+	 */
+	list_for_each_entry_safe(buf, b0, fram_param->list_buf, list) {
+		list_del(&buf->list);
+		buf->vbb.vb2_buf.timestamp = ktime_get_ns();
+		buf->vbb.sequence = fram_param->frame_seq_no;
+		if (buf->vbb.vb2_buf.state == VB2_BUF_STATE_ACTIVE)
+			vb2_buffer_done(&buf->vbb.vb2_buf, fram_param->state);
+	}
+
+	return 0;
+}
+
+int mtk_cam_dev_event_frame_sync(struct mtk_cam_dev *cam_dev,
+				 __u32 frame_seq_no)
+{
+	struct v4l2_event event;
+
+	memset(&event, 0, sizeof(event));
+	event.type = V4L2_EVENT_FRAME_SYNC;
+	event.u.frame_sync.frame_sequence = frame_seq_no;
+	v4l2_event_queue(cam_dev->subdev.devnode, &event);
+
+	return 0;
+}
+
+/* Calcuate mplane pix format */
+void mtk_cam_dev_cal_mplane_pix_fmt(struct device *dev,
+				    struct v4l2_pix_format_mplane *dest_fmt,
+				    unsigned int node_id)
+{
+	unsigned int i;
+	__u32 bpl, sizeimage, imagsize;
+
+	imagsize = 0;
+	for (i = 0 ; i < dest_fmt->num_planes; ++i) {
+		bpl = cal_img_stride(dev,
+				     node_id,
+				     dest_fmt->width,
+				     dest_fmt->pixelformat);
+		sizeimage = bpl * dest_fmt->height;
+		imagsize += sizeimage;
+		dest_fmt->plane_fmt[i].bytesperline = bpl;
+		dest_fmt->plane_fmt[i].sizeimage = sizeimage;
+		memset(dest_fmt->plane_fmt[i].reserved,
+		       0, sizeof(dest_fmt->plane_fmt[i].reserved));
+		dev_dbg(dev, "plane:%d,bpl:%d,sizeimage:%u\n",
+			i,  bpl, dest_fmt->plane_fmt[i].sizeimage);
+	}
+
+	if (dest_fmt->num_planes == 1)
+		dest_fmt->plane_fmt[0].sizeimage = imagsize;
+}
+
+void mtk_cam_dev_fmt_set_img(struct device *dev,
+			     struct v4l2_pix_format_mplane *dest_fmt,
+			     struct v4l2_pix_format_mplane *src_fmt,
+			     unsigned int node_id)
+{
+	dest_fmt->width = src_fmt->width;
+	dest_fmt->height = src_fmt->height;
+	dest_fmt->pixelformat = src_fmt->pixelformat;
+	dest_fmt->field = src_fmt->field;
+	dest_fmt->colorspace = src_fmt->colorspace;
+	dest_fmt->num_planes = src_fmt->num_planes;
+	/* Use default */
+	dest_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	dest_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	dest_fmt->xfer_func =
+		V4L2_MAP_XFER_FUNC_DEFAULT(dest_fmt->colorspace);
+	memset(dest_fmt->reserved, 0, sizeof(dest_fmt->reserved));
+
+	dev_dbg(dev, "%s: Dest Fmt:%c%c%c%c, w*h:%d*%d\n",
+		__func__,
+		(dest_fmt->pixelformat & 0xFF),
+		(dest_fmt->pixelformat >> 8) & 0xFF,
+		(dest_fmt->pixelformat >> 16) & 0xFF,
+		(dest_fmt->pixelformat >> 24) & 0xFF,
+		dest_fmt->width,
+		dest_fmt->height);
+
+	mtk_cam_dev_cal_mplane_pix_fmt(dev, dest_fmt, node_id);
+}
+
+/* Get the default format setting */
+void mtk_cam_dev_load_default_fmt(struct device *dev,
+				  struct mtk_cam_dev_node_desc *queue_desc,
+				  struct v4l2_format *dest)
+{
+	struct v4l2_format *default_fmt =
+		&queue_desc->fmts[queue_desc->default_fmt_idx];
+
+	dest->type = queue_desc->buf_type;
+
+	/* Configure default format based on node type */
+	if (queue_desc->image) {
+		mtk_cam_dev_fmt_set_img(dev,
+					&dest->fmt.pix_mp,
+					&default_fmt->fmt.pix_mp,
+					queue_desc->id);
+	} else {
+		dest->fmt.meta.dataformat = default_fmt->fmt.meta.dataformat;
+		dest->fmt.meta.buffersize = default_fmt->fmt.meta.buffersize;
+	}
+}
+
+/* Get a free buffer from a video node */
+static struct mtk_cam_dev_buffer *
+mtk_cam_dev_get_pending_buf(struct mtk_cam_dev *cam_dev, int node)
+{
+	struct mtk_cam_dev_buffer *buf;
+	struct mtk_cam_video_device *vdev;
+
+	if (node > cam_dev->dev_node_num || node < 0) {
+		dev_err(&cam_dev->pdev->dev, "Invalid mtk_cam_dev node.\n");
+		return NULL;
+	}
+	vdev = &cam_dev->mem2mem2_nodes[node];
+
+	spin_lock(&vdev->slock);
+	buf = list_first_entry_or_null(&vdev->pending_list,
+				       struct mtk_cam_dev_buffer,
+				       list);
+	if (!buf) {
+		spin_unlock(&vdev->slock);
+		return NULL;
+	}
+	list_del(&buf->list);
+	spin_unlock(&vdev->slock);
+
+	return buf;
+}
+
+int mtk_cam_dev_queue_req_buffers(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int node;
+	const int mtk_cam_dev_node_num = cam_dev->dev_node_num;
+	struct device *dev = &cam_dev->pdev->dev;
+	struct mtk_cam_dev_start_param s_param;
+	struct mtk_cam_dev_buffer *buf;
+
+	memset(&s_param, 0, sizeof(struct mtk_cam_dev_start_param));
+
+	if (!cam_dev->streaming) {
+		dev_dbg(dev, "%s: stream off, no enqueue\n", __func__);
+		return 0;
+	}
+
+	/* Check all enabled nodes to collect its buffer  */
+	for (node = 0; node < mtk_cam_dev_node_num; node++) {
+		if (!cam_dev->mem2mem2_nodes[node].enabled)
+			continue;
+		buf = mtk_cam_dev_get_pending_buf(cam_dev, node);
+		if (!buf)
+			continue;
+
+		/* TBD: use buf_init callback function */
+		buf->daddr =
+			vb2_dma_contig_plane_dma_addr(&buf->vbb.vb2_buf, 0);
+		if (cam_dev->mem2mem2_nodes[node].desc.smem_alloc) {
+			buf->scp_addr = mtk_cam_smem_iova_to_scp_addr(
+				cam_dev->smem_dev, buf->daddr);
+		} else {
+			buf->scp_addr = 0;
+		}
+
+		dev_dbg(dev,
+			"Node:%d fd:%d idx:%d state:%d daddr:%pad addr:%pad",
+			node,
+			buf->vbb.request_fd,
+			buf->vbb.vb2_buf.index,
+			buf->vbb.vb2_buf.state,
+			&buf->daddr,
+			&buf->scp_addr);
+
+		s_param.buffers[node] = buf;
+		s_param.request_fd = buf->vbb.request_fd;
+	}
+
+	/* Trigger en-queued job to driver */
+	mtk_isp_req_enqueue(dev, &s_param);
+
+	return 0;
+}
+
+int mtk_cam_dev_init(struct platform_device *pdev,
+		     struct mtk_cam_dev *cam_dev)
+{
+	int ret;
+
+	cam_dev->pdev = pdev;
+
+	mtk_cam_dev_queue_setup(cam_dev, &queues_setting);
+
+	/* v4l2 sub-device registration */
+	dev_dbg(&cam_dev->pdev->dev, "mem2mem2.name: %s\n",
+		MTK_CAM_DEV_P1_NAME);
+
+	ret = mtk_cam_mem2mem2_v4l2_register(cam_dev);
+	if (ret)
+		return ret;
+
+	ret = mtk_cam_v4l2_async_register(cam_dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int mtk_cam_dev_release(struct platform_device *pdev,
+			struct mtk_cam_dev *cam_dev)
+{
+	mtk_cam_v4l2_async_unregister(cam_dev);
+	mtk_cam_v4l2_unregister(cam_dev);
+
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.h
new file mode 100644
index 000000000000..410460de44fa
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.h
@@ -0,0 +1,250 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 Mediatek Corporation.
+ * Copyright (c) 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * MTK_CAM-dev is highly based on Intel IPU3 ImgU driver.
+ *
+ */
+
+#ifndef __MTK_CAM_DEV_H__
+#define __MTK_CAM_DEV_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#define MTK_CAM_DEV_P1_NAME		"MTK-ISP-P1-V4L2"
+
+#define MTK_CAM_DEV_NODES		11
+
+#define MTK_CAM_P1_META_IN_0		0
+#define MTK_CAM_P1_TOTAL_OUTPUT		1
+
+#define MTK_CAM_P1_MAIN_STREAM_OUT	1
+#define MTK_CAM_P1_PACKED_BIN_OUT	2
+#define MTK_CAM_P1_META_OUT_0		3
+#define MTK_CAM_P1_META_OUT_1		4
+#define MTK_CAM_P1_META_OUT_2		5
+#define MTK_CAM_P1_META_OUT_3		6
+#define MTK_CAM_P1_TOTAL_CAPTURE	6
+
+struct mtk_cam_dev_buffer {
+	struct vb2_v4l2_buffer	vbb;
+	struct list_head	list;
+	/* Intenal part */
+	dma_addr_t		daddr;
+	dma_addr_t		scp_addr;
+};
+
+/* Attributes setup by device owner */
+struct mtk_cam_dev_queues_setting {
+	const struct mtk_cam_dev_node_desc *output_node_descs;
+	unsigned int total_output_nodes;
+	const struct mtk_cam_dev_node_desc *capture_node_descs;
+	unsigned int total_capture_nodes;
+};
+
+struct mtk_cam_dev_start_param {
+	int request_fd;
+	struct mtk_cam_dev_buffer *buffers[MTK_CAM_DEV_NODES];
+};
+
+struct mtk_cam_dev_finish_param {
+	int request_fd;
+	unsigned int frame_seq_no;
+	unsigned int state;
+	struct list_head *list_buf;
+};
+
+/*
+ * struct mtk_cam_dev_node_desc - node attributes
+ *
+ * @id:		 id of the context queue
+ * @name:	 media entity name
+ * @description: descritpion of node
+ * @cap:	 mapped to V4L2 capabilities
+ * @buf_type:	 mapped to V4L2 buffer type
+ * @dma_port:	 the dma port associated to the buffer
+ * @link_flags:	 default media link flags
+ * @smem_alloc:	 using the cam_smem_drv as alloc ctx or not
+ * @capture:	 true for capture queue (device to user)
+ *		 false for output queue (from user to device)
+ * @image:	 true for image node, false for meta node
+ * @num_fmts:	 the number of supported formats
+ * @default_fmt_idx: default format of this node
+ * @max_buf_count: maximum V4L2 buffer count
+ * @ioctl_ops:  mapped to v4l2_ioctl_ops
+ * @fmts:	supported format
+ *
+ */
+struct mtk_cam_dev_node_desc {
+	u8 id;
+	char *name;
+	char *description;
+	u32 cap;
+	u32 buf_type;
+	u32 dma_port;
+	u32 link_flags;
+	u8 smem_alloc:1;
+	u8 capture:1;
+	u8 image:1;
+	u8 num_fmts;
+	u8 default_fmt_idx;
+	u8 max_buf_count;
+	const struct v4l2_ioctl_ops *ioctl_ops;
+	struct v4l2_format *fmts;
+};
+
+/*
+ * struct mtk_cam_video_device - Mediatek video device structure.
+ *
+ * @id:		Id for mtk_cam_dev_node_desc or mem2mem2_nodes array
+ * @enabled:	Indicate the device is enabled or not
+ * @vdev_fmt:	The V4L2 format of video device
+ * @vdev_apd:	The media pad graph object of video device
+ * @vbq:	A videobuf queue of video device
+ * @desc:	The node attributes of video device
+ * @ctrl_handler:	The control handler of video device
+ * @pending_list:	List for pending buffers before enqueuing into driver
+ * @lock:	Serializes vb2 queue and video device operations.
+ * @slock:	Protect for pending_list.
+ *
+ */
+struct mtk_cam_video_device {
+	unsigned int id;
+	unsigned int enabled;
+	struct v4l2_format vdev_fmt;
+	struct video_device vdev;
+	struct media_pad vdev_pad;
+	struct vb2_queue vbq;
+	struct mtk_cam_dev_node_desc desc;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct list_head pending_list;
+	/* Used for vbq & vdev */
+	struct mutex lock;
+	/* protect for pending_list */
+	spinlock_t slock;
+};
+
+/*
+ * struct mtk_cam_dev - Mediatek camera device structure.
+ *
+ * @pdev:	Pointer to platform device
+ * @smem_pdev:	Pointer to shared memory platform device
+ * @pipeline:	Media pipeline information
+ * @media_dev:	Media device
+ * @subdev:	The V4L2 sub-device
+ * @v4l2_dev:	The V4L2 device driver
+ * @notifier:	The v4l2_device notifier data
+ * @subdev_pads: Pointer to the number of media pads of this sub-device
+ * @ctrl_handler: The control handler
+ * @mem2mem2_nodes: The array list of mtk_cam_video_device
+ * @seninf:	Pointer to the seninf sub-device
+ * @sensor:	Pointer to the active sensor V4L2 sub-device when streaming on
+ * @streaming:	Indicate the overall streaming status is on or off
+ * @dev_node_num: The number of supported V4L2 video device nodes
+ * @request_fd:	The file descriptor of request API
+ * @request_count: The buffer count of request API
+ *
+ * Below is the graph topology for Camera IO connection.
+ * sensor 1 (main) --> sensor IF --> P1 sub-device
+ * sensor 2 (sub)  -->
+ *
+ */
+struct mtk_cam_dev {
+	struct platform_device *pdev;
+	struct device *smem_dev;
+	struct media_pipeline pipeline;
+	struct media_device media_dev;
+	struct v4l2_subdev subdev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_async_notifier notifier;
+	struct media_pad *subdev_pads;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct mtk_cam_video_device mem2mem2_nodes[MTK_CAM_DEV_NODES];
+	struct v4l2_subdev *seninf;
+	struct v4l2_subdev *sensor;
+	unsigned int streaming;
+	unsigned int dev_node_num;
+	int request_fd;
+	unsigned int request_count;
+};
+
+int mtk_cam_dev_init(struct platform_device *pdev,
+		     struct mtk_cam_dev *cam_dev);
+int mtk_cam_v4l2_register(struct device *dev,
+			  struct media_device *media_dev,
+			  struct v4l2_device *v4l2_dev,
+			  struct v4l2_ctrl_handler *ctrl_handler);
+int mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam_dev);
+int mtk_cam_mem2mem2_v4l2_register(struct mtk_cam_dev *cam_dev);
+int mtk_cam_v4l2_async_register(struct mtk_cam_dev *cam_dev);
+void mtk_cam_v4l2_async_unregister(struct mtk_cam_dev *cam_dev);
+int mtk_cam_dev_queue_req_buffers(struct mtk_cam_dev *cam_dev);
+int mtk_cam_dev_release(struct platform_device *pdev,
+			struct mtk_cam_dev *cam_dev);
+void mtk_cam_dev_queue_setup(struct mtk_cam_dev *cam_dev,
+			     const struct mtk_cam_dev_queues_setting *setting);
+int mtk_cam_dev_job_finish(struct mtk_cam_dev *cam_dev,
+			   struct mtk_cam_dev_finish_param *param);
+int mtk_cam_dev_event_frame_sync(struct mtk_cam_dev *cam_dev,
+				 __u32 frame_seq_no);
+void mtk_cam_dev_fmt_set_img(struct device *dev,
+			     struct v4l2_pix_format_mplane *dest_fmt,
+			     struct v4l2_pix_format_mplane *src_fmt,
+			     unsigned int node_id);
+struct v4l2_format *
+mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *queue_desc, u32 format);
+void mtk_cam_dev_load_default_fmt(struct device *dev,
+				  struct mtk_cam_dev_node_desc *queue,
+				  struct v4l2_format *dest_fmt);
+void mtk_cam_dev_cal_mplane_pix_fmt(struct device *dev,
+				    struct v4l2_pix_format_mplane *dest_fmt,
+				    unsigned int node_id);
+
+static inline struct mtk_cam_video_device *
+file_to_mtk_cam_node(struct file *__file)
+{
+	return container_of(video_devdata(__file),
+		struct mtk_cam_video_device, vdev);
+}
+
+static inline struct mtk_cam_dev *
+mtk_cam_subdev_to_dev(struct v4l2_subdev *__sd)
+{
+	return container_of(__sd,
+		struct mtk_cam_dev, subdev);
+}
+
+static inline struct mtk_cam_video_device *
+mtk_cam_vbq_to_vdev(struct vb2_queue *__vq)
+{
+	return container_of(__vq,
+		struct mtk_cam_video_device, vbq);
+}
+
+static inline struct mtk_cam_dev_buffer *
+mtk_cam_vb2_buf_to_dev_buf(struct vb2_buffer *__vb)
+{
+	return container_of(__vb,
+		struct mtk_cam_dev_buffer, vbb.vb2_buf);
+}
+
+#endif /* __MTK_CAM_DEV_H__ */
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
new file mode 100644
index 000000000000..196aaef3d854
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
@@ -0,0 +1,1086 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Mediatek Corporation.
+ * Copyright (c) 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version
+ * 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * MTK_CAM-v4l2 is highly based on Intel IPU3 ImgU driver.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <media/v4l2-common.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-ctrl.h"
+#include "mtk_cam-dev.h"
+#include "mtk_cam-v4l2-util.h"
+
+#define MTK_CAM_SENINF_PAD_SRC			4
+#define MTK_CAM_P1_HUB_PAD_SINK			MTK_CAM_DEV_NODES
+
+static int mtk_cam_subdev_open(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_fh *fh)
+{
+	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
+
+	cam_dev->request_fd = -1;
+	cam_dev->request_count = 0;
+
+	return mtk_isp_open(&cam_dev->pdev->dev);
+}
+
+static int mtk_cam_subdev_close(struct v4l2_subdev *sd,
+				struct v4l2_subdev_fh *fh)
+{
+	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
+
+	return mtk_isp_release(&cam_dev->pdev->dev);
+}
+
+static int mtk_cam_v4l2_get_active_sensor(struct mtk_cam_dev *cam_dev)
+{
+	struct media_device *mdev = cam_dev->seninf->entity.graph_obj.mdev;
+	struct media_entity *entity;
+	struct device *dev = &cam_dev->pdev->dev;
+
+	cam_dev->sensor = NULL;
+	media_device_for_each_entity(entity, mdev) {
+		dev_dbg(dev, "media entity: %s:0x%x\n",
+			entity->name, entity->function);
+		if (entity->function == MEDIA_ENT_F_CAM_SENSOR &&
+		    entity->stream_count > 0) {
+			cam_dev->sensor = media_entity_to_v4l2_subdev(entity);
+			dev_dbg(dev, "Sensor found: %s\n", entity->name);
+			break;
+		}
+	}
+
+	if (!cam_dev->sensor) {
+		dev_err(dev, "Sensor is not connected\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mtk_cam_cio_stream_on(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	int ret;
+
+	/* Align vb2_core_streamon design */
+	if (cam_dev->streaming) {
+		dev_warn(dev, "already streaming\n", dev);
+		return 0;
+	}
+
+	if (!cam_dev->seninf) {
+		dev_err(dev, "no seninf connected:%d\n", ret);
+		return -EPERM;
+	}
+
+	/* Get active sensor from graph topology */
+	ret = mtk_cam_v4l2_get_active_sensor(cam_dev);
+	if (ret)
+		return -EPERM;
+
+	ret = mtk_isp_config(dev);
+	if (ret)
+		return -EPERM;
+
+	/* Seninf must stream on first */
+	dev_dbg(dev, "streamed on: %s\n", cam_dev->seninf->entity.name);
+	ret = v4l2_subdev_call(cam_dev->seninf, video, s_stream, 1);
+	if (ret) {
+		dev_err(dev, "%s stream on failed:%d\n",
+			cam_dev->seninf->entity.name, ret);
+		return -EPERM;
+	}
+
+	dev_dbg(dev, "streamed on: %s\n", cam_dev->sensor->entity.name);
+	ret = v4l2_subdev_call(cam_dev->sensor, video, s_stream, 1);
+	if (ret) {
+		dev_err(dev, "%s stream on failed:%d\n",
+			cam_dev->sensor->entity.name, ret);
+		goto fail_sensor_on;
+	}
+
+	cam_dev->streaming = true;
+	mtk_cam_dev_queue_req_buffers(cam_dev);
+	isp_composer_stream(isp_ctx, 1);
+	dev_dbg(dev, "streamed on Pass 1\n");
+
+	return 0;
+
+fail_sensor_on:
+	v4l2_subdev_call(cam_dev->seninf, video, s_stream, 0);
+	return -EPERM;
+}
+
+static int mtk_cam_cio_stream_off(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	int ret;
+
+	if (!cam_dev->streaming) {
+		dev_warn(dev, "already stream off");
+		return 0;
+	}
+
+	dev_dbg(dev, "stream off: %s\n", cam_dev->sensor->entity.name);
+	ret = v4l2_subdev_call(cam_dev->sensor, video, s_stream, 0);
+	if (ret) {
+		dev_err(dev, "%s stream off failed:%d\n",
+			cam_dev->sensor->entity.name, ret);
+		return -EPERM;
+	}
+
+	dev_dbg(dev, "stream off: %s\n", cam_dev->seninf->entity.name);
+	ret = v4l2_subdev_call(cam_dev->seninf, video, s_stream, 0);
+	if (ret) {
+		dev_err(dev, "%s stream off failed:%d\n",
+			cam_dev->seninf->entity.name, ret);
+		goto fail_sensor_off;
+	}
+
+	isp_composer_stream(isp_ctx, 0);
+	cam_dev->streaming = false;
+	dev_dbg(dev, "streamed off Pass 1\n");
+
+	return 0;
+
+fail_sensor_off:
+	v4l2_subdev_call(cam_dev->seninf, video, s_stream, 1);
+	return -EPERM;
+}
+
+static int mtk_cam_subdev_s_stream(struct v4l2_subdev *sd,
+				   int enable)
+{
+	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
+
+	if (enable)
+		return mtk_cam_cio_stream_on(cam_dev);
+	else
+		return mtk_cam_cio_stream_off(cam_dev);
+}
+
+static int mtk_cam_subdev_subscribe_event(struct v4l2_subdev *subdev,
+					  struct v4l2_fh *fh,
+					  struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mtk_cam_link_setup(struct media_entity *entity,
+			      const struct media_pad *local,
+	const struct media_pad *remote, u32 flags)
+{
+	struct mtk_cam_dev *cam_dev =
+		container_of(entity, struct mtk_cam_dev, subdev.entity);
+	u32 pad = local->index;
+
+	dev_dbg(&cam_dev->pdev->dev, "link setup: %d -> %d\n",
+		pad, remote->index);
+
+	if (pad < cam_dev->dev_node_num)
+		cam_dev->mem2mem2_nodes[pad].enabled =
+			!!(flags & MEDIA_LNK_FL_ENABLED);
+
+	return 0;
+}
+
+static void mtk_cam_dev_queue_buffers(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct mtk_cam_dev_buffer *buf;
+
+	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+	buf->daddr = vb2_dma_contig_plane_dma_addr(&buf->vbb.vb2_buf, 0);
+	buf->scp_addr = 0;
+
+	dev_dbg(&cam_dev->pdev->dev, "%pad:%pad\n",
+		&buf->daddr, &buf->scp_addr);
+
+	mtk_isp_enqueue(&cam_dev->pdev->dev, node->desc.dma_port, buf);
+}
+
+static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *mtk_cam_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct device *dev = &mtk_cam_dev->pdev->dev;
+	struct mtk_cam_dev_buffer *buf;
+	struct vb2_v4l2_buffer *v4l2_buf;
+
+	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+	v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
+		__func__,
+		node->id,
+		v4l2_buf->request_fd,
+		v4l2_buf->vb2_buf.index);
+
+	if (v4l2_buf->request_fd < 0) {
+		mtk_cam_dev_queue_buffers(vb);
+		return;
+	}
+
+	if (mtk_cam_dev->request_fd != v4l2_buf->request_fd) {
+		mtk_cam_dev->request_fd = v4l2_buf->request_fd;
+		mtk_cam_dev->request_count =
+			vb->req_obj.req->num_incomplete_objects;
+		dev_dbg(dev, "init  mtk_cam_dev_buf, fd(%d) count(%d)\n",
+			v4l2_buf->request_fd,
+			vb->req_obj.req->num_incomplete_objects);
+	}
+
+	/* Added the buffer into the tracking list */
+	spin_lock(&node->slock);
+	list_add_tail(&buf->list, &node->pending_list);
+	spin_unlock(&node->slock);
+
+	mtk_cam_dev->request_count--;
+
+	if (!mtk_cam_dev->request_count) {
+		mtk_cam_dev->request_fd = -1;
+		mtk_cam_dev_queue_req_buffers(mtk_cam_dev);
+	}
+}
+
+static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	struct device *dev = &cam_dev->pdev->dev;
+	unsigned int max_buffer_count = node->desc.max_buf_count;
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+
+	/* Check the limitation of buffer size */
+	if (max_buffer_count > 0)
+		*num_buffers = clamp_val(*num_buffers, 1, max_buffer_count);
+	else
+		*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
+
+	if (node->desc.smem_alloc) {
+		alloc_devs[0] = cam_dev->smem_dev;
+		dev_dbg(dev, "Select smem alloc_devs(0x%pK)\n", alloc_devs[0]);
+	} else {
+		alloc_devs[0] = &cam_dev->pdev->dev;
+		dev_dbg(dev, "Select default alloc_devs(0x%pK)\n",
+			alloc_devs[0]);
+	}
+
+	if (vq->type == V4L2_BUF_TYPE_META_OUTPUT ||
+	    vq->type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = fmt->fmt.meta.buffersize;
+	else
+		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	/* Validate initialized num_planes & size[0] */
+	if (*num_planes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+	} else {
+		*num_planes = 1;
+		sizes[0] = size;
+	}
+
+	/* Initialize buffer queue & locks */
+	INIT_LIST_HEAD(&node->pending_list);
+	mutex_init(&node->lock);
+	spin_lock_init(&node->slock);
+
+	return 0;
+}
+
+static bool
+mtk_cam_all_nodes_streaming(struct mtk_cam_dev *cam_dev,
+			    struct mtk_cam_video_device *except)
+{
+	unsigned int i;
+
+	for (i = 0; i < cam_dev->dev_node_num; i++) {
+		struct mtk_cam_video_device *node = &cam_dev->mem2mem2_nodes[i];
+
+		if (node == except)
+			continue;
+		if (node->enabled && !vb2_start_streaming_called(&node->vbq))
+			return false;
+	}
+
+	return true;
+}
+
+static void mtk_cam_return_all_buffers(struct mtk_cam_dev *cam_dev,
+				       struct mtk_cam_video_device *node,
+				       enum vb2_buffer_state state)
+{
+	struct mtk_cam_dev_buffer *b, *b0;
+	unsigned int i;
+
+	dev_dbg(&cam_dev->pdev->dev, "%s: node:%s", __func__, node->vdev.name);
+
+	/* Return all buffers */
+	spin_lock(&node->slock);
+	list_for_each_entry_safe(b, b0, &node->pending_list, list) {
+		list_del(&b->list);
+	}
+	spin_unlock(&node->slock);
+
+	for (i = 0; i < node->vbq.num_buffers; ++i)
+		if (node->vbq.bufs[i]->state == VB2_BUF_STATE_ACTIVE)
+			vb2_buffer_done(node->vbq.bufs[i], state);
+}
+
+static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
+				       unsigned int count)
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	int ret;
+
+	if (!node->enabled) {
+		dev_err(&cam_dev->pdev->dev, "Node:%d is not enable\n",
+			node->id);
+		ret = -ENOLINK;
+		goto fail_return_bufs;
+	}
+
+	ret = media_pipeline_start(&node->vdev.entity, &cam_dev->pipeline);
+	if (ret < 0) {
+		dev_err(&cam_dev->pdev->dev, "Node:%d %s failed\n",
+			node->id, __func__);
+		goto fail_return_bufs;
+	}
+
+	if (!mtk_cam_all_nodes_streaming(cam_dev, node))
+		return 0;
+
+	/* Start streaming of the whole pipeline now */
+	ret = v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 1);
+	if (ret < 0) {
+		dev_err(&cam_dev->pdev->dev, "Node:%d s_stream failed\n",
+			node->id);
+		goto fail_stop_pipeline;
+	}
+	return 0;
+
+fail_stop_pipeline:
+	media_pipeline_stop(&node->vdev.entity);
+fail_return_bufs:
+	mtk_cam_return_all_buffers(cam_dev, node, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+
+	/* Was this the first node with streaming disabled? */
+	if (mtk_cam_all_nodes_streaming(cam_dev, node)) {
+		/* Yes, really stop streaming now */
+		if (v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 0))
+			dev_err(&cam_dev->pdev->dev,
+				"failed to stop streaming\n");
+	}
+	mtk_cam_return_all_buffers(cam_dev, node, VB2_BUF_STATE_ERROR);
+	media_pipeline_stop(&node->vdev.entity);
+}
+
+int mtk_cam_videoc_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+
+	strscpy(cap->driver, MTK_CAM_DEV_P1_NAME, sizeof(cap->driver));
+	strscpy(cap->card, MTK_CAM_DEV_P1_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(cam_dev->media_dev.dev));
+
+	return 0;
+}
+
+int mtk_cam_videoc_enum_fmt(struct file *file, void *fh,
+			    struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->index >= node->desc.num_fmts || f->type != node->vbq.type)
+		return -EINVAL;
+
+	f->pixelformat = node->desc.fmts[f->index].fmt.pix_mp.pixelformat;
+	f->flags = 0;
+
+	return 0;
+}
+
+int mtk_cam_videoc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->type != node->vbq.type)
+		return -EINVAL;
+
+	f->fmt = node->vdev_fmt.fmt;
+
+	return 0;
+}
+
+int mtk_cam_videoc_try_fmt(struct file *file, void *fh,
+			   struct v4l2_format *in_fmt)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+	struct v4l2_format *dev_fmt;
+	__u32  width, height;
+
+	if (in_fmt->type != node->vbq.type)
+		return -EINVAL;
+
+	dev_dbg(&cam_dev->pdev->dev, "%s: fmt:%c%c%c%c, w*h:%u*%u\n",
+		__func__,
+		(in_fmt->fmt.pix_mp.pixelformat & 0xFF),
+		(in_fmt->fmt.pix_mp.pixelformat >> 8) & 0xFF,
+		(in_fmt->fmt.pix_mp.pixelformat >> 16) & 0xFF,
+		(in_fmt->fmt.pix_mp.pixelformat >> 24) & 0xFF,
+		in_fmt->fmt.pix_mp.width, in_fmt->fmt.pix_mp.height);
+
+	width = in_fmt->fmt.pix_mp.width;
+	height = in_fmt->fmt.pix_mp.height;
+
+	dev_fmt = mtk_cam_dev_find_fmt(&node->desc,
+				       in_fmt->fmt.pix_mp.pixelformat);
+	if (dev_fmt) {
+		mtk_cam_dev_fmt_set_img(&cam_dev->pdev->dev,
+					&in_fmt->fmt.pix_mp,
+					&dev_fmt->fmt.pix_mp,
+					node->id);
+	} else {
+		mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
+					     &node->desc,
+					     in_fmt);
+	}
+	in_fmt->fmt.pix_mp.width = clamp_t(u32,
+					   width,
+					   CAM_MIN_WIDTH,
+					   in_fmt->fmt.pix_mp.width);
+	in_fmt->fmt.pix_mp.height = clamp_t(u32,
+					    height,
+					    CAM_MIN_HEIGHT,
+					    in_fmt->fmt.pix_mp.height);
+	mtk_cam_dev_cal_mplane_pix_fmt(&cam_dev->pdev->dev,
+				       &in_fmt->fmt.pix_mp,
+				       node->id);
+
+	return 0;
+}
+
+int mtk_cam_videoc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->type != node->vbq.type)
+		return -EINVAL;
+
+	if (cam_dev->streaming)
+		return -EBUSY;
+
+	/* Get the valid format */
+	mtk_cam_videoc_try_fmt(file, fh, f);
+
+	/* Configure to video device */
+	mtk_cam_dev_fmt_set_img(&cam_dev->pdev->dev,
+				&node->vdev_fmt.fmt.pix_mp,
+				&f->fmt.pix_mp,
+				node->id);
+
+	return 0;
+}
+
+int mtk_cam_vidioc_enum_input(struct file *file, void *fh,
+			      struct v4l2_input *input)
+{
+	if (input->index > 0)
+		return -EINVAL;
+
+	strscpy(input->name, "camera", sizeof(input->name));
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+
+	return 0;
+}
+
+int mtk_cam_vidioc_g_input(struct file *file, void *fh, unsigned int *input)
+{
+	*input = 0;
+
+	return 0;
+}
+
+int mtk_cam_vidioc_s_input(struct file *file, void *fh, unsigned int input)
+{
+	return input == 0 ? 0 : -EINVAL;
+}
+
+int mtk_cam_vidioc_subscribe_event(struct v4l2_fh *fh,
+				   const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+int mtk_cam_enum_framesizes(struct file *filp, void *priv,
+			    struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(filp);
+	struct v4l2_format *dev_fmt;
+
+	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, sizes->pixel_format);
+	if (!dev_fmt || sizes->index)
+		return -EINVAL;
+
+	if (node->id == MTK_CAM_P1_MAIN_STREAM_OUT) {
+		sizes->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+		sizes->stepwise.max_width = IMG_MAX_WIDTH;
+		sizes->stepwise.min_width = IMG_MIN_WIDTH;
+		sizes->stepwise.max_height = IMG_MAX_HEIGHT;
+		sizes->stepwise.min_height = IMG_MIN_HEIGHT;
+		sizes->stepwise.step_height = 1;
+		sizes->stepwise.step_width = 1;
+	} else if (node->id == MTK_CAM_P1_PACKED_BIN_OUT) {
+		sizes->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+		sizes->stepwise.max_width = RRZ_MAX_WIDTH;
+		sizes->stepwise.min_width = RRZ_MIN_WIDTH;
+		sizes->stepwise.max_height = RRZ_MAX_HEIGHT;
+		sizes->stepwise.min_height = RRZ_MIN_HEIGHT;
+		sizes->stepwise.step_height = 1;
+		sizes->stepwise.step_width = 1;
+	}
+
+	return 0;
+}
+
+int mtk_cam_meta_enum_format(struct file *file, void *fh,
+			     struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	/* Each node is dedicated to only one meta format */
+	if (f->index > 0 || f->type != node->vbq.type)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc.description,
+		sizeof(node->desc.description));
+	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
+
+	return 0;
+}
+
+int mtk_cam_videoc_g_meta_fmt(struct file *file, void *fh,
+			      struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	/* Each node is dedicated to only one meta format */
+	if (f->type != node->vbq.type)
+		return -EINVAL;
+
+	f->fmt = node->vdev_fmt.fmt;
+
+	return 0;
+}
+
+/* subdev internal operations */
+static const struct v4l2_subdev_internal_ops mtk_cam_subdev_internal_ops = {
+	.open = mtk_cam_subdev_open,
+	.close = mtk_cam_subdev_close,
+};
+
+static const struct v4l2_subdev_core_ops mtk_cam_subdev_core_ops = {
+	.subscribe_event = mtk_cam_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops mtk_cam_subdev_video_ops = {
+	.s_stream = mtk_cam_subdev_s_stream,
+};
+
+static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
+	.core = &mtk_cam_subdev_core_ops,
+	.video = &mtk_cam_subdev_video_ops,
+};
+
+static const struct media_entity_operations mtk_cam_media_ops = {
+	.link_setup = mtk_cam_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static void mtk_cam_vb2_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req,
+				   dev->v4l2_dev.ctrl_handler);
+}
+
+static const struct vb2_ops mtk_cam_vb2_ops = {
+	.buf_queue = mtk_cam_vb2_buf_queue,
+	.queue_setup = mtk_cam_vb2_queue_setup,
+	.start_streaming = mtk_cam_vb2_start_streaming,
+	.stop_streaming = mtk_cam_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_request_complete = mtk_cam_vb2_buf_request_complete,
+};
+
+static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+/*
+ * Config node's video properties
+ * according to the device context requirement
+ */
+static void mtk_cam_node_to_v4l2(struct mtk_cam_dev *cam_dev,
+				 unsigned int node,
+				 struct video_device *vdev,
+				 struct v4l2_format *f)
+{
+	struct mtk_cam_dev_node_desc *node_desc =
+		&cam_dev->mem2mem2_nodes[node].desc;
+
+	/* set cap/type/ioctl_ops of the video device */
+	vdev->device_caps = V4L2_CAP_STREAMING | node_desc->cap;
+	f->type = node_desc->buf_type;
+	vdev->ioctl_ops = node_desc->ioctl_ops;
+
+	mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
+				     node_desc,
+				     f);
+}
+
+static const struct media_device_ops mtk_cam_media_req_ops = {
+	.req_validate = vb2_request_validate,
+	.req_queue = vb2_request_queue,
+};
+
+static int mtk_cam_media_register(struct device *dev,
+				  struct media_device *media_dev)
+{
+	int ret;
+
+	media_dev->dev = dev;
+	strscpy(media_dev->model, MTK_CAM_DEV_P1_NAME,
+		sizeof(media_dev->model));
+	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
+		 "platform:%s", dev_name(dev));
+	media_dev->hw_revision = 0;
+	media_device_init(media_dev);
+	media_dev->ops = &mtk_cam_media_req_ops;
+	dev_info(dev, "Register media device: %s, 0x%pK",
+		 MTK_CAM_DEV_P1_NAME, media_dev);
+
+	ret = media_device_register(media_dev);
+	if (ret) {
+		dev_err(dev, "failed to register media device (%d)\n", ret);
+		goto fail_v4l2_dev;
+	}
+
+	return 0;
+
+fail_v4l2_dev:
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+int mtk_cam_v4l2_register(struct device *dev,
+			  struct media_device *media_dev,
+			  struct v4l2_device *v4l2_dev,
+			  struct v4l2_ctrl_handler *ctrl_handler)
+{
+	int ret;
+
+	/* Set up v4l2 device */
+	v4l2_dev->ctrl_handler = ctrl_handler;
+	v4l2_dev->mdev = media_dev;
+	dev_info(dev, "Register v4l2 device: 0x%pK", v4l2_dev);
+	ret = v4l2_device_register(dev, v4l2_dev);
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 device (%d)\n", ret);
+		goto fail_v4l2_dev;
+	}
+
+	return 0;
+
+fail_v4l2_dev:
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+int mtk_cam_mem2mem2_v4l2_register(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	unsigned int num_nodes = cam_dev->dev_node_num;
+	/* Total pad numbers is video devices + one seninf pad */
+	unsigned int num_subdev_pads = MTK_CAM_DEV_NODES + 1;
+	unsigned int i;
+	int ret;
+
+	ret = mtk_cam_media_register(dev,
+				     &cam_dev->media_dev);
+	if (ret) {
+		dev_err(dev, "failed to register media device:%d\n", ret);
+		goto fail_media_dev;
+	}
+
+	ret = mtk_cam_v4l2_register(dev,
+				    &cam_dev->media_dev,
+				    &cam_dev->v4l2_dev,
+				    NULL);
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 device:%d\n", ret);
+		goto fail_v4l2_dev;
+	}
+
+	/* Initialize subdev media entity */
+	cam_dev->subdev_pads = devm_kcalloc(dev, num_subdev_pads,
+					    sizeof(*cam_dev->subdev_pads),
+					    GFP_KERNEL);
+	if (!cam_dev->subdev_pads) {
+		ret = -ENOMEM;
+		goto fail_subdev_pads;
+	}
+
+	ret = media_entity_pads_init(&cam_dev->subdev.entity,
+				     num_subdev_pads,
+				     cam_dev->subdev_pads);
+	if (ret) {
+		dev_err(dev, "failed initialize media pads:%d:\n", ret);
+		goto fail_subdev_pads;
+	}
+
+	/* Initialize all pads with MEDIA_PAD_FL_SOURCE */
+	for (i = 0; i < num_subdev_pads; i++)
+		cam_dev->subdev_pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Customize the last one pad as CIO sink pad. */
+	cam_dev->subdev_pads[MTK_CAM_DEV_NODES].flags = MEDIA_PAD_FL_SINK;
+
+	/* Initialize subdev */
+	v4l2_subdev_init(&cam_dev->subdev, &mtk_cam_subdev_ops);
+	cam_dev->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
+	cam_dev->subdev.entity.ops = &mtk_cam_media_ops;
+	cam_dev->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+				V4L2_SUBDEV_FL_HAS_EVENTS;
+	snprintf(cam_dev->subdev.name, sizeof(cam_dev->subdev.name),
+		 "%s", MTK_CAM_DEV_P1_NAME);
+	v4l2_set_subdevdata(&cam_dev->subdev, cam_dev);
+	cam_dev->subdev.internal_ops = &mtk_cam_subdev_internal_ops;
+
+	dev_info(dev, "register subdev: %s\n", cam_dev->subdev.name);
+	ret = v4l2_device_register_subdev(&cam_dev->v4l2_dev, &cam_dev->subdev);
+	if (ret) {
+		dev_err(dev, "failed initialize subdev:%d\n", ret);
+		goto fail_subdev;
+	}
+
+	/* Create video nodes and links */
+	for (i = 0; i < num_nodes; i++) {
+		struct mtk_cam_video_device *node = &cam_dev->mem2mem2_nodes[i];
+		struct video_device *vdev = &node->vdev;
+		struct vb2_queue *vbq = &node->vbq;
+		u32 output = !cam_dev->mem2mem2_nodes[i].desc.capture;
+		u32 link_flags = cam_dev->mem2mem2_nodes[i].desc.link_flags;
+
+		cam_dev->subdev_pads[i].flags = output ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+		/* Initialize miscellaneous variables */
+		mutex_init(&node->lock);
+		spin_lock_init(&node->slock);
+		INIT_LIST_HEAD(&node->pending_list);
+
+		/* Initialize formats to default values */
+		mtk_cam_node_to_v4l2(cam_dev, i, vdev, &node->vdev_fmt);
+
+		/* Initialize media entities */
+		ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
+		if (ret) {
+			dev_err(dev, "failed initialize media pad:%d\n", ret);
+			goto fail_vdev_media_entity;
+		}
+		node->enabled = false;
+		node->id = i;
+		node->vdev_pad.flags = cam_dev->subdev_pads[i].flags;
+		vdev->entity.ops = NULL;
+
+		/* Initialize vbq */
+		vbq->type = node->vdev_fmt.type;
+		if (vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
+			vbq->io_modes = VB2_MMAP;
+		else
+			vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+		if (node->desc.smem_alloc)
+			vbq->bidirectional = 1;
+		if (vbq->type == V4L2_BUF_TYPE_META_CAPTURE)
+			vdev->entity.function =
+				MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
+		vbq->ops = &mtk_cam_vb2_ops;
+		vbq->mem_ops = &vb2_dma_contig_memops;
+		vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
+		vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		vbq->min_buffers_needed = 0;	/* Can streamon w/o buffers */
+		/* Put the process hub sub device in the vb2 private data */
+		vbq->drv_priv = cam_dev;
+		vbq->lock = &node->lock;
+		vbq->supports_requests = true;
+
+		ret = vb2_queue_init(vbq);
+		if (ret) {
+			dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
+			goto fail_vdev;
+		}
+
+		/* Initialize vdev */
+		snprintf(vdev->name, sizeof(vdev->name), "%s %s",
+			 MTK_CAM_DEV_P1_NAME, node->desc.name);
+		vdev->release = video_device_release_empty;
+		vdev->fops = &mtk_cam_v4l2_fops;
+		vdev->lock = &node->lock;
+		vdev->v4l2_dev = &cam_dev->v4l2_dev;
+		vdev->queue = &node->vbq;
+		vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
+		/* Enable private control for image video devices */
+		if (node->desc.image) {
+			mtk_cam_ctrl_init(cam_dev, &node->ctrl_handler);
+			vdev->ctrl_handler = &node->ctrl_handler;
+		}
+		video_set_drvdata(vdev, cam_dev);
+		dev_dbg(dev, "register vdev:%d:%s\n", i, vdev->name);
+
+		ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+		if (ret) {
+			dev_err(dev, "failed to register vde:%d\n", ret);
+			goto fail_vdev;
+		}
+
+		/* Create link between video node and the subdev pad */
+		if (output) {
+			ret = media_create_pad_link(&vdev->entity, 0,
+						    &cam_dev->subdev.entity,
+						    i, link_flags);
+		} else {
+			ret = media_create_pad_link(&cam_dev->subdev.entity,
+						    i, &vdev->entity, 0,
+						    link_flags);
+		}
+		if (ret)
+			goto fail_link;
+	}
+
+	vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
+
+	return 0;
+
+	for (; i >= 0; i--) {
+fail_link:
+		video_unregister_device(&cam_dev->mem2mem2_nodes[i].vdev);
+fail_vdev:
+		media_entity_cleanup(&cam_dev->mem2mem2_nodes[i].vdev.entity);
+fail_vdev_media_entity:
+		mutex_destroy(&cam_dev->mem2mem2_nodes[i].lock);
+	}
+fail_subdev:
+	media_entity_cleanup(&cam_dev->subdev.entity);
+fail_subdev_pads:
+	v4l2_device_unregister(&cam_dev->v4l2_dev);
+fail_v4l2_dev:
+fail_media_dev:
+	dev_err(dev, "fail_v4l2_dev mdev: 0x%pK:%d", &cam_dev->media_dev, ret);
+	media_device_unregister(&cam_dev->media_dev);
+	media_device_cleanup(&cam_dev->media_dev);
+
+	return ret;
+}
+
+int mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int i;
+	struct mtk_cam_video_device *dev;
+
+	for (i = 0; i < cam_dev->dev_node_num; i++) {
+		dev = &cam_dev->mem2mem2_nodes[i];
+		video_unregister_device(&dev->vdev);
+		media_entity_cleanup(&dev->vdev.entity);
+		mutex_destroy(&dev->lock);
+		if (dev->desc.image)
+			v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	}
+
+	vb2_dma_contig_clear_max_seg_size(&cam_dev->pdev->dev);
+	v4l2_device_unregister_subdev(&cam_dev->subdev);
+	media_entity_cleanup(&cam_dev->subdev.entity);
+	kfree(cam_dev->subdev_pads);
+	v4l2_device_unregister(&cam_dev->v4l2_dev);
+	media_device_unregister(&cam_dev->media_dev);
+	media_device_cleanup(&cam_dev->media_dev);
+
+	return 0;
+}
+
+static int mtk_cam_dev_complete(struct v4l2_async_notifier *notifier)
+{
+	struct mtk_cam_dev *cam_dev =
+		container_of(notifier, struct mtk_cam_dev, notifier);
+	struct device *dev = &cam_dev->pdev->dev;
+	int ret;
+
+	ret = media_create_pad_link(&cam_dev->seninf->entity,
+				    MTK_CAM_SENINF_PAD_SRC,
+				    &cam_dev->subdev.entity,
+				    MTK_CAM_P1_HUB_PAD_SINK,
+				    0);
+	if (ret)
+		dev_err(dev, "fail to create pad link %s %s err:%d\n",
+			cam_dev->seninf->entity.name,
+			cam_dev->subdev.entity.name,
+			ret);
+
+	dev_info(dev, "Complete the v4l2 registration\n");
+
+	ret = v4l2_device_register_subdev_nodes(&cam_dev->v4l2_dev);
+	if (ret) {
+		dev_err(dev, "failed initialize subdev nodes:%d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int mtk_cam_dev_notifier_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_subdev *asd)
+{
+	struct mtk_cam_dev *cam_dev =
+		container_of(notifier, struct mtk_cam_dev, notifier);
+
+	cam_dev->seninf = sd;
+	dev_info(&cam_dev->pdev->dev, "%s is bounded\n", sd->entity.name);
+	return 0;
+}
+
+static void mtk_cam_dev_notifier_unbind(struct v4l2_async_notifier *notifier,
+					struct v4l2_subdev *sd,
+					struct v4l2_async_subdev *asd)
+{
+	struct mtk_cam_dev *cam_dev =
+		container_of(notifier, struct mtk_cam_dev, notifier);
+
+	dev_dbg(&cam_dev->pdev->dev, "%s is unbounded\n", sd->entity.name);
+}
+
+static int mtk_cam_dev_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	return mtk_cam_dev_complete(notifier);
+}
+
+static const struct v4l2_async_notifier_operations mtk_cam_async_ops = {
+	.bound = mtk_cam_dev_notifier_bound,
+	.unbind = mtk_cam_dev_notifier_unbind,
+	.complete = mtk_cam_dev_notifier_complete,
+};
+
+static int mtk_cam_dev_fwnode_parse(struct device *dev,
+				    struct v4l2_fwnode_endpoint *vep,
+				    struct v4l2_async_subdev *asd)
+{
+	return 0;
+}
+
+int mtk_cam_v4l2_async_register(struct mtk_cam_dev *cam_dev)
+{
+	int ret;
+
+	ret = v4l2_async_notifier_parse_fwnode_endpoints(
+		&cam_dev->pdev->dev, &cam_dev->notifier,
+		sizeof(struct v4l2_async_subdev),
+		mtk_cam_dev_fwnode_parse);
+	if (ret < 0)
+		return ret;
+
+	if (!cam_dev->notifier.num_subdevs)
+		return -ENODEV;
+
+	cam_dev->notifier.ops = &mtk_cam_async_ops;
+	dev_info(&cam_dev->pdev->dev, "mtk_cam v4l2_async_notifier_register\n");
+	ret = v4l2_async_notifier_register(&cam_dev->v4l2_dev,
+					   &cam_dev->notifier);
+	if (ret) {
+		dev_err(&cam_dev->pdev->dev,
+			"failed to register async notifier : %d\n", ret);
+		v4l2_async_notifier_cleanup(&cam_dev->notifier);
+	}
+
+	return ret;
+}
+
+void mtk_cam_v4l2_async_unregister(struct mtk_cam_dev *cam_dev)
+{
+	v4l2_async_notifier_unregister(&cam_dev->notifier);
+	v4l2_async_notifier_cleanup(&cam_dev->notifier);
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
new file mode 100644
index 000000000000..73b36916da08
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __MTK_CAM_DEV_V4L2_H__
+#define __MTK_CAM_DEV_V4L2_H__
+
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+
+int mtk_cam_videoc_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap);
+int mtk_cam_enum_framesizes(struct file *filp, void *priv,
+			    struct v4l2_frmsizeenum *sizes);
+int mtk_cam_videoc_enum_fmt(struct file *file, void *fh,
+			    struct v4l2_fmtdesc *f);
+int mtk_cam_videoc_g_fmt(struct file *file, void *fh, struct v4l2_format *f);
+int mtk_cam_videoc_s_fmt(struct file *file, void *fh, struct v4l2_format *f);
+int mtk_cam_videoc_try_fmt(struct file *file,
+			   void *fh, struct v4l2_format *in_fmt);
+int mtk_cam_vidioc_enum_input(struct file *file, void *fh,
+			      struct v4l2_input *input);
+int mtk_cam_vidioc_g_input(struct file *file, void *fh, unsigned int *input);
+int mtk_cam_vidioc_s_input(struct file *file, void *fh, unsigned int input);
+int mtk_cam_meta_enum_format(struct file *file, void *fh,
+			     struct v4l2_fmtdesc *f);
+int mtk_cam_videoc_g_meta_fmt(struct file *file, void *fh,
+			      struct v4l2_format *f);
+int mtk_cam_vidioc_subscribe_event(struct v4l2_fh *fh,
+				   const struct v4l2_event_subscription *sub);
+
+#endif /* __MTK_CAM_DEV_V4L2_H__ */
-- 
2.18.0

