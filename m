Return-Path: <linux-media+bounces-40299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF9B2C8A7
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 17:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A79415A175F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 15:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6CA28643D;
	Tue, 19 Aug 2025 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="il3bnfCv"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DCC273803;
	Tue, 19 Aug 2025 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755618110; cv=fail; b=VZ5Sz0nEaBYp8qB/I/EX5LQSrX6Eq7SmlwOAnGC5zFVoLo2x5yMIiKiDG3vEsY1qT3yaWyBHxUQ5QU3gMhT7IsxfK21Ak3fWOHfi4/xrSpRHDypI5rvADKVWeLeiqXe/qC2oSG5wdYYAzIYjhi+q0UprAStv0iu9HY8Ns5RLveo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755618110; c=relaxed/simple;
	bh=oOcwbjDgFdUiiz2BGQsSFEVT+BxxSdtAXOtEQqXEGi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WaqhBgEEl+H7mQc78Gy2Xrt9gJ7S4mc6/j8I6t26oxHkSow9YQ7SNfMR/t5RUUXM2FSfpm+OhAQpsRF3duOUdeWhjb4xr7xpneSDT0StykBZerIHr83yXN+m3ELIlIj2vG3eF7O9boRplt2T8caljt2qw8CYseWLsPIvZ2Jzeko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=il3bnfCv; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHF9PsDi+QPKj5ITQpCj9xLCwg1fg7ttnhRmAjeO+arAfgDacKKGG1DfvbWpqY30SLnfvgiiNCSNrDhEWU6am6e8yNB2pRCpEGDjvII5/VsAfHsDXEmAy+/eswSYbwN+H4uGtXRS5yVtWUXU2WjHZht6TypeiDdYlsFkRCk+GPmD/UCE+hCvZAfNJlR2oKAJKwPHFMOxAQB+W2emXS05BmWTxTGvJz+gdqSmkpIVze4stf/ONRONwWq9fX+dkBywnhecVDUsRWTsYp3mL1AHUP60ZV1N/2esKiI/T5zps9iKM2zGMdwwjNSF18uzKcMV30BFbkuLJ1BRbKFSAALakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEF+g0aZanXd+5JWocivgSV6a1ddK/P1ujAPnnOWTDQ=;
 b=uwg6P4ME0zhSGMTEIXreJaVRQdEXNSaLz2XtVhtoizh+aUYV9VdMmUlpBjA9W377ziKlF9reQrIhvdajgUdh6oGT3EPm5jUctZ7PqbzOmfP4jd+iZj6SEJHCuGcMjCQOqxuCMjWbToqotG7bdsP0BVbjAPW7WB2psz7DtsCrXx8q6rVH33YL++JizatVfahoNLo50/S2Pn8y4mptHHzbkwaxGpHufpusm4aMPkFXKAysxBBJi8nTYVgtM54I7EcVWHed1Y8O5y0rLLNdJ4GJUtJdzFP0BiqB0m2A7N9SNxD5N0qnu5HIGRYK7hDCL3tD1WVrI2GgFhqC7QT0nVSP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEF+g0aZanXd+5JWocivgSV6a1ddK/P1ujAPnnOWTDQ=;
 b=il3bnfCvBwT7LlsaJ+n8sPe8Nx4vXmsLiPXwH7Ab47Bfw+uQ6qt3mXb/3oruUs9/DUfKFVUnzXPm+d4tzeMbc16kFnFWcE6N95309ZZx8kmAKUYspTOePKckHgOGY80dV/lNFNSc6RCnbtOeysvggFBKfN/ydrVrJ+lugy2YAujUA7S6kkHlUgRVEYwcG94kw7cwxBaqV5j99SK5ouy0M0xqgK24y8dnU6xEZsdQDLWQtHFVwjWIj4xoU2mGKcuNUvvF+V+O58Kcw6KeEcrY56XXB7d8KKb6pWbVuB27B9Q0Nb9mhwi074Zm65FCQ6wYfXkMIR54AGrK3vfyTVVyIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB11040.eurprd04.prod.outlook.com (2603:10a6:150:206::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 15:41:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 15:41:42 +0000
Date: Tue, 19 Aug 2025 11:41:32 -0400
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
Subject: Re: [PATCH v4 2/4] media: imx8mq-mipi-csi2: Add output filed in
 csi2_pix_format
Message-ID: <aKSbLOdACTwuPZb4@lizhi-Precision-Tower-5810>
References: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
 <20250819-csi2_imx8mq-v4-2-c16b1d8f88a9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-csi2_imx8mq-v4-2-c16b1d8f88a9@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB11040:EE_
X-MS-Office365-Filtering-Correlation-Id: 614fc1bb-505e-40df-b4b6-08dddf36e521
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MTgdyb308aDq0sB3URzpoCFfr7lQjXCM/ZgssqVxgJ6ak0myO0mhvpdPVRpK?=
 =?us-ascii?Q?5UjwzZO2y7q7e3dT793lNYRHilQreqHQNIJnpPIGQu517GP9juGmfVPQ9OTG?=
 =?us-ascii?Q?abEHl1isUSzsYCKdQa+HQ13Do/5ueA9qUtjbsl5TKDdqpVL+bPr1sHnn8hRY?=
 =?us-ascii?Q?AaAaFpkCuGrHD/77guJ36Yl+e9wZBG8GwYu9CyEK3lEiFI9W+7kpnxWb11gC?=
 =?us-ascii?Q?+oJrJn0jvLM//glD1FW+aI+DqisRA97juuJKR4B+2k+Czw5kUf/gF6hf78FI?=
 =?us-ascii?Q?CBeLXa0wUlndqrXZ5LHAOIpHKUXncTgjYXu4ZZYG5FwvKKsJGNzBQoXaYzIl?=
 =?us-ascii?Q?amJ2UJcjemvFztwO8MhohoYV2f029/DOaE/O8HxpnIibK9vy/83lZbZz11lY?=
 =?us-ascii?Q?dWHL3vcDbgEAzFY1Hgsx5X1rhJ30mgYWwmvmd0ZcPfgQfaxt2xK/dMz/Kx0p?=
 =?us-ascii?Q?toWHemhhjt5jACDDWL2omE1jBeGxnNhTX0fDXOBUF+vytB8UTh8wN/8R5f62?=
 =?us-ascii?Q?SuE6ZJCsm+ICk4aTrHNuP73QrKZIgY1aNZGNqfQZVkVM5gi2CW83f8U1K/WW?=
 =?us-ascii?Q?vd6mnmJDCq8Fo6Vk5HKV+l6XYdg3m7/4j+c3Xuv64aQs1/e8mg0s712rFXWj?=
 =?us-ascii?Q?1JYrWTxNr0ZnbsDscoyQQJ/3dBjmAH+K4lGDMR3KWktMT2FyWqvIE6MzfpR0?=
 =?us-ascii?Q?Vx7iPkBomVkhit2DMqgRCoptgJQF5J48/U7jxt2e86DiJ//V9ulPkKR6S1UN?=
 =?us-ascii?Q?fyzZtvgXOUQEgnHRUKHH2VwGkfPnMfjHvDI38aJjH6rHpa5l6WK1G2AEVOLT?=
 =?us-ascii?Q?EgjsGJoH3CsjuaOIop8W2c4PjFMH7nc95AKiag5ExzBn+2/klBqJnTtc01Dy?=
 =?us-ascii?Q?5UGc9ook9ysUeZEDCNlA5RQN0+pYwpjliTov1vdoaFNZ+yl3+mwBly4HUBdH?=
 =?us-ascii?Q?EeEXXK5VtU1W5E/kMZ6eEWyD9SD6uZP/Vw/p6FZfDpEybDl6BDOCPmcHa+ye?=
 =?us-ascii?Q?+GjPzBKKIGGT7bbvmUKtBPWBA1ALM98nK3TCik1hhBVSItWenR218+3PlEVT?=
 =?us-ascii?Q?HYkCj/DIC2a4FC5hTNhZHf23GNIZyap+LFQrBMpegb/KHfdYLRBdXrG7yyOJ?=
 =?us-ascii?Q?GAxPKU0ZpVFcGA7j0QopWd2y/5dGEr1bUQWFLrWehpYw9eJ/n1xWyqhv65WL?=
 =?us-ascii?Q?79uS/3Mnjzf7Zf/6rGZg6R3Mf5kqatvNvIA2L1l5TqPqBG/yECEyzk84jq1Q?=
 =?us-ascii?Q?YpWHA2Jn+NcUnzCkuI65tu89rvq+TiIcCPYeuWaa1gly48WGC5g3YeQKML9e?=
 =?us-ascii?Q?yLlSn5IrMp3Fk1ILLm2LQAVwPnCFG3axjZ7sdzsoz1F9Xeu/IMb1GViSLJaZ?=
 =?us-ascii?Q?sAaTditMUmKGx7FtIn4xYRGJG6X3a4eFQ5QW1itdu59NsKk7SPSjuswP2LZe?=
 =?us-ascii?Q?CzO3+RKQLJ1nr3wKLBnCeS5PCKzms5kx5ydRW+D6nECvqt2/ZOoYTw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3OaDq+qcUldzl2iCD0UupEHOu7G6EF8+JPsicc9CaMKLG7+oELXOGhXjCHAP?=
 =?us-ascii?Q?mZ6ShzVOLYEKL4b3P9sTfTZR1Dlt8P5UapdX4hK4gjICdPMmPFr3AidtGyO0?=
 =?us-ascii?Q?+1umKsW73PNCHQYa6zUWld4tWnvNvp8SOY42IPWbfP1K8uFWFjj98S3Gp1/1?=
 =?us-ascii?Q?UHEbMI10/etw4+uipTsWG7yJUIYkJyEzNsA+a4V9xPuK0ZxiNEQX4X94OSDm?=
 =?us-ascii?Q?qrAT+MWbZD05Mg4qsIX3+m8d7L3C70uvmGt+MpcsTC6h3YHJDPhep/M8tinS?=
 =?us-ascii?Q?YrPI1LP5ls2BjQx8xPjCFenNNnr6cqgnJxEbq/qfm4Npw6I5FDQLByQpUj6m?=
 =?us-ascii?Q?nRq4beHJg0Roml/xuvNMl9oCskBmNuXKnbYyAau93IL/HNlfyZEoMiWqsvBq?=
 =?us-ascii?Q?tRC9B77AZlWGdzMqHdkdmZjvWz8qKFxfh4dwP1wdFzCQEO6JgpzCV6VrIhT4?=
 =?us-ascii?Q?SZWpTSvaXjmEdxHOUcawQMpiZcwWH7kcWZuNSf4OMEQX5rvEazRUl+TyBdxH?=
 =?us-ascii?Q?2vGnVSVkJ/ySAHme45wvuW364VEgvsqxKuuhdjW5QAL02gyLrfIeTIz7WSom?=
 =?us-ascii?Q?ofUBVnNhJ+ZczhnOeocHF7kKWlDpx27cZXQg/AahvATGQjDqY//hjAYtoHXO?=
 =?us-ascii?Q?gP887tvPsdUo4eRr/aDr4OMmMWzGprCJLuuDORkhGZettnDyiDgu4K/hCkSe?=
 =?us-ascii?Q?LU9Wd9z68o+LZTAP8Ry+CZhecHbjaCnR9iPPVPqUOCpmChrZXgXVogQSayNl?=
 =?us-ascii?Q?bgQ+fQ4pFyh1lUzJfijyRD7lHjrPaC1Ilf5Ou1nGsRi/MJX29uPMvGOwqi5K?=
 =?us-ascii?Q?rHFUGI/zYZA5PRJaij1l+0pvZ+qIn5rj2NVM1JH8UGNNRk26pJFgpO2c7jKr?=
 =?us-ascii?Q?7KxjaobBP/RsPHjjXlEB967R7N5ogEpsrQlv/t4106GhGsLaRt/EfUn30i4/?=
 =?us-ascii?Q?zTiRE+2WDdI6w6peLQYH9GqPt/aQcOFARz/C8mIs1CMbqZ+VM0l8ueRqYAWw?=
 =?us-ascii?Q?wNd+MkQpZ9z2KE5R1eCmcQSFR7ulbXcftmw0uox2DsExCSByNP6H8uNLfKT9?=
 =?us-ascii?Q?vLtzKTyhNrqxtVCR8Hy6Lvbm7NdM23dHdjefwm0fJqGtAOt92p6p8jb1lwL/?=
 =?us-ascii?Q?YNDzkvVPkDMXbCHqDmNdngGLYd61xY76JDT6f8ma8Zc1dL5qi7HNIf9P1nJf?=
 =?us-ascii?Q?+fVabRQ8iD1NpDPi0sNvwo50MOar50ca2fYphm7Gm5qrjD1esQZ5jr9RRjFD?=
 =?us-ascii?Q?cnPNJcmD/SHigJ1vEF/t3dZSb6W9iqemds7k05XLK7xPp5Q4LTOSrK+xr4xt?=
 =?us-ascii?Q?5eTp4uYayhheg6iIW96doRiaxG0/bHxFOYRVdLEugWkEv/SuFfH45tdzo1gC?=
 =?us-ascii?Q?Zy8avwfLn1uM1VD1pNlkf2vCjOJb02MFQgiAeSOHmbz62CTpXaYc7pPOaFl5?=
 =?us-ascii?Q?Gh/GJPRSJKEBy+DjTHP6mpVEEBEnguoiP7e36TqVNzj2DoOm1XX8gK9E9z85?=
 =?us-ascii?Q?wmBMpZp+qoHxdKRgK7Sa1B1ioF3eL4Mcwj8PxsHyI3i97XvuKFmfXkdIlOgT?=
 =?us-ascii?Q?kgybOlU+wiTW04P1XcdtFWGQbEvfnDs77bv8389e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614fc1bb-505e-40df-b4b6-08dddf36e521
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:41:42.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soxQcV+rZy6ijL1PzNimI31Rq+DU5KYzqG/0WVOEukDyn2VSon7+N/M/0ifLExNhlDQANllTecEx4zAm2P2+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11040

On Tue, Aug 19, 2025 at 11:58:01AM +0800, Guoniu Zhou wrote:
> Add output filed in csi2_pix_format since the format on the
> source pad might change due to unpacking.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 85700655ecad334c61e9b5f9f073e10b6db2618f..43d766b95eb42b21be893ddfda44119101c9afe3 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -139,6 +139,7 @@ struct csi_state {
>
>  struct csi2_pix_format {
>  	u32 code;
> +	u32 output;
>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -262,48 +263,69 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.output = MEDIA_BUS_FMT_Y8_1X8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.output = MEDIA_BUS_FMT_Y10_1X10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y12_1X12,
> +		.output = MEDIA_BUS_FMT_Y12_1X12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
>  	},
>  	/* YUV formats */
>  	{
>  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.output = MEDIA_BUS_FMT_YUYV8_1X16,
>  	}, {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.output = MEDIA_BUS_FMT_UYVY8_1X16,


All is the same, Can treat 0 as the same as .code to avoid dupicate these
data.

Frank

>  	},
>  };
>
> @@ -634,6 +656,9 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>  	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
>  	*fmt = sdformat->format;
>
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code = csi2_fmt->output;
> +
>  	return 0;
>  }
>
>
> --
> 2.34.1
>

