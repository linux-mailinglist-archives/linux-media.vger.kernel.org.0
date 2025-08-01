Return-Path: <linux-media+bounces-38711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 144ACB17DF6
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 10:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3F85629EC
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4B520DD72;
	Fri,  1 Aug 2025 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hDsgS66o"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728D7205E25;
	Fri,  1 Aug 2025 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754035258; cv=fail; b=taFE6MAosCN8khzZOpDdCuedrUMTI/Qg/jxv8w1gmjgnw0i1jb7dXGg0JN0sDXYmdoHEg+huR50wnOexAzSgnxZjmxsjKkZXZ3zhv+thoruRZfrlGkHzhKYqzti7ncQxx9XGSJMwsp6kJXS50+vLl705yeqkiOFoE+t7JnvDqyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754035258; c=relaxed/simple;
	bh=QPCo412lcem+TDZohUrhuN2jHPo5ydw9mHn6nYY2aKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=smRNirmf8c4iDt+Uh7DGv5FRoiyj6GgWquXOlYy+GzlBjlSv9HRuLs1VqhxjePlNehlHru+VNzwv+Ik5Frhbpec3cnxEP0QbsWJlaMyaN1ntr7jB8YKKoX/YC9aDr8kpcHQgYe0SdEp1Md0XwbO5uWdNiba0LkqfJm0Ktj/3knI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hDsgS66o; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1izKM+zdpbps8C+qRMvSjGA74+1WjKUQ+z5xjfncHLHu2dnZkEYSV+wetP6jKLFqbo8YXfbgezRcI+lw+ZVmjPQVUhLToI1GQFFL2NO2YHd/E3uZ1Y1JQUiq5ZOQbzwDXuFqR+ulYGiGtcpDk6DoDpCD2OMeFkyQEuZ3y+1AH32Is8uNZb0gsu7U3PAqsZYKAvIw0LN1iwDoP+iShOZ/NI4Cue2GjaxQT2YlA4fEPZu75vN+aT5LRBhD1h6/xRAg3RKyBxKEOhM0m6VtKNguRlT6K0Q/OOo5X/wkRHiq4GfLBpSNe4jCeTNUtGApkZb84CiwFyxT4KcVoZqrpCR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5px2+X25AJssS/IhJJayDvQjQN07SiE47IfZz/Gmf0I=;
 b=UiGhSXfhXiwJN46TrKccpKiPvemwPavdbtWoQKfnIB3BNjcZD6ZqblrM/C7L+Ry81Lio2RxPUrLbbs8AOy4ev6lF8w0zBzYeH5lrWNi8oLtgXeb57AiqO1Au9htQTVrtzSHdEQ3v9JfoycdeBP6WT9YggpAsSbRYLLkAsr8iXbpBilEuzk8xPvmbUtwBTWzIaio/ctLQ6ef5vWb0nX8BtWiL4JctaXQkowqbtLAYGS8IrlSe+zG5fO+SvnEL+dYHaXyaL/FDAHOTwk86xBnWXD+325J6rJnoNy8ekRaehIHwYjpGQpr7SSXZMAD/C6RyT/krFeXoVVBvrHka7Gjy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5px2+X25AJssS/IhJJayDvQjQN07SiE47IfZz/Gmf0I=;
 b=hDsgS66otAhJExKpTdWG3sdbkKvE5s7TZ74EJ/ZoR4QX6Syg+luo7j+K7OQkuidoqKcnJNOdyecCepBnYXnz/g9H6pGU5wjEs76j9rKs9SH36gOOyyQ9VjHUVY1AIAu5m1rnFnoLrXWz0XjH8u8haCThmeLH5Ausnbtcm2ko838=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10)
 by TYWPR01MB10603.jpnprd01.prod.outlook.com (2603:1096:400:2fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 08:00:48 +0000
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0]) by OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:00:44 +0000
Date: Fri, 1 Aug 2025 10:00:29 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Drop function pointer to configure CSI
Message-ID: <aIx0HZc4aOw8Fzug@tom-desktop>
References: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To OS3PR01MB6657.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_|TYWPR01MB10603:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fb35ba-a0a1-42cb-1a05-08ddd0d1840c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?67Z4/c0BOLngM+3eyiwebIBmn8Ol0qXMocxCWa+beenw/uU6MtN5J0teU4bM?=
 =?us-ascii?Q?VMAZlBzjE70w7ZYD+Somte6Z0w3T3vYpENWgipvupGyVwlqK9wvh7g3sk2qi?=
 =?us-ascii?Q?nGarokI5iAJ21ldo49cC1pepzpnjFFahtW7I5aTHVyikyqVELL2vM6rXWOZ5?=
 =?us-ascii?Q?SdnAItB3DlvgOo+a1ZlJ0ZsWMf0HWvUwBXvtvXEuP3AbNv+j1I/15IHlmF8r?=
 =?us-ascii?Q?8xWzuwtUlKt+MxfFAzFS0vBfjxwifAvV01ynUzLk0q/UqYm03RTHY2vnHcwW?=
 =?us-ascii?Q?FuK6x89gYvzBtSWfFQhIiLB6OGFCxwnEZLF8FY4uRyoeFwvP45YZJ7mbnL/f?=
 =?us-ascii?Q?o9hHBJgmVXMEweA26Q4lCtV4VV1ixT7p28eYBjVYmW3Xi0wvXzAAkhDwoq2E?=
 =?us-ascii?Q?ycI9XuaHRce4lNhM3vqlkrLfBb92MHjhfhmShXhKevkPZA9WAZq+tDizuW7X?=
 =?us-ascii?Q?/9PwHkqZu038RMnm9XjFxApUXbOgVR431VHr1dqPwfQ9MD6C91oMVX2rdi2+?=
 =?us-ascii?Q?pw3zxOgNc9LsStNtsJYGChy/awhXmzQB8yVdJ0m3oJKtIe8rhZJ9E3ZhTfs1?=
 =?us-ascii?Q?B4P6S9WAfspQ9bf9fvMBYETUl3XYws691JvaWsqmSTLFvvmS0GyVMJvcC+LX?=
 =?us-ascii?Q?0JWAZND/FKiyb4hOcsnZWNusweF4lN2RnNHFowdik+mb2NyOLrpqQX3VhY3j?=
 =?us-ascii?Q?xgb0qzUXcqHgoRGRg9WC5CTzGKYQMuiJ+u6FawN9nHlD8qsuk77MCnCHESFb?=
 =?us-ascii?Q?XZ1jTEtgQkfWGpFCCAZfRZXa3y1u5p6pqgzc1OxAYeQZczqBOaLj8GjJEgjT?=
 =?us-ascii?Q?f+rQKIfKgA/lSXksf+sWqTw+q0/koRgWeSmSVGO8nubRJH6gjiBNfNAuMbdG?=
 =?us-ascii?Q?w9NMJCs0dbUDvTDi6tLt0UffOyegYZxFqXfCr+PjYOArIPSDVilWabGX4b7M?=
 =?us-ascii?Q?R9Uu2ffCN9+N9U84D5Yh58D7k2a/dbTfDr4JBFjL1zRmtAwEVF6CCC5Y1mql?=
 =?us-ascii?Q?tSv6JM7mN0ALsYl5GaiJrIiMIghzMJvL2zKMrHyUF4rANevr2mjnFW9PIg4Q?=
 =?us-ascii?Q?drFUp4s5JdIRgDjf70KQlKfeG9S1n7k1BT4DTKMu/NoQAgDaXPIXNx9AEwzh?=
 =?us-ascii?Q?aYWzRXWTd7Lh3E+kvfJIY7S+0VYiaBQjbVkIrEuErVTmRGMLBrb+P3E1fCqI?=
 =?us-ascii?Q?2H9jQJmSST5Bms1VRFq/fWGzpWYX3tox9DPqTC9rljDxKHVWpfERehF9ME4b?=
 =?us-ascii?Q?fsxMqGtem69Jqmu2uiUhKxxJITH+m3wbjwgBlPm+AXVt6OlCM5LHKOJtKObP?=
 =?us-ascii?Q?5dxqjffSOKeSL5lxjwmL5yVD2v7pG+8q+A+PmLTwmfA7ppwRYPtPOzD3TEUS?=
 =?us-ascii?Q?QXSxJcbNDL4k3lfbjoic4A6LXTiAaIufxP2+jlV1tguDFiqf/rpHk16l2pP3?=
 =?us-ascii?Q?k2pZ3UGjBOnYM6PBf4EvuarXyajw+hHgOZWkuLkBj2Mvl2HWUxBpdg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6657.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+RzLGGGnoqu5YblZC0NJFwzFnEECmik2i2J2HT+7o3QPF5oqTkIOlw/o04IK?=
 =?us-ascii?Q?2Ik/r+V0zAyV9FcWvSqC6uV8G3dU1/Q32wbgn66aXmx1Ql1+yaPO0Hpb7Bx0?=
 =?us-ascii?Q?0mQ44C+1tFCZ5yONNhOYlRfhS9+aMFKf8vpSBl+05anw3XuCr0pWW6fYmwvM?=
 =?us-ascii?Q?h0mU6HCQvTc45ObufxIl2ugo4FVSYcUC13JC5gPza6mgCiZ5x7ITHAO1Qrma?=
 =?us-ascii?Q?bm4xYmay21rNgtfNNYtS+Qr3vFzivW7hEMy0b0KxNAUeesF38RVPilU0ArSM?=
 =?us-ascii?Q?P1WddyGeryMz3QbkXTpC5uC88DYZ0m/f4cGLug9EC0i9QU0sct+GUwp0H6wn?=
 =?us-ascii?Q?KA0xay8/EzVK/Hisyx9sP2um91pevELTcjSfgKadmhiwOGhylPD7UtnZBR3k?=
 =?us-ascii?Q?UYJl/iKgSCgO2LMtUotUW0bM7j43AZpPjqH+JLhli21Der32OiZdgdxpF6Y8?=
 =?us-ascii?Q?i3wMgaNlUyhZtY3LvuT5nTsUQCotyCHkTv6xafLsZkCiWNco1Ov1KyRZudGd?=
 =?us-ascii?Q?6dmXXKNX+NS5hMGRkg/ETQaJCQpGHW5dmSdtCH7ql9G1QuHA9ApAFGVaWT1g?=
 =?us-ascii?Q?d807znOmyAfGrItQ5xKPV9RCw6KREzahS3KRlls288hYdGCySZy7JPild2RY?=
 =?us-ascii?Q?BEHsRfA90LL1NcoO4N3LiE0o/zLqk/mSphC2ll1IJyO9WX4PGy9+81XtRuhp?=
 =?us-ascii?Q?MVxdVZRAY7IxVa03db8Dp3wyfItEFJmxJi2m96h6OJ8BvLS5sEH6RIXk7aZy?=
 =?us-ascii?Q?J8RHqxtgdMKdDqC8RiaV1bPKlPQkjepxQtzwEWDzm24RlP9XpsaWiG8+/hSL?=
 =?us-ascii?Q?1/bly/4XsRhySzSd3SAxqqEm0Rp2MwVr0Cqmc/mkkgoKpJ6FilsDLK67ekYp?=
 =?us-ascii?Q?g9QXSGyU7ilKKDHkjv6S2ddRm9Dmz7iMgF8XFt+AsH/wTGwdznQCi3olVKrg?=
 =?us-ascii?Q?474bWFNBWr3HMwgLwBgTxQd3t8Wzm6xw5+ZwnKIs4DwS2lDIq6BvjS9uuEX8?=
 =?us-ascii?Q?mGX87u6aU+hTWjxgEVgjDYjvU2WSVluLxWALOE7BW5h3mOCBknCN+WROuv0Q?=
 =?us-ascii?Q?HYOZK4f6pdt2rlONTabgYYx9RuzJq1tJgPmiWMaeVjDcUZzg3GhfGDRbxslO?=
 =?us-ascii?Q?9PR8v2EAtSAq3QpgUq0LOtI4vk2ydWVDzSJE8SUPOCabX7ogBVcA28W0n0VA?=
 =?us-ascii?Q?R4OFwlSrx8JmA0SKSiMbauVhf7YFirQPCKLzqHKEGHFMuX1D8LkWSyUgO2Qj?=
 =?us-ascii?Q?go19gc+v7StJBN85o9UMVySH805WdICEXfmfdl9nuyPE5sDrsz5csvnQSGK5?=
 =?us-ascii?Q?JmOL2h5PzM6gWwA5WSzoh4SG2olFc1Mj3ypo7lMPEq3KGARW4BciEdJEwX3m?=
 =?us-ascii?Q?MKkXn8Uq5cITrX3VZJY1HSEtmUYcHSLkRIc5JIHcHk0IfFpl22ido9XIlU4d?=
 =?us-ascii?Q?3PxKKwMzWas08t2hEpL0sjfz0rDcfV4Nc9vOpuMuU/vZHj8wMtYr+JCLurAL?=
 =?us-ascii?Q?07Oj59fkSX8O2A6Xb99LBvlAhvTCvzpAQ7qdrZ0vUH3/JLs3HzpzKC19JV0U?=
 =?us-ascii?Q?1CcZHqWxawGuvbV9hfDVxBBM3XreX2f4bm8fmG8lE2U7ghQkksvhhX5qjmhB?=
 =?us-ascii?Q?6/87JrBqZRVXz5QCpIo5lP4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fb35ba-a0a1-42cb-1a05-08ddd0d1840c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6657.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:00:44.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypSBJs7Wby8qfxUXGcRvSAtQFxw/MtXHOG37vwMFQGtfrxYatQ9fVTvxMoKLUulHAClWLK4dl1WA9JvwxjzM6MuLBUOxW1mtRmLFYL4RsV1ua70oLwBldAOrFT4Fd92t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10603

Hi Biju,
Thanks for your patch.

Tested on RZ/G3E using ov5645 image sensor.

On Fri, Aug 01, 2025 at 06:34:22AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop function pointer to configure CSI to avoid code duplication
> by checking the presence of vc select register in rzg2l_cru_info.
> After this change, limit the scope of the rzg2l_cru_csi2_setup()
> to static.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 --
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  9 ------
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 30 ++++++-------------
>  3 files changed, 9 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 806acc8f9728..3c5fbd857371 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -367,7 +367,6 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
>  	.enable_interrupts = rzg3e_cru_enable_interrupts,
>  	.disable_interrupts = rzg3e_cru_disable_interrupts,
>  	.fifo_empty = rzg3e_fifo_empty,
> -	.csi_setup = rzg3e_cru_csi2_setup,
>  };
>  
>  static const u16 rzg2l_cru_regs[] = {
> @@ -412,7 +411,6 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
>  	.enable_interrupts = rzg2l_cru_enable_interrupts,
>  	.disable_interrupts = rzg2l_cru_disable_interrupts,
>  	.fifo_empty = rzg2l_fifo_empty,
> -	.csi_setup = rzg2l_cru_csi2_setup,
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index be95b41c37df..3a200db15730 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -92,9 +92,6 @@ struct rzg2l_cru_info {
>  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
>  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
>  	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
> -	void (*csi_setup)(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc);
>  };
>  
>  /**
> @@ -204,11 +201,5 @@ void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
>  bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
> -void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc);
> -void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a8817a7066b2..d75cd5fa9f7c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -257,30 +257,18 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>  
> -void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc)
> +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +				 const struct rzg2l_cru_ip_format *ip_fmt,
> +				 u8 csi_vc)
>  {
>  	const struct rzg2l_cru_info *info = cru->info;
>  	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
>  
> -	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
> -
> -	/* Set virtual channel CSI2 */
> -	icnmc |= ICnMC_VCSEL(csi_vc);
> -
> -	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> -	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> -			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> -	rzg2l_cru_write(cru, info->image_conv, icnmc);
> -}
> -
> -void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc)
> -{
> -	const struct rzg2l_cru_info *info = cru->info;
> -	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> +	if (cru->info->regs[ICnSVC]) {
> +		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> +		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> +				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +	}
>  
>  	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
>  
> @@ -299,7 +287,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  
>  	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> -	info->csi_setup(cru, cru_ip_fmt, csi_vc);
> +	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
>  
>  	/* Output format */
>  	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
> -- 
> 2.43.0
> 
>

Thanks & Regards,
Tommaso

