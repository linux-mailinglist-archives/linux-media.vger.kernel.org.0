Return-Path: <linux-media+bounces-42287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B88B52E04
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462E71C247F2
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D4F31195F;
	Thu, 11 Sep 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TMluVeZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB33112DB;
	Thu, 11 Sep 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585396; cv=fail; b=V9Uaw5X6x9KyHiFOsGBnSkWL1gVggg/M0+Ic5iB3fwMwIzmmBsQCviie2gHBVg8hB1QfZ4MUxIL6th96sLptLI8PbPmfbGlj5WSmobv8Brw2iGuQhbE2J5Ka5Dt4kwBRMXcit6rNxCIp18tygOTAJKKPhUexd4xmwvGX1VDSz5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585396; c=relaxed/simple;
	bh=VqaKGs5GC4+VwSwomfOLfAZcdY3RTwKr9xADgAF+dOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxKJ8Fmc/nOitsZ10oGEZJHdgDwFPpmLWnAY7C9ur+NrwkT0zRLqnwvcfsv9Q4AbWTmCcQI30Sh9I08rXtKgLDKcyP5cHapv3sBhX4S1mk+J/1r65tMWUm02J1OYe5llSdDwZP0uUvI8nuNpvDSGeYCUwpNIRxZHbwiIb8YdEa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TMluVeZ2; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKhpYtlQcOE1XHciLcxvwzxMdZ7seL6IHLEKI3lY+nvI5rT931kASrp1ABbyaFyZ37YIJb8nm4f/rSZQRo03J9XDfcdYiMXwHqMm0JdP+YpRu5phyNzJBlgUP+rZ382kvQGYapUpr5egRfclIChoz/hrP26kykw3PukT8S7JfB1UITEFiqZOT/zSgeGpGVY9YXZHTJ13EnEzr99q0e/pEstzwboqgx244+n1UtKk9rGDsHtGMAqENBR4cTZJM9VH3gqskTEsaPPiJGVn9RoxN4ws9ze/EAQcjhyCFhIellg5bYbKzBC3MwuBNTTfkn73I/SU32n+ExHFzAwLKIdrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD5/tvLCzDURBVoq9TkyCVI5Tx6gEsa6IHDU+rSUyWo=;
 b=a9EUCOg/qtPYX5Jp2gYfwgP0rePZcPCiSuyQT1pOVtFS0dD7WJz2oGIgAiR/EJQOg2HJ/JNBWkzV74od+4O6jepg2yv9+n9KGltWP4PGVKPgI91sKSG/2in1hDQwKUTjRuhxFPRy9zLNoAM/c1ic3bWE9oLrKrUwlbXFCb/vtpDDZxGRamtySIwJttRBsYWZ9Eg/G98ATeHroKgYQM7IaW+2UqIZStMl82qdwEQ0bbN3CgcHStHG3PCm6+bZ4ultIKLbgZ2Rsy+Ms5pym7f2WvuPJyfdoSmn4XVHmabVAfRiRd86sVUzVuPFgAYgvsnC8iHVFMtWWmtJS8w5I4tqDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD5/tvLCzDURBVoq9TkyCVI5Tx6gEsa6IHDU+rSUyWo=;
 b=TMluVeZ2qNW1Qh6/zEUQYMbtPmh00OcMoq+rOu2nxNeKppWj/GTpV5N/oQKkuaqQcsvDqm+y/7HlooD8+CmM8FH/SuNDFSEi3e3e6/XgPHWuMVpfzmHBz1laLNGsq1yMOP9BDY0Eai2jPriD+k1hSgnnUa4m4d57GFyk0ENhR4Q=
Received: from MN2PR04CA0020.namprd04.prod.outlook.com (2603:10b6:208:d4::33)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:09:49 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::c2) by MN2PR04CA0020.outlook.office365.com
 (2603:10b6:208:d4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Thu,
 11 Sep 2025 10:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 10:09:49 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 03:09:43 -0700
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
Subject: [PATCH v4 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Thu, 11 Sep 2025 18:08:47 +0800
Message-ID: <20250911100847.277408-8-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: f78feaa1-32ee-4ee0-1e71-08ddf11b57a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L3M1OryZ5pSi44pFzqP9V5QyJ68Mz9xvOVhpc9AbkLqnX/91JI4fy/YOj2iq?=
 =?us-ascii?Q?m7oMPhlVdFvJrKqYiKTkaxK+bJT7S2XcGUewH1w2wDuEPBTiMNlp/6u09u8V?=
 =?us-ascii?Q?vYxfweDdO5zQ/6h8stE0oF1+o7vyhvRQpqaNSADGsy4dgsjMewK3cidRWk52?=
 =?us-ascii?Q?GMGwaI8PWbM+hE2lBkdCZnZoHIbetHTFUPLDyTawRQSGsJ6PUy7O3Kl/EK+U?=
 =?us-ascii?Q?vvvcQoiXhnxuTKOrtjhy057qKKXt6zzUJIj9oefQSuDE2sWX3tPtWsyEfsw3?=
 =?us-ascii?Q?hwEiSM9WxKG8LLnYtUfADbkvVZ7JEx2uGa7apT8+DKked1I2ZV4WAE4T/meh?=
 =?us-ascii?Q?HDm4tDXKS+c/+AZS2peegLGvUoVUl8PAykoIHDXBs8+2Hy82vzhcG1wD0O8B?=
 =?us-ascii?Q?0X1aLh2qIJg1ho/nhJiOaulysYfs8e/ru5FyEpEpZqHzVt1TWXRmnl0c3J47?=
 =?us-ascii?Q?OMAt8kkJlOj27f8kndsqQgHCK7HoZlIvJlIzSaQCcsgRm+MKkVE5uSlyzkoe?=
 =?us-ascii?Q?eDRhng1spPQJsT9050RosUwhvndb83PndNEV3+mg4GRCTeruyXAG09j2S4WL?=
 =?us-ascii?Q?IDXn2hmjgPn5bzWsID4pf6jmAdjXT74ClqhkK0Qna+0yvn6+Zs7LOutadrKG?=
 =?us-ascii?Q?hOpJgHLidkJZVmUvlfHeR/4/F102JRa5siIz02G/P1KxK78kyoRcVHWGk7kT?=
 =?us-ascii?Q?MJnW+qLNVVnQN/ccLVDMU1/drV6p0p8PTEOYwB8IgkNaAcFyJTalP/voGm7Y?=
 =?us-ascii?Q?ocqHixqVo2Uh7am0HIo4gUIH479qN/uWBjcbvYYQlreHEXf3eoJgrHXIwIz4?=
 =?us-ascii?Q?ZjyeO6CwFuznq8SfRTstkwj8Sl6Im7pfq0D0n+gtWIyBBvMVPwS3eWP+qvHs?=
 =?us-ascii?Q?QxgtIiSnF/YDyEBFhYUfnqRt2ngafqaWWcPWQ0ww33SZD15h0g+ltkLUcI1I?=
 =?us-ascii?Q?tT9lpuRfrTTi+DbCUJM/dm2AoKQzjZjDNPczWvuCdenPzU21lp8gIXJDEqF3?=
 =?us-ascii?Q?xNv5XuJCg2coT4XshKvdAGOwX1GlAWAZMwskk6Z21hkx1JMbHgNXbqPjubfR?=
 =?us-ascii?Q?etBKpYjrFG/7PdRZeQBQk1MFVHjIlXnjHV6bYZByzU2FEDsG0ZPuRv9xDqtQ?=
 =?us-ascii?Q?kyen/pqU2WwGHVzw+jdHVRAAKqbHO3kFE0+FcnvVhorIuSX4TZ/P9kiwm5wc?=
 =?us-ascii?Q?stmmXbORPr4ohklkg+AEmCvuRZRpjLV6dcZ1F/ETLC/O6NDqn0oQJll8IS/3?=
 =?us-ascii?Q?4mHsVNaDHrIfQkxpPmv6HqcFbZ6jfEiH4NX3q+cab6m1+oGB6CgPAU0cJ64O?=
 =?us-ascii?Q?u5KhzrKs6F/SjV/NU6fHeYat3Ap10v17r6e0AjBd7K+qP4Texrug/lhT1vIo?=
 =?us-ascii?Q?3lhnxM/ozf00bovN4c9JeMUSI/zvW8ZhXoP0nPfRhPLqMxyAxRRATmZH6dgO?=
 =?us-ascii?Q?t1nrrbliY9dUuQvyZe8S8kWXHjLcz8+aexXMa1UdMiDkrYy2WSerwg5PrViM?=
 =?us-ascii?Q?Tj7FX5ZHg/q/Tx4n5pJ2PywrTIJ0yBX+QwVQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:09:49.3169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f78feaa1-32ee-4ee0-1e71-08ddf11b57a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

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


