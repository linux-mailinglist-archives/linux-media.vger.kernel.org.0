Return-Path: <linux-media+bounces-49669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 142EACE90B4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FC93303038C
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAFF306491;
	Tue, 30 Dec 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YZQSY0Ke"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E5302742;
	Tue, 30 Dec 2025 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083565; cv=fail; b=EM/Ckz3A2B2QCEwPxwVPVBdZRhJruS+oTM/ICtu1euA0CNpndmcdFP5s7qVgFZizun59qnVJmu36qfYGNzm7K2eCE2TEKkrXy4uX0l1BQmOyUq8HfTTG+4QLqjj0LlWRUjNMOn2zJj4EOd/3+Ll0AcfFMvf/gmf3ekrDyCrlYns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083565; c=relaxed/simple;
	bh=u8b4MfIRq4LyNu21j/SiQF7ET4XUYywxe61kp26gAdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGkJQNWIl4Zsr0D5SF2CsRwqJ/OAuYSvZZ6wcrNJKfB2W5YtMqhggOgx7edEFfMw3yYBB0TEfE9F6uMgtAoUVXuOlM46Bd5TIxkkcUCPoqID/8KwD0LUhb6sbiMpRQ8xoQ7ahwOqMZfx6wrmz61SAkc9k62VlJRzW3JMu4U7gmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YZQSY0Ke; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMBJ7Ag729rpaWEXT/KeAgtF1o8CEfOaMZLCBTCm79fkG/3ccGZr2AF9+Dozy9c5Xq505EUtVnk1QocnkFl8YcCXMZHUrnHhBvd2IIwYrBwwej1XvNcKitfx1fuuLrcdNn03Uj3swgUAGVzuqhL60GfHlLZmY0/q3JYRdfc4GKC9ha3YfEsi/PQMQ3IgmT7WCmUI1PACtvjGIlLK08gNWJkDnybIrWQY4HEAekqOTx+U9RpheCLvMHspFQCtTbCJ2Le9w5YVBjgtGrYxtW/t8spYBRaL80bUj/Br9gEnONRYKJKUZcXqUugHed9H1giWz/c9UYwx30gH36tjsxBe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYXYTgGde7ltf/08jScCgV0DRV/+RS2VHZtsmTT0uzY=;
 b=hkzXNxsjnc5Dm1buhes1RhEwHFf3p6n92FeUGOsRRk9hYi7KANXot0YgDkdKYHr4r61vg4iWnD1g5Jvk6zHyUYml9WO6DCKt4xXBwbz/oNU6oqwZ96/S7pFN7Dp/fS2j2IAQBjS6O8fbmVbdMqri90k0pDBZPFsphkD6GRtWaxSCBuJwHbqSmoCABA17vKqcMpUBUo6935DWPqvD2BxR9pDENPFDvDNd9+3cJ+UnvlMXBeR6X05Ms/bXH/3Bx3Tqrmk0dI23/G9PzCSranqSf18dtBfviFflkGAO0afmteRbtYxFO9tiaJIdA1RCdGdu9/lkIa8XHXJrMyTph5C3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYXYTgGde7ltf/08jScCgV0DRV/+RS2VHZtsmTT0uzY=;
 b=YZQSY0KekcU8XquzSItn5fDblcJXZbQtuAhVInSHx65cXqI8WB8q/CQF4s9jjqNaDCRSMhPxBYHu+H8+vRFC8okfTiBHeOHd60fshzR+MO+MQazSdB0jqga7um2dEXiZU43EBY9paw0oJGuyDpGQyJSCth33P2n45BZo4cb6pOE=
Received: from MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::18)
 by PH8PR10MB6357.namprd10.prod.outlook.com (2603:10b6:510:1bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:32:39 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::44) by MW4P223CA0013.outlook.office365.com
 (2603:10b6:303:80::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:32:39 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:35 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:32:34 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9U579464;
	Tue, 30 Dec 2025 02:32:28 -0600
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
Subject: [PATCH v9 01/19] media: ti: j721e-csi2rx: Remove word size alignment on frame width
Date: Tue, 30 Dec 2025 14:02:02 +0530
Message-ID: <20251230083220.2405247-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|PH8PR10MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a138259-6f80-46b7-31ea-08de477dfe17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MmBZFTLmeZ1Rt5lQeGPUrwCe5hHEbS6fBmb+9+WTDns/NgtoY/bZwLcB3CNY?=
 =?us-ascii?Q?LsQbsZ2JtEXqkipG0zmYI8MJMrZ78m3MOHgS3N2BGQF4XU3T9dgXvyMV94kl?=
 =?us-ascii?Q?9Bv7klH4d8NoN+jN8quRXm9FCLqRKYu18xJxL5e8vGd7iePcAQfgOdN6maXe?=
 =?us-ascii?Q?8Ul1iI8E+GtBEmUy/sJ+XxXIrdTvxtGysfp8lkYzGjkeTUtEILh3uJ9WqtAV?=
 =?us-ascii?Q?qHhghtlLvXgrjhehYylAZ2T1y/5sdGQs2HS8XWIcDKlk0wqCLj3FQxapQSyv?=
 =?us-ascii?Q?VLdvUv7oCCrMiS8ZLmeTRiTqwQqSM2mLlVqLrZIeIUmwKgk/rjgm3t7vCwLW?=
 =?us-ascii?Q?xwaoz5OG0f6LEoC+TQ7Yq7mw+lQZzxb/+3+HY4G+JiEyQW38WqcMdPlV6wHI?=
 =?us-ascii?Q?fmhJGk58lHtIqJYPxVUa5jkQfJQXRT4BCofjXHukhaacVVRwjKzV+/0pQ3cM?=
 =?us-ascii?Q?AsE6daAMNOhjEhRBAdLO2oCq8F9XPM/g3EKSMOf2h1OJuqYRC9t+GkFsQ4sW?=
 =?us-ascii?Q?6PCtvgv4tzRfVM/7Ck45M8tOsAv2rL4gE6s9kKCKkU9yWkmhBuJAVTWgG6uR?=
 =?us-ascii?Q?72mKRITEv+0GYi3cp8yvLIf57dNYxqaThZy+sUCuAEBUV5yEtKkMnKkc+yqP?=
 =?us-ascii?Q?TFlsg50GNtcEW0ETm8oCxw8CA4KnUcyZMFLryjec6ORAUsOTnbYe8C62PRZZ?=
 =?us-ascii?Q?QdDi2BSFzXNgYiFEjeL7rjkIlxUQN7SLRZ6azlmTwaOfDC3FmgkdKtdkoKoA?=
 =?us-ascii?Q?dOUAZZ+S1w6+JlNzFxhBqf6H1gu3wRnzfti96+CBTQgM++Q8pgR09kkpMnKt?=
 =?us-ascii?Q?LxQHhgMFLn/rz+GgfW3bYDRoxHVPkrbs9SbspXt2xQG4t9YgSQBTPKLpI9kn?=
 =?us-ascii?Q?ZDUhzYn/epA6DIY3tGksUybz5R0Qv9wYq1bFufUaG3t14PUWWQo35RbcT0d3?=
 =?us-ascii?Q?RC02FcefcTN8A/DjK6uF/vLAcH0hkt/WqLh0pBUBohzz/ViEdN85cSaou5n7?=
 =?us-ascii?Q?ZH7LTkq+ipnrewHh3Ld7yk+Fmj/XXJoPPrS7I2nLLK6XInW8ejSuupEzaSpK?=
 =?us-ascii?Q?rLwf9g9ttoKbmyTzmOUEMlbsQsB/YrKblB8Zgq4IsH4TAtqiMLLJG9btyDdx?=
 =?us-ascii?Q?zYcqZcyHRYi6bJmcVazZdoZHmurJe38IGtowkCo80dQbOC9fn6LHTsFKtRAm?=
 =?us-ascii?Q?9vKpDnGtO5N56dHnkPx1bT2pSJSnzAq2Ogr9ob0z40ds6dSF8ZtIWY6lqCBu?=
 =?us-ascii?Q?PqnHP/e+zK4EKZwYOFmKHFeJtJtGYDNwnB+Hz0ijtuSN8qi0dSKr/1dGbAdU?=
 =?us-ascii?Q?3G9vENCRSjZyxsCJC0J7nSj3WShf3ABQnTkBUN/rBuecGDTC5+M+gWopANyj?=
 =?us-ascii?Q?SM3M1Hx7EIkcwsw+vAp09XYxpXRaWLsFakB2rxRSsP8ZOuK3rJvq7kHThnhx?=
 =?us-ascii?Q?GZBSNe4vW6O65APAekJHdcr0oKQWm9HWCGZgJ8eqIXi4RC6zlCmxT/tRqqOu?=
 =?us-ascii?Q?7YKq4q91WpKT90m9LrjxCZHN/2LQ0pZF10N8E6pFWCkHgXyRdMCzlq2U+Cr1?=
 =?us-ascii?Q?DBAPt20z8X3BYKnxIms=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:32:39.1866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a138259-6f80-46b7-31ea-08de477dfe17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6357

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


