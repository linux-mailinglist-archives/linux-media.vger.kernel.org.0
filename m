Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546F23CC1E6
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 10:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbhGQIQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 04:16:46 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47992 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232769AbhGQIPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 04:15:47 -0400
X-UUID: 97b0bedd641f4946abcc9ff4352e220d-20210717
X-UUID: 97b0bedd641f4946abcc9ff4352e220d-20210717
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1611256018; Sat, 17 Jul 2021 16:12:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 16:12:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 16:12:43 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 07/14] media: mtk-vcodec: Add msg queue feature for lat and core architecture
Date:   Sat, 17 Jul 2021 16:12:26 +0800
Message-ID: <20210717081233.7809-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For lat and core architecture, lat thread will send message to core
thread when lat decode done. Core hardware will use the message
from lat to decode, then free message to lat thread when decode done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v2: Reconstructed get/put lat buffer for lat and core hardware.
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   9 +
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 254 ++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 137 ++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index edeb3b66e9e9..5000e59da576 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -11,6 +11,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_drv.o \
 		vdec_drv_if.o \
 		vdec_vpu_if.o \
+		vdec_msg_queue.o \
 		mtk_vcodec_dec.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 76160b6f4152..ae93b6c7b0b6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -15,7 +15,9 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
+
 #include "mtk_vcodec_util.h"
+#include "vdec_msg_queue.h"
 
 #define VDEC_HW_ACTIVE	0x10
 #define VDEC_IRQ_CFG	0x11
@@ -292,6 +294,8 @@ struct vdec_pic_info {
  * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
+ *
+ * @msg_queue: msg queue used to store lat buffer information.
  */
 struct mtk_vcodec_ctx {
 	enum mtk_instance_type type;
@@ -339,6 +343,7 @@ struct mtk_vcodec_ctx {
 	int decoded_frame_cnt;
 	struct mutex lock;
 
+	struct vdec_msg_queue msg_queue;
 };
 
 enum mtk_chip {
@@ -472,6 +477,8 @@ struct mtk_vcodec_enc_pdata {
  * @comp_dev: component hardware device
  * @component_node: component node
  * @comp_idx: component index
+ *
+ * @core_ctx: core queue context
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -514,6 +521,8 @@ struct mtk_vcodec_dev {
 	void *comp_dev[MTK_VDEC_HW_MAX];
 	struct device_node *component_node[MTK_VDEC_HW_MAX];
 	int comp_idx;
+
+	struct vdec_msg_queue_ctx core_ctx;
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
new file mode 100644
index 000000000000..016a70416e55
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/freezer.h>
+#include <linux/interrupt.h>
+#include <linux/kthread.h>
+
+#include "mtk_vcodec_dec_pm.h"
+#include "mtk_vcodec_drv.h"
+#include "vdec_msg_queue.h"
+
+#define VDEC_LAT_SLICE_HEADER_SZ    (640 * 1024)
+#define VDEC_ERR_MAP_SZ_AVC         ((8192 / 16) * (4352 / 16) / 8)
+
+static int vde_msg_queue_get_trans_size(int width, int height)
+{
+	if (width > 1920 || height > 1088)
+		return (30 * 1024 * 1024);
+	else
+		return 6 * 1024 * 1024;
+}
+
+void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx,
+	int hardware_index)
+{
+	init_waitqueue_head(&ctx->ready_to_use);
+	INIT_LIST_HEAD(&ctx->ready_queue);
+	spin_lock_init(&ctx->ready_lock);
+	ctx->ready_num = 0;
+	ctx->hardware_index = hardware_index;
+}
+
+int vdec_msg_queue_init(
+	struct vdec_msg_queue *msg_queue,
+	struct mtk_vcodec_ctx *ctx,
+	core_decode_cb_t core_decode,
+	int private_size)
+{
+	struct vdec_lat_buf *lat_buf;
+	int i, err;
+
+	/* already init msg queue */
+	if (msg_queue->wdma_addr.size)
+		return 0;
+
+	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
+	msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
+		ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+
+	err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
+	if (err) {
+		mtk_v4l2_err("failed to allocate wdma_addr buf");
+		return -ENOMEM;
+	}
+	msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
+	msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
+
+	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
+		lat_buf = &msg_queue->lat_buf[i];
+
+		lat_buf->wdma_err_addr.size = VDEC_ERR_MAP_SZ_AVC;
+		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->wdma_err_addr);
+		if (err) {
+			mtk_v4l2_err("failed to allocate wdma_err_addr buf[%d]", i);
+			goto mem_alloc_err;
+		}
+
+		lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
+		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
+		if (err) {
+			mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
+			goto mem_alloc_err;
+		}
+
+		lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
+		if (!lat_buf->private_data) {
+			mtk_v4l2_err("failed to allocate private_data[%d]", i);
+			goto mem_alloc_err;
+		}
+
+		lat_buf->ctx = ctx;
+		lat_buf->core_decode = core_decode;
+		vdec_msg_queue_qbuf(&msg_queue->lat_ctx, lat_buf);
+	}
+	return 0;
+
+mem_alloc_err:
+	vdec_msg_queue_deinit(msg_queue, ctx);
+	return -ENOMEM;
+}
+
+static struct list_head *vdec_get_buf_list(int hardware_index,
+	struct vdec_lat_buf *buf)
+{
+	switch (hardware_index) {
+	case MTK_VDEC_CORE:
+		return &buf->core_list;
+	case MTK_VDEC_LAT0:
+		return &buf->lat_list;
+	default:
+		return NULL;
+	}
+}
+
+void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *ctx,
+	struct vdec_lat_buf *buf)
+{
+	struct list_head *head;
+
+	head = vdec_get_buf_list(ctx->hardware_index, buf);
+	if (!head) {
+		mtk_v4l2_err("fail to qbuf: %d",ctx->hardware_index);
+		return;
+	}
+
+	spin_lock(&ctx->ready_lock);
+	list_add_tail(head, &ctx->ready_queue);
+	ctx->ready_num++;
+
+	wake_up_all(&ctx->ready_to_use);
+
+	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
+		ctx->hardware_index, buf, ctx->ready_num);
+	spin_unlock(&ctx->ready_lock);
+}
+
+static bool vdec_msg_queue_wait_event(struct vdec_msg_queue_ctx *ctx)
+{
+	long timeout_jiff;
+	int ret;
+
+	if (ctx->hardware_index == MTK_VDEC_CORE) {
+		ret = wait_event_freezable(ctx->ready_to_use,
+			!list_empty(&ctx->ready_queue));
+		if (ret)
+			return false;
+	} else {
+		timeout_jiff = msecs_to_jiffies(1500);
+		ret = wait_event_timeout(ctx->ready_to_use,
+			!list_empty(&ctx->ready_queue), timeout_jiff);
+		if (!ret)
+			return false;
+	}
+
+	return true;
+}
+
+struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *ctx)
+{
+	struct vdec_lat_buf *buf;
+	struct list_head *head;
+	int ret;
+
+	spin_lock(&ctx->ready_lock);
+	if (list_empty(&ctx->ready_queue)) {
+		mtk_v4l2_debug(3, "queue is NULL, type:%d num: %d",
+			ctx->hardware_index, ctx->ready_num);
+		spin_unlock(&ctx->ready_lock);
+		ret = vdec_msg_queue_wait_event(ctx);
+		if (!ret)
+			return NULL;
+		spin_lock(&ctx->ready_lock);
+	}
+
+	if (ctx->hardware_index == MTK_VDEC_CORE)
+		buf = list_first_entry(&ctx->ready_queue,
+			struct vdec_lat_buf, core_list);
+	else
+		buf = list_first_entry(&ctx->ready_queue,
+			struct vdec_lat_buf, lat_list);
+
+	head = vdec_get_buf_list(ctx->hardware_index, buf);
+	if (!head) {
+		mtk_v4l2_err("fail to dqbuf: %d",ctx->hardware_index);
+		return NULL;
+	}
+	list_del(head);
+
+	ctx->ready_num--;
+	mtk_v4l2_debug(3, "dqueue buf type:%d addr: 0x%p num: %d",
+		ctx->hardware_index, buf, ctx->ready_num);
+	spin_unlock(&ctx->ready_lock);
+
+	return buf;
+}
+
+void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
+	uint64_t ube_rptr)
+{
+	spin_lock(&msg_queue->lat_ctx.ready_lock);
+	msg_queue->wdma_rptr_addr = ube_rptr;
+	mtk_v4l2_debug(3, "update ube rprt (0x%llx)", ube_rptr);
+	spin_unlock(&msg_queue->lat_ctx.ready_lock);
+}
+
+void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
+	uint64_t ube_wptr)
+{
+	spin_lock(&msg_queue->lat_ctx.ready_lock);
+	msg_queue->wdma_wptr_addr = ube_wptr;
+	mtk_v4l2_debug(3, "update ube wprt: (0x%llx 0x%llx) offset: 0x%llx",
+		msg_queue->wdma_rptr_addr, msg_queue->wdma_wptr_addr, ube_wptr);
+	spin_unlock(&msg_queue->lat_ctx.ready_lock);
+}
+
+bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
+{
+	long timeout_jiff;
+	int ret, ready_num;
+
+	ready_num = msg_queue->lat_ctx.ready_num;
+	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
+
+	ret = wait_event_timeout(msg_queue->lat_ctx.ready_to_use,
+		ready_num == NUM_BUFFER_COUNT, timeout_jiff);
+	if (ret) {
+		mtk_v4l2_debug(3, "success to get lat buf: %d",
+			msg_queue->lat_ctx.ready_num);
+		return true;
+	}
+	mtk_v4l2_err("failed with lat buf isn't full: %d",
+		msg_queue->lat_ctx.ready_num);
+	return false;
+}
+
+void vdec_msg_queue_deinit(
+	struct vdec_msg_queue *msg_queue,
+	struct mtk_vcodec_ctx *ctx)
+{
+	struct vdec_lat_buf *lat_buf;
+	struct mtk_vcodec_mem *mem;
+	int i;
+
+	mem = &msg_queue->wdma_addr;
+	if (mem->va)
+		mtk_vcodec_mem_free(ctx, mem);
+	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
+		lat_buf = &msg_queue->lat_buf[i];
+
+		mem = &lat_buf->wdma_err_addr;
+		if (mem->va)
+			mtk_vcodec_mem_free(ctx, mem);
+
+		mem = &lat_buf->slice_bc_addr;
+		if (mem->va)
+			mtk_vcodec_mem_free(ctx, mem);
+
+		if (lat_buf->private_data)
+			kfree(lat_buf->private_data);
+	}
+}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
new file mode 100644
index 000000000000..297aa1598788
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _VDEC_MSG_QUEUE_H_
+#define _VDEC_MSG_QUEUE_H_
+
+#include <linux/sched.h>
+#include <linux/semaphore.h>
+#include <linux/slab.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "mtk_vcodec_util.h"
+
+#define NUM_BUFFER_COUNT 3
+
+struct vdec_lat_buf;
+struct mtk_vcodec_ctx;
+struct mtk_vcodec_dev;
+typedef int (*core_decode_cb_t)(struct vdec_lat_buf *lat_buf);
+
+/**
+ * struct vdec_msg_queue_ctx - represents a queue for buffers ready to be
+ *	                           processed
+ * @ready_used: ready used queue used to signalize when get a job queue
+ * @ready_queue: list of V4L2 mem-to-mem queues
+ * @ready_lock: spin lock to protect the lat buffer usage
+ * @ready_num: number of buffers ready to be processed
+ * @hardware_index: hardware id that this queue is used for
+ */
+struct vdec_msg_queue_ctx {
+	wait_queue_head_t ready_to_use;
+	struct list_head ready_queue;
+	spinlock_t ready_lock;
+	int ready_num;
+	int hardware_index;
+};
+
+/**
+ * struct vdec_lat_buf - lat buffer message used to store lat
+ *                       info for core decode
+ */
+struct vdec_lat_buf {
+	struct mtk_vcodec_mem wdma_err_addr;
+	struct mtk_vcodec_mem slice_bc_addr;
+	struct vb2_v4l2_buffer ts_info;
+
+	void *private_data;
+	struct mtk_vcodec_ctx *ctx;
+	core_decode_cb_t core_decode;
+	struct list_head lat_list;
+	struct list_head core_list;
+};
+
+/**
+ * struct vdec_msg_queue - used to store lat buffer message
+ */
+struct vdec_msg_queue {
+	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
+
+	struct mtk_vcodec_mem wdma_addr;
+	uint64_t wdma_rptr_addr;
+	uint64_t wdma_wptr_addr;
+
+	struct vdec_msg_queue_ctx lat_ctx;
+};
+
+/**
+ * vdec_msg_queue_init - init lat buffer information.
+ * @msg_queue: used to store the lat buffer information
+ * @ctx: v4l2 ctx
+ * @core_decode: core decode callback for each codec
+ * @private_size: the private data size used to share with core
+ */
+int vdec_msg_queue_init(
+	struct vdec_msg_queue *msg_queue,
+	struct mtk_vcodec_ctx *ctx,
+	core_decode_cb_t core_decode,
+	int private_size);
+
+/**
+ * vdec_msg_queue_get_lat_buf - get used lat buffer for core decode.
+ * @ctx: message queue context
+ * @hardware_index: hardware index
+ */
+void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx,
+	int hardware_index);
+
+/**
+ * vdec_msg_queue_qbuf - enqueue lat buffer to queue list.
+ * @ctx: message queue context
+ * @buf: current lat buffer
+ */
+void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *ctx,
+	struct vdec_lat_buf *buf);
+
+/**
+ * vdec_msg_queue_dqbuf - dequeue lat buffer from queue list.
+ * @ctx: message queue context
+ */
+struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *ctx);
+
+/**
+ * vdec_msg_queue_update_ube_rptr - used to updata the ube read point.
+ * @msg_queue: used to store the lat buffer information
+ * @ube_rptr: current ube read point
+ */
+void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
+	uint64_t ube_rptr);
+
+/**
+ * vdec_msg_queue_update_ube_wptr - used to updata the ube write point.
+ * @msg_queue: used to store the lat buffer information
+ * @ube_wptr: current ube write point
+ */
+void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
+	uint64_t ube_wptr);
+
+/**
+ * vdec_msg_queue_wait_lat_buf_full - used to check whether all lat buffer
+ *                                    in lat list.
+ * @msg_queue: used to store the lat buffer information
+ */
+bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue);
+
+/**
+ * vdec_msg_queue_deinit - deinit lat buffer information.
+ * @msg_queue: used to store the lat buffer information
+ * @ctx: v4l2 ctx
+ */
+void vdec_msg_queue_deinit(
+	struct vdec_msg_queue *msg_queue,
+	struct mtk_vcodec_ctx *ctx);
+
+#endif
-- 
2.25.1

