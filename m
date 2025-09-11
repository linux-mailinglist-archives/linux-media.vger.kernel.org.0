Return-Path: <linux-media+bounces-42282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F38FFB52DFA
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FD231B2732F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C360530EF72;
	Thu, 11 Sep 2025 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1imfEQw9"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F3330F94A;
	Thu, 11 Sep 2025 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585368; cv=fail; b=jHZWlWNGh3YDUCCcNPFDtdyYJz4ML0RwWJIMcULUD7wpRM6BfvsFYhdk08vK01GlZaxqD8+sFZ3mX/B+R0xJl7yB7K6tp7zJsWeOn6Jt63oS9RRpVY85Ch/SXleMegz37WY4GH+k8WLEbwUCUrjam7r8KzgkZqWs32HHzJLo6wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585368; c=relaxed/simple;
	bh=JYzHkygedXBa56AGC/7+Bl1vSwIH3/Rj/rK/ZL+/yg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAAZGps5QfbH5f5fY7OgSg2fppfaRy1eYmO6Qq70d3EDyI1tyk65R11qwC1uemPm9Gi3cGd8rlM1kjRf/c2IXuMJq1ahtsN83OA7cHnKLvQvN2ZEoQ4bAENrIOe4c9L6mgbh4Z/v3QI7A45wzX6AdzhlthxT2qjka5C5nXKek+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1imfEQw9; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmkNRuu9UZj1ofc9VzWn9FdLLkoEEFUSIsD/BppMi58k+TvIkOH/tBZqImOQb9H9Jo1Qj7dgPtMTP2N87eKMVLMfUTdBQEU3a65JTtnv4WKsPuqbccpJN3M0Vx8D/HIbG3U08kMvWVJYMP97Wt4RACPEu8G7BDQz7v23hERPPFNGS0iIC4gudQ3p2CmwhOA+a7QezIgJf10XPiUmGEAQWoRH8/lSov9N2YwsbdgpQVnUZfOkhgRoXjxWLWMvnnIvthof9SyADg1aYJegifmpTscY/G2Oubm1G7MOhnl6Bi4LuzRlzMfLDBgu8O9ZJz9/SntMrmnbPxLPzaw7oPsImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ060zuH9/cvSck7FBxtcklV9wOYJBzlbtOeiK/ofKI=;
 b=KPQlcocn4sZPgM/se8eJE9PdLo4ZgUUh1YMsU13f7fScngqYLje3sJwbtaMwqj/WdtQzL5dK65HWaX/Q40UCi/7fUgZlfT7oC9RfR0NdmtRibrph1UPADGXVrS7USIEqr6VVoLWsBSG0eOY1gOsppS+xZ47H9drEHchun8qk5ib/aWiBkyC5mRx2fMpCYqdPHwBkJGxHA1J1rCOJK6r24QoHTCXrqHLuV9EJuHizT4gsXVppbLYzBDUk/fnXDCoSUX4gH5HoMsl1mjNGNoLNKb+lr/FxfxxThWbVN0nNhGD1NPEZPM26ZwYJhWUnqUh17rlwHaQt98m+BXO6hy/EZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ060zuH9/cvSck7FBxtcklV9wOYJBzlbtOeiK/ofKI=;
 b=1imfEQw974T+ll08tURSHswMKT2tFQmBx1XHy+8H7dCYfZFJbjO7Uv5THL1No14bnImvPAYk5GW+AWFMHbwM0neVxpspIpnJvymDgDL/XKG3NWV3A7eUohDrbqCm1lcFvkTWzhXUd6ET61DMXeo2m5GVB7YJV14rTiUpMKk90H0=
Received: from BL1PR13CA0405.namprd13.prod.outlook.com (2603:10b6:208:2c2::20)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:09:18 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::4d) by BL1PR13CA0405.outlook.office365.com
 (2603:10b6:208:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Thu,
 11 Sep 2025 10:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 10:09:17 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 03:09:12 -0700
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
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>, Alexey Zagorodnikov <xglooom@gmail.com>
Subject: [PATCH v4 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Thu, 11 Sep 2025 18:08:41 +0800
Message-ID: <20250911100847.277408-2-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c888465-57b7-463a-6cd3-08ddf11b44e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lz0LVVj5oqUGgRt+OCGJR3FIEMrL7i98EhZbvJBkbc6W1DmkHy+3CyHHO255?=
 =?us-ascii?Q?pZs0g1G8fFF6GmKmCLjMeCWVawLYaMJii+Ny1708/pXrVm7gti3b9z89H6tC?=
 =?us-ascii?Q?6VTDx/36tng2+ieNlxftZxTLtP6xVuCh8KF+xm2KJvWF8EJFc4pLHYwVtPQE?=
 =?us-ascii?Q?Uhtos5QroafF0YSTDXhtR2xW014u/n1ETOxL4b5Ca/m54vQTZQcWHuSlF0yR?=
 =?us-ascii?Q?9FRD1cssEtSdY/z5IB4ZaIoxhgJ3Jxhn+dRSPNW+5GxLUmASa29w67bcAaPn?=
 =?us-ascii?Q?eOzRFsCUr0yQm7PTo88WJ36X5j/HAiH+uMlM949eG+hQaSEo++8t4/BIrARj?=
 =?us-ascii?Q?E7LeaCBhM6Pe+pSc49msRZOxkgmn+I2a/gmt8Y8g+0BgpNJv0oA6qxichajL?=
 =?us-ascii?Q?Vz8K2a2ZlEkx9L7kD9uoV8tk51CpVLHaCN7SAgUhNnDtgbwgJaLLHiTI4PLI?=
 =?us-ascii?Q?8STr+JaMUFXdQEAz1MwAi1RFYOVEghgwCelqVGjYk11wmQK5E11B1/7AFMXg?=
 =?us-ascii?Q?DjKHTuUHlFDpw+8tMeqOagLvnpfX9X6uoCKQHV6XXHekPL+qdmYMey02poW+?=
 =?us-ascii?Q?DwP7g/rQm0OA91FGGJ0kpJ3tiBwJFkxBpVWHUvQhrIfwHNiMC8zbPiWbSnpj?=
 =?us-ascii?Q?MAofrWBkJnRyAafdVCcQGA8Lssbg8XhHQV+PjWPf51+xo2keceOA//cgQKfG?=
 =?us-ascii?Q?uTrqqDBs+CjFGwqGluIoiFAuF3jRPHRW1alyzRk8hqLF0etOr+64l6DNzcrB?=
 =?us-ascii?Q?DBPMiYe78lWkm8LX9i9hKurwXqCZWMFC2tbUpQr5VjUEDX++7EcbPESDhXSV?=
 =?us-ascii?Q?8lMUBJVn96AE6bXggKWEUMRPww3A8eAAnQmSRfhoDrr4OZhHk/Iky8a3yseg?=
 =?us-ascii?Q?oMzahPXHdWHmyO9FmqMt/dUj6OHhfg/vMkibCUFIZIwPyjxl3RoK/OvTJ9El?=
 =?us-ascii?Q?G4NZpdgwMuuRof1ntuCyXqcbdI0D2VT6YoxmZ4WY8CXCUZmiwAusk7iGdQLo?=
 =?us-ascii?Q?ATSpV/JoQP5fbUs2bTBlPJpijqHjWBg7Ai8OCpfs+VIA8fOCcA4yScFJXlGj?=
 =?us-ascii?Q?2Kbcgv2MVkTLFpKMo45/97/WGlsVOogPt1KD9Llaw5mjhGbIMsltvgxtNRos?=
 =?us-ascii?Q?YWEMBSsP7k+GmpCtSEk/DQFi8taffPOiBxeceQmZ/80sfuoOhOBacUm4uuQi?=
 =?us-ascii?Q?hZJ9Zg3nQbWJ/xsPM10hN2Zqcd1BaeztwSBeJLG81HlL9BqyqWsdBVFWHx22?=
 =?us-ascii?Q?vVRLixxbFBckPyqyL+zk0agr2VriB1K8H3nJ2R6HJ9fUqCLZXvHHJYd56wZM?=
 =?us-ascii?Q?5pe/vdlubqEED7BfNZk/ajBMtJF332PwUiGZ/mKSaFf9vP/owTfOKil0M8/7?=
 =?us-ascii?Q?eVnpfYttfFOjvPkYl3jw9T9oGQgdUd19L0lTmwe6+7Dy3fXXJ/NjD3X4Y4pe?=
 =?us-ascii?Q?hjticHbLd8dKZ/OybD3CG1DF51CA/9wigZ+F5G/UByny6QLZhfZxB4o8ef95?=
 =?us-ascii?Q?TqAVapUClD8MFEh/m2/7wDW20epPs+xRZ7+G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:09:17.8024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c888465-57b7-463a-6cd3-08ddf11b44e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425

AMD isp4 capture is a v4l2 media device which implements media controller
interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
be connected to a remote CSI2 TX endpoint. It supports only one physical
interface for now. Also add ISP4 driver related entry info into the
MAINTAINERS file

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
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
index cd7ff55b5d32..3640a1e3262c 100644
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
index 000000000000..52962eee8564
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config AMD_ISP4
+	tristate "AMD ISP4 and camera driver"
+	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API && DRM_AMD_ISP
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


