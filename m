Return-Path: <linux-media+bounces-41240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A645EB39929
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 12:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0030A7B05AD
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A3C30AD07;
	Thu, 28 Aug 2025 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OlxmYpkw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30305308F30;
	Thu, 28 Aug 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756375762; cv=fail; b=NBdBJ6kBR9ogQypZ1Jdm4PgRcKhL83nItwTyehtJWUy+x56xocEM+kaJ8TAEoCkMfYyd1nZ658zeAecvQfquTitb0NlQJAlkUVxX3fhQmqg2OH6j4JzUOFoPwUfa1vLbwKZ7bhTvFWuUsViM1c1Yu4v31Izmx5wIT1C2aU9esXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756375762; c=relaxed/simple;
	bh=Ri2ttzRBlksCLPHQcOVIVeuYsealhfvbZPkJUAq8j1s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwiTY5ByN5KAVPuCn+SVrRLH1jun3FTcghC/4Ow1Pii7i1TRibziUgmRuFaJTh3SfWPhIYwp/aomXaxxeWY0JMxKMvvPXioX30jQcu1+7bHACGZbsI5ZM9vhXEJ9XQ/DxC57TCmguYNKHnyYIlbtfGbj701CuO+hEI6Z1OtukMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OlxmYpkw; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpiI4L03QXZM5RpjP/Pgr1S8cXHYVMcKKMnN1JFmfraJZhp9EsH087e6n/Apv4L/0aCk/XrL+ofI7yNrCYQLk6123lCNneDmIDwZ08b+1fF2ta8QLjwAMxXQ3yr1cZmGpf3HIz+1zkfxZIbnkZvs7npF66WO3iSRVQanYR0yWbRKrlWlnW/nL0D4KLf8188xPAKa4Jjybi+uDDr9zScRjclOcoJ9Ch11R93Du/tZom2kK0/DMPBp5hazgJYSQ9UIC19mhszZO3X5aIVH8g8d6agTV38qBF0yWTTPaCUbePnQhhwMF/1i3xUWq5/bYdYWsY7pDWmkLwsPpZnMvXSZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2Tx4bJkSIJEZE8UNvfRuphtf7hDh6cdvzD45Q7XCgc=;
 b=arcsbrSJ4tFiIQk9ZsnLMLbF6AIY4UxvjFQWUFFc1W/uRA3LEzb2tPpfywn/FWhnJXvpUrpqkr3r9oEVT5gEzh726qsBh/+QvFdUOtMZchsFXErP5cu2ApJliauZTdsUoAW4zsEHcPzflCS0CjccDl5zZzlHoajVx2Hjat55bes6R7funkxWyJU2hIJ5qwyfGJkLsKzB+9kacOnjiirbImmug7M8iYsCigSJRLL2pnfQACj67yoRf6FVXlGZtgxrBt4MzfFjTgUAs4k+bzoYa42pCB9tha7SPwvdjC3H0grUOwYS/YeM+6Fgp60W/4Qfylbiyhx+LikkktV5EFMhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2Tx4bJkSIJEZE8UNvfRuphtf7hDh6cdvzD45Q7XCgc=;
 b=OlxmYpkw3jRD94XpYtNJSyij4Bdshh7YkjsZsyBtfcHywd3weAt+mLNDt/smB6s42uGFbxEN7s6vyNUw7de+zu7BNIJlqhWo2C8DT5xwzoLqJnEgbcJ9s7l2sUQw2zzUYyRJI8NrLWA19J76AbqwCOcMkJjd7pp/tz1Xi7yxBHs=
Received: from MN2PR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:23a::6)
 by SJ0PR12MB6807.namprd12.prod.outlook.com (2603:10b6:a03:479::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Thu, 28 Aug
 2025 10:09:10 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::28) by MN2PR03CA0001.outlook.office365.com
 (2603:10b6:208:23a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.19 via Frontend Transport; Thu,
 28 Aug 2025 10:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:09:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:09:09 -0500
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 03:09:05 -0700
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
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: [PATCH v3 6/7] media: platform: amd: isp4 debug fs logging and  more descriptive errors
Date: Thu, 28 Aug 2025 18:08:10 +0800
Message-ID: <20250828100811.95722-6-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828100811.95722-1-Bin.Du@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SJ0PR12MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 90639db4-af26-4fa4-6a26-08dde61aee7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ox7rxP0fxwgrUT961kuIh7W+qDr2Tm9qP8BzD2/VR+uxBl6o+ine0EeffVQd?=
 =?us-ascii?Q?nrSaDuqc0t9YECOPK+ieruG0EKbikW5S9Leea3mglaEJGTsrpCkAo79y1N3l?=
 =?us-ascii?Q?yoJlAyeN6N8B0A0vTNyrzccXyK2RoAj94p8+thR9h0ZR/w1lO8yaMhBaFHDU?=
 =?us-ascii?Q?tkivVMH13WnJ5wljubRfu6dJKn3Cfdf19Fo/661IcyumqGFvh8LQwHkR5ooq?=
 =?us-ascii?Q?GHPTS+nH69ORUukDxxZPPyixV6VNGBIo2hqDBXAQlOzghX0Bm0pBVa1FMZBw?=
 =?us-ascii?Q?Kp5lujiHmIRKV0BdzWB/pDHaadQERkmnLhjv/kZSzUuE/ZVcTBEdFJWj4LPh?=
 =?us-ascii?Q?0Jg0V2gOdmDVAn/32cuZrT2mjUEj0J+KgAz5MgjyHZXqtzTo1T3tkXx5R3hW?=
 =?us-ascii?Q?yk0kPqpZylI9Qq5kBI2SfVncEyunyyeZbMsb0ux4KxIwVtjA90Of570k1x2W?=
 =?us-ascii?Q?mBCVJvVAdrgTX/vtNlgWy0uEAmgRO/m7cDeyz7sdsLcjZ1WXylJbrJSBJKY0?=
 =?us-ascii?Q?IM28ReqYo2MPVkjL6dxE1j28uRWZy3hZgvo4Od1ferCF6p463jGdx6XnKWCp?=
 =?us-ascii?Q?P2u1rg5HQofOqj5OVmhn+AINlDWZCHgiAYDWpPWZubBm2spOcYtDOnKVBC9i?=
 =?us-ascii?Q?746I/qcw1+EaS9jeTTrqMGfAD1uIkU2YOyaeMnZryPY0BL63Hla/oA9KGaVz?=
 =?us-ascii?Q?twccfFnb1xmNgOmH/tT+bDhdCivGsgDHnAPFwlOPMYxm5vfTH0dljLujmpbd?=
 =?us-ascii?Q?C3CYHHoQrhOraMo2BLdiqlyDhF2sGQs7XTXbbQuj8zYEpd8Rk5O1mVaT6uIk?=
 =?us-ascii?Q?p9NMs9LXj4Fi55K0EVXRP2eqHEw3TnJVY7izgXuzsSZ6EuAu8ASc201S3da9?=
 =?us-ascii?Q?C4JPOURvvA+Q2OgG7Pwxg4Yg33SDQcFTzdAcq1fZ6jiGmaWEE1dCl7jGCea+?=
 =?us-ascii?Q?lC5T94Ned/7v48nugxDzcN8KXcgNeuF8pCZmv+FwYysjxaS+cKznJ7OLYnY3?=
 =?us-ascii?Q?sqKdjJ91QpxuNCQxlz5lQUt5nmpQhGz3cQiDi9FxjP2qhmfzDXM5IJ/B9Pqf?=
 =?us-ascii?Q?+8A+KAT137tlW6sLlQstJk4lAWNCmd9mj6/0rMZhK/ddOTXrU3Ll6IRSVgh5?=
 =?us-ascii?Q?QGpOc2F1bp77DQuuyiySb/XT9c+VC0jO3tcDc2pr6k6sWJhp+AvlcP7sEFBc?=
 =?us-ascii?Q?rmmVgVn0GFw8PsjRbDLuR/jq+mwRGLbtd20YYKyF4E8nycDymfphP2RYNbI3?=
 =?us-ascii?Q?AIAEr2dIhZvsAMaA+SKwxC+aVsZnWvHOCr2LcZNiCiE6Vkd+0NsJOJ64UxeC?=
 =?us-ascii?Q?tOkZyOr9jpfAoBVXeHv3sCylteHGIMOSMLoVKT2Grok7TGHkOXhhUxm8fzru?=
 =?us-ascii?Q?w+5VWqDkhnd3CfbUoF86bsry2sD9koDnw4YfLdY7sl7VRJ53eg4n0mBfFD5o?=
 =?us-ascii?Q?6V+0CiKbi1bwlMHfUxtKieENlZXz4KcY4AcQO4i/lUzkTjJCxVTf1O0dwXK3?=
 =?us-ascii?Q?apngEzTiZt6jmB6s/QgLlz+TmFzZ+Z/HGV9Q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:09:10.0592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90639db4-af26-4fa4-6a26-08dde61aee7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6807

Add debug fs for isp4 driver and add more detailed descriptive error info
to some of the log message

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
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
index 437232d4912d..7724620896e7 100644
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
index d381785c8ac2..1da970fee20f 100644
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
@@ -357,7 +357,8 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_st
 	len = rb_config->val_size;
 
 	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
-		dev_err(dev, "fail no cmdslot (%d)\n", stream);
+		dev_err(dev, "fail no cmdslot %s(%d)\n",
+			isp4dbg_get_if_stream_str(stream), stream);
 		return -EINVAL;
 	}
 
@@ -365,13 +366,15 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_st
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
@@ -453,7 +456,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 		u32 wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 
 		dev_err(dev,
-			"failed to get free cmdq slot, stream (%d),rd %u, wr %u\n",
+			"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, rd_ptr, wr_ptr);
 		return -ETIMEDOUT;
 	}
@@ -503,9 +507,11 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 
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
@@ -716,13 +722,15 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
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
@@ -737,7 +745,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -763,7 +772,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -785,7 +795,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -800,9 +811,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
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
index 2eb9446bfea7..a82ea4c80ea3 100644
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


