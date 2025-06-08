Return-Path: <linux-media+bounces-34310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A1AD12C5
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC2213AB295
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB880253B73;
	Sun,  8 Jun 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LHSiZ/xz"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B43025393B;
	Sun,  8 Jun 2025 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394220; cv=fail; b=W1spMkP6tZ1EG2PKCrzr+2OgG2595yWTOUvykSG942xlU26hf3L4MsYtpKzxdsyCMLkoMgh0mRk6pMHCD6uQwQUu6EP/88GVsP16vxsxHszQUcCKOmt0724/FZnHMPmb4na/fhMDtcWHlo38J9Fbkej1jCoRR3/I3C8GUoXtISA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394220; c=relaxed/simple;
	bh=c4AybrZEjBCt3Sq4sJTj47YFvSv1vyh81SpSxn6lFKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDF+1eh9AQ253tshMy1uB6rwaGUNeOE60z707O2mEw08Caa3VjQHn7ZJnI3xcA5QAdDMET88R2IjAWWyjFfZhTyCnqpa66l645BTKh4tMCirkyxcFRwDgdvU9IWakJyz7kyjCV52kc4WLUznUIj5G+k8TJAcP/KKkltSPxvbOyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LHSiZ/xz; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Anq1IOE81MRYeYaUWvXqjBYs/x1NOxuE43Udk61lxIWg40ERPGNOq4riuVa8Xg1qZwiSgCjFLfgXIf5lFmwJW3747JPrbB4SUBIeV1erFYh8IGpBZBhV/RHVqPlpLE3FwY5DXGSb346VPo7PN4kENqk5AGBMBKyANdoBSuXmQaKx6DtstILBCfyngeFCuXAB6FdfuYZUKlUa1trPO1gy9KrAz97EVzJdIgYeUXSLaFqnU7zXgBMjEyImVA8VspiazzGTXKdTXcc0d5URKmfEDDaWcbJc7eiy2wHq7TqkVHaCvBfOBsznciO5m8hHyiaJyPUOTJ54o+vfgGlkEZz8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neMntWBsOQc7CRKXf42kqprZHr9zfVWBcfssPvT5Z7I=;
 b=p2HG6w+O5ex+doW34MJMz5HIi8TndnOC5rJ4lWKKrabnKog2XoMRsJW31KpFo3TnQQVEMNs/qAEa2ZiRQj3GOQTYqMJchU6697+jeFMqUzOhkqOa19MCB/JpvL9fOgAYNvCAynXex0w4EVTE6VWhWCzvrCXUHexfn/YBUANdiWvIfRffWTjecV0VdfM/VSeNN1VZ1/+m2hN9vE+dBqR04yrElB/yJk6E4pRVEBKMfyLNgz4OHPUTzkA3O4JtrkqRYncO1eaJLsEXle0NahJzyx0AIz5V/nZcuhatRGpe7kGNo/ZS02gG8D3eZ6EFDnxsGU+jlcrrxVy/aq/D0UsOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neMntWBsOQc7CRKXf42kqprZHr9zfVWBcfssPvT5Z7I=;
 b=LHSiZ/xzX+0nUq4/S4ZzP7ggNwAq7uAke84D71UA/632zOFO9g3aurNw2Yk5G8OKo7jkaRWPF0RTjxLXzAP7mQGeX1g7QD1W4vlmVx+ZA5eW8KQ/n4b7W8xoZeifKMxbJ5AosoWjPFML4PMq63qGuyLz1Hp0ijBRGN3alLADWTo=
Received: from MW4PR04CA0315.namprd04.prod.outlook.com (2603:10b6:303:82::20)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sun, 8 Jun
 2025 14:50:11 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::f5) by MW4PR04CA0315.outlook.office365.com
 (2603:10b6:303:82::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Sun,
 8 Jun 2025 14:50:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:50:11 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:50:06 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 8/9] Documentation: add documentation of AMD isp 4 driver
Date: Sun, 8 Jun 2025 22:49:15 +0800
Message-ID: <20250608144916.222835-9-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 96306e75-5c2c-4b8e-195f-08dda69bc545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tdo06X6Vvz0NwVZJW4J3KHBAYFL85ZgKnLnn1hxqDt+bjWbEGKTWZMoaAVKe?=
 =?us-ascii?Q?lFS2oiGcHbym4TQQUvnoKom/K1ETF4niOd4fdmdkkluYn58nepUQ78z8IrZM?=
 =?us-ascii?Q?/V7e0vw+ZMCb38hhcvJrs7lNjk1Rx0NSBbJVV5fo5zbYIzA3GKrfLBfXcE3d?=
 =?us-ascii?Q?Zbs8ecjHOWOgxy1gFGpJA+Hlrx5+9THO/W0mVoW2GGogXS62CTHNu3a+mDdU?=
 =?us-ascii?Q?3xgneBXm8Qbz0/GSpiUrQXXDRMi676HuobIiBs4ri1gsVauFJ7D9O6CJdLzv?=
 =?us-ascii?Q?sqH73SdTibBut3kOeXF4Qc2pLf+EqPpzUvIlFg6RV8ZIxWwM76k3tthzfLKv?=
 =?us-ascii?Q?M3EJICTrrxXv/LsjcW1MoXdSnFMi+82cTduZ3nIsFJC9Plarq8oolNKqDWOy?=
 =?us-ascii?Q?XVcyhccti072dOBC9koCDZpj3C+zlzWavodtgnIa/wIUI1IZgpg05Ia82P1r?=
 =?us-ascii?Q?p10wpASWvNHk8Ph87NDaJIyTiMUy2NoAYPT2bNn7iLmCxKSVHFUO/pc5MGce?=
 =?us-ascii?Q?PNVVOlwEQ+NwGMgVJh49WtcETQr3dsFp4HtYP1+1/IAslYY3pAAc2+JlM3Ol?=
 =?us-ascii?Q?xniJKWJ8GsIPSlKPC86YPoOukH3Up52F3o+msL+tfELxtMYrQCDF/LeetlIy?=
 =?us-ascii?Q?wArtuVPyF0fxE6TJOkvjg4lCkM5sGHVlJlAllkjSAL0Bo0P41ZvOe7rOuIWM?=
 =?us-ascii?Q?mFoho7Kfx8ZG7pEyC4+xOXFCYtG7Dlq6X/bRHQz2IDlBwjiNAthtXMgdAduE?=
 =?us-ascii?Q?nP/D4zncUiiZldcZQAhwqJznlue2nhKSaa4yoWW3ti2LmzkmRWfn3Wc5HnEP?=
 =?us-ascii?Q?jHxtMoLcJkK8K2M+VJQzL8J9Krru7Yczw94LG06ElmT5YX9hdU3599LCPzQU?=
 =?us-ascii?Q?guIMF333i8mkEasfC12WH0gom0Oa8aVXaI6elY6Swff8x5KJs3hrkwT7Dz9q?=
 =?us-ascii?Q?F47x2jjadPLEjTeqg6Ax9Zm8TKIqt0txKMPoKeVARvUAzw7h8A6sGQSBnOx4?=
 =?us-ascii?Q?3KXvH7cP7Ogg5VKqm0Ne6d3Wdp9orfS1B2qtUtF9Zq9/I+qliIWmsR2PjJ4n?=
 =?us-ascii?Q?dU2PzZHNUCp0UoXUbJVVsYwpYEyxuIMP1w2J/VYwnQrD9qkDABZSKoWcfA1I?=
 =?us-ascii?Q?bX78aWJhYH0MzpWVJEvB42YzYfLyjBqX8SBQCqhVgejY1AA25bbQfep/bc8v?=
 =?us-ascii?Q?QteZReZTL5HFTMmbFf7Ing6IBvYJ39tI//iZAKCc01Kum35hPJfpMfTw7U31?=
 =?us-ascii?Q?Zory2hpN23C5NHQKZ3idFhHsbqRVu2+vTJs2LKIkpzHcJw4awIMQeDveg0AN?=
 =?us-ascii?Q?+YWcsiRfCDvH3MkKtzNSgW6f7Mj+TwnK1lCBdFFHovAZwrh1MPfsxK+mVxID?=
 =?us-ascii?Q?2B2DAz2NCqYJeY+u5L9iuWdxmf8mtQMNhVmTy2LVXYdJwg/BecECpSLQ4M7i?=
 =?us-ascii?Q?yuPAfBuDeRsPxkZloXKcyBxSVU820bxJBSt9x6ge/4ANgwsgZ0MKJgPVG3GW?=
 =?us-ascii?Q?k9gqPqZu0t99NPzOhddKz29VT9v06NBaspGi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:50:11.5409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96306e75-5c2c-4b8e-195f-08dda69bc545
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780

Add documentation for AMD isp 4 and describe the main components

Signed-off-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Change-Id: I61dfb3a39e5ae372ed48f156a81ae81ee17734b2
---
 Documentation/admin-guide/media/amdisp4-1.rst | 60 +++++++++++++++++++
 Documentation/admin-guide/media/amdisp4.dot   |  8 +++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot

diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
new file mode 100644
index 000000000000..c933e7ae171d
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4-1.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+=========================================
+AMD Image Signal Processor (amdisp4)
+=========================================
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
+---------------------------------------------------
+The isp4 is represented as a single V4L2 subdev, the sub-device does not
+provide interface to the user space. The sub-device is connected to one video node
+(isp4_capture) with immutable active link. The isp entity is connected
+to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
+also responsible to configure CSI2-2 receiver.
+The sub-device processes bayer raw data from the connected sensor and output
+them to different YUV formats. The isp also has scaling capabilities.
+
+  - isp4_capture - Frames Capture Video Node
+-------------------------------------------------------------
+Isp4_capture is a capture device to capture frames to memory.
+This entity is the DMA engine that write the frames to memory.
+The entity is connected to isp4 sub-device.
+
+Capturing Video Frames Example
+==============================
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
-- 
2.34.1


