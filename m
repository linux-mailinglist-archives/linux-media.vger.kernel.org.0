Return-Path: <linux-media+bounces-39375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F9B1FDE7
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 04:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59D377A43F7
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 02:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B525E258CD9;
	Mon, 11 Aug 2025 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Eb5Pw6u6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D02D6636;
	Mon, 11 Aug 2025 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754879182; cv=none; b=I/ZXq93H6OsGbCo3XQQT0Wv3GYx0LglChXTZUvDzMTcg7gvQ8wRLkHdJiiLvAyzikaNg9auwIupP69xt5KdEBKCiWFVdtnAe7OnSVxjKTYtNVrlbb3rayVJFi/5g2+QxE5a7BHvUoQp/JOh0Qy22gfC0EiLbpIGqraLsUKYUcCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754879182; c=relaxed/simple;
	bh=PSJu+BHhSMr4btKU2XwS2lJZFjaZFdpdFs/222/k3RA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELlcwNutLvSeiPmCT2z7Iey5fW+xAYYtT1KzpVjalsNKKdS1ddA6JVG+KA21mYXx7U3yxHKsU0KWgOvGly51AOmYQLJnAbQ0gt6BnCdqUqBP7fe9iJN0Fx6zWHtkzdGef4fl3OdB6ApBuf2079rYzCen3ORvbVu8ExeEss12Akw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Eb5Pw6u6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8ad5b7e8765a11f08871991801538c65-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=OK8p+gJrVIr64UGgL8ox7/n071xyuSynkQOAEVTADiA=;
	b=Eb5Pw6u60vVTkSgeb/u/MpaWbavb9IY0Q4TwCyRCBf+6+J+gTFBdL1fGjTkdUeRn+lwxV7vdVz0sIzYpknh6gCcJIVF5dq+nWQoVvG26etOqdq+Q3XZwrB4HCxV3s1bsXPIp58rZCgAVIwNjSO08YktqlXd59uCby7UaZxSDWZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e5b79d24-4ef4-4ea9-94a7-dd7112200933,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:c92d4aa1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ad5b7e8765a11f08871991801538c65-20250811
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 106174752; Mon, 11 Aug 2025 10:26:09 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 10:26:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 10:26:02 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v8 12/12] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Mon, 11 Aug 2025 10:25:54 +0800
Message-ID: <20250811022555.1049-13-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811022555.1049-1-kyrie.wu@mediatek.com>
References: <20250811022555.1049-1-kyrie.wu@mediatek.com>
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

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 37 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 15 ++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 23 ++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 23 ++++++++++++
 4 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 1b6d691186f4..50aee7fe5142 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -15,6 +15,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <media/v4l2-event.h>
@@ -1614,6 +1615,20 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	return IRQ_HANDLED;
 }
 
+static void mtk_jpeg_enc_set_smmu_sid(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	struct mtk_jpeg_dev *mjpeg = jpeg->master_dev;
+
+	if (!mjpeg->variant->support_smmu || !jpeg->smmu_regmap)
+		return;
+
+	regmap_update_bits(jpeg->smmu_regmap, JPEG_ENC_SMMU_SID,
+			   JPG_REG_GUSER_ID_MASK <<
+			   JPG_REG_ENC_GUSER_ID_SHIFT,
+			   JPG_REG_GUSER_ID_ENC_SID <<
+			   JPG_REG_ENC_GUSER_ID_SHIFT);
+}
+
 static void mtk_jpegenc_worker(struct work_struct *work)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
@@ -1675,6 +1690,9 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+
+	mtk_jpeg_enc_set_smmu_sid(comp_jpeg[hw_id]);
+
 	mtk_jpeg_set_enc_dst(ctx,
 			     comp_jpeg[hw_id]->reg_base,
 			     &dst_buf->vb2_buf);
@@ -1702,6 +1720,20 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
+static void mtk_jpeg_dec_set_smmu_sid(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	struct mtk_jpeg_dev *mjpeg = jpeg->master_dev;
+
+	if (!mjpeg->variant->support_smmu || !jpeg->smmu_regmap)
+		return;
+
+	regmap_update_bits(jpeg->smmu_regmap, JPEG_DEC_SMMU_SID,
+			   JPG_REG_GUSER_ID_MASK <<
+			   JPG_REG_DEC_GUSER_ID_SHIFT,
+			   JPG_REG_GUSER_ID_DEC_SID <<
+			   JPG_REG_DEC_GUSER_ID_SHIFT);
+}
+
 static void mtk_jpegdec_worker(struct work_struct *work)
 {
 	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
@@ -1785,6 +1817,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+
+	mtk_jpeg_dec_set_smmu_sid(comp_jpeg[hw_id]);
+
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
 				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
@@ -1944,6 +1979,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
+	.support_smmu = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1970,6 +2006,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegdec_worker,
+	.support_smmu = true,
 };
 
 static const struct of_device_id mtk_jpeg_match[] = {
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 33f7fbc4ca5e..6e8304680393 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
@@ -34,6 +35,14 @@
 
 #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
 
+#define JPEG_DEC_SMMU_SID				0
+#define JPEG_ENC_SMMU_SID				0
+#define JPG_REG_GUSER_ID_MASK			0x7
+#define JPG_REG_GUSER_ID_DEC_SID		0x4
+#define JPG_REG_GUSER_ID_ENC_SID		0x5
+#define JPG_REG_DEC_GUSER_ID_SHIFT		8
+#define JPG_REG_ENC_GUSER_ID_SHIFT		4
+
 #define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
 
 /**
@@ -65,6 +74,7 @@ enum mtk_jpeg_ctx_state {
  * @multi_core:		mark jpeg hw is multi_core or not
  * @jpeg_worker:		jpeg dec or enc worker
  * @support_34bit:	flag to check support for 34-bit DMA address
+ * @support_smmu:	flag to check if support smmu
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -82,6 +92,7 @@ struct mtk_jpeg_variant {
 	bool multi_core;
 	void (*jpeg_worker)(struct work_struct *work);
 	bool support_34bit;
+	bool support_smmu;
 };
 
 struct mtk_jpeg_src_buf {
@@ -150,6 +161,7 @@ struct mtk_jpegdec_clk {
  * @hw_param:		jpeg encode hw parameters
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
+ * @smmu_regmap:	SMMU registers mapping
  */
 struct mtk_jpegenc_comp_dev {
 	struct device *dev;
@@ -163,6 +175,7 @@ struct mtk_jpegenc_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct regmap *smmu_regmap;
 };
 
 /**
@@ -177,6 +190,7 @@ struct mtk_jpegenc_comp_dev {
  * @hw_param:			jpeg decode hw parameters
  * @hw_state:			record hw state
  * @hw_lock:			spinlock protecting hw
+ * @smmu_regmap:		SMMU registers mapping
  */
 struct mtk_jpegdec_comp_dev {
 	struct device *dev;
@@ -190,6 +204,7 @@ struct mtk_jpegdec_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct regmap *smmu_regmap;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index e453a1634f33..da753a636eaa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -624,6 +624,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
+{
+	struct mtk_jpeg_dev *master_dev = dev->master_dev;
+
+	if (!master_dev->variant->support_smmu)
+		return 0;
+
+	dev->smmu_regmap =
+		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
+						"mediatek,smmu-config");
+	if (IS_ERR(dev->smmu_regmap)) {
+		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
+				     "mmap smmu_base failed(%ld)\n",
+				     PTR_ERR(dev->smmu_regmap));
+	}
+
+	return 0;
+}
+
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -677,6 +696,10 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	dev->master_dev = master_dev;
 	master_dev->max_hw_count++;
 
+	ret = mtk_jpegdec_smmu_init(dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 	ret = devm_clk_bulk_get(dev->dev,
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index f30dccc93ecf..5e8a5cb4850e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -348,6 +348,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
 	return 0;
 }
 
+static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
+{
+	struct mtk_jpeg_dev *master_dev = dev->master_dev;
+
+	if (!master_dev->variant->support_smmu)
+		return 0;
+
+	dev->smmu_regmap =
+		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
+						"mediatek,smmu-config");
+	if (IS_ERR(dev->smmu_regmap)) {
+		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
+				     "mmap smmu_base failed(%ld)\n",
+				     PTR_ERR(dev->smmu_regmap));
+	}
+
+	return 0;
+}
+
 static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegenc_clk *jpegenc_clk;
@@ -399,6 +418,10 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	dev->master_dev = master_dev;
 	master_dev->max_hw_count++;
 
+	ret = mtk_jpegenc_smmu_init(dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 	ret = devm_clk_bulk_get(dev->dev,
-- 
2.46.0


