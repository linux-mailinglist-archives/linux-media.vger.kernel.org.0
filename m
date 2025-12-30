Return-Path: <linux-media+bounces-49688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFFCE9147
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C18030133E3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CD8321F54;
	Tue, 30 Dec 2025 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dGMDK5UL"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F6320CB1;
	Tue, 30 Dec 2025 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083730; cv=fail; b=fGggIDR5uz7wM3aT9SbGZUDge9QCfG3p3WcxJyPBM4K4O5pMRDTxBEIMRuVNNoN2XG+TIy56YfNXP7xhJutZbEzG1TV42/zB9Rz1rV/m0vrbtPov+SprqT0yJZJAZCUcfzVdBfh5JWuOfE5YXyfOJvSZstf60/7WGcGbREZz3d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083730; c=relaxed/simple;
	bh=5B6j1mZjcoCiIm6xO9Dotf4+SPIx1bdkdJxE2ZjzsFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AovvzeW46rFGRkDhKqp5SfdjiI8kQMEAPaESsKlFCr+ztOiOaOp0OAUg1JHfkJrT047yICMG4fAJIWYiDGbrgrWyvuuVx8LPcwYKsanSSNacDJ8A0C9Xm6sDhS/+5Nh1UC8gjMjcbJeKMk/SwHRdcK9N++TxKYNLwYpovEGrujo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dGMDK5UL; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGU3+DsXobTInbJb6XW63dfiR0un0f6D5koMLhOjQzVGKyp0xqvHG7msBcLsYLVtnMBITZcq1K80R087FSGN99bNdVuC6qvYBuKofclzNhC7bYp4vQVj6qT6PziC4wsQ77t0i8VPCNWx4bFA9NQNbBn2mgNW4Z4NiP7TS+aLcmFOqwG8s0AFP+3Xic02m2c5irPrrEU6axmesnxOluDBkkTvmpw+7HfSKFj2tREmX75v8/qFwKwkSSSK1wQAplcclGVP1c4uksDvOXyyBXQchZIooyR7QParq/ZdwVVXHEJWFNQcNV7jL2rtwWKd0PwVmA9gQJnr9fLiJ5C51q7+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5+SmWo/m/BD4868dX/kVNeXjTg1wVj5+bTh3gIVVVE=;
 b=E5ERDPrBC35t8QX5i80KKhohYu8VJkuHk3WZDxGLQXfwAIfMrPr+AyXEg8sX5NBe+7Ry9KFnnhhyKzEoXnL7Eu5BTgUw843/twnXtE6feRbyBw3PBdNrp3+1NUTtgsz0NQyyzerG0XirL1LhMAOISyHC2pXkMM1P1fUl/9cLDiUCqPo3lcD+6Y89t4wDDeazBGdFGztMFSiFS8lxu/WN0fxIPzuOLgNFcDjjZK7g5+ph9gzX/iAWyNU60+fBcHZQGARFjxyobljmFqcJu3zwAvwSuFnPijENw32+0lY0zpBIQNiFsYIaksA7er9xXf5jE0qt1q7c9lp/sQM7J52Yvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5+SmWo/m/BD4868dX/kVNeXjTg1wVj5+bTh3gIVVVE=;
 b=dGMDK5ULT03RkYtxfstIUoSHI8jNkLsHcwuCxRtYypAAs1rj6+69DW3JR3sBr9v5adcTPOWmGJ2umihKFNuP+CqK/jniJeZUNDKCTGKW6qKNWvj0wxdz50YlNHZ5YCQLIHsWDIEbP3595mIiIGJiwtE1b4tBd8Jg1DdfoqYn18c=
Received: from BN9PR03CA0320.namprd03.prod.outlook.com (2603:10b6:408:112::25)
 by PH0PR10MB5658.namprd10.prod.outlook.com (2603:10b6:510:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:34:14 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:112:cafe::42) by BN9PR03CA0320.outlook.office365.com
 (2603:10b6:408:112::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Tue,
 30 Dec 2025 08:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:34:11 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:07 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:34:07 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9i579464;
	Tue, 30 Dec 2025 02:34:00 -0600
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
Subject: [PATCH v9 15/19] media: ti: j721e-csi2rx: Change the drain architecture for multistream
Date: Tue, 30 Dec 2025 14:02:16 +0530
Message-ID: <20251230083220.2405247-16-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|PH0PR10MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 955f5d6f-59cb-46e9-74d0-08de477e352c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9WTHhe3lXLKTg4GcAUU26qM3UeZompS1edzMyiSPCCsk/elCHZb13s4IdzOK?=
 =?us-ascii?Q?p5ewzp5aW/0GdJWWyC4N3gvZc/VacZyPabcoENPoSIOsUFf6zCRJ3x8VU/ci?=
 =?us-ascii?Q?3OslGWgOfOkX2NLlVcB4LP9dP2srG3rMvlb+HZILGzU/Aa+S1B7RwKtEk2PP?=
 =?us-ascii?Q?u+0l3YFMoPlJWItMftYfB/r/k8QMV0YPpTMbx0CskkKPimfXykIMgusY9oY/?=
 =?us-ascii?Q?DqhoaqdXqrDVwTmMx+cUXCyv7moN8ERlQz2yi956/XBI4VTefwPx8+2lpYct?=
 =?us-ascii?Q?xwIivk11PUfEsgxZ2htSt0BNlkSax7/hafFEM6t8CV/BkeyUhVaPGs0M3i5S?=
 =?us-ascii?Q?GkxBj2AuNzhK1omy5hwHjnFSOUvIo9oq2zCw8wafOyOHJHKSw4ZkNWqGoqeU?=
 =?us-ascii?Q?L+07sFaKxX6Cfj+vj8GCaWMJFd5W01fGUkY3DBGs7gAc3wXIfifjoFDz314m?=
 =?us-ascii?Q?ldzUNh07p6L9XpfMdsoivoFOScdS2i06A6Jj+ASLMO0aCkPVwjO/miEhjFLr?=
 =?us-ascii?Q?5wJ61n1/q5uU6Hsy9CqtUFPcxcKix+eHCrCRZbaZADMEuRmARll4ohkLYmOV?=
 =?us-ascii?Q?cF8wYqS4M7+lpBiL61DNwGeSsKfMP5JOQ7ZnmaBND2qDV4IHeGSwSpJHnDS1?=
 =?us-ascii?Q?5nqRCsVxIdgA8aMtTfZYz8PYkFUJXcGhb49zlcFqg3UAn8cehVE/5YFK14Gu?=
 =?us-ascii?Q?+F8xvcY3hDICvUL8EH4etsBvFvvFUm3pz5N0uFinM+bS+V7p8s+/M92afd54?=
 =?us-ascii?Q?lYc1Hq/QyuwLpiGXnsRUTK8YlHvVxNpJ+0vSETcndgjdCk3U35gOfhHWeg9y?=
 =?us-ascii?Q?Dm8R8/EG8wcseMl4BdzGApy5afBeh/OOqFJE0xWaucG5p2fF8YVbHfHDXXkj?=
 =?us-ascii?Q?aAS8uwwMMLwYII1uadn5YxTl3i8QWi2r5pcJ8Ypw0/0RhVU4nH2LXHwiUuF7?=
 =?us-ascii?Q?YuChvg3TtW+QpFwPSByYli4BKH4fi2u3SqZCT0UxvHQh39vWNlM++MYumpdL?=
 =?us-ascii?Q?k9Q9EDqseThSbq0K7lf89y38llFnzJkj8xo0EO9U4nPyRPasuF5ZOr4XV0IA?=
 =?us-ascii?Q?I6tIu7aQuVfmRwTVKWdnJTE6PHlB477GlRsTv9YgHKbFQgWeXtDtmzbTqPAa?=
 =?us-ascii?Q?V5rjaASbnFAyjPk1ZNbuBBL4bitm2OI73XcKOyB615auKVftWly4PL7In9As?=
 =?us-ascii?Q?Omn14EpVK3efDHxdmwNpu7OYBhIu8HYBBdxSwEy2Pxq0t+OmJ8KbM75cO2N5?=
 =?us-ascii?Q?78v6qqN7/xs6WHEswAhJTYUrGAtUb0Ew3h5RE9N8NhoICXCpH6ID7DSTqAjN?=
 =?us-ascii?Q?tz3DiuwcupIqSyBoBVVNQl+MHWS0srLTGrvGiSLWaP6v2hfaH4aXxDNXgZ6L?=
 =?us-ascii?Q?i5M68dpjehjfkjsXm76KDGSBDpjo1/7kDv77QVa1OsLUnPjUi/Y3+SFgt+Wp?=
 =?us-ascii?Q?2gtBXm+5MJTEs+KKGOW+WZfjU6zs8rxX5ewc0XePyC5BFxku11il0MD+2BKo?=
 =?us-ascii?Q?6eJY/xAR79QK1iMgRoDgyz29Ks2BDBPFDRzbbJ1em/VkyFEPkhd2suQhFB8x?=
 =?us-ascii?Q?VPYC6v9dQr0X0FiA9Z8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:34:11.5519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 955f5d6f-59cb-46e9-74d0-08de477e352c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5658

On buffer starvation the DMA is marked IDLE, and the stale data in the
internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
userspace. This approach works fine for a single stream case.

But in multistream scenarios, buffer starvation for one stream i.e. one
virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
stall the pipeline for all other virtual channels, even if buffers are
available for them.

This patch introduces a new architecture, that continuously drains data
from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
available to the driver from the userspace. This ensures independence
between different streams, where a slower downstream element for one
camera does not block streaming for other cameras.

Additionally, after a drain is done for a VC, the next frame will be a
partial frame, as a portion of its data will have already been drained
before a valid buffer is queued by user space to the driver.

Use wait for completion barrier to make sure the shared hardware FIFO
is cleared of the data at the end of stream after the source has stopped
sending data.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 112 ++++++++----------
 1 file changed, 50 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index fa6152464d4b6..e713293696eb1 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -82,7 +82,6 @@ struct ti_csi2rx_buffer {
 
 enum ti_csi2rx_dma_state {
 	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
-	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
 	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
 };
 
@@ -109,6 +108,7 @@ struct ti_csi2rx_ctx {
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	struct media_pad		pad;
+	struct completion		drain_complete;
 	u32				sequence;
 	u32				idx;
 	u32				vc;
@@ -251,6 +251,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 			       struct ti_csi2rx_buffer *buf);
 
+/* Forward declarations needed by ti_csi2rx_drain_callback. */
+static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
+
 static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
 {
 	unsigned int i;
@@ -617,9 +621,32 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 static void ti_csi2rx_drain_callback(void *param)
 {
-	struct completion *drain_complete = param;
+	struct ti_csi2rx_ctx *ctx = param;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dma->lock, flags);
+
+	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
+		complete(&ctx->drain_complete);
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return;
+	}
 
-	complete(drain_complete);
+	/*
+	 * If dma->queue is empty, it indicates that no buffer has been
+	 * provided by user space. In this case, initiate a transactions
+	 * to drain the DMA. Since one drain of size DRAIN_BUFFER_SIZE
+	 * will be done here, the subsequent frame will be a
+	 * partial frame, with a size of frame_size - DRAIN_BUFFER_SIZE
+	 */
+	if (list_empty(&dma->queue)) {
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev, "DMA drain failed\n");
+	} else {
+		ti_csi2rx_dma_submit_pending(ctx);
+	}
+	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
 /*
@@ -637,12 +664,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct dma_async_tx_descriptor *desc;
-	struct completion drain_complete;
 	dma_cookie_t cookie;
 	int ret;
 
-	init_completion(&drain_complete);
-
 	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
 					   csi->drain.len, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -652,7 +676,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	}
 
 	desc->callback = ti_csi2rx_drain_callback;
-	desc->callback_param = &drain_complete;
+	desc->callback_param = ctx;
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
@@ -661,13 +685,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 
 	dma_async_issue_pending(ctx->dma.chan);
 
-	if (!wait_for_completion_timeout(&drain_complete,
-					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
-		dmaengine_terminate_sync(ctx->dma.chan);
-		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 out:
 	return ret;
 }
@@ -716,9 +733,11 @@ static void ti_csi2rx_dma_callback(void *param)
 
 	ti_csi2rx_dma_submit_pending(ctx);
 
-	if (list_empty(&dma->submitted))
-		dma->state = TI_CSI2RX_DMA_IDLE;
-
+	if (list_empty(&dma->submitted)) {
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev,
+				 "DMA drain failed on one of the transactions\n");
+	}
 	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
@@ -754,6 +773,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	enum ti_csi2rx_dma_state state;
 	unsigned long flags;
 	int ret;
@@ -763,6 +783,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 	dma->state = TI_CSI2RX_DMA_STOPPED;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
+	init_completion(&ctx->drain_complete);
+
 	if (state != TI_CSI2RX_DMA_STOPPED) {
 		/*
 		 * Normal DMA termination does not clean up pending data on
@@ -771,11 +793,20 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 		 * enforced before terminating DMA.
 		 */
 		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
+		if (ret)
 			dev_warn(ctx->csi->dev,
 				 "Failed to drain DMA. Next frame might be bogus\n");
 	}
 
+	/* We wait for the drain to complete so that the stream stops
+	 * cleanly, making sure the shared hardware FIFO is cleared of
+	 * data from the current stream. No more data will be coming from
+	 * the source after this.
+	 */
+	if (!wait_for_completion_timeout(&ctx->drain_complete,
+					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
+		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
+
 	ret = dmaengine_terminate_sync(ctx->dma.chan);
 	if (ret)
 		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
@@ -838,57 +869,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct ti_csi2rx_buffer *buf;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	bool restart_dma = false;
 	unsigned long flags = 0;
-	int ret;
 
 	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
 	buf->ctx = ctx;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	/*
-	 * Usually the DMA callback takes care of queueing the pending buffers.
-	 * But if DMA has stalled due to lack of buffers, restart it now.
-	 */
-	if (dma->state == TI_CSI2RX_DMA_IDLE) {
-		/*
-		 * Do not restart DMA with the lock held because
-		 * ti_csi2rx_drain_dma() might block for completion.
-		 * There won't be a race on queueing DMA anyway since the
-		 * callback is not being fired.
-		 */
-		restart_dma = true;
-		dma->state = TI_CSI2RX_DMA_ACTIVE;
-	} else {
-		list_add_tail(&buf->list, &dma->queue);
-	}
+	list_add_tail(&buf->list, &dma->queue);
 	spin_unlock_irqrestore(&dma->lock, flags);
-
-	if (restart_dma) {
-		/*
-		 * Once frames start dropping, some data gets stuck in the DMA
-		 * pipeline somewhere. So the first DMA transfer after frame
-		 * drops gives a partial frame. This is obviously not useful to
-		 * the application and will only confuse it. Issue a DMA
-		 * transaction to drain that up.
-		 */
-		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
-			dev_warn(ctx->csi->dev,
-				 "Failed to drain DMA. Next frame might be bogus\n");
-
-		spin_lock_irqsave(&dma->lock, flags);
-		ret = ti_csi2rx_start_dma(ctx, buf);
-		if (ret) {
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-			dma->state = TI_CSI2RX_DMA_IDLE;
-			spin_unlock_irqrestore(&dma->lock, flags);
-			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
-		} else {
-			list_add_tail(&buf->list, &dma->submitted);
-			spin_unlock_irqrestore(&dma->lock, flags);
-		}
-	}
 }
 
 static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
-- 
2.34.1


