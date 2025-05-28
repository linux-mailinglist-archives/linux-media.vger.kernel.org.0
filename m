Return-Path: <linux-media+bounces-33496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE77AC6209
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 08:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C10203AEF43
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 06:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F0A246765;
	Wed, 28 May 2025 06:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jblcgATn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046A229B1C;
	Wed, 28 May 2025 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748414215; cv=none; b=ZiLhS4oGqxfarOBTCauYJl0H6briSQiSXhVtdHrdiBqccLrIvQtUkjmTxVccs//SjHcamuDu+erAZx4cexLtuonOoIZ3pdmswLySsKnBXdY5z87sz/O7IWW6yIWrRu7g5kXhqAhDGLCQhh7ZpkPgeBD755iWnhqXGIrdGMXu0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748414215; c=relaxed/simple;
	bh=35GYQjavQGlJRckCxuoPoAMaWd/SOx57Du1/51RhsPo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DoM1yCFH2k+oXAK5m+dEA4i4ZalIsdOu9rmPXNU3D8mmez4YAANTqluWIRnrUnc+KNnpKh/70x7RokXJ6BGLcxpxnz5UFQ6zLUEUKvezzrCGm87/IJTUfUT6NxTwvOzXhNgEEkacf4fp5Zki+GsXaLhpeOttlpbYEsewWy0ga+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jblcgATn; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2161c5603b8e11f0813e4fe1310efc19-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zgl5wOzqoA949rZ3T5Z9iviu+Wk5UKqm1QyNzhdR49U=;
	b=jblcgATn95RH2pBvpLqnUzYhIyvYeKLj2aPVJVEpBEa89rMkhhXwDhLJMrTAixFA5LuJWwXJ3XypmI5+fun12XiXHB1Msd+C0y9MJtNTGVY3XpFeEbUhY+9aysYR405Hs2mmS4HCluNaHT77I3ZpStOFiw34U1hVepU0hnyHsBk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9bf694ec-ea87-4c73-b8f7-3d16a76a94d1,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:ac5c3259-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2161c5603b8e11f0813e4fe1310efc19-20250528
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1869768534; Wed, 28 May 2025 14:36:47 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 14:36:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 14:36:45 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2 6/6] media: mediatek: encoder: Add MT8196 encoder compatible data
Date: Wed, 28 May 2025 14:36:32 +0800
Message-ID: <20250528063633.14054-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250528063633.14054-1-irui.wang@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

MT8196 encoder use common firmware interface, add compatible data to
support MT8196 encoding, and need set dma mask to support 34bit.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 19 +++++++++++++++++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 50936949d527..c869c4245ebc 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -20,6 +20,8 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "../common/mtk_vcodec_intr.h"
 
+#define VENC_DMA_BIT_MASK 34
+
 static const struct mtk_video_fmt mtk_video_formats_output[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
@@ -299,6 +301,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
+	if (dev->venc_pdata->set_dma_bit_mask)
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(VENC_DMA_BIT_MASK));
+
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
 	mutex_init(&dev->dev_ctx_lock);
@@ -450,6 +455,19 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.core_id = VENC_SYS,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8196_pdata = {
+	.venc_model_num = 8196,
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
+	.min_bitrate = 64,
+	.max_bitrate = 100000000,
+	.core_id = VENC_SYS,
+	.uses_common_fw_iface = true,
+	.set_dma_bit_mask = true,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc",
 			.data = &mt8173_avc_pdata},
@@ -459,6 +477,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8188-vcodec-enc", .data = &mt8188_pdata},
 	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{.compatible = "mediatek,mt8195-vcodec-enc", .data = &mt8195_pdata},
+	{.compatible = "mediatek,mt8196-vcodec-enc", .data = &mt8196_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index b3206a7b592d..ded794f1b37a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -32,6 +32,7 @@
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
  * @uses_common_fw_iface: whether the encoder uses common driver interface
+ * @set_dma_bit_mask: whether the encoder need set extra DMA bit mask
  */
 struct mtk_vcodec_enc_pdata {
 	u16 venc_model_num;
@@ -45,6 +46,7 @@ struct mtk_vcodec_enc_pdata {
 	u8 core_id;
 	bool uses_34bit;
 	bool uses_common_fw_iface;
+	bool set_dma_bit_mask;
 };
 
 /*
-- 
2.45.2


