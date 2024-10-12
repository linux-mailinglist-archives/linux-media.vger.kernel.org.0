Return-Path: <linux-media+bounces-19487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EC99B156
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 08:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73321F22F7D
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 06:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADCD146A71;
	Sat, 12 Oct 2024 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kYie8lM+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478713BC35;
	Sat, 12 Oct 2024 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728715425; cv=none; b=tTPBJvRvxzCdEiarF4/LohZO9Dfqhoahz+MzXEJpMAGKxb05rR/Uej2FjF8ONJkzrp6wuZhkHrU8VuVGAx3hZ6t4EhG+q9509CgSdnMjeEzmlQUEb8FDY2Wb5onuRH/KR2NSPt9t4BkHcaHPL/E6qn6FohgxVnzAOunC/AJY3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728715425; c=relaxed/simple;
	bh=F7ejS8WAkI4/Ep03nFxdvB4gTrg8r9YssHAFehqCLdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZIP7bHOLo3p7vb0oY9bkdKRbWy7HWG3mqIlu9shjbZYFRbLZw56SSRIQbm4vY52Z7MG+3Q80YuS+7spcCSR3IqTpf9bYIcKehF/KtVG4iJ9GTrYg4RK2eWs3+FSiUSWNIwfAs9n38Ix9nzTVZtZXYxc2woRn+GqU287lHR4j7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kYie8lM+; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4f7c2bd4886511ef88ecadb115cee93b-20241012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nXWMIIvriBk3jQUJKGGjusEbJJOv4TyYVS7K8V95l/I=;
	b=kYie8lM+5lt34N/Zb0N/wtUEXZAdB8l+wRelB7gyF2ZLhaPHCiKML6ZRXEntBQFBhfe1tG/zGU/faDTPvu5YOu9osqsU+DBkLHogMlMPYD8KM7aiCo//LM/zYZXutdrpFqKbFHO+RsQCaq/a+y73VfhhbK8r1vYSH8dzhQ0GvOk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e047f428-1fa5-4e87-a1d7-02e4e9324639,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:7e302065-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f7c2bd4886511ef88ecadb115cee93b-20241012
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2105205773; Sat, 12 Oct 2024 14:43:37 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 14:43:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 14:43:33 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 2/5] media: mediatek: vcodec: change flush decode order when stream off
Date: Sat, 12 Oct 2024 14:43:26 +0800
Message-ID: <20241012064333.27269-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241012064333.27269-1-yunfei.dong@mediatek.com>
References: <20241012064333.27269-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.184200-8.000000
X-TMASE-MatchedRID: ojZhuzNjofOvVT6bfkFW/kKcYi5Qw/RVbveZreOw8zZgFU/kpKKcvJW7
	OIsTYDxxwulnsMSzBfjzslOXY3oDJBX4iGbFVE2xEhGH3CRdKUU/b+iJlFOdb8i9AjK6C8p1WTF
	H84r4cDRAEhD9e0n6VSfyuWB93oCTC9YpJ/fXjNd/TWpwlAOFXlctRqnPrLuBVz8J52OVy+RtfY
	DNYAyRnOLzNWBegCW2wgn7iDBesS3CttcwYNipX6EgUQ6c3OJwqKKppAtv3qHrcZ390m2m1AfCB
	vtEd3nKM/ieExVMmzhWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.184200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	7F487A016E13F29D12981E1FBCBD83D7809EC8C3C9B827176EBDB16E5A1EC1452000:8
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
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 2b787e60a1f9..fc4ee1fb7cd1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,27 +882,11 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			if (src_buf != &ctx->empty_flush_buf.vb) {
-				struct media_request *req =
-					src_buf->vb2_buf.req_obj.req;
-
-				if (req)
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
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
 
@@ -917,8 +901,24 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
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
+				if (req)
+					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			}
+		}
+
+		return;
 	}
-	ctx->state = MTK_STATE_FLUSH;
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-- 
2.46.0


