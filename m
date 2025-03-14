Return-Path: <linux-media+bounces-28227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FDA6129C
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AB617A6A7E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C96201017;
	Fri, 14 Mar 2025 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Wrjx3lU2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC91FF7DE;
	Fri, 14 Mar 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958853; cv=pass; b=Nm2hc2443+OMZCgWQuwSvG/GgabZR6wnwx7psldDopDIRZ0oOjTyJWughCxPlNQFXAHNHecGpgLxc4nhWXaodHvNpj3703lj2w7zeCbxwWUucZrANGmWlIQbBBGhng0VRrY8vQWCn9N/4mRq2c47loL/krZtUN7qihF5VjzEx3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958853; c=relaxed/simple;
	bh=49IRp4qINEWgdCFKaoU9py89jwvFRkP6xuW8xZsZ+Lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpR18SiGSIUWC4o/Oj8Lt8H6AiynyR9ER0ZwQ6M4Xq88iMoPRrlVdFJI48sGpZpu57n4EDd3HMR5QAaw8EnmNF+iCwPxS37APa4JJbcFVTUtBflrT1nHtmpYcep9YWa/ArsIr9drBWoRLKl4favL+5Xr0n2K9KERp9LY9ETh/fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Wrjx3lU2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741958826; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KNlrIGLgZXif8X/RDiHS4ZJxK4/bH1vkN0eF3QFgjd5bNqNr3Zr7zhJ5VGhfuA99LFCP+or/zCTbmUoFJe5PNI+u3UsO8qvj39GPw16/FsWxwWIEeuBQKUoxbvKmUJ3SLrrfTtE4PexMzdYT16vSdFKCkFtGopOzLl//8o8xZiQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741958826; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DkLkmHVXAPwesD88730WIjN61344npAlgzyKDIEb8iw=; 
	b=IjGhk9sCFdY8ldltxF+yzTLVJh8XDn18AYS7AkAvjxxb1CiRQsmKCuc+flH06OODstyPdX2ZkqXuayoFhL9xwHreOtIqu4IIvdHGK/td8UVR/hnRRdjr+iXf6nTffx09knE1FjXy8mLhMCI1/aEBsi0qxqgs0HEDLzzWDXxmdn8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741958826;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DkLkmHVXAPwesD88730WIjN61344npAlgzyKDIEb8iw=;
	b=Wrjx3lU2XKEaU2hy+iKsjLq0hG80ZXL3SeLjFF4Spn+UjgupRQi3VrgVfTXUwn0X
	vS5rc2amYSVBwZP119K4yExYxjyBXcqvp2XbfUSnpWXIFvJUsch44NbPKuazJBVbehe
	U7qrcvIxx+05vpcMSgVex/TyxWe2IxsVYZm8mhHQ=
Received: by mx.zohomail.com with SMTPS id 1741958825346474.16390275865274;
	Fri, 14 Mar 2025 06:27:05 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Fri, 14 Mar 2025 14:26:29 +0100
Subject: [PATCH 4/5] media: vcodec: Implement manual request completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741958789; l=9678;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=49IRp4qINEWgdCFKaoU9py89jwvFRkP6xuW8xZsZ+Lk=;
 b=8EakE9LW8OjUw0KCyJvVHYLnY19r58LI3I/NHK1TDOcDqV1zPlr/xnOiehWAGkH3IdLW9HQ2C
 yUHW9OEeRfAAMCiN4SsMsqBHAAhQC4gT5+EXlSAzQJXerR/pq2jbzhB
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

Rework how requests are completed in the MediaTek VCodec driver, by
implementing the new manual request completion feature, which allows to
keep a request open while allowing to add new bitstream data.
This is useful in this case, because the hardware has a LAT and a core
decode work, after the LAT decode the bitstream isn't required anymore
so the source buffer can be set done and the request stays open until
the core decode work finishes.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 ++++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 52 ++++++++++++++++++++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  4 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 46 +++++++++----------
 5 files changed, 94 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..81ec5beecfaed239ed70bee3460aae27e476231c 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
@@ -105,6 +105,19 @@ enum mtk_instance_state {
 	MTK_STATE_ABORT = 4,
 };
 
+/**
+ * enum mtk_request_state - Stages of processing a request
+ * MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
+ * MTK_REQUEST_DONE_WITH_BITSTREAM: LAT decode finished, the bitstream is not
+ *				    needed anymore
+ * MTK_REQUEST_COMPLETE: CORE decode finished
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
index 9247d92d431d8570609423156b989878f7901f1c..d9c7aaec0c4515cb73b80c913b1ad5b08392dd18 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -26,6 +26,58 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "../common/mtk_vcodec_intr.h"
 
+const char *state_to_str(enum mtk_request_state state)
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
+int mtk_vcodec_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,
+			enum vb2_buffer_state buffer_state, struct media_request *src_buf_req)
+{
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	mutex_lock(&ctx->lock);
+
+	if (ctx->req_state >= state) {
+		mutex_unlock(&ctx->lock);
+		return -EINVAL;
+	}
+
+	switch (ctx->req_state) {
+	case MTK_REQUEST_RECEIVED:
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, buffer_state);
+		ctx->req_state = MTK_REQUEST_LAT_DONE;
+		if (state == MTK_REQUEST_LAT_DONE)
+			break;
+		fallthrough;
+	case MTK_REQUEST_LAT_DONE:
+		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(dst_buf, buffer_state);
+		media_request_manual_complete(src_buf_req);
+		ctx->req_state = MTK_REQUEST_CORE_DONE;
+		break;
+	default:
+		break;
+	}
+
+	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
+			  state_to_str(ctx->req_state), state_to_str(state));
+	ctx->req_state = state;
+	mutex_unlock(&ctx->lock);
+	return 0;
+}
+
 static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_dec_dev *dev)
 {
 	switch (dev->vdec_pdata->hw_arch) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..21c2301363d0151ba3cf384a2a32fff9f5d46034 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -185,6 +185,7 @@ struct mtk_vcodec_dec_ctx {
 	struct mtk_q_data q_data[2];
 	int id;
 	enum mtk_instance_state state;
+	enum mtk_request_state req_state;
 
 	const struct vdec_common_if *dec_if;
 	void *drv_handle;
@@ -326,6 +327,9 @@ wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned in
 	wake_up_interruptible(&ctx->queue[hw_id]);
 }
 
+int mtk_vcodec_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,
+			enum vb2_buffer_state buffer_state, struct media_request *src_buf_req);
+
 #define mtk_vdec_err(ctx, fmt, args...)                               \
 	mtk_vcodec_err((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index afa224da0f4165cf5701d6861f1f787c6317bfe4..9187d7bcfc8aea17f3fc98d94419777d8026db51 100644
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
+	mtk_vcodec_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -308,6 +297,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 static void mtk_vdec_worker(struct work_struct *work)
@@ -358,12 +348,17 @@ static void mtk_vdec_worker(struct work_struct *work)
 	else
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
 
+	mutex_lock(&ctx->lock);
+	ctx->req_state = MTK_REQUEST_RECEIVED;
+	mutex_unlock(&ctx->lock);
+
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
@@ -372,18 +367,15 @@ static void mtk_vdec_worker(struct work_struct *work)
 	}
 
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
+	if (ret != -EAGAIN)
+		mtk_vcodec_complete(ctx, MTK_REQUEST_LAT_DONE, state, src_buf_req);
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
+		mtk_vcodec_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
 	}
+
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -731,9 +723,15 @@ static int fops_media_request_validate(struct media_request *mreq)
 	return vb2_request_validate(mreq);
 }
 
+static void fops_media_request_queue(struct media_request *mreq)
+{
+	media_request_mark_manual_completion(mreq);
+	v4l2_m2m_request_queue(mreq);
+}
+
 const struct media_device_ops mtk_vcodec_media_ops = {
 	.req_validate	= fops_media_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= fops_media_request_queue,
 };
 
 static void mtk_vcodec_add_formats(unsigned int fourcc,

-- 
2.34.1


