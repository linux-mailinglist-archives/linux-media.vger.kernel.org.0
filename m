Return-Path: <linux-media+bounces-57005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHIeFWPOw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:00:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8323245F3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27B3A3211AC6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4FD3D3319;
	Wed, 25 Mar 2026 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="kXaR8XXD"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE13D3CFF62;
	Wed, 25 Mar 2026 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439246; cv=fail; b=dqoxDid7Dgq9AC7x5eYclvkEU5WYHkRWcKREgpcaw9/3gwwRiyeUuJ+XSwQBQV47wDWFMZBTjT5AXatcLI1gQ9ORiDj7O23aQk1GKIMATe6TB2bzpCHFH7UIdKLFd39+tLkby/uz/+eF6BJrZK5NwezdtMhziVCrnw1W9+xozMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439246; c=relaxed/simple;
	bh=xntUIrjK3u/bReHSl7fz/J2JXefI+1tc03nrf1tvTUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WA0APvrWieto9JziqhErY4ffN7rG/YMatPRYzgwBTzfoMAM1lbbFjsTewMae7jdHZHI+J6GIORgSIMEKzdlvNrBzEy18nVLGOb0CjxuPfjVPOJTLsZTkDGZQ89EWTV8yf5q8RGDidaspeAU5ojlBpBkwe9r0PeaNABgUIx9bvfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=kXaR8XXD; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdOk1om4Q8RfVIHJeJS/DUSTYFfrBodXW+3dg1tyKtdXCxJm/kZ2/3gVrQptyFm2CJy4FZL6kzRlp+A2qq8DNodgbtL7XYQBne+sE5cKk3lnKT+HOU8b1dWMiA8Rp3XB6NKz6sATVxRjNJtRAlHiOrCBRksKWo1ujBnqqmOzq0GiYyIqRXoaKgSDwUPUrvCAk7DwNkU0PmjdeMKMMuTmVpw93SmZrLkzFVs11oW1nI8p79gdZGvTjVgjqvUt2nd9WbBsnYJwXQoFB8DEVw6WX4QJba3IxGduQNzoXfY1PrhhGN7YLUFUxOGDZElOp2RWs0PrYHZH4eQ8TEW41VWS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWGGxD9O1ULfgpILKe2XqlR0z5k9AVvOzzSxsZKBOw0=;
 b=MUCTCtH4PnHlz/gXQB8auiUlQzr6kZ48OyBTDhZxVqnTVgiB7aP8pbM+i3V3QjTZSP8q02rshgMnEbvucAD14HFJb4tdZBUq2D6EjUKPZ9MxRNNS5ko/hCHjIin57JhGM3dffsWAdtWuHCBresAV2YlJR6SrQjpu+zQ+SwXS/oDR2kkiixKE8o4rD9a6BVnsM1JSP9nlk8RWDri2TjJ6mBPxLJJjHbbO9o34bG8E0+SJ+7eWIQ23nSjfv61CR6jPt4XzU7JA01hsHLDnbbf1j7Pqr4L3yKogtvFIt/rp13NYU/ekb+If76EhtmKWw+6AlUgr+axLAPZC5MX69h2AMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWGGxD9O1ULfgpILKe2XqlR0z5k9AVvOzzSxsZKBOw0=;
 b=kXaR8XXD5ah3mKpYeGwymkzIncg9rYJvkc2/dxyOEMFOadoHOZMEZ1GVJ+aGVkdQ4SHpu2zj6YXuZubk/MpQXjRw+HmGz0RfnJ4TfwWj/9DfE6w7xhbqI3K/MazHG+zWvnpYSFN6aHoWhH6wBnn5dtnhFLujxuR32UTalC3TAYkFkMkchII56K3n/lzK7uvTqwR40bQK7DgAEI218UC1xhvf4p/QcY2me1NUc/lY7MOxB6U1uIFxasE7SpVIepPeaG4NsDe26UJ3LpzSAyn4X1FQKQZNDiJ/4uMOicJOKwhnbeSCG6H0OsGOWPjfeXilEenq6zvlou+sHlzqCIhHuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4501.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:47:21 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:21 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/15] media: i2c: os05b10: split common and mode-specific init registers
Date: Wed, 25 Mar 2026 17:13:50 +0530
Message-Id: <20260325114404.95188-5-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: b44fc4fa-1d92-4e37-5cef-08de8a64466d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NiPWO6jnE+H0YlLa+Wo9MGHHoqZLSNPaYiaRQmQrr32uYg2EI0G/qKOdBReS4QSG3QlVmGec615EnvzeYUwi/hRCHGYh9vqkyeEx+ikLiTVeDkHk28+nmfTczmnwgUVvk+Mh61Xf8923Ofj290J4S1hrlM0U0psevW99KrVpDA3BIpcuAPDOoV8eQc7CPblI4ybdA8bDSsGX2/b4EugNvRsPFCAjEGHIAzgJmbw3dh0M0ii+yzjMKyZkQGGA0CsRr6ORz1scU4jusfupuxpu3rJFxWGHBcwpng8wUuwgBsbYDhRzSft5PyUzCBO13ysK52NZOjPZvaYjNUeo97WhCMGWXq8wKU+WCorN8h7zxvHY6Xq3rhij4gwGXkOYqQWXcCK2BsOwiBSie6emlm8k8ajtm6Pe2Dgc2HKWvtY5YBDLT7szR49Ca9wkuBgNRXUkAQKz9dvdB0yHDAKUKXvHRy9jWnbgX5o1/fgaFwFozUC9kAaC2BEqe/i1/PcVirAIGHg2npgpyCW/Dqo+WQzU9NN00jldldopzR3GfcIaxMh/nHxt27E8/45yfpeQ9DZddEiRMgI8ftIhDWXLAU9O1ZS47dT4eD8VCMSTrUU28HQDmWuR0jSMYS7KyK98ulHRNw0m8p3JVvgDBUfdPodW+v8o/4NOnAGB/OrWzn6J4wBbuv96/qBTWrWm7Ej/brJT+t7pU/t+bD53n2C8Uk0mDzGrk4unO+BmGW9F1Ep1zX/Bn0lsyHc4j0yQBAJGAuvHPiT9rEl30XUOheIHYhDq+I0wnTd4nT95JKyNdvksVOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BhoGjbemuerKV1POoanraVkz4dDGR3zs+jFAsaPKu6e8lk3WYOfDZrNJ8VOq?=
 =?us-ascii?Q?9d3KiiOktbZcY7VQ22m2iGucTfG0/XA80wfh8WctX2hFsYcGv2vyPqDUUvjW?=
 =?us-ascii?Q?9MtwsqSM27q2uSqVxWYyMzp1PgskSooSs/3v2K1xTHbCE1P/QPCFOs3ca3hi?=
 =?us-ascii?Q?+j8AJ0oEWMo/PpLXnIroKjWCp681ilSrp1hHJQH408tOve/AOD8IFO9Drbkp?=
 =?us-ascii?Q?ntpvPU3+cKnppcdFU5Nn1lmXk0W9CeU8yCYI9Nahff4zU38oEONDz8uW1nxf?=
 =?us-ascii?Q?Lz8COucVGjTf5eiiEQnYpBo6l5Yv5fA5s4axVh719eFSkkD3xLIBww3/CYV7?=
 =?us-ascii?Q?bTpc/6duSwmwCJvRrUzFHaDgYK+RQ0bfVI5FrjRw9V5Cp9PaKhD4ZZRPqQJs?=
 =?us-ascii?Q?MWHDuc0DdZgFYg/Mohg+arZs0+v685x5+/GYxCif+Txtd9ke9jD8Tn3re6DE?=
 =?us-ascii?Q?eyoDkGRqgyIfK9TjluC8m3rzd/6rpyLIrnWj81NHafHVearFYDuGCG4WtCD+?=
 =?us-ascii?Q?0sYgEGCaDOA8Hxo6eUPXsOYn42vXn0TQrtHqOqsbwme+6ftEknTC+9ImIPIA?=
 =?us-ascii?Q?Ae+WvK4EIO2SxLcPxtygFkzfD1f6JkgAuYSfOFYIsE03jb1WJwqPQxDUbdYZ?=
 =?us-ascii?Q?NGbxDrbFFpWshvWLlfOEk2zXCmA3kbZN3uolZUKFVNmiTM4+8mFLEUSeiuz7?=
 =?us-ascii?Q?9is6iGqmqIKVGC/cp182cfnvmKZg6HwlHY1PkFkorYX73Qv83r47vszUoHgl?=
 =?us-ascii?Q?EyNdV2XdX2+Q2KDr0VKKbST8z9/Dax/M98RvdhFYgSQ6ZCZSYGLG0FXgyGQi?=
 =?us-ascii?Q?XV78fn6GLZS107SoNXJMLloJB41wepyxAcjCr/6d1ZalRUXlGGtjfVX36ROQ?=
 =?us-ascii?Q?vAQncXGaO4RZu5XaEmlXbJGesyR+hj85q5dju6KYqJWTHfnwCl2H/zpfxITv?=
 =?us-ascii?Q?GCdx+FYx/ePcIMdNiSTOVr+x/trF8XU4ggDzVl7ABLYaCRTaYVwP4QEZKqes?=
 =?us-ascii?Q?VfvhxqgrLf5tCk/QH7w+UWzgup4CnC3nYs8YjeEI43rg7c3iQ+tA3qHDcLAc?=
 =?us-ascii?Q?8u5ExRdkJIvCoQFd/ycBq6JhEk46FO37FOEbFxozqVAJ9ZOKZTVVumtgxwsE?=
 =?us-ascii?Q?c7KF7MSd0q+UII15UTfun1inCb8NQenv6mhGlN6FgZ5g0nYQkQvzbq14E+uO?=
 =?us-ascii?Q?abzEuKsOhPX/Fnw+VEfxK4V6zq/s2qSxh+/Eb08pSKd76L1WEYpPbTdugxQU?=
 =?us-ascii?Q?zezKTSmqm+1b/rIL6hcNxv0T7ugJCWNtjUdtJl2b9w+QiIy7sxKFTqPObRfR?=
 =?us-ascii?Q?LlHEiC3pb/ZEbxZkwEGSUNgt64bxzL8oLL2Fn20wdQLcclWIv6MnPG2vL4Id?=
 =?us-ascii?Q?8/+TFHVfaDQ42DX2ukLrAdt98Oecq7QAtTKXo32bWgNbclqnxYZh0oFjZjQm?=
 =?us-ascii?Q?oinRAhE7iVFTLmmHU8ifY3U59V2+1OgqVNjioyyOB1+AU+sNgbEWOcYyIH+2?=
 =?us-ascii?Q?T0Tc+TVcI4XjsAdC0AtfivwWjZqT1O+XxKBVUV2ltOR1SsY8NXMRFOoAvy+K?=
 =?us-ascii?Q?svYFxHoLEJvs8YRJLQPajUclWEGiy82messmb53EZpkqtvWEoJKSOsGziiuO?=
 =?us-ascii?Q?LkoNq2pQ1WwmzFeEo+vrJFiGw54VI/72YWeDSyf2DNuUHFamyLTTzhFd1CmZ?=
 =?us-ascii?Q?pNqQn75KFo29TFPmHwtVjm4WUPjSIKuRm7FF/BpxU08ubUK9IjzRxqL+r/5C?=
 =?us-ascii?Q?6RoLjp8zRs3r9vhtyaDBC/CrQlKFpuA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b44fc4fa-1d92-4e37-5cef-08de8a64466d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:21.6919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHmPFZZzh3V1hHwCm7bHrMlgglFMdYO+D36Qt1RhP8ixoOHBHCRwxDTlSSr+LEJkhpoLGTdMX4V7Z45mh2aF87Fe8avyui4AvmmYsJjaOHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4501
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57005-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC8323245F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Separate common initialization registers from mode-specific settings.
Move resolution-dependent registers into a per-mode register list and
program them during stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 118 ++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 751494fdba6d..9499867ad40e 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -122,37 +122,34 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
-	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
-	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
-	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
-	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
+	{ OS05B10_REG_PLL_CTRL_01,		0x44 },
+	{ OS05B10_REG_PLL_CTRL_03,		0x02 },
+	{ OS05B10_REG_PLL_CTRL_05,		0x32 },
+	{ OS05B10_REG_PLL_CTRL_06,		0x00 },
+	{ OS05B10_REG_PLL_CTRL_25,		0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL,		0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1,		0x01 },
+	{ OS05B10_REG_DIGITAL_GAIN,		0x0400 },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT,	0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT,	0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT,		0x000020 },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
-	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
-	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
-	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
-	{ CCI_REG8(0x3610), 0x87 },
 	{ CCI_REG8(0x3611), 0x24 },
 	{ CCI_REG8(0x3614), 0x4c },
-	{ CCI_REG8(0x3620), 0x0c },
 	{ CCI_REG8(0x3632), 0x80 },
 	{ CCI_REG8(0x3633), 0x00 },
 	{ CCI_REG8(0x3636), 0xcc },
 	{ CCI_REG8(0x3637), 0x27 },
 	{ CCI_REG8(0x3660), 0x00 },
-	{ CCI_REG8(0x3662), 0x10 },
 	{ CCI_REG8(0x3665), 0x00 },
 	{ CCI_REG8(0x3666), 0x00 },
 	{ CCI_REG8(0x366a), 0x14 },
@@ -236,7 +233,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3714), 0x24 },
 	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
@@ -245,7 +241,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3730), 0xe1 },
 	{ CCI_REG8(0x3735), 0x80 },
 	{ CCI_REG8(0x3739), 0x10 },
-	{ CCI_REG8(0x373f), 0xb0 },
 	{ CCI_REG8(0x3740), 0x28 },
 	{ CCI_REG8(0x3741), 0x21 },
 	{ CCI_REG8(0x3742), 0x21 },
@@ -291,8 +286,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
 	{ CCI_REG8(0x37bb), 0x02 },
-	{ CCI_REG8(0x37bf), 0x05 },
-	{ CCI_REG8(0x37c2), 0x04 },
 	{ CCI_REG8(0x37c4), 0x11 },
 	{ CCI_REG8(0x37c5), 0x80 },
 	{ CCI_REG8(0x37c6), 0x14 },
@@ -301,7 +294,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37cd), 0x17 },
 	{ CCI_REG8(0x37ce), 0x01 },
 	{ CCI_REG8(0x37d8), 0x02 },
-	{ CCI_REG8(0x37d9), 0x08 },
 	{ CCI_REG8(0x37dc), 0x01 },
 	{ CCI_REG8(0x37e0), 0x0c },
 	{ CCI_REG8(0x37e1), 0x20 },
@@ -314,25 +306,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ OS05B10_REG_X_ADDR_START, 0x0130 },
-	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
-	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
-	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
-	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
-	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
-	{ OS05B10_REG_HTS, 0x06d0 },
-	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
-	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
-	{ OS05B10_REG_X_INC_ODD, 0x01 },
-	{ OS05B10_REG_X_INC_EVEN, 0x01 },
-	{ OS05B10_REG_Y_INC_ODD, 0x01 },
-	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ OS05B10_REG_FORMAT1, 0x88 },
-	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
@@ -342,7 +319,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3829), 0x03 },
 	{ CCI_REG8(0x382a), 0x00 },
 	{ CCI_REG8(0x382b), 0x00 },
-	{ CCI_REG8(0x3832), 0x08 },
 	{ CCI_REG8(0x3838), 0x00 },
 	{ CCI_REG8(0x3839), 0x00 },
 	{ CCI_REG8(0x383a), 0x00 },
@@ -363,26 +339,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x38a7), 0x04 },
 	{ CCI_REG8(0x38b8), 0x02 },
 	{ CCI_REG8(0x3c80), 0x3e },
-	{ CCI_REG8(0x3c86), 0x01 },
 	{ CCI_REG8(0x3c87), 0x02 },
 	{ CCI_REG8(0x389c), 0x00 },
 	{ CCI_REG8(0x3ca2), 0x0c },
 	{ CCI_REG8(0x3d85), 0x1b },
-	{ CCI_REG8(0x3d8c), 0x01 },
 	{ CCI_REG8(0x3d8d), 0xe2 },
 	{ CCI_REG8(0x3f00), 0xcb },
-	{ CCI_REG8(0x3f03), 0x08 },
 	{ CCI_REG8(0x3f9e), 0x07 },
 	{ CCI_REG8(0x3f9f), 0x04 },
 	{ CCI_REG8(0x4000), 0xf3 },
 	{ CCI_REG8(0x4002), 0x00 },
 	{ CCI_REG8(0x4003), 0x40 },
-	{ CCI_REG8(0x4008), 0x02 },
-	{ CCI_REG8(0x4009), 0x0d },
-	{ CCI_REG8(0x400a), 0x01 },
 	{ CCI_REG8(0x400b), 0x00 },
 	{ CCI_REG8(0x4040), 0x00 },
-	{ CCI_REG8(0x4041), 0x07 },
 	{ CCI_REG8(0x4090), 0x14 },
 	{ CCI_REG8(0x40b0), 0x01 },
 	{ CCI_REG8(0x40b1), 0x01 },
@@ -402,7 +371,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x4305), 0x83 },
 	{ CCI_REG8(0x4306), 0x21 },
 	{ CCI_REG8(0x430d), 0x00 },
-	{ CCI_REG8(0x4505), 0xc4 },
 	{ CCI_REG8(0x4506), 0x00 },
 	{ CCI_REG8(0x4507), 0x60 },
 	{ CCI_REG8(0x4803), 0x00 },
@@ -414,7 +382,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x481f), 0x30 },
 	{ CCI_REG8(0x4825), 0x34 },
 	{ CCI_REG8(0x4829), 0x64 },
-	{ CCI_REG8(0x4837), 0x12 },
 	{ CCI_REG8(0x484b), 0x07 },
 	{ CCI_REG8(0x4883), 0x36 },
 	{ CCI_REG8(0x4885), 0x03 },
@@ -447,6 +414,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3222), 0x03 },
 };
 
+static const struct cci_reg_sequence mode_2592_1944_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0130 },
+	{ OS05B10_REG_Y_ADDR_START,	0x0000 },
+	{ OS05B10_REG_X_ADDR_END,	0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END,	0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0798 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x12 },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -469,6 +472,11 @@ struct os05b10 {
 	u32 data_lanes;
 };
 
+struct os05b10_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
 struct os05b10_mode {
 	u32 width;
 	u32 height;
@@ -476,6 +484,7 @@ struct os05b10_mode {
 	u32 hts;
 	u32 exp;
 	u8 bpp;
+	struct os05b10_reg_list reg_list;
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -486,6 +495,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		.hts = 1744,
 		.exp = 1944,
 		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
 	},
 };
 
@@ -655,8 +668,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode;
 	int ret;
 
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
@@ -669,6 +690,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Apply customized user controls */
 	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
 	if (ret)
-- 
2.34.1


