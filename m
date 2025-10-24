Return-Path: <linux-media+bounces-45469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D453C05403
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CCFD1A027B7
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560A230AD02;
	Fri, 24 Oct 2025 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5pqG5ctL"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56983093BC;
	Fri, 24 Oct 2025 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296867; cv=fail; b=l7uD2bVczmcKeGn8jNjvopUFy8ylgrIOguz1LSMYlW1NRHcg32Kk4ZGXirQDHB4USBtHvmZ16Jwbwy74ZI+4RNSGQ4cAXCw6RiZiqUg/I+UUj0J5wJoE8o8BlFbGmghcuehBypMczhtvmzGeoUjERdK+LHL6Io1oLGIivOpVlO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296867; c=relaxed/simple;
	bh=VqaKGs5GC4+VwSwomfOLfAZcdY3RTwKr9xADgAF+dOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdvzTr4I9g/j8PhORqxR3m0ki4e+gdP89Of2Yi1rj5DNJ2huU4Oijx9BpHmHOEr3+yM19oM+78YuGqMif1WEcs1ptbqpK+AoH5uIu6mvSydWO8a1gQiZ6EfXBwceAJEf6V/13tUa9DwRRgyXflYdSJupbZULhmHJSb9/O5UrA38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5pqG5ctL; arc=fail smtp.client-ip=52.101.193.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrFtEUfe2ePPeMYuLLZuWnbyJHW7vM6whdqzk3bKBIDRvrtsQoWl+qjswo5RvwG2xa35p3noDHItMGmW1zkYviEfbwhz7wJhpuA57a/bQdrh9zwqb0iHt4tCgc5ZH3ZuaH9kC657HxkRjDM3rZz/UWks39MYorsISpiimLHPYHF7IzRzqptcW8vrlsgWU8WP34GGv3cHk0wDHkrZmtJP50zU+HsOHSQ8SIsholHXm/zhTRguGuyKb0BZryeLMGXdPAi+Sky21jQfmb1akbsBUKScXGOZ0sSxzYLKHR8j+mfqQUYuhUEmo0E6/JL2+POSEIQUSzOrHqMSkNwRzSrbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD5/tvLCzDURBVoq9TkyCVI5Tx6gEsa6IHDU+rSUyWo=;
 b=okxUjU0PeHaUKXNxRELfpBnNYY//ZB4uA6HupI4YVGBXGzFNt22of2kHIcIY5WrSZ1y6GWTGClRBAULPko0tWIimIugpw+OIXkO9JPJ7UK9nkfnPSvcp9Rac74D0QIrPWn8Bsd+p/oZkXa4oULPac8rH6Yo1hWMatc14CFKLlHqCCiDyyCRQ6sHbyYvDpa9dcErnPkaDfYQMnef1SEXiBF3HJw4Nwqjr/jx6Y+tUX1fOOoTf/i6Y+CRmhqIb7fDXEMP/iNyPUgQJbahzyE7cXCbv4t94Xk1spVrH8wsZHB9evkAzCq10zTUHgFZfaGazSRU3YTzIUffXu2K+R+FtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD5/tvLCzDURBVoq9TkyCVI5Tx6gEsa6IHDU+rSUyWo=;
 b=5pqG5ctLmkzIkWEMVvA7H/QfCdo7ZJzmGfnWl8Vs/++QfMIagwWhqoYOPxjoQAr+5W7aQxh5eM4WeQ1e84G8SRDSR0H7TlpjfSmGD1OT+BIV4ZNqQ73CLkPAz7wF+IVfgJFOuRuxgxKbl+HzQ1CYY3cRDFEu5IsCEjVbrM+KiF8=
Received: from PH7PR17CA0067.namprd17.prod.outlook.com (2603:10b6:510:325::13)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:41 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:325:cafe::54) by PH7PR17CA0067.outlook.office365.com
 (2603:10b6:510:325::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:07:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:41 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:07:35 -0700
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
Subject: [PATCH v5 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Fri, 24 Oct 2025 17:06:43 +0800
Message-ID: <20251024090643.271883-8-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2d54b4-4e58-4a28-27c2-08de12dcc957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6gy4+zB8lvTjACsT9KXyu7cRAXOu7FqukNKDc7jpUGEeDVZ/YZ3z+jz4l7I2?=
 =?us-ascii?Q?AiKNU0aFRyicnMaoUE7HRV+dPAJltII3c5geLBCMD7Wza70lfN6s4b2jMh4Z?=
 =?us-ascii?Q?SQvBLw8NkefLmA9/u3DMb8AfZi9q3u1nX70lPy8pz5FNrCXoGH1ntYLdv3Zc?=
 =?us-ascii?Q?rHPp98HGJE2n+zmCEswq7U8J5uN1JjP6eNJfm/OEwLkGRCMaChL2PEwI8WM2?=
 =?us-ascii?Q?XRKJpm9Zhq0EGTpZHJWoN+Dvw4PpfWidupPWgtwABkqxsrx3J6tt9DrgYXjV?=
 =?us-ascii?Q?L8nKGZuPWU7XSxuy6bUVV6tktrTJpJgo5zLb/vVgRBEgtZxuJIPMA4ddzSSd?=
 =?us-ascii?Q?/qS8axKwtPUXN/kQ5/ZaKF77md+TGyzWl8/Om5pe9GdSeOZJL17SR27VPsep?=
 =?us-ascii?Q?RAWsjrsGBWDEANinJ9wT1vhND6aQXbeivdcWto0PdmqrVN70B8BvfvwYP1r1?=
 =?us-ascii?Q?JWptDKaCZ/7vWq75s47afOOzSonXJ4l4McY1DjIFSXeoNBPZEROHo4Badd8Y?=
 =?us-ascii?Q?/Llolzj9OtylLonoF7cCMYR1mEmwE/jnQ4hWjA1vODEEAAlMgulHOtSB8Fwm?=
 =?us-ascii?Q?gttgIAyAK8IHIYyQFO3s30MdBt1AR/efOGMvam12djxthNR4ZhNRW2GyPLW6?=
 =?us-ascii?Q?wdmkPNNgDfbREcHTa/62mRfglFB1UneEbpWilQJPomoo0NMAy2bzX+n2uZAb?=
 =?us-ascii?Q?Kdg7l51B0RyV1T92PQdD/fsoj5RXQyr7t0pjcwyxVL2hEvdIr5Forojb84Ej?=
 =?us-ascii?Q?H4Lelpc1F3DcV8CteubwCKL2P4NVVJijAPIMw4iIBlyy3tFUm6xBksk1yOxy?=
 =?us-ascii?Q?ZRVwsuC1r3/RYdNQkBigX4b00tAYK7ZzTqfdeP4vN10G2OuojQXvdYXngIde?=
 =?us-ascii?Q?fWbfZDzYmjJqKP+KHVNSq5tDI08loHuNDrfNKN9LrnRihZtHCkI9jcUzaPzS?=
 =?us-ascii?Q?mf/ytbS0Rw0hbMdoxVlMMPo9GEU0IAU6Dkf9SHTEs/KQsG7029iXzV6Eq93E?=
 =?us-ascii?Q?SNAIWYSKSFqXfsxsfs0525BhlLxJ0AQv7kfLSt7sf+WhlWQlBSMvYN1HnsNQ?=
 =?us-ascii?Q?zCI4WWNzCITc+lWDCKQbla1Bk3rpwVza+u3rbfZSMVkvf50qZS70zXHJDzRE?=
 =?us-ascii?Q?9M3OS93O2avZA1+9SeBfGQaVAG0iirH0awolVxROgnWs3ZOj0OFZrRXJv27m?=
 =?us-ascii?Q?B/xvDsHYaj7fTkwCS60NtniuD59DdWG3EY3Xjhn2SCzCLaIz8S0DzlEJsvLv?=
 =?us-ascii?Q?LeLFR8p8M9swP8xxpaIp5qNe4aJTxOnrSGtpgVEfqMFQEGxg5W3rcsXSq0aP?=
 =?us-ascii?Q?nNpMQ7QYKEomgjhhWWzsBOtMTbZwrmgWfcyaliAS8xQvAwNtIl007F2tjZM6?=
 =?us-ascii?Q?SiDTe8m0Nq5RcrSyD3EaLXSeMCv3LdXP+Wx4rJyAaqctt1BEnprEIUz0em6i?=
 =?us-ascii?Q?iC/jX08KNNkNgotimdLhjWv0bWqKC3Ae43cIwzlAFLpLNiiJGwR84bS0AOUP?=
 =?us-ascii?Q?Zwo9k/lQEz2z1z41NOspwJ4F6b13zxOvmBZ8dcgEQzkTjeFCO/YkdE1UIHNv?=
 =?us-ascii?Q?zg/Genv7Joz/7oos95g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:41.2580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2d54b4-4e58-4a28-27c2-08de12dcc957
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083

Add documentation for AMD ISP 4 and describe the main components

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 Documentation/admin-guide/media/amdisp4-1.rst | 63 +++++++++++++++++++
 Documentation/admin-guide/media/amdisp4.dot   |  6 ++
 .../admin-guide/media/v4l-drivers.rst         |  1 +
 MAINTAINERS                                   |  2 +
 4 files changed, 72 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot

diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
new file mode 100644
index 000000000000..878141154f96
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4-1.rst
@@ -0,0 +1,63 @@
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
+AMD Ryzen AI Max 300 Series.
+
+The driver is located under drivers/media/platform/amd/isp4 and uses
+the Media-Controller API.
+
+The driver exposes one video capture device to userspace and provide
+web camera like interface. Internally the video device is connected
+to the isp4 sub-device responsible for communication with the CCPU FW.
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
+The driver has 1 sub-device: Representing isp4 image signal processor.
+The driver has 1 video device: Capture device for retrieving images.
+
+- ISP4 Image Signal Processing Subdevice Node
+
+---------------------------------------------
+
+The isp4 is represented as a single V4L2 subdev, the sub-device does not
+provide interface to the user space. The sub-device is connected to one video node
+(isp4_capture) with immutable active link. The sub-device represents ISP with
+connected sensor similar to smart cameras (sensors with integrated ISP).
+sub-device has only one link to the video device for capturing the frames.
+The sub-device communicates with CCPU FW for streaming configuration and
+buffer management.
+
+
+- isp4_capture - Frames Capture Video Node
+
+------------------------------------------
+
+Isp4_capture is a capture device to capture frames to memory.
+The entity is connected to isp4 sub-device. The video device
+provides web camera like interface to userspace. It supports
+mmap and dma buf types of memory.
+
+Capturing Video Frames Example
+==============================
+
+.. code-block:: bash
+
+         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
new file mode 100644
index 000000000000..978f30c1a31a
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4.dot
@@ -0,0 +1,6 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{} | amd isp4\n | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port0 -> n00000003 [style=bold]
+	n00000003 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
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
index 8478789ac265..c34137e27b55 100644
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


