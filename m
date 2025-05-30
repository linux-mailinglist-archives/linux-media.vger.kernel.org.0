Return-Path: <linux-media+bounces-33630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7104CAC8951
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C062DA246D9
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 07:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36974221261;
	Fri, 30 May 2025 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q01ks5ZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB34213E69;
	Fri, 30 May 2025 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591158; cv=none; b=mAczjVUWBKI983WrH4LdjLT5cY+kiJPpArfI/aQluTyuJb7UGCL7V0Ra/vdl+w3yIfN0O7cOxXHbe8nsBJ056lUYj+xmdSEDvbtYixM4nayLYUxV9mJfiOlnpxLsojG7Jp/fS6cD2o+AH5IWgq5qwtkalrewqJsLmjeCrkxy54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591158; c=relaxed/simple;
	bh=3DiVAe57LUwiCPzRAh1b7CUUya4e9UiZP0o+dFhDLDY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TOtCJOdwiM+l5LDGCxegAB6vNGSiyrGc/81arY1OqYFr2WROzycs1a1bj9gIuJnrYQZwLdf1jn3RPteHRTfRkLz8s9I8/n61sSE9cha4MatVK3LFI7B5r7n5G3VTzSWrI2qxML4BccUgtCY0j2BNNF6T0gSoBlgqHcDqVPbktFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Q01ks5ZJ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1aa6c6ec3d2a11f0813e4fe1310efc19-20250530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uU9QMJ8ywTOzIUiYj/jV85pg0KLsvi3NIz7nyLtfR3U=;
	b=Q01ks5ZJLxZjkg40sSQ4bGbGiaJ6UhkX4/3BoFHNxjmJiQH0Bq8koVWynKnmdPswu2jB8nIueU7ALOW7b0MU9mcbZCbExM4wmcz0fN3qY56AOUWy5SRYOCJp/izhbREUeqbQUqVQJh4vRaKQVWlPWNQeVIS+rUIAhGSyJ8DKEYk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7e7fe6c5-b4bc-4f28-8eb6-dc4b863b6fb0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4def4759-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1aa6c6ec3d2a11f0813e4fe1310efc19-20250530
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 273158392; Fri, 30 May 2025 15:45:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 30 May 2025 15:45:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 30 May 2025 15:45:47 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <srv_heupstream@mediatek.com>
Subject: [PATCH v5 10/12] media: mediatek: jpeg: fix decoding buffer number setting timing issue
Date: Fri, 30 May 2025 15:45:35 +0800
Message-ID: <20250530074537.26338-11-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250530074537.26338-1-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

move decoding buffer increase code into spinlock
protecting aera for multi-core

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 9 +++------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index c1d2de92f125..795916206c7c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1782,7 +1782,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
-	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
@@ -1791,11 +1790,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto getbuf_fail;
 	}
 
-	jpeg_src_buf->curr_ctx = ctx;
-	jpeg_src_buf->frame_num = ctx->total_frame_num;
-	jpeg_dst_buf->curr_ctx = ctx;
-	jpeg_dst_buf->frame_num = ctx->total_frame_num;
-
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
@@ -1820,6 +1814,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+	jpeg_dst_buf->curr_ctx = ctx;
+	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index db2afc5151ad..da753a636eaa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -516,6 +516,7 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
 				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
 						  VB2_BUF_STATE_DONE);
 				ctx->last_done_frame_num++;
+				break;
 			}
 		}
 	}
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 27da2a9922a6..5e8a5cb4850e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -245,6 +245,7 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
 				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
 						  VB2_BUF_STATE_DONE);
 				ctx->last_done_frame_num++;
+				break;
 			}
 		}
 	}
-- 
2.46.0


