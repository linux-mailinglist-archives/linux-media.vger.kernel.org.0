Return-Path: <linux-media+bounces-15902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7687894A2B2
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D821F23F06
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7710E1CCB3C;
	Wed,  7 Aug 2024 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZRz9eYSg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708511CCB31;
	Wed,  7 Aug 2024 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019105; cv=none; b=Qu3JPFUN28JbBudvIpI7hdj7teiKVzzSAQsCHSfkc3NVhocaQo/bbeecPADc3BLbMQlk4ed0f4dZHhcDsY3bl0YIi2IwzKPV3DvpKe1PrnTIdK3fxE47ETLoRGXIZGj68YUSaPtawO7bcbupBTVCxSyLXjRGn8G2cA5Iez37Yt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019105; c=relaxed/simple;
	bh=kpVhN2HV8JwcCiF0l5hKrzWTt1X9gYZwzJP4aouRO8A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRP7AnRWlW3N5eCE1bsvMDtMCw1iFm1rFA6jMVoUSn85q0wVx/RIIQJ6HsunGzPmLMsiXD560cqiZr9Kwvlhd4j0Jk2Xlze5cmfibo4gFshZfXvBLot96z5wR51TWy8Qam05Xdu5jEBBLAWfP5I942SEa1iFeV6FFG7lU2oyPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZRz9eYSg; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 82d180cc549611ef9a4e6796c666300c-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qE31DCp4yHPnBShoWFTBjcGkXm/pncTxOzRx1NDfCOU=;
	b=ZRz9eYSgdl3XAndogrBU29KsiP9jXwcEC5yfu5YwKQGHt/wi9pXUL5JMK5nL6j4W9N/1L84dFOi+OSB65SPLw2ed9f9hdc6nAi/0cZYlcznRdREfnRdSz3bo0dC/EgKjlS6SirVeM+pPNhUsOcTlkQu4N8f/ulefD11ytxBt1dM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1ce15f43-ab34-4d83-8240-9c3a5a932451,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:06dfd53e-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82d180cc549611ef9a4e6796c666300c-20240807
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 436953660; Wed, 07 Aug 2024 16:24:48 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 16:24:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 16:24:49 +0800
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
Subject: [PATCH v4 3/7] media: mediatek: vcodec: flush decoder before stream off
Date: Wed, 7 Aug 2024 16:24:33 +0800
Message-ID: <20240807082444.21280-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Flush decoder will reset the driver to flush status. If lat or core
work queue in active before flush when stream off, will lead to get
dst buffer NULL or buff done with one non-existent source buffer.

Flush decoder when stream off no matter output or capture queue
calling stream off firstly.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 7080ca3e18b0..fc4ee1fb7cd1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,6 +882,29 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
+	if (ctx->state >= MTK_STATE_HEADER && ctx->state != MTK_STATE_FLUSH) {
+		/*
+		 * The resolution hasn't been changed when STREAMOFF is called.
+		 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
+		 * is called.
+		 */
+		ctx->picinfo = ctx->last_decoded_picinfo;
+
+		mtk_v4l2_vdec_dbg(2, ctx,
+				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
+				  ctx->id, ctx->last_decoded_picinfo.pic_w,
+				  ctx->last_decoded_picinfo.pic_h,
+				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+				  ctx->last_decoded_picinfo.buf_w,
+				  ctx->last_decoded_picinfo.buf_h);
+
+		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
+		if (ret)
+			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+
+		ctx->state = MTK_STATE_FLUSH;
+	}
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
 			if (src_buf != &ctx->empty_flush_buf.vb) {
@@ -894,28 +917,6 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
-		if (ctx->state >= MTK_STATE_HEADER) {
-			/*
-			 * The resolution hasn't been changed when STREAMOFF is called.
-			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
-			 * is called.
-			 */
-			ctx->picinfo = ctx->last_decoded_picinfo;
-
-			mtk_v4l2_vdec_dbg(2, ctx,
-					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
-					  ctx->id, ctx->last_decoded_picinfo.pic_w,
-					  ctx->last_decoded_picinfo.pic_h,
-					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-					  ctx->last_decoded_picinfo.buf_w,
-					  ctx->last_decoded_picinfo.buf_h);
-
-			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
-			if (ret)
-				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
-		}
-
-		ctx->state = MTK_STATE_FLUSH;
 		return;
 	}
 
-- 
2.46.0


