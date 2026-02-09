Return-Path: <linux-media+bounces-52450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NS0M7opimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:38:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33B113A35
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F9B43061769
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F6531ED6C;
	Mon,  9 Feb 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dM1VQ9XV"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934232ED40;
	Mon,  9 Feb 2026 18:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662143; cv=fail; b=WW8i8TsfESzewZQt8uiqyqjuJl5KJRqaoEzMHNrK8wpAKHMc+LCkczes9KfofjNyl5epZN/7hBumOLC5Fsw4MRz4BzuZgEz0rv4vm7rBI5tft9F7kvCitedcSbQDzNFE2rTf9Ho8GoGcHFNAr9evlZ9eIwLlJIsriPrb6g2NoZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662143; c=relaxed/simple;
	bh=qF2A83H4fo9K/1+ksb8uCXW6bgG3KPEz30g2DFtGrt0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7hGRQR+tTLp20XP5HD1RPIKnSSnKDsnKjo1zDxhB9xdG5EO2+iuFyJhZ+UpfKvDivFEbNc0nqFzrA9gEJlbFF1MDJYtyq8eTm4/0CtwiTIalpQRUvm5OSoRhs8Pkl5oOzUryKDrU0mW0y4UTfUKNV2Wl/LhVDrtSxfOIKO40rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dM1VQ9XV; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnBS9KjgCLj7LCWZWaEIrfQCmhmrXFX2ri7ka7YCLWTwqJo0xDaSCjM7m48BtWwiSqr7reAqlanaJ2HOUFRo7vJ0nVaSfBqxHe3j1Vyv70rx4YlJwRoLIsnE82MmNkHarKKzBkR+scsXPO9KrP2WYe0LB4KyArS4N6oFxwnZpv3dbFxjqh07Im/+bKkOx7BYJC9aafLwDdUM5RZVRVrHmCuvSijmuXa0JSu9lIoUF8miquzp+26BVAMlpAqNoFaF6SXaXmmBRCtknyioYw0zU53hpp2yrmnmArfoPH0+k++3XnOd+Xfeo2bbPzh6NDLzv4nqnGHaB0Jf9VBi7o9frA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCDwgkNDFF8XHj5UxRrRs2Nb4tse2yapt+b6Y4UFNFM=;
 b=pJP9DUs8kPYUhk1BTPSvUDqzVs77MeLgEznob+0h1OGHocB3nZatkcRZLOnv+SZJp1Tgf7uqScjMS5kH2Lc8rbIFsQ71HiaZl6mKwF6kOI8pO+z2D5DkCWGRTB46uC8iR3r429VYB2IFHXmlSdXlFKGbWyQN7WltSB07XKGBLLbvO0Av1n2X2KfZI8nZxHziyLDiFGO59vPugF+UmfmXX90Cyh2TezlMPmT1Fj4XjWsmj+iALUbb9Be4WTtUecexfeNhwJvjZmdfhS0jGOJczS+awWOEIOQvrMaXW8fPQDoLBoDT6ykkOMptMyy+KnUrfQG4bx30vPvGhiBkLDqlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCDwgkNDFF8XHj5UxRrRs2Nb4tse2yapt+b6Y4UFNFM=;
 b=dM1VQ9XVp64R3rIs1pWskav4mG5ZYIqPv8+aLNlYXP7hzKq31bIeKNQoOdzTwq+tkA+trlVYVeDebKDEQAGhMIffgbm81tbYL1/uIuAvftaPIQbzL1YOCSyIOnuXnHHj/m2NzfQJUD6OYvDn3jAU4t/bjAb9zmPxR0sxslpBGfk=
Received: from MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::23)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:35:39 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::e1) by MW4P222CA0018.outlook.office365.com
 (2603:10b6:303:114::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:35:39 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:36 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:35:36 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt12052904;
	Mon, 9 Feb 2026 12:35:30 -0600
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
Subject: [PATCH v11 05/17] media: ti: j721e-csi2rx: allocate DMA channel based on context index
Date: Tue, 10 Feb 2026 00:04:44 +0530
Message-ID: <20260209183456.1906327-6-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a8f134-f10b-41bd-4081-08de680a0610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8RN2617Aps2Pudv1N5ebqeWGWd9Um4Ca+3Y6n4WQpT9cJNh//aoWUgC2UTRz?=
 =?us-ascii?Q?m1b8HR2PS+QB5L5INUH/t9OQOi7BPva5ZcsCqWNuMuu3XR8Ml47jvE2vDUUd?=
 =?us-ascii?Q?cQOSXbWIiScjLaK+eD2MleecUW2hImyKYEBViZ66mTAr2kjBqq/Exu0In7Zg?=
 =?us-ascii?Q?SRXt44xSneZoWOwE6DxNOzniH0UanqqcColpub8V+NX06bUzBdl3d8L05bW6?=
 =?us-ascii?Q?7drc91XP5w8NlVdu2z9zqHQlkKpVGGIBW2GA6nCAzCneCJWiJ/K+suljbrZc?=
 =?us-ascii?Q?g04UzyBMxAXJurky1bORvmGYjqBBOsvrDpLX5mH9dvtyMU39Pk3mQRKo7aup?=
 =?us-ascii?Q?pxoIEXOA0Fec2ABhR8Xwx9qhQc84TPGH2naFMOURzDU5Uo5j8JGkPS8tYHdU?=
 =?us-ascii?Q?W1BIA+Kqd97k5mLhhDdPMzXXxnbYiCNfR52bDHyG/U+GI3JXfXvSCxdtlmwo?=
 =?us-ascii?Q?SyzykZAh7S8x9XgAuNyBE3SRWZyds8Br2sZc9ngBRBwK0Oy/3ndhM9TOeGYq?=
 =?us-ascii?Q?SonAPdUTdp+toQoShKhYrI4Ny2TDBSALFkIwv/PY1sNSWijejEAh8jXL8MQX?=
 =?us-ascii?Q?xZm8Qa8Tsr1eQ9fYB1fGO50AacRjzqPR2c092iisAYt/XOU/4QvMiKLO/th2?=
 =?us-ascii?Q?g7+Oq4P8TGgPjYauYFhUObQ7bh2CJDNluQBW3Olb9CSoDsXWArz3z/frvINe?=
 =?us-ascii?Q?/LS1n7qW9i8MAE+LEFOlSEzCDwRbtietO8cIa/+9Vdck1Nth2jo/aXx0V5ZG?=
 =?us-ascii?Q?Jk8f7A8AfSMqXC1zkcsIxPmhbQgqTlvJ/B0IZmAJGUi4qcl2Osf0pNFdAnZy?=
 =?us-ascii?Q?dOLwn1nDorqwFhgCT3Tqgph8tAlk/9EvW/SGnLn1It/EU77EsxoU28WOqevL?=
 =?us-ascii?Q?8o8YAREGKk60dChxNOTBg4t9t5JpXUZcqWUJw4LBuMkmCKpq5PR1E5/LbKkg?=
 =?us-ascii?Q?9r7u8JSM+1u2CFsEnVF0FS9YcyWlH/3s3XBjUhJbzDRcNHigNbQ4R5GT2AeI?=
 =?us-ascii?Q?vbO7VntJV7mhj4cXycreE0vbVgpgrfXYR+I6qzmyUDt0LSn1WSX9jqjRGptS?=
 =?us-ascii?Q?fUHDP/gY5FWGSa7tnXqfp7W9eJlWBHfDK6JQjwqfIlZxcsu1PupA8n5AEYs2?=
 =?us-ascii?Q?RhAK9YFgZ1eoZsxTWMJ4cNH+mc8WICd6qd/Nly8LB544jg23OUZEOUwGByeR?=
 =?us-ascii?Q?vl/n1Pep/K2YJjAk/4u6BBuy2tZgz3BMvboYzLyOBwEu2ZUajOh054yaH5Va?=
 =?us-ascii?Q?K01JcKNSmENn4SSqDDLnXDDGyOwMZGjsTrIQfg8aeGhsI7IIaqE8SXEBg20Y?=
 =?us-ascii?Q?/jnAwo9Y0R64q2nh0YUcdoijD08vEtQrDbeL/5ut3K5dafq5gxA2hsvPK5ES?=
 =?us-ascii?Q?vCdzCqCf+dQHnO4rUMzFsXhvKK3FsN5z5waqePvb3PukmWF+Ep6eB7yaOqN0?=
 =?us-ascii?Q?8gP3PlUkf3VewiCac7aMScvRV5zJuntp8zCl38A3Uyxe4eag44ScBtDNNvaN?=
 =?us-ascii?Q?aTvreNhi4tTdEc4S9i2aMLc95qeGITpFmqKUCMGjBUYZj9Sms9bjnEqzhSDA?=
 =?us-ascii?Q?q7VVtBuv4V3BZoCMhyu/EEs62g2jbLkPGFwSnIFqkuBsrFSLx/f33qwhauJ7?=
 =?us-ascii?Q?3ae8BzxsjO6/mgQcvUF80u/gWVR1MwGLix4xYQ9t/psqOUADxHhZXPZLmhWX?=
 =?us-ascii?Q?FZpMGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C/j711/LFpaU7pVi9yCZe02Kw1VhX/YTb9iiisDSgDN9BPn9nmkWAg03LWJk4fOu1cHoUuf4k6pLYvN4PYaUaQs2C4lShTtQFTGoO5QHelnmevldn9uWoam79LGHtKKzmyHQmHdx431C2p+uFvoCO0lYVZtRcpblQMkLMj7yOqUdOB6q/aT8dR+fuRt6EL8xUqD6eYJO/I1EoDb7nT0BfWVl01xQvAJ5rPG/Cou0Bb96XKv6qVEVQUBIERmMHWE1d7oR2PcZL+Yg29b/gMAsUdCC8yRZ/tZIrr352nhM3rxMFMNUCg1E0h8XijGmf/T7ehEYY0AGhOjAMn5TlJcL/PWJLa9jTB7JwBxwK45uu8e4IGpP7EvH9pxacNp6/UHdD+J0Uk5lQR3s8pDi25ehMqa2xS2bDbnRWqqyphninMq6qIgWVxJUfUrvuk+4bNdn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:39.2494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a8f134-f10b-41bd-4081-08de680a0610
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52450-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2F33B113A35
X-Rspamd-Action: no action

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
index 4adfae425f192..c781b312cea82 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1036,9 +1036,11 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
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


