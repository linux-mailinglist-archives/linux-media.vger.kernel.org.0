Return-Path: <linux-media+bounces-37839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A063B06EAB
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D1CD1AA03EE
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 07:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A236B28D845;
	Wed, 16 Jul 2025 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cw/LudKl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7728C5AD;
	Wed, 16 Jul 2025 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650103; cv=none; b=NKD9cTbvRPcEc73tFiscm7cjI1GIf0BIvNk9xlytXOwQc/J2BvDN4CRKTAWjLGxVjbfV45WNeTnr43lp42B2L2dpBemTDz+XGWc+MEKecJWtKNEirrPRMZB/z8lnVsIGSCt7PAZxBKrfUps4/PFIAdLkZybvMPcfXqGe7FIY3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650103; c=relaxed/simple;
	bh=d1QKs8syhGjdPEm3qcMFjfrdx9xlptYnX9Wk243Jkr0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AnRTmJ2M/HYCDVZiT790o6vURZgzzoPY201NrpFxtTvCPIqFMkq8Vx15SLXjVm6F3Bg7Yu2+hLXCrGUOO3XrteYPBQkYFxzU+Ttj80iUE1hx0/6oO+Jg6Ib5iaC8JQB3Ff4PTtSE6MAcULXVL4ZT5q4hripQN5Gkh6z5S/KLM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Cw/LudKl; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9232cdb4621411f0b33aeb1e7f16c2b6-20250716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dkQUz9omaIloVa64s9phQV1SIkeACbbWCC29GfBqFac=;
	b=Cw/LudKlLnF9vTEv74+HzBJ5areiOSp4/QJH6cY+VTjGzID2xm5IGIM6qtSB1p+f3oPBSTshv1Hc+YBrA1TPh/8S6T8KhnG56U9dwHFGWnPAznPIetdynDjSLE1QJsjbcxeSeL59BwS8DCQ09154yji5dSZPuYm1CZrsotH0u4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:886ee3bc-1b33-4e66-892c-09134a7b22ab,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:1e0942d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9232cdb4621411f0b33aeb1e7f16c2b6-20250716
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 677742633; Wed, 16 Jul 2025 15:14:54 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 15:14:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 15:14:51 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar variable issue
Date: Wed, 16 Jul 2025 15:14:50 +0800
Message-ID: <20250716071450.8214-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

UNINIT checker finds some instances of variables that are used
without being initialized, for example using the uninitialized
value enc_result.is_key_frm can result in unpredictable behavior,
so initialize these variables after declaring.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
v2:
 - Add Fixes tag, update commit message
 - Remove unnecessary memset
 - Move memset to before the first usage
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..3065f3e66336 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -865,7 +865,7 @@ static void vb2ops_venc_buf_queue(struct vb2_buffer *vb)
 static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_enc_ctx *ctx = vb2_get_drv_priv(q);
-	struct venc_enc_param param;
+	struct venc_enc_param param = { 0 };
 	int ret;
 	int i;
 
@@ -1036,6 +1036,7 @@ static int mtk_venc_encode_header(void *priv)
 			  ctx->id, dst_buf->vb2_buf.index, bs_buf.va,
 			  (u64)bs_buf.dma_addr, bs_buf.size);
 
+	memset(&enc_result, 0, sizeof(enc_result));
 	ret = venc_if_encode(ctx,
 			VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
 			NULL, &bs_buf, &enc_result);
@@ -1185,6 +1186,7 @@ static void mtk_venc_worker(struct work_struct *work)
 			  (u64)frm_buf.fb_addr[1].dma_addr, frm_buf.fb_addr[1].size,
 			  (u64)frm_buf.fb_addr[2].dma_addr, frm_buf.fb_addr[2].size);
 
+	memset(&enc_result, 0, sizeof(enc_result));
 	ret = venc_if_encode(ctx, VENC_START_OPT_ENCODE_FRAME,
 			     &frm_buf, &bs_buf, &enc_result);
 
-- 
2.46.0


