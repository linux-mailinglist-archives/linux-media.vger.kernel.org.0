Return-Path: <linux-media+bounces-23855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091B9F90A6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BE3D1896365
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FC61C3F28;
	Fri, 20 Dec 2024 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A8PiF22g"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C318C31;
	Fri, 20 Dec 2024 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691788; cv=fail; b=ut07fnv+GDLsoEXHY+6qgsgIn0ecDz+xO7ghGxzU97f8/uXdzehfSQ39odRgrhmMGwYRl4RBuJnDVpgEU8XfpoCkYUtHyEZKVvOKroZGdhB4ht3jtsiFuVgiC+nZ0+7udpug3Dw5Sjksq+n6uHR4oCMO0LP1Y44Z16IZxLf6vb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691788; c=relaxed/simple;
	bh=r3FUbOnwuS2RXdD5Dg5X/wWLyNkE9sBcBvtvd1Y6uho=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FeWly29JD7kQTcJ1LN5V52hy1M/q/QUFf4emv3ggt0mC2iUNuxWSiWuno6HowBidekoNuQZ/7NTvz3xjUVvVo6rYfg8G8gtHlmZz1uFw/cyVdUF4VYCUWtu56IAIRspPUK0zNAMYN87dY3X8Q7ivmnmBY0pjLSy7oUtzXNdUipc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A8PiF22g; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnlFwA4QCpAJAEhP/5hU/i2/Qzu7mt6jbGTekkgmuAHUPzeK9LMdP+oLs0m8BxItf2PlIJYG85rz4MgFYG26N4+kRevZ3Op14VB1dUW7zmnNREmuw0LJBChiDpF3L9m7aqsW9fDv9nzf9KcbU+klTEVmE2YRZMSbkB5tsvzB1Om9dxGVwprqP/L4eUzvAPZO8pt1FjLAIj9kCrlHw8qT/do2vWWbq9qgekawkaQlLv6+DQflp1yjzF84/qPu7j8/pw2UlctcRodcs5m5mG/Nx04Q9VqaFsoa/alaXHKaq0+SJj/giYsvm9XFGiTkBPZCjgOHQzSmtpfYUZJFRdPUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1afMrTqN4OGzN0x0W6akzDjrKGbloDUX1Fe1Du/HFX8=;
 b=ZTVmn2OCkKi77FXbXxBFCi2vH53IiLBJT7YasKYOU/RsAmR2ItBrPxPfelvxFPCJuFap7MtxvgWvjOTZ7YsmtVZKezeRrba55kghZ3haf9MGNnU/Ke07c67HHFZp1dEbSXC7bFTc2ZSOhijIhVFrcTezXW2WkuOLkqOnC3sWbvX1TVTb37G5sNxpK8vTlhy4QWVtcnfrauHGFV5seoi1ULR2HnOoNqm41WycOhuSyEjgQivKImRQTQ20lLcOWmiMgLvzZ1oLtgsYdRml6LAtWPjIqD5kT+RmxboqWuggRTQwTqJjJCn5dcyUUCIY3Wcq6zJIZFt0vXUQhLeUlzuoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1afMrTqN4OGzN0x0W6akzDjrKGbloDUX1Fe1Du/HFX8=;
 b=A8PiF22ge9EK1bB8AByLTvbPIZ8BcjWfDifVvy8B46sC8iGnQ4VQ/o4Xus0O/rCG58oU5YwMkkFAe3B3WOowLwkIwA+ObM/9gZXoW26rRTh1n3NSNSyS+7+kThaEZlJ9e12r9i1wjpB4oOSgmnJ9rKPvaTsG2ywbXVbGjG3W3oNItXLuCnugHXDAOmH/lIksORbNOQcFEIWaVpxSxJNe1dl3X8qld7Gx6FO8WfKouCR4BaFqAz4U/if+iR2+2YTwqPsrWGrqUz1lEWWhh7JAJcudshR7zMnRJKhFCyrNBptJ/ysgs4gOQzw5BTaPxRl9Sr+So75kgnl6MviNyU13gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 10:49:43 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:49:43 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/3] staging: media: max96712: a few, mainly cosmetic, changes
Date: Fri, 20 Dec 2024 12:49:35 +0200
Message-Id: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::11) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ee0987-b72c-461e-0679-08dd20e402b6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gEOL5x/pTvmF2t8dcSD+vTMTGhPc3slLBkTnaMKWOCGfUrk7JZDAqSGnyyKn?=
 =?us-ascii?Q?e8iARCWI4R5daJwKUKqy7vpQI/5hemnQ0jYgpKVVu9uKNgUSNJlPP6shD57a?=
 =?us-ascii?Q?Wx3SoCaTV5QQzrP86RxioHSgs5BUMvc96jMvK6JsDDNq1iQxiStX1F4AYsLr?=
 =?us-ascii?Q?R0yIYVtBKlKDfCT8jH9Nadic3dKdQubpHf5aknSfaqivLvHUSDjXbxuVYlUb?=
 =?us-ascii?Q?K7AcXBd0ykqCUm0Wl488JZb5k6u7tCHAQQbN/x8hYyx7I/qR75ska7PvjrHZ?=
 =?us-ascii?Q?i4rAQQkRjaLwKvSuH5a0DC5vR9kRT1cDNF6DQeC/KImoL9EySa4w9yswrk9S?=
 =?us-ascii?Q?UYKp7MkAB7B1DMzP5k94S5VvflM7JLABcW9s9j0o2sAEs4VGd3vHuUZMxUu5?=
 =?us-ascii?Q?2i9RQY0+Pn+QYOZSoEm1Bg/nbemnImq2aSidmFr/GUMFFey/GZcYZt/lkD+D?=
 =?us-ascii?Q?JAWMtYZeiJZ6N6I/kxme/fRVMIO36WwAMXyFMNJMtoBTZ51mZKceJ0MALkHV?=
 =?us-ascii?Q?m1IhdQ/ZIVpHDJ90dRIDywXfExvht/Sk6NmSYdplWZZSXlq/ehqY6aClmo80?=
 =?us-ascii?Q?nTZiiz3aMSx+EvUuIQYFbJRqiEylJcC2IUJgHR3qHFfp/ZN+PsccJKp7/U/B?=
 =?us-ascii?Q?02a3Eo+O5DiaquW18vuqeRx8roOw1Ee1hr6MCBPt/8A/utBUKZSCM9Sw6PrD?=
 =?us-ascii?Q?4RAjpNFGYvAjtFLylGHR+jv3GQsiCoFzHkRPfHQcJL6WeVr8ZjcDo9sj9858?=
 =?us-ascii?Q?0d//0iKgAGwgEkPVO3Xuk4p5VXOotuFg8Pa20CvsSn4UNVJ9USXXslxteVyK?=
 =?us-ascii?Q?yfZKI7QZAWAFyPPpiDnwL+Tb7bNOgY5ZesguuNo3vr5yBGBCTrCNljHTyuAb?=
 =?us-ascii?Q?3YuhvQ98+5NnL0G2OjQMZ6UpwRZkRa4KVvaX/i4KodhRF+Ms8UsRPEDzinhB?=
 =?us-ascii?Q?55Ik3VGZ6aimZ53TGqZpikTtaYbsiWAPDNzY9ldhoO4wq8ZREW2E3o3LiI4q?=
 =?us-ascii?Q?/W382MAR+9TqZVZKTakQRPcMHdoAtc2zEUPjEWW8HbwyZNj1441wmpL61urP?=
 =?us-ascii?Q?AxG2WSOX5DM6zQ2Iy5mcFOUd0zSLdnTiYqBq0QFo1fnRRKqtB0TXq5Dk8ECF?=
 =?us-ascii?Q?m28DvtJbWADPCydnmVzXDhNLGNRVd+iSB3iIgt5PxNmvNNLdGOQSgPsCmCcp?=
 =?us-ascii?Q?F7lBz87Dxk/NsJgN1icOCghMp4ozPNEn6DH4WKNguX1ICUiLPFDoBnVnMuJt?=
 =?us-ascii?Q?/2KPqcZb4R+FJ3l1q2j7uXO2dNOQLffXZAZdFjVsfS6TwhNzXAYX+lHUHNgU?=
 =?us-ascii?Q?XUfpCGWVQdw8OWjZJUVs9A8gpR3Da9H2lOShZ8LdsCnD1WdDlti2Uzw/583t?=
 =?us-ascii?Q?J5pc0h865sc15CTaCQli68N0+Nv2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qg20i16aYGkXCNhevMsdmFZpwjWJ65qMFjnAb1DvYqPP9biK2R07UedBPtM/?=
 =?us-ascii?Q?K6Fao8FitcxskaYp6Gen7A3I/nZqw0p6VVvIdGdh+nkb/GiSNRCYyDxcTjG8?=
 =?us-ascii?Q?P1w44ZTlZgJL2DOo4RjTvvGnAfeB8h8bKJ2is6VACzwOgPNjRtwc5xcOU6qL?=
 =?us-ascii?Q?21dgqGrlEmpBPJkwVvtCX2sqkNg461ydMHr7YV8kzmoj6LxdlgkxC4esI+bM?=
 =?us-ascii?Q?GpqIJ3acyoFVNjtcNWrMemJPCEAKQoEhkYt9dEyT6pQ1OH2m7efg88zw3lyF?=
 =?us-ascii?Q?kkteWv914HtePVFIX/SoFmyu+HhsA4k9cBTyuKGwTgfyHcHCEk3dvN2oUjFX?=
 =?us-ascii?Q?slusEiR3/AKT62Oyb+H9MWqWQXY5Ay0817wSY5r1FP63Qo7K9uZ2LgyEFPaV?=
 =?us-ascii?Q?PV8udW/7DV02b9Ha67pWmxG9SspA2HqNLb2xrNi4XstDySkHC3Om0SyTMZNZ?=
 =?us-ascii?Q?vDgRq7AyaEsPG23JTAG+hOzFR5LIafs56tMnuHwTAeK6ixtUEeNbsHDXmjNB?=
 =?us-ascii?Q?h95Tr6N7tPLrHr3oSiFX2e0p6Jv6tQt8ndu/5M6T/FrMmcc5/t7CtuNFSDC/?=
 =?us-ascii?Q?Xum83wiqW2OW59S2dMTusPmZm03nV/yYnAS7/qrkfFFR3cqB4GAUWKOom4dM?=
 =?us-ascii?Q?ys+1NS+GLTFZyEqq1UobHG7tfj5j1FnvW8/MWQgE5ykXS8EewcGdRjawsPnw?=
 =?us-ascii?Q?dYSatHhwdSfbObSwnmCLekE/jplwjOOGsI7x0NBjjDWNS3LznQNYMpBJNDbW?=
 =?us-ascii?Q?TAJEYjKlOVm2/j1JKX3wAtFNuw6ldOdsDtGrMwdEyI3JPpPI7xOqT9i1BJvu?=
 =?us-ascii?Q?3KvDZKBbqmrQyH3Ji1xAFIYlbsdhjvUxR69W16BoDpPkc5KMJcxNbysgcNJ1?=
 =?us-ascii?Q?Wf8z0Gd275BeUXFXPZE/LZtyLLvltGlTF7aTij1D09NPffvyOUJ5oXS9VD96?=
 =?us-ascii?Q?41hU5s2tj7TWaMesL3MBMrIEJNbHq8rAllrSQId9GA7nn8LfU1qjUmgSy19I?=
 =?us-ascii?Q?Fjh+3xmjVQ7iSaI2iIrYTB/PyEh4DcTaB/pF2JUP8pxQ20dP7I2d//M4Ltu2?=
 =?us-ascii?Q?lZuQTC93D5ukgs9/hoJSUhv+dNcmRLih1fVIsufmIpw3mYBOVen+M+s8K8Tm?=
 =?us-ascii?Q?WHEH1lalX282ZbWZj20o5YBgR7iUvHXgT0Ar64HaWkWyRU+3c1AjHD8K9+/k?=
 =?us-ascii?Q?U32dA/dT4AbmpHPnudY7fyKMKy2b0bwULWy4RCFtZ5h2DU6mpI4vq7fKYCj2?=
 =?us-ascii?Q?Bk0PTqyApD30GFXdndwTuAwDgQNUEl9jtJ1yT4RBZhJxlQsm+pOPkKPpX8ro?=
 =?us-ascii?Q?ZoXTj/hakRfQyIBJktn4aY+M17epX4UODo2/vnx/iOAku+hJXDtzvo53GJCC?=
 =?us-ascii?Q?JE9XOEYo1d8UJqsC4GqlY1reuA3sPRu0hZWN7DHOspf2ruTjcjAVd9h4jMnD?=
 =?us-ascii?Q?5gc1UXWvZSlFyHN+sLYrpQq7UcWNTXlW3VX5AguUnuRbRlHs6TzguIhVa9nw?=
 =?us-ascii?Q?dyGShvqOEZ5VC1+8f0QVa6G37jjZSXnEtYGf7cBC8pSz9WQgdG0SL5VEngaB?=
 =?us-ascii?Q?DTmWvcjgnqyi2xlZpja5b2qOMSMQFTG9ZH5Ys3YcuAsl3yVLyQnJdVmYls5d?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ee0987-b72c-461e-0679-08dd20e402b6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:49:42.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8zsy/NafP59jz0MhQ0yPEJWpNM2HBwZ/HzqhSynDKaeHROLiy9mVQFd+hIDx/b0S5/TuAXv8AVhb1osukaPFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300

Hi,

This is in preparation for bringing our downstream max96724 work into
the max96712 driver. The changes in this patch-set are mainly cosmetic
to increase readability, with one exception related to the PCLK debug
register which appears to exist in MAX96724 as well(see VPG section in
users guide [1]).

Unfortunately, I couldn't find any max96712 reference manual anywhere to
make sure the registers match between the 2 chips, nor I have a max96712
to test with.

However, since the max96724 compatible was added here, according to the
commit

6c872b782ae ("media: staging: max96712: Add support for MAX96724")

the chips are "almost identical". So, I used max96724 register and
field descriptions instead. Someone with a max96712 RM may want to
double-check though.

Thanks,
Laurentiu

[1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Laurentiu Palcu (3):
  staging: media: max96712: fix typo
  staging: media: max96712: remove extra debug register flag
  staging: media: max96712: add some register and field definitions

 drivers/staging/media/max96712/max96712.c | 213 +++++++++++++++++-----
 1 file changed, 164 insertions(+), 49 deletions(-)

-- 
2.34.1


