Return-Path: <linux-media+bounces-24559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D416A084D3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 02:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96EFC16874B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 01:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AE0206F0C;
	Fri, 10 Jan 2025 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eb42KeqP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4B2054F9;
	Fri, 10 Jan 2025 01:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472487; cv=none; b=UwZZqRDHah3mApS8s77giO8k4meaL7WjoKQsqm+eRHNaRUgSWmB+Y9VNZyjRtZhHrsBE8YxwIWtwdga7vFVH3rgJ40V1bkBybWOTdv9M5zWw11rzczk/rdy0ONlDrH2zMyaAKWokjdKviYQo47kBgiPNyC7qSLNltPC3wmJXFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472487; c=relaxed/simple;
	bh=Evk9Se4gltGambWc0Qxp3rkd24nA4RcjjPilGcnWi5c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H3kYJPZMXOzV0E6v5luXn6erP84AMYqGUsakCKGt6Y86KXrMct/aN+RCi79QF7/7nxPXxajMv1XzZsVDj+u7Lzru0/1p7jYTaJxfmMIMT6dmDLK1DpFdhmnQT5PrzcJCbZAc+a69J4F712kKW6T2yiHAomEjapssMfpvACk0cqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eb42KeqP; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 217384b6cef211ef99858b75a2457dd9-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U3EmKoOLfWO6bwM8Ao8oeNftd+PKpKu75wI5YWa6tL8=;
	b=eb42KeqPYU1DvRhqC+td2uBSAuzXV8rEtYgpkN8HA1tckzLHSoTRtzAFY0S6FpBQjLiW7jRUdUIIBMjS5QbOVgnUgiv0AlpISyJhOaChybrWbh4VZ9I8f2dtUBLpbqDcc3iZKFD3Y9kVtr7xGuAd8GoowPLAhkvN8IOR0lsuS8g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9b9276dc-1b0c-495e-aa02-159b358bec56,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:b8cda637-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 217384b6cef211ef99858b75a2457dd9-20250110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 821120176; Fri, 10 Jan 2025 09:28:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:59 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,08/12] media: mediatek: jpeg: fix stop streaming flow for multi-core
Date: Fri, 10 Jan 2025 09:27:45 +0800
Message-ID: <20250110012749.30072-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

1. For multi-core jpegdec, the all hws may run at the same time,
if one hw decoded firstly, the function of mtk_jpeg_dec_stop_streaming
would be called, but others input buffers are decoding, this will
cause some running buffers to be buffer done, causing errors;
2. add a parameter to calculate the decoding buffer counts, it
wil decrease to 0 until the all buffers decoded and the
mtk_jpeg_dec_stop_streaming could continue to be executed.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c | 16 ++++++++++++++++
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.h |  2 ++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c     | 12 ++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c     | 11 ++++++++++-
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 3082d0fcf974..9556accacfa0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -856,8 +856,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
+	if (jpeg->variant->multi_core)
+		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) == 0));
+
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
@@ -865,6 +869,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
 	/*
@@ -872,6 +877,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 	 * Before STREAMOFF, we still have to return the old resolution and
 	 * subsampling. Update capture queue when the stream is off.
 	 */
+	if (jpeg->variant->multi_core)
+		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) == 0));
+
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
 	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
@@ -1181,6 +1189,7 @@ static int mtk_jpeg_open(struct file *file)
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
+	atomic_set(&ctx->buf_list_cnt, 0);
 
 	ctx->jpeg = jpeg;
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
@@ -1563,6 +1572,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
+static void jpeg_buf_queue_inc(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_inc(&ctx->buf_list_cnt);
+}
+
 static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 {
 	struct mtk_jpeg_ctx *ctx;
@@ -1674,6 +1688,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 			     &src_buf->vb2_buf);
 	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
+	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
@@ -1792,6 +1807,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				&bs,
 				&fb);
 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
+	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index ce9f14e711f5..ce884c190ce5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -299,6 +299,7 @@ struct mtk_jpeg_q_data {
  * @dst_done_queue:		encoded frame buffer queue
  * @done_queue_lock:		encoded frame operation spinlock
  * @last_done_frame_num:	the last encoded frame number
+ * @buf_list_cnt:		the frame buffer count own by jpeg driver
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -317,6 +318,7 @@ struct mtk_jpeg_ctx {
 	/* spinlock protecting the encode done buffer */
 	spinlock_t done_queue_lock;
 	u32 last_done_frame_num;
+	atomic_t buf_list_cnt;
 };
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 3adbdb8e2d96..f918910bf538 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -550,6 +550,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
 	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
 }
 
+static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_dec(&ctx->buf_list_cnt);
+}
+
 static void mtk_jpegdec_timeout_work(struct work_struct *work)
 {
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
@@ -558,9 +563,11 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 			     job_timeout_work.work);
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
+	ctx = cjpeg->hw_param.curr_ctx;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
@@ -571,6 +578,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
+	jpeg_buf_queue_dec(ctx);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -578,12 +586,14 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	enum vb2_buffer_state buf_state;
+	struct mtk_jpeg_ctx *ctx;
 	u32 dec_irq_ret;
 	u32 irq_status;
 	int i;
 
 	struct mtk_jpegdec_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
+	ctx = jpeg->hw_param.curr_ctx;
 
 	cancel_delayed_work(&jpeg->job_timeout_work);
 
@@ -609,6 +619,8 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
+	jpeg_buf_queue_dec(ctx);
+
 	pm_runtime_put(jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index d8ebb4d34a86..00c6e1a5796e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -290,6 +290,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
 	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
 }
 
+static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_dec(&ctx->buf_list_cnt);
+}
+
 static void mtk_jpegenc_timeout_work(struct work_struct *work)
 {
 	struct delayed_work *dly_work = to_delayed_work(work);
@@ -300,9 +305,11 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
+	ctx = cjpeg->hw_param.curr_ctx;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
@@ -313,6 +320,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
+	jpeg_buf_queue_dec(ctx);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -346,7 +354,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
-	pm_runtime_put(ctx->jpeg->dev);
+	jpeg_buf_queue_dec(ctx);
+	pm_runtime_put(jpeg->dev);
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
-- 
2.46.0


