Return-Path: <linux-media+bounces-45464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D4C053DC
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC971A62433
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF3A3090CA;
	Fri, 24 Oct 2025 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3gHxlFo3"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B440308F19;
	Fri, 24 Oct 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296837; cv=fail; b=dRsftVZV2VhXo4Hq1tMx6Buh9kp7V6mvHHeOPwZ4BXyt3OmU5+0VeeBQuGnCE1U1FDCeKhjR4vgx3I6hkqjMXXfc9M6GLitDxjrlm+IyKmVO5NUB0/sKYwAnb8JIG3OHWBrkskAlgz8PkGK/OKwFnJqAB9BFD6EPnfVEzz4f8Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296837; c=relaxed/simple;
	bh=u3TNu7rCZjunFkNZfmOTM8btFUwMyxteX1HYJmE4PFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M67Unn7dAdVhQzeihS9kVJp5WAr+1S5mRptUzr2vb1ZeqISvhBirtslXP9sjNR+X42Di4itw3fYhQoSomUzUagvVQFEPeUeEA/ue6eyjIvuUc5N6sixtkGI94V/941g6JLVEFrWZsMWQsD79FyaM+e8ooE/It3a37kcVAsa+uzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3gHxlFo3; arc=fail smtp.client-ip=40.107.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAQD4SPt/wyu7xLA/iZ2gEU8G9sXdmVvXxl03vIDUlJI/WYR25rIKAU/nTUQcOoDFnwvCfEEsIL8GRY0izfMHSd0MxWh1LZRSKpvk/I3I03NZekpfP0sPc4rrGY8WFJuaNThkfPG8AQ9mphF45isOi8KcsQvyBzTzRUZMJtu/4o3JQAkOIpA9svnKEPUmRBSQD+OtVtAWTMnyfg+V+YWiPxL+O1/JFWWC2zO6Z48ehPUqbjAfUENp60EyXM5pL3xNGIePNrjJ4Q8GPp33ug83ZCykwAwloaj2be/g2jlaOKmQ31Zvqd7MSHXU2bnPNv49oRKlM3gvbbRT4+WDxJqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDzVnrHv6FqYsJBCcIuzJYyI+evvdtHLcduveVIfMK4=;
 b=NeLa9jXwLKeiCcl7IezYUL9mbrojMPmZSslwSdkRxbSXVav1K3TAjRAC2wt3UwD0Ca80bKlKEO9DMpuURiARTTvWeda4tA7GlWiI+5o11rMoOC+SvgEr78IzOvGFT14+8Tii6xdqPPV65pBzAphXXCjyoysz+lZ8vmcH8b0+58Q+SkN7svOfr/VDNupfM1VOXI4+z6S+/+Np6864JFax/4p+HRP4I/9CQfG/awgvfsck7RbpU+vWQvxiwIMpOji5YaoTavhqpFq5DDypq0ghCyYa1LQEDGi6SmJNTy3D0bXLngY0e4n2SnQDH5ohej8FnT/YMPHt2ICEoqwjC3YDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDzVnrHv6FqYsJBCcIuzJYyI+evvdtHLcduveVIfMK4=;
 b=3gHxlFo3nbhjkISZ2WxTowwIo04fHpdhfdiYZtXXO5i0PUoznxS6Pq/4UmrtuuXuxpDH8mi8fzb6InKyyvH32AssEVqGmHloKBCWIKDxBNjY1/tuyD0RhlO2LhijAEIU0gwZSn83NUaTSAdfxSaGSn4SAoIYIArtZdGPEE9RlnU=
Received: from SA1PR02CA0007.namprd02.prod.outlook.com (2603:10b6:806:2cf::18)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:10 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::3f) by SA1PR02CA0007.outlook.office365.com
 (2603:10b6:806:2cf::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:09 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:07:04 -0700
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
Subject: [PATCH v5 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Fri, 24 Oct 2025 17:06:37 +0800
Message-ID: <20251024090643.271883-2-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024090643.271883-1-Bin.Du@amd.com>
References: <20251024090643.271883-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MN2PR12MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: 314a1588-eb2d-40bf-5ba6-08de12dcb68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AtNlSnCcsQcxwEXVz7flUKArE2eff1fAcBFcFgB19OVHOyw/rJpj9Lhppu8j?=
 =?us-ascii?Q?ceW2sMFAAd6l6NN2cM1nRjpSoGRJqP/wir5r90uhGvIB4qJrfO1ndPddq2gF?=
 =?us-ascii?Q?izV8xR8g6vBQ9f5BuqLWMO6n6KAbco2ibZrZO4miHi63trWJVTOi88zbm3tP?=
 =?us-ascii?Q?pEXv49HmLXHrtHmZIHkIo3VxnlslKAhnYLiInGIQ+fTiN/m5wM6kMp4yUBfj?=
 =?us-ascii?Q?QlMRqSkXlFEf4mN+o+P6+Jsc/Gfdwa339LJZ/GbKyc/AryHgd/PTpUxAkTNQ?=
 =?us-ascii?Q?OSMrdJwH+98Rs0obf5fCAW5+Y/KmiqJyfy2l+Q9GF7/i+1xkJTk8hPy9M/75?=
 =?us-ascii?Q?/HnOGnYnzcQ+7HMpIYBNyhFfOPwlFfPdut0jmUNLXXizUUp8fBAiHcOIDRAI?=
 =?us-ascii?Q?AO+pi7GjJA2Kb0DC5an4uPkuudKonRgjwtHxSHXAmqMK3Stuul8p4bIaee0h?=
 =?us-ascii?Q?ZC9UI3uPX8gZE6jjBckmBlEq5efEACqzXKuDWfAiTc003gcnDxKhiigG5Nbg?=
 =?us-ascii?Q?QYHev6K6fHibZiWup0ELKa4N5UXxNepncdU4HWsCb0TP0QJVeNkf0xrHccyw?=
 =?us-ascii?Q?SaKl4jEvDRJjqcs9T9y9wUvcKA/9b6dp/HieUwUIbUqsCcLwBWqYEKUPivvu?=
 =?us-ascii?Q?CrWf27WLMID0Cb04wRtfTeog1yqfo2Zgi5v1Vnt4Uxs1aD657wnnTu8z2ntc?=
 =?us-ascii?Q?0a1TLT6Tb45JHTsVA8v8LQC3dC+rUPFh6TTwbWwkIyf4+nbPHytd/p5yrIrO?=
 =?us-ascii?Q?InW4BDwWlbyJr3m2cwzJzw4r6oSIVa6aCj9DREKEPxzkCZPIdu1lYSMCO1ME?=
 =?us-ascii?Q?1UnedYSDexEHg0rDbx9h7PFibMgyXrBrt29rsmSQDU0dVHCrsnZ3pcAiv71G?=
 =?us-ascii?Q?ga+W4mRThM6pKIu9G3Yck7twRiwfaJfxKSkXD4nWDVvIjLLY9SK2seoSvShm?=
 =?us-ascii?Q?LqU9oACwTxkYNsLDBcn4XHm8Edit1MUbf+2O/jD0VyaxLvqxus2VTwczH4fa?=
 =?us-ascii?Q?TMZ596PBNRZFGMowLkAGZk5C65FzGhccHKv8FH/rGaDOAwh9p2ls3T1cEGqN?=
 =?us-ascii?Q?WR5Q3hnUtaStVVwZFjPTYBVDkQZgtofMiI/ojrE1evTrYNK/uSyHwLVYcgFa?=
 =?us-ascii?Q?vICKzI7XPEEf5vfskw/yf80t48ahmTzhOOXdAC55QMteTpT55eP0/HPTiuoa?=
 =?us-ascii?Q?rbpOLCS/2Zciu1tXRxw1lnTlnmiPHE3ApPalVUNeGxQPYPu5YOZoyKAJDM/s?=
 =?us-ascii?Q?DiSV4RieMYmMXrmdsptU1TFKwATZ189ZLI6hmN/x6Rv+3p78NhsPX1mqflhV?=
 =?us-ascii?Q?3OxHftckb0Hu5Lup5t5L7Qk/xoMI3OqSZ/9O+AbU1D8r5w7wK8uXj3Qy9/8/?=
 =?us-ascii?Q?lKlU2LNLTAl03rsc+EZJZlCxIhbs4aqoTD0DDSxPeVjjFyDJ/kGwVpVNezTR?=
 =?us-ascii?Q?DrbgeRWFJWv5eICAgu6dBhk8YPRjOW3htb8rXg0TvfBNfWlG31doOE4AK+cg?=
 =?us-ascii?Q?8jL22S641DOgl32vxI4B0Nz147HHDAaLn6jGivUE4hItKJUcjjCAEKORahP2?=
 =?us-ascii?Q?RQadcVrGO5hg3KVmqzg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:09.7359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 314a1588-eb2d-40bf-5ba6-08de12dcb68d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190

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
 drivers/media/platform/amd/isp4/Kconfig  |  14 +++
 drivers/media/platform/amd/isp4/Makefile |   6 ++
 drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h   |  20 ++++
 9 files changed, 182 insertions(+)
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
index 000000000000..d4e4ad436600
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config AMD_ISP4
+	tristate "AMD ISP4 and camera driver"
+	depends on DRM_AMD_ISP && VIDEO_DEV
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_MEMOPS
+	select VIDEOBUF2_V4L2
+	select VIDEO_V4L2_SUBDEV_API
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
index 000000000000..a3fc2462d70f
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
+const char *isp4_irq_name[] = {
+	"isp_irq_stream1",
+	"isp_irq_global"
+};
+
+/* interrupt num */
+static const u32 isp4_ringbuf_interrupt_num[] = {
+	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
+	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
+};
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
+	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
+	if (!isp_dev)
+		return -ENOMEM;
+
+	isp_dev->pdev = pdev;
+	dev->init_name = ISP4_DRV_NAME;
+
+	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
+		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
+		if (irq < 0)
+			return dev_err_probe(dev, irq,
+					     "fail to get irq %d\n",
+					     isp4_ringbuf_interrupt_num[i]);
+		ret = devm_request_irq(dev, irq, isp4_irq_handler, 0,
+				       isp4_irq_name[i], dev);
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
+	isp_dev->mdev.dev = dev;
+	media_device_init(&isp_dev->mdev);
+
+	/* register v4l2 device */
+	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
+		 "AMD-V4L2-ROOT");
+	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
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
index 000000000000..326b8094e99e
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_H_
+#define _ISP4_H_
+
+#include <media/v4l2-device.h>
+#include <media/videobuf2-memops.h>
+
+#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
+
+struct isp4_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+	struct platform_device *pdev;
+};
+
+#endif /* _ISP4_H_ */
-- 
2.34.1


