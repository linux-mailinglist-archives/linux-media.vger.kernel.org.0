Return-Path: <linux-media+bounces-56486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIdMGkQJvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:45:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E272D7675
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 338D03168318
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F70375AA1;
	Fri, 20 Mar 2026 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pwrMyI1E"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219435773F;
	Fri, 20 Mar 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996149; cv=fail; b=ZLrIhhMQPVzLj4SJp7pt1hyqxlzKXrzQXDgITkngJRsHi4ZVgYQRU5VovYRXOrCLprcoebUdymAX3j61qKlbpsFIL+lQyKRY1/eWihixcL98iM8xWzQ96ixY5vYdUrBxaiVi4lWCOS9RGhZs3Iyr9O5lciK9lZmfMRVJQmRzbg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996149; c=relaxed/simple;
	bh=q59A5IAE/KXo6aeElnxiO96mSda2/9jO+KIHm9Zh+QA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdvYsW3zMJehpTzsHlK+66LtwIktKzSRjBg24DNb9v4QMF/h/3jrhe0mqfee7nTL+MBZc2kVAQXinGW+GSVwQkBEXIQaKawihkaA6NJKkUdrnfSZ2V8641M+9LbjRtv1mOFu3WQMzjc7YKUGl0YpqcMhZCXjqQ/BfMV+/kf6eWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pwrMyI1E; arc=fail smtp.client-ip=52.101.57.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N12OOe81gkBg2B9jzqFucFUMVeJeD6ftfxyLsT3o17SL6PaM3PBjBq2nuRzT70UxLMbCDsLxJKMZBcWE0vLSpOwhISKMjsB8lPhSsDH7v4diR5Kvhj+u4QZiUQF9LMsi/6G+PvrQoWrgOxg56N+3D2lhB+kaRdImPGpEhX6br16onX5pju7MhgHZkjPIKEzsdjuY1D881eH6p1jPuczgTc8xL5/CMnddbmTSkjFtKA4s4kedRt1yLImyUCnkyRiw4UWKXdBXE8kZrNTEaWKyhr6RBeG4LvUDAvYfYdrmBnqH9ZPI2ouG/CgBErVd7aM8hu7R3DvQj3QA/qmlUUln7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F5RL5DTO2n1N8fnN5AYGlJfxIJk3wb6/pUfFcX3ntY=;
 b=Ue/uyAbJekdEYTZ040UqhOjJEJachrqeB1YW4X+R+Re5VoIMwGXfjcxmfjziS8WkiD1okeSjPBjVPoHKqHfU/9JbXmwhZvJRIJoCea55ok4P9NUNx12FWcyOBC3xb5b1cqBWPV/YGi3Q/ZizeIARqIW6lmwClcYz39zK3or/gt7sudKDvJjd2sMEtKoCpVPO5YCDpQRssq3BDA2Bcpu7SH7Zlg+u2il0tkykgMm1Qi7nE7Jy42NRngdlVHzhdhvcBZBrc/fTOOaRlr+04zDAirPFWXw7DT79lPVJX8QqrXMbT9ClPK9xbwhwvf/1p5YObOQNKVmqQ+9C/zx0KjQFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F5RL5DTO2n1N8fnN5AYGlJfxIJk3wb6/pUfFcX3ntY=;
 b=pwrMyI1EcCKSvv5YKrWHXCnFYi8uTpzriPBpubwt3m9Bl2OWIlwQHAf+YyQjinK4yHtwewp6/O/BZD0CkfkhR8RslTHibLEkJNNBv1ANOgPmt821TPrzaKPEIww0A2URUUGBXDKWMHKpA1u3vGH2b+7arlSoxaQG15ijf5Idbxk=
Received: from SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15)
 by BN3PR12MB9595.namprd12.prod.outlook.com (2603:10b6:408:2cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 08:42:19 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::fe) by SJ0PR13CA0100.outlook.office365.com
 (2603:10b6:a03:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 08:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 08:42:18 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 03:42:13 -0500
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
Subject: [PATCH v10 2/7] media: platform: amd: low level support for isp4 firmware
Date: Fri, 20 Mar 2026 16:41:41 +0800
Message-ID: <20260320084146.200988-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|BN3PR12MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: f4283139-fc49-40f1-c0d4-08de865c98ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MRAUXp32iABLPcbxBPAzoHghTlrTvjYc3Ex0K1FUXy/tEd8sZSAeuCoEtiqtZZ77CbJ0Qa8DTRBp2iVhRF8mmflwR3vC5XnITy7HSXZQqp/mydVibp5d6bgePQP4ifvnrI/znHFNcgKGzt11Zq1rJjtJ4xKhUHYZggy9+c4mX0UgZIlEKko2jjqDBw/NxBYuBo/svDXWnCwZ9Kw0bh4M8xK+YQiGVA9/nQT7MIrZaaSRklDNML6+42oZzpO0UOMBPaMN6vTV9Zy9QbOomXNk4osvqHzHgrZXmzPxsdmaOpCZlUsNH5R4qjcfa5Z+bAyL/GqFDWuGk5bI4lpG3KuFb3vsrnwhBq4lcOi7LZdg09K3x4svseqenb+IsVuK4rzFvO+3SlGfZOWAJpl6RriJvRKyHKUbX1OB3Ta2cp19AI2GvyCD64o1PmOwvSVYSzha2nOpYNawvQAmLJ72ss7uji4cfAonPgju4yM3m/Elzu5Hu4SGNubPnDHmzO30v2b/5cFnCmyoMGqym2jZNKWwrgcUrijY/WuX8ciFLP7riwXQ1KStTs1jxIV534rWVfZRhbGFt8h7o41KVU2f9Oqyl1vaI3alXZU8Hnm0gZFB52H2XatxFC4YrGPT6jAeaeavAXEptXDLaOfgVQ7CNm7Z0OmJcQDA/ksf/8rdmG1EMCSrDnTjpCwX9N65geP8WHBgKvn+meGq9NdB+3IPalUz+mSF0iLFLfm/k0f1dsAHISPxWf7/ZZI32NPl3eEa6Xwliu5ENinykCh/v/LyPJDs3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9tXVYVGJBvhC+cls9va7AGQyqNl8HV3N2V1dm0Xv9q/KSN6dBcJ3JhtBr3Wz+AKGQ9bC/tjkDOowA4CF8XhuUPVva3BVdepDrUZ8LsPkKhEDbuwYIGwMW6kklFa+KhDwLKhZH6SaXtx/LlR7CNXC/JPuLViydsGKuDS60x9I+5zx+/BQUfRaAiTCnx/ri5Wb20jGmcIu4pNC7NvmDcZIgJWAgMoCiWZ/GUnYI/RZcXWhzpUzwez5/diK67E5I6ls+XN3QEyI+c9zx3a3YvFgeK5mBBzVAMamBw2cHtte2b3khJzZ3jLugek2OohtJfNFz77RTWNtH5BENdiptCxZAV8uMfbGOhD9IxveCyAfJJB/J43HddZh0TM5To5jcwQWaN8Q3rEKeLWUsp8PY1ZZL/+rwJRUBpTeThtBRg0MXGLepN8CMnRFJmT8d7OrkRoW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:42:18.8508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4283139-fc49-40f1-c0d4-08de865c98ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9595
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56486-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.916];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3E272D7675
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index e5b39120e7d0..e7bb6dda6072 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1174,6 +1174,7 @@ F:	drivers/media/platform/amd/isp4/Kconfig
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
2.53.0


