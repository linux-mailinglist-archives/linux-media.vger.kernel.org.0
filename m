Return-Path: <linux-media+bounces-63893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jOZjJMeZImr/agEAu9opvQ
	(envelope-from <linux-media+bounces-63893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:41:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4151A646F2A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:41:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=Lu8ohuBt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63893-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63893-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0829B3069F2E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2634C3E3DAF;
	Fri,  5 Jun 2026 09:35:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21F3D9DB9;
	Fri,  5 Jun 2026 09:35:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652148; cv=none; b=r5qBkypNpv99ZBEwi6e0VJN1iaunIvPzAhGJxhKHY6VDQ5LRdTCMzqMzSTnaJdH3xlTnBKHnGzT7Zw4CJQsyhbV7X1hXjvJxgGYzkU5XLzwRZLHts6QcUyn9joXcI9x8hzxrCG6dBWB2EvRkgpUnGnx8R4jl1eLB220xQSMaGIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652148; c=relaxed/simple;
	bh=mCc6QWEsUUXASeDU6iAQveVIbQvPxdY1EiMWUfGtSU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fc4fPpSj3a7FfnT6uPVAnb4Did2HtnUWIhx5b+6Z3+giFY2Ae/e32SXpWCUEc41GeYpaV9uILJIV9nRs+G10lKwbUtDoLIyW4S1zsdNsfCMyrwSh/+RilSZl+uVVtSzquxFzxxmPdX/m3/vVfNO8ySHIIVplD7Saz2/UPo6w6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Lu8ohuBt; arc=none smtp.client-ip=210.61.82.184
X-UUID: ead6accc60c111f18dc8c9802ae25ab1-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=C1I5Z16CZKuV8AfZRvYqbgqVxI+Ku9jR+lC7PC+UB8U=;
	b=Lu8ohuBtvR1xwVsgndEEva5ZSXHW8BbB2QsS74w7rUuZ+k/9Gq99tzY5BshKupCH5WK7UoAS8EFPr8gcV/PpbJ0/KSIp2MRArxnqK+TXtslzxgM12EfI7aTQmki+Rm2ZN494+bKizn5/pT2QYM1+FDo7KBMCDLB115asCjLfKvM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:e0a68141-9d01-46d2-b3cb-632b7ebbaf11,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:cfdd542a-13d2-4d29-83ea-b8014339a000,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ead6accc60c111f18dc8c9802ae25ab1-20260605
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1702566548; Fri, 05 Jun 2026 17:35:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 17:35:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 17:35:38 +0800
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
Subject: [PATCH v7 6/6] media: mediatek: encoder: Add MT8196 encoder compatible data
Date: Fri, 5 Jun 2026 17:35:18 +0800
Message-ID: <20260605093519.13695-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260605093519.13695-1-irui.wang@mediatek.com>
References: <20260605093519.13695-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63893-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh+dt@kernel.org,m:matthias.bgg@gmail.com,m:krzk+dt@kernel.org,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:tiffany.lin@mediatek.com,m:kyrie.wu@mediatek.com,m:yunfei.dong@mediatek.com,m:maoguang.meng@mediatek.com,m:longfei.wang@mediatek.com,m:irui.wang@mediatek.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:robh@kernel.org,m:matthiasbgg@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4151A646F2A

MT8196 encoder use common firmware interface, add compatible data to
support MT8196 encoding, and need set dma mask to support 34bit.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 22 +++++++++++++++++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 5f1feb3b07a6..bc6dfb564026 100644
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
@@ -298,6 +300,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
+	if (dev->venc_pdata->set_dma_bit_mask)
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(VENC_DMA_BIT_MASK));
+
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->dev_ctx_lock);
@@ -461,6 +466,22 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.fw_init = mtk_vcodec_fw_scp_init,
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
+	.fw_type = VCP,
+	.fw_init = mtk_vcodec_fw_vcp_init,
+	.ipi_id = VCP_IPI_ENCODER,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc",
 			.data = &mt8173_avc_pdata},
@@ -470,6 +491,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8188-vcodec-enc", .data = &mt8188_pdata},
 	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{.compatible = "mediatek,mt8195-vcodec-enc", .data = &mt8195_pdata},
+	{.compatible = "mediatek,mt8196-vcodec-enc", .data = &mt8196_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 8a69168c350e..1aad27008ce6 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -32,6 +32,7 @@
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
  * @uses_common_fw_iface: whether the encoder uses common driver interface
+ * @set_dma_bit_mask: whether the encoder need set extra DMA bit mask
  * @fw_type: firmware type (VPU, SCP, or VCP)
  * @fw_init: firmware-specific initialization callback
  * @ipi_id: IPI ID for encoder communication with firmware
@@ -48,6 +49,7 @@ struct mtk_vcodec_enc_pdata {
 	u8 core_id;
 	bool uses_34bit;
 	bool uses_common_fw_iface;
+	bool set_dma_bit_mask;
 	enum mtk_vcodec_fw_type fw_type;
 	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	int ipi_id;
-- 
2.45.2


