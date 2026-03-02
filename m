Return-Path: <linux-media+bounces-54047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGDrMKU9pWm36gUAu9opvQ
	(envelope-from <linux-media+bounces-54047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:35:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E91D3FFA
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031A2303606F
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 07:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A1A383C86;
	Mon,  2 Mar 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dOqCBmQR"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94D30DEA9;
	Mon,  2 Mar 2026 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436747; cv=fail; b=dDSNaJFMI5+YiIIjGpmpEHrZqbwgtQ9ITtDKHOc4yGuuPoYoDrprB8CfWL1MmhgyIXwDJhQeJaacVYkj6fyLETead4yKZxTDO7XQo/ncFmxNPjeEDOzTo4vCXQ8az612Dx2cBc6AEklQrvuO1vGTd2+iSp9pQC2zU3uAoDpCgyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436747; c=relaxed/simple;
	bh=L/D4M1uUh97+0QlISXQ4qe1pcG8w1nkjcoyPdhxUOhI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXt5ECBmtvH/DhnOWskt2SKZ4cjvUQJ8Ozb3I95ZCQd10KMIsgV9SBwjjX0Jkt2+VdRBH4hMwmNk7EQKYASHycZwTAvkgC0h81Fr9K98Pwtx9hK25dklc5mh6zurrQXbvQkiRBXDV37u4SueGS0SPEEVHR5B8YDHGzm9tGwsQpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dOqCBmQR; arc=fail smtp.client-ip=52.101.43.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q43xapi868rCQna9E/+jfFdl2LeHtCZ1bdm0Xc6Tpb6LB+PclbSMA3X/4h8+xzXEsnuSD5xeM4CddsI/gPWb1dcd8+YDZn63ZTuJhy7TaA56LUPy5LxaqWA+9ZDNrkFikKDBce/IWj4OLqOXll908deZJvImRmkXT4J5KWqh/+WCI79z04E4s7RX7wwEh0gDoD0PAAziPKVt0IgQWzw54O5WSjRwGZB0k1L69gzBh6YTlhJUo2nqUrZ2BNDoMsxjTk0o9BXDXS4tQaxBPbZf5tqcnrsjk3J8wn3S1zCPl7opwaYnyS9MZT5w72r29D8tQnTWdblCZRNFHjTNi9TLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPEo44rdS7XJEhEhc/j5KeRfd8omhIM/5XHVbkKb/mU=;
 b=skNSuphET6NSbNd5wZUozUubZuuJEf8zXL2Ms+sZsblV2n/VUKR4u1v4KJLzmBeH8p6MBeIA89MecMjAQE0gobUM/3mVishyKrS5T954CtyGMwdTEzVet1ciXowlaCiGSbzGU+wYwKdhu39KaFchhctOBp2zFmiCjhKSK6pRBassGJ4/2EJtZq4pX3bHBc4j6xOLCD0VOrQshgIWrgU2L/SkF/UjqJRTx2sOrcHTscEJlbstJBgwRzlrz2N1anxqdvqeWvrpk2pbofa3PJY1N5YSmFQEt4VC6bTLOxL7DNHM34btwk+Zusrtm7jvuPIbIamW4VXOJaKD9zawsfHLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPEo44rdS7XJEhEhc/j5KeRfd8omhIM/5XHVbkKb/mU=;
 b=dOqCBmQR/mm3iWyapW5IZayqoVbyAuOQb5Gz78PkKfoePn2sUCz0rJ3dTvp5K/V6/NyIBHLVqa0nQ9hszuF8UNc2R8nb62nvo/zNuP4Ut9v3hdlCc5ZmYx6LXl66yf/BPEXHKIOjJnLvF4Zya8oyY0vzS+vyHnMBtCb4FXhtRjg=
Received: from BYAPR08CA0006.namprd08.prod.outlook.com (2603:10b6:a03:100::19)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 07:32:17 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::3e) by BYAPR08CA0006.outlook.office365.com
 (2603:10b6:a03:100::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 07:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 07:32:16 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 01:32:11 -0600
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
 Limonciello" <superm1@kernel.org>, Alexey Zagorodnikov <xglooom@gmail.com>,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v9 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Mon, 2 Mar 2026 15:30:20 +0800
Message-ID: <20260302073020.148277-8-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302073020.148277-1-Bin.Du@amd.com>
References: <20260302073020.148277-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: c9919d02-2580-40ac-6a7e-08de782dd47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	DLj5nakQ8o4BB6Ehb8Na5MX1VMVuYQqsR3miVKtRXDPEToO4YVdJq78NNKQ37ip5dGdi+oQ85SU5wHm9e9Yxbyq0tDyW0WBOdWZBsbNbPQH7AjtC+NF74gzuu44oN5PTpcpZ+4uTRuhiHaEzVD2Z+PTDpJsNAzcUA0zr8nmvsMBz78RKW/N9UjJ31WzW190L3RSCyT6LJEMrxiaDyxP4bqWEQIPAGB9byflsr/Ewz/k27LIJ6QP/mdDOk49JR+UD1daJSjIqnNxWApCLsqD1Mf8QYQkE8YO2GrQ7Q6pr6l7w4+cyxrRdcx3hRqJJpxCa2qBYYBMQQpGA8Rlqkcp+O3AG+WQyT5A54l2oFGVrVGafkdgA+1KBVNvs1lT+SJnD+EmFdK+9ZP15boRyAtEfTDhfT8XVo2u/mF7XgXlHamkZcXRTdEyNOSv91NYEdtzoFkwNrV5pyHP7juhJh434uT441zhaAB5/oyC4myjOjkhHoJYN571DH4Q35HyUT4tOT0BgvHigfczoSpspUBcHP9OFwnJ0GpyBZ7Lr+z9YUuF0VqasNuXFOiY8ChMG359eTfSS5Uo1pc1U/opc1ZAxHaTZTC94624uZu0pfG/5zUtAt2TSo4ftY5LOO/sqBKjvLgC5B7j8WIsuN+2eMdE3MSaBUvGqjNaO0PpjxU4w15nVyj+mS/rDkUib9HVSa8wWU6QOFj5S6COCdH85FELgKYoA5deofkO3npv6ZL4gbgZli1RnGayhwLEuAdJcCbPLmddoF+tQQzdlBInWh3CXZUa+W+sREYLj9lPuv9LWXjC9SN48QGAuetY+an5NmVczunsq5mdihzzzQReblY03Gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3YF5YdtAfLeZIa+q4pCvkSBHi6s0LhLuodx3HF7UEWpNCQkgDdSgHqd3zOY++rrnENzddPC4pErVLTbU8EKpYHBKax3Q+5Vz0YW5bo03J7f75e6VRmquAa3kWVm4egpBGZgBHD8hg/MAdyebZ7aVVKUKA168A6MuIl2kB9DqsAi2KNUyTnZ3hTVAdUdodoZfxUVyMF25XfhDb1zvO6p0rJGg0ghI8InWjK57rK2iOQA6HYgHEpQ3LcAyUE/tQdAsGU+mq/YDmMrwXVwlVoQVYNxnD6Qg74AQhuYSUIpgs59xGtrYHWSdKw2A1abM4SqAy9n0M5A4NWBsAVUEPZWQbffPHWROr6t8n+nSVI1DYfe1XTrPamTq6B7klMdLNksjF5jjBeAIgZo9Omr2Lhtb9IZVu76OWTX4oExUWTU69Vp5ssgpLFsLcTMcffnH7Xb2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:32:16.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9919d02-2580-40ac-6a7e-08de782dd47b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54047-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amdisp4.dot:url,kerneltoast.com:email];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A4E91D3FFA
X-Rspamd-Action: no action

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


