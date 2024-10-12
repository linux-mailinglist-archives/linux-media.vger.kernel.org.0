Return-Path: <linux-media+bounces-19486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F799B153
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 08:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D121F22FDC
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 06:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF5E84D0F;
	Sat, 12 Oct 2024 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WbkGJuZ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC66E13B2B4;
	Sat, 12 Oct 2024 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728715424; cv=none; b=qtIfK95g3JcmEnXOPtx+zKglsPxtrwKGyxmk3MqZ2P1/yN/rWluDpTyD+cGZQgTPo9UKmjb0Amwcx3SsA6FnVHKYtvd4Ch6uni4DMkwr9gW0gnSXNwXpP+a9ZZRh2Lc7JX8Jf7kx5gp5P+cIRU7fkrNlW99T2m5E9amr5uY+AQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728715424; c=relaxed/simple;
	bh=q93byvXyz3gYtYpUbzIFvrGwfqOqhCPQZhiF775rPRA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCUUyZBSXzrmCFa9dLtD6xCZxwXUpuQvTStI3PpNbh0vLsKL8AfodX7senDUJ2T/iA6khmzjp/q3mRvzji3kCk0edNTAxz1JDpDwUVSfZvl5/lj1k+r4EfYHE8j/EEZeNngPF8UNUJQkFJ0cLdX+BtccCP1M/PakzA4eguUOZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WbkGJuZ+; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 501eeb58886511ef88ecadb115cee93b-20241012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8JLrq4jh7iY7GGut+rE11sLUmd1GJCvUrdKijk30RG0=;
	b=WbkGJuZ+ohct5OZtGtLtVOEsz32ewDbmkaKiSz7hohrgP1Z4Xc0+DX10WQ1LqrsmVE5CZ8WrgzmzFehVsQSFt1a4QI+PHVxGtp4OUWm7Uj/tPdyjbUpI2zMoMA5Z1U4CY6WXJ9uwNjdSVG0FXyY7DIU/Eu00I88tt4GVrHA5Px8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:982b2c3e-7a87-48e0-a1ce-daf15439ae5f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:7d302065-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 501eeb58886511ef88ecadb115cee93b-20241012
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1067359794; Sat, 12 Oct 2024 14:43:38 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 14:43:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 14:43:36 +0800
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
Subject: [PATCH v5 5/5] media: mediatek: vcodec: remove media request checking
Date: Sat, 12 Oct 2024 14:43:29 +0800
Message-ID: <20241012064333.27269-6-yunfei.dong@mediatek.com>
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
X-TM-AS-Result: No-10--9.264300-8.000000
X-TMASE-MatchedRID: 6sPUm7w8jTpmcP5F4hatbcnlbo5l7mGFBLtx+64GFanjsTquy0JRi4ma
	Qfsqx1XAWKuGHPyQzf64VxGFQBNJeJCoy9iDotiwDB+ErBr0bAPvJY9pBzgg1Fczpnf2wfW+/Ge
	vfoH427ppx84QoERxMGxnReZpseJrr78SC5iivxwURSScn+QSXt0H8LFZNFG71sULACB0qRKxf9
	Tzwx1gOqKw3PkULyG3d4zmm+qXAcRik/4smOcoJdNvcdbCGmtVlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.264300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DCA4312830AE28DABF4307C3097E27151D7C7F52A3EA48E5C4C3701D04C698F22000:8
X-MTK: N

Setting the buffer status to error if the media request of
each source buffer is NULL, then schedule the work to process
again in case of access NULL pointer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d213b0f532a9..01a63618f0c4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -359,10 +359,14 @@ static void mtk_vdec_worker(struct work_struct *work)
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
 	src_buf_req = vb2_src->req_obj.req;
-	if (src_buf_req)
+	if (src_buf_req) {
 		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
-	else
+	} else {
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		return;
+	}
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret && ret != -EAGAIN) {
@@ -380,8 +384,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		vb2_v4l2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 		v4l2_m2m_buf_done(vb2_v4l2_dst, state);
 		v4l2_m2m_buf_done(vb2_v4l2_src, state);
@@ -399,8 +402,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	 */
 	ctx->cur_src_buffer = (ret != -EAGAIN) ? NULL : vb2_v4l2_src;
 	if (ret && ret != -EAGAIN) {
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		v4l2_m2m_buf_done(vb2_v4l2_src, state);
 	}
 
-- 
2.46.0


