Return-Path: <linux-media+bounces-42288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60791B52E05
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98C827BAA63
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1BC311C1F;
	Thu, 11 Sep 2025 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FVcgi0+v"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE743101A2;
	Thu, 11 Sep 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585397; cv=fail; b=GGHBOGZp7UfpA4QUHTj13Gnd5IesXhHBx2rOnTVXe0BraI75y23mNO/gkEcRCHOvi+bWdF6NH1ENoc/fZsbX6mObob2wVRz4jgnOv/fUx7xYrO/bRkHOcndr8O7bYhsytpaqWHapxQIitzbrfTOpzsTTmZj+w4Dz7qjJAW20O6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585397; c=relaxed/simple;
	bh=wmh5L7RAg70a29vEtj/HgzEuqg+zNHckICTzEfrvGqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMcLaaLuxvrGaMEhRHnH+bqrq/LWEdSJZtAevwIbSl2UpgRRlJ+QeGCQ3U0X+rtJSbfKKN8VH5Fi4th+V0Nueyn81DT2HbxiamVAP0m55o4bi9Fu07jwrvpHQcgnDhaL1ya2b1hy/X+bwklcreERw5pLBlKReXuAltUVi6aFCD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FVcgi0+v; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsmwXAStwmENO8xnZH0gWS36eKtxA3fp1Co5CRa3NQ8u0ud31zy3feUxdajsDwFGLGWD40u7VB3wEt6BehZ4FPCYw1M2IknwMfB3JEXRyaiqyHd6+IQ/oA4Dxsv30UvVMQvGNZd99Zye9macXbswazdhOMvMbSBLNl2HEzJ6SrLXLBrZVk/SB1gnPdAO82ZBySYc52OG2hP7n24kNul9RZE+pNy9W4wGboaZfFgXTOuyp37rbywSeM0t6AKKPvqTqDJtJstMB/alioBKGrZwCDFhfFNkcNrInPCGtNn4VnIOGHeRrbmd6c6EIgyFuAYwsAuuSEjd8VwlDNIcKhP4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sjf+1hAj+9q1rv5RtuyJQgCUI13V5fx2ALUPxcoFmg4=;
 b=LzQXA8tBjkdLJGZU0dvQxv4wJF/LQYe5EaOKo0NcuvZLh6wbSdCOd1b7N0WPhUMoOAydLLlwrIJJnyd94hPw5n8VdB+f5BUy3t2mqZyK37kjFaDkKXUySduQXTChc7Ll01JeBXx0kkeaRVlKzRVyxXp88i9RUjEfpOVPylefb+59M1sJ6iL5zJpHuT5eBy0PJkeeqBKX8a0Q9hVVKEZ/ouAijskVqS1eXiPFJaqR9VOTI/95z9FiynG/GucuEepHNjZawO03fZAuYZ2oQGc3/8j1Cw/Oi5Nlafr7J70lLDu/CIIjraAM17Gkc0FG1nklWLISbIsZRv5PlY9VFTt+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sjf+1hAj+9q1rv5RtuyJQgCUI13V5fx2ALUPxcoFmg4=;
 b=FVcgi0+v1VT1Pi2yTn+7iUlwaWumhbklJrfquEOTVIw3wEpH9q0cAFaqsW6qXKizechS6KdC6aRJrf5+tGhBF3QUu59VRMbXOjc0uNWExghIIIMitqRwqNzNCYFJ8h0f9grI7NwqrLAEHe6XEw3ltTbISOdyaYos094uHMgxPOM=
Received: from MN2PR04CA0027.namprd04.prod.outlook.com (2603:10b6:208:d4::40)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:09:47 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::92) by MN2PR04CA0027.outlook.office365.com
 (2603:10b6:208:d4::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 11 Sep 2025 10:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 10:09:47 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 03:09:38 -0700
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Alexey
 Zagorodnikov" <xglooom@gmail.com>
Subject: [PATCH v4 6/7] media: platform: amd: isp4 debug fs logging and  more descriptive errors
Date: Thu, 11 Sep 2025 18:08:46 +0800
Message-ID: <20250911100847.277408-7-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911100847.277408-1-Bin.Du@amd.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DS7PR12MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1b2cda-a339-4730-32a9-08ddf11b564d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T99bhCQKmaXoiXwujZX9q84pmEa+Atjk6kPExpsWRG+yj6hkEZsoJ6VgBowW?=
 =?us-ascii?Q?tOp2jYu91DbsQKhxeTwPooErksjO3Km/zYDzSvzwaBU8S/Uak4sxV1SWDkCi?=
 =?us-ascii?Q?1Iz9hmhCsMpiISx0yL0wRiBP2abT7et9Ykp2Te6UtIcRBDEHI0cVNcWq6JF2?=
 =?us-ascii?Q?Ncgcqh6olc1J1H4LUPrY3v0kd0hp+LSxh4DjGhTim2pJAyFHGKA7JSlkzSa6?=
 =?us-ascii?Q?ZVTJ8IkpwT+HE/z60+ME630ATjJ8lL0oZ+5i3mXQYO2/DDBNstrugAwdApCe?=
 =?us-ascii?Q?g0zbE9GhjltOHP2/XFUEDGoqeErk1P3Fv8K+4exp19gHSSz25sJs1uvmZeV/?=
 =?us-ascii?Q?ZmuXiWRxCy+zKlXu2dXK3Jr31f8xnmjgXH4XaCQenmnq6PkZzFJrlCcxpeRd?=
 =?us-ascii?Q?lA6318rX8a9/y6OEnToVyCNoOr7R6ZHhGKxL1ZnWBuWti1k+ry+jcgH0URTA?=
 =?us-ascii?Q?vlzJg5jNn9tFV/iTk6TaJWsohq+MKpZ8oLtWHqy4O/ixwEdJVx+BASc/8cZw?=
 =?us-ascii?Q?s96yIMx3S2fgaaJNx27dTqGUTuh2elovMdjn3HPIOzxi0Jijpvwjgih1BtLR?=
 =?us-ascii?Q?dneyvWn7tI05lA8Oupv9DbK+zf64kRsIwDJXoFJ2jvZsTPZUAWpBK6A4z0xj?=
 =?us-ascii?Q?biQ+erFAaA4cRh9I6lwVlHpA+6G/EMo8vAlSZZT8pbrW3jLBhKCbGCATfp2g?=
 =?us-ascii?Q?KUB2bBD/ZfUYCrhOsNV4jEUt1VjRHEjniwIN2i33nXMtFEcvCKYdOnqwZ5Cr?=
 =?us-ascii?Q?KH53/kHWsg2Kv72GKRWIEW2RFQRrX7OipRzTQkCAVedLNPnEqtTgR7S5wFdB?=
 =?us-ascii?Q?5cZF/+NvK9KTkNPsLxt6SbBHLAXUAayTsKfEP+MqkEHOFGxQH+zv+aDP7Ph0?=
 =?us-ascii?Q?KM5vskecrQXt5pGT7N6mG+ujtNJL0E1FPO5R33L/662r2v7/Zds9NzXlkM+F?=
 =?us-ascii?Q?kzgThwev381M0teEMhzNnLWAgyDIU78ejofFZCOtYe+IwZeaOqZkv3R8kKOC?=
 =?us-ascii?Q?sXyEctxhULErreKSRcYJ487Ysj7pAV7p66S3PEGTS8ZgF+NDXZ5+jUA6eI4u?=
 =?us-ascii?Q?wf/2fQcVOlTpoLfnTEuA32CKom9q0bIdf9ieED37STtcIVZkOG2RALMDAic1?=
 =?us-ascii?Q?/On/fVIShLZqBUTRAwcpPYHTwwehPn+IzeW0Mg+p4S/PAZg+fWfDdgCbgcdD?=
 =?us-ascii?Q?GVXMLql3TKBJEAeIg2F6gm2V8MC7XzloCAI1DUp9Jiw2CqHMcyMEF3GjLV2H?=
 =?us-ascii?Q?ztFdoOlw1NufmxeRlGaSlZFUtzFCC9TrosGtqCR/Zbox93El9n6OUoN8szNz?=
 =?us-ascii?Q?+3lMBr6kK1WhO0qq/mBdvx7GuaZykSmG3YqWUBJMFybtTryu76L+Q7rj/Z0H?=
 =?us-ascii?Q?jeqibghc1pZDsZrc7yuSbNyd0+7vpU6Ho7JCMZMywkiMDrtaWR65G+/lbrXA?=
 =?us-ascii?Q?8s84M0yQxDE5V7CLVjRchKk5G4Q1R6o92BPBc6YagtJeZ2u7yeWTmTn5QUne?=
 =?us-ascii?Q?lgpndjD7JuwEqim2x0GYZy//IbHkS9n5Pvi6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:09:47.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1b2cda-a339-4730-32a9-08ddf11b564d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839

Add debug fs for isp4 driver and add more detailed descriptive error info
to some of the log message

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 MAINTAINERS                                   |   2 +
 drivers/media/platform/amd/isp4/Makefile      |   1 +
 drivers/media/platform/amd/isp4/isp4.c        |   4 +
 drivers/media/platform/amd/isp4/isp4_debug.c  | 272 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
 .../media/platform/amd/isp4/isp4_interface.c  |  41 ++-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  29 +-
 7 files changed, 368 insertions(+), 22 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 80c966fde0b4..8478789ac265 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,6 +1145,8 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_debug.c
+F:	drivers/media/platform/amd/isp4/isp4_debug.h
 F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 F:	drivers/media/platform/amd/isp4/isp4_interface.c
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 33589091ca96..c89355fb2374 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
 amd_capture-objs := isp4_subdev.o \
+			isp4_debug.o \
 			isp4_interface.o \
 			isp4.o	\
 			isp4_video.o
\ No newline at end of file
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index a46e110a396f..f129a9fbf315 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-ioctl.h>
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_hw_reg.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
@@ -189,6 +190,7 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, isp_dev);
+	isp_debugfs_create(isp_dev);
 
 	return 0;
 
@@ -204,6 +206,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
 {
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
 
+	isp_debugfs_remove(isp_dev);
+
 	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
 
 	media_device_unregister(&isp_dev->mdev);
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
new file mode 100644
index 000000000000..cc99b357df27
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
+#include "isp4_hw_reg.h"
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
+	p = in;
+	orig = orig_buf;
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
index 000000000000..0c75ddae4882
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
+/* to avoid checkpatch warning */
+#define isp_debugfs_create(cam) ((void)(cam))
+#define isp_debugfs_remove(cam) ((void)(cam))
+#define isp_fw_log_print(isp) ((void)(isp))
+
+#endif /* CONFIG_DEBUG_FS */
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre, void *p,
+			       void *orig_buf /* struct sys_img_buf_handle */);
+char *isp4dbg_get_img_fmt_str(int fmt /* enum _image_format_t */);
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
index 52dcca57ce2e..914bd02a26e6 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -6,8 +6,8 @@
 #include <drm/amd/isp.h>
 #include <linux/iopoll.h>
 #include <linux/mutex.h>
-#include <linux/platform_device.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
@@ -355,7 +355,8 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_st
 	len = rb_config->val_size;
 
 	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
-		dev_err(dev, "fail no cmdslot (%d)\n", stream);
+		dev_err(dev, "fail no cmdslot %s(%d)\n",
+			isp4dbg_get_if_stream_str(stream), stream);
 		return -EINVAL;
 	}
 
@@ -363,13 +364,15 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_st
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
@@ -447,7 +450,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 		u32 wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 
 		dev_err(dev,
-			"failed to get free cmdq slot, stream (%d),rd %u, wr %u\n",
+			"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, rd_ptr, wr_ptr);
 		return -ETIMEDOUT;
 	}
@@ -497,9 +501,11 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 
 	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 	if (ret) {
-		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n", cmd_id);
+		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
+			isp4dbg_get_cmd_str(cmd_id), cmd_id);
 		if (cmd_ele) {
-			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num, cmd_ele->cmd_id);
+			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num,
+						cmd_ele->cmd_id);
 			kfree(cmd_ele);
 		}
 	}
@@ -710,13 +716,15 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
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
@@ -731,7 +739,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -757,7 +766,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -779,7 +789,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -794,9 +805,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
 			checksum, response->resp_check_sum, rd_ptr_dbg, wr_ptr_dbg);
 
-		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n", stream,
-			response->resp_seq_num,
-			response->resp_id);
+		dev_err(dev, "%s(%u), seqNo %u, resp_id %s(0x%x)\n",
+			isp4dbg_get_if_stream_str(stream), stream, response->resp_seq_num,
+			isp4dbg_get_resp_str(response->resp_id), response->resp_id);
 
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 7d3339c915eb..bc63311c2490 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -7,6 +7,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_interface.h"
 #include "isp4_subdev.h"
@@ -252,7 +253,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
+	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
+		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
+		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
 		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
 		cmd_ch_prop.image_prop.luma_pitch,
 		cmd_ch_prop.image_prop.chroma_pitch);
@@ -275,6 +278,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return ret;
 	}
 
+	dev_dbg(dev, "enable channel %s\n",
+		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
+
 	if (!sensor_info->start_stream_cmd_sent) {
 		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
 					    out_prop->height);
@@ -428,8 +434,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
 	struct device *dev = isp_subdev->dev;
 
-	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
 		stream_id,
+		isp4dbg_get_cmd_str(para->cmd_id),
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
@@ -486,8 +493,9 @@ isp4sd_preview_done(struct isp4_subdev *isp_subdev,
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
@@ -546,14 +554,18 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
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
 
@@ -574,6 +586,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
 		return;
 
+	isp_fw_log_print(isp_subdev);
+
 	while (true) {
 		s32 ret;
 
@@ -591,7 +605,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
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


