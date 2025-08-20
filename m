Return-Path: <linux-media+bounces-40434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805DB2DF93
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E7363BD85B
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A50274FD1;
	Wed, 20 Aug 2025 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k/WiAYWk"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D7275B12;
	Wed, 20 Aug 2025 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700490; cv=fail; b=d47CFo/886MGOxKwbj61l/HRieZbQ6gpkj51bGORTO03+VuSZnfVPqihEBVhbwTnucux0Sl8++5CE8Y73viFMuFOENlEqJMfubJdi/8U5XqXw8aMytIwH/JWSKv7jsYYpk9k4L9cz0yGe0nXxfTqYPqpDRFlIXVN2A5WRl1EPaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700490; c=relaxed/simple;
	bh=tNHd+tad5/MwsA5+x4Q8KZdloTguXJCMudnkWqfmWZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p5cBN4BFGh+5BdlRIz0T+trsMmO9yH5sHE+mQpw4g9Z8A1HephdI3/S1KXLavb9CBQupSnWi8DqBvp7V55EpwXPUbvF7W1fzmeAphyUb0Y5ZdVyX6WTTFUqKSRdx+csFIx+0/OEy9TkizsMzroupJb0hlPdP9Ow2sOOvj/h/6a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k/WiAYWk; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NN/uqIODujKQ7UhTUwdyivW6ungAbwVneztqjQAb81MMJOf6faUPQ1b1negkHWP9yNRNYaJXpjyeyCUxhdTExZ9xcIbrk4zosFOSsucat3dkUInzrYsWjcXakjPCqFuG+eCBsnzrPKpQJIi3p4fXtNkiyXcVxd+AtIsxR2dduBXn8Y19kGxQ05eY0WjSvM587+Dmhwzfk0aMa4YY0We+y4s7zSLAHMCnuAd+P050N8h92L7GxjeNVdasghFsSdJvA90ooUxaKDxO8BrMUn0sBF8820oZ8lw9aJGgKrYtzWmhCHYahb2ApMopgaQ6z6PvzebLIwe+HsYz3+rGBdXnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I236mTWTEDtnrlPK9cLFswIlx11OaazM6bXNlgtVm6U=;
 b=dbXj8vlhSPi30tBHV8b8uXhmq7hmXeoHaPN9PfREyDOHmCVSC15JymYhVUpcqbP18CjSw6zIKzKVvVW6G/o02d+gVIMlmoA2beCo/4TqwZs63nHVb3nIwNkoGlo2hqDAKXN7yGdT/TGwf+UH/zsGFp7JJuRzr9D2wq6EvUkZLC/A+ztRCDi97FPMkZfddHVU7rjy0ONfn0lnvHuUS/4SW1dOBjyekh4aGWdvAlkBI1JSPCl3Iq73htpIAQR27wRP/o3fiTjXlvJzi/h+iWHhxiJ0OhL/JYXGxXOEjFqmmk3c6l8ewe/A5+zXUYcdhrsr5sWnIBtZiu1nW44u/+RYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I236mTWTEDtnrlPK9cLFswIlx11OaazM6bXNlgtVm6U=;
 b=k/WiAYWkJnieZorx3Bp89R+n9gRhA4uvcWYHIfgUNeSIWsHsVBAZWHP4nfNQrofMWO/FDOSUxWnTy5Y7z6ZOzk7KsdFeU3iL3VKk42ovPLtmhUtpxA4v2KBOxw65nKkOPCwBKmrQ5h4jPfb2afU5fSXMRvZnuO+NIoxj2lGQpMBjneEJm0b6ZW9ESyY0uvWGhHL7Zw3ogDKfhSnv9hzbdOMqYcs4V1ob1lxyUwr5usVecwCxaedjYdKSFhvggZvcMbS35YB8JRl3gIgggwP4nb5xdDn6iaDJuHfL2Y4CkJ9ojlQ9gGVvvVrOeSHlVQTQ60ZzHD5C82J6L8TDS4Vnrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:34:46 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:34:46 +0000
Date: Wed, 20 Aug 2025 10:34:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Add RGB format support
Message-ID: <aKXc/ZNIFZ+nUqjD@lizhi-Precision-Tower-5810>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
X-ClientProxiedBy: BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4e239e-2316-42f0-80b7-08dddff6b554
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BlpWNdwAk8E3y1TbLdl6TJ9imTVwzM00n++TeogvmRa5rMd/U1XgP4h9rd43?=
 =?us-ascii?Q?9Ce7pV3OiZ42PE5S8HAg5Qj7W5pVc243vuGoT4D0Y7ZgCqN3k7Yup4ntqrLg?=
 =?us-ascii?Q?6VsQ0z5N4UClZlr4pXUxn/Wf0BmdB4njC9G+4bpOyLq2gqyfywd2/bt+yrCZ?=
 =?us-ascii?Q?p8R0VZaDdSthY0cmOIx/VZyYKuNDoEH/3vjfcP1dDD5WO1KsMWKnb97b6bGG?=
 =?us-ascii?Q?FuQCcDBPBmouQM7M7LMZAasnoF8cEftHtlV2iamUkyGWbYPQq5kwx8V7pt8o?=
 =?us-ascii?Q?4xR0LbinR2zHRIZS6ixwwuoGDk+cdvbfVTM2TdOraQ94Ya9CdnPwT6GE+Bkj?=
 =?us-ascii?Q?aqWB/g+NkCT7QBHReGXJZZYIsXsmsQwEuW4G6UgwOHKjLBKP4Q//4CP5OMiq?=
 =?us-ascii?Q?jiJ0ghZ+4HXdf5HNjUbbFeIHH9dsCGW7aiyrK5CPHycZqY9B/fqfGbB1sZ0q?=
 =?us-ascii?Q?Z7RTMomj9JbPUCqpZkMw8URxvPDIgm8g0yp7lTv5ICBqzRmjrSi9YtqjmFBG?=
 =?us-ascii?Q?L+/d67etMM9yukY+dDTrSJO9JRbv7SJuUl5n/tzDh7uRKsuTOeJo+DOj6tFM?=
 =?us-ascii?Q?Z6oWhM6Anx32Qy+ibd2w/oXyByxhlRknxQtn+UTCJYbCusaS+XWv5oTC5OV1?=
 =?us-ascii?Q?Nc6hIQ5JwrI/V/BtbNriuX8fFc0ewLSEGh0w5k9d/144DcWsJelbRC3UooAW?=
 =?us-ascii?Q?Dfg9RDnfVPrkrk1a1s7zljTWh/oP0LOg9kNg/oqH9u1Eph5C2hJ4pKqxConN?=
 =?us-ascii?Q?DkbAVGdSWk4dbMQxUKGq8Zvl3k6+V4bigFdq/DvbHnrkbo6qDqUq0xmhrRQ1?=
 =?us-ascii?Q?SkQ9A8hSmjHiShacxx9qwTUZuZoVgHD8b/rOWHNfUXTOjQzN/AtUhvNSgB6/?=
 =?us-ascii?Q?yje4zs37hMdKnCyjXc3U0j81xZ/DcyAp5iGmabeLn7w2MIj+wzoE3un0dTJb?=
 =?us-ascii?Q?ZvuWVK9Guh5GMe8P/Emezgmb5o/HeyN7eW3cFAuL65yxui6PlZ120CF64jYI?=
 =?us-ascii?Q?2o7RK5s3hk/P/L6W4odgWPi7BCr9+JE3cT+aFjvsFtNnR/6YuszcI+5ZdZl1?=
 =?us-ascii?Q?9R0SpIyK1mj//2TZ2+UTiLnI6bXO041l5/4ja6bIlFW5V/Nd3XnkTo4ydqEm?=
 =?us-ascii?Q?hHf7qZZ86KigLRnwP2vVBc4QUstdcDTdEW31w2khNiZtAirI6jQ777geV18g?=
 =?us-ascii?Q?2coaXrwAKBqvbTxhvX4fy1yFlcxjcgAQ5vXMX4YRLeP4dBv5lLW1s4OXAiPe?=
 =?us-ascii?Q?P9VMVcCpVJzT0Ab8LeG4efaURO6ltXsDXGjfaGEz67fAcrAH2JfcjxQXw11K?=
 =?us-ascii?Q?yAgVD8fPu/JHePW39A46iiR9xQEgzQAl7dvZwM9hAC4BbSilKnLs68hQq4wA?=
 =?us-ascii?Q?KKWB/7oOm5t6GY2t2dtfwycJ4BXJPLU/GlvQmefg0T9sE6uj5KJY6kVDHcMd?=
 =?us-ascii?Q?KlLeeL1Ac5gmVkMPXqg3PMxo19/P0ziyBdaDjCgH6cHwu9wwW7x3vQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?V/dW3uEvQ70QyYW0mpIpEYo1jNyoX+ui8lOh2NFJlhpPcQEnZAYHdWWyYJQb?=
 =?us-ascii?Q?9sbsxKYJ2Tr0541bmoTWq+4Udva97BaBJOPS1QREvxUPRZWpSr/W1PPFWxot?=
 =?us-ascii?Q?YeiEBUxhRBjC82FMoQ2Wf3OjRpFLKte6g03QgfaXwFjs7XjHz1YLvUzl9cgp?=
 =?us-ascii?Q?Z4clA4pGmvv+re1L1WMP13QSOzyRqbv1cNlaKX6h88N5Tt9oifIP3L0xns/z?=
 =?us-ascii?Q?Epmm0+fyA4261CUDPAiHeejadWvXyBNKqUkof9OzeqWAy1CrlZJEUed8oC7C?=
 =?us-ascii?Q?+FjBPL2TrGqUBt5VwyJTQB1Tft7m9tQgslTscASdgAQxP2O7qhY7VD2JwT4/?=
 =?us-ascii?Q?GmTSBcJeUcoI6JPRi9gv+OfBJTuaMVY5jtfEobVrSzJ6u+0RO5kHbLgC4pGH?=
 =?us-ascii?Q?sKvYI3iv8mttOJAKPI4zJalFW/sLSds32xGN5RjH7p/pxTJWU8FYjTXyWUfl?=
 =?us-ascii?Q?FomQjdDikK7y00HZuvowEhG2eQsNmnznVqyPyrRK7XJj6urmXD85oAuQn8vo?=
 =?us-ascii?Q?P8ErEOBpX1IIWUKXKbUTmIiIKdgmQGFPJPfG1zXyvPufR0BQpaOkgF4JkDVh?=
 =?us-ascii?Q?XmnoFUKWRW4Hqb1E9OfI+Lns9GmBN5EHieRWKFsuTj0odic9jjtTodd9W7rp?=
 =?us-ascii?Q?3pfwnc0Kq0MRjZYsSanGZsslNbCcPEJg6WJJKyspf6WsFuNRCCYyzn7mjqJR?=
 =?us-ascii?Q?/vnRKPDRbViCILOlVeA3HqwilEsM09Ir6YwuVqwV/SguXr4VFnI65RJUxAhf?=
 =?us-ascii?Q?acojC0Go89f+yS2XMD9bEcs0Ag4xmlbkiX7Cv1bAzR1r5Vigz8QCWHOg19HH?=
 =?us-ascii?Q?7riLawiVcCXjKe+DhDy7fdE6McOSN2p5QpU3IVaZp46OGxu8eLyLHKdxbBMX?=
 =?us-ascii?Q?p0toXBaVc58R3WbjDX/NMCW7MaG/1ugGPypooATr5zJcp9C09UjTRpvxxvlo?=
 =?us-ascii?Q?PWjDuOQZf+5wDzWlXow5z92RhXmdIycUL6lMcNKm1TCI46qjVDBc+tsaZk3i?=
 =?us-ascii?Q?872NjO3wV/NXgW598QB2FL653d0jADCnf3zoXRUX7murhx7RvMzWq7c9S7jq?=
 =?us-ascii?Q?Rmlj5hxlxfZ82Nh2byLQ2a9CNnrJfGiwE0ktDQcf4BxuaHrgUQSM+tyAmzu+?=
 =?us-ascii?Q?W+c3OYgPtMieO6jUxOPvc6CakHQ0K+NBhXTGLJS0E0gtYwl0d4e0ibbt6dZo?=
 =?us-ascii?Q?LMXyxCCI5RXf3qLOL0yTN+49uTMGAv0R9FfX9QPLvjh4yA2hCVZcvo5Wshqo?=
 =?us-ascii?Q?1QY/Nii98SejL+fj19I76QdX2c4uhp3wnkF06l/GtayVUIclNZBb8Uv/F2Y/?=
 =?us-ascii?Q?gylKWxb/iDZp3pzglsqXzYXinfMS4oRguspofQhKGDm5I6bX7MMtSVZJ4blm?=
 =?us-ascii?Q?jdPltY0VFPbGgMvKC2ldoOPXCGz/tQGnYrj7UDODnXUWDFpEU4Hs0rutQB79?=
 =?us-ascii?Q?nI+buJ+oRaRrmeJDzInGtSqA5KLVrKqkkxKk6bnxFkPdYKxKh1zHmFwZaIQH?=
 =?us-ascii?Q?+DWJ5HG0Gjajs5zhX6wnUPlyiFo5fnMQt5nsONwN4adxD5KczkxUX8FAQZbQ?=
 =?us-ascii?Q?7T5lMaNWj+oWiksMBii/D5k3/hMZFT5o2wOcOtUc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4e239e-2316-42f0-80b7-08dddff6b554
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:34:45.5346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enDfp2hZJApNn+Vldlozt3qvtRaD72lepnRc78fwtGCsAhrvPeq4E77RluqmFcViBBN0jSRRbK7YNr0OzboOkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

On Wed, Aug 20, 2025 at 07:04:58PM +0800, Guoniu Zhou wrote:
> Add format RGB565 and RGB24 support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index ad7adc677e389e0f35b0cf63195279e197907f8c..529928b94a193e02177f8773a0e68375b59b0a08 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -306,6 +306,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	}, {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB565_1X16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.output = MEDIA_BUS_FMT_RGB888_1X24,

Just curious, why csi2 change BGR to RGB

Frank
> +	},
>  };
>
>  static const struct csi2_pix_format *find_csi2_format(u32 code)
>
> --
> 2.34.1
>

