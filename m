Return-Path: <linux-media+bounces-37419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B162CB00C4F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B7167B0F9C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AF02FD875;
	Thu, 10 Jul 2025 19:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cqsC4F9n"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3F72882BF;
	Thu, 10 Jul 2025 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752176900; cv=fail; b=BGDbwAQc2n/R9j2c2+yFD0rE/o5qWRWvFD1MkRqInotTjvUp4u0Ow0OfXFKak+tZpRunDKM4kWwSC/di3sPFaTVSmjZK9/ye644ycZrlPqqUY85vgZ0PPfK/Ckl3Smua8TgOgxjxTJRNpMUunKZW9SYzHbu7q8zulKuyeBgMCZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752176900; c=relaxed/simple;
	bh=+XNFAIKqHXnxNf7Jvd/EDrj2S2g//iV15WApxkY3nIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c2tjWDhYxG7g13eKHr1O9CfvfYqljRSC0sKQ0g34aPoXLM3kUipb6FGf+q/1RCdKLojVtfolqjZ35jSZapHFt6AIBYTzKsFSFOPhAZFZQF0+aEB2T9nkH9D8wC426oQMedcYtrlAOeveUruaPTW/4KaTCdAGnpqHY1VdEkhEWZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cqsC4F9n reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBysTaL0Twcu520O8S6BVoVFDueDxAOsOAs7jskqAooOLSsAVxrWbGYHfkrRsT2PSP5lnmP9RQtq3wpR8LMp445I6cJ3ecdmZ8eycVwcKyCNDQKH1TrvrOr9uy3AHKegUmKtAOrNe7b/ch6B+0qvtktAnXP6ONpBVAGHZgu1h8MA5/NHbYjy5ru1MjVS5DKaLdKQ/IiLXkmw4b0lURoc7nb5Ce4BCd15cbmreIQ2597uHremN9BZVl3qlYy9HZoi+mB1Tvi/SKIA3/hSKtIvvl8Qm7gEFPuGZUCGEyD2Thkp+aKo/u6l3JhkyCuIp1/hmj9LQFN991Y5TzbClEkN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqTEwKSitblrNu+MsJ2PQXWqZ/buvQMKV+XLq/WKFT0=;
 b=LN3Zz6E6DSGzRxuBPi4rxF0ylatHCQoQgDU3G5sj1rMbR/CcSbJNJMDOJajkVHXCsM8I+wWyVDnxemtGwxIbg75EQScHxWSWGgfKoVfoZGtrRPisP6v8nx27eIS0GouE4xXyIdpoPHb+BGmJGP5MIwx9KZ0/VbNLSO2cVfibxUKmG64lq5Pe5husqwlAmD17TrTJPWH8VWM+/D6aWr548jY2YY2JRYZuHfHgX4lwBuLyrYZGQd3bsMDiEkGgORMskMlw+6IwBWS6JXJkRRsj3vsMBHESYqVnhtkGu/bQFAtkdNzh+L6VM0JXFYYv/L8KcuVGQNJhGh6HhYTnNEOv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqTEwKSitblrNu+MsJ2PQXWqZ/buvQMKV+XLq/WKFT0=;
 b=cqsC4F9ntudTtc/ydDWVzbycq7cRO0AJLwAn+pjA4XWJB1MiDczGSFXhhu4wRQ//6PfRWQT+mRPbCPe2Q9pNKykAFMXilsVQNckLqYEcqgTS1e0vL0hA93SFy5Lq5ucuQrVJV8pU9M08uBgvBPlSxXHa8slF8tOnR0pf1tq9Am1uksYbie6yRp+VVuMPilh/VPE0AKsVJoqseQiA2PX/MCliuVby6or4iAnk9jH/PrzhcFogF5RKpQwQ75YNmK/r1kIDIU98N0kFkXW8PgQx6mPHJjG/x0WVoiLJ/lADKh+JxDZ0+Ud6nityLZrAMqQqZ+tctLFvKo8BSrxDapRR5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 10 Jul
 2025 19:48:14 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 19:48:13 +0000
Date: Thu, 10 Jul 2025 15:48:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Poduval, Karthik" <kpoduval@lab126.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
	"Xiong, Jason" <jyxiong@amazon.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Anish Kumar, FNU" <anishkmr@amazon.com>,
	"miguel.lopes@synopsys.com" <miguel.lopes@synopsys.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] phy: dw-dphy-rx: Add Synopsys DesignWare D-PHY RX
Message-ID: <aHAY9mYPhJEUJV56@lizhi-Precision-Tower-5810>
References: <cover.1752106239.git.kpoduval@lab126.com>
 <2383f8cf2a8f5e1b914d4cf9bd11674ed55876d2.1752106239.git.kpoduval@lab126.com>
 <aG88o5UAQ0vFrq5F@lizhi-Precision-Tower-5810>
 <126c0500578a7d825d4865ad1e90784856a3424d.camel@lab126.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <126c0500578a7d825d4865ad1e90784856a3424d.camel@lab126.com>
X-ClientProxiedBy: AM0PR05CA0084.eurprd05.prod.outlook.com
 (2603:10a6:208:136::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc92782-888b-4d94-50ed-08ddbfeab4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xn1QK003diQBuDZ44QIJGsv1Wyr6ShckVRr7+XZSQJXaQrBCgGGpyxW95j?=
 =?iso-8859-1?Q?r9nNt5cGWSCpnu8UbeqEbRyaw4Y3ZO/e6AcLDGyGJytVq/bWV1XQHT6VUg?=
 =?iso-8859-1?Q?7DEO+hyhvXcumkbsWUVm42PXHNHYMt/tJs5EwDCut40BjtLKeBcTjqsBvZ?=
 =?iso-8859-1?Q?gvWFPwNCFtKwlnOge6fPCVYMv7S655fESTH8cWHGi44M2HNryP1V7y6cdu?=
 =?iso-8859-1?Q?y9a9mbw5RIFbd4Lr8UVVzlXVr5NzSeHN9OPLYO8baGSOb5cJCnezj7H2QS?=
 =?iso-8859-1?Q?ycQjLQMIFzzyUdBrt5+XTJbGqmTrhFwBMPypWb2+d/IK4DAISzqH9tGgiW?=
 =?iso-8859-1?Q?HHVn/ozX7AOaHjHTbdGuq2bdDFTAimK8gmyu1aVQWIYCI2TOwGo6UeYrj5?=
 =?iso-8859-1?Q?2mzaY0QS9OvIBHpPItLKBUCPCbcMLVj+kIeJpWqom/6buFMCy2wcnrjTUv?=
 =?iso-8859-1?Q?ffbKZvUoxM9B8ouN1h1ub8GTZLOb/ExFEFutNMLcd2qwfsaMFpt5NHSed/?=
 =?iso-8859-1?Q?Loaax3+iCYzrGVZpbR4bsjl7Y9yWnauyCp69YQLHyMA8PmX4H9l/mZGDS5?=
 =?iso-8859-1?Q?FWVy5xGDTBaAjeqyOtLZdUTWlqjpD2s0tf0omwaOAglCbPMSSipOk1p1SM?=
 =?iso-8859-1?Q?NaTDwu8C0K0bq2rwAbKAE928OfBrVmOQzToU6lNtJhBckKnjyID5CGdFua?=
 =?iso-8859-1?Q?7Mo5tS0ZD0YlnZ8FfJ1t5pgwqr5zf2iInlfLcOvgq9POwie54MkqzSO/tK?=
 =?iso-8859-1?Q?GVjqOaPG7EaKTHRbnOU7LXxmkrwEJulA0lo4l2L91M5WHzLEAS0R44GvM/?=
 =?iso-8859-1?Q?cJPz0pqfnMW7kzgwld7f0mamYr5VsS1qNnc+WQgvD/Nv/ad7kT273Al0au?=
 =?iso-8859-1?Q?l91InS3srdkpDZERCkWOJwXD0WnohcSY/JlSHgWXWLwawgFMTlV+EkYYre?=
 =?iso-8859-1?Q?p1KSD0T0D09D9c1nF12hh6KIG7uWE7OrG+gJ7hX/0ggDHfh96XHyFnyMWv?=
 =?iso-8859-1?Q?AV8+nna2wIZkUCKU9d/JDIhY+Wb/1zF7ybIrqt/Gr2i8wq8QzPv/fngA7/?=
 =?iso-8859-1?Q?3ptIV2hLx0gBZae8l2dMVLQYR/QTQgs9d18ux1Ynm1GVkifUlfnCD8dcne?=
 =?iso-8859-1?Q?pySQPx5xP60ZgsyIbu0aMrLmIyIFpp9HXDP5dMPbRH86w8a8cZi/pslHgJ?=
 =?iso-8859-1?Q?qANzS6wATujco0EoC5stvcRadRx+vQkPWl7NB2UdLO/oDAHcXaDhbCx5cj?=
 =?iso-8859-1?Q?S1wGeIjYEpp0LweQqHbdsbHEntYH1QESh/XLE4Dxb/uMundSRZkeVhnmQ4?=
 =?iso-8859-1?Q?fQHXW9N9Gu+aTKxPIo/bOz4BcgS/yfsU+tVNi+Ety7Syn1qW0BimNMAa1r?=
 =?iso-8859-1?Q?TOzH+EQkAvYEVcvHo/WdNZ5KqOfhnOl6fW4K0mPnE+GfStNlVWCWyOjdBG?=
 =?iso-8859-1?Q?6nbqu7qeuyoPy5DzYyqzOWRERHKBONut0Rb6ix1Ma2/KRTOlJnmn1kDteF?=
 =?iso-8859-1?Q?PyGgJPUgF9ToFb79PwkzOoANn6LG7XfKcFrao72xBshQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?vg6kk9Ozvy376r16TVAkGqvs8xEFVNatI9cONUX3bIhLPNBEomYN1lLrMt?=
 =?iso-8859-1?Q?764wPvmOD5FaZvjwm8wIZQaKL2dht2gfpk6l3S+WweUs3I+diqEZzGQ+qz?=
 =?iso-8859-1?Q?H0efdxQn0Bjf2o7L2XrqmkFgDgiBDQ06rAwDIwrHycsRFh/GzUEUSBgmD1?=
 =?iso-8859-1?Q?GrLy++ojy0H4UKq+eOQh/+kty78s6B4FfO7o70r5pjvBnErI/DZ9r8pCuD?=
 =?iso-8859-1?Q?lVqDYCaLY1ZXy/bf3s3YAxFpOL1OIPtFfotQWw9fTfsDpbZ2B65/aDEnBu?=
 =?iso-8859-1?Q?BYS8mmXZgC4wchn7DgAcRlGW3ViyVwvnGEZULYVAtBeg4ibWucnm07uskp?=
 =?iso-8859-1?Q?Y9jztfjvrsTj//i+mvE/y+/hvvX6u7z43vpl17o2JArYYTAsjAsvmiHbTR?=
 =?iso-8859-1?Q?ySLmeY3ILO5OvBc59iHdmByrrpUcLkWVeN9WepJ5NS/h9Gfo05c8wjbrHv?=
 =?iso-8859-1?Q?MmDVJYHJL621/UZdpX/DBQZeJmGHje3bib2cz+YVx2canmQl6T+nE898NW?=
 =?iso-8859-1?Q?Lx/Kp+2XOplRZfA5oJ3eqztg8jBBFItE/FP4IMu1nBDfIntp7baaGM0hLz?=
 =?iso-8859-1?Q?aRDMepWA5hhvs402GYeRsfQF6ysswPEUq9kw908wnxsYVKWRrgQEzTwWMu?=
 =?iso-8859-1?Q?sDsrFUXlYnEe1vh2kV1nGvu1FmYPJ/UNjVn/lrL+4dGBEdVtWn8O75mw0b?=
 =?iso-8859-1?Q?HcKBZGwKizEzD0mv20mdYMzPEnZMpn7FV2n+MryacDDx52AXiQV0XPnLMi?=
 =?iso-8859-1?Q?0/VeX8hApaawtknyAsRplbE5tn2t78gSbplOoQU6+3Rpr1EoayQAfsLTjd?=
 =?iso-8859-1?Q?zmQD8qMUnLye5/QyU0pIjU+ZuFVAPAFKfeq5I1TQW/RD21lBAtlayXpais?=
 =?iso-8859-1?Q?mMFFdj0rnsYOkt2M3tKE9qCzkGT3fg14m4C0Vc3rH+bqG7RNqchW/uboXr?=
 =?iso-8859-1?Q?z/orKPTLLulNNZs1wiXbvtK9UhTgMeewPgbOExvEmbUQOMRLEIa8Nb+lGm?=
 =?iso-8859-1?Q?out8Bw1OA8o9zLfjZqmH//dkziVkWfC9KrC1zx3W8AC6EBszVJPTgBIzFs?=
 =?iso-8859-1?Q?hd4+9ZobDe72Dl5t8G9w1lqTnAzG1k9zX+9yPuLeU0ik8WaKWv3iUEA3DJ?=
 =?iso-8859-1?Q?wWPSxQBEZGR27M4F9a19JOFUYfwZyJPns5q31LZHZ5U0j+szsh7llB/Zlz?=
 =?iso-8859-1?Q?ECLzkXv+yG1218+KOWxTuDDiZK5DI3PZGnu2blb8qRvn1Z9dpRKMyZ1uQS?=
 =?iso-8859-1?Q?lK6fsm+Yz7+0ZSj/fz5nzTktgaB/b/3XRhZ79Ls90QD4ZpG7vmF6lum1BL?=
 =?iso-8859-1?Q?jQoHwmUpcUrVKL5gd/wx7fdcG4qANE28OomeFnz5q/AbXkp7TQVvsV9xxa?=
 =?iso-8859-1?Q?/1w7SdE7oXCWClhvge08mNRsXmK0N0Ptk4n5GSk7FVJ/HbaAuRKDKHelaX?=
 =?iso-8859-1?Q?yaHwUyttk6iOTnNZKOJhoUABPcXNd5Z4AFPN6O5TZCsnJtQXZcpYjy288X?=
 =?iso-8859-1?Q?m9w92ZI5E/h8Fk2Hjd8ao1rBa+bvP4w8beu6q5lTDyfdLfic0gZRimCi7V?=
 =?iso-8859-1?Q?vpNXZzirSlb695/Dkdvsv8cKWFMbbuiDyF5A8mS8pxV3Q17jZPirAb7ACE?=
 =?iso-8859-1?Q?QwRSeWzkszmct8kcKpNj4Krx99q1qqgOdf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc92782-888b-4d94-50ed-08ddbfeab4f4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 19:48:13.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QYVibSKjIlNpDu4gsPIMWpOnEuhTC3YjGXu7kGPmeH9aCGN0bJHKeBm8iL5GyUbDSAnDSXy4HDPCGa90C6LyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433

On Thu, Jul 10, 2025 at 05:12:57AM +0000, Poduval, Karthik wrote:
> On Thu, 2025-07-10 at 00:08 -0400, Frank Li wrote:
> > CAUTION: This email originated from outside of the organization. Do
> > not click links or open attachments unless you can confirm the sender
> > and know the content is safe.
> >
> >
> >
...
> > > +
> > > +     dphy->dt_data =
> > > +             (struct dt_data_dw_dphy
> > > *)of_device_get_match_data(&pdev->dev);
> > > +     dev_set_drvdata(&pdev->dev, dphy);
> > > +     dphy->dev = &pdev->dev;
> > > +
> > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +     dphy->iomem_cfg1 = devm_ioremap_resource(&pdev->dev, res);
> > > +     if (IS_ERR(dphy->iomem_cfg1))
> > > +             return PTR_ERR(dphy->iomem_cfg1);
> >
> > cfg1 is part of DW MIPI-CSI2 MMIO space. how to cooperate with dw
> > MIPI-CSI2
> > controller.
> This is essentially why we created two MMIO spaces as CSI2 and D-PHY
> are intermixed in the MMIO space and regmap driver detects the
> conflict.

Because there are not CSI2 part code, It is not clear how to avoid this
problem by use cfg1 and cfg2.

CSI2 register look like
 version
 n_lan
 ...
 phy_tst_ctrl1
 phy_tst_ctrl2
 ...
 other register like irqs

Frank

> >
> > Please CC me for next version. I am working on DW MIPI-CSI2 work.
> >
> > https://lore.kernel.org/imx/20250701-95_cam-v1-5-c5172bab387b@nxp.com/
> >
> > Frank
> Sure, Frank, perhaps loop in Miguel as he might be able to know about
> all the variants out there for this IP.

...
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.43.0
> > >
>

