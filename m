Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDCD342414
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhCSSHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:07:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230304AbhCSSHD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:07:03 -0400
IronPort-SDR: L+tcqYdtRlJz/RkfD63notuOlfN/S9PvWJHRMSzxNqSdshPc6hwK8y/cYiT+l1VMOGj0UwkmJw
 /2Yvex7uQxkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036047"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036047"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:07:02 -0700
IronPort-SDR: S8tOmrMQOO6vH8GTMpYUMoSWyUGX648XK8zHXferbUPBWaDMLLY9Rc+QVpg/lBtJBcipB+Hfga
 xP0RXVDSQncg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605781"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:07:00 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 08/10] media: Keem Bay Camera: Add capture video node
Date:   Fri, 19 Mar 2021 18:06:30 +0000
Message-Id: <20210319180632.585-9-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

Capture video node implements v4l2 capture
interface and XLink VPU Camera buffer pool operations.

Build and set stream pipeline operations are also executed
from capture video node. Resolution depends on remote
entity pad connected to this video node.

Co-developed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 .../platform/keembay-camera/keembay-pipeline.c     | 192 +++++
 .../platform/keembay-camera/keembay-pipeline.h     |   4 +
 .../media/platform/keembay-camera/keembay-video.c  | 884 ++++++++++++++++++++-
 .../media/platform/keembay-camera/keembay-video.h  |  51 +-
 4 files changed, 1096 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/keembay-camera/keembay-pipeline.c b/drivers/media/platform/keembay-camera/keembay-pipeline.c
index 78b2fffa42ee..0050361ef3c0 100644
--- a/drivers/media/platform/keembay-camera/keembay-pipeline.c
+++ b/drivers/media/platform/keembay-camera/keembay-pipeline.c
@@ -60,6 +60,39 @@ static void kmb_pipe_print_config(struct kmb_pipeline *pipe)
 	dev_dbg(dev, "\tinternal_memory_size %u\n", cfg->internal_memory_size);
 }
 
+static unsigned int kmb_pipe_get_pending(struct media_entity *entity)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	unsigned int num_vdevs = 0;
+	struct media_entity *next;
+	struct media_graph graph;
+	int ret;
+
+	/* Walk through graph to count the connected video node entities */
+	mutex_lock(&mdev->graph_mutex);
+
+	ret = media_graph_walk_init(&graph, mdev);
+	if (ret) {
+		mutex_unlock(&mdev->graph_mutex);
+		return -EINVAL;
+	}
+
+	media_graph_walk_start(&graph, entity);
+
+	while ((next = media_graph_walk_next(&graph))) {
+		if (!is_media_entity_v4l2_video_device(next))
+			continue;
+
+		num_vdevs++;
+	}
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	media_graph_walk_cleanup(&graph);
+
+	return num_vdevs;
+}
+
 /**
  * kmb_pipe_init - Initialize KMB Pipeline
  * @pipe: pointer to pipeline object
@@ -207,3 +240,162 @@ int kmb_pipe_config_src(struct kmb_pipeline *pipe,
 	mutex_unlock(&pipe->lock);
 	return ret;
 }
+
+/**
+ * kmb_pipe_prepare - Prepare VPU pipeline for streaming
+ * @pipe: pointer to pipeline object
+ *
+ * Prepare pipeline for streaming by sending negotiated configuration to VPU
+ * and changing state to BUILT.
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_pipe_prepare(struct kmb_pipeline *pipe)
+{
+	int ret = 0;
+
+	mutex_lock(&pipe->lock);
+
+	/* build only if all outputs are configured */
+	switch (pipe->state) {
+	case KMB_PIPE_STATE_UNCONFIGURED:
+		/* Call config and continue */
+		ret = kmb_cam_xlink_write_ctrl_msg(pipe->xlink_cam,
+						   pipe->pipe_cfg_paddr,
+						   KMB_IC_EVENT_TYPE_CONFIG_ISP_PIPE,
+						   KMB_IC_EVENT_TYPE_SUCCESSFUL);
+		if (ret < 0) {
+			dev_err(pipe->dev, "Failed to reconfigure pipeline!");
+			break;
+		}
+		fallthrough;
+	case KMB_PIPE_STATE_CONFIGURED:
+		ret = kmb_cam_xlink_write_ctrl_msg(pipe->xlink_cam,
+						   pipe->pipe_cfg_paddr,
+						   KMB_IC_EVENT_TYPE_BUILD_ISP_PIPE,
+						   KMB_IC_EVENT_TYPE_SUCCESSFUL);
+		if (ret < 0) {
+			dev_err(pipe->dev, "Failed to build pipeline!");
+			break;
+		}
+		pipe->state = KMB_PIPE_STATE_BUILT;
+		break;
+	case KMB_PIPE_STATE_BUILT:
+		/* Pipeline is already built ignore */
+		break;
+	default:
+		dev_err(pipe->dev,
+			"Build pipe in invalid state %d", pipe->state);
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&pipe->lock);
+
+	return ret;
+}
+
+static int kmb_pipe_s_stream(struct kmb_pipeline *pipe,
+			     struct media_entity *entity, int enable)
+{
+	struct v4l2_subdev *subdev;
+	struct media_pad *remote;
+	int ret;
+
+	remote = media_entity_remote_pad(entity->pads);
+	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
+		return -EINVAL;
+
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	if (!subdev)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(subdev, video, s_stream, enable);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		dev_err(pipe->dev, "Cannot set stream %d", enable);
+
+	return ret != -ENOIOCTLCMD ? ret : 0;
+}
+
+/**
+ * kmb_pipe_stop - Set stream off and stop media pipeline
+ * @pipe: KMB pipeline object
+ * @entity: media entity
+ */
+void kmb_pipe_stop(struct kmb_pipeline *pipe, struct media_entity *entity)
+{
+	mutex_lock(&pipe->lock);
+
+	if (WARN_ON(!pipe->streaming)) {
+		dev_err(pipe->dev, "Calling stop on already stopped pipeline");
+		mutex_unlock(&pipe->lock);
+		return;
+	}
+
+	if (pipe->state == KMB_PIPE_STATE_STREAMING) {
+		kmb_pipe_s_stream(pipe, entity, 0);
+		media_pipeline_stop(entity);
+		pipe->state = KMB_PIPE_STATE_BUILT;
+	}
+
+	if (pipe->state == KMB_PIPE_STATE_BUILT ||
+	    pipe->state == KMB_PIPE_STATE_CONFIGURED) {
+		kmb_cam_xlink_write_ctrl_msg(pipe->xlink_cam,
+					     pipe->pipe_cfg_paddr,
+					     KMB_IC_EVENT_TYPE_DELETE_ISP_PIPE,
+					     KMB_IC_EVENT_TYPE_SUCCESSFUL);
+
+		pipe->state = KMB_PIPE_STATE_UNCONFIGURED;
+	}
+
+	pipe->streaming--;
+
+	mutex_unlock(&pipe->lock);
+}
+
+/**
+ * kmb_pipe_run - Run media pipeline and start streaming
+ * @pipe: KMB pipeline object
+ * @entity: media entity
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_pipe_run(struct kmb_pipeline *pipe, struct media_entity *entity)
+{
+	int ret = 0;
+
+	mutex_lock(&pipe->lock);
+
+	if (!pipe->streaming)
+		pipe->pending = kmb_pipe_get_pending(entity);
+
+	pipe->streaming++;
+
+	if (pipe->streaming != pipe->pending)
+		goto done_unlock;
+
+	if (pipe->state != KMB_PIPE_STATE_BUILT) {
+		ret = -EINVAL;
+		goto done_unlock;
+	}
+
+	ret = media_pipeline_start(entity, &pipe->media_pipe);
+	if (ret < 0) {
+		dev_err(pipe->dev, "Failed to start media pipeline");
+		goto done_unlock;
+	}
+
+	ret = kmb_pipe_s_stream(pipe, entity, 1);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		mutex_unlock(&pipe->lock);
+		kmb_pipe_stop(pipe, entity);
+		return ret;
+	}
+
+	pipe->state = KMB_PIPE_STATE_STREAMING;
+
+done_unlock:
+	mutex_unlock(&pipe->lock);
+
+	return ret;
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-pipeline.h b/drivers/media/platform/keembay-camera/keembay-pipeline.h
index 83ff94d11b34..60ba99e9a73c 100644
--- a/drivers/media/platform/keembay-camera/keembay-pipeline.h
+++ b/drivers/media/platform/keembay-camera/keembay-pipeline.h
@@ -68,4 +68,8 @@ void kmb_pipe_config_dest(struct kmb_pipeline *pipe, unsigned int output_id,
 int kmb_pipe_config_src(struct kmb_pipeline *pipe,
 			struct kmb_pipe_config_evs *pipe_cfg);
 
+int kmb_pipe_prepare(struct kmb_pipeline *pipe);
+int kmb_pipe_run(struct kmb_pipeline *pipe, struct media_entity *entity);
+void kmb_pipe_stop(struct kmb_pipeline *pipe, struct media_entity *entity);
+
 #endif /* KEEMBAY_PIPELINE_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-video.c b/drivers/media/platform/keembay-camera/keembay-video.c
index 02f4d97e16fb..a92cfbeffea9 100644
--- a/drivers/media/platform/keembay-camera/keembay-video.c
+++ b/drivers/media/platform/keembay-camera/keembay-video.c
@@ -2,9 +2,816 @@
 /*
  * Intel Keem Bay camera Video node.
  *
- * Copyright (C) 2018-2020 Intel Corporation
+ * Copyright (C) 2021 Intel Corporation
  */
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/freezer.h>
+#include <linux/kthread.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "keembay-cam-xlink.h"
+#include "keembay-pipeline.h"
 #include "keembay-video.h"
+#include "keembay-vpu-frame.h"
+
+#define KMB_CAM_VIDEO_NAME "keembay-video"
+
+/* Xlink data channel size and timeout */
+#define KMB_VID_CH_DATA_SIZE	1024
+#define KMB_VID_CH_TIMEOUT_MS	5000
+
+#define KMB_VID_MIN_WIDTH	16
+#define KMB_VID_MIN_HEIGHT	16
+#define KMB_VID_MAX_WIDTH	U16_MAX
+#define KMB_VID_MAX_HEIGHT	U16_MAX
+#define KMB_VID_STEP_WIDTH	8
+#define KMB_VID_STEP_HEIGHT	8
+
+#define to_kmb_video_buf(vbuf)	container_of(vbuf, struct kmb_frame_buffer, vb)
+
+/* Kmb video format info structure */
+struct kmb_video_fmt_info {
+	const char *description;
+	u32 code;
+	u32 pixelformat;
+	enum kmb_frame_types type;
+	u32 colorspace;
+	unsigned int planes;
+	unsigned int bpp;
+	unsigned int h_subsample;
+	unsigned int v_subsample;
+	bool contiguous_memory;
+};
+
+/* Supported video formats */
+static const struct kmb_video_fmt_info video_formats[] = {
+	{
+		.description = "NV12",
+		.code = MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.pixelformat = V4L2_PIX_FMT_NV12,
+		.type = KMB_FRAME_TYPE_NV12,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.planes = 2,
+		.bpp = 8,
+		.h_subsample = 1,
+		.v_subsample = 2,
+		.contiguous_memory = true,
+	},
+	{
+		.description = "Planar YUV 4:2:0",
+		.code = MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+		.pixelformat = V4L2_PIX_FMT_YUV420,
+		.type = KMB_FRAME_TYPE_YUV420P,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.planes = 3,
+		.bpp = 8,
+		.h_subsample = 2,
+		.v_subsample = 2,
+		.contiguous_memory = false,
+	},
+	{
+		.description = "Planar YUV 4:4:4",
+		.code = MEDIA_BUS_FMT_YUV8_1X24,
+		.pixelformat = V4L2_PIX_FMT_YUV444,
+		.type = KMB_FRAME_TYPE_YUV444P,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.planes = 3,
+		.bpp = 8,
+		.h_subsample = 1,
+		.v_subsample = 1,
+		.contiguous_memory = false,
+	},
+	{
+		.description = "RAW 8 Garyscale",
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.pixelformat = V4L2_PIX_FMT_GREY,
+		.type = KMB_FRAME_TYPE_RAW8,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.planes = 1,
+		.bpp = 8,
+		.h_subsample = 1,
+		.v_subsample = 1,
+		.contiguous_memory = false,
+	},
+	{
+		.description = "RAW 10 Grayscale",
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.pixelformat = V4L2_PIX_FMT_Y10,
+		.type = KMB_FRAME_TYPE_RAW10,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.planes = 1,
+		.bpp = 10,
+		.h_subsample = 1,
+		.v_subsample = 1,
+		.contiguous_memory = false,
+	}
+};
+
+static const struct kmb_video_fmt_info *
+kmb_video_get_fmt_info_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(video_formats); i++)
+		if (video_formats[i].code == code)
+			return &video_formats[i];
+
+	return NULL;
+}
+
+static const struct kmb_video_fmt_info *
+kmb_video_get_fmt_info_by_pixfmt(u32 pix_fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(video_formats); i++)
+		if (video_formats[i].pixelformat == pix_fmt)
+			return &video_formats[i];
+
+	return NULL;
+}
+
+/* Buffer processing operations */
+static void kmb_video_insert_buf(struct kmb_video *kmb_vid,
+				 struct kmb_frame_buffer *buf)
+{
+	INIT_LIST_HEAD(&buf->list);
+
+	mutex_lock(&kmb_vid->dma_lock);
+	list_add_tail(&buf->list, &kmb_vid->dma_queue);
+	mutex_unlock(&kmb_vid->dma_lock);
+}
+
+static void __kmb_video_buf_discard(struct kmb_video *kmb_vid,
+				    struct kmb_frame_buffer *buf)
+{
+	lockdep_assert_held(&kmb_vid->dma_lock);
+
+	list_del(&buf->list);
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+}
+
+static int kmb_video_process_buf(struct kmb_video *kmb_vid,
+				 struct kmb_frame_buffer *buf)
+{
+	const struct kmb_video_fmt_info *info = kmb_vid->active_fmt.info;
+	struct v4l2_pix_format_mplane *pix = &kmb_vid->active_fmt.pix;
+	struct kmb_vpu_frame_buffer rt_frame_buf;
+	int ret;
+
+	lockdep_assert_held(&kmb_vid->lock);
+
+	memset(&rt_frame_buf, 0, sizeof(rt_frame_buf));
+	rt_frame_buf.spec.bpp = info->bpp;
+	rt_frame_buf.spec.type = info->type;
+	rt_frame_buf.spec.width = pix->width;
+	rt_frame_buf.spec.height = pix->height;
+	rt_frame_buf.spec.stride = pix->plane_fmt[0].bytesperline;
+	rt_frame_buf.p1 = buf->addr[0];
+
+	/* Planes not used by the VPU should be set with addr 0 */
+	if (pix->num_planes > 1)
+		rt_frame_buf.p2 = buf->addr[1];
+	if (pix->num_planes > 2)
+		rt_frame_buf.p3 = buf->addr[2];
+
+	ret = kmb_cam_xlink_write_msg(kmb_vid->xlink_cam,
+				      kmb_vid->chan_id,
+				      (u8 *)&rt_frame_buf,
+				      sizeof(rt_frame_buf));
+	if (ret < 0) {
+		dev_err(kmb_vid->dma_dev, "Error on buffer queue %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void kmb_video_process_all_bufs(struct kmb_video *kmb_vid)
+{
+	struct kmb_frame_buffer *buf;
+	struct list_head *next;
+	struct list_head *pos;
+	int ret;
+
+	mutex_lock(&kmb_vid->dma_lock);
+
+	/* Discard buf is removing buffer from the list */
+	list_for_each_safe(pos, next, &kmb_vid->dma_queue) {
+		buf = list_entry(pos, struct kmb_frame_buffer, list);
+
+		ret = kmb_video_process_buf(kmb_vid, buf);
+		if (ret) {
+			dev_err(&kmb_vid->video->dev,
+				"Cannot process output buf 0x%pad",
+				&buf->addr[0]);
+			__kmb_video_buf_discard(kmb_vid, buf);
+			continue;
+		}
+	}
+
+	mutex_unlock(&kmb_vid->dma_lock);
+}
+
+static int kmb_video_queue_output_buf(struct kmb_video *kmb_vid,
+				      struct kmb_frame_buffer *buf)
+{
+	int ret = 0;
+
+	kmb_video_insert_buf(kmb_vid, buf);
+
+	mutex_lock(&kmb_vid->dma_lock);
+
+	/* Process buffers only when device is streaming */
+	if (vb2_is_streaming(&kmb_vid->vb2_q)) {
+		ret = kmb_video_process_buf(kmb_vid, buf);
+		if (ret) {
+			dev_err(&kmb_vid->video->dev,
+				"Fail to process output buf 0x%pad",
+				&buf->addr[0]);
+			__kmb_video_buf_discard(kmb_vid, buf);
+		}
+	}
+
+	mutex_unlock(&kmb_vid->dma_lock);
+
+	return ret;
+}
+
+static void kmb_video_release_all_bufs(struct kmb_video *kmb_vid,
+				       enum vb2_buffer_state state)
+{
+	struct list_head *next = NULL;
+	struct list_head *pos = NULL;
+	struct kmb_frame_buffer *buf;
+
+	mutex_lock(&kmb_vid->dma_lock);
+	list_for_each_safe(pos, next, &kmb_vid->dma_queue) {
+		buf = list_entry(pos, struct kmb_frame_buffer, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	mutex_unlock(&kmb_vid->dma_lock);
+}
+
+static void kmb_video_remove_buf(struct kmb_video *kmb_vid,
+				 struct kmb_frame_buffer *buf)
+{
+	mutex_lock(&kmb_vid->dma_lock);
+	list_del(&buf->list);
+	mutex_unlock(&kmb_vid->dma_lock);
+}
+
+static struct kmb_frame_buffer *
+kmb_video_find_buf_by_addr(struct kmb_video *kmb_vid, uint64_t addr)
+{
+	struct kmb_frame_buffer *buf = NULL;
+	struct list_head *node = NULL;
+
+	mutex_lock(&kmb_vid->dma_lock);
+
+	list_for_each(node, &kmb_vid->dma_queue) {
+		buf = list_entry(node, struct kmb_frame_buffer, list);
+		if (buf->addr[0] == addr) {
+			mutex_unlock(&kmb_vid->dma_lock);
+			return buf;
+		}
+	}
+
+	mutex_unlock(&kmb_vid->dma_lock);
+
+	return NULL;
+}
+
+static void kmb_video_fmt_info_to_pix(const struct kmb_video_fmt_info *info,
+				      struct v4l2_mbus_framefmt *mbus_fmt,
+				      struct v4l2_pix_format_mplane *pix)
+{
+	u32 bytesperline;
+	u32 sizeimage;
+	u32 v_sub = 1;
+	u32 h_sub = 1;
+	unsigned int i;
+
+	pix->width = mbus_fmt->width;
+	pix->height = mbus_fmt->height;
+
+	pix->pixelformat = info->pixelformat;
+	pix->colorspace = info->colorspace;
+	pix->num_planes = info->planes;
+
+	for (i = 0; i < pix->num_planes; i++) {
+		bytesperline = pix->width * info->bpp / 8 / h_sub;
+
+		if (pix->plane_fmt[i].bytesperline < bytesperline)
+			pix->plane_fmt[i].bytesperline = bytesperline;
+
+		sizeimage = pix->plane_fmt[i].bytesperline *
+			    pix->height / v_sub;
+
+		if (pix->plane_fmt[i].sizeimage < sizeimage)
+			pix->plane_fmt[i].sizeimage = sizeimage;
+
+		h_sub = info->h_subsample;
+		v_sub = info->v_subsample;
+	}
+}
+
+static int kmb_video_get_subdev_fmt(struct kmb_video *kmb_vid,
+				    struct v4l2_pix_format_mplane *pix)
+{
+	const struct kmb_video_fmt_info *fmt_info;
+	struct v4l2_subdev_format sd_fmt;
+	struct v4l2_subdev *subdev;
+	struct media_pad *remote;
+	int ret;
+
+	remote = media_entity_remote_pad(&kmb_vid->pad);
+	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
+		return -EINVAL;
+
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	if (!subdev)
+		return -EINVAL;
+
+	memset(&sd_fmt, 0, sizeof(sd_fmt));
+	sd_fmt.pad = remote->index;
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &sd_fmt);
+	if (ret < 0)
+		return ret;
+
+	fmt_info = kmb_video_get_fmt_info_by_code(sd_fmt.format.code);
+	if (!fmt_info)
+		return -EINVAL;
+
+	kmb_video_fmt_info_to_pix(fmt_info,  &sd_fmt.format, pix);
+
+	return 0;
+}
+
+static int kmb_video_queue_setup(struct vb2_queue *q,
+				 unsigned int *num_buffers,
+				 unsigned int *num_planes,
+				 unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	struct kmb_video *kmb_vid = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane *pix = &kmb_vid->active_fmt.pix;
+	unsigned int i;
+
+	if (kmb_vid->active_fmt.info->contiguous_memory) {
+		*num_planes = 1;
+		for (i = 0; i < pix->num_planes; i++)
+			sizes[0] += pix->plane_fmt[i].sizeimage;
+	} else {
+		*num_planes = pix->num_planes;
+		for (i = 0; i < pix->num_planes; i++)
+			sizes[i] = pix->plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static int kmb_video_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct kmb_video *kmb_vid = vb2_get_drv_priv(vb->vb2_queue);
+	struct v4l2_pix_format_mplane *pix = &kmb_vid->active_fmt.pix;
+	unsigned int size_image = 0;
+	unsigned int i;
+
+	if (kmb_vid->active_fmt.info->contiguous_memory) {
+		for (i = 0; i < pix->num_planes; i++)
+			size_image += pix->plane_fmt[i].sizeimage;
+
+		vb2_set_plane_payload(vb, 0, size_image);
+	} else {
+		for (i = 0; i < pix->num_planes; i++)
+			vb2_set_plane_payload(vb, i,
+					      pix->plane_fmt[i].sizeimage);
+	}
+
+	return 0;
+}
+
+static int kmb_video_buf_init(struct vb2_buffer *vb)
+{
+	struct kmb_video *kmb_vid = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_frame_buffer *buf = to_kmb_video_buf(vbuf);
+	struct v4l2_pix_format_mplane *pix = &kmb_vid->active_fmt.pix;
+	unsigned int i;
+
+	if (kmb_vid->active_fmt.info->contiguous_memory) {
+		buf->addr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);
+		for (i = 1; i < pix->num_planes; i++) {
+			buf->addr[i] = buf->addr[i - 1] +
+				pix->plane_fmt[i - 1].sizeimage;
+		}
+	} else {
+		for (i = 0; i < pix->num_planes; i++)
+			buf->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+	}
+
+	return 0;
+}
+
+static void kmb_video_buf_queue(struct vb2_buffer *vb)
+{
+	struct kmb_video *kmb_vid = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct kmb_frame_buffer *buf = to_kmb_video_buf(vbuf);
+	int ret;
+
+	ret = kmb_video_queue_output_buf(kmb_vid, buf);
+	if (ret)
+		dev_err(kmb_vid->dma_dev, "Fail output buf queue %d", ret);
+}
+
+static int kmb_video_worker_thread(void *video)
+{
+	struct kmb_vpu_frame_buffer rt_frame_buf;
+	struct kmb_video *kmb_vid = video;
+	struct kmb_frame_buffer *buf = NULL;
+	bool stopped = false;
+	int ret;
+
+	set_freezable();
+
+	while (!kthread_should_stop()) {
+		try_to_freeze();
+
+		if (stopped) {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule();
+			continue;
+		}
+
+		memset(&rt_frame_buf, 0, sizeof(rt_frame_buf));
+		ret = kmb_cam_xlink_read_msg(kmb_vid->xlink_cam,
+					     kmb_vid->chan_id,
+					     (u8 *)&rt_frame_buf,
+					     sizeof(rt_frame_buf));
+		if (ret < 0) {
+			stopped = true;
+			/* Continue here to enter in freeze state */
+			continue;
+		}
+
+		buf = kmb_video_find_buf_by_addr(kmb_vid, rt_frame_buf.p1);
+		if (buf) {
+			kmb_video_remove_buf(kmb_vid, buf);
+
+			buf->vb.vb2_buf.timestamp = rt_frame_buf.ts;
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		} else {
+			dev_err(kmb_vid->dma_dev, "Ouch cannot find buff %llx",
+				rt_frame_buf.p1);
+		}
+	}
+
+	return 0;
+}
+
+static int kmb_video_worker_start(struct kmb_video *kmb_vid)
+{
+	int ret;
+
+	ret = kmb_cam_xlink_open_channel(kmb_vid->xlink_cam, kmb_vid->chan_id);
+	if (ret)
+		return ret;
+
+	kmb_vid->thread = kthread_run(kmb_video_worker_thread,
+				      kmb_vid, "kmb_vnode_thread");
+	if (IS_ERR(kmb_vid->thread)) {
+		dev_err(&kmb_vid->video->dev, "Cannot start thread");
+		ret = -ENOMEM;
+		kmb_vid->thread = NULL;
+		goto error_close_xlink_channel;
+	}
+
+	return 0;
+
+error_close_xlink_channel:
+	kmb_cam_xlink_close_channel(kmb_vid->xlink_cam, kmb_vid->chan_id);
+
+	return ret;
+}
+
+static int kmb_video_worker_stop(struct kmb_video *kmb_vid)
+{
+	int ret;
+
+	/*
+	 * Xlink has no functionality to unblock read volatile function,
+	 * only way to unblock is to close the channel.
+	 */
+	kmb_cam_xlink_close_channel(kmb_vid->xlink_cam, kmb_vid->chan_id);
+	if (!kmb_vid->thread) {
+		dev_warn(&kmb_vid->video->dev, "No thread running");
+		return 0;
+	}
+
+	ret = kthread_stop(kmb_vid->thread);
+	if (ret < 0)
+		dev_err(&kmb_vid->video->dev, "Thread stop failed %d", ret);
+
+	kmb_vid->thread = NULL;
+
+	return ret;
+}
+
+static int kmb_video_capture_start_streaming(struct vb2_queue *q,
+					     unsigned int count)
+{
+	struct kmb_video *kmb_vid = vb2_get_drv_priv(q);
+	int ret;
+
+	ret = kmb_pipe_prepare(kmb_vid->pipe);
+	if (ret < 0)
+		goto error_discard_all_bufs;
+
+	ret = kmb_video_worker_start(kmb_vid);
+	if (ret < 0)
+		goto error_pipeline_stop;
+
+	/* Process all pending buffers after worker is started */
+	kmb_video_process_all_bufs(kmb_vid);
+
+	/*
+	 * Run the pipeline after all buffers are provided for processing,
+	 * the main reason is to not skip any frame from the source.
+	 */
+	ret = kmb_pipe_run(kmb_vid->pipe, &kmb_vid->video->entity);
+	if (ret < 0)
+		goto error_pipeline_stop;
+
+	return 0;
+
+error_pipeline_stop:
+	kmb_pipe_stop(kmb_vid->pipe, &kmb_vid->video->entity);
+error_discard_all_bufs:
+	kmb_video_release_all_bufs(kmb_vid, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void kmb_video_capture_stop_streaming(struct vb2_queue *q)
+{
+	struct kmb_video *kmb_vid = vb2_get_drv_priv(q);
+
+	kmb_pipe_stop(kmb_vid->pipe, &kmb_vid->video->entity);
+
+	kmb_video_worker_stop(kmb_vid);
+
+	kmb_video_release_all_bufs(kmb_vid, VB2_BUF_STATE_ERROR);
+}
+
+/* driver-specific operations */
+static const struct vb2_ops kmb_video_vb2_q_capture_ops = {
+	.queue_setup     = kmb_video_queue_setup,
+	.buf_prepare     = kmb_video_buffer_prepare,
+	.buf_init        = kmb_video_buf_init,
+	.buf_queue       = kmb_video_buf_queue,
+	.start_streaming = kmb_video_capture_start_streaming,
+	.stop_streaming  = kmb_video_capture_stop_streaming,
+};
+
+static int kmb_video_querycap(struct file *file, void *fh,
+			      struct v4l2_capability *cap)
+{
+	cap->bus_info[0] = 0;
+	strscpy(cap->driver, KMB_CAM_VIDEO_NAME, sizeof(cap->driver));
+	strscpy(cap->card, KMB_CAM_VIDEO_NAME, sizeof(cap->card));
+
+	return 0;
+}
+
+static int kmb_video_enum_fmt(struct file *file, void *fh,
+			      struct v4l2_fmtdesc *f)
+{
+	const struct kmb_video_fmt_info *info;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
+		return -EINVAL;
+
+	if (f->mbus_code) {
+		if (f->index != 0)
+			return -EINVAL;
+
+		info = kmb_video_get_fmt_info_by_code(f->mbus_code);
+		if (!info)
+			return -EINVAL;
+	} else {
+		info = &video_formats[f->index];
+		if (!info)
+			return -EINVAL;
+	}
+
+	f->pixelformat = info->pixelformat;
+	f->mbus_code = info->code;
+	strscpy(f->description, info->description, sizeof(f->description));
+
+	return 0;
+}
+
+static int kmb_video_enum_framesizes(struct file *file, void *fh,
+				     struct v4l2_frmsizeenum *fsize)
+{
+	const struct kmb_video_fmt_info *info;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	info = kmb_video_get_fmt_info_by_pixfmt(fsize->pixel_format);
+	if (!info)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+
+	fsize->stepwise.min_width = KMB_VID_MIN_WIDTH;
+	fsize->stepwise.max_width = KMB_VID_MAX_WIDTH;
+	fsize->stepwise.step_width = KMB_VID_STEP_WIDTH;
+	fsize->stepwise.min_height = KMB_VID_MIN_HEIGHT;
+	fsize->stepwise.max_height = KMB_VID_MAX_HEIGHT;
+	fsize->stepwise.step_height = KMB_VID_STEP_HEIGHT;
+
+	return 0;
+}
+
+static int kmb_video_try_fmt(struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	const struct kmb_video_fmt_info *info;
+	struct v4l2_mbus_framefmt mbus_fmt;
+
+	info = kmb_video_get_fmt_info_by_pixfmt(f->fmt.pix_mp.pixelformat);
+	if (!info)
+		info = &video_formats[0];
+
+	mbus_fmt.width = f->fmt.pix_mp.width;
+	mbus_fmt.height = f->fmt.pix_mp.height;
+	kmb_video_fmt_info_to_pix(info, &mbus_fmt, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int kmb_video_set_fmt(struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct kmb_video *kmb_vid = video_drvdata(file);
+	const struct kmb_video_fmt_info *info;
+	struct v4l2_mbus_framefmt mbus_fmt;
+
+	info = kmb_video_get_fmt_info_by_pixfmt(f->fmt.pix_mp.pixelformat);
+	if (!info)
+		info = &video_formats[0];
+
+	mbus_fmt.width = f->fmt.pix_mp.width;
+	mbus_fmt.height = f->fmt.pix_mp.height;
+	kmb_video_fmt_info_to_pix(info, &mbus_fmt, &f->fmt.pix_mp);
+
+	kmb_vid->active_fmt.pix = f->fmt.pix_mp;
+	kmb_vid->active_fmt.info = info;
+
+	return 0;
+}
+
+static int kmb_video_get_fmt(struct file *file, void *fh,
+			     struct v4l2_format *f)
+{
+	struct kmb_video *kmb_vid = video_drvdata(file);
+
+	f->fmt.pix_mp = kmb_vid->active_fmt.pix;
+
+	return 0;
+}
+
+static int kmb_video_check_format(struct kmb_video *kmb_vid)
+{
+	int ret;
+	struct v4l2_pix_format_mplane pix;
+
+	ret = kmb_video_get_subdev_fmt(kmb_vid, &pix);
+	if (ret < 0)
+		return ret;
+
+	if (kmb_vid->active_fmt.pix.pixelformat != pix.pixelformat ||
+	    kmb_vid->active_fmt.pix.height != pix.height ||
+	    kmb_vid->active_fmt.pix.width != pix.width ||
+	    kmb_vid->active_fmt.pix.num_planes != pix.num_planes) {
+		dev_err(&kmb_vid->video->dev, "Pix fmt mismatch:\n\t"
+			"pix_fmt %u %u\n\theight %u %u\n\twidth %u %u\n\t"
+			"num_planes %u %u",
+			kmb_vid->active_fmt.pix.pixelformat, pix.pixelformat,
+			kmb_vid->active_fmt.pix.height, pix.height,
+			kmb_vid->active_fmt.pix.width, pix.width,
+			kmb_vid->active_fmt.pix.num_planes, pix.num_planes);
+		ret =  -EINVAL;
+	}
+
+	return ret;
+}
+
+static int kmb_video_streamon(struct file *file, void *fh,
+			      enum v4l2_buf_type type)
+{
+	struct kmb_video *kmb_vid = video_drvdata(file);
+	int ret;
+
+	if (type != kmb_vid->vb2_q.type)
+		return -EINVAL;
+
+	ret =  kmb_video_check_format(kmb_vid);
+	if (ret < 0)
+		return ret;
+
+	return vb2_streamon(&kmb_vid->vb2_q, type);
+}
+
+/* V4L2 ioctl operations */
+static const struct v4l2_ioctl_ops kmb_vid_ioctl_ops = {
+	.vidioc_querycap                 = kmb_video_querycap,
+	.vidioc_enum_fmt_vid_cap         = kmb_video_enum_fmt,
+	.vidioc_enum_framesizes          = kmb_video_enum_framesizes,
+	.vidioc_g_fmt_vid_cap_mplane     = kmb_video_get_fmt,
+	.vidioc_try_fmt_vid_cap_mplane   = kmb_video_try_fmt,
+	.vidioc_s_fmt_vid_cap_mplane     = kmb_video_set_fmt,
+	.vidioc_reqbufs                  = vb2_ioctl_reqbufs,
+	.vidioc_querybuf                 = vb2_ioctl_querybuf,
+	.vidioc_qbuf                     = vb2_ioctl_qbuf,
+	.vidioc_dqbuf                    = vb2_ioctl_dqbuf,
+	.vidioc_streamon                 = kmb_video_streamon,
+	.vidioc_streamoff                = vb2_ioctl_streamoff,
+	.vidioc_expbuf                   = vb2_ioctl_expbuf,
+};
+
+static int kmb_video_open(struct file *file)
+{
+	struct kmb_video *kmb_vid = video_drvdata(file);
+	struct v4l2_mbus_framefmt fmt;
+	int ret;
+
+	mutex_lock(&kmb_vid->lock);
+	ret = v4l2_fh_open(file);
+	if (ret) {
+		mutex_unlock(&kmb_vid->lock);
+		return ret;
+	}
+
+	INIT_LIST_HEAD(&kmb_vid->dma_queue);
+
+	ret = kmb_pipe_request(kmb_vid->pipe);
+	if (ret < 0)
+		goto error_fh_release;
+
+	/* Fill default format. */
+	memset(&fmt, 0, sizeof(fmt));
+	kmb_video_fmt_info_to_pix(&video_formats[0], &fmt,
+				  &kmb_vid->active_fmt.pix);
+	kmb_vid->active_fmt.info = &video_formats[0];
+
+	mutex_unlock(&kmb_vid->lock);
+
+	return 0;
+
+error_fh_release:
+	_vb2_fop_release(file, NULL);
+	mutex_unlock(&kmb_vid->lock);
+
+	return ret;
+}
+
+static int kmb_video_release(struct file *file)
+{
+	struct kmb_video *kmb_vid = video_drvdata(file);
+	int ret;
+
+	mutex_lock(&kmb_vid->lock);
+
+	kmb_pipe_release(kmb_vid->pipe);
+
+	ret = _vb2_fop_release(file, NULL);
+
+	mutex_unlock(&kmb_vid->lock);
+
+	return ret;
+}
+
+/* FS operations for V4L2 device */
+static const struct v4l2_file_operations kmb_vid_fops = {
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open           = kmb_video_open,
+	.release        = kmb_video_release,
+	.poll           = vb2_fop_poll,
+	.mmap           = vb2_fop_mmap,
+};
 
 /**
  * kmb_video_init - Initialize entity
@@ -15,7 +822,63 @@
  */
 int kmb_video_init(struct kmb_video *kmb_vid, const char *name)
 {
+	int ret;
+
+	kmb_vid->video = video_device_alloc();
+	if (!kmb_vid->video) {
+		dev_err(&kmb_vid->video->dev,
+			"Failed to allocate video device");
+		return -ENOMEM;
+	}
+
+	mutex_init(&kmb_vid->lock);
+	mutex_init(&kmb_vid->dma_lock);
+
+	kmb_vid->video->fops  = &kmb_vid_fops;
+	kmb_vid->video->ioctl_ops = &kmb_vid_ioctl_ops;
+	kmb_vid->video->minor = -1;
+	kmb_vid->video->release  = video_device_release;
+	kmb_vid->video->vfl_type = VFL_TYPE_VIDEO;
+	kmb_vid->video->lock = &kmb_vid->lock;
+	kmb_vid->video->queue = &kmb_vid->vb2_q;
+	video_set_drvdata(kmb_vid->video, kmb_vid);
+	snprintf(kmb_vid->video->name, sizeof(kmb_vid->video->name),
+		 "kmb_video %s", name);
+
+	kmb_vid->vb2_q.drv_priv = kmb_vid;
+	kmb_vid->vb2_q.ops = &kmb_video_vb2_q_capture_ops;
+	kmb_vid->vb2_q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	kmb_vid->vb2_q.buf_struct_size = sizeof(struct kmb_frame_buffer);
+	kmb_vid->vb2_q.io_modes = VB2_MMAP | VB2_DMABUF;
+	kmb_vid->vb2_q.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	kmb_vid->vb2_q.mem_ops = &vb2_dma_contig_memops;
+	kmb_vid->vb2_q.dev = kmb_vid->dma_dev;
+	kmb_vid->vb2_q.lock = &kmb_vid->lock;
+	kmb_vid->vb2_q.min_buffers_needed = 1;
+
+	kmb_vid->pad.flags = MEDIA_PAD_FL_SINK;
+	kmb_vid->video->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+				      V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+
+	ret = media_entity_pads_init(&kmb_vid->video->entity, 1, &kmb_vid->pad);
+	if (ret < 0)
+		goto error_mutex_destroy;
+
+	ret = vb2_queue_init(&kmb_vid->vb2_q);
+	if (ret < 0) {
+		dev_err(&kmb_vid->video->dev, "Failed to init vb2 queue");
+		goto error_video_cleanup;
+	}
+
 	return 0;
+
+error_video_cleanup:
+	kmb_video_cleanup(kmb_vid);
+error_mutex_destroy:
+	mutex_destroy(&kmb_vid->lock);
+	mutex_destroy(&kmb_vid->dma_lock);
+
+	return ret;
 }
 
 /**
@@ -23,7 +886,11 @@ int kmb_video_init(struct kmb_video *kmb_vid, const char *name)
  * @kmb_vid: pointer to kmb video device
  */
 void kmb_video_cleanup(struct kmb_video *kmb_vid)
-{ }
+{
+	media_entity_cleanup(&kmb_vid->video->entity);
+	mutex_destroy(&kmb_vid->lock);
+	mutex_destroy(&kmb_vid->dma_lock);
+}
 
 /**
  * kmb_video_register - Register V4L2 device
@@ -35,7 +902,14 @@ void kmb_video_cleanup(struct kmb_video *kmb_vid)
 int kmb_video_register(struct kmb_video *kmb_vid,
 		       struct v4l2_device *v4l2_dev)
 {
-	return 0;
+	int ret;
+
+	kmb_vid->video->v4l2_dev = v4l2_dev;
+	ret = video_register_device(kmb_vid->video, VFL_TYPE_VIDEO, -1);
+	if (ret < 0)
+		dev_err(&kmb_vid->video->dev, "Failed to register video device");
+
+	return ret;
 }
 
 /**
@@ -43,4 +917,6 @@ int kmb_video_register(struct kmb_video *kmb_vid,
  * @kmb_vid: pointer to kmb video device
  */
 void kmb_video_unregister(struct kmb_video *kmb_vid)
-{ }
+{
+	video_unregister_device(kmb_vid->video);
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-video.h b/drivers/media/platform/keembay-camera/keembay-video.h
index 2aebbb37424b..de25dfe3d684 100644
--- a/drivers/media/platform/keembay-camera/keembay-video.h
+++ b/drivers/media/platform/keembay-camera/keembay-video.h
@@ -16,7 +16,7 @@
 /**
  * struct kmb_frame_buffer - KMB frame buffer structure
  * @vb: Video buffer for v4l2
- * @addr: Array of dma buffer plane address
+ * @addr: Array of dma buffer plane addresses
  * @list: Frame buffer list
  */
 struct kmb_frame_buffer {
@@ -28,50 +28,39 @@ struct kmb_frame_buffer {
 /**
  * struct kmb_video - KMB Video device structure
  * @lock: Mutex serializing kmb video device ops
- * @video_lock: Mutex serializing video operations
  * @video: Pointer to V4L2 sub-device
+ * @vb2_q: Video buffer queue
  * @pad: Media pad graph objects
  * @dma_dev: Pointer to dma device
+ * @dma_queue: DMA buffers queue
+ * @dma_lock: Mutex serializing dma queue ops
+ * @active_fmt: Active format
+ * @active_fmt.pix: Mplane active pixel format
+ * @active_fmt.info: Active kmb format info
  * @pipe: Pointer to kmb media pipeline
- * @chan: Pointer to xlink channel
+ * @xlink_cam: Pointer to xlink camera communication handler
+ * @chan_id: Channel ID
+ * @thread: Pointer to worker thread data
  */
 struct kmb_video {
-	struct mutex lock; /* Lock protecting kmb video device */
-	struct mutex video_lock; /* Lock serializing video device operations */
+	struct mutex lock;
 	struct video_device *video;
+	struct vb2_queue vb2_q;
 	struct media_pad pad;
+
 	struct device *dma_dev;
-	struct kmb_pipeline *pipe;
-	struct kmb_xlink_cam *xlink_cam;
-	unsigned int chan_id;
-};
+	struct list_head dma_queue;
+	struct mutex dma_lock;
 
-/**
- * struct kmb_video_fh - KMB video file handler
- * @fh: V4L2 file handler
- * @kmb_vid: Pointer to KMB video device
- * @lock: Mutex serializing access to fh
- * @vb2_lock: Mutex serializing access to vb2 queue
- * @vb2_q: Video buffer queue
- * @active_fmt: Active format
-     @pix: Mplane active pixel format
-     @info: Active kmb format info
- * @contiguous_memory: Flag to enable contiguous memory allocation
- * @dma_queue: DMA buffers queue
- * @thread: Pointer to worker thread data
- */
-struct kmb_video_fh {
-	struct v4l2_fh fh;
-	struct kmb_video *kmb_vid;
-	struct mutex lock; /* Lock protecting fh operations */
-	struct mutex vb2_lock; /* Lock protecting video buffer queue */
-	struct vb2_queue vb2_q;
 	struct {
 		struct v4l2_pix_format_mplane pix;
 		const struct kmb_video_fmt_info *info;
 	} active_fmt;
-	bool contiguous_memory;
-	struct list_head dma_queue;
+
+	struct kmb_pipeline *pipe;
+	struct kmb_xlink_cam *xlink_cam;
+	unsigned int chan_id;
+
 	struct task_struct *thread;
 };
 
-- 
2.11.0

