Return-Path: <linux-media+bounces-59460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHowLh3f6mkNFAAAu9opvQ
	(envelope-from <linux-media+bounces-59460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:10:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 601644595AA
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02DB13045A91
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 03:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B319F320CCC;
	Fri, 24 Apr 2026 03:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HoXBvwVb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962153093DD;
	Fri, 24 Apr 2026 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776999947; cv=none; b=tSuNPcn/aAeLLK0oXuIgAsSuOxQwhubCtBMVuxDy+hsmGeETybPGVuEHFSASIy6Ecn8h98YZviBjSpxpwPkqFSO2I7YSpuxZT9ZKdEl30pCE6Ouz1JVAcfs3o9b12XdXuFnb6e6rA6EL3zdeTBKljXC9MEqtHlh59aETtUQov9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776999947; c=relaxed/simple;
	bh=SINNr/9PQVWmohqEQcl0q3MmRdpabubASIYNha9MW+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hwofd3lrhQidqciOWpK162aLpIyf/2RfnLdQGk2pq6b5odaw4GaFz7ken2GCBT+Nxnvj3C94udslUYvcl40yTW8hYbqygs8KcgHeizbkPACFZRVs5JnRO0cSn8RQsbkLqOZkoc4Jm85qPerVBj12SVgc9GhaL3YjU0yNPmfVHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HoXBvwVb; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 778871cc3f8a11f19a16598d5ca7f8ec-20260424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zWxKExStOAZc57km/2fM7Wk/MBk+KqJmr+NV+wNKQG0=;
	b=HoXBvwVbxLMmR9eUHYNya1q100hf3US7rqbqpPhxTL1ysYtDuU3X46nGhK2YLOUKg46yNm0w77h+d5KQq0jiP3TfaL1KuOrY9A5llv+ogAb2xeaObh4CBkkR6s4ThYZ+51mYeRo4W6R9bDm8sv6gWKb2pA3q4L8BCDJWi3Z7dmM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1ebbbfaf-7d5b-4a8b-8065-1374fd4b67fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:17fa8664-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 778871cc3f8a11f19a16598d5ca7f8ec-20260424
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 669890939; Fri, 24 Apr 2026 11:05:36 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Apr 2026 11:05:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Apr 2026 11:05:34 +0800
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
Subject: [PATCH v9 3/9] media: mediatek: vcodec: Refactor Decoder profile & level Handling
Date: Fri, 24 Apr 2026 11:05:21 +0800
Message-ID: <20260424030527.10656-4-kyrie.wu@mediatek.com>
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
X-Rspamd-Queue-Id: 601644595AA
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
	TAGGED_FROM(0.00)[bounces-59460-lists,linux-media=lfdr.de];
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

This commit refactors the handling of decoder parameters for H264,
H265, and VP9 codecs by introducing a new structure to standardize
supported level and profile information. By leveraging this change,
chipset-specific conditional logic in the codec configuration
functions is significantly reduced.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  12 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 165 ++++++++++--------
 3 files changed, 118 insertions(+), 75 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 7921588bf814..4ffc0eae855b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -78,6 +78,16 @@ struct vdec_pic_info {
 	unsigned int reserved;
 };
 
+/**
+ * struct mtk_vcodec_dec_params - decoder supported parameters
+ * @level: decoder supported vcodec level
+ * @profile: decoder supported vcodec profile
+ */
+struct mtk_vcodec_dec_params {
+	s64 level;
+	s64 profile;
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -98,6 +108,9 @@ struct vdec_pic_info {
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  * @chip_model: platforms configuration values
+ * @h264_params: H264 decoder default supported params
+ * @h265_params: H265 decoder default supported params
+ * @vp9_params: VP9 decoder default supported params
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -120,6 +133,9 @@ struct mtk_vcodec_dec_pdata {
 	bool is_subdev_supported;
 	bool uses_stateless_api;
 	unsigned int chip_model;
+	struct mtk_vcodec_dec_params h264_params;
+	struct mtk_vcodec_dec_params h265_params;
+	struct mtk_vcodec_dec_params vp9_params;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 0e702d6a43ed..64f32976d15e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_model = 8173,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 5ecbfc169805..efcd28f5f289 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -571,106 +571,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
-		break;
-	case 8183:
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
-		break;
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.level;
 }
 
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.profile;
 }
 
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
@@ -936,6 +879,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_model = 8183,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -975,24 +930,72 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8188,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8192,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8195,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8196,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
@@ -1016,4 +1019,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_model = 8186,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
-- 
2.45.2


