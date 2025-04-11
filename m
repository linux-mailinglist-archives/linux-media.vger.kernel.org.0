Return-Path: <linux-media+bounces-30029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52EA860C6
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 16:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB384A4C8E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 14:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EA920D51D;
	Fri, 11 Apr 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h1lJBKFF"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD471F4CB3;
	Fri, 11 Apr 2025 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382226; cv=fail; b=esD9ppDP4KdJSplXsJ/kXA4kR3b/CICy4APHbvRoforXJUOAkDBGOqULr4sbBTllJdoH4g30I0JmX+eh5k6Lv6iMUBmWsR93e+suZHwFvaoeWq5hF9Wasu5jd5+6QzwdU/TSRmChxm2Xh1jfkv4dSEYLmrscK/qylTqzj4uiM2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382226; c=relaxed/simple;
	bh=k82EClH62TQbXkXwzFlUWhb1DKv+9jXj0EPnCUn4tOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W5Edf4jzof6uwJMtN5AdZcA+ADw4/yZTb2r7tMlyghKmCuwx7PkxMofYqg1fAjP7CRKVkfPJpe84q2kZqWJR/QB2rBUWukWY656Rw0EMlXwBPxR/JZ6DW2ay/3siYGCePHh+SMsT0g5PxOm1YGLsHQk4P0cxaaQwyb++Ed8UZIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h1lJBKFF; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBxeD71KfWlQDub8+CqmaeaLdhWww0Clf3iHGNlih6cuilRfgDCg6LIQgVcw10CwVPjvXaX2srTe1jQk92xpKzx82PnXBn/HVgXqXrYXq8l5wIBn0XMw6qE/rMeNAYE1u1AdnoQq3JaiTrMNGqSM/F8opH5EFO4rV9luNHGL1QMAMws0zvLKjBkXgg/USBc5eyjqIPCVUqfG8EJ39DcEdMs6Du7ZZrtCr0YPCX/2zefVuqAbv1BWDyHGgwVTB1DkI24iDuix6R97n+I5HpiEFKBNdOx3i5QwCzhbR9dinbIDc/lKRvie+w7smibXbTmD2tKcrKh9X8DrCc8jbh0L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKC2NWEFRh4Mg74B8DZ+LDLhKYuiWDMJnfj4IpNnt3s=;
 b=k2ZB8HvEbuhmLFv5Uq747PpCl7Kw+S29U9u70kQH9snePi+VbZ/poHgyhYwPFph8QpU/iRgpov6e/s10p8Qd3e0nM8RBT+YnBdifn/lbTe/sw5WEo9TmLMy2s3zrErBQlvWvh1tjUfMFPjitNKnEsMF2GirFkX7hApxpq8LjabABFWHrVsEw3yXXHBou0RbNBEIYt5Uz7ZAZpG8+ADdlGVEh42bAyIY1nwA40GZw62oUs18zFNsMj/OgZkbfr21B/ETOK6syEkxPbN1F34biGr0Sr63clG2a9NbtHXcaI0jQ5tiIRU+qQwRhCfSxubhCV4Cp3xvMS8TkkhKzafINHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKC2NWEFRh4Mg74B8DZ+LDLhKYuiWDMJnfj4IpNnt3s=;
 b=h1lJBKFFMx8the/XkBXYOx/zbY/wONIt0eZpbR50Cdqkv7obhI8KeFgmGLuK1L80c6XBedecsvg2uJZQJcEmmexVOw64zPPTdB/2TpbURSd8wcMGoGmIcSpjStmtomhMk1wqkT1MQe32/2aFpujf4Sr8sOasCm6wHrENWt7m0EG6CIKY6DX7z++4w0yTqV03izJoM89tgjl2Apz3mQB7rudAjf9lzJc161N60lqogJ/KKS10YwqGXvJIv8ZwBDMSSodtler1q49sLFxSS2tVafs+eSVgfpzq3RnqaJURXQ5BWoqjnhEKS1ufpm1s/SANpNFD90xTCpzMQkSxZyUGvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAWPR04MB9987.eurprd04.prod.outlook.com (2603:10a6:102:387::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 14:37:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:37:01 +0000
Date: Fri, 11 Apr 2025 10:36:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
Message-ID: <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
 <20250411074347.809-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411074347.809-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAWPR04MB9987:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edf4791-fa96-4462-b852-08dd790651f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nJUn82gkQpZ8whrMZks4GW0Gc/AK4b1gUMFRASDhwauJqd86nq8yak2OomWl?=
 =?us-ascii?Q?pxJWElRp0y8vuv5d2GMyQ4Mib8HH9MzCRbarELk8InMLmA7QaFB2fNYNekM3?=
 =?us-ascii?Q?mMPbViBbSXrOsBcGrI2DOcmTUa1lC+41AFSqxJDTGzQ1QeyTMmeM+9mfqb8W?=
 =?us-ascii?Q?EQjW3oa5QGeiiuvbNFOKrso+FnKLZS7hbEa69nq1uqxeeaHiLSVhV6FBYJ2Y?=
 =?us-ascii?Q?t5nrlEcHKjXQqUOox6V3vi/AoCLj6znSRw9vZtc5h3+UW0GFKHnfloQRTNuU?=
 =?us-ascii?Q?8GswWg5QiMxPdmkwcx+ki/zoCBgqdpqQbJmANwJNI6t2nYfDIcId9hq/eHH7?=
 =?us-ascii?Q?LKS0U3f6b1Wue06RTGcJHh5DHbyTlGsWe14GP3Cbnszz87cEFMzzNik1jXvQ?=
 =?us-ascii?Q?ja45S/B10qguT5qpH9hFliN1NbcofYJh4iuBc2iwFPqClilIWpMdkf62XUFV?=
 =?us-ascii?Q?Qbhrx+ezxosIC3rfr8PQBOUom2chPmwmVwMXqHamsisYc6aDZ7ABA3+LKcRP?=
 =?us-ascii?Q?V/V+SIQSZjrZDWoD+/sreHpuavn7SpaX+YJoGnoNSH78FBgn35hiMDH4bghX?=
 =?us-ascii?Q?6DWipCpT3Oa7HAsJBmjaTY6S5UT4vMrQ93jotXHGCo9QFZ/j5yf5fGGMytGo?=
 =?us-ascii?Q?zYWk6rpvfNYlXFsuQPYD19uFP8hFNluLRD0lN+JSoOUVJccRAJylYl8CY3nD?=
 =?us-ascii?Q?H7FN4WabaWb4fbslOUAjsPQHQ8yBppFckbYAEY+T64WleOr/RKGNgA8kW1ZD?=
 =?us-ascii?Q?rF+1I7Lnk1UWftHL14+3Pqo7bGWhyVKuoMrMvTykhHjsk4hC3A40o8v2592K?=
 =?us-ascii?Q?8WnuV0gXKpMUbIsUYIE0Y3xRJMBosMoDy7D8wAQ2aqmz3JKIJb476oqbMJSe?=
 =?us-ascii?Q?+YKy3FBGuww2fxLqYO84pywHqfAY8j06J+PnSCQWlE6xrLxm688lc51NU7SJ?=
 =?us-ascii?Q?68gAyKaAD3dBLKlTeHn4BRaKPD4A2jD9IQ7JEw6kcDclbokcKDFO2ARbWuxu?=
 =?us-ascii?Q?n7pX45HAgsr6J5Vs+yG7P5X1pFIjZnpB8P8y5P2tHGsU98o4TrY5Y9gYeiVF?=
 =?us-ascii?Q?BOTRrEtF0+FaGIJrVZhyr3km+XbToOQmSUDRyy8rNQ4LkU15UEgB5/mcNPdA?=
 =?us-ascii?Q?qdIEl00ZDpKdWUSmUzwNT2BI5boa/+vOibNrgEvjUr3JJoM1rE2QUOcoZPZG?=
 =?us-ascii?Q?uTtPQbgH0Vzg8AP12qPd74yJj6Aq6Vm8V57/gkDnusViIwYWCxxTMRJ0OiqC?=
 =?us-ascii?Q?sDslSP5qujIS1vbRjyKfP9oxvCmLFfgpR9iX9Im3pGysv8BJUqpzistaiZGz?=
 =?us-ascii?Q?dG+cJ3CymtEQpRJOZY71S8HYcV4DoPTxJBOwYDPIWjE8HIr+8Ieyk/IBK9sh?=
 =?us-ascii?Q?TH1rAgFRSt1D+xf/cK1O8mhrMzEgPysslr/GKPRc4w3/jYhuhj/qru7F8VvF?=
 =?us-ascii?Q?M5MOHbXbjHQNDPJABBNUHzrSNJC+luv0RRQ7ggiPw341/LtUFforU97VHNX4?=
 =?us-ascii?Q?3vWFd4pDQy8OWTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AFwjJ+cytVlqd+LTbbqCKB6HYaX6MokLTabvMUjPZzmHjQq6F0/A90ZZVXdB?=
 =?us-ascii?Q?G5tvjMqqJFvNoqDTFLnmAQhtLyfqIV6nOJTzVESZeVfJ/p8uFxQON6Xk1K/I?=
 =?us-ascii?Q?pbselAFQeBmvxXWcHOYvvKKaqVogPWHBZoGuXkQKlQ+hZaxLgnzmnW8oSE7T?=
 =?us-ascii?Q?U+S8kkrUse6TlOpdq4q9+PnZ5lKV9eiukdzqaal6/BhuBO8eq3do3mKVspS2?=
 =?us-ascii?Q?tT8hKYmIVGItfyN+lekkfHJMzDEl90c69EYiZfNVP4kJcQZLQ15RMOPi7B7j?=
 =?us-ascii?Q?3gLE6PMtb1VuoWkGgwRuCv5XtFRBsQVCwsz7nHuq0JO08UfgEXnbz5gelgoa?=
 =?us-ascii?Q?Ke4mQYWBz4ylsrNcgoIDE4YCqf6oCMNwbVO4YRXkktbzvy+xZad5BNB478Uk?=
 =?us-ascii?Q?IqUbtNeY/2zk4JgdjFW/ESdPESV0fABM2VybIByages1NRa4UCeONpIBHApW?=
 =?us-ascii?Q?XBYLuoFy4WtL+ZeH95Z6Y5aRrxa3Qyht2O/NTMttQG5B2DV4TQoLUQLsS35X?=
 =?us-ascii?Q?ps4GPjMZItjpLTQmcWLFEq+KqpYGEPC/62vRJHWATEl/oLOdkpuuLw/WEwWc?=
 =?us-ascii?Q?PKzpLa/dZaIJdNIeEYne/GEY4DKQkXmL9ZignAs45beBAbjxVfEI05k9s1tG?=
 =?us-ascii?Q?Kj7ouNeHsobeS6T/NFbhCBMz+OSzhb4H075XE4B/v1yYLw3Gn72fkpFpGVAU?=
 =?us-ascii?Q?Olt+LjLxTEcPFsyvi04vDMh2SG+y2D7eziEgg7jKZSP6JJPmHe5ADb4zhWNM?=
 =?us-ascii?Q?OGZqKJrMbDK6AdIwRf+Y0OFAeIIuc+lPvEGF/FnnUrzno7BxEkUlm3Ei0Y3o?=
 =?us-ascii?Q?89MMG2WM0PC0lXpmx8tg/mQVnMSKanq4kttVtDRYelUAavdcxYxWAO5g78ua?=
 =?us-ascii?Q?vQ6wXOvlv/excz9l1Xrrpz1nWsfxaiLXgS8Own7SHPoDbvr7XofpqVYqyZU0?=
 =?us-ascii?Q?cZ38Dmd9s5b0Bv4sPN1KxQDSycTSeUFQXqiJ3WDVgIaNl5bfQt3Juu5ywnSN?=
 =?us-ascii?Q?t9Cz41L+sEjE1tlncyEocaMaYwocL5lti/ixnzoLjG2nvvej9UkrrwuSkPQF?=
 =?us-ascii?Q?7V3o62mjWBs4JKBRuJsF8/THtsEYw6Ium6hs4cqRfvXntQz/Lu6Zch21jUDq?=
 =?us-ascii?Q?q6sj8nBYH/jq7XpWQK7GegCGAgDdYgHNIYrcXZQclJZZc1nEigEbvkXHpoXe?=
 =?us-ascii?Q?RR4g/xBWigcuM6YqxE5X4CsPlLHEIK/mr6q3fE5KN01Ihjq11LGyTs7XE3jd?=
 =?us-ascii?Q?8/DCuAIoz14wiyUEJMTuS6jrDRfacKv5OZGFQg2OhYcKJgEGi7g5l2uAvHrI?=
 =?us-ascii?Q?mZ2Z1zIeXBuiJQ7uGNpqiDIq8Kde7ZuGSHx+DZtbyDRiUj8ENwSNrZlyF6Lh?=
 =?us-ascii?Q?zAQ1RCZ3FIcnECDea6FuT52C5N6Q2Ea2gRECRe59MnCjOtxQnUXUVHzIyFIq?=
 =?us-ascii?Q?edJHBP5udmyr6yCIFp/GtdLaHAZVAoAqeHl/flExVZgCU9HmvWSqyU76k8a/?=
 =?us-ascii?Q?5eIeYUzOnJBjRXML3b8AEhpmdxJ0KZ7fVEAbcixMw3QBL/eEyHJnePSLLVhj?=
 =?us-ascii?Q?g8YaJo5DAI8IGe5xamUs7CVx7yE5yHNsp9u7/pwl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edf4791-fa96-4462-b852-08dd790651f4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:37:01.2491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKnefvzLrwkMh5fFe0rj9libjqrV45UOwpJY9FtAzhMKqgbIM8R4g51a/L2wxGQtcSjgSxyH4yGHfapU+yShHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9987

On Fri, Apr 11, 2025 at 03:43:40PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
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

You add above two lines, it is not simple move function. Move above two
line change to next patch.

Frank

> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;

The same here.

> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;

The same here.

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

