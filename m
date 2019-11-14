Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93591FBF1B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfKNFNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:13:52 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43986 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbfKNFNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:13:52 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 88566291066;
        Thu, 14 Nov 2019 05:13:42 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com, Jacob Chen <jacob2.chen@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v11 05/11] media: staging: rkisp1: add ISP1 statistics driver
Date:   Thu, 14 Nov 2019 02:12:36 -0300
Message-Id: <20191114051242.14651-6-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191114051242.14651-1-helen.koike@collabora.com>
References: <20191114051242.14651-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

Add the capture video driver for rockchip isp1 statistics block.

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
Signed-off-by: Jacob Chen <cc@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
[refactored for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v11:
stats
- fix compiling warnings
- fix checkpatch errors

Changes in v10:
- unsquash

Changes in v9:
- replace v4l2_{dgb,info,warn,err} by dev_*
- remove LOG_ISR_EXE_TIME ifndef's
- constify ops structs
- s/strlcpy/strscpy
- add missing mutex_destroy() calls in rkisp1_register_stats_vdev error path
- squash
- move to staging

Changes in v8: None
Changes in v7:
- s/strlcpy/strscpy
- sort out the locks in isp stats
- code styling and checkpatch fixes

 drivers/staging/media/rkisp1/isp_stats.c | 495 +++++++++++++++++++++++
 drivers/staging/media/rkisp1/isp_stats.h |  60 +++
 2 files changed, 555 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/isp_stats.c
 create mode 100644 drivers/staging/media/rkisp1/isp_stats.h

diff --git a/drivers/staging/media/rkisp1/isp_stats.c b/drivers/staging/media/rkisp1/isp_stats.c
new file mode 100644
index 000000000000..f11b4cc5d791
--- /dev/null
+++ b/drivers/staging/media/rkisp1/isp_stats.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - Stats subdevice
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-vmalloc.h>	/* for ISP statistics */
+
+#include "dev.h"
+#include "regs.h"
+
+#define RKISP1_ISP_STATS_REQ_BUFS_MIN 2
+#define RKISP1_ISP_STATS_REQ_BUFS_MAX 8
+
+static int rkisp1_stats_enum_fmt_meta_cap(struct file *file, void *priv,
+					  struct v4l2_fmtdesc *f)
+{
+	struct video_device *video = video_devdata(file);
+	struct rkisp1_isp_stats_vdev *stats_vdev = video_get_drvdata(video);
+
+	if (f->index > 0 || f->type != video->queue->type)
+		return -EINVAL;
+
+	f->pixelformat = stats_vdev->vdev_fmt.fmt.meta.dataformat;
+	return 0;
+}
+
+static int rkisp1_stats_g_fmt_meta_cap(struct file *file, void *priv,
+				       struct v4l2_format *f)
+{
+	struct video_device *video = video_devdata(file);
+	struct rkisp1_isp_stats_vdev *stats_vdev = video_get_drvdata(video);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != video->queue->type)
+		return -EINVAL;
+
+	memset(meta, 0, sizeof(*meta));
+	meta->dataformat = stats_vdev->vdev_fmt.fmt.meta.dataformat;
+	meta->buffersize = stats_vdev->vdev_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+static int rkisp1_stats_querycap(struct file *file,
+				 void *priv, struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform: " DRIVER_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+/* ISP video device IOCTLs */
+static const struct v4l2_ioctl_ops rkisp1_stats_ioctl = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_cap = rkisp1_stats_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap = rkisp1_stats_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap = rkisp1_stats_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap = rkisp1_stats_g_fmt_meta_cap,
+	.vidioc_querycap = rkisp1_stats_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations rkisp1_stats_fops = {
+	.mmap = vb2_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release
+};
+
+static int rkisp1_stats_vb2_queue_setup(struct vb2_queue *vq,
+					unsigned int *num_buffers,
+					unsigned int *num_planes,
+					unsigned int sizes[],
+					struct device *alloc_devs[])
+{
+	struct rkisp1_isp_stats_vdev *stats_vdev = vq->drv_priv;
+
+	*num_planes = 1;
+
+	*num_buffers = clamp_t(u32, *num_buffers, RKISP1_ISP_STATS_REQ_BUFS_MIN,
+			       RKISP1_ISP_STATS_REQ_BUFS_MAX);
+
+	sizes[0] = sizeof(struct rkisp1_stat_buffer);
+
+	INIT_LIST_HEAD(&stats_vdev->stat);
+
+	return 0;
+}
+
+static void rkisp1_stats_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_buffer *stats_buf = to_rkisp1_buffer(vbuf);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rkisp1_isp_stats_vdev *stats_dev = vq->drv_priv;
+
+	stats_buf->vaddr[0] = vb2_plane_vaddr(vb, 0);
+
+	mutex_lock(&stats_dev->wq_lock);
+	list_add_tail(&stats_buf->queue, &stats_dev->stat);
+	mutex_unlock(&stats_dev->wq_lock);
+}
+
+static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_stat_buffer))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_stat_buffer));
+
+	return 0;
+}
+
+static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkisp1_isp_stats_vdev *stats_vdev = vq->drv_priv;
+	struct rkisp1_buffer *buf;
+	unsigned long flags;
+	unsigned int i;
+
+	/* Make sure no new work queued in isr before draining wq */
+	spin_lock_irqsave(&stats_vdev->irq_lock, flags);
+	stats_vdev->streamon = false;
+	spin_unlock_irqrestore(&stats_vdev->irq_lock, flags);
+
+	drain_workqueue(stats_vdev->readout_wq);
+
+	mutex_lock(&stats_vdev->wq_lock);
+	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
+		if (list_empty(&stats_vdev->stat))
+			break;
+		buf = list_first_entry(&stats_vdev->stat,
+				       struct rkisp1_buffer, queue);
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	mutex_unlock(&stats_vdev->wq_lock);
+}
+
+static int
+rkisp1_stats_vb2_start_streaming(struct vb2_queue *queue,
+				 unsigned int count)
+{
+	struct rkisp1_isp_stats_vdev *stats_vdev = queue->drv_priv;
+
+	stats_vdev->streamon = true;
+
+	return 0;
+}
+
+static const struct vb2_ops rkisp1_stats_vb2_ops = {
+	.queue_setup = rkisp1_stats_vb2_queue_setup,
+	.buf_queue = rkisp1_stats_vb2_buf_queue,
+	.buf_prepare = rkisp1_stats_vb2_buf_prepare,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.stop_streaming = rkisp1_stats_vb2_stop_streaming,
+	.start_streaming = rkisp1_stats_vb2_start_streaming,
+};
+
+static int rkisp1_stats_init_vb2_queue(struct vb2_queue *q,
+				       struct rkisp1_isp_stats_vdev *stats_vdev)
+{
+	struct rkisp1_vdev_node *node;
+
+	node = queue_to_node(q);
+
+	q->type = V4L2_BUF_TYPE_META_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	q->drv_priv = stats_vdev;
+	q->ops = &rkisp1_stats_vb2_ops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->buf_struct_size = sizeof(struct rkisp1_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &node->vlock;
+
+	return vb2_queue_init(q);
+}
+
+static void rkisp1_stats_get_awb_meas(struct rkisp1_isp_stats_vdev *stats_vdev,
+				      struct rkisp1_stat_buffer *pbuf)
+{
+	/* Protect against concurrent access from ISR? */
+	u32 reg_val;
+
+	pbuf->meas_type |= CIFISP_STAT_AWB;
+	reg_val = readl(stats_vdev->dev->base_addr + CIF_ISP_AWB_WHITE_CNT);
+	pbuf->params.awb.awb_mean[0].cnt = CIF_ISP_AWB_GET_PIXEL_CNT(reg_val);
+	reg_val = readl(stats_vdev->dev->base_addr + CIF_ISP_AWB_MEAN);
+
+	pbuf->params.awb.awb_mean[0].mean_cr_or_r =
+		CIF_ISP_AWB_GET_MEAN_CR_R(reg_val);
+	pbuf->params.awb.awb_mean[0].mean_cb_or_b =
+		CIF_ISP_AWB_GET_MEAN_CB_B(reg_val);
+	pbuf->params.awb.awb_mean[0].mean_y_or_g =
+		CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
+}
+
+static void rkisp1_stats_get_aec_meas(struct rkisp1_isp_stats_vdev *stats_vdev,
+				      struct rkisp1_stat_buffer *pbuf)
+{
+	void __iomem *addr = stats_vdev->dev->base_addr + CIF_ISP_EXP_MEAN_00;
+	unsigned int i;
+
+	pbuf->meas_type |= CIFISP_STAT_AUTOEXP;
+	for (i = 0; i < CIFISP_AE_MEAN_MAX; i++)
+		pbuf->params.ae.exp_mean[i] = (u8)readl(addr + i * 4);
+}
+
+static void rkisp1_stats_get_afc_meas(struct rkisp1_isp_stats_vdev *stats_vdev,
+				      struct rkisp1_stat_buffer *pbuf)
+{
+	void __iomem *base_addr;
+	struct cifisp_af_stat *af;
+
+	pbuf->meas_type = CIFISP_STAT_AFM_FIN;
+
+	af = &pbuf->params.af;
+	base_addr = stats_vdev->dev->base_addr;
+	af->window[0].sum = readl(base_addr + CIF_ISP_AFM_SUM_A);
+	af->window[0].lum = readl(base_addr + CIF_ISP_AFM_LUM_A);
+	af->window[1].sum = readl(base_addr + CIF_ISP_AFM_SUM_B);
+	af->window[1].lum = readl(base_addr + CIF_ISP_AFM_LUM_B);
+	af->window[2].sum = readl(base_addr + CIF_ISP_AFM_SUM_C);
+	af->window[2].lum = readl(base_addr + CIF_ISP_AFM_LUM_C);
+}
+
+static void rkisp1_stats_get_hst_meas(struct rkisp1_isp_stats_vdev *stats_vdev,
+				      struct rkisp1_stat_buffer *pbuf)
+{
+	void __iomem *addr = stats_vdev->dev->base_addr + CIF_ISP_HIST_BIN_0;
+	unsigned int i;
+
+	pbuf->meas_type |= CIFISP_STAT_HIST;
+	for (i = 0; i < CIFISP_HIST_BIN_N_MAX; i++)
+		pbuf->params.hist.hist_bins[i] = readl(addr + (i * 4));
+}
+
+static void rkisp1_stats_get_bls_meas(struct rkisp1_isp_stats_vdev *stats_vdev,
+				      struct rkisp1_stat_buffer *pbuf)
+{
+	struct rkisp1_device *dev = stats_vdev->dev;
+	const struct rkisp1_fmt *in_fmt = dev->isp_sdev.in_fmt;
+	void __iomem *base = stats_vdev->dev->base_addr;
+	struct cifisp_bls_meas_val *bls_val;
+
+	bls_val = &pbuf->params.ae.bls_val;
+	if (in_fmt->bayer_pat == RAW_BGGR) {
+		bls_val->meas_b = readl(base + CIF_ISP_BLS_A_MEASURED);
+		bls_val->meas_gb = readl(base + CIF_ISP_BLS_B_MEASURED);
+		bls_val->meas_gr = readl(base + CIF_ISP_BLS_C_MEASURED);
+		bls_val->meas_r = readl(base + CIF_ISP_BLS_D_MEASURED);
+	} else if (in_fmt->bayer_pat == RAW_GBRG) {
+		bls_val->meas_gb = readl(base + CIF_ISP_BLS_A_MEASURED);
+		bls_val->meas_b = readl(base + CIF_ISP_BLS_B_MEASURED);
+		bls_val->meas_r = readl(base + CIF_ISP_BLS_C_MEASURED);
+		bls_val->meas_gr = readl(base + CIF_ISP_BLS_D_MEASURED);
+	} else if (in_fmt->bayer_pat == RAW_GRBG) {
+		bls_val->meas_gr = readl(base + CIF_ISP_BLS_A_MEASURED);
+		bls_val->meas_r = readl(base + CIF_ISP_BLS_B_MEASURED);
+		bls_val->meas_b = readl(base + CIF_ISP_BLS_C_MEASURED);
+		bls_val->meas_gb = readl(base + CIF_ISP_BLS_D_MEASURED);
+	} else if (in_fmt->bayer_pat == RAW_RGGB) {
+		bls_val->meas_r = readl(base + CIF_ISP_BLS_A_MEASURED);
+		bls_val->meas_gr = readl(base + CIF_ISP_BLS_B_MEASURED);
+		bls_val->meas_gb = readl(base + CIF_ISP_BLS_C_MEASURED);
+		bls_val->meas_b = readl(base + CIF_ISP_BLS_D_MEASURED);
+	}
+}
+
+static void
+rkisp1_stats_send_measurement(struct rkisp1_isp_stats_vdev *stats_vdev,
+			      struct rkisp1_isp_readout_work *meas_work)
+{
+	struct rkisp1_stat_buffer *cur_stat_buf;
+	struct rkisp1_buffer *cur_buf = NULL;
+	unsigned int cur_frame_id = -1;
+	u64 timestamp = ktime_get_ns();
+
+	cur_frame_id = atomic_read(&stats_vdev->dev->isp_sdev.frm_sync_seq) - 1;
+	if (cur_frame_id != meas_work->frame_id) {
+		dev_warn(stats_vdev->dev->dev,
+			 "Measurement late(%d, %d)\n",
+			 cur_frame_id, meas_work->frame_id);
+		cur_frame_id = meas_work->frame_id;
+	}
+
+	mutex_lock(&stats_vdev->wq_lock);
+	/* get one empty buffer */
+	if (!list_empty(&stats_vdev->stat)) {
+		cur_buf = list_first_entry(&stats_vdev->stat,
+					   struct rkisp1_buffer, queue);
+		list_del(&cur_buf->queue);
+	}
+	mutex_unlock(&stats_vdev->wq_lock);
+
+	if (!cur_buf)
+		return;
+
+	cur_stat_buf =
+		(struct rkisp1_stat_buffer *)(cur_buf->vaddr[0]);
+
+	if (meas_work->isp_ris & CIF_ISP_AWB_DONE) {
+		rkisp1_stats_get_awb_meas(stats_vdev, cur_stat_buf);
+		cur_stat_buf->meas_type |= CIFISP_STAT_AWB;
+	}
+
+	if (meas_work->isp_ris & CIF_ISP_AFM_FIN) {
+		rkisp1_stats_get_afc_meas(stats_vdev, cur_stat_buf);
+		cur_stat_buf->meas_type |= CIFISP_STAT_AFM_FIN;
+	}
+
+	if (meas_work->isp_ris & CIF_ISP_EXP_END) {
+		rkisp1_stats_get_aec_meas(stats_vdev, cur_stat_buf);
+		rkisp1_stats_get_bls_meas(stats_vdev, cur_stat_buf);
+		cur_stat_buf->meas_type |= CIFISP_STAT_AUTOEXP;
+	}
+
+	if (meas_work->isp_ris & CIF_ISP_HIST_MEASURE_RDY) {
+		rkisp1_stats_get_hst_meas(stats_vdev, cur_stat_buf);
+		cur_stat_buf->meas_type |= CIFISP_STAT_HIST;
+	}
+
+	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
+			      sizeof(struct rkisp1_stat_buffer));
+	cur_buf->vb.sequence = cur_frame_id;
+	cur_buf->vb.vb2_buf.timestamp = timestamp;
+	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static void rkisp1_stats_readout_work(struct work_struct *work)
+{
+	struct rkisp1_isp_readout_work *readout_work = container_of(work,
+						struct rkisp1_isp_readout_work,
+						work);
+	struct rkisp1_isp_stats_vdev *stats_vdev = readout_work->stats_vdev;
+
+	if (readout_work->readout == RKISP1_ISP_READOUT_MEAS)
+		rkisp1_stats_send_measurement(stats_vdev, readout_work);
+
+	kfree(readout_work);
+}
+
+int rkisp1_stats_isr(struct rkisp1_isp_stats_vdev *stats_vdev, u32 isp_ris)
+{
+	unsigned int cur_frame_id =
+		atomic_read(&stats_vdev->dev->isp_sdev.frm_sync_seq) - 1;
+	struct rkisp1_isp_readout_work *work;
+	unsigned int isp_mis_tmp = 0;
+
+	spin_lock(&stats_vdev->irq_lock);
+
+	writel((CIF_ISP_AWB_DONE | CIF_ISP_AFM_FIN | CIF_ISP_EXP_END |
+		CIF_ISP_HIST_MEASURE_RDY),
+		stats_vdev->dev->base_addr + CIF_ISP_ICR);
+
+	isp_mis_tmp = readl(stats_vdev->dev->base_addr + CIF_ISP_MIS);
+	if (isp_mis_tmp &
+		(CIF_ISP_AWB_DONE | CIF_ISP_AFM_FIN |
+		 CIF_ISP_EXP_END | CIF_ISP_HIST_MEASURE_RDY))
+		dev_err(stats_vdev->dev->dev, "isp icr 3A info err: 0x%x\n",
+			isp_mis_tmp);
+
+	if (!stats_vdev->streamon)
+		goto unlock;
+	if (isp_ris & (CIF_ISP_AWB_DONE | CIF_ISP_AFM_FIN | CIF_ISP_EXP_END |
+		CIF_ISP_HIST_MEASURE_RDY)) {
+		work = (struct rkisp1_isp_readout_work *)
+			kzalloc(sizeof(struct rkisp1_isp_readout_work),
+				GFP_ATOMIC);
+		if (work) {
+			INIT_WORK(&work->work,
+				  rkisp1_stats_readout_work);
+			work->readout = RKISP1_ISP_READOUT_MEAS;
+			work->stats_vdev = stats_vdev;
+			work->frame_id = cur_frame_id;
+			work->isp_ris = isp_ris;
+			if (!queue_work(stats_vdev->readout_wq,
+					&work->work))
+				kfree(work);
+		} else {
+			dev_err(stats_vdev->dev->dev,
+				"Could not allocate work\n");
+		}
+	}
+
+unlock:
+	spin_unlock(&stats_vdev->irq_lock);
+
+	return 0;
+}
+
+static void rkisp1_init_stats_vdev(struct rkisp1_isp_stats_vdev *stats_vdev)
+{
+	stats_vdev->vdev_fmt.fmt.meta.dataformat =
+		V4L2_META_FMT_RK_ISP1_STAT_3A;
+	stats_vdev->vdev_fmt.fmt.meta.buffersize =
+		sizeof(struct rkisp1_stat_buffer);
+}
+
+int rkisp1_register_stats_vdev(struct rkisp1_isp_stats_vdev *stats_vdev,
+			       struct v4l2_device *v4l2_dev,
+			       struct rkisp1_device *dev)
+{
+	struct rkisp1_vdev_node *node = &stats_vdev->vnode;
+	struct video_device *vdev = &node->vdev;
+	int ret;
+
+	stats_vdev->dev = dev;
+	mutex_init(&stats_vdev->wq_lock);
+	mutex_init(&node->vlock);
+	INIT_LIST_HEAD(&stats_vdev->stat);
+	spin_lock_init(&stats_vdev->irq_lock);
+
+	strscpy(vdev->name, "rkisp1-statistics", sizeof(vdev->name));
+
+	video_set_drvdata(vdev, stats_vdev);
+	vdev->ioctl_ops = &rkisp1_stats_ioctl;
+	vdev->fops = &rkisp1_stats_fops;
+	vdev->release = video_device_release_empty;
+	vdev->lock = &node->vlock;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->queue = &node->buf_queue;
+	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->vfl_dir =  VFL_DIR_RX;
+	rkisp1_stats_init_vb2_queue(vdev->queue, stats_vdev);
+	rkisp1_init_stats_vdev(stats_vdev);
+	video_set_drvdata(vdev, stats_vdev);
+
+	node->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
+	if (ret < 0)
+		goto err_release_queue;
+
+	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (ret < 0) {
+		dev_err(&vdev->dev,
+			"could not register Video for Linux device\n");
+		goto err_cleanup_media_entity;
+	}
+
+	stats_vdev->readout_wq = alloc_workqueue("measurement_queue",
+						 WQ_UNBOUND | WQ_MEM_RECLAIM,
+						 1);
+
+	if (!stats_vdev->readout_wq) {
+		ret = -ENOMEM;
+		goto err_unreg_vdev;
+	}
+
+	return 0;
+
+err_unreg_vdev:
+	video_unregister_device(vdev);
+err_cleanup_media_entity:
+	media_entity_cleanup(&vdev->entity);
+err_release_queue:
+	vb2_queue_release(vdev->queue);
+	mutex_destroy(&node->vlock);
+	mutex_destroy(&stats_vdev->wq_lock);
+	return ret;
+}
+
+void rkisp1_unregister_stats_vdev(struct rkisp1_isp_stats_vdev *stats_vdev)
+{
+	struct rkisp1_vdev_node *node = &stats_vdev->vnode;
+	struct video_device *vdev = &node->vdev;
+
+	destroy_workqueue(stats_vdev->readout_wq);
+	video_unregister_device(vdev);
+	media_entity_cleanup(&vdev->entity);
+	vb2_queue_release(vdev->queue);
+	mutex_destroy(&node->vlock);
+	mutex_destroy(&stats_vdev->wq_lock);
+}
diff --git a/drivers/staging/media/rkisp1/isp_stats.h b/drivers/staging/media/rkisp1/isp_stats.h
new file mode 100644
index 000000000000..34e4fe8b4305
--- /dev/null
+++ b/drivers/staging/media/rkisp1/isp_stats.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - Stats subdevice header
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_ISP_STATS_H
+#define _RKISP1_ISP_STATS_H
+
+#include "uapi/rkisp1-config.h"
+
+#include "common.h"
+
+struct rkisp1_isp_stats_vdev;
+
+enum rkisp1_isp_readout_cmd {
+	RKISP1_ISP_READOUT_MEAS,
+	RKISP1_ISP_READOUT_META,
+};
+
+struct rkisp1_isp_readout_work {
+	struct work_struct work;
+	struct rkisp1_isp_stats_vdev *stats_vdev;
+
+	unsigned int frame_id;
+	unsigned int isp_ris;
+	enum rkisp1_isp_readout_cmd readout;
+	struct vb2_buffer *vb;
+};
+
+/*
+ * struct rkisp1_isp_stats_vdev - ISP Statistics device
+ *
+ * @irq_lock: buffer queue lock
+ * @stat: stats buffer list
+ * @readout_wq: workqueue for statistics information read
+ */
+struct rkisp1_isp_stats_vdev {
+	struct rkisp1_vdev_node vnode;
+	struct rkisp1_device *dev;
+
+	spinlock_t irq_lock;
+	struct list_head stat;
+	struct v4l2_format vdev_fmt;
+	bool streamon;
+
+	struct workqueue_struct *readout_wq;
+	struct mutex wq_lock;
+};
+
+int rkisp1_stats_isr(struct rkisp1_isp_stats_vdev *stats_vdev, u32 isp_ris);
+
+int rkisp1_register_stats_vdev(struct rkisp1_isp_stats_vdev *stats_vdev,
+			       struct v4l2_device *v4l2_dev,
+			       struct rkisp1_device *dev);
+
+void rkisp1_unregister_stats_vdev(struct rkisp1_isp_stats_vdev *stats_vdev);
+
+#endif /* _RKISP1_ISP_STATS_H */
-- 
2.22.0

