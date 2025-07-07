Return-Path: <linux-media+bounces-36955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A5AFAD33
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A6D3BA064
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04FF28C871;
	Mon,  7 Jul 2025 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ourfz/IK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7728A726;
	Mon,  7 Jul 2025 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873523; cv=none; b=eqEk0gx8OUzXdvFCe74232l7vmHAKdh807cAy1AMSnySdh9xwCNwH74Bc0/gWOtl/bTPBOH94WHekWLOcwCslWOkrtbQEIEATGsANAwpryZ71yd+o2OwGX2xL+Wso+kcyOnNLwD/7zRbVXy9aYkRU/pKiHzXux5wZ3zMYVm6Tf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873523; c=relaxed/simple;
	bh=EL72S3tkVrI/s+eelmUFDhhBR7eZAPgEYkZkv8vC2yU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvKHjE5Zwn0YKqx9KPgKcb/thMpKET8RRkBDD60UU0iuq7ZZ24gfdjg6Gs0BP0ELjHs/9AmqeD/u8sSOKAU9cJ/t8z7glNobh83W+6iHqTYGDB1RYE7uBFQCe8jAmknC5quGeuww4q7+nVe8XPTdTUcE5/07hP0C0pypwtWNpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ourfz/IK; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 762135be5b0411f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=Yu5eZWWPizoWzQUibwEljAB6F1kBW8UDCez7NAEKIwg=;
	b=Ourfz/IKza/XSOJ5KpUMdhqUIxuIal/ATGRU0r/JpKUFTeZ4+9QJ4i9KxlmplPgz7A34L7LxzI9oGpJ9IRTlYSImMB53j6ORzt2Tko/EDx55MBp44oh6yZNHAutx7qgP3p92s7W97x0DMfpjv+brxHb17LbG/7T+3CQFVkz7IEI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e48ce57c-42ed-453b-b065-256c9c3684df,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:8bb19682-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 762135be5b0411f0b1510d84776b8c0b-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486114497; Mon, 07 Jul 2025 15:31:56 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 15:31:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 15:31:55 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v7 08/12] media: mediatek: jpeg: fix remove buffer operation for multi-core
Date: Mon, 7 Jul 2025 15:31:41 +0800
Message-ID: <20250707073146.3581-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250707073146.3581-1-kyrie.wu@mediatek.com>
References: <20250707073146.3581-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

move remove buffer code to spinlock protect area for multi-core

Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e8d11fb3d330..e69699eef211 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1666,9 +1666,6 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		goto enc_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
@@ -1686,6 +1683,8 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 			     &src_buf->vb2_buf);
 	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
@@ -1768,9 +1767,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto dec_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1795,6 +1791,8 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				jpeg_src_buf->bs_size,
 				&bs,
 				&fb);
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
 	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-- 
2.46.0


