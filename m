Return-Path: <linux-media+bounces-23862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F29F9117
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91D5D1883011
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7979A1C4A38;
	Fri, 20 Dec 2024 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uJkJW0IM"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA11C5CAD;
	Fri, 20 Dec 2024 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734693830; cv=fail; b=h4k/oeRKjdF4NXfeshvD58NIbCBx6BVjPmH7naDH7Hp6ngZPy0ekjMeemSFEgtX0MblPQONp5R+GVBBouucOev+XfehZ0cg5TX35DebKYz0DO9a2dB13dspo136vT+p7zUhOBTRxDRYGoDZju2ywyOVouDU3HqUUpnfenGgBCOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734693830; c=relaxed/simple;
	bh=zItt01lFYFhbzEqre2zELZHVbocJHpuh99dQBaQoBUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a7vhzD1Q24Y515jPLlLtu3YHeIm3bhLxNLR7fJQC/YTqNpb9KDwIXD8UM3cAcSH9LHwy/072KqaEfUfwv7lEBwdLryVDElDbEblwsrR8OGU34zep6EJpYr9xA0ZMzX4qcBW2xfwi/8MUhO1H2p7vJU392xZ8ZkVCMVWekdSzlxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uJkJW0IM reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEUmFT1FS150dp9Jxyto1ThAEe+/yUz5HVOAW3WGOhR3udilsSs/P6abXsSav6dmt6P1RSWD7/F3I5ZvEzx9Fh/QpoHPvwioXrtfy57kSggnO023VT4zFGFaPF/RXDT0yshvUlZdOVD8ye+UqRcJ+fV3jlJcFs8OY7L2Qwl3/F7s3as1ivoMFnIJe2UYCz2TaSjx9e6GAUApG/zFjWIr8CXOMj7twmNh+aCZ65e+XKVT7A0w90/QXnFWRlCg+Q+2lmOG+IhTqBm8NGck05SGm/Ub75Rgc/TyFN+EcTuZhl75ZVC4EX2CliMwQUXWBHeJMoUXVZXNiHsYkCxrM4uokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyV2M1WtREU/uD6vYPaa3RfMByoQk89kAaaAFzd72MA=;
 b=TELRb5bVmUC/prvbvhHDwRmJFLobe7z0z1OFAN0dhUwrQPDJu9Uv4s6ykKoln6wNRtUkAsN5qFKHZngQPKH4o7oF4bIFOmU71MOyYY/snv8Q5QnTYs8bSNB8amkxC+TX3o+23uJlfKIqe59y3wXfnpyqq78mTEu2TBBXOEVSlddt7L3dKCzELyqlntWzQK9q/HgL6IG2W7uXHcLbRu7JVqLMhQAvUQ5UcIE9thBHXZc99UNGddqrR085uLOZ5qbLqnQ4OWLGVpdF2CRsIYl8hAjzziLsiHBoJw/iuxUeDij2LlDKddX4PmLCeJLA3qccPIedrJB9qdkbOygF6D1HUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyV2M1WtREU/uD6vYPaa3RfMByoQk89kAaaAFzd72MA=;
 b=uJkJW0IM0VAwTz2jmz2gzhN+g6W56tHcu/YCDWCNMa3iaQfBtsOJiGU3dkVOBIx/OMQhRaI4nDCJ8iH31bxKxTKGPu0qgu2DlozTFLX/cgVK6L8IfiQ3wUo/9LJpdhwuKYWiGU3iT/DkWlDW7AJoyODGySFVVW48TiRB9qNIUyxs2hGhS948uSXGXbYjAMEFpiTIXXXNboovVkYLyHMm8plmWywWoCk71KPR8e8Jg0r4oGYHKXKZFgnC70lpK+wn79nQ+uSWeoFv237nWgg5Qt9FLEu/6RU8fdsIcNtkTAquBuAM+Gx+5nsTxmsJwylyZE6Yhv2DQtjU5a+ruwFgpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB8PR04MB7035.eurprd04.prod.outlook.com (2603:10a6:10:127::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:23:40 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 11:23:40 +0000
Date: Fri, 20 Dec 2024 13:23:37 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: media: max96712: fix typo
Message-ID: <skhr66jhvuaostv6w7dbddynpcqrmjsghelyp7lp73keqwar4b@nzfdlmrw4ts5>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
 <20241220104939.503547-2-laurentiu.palcu@oss.nxp.com>
 <20241220105934.GB3634024@ragnatech.se>
 <km7kpbkmdzkkuta2jlr4eql437mfkpv7oeeub4iajqex3na4vr@hqyapkdocyzp>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <km7kpbkmdzkkuta2jlr4eql437mfkpv7oeeub4iajqex3na4vr@hqyapkdocyzp>
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB8PR04MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 856ece91-23b2-4fca-3235-08dd20e8c133
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?/CcChzuFyVMicKuKbFbmQFB0+uetgk3Wxfn1ezsQY8poLUERckbN5lEa3C?=
 =?iso-8859-1?Q?yoxGwInpBXKpYgt3HvG3jhwTn5YGuGMN8wg+zpk2ECXlh9dLnVKUgZjxEz?=
 =?iso-8859-1?Q?P/hg7tZuS+uO7TZza+h9u0QIucbiPA0Dzy1ixIOeoRPrHy24RB1iY4hSws?=
 =?iso-8859-1?Q?1wKaw7XY0u+hHqqzw/4gKISpoeC7rEVQwXjWvzcRtLn/TsS9F1JtE4CVJi?=
 =?iso-8859-1?Q?H9+IK54znuwEFRUQI6NRl66xzAQrQFp3iB2McPOI8rN8rhqcVXKK+d0H6Z?=
 =?iso-8859-1?Q?F+PkGo2v9a8wzOTFfAzbNLHPNSSVKvMPKS7s9ZUOrXA9+gH9O56SwKeWDM?=
 =?iso-8859-1?Q?3maF4YshODzkXLcKOu1L4XndmbkrF2AOLDCB6FH+BH5jxlXJEAKgCdyFxI?=
 =?iso-8859-1?Q?N7/wWcbyOuomfiHULfvvXpBjySPK+pEoCmC3hoCF4mf7Opsc9HK77zqZ4j?=
 =?iso-8859-1?Q?1lb5P2tlu90lEwkxYKEz6DXqRCeX+H5abv9hamwOKoA3ANaOcDqUQH0gvi?=
 =?iso-8859-1?Q?oybtNUtmEYrqCEwKDGVs+I1ORNAyQK0548NbGvh2AR6vEdLRLn+yJfmAu9?=
 =?iso-8859-1?Q?bFW1ICFvDf2gTwSy6lYWdAa7TZECGvSuD6B0biSLfQE7bwWxk8Qb5hGNH9?=
 =?iso-8859-1?Q?dJ241uByacdWGZ3938yujO+AYw6uHLFP9Q8spOU4T62j7XdIR9U3ffmSQM?=
 =?iso-8859-1?Q?5oW7L3pn98eQ9zW4dxqtJrvpVC11beC5hzSu4dTs6YY7lXyrMHHyDlR4tK?=
 =?iso-8859-1?Q?QMCWfx6IyMehibZyYlBolrF7bTyiq0R7YDQzX8tCQxkeN9jE7E/HofyJko?=
 =?iso-8859-1?Q?r3UFJxbxO2JeveeQlON1QE6d7J6/tI3OhhLeaTiLyjbk+/ZwI5kEpcGaJe?=
 =?iso-8859-1?Q?dThYbDhXYDPoSUecK9Rxd16Y8QOFhd03w22uuKsQt9vkMTX0hewKrrbrwf?=
 =?iso-8859-1?Q?6xrP8qIwYImB7xVVvmaOxuwf23eCN4JzKDLn/MGhWNUCfkHW4P51dVcvoB?=
 =?iso-8859-1?Q?fmYxu9Dri0A60cV+ofP6OD/cc7ABOyAdABKZpw8Uu5nPYfNhhDo9t/hcmR?=
 =?iso-8859-1?Q?k2KUAyrun7sNra3RlgM2/0BcQ15xPc2gTSp+5xqs1W22LpqCh7XnhfLfrT?=
 =?iso-8859-1?Q?HNNoJHCuvTscagUoXbw275Ayr75Xffkn8L6jr5zWaJsG4wxdkUFB8dJkaG?=
 =?iso-8859-1?Q?zLSOjxzQKQJphS6rkv6k1QWyxBkYwtr0brG2p4mzWfthrI/QdtJTISGKXm?=
 =?iso-8859-1?Q?3VFqOcX0dcLIffFkbUu9so2dg4yyi8PupQ2aR+0JqY/rjp+TBcouHbqjix?=
 =?iso-8859-1?Q?GIW5GnkLXFayktlw/yqhIbJg68PUMEJtuSulk4IY9V7K+lEbhDqmQkJ1Iz?=
 =?iso-8859-1?Q?rdGBH/7gjYLeUqjaJbAYKyCntn4lPyYrBhIY8nfv9g0pRgzc3bLZl43RL6?=
 =?iso-8859-1?Q?SWr/NCkwYDFrZS3v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?xjFxnkTQ/QhrHmgbMSYzAzN4gOa9yt6+Yvn8R0ZZcaCuK+ZUKcmmHVKwAu?=
 =?iso-8859-1?Q?gVs7rpKatRZFULA1SACe/mVYBhDHTyKQpcJLOj6gGzsTyfsNjbpVpoGNLE?=
 =?iso-8859-1?Q?T/gLqPh7d6c+uuvmfed2bRdb9jwO5h4wrTDVBOTurwBLfM5Jn8pgOrHm2v?=
 =?iso-8859-1?Q?uuUjgq0b4OZMOsyk3eeCYQDaXq5CZJTwvJY+RYqQqeNMDR+O8z0HGZdj7l?=
 =?iso-8859-1?Q?maFMC3NYtwACmyNOPShvj2Gw0tGnVJMq0zILh4R3ugbtlWBIXKSEfHyGyX?=
 =?iso-8859-1?Q?4NkTd1lpeWNYefTxwdUKAGlFCKoxWJYAJz5BrEhDVoNSDg2do0lx95XqM0?=
 =?iso-8859-1?Q?ryIV4zhHiPkArIHHsNufEXb8e8a0tlfDlIESecBS21poNxX2kxNotb3oPW?=
 =?iso-8859-1?Q?RuA5ektdSCx478lNO6tLU3xiR9HkBtj/NVuEk8cAQWrJ0m2dAZO4WVxetu?=
 =?iso-8859-1?Q?gCrLy+5m7ijZN/XXuc4txw9XULHCoTYK3KHG4pcQ8dj4zVp32wK8Ic+z3O?=
 =?iso-8859-1?Q?ITWE8jYN0WXthnjOA4pbkEaKz/jb7kYFbJYbd6HpAyE3Xfnbsq7/PeY9vh?=
 =?iso-8859-1?Q?opW5CyRxyeXzCSUpUYNAqxO9Ya2p4MmxX5JGDVIcp7yRG7A0PBQRB2RXTd?=
 =?iso-8859-1?Q?L2cIUvgux4Ck7su68gR51Pue/pk1Ywc+EIWZDc0SvtuxchnYkeoaLiAZeU?=
 =?iso-8859-1?Q?2lMC4ReYiABZ7D4XbjgFBl3QI9OXSezagjZaUKA1nEYvihAVS20X5hgipF?=
 =?iso-8859-1?Q?YM2UQJ7Aqf3PHH9i2gZSZeYZlalupkx3JS8+WnsIUXbYZv4lTwYQh5xHNc?=
 =?iso-8859-1?Q?jWUFBYenYIJeRXB1HjnBC5zTpZhBZJ4hhrOH7+7rJDuM5rJGPblWy5hayk?=
 =?iso-8859-1?Q?meJ9ISohOSltORJQ1cAgUhQkDnav97nZFj7U7jLJMalFd7QgW1mgN9RWR5?=
 =?iso-8859-1?Q?3gvLnTwT0Mwz4NU/VaPi0TIsIGAgJshVZZhTS0qladUANWDPtPYLqnxZ1K?=
 =?iso-8859-1?Q?XCk2edB4XsAYt7CBpFpxxrJAZYUdFyOjpVBZG8xte3+JVv7FaWdKx/HQ7V?=
 =?iso-8859-1?Q?PEVI84qJ02RaJC0hPskcxCdHFj1DZkOiT+1StHp3ib7ttyRt8x0tX2OOFh?=
 =?iso-8859-1?Q?UM1jqwIUHtE9A8Hv1eBEdZK7iofm3O74VR0aaJnsGMozEPRdG0rtZFp/Z8?=
 =?iso-8859-1?Q?6Bc2SamgHz0FF5IeHINdX3dnjM8jsJU5NStCpoV774m8EdDkunttuIc5Lo?=
 =?iso-8859-1?Q?kS+k7F8UsqgEAu9BuHEea3TFqVlrOyKUtSyk7PbD01baqwgJKTP6wroAZO?=
 =?iso-8859-1?Q?6jJztqDXk1N/thPBkFIGuZO8KPUnjDHtuwM4sX1JF6/HwKDRqiDr7vuE2M?=
 =?iso-8859-1?Q?vUgMzdIupSTSSJZYx/8o3W/6WiGgjoad19xY8x7GE8IcwCkTTj9T3OWtGB?=
 =?iso-8859-1?Q?EVjKyeMMZElbnc4QC6hBYN9KQ+2wWGdM7UjMS4h5q3X3PVN0XhI23dd5f5?=
 =?iso-8859-1?Q?klvQQGqRnG50veDA9eqqxp6EyEBtSoEW1oAskIZH9+9+vlFPcHZxA/IgWp?=
 =?iso-8859-1?Q?BfMY0mCnRk82sHp/I1XVlP11bIFWI6IMOzOC0RTSW8cVf86RQrNp9Y8dVc?=
 =?iso-8859-1?Q?L7Udo3lCIu7pPmb2Ery2F3/5k8UHSFkn0h2rdwOHubCR+fbych+Pgf7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856ece91-23b2-4fca-3235-08dd20e8c133
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 11:23:40.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4ejuo/XzpJfQelpk8kWfB+yDTbxfiFOmVc9V2f2n8OX2tKZt560oBdz1Yy+kgKfZddfvJY1G9/OpUq9BkVQZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7035

ok, I figured it out... I had 'format' set in my ~/.gitconfig to
us-ascii. :/ My bad after all. :)

Thanks for the heads-up.

Do you think it's worth sending this patch-set again to fix that? I
suppose it could also be fixed before pushing...

Thanks,
Laurentiu

On Fri, Dec 20, 2024 at 01:09:59PM +0200, Laurentiu Palcu wrote:
> Hi Niklas,
> 
> On Fri, Dec 20, 2024 at 11:59:34AM +0100, Niklas Söderlund wrote:
> > Hi Laurentiu,
> > 
> > On 2024-12-20 12:49:36 +0200, Laurentiu Palcu wrote:
> > > Fix a typo in VS_LOW expression.
> > > 
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > Reviewed-by: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > I think your mail setup mangled my döts ;-) The Content-Type header for 
> > this mail is set to 'text/plain; charset="us-ascii"' while the patch is 
> > likely utf-8 encoded. Same in patch 3/3.
> 
> Sorry about that. I didn't mean to mess-up your name... :/ Apparently,
> this how 'git format-patch' generated the patch header:
> 
> ===
> From 19c513feb2003dff89c28ef9e54c0e06929efb0a Mon Sep 17 00:00:00 2001
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Date: Thu, 19 Dec 2024 09:28:54 +0000
> Subject: [PATCH v2 1/3] staging: media: max96712: fix typo
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain; charset="us-ascii"
> ===
> 
> It looks like it generated 2 Content-Type lines. And the last one
> took precedence... 
> 
> Looks like a git bug?!? I'm no expert in this area though.
> 
> Thanks,
> Laurentiu
> 
> > 
> > > ---
> > >  drivers/staging/media/max96712/max96712.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > > index 0751b2e048958..5228f9ec60859 100644
> > > --- a/drivers/staging/media/max96712/max96712.c
> > > +++ b/drivers/staging/media/max96712/max96712.c
> > > @@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> > >  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> > >  	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
> > >  	max96712_write_bulk_value(priv, 0x1058,
> > > -				  (v_active + v_fp + + v_bp) * h_tot, 3);
> > > +				  (v_active + v_fp + v_bp) * h_tot, 3);
> > >  	max96712_write_bulk_value(priv, 0x105b, 0, 3);
> > >  	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
> > >  	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Kind Regards,
> > Niklas Söderlund

