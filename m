Return-Path: <linux-media+bounces-49673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D8CE90CC
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C663305B5AF
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAE7305047;
	Tue, 30 Dec 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dfiO9CIk"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86824E4A1;
	Tue, 30 Dec 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083597; cv=fail; b=lI3ICwCoOAFmdu3AacDnP/1naRVB7IuxKe7D2+aMgKaU9z72I3E0/cI9BMdRVyTu1jj4SgcILgaSoT6MOQjI0A3VpgHVBvfDRBAm0c1jKgVEgu/13JewFnix+N/+RYtoHoCA+GuVkYlw3aGBybIHyCJMufr1CUbqTSFCpoT0MQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083597; c=relaxed/simple;
	bh=4rBwKidSbn9blA+n5wuerKp3imV0bTVzcWPaBuglL20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQofWr7CJi88AkLbHPA2EOSf6N406078Ht2ASpuWYXLOofCEWT6CjFrpIgUxS/Qcjj6Kfx30zJtG1xSRf3CKGWBQ2AhrP6NUyg8UdSFDr4K4a0RX3RnVAXoM3HMGCbi8Og7RJX8GXR/MNADMwy1UksmEwvgbJBMwIguqRxANtxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dfiO9CIk; arc=fail smtp.client-ip=40.93.198.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vrth2AewHKEWND15SgS2IeBiv2miTLsw++gual7Pn/ebJ63y75xP387VacEwSDDU947TpXw3j8Je3134VTnVr+TS7jFNlI7OYcUbtWn3D/hp2O3Otz/UQr/r9WaC3qgcpgFPhpjSFXNQQ8qKZbiO89hNdV5zjbKzdbWjhh4Vl35PX4FGBSjAyPfLU2GBOFo+QjB+plsMbZJTjxfi+z2aov/Y9zrCrzi+pbQUBdA8mlUoXNYgTMzLHKGe7SVY0sWwZ0lGSQTWngisxgoCM+kOWKPWEXpzh8sOIbjCUcdoUTbC+5UjOPpCBZiJZ5pkWYXe8HGLjQmuOS3gOQftBnICGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyVyCVqgCQoXvGXC4P8xhVLXQaOeR+l2SevswnZsEgA=;
 b=khfRC2DXvPbyuF42dESYsppSltL9fc6OANwAipq0Z1n3RGL+dEK6PlIW2x59zGmpIlafLc1aVl4cGlApBPBu8cvH8WVsrLdYo+tAmauBPlUG4LeZccG9Fon8RspiFe+SrzJhbgH2yhdFGm81lH/4XX6afC701Ib9POznme/MQK7L728r3ci2Ur0WNvsLfAfl5t/ce2PXxWhrcYg0R2v5WRGdQdUqhdPYw2oqXoRuP8ucTAfxvTymdDymfoZogs0t0UjgtAuj1eM5vhYEqQqLI9qSHYjoO1QrxSQ5TaaNm2qI1Vr4NUmrRyPZ6n2VcbjZgqSeqDgEebS/DGhtyddKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyVyCVqgCQoXvGXC4P8xhVLXQaOeR+l2SevswnZsEgA=;
 b=dfiO9CIkry34YofHlGRaxBLMfM7U5Jrev2PoUruq+u0V6NZp8RYCDqCiydFr7RSNpjuFXDZIN9jlQ9so69OY4OzxX6LmZv4QPZFLYcVYtmLDTnEIfqCqVkhd/QDBStADFnSZATMN2/V8kadDOElajVOL05bzf/fyZlGXUvQIHAk=
Received: from SJ0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:a03:39c::6)
 by CY8PR10MB6635.namprd10.prod.outlook.com (2603:10b6:930:55::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:12 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::c3) by SJ0PR03CA0331.outlook.office365.com
 (2603:10b6:a03:39c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:09 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:01 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:01 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9Y579464;
	Tue, 30 Dec 2025 02:32:54 -0600
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
Subject: [PATCH v9 05/19] media: ti: j721e-csi2rx: allocate DMA channel based on context index
Date: Tue, 30 Dec 2025 14:02:06 +0530
Message-ID: <20251230083220.2405247-6-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|CY8PR10MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8b79b3-4ab1-4ec8-137a-08de477e1050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PR4fvoSKo/HapCHmFJcs5iXZeSfP5PqdIMI/GNGiXw/HbA+y9a5pL1eXl3uf?=
 =?us-ascii?Q?3NNNsR8flwgTJJ2oAE24OjehdtztiDv9IDMg8gJsBQrTYg3zzgn5Qep0OedG?=
 =?us-ascii?Q?pKtUIN0qf+IIPjBEK6nMD7//xS0/hM7f6KaX+pb1mieS1V8AfSx2yAVJvfNh?=
 =?us-ascii?Q?DCMGW0lxUP6+5LCLTG4AioLkHcoW5s4OJ5SsHWWTHMVIOcCVhkho6W+3RXk2?=
 =?us-ascii?Q?x4gOPmBzSZvg8ZPUTC4zrQTLYxepq2/g52zLzMRZKCOsbOkeqApEysNwjegs?=
 =?us-ascii?Q?JEbV26QKnfuHhQciRyvng9N0ihLEtrdjpADd3ZlFR3b/4ZPnyi9RaN0Apl5S?=
 =?us-ascii?Q?sjsYT/M1Qq4Vw1Ro9K+7zE25mWWcLjeQP4sQv0r9OIMgTMhK0eb7A6OIlrJ6?=
 =?us-ascii?Q?TfsqBSY0qUcX+PfFpIuV8V9mYRmDHPKFkun3rnn3lwY4/cloO0b0V81yo+xA?=
 =?us-ascii?Q?vpfawizYHEaKCG9S7vybFFiQKUjJLRWbroMZCuvsB7Xbw2yRumekZXi4Ew9e?=
 =?us-ascii?Q?NNsJI697LP9vTM4Q1whEmu52RlSMgrl35z0ZzfKX3rWlMCPYsFU3rZEXaRcW?=
 =?us-ascii?Q?j1bFu1nkDAdkOnNfXW0vU8k0cOPYSBEwg3RDMw15pW+gKZDhDluPQoXS41hc?=
 =?us-ascii?Q?JgXAtTiQocEJUWGc5dNRjp8EA76e0sAgT8z6ykCsqLIlsr9f9MP4XYAu1u1j?=
 =?us-ascii?Q?V8Jsrr53gxys9C9M/OMgj9idwl2RwANpPccG89zA1Sp3gK5x5o0Wur5Ti7OK?=
 =?us-ascii?Q?hwzfPyO0vyIyt1UZtImwpIkpPc2s3oqZ/yaAIA03mtqzGSmjJO4Aox9WZunw?=
 =?us-ascii?Q?hdUUa6cvx7iV49DNtqHquhq+qFkMHq5ce1IZHk6O/5vxJBWk6zq4qSaSS0DG?=
 =?us-ascii?Q?fOuyPI4Cu2znAcdiFYc/012JRvx4a5dTORxDboNeALtabMOrYwFIXj8XFHDH?=
 =?us-ascii?Q?clQLrwGPoGV/NXymE+24ejKDO9JLvwqLU9bfH0VICUPRbG9N5aR1RoHrK2Ad?=
 =?us-ascii?Q?lFczSO0SAyUQGi6Ka4vrFA7q1jKCicAq2oCzxChySx9+NP5qEGSm30NlcvNA?=
 =?us-ascii?Q?shO7MM8y4M0GjJ1ze7VW8V854N86s6gpKXB6hwj2aKGgOz/qHrMM8vd21RXX?=
 =?us-ascii?Q?GsXvUs+vzkgFK4BGXR3QZ9yevGp9ZUrFNT6KaIV89yx36ORCw53c8syr1fJs?=
 =?us-ascii?Q?VuGG5v24AM2wmmyaM8CyHngvgRezzJzP5IAK4R6J/a60XrlhTwncIJKn5a4/?=
 =?us-ascii?Q?/vC0uwTbPrRMe5sL2AENwAduwAnBU3jfQCM0lbSl+eWrbLYErFIM+306Cne0?=
 =?us-ascii?Q?Cy/WHg33oa38Kl1dq0+y3SDG09vIIK6/he2DIeM4QSv+eWxmAFURa19T5Sm6?=
 =?us-ascii?Q?D6cXJWonQeLHyMVVwVsKCCVBl4jYzQAekteNmSbzOML+GbdfopETfcvS3zQC?=
 =?us-ascii?Q?iS0MY9eMs02IXaLex7cXEUqP9Tpyk1EoTf53WqeRhmB2c8I21mmUKUDpV+1P?=
 =?us-ascii?Q?+G3DgyM+s2O9sCQDv2y/NIbZyJI0d/Cwk3FsP7R5IAlfotOiOgSRDPKveaH+?=
 =?us-ascii?Q?1uhWqNZJI4xLq9Q+JyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:09.7595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8b79b3-4ab1-4ec8-137a-08de477e1050
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6635

From: Pratyush Yadav <p.yadav@ti.com>

With multiple contexts, there needs to be a different DMA channel for
each context. Earlier, the DMA channel name was hard coded to "rx0" for
the sake of simplicity. Generate the DMA channel name based on its index
and get the channel corresponding to the context.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index fdbe72df5c5f8..f66d68edcd57a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1038,9 +1038,11 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
+	char name[5];
 	int ret;
 
-	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	snprintf(name, sizeof(name), "rx%u", ctx->idx);
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
 	if (IS_ERR(ctx->dma.chan))
 		return PTR_ERR(ctx->dma.chan);
 
-- 
2.34.1


