Return-Path: <linux-media+bounces-49684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB6CE91D8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E0F305E3E8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21BA314D1F;
	Tue, 30 Dec 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I6YuD40X"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E413148BD;
	Tue, 30 Dec 2025 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083667; cv=fail; b=qpk5lyNNBHURwnJdvHsDyD2ALNWKjEvmv/bS3wc6ObuF32A9A/+FDnPZIH78bk/p0ZvyEub5PIYGj3CnNSQCLFn6B7ZYZy5RQKgtTYXW8cLoOX4BohWWb0Em2Q8AG1gKNj9WfMJ891Lxr2TFCGt84v/WBOIl+U4YyGzc8iCLDmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083667; c=relaxed/simple;
	bh=nsypA1ThsPLG9Er39WpW3C66WKE9PmvGr+/xnUUtYZU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSnY5z/xpn2vOL5pmtAbhNx6IRtalIuGCqbfH//tWjm5ei+UKfaNz8DLsa0TotZk01w5z+GP5/58/bRd1MbCaS88ZFn47G7fNocBogDGff9+o6iMPbaBZIbgkR9FMJysYnYXgOuAsyzC2PB8NPcKJZ4MRE2cWFmSYVYuqBkQ1ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I6YuD40X; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyDlxOjSs+PmkEUHS/YHqiYyO9lsZqcbFORICDbJ4gvHyDGODHTs+4b+Zpo86BdgvjbT8jR7GQRMpsNYvsx4koociZQkyqqpf0JbZhT4I++UBXsTNVVVbcq1dy6ejU/DvMyhld1gw+IU0SQE1aaMQ/dSQyr1DIJDfXI+Nj5pLh9977FvIW6JGr5lgN37yid/m+hwK2wzwjkMD513opFa2811sxuwU0ZMETYJVHlrDoClZCip+0al3j7otL9rlPuxRCos/ux+ljBG1xCvHHC2s1qVpmnf1IcrjHjystst31pwiargOBNG6+ltcU4wAMFmhWTYANeueoRhFMwJr7j2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Cvzo94TnMYAQ79LV9hi1KorlcEI1WMd1r40PQAH1uY=;
 b=IziHjJixaOkkU6As/9zLR9JIdRARVa+0Wvd8+IlGIBS8OckqeND7xIm3o/NhkDCEOGY/N76EroUeEk7TiSAr6JuDu6A+XuJ9gJiCmhRDTKTq3xwfwp9ZCHMRcyfqL2uUzic8Fv97NuQ2KfUfvzUwTQH0cnsHWT2JLgz2FjvNb7FzwA4Te6qypDC2yLK0xcayv3kPg3u2TCsNO10RAnVDPgWeHgEBXp0JJpgqljqs5yNoeudK4FmmrGpUSUyXYL2E4MBEeXF690X7z4uLCWfGq8AspUV/j6ycYwv63D6XqAk9ulIbTk61gvEWSfGYAOQxUps4TEQY+m1GP9cMRSsJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Cvzo94TnMYAQ79LV9hi1KorlcEI1WMd1r40PQAH1uY=;
 b=I6YuD40XcMENJORaJsDUagoLEw5OwL9keLVzRclBrbfEhQpFnpjzZOJdVA9DHUOjDfD5BpzU52g04HJ2GemOwlaGUbk3JEfp3QEQ6d9ARmSeOk9KqHGi+ZyiYJ3KK+Aiq6ic+sl/FJB3Vf2HqTtN+IgYFzcGt3H+XqzQV7ooI4k=
Received: from CH0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:610:b3::8)
 by SA6PR10MB8208.namprd10.prod.outlook.com (2603:10b6:806:435::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:34:23 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::ba) by CH0PR03CA0033.outlook.office365.com
 (2603:10b6:610:b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.13 via Frontend Transport; Tue,
 30 Dec 2025 08:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:34:22 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:20 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:34:20 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9k579464;
	Tue, 30 Dec 2025 02:34:14 -0600
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
Subject: [PATCH v9 17/19] media: cadence: csi2rx: Support runtime PM
Date: Tue, 30 Dec 2025 14:02:18 +0530
Message-ID: <20251230083220.2405247-18-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|SA6PR10MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 082f89ff-dc46-44d3-9119-08de477e3bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRC7i0V74oCGoxMGbwbYvDLvbMF3mO1lQYPDam2ANuAm7gcCp3DpG0Bj7bbV?=
 =?us-ascii?Q?Es+mAhjJY4LwfoowFVrxyNPRW0bO+canKYR1Q2R3zwBzpYwLIlImTq3qsQrJ?=
 =?us-ascii?Q?etvLfVNz6hJQuKFO3qOkwDhcXRV3ykBzBAhzRPNFdMcYojqnrODsR+H5/jir?=
 =?us-ascii?Q?cVmwKUC0WoYcgJwKllg79hY7WN2bnVtTzYpHKq12o3X4Q1xezbJQf9tpj+aB?=
 =?us-ascii?Q?jGblSlkFkwl8rHY2mbzFMLnWJN7erzThTzajpYcd5Iym10xXmV+arrMt964l?=
 =?us-ascii?Q?9BLwIMSFqORXYHT8C4szfhUXA38Ec/JUXTE6qo8iBzpcwws/1A6NGoWpgwQN?=
 =?us-ascii?Q?pv173jErMbuI3HlloI5SZhN/j54pk+pzIoAuArx9NVHuGcf2dmMUiwaeK6jq?=
 =?us-ascii?Q?wtyyYvqAky6Cs5eDreNwEviPBU5wfGQA7hMrbp0NrKRqENd42icarupiKCoT?=
 =?us-ascii?Q?/HRQlYxl9UhPgBfaJYU9fddcCLKLOfUJsDwoBMQQnadZLzLNw4WasRS7HP8Y?=
 =?us-ascii?Q?kjJ8FOE5FSX+oYYaqk0Gbevl/PZdHkE9kOsKHgk+DdGHrEJ5HgaAXMul2MAf?=
 =?us-ascii?Q?3GA6IY3KYMqty8bjlbjRT/ETsVfIA6mlH7hufMbx2x9vD07lxFWlsmdwvRl4?=
 =?us-ascii?Q?WjHSPqtJIu4cTJkCIl4tUZK3hxh18sihCdf+4tNcaU7qQj4v6Drcaz7dRhHz?=
 =?us-ascii?Q?2/pvOA5d0O5ODtLRWg224XjqQct/OXxwf01d1MLF1cM8X1jCo4QXzOvzyipM?=
 =?us-ascii?Q?8epfC9hC5GiyIGdUynWukYSQQdVOrLy+Aae4sTcugahcP8Zbae17Lt+N5wnl?=
 =?us-ascii?Q?37y/NEFAru1DtwYEUVBHPnwQueZciwt8O3BjIErftNECD04DfXsEqRvzS3as?=
 =?us-ascii?Q?cb/+u+fsLWmj6ep4yp+5lVwwgWstmY8NMO8WCYxou8yWLR8LJdFMFm7RwCRe?=
 =?us-ascii?Q?2tLx9upbaDzxngwl704HaCpL5u9RLeQAIL5h/YGKBZiB5POdsrFiEtKHv2rw?=
 =?us-ascii?Q?s9pUTxxCE2nPeKGgVCP4sn5daHBu0+CuLVNtYJBkXeTV1P0F+oaAe4Fy6gMA?=
 =?us-ascii?Q?xkC/Y5tPVv9Jb62ZeDvtu4ukmeYB/9Macvg+QvBZo859V9euM0qsSNrGzRuY?=
 =?us-ascii?Q?xSFFKvYVOv5dvEr3QD+vNnCbpBS9W5Z7Rg5jsMSURAugSSvjE8Nd50fRgfUX?=
 =?us-ascii?Q?N0sFx0iuoxDNeZ6L/9MPS+U96K9Q8bQD7LCDoEPOThSUERqPwtuQ4nR2VSNM?=
 =?us-ascii?Q?iqR8sRxG5kjKLqzNrJcHYSODtLrokxysdkS2/13V/AP29tv9OYvH3fiqB0yo?=
 =?us-ascii?Q?JfY+ebZNXFPStcAvq2/DEzfg1l8SmHV+VGp6maBShVpwa5Lq03DCX0GODnGO?=
 =?us-ascii?Q?EjTrbjWpSWKw3pAmEIbp+YAyLWEyvuxIR7yNa86RcFqxkW8XfsjoSHEjndcY?=
 =?us-ascii?Q?qQCzw/A35pMn9nWstQGrWSnb0zRDShATrtF91Tgz+abTCwI+0nIqBhLX9ONH?=
 =?us-ascii?Q?y0vtezGVL/R/bbXag3wsvBnCIETetvCHov3t27zxFmNof9yX7H7wKA/w1xd/?=
 =?us-ascii?Q?C2RJREADFVzXmKcoLFA=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:34:22.8037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082f89ff-dc46-44d3-9119-08de477e3bd9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8208

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Use runtime power management hooks to save power when CSI-RX is not in
use. Also, shift to goto based error handling in
csi2rx_enable_streams() function

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/Kconfig       |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c | 136 ++++++++++++-------
 2 files changed, 88 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 1aa608c00dbce..ea85ef82760e6 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
 	depends on VIDEO_DEV
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 5c16a2e509136..40c947c813248 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -337,11 +337,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
 	if (csi2rx->error_irq >= 0)
@@ -382,7 +377,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		if (ret) {
 			dev_err(csi2rx->dev,
 				"Failed to configure external DPHY: %d\n", ret);
-			goto err_disable_pclk;
+			return ret;
 		}
 	}
 
@@ -397,12 +392,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 * hence the reference counting.
 	 */
 	for (i = 0; i < csi2rx->max_streams; i++) {
-		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
-		if (ret)
-			goto err_disable_pixclk;
-
-		reset_control_deassert(csi2rx->pixel_rst[i]);
-
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
 			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
 					  csi2rx->num_pixels[i]),
@@ -415,30 +404,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
 	}
 
-	ret = clk_prepare_enable(csi2rx->sys_clk);
-	if (ret)
-		goto err_disable_pixclk;
-
-	reset_control_deassert(csi2rx->sys_rst);
-
-	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
-
-err_disable_pixclk:
-	for (; i > 0; i--) {
-		reset_control_assert(csi2rx->pixel_rst[i - 1]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
-	}
-
-	if (csi2rx->dphy) {
-		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
-		phy_power_off(csi2rx->dphy);
-	}
-err_disable_pclk:
-	clk_disable_unprepare(csi2rx->p_clk);
-
-	return ret;
 }
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
@@ -447,10 +414,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	u32 val;
 	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
-	reset_control_assert(csi2rx->sys_rst);
-	clk_disable_unprepare(csi2rx->sys_clk);
-
 	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
 
 	for (i = 0; i < csi2rx->max_streams; i++) {
@@ -465,14 +428,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 		if (ret)
 			dev_warn(csi2rx->dev,
 				 "Failed to stop streaming on pad%u\n", i);
-
-		reset_control_assert(csi2rx->pixel_rst[i]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i]);
 	}
 
-	reset_control_assert(csi2rx->p_rst);
-	clk_disable_unprepare(csi2rx->p_clk);
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -548,10 +505,15 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 	 * enable the whole controller.
 	 */
 	if (!csi2rx->count) {
+		ret = pm_runtime_resume_and_get(csi2rx->dev);
+		if (ret < 0)
+			goto err;
+
 		csi2rx_update_vc_select(csi2rx, state);
+
 		ret = csi2rx_start(csi2rx);
 		if (ret)
-			return ret;
+			goto err_put_pm;
 	}
 
 	/* Start streaming on the source */
@@ -561,13 +523,20 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 		dev_err(csi2rx->dev,
 			"Failed to start streams %#llx on subdev\n",
 			sink_streams);
-		if (!csi2rx->count)
-			csi2rx_stop(csi2rx);
-		return ret;
+		goto err_stop_csi;
 	}
 
 	csi2rx->count++;
 	return 0;
+
+err_stop_csi:
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+err_put_pm:
+	if (!csi2rx->count)
+		pm_runtime_put(csi2rx->dev);
+err:
+	return ret;
 }
 
 static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
@@ -589,8 +558,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
 	csi2rx->count--;
 
 	/* Let the last user turn off the lights. */
-	if (!csi2rx->count)
+	if (!csi2rx->count) {
 		csi2rx_stop(csi2rx);
+		pm_runtime_put(csi2rx->dev);
+	}
 
 	return 0;
 }
@@ -1057,6 +1028,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -1071,6 +1043,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -1089,9 +1062,73 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
+	pm_runtime_disable(csi2rx->dev);
 	kfree(csi2rx);
 }
 
+static int csi2rx_runtime_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+
+	reset_control_assert(csi2rx->sys_rst);
+	clk_disable_unprepare(csi2rx->sys_clk);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		reset_control_assert(csi2rx->pixel_rst[i]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return 0;
+}
+
+static int csi2rx_runtime_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+	int ret;
+
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(csi2rx->p_rst);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
+		if (ret)
+			goto err_disable_pixclk;
+
+		reset_control_deassert(csi2rx->pixel_rst[i]);
+	}
+
+	ret = clk_prepare_enable(csi2rx->sys_clk);
+	if (ret)
+		goto err_disable_pixclk;
+
+	reset_control_deassert(csi2rx->sys_rst);
+
+	return 0;
+
+err_disable_pixclk:
+	for (; i > 0; i--) {
+		reset_control_assert(csi2rx->pixel_rst[i - 1]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
+};
+
 static const struct of_device_id csi2rx_of_table[] = {
 	{ .compatible = "starfive,jh7110-csi2rx" },
 	{ .compatible = "cdns,csi2rx" },
@@ -1106,6 +1143,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);
-- 
2.34.1


