Return-Path: <linux-media+bounces-28928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF297A74C92
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 15:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D74916B6FD
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE221C1F02;
	Fri, 28 Mar 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OKxeVH7N"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDA3214A96;
	Fri, 28 Mar 2025 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172015; cv=fail; b=maOXqGTdEOef468+dTrQPhI51nFjE1whyvO/IUQQ7Ts5j3jr98qCnnD6nNtTf8zlUdBDQgvI0blOOBJwUG/0XeGeAvWUsJr4Z4ZX5myLDUOhQ9bM8XI1IBnUH23y6wjTILNpfkk60YO20fvuW80MdRcoYHq/MzXaJIM21Ottoko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172015; c=relaxed/simple;
	bh=1gRLZ6bqEvT63SeenV7T/LYnYK+38IqjqG99LhtQ7fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZL093qfHT4ajXpSiX6bQ0ZON7UkR/peAEno0izQeDiEMMUVcQ87wLm44DLbxY2Ufk59fc0B9z0Q3EzGB5vQ/qTIc57gWauxBGK5TECtA1CjSZkXSIz4zG/GaGcOo46Tuo+TYHbkuAz8LRmPzn10JoCF1tsib20FJDi51b5zlOGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OKxeVH7N; arc=fail smtp.client-ip=40.107.20.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W99Q3NqCDvCrhHGLHQvGWFv33Xvs0xW0WwWLIsJHA5ltaD5ANKDm+ymF3EW6TgNMiv0WGrRVvzRnUcWiYXGtO1nRsflr9CTR9OGTCyt2xVYIObzQ84h7I0E83gI0pxshAS/MAQm2Y39cBX5+DkiXgwNXrc+dqbNl0W6okdBJs7Uy1M6f+z2ipDe2MWlDWERg4zebcG6r8VFXr9Tmld3kq03nqg1Jfl3Yj0kAfafvMjDEiWF76XtmppAEFYTQJGyOkCwGZ3s7uLIrcbgOp7aMCCHQ3/fAfxAo/djpmTkySs+t0clnXd1G5swMATudmV4XAGFX0JxVnqvK6Ksos26W5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwkmU/2v2yYg0hmLUYIibrAjAgYCeXGBkmo9fODdbQc=;
 b=R4EFzg08dq4BRmhVpN4+f1sgTeZ40GbEjctnVeYxogFFeo15F8XSYASNwJmOyPxBYtCHDWnQipXZfeT/EluHMM+7c2QOpH9H40IjglEw87v4hVNG3x5mAOmBcL9ClPaKKmrvPJItO3N8P7Ut9JA2+RucHQVke4W4t5aYPxjXnJZoeBxTxoOpOaxUL8MEkvootr8sE5gP6DV7fOgPXOU6awjjMSH2ghG0mpOwFAEalZRtdI5GJ1z9XaNgyQ3+eTXDuVU/tfHa9oGWSqc4Ma+RKPVDpXmPCO1TQ1Cccg1wL9g8g/5u6ucGcBxOnbK2lYi4rh1UsPklyBFkaA7nGJFpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwkmU/2v2yYg0hmLUYIibrAjAgYCeXGBkmo9fODdbQc=;
 b=OKxeVH7NcH5zh/+u7/qeJhdN33jztgtvF0DgH4Aq89zpbb6/ButFJE7nJ67laxeuc3iKtXrIy7jeMALYm63NCAyFoAZ/ojkSjLTA3vbAztuSlK7qPa3DdzX9CNjlCnWeE5wKwoyOUq+Qcu3eBIlF3ice2YtEJ/6hsPYL79OQYQLVtwM/62Pe6cs3d+hT5cLwwC6YskXhe2DppdOUKN2kXNE/M2ocIz7YMx4M/PnrQL5OcpXsDmQm6xPm7l1jIT0lnV5WjbSmwagliGxhKdUok762ZEwT8Kz+JVMdM7IirCbNY6cbn+rRSPxh9GVjVQCo+CxwXZGdagCeC2MaFaHDfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:50 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:50 +0000
Date: Fri, 28 Mar 2025 10:26:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] media: amphion: Add a frame flush mode for decoder
Message-ID: <Z+axoaxe518QxY+3@lizhi-Precision-Tower-5810>
References: <20250328064819.784-1-ming.qian@oss.nxp.com>
 <20250328064819.784-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328064819.784-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 596410d5-ed48-4f5e-3f5e-08dd6e049402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hBUkdetjScX9R9uC3sjPmvRCXesgVVQTk6QZlbVVUFjdHEBGbpQB6U9STAyb?=
 =?us-ascii?Q?RW1LB3/XcvL8QcakLWQp4tHC9scJ+YwuRzwfo5itjhbRBD/0vZ1KdB6xUvbI?=
 =?us-ascii?Q?HUT+StAoZb1T9VZ3UXfPChn5NNQqIGEiO/Glb2qWI64H4xpB1lcWRgHkSthr?=
 =?us-ascii?Q?mAOOnGsPJxCh7BrbH0IBlKwMuZ4V6znVQWRfsL3KB8HP2njvuz2E06WVaOjr?=
 =?us-ascii?Q?k1CE2DhCoTHZW3ZCIYxNRISElBJKBljx340MkGfdbpyzY48J5frdbHHDsyrF?=
 =?us-ascii?Q?kMM+k8oMe5AeTkRwUS/Bkqeb2aDiPvQOrraOxy5NTIQ34wxePTvTahxXn7dF?=
 =?us-ascii?Q?iM9bNaxAUf8X4qP2uiCgLId7lS6gN4/x9T2+KQmuN6vjEXheD28hkrePNL+C?=
 =?us-ascii?Q?9KbibcaAwYkJNh8j4jh6i/ZkFaPEd021057yrw7k2ghsE7wYQ7wJaYB8a+4O?=
 =?us-ascii?Q?pqj2HFZIiqKIYtRqBu0xMfluudwdhD0XmqNw7SE8eMg4bPk+2DUVLTz5fTFO?=
 =?us-ascii?Q?b8sSg+sQMKDwuSFE0Ho0aZC+LKyO1TAlyLGIFWVHkiJqOkOgifZ9tw5Koyrq?=
 =?us-ascii?Q?uNRnBR7I8uFY1ZpW5ebpAz6fHff+eixzsvI8OerB01i5rcdK6StLT2Iz6co0?=
 =?us-ascii?Q?aq9kCM3f4IrKosI1b9Um94+3RQ3HYVSItcVyXfCeHsr8uxHDB1pHJHr58W/N?=
 =?us-ascii?Q?1MqTdP+X0NJ4IdV6G4s1amxFN897HcVia3QotEgO/uvLd8mPPDopPxbeuMIg?=
 =?us-ascii?Q?n1+fxfcIqe3sNJLgT1a5qlbYoYwG6PQJtVdWBxqxjqLUcW4KNwXyphTdcEHD?=
 =?us-ascii?Q?jytcHGgkpCQwl5QrPIbkyvR4yOGMQ3H8tIH+kPXKy8WUpZrwzRcLXPYW3iIS?=
 =?us-ascii?Q?3VxIE1K03YdgRVQO8QnfWXEEO75v5xfFkSkpeZgxzoUl6O17XdvUiLn4apfn?=
 =?us-ascii?Q?Duv2cNcUav/4h3o3GwN9coyryYL5UEplJRlz8ZEIYFpb95boHqqtJVCV0g8F?=
 =?us-ascii?Q?vhvDidROpL7zOO0xQXRp1CBYRRU3RhoVICo8VUM0o94QTxzgXZzvEFC+nfkJ?=
 =?us-ascii?Q?hXb15YbTogO4JMJtHJEmd7P82HIBu6AlYLj+oOGDJFYRks+Q23jPKwFjER88?=
 =?us-ascii?Q?Sibghj3zD/IFIhKCct+o8pcuB4b7Vxs34VsHM+m8UnJ2OxsL9VkxJenEZOEj?=
 =?us-ascii?Q?Ep+A28Obol6Sp3/uQtCh3lnazpSAz+G8K1B8eCRr/2zncAm/gMSKmYrEclQK?=
 =?us-ascii?Q?iROQ40SUT+sQZ00620ARkbFTR2C64NXatpl0znhpZrVIatGaon9Gr2d5RWY5?=
 =?us-ascii?Q?/CTQXMLCUzKf380MupdXoZknvnuMUJf7bZTi7yTzlN3MtqN7717pmOMAMnrC?=
 =?us-ascii?Q?7M4JaCTGHwbtSknhNCQIy26XC8+/TpiCbOOOSD3mMX8XO7iu1UJSLHtIG5nx?=
 =?us-ascii?Q?X7giqL5Vff6F9OONCMTT64Eu7BpFShBdRojS3Kq8GPHmEuvVr8vMyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ewlxmn2w6mSRQwejXq18oQwbcX/KSx+O1wCD3MqTqgn2QFw5OONGFD57wxKm?=
 =?us-ascii?Q?B91Hx/dYngmNmSgwsQcMyt0jgMDqHss4DDQLQPRlX/rOYfnxj7j1HMGbNrE9?=
 =?us-ascii?Q?A/9DChSvZx1OAWN6RPqwV/pUWjdc/K8kx/xdrZiczEBn4waAcdSSa15jvYIU?=
 =?us-ascii?Q?S705VLsXOdgFpiID+dmMMh+C64jDUIn5VgqGeiWX2cF+i/4k2g2jfeU7Di3w?=
 =?us-ascii?Q?tNpU1kDL5ogQG/FxMWrjR5Ubt/LCAC1sJL2KP74AZrShKB/jGJaA9oYJUraW?=
 =?us-ascii?Q?ArjXdpBwJUret9xYHW8rvYGHwTjFZ1xlzwPawylmB/JTQ5WNjDihz1pU3MXi?=
 =?us-ascii?Q?5//xte2dj3mBBRGo7AxCxvAST2etblCLi8dKLfuECptwx25bQWlRJeDdF2Vi?=
 =?us-ascii?Q?9JEyFxahT5dUVHWNok1rscBxLWFVqFkR7VJZP9dRMJIFH+rk9gMlo2ba2rbt?=
 =?us-ascii?Q?0ClSIbLKlJ3e02bmCT2Z0Gg7EhY4A37EPI3MJMcKzW9sIDIsuIB0J9KgMp30?=
 =?us-ascii?Q?VJW8jLyoG03Bx5H8f7QWUdUf1OhhiZmc9pcM/QDO1OVC31OY/vxCMjHPPW5v?=
 =?us-ascii?Q?vWStu7f3Q/YXaUvcP7c4tHyv/dAgSMAwrhsPNw8e31y8Z7zZRnqoz/FIrixm?=
 =?us-ascii?Q?nloSm/+gKau6MCErgscloco+QCGFwonFEyylKue9y+O0LMKRi75lGuqaOKTe?=
 =?us-ascii?Q?YrkMsTSX1HmzVUagVD+hIwHI19cKyDnHEdYh3AKRXjA9tAyL+Kjekm/BR7x0?=
 =?us-ascii?Q?iRnjZe+VWxRBIiBNY35SCy3MJbrJS0mkFQq8zAXQO5Adj7iCmP5CK4V2YyjY?=
 =?us-ascii?Q?ZX2/oX/2GCeGM7b7w+P4XoBswSbiSQPgtFJ3tnwYvKTvkbm8H+8hd+e0f5Sy?=
 =?us-ascii?Q?LzOfOdmKrc0JE2UTBZWUjk6tuusSo53xvvwMf2tf7P3IbdLLRzeKxrItNxlt?=
 =?us-ascii?Q?Is6JBUtRzMj43KsrPFOiIRjAdpQOtjEC/Ibxa9Ig0Qo4kqiXDbbfEnFv8peq?=
 =?us-ascii?Q?r46DfwgaltLBHvDn3YEyW+id4GjJOjGlb85ykN+7syIOmI1KlmHgVg8B+/UX?=
 =?us-ascii?Q?3aw+TkLFDygy3/f0+z8uU+mYsSBsuelibNIIbreipXDPuTCsXRWqv9kpF85r?=
 =?us-ascii?Q?6ZOtOXP7B//355cl4idLWA6guSZ6X5Sq+8ywnARmrDmDJUWU13rllYX6TAll?=
 =?us-ascii?Q?VGnLkb0u6pUOHM6f9wVQQ/NWn2k28ty+aLqoCHzzhnhZHnXXiYBPbxtvoqT/?=
 =?us-ascii?Q?G+nII1cCscR5x5enqDfFmU26fRpMBV1PwceyP/6KH6VxW/bHYvR/5aWQG0A1?=
 =?us-ascii?Q?eVCRJgW7vxa0dbFm4dUohFwsRZpz/u1MrjyIBNdWQ5Chz+mbUm51ZBD29erX?=
 =?us-ascii?Q?06clrqoJXlUjdI6VAfbRxA7G2N3F8dv1TT3atd3p4Xu+srl9kPkhsHkF3ZqB?=
 =?us-ascii?Q?w2+Sd58vva5qS2LoKxDLEKyVv/eayXEi7TO78HKnCPXEzfs1MvmIvE4sw6un?=
 =?us-ascii?Q?qfUCAbA9pMq93mTaQkz6CWjAiXLhYUkvvVl2NTFVUg7ygDKfmavkfNUpgUuJ?=
 =?us-ascii?Q?hGcPHApgEg5uzdbt1dA7T8To2yoChf1GTOgFTx4T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596410d5-ed48-4f5e-3f5e-08dd6e049402
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:50.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +setVs9YUa43gYVsFcwP8SFdshr5TYGAbavbcujk95Jbe8m3Aa5cVDJrKcRl7hB3WuXf8UX+yzIAj3wIPpH+mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

On Fri, Mar 28, 2025 at 02:48:17PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> By default the amphion decoder will pre-parse 3 frames before starting
> to decode the first frame. Alternatively, a block of flush padding data
> can be appended to the frame, which will ensure that the decoder can
> start decoding immediately after parsing the flush padding data, thus
> potentially reducing decoding latency.
>
> This mode was previously only enabled, when the display delay was set to
> 0. Allow the user to manually toggle the use of that mode via a module
> parameter called low_latency, which enables the mode without
> changing the display order.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> v4
> - Improve the comment expressing
> v3
> - Improve commit message as recommended
> - Add some comments to avoid code looks cryptic
>
>  drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
> index 88f8c16a451e..7f6251f7becb 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -25,6 +25,10 @@
>  #include "vpu_imx8q.h"
>  #include "vpu_malone.h"
>
> +static bool low_latency;
> +module_param(low_latency, bool, 0644);
> +MODULE_PARM_DESC(low_latency, "Set low latency frame flush mode: 0 (disable) or 1 (enable)");
> +

If there are two malone instances, it will impact both instances, is it what
your expected? Prefer use sys interface to controller it.

Frank

>  #define CMD_SIZE			25600
>  #define MSG_SIZE			25600
>  #define CODEC_SIZE			0x1000
> @@ -1581,7 +1585,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
>
>  	vpu_malone_update_wptr(str_buf, wptr);
>
> -	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
> +	/*
> +	 * Enable the low latency flush mode if display delay is set to 0
> +	 * or the low latency frame flush mode if it is set to 1.
> +	 * The low latency flush mode requires some padding data to be appended to each frame,
> +	 * but there must not be any padding data between the sequence header and the frame.
> +	 * This module is currently only supported for the H264 and HEVC formats,
> +	 * for other formats, vpu_malone_add_scode() will return 0.
> +	 */
> +	if ((disp_imm || low_latency) && !vpu_vb_is_codecconfig(vbuf)) {
>  		ret = vpu_malone_add_scode(inst->core->iface,
>  					   inst->id,
>  					   &inst->stream_buffer,
> --
> 2.43.0-rc1
>

