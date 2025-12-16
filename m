Return-Path: <linux-media+bounces-48914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD54CC4029
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5EDF3032AAF
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CC62C235B;
	Tue, 16 Dec 2025 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S6w0C6s+"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B035C193;
	Tue, 16 Dec 2025 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899729; cv=fail; b=DfLrmrLXxy66mzW8o4LqNUyvD4nWHdajfkrmiNn4C8/QAc66gg2xMNLszv1YmO8R27ObewG92QSjVDvgVf5WTwxQ+KDdMlHV0JusurSlyvUbaj++WF9tQcal3VhhxKd1UStFc1UGFXQX9GxK9uODZfboFAtedu52qEUrP8PgKF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899729; c=relaxed/simple;
	bh=oP7YjxBb8hULlfy4ghQnrm9VbBmZmU0Am9Qf+FtpnhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZ3yMsz8P+5AW2dRA4xGxWl9v0k9U4+Qrmh+RbpjP+jKXBbSuVUDt+Wpv1X0GggGQx4sjAu4l+VmPRT8P297gJz7OgziCyLy4geUJXn7hxSuIB8Yt0M15QIOoQZc2IV2NsV5eMmUQSkW6En/TCOOyrQNRP5MvDP28+K3+8kDN3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S6w0C6s+ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJHeryoO/VHTWBk0MhKBspFWhb4YcUP10AHahFBFFkmJeKo9mLqDrZgvGFcBEloPdBxpanzzdQ+1huznpBuIf4pmZsm4p7EiqBXlExpiPXB3LABVFjVcNshktfyQXAspfsR7vujKUnXfkJm23K2yHQTdZ1dMBqPyRFk/uCGdtxdyvTsJq7Whv2UhAdEJWqj6aCTlZ16pUHg+8Yg9cA3mwSdHhlYnOx3cyhQujxQ+6nOxMVK04LdskI1KYU4Ha5afVx7Vu43wyCWlO50GyRuJxkrZV5iC9VsYN93KgmK0243lVMFEXQSHUdNIWDpikLF6lxs353z35wQtJE4znXLPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gIjWjvRKQaMquyQ4XmRR2SoR63EziobwEAi2GqrIho=;
 b=LeyVmfDmqWM10ojd69+gPfvbyb81KxCt+VN9rLj/XrWSitn5ymExfjn66Aq82dYuJeiy+3yDH+0AhCOpAbuamVO1e4bjdmLHp36Ajg26RPEC/707gzt2KNC2H9VLvRZaQacaZz5rmIAavaizqj+h/FyhmNzqOFsGAZn6MHykEjbEdvQuU0XTtJ27hy+k+rymPWCf0YYND8084u8IZaKiuIw9iI1YqwTBdKjwllnM9gPVEKbKaK8h1KqyNcBzXtKzzPfsCwVTYC58E8WeNb03GbDbrNeF55VCBvLVnPaojuU3YF4SMNN6bVZy1bFIRsiiDjbtVKBnEcDG79VeJnYQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gIjWjvRKQaMquyQ4XmRR2SoR63EziobwEAi2GqrIho=;
 b=S6w0C6s+3gmKfBIiKim1rff7KeeY8zuizayd2okKUUTkMIuIinf3LniQixHzKQ4mJ5NunXwM/7NgBeH7QdWgaVX9EXDJeIxDalNfeFfVpWa0o9NrX+dtRnO+Fbubm/9zt+elM9acTgctPCNajZTBRT8WEOyMZ/zf0g1DB9OWUWcf1qPhxGHtTurvrg/7bvvuwNrmGsTjBnNJ1XTohlInkz+/Xj3fsKx3N5OZzocLI3cLWU2SFVpM/nKaJs15s6rIMfHk7zIjllijkThZA5w1Un//9lA8J1L53qZiAebfmHO0MzGgURET5N93VA8C86ED0GifXT42BIM7DUdT9FYRiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB7504.eurprd04.prod.outlook.com (2603:10a6:102:e6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Tue, 16 Dec
 2025 15:42:01 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 15:42:01 +0000
Date: Tue, 16 Dec 2025 10:41:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Message-ID: <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
 <5462566.31r3eYUQgx@steina-w>
 <aUFwqMiYE+P+KdsO@lizhi-Precision-Tower-5810>
 <13428800.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13428800.O9o76ZdvQC@steina-w>
X-ClientProxiedBy: PH7PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:510:324::11) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bfe78f-5070-4d04-fc88-08de3cb9a7d5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|19092799006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?JNT+GXskhOccwO51V6uLVptOwiDVnZYho/ugW4bUJkvKU/5NeEtsa7t9nZ?=
 =?iso-8859-1?Q?w0F04iULZIOLVB/TktYNlxAM6Y6kFZIQGdwJ+YsZvOAmi4t1ZmU96V9fN3?=
 =?iso-8859-1?Q?lk6TKikOsQaME6dD423lYg2u8KPIRRPS63tZJsPJo4YLgbpjfC3Qu3UuwU?=
 =?iso-8859-1?Q?xjKhnWpikWomj7eF0CNtbb8XCig1w4xqtuZcZi7R4MhJk88vPgv6KDeaq1?=
 =?iso-8859-1?Q?JMIBmgMqsqYo6Wn3EdqfLmA6O2TAN3PurCKcT/qNH2wphDBcA9rraBUInX?=
 =?iso-8859-1?Q?WH6Cai2GUTdVzSLD0TxSlO+lnwIfj7w6QnvUb+8hRuBR3n7OBCK02c+i+Y?=
 =?iso-8859-1?Q?M8KgdhAU3Q5JmS2B/m+tw3qW+eVBIxQDsFLfgx2zgSzC23GYzloJTLbkjQ?=
 =?iso-8859-1?Q?4zPOZHzzLckT17SmZMUEeYlnF+oB3sYWp2iTG6qTy+KsxlojwfsG78XihM?=
 =?iso-8859-1?Q?mo2Y3Q+vcVF1QcTtr8ATD3PB+zvZ5ZnpuwkyFzTT7hEhbFdQED4rGFnZcK?=
 =?iso-8859-1?Q?cSpuqVolUTtxfOwuP19eQ6kppP3EgXvN2TPXul5vFKmaUjRpoghyYUooce?=
 =?iso-8859-1?Q?9gTuHhywrZBVcrQ1w355Ke5X5BKMJ1KD5ZTy6+95vetFi7+IipcxA9K/Jv?=
 =?iso-8859-1?Q?6tW34sC1Nx6Buy61ccR4K6seFspNWcL97vg818GG+1REii4/qng6juDBoB?=
 =?iso-8859-1?Q?03M++f3VZU/sGUPd/vzTccNqs0r9bTA1mJjSEBd8Li9ZARJgs5oIYtrD5d?=
 =?iso-8859-1?Q?XsRjL9mTubFdf81qOljqItrGeWCe+3F07ffmeIDNpoIsXSTJEw8rKdgLXa?=
 =?iso-8859-1?Q?qwwo3wA3EXG5GzUnu/ngSg52FCc+3cIrwGMxf61yQ3GDQsBvntConYlsux?=
 =?iso-8859-1?Q?i9i8TthUZOu2BVoI1lo/HWFfQlQ4oKxIV+x/ABNOfAAh2Z0p70qt/4jgq+?=
 =?iso-8859-1?Q?09i+4+dVLHmrpj8OnW4DcweodKc7lVc+LVZwv8KdxZJxWbBZUpoeeqOEt1?=
 =?iso-8859-1?Q?WWyat0ns3k14mtynhwi2rj0jWRP2JzaIYaW/Tz2QWBUwpGGsIENvrpMtqs?=
 =?iso-8859-1?Q?vlvH5GALl9rbYf2kZtECAA9J9bT100O1VXYH7mGqTQPB5zE9x5dx1BtAk4?=
 =?iso-8859-1?Q?L2iG+ETKbFuyuZzZP6idMzlaZg8YVQcUgjmy89aUGldTXPwOpGLt1Jfisz?=
 =?iso-8859-1?Q?pt+qGjbBBDQSDQek+AJA+WgYUV4sTdytF3X2KnQMbI/ZX0XpnjeaMnp4in?=
 =?iso-8859-1?Q?vwqvJPYa/tiH143Sdc5JhCINOQE+UIUjfkYi5Aei47cqMGd97DJAKZuPhr?=
 =?iso-8859-1?Q?lpdcKLLLsTCBxrfHNLoyVEQk9L79/52LEoAEmK8V9rK7GOe5AqPVxKnMuR?=
 =?iso-8859-1?Q?VOGuQJtVuBb/3pSKC8gTuOMj4F0AvpDMqWsZZ5z9j3ACrH9nUK4tGp2dpr?=
 =?iso-8859-1?Q?Bbh8zzKq/4ky8vFY1lgzeMFUeXVF83CmyTjjoC0eL5gYABQeQGA09Pi8Eq?=
 =?iso-8859-1?Q?d3pkIQwYMg8JCWvNEgCwqi5PYoX2GUHXWuIuuW2kyyZA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(19092799006)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?he+dvW7PjAhp8DKFDOsWJ6wNQcB1SAJgZT6QUiplyfA4Yrm5iVQzdDLGvO?=
 =?iso-8859-1?Q?NoUHXEZUJ78CE1wFOgM1eaARurZpSaBQkhKKn+K19JoxpPsSmIMeaPiOnD?=
 =?iso-8859-1?Q?WzipsV8VCScXx3aoUcBKcbtk2ko7TulMtVYCJ7Qbh/uTQglWPorZGSxhW3?=
 =?iso-8859-1?Q?4Adfyv8QMKpTnyP/SJC/pCv05gM0gy1oIjbnFFTaRQ2HNrkfPKCZb0Mqnx?=
 =?iso-8859-1?Q?cFXbt4J6hFe2yfxF9PJRBNyd42/6vJ6NmcphcL+SLz3698keQuRQB238I+?=
 =?iso-8859-1?Q?cYj6KaUuedARqEQXOje8vxmbIjaVHFm3tXkA45kTEiWg5ky7Byz7/4s1ln?=
 =?iso-8859-1?Q?MRUF+EaWu5aJLjt0iXw3baaYm9to0Sxu8NaLtm/ibWxnTzPFfEuNiZ6uMH?=
 =?iso-8859-1?Q?EQ855kYLuqE3amLsNAzQ9NzPjeVzPZ3rp2zM6k4Tvz+3m8pJm6+nkKxhFJ?=
 =?iso-8859-1?Q?+W6+NqYJinyzh6tx+pLLmrkjgy3D9ltwTyyQnUxnzwlbguIA/77aj8PCsh?=
 =?iso-8859-1?Q?cj1A68U/8sNn30Ucl0pXqgFLhdQ3veHb8pmWQg4InYbTOmSx+emcDr9tbO?=
 =?iso-8859-1?Q?eXJ5NB7atsbleE8v/NFGv1w2JamX4RYXzDf46hYlZ4XPMWlMgkLTfANAqC?=
 =?iso-8859-1?Q?bJyMIxqcegsr+WzNZXgkCrHvTan+71J2m1R4yEwlTlSARB9KFabL4ciUlD?=
 =?iso-8859-1?Q?K3K19jy94uUhdgcZn7L30TWJnjaipbUSO97eczBpFCuzlRLEpn7RoYTPe5?=
 =?iso-8859-1?Q?6DrM0fef8cpycign2fBS5Llmn2lFcyG6bMnXzXYFa+4QAN40FOtltOfI9Z?=
 =?iso-8859-1?Q?h7mMOG8hEPGzER9TM1api1+f3eIBfbp/CrQ+RQPgEtFAkyWR1gg6GXPCeg?=
 =?iso-8859-1?Q?aa8slJfsk0BsZgYVUjCJJh28YN1bySMpjmilCP2K2mogOTbWk2NShCbars?=
 =?iso-8859-1?Q?XWjemqBP8qmALFomAksC7uqaI6ahGuyccal9zjO0FV4lToK5hBeTpqko3c?=
 =?iso-8859-1?Q?tbxrcmYtwul+i94w9atiddYhF28MegtHL64XT7/Ec+VgSlaYRVcGUIG/IG?=
 =?iso-8859-1?Q?hcMlBerIHlsd6VQhrbdPbvh0NUovNJO9p+YuW5jO/i/fw2iSz3KrXwCD5B?=
 =?iso-8859-1?Q?VNrIqw8ANrsNdAyfvKkIM2K/I7p9Ex+s3jXzP1NGV0pOwyNHlkuddqzYp6?=
 =?iso-8859-1?Q?IYoT1tg5MKVwzAWKdATifno5oXCTq5QtK/Px3d1JsBf1oS3IOx6CFGZW2w?=
 =?iso-8859-1?Q?IPrmQAlZxP6BYr1ip69PPgGkFKlFKlxQcBr5TqwRCnIrLTMLvhj5ARDgHr?=
 =?iso-8859-1?Q?rExbSCA5PM5BtMD0Z+UoDE4hep16tLaIeraNX6YEdFgSvKMaOwQhQydztJ?=
 =?iso-8859-1?Q?aO6MDtwwJpQ/yMoBrv2wOGlEWjNqvoAAw0Ae1nqC7wBaaTPo81uCjQbHJY?=
 =?iso-8859-1?Q?4RNcIvKmnQOmB6TxWI2CJsGd9Ri4dZomsc4p/FImiwSan/ebwwQDlwC5/M?=
 =?iso-8859-1?Q?Q/n6jBaxOPHYNlbyeuF7lDhvicAP4Fz6J2lNeC8lYQ6Azmagn+x+76a4Cz?=
 =?iso-8859-1?Q?U8I792GXcf2CE9N0BXvqOZxjX+ovINlNYXLGtbJuwhsly9ZD4O8tO5LwQU?=
 =?iso-8859-1?Q?ImmJq7YJNKFsYTkSdZm47WRHHeMj8l1Le0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bfe78f-5070-4d04-fc88-08de3cb9a7d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:42:01.7808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsmXgnNI4zIieHeay2GzIhdg1/Uif9YNp0u9WrWwFGVajChqs/lqUujnevbBPQrkHuadvtB4DuIaQT1IqzpETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7504

On Tue, Dec 16, 2025 at 03:50:17PM +0100, Alexander Stein wrote:
> Hi Frank,
>
> Am Dienstag, 16. Dezember 2025, 15:46:00 CET schrieb Frank Li:
> > On Tue, Dec 16, 2025 at 08:34:18AM +0100, Alexander Stein wrote:
> > > Hi,
> > >
> > > Am Montag, 15. Dezember 2025, 23:49:53 CET schrieb Frank Li:
> > > > Use dev_err_probe() to simplify the code. Drop the explicit error message
> > > > after returning from imx8mq_mipi_csi_parse_dt(), as the error is already
> > > > reported by this helper.
> > > >
> > > > No functional change.
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > change in v2:
> > > > - add  Laurent Pinchart review tags
> > > > - wrap error message to new line
> > > > - remove error code print in dev_err_probe();
> > > > - drop error messaage at imx8mq_mipi_csi_parse_dt()
> > > > ---
> > > >  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
> > > >  drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
> > > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++---------------
> > > >  3 files changed, 21 insertions(+), 32 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
> > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> > > >  	/* Now that the hardware is initialized, request the interrupt. */
> > > >  	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> > > >  			       dev_name(dev), csis);
> > > > -	if (ret) {
> > > > -		dev_err(dev, "Interrupt request failed\n");
> > > > -		return ret;
> > > > -	}
> > > > +	if (ret)
> > > > +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
> > > >
> > > >  	/* Initialize and register the subdev. */
> > > >  	ret = mipi_csis_subdev_init(csis);
> > > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > > > index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007013821f67d783898a15461f 100644
> > > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > > @@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
> > > >
> > > >  	/* Acquire resources and install interrupt handler. */
> > > >  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
> > > > -	if (IS_ERR(csi->mclk)) {
> > > > -		ret = PTR_ERR(csi->mclk);
> > > > -		dev_err(dev, "Failed to get mclk: %d", ret);
> > > > -		return ret;
> > > > -	}
> > > > +	if (IS_ERR(csi->mclk))
> > > > +		return dev_err_probe(dev, PTR_ERR(csi->mclk),
> > > > +				     "Failed to get mclk\n");
> > > >
> > > >  	csi->irq = platform_get_irq(pdev, 0);
> > > >  	if (csi->irq < 0)
> > > > @@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
> > > >
> > > >  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
> > > >  			       (void *)csi);
> > > > -	if (ret < 0) {
> > > > -		dev_err(dev, "Request CSI IRQ failed.\n");
> > > > -		return ret;
> > > > -	}
> > > > +	if (ret < 0)
> > > > +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
> > > >
> > > >  	/* Initialize all the media device infrastructure. */
> > > >  	ret = imx7_csi_media_init(csi);
> > > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a97910a6a0d53c9b6fcd73e9 100644
> > > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
> > > >  	int ret = 0;
> > > >
> > > >  	state->rst = devm_reset_control_array_get_exclusive(dev);
> > > > -	if (IS_ERR(state->rst)) {
> > > > -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> > > > -		return PTR_ERR(state->rst);
> > > > -	}
> > > > +	if (IS_ERR(state->rst))
> > > > +		return dev_err_probe(dev, PTR_ERR(state->rst),
> > > > +				     "Failed to get reset\n");
> > > >
> > > >  	if (state->pdata->use_reg_csr) {
> > > >  		const struct regmap_config regmap_config = {
> > > > @@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
> > > >
> > > >  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
> > > >  					 ARRAY_SIZE(out_val));
> > > > -	if (ret) {
> > > > -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> > > > -		return ret;
> > > > -	}
> > > > +	if (ret)
> > > > +		return dev_err_probe(dev, ret, "no %s property found\n",
> > > > +				    "fsl,mipi-phy-gpr");
> > >
> > > Do you really need to pass the (fixed) property name as an argument? Why
> > > not move into the const string directly? I would also rephrase it a bit:
> > > "property fsl,mipi-phy-gpr not found"
> >
> > Laurent Pinchart provide comments at previous version. The same
> > "fsl,mipi-phy-gpr" share one entry at RO region. slice save RO region
> > space.
> >
> > https://lore.kernel.org/imx/20251119043307.GH17526@pendragon.ideasonboard.com/
>
> "assuming it's worth it". Do you have any numbers? I doubt there is a
> significant benefit, but I don't have strong opinion here.

Yes, only few byte. But no worth to argue this. Laurent Pinchart, who pick
patches.

> But the grammar should still be improved.

Okay, will update it.

Frank

>
> Best regards
> Alexander
>
> > Frank
> >
> > >
> > > With that fixed:
> > > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >
> > > >
> > > >  	ph = *out_val;
> > > >
> > > >  	node = of_find_node_by_phandle(ph);
> > > > -	if (!node) {
> > > > -		dev_err(dev, "Error finding node by phandle\n");
> > > > -		return -ENODEV;
> > > > -	}
> > > > +	if (!node)
> > > > +		return dev_err_probe(dev, -ENODEV,
> > > > +				     "Error finding node by phandle\n");
> > > > +
> > > >  	state->phy_gpr = syscon_node_to_regmap(node);
> > > >  	of_node_put(node);
> > > > -	if (IS_ERR(state->phy_gpr)) {
> > > > -		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> > > > -		return PTR_ERR(state->phy_gpr);
> > > > -	}
> > > > +	if (IS_ERR(state->phy_gpr))
> > > > +		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> > > > +				     "failed to get gpr regmap\n");
> > > >
> > > >  	state->phy_gpr_reg = out_val[1];
> > > >  	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
> > > > @@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> > > >  	state->pdata = of_device_get_match_data(dev);
> > > >
> > > >  	ret = imx8mq_mipi_csi_parse_dt(state);
> > > > -	if (ret < 0) {
> > > > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > > > +	if (ret < 0)
> > > >  		return ret;
> > > > -	}
> > > >
> > > >  	/* Acquire resources. */
> > > >  	state->regs = devm_platform_ioremap_resource(pdev, 0);
> > > >
> > > >
> > >
> > >
> > > --
> > > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > > Amtsgericht München, HRB 105018
> > > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > > http://www.tq-group.com/
> >
> >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/



