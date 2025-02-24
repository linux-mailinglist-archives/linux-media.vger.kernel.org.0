Return-Path: <linux-media+bounces-26836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86447A421C0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51508188E1E0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22B124A079;
	Mon, 24 Feb 2025 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FrQxxlP/"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E94248887;
	Mon, 24 Feb 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404808; cv=fail; b=tnZSyPzeTwxjp4NHTSVF2dTGP3y5/TxV0m2iZi5PvBHIFcMCcaKe7iAeQbclNyMW0Wm+2pkjAXvZpww4zJAoDLlPskaPBvVz1BJQI5ffKsBOpDgarGByfay8+/ILHXcPZrbPym5eozehm+wRrlCCoI6rUVlA95cawEniWklq7T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404808; c=relaxed/simple;
	bh=dGfSvxKjwTg/NOD0ZHTpA0hNaZ4TyRpJyLRU9SFLmog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IbM65eTl1Jmkow5o4UhIhYLUBej35lIsVS/aB7femYikYIk6baEWgbxq5Kk7RzqYEDlZvcq40y4NxihHEXg0BxpzXs4+qxFQUscO8e2n67tbFAu30IXUzSS6aU5vD8pjrdmh73AoTGnqA7rF2p2WY4OakaOny+Ks/tHyrs6rcfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FrQxxlP/; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiprcCufZ5ggwptbVyoCu9aIfo5CElJhxMnL5yIf8rzfQE/g+Q9e+wXmLzHlDK2O6Y6/nJ7QXvWz0wuRO+NCfJkC2Vc24iCN1ebOAuz45YlejT55yYD/NhPTfnQ3TegVI4zbYomgD0K2oxXy2UwG8s4zTcsS0KHihA2cBvTIhEYzyrXiTZpHUTCc20zEdxdf7Bxy1iay9GlKv/fsFHGQUG6dpJ5Nboa2gb3Boj0wnlzyBpga8TdIdHx+d9zPOl+e91q0XG0+soxfsKOnV4nBchmN14NVfk0HsyzRYrS1uCBb14mTTRFfF8/TGDbs688V5arhB8/aiHrKkLUt0aJoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD0tI9pY09BNEXCDjB/RRi0Zqd0nW7O9lpCi9iqQaHM=;
 b=ZlnMeNxtoJZ9+nyBe4k/qGM3m1xqj2H46G9Io2VR3WH3I7ToanWYKj4HekCSAH4PG7im11anMGc3KF4AC48xo33HmhHEhxURLfNCZXQQT38e9fWrSPrY/jOOq3jJyJCzaegWWm8UqDHP54vr3GjoX5CUuQUSgJZAYsoY/FyaD4YuGpwILRT5Q5kldBAOptOCN8UwJ+rnS2fz+e04InJn4gH5srobsRntgTnRQMzAIhxREXRRty9GJ7KumoDct8Or+QrpzCMJgW95Or5DE4RwVoma6+QIBABfdWH0jZEo29GnKfCQa5Y3l1SV8SCmuMHhsS6HG0k+o/rKIUMg8ZKFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD0tI9pY09BNEXCDjB/RRi0Zqd0nW7O9lpCi9iqQaHM=;
 b=FrQxxlP/8cUS8HmzIYevUH9JFYq7b4Gl20SkBrFxArO8tBgaAIrE5q/HWe7MPcKoXWpn6iBefB/r1TYmKkWqWA8a4eJDHHWSFxNsMXAW8Zu9nBMbbwSmM09VwSbSmNYWpDf1qW1VgrkqQ+vXZNNIxi+PRYoAS0RH3SO1Gs3QNnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS0PR01MB5697.jpnprd01.prod.outlook.com (2603:1096:604:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 13:46:38 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.020; Mon, 24 Feb 2025
 13:46:38 +0000
Date: Mon, 24 Feb 2025 14:46:24 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/18] media: rzg2l-cru: Add register mapping support
Message-ID: <Z7x4MDVQ_JxeNllA@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-12-tommaso.merciai.xr@bp.renesas.com>
 <20250223195232.GF8330@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223195232.GF8330@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS0PR01MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a4010f-1442-4c78-c730-08dd54d9a911
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?cjLDKK8PVD+t9X4jLCedkr0wUvLgfZlBkFZBvXT1l80eHmX9LS2YI9wHzUEN?=
 =?us-ascii?Q?tsim9xiVLhPVDgmtCUCr1LX7suDJf+MaEwcPGlAfA9jh1harHq1tROCLdEZj?=
 =?us-ascii?Q?oZv5ddlbLO4WLQDzqzCsnRITHbVaS/3n8o0jsiBbDREUQ7fHRf15J7xCIDiS?=
 =?us-ascii?Q?Sm11GHpOkzwYzzCSLRInSjohps5WnzBFgzenh3KfdiabPoy/d4NQVsPbxG1h?=
 =?us-ascii?Q?C6DjcR9RIXolcnuXpCy2DiFOEk3Te0Eo46/jYwyJTyKFG0FVQET1nUTs8w/E?=
 =?us-ascii?Q?MFl7rTUu2zyd7Itkxi0bSHK2wX9BHBEcp07qECXz4OeUJ/jfivCikrHZiO72?=
 =?us-ascii?Q?j9Pztckp1QqyRGPRz6MwQFMHRrKxBAc0BtQuBTk+RHMi0bb3yBrn2aOU2V9R?=
 =?us-ascii?Q?abMHuDIo0QOZPLm5LfkzJlTdKk4m84WAXrF/lUrYeB4zbf6W/G5DWR+IWK0O?=
 =?us-ascii?Q?u9memGvUqPBcuCGEmAz+6q0Isb95Zfik8SEpqDJu54IiuzTgLUgueXC1U6qg?=
 =?us-ascii?Q?0vySB1lS5FWxtwAfswdpPyKtwACOJVHIyIR+PKU6GaCpbSqIyS8Z+c3U5wt2?=
 =?us-ascii?Q?zifGv4msuLeS3hJitYeXK7xlerl7gGKAr98BZbUXCeWs8NFh40TT0CLcWpS4?=
 =?us-ascii?Q?QhQAYT8NLHAutiHUmBbWoRFXHfMfE8b2Zjl4S0eI0gbykrg1xQuA1LEq284U?=
 =?us-ascii?Q?FklqnLI4k9Xfh92XZTfXjdHoYimAkYHVVre2M0B/loQvzmzEhWs0NOeW1R5z?=
 =?us-ascii?Q?QE5JYJkrMQICusxdwV010Y23ajoXBhaMWMqkqR8T2lWemd17f6qvMxACNqzZ?=
 =?us-ascii?Q?4ogz8OxXlVti3PU15U1ah7fQsjStXKwnd8HUYLDWqrjwHyn7WkkN3LLk5Gvu?=
 =?us-ascii?Q?aqhty6Q/VWzI0sqJ6Z78psKCh+1GPrW8hGRYW8HFC6e1rH7Yn56U0bVNk/tP?=
 =?us-ascii?Q?knClnDwsJK6q1c3B94Qm83jJmtY17GqdmpAqhBYWe+5nhbhQsmm9cdsehlEM?=
 =?us-ascii?Q?sQ8iI3YFGJGqZP+6Hw9MIZcoZWPe0RQWOkRwRevZoMe4ZN30SdXLf93hPotO?=
 =?us-ascii?Q?/0gypBDJRUMuRExP5hXQB36D3f9c85I2r1Gks8MlHsoYuU7MzNzkgGfzYd6y?=
 =?us-ascii?Q?leN23+ozTZv2dLyE1pXJA908UNbpJ6HjwDAvJaC2VqqTtMRogwH6CQM0XRE6?=
 =?us-ascii?Q?AtAPipvtbQJGHc9kUWRaXGXmRH+yuA9LPxslCpYJQ8+6eZUc7EcY3ks0yIpC?=
 =?us-ascii?Q?4Wsx0XVLrThCzlsGjnw6CUhxoS5x9jGq77eRqItR646+XUPw+UoAIPBGewEN?=
 =?us-ascii?Q?+6sloVcWgDmRmTs5GWKxxY6YTwBUq/YlBLgZz9TKN6p0E41beGPOf2FVsKs7?=
 =?us-ascii?Q?Jj0rI73MGynIFzSKxZpHe0y4LVmSLxzN5Lue8HtfGLzul8E2RXpqz/wZl0pQ?=
 =?us-ascii?Q?DLOoAFYcTdhmyn59DrqZgFkM3/kj8WqF?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/WZKtahMSDwI2oi59tYBhEb8fgpguQD5IExgbd2Jr8V0XpJpifncImQzMSFR?=
 =?us-ascii?Q?Ow9e0i1E+T7+PsJ7JA6NQBlTxDn0Ar6AH3UEYwc7s306VxkIppflqbr7ugka?=
 =?us-ascii?Q?7mMAkz45HesqCjpcSJSlNWHgyO3AKuXpsQ1PHqFbNLPedZqie3MHar0HxpWG?=
 =?us-ascii?Q?SZRlm4H1OhwEi29FQH3q01cQdJxlqt5F8Fiyf6bJYmHndlrJcs5ROZVJL9Zu?=
 =?us-ascii?Q?3J1Pt8KvoEShyLWY8KwKJaa9ozBjO3mEJ30kMxt0zPw+xg5SZpu6V/9FOA75?=
 =?us-ascii?Q?oWhePn3M2mOIyNXb7Xls/ReylnKtwHcfgSdakNdZVNcax8eNEn+YhVK2rroG?=
 =?us-ascii?Q?BrG/MRn2hmqnkGYUsi0f9xrxjnr0yYvPhELiHr0qgAjc8omIg3rJoDOhiBU3?=
 =?us-ascii?Q?QO+b+RDv8s6CRHlnMJlDAAB/2I8WaxrpcY0aERLdG+DoVdDiUp2+MOjfvb22?=
 =?us-ascii?Q?OKa4l3//wOhcGu5dVISIXRGFITqjAlrot6c9nzfEV84mqRJBBcw5jmD/RucY?=
 =?us-ascii?Q?UXSjD50LuUIwejrnOdk3aejXMmoPKXHhmphQW0QAz7qF35qt2DTNsjWcFbk4?=
 =?us-ascii?Q?EIJOIX9HepKBXg3AheePnvdiWOy8cNw62/YTwsgquui4MWTEmfUYps4/9/Ye?=
 =?us-ascii?Q?ppABOJNCBW7v1V3Mbs9Qx2EiGTa8J9xwUFMm9mJuh+UdH10txGfMjRj7nEzF?=
 =?us-ascii?Q?YeEH3wCpCe3zp3mCIaKXJ0Txa3eMS5G48HCQy4FRV0hi/KBpW6hg+7x3MlVs?=
 =?us-ascii?Q?8oAOq5BXMAS3kN5q+SvdSBmuR9C+9tRAGWXfjmH0CYb8CgK/8RmMHQ4GCUKj?=
 =?us-ascii?Q?i0SVjIS0J6YwgUk8LyKkv7nGBLlOTMPGsT00+gkT7hLa3yybMkmHirSTkAqj?=
 =?us-ascii?Q?pR0YJIUl/nErFHJsw2XjsugOEnCoRpgjj3LFSl3lFlG0LXkQDYhQoRTIpWHn?=
 =?us-ascii?Q?iyw08QfoBImG1/z03Dp52BPzo1qgMY2Nz1RfAyV3yvE7BjxDlsCTE+1QImwQ?=
 =?us-ascii?Q?m00b5b4kY/J86k/IxwzhgGv4i1a+SF1+Q4LbkSAWBOac95+EDTRkJ3zfUyCE?=
 =?us-ascii?Q?Cbo+BsoFezgFvrveKuKssRmHRKUz7++VlRxsBhHSqXCbK4kHX1urSLPFN2XA?=
 =?us-ascii?Q?qgAirmiGLXGZD2c/7mI61BYMgpjOPtFsLIHPNbGpvQNn0rldLzbUZoFV7v6u?=
 =?us-ascii?Q?9dsDWcdzGX3PytVem926PIY6PoDcJ8RwmuqRPsTMIMWFm3P+osCi431+4oX5?=
 =?us-ascii?Q?DmYXLWv8rD5pdOyq6I95lxVtnD4LN4YpCBiNRM0pIVW/Bvrfwgf5IfbH6QWB?=
 =?us-ascii?Q?9bXEiHomogNEgV1+ShJTnuSTxRT9DU1tu9nD81JOeiLdkvbhJXbBMPfJyA0+?=
 =?us-ascii?Q?nzycjvmJmhFMdKGSWhRjh5p3SaYtVv9prX/bFlDTUYCHmsITEWOQ9JPFpSLG?=
 =?us-ascii?Q?tA1kX6bhzl7zT6gLg7oLKfCxjT0q8Hfd2YBH3VnCBAcMzwV8lYsigWRba9IA?=
 =?us-ascii?Q?Bv0Y+5tPgTCrz70CkxMZquu9Aw3cbvA2XmPvMgc30qy2oNM3KJIdPDkof0Gf?=
 =?us-ascii?Q?E1zsnl4O7xVwVKTIMJiLkVJDZ35V1VUncTQk+V7B1EqW9TB/JbH5DN0xxGvq?=
 =?us-ascii?Q?zNxyexV3XgzAxfzh2SntFf8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a4010f-1442-4c78-c730-08dd54d9a911
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 13:46:38.1224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGfyPDvyu+mXvgen2w2507xePEGGGK6Lxe2jY0gzyRKM0K8hMMfMGeL3dWFLMdmSBflrnG9fCe2cHQg+EzB5x4Jga5/fibWNavCUvGBgd3kGQyH5LoJ63rUdxjywD3dy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5697

Hi Laurent,
Thank you for the review.

On Sun, Feb 23, 2025 at 09:52:32PM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Fri, Feb 21, 2025 at 04:55:25PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
> > CRU-IP that is mostly identical to RZ/G2L but with different register
> > offsets and additional registers. Introduce a flexible register mapping
> > mechanism to handle these variations.
> > 
> > Define the `rzg2l_cru_info` structure to store register mappings and
> > pass it as part of the OF match data. Update the read/write functions
> > to use indexed register offsets from `rzg2l_cru_info`, ensuring
> > compatibility across different SoC variants.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 65 ++++++++++---------
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 12 ++--
> >  4 files changed, 92 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index eed9d2bd0841..abc2a979833a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -22,6 +22,7 @@
> >  #include <media/v4l2-mc.h>
> >  
> >  #include "rzg2l-cru.h"
> > +#include "rzg2l-cru-regs.h"
> >  
> >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
> >  {
> > @@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> >  
> >  	cru->dev = dev;
> >  	cru->info = of_device_get_match_data(dev);
> > +	if (!cru->info)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Failed to get OF match data\n");
> >  
> >  	irq = platform_get_irq(pdev, 0);
> >  	if (irq < 0)
> > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> >  	rzg2l_cru_dma_unregister(cru);
> >  }
> >  
> > +static const u16 rzg2l_cru_regs[] = {
> > +	[CRUnCTRL] = 0x0,
> > +	[CRUnIE] = 0x4,
> > +	[CRUnINTS] = 0x8,
> > +	[CRUnRST] = 0xc,
> > +	[AMnMB1ADDRL] = 0x100,
> > +	[AMnMB1ADDRH] = 0x104,
> > +	[AMnMB2ADDRL] = 0x108,
> > +	[AMnMB2ADDRH] = 0x10c,
> > +	[AMnMB3ADDRL] = 0x110,
> > +	[AMnMB3ADDRH] = 0x114,
> > +	[AMnMB4ADDRL] = 0x118,
> > +	[AMnMB4ADDRH] = 0x11c,
> > +	[AMnMB5ADDRL] = 0x120,
> > +	[AMnMB5ADDRH] = 0x124,
> > +	[AMnMB6ADDRL] = 0x128,
> > +	[AMnMB6ADDRH] = 0x12c,
> > +	[AMnMB7ADDRL] = 0x130,
> > +	[AMnMB7ADDRH] = 0x134,
> > +	[AMnMB8ADDRL] = 0x138,
> > +	[AMnMB8ADDRH] = 0x13c,
> > +	[AMnMBVALID] = 0x148,
> > +	[AMnMBS] = 0x14c,
> > +	[AMnAXIATTR] = 0x158,
> > +	[AMnFIFOPNTR] = 0x168,
> > +	[AMnAXISTP] = 0x174,
> > +	[AMnAXISTPACK] = 0x178,
> > +	[ICnEN] = 0x200,
> > +	[ICnMC] = 0x208,
> > +	[ICnMS] = 0x254,
> > +	[ICnDMR] = 0x26c,
> > +};
> > +
> > +static const struct rzg2l_cru_info rzgl2_cru_info = {
> > +	.regs = rzg2l_cru_regs,
> > +};
> > +
> >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > -	{ .compatible = "renesas,rzg2l-cru", },
> > +	{
> > +		.compatible = "renesas,rzg2l-cru",
> > +		.data = &rzgl2_cru_info,
> > +	},
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > index 1c9f22118a5d..82920db7134e 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > @@ -10,71 +10,76 @@
> >  
> >  /* HW CRU Registers Definition */
> >  
> > -/* CRU Control Register */
> > -#define CRUnCTRL			0x0
> >  #define CRUnCTRL_VINSEL(x)		((x) << 0)
> >  
> > -/* CRU Interrupt Enable Register */
> > -#define CRUnIE				0x4
> >  #define CRUnIE_EFE			BIT(17)
> >  
> > -/* CRU Interrupt Status Register */
> > -#define CRUnINTS			0x8
> >  #define CRUnINTS_SFS			BIT(16)
> >  
> > -/* CRU Reset Register */
> > -#define CRUnRST				0xc
> >  #define CRUnRST_VRESETN			BIT(0)
> >  
> >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> > +#define AMnMBxADDRL(base, x)		((base) + (x) * 2)
> >  
> >  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> > +#define AMnMBxADDRH(base, x)		AMnMBxADDRL(base, x)
> >  
> > -/* Memory Bank Enable Register for CRU Image Data */
> > -#define AMnMBVALID			0x148
> >  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> >  
> > -/* Memory Bank Status Register for CRU Image Data */
> > -#define AMnMBS				0x14c
> >  #define AMnMBS_MBSTS			0x7
> >  
> > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > -#define AMnAXIATTR			0x158
> >  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> >  #define AMnAXIATTR_AXILEN		(0xf)
> >  
> > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > -#define AMnFIFOPNTR			0x168
> >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> >  
> > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > -#define AMnAXISTP			0x174
> >  #define AMnAXISTP_AXI_STOP		BIT(0)
> >  
> > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > -#define AMnAXISTPACK			0x178
> >  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> >  
> > -/* CRU Image Processing Enable Register */
> > -#define ICnEN				0x200
> >  #define ICnEN_ICEN			BIT(0)
> >  
> > -/* CRU Image Processing Main Control Register */
> > -#define ICnMC				0x208
> >  #define ICnMC_CSCTHR			BIT(5)
> >  #define ICnMC_INF(x)			((x) << 16)
> >  #define ICnMC_VCSEL(x)			((x) << 22)
> >  #define ICnMC_INF_MASK			GENMASK(21, 16)
> >  
> > -/* CRU Module Status Register */
> > -#define ICnMS				0x254
> >  #define ICnMS_IA			BIT(2)
> >  
> > -/* CRU Data Output Mode Register */
> > -#define ICnDMR				0x26c
> >  #define ICnDMR_YCMODE_UYVY		(1 << 4)
> >  
> > +enum rzg2l_cru_common_regs {
> > +	CRUnCTRL,	/* CRU Control */
> > +	CRUnIE,		/* CRU Interrupt Enable */
> > +	CRUnINTS,	/* CRU Interrupt Status */
> > +	CRUnRST, 	/* CRU Reset */
> > +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> > +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> > +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> > +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> > +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> > +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> > +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> > +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> > +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> > +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> > +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> > +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> > +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> > +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > +	ICnEN,		/* CRU Image Processing Enable */
> > +	ICnMC,		/* CRU Image Processing Main Control */
> > +	ICnMS,		/* CRU Module Status */
> > +	ICnDMR,		/* CRU Data Output Mode */
> > +};
> > +
> >  #endif /* __RZG2L_CRU_REGS_H__ */
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 8b898ce05b84..00c3f7458e20 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
> >  	bool yuv;
> >  };
> >  
> > +struct rzg2l_cru_info {
> > +	const u16 *regs;
> > +};
> > +
> >  /**
> >   * struct rzg2l_cru_dev - Renesas CRU device structure
> >   * @dev:		(OF) device
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index cd69c8a686d3..f25fd9b35c55 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -44,12 +44,16 @@ struct rzg2l_cru_buffer {
> >   */
> >  static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> >  {
> > -	iowrite32(value, cru->base + offset);
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	iowrite32(value, cru->base + regs[offset]);
> 
> Should out-of-bound accesses be checked ? Ideally that should be done at
> build time, but in some cases that may be hard. Maybe rzg2l_cru_write()
> and rzg2l_cru_read() could implement compile-time checks, and
> __rzg2l_cru_write() and __rzg2l_cru_read() could be used for the cases
> where checks are not possible at compile time (for AMnMBxADDRL and
> AMnMBxADDRH as far as I can see).

What about using:

static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
{
	const u16 *regs = cru->info->regs;

	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
		return;

	iowrite32(value, cru->base + regs[offset]);
}

static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
{
	const u16 *regs = cru->info->regs;

	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
		return 0;

	return ioread32(cru->base + regs[offset]);
}

static inline void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
{
	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
	__rzg2l_cru_write(cru, offset, value);
}

static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
{
	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
	return __rzg2l_cru_read(cru, offset);
}

And use rzg2l_cru_write, rzg2l_cru_read where check can be done at build
time, and __read/__write functions where check can be only done at
runtime.

> 
> >  }
> >  
> >  static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> >  {
> > -	return ioread32(cru->base + offset);
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	return ioread32(cru->base + regs[offset]);
> >  }
> >  
> >  /* Need to hold qlock before calling */
> > @@ -132,8 +136,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> >  		return;
> >  
> >  	/* Currently, we just use the buffer in 32 bits address */
> > -	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
> > -	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
> > +	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> > +	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
> 
> This seems fairly error-prone. The first argument doesn't seem to be
> needed.

Sorry I don't completely got this.
Please correct me if I'm wrong.

I think cru argument is needed here has AMnMBxADDRH macro is returning an
index of rzg2l_cru_regs[] and not the real address.


Btw with the changes above here we can use:

	__rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
	__rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);

That is checking for out-of-bound accesses at runtime.

What do you think?
Thanks in advance.


Regards,
Tommaso

> 
> >  }
> >  
> >  /*
> 
> -- 
> Regards,
> 
> Laurent Pinchart

