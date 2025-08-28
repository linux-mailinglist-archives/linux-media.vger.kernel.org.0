Return-Path: <linux-media+bounces-41235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD17B39921
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 12:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 666521C26E3D
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D759B308F23;
	Thu, 28 Aug 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5aMD2zmJ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E443081D7;
	Thu, 28 Aug 2025 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756375742; cv=fail; b=jhjcEYeSx9YFv1uvRVWFx/w9aS0ANKaDLLMvby6XIqoCsw2B+ODNaAbr3MHGNV4kxjXU/QYx39aSQKPycIbKgaZmWmAxNbP/O1YZmkVIjU6/GdwSK3pO3aPItSw1IeEUnU5JvZWpIoJOWGUx8L7+HweA15A0gzo22SUJ2X2ZSMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756375742; c=relaxed/simple;
	bh=EIZ0+BdKHyTWwo2Jm9H6lDJ7Ws/nyu3WezLzNk3DY+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHk8hsKUXg3TCbCB564epqjhivE6qu3pd/508QYGOl/51sBZTkhGLPstylzgQXlYuR32V5uV5Ci4Cf3uSj0BQIbAwXdLx5lExEB2u4OvC+7eg45cEZvQZR2r7PMEt9+L3CuiXmenl/dga9a30Ld72M7Q44Xo9xnMMJ7U6wJXShA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5aMD2zmJ; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNMcl00eKOqTXTMs3bg5qDcHpA9pmPGnCN9AcJ7gRzr5eFxPX79NUmLsKquKAbK8ipsnSmPaUHXkrYgczQXKO2aFtRE8OF02aUwAJxbZUOFcDQzBInHxqTUQDL0inZBDHuP4DxpU28l4aYRGyPv3znn3IS4ODn73yBgIkm9oECc59ewAGtsXobIimAGTMvRop0YqgPWU71z7cKPa8P4//RdoXxy3zCCUipuvZUJAEFtax0mUMIpXrRZoQGiK+7TaOUJckLEVBmXqT4wiLbHxKmaRHnYPgye7Z0aMpijf9bocFzQQ5+yyyXRPgK3ZlNgiSRuOD6x0ShnHlwkHJq9StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG9WjvZ3OuP3AO4LRTf7jLqi2zvJNwFG+RW+pG6WW9w=;
 b=EC4tQhg8DpEv1MiMmAsZB59BKqc9qwUr0y4vvS2c3BAT4vh7kp/wST40Q+GCMtb+fVAyxECwo1PWk28PxGFPFusu2oGTncjecv5M51oAj7e45hopkoaqvQaiFlj6ZfaMTNZKR5PMIinpY7A6TJt/35Y2YwfQRwqtEeaVbC5s11Lm94f+cvOqLamKAJ9AgJq0ZuqGMk36LCbc13sSbYw2vgyZjDSdAxOzcjgxhZzXwVIFnGsr5V1PrODNNFaE4XBEAMF/W4PkoPLFWMdv3GcNLn9EVdlbJWrH1DRsQb3QaOxT1mgozcsAO5Cf3aI7Ka81Jiazdx/VzaZJkBkeeHthVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG9WjvZ3OuP3AO4LRTf7jLqi2zvJNwFG+RW+pG6WW9w=;
 b=5aMD2zmJ1iHWjUEeReM9uorFapfxhhb+qFfD5DSfYB68Z96+9tZDmptVWwWOqzzIcoCTqyUQBdyprAR5meIdE3CJ8QecMdEnHvDTBekU4A5QGlmvp6dJUeHArjiR9VU0g480yP6xLrV4a/+BfruAoc6Ib3b+RsDr0awlHMOo+pY=
Received: from CH0PR03CA0061.namprd03.prod.outlook.com (2603:10b6:610:cc::6)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 10:08:52 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::cc) by CH0PR03CA0061.outlook.office365.com
 (2603:10b6:610:cc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 10:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:08:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:08:49 -0500
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 03:08:45 -0700
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
Subject: [PATCH v3 2/7] media: platform: amd: low level support for isp4 firmware
Date: Thu, 28 Aug 2025 18:08:06 +0800
Message-ID: <20250828100811.95722-2-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 896ada8c-abc0-4c68-6f1a-08dde61ae37e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2V4Vn4fsmptYSPYPziv9B/2g82FTYXBpPhCflBZm/Mdg76GxBkAjS641Gu0B?=
 =?us-ascii?Q?iMdliWj/Ow2BRiB1yjrJckwS5+sRWchCPwmPEx6/TdUmtFpC5oP8lQ50Y1Um?=
 =?us-ascii?Q?LDeqSIyAQHTw0Z13z479yirqrIaHRIyOxLBdwNXEGtv0xXkWFPb+oz8GlEJK?=
 =?us-ascii?Q?1Mo0vHxPcYd78qqTior9CoQqa0X2UrO8eVg7NuDbvS/bx15YQb4+tQ8xFchF?=
 =?us-ascii?Q?OcIn6QQDz1SZLg1VKXB0mznnq9Rzb4iRSzZOpPhd+wWfQ0jPTeyJPpe7fXN2?=
 =?us-ascii?Q?pG9cRhbqEsQaVPxHVMm8WDaGixzLXelmaSpLNosp2vmMaKkcntLNajiscAjm?=
 =?us-ascii?Q?/QZqCIWEdBlg8dvLlJk9v4WfTxAmDbeXxbNG3jBWJVhd+GVud9XD6nBP90pi?=
 =?us-ascii?Q?L15pYMoToMKqrmy0reb7Jj4e0Cr2eMzKUCCkeauUHu4odXRqxzl9qqAU1oHA?=
 =?us-ascii?Q?VFIo+OgCVsKquHvwqh/KOPG3JBPwRv4s1JF4APOlSSVIxGWS+EcYykZMz7NE?=
 =?us-ascii?Q?4f8rGjrovspXCG/u6Nuoow/4njKVX5LtrM41Sfe35utsm+CFzlo9acVb3V/q?=
 =?us-ascii?Q?tjbSvUKU4AN48WNXiLXyKRLQ96A4LVIkuu3bI2z0wZrC9ITqi07TQDyIWIkk?=
 =?us-ascii?Q?P2KxHdGqIyonmoZpwFVzqTwuIN5eOF+2iAXRp4Cd/DC/YvjnK+OfxRDMctiJ?=
 =?us-ascii?Q?O/lUs7VDxny0Qchcg56E2XSAEimKRihxM99woljeZUyIGrFvR44oyrZ68ioq?=
 =?us-ascii?Q?WrPSpnOhtrjBuaww2fFlrH0tapmJkibOUayd4UbfQKLzy05MzcE4I7csRgc7?=
 =?us-ascii?Q?gkfMIn5qx9xrlYyeTH6yFKZBZV0OdbhPGfpVYoxe3RGTsZAqIgOAJZQIKQ3z?=
 =?us-ascii?Q?LVMUcuk9NH+YRhq2C2QCdQ5G611ysCFpKMgvaW2AZCcvQ7jegUNPcNbU8cJJ?=
 =?us-ascii?Q?O80wiJwHb4C8w8NYFEi1wvVevA1PTToblrP/TCy+thLSCF/nQFrwhvt1+hTz?=
 =?us-ascii?Q?E24K+9AT6AAeObRJZn5AcrBZHoJeKZZPNb+zZ5Xrt7OOa69aWqPoZXPAjcRK?=
 =?us-ascii?Q?MEie5zBXIhKTfHjcMmdDiQc2wdNMM+LTppe8Wi+YzrAHxa9BmJdWlTFYX+90?=
 =?us-ascii?Q?ZlFInK2/wFdCel10OC98I3Ch74Zk7Ti0OVrJzSIemPTaTCUwYd7Mhaaawqr6?=
 =?us-ascii?Q?HqsUX7LgHf/hW21yypIFcHDYl3gDzsaf+zSplvQVI1q0lwN0tmCyoaTzVHrJ?=
 =?us-ascii?Q?vcmlp8yGHe+Bxz5rB0zCzHrxgD+CM429osH2at1957G23vEXy7QMvx+jFvBT?=
 =?us-ascii?Q?DQDtYkSPYMLWNIOQ5cOsed0yCm46LyHFG2ytMO3lcN3BQO0+VMzGH1M50dr9?=
 =?us-ascii?Q?1KQ8CRRZf+rYdbJBngu1pZ/cOtQehhVSaF7ll/T1qtbkXRJin/JFWt4P7SY+?=
 =?us-ascii?Q?YMykXW0kAOyUF0BTg8T0xO2LMnxM/zaG9z7aIdv5hrM+2lduiP6Uf4FNNjfj?=
 =?us-ascii?Q?XiVnHK6xgHaRbToJCES/iGf82w3gvWWot6O6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:08:51.6176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 896ada8c-abc0-4c68-6f1a-08dde61ae37e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

Low level functions for access the registers and mapping to their ranges.
This change also includes register definitions for ring buffer used to
communicate with ISP Firmware. Ring buffer is the communication interface
between driver and ISP Firmware. Command and responses are exchanged
through the ring buffer.

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/amd/isp4/Makefile      |   2 +-
 drivers/media/platform/amd/isp4/isp4_hw_reg.h | 125 ++++++++++++++++++
 3 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ad845f1511b..d4723d0041c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,6 +1145,7 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index de0092dad26f..eb130647fbe2 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -3,4 +3,4 @@
 # Copyright (C) 2025 Advanced Micro Devices, Inc.
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
-amd_capture-objs := isp4.o
+amd_capture-objs := isp4.o	\
diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
new file mode 100644
index 000000000000..16a02a14d985
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_HW_REG_H_
+#define _ISP4_HW_REG_H_
+
+#include <linux/io.h>
+#include <linux/types.h>
+
+#define ISP_SOFT_RESET			0x62000
+#define ISP_SYS_INT0_EN			0x62010
+#define ISP_SYS_INT0_STATUS		0x62014
+#define ISP_SYS_INT0_ACK		0x62018
+#define ISP_CCPU_CNTL			0x62054
+#define ISP_STATUS			0x62058
+#define ISP_LOG_RB_BASE_LO0		0x62148
+#define ISP_LOG_RB_BASE_HI0		0x6214c
+#define ISP_LOG_RB_SIZE0		0x62150
+#define ISP_LOG_RB_RPTR0		0x62154
+#define ISP_LOG_RB_WPTR0		0x62158
+#define ISP_RB_BASE_LO1			0x62170
+#define ISP_RB_BASE_HI1			0x62174
+#define ISP_RB_SIZE1			0x62178
+#define ISP_RB_RPTR1			0x6217c
+#define ISP_RB_WPTR1			0x62180
+#define ISP_RB_BASE_LO2			0x62184
+#define ISP_RB_BASE_HI2			0x62188
+#define ISP_RB_SIZE2			0x6218c
+#define ISP_RB_RPTR2			0x62190
+#define ISP_RB_WPTR2			0x62194
+#define ISP_RB_BASE_LO3			0x62198
+#define ISP_RB_BASE_HI3			0x6219c
+#define ISP_RB_SIZE3			0x621a0
+#define ISP_RB_RPTR3			0x621a4
+#define ISP_RB_WPTR3			0x621a8
+#define ISP_RB_BASE_LO4			0x621ac
+#define ISP_RB_BASE_HI4			0x621b0
+#define ISP_RB_SIZE4			0x621b4
+#define ISP_RB_RPTR4			0x621b8
+#define ISP_RB_WPTR4			0x621bc
+#define ISP_RB_BASE_LO5			0x621c0
+#define ISP_RB_BASE_HI5			0x621c4
+#define ISP_RB_SIZE5			0x621c8
+#define ISP_RB_RPTR5			0x621cc
+#define ISP_RB_WPTR5			0x621d0
+#define ISP_RB_BASE_LO6			0x621d4
+#define ISP_RB_BASE_HI6			0x621d8
+#define ISP_RB_SIZE6			0x621dc
+#define ISP_RB_RPTR6			0x621e0
+#define ISP_RB_WPTR6			0x621e4
+#define ISP_RB_BASE_LO7			0x621e8
+#define ISP_RB_BASE_HI7			0x621ec
+#define ISP_RB_SIZE7			0x621f0
+#define ISP_RB_RPTR7			0x621f4
+#define ISP_RB_WPTR7			0x621f8
+#define ISP_RB_BASE_LO8			0x621fc
+#define ISP_RB_BASE_HI8			0x62200
+#define ISP_RB_SIZE8			0x62204
+#define ISP_RB_RPTR8			0x62208
+#define ISP_RB_WPTR8			0x6220c
+#define ISP_RB_BASE_LO9			0x62210
+#define ISP_RB_BASE_HI9			0x62214
+#define ISP_RB_SIZE9			0x62218
+#define ISP_RB_RPTR9			0x6221c
+#define ISP_RB_WPTR9			0x62220
+#define ISP_RB_BASE_LO10		0x62224
+#define ISP_RB_BASE_HI10		0x62228
+#define ISP_RB_SIZE10			0x6222c
+#define ISP_RB_RPTR10			0x62230
+#define ISP_RB_WPTR10			0x62234
+#define ISP_RB_BASE_LO11		0x62238
+#define ISP_RB_BASE_HI11		0x6223c
+#define ISP_RB_SIZE11			0x62240
+#define ISP_RB_RPTR11			0x62244
+#define ISP_RB_WPTR11			0x62248
+#define ISP_RB_BASE_LO12		0x6224c
+#define ISP_RB_BASE_HI12		0x62250
+#define ISP_RB_SIZE12			0x62254
+#define ISP_RB_RPTR12			0x62258
+#define ISP_RB_WPTR12			0x6225c
+
+#define ISP_POWER_STATUS		0x60000
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
+/* Helper functions for reading isp registers */
+static inline u32 isp4hw_rreg(void __iomem *base, u32 reg)
+{
+	return readl(base + reg);
+}
+
+/* Helper functions for writing isp registers */
+static inline void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
+{
+	return writel(val, base + reg);
+}
+
+#endif
-- 
2.34.1


