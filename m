Return-Path: <linux-media+bounces-45904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE57C188AD
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 07:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09175351945
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 06:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913BC3093CE;
	Wed, 29 Oct 2025 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="miBizAO7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F930DEC6;
	Wed, 29 Oct 2025 06:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761720852; cv=none; b=gaqhnwghhtYYZqDC0JolXjjjbHVXNn8ZCGa3Nie06Y23gIDv9b4W60X7eMeTOCfGrGrcU4fJtX3jIZuKd0vr4aSQkyB2xPpa4Kg1L5lAp4uKL8yi8bGMAsWC4XGuY/Ufsx7MaXo7OGwtut/TtVZ+mScUpiqPILNGKZxBgdKHLEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761720852; c=relaxed/simple;
	bh=jN/DPdlQAIOX9HcMYLiaY/FxTEHeXDQ3NpbeF0IQuE0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhYrEZBEWNbxvVrRWsfjbHuFkKjIy6nyt2R9kaQ8iVSQ5D4VAROcdI76o0w72gk2gVK4Z9TGJbL90242lYxb6AD/IdsWRkUa188H46Oue9j7N+HD7fg5pGw9zt+ZdKxS1B7us+zgtz8qiB/UZza90HQgHBdq1JSkbiMcA6GwxXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=miBizAO7; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0df5bb74b49411f0b33aeb1e7f16c2b6-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=5aHjDJ2HX7tNPod1UO3434SuJHQhS2B2jt5x40F8fc0=;
	b=miBizAO7IaiW65jBHQgbSnIJcZv4skmz5g4wz7rQCjnzncx+SR7eXmy7339a6k6PaJ7e8n7CegXMaWtoXVccu/06elHp2V7Ee3SOgP4mOf0JrOXW/ph+bzg7tURf4lZLS6zuC4rkZrqzi9wOWBpBxg+QNStlbHLTlYTGhWb+uWQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f7484698-4c7d-4c45-8bf0-4e3087da4f84,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f5b126f1-31a8-43f5-8f31-9f9994fcc06e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0df5bb74b49411f0b33aeb1e7f16c2b6-20251029
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 953840659; Wed, 29 Oct 2025 14:54:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 14:54:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 14:54:01 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v10 06/12] media: mediatek: jpeg: fix decoding buffer number setting timing issue
Date: Wed, 29 Oct 2025 14:53:47 +0800
Message-ID: <20251029065354.22257-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251029065354.22257-1-kyrie.wu@mediatek.com>
References: <20251029065354.22257-1-kyrie.wu@mediatek.com>
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

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c    | 13 +++++--------
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  1 +
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  1 +
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index a90d949e53f5..605f9f54cdac 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1609,7 +1609,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
-	struct mtk_jpeg_src_buf *jpeg_dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_dst_buf, *jpeg_dst_buf;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	int ret, i, hw_id = 0;
 	unsigned long flags;
@@ -1700,7 +1700,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpegdec_comp_dev *comp_jpeg[MTK_JPEGDEC_HW_MAX];
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
-	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int ret, i, hw_id = 0;
@@ -1739,7 +1739,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
-	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
@@ -1748,11 +1747,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
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
@@ -1777,6 +1771,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+	jpeg_dst_buf->curr_ctx = ctx;
+	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 997fcb848977..31765e897d57 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -513,6 +513,7 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
 				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
 						  VB2_BUF_STATE_DONE);
 				ctx->last_done_frame_num++;
+				break;
 			}
 		}
 	}
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 955409061894..cae03ba6e88d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -242,6 +242,7 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
 				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
 						  VB2_BUF_STATE_DONE);
 				ctx->last_done_frame_num++;
+				break;
 			}
 		}
 	}
-- 
2.45.2


