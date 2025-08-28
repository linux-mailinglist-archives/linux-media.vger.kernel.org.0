Return-Path: <linux-media+bounces-41239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB0B3992A
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 12:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0C513AE8DE
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B37030ACEF;
	Thu, 28 Aug 2025 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pLPGnYrN"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A7309DC1;
	Thu, 28 Aug 2025 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756375761; cv=fail; b=KXanCBZGU6Ft5DGen0zgPC92dUMuEIdoa6PGgPCUw3Xw9S/2R57WxSSypI1RvbpkJkFwOIayWUymeu3vAmRxIvgJSBfWiGbQXgyNdRMsHm3Oab2Qf++TNfXi8nfRBZuHL/Mr2RW3ITesqZLwg/vX0jNGPPfH4SsDJN10DVwfwAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756375761; c=relaxed/simple;
	bh=LMARWefwZnW0141SQSnrQHOnI1jGVc55x5O8ZnPCWFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtrsDD9rWKRZDMQbO2xV6NYCb8eUcKIRoT+MPCo9N0fnebliMaYWp3FCS2cWIvdFeTHthec1vyGm12o6M9qRIDJOc2ZnKmoJmj008U6QHKE6EU+3r/bu6Ll710fbKWTQWfFHgtUJ1H70ByZHucrabFntG6jUZJZPD9grpl1MJls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pLPGnYrN; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myIwSxICy8zdPYJv+krnk4y6cuYv8oZK2lZe7f5k4sLQLtW1XEEtxb3TI3pVGQ61oB1pViv7HQXxSCz9kL42fKqQVMi+kUNJA44kO7XOSmOXXbdeEnHLu8lVkcwLgFQ2z37oGFs3KgQV/AXDmyMJ40Bzdl/96JqYbvTwuFY8wOTcib8E5bQfPbi6dfmLO0wcrTr48QzV2bKpm63iJ5FsviWh98pz4W9cYVM5HyxFf+W1+4N8qYuky6QRbgJUWw5Ebe/Wqs3JJ4XuxFT/NOPDefnUYOgctGvjgGnKeELWGc4Xn/4W2YDdWnyYXMfnaAYZLf/FusUjGpmU1NHRSJcZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FciMjysrcM0xkNRE3NZgcu98zXCQcxIK3z3ZETi+j/g=;
 b=fL7v2recOsbeepjcxRRoFa3ossAD7IYrwJxI6nOXy57D00mT6/8dAGluiBMmGMmhg/SQLQNrPDE51ghS4l10m7cYEEhrwvNg07D+g8XAgfo59h9FqxJpN2DmRtNa7aOkbT4Sgr1Sr33ADEZAqr0OvQi8Qu/6G/KKDRkZB7nlxp4Mwr2sOQoaVgD75H3mJ4gSzmABo8VyTFc6jf1BZiOgLePtd/HT3c9JaN0weQsX/dm2X00XKNay01yXsCGcUrLz+Jj6w9TMmIdHaJ5I7fItAhV1g+qaF5yNon7l2sUZcMif1aqHZwPWyvJnJbrS9LKWLP3arf3IebEtirSDD1HYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FciMjysrcM0xkNRE3NZgcu98zXCQcxIK3z3ZETi+j/g=;
 b=pLPGnYrNpqONcP4V5uzAHBjEqXRVHiIIOPPPWWK1PLXcK9rTht8OeifAS+8AYQ6mOjfQIEQEfLbKPLKIL59Fa7IuCgltHlCqDD6ItaSPGqaeVEL2nQnk1KU83JaBqinSaGDmdC5/7WhskkeEMkmxMlnUzYrxIRbqPsZkeubxETE=
Received: from CH5P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::12)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 10:09:14 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::9) by CH5P222CA0020.outlook.office365.com
 (2603:10b6:610:1ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.19 via Frontend Transport; Thu,
 28 Aug 2025 10:09:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:09:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:09:14 -0500
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 03:09:09 -0700
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
Subject: [PATCH v3 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Thu, 28 Aug 2025 18:08:11 +0800
Message-ID: <20250828100811.95722-7-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: d19bcfe4-bd50-4b77-15a4-08dde61af137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9lZZuAo4IhLggKxojyuSP1P2s2LvBhpaQDJLxumN9UUmmMON02mGYZtLKMI?=
 =?us-ascii?Q?5xY2EtknM0BpzCNJ6OkULlza/bCsSBNJFIm0njhD2sTA69zFcr9ndpterBN9?=
 =?us-ascii?Q?dhhqIFBXb3o98AYqN13uZ9skuJtnN2uX6M8kWk0Es2PdUQzUSMswbwNz1LO6?=
 =?us-ascii?Q?mixvtDjYtIpsc+7XSYNXoCIJytWOFdGOCaYAKv/tRfLcXoAqmaqs7Qo0XWd0?=
 =?us-ascii?Q?6plH40CWgyZckHx6A2BmInJqtFzZzfYDc+XvmhEKbIKCNXU9hO/9g4qSAB8X?=
 =?us-ascii?Q?v3OuroaFc5UEnz/tpffss/EyRNo+H2hBTgrxlnVi/CSTnslp0tJWjgYu5Q0s?=
 =?us-ascii?Q?UdAp8kWLhtsHc5FCgt4F+XZ0KU35/WpBIQtWCxecK/Wt5Hk4S/d9ejRWuBK2?=
 =?us-ascii?Q?nImfGff5r6gA54+MKjTs3sK/RYyONBQZKd6Eu2PamoxmcGJ3HMy3jvKwSq8U?=
 =?us-ascii?Q?i1+0gakDM4CC9aQj5Olcaw6WvJOVCMzo4OSKIwDxW6l0QxUoEPC9t/+becGx?=
 =?us-ascii?Q?dR+zr8cyrNc0nQlniz7PtpJC/MVrEGyHEPaGBKBlz+lNHINHLkZBrYe83b1E?=
 =?us-ascii?Q?Li+TK8mEr8/dip+G7drpv6qW3oxUMh9CKnu72fXIXKwxsXRmLMDUf0Upe4xm?=
 =?us-ascii?Q?mADeZ7gBm0n+faN6LS3QXwfg+iAOHzWuzhZ6skmCpjd7x7NmkF9ihqFZxEDh?=
 =?us-ascii?Q?eNrA6Hsfy3U0RgtVdLN07n4rFctVAmNY409dHFUXyw4OpO7u3bQSZpFt7zHJ?=
 =?us-ascii?Q?vpt59F1NoZ9RjyIDwg2s/RLrTFcakB2B8rw6jxr8gAkVeT88kA7hRO6elQy/?=
 =?us-ascii?Q?M61L+BlqU7KT/iW9qlHoATOvx0BaR1Vv+L6RawkjMELHx3phdhKpt+rm6YaD?=
 =?us-ascii?Q?CjsqRDEXB0/CECY4tuJbmPhxCUW+nEVFp69hEW0acgAmuJWSkEK4ED9mvw9E?=
 =?us-ascii?Q?5HGfO3YouVt/OQOGK4lNFAoNjoqrJo6cPH9WJ3NY8nj+7L2Wk9u6AGSzSQjP?=
 =?us-ascii?Q?EaJtLS3Fk/P5jW/Wys3H4Uot6AZoLz6ItMvDHLg0XkS2G+8/Jhhm9fOGf1Xo?=
 =?us-ascii?Q?vM0RRR9BUBVxhB46ZY3RZD/ZOis60gYsIzFhXo7yobX+skrvrGBwT78UQ1Dr?=
 =?us-ascii?Q?MlMPoRvtYJiw/Da8D6obUwbj/gW0fBeCLye1ZN/8KJKq+U0o9eFrdJvfsJV2?=
 =?us-ascii?Q?S/+LOkYcQvGOrB7viaSImp1R6DUMz4zW8xWga2+7QgM0phfF4ToiKIUaihjq?=
 =?us-ascii?Q?DIkgFRgFczGNMaRynDkZVVrmP3BYYlpOaGmV5GG7Jmyx0DrHrj84DpwdloKr?=
 =?us-ascii?Q?pnhdHjWtFSsYaN3HrKe74VV7w2BZY7dxUpjjKpR5gZJb8gF5KBqD2AQBjnwc?=
 =?us-ascii?Q?3MH0Pp6S5B6NQaHL6blpT30sUUaANPa7pv4d5t3MPXmwv/DfCEAos90aZEdp?=
 =?us-ascii?Q?PJl9b3h7QMeE4fMFgzHCOPEKQwwJ0+9FW4Ip2cc6eWZ6dLsGs36nZv0/dhrz?=
 =?us-ascii?Q?++JGLyg3H8DpTAItvwQVF1Al/S1DSZ9lkQRP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:09:14.6394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d19bcfe4-bd50-4b77-15a4-08dde61af137
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472

Add documentation for AMD isp 4 and describe the main components

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
---
 Documentation/admin-guide/media/amdisp4-1.rst | 66 +++++++++++++++++++
 Documentation/admin-guide/media/amdisp4.dot   |  8 +++
 .../admin-guide/media/v4l-drivers.rst         |  1 +
 MAINTAINERS                                   |  2 +
 4 files changed, 77 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot

diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
new file mode 100644
index 000000000000..a5ed78912d0f
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4-1.rst
@@ -0,0 +1,66 @@
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
+- capture video device: capture device for retrieving images.
+
+
+  - ISP4 Image Signal Processing Subdevice Node
+
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
+
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
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 3bac5165b134..6027416e5373 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
 .. toctree::
 	:maxdepth: 2
 
+	amdisp4-1
 	bttv
 	c3-isp
 	cafe_ccic
diff --git a/MAINTAINERS b/MAINTAINERS
index 7724620896e7..72ef7c77d881 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1139,6 +1139,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/admin-guide/media/amdisp4-1.rst
+F:	Documentation/admin-guide/media/amdisp4.dot
 F:	drivers/media/platform/amd/Kconfig
 F:	drivers/media/platform/amd/Makefile
 F:	drivers/media/platform/amd/isp4/Kconfig
-- 
2.34.1


