Return-Path: <linux-media+bounces-21475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B389CFC90
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45F19B281EB
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3C9195F04;
	Sat, 16 Nov 2024 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i8Yrs08i"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE0192598;
	Sat, 16 Nov 2024 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731727058; cv=none; b=qx7xmTOSsegzqjUifuYbZ+Z9SRhiD94UHWEFOa+t5MfEh6EXTvtc20SnFvjFaAlusVAXLjqQRdQobs5YiszWyK19cEmRACb3J273FP2Z5Mpv60uF3pdCm1inFCfigxs8Fkb7tpolKMs5P81iE8GCZdeycCNOgNTdFijJDo6h3UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731727058; c=relaxed/simple;
	bh=DCFBXDUZmtSanwd06yG+l5peDvJ3fv/DVJtZAXzctIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMJJ0lQ6cnIC7EsFs8qMHltU54wBZ+pkrimkMF1UY8pTHf+S+3In/b2rLgShrr4/WipTXc8GA9wXIw48yDrqjjB2u0TtqAa/Ym7OkOJcuwxXeEsYBN7Kgowt7/DI8WgFOBQjay0FAGdA2cc+cOWgYvghLXoA6fB5AQ33ODfwyvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=i8Yrs08i; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 515e0a38a3c911ef99858b75a2457dd9-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XAFnqKkSwcF2bp8hcz0pbKeIV30/71cmFE96nXVmuJo=;
	b=i8Yrs08il9zHxGXEZAMSEWq/+BpLs8D8V8JGJxaS0VKL8hR+9kzTT/jWAmPdjgLaeX/vbrRoKPjUKmxigCO6rmv0zv137bg8H7I49VIu74WCh1eUqsFE13XUy1ULB4vWfia0mIwsWJUSGkTeeMRG+DSHWqqftoqpATkQ4ctPYNA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:1340528f-2ecf-4533-a77c-d1d47fe6b1f8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ce19b8a,CLOUDID:57182a07-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 515e0a38a3c911ef99858b75a2457dd9-20241116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 631845037; Sat, 16 Nov 2024 11:17:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:27 +0800
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
Subject: [PATCH v7 3/5] media: mediatek: vcodec: remove media request checking
Date: Sat, 16 Nov 2024 11:17:17 +0800
Message-ID: <20241116031724.15694-4-yunfei.dong@mediatek.com>
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
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.511500-8.000000
X-TMASE-MatchedRID: s1WpmjjDH4dmcP5F4hatbcnlbo5l7mGFBLtx+64GFanjsTquy0JRi4ma
	Qfsqx1XAWKuGHPyQzf64VxGFQBNJeCY0eULsNBXlHPYwOJi6PLlu95mt47DzNlfXgfL55inv3oz
	JRX7b4NmFKg32b+87J0iJiJhvpf+911/bObp3yCgSEYfcJF0pRX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07SQvY0ueKrc1jwY/IrEBx9e6DRg6XX9fFprHtTGfESU7RckC8ZNwvw0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.511500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	33CBB420F46111ACF58A0B40F4B635AB9D396A27EC0949270CFDDDFE1F29847D2000:8
X-MTK: N

Setting the buffer status to error if the media request of
each source buffer is NULL, then schedule the work to process
again in case of access NULL pointer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  6 ++----
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 +++++------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 2ccdffbadcda..b16572d5cf54 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -912,10 +912,8 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 					src_buf->vb2_buf.req_obj.req;
 
 				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-				if (req) {
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-					media_request_manual_complete(req);
-				}
+				v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+				media_request_manual_complete(req);
 			}
 		}
 		return;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 1e11c08d708f..dd6ee694382e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -264,10 +264,8 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
 		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
 	}
 
-	if (src_buf_req) {
-		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-		media_request_manual_complete(src_buf_req);
-	}
+	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	media_request_manual_complete(src_buf_req);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -356,10 +354,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
 	src_buf_req = vb2_src->req_obj.req;
-	if (src_buf_req)
-		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
-	else
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+	v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret && ret != -EAGAIN) {
@@ -378,10 +373,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-		if (src_buf_req) {
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-			media_request_manual_complete(src_buf_req);
-		}
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		media_request_manual_complete(src_buf_req);
 	} else {
 		if (ret != -EAGAIN) {
 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-- 
2.46.0


