Return-Path: <linux-media+bounces-45087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD91BF3724
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3E844FE2E7
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B3F2E0B48;
	Mon, 20 Oct 2025 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GJ1BUFYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458E2E0938
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991882; cv=fail; b=uAQMsQkqFU6NfFuVx2cWKkblIlkuVJkURr+/9syXUQSNtNCGWH6XrE7ZdGHNR8RxjHd3ORmJLDpnygA7ILUooqxtOna2U3712g3d2SvgeG7p3soY8pUI+iOdgm/TKhaahDxE6cOazNIGN9H6X4kTb0HC+Ncq88iE6r3OAXBKxDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991882; c=relaxed/simple;
	bh=7ZSGUpAkrPruJFM+ZrOBODy9UXnzKz7KvR4rYqquszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z8egOTTRlt9KSYG+g+fzx+ULeNCkkEVndZjBIa/vaNrkbjxXqM7LHiH4DrO+jqwoEl8bylPNn6dbFv5rWKYsbAvTZQxyIeVrnoJahyVI5C8WiWA5h0kPR0ko36AOBBeFvb284JIM09U0bWG0wifEYu8ERoAIp96o4uIA3fEY8Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GJ1BUFYQ; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgGDJwKFl8Bx2CLImSBgqfBlL9WFkeibdacBAtHOgpwmHv2H1pcclf8LOdBt9XtprjjXX23xNF2BrDdN31ZQOVj5ZsXnCfPNCMD2unxhfb80CgZ2MhBXMu6304Da1FeLmVTczIFQbFxCb3geEaUd53U/gULbBOfQEeYqHHHw4UiXkjfmZ9njvek0Enw16RE2UFGyw1t3n2se//hm1OVDnGSsjyr9+wpp2CXxGJj4CSHfhY7+rFAPJsDmoBWoowT2X+pH419xC7j5Scs/hujob+9IVzNHBg2xZRSbg5nGN/3f4YkCIuoSeONmc99coASn3G8wN0Zvppch1EvHsvHoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoCgkkHXm66iWh3FBYkrxZuEyOW2MUUrzaD/cYRPGEU=;
 b=IwxJ5razn21vLjo7fCVetKkV251yq8EpiycskWH3953klmBG418E7T7n5zPyQvE1zualFs6W2XfEBFzA+Ch/5ry3+G4Wni5DPSgxQSxRaGelC8opc3E5mpNUZ7dLZUBWk2zMVCqGNNhamzsUnSDQsHC6PWZT49oRawhte7TjL5eZ95HyAU7CnEJm9mxeZndSnclJkJMfJZ2eTLPDCgh9uAvaJihYG0jtcqWwPahJmaTlDQiVCS72CmF2S74fKu+vDV8H4rwm6uPbWYTsJj4n+usjrofT91d8Fi7BgE/86AQ1p4nmQou8XojwxgDWSCTtmmv297gEair5EtbtKR00lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoCgkkHXm66iWh3FBYkrxZuEyOW2MUUrzaD/cYRPGEU=;
 b=GJ1BUFYQC+l9wvIi1JLC+VFUushY4AN4ogjBby9gNgl0Zw5fqSveNA66wjCG+RekuiA4imM3NbkyIXMcnhHehnIx+LUrAucPF4636CmfxiyEH2rHndTRL9bOoARGv2NwAJQIaDjU3762uyjHos44hxH3hlGeI/mWatJwBST+Zev5hDjtYFr1/fp3xeEnxObpuqrALiXlgbILjb4a1LNlubiYt0n3vNJ+21C49fLfMWLLkKZKLJZ03TcuFDs3LGrpA9c0Nva7G0LRsZy49m5HXfiqfsGAK1CyOkqCQGvcy2jz7SxpnmyPWyHoy6mZQb5Ij9G/v9FA1eVwX8PS97OHoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VE1PR04MB7391.eurprd04.prod.outlook.com (2603:10a6:800:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 20:24:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 20:24:37 +0000
Date: Mon, 20 Oct 2025 16:24:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: imx7-media-csi: drop unused module alias
Message-ID: <aPaaf9X0f5Uyr07s@lizhi-Precision-Tower-5810>
References: <20251017060051.8204-1-johan@kernel.org>
 <20251017060051.8204-2-johan@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017060051.8204-2-johan@kernel.org>
X-ClientProxiedBy: PH3PEPF000040A1.namprd05.prod.outlook.com
 (2603:10b6:518:1::52) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VE1PR04MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f663ed-a82d-4a35-4467-08de1016b082
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?U0MZR7yUTgi7dk6fNunlGysl8WFeFntzlBYTy+sQyEVwsn6R8Admlh3QYjAT?=
 =?us-ascii?Q?WBfEZ9GCaKmoquiFh9zIVU+8cuFCoqAN5JvV1kCQAR/+SHH4l5Rd+yZ5DVBP?=
 =?us-ascii?Q?LuvfhfQ3RDFp+Lt5+mHQvClWaH5uAwev2JlZQRj6YO5Ff3D2rhVGjanISlYq?=
 =?us-ascii?Q?hswdgyZRkJRH+PCTwaM+3yIXcU0ctBYt+0OUxcU4I0EGQMlGkWncilsgN+5M?=
 =?us-ascii?Q?m3Pi6/WMQRF5lkJBDe6shYtJJSusoc/OUOEQrpw6rPyLwzu5a9mBzo7MH9aY?=
 =?us-ascii?Q?7yUblL5o+uYKERctZzsp5MRw/q4oLMtmN9ddxwZeQHdo7pbcz6GbfD3Ava7B?=
 =?us-ascii?Q?TsdoQTvtQXzFfN8UwCC1AKhUeGBtENnL8MR9so6BKwrUnXeGsSha7yrQuyZ2?=
 =?us-ascii?Q?8TuMSjFuWuQ2ryvlfAF+ysokrSvG56wK1AasUv8B0zcezpipXiFszL7Q5oGh?=
 =?us-ascii?Q?S3zdtgZOzgb3X14unJIGW4WWU2wlEmteDh2J0BJr4ONecGI4VB4ybi+lcdPx?=
 =?us-ascii?Q?6OhRiEsp9tu+L+eO8YAb4we3T9bEaXRYh8cWvbtJnBsqL5HtNbjR8KsYF+1F?=
 =?us-ascii?Q?jF+M7Z9TTZDAEWpvmjkqo149LD4UdW69GCTGgqJPNAbK+HvIO7uxUcO1K2yO?=
 =?us-ascii?Q?wPVJibJK2erxokcDYV1/Bbt4WyBd4hfUCfeqQPI5Su7PIo1puAPgAK6PRe7H?=
 =?us-ascii?Q?LuKipWOgnrKhiGQxSYVpojOU5B14bKD8NkndMSWmmG5rCAWKvsQGrdMZa6+w?=
 =?us-ascii?Q?SoNgrtqEWwXWPnYbYxyjbQYfBJ6zzACLfc3+9N+egO1o+Dc1UJ0XHkUoAzDA?=
 =?us-ascii?Q?6nYq1P04cRxsxF9OsOVqFUM5YtXCyE/tGw7CvZphaksErQyp7IpQLFe51YjU?=
 =?us-ascii?Q?CHXxzMG5UOrOfEOj6EXQ0enqsZiQsDf2VTuu82byF9i4vx5qte4Mx8fhWn12?=
 =?us-ascii?Q?UdwUeV/IqSo/cKQnp90LtmSSH6MKcpzKKPw4CTyo4NAX2u1vpktdqcMEYu1v?=
 =?us-ascii?Q?bN6i9mUP36XXu83Xuxo4w+9GWdSYgEH8j2k7N3xQTNdGnBPv9VVICJIEIgtS?=
 =?us-ascii?Q?W78sc4XzKypLCqcc1dW3JzKnzMK8eMJ+JwQY8fp9PmdFrZuy6PandXWCY1Ft?=
 =?us-ascii?Q?kKDg41kYOY97PO7LW4EXqBCEeppEI9agZ3zm3OV15NyU/ol5jFcnemRT6Xci?=
 =?us-ascii?Q?SOqmhPjrpOrz8tLCuwc/hB1kHKC449dwQlGaNgMLgTsSp65bU+qJUi3PW4Nr?=
 =?us-ascii?Q?2YskJVwCQKsOFX8FN8mifu4aWdH+maSHjp1BYrgug6c/jD/O+3ALoqNDCWf3?=
 =?us-ascii?Q?9dBO9Js4SqIjhj3ahj6ToytL5IKHCX7Br1ZYXFZoY02oM2J/HfQMwEskIbjN?=
 =?us-ascii?Q?z0jbMYZOPGlsX70KeYzC1GY4giZIUU+ag0poV1NFhj3aK3IzvWrrHFR/GLQm?=
 =?us-ascii?Q?dbD/rnbTZf5Huluv9KIuVDG5VFFiHx9tOm+gaI4KWy+MZR+7+lRCQNXfzdIy?=
 =?us-ascii?Q?3lGwhELdi0gurlxNHrcrVMhJ8Q4kvlxCT4Zr?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?OqhFMYPrnMB4lQp/jMh931nn7HPzfS8yCYMcsswQrcBnP2hsRfZ0KAw6SCpt?=
 =?us-ascii?Q?UzK/88H7X/okoZwnsF/OFLzPn7FbYYkL42l4AlVBeK2HPPx2gjGPMVCoqbpf?=
 =?us-ascii?Q?ipdIQ3wRVTjhXmWe4YVZzyHoyH++mnsWOHE+yqV3f4a+Of3vbSnPWc/FvV+l?=
 =?us-ascii?Q?G6PUgrOjCC3tPJrVT2tsam78T3NZvAIf+AEtKxRKNVeGQ8sR0Hx7awQbXFq2?=
 =?us-ascii?Q?13gyPIXaixpb3n1WixID2m7vYaOZlUr96jrGBV1Wc74ajUi78kWqoKW/gkNc?=
 =?us-ascii?Q?Ofs1OMxkXjsQVjHT13Mui8Q8/wyoT1GT2sTWAxGl/66G0OD/L91NL1aDxGl2?=
 =?us-ascii?Q?Ncgm/U3V0RdrG5MCUlGwlJ4Mn9BSG53ad0h3mXw/R57zkfEjRntI6ztA0g1v?=
 =?us-ascii?Q?J24m9kOJNWTr7aAXa+6dDrTYBY3bA0XbLy/QmoQQOn7r+ZDF7jv2pXwJKDAf?=
 =?us-ascii?Q?6q93HkUoo2SkZ8PduKsbxwJxYvaPdUiFzOe74XKw4MO7rMhTnSib4kEXHSer?=
 =?us-ascii?Q?ccfYfJI+LPtiJOtxt7Jg2mcJuMhjsR/Y0tKXOx1Jxk+ocdkl/Q+swyWRQ/3w?=
 =?us-ascii?Q?O5g86wcDqKQueNe7CPD4oClT8OGLBjicyd9xcdYvORB6FpeMvLJcw2DOLB2w?=
 =?us-ascii?Q?bnbXI/qLUdfZ4KV0d0RAVpqNwljcSj2mqqCN8wwk+0UcrGA3QBOx+gfCJ0Zi?=
 =?us-ascii?Q?B/PveYFSOKXCZ8EbNRyPhdc0S3TgsNRx8X6AbuQ+jEP+L5LzH4wp+x8hK1hV?=
 =?us-ascii?Q?0Zt6rfbt7Nw+uCNPVBIM69ofi1b77ozdQ3mfBaFLsTnZexXAepKT5AiDKN04?=
 =?us-ascii?Q?AmhBpEYv9w96tmEPusXhWfBSt8jrLz7pQf9t7swgDBHilfB2mhbnXKuy/VhZ?=
 =?us-ascii?Q?TP8PnlX8d2ZY7GGk+/2f6hrqOLRrLeMV4FE0+hlTK/cdmo/oNSV9XvWsG11Y?=
 =?us-ascii?Q?nAgnr2/A4K1Pla8sYhZSF9xSt/96Btdzw3XznlvqCt9V4AFSnsfyqAm4EYZn?=
 =?us-ascii?Q?e+UjAri9GPTiYW6G98fOi+m4oe1/ZmL8tGUFtgu1VaeNnk5sLqKM4uT8BazK?=
 =?us-ascii?Q?62PKJYA+kl1aQuJLXOQLyU6vrs8hcftpRQp1ZQCylyN9H03IoIJv7Kmx7ULX?=
 =?us-ascii?Q?2FJSpz7Z76w5CojRpd0iK05PXpmY9gIEdw9etPJAOAER19M0S8JbrQ8ViFwe?=
 =?us-ascii?Q?0KEbD5UfzEZs3qgkGfWrw8XLvpsnVKtnG9nWbDFOmgBWQQmyCt3eCp2tnjQ5?=
 =?us-ascii?Q?oQgpT1rBllbAGDggHVZntlZ6qfC8YVIY0EhaYxcHsFkbeTQO/Dn/j3Qr3ipa?=
 =?us-ascii?Q?ByzwS6EbdyhBxPWxxuP2qWuqvmf8iVMergvg4of1A61r34pQP0fkcGNlSWn+?=
 =?us-ascii?Q?Hfw2kRsmJtEALf011OOWQ4uDCSu/zXVdY9dGS3yPrXieh1fHUdB1aORxL+Xs?=
 =?us-ascii?Q?zhbI/VZTzHs0jahgO/qPc4yg2IxEOM3FBlMWL7npjXPFiHi48D0rmD+sAt7S?=
 =?us-ascii?Q?pvkrSc1KbJZ8l0uUOuzg5oIR+27/mqG3zPQct/evgEYkmL3+YKtAiE6BKYfv?=
 =?us-ascii?Q?6QNXwLb9cN1tkVczCP4fR5ZcLyutKhFfKU/5bgDw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f663ed-a82d-4a35-4467-08de1016b082
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:24:37.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M5bn9nFTzxu28ngt117tb6GGzL8Z31wb0BiLevNHt5yn44Jwr97SqbVSWIDWAvyekYYYgkOpcxy0PGBFwLc0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7391

On Fri, Oct 17, 2025 at 08:00:50AM +0200, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 34a92642bbfe..933a5f39f9f4 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2290,4 +2290,3 @@ module_platform_driver(imx7_csi_driver);
>  MODULE_DESCRIPTION("i.MX7 CSI subdev driver");
>  MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx7-csi");
> --
> 2.49.1
>

