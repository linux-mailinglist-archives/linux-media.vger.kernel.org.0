Return-Path: <linux-media+bounces-60567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIG3BGEL+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:35:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC54D8AFC
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 484EE3073D1D
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4013ECBFD;
	Wed,  6 May 2026 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M294kbg+"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B33EB816;
	Wed,  6 May 2026 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060044; cv=fail; b=XMeIj6Y8Ih4NaewCVJNMUq3VV6TIMtd+XTXEUdJQwvCjdIrPiZcX7d7pF+HCjYntnta8XWiNW6SS0ACZGMHVpYI7YZmdMXthH86ebNNl03jmCfTUtrxQVxAjPYcLJO9ksOITQzZ0Wp7wszkgWqAlXyhOcSmk5RipKczlxDO6AP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060044; c=relaxed/simple;
	bh=HSFZmotzeCFiI1F0PiyyCg4r8dSYsSoyLwH8d+tQnTw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKK8/h0w7HyDeRhnBWOsktqvoKRNDu29ZD7UoGRUZtMY+f3mkElxNZyusCdnFXOZCc3rzfO87YNpsZsmNZikxa8QG7pJ3N1k3Wq+y3h6l6EAm+KE8yCVJwQ6l6AjRq2R5ZVSuOW7Ri20rg6MZYqd/fN19VG7MCd8WhgnD66MwIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M294kbg+; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZX3mGROSWzpA5Zi8Wf5T/6QODoi/lQ5TBI7llg2D2UlI8nfaBWXBOwe47TmmnOJar+2hiKqSLYJqfiDFBEt4MQ3SO/ZrkvH996nzjr/EaPo7NhMwJeFnmXvk+wegNajTNZ0elZwxjzfreOz5RfUPxLKmGAUNMT6zxTqJ1qeGp36KET1cgTGZ/kUAd0qN1tSC7BeySZ+oxpEYrzFNe96zLKni45NiFy0bNUwHsmsM98shrOg7sUAu4GL0VrDuxWBwByOa9Va5J/0ncadYL+ippSQqGmShYimA4IKAWnuSmyHJlayOyuHD8jeL/w+HLgIH3YeN3Hs0jzrkAecZEN0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQa2FFofdEEjLXJQvdFPLaflGvlY3cjYg90uULf/6bc=;
 b=tG8EKLvqDD5Mr5a9SLbr1bBDcA6X/rR+W3b0nsgxlhuwAClbvjGqob6a49crAjD/DfMACJovmpRnrcoICQ3dXySIjYEek23gnPiw1dN5B/se5wM5GeKapTCnv5cgbtwtWXe5n0AvCvAcAbmjWt7qOypttAYWkQ6DrbigyodYeMolY6wHBWRg1vUAwjezidrj9eD5U6dccS2ilreMkGErFb3JGx8pGDPvYh9fgr0orbB4Clgg2mzeMZBSa64D5oXqpiSNAdtPJaM5c605CTv5eDnWgRmhlZwckXPsI/PnmfPmoNJNGKMRk2P8F3RLGBqTMjvAqeCOEV6E73yYDM/FWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQa2FFofdEEjLXJQvdFPLaflGvlY3cjYg90uULf/6bc=;
 b=M294kbg+n1wem0MPEqCPB1JEj4VbLH2zbdqA6ma+6Sg46lin5rlcphRKHspjanSOn0HWVxDjZgCrxFNV1Y6LvgK7lABOpl5Duwi73ANA+LydisjvUwUXQmT1BVwi7W2DCFm2rkzUSp/+RYBndoRpNmcaxSNpqpCSLjIYlUyXeLk=
Received: from CYXPR02CA0083.namprd02.prod.outlook.com (2603:10b6:930:ce::18)
 by PH7PR12MB9125.namprd12.prod.outlook.com (2603:10b6:510:2f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:33:53 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:930:ce:cafe::96) by CYXPR02CA0083.outlook.office365.com
 (2603:10b6:930:ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 09:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 09:33:52 +0000
Received: from ff1c6181612b.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 04:33:47 -0500
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
Subject: [PATCH v11 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Wed, 6 May 2026 17:32:49 +0800
Message-ID: <20260506093250.93460-8-Bin.Du@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506093250.93460-1-Bin.Du@amd.com>
References: <20260506093250.93460-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|PH7PR12MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc9d93d-374d-43d7-d3be-08deab529647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9afu7gMUnkbj5/LFj6CrzTpulqwoulgXa/73Eq+S54cM4Nb5uL7s18m3NDmue5ORrMuaXMJARH6w9DxBbBMIlkfZ4+6200sHzcgLXrDqSz0zC/iS6Rekui0tG3JR4s33XH0bW8pdphl/zQs8hn1qM8cR2Mzktnt2ZG02vdHGDee3EgvIQhlYY+33bw2eR4aiVzFStYBcyxenIo+H8mYYkc5mhAXmaJK8tVWI16Qn0IejK7po9c9F6GbVo+sZ8tvJGnSsd+CyfTxy2SRLQd/miCx7L8ExTuyfNPOvphqR2iiRpGnmWgz1HzhyOW+geJWSK3e+l8xPWLecSgMAbX75AULiiV5v50qd6JM5BDQBeT/td8xzVxH7xQr0u0Nn31J91OxAnqRVT32gPcZkIDyR5UtI/oMfSMqu0pDX6dI0X5no8CXJtyxZWka5Aaqg8KUSekW1IZNdMpp9Q6Uj8B0XMofMjCeWb88fCrYSrgvNUek6UbgbnZF88o1wBDGWMprdaxTRc8vCf2X2WsPYHnail818FiJK2f+mzd6+XDXfIDnxF40lV2VSRpVfu128hgCtBcPHWV78jGiPZXoCwfNES2hoxTsplJUTGbbmWhdzNTUA/HtE4aUkV5IN50ehNy7ODFcs87/uBl/KPLdDaMDW4OBCWX0huGRorrhsQ5TAm6L2yKC2P+hqn+/TGwbhdBTEA6qZu8ZEWJFx655oBBGfXXfFld+Jovu7JshkgLU8lmM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ghms6ir9YVslX6o4YaglyAysAeKKG7WUT2w7h/l9Os69hfIVI0b12z0UP/aMAQnp4PO4Kov9WsH3+CZAi7oEzPuPMH9vG5MhTnZYFscp3mTVfhjSD92p6av2RqkpwURSN5pOWNfbrgr224Oy4pwLzqIGhUlHh4CuYC6VrQoDaoUrj8yca3BCFbLnaniChKCe60ylIMZLop0E+FbEFkPJyPhPZ7s5t6qSl4rCHMLtfSETkRuqsmVYXZokja0WhGnpoKGX78Xp7kEHiAnIoJ0MO182WMzUzWsiXXHuclU/EnPMKNwquR3vx4mhtA+tkhOdu+kXOhSWl8VS7nKoe1JZNZ2VaFkSzP1Ap9IKc/lxLJ5MXRCobQvDfM3q7N9CoAdEcYehzQo2uVus0ChNZwE4HrGvzdJZDB3KmzsgiDlazAeR6YsvEEMU7ZshFF4LQNT1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:33:52.9602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc9d93d-374d-43d7-d3be-08deab529647
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9125
X-Rspamd-Queue-Id: 73AC54D8AFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60567-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kerneltoast.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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
2.54.0


