Return-Path: <linux-media+bounces-31400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D204AA4699
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C77F7B1AB8
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187B2221F31;
	Wed, 30 Apr 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KOXHmpAf"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C96E171D2;
	Wed, 30 Apr 2025 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004370; cv=fail; b=dynw2eiKEdsZjoZL4lBhjOhqyVkf16VMthtOjcMOLlPCxrwn3evdFFfOuac8lAxOvoAhFVK8LVYZAGVpJXWn1pi9ugsulGK3xi6YvW9D+wNMLaGVRSGQVQJyCyat4m+Hcu+A7iari4Gp3GIpqrNikfLj08tifap6YvNp3CpwM18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004370; c=relaxed/simple;
	bh=LacbHysY//JoNUcFSjBYxf3gmex6iaq9+AFUnKANAPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L5qW3gGdsWSMIS4gJn0B1hGJ4Xf46HMZZm8QO0lIAUU6ATFTP7TtunCaR1CU9p7MntN83e1OQ7CbVcdapi3GfLLtHWR893339lwLZslMI6ylEKRloSk1NtZzM0i6DTBLoPUO8hG3J22dmIr5+q7CHKooAd5BNo3XyUjFDYcArjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KOXHmpAf; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldqlwLDgPzHwOk6QsQBoLxXvOyCnkIo4AKvx1Kg9mRZcdUE+96LcF+yMJERmtyD9Kvg2Vou8syI5kvkrEYr+7GQTRlhAsAP7GT5zNP4XWDCQNG0PWu3MKunpsuakF7g+tp10mpdpCBsMhscKRSlVp9OOyzMpZi1qZyuSjTk7W+Qu9OuPokge2HN5tAEwqP4XSvB6wGIusuNGw0KejyRVpmcWk0aj0krkIHDoKdvLH6xh0S9r/wTEBolfnuCqf257M3RnAxGtx/jy/ipZJ+FGqKuYHSscbu813jOHhmH4SeZif1NnDdDU+DHcOOTnKEF23b3oXxI/fpkHmP6TkvoT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpCX3a15QcUMZTy7zgIKOEk/EMAtKoiFnl+fw5TF9KY=;
 b=KTVPtzoPG3oRdNcVQVzbggRHVqZpAlTh16HT+ea/oZqQbn0XmBilpbt6Eiazizg/kF9mDS5D7KWhAgd0HZ9+FSo9hbsODFfUIQJVPKRw7HOft4mMU4iPzen2RJeB24uT8D4wpSOPnAzYZk/6LpG4DOJskOr4n6Lm0aTV4Sm/wMZy1+asKwSN8qyMzIKvXMwpwwf6xjM0pB8wt3jlP6lNcuPiD0BuEWinVnxZ0EW6EviusLEocgHSuypqwe0yxBdpSfXc/tfAlPOjwuhpIkQ1JkF8cm+1Xd4ZgEEDZcybzxp3Lmp/tkeXWTkgY51Mrd+MQKUvEMAQHJM8UdkWNvHNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpCX3a15QcUMZTy7zgIKOEk/EMAtKoiFnl+fw5TF9KY=;
 b=KOXHmpAf7kr2ppi7QW/EYOfj0yuluq29Bb2I4gqFaqlJPsFcJDM7Amlv08ddVeFttk/TtjH9Mh7aLapxZhGjtK7n5Nqf9f1AdTsMz6iZkDupjfUKcw/NK5vbuFNo6OyseDQ4eLY3WcthCUzO0l33XXyQM50pRVcH3YqomPtaVA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB8770.jpnprd01.prod.outlook.com (2603:1096:400:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 09:12:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:12:41 +0000
Date: Wed, 30 Apr 2025 11:12:31 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] media: renesas: rzg2l-cru: Fix typo in
 rzg3e_fifo_empty name
Message-ID: <aBHpf0B7ljhfbd8j@tom-desktop>
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: c196bd65-7bc7-4600-b12b-08dd87c72923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0LW3mE30XMpamnQNbx8M6dUHONpzlfrWmPv5TwkMwtcegrjJxb1CX+Or/5T?=
 =?us-ascii?Q?z5Jqo0RSZ5hgdR1DQ62NTs/gh+w3poUJK6vD0O5JbrfdBSaDsU2EpAe1M/3E?=
 =?us-ascii?Q?N2kATd8D3TGbxDB53qlVVuhz2Op3HJWVL0rl/ayKSyErUZXFf1mfg+JHXSpu?=
 =?us-ascii?Q?NF/EsW5vCHAp4vn+RLeD63aCL5OlTWkwcY5gUb/MFI3Pi9k59NGLeQUpYrh4?=
 =?us-ascii?Q?QTm+HfXZGnfkUvd8+Ri86cEeqATZ3obZ2ZTjtCVtVuI0e+t4Yu2CGg1ii1hc?=
 =?us-ascii?Q?a8gnSfHxE7clGyxTm3QrnzoAhYY0JkYTGQldhFMvt0soVpTR0BMx9mPqE1X1?=
 =?us-ascii?Q?mGERBzjbmYf3mO8YJ1RpIEIauNCDWNGRqihNr7cGbvcXfQqIe1aLdQkbMMdP?=
 =?us-ascii?Q?LhQSdTs0fxc2pxC9lVHVY1g27axPb5TeTLuDW78vf2HnrJrJ1/R83mPx4ZNa?=
 =?us-ascii?Q?tqlN2psehLOYKJzMGiUPl0mogca0G/y8pq6JofFlNPDpezMjKlU3IMx0m8c2?=
 =?us-ascii?Q?VSFLxDIu5bMrL4cW4wJIHMmJ5bssdWOXs4TwR32UwyBOn5IYvnkBSw1BBE3L?=
 =?us-ascii?Q?Z8C29wlr2UJ6CZs9p5qFYr2JzZkB3kJ3EL2xv8aZ7uP91jkJAwdulQkl9WRS?=
 =?us-ascii?Q?ShGcZC/x8lyjrcSGLNIqkGoG5+LSMv9YqWrqj1ntwO89Dd0n0X38jINWBPr4?=
 =?us-ascii?Q?q81UdOKP1P3kf3efhN+EacAYrN7dEmKBtmmi+nmLCz8y36k+qJG/8v5WIkdT?=
 =?us-ascii?Q?Cjgh56sNeumAQtX0bzWnvtPN7LOUmQFEggouQNGhgFn138caEiwggzs9AmJ2?=
 =?us-ascii?Q?VyXE5MxjPhwgl16O35n6rySvqKHjfq6mBsNmPbl8LCrvu/k4nKANXxAERt1r?=
 =?us-ascii?Q?5PLr4PUuRaV2D6CSJjBhQTGBYz7x6MnjIaxe0wPwpUnM/LBJcBPOpaPgidtr?=
 =?us-ascii?Q?hr9VBlxrGNXyS7LHRNx1fm/dEv1q//CFFouad1JENEjf4wTfcVMYQfq7p/Hr?=
 =?us-ascii?Q?HBrALvlLEYkBcVW4CtbY66CVZWgPtz9Jsh+IYxLXw++bPhUQ4Ua6PEFPwKLm?=
 =?us-ascii?Q?OWOhXlhO0fyCrO+sUAqxCoi6NBTBZJG5g45jjzOsg39A3EjJLYAJoAqJrhyj?=
 =?us-ascii?Q?bV5yX/cfH28hLGHaXYdOQoEHAgttCZCNd7aCcUfuuFhgnDTwBluLB0VMPri9?=
 =?us-ascii?Q?NfXmSibHNIcKGQlbDJFI7txINW6YC2YipMGmz1fzofQofadd8F3Gjw3Dme7z?=
 =?us-ascii?Q?IAFlX+SZnvdDO2xcBtJUbPGFLrF8Vmc+EVMB1KI9VeylGdZTcyArTxyk4RDm?=
 =?us-ascii?Q?GJPvfg/CI9UxQri/dIaGgnalNnLS8TMpM3ezwjHBJ7uYPvyUob8qUR1UqkjC?=
 =?us-ascii?Q?8Vi9j+UYGmXWpiXF7urlPzyCByu1UHAcQVZMScEtljP3snk24Xlz0u9MeaaA?=
 =?us-ascii?Q?FFWiZ0eGOmwO+R034hpk45wZY4RAUkFuK+XxYusrzoZ1YFrA4lXF1mWhD+t4?=
 =?us-ascii?Q?Com05db3K3XPHDo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qaVpQ8h1u7UHEZQ9sh0xX1XHd/7gs/J9Cceu8PZhOSgei56h3K3MgDQpTCdy?=
 =?us-ascii?Q?F/dbr8FlNwJLAj9Hv2bGbJP9U9VyGGgEbtGkQVS032Ha9ixSWPmgmichmz5f?=
 =?us-ascii?Q?d9KJDDeMSJt68iMibc9OVtAOyC/LgtG4sTGJ+aq8fCUod4SUpYNv+2Q5jDrb?=
 =?us-ascii?Q?2JvVAfskV41eAK6dNMc7ymEwEtyP9gfSRXcKZqnEDGLNUxcTVohzR0w7P2LH?=
 =?us-ascii?Q?0XXcpd/EbmeEgM3X+KMcaR0I0jXhZOdzqyiQIeuLJWVLD7UoIS94Sgk8182m?=
 =?us-ascii?Q?bBP6eOrpYuHioVzM/oUXoLIej1JLCxvlUcdtFFQyN28Qo3TjUBpXKuxTmLZm?=
 =?us-ascii?Q?rBQtL/pRF55C+kBtQgTcBj4VjCBXRK2HLbCS89TCJywTnsV2O2r+VVHwrZah?=
 =?us-ascii?Q?91OdZKRTb2OCoUGKMBSFXnZGfEIFmYtiIE86l5/o91JPKeHafMiVmW0Pf7kW?=
 =?us-ascii?Q?vqx2AUgKXGeCILcqVa9eNYl4RxX62sq7Vx8YBnC2U5zLATdwH5hXbT/FJyGy?=
 =?us-ascii?Q?CeH3/31AFzsZrlL71/JupOoWWsWxQUaHsqRqK8ILDvx3mY8THUm1Ck76SbRT?=
 =?us-ascii?Q?u9sb6LeHPM8+fuCLKkc9dM2Qd9K5/UvwZj16KCm8MRJ1ehgX3DkBn2OfICJg?=
 =?us-ascii?Q?rDfMwhJHang6SHgPbgky4eoukTCXbDo05Z3mCOO6QNig30r8w8bbRu2p64wQ?=
 =?us-ascii?Q?W1ugB54OYmp7OvBEU9p/QGtzfIRGflQlEadM2d2BtRj3MZUez0e/s9I15zJ9?=
 =?us-ascii?Q?avpoCRvUHc27Y75uKmSkZowqkaiHfDD6yU7z5E+SmVjWepQcBbDz5nSboGNq?=
 =?us-ascii?Q?w6eK0Q+sjqN5sc4AWXhWTTSzuK3x9WyKTHfylqCEXqhTS2r8yZQPWWI4ODjQ?=
 =?us-ascii?Q?XpIeF6Sf0X5brPWgdCmYAdpxt9w6qrxSOPF/NHHN7l0gyslWLPo4xecETFCV?=
 =?us-ascii?Q?Jiqs5GhT91XKH/992pVUAJdHxDX8wCqoi6jdtoHAn0O2YY2kYaASe3Amemcr?=
 =?us-ascii?Q?VJwcKDDJSrWLcnML/U0hojAT1/hmON0sar0LsX3Ll0rzuxymo9buknvIcCWk?=
 =?us-ascii?Q?d547Vuxp4oJe4/tDhSwd7D0es0yc/t6uvZxQPnSqTQgkEfX5NJBZ9c0j403R?=
 =?us-ascii?Q?f2qO275SB5lTZIIxNe83ktiAHHN79L3jXX+dVqPPfAq1pgKActxaeNaierEX?=
 =?us-ascii?Q?fwb9sEI/znJdj/faP/VR2HC4+JfinDtfP8gq7v750N547Xl9VzweVIatKJRJ?=
 =?us-ascii?Q?2kTQtSVqAQah7jjsvfGiHgbIXCeyt+Or5aT4QjTHDyWo5GGooBSQUQxyAw22?=
 =?us-ascii?Q?p+5g3clBa2nFOjezj4tqm1OFQf1QOL8xi9thbAIMDkMCzssFtMydwMAXnefv?=
 =?us-ascii?Q?pHUN/yQTUde+zLKrgyJEvztOb6ZMC7X7VKIrtKOmXG8Z6U6GydHIxOxxhcp4?=
 =?us-ascii?Q?aRdFU0PNVI5gt11UyfFrtkWp03IeJH8RXdBtcAEx0+hQhbJM2lxDUXKY4HYS?=
 =?us-ascii?Q?tbNTUUKkFCpJXu+DXLicfPTbWMV3quYpdyi9jz2hEdFii38o9oQTkG2eOi4F?=
 =?us-ascii?Q?w/5rdC5lUiiiNi/JxRXpLPrj+F9JgTUjEzuKTPn4Pf4VO23d5z+NUN0PFhpe?=
 =?us-ascii?Q?Z5WtfZRReMjzB/zfmUHFOT0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c196bd65-7bc7-4600-b12b-08dd87c72923
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:12:41.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f41eQt0oHnkOTIccDbd6ObS/5gXyZQ9F3qESWVJ3lymGPmm5hnDazvZ1kw2CfFsRdipbVeTT7ekV/SFHAYsA7VlYluYPVsL/8U1KSj4cx1C8/8hH+S8pYxt4/m1a5ybe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8770

On Tue, Apr 29, 2025 at 10:16:09AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Correct the misnamed FIFO-empty helper for the RZ/G3E CRU. Rename
> `rz3e_fifo_empty` to `rzg3e_fifo_empty` to match the intended
> naming convention.
> 
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 2 +-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 5fa73ab2db53..db27819d8200 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -366,7 +366,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
>  	.irq_handler = rzg3e_cru_irq,
>  	.enable_interrupts = rzg3e_cru_enable_interrupts,
>  	.disable_interrupts = rzg3e_cru_disable_interrupts,
> -	.fifo_empty = rz3e_fifo_empty,
> +	.fifo_empty = rzg3e_fifo_empty,
>  	.csi_setup = rzg3e_cru_csi2_setup,
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index c30f3b281284..56feda6e6207 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -199,7 +199,7 @@ void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
>  void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> -bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
> +bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
>  			  const struct rzg2l_cru_ip_format *ip_fmt,
>  			  u8 csi_vc);
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 3d0810b3c35e..ab35caf97c51 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -323,7 +323,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	return 0;
>  }
>  
> -bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
> +bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru)
>  {
>  	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
>  
> -- 
> 2.49.0
> 
> 

