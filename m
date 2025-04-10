Return-Path: <linux-media+bounces-29948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5BA84835
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E621B88077
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4D51EFF8A;
	Thu, 10 Apr 2025 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fDZbgc4g"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3601EE7DD;
	Thu, 10 Apr 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299614; cv=none; b=JJwdnya1+euOXPje2H8j5h7/ae0WDmemHs0bFJ6yGlJrfF2tTgTpXjeoAWnfMdkNxPgvmsObG/0Gkzh6+xyiN4RWp8koQyY4mPFQK4oVUj8XGUIkQaKw+g8tkKTCftzV/w3j0yFIevlvrqxoSEVF2UXiZ1NzWlBFzjbs+wD2oUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299614; c=relaxed/simple;
	bh=/kh71vXyWS1J4QBnTfnSoyZtnqhp5VeJWuGXoLT4hqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnfJfae6QSuWuvKdLD4Jn9+Y2QV5pouRmogHZfjbcwmah6w/CovJG9Lg7F+Q3FY7t/fxej/BkdWFQxtyq8e9d5KhJbe40VFoNSFtHNqCp0NHUvYd6hXsHhxpNtTevTKuY8snboEt3cqGiYfe571whwyTlH49Amq/3Gtx9jikfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fDZbgc4g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744299610;
	bh=/kh71vXyWS1J4QBnTfnSoyZtnqhp5VeJWuGXoLT4hqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fDZbgc4ggGltYh02kVVNfE5HuYL4uHHRU74GRIim79FctgJNotvgMd/+uyf8yw2eK
	 mKHaxBSP9M/Mg68PQZ6vMPlasw+rv/R5HjzjS/+kXUOQArZSRUWB8nvXw2HzpzwWjZ
	 ioNyMbaLOxOYRJC10wRVQvl7FEiFXiIudKBMgy/wCEyqa3zavL3E5wex2JNbH1Hepn
	 bR156Coc7SXu30BLzJdMSuIvlqrZKFUV0uuWDWeinzt+U9vZRxEXZ2jmq1FYyo57FN
	 jLyf+A5s/AzV21NL5oXNfubYTgd69P5Jaic2QScTtsg4Vgs1vCuL+jIXfGMlJrDRJ6
	 hvwFFFfp4l4Ew==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9630B17E03B6;
	Thu, 10 Apr 2025 17:40:08 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 10 Apr 2025 11:39:59 -0400
Subject: [PATCH v2 4/5] media: vcodec: Implement manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-4-5b99ec0450e6@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

From: Sebastian Fricke <sebastian.fricke@collabora.com>

Rework how requests are completed in the MediaTek VCodec driver, by
implementing the new manual request completion feature, which allows to
keep a request open while allowing to add new bitstream data.
This is useful in this case, because the hardware has a LAT and a core
decode work, after the LAT decode the bitstream isn't required anymore
so the source buffer can be set done and the request stays open until
the core decode work finishes.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 +++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 50 +++++++++++++++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 19 +++++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 63 +++++++++++++---------
 5 files changed, 124 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..c5fd37cb60ca0cc5fd09c9243b36fbc716c56454 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
@@ -105,6 +105,19 @@ enum mtk_instance_state {
 	MTK_STATE_ABORT = 4,
 };
 
+/**
+ * enum mtk_request_state - Stages of processing a request
+ * @MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
+ * @MTK_REQUEST_LAT_DONE: LAT decode finished, the bitstream is not
+ *		      needed anymore
+ * @MTK_REQUEST_CORE_DONE: CORE decode finished
+ */
+enum mtk_request_state {
+	MTK_REQUEST_RECEIVED = 0,
+	MTK_REQUEST_LAT_DONE = 1,
+	MTK_REQUEST_CORE_DONE = 2,
+};
+
 enum mtk_fmt_type {
 	MTK_FMT_DEC = 0,
 	MTK_FMT_ENC = 1,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce25d6a089292f1e57 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 					src_buf->vb2_buf.req_obj.req;
 				v4l2_m2m_buf_done(src_buf,
 						VB2_BUF_STATE_ERROR);
-				if (req)
+				if (req) {
 					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+					media_request_manual_complete(req);
+				}
 			}
 		}
 		return;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 9247d92d431d8570609423156b989878f7901f1c..c80c1db509eaadd449bfd183c5eb9db0a1fc22bd 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -26,6 +26,56 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "../common/mtk_vcodec_intr.h"
 
+static const char *state_to_str(enum mtk_request_state state)
+{
+	switch (state) {
+	case MTK_REQUEST_RECEIVED:
+		return "RECEIVED";
+	case MTK_REQUEST_LAT_DONE:
+		return "LAT_DONE";
+	case MTK_REQUEST_CORE_DONE:
+		return "CORE_DONE";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+void mtk_request_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,
+			  enum vb2_buffer_state buffer_state, struct media_request *src_buf_req)
+{
+	struct mtk_request *req = req_to_mtk_req(src_buf_req);
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	mutex_lock(&ctx->lock);
+
+	if (req->req_state >= state) {
+		mutex_unlock(&ctx->lock);
+		return;
+	}
+
+	switch (req->req_state) {
+	case MTK_REQUEST_RECEIVED:
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, buffer_state);
+		if (state == MTK_REQUEST_LAT_DONE)
+			break;
+		fallthrough;
+	case MTK_REQUEST_LAT_DONE:
+		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(dst_buf, buffer_state);
+		media_request_manual_complete(src_buf_req);
+		break;
+	default:
+		break;
+	}
+
+	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
+			  state_to_str(req->req_state), state_to_str(state));
+	req->req_state = state;
+	mutex_unlock(&ctx->lock);
+}
+
 static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_dec_dev *dev)
 {
 	switch (dev->vdec_pdata->hw_arch) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..cd61bf46de6918c27ed39ba64162e5f2637f93b2 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -126,6 +126,17 @@ struct mtk_vcodec_dec_pdata {
 	bool uses_stateless_api;
 };
 
+/**
+ * struct mtk_request - Media request private data.
+ *
+ * @req_state: Request completion state
+ * @req: Media Request structure
+ */
+struct mtk_request {
+	enum mtk_request_state req_state;
+	struct media_request req;
+};
+
 /**
  * struct mtk_vcodec_dec_ctx - Context (instance) private data.
  *
@@ -317,6 +328,11 @@ static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
 }
 
+static inline struct mtk_request *req_to_mtk_req(struct media_request *req)
+{
+	return container_of(req, struct mtk_request, req);
+}
+
 /* Wake up context wait_queue */
 static inline void
 wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned int hw_id)
@@ -326,6 +342,9 @@ wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned in
 	wake_up_interruptible(&ctx->queue[hw_id]);
 }
 
+void mtk_request_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,
+			  enum vb2_buffer_state buffer_state, struct media_request *src_buf_req);
+
 #define mtk_vdec_err(ctx, fmt, args...)                               \
 	mtk_vcodec_err((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index afa224da0f4165cf5701d6861f1f787c6317bfe4..1b08f95ba04ee137b46d61d866b030857f439429 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -247,7 +247,6 @@ static const struct v4l2_frmsize_stepwise stepwise_fhd = {
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
 					   struct media_request *src_buf_req)
 {
-	struct vb2_v4l2_buffer *vb2_dst;
 	enum vb2_buffer_state state;
 
 	if (error)
@@ -255,17 +254,7 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
 	else
 		state = VB2_BUF_STATE_DONE;
 
-	vb2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
-	if (vb2_dst) {
-		v4l2_m2m_buf_done(vb2_dst, state);
-		mtk_v4l2_vdec_dbg(2, ctx, "free frame buffer id:%d to done list",
-				  vb2_dst->vb2_buf.index);
-	} else {
-		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
-	}
-
-	if (src_buf_req)
-		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	mtk_request_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -308,6 +297,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 static void mtk_vdec_worker(struct work_struct *work)
@@ -359,11 +349,12 @@ static void mtk_vdec_worker(struct work_struct *work)
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
+
 	if (ret && ret != -EAGAIN) {
 		mtk_v4l2_vdec_err(ctx,
-				  "[%d] decode src_buf[%d] sz=0x%zx pts=%llu ret=%d res_chg=%d",
+				  "[%d] decode src_buf[%d] sz=0x%zx pts=%llu res_chg=%d ret=%d",
 				  ctx->id, vb2_src->index, bs_src->size,
-				  vb2_src->timestamp, ret, res_chg);
+				  vb2_src->timestamp, res_chg, ret);
 		if (ret == -EIO) {
 			mutex_lock(&ctx->lock);
 			dec_buf_src->error = true;
@@ -372,18 +363,15 @@ static void mtk_vdec_worker(struct work_struct *work)
 	}
 
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
+	if (ret != -EAGAIN)
+		mtk_request_complete(ctx, MTK_REQUEST_LAT_DONE, state, src_buf_req);
+
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-	} else {
-		if (ret != -EAGAIN) {
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-			v4l2_m2m_buf_done(vb2_v4l2_src, state);
-		}
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_request_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
 	}
+
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -711,6 +699,22 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
 	return 0;
 }
 
+static struct media_request *fops_media_request_alloc(struct media_device *mdev)
+{
+	struct mtk_request *req;
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+
+	return &req->req;
+}
+
+static void fops_media_request_free(struct media_request *mreq)
+{
+	struct mtk_request *req = req_to_mtk_req(mreq);
+
+	kfree(req);
+}
+
 static int fops_media_request_validate(struct media_request *mreq)
 {
 	const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
@@ -731,9 +735,20 @@ static int fops_media_request_validate(struct media_request *mreq)
 	return vb2_request_validate(mreq);
 }
 
+static void fops_media_request_queue(struct media_request *mreq)
+{
+	struct mtk_request *req = req_to_mtk_req(mreq);
+
+	media_request_mark_manual_completion(mreq);
+	req->req_state = MTK_REQUEST_RECEIVED;
+	v4l2_m2m_request_queue(mreq);
+}
+
 const struct media_device_ops mtk_vcodec_media_ops = {
+	.req_alloc      = fops_media_request_alloc,
+	.req_free      = fops_media_request_free,
 	.req_validate	= fops_media_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= fops_media_request_queue,
 };
 
 static void mtk_vcodec_add_formats(unsigned int fourcc,

-- 
2.49.0


