Return-Path: <linux-media+bounces-49682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC8CE91A4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CFF93032951
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837FE313298;
	Tue, 30 Dec 2025 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MZoCNoQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFA4312836;
	Tue, 30 Dec 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083649; cv=fail; b=KUba4ZMb4JB8ZiCKa6GCogUIA9zdLxtrcsswqloVUwo+6KX7f/9jP6nY+Sk8YpFIjMtKLIDNhZ3+eOc8lzKS/hpmBp7iRCv9Y/c91MFZ6nro3JcTIO1zzFRieoA40uv72ramWkO9tZ/GBgkT5flNKxWGXTd2e7A8yFBvmtrsiUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083649; c=relaxed/simple;
	bh=TjeIR0NtVyVcbN/H2ZcXoJaZF7CT9GrrjUbLkfL/v3o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f69Pff0XvnZWRZGjX7BzArh8s31Sjxh97UywE72PhY4S1nH55AmsrBb7tTtcp+Cs67pQBzGfxTg6ST7bs90tTqSiONOPBXnD/ZiAbjw4XcPCN6RigU9ythP9ygBazHUEZW6eAuPbPDSw2Ak+/jlM+CpWK9mUPPvebV5/MZHvJmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MZoCNoQ8; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVg5o8siG5zk+GNpnsKGq/onttWqrmtkP6RfrKO3+2PO4K9Dxoep9zs5dJRS/cJRGtTpIM0O5cnZF4nQ2umljWXQ9MgeQEFu9Xuvulk9UXrVbVRIB5NmrVrBTgeLbz+hDOjPOH4El9qYPvSBsz8WLLelWRc2Hh4tySzlQrzFEoSQ5XvRe1FZuR62rtghjPTD0qAGoGMO9tyoGvjLvcFxr4WF7712nS9EnfEayiDqo60czU/xPr1pC4YLdcx68RND0QNGwFX/TXFodZuO/xPE2hq1zjmlFZ0NNDwrPiapiVsFJ+VY+8aFZse5XEU+j1Y3XViMJfzLQ6xjY4KLZ9i9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijA9VJNl/LRT7IyMSm+ZJ1ppx6dBuN652VB+VkDlkG8=;
 b=sPDl8cryL8nrB9LgFh4tXQY0sEK9wIwc4jejVompvkWD6c6QcNZQ7yHBU8uLRV42A4+JlubuBqeZ2anXH88Nqta00CIjJhkgHASuqIGzboXVs7FUftQrzPSNAih/6KJPW1zQwhiq7MmJGSvU79PoqjJclXZPFmuhysDUDsAxKNKKVG+Nb7IJAeUjVTbRa1rzwrwgKiP+F6UX2nsvnPm3t/r1Samn3DQXLnaJfyG+9MKdfFVJDLNtGKZeprgLxcXPo/tO0PiGYhLZShc9pLgvueUhWFNEF1Vk1D6eRuiAOUJC13I+rrj78x9lsL3PH70D14n7FRQaC3IEB5JnqexdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijA9VJNl/LRT7IyMSm+ZJ1ppx6dBuN652VB+VkDlkG8=;
 b=MZoCNoQ8e244jJ7e9ZhNANFDlHj8W3hOGJZwfFege8jM0VIrALQXhYIrFq6/FM0ShFhLTvAsTYHenRWoLEo6FkLVVspxV8uAcogPW+bf7aaYsjR9EpuxWV/M04AqaJr3B+BVKAXJZEf+jYpWPox2oaSjSFoM0ksheJ4BG2G1LL0=
Received: from CH0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:610:e5::8)
 by SJ0PR10MB5696.namprd10.prod.outlook.com (2603:10b6:a03:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:34:05 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::34) by CH0PR03CA0243.outlook.office365.com
 (2603:10b6:610:e5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 30 Dec 2025 08:34:04 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:00 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:34:00 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9h579464;
	Tue, 30 Dec 2025 02:33:54 -0600
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
Subject: [PATCH v9 14/19] media: ti: j721e-csi2rx: Submit all available buffers
Date: Tue, 30 Dec 2025 14:02:15 +0530
Message-ID: <20251230083220.2405247-15-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SJ0PR10MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d9869f-ac4a-4648-c4c7-08de477e3100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZCiK/+deNzmH098NqoRvUyIOQkvdo7Klw8M43WFlAiPXMi2Vda1jtg4RiNmk?=
 =?us-ascii?Q?eq7t7hI9LSBnj67CQnJANNDEI6DS2MH9iM+8VifYllKX1VPKRd6vgVAbCjYt?=
 =?us-ascii?Q?UklHQxqpEHEbFUOD0kWTuv05BrNePPyVynp8S9rNsWbdvNCtM9wBzDz/YHYH?=
 =?us-ascii?Q?0sxotzTpgQBlBjTgX4E2YUstDcvHZ5wdHWWgh+hdk1LDKOI4rUH9cTXRLUTp?=
 =?us-ascii?Q?1Rje9UPgqjR7iymgrR4VR74ucou1nRgWw6vH7+9yISXl1ZxkbouOuvKmlh6L?=
 =?us-ascii?Q?cOWuUcNY9dIK+aOUaMk16DjZN8/V0v4v2iCogCU9o8TuIp7vTrMKtGbanWJs?=
 =?us-ascii?Q?aOGdXt8xKvHBjRaqmf2uxSlBGI8z+OWXiSiLEDledUYRVUTQSZxDXvsl1Og5?=
 =?us-ascii?Q?V7nFE0u7ozD1Ye7YfgVneqG8gGMp1+ANSFy8bYYVDgddDFOh/Dy6Z24b8Jxk?=
 =?us-ascii?Q?0Nr2C0rjY/7GKsLavSVsMMOCe15xmroXokMr0cfRj809PX23aRbR8Roqu93G?=
 =?us-ascii?Q?iC8LHjCj05bhteiv/OfjdgymZ7RHC0o69CB1QtnVyKqRPcf6SdefdqRPm2ld?=
 =?us-ascii?Q?bUIM67yuGp5q3TT/vUtXIekgvHWT5z+V12zL5rNeL4JM3Ox5X+Kl+/YJn8gp?=
 =?us-ascii?Q?yr2JgYHjqx+rtKDYFCyyBLXKpkCCAjyGZDepiOPscuFCra6vTL+NI9OVxxfR?=
 =?us-ascii?Q?K1eu/HyO/4pnLhLPExr5l6flkkfy4IjzEqAhYj8WtKgi7zAjNNnU+rqnvgo8?=
 =?us-ascii?Q?JDFfBNMnKbAoDzi9WxRpq6A0ul0aLGuFz+YDQ+SdLakt20Vd+KVzLH3LVtKY?=
 =?us-ascii?Q?045JAOGgyAUIbTLQ5lye7fqKWYPA6Y9LXs00Tgunhw4sAjyaDaVzj1srLm1y?=
 =?us-ascii?Q?//CvQ1j3rYYmsnzy1GrKKX20iTY7dGvkvb9Z/dDTsw5g+x2msoIViRPpqr78?=
 =?us-ascii?Q?0Q3nxQmmcHlSa6/cmj1wGefwNl7JJNtW3pmZoVZI3MkuxqYAKbrX1WuzAsCx?=
 =?us-ascii?Q?gujOp/9AQpL017a1GSCtzRLhWkk/8Q/FXUAhXg2BwuAPeblBceMg0mzMA3CX?=
 =?us-ascii?Q?x8nQnmthNkYLi5Q4z1uhm6fPeJGMJ8ZY7pmiiMD23T1REqaYSz9ii86PzvwG?=
 =?us-ascii?Q?V2YFI56EUXP2nzRAKqMlDXqHV3nm0a7h0RGBy0RGVQ8L9L6oFQEH5jrja6JX?=
 =?us-ascii?Q?UWzPZ96K7URN1M1+ZKQKdjx9FZWc+d1poH7V8ckTPUb/hv4aXToDWooJWWkD?=
 =?us-ascii?Q?WDDf4QZ/dEjhhLdnceFlvae1FLRiknvzT+YUDp4AzrFhJmd+i5t/krzeyC7e?=
 =?us-ascii?Q?jf91PG0uyDXCsc7xl8IbcGoLOQRn7uszaw3jT2vCzcmY0Yh+ZFhrd3T/wUWh?=
 =?us-ascii?Q?Q1bd6uoXV+7IKEeIFMCkleaJVbH4zRKODEnt6wVJPeGe5qJhib7pkL9VKrLr?=
 =?us-ascii?Q?ksEmB03qhuonQtg9DMYQ5oBrynSoxZEABG+/4jDWsWMaNav0ch5QPz0W/jOQ?=
 =?us-ascii?Q?ISP5jTGkIaMma8y8mbSLnIUeRhGKBpTD+WDv/kpOCFldl2I+ws95LR2+fwyT?=
 =?us-ascii?Q?+30Mfq9kCIhBpY9l5tA=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:34:04.5890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d9869f-ac4a-4648-c4c7-08de477e3100
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5696

From: Jai Luthra <j-luthra@ti.com>

We already make sure to submit all available buffers to DMA in each DMA
completion callback.

Move that logic in a separate function, and use it during stream start
as well, as most application queue all their buffers before stream on.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 42 +++++++++++--------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4a063364f893e..fa6152464d4b6 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -672,11 +672,32 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_buffer *buf;
+	int ret = 0;
+
+	/* If there are more buffers to process then start their transfer. */
+	while (!list_empty(&dma->queue)) {
+		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+		ret = ti_csi2rx_start_dma(ctx, buf);
+		if (ret) {
+			dev_err(ctx->csi->dev,
+				"Failed to queue the next buffer for DMA\n");
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+			list_del(&buf->list);
+		} else {
+			list_move_tail(&buf->list, &dma->submitted);
+		}
+	}
+	return ret;
+}
+
 static void ti_csi2rx_dma_callback(void *param)
 {
 	struct ti_csi2rx_buffer *buf = param;
 	struct ti_csi2rx_ctx *ctx = buf->ctx;
-	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	unsigned long flags;
 
@@ -693,18 +714,7 @@ static void ti_csi2rx_dma_callback(void *param)
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	list_del(&buf->list);
 
-	/* If there are more buffers to process then start their transfer. */
-	while (!list_empty(&dma->queue)) {
-		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-		if (ti_csi2rx_start_dma(ctx, buf)) {
-			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
-			list_del(&buf->list);
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		} else {
-			list_move_tail(&buf->list, &dma->submitted);
-		}
-	}
+	ti_csi2rx_dma_submit_pending(ctx);
 
 	if (list_empty(&dma->submitted))
 		dma->state = TI_CSI2RX_DMA_IDLE;
@@ -1143,7 +1153,6 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
-	struct ti_csi2rx_buffer *buf;
 	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	u64 sink_streams;
@@ -1170,16 +1179,13 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	ctx->sequence = 0;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
 
-	ret = ti_csi2rx_start_dma(ctx, buf);
+	ret = ti_csi2rx_dma_submit_pending(ctx);
 	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
 		spin_unlock_irqrestore(&dma->lock, flags);
 		return ret;
 	}
 
-	list_move_tail(&buf->list, &dma->submitted);
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-- 
2.34.1


