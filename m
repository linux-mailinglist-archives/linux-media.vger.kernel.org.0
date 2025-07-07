Return-Path: <linux-media+bounces-36956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE7AFAD38
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CBD83BC0AC
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B0828D8F3;
	Mon,  7 Jul 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CfNKzqQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3160D28B7DA;
	Mon,  7 Jul 2025 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873524; cv=none; b=mM5p7f43V6ApIwPjd1/1INCWPhMlucltjEljcWS8m43fkNceYcKf65KQLX0f7VFjEqoSzaqRRR4z94p2sX77Ss1VFW75c6G+t1oHlKpdwhKktPB6gVc3sHY6pRKTvbzOViN/1N7cxpY0T+rpIgwrcI9MtpOEb0ULs0V1DMWfLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873524; c=relaxed/simple;
	bh=Opo7ilkRBOQRFZ+jcQUu8mWf5CBuQ8G864eVO+ghdAY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRMQKHSf1Pnk/6dVxBuaqeSmUTZ8UD40cXvGCPmlfA8BC7Icwr/y5Y9J13PnRgxjyixfPQn6U2MdBI/o0IKBOI+IAJeQyOME5nhNbvdzkODpQc7Q0EP/yjECE4VH6Vov0qFWs1NSFwFVS1SZGHPnqFchufSkfNwlj3pOUf5Ucaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CfNKzqQ6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 75d67e7a5b0411f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=VZCtLyXPc2m2TADyxto1VVqsi3yS899X49n1vl0UHL0=;
	b=CfNKzqQ6Cw570o2ABJEch7z1rLTz/J+ZfVnLh738e9qKClF/lHrVPMeflOsUsVFxyNJuBgjcY2JKm5WLVUD90AsYhXQ0riQCJhfUdaUQ9tSjVCsApP8KC/TOhjCxThYVn19WtQAm7mdoNfQjtIMA3MmDO2vYXLex1i5vj3eHmTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:99f9611e-5612-4413-b71f-dc664da44dfb,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:1153cb9c-b8a9-480a-b7e5-687022facff7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75d67e7a5b0411f0b1510d84776b8c0b-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 184836451; Mon, 07 Jul 2025 15:31:56 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 15:31:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 15:31:54 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v7 07/12] media: mediatek: jpeg: fix decoding resolution change operation
Date: Mon, 7 Jul 2025 15:31:40 +0800
Message-ID: <20250707073146.3581-8-kyrie.wu@mediatek.com>
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

1.add a judgement for src buffer to avoid kernel crash
in the stop streaming function;
2.When a resolution changing occurs, it needs to set new
resolution parameter immediately and then report this event.
Otherwise, if the original software process is maintained,
the resolution change event is reported firstly, the CPU is
dispatched to the app to process the event, and the driver
does not set a new resolution, which will cause parameter errors.
3.After a resolution change occurred, decoding should not continue,
needs to wait until new buffers are ready and the state machine
changed.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 3fc344d05528..e8d11fb3d330 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -887,7 +887,8 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 
 		vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 		src_buf = mtk_jpeg_vb2_to_srcbuf(&vb->vb2_buf);
-		mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
+		if (!IS_ERR_OR_NULL(src_buf))
+			mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
 		ctx->state = MTK_JPEG_RUNNING;
 	} else if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		ctx->state = MTK_JPEG_INIT;
@@ -1750,11 +1751,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
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


