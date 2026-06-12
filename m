Return-Path: <linux-media+bounces-64729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IfBZCy1dLGq3PwQAu9opvQ
	(envelope-from <linux-media+bounces-64729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:25:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB767BF97
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Lq8R89VB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64729-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64729-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF6183121D89
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305EF3A8732;
	Fri, 12 Jun 2026 19:25:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3693988FB;
	Fri, 12 Jun 2026 19:25:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292325; cv=fail; b=EeSshrAr8+BdiGJSw8XxdR/OkCgNNCkNQ5WnMP6T39+6LwEHy4Qf9HfUpZ7Ti3IvhqPk3qEyr3LqDRJ7IMluMuT2D2RR/IbHkHr8zqrCxZfzorWEWnngzVzdDu0eLEozy5cAe4xC1Ws5Wdhxuy7iJ2+QvY47ook1TEN68h/rzww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292325; c=relaxed/simple;
	bh=wLjW3Q+JCY79bv7hcWjwIhkLM6ydObwjGjJTeFqrU2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qGmb96M9+AzcieTwqEEg6xJ3wtjAv8xTn2YGDXHvoHAX8oi0jWKW4ciNXT095IwwuRmEi6GwRBaKAKxtJrz8TOpdXAYKimxrZm7GppZBp1JQahCOAmAyrmzwqbc0+VvrQXLpK4ZXRwyDNxUOuIsMVTO0SyDAAYxKJZ6L8vdaf3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lq8R89VB; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI/y3ydl6VS7WMFwcz9l1o4YL74/QVnwa5RQeRQVjjy2L3/r5twA6+ta5m+Oxyq7dhZ9Sf9tWgXicquU5xo0NdgX1GxQl/nxfogTutvOu+N7TgCNSyf7+Pm7MvJ3wD+Jfk5LW+FyfYy3/q7O82JCtkEOK74qVEXOoXGsR3P05fLefQywcdXGWHI1nxz+T+JqxmAyI+JlQcr4cFIi4rqoNaga1DT4Z6NBrVt76W44Yu+Gnj51JyH1bVy+XMK4vtkl2y2SPPrYJkKMrS2fjMcYnA2cC1bx6bUlaZF/RJBO2GIN1Zf4sA6kb/KonaQ8Hm+FGHqVtIJU5g8qoU7o/Q5ITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6tLCx/t085+MmwTOhdNqA6qmBHD7UqscZC/VZlCQXM=;
 b=lRYGr06gbM0GEC7BQxed74ULsHlPLMEVxvNZZBjQGCyuMLRdgM47mIoP8BvbROCuxgkvc4bqolJGagdUPsRn7Fo0kxA3fwjJ/TgDnhOTgQuA576ntTJjFWdfAKWwH2EVFhddioBr31KAqc8KEOkiHTumoS8ZgTbjH0GVhfm0daZ4n7SHIP+s0sCEwH4kkhoE3MdGySnDWVoHKB6Ww/yrOvPu5wMqa8RgSN9XpVyw8vK0RZsrv/TkG9KRURC6F/A9ZeTTiB2GxnVVb000IaqM27SzmRZWYxj16U+ifjQnlMcLn/+w0/vozMmTbpwwlxh76J0ZModK+gziauju5v2NPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6tLCx/t085+MmwTOhdNqA6qmBHD7UqscZC/VZlCQXM=;
 b=Lq8R89VB5PjP4+/6IwesGexngWro5pyC9GqGM4/ZL83kxURXmCxQfMawIQDN4RVRFRSETraCSdv98tIl3yRQOyh78GYEkmDE2bVBbPiTgDdEi0vUevTvd40NSyZwqixUGYCyT04N/e3Z1m7DhiVwTw3LPcE3dgbVQqdXvtX5pX8untN2xffFfs49LuB0PJURpmQ5cGKRoJ7XBKZnrY7LVEK8X0UGU2F+C2TpAVeCtRmlvKo5RbTaU59ej7PNCTPrX+8bBwOv82W/8BArBiHRj4BWyAZmHff5KArdtRQhQDlimDJ2N1I8+fXRlNIANRWQr4g043Ce4b6FgX1dl4o4fA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11849.eurprd04.prod.outlook.com (2603:10a6:150:2de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 19:25:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:25:16 +0000
Date: Fri, 12 Jun 2026 14:25:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michael.riesch@collabora.com,
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com, geert@linux-m68k.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 6/8] media: platform: Add NXP Neoisp Image Signal
 Processor
Message-ID: <aixdEPsghlc2S7Zl@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-7-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-7-antoine.bouyer@nxp.com>
X-ClientProxiedBy: SA9PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:806:22::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5996b679-bc49-423e-3e2e-08dec8b8552e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
 HgVy9ssnxdYsHtipqKhm+0Iit3uZkYP1VYnVyBanGFfdN0FUQeZxwbv4Tam4FnxuNgkvUl07ioqSKFZTSJyN31eccFoqh9vwvJ30jP+bl3CJtNgNmYQ6mm4/JAPcEtKlCRfEz2g36J/OAQjK8Qhwp3OJ/6+mgCw0yuWHlGfREMdnIA38kHAfR3SvwCbnwEHCyffMFNkAisgXkv5CK+6cy0WxN2EOcHrIoxO/olGJnT+WshL73Uic8Y8eNNNhmau6hQiBoJZshfehUNwDngT2YR9qTGlIv9rH7HEZ8EHahl5TOefQWiOc3xO/l2dUAYS6K6lnst/DXrdYAGy/6WBaT0IY9ifCOZShb4iQzd/drdFBT9fohyVGg/jXRk5T/1jEGi25lUNNHH+IcyDnFlo9lrLJTytR/O5mFsIF9lZguqHRHwKl9ZFgLJZWp+RCByfmu5RqPViJ+AOjjPJ7EazTxwMfVxDhHwaRbs28PDAQ49qXqVvwlKCf3DDQY/SnQnLrzZF0JpRsu3zwzgi23/yyoVsToI6X2Bt66NnqWNQeRdpBfkK4ZNXsww5Gq0RmI/OEori71kplHofFlHJtkqJ4q/Rp/KQXyRtv+sqQw6NY5uA0tcTsjeD8kH3CMlC6o2BYaPeb/j4NPXKlZ/qj5JC/2D/A3imN28beiVEWViawiLdE+gn723S7GtDvOM22bCM4
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VE05UL3hSNc2xzCHSnrxI4JTGh4Meqc4MlLcT2lYa85YyDaNT0nV/Rl09KI5?=
 =?us-ascii?Q?6CLbelubXgAbWIxHGgSF9XCEtK4UVMJWARqdyShPjYtmH2DYlbJV0GuvjhsA?=
 =?us-ascii?Q?U13CS8bUPwwWAY3fg2o4z51izIgALzj/rjBg3iiFE8chFPF/fNEHe5g3zxca?=
 =?us-ascii?Q?PWxYh0lWfkvX9CsG4FiUD4pU8NykSviGBGD2zSOidM0Dtd/QT9qVdDH+f6Pq?=
 =?us-ascii?Q?l1r5A/ppR7u+/UPAIYQdjC8k3vEOhWSGWLqMgXW8YQxvkyWXT+6rV+7W7SH2?=
 =?us-ascii?Q?EUF53LpS9zK5mksVVMVFSFtsnpy8DmsvBsTspctMORMI7qRBVxVh8HYKqSBG?=
 =?us-ascii?Q?wWVhlg/aT0/MXBP8zOl/7uSef2jcmrE5PKPkCGgXVz58++IY3m4BXXlPbjLu?=
 =?us-ascii?Q?4uaRC+FttXuc0MHUuc/WiKCCdft/CGaNgOXOsSmvj0tX6vlFSUv6TyHNAw/x?=
 =?us-ascii?Q?ExyMKNufTg8zF5XngOI3s7OcgZwDbOwaOorKrZvCgQJqGT/lv2StyBy1GZMX?=
 =?us-ascii?Q?JrkH+Yo5QP7HCKIfJFXAc3b+OC1O4elnkfCij+HJmwfamxskwYJ5JF7mm7y9?=
 =?us-ascii?Q?wYdHyGKcJe7ezZv2N2Ep6L2k2M1WfwmpqgpJi3e2WN+7PsHqKB4d++lqg4R3?=
 =?us-ascii?Q?HDnyfOofcZCtyu2n6ecoExF/XeNl2MVtAc8R+0IklxHkQ4syMJb/CqxMbLn5?=
 =?us-ascii?Q?VOKvqyPm/CAj/xp+aogaA265lNcbMnDNxWY4yf239uZ51s+J+NpPn+jb2uEf?=
 =?us-ascii?Q?xCRnDK31VDjRgTU2EFk707YWNh1s8LxDyyyVCGrsesfZO+8gdgaa3u6H8Zk8?=
 =?us-ascii?Q?00xIk8HYnv0B7CF+BOc0sQdUeEYjVbYwgEO3NOgzcLk2s/k1EpnAjrenbk7T?=
 =?us-ascii?Q?qC5DgJxSPjOZbkActClh0gmdwQ63qaPv/JgsGCy++kzYmexQNbCuHdabzaeF?=
 =?us-ascii?Q?9y6ibbfs2DS8GMtDkFK3qWWt6UHVr6aH8DJTmX62u5PXdD61gY7I41MVjdrp?=
 =?us-ascii?Q?VXAKwIAkkwtBvd+lpH3eHMRsUfCQJZATvgNoFrD+zurtQqekoD4CneTs6uZD?=
 =?us-ascii?Q?pJKGMCtXaVZSOVyspH1OZFwcwDbnC577eQfBQMpsAOUmUX4iiEGvE3l81RGv?=
 =?us-ascii?Q?ff3gHHbkAytiHeDiJ63Uaamulk32kVmno7Z1cZeUZ+a1rJ79RnmRnIDRzm33?=
 =?us-ascii?Q?Tr/T4oWtlJLQJOPs8OX8iRjNmMqbtFJ66jKV1pfaU47SLRCkz9lWb9VDvJX0?=
 =?us-ascii?Q?C9mrniGwfIrvr+b3juZNEwSOXsrFMzXTc71N70T03sXxA1TfNfuoUVx4ev9V?=
 =?us-ascii?Q?yWhhFCx54eVt/dPFcqZSLo3KqQsvs74ibeks7iT2jliaceYom7/t+1I83c9d?=
 =?us-ascii?Q?1d40M1/tsDpVoZoa+IMUDBSgrItxzOL/5FHwjGdA1rFp7tD+HOoGeU2ylr09?=
 =?us-ascii?Q?D634rHFAIo+S9sMcIsHZUky/fE9AI06gzZXSsA6uSnUJUTAMCsxb1lIFZK/l?=
 =?us-ascii?Q?L2ChS3mB8kstBggM7YF1i75WwuTB8QPqLM9wG2Ai519L1QW+2BSoc/KIt//e?=
 =?us-ascii?Q?b5PXMomHEfJBK1YHLOaaSfx/Se11SVBAgVl8RSKOv+n5oVy/kjLzM8+IklkH?=
 =?us-ascii?Q?hJwfTT7enPU/xntBVmR6ZwR68qRyToLzMq/yEagkiUXX/UOmt4Bq2+XoxwCA?=
 =?us-ascii?Q?EqlfXVZ/YBTMMjHwLadGaWHDbe/no7XwHgxSqfTPXY7odsP7sboCOWKTg2tt?=
 =?us-ascii?Q?Yv3LKYMzedBUfS5Dz5g1kMGPq3MWtuzDzS7GpgIz3rcuWLBgQOqO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5996b679-bc49-423e-3e2e-08dec8b8552e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:25:16.4740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOIpxb/IiKfbU/CmDXBI4C7qkFdTwdjiSNGiCfrQ/BUXo7ZyXwT0yE9saBfKaVvoIQ18QP/hqq1eTCcYJyiQRMAbx0xdb+ACKjWuBjUhlLMsym79lCO5ipNxOAIDtgh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11849
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64729-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:antoine.bouyer@nxp.com,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FFB767BF97

On Fri, Jun 12, 2026 at 03:20:37PM +0200, Antoine Bouyer wrote:
> First NXP neoisp driver version with the following contents:
>
> This driver was initially inspired from raspberrypi pisp_be driver. It
> reuses same approach for ISP job scheduling.
>
> The Neoisp driver supports:
> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> * Monochrome sensors input.
> * RGB/YUV, IR and Greyscale output formats.
>
> The neoisp features are:
> * Provides single context to limit amount of v4l2 devices.
> * Supports M2M operations.
> * Support SDR and HDR modes.
> * Supports generic v4l2-isp framework for extensible Parameters and
> Statistics buffers.
> * Provides a `core_media_register` API to register neoisp's media entities
> into another media graph.
> * A module parameter to run in standalone mode with its own media device.
>
> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
...
>
> +MEDIA DRIVERS FOR NXP NEOISP
> +M:	Antoine Bouyer <antoine.bouyer@nxp.com>
> +S:	Maintained
> +F:	Documentation/admin-guide/media/nxp-neoisp*
> +F:	Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> +F:  Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst

Use tab.

> +F:	drivers/media/platform/nxp/neoisp/*
> +F:	include/uapi/linux/media/nxp/nxp_neoisp.h
> +
...
> +#define NEOISP_MIN_H			64U
> +#define NEOISP_MAX_W			4096U
> +#define NEOISP_MAX_H			4096U
> +#define NEOISP_MAX_BPP			4U
> +#define NEOISP_ALIGN_W			3
> +#define NEOISP_ALIGN_H			3
> +#define NEOISP_DEF_W			640U
> +#define NEOISP_DEF_H			480U

look like needn't "U" for these const.

> +
> +#define NEOISP_SUSPEND_TIMEOUT_MS	500
> +
...
> +
> +/*
> + * Extract offset and size in bytes from memory region map
> + */
> +static inline void get_offsize(enum isp_block_map_e map, u32 *offset, u32 *size)

Needn't inline. check others, compiler will auto do it and also find unused
function if no inline.

> +{
> +	*offset = ISP_GET_OFF(map);
> +	*size = ISP_GET_SZ(map);
> +}
> +
...
> +
> +static const struct v4l2_frmsize_stepwise neoisp_frmsize_stepwise = {
> +	.min_width = NEOISP_MIN_W,
> +	.min_height = NEOISP_MIN_H,
> +	.max_width = NEOISP_MAX_W,
> +	.max_height = NEOISP_MAX_H,
> +	.step_width = 1UL << NEOISP_ALIGN_W,
> +	.step_height = 1UL << NEOISP_ALIGN_H,
> +};

why put this into neoisp_fmt.h? if two c file include it, these data will
be duplicated

...
> +		bit = NEO_PIPE_CONF_SOFT_RESET_HARD_RESET;
> +
> +	neoisp_wr(neoispd, NEO_PIPE_CONF_SOFT_RESET, bit);
> +
> +	/* Wait for auto-clear */
> +	do {
> +		usleep_range(1, 2);
> +		val = neoisp_rd(neoispd, NEO_PIPE_CONF_SOFT_RESET);
> +		count--;
> +	} while ((val & bit) && count);

Use read_poll_timeout()

> +
> +	if (val & bit)
> +		dev_warn(neoispd->dev, "%s reset incomplete\n",
> +			 is_hw ? "hw" : "sw");
> +}
...
> +		/*
> +		 * Take a copy of streaming_map: nodes activated after this
> +		 * point are ignored when preparing this job
> +		 */
> +		streaming_map = neoispd->streaming_map;
> +	}
> +
> +	job = kzalloc(sizeof(*job), GFP_KERNEL);

use kzalloc_obj()

> +	if (!job)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < NEOISP_NODES_COUNT; i++) {
...
> +static irqreturn_t neoisp_irq_handler(int irq, void *dev_id)
> +{
> +	struct neoisp_dev_s *neoispd = (struct neoisp_dev_s *)dev_id;
> +	struct neoisp_buffer_s **buf = neoispd->queued_job.buf;
> +	u64 ts = ktime_get_ns();
> +	u32 irq_status = 0;
> +	u32 irq_clear = 0;
> +	bool done = false;
> +	int i;
> +
> +	irq_status = neoisp_rd(neoispd, NEO_PIPE_CONF_INT_STAT0);
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FS1) {
> +		dev_dbg(neoispd->dev, "Neo IRQ FS1 !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FS1;
> +		done = false;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FS2) {
> +		dev_dbg(neoispd->dev, "Neo IRQ FS2 !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FS2;
> +		done = false;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FD1) {
> +		dev_dbg(neoispd->dev, "Neo IRQ FD1 !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FD1;
> +		done = false;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_STATD) {
> +		dev_dbg(neoispd->dev, "Neo IRQ STATD !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_STATD;
> +		done = false;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_DRCD) {
> +		dev_dbg(neoispd->dev, "Neo IRQ DRCD !\n");
> +		neoisp_ctx_get_stats(neoispd, buf[NEOISP_STATS_NODE]);
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_DRCD;
> +		done = false;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_BUS_ERR) {
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_BUS_ERR;
> +		dev_err(neoispd->dev, "Neo IRQ BUS ERR!\n");
> +		done = true;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_TRIG_ERR) {
> +		dev_err(neoispd->dev, "Neo IRQ TRIG ERR !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_TRIG_ERR;
> +		done = true;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_CSI_TERR) {
> +		dev_err(neoispd->dev, "Neo IRQ TRIG CSI Trigger ERR !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_CSI_TERR;
> +		done = true;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FD2) {
> +		dev_dbg(neoispd->dev, "Neo IRQ FD2 !\n");
> +		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FD2;
> +		done = true;
> +	}
> +
> +	if (irq_status & NEO_PIPE_CONF_INT_STAT0_BUSY)
> +		dev_err(neoispd->dev, "Neo is busy !\n");
> +
> +	neoisp_wr(neoispd, NEO_PIPE_CONF_INT_STAT0, irq_clear);

Did you share irq with other device?

you can use directly
	neoisp_wr(neoispd, NEO_PIPE_CONF_INT_STAT0, irq_status);

and if there are unexpected irq happen, which is not in your check list,
it will cause irq storm.

	so need more if block

	just

	if (irq_status & (NEO_PIPE_CONF_INT_STAT0_S_BUS_ER | irq_status & NEO_PIPE_CONF_INT_STAT0_S_BUS_ER ...)
		done = true;

default done is falue.

> +
> +	if (done) {
> +		for (i = 0; i < NEOISP_NODES_COUNT; i++) {
> +			if (!buf[i])
> +				continue;
> +
> +			buf[i]->vb.sequence = neoispd->frame_sequence;
> +			buf[i]->vb.vb2_buf.timestamp = ts;
> +			vb2_buffer_done(&buf[i]->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +			/* To prevent double buffer handling in case of spurius interrupt */
> +			buf[i] = NULL;
> +		}
> +		/* Update frame_sequence */
> +		neoispd->frame_sequence++;
> +		/* Check if there's more to do before going to sleep */
> +		neoisp_schedule(neoispd, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
...
> +static int neoisp_init_node(struct neoisp_dev_s *neoispd, u32 id)
> +{
> +	bool output = node_desc_is_output(&node_desc[id]);
> +	struct neoisp_node_s *node = &neoispd->node[id];
> +	struct media_entity *entity = &node->vfd.entity;
> +	struct media_pad *mpad;
> +	struct video_device *vdev = &node->vfd;
> +	struct vb2_queue *q = &node->queue;
> +	int ret;

please try keep revise christmas tree order for nice look.

> +
> +	node->id = id;
> +	node->neoisp = neoispd;
> +	node->buf_type = node_desc[id].buf_type;
> +
...
> +{
> +	struct v4l2_device *v4l2_dev = &neoispd->v4l2_dev;
> +	u32 num_registered = 0;
> +	int ret;
> +
> +	mutex_init(&neoispd->queue_lock);

suppose this function call from probe, so you can use devm_mutex_init()

> +
> +	/* Register v4l2_device and media_device */
> +	v4l2_dev->mdev = mdev;
> +	strscpy(v4l2_dev->name, NEOISP_NAME, sizeof(v4l2_dev->name));
...
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to request irq: %d\n", ret);
> +		goto err_irq;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(dev, NEOISP_SUSPEND_TIMEOUT_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);

devm_pm_runtime_enable();

> +	ret = pm_runtime_resume_and_get(dev);

you can use below code now, needn't goto branch

	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
		return -ENXIO;


> +	if (ret < 0) {
> +		dev_err(dev, "Unable to resume the device: %d\n", ret);
> +		goto err_pm_runtime_disable;
> +	}
> +
> +	ret = neoisp_init_devices(neoispd);
> +	if (ret)
> +		goto err_pm_runtime_suspend;
> +
> +	spin_lock_init(&neoispd->hw_lock);
> +	neoisp_init_hw(neoispd);
> +	neoisp_set_default_context(neoispd);
> +
> +	pm_runtime_mark_last_busy(dev);

Needn't call this now

> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +
> +err_pm_runtime_suspend:
> +	pm_runtime_put(dev);
> +err_pm_runtime_disable:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +err_irq:
> +	dev_err(dev, "probe: error %d\n", ret);
> +	return ret;
> +}
> +
> +static void neoisp_remove(struct platform_device *pdev)
> +{
> +	struct neoisp_dev_s *neoispd = platform_get_drvdata(pdev);
> +
> +	neoisp_destroy_devices(neoispd);
> +
> +	if (standalone_mdev)
> +		media_device_cleanup(&neoispd->mdev);
> +
> +	pm_runtime_dont_use_autosuspend(neoispd->dev);
> +	pm_runtime_disable(neoispd->dev);
> +}
> +
> +static int __maybe_unused neoisp_runtime_suspend(struct device *dev)

Needn't __maybe now

> +{
> +	struct neoisp_dev_s *neoispd = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(neoispd->num_clks, neoispd->clks);
> +
> +	return 0;
> +}
> +
...
> +
> +static const struct dev_pm_ops neoisp_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(neoisp_pm_suspend, neoisp_pm_resume)
> +	SET_RUNTIME_PM_OPS(neoisp_runtime_suspend, neoisp_runtime_resume, NULL)

Use new macro
RUNTIME_PM_OPS

> +};
> +
...
> +
> +static struct platform_driver neoisp_driver = {
> +	.probe  = neoisp_probe,
> +	.remove = neoisp_remove,
> +	.driver = {
> +		.name = NEOISP_NAME,
> +		.pm = &neoisp_pm,

pm_ptr(&neoisp_pm)

> +		.of_match_table = neoisp_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(neoisp_driver);
> +
> +MODULE_DESCRIPTION("NXP NEOISP Hardware");
> +MODULE_AUTHOR("Antoine Bouyer <antoine.bouyer@nxp.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_nodes.h b/drivers/media/platform/nxp/neoisp/neoisp_nodes.h
> new file mode 100644
> index 000000000000..54986fe13b33
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_nodes.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * NEOISP nodes description
> + *
> + * Copyright 2023-2026 NXP
> + */
> +
> +#ifndef __NXP_NEOISP_NODES_H
> +#define __NXP_NEOISP_NODES_H
> +
> +#include <linux/videodev2.h>
> +
> +#include "neoisp.h"
> +
> +static const struct neoisp_node_desc_s node_desc[NEOISP_NODES_COUNT] = {

These const data should not appear in header files.

Frank
>

