Return-Path: <linux-media+bounces-66131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /d3+AwnuQ2rXlgoAu9opvQ
	(envelope-from <linux-media+bounces-66131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:25:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5B6E66BF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="b8o/2yzf";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66131-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66131-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFA9A3029A58
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8363A477E2A;
	Tue, 30 Jun 2026 16:20:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C76449EAB;
	Tue, 30 Jun 2026 16:20:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836436; cv=fail; b=XNTENoufq6jOYZVGsYHbiPuF83v9t6S1rSBjlGMXATRiy+AVs3Y3UqtTXbzFCCPFxzCi4TAd2L/6HhQKaspLbNXzjwSyv4mOshI/VasacoP+KXmQCF7mDW+13W9LGrKi5c7OkJb1CQmRubWiaYKaRiMerROFIb+FS2aRL3rcxvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836436; c=relaxed/simple;
	bh=pWtE/uI4EqYn4U+NPro2MrhX1IWHgSM0qzgWpwX4oWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l6XPK9oPfVRqlBOADWToWZ5TuXsS2vLlsIUC/1+58zlJ6pcuxK3e829foNIHn4kQvXV33A8A7Jo00xtWcDHZJwXAaMSn6HfiNkOI3lcFV10uUNknU4Rmad5+FkGWSfqVARZCYdJ0Se7W3ybH6TZqUgbCNTdGys2K89cosTWmMFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b8o/2yzf; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qebuTjSK1MkCsmNCmfCFNnXANmZdehntGVWanIh11pZAiO1VoPTHlVQqliUDOXO7UwI3vIFfu06SzZI85lBlZiVrCt4bAu5fEwOdmrl1TzHLHoyLITSyc49SBvS8GZnJqycj0yHfb4n062p98Slve4sJwqp5FXw9ZyVL/jhdA6pm1Il7kSPUiseADCnUZ3kmGD+N61FKZ2R5SdV2bdpKKSY2uqEzFfdquhMMi7Q94/EnqFLXqMJWziARyQljNX3j/06WBYnfTKYI7gCmBVj1V3H313SVGNUq+Z1mD3TmXv5MT1gM6Q7vYpR8t26/xxb1LY+CLI/F4sP3uPB1hxNZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8A0RebGIzxFLjnV9Jou5cTZnWsJdzZkfM6ilJIlDo2I=;
 b=xQJVTYVuio0L+eB1eEerfTcbXqL5DyxpjHPGAzroX175GGwbgdPXmxoB4nufnuhaX9B3ghW9w6AMxKwawkgT5wyUxjpaz24RGErga9ZCWBnoBfq9YQeCG1ObIgHKXL582I1geyCo2LDCknkBR1V9CR1C6aeuauVqBUWRDkQzwGrHtioiDMplejJqeRbrmZEJLKPiT8sphwm13echxsUtD70rVFO88gZWQbKC3zeb4h3X4VdAIMZgYsxTsxLkv2KHa6PBSEsJyCGOpfSFnQ+yz5EQhIeUhwZZZGnBp2QQVZNQInOp2AkfuV0yrHU0KB+yfXvZuA78zoSzGnMgzMK9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A0RebGIzxFLjnV9Jou5cTZnWsJdzZkfM6ilJIlDo2I=;
 b=b8o/2yzfGjgVdRIb8d+dnJOMvE23VA/pFYwu9ToLFJ2q7XrDe21C4CsjHVCtLqeg2QEDLXPmj2WtfXVsjTt40BtDGCQVyktJZYBSKcdAH7Srjj5qooaexQuze2/vbMtgtoMHe710J12wSWazMM3dkeOPrGYS2Ga6JNFUSrmI8nb4ri4QjMT390GrWQxWk5Uqprl1KSkqU5DM5LOamlihMvwW1MiRFXIVJ3V4TqqYEiIrKANAV/UDpmzGw3RYvRUDRHH2cBzbHJuSxTaqdHTqAMXZ7A2fyzmosCIuBJR4oTR3M+D4Ytx15gZrlWvYcw8uegzwbHoTTIwchcY4Tmw98Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 16:20:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 16:20:30 +0000
Date: Tue, 30 Jun 2026 11:20:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual
 channel and frame descriptor support
Message-ID: <akPsxPgLNgu3YsEV@SMW015318>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
 <20260629202302.GK3054459@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629202302.GK3054459@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 41edb826-9642-4036-a9c1-08ded6c38088
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 /nZaWIPJe9OOwrAytcSMYf0c2NBSdrZABPXv/LUtn1KjlnpZPQVKx6uqXXluSbLnA7HFAdgE1iAFqpnogshh3whLN3ya8DFbc+lwRRLF2azC96jRtNYkwug7pErrVUh09Pz45t3sOHcaxaqQUprRDtXbn3cMJfeNRMSXILmqv+eZY8pThRh89DZfctEvKDgI0Y+62zNGTz13U2V8pYZZ612diKKnRj5BUycPDhx+8DNb2aJZZkylppvJSmjMq0EUB2JGkISGGEDOoZbZG+gLxbCToMK7vpoteVwY0BtFYVIzI0gHbCypgAUeYjKe993N28wLPmS3IH2NmntxkdSZGgZS1KVPy0spKa1QXBl8lrlE9NGIpuJ551L03t1+bMXjwPio0USost60/ztm8K6Y2cCkiV+KnoFS2dQ75ebRBghgb3Zfay6VnwtBMsW6cRSy8hAD6wu1g6Mdl2NRDVEUvbvE8PCUFMGaF76/OYR+1CWRWbjhIER/INxu0oDSgPyiTTSfHLBbyVuCX8g8EybxC9DXd/N6+RQ+s56O8R/sovHNde71SYuqteQDU7x7xI9p8kyWhfwdeMdZ+HhUTyoInStOrOgo1dBbdTHSKadLaetHWd20ie2KyXFxchwk8TLWqnV0rMDhaXtMzvS1JPoF44krs8BxNl7J/O8H+50Xwlc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MPn/pjPgl548lEuoV+W7TL3UkX2CUK32K6v5Zc88+vbS26+d+HCG9Oz8b/Xy?=
 =?us-ascii?Q?kgYRFip6jvaTkp6zJ38XTv8dwBhygqUfnUBqmnhRNZfU0slSr0xoiYRjTE72?=
 =?us-ascii?Q?zIqV+Yhvx9rehQK7LXEq1Ie0iI7TGjkyqc1Z0G6Epbmw1qlE0w1VOv38CKD0?=
 =?us-ascii?Q?u/R3fpFCJIq01uVwf9V+7oFEaO2sq7bcTEz4Pzp5fHudZsuwwz/rOTvpSPK4?=
 =?us-ascii?Q?KqtFUWI11nDPXt7xMlyyke8Yo/saJKJdaRBOr74wtrQIdKkdIp0I//Sj8zeX?=
 =?us-ascii?Q?8tyiQT+kQFTHDufwpgU8R77QUy6ZifVFFMuVp4HA0gbcTfeRzfsAa0StRSEa?=
 =?us-ascii?Q?bxok28A0/WUL1qVRx9K7NlVrEEzBQTRoiri8aLqTMz8d3yJZ0VmnDUxQ8ZLG?=
 =?us-ascii?Q?1MnNrv2BOguYMBciUkIQx5wLQpnFZ2dzaFh7jjE+22JrDaNnKGuZMn89jwyK?=
 =?us-ascii?Q?o79W0Q+Vb9XRUCwqYF7BX30LNhglgMi6uEnEcbrf4200q2j1Q99xzZBcAnxM?=
 =?us-ascii?Q?OZj3CUjUBEUH6B8ds2t7I+lxMjI6G5O4dWil9Z8czB8qRDr2EqpbrYtkCjHT?=
 =?us-ascii?Q?4G60lun2zwSB32Ucxv1LjCd7Aa8C1p+AzIKRaCN2JHZ9OsQzrlDNIa2Bp6yM?=
 =?us-ascii?Q?IjFe4eyCHgXGO2FLSDqsjdqHlsG3exC79HdzmiHRcoX0IyTNPNz/VSv2F43X?=
 =?us-ascii?Q?yaHQ1AjB0nPDz9icdz6A9zG7wuzhmFz2GfsbrS8MJOS3VzNk5lkbRsP6SFk/?=
 =?us-ascii?Q?MuRG89DcUgoWm5iMPbcQ260vsRb3lCzam3gLKkFc8NRYtbwqQII2fs3e9+SH?=
 =?us-ascii?Q?GyNQnFUFjfkBDelAHxCw9E/5+aOJM7ffW4hSRQSJTSa30kCNEdKjKJkcxrw2?=
 =?us-ascii?Q?tFmu5CO018kJhTjGfo3ETZPCoF/7KmjOtxPAfuB/HRV/rvh5jsKo6p2yjfc5?=
 =?us-ascii?Q?HmVkezWGRAoR3P0KE6uVVTCgXefo4LAL6GqDJmgIhgDHhiu0CPmHAa5/DCDI?=
 =?us-ascii?Q?HMOr7h9tytHSkba18QrjzEtcvZhwhZeUdjKYD6dQWi0oZ6BlBlYxANkWTtV4?=
 =?us-ascii?Q?IP0UnKTn/mBcXCXw9IFxcIrFCJY/N/ns30sMTHGcsJdUnzlJBqNPs6Gc9esf?=
 =?us-ascii?Q?NCKYfg1rrT6X43GLeD+OG4x1Ddce94QzWqcDTLUrhBCtJaQgP2EMrn6m0cd3?=
 =?us-ascii?Q?9IT9v2b0GBErhVH8VxzhORIUdehaYmuGU5iumpJSOF8MDne6di0skkCN2vPf?=
 =?us-ascii?Q?JBL/aP0U3+own8hEcT2cue6MarPwV88dlEwU3u3qBMKY12U6y5FhIaJE8CRz?=
 =?us-ascii?Q?ClIc21AURzxUjiq7fNoNRnWb7jP8RBUEGFrbKX0or9zs5OKDUNqpgoHaVPdV?=
 =?us-ascii?Q?iczvoRzGjCBZtjuQqvhAU8WGwvzzJL6ArVvwoCA1sr04MzNEB9FPVnm+TFCQ?=
 =?us-ascii?Q?Bdb4+0bL8BkPSldZPkNRE+AHTuQyLHQ0dR3lbmWwXJNcpIusOGManQIns7pz?=
 =?us-ascii?Q?NkSVsIsbDaO4agv0hwg/dphCb/tJzteaDboVyJzgSq2hbD7HHEO/a/3cba82?=
 =?us-ascii?Q?eWG0dAJ5nEMV0DRGYJqTX1Czn4lWtUGbatulVzfEE2UYUEE67m3RAFrVm/i7?=
 =?us-ascii?Q?xw/41zH1aGtXCMrKBSfLjg8aLAqZGkA2DmYgkZTK92dZ8t8Njbs7wtc/EhVU?=
 =?us-ascii?Q?U4gb5xmesmX2rAlmunzHCbjTp17LdeBqUUBOehm3007lmE3EeQOPzgntN8tQ?=
 =?us-ascii?Q?tzI8FBlevKj3Kgnka5c7SzwkWqOODv9wg1nlv7I6Dja8lfZBkdpe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41edb826-9642-4036-a9c1-08ded6c38088
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:20:30.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erTpsdqs2pptiQwqjRsEnJoGtqRPbwFZZMqvCkik8+lj73ziPZCAqoKlbAM6qu7NKypuuKA2aq2djKdE6iwH/DLq2LKaw+GASUMoCaRBVeXQt1utMcuy4wVkbJz0aET5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66131-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:guoniu.zhou@oss.nxp.com,m:Frank.Li@nxp.com,m:aisheng.dong@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@nxp.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,oss.nxp.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BC5B6E66BF

On Mon, Jun 29, 2026 at 11:23:02PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> >
> > On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > > This patch series enhances the i.MX ISI driver's with virtual channel
> > > support and adds frame descriptor capabilities to the crossbar subdevice.
> >
> > Applied, thanks!
> >
> > [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
> >       commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e
>
> Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
> maintainer for this driver.

Sorry, I missed checking Maintainer files, in media summit, agree on I pick
imx's media drivers, but forget finalize the file\dir list. Can you help
summery which files\dir I should take care?

If you have concern about this patch, I can drop it.

Frank


>
> --
> Regards,
>
> Laurent Pinchart

