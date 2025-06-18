Return-Path: <linux-media+bounces-35135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2CBADE67B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD633B20F7
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82E1DF59;
	Wed, 18 Jun 2025 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rt1qhkp+"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E6280A5C;
	Wed, 18 Jun 2025 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238430; cv=fail; b=FoiCIAifQuGT3mFKyXhTSpz+Eno2rAmdXcXMB4/p+1ZbKxLKPRys7reECIuMb8hKYBKUkaHnp3gebNG8MMQiL00cP+bEThq8WLwg9x+FPqFleAdcZSJpc9vfaSQpZowbdOCjUaTc8xr+MD5Q6uMlbBnqcMa0X3VtlKd3mvaSQc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238430; c=relaxed/simple;
	bh=jKBvG0D3TrwjDfwHpFOxI2jQHgz0fCw5u73jfKPHSM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEDguivAa7G+E2jM4ymSuEdXCa6YHgXDd89Zx09nFtQzDi0SGTFfqjU/xHwRJYwkD1WYQglS/gcrDFTLl1H/O6LYWV+cgjqo9mYSzRxrAMVrb6Y9RCXz7SuzQlUAxMiIMUJtxNSn2TDbo+FK1sprdWZPlV0WJRGkL2pLvsLTTfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rt1qhkp+; arc=fail smtp.client-ip=40.107.96.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkgNTCool1cZ+dsXQM6+QxgEg5YxNn6RkKpkhPDHAXqsJ9/pKhvdRkEjLA+6sAsBkEs+Ud6Z0+IpxhZUWpzy8gpJ5DSl079+lmWDb6i44rmW5NoTZtzNTFJ7VNWS/eXBlIL2yTJxFZkU+9UtNUTofhXjOi6DfO5jj7Xoro20+cOvMTKr4MjQSUVZdAB9zfHCzwKLLBRVMISmFNCIPcrJGS2qAOfHCClIbSKGwmM1VGVfV29IlySvKhcC/W3b2Uk9klbzyR29xNivwnQELUfmhBMmeA2NSKjSBRJsHvI/NCKH/RgjCpTO7+yPqV9aHA8pH0L2F81KXXXClSbwzxENPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnv8yxUavBN3iKeHK6VVhPbAKr/Rc9N6tJKjuZ8+tU0=;
 b=BWCWrO94hWWk5342QDCEDoUTVK3jkG9kDgktoD21r7zv0a3apdCd8nnasowkJjIHNjdBQllB1xNEnS3FaHcMyGy9y1sr1Kw2D0fMdHdJ/Lm29M4Xf3FxpHvmCUB3AK2+/ZwpukTe2++XoEPKIwEDtHo3cJY8mco8wtMRBiIdPr/fbg7sVzecBBcfdoQfWMxnso5nhhN/E6TdxveN3InYmVairFBQvQlBuA4ZSOPLMInAFbVbxvFn3JokCZOs1g72TMWs82WKhJtr+Dlafx51S29IAWH8Su/pkS/iOYqXY2r+TdpHKkwTz8ucWKzhibRSJNAVsK9njbtqbIcx0cBwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnv8yxUavBN3iKeHK6VVhPbAKr/Rc9N6tJKjuZ8+tU0=;
 b=rt1qhkp+CMIZsl+d0DvFw9NMV+E3FNXKde62x+WdDI9OcrUW8sUDhQUY4PqHCRD/Xq/v3ZAZR7LkJPf7iBFeE4NOb0bHGBhl9INgLlazrscvRIguLgrsCiQ96V6jKDnbcDQI9wdzohg2MRZuB8iwv/zZxXH2ZdrXcz8Z9gjURkc=
Received: from DS7PR03CA0127.namprd03.prod.outlook.com (2603:10b6:5:3b4::12)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 18 Jun
 2025 09:20:22 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::a0) by DS7PR03CA0127.outlook.office365.com
 (2603:10b6:5:3b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Wed,
 18 Jun 2025 09:20:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 09:20:22 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 04:20:17 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture driver
Date: Wed, 18 Jun 2025 17:19:52 +0800
Message-ID: <20250618091959.68293-2-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: d94814cb-49a0-43c8-ebed-08ddae4959fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eBL4ljxcY4AI5SSlCgB6H/egN+PK7RBSG3rK0fQ1drYSSp3/MUIzQEIf63Qb?=
 =?us-ascii?Q?DLdU/UpfRp9Or6uF3M497MKIx9Ut7RQRlEjSQ1QCdcbnxW7aaPUWapstaIKY?=
 =?us-ascii?Q?9tNCbMcGGZoDN6xntR7usx5tF64UqoYL6hDUP00xovJYgQ0t//vBQSpQyXKN?=
 =?us-ascii?Q?UpgAz+2A3C7UYhNopoZruSQJIcjss/C2nmMm9P6dL+QMISj57xBWUhsi2Lve?=
 =?us-ascii?Q?RUAQpapgggk3CqFqizM36hkCPkMxVpsHsELf9L+1B/2UW90Nfq8bLDDhRMNe?=
 =?us-ascii?Q?FOKwACQBgwk3BV0CzRUYkNsBLUNHNwDxJ897l3H4Jn96xwmDiRaLiI2iPfOU?=
 =?us-ascii?Q?0IqbaUp4I9871VwI4NhhgMU7T0l3objcgVNb+EbR8bpDF7zwrUd5QNFleRKJ?=
 =?us-ascii?Q?amvzaoHwb+Gk0MKiKz6nTHc02xgzl4+VAgy0t61+pE1cPm8U4MOax1d79lNu?=
 =?us-ascii?Q?081Zjh7Pr+SM2MJxvZ78SPuDXtF7VX9Rfls+cwlN9K/QqGPktWuSpIc7Ej9r?=
 =?us-ascii?Q?odD4t1l0DxnDGpqCrU7Dd6e8TK61lWfWGi7gAYGJ0xI+LBwIK+Q+3XpZUdfO?=
 =?us-ascii?Q?x5ZtZN/7eb6dmDj104z6THOw9MADz0mziqmkQS28uCA3YqHZ99f+b6dKgmel?=
 =?us-ascii?Q?hqy67nsQbLEGvO2k/1laf3G0chwfJwJHp+N/lpllVL9EhJaqyorTtFw4bjEb?=
 =?us-ascii?Q?TSlFkDhdDEc3lOKJ20xtoW/58c3aepYlMkqQQiZmJbK6ivldhnRGNHlZ+S2A?=
 =?us-ascii?Q?gUHo7IJ2xCIlhuBf4gfYhginOHd8BR/9WLUzXDazqnagx9NFHW5T1ck1/j7+?=
 =?us-ascii?Q?EbmZ6gxi7YVTsMWvY29vqyWEZWlVTUTldB95claeF0LA9d4Hf8bpkAC8lE1e?=
 =?us-ascii?Q?vrktwTJHRUaUfvtxBCiAo5RvBWT2WlASqj4iY4n9QRpfF/7pvmQ5WOudviE+?=
 =?us-ascii?Q?5SJavePegzdQuAyn4JnFZRQE3Vnjh8d7wF6952RhS7/SQdyevv+NhUnuLRcs?=
 =?us-ascii?Q?NTK3dzqbw5nWB21cjVrL9/5H2hShWlD8067Qz9GVQZKO/Ntb+NpPhhO/zgzW?=
 =?us-ascii?Q?m+JpPQIH9OEGGOWsdt6GUxoubVml6noauQGZwobpZSaZdKYgdN3WklpbV8eu?=
 =?us-ascii?Q?37OjPHXSP3QX/N2IjzSCFVSlsoy7lJo6T6Nib9izRaBCc7J/0lHSZiUM2SGR?=
 =?us-ascii?Q?Zdbu3W7i9Rgh+nKo+sDuTwhCQl8qmTs6IaaZCr+TlflYJg0ZwWmP35RV95Y5?=
 =?us-ascii?Q?i0GF5cdn/UjrGyR7RLPbDDcTUqG6PoCW8n0R7O1FHpJyaSzKyuyUvsEN+q2f?=
 =?us-ascii?Q?8JO4+NvIfCxJwCu+bWc+go5jiiJ34rPP7N3O1cvL1c5hQgvq0dM6z9sUG0ct?=
 =?us-ascii?Q?9a7jAFPILjHR1/tPQWYnYbvIVFNN7Fv2cnD8TmlcvtCDXZVVoxKzxYjSDaR+?=
 =?us-ascii?Q?KRfIJFBOqb04ixyXyEUTfFHf1IdoaynlloebP7fnfqEI/oNDtLvw0lyu3w7y?=
 =?us-ascii?Q?IRJmiqdNUiZBHIp4HrPDDseLfJchoKvn2iiL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:20:22.1192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d94814cb-49a0-43c8-ebed-08ddae4959fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

Amd isp4 capture is a v4l2 media device which implements media controller
interface.
It has one sub-device (amd ISP4 sub-device) endpoint which can be connected
to a remote CSI2 TX endpoint. It supports only one physical interface for
now.
Also add ISP4 driver related entry info into the MAINAINERS file

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
---
 MAINTAINERS                              |  10 ++
 drivers/media/platform/Kconfig           |   1 +
 drivers/media/platform/Makefile          |   1 +
 drivers/media/platform/amd/Kconfig       |  17 +++
 drivers/media/platform/amd/Makefile      |   5 +
 drivers/media/platform/amd/isp4/Makefile |  21 ++++
 drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
 8 files changed, 229 insertions(+)
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 10893c91b1c1..15070afb14b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1107,6 +1107,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	drivers/iommu/amd/
 F:	include/linux/amd-iommu.h
 
+AMD ISP4 DRIVER
+M:	Bin Du <bin.du@amd.com>
+M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/platform/amd/Kconfig
+F:	drivers/media/platform/amd/Makefile
+F:	drivers/media/platform/amd/isp4/*
+
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 85d2627776b6..d525c2262a7d 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
 source "drivers/media/platform/verisilicon/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
+source "drivers/media/platform/amd/Kconfig"
 
 endif # MEDIA_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index ace4e34483dd..9f3d1693868d 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -32,6 +32,7 @@ obj-y += ti/
 obj-y += verisilicon/
 obj-y += via/
 obj-y += xilinx/
+obj-y += amd/
 
 # Please place here only ancillary drivers that aren't SoC-specific
 # Please keep it alphabetically sorted by Kconfig name
diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
new file mode 100644
index 000000000000..3b1dba0400a0
--- /dev/null
+++ b/drivers/media/platform/amd/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: MIT
+
+config AMD_ISP4
+	tristate "AMD ISP4 and camera driver"
+	default y
+	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_MEMOPS
+	select VIDEOBUF2_VMALLOC
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_DMA_SG
+	help
+	  This is support for AMD ISP4 and camera subsystem driver.
+	  Say Y here to enable the ISP4 and camera device for video capture.
+	  To compile this driver as a module, choose M here. The module will
+	  be called amd_capture.
diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
new file mode 100644
index 000000000000..76146efcd2bf
--- /dev/null
+++ b/drivers/media/platform/amd/Makefile
@@ -0,0 +1,5 @@
+# Copyright 2024 Advanced Micro Devices, Inc.
+# add isp block
+ifneq ($(CONFIG_AMD_ISP4),)
+obj-y += isp4/
+endif
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
new file mode 100644
index 000000000000..e9e84160517d
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2025 Advanced Micro Devices, Inc.
+
+obj-$(CONFIG_AMD_ISP4) += amd_capture.o
+amd_capture-objs := isp4.o
+
+ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
+ccflags-y += -I$(srctree)/include
+
+ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
+	cc_stack_align := -mpreferred-stack-boundary=4
+endif
+
+ccflags-y += $(cc_stack_align)
+ccflags-y += -DCONFIG_COMPAT
+ccflags-y += -Wunused-but-set-variable
+ccflags-y += -Wmissing-include-dirs
+ccflags-y += -Wunused-const-variable
+ccflags-y += -Wmaybe-uninitialized
+ccflags-y += -Wunused-value
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
new file mode 100644
index 000000000000..d0be90c5ec3b
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ioctl.h>
+
+#include "isp4.h"
+
+#define VIDEO_BUF_NUM 5
+
+#define ISP4_DRV_NAME "amd_isp_capture"
+
+/* interrupt num */
+static const u32 isp4_ringbuf_interrupt_num[] = {
+	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
+	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
+	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
+	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
+};
+
+#define to_isp4_device(dev) \
+	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
+
+static irqreturn_t isp4_irq_handler(int irq, void *arg)
+{
+	struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
+
+	if (!isp_dev)
+		goto error_drv_data;
+
+error_drv_data:
+	return IRQ_HANDLED;
+}
+
+/*
+ * amd capture module
+ */
+static int isp4_capture_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct isp4_device *isp_dev;
+
+	int i, irq, ret;
+
+	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
+	if (!isp_dev)
+		return -ENOMEM;
+
+	isp_dev->pdev = pdev;
+	dev->init_name = ISP4_DRV_NAME;
+
+	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
+		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
+		if (irq < 0)
+			return dev_err_probe(dev, -ENODEV,
+					     "fail to get irq %d\n",
+					     isp4_ringbuf_interrupt_num[i]);
+		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
+				       "ISP_IRQ", &pdev->dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "fail to req irq %d\n",
+					     irq);
+	}
+
+	isp_dev->pltf_data = pdev->dev.platform_data;
+
+	dev_dbg(dev, "isp irq registration successful\n");
+
+	/* Link the media device within the v4l2_device */
+	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
+
+	/* Initialize media device */
+	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
+		sizeof(isp_dev->mdev.model));
+	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
+		 "platform:%s", ISP4_DRV_NAME);
+	isp_dev->mdev.dev = &pdev->dev;
+	media_device_init(&isp_dev->mdev);
+
+	/* register v4l2 device */
+	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
+		 "AMD-V4L2-ROOT");
+	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "fail register v4l2 device\n");
+
+	dev_dbg(dev, "AMD ISP v4l2 device registered\n");
+
+	ret = media_device_register(&isp_dev->mdev);
+	if (ret) {
+		dev_err(dev, "fail to register media device %d\n", ret);
+		goto err_unreg_v4l2;
+	}
+
+	platform_set_drvdata(pdev, isp_dev);
+
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err_unreg_v4l2:
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+
+	return dev_err_probe(dev, ret, "isp probe fail\n");
+}
+
+static void isp4_capture_remove(struct platform_device *pdev)
+{
+	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	media_device_unregister(&isp_dev->mdev);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+	dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
+}
+
+static struct platform_driver isp4_capture_drv = {
+	.probe = isp4_capture_probe,
+	.remove = isp4_capture_remove,
+	.driver = {
+		.name = ISP4_DRV_NAME,
+		.owner = THIS_MODULE,
+	}
+};
+
+module_platform_driver(isp4_capture_drv);
+
+MODULE_ALIAS("platform:" ISP4_DRV_NAME);
+MODULE_IMPORT_NS("DMA_BUF");
+
+MODULE_DESCRIPTION("AMD ISP4 Driver");
+MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
new file mode 100644
index 000000000000..27a7362ce6f9
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_H_
+#define _ISP4_H_
+
+#include <linux/mutex.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-memops.h>
+#include <media/videobuf2-vmalloc.h>
+
+#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
+
+struct isp4_platform_data {
+	void *adev;
+	void *bo;
+	void *cpu_ptr;
+	u64 gpu_addr;
+	u32 size;
+	u32 asic_type;
+	resource_size_t base_rmmio_size;
+};
+
+struct isp4_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+
+	struct isp4_platform_data *pltf_data;
+	struct platform_device *pdev;
+	struct notifier_block i2c_nb;
+};
+
+#endif /* isp4.h */
-- 
2.34.1


