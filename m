Return-Path: <linux-media+bounces-37750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F84EB0547C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CEF53A63D1
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D14A2652B6;
	Tue, 15 Jul 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qIYYY14g"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BEF79F2;
	Tue, 15 Jul 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567358; cv=none; b=h7qjROQ0pLBP2IA3Bocr72d1Rm3tueEboBbkhF3s90mdILGvnQvFw+wc/WHyQLuGXuSPQ8MPPtKw5Gltz8/19tZzvTWAaA4SvlAFoMPIIUMrh7LPFz4UdoSzGheuosrjdap20yZ9q+5zTpnW4CwLXgRCkFEW7cQQmmnRTCsPLcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567358; c=relaxed/simple;
	bh=AHdAHKmp0MkoZe6lK1B2DFAcyDQYDaNMcjlcJTIdhLU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z3xNYlg5kS6fuLJP+7w7z15Zb3oe8uVOyiWS6+L8LE/xaQCGHIb6iATjcWXcrtIwe8eI+7ALDT3gNWeWY9JwJR13NSVjSxMgrk+nBlCJ45MVV5Pr+EQSuoUHkyKWBIc7IKX24SIzL8UTiM8NXZ4UHcpkpn41MrHCDc9nXOGBBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qIYYY14g; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ebd97df2615311f0b1510d84776b8c0b-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ex6rZ9aRnEjIjKkUay6G77jbmFwgan0iuINyfGJdTk4=;
	b=qIYYY14gvVuTzdQHXcS4XgNFURJALqK5Tfs7LBvsp5eVZzP7MFLisryZ6L8X1o/08nKw86irrBT6GL0kNDQ6KNRI/8IdILSQSMbrg4RIkqwYpQKt2xu/IO1XK+ktWZqvit/5+tDAHv7LgMAvgYmHD1e2h2TudIqsO60SNzbyzRA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:76dfb572-83ed-4a6c-bf2c-9945b8a8c7ce,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:8fe7f0bc-a91d-4696-b3f4-d8815e4c200b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebd97df2615311f0b1510d84776b8c0b-20250715
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 358563972; Tue, 15 Jul 2025 16:15:51 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Jul 2025 16:15:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Jul 2025 16:15:48 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH] media: mediatek: encoder: memset encoder structure data
Date: Tue, 15 Jul 2025 16:15:47 +0800
Message-ID: <20250715081547.18076-1-irui.wang@mediatek.com>
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

Utilized memset to set all bytes of encoder structure to zero,
this prevents any undefined behavior due to uninitialized use.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..ecac1aec7215 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -886,6 +886,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 			return 0;
 	}
 
+	memset(&param, 0, sizeof(param));
 	mtk_venc_set_param(ctx, &param);
 	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
 	if (ret) {
@@ -1021,12 +1022,14 @@ static int mtk_venc_encode_header(void *priv)
 	struct mtk_vcodec_mem bs_buf;
 	struct venc_done_result enc_result;
 
+	memset(&enc_result, 0, sizeof(enc_result));
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 	if (!dst_buf) {
 		mtk_v4l2_venc_dbg(1, ctx, "No dst buffer");
 		return -EINVAL;
 	}
 
+	memset(&bs_buf, 0, sizeof(bs_buf));
 	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
@@ -1143,6 +1146,7 @@ static void mtk_venc_worker(struct work_struct *work)
 	struct venc_done_result enc_result;
 	int ret, i;
 
+	memset(&enc_result, 0, sizeof(enc_result));
 	/* check dst_buf, dst_buf may be removed in device_run
 	 * to stored encdoe header so we need check dst_buf and
 	 * call job_finish here to prevent recursion
@@ -1175,6 +1179,7 @@ static void mtk_venc_worker(struct work_struct *work)
 		frm_buf.fb_addr[i].size =
 				(size_t)src_buf->vb2_buf.planes[i].length;
 	}
+	memset(&bs_buf, 0, sizeof(bs_buf));
 	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
-- 
2.46.0


