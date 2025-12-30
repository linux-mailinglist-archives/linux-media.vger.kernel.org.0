Return-Path: <linux-media+bounces-49677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8CCE91D5
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C38D43059661
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAD630CDAF;
	Tue, 30 Dec 2025 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cLlrPzaT"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010069.outbound.protection.outlook.com [40.93.198.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28930C35D;
	Tue, 30 Dec 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083619; cv=fail; b=irvxqi4wsnr29l7vWKaOtnB20mvwYzGAywL4zo3nrCEGSjK+jlDKsnbVcPmcYWonFnDV9uChq7bAWN3ASwIGJtX2ZbCZB6eKE1Glc0n9qjeK0+jgBWYEutlirTPuqJd4Fmu5frwXcGv0mPYwuAKfxmN2o3M/dUalyal37gDgP68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083619; c=relaxed/simple;
	bh=hjSgJfHmR8LPhNEdR/D9Ku+tEHJg8lnUojxwOi3iTKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6RE0lgkjExn7OHORuNiPvAVIqHY+xt2AoSyk54wwvjZtf9GkrLlqXYs0tR/06UEhgSvbjsv83F3rEpxVrmR2ldGPzh+V/SZSHKpXSmN1jeCguYfI9mVpIjM37/JjGlXJ6222CZHfGmXOkHg5WF9JIOQ+/SkmTsa8bPJGTku3O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cLlrPzaT; arc=fail smtp.client-ip=40.93.198.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Amla6yB/OqQwqUhW9A1gOH46Oq55xqFK2hYFzbCBJ2LKlpim7adPA1xgnJZdW0MptCwNVlaWGnTuobmAFHsUCiNylzmRx03ZcooQM5itkxAY8F+pYHA961lpqHgpQVXT64X1fRW1FtvBGTHyrh4oqD0QWCUq87HfWUivyS7kquFwBNUzU+VIq83yQTnd6Sr3yagi4PtJrz65QsakZcsYhgDj07XeYo1MqANgZCQVh3XxOOFXubYcIadtjtYXA7LSApm4wegMoIsxPBV/5IfW2Or9Mb2wql/3paiiy4ooF9S9HzpSH58ki7bNuPEJOeRzYHxnen1mfI1LXrQmclAT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSKbmH8nCu9H6/BTEBJe0GpJUhXHYiBNdYmxLs1hTsc=;
 b=pvEX3gmJ9ytIyx4ieUCSi3WbRPiansmbPDPNzNJkloJb9CnT7RHU/GsmJxPbKo3teGSlNejT1Gzdc6/HgFoGn9ByQr/0/7i2hIkODnrS2QMdwR13Zoc2dCGLhm32iB1Lo8FGxyB6ZfwJhk84OVJZWgww+KC2iynmGkIYZwBXm24N/x1Y8jWP7eXHRBGFIxFyPVWevzQrJH/EtMC+F7MjqN38fBhotDDcKpLom0wYnVu0eeHYvhSVyswaNsFSGPSQX1oWbRUo9Xk/bnPlDY1sttgJwYcu7o9nn15znYWnXI15ABiKw7oc5hRplMwagYiEvFcP//bcb3U5sDfreW4fRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSKbmH8nCu9H6/BTEBJe0GpJUhXHYiBNdYmxLs1hTsc=;
 b=cLlrPzaTOrUX5oGyDH1mxQtC93Y8u6JbaeCMn5G98UfHzFvxUWtXiH6Q8Inx0Tt5EWTREv8Ubgau/o3JQyV64mBw8LCJiW+tRa4sm+jHpVxjadHvp0qbU9JB6oywNIz+/Cl7ZSdftNPQJfXAh7JHTbh63JsgCigDoLQMXwYmuPU=
Received: from BL1PR13CA0273.namprd13.prod.outlook.com (2603:10b6:208:2bc::8)
 by CY5PR10MB6166.namprd10.prod.outlook.com (2603:10b6:930:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:35 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::b7) by BL1PR13CA0273.outlook.office365.com
 (2603:10b6:208:2bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 08:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:31 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:27 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:27 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9c579464;
	Tue, 30 Dec 2025 02:33:21 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v9 09/19] media: ti: j721e-csi2rx: get number of contexts from device tree
Date: Tue, 30 Dec 2025 14:02:10 +0530
Message-ID: <20251230083220.2405247-10-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CY5PR10MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2595c706-638e-4885-da18-08de477e1d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q0BhW9RCgzxBygpb+hEDuBvCXvQ2x/3YCrw699elhjvp1LZDYYxsrj9kc26E?=
 =?us-ascii?Q?RB6Uqzh83lgwiXxqwP/XOJj70VyXz3rO4GfLB6ocG8++/uvMgxpY2cLL2vDe?=
 =?us-ascii?Q?fCystFRdS3DpWH/AFO4O3X5pAClECFEiEAYfDdVnEWTqiT0X9pyG+A2psxUk?=
 =?us-ascii?Q?QaSyWUz7kqA96yQ55AzpAU6Y3BZdTy4qWRiry9fTOLsvTsfPQUhg+11MW5dV?=
 =?us-ascii?Q?LEDb1T//W9oAGjp5CH5VaUFEq0Z7qE2l4Eiw6g9WZfYq2+J/gJSQSsVWuH2e?=
 =?us-ascii?Q?FXwkdsjPTpoX4pomiI9l6dCUPHpCiYnwdHXNWk+9njcs4b6NJMtv2+RDKMgt?=
 =?us-ascii?Q?SNdLbaesGvbbjKXnkY4EV1Ynokij+2y9mwf5y9KE/eiBywYBmWT2Uz/7ZAl6?=
 =?us-ascii?Q?3Q/BcEwaZLdx4rsHfCd0fzUWwYgigez2GGVcRqOlTq4UaX3DGa0w3deQDjjp?=
 =?us-ascii?Q?XqqwE/yfXCCvmWFk4RnxtSbxSlKDpnSyGkQHBHsPFnOpnVn8FoA/ynsbA4PF?=
 =?us-ascii?Q?L3fK0R3nTxvcWAaJroXX4wQ095x+e0LfQgcAr4oGqMGCbcxESc77qKplr6V8?=
 =?us-ascii?Q?8gI3mah/dPLtDgpum4g5u/AvvzyzYyoZ831xhvteatzMgL1Rjf7fx42Dd2Pe?=
 =?us-ascii?Q?eneoL0vzGg9NkND/HAzOSreeaN69ntn/ggJEk6jM4cxv+bM5pJa8OkoqgQEa?=
 =?us-ascii?Q?yv3tevXWMeoawXESehA/7LEmFpYZTAwlOQ1IgYUfHH90Y4w2+eTRTVxxwhYb?=
 =?us-ascii?Q?TaF6DlNN/IE52G60tqscTqKkoSe1VV7huP0QNnR/Mbkw1oN1SI5dG098fSSP?=
 =?us-ascii?Q?tB4+ddqaPHpVbN/uynrKst1GbtO4HduLD1DIe1CdLdWHb7Idz/RyeGTSYoUd?=
 =?us-ascii?Q?vRgnVhrs5ikogcQXiP+k86aZW0cyVAzK+E94CL8d0rw3pLcj6gNrMeuK5B2h?=
 =?us-ascii?Q?wq5IVXuXTcsjS0/si/viz17PwgbDsQoijp+2s9jnUr6CD32NcIhMQQ22S40n?=
 =?us-ascii?Q?ari8C9TNP3Bgk4MwmLBhYoDRyI6DDm9EgXJfrqTwovi8AUJo1E4s9/BN8Smz?=
 =?us-ascii?Q?YBZOhAEM/WBIWw6WPoByqPRvKI8FzkB8EwhvOo8X5zjJMUaQuUK37x70pjke?=
 =?us-ascii?Q?c4cEa3FWBLXgPVGoEMqnXJSG5CrQWHXP7LsS0N+4doqB8USqb3NTNTIkJXPf?=
 =?us-ascii?Q?WFsZNCdbJaJxkQ74YVJYRA1Y5CAQ+LoSzjAao+sfPzBhgDiSkHwom5P1NwY4?=
 =?us-ascii?Q?ctlcAasJzfzSSpy/LLq+MIVv+CMwF2bch9IKDVxdXAYBzjP0FC284FKr9kO1?=
 =?us-ascii?Q?T2Zbb5dGPcBjFA50IVOUyvWJfrQ8nrW+WaweAkPvSXe53Xy8CZ4fzEEQNPYc?=
 =?us-ascii?Q?7ub3DvA9B/ikkLaH8q6ChE6PCv5jOw+BVp/aIdNmmOpCCAMSVMymvh4VQDYB?=
 =?us-ascii?Q?0N+qDgkYWgLYY9wRl4eKklz6FfUaGE8TI6XtxWWnWMmMPIwRMSxgbQ9w2/xa?=
 =?us-ascii?Q?cyfDfUm+Tsv/WYZ8UahQifpBQh5R6Mydtpwtu57jS+mMzTOfQ2pP0z9gAfuy?=
 =?us-ascii?Q?LsezW9mRICa4sSTS4vc=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:31.6872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2595c706-638e-4885-da18-08de477e1d68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6166

From: Pratyush Yadav <p.yadav@ti.com>

Different platforms that use this driver might have different number of
DMA channels allocated for CSI. So only as many DMA contexts can be used
as the number of DMA channels available. Get the number of channels
provided via device tree and only configure that many contexts, and
hence only that many pads.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 43 ++++++++++++++-----
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 8f49ea2638585..f54ad67ff3f9d 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -43,7 +43,7 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
-#define TI_CSI2RX_NUM_CTX		1
+#define TI_CSI2RX_MAX_CTX		32
 
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -56,8 +56,8 @@
 
 #define TI_CSI2RX_PAD_SINK		0
 #define TI_CSI2RX_PAD_FIRST_SOURCE	1
-#define TI_CSI2RX_NUM_SOURCE_PADS	1
-#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
+#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
@@ -117,14 +117,15 @@ struct ti_csi2rx_dev {
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
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -459,7 +460,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 
 	/* Create and link video nodes for all DMA contexts */
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
 
@@ -1253,10 +1254,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
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
@@ -1347,8 +1349,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct ti_csi2rx_dev *csi;
-	int ret, i;
+	int ret = 0, i, count;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1370,13 +1373,30 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
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
+		ret = -EINVAL;
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
@@ -1405,6 +1425,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 err_v4l2:
 	mutex_destroy(&csi->mutex);
+err_dma_chan:
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1415,7 +1436,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
-- 
2.34.1


