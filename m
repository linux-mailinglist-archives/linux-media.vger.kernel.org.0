Return-Path: <linux-media+bounces-45465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C267C053E5
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2EB1A6104B
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5E3309DC0;
	Fri, 24 Oct 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E6RsYQcp"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1E03093CD;
	Fri, 24 Oct 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296843; cv=fail; b=BtVuWJWndPGjbPgJ4T3Xo+rjGcQs1wF5qlXpL2BdqZxABSR7EOcIMZiQu2ajIF2NadXdpcCqPCzCAVkP3dU2yXEOTngjfNw2GQEgFvH/O36siXlxrcRJUQHsn/nqzePyly/41VJDl/s+cPRdFRkaiB6Juqb8EkF/0pr95vf5uW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296843; c=relaxed/simple;
	bh=dV/MyqzpPSGAjCIVZoQZ40M7SdVcNAQ6g/ejFGtAFZE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbtq3lyg45Uh2UDqn9w0TjRIZSzAPQdsD6nMAuv4O0VFmx0qvqKsODbgNgARQDqyo85uBKkz4i1FdFbbf2tpHx1nlLa1jrAcbAYlo9ISQwdyYIQxefAaKkE6gocMRqEMKsMtxLpVJ1RBppnvSwYzPZrer7V++BhMwIHYQawMvgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E6RsYQcp; arc=fail smtp.client-ip=52.101.48.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPxXWnskEoxOh6GH5sSmke6cGNF9b7AR1c9NxhEaD9GpqaPnPoZAUNfj0MzwaEzsgspd34GwOwGFLdpvXWYsq355Y0/7Eubpj/9a7NXwPKG95qzv71TgLrrQlsvitcWWT2kWimNKnK7KMCMtWLMFqvS/wLehcn7fH4WK21kMNjLlBrUciEDW9O+MXyTGRySxepqbHcEJLzrygyY2+hu/PhDAXyPxSkzvuyS2HZa0YXceSnn3odOXwtenluz/BwM4/n5lcW9dD2PpzqxgasbbZOOf98XhTrRN28wjkqvoKxajChv+IcG+ouHfdHZBNVqrDJnkUb3QchaJ5ielfRNKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJB9GQCN2toq81UmI5cMoDdH0DZ+yqdCfoFDejB7da8=;
 b=pg/tQxHyhhUlrIRk1E27UKvpnNh5OGh2VnyI+5WCb0Tz5/nS1qP3PYOvJjF+LK0tXpklHsQXTSIFfwoEjjpPXciy3/oWRZNG+L85W2h0aCY5Y1jIJ+fROapQrQcsarnquER6FT3xAEyRv1m6AIP00huMFJ3X+vHPfIJ4CsDW78igA9BixsOA3gzCrZjuxCh2qlk4tzFBrIqhYvZVwq5duDTwtTrV1FK9WIjh5GysKFBXl7+lXKu560SlJdEVvC3YHMwueOTn6RWzLCiLkbmLcUN1gbZndM3kzRMxs5fjhNcnSmub49wDJxwiSjHJwOYLPgr6TgGnrC336j32P2gOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJB9GQCN2toq81UmI5cMoDdH0DZ+yqdCfoFDejB7da8=;
 b=E6RsYQcp/CKPkhC3TKxy6FeT12yR0YmFNezuyXpehqn48EoHLYhjJ9RE/6owHIMTlKB2NIIdRvWN0NsdVwGJZDIgt4Z4qJ1ZmxLvzKyi8TRalrkfVRO6y9r/JL3heyzmhYZOHDvRPx318x/3xxJPMKt66eNFKyVrNpIho+yEx64=
Received: from PH7PR02CA0026.namprd02.prod.outlook.com (2603:10b6:510:33d::35)
 by CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:15 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::23) by PH7PR02CA0026.outlook.office365.com
 (2603:10b6:510:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Fri,
 24 Oct 2025 09:07:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:15 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:07:09 -0700
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
Subject: [PATCH v5 2/7] media: platform: amd: low level support for isp4 firmware
Date: Fri, 24 Oct 2025 17:06:38 +0800
Message-ID: <20251024090643.271883-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: ec5e6ad2-6eb8-495a-eb36-08de12dcb9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MFgyLrc6WEolC/cWHnJ3BW7Pqv8rhcXg3AFLOaR/IrpmCprywS4MczOxZsI1?=
 =?us-ascii?Q?eE7yaBfQZPvxBx+vn6JFE1nmfJ9WiSHzTEfTWocZsETYcEjabngXXOg8PHsp?=
 =?us-ascii?Q?EFca57y8uQFJ+bwH6zwRoqDVW/mvl7nra9OGqtX24ECDVNyz6fXicURzoIl+?=
 =?us-ascii?Q?pNC+2WaOx/GAmYasmxuxwAfoI4b+2Rx5ICCGAa7+CyWRfaFHL+x+SCLwmr+9?=
 =?us-ascii?Q?3dSnVkVGzmHiLKhX2n2gCG9TjD/0u3HHrflBeqrQ5YdNcKQ1p2d3clasarju?=
 =?us-ascii?Q?Yn50610L4ub8lvd37NwTuSG4zz07o++rS5xGr+lLpwZ+8EzKvi/cLG2HKZ0X?=
 =?us-ascii?Q?rUggClEd9KIdXE0QDYB+sC7hraIm2BllCLpG6lqkFwtGOPwfPuhj9EeIh2Wp?=
 =?us-ascii?Q?+E2vPSCeDBBV4Th4mi4CGfm8gu1vugG7D6+ECuOzQv9XRAG75VA/F5GLk+cQ?=
 =?us-ascii?Q?6wKQK5rP2+Px2tI/MdvW7QEp761clZ0GJUesfqRDcxDr+wq4r1TKbPkt0xzD?=
 =?us-ascii?Q?Y4uh5nXuMROx2caH2n0pc9RxbhFdNHEim1ig7r7rblnTMUZdj5fezC2rhJ4/?=
 =?us-ascii?Q?k/0ubVDFPwEr61yYEaaqzLhIohlpeYQw4gArcvbxdipX173uGTkYzNDqxEfe?=
 =?us-ascii?Q?YDKSt0pdScY6lNQ7ysn7LSxgbXr6K24vZcUx/eEcCrGP8sb4HmXzMbzDq67p?=
 =?us-ascii?Q?plKGMgz7ODmdKFAkcuIkUx3yY1gAwlahJmvSOIUsVHKA/ZyZfvnCJ5GDEo+y?=
 =?us-ascii?Q?W5kcl00N5vJBakA4aTic+tXBXcdSOMTVY8/kPfSISBhUHKO38cK2zPAdApig?=
 =?us-ascii?Q?Geyv0BtzbKnPbFcNzL0FJmpNMrbB7ViXLBGdjmoMNLBpvENB12QyssHER64i?=
 =?us-ascii?Q?TdKwEE4Y62ikQDNwOF4kG1pHK1JL8Xxe04N3rSmNoXNTI21h3UM0UkIchz/A?=
 =?us-ascii?Q?jN6PYE2hwM7Ua9vmrc5WnK0Xa1JzWhJI60q6DVXxwBvTfeBXfJLt/yTFGUW4?=
 =?us-ascii?Q?PQ2dsQuCu6BBbwPXvwjTVMoGbFKFKdnBrPO33olm0wCy6AX1BJZbVSGEpQWD?=
 =?us-ascii?Q?aCcNRaGBO2BN3Whx3kDkl1WEMy+PEw3gfeNy2JbIDqsXRewzcbO11zcx/obA?=
 =?us-ascii?Q?Abp3hi0jDIRu5GYjeoJj1aribl0/6e2IMbpZQ8SXEFcraH5CneN4FLP4H9rg?=
 =?us-ascii?Q?NyLR8V76hDveSqhNb0oNW2KnshfW09zK/wAiIWzwIMQ/3PKO86YJE3jUOmwz?=
 =?us-ascii?Q?y3rmr3BGaQkOmt88cSb5lYPOkOxMhXCExN4pE4vf6G8Q3XnDOoGyA0bmy1gf?=
 =?us-ascii?Q?AjF/om7npmAIanP/NwuPfDDSb6G+bUBeFsl1SuPDVUeQpskgjI4EnswfBjIL?=
 =?us-ascii?Q?dxby6vPSNf029rZ8X1u/RhIoNdEc83k0KUluJaMBplNijmgfUde3UgPJuGp7?=
 =?us-ascii?Q?VjuEXsa9ZeQNS6L7Ddva6Rwmm61uYR61+kB0yEWhRqcGJ+Q/mUapRUDoAm7i?=
 =?us-ascii?Q?tG1Aw7N0xukp2B6q9yE1WqXrRXcKZpuQVTKYgwJWjyOak7DAa3w36Jbykdl9?=
 =?us-ascii?Q?D6CxbMNfNbwdOff+Ov8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:15.2032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5e6ad2-6eb8-495a-eb36-08de12dcb9ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284

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
 drivers/media/platform/amd/isp4/isp4_hw_reg.h | 119 ++++++++++++++++++
 2 files changed, 120 insertions(+)
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
diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
new file mode 100644
index 000000000000..6697b09270ad
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_HW_REG_H_
+#define _ISP4_HW_REG_H_
+
+#include <linux/io.h>
+
+#define ISP_SOFT_RESET			0x62000
+#define ISP_SYS_INT0_EN			0x62010
+#define ISP_SYS_INT0_STATUS		0x62014
+#define ISP_SYS_INT0_ACK		0x62018
+#define ISP_CCPU_CNTL			0x62054
+#define ISP_STATUS			0x62058
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
+#endif /* _ISP4_HW_REG_H_ */
-- 
2.34.1


