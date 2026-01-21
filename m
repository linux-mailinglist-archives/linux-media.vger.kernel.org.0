Return-Path: <linux-media+bounces-51254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA0+J7LecGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:12:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2A5832B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 34500A4A832
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C14963A8;
	Wed, 21 Jan 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W5HoXJIS"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB9478E52;
	Wed, 21 Jan 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003723; cv=fail; b=rmmfVKuzaXSCpbUDifd3JNm7JQSQPrJEbqBIpZRslnD7JP1uoMhESSifcP+1UBd6e7VoyfnMcxeexI8p9LZsCVVXlT3bb5+Uvjush9kp6AHJi9x1Ah/31DQoMVjfC/4mAKFRuE+ITn7kRAb00AvAoR/1GsQvMGhA0kymSEqAS+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003723; c=relaxed/simple;
	bh=bPjGW2FSGyZImLCTPHag17ddrCkWncBG9ClmiKcBSdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TU4y8EdRiLSFnatYtNBEj7cExoY8mI4en8aqJ1eniQBs3c81t1bgOEmJiFb1qZGY6RAs4iSL2Rwh66a73a2zJGNjt2BfXwBMWQZ4CZzvLkD35PcT0aEO3snwaUzkrUbLAxDwN3sspUGSwKRKDevvhUksYml/g+zUzFsBBEiEyNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W5HoXJIS; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRLyOQ8U9cAHMEvAiKCcE1NtoVANdA/EpkfaNZb4ppkvojQIMavXwxUkMzdKk2s5FEhZ/c+4sDqTBM0lkmcyWgbHiVWUNz+oKFBaqwjWwuVuevPS1C7RoDRNcGBsC70D80NaG3jONkT1UKga40aPyyR82lVUCll+blEi2jRkgz8U4Zr9SRE9Gi1cE4EF9OSnwkd8y0BYrRt6DnHSydRGkOdeE1h0NaQrlJaosx3uiKT/l+7B5YHmlcFtA+8Ih7cCtjKkkcGULC7ANkNP2evyvEf2E0idggb4LKKKAMLPvxYdf8aa28wrtekG7+pASnHTa+F6kXaTgHLKoYWiqLfnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLII4DjNTn+ffSwex1UOV1cGQuGsPpcs8u0JFcM4XeA=;
 b=iahLuWPjrKvgyS9G4PkWUzLuhogDiQDn5P3rGjKJCwC1szSBVlYuVBsmaRHu9OHxvPQNuQyOivNQFuNVYHlaSd+0w20yfWw5JzsL97/YSMWf9JcjKKnFsnW71p/n6BctyBUhHzhgwrfQNZeJlIIQW3aHXUCoHsq+eP5Y6yr45rl8CG/YM8wpJOaur432BP6jkcf+8qLKeiovONHQZNAXBmWah7B0b6rHKQX/U8uxTL8t5CW8MYUO2DIjRbdfS84cIl7jsndXQfL2A0JLEAVQqfkbflu/y95Vh+OhK4ET8LhHrrQoD9IoY5IK/bAB6EYhQ6boIqmNuBYWuWtyqbyvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLII4DjNTn+ffSwex1UOV1cGQuGsPpcs8u0JFcM4XeA=;
 b=W5HoXJIS9FmTbhnfovI7epszyfHNUOIyNGSWuXLnKdRIEbsBU3XV0n+Er3eglzc/8DDlTQMNfedDu4oUBnj8Cgyey1vMQ8L3TZGG2DXgPgMVBNmtbs3LbBYvCEUH0bbYZvfezmjaLOZvsRiGlo28BUlUtJr0z7Z2LhMWQf74xCg=
Received: from IA1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::11)
 by DM3PPF120DC3FA4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 13:55:17 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::9e) by IA1P220CA0022.outlook.office365.com
 (2603:10b6:208:464::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:55:16 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:15 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:15 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIC3104105;
	Wed, 21 Jan 2026 07:55:08 -0600
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
Subject: [PATCH v10 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
Date: Wed, 21 Jan 2026 19:24:12 +0530
Message-ID: <20260121135424.1185710-7-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|DM3PPF120DC3FA4:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7a5d29-c2f7-4652-50eb-08de58f4b4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QlFooJaJEHNkSJAT1ceWFscpN0QCfel4uI8tni4Gyh3np81BOJwqSjefIPAw?=
 =?us-ascii?Q?NIBP8AgucMZWWmgEWAVn82Cn9qO+PSYoCXGRjPdrKWPfIB0qEn0JSy5y68/1?=
 =?us-ascii?Q?/siuFF8lCy6RFPyoXK40gLYRKrJa2ilSATN5CTH26tCoDzswTJBhjA11aesy?=
 =?us-ascii?Q?PQdMKAT77jw3Osel8xWw04UyW2jMjWPKJ0s0l/vz0XWgNRowFhl6QYsJx8My?=
 =?us-ascii?Q?uIa62MIAPoArh3DhNcZlmn1WWF8+Vz+D/pVaOFaTqp7aAtYU5fKJFcWpZkaP?=
 =?us-ascii?Q?oAl0JOaR4H5p9k9OgZ5920bVLwKyHRrwBnjeSPhk48fu/NAfw7ey5j89yDzS?=
 =?us-ascii?Q?SJL+4OemKqyKmJ1PsGWrW62cWHrEVdYg9TwbpfWpJI0wIfjgSh8C4pF0O5FH?=
 =?us-ascii?Q?RKabvLwERJspYHzqpvrbZe6LquTF4CpoP4JjSWP368qOrMjF659FpVMjCwhL?=
 =?us-ascii?Q?vUGHm21MIynlNMu1SmHzgxFMQBjGaNcmtyNNuqVkHKOHROXzoPE75ce5xXkK?=
 =?us-ascii?Q?HHYW2IhgVpLPSckuMUZte12xZbh/ymDhrl92R4lFmeg4XSRb8jP1Um+t1tYB?=
 =?us-ascii?Q?zSk5uDT+LDsnvRtvCkMr1Qxp9TL1QpJtbv6P3Y8YslT1ZFpLo5VcQo9OrQ4q?=
 =?us-ascii?Q?Y2HXmX5xRuN63edJEQj6UnMQwHn06kkYDBrigBGo9y6v9jlZr6f3bRGxu3XV?=
 =?us-ascii?Q?g5G7N5E1oqMnLUK3CESt4NtTaQso83CFtWGCHzUE6yxBofquftZkZI+Px+J+?=
 =?us-ascii?Q?KYZM/dsAHWSYWweTL6+NruLtTUHlEN5UGldPUoKrlKETh77GrviY1PPkTi/V?=
 =?us-ascii?Q?8lmJ7fQe2IfkiXeBavc0WK1V3tYNS7viSl2k4VA3moSGYf03PLJSEcNwl1q5?=
 =?us-ascii?Q?PSrMyCZPq4ozrpC1SmaQ6mEI9vtHBdr05GakU5Kioc/+MrwvlyQc/R+21A5c?=
 =?us-ascii?Q?XQq9EBY+1XWcuZEuBQ72BO1yUKBwxsYBnh2rKbJ6i9nBky5wPeecZX3a7az/?=
 =?us-ascii?Q?JhsmycjnRbiUiKeCe9aqN9+2aMe1PV8LSX6DPjQVri3ALhSPFI5gStQtZVtD?=
 =?us-ascii?Q?nWGg430+k9dgSZ+0GjLZeVZH+AyOy1WXsMwXBUJNTtp9m9meVSTnnbr7XojD?=
 =?us-ascii?Q?w0gPJ6OiOeLkgwbelyCdzeG6mQ0OUwI5xJ38pXJdR3/YUHI0KKupgEqcyCns?=
 =?us-ascii?Q?Yw4hicLHJquUzukY5/3Ulm8LuBrIsAJNyYzB69ARL4WjBtu92wTG8on3jzZi?=
 =?us-ascii?Q?0m4hKp5RDzgnLqC2LnuQnRDthBrPlHRanwo8uYDkZFlavtzj0ubQ64wdkWtc?=
 =?us-ascii?Q?DBKHA9+T1VCoeuqzm6HhhoqN7jMIHGczYFQEYoZyjj81ocF7M6hd2rDD8Jbx?=
 =?us-ascii?Q?xG54N3N00+7INdgoTBozQLampKY2RP2xWuT8M2Xchyp8ZoUapUzgoCi67dfD?=
 =?us-ascii?Q?622ipkyMn/oAICkh8r5343vzTdtiCe+/GQayfi6cpX7lXQy7dpVKIjpbxkN7?=
 =?us-ascii?Q?XUOu3p5WAk3HVm3t5VBjnCok7yKT3Ubv9gPeiysiZcfhEbfAGhZ4QYC506jY?=
 =?us-ascii?Q?BbBefXh1JENu5i6pEOziiXDlliTLGiykz52XlEzvXG5xfgHTvUICanSjFHBE?=
 =?us-ascii?Q?Zbdtwtwcr5SMg6A09GmbZdSCzPaFy3iddAjUqmMRtMBdcMAzuHDXXRZIhmgl?=
 =?us-ascii?Q?Yt39uA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:16.0152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7a5d29-c2f7-4652-50eb-08de58f4b4c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF120DC3FA4
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
	TAGGED_FROM(0.00)[bounces-51254-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ti.com:email,ti.com:dkim,ti.com:mid];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4BB2A5832B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

With single stream capture, it was simpler to use the video device as
the media entity representing the main TI CSI2RX device. Now with multi
stream capture coming into the picture, the model has shifted to each
video device having a link to the main device's subdev. The routing
would then be set on this subdev.

Add this subdev, link each context to this subdev's entity and link the
subdev's entity to the source. Also add an array of media pads. It will
have one sink pad and source pads equal to the number of contexts.

Support the new enable_stream()/disable_stream() APIs in the subdev
instead of s_stream() hook.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 287 +++++++++++++++---
 1 file changed, 243 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index f66d68edcd57a..8e1da5d3e11b6 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -54,6 +54,11 @@
 #define MAX_WIDTH_BYTES			SZ_16K
 #define MAX_HEIGHT_LINES		SZ_16K
 
+#define TI_CSI2RX_PAD_SINK		0
+#define TI_CSI2RX_PAD_FIRST_SOURCE	1
+#define TI_CSI2RX_NUM_SOURCE_PADS	1
+#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
@@ -102,6 +107,7 @@ struct ti_csi2rx_ctx {
 	struct mutex			mutex; /* To serialize ioctls. */
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
+	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
 };
@@ -109,12 +115,14 @@ struct ti_csi2rx_ctx {
 struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
+	unsigned int			enable_count;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pad;
+	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
+	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
@@ -125,6 +133,22 @@ struct ti_csi2rx_dev {
 	} drain;
 };
 
+static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ti_csi2rx_dev, subdev);
+}
+
+static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
+	.width = 640,
+	.height = 480,
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_SRGB,
+};
+
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -422,6 +446,18 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
 	int ret, i;
 
+	/* Create link from source to subdev */
+	ret = media_create_pad_link(&csi->source->entity,
+				    CSI2RX_BRIDGE_SOURCE_PAD,
+				    &csi->subdev.entity,
+				    TI_CSI2RX_PAD_SINK,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+
+	if (ret)
+		return ret;
+
+	/* Create and link video nodes for all DMA contexts */
 	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
@@ -429,15 +465,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (ret)
 			goto unregister_dev;
-	}
 
-	ret = media_create_pad_link(&csi->source->entity,
-				    CSI2RX_BRIDGE_SOURCE_PAD,
-				    &csi->ctx[0].vdev.entity, csi->pad.index,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		goto unregister_dev;
+		ret = media_create_pad_link(&csi->subdev.entity,
+					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					    &vdev->entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			video_unregister_device(vdev);
+			goto unregister_dev;
+		}
+	}
 
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret)
@@ -447,8 +485,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 
 unregister_dev:
 	i--;
-	for (; i >= 0; i--)
+	for (; i >= 0; i--) {
+		media_entity_remove_links(&csi->ctx[i].vdev.entity);
 		video_unregister_device(&csi->ctx[i].vdev);
+	}
 	return ret;
 }
 
@@ -493,14 +533,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 }
 
 /* Request maximum possible pixels per clock from the bridge */
-static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
+static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 {
-	struct ti_csi2rx_dev *csi = ctx->csi;
 	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
 	struct media_pad *pad;
 	int ret;
 
-	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
+	pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (IS_ERR(pad))
 		return;
 
@@ -526,7 +565,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	writel(reg, csi->shim + SHIM_CNTL);
 
 	/* Negotiate pixel count from the source */
-	ti_csi2rx_request_max_ppc(ctx);
+	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
@@ -881,7 +920,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(&csi->subdev,
+					 TI_CSI2RX_PAD_FIRST_SOURCE,
+					 BIT_U64(0));
 	if (ret)
 		goto err_dma;
 
@@ -909,7 +950,9 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	ret = v4l2_subdev_disable_streams(&csi->subdev,
+					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -925,8 +968,121 @@ static const struct vb2_ops csi_vb2_qops = {
 	.stop_streaming = ti_csi2rx_stop_streaming,
 };
 
+static int ti_csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >= ARRAY_SIZE(ti_csi2rx_formats))
+		return -EINVAL;
+
+	code_enum->code = ti_csi2rx_formats[code_enum->index].code;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	/* No transcoding, don't allow setting source fmt */
+	if (format->pad > TI_CSI2RX_PAD_SINK)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	if (!find_format_by_code(format->format.code))
+		format->format.code = ti_csi2rx_formats[0].code;
+
+	format->format.field = V4L2_FIELD_NONE;
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
+					   format->stream);
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
+	*fmt = ti_csi2rx_default_fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
+	*fmt = ti_csi2rx_default_fmt;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	int ret = 0;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
+					 BIT_U64(0));
+	if (ret)
+		return ret;
+
+	csi->enable_count++;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	int ret = 0;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+
+	if (csi->enable_count == 0)
+		return -EINVAL;
+
+	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
+					  BIT_U64(0));
+	if (!ret)
+		--csi->enable_count;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
+	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ti_csi2rx_sd_set_fmt,
+	.enable_streams = ti_csi2rx_sd_enable_streams,
+	.disable_streams = ti_csi2rx_sd_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
+	.pad = &ti_csi2rx_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
+	.init_state = ti_csi2rx_sd_init_state,
+};
+
 static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 {
+	v4l2_subdev_cleanup(&csi->subdev);
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
@@ -981,48 +1137,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
-	struct v4l2_subdev_format source_fmt = {
-		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad	= link->source->index,
-	};
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	const struct ti_csi2rx_fmt *ti_fmt;
-	int ret;
 
-	ret = v4l2_subdev_call_state_active(csi->source, pad,
-					    get_fmt, &source_fmt);
-	if (ret)
-		return ret;
+	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
+	format = v4l2_subdev_state_get_format(state, link->source->index, 0);
+	v4l2_subdev_unlock_state(state);
 
-	if (source_fmt.format.width != csi_fmt->width) {
+	if (!format) {
+		dev_dbg(csi->dev,
+			"Skipping validation as no format present on \"%s\":%u:0\n",
+			link->source->entity->name, link->source->index);
+		return 0;
+	}
+
+	if (format->width != csi_fmt->width) {
 		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
-			source_fmt.format.width, csi_fmt->width);
+			format->width, csi_fmt->width);
 		return -EPIPE;
 	}
 
-	if (source_fmt.format.height != csi_fmt->height) {
+	if (format->height != csi_fmt->height) {
 		dev_dbg(csi->dev, "Height does not match (source %u, sink %u)\n",
-			source_fmt.format.height, csi_fmt->height);
+			format->height, csi_fmt->height);
 		return -EPIPE;
 	}
 
-	if (source_fmt.format.field != csi_fmt->field &&
+	if (format->field != csi_fmt->field &&
 	    csi_fmt->field != V4L2_FIELD_NONE) {
 		dev_dbg(csi->dev, "Field does not match (source %u, sink %u)\n",
-			source_fmt.format.field, csi_fmt->field);
+			format->field, csi_fmt->field);
 		return -EPIPE;
 	}
 
-	ti_fmt = find_format_by_code(source_fmt.format.code);
+	ti_fmt = find_format_by_code(format->code);
 	if (!ti_fmt) {
 		dev_dbg(csi->dev, "Media bus format 0x%x not supported\n",
-			source_fmt.format.code);
+			format->code);
 		return -EPIPE;
 	}
 
 	if (ti_fmt->fourcc != csi_fmt->pixelformat) {
 		dev_dbg(csi->dev,
-			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
-			ti_fmt->fourcc, csi_fmt->pixelformat);
+			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
+			link->source->entity->name, link->source->index,
+			&ti_fmt->fourcc, &csi_fmt->pixelformat);
 		return -EPIPE;
 	}
 
@@ -1033,6 +1193,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
+static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct dma_slave_config cfg = {
@@ -1058,6 +1222,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
+	struct v4l2_subdev *sd = &csi->subdev;
 	int ret;
 
 	mdev->dev = csi->dev;
@@ -1070,16 +1235,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
 	if (ret)
-		return ret;
+		goto cleanup_media;
 
 	ret = media_device_register(mdev);
-	if (ret) {
-		v4l2_device_unregister(&csi->v4l2_dev);
-		media_device_cleanup(mdev);
-		return ret;
-	}
+	if (ret)
+		goto unregister_v4l2;
+
+	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
+	sd->internal_ops = &ti_csi2rx_internal_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
+	sd->dev = csi->dev;
+	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
+
+	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
+	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
+	     i < TI_CSI2RX_NUM_PADS; i++)
+		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+				     csi->pads);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_device_register_subdev(&csi->v4l2_dev, sd);
+	if (ret)
+		goto cleanup_subdev;
 
 	return 0;
+
+cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+unregister_media:
+	media_device_unregister(mdev);
+unregister_v4l2:
+	v4l2_device_unregister(&csi->v4l2_dev);
+cleanup_media:
+	media_device_cleanup(mdev);
+
+	return ret;
 }
 
 static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
@@ -1106,9 +1306,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
-	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
-	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
+	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
 	if (ret)
 		return ret;
 
@@ -1216,7 +1416,6 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 
 	ti_csi2rx_cleanup_notifier(csi);
 	ti_csi2rx_cleanup_v4l2(csi);
-
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 }
-- 
2.34.1


