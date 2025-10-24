Return-Path: <linux-media+bounces-45467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72864C054C2
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5101B4261C6
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C4B30AAAD;
	Fri, 24 Oct 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rH2OWKv3"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA763081DF;
	Fri, 24 Oct 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296856; cv=fail; b=o0pFZcxTT9tKxPI9j2Q2m9Q2b0DfW3Nl7qK+uhZfCTHb/fLN53HHFBfPQbCXUpWHbnRgmjgzyXJ7YSQi/Wh99zASAbUvsgDa4UZMPLek79N2Ut6+bClirGpQHW3RZIwYioRkc5+aUPq6aPPtWeFvWyVGigN8tLmN5ylN33j1x38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296856; c=relaxed/simple;
	bh=UNqxzGHWIpTbrKgr+2G35hxSbofxqdjEYFeXxbfUCkM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0OkgJxNPfY1p3wI8gOvxghS4NGGvNGbR+16Nz/Vj0QZDBw0+2WdJFa6Dr9xmVa0MLyWR/8kMweW0io91urdU2H5NEtJTBtef7D9TlkI/URv/R2I2ws2QdEbC6FsE1lTdlsxS3yMZDMLx3IPMVeT2p6E7Rsmwq5nkVoJSU1lVa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rH2OWKv3; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZPUZ8Uk2SBiUlZEXawJZJNf3fQZs0MuNP1NVPRlWyDLZ/V1KiC6E8YNPVeVthI88e5CD5aTgucovTDok0RYEQp2Yc+Hu8xlDY8WgF1ohRiWrNN0A0U/v9cSzkEIC2SG24SMVlqJJAww2Io6+M3Gm2byS2cqD2/JoiJP2Z8wORUExkMuKGJ3YrzQL27SjBhmekYCMUT08viS8k8l6nL3AqqcVog6AafRcdkyktpZa8jQfR8m+nrCNnrvrDBZmD8mKoKoR9q75GwNuC7ipL33Qju9WIp8kTxKt3JTvknfP2UNLVq/FScBONIvWbv4q7d8FUnmeTbnv3ieDWB/CbDR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuCOckexd/6MbkNNBDOzJ8VAg8LSoQMPHtGYFtYtyBQ=;
 b=EiBGa2F7CmzzP0BPO2sePlAm3z98ReB2v9BSNoeb7Gm3WBEw8JGd8huo/N7t31CwVHiPvC7O9yqNbWr8YRn+JHf9aqmEjXsNImH4ffgKNMBqIBtVLjTbCR/sjcwJX7QqZPWypVKMRwTlGhM8snrlTNmXaYMVeQCqg3vj2dWBMXI9yWQHVWMqQC9G89+6xVHWKZP70t3wH3eiCkGLdUSmRp4fOd++lHVEqnurYC2bJc/TMbFTY3HeKN5LAWS7tK9gR42adlMmLtgvkoM8EFZmxnquIXQS+PfADvAAst8IRm4cGpypMZR+FGlsdGa0DacNsZFj7cDs51OYCDu3daPPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuCOckexd/6MbkNNBDOzJ8VAg8LSoQMPHtGYFtYtyBQ=;
 b=rH2OWKv38USTAugNMBdpacumSo3l1h7JvhMKq3ixE4b9xb5sEOFqaOv4/fIV3siJn23c/BMkvt9LzHtSkBldGje5ATWrbYYsJKlR3RiCifTihKYSZAKlkFKcqxY4ATz3s1TxBYNXz8clF5O8iN/NwADrEMznvJwVIMQsV8W0tX4=
Received: from SA1PR02CA0010.namprd02.prod.outlook.com (2603:10b6:806:2cf::16)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:25 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::75) by SA1PR02CA0010.outlook.office365.com
 (2603:10b6:806:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:25 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:07:20 -0700
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
Subject: [PATCH v5 4/7] media: platform: amd: isp4 subdev and firmware loading handling added
Date: Fri, 24 Oct 2025 17:06:40 +0800
Message-ID: <20251024090643.271883-5-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 864919f0-fa3c-4587-5ba3-08de12dcbfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?04NG4k1qGKNfVKyfwzp79xl81CASCWwRyIIb8j7FSyjKvJBYC2RmewIWPIWp?=
 =?us-ascii?Q?IDqEfkl++uObIzZntAnA2T4f/9kokEupFO0NsyuOK/ed9YPz7XzLupQmdtlu?=
 =?us-ascii?Q?1KMA+VFI2FSu/8BxtPKP9cAm2qGSbzjY/JgZonFjwbXYlGWXzfmtpQmWd4pR?=
 =?us-ascii?Q?0vFv0rdGO5bDXpCU1opY15ETvKNn0B8OfzfTmZpKXlLwC58oNjpysbA4NNmx?=
 =?us-ascii?Q?JEUei/aX73npzdMTpSwqk60LMDMATlP3TUcr6HctlUh7JxDxcerq1JGZk0CM?=
 =?us-ascii?Q?J49P/hpU2l3SwNkdiO4eYMDkTTQ1QgkkdwsMaKN5p1wKR1qAN+si9TStF5WQ?=
 =?us-ascii?Q?oAn8yuzwH+V1iMZdaaSGfJIP7eSMH/iaDouxMNBrpbDAPFeQCYqaKJmVlImy?=
 =?us-ascii?Q?BgSGW4w2Navpmm9wAFy/aE5UkbNfZrtS0yy/AcaCdXPaz4wO9oBaBeukzlic?=
 =?us-ascii?Q?i2WGp0bJOh+s9yOZZuKaNxXA1Rbp0Ifc3jeKyt+/qfLECQjU9vzxv0V/+HaV?=
 =?us-ascii?Q?hW9ZibzZ9lpfCu0/mZVTQfcpCKpcx7UC8XjEU1kT4R8LzDIJKk6b0J/ab5Yf?=
 =?us-ascii?Q?glM8jXMPCgEY0eF9z5LIdeWwNDqXG8efFJVvh7GZ6uTljDOrE2wRVlH83Ykz?=
 =?us-ascii?Q?iPDZfM7LbNdFAPRzT6ICCfLoffozR9J1W57NXp/DddIU0jki3lik5/CvR2YB?=
 =?us-ascii?Q?blqHLRO0M8AkeNQm6df01qZd5igMo0mzJJ1fmYj2LbPSCLbxyqMNiIfV+4ls?=
 =?us-ascii?Q?auXTE9shspJ/XzlXC2z6GYmy2QFtcGdUR5kdXY5zumZ3GBW5zrBG/DLg7XD+?=
 =?us-ascii?Q?j+Pkl6nDTb6f0uMIJ72KxGkXjffQvbYTOAnUP5Avgg/4NyoybrIiN7iscBpx?=
 =?us-ascii?Q?IhX7/sqbd67ZVLuwsV37hqZOAq12AQOyIYkiMEcoDnfMKlE0S9Pq7rRYy2iS?=
 =?us-ascii?Q?Lroo9C4hEg64Fm3Llcz/ZM8JUEkAkx1vLwFLeAK5qudSfcGNSFonEi2QqQ+0?=
 =?us-ascii?Q?r2cKdC6PBpf8GyvrHy0/0EYqBcF7llQouIKkWs+EGnXscwNOg5Y4Yzu37DA2?=
 =?us-ascii?Q?hDUsYibESMOMJu0mooEASR0dHtRKy+m39Qp3O/38J1Q3g50dDmyMYzn+fEfL?=
 =?us-ascii?Q?BRDmYfKJvCq56SYrw8MOLKancp7hdAfW0yBTj2asFyfVrEMUUBIQAaTIZaTs?=
 =?us-ascii?Q?iy5nMMr9Z2WqdA0yj/cpQZcQ+KSEvk4d4eozWkFRUQwq4Q8wUHcZ3qloIaX7?=
 =?us-ascii?Q?KOfAlWv0wflrmopUEAbU45lfuHUpGcgbJydzbnnn/3eEvyWftgGGdU/kHLbK?=
 =?us-ascii?Q?RyB7Z9u/pFoLdub6ZjbZ54ns/QPFBAum+tqKkbSxHcWyZEEAGfD2Xfj3uSnK?=
 =?us-ascii?Q?UYN+AUoFIydWlMV4rIc8k+aRL893ex182MzJ1PwkNjnvSdF2OYvqtq656nNi?=
 =?us-ascii?Q?EGQ7N4eixzADOW9nUM/VLAh+ikiubJ+bkVMXLX6VLmn1z66Qwx5zixd4WXfh?=
 =?us-ascii?Q?bZbguMgnu2WuH/zaX9NBrfxxaLXGMZ8gfheYxF890mgfViMibe0N3oWE+Wa+?=
 =?us-ascii?Q?ng78tPgMFW0SQtVnoto=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:25.4258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864919f0-fa3c-4587-5ba3-08de12dcbfe7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

Isp4 sub-device is implementing v4l2 sub-device interface. It has one
capture video node, and supports only preview stream. It manages firmware
states, stream configuration. Add interrupt handling and notification for
isp firmware to isp-subdevice.

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 MAINTAINERS                                   |    2 +
 drivers/media/platform/amd/isp4/Makefile      |    3 +-
 drivers/media/platform/amd/isp4/isp4.c        |  120 +-
 drivers/media/platform/amd/isp4/isp4.h        |    5 +-
 .../media/platform/amd/isp4/isp4_interface.c  |    6 +-
 .../media/platform/amd/isp4/isp4_interface.h  |    2 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1074 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  121 ++
 8 files changed, 1302 insertions(+), 31 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cccae369c876..48ffc8bbdcee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1149,6 +1149,8 @@ F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 F:	drivers/media/platform/amd/isp4/isp4_interface.c
 F:	drivers/media/platform/amd/isp4/isp4_interface.h
+F:	drivers/media/platform/amd/isp4/isp4_subdev.c
+F:	drivers/media/platform/amd/isp4/isp4_subdev.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index a2a5bf98e912..6d4e6d6ac7f5 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,4 +4,5 @@
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
 amd_capture-objs := isp4.o \
-		    isp4_interface.o
+		    isp4_interface.o \
+		    isp4_subdev.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index a3fc2462d70f..c26830d6fb9e 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -3,37 +3,98 @@
  * Copyright (C) 2025 Advanced Micro Devices, Inc.
  */
 
+#include <linux/irq.h>
 #include <linux/pm_runtime.h>
 #include <linux/vmalloc.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 
 #include "isp4.h"
-
-#define VIDEO_BUF_NUM 5
+#include "isp4_hw_reg.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
+#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
+	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
+	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
 
 const char *isp4_irq_name[] = {
-	"isp_irq_stream1",
-	"isp_irq_global"
+	"isp_irq_global",
+	"isp_irq_stream1"
+};
+
+const u32 isp4_irq_status_mask[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
+	/* global response */
+	ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK,
+	/* stream 1 response */
+	ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK
+};
+
+const u32 isp4_irq_ack_mask[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
+	/* global ack */
+	ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK,
+	/* stream 1 ack */
+	ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK
 };
 
-/* interrupt num */
-static const u32 isp4_ringbuf_interrupt_num[] = {
-	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
+/* irq num, the irq order is aligend with the isp4_subdev.fw_resp_thread order */
+static const u32 isp4_ringbuf_interrupt_num[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
 	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
+	0  /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
 };
 
+static void isp4_wake_up_resp_thread(struct isp4_subdev *isp_subdev, u32 index)
+{
+	if (isp_subdev && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
+		struct isp4sd_thread_handler *thread_ctx = &isp_subdev->fw_resp_thread[index];
+
+		thread_ctx->wq_cond = 1;
+		wake_up_interruptible(&thread_ctx->waitq);
+	}
+}
+
+static void isp4_resp_interrupt_notify(struct isp4_subdev *isp_subdev, u32 intr_status)
+{
+	u32 intr_ack = 0;
+
+	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq_status_mask); i++) {
+		if (intr_status & isp4_irq_status_mask[i]) {
+			disable_irq_nosync(isp_subdev->irq[i]);
+			isp4_wake_up_resp_thread(isp_subdev, i);
+
+			intr_ack |= isp4_irq_ack_mask[i];
+		}
+	}
+
+	/* clear ISP_SYS interrupts */
+	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp_subdev), ISP_SYS_INT0_ACK, intr_ack);
+}
+
 static irqreturn_t isp4_irq_handler(int irq, void *arg)
 {
+	struct isp4_device *isp_dev = arg;
+	struct isp4_subdev *isp_subdev;
+	u32 isp_sys_irq_status;
+	u32 r1;
+
+	isp_subdev = &isp_dev->isp_subdev;
+	/* check ISP_SYS interrupts status */
+	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp_subdev), ISP_SYS_INT0_STATUS);
+
+	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
+
+	isp4_resp_interrupt_notify(isp_subdev, isp_sys_irq_status);
+
 	return IRQ_HANDLED;
 }
 
 static int isp4_capture_probe(struct platform_device *pdev)
 {
+	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
 	struct device *dev = &pdev->dev;
+	struct isp4_subdev *isp_subdev;
 	struct isp4_device *isp_dev;
-	int i, irq, ret;
+	size_t i;
+	int ret;
 
 	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
 	if (!isp_dev)
@@ -42,51 +103,61 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	isp_dev->pdev = pdev;
 	dev->init_name = ISP4_DRV_NAME;
 
+	isp_subdev = &isp_dev->isp_subdev;
+	isp_subdev->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(isp_subdev->mmio))
+		return dev_err_probe(dev, PTR_ERR(isp_subdev->mmio), "isp ioremap fail\n");
+
 	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
-		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
-		if (irq < 0)
-			return dev_err_probe(dev, irq,
-					     "fail to get irq %d\n",
+		irq[i] = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
+		if (irq[i] < 0)
+			return dev_err_probe(dev, irq[i], "fail to get irq %d\n",
 					     isp4_ringbuf_interrupt_num[i]);
-		ret = devm_request_irq(dev, irq, isp4_irq_handler, 0,
-				       isp4_irq_name[i], dev);
+
+		irq_set_status_flags(irq[i], IRQ_NOAUTOEN);
+		ret = devm_request_irq(dev, irq[i], isp4_irq_handler, 0, isp4_irq_name[i],
+				       isp_dev);
 		if (ret)
-			return dev_err_probe(dev, ret, "fail to req irq %d\n",
-					     irq);
+			return dev_err_probe(dev, ret, "fail to req irq %d\n", irq[i]);
 	}
 
 	/* Link the media device within the v4l2_device */
 	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
 
 	/* Initialize media device */
-	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
-		sizeof(isp_dev->mdev.model));
+	strscpy(isp_dev->mdev.model, "amd_isp41_mdev", sizeof(isp_dev->mdev.model));
 	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
 		 "platform:%s", ISP4_DRV_NAME);
 	isp_dev->mdev.dev = dev;
 	media_device_init(&isp_dev->mdev);
 
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
 	/* register v4l2 device */
 	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
 		 "AMD-V4L2-ROOT");
 	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "fail register v4l2 device\n");
+		return dev_err_probe(dev, ret, "fail register v4l2 device\n");
+
+	ret = isp4sd_init(&isp_dev->isp_subdev, &isp_dev->v4l2_dev, irq);
+	if (ret) {
+		dev_err(dev, "fail init isp4 sub dev %d\n", ret);
+		goto err_unreg_v4l2;
+	}
 
 	ret = media_device_register(&isp_dev->mdev);
 	if (ret) {
 		dev_err(dev, "fail to register media device %d\n", ret);
-		goto err_unreg_v4l2;
+		goto err_isp4_deinit;
 	}
 
 	platform_set_drvdata(pdev, isp_dev);
 
-	pm_runtime_set_suspended(dev);
-	pm_runtime_enable(dev);
-
 	return 0;
 
+err_isp4_deinit:
+	isp4sd_deinit(&isp_dev->isp_subdev);
 err_unreg_v4l2:
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
 
@@ -99,6 +170,7 @@ static void isp4_capture_remove(struct platform_device *pdev)
 
 	media_device_unregister(&isp_dev->mdev);
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
+	isp4sd_deinit(&isp_dev->isp_subdev);
 }
 
 static struct platform_driver isp4_capture_drv = {
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
index 326b8094e99e..54cd033326f9 100644
--- a/drivers/media/platform/amd/isp4/isp4.h
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -6,13 +6,14 @@
 #ifndef _ISP4_H_
 #define _ISP4_H_
 
-#include <media/v4l2-device.h>
-#include <media/videobuf2-memops.h>
+#include <drm/amd/isp.h>
+#include "isp4_subdev.h"
 
 #define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
 
 struct isp4_device {
 	struct v4l2_device v4l2_dev;
+	struct isp4_subdev isp_subdev;
 	struct media_device mdev;
 	struct platform_device *pdev;
 };
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 001535b685f2..cd32a6666400 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -155,7 +155,7 @@ static void isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)
 	isp4if_gpu_mem_free(ispif, &ispif->fw_cmd_resp_buf);
 
 	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++)
-		isp4if_gpu_mem_free(ispif, &ispif->metainfo_buf_pool[i]);
+		isp4if_gpu_mem_free(ispif, &ispif->meta_info_buf[i]);
 }
 
 static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
@@ -173,9 +173,9 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
 		goto error_no_memory;
 
 	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
-		ispif->metainfo_buf_pool[i] =
+		ispif->meta_info_buf[i] =
 			isp4if_gpu_mem_alloc(ispif, ISP4IF_META_INFO_BUF_SIZE);
-		if (!ispif->metainfo_buf_pool[i])
+		if (!ispif->meta_info_buf[i])
 			goto error_no_memory;
 	}
 
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
index a84229518a98..a1649f2bab8d 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.h
+++ b/drivers/media/platform/amd/isp4/isp4_interface.h
@@ -94,7 +94,7 @@ struct isp4_interface {
 	/* ISP fw buffers */
 	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
 	struct isp4if_gpu_mem_info *fw_mem_pool;
-	struct isp4if_gpu_mem_info *metainfo_buf_pool[ISP4IF_MAX_STREAM_BUF_COUNT];
+	struct isp4if_gpu_mem_info *meta_info_buf[ISP4IF_MAX_STREAM_BUF_COUNT];
 };
 
 static inline void isp4if_split_addr64(u64 addr, u32 *lo, u32 *hi)
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
new file mode 100644
index 000000000000..edb9e10b6bb8
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -0,0 +1,1074 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/units.h>
+
+#include "isp4_fw_cmd_resp.h"
+#include "isp4_interface.h"
+#include "isp4_subdev.h"
+
+#define ISP4SD_MAX_CMD_RESP_BUF_SIZE (4 * 1024)
+#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
+
+#define ISP4SD_PERFORMANCE_STATE_LOW 0
+#define ISP4SD_PERFORMANCE_STATE_HIGH 1
+
+#define ISP4SD_FW_CMD_TIMEOUT_IN_MS  500
+
+/* align 32KB */
+#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
+
+#define to_isp4_subdev(v4l2_sdev)  \
+	container_of(v4l2_sdev, struct isp4_subdev, sdev)
+
+static const char *isp4sd_entity_name = "amd isp4";
+
+static const char *isp4sd_thread_name[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
+	"amd_isp4_thread_global",
+	"amd_isp4_thread_stream1",
+};
+
+static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
+{
+	if (isp_subdev->enable_gpio) {
+		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
+		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
+			enable ? "enable" : "disable");
+	}
+}
+
+static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_send_buffer buf_type;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	if (!ispif->fw_mem_pool) {
+		dev_err(dev, "fail to alloc mem pool\n");
+		return -ENOMEM;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&buf_type, 0, sizeof(buf_type));
+	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
+	buf_type.buffer.buf_tags = 0;
+	buf_type.buffer.vmid_space.bit.vmid = 0;
+	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
+	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
+			    &buf_type.buffer.buf_base_a_lo,
+			    &buf_type.buffer.buf_base_a_hi);
+	buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
+
+	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
+				  &buf_type, sizeof(buf_type));
+	if (ret) {
+		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
+			ispif->fw_mem_pool->gpu_mc_addr,
+			buf_type.buffer.buf_size_a,
+			ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
+		ispif->fw_mem_pool->gpu_mc_addr,
+		buf_type.buffer.buf_size_a);
+
+	return 0;
+};
+
+static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_set_stream_cfg cmd;
+	struct device *dev = isp_subdev->dev;
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
+	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
+	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
+
+	cmd.stream_cfg.b_enable_tnr = true;
+	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
+		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
+		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
+		cmd.stream_cfg.b_enable_tnr);
+
+	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
+				   &cmd, sizeof(cmd));
+}
+
+static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_send_buffer buf_type;
+	struct isp4sd_sensor_info *sensor_info;
+	struct device *dev = isp_subdev->dev;
+	u32 i;
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&buf_type, 0, sizeof(buf_type));
+	sensor_info = &isp_subdev->sensor_info;
+	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+		int ret;
+
+		if (!isp_subdev->ispif.meta_info_buf[i]) {
+			dev_err(dev, "fail for no meta info buf(%u)\n", i);
+			return -ENOMEM;
+		}
+		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
+		buf_type.buffer.buf_tags = 0;
+		buf_type.buffer.vmid_space.bit.vmid = 0;
+		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
+		isp4if_split_addr64(isp_subdev->ispif.meta_info_buf[i]->gpu_mc_addr,
+				    &buf_type.buffer.buf_base_a_lo,
+				    &buf_type.buffer.buf_base_a_hi);
+		buf_type.buffer.buf_size_a =
+			(u32)isp_subdev->ispif.meta_info_buf[i]->mem_size;
+		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
+					  &buf_type,
+					  sizeof(buf_type));
+		if (ret) {
+			dev_err(dev, "send meta info(%u) fail\n", i);
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "send meta info suc\n");
+	return 0;
+}
+
+static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
+				    struct isp4fw_image_prop *out_prop,
+				    struct v4l2_subdev_state *state, u32 pad)
+{
+	struct device *dev = isp_subdev->dev;
+	struct v4l2_mbus_framefmt *format;
+	bool ret;
+
+	format = v4l2_subdev_state_get_format(state, pad, 0);
+	if (!format) {
+		dev_err(dev, "fail get subdev state format\n");
+		return false;
+	}
+
+	switch (format->code) {
+	case MEDIA_BUS_FMT_YUYV8_1_5X8:
+		out_prop->image_format = IMAGE_FORMAT_NV12;
+		out_prop->width = format->width;
+		out_prop->height = format->height;
+		out_prop->luma_pitch = format->width;
+		out_prop->chroma_pitch = out_prop->width;
+		ret = true;
+		break;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
+		out_prop->width = format->width;
+		out_prop->height = format->height;
+		out_prop->luma_pitch = format->width * 2;
+		out_prop->chroma_pitch = 0;
+		ret = true;
+		break;
+	default:
+		dev_err(dev, "fail for bad image format:0x%x\n",
+			format->code);
+		ret = false;
+		break;
+	}
+
+	if (!out_prop->width || !out_prop->height)
+		ret = false;
+	return ret;
+}
+
+static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+
+	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
+		return 0;
+	} else if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
+		dev_err(dev, "fail for previous start fail\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "w:%u,h:%u\n", w, h);
+
+	sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
+
+	if (isp4sd_send_meta_buf(isp_subdev)) {
+		dev_err(dev, "fail to send meta buf\n");
+		return -EINVAL;
+	};
+
+	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
+
+	if (!sensor_info->start_stream_cmd_sent &&
+	    sensor_info->buf_sent_cnt >=
+	    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
+		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
+					      NULL, 0);
+		if (ret) {
+			dev_err(dev, "fail to start stream\n");
+			return ret;
+		}
+
+		sensor_info->start_stream_cmd_sent = true;
+	} else {
+		dev_dbg(dev,
+			"no send START_STREAM, start_sent %u, buf_sent %u\n",
+			sensor_info->start_stream_cmd_sent,
+			sensor_info->buf_sent_cnt);
+	}
+
+	return 0;
+}
+
+static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
+			       struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
+	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
+	struct device *dev = isp_subdev->dev;
+	struct isp4fw_image_prop *out_prop;
+	int ret;
+
+	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
+		return 0;
+
+	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
+		dev_err(dev, "fail for previous start fail\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&cmd_ch_en, 0, sizeof(cmd_ch_en));
+	out_prop = &cmd_ch_prop.image_prop;
+	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
+	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
+	cmd_ch_en.is_enable = true;
+
+	if (!isp4sd_get_str_out_prop(isp_subdev, out_prop, state, pad)) {
+		dev_err(dev, "fail to get out prop\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
+		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
+		cmd_ch_prop.image_prop.luma_pitch,
+		cmd_ch_prop.image_prop.chroma_pitch);
+
+	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
+				  &cmd_ch_prop,
+				  sizeof(cmd_ch_prop));
+	if (ret) {
+		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
+		dev_err(dev, "fail to set out prop\n");
+		return ret;
+	};
+
+	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
+				  &cmd_ch_en, sizeof(cmd_ch_en));
+
+	if (ret) {
+		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
+		dev_err(dev, "fail to enable channel\n");
+		return ret;
+	}
+
+	if (!sensor_info->start_stream_cmd_sent) {
+		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
+					    out_prop->height);
+		if (ret) {
+			dev_err(dev, "kickoff stream fail %d\n", ret);
+			return ret;
+		}
+		/*
+		 * sensor_info->start_stream_cmd_sent will be set to true
+		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
+		 * start stream
+		 * 2. in isp_set_stream_buf, if app first start stream, then
+		 * send buffer
+		 * because ISP FW has the requirement, host needs to send buffer
+		 * before send start stream cmd
+		 */
+		if (sensor_info->start_stream_cmd_sent) {
+			sensor_info->status = ISP4SD_START_STATUS_STARTED;
+			output_info->start_status = ISP4SD_START_STATUS_STARTED;
+			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
+		}
+	} else {
+		dev_dbg(dev, "stream running, no need kickoff\n");
+		output_info->start_status = ISP4SD_START_STATUS_STARTED;
+	}
+
+	dev_dbg(dev, "setup output suc\n");
+	return 0;
+}
+
+static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
+{
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
+	if (ret) {
+		dev_err(dev, "fail to  setup fw mem pool\n");
+		return ret;
+	}
+
+	ret = isp4sd_set_stream_path(isp_subdev);
+	if (ret) {
+		dev_err(dev, "fail to setup stream path\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
+				     struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct v4l2_mbus_framefmt *format;
+	struct isp4sd_output_info *str_info;
+
+	format = v4l2_subdev_state_get_format(state, pad, 0);
+
+	if (!format) {
+		dev_err(isp_subdev->dev, "fail to setup stream path\n");
+	} else {
+		memset(format, 0, sizeof(*format));
+		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
+	}
+
+	str_info = &sensor_info->output_info;
+	str_info->start_status = ISP4SD_START_STATUS_NOT_START;
+}
+
+static bool isp4sd_is_stream_running(struct isp4_subdev *isp_subdev)
+{
+	struct isp4sd_sensor_info *sif;
+	enum isp4sd_start_status stat;
+
+	sif = &isp_subdev->sensor_info;
+	stat = sif->output_info.start_status;
+	if (stat == ISP4SD_START_STATUS_STARTED)
+		return true;
+
+	return false;
+}
+
+static void isp4sd_reset_camera_info(struct isp4_subdev *isp_subdev,
+				     struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_sensor_info *info  = &isp_subdev->sensor_info;
+
+	info->status = ISP4SD_START_STATUS_NOT_START;
+	isp4sd_reset_stream_info(isp_subdev, state, pad);
+
+	info->start_stream_cmd_sent = false;
+}
+
+static int isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
+				struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	bool running;
+
+	running = isp4sd_is_stream_running(isp_subdev);
+
+	if (running) {
+		dev_dbg(dev, "fail for stream is still running\n");
+		return -EINVAL;
+	}
+
+	isp4sd_reset_camera_info(isp_subdev, state, pad);
+
+	isp4if_clear_cmdq(ispif);
+	return 0;
+}
+
+static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
+				    enum isp4if_stream_id stream_id,
+				    struct isp4fw_resp_cmd_done *para)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4if_cmd_element *ele =
+		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
+	struct device *dev = isp_subdev->dev;
+
+	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+		stream_id,
+		para->cmd_id, para->cmd_status, para->cmd_seq_num,
+		ele);
+
+	if (!ele)
+		return;
+
+	if (ele->cmd_complete) {
+		dev_dbg(dev, "signal cmd_complete %p\n", ele->cmd_complete);
+		complete(ele->cmd_complete);
+	}
+
+	kfree(ele);
+}
+
+static struct isp4fw_meta_info *isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
+						      u64 mc)
+{
+	int i;
+
+	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+		struct isp4if_gpu_mem_info *meta_info_buf =
+				isp_subdev->ispif.meta_info_buf[i];
+
+		if (meta_info_buf->gpu_mc_addr == mc)
+			return meta_info_buf->sys_addr;
+	}
+	return NULL;
+}
+
+static struct isp4if_img_buf_node *
+isp4sd_preview_done(struct isp4_subdev *isp_subdev,
+		    struct isp4fw_meta_info *meta)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4if_img_buf_node *prev = NULL;
+	struct device *dev = isp_subdev->dev;
+
+	if (meta->preview.enabled &&
+	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
+	     meta->preview.status == BUFFER_STATUS_DONE ||
+	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
+		prev = isp4if_dequeue_buffer(ispif);
+		if (!prev)
+			dev_err(dev, "fail null prev buf\n");
+
+	} else if (meta->preview.enabled) {
+		dev_err(dev, "fail bad preview status %u\n",
+			meta->preview.status);
+	}
+
+	return prev;
+}
+
+static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
+				  u64 meta_info_mc)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_send_buffer buf_type;
+	struct device *dev = isp_subdev->dev;
+
+	if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
+		dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
+			 isp_subdev->sensor_info.status, meta_info_mc);
+		return;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this may not guarantee on all compilers.
+	 */
+	memset(&buf_type, 0, sizeof(buf_type));
+	if (meta_info_mc) {
+		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
+		buf_type.buffer.buf_tags = 0;
+		buf_type.buffer.vmid_space.bit.vmid = 0;
+		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
+		isp4if_split_addr64(meta_info_mc,
+				    &buf_type.buffer.buf_base_a_lo,
+				    &buf_type.buffer.buf_base_a_hi);
+
+		buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
+		if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
+					&buf_type, sizeof(buf_type))) {
+			dev_err(dev, "fail send meta_info 0x%llx\n",
+				meta_info_mc);
+		} else {
+			dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
+		}
+	}
+}
+
+static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
+				      enum isp4if_stream_id stream_id,
+				      struct isp4fw_resp_param_package *para)
+{
+	struct isp4if_img_buf_node *prev = NULL;
+	struct device *dev = isp_subdev->dev;
+	struct isp4fw_meta_info *meta;
+	u64 mc = 0;
+
+	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
+	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
+	if (!meta) {
+		dev_err(dev, "fail to get meta from mc %llx\n", mc);
+		return;
+	}
+
+	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
+		ktime_get_ns(), stream_id, meta->poc,
+		meta->preview.enabled,
+		meta->preview.status);
+
+	prev = isp4sd_preview_done(isp_subdev, meta);
+
+	isp4if_dealloc_buffer_node(prev);
+
+	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
+		isp4sd_send_meta_info(isp_subdev, mc);
+
+	dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
+		isp_subdev->sensor_info.status);
+}
+
+static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
+				enum isp4if_stream_id stream_id)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	struct isp4fw_resp resp;
+
+	while (true) {
+		int ret;
+
+		ret = isp4if_f2h_resp(ispif, stream_id, &resp);
+		if (ret) {
+			enable_irq(isp_subdev->irq[stream_id]);
+			break;
+		}
+
+		switch (resp.resp_id) {
+		case RESP_ID_CMD_DONE:
+			isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
+						&resp.param.cmd_done);
+			break;
+		case RESP_ID_NOTI_FRAME_DONE:
+			isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
+						  &resp.param.frame_done);
+			break;
+		default:
+			dev_err(dev, "-><- fail respid (0x%x)\n",
+				resp.resp_id);
+			break;
+		}
+	}
+}
+
+static s32 isp4sd_fw_resp_thread_wrapper(void *context)
+{
+	struct isp4_subdev_thread_param *para = context;
+	struct isp4sd_thread_handler *thread_ctx;
+	enum isp4if_stream_id stream_id;
+
+	struct isp4_subdev *isp_subdev;
+	struct device *dev;
+
+	if (!para)
+		return -EINVAL;
+
+	isp_subdev = para->isp_subdev;
+	dev = isp_subdev->dev;
+
+	switch (para->idx) {
+	case 0:
+		stream_id = ISP4IF_STREAM_ID_GLOBAL;
+		break;
+	case 1:
+		stream_id = ISP4IF_STREAM_ID_1;
+		break;
+	default:
+		dev_err(dev, "fail invalid %d\n", para->idx);
+		return -EINVAL;
+	}
+
+	thread_ctx = &isp_subdev->fw_resp_thread[para->idx];
+
+	thread_ctx->wq_cond = 0;
+	init_waitqueue_head(&thread_ctx->waitq);
+
+	dev_dbg(dev, "[%u] started\n", para->idx);
+
+	while (true) {
+		wait_event_interruptible(thread_ctx->waitq, thread_ctx->wq_cond != 0);
+		thread_ctx->wq_cond = 0;
+
+		if (kthread_should_stop()) {
+			dev_dbg(dev, "[%u] quit\n", para->idx);
+			break;
+		}
+
+		isp4sd_fw_resp_func(isp_subdev, stream_id);
+	}
+
+	return 0;
+}
+
+static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
+{
+	struct device *dev = isp_subdev->dev;
+	int i;
+
+	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
+		struct isp4sd_thread_handler *thread_ctx = &isp_subdev->fw_resp_thread[i];
+
+		isp_subdev->isp_resp_para[i].idx = i;
+		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
+
+		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread_wrapper,
+						 &isp_subdev->isp_resp_para[i],
+						 isp4sd_thread_name[i]);
+		if (IS_ERR(thread_ctx->thread)) {
+			dev_err(dev, "create thread [%d] fail\n", i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
+{
+	int i;
+
+	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
+		struct isp4sd_thread_handler *thread_ctx =
+				&isp_subdev->fw_resp_thread[i];
+
+		if (thread_ctx->thread) {
+			kthread_stop(thread_ctx->thread);
+			thread_ctx->thread = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
+		dev_err(dev, "fail for stream still running\n");
+		return -EINVAL;
+	}
+
+	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
+	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED) {
+		dev_dbg(dev, "no need power off isp_subdev\n");
+		return 0;
+	}
+
+	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
+		disable_irq(isp_subdev->irq[i]);
+
+	isp4sd_stop_resp_proc_threads(isp_subdev);
+	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
+
+	isp4if_stop(ispif);
+
+	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
+	if (ret)
+		dev_err(dev,
+			"fail to set isp_subdev performance state %u,ret %d\n",
+			perf_state, ret);
+
+	/* hold ccpu reset */
+	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
+	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		dev_err(dev, "power off isp_subdev fail %d\n", ret);
+	else
+		dev_dbg(dev, "power off isp_subdev suc\n");
+
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+	isp4if_clear_cmdq(ispif);
+	isp4sd_module_enable(isp_subdev, false);
+
+	/*
+	 * When opening the camera, isp4sd_module_enable(isp_subdev, true) is called.
+	 * Hardware requires at least a 20ms delay between disabling and enabling the module,
+	 * so a sleep is added to ensure ISP stability during quick reopen scenarios.
+	 */
+	msleep(20);
+
+	return 0;
+}
+
+static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {
+		dev_dbg(dev, "camera already opened, do nothing\n");
+		return 0;
+	}
+
+	isp4sd_module_enable(isp_subdev, true);
+
+	isp_subdev->sensor_info.start_stream_cmd_sent = false;
+	isp_subdev->sensor_info.buf_sent_cnt = 0;
+
+	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
+		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret) {
+			dev_err(dev, "fail to power on isp_subdev ret %d\n",
+				ret);
+			goto err_unlock_and_close;
+		}
+
+		/* ISPPG ISP Power Status */
+		isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
+		ret = dev_pm_genpd_set_performance_state(dev, perf_state);
+		if (ret) {
+			dev_err(dev,
+				"fail to set performance state %u, ret %d\n",
+				perf_state, ret);
+			goto err_unlock_and_close;
+		}
+
+		ispif->status = ISP4IF_STATUS_PWR_ON;
+	}
+
+	isp_subdev->sensor_info.start_stream_cmd_sent = false;
+	isp_subdev->sensor_info.buf_sent_cnt = 0;
+
+	ret = isp4if_start(ispif);
+	if (ret) {
+		dev_err(dev, "fail to start isp_subdev interface\n");
+		goto err_unlock_and_close;
+	}
+
+	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
+		dev_err(dev, "isp_start_resp_proc_threads fail");
+		goto err_unlock_and_close;
+	} else {
+		dev_dbg(dev, "create resp threads ok");
+	}
+
+	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
+		enable_irq(isp_subdev->irq[i]);
+
+	return 0;
+err_unlock_and_close:
+	isp4sd_pwroff_and_deinit(isp_subdev);
+	return -EINVAL;
+}
+
+static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
+			      struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_output_info *output_info =
+			&isp_subdev->sensor_info.output_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret = 0;
+
+	dev_dbg(dev, "status %i\n", output_info->start_status);
+	guard(mutex)(&isp_subdev->ops_mutex);
+
+	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
+		struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
+
+		cmd_ch_disable.ch = ISP_PIPE_OUT_CH_PREVIEW;
+		cmd_ch_disable.is_enable = false;
+		ret = isp4if_send_command_sync(ispif,
+					       CMD_ID_ENABLE_OUT_CHAN,
+					       &cmd_ch_disable,
+					       sizeof(cmd_ch_disable),
+					       ISP4SD_FW_CMD_TIMEOUT_IN_MS);
+		if (ret)
+			dev_err(dev, "fail to disable stream\n");
+		else
+			dev_dbg(dev, "wait disable stream suc\n");
+
+		ret = isp4if_send_command_sync(ispif, CMD_ID_STOP_STREAM,
+					       NULL,
+					       0,
+					       ISP4SD_FW_CMD_TIMEOUT_IN_MS);
+		if (ret)
+			dev_err(dev, "fail to stop steam\n");
+		else
+			dev_dbg(dev, "wait stop stream suc\n");
+	}
+
+	isp4if_clear_bufq(ispif);
+
+	output_info->start_status = ISP4SD_START_STATUS_NOT_START;
+	isp4sd_reset_stream_info(isp_subdev, state, pad);
+
+	isp4sd_uninit_stream(isp_subdev, state, pad);
+
+	return ret;
+}
+
+static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
+			       struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_output_info *output_info =
+			&isp_subdev->sensor_info.output_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+
+	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
+		dev_err(dev, "fail, bad fsm %d", ispif->status);
+		return -EINVAL;
+	}
+
+	ret = isp4sd_init_stream(isp_subdev);
+
+	if (ret) {
+		dev_err(dev, "fail to init isp_subdev stream\n");
+		ret = -EINVAL;
+		goto unlock_and_check_ret;
+	}
+
+	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
+		ret = 0;
+		dev_dbg(dev, "stream started, do nothing\n");
+		goto unlock_and_check_ret;
+	} else if (output_info->start_status ==
+		   ISP4SD_START_STATUS_START_FAIL) {
+		ret = -EINVAL;
+		dev_err(dev, "stream  fail to start before\n");
+		goto unlock_and_check_ret;
+	}
+
+	if (isp4sd_setup_output(isp_subdev, state, pad)) {
+		dev_err(dev, "fail to setup output\n");
+		ret = -EINVAL;
+	} else {
+		ret = 0;
+		dev_dbg(dev, "suc to setup out\n");
+	}
+
+unlock_and_check_ret:
+	if (ret) {
+		isp4sd_stop_stream(isp_subdev, state, pad);
+		dev_err(dev, "start stream fail\n");
+	}
+
+	return ret;
+}
+
+static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+	if (on)
+		return isp4sd_pwron_and_init(isp_subdev);
+	else
+		return isp4sd_pwroff_and_deinit(isp_subdev);
+}
+
+static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
+	.s_power = isp4sd_set_power,
+};
+
+static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct isp4sd_output_info *steam_info =
+		&(to_isp4_subdev(sd)->sensor_info.output_info);
+	struct v4l2_mbus_framefmt *format;
+
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+
+	if (!format) {
+		dev_err(sd->dev, "fail to get state format\n");
+		return -EINVAL;
+	}
+
+	*format = fmt->format;
+	switch (format->code) {
+	case MEDIA_BUS_FMT_YUYV8_1_5X8:
+		steam_info->image_size = format->width * format->height * 3 / 2;
+		break;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		steam_info->image_size = format->width * format->height * 2;
+		break;
+	default:
+		steam_info->image_size = 0;
+		break;
+	}
+	if (!steam_info->image_size) {
+		dev_err(sd->dev,
+			"fail set pad format,code 0x%x,width %u, height %u\n",
+			format->code, format->width, format->height);
+		return -EINVAL;
+	}
+	dev_dbg(sd->dev,
+		"set pad format suc, code:%x w:%u h:%u size:%u\n", format->code,
+		format->width, format->height, steam_info->image_size);
+
+	return 0;
+}
+
+static int isp4sd_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+
+	return isp4sd_start_stream(isp_subdev, state, pad);
+}
+
+static int isp4sd_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+
+	return isp4sd_stop_stream(isp_subdev, state, pad);
+}
+
+static const struct v4l2_subdev_pad_ops isp4sd_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = isp4sd_set_pad_format,
+	.enable_streams = isp4sd_enable_streams,
+	.disable_streams = isp4sd_disable_streams,
+};
+
+static const struct v4l2_subdev_ops isp4sd_subdev_ops = {
+	.core = &isp4sd_core_ops,
+	.video = &isp4sd_video_ops,
+	.pad = &isp4sd_pad_ops,
+};
+
+static int isp4sd_sdev_link_validate(struct media_link *link)
+{
+	return 0;
+}
+
+static const struct media_entity_operations isp4sd_sdev_ent_ops = {
+	.link_validate = isp4sd_sdev_link_validate,
+};
+
+int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
+		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM])
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4sd_sensor_info *sensor_info;
+	struct device *dev = v4l2_dev->dev;
+	int ret;
+
+	isp_subdev->dev = dev;
+	v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
+	isp_subdev->sdev.owner = THIS_MODULE;
+	isp_subdev->sdev.dev = dev;
+	snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
+		 dev_name(dev));
+
+	isp_subdev->sdev.entity.name = isp4sd_entity_name;
+	isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	isp_subdev->sdev.entity.ops = &isp4sd_sdev_ent_ops;
+	isp_subdev->sdev_pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&isp_subdev->sdev.entity, 1,
+				     &isp_subdev->sdev_pad);
+	if (ret) {
+		dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
+		return ret;
+	}
+	ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
+	if (ret < 0) {
+		dev_err(dev, "fail to init finalize isp4 subdev %d\n",
+			ret);
+		return ret;
+	}
+	ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
+	if (ret) {
+		dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n", ret);
+		v4l2_subdev_cleanup(&isp_subdev->sdev);
+		goto err_media_clean_up;
+	}
+
+	sensor_info = &isp_subdev->sensor_info;
+
+	isp4if_init(ispif, dev, isp_subdev->mmio);
+
+	mutex_init(&isp_subdev->ops_mutex);
+	sensor_info->start_stream_cmd_sent = false;
+	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
+
+	/* create ISP enable gpio control */
+	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
+						 "enable_isp",
+						 GPIOD_OUT_LOW);
+	if (IS_ERR(isp_subdev->enable_gpio)) {
+		ret = PTR_ERR(isp_subdev->enable_gpio);
+		dev_err(dev, "fail to get gpiod %d\n", ret);
+		goto err_subdev_unreg;
+	}
+
+	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
+		isp_subdev->irq[i] = irq[i];
+
+	isp_subdev->host2fw_seq_num = 1;
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+
+	return 0;
+
+err_subdev_unreg:
+	v4l2_device_unregister_subdev(&isp_subdev->sdev);
+err_media_clean_up:
+	media_entity_cleanup(&isp_subdev->sdev.entity);
+	return ret;
+}
+
+void isp4sd_deinit(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+
+	v4l2_device_unregister_subdev(&isp_subdev->sdev);
+	media_entity_cleanup(&isp_subdev->sdev.entity);
+	isp4if_deinit(ispif);
+	isp4sd_module_enable(isp_subdev, false);
+
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
new file mode 100644
index 000000000000..a6990c8649bd
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_SUBDEV_H_
+#define _ISP4_SUBDEV_H_
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <media/v4l2-device.h>
+
+#include "isp4_fw_cmd_resp.h"
+#include "isp4_hw_reg.h"
+#include "isp4_interface.h"
+
+/*
+ * one is for none sesnor specefic response which is not used now
+ * another is for sensor specific response
+ */
+#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2
+
+/*
+ * cmd used to register frame done callback, parameter is
+ * struct isp4sd_register_framedone_cb_param *
+ * when a image buffer is filled by ISP, ISP will call the registered callback.
+ * callback func prototype is isp4sd_framedone_cb, cb_ctx can be anything
+ * provided by caller which will be provided back as the first parameter of the
+ * callback function.
+ * both cb_func and cb_ctx are provide by caller, set cb_func to NULL to
+ * unregister the callback
+ */
+
+/* used to indicate the ISP status */
+enum isp4sd_status {
+	ISP4SD_STATUS_PWR_OFF,
+	ISP4SD_STATUS_PWR_ON,
+	ISP4SD_STATUS_FW_RUNNING,
+	ISP4SD_STATUS_MAX
+};
+
+/* used to indicate the status of sensor, output stream */
+enum isp4sd_start_status {
+	ISP4SD_START_STATUS_NOT_START,
+	ISP4SD_START_STATUS_STARTED,
+	ISP4SD_START_STATUS_START_FAIL,
+};
+
+struct isp4sd_img_buf_node {
+	struct list_head node;
+	struct isp4if_img_buf_info buf_info;
+};
+
+/* this is isp output after processing bayer raw input from sensor */
+struct isp4sd_output_info {
+	enum isp4sd_start_status start_status;
+	u32 image_size;
+};
+
+/*
+ * This struct represents the sensor info which is input or source of ISP,
+ * status is the sensor status
+ * output_info is the isp output info after ISP processing the sensor input,
+ * start_stream_cmd_sent mean if CMD_ID_START_STREAM has sent to fw.
+ * buf_sent_cnt is buffer count app has sent to receive the images
+ */
+struct isp4sd_sensor_info {
+	struct isp4sd_output_info output_info;
+	enum isp4sd_start_status status;
+	bool start_stream_cmd_sent;
+	u32 buf_sent_cnt;
+};
+
+/*
+ * Thread created by driver to receive fw response
+ * thread will be wakeup by fw to driver response interrupt
+ */
+struct isp4sd_thread_handler {
+	struct task_struct *thread;
+	wait_queue_head_t waitq;
+	int wq_cond;
+};
+
+struct isp4_subdev_thread_param {
+	u32 idx;
+	struct isp4_subdev *isp_subdev;
+};
+
+struct isp4_subdev {
+	struct v4l2_subdev sdev;
+	struct isp4_interface ispif;
+
+	struct media_pad sdev_pad;
+
+	enum isp4sd_status isp_status;
+	struct mutex ops_mutex; /* ops_mutex */
+
+	/* Used to store fw cmds sent to FW whose response driver needs to wait for */
+	struct isp4sd_thread_handler fw_resp_thread[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+
+	u32 host2fw_seq_num;
+
+	struct isp4sd_sensor_info sensor_info;
+
+	/* gpio descriptor */
+	struct gpio_desc *enable_gpio;
+	struct device *dev;
+	void __iomem *mmio;
+	struct isp4_subdev_thread_param isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+};
+
+int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
+		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM]);
+void isp4sd_deinit(struct isp4_subdev *isp_subdev);
+
+#endif /* _ISP4_SUBDEV_H_ */
-- 
2.34.1


