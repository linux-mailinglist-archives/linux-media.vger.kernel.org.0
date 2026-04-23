Return-Path: <linux-media+bounces-59363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDhZBJbL6WkKkgIAu9opvQ
	(envelope-from <linux-media+bounces-59363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:34:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4044E03B
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 013713033398
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7EA311968;
	Thu, 23 Apr 2026 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iKBL06Tf"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E72FE057;
	Thu, 23 Apr 2026 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929651; cv=none; b=dTr2sA16ZnDxx8KYW+Q8B0Jfh3KTtP+s+F4C1nwyrt4Av4WpB1oSe+QjO+2G5YYoi5MHELbA+iINAFCzwdSHNcNJRcve/81Vx3oe6l621Fc8wvHvy63bCm4mHjxHrcN48WQ5734k4MSfwInHFPlVuAwVQCDCRru2XqbNMERpOqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929651; c=relaxed/simple;
	bh=XjtH9UaKNXUEw2WLmJ+ej294qEzpO0nL7e2PohsdWUo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2uYNRUZfBEORvxxfJhGGC61o2x/NZjEZ0VM46qaP8y0zjCuk25VV/7PPKeCnVfDDIqHSSi8P130Y3iX/Ix+C/lgpQKcAzvoswM10mhF7nV1NqUUokpKr8DeNDoU/Q0r/wY8ZdgTYQ1qZLjBXS/U+CIoh0fqwJT9feAQxV66eoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iKBL06Tf; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cbd3c5323ee611f19a16598d5ca7f8ec-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EqTcbhfqO9Fl0LIzueqOlkh4bfPzPS/ZebY5V5Vzsy4=;
	b=iKBL06TfnO0iApKcR8yNnQT8oheV4yDCUM0oVQLL+mViT0YzAQIAc72ySHvKrkl0Iraxj4qHC8Mgjwj0E5fy8bgtMPwytMXdpBhymIuAeRseqMy2s45IU7qshDaOwGk+V9YewS5rQzahCOrLedGJzyDL8MaPyGsgJOnysY1p8ys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b52f648d-7940-4036-97b1-1391d88b32d5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:e7bac3a,CLOUDID:ae577c64-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cbd3c5323ee611f19a16598d5ca7f8ec-20260423
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1671307729; Thu, 23 Apr 2026 15:34:00 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 15:33:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 15:33:58 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 6/6] media: mediatek: encoder: Add MT8196 encoder compatible data
Date: Thu, 23 Apr 2026 15:33:43 +0800
Message-ID: <20260423073345.27402-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260423073345.27402-1-irui.wang@mediatek.com>
References: <20260423073345.27402-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59363-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,collabora.com,mediatek.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82D4044E03B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MT8196 encoder use common firmware interface, add compatible data to
support MT8196 encoding, and need set dma mask to support 34bit.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 19 +++++++++++++++++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 7b644f55963b..d7328d013ff6 100644
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
@@ -309,6 +311,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
+	if (dev->venc_pdata->set_dma_bit_mask)
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(VENC_DMA_BIT_MASK));
+
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->dev_ctx_lock);
@@ -460,6 +465,19 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
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
@@ -469,6 +487,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8188-vcodec-enc", .data = &mt8188_pdata},
 	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{.compatible = "mediatek,mt8195-vcodec-enc", .data = &mt8195_pdata},
+	{.compatible = "mediatek,mt8196-vcodec-enc", .data = &mt8196_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 769fb5009964..475953d39aa4 100644
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


