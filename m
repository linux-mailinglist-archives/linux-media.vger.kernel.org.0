Return-Path: <linux-media+bounces-33313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ACDAC2F86
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BA271BA3754
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D86F1E503C;
	Sat, 24 May 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cgk6C7dl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4719CC0E;
	Sat, 24 May 2025 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087527; cv=none; b=Xxx9jXmYcoZUAPpJmLCp/BboE86w5/5PEezpehiO2lQYNTPWCPMUcrHoxM+wSzoDCwjSTF1aZyGCmwnPo4XmTCdkvRvXEJxHyVYEZ5X681pWjAl6hbSgtvwLdO5DPIOyiuTfONxXFcHIk1hvJmMKPfh3BkZDDnKIXEz35B+nJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087527; c=relaxed/simple;
	bh=+DMSQKQzbZb6DFTAwlhUcTjDRVlDQ+q1ruffAhWOvvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M3r/UQLlNZP8MFWldPhaKKQwXr8hf0RlxIvWIme9haqf1xsg6q1OklkNTSJjjA27dCLkjgDY/8C+ilK6spxjF3wHek44BANJD7gFVf2/P0M6/fwcDy8/YY5gdOs6YAJ7pVMN2l/WsDfqH/7AMtg55HCHryPvQvSO0xutGoYEPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cgk6C7dl; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7acc551c389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5HWVT/dTylYSt+t4LkzZWm+16LjaTBYm2xU/nM2FdEE=;
	b=cgk6C7dlTjJbdR4T/KZticOcXQBdfGTMNS+HAlTPb8HcA8YSODNByU0lazA/fi0SsTK1R+sJFKHSuvFWTjSGnK5Xz4C/jbmf5jAYqEwciXI/V6r27Gk4N2HvdTkwcl/TMZXbgfQGnOwYqR01DbI8dOE5A0QwXtJwbcQqAQSHyBI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c2f17fa4-96b2-44c0-b784-6991b35ea173,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:27b91059-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7acc551c389511f0813e4fe1310efc19-20250524
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1131495485; Sat, 24 May 2025 19:51:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:48 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 05/10] media: mediatek: isp: Add the Imgsys LARBs device
Date: Sat, 24 May 2025 19:49:57 +0800
Message-ID: <20250524115144.3832748-6-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250524115144.3832748-1-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The ImgSys driver is implemented as a series of patches, with this patch
focusing on the Imgsys LARBs device. This patch adds an independent
device driver for the ImgSys Local Arbiter (LARB) devices. The addition
is necessary because the IOMMU (Input/Output Memory Management Unit)
cannot support multiple LARBs within a single device node.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
index cfd65858c751..919c69493bbc 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
@@ -28,6 +28,58 @@
 #define IMGSYS_MAX_BUFFERS	256
 #define IMGSYS_SUSPEND_TIME 3000 /* ms */
 
+struct mtk_imgsys_larb_device {
+	struct device	*dev;
+	struct mtk_imgsys_dev *imgsys_dev;
+};
+
+static int mtk_imgsys_larb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_imgsys_larb_device *larb_dev;
+
+	larb_dev = devm_kzalloc(dev, sizeof(*dev), GFP_KERNEL);
+	if (!larb_dev)
+		return -ENOMEM;
+
+	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34)))
+		dev_err(dev, "No suitable DMA available\n");
+
+	if (!dev->dma_parms) {
+		dev->dma_parms =
+			devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP_KERNEL);
+		if (!dev->dma_parms)
+			return -ENOMEM;
+	}
+	if (pdev->dev.dma_parms)
+		dma_set_max_seg_size(dev, UINT_MAX);
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void mtk_imgsys_larb_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+}
+
+static const struct of_device_id mtk_imgsys_larb_match[] = {
+	{.compatible = "mediatek,mt8188-imgsys-larb",},
+	{},
+};
+
+static struct platform_driver mtk_imgsys_larb_driver = {
+	.probe  = mtk_imgsys_larb_probe,
+	.remove = mtk_imgsys_larb_remove,
+	.driver = {
+		.name   = "mtk-imgsys-larb",
+		.of_match_table = of_match_ptr(mtk_imgsys_larb_match),
+	},
+};
+
 static int mtk_imgsys_sd_subscribe_event(struct v4l2_subdev *subdev,
 					 struct v4l2_fh *fh,
 					 struct v4l2_event_subscription *sub)
@@ -1537,8 +1589,16 @@ static int mtk_imgsys_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
+	ret = platform_driver_register(&mtk_imgsys_larb_driver);
+	if (ret) {
+		dev_info(imgsys_dev->dev, "register mtk_imgsys_larb_driver fail\n");
+		goto err_release_deinit_v4l2;
+	}
+
 	return 0;
 
+err_release_deinit_v4l2:
+	mtk_imgsys_dev_v4l2_release(imgsys_dev);
 err_free_larb_alloc:
 	devm_kfree(&pdev->dev, imgsys_dev->larbs);
 err_free_dev_alloc:
@@ -1551,6 +1611,7 @@ static void mtk_imgsys_remove(struct platform_device *pdev)
 	struct mtk_imgsys_dev *imgsys_dev = dev_get_drvdata(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
+	platform_driver_unregister(&mtk_imgsys_larb_driver);
 	mtk_imgsys_dev_v4l2_release(imgsys_dev);
 	devm_kfree(&pdev->dev, imgsys_dev->larbs);
 	devm_kfree(&pdev->dev, imgsys_dev);
-- 
2.45.2


