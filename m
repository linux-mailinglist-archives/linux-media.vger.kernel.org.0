Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECC53CC1E2
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 10:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbhGQIPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 04:15:52 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:56350 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232501AbhGQIPo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 04:15:44 -0400
X-UUID: 7ff4d27f9e1e4b788aae4230eb1d6e70-20210717
X-UUID: 7ff4d27f9e1e4b788aae4230eb1d6e70-20210717
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1634036852; Sat, 17 Jul 2021 16:12:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 16:12:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 16:12:42 +0800
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
Subject: [PATCH v2, 06/14] media: mtk-vcodec: Add irq interface for core hardware
Date:   Sat, 17 Jul 2021 16:12:25 +0800
Message-ID: <20210717081233.7809-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds irq interface for core hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v2: Using enum mtk_vdec_hw_count instead of magic numbers
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 31 ++++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 11 ++++---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 19 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 32 ++++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 ++-
 5 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e7f60e948fe8..d1c4124f6092 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -75,6 +75,20 @@ static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
 	wake_up_interruptible(&ctx->queue);
 }
 
+static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
+{
+	switch (dev->vdec_pdata->hw_arch) {
+	case MTK_VDEC_PURE_SINGLE_CORE:
+		return MTK_VDEC_ONE_CORE;
+	case MTK_VDEC_LAT_SINGLE_CORE:
+		return MTK_VDEC_ONE_LAT_ONE_CORE;
+	default:
+		mtk_v4l2_err("not support hw arch:%d",
+			dev->vdec_pdata->hw_arch);
+		return MTK_VDEC_NO_HW;
+	}
+}
+
 static struct component_match *mtk_vcodec_match_add(
 	struct mtk_vcodec_dev *vdec_dev)
 {
@@ -246,7 +260,7 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	int ret = 0;
+	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -260,7 +274,19 @@ static int fops_vcodec_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
-	init_waitqueue_head(&ctx->queue);
+
+	if (ctx->dev->is_support_comp) {
+		hw_count = mtk_vcodec_get_hw_count(dev);
+		if (!hw_count) {
+			ret = -EINVAL;
+			goto err_init_queue;
+		}
+		for (i = 0; i < hw_count; i++)
+			init_waitqueue_head(&ctx->core_queue[i]);
+	} else {
+		init_waitqueue_head(&ctx->queue);
+	}
+
 	mutex_init(&ctx->lock);
 
 	ctx->type = MTK_INST_DECODER;
@@ -317,6 +343,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
+err_init_queue:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index ea6d289d9773..34d51fe409c6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -59,11 +59,12 @@ static const struct component_ops mtk_vdec_hw_component_ops = {
 	.unbind = mtk_vdec_comp_unbind,
 };
 
-/* Wake up context wait_queue */
-static void mtk_vdec_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx)
+/* Wake up core context wait_queue */
+static void mtk_vdec_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx,
+	unsigned int hw_id)
 {
-	ctx->int_cond = 1;
-	wake_up_interruptible(&ctx->queue);
+	ctx->int_core_cond[hw_id] = 1;
+	wake_up_interruptible(&ctx->core_queue[hw_id]);
 }
 
 static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
@@ -94,7 +95,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
 	writel(readl(vdec_misc_addr) | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(readl(vdec_misc_addr) & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
-	mtk_vdec_comp_wake_up_ctx(ctx);
+	mtk_vdec_comp_wake_up_ctx(ctx, dev->comp_idx);
 
 	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
 		ctx->id, dec_done_status);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9d05ee72b2a7..76160b6f4152 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -109,6 +109,16 @@ enum mtk_vdec_hw_id {
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
@@ -261,6 +271,11 @@ struct vdec_pic_info {
  *	   finish
  * @irq_status: irq status
  *
+ * @int_core_cond: variable used by the waitqueue  for component arch
+ * @int_core_type: type of the last interrupt for component arch
+ * @core_queue: waitqueue that can be used to wait for this context to
+ *	   finish for component arch
+ *
  * @ctrl_hdl: handler for v4l2 framework
  * @decode_work: worker for the decoding
  * @encode_work: worker for the encoding
@@ -303,6 +318,10 @@ struct mtk_vcodec_ctx {
 	wait_queue_head_t queue;
 	unsigned int irq_status;
 
+	int int_core_cond[MTK_VDEC_HW_MAX];
+	int int_core_type[MTK_VDEC_HW_MAX];
+	wait_queue_head_t core_queue[MTK_VDEC_HW_MAX];
+
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct work_struct decode_work;
 	struct work_struct encode_work;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index 70580c2525ba..306358d9bef0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -11,7 +11,7 @@
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx, int command,
 				 unsigned int timeout_ms)
 {
 	wait_queue_head_t *waitqueue;
@@ -43,3 +43,33 @@ int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
 	return status;
 }
 EXPORT_SYMBOL(mtk_vcodec_wait_for_done_ctx);
+
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx *ctx,
+	int command, unsigned int timeout_ms, unsigned hw_id)
+{
+	long timeout_jiff, ret;
+	int status = 0;
+
+	timeout_jiff = msecs_to_jiffies(timeout_ms);
+	ret = wait_event_interruptible_timeout(ctx->core_queue[hw_id],
+				ctx->int_core_cond[hw_id],
+				timeout_jiff);
+
+	if (!ret) {
+		status = -1;	/* timeout */
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums (%d %d)",
+				ctx->id, command, ctx->type, timeout_ms,
+				ctx->int_core_cond[hw_id], ctx->int_core_type[hw_id]);
+	} else if (-ERESTARTSYS == ret) {
+		status = -1;
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d %d)",
+				ctx->id, command, ctx->type,
+				ctx->int_core_cond[hw_id], ctx->int_core_type[hw_id]);
+	}
+
+	ctx->int_core_cond[hw_id] = 0;
+	ctx->int_core_type[hw_id] = 0;
+
+	return status;
+}
+EXPORT_SYMBOL(mtk_vcodec_wait_for_comp_done_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
index 638cd1f3526a..5ca611a1ddab 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -12,7 +12,9 @@
 struct mtk_vcodec_ctx;
 
 /* timeout is ms */
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx, int command,
 				unsigned int timeout_ms);
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx *ctx,
+				int command, unsigned int timeout_ms, unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
-- 
2.25.1

