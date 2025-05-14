Return-Path: <linux-media+bounces-32473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0CAB69DD
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18DFC3A560C
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDF627A459;
	Wed, 14 May 2025 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LJ79LJd4"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53F2797A0;
	Wed, 14 May 2025 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222008; cv=none; b=Dam3AsH32aOvGGbIcgt7LVrHwdseLCa18GT0306RZm+196GL6GgdCbv9paRp+3KKSXuvmLjv1R0bqgVR7h9FHKIMYtbfR4+zOVP+0Vi+6LiXPYSSBtDOkyRvnpafXUGibeLW9bC6t4fbpVMFluNpcLf2dwTYcZS0N+2974hWwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222008; c=relaxed/simple;
	bh=nYa1HXHYoTDVfTS0DvP76k8pJ8ov7xg5VLEV+9+7dEU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhpbJh3ElE4+KPE83/Y42A/ECSD7hPo8WZ9RRSMHZPorQQqZDfR7kjftB6r/PDQO1+AvK9gdwrKNrUBWrzqGW6dfjL9myMKFszMJk4V8uiGmrw3MHVh68Kr+XMzjq1kBCjsOcDaNjzUcoirY4CgfAwbgTHYQEg96SYsye6LNrrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LJ79LJd4; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBQCJw2604816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 06:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747221972;
	bh=FGs2f1X5/aEXT5kHV9JLISeGz3eTzxZUqAooC1BrEdo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LJ79LJd4ZXmg6KrPL0zwCrThKa17MluJDJPkymEzAM4r+m0effJUPqYjkCIX7M4Sf
	 EoFxi4Jwbpu3YuV/c97jnnUKYgmHD44lZppMP3UeT+DzMfUv/AYjORuo0xoCdZisn3
	 ZFL6qI+jmi7A9U8xe29jgP6/gS72iHmUysrq6Ork=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBQCsY120156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 06:26:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 06:26:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 06:26:12 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EBPSVC107507;
	Wed, 14 May 2025 06:26:06 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 06/12] media: ti: j721e-csi2rx: get number of contexts from device tree
Date: Wed, 14 May 2025 16:55:21 +0530
Message-ID: <20250514112527.1983068-7-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514112527.1983068-1-r-donadkar@ti.com>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Pratyush Yadav <p.yadav@ti.com>

Different platforms that use this driver might have different number of
DMA channels allocated for CSI. So only as many DMA contexts can be used
as the number of DMA channels available. Get the number of channels
provided via device tree and only configure that many contexts, and
hence only that many pads.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 42 ++++++++++++++-----
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index d746a3ff25934..9c20a5421fa20 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -40,7 +40,7 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define PSIL_WORD_SIZE_BYTES		16
-#define TI_CSI2RX_NUM_CTX		1
+#define TI_CSI2RX_MAX_CTX		32
 
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -53,8 +53,8 @@
 
 #define TI_CSI2RX_PAD_SINK		0
 #define TI_CSI2RX_PAD_FIRST_SOURCE	1
-#define TI_CSI2RX_NUM_SOURCE_PADS	1
-#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
+#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
@@ -112,14 +112,15 @@ struct ti_csi2rx_dev {
 	void __iomem			*shim;
 	struct mutex			mutex; /* To serialize ioctls. */
 	unsigned int			enable_count;
+	unsigned int			num_ctx;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
+	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
-	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
+	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
 		void			*vaddr;
@@ -465,7 +466,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 
 	/* Create and link video nodes for all DMA contexts */
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
 
@@ -1230,10 +1231,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 
 	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
-	     i < TI_CSI2RX_NUM_PADS; i++)
+	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
 		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+	ret = media_entity_pads_init(&sd->entity,
+				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
 				     csi->pads);
 	if (ret)
 		goto unregister_media;
@@ -1319,8 +1321,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct ti_csi2rx_dev *csi;
-	int ret, i;
+	int ret, i, count;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1342,13 +1345,29 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	/* Only use as many contexts as the number of DMA channels allocated. */
+	count = of_property_count_strings(np, "dma-names");
+	if (count < 0) {
+		dev_err(csi->dev, "Failed to get DMA channel count: %d\n", count);
+		ret = count;
+		goto err_dma_chan;
+	}
+
+	csi->num_ctx = count;
+	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
+		dev_err(csi->dev,
+			"%u DMA channels passed. Maximum is %u.\n",
+			csi->num_ctx, TI_CSI2RX_MAX_CTX);
+		goto err_dma_chan;
+	}
+
 	mutex_init(&csi->mutex);
 
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
 		goto err_v4l2;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		csi->ctx[i].idx = i;
 		csi->ctx[i].csi = csi;
 		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
@@ -1377,6 +1396,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 err_v4l2:
 	mutex_destroy(&csi->mutex);
+err_dma_chan:
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1387,7 +1407,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
-- 
2.34.1


