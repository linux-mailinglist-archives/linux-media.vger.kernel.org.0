Return-Path: <linux-media+bounces-54042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ltUGIrg8pWm36gUAu9opvQ
	(envelope-from <linux-media+bounces-54042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:31:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 149301D3EE9
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 351623014FE7
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 07:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8148A383C7C;
	Mon,  2 Mar 2026 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F/l6fleW"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5F37883A;
	Mon,  2 Mar 2026 07:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436658; cv=fail; b=VS7x0XR/YavSSDBBUX2SkODD6iQaF9Yr+oqx42tS9GaLRMOJCf+iBgvyUfQuu6dAAA/BRtjY22fW8ul+Zz/QpBn2vVdCJyYBGfM05+DAGur7GuvbXZENpNi36QovSwEd0m5v4TAPh8hglQ9U6U0NSOBKn2hntMIrlF69JQH3t1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436658; c=relaxed/simple;
	bh=UZKMJIQMkoWXnbLs7HZ8aZMvGiKgBmySJHFblgw414k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sc6hM5k0kegd7BfYKzuH1d+9M+16Qdj/EKpiCba4aTJKKxGmcwwZYQsPJOu6RxD62lpTqA+HPLzs9CriLXDbcdASyu+xCTrj0M8O6X68zAcLKnvxHyTraUnqFG1kyXdVEdrL/OcCM6iFK1jXFigHp27dF2DoXXHTgJ/Dgvo7e3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F/l6fleW; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkmTvzVupFJjGvpEtAPsmFRk19Mi60DC01iFdWV0VKDnnzGTEJRMXy12Uy7bEqJKy3Af9RdWEjhxZyUJGKqHkio8U+vylgisBZBLGfdJHEGfUTvjADkoo5EvabxKSPEC0TU+mxgJxxfpJDcSHnjjjJ4Xp4+D0/Mhw5gEzRqdoiXNZuUweHI4O+Y298hH2SEuYLKb1yNLwM2Xp6rccc+nbWitwOuF6zZm4P56Yrk9FDblAYot0tPKvnwri6KAiHxgmcicbQH2U/rwOU5ytLCdVgpSMQagFhuZSzUFimERf3qu5PF5N62pOa0FGaCTCQ4UDscWfmF2HsRlYIjKfloMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4FPtJVaEQ0IeEFVybSiUYncZJIIBrSmQA7Udkxbsjo=;
 b=By3U8yV6bruA6qWFXRtTdvkTqxGS9C2GRcnCsPt7NbFtky6fiz1EqL9DZd5A9s9/N6TDylZU8/SCMboaKEC0EjGmNUEy/v5s8RdQcP1kH39hhw9NhpJzyt1B33y4plGDB8kW7X8PJySQn7u61aO8ZwXx7Q2uJGyR4EeqaVVcY+S4EMDyKBHz3S2wVoF8HrCfnRMPIBYJGTOpdrcP8EIIE7U/TJxY1+KEb9SkkYMLRJCdDW42z7JslEx+ZRo2wX97Cjio4TEC/gpj73a1b+z9jPJFAGCbIoUiEmsdqjgJFK1EXI/BC3tioqww7bra52NOpVSDayk64ehvI91aiVI0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4FPtJVaEQ0IeEFVybSiUYncZJIIBrSmQA7Udkxbsjo=;
 b=F/l6fleW1ns5cllxRFR2HWJK0diOU9LShTOt3DBvhaMdl394V1dW2tnb9ZNwtRcj6wHAMCHMwP+xS218SZIH/DkZuDE9k36e7toOjxTfS/Z5oFXzZoYtbQHfA1zvBLI+WjF5i184074B17XQJ61zm9EdDzkuV7VivxrUhff5EJw=
Received: from SJ0PR05CA0195.namprd05.prod.outlook.com (2603:10b6:a03:330::20)
 by SJ2PR12MB7992.namprd12.prod.outlook.com (2603:10b6:a03:4c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 07:30:51 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::71) by SJ0PR05CA0195.outlook.office365.com
 (2603:10b6:a03:330::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Mon,
 2 Mar 2026 07:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 07:30:51 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 01:30:45 -0600
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
 Zagorodnikov" <xglooom@gmail.com>, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v9 2/7] media: platform: amd: low level support for isp4 firmware
Date: Mon, 2 Mar 2026 15:30:15 +0800
Message-ID: <20260302073020.148277-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|SJ2PR12MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 799c67b3-7f39-4477-243f-08de782da194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	nChVxAssIpLeWLXAmT25G2sYTw/AbpKAVm5mMqjvQ44kY/n1s72tXZfKWLLDz3Pwo6wRhSi85es2AjFdP6+TLuISqdPZA/RbicAoAaYEhlprIRPOwsf69SFQi+KzXqrmKxf89DkH61N4mCwUlo5sQin37h/J+ZYer7KN5z6jfu1p35MZzbu5flOOZF+vUOoLsV4VdpbDm8+EeKyyFkoNlEJUreLZSoBRCzB8bExSxGkEh6N+anuJwS/5SDdyFj1qtTTExx9XDLyEsEwDqVu3R2F174X7pmQ0XkeunAtYJDaOZ9YUuz3znxKz76W/YB5NTD/XJJe6HvcXR3RRtHY4VWS3iQGJaegcI18byM+Ib0ern/tm5f1Zu9FNAq/nXT2CPfpNfLWo48RFG6ysjqbE7yIxqVcFRe51uKtKIgKYpaUOxkP7jHLf8Ofncu0lEezb+qcr5fTwdIDpdXzmKDf2804f8ZsKBpv5HaQJUoUMEVprXPw4/FZozuIijsOcckr7Y1a2mzWeCiVcP3bi2GLSe8bKiFa7Qon28uHd85oB9Cihob5eOtI9Ss5FVbRhRjnmyuTNY0XGImAKKdtvX+HkHrFzphDXJ+w12p6w0duhf9eOUxny69gj/qXgbaWil1wBERtUsnms8IB5goKsyBuL5GUAxwnpcwaODdULhlOZCi9iScbPdC8wcsboEr9Wbz6z7Z3E82WStLEiniDovervg8sVCUIEfczv9kpnIWfbdpaPkLvHDQa6Zbmyg5VULemKgIvwBImdusJWTD+AWqfKUXSzQNZ2l/8ksNnf8uhRy0136lAMnvM0WGB0fDXratyZQb4UyPrtezWWKrcpkJjKjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fh25arPp3Z19n5K/jpmKlmka95OeU/HGztymEpmhUYiIA0uTKWQ8cSsRlsN4DpV4BfGS0f2+SOWwd09dtMrv2PAFprD3FYxl7rXZbyM/3n5qNnZaIItVef0+HsKZ6bjT6CHaURr/LiIXF5JSQTpQexqZzBz1krE/VmJP82wwA7J6Ik2I4gzyV/qhur5RtaUQ9cBPryYg/P5hPnNcJzw5dqjC7WCiOyycMjNp0aW4RkiwKfZo+Qh4qUxEObHyYfqqR2OuJTlQwfailkoTE5y97qYf88yfrKQUpWDRLOwKpgSD/0IZPjLTidB09jw6W0Ut91xNI5g1bARAB+IjXg0tzK7u5og98gzUvHdJ/j1MXhcJnV7RRxnB12w8TsHqv+5IrBw9OBIgfI2KbqU6NNC9XJgd8H2w73WCZrYBt9yqTFy8kljSDHdE1U75shUrKUXd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:30:51.1797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 799c67b3-7f39-4477-243f-08de782da194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7992
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54042-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 149301D3EE9
X-Rspamd-Action: no action

Low level functions for accessing the registers and mapping to their
ranges. This change also includes register definitions for ring buffer
used to communicate with ISP Firmware. Ring buffer is the communication
interface between driver and ISP Firmware. Command and responses are
exchanged through the ring buffer.

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/amd/isp4/isp4_hw_reg.h | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)
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
index 000000000000..09c76f75c5ee
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -0,0 +1,124 @@
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
+#endif /* _ISP4_HW_REG_H_ */
-- 
2.34.1


