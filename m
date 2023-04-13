Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2E36E0AC9
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjDMJzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjDMJzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:55:37 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B6493DD
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379722; x=1712915722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OsSJjm8M2tOnrkQU4kr3wg6p4zDiXLJfMLeNLibx3Eo=;
  b=KPZFXbLIPtQAT6EORouo8dMVdrUKzh3JePWCGUrxZV012xShK7IkKhgE
   YRncee6rxcgMq2xHuBIFF6u2e8KApUzScqcj2y5LWagWfqumaDGaU6jOx
   fYDI4oczBaGUZ5glTGgVhtyvkFLKzcm6R/CdUCv4MslGVYX6nvHrNzHUL
   4TEKM6cXBU6FZykRlZTNEv5URexIhCr6KyfPMrcLD4UDm/N8i0QFvnhV6
   MFYEz1JcP0pel4C9oRckt/9aFu9vxAfghSjpo90a/4A3MWYCQlux1PsPc
   K+zhTjMgBbMbrxJednOEkTALolvIi0PHGHECYTlITeQCr6qI7DHHLvJ0/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371993097"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371993097"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639600183"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639600183"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:55:10 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 11/14] media: intel/ipu6: input system video capture nodes
Date:   Thu, 13 Apr 2023 18:04:26 +0800
Message-Id: <20230413100429.919622-12-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Register v4l2 video device and setup the vb2 queue to
support basic video capture. Video streaming callback
will trigger the input system driver to construct a
input system stream configuration for firmware based on
data type and stream ID and then queue buffers to firmware
to do capture.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  869 +++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1132 +++++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  120 ++
 4 files changed, 2218 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
new file mode 100644
index 000000000000..8aa125626fc5
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -0,0 +1,869 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-ioctl.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-isys-video.h"
+
+static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+		       unsigned int *num_planes, unsigned int sizes[],
+		       struct device *alloc_devs[])
+{
+	struct ipu6_isys_queue *aq = vb2_queue_to_ipu6_isys_queue(q);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	bool use_fmt = false;
+	unsigned int i;
+	u32 size;
+
+	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
+	if (!*num_planes) {
+		use_fmt = true;
+		*num_planes = av->mpix.num_planes;
+	}
+
+	for (i = 0; i < *num_planes; i++) {
+		size = av->mpix.plane_fmt[i].sizeimage;
+		if (use_fmt) {
+			sizes[i] = size;
+		} else if (sizes[i] < size) {
+			dev_dbg(&av->isys->adev->dev,
+				"%s: queue setup: plane %d size %u < %u\n",
+				av->vdev.name, i, sizes[i], size);
+			return -EINVAL;
+		}
+
+		alloc_devs[i] = aq->dev;
+	}
+
+	return 0;
+}
+
+int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
+{
+	struct ipu6_isys_queue *aq =
+		vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+
+	dev_dbg(&av->isys->adev->dev,
+		"buffer: %s: configured size %u, buffer size %lu\n",
+		av->vdev.name,
+		av->mpix.plane_fmt[0].sizeimage, vb2_plane_size(vb, 0));
+
+	if (av->mpix.plane_fmt[0].sizeimage > vb2_plane_size(vb, 0))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, av->mpix.plane_fmt[0].bytesperline *
+			      av->mpix.height);
+	vb->planes[0].data_offset = 0;
+
+	return 0;
+}
+
+static int buf_prepare(struct vb2_buffer *vb)
+{
+	struct ipu6_isys_queue *aq =
+		vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+
+	if (av->isys->adev->isp->flr_done)
+		return -EIO;
+
+	return aq->buf_prepare(vb);
+}
+
+/*
+ * Queue a buffer list back to incoming or active queues. The buffers
+ * are removed from the buffer list.
+ */
+void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
+				 unsigned long op_flags,
+				 enum vb2_buffer_state state)
+{
+	struct ipu6_isys_buffer *ib, *ib_safe;
+	unsigned long flags;
+	bool first = true;
+
+	if (!bl)
+		return;
+
+	WARN_ON_ONCE(!bl->nbufs);
+	WARN_ON_ONCE(op_flags & IPU6_ISYS_BUFFER_LIST_FL_ACTIVE &&
+		     op_flags & IPU6_ISYS_BUFFER_LIST_FL_INCOMING);
+
+	list_for_each_entry_safe(ib, ib_safe, &bl->head, head) {
+		struct ipu6_isys_video *av;
+		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+		struct ipu6_isys_queue *aq =
+			vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+
+		if (WARN_ON_ONCE(ib->type != IPU6_ISYS_VIDEO_BUFFER))
+			continue;
+
+		av = ipu6_isys_queue_to_video(aq);
+		spin_lock_irqsave(&aq->lock, flags);
+		list_del(&ib->head);
+		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_ACTIVE)
+			list_add(&ib->head, &aq->active);
+		else if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_INCOMING)
+			list_add_tail(&ib->head, &aq->incoming);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_SET_STATE)
+			vb2_buffer_done(vb, state);
+
+		if (first) {
+			dev_dbg(&av->isys->adev->dev,
+				"queue buf list %p flags %lx, s %d, %d bufs\n",
+				bl, op_flags, state, bl->nbufs);
+			first = false;
+		}
+
+		bl->nbufs--;
+	}
+
+	WARN_ON(bl->nbufs);
+}
+
+/*
+ * flush_firmware_streamon_fail() - Flush in cases where requests may
+ * have been queued to firmware and the *firmware streamon fails for a
+ * reason or another.
+ */
+static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
+{
+	struct ipu6_isys_queue *aq;
+	unsigned long flags;
+
+	lockdep_assert_held(&stream->mutex);
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+		struct ipu6_isys_buffer *ib, *ib_safe;
+
+		spin_lock_irqsave(&aq->lock, flags);
+		list_for_each_entry_safe(ib, ib_safe, &aq->active, head) {
+			struct vb2_buffer *vb =
+				ipu6_isys_buffer_to_vb2_buffer(ib);
+
+			list_del(&ib->head);
+			if (av->streaming) {
+				dev_dbg(&av->isys->adev->dev,
+					"%s: queue buffer %u back to incoming\n",
+					av->vdev.name, vb->index);
+				/* Queue already streaming, return to driver. */
+				list_add(&ib->head, &aq->incoming);
+				continue;
+			}
+			/* Queue not yet streaming, return to user. */
+			dev_dbg(&av->isys->adev->dev,
+				"%s: return %u back to videobuf2\n",
+				av->vdev.name, vb->index);
+			vb2_buffer_done(ipu6_isys_buffer_to_vb2_buffer(ib),
+					VB2_BUF_STATE_QUEUED);
+		}
+		spin_unlock_irqrestore(&aq->lock, flags);
+	}
+}
+
+/*
+ * Attempt obtaining a buffer list from the incoming queues, a list of
+ * buffers that contains one entry from each video buffer queue. If
+ * all queues have no buffers, the buffers that were already dequeued
+ * are returned to their queues.
+ */
+static int buffer_list_get(struct ipu6_isys_stream *stream,
+			   struct ipu6_isys_buffer_list *bl)
+{
+	struct ipu6_isys_queue *aq;
+	unsigned long flags;
+	int ret = 0;
+
+	bl->nbufs = 0;
+	INIT_LIST_HEAD(&bl->head);
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu6_isys_buffer *ib;
+
+		spin_lock_irqsave(&aq->lock, flags);
+		if (list_empty(&aq->incoming)) {
+			spin_unlock_irqrestore(&aq->lock, flags);
+			ret = -ENODATA;
+			goto error;
+		}
+
+		ib = list_last_entry(&aq->incoming,
+				     struct ipu6_isys_buffer, head);
+
+		dev_dbg(&stream->isys->adev->dev, "buffer: %s: buffer %u\n",
+			ipu6_isys_queue_to_video(aq)->vdev.name,
+			ipu6_isys_buffer_to_vb2_buffer(ib)->index);
+		list_del(&ib->head);
+		list_add(&ib->head, &bl->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		bl->nbufs++;
+	}
+
+	dev_dbg(&stream->isys->adev->dev, "get buffer list %p, %u buffers\n",
+		bl, bl->nbufs);
+
+	return ret;
+
+error:
+	if (!list_empty(&bl->head))
+		ipu6_isys_buffer_list_queue(bl,
+					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
+					    0);
+
+	return ret;
+}
+
+void
+ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
+				  struct ipu6_fw_isys_frame_buff_set_abi *set)
+{
+	struct ipu6_isys_queue *aq =
+		vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+
+	set->output_pins[aq->fw_output].addr =
+		vb2_dma_contig_plane_dma_addr(vb, 0);
+	set->output_pins[aq->fw_output].out_buf_id = vb->index + 1;
+}
+
+/*
+ * Convert a buffer list to a isys fw ABI framebuffer set. The
+ * buffer list is not modified.
+ */
+#define IPU6_ISYS_FRAME_NUM_THRESHOLD  (30)
+void
+ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
+			      struct ipu6_isys_stream *stream,
+			      struct ipu6_isys_buffer_list *bl)
+{
+	struct ipu6_isys_buffer *ib;
+
+	WARN_ON(!bl->nbufs);
+
+	set->send_irq_sof = 1;
+	set->send_resp_sof = 1;
+	set->send_irq_eof = 0;
+	set->send_resp_eof = 0;
+
+	if (stream->streaming)
+		set->send_irq_capture_ack = 0;
+	else
+		set->send_irq_capture_ack = 1;
+	set->send_irq_capture_done = 0;
+
+	set->send_resp_capture_ack = 1;
+	set->send_resp_capture_done = 1;
+	if (atomic_read(&stream->sequence) >= IPU6_ISYS_FRAME_NUM_THRESHOLD) {
+		set->send_resp_capture_ack = 0;
+		set->send_resp_capture_done = 0;
+	}
+
+	list_for_each_entry(ib, &bl->head, head) {
+		struct vb2_buffer *vb =
+			ipu6_isys_buffer_to_vb2_buffer(ib);
+		struct ipu6_isys_queue *aq =
+			vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+
+		if (WARN_ON_ONCE(ib->type != IPU6_ISYS_VIDEO_BUFFER))
+			continue;
+
+		if (aq->fill_frame_buf_set)
+			aq->fill_frame_buf_set(vb, set);
+	}
+}
+
+/* Start streaming for real. The buffer list must be available. */
+static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
+				  struct ipu6_isys_buffer_list *bl, bool error)
+{
+	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_buffer_list __bl;
+	int ret;
+
+	mutex_lock(&stream->isys->stream_mutex);
+	ret = ipu6_isys_video_set_streaming(av, 1, bl);
+	mutex_unlock(&stream->isys->stream_mutex);
+	if (ret)
+		goto out_requeue;
+
+	stream->streaming = 1;
+
+	bl = &__bl;
+
+	do {
+		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
+		struct isys_fw_msgs *msg;
+		enum ipu6_fw_isys_send_type send_type =
+			IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE;
+
+		ret = buffer_list_get(stream, bl);
+		if (ret < 0)
+			break;
+
+		msg = ipu6_get_fw_msg_buf(stream);
+		if (!msg)
+			return -ENOMEM;
+
+		buf = &msg->fw_msg.frame;
+
+		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
+
+		ipu6_fw_isys_dump_frame_buff_set(&stream->isys->adev->dev, buf,
+						 stream->nr_output_pins);
+
+		ipu6_isys_buffer_list_queue(bl,
+					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+
+		ret = ipu6_fw_isys_complex_cmd(stream->isys,
+					       stream->stream_handle, buf,
+					       msg->dma_addr, sizeof(*buf),
+					       send_type);
+	} while (!WARN_ON(ret));
+
+	return 0;
+
+out_requeue:
+	if (bl && bl->nbufs)
+		ipu6_isys_buffer_list_queue(bl,
+					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
+					    error ?
+					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
+					    0, error ? VB2_BUF_STATE_ERROR :
+					    VB2_BUF_STATE_QUEUED);
+	flush_firmware_streamon_fail(stream);
+
+	return ret;
+}
+
+static void buf_queue(struct vb2_buffer *vb)
+{
+	struct ipu6_isys_queue *aq =
+		vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct ipu6_isys_buffer *ib = vb2_buffer_to_ipu6_isys_buffer(vb);
+	struct media_pipeline *media_pipe =
+		media_entity_pipeline(&av->vdev.entity);
+	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
+	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_buffer_list bl;
+	struct isys_fw_msgs *msg;
+	unsigned long flags;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(&av->isys->adev->dev, "queue buffer %u for %s\n",
+		vb->index, av->vdev.name);
+
+	for (i = 0; i < vb->num_planes; i++)
+		dev_dbg(&av->isys->adev->dev, "iova: plane %u iova 0x%x\n", i,
+			(u32)vb2_dma_contig_plane_dma_addr(vb, i));
+
+	spin_lock_irqsave(&aq->lock, flags);
+	list_add(&ib->head, &aq->incoming);
+	spin_unlock_irqrestore(&aq->lock, flags);
+
+	if (!media_pipe || !vb->vb2_queue->start_streaming_called) {
+		dev_dbg(&av->isys->adev->dev,
+			"media pipeline is not ready for %s\n", av->vdev.name);
+		return;
+	}
+
+	mutex_lock(&stream->mutex);
+
+	if (stream->nr_streaming != stream->nr_queues) {
+		dev_dbg(&av->isys->adev->dev,
+			"not streaming yet, adding to incoming\n");
+		goto out;
+	}
+
+	/*
+	 * We just put one buffer to the incoming list of this queue
+	 * (above). Let's see whether all queues in the pipeline would
+	 * have a buffer.
+	 */
+	ret = buffer_list_get(stream, &bl);
+	if (ret < 0) {
+		dev_warn(&av->isys->adev->dev, "No buffers available\n");
+		goto out;
+	}
+
+	msg = ipu6_get_fw_msg_buf(stream);
+	if (!msg) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	buf = &msg->fw_msg.frame;
+
+	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
+
+	ipu6_fw_isys_dump_frame_buff_set(&stream->isys->adev->dev, buf,
+					 stream->nr_output_pins);
+
+	if (!stream->streaming) {
+		dev_dbg(&av->isys->adev->dev,
+			"got a buffer to start streaming!\n");
+		ret = ipu6_isys_stream_start(av, &bl, true);
+		if (ret)
+			dev_err(&av->isys->adev->dev,
+				"stream start failed.\n");
+		goto out;
+	}
+
+	/*
+	 * We must queue the buffers in the buffer list to the
+	 * appropriate video buffer queues BEFORE passing them to the
+	 * firmware since we could get a buffer event back before we
+	 * have queued them ourselves to the active queue.
+	 */
+	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+
+	ret = ipu6_fw_isys_complex_cmd(stream->isys, stream->stream_handle,
+				       buf, msg->dma_addr, sizeof(*buf),
+				       IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE);
+	if (ret < 0)
+		dev_err(&av->isys->adev->dev, "send stream capture failed\n");
+
+out:
+	mutex_unlock(&stream->mutex);
+}
+
+int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
+{
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct v4l2_subdev_format fmt = { 0 };
+	struct media_pad *pad =
+		media_pad_remote_pad_first(av->vdev.entity.pads);
+	struct v4l2_subdev *sd;
+	int ret;
+
+	if (!pad) {
+		dev_dbg(&av->isys->adev->dev,
+			"video node %s pad not connected\n", av->vdev.name);
+		return -ENOTCONN;
+	}
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.pad = pad->index;
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	if (fmt.format.width != av->mpix.width ||
+	    fmt.format.height != av->mpix.height) {
+		dev_dbg(&av->isys->adev->dev,
+			"wrong width or height %ux%u (%ux%u expected)\n",
+			av->mpix.width, av->mpix.height,
+			fmt.format.width, fmt.format.height);
+		return -EINVAL;
+	}
+
+	if (fmt.format.field != av->mpix.field) {
+		dev_dbg(&av->isys->adev->dev,
+			"wrong field value 0x%8.8x (0x%8.8x expected)\n",
+			av->mpix.field, fmt.format.field);
+		return -EINVAL;
+	}
+
+	if (fmt.format.code != av->pfmt->code) {
+		dev_dbg(&av->isys->adev->dev,
+			"wrong media bus code 0x%8.8x (0x%8.8x expected)\n",
+			av->pfmt->code, fmt.format.code);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void return_buffers(struct ipu6_isys_queue *aq,
+			   enum vb2_buffer_state state)
+{
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	bool need_reset = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&aq->lock, flags);
+	while (!list_empty(&aq->incoming)) {
+		struct ipu6_isys_buffer *ib = list_first_entry(&aq->incoming,
+							       struct
+							       ipu6_isys_buffer,
+							       head);
+		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+
+		list_del(&ib->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		vb2_buffer_done(vb, state);
+
+		dev_dbg(&av->isys->adev->dev,
+			"%s: stop_streaming incoming %u\n",
+			ipu6_isys_queue_to_video(vb2_queue_to_ipu6_isys_queue
+						 (vb->vb2_queue))->vdev.name,
+			vb->index);
+
+		spin_lock_irqsave(&aq->lock, flags);
+	}
+
+	/*
+	 * Something went wrong (FW crash / HW hang / not all buffers
+	 * returned from isys) if there are still buffers queued in active
+	 * queue. We have to clean up places a bit.
+	 */
+	while (!list_empty(&aq->active)) {
+		struct ipu6_isys_buffer *ib =
+			list_first_entry(&aq->active, struct ipu6_isys_buffer,
+					 head);
+		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+
+		list_del(&ib->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		vb2_buffer_done(vb, state);
+
+		dev_warn(&av->isys->adev->dev, "%s: cleaning active queue %u\n",
+			 ipu6_isys_queue_to_video(vb2_queue_to_ipu6_isys_queue
+						  (vb->vb2_queue))->vdev.name,
+			 vb->index);
+
+		spin_lock_irqsave(&aq->lock, flags);
+		need_reset = true;
+	}
+
+	spin_unlock_irqrestore(&aq->lock, flags);
+
+	if (need_reset) {
+		mutex_lock(&av->isys->mutex);
+		av->isys->need_reset = true;
+		mutex_unlock(&av->isys->mutex);
+	}
+}
+
+static int start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct ipu6_isys_queue *aq = vb2_queue_to_ipu6_isys_queue(q);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct ipu6_isys_buffer_list __bl, *bl = NULL;
+	struct ipu6_isys_stream *stream;
+	int ret;
+
+	dev_dbg(&av->isys->adev->dev,
+		"stream: %s: width %u, height %u, css pixelformat %u\n",
+		av->vdev.name, av->mpix.width, av->mpix.height,
+		av->pfmt->css_pixelformat);
+
+	ret = video_device_pipeline_alloc_start(&av->vdev);
+	if (ret < 0) {
+		dev_dbg(&av->isys->adev->dev, "media pipeline start failed\n");
+		goto out_return_buffers;
+	}
+
+	ret = aq->link_fmt_validate(aq);
+	if (ret) {
+		dev_dbg(&av->isys->adev->dev,
+			"%s: link format validation failed (%d)\n",
+			av->vdev.name, ret);
+		goto out_pipeline_stop;
+	}
+
+	/* every ipu6_isys_stream is only enabled once */
+	av->stream = ipu6_isys_get_stream(av->isys);
+	if (!av->stream) {
+		dev_err(&av->isys->adev->dev,
+			"no available stream for firmware\n");
+		goto out_pipeline_stop;
+	}
+
+	stream = av->stream;
+	mutex_lock(&stream->mutex);
+	if (!stream->nr_streaming) {
+		ret = ipu6_isys_video_prepare_streaming(av);
+		if (ret)
+			goto out_put_stream;
+	}
+
+	stream->nr_streaming++;
+	dev_dbg(&av->isys->adev->dev, "queue %u of %u\n", stream->nr_streaming,
+		stream->nr_queues);
+	list_add(&aq->node, &stream->queues);
+	if (stream->nr_streaming != stream->nr_queues)
+		goto out;
+
+	bl = &__bl;
+	ret = buffer_list_get(stream, bl);
+	if (ret < 0) {
+		dev_dbg(&av->isys->adev->dev,
+			"no buffer available, postponing streamon\n");
+		goto out;
+	}
+
+	ret = ipu6_isys_stream_start(av, bl, false);
+	if (ret)
+		goto out_stream_start;
+
+out:
+	mutex_unlock(&stream->mutex);
+
+	return 0;
+
+out_stream_start:
+	list_del(&aq->node);
+	stream->nr_streaming--;
+
+out_put_stream:
+	mutex_unlock(&stream->mutex);
+	ipu6_isys_put_stream(stream);
+	av->stream = NULL;
+
+out_pipeline_stop:
+	video_device_pipeline_stop(&av->vdev);
+
+out_return_buffers:
+	return_buffers(aq, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void stop_streaming(struct vb2_queue *q)
+{
+	struct ipu6_isys_queue *aq = vb2_queue_to_ipu6_isys_queue(q);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct ipu6_isys_stream *stream = av->stream;
+
+	mutex_lock(&stream->mutex);
+
+	mutex_lock(&av->isys->stream_mutex);
+	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
+		ipu6_isys_video_set_streaming(av, 0, NULL);
+	mutex_unlock(&av->isys->stream_mutex);
+
+	video_device_pipeline_stop(&av->vdev);
+	av->stream = NULL;
+
+	stream->nr_streaming--;
+	list_del(&aq->node);
+	stream->streaming = 0;
+
+	mutex_unlock(&stream->mutex);
+	ipu6_isys_put_stream(stream);
+
+	return_buffers(aq, VB2_BUF_STATE_ERROR);
+}
+
+static unsigned int
+get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream,
+			      struct ipu6_fw_isys_resp_info_abi *info)
+{
+	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
+	struct ipu6_isys *isys = stream->isys;
+	unsigned int i;
+
+	/*
+	 * The timestamp is invalid as no TSC in some FPGA platform,
+	 * so get the sequence from pipeline directly in this case.
+	 */
+	if (time == 0)
+		return atomic_read(&stream->sequence) - 1;
+
+	for (i = 0; i < IPU6_ISYS_MAX_PARALLEL_SOF; i++)
+		if (time == stream->seq[i].timestamp) {
+			dev_dbg(&isys->adev->dev,
+				"sof: using seq nr %u for ts %llu\n",
+				stream->seq[i].sequence, time);
+			return stream->seq[i].sequence;
+		}
+
+	dev_dbg(&isys->adev->dev, "SOF: looking for %llu\n", time);
+	for (i = 0; i < IPU6_ISYS_MAX_PARALLEL_SOF; i++)
+		dev_dbg(&isys->adev->dev,
+			"SOF: sequence %u, timestamp value %llu\n",
+			stream->seq[i].sequence, stream->seq[i].timestamp);
+	dev_dbg(&isys->adev->dev, "SOF sequence number not found\n");
+
+	return 0;
+}
+
+static u64 get_sof_ns_delta(struct ipu6_isys_video *av,
+			    struct ipu6_fw_isys_resp_info_abi *info)
+{
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(&av->isys->adev->dev);
+	struct ipu6_device *isp = adev->isp;
+	u64 delta, tsc_now;
+
+	if (!ipu6_buttress_tsc_read(isp, &tsc_now))
+		delta = tsc_now -
+			((u64)info->timestamp[1] << 32 | info->timestamp[0]);
+	else
+		delta = 0;
+
+	return ipu6_buttress_tsc_ticks_to_ns(delta, isp);
+}
+
+void
+ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
+				 struct ipu6_fw_isys_resp_info_abi *info)
+{
+	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct ipu6_isys_queue *aq =
+		vb2_queue_to_ipu6_isys_queue(vb->vb2_queue);
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct device *dev = &av->isys->adev->dev;
+	struct ipu6_isys_stream *stream = av->stream;
+	u64 ns;
+	u32 sequence;
+
+	ns = ktime_get_ns() - get_sof_ns_delta(av, info);
+	sequence = get_sof_sequence_by_timestamp(stream, info);
+
+	vbuf->vb2_buf.timestamp = ns;
+	vbuf->sequence = sequence;
+
+	dev_dbg(dev, "buf: %s: buffer done, CPU-timestamp:%lld, sequence:%d\n",
+		av->vdev.name, ktime_get_ns(), sequence);
+	dev_dbg(dev, "index:%d, vbuf timestamp:%lld, endl\n",
+		vb->index, vbuf->vb2_buf.timestamp);
+}
+
+void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
+{
+	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+
+	if (atomic_read(&ib->str2mmio_flag)) {
+		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+		/*
+		 * Operation on buffer is ended with error and will be reported
+		 * to the userspace when it is de-queued
+		 */
+		atomic_set(&ib->str2mmio_flag, 0);
+	} else {
+		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+	}
+}
+
+void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
+			       struct ipu6_fw_isys_resp_info_abi *info)
+{
+	struct ipu6_isys_queue *aq = stream->output_pins[info->pin_id].aq;
+	struct ipu6_isys *isys = stream->isys;
+	struct ipu6_isys_buffer *ib;
+	struct vb2_buffer *vb;
+	unsigned long flags;
+	bool first = true;
+	struct vb2_v4l2_buffer *buf;
+
+	dev_dbg(&isys->adev->dev, "buffer: %s: received buffer %8.8x\n",
+		ipu6_isys_queue_to_video(aq)->vdev.name, info->pin.addr);
+
+	spin_lock_irqsave(&aq->lock, flags);
+	if (list_empty(&aq->active)) {
+		spin_unlock_irqrestore(&aq->lock, flags);
+		dev_err(&isys->adev->dev, "active queue empty\n");
+		return;
+	}
+
+	list_for_each_entry_reverse(ib, &aq->active, head) {
+		dma_addr_t addr;
+
+		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+		addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+		if (info->pin.addr != addr) {
+			if (first)
+				dev_err(&isys->adev->dev,
+					"Unexpected buffer address %pad\n",
+					&addr);
+			first = false;
+			continue;
+		}
+
+		if (info->error_info.error ==
+		    IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO) {
+			/*
+			 * Check for error message:
+			 * 'IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO'
+			 */
+			atomic_set(&ib->str2mmio_flag, 1);
+		}
+		dev_dbg(&isys->adev->dev, "buffer: found buffer %pad\n", &addr);
+
+		buf = to_vb2_v4l2_buffer(vb);
+		buf->field = V4L2_FIELD_NONE;
+
+		list_del(&ib->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		ipu6_isys_buf_calc_sequence_time(ib, info);
+
+		ipu6_isys_queue_buf_done(ib);
+
+		return;
+	}
+
+	dev_err(&isys->adev->dev,
+		"WARNING: cannot find a matching video buffer!\n");
+
+	spin_unlock_irqrestore(&aq->lock, flags);
+}
+
+static const struct vb2_ops ipu6_isys_queue_ops = {
+	.queue_setup = queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_prepare = buf_prepare,
+	.start_streaming = start_streaming,
+	.stop_streaming = stop_streaming,
+	.buf_queue = buf_queue,
+};
+
+int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
+{
+	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
+	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	int ret;
+
+	/* no support for userptr */
+	if (!aq->vbq.io_modes)
+		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;
+
+	aq->vbq.drv_priv = aq;
+	aq->vbq.ops = &ipu6_isys_queue_ops;
+	aq->vbq.lock = &av->mutex;
+	aq->vbq.mem_ops = &vb2_dma_contig_memops;
+	aq->vbq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	aq->vbq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+
+	ret = vb2_queue_init(&aq->vbq);
+	if (ret)
+		return ret;
+
+	aq->dev = &isys->adev->dev;
+	aq->vbq.dev = &isys->adev->dev;
+	spin_lock_init(&aq->lock);
+	INIT_LIST_HEAD(&aq->active);
+	INIT_LIST_HEAD(&aq->incoming);
+
+	return 0;
+}
+
+void ipu6_isys_queue_cleanup(struct ipu6_isys_queue *aq)
+{
+	vb2_queue_release(&aq->vbq);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
new file mode 100644
index 000000000000..f57f198b1deb
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_ISYS_QUEUE_H
+#define IPU6_ISYS_QUEUE_H
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+
+#include <media/videobuf2-v4l2.h>
+
+struct ipu6_isys_video;
+struct ipu6_isys_stream;
+struct ipu6_fw_isys_resp_info_abi;
+struct ipu6_fw_isys_frame_buff_set_abi;
+
+enum ipu6_isys_buffer_type {
+	IPU6_ISYS_VIDEO_BUFFER,
+};
+
+struct ipu6_isys_queue {
+	struct list_head node;	/* struct ipu6_isys_stream.queues */
+	struct vb2_queue vbq;
+	struct device *dev;
+	/*
+	 * @lock: serialise access to queued and pre_streamon_queued
+	 */
+	spinlock_t lock;
+	struct list_head active;
+	struct list_head incoming;
+	unsigned int fw_output;
+	int (*buf_prepare)(struct vb2_buffer *vb);
+	void (*fill_frame_buf_set)(struct vb2_buffer *vb,
+				   struct ipu6_fw_isys_frame_buff_set_abi *set);
+	int (*link_fmt_validate)(struct ipu6_isys_queue *aq);
+};
+
+struct ipu6_isys_buffer {
+	struct list_head head;
+	enum ipu6_isys_buffer_type type;
+	atomic_t str2mmio_flag;
+};
+
+struct ipu6_isys_video_buffer {
+	struct vb2_v4l2_buffer vb_v4l2;
+	struct ipu6_isys_buffer ib;
+};
+
+#define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
+#define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
+#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
+
+struct ipu6_isys_buffer_list {
+	struct list_head head;
+	unsigned int nbufs;
+};
+
+#define vb2_queue_to_ipu6_isys_queue(__vb2) \
+	container_of(__vb2, struct ipu6_isys_queue, vbq)
+
+#define ipu6_isys_to_isys_video_buffer(__ib) \
+	container_of(__ib, struct ipu6_isys_video_buffer, ib)
+
+#define vb2_buffer_to_ipu6_isys_video_buffer(__vb) \
+	container_of(to_vb2_v4l2_buffer(__vb), \
+	struct ipu6_isys_video_buffer, vb_v4l2)
+
+#define ipu6_isys_buffer_to_vb2_buffer(__ib) \
+	(&ipu6_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
+
+#define vb2_buffer_to_ipu6_isys_buffer(__vb) \
+	(&vb2_buffer_to_ipu6_isys_video_buffer(__vb)->ib)
+
+int ipu6_isys_buf_prepare(struct vb2_buffer *vb);
+
+void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
+				 unsigned long op_flags,
+				 enum vb2_buffer_state state);
+void
+ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
+				  struct ipu6_fw_isys_frame_buff_set_abi *set);
+void
+ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
+			      struct ipu6_isys_stream *stream,
+			      struct ipu6_isys_buffer_list *bl);
+int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq);
+
+void
+ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
+				 struct ipu6_fw_isys_resp_info_abi *info);
+void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib);
+void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
+			       struct ipu6_fw_isys_resp_info_abi *info);
+int ipu6_isys_queue_init(struct ipu6_isys_queue *aq);
+void ipu6_isys_queue_cleanup(struct ipu6_isys_queue *aq);
+
+#endif /* IPU6_ISYS_QUEUE_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
new file mode 100644
index 000000000000..22105dead119
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -0,0 +1,1132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/compat.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/init_task.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-cpd.h"
+#include "ipu6-fw-com.h"
+#include "ipu6-fw-isys.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-isys-video.h"
+#include "ipu6-platform.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+#include "ipu6-platform-regs.h"
+
+
+const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
+	{V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SBGGR10, 16, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGBRG10, 16, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGRBG10, 16, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SGRBG8, 8, 8, MEDIA_BUS_FMT_SGRBG8_1X8,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SGRBG12P, 12, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SRGGB12P, 12, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SBGGR10P, 10, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_SGBRG10P, 10, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_SGRBG10P, 10, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
+	 IPU6_FW_ISYS_FRAME_FORMAT_UYVY},
+	{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
+	 IPU6_FW_ISYS_FRAME_FORMAT_YUYV},
+	{V4L2_PIX_FMT_RGB565, 16, 16, MEDIA_BUS_FMT_RGB565_1X16,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RGB565},
+	{V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
+	 IPU6_FW_ISYS_FRAME_FORMAT_RGBA888},
+};
+
+static int video_open(struct file *file)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+	struct ipu6_isys *isys = av->isys;
+	struct ipu6_bus_device *adev = to_ipu6_bus_device(&isys->adev->dev);
+	struct ipu6_device *isp = adev->isp;
+	const struct ipu6_isys_internal_pdata *ipdata;
+	int ret;
+
+	mutex_lock(&isys->mutex);
+
+	if (isys->need_reset || isp->flr_done) {
+		mutex_unlock(&isys->mutex);
+		dev_warn(&isys->adev->dev, "isys power cycle required\n");
+		return -EIO;
+	}
+	mutex_unlock(&isys->mutex);
+
+	ret = pm_runtime_resume_and_get(&isys->adev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto out_power_down;
+
+	mutex_lock(&isys->mutex);
+
+	if (isys->video_opened++)
+		goto unlock;
+
+	ipdata = isys->pdata->ipdata;
+	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
+			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
+			   adev->pkg_dir, adev->pkg_dir_dma_addr);
+
+	/*
+	 * Buffers could have been left to wrong queue at last closure.
+	 * Move them now back to empty buffer queue.
+	 */
+	ipu6_cleanup_fw_msg_bufs(isys);
+
+	if (isys->fwcom) {
+		/*
+		 * Something went wrong in previous shutdown. As we are now
+		 * restarting isys we can safely delete old context.
+		 */
+		dev_info(&isys->adev->dev, "Clearing old context\n");
+		ipu6_fw_isys_cleanup(isys);
+	}
+
+	ret = ipu6_fw_isys_init(av->isys, ipdata->num_parallel_streams);
+	if (ret < 0)
+		goto out_lib_init;
+unlock:
+	mutex_unlock(&isys->mutex);
+
+	return 0;
+
+out_lib_init:
+	isys->video_opened--;
+	mutex_unlock(&isys->mutex);
+	v4l2_fh_release(file);
+
+out_power_down:
+	pm_runtime_put(&isys->adev->dev);
+
+	return ret;
+}
+
+static int video_release(struct file *file)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+	int ret = 0;
+
+	vb2_fop_release(file);
+
+	mutex_lock(&av->isys->mutex);
+
+	if (!--av->isys->video_opened) {
+		ipu6_fw_isys_close(av->isys);
+		if (av->isys->fwcom) {
+			av->isys->need_reset = true;
+			ret = -EIO;
+		}
+	}
+
+	mutex_unlock(&av->isys->mutex);
+
+	if (av->isys->need_reset)
+		pm_runtime_put_sync(&av->isys->adev->dev);
+	else
+		pm_runtime_put(&av->isys->adev->dev);
+
+	return ret;
+}
+
+static const struct ipu6_isys_pixelformat *
+ipu6_isys_get_pixelformat(struct ipu6_isys_video *av, u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
+		const struct ipu6_isys_pixelformat *pfmt =
+			&ipu6_isys_pfmts[i];
+
+		if (pfmt->pixelformat == pixelformat)
+			return pfmt;
+	}
+
+	return &ipu6_isys_pfmts[0];
+}
+
+int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
+			      struct v4l2_capability *cap)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+
+	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
+	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
+
+	return 0;
+}
+
+int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
+			      struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
+		return -EINVAL;
+
+	f->flags = 0;
+	f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
+	f->mbus_code = ipu6_isys_pfmts[f->index].code;
+
+	return 0;
+}
+
+static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+				       struct v4l2_format *fmt)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+
+	fmt->fmt.pix_mp = av->mpix;
+
+	return 0;
+}
+
+static const struct ipu6_isys_pixelformat *
+ipu6_isys_video_try_fmt_vid_mplane(struct ipu6_isys_video *av,
+				   struct v4l2_pix_format_mplane *mpix)
+{
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_pixelformat(av, mpix->pixelformat);
+
+	mpix->pixelformat = pfmt->pixelformat;
+	mpix->num_planes = 1;
+
+	mpix->width = clamp(mpix->width, IPU6_ISYS_MIN_WIDTH,
+			    IPU6_ISYS_MAX_WIDTH);
+	mpix->height = clamp(mpix->height, IPU6_ISYS_MIN_HEIGHT,
+			     IPU6_ISYS_MAX_HEIGHT);
+
+	if (pfmt->bpp != pfmt->bpp_packed)
+		mpix->plane_fmt[0].bytesperline =
+			mpix->width * DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
+	else
+		mpix->plane_fmt[0].bytesperline =
+			DIV_ROUND_UP((unsigned int)mpix->width * pfmt->bpp,
+				     BITS_PER_BYTE);
+
+	mpix->plane_fmt[0].bytesperline = ALIGN(mpix->plane_fmt[0].bytesperline,
+						av->isys->line_align);
+
+	/*
+	 * (height + 1) * bytesperline due to a hardware issue: the DMA unit
+	 * is a power of two, and a line should be transferred as few units
+	 * as possible. The result is that up to line length more data than
+	 * the image size may be transferred to memory after the image.
+	 * Another limitation is the GDA allocation unit size. For low
+	 * resolution it gives a bigger number. Use larger one to avoid
+	 * memory corruption.
+	 */
+	mpix->plane_fmt[0].sizeimage =
+		max(max(mpix->plane_fmt[0].sizeimage,
+			mpix->plane_fmt[0].bytesperline * mpix->height +
+			max(mpix->plane_fmt[0].bytesperline,
+			    av->isys->pdata->ipdata->isys_dma_overshoot)), 1U);
+
+	memset(mpix->plane_fmt[0].reserved, 0,
+	       sizeof(mpix->plane_fmt[0].reserved));
+
+	mpix->field = V4L2_FIELD_NONE;
+
+	mpix->colorspace = V4L2_COLORSPACE_RAW;
+	mpix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	mpix->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mpix->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	return pfmt;
+}
+
+static int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *fh,
+				       struct v4l2_format *f)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+
+	if (av->aq.vbq.streaming)
+		return -EBUSY;
+
+	av->pfmt = ipu6_isys_video_try_fmt_vid_mplane(av, &f->fmt.pix_mp);
+	av->mpix = f->fmt.pix_mp;
+
+	return 0;
+}
+
+static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
+					 struct v4l2_format *f)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+
+	ipu6_isys_video_try_fmt_vid_mplane(av, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int vidioc_enum_input(struct file *file, void *fh,
+			     struct v4l2_input *input)
+{
+	if (input->index > 0)
+		return -EINVAL;
+	strscpy(input->name, "camera", sizeof(input->name));
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+
+	return 0;
+}
+
+static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
+{
+	*input = 0;
+
+	return 0;
+}
+
+static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
+{
+	return input == 0 ? 0 : -EINVAL;
+}
+
+static int link_validate(struct media_link *link)
+{
+	struct ipu6_isys_video *av =
+		container_of(link->sink, struct ipu6_isys_video, pad);
+	struct ipu6_isys_subdev *asd;
+	struct v4l2_mbus_framefmt *ffmt;
+	struct v4l2_subdev *sd;
+
+	if (!link->source->entity)
+		return -EINVAL;
+
+	sd = media_entity_to_v4l2_subdev(link->source->entity);
+	asd = to_ipu6_isys_subdev(sd);
+	ffmt = &asd->ffmt[link->source->index];
+	if (ffmt->code != av->pfmt->code || ffmt->width != av->mpix.width ||
+	    ffmt->height != av->mpix.height) {
+		dev_err(&av->isys->adev->dev,
+			"vdev link validation failed. %dx%d,%x != %dx%d,%x\n",
+			ffmt->width, ffmt->height, ffmt->code,
+			av->mpix.width, av->mpix.height, av->pfmt->code);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void get_stream_opened(struct ipu6_isys_video *av)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&av->isys->streams_lock, flags);
+	av->isys->stream_opened++;
+	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+}
+
+static void put_stream_opened(struct ipu6_isys_video *av)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&av->isys->streams_lock, flags);
+	av->isys->stream_opened--;
+	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+}
+
+static void ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
+				 struct ipu6_fw_isys_stream_cfg_data_abi *cfg,
+				 struct v4l2_mbus_framefmt *ffmt)
+{
+	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_queue *aq = &av->aq;
+	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
+	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
+	struct ipu6_isys *isys = av->isys;
+	int pin = cfg->nof_input_pins++;
+
+	input_pin = &cfg->input_pins[pin];
+	input_pin->input_res.width = ffmt->width;
+	input_pin->input_res.height = ffmt->height;
+	input_pin->dt = ipu6_isys_mbus_code_to_mipi(ffmt->code);
+	input_pin->bits_per_pix = ipu6_fw_isys_get_bpp_by_dt(input_pin->dt);
+	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
+	input_pin->mipi_decompression = 0;
+	input_pin->capture_mode = IPU6_FW_ISYS_CAPTURE_MODE_REGULAR;
+	input_pin->mipi_store_mode = av->pfmt->bpp == av->pfmt->bpp_packed ?
+		IPU6_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER :
+		IPU6_FW_ISYS_MIPI_STORE_MODE_NORMAL;
+	input_pin->crop_first_and_last_lines = cfg->crop.top_offset & 1;
+
+	pin = cfg->nof_output_pins++;
+	aq->fw_output = pin;
+	stream->output_pins[pin].pin_ready = ipu6_isys_queue_buf_ready;
+	stream->output_pins[pin].aq = aq;
+
+	output_pin = &cfg->output_pins[pin];
+	output_pin->input_pin_id = 0;
+	output_pin->output_res.width = av->mpix.width;
+	output_pin->output_res.height = av->mpix.height;
+
+	output_pin->stride = av->mpix.plane_fmt[0].bytesperline;
+	if (av->pfmt->bpp != av->pfmt->bpp_packed)
+		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_RAW_SOC;
+	else
+		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_MIPI;
+	output_pin->ft = av->pfmt->css_pixelformat;
+	output_pin->send_irq = 1;
+	memset(output_pin->ts_offsets, 0, sizeof(output_pin->ts_offsets));
+	output_pin->s2m_pixel_soc_pixel_remapping =
+		S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
+	output_pin->csi_be_soc_pixel_remapping =
+		CSI_BE_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
+
+	output_pin->snoopable = true;
+	output_pin->error_handling_enable = false;
+	output_pin->sensor_type = isys->sensor_type++;
+	if (isys->sensor_type > isys->pdata->ipdata->sensor_type_end)
+		isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
+}
+
+static int start_stream_firmware(struct ipu6_isys_video *av,
+				 struct ipu6_isys_buffer_list *bl)
+{
+	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
+	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
+	struct ipu6_isys_stream *stream = av->stream;
+	struct device *dev = &av->isys->adev->dev;
+	struct ipu6_fw_isys_cropping_abi *crop;
+	struct isys_fw_msgs *msg = NULL;
+	struct ipu6_isys_queue *aq;
+	int ret, retout, tout;
+	u16 send_type;
+
+	msg = ipu6_get_fw_msg_buf(stream);
+	if (!msg)
+		return -ENOMEM;
+
+	stream_cfg = &msg->fw_msg.stream;
+	stream_cfg->src = stream->stream_source;
+	stream_cfg->vc = 0;
+	stream_cfg->isl_use = 0;
+	stream_cfg->sensor_type = IPU6_FW_ISYS_SENSOR_MODE_NORMAL;
+
+	crop = &stream_cfg->crop;
+	crop->left_offset = asd->crop.left;
+	crop->top_offset = asd->crop.top;
+	crop->right_offset = asd->crop.left + asd->crop.width;
+	crop->bottom_offset = asd->crop.top + asd->crop.height;
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
+
+		ipu6_isys_fw_pin_cfg(__av, stream_cfg, asd->ffmt);
+	}
+
+	ipu6_fw_isys_dump_stream_cfg(dev, stream_cfg);
+
+	stream->nr_output_pins = stream_cfg->nof_output_pins;
+
+	reinit_completion(&stream->stream_open_completion);
+
+	ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
+				       stream_cfg, msg->dma_addr,
+				       sizeof(*stream_cfg),
+				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
+	if (ret < 0) {
+		dev_err(dev, "can't open stream (%d)\n", ret);
+		ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
+		return ret;
+	}
+
+	get_stream_opened(av);
+
+	tout = wait_for_completion_timeout(&stream->stream_open_completion,
+					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
+
+	ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
+
+	if (!tout) {
+		dev_err(dev, "stream open time out\n");
+		ret = -ETIMEDOUT;
+		goto out_put_stream_opened;
+	}
+	if (stream->error) {
+		dev_err(dev, "stream open error: %d\n", stream->error);
+		ret = -EIO;
+		goto out_put_stream_opened;
+	}
+	dev_dbg(dev, "start stream: open complete\n");
+
+	if (bl) {
+		msg = ipu6_get_fw_msg_buf(stream);
+		if (!msg) {
+			ret = -ENOMEM;
+			goto out_put_stream_opened;
+		}
+		buf = &msg->fw_msg.frame;
+	}
+
+	if (bl) {
+		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
+		ipu6_isys_buffer_list_queue(bl,
+					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+	}
+
+	reinit_completion(&stream->stream_start_completion);
+
+	if (bl) {
+		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
+		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
+						 stream_cfg->nof_output_pins);
+		ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
+					       buf, msg->dma_addr,
+					       sizeof(*buf), send_type);
+	} else {
+		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START;
+		ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+					      send_type);
+	}
+
+	if (ret < 0) {
+		dev_err(dev, "can't start streaming (%d)\n", ret);
+		goto out_stream_close;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_start_completion,
+					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout) {
+		dev_err(dev, "stream start time out\n");
+		ret = -ETIMEDOUT;
+		goto out_stream_close;
+	}
+	if (stream->error) {
+		dev_err(dev, "stream start error: %d\n", stream->error);
+		ret = -EIO;
+		goto out_stream_close;
+	}
+	dev_dbg(dev, "start stream: complete\n");
+
+	return 0;
+
+out_stream_close:
+	reinit_completion(&stream->stream_close_completion);
+
+	retout = ipu6_fw_isys_simple_cmd(av->isys,
+					 stream->stream_handle,
+					 IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+	if (retout < 0) {
+		dev_dbg(dev, "can't close stream (%d)\n", retout);
+		goto out_put_stream_opened;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_close_completion,
+					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout)
+		dev_err(dev, "stream close time out\n");
+	else if (stream->error)
+		dev_err(dev, "stream close error: %d\n", stream->error);
+	else
+		dev_dbg(dev, "stream close complete\n");
+
+out_put_stream_opened:
+	put_stream_opened(av);
+
+	return ret;
+}
+
+static void stop_streaming_firmware(struct ipu6_isys_video *av)
+{
+	struct ipu6_isys_stream *stream = av->stream;
+	struct device *dev = &av->isys->adev->dev;
+	int ret, tout;
+
+	reinit_completion(&stream->stream_stop_completion);
+
+	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+				      IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
+
+	if (ret < 0) {
+		dev_err(dev, "can't stop stream (%d)\n", ret);
+		return;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_stop_completion,
+					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout)
+		dev_err(dev, "stream stop time out\n");
+	else if (stream->error)
+		dev_err(dev, "stream stop error: %d\n", stream->error);
+	else
+		dev_dbg(dev, "stop stream: complete\n");
+}
+
+static void close_streaming_firmware(struct ipu6_isys_video *av)
+{
+	struct ipu6_isys_stream *stream = av->stream;
+	struct device *dev = &av->isys->adev->dev;
+	int ret, tout;
+
+	reinit_completion(&stream->stream_close_completion);
+
+	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+				      IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+	if (ret < 0) {
+		dev_err(dev, "can't close stream (%d)\n", ret);
+		return;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_close_completion,
+					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout)
+		dev_err(dev, "stream close time out\n");
+	else if (stream->error)
+		dev_err(dev, "stream close error: %d\n", stream->error);
+	else
+		dev_dbg(dev, "close stream: complete\n");
+
+	put_stream_opened(av);
+}
+
+int ipu6_isys_video_prepare_streaming(struct ipu6_isys_video *av)
+{
+	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys *isys = av->isys;
+	struct device *dev = &isys->adev->dev;
+	struct media_pipeline *pipe = av->pad.pipe;
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
+	struct v4l2_subdev *sd, *remote_sd;
+	struct media_pad *remote_pad;
+	int ret;
+
+	WARN_ON(stream->nr_streaming);
+	stream->nr_queues = 1;
+	stream->source_entity = NULL;
+	atomic_set(&stream->sequence, 0);
+
+	stream->csi2 = NULL;
+	stream->seq_index = 0;
+	memset(stream->seq, 0, sizeof(stream->seq));
+
+	WARN_ON(!list_empty(&stream->queues));
+
+	if (!pipe) {
+		dev_err(dev, "No media pipe for %s\n", av->vdev.name);
+		return -EINVAL;
+	}
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		/* Non-subdev nodes can be ignored here. */
+		if (!is_media_entity_v4l2_subdev(entity))
+			continue;
+
+		if (stream->source_entity)
+			continue;
+
+		sd = media_entity_to_v4l2_subdev(entity);
+		if (!sd || sd->owner != THIS_MODULE)
+			continue;
+
+		remote_pad = media_pad_remote_pad_unique(&entity->pads[0]);
+		if (!remote_pad)
+			continue;
+
+		remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		if (!remote_sd || remote_sd->owner == THIS_MODULE)
+			continue;
+
+		stream->csi2 = to_ipu6_isys_csi2(sd);
+		stream->csi2->receiver_errors = 0;
+
+		stream->source_entity = remote_pad->entity;
+		stream->stream_source = to_ipu6_isys_subdev(sd)->source;
+		dev_dbg(dev, "prepare CSI2:%s stream\n", sd->name);
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	if (WARN(!stream->source_entity, "no external source entity\n"))
+		return -EINVAL;
+
+	dev_dbg(dev, "prepare stream: external entity %s\n",
+		stream->source_entity->name);
+
+	return 0;
+}
+
+static void configure_stream_watermark(struct ipu6_isys_video *av, bool state)
+{
+	struct ipu6_isys *isys = av->isys;
+	struct ipu6_isys_csi2 *csi2 = av->stream->csi2;
+	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
+	struct device *dev = &isys->adev->dev;
+	struct ipu6_isys_stream *isys_stream;
+	struct v4l2_subdev *esd;
+	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
+	unsigned int bpp, lanes;
+	s64 link_freq = 0;
+	u64 pixel_rate = 0;
+	int ret;
+
+	if (!state)
+		return;
+
+	isys_stream = av->stream;
+	if (!isys_stream->source_entity)
+		return;
+
+	esd = media_entity_to_v4l2_subdev(isys_stream->source_entity);
+
+	av->watermark->width = av->mpix.width;
+	av->watermark->height = av->mpix.height;
+	av->watermark->sram_gran_shift = isys->pdata->ipdata->sram_gran_shift;
+	av->watermark->sram_gran_size = isys->pdata->ipdata->sram_gran_size;
+
+	ret = v4l2_g_ctrl(esd->ctrl_handler, &hb);
+	if (!ret && hb.value >= 0)
+		av->watermark->hblank = hb.value;
+	else
+		av->watermark->hblank = 0;
+
+	ret = ipu6_isys_csi2_get_link_freq(csi2, &link_freq);
+	if (!ret) {
+		lanes = csi2->nlanes;
+		bpp = ipu6_isys_mbus_code_to_bpp(csi2->asd.ffmt->code);
+		pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
+	}
+
+	av->watermark->pixel_rate = pixel_rate;
+
+	if (!pixel_rate) {
+		mutex_lock(&iwake_watermark->mutex);
+		iwake_watermark->force_iwake_disable = true;
+		mutex_unlock(&iwake_watermark->mutex);
+		dev_err(dev, "unexpected pixel_rate from %s, disable iwake.\n",
+			 isys_stream->source_entity->name);
+	}
+}
+
+static void calculate_stream_datarate(struct ipu6_isys_video *av)
+{
+	struct video_stream_watermark *watermark = av->watermark;
+	u32 bpp = av->pfmt->bpp;
+	u64 pages_per_line, pb_bytes_per_line, stream_data_rate;
+	u64 pixels_per_line, bytes_per_line, line_time_ns;
+	u16 shift, size;
+
+	shift = watermark->sram_gran_shift;
+	size = watermark->sram_gran_size;
+	pixels_per_line = watermark->width + watermark->hblank;
+	line_time_ns =
+		pixels_per_line * 1000 / (watermark->pixel_rate / 1000000);
+
+	bytes_per_line = watermark->width * bpp / 8;
+	/* bytes to IS pixel buffer pages */
+	pages_per_line = bytes_per_line >> shift;
+
+	pages_per_line = DIV_ROUND_UP(bytes_per_line, size);
+	pb_bytes_per_line = pages_per_line << shift;
+
+	stream_data_rate = (pb_bytes_per_line * 1000) / line_time_ns;
+	watermark->stream_data_rate = stream_data_rate;
+}
+
+static void update_stream_watermark(struct ipu6_isys_video *av, bool state)
+{
+	struct isys_iwake_watermark *iwake_watermark =
+		&av->isys->iwake_watermark;
+
+	if (!av->watermark->pixel_rate)
+		return;
+
+	if (state) {
+		calculate_stream_datarate(av);
+		mutex_lock(&iwake_watermark->mutex);
+		list_add(&av->watermark->stream_node,
+			 &iwake_watermark->video_list);
+		mutex_unlock(&iwake_watermark->mutex);
+	} else {
+		av->watermark->stream_data_rate = 0;
+		mutex_lock(&iwake_watermark->mutex);
+		list_del(&av->watermark->stream_node);
+		mutex_unlock(&iwake_watermark->mutex);
+	}
+
+	update_watermark_setting(av->isys);
+}
+
+void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
+{
+	unsigned int i;
+	unsigned long flags;
+
+	if (!stream) {
+		dev_err(&stream->isys->adev->dev, "no available stream\n");
+		return;
+	}
+
+	spin_lock_irqsave(&stream->isys->streams_lock, flags);
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
+		if (&stream->isys->streams[i] == stream) {
+			if (stream->isys->streams_ref_count[i] > 0) {
+				stream->isys->streams_ref_count[i]--;
+			} else {
+				dev_warn(&stream->isys->adev->dev,
+					 "stream %d isn't used\n", i);
+			}
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&stream->isys->streams_lock, flags);
+}
+
+struct ipu6_isys_stream *ipu6_isys_get_stream(struct ipu6_isys *isys)
+{
+	struct ipu6_isys_stream *stream = NULL;
+	unsigned long flags;
+	unsigned int i;
+
+	if (!isys)
+		return NULL;
+
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
+		if (!isys->streams_ref_count[i]) {
+			isys->streams_ref_count[i]++;
+			stream = &isys->streams[i];
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+	return stream;
+}
+
+struct ipu6_isys_stream *
+ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
+{
+	unsigned long flags;
+	struct ipu6_isys_stream *stream = NULL;
+
+	if (!isys)
+		return NULL;
+
+	if (stream_handle >= IPU6_ISYS_MAX_STREAMS) {
+		dev_err(&isys->adev->dev,
+			"stream_handle %d is invalid\n", stream_handle);
+		return NULL;
+	}
+
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	if (isys->streams_ref_count[stream_handle] > 0) {
+		isys->streams_ref_count[stream_handle]++;
+		stream = &isys->streams[stream_handle];
+	}
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+	return stream;
+}
+
+struct ipu6_isys_stream *
+ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source)
+{
+	struct ipu6_isys_stream *stream = NULL;
+	unsigned long flags;
+	unsigned int i;
+
+	if (!isys)
+		return NULL;
+
+	if (source < 0) {
+		dev_err(&stream->isys->adev->dev,
+			"query stream with invalid port number\n");
+		return NULL;
+	}
+
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
+		if (!isys->streams_ref_count[i])
+			continue;
+
+		if (isys->streams[i].stream_source == source) {
+			stream = &isys->streams[i];
+			isys->streams_ref_count[i]++;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+	return stream;
+}
+
+int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
+				  struct ipu6_isys_buffer_list *bl)
+{
+	struct media_device *mdev = av->vdev.entity.graph_obj.mdev;
+	struct ipu6_isys_stream *stream = av->stream;
+	struct device *dev = &av->isys->adev->dev;
+	struct media_entity *entity;
+	struct media_pipeline *pipe = av->pad.pipe;
+	struct media_pipeline_entity_iter iter;
+	struct media_entity_enum entities;
+	struct v4l2_subdev *sd, *ssd;
+	int ret = 0;
+
+	dev_dbg(dev, "set stream: %d\n", state);
+
+	if (WARN(!stream->source_entity, "No source entity for stream\n"))
+		return -ENODEV;
+
+	ssd = media_entity_to_v4l2_subdev(stream->source_entity);
+	if (!state) {
+		stop_streaming_firmware(av);
+
+		/* stop external sub-device now. */
+		dev_info(dev, "stream off %s\n", stream->source_entity->name);
+
+		v4l2_subdev_call(ssd, video, s_stream, state);
+	}
+
+	if (!pipe) {
+		dev_err(dev, "No media pipe for %s\n", av->vdev.name);
+		return -EINVAL;
+	}
+
+	ret = media_entity_enum_init(&entities, mdev);
+	if (ret)
+		return ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		goto out_media_entity_enum_cleanup;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		sd = media_entity_to_v4l2_subdev(entity);
+
+		/* external source entity and non-subdev nodes are ignored */
+		if (!is_media_entity_v4l2_subdev(entity) ||
+		    sd->owner != THIS_MODULE)
+			continue;
+
+		dev_dbg(dev, "stream %s entity %s\n", state ? "on" : "off",
+			entity->name);
+		ret = v4l2_subdev_call(sd, video, s_stream, state);
+		if (!state)
+			continue;
+		if (ret && ret != -ENOIOCTLCMD)
+			goto out_media_entity_stop_streaming;
+
+		media_entity_enum_set(&entities, entity);
+	}
+
+	configure_stream_watermark(av, state);
+	update_stream_watermark(av, state);
+
+	if (state) {
+		ret = start_stream_firmware(av, bl);
+		if (ret)
+			goto out_clear_stream_watermark;
+
+		dev_dbg(dev, "set stream: source %d, stream_handle %d\n",
+			stream->stream_source, stream->stream_handle);
+
+		/* Start source sub-device now. */
+		dev_info(dev, "stream on %s\n", stream->source_entity->name);
+
+		ret = v4l2_subdev_call(ssd, video, s_stream, state);
+		if (ret)
+			goto out_media_entity_stop_streaming_firmware;
+	} else {
+		close_streaming_firmware(av);
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+	media_entity_enum_cleanup(&entities);
+	av->streaming = state;
+
+	return 0;
+
+out_media_entity_stop_streaming_firmware:
+	stop_streaming_firmware(av);
+
+out_clear_stream_watermark:
+	update_stream_watermark(av, 0);
+
+out_media_entity_stop_streaming:
+	if (state) {
+		media_entity_enum_zero(&iter.ent_enum);
+		media_pipeline_for_each_entity(pipe, &iter, entity) {
+			if (!media_entity_enum_test(&entities, entity))
+				continue;
+
+			sd = media_entity_to_v4l2_subdev(entity);
+			v4l2_subdev_call(sd, video, s_stream, 0);
+		}
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+out_media_entity_enum_cleanup:
+	media_entity_enum_cleanup(&entities);
+
+	return ret;
+}
+
+static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
+	.vidioc_querycap = ipu6_isys_vidioc_querycap,
+	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane = vidioc_s_fmt_vid_cap_mplane,
+	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_vid_cap_mplane,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_enum_input = vidioc_enum_input,
+	.vidioc_g_input = vidioc_g_input,
+	.vidioc_s_input = vidioc_s_input,
+};
+
+static const struct media_entity_operations entity_ops = {
+	.link_validate = link_validate,
+};
+
+static const struct v4l2_file_operations isys_fops = {
+	.owner = THIS_MODULE,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+	.open = video_open,
+	.release = video_release,
+};
+
+/*
+ * Do everything that's needed to initialise things related to video
+ * buffer queue, video node, and the related media entity. The caller
+ * is expected to assign isys field and set the name of the video
+ * device.
+ */
+int ipu6_isys_video_init(struct ipu6_isys_video *av)
+{
+	const struct v4l2_ioctl_ops *ioctl_ops = NULL;
+	struct v4l2_format format = {
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.fmt.pix_mp = {
+			.width = 1920,
+			.height = 1080,
+		},
+	};
+	int ret;
+
+	av->watermark = kzalloc(sizeof(*av->watermark), GFP_KERNEL);
+	if (!av->watermark)
+		return -ENOMEM;
+
+	mutex_init(&av->mutex);
+	av->vdev.device_caps = V4L2_CAP_STREAMING;
+	ioctl_ops = &ioctl_ops_mplane;
+	av->vdev.device_caps |= V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+	av->vdev.vfl_dir = VFL_DIR_RX;
+
+	ret = ipu6_isys_queue_init(&av->aq);
+	if (ret)
+		goto out_free_watermark;
+
+	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
+	if (ret)
+		goto out_ipu6_isys_queue_cleanup;
+
+	av->vdev.entity.ops = &entity_ops;
+	av->vdev.release = video_device_release_empty;
+	av->vdev.fops = &isys_fops;
+	av->vdev.v4l2_dev = &av->isys->v4l2_dev;
+	if (!av->vdev.ioctl_ops)
+		av->vdev.ioctl_ops = ioctl_ops;
+	av->vdev.queue = &av->aq.vbq;
+	av->vdev.lock = &av->mutex;
+
+	ipu6_isys_video_try_fmt_vid_mplane(av, &format.fmt.pix_mp);
+	av->mpix = format.fmt.pix_mp;
+
+	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
+	video_set_drvdata(&av->vdev, av);
+
+	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto out_media_entity_cleanup;
+
+	return ret;
+
+out_media_entity_cleanup:
+	video_unregister_device(&av->vdev);
+	media_entity_cleanup(&av->vdev.entity);
+
+out_ipu6_isys_queue_cleanup:
+	ipu6_isys_queue_cleanup(&av->aq);
+
+out_free_watermark:
+	mutex_destroy(&av->mutex);
+	kfree(av->watermark);
+
+	return ret;
+}
+
+void ipu6_isys_video_cleanup(struct ipu6_isys_video *av)
+{
+	kfree(av->watermark);
+	video_unregister_device(&av->vdev);
+	media_entity_cleanup(&av->vdev.entity);
+	mutex_destroy(&av->mutex);
+	ipu6_isys_queue_cleanup(&av->aq);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
new file mode 100644
index 000000000000..55a6e09937cc
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_ISYS_VIDEO_H
+#define IPU6_ISYS_VIDEO_H
+
+#include <linux/mutex.h>
+#include <linux/list.h>
+#include <linux/videodev2.h>
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
+#include "ipu6-isys-queue.h"
+
+#define IPU6_ISYS_OUTPUT_PINS 11
+#define IPU6_ISYS_MAX_PARALLEL_SOF 2
+#define NR_OF_VIDEO_DEVICE 4
+
+struct ipu6_isys;
+struct ipu6_fw_isys_stream_cfg_data_abi;
+
+struct ipu6_isys_pixelformat {
+	u32 pixelformat;
+	u32 bpp;
+	u32 bpp_packed;
+	u32 code;
+	u32 css_pixelformat;
+};
+
+struct sequence_info {
+	unsigned int sequence;
+	u64 timestamp;
+};
+
+struct output_pin_data {
+	void (*pin_ready)(struct ipu6_isys_stream *stream,
+			  struct ipu6_fw_isys_resp_info_abi *info);
+	struct ipu6_isys_queue *aq;
+};
+
+/*
+ * Align with firmware stream. Each stream represents a CSI virtual channel.
+ * May map to multiple video devices
+ */
+struct ipu6_isys_stream {
+	struct mutex mutex;
+	struct media_entity *source_entity;
+	atomic_t sequence;
+	unsigned int seq_index;
+	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
+	int stream_source;
+	int stream_handle;
+	unsigned int nr_output_pins;
+	struct ipu6_isys_csi2 *csi2;
+
+	int nr_queues;	/* Number of capture queues */
+	int nr_streaming;
+	int streaming;	/* Has streaming been really started? */
+	struct list_head queues;
+	struct completion stream_open_completion;
+	struct completion stream_close_completion;
+	struct completion stream_start_completion;
+	struct completion stream_stop_completion;
+	struct ipu6_isys *isys;
+
+	struct output_pin_data output_pins[IPU6_ISYS_OUTPUT_PINS];
+	int error;
+};
+
+struct video_stream_watermark {
+	u32 width;
+	u32 height;
+	u32 hblank;
+	u32 frame_rate;
+	u64 pixel_rate;
+	u64 stream_data_rate;
+	u16 sram_gran_shift;
+	u16 sram_gran_size;
+	struct list_head stream_node;
+};
+
+struct ipu6_isys_video {
+	/* Serialise access to other fields in the struct. */
+	struct mutex mutex;
+	struct media_pad pad;
+	struct video_device vdev;
+	struct v4l2_pix_format_mplane mpix;
+	const struct ipu6_isys_pixelformat *pfmt;
+	struct ipu6_isys_queue aq;
+	struct ipu6_isys *isys;
+	struct ipu6_isys_stream *stream;
+	unsigned int streaming;
+	struct video_stream_watermark *watermark;
+};
+
+#define ipu6_isys_queue_to_video(__aq) \
+	container_of(__aq, struct ipu6_isys_video, aq)
+
+extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts[];
+extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
+
+int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
+			      struct v4l2_capability *cap);
+
+int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
+			      struct v4l2_fmtdesc *f);
+int ipu6_isys_video_prepare_streaming(struct ipu6_isys_video *av);
+int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
+				  struct ipu6_isys_buffer_list *bl);
+int ipu6_isys_video_init(struct ipu6_isys_video *av);
+void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
+void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
+struct ipu6_isys_stream *ipu6_isys_get_stream(struct ipu6_isys *isys);
+struct ipu6_isys_stream *
+ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
+struct ipu6_isys_stream *
+ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source);
+
+#endif /* IPU6_ISYS_VIDEO_H */
-- 
2.39.1

