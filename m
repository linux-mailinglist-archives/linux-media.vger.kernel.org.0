Return-Path: <linux-media+bounces-45466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E700C053F4
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFF7F1B81D36
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B31309F18;
	Fri, 24 Oct 2025 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aj4+Hc3e"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013021.outbound.protection.outlook.com [40.107.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72B309EE2;
	Fri, 24 Oct 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296849; cv=fail; b=DvF8xX2gXqzI9xWKMtW7JYY/mzKg8iQrxmLN/lO+a/mAcxvCqJu2008FcaZOJtpffwhs9eX4dkX9gA4C4Q3cE/mPTo/2dw9BZlHFh7PhOSK1UnpGXmc4BKAu6JU1WRTghHRvwMYwatnREvUAr9sPtMiZ863zdx3muf5D6QggM9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296849; c=relaxed/simple;
	bh=RbGNeKPhsgX4GJUmjVhAqLDGsCpwWquy9GUQUwI0uaY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJMnWIREx9y30QqU+cebMkxAbFzta7r4TPuUUEt01UvijWsjwJqkZRpdFTN/L4oHSFSqBrDy15Zp+Iv2YM6nuAG8ujU8uPl4ubkmf4IhJfQJOpoKuzgr1Gz2WlUK5Hhy0CyZOC1mkBe8cI/qGEnI1z1xbfrX7SBqEaR88wapWu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aj4+Hc3e; arc=fail smtp.client-ip=40.107.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/d2L4z5jz2aaKlKABY4a1HPlPed7mCR/7CKukJgtdTiDxQisayz05yzrfeBDxM+4ndo15oI0JnVEGCKQ1+BuUI6+3slw9itpTLSFOOipQUhBhKx1t68uUXgfYnqStDwQIkz3E+VcBTfmHPc9DtNrqwVMMqbZU0AsYxa7x4R6EFYDy/DDUCKDbYPk64lz+ZJ/Hfx4mqbpU8hlfAPWg7VunMEMk8oLYOMNA6TPmMsIuksCp+AMKcfuugZpH2nVRvfNPXFrlUX2b6mZFzmRBVtjdfijEr6zCnAFTppTK9VnQwQ9uPOcFi5Yf05kSecL7nFsbEoo8tv1x3nsqVb5dgfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhv9MjLZm6ayrGzZcETHuUf2ihcEz8HnGrGRK99ctCY=;
 b=ZICwqBuBzReVNr1W+XO6dMLVEmYqwYg5HX1B9Tm2bEduLrYKvAMYr95NjAryw2LFgkvHAyAgw14TszrSfV+bidqrrhFrlckJ5tEpOvyDyM1UidGDsTgoW8memU4v+vL1Y+PeyJ9DTuK3ctvqrnMu1wshdjsFmyTxNxb6wtDso9I0xuQ+i0/uwwBctdD1GzMPS14v3XIFQ2VLaoM6wTx1cPupj8yKqJZ+QDPK5DqPPuJYC4IsCOltKiY6qaNqLl1kAz2YF5o8yiGeMxEi9bPLXSAs5mar+dwfzrKFRdOMeSIJ/9TROykwPnbzIfqDPJS2Wm//EwcCSz8XZmCxqOoEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhv9MjLZm6ayrGzZcETHuUf2ihcEz8HnGrGRK99ctCY=;
 b=aj4+Hc3eq9nIg6pBsZiRyzfcCs/QI6EhLbvL0J9oR3dlbZzcwWkUjDlP/jbCNRf4zSou7GRs1vvZtZEioR4I5YCdIC1NnTNsHXh+yBRpnnoIJr/H4HN7JEoTTGXmpwBJhWYcSHxbrnA05aEijjJYTlFS4jyji0qsmcdlBEpi4tA=
Received: from PH7PR17CA0064.namprd17.prod.outlook.com (2603:10b6:510:325::21)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:20 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:325:cafe::8a) by PH7PR17CA0064.outlook.office365.com
 (2603:10b6:510:325::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:20 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:07:14 -0700
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
Subject: [PATCH v5 3/7] media: platform: amd: Add isp4 fw and hw interface
Date: Fri, 24 Oct 2025 17:06:39 +0800
Message-ID: <20251024090643.271883-4-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8b92da-4589-4caf-48e3-08de12dcbcdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A8WkrFR3lD8T4hJ2lpqWxY6tSJomy1GJBcdZIgqTKVePEsOsbbTUK0VQjGT4?=
 =?us-ascii?Q?xRL2usgCxiqpniN5l8KhCIQJYugPZOkSu3zc3+hCksc9kBXa4dzdbdGuWR4p?=
 =?us-ascii?Q?ZssIc6oDogOLcO7qHo7bJttnVwdVRAPdyuqBudHAYMq3Jty+XM++ItoHKswj?=
 =?us-ascii?Q?TNYW1uI1sOuPpykrRNeYAX5pPZgslzsy01TUGVrmQsg6IkEk5tROU85IMdtO?=
 =?us-ascii?Q?ntHKtNVWahOL5K/uXpHUheQpjUpx+MJjHe/TyguLzbWi95Wox6OyencsBtTc?=
 =?us-ascii?Q?FrpOR0VZ6Cl6bgCdWLPcp+654Z/uWSSFKm1O/JXZrq9Z2oLcWO+PLkbt2CZz?=
 =?us-ascii?Q?J+Wl363w+7msAfQV84DtWh0vyj2OXbMA38NKVkxGWW/orntUa5rHZXOfVu4u?=
 =?us-ascii?Q?YPIZ/V96H6y5FtbChk/2iGC1KIlziniANJck/TfErTKyJfhKR8RroS5/oD/t?=
 =?us-ascii?Q?taIOuzTygTxD03VC/gxOST/wfZ+xYGbzqO4YaCPgopWFWZx22PC1LKDhbYcc?=
 =?us-ascii?Q?6Mp7HRKR9lXAJfiYYwUteCphugKu9PXke4ZD/R2VZSHrH4or/ih4KSQ80n83?=
 =?us-ascii?Q?I0cPL710EidisUv1IztlcBO/4eJW4FgjXxL91Q8NNhtdA14KNw458H/ohaJx?=
 =?us-ascii?Q?EyFSL5ZptF2lJqtLY8cuoAc/HgVVWsifbzr6N0Mj9aCFr4kLZMmNCTLG+ZXe?=
 =?us-ascii?Q?jNFCP2UhYtywiO0ytY6KEnhoyX7lPz9VMWg6GUnMwaJh1XCUYKPNYOE+Nm5H?=
 =?us-ascii?Q?TbxZoKXld1zkOblRHx66dvNKChxw6ch0goZ692u19FbGxFWivYIRPJrXeikY?=
 =?us-ascii?Q?7iIJQd5SW9yeNbMdI6GvZdR4mmWULr3rWk/rUeu0C+oo1mptLaksVlC2Xzhl?=
 =?us-ascii?Q?XpjGoERsgpBE58ALXCDiQFDVYA3/SrVRhOEQP3AxMLW/Ve0mYgEkrknu4sIr?=
 =?us-ascii?Q?mZVQJdyXb6rumNnxpK0cQUQvf6k6oc/8aCqzzDtRUWs/PeTTX2Vmw1bsvis4?=
 =?us-ascii?Q?ct83/l25ad1khpKdw77bmSQtX21wszh2h83GDDQ6Y1WxSrJBMTWVASdSytq+?=
 =?us-ascii?Q?IoWZ43GtlKkMnZG0M6k62N/UKmx4od1RB0ha+4HA+rYJ76rYjvHP24QlPDu/?=
 =?us-ascii?Q?Id5GS97Rxw9JafnP/zsAiwQNJFqE8cLgcwO9vOFGMukLYxZrFEr4XSZZoWwX?=
 =?us-ascii?Q?LqzqBQGlPy6dw1zTBiM5dQo0O2v5dJ+TFGKX5dKADYcmO3iIxTwWRTeCVcd1?=
 =?us-ascii?Q?i9kCBAO0IsMLXB5f3YyVkRA8RtK7jtulSxVu/4Tv9O0SfeujQ6kUfuvKkHrF?=
 =?us-ascii?Q?vE2xxcO2F7MUdZvKTkBsLlGNbzmYhG6TIgJdQzPtYacjYLmaHtPrg1f3/FYM?=
 =?us-ascii?Q?cWa1ski78Y8hasywDO3a4kwpWm6EIbu1zY7HFcEtwtaNfGL0MOQmp2LRqxuR?=
 =?us-ascii?Q?tfVzum+ApmOwo2PWc70nArvtIMnQc2X9wo2h5i6lpY9qW6fRAUC/WauD5xa6?=
 =?us-ascii?Q?Qn6FJMyVUonjJ/KcMlx1lZ7kyn0DgAXXhSRsz9j6oO2zOxY8YzhpKqwo2Otw?=
 =?us-ascii?Q?P6ZkPiqMyuS2sQBVDxY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:20.3118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8b92da-4589-4caf-48e3-08de12dcbcdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

ISP firmware controls ISP HW pipeline using dedicated embedded processor
called ccpu. The communication between ISP FW and driver is using commands
and response messages sent through the ring buffer. Command buffers support
either global setting that is not specific to the steam and support stream
specific parameters. Response buffers contain ISP FW notification
information such as frame buffer done and command done. IRQ is used for
receiving response buffer from ISP firmware, which is handled in the main
isp4 media device. ISP ccpu is booted up through the firmware loading
helper function prior to stream start. Memory used for command buffer and
response buffer needs to be allocated from amdgpu buffer manager because
isp4 is a child device of amdgpu.

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 MAINTAINERS                                   |   3 +
 drivers/media/platform/amd/isp4/Makefile      |   3 +-
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      | 314 +++++++
 .../media/platform/amd/isp4/isp4_interface.c  | 887 ++++++++++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  | 144 +++
 5 files changed, 1350 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7aa17c7e71d6..cccae369c876 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,7 +1145,10 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
+F:	drivers/media/platform/amd/isp4/isp4_interface.c
+F:	drivers/media/platform/amd/isp4/isp4_interface.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index de0092dad26f..a2a5bf98e912 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -3,4 +3,5 @@
 # Copyright (C) 2025 Advanced Micro Devices, Inc.
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
-amd_capture-objs := isp4.o
+amd_capture-objs := isp4.o \
+		    isp4_interface.o
diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
new file mode 100644
index 000000000000..39c2265121f9
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
@@ -0,0 +1,314 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_CMD_RESP_H_
+#define _ISP4_CMD_RESP_H_
+
+/*
+ * @brief Host and Firmware command & response channel.
+ *        Two types of command/response channel.
+ *          Type Global Command has one command/response channel.
+ *          Type Stream Command has one command/response channel.
+ *-----------                                        ------------
+ *|         |       ---------------------------      |          |
+ *|         |  ---->|  Global Command         |----> |          |
+ *|         |       ---------------------------      |          |
+ *|         |                                        |          |
+ *|         |                                        |          |
+ *|         |       ---------------------------      |          |
+ *|         |  ---->|   Stream Command        |----> |          |
+ *|         |       ---------------------------      |          |
+ *|         |                                        |          |
+ *|         |                                        |          |
+ *|         |                                        |          |
+ *|  HOST   |                                        | Firmware |
+ *|         |                                        |          |
+ *|         |                                        |          |
+ *|         |       --------------------------       |          |
+ *|         |  <----|  Global Response       |<----  |          |
+ *|         |       --------------------------       |          |
+ *|         |                                        |          |
+ *|         |                                        |          |
+ *|         |       --------------------------       |          |
+ *|         |  <----|  Stream Response       |<----  |          |
+ *|         |       --------------------------       |          |
+ *|         |                                        |          |
+ *|         |                                        |          |
+ *-----------                                        ------------
+ */
+
+/*
+ * @brief command ID format
+ *        cmd_id is in the format of following type:
+ *        type: indicate command type, global/stream commands.
+ *        group: indicate the command group.
+ *        id: A unique command identification in one type and group.
+ *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
+ *        |      type       |      group      |       id       |
+ */
+
+#define CMD_TYPE_SHIFT                  24
+#define CMD_GROUP_SHIFT                 16
+#define CMD_TYPE_STREAM_CTRL            (0x2U << CMD_TYPE_SHIFT)
+
+#define CMD_GROUP_STREAM_CTRL           (0x1U << CMD_GROUP_SHIFT)
+#define CMD_GROUP_STREAM_BUFFER         (0x4U << CMD_GROUP_SHIFT)
+
+/* Stream  Command */
+#define CMD_ID_SET_STREAM_CONFIG        (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x1)
+#define CMD_ID_SET_OUT_CHAN_PROP        (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x3)
+#define CMD_ID_ENABLE_OUT_CHAN          (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x5)
+#define CMD_ID_START_STREAM             (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x7)
+#define CMD_ID_STOP_STREAM              (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x8)
+
+/* Stream Buffer Command */
+#define CMD_ID_SEND_BUFFER              (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_BUFFER | 0x1)
+
+/*
+ * @brief response ID format
+ *        resp_id is in the format of following type:
+ *        type: indicate command type, global/stream commands.
+ *        group: indicate the command group.
+ *        id: A unique command identification in one type and group.
+ *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
+ *        |      type       |      group      |       id       |
+ */
+
+#define RESP_GROUP_SHIFT                16
+#define RESP_GROUP_MASK                 (0xff << RESP_GROUP_SHIFT)
+
+#define GET_RESP_GROUP_VALUE(resp_id)   (((resp_id) & RESP_GROUP_MASK) >> RESP_GROUP_SHIFT)
+#define GET_RESP_ID_VALUE(resp_id)      ((resp_id) & 0xffff)
+
+#define RESP_GROUP_GENERAL              (0x1 << RESP_GROUP_SHIFT)
+#define RESP_GROUP_NOTIFICATION         (0x3 << RESP_GROUP_SHIFT)
+
+/* General Response */
+#define RESP_ID_CMD_DONE                (RESP_GROUP_GENERAL | 0x1)
+
+/* Notification */
+#define RESP_ID_NOTI_FRAME_DONE         (RESP_GROUP_NOTIFICATION | 0x1)
+
+#define CMD_STATUS_SUCCESS              0
+#define CMD_STATUS_FAIL                 1
+#define CMD_STATUS_SKIPPED              2
+
+#define ADDR_SPACE_TYPE_GPU_VA          4
+
+#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
+
+/*
+ * standard ISP mipicsi=>isp
+ */
+#define MIPI0_ISP_PIPELINE_ID           0x5f91
+
+enum isp4fw_sensor_id {
+	SENSOR_ID_ON_MIPI0  = 0,  /* Sensor id for ISP input from MIPI port 0 */
+};
+
+enum isp4fw_stream_id {
+	STREAM_ID_INVALID = -1, /* STREAM_ID_INVALID. */
+	STREAM_ID_1 = 0,        /* STREAM_ID_1. */
+	STREAM_ID_2 = 1,        /* STREAM_ID_2. */
+	STREAM_ID_3 = 2,        /* STREAM_ID_3. */
+	STREAM_ID_MAXIMUM       /* STREAM_ID_MAXIMUM. */
+};
+
+enum isp4fw_image_format {
+	IMAGE_FORMAT_NV12 = 1,              /* 4:2:0,semi-planar, 8-bit */
+	IMAGE_FORMAT_YUV422INTERLEAVED = 7, /* interleave, 4:2:2, 8-bit */
+};
+
+enum isp4fw_pipe_out_ch {
+	ISP_PIPE_OUT_CH_PREVIEW = 0,
+};
+
+enum isp4fw_yuv_range {
+	ISP_YUV_RANGE_FULL = 0,     /* YUV value range in 0~255 */
+	ISP_YUV_RANGE_NARROW = 1,   /* YUV value range in 16~235 */
+	ISP_YUV_RANGE_MAX
+};
+
+enum isp4fw_buffer_type {
+	BUFFER_TYPE_PREVIEW = 8,
+	BUFFER_TYPE_META_INFO = 10,
+	BUFFER_TYPE_MEM_POOL = 15,
+};
+
+enum isp4fw_buffer_status {
+	BUFFER_STATUS_INVALID,  /* The buffer is INVALID */
+	BUFFER_STATUS_SKIPPED,  /* The buffer is not filled with image data */
+	BUFFER_STATUS_EXIST,    /* The buffer is exist and waiting for filled */
+	BUFFER_STATUS_DONE,     /* The buffer is filled with image data */
+	BUFFER_STATUS_LACK,     /* The buffer is unavailable */
+	BUFFER_STATUS_DIRTY,    /* The buffer is dirty, probably caused by
+				 * LMI leakage
+				 */
+	BUFFER_STATUS_MAX       /* The buffer STATUS_MAX */
+};
+
+enum isp4fw_buffer_source {
+	/* The buffer is from the stream buffer queue */
+	BUFFER_SOURCE_STREAM,
+};
+
+struct isp4fw_error_code {
+	u32 code1;
+	u32 code2;
+	u32 code3;
+	u32 code4;
+	u32 code5;
+};
+
+/*
+ * Command Structure for FW
+ */
+
+struct isp4fw_cmd {
+	u32 cmd_seq_num;
+	u32 cmd_id;
+	u32 cmd_param[12];
+	u16 cmd_stream_id;
+	u8 cmd_silent_resp;
+	u8 reserved;
+	u32 cmd_check_sum;
+};
+
+struct isp4fw_resp_cmd_done {
+	/*
+	 * The host2fw command seqNum.
+	 * To indicate which command this response refers to.
+	 */
+	u32 cmd_seq_num;
+	/* The host2fw command id for host double check. */
+	u32 cmd_id;
+	/*
+	 * Indicate the command process status.
+	 * 0 means success. 1 means fail. 2 means skipped
+	 */
+	u16 cmd_status;
+	/*
+	 * If the cmd_status is 1, that means the command is processed fail,
+	 * host can check the isp4fw_error_code to get the details
+	 * error information
+	 */
+	u16 isp4fw_error_code;
+	/* The response payload will be in different struct type */
+	/* according to different cmd done response. */
+	u8 payload[36];
+};
+
+struct isp4fw_resp_param_package {
+	u32 package_addr_lo;	/* The low 32 bit addr of the pkg address. */
+	u32 package_addr_hi;	/* The high 32 bit addr of the pkg address. */
+	u32 package_size;	/* The total pkg size in bytes. */
+	u32 package_check_sum;	/* The byte sum of the pkg. */
+};
+
+struct isp4fw_resp {
+	u32 resp_seq_num;
+	u32 resp_id;
+	union {
+		struct isp4fw_resp_cmd_done cmd_done;
+		struct isp4fw_resp_param_package frame_done;
+		u32 resp_param[12];
+	} param;
+	u8  reserved[4];
+	u32 resp_check_sum;
+};
+
+struct isp4fw_mipi_pipe_path_cfg {
+	u32 b_enable;
+	enum isp4fw_sensor_id isp4fw_sensor_id;
+};
+
+struct isp4fw_isp_pipe_path_cfg {
+	u32  isp_pipe_id;	/* pipe ids for pipeline construction */
+};
+
+struct isp4fw_isp_stream_cfg {
+	/* Isp mipi path */
+	struct isp4fw_mipi_pipe_path_cfg mipi_pipe_path_cfg;
+	/* Isp pipe path */
+	struct isp4fw_isp_pipe_path_cfg  isp_pipe_path_cfg;
+	/* enable TNR */
+	u32 b_enable_tnr;
+	/*
+	 * number of frame rta per-processing,
+	 * set to 0 to use fw default value
+	 */
+	u32 rta_frames_per_proc;
+};
+
+struct isp4fw_image_prop {
+	enum isp4fw_image_format image_format;	/* Image format */
+	u32 width;				/* Width */
+	u32 height;				/* Height */
+	u32 luma_pitch;				/* Luma pitch */
+	u32 chroma_pitch;			/* Chrom pitch */
+	enum isp4fw_yuv_range yuv_range;		/* YUV value range */
+};
+
+struct isp4fw_buffer {
+	/* A check num for debug usage, host need to */
+	/* set the buf_tags to different number */
+	u32 buf_tags;
+	union {
+		u32 value;
+		struct {
+			u32 space : 16;
+			u32 vmid  : 16;
+		} bit;
+	} vmid_space;
+	u32 buf_base_a_lo;		/* Low address of buffer A */
+	u32 buf_base_a_hi;		/* High address of buffer A */
+	u32 buf_size_a;			/* Buffer size of buffer A */
+
+	u32 buf_base_b_lo;		/* Low address of buffer B */
+	u32 buf_base_b_hi;		/* High address of buffer B */
+	u32 buf_size_b;			/* Buffer size of buffer B */
+
+	u32 buf_base_c_lo;		/* Low address of buffer C */
+	u32 buf_base_c_hi;		/* High address of buffer C */
+	u32 buf_size_c;			/* Buffer size of buffer C */
+};
+
+struct isp4fw_buffer_meta_info {
+	u32 enabled;					/* enabled flag */
+	enum isp4fw_buffer_status status;		/* BufferStatus */
+	struct isp4fw_error_code err;			/* err code */
+	enum isp4fw_buffer_source source;		/* BufferSource */
+	struct isp4fw_image_prop image_prop;		/* image_prop */
+	struct isp4fw_buffer buffer;			/* buffer */
+};
+
+struct isp4fw_meta_info {
+	u32 poc;				/* frame id */
+	u32 fc_id;				/* frame ctl id */
+	u32 time_stamp_lo;			/* time_stamp_lo */
+	u32 time_stamp_hi;			/* time_stamp_hi */
+	struct isp4fw_buffer_meta_info preview;	/* preview BufferMetaInfo */
+};
+
+struct isp4fw_cmd_send_buffer {
+	enum isp4fw_buffer_type buffer_type;	/* buffer Type */
+	struct isp4fw_buffer buffer;		/* buffer info */
+};
+
+struct isp4fw_cmd_set_out_ch_prop {
+	enum isp4fw_pipe_out_ch ch;	/* ISP pipe out channel */
+	struct isp4fw_image_prop image_prop;	/* image property */
+};
+
+struct isp4fw_cmd_enable_out_ch {
+	enum isp4fw_pipe_out_ch ch;	/* ISP pipe out channel */
+	u32 is_enable;			/* If enable channel or not */
+};
+
+struct isp4fw_cmd_set_stream_cfg {
+	struct isp4fw_isp_stream_cfg stream_cfg; /* stream path config */
+};
+
+#endif /* _ISP4_CMD_RESP_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
new file mode 100644
index 000000000000..001535b685f2
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -0,0 +1,887 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/iopoll.h>
+
+#include "isp4_fw_cmd_resp.h"
+#include "isp4_hw_reg.h"
+#include "isp4_interface.h"
+
+#define ISP4IF_FW_RESP_RB_IRQ_EN_MASK \
+	(ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK |  \
+	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK | \
+	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK | \
+	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK)
+
+struct isp4if_rb_config {
+	const char *name;
+	u32 index;
+	u32 reg_rptr;
+	u32 reg_wptr;
+	u32 reg_base_lo;
+	u32 reg_base_hi;
+	u32 reg_size;
+	u32 val_size;
+	u64 base_mc_addr;
+	void *base_sys_addr;
+};
+
+/* FW cmd ring buffer configuration */
+static struct isp4if_rb_config
+	isp4if_cmd_rb_config[ISP4IF_STREAM_ID_MAX] = {
+	{
+		.name = "CMD_RB_GBL0",
+		.index = 3,
+		.reg_rptr = ISP_RB_RPTR4,
+		.reg_wptr = ISP_RB_WPTR4,
+		.reg_base_lo = ISP_RB_BASE_LO4,
+		.reg_base_hi = ISP_RB_BASE_HI4,
+		.reg_size = ISP_RB_SIZE4,
+	},
+	{
+		.name = "CMD_RB_STR1",
+		.index = 0,
+		.reg_rptr = ISP_RB_RPTR1,
+		.reg_wptr = ISP_RB_WPTR1,
+		.reg_base_lo = ISP_RB_BASE_LO1,
+		.reg_base_hi = ISP_RB_BASE_HI1,
+		.reg_size = ISP_RB_SIZE1,
+	},
+	{
+		.name = "CMD_RB_STR2",
+		.index = 1,
+		.reg_rptr = ISP_RB_RPTR2,
+		.reg_wptr = ISP_RB_WPTR2,
+		.reg_base_lo = ISP_RB_BASE_LO2,
+		.reg_base_hi = ISP_RB_BASE_HI2,
+		.reg_size = ISP_RB_SIZE2,
+	},
+	{
+		.name = "CMD_RB_STR3",
+		.index = 2,
+		.reg_rptr = ISP_RB_RPTR3,
+		.reg_wptr = ISP_RB_WPTR3,
+		.reg_base_lo = ISP_RB_BASE_LO3,
+		.reg_base_hi = ISP_RB_BASE_HI3,
+		.reg_size = ISP_RB_SIZE3,
+	},
+};
+
+/* FW resp ring buffer configuration */
+static struct isp4if_rb_config
+	isp4if_resp_rb_config[ISP4IF_STREAM_ID_MAX] = {
+	{
+		.name = "RES_RB_GBL0",
+		.index = 3,
+		.reg_rptr = ISP_RB_RPTR12,
+		.reg_wptr = ISP_RB_WPTR12,
+		.reg_base_lo = ISP_RB_BASE_LO12,
+		.reg_base_hi = ISP_RB_BASE_HI12,
+		.reg_size = ISP_RB_SIZE12,
+	},
+	{
+		.name = "RES_RB_STR1",
+		.index = 0,
+		.reg_rptr = ISP_RB_RPTR9,
+		.reg_wptr = ISP_RB_WPTR9,
+		.reg_base_lo = ISP_RB_BASE_LO9,
+		.reg_base_hi = ISP_RB_BASE_HI9,
+		.reg_size = ISP_RB_SIZE9,
+	},
+	{
+		.name = "RES_RB_STR2",
+		.index = 1,
+		.reg_rptr = ISP_RB_RPTR10,
+		.reg_wptr = ISP_RB_WPTR10,
+		.reg_base_lo = ISP_RB_BASE_LO10,
+		.reg_base_hi = ISP_RB_BASE_HI10,
+		.reg_size = ISP_RB_SIZE10,
+	},
+	{
+		.name = "RES_RB_STR3",
+		.index = 2,
+		.reg_rptr = ISP_RB_RPTR11,
+		.reg_wptr = ISP_RB_WPTR11,
+		.reg_base_lo = ISP_RB_BASE_LO11,
+		.reg_base_hi = ISP_RB_BASE_HI11,
+		.reg_size = ISP_RB_SIZE11,
+	},
+};
+
+static struct isp4if_gpu_mem_info *isp4if_gpu_mem_alloc(struct isp4_interface *ispif, u32 mem_size)
+{
+	struct isp4if_gpu_mem_info *mem_info;
+	struct device *dev = ispif->dev;
+	int ret;
+
+	mem_info = kmalloc(sizeof(*mem_info), GFP_KERNEL);
+	if (!mem_info)
+		return NULL;
+
+	mem_info->mem_size = mem_size;
+	ret = isp_kernel_buffer_alloc(dev, mem_info->mem_size, &mem_info->mem_handle,
+				      &mem_info->gpu_mc_addr, &mem_info->sys_addr);
+	if (ret) {
+		kfree(mem_info);
+		return NULL;
+	}
+
+	return mem_info;
+}
+
+static void isp4if_gpu_mem_free(struct isp4_interface *ispif,
+				struct isp4if_gpu_mem_info **mem_info_ptr)
+{
+	struct isp4if_gpu_mem_info *mem_info = *mem_info_ptr;
+	struct device *dev = ispif->dev;
+
+	if (!mem_info) {
+		dev_err(dev, "invalid mem_info\n");
+		return;
+	}
+
+	*mem_info_ptr = NULL;
+	isp_kernel_buffer_free(&mem_info->mem_handle, &mem_info->gpu_mc_addr, &mem_info->sys_addr);
+	kfree(mem_info);
+}
+
+static void isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)
+{
+	int i;
+
+	isp4if_gpu_mem_free(ispif, &ispif->fw_mem_pool);
+	isp4if_gpu_mem_free(ispif, &ispif->fw_cmd_resp_buf);
+
+	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++)
+		isp4if_gpu_mem_free(ispif, &ispif->metainfo_buf_pool[i]);
+}
+
+static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
+{
+	struct device *dev = ispif->dev;
+	int i;
+
+	ispif->fw_mem_pool = isp4if_gpu_mem_alloc(ispif, FW_MEMORY_POOL_SIZE);
+	if (!ispif->fw_mem_pool)
+		goto error_no_memory;
+
+	ispif->fw_cmd_resp_buf =
+		isp4if_gpu_mem_alloc(ispif, ISP4IF_RB_PMBMAP_MEM_SIZE);
+	if (!ispif->fw_cmd_resp_buf)
+		goto error_no_memory;
+
+	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+		ispif->metainfo_buf_pool[i] =
+			isp4if_gpu_mem_alloc(ispif, ISP4IF_META_INFO_BUF_SIZE);
+		if (!ispif->metainfo_buf_pool[i])
+			goto error_no_memory;
+	}
+
+	return 0;
+
+error_no_memory:
+	dev_err(dev, "failed to allocate gpu memory\n");
+	return -ENOMEM;
+}
+
+static u32 isp4if_compute_check_sum(const u8 *buf, size_t buf_size)
+{
+	const u8 *surplus_ptr;
+	const u32 *buffer;
+	u32 checksum = 0;
+	size_t i;
+
+	buffer = (const u32 *)buf;
+	for (i = 0; i < buf_size / sizeof(u32); i++)
+		checksum += buffer[i];
+
+	surplus_ptr = (const u8 *)&buffer[i];
+	/* add surplus data crc checksum */
+	for (i = 0; i < buf_size % sizeof(u32); i++)
+		checksum += surplus_ptr[i];
+
+	return checksum;
+}
+
+void isp4if_clear_cmdq(struct isp4_interface *ispif)
+{
+	struct isp4if_cmd_element *buf_node, *tmp_node;
+	LIST_HEAD(free_list);
+
+	scoped_guard(spinlock, &ispif->cmdq_lock)
+		list_splice_init(&ispif->cmdq, &free_list);
+
+	list_for_each_entry_safe(buf_node, tmp_node, &free_list, list)
+		kfree(buf_node);
+}
+
+static bool isp4if_is_cmdq_rb_full(struct isp4_interface *ispif, enum isp4if_stream_id cmd_buf_idx)
+{
+	struct isp4if_rb_config *rb_config;
+	u32 rd_ptr, wr_ptr;
+	u32 new_wr_ptr;
+	u32 rreg;
+	u32 wreg;
+	u32 len;
+
+	rb_config = &isp4if_cmd_rb_config[cmd_buf_idx];
+	rreg = rb_config->reg_rptr;
+	wreg = rb_config->reg_wptr;
+	len = rb_config->val_size;
+
+	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
+	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
+
+	new_wr_ptr = wr_ptr + sizeof(struct isp4fw_cmd);
+
+	if (wr_ptr >= rd_ptr) {
+		if (new_wr_ptr < len) {
+			return false;
+		} else if (new_wr_ptr == len) {
+			if (rd_ptr == 0)
+				return true;
+
+			return false;
+		}
+
+		new_wr_ptr -= len;
+		if (new_wr_ptr < rd_ptr)
+			return false;
+
+		return true;
+	}
+
+	if (new_wr_ptr < rd_ptr)
+		return false;
+
+	return true;
+}
+
+struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
+						   u32 cmd_id)
+{
+	struct isp4if_cmd_element *buf_node;
+	struct isp4if_cmd_element *tmp_node;
+
+	scoped_guard(spinlock, &ispif->cmdq_lock)
+		list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
+			if (buf_node->seq_num == seq_num &&
+			    buf_node->cmd_id == cmd_id) {
+				list_del(&buf_node->list);
+				return buf_node;
+			}
+		}
+
+	return NULL;
+}
+
+static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_stream_id stream,
+				    struct isp4fw_cmd *cmd)
+{
+	struct isp4if_rb_config *rb_config;
+	struct device *dev = ispif->dev;
+	u8 *mem_sys;
+	u32 wr_ptr;
+	u32 rd_ptr;
+	u32 rreg;
+	u32 wreg;
+	u32 len;
+
+	rb_config = &isp4if_cmd_rb_config[stream];
+	rreg = rb_config->reg_rptr;
+	wreg = rb_config->reg_wptr;
+	mem_sys = (u8 *)rb_config->base_sys_addr;
+	len = rb_config->val_size;
+
+	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
+		dev_err(dev, "fail no cmdslot (%d)\n", stream);
+		return -EINVAL;
+	}
+
+	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
+	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
+
+	if (rd_ptr > len) {
+		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
+			stream, rd_ptr, len, wr_ptr);
+		return -EINVAL;
+	}
+
+	if (wr_ptr > len) {
+		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
+			stream, wr_ptr, len, rd_ptr);
+		return -EINVAL;
+	}
+
+	if (wr_ptr < rd_ptr) {
+		memcpy((mem_sys + wr_ptr),
+		       (u8 *)cmd, sizeof(struct isp4fw_cmd));
+	} else {
+		if ((len - wr_ptr) >= (sizeof(struct isp4fw_cmd))) {
+			memcpy((mem_sys + wr_ptr),
+			       (u8 *)cmd, sizeof(struct isp4fw_cmd));
+		} else {
+			u32 size;
+			u8 *src;
+
+			src = (u8 *)cmd;
+			size = len - wr_ptr;
+
+			memcpy((mem_sys + wr_ptr), src, size);
+
+			src += size;
+			size = sizeof(struct isp4fw_cmd) - size;
+			memcpy((mem_sys), src, size);
+		}
+	}
+
+	wr_ptr += sizeof(struct isp4fw_cmd);
+	if (wr_ptr >= len)
+		wr_ptr -= len;
+
+	isp4hw_wreg(ispif->mmio, wreg, wr_ptr);
+
+	return 0;
+}
+
+static inline enum isp4if_stream_id isp4if_get_fw_stream(u32 cmd_id)
+{
+	return ISP4IF_STREAM_ID_1;
+}
+
+static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *package,
+			      u32 package_size, struct completion *cmd_complete, u32 *seq)
+{
+	enum isp4if_stream_id stream = isp4if_get_fw_stream(cmd_id);
+	struct isp4if_cmd_element *cmd_ele = NULL;
+	struct isp4if_rb_config *rb_config;
+	struct device *dev = ispif->dev;
+	struct isp4fw_cmd cmd = {};
+	u32 seq_num;
+	u32 rreg;
+	u32 wreg;
+	int ret;
+
+	if (package_size > sizeof(cmd.cmd_param)) {
+		dev_err(dev, "fail pkgsize(%u)>%zu cmd:0x%x,stream %d\n",
+			package_size, sizeof(cmd.cmd_param), cmd_id, stream);
+		return -EINVAL;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&cmd, 0, sizeof(cmd));
+	rb_config = &isp4if_resp_rb_config[stream];
+	rreg = rb_config->reg_rptr;
+	wreg = rb_config->reg_wptr;
+
+	guard(mutex)(&ispif->isp4if_mutex);
+
+	ret = read_poll_timeout(isp4if_is_cmdq_rb_full, ret, !ret, ISP4IF_MAX_SLEEP_TIME * 1000,
+				ISP4IF_MAX_SLEEP_COUNT * ISP4IF_MAX_SLEEP_TIME * 1000, false,
+				ispif, stream);
+
+	if (ret) {
+		u32 rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
+		u32 wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
+
+		dev_err(dev,
+			"failed to get free cmdq slot, stream (%d),rd %u, wr %u\n",
+			stream, rd_ptr, wr_ptr);
+		return -ETIMEDOUT;
+	}
+
+	cmd.cmd_id = cmd_id;
+	switch (stream) {
+	case ISP4IF_STREAM_ID_GLOBAL:
+		cmd.cmd_stream_id = STREAM_ID_INVALID;
+		break;
+	case ISP4IF_STREAM_ID_1:
+		cmd.cmd_stream_id = STREAM_ID_1;
+		break;
+	default:
+		dev_err(dev, "fail bad stream id %d\n", stream);
+		return -EINVAL;
+	}
+
+	if (package && package_size)
+		memcpy(cmd.cmd_param, package, package_size);
+
+	seq_num = ispif->host2fw_seq_num++;
+	cmd.cmd_seq_num = seq_num;
+	cmd.cmd_check_sum =
+		isp4if_compute_check_sum((u8 *)&cmd, sizeof(cmd) - sizeof(u32));
+
+	if (seq)
+		*seq = seq_num;
+	/*
+	 * only append the fw cmd to queue when its response needs to be waited for,
+	 * currently there are only two such commands, disable channel and stop stream
+	 * which are only sent after close camera
+	 */
+	if (cmd_complete) {
+		cmd_ele = kmalloc(sizeof(*cmd_ele), GFP_KERNEL);
+		if (!cmd_ele)
+			return -ENOMEM;
+
+		cmd_ele->seq_num = seq_num;
+		cmd_ele->cmd_id = cmd_id;
+		cmd_ele->cmd_complete = cmd_complete;
+
+		scoped_guard(spinlock, &ispif->cmdq_lock)
+			list_add_tail(&cmd_ele->list, &ispif->cmdq);
+	}
+
+	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
+	if (ret) {
+		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n", cmd_id);
+		if (cmd_ele) {
+			cmd_ele = isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id);
+			kfree(cmd_ele);
+		}
+	}
+
+	return ret;
+}
+
+static int isp4if_send_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_info *buf_info)
+{
+	struct isp4fw_cmd_send_buffer cmd;
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.buffer_type = BUFFER_TYPE_PREVIEW;
+	cmd.buffer.vmid_space.bit.vmid = 0;
+	cmd.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
+	isp4if_split_addr64(buf_info->planes[0].mc_addr,
+			    &cmd.buffer.buf_base_a_lo,
+			    &cmd.buffer.buf_base_a_hi);
+	cmd.buffer.buf_size_a = buf_info->planes[0].len;
+
+	isp4if_split_addr64(buf_info->planes[1].mc_addr,
+			    &cmd.buffer.buf_base_b_lo,
+			    &cmd.buffer.buf_base_b_hi);
+	cmd.buffer.buf_size_b = buf_info->planes[1].len;
+
+	isp4if_split_addr64(buf_info->planes[2].mc_addr,
+			    &cmd.buffer.buf_base_c_lo,
+			    &cmd.buffer.buf_base_c_hi);
+	cmd.buffer.buf_size_c = buf_info->planes[2].len;
+
+	return isp4if_send_fw_cmd(ispif, CMD_ID_SEND_BUFFER, &cmd, sizeof(cmd), NULL, NULL);
+}
+
+static void isp4if_init_rb_config(struct isp4_interface *ispif, struct isp4if_rb_config *rb_config)
+{
+	u32 lo;
+	u32 hi;
+
+	isp4if_split_addr64(rb_config->base_mc_addr, &lo, &hi);
+
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+		    rb_config->reg_rptr, 0x0);
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+		    rb_config->reg_wptr, 0x0);
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+		    rb_config->reg_base_lo, lo);
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+		    rb_config->reg_base_hi, hi);
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+		    rb_config->reg_size, rb_config->val_size);
+}
+
+static int isp4if_fw_init(struct isp4_interface *ispif)
+{
+	struct isp4if_rb_config *rb_config;
+	u32 offset;
+	int i;
+
+	/* initialize CMD_RB streams */
+	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
+		rb_config = (isp4if_cmd_rb_config + i);
+		offset = ispif->aligned_rb_chunk_size *
+			 (rb_config->index + ispif->cmd_rb_base_index);
+
+		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
+		rb_config->base_sys_addr =
+			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
+		rb_config->base_mc_addr =
+			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
+
+		isp4if_init_rb_config(ispif, rb_config);
+	}
+
+	/* initialize RESP_RB streams */
+	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
+		rb_config = (isp4if_resp_rb_config + i);
+		offset = ispif->aligned_rb_chunk_size *
+			 (rb_config->index + ispif->resp_rb_base_index);
+
+		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
+		rb_config->base_sys_addr =
+			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
+		rb_config->base_mc_addr =
+			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
+
+		isp4if_init_rb_config(ispif, rb_config);
+	}
+
+	return 0;
+}
+
+static int isp4if_wait_fw_ready(struct isp4_interface *ispif, u32 isp_status_addr)
+{
+	struct device *dev = ispif->dev;
+	u32 timeout_ms = 100;
+	u32 interval_ms = 1;
+	u32 reg_val;
+
+	/* wait for FW initialize done! */
+	if (!read_poll_timeout(isp4hw_rreg, reg_val, reg_val & ISP_STATUS__CCPU_REPORT_MASK,
+			       interval_ms * 1000, timeout_ms * 1000, false,
+			       GET_ISP4IF_REG_BASE(ispif), isp_status_addr))
+		return 0;
+
+	dev_err(dev, "ISP CCPU FW boot failed\n");
+
+	return -ETIME;
+}
+
+static void isp4if_enable_ccpu(struct isp4_interface *ispif)
+{
+	u32 reg_val;
+
+	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
+	reg_val &= (~ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK);
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
+
+	usleep_range(100, 150);
+
+	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
+	reg_val &= (~ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK);
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
+}
+
+static void isp4if_disable_ccpu(struct isp4_interface *ispif)
+{
+	u32 reg_val;
+
+	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
+	reg_val |= ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK;
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
+
+	usleep_range(100, 150);
+
+	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
+	reg_val |= ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK;
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
+}
+
+static int isp4if_fw_boot(struct isp4_interface *ispif)
+{
+	struct device *dev = ispif->dev;
+
+	if (ispif->status != ISP4IF_STATUS_PWR_ON) {
+		dev_err(dev, "invalid isp power status %d\n", ispif->status);
+		return -EINVAL;
+	}
+
+	isp4if_disable_ccpu(ispif);
+
+	isp4if_fw_init(ispif);
+
+	/* clear ccpu status */
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_STATUS, 0x0);
+
+	isp4if_enable_ccpu(ispif);
+
+	if (isp4if_wait_fw_ready(ispif, ISP_STATUS)) {
+		isp4if_disable_ccpu(ispif);
+		return -EINVAL;
+	}
+
+	/* enable interrupts */
+	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SYS_INT0_EN,
+		    ISP4IF_FW_RESP_RB_IRQ_EN_MASK);
+
+	ispif->status = ISP4IF_STATUS_FW_RUNNING;
+
+	dev_dbg(dev, "ISP CCPU FW boot success\n");
+
+	return 0;
+}
+
+int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream, void *resp)
+{
+	struct isp4fw_resp *response = resp;
+	struct isp4if_rb_config *rb_config;
+	struct device *dev = ispif->dev;
+	u32 rd_ptr_dbg;
+	u32 wr_ptr_dbg;
+	void *mem_sys;
+	u64 mem_addr;
+	u32 checksum;
+	u32 rd_ptr;
+	u32 wr_ptr;
+	u32 rreg;
+	u32 wreg;
+	u32 len;
+
+	rb_config = &isp4if_resp_rb_config[stream];
+	rreg = rb_config->reg_rptr;
+	wreg = rb_config->reg_wptr;
+	mem_sys = rb_config->base_sys_addr;
+	mem_addr = rb_config->base_mc_addr;
+	len = rb_config->val_size;
+
+	rd_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), rreg);
+	wr_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), wreg);
+	rd_ptr_dbg = rd_ptr;
+	wr_ptr_dbg = wr_ptr;
+
+	if (rd_ptr > len) {
+		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
+			stream, rd_ptr, len, wr_ptr);
+		return -EINVAL;
+	}
+
+	if (wr_ptr > len) {
+		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
+			stream, wr_ptr, len, rd_ptr);
+		return -EINVAL;
+	}
+
+	if (rd_ptr < wr_ptr) {
+		if ((wr_ptr - rd_ptr) >= (sizeof(struct isp4fw_resp))) {
+			memcpy((u8 *)response, (u8 *)mem_sys + rd_ptr,
+			       sizeof(struct isp4fw_resp));
+
+			rd_ptr += sizeof(struct isp4fw_resp);
+			if (rd_ptr < len) {
+				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+					    rreg, rd_ptr);
+			} else {
+				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+					stream, rd_ptr, len, wr_ptr);
+				return -EINVAL;
+			}
+
+		} else {
+			dev_err(dev, "sth wrong with wptr and rptr\n");
+			return -EINVAL;
+		}
+	} else if (rd_ptr > wr_ptr) {
+		u32 size;
+		u8 *dst;
+
+		dst = (u8 *)response;
+
+		size = len - rd_ptr;
+		if (size > sizeof(struct isp4fw_resp)) {
+			mem_addr += rd_ptr;
+			memcpy((u8 *)response,
+			       (u8 *)(mem_sys) + rd_ptr,
+			       sizeof(struct isp4fw_resp));
+			rd_ptr += sizeof(struct isp4fw_resp);
+			if (rd_ptr < len) {
+				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+					    rreg, rd_ptr);
+			} else {
+				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+					stream, rd_ptr, len, wr_ptr);
+				return -EINVAL;
+			}
+
+		} else {
+			if ((size + wr_ptr) < (sizeof(struct isp4fw_resp))) {
+				dev_err(dev, "sth wrong with wptr and rptr1\n");
+				return -EINVAL;
+			}
+
+			memcpy(dst, (u8 *)(mem_sys) + rd_ptr, size);
+
+			dst += size;
+			size = sizeof(struct isp4fw_resp) - size;
+			if (size)
+				memcpy(dst, (u8 *)(mem_sys), size);
+			rd_ptr = size;
+			if (rd_ptr < len) {
+				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
+					    rreg, rd_ptr);
+			} else {
+				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
+					stream, rd_ptr, len, wr_ptr);
+				return -EINVAL;
+			}
+		}
+	} else {
+		return -ETIME;
+	}
+
+	checksum = isp4if_compute_check_sum((u8 *)response,
+					    sizeof(struct isp4fw_resp) - sizeof(u32));
+
+	if (checksum != response->resp_check_sum) {
+		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
+			checksum, response->resp_check_sum, rd_ptr_dbg, wr_ptr_dbg);
+
+		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n", stream,
+			response->resp_seq_num,
+			response->resp_id);
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, void *package, u32 package_size)
+{
+	return isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, NULL, NULL);
+}
+
+int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, void *package,
+			     u32 package_size, u32 timeout)
+{
+	DECLARE_COMPLETION_ONSTACK(cmd_completion);
+	struct device *dev = ispif->dev;
+	int ret;
+	u32 seq;
+
+	ret = isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, &cmd_completion, &seq);
+
+	if (ret) {
+		dev_err(dev, "send fw cmd fail %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&cmd_completion, msecs_to_jiffies(timeout));
+	if (ret == 0) {
+		struct isp4if_cmd_element *ele;
+
+		ele = isp4if_rm_cmd_from_cmdq(ispif, seq, cmd_id);
+		kfree(ele);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+void isp4if_clear_bufq(struct isp4_interface *ispif)
+{
+	struct isp4if_img_buf_node *buf_node, *tmp_node;
+	LIST_HEAD(free_list);
+
+	scoped_guard(spinlock, &ispif->bufq_lock)
+		list_splice_init(&ispif->bufq, &free_list);
+
+	list_for_each_entry_safe(buf_node, tmp_node, &free_list, node)
+		kfree(buf_node);
+}
+
+void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node)
+{
+	kfree(buf_node);
+}
+
+struct isp4if_img_buf_node *isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info)
+{
+	struct isp4if_img_buf_node *node;
+
+	node = kmalloc(sizeof(*node), GFP_KERNEL);
+	if (node)
+		node->buf_info = *buf_info;
+
+	return node;
+}
+
+struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif)
+{
+	struct isp4if_img_buf_node *buf_node;
+
+	scoped_guard(spinlock, &ispif->bufq_lock)
+		buf_node = list_first_entry_or_null(&ispif->bufq, typeof(*buf_node), node);
+	if (buf_node)
+		list_del(&buf_node->node);
+
+	return buf_node;
+}
+
+int isp4if_queue_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_node *buf_node)
+{
+	int ret;
+
+	ret = isp4if_send_buffer(ispif, &buf_node->buf_info);
+	if (ret)
+		return ret;
+
+	scoped_guard(spinlock, &ispif->bufq_lock)
+		list_add_tail(&buf_node->node, &ispif->bufq);
+
+	return 0;
+}
+
+int isp4if_stop(struct isp4_interface *ispif)
+{
+	isp4if_disable_ccpu(ispif);
+
+	isp4if_dealloc_fw_gpumem(ispif);
+
+	return 0;
+}
+
+int isp4if_start(struct isp4_interface *ispif)
+{
+	int ret;
+
+	ret = isp4if_alloc_fw_gpumem(ispif);
+	if (ret)
+		return ret;
+
+	ret = isp4if_fw_boot(ispif);
+	if (ret)
+		goto failed_fw_boot;
+
+	return 0;
+
+failed_fw_boot:
+	isp4if_dealloc_fw_gpumem(ispif);
+	return ret;
+}
+
+int isp4if_deinit(struct isp4_interface *ispif)
+{
+	isp4if_clear_cmdq(ispif);
+
+	isp4if_clear_bufq(ispif);
+
+	mutex_destroy(&ispif->isp4if_mutex);
+
+	return 0;
+}
+
+int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmip)
+{
+	ispif->dev = dev;
+	ispif->mmio = isp_mmip;
+
+	ispif->cmd_rb_base_index = 0;
+	ispif->resp_rb_base_index = ISP4IF_RESP_CHAN_TO_RB_OFFSET - 1;
+	ispif->aligned_rb_chunk_size = ISP4IF_RB_PMBMAP_MEM_CHUNK & 0xffffffc0;
+
+	spin_lock_init(&ispif->cmdq_lock); /* used for cmdq access */
+	spin_lock_init(&ispif->bufq_lock); /* used for bufq access */
+	mutex_init(&ispif->isp4if_mutex); /* used for commands sent to ispfw */
+
+	INIT_LIST_HEAD(&ispif->cmdq);
+	INIT_LIST_HEAD(&ispif->bufq);
+
+	return 0;
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
new file mode 100644
index 000000000000..a84229518a98
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_interface.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_INTERFACE_H_
+#define _ISP4_INTERFACE_H_
+
+#include <drm/amd/isp.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define ISP4IF_RB_MAX (25)
+#define ISP4IF_RESP_CHAN_TO_RB_OFFSET (9)
+#define ISP4IF_RB_PMBMAP_MEM_SIZE (16 * 1024 * 1024 - 1)
+#define ISP4IF_RB_PMBMAP_MEM_CHUNK (ISP4IF_RB_PMBMAP_MEM_SIZE \
+	/ (ISP4IF_RB_MAX - 1))
+#define ISP4IF_HOST2FW_COMMAND_SIZE (sizeof(struct isp4fw_cmd))
+#define ISP4IF_FW_CMD_BUF_COUNT 4
+#define ISP4IF_FW_RESP_BUF_COUNT 4
+#define ISP4IF_MAX_NUM_HOST2FW_COMMAND (40)
+#define ISP4IF_FW_CMD_BUF_SIZE (ISP4IF_MAX_NUM_HOST2FW_COMMAND \
+	* ISP4IF_HOST2FW_COMMAND_SIZE)
+#define ISP4IF_MAX_SLEEP_COUNT (10)
+#define ISP4IF_MAX_SLEEP_TIME (33)
+
+#define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
+#define ISP4IF_MAX_STREAM_BUF_COUNT 8
+
+#define ISP4IF_MAX_CMD_RESPONSE_BUF_SIZE (4 * 1024)
+
+#define GET_ISP4IF_REG_BASE(ispif) (((ispif))->mmio)
+
+enum isp4if_stream_id {
+	ISP4IF_STREAM_ID_GLOBAL = 0,
+	ISP4IF_STREAM_ID_1 = 1,
+	ISP4IF_STREAM_ID_MAX = 4
+};
+
+enum isp4if_status {
+	ISP4IF_STATUS_PWR_OFF,
+	ISP4IF_STATUS_PWR_ON,
+	ISP4IF_STATUS_FW_RUNNING,
+	ISP4IF_FSM_STATUS_MAX
+};
+
+struct isp4if_gpu_mem_info {
+	u64	mem_size;
+	u64	gpu_mc_addr;
+	void	*sys_addr;
+	void	*mem_handle;
+};
+
+struct isp4if_img_buf_info {
+	struct {
+		void *sys_addr;
+		u64 mc_addr;
+		u32 len;
+	} planes[3];
+};
+
+struct isp4if_img_buf_node {
+	struct list_head node;
+	struct isp4if_img_buf_info buf_info;
+};
+
+struct isp4if_cmd_element {
+	struct list_head list;
+	u32 seq_num;
+	u32 cmd_id;
+	struct completion *cmd_complete;
+};
+
+struct isp4_interface {
+	struct device *dev;
+	void __iomem *mmio;
+
+	spinlock_t cmdq_lock; /* used for cmdq access */
+	spinlock_t bufq_lock; /* used for bufq access */
+	struct mutex isp4if_mutex; /* used to send fw cmd and read fw log */
+
+	struct list_head cmdq; /* commands sent to fw */
+	struct list_head bufq; /* buffers sent to fw */
+
+	enum isp4if_status status;
+	u32 host2fw_seq_num;
+
+	/* FW ring buffer configs */
+	u32 cmd_rb_base_index;
+	u32 resp_rb_base_index;
+	u32 aligned_rb_chunk_size;
+
+	/* ISP fw buffers */
+	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
+	struct isp4if_gpu_mem_info *fw_mem_pool;
+	struct isp4if_gpu_mem_info *metainfo_buf_pool[ISP4IF_MAX_STREAM_BUF_COUNT];
+};
+
+static inline void isp4if_split_addr64(u64 addr, u32 *lo, u32 *hi)
+{
+	if (lo)
+		*lo = addr & 0xffffffff;
+	if (hi)
+		*hi = addr >> 32;
+}
+
+static inline u64 isp4if_join_addr64(u32 lo, u32 hi)
+{
+	return (((u64)hi) << 32) | (u64)lo;
+}
+
+int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream, void *response);
+
+int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, void *package,
+			u32 package_size);
+
+int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, void *package,
+			     u32 package_size, u32 timeout);
+
+struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
+						   u32 cmd_id);
+
+void isp4if_clear_cmdq(struct isp4_interface *ispif);
+
+void isp4if_clear_bufq(struct isp4_interface *ispif);
+
+void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node);
+
+struct isp4if_img_buf_node *isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info);
+
+struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif);
+
+int isp4if_queue_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_node *buf_node);
+
+int isp4if_stop(struct isp4_interface *ispif);
+
+int isp4if_start(struct isp4_interface *ispif);
+
+int isp4if_deinit(struct isp4_interface *ispif);
+
+int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmip);
+
+#endif /* _ISP4_INTERFACE_H_ */
-- 
2.34.1


