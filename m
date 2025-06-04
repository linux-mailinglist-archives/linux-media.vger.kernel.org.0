Return-Path: <linux-media+bounces-34074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED90ACE591
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 22:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3169179CCA
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 20:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167182309B9;
	Wed,  4 Jun 2025 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Jr8JvoE4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D82221DBD;
	Wed,  4 Jun 2025 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067810; cv=none; b=lAkXfvRHy/itZa9Xrc/6l6Jwh7/UPA4J2ms7Ks6FS01S9foqMQZMoH2kRpSmI0u5ysAf5fhT9ULaPH3jqTfxWrNQLLV2tp2AzW2McTq53ixnXQ4b3eZNAX98IP6C/l+HbznwCEMxNZH9WqAoiGYIymgy3Mq8InaG5yMBzdnSkEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067810; c=relaxed/simple;
	bh=4sGxas2P+my+BbRd+bOFWMBu0iKNppblQO7l3Z/Y3+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmFUWv2TtAsh7nV7dAQnOgPZCkFTWYid8EnBfrXTbjtqi78hLHiL1gVBvdwGubZnUVb5P/JZ4QQLWYIAhwtDq7zctnTdDaTyJCpDa4C5Ziy7b/MFRT1fz4r5WryB48BqbrqFRY5PDDaOSrpAwg0CoREw1PRv4ic9cUB/tN/PAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Jr8JvoE4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749067806;
	bh=4sGxas2P+my+BbRd+bOFWMBu0iKNppblQO7l3Z/Y3+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jr8JvoE4wZCTdgW81NBJnkbsM9smtAdTBRKS9IbhHHGJ8Iu9JFKkGT/SdBmakIVcJ
	 7Hl4lVSa9wrcW66hgV1tmCAY++DLVoFfCWCfZBeUar+7KBSJrwO3yxkiFJOcwWf22Y
	 UXL7tCdDeW2NEfMz2RNhr75Cp6FgqhXnPJxNtiWI7Sjf+R64S+8kMMHN29COe/Djc4
	 lSRCIqRd4rvm2LfkbugaEjXOttNclykvBP6dHykmoYUu0U16BusJKuGJ7238TCj1iD
	 nLypdN4i3bXouzxZ4jTkCA4lFRePzSQg9Do3v6087uqI/i1F69vtrB04cd6kr34Ksz
	 vCRn5BeqtSVwQ==
Received: from [192.168.13.145] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2690117E3730;
	Wed,  4 Jun 2025 22:10:04 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 04 Jun 2025 16:09:38 -0400
Subject: [PATCH v3 4/5] media: vcodec: Implement manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
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
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |   4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  29 +++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 140 ++++++++++++++++-----
 3 files changed, 140 insertions(+), 33 deletions(-)

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
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index aececca7ecf8936bb2b3b55c99354af983746b30..6f9728a95720a257dee9201463c5e275d0586a94 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -64,6 +64,19 @@ enum mtk_vdec_hw_arch {
 	MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+/**
+ * enum mtk_vdec_request_state - Stages of processing a request
+ * @MTK_VDEC_REQUEST_RECEIVED: Hardware prepared for the LAT decode
+ * @MTK_VDEC_REQUEST_LAT_DONE: LAT decode finished, the bitstream is not
+ *		      needed anymore
+ * @MTK_VDEC_REQUEST_CORE_DONE: CORE decode finished
+ */
+enum mtk_vdec_request_state {
+	MTK_VDEC_REQUEST_RECEIVED = 0,
+	MTK_VDEC_REQUEST_LAT_DONE = 1,
+	MTK_VDEC_REQUEST_CORE_DONE = 2,
+};
+
 /**
  * struct vdec_pic_info  - picture size information
  * @pic_w: picture width
@@ -128,6 +141,17 @@ struct mtk_vcodec_dec_pdata {
 	bool uses_stateless_api;
 };
 
+/**
+ * struct mtk_vcodec_dec_request - Media request private data.
+ *
+ * @req_state: Request completion state
+ * @req: Media Request structure
+ */
+struct mtk_vcodec_dec_request {
+	enum mtk_vdec_request_state req_state;
+	struct media_request req;
+};
+
 /**
  * struct mtk_vcodec_dec_ctx - Context (instance) private data.
  *
@@ -319,6 +343,11 @@ static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
 }
 
+static inline struct mtk_vcodec_dec_request *req_to_dec_req(struct media_request *req)
+{
+	return container_of(req, struct mtk_vcodec_dec_request, req);
+}
+
 /* Wake up context wait_queue */
 static inline void
 wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned int hw_id)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d873159b9b3069fe3460502c2751f2e8b2714f44..eea0050eacc1c41abd8e0a1cd546c1ecce90a311 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -242,10 +242,61 @@ static const struct v4l2_frmsize_stepwise stepwise_fhd = {
 	.step_height = 16
 };
 
+static const char *state_to_str(enum mtk_vdec_request_state state)
+{
+	switch (state) {
+	case MTK_VDEC_REQUEST_RECEIVED:
+		return "RECEIVED";
+	case MTK_VDEC_REQUEST_LAT_DONE:
+		return "LAT_DONE";
+	case MTK_VDEC_REQUEST_CORE_DONE:
+		return "CORE_DONE";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static void mtk_vcodec_dec_request_complete(struct mtk_vcodec_dec_ctx *ctx,
+					    enum mtk_vdec_request_state state,
+					    enum vb2_buffer_state buffer_state,
+					    struct media_request *src_buf_req)
+{
+	struct mtk_vcodec_dec_request *req = req_to_dec_req(src_buf_req);
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
+	case MTK_VDEC_REQUEST_RECEIVED:
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, buffer_state);
+		if (state == MTK_VDEC_REQUEST_LAT_DONE)
+			break;
+		fallthrough;
+	case MTK_VDEC_REQUEST_LAT_DONE:
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
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
 					   struct media_request *src_buf_req)
 {
-	struct vb2_v4l2_buffer *vb2_dst;
 	enum vb2_buffer_state state;
 
 	if (error)
@@ -253,17 +304,7 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
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
+	mtk_vcodec_dec_request_complete(ctx, MTK_VDEC_REQUEST_CORE_DONE, state, src_buf_req);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -306,6 +347,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 static void mtk_vdec_worker(struct work_struct *work)
@@ -318,7 +360,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
 	struct media_request *src_buf_req;
-	enum vb2_buffer_state state;
+	enum mtk_vdec_request_state req_state;
+	enum vb2_buffer_state buf_state;
 	bool res_chg = false;
 	int ret;
 
@@ -351,37 +394,43 @@ static void mtk_vdec_worker(struct work_struct *work)
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
 	src_buf_req = vb2_src->req_obj.req;
-	if (src_buf_req)
-		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
-	else
+	if (WARN_ON(!src_buf_req)) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+	v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
-	if (ret && ret != -EAGAIN) {
+
+	if (ret == -EAGAIN) {
+		buf_state = VB2_BUF_STATE_DONE;
+		req_state = MTK_VDEC_REQUEST_RECEIVED;
+	} else if (ret) {
 		mtk_v4l2_vdec_err(ctx,
-				  "[%d] decode src_buf[%d] sz=0x%zx pts=%llu ret=%d res_chg=%d",
+				  "[%d] decode src_buf[%d] sz=0x%zx pts=%llu res_chg=%d ret=%d",
 				  ctx->id, vb2_src->index, bs_src->size,
-				  vb2_src->timestamp, ret, res_chg);
+				  vb2_src->timestamp, res_chg, ret);
 		if (ret == -EIO) {
 			mutex_lock(&ctx->lock);
 			dec_buf_src->error = true;
 			mutex_unlock(&ctx->lock);
 		}
-	}
 
-	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
-	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
-	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		buf_state = VB2_BUF_STATE_ERROR;
+		req_state = MTK_VDEC_REQUEST_CORE_DONE;
 	} else {
-		if (ret != -EAGAIN) {
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-			v4l2_m2m_buf_done(vb2_v4l2_src, state);
-		}
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		buf_state = VB2_BUF_STATE_DONE;
+
+		if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
+		    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME)
+			req_state = MTK_VDEC_REQUEST_CORE_DONE;
+		else
+			req_state = MTK_VDEC_REQUEST_LAT_DONE;
 	}
+
+	mtk_vcodec_dec_request_complete(ctx, req_state, buf_state, src_buf_req);
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -709,6 +758,22 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
 	return 0;
 }
 
+static struct media_request *fops_media_request_alloc(struct media_device *mdev)
+{
+	struct mtk_vcodec_dec_request *req;
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+
+	return &req->req;
+}
+
+static void fops_media_request_free(struct media_request *mreq)
+{
+	struct mtk_vcodec_dec_request *req = req_to_dec_req(mreq);
+
+	kfree(req);
+}
+
 static int fops_media_request_validate(struct media_request *mreq)
 {
 	const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
@@ -729,9 +794,20 @@ static int fops_media_request_validate(struct media_request *mreq)
 	return vb2_request_validate(mreq);
 }
 
+static void fops_media_request_queue(struct media_request *mreq)
+{
+	struct mtk_vcodec_dec_request *req = req_to_dec_req(mreq);
+
+	media_request_mark_manual_completion(mreq);
+	req->req_state = MTK_VDEC_REQUEST_RECEIVED;
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


