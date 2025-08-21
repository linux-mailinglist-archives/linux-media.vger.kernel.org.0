Return-Path: <linux-media+bounces-40634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62FB2FEC7
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38CFDAE6DD3
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1CD29BDB8;
	Thu, 21 Aug 2025 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GpZLqCj5"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4D28504C;
	Thu, 21 Aug 2025 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790236; cv=fail; b=t3/rhqVTwOG35ieOHRf568O9f4VEwJm2l68XkcCWD4fgkMnFfTlmCjmzUdvClNDeTvF2RBDX5oE8lvnR+2i9oqXy4SwsPupzdw3RGl65NBECIj5VGCRgCKobrqC+KW8lqWi8kwK4pVh5322XejBPLT+Rr4PbIWYuiG+yfdLoUAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790236; c=relaxed/simple;
	bh=pVdNW3o1nAtbWp1cyK+3cMfScawkc/bHEyvFY/Wtn1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eggZ3nhek++QTfDWMbxxKAwOZ1YG0pkzZXlAfb29T01HbfH9KVeyxEt3lO5G7Hf4iIXbqj9RofHePx5z+QfstzxxyV7J16wxAdiXC0GVVEsfrb/mTvaHCVwlgibEgGPphmVR/NVqtF4ajl6MPvsXQQtAZhEunUkfjazkf270kzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GpZLqCj5; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZxUSLe79Ujm8649jjwFakoO1BzEpQ0tg1veaQSStDq8wCKmhH1AKpxyIKj9kPzeY91/HQLiKPDAKBXxaZ9PvGk+CIMlZBT1CQik9hgadv/E9NgxgAr19DiaO+wfQ/x0n3+OFmf6hVysoaypYkRnoPRwKzdKVmmzmubOQJSuKQZbBLku3/l4cmeCX5qu0CH/mTRumbhKZ2Lff/gzqBpcgU8D/K+MpTKI+OKOn3GdhU/0we8VxFY5NRyTqqEOg9h51KNDGSIx8FhlYQd1ACaXH3Z4/Q/1e48DF7OmyypsbIbLn7STcRce1737/essE07q4mfzUsMxP6RODD+cMXG2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQxRWeTGf50iTus69PccPzPGdx9jHgQZhiq+wHQAp4c=;
 b=q+CG1XJAhBfB6YeT55FQqx0KjDWYMtz3+7Lk7OjTNNOLBO2H6x86NPtNW3BqvR7lmYOtmXMaIVYDHX6EJoSlq8yKnM0zTk3Jv+2+DA3i8pef9YZcUGiqRyLPl/iv7Wx1OXQMfcBPAJxrUFqmRNFbGpmmOGAT7o1l30E88v0fRO5VQEWBKGidN7cuO7AfayZg2T66lo6edSCBYPrW3RcPp1KftqxEADJZ6WswuXVyP/lPQgvtdbsNLazpSSSCrqkYxaHJevAe1d3H5L5+VyuhWRfL85BmvyN4ykbuWYcuWLJdWZ+7U21dH3BWZBd3fuVfuEtiRnA4bLKDJL8XQo9CYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQxRWeTGf50iTus69PccPzPGdx9jHgQZhiq+wHQAp4c=;
 b=GpZLqCj5VqM0qsJyc7oiN2CRQKl5ZvxlgSIvwkupteVEX0DsTu9TJ5vwPIR0EAclZf6ZMjmGzLqJFqL/RDsohMBq0F/6zBEDkFznhcih3GtNOYtZM4CHtvCYNS92QR0ytMoOpqr2FmTuYeHcdp6WIBltB7apA69lAir0tCEMwH8YG3U/rLTKibobu73PyG/h6Azsw5GN6zHFTryAtFN9y7C+mQco0n6gjoVAZNK2MQMutTHQ3ZLzZYtROPgztR0PBkHAVS61WL5AmIPZRturoaIiogd2LDzm9d/ne3FcNqhpjqxIZAwy2WVxLZvtwEFUC2OGJiAvIoNITDphlR62fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB9850.eurprd04.prod.outlook.com (2603:10a6:150:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:30:30 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:30:29 +0000
Date: Thu, 21 Aug 2025 11:30:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/12] media: imx-mipi-csis: Only set clock rate when
 specified in DT
Message-ID: <aKc7jGu1oz89jyrS@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-9-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-9-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: PH7PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:510:174::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB9850:EE_
X-MS-Office365-Filtering-Correlation-Id: 620bd527-9224-42a7-a2d7-08dde0c7a8a6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?6JAoo49JFprtSl0lUPafrKpNI3EoFz3KjDZb5CwX0CQK5LBK4/fOHc7t94xF?=
 =?us-ascii?Q?QzMi0tcwMhdeKP1tvbSm0KeOS5EpscKXhbxRpJWXhjKAnp4Gqwd1DSao3c2T?=
 =?us-ascii?Q?v8CLwdMGIbjQG7hrwLTaxojQOK9ff5Cw8OA0VMWO8v4GOSgmmkXCBEVu0Is0?=
 =?us-ascii?Q?dNJM7KOHKy3E0QpvQDab9t/r1vv6hgc72dD2+1Vbyi0iNPE4xHy02ez/fbfg?=
 =?us-ascii?Q?+8CgGb8SHBQOnQqV7XdJQbcSuJWR2lZDWXvPZ7NMm3MbueOh82Nt4P2kUAOM?=
 =?us-ascii?Q?0D4bej6IiwrEqjGL81xhpdEVYFuhpPmXltDUWUEzOOBVf8w6eq5X389Evahs?=
 =?us-ascii?Q?CfYeXniVK0jNOFtAF36VhJi2UI4a6K3rGNKDl27WnuJAUfDjeq108lGeBF6L?=
 =?us-ascii?Q?NbJr3tm8ouBK3ho+hbtfMDAyDPRckqKBFlcr3Pn2wh399AFWXV8EnJtiAZCa?=
 =?us-ascii?Q?Hh7FJo8p9ztysorVmPJimwCwbR6NkwKX+7zhdluo51wZ7sMlCTYYi/kP7y/p?=
 =?us-ascii?Q?vnhMELJswvDxfThCLGQYilcP9/xlzU6FAH3/609qbyNeDLSU126BFGInNlbz?=
 =?us-ascii?Q?e3xj7lpz/7jAL7UwMQems6IXFMHLBOgflQOce+PvsJCosBcDaNNk+Sht3Hhk?=
 =?us-ascii?Q?e8afCGn/oJ5EiSTIlTiClKOs8mRRRiRwvZQNMndj4eH1E0KnD/2brFsKHa5J?=
 =?us-ascii?Q?W1O4PqGSCCk86hQPZHbN+M+US8DDg2yo49BMjnpiNrgMNjWOMnXSQKyXLrc8?=
 =?us-ascii?Q?LYHO5hIgevGcBzLBJsipQAOe3cBuF0Iw+28ejP36AWAE0+LpJyrFlSMyGze6?=
 =?us-ascii?Q?qav8WfZj+8sApcl3Mim0Ml+FAVS2t2ZLyincts7my3h3M+rIGLuIsV5HyTv6?=
 =?us-ascii?Q?apQUTRqPCojyvtDuWpKvPWsX2u77JHOOWpiGIG1jWaY68ST/EHIh337PqmD/?=
 =?us-ascii?Q?n9LPZxwJYdoiXmF0bXizIOdphp39Cwru33w/gi95JP1wQm8nGEwMWkeccBUQ?=
 =?us-ascii?Q?OZ7sDL1IqJQXgNU8u8GHjsYoydHXK/UtGOukdL5wwmXyiOmNqtL3s+tKCKIY?=
 =?us-ascii?Q?HE9ERilaWOf5vd243rpMOa6L70K6rJPkY15J81Ho+xg16dIPDA0VYxKa6wfI?=
 =?us-ascii?Q?L1JBUAmlEiDVw3R+2ZgI8bANrGL9SMW29fsGDN3FVX0F60E/Je0r8GDO7eRR?=
 =?us-ascii?Q?LMboqrXb8Wszkh86YyAxd59ghtTTfmaXzuHgevpXl9ilzV/xcdgSjaQXwO4g?=
 =?us-ascii?Q?PvHGQ8wxm+hRp6veQWmQYNpFLmn2nQsAvyKiVwlaAwbYhk/kKcQQ8uuYOE2l?=
 =?us-ascii?Q?7y46T7WC57kA60Cb8P9qD3W2nkTJDXSTTwqwqEO55GiU4DDB/+whE6jZaAQM?=
 =?us-ascii?Q?mcC82JwS8TuSBwC+/C4BYKfh5ChE6ZW2hcK+hKcqRK3xfVYuxUjd1W8WgohH?=
 =?us-ascii?Q?c3Xr6JYFIgmnG4dY3AGreAQK7MExw08rKzmKhZxXy2Zyrxhy83uYWQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?e8fr7aTs7+6bT5FmiInH59Rf6X2hOWGt0z3/2BzTrqCO9AG7KBS0/DiXOynr?=
 =?us-ascii?Q?T2FX36VXaGSc/hISPfPHNjNzLGfPSw5CUe+HX2GyfLj8zEffj6CLRebF1b6N?=
 =?us-ascii?Q?wBoGgxs5gf6qx2u+o1WDVS5YTpSqVnMlU+NE6nNy7Y4tUiGM9uNEkdYn2WlF?=
 =?us-ascii?Q?ix0yTbLtRHggSehqScDP1nDpnt4cmkeaZNukFt8X5gWnImOx1bzYbLOcVZiw?=
 =?us-ascii?Q?5wtk7wjZ4PiA48mx/sIx8/+HVZM1tU/RIO8fC9atBZf0kxSzfeCvpOD6eQaa?=
 =?us-ascii?Q?qhil0sNbyX8eq0n8wKlriJjwBQzqldH1xMQ3mG6x3dx1pjZy6FB7odUYwCsG?=
 =?us-ascii?Q?sCpGca0NyyWB4FCwXKCiuL8W5ZyzaQl1Vh6XeTKzJHwhknpkDz4REoc3clL6?=
 =?us-ascii?Q?TWjRKZVoqQEe2ke+lilD0thC0EQ/tIfXn4mEbO3RaVbm2/cGLs/bpxna639d?=
 =?us-ascii?Q?I10EFHNFrGN3flK+ALkx/ioWk89HWbe2O4QiPp1oBqkVSRjZksxjpDMo8lgh?=
 =?us-ascii?Q?WeQ5uu2So6EmLPSVCrEQyn3gLsZB/2F9HZLJIqPcZtIwFMZmannXj+6ukDyc?=
 =?us-ascii?Q?y4Oekf9qg50BTv1ROfEjexxmP1uxz5vaHuQnb2ECUfoIMnnvbC8kfJtOgpUY?=
 =?us-ascii?Q?5vwEruV+sWWVbjUo+wZHhJg8PU+3ysFjhlMc+z036NcL1CM+E20N70krgtBQ?=
 =?us-ascii?Q?mmGj1KSdysbEZS+M1ru6EjgZAVhDYXMLklsqSa1TSnprvS/ZCA/zwjP1ZGq4?=
 =?us-ascii?Q?QS6EaZiIgu3LH8u8DRU1FZxSDOBpze7Gh8Mf2KyQg0mxVkyKEaLx2TxJVxY/?=
 =?us-ascii?Q?epxPwSh6OTVCTnZOfz4elD7g/U4U6TmheKejntvL1UbbQji2U5CfnUhpFO/v?=
 =?us-ascii?Q?5h5hWDjaQzVbcml12LYhqpVQlVgjhqslEtAB8/eoTtlEuiew99UtnLGNBmxi?=
 =?us-ascii?Q?zGCk1N290fRNjJ1/IKcSVuhLsJYMaP9YShNSH7k3YMrgOL2rCcldjWt0M/MB?=
 =?us-ascii?Q?8N+pWwQ+eut4sm9lgOZwZhY//+sxtL0euGJ10eXTfaEcioSmP7LrqjAbdAJ2?=
 =?us-ascii?Q?DpX+OhdvRbMXd+9YeE6nH4Vpk/aE+5q3IHE+/kInD3QtTfHHcE7pwNs0CnCa?=
 =?us-ascii?Q?WLZ3e26OcGo9pT4pWu0/zePNy/QC7ElRPEg1ULhLtj1Kwi83TDMqR9+i/G0H?=
 =?us-ascii?Q?wWGY8vvinhuBEuC5fAbFF99nzoh84iBCRxIZ6MEOoptA7zO5FKJD1fqnyXep?=
 =?us-ascii?Q?ZFxELBeQcDzSHBNKy3ERiMBAT58GKXLftGwg5zyKPgRz6mQAfPdjUpL4HSVw?=
 =?us-ascii?Q?WfFBPSDQD2gcMBBUAY/9YH79tZ59VobC0kKsdtqDtbWbj+/BMvaJBYhwkzLY?=
 =?us-ascii?Q?B/3oryp7Ky1Ncabn/K5NrB162lqvflfa0sjGv09fjiWJR3WjxOM6y1bLec7p?=
 =?us-ascii?Q?ZlaPuxGZtEnzGzDGk3Wge0qtzy1EzbWNGUtIt2BGtgJOmd8oz6EH+gpxKMwh?=
 =?us-ascii?Q?yWjfbjNA9/xeu1Ix5QB5OvPCrexBVl64nGrmbysG9ckbv/zBPAxbh+EnV8lK?=
 =?us-ascii?Q?s97+XkmKXJ/oAIxZ6ZSBro2qCNyRVWBQsvGFPbrs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620bd527-9224-42a7-a2d7-08dde0c7a8a6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:30:29.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp4idjpg8UxFC/c+TfGRPxJVYWb2j89jccrB7AjIn/vDSavMwbWVbJJc2w+2Z/DAwLEKufSYu62NiRm7dsQw3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9850

On Thu, Aug 21, 2025 at 03:09:40AM +0300, Laurent Pinchart wrote:
> The imx-mipi-csis driver sets the rate of the wrap clock to the value
> specified in the device tree's "clock-frequency" property, and defaults
> to 166 MHz otherwise. This is a historical mistake, as clock rate
> selection should have been left to the assigned-clock-rates property.
>
> Honouring the clock-frequency property can't be removed without breaking
> backwards compatibility, and the corresponding code isn't very
> intrusive. The 166 MHz default, on the other hand, prevents
> configuration of the clock rate through assigned-clock-rates, as the
> driver immediately overwrites the rate. This behaviour is confusing and
> has cost debugging time.
>
> There is little value in a 166 MHz default. All mainline device tree
> sources that enable the CSIS specify a clock-frequency explicitly, and
> the default wrap clock configuration on supported platforms is at least
> as high as 166 MHz. Drop the default, and only set the clock rate
> manually when the clock-frequency property is specified.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 23 +++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 67da8326540b..83ba68a20bd1 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -230,8 +230,6 @@
>  #define MIPI_CSIS_PKTDATA_EVEN			0x3000
>  #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
>
> -#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
> -
>  struct mipi_csis_event {
>  	bool debug;
>  	u32 mask;
> @@ -708,12 +706,17 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
>  	if (ret < 0)
>  		return ret;
>
> -	/* Set clock rate */
> -	ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
> -			   csis->clk_frequency);
> -	if (ret < 0)
> -		dev_err(csis->dev, "set rate=%d failed: %d\n",
> -			csis->clk_frequency, ret);
> +	if (csis->clk_frequency) {
> +		/*
> +		 * Set the clock rate. This is deprecated, for backward
> +		 * compatibility with old device trees.
> +		 */
> +		ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
> +				   csis->clk_frequency);
> +		if (ret < 0)
> +			dev_err(csis->dev, "set rate=%d failed: %d\n",
> +				csis->clk_frequency, ret);
> +	}
>
>  	return ret;
>  }
> @@ -1417,9 +1420,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
>  {
>  	struct device_node *node = csis->dev->of_node;
>
> -	if (of_property_read_u32(node, "clock-frequency",
> -				 &csis->clk_frequency))
> -		csis->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
> +	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
>
>  	return 0;
>  }
> --
> Regards,
>
> Laurent Pinchart
>

