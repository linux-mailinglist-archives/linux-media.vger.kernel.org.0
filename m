Return-Path: <linux-media+bounces-48024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5BBC9A81C
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8976B347441
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0AC3043C4;
	Tue,  2 Dec 2025 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CU/ZyuE+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275AF30214D;
	Tue,  2 Dec 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661259; cv=none; b=exvTn0wFOmzUaFYGi0/uUxOzlJGlxDc2XLtzdDgOM10vYO2mTh4uDEf32NTNjkGYt0upKuozkWNYQKu8SLAqOFvjDxpyYs54o6MCeCrDCVajSqHLzojK+cFpGk4U2NFOATGriHzdi0M3p67IvkYcWLFeTaZv5Nw2PBgAyJZPqFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661259; c=relaxed/simple;
	bh=/az81KtHNpUxts0OL6EmiNVDLhVDJGLbMj5FwdIIQJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQuL4pXooz1LC2JUUWMNwu0Tvpks6zJ4A7/1fci04Bwt3/AG3SjSA8tfV8cq3wTgaE/AU2GNGx7Q1/81Zg9oB9Lah5vIHunwh+51mJAag75DnB+IDzObAxlYO0uOI+b139OF7/fsWDhuW1hDNYfZeIrH1SiWt93fHI4cMdFRZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CU/ZyuE+; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 392a9adecf5211f0b2bf0b349165d6e0-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y6Kxm3fUAH9oznx9fYORyrdkAAWiZI2Q/C4JHmLerrI=;
	b=CU/ZyuE+HnezbekpS2gODgQw+2kZJ/knvWgdxXTzrnP5HxqbXqNshb8hrjjRX/7Ta60JDEiGMPYBHPfJ9x/YVKaLiQHVD5nWQ/QZCKpnLckMOTuCa/EObW5Dd+qtoIRdN/3zgnvyCLq8CnZlz9AA/wVVaCbj42nWKWa3hKJsj1g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:86c42a1f-18ca-4093-9335-92b0be8a6f3f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8dbfbaa9-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 392a9adecf5211f0b2bf0b349165d6e0-20251202
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1043743944; Tue, 02 Dec 2025 15:40:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 15:40:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 15:40:43 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v6 02/10] media: mediatek: decoder: Add a new platform data member
Date: Tue, 2 Dec 2025 15:40:29 +0800
Message-ID: <20251202074038.3173-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251202074038.3173-1-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add a new platform data member to indicate each decoder IC
to avoid the chip name definition keep growing.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  35 +----
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  15 +-
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 137 +++++++++++++++---
 6 files changed, 131 insertions(+), 64 deletions(-)

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
index 6fb05bb00641..d7a269045fd6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -331,24 +331,7 @@ static const struct v4l2_file_operations mtk_vcodec_fops = {
 
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
@@ -367,10 +350,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 
 	mtk_vcodec_dec_get_chip_name(dev);
-	if (dev->chip_name == MTK_VDEC_INVAL) {
-		dev_err(&pdev->dev, "Failed to get decoder chip name");
-		return -EINVAL;
-	}
 
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
@@ -387,7 +366,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
-	if (dev->chip_name == MTK_VDEC_MT8196) {
+	if (dev->chip_name == 8196) {
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
@@ -556,23 +535,23 @@ static const struct of_device_id mtk_vcodec_match[] = {
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
index 429b32952194..2dbde8d00e6f 100644
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
index c1cef78471a9..d249a8774948 100644
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
@@ -906,6 +907,78 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8188,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8192,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8195,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_name = 8196,
+};
+
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
@@ -922,3 +995,21 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_name = 8186,
+};
-- 
2.45.2


