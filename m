Return-Path: <linux-media+bounces-60562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPy8KPkL+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:38:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E786F4D8B93
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5909C30977BD
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4233E869A;
	Wed,  6 May 2026 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NMMG9UqS"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B339A3E9582;
	Wed,  6 May 2026 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060012; cv=fail; b=VbLatQ76sM9+kJn5THe9Pg0QP6Zu5DB8j0FL6SpysouVdZv+E/cX00pzhk4R8ik9aJreD+9eMbezMucmy+uNGIC2IDvdkpPLZ8AmQYqL4wHIrU98NO4ijgmB5nLtb6zoZV171wWc5ObkLRR1qdBYjAh+HY0N30LLCgVTlG80y9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060012; c=relaxed/simple;
	bh=0tlDsOsqCc6WY9WgNYPq+HLCfWb2iComG9pVyJRF1AQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2n6gieqnCodqdglA0urt5RbwfnsfInYBPeHL9E6EkD3phVSnUwj1jG/Biy3Ms15TDiv7qpj3Z0mkxJ5vgn6wouIpt0Zk+db9AIct6nKmfuIMOomzK8m8LFOdub6qHrWBM4kvXt3KpaHWs6pqmRH9PGK8Hxv30DGRJ9Yt1n4nQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NMMG9UqS; arc=fail smtp.client-ip=40.107.208.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytWTkb2Cu8kDrC+ptTpPpOx8R1JX5EVL9/pqzA5fFNjQDxQAIA/JWgo75FtLbxDC72k5qfx4Cr/a4re713ydb+qcRRxajsuGFpRlhz00G1CYwVD5JGfSQpWRg7ntU+1Ha4pZyzs/sL/CaQyXS3AF0jBHRBWCuwRco1CZIsrY5XntJxY7yj+pMJdxOQe45SKx2dDdEOmrZ7npDy1uBUnvQI1KF5e1Y/RYzNmxRLuG9ha2FP83Ud5cbuJcaEiiEaKYNZgLZL8elITFY66/fvQUU/6UKuni1+j/ws0aPJgAejgBcWRASq/iDD5KDlwoCS5xKHaG+gDJlwvCDAVwNHLxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPjUpMJFAajnEf39H0YR+PqrWSzamN+Ig9L9qLQrXQU=;
 b=hOivGh0ZavBFANoew8ytuSaKYkE+gIQquTETKfk+SGehyAU4Vrd/GaRzkebjzkj1Mhmaw8OcBVvJh0IpopcZqOOagsQ22oDXSUQB1evkNWIjPFMjghrXuvlyvqx5gYo1YxSusgd/vb2Rn6TQthCgAZA02QbUUrI9/2sH3Jju/A/LmiakCphdw17rh48QzuIaYvhOCxxvsRKylEEFbIsJ5bVUbFX+bP7tsas6+KnDdAeIWgnPWWT13O9QSdjGjBg6e+0Cjpikg5fvVbMedo8/Xvwv2RZqV7i9lpPBMHj4BshtoWtFgw8HzUCRwfL0op1ioYPXVUx4VowhryTK1W6Mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPjUpMJFAajnEf39H0YR+PqrWSzamN+Ig9L9qLQrXQU=;
 b=NMMG9UqSNMrLj+fr1aiJx8DDhc1AruoMjsSOAzxsloPGqcYzWtoqzIxGb2An1LOffwEPT1GffcNs1IFmCGxfftt/7cR9zLNWUdZF2ZD+4M3vo9Sj3C43x0Y8VU7pGl0nmecQMKfXdhGN0ZW+ZMYZyWlLHvbpMIOYWTbqxY6UmSU=
Received: from CY8PR19CA0042.namprd19.prod.outlook.com (2603:10b6:930:6::7) by
 MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Wed, 6 May 2026 09:33:26 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:930:6:cafe::32) by CY8PR19CA0042.outlook.office365.com
 (2603:10b6:930:6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 09:33:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 09:33:26 +0000
Received: from ff1c6181612b.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 04:33:21 -0500
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
Subject: [PATCH v11 2/7] media: platform: amd: low level support for isp4 firmware
Date: Wed, 6 May 2026 17:32:44 +0800
Message-ID: <20260506093250.93460-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|MW3PR12MB4491:EE_
X-MS-Office365-Filtering-Correlation-Id: 75897614-1e23-4713-00ac-08deab528663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	o5zzVHaq43V0+h5JiF9ieshyHQTG+nix15LP3VOQRIHOu7MRX9HR3TYFlnAscy2t5VSpSL0BlwtZ+jL+7CKLGoODzd4KpW4x79X3JRp3rKDUAgPrQkVorq/tt9uwvGyAtIqNnCNPXgQpyXnrHqX8bxcXfJtfKuKJi54f0GcSk5lbU/QFKVfY2khS7VjTcfWxo8qsymoDI4SrTX5WZfJbuYgdlXBASPPEFZrELR3U7drLhoJtzAPpwgLJRZLkvj0LgcQLCGQ82KGbBbR1g4IXeKiDb5LuruYdgOS8A09n0JsM03ELFIaPKoRCxmPevpkXnNaM/FMe6YRg2+N0h9QWEUd/TugiIVn7e1iMpe7tHNjop0nYXFKug7UH7x/ivWUHl9blkpaN/LB9JwCkYIEP2O93fy3tEl82xNetLxpweAoT3SbG9ZaAiayoEH+n73RTmmDebFRAoSfTNd90f4GTRUX72e/lxKQYlEjTCQjlSBza+CZDQZojnEyUdjYiJQdiiVfXYeca4XJPbejcNMAs0wM3ZMSwcj5ZuZMQpW0wRyHUyXgK3kbd5Q39mA9QSmV29WsLR7D3KceiKcVh5TISi7LBgg6GTtT7DVTSDulfRLYmDnxiw+I3BGhI4MfrCMRn8t/LKgUWGHmrxpV4jTTsx5GM4LeBnxIxL5cySEROvIw0CAhrGsLUBZmvFvFPaVOQRcgwaIQ+9dCDZNM9W2QWu+QEnvzuAs0bVzVNhCa4/uE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UPJa3/J9WgsDowJM7+O7MLv3qRhITxpg/l0hd2qOQAC3qJDrEphioDnAppkW0kInxmMaJM7xaEZdu5RA1OtZJoUNjhDocF9WwyrtXnDYV9D3vR3uU+Ode6/oRUEv6w/K0eqzzvRgqnzTDEz0O3ezAimAcBYo2SAJDIpCBec0Y8W/5QGjdSyhbJTIRwpVgXKJhTuCLML0/fXhH0tQBeKzhai0fwOUpy1mf629L+fAzpHumLB7777bHxipJH38eHQCbJ+K0XkAJYENNtFCvialAu6wdZQtKyAnAC1qtTH65OqRvge174e6tVR8o2FdGxxOSauGzGsPKylapDqgbz2vU8zGrRP237SPkQZkbzrKSXsskYvOgwIm/1RnDLGazwZjLuw69dGChQ3PmADWo9gga5018E2XXLp1EPirAql3vR6H8iP75mjQlOjRspvzPgHZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:33:26.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75897614-1e23-4713-00ac-08deab528663
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4491
X-Rspamd-Queue-Id: E786F4D8B93
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60562-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kerneltoast.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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
2.54.0


