Return-Path: <linux-media+bounces-21100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991D9C14BB
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 04:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53139B21E53
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 03:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9078561FFE;
	Fri,  8 Nov 2024 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hcz4G7Lg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80218FC8F;
	Fri,  8 Nov 2024 03:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036758; cv=none; b=mZ+pNh0Wh9fLp+EnrYo6gXVnN/Xah40q1wK+/m6rqxOcscyikLqbnYV/FDwYSfY+UMUqlEisKi0Z1D6B7kbq3m2rqQIIx5bcjLsnxM6nfbcnBYddX4w6f0yPPDQACoPEd8LcuugMQpKrp6HASnmsp3fDRbZoVHsVPiIPf/X/tng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036758; c=relaxed/simple;
	bh=yqi+8W/AjWyxg6UIkNlhX2akX3fg7fx85RwitAV7hno=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nn04dKLTh7XeGY3TQMWEvkR5RBQF/8HqVRZah5IQYJYhaWQgKlBJYDmpxY7TG1YUMg7WZU41c932MbP/LvIMkzMs8tddPMpBNQ/2Dn5vOU402fjAZo28ymczWP+2OyICcDCBbv8FRMot2CfwGnPtMs3bFWKLQnkDg6u0nosqF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hcz4G7Lg; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 142a47829d8211efbd192953cf12861f-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ANCM2Uqwm4VGrcrdHMI1jTNeMDeM6aY6JeQgDAIPhDY=;
	b=hcz4G7LgCRjjObPkQ1KGCY4M3VYByK9KtYS/oEfD2dZwTITw6C6BY9JW0i4QnmTQMaQqQUxuBcSZ4fL7af+tLcf9aghX0Cpr9qc5HgQfLFo/Xv633g1DduBoKvonV8LKHf/n3+n/5SzW4QHZUh5SIOMAMrv1BV3dzGSVKsFnG3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:085e565c-d579-4483-a96b-79785025a367,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:de9cbe06-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 142a47829d8211efbd192953cf12861f-20241108
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 644738266; Fri, 08 Nov 2024 11:32:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:32:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:25 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 5/5] media: mediatek: vcodec: remove media request checking
Date: Fri, 8 Nov 2024 11:32:14 +0800
Message-ID: <20241108033219.19804-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108033219.19804-1-yunfei.dong@mediatek.com>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
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
	vfoH427ppx84QoERxMGxnReZpseJrr78SC5iivxwURSScn+QSXt0H8LFZNFG71sULACB0qRIxeQ
	pO/P9szbBz1znW2KIohcXEhM/4aanHXAdvslucuOBnLZk2tw2HlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.264300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	E17E845E3D081E50660A83A29D386E17279CC6C003956C5BB4AD941447119B032000:8
X-MTK: N

Setting the buffer status to error if the media request of
each source buffer is NULL, then schedule the work to process
again in case of access NULL pointer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 3f94654ebc73..251111678fd8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -363,10 +363,14 @@ static void mtk_vdec_worker(struct work_struct *work)
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
@@ -384,8 +388,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		vb2_v4l2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 		v4l2_m2m_buf_done(vb2_v4l2_dst, state);
 		v4l2_m2m_buf_done(vb2_v4l2_src, state);
@@ -403,8 +406,7 @@ static void mtk_vdec_worker(struct work_struct *work)
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


