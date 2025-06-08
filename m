Return-Path: <linux-media+bounces-34305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24288AD12BA
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1DF188A1A8
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328262512DD;
	Sun,  8 Jun 2025 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XjHynrLB"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67742505CE;
	Sun,  8 Jun 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394192; cv=fail; b=J7dMyhAO18UO1cYS1U79mjZCXZH2X2viO6OHWECVG6KP2xxA63cRIEW8QhGIfR+GwOUcHff+Vodu/yGs6h9bLWCAi2v+4jf/Rt+PBXadBzDP/KcpxKM42fAOf8pYHtB66ObLaD1ERbJPKU9dukgErj9DtG40OYd+LsNyf2davrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394192; c=relaxed/simple;
	bh=+A8RBM/d/2xC2zgJ2DqZ9kw4pm4p6SbOz+3TNManqR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlgsU6c76ARX3yMKDFVLkHQWe+VocWCR6pfvl3LMMP8u2z/WPhMyIejHulOHLOOg08iqNqvEWILf2EL4n9H7K0dW1y8C5VmCJf7Hij+T4y0ayObZGXkkmYxHvH3pfXCJrog8WTsn2xHxT0ChuRDTg4xmYc1tWtTLf3tJjPbwVxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XjHynrLB; arc=fail smtp.client-ip=40.107.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKrT/Ogo8XmddXOKPGcNChT6YJj+57syPoeSTyCC9EZzkgIhLuDEqUwEyFR7rhvyI61CoRXojjpvVS+zaTdNb6oPAu5mvrGG7T6kuunVPMPTY+IYg74+RtKSUWRp/0QXxsn2klo5fw1GV+yDDjKrZcctGmIsnTof4KmU+yi6+y+utOMlMexWgLFQHBuBWZqwBNCl+UXaxMiMuxvCFzpu8zm4+1AxyqOcZC0uOq37vKcmcmRYXvb2XLa0GHF5KhlYWgbec5YFsxH17XqoR4Wg3fqjl5gXc5mKIS6HSruZgqM01NkPeMtq1jvtFfWVay4/S2BBfCsq0KRxzBBGKMwyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e7UX37afj2KB2OrCYyMt5UsXmehvgk81bicExSVcOw=;
 b=NOdMPKRYBGmoHwCKA1lPtS+1RgKoq/81KjezUBBmYy5bBrlOT0lsZvi41ABR2vOC0cO3fTsSZCV+M0NGHmndP1kvI4RBZOBfmkQZjuRhbBTHHt2mwqu4DG0Fu30LOQEi4ccWduuqBAl2G69yxsLUYl+HW7l7QTGUvP8pB/Zp/ZrkO+8B3hwbGDISaHchElfgKeI45LyHquDNMwYL6uWCdAlPza5Ai/USCGKSAeMdd8QHSVRuIlcPYJHMt8yBalFAvd+g2VHp3KDym+zIXSUt/U32DDYiopbt2AvfETgj0Wdcfy/g+beqlzDng/g2oSEaarq8ODQl6zvq3VEIfbreaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e7UX37afj2KB2OrCYyMt5UsXmehvgk81bicExSVcOw=;
 b=XjHynrLB+/vS95gtEnMFuZ/906C4SwlitTFSEOOfWweYmIEtdkXpCO5vmet0EwlnP21gphBIHzKxU5OY4lK5ceB16PcloDPJwsDG/S66FRaPGfCYG4cp9Qt9K1hNhNyTGB1u9/+GsWPdgDNbj6lnfZewfaoc7zpWXwJwNguKwD8=
Received: from BY5PR17CA0046.namprd17.prod.outlook.com (2603:10b6:a03:167::23)
 by MW4PR12MB6923.namprd12.prod.outlook.com (2603:10b6:303:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Sun, 8 Jun
 2025 14:49:41 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::4f) by BY5PR17CA0046.outlook.office365.com
 (2603:10b6:a03:167::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Sun,
 8 Jun 2025 14:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:49:41 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:49:36 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 1/9] media: platform: amd: Introduce amd isp4 capture driver
Date: Sun, 8 Jun 2025 22:49:08 +0800
Message-ID: <20250608144916.222835-2-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|MW4PR12MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: e2912efc-be77-42b9-9f1c-08dda69bb35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HOa1NP74TARN9CqL/bVDfCNDHv7PMzeAZaxx5S7HYN/gRU1JX/5lzYjfhou1?=
 =?us-ascii?Q?zvVmGUJWMbRAz4WMLSwRdInD+f63/PayCeLmpvGcAs6OD/IQ5tNBc9qzqvFi?=
 =?us-ascii?Q?9/NwfQhlslYU+BfSQnQcLZc8GDO+dM5g9nalaT1xMzqxXg5XvnDG5uLrl3Mm?=
 =?us-ascii?Q?owHy+aU+x28XKXxfeKabOKEgO3hJdyjv9ptyyxjMMymt4bSJh8enkKiM0/dm?=
 =?us-ascii?Q?ZeK9Vk06kv9mpeiljXwgtWAOarwhzE2h0q78v41OJf3Q555Hmtvwrh5hZ4SI?=
 =?us-ascii?Q?p599ldI2JAhPpNEVCV0yAnyiSKMFST3cfnXp5QPAN8rJvnL8aGBL1PpHgp+B?=
 =?us-ascii?Q?IPg4Vs5MFDdF1Qldc6qkUD2kGCkBM3AMNZYVYn3ncexmXyWgoHvKzRSXpGfA?=
 =?us-ascii?Q?7Z4INnZoB0bi3uBzqZJP9axllQRhhX/fvdkknFe1z9nNcRZW0tTa4rjZawFK?=
 =?us-ascii?Q?xOV7Si7b+AkImNtfPEBIuGNIa0zNxn8olPge6MycSVGwSj85lFZmseOaXcw7?=
 =?us-ascii?Q?NuG7iAWP9q2u8wk2tBT75oy+rnn1qH688PeFY1QVBM8u7LPbfgqfyI0X4MKW?=
 =?us-ascii?Q?RAOpL+I67acNChlxOEU0es1dAMm+mAZIqIFmwmRHhLeiNLrGofvdOkn2Ag/O?=
 =?us-ascii?Q?vWH68e3d9EKLThAbKZrTjoBDM3IowDlkAxNCzNkFARaU9w6DsSfrlRq0Xoji?=
 =?us-ascii?Q?4qQbMvast8otmBtcefQNeOK2BMKB5MKndCcNW8nEfUeqXkxIuvotDzglNyAO?=
 =?us-ascii?Q?zME+noRNISyrC4m5zQCkn9Mr7Y9FJL8f/H3uDTXPcb/Ns67z6y8rC9OPUk/1?=
 =?us-ascii?Q?L/YHynHLUxykof1+53DvTBRzDrmS+b1AfHxo9CdLKuD8MHr49F5g6pdYmOa6?=
 =?us-ascii?Q?H5vpbI9cyy4QnTnY6WR18ENJThsZDtFwzY+9rJL0lmmJZ2huUpCc5JYpfqaI?=
 =?us-ascii?Q?ojZ+5rfHx5I2Wpqo15qTQwiE3vtd3bz2NgbwEm6HGwe5My4RCk7qt4g9l3Fg?=
 =?us-ascii?Q?Agwt+jnlbXsYVThU7jwQXIwH5mT9AYnbljNphIzujrjyGEsLbD8Z8Tx/AYpU?=
 =?us-ascii?Q?F270f5yn7UA3CRR90zo2MS1F4B8Ig8bagbHsVlneMyp+/nvW97PknfzlxKQt?=
 =?us-ascii?Q?kPd0FVFQJ3+kCQr0QG3aanr5jTIOyqYep9M68ObsjlGS357WNfmMjXeodKou?=
 =?us-ascii?Q?j5QB0/R2HREeTaSVFTFOfV5Qshpq2XtK6QLxSu1zV233uA+8NIx3ErwTuFtn?=
 =?us-ascii?Q?0jJDtR/hLGRXcniU/esaETtrgWuXeja4VXMDLfoYlWeXKMs+hM7iAjkvdcNd?=
 =?us-ascii?Q?eWWhgqceID/mKLKFkFa7ZH/E6UxPpORuSaF7ewpWUGIn3LlFvjc16s6JwWeG?=
 =?us-ascii?Q?MB3P2Wl3rHmvZwFhcVbZ67ynHGU75Ql/+BYtzMgnUznk8KzZ8cEDDZ6Cfu2t?=
 =?us-ascii?Q?3fnCxXFcUvOrJTL/TndPkZ3qe68IjYGTXsLrdfd9B/IpQAjuhIFxwBEkuf89?=
 =?us-ascii?Q?0i90boG0IcM8QJ2a8bwHTBDvj2DoIWZbv5db?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:49:41.4488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2912efc-be77-42b9-9f1c-08dda69bb35b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6923

Amd isp4 capture is a v4l2 media device which implements media controller
interface.
It has one sub-device (amd ISP4 sub-device) endpoint which can be connected
to a remote CSI2 TX endpoint. It supports only one physical interface for
now.

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Change-Id: I1a55f348db6a307797349203640132675aafbc0a
---
 drivers/media/platform/Kconfig           |   1 +
 drivers/media/platform/Makefile          |   1 +
 drivers/media/platform/amd/Kconfig       |  15 +++
 drivers/media/platform/amd/Makefile      |   5 +
 drivers/media/platform/amd/isp4/Makefile |  16 +++
 drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
 7 files changed, 212 insertions(+)
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h

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
index 000000000000..361b3d687529
--- /dev/null
+++ b/drivers/media/platform/amd/Kconfig
@@ -0,0 +1,15 @@
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
index 000000000000..f2ac9b2a95f0
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -0,0 +1,16 @@
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


