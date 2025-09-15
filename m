Return-Path: <linux-media+bounces-42504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E5B56E98
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 05:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6822D3BC51B
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 03:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5124EAB2;
	Mon, 15 Sep 2025 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Bm2TW/VC"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D023814D;
	Mon, 15 Sep 2025 03:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757905360; cv=none; b=WJEifjttvJQL7bk3htlSah++iba0+KVsTf000Hq42gjx4X5zgdLmKbyruyvlvAZsnqO//zg6GzeeNQb7+O9XEpc2bhnwMJUpghjIB8AQY+5M/9pI8dZARRksPunaKL7L36rqvmaEfgLySdr5btk9AGcANgCM1/IVqxnQi4qwgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757905360; c=relaxed/simple;
	bh=wTFnluJZ28XCNBQpN7WMeBqdcpyWYDW6rl20uu89dtM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXIzAZ8+8rrLjESyQWs7kRoHJUmA2nAMGjbnF/pw9ShKmdjVA1HbN/kpxQOpkLTvAVMN+tyjYmZ75ab7AT83yKxwB8E9qzvnpFAbrxhQV/xymazGagS7P3vHI+4PCd6mH6ObJrjX2TIfISs6owfwDrDlA4Np362P2KBgGgZl8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Bm2TW/VC; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6af2c52891e011f0b33aeb1e7f16c2b6-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=FsjQV9NBcQmrDhMEmoJBlllyYF9zFGVHcM6/mUcAHuU=;
	b=Bm2TW/VCw3MMBZKsaCY7xaeI0DhopwVZCnRJiuX1COdjbQRUjcn1FgmkpsshSCSScQ3BVBg4jqak3K22pYnYuuYvgKVjCNrHScBVa1eiqKqBXsO7+RfMp+K/q1osW4p2sySb/1CWSUrf1Ns45b6jVVl4CPhi7uAkDT3PDP4QDF4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:0695d7f7-eb2c-45b7-9eb3-c7508314b304,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:1ca6b93,CLOUDID:07ec8c6c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6af2c52891e011f0b33aeb1e7f16c2b6-20250915
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1186405017; Mon, 15 Sep 2025 11:02:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 11:02:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 11:02:27 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v9 06/12] media: mediatek: jpeg: fix decoding buffer number setting timing issue
Date: Mon, 15 Sep 2025 11:02:05 +0800
Message-ID: <20250915030212.22078-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250915030212.22078-1-kyrie.wu@mediatek.com>
References: <20250915030212.22078-1-kyrie.wu@mediatek.com>
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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 9 +++------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 32b20d97a5e8..3fc344d05528 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1747,7 +1747,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
-	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
@@ -1756,11 +1755,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
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
@@ -1785,6 +1779,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+	jpeg_dst_buf->curr_ctx = ctx;
+	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 5f1557dafad6..b3142dc9be85 100644
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
index 5fe709d4003a..ad6ee6ac6661 100644
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


