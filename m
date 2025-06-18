Return-Path: <linux-media+bounces-35142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE1ADE694
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A01AA189845B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0226A2853F3;
	Wed, 18 Jun 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RvkvteR0"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C728153D;
	Wed, 18 Jun 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238457; cv=fail; b=AW9VjcqE1GJSaKByRKoLdtu9Qb3G6p0ZcKk6rf7ZaI88raWS+5yT7+O53CoAe+jjAf7SrbzOIiEkuc+7ptqpU4BoGyBiWTZR7PA7ZM3aIef7tEYGo408rSic4K/OXWNlEbHQjCZZpLoh1mHbcQGM9T3Vh8zIxG5XrcUQiUAOqEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238457; c=relaxed/simple;
	bh=JZ0uHEpQA6pQa1wDht5Z9EumzBILq1Q3WhDfJT+n0OI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LdaTOOhnTvPctrfBTdZqVym3UrZo+ucKJSiM5Ggih2ydUJAnrGOdJUapBbaMihiE5jocOvWU7x6MHwM/KDy2+44/q1dMlQlNErUN3pnYmBEyj3mzxvHXjml6fooxokakfD9kzAoPTteHRJFnYwWdN1DmeNQIFPpkMvqmWlR5l0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RvkvteR0; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwSd/Vj5bBRyczgGOdMVgZNkopbVfpVPzBQm7Zl4Ts3rvCKQj+qK8XYrn+jeoZgvTJLv2HXHQHfJLNi29T1H3WFr/aPaz4+n0MBe1ws1go8EdCetNMGwILjgTcj6Reb+sCf4XSZAYCsAGYkQfrVz6QcAyVHDJqNuoX8jKOwxWqPoLunJfbO98bnETysYxv9qG8KJhHQHxpGKf266Qp6kHaWHtU2N1g4EI0KBQ4moed+RTwPxwGVQUz1En5KmTe+Bu3tOtJkphoIWQ0Ril94VzdayK/xy4tK/leZgUmHrxbN5th95ctp7nOEkJuI+D1ZT7Gd/BtFi65jyiqzrL4O6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko0eO4xxAme9XqDcbUIcPRN+mjUK94RzojBge+h+Cco=;
 b=Uai3sLR7Ctjq301xLSbwE5/lZPk2tfVKjSXpNDMZ63AaKjP4NSoMJmpKhS+vL3gvF+6fLZE+hnL+oPxvNxILchr3+HtZdRALKDUkntaCygSTEl7pOwmPEKA4ymkZFDeMsEvWCS+co0nDsqRLlH4CLPyjEDpg4mdkzthYO/azYrYmHMuILkUjzVzOwCR+FIJ2SpaScOscSKLK/XTjhySIpWKP2yhXHcmGlK7Fx6XIzRWYDrt6lNTGBiPIY8S7+Ca6VdQCkyk2nfXHsuBNJcBQCEa05k7KK8VY1dcAasgUwBYLALb5nXTdzxYZ2gjUpAFKHWwGpLonEW5ppDC0yaE+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko0eO4xxAme9XqDcbUIcPRN+mjUK94RzojBge+h+Cco=;
 b=RvkvteR0CKai2659pwwtEGsbwXqg5/KvB7FTf9/qbq+Pgx+9SkW7jbkZgomydnVUQSZN+eeJkaEyRVDxgaEjt3nNqKt/bN7L5e/teYtT2sTzyqm11sHFndM6Q8P+4CRBZUB1M4oA68aiS9Sj1Qa3Nzh5bqDuE+C1soSwQis2W0Y=
Received: from BL1PR13CA0250.namprd13.prod.outlook.com (2603:10b6:208:2ba::15)
 by SJ2PR12MB7941.namprd12.prod.outlook.com (2603:10b6:a03:4d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 09:20:47 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:2ba:cafe::2c) by BL1PR13CA0250.outlook.office365.com
 (2603:10b6:208:2ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.6 via Frontend Transport; Wed,
 18 Jun 2025 09:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Wed, 18 Jun 2025 09:20:47 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 04:20:42 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v2 7/8] media: platform: amd: isp4 debug fs logging and  more descriptive errors
Date: Wed, 18 Jun 2025 17:19:58 +0800
Message-ID: <20250618091959.68293-8-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618091959.68293-1-Bin.Du@amd.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|SJ2PR12MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d5785e-e494-469b-6044-08ddae4968ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bls4WR+RAyBnGBBTcJsME5x6po22FGxK/3LWUif/GuYALMx7mWgygI7lani+?=
 =?us-ascii?Q?8CpKeivh/tPJvmu/3E/Gl34HjovV3/o2451fCnorEW6WUFF+BqjRutYmt94/?=
 =?us-ascii?Q?EfpCTswWdCxAu1B/FZbzEcplQ901K3o3LF64CrJxrL/uyNi+asOchey4//a2?=
 =?us-ascii?Q?AZ/POf1fTTfdnw7oBjU5941qx6xfUw/jUZJtFr1QcqWsOH7j35aYf//Ha32a?=
 =?us-ascii?Q?B2pEsqFiI5Yrg5eP3MYM2Dh3MPu17GmHRi1nM/oTHH510jvG4lt5FZhEfULu?=
 =?us-ascii?Q?z4Nj3XmfDWRuyEc+T3TNlN4Yzdtw/ifprt4oK/t63piYuC7KrytxGRKxdqBW?=
 =?us-ascii?Q?IJ2T7QZqmX3ffgsi4iGWpdJQFsilh0j90wKlcJX29eBDD+gos+goRN9Xfvpm?=
 =?us-ascii?Q?XgiwEAdSXZ8i872lwnweKDm5OuTiTg6pHj4FNdpp6Dw50guuUGcuO3ZbCU8g?=
 =?us-ascii?Q?JwWYRmZyNWr/jFzpdIDuRUPBxAHLCRzaJdLeZgJzkqg0dpiHGyRAoxJZlBa9?=
 =?us-ascii?Q?rd5Z9zdkR3c62UFcTucX5HrFdcYa8v4guBYHONs5O/R1y1tBh909qls5cHHC?=
 =?us-ascii?Q?3bzAd07UulnV29Q9dn0Ukzlo9MW0gK3DnFHlZOfwiRM/OjXAFPZsffPB3hqS?=
 =?us-ascii?Q?QK38LNTVMEiZqDILIoRDSVByAT6f6gdwIlAlIXzA1ZxAZdf45SQYcxM5fUzx?=
 =?us-ascii?Q?owlZbOppW8fTVeItpIUXg5C6dt3046vI6uz0a7oxIch/QRgJifd/pEFlzCDH?=
 =?us-ascii?Q?iJbtq2bO8nll/ny7PGmhLjr2Hy2POKP0vDjzkuM10cXFdicfiV/EUz4i7NJa?=
 =?us-ascii?Q?M5J1paDAYyUGZQb9vqcsaCNxXUQ4B+W2a6YkCIeDfVX/K8V3ZukGe2yecBEw?=
 =?us-ascii?Q?D5LrTRZMaldcf9wGrD9hrIZTystdmjH4Vwos/0rlVJDQFNI9DpM1c2YxDKOU?=
 =?us-ascii?Q?/NNmI0UtlB7/vCvwwZX/Z2WBK4ZMedIseplMwjWpGsA3eTM/8d3dukm4A0xV?=
 =?us-ascii?Q?zhcswvYF+hbReX5J7tlufEVHY88nhepR0QperKIqaIHQnkl4SikmxMqcodzU?=
 =?us-ascii?Q?l0PmiG2ARL/UVPnzWwWEE9PH9454bZTsiis72UuGCjkCxerQ08YxaBeJX+fM?=
 =?us-ascii?Q?p/RSSobCFI/rxxym+11NX6naH1H3Cy/cH3N0UcHTlajSqu5aZgwsa13vxmgJ?=
 =?us-ascii?Q?O1DjFs5/o1ox442754fv/g3bw2JTI6ntem/6RUvDxLNgootQwhxVdfiTS0qB?=
 =?us-ascii?Q?rt9fuhBwiMZIVcCAzq7wH8nisO5aYuyXWlDVRVwxowLhgKvwU7vH7HMY7/UQ?=
 =?us-ascii?Q?IAnCE/dBIQarEzg6BE1ewk+BY9/Qqbs5UQrMO5CiLlnz2BQIK7/4kEQW5b6k?=
 =?us-ascii?Q?jF3xYlR8H46BazEDCH51WwKMTn+dXpHWy7BS7YOWRefrWEsk+Fn/xaCQBuki?=
 =?us-ascii?Q?q772kZM4gvpEtU5w7srZADWUVPoXRf8V9AeFHUkmHkE3HjtBVKE+LgSgWsQ4?=
 =?us-ascii?Q?bFyG37ZXWq1zavxjpCag5+0qfuhT0zk2m5yG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:20:47.2408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d5785e-e494-469b-6044-08ddae4968ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7941

Add debug fs for isp4 driver and add more detailed descriptive error
info to some of the log message

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
---
 drivers/media/platform/amd/isp4/Makefile      |   1 +
 drivers/media/platform/amd/isp4/isp4.c        |   5 +
 drivers/media/platform/amd/isp4/isp4_debug.c  | 272 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
 .../media/platform/amd/isp4/isp4_interface.c  |  38 ++-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  29 +-
 6 files changed, 366 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h

diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 99285fe45b52..99d16ecfb64b 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
 amd_capture-objs := isp4_subdev.o \
+			isp4_debug.o \
 			isp4_phy.o \
 			isp4_interface.o \
 			isp4.o	\
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index 3d971fe2813d..c3d2e52e0201 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -11,6 +11,7 @@
 #include "amdgpu_object.h"
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_hw.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
@@ -352,6 +353,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
 
+	isp_debugfs_create(isp_dev);
+
 	return 0;
 
 err_unreg_video_dev_notifier:
@@ -369,6 +372,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
 {
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
 
+	isp_debugfs_remove(isp_dev);
+
 	v4l2_async_nf_unregister(&isp_dev->notifier);
 	v4l2_async_nf_cleanup(&isp_dev->notifier);
 	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
new file mode 100644
index 000000000000..549c36614306
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include "isp4.h"
+#include "isp4_debug.h"
+#include "isp4_hw.h"
+#include "isp4_interface.h"
+
+#define ISP4DBG_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
+#define ISP4DBG_MACRO_2_STR(X) #X
+#define ISP4DBG_MAX_ONE_TIME_LOG_LEN 510
+
+#ifdef CONFIG_DEBUG_FS
+
+void isp_debugfs_create(struct isp4_device *isp_dev)
+{
+	isp_dev->isp_sdev.debugfs_dir = debugfs_create_dir("amd_isp", NULL);
+	debugfs_create_bool("fw_log_enable", 0644,
+			    isp_dev->isp_sdev.debugfs_dir,
+			    &isp_dev->isp_sdev.enable_fw_log);
+	isp_dev->isp_sdev.fw_log_output =
+		devm_kzalloc(&isp_dev->pdev->dev,
+			     ISP4DBG_FW_LOG_RINGBUF_SIZE + 32,
+			     GFP_KERNEL);
+}
+
+void isp_debugfs_remove(struct isp4_device *isp_dev)
+{
+	debugfs_remove_recursive(isp_dev->isp_sdev.debugfs_dir);
+	isp_dev->isp_sdev.debugfs_dir = NULL;
+}
+
+static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, u8 *sys, u32 rb_size)
+{
+	struct isp4_interface *ispif = &isp->ispif;
+	struct device *dev = isp->dev;
+	u8 *buf = isp->fw_log_output;
+	u32 rd_ptr, wr_ptr;
+	u32 total_cnt = 0;
+	u32 offset = 0;
+	u32 cnt;
+
+	if (!sys || rb_size == 0)
+		return 0;
+
+	mutex_lock(&ispif->isp4if_mutex);
+
+	rd_ptr = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_RPTR0);
+	wr_ptr = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_WPTR0);
+
+	do {
+		if (wr_ptr > rd_ptr)
+			cnt = wr_ptr - rd_ptr;
+		else if (wr_ptr < rd_ptr)
+			cnt = rb_size - rd_ptr;
+		else
+			goto unlock_and_quit;
+
+		if (cnt > rb_size) {
+			dev_err(dev, "fail bad fw log size %u\n", cnt);
+			goto unlock_and_quit;
+		}
+
+		memcpy(buf + offset, (u8 *)(sys + rd_ptr), cnt);
+
+		offset += cnt;
+		total_cnt += cnt;
+		rd_ptr = (rd_ptr + cnt) % rb_size;
+	} while (rd_ptr < wr_ptr);
+
+	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_RPTR0, rd_ptr);
+
+unlock_and_quit:
+	mutex_unlock(&ispif->isp4if_mutex);
+	return total_cnt;
+}
+
+void isp_fw_log_print(struct isp4_subdev *isp)
+{
+	struct isp4_interface *ispif = &isp->ispif;
+	char *fw_log_buf = isp->fw_log_output;
+	u32 cnt;
+
+	if (!isp->enable_fw_log || !fw_log_buf)
+		return;
+
+	cnt = isp_fw_fill_rb_log(isp, ispif->fw_log_buf->sys_addr,
+				 ispif->fw_log_buf->mem_size);
+
+	if (cnt) {
+		char *line_end;
+		char temp_ch;
+		char *str;
+		char *end;
+
+		str = (char *)fw_log_buf;
+		end = ((char *)fw_log_buf + cnt);
+		fw_log_buf[cnt] = 0;
+
+		while (str < end) {
+			line_end = strchr(str, 0x0A);
+			if ((line_end && (str + ISP4DBG_MAX_ONE_TIME_LOG_LEN) >= line_end) ||
+			    (!line_end && (str + ISP4DBG_MAX_ONE_TIME_LOG_LEN) >= end)) {
+				if (line_end)
+					*line_end = 0;
+
+				if (*str != '\0')
+					dev_dbg(isp->dev,
+						"%s", str);
+
+				if (line_end) {
+					*line_end = 0x0A;
+					str = line_end + 1;
+				} else {
+					break;
+				}
+			} else {
+				u32 tmp_len = ISP4DBG_MAX_ONE_TIME_LOG_LEN;
+
+				temp_ch = str[tmp_len];
+				str[tmp_len] = 0;
+				dev_dbg(isp->dev, "%s", str);
+				str[tmp_len] = temp_ch;
+				str = &str[tmp_len];
+			}
+		}
+	}
+}
+#endif
+
+char *isp4dbg_get_buf_src_str(u32 src)
+{
+	switch (src) {
+	case BUFFER_SOURCE_STREAM:
+		return ISP4DBG_MACRO_2_STR(BUFFER_SOURCE_STREAM);
+	default:
+		return "Unknown buf source";
+	}
+}
+
+char *isp4dbg_get_buf_done_str(u32 status)
+{
+	switch (status) {
+	case BUFFER_STATUS_INVALID:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_INVALID);
+	case BUFFER_STATUS_SKIPPED:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_SKIPPED);
+	case BUFFER_STATUS_EXIST:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_EXIST);
+	case BUFFER_STATUS_DONE:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_DONE);
+	case BUFFER_STATUS_LACK:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_LACK);
+	case BUFFER_STATUS_DIRTY:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_DIRTY);
+	case BUFFER_STATUS_MAX:
+		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_MAX);
+	default:
+		return "Unknown Buf Done Status";
+	}
+};
+
+char *isp4dbg_get_img_fmt_str(int fmt /* enum isp4fw_image_format * */)
+{
+	switch (fmt) {
+	case IMAGE_FORMAT_NV12:
+		return "NV12";
+	case IMAGE_FORMAT_YUV422INTERLEAVED:
+		return "YUV422INTERLEAVED";
+	default:
+		return "unknown fmt";
+	}
+}
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre,
+			       void *in, void *orig_buf)
+{
+	struct isp4fw_buffer_meta_info *p;
+	struct isp4if_img_buf_info *orig;
+
+	if (!in)
+		return;
+
+	if (!pre)
+		pre = "";
+
+	p = (struct isp4fw_buffer_meta_info *)in;
+	orig = (struct isp4if_img_buf_info *)orig_buf;
+
+	dev_dbg(dev, "%s(%s) en:%d,stat:%s(%u),src:%s\n", pre,
+		isp4dbg_get_img_fmt_str(p->image_prop.image_format),
+		p->enabled, isp4dbg_get_buf_done_str(p->status), p->status,
+		isp4dbg_get_buf_src_str(p->source));
+
+	dev_dbg(dev, "%p,0x%llx(%u) %p,0x%llx(%u) %p,0x%llx(%u)\n",
+		orig->planes[0].sys_addr, orig->planes[0].mc_addr,
+		orig->planes[0].len, orig->planes[1].sys_addr,
+		orig->planes[1].mc_addr, orig->planes[1].len,
+		orig->planes[2].sys_addr, orig->planes[2].mc_addr,
+		orig->planes[2].len);
+}
+
+char *isp4dbg_get_buf_type(u32 type)
+{
+	/* enum isp4fw_buffer_type */
+	switch (type) {
+	case BUFFER_TYPE_PREVIEW:
+		return ISP4DBG_MACRO_2_STR(BUFFER_TYPE_PREVIEW);
+	case BUFFER_TYPE_META_INFO:
+		return ISP4DBG_MACRO_2_STR(BUFFER_TYPE_META_INFO);
+	case BUFFER_TYPE_MEM_POOL:
+		return ISP4DBG_MACRO_2_STR(BUFFER_TYPE_MEM_POOL);
+	default:
+		return "unknown type";
+	}
+}
+
+char *isp4dbg_get_cmd_str(u32 cmd)
+{
+	switch (cmd) {
+	case CMD_ID_START_STREAM:
+		return ISP4DBG_MACRO_2_STR(CMD_ID_START_STREAM);
+	case CMD_ID_STOP_STREAM:
+		return ISP4DBG_MACRO_2_STR(CMD_ID_STOP_STREAM);
+	case CMD_ID_SEND_BUFFER:
+		return ISP4DBG_MACRO_2_STR(CMD_ID_SEND_BUFFER);
+	case CMD_ID_SET_STREAM_CONFIG:
+		return ISP4DBG_MACRO_2_STR(CMD_ID_SET_STREAM_CONFIG);
+	case CMD_ID_SET_OUT_CHAN_PROP:
+		return ISP4DBG_MACRO_2_STR(CMD_ID_SET_OUT_CHAN_PROP);
+	case CMD_ID_ENABLE_OUT_CHAN:
+		return ISP4DBG_MACRO_2_STR(CMD_ID_ENABLE_OUT_CHAN);
+	default:
+		return "unknown cmd";
+	};
+}
+
+char *isp4dbg_get_resp_str(u32 cmd)
+{
+	switch (cmd) {
+	case RESP_ID_CMD_DONE:
+		return ISP4DBG_MACRO_2_STR(RESP_ID_CMD_DONE);
+	case RESP_ID_NOTI_FRAME_DONE:
+		return ISP4DBG_MACRO_2_STR(RESP_ID_NOTI_FRAME_DONE);
+	default:
+		return "unknown respid";
+	};
+}
+
+char *isp4dbg_get_if_stream_str(u32 stream /* enum fw_cmd_resp_stream_id */)
+{
+	switch (stream) {
+	case ISP4IF_STREAM_ID_GLOBAL:
+		return "STREAM_GLOBAL";
+	case ISP4IF_STREAM_ID_1:
+		return "STREAM1";
+	default:
+		return "unknown streamID";
+	}
+}
+
+char *isp4dbg_get_out_ch_str(int ch /* enum isp4fw_pipe_out_ch */)
+{
+	switch ((enum isp4fw_pipe_out_ch)ch) {
+	case ISP_PIPE_OUT_CH_PREVIEW:
+		return "prev";
+	default:
+		return "unknown channel";
+	}
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.h b/drivers/media/platform/amd/isp4/isp4_debug.h
new file mode 100644
index 000000000000..acf99bf129ae
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_DEBUG_H_
+#define _ISP4_DEBUG_H_
+
+#include <linux/printk.h>
+#include <linux/dev_printk.h>
+
+#include "isp4_subdev.h"
+
+#ifdef CONFIG_DEBUG_FS
+struct isp4_device;
+
+void isp_debugfs_create(struct isp4_device *isp_dev);
+void isp_debugfs_remove(struct isp4_device *isp_dev);
+void isp_fw_log_print(struct isp4_subdev *isp);
+
+#else
+
+/*to avoid checkpatch warning*/
+#define isp_debugfs_create(cam) cam
+#define isp_debugfs_remove(cam) cam
+#define isp_fw_log_print(isp) isp
+
+#endif /* CONFIG_DEBUG_FS */
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre, void *p,
+			       void *orig_buf /* struct sys_img_buf_handle* */);
+char *isp4dbg_get_img_fmt_str(int fmt /* enum _image_format_t * */);
+char *isp4dbg_get_out_ch_str(int ch /* enum _isp_pipe_out_ch_t */);
+char *isp4dbg_get_cmd_str(u32 cmd);
+char *isp4dbg_get_buf_type(u32 type);/* enum _buffer_type_t */
+char *isp4dbg_get_resp_str(u32 resp);
+char *isp4dbg_get_buf_src_str(u32 src);
+char *isp4dbg_get_buf_done_str(u32 status);
+char *isp4dbg_get_if_stream_str(u32 stream);
+
+#endif
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 0e1eb22a0de5..b79b0f2a4776 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -7,6 +7,7 @@
 
 #include "amdgpu_object.h"
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw.h"
 #include "isp4_hw_reg.h"
@@ -392,7 +393,8 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
 	len = rb_config->val_size;
 
 	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
-		dev_err(dev, "fail no cmdslot (%d)\n", stream);
+		dev_err(dev, "fail no cmdslot %s(%d)\n",
+			isp4dbg_get_if_stream_str(stream), stream);
 		return -EINVAL;
 	}
 
@@ -400,13 +402,15 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
 	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
 
 	if (rd_ptr > len) {
-		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
+		dev_err(dev, "fail %s(%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, rd_ptr, len, wr_ptr);
 		return -EINVAL;
 	}
 
 	if (wr_ptr > len) {
-		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
+		dev_err(dev, "fail %s(%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, wr_ptr, len, rd_ptr);
 		return -EINVAL;
 	}
@@ -498,7 +502,9 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
 			}
 			rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
 			wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
-			dev_err(dev, "fail to get cmdq slot,stream (%d), rd %u, wr %u\n",
+			dev_err(dev,
+				"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+				isp4dbg_get_if_stream_str(stream),
 				stream, rd_ptr, wr_ptr);
 			return -ETIMEDOUT;
 		}
@@ -550,8 +556,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
 
 	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 	if (ret) {
-		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n",
-			cmd_id);
+		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
+			isp4dbg_get_cmd_str(cmd_id), cmd_id);
 		if (cmd_ele) {
 			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num,
 						cmd_ele->cmd_id);
@@ -780,13 +786,15 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 	wr_ptr_dbg = wr_ptr;
 
 	if (rd_ptr > len) {
-		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
+		dev_err(dev, "fail %s(%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, rd_ptr, len, wr_ptr);
 		return -EINVAL;
 	}
 
 	if (wr_ptr > len) {
-		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
+		dev_err(dev, "fail %s(%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, wr_ptr, len, rd_ptr);
 		return -EINVAL;
 	}
@@ -801,7 +809,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -827,7 +836,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -849,7 +859,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -866,9 +877,10 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 			checksum, response->resp_check_sum,
 			rd_ptr_dbg, wr_ptr_dbg);
 
-		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n",
-			stream,
+		dev_err(dev, "%s(%u), seqNo %u, resp_id %s(0x%x)\n",
+			isp4dbg_get_if_stream_str(stream), stream,
 			response->resp_seq_num,
+			isp4dbg_get_resp_str(response->resp_id),
 			response->resp_id);
 
 		return -EINVAL;
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index d93cdb9dc477..e2084030c79d 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -7,6 +7,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw.h"
 #include "isp4_interface.h"
@@ -305,7 +306,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
+	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
+		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
+		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
 		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
 		cmd_ch_prop.image_prop.luma_pitch,
 		cmd_ch_prop.image_prop.chroma_pitch);
@@ -328,6 +331,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return ret;
 	}
 
+	dev_dbg(dev, "enable channel %s\n",
+		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
+
 	if (!sensor_info->start_stream_cmd_sent) {
 		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
 					    out_prop->height);
@@ -490,8 +496,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
 	struct device *dev = isp_subdev->dev;
 
-	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
 		stream_id,
+		isp4dbg_get_cmd_str(para->cmd_id),
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
@@ -548,8 +555,9 @@ isp4sd_preview_done(struct isp4_subdev *isp_subdev,
 			pcb->preview.status = ISP4VID_BUF_DONE_STATUS_SUCCESS;
 		}
 	} else if (meta->preview.enabled) {
-		dev_err(dev, "fail bad preview status %u\n",
-			meta->preview.status);
+		dev_err(dev, "fail bad preview status %u(%s)\n",
+			meta->preview.status,
+			isp4dbg_get_buf_done_str(meta->preview.status));
 	}
 
 	return prev;
@@ -609,14 +617,18 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 	pcb.poc = meta->poc;
 	pcb.cam_id = 0;
 
-	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
+	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,%s(%i)\n",
 		ktime_get_ns(), stream_id, meta->poc,
 		meta->preview.enabled,
+		isp4dbg_get_buf_done_str(meta->preview.status),
 		meta->preview.status);
 
 	prev = isp4sd_preview_done(isp_subdev, meta, &pcb);
-	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT)
+	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT) {
+		isp4dbg_show_bufmeta_info(dev, "prev", &meta->preview,
+					  &pcb.preview.buf);
 		isp4vid_notify(&isp_subdev->isp_vdev, &pcb);
+	}
 
 	isp4if_dealloc_buffer_node(prev);
 
@@ -637,6 +649,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
 		return;
 
+	isp_fw_log_print(isp_subdev);
+
 	while (true) {
 		s32 ret;
 
@@ -654,7 +668,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 						  &resp.param.frame_done);
 			break;
 		default:
-			dev_err(dev, "-><- fail respid (0x%x)\n",
+			dev_err(dev, "-><- fail respid %s(0x%x)\n",
+				isp4dbg_get_resp_str(resp.resp_id),
 				resp.resp_id);
 			break;
 		}
-- 
2.34.1


