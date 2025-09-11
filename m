Return-Path: <linux-media+bounces-42283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951DB52DFB
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4791A5678DC
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49CD30FF31;
	Thu, 11 Sep 2025 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IXAkflKa"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832630EF70;
	Thu, 11 Sep 2025 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585369; cv=fail; b=cuxWRQ8TLSAVY5LNRwPQl4ANt9+xkceTbmWeqnkT0U9dH9qfRg/bXbBh/Do9uk+3DLynPkptOz0Zur0hla4OLSeuh0PvfC2K85xFao2DRrZdSwCXe4AUwMiIw65r4cjpQRxXlgmKre8Lvpa+EG8FRaWpJjWMmWMr3G+BqZUk0m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585369; c=relaxed/simple;
	bh=dKu/k3uvtpuWFq9994JpTX1LniiZY2ShZhMnR91aSt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKBlW33WQDAxTS/X/HcJy8k7cljuxWcK6jKmaFcsePxTT1+K/7u8yfwTFH26VcIStJyxpCpfPu5GNq1/SnfIK5H0Mfk8vT3L3m7siUF6/z8TlcajFONdlNLI2C3X+YMQ4kbNtKrgYSaJ6X2TdvJLHvfOzJL8zfIDRxZktfW2a7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IXAkflKa; arc=fail smtp.client-ip=40.107.95.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozKDOenB3ssKYrrqshpfJMTY9DRRiviqHSZq7lEfAkR2tjGEr/ROkt1g8nX2+wRRRWyLGPqg24DDta8lEBqRcAyyIMk66RhxMYgyLMARp6Zknzy4ceCnvh1NgJILNnRR8hglhDUQJwMDnEmzj8Am2OesMa/LbXhFbgVeTOMoUzJ4FcyLBTV5vTuim0oSRO5ea3/GLhsPs2rP7dcyjKdj9/8e8JGeNmK5jUtd/F2OIc4epUm4B4aUZYjLDu4G86UegcEOxWkfzJaNBqRnChwhcckhUv7QZA10VkrPkQ0tLlQkpdq/EaDdLIFgOz3qeq4F/OhSKde5V4bKWtKUDu+F5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNPk2+8B81P4NHO0b/nYlc5JvqoouBFx003jKYZKPV0=;
 b=zVBz422Eh1bmbelqO6atjdalB4cMh0h5r1nHLy2Sz79Grs100j51SfiIT8gx4E4bYA7X1UwCc6Lc837BkTVSdo/hILj9hAnsVQKNvlweNwyXkY9qwyKE6WeFMpVjAqod7qZ0JQU5XBJ58MZsmrM/T1xh8L7zYHe3VMakfTGG1wVIb/AhIC/CLILmhLsnwzR/+rULicv6YHr23Bt4oVNXssIIQkqSHX0y6+co+tKQ9B9Z17PuPdzkEZ5NF9wREuzzl0ZiEVUBqDsvPoIYC0JoLlllzX4Y/dj0egT9j9u+Bckg2xSg43aPvZH/FODDyb/b6FxwSvy+onV6wb41iaYmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNPk2+8B81P4NHO0b/nYlc5JvqoouBFx003jKYZKPV0=;
 b=IXAkflKa4l5hxdcGawFJyQp+vq5lJGhIQO7qwXc8a64tk3U1xVADKFbDJIeru9PaVzvCs4WZdgQe4Aaw5+/hgSr5xAzfZ6wxz/kHLwLZXfeBgQjeFtdrsJI8kQuKVtPJ5nJGEMl82F9Y8RuL+AKgxtZrp9lS+B0yXo/dufnVIWQ=
Received: from BL1PR13CA0398.namprd13.prod.outlook.com (2603:10b6:208:2c2::13)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:09:23 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::5e) by BL1PR13CA0398.outlook.office365.com
 (2603:10b6:208:2c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Thu,
 11 Sep 2025 10:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 10:09:22 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 03:09:17 -0700
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
Subject: [PATCH v4 2/7] media: platform: amd: low level support for isp4 firmware
Date: Thu, 11 Sep 2025 18:08:42 +0800
Message-ID: <20250911100847.277408-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: d65e4e60-31c4-4ca0-3905-08ddf11b47ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xuENYkQvD2i3Sj2O/SEWGqF19ToFS9dLfusPKPv8mClnAYo+4PvK9DxHvyT7?=
 =?us-ascii?Q?7zDI0cwqICociFzjwQQK8hurBrVZLNgqwuVAlW2ae7e++yOrkkEw6jruRWoE?=
 =?us-ascii?Q?jowZ4zZKGPl5Oc/rTTQYHDmjdsWwlFaUogKs+aECmBaCCBEmLyl/XVgoYKbU?=
 =?us-ascii?Q?jvHICWZ8DJKqWr6d1kMBratFem0YJ8BrCSOEzWl99WlYcHMI6y4G0r9Gcvh3?=
 =?us-ascii?Q?gnQIYDnSybRD5sYFhtB4gsF5bsqvTn+bWdSPNnZ+fXpLWOEUGEv1g3uTqQj7?=
 =?us-ascii?Q?KtNZ/1adBiJFdXNRMbW3bxO7EXAkKoZGeoo0cEqCrVw16vXrztJK9smgCbu/?=
 =?us-ascii?Q?Wm3C0QHtOD8GBXElLBmLimlEUM5bfi1eZbCt2RifMiLli8iPwLABiJ51e4Q+?=
 =?us-ascii?Q?ZuhqkiaO0MXCKHt0lg/Q3j8hMs2Qcp5Q+x2k6LszxAO1Z8KryQAFcKflDUyD?=
 =?us-ascii?Q?7pEHfQcO5Q3RCPGx8buoZEa7zokLxpYb/GyCYTR5ppuMXp8z4UyXAYhxer5w?=
 =?us-ascii?Q?ohVcS1Ha+oMG+carLjPI0CLGM1cKvBzrMIgRu0p5Z92r4OmzprC4mgfyaiDT?=
 =?us-ascii?Q?VIhg8lIIAcX5+gmAnaWqtkte2Lo8nxL8qRFQRB/ybN7/1DQHwGQdSPGNjpFf?=
 =?us-ascii?Q?ty3MKnKaFCnfwuNOKCbd+1PLAtt/tQ9AalzKmHOxIDSzWVTR9HuxI5dWujV8?=
 =?us-ascii?Q?IIwFdDAogqNhdi2HP9cHhX5yU2qJMWEIOK8y5+jzbKw9lgWHs8Y7qA9OIgse?=
 =?us-ascii?Q?LHTyDoyDY89jQ6uheqApr5Qta3u/GOfl7UaibP4z7qVg0Gnga0dAZz457RLU?=
 =?us-ascii?Q?Flz3znMU9ZLUXI9cOc+v5GoTCYFybuCKMiayuMqbvGMC7VCgbttjQap0jfvY?=
 =?us-ascii?Q?1kmDqKEDw5i5/bthWdc4yD8Y+EuezK4B9hp36vF3WI8bWDez5tPDRLEA5md6?=
 =?us-ascii?Q?8YqRSPMQaUBgtjLrFQdp0a6A1LywRJfJ3PgWuLdxurHcU4aLflP7aNP7qHqi?=
 =?us-ascii?Q?E/M7c0btd2ZlReDvWtX9FPY1SNLnle4paTVVp/8mMd9BbEGjtNtVDUuHPel6?=
 =?us-ascii?Q?x7hO0mYDnROBByDbHHcEf9oV16j1nXzNVTgXTgnSUZXr/2QlWpjnGARPohFo?=
 =?us-ascii?Q?0iZFgBabGXUc8CABm0U5fRZKNgpO0HAUsCIdMGdhXDEEjK51lRcxPdB0Kd1V?=
 =?us-ascii?Q?nRaIC5fpYno8/cRX2nYxydY3n5J+mzREvxGqpEbDixYUEPGXaJoJfFqa6Akm?=
 =?us-ascii?Q?szMjroCamDGtolXQZNc1x6ejH29nnX2KUkLzoryBoWuCYfPD5gC3fqBENT80?=
 =?us-ascii?Q?tNS9162uKf8HhKq/3va7r92hkhpssfTLfqEWIzHFA9Zf9ReWOp19NeYluMbn?=
 =?us-ascii?Q?ZHo+YiSPSYHfRDl6wnIm0toTqZWxOx3SR/+spt3v3XtQduNAWqf0crQfB6Ou?=
 =?us-ascii?Q?VfChFeKJBqh85BHKNpMiaE8JTR6O6JjroqdcJbfBJ8HRRCOeQ4rYpKLIJj2R?=
 =?us-ascii?Q?NJpKnNTjx8YELMd6Uom5wx6weenLScHY3U2t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:09:22.7165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65e4e60-31c4-4ca0-3905-08ddf11b47ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

Low level functions for accessing the registers and mapping to their
ranges. This change also includes register definitions for ring buffer
used to communicate with ISP Firmware. Ring buffer is the communication
interface between driver and ISP Firmware. Command and responses are
exchanged through the ring buffer.

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/amd/isp4/Makefile      |   2 +-
 drivers/media/platform/amd/isp4/isp4_hw_reg.h | 125 ++++++++++++++++++
 3 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3640a1e3262c..7aa17c7e71d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,6 +1145,7 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index de0092dad26f..eb130647fbe2 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -3,4 +3,4 @@
 # Copyright (C) 2025 Advanced Micro Devices, Inc.
 
 obj-$(CONFIG_AMD_ISP4) += amd_capture.o
-amd_capture-objs := isp4.o
+amd_capture-objs := isp4.o	\
diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
new file mode 100644
index 000000000000..16a02a14d985
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_HW_REG_H_
+#define _ISP4_HW_REG_H_
+
+#include <linux/io.h>
+#include <linux/types.h>
+
+#define ISP_SOFT_RESET			0x62000
+#define ISP_SYS_INT0_EN			0x62010
+#define ISP_SYS_INT0_STATUS		0x62014
+#define ISP_SYS_INT0_ACK		0x62018
+#define ISP_CCPU_CNTL			0x62054
+#define ISP_STATUS			0x62058
+#define ISP_LOG_RB_BASE_LO0		0x62148
+#define ISP_LOG_RB_BASE_HI0		0x6214c
+#define ISP_LOG_RB_SIZE0		0x62150
+#define ISP_LOG_RB_RPTR0		0x62154
+#define ISP_LOG_RB_WPTR0		0x62158
+#define ISP_RB_BASE_LO1			0x62170
+#define ISP_RB_BASE_HI1			0x62174
+#define ISP_RB_SIZE1			0x62178
+#define ISP_RB_RPTR1			0x6217c
+#define ISP_RB_WPTR1			0x62180
+#define ISP_RB_BASE_LO2			0x62184
+#define ISP_RB_BASE_HI2			0x62188
+#define ISP_RB_SIZE2			0x6218c
+#define ISP_RB_RPTR2			0x62190
+#define ISP_RB_WPTR2			0x62194
+#define ISP_RB_BASE_LO3			0x62198
+#define ISP_RB_BASE_HI3			0x6219c
+#define ISP_RB_SIZE3			0x621a0
+#define ISP_RB_RPTR3			0x621a4
+#define ISP_RB_WPTR3			0x621a8
+#define ISP_RB_BASE_LO4			0x621ac
+#define ISP_RB_BASE_HI4			0x621b0
+#define ISP_RB_SIZE4			0x621b4
+#define ISP_RB_RPTR4			0x621b8
+#define ISP_RB_WPTR4			0x621bc
+#define ISP_RB_BASE_LO5			0x621c0
+#define ISP_RB_BASE_HI5			0x621c4
+#define ISP_RB_SIZE5			0x621c8
+#define ISP_RB_RPTR5			0x621cc
+#define ISP_RB_WPTR5			0x621d0
+#define ISP_RB_BASE_LO6			0x621d4
+#define ISP_RB_BASE_HI6			0x621d8
+#define ISP_RB_SIZE6			0x621dc
+#define ISP_RB_RPTR6			0x621e0
+#define ISP_RB_WPTR6			0x621e4
+#define ISP_RB_BASE_LO7			0x621e8
+#define ISP_RB_BASE_HI7			0x621ec
+#define ISP_RB_SIZE7			0x621f0
+#define ISP_RB_RPTR7			0x621f4
+#define ISP_RB_WPTR7			0x621f8
+#define ISP_RB_BASE_LO8			0x621fc
+#define ISP_RB_BASE_HI8			0x62200
+#define ISP_RB_SIZE8			0x62204
+#define ISP_RB_RPTR8			0x62208
+#define ISP_RB_WPTR8			0x6220c
+#define ISP_RB_BASE_LO9			0x62210
+#define ISP_RB_BASE_HI9			0x62214
+#define ISP_RB_SIZE9			0x62218
+#define ISP_RB_RPTR9			0x6221c
+#define ISP_RB_WPTR9			0x62220
+#define ISP_RB_BASE_LO10		0x62224
+#define ISP_RB_BASE_HI10		0x62228
+#define ISP_RB_SIZE10			0x6222c
+#define ISP_RB_RPTR10			0x62230
+#define ISP_RB_WPTR10			0x62234
+#define ISP_RB_BASE_LO11		0x62238
+#define ISP_RB_BASE_HI11		0x6223c
+#define ISP_RB_SIZE11			0x62240
+#define ISP_RB_RPTR11			0x62244
+#define ISP_RB_WPTR11			0x62248
+#define ISP_RB_BASE_LO12		0x6224c
+#define ISP_RB_BASE_HI12		0x62250
+#define ISP_RB_SIZE12			0x62254
+#define ISP_RB_RPTR12			0x62258
+#define ISP_RB_WPTR12			0x6225c
+
+#define ISP_POWER_STATUS		0x60000
+
+/* ISP_SOFT_RESET */
+#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
+
+/* ISP_CCPU_CNTL */
+#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
+
+/* ISP_STATUS */
+#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
+
+/* ISP_SYS_INT0_STATUS */
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
+
+/* ISP_SYS_INT0_EN */
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
+
+/* ISP_SYS_INT0_ACK */
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
+
+/* Helper functions for reading isp registers */
+static inline u32 isp4hw_rreg(void __iomem *base, u32 reg)
+{
+	return readl(base + reg);
+}
+
+/* Helper functions for writing isp registers */
+static inline void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
+{
+	return writel(val, base + reg);
+}
+
+#endif
-- 
2.34.1


