Return-Path: <linux-media+bounces-49672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE0CE90C9
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1119130517D6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC203064AA;
	Tue, 30 Dec 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O2+dWRMF"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3E303A12;
	Tue, 30 Dec 2025 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083584; cv=fail; b=clf7qc8qiLoNjuLVCxlN7yb7ialRzFuHhlmZQVeB0V/0Kr2BLe7trCs+wtMUzD72DqOuXznV1dmfVxHw0gT8bJUKfTWhAooTaLqBfdW242E1wqlz7CZERfcNb39mS3Eqh2J0/8Gsl3DVVgcOqPPM40nfsPkOhn959t3rWjt44Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083584; c=relaxed/simple;
	bh=2AzDDQ/c33gDTUejdZzmjwebk2IrQn3OwFoYgpL3lnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QClUdcxG1ku3l3AAkQB0L+y85KLQ49WF3NDPp4Xa9ASq/64aHRcc94i29MaNp1kVhjEkprvue23uoZ6IKSt4LrGz0K97NfOZyIspF6v2x6yHDJ6QthCLo6gnf82mHwYgOiXfol73z+qWWSt0nNV06Y+iyar7ljX4xCx6twIZy3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O2+dWRMF; arc=fail smtp.client-ip=40.93.195.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcwYu/p64szaWs5w6YAJkj5G2noJiYy7WF1wgKKAbSFPWAjTVY2EgpoPslxYyfa1w5QJZIFlIFOX6HcQi6zTWIYOMt03vmnnCMSNKw92Y34M3kfR7xwuqPT/pK/eO3xHPUdvsws9TG5uHmI5YUAhoMyjSJB7XTc9zzygblUvGktrjidcsF+i8iIpVNVnESljRA4AZetCRWDz+BuDqEIpZWRP4KLU0bMYCRx9+/V4yiwS0b3OSVEd1cEWuBmXgj6p2brwe1D/WUBRziXCXxcH8Dlqiz5xzXuTPa/2DGsFLgcSGX12tHCJ0OSlPqPNi4VdpMgLKT93MWqql0NB9UBT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2uVnM4fJLG2Q8yNrNtcnhK4gAywDIJhuWg84A8RS4A=;
 b=kSCI2lW+AjjIxZFP2m1sfpqIT5q422tlaFH4nknDnldJ7+4KNucYHX2cbH7kstd2QtkF5vMyi3HuvwaxaZc58QzZqAD3INAK8dEwucEQIT29/Dtbzk7yaGMC9hUvsotZr4glYJsQ7xumuMBHpnjSSawIXctKBiZQU1BBzoh4Cb2Dl7K4RZOoWGij4c1mhDfGIuXIwfW4SXPQF5pS+Zhgbg+BvECM3jRKDRMPGGmerBpnE9YegiDH0szxSIRzihxanP0HvS5V6iC7qjhgrAcli0JOjXEVlJG88QlcG8D3gTiGOP/QYhD2wVBQr+JtjwrAaZ0cnP4IaCAdsDuUoeYbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2uVnM4fJLG2Q8yNrNtcnhK4gAywDIJhuWg84A8RS4A=;
 b=O2+dWRMF2IEznCm21lQI/vRkRzgMRHrQMMytIuabjYv+F7gMl6rWTh00npsSGL6+xvZk9mHmNT/D/mgpfeKqu3TnEEpcMLKsFoGmgLqtTOqoZ6ApLy3VYWrB7cEsLL2WszbRU80/prs275ySvnfZ0MItXwCp2MG9N0K99lgi9HQ=
Received: from BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11)
 by IA1PR10MB6243.namprd10.prod.outlook.com (2603:10b6:208:3a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:32:59 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::ba) by BY5PR04CA0001.outlook.office365.com
 (2603:10b6:a03:1d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 08:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:32:58 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:54 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:32:54 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9X579464;
	Tue, 30 Dec 2025 02:32:48 -0600
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
Subject: [PATCH v9 04/19] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
Date: Tue, 30 Dec 2025 14:02:05 +0530
Message-ID: <20251230083220.2405247-5-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|IA1PR10MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 907a2cd5-69eb-47d9-ff2c-08de477e09ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JsCCJKJvBrgWdZWgnLWHngI+5G54SQ2Mq7nsAcMgjcQVJolZsN7dQwQ/LJKT?=
 =?us-ascii?Q?de3ORLUGmHWZ0B/J4SAgKY4J3EmLVMWgER+A41rOLZ0lJk4ve9ZOL7nTIbA7?=
 =?us-ascii?Q?juD5R/lE0+uHLF0O3TQEzw7Z9zic33FwrCHp7kjnmQa1dyy3GjG8ZrXxc25Z?=
 =?us-ascii?Q?dEtPxonwQ+eYB8TfS+9Clq2trRaUZPQnUyx/UTk5rlG6mzBVDc6Rp5l6Se7l?=
 =?us-ascii?Q?QuI+NzQdOrJ7n++0ovtIa5wBphE5ZyG6Emdth+ZX7lPBLOWc0MTi+Nq6vwS9?=
 =?us-ascii?Q?Jr3tGtPb2bKe0tlpy2WMCZnMgG5C3iBB6gFiWgvRtr9VmIRAGYbu2jY89sRB?=
 =?us-ascii?Q?76ocyIACGswHvcksOcr5CVDThcYpCoqeKIoJZSnrpsQ9Ex2tOqevjLAkLZdw?=
 =?us-ascii?Q?SjsBqw7sdf7fMIoqq46Cc4EqdAs786Y5/9kqQTW6NRq/d2A0uFJZfPSEepCZ?=
 =?us-ascii?Q?ZQiIIlyATnIRysg693xspeSMT4yH/UTfhOp4TI8rnxC0+jC8zGi2ysTsQwSj?=
 =?us-ascii?Q?w4BXwjdfNVT7gUbZAJX8pC1jt4lXV3gp9b6oJGwDzosVdFDMde658QU6NORO?=
 =?us-ascii?Q?OvQBJq3PD7hiNgTxMbT8MHgTbYqUWSC9J5Nmv6I92E/5twcA5W80w6F0yEhE?=
 =?us-ascii?Q?UL28B/czcQzDatb1uDadFJNzsNcG8pOkQkqyslO7Mo+FFAtjDDnJhFD4rokj?=
 =?us-ascii?Q?7ZpJAl7LYjejQ6FFreuDew86vCJ9ASGqzOSvVzeFLHH9Kr/Tu2A0YbAOrk4y?=
 =?us-ascii?Q?E31CES4zpWxKzF9rpLlA+My20s2W8rDR65pv407B6ddYzal4JrnlcROcf6nb?=
 =?us-ascii?Q?invn1ZWTy4SnAXnUvCqOcFz1y4r2HvyHOG77nUr4PjcKD9Lndvgo9TPhc34h?=
 =?us-ascii?Q?FQX3tLCDbXamKTyJfwCXT08DFD84YERZWs4agWCrZsnbyvVVHWmKegxt3qA/?=
 =?us-ascii?Q?eeBXeBXLIFNxPB6fVvZzyAiHeqZI34eaF9n5325PgZ0Smhq0or8QVBO2UW4V?=
 =?us-ascii?Q?uzHzemy//u9KEWpTpITIdL64Izp2ZwUfTrlJh+4Fd8tax5ux8zftDKhm5ZXE?=
 =?us-ascii?Q?rQWYNo/cuuzHEU0mGUYYxelHGwSYVJeO3NLJaz3r7BDVHeU2YcbPu35MpcUB?=
 =?us-ascii?Q?MwwiDr4bPskro+3eE/dALkCAP/ZcyrY5sK/k97kJ7UmZIBvX5rP5NXhKwN5h?=
 =?us-ascii?Q?wViYZl63hvwsVfW9ewuzUXc/7MivxvfsNBaCe4eRv8PqevJ0Tk6X/W+AsrHD?=
 =?us-ascii?Q?f4rEVclPInCdiH9x8Fvvm//RoDLRv0WdWCrbg5eJdxJ0t1kfbwT//sXiIC7S?=
 =?us-ascii?Q?s4jYmRFqKL3RZ+8NJfFej/OV7gLJeflh20F8v7MNupGLv+UUKqhPUBL42nI0?=
 =?us-ascii?Q?3T+U2zf7ekY26QDpKgNpit34ZZcrmtmgDRNUjIjF+PC2n7Hi2w5P6obRVhpT?=
 =?us-ascii?Q?87lSl+wLhjDjnkgZvC4jONz6deQvIS7qqB0otyFgk3eNV3xWH3fi4/t2n5ED?=
 =?us-ascii?Q?bSu+H6hk6Au9KOXyL6stQ3/r9IHM5LcM39+qLduXR+sYyOODwwfakxRoasLH?=
 =?us-ascii?Q?q0PSf1kxnzO2YlMlUA0=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:32:58.6348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 907a2cd5-69eb-47d9-ff2c-08de477e09ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6243

From: Pratyush Yadav <p.yadav@ti.com>

Currently the SHIM code to configure the context only touches the first
context. Add support for writing to the context's registers based on the
context index.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 23717a3b6c4cf..fdbe72df5c5f8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -27,7 +27,7 @@
 #define SHIM_CNTL			0x10
 #define SHIM_CNTL_PIX_RST		BIT(0)
 
-#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
@@ -38,7 +38,7 @@
 #define SHIM_DMACNTX_SIZE_16		1
 #define SHIM_DMACNTX_SIZE_32		2
 
-#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
@@ -568,11 +568,13 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
-	writel(reg, csi->shim + SHIM_DMACNTX);
+	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+
+	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
 	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
-	writel(reg, csi->shim + SHIM_PSI_CFG0);
+	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
 }
 
 static void ti_csi2rx_drain_callback(void *param)
@@ -890,7 +892,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -905,7 +907,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
 	if (ret)
-- 
2.34.1


