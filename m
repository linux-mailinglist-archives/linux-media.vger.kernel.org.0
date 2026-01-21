Return-Path: <linux-media+bounces-51265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHMGIlbgcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:19:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B472584E1
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7C3170CA08
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E677C4A5B10;
	Wed, 21 Jan 2026 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C5Dn2t3b"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013036.outbound.protection.outlook.com [40.107.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85B4A5AF6;
	Wed, 21 Jan 2026 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003799; cv=fail; b=jPm/m95wIFI/F5AIDXhgvZ9aI2tatDySM4B7qbFMiUF6xa3j0gjNzPPwb1ryV/K0eawunj3OBVPq+sZwc7O8ls7ZD2A6OMNqlUE1zCiR8exjhxriK1MLKaFbt3LskrA9/7aN2gRYsAM/yLYZdFfh+HEhP/0ZihS9udlsOS9bjcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003799; c=relaxed/simple;
	bh=ctgakOB8M3/wpyJzPeVWUjr0zi9SqROwsYpILl0av78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfVxyYfyGmt18SNq1nuxEl0EF+7tHMi/uqv4nqXeP3/G94rJgCilGz4d0WG1g7s/ZkMbGXEC9+r2pVSOobQPVLPgboXv1KoFg47+Cn/++gxJddqXMW3G7PFGYrjLmPaqXxSK4UkCz5/sSdDJEfm0EWf6bWvDHGtgF6EC42AkDyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C5Dn2t3b; arc=fail smtp.client-ip=40.107.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZL6d1j3aSBLAKbCFACz6XQvkWXAeq+sBbuYnqN/2+KhTX5vEAtpLzVmla32qBB9afjKRyD/u4ENVYEhJ2D2aSVTfoAaeaYyKvF12H0x768FATHk1mZRzvrN9mQ/6m/KV02PsCWNdMgdmvFOSj+mu3x9S4RNgiZHPmq2f3MwKRtQrNWrg+s8TcWY8aqpqwzcBhTtyYIa1CNSQAFJCuTtDhjOsvb+FePdyc42GM7/5ohHUsjvHb+xCZUBcwV31DTIMPjQOXt700WSYbxPDz0QVClI65oiQbtK4FGpQwbZyUIfqWB1xN2VKk5tE7EdGxGKmZyiCUBpcahgd/XTY5SaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuWynR4xJE7UMn65qZaTYrCo7ciVYjb70ApZ2KjgbiY=;
 b=AfNr/10z+q5R2JH5dayUjuVq4ZNHwfIWF6IdpOQwMkypa2krPKzT+HQF55SYRATPFYbJn1JFgiz6Z/ncRTU2VeN7tlvktSZ1iXtV3IMdwcq4o+c2vu+tbfAkZXBJpxNI5+AC12bGRu5UhPkifwkOMXN+++wLSYm63PDyIsfDlFf2I3SNjK1ngBJZBKQwZ49UUWi6WXol6XSxIgj2gP4cdcWod4Ly2dER4POtS0/SolHvT6pPJ8dWf67lX9JX1nJXiSzdZNz3e1UmcExBWw4QPKzJvu4K7lYPk0hWBeaJ2m82PgB12bZoOjj+sYJLF3DWLVGERxIlWVGIbdyx2qgkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuWynR4xJE7UMn65qZaTYrCo7ciVYjb70ApZ2KjgbiY=;
 b=C5Dn2t3bhVVzdMomn0wWGa2RdSKum0dgA68941ek9OxZ7JakFxcY++SCAKvQi1WrsR/VNmb/10wM6Nk5Y6tGp/D472Eq0zFvWkipQIAcix8Kx6aZUFUlIIPShuqu5e011q+9eb1ge7NgzGSAwCrQ98gEwWi7F+YtVXc8eR5BeOo=
Received: from PH2PEPF00003847.namprd17.prod.outlook.com (2603:10b6:518:1::64)
 by CO6PR10MB5554.namprd10.prod.outlook.com (2603:10b6:303:141::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:56:34 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2a01:111:f403:c91d::4) by PH2PEPF00003847.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:56:34 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:33 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:56:32 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIN3104105;
	Wed, 21 Jan 2026 07:56:26 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v10 17/18] media: ti: j721e-csi2rx: Support runtime suspend
Date: Wed, 21 Jan 2026 19:24:23 +0530
Message-ID: <20260121135424.1185710-18-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|CO6PR10MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb6a1bd-8f68-427b-6363-08de58f4e347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?664p/7Dtj4x/K97A7wS/+hLQN7yl6IGf22U4XglsryQRnfJdY3pjASVtkRRD?=
 =?us-ascii?Q?qVAna7JgXB/VZ2nWhm5FutdT9WDodrONE//oJKHYf7FnboQs/ZMI6WlKh8+8?=
 =?us-ascii?Q?hMeWrKFTOZcIwRoBH+dJr/X5bq9QfKby6tn0pyAtFklB/xCI0k9c3nQunccQ?=
 =?us-ascii?Q?/uvFP6rARPZG5bgwIPjxvtfhuL0Js83Pa0F1/n2XEoRw++N75WJliuH0KEZP?=
 =?us-ascii?Q?RM0yYNxhkQNZs+eDotVQ3kL0cvAv+446AITo2TvK32WqKe8P4FSEXY0dekTK?=
 =?us-ascii?Q?GUEwHevK9YxRSbUsZhTZl0gqxWI87gdd/HfRud2zGEd2xV9HRfMB8PLjL31J?=
 =?us-ascii?Q?UYv0Sx4cFdVEshnDRBSbIGdEX4rQC1Kn2OTGpu77OqRNjUUimOiOQeOl0/OM?=
 =?us-ascii?Q?W9UE2DJFY/OcOZO0RCNLKgHEnhYQyMuyFgSiomuZ0kIAYpr3w0Uq7iroHFRW?=
 =?us-ascii?Q?fnw2T3bMkBjMhaP4s7+3Eb9EfWu1Tb3iZp34m4/km4h2LxZLc40OsM6FqHqf?=
 =?us-ascii?Q?mcAoF3DqpPZFBOnqq5c7GyFQaEWlw9lcOUzZ/Nt1p2qcdvA5E6Rfcyys7clI?=
 =?us-ascii?Q?g+n0RPtRHCUW7q5+BOsQ+XFhlutk1Kpe8MDcAie/lSvbmVz2WwiI01208luT?=
 =?us-ascii?Q?prsZR6F3kuAnh8bqgo9mvVG9PMIIuZo2nBBY4YfwWVo9OqB8n+v+E/EYZYGX?=
 =?us-ascii?Q?YhDaVKLyd/lOy+0hq9iG6gDMkVZY2sQf3N4cR1Q82GiSUD+51FAcATA10FuU?=
 =?us-ascii?Q?A/c4MWP+7/7F+/qWLvO5Qp3F2VnTXWEe9ToaLIQbTNvOIi4Yd1bZL2wlzl8s?=
 =?us-ascii?Q?VuFBZFiDRZszbv/U2YeQeJyNBJV+cugf1vXvaes0BLDGj/NyRkg4y/c/ZGbp?=
 =?us-ascii?Q?r/4WIHbPBTR2kVVI3/caB2pIOyPuG8udus4UYjSMPVoebMqCML36roPBdRTK?=
 =?us-ascii?Q?l4JKwomKH56YWygmQwEPRV45qGFqpY2MFQrMX9KChMUamoPo8xsbwk+R+KiL?=
 =?us-ascii?Q?LyUevWW4lvFTITa/0fRpyWrZrFUuaf4a3Ijpg2QzdqoL8SIr8gDodpWERCdb?=
 =?us-ascii?Q?3PXs57pFgWyuog4cY38K1GKTwYkue7RSqkY1NBa0frWQsw5ZxkGeUzxd34Ag?=
 =?us-ascii?Q?4NMZzN3KH89gMyN8whIXc8CpQvrTQt48UTKPqIo0usk7AVc/0pTjgxMcClMA?=
 =?us-ascii?Q?j9vei0sey33DzQKlSyy+BEEM8ySjt0yix2hnpF+oJQxE317SkDEScFcexH9g?=
 =?us-ascii?Q?IapFd2h3CbIau8CuJ4YRzrv63d7Wk0s4froq/VwcK67KcYLAJkB8XBNSgWQ6?=
 =?us-ascii?Q?64wH5+BztIHfPJ1tx2xLf9TzId0HVFP5Er7LXPDJQvp2wxa8bKos996x7i2n?=
 =?us-ascii?Q?pBHgoNNDFLgHLjYFJ9fqVsHqug6neoComKvpOUUknJKN4h4ULgL3nwpt8nGR?=
 =?us-ascii?Q?rboUPSXm4tE8eY4gjYQVvjHSrn20IsF5rd5JVXa8MhhpLhl9Yvh1uOOXq3IK?=
 =?us-ascii?Q?J78o8TABxEhaLxSupmmG7TxdtO3FUkn5+z0C3gBig7JSlzWaa5a/DPS8W9Zk?=
 =?us-ascii?Q?YoNkf6yvJUXFPUNQ46/8rTv4R7d4XuheeDgT/C/FJYaKX1Lb4eKYTDHJe1du?=
 =?us-ascii?Q?sNYB5LN3QtXKcovUefuBPPJuCrwThA3NfNZf7hp5um61K/pke1OLZopmLxT6?=
 =?us-ascii?Q?0QGznw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:34.0236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb6a1bd-8f68-427b-6363-08de58f4e347
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5554
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51265-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ideasonboard.com:email,ti.com:email,ti.com:dkim,ti.com:mid];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5B472584E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/Kconfig             |  1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 59 +++++++++++++++----
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index da33facf44678..d0cb05481bd85 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -83,6 +83,7 @@ config VIDEO_TI_J721E_CSI2RX
 	depends on VIDEO_CADENCE_CSI2RX
 	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 42ef8c553883f..c01905680e108 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -962,12 +963,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long flags;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(csi->dev);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
 		ret = -EIO;
 	spin_unlock_irqrestore(&dma->lock, flags);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
 	if (ret)
@@ -989,6 +994,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1008,6 +1015,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1259,7 +1267,6 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1279,7 +1286,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
 	q->ops = &csi_vb2_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->dev = dmaengine_get_dma_device(ctx->dma.chan);
+	q->dev = ctx->csi->dev;
 	q->lock = &ctx->mutex;
 	q->min_queued_buffers = 1;
 	q->allow_cache_hints = 1;
@@ -1493,21 +1500,46 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 	spin_lock_init(&ctx->dma.lock);
 	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
 
-	ret = ti_csi2rx_init_dma(ctx);
+	ret = ti_csi2rx_init_vb2q(ctx);
 	if (ret)
 		return ret;
 
-	ret = ti_csi2rx_init_vb2q(ctx);
-	if (ret)
-		goto cleanup_dma;
+	return 0;
+}
+
+static int ti_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	int i;
+
+	if (csi->enable_count != 0)
+		return -EBUSY;
+
+	for (i = 0; i < csi->num_ctx; i++)
+		dma_release_channel(csi->ctx[i].dma.chan);
 
 	return 0;
+}
 
-cleanup_dma:
-	dma_release_channel(ctx->dma.chan);
-	return ret;
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	unsigned int ret, i;
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
+static const struct dev_pm_ops ti_csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
+		       NULL)
+};
+
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1563,6 +1595,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 			goto err_ctx;
 	}
 
+	pm_runtime_enable(csi->dev);
+
 	ret = ti_csi2rx_notifier_register(csi);
 	if (ret)
 		goto err_ctx;
@@ -1593,6 +1627,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		pm_runtime_set_suspended(&pdev->dev);
+
 	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
@@ -1600,6 +1637,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1614,6 +1652,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 
-- 
2.34.1


