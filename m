Return-Path: <linux-media+bounces-34304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA85AD12B9
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D59787A4F42
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE8724DFF3;
	Sun,  8 Jun 2025 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kEuokvlB"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB042505D6;
	Sun,  8 Jun 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394192; cv=fail; b=Z78eXJjj9lAv3G9RKivOS5LT/sTDG1MRrPcuHwf/DpS/Teznv05d02ORLbjXonXvO5I5MMEOUQJDMqycAk05SCvV6t4uqHafborZ7NX4pIxk1Ymd3b4yYWDmYkUN+VozvHqdHiXeRr9Ep9Qqk941zxuKGEo7uPGn11lwR/dYIPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394192; c=relaxed/simple;
	bh=mVRTlzqEUpuugglkzpjJadUFmzALq2pcv9PAufCBHsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+Sa/7nVed0QKHH5UN8YL6v3vAVW4s8kjo9Ueb8wNKiLv351vRtXjntlZl/bnAMOgZgm0Fkcnw6n9dOF0c4wt9JPmkrUO6FVX8fqiMCoV3RLyck/n1uRL6Z1WXuK8ASgX2wI/27ad1Yo/wCeuESOfIumIZBfQh7dTKQtMRvDW/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kEuokvlB; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSHkqSmkAy5kAXEqbucuD+V8vvxpHMD3bLMDfzGqshnlDlcsjMPW0As9wHZHkgfVytHuPYoKcgRa+pTa6+DeYAbzXGdownMvew9LQCr03boXuvWXqPAlTZd9qM5SxsTgdhEVsul1pbr87OpdqsYHwrEPxDkwfr9ETnwHVBJu1PBSOWdf9PcUmKA7jLxLLLSb7CngYrXsCxhOwihAqOO6qL5DFs2XLvyqOm1Mw3aMNR0IezM9vR7iqRTh4GvyqR93nmVoNuAvw9L+nhOy+H/gD9zFHd/koo4KgtUnov+Uw4zHz5t+Ptd21qvLYZ2V3i+9nxZz9G2+Tel8iu5fCJ36rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmy3fqO7OQkS3zvOlXrMcR5qIuQmokx9Te+0WsCmeKM=;
 b=BV/wlE5IDHTUZ1PskJ7qyaUYDpf4BVNHWOp+Z0h3xUfc0IA5qZ5dvDXd6JpLEeOnXFd8O4tGvEaVN2O/jSZOTli067/43aJddE+JWwxf5PSyEJJ9YmeRaWDRewsFqbw6GsGtD6xG8RF+yFkTAhzz+A5bNZLAEphS4uQ+7/rnW+qbvqfitS+wlsbiZmVzoRNdWBqfl5xSggDA/JfQxZbxozXD5mIlfHKbBNE8J92yVrUhm0dgYuNChNo/9v3lwaZFdK4itVc6iv5x+dwxIv1f6sgk2ngC6Es0Urbkbb+qzzt+fJOGVe9CiPqJcA6tm3SpkKCEXZNnx+0kVFMdzmZeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmy3fqO7OQkS3zvOlXrMcR5qIuQmokx9Te+0WsCmeKM=;
 b=kEuokvlB4g4iLk5mYu+z/MH1mq72jFLwyWVBBJjQNXRqnKc2pyDpeurx3FMHwo2wEB98d/vhykdKEMsk1gNyuAzOlpo4RUtmojggrm5FCy/CzaqVSoM+2lTk3N6oXjuM3QFrlnGqD0q5n9zwFbn2nvC1EQd62b6NzMKpINsW1TI=
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Sun, 8 Jun
 2025 14:49:46 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::a5) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Sun, 8
 Jun 2025 14:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:49:45 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:49:41 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 2/9] media: platform: amd: low level support for isp4 firmware
Date: Sun, 8 Jun 2025 22:49:09 +0800
Message-ID: <20250608144916.222835-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a8ab80-71e1-4e4f-64ab-08dda69bb5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+y9qMWBDcgEZ0AurDluY8qQeN1wdD32/Hg022efTJ9ec7P8RjN6nSihMRoRj?=
 =?us-ascii?Q?Oof/JMQwiZPzRQDeoWCV8Fi7pWk8UrXiMOLMAzM3Tw6KxBbcnaxU3Jz3za69?=
 =?us-ascii?Q?LD3HsCm7V0mSev1mhlVdklRfRMRwOHH+q7w8XwT5coOXRBmmHV2gpGwPV1Sz?=
 =?us-ascii?Q?Uj/9Xz5fUqYw/LTqVieqzIKCU+hw9OVLlB/XY4tAXVCFu7ETlUyO3xpvIS/j?=
 =?us-ascii?Q?DKdDQPXvFrNDieI4/p9+0Wm5j/inDnAsszNaveySHjqBccE/aBvBsVHHSInq?=
 =?us-ascii?Q?4QR/SGwNn0Pn7Nj1ZuRzHgLRaE5We9fUn7oBmw966PHftK6ac6EXn+eQ5lmd?=
 =?us-ascii?Q?ZEMK0gfveJxD6ViYG5gDoR2Z6EXTBmbagz3akTgIlDIdGaqbXUK6Y+Kzjd2a?=
 =?us-ascii?Q?UeThzNtCeOSlPA7YV7lgH25+5ZD3Ggmz/Mj2NgEb0lBNT5ZYIIK0XhtCVvdd?=
 =?us-ascii?Q?y+m+y2Dy4V3suHAtVDSrUKKCCNKmvufjV4VHRBALlG+owEvhiTnoF2kEF2Wn?=
 =?us-ascii?Q?DQES/Uh35HJYVUIpaDQBWYWpUNKgzsjItWLw7YewcV7j/qXEKOB99OByDrHw?=
 =?us-ascii?Q?hKrJOrllCCPNnL+JQQXhjxLsA5BRrzPTFKNoTaRZp0zfULcZOGM5rQgoJRYh?=
 =?us-ascii?Q?ItVF2fXphM7wRYl2EBf+dvjhfy29YLpoQRggmUzHfOySFi6qRU/JS3PF1gh3?=
 =?us-ascii?Q?/jFz0G9Ngi6txs4PLk4BytK5uSrZDP87cUWDI+FvIFPiFCMxn4wRnkITvruT?=
 =?us-ascii?Q?EY1z4eAEGM7v5iqwIx4g3lYbf46Vm3eu5vL7Bb8M3yiuo1DvR9hzOAeloySX?=
 =?us-ascii?Q?9KQe8NuDPeZcxRaUZbY/8IUzJFF34VVM1J9kuB1/C0FnHSxTzKqBrxUSXQ/L?=
 =?us-ascii?Q?dVnrTFsFOEnpuszLtkjXoxUrVI5ECtpvbO/rOgoG2c1LeSE0rmSiAtyyd26S?=
 =?us-ascii?Q?iBvp2SdzLykhh91mKzq/2zsVQMxfkN3LctHXZAfkTY9E/08RJgCn+PEK7OeG?=
 =?us-ascii?Q?PKbcsd81e95NFNinsTdI+HX3RZCPGcjYDnB6aviNMW1Ei8A7L1QG6OYIIs40?=
 =?us-ascii?Q?ZHdPcxBd49uYkcTcQexr+HLeM6udyEFALcRsXE1nWdHA+4ArOd9Y49Hdz83Q?=
 =?us-ascii?Q?gbFY0Nitmal6v+bkO5+B/Mw3iVtTqQ+1R9wCYPQH8kozSAHKz4/GK4rcI7k2?=
 =?us-ascii?Q?Y1pBtyc7dEqQfaTq3D0PXeAsFdfhgeOL7TJCo7WX3xIz9Pr3h1qRYMXM3Cm3?=
 =?us-ascii?Q?GjOGLf2Mhj+qZhao2ZX6m+NfxF6TOcWL66SgNENU3XMrzf9N7pu5N34Eg76m?=
 =?us-ascii?Q?gb5bAqa+sZz+scQiMPGj0id5M2jg9JSfQm4mr2APgVoYPqyeDEAbLACX9oAS?=
 =?us-ascii?Q?XrRSQptbIuwtGZjZ9a4HWqVqRC9xGPKidaZ3yugbUD4rucY7wTJA9ZYJ+wrn?=
 =?us-ascii?Q?n4wHceBduf4CBYM9n2yd3UA9IkYaEj6za3ze1htVc/ZOFCgoQfg67d6e6Enz?=
 =?us-ascii?Q?N7t8t6z9nLyFr+F3KB5doCjuHSGHw21kyiZ6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:49:45.5813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a8ab80-71e1-4e4f-64ab-08dda69bb5d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

Low level functions for access the registers and mapping to their ranges.
This change also includes register definitions for ring buffer used to
communicate with ISP Firmware.
Ring buffer is the communication interface between driver and ISP Firmware.
Command and responses are exchanged through the ring buffer.

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Change-Id: Ic06d5387ade72c57f6efc6b699ceaa6aa91804ec
---
 drivers/media/platform/amd/isp4/Makefile      |   3 +-
 drivers/media/platform/amd/isp4/isp4_hw.c     |  46 +++++++
 drivers/media/platform/amd/isp4/isp4_hw.h     |  14 +++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h | 116 ++++++++++++++++++
 4 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h

diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index f2ac9b2a95f0..4ef8be329d56 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -3,7 +3,8 @@
 # Copyright (C) 2025 Advanced Micro Devices, Inc.
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
-amd_capture-objs := isp4.o
+amd_capture-objs := isp4.o	\
+			isp4_hw.o	\
 
 ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
 ccflags-y += -I$(srctree)/include
diff --git a/drivers/media/platform/amd/isp4/isp4_hw.c b/drivers/media/platform/amd/isp4/isp4_hw.c
new file mode 100644
index 000000000000..e5315330a514
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include "isp4_hw.h"
+#include "isp4_hw_reg.h"
+
+#define RMMIO_SIZE 524288
+
+u32 isp4hw_rreg(void __iomem *base, u32 reg)
+{
+	void __iomem *reg_addr;
+
+	if (reg >= RMMIO_SIZE)
+		return RREG_FAILED_VAL;
+
+	if (reg < ISP_MIPI_PHY0_REG0)
+		reg_addr = base + reg;
+	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
+		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
+	else
+		return RREG_FAILED_VAL;
+
+	return readl(reg_addr);
+};
+
+void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
+{
+	void __iomem *reg_addr;
+
+	if (reg >= RMMIO_SIZE)
+		return;
+
+	if (reg < ISP_MIPI_PHY0_REG0)
+		reg_addr = base + reg;
+	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
+		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
+	else
+		return;
+
+	writel(val, reg_addr);
+};
diff --git a/drivers/media/platform/amd/isp4/isp4_hw.h b/drivers/media/platform/amd/isp4/isp4_hw.h
new file mode 100644
index 000000000000..072d135b9e3a
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_HW_H_
+#define _ISP4_HW_H_
+
+#define RREG_FAILED_VAL 0xFFFFFFFF
+
+u32 isp4hw_rreg(void __iomem *base, u32 reg);
+void isp4hw_wreg(void __iomem *base, u32 reg, u32 val);
+
+#endif
diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
new file mode 100644
index 000000000000..b11f12ba6c56
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_HW_REG_H_
+#define _ISP4_HW_REG_H_
+
+#define ISP_SOFT_RESET		0x62000
+#define ISP_SYS_INT0_EN		0x62010
+#define ISP_SYS_INT0_STATUS	0x62014
+#define ISP_SYS_INT0_ACK	0x62018
+#define ISP_CCPU_CNTL		0x62054
+#define ISP_STATUS		0x62058
+#define ISP_LOG_RB_BASE_LO0	0x62148
+#define ISP_LOG_RB_BASE_HI0	0x6214C
+#define ISP_LOG_RB_SIZE0	0x62150
+#define ISP_LOG_RB_RPTR0	0x62154
+#define ISP_LOG_RB_WPTR0	0x62158
+#define ISP_RB_BASE_LO1		0x62170
+#define ISP_RB_BASE_HI1		0x62174
+#define ISP_RB_SIZE1		0x62178
+#define ISP_RB_RPTR1		0x6217C
+#define ISP_RB_WPTR1		0x62180
+#define ISP_RB_BASE_LO2		0x62184
+#define ISP_RB_BASE_HI2		0x62188
+#define ISP_RB_SIZE2		0x6218C
+#define ISP_RB_RPTR2		0x62190
+#define ISP_RB_WPTR2		0x62194
+#define ISP_RB_BASE_LO3		0x62198
+#define ISP_RB_BASE_HI3		0x6219C
+#define ISP_RB_SIZE3		0x621A0
+#define ISP_RB_RPTR3		0x621A4
+#define ISP_RB_WPTR3		0x621A8
+#define ISP_RB_BASE_LO4		0x621AC
+#define ISP_RB_BASE_HI4		0x621B0
+#define ISP_RB_SIZE4		0x621B4
+#define ISP_RB_RPTR4		0x621B8
+#define ISP_RB_WPTR4		0x621BC
+#define ISP_RB_BASE_LO5		0x621C0
+#define ISP_RB_BASE_HI5		0x621C4
+#define ISP_RB_SIZE5		0x621C8
+#define ISP_RB_RPTR5		0x621CC
+#define ISP_RB_WPTR5		0x621D0
+#define ISP_RB_BASE_LO6		0x621D4
+#define ISP_RB_BASE_HI6		0x621D8
+#define ISP_RB_SIZE6		0x621DC
+#define ISP_RB_RPTR6		0x621E0
+#define ISP_RB_WPTR6		0x621E4
+#define ISP_RB_BASE_LO7		0x621E8
+#define ISP_RB_BASE_HI7		0x621EC
+#define ISP_RB_SIZE7		0x621F0
+#define ISP_RB_RPTR7		0x621F4
+#define ISP_RB_WPTR7		0x621F8
+#define ISP_RB_BASE_LO8		0x621FC
+#define ISP_RB_BASE_HI8		0x62200
+#define ISP_RB_SIZE8		0x62204
+#define ISP_RB_RPTR8		0x62208
+#define ISP_RB_WPTR8		0x6220C
+#define ISP_RB_BASE_LO9		0x62210
+#define ISP_RB_BASE_HI9		0x62214
+#define ISP_RB_SIZE9		0x62218
+#define ISP_RB_RPTR9		0x6221C
+#define ISP_RB_WPTR9		0x62220
+#define ISP_RB_BASE_LO10	0x62224
+#define ISP_RB_BASE_HI10	0x62228
+#define ISP_RB_SIZE10		0x6222C
+#define ISP_RB_RPTR10		0x62230
+#define ISP_RB_WPTR10		0x62234
+#define ISP_RB_BASE_LO11	0x62238
+#define ISP_RB_BASE_HI11	0x6223C
+#define ISP_RB_SIZE11		0x62240
+#define ISP_RB_RPTR11		0x62244
+#define ISP_RB_WPTR11		0x62248
+#define ISP_RB_BASE_LO12	0x6224C
+#define ISP_RB_BASE_HI12	0x62250
+#define ISP_RB_SIZE12		0x62254
+#define ISP_RB_RPTR12		0x62258
+#define ISP_RB_WPTR12		0x6225C
+
+#define ISP_POWER_STATUS	0x60000
+
+#define ISP_MIPI_PHY0_REG0	0x66700
+#define ISP_MIPI_PHY1_REG0	0x66780
+#define ISP_MIPI_PHY2_REG0	0x67400
+
+#define ISP_MIPI_PHY0_SIZE	0xD30
+
+/* ISP_SOFT_RESET */
+#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
+
+/* ISP_CCPU_CNTL */
+#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
+
+/* ISP_STATUS */
+#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
+
+/* ISP_SYS_INT0_STATUS */
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
+
+/* ISP_SYS_INT0_EN */
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
+
+/* ISP_SYS_INT0_ACK */
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
+
+#endif
-- 
2.34.1


