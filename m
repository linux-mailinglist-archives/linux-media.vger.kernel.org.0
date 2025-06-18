Return-Path: <linux-media+bounces-35141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A0ADE690
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE611791F2
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B2428506B;
	Wed, 18 Jun 2025 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lvnQRKX4"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5838285055;
	Wed, 18 Jun 2025 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238455; cv=fail; b=XRfxVBGCeIxHjNi8dOwcOSlWj19JMLQuLBWts3evds4MMlBLjGNlx8M2nSrd+u11NMRiGdsoQw2lLIlqh8iWhyPDlnsQ0IP55/SD8rmNiJu5Lfa/TeUPtM5ov7ZnG+1zVOCHCV31FC2zMX703Tsj1Bj9snbozsTwKyWyVK5tSnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238455; c=relaxed/simple;
	bh=UP3YDN8HC2yUxPpaTk0oaf2B9RWOIytfyWfU40dNOAc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxRAMKbPds9BccnYM0bsAw1rOGk0/r8gjmoEU2yZRSiTJC9opyYx+UYVhxJY0sP9bPZaqbd+zGmtA6T+jA//i4fZJziNyBoqsKMhV+aUe0zFo/m66Cm0Hj7yYx1961X61p3in7TXcwcVnL+V8SGbn7FcVIKxGk1cyPXd07FlC3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lvnQRKX4; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOnkyVkast+rOpanvx6Bghg3mICFGvytDdGHaRYgZ0IVy/zkchNJKWi6xoD2chkegNHyMnVwOldwBnUmh2H0i3mTf6TUek8dL5PzfICO49iG3UXqa7YgzO+pL0JJYX4xOyTYn8k6AvTWe+Hg9c7aCU5vC/+dzokZyEXLxZxH6F8fxfyhxT0+kzUKQ86wBVCedlwnkLEuekvg9dAx48bHL+H1SG/eTx7GNEplsYKGr0Qx4oCWLn6YUUZcGVQQyLnugp13kg2M7H6knuUF7Ul3SGWylnTwg7ihWh1nPq2c2Kl2CReW0VufCZTBHsm8kH62ncCO7jn8whHpBZ4X+bBk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zynAxN2Y5NO1WagF9Ei4gkCHTi2vkG7SgfJlmm0z278=;
 b=tP+3RrULILTujLMFdjsDmqcn2H1Owvt7akj7NBq+pCwfzMZmEbFyJ9JSl35EfAkdXRPJEGopKwVbOPyhLzAreln3vFnRpgbBPKARU+baSoTmCTRDoOXkXyZVxdpJ2WL30cz+GhQF+6ylbIVBAX/88Uko0bBH+hv8VwtrcQHYgUJGwGtgRZgWCHY5cf7/UfPZpZT78V3dnNPqr3e36Yrb+tiTF9xfPNDWj7snf34bOKnMK1Uvzrs/SZmTerYwmgmvZElX2q6cJp9vHJlU3l+/l6OmDYSc8jzyjzmqfPQZ9TV0SHShb/rfMfjEucKIYK52Ok/nhlaekqUfjeeXLTYfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zynAxN2Y5NO1WagF9Ei4gkCHTi2vkG7SgfJlmm0z278=;
 b=lvnQRKX4f1aZjRsrRSKiL5HPZYg/HW/csPfcpvo+0LFxG7WiyPYFSEjdpWuKKYf5sd+2EBnyhMJrkYh1KFHWaXMoQQN09oxRViNNW133qnB9RLY0BJ98qSveg6q0zp3lmQxojSKgXb8c3Q/ghsJl3miHIfZCLm+H3LhbVEf8ofI=
Received: from BN9PR03CA0271.namprd03.prod.outlook.com (2603:10b6:408:f5::6)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 09:20:50 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:f5:cafe::3) by BN9PR03CA0271.outlook.office365.com
 (2603:10b6:408:f5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 18 Jun 2025 09:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Wed, 18 Jun 2025 09:20:50 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 04:20:46 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4 driver
Date: Wed, 18 Jun 2025 17:19:59 +0800
Message-ID: <20250618091959.68293-9-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc2a434-e717-4618-bcf9-08ddae496ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lbeB/erPAbQKtVInUZUziEwv1tN0k0NUIhj4ifuw41ohMJ5ysh5l/9QjY9Bl?=
 =?us-ascii?Q?5iAdC4SKU6UzubMYWxVQjp7X0bBgtAMAfBZM0RRE3V8/0yx+MzZR/lOtNiQO?=
 =?us-ascii?Q?+VO3cJp9yAkrA3e/sF3jeGbi1574Vr3ThvBfB2eKrImL8NhcdKilQ2yj/HKW?=
 =?us-ascii?Q?NxAG1ExPvOauwixR3uqaLcuOBH8FHXU5fprorKRhEzJPbzTlNl+vzPa1pyGY?=
 =?us-ascii?Q?CyPl+T5Us6O4rStqDAVlCxlsHPIU83aHIOdOJCfPnAE2iptf0HjiX+NdHgUc?=
 =?us-ascii?Q?AgUxuDlXHUq0LL0FMpnCpFwwg7q6Rr9TkkjRg3je/erh2thKqmmjak4SKn+t?=
 =?us-ascii?Q?if70O8KwznLWREjKlpFGFYHxZbxHSaYflb2Slfbs6RklWyP6rOB/klA4ri90?=
 =?us-ascii?Q?pfFhZlNESVMBhbPjypUR88zNM/XpY9wT8X5rB5wSzw1uihM2UMz+SlSxt5F3?=
 =?us-ascii?Q?ndGiiEkfgEbe7AJ1e3Kl6p67flGAKm7gEJmfLvIMqoHWfAlxVwq7knJPEIga?=
 =?us-ascii?Q?KfkFFcMAB3hQg7HfIHKI1oNYjhDd1cpUiKUlVHsd+zH5gbnKzYJxxsSCMoUW?=
 =?us-ascii?Q?kSzXtuCF+WZRUqgjw2t58zqlyut4SDOCA0IwtXp4D5pvbE8MDTHZB+5k/NnE?=
 =?us-ascii?Q?eHosYgigd4dKQ/Jy/2LZFzYdI9zgpi5V99Ya7ElLTaH2MXaRAUF+faB2BzPq?=
 =?us-ascii?Q?LDF45NYSBKv1ITH1mKseKDkEx2L1/9H9tylfD+0zjs0q4ciltuadkMX8bX7g?=
 =?us-ascii?Q?XNSsgc49lIRSoTagWxAIvLBHPiCxC96TYDwl8g0VpdRT3427slEqsgpc2yWu?=
 =?us-ascii?Q?RQ9HKjhE7mFlu0Ji0pBhfWnJPNt/jDi8l5190saPlYjhyIW0vCgdmwuBDFcL?=
 =?us-ascii?Q?bQSNClwsUdB1yT9K5UPJV5Ctu5DPGuFxFnsnHo7PXsB2lqd8LpBWLdrJweMV?=
 =?us-ascii?Q?RUzhDPxnzAqv4v2R4vE2TbfrKBdxIU1pFqygwTv0094qwMELi5VZTMzO4H0s?=
 =?us-ascii?Q?DYOXssFBIkH+/rI2n2HKCxr+8SWuKUWggsjEy/MRT+oqVEYQddZoYgpwVR/a?=
 =?us-ascii?Q?PgWvLJIAkx96KjmJmUcEABjBTyJ4DK8HfQ+d2niC5/bHQXKBO/nh4MWr/kc1?=
 =?us-ascii?Q?7wEIMqHnHd8BPL+Z62tO4dPHL18siOhcG51X6M1VbjFENPCWPU2PuuZ5YhQm?=
 =?us-ascii?Q?kxuu5Y7YPFV5YE9wJZM9L9y0GoHtRu5tHF39mugfGCbzJ+VuXBFwN0gHgpA0?=
 =?us-ascii?Q?gN1gqZ7NMEfVq9h6iuZmO+18+tTQlTDxYFwUqtsGyif3Ow3W35Xs5drYBpBD?=
 =?us-ascii?Q?OR06eTWAcYCzYmHpNNLFhkeljcSXg2EvPMF1FeUK6e48SpZavcotrBXrx6lM?=
 =?us-ascii?Q?zkoglqbLcmhd3NWd4ymaqIBfmREb6gtF9+7ZlrI+cy/AAgDGaKHpMb/LAyxX?=
 =?us-ascii?Q?TLw/sgABNj5eQRXXYu9ZFzNlSv0sZIr1+WM/v/kgwE6oDqRRp4YJsUwv4yIr?=
 =?us-ascii?Q?EYJHrVPeOv+yWFj6MjBh7NKY/ozkfzUPYHqr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:20:50.2067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc2a434-e717-4618-bcf9-08ddae496ab3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

Add documentation for AMD isp 4 and describe the main components

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
---
 Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
 Documentation/admin-guide/media/amdisp4.dot   |  8 +++
 MAINTAINERS                                   |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot

diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
new file mode 100644
index 000000000000..417b15af689a
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4-1.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+====================================
+AMD Image Signal Processor (amdisp4)
+====================================
+
+Introduction
+============
+
+This file documents the driver for the AMD ISP4 that is part of
+AMD Ryzen AI Max 385 SoC.
+
+The driver is located under drivers/media/platform/amd/isp4 and uses
+the Media-Controller API.
+
+Topology
+========
+
+.. _amdisp4_topology_graph:
+
+.. kernel-figure:: amdisp4.dot
+     :alt:   Diagram of the media pipeline topology
+     :align: center
+
+
+
+The driver has 1 sub-device:
+
+- isp: used to resize and process bayer raw frames in to yuv.
+
+The driver has 1 video device:
+
+- <capture video device: capture device for retrieving images.
+
+
+  - ISP4 Image Signal Processing Subdevice Node
+-----------------------------------------------
+
+The isp4 is represented as a single V4L2 subdev, the sub-device does not
+provide interface to the user space. The sub-device is connected to one video node
+(isp4_capture) with immutable active link. The isp entity is connected
+to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
+also responsible to configure CSI2-2 receiver.
+The sub-device processes bayer raw data from the connected sensor and output
+them to different YUV formats. The isp also has scaling capabilities.
+
+  - isp4_capture - Frames Capture Video Node
+--------------------------------------------
+
+Isp4_capture is a capture device to capture frames to memory.
+This entity is the DMA engine that write the frames to memory.
+The entity is connected to isp4 sub-device.
+
+Capturing Video Frames Example
+==============================
+
+.. code-block:: bash
+
+         # set the links
+
+         # start streaming:
+         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
new file mode 100644
index 000000000000..a4c2f0cceb30
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4.dot
@@ -0,0 +1,8 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port1 -> n00000004 [style=bold]
+	n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000a:port0 -> n00000001:port0 [style=bold]
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 15070afb14b5..e4455bde376f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1113,6 +1113,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/admin-guide/media/amdisp4-1.rst
+F:	Documentation/admin-guide/media/amdisp4.dot
 F:	drivers/media/platform/amd/Kconfig
 F:	drivers/media/platform/amd/Makefile
 F:	drivers/media/platform/amd/isp4/*
-- 
2.34.1


