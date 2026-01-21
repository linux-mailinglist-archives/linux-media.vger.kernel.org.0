Return-Path: <linux-media+bounces-51256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOHTK43gcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:19:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8758523
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13B38720577
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A644968F6;
	Wed, 21 Jan 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cqmtwEsB"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989074963DC;
	Wed, 21 Jan 2026 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003735; cv=fail; b=N62ClCfqFEpGRpnVLZkpn6d9uVFewX54rUbduxbi1z8DwLN2/2ICNt/uLAu+DfbpH1VyzTpF3gNIaHcgLv8UFvWtRTh8KSaul1feSu7YCDueru72k+dGdQZx+f6m1hhR2OTPGc/WTHqhHQKK7r0KLvjwGGdHoJ5qOl1UFHS3mWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003735; c=relaxed/simple;
	bh=5WxgwShzBDFN4NeXnY000poizPf2PZQgstvnKXIg8WU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVm6QXe/Niru10OwHWtJXmPSoRImqNvUOv9Hz/VjFEkw9NH27KvA+pw82DoInTzoAlX3GKCaKdXnFLS4LvqKs9YHqCgcb6rXATwRX44NIQsb1ObRtjThyghd4/PGAFQ6Ydwd0ubRqSU7nJiXco7qZ5l+0Ewb9YYVQ9E86Y7J290=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cqmtwEsB; arc=fail smtp.client-ip=52.101.62.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f35zqrvDqm3foEoquzNro1xRMZjBh8n/JmxPNeF6bXfgY6MNeIDeZd06WUekKKx1NIQiRaTSCrp5o/w7c8SYCmGph3vPxw86LxXgo9k7NSFLoIEQqK6q0Exw15wd58BzHfuIb2DN9pYj1hGcNMxcQQE67p8v/MWywlstAtaorjPdco3ScwGxHZkvZbcxjM8fsEq1ijH05zpPVgwhuBYU1EctyktCdgqfek3/THahacct6TkNTXCoW+pB4ntXbZIFnls4BupvXoZY/PtxL5Fteay6PVxIe9aZWWguB5vGgkP9Ksx0HuGCVTz3rutbkxGibYtRFbbDvSzG92UHycKoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoFv2Gj9j7UCPGt/pr7u/AHRrjuKkIRly9huy0dMzOI=;
 b=tQ6JfKCZjVTKy8+n7Gs6DRnB0oJG49YGaW3uJU+NSKCyzulF8VlQTL1HOutOSHFmYJfAm4YyTG5iVQ+j6wtv6QJyN5twq75qcOnKuOeBFb+wxyXDxUwJuKABgF9xNDPe2sY/Q1OvyvmIZwNKR9NiQzfS5a+r33N/ea191nK/l2gu5exnagekRp+WUux9cmahEsDWGeflidyouQlaCHMMPzz3ah7EDUJ1AzYFO/Y8+ISkn/fVYxgV8OzWBgvdy8wZL9Qro+fgYGEVXtDsO1m88UwrnphDjqI1st6dhBVNF+2cIscb2rbMhqCvPd81sdx81AjWCXvzPWMo1yAJowlxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoFv2Gj9j7UCPGt/pr7u/AHRrjuKkIRly9huy0dMzOI=;
 b=cqmtwEsBOaAzoq367oc18q+OiVUfwTJ5pYFH5ICcIMuIDQnTiZY0NV1bv2I83o+EElbvkW+ZceUN2kjQtpNSps39kRF781XHFPbGFHRFx5q16zxyZ01vlFHoJH2iNvwiqYTPYA+jPqjEbhgruupG5F+or4Y9syCQ02R7l1K7rj4=
Received: from SJ0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:a03:39e::23)
 by CY8PR10MB6778.namprd10.prod.outlook.com (2603:10b6:930:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:55:30 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4f) by SJ0PR03CA0288.outlook.office365.com
 (2603:10b6:a03:39e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:55:30 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:29 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:29 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIE3104105;
	Wed, 21 Jan 2026 07:55:22 -0600
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
Subject: [PATCH v10 08/18] media: ti: j721e-csi2rx: get number of contexts from device tree
Date: Wed, 21 Jan 2026 19:24:14 +0530
Message-ID: <20260121135424.1185710-9-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CY8PR10MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: e75970ca-40b6-4455-4e23-08de58f4bd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rnSVbRS2wMcR1SpI2GPALkl2U3MPevCl2Riq1bjroxEDv78r1ZPL1r+Ovy6A?=
 =?us-ascii?Q?IsuZvIwoTc2VtNEVa55ik19WfRTIvaHRRjtZApeYBakBUsvQpwB83Ywa9W45?=
 =?us-ascii?Q?Pd74g2b82dDWgwMEovCrUKt7SCauWo/pEubf5s3l9wxBGx/dj1B4j3tI9ite?=
 =?us-ascii?Q?d8EfGLFAkrWIyWgqWkDfLFmGJ7jyngO/3wsAJbVLc1Gr5iJ+L/7mQVRLDiOH?=
 =?us-ascii?Q?eLYdpRTJ1jqXFgneLY5KqBz5sGLL2TI4/ElfaRHrif18DPYhqY3GtkrQG2aW?=
 =?us-ascii?Q?cnI/je0zlKE7yMgXOdts1jQ6vMVNgvK0ZsRpxdpIPIyHLed9R82qrqTV4a4l?=
 =?us-ascii?Q?fFo9EPnwEs3Y+Ew99ZQmORZQEz9faeANhrXEqIsCCS3ewgSt+8WO8/roeK1O?=
 =?us-ascii?Q?F9dmnRI18xCRJkyMQIgZPSUxtxPKsUMYp5qDaLIm3jUQfBd9M/Rs9ZXu3ddh?=
 =?us-ascii?Q?XMYJXpgSUNuNlKzxZpk+JiKnlCJPsJIUIb0TI3XmZtzc+TvA+ZxGaDUZ+UF9?=
 =?us-ascii?Q?gH6jDvKkwKnyUvlANrYiQdHJe+u3ncr7fmsF7P5ave6DDUSEfO0k68JsXbg9?=
 =?us-ascii?Q?sVDZkYmUn0g0gqMRwJ77efbiwS3kYHmlkiyCeCW2wOzxC2zLlq7Tl8ZDp+j/?=
 =?us-ascii?Q?xjkqChIEYZ5Zd/767qfuAhIC4WtM9eHIhzaj/C/QwcJLoO7s/A2WKe/pjCG9?=
 =?us-ascii?Q?/bLlvYAIOZKJFXnGm/8AcGjQ9EDfKzidgRKFMzRdHZobP2qRC5ijTqxvzyFX?=
 =?us-ascii?Q?+SSwq6qzZnlV4rGBqSQWTKxzdupRTH3Dd+9voEWGPGjHqdBjoka58PHldiWy?=
 =?us-ascii?Q?9jJVzkMwrS+zRTBT0kzj7heSNnVGhFPqiXt7YtxVztXPBSYf+WXffm+EgCIQ?=
 =?us-ascii?Q?G5qa8FBJmhzlfZIBtMsM008d25uQcY2JSl3M5aFztrxc4jkGERv9b0IfCVQC?=
 =?us-ascii?Q?mR86sHfor7mRxve/9R2uoLgdvu8bsdy0pENKSegbPMdhM36en2IkmioE3alq?=
 =?us-ascii?Q?qpFUe/Z30txjsl9C3v2yw0ypymBHAizYx8AXsuu375SNMKrRmEEywYFv+XYG?=
 =?us-ascii?Q?gRAPwEVZLzHamIPYHUqNVj/dkaAcK4UIG4SVBNb2fcrc24V9LfYFCXXWImIX?=
 =?us-ascii?Q?MGgh/G8FgpQmANtcKgKKjtrWkirddgpFqUElNC933yv+j8jCamoHutNV8fzT?=
 =?us-ascii?Q?bsozL/vgLho8FRXDi2vviDjR4F38n/rbVl2VCXRi1le/k+CUgDxocWlPwd5F?=
 =?us-ascii?Q?bwgJK1SNwE0GViT5Vadm5qRKUvq36UyyTexvMhoyLCHmD1TNqy4e4ycN5vch?=
 =?us-ascii?Q?tA1ApzOdOJeOIzuDV+HBXa/JvGkK1pAJDg3+DXVg/9jB4LCJdJqO0ApFag5R?=
 =?us-ascii?Q?3zG+P91jFnjDDWBUkBKqCi93+hX485nKQSXzTvhFrXrXg7kj+yJxsHVUuF3g?=
 =?us-ascii?Q?pfOBzsjTu34h6lzq94Ku8y8nhKIaiAyfKEbmgGwuz7bOHhPA24BGD+cugB7R?=
 =?us-ascii?Q?VDKpM6f+n9Kv0HJEBRYPp+c7jvoNFVCgsNBteP8jZ91dApfNenPetrDxV10p?=
 =?us-ascii?Q?lzYPdDx2SXwtQUW7amnhWH4LACfqSIkwtvTnRNG0Ex3Jv+/nraH5rlwRC2lx?=
 =?us-ascii?Q?KpEx5p1oaNq2HvxqvvP3sSrXP2E45dOw5CNxFVjeRvd8n3x37sOaolBU0AgM?=
 =?us-ascii?Q?2sx25g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:30.2828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e75970ca-40b6-4455-4e23-08de58f4bd49
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6778
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
	TAGGED_FROM(0.00)[bounces-51256-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:dkim,ti.com:mid,ideasonboard.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4FB8758523
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

Different platforms that use this driver might have different number of
DMA channels allocated for CSI. So only as many DMA contexts can be used
as the number of DMA channels available. Get the number of channels
provided via device tree and only configure that many contexts, and
hence only that many pads.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 8e1da5d3e11b6..aa038d1badc07 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -43,7 +43,7 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
-#define TI_CSI2RX_NUM_CTX		1
+#define TI_CSI2RX_MAX_CTX		32
 
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -56,8 +56,8 @@
 
 #define TI_CSI2RX_PAD_SINK		0
 #define TI_CSI2RX_PAD_FIRST_SOURCE	1
-#define TI_CSI2RX_NUM_SOURCE_PADS	1
-#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
+#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
@@ -116,14 +116,15 @@ struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
 	unsigned int			enable_count;
+	unsigned int			num_ctx;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
+	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
-	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
+	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -458,7 +459,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 
 	/* Create and link video nodes for all DMA contexts */
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
 
@@ -1252,10 +1253,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 
 	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
-	     i < TI_CSI2RX_NUM_PADS; i++)
+	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
 		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+	ret = media_entity_pads_init(&sd->entity,
+				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
 				     csi->pads);
 	if (ret)
 		goto unregister_media;
@@ -1346,8 +1348,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct ti_csi2rx_dev *csi;
-	int ret, i;
+	int ret = 0, i, count;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1369,11 +1372,28 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	/* Only use as many contexts as the number of DMA channels allocated. */
+	count = of_property_count_strings(np, "dma-names");
+	if (count < 0) {
+		dev_err(csi->dev, "Failed to get DMA channel count: %d\n", count);
+		ret = count;
+		goto err_dma_chan;
+	}
+
+	csi->num_ctx = count;
+	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
+		dev_err(csi->dev,
+			"%u DMA channels passed. Maximum is %u.\n",
+			csi->num_ctx, TI_CSI2RX_MAX_CTX);
+		ret = -EINVAL;
+		goto err_dma_chan;
+	}
+
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
-		goto err_v4l2;
+		goto err_dma_chan;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		csi->ctx[i].idx = i;
 		csi->ctx[i].csi = csi;
 		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
@@ -1400,7 +1420,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	for (; i >= 0; i--)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
-err_v4l2:
+err_dma_chan:
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1411,7 +1431,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
-- 
2.34.1


