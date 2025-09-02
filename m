Return-Path: <linux-media+bounces-41490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88766B3F1F9
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 623997AF377
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 01:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DF02BE637;
	Tue,  2 Sep 2025 01:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ahFIpsYn"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1A71EA6F;
	Tue,  2 Sep 2025 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756777554; cv=fail; b=qCUDh4RjTBXl1MVYPvrddLTwU2xEJlNA5oIj8w9I8X/70NbKPZvqoifHF3oUM6yb+TCShLUaMRRnTTOVnoXR84AO/4yAwxwUwE+uh6EQVB4iQEEsc7yADmo9ylRbdJudKk53uxvfI1GydGjkZyNaftugYGv3ptyw14+S5Wljfhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756777554; c=relaxed/simple;
	bh=sBcrCkWX267DHMqbmlqyHs/tTZiFx81mvobqXeogqso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HkE11pL5bvOIrrx9mEDlth/vMT7sJ1gs6KkPpMxhwbBKBm2i1BhUqhsWQ2RpizDawUnaUVy2H3xC25obf6tL9dfzIgQpN2RQus0Not+w+UZ5vb2iE3m8UX7Phf755doBqET2ZlNHFQdR2s/KCv5winysGY+FYKTN4qmlD6LCf0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ahFIpsYn; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hrp9FOvWY4P3AefoD8zpg3gfgyLAZyXQf5MWJYdu4wf+7JEJUO9d4SJ4okRGRh9aAAdb9re7SqHQkRX8+qgkgN4oLhdF3xymqKWvak6NJ3SeWuAa2RKmSmo+o15y3u2i4Vp5fqbK0Fqd7cZkhYsJZgMK3mjgQBj5Hk74T1rAjTeRXpFE1QCB4+envGEW3ZRLVkMSdmzfhBlUFygwCfEBWGyRgURWvRODC8bXRDaaPh+YpCi6ABga2xC3fojCCIBqkkbvYG344ynnjXxcP7r39kB1KC0uYkdHNT4LiKdCIqI/0VetOs8EWQtB0uTExBYXLOCWXSn/tmViIKdzHf7NdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q7yjolcMBDfI0Umzg8od1+rN/8VcdWufxbOcCtkWr0=;
 b=qMzleeWRfiNK7pUnPFH4WnyY6866swJtUDMZbPfGOc1pCokXglnkReUDxAWL6rELepVixMcGb/AF6AC7zTCjJA1HYnil1RiOgugtHQNpdxYkSfbL5rfvcfjfAJ8SjjzeM2M5Axu+PHI1SwIdBONq9Tb0/WsfTRGu4C0JwTN6nptuXfxHbPxtXkgis+Lg6HbNQuJ6OeNKxUpGUIbiT8MhD5wDCey0+kq57zLKsS1LMcdsHfY3YUzFdlU9bSdYZcYw4wXuVrOGzI6cVgcvgXy7zKmVZpYM60xGEGd/5Wwi77rDdl6h/MhD4vabCOE0GlJHEkznxwokS/5rQ/V9bqNtCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q7yjolcMBDfI0Umzg8od1+rN/8VcdWufxbOcCtkWr0=;
 b=ahFIpsYnMcrUlQQnIjvSXQ5sd5sqMjlx2+NOxH4PSjB7Ki6I6LxlC6/jBYNJLZAkkV+amV4L4p+fOhWIcbtZmBIub4S1KfLmN+kWyj3v3ASosf0O48RqQfk7hdPRuPxirWCbkuiyBD4rAvcEKml62M4ucd+3Edh69/j89e6ZhFr91Khu8VpWd6QdLow0EtvbwJWPTzCF2Vv09sbX7LctVWzz7NyQSX3JVG4F0NwPYHrpivVKMkojTnvgCAToRIv7jmhwXhATaeWvect6BjQtp2RKA/VuhC9BZZbqP3qyAt9lPQNuJvJYaCfiqNDEsCsQotPe0pKGsurY9xkS9QID5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI2PR04MB11193.eurprd04.prod.outlook.com (2603:10a6:800:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.15; Tue, 2 Sep
 2025 01:45:47 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 01:45:47 +0000
Date: Mon, 1 Sep 2025 21:45:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901154610.GB13448@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI2PR04MB11193:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c6ecaa-e519-4d9f-7f1f-08dde9c27037
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lwQQzkkWBC1WRxqu5zeETC0pm/UBSQp57XppHwPpHVK4OpMg8xK5nxRkukiR?=
 =?us-ascii?Q?DnLnku2709JEEVu46PyxQEh1KMAU870D9F34IOhs180pc6m9t1tT1nx/1eKj?=
 =?us-ascii?Q?KRZYzkNsG7v/Vf4neCCNGh023oPme49pE4NHkJDHwnXLnu7KwvIz5vc7Mr1h?=
 =?us-ascii?Q?RczuD5iNAo7m7p2y/XLoec83dbVmgsZV5AQT+vLst38LIAT83nemjdOtfGdU?=
 =?us-ascii?Q?19e3fQThCmZ/iOvaTU6PEF5hdfpWgvNYJUqzfFRu3H0E6Y1fYqep5D0UfuXP?=
 =?us-ascii?Q?WvEObuv22pGCS5hsmhAZW7BWt6YLRc8RWF1KphRvfo0wAZD+HmgrTRuDLVRX?=
 =?us-ascii?Q?okoMu00CGaoDXrE59DHsFA85AcLBDfa+hnnixCDAHTIdq6D5hCgGChKZLfdT?=
 =?us-ascii?Q?Q4dIjm2nMS1B/i8y6/Fnb8r5lFrPwqFF8bSYSK+tOZraFWDmzcBz1cVkasZi?=
 =?us-ascii?Q?yhnvlYhmRI0bvv8/0FzKxm0eto6lzmDOZTis7QqZRfOiIzrTTEasly+2vEhS?=
 =?us-ascii?Q?9W65urf/PzE509sfv0xmqH9+7OWx1Uq47oT+Ook8iKpoeuAc5PYU4ZZ4uupz?=
 =?us-ascii?Q?0h6Jn1LUo3KEkE3nZtJZFv0ov1r0TEeFz8/is4FzVrAWKYYEQmwE6nOxc7gU?=
 =?us-ascii?Q?XKLyECAnl/jjYmirGBYoogFgI5aESwH46ofhHWbaXG/H0JVwjWw4u+ly95Vh?=
 =?us-ascii?Q?Yo3cbvQ4PzNRPNkyJojk3i6sMB7esDSNTK+hKNJGZwm55hQwMBAWTXL/+8gm?=
 =?us-ascii?Q?YNdISY7Z8caNwrorOx424Gv2/FS60h9uD62Pzd70KaBPJv9TEQqG7sr1tkra?=
 =?us-ascii?Q?tVyHNUu99DzWMAMn6+PcN9RCCj1XbTZ5FWBconbU1R1+Mg4OPIkf1a8PW0Th?=
 =?us-ascii?Q?m+4ZC0BTwVxqV6kZ7gphooQj0lLs83esVYhRvbP9aTaT3lVrjQrYyOzYI7Sd?=
 =?us-ascii?Q?uhIzUjzXJvH02nFYGLSLNwH1PT8hCnC7u0yG36zO4DBdS8oY2ku+RcvsjGkE?=
 =?us-ascii?Q?3zBZYrNjnT6+Zx11YCS533pT5djKqAviJDehRsWaU5Elw5YZxUoEPfRgC76w?=
 =?us-ascii?Q?IhsCvCTn8aMEA7g7HTzXYozSrK0ILO8El8kYdhLaPA86cmG8cemPQx1SkpmO?=
 =?us-ascii?Q?dx7rMsa5tuwpLSZNUuC7R0HPd2v1TWO+srMXsRTmGpzo6m4Tlr9XVw50Ewy9?=
 =?us-ascii?Q?agp398y611D6XNN0h3bDpzeNaWj8/PM/ZynlIKs+oDPsDl5ZRy39W9jQXtRu?=
 =?us-ascii?Q?XF3mHfb9E18i8+o7FA8GpRCCL1sd4Li5fqj+Pw9Y52bvIQNRgcfYUJDq9lpa?=
 =?us-ascii?Q?0ut0oYy6njPRwM6UenFsE2ScrjLIWaKLYwtLzX91XOiTLDUzn7sbiMEj6w8F?=
 =?us-ascii?Q?DaIIEDCuuSg4ujNkJUEre63ecTFO2YymdZWh++2GUp3ZS0la+i54LFfsj9Rm?=
 =?us-ascii?Q?fQFkRVz0uv5uj61c1xrjD4ohm9jZtV8K/eZ86YD7T3Y62rK6Y3ngGQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nXKXCvy4ztbuqOItm3UAlzokqy7ZLx9m3flP31eQt/bx8pUxtjUGWg9I0bEK?=
 =?us-ascii?Q?pZYvQZ0iKV4WBUp8Bh1vjzetCux8kX1dT+Yfq9S1J7C2hsTvTJdgxQ/yH+bk?=
 =?us-ascii?Q?st6ksuwfJsKQNO1lfnqkQmRMLshif1bmO2TmU3lJJQFDCYnrsySQH99aHWBo?=
 =?us-ascii?Q?xju/53Ke9l864ozsZ5jdODGfcG0Qp/tV7DHawsGVa3l0mwGkHXJGxmW1oXyf?=
 =?us-ascii?Q?AsjqWoMlkJ407D3mrg5khCC1f+xB8rttTaoVxH4DEdNSq/HB5LkQKx8fswpK?=
 =?us-ascii?Q?UOWZWozrJSNSofisVTaCu9bjNkO4yyFNqhcz94DUJfBBdNPGlIwOqyBVgOBe?=
 =?us-ascii?Q?SvDwMX0sqeusRDrYW63AgMlLj7WTm7l3Gt+Ck+sWYC+TgYgogH2mUiLaLCm7?=
 =?us-ascii?Q?akYtWpT+g8hF5WM3Q+LezKZCIdYZ0DxKIVH9rdRCRgjAL4glHNifGlqjECh/?=
 =?us-ascii?Q?LLitQrfgWSrIzX3lnEJbRuFNJ8OKnaKqRs/KByMCisONcl/XVoBcpags8vXG?=
 =?us-ascii?Q?YUU6bp90WWxLVccSfAU9w7HOVU5qJZgzznhRgVc9AX2rMZhCg3eK8VCLjToR?=
 =?us-ascii?Q?XH8RbkyXpVr05UtEvhWweYknenRyvgEA5K9hjQrYV8kP26x22NSbP4w2WUTa?=
 =?us-ascii?Q?oBs+Cd8qGEO1BxyI3vIbuVCaam442e78uHqNOIh4wpL3uydWyCmFCznuOmVY?=
 =?us-ascii?Q?31qNwaKc1fO3Kf1EF9M4DWQUHZs1/FiG3rz8hQI8xhsMMwMuM75FLyXmfB96?=
 =?us-ascii?Q?VIEqhuZxm1qhta0z4oh6oGoGEuAGU5ZwoOe76UvApqUOb7cs9mYKuk6uGmKu?=
 =?us-ascii?Q?1dJHK6O5HbeV0JYP2EFGJGz+nzSwS/WMU+Kf9SVGxA31K/HyrPYWIH3oplpL?=
 =?us-ascii?Q?Lczxbyq2++A54GQ1gxmCIYL51m/fsWNFSUnCOCuqVoPe45alQzKfsmT73LXj?=
 =?us-ascii?Q?Z08NHoSea9UYS278CeIh7gNjINKv6IcfWcETgM/wCwKC+GydtNphzqdq6/75?=
 =?us-ascii?Q?WkidRPC8tOyO0y8ehtWnDQ5kiBqqN102QjYz1m2WN8iO+KG3ArcMrBLI09N+?=
 =?us-ascii?Q?QmGH3afSXy6U1MfHjkyViv1DGvLJH7Ut68oSdJnOkighjVmjY/ZRs0lCS6Yh?=
 =?us-ascii?Q?R5jvf8aUVEY6kFin0V2oBzJXk3R0Nv/McP6ntqdS0Hfnto9PTvvytwG+i1YO?=
 =?us-ascii?Q?maxmKI1wtTarme+YYwDRcnpIg04nIb3HKjPBqVcZQnsP3ee05R12j37SOpzP?=
 =?us-ascii?Q?YfgKhd9EaNMasKLB2T185eu/iGan/fSquJgiE71PozFbe3H887yv+oyP4IZR?=
 =?us-ascii?Q?jZ3eLUv5jF+x3s1VahcHpvxwcOd765RAUls8FQHFWq+i4eW08ApoxzgafAQJ?=
 =?us-ascii?Q?uCgcPGOzyDS4pAGph+a7TLI5NtYBVbWvcOM3M92g92lD/I3TwE4dQUCKK53p?=
 =?us-ascii?Q?ytdxqPtlIugZSHfj1G8Tsn6N1BewXwvuy4whQn6EQSGd3CshHz56RZVZ3Ud+?=
 =?us-ascii?Q?t8D+mXpEQUELwR2Mlc51rn+YIWADsy+68OvPWSfc4bD6bsKS7MEi3r3osDau?=
 =?us-ascii?Q?cz6HHC7TWWII+q0rsTX7lWBFWLNzpgI3eOO4sxyl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c6ecaa-e519-4d9f-7f1f-08dde9c27037
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 01:45:47.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVvnVjrqHhmpcLLvZN8xiLkDqmvfFGldLpAotPl25Ma8HiXxPaX6DBHNLhqwU6UfMPU4qsWA6cCNBhDVrjoL4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11193

On Mon, Sep 01, 2025 at 05:46:10PM +0200, Laurent Pinchart wrote:
> Hi Guoniu,
>
> Thank you for the patch.
>
> On Mon, Sep 01, 2025 at 02:25:29PM +0800, Guoniu Zhou wrote:
> > The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> > present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> > clock as the input clock for its APB interface of Control and Status
> > register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> > increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> > same restriction for existed compatible.
>
> s/existed/existing/
>
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
> >  1 file changed, 43 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > @@ -21,7 +21,9 @@ properties:
> >            - fsl,imx8mq-mipi-csi2
> >            - fsl,imx8qxp-mipi-csi2
> >        - items:
> > -          - const: fsl,imx8qm-mipi-csi2
> > +          - enum:
> > +              - fsl,imx8qm-mipi-csi2
> > +              - fsl,imx8ulp-mipi-csi2
> >            - const: fsl,imx8qxp-mipi-csi2
>
> According to this, the ULP version is compatible with the QXP version.
>
> >
> >    reg:
> > @@ -39,12 +41,16 @@ properties:
> >                       clock that the RX DPHY receives.
> >        - description: ui is the pixel clock (phy_ref up to 333Mhz).
> >                       See the reference manual for details.
> > +      - description: pclk is clock for csr APB interface.
> > +    minItems: 3
> >
> >    clock-names:
> >      items:
> >        - const: core
> >        - const: esc
> >        - const: ui
> > +      - const: pclk
> > +    minItems: 3
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -130,19 +136,53 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > -              - fsl,imx8qxp-mipi-csi2
> > +              - fsl,imx8ulp-mipi-csi2
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        resets:
> > +          minItems: 2
> > +          maxItems: 2
> > +        clocks:
> > +          minItems: 4
> > +        clock-names:
> > +          minItems: 4
>
> But according to this, the ULP version requires more clocks than the QXP
> version.

If only clock number difference, generally, it is still compatible and can
be fallback, especialy driver use devm_bulk_clk_get_all().

If driver have not sperated drvdata for it, we can fallback to it. It is
quite common.

Frank

>
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qm-mipi-csi2
>
> QM is compatible with the QXP, so you don't need to list it here.
>
>           contains:
>             const: fsl,imx8qxp-mipi-csi2
>
> is enough to cover both.
>
> > +            const: fsl,imx8qxp-mipi-csi2
> >      then:
> >        properties:
> >          reg:
> >            minItems: 2
> >          resets:
> >            maxItems: 1
> > -    else:
> > +        clocks:
> > +          maxItems: 3
> > +        clock-names:
> > +          maxItems: 3
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8mq-mipi-csi2
> > +    then:
> >        properties:
> >          reg:
> >            maxItems: 1
> >          resets:
> >            minItems: 3
> > +        clocks:
> > +          maxItems: 3
> > +        clock-names:
> > +          maxItems: 3
> >        required:
> >          - fsl,mipi-phy-gpr
> >
>
> --
> Regards,
>
> Laurent Pinchart

