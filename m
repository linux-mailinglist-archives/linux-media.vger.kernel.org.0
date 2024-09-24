Return-Path: <linux-media+bounces-18490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1457A983F6A
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 09:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A781C21D36
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 07:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277881494A3;
	Tue, 24 Sep 2024 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BJfpKZmg"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5E148823;
	Tue, 24 Sep 2024 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163681; cv=fail; b=rV+ZubDS9nRdBEvROawhZ4YX81fftZTiHXA4n8YbrZa0wV/B26/GyGF90n72YdtratZGlbhN1dylI1q83Ovon2G0oX9rNpBHbVQKEqVVXizDE8E91RnUEabCyx7hHfpnjU87HA62S4ZGUUJxLCr/mOiiif7la2yB6eCualet14M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163681; c=relaxed/simple;
	bh=vHbJlbu4H85qGfDmW0nuwwPVPE3qXFwIHszGOuRkhmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qua9gdLMAcg0MLx9NK5yws9G1pKy3vK9By4JRwuAiCCMXqypri+u/HUkdke9OuQUjVR5DHSyIKqrqUxnVDYLpBM8RAfvSjWgDkHi9cHlQvISqP/lq7oseCLkwMaaIYV0A8xy3pH08WD1RsvGzdO/aJniQEicLzyEKUOMVrFE48I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BJfpKZmg; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi8VhHAATBKnUUiPYLs3jPGUWY8H3LJFzyROI6Qxyb8/em1peeoBJiV1bYdo3Q/oMw1xjT6I4CiwoZ5DfVVBdDNBGGfByvojzbwzE/OevRI4nghX8uMSJZLV0ErdV9nYeXiar8vKZ3lzI5DiRUfjzkZHy5GCY89qvNBUH6VZRhm9Z5wch06Y9D/6lGpJnLrJ3C6WbItQ0FU9I6Oxne3WAjmL0jdAONT42f0YuNXPoNOD6vJoFJFsezeIIue9PswLK7rXKcxXW/eixH/SXL4cuswo+WOI6PHKzJS/23KO6L6Bz9UFyHzuti8SPqyhsl0WYEsmLxe5byGNzVdEeR9Dsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBTtvEQ9V3WMy6LqgvStGp8Y0FuZWS12xsK9AkW0/G0=;
 b=Cvpo/RQmAeSXc7pYVtxn9YssBS9WZ03Aj+x9Y4a6Rzt5ScUBz542Iouch7JujXV0/UL9rrGosfYOngZ2ymSBmGR+RWNP4nop+QxuakVNQxlsfY/ho2lsRB2A3yxuDeY5q6bOgryyzoQBlu6J+EwN8aPo+fGteHGCbfZiSP/r9o+liu7fJEkogiFBwwkz2nEUhJqY3UfT5fpF3ixWxVAWk8atBe7uKc7DlU8M2nZLKGiJLI8iuweaO/bwsRejBlvjE8IjQc7gHUC85fS0+szxK+O/LIHzdDexY+3r7kPoxn5MBg0g4S+H9Q0Xvj6r6JJiPeSn+tqY13J7+gG3T2sWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBTtvEQ9V3WMy6LqgvStGp8Y0FuZWS12xsK9AkW0/G0=;
 b=BJfpKZmgP/wC5gWNLAntvPtRFJE1313qF/heyD70IXTjtvG6yjm7vpqxc1viKCy7Nz4yZWAmvvhbskRPvfV7DR5blwFCVb38lhM5WimR+lo97XZ+R04aumo3lf9c0PN/IHEr/G7U4C+QaAgk/a54L4G5vlKtUzrLVIqNqqvPrqNCdULLoZcZkwlkI+AvSgapZkZCkUpF+7nT25IjcYxKJGK6q17WyA3tV45AgKY7PAvW2/2PC3NZ9jISkkJJfrdEWx6s3JWehD0RNYBjBDGgtncFH4pAPlGOVndNYKlz/PViXILgWspDaQA50/uZLS3fulVeTWDHyaJQxsAAEv/vtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB9PR04MB9867.eurprd04.prod.outlook.com (2603:10a6:10:4c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 07:41:11 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:41:11 +0000
Date: Tue, 24 Sep 2024 10:41:07 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
	Stefan Riedmueller <s.riedmueller@phytec.de>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: add m2m usage_count check in
 streamoff
Message-ID: <o5pvycxgjqop4636tf6u4g64uhqyro4lkmspv5f6rxlnvsg24t@zr22tgsh62yw>
References: <20240920142715.2246323-1-laurentiu.palcu@oss.nxp.com>
 <h74uhtfdqzhq4qgcfqonwrlvoddaspi73h2m7u6bg6akjq3ugm@vxjt5ttzfkkx>
 <20240923215246.GG8227@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923215246.GG8227@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0PR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::48) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB9PR04MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 470eaef1-48e2-4d2a-9792-08dcdc6c42b2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Cl3wL1biu5SBmF3AttBVkP/UxUlBvFFezDid/Wx4XvMx6ZM8RORmHEHU/T+4?=
 =?us-ascii?Q?5QjZfqNq3rkxW6Lo78AyG+V6Kc8Q4rKOgGw4hIQObJd0BlpBt54tbgh+nJV9?=
 =?us-ascii?Q?5xnkFQ7O8ftpQfO7rAA8QtGmOi+j1bRiDW4o19J4YWUDRJ37PkUDAOTAYHBd?=
 =?us-ascii?Q?aPOGGZmLpEvlsN9Xz+I16zR5l1Cqamz7B6vl/kbmsA3ADR2smSJp6vfcWDC5?=
 =?us-ascii?Q?bHeGCoQfb02RfZYfRh4HD+hUjYwjnRlVt2SzKnk9dMLZoELotYF5R0NAc0Np?=
 =?us-ascii?Q?9O8pt+nnAoece9cQQqHfhYPfojDMwXOjHIWrN2fLetIOxX17Rv7P1/I2Lvau?=
 =?us-ascii?Q?rneBw3kyUGSVoelkQJjHZEZD9SI6K9AiedjOJplbNYFrneCaRXtYd5sT6uGA?=
 =?us-ascii?Q?0c2GhMNuHOUUPfqTX0ot8+86etVTKyX1LYHAfUsTDJDyQeEGlz+P2IXLe/yd?=
 =?us-ascii?Q?SzKBKeJp55FJbm9yIQpgTO/ln1q0S5Bgv6oxLoREoYHhaZ0P2D23rQEuPUqu?=
 =?us-ascii?Q?T4n6wN7+BSO5EMInppnjhawntLuAwd5jBozTFknzwUhiF/6M1MAQOE3JNu+O?=
 =?us-ascii?Q?9sM1Zy0UjYcRVyBS8STO3Dpii/ybFBZR8CFKwcs3ISIXHS84y9jR9gN6tiOX?=
 =?us-ascii?Q?4uelAZ08t5VB0DqzwHP4zirdDJBbX2IAYNTAYj/OfBO/H76NfrU17OcsMWMs?=
 =?us-ascii?Q?5P1YdH6aPAjlPQoEFh9jNeK257isaBgxgk/GFh0cdwuUbBHDJYo+XfKZe6aS?=
 =?us-ascii?Q?3t0yTyHqlOB5v8b1VGV5EWlAoOH2+u/A+f2hSXcYMHizDzIoeMzaQrUXxMoz?=
 =?us-ascii?Q?y/LAQdcjFx64hVCJWUiF9fPGlIwPVqg47otkHOUKThQWicHu8058e9QQwonW?=
 =?us-ascii?Q?C2ItFnvQ1TpGmNS8OjorsBFVfekC5eWgDUaetSO3YvPAYI1lG8NpN9iFP83a?=
 =?us-ascii?Q?nijoFqfFyMbZxmoWLx5MvSlb18pkSR6WXrCZXg5oDRmeNHq9VwpRBc+j3n2W?=
 =?us-ascii?Q?3VF0Hlw2Vp7Qg+TnwzMrKWXY4xPfhzV3bunnvPg4rfsOEX1tDtmv5SPAjJpE?=
 =?us-ascii?Q?tKDbuxyDsRNlA9Lnfqe1WCPV3P8dLLR1U04uoqAyhcYeXA4teARaMyP+Iilc?=
 =?us-ascii?Q?OPynvYfTJJGEb3v2ZP8VyHKQG21aMvFsyjOjpvoxYRoX+FClP0r6uTEGdDgs?=
 =?us-ascii?Q?xpPMpc9vOgfJvtDkjaRHRhRpUAJhoegXKAkLbLoKICKCmtpDr0g+o70/hp7M?=
 =?us-ascii?Q?V3kKlIQHD/bp1CEMVLaKgHc/7MK0fF0G0gw+FQcAwJT1O6if7eaHhZYETw59?=
 =?us-ascii?Q?4SIcnq39Z93RaPeRmD3eZFaseTqMSe9hqD161OzG6XydzA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oVwWiSeSAqF0h4Wxl0Q182C3AyFw1G0uDBjn0mz6AsIYDnbtkxK40AeYME2w?=
 =?us-ascii?Q?FfAPW6hXhN9cVr3KC7nTWLWUc0sr2XtNHdpgjuIVnTJhyX8nA6RtBGJsG08O?=
 =?us-ascii?Q?AxOGv5YJJzXpdLRTgWRH7p+p3Oqzy7U2rjPhSxw/M1tpJyfs/n5WYWUSNmSk?=
 =?us-ascii?Q?SuOqfnFiGDB4oAOXtPdl0ipxfQlyTT/0jyGsA4pv/3ihDZYxBxvePjehfOcH?=
 =?us-ascii?Q?2/NCbgZi8NakY59HRHX45mzAwScLBpOz2vL+YpqD0J7XuoFM2NIaNVzEeBfx?=
 =?us-ascii?Q?pLFhmMCLQoYz12+LziL3HsnNhEdZk0x7bQgbGcYxNywOql4t1i3PuYRGmbcr?=
 =?us-ascii?Q?bFt+Q/JkxTRLPPHRM6BF852ih+nsj5sv00X06bUPL1mqn0aJn780HntWwlRq?=
 =?us-ascii?Q?N9whmVBwffqUttF5vaRJlC16UhO4DjSCy9Pe393ir26hKNvyTJHVCwx3Vrhp?=
 =?us-ascii?Q?AGx/D3bTdcuVsjvPdU0VNRKOrSV+BJKN+2aqhSXuN7Mk4QEdl+t1QJ8kFz9r?=
 =?us-ascii?Q?8Il/aXnHnCrzcWb2z5jSSZwFVTs4KXY8Ge9feY5FX5wRzKUs6E61lmFHWjAS?=
 =?us-ascii?Q?KHaAiSCPDhtVvDtCEGmAJdsOOkOrFm/Ns+OCcgi8CEpArW2XykV1uqvqi/25?=
 =?us-ascii?Q?XkERZ5k9IULgwM6YjgK5ApEnwphMKf5oI2IY5B/AWUMfS+DiHbtoH9v7PekQ?=
 =?us-ascii?Q?lP4TrEY8Kuu19rNc/RNKzJ+75ny+dQ19g6TuIzTT57U7GnM5rJpTE6fIIXh1?=
 =?us-ascii?Q?jDdhnxPizUtKy/HDFVWQg2WV5fAVmdze9BenvjJDVcO/MEmvkAwRJwIw0oF4?=
 =?us-ascii?Q?IcVNxGRdNgp1Rb75yfHZBE6KZw6fdN10PlJVL18k65qIJE5pLopSfCyQ9Qqb?=
 =?us-ascii?Q?cSWrhn9WkPTfJN14oD3H5DHFlU+LVt6uONdbhVFWTFDe+5Gtyw/XGqML6x95?=
 =?us-ascii?Q?ZimtoprR5RElyLIqjIte1JeMoGmmaEVW4kY91nEchcTPC/V+LKNwEg5qdr+r?=
 =?us-ascii?Q?ajd4JxzzVldeGUAW+ZmK8VgOXwCzVvfNgiCmniy8r+yHby6ZEI9ybRPgcVnD?=
 =?us-ascii?Q?DcOpU16ArYt0CRpmJJEyFBZ3+4IfOkLit0+mF/LYyoYqEQ4s/w8QOzIjV2OI?=
 =?us-ascii?Q?9J8eeicO5m+Z5H7zkRZbD4fKgoi+B2rnXQ4dYrYAYS9gAJsb5gul5h6mbrcd?=
 =?us-ascii?Q?MKcdRM1MsA0z3DJG/fZduwesiO8YgV6kkvu1GFkMm00x9pU87Nz0Yc+JxxU2?=
 =?us-ascii?Q?Yp9fhk9m3g3a6PchCDye3WkLpuT9v64HKsW2CFfklkmlz25PGSvg9So2rOUd?=
 =?us-ascii?Q?VXTq4rIkfP1lXRWpM/eSqE/BVaX4zvBd98ivzOxM9NSFMa1krD7KYfyaST2a?=
 =?us-ascii?Q?ZakxWMGNyoNLHndlKPrmlJg4TiQUjn6mz7T+oZ6YSax/xpv0q4ChqEsSBUcH?=
 =?us-ascii?Q?zXqY1woUKsP0nbV2FrTgU6BOt5wwbg+SpZ4x0YieQ5tnEwILObROiD/Uc+u7?=
 =?us-ascii?Q?h2OxD64vFwMyc8382a+dS4aDdXRQyyX96ZvMES/JKkNmfsiwi6WG15MrFtgv?=
 =?us-ascii?Q?3jHXhmWro7lezaSwWqXtMlYqJoAm0h6/BKEFp5fWxBany+hq1dxfDTeizkHb?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470eaef1-48e2-4d2a-9792-08dcdc6c42b2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:41:11.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8/n+Mzia+Oap2B6gGq1jjnADS2kyR53AO9bcJulcAy1zfhvvLAupPC16i5JfrJg6ZuhrwFj36z+OSK2Gf9qNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9867

Hi Laurent,

On Tue, Sep 24, 2024 at 12:52:46AM +0300, Laurent Pinchart wrote:
> On Mon, Sep 23, 2024 at 07:50:18PM +0200, Jacopo Mondi wrote:
> > On Fri, Sep 20, 2024 at 05:27:15PM GMT, Laurentiu Palcu wrote:
> > > Currently, if streamon/streamoff calls are imbalanced we can end up
> > > with a negative ISI m2m usage_count. When that happens, the next
> > > streamon call will not enable the ISI m2m channel.
> > >
> > > So, instead of throwing a warning in streamoff when usage_count drops
> > > below 0, just make sure we don't get there.
> > 
> > Isn't the whole purpose of the WARN() to highlight something's wrong
> > with userspace ? I think it's expected to have the same number of
> > streamon and streamoff calls, do you have any idea why it might not be
> > happening ?
> 
> WARN() is much too strong to report userspace problems.
> 
> > > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > > index 9745d6219a166..b71195a3ba256 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > > @@ -575,6 +575,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> > >
> > >  	mutex_lock(&m2m->lock);
> > >
> > > +	if (m2m->usage_count == 0)
> > > +		goto unlock;
> 
> This isn't right. Userspace can still call VIDIOC_STREAMOFF while not
> streaming, which will decrement the usage count when it shouldn't.

Hmm, I didn't consider that... :/

> The right fix is to return from mxc_isi_m2m_streamoff() without
> decrementing the usage count if the particular context the function is
> called for is not streaming. You will possibly need to also modify
> mxc_isi_m2m_streamon() to make sure the two functions won't race each
> other.
> 
> Could you work on an improved patch ?

I'll give it a shot.

> Please let me know if you need help, it's important to fix this issue.

Thanks, I'll ping you on IRC if I get stuck.

Laurentiu

> 
> > > +
> > >  	/*
> > >  	 * If the last context is this one, reset it to make sure the device
> > >  	 * will be reconfigured when streaming is restarted.
> > > @@ -594,8 +597,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> > >  		mxc_isi_channel_release(m2m->pipe);
> > >  	}
> > >
> > > -	WARN_ON(m2m->usage_count < 0);
> > > -
> > > +unlock:
> > >  	mutex_unlock(&m2m->lock);
> > >
> > >  	return 0;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

