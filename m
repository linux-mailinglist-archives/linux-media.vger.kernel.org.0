Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8113ED2D1
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236427AbhHPLBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:01:36 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:42090 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236376AbhHPLBW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:01:22 -0400
X-UUID: 0f203480291e4a2c8795eaf1ead89c8f-20210816
X-UUID: 0f203480291e4a2c8795eaf1ead89c8f-20210816
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1912319955; Mon, 16 Aug 2021 19:00:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:45 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:44 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 9/9] media: mtk-vcodec: Add delayed worker for encode timeout
Date:   Mon, 16 Aug 2021 18:59:34 +0800
Message-ID: <20210816105934.28265-10-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When encoding timeout, a delayed timeout worker is needed because
of asynchronous encoding process, restore encoding process in
timeout worker.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 12 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 26 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  2 +
 .../platform/mtk-vcodec/venc/venc_common_if.c | 43 +++++++++++++++++--
 4 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index de8e012f1b0e..bc635436aa90 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1340,9 +1340,15 @@ void mtk_venc_buf_done(struct mtk_vcodec_ctx *ctx, int core_id,
 		if (key_frame)
 			dst_vb2_v4l2->flags |= V4L2_BUF_FLAG_KEYFRAME;
 
-		v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_DONE);
-		dst_vb2_v4l2->vb2_buf.planes[0].bytesused = bs_size;
-		v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_DONE);
+		if (time_out) {
+			v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_ERROR);
+			dst_vb2_v4l2->vb2_buf.planes[0].bytesused = 0;
+			v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_ERROR);
+		} else {
+			v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_DONE);
+			dst_vb2_v4l2->vb2_buf.planes[0].bytesused = bs_size;
+			v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_DONE);
+		}
 	}
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
index 687b255c58e8..f6a5dfa6929f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
@@ -16,6 +16,28 @@
 #define VENC_PIC_FRM_TYPE	0x0010
 #define VENC_PIC_KEY_FRM	0x2
 
+static void mtk_venc_timeout_worker(struct work_struct *work)
+{
+	struct mtk_venc_comp_dev *dev = container_of(work,
+						     struct mtk_venc_comp_dev,
+						     enc_timeout_worker.work);
+
+	struct mtk_vcodec_ctx *ctx;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->master_dev->irqlock, flags);
+	ctx = dev->curr_ctx;
+
+	dev_err(&dev->plat_dev->dev, "core: %d timeout\n", dev->core_id);
+
+	mtk_venc_buf_done(ctx, dev->core_id, 0, 1, 0);
+
+	mtk_vcodec_enc_clock_off(dev->master_dev, dev->core_id);
+	dev->curr_ctx = NULL;
+	spin_unlock_irqrestore(&dev->master_dev->irqlock, flags);
+
+	mtk_venc_unlock(ctx, dev->core_id);
+}
 /* Wake up core context wait_queue */
 static void mtk_venc_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx,
 				      unsigned int hw_id)
@@ -67,6 +89,7 @@ static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
 	frm_type = readl(dev->reg_base + VENC_PIC_FRM_TYPE);
 	clean_irq_status(ctx->irq_status, addr);
 	if (ctx->irq_status & MTK_VENC_IRQ_STATUS_FRM) {
+		cancel_delayed_work(&dev->enc_timeout_worker);
 		if (ctx->hdr_size != 0) {
 			bs_size += ctx->hdr_size;
 			ctx->hdr_size = 0;
@@ -182,6 +205,9 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, comp_dev);
 
+	INIT_DELAYED_WORK(&comp_dev->enc_timeout_worker,
+			  mtk_venc_timeout_worker);
+
 	ret = component_add(&pdev->dev, &mtk_venc_component_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add component: %d\n", ret);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
index f9ae97e252dc..e69344e38ca6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
@@ -19,6 +19,7 @@
  * @irq_status: venc hw irq status
  * @enc_irq: venc device irq
  * @core id: for venc core id: core#0, core#1...
+ * @enc_timeout_worker: venc timeout worker
  */
 struct mtk_venc_comp_dev {
 	struct platform_device *plat_dev;
@@ -31,6 +32,7 @@ struct mtk_venc_comp_dev {
 	unsigned int irq_status;
 	int enc_irq;
 	int core_id;
+	struct delayed_work enc_timeout_worker;
 };
 
 #endif /* _MTK_VCODEC_ENC_HW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
index 75b4e90232ae..1aab84faadf0 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
@@ -10,11 +10,13 @@
 #include "../mtk_vcodec_drv.h"
 #include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_enc_hw.h"
+#include "../mtk_vcodec_enc_pm.h"
 
 static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
 
 #define H264_FILLER_MARKER_SIZE ARRAY_SIZE(h264_filler_marker)
 #define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
+#define MTK_VENC_HW_TIMEOUT_MSEC 2000
 
 enum venc_vpu_work_buf {
 	VENC_VPU_WORK_BUF_RC_INFO_CORE0,
@@ -413,6 +415,34 @@ static void h264_encode_filler(struct venc_common_inst *inst, void *buf,
 	memset(p, 0xff, size);
 }
 
+static void init_schedule_work(struct mtk_vcodec_ctx *ctx)
+{
+	unsigned long timeout;
+	struct mtk_venc_comp_dev *venc;
+
+	venc = ctx->dev->enc_comp_dev[ctx->hw_id];
+	timeout = msecs_to_jiffies(MTK_VENC_HW_TIMEOUT_MSEC);
+	schedule_delayed_work(&venc->enc_timeout_worker, timeout);
+}
+
+static void cancel_schedule_work(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_venc_comp_dev *venc;
+	unsigned long flags;
+
+	venc = ctx->dev->enc_comp_dev[ctx->hw_id];
+	cancel_delayed_work(&venc->enc_timeout_worker);
+
+	mtk_venc_buf_done(ctx, ctx->hw_id, 0, 1, 0);
+	mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
+
+	spin_lock_irqsave(&ctx->dev->irqlock, flags);
+	venc->curr_ctx = NULL;
+	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
+
+	mtk_venc_unlock(ctx, ctx->hw_id);
+}
+
 static int venc_init(struct mtk_vcodec_ctx *ctx)
 {
 	int i;
@@ -489,12 +519,13 @@ static int venc_encode(void *handle,
 		ctx->pbs_buf[ctx->hw_id] = bs_buf->buf;
 
 		if (!inst->prepend_hdr) {
+			init_schedule_work(ctx);
 			ret = venc_encode_frame(inst, frm_buf, bs_buf,
 						&result->bs_size, ctx->hw_id);
 			if (ret) {
 				mtk_vcodec_err(inst, "encode frame failed: %d",
 					       ret);
-				return ret;
+				goto encode_err;
 			}
 
 			result->is_key_frm = inst->vpu_inst.is_key_frm;
@@ -503,11 +534,13 @@ static int venc_encode(void *handle,
 
 		mtk_vcodec_debug(inst, "venc_encode_frame prepend SPS/PPS");
 
+		init_schedule_work(ctx);
+
 		ret = venc_encode_header(inst, bs_buf, &bs_size_hdr);
 		if (ret) {
 			mtk_vcodec_err(inst, "encode prepend hdr failed: %d",
 				       ret);
-			return ret;
+			goto encode_err;
 		}
 
 		hdr_sz = bs_size_hdr;
@@ -530,7 +563,7 @@ static int venc_encode(void *handle,
 		if (ret) {
 			mtk_vcodec_err(inst, "encode hdr frame failed: %d",
 				       ret);
-			return ret;
+			goto encode_err;
 		}
 
 		result->bs_size = hdr_sz + filler_sz + bs_size_frm;
@@ -552,6 +585,10 @@ static int venc_encode(void *handle,
 	}
 
 	return ret;
+
+encode_err:
+	cancel_schedule_work(ctx);
+	return ret;
 }
 
 static int venc_set_param(void *handle,
-- 
2.25.1

