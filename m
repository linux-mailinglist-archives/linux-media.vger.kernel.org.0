Return-Path: <linux-media+bounces-52644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEREIWKljWlh5gAAu9opvQ
	(envelope-from <linux-media+bounces-52644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:03:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F06C12C2E0
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEC0930ADFC2
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 10:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7FF2EACEE;
	Thu, 12 Feb 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tqvm04RJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F118D2DB7A5;
	Thu, 12 Feb 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890485; cv=none; b=LFo44YuOsMfF6Fn8YqseNfT0K28I3ugyQYFLmaYpwKya5v2NKBHXFFYB/cruX6Ihcl8tnvAo4Ot9xKh+asmgB9F8ei0WHYPkJvVBNjwRtJD9z2vS96iUJg9YsevlHmMUgnf1/ImlJbYVtf1hB8EOuvkAWRiedkeBpBDzYQDb2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890485; c=relaxed/simple;
	bh=IHhyNcW7oz5BkXUGltRcAwNIKsFb9IHgFkrQMaBz1pA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2mX2vVSLPdgWovAWsdFCUJg0jE0tRQzKGfaKHJwhoj5O7Ziqui5nAGqZTtrc56bmPBg1LyDT25MD4y+RLEoPizwa2Alzv1eqf/u8TpoKEtu4IZssCJ9zyjQ3Slt819I7JRetjMj9aY20yAB4DG+mkQwACFELb0nJmhtTx3LxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Tqvm04RJ; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c68ef70007f911f1b7fc4fdb8733b2bc-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YxincR19n+n/u0r8OQlSgZvvbGiDFUYQw+mjXeEvtaQ=;
	b=Tqvm04RJMH182oGl/VtN9C1nBY6drqTIXPY7iHYZrCB3KOWTtcLyOEQ/I75vLR3HbkgECd9zc2B11ZqgfzuQVod5WLd8NQw79A85327uOk4M5HNgmydmD3T3ip3wvZY1sh4e7xXkJqre84FFYrl/AbmJUH9UODWCZ+/ZscJSgPQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:68108804-397d-426e-aa13-691e61bd3eb1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:f125395b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c68ef70007f911f1b7fc4fdb8733b2bc-20260212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 854859337; Thu, 12 Feb 2026 18:01:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 18:01:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 18:01:15 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <sebastian.fricke@collabora.com>, Tiffany
 Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 4/6] media: mediatek: encoder: Add a new platform data member
Date: Thu, 12 Feb 2026 18:01:01 +0800
Message-ID: <20260212100104.11863-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260212100104.11863-1-irui.wang@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52644-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:email]
X-Rspamd-Queue-Id: 1F06C12C2E0
X-Rspamd-Action: no action

Add a new platform data member to indicate each encoder IC, so that the
get chip name function by 'of_device_is_compatible' can be removed.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 22 ++-----------------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  6 +++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 ++
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index f0344888f2cf..b2f911746c01 100644
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
index 36065c8ad94f..9a94bd096397 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -381,6 +381,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -391,6 +392,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -401,6 +403,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.venc_model_num = 8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -412,6 +415,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
+	.venc_model_num = 8188,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -424,6 +428,7 @@ static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.venc_model_num = 8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -435,6 +440,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
+	.venc_model_num = 8195,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0529564027c4..769fb5009964 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -21,6 +21,7 @@
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
+ * @venc_model_num: encoder model number
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
@@ -33,6 +34,7 @@
  * @uses_common_fw_iface: whether the encoder uses common driver interface
  */
 struct mtk_vcodec_enc_pdata {
+	u16 venc_model_num;
 	bool uses_ext;
 	u64 min_bitrate;
 	u64 max_bitrate;
-- 
2.45.2


