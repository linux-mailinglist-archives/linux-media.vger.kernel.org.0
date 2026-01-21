Return-Path: <linux-media+bounces-51260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GqkCCzocGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:52:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14658C5E
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FCB26C929B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0E84A2E02;
	Wed, 21 Jan 2026 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZYt/1ul4"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231E3A7F66;
	Wed, 21 Jan 2026 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003769; cv=fail; b=pGtD1jJAGFAYLXBI5Qekbl5i7KyY1aNCmUFUP87UN1lR325K1XuHDzhVQj3+N6+ifFq5yWSL+Vms/8gD4jNX13q7J/HHJKPOzClwwGtoxlPa1MEUSq1+2PcjDuO7duyQVudMsN6EjBZkNBRnXVFjEGttZATx2Hynaz4BOlPM3ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003769; c=relaxed/simple;
	bh=ALtflz9xSGJuoZCHLdOd4GjHfuclL2rl+j3XCtd48+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYzvQeI1VwuJYGdMDTw5C1BhySkMrLA4dXKF9sQvB5b/vlYvtqjkbxdmzxbBUTSl/MM+TbvC/xMYbfVo+Ti1qNtylWnu8jp2jc0k/yt4HNwmHUwZIUd2ORYqVlBjOSKJrkql5q65LEASB0gUHgDC3mXnscTCMThCUw/JW76uR7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZYt/1ul4; arc=fail smtp.client-ip=52.101.85.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGjLmKnLLLAn7RSySJc4cnwMXJsMVCEv1oNHW3Yu8U/Vd2U1k9L677a1pUXDFBQa0rhPRE1MYKgaM9LEh8IvG7wlTsapzKtTFolaJJFZJ/BP0BenZv4WZCAjWofbg7JMJ+mPKP6W3aBbRrxCgf2HDwPPcQlx8TyejX7oSMg/8t2oxwjGIkbJpSIuhImJuzfpnkre0Bwb79ScP2X1EdB6twBM/4J96ebANZOx3N/KUvNk00lqFGqytM9VWwPdmIed5U/ZHp9AqN4ZgG+PqVuMy8ImWZUFQOu9vA5KZiWMX5THoIwFVd1m736xZ4NQ35U+6NvO4i9olkS/KZ7m8UN3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjDRBu7BMMjrFdQ06EEbWQYucOWlgAjZSOqsg2Ow8kI=;
 b=oiuIIS+Q90YMqlf8E179iBHkjiEZRSTL85HdmPUAjivDLdXgzC1pIw2dAvxQX+xAtKDeTNDGifaGWsGql/Wjf3hSGsIk71ShOhDqXlQNq7KNmgZ+YwojqeIVOb6B2Qw/wAq8Yv5lVLJ4/tECgVf5ve3Dfe1q5qjyzuk+TL1xee748o/ZVZtZQFVSWKY6Ju6cV26dEla1JtuxKT4jDg9aAm6jPFQu8Hu/0vTkzwDwqZpigq1GDCC7g5w3mKOP98WNazVNZX2KWFKZ5BfMPC4XS4UUKajgYFZOm+n9g7lcqb/q1rl0Dp9K19gr2zUYIb8FSaShohypF309yk7GDuNOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjDRBu7BMMjrFdQ06EEbWQYucOWlgAjZSOqsg2Ow8kI=;
 b=ZYt/1ul4phPB8jaZT0UANB6s09zuBf0nV32NYqa9SO6fpn/gVWcn+Dn7aJ4Egof19nLddtJoeNAZbbpv5yYdQ7hJVNBv6nGcjy+isJfoT/duUdHx8LHJ1S/dDC4wLpk3BCmDdod3aFIQK93pODq8rZqEzgV7wVvCON4owG7t+k4=
Received: from PH7P221CA0087.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::23)
 by BN0PR10MB4967.namprd10.prod.outlook.com (2603:10b6:408:123::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:56:01 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::b2) by PH7P221CA0087.outlook.office365.com
 (2603:10b6:510:328::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:56:00 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:57 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:57 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPII3104105;
	Wed, 21 Jan 2026 07:55:50 -0600
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
Subject: [PATCH v10 12/18] media: cadence: csi2rx: Use the stream from route to get format
Date: Wed, 21 Jan 2026 19:24:18 +0530
Message-ID: <20260121135424.1185710-13-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|BN0PR10MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 0246c57d-3ee8-4448-3d19-08de58f4cf18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I6GmtonA5YkTRUcjDB+OpqCXGKp30JZKEKllaMYNQxt2Lvhafw2BVoj/gSl4?=
 =?us-ascii?Q?PBUqLIPS6dAKD2gkTUMcGMCD6IQPS8K6q3aqtUT3L6PclkEes5mhEYrmHAB8?=
 =?us-ascii?Q?bfnAz4gJSDmfYpiOITXaiPw6FP2ZwS1s/pDrN48MDFwOl5Bo2XkitaWFALuG?=
 =?us-ascii?Q?zPU7WJyfq5/VBhr04JqPLj2gI8uqcKtvjlJKs73Q8/E2WjRQGwbByk/5brbn?=
 =?us-ascii?Q?cZHJJtQO/WggCDcLIT/tWOPOZZryZC/X+OwGBKse5JcRmru/y9mOLkKmpNBb?=
 =?us-ascii?Q?E3KSfuq3nnDqsdrvgm14j9HOX09WnEd/DHJCjvCIa7NG8LzO/jCSMHz1o8lU?=
 =?us-ascii?Q?0YRWKJZmZJ6DnSb+8MgLiEPpgDCEBAj7bU2x8k8ELUMvig6S+J5bdZ5Bhnzw?=
 =?us-ascii?Q?SGcQLOG6fiNwdto/URSiOSbpZg7/cM2J7eiJMsKHoyYB62iwyJLv+b5zC5k9?=
 =?us-ascii?Q?bKFgMX9sxwcb6cI/BFTWw0oeDpHPDWJKVI72SgRL15XNU1anfJa6EQGybL3E?=
 =?us-ascii?Q?E4+3v/aQb90DhwiQI9SzvoMyw0VxIxv0SkkeqjNdZ1WqVg9yNv0Qxu8EKlLI?=
 =?us-ascii?Q?xeEgnevQDSezfMKBNd9Bquph8+w9LiUNXFCcpREaIprB6K5rLlxhwPlABEWt?=
 =?us-ascii?Q?LzLia/5cHaXoVLrTGK2gaBRTY7bH8M7xaZPaefAHuBa5TFAumI2P1o2SPxse?=
 =?us-ascii?Q?b3d0oc0soc0eXZnPYBJii5p4+bKfLwCUdnjIwY64CtLUF70YHxyIj5huLbjF?=
 =?us-ascii?Q?g9GPTr9I795BvD1KlO4UYEgjUuA0MbAtR7rXuLSoNU+KiiSm1kNiSUyC/K+W?=
 =?us-ascii?Q?GCG47GWikjTCcdTFJjplEjHDCSlA7bcdu7HwaimajxCfIl4o6EHi4+PiyFoe?=
 =?us-ascii?Q?13WRvn1JcAx09KnpZPt01Cz1aQogf7T+bsg0Ys0CCp8fBZeSxZBylewQCnnC?=
 =?us-ascii?Q?JXCiTJxKIMDYecLyXnItLo760E+KzrZGQMOYZRzFnx5o+/iot3zZByXYL9OY?=
 =?us-ascii?Q?nTMZfE2SjqcXGq2fcm6noOohinunkMF9jq8DJ2ECP6yNDDcWxngWX6FUocwe?=
 =?us-ascii?Q?K989QWIiz2AozB35cSYDjoeESrc2ibubsxX0w1y4JxcJpV1blgxC0UzfXF+n?=
 =?us-ascii?Q?/ebAYsn/+WB98NcqGppgFAc4jLv/YjPTOO3LVJU9P+EHfLmAqvdKYLryMGWB?=
 =?us-ascii?Q?QypaDzIEGKztJUnMude7BVqESOinaDc6HiIR9nyl5iCRHsqbfqTZDLH78t8C?=
 =?us-ascii?Q?H5bknnPpI2mpS0b9tH3M7pCIGhq7IWG15ICFBKh6Xfs9hM2BPD9eBkbBG4xQ?=
 =?us-ascii?Q?hkExyMYu+4sWaNcDfgxhq6aYw62uJtM+lakr89fjeci+ihC+ilrGlSRD1iw6?=
 =?us-ascii?Q?Cun0v6v5kVVyPbDEWo9LXLdzSU+6sBsDJ+qAe2fSiuR41+Ao73eqZWVspD/o?=
 =?us-ascii?Q?jY3whFfaJWBQH6ypMwdxGhP8dfrwWNWiFiJeKsr8zx8u+S7k8BsFQyGKmyKz?=
 =?us-ascii?Q?gxM+PeTJ32StVoJUQLKsUAQNTrloLdKiGs4///CJzUjhQZfETO2C2C26Eh+C?=
 =?us-ascii?Q?2nTjijECHfilp6axaHEqjOxBk03u19ol2GjNx4EUK6AG6YrXneIi7pYejdTd?=
 =?us-ascii?Q?yczlyetDW/oT98ZrGSTxNTngC6cVemf4oW42TDv9EOAbXAGkhheb/Kp6Vyb0?=
 =?us-ascii?Q?VuO4Iw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:00.1559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0246c57d-3ee8-4448-3d19-08de58f4cf18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4967
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
	TAGGED_FROM(0.00)[bounces-51260-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:dkim,ti.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EC14658C5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In multistream configurations, different streams can have different
formats. Update the driver to use the stream number from the routing
configuration when retrieving formats instead of hardcoding stream 0
or ignoring streams.

In csi2rx_configure_ext_dphy(), use the sink_stream from the first
route instead of always using stream 0.

In cdns_csi2rx_negotiate_ppc(), iterate through all active routes
for the requested pad and retrieve the format using both pad and
stream information.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 34 ++++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 175366f889115..db9871fdbe3a4 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -279,6 +279,7 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_subdev_state *state;
 	const struct csi2rx_fmt *fmt;
+	struct v4l2_subdev_route *route;
 	int source_pad = csi2rx->source_pad;
 	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
 	s64 link_freq;
@@ -296,7 +297,9 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 	if (state->routing.num_routes > 1) {
 		bpp = 0;
 	} else {
-		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
+		route = &state->routing.routes[0];
+		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
+							route->sink_stream);
 		if (!framefmt) {
 			dev_err(csi2rx->dev, "Did not find active sink format\n");
 			return -EINVAL;
@@ -706,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
 	const struct csi2rx_fmt *csi_fmt;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
 
 	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(subdev);
-	fmt = v4l2_subdev_state_get_format(state, pad);
-	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+	/* Check all streams on requested pad */
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != pad)
+			continue;
+
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+						   route->source_stream);
+		if (!fmt) {
+			ret = -EPIPE;
+			*ppc = 1;
+			break;
+		}
 
-	/* Reduce requested PPC if it is too high */
-	*ppc = min(*ppc, csi_fmt->max_pixels);
+		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+		if (!csi_fmt) {
+			ret = -EINVAL;
+			*ppc = 1;
+			break;
+		}
 
+		/* Reduce requested PPC if it is too high for this stream */
+		*ppc = min(*ppc, csi_fmt->max_pixels);
+	}
 	v4l2_subdev_unlock_state(state);
 
 	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
 		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
-- 
2.34.1


