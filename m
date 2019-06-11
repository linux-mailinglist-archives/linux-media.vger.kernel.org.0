Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E973C1B4
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 05:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391061AbfFKDyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 23:54:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52806 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391040AbfFKDyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 23:54:22 -0400
X-UUID: 0bb402e64bbc44719b8af4333c1e7705-20190611
X-UUID: 0bb402e64bbc44719b8af4333c1e7705-20190611
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1651304447; Tue, 11 Jun 2019 11:53:59 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 11:53:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 11:53:58 +0800
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
Subject: [RFC,v3 7/9] media: platform: Add Mediatek ISP P1 device driver
Date:   Tue, 11 Jun 2019 11:53:42 +0800
Message-ID: <20190611035344.29814-8-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the Mediatek ISP P1 HW control device driver.
It handles the ISP HW configuration, provides interrupt handling and
initializes the V4L2 device nodes and other functions.

(The current metadata interface used in meta input and partial
meta nodes is only a temporary solution to kick off the driver
development and is not ready to be reviewed yet.)

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../platform/mtk-isp/isp_50/cam/Makefile      |    1 +
 .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |  126 ++
 .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 1087 +++++++++++++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  243 ++++
 4 files changed, 1457 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h

diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
index 7558593e63f0..30df10983f6a 100644
--- a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
@@ -2,5 +2,6 @@
 
 mtk-cam-isp-objs += mtk_cam-ctrl.o
 mtk-cam-isp-objs += mtk_cam-v4l2-util.o
+mtk-cam-isp-objs += mtk_cam.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
\ No newline at end of file
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
new file mode 100644
index 000000000000..9e59a6bfc6b7
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef _CAM_REGS_H
+#define _CAM_REGS_H
+
+/* TG Bit Mask */
+#define VFDATA_EN_BIT			BIT(0)
+#define CMOS_EN_BIT			BIT(0)
+
+/* normal signal bit */
+#define VS_INT_ST			BIT(0)
+#define HW_PASS1_DON_ST		BIT(11)
+#define SOF_INT_ST			BIT(12)
+#define SW_PASS1_DON_ST		BIT(30)
+
+/* err status bit */
+#define TG_ERR_ST			BIT(4)
+#define TG_GBERR_ST			BIT(5)
+#define CQ_CODE_ERR_ST			BIT(6)
+#define CQ_APB_ERR_ST			BIT(7)
+#define CQ_VS_ERR_ST			BIT(8)
+#define AMX_ERR_ST			BIT(15)
+#define RMX_ERR_ST			BIT(16)
+#define BMX_ERR_ST			BIT(17)
+#define RRZO_ERR_ST			BIT(18)
+#define AFO_ERR_ST			BIT(19)
+#define IMGO_ERR_ST			BIT(20)
+#define AAO_ERR_ST			BIT(21)
+#define PSO_ERR_ST			BIT(22)
+#define LCSO_ERR_ST			BIT(23)
+#define BNR_ERR_ST			BIT(24)
+#define LSCI_ERR_ST			BIT(25)
+#define DMA_ERR_ST			BIT(29)
+
+/* CAM DMA done status */
+#define FLKO_DONE_ST			BIT(4)
+#define AFO_DONE_ST			BIT(5)
+#define AAO_DONE_ST			BIT(7)
+#define PSO_DONE_ST			BIT(14)
+
+/* IRQ signal mask */
+#define INT_ST_MASK_CAM		( \
+					VS_INT_ST |\
+					SOF_INT_ST |\
+					HW_PASS1_DON_ST |\
+					SW_PASS1_DON_ST)
+
+/* IRQ Error Mask */
+#define INT_ST_MASK_CAM_ERR		( \
+					TG_ERR_ST |\
+					TG_GBERR_ST |\
+					CQ_CODE_ERR_ST |\
+					CQ_APB_ERR_ST |\
+					CQ_VS_ERR_ST |\
+					BNR_ERR_ST |\
+					RMX_ERR_ST |\
+					BMX_ERR_ST |\
+					BNR_ERR_ST |\
+					LSCI_ERR_ST |\
+					DMA_ERR_ST)
+
+/* IRQ Signal Log Mask */
+#define INT_ST_LOG_MASK_CAM		( \
+					SOF_INT_ST |\
+					SW_PASS1_DON_ST |\
+					HW_PASS1_DON_ST |\
+					VS_INT_ST |\
+					TG_ERR_ST |\
+					TG_GBERR_ST |\
+					RRZO_ERR_ST |\
+					AFO_ERR_ST |\
+					IMGO_ERR_ST |\
+					AAO_ERR_ST |\
+					DMA_ERR_ST)
+
+/* DMA Event Notification Mask */
+#define DMA_ST_MASK_CAM		( \
+					AAO_DONE_ST |\
+					AFO_DONE_ST)
+
+/* Status check */
+#define REG_CTL_EN			0x0004
+#define REG_CTL_DMA_EN			0x0008
+#define REG_CTL_FMT_SEL		0x0010
+#define REG_CTL_EN2			0x0018
+#define REG_CTL_RAW_INT_EN		0x0020
+#define REG_CTL_RAW_INT_STAT		0x0024
+#define REG_CTL_RAW_INT2_STAT		0x0034
+
+#define REG_TG_SEN_MODE		0x0230
+#define REG_TG_VF_CON			0x0234
+
+#define REG_IMGO_BASE_ADDR		0x1020
+#define REG_RRZO_BASE_ADDR		0x1050
+
+/* Error status log */
+#define REG_IMGO_ERR_STAT		0x1360
+#define REG_RRZO_ERR_STAT		0x1364
+#define REG_AAO_ERR_STAT		0x1368
+#define REG_AFO_ERR_STAT		0x136c
+#define REG_LCSO_ERR_STAT		0x1370
+#define REG_UFEO_ERR_STAT		0x1374
+#define REG_PDO_ERR_STAT		0x1378
+#define REG_BPCI_ERR_STAT		0x137c
+#define REG_LSCI_ERR_STAT		0x1384
+#define REG_PDI_ERR_STAT		0x138c
+#define REG_LMVO_ERR_STAT		0x1390
+#define REG_FLKO_ERR_STAT		0x1394
+#define REG_PSO_ERR_STAT		0x13a0
+
+/* ISP command */
+#define REG_CQ_THR0_BASEADDR		0x0198
+#define REG_HW_FRAME_NUM		0x13b8
+
+/* META */
+#define REG_META0_VB2_INDEX		0x14dc
+#define REG_META1_VB2_INDEX		0x151c
+
+/* FBC */
+#define REG_AAO_FBC_STATUS		0x013c
+#define REG_AFO_FBC_STATUS		0x0134
+
+#endif	/* _CAM_REGS_H */
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
new file mode 100644
index 000000000000..c5a3babed69d
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
@@ -0,0 +1,1087 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2018 MediaTek Inc.
+
+#include <linux/atomic.h>
+#include <linux/cdev.h>
+#include <linux/compat.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/mtk_scp.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/sched/clock.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-event.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-regs.h"
+#include "mtk_cam-smem.h"
+
+static const struct of_device_id mtk_isp_of_ids[] = {
+	{.compatible = "mediatek,mt8183-camisp",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_isp_of_ids);
+
+/* List of clocks required by isp cam */
+static const char * const mtk_isp_clks[] = {
+	"camsys_cam_cgpdn", "camsys_camtg_cgpdn"
+};
+
+static void isp_dump_dma_status(struct isp_device *isp_dev)
+{
+	dev_err(isp_dev->dev,
+		"IMGO:0x%x, RRZO:0x%x, AAO=0x%x, AFO=0x%x, LMVO=0x%x\n",
+		readl(isp_dev->regs + REG_IMGO_ERR_STAT),
+		readl(isp_dev->regs + REG_RRZO_ERR_STAT),
+		readl(isp_dev->regs + REG_AAO_ERR_STAT),
+		readl(isp_dev->regs + REG_AFO_ERR_STAT),
+		readl(isp_dev->regs + REG_LMVO_ERR_STAT));
+	dev_err(isp_dev->dev,
+		"LCSO=0x%x, PSO=0x%x, FLKO=0x%x, BPCI:0x%x, LSCI=0x%x\n",
+		readl(isp_dev->regs + REG_LCSO_ERR_STAT),
+		readl(isp_dev->regs + REG_PSO_ERR_STAT),
+		readl(isp_dev->regs + REG_FLKO_ERR_STAT),
+		readl(isp_dev->regs + REG_BPCI_ERR_STAT),
+		readl(isp_dev->regs + REG_LSCI_ERR_STAT));
+}
+
+static void mtk_cam_dev_event_frame_sync(struct mtk_cam_dev *cam_dev,
+					 __u32 frame_seq_no)
+{
+	struct v4l2_event event;
+
+	memset(&event, 0, sizeof(event));
+	event.type = V4L2_EVENT_FRAME_SYNC;
+	event.u.frame_sync.frame_sequence = frame_seq_no;
+	v4l2_event_queue(cam_dev->subdev.devnode, &event);
+}
+
+static void mtk_cam_dev_job_finish(struct mtk_isp_p1_ctx *isp_ctx,
+				   unsigned int request_fd,
+				   unsigned int frame_seq_no,
+				   struct list_head *list_buf,
+				   enum vb2_buffer_state state)
+{
+	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
+	struct mtk_cam_dev *cam_dev = &p1_dev->cam_dev;
+	struct mtk_cam_dev_buffer *buf, *b0;
+	u64    timestamp;
+
+	if (!cam_dev->streaming)
+		return;
+
+	dev_dbg(&p1_dev->pdev->dev, "%s request fd:%d frame_seq:%d state:%d\n",
+		__func__, request_fd, frame_seq_no, state);
+
+	/*
+	 * Set the buffer's VB2 status so that the user can dequeue
+	 * the buffer.
+	 */
+	timestamp = ktime_get_ns();
+	list_for_each_entry_safe(buf, b0, list_buf, list) {
+		list_del(&buf->list);
+		buf->vbb.vb2_buf.timestamp = timestamp;
+		buf->vbb.sequence = frame_seq_no;
+		if (buf->vbb.vb2_buf.state == VB2_BUF_STATE_ACTIVE)
+			vb2_buffer_done(&buf->vbb.vb2_buf, state);
+	}
+}
+
+static void isp_deque_frame(struct isp_p1_device *p1_dev,
+			    unsigned int node_id, int vb2_index,
+			    int frame_seq_no)
+{
+	struct mtk_cam_dev *cam_dev = &p1_dev->cam_dev;
+	struct device *dev = &p1_dev->pdev->dev;
+	struct mtk_cam_video_device *node = &cam_dev->vdev_nodes[node_id];
+	struct mtk_cam_dev_buffer *b, *b0;
+	struct vb2_buffer *vb;
+
+	if (!cam_dev->vdev_nodes[node_id].enabled || !cam_dev->streaming)
+		return;
+
+	spin_lock(&node->slock);
+	b = list_first_entry(&node->pending_list,
+			     struct mtk_cam_dev_buffer,
+			     list);
+	list_for_each_entry_safe(b, b0, &node->pending_list, list) {
+		vb = &b->vbb.vb2_buf;
+		if (!vb->vb2_queue->uses_requests &&
+		    vb->index == vb2_index &&
+		    vb->state == VB2_BUF_STATE_ACTIVE) {
+			dev_dbg(dev, "%s:%d:%d", __func__, node_id, vb2_index);
+			vb->timestamp = ktime_get_ns();
+			b->vbb.sequence = frame_seq_no;
+			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+			list_del(&b->list);
+			break;
+		}
+	}
+	spin_unlock(&node->slock);
+}
+
+static void isp_deque_request_frame(struct isp_p1_device *p1_dev,
+				    int frame_seq_no)
+{
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct device *dev = &p1_dev->pdev->dev;
+	struct mtk_isp_queue_job *framejob, *tmp;
+	struct isp_queue *p1_enqueue_list = &isp_ctx->p1_enqueue_list;
+
+	/* Match dequeue work and enqueue frame */
+	spin_lock(&p1_enqueue_list->lock);
+	list_for_each_entry_safe(framejob, tmp, &p1_enqueue_list->queue,
+				 list_entry) {
+		dev_dbg(dev,
+			"%s frame_seq_no:%d, target frame_seq_no:%d\n",
+			__func__,
+			framejob->frame_seq_no, frame_seq_no);
+		/* Match by the en-queued request number */
+		if (framejob->frame_seq_no == frame_seq_no) {
+			/* Pass to user space */
+			mtk_cam_dev_job_finish(isp_ctx,
+					       framejob->request_fd,
+					       framejob->frame_seq_no,
+					       &framejob->list_buf,
+					       VB2_BUF_STATE_DONE);
+			atomic_dec(&p1_enqueue_list->queue_cnt);
+			dev_dbg(dev,
+				"frame_seq_no:%d is done, queue_cnt:%d\n",
+				framejob->frame_seq_no,
+				atomic_read(&p1_enqueue_list->queue_cnt));
+
+			/* Remove only when frame ready */
+			list_del(&framejob->list_entry);
+			kfree(framejob);
+			break;
+		} else if (framejob->frame_seq_no < frame_seq_no) {
+			/* Pass to user space for frame drop */
+			mtk_cam_dev_job_finish(isp_ctx,
+					       framejob->request_fd,
+					       framejob->frame_seq_no,
+					       &framejob->list_buf,
+					       VB2_BUF_STATE_ERROR);
+			atomic_dec(&p1_enqueue_list->queue_cnt);
+			dev_warn(dev,
+				 "frame_seq_no:%d drop, queue_cnt:%d\n",
+				 framejob->frame_seq_no,
+				 atomic_read(&p1_enqueue_list->queue_cnt));
+
+			/* Remove only drop frame */
+			list_del(&framejob->list_entry);
+			kfree(framejob);
+		} else {
+			break;
+		}
+	}
+	spin_unlock(&p1_enqueue_list->lock);
+}
+
+static int isp_deque_work(void *data)
+{
+	struct isp_p1_device *p1_dev = (struct isp_p1_device *)data;
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct mtk_cam_dev_stat_event_data event_data;
+	atomic_t *irq_data_end = &isp_ctx->irq_data_end;
+	atomic_t *irq_data_start = &isp_ctx->irq_data_start;
+	unsigned long flags;
+	int ret, i;
+
+	while (1) {
+		ret = wait_event_interruptible(isp_ctx->isp_deque_thread.wq,
+					       (atomic_read(irq_data_end) !=
+					       atomic_read(irq_data_start)) ||
+					       kthread_should_stop());
+
+		if (kthread_should_stop())
+			break;
+
+		spin_lock_irqsave(&isp_ctx->irq_dequeue_lock, flags);
+		i = atomic_read(&isp_ctx->irq_data_start);
+		memcpy(&event_data, &isp_ctx->irq_event_datas[i],
+		       sizeof(event_data));
+		atomic_set(&isp_ctx->irq_data_start, ++i & 0x3);
+		spin_unlock_irqrestore(&isp_ctx->irq_dequeue_lock, flags);
+
+		if (event_data.irq_status_mask & HW_PASS1_DON_ST &&
+		    event_data.dma_status_mask & AAO_DONE_ST) {
+			isp_deque_frame(p1_dev,
+					MTK_CAM_P1_META_OUT_0,
+					event_data.meta0_vb2_index,
+					event_data.frame_seq_no);
+		}
+		if (event_data.dma_status_mask & AFO_DONE_ST) {
+			isp_deque_frame(p1_dev,
+					MTK_CAM_P1_META_OUT_1,
+					event_data.meta1_vb2_index,
+					event_data.frame_seq_no);
+		}
+		if (event_data.irq_status_mask & SW_PASS1_DON_ST) {
+			isp_deque_frame(p1_dev,
+					MTK_CAM_P1_META_OUT_0,
+					event_data.meta0_vb2_index,
+					event_data.frame_seq_no);
+			isp_deque_frame(p1_dev,
+					MTK_CAM_P1_META_OUT_1,
+					event_data.meta1_vb2_index,
+					event_data.frame_seq_no);
+			isp_deque_request_frame(p1_dev,
+						event_data.frame_seq_no);
+		}
+	}
+
+	return 0;
+}
+
+static int irq_handle_sof(struct isp_device *isp_dev,
+			  dma_addr_t base_addr,
+			  unsigned int frame_num)
+{
+	unsigned int addr_offset;
+	struct isp_p1_device *p1_dev = get_p1_device(isp_dev->dev);
+	int cq_num = atomic_read(&p1_dev->isp_ctx.composed_frame_id);
+
+	isp_dev->sof_count += 1;
+
+	if (cq_num <= frame_num) {
+		dev_dbg(isp_dev->dev,
+			"SOF_INT_ST, wait next, cq_num:%d, frame_num:%d",
+			cq_num, frame_num);
+		atomic_set(&p1_dev->isp_ctx.composing_frame, 0);
+		return cq_num;
+	}
+	atomic_set(&p1_dev->isp_ctx.composing_frame, cq_num - frame_num);
+
+	addr_offset = CQ_ADDRESS_OFFSET * (frame_num % CQ_BUFFER_COUNT);
+	writel(base_addr + addr_offset, isp_dev->regs + REG_CQ_THR0_BASEADDR);
+	dev_dbg(isp_dev->dev,
+		"SOF_INT_ST, update next, cq_num:%d, frame_num:%d cq_addr:0x%x",
+		cq_num, frame_num, addr_offset);
+
+	return cq_num;
+}
+
+static void irq_handle_notify_event(struct isp_device *isp_dev,
+				    unsigned int irq_status,
+				    unsigned int dma_status,
+				    bool sof_only)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(isp_dev->dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct device *dev = isp_dev->dev;
+	unsigned long flags;
+	int i;
+
+	if (irq_status & VS_INT_ST) {
+		/* Notify specific HW events to user space */
+		mtk_cam_dev_event_frame_sync(&p1_dev->cam_dev,
+					     isp_dev->current_frame);
+		dev_dbg(dev,
+			"frame sync is sent:%d:%d\n",
+			isp_dev->sof_count,
+			isp_dev->current_frame);
+		if (sof_only)
+			return;
+	}
+
+	if (irq_status & SW_PASS1_DON_ST) {
+		/* Notify TX thread to send if TX frame is blocked */
+		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
+	}
+
+	spin_lock_irqsave(&isp_ctx->irq_dequeue_lock, flags);
+	i = atomic_read(&isp_ctx->irq_data_end);
+	isp_ctx->irq_event_datas[i].frame_seq_no = isp_dev->current_frame;
+	isp_ctx->irq_event_datas[i].meta0_vb2_index = isp_dev->meta0_vb2_index;
+	isp_ctx->irq_event_datas[i].meta1_vb2_index = isp_dev->meta1_vb2_index;
+	isp_ctx->irq_event_datas[i].irq_status_mask =
+		(irq_status & INT_ST_MASK_CAM);
+	isp_ctx->irq_event_datas[i].dma_status_mask =
+		(dma_status & DMA_ST_MASK_CAM);
+	atomic_set(&isp_ctx->irq_data_end, ++i & 0x3);
+	spin_unlock_irqrestore(&isp_ctx->irq_dequeue_lock, flags);
+
+	wake_up_interruptible(&isp_ctx->isp_deque_thread.wq);
+
+	dev_dbg(dev,
+		"%s IRQ:0x%x DMA:0x%x seq:%d idx0:%d idx1:%d\n",
+		__func__,
+		(irq_status & INT_ST_MASK_CAM),
+		(dma_status & DMA_ST_MASK_CAM),
+		isp_dev->current_frame,
+		isp_dev->meta0_vb2_index,
+		isp_dev->meta1_vb2_index);
+}
+
+irqreturn_t isp_irq_cam(int irq, void *data)
+{
+	struct isp_device *isp_dev = (struct isp_device *)data;
+	struct isp_p1_device *p1_dev = get_p1_device(isp_dev->dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct device *dev = isp_dev->dev;
+	unsigned int cam_idx, cq_num, hw_frame_num;
+	unsigned int meta0_vb2_index, meta1_vb2_index;
+	unsigned int irq_status, err_status, dma_status;
+	unsigned int aao_fbc, afo_fbc;
+	unsigned long flags;
+
+	/* Check the streaming is off or not */
+	if (!p1_dev->cam_dev.streaming)
+		return IRQ_HANDLED;
+
+	cam_idx = isp_dev->isp_hw_module - ISP_CAM_A_IDX;
+	cq_num = 0;
+
+	spin_lock_irqsave(&isp_dev->spinlock_irq, flags);
+	irq_status = readl(isp_dev->regs + REG_CTL_RAW_INT_STAT);
+	dma_status = readl(isp_dev->regs + REG_CTL_RAW_INT2_STAT);
+	hw_frame_num = readl(isp_dev->regs + REG_HW_FRAME_NUM);
+	meta0_vb2_index = readl(isp_dev->regs + REG_META0_VB2_INDEX);
+	meta1_vb2_index = readl(isp_dev->regs + REG_META1_VB2_INDEX);
+	aao_fbc = readl(isp_dev->regs + REG_AAO_FBC_STATUS);
+	afo_fbc = readl(isp_dev->regs + REG_AFO_FBC_STATUS);
+	spin_unlock_irqrestore(&isp_dev->spinlock_irq, flags);
+
+	/* Ignore unnecessary IRQ */
+	if (!irq_status && (!(dma_status & DMA_ST_MASK_CAM)))
+		return IRQ_HANDLED;
+
+	err_status = irq_status & INT_ST_MASK_CAM_ERR;
+
+	/* Sof, done order check */
+	if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST)) {
+		dev_dbg(dev, "sof_done block cnt:%d\n", isp_dev->sof_count);
+
+		/* Notify IRQ event and enqueue frame */
+		irq_handle_notify_event(isp_dev, irq_status, dma_status, 0);
+		isp_dev->current_frame = hw_frame_num;
+		isp_dev->meta0_vb2_index = meta0_vb2_index;
+		isp_dev->meta1_vb2_index = meta1_vb2_index;
+	} else {
+		if (irq_status & SOF_INT_ST) {
+			isp_dev->current_frame = hw_frame_num;
+			isp_dev->meta0_vb2_index = meta0_vb2_index;
+			isp_dev->meta1_vb2_index = meta1_vb2_index;
+		}
+		irq_handle_notify_event(isp_dev, irq_status, dma_status, 1);
+	}
+
+	if (irq_status & SOF_INT_ST)
+		cq_num = irq_handle_sof(isp_dev, isp_ctx->scp_mem_iova,
+					hw_frame_num);
+
+	/* Check ISP error status */
+	if (err_status) {
+		dev_err(dev,
+			"raw_int_err:0x%x/0x%x\n",
+			irq_status, err_status);
+		/* Show DMA errors in detail */
+		if (err_status & DMA_ERR_ST)
+			isp_dump_dma_status(isp_dev);
+	}
+
+	if (irq_status & INT_ST_LOG_MASK_CAM)
+		dev_dbg(dev, IRQ_STAT_STR,
+			'A' + cam_idx,
+			isp_dev->sof_count,
+			irq_status,
+			dma_status,
+			hw_frame_num,
+			cq_num,
+			aao_fbc,
+			afo_fbc);
+
+	return IRQ_HANDLED;
+}
+
+static int isp_setup_scp_rproc(struct isp_p1_device *p1_dev)
+{
+	phandle rproc_phandle;
+	struct device *dev = &p1_dev->pdev->dev;
+	int ret;
+
+	p1_dev->scp_pdev = scp_get_pdev(p1_dev->pdev);
+	if (!p1_dev->scp_pdev) {
+		dev_err(dev, "Failed to get scp device\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(dev->of_node, "mediatek,scp",
+				   &rproc_phandle);
+	if (ret) {
+		dev_err(dev, "fail to get rproc_phandle:%d\n", ret);
+		return -EINVAL;
+	}
+
+	p1_dev->rproc_handle = rproc_get_by_phandle(rproc_phandle);
+	dev_dbg(dev, "p1 rproc_phandle: 0x%pK\n\n", p1_dev->rproc_handle);
+	if (!p1_dev->rproc_handle) {
+		dev_err(dev, "fail to get rproc_handle\n");
+		return -EINVAL;
+	}
+
+	ret = rproc_boot(p1_dev->rproc_handle);
+	if (ret) {
+		/*
+		 * Return 0 if downloading firmware successfully,
+		 * otherwise it is failed
+		 */
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int isp_init_context(struct isp_p1_device *p1_dev)
+{
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct device *dev = &p1_dev->pdev->dev;
+	unsigned int i;
+
+	dev_dbg(dev, "init irq work thread\n");
+	if (!isp_ctx->isp_deque_thread.thread) {
+		init_waitqueue_head(&isp_ctx->isp_deque_thread.wq);
+		isp_ctx->isp_deque_thread.thread =
+			kthread_run(isp_deque_work, (void *)p1_dev,
+				    "isp_deque_work");
+		if (IS_ERR(isp_ctx->isp_deque_thread.thread)) {
+			dev_err(dev, "unable to alloc kthread\n");
+			isp_ctx->isp_deque_thread.thread = NULL;
+			return -ENOMEM;
+		}
+	}
+	spin_lock_init(&isp_ctx->irq_dequeue_lock);
+	mutex_init(&isp_ctx->lock);
+
+	INIT_LIST_HEAD(&isp_ctx->p1_enqueue_list.queue);
+	atomic_set(&isp_ctx->p1_enqueue_list.queue_cnt, 0);
+
+	for (i = 0; i < ISP_DEV_NODE_NUM; i++)
+		spin_lock_init(&p1_dev->isp_devs[i].spinlock_irq);
+
+	spin_lock_init(&isp_ctx->p1_enqueue_list.lock);
+	spin_lock_init(&isp_ctx->composer_txlist.lock);
+
+	atomic_set(&isp_ctx->irq_data_end, 0);
+	atomic_set(&isp_ctx->irq_data_start, 0);
+
+	return 0;
+}
+
+static int isp_uninit_context(struct device *dev)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct mtk_isp_queue_job *framejob, *tmp_framejob;
+
+	spin_lock_irq(&isp_ctx->p1_enqueue_list.lock);
+	list_for_each_entry_safe(framejob, tmp_framejob,
+				 &isp_ctx->p1_enqueue_list.queue, list_entry) {
+		list_del(&framejob->list_entry);
+		kfree(framejob);
+	}
+	spin_unlock_irq(&isp_ctx->p1_enqueue_list.lock);
+
+	if (isp_ctx->isp_deque_thread.thread) {
+		kthread_stop(isp_ctx->isp_deque_thread.thread);
+		wake_up_interruptible(&isp_ctx->isp_deque_thread.wq);
+		isp_ctx->isp_deque_thread.thread = NULL;
+	}
+
+	mutex_destroy(&isp_ctx->lock);
+
+	return 0;
+}
+
+static unsigned int get_enabled_dma_ports(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int enabled_dma_ports, i;
+
+	/* Get the enabled meta DMA ports */
+	enabled_dma_ports = 0;
+
+	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++)
+		if (cam_dev->vdev_nodes[i].enabled)
+			enabled_dma_ports |=
+				cam_dev->vdev_nodes[i].desc.dma_port;
+
+	dev_dbg(&cam_dev->pdev->dev, "%s :0x%x", __func__, enabled_dma_ports);
+
+	return enabled_dma_ports;
+}
+
+/* Utility functions */
+static unsigned int get_sensor_pixel_id(unsigned int fmt)
+{
+	switch (fmt) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+		return RAW_PXL_ID_B;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+		return RAW_PXL_ID_GB;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+		return RAW_PXL_ID_GR;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return RAW_PXL_ID_R;
+	default:
+		return RAW_PXL_ID_B;
+	}
+}
+
+static unsigned int get_sensor_fmt(unsigned int fmt)
+{
+	switch (fmt) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return IMG_FMT_BAYER8;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return IMG_FMT_BAYER10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return IMG_FMT_BAYER12;
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return IMG_FMT_BAYER14;
+	default:
+		return IMG_FMT_UNKNOWN;
+	}
+}
+
+static unsigned int get_img_fmt(unsigned int fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_MTISP_B8:
+		return IMG_FMT_BAYER8;
+	case V4L2_PIX_FMT_MTISP_F8:
+		return IMG_FMT_FG_BAYER8;
+	case V4L2_PIX_FMT_MTISP_B10:
+		return IMG_FMT_BAYER10;
+	case V4L2_PIX_FMT_MTISP_F10:
+		return IMG_FMT_FG_BAYER10;
+	case V4L2_PIX_FMT_MTISP_B12:
+		return IMG_FMT_BAYER12;
+	case V4L2_PIX_FMT_MTISP_F12:
+		return IMG_FMT_FG_BAYER12;
+	case V4L2_PIX_FMT_MTISP_B14:
+		return IMG_FMT_BAYER14;
+	case V4L2_PIX_FMT_MTISP_F14:
+		return IMG_FMT_FG_BAYER14;
+	default:
+		return IMG_FMT_UNKNOWN;
+	}
+}
+
+static unsigned int get_pixel_byte(unsigned int fourcc)
+{
+	switch (fourcc) {
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
+		return 10;
+	}
+}
+
+static void config_img_fmt(struct device *dev, struct p1_img_output *out_fmt,
+			   const struct v4l2_format *in_fmt,
+			   const struct v4l2_subdev_format *sd_format)
+{
+	out_fmt->img_fmt = get_img_fmt(in_fmt->fmt.pix_mp.pixelformat);
+	out_fmt->pixel_byte = get_pixel_byte(in_fmt->fmt.pix_mp.pixelformat);
+	out_fmt->size.w = in_fmt->fmt.pix_mp.width;
+	out_fmt->size.h = in_fmt->fmt.pix_mp.height;
+
+	out_fmt->size.stride = in_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
+	out_fmt->size.xsize = in_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
+
+	out_fmt->crop.left = 0x0;
+	out_fmt->crop.top = 0x0;
+
+	out_fmt->crop.width = sd_format->format.width;
+	out_fmt->crop.height = sd_format->format.height;
+
+	WARN_ONCE(in_fmt->fmt.pix_mp.width > out_fmt->crop.width ||
+		  in_fmt->fmt.pix_mp.height > out_fmt->crop.height,
+		  "img out:%d:%d in:%d:%d",
+		  in_fmt->fmt.pix_mp.width, in_fmt->fmt.pix_mp.height,
+		  out_fmt->crop.width, out_fmt->crop.height);
+
+	dev_dbg(dev, "pixel_byte:%d img_fmt:0x%x\n",
+		out_fmt->pixel_byte,
+		out_fmt->img_fmt);
+	dev_dbg(dev,
+		"param:size=%0dx%0d, stride:%d, xsize:%d, crop=%0dx%0d\n",
+		out_fmt->size.w, out_fmt->size.h,
+		out_fmt->size.stride, out_fmt->size.xsize,
+		out_fmt->crop.width, out_fmt->crop.height);
+}
+
+/* ISP P1 interface functions */
+int mtk_isp_power_init(struct mtk_cam_dev *cam_dev)
+{
+	struct device *dev = &cam_dev->pdev->dev;
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	int ret;
+
+	ret = isp_setup_scp_rproc(p1_dev);
+	if (ret)
+		return ret;
+
+	ret = isp_init_context(p1_dev);
+	if (ret)
+		return ret;
+
+	ret = isp_composer_init(dev);
+	if (ret)
+		goto composer_err;
+
+	pm_runtime_get_sync(dev);
+
+	/* ISP HW INIT */
+	isp_ctx->isp_hw_module = ISP_CAM_B_IDX;
+	/* Use pure RAW as default HW path */
+	isp_ctx->isp_raw_path = ISP_PURE_RAW_PATH;
+	atomic_set(&p1_dev->cam_dev.streamed_node_count, 0);
+
+	isp_composer_hw_init(dev);
+	/* Check enabled DMAs which is configured by media setup */
+	isp_composer_meta_config(dev, get_enabled_dma_ports(cam_dev));
+
+	dev_dbg(dev, "%s done\n", __func__);
+
+	return 0;
+
+composer_err:
+	isp_uninit_context(dev);
+
+	return ret;
+}
+
+int mtk_isp_power_release(struct device *dev)
+{
+	isp_composer_hw_deinit(dev);
+	isp_uninit_context(dev);
+
+	dev_dbg(dev, "%s done\n", __func__);
+
+	return 0;
+}
+
+int mtk_isp_config(struct device *dev)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct p1_config_param config_param;
+	struct mtk_cam_dev *cam_dev = &p1_dev->cam_dev;
+	struct v4l2_subdev_format sd_fmt;
+	unsigned int enabled_dma_ports;
+	struct v4l2_format *img_fmt;
+	int ret;
+
+	p1_dev->isp_devs[isp_ctx->isp_hw_module].current_frame = 0;
+	p1_dev->isp_devs[isp_ctx->isp_hw_module].sof_count = 0;
+
+	isp_ctx->frame_seq_no = 1;
+	atomic_set(&isp_ctx->composed_frame_id, 0);
+
+	/* Get the enabled DMA ports */
+	enabled_dma_ports = get_enabled_dma_ports(cam_dev);
+	dev_dbg(dev, "%s enable_dma_ports:0x%x", __func__, enabled_dma_ports);
+
+	/* Sensor config */
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	ret = v4l2_subdev_call(cam_dev->sensor, pad, get_fmt, NULL, &sd_fmt);
+
+	if (ret) {
+		dev_dbg(dev, "sensor g_fmt on failed:%d\n", ret);
+		return -EPERM;
+	}
+
+	dev_dbg(dev,
+		"get_fmt ret=%d, w=%d, h=%d, code=0x%x, field=%d, color=%d\n",
+		ret, sd_fmt.format.width, sd_fmt.format.height,
+		sd_fmt.format.code, sd_fmt.format.field,
+		sd_fmt.format.colorspace);
+
+	config_param.cfg_in_param.continuous = 0x1;
+	config_param.cfg_in_param.subsample = 0x0;
+	/* Fix to one pixel mode in default */
+	config_param.cfg_in_param.pixel_mode = 0x1;
+	/* Support normal pattern in default */
+	config_param.cfg_in_param.data_pattern = 0x0;
+
+	config_param.cfg_in_param.crop.left = 0x0;
+	config_param.cfg_in_param.crop.top = 0x0;
+
+	config_param.cfg_in_param.raw_pixel_id =
+		get_sensor_pixel_id(sd_fmt.format.code);
+	config_param.cfg_in_param.img_fmt = get_sensor_fmt(sd_fmt.format.code);
+	config_param.cfg_in_param.crop.width = sd_fmt.format.width;
+	config_param.cfg_in_param.crop.height = sd_fmt.format.height;
+
+	config_param.cfg_main_param.bypass = 1;
+	img_fmt = &cam_dev->vdev_nodes[MTK_CAM_P1_MAIN_STREAM_OUT].vdev_fmt;
+	if ((enabled_dma_ports & R_IMGO) == R_IMGO) {
+		config_param.cfg_main_param.bypass = 0;
+		config_param.cfg_main_param.pure_raw = isp_ctx->isp_raw_path;
+		config_param.cfg_main_param.pure_raw_pack = 1;
+		config_img_fmt(dev, &config_param.cfg_main_param.output,
+			       img_fmt, &sd_fmt);
+	}
+
+	config_param.cfg_resize_param.bypass = 1;
+	img_fmt = &cam_dev->vdev_nodes[MTK_CAM_P1_PACKED_BIN_OUT].vdev_fmt;
+	if ((enabled_dma_ports & R_RRZO) == R_RRZO) {
+		config_param.cfg_resize_param.bypass = 0;
+		config_img_fmt(dev, &config_param.cfg_resize_param.output,
+			       img_fmt, &sd_fmt);
+	}
+
+	/* Configure meta DMAs info. */
+	config_param.cfg_meta_param.enabled_meta_dmas = enabled_dma_ports;
+
+	isp_composer_hw_config(dev, &config_param);
+
+	dev_dbg(dev, "%s done\n", __func__);
+
+	return 0;
+}
+
+void mtk_isp_enqueue(struct device *dev, unsigned int dma_port,
+		     struct mtk_cam_dev_buffer *buffer)
+{
+	struct mtk_isp_scp_p1_cmd frameparams;
+
+	memset(&frameparams, 0, sizeof(frameparams));
+	frameparams.cmd_id = ISP_CMD_ENQUEUE_META;
+	frameparams.meta_frame.enabled_dma = dma_port;
+	frameparams.meta_frame.vb_index = buffer->vbb.vb2_buf.index;
+	frameparams.meta_frame.meta_addr.iova = buffer->daddr;
+	frameparams.meta_frame.meta_addr.scp_addr = buffer->scp_addr;
+
+	isp_composer_enqueue(dev, &frameparams, SCP_ISP_CMD);
+}
+
+void mtk_isp_req_flush_buffers(struct device *dev)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_queue_job *job, *j0;
+	struct mtk_cam_dev_buffer *buf, *b0;
+	struct isp_queue *p1_list = &p1_dev->isp_ctx.p1_enqueue_list;
+
+	if (!atomic_read(&p1_list->queue_cnt))
+		return;
+
+	spin_lock(&p1_list->lock);
+	list_for_each_entry_safe(job, j0, &p1_list->queue, list_entry) {
+		list_for_each_entry_safe(buf, b0, &job->list_buf, list) {
+			list_del(&buf->list);
+			if (buf->vbb.vb2_buf.state == VB2_BUF_STATE_ACTIVE)
+				vb2_buffer_done(&buf->vbb.vb2_buf,
+						VB2_BUF_STATE_ERROR);
+		}
+		list_del(&job->list_entry);
+		atomic_dec(&p1_list->queue_cnt);
+		kfree(job);
+	}
+	spin_unlock(&p1_list->lock);
+}
+
+void mtk_isp_req_enqueue(struct device *dev, struct media_request *req)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	struct p1_frame_param frameparams;
+	struct mtk_isp_queue_job *framejob;
+	struct media_request_object *obj, *obj_safe;
+	struct vb2_buffer *vb;
+	struct mtk_cam_dev_buffer *buf;
+
+	framejob = kzalloc(sizeof(*framejob), GFP_ATOMIC);
+	memset(framejob, 0, sizeof(*framejob));
+	memset(&frameparams, 0, sizeof(frameparams));
+	INIT_LIST_HEAD(&framejob->list_buf);
+
+	frameparams.frame_seq_no = isp_ctx->frame_seq_no++;
+	frameparams.sof_idx =
+		p1_dev->isp_devs[isp_ctx->isp_hw_module].sof_count;
+	framejob->frame_seq_no = frameparams.frame_seq_no;
+
+	list_for_each_entry_safe(obj, obj_safe, &req->objects, list) {
+		vb = container_of(obj, struct vb2_buffer, req_obj);
+		buf = container_of(vb, struct mtk_cam_dev_buffer, vbb.vb2_buf);
+		framejob->request_fd = buf->vbb.request_fd;
+		frameparams.dma_buffers[buf->node_id].iova = buf->daddr;
+		frameparams.dma_buffers[buf->node_id].scp_addr = buf->scp_addr;
+		list_add_tail(&buf->list, &framejob->list_buf);
+	}
+
+	spin_lock(&isp_ctx->p1_enqueue_list.lock);
+	list_add_tail(&framejob->list_entry, &isp_ctx->p1_enqueue_list.queue);
+	atomic_inc(&isp_ctx->p1_enqueue_list.queue_cnt);
+	spin_unlock(&isp_ctx->p1_enqueue_list.lock);
+
+	isp_composer_enqueue(dev, &frameparams, SCP_ISP_FRAME);
+	dev_dbg(dev, "request fd:%d frame_seq_no:%d is queued cnt:%d\n",
+		framejob->request_fd,
+		frameparams.frame_seq_no,
+		atomic_read(&isp_ctx->p1_enqueue_list.queue_cnt));
+}
+
+static int enable_sys_clock(struct isp_p1_device *p1_dev)
+{
+	struct device *dev = &p1_dev->pdev->dev;
+	int ret;
+
+	dev_info(dev, "- %s\n", __func__);
+
+	ret = clk_bulk_prepare_enable(p1_dev->isp_ctx.num_clks,
+				      p1_dev->isp_ctx.clk_list);
+	if (ret)
+		goto clk_err;
+
+	return 0;
+
+clk_err:
+	dev_err(dev, "cannot pre-en isp_cam clock:%d\n", ret);
+	clk_bulk_disable_unprepare(p1_dev->isp_ctx.num_clks,
+				   p1_dev->isp_ctx.clk_list);
+	return ret;
+}
+
+static void disable_sys_clock(struct isp_p1_device *p1_dev)
+{
+	dev_info(&p1_dev->pdev->dev, "- %s\n", __func__);
+	clk_bulk_disable_unprepare(p1_dev->isp_ctx.num_clks,
+				   p1_dev->isp_ctx.clk_list);
+}
+
+static int mtk_isp_suspend(struct device *dev)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	int module = p1_dev->isp_ctx.isp_hw_module;
+	struct isp_device *isp_dev = &p1_dev->isp_devs[module];
+	unsigned int reg_val;
+
+	dev_dbg(dev, "- %s\n", __func__);
+
+	isp_dev = &p1_dev->isp_devs[module];
+	reg_val = readl(isp_dev->regs + REG_TG_VF_CON);
+	if (reg_val & VFDATA_EN_BIT) {
+		dev_dbg(dev, "Cam:%d suspend, disable VF\n", module);
+		/* Disable view finder */
+		writel((reg_val & (~VFDATA_EN_BIT)),
+		       isp_dev->regs + REG_TG_VF_CON);
+		/*
+		 * After VF enable, the TG frame count will be reset to 0;
+		 */
+		reg_val = readl(isp_dev->regs + REG_TG_SEN_MODE);
+		writel((reg_val & (~CMOS_EN_BIT)),
+		       isp_dev->regs +  + REG_TG_SEN_MODE);
+	}
+
+	disable_sys_clock(p1_dev);
+
+	return 0;
+}
+
+static int mtk_isp_resume(struct device *dev)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	int module = p1_dev->isp_ctx.isp_hw_module;
+	struct isp_device *isp_dev = &p1_dev->isp_devs[module];
+	unsigned int reg_val;
+
+	dev_dbg(dev, "- %s\n", __func__);
+
+	enable_sys_clock(p1_dev);
+
+	/* V4L2 stream-on phase & restore HW stream-on status */
+	if (p1_dev->cam_dev.streaming) {
+		dev_dbg(dev, "Cam:%d resume,enable VF\n", module);
+		/* Enable CMOS */
+		reg_val = readl(isp_dev->regs + REG_TG_SEN_MODE);
+		writel((reg_val | CMOS_EN_BIT),
+		       isp_dev->regs + REG_TG_SEN_MODE);
+		/* Enable VF */
+		reg_val = readl(isp_dev->regs + REG_TG_VF_CON);
+		writel((reg_val | VFDATA_EN_BIT),
+		       isp_dev->regs + REG_TG_VF_CON);
+	}
+
+	return 0;
+}
+
+static int mtk_isp_probe(struct platform_device *pdev)
+{
+	struct isp_p1_device *p1_dev;
+	struct mtk_isp_p1_ctx *isp_ctx;
+	struct isp_device *isp_dev;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int irq;
+	int ret;
+	unsigned int i;
+
+	p1_dev = devm_kzalloc(dev, sizeof(*p1_dev), GFP_KERNEL);
+	if (!p1_dev)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, p1_dev);
+	isp_ctx = &p1_dev->isp_ctx;
+	p1_dev->pdev = pdev;
+
+	for (i = ISP_CAMSYS_CONFIG_IDX; i < ISP_DEV_NODE_NUM; i++) {
+		isp_dev = &p1_dev->isp_devs[i];
+		isp_dev->isp_hw_module = i;
+		isp_dev->dev = dev;
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		isp_dev->regs = devm_ioremap_resource(dev, res);
+
+		dev_dbg(dev, "cam%u, map_addr=0x%lx\n",
+			i, (unsigned long)isp_dev->regs);
+
+		if (!isp_dev->regs)
+			return PTR_ERR(isp_dev->regs);
+
+		/* Support IRQ from ISP_CAM_A_IDX */
+		if (i >= ISP_CAM_A_IDX) {
+			/* Reg & interrupts index is shifted with 1  */
+			irq = platform_get_irq(pdev, i - 1);
+			if (irq) {
+				ret = devm_request_irq(dev, irq,
+						       isp_irq_cam,
+						       IRQF_SHARED,
+						       dev_driver_string(dev),
+						       (void *)isp_dev);
+				if (ret) {
+					dev_err(dev,
+						"req_irq fail, dev:%s irq=%d\n",
+						dev->of_node->name,
+						irq);
+					return ret;
+				}
+				dev_dbg(dev, "Registered irq=%d, ISR:%s\n",
+					irq, dev_driver_string(dev));
+			}
+		}
+		spin_lock_init(&isp_dev->spinlock_irq);
+	}
+
+	p1_dev->isp_ctx.num_clks = ARRAY_SIZE(mtk_isp_clks);
+	p1_dev->isp_ctx.clk_list =
+		devm_kcalloc(dev,
+			     p1_dev->isp_ctx.num_clks,
+			     sizeof(*p1_dev->isp_ctx.clk_list),
+			     GFP_KERNEL);
+	if (!p1_dev->isp_ctx.clk_list)
+		return -ENOMEM;
+
+	for (i = 0; i < p1_dev->isp_ctx.num_clks; ++i)
+		p1_dev->isp_ctx.clk_list->id = mtk_isp_clks[i];
+
+	ret = devm_clk_bulk_get(dev,
+				p1_dev->isp_ctx.num_clks,
+				p1_dev->isp_ctx.clk_list);
+	if (ret) {
+		dev_err(dev, "cannot get isp cam clock:%d\n", ret);
+		return ret;
+	}
+
+	/* Initialize reserved DMA memory */
+	ret = mtk_cam_reserved_memory_init(p1_dev);
+	if (ret) {
+		dev_err(dev, "failed to configure DMA memory:%d\n", ret);
+		goto err_init;
+	}
+
+	/* Initialize the v4l2 common part */
+	ret = mtk_cam_dev_init(pdev, &p1_dev->cam_dev);
+	if (ret)
+		goto err_init;
+
+	spin_lock_init(&isp_ctx->p1_enqueue_list.lock);
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err_init:
+	if (p1_dev->cam_dev.smem_dev)
+		device_unregister(p1_dev->cam_dev.smem_dev);
+
+	return ret;
+}
+
+static int mtk_isp_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct isp_p1_device *p1_dev = dev_get_drvdata(dev);
+
+	pm_runtime_disable(dev);
+	mtk_cam_dev_release(pdev, &p1_dev->cam_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_isp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_isp_suspend, mtk_isp_resume)
+	SET_RUNTIME_PM_OPS(mtk_isp_suspend, mtk_isp_resume, NULL)
+};
+
+static struct platform_driver mtk_isp_driver = {
+	.probe   = mtk_isp_probe,
+	.remove  = mtk_isp_remove,
+	.driver  = {
+		.name  = "mtk-cam",
+		.of_match_table = of_match_ptr(mtk_isp_of_ids),
+		.pm     = &mtk_isp_pm_ops,
+	}
+};
+
+module_platform_driver(mtk_isp_driver);
+
+MODULE_DESCRIPTION("Camera ISP driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
new file mode 100644
index 000000000000..6af3f569664c
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
@@ -0,0 +1,243 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef __CAMERA_ISP_H
+#define __CAMERA_ISP_H
+
+#include <linux/cdev.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/ioctl.h>
+#include <linux/irqreturn.h>
+#include <linux/miscdevice.h>
+#include <linux/pm_qos.h>
+#include <linux/scatterlist.h>
+
+#include "mtk_cam-scp.h"
+#include "mtk_cam-v4l2-util.h"
+
+#define CAM_A_MAX_WIDTH		3328
+#define CAM_A_MAX_HEIGHT		2496
+#define CAM_B_MAX_WIDTH		5376
+#define CAM_B_MAX_HEIGHT		4032
+
+#define CAM_MIN_WIDTH			80
+#define CAM_MIN_HEIGHT			60
+
+#define IMG_MAX_WIDTH			CAM_B_MAX_WIDTH
+#define IMG_MAX_HEIGHT			CAM_B_MAX_HEIGHT
+#define IMG_MIN_WIDTH			CAM_MIN_WIDTH
+#define IMG_MIN_HEIGHT			CAM_MIN_HEIGHT
+
+#define RRZ_MAX_WIDTH			CAM_B_MAX_WIDTH
+#define RRZ_MAX_HEIGHT			CAM_B_MAX_HEIGHT
+#define RRZ_MIN_WIDTH			CAM_MIN_WIDTH
+#define RRZ_MIN_HEIGHT			CAM_MIN_HEIGHT
+
+#define R_IMGO				BIT(0)
+#define R_RRZO				BIT(1)
+#define R_AAO				BIT(3)
+#define R_AFO				BIT(4)
+#define R_LCSO				BIT(5)
+#define R_PDO				BIT(6)
+#define R_LMVO				BIT(7)
+#define R_FLKO				BIT(8)
+#define R_RSSO				BIT(9)
+#define R_PSO				BIT(10)
+
+#define CQ_BUFFER_COUNT		3
+#define IRQ_DATA_BUF_SIZE		4
+#define CQ_ADDRESS_OFFSET		0x640
+
+#define ISP_COMPOSING_MAX_NUM		4
+#define ISP_FRAME_COMPOSING_MAX_NUM	3
+
+#define IRQ_STAT_STR	"cam%c, SOF_%d irq(0x%x), " \
+			"dma(0x%x), frame_num(%d)/cq_num(%d), " \
+			"fbc1(0x%x), fbc2(0x%x)\n"
+
+/*
+ * In order with the sequence of device nodes defined in dtsi rule,
+ * one hardware module should be mapping to one node.
+ */
+enum isp_dev_node_enum {
+	ISP_CAMSYS_CONFIG_IDX = 0,
+	ISP_CAM_UNI_IDX,
+	ISP_CAM_A_IDX,
+	ISP_CAM_B_IDX,
+	ISP_DEV_NODE_NUM
+};
+
+/* Image RAW path for ISP P1 module. */
+enum isp_raw_path_enum {
+	ISP_PROCESS_RAW_PATH = 0,
+	ISP_PURE_RAW_PATH
+};
+
+/* State for struct mtk_isp_p1_ctx: composer_state */
+enum  {
+	SCP_ON = 0,
+	SCP_OFF
+};
+
+enum {
+	IMG_FMT_UNKNOWN		= 0x0000,
+	IMG_FMT_RAW_START	= 0x2200,
+	IMG_FMT_BAYER8		= IMG_FMT_RAW_START,
+	IMG_FMT_BAYER10,
+	IMG_FMT_BAYER12,
+	IMG_FMT_BAYER14,
+	IMG_FMT_FG_BAYER8,
+	IMG_FMT_FG_BAYER10,
+	IMG_FMT_FG_BAYER12,
+	IMG_FMT_FG_BAYER14,
+};
+
+enum {
+	RAW_PXL_ID_B = 0,
+	RAW_PXL_ID_GB,
+	RAW_PXL_ID_GR,
+	RAW_PXL_ID_R
+};
+
+struct isp_queue {
+	struct list_head queue;
+	atomic_t queue_cnt;
+	spinlock_t lock; /* queue attributes protection */
+};
+
+struct isp_thread {
+	struct task_struct *thread;
+	wait_queue_head_t wq;
+};
+
+struct mtk_isp_queue_work {
+	union {
+		struct mtk_isp_scp_p1_cmd cmd;
+		struct p1_frame_param frameparams;
+	};
+	struct list_head list_entry;
+	enum mtk_isp_scp_type type;
+};
+
+struct mtk_cam_dev_stat_event_data {
+	__u32 frame_seq_no;
+	__u32 meta0_vb2_index;
+	__u32 meta1_vb2_index;
+	__u32 irq_status_mask;
+	__u32 dma_status_mask;
+};
+
+struct mtk_isp_queue_job {
+	struct list_head list_entry;
+	struct list_head list_buf;
+	unsigned int request_fd;
+	unsigned int frame_seq_no;
+};
+
+/*
+ * struct isp_device - the ISP device information
+ *
+ * @dev: Pointer to struct device
+ * @regs: Camera ISP base register address
+ * @spinlock_irq: Used to protect register read/write data
+ * @current_frame: Current frame sequence number, set when SOF
+ * @meta0_vb2_index: Meta0 vb2 buffer index, set when SOF
+ * @meta1_vb2_index: Meta1 vb2 buffer index, set when SOF
+ * @sof_count: The accumulated SOF counter
+ * @isp_hw_module: Identity camera A or B
+ *
+ */
+struct isp_device {
+	struct device *dev;
+	void __iomem *regs;
+	spinlock_t spinlock_irq; /* ISP reg setting integrity */
+	unsigned int current_frame;
+	unsigned int meta0_vb2_index;
+	unsigned int meta1_vb2_index;
+	u8 sof_count;
+	u8 isp_hw_module;
+};
+
+/*
+ * struct mtk_isp_p1_ctx - the ISP device information
+ *
+ * @composer_txlist: Queue for SCP TX data including SCP_ISP_CMD & SCP_ISP_FRAME
+ * @composer_tx_thread: TX Thread for SCP data tranmission
+ * @cmd_queued: The number of SCP_ISP_CMD commands will be sent
+ * @ipi_occupied: The total number of SCP TX data has beent sent
+ * @scp_state: The state of SCP control
+ * @composing_frame: The total number of SCP_ISP_FRAME has beent sent
+ * @composed_frame_id: The ack. frame sequence by SCP
+ * @composer_deinit_thread: The de-initialized thread
+ * @p1_enqueue_list: Queue for ISP frame buffers
+ * @isp_deque_thread: Thread for handling ISP frame buffers dequeue
+ * @irq_event_datas: Ring buffer for struct mtk_cam_dev_stat_event_data data
+ * @irq_data_start: Start index of irq_event_datas ring buffer
+ * @irq_data_end: End index of irq_event_datas ring buffer
+ * @irq_dequeue_lock: Lock to protect irq_event_datas ring buffer
+ * @scp_mem_pa: DMA address for SCP device
+ * @scp_mem_iova: DMA address for ISP HW DMA devices
+ * @frame_seq_no: Sequence number for ISP frame buffer
+ * @isp_hw_module: Active camera HW module
+ * @num_clks: The number of driver's clock
+ * @clk_list: The list of clock data
+ * @lock: Lock to protect context operations
+ *
+ */
+struct mtk_isp_p1_ctx {
+	struct isp_queue composer_txlist;
+	struct isp_thread composer_tx_thread;
+	atomic_t cmd_queued;
+	atomic_t ipi_occupied;
+	atomic_t scp_state;
+	atomic_t composing_frame;
+	atomic_t composed_frame_id;
+	struct isp_thread composer_deinit_thread;
+	struct isp_queue p1_enqueue_list;
+	struct isp_thread isp_deque_thread;
+	struct mtk_cam_dev_stat_event_data irq_event_datas[IRQ_DATA_BUF_SIZE];
+	atomic_t irq_data_start;
+	atomic_t irq_data_end;
+	spinlock_t irq_dequeue_lock; /* ISP frame dequeuq protection */
+	dma_addr_t scp_mem_pa;
+	dma_addr_t scp_mem_iova;
+	int frame_seq_no;
+	unsigned int isp_hw_module;
+	unsigned int isp_raw_path;
+	unsigned int num_clks;
+	struct clk_bulk_data *clk_list;
+	struct mutex lock; /* Protect context operations */
+};
+
+struct isp_p1_device {
+	struct platform_device *pdev;
+	struct platform_device *scp_pdev;
+	struct rproc *rproc_handle;
+	struct mtk_isp_p1_ctx isp_ctx;
+	struct mtk_cam_dev cam_dev;
+	struct isp_device isp_devs[ISP_DEV_NODE_NUM];
+};
+
+static inline struct isp_p1_device *
+p1_ctx_to_dev(const struct mtk_isp_p1_ctx *__p1_ctx)
+{
+	return container_of(__p1_ctx, struct isp_p1_device, isp_ctx);
+}
+
+static inline struct isp_p1_device *get_p1_device(struct device *dev)
+{
+	return ((struct isp_p1_device *)dev_get_drvdata(dev));
+}
+
+int mtk_isp_power_init(struct mtk_cam_dev *cam_dev);
+int mtk_isp_power_release(struct device *dev);
+int mtk_isp_config(struct device *dev);
+void mtk_isp_req_enqueue(struct device *dev, struct media_request *req);
+void mtk_isp_enqueue(struct device *dev, unsigned int dma_port,
+		     struct mtk_cam_dev_buffer *buffer);
+void mtk_isp_req_flush_buffers(struct device *dev);
+
+#endif /*__CAMERA_ISP_H*/
-- 
2.18.0

