Return-Path: <linux-media+bounces-34306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C311AD12BD
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58038188A1B6
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792AF25228E;
	Sun,  8 Jun 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oO4eanEE"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E624E4DD;
	Sun,  8 Jun 2025 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394198; cv=fail; b=XNl3HoF97RIDwuxMlhFHQYgqq4BmnuSw5jZfTRcIHrTPW1l4OAzXBe14d5eWIbD5OTUZPoBgIBG8EFpD7PlyY5l0Y761jQniogGd4jLezThGc8aazd0SQPJlpmasCeUVSiQB4RLCZQljo5gliKW/DXGPnTDNHy7JGbBkp+BMAfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394198; c=relaxed/simple;
	bh=mfzX9me097Thinx6zRzKDi4hIMKBiHtef7enDYW38Ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AH0urKWa0jHxORbJ7gf0n+aFGf3aHOK5dkYjqWFqSgrdW3UUU0bswW0IE/eKaGQ1AG6WLXaHXGDhqd2xOGc/W+2tgSa1bUC5C7Ga1a/qzDTbuzux1ktViyLPuzlLlDIo+RDt5cwuqf7jhERLemzKMrwaCSveJKWDoTUSNXEhLVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oO4eanEE; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtsUuJJKiwaOq80QVP7J4Uf+mv1ieNFHNNN2qseBtjhw1v/U6DBwGanOPcqmGmFfIhZQqDthaKdEizv71HbBGr2SmcYj051pa/ZAlAHpM3SzWqUAEBC3YJoshiAR8wIY9oiWFPerFNtj1Kj8swGeBHoXhiK29BkPIzpR7oaR+Y0vhQ2YSZDWntBr/D1R+2yY9SGAPQhrf+5/4sfFoBiWq//Mo9MqMDV7cFtAdV1jsyYgsuiuoQZFZrA2m1YY/mYNXJa7yiWXvANAFBlsXYJBC8mrSlV+CCGB+0ygD1rzXlhuDv4mdO+aLXldPFSuX5mKShjylf/H1+Vv+WDdzNRzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6JduJbEGc4iNdYiw2YQRYWJC2+L8pOjg+pRFqGZH78=;
 b=lZ7idkRhVtkwUlWrGoQqCIGXMAKFocABtELmU+9R6J6ESgJZjumxptvPzXIpWck+kFUJWWXaDxKiZ/Np00lfaK8RpKdBqnkKz8vQ5HA2MS2Ax8hbbBAdo9gSVZNd3BhBVoiqttHWeI4FE35hqXFeWkkX0WxW3pCjxamTJYw5GnK4thQ7nh9CKZMYxBl4v2HuUX14BFTAljAsJkasSLsdSame5qtQ+LenBktVPs+wn9vAy26AVKXG/SCEUoeHvAGK00g4rhzwNb4aXVWdoP6Cr88rIzGjaN99J04je/jbbFxB067V4jTYGRMMpk49PyIiKfPtFNGC9KR9KrFWDZSGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6JduJbEGc4iNdYiw2YQRYWJC2+L8pOjg+pRFqGZH78=;
 b=oO4eanEEtRlgd0DymGCbIHAugeXTEg37PM9yNWNrD3K/Mop9Y0WQVbGrY0UwKNTbNdZJg4a3ZT130W3/HkmJyVAKZYv40zTopTpLM/KpdpsLPcIyZSZDGC0Sioz7lBTjM4tMKA7W74qALLKjxUg3Cshmnzyymjg+8vio4aIuhIY=
Received: from BY5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:1e0::16)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sun, 8 Jun
 2025 14:49:50 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::5e) by BY5PR03CA0006.outlook.office365.com
 (2603:10b6:a03:1e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Sun,
 8 Jun 2025 14:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:49:50 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:49:45 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 3/9] media: platform: amd: Add helpers to configure isp4 mipi phy
Date: Sun, 8 Jun 2025 22:49:10 +0800
Message-ID: <20250608144916.222835-4-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250608144916.222835-1-Bin.Du@amd.com>
References: <20250608144916.222835-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: d50a78c5-0ba5-4c55-a437-08dda69bb886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZEKd9uwv2YF+gonBMMY4LED+VAGiwdfyO78R3YL4RCq6w5NtOw1ptKOTtHrE?=
 =?us-ascii?Q?gHQyasIN874CaRu8vGURRXyx88XHHT1c6NgJfZOQogWY13G353QLM0uMvclk?=
 =?us-ascii?Q?s8ROOmiDI8A58mwbIeII05HEyfRBWHRVb/t75jVSXmEMN/rkLYpAsWH/NrHx?=
 =?us-ascii?Q?MNH+NHwmwOSFFgIY/hT75rk+DsNxV/c9jsBx/sCDV44xCb+2GQHbe/oyaVfZ?=
 =?us-ascii?Q?2gmHf8FqwmUn2XFrNAxgx8uyLBlnpfYy6c3NxYJzTXBn7as1lSdEXA4oJ5Hs?=
 =?us-ascii?Q?mf3M3GY//OzbknS09Yn0Wc7LVDA/xX+XNqUYgwTMb2ymbauBksJD+moz25hA?=
 =?us-ascii?Q?9fblVDTeLywvgpncIpXc6xtzE8jn4lUJ8Na/GqIGHXA4eqkoBSMxHMSJpixf?=
 =?us-ascii?Q?XnAJgaP5nUlhA8Uf+Bc+8E8s1cc09OCRdh/p+hRlzu+sRtVMxyJyXDJFq1jE?=
 =?us-ascii?Q?XNuEqoSjSuBM6csPKPEA2eWiTv8T670JtjIhdZttfcEXq3HpeivR9c6h2HTi?=
 =?us-ascii?Q?GFBcnmXeT6n+EsBqdxeXz2/i2XkqGjjxvvDrV4VClsI8OKGI7i/mz+1SrXiU?=
 =?us-ascii?Q?cLfMKz/aTrLfvwfXANDt+aQmkZTwUyLVSKF8mWPK4JV1sAww+/nGgbIk0dvd?=
 =?us-ascii?Q?oyRfJuR4RGkUymM+i3xE8uJOI5Eqx8/WmhHMcTwSO1XB99Mz66dC44S3qjAc?=
 =?us-ascii?Q?Pj3H2BjUwMWbp0btf2UiytdEexArWzLYhl1hfvHvfYnhsnjYvJUyr5MOc6ps?=
 =?us-ascii?Q?0iy7iTjSQcv6OB3YvS8wj0RIZ2RzO4mAbCt9QxN0y850StVh0kkFWLrKxqfo?=
 =?us-ascii?Q?D0pavw6hNORMTzS3faOTiz71gXDB0IiRP1nCmdFK0leNJ4ciCKtoGz3KxgYj?=
 =?us-ascii?Q?jGj3djR2SKk0C4xUst8DN+TKz17Sw24cJTvDc+KLUU50+bOwcxYl5wErHm/0?=
 =?us-ascii?Q?qRcDfkpXkE75nEZRWWuJHeDIWUDOO+/kKDjFYB1imViqldv890ng+oGKCHlp?=
 =?us-ascii?Q?aJio7CyEBRv+hJbZ3Dn6NBE7vvqOn1GCnZsG1TdhKZcGbwLn9mDcJoAs00/X?=
 =?us-ascii?Q?ObNtHp2Bq46hGt1yrzcq4Bpbv4bJKoCOWjPnTEfX3Jj8AsKpEXHWeJ430HDJ?=
 =?us-ascii?Q?bGzhBtwpH4iwPUxgD5fr995jXmi/HpuUppLrZXNDDKewp+1RMTjGfQEYJgXJ?=
 =?us-ascii?Q?K+fendEzGVygjXnZFqUuLu3Ct+JC/lJh/xhJSmAjn+0vyoMDXxLmfeZ0MVXa?=
 =?us-ascii?Q?UakPa52OBm5/mLuaPTlJIT6INlWrKr2S3CgbB7KMTiohBZycCrOwXsxwvYJ+?=
 =?us-ascii?Q?BTCmV3g4zwo68WNnuK4SCJC6E58EmZHYM5H9/VntrBaK4+j1O0lZT/Fjm+lD?=
 =?us-ascii?Q?ECwanhWa45eFAWkHYGmnyhSTzVxNOjP/K5ZihZYqz9Wfj03X9ib8GZdun4ue?=
 =?us-ascii?Q?Jym9FPJ/N8w5tcNJOxXYw7UAtFSmzFhwQ3P8YKNObHgvvNwLdBDi4ZVFuRye?=
 =?us-ascii?Q?AZdurkuPNTm4SU3b0mHzDop+jr4lnDbjXmKF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:49:50.1178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d50a78c5-0ba5-4c55-a437-08dda69bb886
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

The helper functions is for configuring, starting and stop the MIPI PHY.
All configurations related to MIPI PHY configuration and calibration
parameters are encapsulated in two helper functions: start and stop
mipi phy.

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Change-Id: I5376794eb4e4116e1387e4f3607cdf6845f2cda4
---
 drivers/media/platform/amd/isp4/Makefile   |    1 +
 drivers/media/platform/amd/isp4/isp4_phy.c | 1507 ++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_phy.h |   14 +
 3 files changed, 1522 insertions(+)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h

diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 4ef8be329d56..7cb496a56353 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
 amd_capture-objs := isp4.o	\
+			isp4_phy.o \
 			isp4_hw.o	\
 
 ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
diff --git a/drivers/media/platform/amd/isp4/isp4_phy.c b/drivers/media/platform/amd/isp4/isp4_phy.c
new file mode 100644
index 000000000000..1cf2eb58ea3b
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_phy.c
@@ -0,0 +1,1507 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+
+#include "isp4_hw.h"
+#include "isp4_hw_reg.h"
+#include "isp4_phy.h"
+
+#define ISP_MIPI_DPHY	0
+#define T_DCO		5	/* nominal: 200MHz */
+#define TMIN_RX		4
+#define TIMEBASE	5	/* 5us */
+
+#define MIN_T_HS_SETTLE_NS 95
+#define MAX_T_HS_SETTLE_NS 130
+#define MIN_T_HS_SETTLE_UI 4
+#define MAX_T_HS_SETTLE_UI 6
+
+#define PPI_STARTUP_RW_COMMON_DPHY_2		0x0C02
+#define PPI_STARTUP_RW_COMMON_DPHY_6		0x0C06
+#define PPI_STARTUP_RW_COMMON_DPHY_7		0x0C07
+#define PPI_STARTUP_RW_COMMON_DPHY_8		0x0C08
+#define PPI_STARTUP_RW_COMMON_DPHY_10		0x0C10
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2	0x1CF2
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0	0x1CF0
+#define PPI_STARTUP_RW_COMMON_STARTUP_1_1	0x0C11
+#define PPI_CALIBCTRL_RW_COMMON_BG_0		0x0C26
+#define PPI_RW_LPDCOCAL_NREF			0x0E02
+#define PPI_RW_LPDCOCAL_NREF_RANGE		0x0E03
+#define PPI_RW_LPDCOCAL_TWAIT_CONFIG		0x0E05
+#define PPI_RW_LPDCOCAL_VT_CONFIG		0x0E06
+#define PPI_RW_LPDCOCAL_COARSE_CFG		0x0E08
+#define PPI_RW_COMMON_CFG			0x0E36
+#define PPI_RW_TERMCAL_CFG_0			0x0E40
+#define PPI_RW_OFFSETCAL_CFG_0			0x0E50
+#define PPI_RW_LPDCOCAL_TIMEBASE		0x0E01
+#define CORE_AFE_CTRL_2_0			0x1C20
+#define CORE_AFE_CTRL_2_1			0x1C21
+#define CORE_AFE_CTRL_2_3			0x1C23
+#define CORE_AFE_CTRL_2_5			0x1C25
+#define CORE_AFE_CTRL_2_6			0x1C26
+#define CORE_AFE_CTRL_2_7			0x1C27
+#define CORE_DIG_COMMON_RW_DESKEW_FINE_MEM	0x1FF0
+#define CORE_DIG_DLANE_CLK_RW_CFG_0		0x3800
+#define CORE_DIG_DLANE_0_RW_CFG_0		0x3000
+#define CORE_DIG_DLANE_1_RW_CFG_0		0x3200
+#define CORE_DIG_DLANE_2_RW_CFG_0		0x3400
+#define CORE_DIG_DLANE_3_RW_CFG_0		0x3600
+#define CORE_AFE_LANE0_CTRL_2_9			0x1029
+#define CORE_AFE_LANE1_CTRL_2_9			0x1229
+#define CORE_AFE_LANE2_CTRL_2_9			0x1429
+#define CORE_AFE_LANE3_CTRL_2_9			0x1629
+#define CORE_AFE_LANE4_CTRL_2_9			0x1829
+#define CORE_DIG_RW_COMMON_6			0x1C46
+#define CORE_DIG_RW_COMMON_7			0x1C47
+#define PPI_RW_DDLCAL_CFG_0			0x0E20
+#define PPI_RW_DDLCAL_CFG_1			0x0E21
+#define PPI_RW_DDLCAL_CFG_2			0x0E22
+#define PPI_RW_DDLCAL_CFG_3			0x0E23
+#define PPI_RW_DDLCAL_CFG_4			0x0E24
+#define PPI_RW_DDLCAL_CFG_5			0x0E25
+#define PPI_RW_DDLCAL_CFG_6			0x0E26
+#define PPI_RW_DDLCAL_CFG_7			0x0E27
+#define CORE_AFE_LANE0_CTRL_2_8			0x1028
+#define CORE_AFE_LANE1_CTRL_2_8			0x1228
+#define CORE_AFE_LANE2_CTRL_2_8			0x1428
+#define CORE_AFE_LANE3_CTRL_2_8			0x1628
+#define CORE_AFE_LANE4_CTRL_2_8			0x1828
+#define CORE_DIG_DLANE_0_RW_LP_0		0x3040
+#define CORE_DIG_DLANE_1_RW_LP_0		0x3240
+#define CORE_DIG_DLANE_2_RW_LP_0		0x3440
+#define CORE_DIG_DLANE_3_RW_LP_0		0x3640
+#define CORE_AFE_LANE0_CTRL_2_2			0x1022
+#define CORE_AFE_LANE1_CTRL_2_2			0x1222
+#define CORE_AFE_LANE2_CTRL_2_2			0x1422
+#define CORE_AFE_LANE3_CTRL_2_2			0x1622
+#define CORE_AFE_LANE4_CTRL_2_2			0x1822
+#define CORE_AFE_LANE0_CTRL_2_12		0x102C
+#define CORE_AFE_LANE1_CTRL_2_12		0x122C
+#define CORE_AFE_LANE2_CTRL_2_12		0x142C
+#define CORE_AFE_LANE3_CTRL_2_12		0x162C
+#define CORE_AFE_LANE4_CTRL_2_12		0x182C
+#define CORE_AFE_LANE0_CTRL_2_13		0x102D
+#define CORE_AFE_LANE1_CTRL_2_13		0x122D
+#define CORE_AFE_LANE2_CTRL_2_13		0x142D
+#define CORE_AFE_LANE3_CTRL_2_13		0x162D
+#define CORE_AFE_LANE4_CTRL_2_13		0x182D
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_0		0x3880
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_7		0x3887
+#define CORE_DIG_DLANE_0_RW_HS_RX_0		0x3080
+#define CORE_DIG_DLANE_1_RW_HS_RX_0		0x3280
+#define CORE_DIG_DLANE_2_RW_HS_RX_0		0x3480
+#define CORE_DIG_DLANE_3_RW_HS_RX_0		0x3680
+#define CORE_DIG_DLANE_0_RW_CFG_1		0x3001
+#define CORE_DIG_DLANE_1_RW_CFG_1		0x3201
+#define CORE_DIG_DLANE_2_RW_CFG_1		0x3401
+#define CORE_DIG_DLANE_3_RW_CFG_1		0x3601
+#define CORE_DIG_DLANE_0_RW_HS_RX_2		0x3082
+#define CORE_DIG_DLANE_1_RW_HS_RX_2		0x3282
+#define CORE_DIG_DLANE_2_RW_HS_RX_2		0x3482
+#define CORE_DIG_DLANE_3_RW_HS_RX_2		0x3682
+#define CORE_DIG_DLANE_0_RW_LP_2		0x3042
+#define CORE_DIG_DLANE_1_RW_LP_2		0x3242
+#define CORE_DIG_DLANE_2_RW_LP_2		0x3442
+#define CORE_DIG_DLANE_3_RW_LP_2		0x3642
+#define CORE_DIG_DLANE_CLK_RW_LP_0		0x3840
+#define CORE_DIG_DLANE_CLK_RW_LP_2		0x3842
+#define CORE_DIG_DLANE_0_RW_HS_RX_1		0x3081
+#define CORE_DIG_DLANE_1_RW_HS_RX_1		0x3281
+#define CORE_DIG_DLANE_2_RW_HS_RX_1		0x3481
+#define CORE_DIG_DLANE_3_RW_HS_RX_1		0x3681
+#define CORE_DIG_DLANE_0_RW_HS_RX_3		0x3083
+#define CORE_DIG_DLANE_1_RW_HS_RX_3		0x3283
+#define CORE_DIG_DLANE_2_RW_HS_RX_3		0x3483
+#define CORE_DIG_DLANE_3_RW_HS_RX_3		0x3683
+#define CORE_DIG_DLANE_0_RW_HS_RX_4		0x3084
+#define CORE_DIG_DLANE_1_RW_HS_RX_4		0x3284
+#define CORE_DIG_DLANE_2_RW_HS_RX_4		0x3484
+#define CORE_DIG_DLANE_3_RW_HS_RX_4		0x3684
+#define CORE_DIG_DLANE_0_RW_HS_RX_5		0x3085
+#define CORE_DIG_DLANE_1_RW_HS_RX_5		0x3285
+#define CORE_DIG_DLANE_2_RW_HS_RX_5		0x3485
+#define CORE_DIG_DLANE_3_RW_HS_RX_5		0x3685
+#define CORE_DIG_DLANE_0_RW_HS_RX_6		0x3086
+#define CORE_DIG_DLANE_1_RW_HS_RX_6		0x3286
+#define CORE_DIG_DLANE_2_RW_HS_RX_6		0x3486
+#define CORE_DIG_DLANE_3_RW_HS_RX_6		0x3686
+#define CORE_DIG_DLANE_0_RW_HS_RX_7		0x3087
+#define CORE_DIG_DLANE_1_RW_HS_RX_7		0x3287
+#define CORE_DIG_DLANE_2_RW_HS_RX_7		0x3487
+#define CORE_DIG_DLANE_3_RW_HS_RX_7		0x3687
+#define CORE_DIG_DLANE_0_RW_HS_RX_9		0x3089
+#define CORE_DIG_DLANE_1_RW_HS_RX_9		0x3289
+#define CORE_DIG_DLANE_2_RW_HS_RX_9		0x3489
+#define CORE_DIG_DLANE_3_RW_HS_RX_9		0x3689
+#define PPI_R_TERMCAL_DEBUG_0			0x0E41
+
+#define PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK				0x00FF
+#define PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK			0x00FF
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK		0x2000
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK		0x1000
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK		0x00FC
+#define PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK			0x0FFF
+#define PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK			0x00FF
+#define PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK			0x01FF
+#define PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK					0x07FF
+#define PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK			0x001F
+#define PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK			0xFE00
+#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK			0x0001
+#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK			0x0002
+#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK			0x007C
+#define PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK				0x0003
+#define PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK				0x0003
+#define PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK					0x007F
+#define PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK			0x001F
+#define PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK				0x03FF
+#define PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK			0x01FF
+#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_TWAIT_FINE_MASK			0xFF80
+#define CORE_AFE_CTRL_2_0_OA_CB_HSTX_VCOMM_REG_PON_OVR_VAL_MASK			0x0400
+#define CORE_AFE_CTRL_2_1_OA_CB_HSTX_VCOMM_REG_PON_OVR_EN_MASK			0x0400
+#define CORE_AFE_CTRL_2_1_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_VAL_MASK			0x8000
+#define CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_EN_MASK			0x0100
+#define CORE_AFE_CTRL_2_0_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_VAL_MASK		0x8000
+#define CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_EN_MASK			0x0200
+#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_EN_OVR_EN_MASK			0x2000
+#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_EN_OVR_VAL_MASK			0x0200
+#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_PON_OVR_EN_MASK			0x1000
+#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_PON_OVR_VAL_MASK			0x0100
+#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_EN_MASK		0x4000
+#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_VAL_MASK		0x0400
+#define CORE_AFE_CTRL_2_5_OA_CB_SEL_45OHM_50OHM_MASK				0x0100
+#define CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
+#define CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
+#define CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
+#define CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
+#define CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
+#define CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
+#define CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
+#define CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
+#define CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
+#define CORE_AFE_LANE0_CTRL_2_9_OA_LANE0_HSRX_SEL_GATED_POLARITY_MASK		0x0100
+#define CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_SEL_GATED_POLARITY_MASK		0x0100
+#define CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_SEL_GATED_POLARITY_MASK		0x0100
+#define CORE_AFE_LANE3_CTRL_2_9_OA_LANE3_HSRX_SEL_GATED_POLARITY_MASK		0x0100
+#define CORE_AFE_LANE4_CTRL_2_9_OA_LANE4_HSRX_SEL_GATED_POLARITY_MASK		0x0100
+#define CORE_DIG_RW_COMMON_7_LANE0_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0003
+#define CORE_DIG_RW_COMMON_7_LANE1_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x000C
+#define CORE_DIG_RW_COMMON_7_LANE2_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0030
+#define CORE_DIG_RW_COMMON_7_LANE3_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x00C0
+#define CORE_DIG_RW_COMMON_7_LANE4_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0300
+#define PPI_STARTUP_RW_COMMON_DPHY_8_CPHY_DDL_CAL_ADDR_MASK			0x00FF
+#define PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK			0x00FF
+#define PPI_RW_DDLCAL_CFG_0_DDLCAL_TIMEBASE_TARGET_MASK				0x03FF
+#define PPI_RW_DDLCAL_CFG_7_DDLCAL_DECR_WAIT_MASK				0x1F80
+#define PPI_RW_DDLCAL_CFG_1_DDLCAL_DISABLE_TIME_MASK				0xFF00
+#define PPI_RW_DDLCAL_CFG_2_DDLCAL_WAIT_MASK					0xF000
+#define PPI_RW_DDLCAL_CFG_2_DDLCAL_TUNE_MODE_MASK				0x0C00
+#define PPI_RW_DDLCAL_CFG_2_DDLCAL_DDL_DLL_MASK					0x0100
+#define PPI_RW_DDLCAL_CFG_2_DDLCAL_ENABLE_WAIT_MASK				0x00FF
+#define PPI_RW_DDLCAL_CFG_2_DDLCAL_UPDATE_SETTINGS_MASK				0x0200
+#define PPI_RW_DDLCAL_CFG_4_DDLCAL_STUCK_THRESH_MASK				0x03FF
+#define PPI_RW_DDLCAL_CFG_6_DDLCAL_MAX_DIFF_MASK				0x03FF
+#define PPI_RW_DDLCAL_CFG_7_DDLCAL_START_DELAY_MASK				0x007F
+#define PPI_RW_DDLCAL_CFG_3_DDLCAL_COUNTER_REF_MASK				0x03FF
+#define PPI_RW_DDLCAL_CFG_1_DDLCAL_MAX_PHASE_MASK				0x00FF
+#define PPI_RW_DDLCAL_CFG_5_DDLCAL_DLL_FBK_MASK					0x03F0
+#define PPI_RW_DDLCAL_CFG_5_DDLCAL_DDL_COARSE_BANK_MASK				0x000F
+#define CORE_AFE_LANE0_CTRL_2_8_OA_LANE0_HSRX_CDPHY_SEL_FAST_MASK		0x1000
+#define CORE_AFE_LANE1_CTRL_2_8_OA_LANE1_HSRX_CDPHY_SEL_FAST_MASK		0x1000
+#define CORE_AFE_LANE2_CTRL_2_8_OA_LANE2_HSRX_CDPHY_SEL_FAST_MASK		0x1000
+#define CORE_AFE_LANE3_CTRL_2_8_OA_LANE3_HSRX_CDPHY_SEL_FAST_MASK		0x1000
+#define CORE_AFE_LANE4_CTRL_2_8_OA_LANE4_HSRX_CDPHY_SEL_FAST_MASK		0x1000
+#define CORE_DIG_DLANE_0_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
+#define CORE_DIG_DLANE_1_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
+#define CORE_DIG_DLANE_2_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
+#define CORE_DIG_DLANE_3_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
+#define CORE_AFE_LANE0_CTRL_2_2_OA_LANE0_SEL_LANE_CFG_MASK			0x0001
+#define CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK			0x0001
+#define CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK			0x0001
+#define CORE_AFE_LANE3_CTRL_2_2_OA_LANE3_SEL_LANE_CFG_MASK			0x0001
+#define CORE_AFE_LANE4_CTRL_2_2_OA_LANE4_SEL_LANE_CFG_MASK			0x0001
+#define CORE_DIG_RW_COMMON_6_DESERIALIZER_EN_DEASS_COUNT_THRESH_D_MASK		0x0038
+#define CORE_DIG_RW_COMMON_6_DESERIALIZER_DIV_EN_DELAY_THRESH_D_MASK		0x0007
+#define CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
+#define CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
+#define CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
+#define CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
+#define CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
+#define CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
+#define CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
+#define CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
+#define CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
+#define CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
+#define CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
+#define CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
+#define CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
+#define CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
+#define CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
+#define CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
+#define CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
+#define CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
+#define CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
+#define CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
+#define CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_HS_CLK_DIV_MASK			0x00E0
+#define CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_HS_CLK_DIV_MASK			0x00E0
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_0_HS_RX_0_TCLKSETTLE_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_7_HS_RX_7_TCLKMISS_REG_MASK			0x00FF
+#define CORE_DIG_DLANE_0_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
+#define CORE_DIG_DLANE_1_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
+#define CORE_DIG_DLANE_2_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
+#define CORE_DIG_DLANE_3_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
+#define CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
+#define CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
+#define CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
+#define CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
+#define CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
+#define CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
+#define CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
+#define CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
+#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
+#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
+#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
+#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
+#define CORE_DIG_DLANE_0_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
+#define CORE_DIG_DLANE_1_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
+#define CORE_DIG_DLANE_2_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
+#define CORE_DIG_DLANE_3_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
+#define CORE_DIG_DLANE_0_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
+#define CORE_DIG_DLANE_1_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
+#define CORE_DIG_DLANE_2_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
+#define CORE_DIG_DLANE_3_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
+#define CORE_DIG_DLANE_CLK_RW_LP_0_LP_0_ITMINRX_REG_MASK			0xF000
+#define CORE_DIG_DLANE_CLK_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
+#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK	0x2000
+#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK	0x2000
+#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK	0x2000
+#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK	0x2000
+#define CORE_DIG_DLANE_0_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_1_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_2_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_3_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
+#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
+#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
+#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
+#define CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
+#define CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
+#define CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
+#define CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
+#define CORE_DIG_DLANE_0_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
+#define CORE_DIG_DLANE_1_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
+#define CORE_DIG_DLANE_2_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
+#define CORE_DIG_DLANE_3_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
+#define CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
+#define CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
+#define CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
+#define CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
+#define CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
+#define CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
+#define CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
+#define CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
+#define CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
+#define CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
+#define CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
+#define CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
+#define CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
+#define CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
+#define CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
+#define CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
+#define CORE_DIG_DLANE_0_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_1_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_2_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_3_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
+#define CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
+#define CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
+#define CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
+#define CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
+#define CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
+
+struct isp4phy_mipi_reg_seq {
+	u16 addr;
+	u16 mask;
+	u16 data;
+};
+
+union isp4phy_mipi_0 {
+	struct {
+		u32 shutdownz : 1;
+		u32 rstz : 1;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_1 {
+	struct {
+		u32 mode : 1;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_2 {
+	struct {
+		u32 rxdatawidthhs_0 : 2;
+		u32 rxdatawidthhs_1 : 2;
+		u32 rxdatawidthhs_2 : 2;
+		u32 rxdatawidthhs_3 : 2;
+	} bit;
+	u32 value;
+};
+
+struct isp4phy_mipi_3 {
+	u32 reserved;
+};
+
+union isp4phy_mipi_4 {
+	struct {
+		u32 enableclk : 1;
+		u32 enable_0 : 1;
+		u32 enable_1 : 1;
+		u32 enable_2 : 1;
+		u32 enable_3 : 1;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_5 {
+	struct {
+		u32 forcerxmode_0 : 1;
+		u32 forcerxmode_1 : 1;
+		u32 forcerxmode_2 : 1;
+		u32 forcerxmode_3 : 1;
+		u32 forcerxmode_clk : 1;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_6 {
+	struct {
+		u32 turndisable_0 : 1;
+		u32 turndisable_1 : 1;
+		u32 turndisable_2 : 1;
+		u32 turndisable_3 : 1;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_7 {
+	struct {
+		u32 ready : 1;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_ind_idx {
+	struct {
+		u32 addr : 16;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_ind_data {
+	struct {
+		u32 data : 16;
+	} bit;
+	u32 value;
+};
+
+union isp4phy_mipi_ind_wack {
+	struct {
+		u32 ack : 1;
+		u32 pslverr : 1;
+	} bit;
+	u32 value;
+};
+
+struct isp4phy_mipi_reg {
+	union isp4phy_mipi_0 isp_mipi_phy0;
+	union isp4phy_mipi_1 isp_mipi_phy1;
+	union isp4phy_mipi_2 isp_mipi_phy2;
+	struct isp4phy_mipi_3 isp_mipi_phy3;
+	union isp4phy_mipi_4 isp_mipi_phy4;
+	union isp4phy_mipi_5 isp_mipi_phy5;
+	union isp4phy_mipi_6 isp_mipi_phy6;
+	union isp4phy_mipi_7 isp_mipi_phy7;
+	u32 reserve;
+	union isp4phy_mipi_ind_idx isp_mipi_phy_ind_idx;
+	union isp4phy_mipi_ind_data isp_mipi_phy_ind_data;
+	union isp4phy_mipi_ind_wack isp_mipi_phy_inc_wack;
+};
+
+struct isp4phy_mipi_config {
+	u16 afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg;
+	u16 max_phase;
+	u16 ddlcal_cfg_5ddlcal_dll_fbk_reg;
+	u16 ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg;
+	u16 afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg;
+	u16 afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg;
+	u16 afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg;
+	u16 afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg;
+	u16 cfg_1cfg_1_sot_detection_reg;
+	u16 hs_rx_2hs_rx_2_ignore_alterncal_reg;
+	u16 cfg_1cfg_1_deskew_supported_reg;
+	u16 afe_lanex_ctrl_2_9oa_hs_clk_div_reg;
+	u16 hs_rx_0hs_rx_0_thssettle_reg;
+	u16 hs_rx_3hs_rx_3_fjump_deskew_reg;
+	u16 hs_rx_6hs_rx_6_min_eye_opening_deskew_reg;
+};
+
+enum isp4phy_mipi_id {
+	ISP_MIPI_PHY_ID_0    = 0,
+	ISP_MIPI_PHY_ID_1    = 1,
+	ISP_MIPI_PHY_ID_2    = 2,
+	ISP_MIPI_PHY_ID_MAX
+};
+
+static const struct isp4phy_mipi_reg *isp_mipi_phy_reg[ISP_MIPI_PHY_ID_MAX] = {
+	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY0_REG0,
+	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY1_REG0,
+	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY2_REG0,
+};
+
+static const struct isp4phy_mipi_reg_seq startup_seq_general_common_config[] = {
+	{ PPI_STARTUP_RW_COMMON_DPHY_10, PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK, 0x30 },
+	{ CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK, 0x0 },
+	{ CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK, 0x1 },
+	{ CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK, 0x3F },
+	{ PPI_STARTUP_RW_COMMON_STARTUP_1_1, PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK, 0x233 },
+	{ PPI_STARTUP_RW_COMMON_DPHY_6, PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK, 0x27 },
+	{ PPI_CALIBCTRL_RW_COMMON_BG_0, PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK, 0x1F4 },
+	{ PPI_RW_LPDCOCAL_NREF, PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK, 0x320 },
+	{ PPI_RW_LPDCOCAL_NREF_RANGE, PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK, 0x1B },
+	{ PPI_RW_LPDCOCAL_TWAIT_CONFIG, PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK, 0x7F },
+	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK, 0x1B },
+	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK, 0x1 },
+	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK, 0x0 },
+	{ PPI_RW_LPDCOCAL_COARSE_CFG, PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK, 0x1 },
+	{ PPI_RW_COMMON_CFG, PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK, 0x3 },
+};
+
+static const struct isp4phy_mipi_reg_seq startup_seq_common[] = {
+	{ PPI_STARTUP_RW_COMMON_DPHY_2, PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK, 0x5 },
+	{ PPI_RW_TERMCAL_CFG_0, PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK, 0x17 },
+	{ PPI_RW_OFFSETCAL_CFG_0, PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK, 0x4 },
+	{ PPI_RW_LPDCOCAL_TIMEBASE, PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK, 0x5F },
+	{ PPI_RW_LPDCOCAL_TWAIT_CONFIG, PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK, 0x1D },
+	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_TWAIT_FINE_MASK, 0x1D },
+	{ CORE_AFE_CTRL_2_0, CORE_AFE_CTRL_2_0_OA_CB_HSTX_VCOMM_REG_PON_OVR_VAL_MASK, 0x0 },
+	{ CORE_AFE_CTRL_2_1, CORE_AFE_CTRL_2_1_OA_CB_HSTX_VCOMM_REG_PON_OVR_EN_MASK, 0x1 },
+	{ CORE_AFE_CTRL_2_1, CORE_AFE_CTRL_2_1_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_VAL_MASK, 0x0 },
+	{ CORE_AFE_CTRL_2_3, CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_EN_MASK, 0x1 },
+	{ CORE_AFE_CTRL_2_0, CORE_AFE_CTRL_2_0_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_VAL_MASK, 0x0 },
+	{ CORE_AFE_CTRL_2_3, CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_EN_MASK, 0x1 },
+	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_EN_OVR_EN_MASK, 0x1 },
+	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_EN_OVR_VAL_MASK, 0x0 },
+	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_PON_OVR_EN_MASK, 0x1 },
+	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_PON_OVR_VAL_MASK, 0x0 },
+	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_EN_MASK, 0x1 },
+	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_VAL_MASK, 0x0 },
+	{ CORE_AFE_CTRL_2_5, CORE_AFE_CTRL_2_5_OA_CB_SEL_45OHM_50OHM_MASK, 0x0 },
+};
+
+static const struct isp4phy_mipi_reg_seq
+	startup_seq_dphy_periodic_deskew_program[] = {
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x404 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x40C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x414 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x41C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x423 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x429 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x430 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x43A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x445 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x44A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x450 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x45A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x465 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x469 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x472 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x47A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x485 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x489 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x490 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x49A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4A4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4AC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4B4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4BC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4C4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4CC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4D4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4DC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4E4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4EC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4F4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4FC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x504 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x50C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x514 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x51C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x523 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x529 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x530 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x53A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x545 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x54A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x550 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x55A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x565 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x569 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x572 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x57A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x585 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x589 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x590 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x59A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5A4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5AC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5B4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5BC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5C4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5CC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5D4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5DC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5E4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5EC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5F4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5FC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x604 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x60C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x614 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x61C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x623 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x629 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x632 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x63A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x645 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x64A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x650 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x65A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x665 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x669 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x672 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x67A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x685 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x689 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x690 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x69A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6A4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6AC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6B4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6BC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6C4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6CC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6D4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6DC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6E4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6EC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6F4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6FC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x704 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x70C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x714 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x71C },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x723 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x72A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x730 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x73A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x745 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x74A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x750 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x75A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x765 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x769 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x772 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x77A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x785 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x789 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x790 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x79A },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7A4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7AC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7B4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7BC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7C4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7CC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7D4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7DC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7E4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7EC },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7F4 },
+	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7FC },
+};
+
+inline u16 isp4phy_rreg(void __iomem *base, u32 phy_id, u16 addr)
+{
+	const struct isp4phy_mipi_reg *reg = isp_mipi_phy_reg[phy_id];
+
+	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_idx), addr);
+	return (u16)isp4hw_rreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_data));
+}
+
+inline void isp4phy_wreg(void __iomem *base, u32 phy_id, u16 addr, u16 data)
+{
+	const struct isp4phy_mipi_reg *reg = isp_mipi_phy_reg[phy_id];
+
+	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_idx), addr);
+	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_data), data);
+}
+
+static void isp4phy_mask_wreg(void __iomem *base, u32 phy_id, u16 addr,
+			      u16 mask, u16 regval)
+{
+	unsigned long _mask = mask;
+	u16 shift = 0;
+	u16 data;
+
+	data = isp4phy_rreg(base, phy_id, addr);
+	if (mask)
+		shift = find_first_bit(&_mask, 16);
+	data = (data & ~mask) | ((regval << shift) & mask);
+
+	isp4phy_wreg(base, phy_id, addr, data);
+}
+
+static void isp4phy_optional_features_dphy(void __iomem *base, u32 phy_id)
+{
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_CFG_0,
+			  CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_CFG_0,
+			  CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_0,
+			  CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_0,
+			  CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_0,
+				  CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_0,
+				  CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_0,
+			  CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_0,
+			  CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_0,
+				  CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_0,
+				  CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_9,
+			  CORE_AFE_LANE0_CTRL_2_9_OA_LANE0_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_9,
+			  CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_9,
+			  CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_9,
+				  CORE_AFE_LANE3_CTRL_2_9_OA_LANE3_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_9,
+				  CORE_AFE_LANE4_CTRL_2_9_OA_LANE4_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
+	}
+}
+
+static void isp4phy_dphy_periodic_deskew_program(void __iomem *base,
+						 u32 phy_id)
+{
+	for (int ctr = 0;
+	     ctr < ARRAY_SIZE(startup_seq_dphy_periodic_deskew_program);
+	     ctr++)
+		isp4phy_wreg(base, phy_id,
+			     startup_seq_dphy_periodic_deskew_program[ctr].addr,
+			     startup_seq_dphy_periodic_deskew_program[ctr].data);
+}
+
+static void isp4phy_dphy_specific(void __iomem *base, u32 phy_id,
+				  u64 data_rate,
+				  struct isp4phy_mipi_config *phycfg)
+{
+	u64 half_rate = data_rate >> 1;
+	u16 ddl_cal;
+
+	ddl_cal = TIMEBASE * half_rate;
+	ddl_cal = (ddl_cal + 31) >> 5;
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
+			  CORE_DIG_RW_COMMON_7_LANE0_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
+			  CORE_DIG_RW_COMMON_7_LANE1_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
+			  CORE_DIG_RW_COMMON_7_LANE2_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
+				  CORE_DIG_RW_COMMON_7_LANE3_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
+				  CORE_DIG_RW_COMMON_7_LANE4_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_8,
+			  PPI_STARTUP_RW_COMMON_DPHY_8_CPHY_DDL_CAL_ADDR_MASK, 0x50);
+
+	if (data_rate < 1500) {
+		isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_7,
+				  PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK, 0x68);
+	} else {
+		/* Digital Delay Line (DDL) tuning calibration */
+		isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_7,
+				  PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK, 0x28);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_0,
+				  PPI_RW_DDLCAL_CFG_0_DDLCAL_TIMEBASE_TARGET_MASK, 0x77); /* LUT->24MHz case */
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_7,
+				  PPI_RW_DDLCAL_CFG_7_DDLCAL_DECR_WAIT_MASK, 0x22);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_1,
+				  PPI_RW_DDLCAL_CFG_1_DDLCAL_DISABLE_TIME_MASK, 0x17); /* LUT->24MHz case */
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
+				  PPI_RW_DDLCAL_CFG_2_DDLCAL_WAIT_MASK, 0x4);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
+				  PPI_RW_DDLCAL_CFG_2_DDLCAL_TUNE_MODE_MASK, 0x2);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
+				  PPI_RW_DDLCAL_CFG_2_DDLCAL_DDL_DLL_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
+				  PPI_RW_DDLCAL_CFG_2_DDLCAL_ENABLE_WAIT_MASK, 0x17); /* LUT->24MHz case */
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
+				  PPI_RW_DDLCAL_CFG_2_DDLCAL_UPDATE_SETTINGS_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_4,
+				  PPI_RW_DDLCAL_CFG_4_DDLCAL_STUCK_THRESH_MASK, 0xA);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_6,
+				  PPI_RW_DDLCAL_CFG_6_DDLCAL_MAX_DIFF_MASK, 0xA);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_7,
+				  PPI_RW_DDLCAL_CFG_7_DDLCAL_START_DELAY_MASK, 0xB); /* LUT->24MHz case */
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_3,
+				  PPI_RW_DDLCAL_CFG_3_DDLCAL_COUNTER_REF_MASK, ddl_cal);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_1,
+				  PPI_RW_DDLCAL_CFG_1_DDLCAL_MAX_PHASE_MASK, phycfg->max_phase);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_5,
+				  PPI_RW_DDLCAL_CFG_5_DDLCAL_DLL_FBK_MASK,
+				  phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg);
+		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_5,
+				  PPI_RW_DDLCAL_CFG_5_DDLCAL_DDL_COARSE_BANK_MASK,
+				  phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_8,
+				  CORE_AFE_LANE0_CTRL_2_8_OA_LANE0_HSRX_CDPHY_SEL_FAST_MASK,
+				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_8,
+				  CORE_AFE_LANE1_CTRL_2_8_OA_LANE1_HSRX_CDPHY_SEL_FAST_MASK,
+				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_8,
+				  CORE_AFE_LANE2_CTRL_2_8_OA_LANE2_HSRX_CDPHY_SEL_FAST_MASK,
+				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
+		if (phy_id <= ISP_MIPI_PHY_ID_1) {
+			isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_8,
+					  CORE_AFE_LANE3_CTRL_2_8_OA_LANE3_HSRX_CDPHY_SEL_FAST_MASK,
+					  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
+			isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_8,
+					  CORE_AFE_LANE4_CTRL_2_8_OA_LANE4_HSRX_CDPHY_SEL_FAST_MASK,
+					  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
+		}
+	}
+
+	/* Write  6 if Tlpx (far end / near end) ratio < 1
+	 * Write  7 if Tlpx (far end / near end) ratio >= 1
+	 */
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0,
+			  CORE_DIG_DLANE_0_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
+	/* Write  6 if Tlpx (far end / near end) ratio < 1
+	 * Write  7 if Tlpx (far end / near end) ratio >= 1
+	 */
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_0,
+			  CORE_DIG_DLANE_1_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		/* Write  6 if Tlpx (far end / near end) ratio < 1
+		 * Write  7 if Tlpx (far end / near end) ratio >= 1
+		 */
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_0,
+				  CORE_DIG_DLANE_2_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
+		/* Write  6 if Tlpx (far end / near end) ratio < 1
+		 * Write  7 if Tlpx (far end / near end) ratio >= 1
+		 */
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_0,
+				  CORE_DIG_DLANE_3_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_2,
+			  CORE_AFE_LANE0_CTRL_2_2_OA_LANE0_SEL_LANE_CFG_MASK, 0x0);
+
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_2,
+				  CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_2,
+				  CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_2,
+				  CORE_AFE_LANE3_CTRL_2_2_OA_LANE3_SEL_LANE_CFG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_2,
+				  CORE_AFE_LANE4_CTRL_2_2_OA_LANE4_SEL_LANE_CFG_MASK, 0x0);
+	} else {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_2,
+				  CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_2,
+				  CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK, 0x0);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_6,
+			  CORE_DIG_RW_COMMON_6_DESERIALIZER_EN_DEASS_COUNT_THRESH_D_MASK, 0x1);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_6,
+			  CORE_DIG_RW_COMMON_6_DESERIALIZER_DIV_EN_DELAY_THRESH_D_MASK, 0x1);
+
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_12,
+			  CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
+			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_12,
+			  CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
+			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_12,
+			  CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
+			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_12,
+				  CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
+				  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_12,
+				  CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
+				  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_13,
+			  CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
+			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_13,
+			  CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
+			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_13,
+			  CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
+			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_13,
+				  CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
+				  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_13,
+				  CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
+				  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_12,
+			  CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
+			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_12,
+			  CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
+			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_12,
+			  CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
+			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_12,
+				  CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
+				  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_12,
+				  CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
+				  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_13,
+			  CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
+			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_13,
+			  CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
+			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_13,
+			  CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
+			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_13,
+				  CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
+				  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_13,
+				  CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
+				  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_9,
+				  CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_HS_CLK_DIV_MASK,
+				  phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg);
+	} else {
+		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_9,
+				  CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_HS_CLK_DIV_MASK,
+				  phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_HS_RX_0,
+			  CORE_DIG_DLANE_CLK_RW_HS_RX_0_HS_RX_0_TCLKSETTLE_REG_MASK, 0x1C);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_HS_RX_7,
+			  CORE_DIG_DLANE_CLK_RW_HS_RX_7_HS_RX_7_TCLKMISS_REG_MASK, 0x6);
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_0,
+			  CORE_DIG_DLANE_0_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
+			  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_0,
+			  CORE_DIG_DLANE_1_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
+			  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_0,
+				  CORE_DIG_DLANE_2_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
+				  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_0,
+				  CORE_DIG_DLANE_3_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
+				  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_1,
+			  CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
+			  phycfg->cfg_1cfg_1_deskew_supported_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_1,
+			  CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
+			  phycfg->cfg_1cfg_1_deskew_supported_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_1,
+				  CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
+				  phycfg->cfg_1cfg_1_deskew_supported_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_1,
+				  CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
+				  phycfg->cfg_1cfg_1_deskew_supported_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_1,
+			  CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
+			  phycfg->cfg_1cfg_1_sot_detection_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_1,
+			  CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
+			  phycfg->cfg_1cfg_1_sot_detection_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_1,
+				  CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
+				  phycfg->cfg_1cfg_1_sot_detection_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_1,
+				  CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
+				  phycfg->cfg_1cfg_1_sot_detection_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
+			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
+			  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
+			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
+			  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
+				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
+				  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
+				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
+				  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0,
+			  CORE_DIG_DLANE_0_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_0,
+			  CORE_DIG_DLANE_1_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_0,
+				  CORE_DIG_DLANE_2_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_0,
+				  CORE_DIG_DLANE_3_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_2,
+			  CORE_DIG_DLANE_0_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_2,
+			  CORE_DIG_DLANE_1_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_2,
+				  CORE_DIG_DLANE_2_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_2,
+				  CORE_DIG_DLANE_3_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_LP_0,
+			  CORE_DIG_DLANE_CLK_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_LP_2,
+			  CORE_DIG_DLANE_CLK_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
+			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
+			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
+				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
+				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_1,
+			  CORE_DIG_DLANE_0_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_1,
+			  CORE_DIG_DLANE_1_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_1,
+				  CORE_DIG_DLANE_2_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_1,
+				  CORE_DIG_DLANE_3_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
+			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
+			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
+				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
+				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_3,
+			  CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_3,
+			  CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_3,
+				  CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_3,
+				  CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_4,
+			  CORE_DIG_DLANE_0_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_4,
+			  CORE_DIG_DLANE_1_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_4,
+				  CORE_DIG_DLANE_2_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_4,
+				  CORE_DIG_DLANE_3_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_5,
+			  CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_5,
+			  CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_5,
+				  CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_5,
+				  CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_5,
+			  CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_5,
+			  CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_5,
+				  CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_5,
+				  CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_6,
+			  CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_6,
+			  CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_6,
+				  CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_6,
+				  CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_7,
+			  CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_7,
+			  CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_7,
+				  CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_7,
+				  CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
+	}
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_7,
+			  CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_7,
+			  CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_7,
+				  CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_7,
+				  CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
+	}
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_3,
+			  CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
+			  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_3,
+			  CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
+			  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_3,
+				  CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
+				  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_3,
+				  CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
+				  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_9,
+			  CORE_DIG_DLANE_0_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
+			  phycfg->max_phase);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_9,
+			  CORE_DIG_DLANE_1_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
+			  phycfg->max_phase);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_9,
+				  CORE_DIG_DLANE_2_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
+				  phycfg->max_phase);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_9,
+				  CORE_DIG_DLANE_3_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
+				  phycfg->max_phase);
+	}
+
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_6,
+			  CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
+			  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
+	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_6,
+			  CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
+			  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
+	if (phy_id <= ISP_MIPI_PHY_ID_1) {
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_6,
+				  CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
+				  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
+		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_6,
+				  CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
+				  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
+	}
+}
+
+static void isp4phy_common(void __iomem *base, u32 phy_id)
+{
+	for (int ctr = 0; ctr < ARRAY_SIZE(startup_seq_common); ctr++)
+		isp4phy_mask_wreg(base, phy_id, startup_seq_common[ctr].addr,
+				  startup_seq_common[ctr].mask,
+				  startup_seq_common[ctr].data);
+}
+
+static void isp4phy_general_common_config(void __iomem *base, u32 phy_id)
+{
+	for (int ctr = 0; ctr < ARRAY_SIZE(startup_seq_general_common_config); ctr++)
+		isp4phy_mask_wreg(base, phy_id,
+				  startup_seq_general_common_config[ctr].addr,
+				  startup_seq_general_common_config[ctr].mask,
+				  startup_seq_general_common_config[ctr].data);
+}
+
+static void
+isp4phy_calculate_datarate_cfgs_rx(u32 phy_id, u64 data_rate,
+				   u32 lane,
+				   struct isp4phy_mipi_config *phycfg)
+{
+	u64 half_rate = data_rate >> 1;
+	u64 hs_clk_freq;
+
+	hs_clk_freq = half_rate * 1000;
+
+	if (data_rate <= 2500)
+		phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg = 1;
+	else if (data_rate <= 4500)
+		phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg = 0;
+
+	if (data_rate < 1500) {
+		/*  do nothing */
+	} else if (data_rate < 1588) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 143;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 17;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 3;
+	} else if (data_rate < 1688) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 135;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 16;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
+	} else if (data_rate < 1800) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 127;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 15;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
+	} else if (data_rate < 1929) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 119;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 14;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
+	} else if (data_rate < 2077) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 111;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 13;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
+	} else if (data_rate < 2250) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 103;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 12;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else if (data_rate < 2455) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 95;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 11;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else if (data_rate < 2700) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 87;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 10;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else if (data_rate < 3000) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 79;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 9;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else if (data_rate < 3230) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
+		phycfg->max_phase = 71;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 8;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 0;
+	} else if (data_rate < 3600) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
+		phycfg->max_phase = 87;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 10;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else if (data_rate < 4000) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
+		phycfg->max_phase = 79;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 9;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else if (data_rate < 4500) {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
+		phycfg->max_phase = 71;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 8;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
+	} else {
+		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
+		phycfg->max_phase = 63;
+		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 7;
+		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 0;
+	}
+
+	if (data_rate <= 1500) {
+		phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg = 1;
+		phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg = 1;
+		phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg = 0;
+		phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg = 1;
+		phycfg->cfg_1cfg_1_deskew_supported_reg = 0;
+		phycfg->cfg_1cfg_1_sot_detection_reg = 1;
+	} else if (data_rate <= 4500) {
+		phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg = 0;
+		phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg = 0;
+		phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg = 0;
+		phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg = 0;
+		phycfg->cfg_1cfg_1_deskew_supported_reg = 1;
+		phycfg->cfg_1cfg_1_sot_detection_reg = 0;
+	}
+
+	if (data_rate < 160)
+		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b001;
+	else if (data_rate < 320)
+		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b010;
+	else if (data_rate < 640)
+		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b011;
+	else if (data_rate < 1280)
+		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b100;
+	else if (data_rate < 2560)
+		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b101;
+	else
+		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b110;
+
+	u32 t_hs_settle_ns = MIN_T_HS_SETTLE_NS + MAX_T_HS_SETTLE_NS;
+
+	t_hs_settle_ns = t_hs_settle_ns >> 1;
+	u32 t_hs_settle_ui = MIN_T_HS_SETTLE_UI + MAX_T_HS_SETTLE_UI;
+
+	t_hs_settle_ui = t_hs_settle_ui >> 1;
+
+	t_hs_settle_ui = t_hs_settle_ui * 1000000;
+	t_hs_settle_ui = t_hs_settle_ui >> 1;
+	do_div(t_hs_settle_ui, hs_clk_freq);
+	u32 ths_settle_target = t_hs_settle_ns + t_hs_settle_ui;
+
+	do_div(ths_settle_target, T_DCO);
+	phycfg->hs_rx_0hs_rx_0_thssettle_reg = ths_settle_target - TMIN_RX - 7;
+
+	u16 jump_deskew_reg = phycfg->max_phase + 39;
+
+	do_div(jump_deskew_reg, 40);
+	phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg = jump_deskew_reg;
+
+	u16 eye_opening_deskew_reg = phycfg->max_phase + 4;
+
+	do_div(eye_opening_deskew_reg, 5);
+	phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg = eye_opening_deskew_reg;
+}
+
+static void isp4phy_startup_seq_dphy_rx(void __iomem *base, u32 phy_id,
+					u64 data_rate, u32 lane)
+{
+	struct isp4phy_mipi_config phycfg;
+
+	memset(&phycfg, 0, sizeof(phycfg));
+
+	isp4phy_calculate_datarate_cfgs_rx(phy_id, data_rate, lane, &phycfg);
+	isp4phy_general_common_config(base, phy_id);
+	isp4phy_common(base, phy_id);
+	isp4phy_dphy_specific(base, phy_id, data_rate, &phycfg);
+	isp4phy_dphy_periodic_deskew_program(base, phy_id);
+	isp4phy_optional_features_dphy(base, phy_id);
+}
+
+static int isp4phy_startup_seq_cdphy_rx(struct device *dev,
+					void __iomem *base, u32 phy_id,
+					u64 data_rate, u32 lane)
+{
+	struct isp4phy_mipi_reg phy_reg = {0};
+
+	/* readback the mipi phy reg */
+	phy_reg.isp_mipi_phy0.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0);
+	phy_reg.isp_mipi_phy1.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy1);
+	phy_reg.isp_mipi_phy2.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy2);
+	phy_reg.isp_mipi_phy4.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy4);
+	phy_reg.isp_mipi_phy5.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5);
+	phy_reg.isp_mipi_phy6.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy6);
+	phy_reg.isp_mipi_phy7.value =
+		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy7);
+
+	phy_reg.isp_mipi_phy0.bit.shutdownz = 0;
+	phy_reg.isp_mipi_phy0.bit.rstz = 0;
+	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0),
+		    phy_reg.isp_mipi_phy0.value);
+
+	/*PHY register access test */
+	isp4phy_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0, 0x473C);
+	usleep_range(10, 20);
+	if (isp4phy_rreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0) == 0x473C) {
+		dev_dbg(dev, "PHY register access test suc\n");
+	} else {
+		dev_err(dev, "PHY register access test fail\n");
+		return -EFAULT;
+	}
+
+	/** T1: top level static inputs must be set to the desired
+	 * configuration (for example, phyMode. These *inputs can be
+	 * identified with Startup and Active Mode state: Static label
+	 * in Chapter 4, ¡°Signal Descriptions¡±).
+	 */
+	phy_reg.isp_mipi_phy5.value = (1 << lane) - 1;
+	phy_reg.isp_mipi_phy5.bit.forcerxmode_clk = 1;
+	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5,
+		    phy_reg.isp_mipi_phy5.value);
+
+	phy_reg.isp_mipi_phy4.value = (0x2 << lane) - 1;
+	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy4,
+		    phy_reg.isp_mipi_phy4.value);
+
+	phy_reg.isp_mipi_phy1.bit.mode = ISP_MIPI_DPHY;
+	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy1),
+		    phy_reg.isp_mipi_phy1.value);
+
+	/** T2: APB slave is active and can be accessed (presetN = 1b1)*/
+	/** T3: static register fields are programmed/read through the APB,
+	 *	with PHY in reset (these register
+	 *	fields can be found in Chapter 11.2, Static Register Access).
+	 */
+	/* DPHY mode setup */
+	isp4phy_startup_seq_dphy_rx(base, phy_id, data_rate, lane);
+
+	/** T4: initial programming phase is over and PHY is ready
+	 *	to leave Shutdown Mode (shutdownN = 1¡¯b1
+	 *	and rstN = 1¡¯b1).
+	 */
+	phy_reg.isp_mipi_phy0.bit.shutdownz = 1;
+	phy_reg.isp_mipi_phy0.bit.rstz = 1;
+	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0,
+		    phy_reg.isp_mipi_phy0.value);
+
+	dev_dbg(dev, "Termination calibration observability: 0x%x\n",
+		isp4phy_rreg(base, phy_id, PPI_R_TERMCAL_DEBUG_0));
+
+	/** T5: internal calibrations ongoing. No configurations are accepted
+	 *	during power-on-reset (POR).
+	 *	phyReady asserts to signal that POR is complete.
+	 */
+	do {
+		usleep_range(1000, 2000);
+		phy_reg.isp_mipi_phy7.value =
+			isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy7);
+		dev_dbg(dev, "Wait for phyReady: 0x%x\n",
+			phy_reg.isp_mipi_phy7.value);
+	} while (phy_reg.isp_mipi_phy7.bit.ready != 1);
+
+	/** T6: dynamic register fields can be programmed/read through APB
+	 *	(these register fields can be found in Chapter 11.3, Dynamic Register Access).
+	 *	Check Chapter 9.3.4, D-PHY and C-PHY HS Receivers for analog settings that must be
+	 *	programmed in T3.
+	 */
+
+	/** T7: de-assert forcerxmode_N.*/
+	phy_reg.isp_mipi_phy5.bit.forcerxmode_0 = 0;
+	phy_reg.isp_mipi_phy5.bit.forcerxmode_1 = 0;
+	phy_reg.isp_mipi_phy5.bit.forcerxmode_2 = 0;
+	phy_reg.isp_mipi_phy5.bit.forcerxmode_3 = 0;
+	phy_reg.isp_mipi_phy5.bit.forcerxmode_clk = 0;
+	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5),
+		    phy_reg.isp_mipi_phy5.value);
+	return 0;
+}
+
+int isp4phy_start(struct device *dev,
+		  void __iomem *base, u32 phy_id, u64 bit_rate,
+		  u32 lane_num)
+{
+	if (phy_id >= ISP_MIPI_PHY_ID_MAX)
+		return -EINVAL;
+
+	if (phy_id == 2 && lane_num > 2) {
+		dev_err(dev, "MIPI PHY 2 just has 2 lane\n");
+		return -EINVAL;
+	}
+
+	if (phy_id == 0 && lane_num > 4) {
+		dev_err(dev, "fail invalid lane number %u for phy0\n",
+			lane_num);
+		return -EINVAL;
+	}
+
+	return isp4phy_startup_seq_cdphy_rx(dev, base, phy_id, bit_rate, lane_num);
+}
+
+int isp4phy_stop(void __iomem *base, u32 phy_id)
+{
+	struct isp4phy_mipi_reg phy_reg = {0};
+
+	if (phy_id >= ISP_MIPI_PHY_ID_MAX)
+		return -EINVAL;
+
+	phy_reg.isp_mipi_phy0.value =
+		isp4hw_rreg(base, (uintptr_t)
+			    (&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0));
+
+	/* shutdown phy */
+	phy_reg.isp_mipi_phy0.bit.shutdownz = 0;
+	phy_reg.isp_mipi_phy0.bit.rstz = 0;
+	isp4hw_wreg(base,
+		    (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0),
+		    phy_reg.isp_mipi_phy0.value);
+
+	return 0;
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_phy.h b/drivers/media/platform/amd/isp4/isp4_phy.h
new file mode 100644
index 000000000000..2909892dbd00
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_phy.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_PHY_H_
+#define _ISP4_PHY_H_
+
+int isp4phy_start(struct device *dev,
+		  void __iomem *base, u32 phy_id, u64 bit_rate,
+		  u32 lane_num);
+int isp4phy_stop(void __iomem *base, u32 phy_id);
+
+#endif
-- 
2.34.1


