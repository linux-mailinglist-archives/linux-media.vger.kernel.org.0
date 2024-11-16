Return-Path: <linux-media+bounces-21473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F37189CFC89
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834791F23F23
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E30192D8F;
	Sat, 16 Nov 2024 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iiiQCKR/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D074126C1E;
	Sat, 16 Nov 2024 03:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731727056; cv=none; b=TmrcUbfypzhtoE/71e1ZSgKTL8Qfa0LJf2vTecyPwrgwH10EAB+rP2vq6YU3NjW35COpKy0Y41dmskyFo9Co8q2mxgx5vG4mV6Jwrw8dRfHo4rV1ilMx7jNEGKzJk/JR5NP4b4yHCyAFoiMuAb9mZYDjngf3io2fQmchSq3IHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731727056; c=relaxed/simple;
	bh=jcRXgC+v2N359PE6oRyKGHEJCQYznl8FzTjOf6HB8a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gT4BW5hC+PSLgduYvgXim0gRbhdJ65D3iNR65jXyd/AVVCz/TFx2jacsppxohyY2GB2BFUID1HRO0XDDEjixmTuAyRJgmeiasSesIuKTGiUU+wxX7gmaqD7nIPoRu+0exH3WDucbURIQDKGJ4utrh4KiqZerZIQ+ETg6o/sZv9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iiiQCKR/; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4ee5294ea3c911efbd192953cf12861f-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TBsyGT5u7i5dX+fiCypn0SHv3sva6z8TnaTcjDrIi0g=;
	b=iiiQCKR/uHsaoKq7arNnc9M6yp0/Gj/0USmppo3BSNV0Hak/U//HfuqYGSIK6BcWWdZpi1Mfd9/LsjrKg8Q3SMktxnULNHKG1VyNsAlNRUqktUUjeowRxuwii1GspRHbxB9lDdEADg1Nz1bM2nPBr2fnc3kERawdjcHTimUUe08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:a36a86ad-f9e4-4fde-b516-d86ae31b7bd9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ce19b8a,CLOUDID:2615234f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4ee5294ea3c911efbd192953cf12861f-20241116
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 283406642; Sat, 16 Nov 2024 11:17:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:25 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 1/5] media: mediatek: vcodec: support manual request completion
Date: Sat, 16 Nov 2024 11:17:15 +0800
Message-ID: <20241116031724.15694-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241116031724.15694-1-yunfei.dong@mediatek.com>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

There is only a buffer object for some codecs, the request is marked
as completed if the buffer is set to done. Framework will add a new
control handler object to the request with latest control values, will
get below warning if the driver calling v4l2_ctrl_request_complete to
set media request complete again. Using manual request completion to
fix this issue.

Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=--)
pc : media_request_object_bind+0xa8/0x124
lr : media_request_object_bind+0x50/0x124
sp : ffffffc011393be0
x29: ffffffc011393be0 x28: 0000000000000000
x27: ffffff890c280248 x26: ffffffe21a71ab88
x25: 0000000000000000 x24: ffffff890c280280
x23: ffffff890c280280 x22: 00000000fffffff0
x21: 0000000000000000 x20: ffffff890260d280
x19: ffffff890260d2e8 x18: 0000000000001000
x17: 0000000000000400 x16: ffffffe21a4584a0
x15: 000000000053361d x14: 0000000000000018
x13: 0000000000000004 x12: ffffffa82427d000
x11: ffffffe21ac3fce0 x10: 0000000000000001
x9 : 0000000000000000 x8 : 0000000000000003
x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : ffffff89052e7b98
x3 : 0000000000000000 x2 : 0000000000000001
x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 media_request_object_bind+0xa8/0x124
 v4l2_ctrl_request_bind+0xc4/0x168
 v4l2_ctrl_request_complete+0x198/0x1f4
 mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
 vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
 vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
 process_one_work+0x140/0x480
 worker_thread+0x12c/0x2f8
 kthread+0x13c/0x1d8
 ret_from_fork+0x10/0x30

Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  8 +++++---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 ++++++++++++++---
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d..d2146724f5de 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -887,10 +887,12 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 			if (src_buf != &ctx->empty_flush_buf.vb) {
 				struct media_request *req =
 					src_buf->vb2_buf.req_obj.req;
-				v4l2_m2m_buf_done(src_buf,
-						VB2_BUF_STATE_ERROR);
-				if (req)
+
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+				if (req) {
 					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+					media_request_manual_complete(req);
+				}
 			}
 		}
 		return;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index afa224da0f41..1e11c08d708f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -264,8 +264,10 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
 		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
 	}
 
-	if (src_buf_req)
+	if (src_buf_req) {
 		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		media_request_manual_complete(src_buf_req);
+	}
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -308,6 +310,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 static void mtk_vdec_worker(struct work_struct *work)
@@ -375,8 +378,10 @@ static void mtk_vdec_worker(struct work_struct *work)
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-		if (src_buf_req)
+		if (src_buf_req) {
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+			media_request_manual_complete(src_buf_req);
+		}
 	} else {
 		if (ret != -EAGAIN) {
 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
@@ -731,9 +736,15 @@ static int fops_media_request_validate(struct media_request *mreq)
 	return vb2_request_validate(mreq);
 }
 
+static void fops_media_request_queue(struct media_request *req)
+{
+	media_request_mark_manual_completion(req);
+	v4l2_m2m_request_queue(req);
+}
+
 const struct media_device_ops mtk_vcodec_media_ops = {
 	.req_validate	= fops_media_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= fops_media_request_queue,
 };
 
 static void mtk_vcodec_add_formats(unsigned int fourcc,
-- 
2.46.0


