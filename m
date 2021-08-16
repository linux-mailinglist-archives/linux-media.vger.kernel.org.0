Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4EEB3ED2CB
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236280AbhHPLB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:01:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41986 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236315AbhHPLBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:01:19 -0400
X-UUID: 9dce8888aaff44768683aa06e80821c3-20210816
X-UUID: 9dce8888aaff44768683aa06e80821c3-20210816
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 478976115; Mon, 16 Aug 2021 19:00:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 16 Aug 2021 19:00:42 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:41 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
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
Subject: [PATCH 8/9] media: mtk-vcodec: Return encode result to client
Date:   Mon, 16 Aug 2021 18:59:33 +0800
Message-ID: <20210816105934.28265-9-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For frame-racing mode encoding, there will no sync wait IRQ done
function, so the encode result can't return to client in
device_run. After device_run called to trigger encoding process,
finish it, so another scheduled job can be ran. When encoding
done, return the encode result to client in IRQ handler.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  6 ++
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 61 ++++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      |  4 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 35 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |  1 +
 .../platform/mtk-vcodec/venc/venc_common_if.c |  9 +++
 .../media/platform/mtk-vcodec/venc_drv_if.h   |  2 +
 7 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 7a9c2dd52b91..c43321362896 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -274,6 +274,9 @@ struct vdec_pic_info {
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
  * @enc_idx: used to record encoded frame count
+ * @pfrm_buf: used to store current ctx's frame buffer information
+ * @pbs_buf: used to store current ctx's bitstream buffer information
+ * @hdr_size: used to store prepend header size
  */
 struct mtk_vcodec_ctx {
 	enum mtk_instance_type type;
@@ -316,6 +319,9 @@ struct mtk_vcodec_ctx {
 
 	int hw_id;
 	int enc_idx;
+	struct vb2_v4l2_buffer *pfrm_buf[MTK_VENC_HW_MAX];
+	struct vb2_v4l2_buffer *pbs_buf[MTK_VENC_HW_MAX];
+	unsigned int hdr_size;
 };
 
 enum mtk_chip {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 6b37bd092fdf..de8e012f1b0e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -867,6 +867,8 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 
 	mtk_v4l2_debug(2, "[%d]-> type=%d", ctx->id, q->type);
 
+	mtk_venc_lock_all(ctx);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 			dst_buf->vb2_buf.planes[0].bytesused = 0;
@@ -1014,10 +1016,13 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
 				ctx->id,
 				vb2_v4l2->vb2_buf.index,
 				mtk_buf->enc_params.force_intra);
-		if (mtk_buf->enc_params.force_intra)
+		if (mtk_buf->enc_params.force_intra) {
 			ret |= venc_if_set_param(ctx,
 						 VENC_SET_PARAM_FORCE_INTRA,
 						 NULL);
+
+			ctx->enc_idx = 0;
+		}
 	}
 
 	mtk_buf->param_change = MTK_ENCODE_PARAM_NONE;
@@ -1068,9 +1073,12 @@ static void mtk_venc_worker(struct work_struct *work)
 		frm_buf.fb_addr[i].size =
 				(size_t)src_buf->vb2_buf.planes[i].length;
 	}
+	frm_buf.src_addr = src_buf;
+
 	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
+	bs_buf.buf = dst_buf;
 
 	mtk_v4l2_debug(2,
 			"Framebuf PA=%llx Size=0x%zx;PA=0x%llx Size=0x%zx;PA=0x%llx Size=%zu",
@@ -1119,6 +1127,8 @@ static void m2mops_venc_device_run(void *priv)
 {
 	struct mtk_vcodec_ctx *ctx = priv;
 
+	mtk_venc_param_change(ctx);
+
 	if ((ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc == V4L2_PIX_FMT_H264) &&
 	    (ctx->state != MTK_STATE_HEADER)) {
 		/* encode h264 sps/pps header */
@@ -1127,7 +1137,6 @@ static void m2mops_venc_device_run(void *priv)
 		return;
 	}
 
-	mtk_venc_param_change(ctx);
 	queue_work(ctx->dev->encode_workqueue, &ctx->encode_work);
 }
 
@@ -1310,6 +1319,33 @@ int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
 	return vb2_queue_init(dst_vq);
 }
 
+void mtk_venc_buf_done(struct mtk_vcodec_ctx *ctx, int core_id,
+		       unsigned int bs_size, bool time_out, bool key_frame)
+{
+	struct vb2_v4l2_buffer *src_vb2_v4l2 = NULL;
+	struct vb2_v4l2_buffer *dst_vb2_v4l2 = NULL;
+
+	/*
+	 * the frm_buf(src_buf) and bs_buf(dst_buf) can be obtained from ctx,
+	 * then put them to done list, user can get them by dqbuf call
+	 */
+	src_vb2_v4l2 = ctx->pfrm_buf[core_id];
+	dst_vb2_v4l2 = ctx->pbs_buf[core_id];
+
+	if (src_vb2_v4l2 && dst_vb2_v4l2) {
+		dst_vb2_v4l2->vb2_buf.timestamp =
+			src_vb2_v4l2->vb2_buf.timestamp;
+		dst_vb2_v4l2->timecode = src_vb2_v4l2->timecode;
+
+		if (key_frame)
+			dst_vb2_v4l2->flags |= V4L2_BUF_FLAG_KEYFRAME;
+
+		v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_DONE);
+		dst_vb2_v4l2->vb2_buf.planes[0].bytesused = bs_size;
+		v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_DONE);
+	}
+}
+
 int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx, int core_id)
 {
 	struct mtk_vcodec_dev *dev = ctx->dev;
@@ -1335,3 +1371,24 @@ void mtk_vcodec_enc_release(struct mtk_vcodec_ctx *ctx)
 
 	ctx->state = MTK_STATE_FREE;
 }
+
+void mtk_venc_lock_all(struct mtk_vcodec_ctx *ctx)
+{
+	unsigned int i;
+	struct mtk_vcodec_dev *dev = ctx->dev;
+
+	/*
+	 * For frame-racing mode encoding, there are may be bufs being encoded
+	 * when get the empty flush buffer or stop streaming, for example, the
+	 * buffer with LAST flag will return to client before the encoding
+	 * buffers, which will cause frame lost.
+	 * The encoder device mutex will be locked during encoding process,
+	 * when encode done, the mutex unlocked. So if all encoder device mutex
+	 * can be locked, which means there are no bufs being encoded at this
+	 * time, then the buffer with LAST flag can return to client properly.
+	 */
+	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
+		mutex_lock(&dev->enc_mutex[i]);
+		mutex_unlock(&dev->enc_mutex[i]);
+	}
+}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
index 8d486f532025..1d603ccb2f3d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
@@ -48,5 +48,7 @@ int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
 void mtk_vcodec_enc_release(struct mtk_vcodec_ctx *ctx);
 int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx);
 void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx);
-
+void mtk_venc_buf_done(struct mtk_vcodec_ctx *ctx, int core_id,
+		       unsigned int bs_size, bool time_out, bool key_frame);
+void mtk_venc_lock_all(struct mtk_vcodec_ctx *ctx);
 #endif /* _MTK_VCODEC_ENC_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
index 2a9112b0561d..687b255c58e8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
@@ -12,6 +12,17 @@
 #include "mtk_vcodec_enc_hw.h"
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_enc.h"
+#define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
+#define VENC_PIC_FRM_TYPE	0x0010
+#define VENC_PIC_KEY_FRM	0x2
+
+/* Wake up core context wait_queue */
+static void mtk_venc_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx,
+				      unsigned int hw_id)
+{
+	ctx->int_cond = 1;
+	wake_up_interruptible(&ctx->queue);
+}
 
 static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
 {
@@ -40,6 +51,9 @@ static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
 	struct mtk_vcodec_ctx *ctx;
 	unsigned long flags;
 	void __iomem *addr;
+	unsigned int bs_size;
+	unsigned int frm_type;
+	bool is_key_frame = 0;
 
 	spin_lock_irqsave(&dev->master_dev->irqlock, flags);
 	ctx = dev->curr_ctx;
@@ -49,7 +63,28 @@ static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
 
 	addr = dev->reg_base + MTK_VENC_IRQ_ACK_OFFSET;
 	ctx->irq_status = readl(dev->reg_base + MTK_VENC_IRQ_STATUS_OFFSET);
+	bs_size = readl(dev->reg_base + VENC_PIC_BITSTREAM_BYTE_CNT);
+	frm_type = readl(dev->reg_base + VENC_PIC_FRM_TYPE);
 	clean_irq_status(ctx->irq_status, addr);
+	if (ctx->irq_status & MTK_VENC_IRQ_STATUS_FRM) {
+		if (ctx->hdr_size != 0) {
+			bs_size += ctx->hdr_size;
+			ctx->hdr_size = 0;
+		}
+		if (frm_type & VENC_PIC_KEY_FRM)
+			is_key_frame = 1;
+
+		mtk_venc_buf_done(ctx, dev->core_id, bs_size, 0, is_key_frame);
+		mtk_vcodec_enc_clock_off(dev->master_dev, dev->core_id);
+
+		spin_lock_irqsave(&dev->master_dev->irqlock, flags);
+		dev->curr_ctx = NULL;
+		spin_unlock_irqrestore(&dev->master_dev->irqlock, flags);
+
+		mtk_venc_unlock(ctx, dev->core_id);
+	} else {
+		mtk_venc_comp_wake_up_ctx(ctx, dev->core_id);
+	}
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index 0027747c0a27..7321b7537f20 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -15,6 +15,7 @@ struct mtk_vcodec_mem {
 	size_t size;
 	void *va;
 	dma_addr_t dma_addr;
+	void *buf;
 };
 
 struct mtk_vcodec_fb {
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
index 1580bd1beaac..75b4e90232ae 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
@@ -481,6 +481,13 @@ static int venc_encode(void *handle,
 		unsigned int bs_size_hdr;
 		unsigned int bs_size_frm;
 
+		/*
+		 * the frm_buf and bs_buf need to be recorded into ctx,
+		 * when encoding done, the target buffer can be obtained
+		 */
+		ctx->pfrm_buf[ctx->hw_id] = frm_buf->src_addr;
+		ctx->pbs_buf[ctx->hw_id] = bs_buf->buf;
+
 		if (!inst->prepend_hdr) {
 			ret = venc_encode_frame(inst, frm_buf, bs_buf,
 						&result->bs_size, ctx->hw_id);
@@ -528,6 +535,8 @@ static int venc_encode(void *handle,
 
 		result->bs_size = hdr_sz + filler_sz + bs_size_frm;
 
+		ctx->hdr_size = hdr_sz + filler_sz;
+
 		mtk_vcodec_debug(inst, "hdr %d filler %d frame %d bs %d",
 				 hdr_sz, filler_sz, bs_size_frm,
 				 result->bs_size);
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
index 7bd1f437d8e3..50824e718c91 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
@@ -108,9 +108,11 @@ struct venc_frame_info {
 /*
  * struct venc_frm_buf - frame buffer information used in venc_if_encode()
  * @fb_addr: plane frame buffer addresses
+ * @src_addr: vb2_v4l2_buffer src buffer address
  */
 struct venc_frm_buf {
 	struct mtk_vcodec_fb fb_addr[MTK_VCODEC_MAX_PLANES];
+	void *src_addr;
 };
 
 /*
-- 
2.25.1

