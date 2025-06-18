Return-Path: <linux-media+bounces-35136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D445ADE67E
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C378817917B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF91281525;
	Wed, 18 Jun 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b6G6vWEj"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15155280CFB;
	Wed, 18 Jun 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238431; cv=fail; b=Ou9oFJPQ9a6ErBH9mBLTySlScHVQ99yGuC52McQ3NnYWIXMselZUAIUHZ8552MAVCwU2RGN8KwSDN2sPQ5QVeaGnilQ/f7UaQPeQv+HFQ6TiCvAhXojkScEzVvVTbZxiW26hlTZ8tc+NBiUAj8wOqzxHgsIBJeu5y5RElmGnwBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238431; c=relaxed/simple;
	bh=2FiSkxiVRkO5VwBBf+NhALhLHQzQ9vPAV86pcYMLVuI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pH9ehM6tEX1EJqRJrpVQj1kZcthLvZs5tb8B/BSPh88SWVTr4YBe7nELQ4Wk5i8KklBCw0h/7j6hlYCeQReM+SXjb/9Nbe+WftD8r3D0dcwX9mpdQUKDE1su6gNK7R0WPH+lxnagVmv6VNwzNUwvGR2qA/rlklDmIm4clVUJNBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b6G6vWEj; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5FOpV+km2yguh7mmsSvJFneVeSk2aVnjdXPPw2IDbQpBxDV0aQIbpVJGpCKd4q7j7nGFwdVV7QpZ45wfGT5iAyHVKOCQ6n/i4aUqSUpNWG/raZW/216y0j4qd3rZcILZbcqAoLzCiA59t4CrMH1yRHIrTm7gwVK0r7ici7yO/UPzBBciqidzdrQMoyfxN1DWeRicfpMuf3m7djvBeWKb+7ZInM2JR03fFyv+qKNgcUtJxGydaPak2YWyEXA4i6UOOhkuZGfQVtuaybmWtliEWWmsHYp/LSbGt0oBDfwTVK3jY5zihaAn+8CKmXYw//e57wFARgPVJ529xDj9a7liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN/FMMzarjMJxYoVGOjyDi6OSKQv7bYP0RmgOYRDAk0=;
 b=WnAJ6AMb2fJJ8D1n8ObzgaZkvHX4X9ChBlK/C3t6Ft+7EkyZT2EngLGBmgdba8Kaw9ED6w/iOJ+aI9Zx2hpxlXNrJaf4joeGhcSZY7K2PgHhWlbDOY7/CEWUvqP3AbuqoIfZzrkT4341RZoodIqsh/YPYzcfH8cLDHm6lkLwDP/IdKiiRk7DWmHKma1hKsdrWpjqL8MPPNpmUrM9GID1x+LwFYfKOQCozIlIsY7AmkKmMTmajx6rKg8UieYRII/LFEVY3c5pwIluSJRAEvaS2WM8Jr+T/+UK9tFfB2piyLdPJK0SA4MhzgawSX/tCetlUmw6IQU6eHjl+fhEmjiMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN/FMMzarjMJxYoVGOjyDi6OSKQv7bYP0RmgOYRDAk0=;
 b=b6G6vWEjKqV178kjXQ8JSN94uZroVMEH5F0M1Q+e2v8rDukyxqYH9pp9zOdrwY+ragoKQg6xJ2x5Yo8Er3yVbzPyd/Mj0cbcGxsupkX26x+g1mSddKESvXg51qvi6usE9XpzbEnbdhAmTMMZYFml2WUeheSOlpD7dg3AQ57MRVA=
Received: from DS7PR03CA0142.namprd03.prod.outlook.com (2603:10b6:5:3b4::27)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 09:20:26 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::51) by DS7PR03CA0142.outlook.office365.com
 (2603:10b6:5:3b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 18 Jun 2025 09:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 09:20:25 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 04:20:21 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v2 2/8] media: platform: amd: low level support for isp4 firmware
Date: Wed, 18 Jun 2025 17:19:53 +0800
Message-ID: <20250618091959.68293-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: db4c8ae8-4e57-4c1a-54af-08ddae495c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HyFnZmXz+Dv/F+O5XMyYRSxfuyFM4T9WBAf69sk1WVokkfeD4zfAecvXvjJ9?=
 =?us-ascii?Q?NRQii1GNpKWqVJRdkU1KyChEUvmc+P9HYtxWL+v9jTwRYu4bPbv1KRicz+Jg?=
 =?us-ascii?Q?X78V2O1xJhTqFFLfo8ZLAAmkiCaVznkWzhQPeyVvxMHOTNVSnuSBWfCYuI7N?=
 =?us-ascii?Q?dkHCJWnutkkO/pMxJaxQgCixjY+PLU8bnZGMNCPhCJdQeDmhh/GrN+5e8ZJh?=
 =?us-ascii?Q?STTCNKzXSGB5+U4DtQkKWz0HuM2ngodaW+/EnXnhEqRUM7fZRMTjufeYqTTb?=
 =?us-ascii?Q?PR6Vc37/YHrGDHvCiWmPShLHXU7AjOqmmM1Mx/xS7xtKn4qbNqvELVMH/Jd0?=
 =?us-ascii?Q?NxXsT2au6fjSfa2l/l0A71YQd7W6TuVgJaSr8VUwDq5B1OJfNpBjbOVdqipB?=
 =?us-ascii?Q?2oGNlEYSwjJROVjzHtTf4trRQKKAZ9odV9Xu0DmN6SuXBDXlOxv91bghoezx?=
 =?us-ascii?Q?t7jLGQxNmJKeJnyemajLOZxhg9nqW5tqMLpKnFhccjn+okTIc3E90yC5z6+f?=
 =?us-ascii?Q?Hpiq9RM8pT0tZ4B2+UvN8V3bho/988T21e1kXr5kfQKSI+9iEi4rgRdSB9W0?=
 =?us-ascii?Q?nbS2F0AKmc7WmYDi/+P1+eNBQihUgYaUwF/lolrFJLTb8Hejx8LKjy/yjGkb?=
 =?us-ascii?Q?6Jbx5ff2ZArBK55v3HJYjhpJs42lzXItfrJqm1L4BGV4od2iD0DX3Ri9lj41?=
 =?us-ascii?Q?BlWY9SltgpS5In1jjiEenKmHHe7e9TtSLmx+otHqRlxbtQAPSsnFfJRupsmm?=
 =?us-ascii?Q?XdH3lTcPoCOhUX0f3u+rrb53bnO1+yaODbRC/s/90pPhT14rJMHTxR/fFsYR?=
 =?us-ascii?Q?uRtP9EI/rUd8OBolnu3+en39gcN0rE6XzkCn9tuFNlHVVplcI/zEL8ojV7TW?=
 =?us-ascii?Q?LbIrfN+YWM8f+eSYhFMmPRcEBQQiWxI91nFGIfDa1tGGQRHmrr0rpAGsi2vi?=
 =?us-ascii?Q?ylFwNL48NcX1VAB8Vu/phwTZp0ohqfzfdWnhD8j194AP9a5bscfN/J5bmxKy?=
 =?us-ascii?Q?b22M9t73fFuIr1PekBzcXmzGjlUW7gPzms5MdzqLJ1rGkTVd9A8JCogcU8/H?=
 =?us-ascii?Q?Bzuhd8eXk33EWombXuZD2hdeEZcbSTj9zQ805Qq24bAQYyjeKeFesiP5ZA9U?=
 =?us-ascii?Q?d+hiifRaJSmK/Dz2pcP+Gbcy0Zz0j2QnIgndlG/cHGd6zma9IjfsSdJ88gmN?=
 =?us-ascii?Q?EUMkb1J/r05T1PqzcecIxxtt3rryu+cwtZFgr5+ahbkl4sV1I4V56aX8BUQ/?=
 =?us-ascii?Q?FpxPNLl7K/sG08FcL4Be7TGkEQ4HARDRXfMoww1N36jSa5KbKUINU6MfdmLa?=
 =?us-ascii?Q?M+n+9QfeoeYlPQZ5TNyPHVzrf5wO5vTddn5c3W8jNxRv0O4EwCVRpw8RFGZC?=
 =?us-ascii?Q?klcwY4+43+gQyPIXZ1eABNaSfD26OqLUZg1jxNIOGxcSkZ5+xI6MfxaSNUjt?=
 =?us-ascii?Q?bgFx/CBAxla7f2fc4sa9Xo7XSw2OhM0F7dwda3p+RadMA7vYZaTq8GT5614J?=
 =?us-ascii?Q?8eaXzwLdfCvPeIYbsIdvWHwX3qebmAVeqrif?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:20:25.7790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db4c8ae8-4e57-4c1a-54af-08ddae495c2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

Low level functions for access the registers and mapping to their ranges.
This change also includes register definitions for ring buffer used to
communicate with ISP Firmware.
Ring buffer is the communication interface between driver and ISP Firmware.
Command and responses are exchanged through the ring buffer.

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
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
index e9e84160517d..8ca1c4dfe246 100644
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


