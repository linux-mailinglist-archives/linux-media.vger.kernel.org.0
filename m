Return-Path: <linux-media+bounces-51598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME0cNJ4meGl7oQEAu9opvQ
	(envelope-from <linux-media+bounces-51598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 03:44:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386458F22C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 03:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8609D304C7D1
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 02:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AF62D77E6;
	Tue, 27 Jan 2026 02:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GjI0LQEM"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0052E540C;
	Tue, 27 Jan 2026 02:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481794; cv=none; b=MhQ/9R6QR7pr2F5qjccGysTai85PiU6MSrVa+5hVaJkwOmMVU2skSexxOnfZqm4tw0LmUuWsXojAlTJZERfr4bwaJu1HHNHe2u3pUca+Hi2aCTMODJKqZHvgSK48Mnm42GkoQXf2KtxZHmnVNOgi8Gf+UV/EeyFMk/5LiTNKbb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481794; c=relaxed/simple;
	bh=g4Gh9zUKvGn0j9HvUyMO1oPQPTfGnB9pDKVs63CH1EQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZ9OVCPX7OIGixlUhmSp/Zrt4gtFg+tOLF+QotY6RO0+jQnhWc/U/Rq5lSFshw1kmi7pqStDLnCw/el4BGuoQXFtmLT/14hZTSGaZ+jDF8LC+8bsguJtBAEmD07yWmzUS4esheKgmBgfrbY3lK/2tkltIljS1UlRg8jDcujtWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GjI0LQEM; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e941770afb2911f085319dbc3099e8fb-20260127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4y8rxETpfi/E6+XdI2yjvO2c7MT4W8f7RNMVGWbNumY=;
	b=GjI0LQEM5f7Us4TeEDXkL9lCyf0XNvC6ikAD6AxiE/OgyL4Tf+B7NMlY3wTt0ciVeiH+w+hV3ehpzUIoTYiR59h7CWHAWjWTsdongjokn1joK/QOfcpw20k78CNh/GA/jDRFtWnpCR/YvHwh39ULZfghtaYB/Qv4+P8FIkZPFyo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d21f92a5-77d8-49b7-9861-30e6d0ca0357,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:7206417a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e941770afb2911f085319dbc3099e8fb-20260127
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1189260173; Tue, 27 Jan 2026 10:43:07 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 27 Jan 2026 10:43:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 27 Jan 2026 10:43:04 +0800
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
Subject: [PATCH v7 04/10] media: mediatek: vcodec: Refactor Decoder profile & level Handling
Date: Tue, 27 Jan 2026 10:42:41 +0800
Message-ID: <20260127024248.18406-5-kyrie.wu@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-51598-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email,mediatek.com:dkim,mediatek.com:mid]
X-Rspamd-Queue-Id: 386458F22C
X-Rspamd-Action: no action

This commit refactors the handling of decoder parameters for H264,
H265, and VP9 codecs by introducing a new structure to standardize
supported level and profile information. By leveraging this changes,
chipset-specific conditional logic in the codec configuration
functions is significantly reduced.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       | 16 ++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 93 ++++---------------
 2 files changed, 34 insertions(+), 75 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index bb293ada6fb2..f38b5dc4bb74 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -76,6 +76,16 @@ struct vdec_pic_info {
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
@@ -96,6 +106,9 @@ struct vdec_pic_info {
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  * @chip_name: platforms configuration values
+ * @h264_params: H264 decoder default supported params
+ * @h265_params: H265 decoder default supported params
+ * @vp9_params: VP9 decoder default supported params
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -118,6 +131,9 @@ struct mtk_vcodec_dec_pdata {
 	bool is_subdev_supported;
 	bool uses_stateless_api;
 	unsigned int chip_name;
+	struct mtk_vcodec_dec_params h264_params;
+	struct mtk_vcodec_dec_params h265_params;
+	struct mtk_vcodec_dec_params vp9_params;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index aba28d276bdf..a1f419202a24 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -549,106 +549,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
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
-	switch (ctx->dev->chip_name) {
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
-	switch (ctx->dev->chip_name) {
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
-	switch (ctx->dev->chip_name) {
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
-	switch (ctx->dev->chip_name) {
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
-	switch (ctx->dev->chip_name) {
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
-- 
2.45.2


