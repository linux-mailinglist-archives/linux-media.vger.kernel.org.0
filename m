Return-Path: <linux-media+bounces-63890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nkiOFeWcImrLawEAu9opvQ
	(envelope-from <linux-media+bounces-63890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:54:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A297964713E
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:54:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=jI0liIsN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63890-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63890-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CB6D30E55E3
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 09:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684733D9DA9;
	Fri,  5 Jun 2026 09:35:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793C3B71D0;
	Fri,  5 Jun 2026 09:35:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652145; cv=none; b=lwV2QjtejFQOpmEo/T4bujBmvgb2LU+a9CW756Z2hfrnEvqsXymOVXv9afmD1OzeLLI1dQXNudm0GedGtolt5j9KPzf4o+tAr35ebVpQe0hltRDl1IJW/x4JE+y1LF92y6BqJ0us4Kcl1VrcMJNVZj3HfceUrcthuQR96t5Gnr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652145; c=relaxed/simple;
	bh=U6oAvhVkLLzKrjDJ2TqR2RaxF1LGnJCGLwaU2tnBMFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/MlhXea0LCLfQjc7koQ8ShS94SCqCJHGslniOhdI9JxMACJmZh7mx1DzFjpDFvUj/6SXr+ZXeBQaAcJiswfo4R99Tr78cEY03iNumLRQTrFP2jQCNQmR/y3l1LvNZoK9j7H6TUa8bpgBQhK6lE6dKgO38EcO5xcXIRl5m/R26U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jI0liIsN; arc=none smtp.client-ip=210.61.82.184
X-UUID: e826f41460c111f18dc8c9802ae25ab1-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VZgTS7rEI41ZqKRGDaL/P235Fb6hS8ZnicHCq+gHCww=;
	b=jI0liIsNUm/MsutW2qA7pYtbKVqj3ztqoCCsJJIHZLyn7CQK6KKeuJVXpTcCfxumcyVB8hlXzA57fOOPsn4jcP9v5S3kMOxKY2XcfTwAasBv5O2k7liXMyzg7Um1EZuaSHz+VWtW+H22pQyXoVvz+snBYVHcrZlnOlBcmGJEcMI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:29826345-27d0-4031-afc5-d426233e7052,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:a6aa8503-5b7c-4de7-bc39-cc187eea3c57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e826f41460c111f18dc8c9802ae25ab1-20260605
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1429657200; Fri, 05 Jun 2026 17:35:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 17:35:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 17:35:34 +0800
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
Subject: [PATCH v7 2/6] media: mediatek: encoder: Add new platform data members
Date: Fri, 5 Jun 2026 17:35:14 +0800
Message-ID: <20260605093519.13695-3-irui.wang@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63890-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A297964713E

Add new platform data members to support different encoder ICs:
- venc_model_num: encoder model number
- fw_type: firmware type (VPU, SCP, or VCP)
- fw_init: firmware-specific initialization callback
- ipi_id: IPI ID for encoder communication

This centralizes all static platform configuration in the platform
data structure, eliminating the need for runtime device tree parsing
and the per-device fw_init callback pointer. Each platform's pdata
now directly specifies its firmware initialization function.

Changes:
1. Add venc_model_num to pdata and remove mtk_vcodec_enc_get_chip_name()
2. Add fw_type to pdata for each platform (VPU or SCP)
3. Add ipi_id field declaration to pdata
4. Remove device tree parsing for fw_type

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  3 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 22 +---------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 40 +++++++++++--------
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       | 10 ++++-
 4 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index a2e6a01272b2..9df64200d933 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -23,8 +23,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type t
 {
 	if (fw_use == ENCODER) {
 		struct mtk_vcodec_enc_dev *enc_dev = priv;
+		const struct mtk_vcodec_enc_pdata *pdata = enc_dev->venc_pdata;
 
-		return enc_dev->fw_init(priv, fw_use);
+		return pdata->fw_init(priv, fw_use);
 	}
 
 	if (fw_use == DECODER) {
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 48cb5dded70a..fcf0e4f90429 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -198,33 +198,15 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 			       pdata->num_output_formats);
 }
 
-static int mtk_vcodec_enc_get_chip_name(struct mtk_vcodec_enc_ctx *ctx)
-{
-	struct device *dev = &ctx->dev->plat_dev->dev;
-
-	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-enc"))
-		return 8173;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-enc"))
-		return 8183;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-enc"))
-		return 8192;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-enc"))
-		return 8195;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-enc"))
-		return 8188;
-	else
-		return 8173;
-}
-
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
+	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct device *dev = &ctx->dev->plat_dev->dev;
-	int platform_name = mtk_vcodec_enc_get_chip_name(ctx);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
+	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", pdata->venc_model_num);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index dc54d445d98d..5f1feb3b07a6 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -245,8 +245,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_enc_dev *dev;
 	struct video_device *vfd_enc;
-	phandle rproc_phandle;
-	enum mtk_vcodec_fw_type fw_type;
 	int ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -256,25 +254,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
-	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
-				  &rproc_phandle)) {
-		fw_type = VPU;
-		dev->fw_init = mtk_vcodec_fw_vpu_init;
-	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
-					 &rproc_phandle)) {
-		fw_type = SCP;
-		dev->fw_init = mtk_vcodec_fw_scp_init;
-	} else {
-		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
+	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
+	if (!dev->venc_pdata) {
+		dev_err(&pdev->dev, "Failed to get match data");
 		return -ENODEV;
 	}
-	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
-
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, ENCODER);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, dev->venc_pdata->fw_type, ENCODER);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+
 	ret = mtk_vcodec_init_enc_clk(dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "[MTK VCODEC] Failed to get mtk vcodec clock source!");
@@ -389,6 +379,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -396,9 +387,12 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 60000000,
 	.core_id = VENC_SYS,
+	.fw_type = VPU,
+	.fw_init = mtk_vcodec_fw_vpu_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -406,9 +400,12 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 9000000,
 	.core_id = VENC_LT_SYS,
+	.fw_type = VPU,
+	.fw_init = mtk_vcodec_fw_vpu_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.venc_model_num = 8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -417,9 +414,12 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
 	.core_id = VENC_SYS,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
+	.venc_model_num = 8188,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -429,9 +429,12 @@ static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
 	.max_bitrate = 50000000,
 	.core_id = VENC_SYS,
 	.uses_34bit = true,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.venc_model_num = 8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -440,9 +443,12 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
+	.venc_model_num = 8195,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -451,6 +457,8 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 934ff648125d..6c7e8da6d8ee 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -20,6 +20,7 @@
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
+ * @venc_model_num: encoder model number
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
@@ -29,8 +30,12 @@
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
+ * @fw_type: firmware type (VPU, SCP, or VCP)
+ * @fw_init: firmware-specific initialization callback
+ * @ipi_id: IPI ID for encoder communication with firmware
  */
 struct mtk_vcodec_enc_pdata {
+	u16 venc_model_num;
 	bool uses_ext;
 	u64 min_bitrate;
 	u64 max_bitrate;
@@ -40,6 +45,9 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_output_formats;
 	u8 core_id;
 	bool uses_34bit;
+	enum mtk_vcodec_fw_type fw_type;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
+	int ipi_id;
 };
 
 /*
@@ -174,7 +182,6 @@ struct mtk_vcodec_enc_ctx {
  * @venc_pdata: encoder IC-specific data
  *
  * @fw_handler: used to communicate with the firmware.
- * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @enc_mutex: encoder hardware lock.
@@ -202,7 +209,6 @@ struct mtk_vcodec_enc_dev {
 	const struct mtk_vcodec_enc_pdata *venc_pdata;
 
 	struct mtk_vcodec_fw *fw_handler;
-	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* encoder hardware mutex lock */
-- 
2.45.2


