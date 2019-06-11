Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAD13C1B0
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 05:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391052AbfFKDyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 23:54:13 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46095 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391044AbfFKDyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 23:54:13 -0400
X-UUID: 9919d212100148fe81ceac665e787f64-20190611
X-UUID: 9919d212100148fe81ceac665e787f64-20190611
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 712924878; Tue, 11 Jun 2019 11:54:00 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 11:53:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 11:53:59 +0800
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
Subject: [RFC,v3 8/9] media: platform: Add Mediatek ISP P1 SCP communication
Date:   Tue, 11 Jun 2019 11:53:43 +0800
Message-ID: <20190611035344.29814-9-jungo.lin@mediatek.com>
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

This patch adds communication with the co-processor on the SoC
through the SCP driver. It supports bi-directional commands
to exchange data and perform command flow control function.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
This patch depends on "Add support for mt8183 SCP"[1].

[1] https://patchwork.kernel.org/cover/10972143/
---
 .../platform/mtk-isp/isp_50/cam/Makefile      |   1 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam-scp.c | 371 ++++++++++++++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam-scp.h | 207 ++++++++++
 3 files changed, 579 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h

diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
index 30df10983f6a..95f0b1c8fa1c 100644
--- a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
@@ -3,5 +3,6 @@
 mtk-cam-isp-objs += mtk_cam-ctrl.o
 mtk-cam-isp-objs += mtk_cam-v4l2-util.o
 mtk-cam-isp-objs += mtk_cam.o
+mtk-cam-isp-objs += mtk_cam-scp.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
\ No newline at end of file
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
new file mode 100644
index 000000000000..04519d0b942f
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2018 MediaTek Inc.
+
+#include <linux/atomic.h>
+#include <linux/kthread.h>
+#include <linux/platform_data/mtk_scp.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+
+#include "mtk_cam.h"
+
+static void isp_composer_deinit(struct mtk_isp_p1_ctx *isp_ctx)
+{
+	struct mtk_isp_queue_work *ipi_job, *tmp_ipi_job;
+	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
+
+	atomic_set(&isp_ctx->cmd_queued, 0);
+	atomic_set(&isp_ctx->composer_txlist.queue_cnt, 0);
+	atomic_set(&isp_ctx->composing_frame, 0);
+	atomic_set(&isp_ctx->ipi_occupied, 0);
+
+	spin_lock(&isp_ctx->composer_txlist.lock);
+	list_for_each_entry_safe(ipi_job, tmp_ipi_job,
+				 &isp_ctx->composer_txlist.queue,
+				 list_entry) {
+		list_del(&ipi_job->list_entry);
+		kfree(ipi_job);
+	}
+	atomic_set(&isp_ctx->composer_txlist.queue_cnt, 0);
+	spin_unlock(&isp_ctx->composer_txlist.lock);
+
+	mutex_lock(&isp_ctx->lock);
+	if (isp_ctx->composer_tx_thread.thread) {
+		kthread_stop(isp_ctx->composer_tx_thread.thread);
+		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
+		isp_ctx->composer_tx_thread.thread = NULL;
+	}
+
+	if (isp_ctx->composer_deinit_thread.thread) {
+		wake_up(&isp_ctx->composer_deinit_thread.wq);
+		isp_ctx->composer_deinit_thread.thread = NULL;
+	}
+	mutex_unlock(&isp_ctx->lock);
+
+	pm_runtime_put_sync(&p1_dev->pdev->dev);
+}
+
+/*
+ * Two kinds of flow control in isp_composer_tx_work.
+ *
+ * Case 1: IPI commands flow control. The maximum number of command queues is 3.
+ * There are two types of IPI commands (SCP_ISP_CMD/SCP_ISP_FRAME) in P1 driver.
+ * It is controlled by ipi_occupied.
+ * The priority of SCP_ISP_CMD is higher than SCP_ISP_FRAME.
+ *
+ * Case 2: Frame buffers flow control. The maximum number of frame buffers is 3.
+ * It is controlled by composing_frame.
+ * Frame buffer is sent by SCP_ISP_FRAME command.
+ */
+static int isp_composer_tx_work(void *data)
+{
+	struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)data;
+	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
+	struct device *dev = &p1_dev->pdev->dev;
+	struct mtk_isp_queue_work *isp_composer_work, *tmp_ipi_job;
+	struct isp_queue *composer_txlist = &isp_ctx->composer_txlist;
+	int ret;
+
+	while (1) {
+		ret = wait_event_interruptible
+			(isp_ctx->composer_tx_thread.wq,
+			 (atomic_read(&composer_txlist->queue_cnt) > 0 &&
+			 atomic_read(&isp_ctx->ipi_occupied)
+				< ISP_COMPOSING_MAX_NUM &&
+			 atomic_read(&isp_ctx->composing_frame)
+				< ISP_FRAME_COMPOSING_MAX_NUM) ||
+			 (atomic_read(&isp_ctx->cmd_queued) > 0 &&
+			 atomic_read(&isp_ctx->ipi_occupied)
+				< ISP_COMPOSING_MAX_NUM) ||
+			 kthread_should_stop());
+
+		if (kthread_should_stop())
+			break;
+
+		spin_lock(&composer_txlist->lock);
+		if (atomic_read(&isp_ctx->cmd_queued) > 0) {
+			list_for_each_entry_safe(isp_composer_work, tmp_ipi_job,
+						 &composer_txlist->queue,
+						 list_entry) {
+				if (isp_composer_work->type == SCP_ISP_CMD) {
+					dev_dbg(dev, "Found a cmd\n");
+					break;
+				}
+			}
+		} else {
+			if (atomic_read(&isp_ctx->composing_frame) >=
+				ISP_FRAME_COMPOSING_MAX_NUM) {
+				spin_unlock(&composer_txlist->lock);
+				continue;
+			}
+			isp_composer_work =
+			    list_first_entry_or_null
+				(&composer_txlist->queue,
+				 struct mtk_isp_queue_work,
+				 list_entry);
+		}
+
+		list_del(&isp_composer_work->list_entry);
+		atomic_dec(&composer_txlist->queue_cnt);
+		spin_unlock(&composer_txlist->lock);
+
+		if (isp_composer_work->type == SCP_ISP_CMD) {
+			scp_ipi_send
+				(p1_dev->scp_pdev,
+				 SCP_IPI_ISP_CMD,
+				 &isp_composer_work->cmd,
+				 sizeof(isp_composer_work->cmd),
+				 0);
+			atomic_dec(&isp_ctx->cmd_queued);
+			atomic_inc(&isp_ctx->ipi_occupied);
+			dev_dbg(dev,
+				"%s cmd id %d sent, %d ipi buf occupied",
+				__func__,
+				isp_composer_work->cmd.cmd_id,
+				atomic_read(&isp_ctx->ipi_occupied));
+		} else if (isp_composer_work->type == SCP_ISP_FRAME) {
+			scp_ipi_send
+				(p1_dev->scp_pdev,
+				 SCP_IPI_ISP_FRAME,
+				 &isp_composer_work->frameparams,
+				 sizeof(isp_composer_work->frameparams),
+				 0);
+			atomic_inc(&isp_ctx->ipi_occupied);
+			atomic_inc(&isp_ctx->composing_frame);
+			dev_dbg(dev,
+				"%s frame %d sent, %d ipi, %d CQ bufs occupied",
+				__func__,
+				isp_composer_work->frameparams.frame_seq_no,
+				atomic_read(&isp_ctx->ipi_occupied),
+				atomic_read(&isp_ctx->composing_frame));
+		} else {
+			dev_err(dev,
+				"ignore IPI type: %d!\n",
+				isp_composer_work->type);
+		}
+		kfree(isp_composer_work);
+	}
+	return ret;
+}
+
+static int isp_composer_deinit_work(void *data)
+{
+	struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)data;
+	struct isp_p1_device *p1_dev = p1_ctx_to_dev(data);
+	struct device *dev = &p1_dev->pdev->dev;
+
+	wait_event_interruptible(isp_ctx->composer_deinit_thread.wq,
+				 atomic_read(&isp_ctx->scp_state) == SCP_OFF ||
+				 kthread_should_stop());
+
+	dev_dbg(dev, "%s run deinit", __func__);
+	isp_composer_deinit(isp_ctx);
+
+	return 0;
+}
+
+static void isp_composer_handler(void *data, unsigned int len, void *priv)
+{
+	struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)priv;
+	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
+	struct device *dev = &p1_dev->pdev->dev;
+	struct mtk_isp_scp_p1_cmd *ipi_msg;
+
+	ipi_msg = (struct mtk_isp_scp_p1_cmd *)data;
+
+	if (ipi_msg->cmd_id != ISP_CMD_ACK)
+		return;
+
+	if (ipi_msg->ack_info.cmd_id == ISP_CMD_FRAME_ACK) {
+		dev_dbg(dev, "ack frame_num:%d",
+			ipi_msg->ack_info.frame_seq_no);
+		atomic_set(&isp_ctx->composed_frame_id,
+			   ipi_msg->ack_info.frame_seq_no);
+	} else if (ipi_msg->ack_info.cmd_id == ISP_CMD_DEINIT) {
+		dev_dbg(dev, "ISP_CMD_DEINIT is acked");
+		atomic_set(&isp_ctx->scp_state, SCP_OFF);
+		wake_up_interruptible(&isp_ctx->composer_deinit_thread.wq);
+	}
+
+	atomic_dec_return(&isp_ctx->ipi_occupied);
+	wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
+}
+
+int isp_composer_init(struct device *dev)
+{
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	int ret;
+
+	ret = scp_ipi_register(p1_dev->scp_pdev,
+			       SCP_IPI_ISP_CMD,
+			       isp_composer_handler,
+			       isp_ctx);
+	if (ret)
+		return ret;
+
+	atomic_set(&isp_ctx->cmd_queued, 0);
+	atomic_set(&isp_ctx->composer_txlist.queue_cnt, 0);
+	atomic_set(&isp_ctx->composing_frame, 0);
+	atomic_set(&isp_ctx->ipi_occupied, 0);
+	atomic_set(&isp_ctx->scp_state, SCP_ON);
+
+	mutex_lock(&isp_ctx->lock);
+	if (!isp_ctx->composer_tx_thread.thread) {
+		init_waitqueue_head(&isp_ctx->composer_tx_thread.wq);
+		INIT_LIST_HEAD(&isp_ctx->composer_txlist.queue);
+		spin_lock_init(&isp_ctx->composer_txlist.lock);
+		isp_ctx->composer_tx_thread.thread =
+			kthread_run(isp_composer_tx_work, isp_ctx,
+				    "isp_composer_tx");
+		if (IS_ERR(isp_ctx->composer_tx_thread.thread)) {
+			dev_err(dev, "unable to start kthread\n");
+			isp_ctx->composer_tx_thread.thread = NULL;
+			goto nomem;
+		}
+	} else {
+		dev_warn(dev, "old tx thread is existed\n");
+	}
+
+	if (!isp_ctx->composer_deinit_thread.thread) {
+		init_waitqueue_head(&isp_ctx->composer_deinit_thread.wq);
+		isp_ctx->composer_deinit_thread.thread =
+			kthread_run(isp_composer_deinit_work, isp_ctx,
+				    "isp_composer_deinit_work");
+		if (IS_ERR(isp_ctx->composer_deinit_thread.thread)) {
+			dev_err(dev, "unable to start kthread\n");
+			isp_ctx->composer_deinit_thread.thread = NULL;
+			goto nomem;
+		}
+	} else {
+		dev_warn(dev, "old rx thread is existed\n");
+	}
+	mutex_unlock(&isp_ctx->lock);
+
+	return 0;
+
+nomem:
+	mutex_unlock(&isp_ctx->lock);
+
+	return -ENOMEM;
+}
+
+void isp_composer_enqueue(struct device *dev,
+			  void *data,
+			  enum mtk_isp_scp_type type)
+{
+	struct mtk_isp_queue_work *isp_composer_work;
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+
+	isp_composer_work = kzalloc(sizeof(*isp_composer_work), GFP_KERNEL);
+	isp_composer_work->type = type;
+
+	switch (type) {
+	case SCP_ISP_CMD:
+		memcpy(&isp_composer_work->cmd, data,
+		       sizeof(isp_composer_work->cmd));
+		dev_dbg(dev, "Enq ipi cmd id:%d\n",
+			isp_composer_work->cmd.cmd_id);
+
+		spin_lock(&isp_ctx->composer_txlist.lock);
+		list_add_tail(&isp_composer_work->list_entry,
+			      &isp_ctx->composer_txlist.queue);
+		atomic_inc(&isp_ctx->composer_txlist.queue_cnt);
+		spin_unlock(&isp_ctx->composer_txlist.lock);
+
+		atomic_inc(&isp_ctx->cmd_queued);
+		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
+		break;
+	case SCP_ISP_FRAME:
+		memcpy(&isp_composer_work->frameparams, data,
+		       sizeof(isp_composer_work->frameparams));
+		dev_dbg(dev, "Enq ipi frame_num:%d\n",
+			isp_composer_work->frameparams.frame_seq_no);
+
+		spin_lock(&isp_ctx->composer_txlist.lock);
+		list_add_tail(&isp_composer_work->list_entry,
+			      &isp_ctx->composer_txlist.queue);
+		atomic_inc(&isp_ctx->composer_txlist.queue_cnt);
+		spin_unlock(&isp_ctx->composer_txlist.lock);
+
+		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
+		break;
+	default:
+		break;
+	}
+}
+
+void isp_composer_hw_init(struct device *dev)
+{
+	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+
+	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
+	composer_tx_cmd.cmd_id = ISP_CMD_INIT;
+	composer_tx_cmd.frameparam.hw_module = isp_ctx->isp_hw_module;
+	composer_tx_cmd.frameparam.cq_addr.iova = isp_ctx->scp_mem_iova;
+	composer_tx_cmd.frameparam.cq_addr.scp_addr = isp_ctx->scp_mem_pa;
+	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
+}
+
+void isp_composer_meta_config(struct device *dev,
+			      unsigned int dma)
+{
+	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
+
+	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
+	composer_tx_cmd.cmd_id = ISP_CMD_CONFIG_META;
+	composer_tx_cmd.cfg_meta_out_param.enabled_meta_dmas = dma;
+	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
+}
+
+void isp_composer_hw_config(struct device *dev,
+			    struct p1_config_param *config_param)
+{
+	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
+
+	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
+	composer_tx_cmd.cmd_id = ISP_CMD_CONFIG;
+	memcpy(&composer_tx_cmd.config_param, config_param,
+	       sizeof(*config_param));
+	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
+}
+
+void isp_composer_stream(struct device *dev, int on)
+{
+	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
+
+	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
+	composer_tx_cmd.cmd_id = ISP_CMD_STREAM;
+	composer_tx_cmd.is_stream_on = on;
+	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
+}
+
+void isp_composer_hw_deinit(struct device *dev)
+{
+	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
+	struct isp_p1_device *p1_dev = get_p1_device(dev);
+	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
+	int ret;
+
+	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
+	composer_tx_cmd.cmd_id = ISP_CMD_DEINIT;
+	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
+
+	/* Wait for ISP_CMD_DEINIT command is handled done */
+	ret = wait_event_timeout(isp_ctx->composer_deinit_thread.wq,
+				 atomic_read(&isp_ctx->scp_state) == SCP_OFF,
+				 msecs_to_jiffies(2000));
+	if (ret)
+		return;
+
+	dev_warn(dev, "Timeout & local de-init\n");
+	isp_composer_deinit(isp_ctx);
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h
new file mode 100644
index 000000000000..fbd8593e9c2d
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef _MTK_ISP_SCP_H
+#define _MTK_ISP_SCP_H
+
+#include <linux/types.h>
+
+#include "mtk_cam-v4l2-util.h"
+
+/*
+ * struct img_size - image size information.
+ *
+ * @w: image width, the unit is pixel
+ * @h: image height, the unit is pixel
+ * @xsize: bytes per line based on width.
+ * @stride: bytes per line when changing line.
+ *          Normally, calculate new STRIDE based on
+ *          xsize + HW constrain(page or align).
+ *
+ */
+struct img_size {
+	__u32 w;
+	__u32 h;
+	__u32 xsize;
+	__u32 stride;
+} __packed;
+
+/*
+ * struct img_buffer - buffer address information.
+ *
+ * @iova: DMA address for external devices.
+ * @scp_addr: SCP address for external co-process unit.
+ *
+ */
+struct img_buffer {
+	__u32 iova;
+	__u32 scp_addr;
+} __packed;
+
+struct p1_img_crop {
+	__u32 left;
+	__u32 top;
+	__u32 width;
+	__u32 height;
+} __packed;
+
+struct p1_img_output {
+	struct img_buffer buffer;
+	struct img_size size;
+	struct p1_img_crop crop;
+	__u8 pixel_byte;
+	__u32 img_fmt;
+} __packed;
+
+/*
+ * struct cfg_in_param - image input parameters structure.
+ *                       Normally, it comes from sensor information.
+ *
+ * @continuous: indicate the sensor mode.
+ *              1: continuous
+ *              0: single
+ * @subsample: indicate to enables SOF subsample or not.
+ * @pixel_mode: describe 1/2/4 pixels per clock cycle.
+ * @data_pattern: describe input data pattern.
+ * @raw_pixel_id: bayer sequence.
+ * @tg_fps: the fps rate of TG (time generator).
+ * @img_fmt: the image format of input source.
+ * @p1_img_crop: the crop configuration of input source.
+ *
+ */
+struct cfg_in_param {
+	__u8 continuous;
+	__u8 subsample;
+	__u8 pixel_mode;
+	__u8 data_pattern;
+	__u8 raw_pixel_id;
+	__u16 tg_fps;
+	__u32 img_fmt;
+	struct p1_img_crop crop;
+} __packed;
+
+/*
+ * struct cfg_main_out_param - the image output parameters of main stream.
+ *
+ * @bypass: indicate this device is enabled or disabled or not .
+ * @pure_raw: indicate the image path control.
+ *            1: pure raw
+ *            0: processing raw
+ * @pure_raw_pack: indicate the image is packed or not.
+ *                 1: packed mode
+ *                 0: unpacked mode
+ * @p1_img_output: the output image information.
+ *
+ */
+struct cfg_main_out_param {
+	/* Bypass main out parameters */
+	__u8 bypass;
+	/* Control HW image raw path */
+	__u8 pure_raw;
+	/* Control HW image pack function */
+	__u8 pure_raw_pack;
+	struct p1_img_output output;
+} __packed;
+
+/*
+ * struct cfg_resize_out_param - the image output parameters of
+ *                               packed out stream.
+ *
+ * @bypass: indicate this device is enabled or disabled or not .
+ * @p1_img_output: the output image information.
+ *
+ */
+struct cfg_resize_out_param {
+	/* Bypass resize parameters */
+	__u8 bypass;
+	struct p1_img_output output;
+} __packed;
+
+/*
+ * struct cfg_meta_out_param - output meta information.
+ *
+ * @enabled_meta_dmas: indicate which meta DMAs are enabled.
+ *
+ */
+struct cfg_meta_out_param {
+	__u32 enabled_meta_dmas;
+} __packed;
+
+struct p1_config_param {
+	/* Sensor/TG info */
+	struct cfg_in_param cfg_in_param;
+	/* IMGO DMA */
+	struct cfg_main_out_param cfg_main_param;
+	/* RRZO DMA */
+	struct cfg_resize_out_param cfg_resize_param;
+	/* 3A DMAs and other. */
+	struct cfg_meta_out_param cfg_meta_param;
+} __packed;
+
+struct p1_frame_param {
+	/* frame sequence number */
+	__u32 frame_seq_no;
+	/* SOF index */
+	__u32 sof_idx;
+	/* The memory address of tuning buffer from user space */
+	struct img_buffer dma_buffers[MTK_CAM_P1_TOTAL_NODES];
+} __packed;
+
+struct P1_meta_frame {
+	__u32 enabled_dma;
+	__u32 vb_index;
+	struct img_buffer meta_addr;
+} __packed;
+
+struct isp_init_info {
+	__u8 hw_module;
+	struct img_buffer cq_addr;
+} __packed;
+
+struct isp_ack_info {
+	__u8 cmd_id;
+	__u32 frame_seq_no;
+} __packed;
+
+enum mtk_isp_scp_cmds {
+	ISP_CMD_INIT,
+	ISP_CMD_CONFIG,
+	ISP_CMD_STREAM,
+	ISP_CMD_DEINIT,
+	ISP_CMD_ACK,
+	ISP_CMD_FRAME_ACK,
+	ISP_CMD_CONFIG_META,
+	ISP_CMD_ENQUEUE_META,
+	ISP_CMD_RESERVED,
+};
+
+struct mtk_isp_scp_p1_cmd {
+	__u8 cmd_id;
+	union {
+		struct isp_init_info frameparam;
+		struct p1_config_param config_param;
+		struct cfg_meta_out_param cfg_meta_out_param;
+		struct P1_meta_frame meta_frame;
+		__u8 is_stream_on;
+		struct isp_ack_info ack_info;
+	};
+} __packed;
+
+enum mtk_isp_scp_type {
+	SCP_ISP_CMD = 0,
+	SCP_ISP_FRAME,
+};
+
+int isp_composer_init(struct device *dev);
+void isp_composer_enqueue(struct device *dev, void *data,
+			  enum mtk_isp_scp_type type);
+void isp_composer_hw_init(struct device *dev);
+void isp_composer_hw_config(struct device *dev,
+			    struct p1_config_param *config_param);
+void isp_composer_hw_deinit(struct device *dev);
+void isp_composer_meta_config(struct device *dev, unsigned int dma);
+void isp_composer_stream(struct device *dev, int on);
+
+#endif /* _MTK_ISP_SCP_H */
-- 
2.18.0

