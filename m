Return-Path: <linux-media+bounces-52452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI0xGvEpimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:39:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D76113A69
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF2630728BB
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAB83A0E84;
	Mon,  9 Feb 2026 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OH7iFHQy"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6642E9730;
	Mon,  9 Feb 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662154; cv=fail; b=daS3N/YmXfCsk55XF8GlAXV/ReGITMJXZx8jaWah3v9ucm7B9BC/+t+38MWvq+WPRBp9CMXGue0tJGEloZBh2Qmh1ALfUOFmonNqgeOCsQalvKQxlslQPt/ay76lkx0QDG7iNFeGV+DNRGCSvPgIBmUFn4edrK6TUIHIy02c9uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662154; c=relaxed/simple;
	bh=MIg4lygrCuC3JAv2bm+nGmRPQ2hCQeg8+In26W2VHSs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSyZO/+u0wWzuaZCk4vwSGzjnSlY56QOhTqkboKp3dtobT9ToNvWAOhyxDSmHQ0lBKbAVYOzWcZ00eGhGa9WmINVV+Ms2yM2UhiaBgDxu0e+P5F+OYPcuU1PY7moD3QnICJHWWZeoX+VMnzkhrx2aMjhA+uOsmfFQ50/KK/tXws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OH7iFHQy; arc=fail smtp.client-ip=40.107.208.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3xrXORGy+bBK/GOzmoKK9fJ2aiAeDx2jZ3uAxSylbs1TtlPqBUMl2xIx589hQ8ZTCkNgApo4c2th+sVvOW9kBr4vkk4tzLVidq96g+96XxOdg48kmNJL0Ij8wkH9PUT7TLgll6alcsYyugvvxQpGJComORhEZQewBfFLyeWaVvdXo5zxEraFuOV3ieSWdWaxMUmJ2YSIwi4E/4y0fIw6PvnYBNR73m25vjb5OI9ROWEKOUwC666H7bjhXq/YYIK4F96aRmuAId6MsDwQqUgfY2OB2G8F1Dj10kfO77XF013vOZM2h3px5UObYbpjlSHL2lOQ2x5R7J459kFL+N5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ORcoSYJKdVknbZfoHLTPqUFXkyfBU5YN5QOo9vecPc=;
 b=u7Y0ycbJScJezRiTNZhDNv/G3jn3OIOxQqP5Cpt9wuZbvKXK26VwC/n8gEs4Q6D3UbGc8a6n9QeaPl/EknFh3aQNTLKi32ch/XJiM6+tse3Mu1YxF6DSjbTcFkEYXHNbEyzucCBViPUUhhF8EKDwGgTZpzKY+zqgMfebChmCstqFqmK/lKdc8rGTKNy1vSYZdfNWAX06/b8tWf7lGYaRGZPz9n9WGEFCo2ZeaPis9RR1RSNizhHvBebPlBEIdcQrKBmUK2xsU9cAU6CIOLEhq3ffNWERg1mXDBseYbQVBmwAfyxMAxLhp1LuY01mTseh67nKmviA+T2B/tEPnzCyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ORcoSYJKdVknbZfoHLTPqUFXkyfBU5YN5QOo9vecPc=;
 b=OH7iFHQyxKo8mr2TD6hjVfs+SoBUUNdFQENJcysJmz+4AWgpk2UeFkj++6vGJyZeMYO/yaAIWnAzq4Pi81CUxI0V7iMdG3iZT+gOX2I+2I1EgpvOcExp9fweXTsr8pnp1/441zZBkcpF68gkh0Yw5V8GmTs176UvmD+dxxY+nQ4=
Received: from SJ0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:a03:39f::7)
 by DM4PR10MB6181.namprd10.prod.outlook.com (2603:10b6:8:88::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 18:35:50 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b9) by SJ0PR03CA0212.outlook.office365.com
 (2603:10b6:a03:39f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:35:50 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:49 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:35:49 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt32052904;
	Mon, 9 Feb 2026 12:35:43 -0600
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
Subject: [PATCH v11 07/17] media: cadence: csi2rx: Move to .enable/disable_streams API
Date: Tue, 10 Feb 2026 00:04:46 +0530
Message-ID: <20260209183456.1906327-8-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209183456.1906327-1-r-donadkar@ti.com>
References: <20260209183456.1906327-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|DM4PR10MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecf096f-902c-4624-fc0b-08de680a0c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lhxDpMdZNeb1Dc3uzxv2xRNHdR5KIpnadA8nY5VDQAsc2bnhebGyQr31bp9w?=
 =?us-ascii?Q?Y7K1DVQl5fMNAgyKstU4JgHCmIQNEnwIfi4HfTm1LqQTy2XP8Pa/dCkMPMgJ?=
 =?us-ascii?Q?1jwzi9ezcZvSuky5bdOr86S1EawsfOHinOyZG/u4gi15Abuh944vDy9eALo/?=
 =?us-ascii?Q?VzQlCad447/wYGoTCsyo2mOw1eZeaG6eGyL6QSB+jKfMQ1/4b595j47kG6TW?=
 =?us-ascii?Q?PAuwJ8IC9bEdZsnDluv1LdGdttSAUgbGuI8x9CtX1Sm4h/g8aL+C4K8CCTg+?=
 =?us-ascii?Q?8g0KxmaAMTNFLXE/xJAxyJoxrb+vvgvWqoAzIfJ7/DQzhbaUK0eeEZU7zwce?=
 =?us-ascii?Q?DVMsxZsGy58rsGL6uUaDLIP5WFluLTwjK0lnOZ4OSugw+ziD9bltgJNnKHdb?=
 =?us-ascii?Q?2t8qTr7l/eBGpkKOn+25odM8db97ebtoxkkA6MaKgZc/6kUgp82GljcfPy+5?=
 =?us-ascii?Q?6xaaXiSNml4Z3hbjnTiKcPrwtiBT/odTJ23uEtXQa9oVxwSKLTLUR+ohcsot?=
 =?us-ascii?Q?qdFmLfY3tlY6jDbjzex93DyXHS2w6YX2PkF0Ie4wOy71xOQ7EB5jMBSpUtdp?=
 =?us-ascii?Q?0/ByCtH47hlzd2mHmWTVTyYnaltQxPCTsMtTRcnxW6h5UKq68XEbGfUwOe0b?=
 =?us-ascii?Q?JcQepu/KCZ5aOusTpRl6qqEivW0smaCSGCsE4tdg0b8cB5vw++hiAxJHhSss?=
 =?us-ascii?Q?3E1UL/Ttlgx6yUyg8VhQLl2ogM9+v62xubiN4CNdGYGX8YHsGl6kVapsDb0q?=
 =?us-ascii?Q?7llEe2BJ7IkCVCbvp/e5BMcQKuhoZyt+qr7nmquTIX36cpFOP6qSRYGyIcv4?=
 =?us-ascii?Q?d2zdRFuWfTbs9pqHJd5SdniceI34uvg0symG5wE8G4v6kZJ/pJ2LGyADAyr8?=
 =?us-ascii?Q?LL4rjsqdHn9q5GNirxEIbs5UDTPRuusnOr/ZRqrx6VDGXRw9EITpvzkLM6pf?=
 =?us-ascii?Q?apcqeTi5ISVQKBN6/NX/WgRjBxjh351DzXFF6cxj6Ro6ZCfVnG9QwJ5S/Uqx?=
 =?us-ascii?Q?fYsDLquH+ZTQoURsVLVXlBQ5cy1f8wuLuQc/QmUiAy+AjJNw+twQzubcH1Md?=
 =?us-ascii?Q?0oGVYR5S++s6vmxl7UYK7/skZL+yw7NQSimL6AxRzSLTrUW8j810+0r0KPGf?=
 =?us-ascii?Q?CB/1NteFp8Ie0awJdlDg7HTVu2LPhluJGbC8D5BRq3cONKHYcdGlCMn0CKp4?=
 =?us-ascii?Q?9dHsbMUhHPi4GOFLZNzY6wQrAbxWFv8xNOzHQWZABiAhBOKrx0fXlnTDC6q8?=
 =?us-ascii?Q?/UfQ2GlhqcYsmadH6DycEaVS6iLNCF9XLmADJ1tS7zOw91FaQaKgWLrxbRaf?=
 =?us-ascii?Q?sZxa99F+uQOXlW/oKjZE0EjUr0yulvQ1WKsskkHGSF9DqRFZEyz86YvyMS0b?=
 =?us-ascii?Q?8jTkaybwxeyBUhyvgqMGPamPokNCQ2dK4jzaBdJNbgdWBjOpN495NRJ0XM5N?=
 =?us-ascii?Q?Ts76avQbWynUy0xxubx4+KFVUllXe3584+34q6XC4nTTgIHiAkl4Iy40hOfn?=
 =?us-ascii?Q?iFKFfjDxioOjcCkIrI+5q9ckywjn2z+SnGJ/x56gzr+ZhLQRN0EN4GL8G49T?=
 =?us-ascii?Q?Y+aLFxyi55Mq2w1VYaWVKKrXG4lGVb/dGv/G7DLnb5kHZGaFl/lF9kk81R8g?=
 =?us-ascii?Q?PB6IK7/ZTGLpT0rE59wH1dswJJUc+8/SdteGubj3CeW8zp+KAEVr5bL3TpeL?=
 =?us-ascii?Q?Qw1n5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n7ZuHAV0EAa2fMiuBKlk4C4drMZ+nmdubb94u3Xf9RtHKQ5mI/crSgiZQeS79TWZIh+WwX9Y72D2SPoP2OBNhTIyWDAubHNUSrtKvsu1PECNgS/bB6TUev7ExWCIap1lqP7ZvzDdOQazMOrkxZ0HJ+8qLMu9SovfUPH7OrAn9XUj95blslFehN3ikXVVVSzq9mCmZKlsVeqslMxOIZNgiVAj8sDSNA/xxx2Fg4WfG3a0GVU8iW4mzEoN4DK2PPg+r5MQwSB5Sq9bmYkjYf6tqDTPfOjesYzm3ugOUZn3c3qOhnm1uoip0xoeWSJY4g69wsz5AabbgdcwC2J4WJ5ONmzYlHeZySnU+Uve8W89VDRI6r22vJnqClBpiDNJFLmd2tj2QyxSiGHnq7MDwG87155/YQE4xu5aaerqNxqhDs+OWAdGwAq5fJYI+om8FUot
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:50.1968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecf096f-902c-4624-fc0b-08de680a0c94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52452-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B3D76113A69
X-Rspamd-Action: no action

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev. Use this
API instead of  s_stream() API.

Implement the enable_stream and disable_stream hooks in place of the
stream-unaware s_stream hook.

Remove the lock that was used to serialize stream starts/stops which
is not required anymore since the v4l2-core serializes the
enable/disable_streams() calls for the subdev.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 108 +++++++++----------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8c19f125da3e5..8e7af2da62262 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -125,12 +125,6 @@ struct csi2rx_priv {
 	unsigned int			count;
 	int				error_irq;
 
-	/*
-	 * Used to prevent race conditions between multiple,
-	 * concurrent calls to start and stop.
-	 */
-	struct mutex			lock;
-
 	void __iomem			*base;
 	struct clk			*sys_clk;
 	struct clk			*p_clk;
@@ -268,20 +262,21 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	struct v4l2_subdev_format sd_fmt = {
-		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad	= CSI2RX_PAD_SINK,
-	};
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *framefmt;
 	const struct csi2rx_fmt *fmt;
 	s64 link_freq;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
-					    &sd_fmt);
-	if (ret < 0)
-		return ret;
+	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
 
-	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
+	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
+	if (!framefmt) {
+		dev_err(csi2rx->dev, "Did not find active sink format\n");
+		return -EINVAL;
+	}
+
+	fmt = csi2rx_get_fmt_by_code(framefmt->code);
 
 	link_freq = v4l2_get_link_freq(src_pad,
 				       fmt->bpp, 2 * csi2rx->num_lanes);
@@ -401,16 +396,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 	reset_control_deassert(csi2rx->sys_rst);
 
-	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
-	if (ret)
-		goto err_disable_sysclk;
-
 	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
 
-err_disable_sysclk:
-	clk_disable_unprepare(csi2rx->sys_clk);
 err_disable_pixclk:
 	for (; i > 0; i--) {
 		reset_control_assert(csi2rx->pixel_rst[i - 1]);
@@ -459,9 +448,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->p_rst);
 	clk_disable_unprepare(csi2rx->p_clk);
 
-	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
-		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -485,38 +471,56 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
+static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
-	int ret = 0;
-
-	mutex_lock(&csi2rx->lock);
-
-	if (enable) {
-		/*
-		 * If we're not the first users, there's no need to
-		 * enable the whole controller.
-		 */
-		if (!csi2rx->count) {
-			ret = csi2rx_start(csi2rx);
-			if (ret)
-				goto out;
-		}
+	int ret;
 
-		csi2rx->count++;
-	} else {
-		csi2rx->count--;
+	/*
+	 * If we're not the first users, there's no need to
+	 * enable the whole controller.
+	 */
+	if (!csi2rx->count) {
+		ret = csi2rx_start(csi2rx);
+		if (ret)
+			return ret;
+	}
 
-		/*
-		 * Let the last user turn off the lights.
-		 */
+	/* Start streaming on the source */
+	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
+					 BIT_U64(0));
+	if (ret) {
+		dev_err(csi2rx->dev,
+			"Failed to start streams %d on subdev\n", 0);
 		if (!csi2rx->count)
 			csi2rx_stop(csi2rx);
+		return ret;
 	}
 
-out:
-	mutex_unlock(&csi2rx->lock);
-	return ret;
+	csi2rx->count++;
+	return 0;
+}
+
+static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
+					csi2rx->source_pad, BIT_U64(0))) {
+		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
+	}
+
+	csi2rx->count--;
+
+	/* Let the last user turn off the lights. */
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+
+	return 0;
 }
 
 static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
@@ -611,10 +615,8 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
-};
-
-static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
-	.s_stream	= csi2rx_s_stream,
+	.enable_streams         = csi2rx_enable_streams,
+	.disable_streams        = csi2rx_disable_streams,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
@@ -623,7 +625,6 @@ static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
 
 static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
 	.core		= &csi2rx_core_ops,
-	.video		= &csi2rx_video_ops,
 	.pad		= &csi2rx_pad_ops,
 };
 
@@ -829,7 +830,6 @@ static int csi2rx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, csi2rx);
 	csi2rx->dev = &pdev->dev;
-	mutex_init(&csi2rx->lock);
 
 	ret = csi2rx_get_resources(csi2rx, pdev);
 	if (ret)
-- 
2.34.1


