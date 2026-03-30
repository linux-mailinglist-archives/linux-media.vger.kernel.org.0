Return-Path: <linux-media+bounces-57627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI/8NIqEymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:11:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB535C9B1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D5743063817
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C053D8100;
	Mon, 30 Mar 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vYo7g7oD"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9875395D8B;
	Mon, 30 Mar 2026 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878912; cv=fail; b=c4DCwbQK8J0jCM7gdfgQEuvZXWHwNOhSRxQ9hq6tBNu4mQz2MZg9BhwCRwDqOgai4d1OY1bUO0yPT6yI7ZKQODnGfVHQraB3iYABzLoFLJv4CENKN5rMpyB7y5bxL8OTgzlC8XGpoNEwh9Bzy1aLqv4rbdDNkpjdAbPO6d+lQ14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878912; c=relaxed/simple;
	bh=te/kOZRYQ6wiK89DGX6W1E0ynvf/kSm/zh19edy7/sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jVLKaa8Sbf00NHtMKnqCvp4ZzRa2HNkuCVAFlA0B2a86RNqIlG91egqOTXHpCNICo76cWFmYNOLfsf4eoynANrf7Ui11XuXo2Pa7c2S37lWgGo+xuMmKMKbM66IvYDdu7Rr/TbRd1Ojk6rUmrbxyhnlDEFbMiBb31he7UGtec/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vYo7g7oD; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/QGRqfiyWTXAzOfOarEDYoimBFMTk7iXDwJSLm58tfqHKh2b+8GmfHhPruSeH2+nsQgv5r0Awa2n31eCs6pvb+F6k8B6IQYTL4KLVH88ptuNxDKSxQENyf6R28M6Vt7wzFs86I1FgCuy6K87gOnNjwKmAzEkssQoGB+MkP1ioUqcIUUnPziiQQ+OWzGtoIByZpKINW9KxfiGk0jjP8qgcXzuWgRm73JgMs61ny9vUmx9QI6n/a0W/cWWFyHy4MnXK2IYkhq7XQP9GLpmokfk5Kb/f/JkmqR9hGE/vxqhSOKAu9BufPUoHqxHmNussdBfYkEpkcChdknDsEMpsk96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv5zpQXZdyJ6v6Tt1NAWUWirQcE9frwRkx73NVkQoJ4=;
 b=w1XEtp7+rjSRI2NGr0TnU/0JIwtWrVjcStrC3zXcWIY4MDA/mFOPAvy9VHBP4aSZFbaKhrpv1vdyaSx4/BL4qET7EYTsIYMDQ7wXENB2EQdmYY+bbEM7/5zrrCwNQmZkxUK3SvkRImUyED9XVFZ7IdqQKUT7B9YYfZ1PGfB50b26534OPknqRuhh3bJBYEZbZlY7VAVFEfmef7b+LvUBRPDZlo62+///qLv147AabyrsAeZ3BuAakUHwTggGsN1LXhHhgh769wwwfJKm9vNo4TSC+wP7aojlIrg1sw9fYEYOkBYmR5D5t58jT4KZF7dRsQ2HT+rhsteqj3wHE/rnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv5zpQXZdyJ6v6Tt1NAWUWirQcE9frwRkx73NVkQoJ4=;
 b=vYo7g7oDy5K58hpzofgFdJVBb34OKZ1mCUZYQT0KR1ioUuIMW7tBe5FIOULUztpwVOsfdX5B/wn5AkCCwpLmAxbNH8/+alnchgXLWgQQ0wkK91fn9/WpbozMCi4/wnegT6kUwFcSK+iUhKO1HFP8gxfewne2bbVndgWtyBvvxMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16332.jpnprd01.prod.outlook.com (2603:1096:604:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:55:08 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 13:55:08 +0000
Date: Mon, 30 Mar 2026 15:54:57 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 07/14] media: rzg2l-cru: Remove wrong locking comment
Message-ID: <acqAsTwZLscB-cKh@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-7-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-7-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16332:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ca0c0d-a4ee-4d68-3a66-08de8e63f3fd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BLM63S6Xv2cRH12luTteF6YP27fdpMNhBhcZan0eEe/PFkOYitj7rIS6r+WWH5GigUGWlItQBt/jMUV4v3OgU68Ve6u3p9C5TF4RqqbIRPCGjdhopy0bfBFK/D18OrhJjL5z9Ael7rAU2IrXjYApk9KMjKB470WZit/sDEhlVgxn8tPwnXfSSBA7wQm2wqR880L7ls3ZC8ApxnNHv0IbMKZNEdPCbQ+2OizpBFowhyEc5WAR3BPrAFpWy0ZZ2iL8AihWPpZqYz/XJdarA2WwRZKIMKFIUxFFNODjvMaE8eXiPcrKTGoKaEkVgWfyTRqnMlOxX6wnLmfMJJAm0NvtxcK/KjQ0FJTy9K+3nwkl66olKnwLIxjDe8+4uB/BN/y/a0V6ngxZV2EPJ306kgbjdKdIDI3ZQjcvMwY4HQ0I41U/hrDUR2x9lNGxPmeuJkzb95GZxA0IovXrYzwXK01F8STIWcb5E3sgbolsZ3XOZAMChB2pppSxK/ZdrKu3+NpKVitowTYR/woLvn92KyEFNJR3HFGOc1tlrGoNnzexzlyT5Q3pgaeYAJN/1CCqIgthHYmhwuZzW9hRRRYTnkCc3SoV1QBKXJNlcPGxL6+einSmTxb2yUJaQ2f00aOfm5OYFbE9To6b8wSgKwcTbmH5E3tL6UXHQww7A5jZ/vboPS83+tstYwkMcPBm8NxVleqYD3A3YrM/SN3IyMVXD/bXvkTQRgxDn4YqvC2WBirvvXi/7uZMIcCrs0MJo5qta9t6BgiEe0ARTsjuykSgkQM537SIaIhIMfwD61SoBFy1ASc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EX2zguhEjhMkxbJVAYav9dLK4O9zU0R6Q7ZFYTTXSYGnZofLiQ6hEXA++V82?=
 =?us-ascii?Q?KVd1l7muoepLtLLsN0kNYB2J/JZiIkr28OmQmoaSH4lzw3sCcSmD7nanncH/?=
 =?us-ascii?Q?K8X7RW3RVnJNUmYme2LBojM2J2SB4jVSeOHdtN1IwPtmctK2sW3cfPkcLbHt?=
 =?us-ascii?Q?ZcLEXBHpVc1nXe991nRF4rW4LfemTuYVkqnsylc1rSpd37XautfBF/6PmVRd?=
 =?us-ascii?Q?x55w9bOQ3vYo4m2v9IPfh1HsMGv7McOq9jSJ46VHeFSMpwmUnZyeT3oaD68D?=
 =?us-ascii?Q?PCcor8vBNAuIxytGdu6gI3iaxyAt8/59C6rodSwlf87qG5b4ohYG6VgRtvgJ?=
 =?us-ascii?Q?nHp3Q2vqcCsYunh3a/KiKdtntO5akHSCzQi+GYqWQ9GCaTSok+YwM1C7odYs?=
 =?us-ascii?Q?o0iDxMKzRDf0JR7q8aSsKgrBjL3d2D27/bfhKrqcgwksAviibbcwIdYgn8OP?=
 =?us-ascii?Q?xGJgqksBv3VNC+BTTFt/zZ57p9o6nDSbaXRMjSXmKbomsZmzwUqvGRJHcFPO?=
 =?us-ascii?Q?FNfMYquKlcgcvoSIgwIjYJcjkOGtPt0yRc6KVhfouuLBDtyN/2GWXPcKiR0x?=
 =?us-ascii?Q?5DAKztRQ0KbiWlIlHQ/vkfuK5GkOPhqyRD8deLetQHzrNyUcK9U+kS96SiZ2?=
 =?us-ascii?Q?r3kYpZDHCDHUPolvXpyMMtNfs+jnj2aAwnE2HamxeTJd83JH3mUE39TbCDbz?=
 =?us-ascii?Q?KfUoz3ISFw/cZ6lrvPDf0zJEjlLwcEFCeNyiZa7ug9j82bcVkzBXs20UoPlk?=
 =?us-ascii?Q?a4stb0CsuS6u+VEvkMEt2tWhF5q0SJ4wjkb4UqC/mROT4dmDsWYrBBHro788?=
 =?us-ascii?Q?b+81m8dUM+WN+TWBslJy3QwqdGIPcpiWuV4WQImzjrSsqEXPYFoqU3k4l3ra?=
 =?us-ascii?Q?9j9Fn9q3QYNwEGzUoWdCkAoIUofZB9iPy4w5bCf3u7XYClpKEpDnoWQj+KaU?=
 =?us-ascii?Q?mbxArBOx5czve85WsgdttpUFpj5rQEp93S4PQPNHf0O196yZGP1XmOGoLZYF?=
 =?us-ascii?Q?76KQR6zemVJhBQBDYXchEB8L9kt87jkXBflRhHlV4SAioy11sBxZ9WZdtGgC?=
 =?us-ascii?Q?KTQJFKcE6aBGu2kwQMOk+KJqSnKlmDnSFy81xkXy2U4xSPig7PC3IPsQRYTw?=
 =?us-ascii?Q?R0kVNC10C/8Y3/mMhMZm3wHQMtvNLT+lV/dkTVNOFJ8NTiZLLqRstVX9zB99?=
 =?us-ascii?Q?Nqk2T1SFKUVBlmO61J3QM1tASUbZB0gmGy2Rn6rtS/r48kiUle0bUZJ2uez/?=
 =?us-ascii?Q?oC3OwxWIf8N0h/SZrxrSfa9q7i704bEkRbbR2o9ASmK2rPyZpCe38qhdQ2Tq?=
 =?us-ascii?Q?oNFmuNNDK9ssINV2Y5I5DBwYHLBeVYXVbwu13J63kQyPzi/zWLH2P8WIe0kM?=
 =?us-ascii?Q?Spqb4mNA+3T+1x/HpTyAqDDDiVc2jfVOVNQi1f2QsRyTt0TvxyyxLwmH9UeM?=
 =?us-ascii?Q?IGBnpi7w1Dnj6wvIiR9/yKTt2BORcfAo4LR4NKXKpOrwuWaWXDZrgRDikWa8?=
 =?us-ascii?Q?Jtz1BRvt06t1owPF7qouPLA/IM3QEe7o2GCSK/in+W1LI0B6jLHMyMol6G8d?=
 =?us-ascii?Q?P6dL2vjQgagouMj6EWfWVhWan+A7zdIyU2WMrn5tOAj6xVt7L5QmJTJSe5Tl?=
 =?us-ascii?Q?+0PkT2CaZGhrZXUk/8ZnNNulyH7fEa1444mWyW/utKO/W7TlwAPREMhwP1dD?=
 =?us-ascii?Q?/RCySUqAcmSHqWHACCRFMHGmzm69338Zvz/BqdZa96HllS5d2/8PpVID75bj?=
 =?us-ascii?Q?9a+CUmWCsTbZCPTHVXjYYSkGEKcpRODMDLNpAGKLyfVHlc5t5HdU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ca0c0d-a4ee-4d68-3a66-08de8e63f3fd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:55:08.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIwAhQ7MM/nICztdE4eiDYlZ7GYZY9UEXqcpeElvPKMiSkNQUthHkbWpmBUK5D/uwAHFgCuZyuWkKr6XPiBehKCa2vJewiv0MY5ZcTGbdXww79387nvrTGwGoyhp4d8y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16332
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57627-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: BDDB535C9B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:12PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> A function documented as "need to hold qlock before calling" actually
> takes the lock itself.
> 
> Drop the comment and prepare to replace it with proper annotations where
> appropriate.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 2e94788c3a13..27079c17a54c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -106,7 +106,6 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
>  	 __rzg2l_cru_read_constant(cru, offset) : \
>  	 __rzg2l_cru_read(cru, offset))
>  
> -/* Need to hold qlock before calling */
>  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>  				  enum vb2_buffer_state state)
>  {
> 
> -- 
> 2.53.0
> 

