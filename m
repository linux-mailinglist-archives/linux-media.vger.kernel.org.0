Return-Path: <linux-media+bounces-51600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMouEMImeGl7oQEAu9opvQ
	(envelope-from <linux-media+bounces-51600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 03:45:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A87728F26C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 03:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2791A3056156
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 02:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907712F12B7;
	Tue, 27 Jan 2026 02:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aq9CZtNb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2892D8DB8;
	Tue, 27 Jan 2026 02:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481795; cv=none; b=ZFi60eOYdKN5Xi0AkV6aXMjQFtxjHLT9+Jm3lZ7yfOpyf1QJayUrlXoZ/7+DQKdzxFImhjJd92weWAr3U1T4h0WLUzaa+2pHo/dtoFIvCEFZ7+mQgs4595RUWMffiXBmh72TfJ2pTJx12Ih5TTrlRMO9R7mje8qwWl3x3ijT3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481795; c=relaxed/simple;
	bh=lQ0FUOuCTM4q5Pson6nbfsONcwW6KmgDFo3oLLiSwA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tFH88HsT4j+ugKC+5Mzu1qBoTVztzh9rt8UB0CboubVp4F9HjQUFCgp5CoqoPdwDyfSSwX0HLtoxxP3FLJ86QZ6VQCzQ84J54QtdWPKR9g5/t1TGTzKuaUm/CtD2hF/g3IQFNTYKj/1A52WcN4uuO7kiVKcIUYXNeqIa7NwZK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aq9CZtNb; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e7bb04b4fb2911f0b7fc4fdb8733b2bc-20260127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dQcVjrfEpNTNZinT8znfZS+7c0XLfiXstl2xVt4MpZc=;
	b=aq9CZtNbdSlG4k+6P37hsI5+FVbbrVlCtjeD3Wl6ngUXAqi4hmJsOKa37huRKMTuXU9jKgtIyyfIpTG/9IFDg12SklrV2rDhgNGxj/glY3kuM9j3yJS9GB9FPB0vgzRJ96F4wezTxt2Q35FXzI5zObLQzI/O5Jp+erOnQWzWoV0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:443f5b6f-7434-4ad6-8082-5db7dda4821c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:5506417a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e7bb04b4fb2911f0b7fc4fdb8733b2bc-20260127
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1139541392; Tue, 27 Jan 2026 10:43:04 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 27 Jan 2026 10:43:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 27 Jan 2026 10:43:02 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v7 02/10] media: mediatek: decoder: Add a new platform data member
Date: Tue, 27 Jan 2026 10:42:39 +0800
Message-ID: <20260127024248.18406-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260127024248.18406-1-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51600-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email,mediatek.com:dkim,mediatek.com:mid]
X-Rspamd-Queue-Id: A87728F26C
X-Rspamd-Action: no action

Add a new platform data member to indicate each decoder IC
to avoid the chip name definition keep growing.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |  5 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       | 35 ++-----
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       | 15 +--
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 92 ++++++++++++++-----
 6 files changed, 86 insertions(+), 64 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
index 1af075fc0194..80cb46f1cded 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
@@ -69,6 +69,11 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 7ed40936a0e8..c7af48f684c5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -333,24 +333,7 @@ static const struct v4l2_file_operations mtk_vcodec_fops = {
 
 static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
 {
-	struct device *dev = &vdec_dev->plat_dev->dev;
-
-	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8173;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8183;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8192;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8195;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8186;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8188;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8196;
-	else
-		vdec_dev->chip_name = MTK_VDEC_INVAL;
+	vdec_dev->chip_name = vdec_dev->vdec_pdata->chip_name;
 }
 
 static int mtk_vcodec_probe(struct platform_device *pdev)
@@ -369,10 +352,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 
 	mtk_vcodec_dec_get_chip_name(dev);
-	if (dev->chip_name == MTK_VDEC_INVAL) {
-		dev_err(&pdev->dev, "Failed to get decoder chip name");
-		return -EINVAL;
-	}
 
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
@@ -389,7 +368,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
-	if (dev->chip_name == MTK_VDEC_MT8196) {
+	if (dev->chip_name == 8196) {
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
@@ -558,23 +537,23 @@ static const struct of_device_id mtk_vcodec_match[] = {
 	},
 	{
 		.compatible = "mediatek,mt8192-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8192_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8186-vcodec-dec",
-		.data = &mtk_vdec_single_core_pdata,
+		.data = &mtk_vdec_8186_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8195-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8195_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8188-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8188_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8196-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8196_pdata,
 	},
 	{},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 1cb77619add9..bb293ada6fb2 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -19,17 +19,6 @@
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
 #define IS_VDEC_SUPPORT_EXT(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EXT)
 
-enum mtk_vcodec_dec_chip_name {
-	MTK_VDEC_INVAL = 0,
-	MTK_VDEC_MT8173 = 8173,
-	MTK_VDEC_MT8183 = 8183,
-	MTK_VDEC_MT8186 = 8186,
-	MTK_VDEC_MT8188 = 8188,
-	MTK_VDEC_MT8192 = 8192,
-	MTK_VDEC_MT8195 = 8195,
-	MTK_VDEC_MT8196 = 8196,
-};
-
 /*
  * enum mtk_vdec_format_types - Structure used to get supported
  *		  format types according to decoder capability
@@ -106,6 +95,7 @@ struct vdec_pic_info {
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
+ * @chip_name: platforms configuration values
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -127,6 +117,7 @@ struct mtk_vcodec_dec_pdata {
 
 	bool is_subdev_supported;
 	bool uses_stateless_api;
+	unsigned int chip_name;
 };
 
 /**
@@ -307,7 +298,7 @@ struct mtk_vcodec_dec_dev {
 	struct mutex dec_racing_info_mutex;
 	struct mtk_vcodec_dbgfs dbgfs;
 
-	enum mtk_vcodec_dec_chip_name chip_name;
+	unsigned int chip_name;
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index e4e527fe54dc..a926dc14d39d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -76,7 +76,7 @@ static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
 {
 	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
 
-	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+	if (dev->main_dev->chip_name != 8196)
 		return;
 
 	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..8ddb61670dc6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -618,4 +618,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_name = 8173,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index c1cef78471a9..0745bc3ee490 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -550,16 +550,16 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
 	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8192:
-	case MTK_VDEC_MT8188:
+	case 8192:
+	case 8188:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
 		break;
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
 		break;
-	case MTK_VDEC_MT8183:
-	case MTK_VDEC_MT8186:
+	case 8183:
+	case 8186:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
 		break;
 	default:
@@ -572,9 +572,9 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
 	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
 		break;
 	default:
@@ -587,11 +587,11 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
 	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
+	case 8188:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
 		break;
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
 		break;
 	default:
@@ -604,9 +604,9 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
 	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
 		break;
 	default:
@@ -619,15 +619,15 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
 	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8192:
-	case MTK_VDEC_MT8188:
+	case 8192:
+	case 8188:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
 		break;
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
 		break;
-	case MTK_VDEC_MT8186:
+	case 8186:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
 		break;
 	default:
@@ -640,9 +640,9 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
 	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
 		break;
 	default:
@@ -886,6 +886,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_name = 8183,
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -906,6 +907,45 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+#define MTK_STATELESS_DEC_DATA \
+	.init_vdec_params = mtk_init_vdec_params, \
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup, \
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops, \
+	.vdec_formats = mtk_video_formats, \
+	.num_formats = &num_formats, \
+	.default_out_fmt = &default_out_format, \
+	.default_cap_fmt = &default_cap_format, \
+	.uses_stateless_api = true, \
+	.worker = mtk_vdec_worker, \
+	.flush_decoder = mtk_vdec_flush_decoder, \
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp, \
+	.get_cap_buffer = vdec_get_cap_buffer, \
+	.is_subdev_supported = true
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8188,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8192,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8195,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8196,
+};
+
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
@@ -922,3 +962,9 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_name = 8186,
+};
-- 
2.45.2


