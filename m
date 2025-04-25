Return-Path: <linux-media+bounces-31013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F777A9C270
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E6B4A1285
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B806E221FC9;
	Fri, 25 Apr 2025 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DK1fuTeY"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A97623908B;
	Fri, 25 Apr 2025 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571230; cv=none; b=UAuLCHNSKqLpFb31YsfuoKjn5ge0na9+HMu+mKuSFaxhpa4+mgLC1OAic7aeHX5UmofmvhmSjV8hFctpY2jRwejgEJuqdlRUVlNEXLPWJXCocvMgrvd4k9F8+kajhptt79DgmbOxLGYMHDk56mSr00Uaaca7ZVRMqTN3kZhIdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571230; c=relaxed/simple;
	bh=Xg0F8MXD0Hobim505knden2lrN66mHcp9kpxZTofJew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WJilL5wOoNQLgT99eUXdRWjhz/OBjOWTWkceiYQCvseDXCjg5Lf0v3/chRFVMtf0lOF//dwxRg5/cr5oEY1E4h0nUeAyHCzH1qbG7qJ3yUYGM3apEcLQikU09MMz1zroSteThEazIAhgUHI0lISP+MiVtg6KliIGIgs4tt5rQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DK1fuTeY; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c95f078c21b211f09b6713c7f6bde12e-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=blEHqP7RpWTzy6qaiwVOxIyVOLNwYraX0ykGU6xNtmI=;
	b=DK1fuTeYsfJ+aKye0jkNTuQA3+5j3cHLpb2hDC/F+RJqWDEJcMvce1lDw+AuQhYFPlzCF++G9ArV9wdxgzGcOax/aX1hGI2/Ec4cXxgRyMlkohddIFIPe+8Usnw5r4MiFqimKbAGxhi4iIHwCgHgm20d360J5JxvD7J68DWP5mM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8f9b27e5-d4e7-44ad-8f33-2b47fd4fcbd4,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:ab290a07-829c-41bc-b3dd-83387f72f90e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c95f078c21b211f09b6713c7f6bde12e-20250425
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 89992218; Fri, 25 Apr 2025 16:53:41 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 16:53:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 16:53:39 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v3 09/12] media: mediatek: jpeg: refactor multi-core clk suspend and resume setting
Date: Fri, 25 Apr 2025 16:53:25 +0800
Message-ID: <20250425085328.16929-10-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250425085328.16929-1-kyrie.wu@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

refactor jpeg clk suspend and resume setting for multi-core

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++----
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 75 ++++++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 75 ++++++++++++++++++-
 3 files changed, 151 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 1d3df1230191..c1d2de92f125 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1126,6 +1126,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
 	int ret;
 
+	if (jpeg->variant->multi_core)
+		return;
+
 	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
 				      jpeg->variant->clks);
 	if (ret)
@@ -1134,6 +1137,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
+	if (jpeg->variant->multi_core)
+		return;
+
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
 }
@@ -1677,13 +1683,6 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		goto enc_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto enc_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1798,20 +1797,13 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
-	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
+	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
 		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
 			__func__, __LINE__);
 		goto dec_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto clk_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1821,7 +1813,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				 &dst_buf->vb2_buf, &fb)) {
 		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
 			__func__, __LINE__);
-		goto setdst_end;
+		goto set_dst_fail;
 	}
 
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
@@ -1846,9 +1838,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	return;
 
-setdst_end:
-	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-clk_end:
+set_dst_fail:
 	pm_runtime_put(comp_jpeg[hw_id]->dev);
 dec_end:
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index c1e10af2086b..5d9a247f0360 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -543,14 +543,13 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
 	jpeg_buf_queue_dec(ctx);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -592,12 +591,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
 	jpeg_buf_queue_dec(ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -703,15 +701,84 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_clk_bulk_get(dev->dev,
+				jpegdec_clk->clk_num,
+				jpegdec_clk->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_jpeg_clk_on(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
+				      jpeg->jdec_clk.clks);
+	if (ret)
+		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
+			__func__, __LINE__);
+}
+
+static void mtk_jpeg_clk_off(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
+				   jpeg->jdec_clk.clks);
+}
+
+static __maybe_unused int mtk_jpegdec_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_off(jpeg);
 
 	return 0;
 }
 
+static __maybe_unused int mtk_jpegdec_pm_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_on(jpeg);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_jpegdec_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int mtk_jpegdec_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_jpegdec_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
+	SET_RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegdec_hw_driver = {
 	.probe = mtk_jpegdec_hw_probe,
 	.driver = {
 		.name = "mtk-jpegdec-hw",
 		.of_match_table = mtk_jpegdec_hw_ids,
+		.pm             = &mtk_jpegdec_pm_ops,
 	},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 2d7e72a424c5..75cd3627c5ae 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -274,14 +274,13 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
 	jpeg_buf_queue_dec(ctx);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -316,12 +315,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
 	jpeg_buf_queue_dec(ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -425,15 +423,84 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_clk_bulk_get(dev->dev,
+				jpegenc_clk->clk_num,
+				jpegenc_clk->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_jpeg_clk_on(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
+				      jpeg->venc_clk.clks);
+	if (ret)
+		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
+			__func__, __LINE__);
+}
+
+static void mtk_jpeg_clk_off(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
+				   jpeg->venc_clk.clks);
+}
+
+static __maybe_unused int mtk_jpegenc_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_off(jpeg);
 
 	return 0;
 }
 
+static __maybe_unused int mtk_jpegenc_pm_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_on(jpeg);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_jpegenc_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int mtk_jpegenc_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_jpegenc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
+	SET_RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegenc_hw_driver = {
 	.probe = mtk_jpegenc_hw_probe,
 	.driver = {
 		.name = "mtk-jpegenc-hw",
 		.of_match_table = mtk_jpegenc_drv_ids,
+		.pm = &mtk_jpegenc_pm_ops,
 	},
 };
 
-- 
2.46.0


