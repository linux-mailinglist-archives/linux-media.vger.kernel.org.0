Return-Path: <linux-media+bounces-21471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0C9CFC84
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E91128397D
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2831F1922F3;
	Sat, 16 Nov 2024 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rTm0T9Lz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF233EC;
	Sat, 16 Nov 2024 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731727055; cv=none; b=ExVoZuC6AnYFWeZ9WG6UfWA86mCUgUX/uVVZsrM22ZAaI8godH7Zg8BMUhyGN9W9cRoWOqP+RDZ8TiNhSOzSpPje7f56jkrb4cenx2CE2dZ64tFt/q6twCKw6OaZ9SXiJO+GXGk9PepQ3dHPaWrPXVDS9J7PonfqlhclM8xWk3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731727055; c=relaxed/simple;
	bh=bvY939VWx9qWPDYpKkGp0M+BQtyXh8KG3Wa9oYlOtM0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWy6uLABgwXf7t2xIlQoOltYZ/fjrFQew7x6kSmZt2y0KKpLmsKiPUgOF54cJrYIdqgAZ9uyThDkPu7cjunIYiGX7uTqxMCe9oPSIP7s2J0UNCr61amInCFbXOlpe61XYm+YGKPo9hNKWd3k8mdvmLg8kDxBjqsUySgp3MlkN1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rTm0T9Lz; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4f80b03aa3c911ef99858b75a2457dd9-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HHbwP/c82/8ptLWsKio1TU3AIOhVLAz+mmbbLDs6714=;
	b=rTm0T9LzBf43c9bxCc5czBpXBwBDLaQ/OvNbOsIovwAZWaBtcFC76QaWX7uBbol7mGAtAznl8K28vQvscV5/D5CXgSnUzHxk13aY/jZhIOJ10b7O89b+XyPcVgsbe9a2Q5qf6PDQ1lX8snZTS43k50iPshCKTCiiXXr9Kx7NtO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:92dd3973-4ebf-47f1-a72b-2d9cea889c8a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ce19b8a,CLOUDID:51edb85c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f80b03aa3c911ef99858b75a2457dd9-20241116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1282829371; Sat, 16 Nov 2024 11:17:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:26 +0800
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
Subject: [PATCH v7 2/5] media: mediatek: vcodec: change flush decode order when stream off
Date: Sat, 16 Nov 2024 11:17:16 +0800
Message-ID: <20241116031724.15694-3-yunfei.dong@mediatek.com>
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

The driver status is set to flush when flush_decoder is called.
The order of STREAMOFF ioctl for OUTPUT and CAPTURE are randomly.
If flush_decoder is called in STREAMOFF for capture queue always,
leading to get NULL dst buffer when calling STREAMOFF for output
queue before capture queue.

Need to flush decoder when stream off no matter output or capture
queue is called firstly.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 47 +++++++++----------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d2146724f5de..2ccdffbadcda 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,29 +882,11 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			if (src_buf != &ctx->empty_flush_buf.vb) {
-				struct media_request *req =
-					src_buf->vb2_buf.req_obj.req;
-
-				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-				if (req) {
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-					media_request_manual_complete(req);
-				}
-			}
-		}
-		return;
-	}
-
-	if (ctx->state >= MTK_STATE_HEADER) {
-
-		/* Until STREAMOFF is called on the CAPTURE queue
-		 * (acknowledging the event), the driver operates
-		 * as if the resolution hasn't changed yet, i.e.
-		 * VIDIOC_G_FMT< etc. return previous resolution.
-		 * So we update picinfo here
+	if (ctx->state >= MTK_STATE_HEADER && ctx->state != MTK_STATE_FLUSH) {
+		/*
+		 * The resolution hasn't been changed when STREAMOFF is called.
+		 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
+		 * is called.
 		 */
 		ctx->picinfo = ctx->last_decoded_picinfo;
 
@@ -919,8 +901,25 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
 		if (ret)
 			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+
+		ctx->state = MTK_STATE_FLUSH;
+	}
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
+			if (src_buf != &ctx->empty_flush_buf.vb) {
+				struct media_request *req =
+					src_buf->vb2_buf.req_obj.req;
+
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+				if (req) {
+					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+					media_request_manual_complete(req);
+				}
+			}
+		}
+		return;
 	}
-	ctx->state = MTK_STATE_FLUSH;
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-- 
2.46.0


