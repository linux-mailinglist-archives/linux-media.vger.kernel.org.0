Return-Path: <linux-media+bounces-59361-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKHDJn3L6WnSkQIAu9opvQ
	(envelope-from <linux-media+bounces-59361-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:34:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371244E015
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65D8D303A9EA
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65637311968;
	Thu, 23 Apr 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pdb6saqz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0F2F5A06;
	Thu, 23 Apr 2026 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929644; cv=none; b=oUi+hmlm+k6g9l7CHQhWdB/6gEa2BHTBpuRWTK4HIIPWrtULcQqM4Cd5ho0LpcWsDIeYURsdBnO1m5puYzHibeDZgjoWIwMaHR/rJ75IHajdATmqLShUlBCFjjxWpl6tBILe2M9MpOwrXHBF7c4NNbEfh1eTqFQgulo37bE/cTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929644; c=relaxed/simple;
	bh=RD1vljaSXHCPXKrWsXcFmjHfOlR1J3yh5Wv77LMZxnc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urGP/wjVyA3UBbugiyTX25UepcEWrN6wLoAtAXCe/Z99VXWjC2oLraU9oNDl+vY+EC1N9kgtBcydurZcyo2+duoANKFOvieIvCXvi2RPn3VjAyBysNlHoklCufnSXg2kM1DrvDpNIWOnt5A/LKES+zzzXeana365pqFKUjMADyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Pdb6saqz; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cb26c4223ee611f19781c1a04af40193-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SCqJtxvfbCBW4h64VnUIjgUa8RzuVw7oy506BxfjZck=;
	b=Pdb6saqzVSQv/V1gdjpzOBDx9T+rfVaM+fJ4mTa0xMwKrvT0+3+9Tu3c/Qk+hTWsWreS3SRWGo6lH3YYRz108+Dxp1rBQ/dOAlaDI17nFkgIPpLzfm4U8U9GAN0Y4VpUjzYPQQs1+lBz7F6ilPd1Z8DIFyaKwBEkD8XmTxa/RPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:42694a15-9f87-46c1-9e77-c4a850aa9806,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:9982c98f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb26c4223ee611f19781c1a04af40193-20260423
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 912399320; Thu, 23 Apr 2026 15:33:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 15:33:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 15:33:57 +0800
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
Subject: [PATCH v6 5/6] media: mediatek: encoder: Add a new platform data member
Date: Thu, 23 Apr 2026 15:33:42 +0800
Message-ID: <20260423073345.27402-6-irui.wang@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59361-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0371244E015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 2f6ee0cd15e3..7b644f55963b 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -390,6 +390,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -400,6 +401,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -410,6 +412,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.venc_model_num = 8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -421,6 +424,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
+	.venc_model_num = 8188,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -433,6 +437,7 @@ static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.venc_model_num = 8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -444,6 +449,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
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


