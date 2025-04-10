Return-Path: <linux-media+bounces-29852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF0A83950
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1571890F41
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E25E2080F0;
	Thu, 10 Apr 2025 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RwDqo0kn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282142045A3;
	Thu, 10 Apr 2025 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266626; cv=none; b=iiJOp8EJJd5aLNkFGW9zgFGHdMrroKF7ng4SlBer/aqa3kTiKlPNKLdy99wzZjcMGchKfsqA9se6aXpV2fdGPthsAwjExMkj3DTwjTnC7BvSRLUIRyzpVwGVYlcw18mSe6g9ZDvKqJ6MLXmyx1NAzKr17Nl9rSLQhQ/nc8os8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266626; c=relaxed/simple;
	bh=W+h8GbuQM+BTTYqnjjCUVfam+5dW7+k+HfM/J2XLGlI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GjcsXDik9u8v6ShbSetGJ604XmfZvjKaydY9di2N4NKNL4RGjoJWFZFEEgoa+HDhjCJHzxz+jtgyE+421PpFv6inxZ/imkGIH+zdgScg/Giy4la15u5/G/K5CzqWEpXSKrBDAJ1WHzFbS6/qCFkVX7+Lvt5siT1b3osTR986sSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=RwDqo0kn; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 441a839615d511f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BJ9fDAhOkJvFn7vZ3dAC3ursU8DT6tUynz6Xsgxfog4=;
	b=RwDqo0knyc2Jrysh07hybwuG4ULnYUvSI0f8tbVWremvusCWbrW//Ek+eEENgixXapWi75tdmTX8oFP8PSuuv2yTDpW3IWMdCMbJFMRd+9+mNdp3r7RAnFyuW0MjyjgCXCh7wb9vgFQc/PZwTJcNB4on/cUPEhaL93Xd/LL3IPI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1e46dfd6-b475-4038-b649-b4c90f849361,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b69b138b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT|NGT
X-CID-BAS: 5,DFT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 441a839615d511f08eb9c36241bbb6fb-20250410
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1118021364; Thu, 10 Apr 2025 14:30:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:14 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 04/12] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Thu, 10 Apr 2025 14:29:57 +0800
Message-ID: <20250410063006.5313-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add a configuration to set jpeg dec & enc smmu sid

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 34 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 19 +++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 24 +++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 ++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 63a6efc8e21a..97117f7babd9 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1584,6 +1584,18 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	return IRQ_HANDLED;
 }
 
+static void mtk_jpeg_enc_set_smmu_sid(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	u32 val, mask;
+
+	val = readl(jpeg->smmu_info.smmu_base);
+	mask = ~(jpeg->smmu_info.mask << jpeg->smmu_info.shift);
+	val &= mask;
+	val |= (jpeg->smmu_info.sid << jpeg->smmu_info.shift);
+
+	writel(val, jpeg->smmu_info.smmu_base);
+}
+
 static void mtk_jpegenc_worker(struct work_struct *work)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
@@ -1655,6 +1667,10 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu_flag)
+		mtk_jpeg_enc_set_smmu_sid(comp_jpeg[hw_id]);
+
 	mtk_jpeg_set_enc_dst(ctx,
 			     comp_jpeg[hw_id]->reg_base,
 			     &dst_buf->vb2_buf);
@@ -1679,6 +1695,18 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
+static void mtk_jpeg_dec_set_smmu_sid(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	u32 val, mask;
+
+	val = readl(jpeg->smmu_info.smmu_base);
+	mask = ~(jpeg->smmu_info.mask << jpeg->smmu_info.shift);
+	val &= mask;
+	val |= (jpeg->smmu_info.sid << jpeg->smmu_info.shift);
+
+	writel(val, jpeg->smmu_info.smmu_base);
+}
+
 static void mtk_jpegdec_worker(struct work_struct *work)
 {
 	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
@@ -1771,6 +1799,10 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu_flag)
+		mtk_jpeg_dec_set_smmu_sid(comp_jpeg[hw_id]);
+
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
 				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
@@ -1933,6 +1965,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
+	.support_smmu_flag = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1959,6 +1992,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegdec_worker,
+	.support_smmu_flag = true,
 };
 
 static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8fddc133c46c..17d2b9274469 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -82,6 +82,7 @@ struct mtk_jpeg_variant {
 	bool multi_core;
 	void (*jpeg_worker)(struct work_struct *work);
 	bool support_34bit;
+	bool support_smmu_flag;
 };
 
 struct mtk_jpeg_src_buf {
@@ -138,6 +139,20 @@ struct mtk_jpegdec_clk {
 	int clk_num;
 };
 
+/**
+ * struct mtk_smmu_info - Structure used to store smmu information
+ * @smmu_base:		JPEG encode smmu register mapping
+ * @sid:		JPEG encode smmu hw sid
+ * @shift:		JPEG encode smmu hw bit shift
+ * @mask:		JPEG encode smmu hw bit mask
+ */
+struct mtk_smmu_info {
+	void __iomem *smmu_base;
+	unsigned int sid;
+	unsigned int shift;
+	unsigned int mask;
+};
+
 /**
  * struct mtk_jpegenc_comp_dev - JPEG COREX abstraction
  * @dev:		JPEG device
@@ -150,6 +165,7 @@ struct mtk_jpegdec_clk {
  * @hw_param:		jpeg encode hw parameters
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
+ * @smmu_info:		SMMU information
  */
 struct mtk_jpegenc_comp_dev {
 	struct device *dev;
@@ -163,6 +179,7 @@ struct mtk_jpegenc_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct mtk_smmu_info smmu_info;
 };
 
 /**
@@ -177,6 +194,7 @@ struct mtk_jpegenc_comp_dev {
  * @hw_param:			jpeg decode hw parameters
  * @hw_state:			record hw state
  * @hw_lock:			spinlock protecting hw
+ * @smmu_info:			SMMU information
  */
 struct mtk_jpegdec_comp_dev {
 	struct device *dev;
@@ -190,6 +208,7 @@ struct mtk_jpegdec_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct mtk_smmu_info smmu_info;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index d868e46aaf37..1bc632f54bc2 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -618,6 +618,29 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static void mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
+{
+	struct resource *r;
+
+	r = platform_get_resource(dev->plat_dev, IORESOURCE_MEM, 1);
+	if (!r) {
+		dev_err(&dev->plat_dev->dev, "get smmu_base failed\n");
+		return;
+	}
+
+	dev->smmu_info.smmu_base =
+		devm_ioremap(&dev->plat_dev->dev, r->start,
+			     resource_size(r));
+	if (IS_ERR(dev->smmu_info.smmu_base)) {
+		dev_err(&dev->plat_dev->dev, "mmap smmu_base failed(%ld)\n",
+			PTR_ERR(dev->smmu_info.smmu_base));
+		return;
+	}
+
+	dev->smmu_info.sid = 0x4;
+	dev->smmu_info.shift = 8;
+	dev->smmu_info.mask = 0x7;
+}
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -670,6 +693,7 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	master_dev->reg_decbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
 
+	mtk_jpegdec_smmu_init(dev);
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index ca06d4f435cd..db9b67830a72 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -353,6 +353,30 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
 	return 0;
 }
 
+static void mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
+{
+	struct resource *r;
+
+	r = platform_get_resource(dev->plat_dev, IORESOURCE_MEM, 1);
+	if (!r) {
+		dev_err(&dev->plat_dev->dev, "get smmu_base failed\n");
+		return;
+	}
+
+	dev->smmu_info.smmu_base =
+		devm_ioremap(&dev->plat_dev->dev, r->start,
+			     resource_size(r));
+	if (IS_ERR(dev->smmu_info.smmu_base)) {
+		dev_err(&dev->plat_dev->dev, "mmap smmu_base failed(%ld)\n",
+			PTR_ERR(dev->smmu_info.smmu_base));
+		return;
+	}
+
+	dev->smmu_info.sid = 0x5;
+	dev->smmu_info.shift = 4;
+	dev->smmu_info.mask = 0x7;
+}
+
 static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegenc_clk *jpegenc_clk;
@@ -403,6 +427,7 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	master_dev->reg_encbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
 
+	mtk_jpegenc_smmu_init(dev);
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.46.0


