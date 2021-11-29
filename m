Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B87460D9A
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 04:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377081AbhK2Drr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 22:47:47 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:44700 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1349515AbhK2Dpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 22:45:38 -0500
X-UUID: e7a094909bed43129daa0406f2c2e14a-20211129
X-UUID: e7a094909bed43129daa0406f2c2e14a-20211129
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 119269073; Mon, 29 Nov 2021 11:42:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 11:42:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 29 Nov 2021 11:42:15 +0800
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
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11, 09/19] media: mtk-vcodec: Add irq interface for multi hardware
Date:   Mon, 29 Nov 2021 11:41:51 +0800
Message-ID: <20211129034201.5767-10-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129034201.5767-1-yunfei.dong@mediatek.com>
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds irq interface for multi hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 33 ++++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 25 ++++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  4 +--
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 27 +++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 +--
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |  2 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |  2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  2 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  2 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  2 +-
 12 files changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 95fbe9be3f6d..ac279c2a3f8a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -52,6 +52,20 @@ static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_dev *vdec_dev)
 	return 0;
 }
 
+static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
+{
+	switch (dev->vdec_pdata->hw_arch) {
+	case MTK_VDEC_PURE_SINGLE_CORE:
+		 return MTK_VDEC_ONE_CORE;
+	case MTK_VDEC_LAT_SINGLE_CORE:
+		return MTK_VDEC_ONE_LAT_ONE_CORE;
+	default:
+		mtk_v4l2_err("not support hw arch:%d",
+			dev->vdec_pdata->hw_arch);
+		return MTK_VDEC_NO_HW;
+	}
+}
+
 static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -83,7 +97,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
 		dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
 
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
 
 	mtk_v4l2_debug(3,
 			"mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
@@ -156,7 +170,7 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	int ret = 0;
+	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -170,9 +184,20 @@ static int fops_vcodec_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
-	init_waitqueue_head(&ctx->queue);
-	mutex_init(&ctx->lock);
 
+	if (ctx->dev->vdec_pdata->is_subdev_supported) {
+		hw_count = mtk_vcodec_get_hw_count(dev);
+		if (!hw_count) {
+			ret = -EINVAL;
+			goto err_ctrls_setup;
+		}
+		for (i = 0; i < hw_count; i++)
+			init_waitqueue_head(&ctx->queue[i]);
+	} else {
+		init_waitqueue_head(&ctx->queue[0]);
+	}
+
+	mutex_init(&ctx->lock);
 	ret = mtk_vcodec_subdev_device_check(dev);
 	if (ret) {
 		mtk_v4l2_err("Failed to check vdec comp device.");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 025a103008ba..8bd23504cf4c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -61,7 +61,7 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
 	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
 		ctx->id, dec_done_status);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 79957222c979..7fc106df039b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -104,6 +104,16 @@ enum mtk_vdec_hw_id {
 	MTK_VDEC_HW_MAX,
 };
 
+/**
+ * struct mtk_vdec_hw_count - Supported hardware count
+ */
+enum mtk_vdec_hw_count {
+	MTK_VDEC_NO_HW = 0,
+	MTK_VDEC_ONE_CORE,
+	MTK_VDEC_ONE_LAT_ONE_CORE,
+	MTK_VDEC_MAX_HW_COUNT,
+};
+
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
@@ -293,9 +303,9 @@ struct mtk_vcodec_ctx {
 	struct vdec_pic_info picinfo;
 	int dpb_size;
 
-	int int_cond;
-	int int_type;
-	wait_queue_head_t queue;
+	int int_cond[MTK_VDEC_HW_MAX];
+	int int_type[MTK_VDEC_HW_MAX];
+	wait_queue_head_t queue[MTK_VDEC_HW_MAX];
 	unsigned int irq_status;
 
 	struct v4l2_ctrl_handler ctrl_hdl;
@@ -502,11 +512,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 }
 
 /* Wake up context wait_queue */
-static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
+static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason,
+	unsigned int hw_id)
 {
-	ctx->int_cond = 1;
-	ctx->int_type = reason;
-	wake_up_interruptible(&ctx->queue);
+	ctx->int_cond[hw_id] = 1;
+	ctx->int_type[hw_id] = reason;
+	wake_up_interruptible(&ctx->queue[hw_id]);
 }
 
 #endif /* _MTK_VCODEC_DRV_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 7c3487fb3498..0f326d82dea0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -106,7 +106,7 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 
 	clean_irq_status(ctx->irq_status, addr);
 
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
 	return IRQ_HANDLED;
 }
 
@@ -132,7 +132,7 @@ static int fops_vcodec_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
-	init_waitqueue_head(&ctx->queue);
+	init_waitqueue_head(&ctx->queue[0]);
 
 	ctx->type = MTK_INST_ENCODER;
 	ret = mtk_vcodec_enc_ctrls_setup(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index 70580c2525ba..8147533da98b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -11,34 +11,31 @@
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
-				 unsigned int timeout_ms)
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
+	int command, unsigned int timeout_ms, unsigned hw_id)
 {
-	wait_queue_head_t *waitqueue;
 	long timeout_jiff, ret;
 	int status = 0;
 
-	waitqueue = (wait_queue_head_t *)&ctx->queue;
 	timeout_jiff = msecs_to_jiffies(timeout_ms);
-
-	ret = wait_event_interruptible_timeout(*waitqueue,
-				ctx->int_cond,
+	ret = wait_event_interruptible_timeout(ctx->queue[hw_id],
+				ctx->int_cond[hw_id],
 				timeout_jiff);
 
 	if (!ret) {
 		status = -1;	/* timeout */
-		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
-			     ctx->id, ctx->type, command, timeout_ms,
-			     ctx->int_cond, ctx->int_type);
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums (%d %d)",
+				ctx->id, command, ctx->type, timeout_ms,
+				ctx->int_cond[hw_id], ctx->int_type[hw_id]);
 	} else if (-ERESTARTSYS == ret) {
-		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
-			     ctx->id, ctx->type, command, ctx->int_cond,
-			     ctx->int_type);
 		status = -1;
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d %d)",
+				ctx->id, command, ctx->type,
+				ctx->int_cond[hw_id], ctx->int_type[hw_id]);
 	}
 
-	ctx->int_cond = 0;
-	ctx->int_type = 0;
+	ctx->int_cond[hw_id] = 0;
+	ctx->int_type[hw_id] = 0;
 
 	return status;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
index 638cd1f3526a..2bf4cabfaa43 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -12,7 +12,7 @@
 struct mtk_vcodec_ctx;
 
 /* timeout is ms */
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
-				unsigned int timeout_ms);
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
+				int command, unsigned int timeout_ms, unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 40d6e6c5ac7a..481655bb6016 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -413,7 +413,7 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		/* wait decoder done interrupt */
 		err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
 						   MTK_INST_IRQ_RECEIVED,
-						   WAIT_INTR_TIMEOUT_MS);
+						   WAIT_INTR_TIMEOUT_MS, 0);
 		if (err)
 			goto err_free_fb_out;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
index 946c23088308..d402fc4bda69 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -727,7 +727,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	/* wait decoder done interrupt */
 	err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
 					   MTK_INST_IRQ_RECEIVED,
-					   WAIT_INTR_TIMEOUT_MS);
+					   WAIT_INTR_TIMEOUT_MS, 0);
 	if (err)
 		goto err_free_fb_out;
 	vpu_dec_end(vpu);
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index e5393f841080..88c046731754 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -488,7 +488,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	/* wait decoder done interrupt */
 	mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-				     WAIT_INTR_TIMEOUT_MS);
+				     WAIT_INTR_TIMEOUT_MS, 0);
 
 	if (inst->vsi->load_data)
 		load_dec_table(inst);
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 71cdc3ddafcb..70b8383f7c8e 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -539,7 +539,7 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *inst)
 
 	mtk_vcodec_wait_for_done_ctx(inst->ctx,
 			MTK_INST_IRQ_RECEIVED,
-			WAIT_INTR_TIMEOUT_MS);
+			WAIT_INTR_TIMEOUT_MS, 0);
 
 	if (ctx->irq_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
 		return true;
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6a4f2074fa5..9ae1bd8dbc32 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -335,7 +335,7 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
 	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
 
 	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
-					  WAIT_INTR_TIMEOUT_MS)) {
+					  WAIT_INTR_TIMEOUT_MS, 0)) {
 		irq_status = ctx->irq_status;
 		mtk_vcodec_debug(inst, "irq_status %x <-", irq_status);
 	}
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8267a9c4fd25..f96564277577 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -222,7 +222,7 @@ static unsigned int vp8_enc_wait_venc_done(struct venc_vp8_inst *inst)
 	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
 
 	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
-					  WAIT_INTR_TIMEOUT_MS)) {
+					  WAIT_INTR_TIMEOUT_MS, 0)) {
 		irq_status = ctx->irq_status;
 		mtk_vcodec_debug(inst, "isr return %x", irq_status);
 	}
-- 
2.25.1

