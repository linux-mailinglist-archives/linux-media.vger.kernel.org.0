Return-Path: <linux-media+bounces-56491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAhSBNEIvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:44:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 140162D75C0
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0576630216EE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B47377006;
	Fri, 20 Mar 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yzswZ84K"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201F370D4C;
	Fri, 20 Mar 2026 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996173; cv=fail; b=KUsdm1LMaBbAq/K0AbWSUW6+goGxPhAgHLWJfCSaUO2aBs6OElDj9lgGJCg2KD15mqjFlzVGi+poKbceTNyl2ArstRZO6fr6Z+m8rFb2b73nK2BJjRFGAFpj/5j/v9+JIVFMdrjqh735gFIZwlmTq0+m6i805veTjHUfn74fLGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996173; c=relaxed/simple;
	bh=xwgKZFdpr+jaMs0Y4nwKnrxJqftNRXRvF+CQWOqzXLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BO6pnLrfcqelH0V5F8ELcxpDItlCiR2uoNbbRo7+7Mc1s/xvCGTaFtgTj/x8i/vuqr5ytftJfjMU7ry4SRBiknuwjE8KpDGachOM2JBATf6mFJq1Lz2jD2cjOAQQ0r7bxpiNbm4zwRJIxGag/z/XiMQ24/ELp3c3VfPo9NSt0qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yzswZ84K; arc=fail smtp.client-ip=52.101.46.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ee80ZWoR1llm1Io1iWE8ijpOGQhs/f2r+sTXyI0YbafQUoVvwbtyoz+vTMNZz88V4c6HoQLNLUx6aLs9twidLZ03TrQy7vrTGqosGgauQlt6xgysF6s2TADUufDYqta6BsxdM2nRb+1hJPUpq43N7YTnGDxKsRx6NiCit8e6MWSnrpZ1OQYT445xn5XOIufruMX01x+AuZ7z5zAEiVBc7YBzRoXkGU58r61KzcK9J4u89rtZqLF+WzzdQ/wCQzSMmBrpF/SU1YaUk1SMATV2pobMTuI3NwWDdZa9LCDKRJJJ2udBIKibJ4GQ1f1hLr8ujY53qK4HBn5lHyTgnxUvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5ogj7hnRG/y3u1dBiP0w0qbFL+MYKPda6ns+ucEj4A=;
 b=S4W9jRcpfocLcV+A6z3uwq5N7i3QpEfWs7gx4hjH2Wxf4VOpP2p+Z7pGrTesD+2pWoYK5BEHpY4uFlqMKi10xqdMaAh1qcNy5u7HgeM5qHNQNkkqDWb/o/Hh7JBCGAzDJZ3O7jyPeXN1jwfzgI8J0J/+XCaWZF7CpRDKbVw+1k8tAetZ1kJbbZH4OXu0XMKSJIpr45PQXv1Mk7LKz+3jEI3eUMkr6Xu+UR4DDvDorZaXnrNYRW308Z2TE8l82ji5HPzCKjJGUftA2cepI8M2HE+Y2jKgUXD+TdM11YDuV1RF3sTLgCPL6aQ0yBLopaC1Nv5l361rw1auAL0fHGJfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5ogj7hnRG/y3u1dBiP0w0qbFL+MYKPda6ns+ucEj4A=;
 b=yzswZ84KMRFRyneyvxw66L+wbJFZMs/LsJn5R9KCPJQb0lYoA/lHTI8z61JRphNTzxov8CPww96wCBIq/PpxZholfacihLLKvTAMOGA8yHhGZw0RqPaSo1kiGJ4hEVnWopmm6FUEiEkN4gFgOynBOw3xpJIs56lOxwzAYPQyjlI=
Received: from MW4PR03CA0219.namprd03.prod.outlook.com (2603:10b6:303:b9::14)
 by IA1PR12MB7710.namprd12.prod.outlook.com (2603:10b6:208:422::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Fri, 20 Mar
 2026 08:42:46 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::fd) by MW4PR03CA0219.outlook.office365.com
 (2603:10b6:303:b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 08:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 08:42:45 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 03:42:39 -0500
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
 Limonciello (AMD)" <superm1@kernel.org>, Alexey Zagorodnikov
	<xglooom@gmail.com>, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v10 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Fri, 20 Mar 2026 16:41:46 +0800
Message-ID: <20260320084146.200988-8-Bin.Du@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320084146.200988-1-Bin.Du@amd.com>
References: <20260320084146.200988-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|IA1PR12MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 2137bbf6-dce6-4661-6725-08de865ca8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZBj6ulxHN8pegWG+V6bw2piRfGK/oNFyRPPGoyhR2Luc7zJlmj8VmvSCiyG4h6IaXx430JSyDg+oY0ngiZLQmw5/eJymi1bQyY8IO/ZITJ0U0JTrsrTE7w4+JkvjVjHm5UT/hQjTNFaRKkIrk4OIjgjfpYp/Fvqhayy3l/FYRIXzhmsyf7Tf7CDc1f9hIM2qAV7IZ31JBl2E89EUSDkwith8rZzaBOz83Hty5W8ttUb+NEiwD/qSA8JH+l0H5umwSixPmdpo0jebazwsun6At81vGZqCpZ/CFivLAmb2RoFNTXoOwhtfwXyy/oIrrryqMe7vFaVqlNgj7VE/UL6EcfJ5xutnqNFH0+EucmxcBO0J4GvNOdFcp3JmLrqTDbvjZFh3uo19bMONxifvQq2Rze1ZHXRg/2HRqL/bHCCV+ALVarv3NrnIBHGMOR3J1z5cobQ/zFfsneu7hf+mFN0HDiv9LwJL0Tx195Q68JEl2qjTjeO4lfBeBftvU4x5/1W2ubmTzwUyLo6qDhfZBUhJsTG5RHV9WPQTvITfvX0/BJvtMWCgEmdIzPHkG4ax0qMwKrRsXVZyNJEQjnqvtgEeIWONHo+BafmVonvLzJBK0taH+Aq1KXkUKwW9gdVjSHy4qLv+zqfuk5dgjdT2DTbqjx/Ulyb29TwcLotrCUuy98Gods27uLZvrC8/uOZUz8PJgOk0Kc31pdCauVBY2ZcoCutQO3r4vfXGwz200G+seAV5ttY1olQp1RQb2j5NGgJbpUOvXdsKD+recNp83B5Dyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CFUDOBj8ZL1B/y1iVsHCuL2IIIOx/YO3syeTJ1C7QxQSqsyc16dcReuonfNHj9zx9JLvGUvRoTFr8PCPwtUF6UenmRrzUzllM2CVVizWTNHlxMdlbQ8XBwKvSL7ynydweUOcKXX4NtJd9gc9npJ7Jh73wu/QEbvA4WyuCkt2/buzWbK/xoZydo3F9WxSPcHU2x9ejS7UPH59uEJaTvD8e/d936vtt6HT9vw6JUSkz9WkbUidOdt5hxg8/7i1cRXaL67tmvlkfM+3ECmRT0h3c8Nz2KnMtCBoSh2T4XWPRCm20uTRrKufPHnKe132AQqRCrniPzM2GjPOzwTu+0pv1Q8BBtg8R/t/WLkaEwz5YZZ355cMzl8EFUDEX/6OYv9W+ts8DD/Kzmnjd8220uf/4hJTGTqwfSLrdNrEYqyyoU8PScjkJvfQ2Sf8hWECD96/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:42:45.9845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2137bbf6-dce6-4661-6725-08de865ca8da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7710
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56491-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.904];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 140162D75C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for AMD ISP 4 and describe the main components

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
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
index 393f83e8dc4d..0fb88449fffd 100644
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
index ec0a4d49f4d8..080c7cfcaf46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1168,6 +1168,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/admin-guide/media/amdisp4-1.rst
+F:	Documentation/admin-guide/media/amdisp4.dot
 F:	drivers/media/platform/amd/Kconfig
 F:	drivers/media/platform/amd/Makefile
 F:	drivers/media/platform/amd/isp4/Kconfig
-- 
2.53.0


