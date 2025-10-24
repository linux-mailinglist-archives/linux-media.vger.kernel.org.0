Return-Path: <linux-media+bounces-45470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DEC054DF
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3C7424204
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BAA30BF4E;
	Fri, 24 Oct 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KF/DFu51"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129513081D9;
	Fri, 24 Oct 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296876; cv=fail; b=G5HjNq+5auXSid1dAcF6CDydP9BWyg2lWBlqyC2tfll7x4qy0TCBoQKu/dhhg8SckfuKfK7NXTiFor8bt6haAtPpaVpG7OUwLf4+cn3j5wcCJ3dwFzB0UoKyF9s6F0vqjWQddnXYpjrRS4PByXF54rfqOrDdxrTidAyAaj6xqZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296876; c=relaxed/simple;
	bh=YsZvsPS4UWAn0PdI/SijuexOdCaHZZirlde7/CFWFOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRTEibvZlP0yKAmHHV4FcVIuw8q0iUetTZWx8MB1/ClfZRyrrejO7YMidq2GYLtiOCCTWAzr34jseDml1kf0EsN3yFHcGLkmfuBxc5FDTXirGxkyHjhUd7FF4bLp8b0/K7YA2XzWecDPxBfw+tQCBowTJTELHn21mJ+0QvPPw5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KF/DFu51; arc=fail smtp.client-ip=40.107.208.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIcmn7+OTAdYs9qhF8KcRD+hxm3cdJHFiiulumwj8URoqg5fT4Qay5sVN2CLk+jlMLdmgFE4zfOy/V2uUd556KJKVfoy64vDohlSBnQ2LgN47/xCuSiAdylg4OtMwqSlzV+ssaY+evT41obYlNrllB5WtClwHHA9qqiaU+6+ZGvQjkYCQdJb922hc0vHO9+X5pSk/PZkr8Sj1/cc9YDkVxGMCSXhie0ehk5ckHONeGMSCZr/Q4rx+HwMycwvjZzguDLCF2l85byTLrAW5gwl0jqtOTjXivB2V+row4E3r5cw0fEiSH5SdyA3bdkMFXbxVZQEpp2bgJceZa7z7/9BFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTTtmBXm02SOJZoLp4DnmQwAye+ZDvWxOC5AkBUDnJU=;
 b=YmjsOVsIuJ2jvlF9/ccZ/A7TPx/lIeVPbqXx9IGXjo0tmfVUBn2zY+F4aUxw1XdpL/NLP7MBlGT8dfGb1RJj04pBAcOt7t8Rv/Pf1g25IPqHOQWkusmqZ1x/A6KU0UHchP24gV24gDbvRkNH/KnatpjJ4EKgZ2kMO2KpxVsDajbe5najLklFMwmD1E9nPobqJfFCmvldAvWSlldzbykbe016DW/NuFrrBfK5Sg9pXs36mPIJpeKhjBn0fyH+X0TA7FrCKtiPYUiJ0Bpm1QPhWlbNbYtmYTKdnCNIu/fc+eWw/FHy6oJ2cqwj5VBQ3brFK2wixNmTQme/EdpGyaCwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTTtmBXm02SOJZoLp4DnmQwAye+ZDvWxOC5AkBUDnJU=;
 b=KF/DFu51i6r1+iG9Fzq/HHypssi7PWjKNU8W4N5Wm+7Xvw3KgHR/3vpZwrjEa8JzzlTxTnX41cP8O3UQFy3G240MFkrUMuw+JgDY2w2ZqHC4b76rk2/QcrqPH8bSWhCm2LU8TkpBdPZi7J2XO+n5rTUA45cJaUlvpTZUg5KDjg0=
Received: from SA1PR02CA0021.namprd02.prod.outlook.com (2603:10b6:806:2cf::20)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:36 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::4d) by SA1PR02CA0021.outlook.office365.com
 (2603:10b6:806:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:36 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:07:30 -0700
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
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Alexey
 Zagorodnikov" <xglooom@gmail.com>
Subject: [PATCH v5 6/7] media: platform: amd: isp4 debug fs logging and  more descriptive errors
Date: Fri, 24 Oct 2025 17:06:42 +0800
Message-ID: <20251024090643.271883-7-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: a63e40d8-3275-4649-6d58-08de12dcc671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2f7HeUpovMHaqDSlJM0k9Cz2GfPJA0l7JqQkr4XwFBkXMaGpEEd5XaabxV5?=
 =?us-ascii?Q?KbAmfDYmcdf2UXckftp4EJpdKJhTQoM0VZeFGT/g7jP+eXrJqgiCm4CGL3oV?=
 =?us-ascii?Q?9n1x4+3aw8FzShLVw/z8u4Lej9ImtlWtVm8QZxHxwQYJhPHvFzG+70BXyHk5?=
 =?us-ascii?Q?F9/irTd5Y0bBej+30rmzLDnSAmq40CiHQcJsoFTwrKzjOX+Y24qK8cyuDUua?=
 =?us-ascii?Q?wKKOll9/4LDJSdL9QQ/jhVyWTK9GQcU92ie7h95TZk+XpOZXapnC5YKepqD2?=
 =?us-ascii?Q?+EiLzxlCw45rs1zJB0olr4IEkQFyaGZ5V/KTsybkGDra8X0h/MZEVNU3yUXL?=
 =?us-ascii?Q?6pK63nheOaO64y1tINlNEqeP/EVGfQwoIKQ9RkwG3P8GP34y9QWnM61eRMKB?=
 =?us-ascii?Q?D/JhQiXiDT6QMxT/PTXttuZ1LZVIHNdSEYgLwK5gf9Cti+E9JjA7RGN40mrc?=
 =?us-ascii?Q?uItgvS737Kt09DLQgDS2paKv4jW7NfP1V1TNzsHM4K1n5zD4d0PJ0uQ8KX3l?=
 =?us-ascii?Q?mSrh+4zixy01k+xssQYKnxkePwY4zmDxkrnOBCT+COy70Clj9/RF17EnupYQ?=
 =?us-ascii?Q?9dkzTColGxgizfQNVO/u3vRLs1WiNqTIV7cowNgki/SqsCq3FcSA8mWLWt4j?=
 =?us-ascii?Q?w1xrV7TacnkKSRr1kvKWCLy1SCNhbWwK1Oy4FaKiDZJdQQzqZdyIPPDlZiZP?=
 =?us-ascii?Q?FYMINnrMHGLBV8pSUryqkKiH4ywO1nYMsoJG2wU/gzyz3xWYjS9bdIOydtvO?=
 =?us-ascii?Q?wCmSUSyOFYnwuS4/aqpvdkix4IcEi+Dupg1TKTiCzBCLtqnK/F2EtmhaLdrW?=
 =?us-ascii?Q?PEX4OFDpediwEugc4ioC+Aeg466V9K5jYVFXBwqMpPCohGKPkeqEmYg5pKJv?=
 =?us-ascii?Q?cD9cA7aItVYRG6iAp1z6lbk1Oc2DHah1lJLF+m4j8JyJx27lWR91IjMVEtVn?=
 =?us-ascii?Q?GY0H6Y4+xdzJXbNatksntHcXACl0aIJrMnYSvCW5OzZDfmt+LIRgqz+Y7lkR?=
 =?us-ascii?Q?UrD4ifJKWHI5V+H0Zh5Q3Hk8RppPk8ei52LnSZaX3f8eGGzLCvTQ4I4iFbQZ?=
 =?us-ascii?Q?TBd2+dGGhABMxYNOJP06qh2dn0MoMjkbeR9XZhBHVLM7fzV81MdcBDCiKSRF?=
 =?us-ascii?Q?K7k+g0nyW84FoAohbVyzURD5rPYHy4wglCywUrkxP1I/b6Ltt75kjMLh4JuW?=
 =?us-ascii?Q?aHpBphp5a4UvxOTgkchCQ/44b+fhukYTg8Dg/3NDqK/UFVJ2r9uGInqNnQSS?=
 =?us-ascii?Q?uz/hg03CdAHZIBylsoXGvNpSVgXA2Ifqn0yzG8CADqYogkvt5O+izawZ3lGP?=
 =?us-ascii?Q?vh3APDflAhnmQLuuk+9XhpT2KPVMCGbzrmS69eJObKGgCZzN4X55/hXc8gOz?=
 =?us-ascii?Q?tb2aFNbV0VSBbL4meDcfdtWk/KBT+kkcgMd0iVOekJL+VfJHS8+rYdnFZbGI?=
 =?us-ascii?Q?iaOrg/oBC9sdgG3A5Vbbs1efivvsdfEgqGO12HkcBorfhGgxETANvzw2epXA?=
 =?us-ascii?Q?oxj8uQD1ZXVdqGvzbL22RRo4gC+LJzsTwCb+YQhmqMuIYnUSVQe2JGDgFQse?=
 =?us-ascii?Q?x6qBAOPoa0oxWP62Re0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:36.4009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a63e40d8-3275-4649-6d58-08de12dcc671
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Add debug fs for isp4 driver and add more detailed descriptive error info
to some of the log message

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 MAINTAINERS                                   |   2 +
 drivers/media/platform/amd/isp4/Makefile      |   1 +
 drivers/media/platform/amd/isp4/isp4.c        |   4 +
 drivers/media/platform/amd/isp4/isp4_debug.c  | 271 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |   5 +
 .../media/platform/amd/isp4/isp4_interface.c  |  62 +++-
 .../media/platform/amd/isp4/isp4_interface.h  |   3 +
 drivers/media/platform/amd/isp4/isp4_subdev.c |  30 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h |   5 +
 10 files changed, 404 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 80c966fde0b4..8478789ac265 100644
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
index 398c20ea7866..607151c0a2be 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
 amd_capture-objs := isp4.o \
+		    isp4_debug.o \
 		    isp4_interface.o \
 		    isp4_subdev.o \
 		    isp4_video.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index d1579cc41c3c..78a7a998d86e 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-ioctl.h>
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_hw_reg.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
@@ -163,6 +164,7 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, isp_dev);
+	isp_debugfs_create(isp_dev);
 
 	return 0;
 
@@ -179,6 +181,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
 {
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
 
+	isp_debugfs_remove(isp_dev);
+
 	media_device_unregister(&isp_dev->mdev);
 	isp4sd_deinit(&isp_dev->isp_subdev);
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
new file mode 100644
index 000000000000..746a92707e54
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.c
@@ -0,0 +1,271 @@
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
+	isp_dev->isp_subdev.debugfs_dir = debugfs_create_dir("amd_isp", NULL);
+	debugfs_create_bool("fw_log_enable", 0644,
+			    isp_dev->isp_subdev.debugfs_dir,
+			    &isp_dev->isp_subdev.enable_fw_log);
+	isp_dev->isp_subdev.fw_log_output =
+		devm_kzalloc(&isp_dev->pdev->dev,
+			     ISP4DBG_FW_LOG_RINGBUF_SIZE + 32,
+			     GFP_KERNEL);
+}
+
+void isp_debugfs_remove(struct isp4_device *isp_dev)
+{
+	debugfs_remove_recursive(isp_dev->isp_subdev.debugfs_dir);
+	isp_dev->isp_subdev.debugfs_dir = NULL;
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
+	guard(mutex)(&ispif->isp4if_mutex);
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
index 000000000000..1a13762af502
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
+#endif /* _ISP4_DEBUG_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
index 6697b09270ad..09c76f75c5ee 100644
--- a/drivers/media/platform/amd/isp4/isp4_hw_reg.h
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -14,6 +14,11 @@
 #define ISP_SYS_INT0_ACK		0x62018
 #define ISP_CCPU_CNTL			0x62054
 #define ISP_STATUS			0x62058
+#define ISP_LOG_RB_BASE_LO0		0x62148
+#define ISP_LOG_RB_BASE_HI0		0x6214c
+#define ISP_LOG_RB_SIZE0		0x62150
+#define ISP_LOG_RB_RPTR0		0x62154
+#define ISP_LOG_RB_WPTR0		0x62158
 #define ISP_RB_BASE_LO1			0x62170
 #define ISP_RB_BASE_HI1			0x62174
 #define ISP_RB_SIZE1			0x62178
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index cd32a6666400..1852bd56a947 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -5,6 +5,7 @@
 
 #include <linux/iopoll.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
@@ -110,6 +111,17 @@ static struct isp4if_rb_config
 	},
 };
 
+/* FW log ring buffer configuration */
+static struct isp4if_rb_config isp4if_log_rb_config = {
+	.name = "LOG_RB",
+	.index = 0,
+	.reg_rptr = ISP_LOG_RB_RPTR0,
+	.reg_wptr = ISP_LOG_RB_WPTR0,
+	.reg_base_lo = ISP_LOG_RB_BASE_LO0,
+	.reg_base_hi = ISP_LOG_RB_BASE_HI0,
+	.reg_size = ISP_LOG_RB_SIZE0,
+};
+
 static struct isp4if_gpu_mem_info *isp4if_gpu_mem_alloc(struct isp4_interface *ispif, u32 mem_size)
 {
 	struct isp4if_gpu_mem_info *mem_info;
@@ -153,6 +165,7 @@ static void isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)
 
 	isp4if_gpu_mem_free(ispif, &ispif->fw_mem_pool);
 	isp4if_gpu_mem_free(ispif, &ispif->fw_cmd_resp_buf);
+	isp4if_gpu_mem_free(ispif, &ispif->fw_log_buf);
 
 	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++)
 		isp4if_gpu_mem_free(ispif, &ispif->meta_info_buf[i]);
@@ -172,6 +185,11 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
 	if (!ispif->fw_cmd_resp_buf)
 		goto error_no_memory;
 
+	ispif->fw_log_buf =
+		isp4if_gpu_mem_alloc(ispif, ISP4IF_FW_LOG_RINGBUF_SIZE);
+	if (!ispif->fw_log_buf)
+		goto error_no_memory;
+
 	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
 		ispif->meta_info_buf[i] =
 			isp4if_gpu_mem_alloc(ispif, ISP4IF_META_INFO_BUF_SIZE);
@@ -296,7 +314,8 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_st
 	len = rb_config->val_size;
 
 	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
-		dev_err(dev, "fail no cmdslot (%d)\n", stream);
+		dev_err(dev, "fail no cmdslot %s(%d)\n",
+			isp4dbg_get_if_stream_str(stream), stream);
 		return -EINVAL;
 	}
 
@@ -304,13 +323,15 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_st
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
@@ -390,7 +411,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 		u32 wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 
 		dev_err(dev,
-			"failed to get free cmdq slot, stream (%d),rd %u, wr %u\n",
+			"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+			isp4dbg_get_if_stream_str(stream),
 			stream, rd_ptr, wr_ptr);
 		return -ETIMEDOUT;
 	}
@@ -438,7 +460,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 
 	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 	if (ret) {
-		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n", cmd_id);
+		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
+			isp4dbg_get_cmd_str(cmd_id), cmd_id);
 		if (cmd_ele) {
 			cmd_ele = isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id);
 			kfree(cmd_ele);
@@ -533,6 +556,14 @@ static int isp4if_fw_init(struct isp4_interface *ispif)
 		isp4if_init_rb_config(ispif, rb_config);
 	}
 
+	/* initialize LOG_RB stream */
+	rb_config = &isp4if_log_rb_config;
+	rb_config->val_size = ISP4IF_FW_LOG_RINGBUF_SIZE;
+	rb_config->base_mc_addr = ispif->fw_log_buf->gpu_mc_addr;
+	rb_config->base_sys_addr = ispif->fw_log_buf->sys_addr;
+
+	isp4if_init_rb_config(ispif, rb_config);
+
 	return 0;
 }
 
@@ -647,13 +678,15 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
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
@@ -668,7 +701,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -694,7 +728,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -716,7 +751,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
 					    rreg, rd_ptr);
 			} else {
-				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
+					isp4dbg_get_if_stream_str(stream),
 					stream, rd_ptr, len, wr_ptr);
 				return -EINVAL;
 			}
@@ -732,9 +768,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
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
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
index a1649f2bab8d..688a4ea84dc6 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.h
+++ b/drivers/media/platform/amd/isp4/isp4_interface.h
@@ -28,6 +28,8 @@
 #define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
 #define ISP4IF_MAX_STREAM_BUF_COUNT 8
 
+#define ISP4IF_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
+
 #define ISP4IF_MAX_CMD_RESPONSE_BUF_SIZE (4 * 1024)
 
 #define GET_ISP4IF_REG_BASE(ispif) (((ispif))->mmio)
@@ -92,6 +94,7 @@ struct isp4_interface {
 	u32 aligned_rb_chunk_size;
 
 	/* ISP fw buffers */
+	struct isp4if_gpu_mem_info *fw_log_buf;
 	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
 	struct isp4if_gpu_mem_info *fw_mem_pool;
 	struct isp4if_gpu_mem_info *meta_info_buf[ISP4IF_MAX_STREAM_BUF_COUNT];
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 56335803e378..17480ae5150d 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -6,6 +6,7 @@
 #include <linux/pm_domain.h>
 #include <linux/units.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_interface.h"
 #include "isp4_subdev.h"
@@ -279,7 +280,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
+	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
+		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
+		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
 		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
 		cmd_ch_prop.image_prop.luma_pitch,
 		cmd_ch_prop.image_prop.chroma_pitch);
@@ -302,6 +305,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return ret;
 	}
 
+	dev_dbg(dev, "enable channel %s\n",
+		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
+
 	if (!sensor_info->start_stream_cmd_sent) {
 		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
 					    out_prop->height);
@@ -425,8 +431,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
 	struct device *dev = isp_subdev->dev;
 
-	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
 		stream_id,
+		isp4dbg_get_cmd_str(para->cmd_id),
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
@@ -478,8 +485,9 @@ isp4sd_preview_done(struct isp4_subdev *isp_subdev,
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
@@ -543,14 +551,18 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
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
 
@@ -568,6 +580,9 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	struct device *dev = isp_subdev->dev;
 	struct isp4fw_resp resp;
 
+	if (stream_id == ISP4IF_STREAM_ID_1)
+		isp_fw_log_print(isp_subdev);
+
 	while (true) {
 		int ret;
 
@@ -587,7 +602,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 						  &resp.param.frame_done);
 			break;
 		default:
-			dev_err(dev, "-><- fail respid (0x%x)\n",
+			dev_err(dev, "-><- fail respid %s(0x%x)\n",
+				isp4dbg_get_resp_str(resp.resp_id),
 				resp.resp_id);
 			break;
 		}
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index c4f207cc359b..32a5f888a16d 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -114,6 +114,11 @@ struct isp4_subdev {
 	void __iomem *mmio;
 	struct isp4_subdev_thread_param isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
 	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dir;
+	bool enable_fw_log;
+	char *fw_log_output;
+#endif
 };
 
 int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
-- 
2.34.1


