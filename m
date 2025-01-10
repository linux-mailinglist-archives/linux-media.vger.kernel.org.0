Return-Path: <linux-media+bounces-24554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F1A084C4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 02:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2F8E1683C4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 01:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521D51E3761;
	Fri, 10 Jan 2025 01:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IOOCNvCd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A213DDAE;
	Fri, 10 Jan 2025 01:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472483; cv=none; b=YsJh2C/CcuvIGCywg4ROr8X45orIt6dmUPsuJEC2FnFNhaL9iOkBP89XAHYyBamaeHvJi7y1eROO4BLl43DlvUMZh5t5srYSEhYuXZSqqX/YNeUz0NwwKDwgszNips1I9ymR9kIfCV2W//M8TIIHUAVKFMYUmBtjSTKj0oSPEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472483; c=relaxed/simple;
	bh=BKJ/Xn/IJ9lVQexbXZB/vujOWrwQmTB6AkWLuogr8rI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ma1SYOB2jYWE1wJB3A04l6035o6QsfAgaUuNWJ2pqzPHBwdVSSsnY6LFH/Ep3Rem4PYrZNx/6stHD8W3Hz726DSi7dCNqWhvhKPFget5y1xOEPVhMbPESaujTisZGZR0umfCVXBk7PkNHlH6M3IKBcTUdHayAKvg2UTJ50CvkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IOOCNvCd; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1fcdfc4acef211ef99858b75a2457dd9-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XkawqgUGsjxSy81TXwfjW+0FBav6hlOGQ1NYfc23YFI=;
	b=IOOCNvCdinRFK9LCoOYjKcHNH91fO8a4YT0sK7k1f8bmMUqq6qC+qqE6r1sIKoO5GM/KKSHYyoep3PkWMuxA8d4Jh3ocn0p92SepNseP+FV5iZ0IgNhtITxQBj6LSxAIMOzPvEuySvx6vyEbX6Brwdi6kh7MM0EuJGbCCE/J+rQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:55dfe043-e38a-4af2-8f7c-992cfe22e3e7,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:a6d3a80e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1fcdfc4acef211ef99858b75a2457dd9-20250110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1314833855; Fri, 10 Jan 2025 09:27:58 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:56 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,05/12] media: mediatek: jpeg: fix jpeg hw count setting
Date: Fri, 10 Jan 2025 09:27:42 +0800
Message-ID: <20250110012749.30072-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

1. different IC has different hw core;
2. use a parameter to set jpeg hw count.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++++++++++++++----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  2 ++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 77b3bd6c4d3f..4dc6f82d74fa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1468,7 +1468,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->variant->max_hw_count; i++) {
 		comp_jpeg = jpeg->enc_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1515,7 +1515,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->variant->max_hw_count; i++) {
 		comp_jpeg = jpeg->dec_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1598,7 +1598,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
+	for (i = 0; i < jpeg->variant->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->enc_hw_dev[i];
 	i = 0;
 
@@ -1696,7 +1696,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	struct mtk_jpeg_fb fb;
 	unsigned long flags;
 
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
+	for (i = 0; i < jpeg->variant->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->dec_hw_dev[i];
 	i = 0;
 
@@ -1925,6 +1925,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = true,
+	.max_hw_count = 2,
 	.jpeg_worker = mtk_jpegenc_worker,
 };
 
@@ -1938,6 +1939,21 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 	.multi_core = true,
+	.max_hw_count = 3,
+	.jpeg_worker = mtk_jpegdec_worker,
+};
+
+static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.m2m_ops = &mtk_jpeg_multicore_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.multi_core = true,
+	.max_hw_count = 2,
 	.jpeg_worker = mtk_jpegdec_worker,
 };
 
@@ -1954,6 +1970,7 @@ static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
 	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.max_hw_count = 1,
 	.support_34bit = true,
 };
 
@@ -1970,6 +1987,7 @@ static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
 	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.max_hw_count = 1,
 	.support_34bit = true,
 };
 
@@ -2008,7 +2026,7 @@ static const struct of_device_id mtk_jpeg_match[] = {
 	},
 	{
 		.compatible = "mediatek,mt8196-jpgdec",
-		.data = &mtk8195_jpegdec_drvdata,
+		.data = &mtk8196_jpegdec_drvdata,
 	},
 	{},
 };
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index d3aba1e6cae8..38672499ca18 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -74,6 +74,7 @@ enum mtk_jpeg_ctx_state {
  * @out_q_default_fourcc:	output queue default fourcc
  * @cap_q_default_fourcc:	capture queue default fourcc
  * @multi_core:		mark jpeg hw is multi_core or not
+ * @max_hw_count:		jpeg hw-core count
  * @jpeg_worker:		jpeg dec or enc worker
  * @support_34bit:	flag to check if support dma_address 34bit
  */
@@ -91,6 +92,7 @@ struct mtk_jpeg_variant {
 	u32 out_q_default_fourcc;
 	u32 cap_q_default_fourcc;
 	bool multi_core;
+	u32 max_hw_count;
 	void (*jpeg_worker)(struct work_struct *work);
 	bool support_34bit;
 };
-- 
2.46.0


