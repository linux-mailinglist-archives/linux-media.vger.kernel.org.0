Return-Path: <linux-media+bounces-30638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6FDA9559D
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543781664DF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5E51E3DEF;
	Mon, 21 Apr 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Uv6YZ7tS"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA35165F13;
	Mon, 21 Apr 2025 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745258546; cv=fail; b=kwVnuZjgOK+dN5voTSRMAXhAMfBPJ0igVOUYk6LYqNnlmgceIbzRsrdJc1jHRdaMNBtzLXjZ56iIL9NwNDNYq1kjA1s7SqWPpVfbHKbhuluYeo7ImsOQcRudZa3o0upjFgsCSisOwf7O68gUtJlqqsh6TXfCJr4BZW8NA4t3+T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745258546; c=relaxed/simple;
	bh=J2pKqLc4//Hz8dLts87Sp3jqE5ltoJIb++t0PoCF7Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AxZ7NwcpP64dw6EcjObSGSdOnyJ83U2HcubONhn18+7HfBYpWj+bkgxeKjsW3hxW0W7YyaQF+n0vLYg477J9MOFzQbcgi22aunncw32cok44UBBubeFzDXeK8u1QF3c3tWq3QVejnLWfFWEYa0jAtXnP6sJSq/ELICVxMGFXKqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uv6YZ7tS; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE90tW20oyWborKM8eK7L8kh9tDHB3P/kIkLcmWwOCvjxKcxVd2r1Yp6Pn+e9L9Ez1i33NDejdi+bvyEa58HAtewcb097sXcYzmqgbqdcEji14A2X9p5E4sZLKnv5JCu08XeSJcPs6l9ZG9NQYrRUJh7pbg4ttvZXff7zfnt5TPxCeWQoxOn1DR1P2tvxoIBI1MRHbUG7YLNDMqEBfj4pdOWyYeIXBSkfZlCmY1UutMUqHF9ZkDhuF7MKi7629/nuZgvgGLSPtRnAkzBDZ7928YUE0V3O4sBpjEJRe16Di2aJtXDasaL0LW4Z5baEFq41BbQy/vCEmK4hB7JF+i5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN0nQ7TUi+LgMpwCswISAIfhVEbkFl9lSfhnJtDtayg=;
 b=n55LCBgjgmV+TaHgiJjoyILh7+WzOs8rARO7Y0HitZQKwxmHiLyz3czl5dXYdSkAV82aISWjhq2war2XephaivwkhCugJ6FAU05aCFo8d/d568Zy/ewUe4COLKyrWuKeMXpUEf7bxfyRUQkejzwqXYIE3ANKw6S/S74JsyVPQ30a+XiB5bzqqe5uiVCmAkhK+U5s+qH4GkRyybxbi1gjFl7yWVj40K3yrY+DnX9zLywFRMReHZsSaMVNWSniVAI0hkuBzsZiXDvanscRU/ni5fFCPRfnnD78DMFk1Cg+Joau7GxkJhbcMIVh3WcjuFUS+nyf+zELMlJmYUAkFJ38KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN0nQ7TUi+LgMpwCswISAIfhVEbkFl9lSfhnJtDtayg=;
 b=Uv6YZ7tSdqn81HbLSpykeqgcYzFcTRUuCshAfrgNaMg9UZdJZw53KDG6fLW4mTF6vXB4MMn7DISikSnXZwEPDb2HhO5vmZL41Du4mwAluwdHVF0dgyUAh3acMfcsKf8RPVgV12CtsLN3N+VPgYeECtopUi/K9QTaoBiuv+Mrktj+tJ+zT/iIypXNf/oao4VjI598/FheTm3s3lemqTO7s0h7WHgS8BWJjEhfBXSeo9v9flN9poIwrsQ9IARt7ZW5zXs7KHoqrlhwDkRJTQWc/iuQwwtvmN7iLezZp5kdK2z/WQbXdKAGDrR/SYoLS5SIC6sfv7fX6QIG69EnLNkd+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9856.eurprd04.prod.outlook.com (2603:10a6:20b:678::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 18:02:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8655.025; Mon, 21 Apr 2025
 18:02:20 +0000
Date: Mon, 21 Apr 2025 14:02:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/5] media: imx-jpeg: Reset slot data pointers when
 freed
Message-ID: <aAaIJMZ3ZIy6+yVk@lizhi-Precision-Tower-5810>
References: <20250421081301.1304-1-ming.qian@oss.nxp.com>
 <20250421081301.1304-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421081301.1304-3-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: 4686e11c-590d-4d84-599d-08dd80fea8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9KruhsrX0idC9+fABVXpGtbAnUAkZRHf8Fc2HAJBX8uY1G/kG1g2aq26MELL?=
 =?us-ascii?Q?4VhRVsT8O8Kox4hHBKYOw/o/RrQDUHP7OuJaLB9Ny8vWYcGaEt9PWSA2Lb9N?=
 =?us-ascii?Q?ymfljdz1+9OKQM1EhsHnrO4F/+wZA57zag00grCnIuqM/fJqdCR0lCEp2fpS?=
 =?us-ascii?Q?g5F8n+VYCvXQSx59gYL7GiQGabwxA4gTNYZyTcQnxaAN7VaABIb40inbmyj5?=
 =?us-ascii?Q?fVnH3cESegmeilMUbNElDEDKJK45HGjfANHYHzDuDBrzz/lo6Xngdmq8bxNS?=
 =?us-ascii?Q?PHYILXMuObplMxAAZBed2C3IIPJEvOoxfSN+5Vy2wbHYL1E5PmLFBG36zsXm?=
 =?us-ascii?Q?jHoeafkWOOogN3Anbe2CV9/rcnYXTyL2xPeEV3R+OpMyH4LcLyGTMY19tyzI?=
 =?us-ascii?Q?3JHdTAsVweTn8OhJt41qqm2L/5hWwcKDUjexhds8SIM+PrSxjo6KyDI+WFtC?=
 =?us-ascii?Q?iwkFCga0CQr0by4zbB40V7+gUIfuVKRc0iN7VlA3l1AOqaXMqHBGbmny5xj7?=
 =?us-ascii?Q?ZzZmGBycEnN2z/h5n31w7bVorOMTszlLSRd3gGjWi2eUJYt2+L1yJZ7esTz3?=
 =?us-ascii?Q?2As4vT/bH1X8L3xyOLmLGjbrSN0Smgauj7ctPSE+SPvvv51vLvjmUk/JAMU5?=
 =?us-ascii?Q?hCG9DemxCgoitxeI5UYtI/O+XwsW2QJ7r21hFRWJ1DL9UrsxmjIhiJOauO1o?=
 =?us-ascii?Q?ny2wjnfLDp3gqmDnMj94CoAce9oSTGvSBsNAC/85F2lP70+qw1bee+zQhhCJ?=
 =?us-ascii?Q?zTLUjq+4Nf8Ugo0UKyd8HzYuKeu29ycZrZ9JJ5hk8o2yLlJp+aifeDBg5MX2?=
 =?us-ascii?Q?mHH8jAcAY/+4sXcgBS1Qm83b2m/d98jB+ru25+p0NNGsM/roBc9KyXarXrLD?=
 =?us-ascii?Q?czG0y8XXUdUJrWdSkBITQ/JYZ6/P6HJLEns3D7wDQoPpmt47VQ3UOjh684/J?=
 =?us-ascii?Q?fOPMVpV6foldpQIxNeKP7qQp++9paZ2038gP5/t1U07zQCWq2KTjYoSh77nO?=
 =?us-ascii?Q?LWlb4PCQH45a1qQxl5D+G1FsCFa9nV8qeL23sQSLTT9zdxy0hiHQKr4d6vrj?=
 =?us-ascii?Q?6htWBkPw0GcXDz8Td18qiUHtTQrezS44aZSS3oNEoyA9cMzwTFzz5wSToNIY?=
 =?us-ascii?Q?xtCqzA7mKZSJMGsJULuFoZtxPVg7fcRl51uzWtm8V7XaMkkAYuyuAjGOGN13?=
 =?us-ascii?Q?Y+F92PvIkLSsU0deOkU646Zw9Xpe90qUtM3TeVPTBsp/Br0jsLvYJ3dUN9aP?=
 =?us-ascii?Q?7qt6f5SyR9WyfodNWSx41wULxSzWcorvElaYIJv77+HpiKFovK2JmiOKUTxP?=
 =?us-ascii?Q?YgnTcGrS2y4xdvE3Od26L5lmfayn0wOxbmh2r8Xxo0pEEgvJI+h9Qnj+sGhX?=
 =?us-ascii?Q?3QFOz0YBRufJiRAT2UktqnVkfL0Xik/Z+vNvgADe5fpPPFz3WPVQTG31aKw8?=
 =?us-ascii?Q?PpSjBkaZy8vwV1wiZbXkdHfu0LcKgeVI8DYy0bMHnj5qOQ3kc639WA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d7bXlLiWtYdcFSnGo3cU9XtmDBitgkXBpDjgMqrOvyks4Y+dEO+rGJ1mzOZM?=
 =?us-ascii?Q?9lBXCcHNIEUWc+HxMbaI+z9vUA7XN2Wc2U4dAMSJN3MKqaULJgvU0twRFPDJ?=
 =?us-ascii?Q?KX1UInv4vT0YS5kBuncqBOZLnqt8uZggngH4VxxJeZKgaa1oE/8IRf03vl+R?=
 =?us-ascii?Q?gdaKySmVfcGGRMEjZdiwamF85ENRt0O5lEJR7JGeNDk+502GnZ39CmSp2V4m?=
 =?us-ascii?Q?YMlc7aYJJwXc22fSZT0cmrnLT4A/HkjL+jehUFHmiBE2x5bPeaxoy3xt7kKI?=
 =?us-ascii?Q?5go0x54sVJCXDwDRqIQd6VVklnNmGml55aogYjB7m1Sn3grvRyZy0PVWhphY?=
 =?us-ascii?Q?QeiUr3mXdu0tp57WKksy9jHi+0xB84Yt5ssi+LSuKxlmWTvI9KDfhSLSEg1q?=
 =?us-ascii?Q?5jGiUsZHaIzcPiBi89bFR1+mJQHcVBNn8D4hvo+abv3u2LEIGZhypCOixbZ+?=
 =?us-ascii?Q?x3IMzlZzlhxcdnW0WSA0DhCEMzv4V8E9iThW8i/NgcZkfcyDbIkILeg2w8iM?=
 =?us-ascii?Q?JLt+z89C47HiSadJs9aWrDDZOuwElq6LNlWWuPfArKK5JOUC61XNXdvvs4nO?=
 =?us-ascii?Q?tWXxPgUysmcxR/laNhOs+hjfccJNFrAzMjoAZ/VKgxnE8YuWtXNBXy1OCGZQ?=
 =?us-ascii?Q?ohNaUYplpTDtCJs4ubMJx7nehG1VqvgUjs+gIpWGfjYMbG2YoyG289GLjYjS?=
 =?us-ascii?Q?H8xtwnCJo8u8sRGo7Zv/tm83kYIOpp8qA9iMpnRWG+YbrWj14IYFfPBMVnlQ?=
 =?us-ascii?Q?QHZnYkE3dhqrUJipxWOB27xTQTQDty41g6SBP1H3NMkAROPzfWueRmht6BPZ?=
 =?us-ascii?Q?aiW2aj9/JdVdN+Ao2JKHgtn1uWdXrvZjo9krfegn5CA5wGz0uqJY916KJGhD?=
 =?us-ascii?Q?vArNx1/9sEXfI5pRON0mYXXsjRAyDkucvczGIMeuVq8ngnO0owt/Qch2H8a2?=
 =?us-ascii?Q?c0ZjtThPYakTjYohX0ivNeacgWuAG/S7YydshEwp8QpcEbyPoktHqHM0ux66?=
 =?us-ascii?Q?7+VN5ERt7vcwgzU9Ag80nx7hnZAcr1S99DM2Fv+zRvc2DdX3XC2HBx2YG2kl?=
 =?us-ascii?Q?pB+QLkiXTXQO84mGCDSip6z/58WAbUeR+cZMks7/rv5LLX8xLNq/s0sp+QIn?=
 =?us-ascii?Q?kx5E8uodGKA2LRZKMasRxznJjXltnuphG79U6y/QxsBR9xEDj7ADUlLe6AF7?=
 =?us-ascii?Q?Myn3PLmZ7T1q9zhnZHbDhrfnt/FInKHRoJ4Kb5Eyhuuo1osjfsPnKBxL+N9a?=
 =?us-ascii?Q?rPgiseRT19iZmEX9/ZJMxRsTr0Z5QbjJaH8gra6fv+kUB8oTbVOAEz4VlIJj?=
 =?us-ascii?Q?P0Gnc+niJzy7OLUwgIsfQXboNZp6I5FR77S8OiEZkbzfr6rVTps7CTrqp0PO?=
 =?us-ascii?Q?TjZR3o3qUkWo85cRuewaoOZ3aT1zpLby/9K/nuEj6t1T+rBEu5ZCs6xHvKIa?=
 =?us-ascii?Q?Egr56FbAB6mwGFjjTeiO+1eAXi+dn3KYjflzspyd7GxKFwAoAtaESp10Z8lB?=
 =?us-ascii?Q?2UdgN3iniRj4NEEqXUoZSBju6egeNtGnl9ISX3wLGjrwnRpVo8/0ZeacjF1v?=
 =?us-ascii?Q?h0PiXAVkrvsrXHKcoH0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4686e11c-590d-4d84-599d-08dd80fea8fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 18:02:20.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6fAcdrQ2eQGY8BDCpL5J4bPF+n/3y2pbZL/otd8TslacByJNCUGdg3+tGvsRSwvKdKP989LIibnTRMZHjlmrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9856

On Mon, Apr 21, 2025 at 04:12:53PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Ensure that the slot data pointers are reset to NULL and handles are
> set to 0 after freeing the coherent memory. This makes he function
> mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
> called multiple times.
>
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v6
> - Improve commit message
>
> v5
> - Split the resetting pointer when freed to a separate patch
> ---
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index ad2284e87985..29d3d4b08dd1 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>  	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>  			  jpeg->slot_data.desc,
>  			  jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc = NULL;
> +	jpeg->slot_data.desc_handle = 0;
>
>  	/* free descriptor for encoder configuration phase / decoder DHT */
>  	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>  			  jpeg->slot_data.cfg_desc,
>  			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;
>
>  	/* free configuration stream */
>  	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>  			  jpeg->slot_data.cfg_stream_vaddr,
>  			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;
>
>  	jpeg->slot_data.used = false;
>  }
> --
> 2.43.0-rc1
>

