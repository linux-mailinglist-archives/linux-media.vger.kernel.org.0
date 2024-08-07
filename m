Return-Path: <linux-media+bounces-15905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05394A2B9
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9429F2857A8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68351D0DEB;
	Wed,  7 Aug 2024 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZGwgVNjz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3141CCB34;
	Wed,  7 Aug 2024 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019107; cv=none; b=IlHhW+u1AUODnZF+RCeK8QavXZ/riHO/yBp9B6N6T3t6NMrBC+tVA31bxH4p5ueKQ5ADAbhFFsnGsiCejC6hnf7LdsT/m1wxMJO0yg03lTn1+iqP//t580Ujc/8w/sMyIflo7zu2U6miZrFSvTo8wYsZakQcGVyDgfATQIqZoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019107; c=relaxed/simple;
	bh=CTzjkoB7kUJTPiT/LvPvVzYPWkv8kKPCpYN23Ij48Ig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9cWDy7t7VBJ08JSf+UDEO8Ed0b7n7DhAjrCoWK48rl9jz5jZPY0yHtWD8ItPOH/EVcc76F6evzt6SF6iuKGpZhG10V4VQ80lhcGzIYUMHbDvBBbuNxEnTqrl/cGbhkmwFNeBvNmoDAUk5cj5bGOOGj008thtJ7ZrJbFvNa+l9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZGwgVNjz; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 86f5aca0549611ef9a4e6796c666300c-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l+Pm2Uz8czmkJFuXb1Z/CEoVKrveOwBa78F6NDnTC3k=;
	b=ZGwgVNjz5IBiAE3Td0O70t7SVHw1nLHYIpBKzentBv3g1Jr0UhzZ4cspYlp7Uj5K6Tbw4aq10zxYRiCTWK29ePTxuem4cBnOfDvDCO4wUkpnelHy1HNdJiAsNzGBFEgjd5+mKbCqxpGFNTwsPi+AJYv4bmZG+3cpwa4BovtC2lo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:68b5514a-baef-4ac9-b6fb-4bbca83bbcfd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8b8e46fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 86f5aca0549611ef9a4e6796c666300c-20240807
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1538049252; Wed, 07 Aug 2024 16:24:55 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 16:24:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 16:24:48 +0800
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
Subject: [PATCH v4 2/7] media: mediatek: vcodec: change flush decode order when stream off
Date: Wed, 7 Aug 2024 16:24:32 +0800
Message-ID: <20240807082444.21280-3-yunfei.dong@mediatek.com>
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
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.817900-8.000000
X-TMASE-MatchedRID: hPnsbxNiy9LHO8eAxCOj9rdQIb8hCnY+bveZreOw8zaNxFb0yp4mr8sl
	aH7/o+sPA+1Cw+zo9m9iSVnIdboij6jC6/MNUxOoTVa+L3Zgqc4hmbYg1ZcOnivhXWbzMGmSWYF
	jags77eHOH4XDH3WaNlzzIJrqcl2Qcc8G9KynN+O4jAucHcCqnVNn42YjbyMphZcYd3XdDACjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0CM/D7JJD7PwmaCnHfxwwZrjL1zZLSTFeousTyR/kYfwghp
	hsKRsFXW2qDcPZ5LQ5IJh9mhXmg+RZDMuMlKcLQ+xgn2gdEfRviw6uxviJP8r9tsSiUciBlQ5zs
	aM5qada/lr1yYih0SzMPwdnhe8nZlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.817900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0ADB59112FD7178C6584482E59269661D2CDA2B2DCD10F5171D61563225AA4162000:8
X-MTK: N

The buffer remove and buffer done of output queue is separated into
two works, the value of owned_by_drv_count isn't zero when output
queue stream off before flush decode.
Changing the flush decode from capture to output when stream off to
make sure all the output queue buffers are set to done list.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 +++++++++----------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 2b787e60a1f9..7080ca3e18b0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -893,32 +893,31 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
 			}
 		}
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
-		 */
-		ctx->picinfo = ctx->last_decoded_picinfo;
 
-		mtk_v4l2_vdec_dbg(2, ctx,
-				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
-				  ctx->id, ctx->last_decoded_picinfo.pic_w,
-				  ctx->last_decoded_picinfo.pic_h,
-				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-				  ctx->last_decoded_picinfo.buf_w,
-				  ctx->last_decoded_picinfo.buf_h);
+		if (ctx->state >= MTK_STATE_HEADER) {
+			/*
+			 * The resolution hasn't been changed when STREAMOFF is called.
+			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
+			 * is called.
+			 */
+			ctx->picinfo = ctx->last_decoded_picinfo;
+
+			mtk_v4l2_vdec_dbg(2, ctx,
+					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
+					  ctx->id, ctx->last_decoded_picinfo.pic_w,
+					  ctx->last_decoded_picinfo.pic_h,
+					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+					  ctx->last_decoded_picinfo.buf_w,
+					  ctx->last_decoded_picinfo.buf_h);
+
+			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
+			if (ret)
+				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+		}
 
-		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
-		if (ret)
-			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+		ctx->state = MTK_STATE_FLUSH;
+		return;
 	}
-	ctx->state = MTK_STATE_FLUSH;
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-- 
2.46.0


