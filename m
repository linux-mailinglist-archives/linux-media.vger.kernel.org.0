Return-Path: <linux-media+bounces-52446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH01DAEpimmYHwAAu9opvQ
	(envelope-from <linux-media+bounces-52446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:35:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B81711393A
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55D773019BA6
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCF237F754;
	Mon,  9 Feb 2026 18:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZCK6hcCU"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893D2E9730;
	Mon,  9 Feb 2026 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662117; cv=fail; b=k+POq7v5N3887Mfr8bTgcKAbXJiM0xQLd88Nuyg2QE8puShxI3O+LIWPnYBFB/42NseLo3o9bddemj3GXqdYq9RSkeKscixmM9c/BuFqSoMNZLXJ1HOw2WLJKVKsZaAw3OKN8kJJ+PgEZ+Or8kiU2Iz9dE9ySEj9d2WwHqqyFCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662117; c=relaxed/simple;
	bh=u8b4MfIRq4LyNu21j/SiQF7ET4XUYywxe61kp26gAdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyVf2TP0UjBGWm37XOjMXCHJqe9qEmgD8Z9C66bgcI5n8iubbSxQxDyLeLf/uJ7+J1qYBSJm/F3qwyckQU58srrdb5HTvLWnh2/f0CxEJKi3aZmajwtCmNF1KWhWIM2ypS5jsAjminjfhIqwUMyKZkkTNY+RPIVtAyl7UvkteOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZCK6hcCU; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRJMrfJ6Zcxwvcszd6Izux6wom/hoZY1H/l+I8iqkDKce75MszsI4Iy1G/qULu5W975VRPC3smIf4reHdpShak9iLgeVUcyr/rDAZddKakm39s+f6Qfy4ZiGl8v4U+lssADb/wQhGlfENi+67n6Le2dMQ6OzAx2l4VC8kFiVpq4i4IIxsnXIP5iXrYnQv7NPmDVjZnRRq+E1Yq92wmkVKZSmqrqB3cdl9g+3BiiG2RyeZVhNtdLxdRRsWbnD6VfFq3WLSENF95ZprfeO5qg0T3zu7WpOue2fEG8yU6lEvWgdhVRfsOpWEQTfjlmubsQ/Q01yi5pCDx5fXdPq2pzCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYXYTgGde7ltf/08jScCgV0DRV/+RS2VHZtsmTT0uzY=;
 b=kWXtNbcI3qcekju5/QPmnevk56AGHK2/1VQG0mjuQKXU4ZrK+RELtOcL19QcgqgVyUKRFja2m1mjsGpcIn4+NtR0Eu9thtBz8xu3NfPOMp98uehHq1WcvqYv5N4bari7BAkjFskBayKhNAlgrxZ3v+SWuqHo/yxqnaxeYH1UQHkrQs6HMESP8pqscvrRYWl3kAuunWMusFqg/z7JtLQfCsY9mSSLQ/+yyVDhkeErRjZ7zeb63aWTjcIpyYrMUrUl2y4r/rnt/h07kwySCX7CVYNnDrfLKDT55ttGVEKCfU1pxUCKMYOMPwWCuVpQkQn7AH1wknt0L3J3yze+D7hNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYXYTgGde7ltf/08jScCgV0DRV/+RS2VHZtsmTT0uzY=;
 b=ZCK6hcCUSqAJFJghHW6m8HLUw4CVaL8vXXQ/+V47HSJ+CmA5IOZqhqF5wG4MAHd3RlcMUBYrha2cSgjCqkOnFPFizmlrBlnYVkZ1VrbwHzIgzSKUGMKkOy3tPKH6akCcMSKjqW85RW39Cu2QZdPlsvhgTJ3qdYmQvHO7l2rCgrw=
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by SJ2PR10MB7599.namprd10.prod.outlook.com (2603:10b6:a03:541::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:35:14 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::e) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:35:12 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:10 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:35:10 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvsv2052904;
	Mon, 9 Feb 2026 12:35:04 -0600
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
Subject: [PATCH v11 01/17] media: ti: j721e-csi2rx: Remove word size alignment on frame width
Date: Tue, 10 Feb 2026 00:04:40 +0530
Message-ID: <20260209183456.1906327-2-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|SJ2PR10MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 4746985a-4b58-47be-2b3e-08de6809f609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?krKFwLIUWdXa9WJ6MO7JGI0+Cl+VuymqSM/jlEhXogBux+abmkrwLxlnqRPb?=
 =?us-ascii?Q?tRPea3fq+vqIwlrkQB1FIqg3moWdyVokqO0MxKm878nEBgNZk60h15+WuFxo?=
 =?us-ascii?Q?/elSLrku5n4Rd19qhJ2V9SyT1Gzlu4kzxq36d9SXGH5tdbkbrKzC0sGXxrcs?=
 =?us-ascii?Q?WLwpmEsei9u3xQO1rh4yxjuXkV20m50e5Ff3pU41i+oq/J2QfE3fjIw2iobe?=
 =?us-ascii?Q?CriOtis06lHgWtzMiB5ogtyZu1bsKAsegsdzGJuPylPMHctHoqy2a97+sxmu?=
 =?us-ascii?Q?qILcKbRlaVSAlYh1VnYM5djrw4z6ntc881zrDf5FjkW6I3XfQDJoQNfNk5WH?=
 =?us-ascii?Q?tONFlb7INgpdAT9VjGtR4zgrN4HkPj5bMBUmaOyH2cq6v0Nty2dQsiyZom1q?=
 =?us-ascii?Q?zY+gqy/tz9VFMVgTrjYS2v0rcvQwgrqJ2oCr2P7S1MDCu/sqUImj0bB/bx66?=
 =?us-ascii?Q?f6PqjaqOH0q6/Z5OuArEFiwF9CLk7yZfrYyRiJBH5atSkRn92NwBAw3iI2Pe?=
 =?us-ascii?Q?5eIua/mBBwsjTAOCs33DmmznFC9JrVGwJ5hedQNBuCO1h8V3hLKQO/qkPWZJ?=
 =?us-ascii?Q?LGY+iLA2MHYfIQOjJ7r6EGhqj0j/ZJHcHl2KjymMhduFDSiy7Fu4RjJKlFTA?=
 =?us-ascii?Q?ecCP8qzknZqtGAgXBXh0MUUq7NqKGSfKfyx/iggO+1CgjzvhipEXU9EOUFFn?=
 =?us-ascii?Q?4MJXobgr9ppJJDkPN9U2OubewvFOXOj4SLxWJ+20fxIpQB0et3LSOQzDL6Fz?=
 =?us-ascii?Q?WQpmG4MmyYbqn/NAUqiOXWxE/SR8k7yUR6jgLO+0fu1btga8RZM2aI3EWHDP?=
 =?us-ascii?Q?FCPwoz4mJ5S/4Ms1BrL67TcvXsRwP5GpSvoeL8P0JPIL7QJKIqKk4wjr7f8B?=
 =?us-ascii?Q?jNAKyrzhWNAcMbcVl/d0DV5S20QIRSCbrNCO7q234RycumX1lLIKW04ZB+fx?=
 =?us-ascii?Q?O9/eXOGf3yA9f9FYww35WLSorYtGKIh/dJeDhW2JZeyBYSef+W7VlaemnDDA?=
 =?us-ascii?Q?7pOItnr7O2Fr06HD4rIkaY56kfkQaA6ecNMno5WbNYVSAff70BpJwiTHeAe2?=
 =?us-ascii?Q?nEi54BT3Juw7001MQFoSJmIyEBaKBYgqkZptUGt3/dynUaaT6h4AULwIp35N?=
 =?us-ascii?Q?nLIKDajNrwXTEbOmaSmpHSMIYhJcaHmL/w/U3CHL4TKOZbKHq0YKVJUxhZ5Z?=
 =?us-ascii?Q?6KO3Z2UoZ3HS0O2Jr7F01GJX1Yn1fKbN2nYLYFJGfYXbGQZvGSGEGXmsykwf?=
 =?us-ascii?Q?LuoDRtAWKT4RXacxA8Pw4bF9XqzJEDPsE9ulJ1UA1V3bjRyK33ef9k++7Tb4?=
 =?us-ascii?Q?lPVh6Fyo49gDKCUxS829cyneyfpBH0X2LA6dKlDWwtHhORRtEes6vBZ80TgT?=
 =?us-ascii?Q?hzL83cUaj+Xshy6tC31Qsi5X5NBG8RTfs08PHYNLZ6a2agypIEB/GK+Eptc6?=
 =?us-ascii?Q?gZKA6aEU9CjtIPnPpJHY2/Nwg+xuTCM0N6Q2gcm8Hq3dbmhoB4Xh1AhqCaZp?=
 =?us-ascii?Q?5JX0Vhd+j0ZpNO0mVeqLKpXU7cn15yvtHExXpO7QJ6ShUylWA1OxN2WFRmUh?=
 =?us-ascii?Q?KlHlXRbJXwTMajK+yBd4SB8JcbJ8R6VxRklUCcaANvF4oAZwsuSkz7p/3jLB?=
 =?us-ascii?Q?TeyUCnngH3BH1SxAe3nFUybs/9t77D/oyifZKafjjQapv8xolJ2uTfhmEB9x?=
 =?us-ascii?Q?C0LACg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UfPA2vd2190/FTtaNI+puHXRA+9mE+RSxxif9u7Q4MCqRVeL1lEE8k7Av9R65+fzAQY1SR9sv+ee5LD3t7u77DsAraJzQXmkECHTo7iaJh/IbKryciKIEX3phPaL4qgR67UBik8OYNcXYZpNi4MWPu10uN1mhy2RxuoC8d+IygPVXbxeyAzA4/2aBoTPm78fBI9db48ol6f69NmfXNROrLmbfDcahz+Db02a/FGDISgvMg2zfRN15zjgIDFEqdP1R3xzp55NT580t17zqS/+qBRSCQBAxmHwaF9ipNtloXW98C9Onnm01dy/ajkjFxWnm7VImEFCFfcpz7fjoNWxbWal/DTtWTYZk60M6e1Kl4W28kBzoD0NdK9RB+JVoECLzcn3WYojZbQ2txX75HF6jxnd6dHBUnJLPqs1OIe0EJwLbnltS8b/N5zVi47AeLtx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:12.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4746985a-4b58-47be-2b3e-08de6809f609
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52446-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:url,ti.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8B81711393A
X-Rspamd-Action: no action

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


