Return-Path: <linux-media+bounces-39446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA263B20D0D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 17:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5714118827CC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7025D558;
	Mon, 11 Aug 2025 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WLrs4znQ"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001843B29E
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924723; cv=fail; b=YkeNa1Gsdo0AKekyu8i8jGS6+C6ES6U0EGyEyjfftKfK562JNrd9+6htLhvGQMVqFikBwntfahKgYAt4G6gdhZEyr2L1u7AyoOEClVkMwQLmsxAjlb3JBp/KAZDe59u5vaxblquaNIflIyrj2sAbVp46tWJ0+0k+ulp6tTThu+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924723; c=relaxed/simple;
	bh=McBuASfyFKVD0d6ccAiKm4pPyQ4wMtwr7ECn+zQLSgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iyhkjQIRvXQhlRJ6WzBG03S+DvEgMdcPmHthMgj1NNjn+nrCH6xzvlw7TeRkSC/HSs4eebCjkxFXSh2vmv2jFmzRAp3yfaXBcSoLYGhZuNIhVzUxgNgtj/8MeUmJMTU0q/sPElk4+SMG9kcKURWasKb67RTica/TeXzMii+2gTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WLrs4znQ; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zx0mTbKGdArxqlBn7x7HSojLWlN48d88HZpyGzPbM50Lq0rscaO52+isMc/OmS2eysc8wJKONOQ0Pv6zKhREi2jD89lXnWIsOpLgda/j3j8kuu9shAsTjuRJy9nLgDfRqkXXgYikiAZD0Ut+2cE/ytmoil+gUraiNThlJhtszU9Mbp6ayQ58DWt7MUeOPX2hofHnS+rYfbTRo6i9INFB9YGQHyh2o2lZgWF8W4F1bXOknb0nPW+JrWNbfO/OJsfY+9d+nSYWoTzlI2A2mYSArBcwckHaVhW3PRBtH6sjHznCY9Y+nD47tpzWriq5XIrvpWaDOSeTh15UF3wT3w+nrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zaPGemztCk4pYfEnrqgfqMSGaZRkYVmUY0DvmRJmqo=;
 b=LKIvxJbnFhDcKA1Ertoe1SKyqwhA5GBOLzQ4WaGQW5W/EtumAejG00inQt78xXVCPvaKhXJM4xHzNRK109n/TzGCKXRmWZfgDX3GirZQ5HAuvOI+sVFr4+bnzXV0wXkSgW0uFphA/4CHLCCbMCva8nzkvI4b4IMeQXKwiK+dS7VB5pC2DR9sWusxA2rP8E2A1Q/E1GoM4z5NFXChNDg97NjZv2vTSPOv2Z0+hHhJfUhLta+rHB9N4EoWFoZXY7V6KjkXvSUXidPcx7g7FxCFz4IWYM7C18qIRjV8e2llw2nxmYXgb8vGhqqrOA4UAVI5pgc78IrK4Q6PD7gv2qgaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zaPGemztCk4pYfEnrqgfqMSGaZRkYVmUY0DvmRJmqo=;
 b=WLrs4znQ+qPyT2mkc0TDLMcchj07tg996V9ihKwyNUZUgClLU6h3Oa4o2ugfRQ3WnrRtEofbOs26AY8d1VZZ2ftbZWesV72tu1FS3sK385yLrEXCNVdnOHbXCi+jDXesOrqsx83o22lsD8XQJ6fllOnHT3bV5UdtHw2UaAeE+75KD8ckrJ16yYnX2yMD65t3aIb1MShmx4BBB1HP4EUw93ORgW7SFuDKli8VV0WIF7zCm3ATfYD2Sk5hMSR+2wCOfrJvsz5bpka9s6kAGCBMpBTvNlEs+ZVaCStYNS7zImE5gOCyGvkWVHOkLlfCQYMx05ARgecT0a7f2M7cf3LW1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7453.eurprd04.prod.outlook.com (2603:10a6:800:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 15:05:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 15:05:17 +0000
Date: Mon, 11 Aug 2025 11:05:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 47/76] media: imx-isi: Access v4l2_fh from file
Message-ID: <aJoGpTJ6xme8TdMV@lizhi-Precision-Tower-5810>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250810013100.29776-48-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810013100.29776-48-laurent.pinchart+renesas@ideasonboard.com>
X-ClientProxiedBy: PH7PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:510:23d::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: cea3f88b-0a1c-4266-352b-08ddd8e87bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gnMF4OnOEhd29DA9Q5X+3LGctjDwPyBUc0p6ZMXFPeL+aoPC5NRMC3PyKnc7?=
 =?us-ascii?Q?n0jOx48LI1M6TB39jXrW19v4IbW8/FBDTjcOX1Nel4Q/Nr2SrhHwU7TtTioV?=
 =?us-ascii?Q?dheD9o+jkhQy2ZETfykLXtT+P9qk0lul88gMURKghEbdpcQAr4URM/J1srG+?=
 =?us-ascii?Q?Y8C9Y4550gI92mmn/hXue6YHP8xuTWA7ulOBAEkwx6hjNu/QBi0UXNB1k1TM?=
 =?us-ascii?Q?wepjNpwEEVJwlgoNxRbSdoKMcnzSYbh3fhJSlR2G/p71xiWmuIUXYVt8l8jT?=
 =?us-ascii?Q?76mgbdUCU3yqWlxSai3QN76X6t0kb8rCGwluQXALS2ZD9eYYSKCRFTmO2cAz?=
 =?us-ascii?Q?iK5/oaUB9f4hOiRx6pg9Q4JLd8sJn9iJQpsYT2YqddhbKFoxmAJCnbiiqpUH?=
 =?us-ascii?Q?9s6pUAAPnrxQYz6PGSff1u0jnq9lFFyZFWE7/RLZdoWTt9Ow6rAz27Zg4iQC?=
 =?us-ascii?Q?aANbujSOYJCrIblMLzeuvVmip48QPsrBQp5ScEOC73IN6LjpxEFs3rRR2k2S?=
 =?us-ascii?Q?7so6P9qjJrngLpUGZp8PuEfoAvkoOtiULRvwLSIgiUXtSPD0rtDGD/0vHy/T?=
 =?us-ascii?Q?xo5aJG27hJIN5hSkhR3+GB108He2UGp3ktnj2nBYdyj5eDSykrQSNhK8f6Ws?=
 =?us-ascii?Q?eEwy84ENCIcHYSW7qirssrwUR9Ho5jzh/znOkivje3e3XbXIWN2+TFeShzXd?=
 =?us-ascii?Q?aMKopg4HFH9oMqNPQF4GqyZBVNlZVe/1izMp3SelMhl8ShVJQG/7kZFpvhuP?=
 =?us-ascii?Q?hTSHc1Fu814xdyvvjAMiHLECUIP71Vnn5VFlx6oXt7sPNwYjnDcYJHbt1tuG?=
 =?us-ascii?Q?zo4t920SusX0O+2ypH4f+4h8AjxIDfcMvCHfWeJr+SBZnVfpBLj33d2nK8xq?=
 =?us-ascii?Q?5dac1lhGaVZOkW/Vb3c19VS5tWJIF0913Ov497zOiDuSb3y5mvQo6vVYdvXU?=
 =?us-ascii?Q?/zetVC+0Ku/cpI6b+aBoYmu/qHBizt14h3njCML3r7GZVO2GQo/PpTJOtGke?=
 =?us-ascii?Q?3TWGsPobD80AHLFGrimzm53DvWoIOcVc7wp33B5QyaLre/rIdLzfNLCNYmf8?=
 =?us-ascii?Q?/NE9161PzWRH7rdP8UYf2Z9CQGEMHaAIjZqcEOECZqieTsIAlQvTCjbQ+5PI?=
 =?us-ascii?Q?ZxDsVZTHpXvqyIqNpHbwM/FBguSXsOxufIf1mvof2lYKFWAdoKE4oogk4V9w?=
 =?us-ascii?Q?/gmsaJz8ivQq2CzH3zf9KhPx0qturL6TUlwe3PSpUAuWHeaHazfUkPweAbEL?=
 =?us-ascii?Q?IFFwXRUuTI+0qPNFHiHtlS33ZvlNoEeN0AdgH1MZWJt2Id2x7y17XXb1ZeQ4?=
 =?us-ascii?Q?LAp4OpXlo86ZX24P7ixY1gFL/B/mXdMEvUwNLBd2p9Cfb1mMedSKGDEZOdfv?=
 =?us-ascii?Q?4gPuLNfyeEnMoFneZdsQ3G7/wRm02VQ3mPzBq5yA6y7iQuGBCiDsu0twzqmu?=
 =?us-ascii?Q?LNbm/JH/QYB7PMFONq5TZLuJZRLWmnqVVed6YEKr3rvRvuk6ep2mKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aHj/c3AbVuIUkadd3WtEPIwn2gQK+AXQGhf/jk752F+2ToRNcjvACFjNvoBQ?=
 =?us-ascii?Q?Gz+c49aW1mrKQ25EbzKjGbxDdApdYBLqZYXSeWc6TjJW7ZbyQOqX1PVF55aW?=
 =?us-ascii?Q?iwnyeRdq49MVjjV2ytT04ntZO6p/L/gJhBVfeZE4XRwjF7tz2J13teqq9Ecp?=
 =?us-ascii?Q?hor7TSPmbAKVJHgMqAUYpldZnNGJIoDN5anagWmOBs7TRYFA6+zIb38Gtz5Z?=
 =?us-ascii?Q?bJ//dIY2wm8ed/kKGhefxmOtuUgxBIWbNT8aG8pO1sNnmV/XFNrWv4cGQG++?=
 =?us-ascii?Q?EQDJFVOHkf2DybGksj8RUFpyGThg+s+YnDrIyAqduGyOslgK21urVaVycd1Z?=
 =?us-ascii?Q?YOuDKwkWcaz6FOc0XX/uCll7iWS6XHnCHY6hBlhwdeB2J4Aj+IQrirJCreXy?=
 =?us-ascii?Q?j0jpTDPqkjh2mNNHJHa6oextAva9j5ibGgIcjAcTAuPymzVqvX3Kx3APfYlc?=
 =?us-ascii?Q?UVB/d1IRjZL/ewyMXL466Vn1YUe1K3Pr1vPl5+KSuMKexZPrtwJMM34w/2zX?=
 =?us-ascii?Q?BHBy8u4wuGO8eUm6ziJH7HJ44T/cjqvAOA8B5iRUNKmVn3pgBytO8lTEf4Rc?=
 =?us-ascii?Q?wfNw9mfnaPBaZFzH3aCZSL9Cee75KcrZ/L/wnm9ajf9ZEH20FPCIRnR5qr6j?=
 =?us-ascii?Q?BqEwzKo9c8sx7YLETC5MSN2FjZxAe37Cr7rf+OPssDVVjjXuMJp8aSKs359o?=
 =?us-ascii?Q?in7uDkngXId7x5Of3yEOdl6sXpcSoDHqqbk5oThqPY34TccxXztgDYMPdmEr?=
 =?us-ascii?Q?z43EhkNQSxGV6uyRN2BBqIJSQQmv98oW4lSM9pttoXhawsqIsb41vlLSYWHb?=
 =?us-ascii?Q?+HNZ37TNCJc+bgQt+PGH/nr0Hvp/Kk36LE1K5Knx8iS2PRT226BWuK/ZZsLE?=
 =?us-ascii?Q?IlQOJaZwCIInb9HEUNWYGvBGYzloILIYUhsM7t2U1nBz13C5tMNx3CuzVFu+?=
 =?us-ascii?Q?DOsDb86ARH3n8/oDEPU3Ds6/cvsc8fL9nI1fdvImh9i9RRvD5GT7BDyJaNZi?=
 =?us-ascii?Q?pwYvq3WTxyVV9M+cWWt2oJb3vWXxzFnyngvKlwkAbk1FKn+itx7S2X1LuE8+?=
 =?us-ascii?Q?JlGUK5l9zi4HpvNKhsGya7IJL+U4tsfR+IlU7SW5DhogxYxCEbbSvGVqMXZb?=
 =?us-ascii?Q?1UoKyHK0KXZGv9/T6TYxQk+gppgDa7eO+AYm+FzB+6TOU65ZFPsUOzARMw5g?=
 =?us-ascii?Q?ioLiIRv9PmJTmwTZUBXwXAWXwFpMSLM+K5RMEXl9Tr8mPdiR2Siw594hPKpP?=
 =?us-ascii?Q?GH44xqFvnMIfsaONJd2kg41Lb/aKfSgeujFZluSwl6sw5kfqUatnn4hACX/L?=
 =?us-ascii?Q?ULuedupBlIehovxJ7dqR6kgmzWo02iqXTcECln7CQYnOrDiUdJk870JwUjWk?=
 =?us-ascii?Q?dU55a2UW7vGgJeJCaGHuR/OExhcKHTekQ8zMORNMWi4CBPniIZlxHfd1BZxR?=
 =?us-ascii?Q?58gOQKWpZ1SPVrg5okWUCfcG4UgMKZLu8HLQjo+uXJHo+eeZjGo3NvCySAAM?=
 =?us-ascii?Q?6SFr9fft6CQj4MTnYx6EjXkHzMW+9PHnkMDTsErQpLRVOK1uc6ctWomTkA4K?=
 =?us-ascii?Q?EA/x2TKAXbwfLknBRLw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea3f88b-0a1c-4266-352b-08ddd8e87bbc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 15:05:17.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I3xNksszuv9puCNGi7BiLzCAevZpAxz5JsTvGP1VJyyh+Wg6NtF7+ALDLnJBWAj94FmMhWG49IhCPbPvucylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7453

On Sun, Aug 10, 2025 at 04:30:29AM +0300, Laurent Pinchart wrote:
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
>
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
>
> - Update file-to-ctx macro due to removal of fh-to-ctx macro
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 31298307c672..5501214cc6c0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -74,14 +74,9 @@ to_isi_m2m_buffer(struct vb2_v4l2_buffer *buf)
>  	return container_of(buf, struct mxc_isi_m2m_buffer, buf.vb);
>  }
>
> -static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
> -}
> -
>  static inline struct mxc_isi_m2m_ctx *file_to_isi_m2m_ctx(struct file *filp)
>  {
> -	return to_isi_m2m_ctx(file_to_v4l2_fh(filp));
> +	return container_of(file_to_v4l2_fh(filp), struct mxc_isi_m2m_ctx, fh);
>  }
>
>  static inline struct mxc_isi_m2m_ctx_queue_data *
> @@ -432,7 +427,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
>  	const enum mxc_isi_video_type type =
>  		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
> -	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
>
>  	__mxc_isi_m2m_try_fmt_vid(ctx, &f->fmt.pix_mp, type);
>
> @@ -442,7 +437,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
>  static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
>  	const struct mxc_isi_m2m_ctx_queue_data *qdata =
>  		mxc_isi_m2m_ctx_qdata(ctx, f->type);
>
> @@ -457,7 +452,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
>  	const enum mxc_isi_video_type type =
>  		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
> -	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
>  	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
>  	const struct mxc_isi_format_info *info;
>  	struct vb2_queue *vq;
> @@ -489,7 +484,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
>  static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  				enum v4l2_buf_type type)
>  {
> -	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
>  	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
>  	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
>  	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
> @@ -577,7 +572,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  				 enum v4l2_buf_type type)
>  {
> -	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
>  	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
>  	struct mxc_isi_m2m *m2m = ctx->m2m;
>
> --
> Regards,
>
> Laurent Pinchart
>

