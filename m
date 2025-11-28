Return-Path: <linux-media+bounces-47873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF96C93002
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E89A34D44C
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 19:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E65333423;
	Fri, 28 Nov 2025 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R1Sb3TAD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADBE32C924;
	Fri, 28 Nov 2025 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357425; cv=none; b=H4YCwZDTMUxQjQeR5VBq1W1q0gWKyDP3vaqoP4eVMEqjUnCwSfXcNoLTmo1jXX0hVzrdI2WY7GJw94x7LxHI+AQZ5gmKxPNVMITlL5FMas4KNu88bHRmk3JayuJHXrd6cJpYGuMExpoo85W/S3Cuw1lhwAwy9E2sA7R+hjYSdCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357425; c=relaxed/simple;
	bh=h0zdMhLMXP6r7EfNzAuuQY3sRgsGJ1+2eKIZqTitznQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffPRXhQoMBfRqsXHKSHSH+Xx+BG5l/vEcCSg0RkDfrfaMWPsDwb0jUjvOWYgizH63yxfy0/6e+T9LpmeoyhfebvgpggufqoAzCSbxwoLLbx6WxydiHSmTmHJtxPiz/TRatuTaWUiaCVdyFRHMhnSP/ps936UWs9G+nZrl63azrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R1Sb3TAD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764357421;
	bh=h0zdMhLMXP6r7EfNzAuuQY3sRgsGJ1+2eKIZqTitznQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R1Sb3TADSOa8OgZQ3687muQl1/Gn5SQbhs7s6tFJwys8/goAkq7gM8Uhe6MD+g2Mh
	 uLObBxE0vIeOBp7qfDPNiBITe6yRDpdEmvDa7hE52ybx/ESZH2Izc7nki0jB1Oflbu
	 uOD5CL2DqAS2G/J+Q4l5nNB+1CYX0kTWMNoMq/RiPWjsurq53e1AGC9EC1GzcYMYxF
	 qtAZp+3HOOyTaPLinYMgN6dpNtLgW2habkWt/XElle8N8EvhTV3J+zRCzAlFC9aeGN
	 69I4SC1MErSB84EfRK21sNpTEhicnjcJhlGsNhbUSmOa4QDy9MUW/cRNCmSONlVC5D
	 jqmieGaoDM7qQ==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:7b4b::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C294817E13ED;
	Fri, 28 Nov 2025 20:16:59 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Fri, 28 Nov 2025 14:16:15 -0500
Subject: [PATCH v4 4/5] media: vcodec: Implement manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-4-c166bdd4625c@collabora.com>
References: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
In-Reply-To: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
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
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  17 ++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 109 ++++++++++++++-------
 3 files changed, 96 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 1f32ba11a18c070d825e850d0c5ed07c625e5cf2..d76e891f784b9a6d99692177ab9d38c898eb4666 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,8 +882,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
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
index 9d68808e8f9c3cb3ceb5b473592691ac84d3f288..c9d27534c63ec902c3f1c86d14f22089c0c1926e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -7,6 +7,8 @@
 #ifndef _MTK_VCODEC_DEC_DRV_H_
 #define _MTK_VCODEC_DEC_DRV_H_
 
+#include <linux/kref.h>
+
 #include "../common/mtk_vcodec_cmn_drv.h"
 #include "../common/mtk_vcodec_dbgfs.h"
 #include "../common/mtk_vcodec_fw_priv.h"
@@ -128,6 +130,16 @@ struct mtk_vcodec_dec_pdata {
 	bool uses_stateless_api;
 };
 
+/**
+ * struct mtk_vcodec_dec_request - Media request private data.
+ * @refcount: Used to ensure we don't complete the request too soon
+ * @req: Media Request structure
+ */
+struct mtk_vcodec_dec_request {
+	struct kref refcount;
+	struct media_request req;
+};
+
 /**
  * struct mtk_vcodec_dec_ctx - Context (instance) private data.
  *
@@ -324,6 +336,11 @@ static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
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
index d873159b9b3069fe3460502c2751f2e8b2714f44..6598a9e160b7a5a952c118e873a893e21e2f71e7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -242,10 +242,18 @@ static const struct v4l2_frmsize_stepwise stepwise_fhd = {
 	.step_height = 16
 };
 
+static void mtk_vcodec_dec_request_release(struct kref *ref)
+{
+	struct mtk_vcodec_dec_request *req =
+		container_of(ref, struct mtk_vcodec_dec_request, refcount);
+	media_request_manual_complete(&req->req);
+}
+
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
-					   struct media_request *src_buf_req)
+					   struct media_request *mreq)
 {
-	struct vb2_v4l2_buffer *vb2_dst;
+	struct mtk_vcodec_dec_request *req = req_to_dec_req(mreq);
+	struct vb2_v4l2_buffer *dst_buf;
 	enum vb2_buffer_state state;
 
 	if (error)
@@ -253,17 +261,9 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
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
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+	v4l2_m2m_buf_done(dst_buf, state);
+	kref_put(&req->refcount, mtk_vcodec_dec_request_release);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -306,6 +306,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 static void mtk_vdec_worker(struct work_struct *work)
@@ -317,8 +318,9 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
-	struct media_request *src_buf_req;
-	enum vb2_buffer_state state;
+	struct media_request *mreq;
+	struct mtk_vcodec_dec_request *req;
+	enum vb2_buffer_state buf_state;
 	bool res_chg = false;
 	int ret;
 
@@ -350,14 +352,26 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
-	src_buf_req = vb2_src->req_obj.req;
-	if (src_buf_req)
-		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
-	else
+	mreq = vb2_src->req_obj.req;
+	if (WARN_ON(!mreq)) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+
+	v4l2_ctrl_request_setup(mreq, &ctx->ctrl_hdl);
+
+	/* Keep a reference so that if the processing completes before this function
+	 * ends, we won't accidently update a freshly queued request.
+	 */
+	req = req_to_dec_req(mreq);
+	kref_get(&req->refcount);
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
-	if (ret && ret != -EAGAIN) {
+	if (ret == -EAGAIN)
+		goto done;
+
+	if (ret) {
 		mtk_v4l2_vdec_err(ctx,
 				  "[%d] decode src_buf[%d] sz=0x%zx pts=%llu ret=%d res_chg=%d",
 				  ctx->id, vb2_src->index, bs_src->size,
@@ -367,21 +381,23 @@ static void mtk_vdec_worker(struct work_struct *work)
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
 	} else {
-		if (ret != -EAGAIN) {
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-			v4l2_m2m_buf_done(vb2_v4l2_src, state);
-		}
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		buf_state = VB2_BUF_STATE_DONE;
 	}
+
+	v4l2_ctrl_request_complete(mreq, &ctx->ctrl_hdl);
+	v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+	v4l2_m2m_buf_done(vb2_v4l2_src, buf_state);
+
+	if (ret || !IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
+	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME)
+		mtk_vdec_stateless_cap_to_disp(ctx, ret, mreq);
+
+done:
+	kref_put(&req->refcount, mtk_vcodec_dec_request_release);
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -709,6 +725,22 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
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
@@ -729,9 +761,20 @@ static int fops_media_request_validate(struct media_request *mreq)
 	return vb2_request_validate(mreq);
 }
 
+static void fops_media_request_queue(struct media_request *mreq)
+{
+	struct mtk_vcodec_dec_request *req = req_to_dec_req(mreq);
+
+	media_request_mark_manual_completion(mreq);
+	kref_init(&req->refcount);
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
2.51.0


