Return-Path: <linux-media+bounces-26277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6FA39C0B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3C0916285A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4652417FF;
	Tue, 18 Feb 2025 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dZiIGKD0"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5422FF40;
	Tue, 18 Feb 2025 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739881303; cv=fail; b=cYWKcyAHsmH5XXo5Qjx6plMlo5fj1AC3Vf8dPiKmLrZn29U2C4K1iP8e80KScp2WDqqlHdLe/YBLf9CYyHAl5g3SKVzPtJ4wL0eCEzPjpxTxWkmqvoU2qlqIoe/cB/BAK+5WNgFXxUgPv0XMCRNAeH4aqb1FljjHrqq7NmEwHLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739881303; c=relaxed/simple;
	bh=+e0P/1hk7kjq5DQevRLSJ8TrV2Fpse9Rm5/8QAOU+Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lq6R6r2qIBIRGBnwmINm/wl+v93zTsc5p64m/rRQV2sNDbXwCVAeLvEcG+PqAetPpckb31xPZZWbZPJYtbpJg0GpO6KWCA/FoNBDHLlAoNunUJ84C6bnR1Nmf7Exz1TIRh+xJgadL6ko6qH4VsrAgY5zXNMbURmbY42nuWA5afY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dZiIGKD0; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX4c/nDKL2bvfj9ZTDNc1hLgLFKa/RCrYKRhbW29kPMOeWzn7Q9HfE7LfVFpoTjv/q3hqOzTfftZHTUUt6HtyXNvn2Do4ItW0M1OpixINmumQHOt4163tcJdTkMK3pYcWanxZ596Z7X0E2rVNtjUMGTee/b3f3JZxZe5e1G69ATNnHet20taN13Lk2FG7xINXOiu6MRkUGQEs7N+3V/AKA0TzvlaPSG7cpLIRifB5EQRXJnLB7jcU+wX6K/F8YNhuHKeatDMcDlMmUS+sdwthpXCiLIj+ggMbuJxaZf3bmBKSu/d5TUFNjJPsnNc3mDYo9vR2L5UHzSAIiffsR9DRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEz7LL6VusKVsyeAO7qt5RtgYvXj3DaEZuC0FGI/AZs=;
 b=NyAhoH8Kx40JIXOBJurpyMueknnYEgXHp6wWoq0A0JNIBSfKNZNEOila+ymb/U7IRFXbbvleDgmLoNkfCQLmFajUX6p3sFcT3U0tVuUCA9zH1bR8HPjyuGXiY++f58R8sJOYFPbsaCrakGH/B92yJYG4WCtpqva3119vczd4sB9pQvpGlucwf05RH5fB4xyhEIEqIygtutB19ZX6iQtb9d764Y1YDJC29rhmHkyBE+68ThrqjmxdqvPpzHvUlOa5LeQ+QCb2mFtZD1H/Mz+eJwQ3sDeZH02A2XqK2PnlfnqEfe5+BCaOHbioRKYp1CoO8HraHxILepS4pwT1/EV9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEz7LL6VusKVsyeAO7qt5RtgYvXj3DaEZuC0FGI/AZs=;
 b=dZiIGKD0HD9NGlQKaeROhxmrokjRJXMuffvzuhkAbz8tRM464Ur6650K2wkb2suRtlHfqGLH8zcT9INV+YOM2KDmfPSi8pwXsTife9fhtqoJHXiGgnLlmgBiCkcNvN8ujXYVBj0ay9SQVsdh7V8+YuuKagP4vEB98se5sGBnt7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB8323.jpnprd01.prod.outlook.com (2603:1096:604:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Tue, 18 Feb
 2025 12:21:37 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 12:21:36 +0000
Date: Tue, 18 Feb 2025 13:21:24 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: rzg2l-cru: rzg2l-core: Use
 devm_pm_runtime_enable()
Message-ID: <Z7R7RCkaa/iBtf4M@tom-desktop>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-9-tommaso.merciai.xr@bp.renesas.com>
 <20250214005059.GG8393@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214005059.GG8393@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d8ccad-ab64-4454-b429-08dd5016c9f0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?AgBgFteK7QU5ig831Xkqd9LT/lmCAzqi/iBJhYUJ4SZOQrYbPFyf9WJjoAwy?=
 =?us-ascii?Q?w86IFJ9ar0Z2bQkOqN828LDtLfYUg2NM/4WVQc+fSv+Pt+TMqP4DFFzinczo?=
 =?us-ascii?Q?Hu9e5xYNHgbVNfBqwr1LNMwAe1UA+81uMNEboDjyD00pm0ZCO9xy/DUg3wJK?=
 =?us-ascii?Q?smYJKyQk7+4gp1JBuYZUqw/rrY6FINwMz92I+DSI2zhCZDqV9hqwLjBAXUCj?=
 =?us-ascii?Q?2eQ0Eu4IeT0AaimTLKsSKQseFyTxb+ETA9fche7VMZIGEpTd0dgkEEbk9HaP?=
 =?us-ascii?Q?d0pLGoJzd7qOkNttbXzggFMv7hCUlIfhnFDjN4SHlKRtCzEwxNYqxSP+h98G?=
 =?us-ascii?Q?DLPkfpkvo+H9Y8CNxP95LYuMrrc2sBoPTDFxC3abY0gHnR7nawdfntPTzvpz?=
 =?us-ascii?Q?Whdf67ejcgxFHeEj4Z2JIFm3j/tVUYc+gHDq4EaK7xruKAdJk5whoqg6BI15?=
 =?us-ascii?Q?vXkMoZTFgZi2NqO5B76PQRqlLSAtck+DGzqAtKkUfCzejsTnykcP/yBcxZrp?=
 =?us-ascii?Q?rUaf9lY7YqiDJGnc5C7kWixr4hC1i+4jDtNlmv02g0V6nbGLhVJpu56M1Eqb?=
 =?us-ascii?Q?E9swiDWrBcEwDVW+gVkn01Ta+LjemQzNyAHeIzI3iSSQ5uQYUUBek77HNeq8?=
 =?us-ascii?Q?0DQYiAjALU1yMmBNwW4BvjxTGfM71XkR5si1Nw7pZ0Ad2bFIOmApJHHZ1zRu?=
 =?us-ascii?Q?sA3fK+n3RGXmi1RrP+ZVdPqf9GXYjeUpiMBRzdp8c1eSTPawG+coIyV2Jf+y?=
 =?us-ascii?Q?M94yvIrWhOrxYCX/wn00xoDLyDCmZc7/+rtjvUmx1gE9QSL4GYlN+YcrUXy6?=
 =?us-ascii?Q?N7r2IJdH7PYxTAxzCA3EIKOrYzFxd61xx3BNo1cTLIoOrqp3T91K7vmoYS8q?=
 =?us-ascii?Q?3p522WnMfiFK2gVwmEtpg5qeEPMNsOStm9EQ/MeyyGur483KuMWB8F0K9/SK?=
 =?us-ascii?Q?0WS1fHOTfxMnJPQuhCSByGlNZkJTe7BYjmf29k6YpaLPtqJuihUwlGYnSSTq?=
 =?us-ascii?Q?zWjOkvBFyL8mm5GiBsJD7ATnQPGlCGS0cDxIX+kM/U8ZHNDGKGhciOe/sf1m?=
 =?us-ascii?Q?PWOeWd5CDlopi+/rnDph/3aTBkO7jtdpRV1QgUAzgws1hwdCJm9XqAdOAjXF?=
 =?us-ascii?Q?rwZBsiB8KHhVOeRnNcRag3yytnf/y9g7aCcO6NdHiD0Ws0mRSSkxFiVyTeUy?=
 =?us-ascii?Q?2cOUVNrdG8jLLc6YU35T4Jtj/Ih3GfAUE0nrD38lOB+oeCOqltfkhKiP+q0g?=
 =?us-ascii?Q?Zh0M51RnEhiP0QgW2khDhPy6QtA8cvELIRPZ5bcSC+LGou2EOhXrTvCm1ZNX?=
 =?us-ascii?Q?7Q3MJ9JFc9RkSbbZc7CgbqRV7/3PaL+c08BJxDb98WHR55bCbL21xqdM8ihS?=
 =?us-ascii?Q?n0C144tBjC8uYtHzRhlid3GryfnI9I8RIiLDCEQMbFW2KX7tWTw+9Ft12YaL?=
 =?us-ascii?Q?JhwSezTTfLctr7EVYsDpO3h8rAPUO1rI?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yxC3CbPB2tjapQJBON8qzoi6KmHCjQtAqhqBAsy8MM2eLTmjEJ6Eisk2R4tw?=
 =?us-ascii?Q?gzIvZkBw15VbNHu3p+xen4zgCccI5X1/zvSEBYY/ndgFuaeVKHUcAwojT+pU?=
 =?us-ascii?Q?wjjFWhza6AAa38oOmikr646F4+O7apKesKq2mH6aJUzpOxuUPlh7CO4Cb1Fk?=
 =?us-ascii?Q?Sp0m7X9YMjhiCN4L3HSL833pZVjF6/I1ojS1VrylcXJv9TUhDWOXaNqJLtGa?=
 =?us-ascii?Q?YSykAZRs7ApJPyIeaOZ9Elywf7q4m0tN+zBMz9jj2zegIjVNUS+QAOWapBry?=
 =?us-ascii?Q?13Vu+tKvP1UhE4RMeBk77QLKP+V7DwloranyuVeAhIhJr1aGS1NAb3WLoulE?=
 =?us-ascii?Q?1aOBRYRC6a6+bFlEgnACKJQ5OjOisIu9KU4sKUPHzZi6ShMtDFKZ1lcp/AJ5?=
 =?us-ascii?Q?SM3OGRLJ8w1vDezWm9irBGLBTWU4CqW9DA5QDptUsajUBSCqzwlL0UEpEBtN?=
 =?us-ascii?Q?nCZA7J2UzsTwY7dukbtSWpd4IbPRUDSwo1txSLXjrpRG4O2bl8rvCAculYH/?=
 =?us-ascii?Q?BSXHInIUQ3WJnWyXtnHGsvLtUy/uSHm0nYucs6PbOndk1uoMXc2MyfQ7LtlU?=
 =?us-ascii?Q?f4ga7kZ54L4lhDhwkoBSojzrlE1SvLh4Pkz6IJduCIUD9DttIs5TqgLazA6l?=
 =?us-ascii?Q?yZlFQ9VD5i7fP40Rs4/lpJOKwoRPV25RSlP7lY9mS4v+TM4RbB8+mdZ3A7M2?=
 =?us-ascii?Q?tvAXRHvpldT6RbF0q+i3iqUUbgqU1h6brceJkYrBf+pLreJRD8BUArjX1dRC?=
 =?us-ascii?Q?cSSSY6OnLn0s/aMVxkHoULiT5kxRJcDqGZwT7fiTBPMboYFsgjNcvoVibnuN?=
 =?us-ascii?Q?k/IsycQ8gg0EvL4Jlk0708+UQu183L1nEpHAOUDJw1kTB98aLY+hzg+cXd7U?=
 =?us-ascii?Q?akKE3ITsNQZ7DoFW5tjLxfA6D4Bh2hu9GCAFFUjZHD2/amAjgGdhlier2yp+?=
 =?us-ascii?Q?hgB6Shxl5dIBlfUtPKKYSw4jX+HwJJRAzA4rWBTleAF5SVe4dNEViC2f0mBP?=
 =?us-ascii?Q?AVPO7Gu484LW6A3PB7f4Gu1s9RD+AVRJj1KuwyhK3M5/hqbpP3SA4b5lEoQu?=
 =?us-ascii?Q?+tjCxBJY5YfmKV03QUHvXKA0ZLLdyuvWzNy2Ofu/JPeHk3PCG2Z8UmU7XHi0?=
 =?us-ascii?Q?6XnJTcAb8qzvQ74ilV8ftDMw2JZbnoJkYBkYByiUBETALDBMQJTeITup/XQf?=
 =?us-ascii?Q?gHO02L38pqdqLBIESNgAd+eBcgccimsrk0/S56R2ASaNFBj6+l1TRpC7Yh2Q?=
 =?us-ascii?Q?0LBeQH3gV0Br+UVmLXubX+NuF3pWQFkAKnDd39v6Bn6pLLFmBFcuuoexLhNd?=
 =?us-ascii?Q?CFq1q4jQI/gMoru/nvWD7ULDY+D9npjXXICHWeS74BExLSK2MkNuhEKtP+Qo?=
 =?us-ascii?Q?8RyUjlMnIj0cHl/YVdNu+5ZTiCNIyb/NCg31C5oOCin6JinyapaDqp20d1hV?=
 =?us-ascii?Q?fNmw9BDkaJsFBkgVoqzO+vCreGnLAMDQdXYGd60uEMGBtdG9MeexjjMaRjg7?=
 =?us-ascii?Q?XIjOcdiUnPbhjlqpeeR+Ek1IyI5AnV7Nle+v78jfsgfifVaNfZk4i/gxl8tL?=
 =?us-ascii?Q?Il4GgMaq0kS7I9q25Csy65omNbEf7rjexMevyMLaNt92FD6zt6fMzN2N6vLT?=
 =?us-ascii?Q?KIZCjRSCbeTTt1FuYC2NAts=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d8ccad-ab64-4454-b429-08dd5016c9f0
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:21:36.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hcvz5rvKryISdjgELwg2YFLNZkiuO9CG9NkXjwGv0lHFN73tYCxykzxDcbscAPwhIZ+w05VdcYbkvphwSQYgf5PQ49M9T9YcwlEeZoI2IYxTkF0UpgAL5z7gHQwzwyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8323

Hi Laurent,
Thanks for your review.

On Fri, Feb 14, 2025 at 02:50:59AM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Mon, Feb 10, 2025 at 12:45:40PM +0100, Tommaso Merciai wrote:
> > Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
> > drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
> > rzg2l_csi2_remove().
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index 70fed0ce45ea..5548b328d970 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> >  
> >  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
> >  	pm_suspend_ignore_children(dev, true);
> > -	pm_runtime_enable(dev);
> > +	ret = devm_pm_runtime_enable(dev);
> > +	if (ret)
> > +		return ret;
> 
> Leaking DMA.

Ouch, thanks!
Will fix this in v2.

> 
> >  
> >  	ret = rzg2l_cru_media_init(cru);
> >  	if (ret)
> > @@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> >  
> >  error_dma_unregister:
> >  	rzg2l_cru_dma_unregister(cru);
> > -	pm_runtime_disable(dev);
> >  
> >  	return ret;
> >  }
> > @@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> >  {
> >  	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
> >  
> > -	pm_runtime_disable(&pdev->dev);
> > -
> >  	v4l2_async_nf_unregister(&cru->notifier);
> >  	v4l2_async_nf_cleanup(&cru->notifier);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

