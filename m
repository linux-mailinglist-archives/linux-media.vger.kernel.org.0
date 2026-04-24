Return-Path: <linux-media+bounces-59458-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJdAN/7e6mkNFAAAu9opvQ
	(envelope-from <linux-media+bounces-59458-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:09:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C783459585
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B360C303C638
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 03:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2143F35898;
	Fri, 24 Apr 2026 03:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K620zR0T"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2189231AA87;
	Fri, 24 Apr 2026 03:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776999946; cv=none; b=e7UWP+Pf4FVyKb0WJ1hpgJGymm8Ne+icvsIxwkLHNqIHbW24Sppr7bxnLrmix+xOZw9IG52pFK0lkNO647NepTCBIk3coQZqblhMdiA+aVVize3AzqH1639uWvM3AlbDwK6UVDnQfRKcVl2ROjsqmx6L70sNhDZWByZJreiISsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776999946; c=relaxed/simple;
	bh=hWZ9SOeEwcSHxdQS6qTLqFXgct3KF/nSoKKcBUnd6VQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEUI7YK1kMG1x2ijeiLlAe7MIIlSxmb1x5AijCLx+lWY5MZj/nuDGEoI1CRib5gJnN2p6WcetHC1Thj8cMeyQu1l10EglO1W4J2h2TLWLHCYA2axpOcxeWZl3/Hf1r+NT/AcgDfYNvUk5kG8RkpRbPQe8mrKWdKjihCMTMjuJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=K620zR0T; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 76fdbcda3f8a11f19781c1a04af40193-20260424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yAXrdupkuSVERovQ8wGJ213SL8rS7SkIUkd7HGZC1I8=;
	b=K620zR0TE2+5P86JJ/64j7rHDtrT3OISHWdunEtCk/7H8/ygGqEBT2dEsPSfWb4huSZ26st7zlcTx/Ld5y4L41YjwzszWk9GnCBMWzIIR5vgFdHEkcjoLgNCXOj6V9LV5zQ/XNw7AlTVmMNe/nNsBZEC2P3QQLVu5QA3zKgq5SI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c2a53db8-c732-4b83-aaed-c7e67a9eb7c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:2827d48f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76fdbcda3f8a11f19781c1a04af40193-20260424
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1842863835; Fri, 24 Apr 2026 11:05:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Apr 2026 11:05:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Apr 2026 11:05:33 +0800
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
Subject: [PATCH v9 2/9] media: mediatek: decoder: Add a new platform data member
Date: Fri, 24 Apr 2026 11:05:20 +0800
Message-ID: <20260424030527.10656-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260424030527.10656-1-kyrie.wu@mediatek.com>
References: <20260424030527.10656-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Queue-Id: 4C783459585
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59458-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Move the chip model information into the codec match data
and remove the second compatible matching code.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  39 ++-----
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  17 +--
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 104 +++++++++++++-----
 7 files changed, 96 insertions(+), 74 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..13d70acda88b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -263,7 +263,7 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", ctx->dev->chip_name);
+	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", ctx->dev->chip_model);
 
 	return 0;
 }
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
index e7c140b26955..6ebd82ba8d23 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -331,26 +331,9 @@ static const struct v4l2_file_operations mtk_vcodec_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
+static void mtk_vcodec_dec_get_chip_model(struct mtk_vcodec_dec_dev *vdec_dev)
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
+	vdec_dev->chip_model = vdec_dev->vdec_pdata->chip_model;
 }
 
 static int mtk_vcodec_probe(struct platform_device *pdev)
@@ -368,11 +351,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
-	mtk_vcodec_dec_get_chip_name(dev);
-	if (dev->chip_name == MTK_VDEC_INVAL) {
-		dev_err(&pdev->dev, "Failed to get decoder chip name");
-		return -EINVAL;
-	}
+	mtk_vcodec_dec_get_chip_model(dev);
 
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
@@ -389,7 +368,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
-	if (dev->chip_name == MTK_VDEC_MT8196) {
+	if (dev->chip_model == 8196) {
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
index f06dfc1a3455..7921588bf814 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -21,17 +21,6 @@
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
@@ -108,6 +97,7 @@ struct vdec_pic_info {
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
+ * @chip_model: platforms configuration values
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -129,6 +119,7 @@ struct mtk_vcodec_dec_pdata {
 
 	bool is_subdev_supported;
 	bool uses_stateless_api;
+	unsigned int chip_model;
 };
 
 /**
@@ -276,7 +267,7 @@ struct mtk_vcodec_dec_ctx {
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
  * @dbgfs: debug log related information
  *
- * @chip_name: used to distinguish platforms and select the correct codec configuration values
+ * @chip_model: used to distinguish platforms and select the correct codec configuration values
  */
 struct mtk_vcodec_dec_dev {
 	struct v4l2_device v4l2_dev;
@@ -319,7 +310,7 @@ struct mtk_vcodec_dec_dev {
 	struct mutex dec_racing_info_mutex;
 	struct mtk_vcodec_dbgfs dbgfs;
 
-	enum mtk_vcodec_dec_chip_name chip_name;
+	unsigned int chip_model;
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index e4e527fe54dc..149f1ad58152 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -76,7 +76,7 @@ static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
 {
 	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
 
-	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+	if (dev->main_dev->chip_model != 8196)
 		return;
 
 	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..0e702d6a43ed 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -618,4 +618,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8173,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 472ece5713a5..5ecbfc169805 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -571,17 +571,17 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8192:
-	case MTK_VDEC_MT8188:
+	switch (ctx->dev->chip_model) {
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
@@ -593,10 +593,10 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	switch (ctx->dev->chip_model) {
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
 		break;
 	default:
@@ -608,12 +608,12 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
+	switch (ctx->dev->chip_model) {
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
@@ -625,10 +625,10 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	switch (ctx->dev->chip_model) {
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
 		break;
 	default:
@@ -640,16 +640,16 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8192:
-	case MTK_VDEC_MT8188:
+	switch (ctx->dev->chip_model) {
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
@@ -661,10 +661,10 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	switch (ctx->dev->chip_model) {
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
 		break;
 	default:
@@ -935,6 +935,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8183,
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -955,6 +956,45 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
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
+	.chip_model = 8188,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8192,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8195,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8196,
+};
+
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
@@ -971,3 +1011,9 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8186,
+};
-- 
2.45.2


