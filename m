Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98FF3BE311
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhGGGZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:23 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49606 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230349AbhGGGZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:25:14 -0400
X-UUID: e22b7bb0d1464a1c8446ca767b47e881-20210707
X-UUID: e22b7bb0d1464a1c8446ca767b47e881-20210707
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1651282079; Wed, 07 Jul 2021 14:22:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:23 +0800
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
Subject: [PATCH v1, 07/14] media: mtk-vcodec: Add msg queue feature for lat and core architecture
Date:   Wed, 7 Jul 2021 14:21:50 +0800
Message-ID: <20210707062157.21176-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
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
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  15 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 234 ++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 130 ++++++++++
 4 files changed, 380 insertions(+)
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
index 50c87bca3973..53a3bab0da52 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -17,7 +17,9 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
+
 #include "mtk_vcodec_util.h"
+#include "vdec_msg_queue.h"
 
 #define VDEC_HW_ACTIVE	0x10
 #define VDEC_IRQ_CFG	0x11
@@ -284,6 +286,8 @@ struct vdec_pic_info {
  * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
+ *
+ * @msg_queue: msg queue used to store lat buffer information.
  */
 struct mtk_vcodec_ctx {
 	enum mtk_instance_type type;
@@ -331,6 +335,7 @@ struct mtk_vcodec_ctx {
 	int decoded_frame_cnt;
 	struct mutex lock;
 
+	struct vdec_msg_queue msg_queue;
 };
 
 enum mtk_chip {
@@ -464,6 +469,11 @@ struct mtk_vcodec_enc_pdata {
  * comp_dev: component hardware device
  * component_node: component node
  * comp_idx: component index
+ *
+ * core_read: Wait queue used to signalize when core get useful lat buffer
+ * core_queue: List of V4L2 lat_buf
+ * core_lock: spin lock to protect the struct usage
+ * num_core: number of buffers ready to be processed
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -506,6 +516,11 @@ struct mtk_vcodec_dev {
 	void *comp_dev[MTK_VDEC_HW_MAX];
 	struct device_node *component_node[MTK_VDEC_HW_MAX];
 	int comp_idx;
+
+	wait_queue_head_t core_read;
+	struct list_head core_queue;
+	spinlock_t core_lock;
+	int num_core;
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
new file mode 100644
index 000000000000..9d684e5f051c
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -0,0 +1,234 @@
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
+int vdec_msg_queue_init(
+	struct mtk_vcodec_ctx *ctx,
+	struct vdec_msg_queue *msg_queue,
+	core_decode_cb_t core_decode,
+	int private_size)
+{
+	struct vdec_lat_buf *lat_buf;
+	int i, err;
+
+	init_waitqueue_head(&msg_queue->lat_read);
+	INIT_LIST_HEAD(&msg_queue->lat_queue);
+	spin_lock_init(&msg_queue->lat_lock);
+	msg_queue->num_lat = 0;
+
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
+			return -ENOMEM;
+		}
+
+		lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
+		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
+		if (err) {
+			mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
+			return -ENOMEM;
+		}
+
+		lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
+		if (!lat_buf->private_data) {
+			mtk_v4l2_err("failed to allocate private_data[%d]", i);
+			return -ENOMEM;
+		}
+
+		lat_buf->ctx = ctx;
+		lat_buf->core_decode = core_decode;
+		vdec_msg_queue_buf_to_lat(lat_buf);
+	}
+
+	msg_queue->init_done = true;
+	return 0;
+}
+
+struct vdec_lat_buf *vdec_msg_queue_get_lat_buf(
+	struct vdec_msg_queue *msg_queue)
+{
+	struct vdec_lat_buf *buf;
+	long timeout_jiff;
+	int ret;
+
+	spin_lock(&msg_queue->lat_lock);
+	if (list_empty(&msg_queue->lat_queue)) {
+		mtk_v4l2_debug(3, "lat queue is NULL, num_lat = %d", msg_queue->num_lat);
+		spin_unlock(&msg_queue->lat_lock);
+		timeout_jiff = msecs_to_jiffies(1500);
+		ret = wait_event_timeout(msg_queue->lat_read,
+			!list_empty(&msg_queue->lat_queue), timeout_jiff);
+		if (!ret)
+			return NULL;
+		spin_lock(&msg_queue->lat_lock);
+	}
+
+	buf = list_first_entry(&msg_queue->lat_queue, struct vdec_lat_buf,
+		lat_list);
+	list_del(&buf->lat_list);
+	msg_queue->num_lat--;
+
+	mtk_v4l2_debug(4, "lat num in msg queue = %d", msg_queue->num_lat);
+	mtk_v4l2_debug(3, "get lat(0x%p) trans(0x%llx) err:0x%llx slice(0x%llx)\n",
+		buf, msg_queue->wdma_addr.dma_addr,
+		buf->wdma_err_addr.dma_addr,
+		buf->slice_bc_addr.dma_addr);
+
+	spin_unlock(&msg_queue->lat_lock);
+	return buf;
+}
+
+struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
+	struct mtk_vcodec_dev *dev)
+{
+	struct vdec_lat_buf *buf;
+	int ret;
+
+	spin_lock(&dev->core_lock);
+	if (list_empty(&dev->core_queue)) {
+		mtk_v4l2_debug(3, "core queue is NULL, num_core = %d", dev->num_core);
+		spin_unlock(&dev->core_lock);
+		ret = wait_event_freezable(dev->core_read,
+			!list_empty(&dev->core_queue));
+		if (ret)
+			return NULL;
+		spin_lock(&dev->core_lock);
+	}
+
+	buf = list_first_entry(&dev->core_queue, struct vdec_lat_buf,
+		core_list);
+	mtk_v4l2_debug(3, "get core buf addr: (0x%p)", buf);
+	list_del(&buf->core_list);
+	dev->num_core--;
+	spin_unlock(&dev->core_lock);
+	return buf;
+}
+
+void vdec_msg_queue_buf_to_lat(struct vdec_lat_buf *buf)
+{
+	struct vdec_msg_queue *msg_queue = &buf->ctx->msg_queue;
+
+	spin_lock(&msg_queue->lat_lock);
+	list_add_tail(&buf->lat_list, &msg_queue->lat_queue);
+	msg_queue->num_lat++;
+	wake_up_all(&msg_queue->lat_read);
+	mtk_v4l2_debug(3, "queue buf addr: (0x%p) lat num = %d",
+		buf, msg_queue->num_lat);
+	spin_unlock(&msg_queue->lat_lock);
+}
+
+void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
+	struct vdec_lat_buf *buf)
+{
+	spin_lock(&dev->core_lock);
+	list_add_tail(&buf->core_list, &dev->core_queue);
+	dev->num_core++;
+	wake_up_all(&dev->core_read);
+	mtk_v4l2_debug(3, "queu buf addr: (0x%p)", buf);
+	spin_unlock(&dev->core_lock);
+}
+
+void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
+	uint64_t ube_rptr)
+{
+	spin_lock(&msg_queue->lat_lock);
+	msg_queue->wdma_rptr_addr = ube_rptr;
+	mtk_v4l2_debug(3, "update ube rprt (0x%llx)", ube_rptr);
+	spin_unlock(&msg_queue->lat_lock);
+}
+
+void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
+	uint64_t ube_wptr)
+{
+	spin_lock(&msg_queue->lat_lock);
+	msg_queue->wdma_wptr_addr = ube_wptr;
+	mtk_v4l2_debug(3, "update ube wprt: (0x%llx 0x%llx) offset: 0x%llx",
+		msg_queue->wdma_rptr_addr, msg_queue->wdma_wptr_addr, ube_wptr);
+	spin_unlock(&msg_queue->lat_lock);
+}
+
+bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
+{
+	long timeout_jiff;
+	int ret, i;
+
+	for (i = 0; i < NUM_BUFFER_COUNT + 2; i++) {
+		timeout_jiff = msecs_to_jiffies(1000);
+		ret = wait_event_timeout(msg_queue->lat_read,
+			msg_queue->num_lat == NUM_BUFFER_COUNT, timeout_jiff);
+		if (ret) {
+			mtk_v4l2_debug(3, "success to get lat buf: %d",
+				msg_queue->num_lat);
+			return true;
+		}
+	}
+
+	mtk_v4l2_err("failed with lat buf isn't full: %d",
+		msg_queue->num_lat);
+	return false;
+}
+
+void vdec_msg_queue_deinit(
+	struct mtk_vcodec_ctx *ctx,
+	struct vdec_msg_queue *msg_queue)
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
+
+	msg_queue->init_done = false;
+}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
new file mode 100644
index 000000000000..62261702c464
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -0,0 +1,130 @@
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
+	wait_queue_head_t lat_read;
+	struct list_head lat_queue;
+	spinlock_t lat_lock;
+	int num_lat;
+	bool init_done;
+};
+
+/**
+ * vdec_msg_queue_init - init lat buffer information.
+ * @ctx: v4l2 ctx
+ * @msg_queue: used to store the lat buffer information
+ * @core_decode: core decode callback for each codec
+ * @private_size: the private data size used to share with core
+ */
+int vdec_msg_queue_init(
+	struct mtk_vcodec_ctx *ctx,
+	struct vdec_msg_queue *msg_queue,
+	core_decode_cb_t core_decode,
+	int private_size);
+
+/**
+ * vdec_msg_queue_get_lat_buf - get used lat buffer for core decode.
+ * @msg_queue: used to store the lat buffer information
+ */
+struct vdec_lat_buf *vdec_msg_queue_get_lat_buf(
+	struct vdec_msg_queue *msg_queue);
+
+/**
+ * vdec_msg_queue_get_core_buf - get used core buffer for lat decode.
+ * @dev: mtk vcodec device
+ */
+struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
+	struct mtk_vcodec_dev *dev);
+
+/**
+ * vdec_msg_queue_buf_to_core - queue buf to the core for core decode.
+ * @dev: mtk vcodec device
+ * @buf: current lat buffer
+ */
+void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
+	struct vdec_lat_buf *buf);
+
+/**
+ * vdec_msg_queue_buf_to_lat - queue buf to lat for lat decode.
+ * @buf: current lat buffer
+ */
+void vdec_msg_queue_buf_to_lat(struct vdec_lat_buf *buf);
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
+ * @ctx: v4l2 ctx
+ * @msg_queue: used to store the lat buffer information
+ */
+void vdec_msg_queue_deinit(
+	struct mtk_vcodec_ctx *ctx,
+	struct vdec_msg_queue *msg_queue);
+
+#endif
-- 
2.18.0

