Return-Path: <linux-media+bounces-34311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A17AD12C7
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F25C67A37DB
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E49251782;
	Sun,  8 Jun 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sYIuB8a2"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E324E4AD;
	Sun,  8 Jun 2025 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394220; cv=fail; b=sxTjtAEij3NhuRsrShkxppgEQetBcpZr/bArqQLpjRmu2wUiFRC6T1ia7Unxvnt/poy2I8zNY9xlQ+49itLjU6SOyQYOLy/+rDPkkXa9JBTtb7h3BlkBAivpgli7yMYlspbL49aIUdZCcrQJ6H8zYiZ2Jnm2o/eKLWhIA5lQHL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394220; c=relaxed/simple;
	bh=qL/EjjlzzhjIrh1w/93MXxF8OhKfxN/EHvCZbIjZKKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAnWUc/tZgzqB6Ak/tK1y98C/WRvjWu65gX6F733qSgHKSWLp4jQ6GQipZnXHOaCeY1p4SA2yKUho0qRcHkXX0kMxGeDht3bdtQK+7UfSps9SleK3n4tn7YSDsspBPz+kUo50Oor6NiG1q4O2cshjk3/myQeIfU6Rh6QgkYBWm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sYIuB8a2; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZX7Yl+AYeQ5Ls9iKnj2JPO7BtiJpoGo1/n/XEBIouN6qGpOPhys0/GtxTiwVJSw38KoZtAWmssNg64lO+pimFwmE3JqbvzDrHmWUV7SOUTcFueBAMDQEVPhg04ANoteMQ2wNC4Q09Z7wMB2MjvBpYuW96RXvYsaIr464IAr3MDBDjOHPcJgg2JeV755aNUATMsYNQiJDsxxO1/qhyYi1FTHKUgD04OQFeuny9bBF4+Q7IVz10DHWty8UT1O2Lzoj/gSkJsCCzJr9iH+MC177c75qnk/UDra+3LqTuvBOZKgEU7qgOxrUgj+mc4CzZzBsGTQmormO8Nd5O1USDA8XTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrzMMVXAnmsDF+Xra1QS1B6ip+/6NjYNc4GJU6EyPcM=;
 b=tW75FWpYfSICVx1AutFOUULCuHBWq72WHRMZlIwbs0UVyvqopT/Prk4d/xGnRtMU1yracSvmVPNJGzCU7TPcGYwgbHFWyDX9Akt/Xf5ye/UXDNxkFP8pCfR2Nrx5f/H/c+HlZHtGcuFwwvpkN3H43LkMg2d9cfQ9B4XGEESRpo2OX3aNGUl7gdyTpX/PcyJFonTqPSbTDGCbe64bRymXlI3z1h1HIgpdcpzmj2UAO2oMet0bX+L9rmvwCRv6BegEHDoLoeAftaVtwtZ0x+c6BsH2MHqMMWnQHgcqSeZPTyhSKv2hTUZgz9BfUpCZki2YBEpioO9HE7kBDBl21FtEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrzMMVXAnmsDF+Xra1QS1B6ip+/6NjYNc4GJU6EyPcM=;
 b=sYIuB8a2QtPPUcpaNByaV6KLiJ3QpB7mtDKzWJzzEVBA1NmJo4hB3cm93JbVL+4lU8GpXPDlQ8E0olEkwsW4s/59Am2uCUj+Fg7QO6chvuQBr0X/tS2ujnx0s/HV/axLB3jPiqmHf8/UdnZOEpBez6U5KdIzlnQoGa3a6fhrWTE=
Received: from MW4PR04CA0326.namprd04.prod.outlook.com (2603:10b6:303:82::31)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Sun, 8 Jun
 2025 14:50:10 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::d5) by MW4PR04CA0326.outlook.office365.com
 (2603:10b6:303:82::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Sun,
 8 Jun 2025 14:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:50:08 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:50:02 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 7/9] media: platform: amd: isp4 debug fs logging and  more descriptive errors
Date: Sun, 8 Jun 2025 22:49:14 +0800
Message-ID: <20250608144916.222835-8-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250608144916.222835-1-Bin.Du@amd.com>
References: <20250608144916.222835-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|IA1PR12MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5a4e25-5a0c-421b-8b9e-08dda69bc376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ubr5IdyvEAGJvUTbWGSOb2490GfK7k22gM1AgXV8uafzWe4wsEVsLtp2jf78?=
 =?us-ascii?Q?8KwKkIlh7ACkJAVEhFsrRJ/wAYGpgVf6tgZcXZwOvgnHTbjoSKbfBljGE4I8?=
 =?us-ascii?Q?egsj1K1DjjcmRiMJqe1XN4spy6uGSQqj7dDm7g4eGaC21fOejNoi1KDeK4iF?=
 =?us-ascii?Q?QKWXGIR+kyQyMpkujVLdskUYA1AkIeJq0DQX6I/ArpDk7dGl3NOwWj9Mj36N?=
 =?us-ascii?Q?1IP1HkCT+Xo2zA9HsGGHCQ64mG9ogjB08Y5RuA5gihb9YLc+fsJ7+csMxs8M?=
 =?us-ascii?Q?+fZwofM0uU3Zk466juuLf4x6SW/isPe0nB4QiqYid0/Wgqi+lgYmLh5nag49?=
 =?us-ascii?Q?dQRCbMzeYi8EIQX+rmGWYCCP/AHOO5jiTuGFCzPGoZaH0enzuYy9iSw2Xk5r?=
 =?us-ascii?Q?vx8PZ6MGtxH0WpzI5o8w5hXM60cj859P3Be5E5eUtODo7mvJPg4NmOgOtCMk?=
 =?us-ascii?Q?OTAGqzyei9rstJ7/Gaufv8IwASp7+e8jZQl3dWoYy+YsbIhL6DzgP9jtaovO?=
 =?us-ascii?Q?u4P5og600PYR3WtfABUcz3AD9dhwX86USkkYc6QiZqd3SeyV9GXY+5KH433F?=
 =?us-ascii?Q?ob9Iee1Z+TwtHc6STMWJVxTE3t7GGIJo5GNxJcXlZJ2+dMVY35/Mk27VSrJO?=
 =?us-ascii?Q?0e16o12/aLVr6hrouYrsiwaD8qzW0Q1SL0MQavURLPT+pFzEWydXfuCKbIT2?=
 =?us-ascii?Q?WWRPWvGn3B7zR2Dm6GHFIR4uYB5IsRhqhHxO4Pi0dGzdnmaOYFQ4kQjlouts?=
 =?us-ascii?Q?4X/eevWTYVMbJHBBPRvrcaR1tMJQiES/BHPk7wIIltySPv7JGpSq/ZEusaj+?=
 =?us-ascii?Q?kIDPEZB+ugClNQPCSPCrZzJaRDPD5PJX464CZ9re6up7avs6YkLfnfZcIhrO?=
 =?us-ascii?Q?DQzElDiQ9Fo4yuHvBp0yee5IjNpoUOiw4dusZI9TjnIMgYsK4ck4xvsb/dKA?=
 =?us-ascii?Q?oZdZRFYr5tMjoAcPmYWpgHLnOGhWT2cEL4cruQqWo63v0mi3JtDNpo81QBFX?=
 =?us-ascii?Q?SadzbyurX8XrBcQQHl0nlxl3LD3ZYuZxxceQobF5HIKpFI1IypfxCbn7RMvj?=
 =?us-ascii?Q?v4DPENFfyo5ZiXyiGBNCSjc8KsWLM5ag+vll7BLggsD5lmZ+JJGwbjWtuori?=
 =?us-ascii?Q?hMnoDfWP+RhI1zJZGivzIJZva5d8mQiWCVCbIgrGzFN4knXae2wltZhyhPfR?=
 =?us-ascii?Q?ZMKLEcbETUBBFZuJjFMw2L+NQt6NbV0m0jbOq2IUqtCs+rhsKJ9jFnriLvy9?=
 =?us-ascii?Q?O7lUFXB7qn0NfdUCXpRqLAbgeL3rFPM9PG6Oln8+9USHLhCSWqeJXaqKTcKx?=
 =?us-ascii?Q?k/P9ePF/YaxrRENc6cNw0LV0jtTAvAO3pJUP4Cg/A3YqwSQbo1facVPQgiq6?=
 =?us-ascii?Q?faMu7fbtIHgF2OYgXY6ykjRu1EaKQB21hv50I/wKUbo2Vf0sfyH5C5CKZtGP?=
 =?us-ascii?Q?l629NDpjWr1SIXhXolILhwRoc8pXDb2TEJwF5k73fHxBHjFgAn5cyfm7c+YI?=
 =?us-ascii?Q?Nb+NQFbUkX+sQOkqXYGfQykVG7e7m8b4Tn9L?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:50:08.4472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5a4e25-5a0c-421b-8b9e-08dda69bc376
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Change-Id: I3ce167dbeb612b94c89df0b48f7ffa0988b5336f
---
 drivers/media/platform/amd/isp4/Makefile      |   1 +
 drivers/media/platform/amd/isp4/isp4.c        |   5 +
 drivers/media/platform/amd/isp4/isp4_debug.c  | 272 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
 .../media/platform/amd/isp4/isp4_interface.c  |  37 ++-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  29 +-
 6 files changed, 365 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h

diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index a68f18fe79b4..da1e047cdb7d 100644
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
index 3beb35293504..f7e716ec47da 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -10,6 +10,7 @@
 #include "amdgpu_object.h"
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_hw.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
@@ -325,6 +326,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
 
+	isp_debugfs_create(isp_dev);
+
 	return 0;
 
 err_unreg_video_dev_notifier:
@@ -342,6 +345,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
 {
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
 
+	isp_debugfs_remove(isp_dev);
+
 	v4l2_async_nf_unregister(&isp_dev->notifier);
 	v4l2_async_nf_cleanup(&isp_dev->notifier);
 	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
new file mode 100644
index 000000000000..0b8b1ad87525
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
+		char temp_ch;
+		char *str;
+		char *end;
+		char *line_end;
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
+	struct isp4if_img_buf_info *orig;
+	struct isp4fw_buffer_meta_info *p;
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
index d46d7487a994..2a57707925cf 100644
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
@@ -501,7 +505,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
 			rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
 			wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 			dev_err(dev,
-				"failed to get free cmdq slot, stream (%d)\n",
+				"failed to get free cmdq slot, stream %s(%d)\n",
+				isp4dbg_get_if_stream_str(stream),
 				stream);
 			return -ETIMEDOUT;
 		}
@@ -553,8 +558,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
 
 	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 	if (ret) {
-		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n",
-			cmd_id);
+		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
+			isp4dbg_get_cmd_str(cmd_id), cmd_id);
 		if (cmd_ele) {
 			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num,
 						cmd_ele->cmd_id);
@@ -783,13 +788,15 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
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
@@ -804,7 +811,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -832,7 +840,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -855,7 +864,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -872,9 +882,10 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
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
index 816fa3a127f5..11210b13cd02 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -7,6 +7,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw.h"
 #include "isp4_interface.h"
@@ -304,7 +305,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
+	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
+		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
+		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
 		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
 		cmd_ch_prop.image_prop.luma_pitch,
 		cmd_ch_prop.image_prop.chroma_pitch);
@@ -327,6 +330,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return ret;
 	}
 
+	dev_dbg(dev, "enable channel %s\n",
+		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
+
 	if (!sensor_info->start_stream_cmd_sent) {
 		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
 					    out_prop->height);
@@ -489,8 +495,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
 	struct device *dev = isp_subdev->dev;
 
-	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
 		stream_id,
+		isp4dbg_get_cmd_str(para->cmd_id),
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
@@ -551,8 +558,9 @@ isp4sd_preview_done(struct isp4_subdev *isp_subdev,
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
@@ -612,14 +620,18 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
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
 
@@ -640,6 +652,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
 		return;
 
+	isp_fw_log_print(isp_subdev);
+
 	while (true) {
 		s32 ret;
 
@@ -657,7 +671,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
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


