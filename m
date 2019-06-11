Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6603C1B6
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 05:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391040AbfFKDy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 23:54:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46095 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391051AbfFKDyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 23:54:25 -0400
X-UUID: a777b3dfcb144508aa32a5f6cb99296b-20190611
X-UUID: a777b3dfcb144508aa32a5f6cb99296b-20190611
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 342950901; Tue, 11 Jun 2019 11:53:58 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 11:53:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 11:53:56 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <jungo.lin@mediatek.com>,
        <frankie.chiu@mediatek.com>
Subject: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
Date:   Tue, 11 Jun 2019 11:53:41 +0800
Message-ID: <20190611035344.29814-7-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 58EE2E0369C3E1CCE884C4C0082A906089754A20771040D753A4F13A278960C32000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement standard V4L2 video driver that utilizes V4L2
and media framework APIs. In this driver, supports one media
device, one sub-device and seven video devices during
initialization. Moreover, it also connects with sensor and
seninf drivers with V4L2 async APIs.

(The current metadata interface used in meta input and partial
meta nodes is only a temporary solution to kick off the driver
development and is not ready to be reviewed yet.)

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
This patch depends on "media: support Mediatek sensor interface driver"[1].

ISP P1 sub-device communicates with seninf sub-device with CIO.

[1]. media: support Mediatek sensor interface driver
https://patchwork.kernel.org/cover/10979135/
---
 .../platform/mtk-isp/isp_50/cam/Makefile      |    1 +
 .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c    | 1674 +++++++++++++++++
 .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h    |  173 ++
 3 files changed, 1848 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h

diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
index 53fb69d3add6..7558593e63f0 100644
--- a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 mtk-cam-isp-objs += mtk_cam-ctrl.o
+mtk-cam-isp-objs += mtk_cam-v4l2-util.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
\ No newline at end of file
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
new file mode 100644
index 000000000000..117398ed29d2
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
@@ -0,0 +1,1674 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Mediatek Corporation.
+ * Copyright (c) 2017 Intel Corporation.
+ *
+ * MTK_CAM-v4l2-util is highly based on Intel IPU3 ImgU driver.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-ctrl.h"
+#include "mtk_cam-smem.h"
+#include "mtk_cam-v4l2-util.h"
+
+#define MTK_CAM_CIO_PAD_SRC			4
+#define MTK_CAM_CIO_PAD_SINK			11
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
+static inline struct mtk_cam_dev *
+mtk_cam_mdev_to_dev(struct media_device *__mdev)
+{
+	return container_of(__mdev,
+		struct mtk_cam_dev, media_dev);
+}
+
+static inline struct mtk_cam_video_device *
+mtk_cam_vbq_to_vdev(struct vb2_queue *__vq)
+{
+	return container_of(__vq,
+		struct mtk_cam_video_device, vbq);
+}
+
+static inline struct mtk_cam_dev_request *
+mtk_cam_req_to_dev_req(struct media_request *__req)
+{
+	return container_of(__req,
+		struct mtk_cam_dev_request, req);
+}
+
+static inline struct mtk_cam_dev_buffer *
+mtk_cam_vb2_buf_to_dev_buf(struct vb2_buffer *__vb)
+{
+	return container_of(__vb,
+		struct mtk_cam_dev_buffer, vbb.vb2_buf);
+}
+
+static void mtk_cam_req_try_isp_queue(struct mtk_cam_dev *cam_dev,
+				      struct media_request *new_req)
+{
+	struct mtk_cam_dev_request *req, *req_safe, *cam_dev_req;
+	struct device *dev = &cam_dev->pdev->dev;
+
+	dev_dbg(dev, "%s new req:%d", __func__, !new_req);
+
+	if (!cam_dev->streaming) {
+		cam_dev_req = mtk_cam_req_to_dev_req(new_req);
+		spin_lock(&cam_dev->req_lock);
+		list_add_tail(&cam_dev_req->list, &cam_dev->req_list);
+		spin_unlock(&cam_dev->req_lock);
+		dev_dbg(dev, "%s: stream off, no ISP enqueue\n", __func__);
+		return;
+	}
+
+	/* Normal enqueue flow */
+	if (new_req) {
+		mtk_isp_req_enqueue(dev, new_req);
+		return;
+	}
+
+	/* Flush all media requests wehen first stream on */
+	list_for_each_entry_safe(req, req_safe, &cam_dev->req_list, list) {
+		list_del(&req->list);
+		mtk_isp_req_enqueue(dev, &req->req);
+	}
+}
+
+static void mtk_cam_req_queue(struct media_request *req)
+{
+	struct mtk_cam_dev *cam_dev = mtk_cam_mdev_to_dev(req->mdev);
+
+	vb2_request_queue(req);
+	mtk_cam_req_try_isp_queue(cam_dev, req);
+}
+
+static struct media_request *mtk_cam_req_alloc(struct media_device *mdev)
+{
+	struct mtk_cam_dev_request *cam_dev_req;
+
+	cam_dev_req = kzalloc(sizeof(*cam_dev_req), GFP_KERNEL);
+
+	return &cam_dev_req->req;
+}
+
+static void mtk_cam_req_free(struct media_request *req)
+{
+	struct mtk_cam_dev_request *cam_dev_req = mtk_cam_req_to_dev_req(req);
+
+	kfree(cam_dev_req);
+}
+
+static __u32 img_get_pixel_byte_by_fmt(__u32 pix_fmt)
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
+	default:
+		return 0;
+	}
+}
+
+static __u32 img_cal_main_stream_stride(struct device *dev, __u32 width,
+					__u32 pix_fmt)
+{
+	__u32 stride;
+	__u32 pixel_byte = img_get_pixel_byte_by_fmt(pix_fmt);
+
+	width = ALIGN(width, 4);
+	stride = ALIGN(DIV_ROUND_UP(width * pixel_byte, 8), 2);
+
+	dev_dbg(dev, "main width:%d, stride:%d\n", width, stride);
+
+	return stride;
+}
+
+static __u32 img_cal_packed_out_stride(struct device *dev, __u32 width,
+				       __u32 pix_fmt)
+{
+	__u32 stride;
+	__u32 pixel_byte = img_get_pixel_byte_by_fmt(pix_fmt);
+
+	width = ALIGN(width, 4);
+	stride = DIV_ROUND_UP(width * 3, 2);
+	stride = DIV_ROUND_UP(stride * pixel_byte, 8);
+
+	if (pix_fmt == V4L2_PIX_FMT_MTISP_F10)
+		stride = ALIGN(stride, 4);
+
+	dev_dbg(dev, "packed width:%d, stride:%d\n", width, stride);
+
+	return stride;
+}
+
+static __u32 img_cal_stride(struct device *dev,
+			    int node_id,
+			    __u32 width,
+			    __u32 pix_fmt)
+{
+	__u32 bpl;
+
+	/* Currently, only support one_pixel_mode */
+	if (node_id == MTK_CAM_P1_MAIN_STREAM_OUT)
+		bpl = img_cal_main_stream_stride(dev, width, pix_fmt);
+	else if (node_id == MTK_CAM_P1_PACKED_BIN_OUT)
+		bpl = img_cal_packed_out_stride(dev, width, pix_fmt);
+
+	/* For DIP HW constrained, it needs 4 byte alignment */
+	bpl = ALIGN(bpl, 4);
+
+	return bpl;
+}
+
+static const struct v4l2_format *
+mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *desc, u32 format)
+{
+	unsigned int i;
+	const struct v4l2_format *dev_fmt;
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
+/* Calcuate mplane pix format */
+static void
+mtk_cam_dev_cal_mplane_fmt(struct device *dev,
+			   struct v4l2_pix_format_mplane *dest_fmt,
+			   unsigned int node_id)
+{
+	unsigned int i;
+	__u32 bpl, sizeimage, imagsize;
+
+	imagsize = 0;
+	for (i = 0 ; i < dest_fmt->num_planes; ++i) {
+		bpl = img_cal_stride(dev,
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
+static void
+mtk_cam_dev_set_img_fmt(struct device *dev,
+			struct v4l2_pix_format_mplane *dest_fmt,
+			const struct v4l2_pix_format_mplane *src_fmt,
+			unsigned int node_id)
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
+	mtk_cam_dev_cal_mplane_fmt(dev, dest_fmt, node_id);
+}
+
+/* Get the default format setting */
+static void
+mtk_cam_dev_load_default_fmt(struct device *dev,
+			     struct mtk_cam_dev_node_desc *queue_desc,
+			     struct v4l2_format *dest)
+{
+	const struct v4l2_format *default_fmt =
+		&queue_desc->fmts[queue_desc->default_fmt_idx];
+
+	dest->type = queue_desc->buf_type;
+
+	/* Configure default format based on node type */
+	if (queue_desc->image) {
+		mtk_cam_dev_set_img_fmt(dev,
+					&dest->fmt.pix_mp,
+					&default_fmt->fmt.pix_mp,
+					queue_desc->id);
+	} else {
+		dest->fmt.meta.dataformat = default_fmt->fmt.meta.dataformat;
+		dest->fmt.meta.buffersize = default_fmt->fmt.meta.buffersize;
+	}
+}
+
+static int mtk_cam_isp_open(struct file *file)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+	struct device *dev = &cam_dev->pdev->dev;
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+	int ret;
+
+	mutex_lock(&cam_dev->lock);
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto unlock;
+
+	ret = v4l2_pipeline_pm_use(&node->vdev.entity, 1);
+	if (ret)
+		dev_err(dev, "%s fail:%d", __func__, ret);
+
+unlock:
+	mutex_unlock(&cam_dev->lock);
+
+	return ret;
+}
+
+static int mtk_cam_isp_release(struct file *file)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	mutex_lock(&cam_dev->lock);
+	v4l2_pipeline_pm_use(&node->vdev.entity, 0);
+	vb2_fop_release(file);
+	mutex_unlock(&cam_dev->lock);
+
+	return 0;
+}
+
+static struct v4l2_subdev *
+mtk_cam_cio_get_active_sensor(struct mtk_cam_dev *cam_dev)
+{
+	struct media_device *mdev = cam_dev->seninf->entity.graph_obj.mdev;
+	struct media_entity *entity;
+	struct device *dev = &cam_dev->pdev->dev;
+	struct v4l2_subdev *sensor;
+
+	media_device_for_each_entity(entity, mdev) {
+		dev_dbg(dev, "media entity: %s:0x%x\n",
+			entity->name, entity->function);
+		if (entity->function == MEDIA_ENT_F_CAM_SENSOR &&
+		    entity->stream_count) {
+			sensor = media_entity_to_v4l2_subdev(entity);
+			dev_dbg(dev, "Sensor found: %s\n", entity->name);
+			break;
+		}
+	}
+
+	if (!sensor)
+		dev_err(dev, "Sensor is not connected\n");
+
+	return sensor;
+}
+
+static int mtk_cam_cio_stream_on(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
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
+	cam_dev->sensor = mtk_cam_cio_get_active_sensor(cam_dev);
+	if (!cam_dev->sensor)
+		return -EPERM;
+
+	ret = mtk_isp_config(dev);
+	if (ret)
+		return -EPERM;
+
+	/* Seninf must stream on first */
+	ret = v4l2_subdev_call(cam_dev->seninf, video, s_stream, 1);
+	if (ret) {
+		dev_err(dev, "%s stream on failed:%d\n",
+			cam_dev->seninf->entity.name, ret);
+		return -EPERM;
+	}
+
+	ret = v4l2_subdev_call(cam_dev->sensor, video, s_stream, 1);
+	if (ret) {
+		dev_err(dev, "%s stream on failed:%d\n",
+			cam_dev->sensor->entity.name, ret);
+		goto fail_sensor_on;
+	}
+
+	cam_dev->streaming = true;
+	mtk_cam_req_try_isp_queue(cam_dev, NULL);
+	isp_composer_stream(dev, 1);
+	dev_dbg(dev, "streamed on Pass 1\n");
+
+	return 0;
+
+fail_sensor_on:
+	v4l2_subdev_call(cam_dev->seninf, video, s_stream, 0);
+
+	return -EPERM;
+}
+
+static int mtk_cam_cio_stream_off(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	int ret;
+
+	if (!cam_dev->streaming) {
+		dev_warn(dev, "already stream off");
+		return 0;
+	}
+
+	ret = v4l2_subdev_call(cam_dev->sensor, video, s_stream, 0);
+	if (ret) {
+		dev_err(dev, "%s stream off failed:%d\n",
+			cam_dev->sensor->entity.name, ret);
+		return -EPERM;
+	}
+
+	ret = v4l2_subdev_call(cam_dev->seninf, video, s_stream, 0);
+	if (ret) {
+		dev_err(dev, "%s stream off failed:%d\n",
+			cam_dev->seninf->entity.name, ret);
+		return -EPERM;
+	}
+
+	isp_composer_stream(dev, 0);
+	cam_dev->streaming = false;
+	dev_dbg(dev, "streamed off Pass 1\n");
+
+	return 0;
+}
+
+static int mtk_cam_sd_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
+
+	if (enable)
+		return mtk_cam_cio_stream_on(cam_dev);
+	else
+		return mtk_cam_cio_stream_off(cam_dev);
+}
+
+static int mtk_cam_sd_subscribe_event(struct v4l2_subdev *subdev,
+				      struct v4l2_fh *fh,
+				      struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mtk_cam_sd_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
+
+	dev_dbg(&cam_dev->pdev->dev, "%s:%d", __func__, on);
+
+	return on ? mtk_isp_power_init(cam_dev) :
+		    mtk_isp_power_release(&cam_dev->pdev->dev);
+}
+
+static int mtk_cam_media_link_setup(struct media_entity *entity,
+				    const struct media_pad *local,
+				    const struct media_pad *remote, u32 flags)
+{
+	struct mtk_cam_dev *cam_dev =
+		container_of(entity, struct mtk_cam_dev, subdev.entity);
+	u32 pad = local->index;
+
+	dev_dbg(&cam_dev->pdev->dev, "%s: %d -> %d flags:0x%x\n",
+		__func__, pad, remote->index, flags);
+
+	if (pad < MTK_CAM_P1_TOTAL_NODES)
+		cam_dev->vdev_nodes[pad].enabled =
+			!!(flags & MEDIA_LNK_FL_ENABLED);
+
+	return 0;
+}
+
+static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *mtk_cam_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct device *dev = &mtk_cam_dev->pdev->dev;
+	struct mtk_cam_dev_buffer *buf;
+
+	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+
+	dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
+		__func__,
+		node->id,
+		buf->vbb.request_fd,
+		buf->vbb.vb2_buf.index);
+
+	/* For request buffers en-queue, handled in mtk_cam_req_try_queue */
+	if (vb->vb2_queue->uses_requests)
+		return;
+
+	/* Added the buffer into the tracking list */
+	spin_lock(&node->slock);
+	list_add_tail(&buf->list, &node->pending_list);
+	spin_unlock(&node->slock);
+
+	mtk_isp_enqueue(dev, node->desc.dma_port, buf);
+}
+
+static int mtk_cam_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct device *smem_dev = cam_dev->smem_dev;
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	struct mtk_cam_dev_buffer *buf;
+
+	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
+	buf->node_id = node->id;
+	buf->daddr = vb2_dma_contig_plane_dma_addr(&buf->vbb.vb2_buf, 0);
+	buf->scp_addr = 0;
+
+	/* scp address is only valid for meta input buffer */
+	if (node->desc.smem_alloc)
+		buf->scp_addr = mtk_cam_smem_iova_to_scp_addr(smem_dev,
+							      buf->daddr);
+
+	return 0;
+}
+
+static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+
+	if (vb->vb2_queue->type == V4L2_BUF_TYPE_META_OUTPUT ||
+	    vb->vb2_queue->type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = fmt->fmt.meta.buffersize;
+	else
+		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+	vb2_set_plane_payload(vb, 0, size);
+
+	return 0;
+}
+
+static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	unsigned int max_buffer_count = node->desc.max_buf_count;
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+
+	/* Check the limitation of buffer size */
+	if (max_buffer_count)
+		*num_buffers = clamp_val(*num_buffers, 1, max_buffer_count);
+
+	if (vq->type == V4L2_BUF_TYPE_META_OUTPUT ||
+	    vq->type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = fmt->fmt.meta.buffersize;
+	else
+		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	/* Add for q.create_bufs with fmt.g_sizeimage(p) / 2 test */
+	if (*num_planes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+	} else {
+		*num_planes = 1;
+		sizes[0] = size;
+	}
+
+	return 0;
+}
+
+static void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam_dev,
+					   struct mtk_cam_video_device *node,
+					   enum vb2_buffer_state state)
+{
+	struct mtk_cam_dev_buffer *b, *b0;
+	struct mtk_cam_dev_request *req, *req0;
+	struct media_request_object *obj, *obj0;
+	struct vb2_buffer *vb;
+
+	dev_dbg(&cam_dev->pdev->dev, "%s: node:%s", __func__, node->vdev.name);
+
+	/* Return all buffers */
+	spin_lock(&node->slock);
+	list_for_each_entry_safe(b, b0, &node->pending_list, list) {
+		vb = &b->vbb.vb2_buf;
+		if (vb->state == VB2_BUF_STATE_ACTIVE)
+			vb2_buffer_done(vb, state);
+		list_del(&b->list);
+	}
+	spin_unlock(&node->slock);
+
+	spin_lock(&cam_dev->req_lock);
+	list_for_each_entry_safe(req, req0, &cam_dev->req_list, list) {
+		list_for_each_entry_safe(obj, obj0, &req->req.objects, list) {
+			vb = container_of(obj, struct vb2_buffer, req_obj);
+			if (vb->state == VB2_BUF_STATE_ACTIVE)
+				vb2_buffer_done(vb, state);
+		}
+		list_del(&req->list);
+	}
+	spin_unlock(&cam_dev->req_lock);
+
+	if (node->vbq.uses_requests)
+		mtk_isp_req_flush_buffers(&cam_dev->pdev->dev);
+}
+
+static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
+				       unsigned int count)
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	struct device *dev = &cam_dev->pdev->dev;
+	unsigned int node_count = cam_dev->subdev.entity.use_count;
+	int ret;
+
+	if (!node->enabled) {
+		dev_err(dev, "Node:%d is not enable\n", node->id);
+		ret = -ENOLINK;
+		goto fail_no_link;
+	}
+
+	dev_dbg(dev, "%s: count info:%d:%d", __func__,
+		atomic_read(&cam_dev->streamed_node_count), node_count);
+
+	if (atomic_inc_return(&cam_dev->streamed_node_count) < node_count)
+		return 0;
+
+	/* Start streaming of the whole pipeline now */
+	ret = media_pipeline_start(&node->vdev.entity, &cam_dev->pipeline);
+	if (ret) {
+		dev_err(dev, "%s: Node:%d failed\n", __func__, node->id);
+		goto fail_start_pipeline;
+	}
+
+	/* Stream on sub-devices node */
+	ret = v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 1);
+	if (ret) {
+		dev_err(dev, "Node:%d s_stream on failed:%d\n", node->id, ret);
+		goto fail_stream_on;
+	}
+
+	return 0;
+
+fail_stream_on:
+	media_pipeline_stop(&node->vdev.entity);
+fail_start_pipeline:
+	atomic_dec(&cam_dev->streamed_node_count);
+fail_no_link:
+	mtk_cam_vb2_return_all_buffers(cam_dev, node, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
+	struct device *dev = &cam_dev->pdev->dev;
+
+	if (!node->enabled)
+		return;
+
+	mtk_cam_vb2_return_all_buffers(cam_dev, node, VB2_BUF_STATE_ERROR);
+
+	dev_dbg(dev, "%s: count info:%d", __func__,
+		cam_dev->subdev.entity.stream_count);
+
+	/* Check the first node to stream-off */
+	if (!cam_dev->subdev.entity.stream_count)
+		return;
+
+	media_pipeline_stop(&node->vdev.entity);
+
+	if (v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 0))
+		dev_err(dev, "failed to stop streaming\n");
+}
+
+static void mtk_cam_vb2_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req,
+				   dev->v4l2_dev.ctrl_handler);
+}
+
+static int mtk_cam_vidioc_querycap(struct file *file, void *fh,
+				   struct v4l2_capability *cap)
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
+static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
+				   struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->index >= node->desc.num_fmts)
+		return -EINVAL;
+
+	f->pixelformat = node->desc.fmts[f->index].fmt.pix_mp.pixelformat;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (!node->desc.num_fmts)
+		return -EINVAL;
+
+	f->fmt = node->vdev_fmt.fmt;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
+				  struct v4l2_format *in_fmt)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+	const struct v4l2_format *dev_fmt;
+	__u32  width, height;
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
+		mtk_cam_dev_set_img_fmt(&cam_dev->pdev->dev,
+					&in_fmt->fmt.pix_mp,
+					&dev_fmt->fmt.pix_mp,
+					node->id);
+	} else {
+		mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
+					     &node->desc, in_fmt);
+	}
+	in_fmt->fmt.pix_mp.width = clamp_t(u32,
+					   width,
+					   CAM_MIN_WIDTH,
+					   in_fmt->fmt.pix_mp.width);
+	in_fmt->fmt.pix_mp.height = clamp_t(u32,
+					    height,
+					    CAM_MIN_HEIGHT,
+					    in_fmt->fmt.pix_mp.height);
+	mtk_cam_dev_cal_mplane_fmt(&cam_dev->pdev->dev,
+				   &in_fmt->fmt.pix_mp, node->id);
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_cam_dev *cam_dev = video_drvdata(file);
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (cam_dev->streaming)
+		return -EBUSY;
+
+	/* Get the valid format */
+	mtk_cam_vidioc_try_fmt(file, fh, f);
+
+	/* Configure to video device */
+	mtk_cam_dev_set_img_fmt(&cam_dev->pdev->dev,
+				&node->vdev_fmt.fmt.pix_mp,
+				&f->fmt.pix_mp,
+				node->id);
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_enum_input(struct file *file, void *fh,
+				     struct v4l2_input *input)
+{
+	if (input->index)
+		return -EINVAL;
+
+	strscpy(input->name, "camera", sizeof(input->name));
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_g_input(struct file *file, void *fh,
+				  unsigned int *input)
+{
+	*input = 0;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_s_input(struct file *file,
+				  void *fh, unsigned int input)
+{
+	return input == 0 ? 0 : -EINVAL;
+}
+
+static int mtk_cam_vidioc_enum_framesizes(struct file *filp, void *priv,
+					  struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(filp);
+	const struct v4l2_format *dev_fmt;
+
+	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, sizes->pixel_format);
+	if (!dev_fmt || sizes->index)
+		return -EINVAL;
+
+	sizes->type = node->desc.frmsizes->type;
+	memcpy(&sizes->stepwise, &node->desc.frmsizes->stepwise,
+	       sizeof(sizes->stepwise));
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_meta_enum_fmt(struct file *file, void *fh,
+					struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	if (f->index)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc.description,
+		sizeof(node->desc.description));
+	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_g_meta_fmt(struct file *file, void *fh,
+				     struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
+
+	f->fmt.meta.dataformat = node->vdev_fmt.fmt.meta.dataformat;
+	f->fmt.meta.buffersize = node->vdev_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops mtk_cam_subdev_core_ops = {
+	.subscribe_event = mtk_cam_sd_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+	.s_power = mtk_cam_sd_s_power,
+};
+
+static const struct v4l2_subdev_video_ops mtk_cam_subdev_video_ops = {
+	.s_stream =  mtk_cam_sd_s_stream,
+};
+
+static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
+	.core = &mtk_cam_subdev_core_ops,
+	.video = &mtk_cam_subdev_video_ops,
+};
+
+static const struct media_entity_operations mtk_cam_media_ops = {
+	.link_setup = mtk_cam_media_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct vb2_ops mtk_cam_vb2_ops = {
+	.queue_setup = mtk_cam_vb2_queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_init = mtk_cam_vb2_buf_init,
+	.buf_prepare = mtk_cam_vb2_buf_prepare,
+	.start_streaming = mtk_cam_vb2_start_streaming,
+	.stop_streaming = mtk_cam_vb2_stop_streaming,
+	.buf_queue = mtk_cam_vb2_buf_queue,
+	.buf_request_complete = mtk_cam_vb2_buf_request_complete,
+};
+
+static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
+	.unlocked_ioctl = video_ioctl2,
+	.open = mtk_cam_isp_open,
+	.release = mtk_cam_isp_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+static const struct media_device_ops mtk_cam_media_req_ops = {
+	.link_notify = v4l2_pipeline_link_notify,
+	.req_alloc = mtk_cam_req_alloc,
+	.req_free = mtk_cam_req_free,
+	.req_validate = vb2_request_validate,
+	.req_queue = mtk_cam_req_queue,
+};
+
+static int mtk_cam_media_register(struct device *dev,
+				  struct media_device *media_dev)
+{
+	media_dev->dev = dev;
+	strscpy(media_dev->model, MTK_CAM_DEV_P1_NAME,
+		sizeof(media_dev->model));
+	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
+		 "platform:%s", dev_name(dev));
+	media_dev->hw_revision = 0;
+	media_device_init(media_dev);
+	media_dev->ops = &mtk_cam_media_req_ops;
+
+	return media_device_register(media_dev);
+}
+
+static int mtk_cam_video_register_device(struct mtk_cam_dev *cam_dev, u32 i)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	struct mtk_cam_video_device *node = &cam_dev->vdev_nodes[i];
+	struct video_device *vdev = &node->vdev;
+	struct vb2_queue *vbq = &node->vbq;
+	u32 output = !cam_dev->vdev_nodes[i].desc.capture;
+	u32 link_flags = cam_dev->vdev_nodes[i].desc.link_flags;
+	int ret;
+
+	cam_dev->subdev_pads[i].flags = output ?
+		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize media entities */
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
+	if (ret) {
+		dev_err(dev, "failed initialize media pad:%d\n", ret);
+		return ret;
+	}
+	node->enabled = false;
+	node->id = i;
+	node->vdev_pad.flags = cam_dev->subdev_pads[i].flags;
+	mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
+				     &node->desc,
+				     &node->vdev_fmt);
+
+	/* Initialize vbq */
+	vbq->type = node->vdev_fmt.type;
+	if (vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
+		vbq->io_modes = VB2_MMAP;
+	else
+		vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+
+	if (node->desc.smem_alloc) {
+		vbq->bidirectional = 1;
+		vbq->dev = cam_dev->smem_dev;
+	} else {
+		vbq->dev = &cam_dev->pdev->dev;
+	}
+
+	if (vbq->type == V4L2_BUF_TYPE_META_CAPTURE)
+		vdev->entity.function =
+			MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
+	vbq->ops = &mtk_cam_vb2_ops;
+	vbq->mem_ops = &vb2_dma_contig_memops;
+	vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
+	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vbq->min_buffers_needed = 0;	/* Can streamon w/o buffers */
+	/* Put the process hub sub device in the vb2 private data */
+	vbq->drv_priv = cam_dev;
+	vbq->lock = &node->lock;
+	vbq->supports_requests = true;
+
+	ret = vb2_queue_init(vbq);
+	if (ret) {
+		dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
+		goto fail_vb2_queue;
+	}
+
+	/* Initialize vdev */
+	snprintf(vdev->name, sizeof(vdev->name), "%s %s",
+		 MTK_CAM_DEV_P1_NAME, node->desc.name);
+	/* set cap/type/ioctl_ops of the video device */
+	vdev->device_caps = node->desc.cap | V4L2_CAP_STREAMING;
+	vdev->ioctl_ops = node->desc.ioctl_ops;
+	vdev->fops = &mtk_cam_v4l2_fops;
+	vdev->release = video_device_release_empty;
+	vdev->lock = &node->lock;
+	vdev->v4l2_dev = &cam_dev->v4l2_dev;
+	vdev->queue = &node->vbq;
+	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
+	vdev->entity.ops = NULL;
+	/* Enable private control for image video devices */
+	if (node->desc.image) {
+		mtk_cam_ctrl_init(cam_dev, &node->ctrl_handler);
+		vdev->ctrl_handler = &node->ctrl_handler;
+	}
+	video_set_drvdata(vdev, cam_dev);
+	dev_dbg(dev, "register vdev:%d:%s\n", i, vdev->name);
+
+	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (ret) {
+		dev_err(dev, "failed to register vde:%d\n", ret);
+		goto fail_vdev;
+	}
+
+	/* Create link between video node and the subdev pad */
+	if (output) {
+		ret = media_create_pad_link(&vdev->entity, 0,
+					    &cam_dev->subdev.entity,
+					    i, link_flags);
+	} else {
+		ret = media_create_pad_link(&cam_dev->subdev.entity,
+					    i, &vdev->entity, 0,
+					    link_flags);
+	}
+	if (ret)
+		goto fail_link;
+
+	/* Initialize miscellaneous variables */
+	mutex_init(&node->lock);
+	spin_lock_init(&node->slock);
+	INIT_LIST_HEAD(&node->pending_list);
+
+	return 0;
+
+fail_link:
+	video_unregister_device(vdev);
+fail_vdev:
+	vb2_queue_release(vbq);
+fail_vb2_queue:
+	media_entity_cleanup(&vdev->entity);
+
+	return ret;
+}
+
+static int mtk_cam_mem2mem2_v4l2_register(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	/* Total pad numbers is video devices + one seninf pad */
+	unsigned int num_subdev_pads = MTK_CAM_CIO_PAD_SINK + 1;
+	unsigned int i;
+	int ret;
+
+	ret = mtk_cam_media_register(dev,
+				     &cam_dev->media_dev);
+	if (ret) {
+		dev_err(dev, "failed to register media device:%d\n", ret);
+		return ret;
+	}
+	dev_info(dev, "Register media device: %s, 0x%pK",
+		 MTK_CAM_DEV_P1_NAME, cam_dev->media_dev);
+
+	/* Set up v4l2 device */
+	cam_dev->v4l2_dev.mdev = &cam_dev->media_dev;
+	ret = v4l2_device_register(dev, &cam_dev->v4l2_dev);
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 device:%d\n", ret);
+		goto fail_v4l2_dev;
+	}
+	dev_info(dev, "Register v4l2 device: 0x%pK", cam_dev->v4l2_dev);
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
+	cam_dev->subdev_pads[MTK_CAM_CIO_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
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
+
+	ret = v4l2_device_register_subdev(&cam_dev->v4l2_dev, &cam_dev->subdev);
+	if (ret) {
+		dev_err(dev, "failed initialize subdev:%d\n", ret);
+		goto fail_subdev;
+	}
+	dev_info(dev, "register subdev: %s\n", cam_dev->subdev.name);
+
+	/* Create video nodes and links */
+	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
+		ret = mtk_cam_video_register_device(cam_dev, i);
+		if (ret)
+			goto fail_video_register;
+	}
+
+	vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
+
+	return 0;
+
+fail_video_register:
+	i--;
+	for (; i >= 0; i--) {
+		video_unregister_device(&cam_dev->vdev_nodes[i].vdev);
+		media_entity_cleanup(&cam_dev->vdev_nodes[i].vdev.entity);
+		mutex_destroy(&cam_dev->vdev_nodes[i].lock);
+	}
+fail_subdev:
+	media_entity_cleanup(&cam_dev->subdev.entity);
+fail_subdev_pads:
+	v4l2_device_unregister(&cam_dev->v4l2_dev);
+fail_v4l2_dev:
+	dev_err(dev, "fail_v4l2_dev mdev: 0x%pK:%d", &cam_dev->media_dev, ret);
+	media_device_unregister(&cam_dev->media_dev);
+	media_device_cleanup(&cam_dev->media_dev);
+
+	return ret;
+}
+
+static int mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int i;
+	struct mtk_cam_video_device *dev;
+
+	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
+		dev = &cam_dev->vdev_nodes[i];
+		video_unregister_device(&dev->vdev);
+		media_entity_cleanup(&dev->vdev.entity);
+		mutex_destroy(&dev->lock);
+		if (dev->desc.image)
+			v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	}
+
+	vb2_dma_contig_clear_max_seg_size(&cam_dev->pdev->dev);
+
+	v4l2_device_unregister_subdev(&cam_dev->subdev);
+	media_entity_cleanup(&cam_dev->subdev.entity);
+	kfree(cam_dev->subdev_pads);
+
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
+				    MTK_CAM_CIO_PAD_SRC,
+				    &cam_dev->subdev.entity,
+				    MTK_CAM_CIO_PAD_SINK,
+				    0);
+	if (ret) {
+		dev_err(dev, "fail to create pad link %s %s err:%d\n",
+			cam_dev->seninf->entity.name,
+			cam_dev->subdev.entity.name,
+			ret);
+		return ret;
+	}
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
+	cam_dev->seninf = NULL;
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
+static int mtk_cam_v4l2_async_register(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	int ret;
+
+	ret = v4l2_async_notifier_parse_fwnode_endpoints(dev,
+		&cam_dev->notifier, sizeof(struct v4l2_async_subdev),
+		NULL);
+	if (ret)
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
+static void mtk_cam_v4l2_async_unregister(struct mtk_cam_dev *cam_dev)
+{
+	v4l2_async_notifier_unregister(&cam_dev->notifier);
+	v4l2_async_notifier_cleanup(&cam_dev->notifier);
+}
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_vidioc_querycap,
+	.vidioc_enum_framesizes = mtk_cam_vidioc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap_mplane = mtk_cam_vidioc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_cam_vidioc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_cam_vidioc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_cam_vidioc_try_fmt,
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
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_vidioc_querycap,
+	.vidioc_enum_fmt_meta_cap = mtk_cam_vidioc_meta_enum_fmt,
+	.vidioc_g_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
+	.vidioc_s_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
+	.vidioc_try_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
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
+	.vidioc_querycap = mtk_cam_vidioc_querycap,
+	.vidioc_enum_fmt_meta_out = mtk_cam_vidioc_meta_enum_fmt,
+	.vidioc_g_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
+	.vidioc_s_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
+	.vidioc_try_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
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
+static const struct v4l2_format meta_fmts[] = {
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
+static const struct v4l2_format stream_out_fmts[] = {
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
+static const struct v4l2_format bin_out_fmts[] = {
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
+static const struct v4l2_frmsizeenum img_frm_size_nums[] = {
+	{
+		.index = 0,
+		.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+		.stepwise = {
+			.max_width = IMG_MAX_WIDTH,
+			.min_width = IMG_MIN_WIDTH,
+			.max_height = IMG_MAX_HEIGHT,
+			.min_height = IMG_MIN_HEIGHT,
+			.step_height = 1,
+			.step_width = 1,
+		},
+	},
+	{
+		.index = 0,
+		.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+		.stepwise = {
+			.max_width = RRZ_MAX_WIDTH,
+			.min_width = RRZ_MIN_WIDTH,
+			.max_height = RRZ_MAX_HEIGHT,
+			.min_height = RRZ_MIN_HEIGHT,
+			.step_height = 1,
+			.step_width = 1,
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
+		.default_fmt_idx = 1,
+		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
+		.frmsizes = &img_frm_size_nums[0],
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
+		.frmsizes = &img_frm_size_nums[1],
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
+		.link_flags = 0,
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
+		.link_flags = 0,
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
+/* The helper to configure the device context */
+static void mtk_cam_dev_queue_setup(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int i, node_idx;
+
+	node_idx = 0;
+
+	/* Setup the output queue */
+	for (i = 0; i < MTK_CAM_P1_TOTAL_OUTPUT; i++)
+		cam_dev->vdev_nodes[node_idx++].desc = output_queues[i];
+
+	/* Setup the capture queue */
+	for (i = 0; i < MTK_CAM_P1_TOTAL_CAPTURE; i++)
+		cam_dev->vdev_nodes[node_idx++].desc = capture_queues[i];
+}
+
+int mtk_cam_dev_init(struct platform_device *pdev,
+		     struct mtk_cam_dev *cam_dev)
+{
+	int ret;
+
+	cam_dev->pdev = pdev;
+	mtk_cam_dev_queue_setup(cam_dev);
+	/* v4l2 sub-device registration */
+
+	dev_dbg(&cam_dev->pdev->dev, "mem2mem2.name: %s\n",
+		MTK_CAM_DEV_P1_NAME);
+	ret = mtk_cam_mem2mem2_v4l2_register(cam_dev);
+	if (ret)
+		return ret;
+
+	ret = mtk_cam_v4l2_async_register(cam_dev);
+	if (ret) {
+		mtk_cam_v4l2_unregister(cam_dev);
+		return ret;
+	}
+
+	spin_lock_init(&cam_dev->req_lock);
+	INIT_LIST_HEAD(&cam_dev->req_list);
+	mutex_init(&cam_dev->lock);
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
+	mutex_destroy(&cam_dev->lock);
+
+	return 0;
+}
+
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
new file mode 100644
index 000000000000..825cdf20643a
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_DEV_V4L2_H__
+#define __MTK_CAM_DEV_V4L2_H__
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
+#define MTK_CAM_DEV_P1_NAME			"MTK-ISP-P1-V4L2"
+
+#define MTK_CAM_P1_META_IN_0			0
+#define MTK_CAM_P1_TOTAL_OUTPUT		1
+
+#define MTK_CAM_P1_MAIN_STREAM_OUT		1
+#define MTK_CAM_P1_PACKED_BIN_OUT		2
+#define MTK_CAM_P1_META_OUT_0			3
+#define MTK_CAM_P1_META_OUT_1			4
+#define MTK_CAM_P1_META_OUT_2			5
+#define MTK_CAM_P1_META_OUT_3			6
+#define MTK_CAM_P1_TOTAL_CAPTURE		6
+
+#define MTK_CAM_P1_TOTAL_NODES			7
+
+struct mtk_cam_dev_request {
+	struct media_request	req;
+	struct list_head	list;
+};
+
+struct mtk_cam_dev_buffer {
+	struct vb2_v4l2_buffer	vbb;
+	struct list_head	list;
+	/* Intenal part */
+	dma_addr_t		daddr;
+	dma_addr_t		scp_addr;
+	unsigned int		node_id;
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
+ * @frmsizes:	supported frame size number
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
+	const struct v4l2_format *fmts;
+	const struct v4l2_frmsizeenum *frmsizes;
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
+	struct mtk_cam_dev_node_desc desc;
+	struct video_device vdev;
+	struct media_pad vdev_pad;
+	struct vb2_queue vbq;
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
+ * @vdev_nodes: The array list of mtk_cam_video_device nodes
+ * @seninf:	Pointer to the seninf sub-device
+ * @sensor:	Pointer to the active sensor V4L2 sub-device when streaming on
+ * @lock:       The mutex protecting video device open/release operations
+ * @streaming:	Indicate the overall streaming status is on or off
+ * @streamed_node_count: The number of V4L2 video device nodes are streaming on
+ * @req_list:	Lins to keep media requests before streaming on
+ * @req_lock:	Protect the req_list data
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
+	struct mtk_cam_video_device vdev_nodes[MTK_CAM_P1_TOTAL_NODES];
+	struct v4l2_subdev *seninf;
+	struct v4l2_subdev *sensor;
+	/* protect video device open/release operations */
+	struct mutex lock;
+	unsigned int streaming:1;
+	atomic_t streamed_node_count;
+	struct list_head req_list;
+	/* protect for req_list */
+	spinlock_t req_lock;
+};
+
+int mtk_cam_dev_init(struct platform_device *pdev,
+		     struct mtk_cam_dev *cam_dev);
+int mtk_cam_dev_release(struct platform_device *pdev,
+			struct mtk_cam_dev *cam_dev);
+#endif /* __MTK_CAM_DEV_V4L2_H__ */
-- 
2.18.0

