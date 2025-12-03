Return-Path: <linux-media+bounces-48129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B903C9E4B8
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE7E334336E
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76708273D81;
	Wed,  3 Dec 2025 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VDZq0595"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A2245019;
	Wed,  3 Dec 2025 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751571; cv=fail; b=fGz/joP9RRs9gSoGOnpli7uUJW3gbaYTO6IMX/FkrGcdT/1VvkGKIny/v8pj9VChCytDGa99Tl3mHlFJ9dYg10A7hm4bkx1T6SwZ/bDdttgf8dcTsfI2930CHCXPMakALyOK8EuhZlZgkqepYHIeybyXb8BS67vmsMVpPNTr7bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751571; c=relaxed/simple;
	bh=+SBtUCamQWiNs53FRjVZJU622J57Wp72wE6gx0lS6Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tUn7EZUu8KIB/Ii/6NhKPnxUz1QG7hstqL49q3RAPGH7ejrv8KkLIO4u1H5F473bhZ5z9WVEHKnBUPrswD/0LUJiDBtuuC7VUFHINwXTwDyXjGPd6F7ol2UpFyM583e3xW/cyeVWOV5JKpoKVR0WmVP1qsuJjhj1PgMNoie3GYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VDZq0595; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPNLY1knKqR93JE6R40g1pVUkLEbSG2417tOi95zpkxvw2yr7qSMBGz2DA2tHGjE5zUN9SqZaC9cBqNuhoRstaFNrGALc2kLaTezfRiYlKOKL+quTyAlcMpdDRndY66Slfl/UPxRB6QZtkgbxkrHTLR02Xvqg9wGTI4afmwyhUVHL+5o7fDtVreQ5jU0BI+PZcOVy6M3GJGBEB/CAvC4E0QdLcoMrFP7SgYwvpyIDfpegODNDO7ZI0dMczwxvxNvDWq8r1cBGibu4E5xYp6pu0f46LWW6FebD9P3p6TYJnbVQ0jsVTqc0bpfF7QmWibH9Fz01Ebfy1QBi0+AxO4iSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QitrP/kwgQN3/KF3zsA6Pe8sWAyRHMokU8bcPhDwk8=;
 b=iRoSt9jBsL5yr3Z8O796oiuVyQ6A90bC9wOOOdevDxtpRPB9IZb6jEpUYyTb7GbyctL/ZrX/qrBuFw/BmH02aV3C3JxyG4SR81lLi7bYPOQajVJDdadLA0FoVzytoswlnXQWISX/3+B5LhAt+4ZhOmskc516HZ4FH8wRUA7RjSGmMweLFBRS+q3JNleOuFpKYE9gl4OUrkjMzCfrVSyDrZG2/5iAyhzaDfXhFftU7FPnjzLWQVyeP/KC4giVY/1gjecuARc/rYM3oSIJkU0btwgLL0/BW4pDajx3dyBUtF+8nPP+mKcKND4s7UPupgKj/vOr/S81YGIgsKHWhi9iOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QitrP/kwgQN3/KF3zsA6Pe8sWAyRHMokU8bcPhDwk8=;
 b=VDZq05954gO44AB1BSvpwwkvkVbpt+QcuEmC0qhD45PZykxPRaL6jOmIdPKs46Y0oQKcQ7HMN5C3eS/K4SOnTnuoyaInTNfXBHF6qzOJMUt4NRP0Ni9OnIp4lYfOW5bGhmtONRH8cQI7JCZ7EkFuwnOcriHT9rM+UUkiMzQC9aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12568.jpnprd01.prod.outlook.com (2603:1096:405:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 08:46:01 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 08:46:01 +0000
Date: Wed, 3 Dec 2025 09:45:43 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Khai Nguyen <khai.nguyen.wx@renesas.com>,
	Hao Bui <hao.bui.yg@renesas.com>
Subject: Re: [PATCH] media: rzg2l-cru: Replace usleep_range with udelay
Message-ID: <aS_4t5q_foMuDyAl@tom-desktop>
References: <8d9896e0482a1e04ae8934a1bdaaa7de73f919f1.1764691610.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203023552.GM8219@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203023552.GM8219@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12568:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a0c8b9-66c1-4483-847f-08de324862bd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xmI/h6enNrE/0eaAuN7ET1jjmTTItEBLSKqHCymAzVisKzIwjiRLZERw6p0o?=
 =?us-ascii?Q?69gwvw+XWkObfrgJqogMrsjRLSR1H3ZYedRM2d1hdTY68G+KLuI4DE4UORZ1?=
 =?us-ascii?Q?BntN3x2uRKgGgklGcrNKU93aA5vDiVVp+LQ6Q+GsAxDnQsKMS5qEAFCNYBv+?=
 =?us-ascii?Q?+AFh6r6fGzFucsrCasI9c9F4bUewiahbfha3m5BeDGo+X1pjC8j5BvsMXyGz?=
 =?us-ascii?Q?lTR3h7+8dVGQ+6q1nTl7qKctXWildCjziI6ezHSJ3rlW80mAy7gJNmmPAT/C?=
 =?us-ascii?Q?2R6b+5nsQcXjIB00+7D9sSh9NnBUkdonE/X6Xg+kDS1SsR/sc1/JQVGldScj?=
 =?us-ascii?Q?pchfCYALLjb3BkzDiG7+84Ej4cTqr5BZ9SeGq7HPaCnI8JMBKQTLrayXi/pF?=
 =?us-ascii?Q?y6hsu9SoSTbLKnXhO4ZW6yq3ScuPZWDv1utx1bI5vs9esKjRGMB94GBJSpbM?=
 =?us-ascii?Q?T6QOzEXFmjfj/jdTGX2zhyExduJep7RMz3klLmpAsQfSxRFTp3YAoX1UV1dA?=
 =?us-ascii?Q?vcoTvqZaPL5UGywfMkRqsT91fU/UPqrNPl1qIXmv9ojugQbBuf8s6BNh8gM/?=
 =?us-ascii?Q?EdNkmHwDr9DnI0BWPO1egnNWnw5w0c/lHtuQqJVKgthhFQQwX9jiEVb44BMF?=
 =?us-ascii?Q?lc/JNo3o2EtNCVsRCNRH08Lr3vAE4v/fr8YfUJWr2N9OCx/10/ANmDr2fxFk?=
 =?us-ascii?Q?IZmZ4yGoTpBs+JTazSykt2PpJbyWhLc/DouPUULLPootwgDY3RGGSuS9UOJQ?=
 =?us-ascii?Q?u1oPxB4PZUQ3oN5apb74s8vn66vPIFAGNppmq7yeQXoJLjhpRsQFeKh+QzWc?=
 =?us-ascii?Q?QN2imiQ5I2mkXyE0QDxaZ3nGfPPXoL3/Oo7XIywTHxbiXtYpu4GFC/lp9ULc?=
 =?us-ascii?Q?qPcMNseik4DZ/qq/lmJ7sni2k4CLsPA+bgcuKdkgJMHxzzAoGcir66h2rnq2?=
 =?us-ascii?Q?szAcsil0DbecqbzWaiPlwYNc8/AdBxKY9RhlvQhiSvJW4UsOcaySQYTqIi9N?=
 =?us-ascii?Q?ZgcTibJS5Ags61d85YDXsyMGzXUHAdDfiGjlMFyeSKDAWKCE4Qm3BEjkqda2?=
 =?us-ascii?Q?sJl0isybnKiHZCk+icYLOQuljGtAH7OOf2/LIE4BLQRNgl2702fQ412RA1nT?=
 =?us-ascii?Q?0kwK0c/pYav2uSC6TF2keSTmHQgtqkWpD+M1Agiyuw1cY4YEAukZ4+8BTs97?=
 =?us-ascii?Q?RgWKFSpjLjSw/xPs7v4GpMq6XWof03Oh5WMejRHaj6mxLMYDC6Ex1LsKoyt7?=
 =?us-ascii?Q?Yk1/SKgq/kNdNrYyMFvnsMAp1/ldihexBp+GnfkjbZkDREKr3+8rOHXrnWvL?=
 =?us-ascii?Q?Q5imhp5M3MYKyftc2dVOYnX30509ilVGs5W/qx4OWB990YOS2RHqgJd+fQe8?=
 =?us-ascii?Q?AxIHyh1UKi0c3c3nEugY+jz/wjjYELo8diJTEmocbgb2GCi7nA4SdWcwrnwr?=
 =?us-ascii?Q?Q8PSzDS4Qooa1PZSgAtc6RKjC2H2S0TUF7fL0SZLGe8tEcJxYVYqWFnTKEhb?=
 =?us-ascii?Q?4Jb6/DGkcH6NeLAm5Cxw9fROZmgPMhmguPUK?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?m1WZl9CNwgbUSduT4l71T7rr6Wo6PwsS0Dr2apJv9E7W6K4/Xv/5AgNS77EI?=
 =?us-ascii?Q?Q8fTnPxVKmI/c1I3clZKMj0KjC8LVI2mgc1+2iU9Cr9SHMoEW8O6hnvyVsDZ?=
 =?us-ascii?Q?bUBXFuHjqgGCoH8plAGBvCdXlbUZ9CSKIJ2KFb0qSD9JT2ZWUUqcOfg3JWed?=
 =?us-ascii?Q?ujrSdpAZZThqTIztVovCIXei9sY6GadNCHMKGPvdWGF1O0tiM0kYhyDIy46j?=
 =?us-ascii?Q?DFOw+mmP6DHa4whLlveJyn/WU32e5gLMZnH3WobSCpfAMWBY5g0qdC/DpI6N?=
 =?us-ascii?Q?Xwcf+aXcB4Zuzoto61kd2iZ3krdsOeEaU2y2rjGi1qOfqyDOdtBnNBCCx0i+?=
 =?us-ascii?Q?irXJClwP6PY7oaMbvbGHKbLxZaS//l2jh/1M9/bMNpEkas9JnYh1QYte9UNe?=
 =?us-ascii?Q?dhBW5bGQ85MSFipzaTTbBv+DV0qeolPg9tg5adPTQRzXJ7NYT+gj6RBSUPcK?=
 =?us-ascii?Q?mAzAfJ5GcbdGWXgYFoEk9C6MXIU3DktPXvkKjssWckE2EGj8A0Sb2e69fGhp?=
 =?us-ascii?Q?tEtOVPxheJmIbtMbI7OPEVoRWUtpmbtVxGBsUrXLE9dnuye9paXtJzgYpusl?=
 =?us-ascii?Q?laI7UcTtn9zfoW6G75Of0XzHMrCRGvTz4N1jHlzbHqkeLt4DO0lr79+N5Aql?=
 =?us-ascii?Q?EGYt+ZFgrJ3FIefSuzTqyJ+MLlBRoP8Q++WASLjGAYyjdnK72MnpnpV5Upft?=
 =?us-ascii?Q?QqZAf5GXMFpzs+4XQUbBDG5ByEeZ8vukhEVWxsL5Ci9Frus1/waRAOamWAHO?=
 =?us-ascii?Q?x/goMTPloWZ3UFj/lDiuvrm+r8LM8jeGl7n/Ya4gu0WDye/Pc97wgoyJOH+U?=
 =?us-ascii?Q?IbFP2VxYfBhDQ1kwZseCVulhNLS0tXMPX8f/+OS+R26y2Mh+H2HxE9lsp7O5?=
 =?us-ascii?Q?HKqHKtJd941PH6SNb3vAMR59NTw3VbpjLisjjwzpOP5bbdGHMhV3Iovfc0UC?=
 =?us-ascii?Q?M8oBmqtq055e1v4VWtA3h1Dmj7i3Jkp4yho8mffUTlM7BaSuwahqlKUVUPbP?=
 =?us-ascii?Q?poiQkiMyUFkdkZG7l5KinbkpDD676ulUOngM21upTLs0UsiG1Mfs70WPnTkq?=
 =?us-ascii?Q?t18nn9A2V7+bv8kmmtibTRMQvWNj0YTqCBpp7HygZ6Gi2z0ds1ely+9h6neq?=
 =?us-ascii?Q?ZDRqfQq2aIigJRXnhMnKCOPT8Y64qKeTq0+DRc/HemVbymoTFTDRZmN+Eu3a?=
 =?us-ascii?Q?66+1IemxSH43EpjIoEfudDZveeTgoZz37Hmy0s4RKOTiIERgNDeDHoIstIAF?=
 =?us-ascii?Q?/TjwV64g85QiIaFwB6Z/0+nDRfepaQuRPho5s7dvpD2AeTmej3yKwyNmqmcG?=
 =?us-ascii?Q?AfEjvTv4F1W25Dfij3LB2Q63T1UEzFTg/Bzea+TOvin+EQMd1qoHMndW6mD+?=
 =?us-ascii?Q?h0Zz8b2fwJSI74iYcC2PFAzdQxUWA9Tfhf7Tm9V7Fpes1KCXqs4M+KQcyRsC?=
 =?us-ascii?Q?pfL0K3hGG4TRt5NvB8bXTUJ6Fk59wG+T1DL5FarZgtjlkU+ojsyaaHyPuG+a?=
 =?us-ascii?Q?3ycAMRr4vFXoD0+mB1E0JYNOuaxJWe6f03Ati/CYIIUC2Up5Ja2HPDZsx0pZ?=
 =?us-ascii?Q?CjGV9xLIPrJqHzxLu/gOv9WGOyUOWLSBV30AA7bb8RgWCxiE2AVDNbAj8AQw?=
 =?us-ascii?Q?CctMVZnz8DgEgkoJ7Mli5cM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a0c8b9-66c1-4483-847f-08de324862bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 08:46:01.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Elx4y72EPAk3JKc2jO0QAlb5W+YVh3ZXqWnIKEiaSCsjlvl+6E72eRzhYlOjEqUUWqD6AUJp9Ibo7UJL2CCCqqJ/P2HrQculRuq2KSbG5UhfvCl8wQj+T/IapZAH1PFq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12568

Hi Laurent,

Thanks for your review.

On Wed, Dec 03, 2025 at 11:35:52AM +0900, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Tue, Dec 02, 2025 at 05:08:41PM +0100, Tommaso Merciai wrote:
> > `usleep_range()` should not be used in atomic contexts like between
> > spin_lock_irqsave()/spin_lock_irqrestore() pair inside function
> > rzg2l_cru_stop_image_processing(). That may cause scheduling while
> > atomic bug.
> > 
> > Signed-off-by: Khai Nguyen <khai.nguyen.wx@renesas.com>
> > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 162e2ace6931..1355bfd186d4 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -369,7 +369,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> >  		if (cru->info->fifo_empty(cru))
> >  			break;
> >  
> > -		usleep_range(10, 20);
> > +		udelay(10);
> 
> There's an instance of msleep() earlier in this function, surrounded by
> spin_unlock_irqrestore() and spin_lock_irqsave(). I wondered if we
> should do the same here, but that lead to a second question: why does
> the driver need to cover the whole stop procedure with a spinlock in the
> first place ?

Good point :)
Mmm maybe the only critical section into the
rzg2l_cru_stop_image_processing() that needs
spin_unlock_irqrestore()/spin_lock_irqsave()
is:

spin_lock_irqsave(&cru->qlock, flags);
cru->state = RZG2L_CRU_DMA_STOPPED;
spin_unlock_irqrestore(&cru->qlock, flags);

Please correct me if I'm wrong.

Kind Regards,
Tommaso

> 
> >  	}
> >  
> >  	/* Notify that FIFO is not empty here */
> > @@ -385,7 +385,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> >  			AMnAXISTPACK_AXI_STOP_ACK)
> >  			break;
> >  
> > -		usleep_range(10, 20);
> > +		udelay(10);
> >  	}
> >  
> >  	/* Notify that AXI bus can not stop here */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

