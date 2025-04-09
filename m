Return-Path: <linux-media+bounces-29809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACDA833A8
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 23:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6838A3545
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 21:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41A02163B2;
	Wed,  9 Apr 2025 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MZDRpsS3"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A331E7C1C;
	Wed,  9 Apr 2025 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235450; cv=fail; b=OneiaG07uvu0QEQYvFMkfnXsoRbARVUoxNe5dVZO7sE0w8HnbVJSudWbhSbhAmKIM3aPoWlqmxGeSk9SjYiQrmJGV7ZyCqRxz2YJNEPpVku7ippORAwWg5dk/XtDIKijHdQ4OcAMYfNrU2aduGCySnyrIGDMlORCileG6HCvmo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235450; c=relaxed/simple;
	bh=2wvQP9dhYJmAmdDwx3nOqzYnTGWkykAf07fICAlPJS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vxt1fcggHrdvuN3zVk1hR4dOr4tmekdtkJa2fXBXllLXbL8WY5XmirHGDjmzU6SjUZ8dfXkN61Q4t56c96+ctzd3LpAKIwXmFtcc/2PKobjLXYOz3cM1Bk+8eSM1Cg4y0ujIR/0q6p9zHHDp7nzkeeG2y5I9xJxSaSR7MfYFXuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MZDRpsS3; arc=fail smtp.client-ip=40.107.105.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPkceb0ZUMJcwr0RbfSyhIUB617IRms5b9NEsKEm5xsNHozG33pk8uBMyQNp7EkFiHT8vdPOR9M682ZXveIgnJK0CoHrCTzT258tSu3/TU1/DZYQ9Foukb1P/82uS+oluWTwW8CPPXsHPRSzfGoRR8Erc0VvT6OtPhlGyG38l3mc8n0D++ETZZFLMgZXuw+GXgJwTezWsZO0u12W8YWCZwoZ6oTziaasn4i9cG8HuL91ZLAIFbzVpzewcynSHuPKHiDm9D0BlON8cjqIIhaow99oM0JMTSZzNnA3RAj6fRadLOxhIQPhvtjRLH5CGGw+Q1rmhA9b2edFo8SwwTzaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE7Ejlxf8q0J/BZ5z6iQWNyuDuJ9jQ6ZfZCC5puf/AI=;
 b=g1IywOUdxgpyeWEsXczXfttGSEhE+FPQzfecjK076gD6WXKCM0eddCI+8tPjZudcdylvGI7mx7VME5VDA4rj2lx1EZg/ke01ySs9Ttv41tWMHvBB6h5w4ksBoJwFpz7ofYqI+BHBFkVW9jv+JyYp4nWEjbK/e2cXxrkp7GQSinV1z09SsyAMXf0y6PFoBhph2+CW2F6jbqrHILCRhisZkFQTxjyZeB4MnKKJRUV/fvKOx86YF8PT0tgbUlE8QWfNRaH3+W9yG5l3yBrkkkszN7NgDOuUDDZW8mIXBepbyWyPVKpUryXtmc8x4b7hbloO2d0bu27E0HGJC1dZn+eC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE7Ejlxf8q0J/BZ5z6iQWNyuDuJ9jQ6ZfZCC5puf/AI=;
 b=MZDRpsS3swEK6Ck2IygUq8yWvGjx7HA/ZVMnpPjM87zInrJUCfTA+79GHnWZwmB0NmchoPNlYRdsJznzbuLh8hDmyhw5xY1FJSD4UEhmd2vA/C3ID21Px2xG53bc8zusfrvblphR63douWH+6ixOgx38cqM01VGOYf1ZuGJIt9O7yCFrTzpMWdPGbPbOSSVOtXnza4QB7zSuVrxhPDUpSjDTe5ax8SZ3tK6ZfBfuCPalOtQ+cP31zRkmN6JItc6jRTzCZ/3nj/jq1MSYARAK+J4i2aczBJEMXXQGBejueH/PQdsnNhGcBhjsHfrkv9WWg5Duun/fv1iM3nk/IjpiLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10984.eurprd04.prod.outlook.com (2603:10a6:10:586::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 21:50:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 21:50:44 +0000
Date: Wed, 9 Apr 2025 17:50:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
Message-ID: <Z/brrZN4lYDP2Djh@lizhi-Precision-Tower-5810>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
 <20250408025725.1244-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408025725.1244-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10984:EE_
X-MS-Office365-Filtering-Correlation-Id: d1994546-08f1-430f-48d6-08dd77b0942f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pVKj8XtQI0/+sN8m3g08or2fQpZ6JpkV93KHDInOfTInTdi0hLv+s/58jcgZ?=
 =?us-ascii?Q?U80qmcalkeMRmttuwhhrS17tEYTdN/3sX3AU/Ycmi+AuZ4Vwldjzw874eYtT?=
 =?us-ascii?Q?kpWiXnClBDJ+rY398jh4accwqZy5ScKPSPy3gCVVSkYEV9Sqg0fnlNiiZkGj?=
 =?us-ascii?Q?6ftwR22rhHdMv4eyf7PjRD1T84TTUxfALTDbFqbyAaVgyohDaC4UEi+B5vlZ?=
 =?us-ascii?Q?3omflteh5L7mU+Jx0/PCWUgwN1LIZ7Aj1GUpn+8GqfZ7xxoG4sCq8Tri1P5C?=
 =?us-ascii?Q?S4ONoCVJrouq2mUmQky+cJPIKRchpp2em1S3SCYWL+eAwVvX6yGa+o1AEDiF?=
 =?us-ascii?Q?iOCuSedruaLCMQQIJEKvy3dr9yg3Hw+TOtM4PvciFJ3J5CIC40VhSCnDV6PG?=
 =?us-ascii?Q?rMAHkQtPDN026VOHFzFmdAnnPiv+3UN09PLzcUnparbmuzdQ78pKwmEHC1K/?=
 =?us-ascii?Q?n0b1REUGPZ/R7hvFbm1tdn5IB53+Bh6UV8uMzKHcY6IUHmbgXnwkhHUig69t?=
 =?us-ascii?Q?YIvpijAihexO58MMYBdrFvHx31wcYhaxFgTJGQ0beW1KTZc8eg6SuZ0wiDso?=
 =?us-ascii?Q?9xzg5SjTXWX4Cd80/JQXAcCLAGGA8KkTOIqt7rAs1se0AmNG7kyeHwDGI+Is?=
 =?us-ascii?Q?ojJTRhXTAMwapMBZWRgvK73hX/yEzyW2zyLPme/oGzI68lPdgD0daYvMFlTH?=
 =?us-ascii?Q?2nKJOg/IVdBUyaXkKCEIOeUuUntF68a8R+F968SW43rrRd4E0NKYLktqYbGE?=
 =?us-ascii?Q?2e+/fxFNFc6xLDhmNcRCxVXSExf53JUumFJRj2lGTMpKvehNGKUDCM3zZlrd?=
 =?us-ascii?Q?IxEw3H0I2EOEPistKnmO92WyMzcTmjV+OlfqdXe4XgN2U7LCQeXeyFTy1yJA?=
 =?us-ascii?Q?zH5bLdROWRni9X28d/PO04cRKXgSnpR1LHhbya1MimCLZ8Iv6JGSjPdYBjh9?=
 =?us-ascii?Q?rwLyZ2eTPNesElKOq+QIR/hpWOBMY5h3msPOhUKipAaRQPsnuzX/+so8AySn?=
 =?us-ascii?Q?ByRgYCHISlme4GVwG2w4uOQpCzWd2nxs6hgqpFO1LJNqOX44sICRSw7f5F47?=
 =?us-ascii?Q?iNh2hDJ6zsZbyj4R/dSS1I+JeaShEH9z+U30jCMOp9leE+Hw9A4dJ/q47P9K?=
 =?us-ascii?Q?NONf/jURTCD5mixQHSzz7DovFlhOCUjj6E5bcGVmVqDBH7NUJ+J53o/33xkb?=
 =?us-ascii?Q?ssyoWLbhboMLjXuUec4UhNd3teL+EUPk2oB+S+Bbxqj+XKUT+TBU/fEbA22P?=
 =?us-ascii?Q?pN4mWDOrD4o3KnPtGmR4yFv5sPJhY5nniE29ObJdgQam0IhB+BsP/583f1eG?=
 =?us-ascii?Q?oHdJvwHaMX8B/ixob/5YPKmM/6p8Nnz+cRlfU59GDPjN2RVCGHMHq+5UpO9t?=
 =?us-ascii?Q?zSDC38IgK5i3e17g6XouLY70IC07w1bdR7HXY96QBuzqx98onUX0LfskkrHv?=
 =?us-ascii?Q?YBJINsAd4zz20/pmDcm5ER/Fxwr8QYh5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KGZ2UaBNy1zGL4wTmMTix26VJFZdKpc3ObWqHXvR4Lj5YvNs66Z2Oco9blDi?=
 =?us-ascii?Q?Hck9XpyxsAd+OQ4f3oerJ8+AxB0W6GYBlCU/eyo/xItPgWZZBid8XGLrkHgn?=
 =?us-ascii?Q?oM06v6g1/VUBpPCijxoSxfAcQYSnx2gu97kyIHoPxL2yUXohMbv+tqDzvKE7?=
 =?us-ascii?Q?Si25xXj7IZwvGmyoYC5AirnayxhfAz7NSjbfaA85MWhrzYnjNVs7wXT4Y1Ik?=
 =?us-ascii?Q?n4PNMvxJngiwxbEocW9Hk8Q00HMcisZTLZG7Dv8bDhrFAJydi//eM5ZDxKtT?=
 =?us-ascii?Q?QfhljrM7pJnEIa08WH+xmbhchDArSqb5FXgQG3KA+tqjJByEaeVmA+EJZ2KG?=
 =?us-ascii?Q?hf0GurZEOND7SFQF9hfOy6q47JbkwjzZslZrFfu4KNV435Iyq9wh585GI2Wv?=
 =?us-ascii?Q?xr7+U+bca9Ic+dTxvwpNuO1uo1+Z5TEG8NKKvYxzIVFia92JV/GaOrbRFF5d?=
 =?us-ascii?Q?XW0pnNSeYXbILzv7bEcV1NkoxRlmhufqRyPJH/hpxYXsGiIQRGcZGTwWjAJJ?=
 =?us-ascii?Q?SRwjWcbMCrmKwvG+cMhXrtnOw7xqNbhwTbbwKPWxkUV/W+rFKuXdaxxkUzEc?=
 =?us-ascii?Q?y4+Of/jGMyLWAcJr6ZPOJivC88ipMPI1HeCkxD7/gErqpq23ZTXT9sVWGLUE?=
 =?us-ascii?Q?7jsFE1Rx3uuQaMf64h3s7x3HxahsxZbNe9Ppi3/rpU9KDuM082dcVdRj/GEH?=
 =?us-ascii?Q?G9vAd08CtB1SNLEsvj8OKPgMOkzvbZwqrJNJvtwN51qryMt8aQcOZYqgJXE2?=
 =?us-ascii?Q?2JE95mK612sJ/YGOPfKPxYILMV5p176xittzA8YvjOXUQxhsvimMUBvE4aue?=
 =?us-ascii?Q?M5LgpVdtyymPovuP01wq4FSpqdpi/gOPT3JWRRg1+gJYs54BSHGVtNfReWfB?=
 =?us-ascii?Q?pnRltIRO2ZaGi1G4Y0ytPUv25/Mr5x64Ss+HA9+R723b6rtQ9SP7jQj18c2R?=
 =?us-ascii?Q?f1S3SgyTHFbBS7MQalSTPI7aZoaCS80f28OntWXiMP/GIGr1Z+rDx7+vZdpB?=
 =?us-ascii?Q?BL2rPv/9cKXOaJrYmg6Lm6SrDycLKPdfzqJIt/GlDE+VGh25Eb9v5Edz9PL0?=
 =?us-ascii?Q?38MNteCh7b5DYYucT53nYGEPfhIFTF39pCmT0RUj/bGZVY1Bzm8j361ZxRer?=
 =?us-ascii?Q?BDSvKKn+dBrTpjpRaWIC22/+Kz5MNIoIXOhHQ4GhbYUPA/o3ER582LoQCLfQ?=
 =?us-ascii?Q?08cRETTaR1hQtsuaPjpwVC7LaGqlnYj9GTCPEYM4VMEd7nLvuG325fxY6sIm?=
 =?us-ascii?Q?55Xyhssh3eI6o5v4w2glNcgu+Uq33sqS+8JX7WuAMbiJtdjcb+PLKc/t3Cri?=
 =?us-ascii?Q?9fW7SFdaqvg/TYHRakq4TFnaTlnIFPcqIloT44pEvQPmwqD8bgsAVt1Pt/vm?=
 =?us-ascii?Q?hErK6o875lFT+CvG8fyxvh9/Ue05hLj10n7Fx/BHNA3HnH3z45kNzuWhloBd?=
 =?us-ascii?Q?xj12QiIrDJL92iYb2SzmxW1P9Fd/APfvzrvm7TyE/cfJCkWP8RUtexRGXyuW?=
 =?us-ascii?Q?h+/irdneoIBtjYBK/f7f4p65zyQ8dHGx235i0GtYbldTRZ2BjaR83c4sIuSZ?=
 =?us-ascii?Q?Ld2IxKeEdq6+b4TVALk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1994546-08f1-430f-48d6-08dd77b0942f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:50:44.2666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT+WuPXMhgW4OmjnfqBtdtAmRU5X3pgt1BVRgsq1cvFt03gZiGqU4r8Ixa80RANt/+puTolfHAoJh2f9o9tH7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10984

On Tue, Apr 08, 2025 at 10:57:17AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Move function mxc_jpeg_free_slot_data() ahead of
> mxc_jpeg_alloc_slot_data(). Then when allocation fails,
> can call it to clean up erros accordingly.

Move mxc_jpeg_free_slot_data() ahead of mxc_jpeg_alloc_slot_data(). Allow
cleanup on allocation failure by calling mxc_jpeg_free_slot_data().

No function change.

>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v3
> - Split the moving of code into a separate patch
>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 46 +++++++++++--------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc = NULL;
> +	jpeg->slot_data.desc_handle = 0;

Here is additional change. If this patch just move function, need keep
the exact the same as original part.

Frank

> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  	return false;
>  }
>
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
>  					       struct vb2_v4l2_buffer *src_buf,
>  					       struct vb2_v4l2_buffer *dst_buf)
> --
> 2.43.0-rc1
>

