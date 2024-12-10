Return-Path: <linux-media+bounces-23080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E2B9EB890
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 18:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34CF1283F53
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A478C214212;
	Tue, 10 Dec 2024 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mhd+/GeX"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED1214211;
	Tue, 10 Dec 2024 17:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733852787; cv=fail; b=pwvV8UsJzvWsanUYCirrpVjHl6BkqEMwQSfyAV9iQPL07bfhgq0ECQ0ZRMMxQoKmQE1Mpx5JfzFqwdkcmiwndK+qNAamPe92ual5o/u9lCI6GeAo0ut4TRhVGJic1HtBo2nm8/0Wqz6QwdvvkO2GvI43TeAXNgjzB1BdO3Z1W2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733852787; c=relaxed/simple;
	bh=9EhYSFWsRus1+fVauRO2T+umX6Yu6+CNmfYkzKXcU78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJy27XUayN6HXGblbeXE/ZTotfVPjZBfm29iKmcnPmCzo6QTXLaZP5geclIvkBcoMiWXLkuK+QCHnVU+UG14hSvNetS+xYIOmlsgNZwVZc47ntB7Nvet8SEaEp+Vp5idUAe0inBzJuKN9Wly62VRj/GoTJ+Pkb1Sf3Ztb7qO9mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mhd+/GeX; arc=fail smtp.client-ip=40.107.212.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXiAxaSC49CkbfgOHX++pMFqXIu1DTZsbmS3OpcWB+RlpG3Vnvh+qZEv6Nw6Llx1+TBCvYpmoLcXHgUcucdvDWtDPMt5QyGK58Syb4pBNjc1C/IH5EAXlzEUe8XsBqXUwhiv8rfm2VJjDv+ISzpoQuEpM+uHQr8A1Dg/vFP4IQc8tDlDywIrAwrnLZTDi9MNVxlzMjef8ZriZYJAvdnm8cWrOw3lm+aLvUBEcieM06lQnk6a/tRsLam6lm1jzNIXt8vzZ75Jv713uT/pAO1XpOb9/cQ/2Mlq7XeAfweYAIdDRgAaPGAEVJ9gzxM14ryiFvCKzIP8tS+9s3eUuqmCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s1mgzYgjubaFe5vz2yf25UsogL8btmVF5U9yte3mAQ=;
 b=ck6qIdWTuSX0u14YWcjWWuAKiQ6l3C07klEtNes+OcjtX5CidUo0rKj4qv+9qLZ1DfUBKBXh85xxrlXSJvydePhGH5H8hi5V2P2z8O5Ukln5Ih/p5m7CbGwcjtueWHoXDByU/hMK2BW4JdRaAh8PwAeLFlbbenJoC6MEE9ll5wH0CJafNqKUq07jgrk4f+NlhW+ckDS5gCYUx+HU5eKjZ1ci7HSgsASIicmz6S4yix2aIvdKm3CO//3alJVfqEXaQgBjIMD0d/GD2ixp7yEXCDhLwkZVbrO7196wSs/896jm0QdPKu9zewRHbKh9mPij8VQEjpC+KSACQ7XU3JV+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s1mgzYgjubaFe5vz2yf25UsogL8btmVF5U9yte3mAQ=;
 b=Mhd+/GeXEtBWMhXR1YkZxq2Thk8Q2KD3m4Ds6+8FoagZGaVu1VviIFsN9FkVSTad9GME7E/UdombEUzxCoT0RNlKxkSQB4cjEdVqulfggPYI8Dq2bC4iMd9WBHsNjf5fsUh7PZK18BsqYz6iuL9PtTqpQu7S073l6jgXPVxIY5zVYaFxvVAFeasHwWtj8bpLCaXcPT/vAunZ7EeBW+ZZtmZgHvAxeGRQFWKKFN2H+BL89wcz3n0LDNsFXhBeZagCetxGOvflQyUbd2TUxrFd9aJ4L9FBhBzLKxDh2twORfx9n1FDZkTwcYJm7TRc9OY9vzyrOqCfk6Ls4QOS65Fykw==
Received: from BL6PEPF00013E0A.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:12) by DS0PR12MB7653.namprd12.prod.outlook.com
 (2603:10b6:8:13e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 17:46:18 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF00013E0A.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend Transport; Tue,
 10 Dec 2024 17:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 17:46:18 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Dec
 2024 09:46:01 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Dec 2024 09:46:01 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Dec 2024 09:46:00 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<skomatineni@nvidia.com>, <luca.ceresoli@bootlin.com>,
	<mperttunen@nvidia.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v1 5/5] drm/tegra: vic: Register the device with actmon
Date: Tue, 10 Dec 2024 09:45:54 -0800
Message-ID: <20241210174554.18869-6-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241210174554.18869-1-johnliu@nvidia.com>
References: <20241210174554.18869-1-johnliu@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 914034bc-590a-433e-5265-08dd19428d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gdSIMqV62+OgdIjAGgyvsZqDn7wcWuT+o7wDxiz5r2TCAteSDn9yRPiY6RPt?=
 =?us-ascii?Q?iYLq/eYUdBPrqETTXm/WhOGb236zNOVIpRWtGogJOt3XVwqY+I7q7hAPu5jp?=
 =?us-ascii?Q?drp8FEyK9HvHnqSZg8lmnU3jmFExePH7M7/SP3LY1oY8boKgvmI7tOBwOuj9?=
 =?us-ascii?Q?qAB9Sjq+e/pZGKBEmFTiSQita0nDhq3UD4/gsSIFXU8VwIy24WiKJMerbq2D?=
 =?us-ascii?Q?NmiwVvoHW4ObcK0oV0ZR6m1bxh52w0fjM0MjBu3RFUcChZt5Yx2v/lXKY33a?=
 =?us-ascii?Q?4jJE7pGFttwfGWB8V4hq6GTTY90qLOXxRwsoNitfqgQemeXXmL+lwuXDcIls?=
 =?us-ascii?Q?ZH4NUAgAA0+BUJ4kYy436Omi5atSkqYWaDUGuvRntFOln4MvZE8GLvAjBjlK?=
 =?us-ascii?Q?+z1ea+YPfPUUfthlJ+MkRuFLzdS3SOm+CWSafELnr42whJNo1og56FhpNtEz?=
 =?us-ascii?Q?wzrwgJ4s0WAhf4H7h9iQTHoT6RlNURRLYKq5L5V7S0Nhr5lasgslg53HSgY4?=
 =?us-ascii?Q?rLsPYVDKL/y7xfEh2nmdZuKbbiumxRPSXQgRzEABfVglmueyZsFNqsLLzGTs?=
 =?us-ascii?Q?vGBPLhiAAdAEpqf4hxePM5SXSaYwPXd+cs0Phe0JxcHatRqYn+hrbsyyae1e?=
 =?us-ascii?Q?GPPWfMks/fQktH6NEY25OxhOsf2UYA27OET5imOKqMlI1ozShDH9vL0kDr59?=
 =?us-ascii?Q?zF83SGHb42SXpDxQRReCrH/OZ0Z9/OwvsvrpLq5B0gQn2/c5Jmls3p09tEmi?=
 =?us-ascii?Q?xMWArwGqiG4Alq6AQ4waiZ7mi/wa9IlEWoE1cfzZ3uPP+ufZB3FCGKg9TJbJ?=
 =?us-ascii?Q?ppLYk34s3+NakP5l4R3M8klqCW/Sa9X6IbBxpKF16O6XAPG03KYATgRGfGOX?=
 =?us-ascii?Q?KHgrCP3HGkz4BdD9F9t44vdig865mLlaSpaBlCI0PtYOXaCKvbvPYEBuC/M5?=
 =?us-ascii?Q?Vt+WK4bLiMjZWLwyWiK/Gx1t8gj6Hyig2YeRyV058e/QuXRlCMLx/3u3uDMG?=
 =?us-ascii?Q?F2t8Nk37niZIkAhAFDzn/1+Zg4OX7DZqK+qz25wCP9YMYxqnaNZOsDNb5NjY?=
 =?us-ascii?Q?Ren8D3fmC0sPfv6L2LzFdScWUaYMOBGb5TaD1uNX5TDYMY5TzJHonDC7iZyU?=
 =?us-ascii?Q?rxrqZGVdDuu70OmZUi027Sw9arEovcKS6SGzIjYvUoyRwcf5JJWwtzIV+BNS?=
 =?us-ascii?Q?1mhebNTqb37VWVyOQN3UH6HRvXgSGS1tJzBB8HyJdtJiC8F13pXLOKpuLMxU?=
 =?us-ascii?Q?7ft8gMkKIVShHkzeGe4kQ/oCFqVjWhlN0kCWyrWu43kK3SGCDdrX8zDf1/Jd?=
 =?us-ascii?Q?VlIpY77zjguynYrIGyY0wMy9uL04nbN3+NYYAeBwzArQVIu7unlUtqSwleMr?=
 =?us-ascii?Q?l8omQvFCImSqxeWorxXOa5o74NG1Vzr70slsnRYIiXnBUgYBXa9uKpz8ZDYM?=
 =?us-ascii?Q?j5zxd6e7FjUO0Sbl44LRGssLpkHAz/O6VQ2hImw9Lny58u8LdzK+dg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:46:18.7071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914034bc-590a-433e-5265-08dd19428d7f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

By registering the vic with actmon, engine load information can be
exported to the user through debugfs for engine profiling purpose.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 39 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/vic.h |  9 +++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 332c9b563d3f4..54c9b9b2af0a2 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015, NVIDIA Corporation.
+ * SPDX-FileCopyrightText: Copyright (c) 2015-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -302,6 +302,28 @@ static int vic_load_firmware(struct vic *vic)
 	return err;
 }
 
+static void vic_actmon_reg_init(struct vic *vic)
+{
+	vic_writel(vic,
+		   VIC_TFBIF_ACTMON_ACTIVE_MASK_STARVED |
+		   VIC_TFBIF_ACTMON_ACTIVE_MASK_STALLED |
+		   VIC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED,
+		   NV_PVIC_TFBIF_ACTMON_ACTIVE_MASK);
+	vic_writel(vic,
+		   VIC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE,
+		   NV_PVIC_TFBIF_ACTMON_ACTIVE_BORPS);
+}
+
+static void vic_count_weight_init(struct vic *vic, unsigned long rate)
+{
+	struct host1x_client *client = &vic->client.base;
+	u32 weight = 0;
+
+	host1x_actmon_update_client_rate(client, rate, &weight);
+
+	if (weight)
+		vic_writel(vic, weight, NV_PVIC_TFBIF_ACTMON_ACTIVE_WEIGHT);
+}
 
 static int __maybe_unused vic_runtime_resume(struct device *dev)
 {
@@ -328,6 +350,10 @@ static int __maybe_unused vic_runtime_resume(struct device *dev)
 	if (err < 0)
 		goto assert;
 
+	vic_actmon_reg_init(vic);
+	vic_count_weight_init(vic, clk_get_rate(vic->clk));
+	host1x_actmon_enable(&vic->client.base);
+
 	return 0;
 
 assert:
@@ -352,6 +378,8 @@ static int __maybe_unused vic_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vic->clk);
 
+	host1x_actmon_disable(&vic->client.base);
+
 	return 0;
 }
 
@@ -520,12 +548,20 @@ static int vic_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
+	err = host1x_actmon_register(&vic->client.base);
+	if (err < 0) {
+		dev_info(&pdev->dev, "failed to register host1x actmon: %d\n", err);
+		goto exit_client;
+	}
+
 	pm_runtime_enable(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 500);
 
 	return 0;
 
+exit_client:
+	host1x_client_unregister(&vic->client.base);
 exit_falcon:
 	falcon_exit(&vic->falcon);
 
@@ -537,6 +573,7 @@ static void vic_remove(struct platform_device *pdev)
 	struct vic *vic = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	host1x_actmon_unregister(&vic->client.base);
 	host1x_client_unregister(&vic->client.base);
 	falcon_exit(&vic->falcon);
 }
diff --git a/drivers/gpu/drm/tegra/vic.h b/drivers/gpu/drm/tegra/vic.h
index acf35aac948b2..905cd7bfde2f6 100644
--- a/drivers/gpu/drm/tegra/vic.h
+++ b/drivers/gpu/drm/tegra/vic.h
@@ -21,6 +21,15 @@
 #define CG_IDLE_CG_EN				(1 << 6)
 #define CG_WAKEUP_DLY_CNT(val)			((val & 0xf) << 16)
 
+#define NV_PVIC_TFBIF_ACTMON_ACTIVE_MASK	0x0000204c
+#define NV_PVIC_TFBIF_ACTMON_ACTIVE_BORPS	0x00002050
+#define NV_PVIC_TFBIF_ACTMON_ACTIVE_WEIGHT	0x00002054
+
+#define VIC_TFBIF_ACTMON_ACTIVE_MASK_STARVED	BIT(0)
+#define VIC_TFBIF_ACTMON_ACTIVE_MASK_STALLED	BIT(1)
+#define VIC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED	BIT(2)
+#define VIC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE	BIT(7)
+
 #define VIC_TFBIF_TRANSCFG	0x00002044
 #define  TRANSCFG_ATT(i, v)	(((v) & 0x3) << (i * 4))
 #define  TRANSCFG_SID_HW	0
-- 
2.34.1


