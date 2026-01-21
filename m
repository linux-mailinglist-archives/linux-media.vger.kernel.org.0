Return-Path: <linux-media+bounces-51249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKmXO3LfcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:15:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75988583B4
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E67B5A47E73
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1CE48B387;
	Wed, 21 Jan 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aa98BFor"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA248C8BA;
	Wed, 21 Jan 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003691; cv=fail; b=GguCzcpqmlc7valEI3dukLxFynhqmAVis6Vy+DxDTd1bPYT75IiV44g+F+l11Pb0+KK3AQBcHsSsRPxJB++iiwr4f9Rt5O+gzbR9MTa5JpEIsmcCHId5ntDhOLLGKFZrHu6Bk6cDN7vfLL74JC7seZEgkUxDZ2EMYV0CyKNO+Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003691; c=relaxed/simple;
	bh=u8b4MfIRq4LyNu21j/SiQF7ET4XUYywxe61kp26gAdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cE91Co3I7VlpD9ExIdmZUzZ/lHUpIiyObRP+Fcrxk4wtHRkH+RspChkPxlIXEFXRAALFi6cYnjp/0emqeKQds5CmF1xGAx+To6bn/yYBskiLILe2NXFp80644Es6+aSO4j4xU/ETMIDns/njFYTqrr7qSnYi4g77PoyMnES4WUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aa98BFor; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w834ehQJEz0O3qbXGKDIWIkOQWinfuZji/EvdbN5tEVZI33qSN54zKVYtjjyhey5XmFdvbl+NWpq6tb3bvaAFJJ0Cg0Fmskmeot6U9UChVf65CAKw2H8xynFmx4DfgUOYZLCJVTfoasViHi7CCrJnijjxIr2eaUH3+gkLc5TLcHWgLqSj9OoFYhpEH+zTANJ3Ah16QI6++Mptr7I7omMPTNGXXwy8Zrhoc/5d0Qq68h8Xn0ZwoQbRLylfzqg87c2qiIQcxfFM+uIGGH4tUEl6scsBmw6sFmyLrvGN9z6/wIYTr+h9jaK2DzZvuXPhYzrjtlfUGg5rc40SZsYySuybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYXYTgGde7ltf/08jScCgV0DRV/+RS2VHZtsmTT0uzY=;
 b=vYeQHiS6Nskuaxq47UldJkeushc3rNM+YVsGFRooD3kj/fOAdUai0d4M//Vx4JQ+PJs8i8YXojoyLpIhB/KgxGbIuEqu6W3pZ/sN6PN4SOgzj//9GivIROdfy62hbLkPRXMyc7isfrY3gv7a098W1VHaq8SI/50y7vpV8h2EOfvrj3zH2yuwE5xuHbnwS/sEAOggILrBskBCqAa9zYMNlSVpWlpxcoQ4p9x8Ue8v5z0po36+NKr+Sw8Zf7pivHH4SL9BLEvjfgCYAR43G0vxB69EuPEWpq0fuQGWydgUkUQ94dwpocXvb255ZcVQcUsVOCWSdH+PTqnOHY0NG9Mz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYXYTgGde7ltf/08jScCgV0DRV/+RS2VHZtsmTT0uzY=;
 b=aa98BForEhk35kCo2VvoDk9cvy+mqz1HvbkdzcPRQvUKzRWTtxcv4Y4OfOH8JHcr3OxO8TeOKfu5kL5cnX3WLQ/hGQsYLSHZLT9E2uASFNoQfYhusZjtS1N7UvPUOW/NaW+lPY+GplAjx2ZzK1yvXjO/rKf5nouBVTc7fVFabfE=
Received: from IA1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::6)
 by CY5PR10MB6070.namprd10.prod.outlook.com (2603:10b6:930:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:54:42 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::f0) by IA1P220CA0019.outlook.office365.com
 (2603:10b6:208:464::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:54:40 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:54:39 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:54:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:54:39 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPI73104105;
	Wed, 21 Jan 2026 07:54:32 -0600
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
Subject: [PATCH v10 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
Date: Wed, 21 Jan 2026 19:24:07 +0530
Message-ID: <20260121135424.1185710-2-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|CY5PR10MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: f98756f9-c36c-40e7-4948-08de58f49f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGf2BDOAlgIoIfCLR7wm/mXGKEBrBoagPTc5bRYuclmzlUaaOb/dgKKanHz9?=
 =?us-ascii?Q?8W2LZ3A8IFWLCu5MTmjEVZFmopWXft9xuZYqlT+lVY+nBjJ7k8wqmYYS2dkn?=
 =?us-ascii?Q?9V09ay8ze658SxGqgd8sybPForyLZv65j34Wz0xgBLR5+bUzCqGCl6L3UrnJ?=
 =?us-ascii?Q?cS8fGIUwI+aXBSCXGVt3XmEXbqkEkXJvZhCUZPM1qbAg5ZdPO5k9lFqTMSRO?=
 =?us-ascii?Q?Lmh01kAUc967fV3eeOQ8+wj6qJIuoBwdGYPptDR/DcVwkhBmD2tRO4XTAaNR?=
 =?us-ascii?Q?SOt0urLpwDDVL7qZy8huFYQUnmrYKycRcVKoekYhxPJLaH8zasPRlDchzlFN?=
 =?us-ascii?Q?rTdqH13I0UKA/iyuyspdcQH/OUm/xOHM2Fqik0QnHyed5Nmqzz4k6re11sL3?=
 =?us-ascii?Q?N/LtwMy5pwyEH27bmbFYC9zfLJuWTPTXwEwLB7vlHQV+l4JrDULwn5htq8tL?=
 =?us-ascii?Q?1UqRtIqZD7lSKJkNbo30CQ4d60CowHxqrEsnnNUg0Ksu09BBbdpUHETVCM3V?=
 =?us-ascii?Q?CUTruy93NE1YvI3KQV0Z3CEAXL5o3u5y4CtEUHDHqDwj+BubA7qMUc5Wj7A/?=
 =?us-ascii?Q?5fD/LW9flUPvNxxr2uJ9JiuUMtBl0/IVIQi5QIzNGtCSi6tsIwBZa11VPc+n?=
 =?us-ascii?Q?zO7qiVE5gVVqBuBV+XO9Xi4wD+oIUA7rE3pPX9UNd7JhOQMJLoQGdwZwAG7+?=
 =?us-ascii?Q?f9cglSyWQzD9HvbQIZB3ZilKb1ySstQyHhSgsy+vjhjvngstzCbTu1hhJi5F?=
 =?us-ascii?Q?+WNA99bTbp/7vlY7v96Z4vXd5X+DC6nZny2MIYMHV6OxRYBpzO6j6liTGG3c?=
 =?us-ascii?Q?9ou3tUHVe7DNX9hJ8SHmWSxWcH2IRYCaiujVJZVSSDQjhebJWrQCa7I33lzl?=
 =?us-ascii?Q?zknldenoznbX2W/Xk2sK11weLnJjLEu0g5jPRLIss8joVgDsvhjvVMK7mLO6?=
 =?us-ascii?Q?m/oX9/lkVEt7bAksXpwcDTfVYF1xUrD8HyJHIMInC3m69Ayi5uyLy9Wvi/E+?=
 =?us-ascii?Q?VheKTKWI2DapYbEAmQ4dZpF1B5KPfOmYuxFNKQZpPa7JUqr6wioRZFsQY6pi?=
 =?us-ascii?Q?QD4KS130fc3kAMZXLe62j3vdDCFEDjo06v1h8i7YSU2t055uD4+6F0Fm48Ez?=
 =?us-ascii?Q?tOsfxEbVZmqht2hxfeIsHWwIK7W6+fZAp9KMJk0VS5tkYr0vEOsZZSco3px/?=
 =?us-ascii?Q?Yw1LnRnCmbDN8UeLYEfR7bmR9vm7UkUUEEamUwt+XrZ/FeH7Vt7EA3ZxeQCZ?=
 =?us-ascii?Q?NIprbeaTNGbHOBOvOV78Ko7ImrB5+dQIx+fqj3/P8rt9PVreSDQ9woKqUbE7?=
 =?us-ascii?Q?AaBOZxfl9ixBscMsITFb+FpMgamhSzjRNfP2en6ai1j8Tqis04meLKXWpQtv?=
 =?us-ascii?Q?I5NdTnJ5xvfjLPPiHf7u6DwMkQd/0g19/oL9Dk05EAsD+nhsb2d0OLfi+6ur?=
 =?us-ascii?Q?4/Xt+dqAWshllNS5kYOie1MDnctA0IwQzS2uzHWYnkcUyESI0k2xAzU4pggK?=
 =?us-ascii?Q?dBk5yeGohOuGZ9alKBiqlExGQzKSVJ31XPDqsh7ENM+boG8eGzdXHmKNXdPL?=
 =?us-ascii?Q?+yYYhcvjSosCCID/ixWNAm9rpv2rLklaUBhOK/RLbXMhAdl5hgcsRUH7aPcD?=
 =?us-ascii?Q?zjSJq+C+FuniJhXTWO5xgL4gTBJT1U/B1KFXRGCBndO0qQnrtOu2/BVaL5ae?=
 =?us-ascii?Q?Hadx3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:54:40.1861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f98756f9-c36c-40e7-4948-08de58f49f6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6070
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
	TAGGED_FROM(0.00)[bounces-51249-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ti.com:email,ti.com:dkim,ti.com:mid,ti.com:url];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 75988583B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

j721e-csi2rx driver has a limitation of frame width being a multiple
word size. However, there is no such limitation imposed by the
hardware [1].

Remove this limitation from the driver.

Link: https://www.ti.com/lit/pdf/spruj16
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf2..710d05a053539 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -43,7 +43,6 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
-#define PSIL_WORD_SIZE_BYTES		16
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
  * all sizes. The max width and height are arbitrary numbers for this driver.
@@ -250,19 +249,12 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
 			       struct v4l2_format *v4l2_fmt)
 {
 	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
-	unsigned int pixels_in_word;
-
-	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / csi_fmt->bpp;
 
 	/* Clamp width and height to sensible maximums (16K x 16K) */
 	pix->width = clamp_t(unsigned int, pix->width,
-			     pixels_in_word,
-			     MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
+			     1, MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
 	pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
 
-	/* Width should be a multiple of transfer word-size */
-	pix->width = rounddown(pix->width, pixels_in_word);
-
 	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	pix->pixelformat = csi_fmt->fourcc;
 	pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
@@ -360,23 +352,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	const struct ti_csi2rx_fmt *fmt;
-	unsigned int pixels_in_word;
 
 	fmt = find_format_by_fourcc(fsize->pixel_format);
 	if (!fmt || fsize->index != 0)
 		return -EINVAL;
 
-	/*
-	 * Number of pixels in one PSI-L word. The transfer happens in multiples
-	 * of PSI-L word sizes.
-	 */
-	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
-
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise.min_width = pixels_in_word;
-	fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
-					      pixels_in_word);
-	fsize->stepwise.step_width = pixels_in_word;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
+	fsize->stepwise.step_width = 1;
 	fsize->stepwise.min_height = 1;
 	fsize->stepwise.max_height = MAX_HEIGHT_LINES;
 	fsize->stepwise.step_height = 1;
-- 
2.34.1


