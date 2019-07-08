Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F3261D8F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 13:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbfGHLFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 07:05:43 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56958 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727625AbfGHLFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 07:05:43 -0400
X-UUID: c6a457e61b9847dc9269f9478c0ddc34-20190708
X-UUID: c6a457e61b9847dc9269f9478c0ddc34-20190708
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1923063826; Mon, 08 Jul 2019 19:05:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 8 Jul 2019 19:05:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 8 Jul 2019 19:05:12 +0800
From:   <frederic.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <shik@chromium.org>, <suleiman@chromium.org>,
        <Allan.Yang@mediatek.com>
Subject: [RFC PATCH V2 4/6] platform: mtk-isp: Add Mediatek DIP driver
Date:   Mon, 8 Jul 2019 19:04:58 +0800
Message-ID: <20190708110500.7242-5-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190708110500.7242-1-frederic.chen@mediatek.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Frederic Chen <frederic.chen@mediatek.com>

This patch adds the driver of Digital Image Processing (DIP)
unit in Mediatek ISP system, providing image format
conversion, resizing, and rotation features.

The mtk-isp directory will contain drivers for multiple IP
blocks found in Mediatek ISP system. It will include ISP
Pass 1 driver(CAM), sensor interface driver, DIP driver and
face detection driver.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/media/platform/mtk-isp/Makefile       |    7 +
 .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
 .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
 .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  769 +++++++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  337 ++++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  155 ++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  794 ++++++++
 .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 1786 +++++++++++++++++
 8 files changed, 3873 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c

diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
new file mode 100644
index 000000000000..b08d3bdf2800
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2019 MediaTek Inc.
+#
+
+obj-y += isp_50/
+
diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
new file mode 100644
index 000000000000..564c3889c34c
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2019 MediaTek Inc.
+#
+
+obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP) += dip/
+
diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/Makefile b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
new file mode 100644
index 000000000000..99e760d7d5a9
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2019 MediaTek Inc.
+#
+
+$(info $(srctree))
+ccflags-y += -I$(srctree)/drivers/media/platform/mtk-mdp3
+
+obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP) += mtk_dip-v4l2.o
+
+# Utilities to provide frame-based streaming model
+# with v4l2 user interfaces and alloc context managing
+# memory shared between ISP and coprocessor
+mtk_dip_util-objs := \
+mtk_dip-dev.o \
+mtk_dip-sys.o
+
+obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP) += mtk_dip_util.o
diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
new file mode 100644
index 000000000000..63256fa27428
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
@@ -0,0 +1,769 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-event.h>
+#include "mtk_dip-dev.h"
+#include "mtk-mdp3-regs.h"
+#include "mtk-img-ipi.h"
+
+int mtk_dip_pipe_init(struct mtk_dip_pipe *pipe,
+		      struct mtk_dip_dev *dip_dev,
+		      const struct mtk_dip_pipe_desc *setting,
+		      struct media_device *media_dev,
+		      struct v4l2_device *v4l2_dev)
+{
+	int ret, i, count = 0;
+
+	pipe->dip_dev = dip_dev;
+	pipe->desc = setting;
+	pipe->num_nodes = MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM;
+
+	atomic_set(&pipe->pipe_job_sequence, 0);
+	INIT_LIST_HEAD(&pipe->pipe_job_running_list);
+	INIT_LIST_HEAD(&pipe->pipe_job_pending_list);
+	spin_lock_init(&pipe->job_lock);
+	mutex_init(&pipe->lock);
+
+	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
+		if (i < MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM) {
+			pipe->nodes[i].desc =
+			&pipe->desc->output_queue_descs[i];
+		} else {
+			int cap_idx = i - MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM;
+
+			pipe->nodes[i].desc =
+				&pipe->desc->capture_queue_descs[cap_idx];
+		}
+
+		pipe->nodes[i].flags =
+			pipe->nodes[i].desc->flags;
+		atomic_set(&pipe->nodes[i].sequence, 0);
+		spin_lock_init(&pipe->nodes[i].buf_list_lock);
+		INIT_LIST_HEAD(&pipe->nodes[i].buf_list);
+
+		if (pipe->nodes[i].flags & MEDIA_LNK_FL_ENABLED)
+			count++;
+	}
+
+	if (pipe->desc->master >= 0 &&
+	    pipe->desc->master < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM) {
+		if (!(pipe->nodes[pipe->desc->master].flags &
+		    MEDIA_LNK_FL_ENABLED))
+			count++;
+
+		pipe->nodes[pipe->desc->master].flags |=
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
+	}
+
+	atomic_set(&pipe->cnt_nodes_not_streaming, count);
+
+	ret = mtk_dip_pipe_v4l2_register(pipe, media_dev, v4l2_dev);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s: failed(%d) to create V4L2 devices\n",
+			pipe->desc->name, ret);
+
+		goto err_destroy_pipe_lock;
+	}
+
+	return 0;
+
+err_destroy_pipe_lock:
+	mutex_destroy(&pipe->lock);
+
+	return ret;
+}
+
+int mtk_dip_pipe_release(struct mtk_dip_pipe *pipe)
+{
+	mtk_dip_pipe_v4l2_unregister(pipe);
+	mutex_destroy(&pipe->lock);
+
+	return 0;
+}
+
+int mtk_dip_pipe_next_job_id(struct mtk_dip_pipe *pipe)
+{
+	int global_job_id = atomic_inc_return(&pipe->pipe_job_sequence);
+
+	return (global_job_id & 0x0000FFFF) | (pipe->desc->id << 16);
+}
+
+struct mtk_dip_pipe_job_info*
+mtk_dip_pipe_get_running_job_info(struct mtk_dip_pipe *pipe, int pipe_job_id)
+{
+	struct mtk_dip_pipe_job_info *job_info;
+
+	spin_lock(&pipe->job_lock);
+	list_for_each_entry(job_info,
+			    &pipe->pipe_job_running_list, list) {
+		if (job_info->id == pipe_job_id) {
+			spin_unlock(&pipe->job_lock);
+			return job_info;
+		}
+	}
+	spin_unlock(&pipe->job_lock);
+
+	return NULL;
+}
+
+void mtk_dip_pipe_debug_job(struct mtk_dip_pipe *pipe,
+			    struct mtk_dip_pipe_job_info *job_info)
+{
+	int i;
+
+	dev_dbg(&pipe->dip_dev->pdev->dev, "%s: pipe-job(%p),id(%d)\n",
+		pipe->desc->name, job_info, job_info->id);
+
+	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM ; i++) {
+		if (job_info->buf_map[i])
+			dev_dbg(&pipe->dip_dev->pdev->dev, "%s:%s:buf(%p)\n",
+				pipe->desc->name, pipe->nodes[i].desc->name, i,
+				job_info->buf_map[i]);
+	}
+}
+
+int mtk_dip_pipe_job_finish(struct mtk_dip_pipe *pipe,
+			    unsigned int pipe_job_info_id,
+			    enum vb2_buffer_state vbf_state)
+{
+	struct mtk_dip_pipe_job_info *job_info;
+	struct mtk_dip_dev_buffer *in_buf;
+	int i, num_running_jobs;
+
+	job_info = mtk_dip_pipe_get_running_job_info(pipe, pipe_job_info_id);
+	in_buf = job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT];
+
+	spin_lock(&pipe->job_lock);
+	list_del(&job_info->list);
+	num_running_jobs = --pipe->num_jobs;
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s: num of running jobs(%d)\n",
+		__func__, pipe->desc->name, pipe->num_jobs);
+	spin_unlock(&pipe->job_lock);
+
+	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
+		struct mtk_dip_dev_buffer *dev_buf = job_info->buf_map[i];
+		struct mtk_dip_video_device *node;
+
+		if (!dev_buf)
+			continue;
+
+		if (in_buf && dev_buf != in_buf)
+			dev_buf->vbb.vb2_buf.timestamp =
+				in_buf->vbb.vb2_buf.timestamp;
+
+		vb2_buffer_done(&dev_buf->vbb.vb2_buf, vbf_state);
+
+		node = mtk_dip_vbq_to_node(dev_buf->vbb.vb2_buf.vb2_queue);
+		spin_lock(&node->buf_list_lock);
+		list_del(&dev_buf->list);
+		spin_unlock(&node->buf_list_lock);
+
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: return buf, idx(%d), state(%d)\n",
+			pipe->desc->name, node->desc->name,
+			dev_buf->vbb.vb2_buf.index, vbf_state);
+	}
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s: finished job id(%d), vbf_state(%d), running jobs(%d)\n",
+		__func__, pipe->desc->name, pipe_job_info_id, vbf_state,
+		num_running_jobs);
+
+	return 0;
+}
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
+static __u32
+mtk_dip_pass1_cal_main_stride(__u32 width, __u32 pix_fmt)
+{
+	__u32 stride;
+	__u32 pixel_byte = get_pixel_byte_by_fmt(pix_fmt);
+
+	width = ALIGN(width, 4);
+	stride = ALIGN(DIV_ROUND_UP(width * pixel_byte, 8), 2);
+
+	return ALIGN(stride, 4);
+}
+
+static __u32
+mtk_dip_pass1_cal_pack_stride(__u32 width, __u32 pix_fmt)
+{
+	__u32 stride;
+	__u32 pixel_byte = get_pixel_byte_by_fmt(pix_fmt);
+
+	width = ALIGN(width, 4);
+	stride = DIV_ROUND_UP(width * 3, 2);
+	stride = DIV_ROUND_UP(stride * pixel_byte, 8);
+
+	if (pix_fmt == V4L2_PIX_FMT_MTISP_F10)
+		stride =  ALIGN(stride, 4);
+	else
+		stride =  ALIGN(stride, 8);
+
+	return stride;
+}
+
+static int is_stride_need_to_align(u32 format, u32 *need_aligned_fmts,
+				   int length)
+{
+	int i;
+
+	for (i = 0; i < length; i++) {
+		if (format == need_aligned_fmts[i])
+			return true;
+	}
+
+	return false;
+}
+
+/* Stride that is accepted by MDP HW */
+static u32 dip_mdp_fmt_get_stride(struct v4l2_pix_format_mplane *mfmt,
+				  const struct mtk_dip_dev_format *fmt,
+				  unsigned int plane)
+{
+	enum mdp_color c = fmt->mdp_color;
+	u32 bytesperline = (mfmt->width * fmt->row_depth[plane]) / 8;
+	u32 stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
+		/ fmt->row_depth[0];
+
+	if (plane == 0)
+		return stride;
+
+	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
+		if (MDP_COLOR_IS_BLOCK_MODE(c))
+			stride = stride / 2;
+		return stride;
+	}
+
+	return 0;
+}
+
+/* Stride that is accepted by MDP HW of format with contiguous planes */
+static u32
+dip_mdp_fmt_get_stride_contig(const struct mtk_dip_dev_format *fmt,
+			      u32 pix_stride,
+			      unsigned int plane)
+{
+	enum mdp_color c = fmt->mdp_color;
+	u32 stride = pix_stride;
+
+	if (plane == 0)
+		return stride;
+
+	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
+		stride = stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
+		if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
+			stride = stride * 2;
+		return stride;
+	}
+
+	return 0;
+}
+
+/* Plane size that is accepted by MDP HW */
+static u32
+dip_mdp_fmt_get_plane_size(const struct mtk_dip_dev_format *fmt,
+			   u32 stride, u32 height,
+			   unsigned int plane)
+{
+	enum mdp_color c = fmt->mdp_color;
+	u32 bytesperline;
+
+	bytesperline = (stride * fmt->row_depth[0])
+		/ MDP_COLOR_BITS_PER_PIXEL(c);
+	if (plane == 0)
+		return bytesperline * height;
+	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
+		height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
+		if (MDP_COLOR_IS_BLOCK_MODE(c))
+			bytesperline = bytesperline * 2;
+		return bytesperline * height;
+	}
+
+	return 0;
+}
+
+static int mtk_dip_pipe_get_stride(struct mtk_dip_pipe *pipe,
+				   struct v4l2_pix_format_mplane *mfmt,
+				   const struct mtk_dip_dev_format *dfmt,
+				   int plane,
+				   char *buf_name)
+{
+	int bpl;
+	u32 fmts_pass1_main[] = {
+		V4L2_PIX_FMT_MTISP_B8,
+		V4L2_PIX_FMT_MTISP_B10
+	};
+	u32 fmts_pass1_pack[] = {
+		V4L2_PIX_FMT_MTISP_F8,
+		V4L2_PIX_FMT_MTISP_F10
+	};
+
+	if (is_stride_need_to_align(mfmt->pixelformat, fmts_pass1_main,
+				    ARRAY_SIZE(fmts_pass1_main)))
+		bpl = mtk_dip_pass1_cal_main_stride(mfmt->width,
+						    mfmt->pixelformat);
+	else if (is_stride_need_to_align(mfmt->pixelformat, fmts_pass1_pack,
+					 ARRAY_SIZE(fmts_pass1_pack)))
+		bpl = mtk_dip_pass1_cal_pack_stride(mfmt->width,
+						    mfmt->pixelformat);
+	else
+		bpl = dip_mdp_fmt_get_stride(mfmt, dfmt, plane);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s:%s: plane(%d), pixelformat(%x) width(%d), stride(%d)",
+		__func__, pipe->desc->name, buf_name, plane,
+		mfmt->pixelformat, mfmt->width, bpl);
+
+	return bpl;
+}
+
+void mtk_dip_pipe_set_img_fmt(struct mtk_dip_pipe *pipe,
+			      struct mtk_dip_video_device *node,
+			      struct v4l2_pix_format_mplane *mfmt_to_fill,
+			      const struct mtk_dip_dev_format *dev_fmt)
+{
+	int i;
+
+	mfmt_to_fill->pixelformat = dev_fmt->format;
+	mfmt_to_fill->num_planes = dev_fmt->num_planes;
+	mfmt_to_fill->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	mfmt_to_fill->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mfmt_to_fill->colorspace = dev_fmt->colorspace;
+	mfmt_to_fill->field = V4L2_FIELD_NONE;
+
+	memset(mfmt_to_fill->reserved, 0, sizeof(mfmt_to_fill->reserved));
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s:%s: Fmt(%c%c%c%c),  w(%d),h(%d), f(%d)\n",
+		__func__, pipe->desc->name, node->desc->name,
+		mfmt_to_fill->pixelformat & 0xff,
+		mfmt_to_fill->pixelformat >> 8 & 0xff,
+		mfmt_to_fill->pixelformat >> 16 & 0xff,
+		mfmt_to_fill->pixelformat >> 24 & 0xff,
+		mfmt_to_fill->width, mfmt_to_fill->height,
+		mfmt_to_fill->field);
+
+	for (i = 0; i < mfmt_to_fill->num_planes; ++i) {
+		u32 min_bpl = (mfmt_to_fill->width * dev_fmt->row_depth[i]) / 8;
+		u32 bpl = mfmt_to_fill->plane_fmt[i].bytesperline;
+		u32 sizeimage;
+
+		if (bpl < min_bpl)
+			bpl = min_bpl;
+
+		sizeimage = (bpl * mfmt_to_fill->height * dev_fmt->depth[i])
+			/ dev_fmt->row_depth[i];
+		mfmt_to_fill->plane_fmt[i].bytesperline = bpl;
+		if (mfmt_to_fill->plane_fmt[i].sizeimage < sizeimage)
+			mfmt_to_fill->plane_fmt[i].sizeimage = sizeimage;
+
+		memset(mfmt_to_fill->plane_fmt[i].reserved,
+		       0, sizeof(mfmt_to_fill->plane_fmt[i].reserved));
+
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s:%s: plane(%d): bpl(%u), min_bpl(%u), s(%u)\n",
+			__func__, pipe->desc->name, node->desc->name,
+			i, bpl, min_bpl, mfmt_to_fill->plane_fmt[i].sizeimage);
+	}
+}
+
+static void set_meta_fmt(struct mtk_dip_pipe *pipe,
+			 struct v4l2_meta_format *metafmt_to_fill,
+			 const struct mtk_dip_dev_format *dev_fmt)
+{
+	metafmt_to_fill->dataformat = dev_fmt->format;
+
+	if (dev_fmt->buffer_size <= 0) {
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s: Invalid meta buf size(%u), use default(%u)\n",
+			pipe->desc->name, dev_fmt->buffer_size,
+			MTK_DIP_DEV_META_BUF_DEFAULT_SIZE);
+
+		metafmt_to_fill->buffersize =
+			MTK_DIP_DEV_META_BUF_DEFAULT_SIZE;
+	} else {
+		metafmt_to_fill->buffersize = dev_fmt->buffer_size;
+	}
+}
+
+void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *pipe,
+				   struct mtk_dip_video_device *node,
+				   struct v4l2_format *fmt_to_fill)
+{
+	int idx = node->desc->default_fmt_idx;
+
+	if (node->desc->num_fmts == 0) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s: desc->num_fmts is 0, no format support list\n",
+		       __func__, node->desc->name);
+
+		return;
+	}
+
+	if (idx >= node->desc->num_fmts) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s: invalid idx(%d), must < num_fmts(%d)\n",
+			__func__, node->desc->name, idx, node->desc->num_fmts);
+
+		idx = 0;
+	}
+
+	fmt_to_fill->type = node->desc->buf_type;
+	if (mtk_dip_buf_is_meta(node->desc->buf_type)) {
+		set_meta_fmt(pipe, &fmt_to_fill->fmt.meta,
+			     &node->desc->fmts[idx]);
+	} else {
+		fmt_to_fill->fmt.pix_mp.width = node->desc->default_width;
+		fmt_to_fill->fmt.pix_mp.height = node->desc->default_height;
+		mtk_dip_pipe_set_img_fmt(pipe, node, &fmt_to_fill->fmt.pix_mp,
+					 &node->desc->fmts[idx]);
+	}
+}
+
+const struct mtk_dip_dev_format*
+mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *pipe,
+		      struct mtk_dip_video_device *node,
+		      u32 format)
+{
+	int i;
+
+	for (i = 0; i < node->desc->num_fmts; i++) {
+		if (node->desc->fmts[i].format == format)
+			return &node->desc->fmts[i];
+	}
+
+	return NULL;
+}
+
+static enum mdp_ycbcr_profile
+map_ycbcr_prof_mplane(struct v4l2_pix_format_mplane *pix_mp, u32 mdp_color)
+{
+	if (MDP_COLOR_IS_RGB(mdp_color))
+		return MDP_YCBCR_PROFILE_FULL_BT601;
+
+	switch (pix_mp->colorspace) {
+	case V4L2_COLORSPACE_JPEG:
+		return MDP_YCBCR_PROFILE_JPEG;
+	case V4L2_COLORSPACE_REC709:
+	case V4L2_COLORSPACE_DCI_P3:
+		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			return MDP_YCBCR_PROFILE_FULL_BT709;
+		return MDP_YCBCR_PROFILE_BT709;
+	case V4L2_COLORSPACE_BT2020:
+		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			return MDP_YCBCR_PROFILE_FULL_BT2020;
+		return MDP_YCBCR_PROFILE_BT2020;
+	}
+	/* V4L2_COLORSPACE_SRGB or else */
+	if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
+		return MDP_YCBCR_PROFILE_FULL_BT601;
+
+	return MDP_YCBCR_PROFILE_BT601;
+}
+
+static inline int is_contig_mp_buffer(struct mtk_dip_dev_buffer *dev_buf)
+{
+	return !(MDP_COLOR_GET_PLANE_COUNT(dev_buf->dev_fmt->mdp_color) == 1);
+}
+
+static int fill_ipi_img_param_mp(struct mtk_dip_pipe *pipe,
+				 struct img_image_buffer *b,
+				 struct mtk_dip_dev_buffer *dev_buf,
+				 char *buf_name)
+{
+	struct v4l2_pix_format_mplane *pix_mp;
+	const struct mtk_dip_dev_format *mdp_fmt;
+	unsigned int i;
+	unsigned int total_plane_size = 0;
+
+	if (!dev_buf->dev_fmt) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s: %s's dev format not set\n",
+			__func__, buf_name);
+		return -EINVAL;
+	}
+
+	pix_mp = &dev_buf->fmt.fmt.pix_mp;
+	mdp_fmt = dev_buf->dev_fmt;
+
+	b->usage = dev_buf->dma_port;
+	b->format.colorformat = dev_buf->dev_fmt->mdp_color;
+	b->format.width = dev_buf->fmt.fmt.pix_mp.width;
+	b->format.height = dev_buf->fmt.fmt.pix_mp.height;
+	b->format.ycbcr_prof =
+		map_ycbcr_prof_mplane(pix_mp,
+				      dev_buf->dev_fmt->mdp_color);
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s: buf(%s), IPI: w(%d),h(%d),c(0x%x)\n",
+		pipe->desc->name,
+		buf_name,
+		b->format.width,
+		b->format.height,
+		b->format.colorformat);
+
+	for (i = 0; i < pix_mp->num_planes; ++i) {
+		u32 stride = mtk_dip_pipe_get_stride(pipe, pix_mp, mdp_fmt,
+						     i, buf_name);
+
+		b->format.plane_fmt[i].stride = stride;
+		b->format.plane_fmt[i].size =
+			dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
+						   pix_mp->height, i);
+		b->iova[i] = dev_buf->isp_daddr[i];
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"Non-contiguous-mp-buf:plane(%i),stride(%d),size(%d),iova(%lx)",
+			i,
+			b->format.plane_fmt[i].stride,
+			b->format.plane_fmt[i].size,
+			b->iova[i]);
+		total_plane_size += b->format.plane_fmt[i].size;
+	}
+
+	if (!is_contig_mp_buffer(dev_buf)) {
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"Non-contiguous-mp-buf(%s),total-plane-size(%d),dma_port(%d)\n",
+			buf_name,
+			total_plane_size,
+			b->usage);
+		return 0;
+	}
+
+	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
+		u32 stride = dip_mdp_fmt_get_stride_contig
+				(mdp_fmt, b->format.plane_fmt[0].stride, i);
+
+		b->format.plane_fmt[i].stride = stride;
+		b->format.plane_fmt[i].size =
+			dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
+						   pix_mp->height, i);
+		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"Contiguous-mp-buf:plane(%i),stride(%d),size(%d),iova(%lx)",
+			i,
+			b->format.plane_fmt[i].stride,
+			b->format.plane_fmt[i].size,
+			b->iova[i]);
+		total_plane_size += b->format.plane_fmt[i].size;
+	}
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"Contiguous-mp-buf(%s),v4l2-sizeimage(%d),total-plane-size(%d)\n",
+		buf_name,
+		pix_mp->plane_fmt[0].sizeimage,
+		total_plane_size);
+
+	return 0;
+}
+
+static int fill_input_ipi_param(struct mtk_dip_pipe *pipe,
+				struct img_input *iin,
+				struct mtk_dip_dev_buffer *dev_buf,
+				char *buf_name)
+{
+	struct img_image_buffer *img = &iin->buffer;
+
+	return fill_ipi_img_param_mp(pipe, img, dev_buf,
+				     buf_name);
+}
+
+static int fill_output_ipi_param(struct mtk_dip_pipe *pipe,
+				 struct img_output *iout,
+				 struct mtk_dip_dev_buffer *dev_buf_out,
+				 struct mtk_dip_dev_buffer *dev_buf_in,
+				 char *buf_name)
+{
+	int ret;
+	struct img_image_buffer *img = &iout->buffer;
+
+	ret = fill_ipi_img_param_mp(pipe, img, dev_buf_out,
+				    buf_name);
+	iout->crop.left = 0;
+	iout->crop.top = 0;
+	iout->crop.width = dev_buf_in->fmt.fmt.pix_mp.width;
+	iout->crop.height = dev_buf_in->fmt.fmt.pix_mp.height;
+	iout->crop.left_subpix = 0;
+	iout->crop.top_subpix = 0;
+	iout->crop.width_subpix = 0;
+	iout->crop.height_subpix = 0;
+	iout->rotation = dev_buf_out->rotation;
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s: buf(%s) IPI-ext:c_l(%d),c_t(%d),c_w(%d),c_h(%d)\n",
+		pipe->desc->name,
+		buf_name,
+		iout->crop.left,
+		iout->crop.top,
+		iout->crop.width,
+		iout->crop.height);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"c_ls(%d),c_ts(%d),c_ws(%d),c_hs(%d),rot(%d)\n",
+		iout->crop.left_subpix,
+		iout->crop.top_subpix,
+		iout->crop.width_subpix,
+		iout->crop.height_subpix,
+		iout->rotation);
+
+	return ret;
+}
+
+void mtk_dip_pipe_ipi_params_config(struct mtk_dip_request *req)
+{
+	struct mtk_dip_pipe *pipe = req->dip_pipe;
+	struct platform_device *pdev = pipe->dip_dev->pdev;
+	struct mtk_dip_pipe_job_info *pipe_job_info = &req->job_info;
+	int out_img_buf_idx;
+	int in_img_buf_idx;
+	struct img_ipi_frameparam *dip_param = &req->img_fparam.frameparam;
+	struct mtk_dip_dev_buffer *dev_buf_in;
+	struct mtk_dip_dev_buffer *dev_buf_out;
+	struct mtk_dip_dev_buffer *dev_buf_tuning;
+	int i = 0;
+	int mdp_ids[2] = {MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
+			  MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE};
+	char *mdp_names[2] = {"mdp0", "mdp1"};
+
+	dev_dbg(&pdev->dev,
+		"%s:%s: pipe-job id(%d)\n",
+		__func__, pipe->desc->name,
+		pipe_job_info->id);
+
+	/* Fill ipi params for DIP driver */
+	memset(dip_param, 0, sizeof(*dip_param));
+	dip_param->index = pipe_job_info->id;
+	dip_param->type = STREAM_ISP_IC;
+
+	/* Tuning buffer */
+	dev_buf_tuning =
+		pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_TUNING_OUT];
+	if (dev_buf_tuning) {
+		dev_dbg(&pdev->dev,
+			"Tuning buf queued: scp_daddr(%pad),isp_daddr(%pad)\n",
+			&dev_buf_tuning->scp_daddr[0],
+			&dev_buf_tuning->isp_daddr[0]);
+		dip_param->tuning_data.pa =
+			(uint32_t)dev_buf_tuning->scp_daddr[0];
+		dip_param->tuning_data.present = true;
+		dip_param->tuning_data.iova =
+			(uint32_t)dev_buf_tuning->isp_daddr[0];
+	} else {
+		dev_dbg(&pdev->dev,
+			"No enqueued tuning buffer: scp_daddr(%llx),present(%llx),isp_daddr(%llx\n",
+			dip_param->tuning_data.pa,
+			dip_param->tuning_data.present,
+			dip_param->tuning_data.iova);
+	}
+
+	in_img_buf_idx = 0;
+
+	/* Raw-in buffer */
+	dev_buf_in =
+		pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT];
+	if (dev_buf_in) {
+		struct img_input *iin = &dip_param->inputs[in_img_buf_idx];
+
+		fill_input_ipi_param(pipe, iin, dev_buf_in, "RAW");
+		in_img_buf_idx++;
+	}
+
+	/* Array of MDP buffers */
+	out_img_buf_idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mdp_ids); i++) {
+		dev_buf_out =
+			pipe_job_info->buf_map[mdp_ids[i]];
+		if (dev_buf_out) {
+			struct img_output *iout =
+				&dip_param->outputs[out_img_buf_idx];
+
+			fill_output_ipi_param(pipe, iout, dev_buf_out,
+					      dev_buf_in, mdp_names[i]);
+			out_img_buf_idx++;
+		}
+	}
+
+	dip_param->num_outputs = out_img_buf_idx;
+	dip_param->num_inputs = in_img_buf_idx;
+}
+
+void mtk_dip_pipe_try_enqueue(struct mtk_dip_pipe *pipe)
+{
+	struct mtk_dip_pipe_job_info *job_info;
+	struct mtk_dip_pipe_job_info *tmp_job_info;
+	struct list_head enqueue_job_list;
+
+	INIT_LIST_HEAD(&enqueue_job_list);
+	if (!pipe->streaming)
+		return;
+
+	spin_lock(&pipe->job_lock);
+	list_for_each_entry_safe(job_info, tmp_job_info,
+				 &pipe->pipe_job_pending_list,
+				 list) {
+		list_del(&job_info->list);
+		pipe->num_pending_jobs--;
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: current num of pending jobs(%d)\n",
+			__func__, pipe->desc->name,
+			pipe->num_pending_jobs);
+		list_add_tail(&job_info->list,
+			      &enqueue_job_list);
+	}
+	spin_unlock(&pipe->job_lock);
+
+	list_for_each_entry_safe(job_info, tmp_job_info,
+				 &enqueue_job_list,
+				 list) {
+		struct mtk_dip_request *req =
+				mtk_dip_pipe_job_info_to_req(job_info);
+
+		list_del(&job_info->list);
+
+		spin_lock(&pipe->job_lock);
+		list_add_tail(&job_info->list,
+			      &pipe->pipe_job_running_list);
+			pipe->num_jobs++;
+			dev_dbg(&pipe->dip_dev->pdev->dev,
+				"%s:%s: current num of running jobs(%d)\n",
+				__func__, pipe->desc->name,
+				pipe->num_jobs);
+		spin_unlock(&pipe->job_lock);
+
+		mtk_dip_hw_enqueue(&pipe->dip_dev->dip_hw, req);
+	}
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
new file mode 100644
index 000000000000..e3372c291f9a
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
@@ -0,0 +1,337 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_DIP_DEV_H_
+#define _MTK_DIP_DEV_H_
+
+#include <linux/types.h>
+#include <linux/platform_device.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-device.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "mtk_dip-hw.h"
+
+#define MTK_DIP_PIPE_ID_PREVIEW				0
+#define MTK_DIP_PIPE_ID_CAPTURE				1
+#define MTK_DIP_PIPE_ID_REPROCESS			2
+#define MTK_DIP_PIPE_ID_TOTAL_NUM			3
+
+#define MTK_DIP_VIDEO_NODE_ID_RAW_OUT			0
+#define MTK_DIP_VIDEO_NODE_ID_TUNING_OUT		1
+#define MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM		2
+#define MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE		2
+#define MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE		3
+#define MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM		2
+#define MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM \
+	(MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM + \
+	MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM)
+
+#define MTK_DIP_VIDEO_NODE_ID_NO_MASTER			-1
+
+#define MTK_DIP_OUTPUT_MIN_WIDTH		2U
+#define MTK_DIP_OUTPUT_MIN_HEIGHT		2U
+#define MTK_DIP_OUTPUT_MAX_WIDTH		5376U
+#define MTK_DIP_OUTPUT_MAX_HEIGHT		4032U
+#define MTK_DIP_CAPTURE_MIN_WIDTH		2U
+#define MTK_DIP_CAPTURE_MIN_HEIGHT		2U
+#define MTK_DIP_CAPTURE_MAX_WIDTH		5376U
+#define MTK_DIP_CAPTURE_MAX_HEIGHT		4032U
+
+#define MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME	"MTK-ISP-DIP-V4L2"
+#define MTK_DIP_DEV_DIP_PREVIEW_NAME \
+	MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME
+#define MTK_DIP_DEV_DIP_CAPTURE_NAME		"MTK-ISP-DIP-CAP-V4L2"
+#define MTK_DIP_DEV_DIP_REPROCESS_NAME		"MTK-ISP-DIP-REP-V4L2"
+
+#define MTK_DIP_DEV_META_BUF_DEFAULT_SIZE	(1024 * 128)
+#define MTK_DIP_DEV_META_BUF_POOL_MAX_SIZE	(1024 * 1024 * 6)
+
+#define V4L2_CID_MTK_DIP_MAX			100
+
+enum mtk_dip_pixel_mode {
+	mtk_dip_pixel_mode_default = 0,
+	mtk_dip_pixel_mode_1,
+	mtk_dip_pixel_mode_2,
+	mtk_dip_pixel_mode_4,
+	mtk_dip_pixel_mode_num,
+};
+
+struct mtk_dip_dev_format {
+	u32 format;
+	u32 mdp_color;
+	u32 colorspace;
+	u8 depth[VIDEO_MAX_PLANES];
+	u8 row_depth[VIDEO_MAX_PLANES];
+	u8 num_planes;
+	u8 walign;
+	u8 halign;
+	u8 salign;
+	u32 flags;
+	u32 buffer_size;
+};
+
+struct mtk_dip_pipe_job_info {
+	int id;
+	struct mtk_dip_dev_buffer*
+		buf_map[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
+	struct list_head list;
+};
+
+struct mtk_dip_dev_buffer {
+	struct vb2_v4l2_buffer vbb;
+	struct v4l2_format fmt;
+	const struct mtk_dip_dev_format *dev_fmt;
+	int pipe_job_id;
+	dma_addr_t isp_daddr[VB2_MAX_PLANES];
+	dma_addr_t scp_daddr[VB2_MAX_PLANES];
+	unsigned int dma_port;
+	int rotation;
+	struct list_head list;
+};
+
+struct mtk_dip_pipe_desc {
+	char *name;
+	int master;
+	int id;
+	const struct mtk_dip_video_device_desc *output_queue_descs;
+	int total_output_queues;
+	const struct mtk_dip_video_device_desc *capture_queue_descs;
+	int total_capture_queues;
+};
+
+struct mtk_dip_video_device_desc {
+	int id;
+	char *name;
+	u32 buf_type;
+	u32 cap;
+	int smem_alloc;
+	const struct mtk_dip_dev_format *fmts;
+	int num_fmts;
+	char *description;
+	int default_width;
+	int default_height;
+	unsigned int dma_port;
+	const struct v4l2_frmsizeenum *frmsizeenum;
+	const struct v4l2_ioctl_ops *ops;
+	u32 flags;
+	int default_fmt_idx;
+};
+
+struct mtk_dip_dev_queue {
+	struct vb2_queue vbq;
+	/* Serializes vb2 queue and video device operations */
+	struct mutex lock;
+	const struct mtk_dip_dev_format *dev_fmt;
+	int rotation;
+};
+
+struct mtk_dip_video_device {
+	struct video_device vdev;
+	struct mtk_dip_dev_queue dev_q;
+	struct v4l2_format vdev_fmt;
+	struct media_pad vdev_pad;
+	struct v4l2_mbus_framefmt pad_fmt;
+	struct v4l2_ctrl_handler ctrl_handler;
+	u32 flags;
+	const struct mtk_dip_video_device_desc *desc;
+	atomic_t sequence;
+	struct list_head buf_list;
+	/* protect the in-device buffer list */
+	spinlock_t buf_list_lock;
+};
+
+struct mtk_dip_pipe {
+	struct mtk_dip_dev *dip_dev;
+	struct mtk_dip_video_device nodes[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
+	int num_nodes;
+	atomic_t cnt_nodes_not_streaming;
+	int streaming;
+	struct media_pad *subdev_pads;
+	struct media_pipeline pipeline;
+	struct v4l2_subdev subdev;
+	struct v4l2_subdev_fh *fh;
+	atomic_t pipe_job_sequence;
+	struct list_head pipe_job_pending_list;
+	int num_pending_jobs;
+	struct list_head pipe_job_running_list;
+	int num_jobs;
+	/* Serializes pipe's stream on/off and buffers enqueue operations */
+	struct mutex lock;
+	spinlock_t job_lock; /* protect the pipe job list */
+	const struct mtk_dip_pipe_desc *desc;
+};
+
+struct mtk_dip_dev {
+	struct platform_device *pdev;
+	struct media_device mdev;
+	struct v4l2_device v4l2_dev;
+	struct mtk_dip_pipe dip_pipe[MTK_DIP_PIPE_ID_TOTAL_NUM];
+	struct mtk_dip_hw dip_hw;
+};
+
+struct mtk_dip_request {
+	struct media_request req;
+	struct mtk_dip_pipe *dip_pipe;
+	struct mtk_dip_pipe_job_info job_info;
+	struct img_frameparam img_fparam;
+	struct work_struct fw_work;
+	struct work_struct mdp_work;
+	/* It is used only in timeout handling flow */
+	struct work_struct mdpcb_work;
+	struct mtk_dip_hw_subframe *working_buf;
+	atomic_t buf_count;
+};
+
+int mtk_dip_dev_media_register(struct device *dev,
+			       struct media_device *media_dev,
+			       const char *model);
+
+void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev);
+
+int mtk_dip_dev_v4l2_register(struct device *dev,
+			      struct media_device *media_dev,
+			      struct v4l2_device *v4l2_dev);
+
+int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *pipe,
+			       struct media_device *media_dev,
+			       struct v4l2_device *v4l2_dev);
+
+void mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *pipe);
+
+int mtk_dip_pipe_queue_buffers(struct media_request *req, int initial);
+
+int mtk_dip_pipe_init(struct mtk_dip_pipe *pipe,
+		      struct mtk_dip_dev *dip_dev,
+		      const struct mtk_dip_pipe_desc *setting,
+		      struct media_device *media_dev,
+		      struct v4l2_device *v4l2_dev);
+
+void mtk_dip_pipe_ipi_params_config(struct mtk_dip_request *req);
+
+int mtk_dip_pipe_release(struct mtk_dip_pipe *pipe);
+
+struct mtk_dip_pipe_job_info *
+mtk_dip_pipe_get_running_job_info(struct mtk_dip_pipe *pipe,
+				  int pipe_job_id);
+
+int mtk_dip_pipe_next_job_id(struct mtk_dip_pipe *pipe);
+
+void mtk_dip_pipe_debug_job(struct mtk_dip_pipe *pipe,
+			    struct mtk_dip_pipe_job_info *pipe_job_info);
+
+int mtk_dip_pipe_job_finish(struct mtk_dip_pipe *pipe,
+			    unsigned int pipe_job_info_id,
+			    enum vb2_buffer_state state);
+
+const struct mtk_dip_dev_format *
+mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *pipe,
+		      struct mtk_dip_video_device *node,
+		      u32 format);
+
+void mtk_dip_pipe_set_img_fmt(struct mtk_dip_pipe *pipe,
+			      struct mtk_dip_video_device *node,
+			      struct v4l2_pix_format_mplane *mfmt_to_fill,
+			      const struct mtk_dip_dev_format *dev_fmt);
+
+void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *pipe,
+				   struct mtk_dip_video_device *node,
+				   struct v4l2_format *fmt_to_fill);
+
+void mtk_dip_pipe_try_enqueue(struct mtk_dip_pipe *pipe);
+
+void mtk_dip_hw_enqueue(struct mtk_dip_hw *dip_hw, struct mtk_dip_request *req);
+
+int mtk_dip_hw_streamoff(struct mtk_dip_pipe *pipe);
+
+int mtk_dip_hw_streamon(struct mtk_dip_pipe *pipe);
+
+static inline struct mtk_dip_pipe*
+mtk_dip_dev_get_pipe(struct mtk_dip_dev *dip_dev, unsigned int pipe_id)
+{
+	if (pipe_id < 0 && pipe_id >= MTK_DIP_PIPE_ID_TOTAL_NUM)
+		return NULL;
+
+	return &dip_dev->dip_pipe[pipe_id];
+}
+
+static inline struct mtk_dip_video_device*
+mtk_dip_file_to_node(struct file *file)
+{
+	return container_of(video_devdata(file),
+			    struct mtk_dip_video_device, vdev);
+}
+
+static inline struct mtk_dip_pipe*
+mtk_dip_subdev_to_pipe(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mtk_dip_pipe, subdev);
+}
+
+static inline struct mtk_dip_dev*
+mtk_dip_mdev_to_dev(struct media_device *mdev)
+{
+	return container_of(mdev, struct mtk_dip_dev, mdev);
+}
+
+static inline struct mtk_dip_video_device*
+mtk_dip_vbq_to_node(struct vb2_queue *vq)
+{
+	return container_of(vq, struct mtk_dip_video_device, dev_q.vbq);
+}
+
+static inline struct mtk_dip_dev_buffer*
+mtk_dip_vb2_buf_to_dev_buf(struct vb2_buffer *vb)
+{
+	return container_of(vb, struct mtk_dip_dev_buffer, vbb.vb2_buf);
+}
+
+static inline struct mtk_dip_dev *mtk_dip_hw_to_dev(struct mtk_dip_hw *dip_hw)
+{
+	return container_of(dip_hw, struct mtk_dip_dev, dip_hw);
+}
+
+static inline struct mtk_dip_request*
+mtk_dip_pipe_job_info_to_req(struct mtk_dip_pipe_job_info *job_info)
+{
+	return container_of(job_info, struct mtk_dip_request, job_info);
+}
+
+static inline struct mtk_dip_request*
+mtk_dip_hw_fw_work_to_req(struct work_struct *fw_work)
+{
+	return container_of(fw_work, struct mtk_dip_request, fw_work);
+}
+
+static inline struct mtk_dip_request*
+mtk_dip_hw_mdp_work_to_req(struct work_struct *mdp_work)
+{
+	return container_of(mdp_work, struct mtk_dip_request, mdp_work);
+}
+
+static inline struct mtk_dip_request *
+mtk_dip_hw_mdpcb_work_to_req(struct work_struct *mdpcb_work)
+{
+	return container_of(mdpcb_work, struct mtk_dip_request, mdpcb_work);
+}
+
+static inline int mtk_dip_buf_is_meta(u32 type)
+{
+	return type == V4L2_BUF_TYPE_META_CAPTURE ||
+		type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+static inline int mtk_dip_pipe_get_pipe_from_job_id(int pipe_job_id)
+{
+	return (pipe_job_id >> 16) & 0x0000FFFF;
+}
+
+#endif /* _MTK_DIP_DEV_H_ */
diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
new file mode 100644
index 000000000000..2dd4dae4336c
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_DIP_HW_H_
+#define _MTK_DIP_HW_H_
+
+#include <linux/clk.h>
+#include "mtk-img-ipi.h"
+
+#define DIP_COMPOSER_THREAD_TIMEOUT	16U
+#define DIP_COMPOSING_MAX_NUM		3
+#define DIP_MAX_ERR_COUNT		188U
+#define DIP_FLUSHING_WQ_TIMEOUT		(16U * DIP_MAX_ERR_COUNT)
+
+#define DIP_FRM_SZ			(76 * 1024)
+#define DIP_SUB_FRM_SZ			(16 * 1024)
+#define DIP_TUNING_SZ			(32 * 1024)
+#define DIP_COMP_SZ			(24 * 1024)
+#define DIP_FRAMEPARAM_SZ		(4 * 1024)
+
+#define DIP_TUNING_OFFSET		DIP_SUB_FRM_SZ
+#define DIP_COMP_OFFSET			(DIP_TUNING_OFFSET + DIP_TUNING_SZ)
+#define DIP_FRAMEPARAM_OFFSET		(DIP_COMP_OFFSET + DIP_COMP_SZ)
+#define DIP_SUB_FRM_DATA_NUM		32
+#define DIP_SCP_WORKINGBUF_OFFSET	(5 * 1024 * 1024)
+#define DIP_V4l2_META_BUF_OFFSET	(DIP_SCP_WORKINGBUF_OFFSET + \
+					 DIP_SUB_FRM_DATA_NUM * DIP_FRM_SZ)
+
+#define MTK_DIP_CLK_NUM 2
+
+enum STREAM_TYPE_ENUM {
+	STREAM_UNKNOWN,
+	STREAM_BITBLT,
+	STREAM_GPU_BITBLT,
+	STREAM_DUAL_BITBLT,
+	STREAM_2ND_BITBLT,
+	STREAM_ISP_IC,
+	STREAM_ISP_VR,
+	STREAM_ISP_ZSD,
+	STREAM_ISP_IP,
+	STREAM_ISP_VSS,
+	STREAM_ISP_ZSD_SLOW,
+	STREAM_WPE,
+	STREAM_WPE2,
+};
+
+enum mtk_dip_hw_user_state {
+	DIP_STATE_INIT	= 0,
+	DIP_STATE_OPENED,
+	DIP_STATE_STREAMON,
+	DIP_STATE_STREAMOFF
+};
+
+struct mtk_dip_hw_working_buf {
+	dma_addr_t scp_daddr;
+	void *vaddr;
+	dma_addr_t isp_daddr;
+};
+
+struct mtk_dip_hw_subframe {
+	struct mtk_dip_hw_working_buf buffer;
+	int size;
+	struct mtk_dip_hw_working_buf config_data;
+	struct mtk_dip_hw_working_buf tuning_buf;
+	struct mtk_dip_hw_working_buf frameparam;
+	struct list_head list_entry;
+};
+
+enum frame_state {
+	FRAME_STATE_INIT = 0,
+	FRAME_STATE_COMPOSING,
+	FRAME_STATE_RUNNING,
+	FRAME_STATE_DONE,
+	FRAME_STATE_STREAMOFF,
+	FRAME_STATE_ERROR,
+	FRAME_STATE_HW_TIMEOUT
+};
+
+struct mtk_dip_hw_working_buf_list {
+	struct list_head list;
+	u32 cnt;
+	spinlock_t lock; /* protect the list and cnt */
+
+};
+
+struct mtk_dip_hw {
+	struct clk_bulk_data clks[MTK_DIP_CLK_NUM];
+	struct workqueue_struct *composer_wq;
+	struct workqueue_struct *mdp_wq;
+	wait_queue_head_t working_buf_wq;
+	wait_queue_head_t flushing_wq;
+	wait_queue_head_t flushing_hw_wq;
+	atomic_t num_composing;	/* increase after ipi */
+	/* increase after calling MDP driver */
+	atomic_t num_running;
+	/*MDP/GCE callback workqueue */
+	struct workqueue_struct *mdpcb_workqueue;
+	/* for MDP driver  */
+	struct platform_device *mdp_pdev;
+	/* for SCP driver  */
+	struct platform_device *scp_pdev;
+	struct rproc *rproc_handle;
+	struct mtk_dip_hw_working_buf_list dip_freebufferlist;
+	struct mtk_dip_hw_working_buf_list dip_usedbufferlist;
+	dma_addr_t working_buf_mem_scp_daddr;
+	void *working_buf_mem_vaddr;
+	dma_addr_t working_buf_mem_isp_daddr;
+	int working_buf_mem_size;
+	struct mtk_dip_hw_subframe working_buf[DIP_SUB_FRM_DATA_NUM];
+	/* increase after enqueue */
+	atomic_t dip_enque_cnt;
+	/* increase after stream on, decrease when stream off */
+	atomic_t dip_stream_cnt;
+	/* To serialize request opertion to DIP co-procrosser and hadrware */
+	struct mutex hw_op_lock;
+	/* To restrict the max number of request be send to SCP */
+	struct semaphore sem;
+};
+
+static inline void
+mtk_dip_wbuf_to_ipi_img_sw_addr(struct img_sw_addr *ipi_addr,
+				struct mtk_dip_hw_working_buf *wbuf)
+{
+	ipi_addr->va = (u64)wbuf->vaddr;
+	ipi_addr->pa = (u32)wbuf->scp_daddr;
+}
+
+static inline void
+mtk_dip_wbuf_to_ipi_img_addr(struct img_addr *ipi_addr,
+			     struct mtk_dip_hw_working_buf *wbuf)
+{
+	ipi_addr->va = (u64)wbuf->vaddr;
+	ipi_addr->pa = (u32)wbuf->scp_daddr;
+	ipi_addr->iova = (u32)wbuf->isp_daddr;
+}
+
+static inline void
+mtk_dip_wbuf_to_ipi_tuning_addr(struct tuning_addr *ipi_addr,
+				struct mtk_dip_hw_working_buf *wbuf)
+{
+	ipi_addr->pa = (u32)wbuf->scp_daddr;
+	ipi_addr->iova = (u32)wbuf->isp_daddr;
+}
+
+int mtk_dip_hw_working_buf_pool_init(struct mtk_dip_hw *dip_hw);
+void mtk_dip_hw_working_buf_pool_release(struct mtk_dip_hw *dip_hw);
+
+#endif /* _MTK_DIP_HW_H_ */
+
diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
new file mode 100644
index 000000000000..603be116b03f
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
@@ -0,0 +1,794 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/dma-iommu.h>
+#include <linux/freezer.h>
+#include <linux/platform_data/mtk_scp.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/wait.h>
+#include "mtk-mdp3-cmdq.h"
+#include "mtk_dip-dev.h"
+#include "mtk_dip-hw.h"
+
+int mtk_dip_hw_working_buf_pool_init(struct mtk_dip_hw *dip_hw)
+{
+	int i;
+	struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
+	const int working_buf_size = round_up(DIP_FRM_SZ, PAGE_SIZE);
+	phys_addr_t working_buf_paddr;
+
+	INIT_LIST_HEAD(&dip_hw->dip_freebufferlist.list);
+	spin_lock_init(&dip_hw->dip_freebufferlist.lock);
+	dip_hw->dip_freebufferlist.cnt = 0;
+
+	INIT_LIST_HEAD(&dip_hw->dip_usedbufferlist.list);
+	spin_lock_init(&dip_hw->dip_usedbufferlist.lock);
+	dip_hw->dip_usedbufferlist.cnt = 0;
+
+	init_waitqueue_head(&dip_hw->working_buf_wq);
+
+	dip_hw->working_buf_mem_size = DIP_SUB_FRM_DATA_NUM * working_buf_size +
+		DIP_SCP_WORKINGBUF_OFFSET;
+	dip_hw->working_buf_mem_vaddr =
+		dma_alloc_coherent(&dip_hw->scp_pdev->dev,
+				   dip_hw->working_buf_mem_size,
+				   &dip_hw->working_buf_mem_scp_daddr,
+				   GFP_KERNEL);
+	if (!dip_hw->working_buf_mem_vaddr) {
+		dev_err(&dip_dev->pdev->dev,
+			"memory alloc size %ld failed\n",
+			dip_hw->working_buf_mem_size);
+		return -ENOMEM;
+	}
+
+	/*
+	 * We got the incorrect physical address mapped when
+	 * using dma_map_single() so I used dma_map_page_attrs()
+	 * directly to workaround here.
+	 *
+	 * When I use dma_map_single() to map the address, the
+	 * physical address retrieved back with iommu_get_domain_for_dev()
+	 * and iommu_iova_to_phys() was not equal to the
+	 * SCP dma address (it should be the same as the physical address
+	 * since we don't have iommu), and was shifted by 0x4000000.
+	 */
+	working_buf_paddr = dip_hw->working_buf_mem_scp_daddr;
+	dip_hw->working_buf_mem_isp_daddr =
+		dma_map_page_attrs(&dip_dev->pdev->dev,
+				   phys_to_page(working_buf_paddr),
+				   0, dip_hw->working_buf_mem_size,
+				   DMA_BIDIRECTIONAL,
+				   DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(&dip_dev->pdev->dev,
+			      dip_hw->working_buf_mem_isp_daddr)) {
+		dev_err(&dip_dev->pdev->dev,
+			"failed to map buffer: s_daddr(%pad)\n",
+			&dip_hw->working_buf_mem_scp_daddr);
+		dma_free_coherent(&dip_hw->scp_pdev->dev,
+				  dip_hw->working_buf_mem_size,
+				  dip_hw->working_buf_mem_vaddr,
+				  dip_hw->working_buf_mem_scp_daddr);
+
+		return -ENOMEM;
+	}
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: working_buf_mem: vaddr(%p), scp_daddr(%pad)\n",
+		__func__,
+		dip_hw->working_buf_mem_vaddr,
+		&dip_hw->working_buf_mem_scp_daddr);
+
+	for (i = 0; i < DIP_SUB_FRM_DATA_NUM; i++) {
+		struct mtk_dip_hw_subframe *buf = &dip_hw->working_buf[i];
+
+		/*
+		 * Total: 0 ~ 72 KB
+		 * SubFrame: 0 ~ 16 KB
+		 */
+		buf->buffer.scp_daddr = dip_hw->working_buf_mem_scp_daddr +
+			DIP_SCP_WORKINGBUF_OFFSET + i * working_buf_size;
+		buf->buffer.vaddr = dip_hw->working_buf_mem_vaddr +
+			DIP_SCP_WORKINGBUF_OFFSET + i * working_buf_size;
+		buf->buffer.isp_daddr = dip_hw->working_buf_mem_isp_daddr +
+			DIP_SCP_WORKINGBUF_OFFSET + i * working_buf_size;
+		buf->size = working_buf_size;
+
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: buf(%d), scp_daddr(%pad), isp_daddr(%pad)\n",
+			__func__, i, &buf->buffer.scp_daddr,
+			&buf->buffer.isp_daddr);
+
+		/* Tuning: 16 ~ 48 KB */
+		buf->tuning_buf.scp_daddr =
+			buf->buffer.scp_daddr + DIP_TUNING_OFFSET;
+		buf->tuning_buf.vaddr =
+			buf->buffer.vaddr + DIP_TUNING_OFFSET;
+		buf->tuning_buf.isp_daddr =
+			buf->buffer.isp_daddr + DIP_TUNING_OFFSET;
+
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: tuning_buf(%d), scp_daddr(%pad), isp_daddr(%pad)\n",
+			__func__, i, &buf->tuning_buf.scp_daddr,
+			&buf->tuning_buf.isp_daddr);
+
+		/* Config_data: 48 ~ 72 KB */
+		buf->config_data.scp_daddr =
+			buf->buffer.scp_daddr + DIP_COMP_OFFSET;
+		buf->config_data.vaddr = buf->buffer.vaddr + DIP_COMP_OFFSET;
+
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: config_data(%d), scp_daddr(%pad), vaddr(%p)\n",
+			__func__, i, &buf->config_data.scp_daddr,
+			buf->config_data.vaddr);
+
+		/* Frame parameters: 72 ~ 76 KB */
+		buf->frameparam.scp_daddr =
+			buf->buffer.scp_daddr + DIP_FRAMEPARAM_OFFSET;
+		buf->frameparam.vaddr =
+			buf->buffer.vaddr + DIP_FRAMEPARAM_OFFSET;
+
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: frameparam(%d), scp_daddr(%pad), vaddr(%p)\n",
+			__func__, i, &buf->frameparam.scp_daddr,
+			buf->frameparam.vaddr);
+
+		list_add_tail(&buf->list_entry,
+			      &dip_hw->dip_freebufferlist.list);
+		dip_hw->dip_freebufferlist.cnt++;
+	}
+
+	return 0;
+}
+
+void mtk_dip_hw_working_buf_pool_release(struct mtk_dip_hw *dip_hw)
+{
+	/* All the buffer should be in the freebufferlist when release */
+	struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
+	u32 i;
+
+	if (dip_hw->dip_usedbufferlist.cnt)
+		dev_warn(&dip_dev->pdev->dev,
+			 "%s: dip_usedbufferlist is not empty (%d/%d)\n",
+			__func__, dip_hw->dip_usedbufferlist.cnt, i);
+
+	dma_unmap_page_attrs(&dip_dev->pdev->dev,
+			     dip_hw->working_buf_mem_isp_daddr,
+			     dip_hw->working_buf_mem_size, DMA_BIDIRECTIONAL,
+			     DMA_ATTR_SKIP_CPU_SYNC);
+
+	dma_free_coherent(&dip_hw->scp_pdev->dev, dip_hw->working_buf_mem_size,
+			  dip_hw->working_buf_mem_vaddr,
+			  dip_hw->working_buf_mem_scp_daddr);
+}
+
+static void mtk_dip_hw_working_buf_free(struct mtk_dip_hw *dip_hw,
+					struct mtk_dip_hw_subframe *working_buf)
+{
+	struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
+
+	if (!working_buf)
+		return;
+
+	spin_lock(&dip_hw->dip_usedbufferlist.lock);
+	list_del(&working_buf->list_entry);
+			dip_hw->dip_usedbufferlist.cnt--;
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: Free used buffer(%pad)\n",
+		__func__, &working_buf->buffer.scp_daddr);
+	spin_unlock(&dip_hw->dip_usedbufferlist.lock);
+
+	spin_lock(&dip_hw->dip_freebufferlist.lock);
+	list_add_tail(&working_buf->list_entry,
+		      &dip_hw->dip_freebufferlist.list);
+	dip_hw->dip_freebufferlist.cnt++;
+	spin_unlock(&dip_hw->dip_freebufferlist.lock);
+}
+
+static struct mtk_dip_hw_subframe*
+mtk_dip_hw_working_buf_alloc(struct mtk_dip_hw *dip_hw)
+{
+	struct mtk_dip_hw_subframe *working_buf;
+
+	spin_lock(&dip_hw->dip_freebufferlist.lock);
+	if (list_empty(&dip_hw->dip_freebufferlist.list)) {
+		spin_unlock(&dip_hw->dip_freebufferlist.lock);
+		return NULL;
+	}
+
+	working_buf = list_first_entry(&dip_hw->dip_freebufferlist.list,
+				       struct mtk_dip_hw_subframe, list_entry);
+	list_del(&working_buf->list_entry);
+	dip_hw->dip_freebufferlist.cnt--;
+	spin_unlock(&dip_hw->dip_freebufferlist.lock);
+
+	spin_lock(&dip_hw->dip_usedbufferlist.lock);
+	list_add_tail(&working_buf->list_entry,
+		      &dip_hw->dip_usedbufferlist.list);
+	dip_hw->dip_usedbufferlist.cnt++;
+	spin_unlock(&dip_hw->dip_usedbufferlist.lock);
+
+	return working_buf;
+}
+
+static void mtk_dip_notify(struct mtk_dip_request *req)
+{
+	struct mtk_dip_hw *dip_hw = &req->dip_pipe->dip_dev->dip_hw;
+	struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
+	struct mtk_dip_pipe *pipe = req->dip_pipe;
+	struct img_ipi_frameparam *iparam = &req->img_fparam.frameparam;
+	enum vb2_buffer_state vbf_state;
+	int ret;
+
+	if (iparam->state != FRAME_STATE_HW_TIMEOUT)
+		vbf_state = VB2_BUF_STATE_DONE;
+	else
+		vbf_state = VB2_BUF_STATE_ERROR;
+
+	ret = mtk_dip_pipe_job_finish(pipe, iparam->index, vbf_state);
+	if (ret)
+		dev_dbg(&dip_dev->pdev->dev, "%s: finish CB failed(%d)\n",
+			__func__, ret);
+
+	pm_runtime_put_autosuspend(&pipe->dip_dev->pdev->dev);
+
+	mtk_dip_hw_working_buf_free(dip_hw, req->working_buf);
+	req->working_buf = NULL;
+	wake_up(&dip_hw->working_buf_wq);
+	wake_up(&dip_hw->flushing_wq);
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s:%s: job id(%d), frame_no(%d) finished\n",
+		__func__, pipe->desc->name, iparam->index, iparam->frame_no);
+}
+
+static void mdp_cb_timeout_worker(struct work_struct *work)
+{
+	struct mtk_dip_request *req = mtk_dip_hw_mdpcb_work_to_req(work);
+	struct img_ipi_param ipi_param;
+
+	dev_dbg(&req->dip_pipe->dip_dev->pdev->dev,
+		"%s: send frame no(%d) HW timeout dbg IPI\n",
+		__func__, req->img_fparam.frameparam.frame_no);
+
+	ipi_param.usage = IMG_IPI_DEBUG;
+	scp_ipi_send(req->dip_pipe->dip_dev->dip_hw.scp_pdev, SCP_IPI_DIP,
+		     (void *)&ipi_param, sizeof(ipi_param), 0);
+	mtk_dip_notify(req);
+}
+
+/* Maybe in IRQ context of cmdq */
+static void dip_mdp_cb_func(struct cmdq_cb_data data)
+{
+	struct mtk_dip_request *req;
+	struct mtk_dip_dev *dip_dev;
+
+	if (!data.data) {
+		pr_err("%s: data->data is NULL\n",
+		       __func__);
+		return;
+	}
+
+	req = data.data;
+	dip_dev = req->dip_pipe->dip_dev;
+
+	dev_dbg(&dip_dev->pdev->dev, "%s: req(%p), idx(%d), no(%d), s(%d), n_in(%d), n_out(%d)\n",
+		__func__,
+		req,
+		req->img_fparam.frameparam.index,
+		req->img_fparam.frameparam.frame_no,
+		req->img_fparam.frameparam.state,
+		req->img_fparam.frameparam.num_inputs,
+		req->img_fparam.frameparam.num_outputs);
+
+	if (data.sta != CMDQ_CB_NORMAL) {
+		dev_err(&dip_dev->pdev->dev, "%s: frame no(%d) HW timeout\n",
+			__func__, req->img_fparam.frameparam.frame_no);
+		req->img_fparam.frameparam.state = FRAME_STATE_HW_TIMEOUT;
+		INIT_WORK(&req->mdpcb_work, mdp_cb_timeout_worker);
+		queue_work(req->dip_pipe->dip_dev->dip_hw.mdpcb_workqueue,
+			   &req->mdpcb_work);
+	} else {
+		mtk_dip_notify(req);
+	}
+}
+
+static void dip_runner_func(struct work_struct *work)
+{
+	struct mtk_dip_request *req = mtk_dip_hw_mdp_work_to_req(work);
+	struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
+	struct img_config *config_data =
+		(struct img_config *)req->img_fparam.frameparam.config_data.va;
+	u32 num;
+
+	/*
+	 * Call MDP/GCE API to do HW excecution
+	 * Pass the framejob to MDP driver
+	 */
+	req->img_fparam.frameparam.state = FRAME_STATE_COMPOSING;
+	num = atomic_inc_return(&dip_dev->dip_hw.num_running);
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s,MDP running num(%d)\n", __func__, num);
+	mdp_cmdq_sendtask(dip_dev->dip_hw.mdp_pdev,
+			  config_data,
+			  &req->img_fparam.frameparam,
+			  NULL,
+			  false,
+			  dip_mdp_cb_func,
+			  req);
+}
+
+static void dip_scp_handler(void *data, unsigned int len, void *priv)
+{
+	struct mtk_dip_pipe_job_info *pipe_job_info;
+	struct mtk_dip_pipe *pipe;
+	int pipe_id;
+	struct mtk_dip_request *req;
+	struct img_ipi_frameparam *frameparam;
+	struct mtk_dip_dev *dip_dev = (struct mtk_dip_dev *)priv;
+	struct mtk_dip_hw *dip_hw = &dip_dev->dip_hw;
+	struct img_ipi_param *ipi_param;
+	u32 num;
+	int ret;
+
+	if (WARN_ONCE(!data, "%s: failed due to NULL data\n", __func__))
+		return;
+
+	ipi_param = (struct img_ipi_param *)data;
+
+	if (ipi_param->usage != IMG_IPI_FRAME) {
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: recevied SCP_IPI_DIP ACK, ipi_param.usage(%d)\n",
+			__func__, ipi_param->usage);
+		return;
+	}
+
+	frameparam = (struct img_ipi_frameparam *)ipi_param->frm_param.va;
+	pipe_id = mtk_dip_pipe_get_pipe_from_job_id(frameparam->index);
+	pipe = mtk_dip_dev_get_pipe(dip_dev, pipe_id);
+
+	if (!pipe) {
+		dev_warn(&dip_dev->pdev->dev,
+			 "%s: get invalid img_ipi_frameparam index(%d) from firmware\n",
+			 __func__, frameparam->frame_no);
+		return;
+	}
+
+	pipe_job_info =	mtk_dip_pipe_get_running_job_info(pipe,
+							  frameparam->index);
+
+	if (WARN_ONCE(!pipe_job_info, "%s: frame_no(%d) is lost\n",
+		      __func__, frameparam->frame_no))
+		return;
+
+	req = mtk_dip_pipe_job_info_to_req(pipe_job_info);
+	memcpy(&req->img_fparam.frameparam, frameparam,
+	       sizeof(req->img_fparam.frameparam));
+	num = atomic_dec_return(&dip_hw->num_composing);
+	down(&dip_hw->sem);
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: frame_no(%d) is back, composing num(%d)\n",
+		__func__, frameparam->frame_no, num);
+
+	wake_up(&dip_dev->dip_hw.flushing_hw_wq);
+
+	INIT_WORK(&req->mdp_work, dip_runner_func);
+	ret = queue_work(dip_hw->mdp_wq, &req->mdp_work);
+	if (!ret) {
+		dev_dbg(&dip_dev->pdev->dev,
+			"frame_no(%d) queue_work failed to mdp_wq: %d\n",
+			frameparam->frame_no, ret);
+	}
+}
+
+static bool
+mtk_dip_hw_is_working_buf_allocated(struct mtk_dip_request *req)
+{
+	req->working_buf =
+		mtk_dip_hw_working_buf_alloc(&req->dip_pipe->dip_dev->dip_hw);
+
+	if (!req->working_buf) {
+		dev_dbg(&req->dip_pipe->dip_dev->pdev->dev,
+			"%s:%s:req(%p): no free working buffer available\n",
+			__func__, req->dip_pipe->desc->name, req);
+		return false;
+	}
+
+	return true;
+}
+
+static void dip_submit_worker(struct work_struct *work)
+{
+	struct mtk_dip_request *req = mtk_dip_hw_fw_work_to_req(work);
+	struct mtk_dip_hw *dip_hw = &req->dip_pipe->dip_dev->dip_hw;
+	struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
+	struct img_ipi_param ipi_param;
+	struct mtk_dip_hw_subframe *buf;
+	int ret;
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: to send frame_no(%d),num(%d)\n",
+		__func__, req->img_fparam.frameparam.frame_no,
+		atomic_read(&dip_hw->num_composing));
+
+	wait_event_freezable(dip_hw->working_buf_wq,
+			     mtk_dip_hw_is_working_buf_allocated(req));
+	up(&dip_hw->sem);
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: wakeup frame_no(%d),num(%d)\n",
+		__func__, req->img_fparam.frameparam.frame_no,
+		atomic_read(&dip_hw->num_composing));
+
+	buf = req->working_buf;
+	mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
+				     &buf->buffer);
+	memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
+	mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
+					&buf->config_data);
+	memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
+
+	if (!req->img_fparam.frameparam.tuning_data.present) {
+		/*
+		 * When user enqueued without tuning buffer,
+		 * it would use driver internal buffer.
+		 */
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: frame_no(%d) has no tuning_data\n",
+			__func__, req->img_fparam.frameparam.frame_no);
+
+		mtk_dip_wbuf_to_ipi_tuning_addr
+				(&req->img_fparam.frameparam.tuning_data,
+				 &buf->tuning_buf);
+		memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
+	}
+
+	req->img_fparam.frameparam.state = FRAME_STATE_COMPOSING;
+	mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
+					&buf->frameparam);
+	memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
+	       sizeof(req->img_fparam.frameparam));
+
+	ipi_param.usage = IMG_IPI_FRAME;
+	mtk_dip_wbuf_to_ipi_img_sw_addr(&ipi_param.frm_param,
+					&buf->frameparam);
+
+	mutex_lock(&dip_hw->hw_op_lock);
+	atomic_inc(&dip_hw->num_composing);
+	ret = scp_ipi_send(dip_hw->scp_pdev, SCP_IPI_DIP, &ipi_param,
+			   sizeof(ipi_param), 0);
+	if (ret)
+		dev_dbg(&dip_dev->pdev->dev, "%s: send SCP_IPI_DIP_FRAME failed %d\n",
+			__func__, ret);
+	mutex_unlock(&dip_hw->hw_op_lock);
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: frame_no(%d),idx(0x%x), composing num(%d)\n",
+		__func__, req->img_fparam.frameparam.frame_no,
+		req->img_fparam.frameparam.index,
+		atomic_read(&dip_hw->num_composing));
+}
+
+static int mtk_dip_hw_res_init(struct mtk_dip_hw *dip_hw)
+{
+	struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
+	int ret;
+
+	dip_hw->mdp_pdev = mdp_get_plat_device(dip_dev->pdev);
+	if (!dip_hw->mdp_pdev) {
+		dev_dbg(&dip_dev->pdev->dev,
+			"%s: failed to get MDP device\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	dip_hw->mdpcb_workqueue =
+		alloc_ordered_workqueue("%s",
+					__WQ_LEGACY | WQ_MEM_RECLAIM |
+					WQ_FREEZABLE,
+					"mdp_callback");
+	if (!dip_hw->mdpcb_workqueue) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: unable to alloc mdpcb workqueue\n", __func__);
+		ret = -ENOMEM;
+		goto destroy_mdpcb_wq;
+	}
+
+	dip_hw->composer_wq =
+		alloc_ordered_workqueue("%s",
+					__WQ_LEGACY | WQ_MEM_RECLAIM |
+					WQ_FREEZABLE,
+					"dip_composer");
+	if (!dip_hw->composer_wq) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: unable to alloc composer workqueue\n", __func__);
+		ret = -ENOMEM;
+		goto destroy_dip_composer_wq;
+	}
+
+	dip_hw->mdp_wq =
+		alloc_ordered_workqueue("%s",
+					__WQ_LEGACY | WQ_MEM_RECLAIM |
+					WQ_FREEZABLE,
+					"dip_runner");
+	if (!dip_hw->mdp_wq) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: unable to alloc dip_runner\n", __func__);
+		ret = -ENOMEM;
+		goto destroy_dip_runner_wq;
+	}
+
+	init_waitqueue_head(&dip_hw->flushing_wq);
+	init_waitqueue_head(&dip_hw->flushing_hw_wq);
+
+	return 0;
+
+destroy_dip_runner_wq:
+	destroy_workqueue(dip_hw->mdp_wq);
+
+destroy_dip_composer_wq:
+	destroy_workqueue(dip_hw->composer_wq);
+
+destroy_mdpcb_wq:
+	destroy_workqueue(dip_hw->mdpcb_workqueue);
+
+	return ret;
+}
+
+static int mtk_dip_hw_res_release(struct mtk_dip_dev *dip_dev)
+{
+	flush_workqueue(dip_dev->dip_hw.mdp_wq);
+	destroy_workqueue(dip_dev->dip_hw.mdp_wq);
+	dip_dev->dip_hw.mdp_wq = NULL;
+
+	flush_workqueue(dip_dev->dip_hw.mdpcb_workqueue);
+	destroy_workqueue(dip_dev->dip_hw.mdpcb_workqueue);
+	dip_dev->dip_hw.mdpcb_workqueue = NULL;
+
+	flush_workqueue(dip_dev->dip_hw.composer_wq);
+	destroy_workqueue(dip_dev->dip_hw.composer_wq);
+	dip_dev->dip_hw.composer_wq = NULL;
+
+	atomic_set(&dip_dev->dip_hw.num_composing, 0);
+	atomic_set(&dip_dev->dip_hw.num_running, 0);
+	atomic_set(&dip_dev->dip_hw.dip_enque_cnt, 0);
+
+	return 0;
+}
+
+static bool mtk_dip_pipe_running_job_list_empty(struct mtk_dip_pipe *pipe,
+						int *num)
+{
+	spin_lock(&pipe->job_lock);
+	*num = pipe->num_jobs;
+	spin_unlock(&pipe->job_lock);
+
+	return !(*num);
+}
+
+static int mtk_dip_hw_flush_pipe_jobs(struct mtk_dip_pipe *pipe)
+{
+	int num;
+	int ret = wait_event_freezable_timeout
+		(pipe->dip_dev->dip_hw.flushing_wq,
+		 mtk_dip_pipe_running_job_list_empty(pipe, &num),
+		 msecs_to_jiffies(DIP_FLUSHING_WQ_TIMEOUT));
+
+	if (!ret && num) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s: flushing is aborted, num(%d)\n",
+			__func__, num);
+		return -EINVAL;
+	}
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s: wakeup num(%d)\n", __func__, num);
+	return 0;
+}
+
+static int mtk_dip_hw_connect(struct mtk_dip_dev *dip_dev)
+{
+	int ret;
+	struct img_ipi_param ipi_param;
+
+	pm_runtime_get_sync(&dip_dev->pdev->dev);
+
+	scp_ipi_register(dip_dev->dip_hw.scp_pdev, SCP_IPI_DIP, dip_scp_handler,
+			 dip_dev);
+	memset(&ipi_param, 0, sizeof(ipi_param));
+	ipi_param.usage = IMG_IPI_INIT;
+	ret = scp_ipi_send(dip_dev->dip_hw.scp_pdev, SCP_IPI_DIP, &ipi_param,
+			   sizeof(ipi_param), 200);
+	if (ret) {
+		dev_dbg(&dip_dev->pdev->dev, "%s: send SCP_IPI_DIP_FRAME failed %d\n",
+			__func__, ret);
+		return -EBUSY;
+	}
+
+	pm_runtime_put_autosuspend(&dip_dev->pdev->dev);
+
+	ret = mtk_dip_hw_res_init(&dip_dev->dip_hw);
+	if (ret) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: mtk_dip_hw_res_init failed(%d)\n", __func__, ret);
+
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void mtk_dip_hw_disconnect(struct mtk_dip_dev *dip_dev)
+{
+	int ret;
+
+	ret = mtk_dip_hw_res_release(dip_dev);
+	if (ret)
+		dev_err(&dip_dev->pdev->dev,
+			"%s: mtk_dip_hw_res_release failed ret(%d)\n",
+			__func__, ret);
+}
+
+int mtk_dip_hw_streamon(struct mtk_dip_pipe *pipe)
+{
+	struct mtk_dip_dev *dip_dev = pipe->dip_dev;
+	int count, ret;
+
+	mutex_lock(&dip_dev->dip_hw.hw_op_lock);
+	count = atomic_read(&dip_dev->dip_hw.dip_stream_cnt);
+	if (!count) {
+		ret = mtk_dip_hw_connect(pipe->dip_dev);
+		if (ret) {
+			dev_err(&pipe->dip_dev->pdev->dev,
+				"%s:%s: pipe(%d) connect to dip_hw failed\n",
+				__func__, pipe->desc->name, pipe->desc->id);
+
+			mutex_unlock(&dip_dev->dip_hw.hw_op_lock);
+
+			return ret;
+		}
+
+		count = atomic_inc_return(&dip_dev->dip_hw.dip_stream_cnt);
+	}
+	mutex_unlock(&dip_dev->dip_hw.hw_op_lock);
+
+	mutex_lock(&pipe->lock);
+	pipe->streaming = 1;
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s: started stream, id(%d), stream cnt(%d)\n",
+		__func__, pipe->desc->name, pipe->desc->id, count);
+	mtk_dip_pipe_try_enqueue(pipe);
+	mutex_unlock(&pipe->lock);
+
+	return 0;
+}
+
+int mtk_dip_hw_streamoff(struct mtk_dip_pipe *pipe)
+{
+	struct mtk_dip_dev *dip_dev = pipe->dip_dev;
+	struct mtk_dip_pipe_job_info *job_info;
+	struct mtk_dip_pipe_job_info *tmp_job_info;
+	s32 count;
+	int ret;
+
+	mutex_lock(&pipe->lock);
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s:%s: streamoff, removing all running jobs\n",
+		__func__, pipe->desc->name);
+
+	spin_lock(&pipe->job_lock);
+	list_for_each_entry_safe(job_info, tmp_job_info,
+				 &pipe->pipe_job_running_list, list) {
+		struct mtk_dip_request *req =
+			mtk_dip_pipe_job_info_to_req(job_info);
+		int i;
+
+		for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
+			struct mtk_dip_dev_buffer *dev_buf =
+				job_info->buf_map[i];
+			struct mtk_dip_video_device *node;
+
+			if (!dev_buf)
+				continue;
+
+			node = mtk_dip_vbq_to_node
+				(dev_buf->vbb.vb2_buf.vb2_queue);
+			vb2_buffer_done(&dev_buf->vbb.vb2_buf,
+					VB2_BUF_STATE_ERROR);
+			dev_dbg(&dip_dev->pdev->dev,
+				"%s:%s: return buf, idx(%d), state(%d)\n",
+				pipe->desc->name, node->desc->name,
+				dev_buf->vbb.vb2_buf.index,
+				VB2_BUF_STATE_ERROR);
+		}
+
+		pipe->num_jobs--;
+		list_del(&job_info->list);
+
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: not run job, id(%d), no(%d), state(%d), job cnt(%d)\n",
+			__func__, pipe->desc->name, job_info->id,
+			req->img_fparam.frameparam.frame_no,
+			VB2_BUF_STATE_ERROR, pipe->num_jobs);
+	}
+	spin_unlock(&pipe->job_lock);
+
+	ret = mtk_dip_hw_flush_pipe_jobs(pipe);
+	if (WARN_ON(ret != 0)) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s:%s: mtk_dip_hw_flush_pipe_jobs, ret(%d)\n",
+			__func__, pipe->desc->name, ret);
+	}
+
+	pipe->streaming = 0;
+	mutex_unlock(&pipe->lock);
+
+	mutex_lock(&dip_dev->dip_hw.hw_op_lock);
+	count = atomic_read(&dip_dev->dip_hw.dip_stream_cnt);
+	if (count > 0 && atomic_dec_and_test(&dip_dev->dip_hw.dip_stream_cnt)) {
+		mtk_dip_hw_disconnect(dip_dev);
+
+		dev_dbg(&dip_dev->pdev->dev, "%s: dip_hw disconnected, stream cnt(%d)\n",
+			__func__, atomic_read(&dip_dev->dip_hw.dip_stream_cnt));
+	}
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s: stopped stream id(%d), stream cnt(%d)\n",
+		__func__, pipe->desc->name, pipe->desc->id, count);
+
+	mutex_unlock(&dip_dev->dip_hw.hw_op_lock);
+
+	return 0;
+}
+
+void mtk_dip_hw_enqueue(struct mtk_dip_hw *dip_hw,
+			struct mtk_dip_request *req)
+{
+	struct img_ipi_frameparam *frameparams = &req->img_fparam.frameparam;
+	struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
+	int ret;
+	struct mtk_dip_dev_buffer **map = req->job_info.buf_map;
+
+	/*
+	 * Workaround to pass v4l2 compliance test when it pass only one buffer
+	 * to DIP. The check is already done in request_validate().
+	 */
+	if (!map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
+	    (!map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
+	     !map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE])){
+		dev_dbg(&dip_dev->pdev->dev,
+			"won't trigger hw job: raw(%p), mdp0(%p), mdp1(%p)\n",
+			map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
+			map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
+			map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]);
+
+		mtk_dip_pipe_job_finish(req->dip_pipe, req->job_info.id,
+					VB2_BUF_STATE_DONE);
+		return;
+	}
+
+	mtk_dip_pipe_ipi_params_config(req);
+	frameparams->state = FRAME_STATE_INIT;
+	frameparams->frame_no = atomic_inc_return(&dip_hw->dip_enque_cnt);
+
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s: hw job id(%d), frame_no(%d) into worklist\n",
+		__func__, frameparams->index, frameparams->frame_no);
+
+	INIT_WORK(&req->fw_work, dip_submit_worker);
+	pm_runtime_get_sync(&dip_dev->pdev->dev);
+	ret = queue_work(dip_hw->composer_wq, &req->fw_work);
+	if (!ret)
+		dev_dbg(&dip_dev->pdev->dev,
+			"frame_no(%d) queue_work failed, already on a queue\n",
+			frameparams->frame_no, ret);
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
new file mode 100644
index 000000000000..7b454952566f
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
@@ -0,0 +1,1786 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_data/mtk_scp.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-event.h>
+#include "mtk_dip-dev.h"
+#include "mtk_dip-hw.h"
+#include "mtk-mdp3-regs.h"
+
+static int mtk_dip_subdev_open(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_fh *fh)
+{
+	struct mtk_dip_pipe *pipe = mtk_dip_subdev_to_pipe(sd);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev, "%s:%s: pipe(%d) open\n",
+		__func__, pipe->desc->name, pipe->desc->id);
+
+	pipe->fh = fh;
+
+	return 0;
+}
+
+static int mtk_dip_subdev_close(struct v4l2_subdev *sd,
+				struct v4l2_subdev_fh *fh)
+{
+	struct mtk_dip_pipe *pipe = mtk_dip_subdev_to_pipe(sd);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev, "%s:%s: pipe(%d) close\n",
+		__func__, pipe->desc->name, pipe->desc->id);
+
+	return 0;
+}
+
+static int mtk_dip_subdev_s_stream(struct v4l2_subdev *sd,
+				   int enable)
+{
+	struct mtk_dip_pipe *pipe = mtk_dip_subdev_to_pipe(sd);
+	int ret;
+
+	if (enable) {
+		ret = mtk_dip_hw_streamon(pipe);
+		if (ret) {
+			dev_err(&pipe->dip_dev->pdev->dev,
+				"%s:%s: pipe(%d) streamon failed\n",
+				__func__, pipe->desc->name, pipe->desc->id);
+		}
+
+		return ret;
+	}
+
+	ret = mtk_dip_hw_streamoff(pipe);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s: pipe(%d) streamon off with errors\n",
+			__func__, pipe->desc->name, pipe->desc->id);
+	}
+
+	return ret;
+}
+
+static int mtk_dip_link_setup(struct media_entity *entity,
+			      const struct media_pad *local,
+			      const struct media_pad *remote,
+			      u32 flags)
+{
+	struct mtk_dip_pipe *pipe =
+		container_of(entity, struct mtk_dip_pipe, subdev.entity);
+	u32 pad = local->index;
+	int count;
+
+	WARN_ON(entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV);
+	WARN_ON(pad >= pipe->num_nodes);
+
+	mutex_lock(&pipe->lock);
+	if (!vb2_start_streaming_called(&pipe->nodes[pad].dev_q.vbq)) {
+		int enable = flags & MEDIA_LNK_FL_ENABLED;
+		int node_enabled =
+			pipe->nodes[pad].flags & MEDIA_LNK_FL_ENABLED;
+
+		if (enable && !node_enabled)
+			atomic_inc_return(&pipe->cnt_nodes_not_streaming);
+
+		if (!enable && node_enabled)
+			atomic_dec_return(&pipe->cnt_nodes_not_streaming);
+	}
+	pipe->nodes[pad].flags &= ~(MEDIA_LNK_FL_ENABLED);
+	pipe->nodes[pad].flags |= MEDIA_LNK_FL_ENABLED & flags;
+	count = atomic_read(&pipe->cnt_nodes_not_streaming);
+	mutex_unlock(&pipe->lock);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s: link setup, flags(0x%x), (%s)%d -->(%s)%d, cnt_nodes_ns(%d)\n",
+		pipe->desc->name, flags, local->entity->name, local->index,
+		remote->entity->name, remote->index, count);
+
+	return 0;
+}
+
+static int mtk_dip_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
+	struct device *dev = &pipe->dip_dev->pdev->dev;
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+	int i;
+
+	if (vb->vb2_queue->type == V4L2_BUF_TYPE_META_CAPTURE ||
+	    vb->vb2_queue->type == V4L2_BUF_TYPE_META_OUTPUT){
+		if (vb->planes[0].length < fmt->fmt.meta.buffersize) {
+			dev_dbg(dev,
+				"%s:%s:%s: size error(user:%d, required:%d)\n",
+				__func__, pipe->desc->name, node->desc->name,
+				vb->planes[0].length, fmt->fmt.meta.buffersize);
+			return -EINVAL;
+		} else {
+			return 0;
+		}
+	}
+
+	for (i = 0; i < vb->num_planes; i++) {
+		size = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
+		if (vb->planes[i].length < size) {
+			dev_dbg(dev,
+				"%s:%s:%s: size error(user:%d, max:%d)\n",
+				__func__, pipe->desc->name, node->desc->name,
+				vb->planes[i].length, size);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_dip_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	if (v4l2_buf->field == V4L2_FIELD_ANY)
+		v4l2_buf->field = V4L2_FIELD_NONE;
+
+	if (v4l2_buf->field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_dip_vb2_queue_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *b = to_vb2_v4l2_buffer(vb);
+	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
+	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
+	int i;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		if (node->desc->smem_alloc) {
+			void *cpu_addr;
+			phys_addr_t buf_paddr;
+
+			dev_buf->scp_daddr[i] =
+				vb2_dma_contig_plane_dma_addr(vb, i);
+			cpu_addr = vb2_plane_vaddr(vb, i);
+			if (!cpu_addr) {
+				dev_err(&pipe->dip_dev->pdev->dev,
+					"%s:%s: vb2_plane_vaddr NULL: s_daddr(%pad)\n",
+					pipe->desc->name, node->desc->name,
+					&dev_buf->scp_daddr[i]);
+				return -EINVAL;
+			}
+
+			/*
+			 * We got the incorrect physical address mapped when
+			 * using dma_map_single() so I used dma_map_page_attrs()
+			 * directly to workaround here. Please see the detail in
+			 * mtk_dip-sys.c
+			 */
+			buf_paddr = dev_buf->scp_daddr[i];
+			dev_buf->isp_daddr[i] =
+				dma_map_page_attrs(&pipe->dip_dev->pdev->dev,
+						   phys_to_page(buf_paddr),
+						   0, vb->planes[i].length,
+						   DMA_BIDIRECTIONAL,
+						   DMA_ATTR_SKIP_CPU_SYNC);
+			if (dma_mapping_error(&pipe->dip_dev->pdev->dev,
+					      dev_buf->isp_daddr[i])) {
+				dev_err(&pipe->dip_dev->pdev->dev,
+					"%s:%s: failed to map buffer: s_daddr(%pad)\n",
+					pipe->desc->name, node->desc->name,
+					&dev_buf->scp_daddr[i]);
+				return -EINVAL;
+			}
+		} else {
+			dev_buf->scp_daddr[i] = 0;
+			dev_buf->isp_daddr[i] =
+				vb2_dma_contig_plane_dma_addr(vb, i);
+		}
+
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: buf type(%d), idx(%d), mem(%d), p(%d) i_daddr(%pad), s_daddr(%pad)\n",
+			pipe->desc->name, node->desc->name, b->vb2_buf.type,
+			b->vb2_buf.index, b->vb2_buf.memory, i,
+			&dev_buf->isp_daddr[i], &dev_buf->scp_daddr[i]);
+	}
+
+	return 0;
+}
+
+static void mtk_dip_vb2_queue_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
+	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
+	int i;
+
+	if (!node->desc->smem_alloc)
+		return;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		if (node->desc->smem_alloc)
+			dma_unmap_page_attrs(&pipe->dip_dev->pdev->dev,
+					     dev_buf->isp_daddr[i],
+					     vb->planes[i].length,
+					     DMA_BIDIRECTIONAL,
+					     DMA_ATTR_SKIP_CPU_SYNC);
+	}
+}
+
+static void mtk_dip_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *b = to_vb2_v4l2_buffer(vb);
+	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
+	struct mtk_dip_request *req = (struct mtk_dip_request *)vb->request;
+	struct mtk_dip_video_device *node =
+		mtk_dip_vbq_to_node(vb->vb2_queue);
+	int buf_count;
+
+	dev_buf->fmt = node->vdev_fmt;
+	dev_buf->dev_fmt = node->dev_q.dev_fmt;
+	dev_buf->dma_port = node->desc->dma_port;
+	dev_buf->rotation = node->dev_q.rotation;
+
+	dev_dbg(&req->dip_pipe->dip_dev->pdev->dev,
+		"%s:%s: buf type(%d), idx(%d), mem(%d), i_daddr(%pad), s_daddr(%pad)\n",
+		req->dip_pipe->desc->name, node->desc->name, b->vb2_buf.type,
+		b->vb2_buf.index, b->vb2_buf.memory, &dev_buf->isp_daddr,
+		&dev_buf->scp_daddr);
+
+	spin_lock(&node->buf_list_lock);
+	list_add_tail(&dev_buf->list, &node->buf_list);
+	spin_unlock(&node->buf_list_lock);
+
+	buf_count = atomic_dec_return(&req->buf_count);
+	if (!buf_count) {
+		mutex_lock(&req->dip_pipe->lock);
+		mtk_dip_pipe_try_enqueue(req->dip_pipe);
+		mutex_unlock(&req->dip_pipe->lock);
+	}
+
+	dev_dbg(&req->dip_pipe->dip_dev->pdev->dev,
+		"%s:%s:%s:%s:buf_count(%d)\n",
+		__func__, req->dip_pipe->desc->name, node->desc->name,
+		req->req.debug_str, buf_count);
+}
+
+static int mtk_dip_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vq);
+	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+	int i;
+
+	vq->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
+
+	if (!*num_planes) {
+		*num_planes = 1;
+		sizes[0] = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+	}
+
+	if (node->desc->id == MTK_DIP_VIDEO_NODE_ID_TUNING_OUT) {
+		int max_meta_bufs_per_pipe;
+
+		size = fmt->fmt.meta.buffersize;
+		max_meta_bufs_per_pipe =
+			MTK_DIP_DEV_META_BUF_POOL_MAX_SIZE /
+			round_up(size, PAGE_SIZE) / MTK_DIP_PIPE_ID_TOTAL_NUM;
+		*num_buffers = clamp_val(*num_buffers, 1,
+					 max_meta_bufs_per_pipe);
+		sizes[0] = size;
+
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s:%s: n_p(%d), n_b(%d), s[%d](%u)\n",
+			__func__, pipe->desc->name, node->desc->name,
+			*num_planes, *num_buffers, 0, sizes[0]);
+
+	} else {
+		for (i = 0; i < *num_planes; i++) {
+			if (sizes[i] < fmt->fmt.pix_mp.plane_fmt[i].sizeimage) {
+				dev_dbg(&pipe->dip_dev->pdev->dev,
+					"%s:%s:%s: invalid buf: %u < %u\n",
+					__func__, pipe->desc->name,
+					node->desc->name, sizes[0], size);
+					return -EINVAL;
+			}
+			sizes[i] = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
+			dev_dbg(&pipe->dip_dev->pdev->dev,
+				"%s:%s:%s: n_p(%d), n_b(%d), s[%d](%u)\n",
+				__func__, pipe->desc->name, node->desc->name,
+				*num_planes, *num_buffers, i, sizes[i]);
+		}
+	}
+
+	return 0;
+}
+
+static void mtk_dip_return_all_buffers(struct mtk_dip_pipe *pipe,
+				       struct mtk_dip_video_device *node,
+				       enum vb2_buffer_state state)
+{
+	struct mtk_dip_dev_buffer *b, *b0;
+
+	spin_lock(&node->buf_list_lock);
+	list_for_each_entry_safe(b, b0, &node->buf_list, list) {
+		list_del(&b->list);
+		if (b->vbb.vb2_buf.state == VB2_BUF_STATE_ACTIVE)
+			vb2_buffer_done(&b->vbb.vb2_buf, state);
+	}
+	spin_unlock(&node->buf_list_lock);
+}
+
+static int mtk_dip_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vq);
+	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
+	int cnt_node_ns;
+	int ret;
+
+	if (!(node->flags & MEDIA_LNK_FL_ENABLED)) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s: stream on failed, node is not enabled\n",
+			pipe->desc->name, node->desc->name);
+
+		ret = -ENOLINK;
+		goto fail_return_bufs;
+	}
+
+	mutex_lock(&pipe->lock);
+	cnt_node_ns = atomic_dec_return(&pipe->cnt_nodes_not_streaming);
+	mutex_unlock(&pipe->lock);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s:%s cnt_nodes_not_streaming(%d)\n",
+		__func__, pipe->desc->name, node->desc->name, cnt_node_ns);
+
+	if (cnt_node_ns)
+		return 0;
+
+	ret = media_pipeline_start(&node->vdev.entity, &pipe->pipeline);
+	if (ret < 0) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s: media_pipeline_start failed(%d)\n",
+			pipe->desc->name, node->desc->name, ret);
+
+		goto fail_return_bufs;
+	}
+
+	/* Start streaming of the whole pipeline */
+	ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 1);
+	if (ret < 0) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s: sub dev s_stream(1) failed(%d)\n",
+			pipe->desc->name, node->desc->name, ret);
+
+		goto fail_stop_pipeline;
+	}
+
+	return 0;
+
+fail_stop_pipeline:
+	media_pipeline_stop(&node->vdev.entity);
+
+fail_return_bufs:
+	mtk_dip_return_all_buffers(pipe, node, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mtk_dip_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vq);
+	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
+	int ret;
+	int count;
+	int is_pipe_streamon;
+
+	WARN_ON(!(node->flags & MEDIA_LNK_FL_ENABLED));
+
+	mutex_lock(&pipe->lock);
+	count = atomic_inc_return(&pipe->cnt_nodes_not_streaming);
+	is_pipe_streamon = pipe->streaming;
+	mutex_unlock(&pipe->lock);
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"%s:%s:%s cnt_nodes_not_streaming(%d), is_pipe_streamon(%d)\n",
+		__func__, pipe->desc->name, node->desc->name, count,
+		is_pipe_streamon);
+
+	if (count && is_pipe_streamon) {
+		ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 0);
+		if (ret)
+			dev_err(&pipe->dip_dev->pdev->dev,
+				"%s:%s: sub dev s_stream(0) failed(%d)\n",
+				pipe->desc->name, node->desc->name, ret);
+		media_pipeline_stop(&node->vdev.entity);
+	}
+
+	mtk_dip_return_all_buffers(pipe, node, VB2_BUF_STATE_ERROR);
+}
+
+static int mtk_dip_videoc_querycap(struct file *file, void *fh,
+				   struct v4l2_capability *cap)
+{
+	struct mtk_dip_pipe *pipe = video_drvdata(file);
+
+	strlcpy(cap->driver, pipe->desc->name,
+		sizeof(cap->driver));
+	strlcpy(cap->card, pipe->desc->name,
+		sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", dev_name(pipe->dip_dev->mdev.dev));
+
+	return 0;
+}
+
+static int mtk_dip_videoc_try_fmt(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct mtk_dip_pipe *pipe = video_drvdata(file);
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+	const struct mtk_dip_dev_format *dev_fmt;
+	struct v4l2_format try_fmt;
+
+	memset(&try_fmt, 0, sizeof(try_fmt));
+	try_fmt.type = node->dev_q.vbq.type;
+	dev_fmt = mtk_dip_pipe_find_fmt(pipe, node,
+					f->fmt.pix_mp.pixelformat);
+
+	if (!dev_fmt) {
+		dev_fmt = &node->desc->fmts[node->desc->default_fmt_idx];
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s:%s: dev_fmt(%d) not found, use default(%d)\n",
+			__func__, pipe->desc->name, node->desc->name,
+			f->fmt.pix_mp.pixelformat, dev_fmt->format);
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(node->desc->buf_type)) {
+		try_fmt.fmt.pix_mp.width = clamp_val(f->fmt.pix_mp.width,
+						     MTK_DIP_OUTPUT_MIN_WIDTH,
+						     MTK_DIP_OUTPUT_MAX_WIDTH);
+		try_fmt.fmt.pix_mp.height =
+			clamp_val(f->fmt.pix_mp.height,
+				  MTK_DIP_OUTPUT_MIN_HEIGHT,
+				  MTK_DIP_OUTPUT_MAX_HEIGHT);
+	} else {
+		try_fmt.fmt.pix_mp.width = clamp_val(f->fmt.pix_mp.width,
+						     MTK_DIP_CAPTURE_MIN_WIDTH,
+						     MTK_DIP_CAPTURE_MAX_WIDTH);
+		try_fmt.fmt.pix_mp.height =
+			clamp_val(f->fmt.pix_mp.height,
+				  MTK_DIP_CAPTURE_MIN_HEIGHT,
+				  MTK_DIP_CAPTURE_MAX_HEIGHT);
+	}
+
+	node->dev_q.dev_fmt = dev_fmt;
+	try_fmt.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	mtk_dip_pipe_set_img_fmt(pipe, node, &try_fmt.fmt.pix_mp, dev_fmt);
+
+	*f = try_fmt;
+
+	return 0;
+}
+
+static int mtk_dip_videoc_g_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+
+	*f = node->vdev_fmt;
+
+	return 0;
+}
+
+static int mtk_dip_videoc_s_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+	struct mtk_dip_pipe *pipe = video_drvdata(file);
+	int ret;
+
+	if (pipe->streaming)
+		return -EBUSY;
+
+	ret = mtk_dip_videoc_try_fmt(file, fh, f);
+	if (!ret)
+		node->vdev_fmt = *f;
+
+	return ret;
+}
+
+static int mtk_dip_videoc_enum_framesizes(struct file *file, void *priv,
+					  struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_dip_pipe *pipe = video_drvdata(file);
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+	const struct mtk_dip_dev_format *dev_fmt;
+
+	dev_fmt = mtk_dip_pipe_find_fmt(pipe, node, sizes->pixel_format);
+
+	if (!dev_fmt || sizes->index)
+		return -EINVAL;
+
+	sizes->type = node->desc->frmsizeenum->type;
+	sizes->stepwise.max_width =
+		node->desc->frmsizeenum->stepwise.max_width;
+	sizes->stepwise.min_width =
+		node->desc->frmsizeenum->stepwise.min_width;
+	sizes->stepwise.max_height =
+		node->desc->frmsizeenum->stepwise.max_height;
+	sizes->stepwise.min_height =
+		node->desc->frmsizeenum->stepwise.min_height;
+	sizes->stepwise.step_height =
+		node->desc->frmsizeenum->stepwise.step_height;
+	sizes->stepwise.step_width =
+		node->desc->frmsizeenum->stepwise.step_width;
+
+	return 0;
+}
+
+static int mtk_dip_videoc_enum_fmt(struct file *file, void *fh,
+				   struct v4l2_fmtdesc *f)
+{
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+
+	if (f->index >= node->desc->num_fmts)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc->description,
+		sizeof(f->description));
+	f->pixelformat = node->desc->fmts[f->index].format;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_dip_meta_enum_format(struct file *file, void *fh,
+				    struct v4l2_fmtdesc *f)
+{
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+
+	if (f->index > 0)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc->description,
+		sizeof(f->description));
+
+	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_dip_videoc_g_meta_fmt(struct file *file, void *fh,
+				     struct v4l2_format *f)
+{
+	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
+	*f = node->vdev_fmt;
+
+	return 0;
+}
+
+static int handle_buf_rotate_config(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_dip_video_device *node =
+		container_of(ctrl->handler, struct mtk_dip_video_device,
+			     ctrl_handler);
+
+	if (ctrl->val != 0 && ctrl->val != 90 &&
+	    ctrl->val != 180 && ctrl->val != 270) {
+		pr_err("%s: Invalid buffer rotation %d", node->desc->name,
+		       ctrl->val);
+		return -EINVAL;
+	}
+
+	node->dev_q.rotation = ctrl->val;
+
+	return 0;
+}
+
+static int mtk_dip_video_device_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ROTATE:
+		ret = handle_buf_rotate_config(ctrl);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+/******************** function pointers ********************/
+
+static const struct v4l2_subdev_internal_ops mtk_dip_subdev_internal_ops = {
+	.open = mtk_dip_subdev_open,
+	.close = mtk_dip_subdev_close,
+};
+
+static const struct v4l2_subdev_video_ops mtk_dip_subdev_video_ops = {
+	.s_stream = mtk_dip_subdev_s_stream,
+};
+
+static const struct v4l2_subdev_ops mtk_dip_subdev_ops = {
+	.video = &mtk_dip_subdev_video_ops,
+};
+
+static const struct media_entity_operations mtk_dip_media_ops = {
+	.link_setup = mtk_dip_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static struct media_request *mtk_dip_request_alloc(struct media_device *mdev)
+{
+	return kzalloc(sizeof(struct mtk_dip_request), GFP_KERNEL);
+}
+
+static void mtk_dip_request_free(struct media_request *req)
+{
+	kfree(req);
+}
+
+static int mtk_dip_vb2_request_validate(struct media_request *req)
+{
+	struct media_request_object *obj;
+	struct mtk_dip_dev *dip_dev = mtk_dip_mdev_to_dev(req->mdev);
+	struct mtk_dip_request *dip_req = (struct mtk_dip_request *)req;
+	struct mtk_dip_pipe *pipe = NULL;
+	struct mtk_dip_pipe *pipe_prev = NULL;
+	struct mtk_dip_dev_buffer **map = dip_req->job_info.buf_map;
+	int buf_count = 0;
+
+	memset(map, 0, sizeof(dip_req->job_info.buf_map));
+
+	list_for_each_entry(obj, &req->objects, list) {
+		struct vb2_buffer *vb;
+		struct mtk_dip_dev_buffer *dev_buf;
+		struct mtk_dip_video_device *node;
+
+		if (!vb2_request_object_is_buffer(obj))
+			continue;
+
+		vb = container_of(obj, struct vb2_buffer, req_obj);
+		node = mtk_dip_vbq_to_node(vb->vb2_queue);
+		pipe = vb2_get_drv_priv(vb->vb2_queue);
+		if (pipe_prev && pipe != pipe_prev) {
+			dev_warn(&dip_dev->pdev->dev,
+				 "%s:%s:%s:found buf of different pipes(%p,%p)\n",
+				__func__, node->desc->name,
+				req->debug_str, pipe, pipe_prev);
+			return -EINVAL;
+		}
+
+		pipe_prev = pipe;
+		dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
+		dip_req->job_info.buf_map[node->desc->id] = dev_buf;
+		buf_count++;
+
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: added buf(%p) to pipe-job(%p), buf_count(%d)\n",
+			pipe->desc->name, node->desc->name, dev_buf,
+			dip_req->job_info, buf_count);
+	}
+
+	if (!pipe) {
+		dev_warn(&dip_dev->pdev->dev,
+			 "%s: no buffer in the request(%p)\n",
+			 req->debug_str, req);
+
+		return vb2_request_validate(req);
+	}
+
+	/*
+	 * Workaround to pass V4L2 comliance test since it can't know
+	 * which buffer is required and may enqueue only 1 buffer.
+	 * It seems that we should return an error here and let the
+	 * user to enqueue required buffer instead of showing a debug
+	 * message only.
+	 */
+	if (!map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
+	    (!map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
+	     !map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]))
+		dev_dbg(&dip_dev->pdev->dev,
+			"won't trigger hw job: raw(%p), mdp0(%p), mdp1(%p)\n",
+			map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
+			map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
+			map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]);
+
+	atomic_set(&dip_req->buf_count, buf_count);
+	dip_req->job_info.id = mtk_dip_pipe_next_job_id(pipe);
+	dip_req->dip_pipe = pipe;
+	mtk_dip_pipe_debug_job(pipe, &dip_req->job_info);
+
+	spin_lock(&pipe->job_lock);
+	list_add_tail(&dip_req->job_info.list, &pipe->pipe_job_pending_list);
+	pipe->num_pending_jobs++;
+	dev_dbg(&dip_dev->pdev->dev,
+		"%s:%s: current num of pending jobs(%d)\n",
+		__func__, pipe->desc->name, pipe->num_pending_jobs);
+	spin_unlock(&pipe->job_lock);
+
+	return vb2_request_validate(req);
+}
+
+static const struct media_device_ops mtk_dip_media_req_ops = {
+	.req_validate = mtk_dip_vb2_request_validate,
+	.req_queue = vb2_request_queue,
+	.req_alloc = mtk_dip_request_alloc,
+	.req_free = mtk_dip_request_free,
+};
+
+static const struct v4l2_ctrl_ops mtk_dip_video_device_ctrl_ops = {
+	.s_ctrl = mtk_dip_video_device_s_ctrl,
+};
+
+static const struct vb2_ops mtk_dip_vb2_ops = {
+	.buf_queue = mtk_dip_vb2_buf_queue,
+	.queue_setup = mtk_dip_vb2_queue_setup,
+	.buf_init = mtk_dip_vb2_queue_buf_init,
+	.buf_prepare  = mtk_dip_vb2_buf_prepare,
+	.buf_out_validate = mtk_dip_vb2_buf_out_validate,
+	.buf_cleanup = mtk_dip_vb2_queue_buf_cleanup,
+	.start_streaming = mtk_dip_vb2_start_streaming,
+	.stop_streaming = mtk_dip_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static const struct v4l2_file_operations mtk_dip_v4l2_fops = {
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
+int mtk_dip_dev_media_register(struct device *dev,
+			       struct media_device *media_dev,
+			       const char *model)
+{
+	int ret;
+
+	media_dev->dev = dev;
+	strlcpy(media_dev->model, model, sizeof(media_dev->model));
+	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
+		 "platform:%s", dev_name(dev));
+	media_dev->hw_revision = 0;
+	media_dev->ops = &mtk_dip_media_req_ops;
+	media_device_init(media_dev);
+
+	ret = media_device_register(media_dev);
+	if (ret) {
+		dev_err(dev, "failed to register media device (%d)\n", ret);
+		media_device_unregister(media_dev);
+		media_device_cleanup(media_dev);
+	}
+
+	dev_dbg(dev, "Registered media device: %s, %p", media_dev->model,
+		media_dev);
+
+	return ret;
+}
+
+int mtk_dip_dev_v4l2_register(struct device *dev,
+			      struct media_device *media_dev,
+			      struct v4l2_device *v4l2_dev)
+{
+	int ret;
+
+	v4l2_dev->mdev = media_dev;
+	v4l2_dev->ctrl_handler = NULL;
+
+	ret = v4l2_device_register(dev, v4l2_dev);
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 device (%d)\n", ret);
+		v4l2_device_unregister(v4l2_dev);
+	}
+
+	dev_dbg(dev, "Registered v4l2 device: %p", v4l2_dev);
+
+	return ret;
+}
+
+static int mtk_dip_video_device_v4l2_register(struct mtk_dip_pipe *pipe,
+					      struct mtk_dip_video_device *node)
+{
+	struct vb2_queue *vbq = &node->dev_q.vbq;
+	struct video_device *vdev = &node->vdev;
+	struct media_link *link;
+	int ret;
+
+	/* Initialize miscellaneous variables */
+	mutex_init(&node->dev_q.lock);
+
+	/* Initialize formats to default values */
+	vdev->device_caps = node->desc->cap;
+	vdev->ioctl_ops = node->desc->ops;
+	node->vdev_fmt.type = node->desc->buf_type;
+	mtk_dip_pipe_load_default_fmt(pipe, node, &node->vdev_fmt);
+
+	/* Initialize media entities */
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"failed initialize media entity (%d)\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	node->vdev_pad.flags = V4L2_TYPE_IS_OUTPUT(node->desc->buf_type) ?
+		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+
+	/* Initialize vbq */
+	vbq->type = node->vdev_fmt.type;
+	vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vbq->ops = &mtk_dip_vb2_ops;
+	vbq->mem_ops = &vb2_dma_contig_memops;
+	vbq->supports_requests = true;
+	vbq->buf_struct_size = sizeof(struct mtk_dip_dev_buffer);
+	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vbq->min_buffers_needed = 0;
+	vbq->drv_priv = pipe;
+	vbq->lock = &node->dev_q.lock;
+
+	ret = vb2_queue_init(vbq);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s:%s:%s: failed to init vb2 queue(%d)\n",
+			__func__, pipe->desc->name, node->desc->name,
+			ret);
+		goto err_media_entity_cleanup;
+	}
+
+	/* Initialize vdev */
+	snprintf(vdev->name, sizeof(vdev->name), "%s %s", pipe->desc->name,
+		 node->desc->name);
+	vdev->entity.name = vdev->name;
+	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
+	vdev->entity.ops = NULL;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mtk_dip_v4l2_fops;
+	vdev->lock = &node->dev_q.lock;
+	vdev->ctrl_handler = &node->ctrl_handler;
+	vdev->v4l2_dev = &pipe->dip_dev->v4l2_dev;
+	vdev->queue = &node->dev_q.vbq;
+	vdev->vfl_dir = V4L2_TYPE_IS_OUTPUT(node->desc->buf_type) ?
+		VFL_DIR_TX : VFL_DIR_RX;
+
+	if (node->desc->smem_alloc) {
+		vdev->queue->dev = &pipe->dip_dev->dip_hw.scp_pdev->dev;
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: select smem_vb2_alloc_ctx(%p)\n",
+			pipe->desc->name, node->desc->name,
+			vdev->queue->dev);
+	} else {
+		vdev->queue->dev = &pipe->dip_dev->pdev->dev;
+		dev_dbg(&pipe->dip_dev->pdev->dev,
+			"%s:%s: select default_vb2_alloc_ctx(%p)\n",
+			pipe->desc->name, node->desc->name,
+			&pipe->dip_dev->pdev->dev);
+	}
+
+	video_set_drvdata(vdev, pipe);
+
+	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"failed to register video device (%d)\n", ret);
+		goto err_vb2_queue_release;
+	}
+	dev_dbg(&pipe->dip_dev->pdev->dev, "registered vdev: %s\n",
+		vdev->name);
+
+	/* Create link between video node and the subdev pad */
+	if (V4L2_TYPE_IS_OUTPUT(node->desc->buf_type))
+		ret = media_create_pad_link(&vdev->entity, 0,
+					    &pipe->subdev.entity,
+					    node->desc->id, node->flags);
+	else
+		ret = media_create_pad_link(&pipe->subdev.entity,
+					    node->desc->id, &vdev->entity,
+					    0, node->flags);
+	if (ret)
+		goto err_video_unregister_device;
+
+	vdev->intf_devnode = media_devnode_create(&pipe->dip_dev->mdev,
+						  MEDIA_INTF_T_V4L_VIDEO, 0,
+						  VIDEO_MAJOR, vdev->minor);
+	if (!vdev->intf_devnode) {
+		ret = -ENOMEM;
+		goto err_rm_links;
+	}
+
+	link = media_create_intf_link(&vdev->entity,
+				      &vdev->intf_devnode->intf,
+				      node->flags);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_rm_devnode;
+	}
+
+	return 0;
+
+err_rm_devnode:
+	media_devnode_remove(vdev->intf_devnode);
+
+err_rm_links:
+	media_entity_remove_links(&vdev->entity);
+
+err_video_unregister_device:
+	video_unregister_device(vdev);
+
+err_vb2_queue_release:
+	vb2_queue_release(&node->dev_q.vbq);
+
+err_media_entity_cleanup:
+	media_entity_cleanup(&node->vdev.entity);
+
+err_mutex_destroy:
+	mutex_destroy(&node->dev_q.lock);
+
+	return ret;
+}
+
+static int mtk_dip_pipe_v4l2_ctrl_init(struct mtk_dip_pipe *dip_pipe)
+{
+	struct mtk_dip_video_device *node;
+	int i;
+
+	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++)
+		v4l2_ctrl_handler_init(&dip_pipe->nodes[i].ctrl_handler,
+				       V4L2_CID_MTK_DIP_MAX);
+
+	/* Only MDP 0 support rotate in MT8183 */
+	node = &dip_pipe->nodes[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE];
+	if (v4l2_ctrl_new_std(&node->ctrl_handler,
+			      &mtk_dip_video_device_ctrl_ops,
+			      V4L2_CID_ROTATE, 0, 270, 90, 0) == NULL) {
+		dev_err(&dip_pipe->dip_dev->pdev->dev,
+			"%s create rotate ctrl failed:(%d)",
+			node->desc->name, node->ctrl_handler.error);
+
+		return -EPROBE_DEFER;
+	}
+
+	return 0;
+}
+
+static void mtk_dip_pipe_v4l2_ctrl_release(struct mtk_dip_pipe *dip_pipe)
+{
+	int i;
+
+	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++)
+		v4l2_ctrl_handler_free(&dip_pipe->nodes[i].ctrl_handler);
+}
+
+int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *pipe,
+			       struct media_device *media_dev,
+			       struct v4l2_device *v4l2_dev)
+{
+	int i, ret;
+
+	ret = mtk_dip_pipe_v4l2_ctrl_init(pipe);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"%s: failed(%d) to initialize ctrls\n",
+			pipe->desc->name, ret);
+
+		return ret;
+	}
+
+	pipe->streaming = 0;
+
+	/* Initialize subdev media entity */
+	pipe->subdev_pads = devm_kcalloc(&pipe->dip_dev->pdev->dev,
+					 pipe->num_nodes,
+					 sizeof(*pipe->subdev_pads),
+					 GFP_KERNEL);
+	if (!pipe->subdev_pads) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"failed to alloc pipe->subdev_pads (%d)\n", ret);
+		ret = -ENOMEM;
+		goto err_release_ctrl;
+	}
+	ret = media_entity_pads_init(&pipe->subdev.entity,
+				     pipe->num_nodes,
+				     pipe->subdev_pads);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"failed initialize subdev media entity (%d)\n", ret);
+		goto err_free_subdev_pads;
+	}
+
+	/* Initialize subdev */
+	v4l2_subdev_init(&pipe->subdev, &mtk_dip_subdev_ops);
+
+	pipe->subdev.entity.function =
+		MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	pipe->subdev.entity.ops = &mtk_dip_media_ops;
+	pipe->subdev.flags =
+		V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	pipe->subdev.ctrl_handler = NULL;
+	pipe->subdev.internal_ops = &mtk_dip_subdev_internal_ops;
+
+	for (i = 0; i < pipe->num_nodes; i++)
+		pipe->subdev_pads[i].flags =
+			V4L2_TYPE_IS_OUTPUT(pipe->nodes[i].desc->buf_type) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	snprintf(pipe->subdev.name, sizeof(pipe->subdev.name),
+		 "%s", pipe->desc->name);
+	v4l2_set_subdevdata(&pipe->subdev, pipe);
+
+	ret = v4l2_device_register_subdev(&pipe->dip_dev->v4l2_dev,
+					  &pipe->subdev);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"failed initialize subdev (%d)\n", ret);
+		goto err_media_entity_cleanup;
+	}
+
+	dev_dbg(&pipe->dip_dev->pdev->dev,
+		"register subdev: %s, ctrl_handler %p\n",
+		 pipe->subdev.name, pipe->subdev.ctrl_handler);
+
+	ret = v4l2_device_register_subdev_nodes(&pipe->dip_dev->v4l2_dev);
+	if (ret) {
+		dev_err(&pipe->dip_dev->pdev->dev,
+			"failed to register subdevs (%d)\n", ret);
+		goto err_unregister_subdev;
+	}
+
+	/* Create video nodes and links */
+	for (i = 0; i < pipe->num_nodes; i++) {
+		ret = mtk_dip_video_device_v4l2_register(pipe,
+							 &pipe->nodes[i]);
+		if (ret)
+			goto err_unregister_subdev;
+	}
+
+	return 0;
+
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(&pipe->subdev);
+
+err_media_entity_cleanup:
+	media_entity_cleanup(&pipe->subdev.entity);
+
+err_free_subdev_pads:
+	devm_kfree(&pipe->dip_dev->pdev->dev, pipe->subdev_pads);
+
+err_release_ctrl:
+	mtk_dip_pipe_v4l2_ctrl_release(pipe);
+
+	return ret;
+}
+
+void mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *pipe)
+{
+	unsigned int i;
+
+	for (i = 0; i < pipe->num_nodes; i++) {
+		video_unregister_device(&pipe->nodes[i].vdev);
+		vb2_queue_release(&pipe->nodes[i].dev_q.vbq);
+		media_entity_cleanup(&pipe->nodes[i].vdev.entity);
+		mutex_destroy(&pipe->nodes[i].dev_q.lock);
+	}
+
+	v4l2_device_unregister_subdev(&pipe->subdev);
+	media_entity_cleanup(&pipe->subdev.entity);
+	v4l2_device_unregister(&pipe->dip_dev->v4l2_dev);
+	media_device_unregister(&pipe->dip_dev->mdev);
+	media_device_cleanup(&pipe->dip_dev->mdev);
+	mtk_dip_pipe_v4l2_ctrl_release(pipe);
+}
+
+/********************************************
+ * MTK DIP V4L2 Settings *
+ ********************************************/
+
+static const struct v4l2_ioctl_ops mtk_dip_v4l2_video_out_ioctl_ops = {
+	.vidioc_querycap = mtk_dip_videoc_querycap,
+
+	.vidioc_enum_framesizes = mtk_dip_videoc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap_mplane = mtk_dip_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_dip_videoc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_dip_videoc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_dip_videoc_try_fmt,
+
+	.vidioc_enum_fmt_vid_out_mplane = mtk_dip_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane = mtk_dip_videoc_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane = mtk_dip_videoc_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane = mtk_dip_videoc_try_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops mtk_dip_v4l2_video_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_dip_videoc_querycap,
+
+	.vidioc_enum_framesizes = mtk_dip_videoc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap_mplane = mtk_dip_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_dip_videoc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_dip_videoc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_dip_videoc_try_fmt,
+
+	.vidioc_enum_fmt_vid_out_mplane = mtk_dip_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane = mtk_dip_videoc_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane = mtk_dip_videoc_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane = mtk_dip_videoc_try_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops mtk_dip_v4l2_meta_out_ioctl_ops = {
+	.vidioc_querycap = mtk_dip_videoc_querycap,
+
+	.vidioc_enum_fmt_meta_cap = mtk_dip_meta_enum_format,
+	.vidioc_g_fmt_meta_cap = mtk_dip_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_cap = mtk_dip_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_cap = mtk_dip_videoc_g_meta_fmt,
+
+	.vidioc_enum_fmt_meta_out = mtk_dip_meta_enum_format,
+	.vidioc_g_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
+
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
+static const struct mtk_dip_dev_format fw_param_fmts[] = {
+	{
+		.format = V4L2_META_FMT_MTISP_PARAMS,
+		.buffer_size = 1024 * 128,
+	},
+};
+
+static const struct mtk_dip_dev_format in_fmts[] = {
+	{
+		.format = V4L2_PIX_FMT_MTISP_B10,
+		.mdp_color = MDP_COLOR_BAYER10,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.depth = { 10 },
+		.row_depth = { 10 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_MTISP_F10,
+		.mdp_color = MDP_COLOR_FULLG10,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.depth = { 15 },
+		.row_depth = { 15 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_VYUY,
+		.mdp_color = MDP_COLOR_VYUY,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth	 = { 16 },
+		.row_depth = { 16 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_YUYV,
+		.mdp_color = MDP_COLOR_YUYV,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth	 = { 16 },
+		.row_depth = { 16 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_YVYU,
+		.mdp_color = MDP_COLOR_YVYU,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth	 = { 16 },
+		.row_depth = { 16 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_NV12,
+		.mdp_color = MDP_COLOR_NV12,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth = { 12 },
+		.row_depth = { 8 },
+		.num_planes = 1,
+	},
+	{
+		.format	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+	},
+	{
+		.format	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+	},
+	{
+		.format	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+	},
+};
+
+static const struct mtk_dip_dev_format out_fmts[] = {
+	{
+		.format = V4L2_PIX_FMT_VYUY,
+		.mdp_color = MDP_COLOR_VYUY,
+		.colorspace = MDP_YCBCR_PROFILE_BT601,
+		.depth = { 16 },
+		.row_depth = { 16 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_YUYV,
+		.mdp_color = MDP_COLOR_YUYV,
+		.colorspace = MDP_YCBCR_PROFILE_BT601,
+		.depth = { 16 },
+		.row_depth = { 16 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_YVYU,
+		.mdp_color = MDP_COLOR_YVYU,
+		.colorspace = MDP_YCBCR_PROFILE_BT601,
+		.depth = { 16 },
+		.row_depth = { 16 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_YVU420,
+		.mdp_color = MDP_COLOR_YV12,
+		.colorspace = MDP_YCBCR_PROFILE_BT601,
+		.depth = { 12 },
+		.row_depth = { 8 },
+		.num_planes = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_NV12,
+		.mdp_color = MDP_COLOR_NV12,
+		.colorspace = MDP_YCBCR_PROFILE_BT601,
+		.depth = { 12 },
+		.row_depth = { 8 },
+		.num_planes = 1,
+	},
+	{
+		.format	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+	},
+	{
+		.format	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+	},
+	{
+		.format	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.colorspace = V4L2_COLORSPACE_BT2020,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+	}
+};
+
+static const struct v4l2_frmsizeenum in_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_DIP_CAPTURE_MAX_WIDTH,
+	.stepwise.min_width = MTK_DIP_CAPTURE_MIN_WIDTH,
+	.stepwise.max_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
+	.stepwise.min_height = MTK_DIP_CAPTURE_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum out_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_DIP_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_DIP_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_DIP_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct mtk_dip_video_device_desc
+output_queues_setting[MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM] = {
+	{
+		.id = MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
+		.name = "Raw Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.flags = MEDIA_LNK_FL_ENABLED,
+		.fmts = in_fmts,
+		.num_fmts = ARRAY_SIZE(in_fmts),
+		.default_fmt_idx = 0,
+		.default_width = MTK_DIP_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
+		.dma_port = 0,
+		.frmsizeenum = &in_frmsizeenum,
+		.ops = &mtk_dip_v4l2_video_out_ioctl_ops,
+		.description = "Main image source",
+	},
+	{
+		.id = MTK_DIP_VIDEO_NODE_ID_TUNING_OUT,
+		.name = "Tuning",
+		.cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.smem_alloc = 1,
+		.flags = 0,
+		.fmts = fw_param_fmts,
+		.num_fmts = 1,
+		.default_fmt_idx = 0,
+		.dma_port = 0,
+		.frmsizeenum = &in_frmsizeenum,
+		.ops = &mtk_dip_v4l2_meta_out_ioctl_ops,
+		.description = "Tuning data",
+	},
+};
+
+static const struct mtk_dip_video_device_desc
+reprocess_output_queues_setting[MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM] = {
+	{
+		.id = MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
+		.name = "Raw Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.flags = MEDIA_LNK_FL_ENABLED,
+		.fmts = in_fmts,
+		.num_fmts = ARRAY_SIZE(in_fmts),
+		.default_fmt_idx = 5,
+		.default_width = MTK_DIP_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
+		.dma_port = 0,
+		.frmsizeenum = &in_frmsizeenum,
+		.ops = &mtk_dip_v4l2_video_out_ioctl_ops,
+		.description = "Source image to be process",
+
+	},
+	{
+		.id = MTK_DIP_VIDEO_NODE_ID_TUNING_OUT,
+		.name = "Tuning",
+		.cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.smem_alloc = 1,
+		.flags = 0,
+		.fmts = fw_param_fmts,
+		.num_fmts = 1,
+		.default_fmt_idx = 0,
+		.dma_port = 0,
+		.frmsizeenum = &in_frmsizeenum,
+		.ops = &mtk_dip_v4l2_meta_out_ioctl_ops,
+		.description = "Tuning data for image enhancement",
+	},
+};
+
+static const struct mtk_dip_video_device_desc
+capture_queues_setting[MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM] = {
+	{
+		.id = MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
+		.name = "MDP0",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.flags = MEDIA_LNK_FL_DYNAMIC | MEDIA_LNK_FL_ENABLED,
+		.fmts = out_fmts,
+		.num_fmts = ARRAY_SIZE(out_fmts),
+		.default_fmt_idx = 1,
+		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
+		.dma_port = 0,
+		.frmsizeenum = &out_frmsizeenum,
+		.ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
+		.description = "Output quality enhanced image",
+	},
+	{
+		.id = MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE,
+		.name = "MDP1",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.flags = MEDIA_LNK_FL_DYNAMIC | MEDIA_LNK_FL_ENABLED,
+		.fmts = out_fmts,
+		.num_fmts = ARRAY_SIZE(out_fmts),
+		.default_fmt_idx = 1,
+		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
+		.dma_port = 0,
+		.frmsizeenum = &out_frmsizeenum,
+		.ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
+		.description = "Output quality enhanced image",
+
+	},
+};
+
+static const struct mtk_dip_pipe_desc
+pipe_settings[MTK_DIP_PIPE_ID_TOTAL_NUM] = {
+	{
+		.name = MTK_DIP_DEV_DIP_PREVIEW_NAME,
+		.id = MTK_DIP_PIPE_ID_PREVIEW,
+		.master = MTK_DIP_VIDEO_NODE_ID_NO_MASTER,
+		.output_queue_descs = output_queues_setting,
+		.total_output_queues = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM,
+		.capture_queue_descs = capture_queues_setting,
+		.total_capture_queues = MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
+	},
+	{
+		.name = MTK_DIP_DEV_DIP_CAPTURE_NAME,
+		.id = MTK_DIP_PIPE_ID_CAPTURE,
+		.master = MTK_DIP_VIDEO_NODE_ID_NO_MASTER,
+		.output_queue_descs = output_queues_setting,
+		.total_output_queues = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM,
+		.capture_queue_descs = capture_queues_setting,
+		.total_capture_queues = MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
+	},
+	{
+		.name = MTK_DIP_DEV_DIP_REPROCESS_NAME,
+		.id = MTK_DIP_PIPE_ID_REPROCESS,
+		.master = MTK_DIP_VIDEO_NODE_ID_NO_MASTER,
+		.output_queue_descs = reprocess_output_queues_setting,
+		.total_output_queues = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM,
+		.capture_queue_descs = capture_queues_setting,
+		.total_capture_queues = MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
+	},
+};
+
+static int mtk_dip_dev_v4l2_init(struct mtk_dip_dev *dip_dev)
+{
+	struct media_device *media_dev = &dip_dev->mdev;
+	struct v4l2_device *v4l2_dev = &dip_dev->v4l2_dev;
+	int i;
+	int ret;
+
+	ret = mtk_dip_dev_media_register(&dip_dev->pdev->dev,
+					 media_dev,
+					 MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME);
+	if (ret) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: media device register failed(%d)\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = mtk_dip_dev_v4l2_register(&dip_dev->pdev->dev,
+					media_dev,
+					v4l2_dev);
+	if (ret) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: v4l2 device register failed(%d)\n",
+			__func__, ret);
+		goto err_release_media_device;
+	}
+
+	for (i = 0; i < MTK_DIP_PIPE_ID_TOTAL_NUM; i++) {
+		ret = mtk_dip_pipe_init(&dip_dev->dip_pipe[i], dip_dev,
+					&pipe_settings[i], media_dev, v4l2_dev);
+		if (ret) {
+			dev_err(&dip_dev->pdev->dev,
+				"%s: Pipe id(%d) init failed(%d)\n",
+				dip_dev->dip_pipe[i].desc->name,
+				i, ret);
+			goto err_release_pipe;
+		}
+	}
+
+	return 0;
+
+err_release_pipe:
+	for (i = i - 1; i >= 0; i--)
+		mtk_dip_pipe_release(&dip_dev->dip_pipe[i]);
+
+	v4l2_device_unregister(v4l2_dev);
+
+err_release_media_device:
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev)
+{
+	int i;
+
+	for (i = 0; i < MTK_DIP_PIPE_ID_TOTAL_NUM; i++)
+		mtk_dip_pipe_release(&dip_dev->dip_pipe[i]);
+
+	v4l2_device_unregister(&dip_dev->v4l2_dev);
+	media_device_unregister(&dip_dev->mdev);
+	media_device_cleanup(&dip_dev->mdev);
+}
+
+static int mtk_dip_probe(struct platform_device *pdev)
+{
+	struct mtk_dip_dev *dip_dev;
+	struct mtk_dip_hw *dip_hw;
+	struct device_node *node;
+	struct platform_device *larb_pdev;
+	phandle rproc_phandle;
+	int ret;
+
+	dip_dev = devm_kzalloc(&pdev->dev, sizeof(*dip_dev), GFP_KERNEL);
+	if (!dip_dev)
+		return -ENOMEM;
+
+	dip_dev->pdev = pdev;
+	dev_set_drvdata(&pdev->dev, dip_dev);
+	dip_hw = &dip_dev->dip_hw;
+
+	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
+	if (!node) {
+		dev_err(&pdev->dev, "No mediatek,larb found");
+		return -EINVAL;
+	}
+
+	larb_pdev = of_find_device_by_node(node);
+	if (!larb_pdev) {
+		dev_err(&pdev->dev, "No mediatek,larb device found");
+		return -EINVAL;
+	}
+
+	dip_hw->clks[0].id = "larb5";
+	dip_hw->clks[1].id = "dip";
+
+	ret = devm_clk_bulk_get(&pdev->dev, MTK_DIP_CLK_NUM,
+				dip_hw->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get LARB5 and DIP clks:%d\n",
+			ret);
+		return ret;
+	}
+
+	dip_hw->scp_pdev = scp_get_pdev(dip_dev->pdev);
+	if (!dip_hw->scp_pdev) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: failed to get scp device\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(dip_dev->pdev->dev.of_node,
+				 "mediatek,scp",
+				 &rproc_phandle)) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: could not get scp device\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	dip_hw->rproc_handle = rproc_get_by_phandle(rproc_phandle);
+	if (!dip_hw->rproc_handle) {
+		dev_err(&dip_dev->pdev->dev,
+			"%s: could not get DIP's rproc_handle\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	atomic_set(&dip_hw->dip_stream_cnt, 0);
+	atomic_set(&dip_hw->dip_enque_cnt, 0);
+	atomic_set(&dip_hw->num_composing, 0);
+	atomic_set(&dip_hw->num_running, 0);
+	mutex_init(&dip_hw->hw_op_lock);
+	/* Limited by the co-processor side's stack size */
+	sema_init(&dip_hw->sem, DIP_COMPOSING_MAX_NUM);
+
+	ret = mtk_dip_hw_working_buf_pool_init(dip_hw);
+	if (ret) {
+		dev_err(&pdev->dev, "working buffer init failed(%d)\n", ret);
+		return ret;
+	}
+
+	ret = mtk_dip_dev_v4l2_init(dip_dev);
+	if (ret)
+		dev_err(&pdev->dev, "v4l2 init failed(%d)\n", ret);
+
+	pm_runtime_enable(&pdev->dev);
+
+	return ret;
+}
+
+static int mtk_dip_remove(struct platform_device *pdev)
+{
+	struct mtk_dip_dev *dip_dev = dev_get_drvdata(&pdev->dev);
+
+	mtk_dip_hw_working_buf_pool_release(&dip_dev->dip_hw);
+	mtk_dip_dev_v4l2_release(dip_dev);
+	pm_runtime_disable(&pdev->dev);
+	mutex_destroy(&dip_dev->dip_hw.hw_op_lock);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_dip_pm_suspend(struct device *dev)
+{
+	struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(MTK_DIP_CLK_NUM, dip_dev->dip_hw.clks);
+	dev_dbg(dev, "%s: disabled dip clks\n", __func__);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_dip_pm_resume(struct device *dev)
+{
+	struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
+	int ret = clk_bulk_prepare_enable(MTK_DIP_CLK_NUM,
+					  dip_dev->dip_hw.clks);
+	if (ret) {
+		dev_err(dev, "%s: failed to enable dip clks(%d)\n",
+			__func__, ret);
+		return ret;
+	}
+	dev_dbg(dev, "%s: enabled dip clks\n", __func__);
+
+	ret = rproc_boot(dip_dev->dip_hw.rproc_handle);
+	if (ret)
+		dev_err(dev, "%s: FW load failed(rproc:%p):%d\n",
+			__func__, dip_dev->dip_hw.rproc_handle,	ret);
+	else
+		dev_dbg(dev, "%s: FW loaded(rproc:%p)\n",
+			__func__, dip_dev->dip_hw.rproc_handle);
+
+	return ret;
+}
+
+static int mtk_dip_get_scp_job_num(struct mtk_dip_dev *dip_dev)
+{
+	int num;
+
+	mutex_lock(&dip_dev->dip_hw.hw_op_lock);
+	num = atomic_read(&dip_dev->dip_hw.num_composing);
+	mutex_unlock(&dip_dev->dip_hw.hw_op_lock);
+
+	return num;
+}
+
+static int __maybe_unused mtk_dip_suspend(struct device *dev)
+{
+	struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
+	int ret, num;
+
+	if (pm_runtime_suspended(dev)) {
+		dev_dbg(dev, "%s: pm_runtime_suspended is true, no action\n",
+			__func__);
+		return 0;
+	}
+
+	ret = wait_event_timeout(dip_dev->dip_hw.flushing_hw_wq,
+				 !(num = mtk_dip_get_scp_job_num(dip_dev)),
+				 msecs_to_jiffies(200));
+	if (!ret && num) {
+		dev_err(dev, "%s: flushing SCP job timeout, num(%d)\n",
+			__func__, num);
+
+		return -EBUSY;
+	}
+
+	return mtk_dip_pm_suspend(dev);
+}
+
+static int __maybe_unused mtk_dip_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev)) {
+		dev_dbg(dev, "%s: pm_runtime_suspended is true, no action\n",
+			__func__);
+		return 0;
+	}
+
+	return mtk_dip_pm_resume(dev);
+}
+
+static const struct dev_pm_ops mtk_dip_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_dip_suspend, mtk_dip_resume)
+	SET_RUNTIME_PM_OPS(mtk_dip_suspend, mtk_dip_resume, NULL)
+};
+
+static const struct of_device_id mtk_dip_of_match[] = {
+	{ .compatible = "mediatek,mt8183-dip", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_dip_of_match);
+
+static struct platform_driver mtk_dip_driver = {
+	.probe   = mtk_dip_probe,
+	.remove  = mtk_dip_remove,
+	.driver  = {
+		.name = "camera-dip",
+		.pm = &mtk_dip_pm_ops,
+		.of_match_table = of_match_ptr(mtk_dip_of_match),
+	}
+};
+
+module_platform_driver(mtk_dip_driver);
+
+MODULE_AUTHOR("Frederic Chen <frederic.chen@mediatek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek DIP driver");
+
-- 
2.18.0

