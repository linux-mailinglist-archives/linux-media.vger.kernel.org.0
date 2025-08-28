Return-Path: <linux-media+bounces-41234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91EB3991F
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 12:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9981E17787B
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8613081C7;
	Thu, 28 Aug 2025 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MVErvFpn"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2224467A;
	Thu, 28 Aug 2025 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756375737; cv=fail; b=WouXM4oMJuVGiPnlYCXwNYHa5ef37SjU/UwT+bZo5OuViZiq2H5dYBOq1gB+7Y/Lvtb4LiQkWBApvBwnA+vdw3H0bgmty3J+kQ0ci/gZ84I7H+QWp3+a1VkF4EMpuFvJlqXERcS4VaeIJxMzC0E1iLwkoZyWacR3/BIbYf/krYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756375737; c=relaxed/simple;
	bh=jPubIA9td1LuqHo3KCWENgwrRBg+CrAuAlNC7TC75Cw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mLPLIjp987ETC7G4Pn/ZOU1CC9DH6J2APQ6dKrUSLIwRZddEWXP9fAf3z7QOp2jleJUVjiQB9AnrofRgvcjQ7mt3TFGrwLFCY3IRnmE4/6Z2UhwJ9UMUtfTTCUa9eQvT4jPnfJ4FcuH0sdBKqAEdtStCW504DoWa2Jyaz7pTUXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MVErvFpn; arc=fail smtp.client-ip=40.107.212.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxhHWWbzKf4TT8B5Z4QnJ4hSBfzxv4tF/9d2UUnBLxdTqhPEyBWTNiI5OkytWECfYXhUmYgUjjmPawkUa+Z2OufTPSOBPNk1gaQabDfQy/vnaXYGDp/QrxK1ivCd03WMIzJoeStH5+xH8BpaT6Ly96u7sbKuwhD9piNMJESDXLaU2FUmNG+14hAUlBCBXhnCnhsFPbONTP7acx4drkiO2uPNebHuffAaGagqWCU4DiOSuuXwJART/Rd/yJ/2WGNySTc9T3smZaBbDjFBo66OKSPE7706JluVu4icOcxUCTSc/FLWm/u2Of2aYFxtFoYM1m8xj9rkKxf3kjsUMTQB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07rAYirYwUdjt8Z55z2SUzwZomlS2IpdnNZ+yPr8CY0=;
 b=yIIPqp1DFBc/Ghe/WiadmYk6UNnYXLLFsm8rBO+3qaNq4xgtYGCe9aJ7Xw16/VQNnWcwRsjJkGDMhbvTTrk2b6SzKl/P7AI3BH6TWvx1BCiQt6CL4lRZPsZBW53l8X2kSQMG7F6MC9WQnBwuuzvCFI9ZS29p1wbYR07cORWws1Myzwti8f+cNNhqXENur3cWep0gSBuOfg1eobRUXUMww0L7ZjPDgHQo0N51KzGXwHN6kbhoQm2aYkHBX2vJ2FV41U18A5G7K+u0oEUD7iw/jSF64lpV1wbGeq4J+zD/zPN7pQqKgRAP/MZ6awaobBrtt5Xpru5CMiqSci3M1xnatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07rAYirYwUdjt8Z55z2SUzwZomlS2IpdnNZ+yPr8CY0=;
 b=MVErvFpn6ZFTfnvxewncX51ggaWUTDV00g8Q4zYh5CLNn75FyteUq6sLB+zjCITeQcdM634NzecSrX5i//dBCH10rUBI1EUxUGkQOEafDlFSIIF43Q2snXLzFXGZB+QDoxL1g5x9ixYqSdZfo5PuAUURfLR5eGGelZlj4BdhTUE=
Received: from BN6PR17CA0060.namprd17.prod.outlook.com (2603:10b6:405:75::49)
 by DS7PR12MB8275.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 10:08:45 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::f) by BN6PR17CA0060.outlook.office365.com
 (2603:10b6:405:75::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 10:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:08:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:08:45 -0500
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 03:08:40 -0700
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
Subject: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Thu, 28 Aug 2025 18:08:05 +0800
Message-ID: <20250828100811.95722-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 869ebd4c-e0e4-402c-cc92-08dde61adfdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YlX3omn6AwemIkHxJ+mpKbXYTRStvIQEKLm26HEV+wHcZyJrRrRb/VRRiUg0?=
 =?us-ascii?Q?iGXAr3pQVki3f3+Ob8H/QQ7FqiFfnwvd7ophUl+rYV1WFLTC73rqq0Q06Z3M?=
 =?us-ascii?Q?qd/r7YFee68EDf+EZzy3ZlswAIkCGUy2l2USl9wsc+Y4HZgcJUAdl/8CXA5y?=
 =?us-ascii?Q?nfqOEMvWL6gXP1apdKg15JdydaZ/+rc9AJJVS4CX7wHxEk83jh0uII/UyLp6?=
 =?us-ascii?Q?MgrPgb4l6VCgr0afvFlUd7lIRRI3I2376ZF8Fa1//xdwfEtA5w0Nn+VLTzbT?=
 =?us-ascii?Q?VU4M4z6ZShei/bbmbKp9VLicf5GMzH7059XPiaAuach7yKse219isJmt5KI8?=
 =?us-ascii?Q?jB4eT0TO8tzGeyWjiWNhlJh/RpsDguGa2IyD0mVCO59U3URmyZJjJyY8WEaJ?=
 =?us-ascii?Q?vhfk5I4fgu7363hkJHV7TCFFWennEivnO6rQDMHhl7sZKNV+CReFhWg1NqvB?=
 =?us-ascii?Q?o0RdTka2SXIkM7hn6cmGRLTGMh5z5UwAoJLRPi+7Y/GEPODmMugYV/CY/d5I?=
 =?us-ascii?Q?9XDZ6DJg5g8MrtlRdsFyBK8PUNWKYoQojuZAVlO6HGEBvJmVs/IGwa1sasvy?=
 =?us-ascii?Q?3+gNYbgQI/B91ge10/SZyc9tUpl6oIKUP1DY6TVKa3oYgHtZRu3P75Yw14a5?=
 =?us-ascii?Q?KHeiVjmsTzgNM+iZHdFhqnszB1FRx7QpNv9Wl8YVoPA/RipiFG6TiOqc5trK?=
 =?us-ascii?Q?BHi+fnqZpMLv+78riMuIS6ZhcNkw+uQ+cO3kjSndcbsrdfFATZuszVjz2plG?=
 =?us-ascii?Q?7ptlWASEBut8Q2euT/y247xK1wMVOc+cs04zBiv01oJ4Cd6m5/dZaYD52EwA?=
 =?us-ascii?Q?iKI5+5FHt+HbS0Yu+hXl55uOdYZamCIXm07WUvlCbRB+BXRS9tnjz6MKraqf?=
 =?us-ascii?Q?Wvu8KSmdKvyVu3IWOu0Rk1bgDVpFiodjls6Zeh+0CPh2apSOyeSyICUMc4yE?=
 =?us-ascii?Q?CubYlb4JenHVq8H/psBIYbwl5zuo0cFO7FVkmhJfNEtF0aQHBePllFxC5WCj?=
 =?us-ascii?Q?Yb6ZRD/sUbrd2UjThCR11tafRXIMRsg4iXsUTSXB2Rv4LxUUqHsTI5/sxiuN?=
 =?us-ascii?Q?L3otBbNshKJW2YFgATeksear/NU5u2mE7i5ve5tUMQHMoHpdGob8Y1krYlSB?=
 =?us-ascii?Q?5+1U6Iau3q0SNJy+SKGdPI3CQm+7AmVTC3vYqTZ1J2dGPUb9Hfm/EqjZQvJe?=
 =?us-ascii?Q?oPXNa7YoN1w5L2Xw85b5Khx73iY/bpjdSy9Xu63Q7o2sMGDs4S4++xtx34WO?=
 =?us-ascii?Q?DrufaLo2aF5BTAG8jAFTGy+xWglyYPdE/UL0plH+eKL5sMdCCPNSPXt8pOfy?=
 =?us-ascii?Q?Ix7O3eD8V7rkP+lu1tY6r0z8/34I61OiBx5kI452+kcDtUg9pbXsQkmG0595?=
 =?us-ascii?Q?19hScdkuYCnBmDWF37Z/h/G7c9103AwGCcX4uoSQY8Hz9Z+2pWceTiC9CZCz?=
 =?us-ascii?Q?BbTvLlChRKrrOMpKAYfECcoB6kpXFmWsedk11O1GAF9p9Cs6Zv9gFcjHlHdj?=
 =?us-ascii?Q?AQQeRGVngl9c57v/Ed5uHVrsWxwHS43sdc6K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:08:45.5317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869ebd4c-e0e4-402c-cc92-08dde61adfdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

AMD isp4 capture is a v4l2 media device which implements media controller
interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
be connected to a remote CSI2 TX endpoint. It supports only one physical
interface for now. Also add ISP4 driver related entry info into the
MAINTAINERS file

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
---
 MAINTAINERS                              |  13 +++
 drivers/media/platform/Kconfig           |   1 +
 drivers/media/platform/Makefile          |   1 +
 drivers/media/platform/amd/Kconfig       |   3 +
 drivers/media/platform/amd/Makefile      |   3 +
 drivers/media/platform/amd/isp4/Kconfig  |  13 +++
 drivers/media/platform/amd/isp4/Makefile |   6 ++
 drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
 9 files changed, 185 insertions(+)
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Kconfig
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..3ad845f1511b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
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
+F:	drivers/media/platform/amd/isp4/Kconfig
+F:	drivers/media/platform/amd/isp4/Makefile
+F:	drivers/media/platform/amd/isp4/isp4.c
+F:	drivers/media/platform/amd/isp4/isp4.h
+
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9287faafdce5..772c70665510 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -63,6 +63,7 @@ config VIDEO_MUX
 
 # Platform drivers - Please keep it alphabetically sorted
 source "drivers/media/platform/allegro-dvt/Kconfig"
+source "drivers/media/platform/amd/Kconfig"
 source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6fd7db0541c7..b207bd8d8022 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,6 +6,7 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
+obj-y += amd/
 obj-y += amlogic/
 obj-y += amphion/
 obj-y += aspeed/
diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
new file mode 100644
index 000000000000..25af49f246b2
--- /dev/null
+++ b/drivers/media/platform/amd/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+source "drivers/media/platform/amd/isp4/Kconfig"
diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
new file mode 100644
index 000000000000..8bfc1955f22e
--- /dev/null
+++ b/drivers/media/platform/amd/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-y += isp4/
diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
new file mode 100644
index 000000000000..0268060c2dae
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config AMD_ISP4
+	tristate "AMD ISP4 and camera driver"
+	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_MEMOPS
+	help
+	  This is support for AMD ISP4 and camera subsystem driver.
+	  Say Y here to enable the ISP4 and camera device for video capture.
+	  To compile this driver as a module, choose M here. The module will
+	  be called amd_capture.
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
new file mode 100644
index 000000000000..de0092dad26f
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2025 Advanced Micro Devices, Inc.
+
+obj-$(CONFIG_AMD_ISP4) += amd_capture.o
+amd_capture-objs := isp4.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
new file mode 100644
index 000000000000..6ff3ded4310a
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -0,0 +1,121 @@
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
+	return IRQ_HANDLED;
+}
+
+static int isp4_capture_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct isp4_device *isp_dev;
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
+
+	media_device_unregister(&isp_dev->mdev);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
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
index 000000000000..8535f662ab49
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -0,0 +1,24 @@
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
+struct isp4_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+
+	struct platform_device *pdev;
+	struct notifier_block i2c_nb;
+};
+
+#endif /* _ISP4_H_ */
-- 
2.34.1


