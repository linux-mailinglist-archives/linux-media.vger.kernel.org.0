Return-Path: <linux-media+bounces-52457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLOgK3cpimmsHwAAu9opvQ
	(envelope-from <linux-media+bounces-52457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:37:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3461139EA
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5A313042749
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A6C3A1A39;
	Mon,  9 Feb 2026 18:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FYG1fk72"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542D388845;
	Mon,  9 Feb 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662189; cv=fail; b=b4EfQPgUivo3C7mTR2VHNcyVb0s1zY8sIbCV8j5hINMT09iDTzo2nFp/WPQ7JE5kPHr5bBsPsLLgEV2ghwq16T2FcPVvyb2p/Ei7bI9CkQbg5oFu6YJvWapL3NLuoptvvBqszg19db/jtDgxsrGFNbrG9HjAVC7ipy67UCVt0i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662189; c=relaxed/simple;
	bh=HFA7oGbWdpTLTiWDUx1EQJ4E03Mwhc1FpMuiWBQWgI0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5GAz/zqjVLlyQWjoJ54I+H3qe+7uaUAXBHFYdZkHokKZgFJXEInJ2wYT5MhVr9GdB1IS+BiNxKVTeUxnaq/ppy0UI1oJW1d+KRVtzku0AmqUr8C71e2pFbf4Ht+RhH1OJ4Wj9f2EHX1rPPxMIPYW6OaEVmjcPXdHCb9gTWgIDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FYG1fk72; arc=fail smtp.client-ip=52.101.56.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojqP4M7KezZEAm1ODCEkY8ia3k2Hg+SqEnqBr1NInb1V0P66IdzyqVGxIUbIKCyF31QXWSlLIci5EGE1oc37mlG1gIVfgH5K+DbSSPXCwNOIK5jbFwD9k7PTlsAsZRrMqTAnvHl6lGufI7CfpsHeUY/2qX7ihhwimH7s9CEojt2naol4H9hYfbjMzSGIbJBRnSE5jIF229oN6jCOvIJHnhvgbCHUjsDDDZbYYDa8zrE4g2fVd3rMvxbKLSKMQU+iK0KllV/cgeiIXGhtEqTeStjcclkLmHTFoHssiyDPJHPbks0uQnEO4dhAhd3lknGgN3wf5gaTuQaheyV8eQ+PqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4+ZO2DYz1IycBFXmOeeYtQyqCTE+QsFILhGEmhJwGM=;
 b=FcPeesgK3Br1hPFQHi/9uxbSlrZfeCXCQIe6FgRLm60PUXE/QAkOisZi8YhYG+sFCT1bcVXnGyBhCea70pyW9ubnMmeyC2M3QZiM4WCE2wlAkdRw/GEEp/CqR9dfL1w3YNWno8CBiAYGdgGyQGd6Wwzqb6UKG8ok7kjRYny2nXRGfqElVfFp+3bicBGvzcpOmC37ABpeoM1noolWQvuEVe2aDKXv2udQwldgzSX0iZgUlCVskK9HWhWiGOXpN9zrwjoP9UFOayaCeTTh8bj+NMEBhlhMU5YMzzZVJQEe5njzyoWWBBAFryRenoHaEBtI3qLieP2seOa53PDoDVyVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4+ZO2DYz1IycBFXmOeeYtQyqCTE+QsFILhGEmhJwGM=;
 b=FYG1fk722p1AQtbLdPMd27F1/cJMQv7d/DMHDaYl2hQzM1NAGFu/wWcE7srblhKC2OkYwWT3V9rhCqCTXDkhGlX14THiKrb6jARVcCGW8YWeLgClvYctHvD1DdEDwTf6Z7kk4ZVA1uC/oP3mJ2kzze4AGlmbN+LLcKYX4/VB38E=
Received: from BY5PR17CA0010.namprd17.prod.outlook.com (2603:10b6:a03:1b8::23)
 by SA1PR10MB5686.namprd10.prod.outlook.com (2603:10b6:806:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:36:25 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::bd) by BY5PR17CA0010.outlook.office365.com
 (2603:10b6:a03:1b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:36:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 18:36:25 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:22 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:21 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt82052904;
	Mon, 9 Feb 2026 12:36:15 -0600
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
Subject: [PATCH v11 12/17] media: ti: j721e-csi2rx: add multistream support
Date: Tue, 10 Feb 2026 00:04:51 +0530
Message-ID: <20260209183456.1906327-13-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SA1PR10MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: c26c23ba-8542-49ce-0ec6-08de680a2159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CNvN2gLBc+M4PoRwq/wscZD+VFEot2/2Fi1JBDUQXjAoaacojYp+/p6Avktd?=
 =?us-ascii?Q?Bucq+1xO/HTosN9GoBZCEKwQKuIu/y5EX+J6wEjw9CIoagb+u9l2/10IfSOd?=
 =?us-ascii?Q?0woX03lXYQitcTAwUYISeMmU/OoGWgKW/oOL63TwZ05+cYZL0YKQ3WOFiVxo?=
 =?us-ascii?Q?1j91sAlS6rcORXQq0rZaE5abBHRqAtnljEIA5SEj14XYcAipVL+wvyCNfXTI?=
 =?us-ascii?Q?uTatNI+DQjrwDtPKNLMfIe/Rr4uXMmLLI7q06HCZYVFq0rZFs0LqghNdqxYl?=
 =?us-ascii?Q?JBmRDTlAFkTE36/clc7eAX2EHKwHaiLCeEEqQ0AHha6oKHA7PYAESCaISNAp?=
 =?us-ascii?Q?uvgtXNyo+FZaXM94wz/QKNwsFvvk4b+wdML1gU2uXHulD6COUxELgi/pCLJm?=
 =?us-ascii?Q?KdqzsN4Lms26eBgY6DSj3+wvCWRnpC7acNVM4vAJltc32f+VWSCMfs+5saTI?=
 =?us-ascii?Q?Y6ZKYiwmgMwQj73Sxi7pehjzgc2JymxsNml+bQlWjxTY6sL6ZRNEtiFB+YF8?=
 =?us-ascii?Q?HW1bsu+2RhujqzkihUoPvwkjUPbIj2S3BrOj9w55Ker2YoE9Db60sc33WroR?=
 =?us-ascii?Q?igN36f1zUf9sZ+SVFRH7Wf7ymeuhKxPby+LO5eV9BsVqi0QgTt5YdTcZjPBH?=
 =?us-ascii?Q?9q1ZSIwSmCPjA4XFUZmHnTG1d91ocIrqpet47r5d/XPZkY3fjWjpRARQJcc/?=
 =?us-ascii?Q?sMlw5TpBGX6CrEqrea6DfuHIwIFh1V1Q7fIPK/F/lrXGpYp/b9lTnF8t9f0c?=
 =?us-ascii?Q?ryp/WVsSgCeNyY1NQDzFJ25QF2jTZlRJQ+FD2PRxXxdXLznXBeOLwBNiuMTb?=
 =?us-ascii?Q?GnwyJq0+5eJdBD58lVabQPvfuwJjCJI6FLZ6Pl6XSGfDWY/xEp7tOTJNScOm?=
 =?us-ascii?Q?3N8HYaXeZL2jUMUr5yxes1RVDCZN326CR+Blr/u4+QOhc3NvGLm2CLmRpfZl?=
 =?us-ascii?Q?XBBiFAS75PwEA6jq6wFdufFQ7mzCNaRl5EEETinbsIPcduaBnsqOdva7aqnj?=
 =?us-ascii?Q?YCEyx6MAiw0zTvWaFbMdWce4UtV2VUsJz7d2/L+e6AWpWEGfNLQfxCLo2X+9?=
 =?us-ascii?Q?+3sCXgQKhtWUlwA3fdjUO4eFsDqaCaF6+js1f0/gfNJbzQmuaNhKyq92xGRL?=
 =?us-ascii?Q?QM0C5aT/O12kj/CCiFS4QHHRKVmqHKk32SUyW42guQNM8XpEYdxjzY/wF3SQ?=
 =?us-ascii?Q?DFy9s5esn5AZNr/B8uKSYUC0xB7/xxOFxZOSFjTFV+lvuaaEkTEg9z2TvEWK?=
 =?us-ascii?Q?QIhpR/8VL/2Uxp2vXC77ajpeUUvp+yuQGeY/7dCuiyvnGsja4Zd54mQSMAPW?=
 =?us-ascii?Q?ZIG/XoIq3c4boESF3KLXpbrvWewmYQHQsRmjG7X6d7qJWvkkzXjMebjAzOeu?=
 =?us-ascii?Q?8BXjeP+zj9amxOYi/IfnTJtfcHihfMwCehU1JX5DixjvtBmlHQ1fCu414E4n?=
 =?us-ascii?Q?VDy30SUxCP6BABsbrvx/bX2E2N/EaHxbsr2LQNhSSWF34RHw1ozDRRE5QiVq?=
 =?us-ascii?Q?Io3ZoSS/xJeaiG9I6P8f/H3blDzag7xP9ovipKTgLw9lwwt3kVUINUPpcAn1?=
 =?us-ascii?Q?uM8NtCtosSQA4bLlFWJ2Ps0gsZqrW+flzY6F35ISKx8auvCEgu53JSu7xT/J?=
 =?us-ascii?Q?cX56GSbWfUcsxf2tr9k9hw/MyZVd/IX9GEnZLS8dTcb++ktso8rjr5fTaYr1?=
 =?us-ascii?Q?GeFNhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wcs/kNeWaqgESnfPN2fYhf/dXwswxV2qfxsyHL9npGnLyOXzR+153s1lhLcmIdoFXluE1qgzJOjZAW5aKmKf0y4q40LJQsHwLDk4qcIH/JizU6ThAwI5Fvku5jGIGKhx7PH0Sqp7BiL856AO4imDkoLgUWDngHzYpfc6JWNq2DhryYA77pBL/Q1DSkhARqGma7PzUr+cv7635/9t3+OnW7+hQyNv3FJrYMu8BanLZyFfBU75Gk0KyOGYfdt0zJTOxtfo1iQM9f3kV60hS2MrkIGi3XlZ69isZP5+rAceLdCe5F42ADAzIdOkQKGTA8T5x6DFbAAetdbX1h7+1l+oqA8b++gRgWzAtdoUcsJMZTWqdKeLkrxgi+sJ2nPassZpL5/H/qTa6EWcsjTlEZ0XcLgM7SkrdkFa9GxMJaPv9ifnRXhkC9bIPQzsPczJqClc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:25.0275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26c23ba-8542-49ce-0ec6-08de680a2159
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5686
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52457-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E3461139EA
X-Rspamd-Action: no action

From: Jai Luthra <j-luthra@ti.com>

Each CSI2 stream can be multiplexed into 32 independent streams, each
identified by its virtual channel number and data type. The incoming
data from these streams can be filtered on the basis of either the
virtual channel or the data type.

To capture this multiplexed stream, the application needs to tell
the driver how it wants to route the data. It needs to specify
which context should process which stream. This is done via the
new routing APIs.

Add ioctls to accept routing information from the application and save
that in the driver. This can be used when starting streaming on a
context to determine which route and consequently which virtual channel
it should process.

De-assert the pixel interface reset on first start_streaming() and assert
it on the last stop_streaming().

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 274 ++++++++++++------
 1 file changed, 193 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index e38b6995ca024..4d459b31cf6fb 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -143,17 +143,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
 	return container_of(sd, struct ti_csi2rx_dev, subdev);
 }
 
-static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
-	.width = 640,
-	.height = 480,
-	.code = MEDIA_BUS_FMT_UYVY8_1X16,
-	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_SRGB,
-	.ycbcr_enc = V4L2_YCBCR_ENC_601,
-	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-	.xfer_func = V4L2_XFER_FUNC_SRGB,
-};
-
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -565,10 +554,6 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
-	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
-
 	/* Negotiate pixel count from the source */
 	ti_csi2rx_request_max_ppc(csi);
 
@@ -887,34 +872,82 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct media_pad *pad;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *r;
+
+	/* Get the source pad connected to this ctx */
+	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
+	if (!pad) {
+		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
+		return -ENODEV;
+	}
+
+	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
+
+	for_each_active_route(&state->routing, r) {
+		if (r->source_pad == pad->index) {
+			ctx->stream = r->sink_stream;
+			return 0;
+		}
+	}
+
+	/* No route found for this ctx */
+	return -ENODEV;
+}
+
 static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct ti_csi2rx_ctx *curr_ctx;
 	struct v4l2_mbus_frame_desc fd;
-	struct media_pad *pad;
-	int ret, i;
+	struct media_pad *source_pad;
+	const struct ti_csi2rx_fmt *fmt;
+	int ret;
+	unsigned int i, j;
 
-	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
-	if (!pad)
+	/* Get the frame desc from source */
+	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!source_pad)
 		return -ENODEV;
 
-	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
-	if (ret)
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
+	if (ret) {
+		if (ret == -ENOIOCTLCMD) {
+			ctx->vc = 0;
+			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+			ctx->dt = fmt->csi_dt;
+		}
 		return ret;
+	}
 
 	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
 		return -EINVAL;
 
-	for (i = 0; i < fd.num_entries; i++) {
-		if (ctx->stream == fd.entry[i].stream) {
-			ctx->vc = fd.entry[i].bus.csi2.vc;
-			ctx->dt = fd.entry[i].bus.csi2.dt;
-			break;
-		}
+	for (i = 0; i < csi->num_ctx; i++) {
+		curr_ctx = &csi->ctx[i];
 
-		/* Return error if no matching stream found */
-		if (i == fd.num_entries)
-			return -EINVAL;
+		/* Capture VC 0 by default */
+		curr_ctx->vc = 0;
+
+		ret = ti_csi2rx_get_stream(curr_ctx);
+		if (ret)
+			continue;
+
+		for (j = 0; j < fd.num_entries; j++) {
+			if (curr_ctx->stream == fd.entry[j].stream) {
+				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
+				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
+				break;
+			}
+
+			/* Return error if no matching stream found */
+			if (j == fd.num_entries)
+				return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -925,8 +958,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	struct ti_csi2rx_buffer *buf;
-	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -941,35 +972,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
-	ret = ti_csi2rx_get_vc_and_dt(ctx);
-	if (ret == -ENOIOCTLCMD) {
-		ctx->vc = 0;
-		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
-		ctx->dt = fmt->csi_dt;
-	} else if (ret < 0) {
-		goto err;
-	}
-
-	ti_csi2rx_setup_shim(ctx);
-
-	ctx->sequence = 0;
-
-	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-	ret = ti_csi2rx_start_dma(ctx, buf);
-	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
-		spin_unlock_irqrestore(&dma->lock, flags);
-		goto err_pipeline;
-	}
-
-	list_move_tail(&buf->list, &dma->submitted);
-	dma->state = TI_CSI2RX_DMA_ACTIVE;
-	spin_unlock_irqrestore(&dma->lock, flags);
-
+	/* Start stream 0, we don't allow multiple streams on the source pad */
 	ret = v4l2_subdev_enable_streams(&csi->subdev,
-					 TI_CSI2RX_PAD_FIRST_SOURCE,
+					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					 BIT_U64(0));
 	if (ret)
 		goto err_dma;
@@ -978,7 +983,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_dma:
 	ti_csi2rx_stop_dma(ctx);
-err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
@@ -995,11 +999,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	video_device_pipeline_stop(&ctx->vdev);
 
-	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
-
 	ret = v4l2_subdev_disable_streams(&csi->subdev,
-					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
@@ -1046,25 +1047,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
-					   format->stream);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
 	return 0;
 }
 
-static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *state)
+static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing)
 {
-	struct v4l2_mbus_framefmt *fmt;
+	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
-	*fmt = ti_csi2rx_default_fmt;
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
-	*fmt = ti_csi2rx_default_fmt;
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
 
-	return 0;
+	if (ret)
+		return ret;
+
+	/* Only stream ID 0 allowed on source pads */
+	for (unsigned int i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_stream != 0)
+			return -EINVAL;
+	}
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+
+	return ret;
+}
+
+static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+
+	if (csi->enable_count > 0)
+		return -EBUSY;
+
+	return _ti_csi2rx_sd_set_routing(sd, state, routing);
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = routes,
+	};
+
+	/* Initialize routing to single route to the fist source pad */
+	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
 }
 
 static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
@@ -1072,15 +1132,56 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 				       u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags;
+	u64 sink_streams;
 	int ret = 0;
+	unsigned int reg;
+
+	ret = ti_csi2rx_get_stream(ctx);
+	if (ret)
+		return ret;
+
+	/* Get the VC and DT for all enabled ctx on first stream start */
+	if (!csi->enable_count) {
+		ret = ti_csi2rx_get_vc_and_dt(ctx);
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			return ret;
+
+		/* De-assert the pixel interface reset. */
+		reg = SHIM_CNTL_PIX_RST;
+		writel(reg, csi->shim + SHIM_CNTL);
+	}
+
+	ti_csi2rx_setup_shim(ctx);
+	ctx->sequence = 0;
+
+	spin_lock_irqsave(&dma->lock, flags);
+	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+
+	ret = ti_csi2rx_start_dma(ctx, buf);
+	if (ret) {
+		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return ret;
+	}
+
+	list_move_tail(&buf->list, &dma->submitted);
+	dma->state = TI_CSI2RX_DMA_ACTIVE;
+	spin_unlock_irqrestore(&dma->lock, flags);
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
-					 BIT_U64(0));
+					 sink_streams);
 	if (ret)
 		return ret;
 
@@ -1094,18 +1195,28 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 					u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret = 0;
 
+	WARN_ON(csi->enable_count == 0);
+
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+	/* assert pixel reset to prevent stale data */
+	if (csi->enable_count == 1)
+		writel(0, csi->shim + SHIM_CNTL);
+
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
-
-	if (csi->enable_count == 0)
-		return -EINVAL;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
-					  BIT_U64(0));
+					  sink_streams);
 	if (!ret)
 		--csi->enable_count;
 
@@ -1114,6 +1225,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
 	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.set_routing = ti_csi2rx_sd_set_routing,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ti_csi2rx_sd_set_fmt,
 	.enable_streams = ti_csi2rx_sd_enable_streams,
@@ -1292,7 +1404,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
 	sd->internal_ops = &ti_csi2rx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
 	sd->dev = csi->dev;
 	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
-- 
2.34.1


