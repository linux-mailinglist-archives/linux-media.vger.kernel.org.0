Return-Path: <linux-media+bounces-24560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12470A084D8
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 02:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA84B188253A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 01:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A3C13F43A;
	Fri, 10 Jan 2025 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GqqD0F/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493AD2063E7;
	Fri, 10 Jan 2025 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472488; cv=none; b=r2W318beN3XRejJ67R2yV0qBAV/BX5VWcJPuoVY05o6brlXoCL+qh/eQ+5cK3sEh0/eEKzqGgDnTR47wyMDB6K5pw0kt+kpiiAKY3JT/Q7ZdHAD16mCeZ34dAYgvXI/X3n+5f2AiohJyWGO5WGxyETSXrbA8w2dQubIlEoZhBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472488; c=relaxed/simple;
	bh=p5aSzTIoB4UDWbuqgvzL3vygyIi2aFPnl0VwGvM+HjU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aIon44B2LWkz0wBVvhS4syKncDURF+tJQSL9gWF1lUUNmHYlwjXXjXEAaFNwdLyTisyxM1sFC/e784cCL1InwW/kKKS3VA4nJZ/ENOKOFST4w3kltj3s+NyO2AYYd74sy6dDzaPfzQKyAyKU106W6pVzGhI3jTeDyUdAjGqnegg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GqqD0F/r; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 22aaa102cef211ef99858b75a2457dd9-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7XxeDT1yqk0joCSBlrR1vdvJ1IoLGgbPPLdPXNw3S7Y=;
	b=GqqD0F/rRt/KcPxEaruCTAnNuvrgZHdhWzMrI81ZlqJULmlbq/97OGWwHFrCyDqpPS30SHtkOV8ABHfpIt+0LAE/KheDQSSFcrifbyvr+WnBAhrtv5DZiD/fxfF3/8qGCF2YZnT47AKZAk293ToHrHFmnYFypfp/1S1Z+J6LQW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e078ebee-3a39-4911-a109-5222c9798ecc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:fdd3a80e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 22aaa102cef211ef99858b75a2457dd9-20250110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1379832588; Fri, 10 Jan 2025 09:28:03 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:28:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:28:01 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,11/12] media: mediatek: jpeg: refactor decoding resolution change operation
Date: Fri, 10 Jan 2025 09:27:48 +0800
Message-ID: <20250110012749.30072-12-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

For multi-core:
1.if there are only two src buffers, hw0 and hw1 are decoding
at the same time. When resolution change occurred on one hw,
the src buffer cannot be got in the stop streaming function,
which will cause a crash.
2.When a resolution change occurs, immediately set the new
resolution parameter to save the new resolution;
3.After a resolution change occurred, decoding should not continue,
needs to wait until new buffers are ready and the state machine
changed.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 791fc064bc0a..2919fdd92d45 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -886,7 +886,8 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 
 		vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 		src_buf = mtk_jpeg_vb2_to_srcbuf(&vb->vb2_buf);
-		mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
+		if (!IS_ERR_OR_NULL(src_buf))
+			mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
 		ctx->state = MTK_JPEG_RUNNING;
 	} else if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		ctx->state = MTK_JPEG_INIT;
@@ -1752,11 +1753,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
-		mtk_jpeg_queue_src_chg_event(ctx);
+		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
+		mtk_jpeg_queue_src_chg_event(ctx);
 		goto getbuf_fail;
 	}
 
+	if (ctx->state == MTK_JPEG_SOURCE_CHANGE)
+		goto getbuf_fail;
+
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
-- 
2.46.0


