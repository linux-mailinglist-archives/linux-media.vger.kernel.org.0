Return-Path: <linux-media+bounces-14246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BA91A781
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A101C244A2
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48B218E765;
	Thu, 27 Jun 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rLEENLuL"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960C18A95A;
	Thu, 27 Jun 2024 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493849; cv=none; b=SW0zOLWjjDe1ZXCTOGcORjQBlqev2gb/VaNngVCror94bIRGe8lyOghlj+6bUYMnUzq6a7jqgtQsO42jgZtdyOsA12PwTh36GVzmGSxqpaGNw4OGrcGMNX4CZP9wgWTWjNJIbXXymb3vcNJH4zE6wrG8Jt5Hl4Ie/lsi1ple8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493849; c=relaxed/simple;
	bh=68LVj1oE1pTdNepeTTo1j5i/yW0M1c8ykIhjhV/j7WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JeeOlnFr/OiWsCf142ThwD1V3OxlTmXcrfjkVIU65MKZebl23xZxMqQvTtO8fzWsMurj5fip0wMLgtZMsyao8T0BG6rrySD/Hly958lioHBQBEFxbWyAwKgB9gE92BG6XxX1gbu9rcxVySg9oRJzJB/CF8D8vEugoJk9W8EWWrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rLEENLuL; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAZDe024326;
	Thu, 27 Jun 2024 08:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493835;
	bh=FTR3j+QY166Sc0ZGtrcvupHWrRk9mFeditwaNhcbjOs=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=rLEENLuLdkMOKl8OhfZ8ffH/22Lkc7VVmht1wgw5Ks7I8Z+eXVk8mTBJkKAsNcRg2
	 oUhLTF4ZKpOiI1lKbtpiNwOGJ/QVnHdjVCmbPURnGpC5v2LamQn8HTMv2xTVhBjADH
	 AaIkgwxfPrZX/fmMn6A5nB173m+KrIMoce/htt4s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAZmc029344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:35 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:35 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAYj4038620;
	Thu, 27 Jun 2024 08:10:35 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:02 +0530
Subject: [PATCH v2 07/13] media: ti: j721e-csi2rx: get number of contexts
 from device tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-7-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4925; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=cw/2znIn7kZScgpxBbiZaWCy4kGMw3Xlo68xy9d3zwc=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS4mU/fabnNqcdXABwGDJLt8ROYBhBjUpZXw
 Xv9G+pNNASJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kuAAKCRBD3pH5JJpx
 Rfp9EACT+1bDI/BMDifmUxkESJcsHSE6jPd+pxHJTPymW75Lj1+0Pqla8KtcJ8ARhK+3/pyEKFR
 9e/GUz467IzLS+F1c7fkKY2Yrt6JEcIelv4tvqBV11gck0/o+YZNaGySftSae4L0NIZmdsg9I5k
 6P95gz1VhqodN8ZAzegXa4q1ImrisaYE2joQgahFR5yoULJorxCGIVOZFGU8mueW4Zr9ikRAJhH
 yXmr06z8QGtGkvINyXqq4kW3dn/mfixRewxnRS5DKUUtU/su5nl1sVd+ZqEURYCXF9vMcqw36lB
 FPE5NiBA2qh0NveB8lPUCddsKBRV+UkHMs/oM/nTmaHd6e8CXFXTgBFY6g58PpFqo1FMY4Tihtv
 MNN90/LmIjPeTJ0Lq2bpmI74b/o1Uex2x3wRMtzBBoWALzMooIPvVHOU7gzlirNz7LvpFvR8DK0
 766Q/KSvbV6s1jTHQjQs5/38CCSgQZht37uS9Ef2ABP7p8d2QMrzoAyN6k/jbb9WkjK0QJyRP6j
 UlZGqA7mXTdCWVNF2CFywVHlCWEG8TajOs3p1WKNZRMs79U+I4xyR14GV1Qrpb2uGInsioClZRL
 mMgC/02FTHIpDK8tVVge5xbYO56xRDPyJMefAEEBHDPoQ/A0CjZ6efvlqA0S+9kr6zCq1qoOFNV
 kmM6qKNhXKanhOg==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Pratyush Yadav <p.yadav@ti.com>

Different platforms that use this driver might have different number of
DMA channels allocated for CSI. So only as many DMA contexts can be used
as the number of DMA channels available. Get the number of channels
provided via device tree and only configure that many contexts, and
hence only that many pads.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 44 ++++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 13d7426ab4ba..b4b4bb69c88a 100644
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
@@ -449,7 +450,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 
 	/* Create and link video nodes for all DMA contexts */
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
 
@@ -1231,10 +1232,12 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 
 	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 
-	for (i = TI_CSI2RX_PAD_FIRST_SOURCE; i < TI_CSI2RX_NUM_PADS; i++)
+	for (i = TI_CSI2RX_PAD_FIRST_SOURCE;
+	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
 		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+	ret = media_entity_pads_init(&sd->entity,
+				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
 				     csi->pads);
 	if (ret)
 		goto unregister_media;
@@ -1320,8 +1323,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct ti_csi2rx_dev *csi;
-	int ret, i;
+	int ret, i, count;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1343,13 +1347,29 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	/* Only use as many contexts as the number of DMA channels allocated. */
+	count = of_property_count_strings(np, "dma-names");
+	if (count < 0) {
+		dev_err(csi->dev, "Failed to get DMA channel count: %d\n",
+			count);
+		return count;
+	}
+
+	csi->num_ctx = count;
+	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
+		dev_warn(csi->dev,
+			 "%u DMA channels passed. Maximum is %u. Ignoring the rest.\n",
+			 csi->num_ctx, TI_CSI2RX_MAX_CTX);
+		csi->num_ctx = TI_CSI2RX_MAX_CTX;
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
@@ -1388,14 +1408,14 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		if (vb2_is_busy(&csi->ctx[i].vidq))
 			dev_err(csi->dev,
 				"Failed to remove as queue busy for ctx %u\n",
 				i);
 	}
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);

-- 
2.43.0


