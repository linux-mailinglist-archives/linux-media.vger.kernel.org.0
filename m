Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B6D3BE31E
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhGGGZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:21 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50300 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230345AbhGGGZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:25:14 -0400
X-UUID: c763cdd2626a4d5b811ced38617618c4-20210707
X-UUID: c763cdd2626a4d5b811ced38617618c4-20210707
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 790243986; Wed, 07 Jul 2021 14:22:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:22 +0800
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
Subject: [PATCH v1, 06/14] media: mtk-vcodec: Add irq interface for core hardware
Date:   Wed, 7 Jul 2021 14:21:49 +0800
Message-ID: <20210707062157.21176-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds irq interface for core hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 27 +++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 18 ++++++-----
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  9 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 30 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  2 ++
 5 files changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 8f5b3c9345a4..ab9f06f250cd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -74,6 +74,16 @@ static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
 	wake_up_interruptible(&ctx->queue);
 }
 
+static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
+{
+	if (dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
+		return 1;
+	else if (dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE)
+		return 2;
+	else
+		return 0;
+}
+
 static struct component_match *mtk_vcodec_match_add(
 	struct mtk_vcodec_dev *vdec_dev)
 {
@@ -240,7 +250,7 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	int ret = 0;
+	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -254,7 +264,19 @@ static int fops_vcodec_open(struct file *file)
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
@@ -311,6 +333,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
+err_init_queue:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index a97bb1dd2cc4..2763ef298f8a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -58,11 +58,12 @@ static const struct component_ops mtk_vdec_hw_component_ops = {
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
@@ -93,7 +94,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
 	writel((readl(vdec_misc_addr) | VDEC_IRQ_CFG), vdec_misc_addr);
 	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR), vdec_misc_addr);
 
-	mtk_vdec_comp_wake_up_ctx(ctx);
+	mtk_vdec_comp_wake_up_ctx(ctx, dev->comp_idx);
 
 	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
 		ctx->id, dec_done_status);
@@ -113,8 +114,7 @@ static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
-				mtk_vdec_comp_irq_handler,
-				0, pdev->name, dev);
+				mtk_vdec_comp_irq_handler, 0, pdev->name, dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
 			dev->dec_irq, ret);
@@ -154,8 +154,10 @@ static int mtk_vdec_comp_probe(struct platform_device *pdev)
 		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
 
 	ret = mtk_vdec_comp_init_irq(dev);
-	if (ret)
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register irq handler.\n");
 		goto err;
+	}
 
 	platform_set_drvdata(pdev, dev);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 0539fc50ad4e..50c87bca3973 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -263,6 +263,11 @@ struct vdec_pic_info {
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
@@ -305,6 +310,10 @@ struct mtk_vcodec_ctx {
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
index 70580c2525ba..8411c670a761 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -43,3 +43,33 @@ int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
 	return status;
 }
 EXPORT_SYMBOL(mtk_vcodec_wait_for_done_ctx);
+
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx  *ctx,
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
index 638cd1f3526a..345f63953fa1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -14,5 +14,7 @@ struct mtk_vcodec_ctx;
 /* timeout is ms */
 int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
 				unsigned int timeout_ms);
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx  *ctx,
+				int command, unsigned int timeout_ms, unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
-- 
2.18.0

