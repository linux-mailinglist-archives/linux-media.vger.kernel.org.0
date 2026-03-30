Return-Path: <linux-media+bounces-57659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ6OC5Wkymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:28:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06D35EC4F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE5B3071692
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2E4377EC1;
	Mon, 30 Mar 2026 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EyGKqCFB"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE7377015;
	Mon, 30 Mar 2026 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887451; cv=fail; b=Ok9K/e/UqmYu0QxeVFNnRhjATNzBnblxeLdAdzyfh4Xr0XwquBLZp/V6MhYotnSjso69R5D+XWAEfBul44MFHIWpR+3wzsS8pptF6QALtKVnRnMIqQqNAhqMsRqkyT5NCYatKMKKsCJ+vBcMoh/fo/NdeI5TJPmWkUdkeOU61vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887451; c=relaxed/simple;
	bh=86tJ7EiGWSUgLhh/SvqXUIrCsvkqSqqMa6SVPHVUGls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bY9RDlYFEYsJ2wBbuaB+nVo86qU/T1wMCIFSs0YkOGswoEXampYRlEf+Fxbhf/hoYpTC4JmJfdRjtOZs6oLgYjUvpQhY6NdXZbK+m6QbHMMYG+JrgV+rGT4NcqbO+x5QX+KVnEruGSSkA0O1BRRR2aV2hl3P3qaQpEQuo152RiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EyGKqCFB; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldmRMMwfRgd/UzYXcjk/g/PoaMo40GB0BD0LeNP3dgzYxvyFjl4ACG8VMTPfdKNZySWFwN7VViksG0Ov4mrcS+2p7uTWffc1dprUXeDvgLpxLCo5jdYh6Zc9JybVbNobH5Cuv64xZvp5uVY9qb6C/oNwOBcvYwfVAIW8RDZpVMCIeYkBjUVHfTehZA/d7gqXjmxiflkzfZZLsm34+XZRSmjiTTGm6FVwBvsRdi6dY4m3KXCJrJ/ax3XPrrFNkL/nUigwTGyy87nTKTJgiElZ1C6yGvbuk8L2osv33q49shjLHeSQYcpWDc6bvttBeTYRDoNu2/Eatzm2TCY1UGJ3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K364OzJrtoy0KUzFFnKJY7kXFU4C+LD3JfCv21jBv3M=;
 b=Nnjp0+wVLKxLF4bzrbu9zW/2NdvH1cStSGc9bjn832dvUyANcidJbdXl4nqJwfA7LKWgG40ZI0iDBU1BjIhKlpCNc3MgXYb3uofcfoK23tptpkAdGinh12gZCqOmywBLc4OQRuH3Bx9NeLJYIyr7EpQPLzzvp90WXflJFOxSug9YT8inturctVwxPu6T9BKI1DIjkhfOnkGRaD6pxOE6Q4yUnROC+fLGq0Be+c/kAuO+91VZgZHoKLMhwb+ISY7i04gHuIC4zyfch3aV6GpN7+1fjEG1weg2jbT/c82j+X8HDxxmQmy5RQPuAepVJsogFmytcPMlZtExSN8tYzFgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K364OzJrtoy0KUzFFnKJY7kXFU4C+LD3JfCv21jBv3M=;
 b=EyGKqCFB/eY7ZSntYNQhuiabwEHF5YBB8joLe+YXIgsnTwfQ7rfGyUII80QTtKGXwxPJ2FIZsgI7RIA5KNzNwRVtIxOliBNHfALPRVu9CF3YB5y81q9HvE9EvhwSzORdi2pd+soK4MM65z5CSl2l0UlSd0fGngjbCmp2ZnMDjTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY6PR01MB17512.jpnprd01.prod.outlook.com (2603:1096:405:35e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 16:17:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 16:17:26 +0000
Date: Mon, 30 Mar 2026 18:17:14 +0200
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
Subject: Re: [PATCH 08/14] media: rz2gl-cru: Introduce a spinlock for hw
 operations
Message-ID: <acqiClc70UTck27b@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY6PR01MB17512:EE_
X-MS-Office365-Filtering-Correlation-Id: f13d6ed3-cc7e-43c8-8552-08de8e77d51b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	NSIEF9Vai5TdHAIZqaKq/oEibIW50jZsaA6sHxtYC5elJHYeBXYLnKqhZAMEa3sLZBGJ156V7jmluesvdfCZK7q/E6T+AcHiyxFfrGSEjsECbbwbMibTaN6Sqox7/8DwCN7gk8RQrFYbNf9vQdLM1mi9er+eLMvfa/VJPd4XFjNzV2/BgbgIGencjqMeLmqTjWclpOd7vJVCq8kBK+UPcpTauPtyU+9uHEa2TFerh3/UI48HNw60/opVNHmje/jSeec1oHfttp9uiUVX1X5hSVL8F9kj8/PjE7ieTZwB4xi9b3Vezrn63kq5vP8Gsp6Ym8qvEUKWSTIIOmqkyktvsFiietq4vN2I5kqWjvUcBwzMRZJdSAjcCtLBGpqf1rpCZi+gwEAT4pmaG2lUO443xQ9iLu/Ow+P7QlV2XBHHeNRgBBPfJtrrNlLD9UN1RAgAwl76ACLVOpUc42/Gb+eoHwXYC/F58Yh/TrgUZ8ZhW6J81NPtNReinvCKUkJCQWcuJ70rmqWGK6lVAZuTwJrXsMxEvzHtfa4TqcV4tTnoZKW+CoB63VlntIIicsuIgw6FDB93LXSR0VnKt0siHdx2aXT1egYyZbx8w9v24hsHFviNFNtv42GXeJGhrDq88rYhEoKn1h8v7nv5pkKwm8cGOmw58x5TW2Ya8S9HbtUe6Olg214/Kpkwvlt8roHJlTDMx4li4rqomHdHOE72j+3QELFxGad7XqtqDw3kSlyL3kINJUz8iH2rbteQkmpkD7+lEHtdqU/443aQBF8NrZOlEePrN8K+dv3rxLgAg+H5r+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pwPdpI8LNsOpiAhDOFsaw6hDCfawSR3a5p/9ADQgtpKpuruHV0PHVpSZVRFF?=
 =?us-ascii?Q?dP13ManE25UfjCYv76gE91gNHfMn9mMjL2xvOgHgXd5aeJaas0NVSAD9I8Ly?=
 =?us-ascii?Q?ykxZw4hdEBCVjqyAFTB+ig+9+JBqENdaCrRnBZQ/3mKk3XPAos4Jjc6FvClh?=
 =?us-ascii?Q?/km6c8rD9ct+T++g3OxcLmJHlV/hIS9NaFLA1D1yvv9rlqfSsDxZUUKNK7Ec?=
 =?us-ascii?Q?91LLYfYUjsULOeUbuizU5VvCPbTk6BWKhzXLJZmzQrsfKHxi2UtJi1COaC/+?=
 =?us-ascii?Q?e7T6wjJ0XXOkH6VCsBz9EuQ9GcLCt0wnJMeKD7mYJ/jSbG7CjmxTHBhYyGCK?=
 =?us-ascii?Q?kx8r9+UjDLVbaGK+lG8SY1L0566kLfBKfs5qUF7RZXo/Fh+xu0kq8LdWSIi0?=
 =?us-ascii?Q?4HICsOa4fyxcXEHcYz3COzhfwCZ501bWAKIczlzsnaJuBi+cMC53Y42AcpWD?=
 =?us-ascii?Q?wuc8q8gZ4VZ8l0MmDlyBCFXOqDfzBOTVzlO6pTKxGSlQPBjdZEYG12QXqAEg?=
 =?us-ascii?Q?7D8vNEdAnao0Db4tqbMfai7Nw3kTRvBgWMuY1hv0PepavJW+8rP6RtLT6u3R?=
 =?us-ascii?Q?+fA+IcgzxG/+pSazvhv11uK7lrA/m1hxkpWI7m5ctu7XmCcKDBXPHthmdY4y?=
 =?us-ascii?Q?NNz+biZDlUbYCM7CDceHzpRZH0ALpdjJyJBwZaJof2UmpU+Cw5RMzsIe+kXy?=
 =?us-ascii?Q?ZpwX13gceCcclbNYGLwfJHQfNJUPds+NQ/NkY/UvcIAkKFBQR5UYNUYnHcCi?=
 =?us-ascii?Q?3V+6FsejMVmusLEVMPQSbKVO06tnRlgz31HkSk0qVDkHzIlhvvaWthHR08mt?=
 =?us-ascii?Q?2vTkf1aMnkTcQlnDQGtCAxRetTPhfXndcTJkfjenT7d8wSewQbfFB64QfOXt?=
 =?us-ascii?Q?Duc8eSc90k+fvG/rb9u7r4ViRmEMalKO73kLbK7zcz0B136BxHpDqGVF5AZQ?=
 =?us-ascii?Q?co+y2PInX9G5GbEd+mk5kvneelE/FJmkt6yWumGjAxZkSgTMkLweOU114l3J?=
 =?us-ascii?Q?cbtj3M1rl6iBp1HkifAKymF7mdDzEANqhLjBNd7i2n0CmdqZ1DtdPgf8EszY?=
 =?us-ascii?Q?oZVhEMhUgkiqqwnqDW/I4+0+Uov2oRg56U24DzOKQUt2Og630m0zlEZgu0QT?=
 =?us-ascii?Q?mpiIwevQBJgTL9VvveyT1+ZDDnSPxCjzuqOeku8A2977fugSLMl+eEd2UyVY?=
 =?us-ascii?Q?i1mh2U5WUmsmtBQKNHpVzCp+YiHsrJVYgCQibacwA9q6+pkX/hruDroQAUW4?=
 =?us-ascii?Q?6/iSAsSv345C0l/6YIMBFcJ+om6comdmi44lyuo8/Bu2MWpyawQ/zRwGVpIi?=
 =?us-ascii?Q?HGptZph36sI0JqgyEtWnmZNRM5ShVAafmAZnvkgzsiqf5kyS1wS0hBJ126mY?=
 =?us-ascii?Q?nT2BaKsb6hn6jLhl3ezVH3tUZj41lVvlpqrWgcp+NwBGVIOxI8zhQlz0kvUr?=
 =?us-ascii?Q?ReTUyK/fsftg9o5Qq/soBh9Qa+ImIGtFGhqCU7kO/xKRtVq82HZa5VEXiNXe?=
 =?us-ascii?Q?MTLt+ZPf3Zg+ySsxH2LQOqmGJnl3IS0pP+mtmSD9sObXhV+6I/PnzwB65+RH?=
 =?us-ascii?Q?DfclLLeHQfHQR98AhsocsvDw6PaZwDwIXyIcqr19EhlrXcuvWw+Ret7X7eDn?=
 =?us-ascii?Q?c0Uy0HPCE5jt+8fyPt01OzdQ9PPlIT88KgOOnQJYJc0TYcXWcIkFP2q1dCRw?=
 =?us-ascii?Q?OQbMDX/boWoQ1jQBZZvaqrGw1bSdzK1OjkTBePFjZSdvVBvYX4KNmA+00CiA?=
 =?us-ascii?Q?XpgrZe63yUQLBIWejJ0+avWTl6C4XhIAPCWnXxwNvpY/8/RoSFEl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13d6ed3-cc7e-43c8-8552-08de8e77d51b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 16:17:26.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITRVf25/s/75FGRTtS64aGRvA26qSpPn1ssZlZprKzbGgtw4LScQeAfHDGpKu0ABxwyaVWREhAL3jFTIX9xa3O8FO7lKKNi9NcOfD7mw7usZr9xh/895+PEQekL3A9C3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17512
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57659-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 8A06D35EC4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:13PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The CRU driver uses a single spinlock to protect the buffers queue and
> the hardware operations.
> 
> This single spinlock is held for the whole duration of the interrupt
> handler, causing all other driver's operations to freeze.
> 
> Under heavy system stress conditions with userspace not providing
> buffers fast enough, this causes loss of frames.
> 
> Prepare to re-work the driver locking by introducing (but not using yet)
> a new spinlock to protect the hardware registers programming.
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 10 +++++++---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c |  1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 3a200db15730..b46696a0012b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -109,7 +109,6 @@ struct rzg2l_cru_info {
>   * @v4l2_dev:		V4L2 device
>   * @num_buf:		Holds the current number of buffers enabled
>   * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
> - * @buf_addr:		Memory addresses where current video data is written.
>   * @notifier:		V4L2 asynchronous subdevs notifier
>   *
>   * @ip:			Image processing subdev info
> @@ -118,6 +117,10 @@ struct rzg2l_cru_info {
>   * @mdev_lock:		protects the count, notifier and csi members
>   * @pad:		media pad for the video device entity
>   *
> + * @hw_lock:		protects the slot counter, hardware programming of
> + *			slot addresses and the @buf_addr[] list
> + * @buf_addr:		Memory addresses where current video data is written
> + *
>   * @lock:		protects @queue
>   * @queue:		vb2 buffers queue
>   * @scratch:		cpu address for scratch buffer
> @@ -147,8 +150,6 @@ struct rzg2l_cru_dev {
>  	u8 num_buf;
>  
>  	u8 svc_channel;
> -	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> -
>  	struct v4l2_async_notifier notifier;
>  
>  	struct rzg2l_cru_ip ip;
> @@ -157,6 +158,9 @@ struct rzg2l_cru_dev {
>  	struct mutex mdev_lock;
>  	struct media_pad pad;
>  
> +	spinlock_t hw_lock;
> +	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> +
>  	struct mutex lock;
>  	struct vb2_queue queue;
>  	void *scratch;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 27079c17a54c..a79b17e146bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -844,6 +844,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>  	mutex_init(&cru->lock);
>  	INIT_LIST_HEAD(&cru->buf_list);
>  
> +	spin_lock_init(&cru->hw_lock);
>  	spin_lock_init(&cru->qlock);
>  
>  	cru->state = RZG2L_CRU_DMA_STOPPED;
> 
> -- 
> 2.53.0
> 

