Return-Path: <linux-media+bounces-51253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOrgNzXhcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:22:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46358595
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3F8252733E
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851AF494A18;
	Wed, 21 Jan 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q04RjZZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173CD23AE9B;
	Wed, 21 Jan 2026 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003715; cv=fail; b=QDXgiN6ZIRddSYdbSeRkUwlX4ffXvaQ8PR9hSxXG8lHVG3sD5hN+WsvmZposS+fRTsvWb9Ac5TMl5pnoJtpNEjjHWKxFt82GrO5D4g1idOe5Fz66GXcvFqI0jskkkRsZXrAwKNXG1yfKwsHeXecAfr+mSDbizf4vPwsf+3a7Pgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003715; c=relaxed/simple;
	bh=4rBwKidSbn9blA+n5wuerKp3imV0bTVzcWPaBuglL20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuDEkqjb0NrTiE6bxk+8uoiPLZxCyMfjT2zw+aiEootLYoF5oHqQQdluLMjTcN4L6uPJwSu19s/8wSC4tAe1+cHgis++wZ8yrKbJE9woA74lvSgcZM+iK5UZa1mxuFAhM0nRASfu5vaXza26LyXzcky5X5m04wirNn5l/lX64PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q04RjZZ7; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKljFUnvQaEBWDe22jl4pyTrvuvkrb8ArL9mUWjx2y9ocIPYkIaqt+/DpvrhBWfnlK2GryfwIDmay6Xu6u6wIJLE0DxWj+8RxC7qm8z/4HGgaAN2BYNnRn3FmjcwVvc+zpJGaUoonbQobRBYo+NGjaFwtc1L7OcriU15Jaa+QCO9DOhz0GTGKx6D6SfotU/+akQZQitAiVjv6mMB3xrCSvyzElUVixQtUz//053QMjdWVW0zbF/myu9jUrtTRqfTQbG4f7JVAihm7zWynGr7lgSUQmTFE1EDLEBVmcCe7PXf3QCFAcPa1Dr/p/FYPdMBbZvanqmHepe9l0bD/h15NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyVyCVqgCQoXvGXC4P8xhVLXQaOeR+l2SevswnZsEgA=;
 b=tzvppVsSuelOKF5zrpjLpIPXK2hOkOuIdKNR9fg52/3Zh2SzbTxl+aLBe5HXhjBpb264yj9KD5PO/inIAdMZKnPsWP0FRGQxnsUaG6XCWWFbu9V8ZvsSPgZK0RyXH88GbgoFthRqVy4Q/oUFb2RwgZYXmgubm5nLpptu4bHN7slrjPWUtOYOkTLUhFogbHqkWLsu9eFWi72hULkhfwtPkmymMopahh0lge82MTqMhF4iaLZm7glFmifDES/BBMgHiK7mLHZRhF7F9zuLVvgccMg2pcjcWOt837b8v8VIQ1BamDebS+VkpMppu35ld9cn/y+K42DjpD0Rc5b+bi8PDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyVyCVqgCQoXvGXC4P8xhVLXQaOeR+l2SevswnZsEgA=;
 b=Q04RjZZ7wy2NiMY/GDah1JYQid5fHSBnWIbKroMcrnhlfwXbERdkCKisQBqSfmNiyUI3pSQ2kzshfJVg6uUHLb46E2EHOHvcwPdwuI6ZUSrH0sDmyH3RdWaf06i6rMtlOHv0O3N7cZ0Qn471fzaq6rmeqxK8xdYROhr5rFzPf7Y=
Received: from IA1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::9)
 by PH7PR10MB7803.namprd10.prod.outlook.com (2603:10b6:510:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:55:10 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::c2) by IA1P220CA0018.outlook.office365.com
 (2603:10b6:208:464::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:55:08 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:08 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:08 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIB3104105;
	Wed, 21 Jan 2026 07:55:01 -0600
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
Subject: [PATCH v10 05/18] media: ti: j721e-csi2rx: allocate DMA channel based on context index
Date: Wed, 21 Jan 2026 19:24:11 +0530
Message-ID: <20260121135424.1185710-6-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|PH7PR10MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9e03e7-2cf6-4be4-8e97-08de58f4b088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzUHbRQ/u0+dy5pAc5trE6bfTx0OA8/Ad1i4OoO7LjfWXEK3IWQcE7pTWnk6?=
 =?us-ascii?Q?IDio/BHY13ZBD6m32q7cMs8jxzViCePYnR3jahJ24/4HSmfYYqTYY4+BGfhd?=
 =?us-ascii?Q?caYMMz9GK4vS+Dn4F5g1Ppw8vxBOKGx/f56iy2cCIzaqBaCZ4FKsxMOyU/cS?=
 =?us-ascii?Q?4OuuVM+B5M9b0B3To86s7J5Uw9z2nPfumcipqHsPRsCC4r2shOvOJAEAZbvi?=
 =?us-ascii?Q?Hcg/Th9XZMH0X2d6l0fWLe6KQbA9pj6TETArlyBqAlX44GTO+TfOj91Agcq/?=
 =?us-ascii?Q?oyPcrIwyigcxOpw85L7TQNTS8q6erHTZQsEO5SWtsX7PLYR8CyRcgxCpytKc?=
 =?us-ascii?Q?Ggej9JO2CfgMHFzIxQlOqwHB5S9qEjTgr3rmpPiU2M4NZlL6zFot7fVzSvxN?=
 =?us-ascii?Q?s6QevfzWtCJDgDL7n1NpIELW8aaTah/jdtAE2l/ydSe8IvavOPOG6iM180rg?=
 =?us-ascii?Q?u6MRMjEuZPkPdI1wBvDZH1LbZQxW67+VKtVQM1h33UFZteXNat4BIm2A0GGr?=
 =?us-ascii?Q?9pl/ylw9JPY8enkKfH/b8zVmeWIDZHmDU7i6fb2Vab6VsqNkvzmQP07EBffe?=
 =?us-ascii?Q?UeBk4oPSbnSlcSHfUANgH+1wXyGu9hUb3icOI+w43Wc5aqjeWAEs+FzM90Qg?=
 =?us-ascii?Q?z/ahWi18g/9W5jT/9g+QemmrJj6cIMRkGZZc0RQfy40xwlIH4wINkvgA02Ti?=
 =?us-ascii?Q?f4S8yQ7i9yMB6K2iWzRl/Hexzsm7p3bn11jhimtX69yhUrcPZg/upVGce2/H?=
 =?us-ascii?Q?YcoUj7gLCCa0I4O2eJ4g8joZdTfyaqfaxHr5ZrfNlkydCxnbmZV4qpl9V6Wj?=
 =?us-ascii?Q?wEXt1LEt7Rnz0kCf8F4eYqvbafUri4cFwsMqt62yeXonl0V4u0sJdl6PLj5k?=
 =?us-ascii?Q?jWMjEuOh+cQw3KSjUbTTiegtzdl2Wziy9uA8HlZSdU0LzGgu/MjrvMeWKCQG?=
 =?us-ascii?Q?8G4mDmXJhXPL+LErQekSL6SwMXrq/R9woDMm9uPtlQ9ALoWFdSDz0SUm6JzG?=
 =?us-ascii?Q?q7FZmoCXICExgsDqBuhNNGUt52VIN+VnMxvVxBTWdTUQlzLOrvYJ4FywwY/m?=
 =?us-ascii?Q?1VMjPfRAgfnjkHH24P/0teV7ArmqHOOXvVgOwVx9zI6K9aXkOK9Zt/vbi4uA?=
 =?us-ascii?Q?n5nDnTnUTR5yQ3JVPk6KpE+rpgTRPVewRo9JovLabdrvadSIPOzEgtP/UXMi?=
 =?us-ascii?Q?1Z5dHmm5eUfz3m7sMJTEWWnaUXATiS2Fk4Kq7ayE5g+LLzPwMhO7l2EaU2mO?=
 =?us-ascii?Q?ne9pnzLSksOKOGiO++vYDOFG6VxWVJHMr8pxelcyr8YAOChEcX4Waw1h7dxy?=
 =?us-ascii?Q?wwrVVJPGMqhbwHIqpENqsQX7Yl6CX7WxJJszG4lbLf1QpfqWGSoGKlVVYgME?=
 =?us-ascii?Q?sHMIyNp98ADAWdFIIBa5oHnIYOuIvxTt5hNaCMC4LrYSyKaNlDFGc3FrUBSO?=
 =?us-ascii?Q?a3U2DGJ7Pwc/KT6uw8yltu4Qmdq6aflbFOZ64T5Glebqhd9G6l3YQq6GqLJX?=
 =?us-ascii?Q?ArytWhoXyDRHYXkrhlGd2qvrWx9NTpRqBobo9G++aMcBL9kz2GoQskNgdLAp?=
 =?us-ascii?Q?Cd71+9/FcmLOCplGZgfVgDID1gkuyq/dtdPlYF0rG7AJqShFCtZAcadazfpq?=
 =?us-ascii?Q?BnlOZ0BQbtN75i4ttw+pSaMRoGVCrGM4oeRiuljOL2wczX80nu7iD6EDOXUJ?=
 =?us-ascii?Q?UI69jQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:08.9046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9e03e7-2cf6-4be4-8e97-08de58f4b088
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7803
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
	TAGGED_FROM(0.00)[bounces-51253-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: CF46358595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

With multiple contexts, there needs to be a different DMA channel for
each context. Earlier, the DMA channel name was hard coded to "rx0" for
the sake of simplicity. Generate the DMA channel name based on its index
and get the channel corresponding to the context.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index fdbe72df5c5f8..f66d68edcd57a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1038,9 +1038,11 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
+	char name[5];
 	int ret;
 
-	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	snprintf(name, sizeof(name), "rx%u", ctx->idx);
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
 	if (IS_ERR(ctx->dma.chan))
 		return PTR_ERR(ctx->dma.chan);
 
-- 
2.34.1


