Return-Path: <linux-media+bounces-65583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U/NSNpYxPGq3lAgAu9opvQ
	(envelope-from <linux-media+bounces-65583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:35:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288F6C111D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=BO3TE5ol;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65583-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65583-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC43303D70F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C020B33A70F;
	Wed, 24 Jun 2026 19:35:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3903321C2;
	Wed, 24 Jun 2026 19:35:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329734; cv=fail; b=L1uzIbvthdoLAeAtz1yQYEuKpDZluuPPspMh4wczyBxp0pOmxv58rsW4AwSZprkBNmV3BumCmHGUu1EOhfMgqVa+8uAZ/LEzhKykiXPLbL2SzvyODxJtBzn6KSv/BHA1fku3Wf+C5MszJA7lCJwYdHgsSjY8w2ouXB6fOTpGDPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329734; c=relaxed/simple;
	bh=YFBy97KlhoMIheTGp5QgVdgoDAahIYHJc/cLKgW77Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=De/IELRqlI329lM8bl/btaZXW//3rvFEPkL/6//6hKLkw4LLZfB9Xfxv+As4NO6zCIkeBV6RlZZTnsztWI0NFAi0u3vDrQdjasg5zMv4BDUl4yvu9NxxnP1XmzNJMPunvJguQ6Tu601533kd7L5VDYKTbGKMiC7r3KknBif/50A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BO3TE5ol; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAkaoxqPuDWBY6k6PJb7DrvKZe2ivtmqA5y1ammkatCd5unuObIWSkLGwlXnpTdRLHvSp1JPGUFRGxla6JtxbJHaNoRBmCL8ZOP3FxPGQRRLLXi0YeDvnKgmyV3tbwDJqWhpRK/2KO5dP1uHUIfOQ3881Jp9Q1+HX4UB4HkwC8QEnIimbKuuhkjknw37ztElx+XD/GMcc2l2gNo8BKLM4pbP0yZPAVhCugrLpCcqVQjz5sSEehtXjs1DHLrpvjcdj4+r1qQFrE8jpoJ0RLs7oaJCFG/pboq5VhdkSdLjy7vZjnmT7zUhW1wYwNYMmArC/eLpGe2OiEEJ9VWC8BSB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX4mzbkwHpQcX0iN0ItjqIUqp0U++/AaIjQAStqS6sQ=;
 b=VM5ShfwaacgM77U8HTM/w+GdOj5n6zUWuKL/nS38D/9+ZBWhhUikcIyNSRz3ztV5gpl2H48JwQdVte9thN0xlKo4iIb0Fds0HPr52qrcfLBnSvb3MicfR/QN7IFJOUR833Z1Z2ktgDbLRwYQVpqKEY89oeTmInsZdKaWXTpq+BH23SLR9Xf2A6jUSZd6mhadXsV1whJM6jR1XekEXj4IBtFZzYZGJ8BBG0Hc9ipvOsL4Hhl5W1+ughrQxlwIR9XfVCbX5NaDpp2vz2akCyl1bMcjaxfv3itjPxiaSFONpmzmoFgN1r6GkgCOLyorfiu5zOxFZZeKIAxShDohB/EIig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX4mzbkwHpQcX0iN0ItjqIUqp0U++/AaIjQAStqS6sQ=;
 b=BO3TE5olVkmJW4HGpR8NACqlAxNpsPndsRRrbxaoXfKMZvEgdUOGBq3r2qUfiZvnvGnLSova2wHWM7LOA6g7rP1K2fFdfTFR/1lKUXjqEEV42qXzoABvazIM5sVJ67J2KJ41+lNBWeBqfVW8X9JkpOUfItesmAqDVJNANjzwh6KSJnxVEoIOcKc1lXJq5QDBueIO7BGsyFYYUf8p3wV2lGlpXrPKI6rV4qfKHzvbdBv54ubsAdCDYVWSIGfKIlEs0T07364TSAusjzNsAbsf8daQ/DHBCze+2eo4UN8hl8fXzQa2qEWKdn71LbP+0aKNjOY/+MFs4YdG3JY2i54yog==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10123.eurprd04.prod.outlook.com (2603:10a6:102:403::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 19:35:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 19:35:28 +0000
Date: Wed, 24 Jun 2026 14:35:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajwxcn2LXS8InAjZ@SMW015318>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624191935.GG851255@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624191935.GG851255@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH7PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:510:174::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f23c3e-ba1b-4b6c-dc00-08ded227bf06
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 AGgthyTbzg1C+bnvsMaCDS5p4eH/3bC9bbw9IsPnT1O4fhZNEZ7jyT6AuXNGMMJ126s5zEbRfyuULDRGwqexcZVW+FbljmaSBacbyub83TdnUTuq+8Qey1i8FRhEM7Ar/xU/ydclrUoqz/wRjLa1hogkYuGYUVJ5yIjjkQOz727HDCbIj2kpvYRmlV5uvnujQmFVvPt0ss6zCnFHvwe1CkwS6R6yckf4dBJbO+a4aTsOZrUmsrSMQs+LSLLbJngSKtcVHrZCtvDqgG0Od15hUKFUBRUIKFDNqcta3I9WyQRntYIQ6v8Y2w7vLsqmvsfV9xCIsWXdvqGXxTdYvntxsdUyVbHKpvWDC43lfAq3CNTAh8KYEXGdrP5BYvPrz5usEN4ryWh95QRYLN8naoNebuKaba/GthkodLvzThbSVuDRszuGv7tfPE9Ujef7ZjkJjz16/M7TwNQxSYxAMDsgtr6kA5B9gcfJs0n1ohF1JLA8j5Y5MLDSobILo3AxHIn4HE6zTJjrdMGTUMAL9iBHBH3j49Pmgexd3dLooCuUKH7eUw7KuZQGeZ6YVqiscraKDb/HJwbnSbv+dPnz6+6sgT5NbKSrZXjgVcll+K2upw/exbSZxusn0cVjmQxtqrxhGEwcpSF/41CySdylqmLnmPJAQahXblvf4O5Poxuayjc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?f1QnVOX562kc0kQsCCI8wHgYMdIkSlp4wrrpTbIjRXuyW6yJQ5An3qVPpfa5?=
 =?us-ascii?Q?BuYFXpIXgW6Yejkz8UulLnfznBKPTI9ajZP9HtiF0MSyzrf36/c5qa1Ivd/o?=
 =?us-ascii?Q?II7XCNVKDW2q5P9rsu6CVFWVcfCsjaFWfxHwwcaQbR4vympwu4bk99f0BMhZ?=
 =?us-ascii?Q?T2U8YNe8tAGvHWcKVjE+QsggS2saBEG2nJ3J7UrAWJP8abX9KgyanTdCcr5g?=
 =?us-ascii?Q?f5tPirf5Y6nS18VgilRnyeM9E/tRQT3sF9jmH0V8vkmKfoyZb0HqAjpagct8?=
 =?us-ascii?Q?oIPZTrVFZdcRt5fLolAZ0uWuNjkQ/VCjOVju9TAMBdXJdoBAxZ9juyqaa/dr?=
 =?us-ascii?Q?Kv7onAbAYPaW+LMUyNpaLX4iGbXKDnoMBvyK05CLjBDnsOioUhldarlcRurn?=
 =?us-ascii?Q?nlSeaJaBUv4W/0lJs3uUXEeog7O+/DyX5FsK8/5z9qZH4z9liw36fs0KIbhf?=
 =?us-ascii?Q?26tbq0QlJ8Ta5/XPAzm3vTQMjfdbGw74fhYaJlZxGhhcm9XGlXpnxg/0shqK?=
 =?us-ascii?Q?D9hH39euE8gRuVUw2DuCJmVo7tkSxE0WtuLqQQD7Vt5UVYeYAakMu3Dhh6w0?=
 =?us-ascii?Q?w/LmIPQNMw5htql6UjbOx31it/k4+3UeCDNvhVhTzZ/uZg/xmzV0zEWa6hm/?=
 =?us-ascii?Q?tpW/FdWF/l4inhVhrpLeif0BqCR0Yuq29uW7NeUFCVq4QhEn9+G+RaKlMcGz?=
 =?us-ascii?Q?uOpy/RJ2iQYZcIiCFXHWGq2mFDtr90dQh8cOYifiLDXS6VAOSUHFK/DdPl57?=
 =?us-ascii?Q?tTloc7m0lawB9fQQeVtcY6cnDpPJGokwJp2XVIRaLKmLifKqTaGg54EQawZV?=
 =?us-ascii?Q?N31csG4mcBs0XPe0arQ0d5PYz7O6ifAEWXYo51jNCdVDzr8gJWzJQBMn/FyP?=
 =?us-ascii?Q?oPGD7cc9PIjtk7npq53uJ4geajp/tP0ZWYlx9Z8kApeFLQJcgP2JiBTKp6nF?=
 =?us-ascii?Q?n4AuCAcKU51XeG4otoeDia6pJ9npRk0FslngZX2tRmWvNOE9dSCmZMmXArE1?=
 =?us-ascii?Q?355qSs5Zr/3PO9o3YGCA689mU30m6ezjMRXOkoZQH8o/OnLZ0eCp/dMKsUJV?=
 =?us-ascii?Q?L015cNsMkIV+7waUadGb5F2B/2TtjReRvm2klpg/Npn3MFRZQheGGo/6Xf22?=
 =?us-ascii?Q?/+lEbsqJA967qYvt23dDFVkBaFuW6GnPGjerevTM8DNVhEc+9d7WAUNgmV+W?=
 =?us-ascii?Q?mOKbjc2s3XKAHPvFDbv9aeqOot+EGmOEgiYsaKgAgX9ss1bjPo5qGuXjbFbI?=
 =?us-ascii?Q?PmNGb4CyCL1mDu7g253DO9/w45voXSG/w4iZY3/G/Pc9ONLG1Axh+CB/N3Tr?=
 =?us-ascii?Q?FpfL6sRe1SMehSJmjhfx50DN1EtETO4HrcijVkTkGEaV9Rsyag5HEJ2br5zt?=
 =?us-ascii?Q?VqLTZGzm89B5/brLbJIt1ID3JxXqcj8rFrWpzvELRI5MYXb5R2O+XN9doH/w?=
 =?us-ascii?Q?zaUn8TFx6LRkYPOR9wyQb7X5PP2y5KD9hKi5+xs1GWjD4tqHRM+T3oE64YX6?=
 =?us-ascii?Q?VFpdP57SG135d4Tf0AicBib/J0z5i3FGrjIb9IhyKke1NFJbDfrGvwvEkOEj?=
 =?us-ascii?Q?6ng2hZLEx7kUeJPZGncjECjKuPG1nThkcluQs/raGm1MCjZnAfn1BXd68zbq?=
 =?us-ascii?Q?Wj59xLCZaX0xbKCtWecf4dWiNM6iB+AwnqhYZ4dY6lU6WXS7r0hhv7u5vBBo?=
 =?us-ascii?Q?Ng8A/ifqRiZwou2uxvMR09W5VtLh2TDxsY4QTho9pZQGorWwbzTonBtn0qp0?=
 =?us-ascii?Q?l43yIuy2O/isgZSzXDAdVCT32ucuj5s2Ua9O+bpt+HN6vswzwBul?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f23c3e-ba1b-4b6c-dc00-08ded227bf06
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:35:28.7057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ4gSO2L24lY+zbctpQQcpu4Isb7XAJrmByXVNumCOEWwZmaW6Zwa/kv3i+zULxO1qAmVrYcvU19umeSauE0zOxpjnRvTsgMANCbDR/pvnasbLUAZU4RVtW/fz9q3AQG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65583-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com,oss.nxp.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,SMW015318:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4288F6C111D

On Wed, Jun 24, 2026 at 10:19:35PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> > Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> > simplify media code.
> >
> > Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> > rkisp1-dev.c only silience improvement.
> >
> > Anyways, *_for_each_*_scoped() already use widely and make code clean.
> >
> > Build test only.
> >
> > Sakari Ailus:
> > 	when I try to improve the patch
> > "Add common helper library for 1-to-1 subdev registration", I found need
> > camss.c pattern, so I create this small improvement firstly.
>
> Those are nice cleanups, thank you.
>
> After applying this series, the only left users of the
> fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.

I already checked previously, two place use it.

fwnode_graph_get_endpoint_count(), it will go though all endpoints, last
ep is NULL, which totally equial to scoped() version.

another one fwnode_graph_get_endpoint_by_id(), which return ep, expect
caller to call put().

if use scoped() version, need use no_free_ptr() at return, which make think
a little bit complex.

It'd better leave these as it.

Frank

