Return-Path: <linux-media+bounces-44016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5ABC685C
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 22:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E02AF4EEF9C
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 20:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D77F262D27;
	Wed,  8 Oct 2025 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VJd/5QMl"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D762334BA46
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953711; cv=fail; b=Dqn8ftznNVDJSZaWDBwppJ43igdbZO6Z9yDBLu60u7pa9RdoxjaqYjTKBJ6JMd03UJ+Hf86H3ayXq6Hm8YJk5U5HSAzaR2EIXkcF7fnHNqifH4m6Jn5RmbsPEmQmVkZdDbsXGJxMB7/yDh3f6e9+ygyb5tvuKZsNFDdybCm/rjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953711; c=relaxed/simple;
	bh=UKQ5Tl2nPzFTd1xQjtT7jqDh95MmU59LoA91KgA3xoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a45ywKi6FJqMZtPSxbSIGtdkNsdls1QCAjDdNJ2SJu2HE/czh0ZYphqlwfI93lTqGOUmuqBCAqsXA+cYKws9XGb3rhpoT3wJKzpE8VArCkhyMhQ3GfSx0jAWDNo1RbxZ2BQ95h0s2Kv6UVHCOG+kS7ncualZj4j8X507PA/q6Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VJd/5QMl; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohScCt6dA17s09hL4HobYG0IyoNImLtdEYPFcgP8tefK7/ZPiDKbXCE/VxJuIbVba2YJo8wABZO2SW76oJOu6RL6s4BFKYzZtbiGFZkeAH8veLl0TJDFGuWAN5XuzUxUhZVHFIdXcdsTJaz9LpTvykxEeXRDNDPKc3r54xVnCzRPnz/f1v51w7F5clIT5ztD/L/rK7NNWhNtCqOgfloT63TmCb2Vml65OUAEg+nXFbSyA1PJrgrGNPj1KahiBFnw7Lg8NjcA+I90regBbrCVXwTiIZj/rMuRKa6Bey5s3LnGa5hHvX87Rc5jEBlTrBWDzmo+E7frgB+6foAYgHVaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aeE/iMfF0M3z4qxQdT0r8h1ORHGusANMMvPc3nvCNM=;
 b=Co7jdg0bZFf1DLA2+gIf6WgOci/VAfIhp+PnH5Hs5hP7fjYo/ID1TI2KGVwqzyamqkESC8mFCEdOc+gpI4EXYzvPxvo+EA4RWtc+j/tfupXD6hOpPVMmacszp+WHltWSFoMbIaGGzS137lcVrV9l/sSYfoV9Ddey6b8dIE4AeFwazaTiQSAyzdZYWSi89rBNhwFakcgXp0LDD6afNELW55TipQsqqT8reNncP++tGOVlRhNZLmH/l5RutjZvGx6+AoXMCN9fK4y78vdiat+nrOE68+Wq6h4CgwHVa9Xh7fSe72GwY2x6cLE7aVx+yTMXCWQvtKD6YyY5rBlZ861w0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aeE/iMfF0M3z4qxQdT0r8h1ORHGusANMMvPc3nvCNM=;
 b=VJd/5QMluUd3PDj/vPzej01R0r5dCf1uWZgmuWq4asUelX2Dl6VBK7KYrcDnaz12mOgKqk+kofKUroQA0JVtxjvoCf2SS5ip5H8+fgNsqEVB9zUzwWAarQ2yI7QsNtghBTtk6m8jCjmbNPno0mrZgYdKeIHdWfaEphh82krOgvo7yK3rgIFJ5mMByKl3f3O3R2ZsgoufJSZ5JZMxp6hGib3lWBdfv+Y3iwgMf5jHS5y7YKz0V09IQU7elZurUdVcZ/A9Uydl2y/NqXmUmXNA/nuerln5+Dc7lMU3WVKXbAVRDm6fnvJAWy4ptl3XG4LbbR5TB/IolzNHKDntqNf+Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 20:01:45 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 20:01:45 +0000
Date: Wed, 8 Oct 2025 16:01:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 11/25] media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq()
 NULL check
Message-ID: <aObDHzao3Epdf2F4@lizhi-Precision-Tower-5810>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-12-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008175052.19925-12-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd2acbb-a4fb-4492-5bfc-08de06a5819f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?mRlf4mcyUu3ur+ZvYLQaoX3z9NuXzzPqDr6WO2SFQo4DIY+EkUiYhSCnFpCo?=
 =?us-ascii?Q?byghxlHRzK4mIbPNOYem2/rI6JLX2wQaD/l5N0kFI4kJkPfJgSwKR0BZw14l?=
 =?us-ascii?Q?JXCZsp9UJNn9S2R9R8f6klDXUaB/32+jqRc3d2wXoXpZW+9oEng1y5uHeBkR?=
 =?us-ascii?Q?E0ExZUOa+P/qiuHSGsNZVLkvXM6hNACz7xUjXRdLOttQ+NWCjnqq84eD8LHr?=
 =?us-ascii?Q?69puDXB/xbQjy6y8NjH9eglBTOvyRWEdSCRhhacN4dI6ibbtNWAPJc5EqIJL?=
 =?us-ascii?Q?SaZxVqVg+/x4A4BrcFDdS44rIwSFHzGkEDhGkGs1a5G76deqW4XlfAm8HNuz?=
 =?us-ascii?Q?xFKjK9nkhgKECZpHNxdSKe9aLgwpFIZn0/R/4r6lmFOV0HcJtu2+8t3GIYyU?=
 =?us-ascii?Q?qv5yfQs939DfjpBvGFmjph1SuD/Q820yBP9XYGHzPSO8365clpkEEIRV0QiO?=
 =?us-ascii?Q?Wq77gx2ivJCJWODYqTNlk6KtKBI1FO5GN9KZ+dm9NMryhIPws6R6L1Vc2EIG?=
 =?us-ascii?Q?JDkIgbvAlvnG3Ab40KLLMaflK203NaYr8BTaAwgS/9KcwOl49TfFP9yds6QO?=
 =?us-ascii?Q?ep506DlWFzDrP7eOgl80Uh8xnvGTpG8KGM3wVYl3DYhypgFkY8J1xgnmxX+G?=
 =?us-ascii?Q?vyZlqBk8FcShbil5jlSDqyIg2DXySSGZmwbReTVoBeur8ri4PoAW7EdWNFz3?=
 =?us-ascii?Q?MCe8JhDO0FGrEz7pTPtZvDCy7FotcjJZA7aqYXcWN/TCWT/9jj2SFvVvRMK6?=
 =?us-ascii?Q?FO+q6CzXQJQLL8VQxIUdTHPPsSQSRwH6qAMhtd79u5YuCdtADm/Zb5s4uEMB?=
 =?us-ascii?Q?Qyw50ivZ6IECGh/EC3oah/yEGHk+kTvg9xct3Cdi8WXhLoWDW2UfFPzIB59S?=
 =?us-ascii?Q?7UKm5sfy74TXO/n3lRiOLlZuI4IiZrWX2Z55EaSAyAv81Tu/Xnn1Usjsuj9p?=
 =?us-ascii?Q?laoipOA+KLwPGQrP/nKwLqBT54/ZHxtOHrvhbgHMTg12g9i2G5VSUDRCUaxA?=
 =?us-ascii?Q?WGdfWh5VFJfd3iAOvySYeAUHtivUhL0TJ74N3ltyMhSSywgYHtG1Cb+8ESbS?=
 =?us-ascii?Q?dKcyVVPJedcis55SdAHoLlfAG/AKzOUvbsMIubAo/ZMEnWjgSPjF4BrgInm5?=
 =?us-ascii?Q?hRyQxaSRuAQkN2gsnn34Gfg8jIZXlk27T16rGKbPGJJ5SMHpBkvla+riPfPT?=
 =?us-ascii?Q?4gMdsgTxrroBigVnBdLpEHyH2MXHqbAH3ryVrZaC4VMcspl4UNRiq2TR1Twb?=
 =?us-ascii?Q?QpLulwlXdXktonn+P4GQqwQHmwzPm6NUcgbWfs8L+wpD3HVYoTmyDlA0omZ3?=
 =?us-ascii?Q?vLnzj19b0x5BOADg20sATw9o0Ijdsj0oE5pQFTAuZYG+VhsgrRRSQQTxxkrM?=
 =?us-ascii?Q?DdaTw1gUln8Yu3Zhhog1ofAcCDD9G6wk3UTw9vZaDIcFS23TrJ7GIY0IWwNy?=
 =?us-ascii?Q?bXbUtlv8fnANWZ8Sz0oujpheDsdi1oSq7s5aUdkQJvain2RZsaEEWMVR9T1Q?=
 =?us-ascii?Q?d2biDwu52k891WITW7W/Lx2+pEJ9OrRNWAs/?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?NT1FxFiZGjcbyefnH7O4becIg0x4fmhbKIffhc2uDN/mWKxKTMRGCcJT8tOS?=
 =?us-ascii?Q?JeE4RpikA6ixfGxkjZy5Qr5pu7yUdWTF6FVqDb1E5WHG+cy0GKcBzKCpY8Vu?=
 =?us-ascii?Q?BOUpOKwy7D4dsyQW4hsijXAV4+0xzrQKsBe+K9AdZAwFNw7sjBZrya3lxbaQ?=
 =?us-ascii?Q?DyxfrQlCtGOKQaIFvgFd7jaMp0Wpc6PlzJn9+P3ZdfeWvJ90BHW2YgFU0c0O?=
 =?us-ascii?Q?7Vy5ijVY6fq25RSREsvhocmqjXRnZUtlL41S1lJpgnQY9CXCXFerY/xd1cos?=
 =?us-ascii?Q?JOUI9VYApTEnNaYmi5QvheeV840lWNePV0+JrLEcWW6KfrUbINKeyMgXWslY?=
 =?us-ascii?Q?0UzpzVNn9EgnDTeUepQrLEyA9o+pCgbUcojCQVVzYm8CfuT/DzGdtjLjjxb6?=
 =?us-ascii?Q?wlUzhBKaagWQGyoSaG/7DrrwTECO9jwr2/3k2ZGW846TELqQqYyixhT5Lc7d?=
 =?us-ascii?Q?2Zv1HrpUUYOZEdesaIK0ilcqbi8Fn3GFfS00D8MXoXOFeye0TM1IpeR+Axao?=
 =?us-ascii?Q?0Zcy3OTNQJH6fEe1pjvfIq1G1XBDjCQahHgP4s+xX6UOq9ktDguEGmNuaxCh?=
 =?us-ascii?Q?ZV2Cci7JiulvVNkPONYNiQgpx0CH40OpJVThhqAADrqCH3MqksHPvPYS1wBH?=
 =?us-ascii?Q?L+v9hMgPZZirhfUk67rLST1BSZPNctXwEFCWUnYsMWesPnd5Rb3/DZ/bf32I?=
 =?us-ascii?Q?1JAG76jZTKFHB6ZyjsIKTsQf15/iDE4xCFjUyzUP7hWwFqhB5iktGogIzyNm?=
 =?us-ascii?Q?3cAfE4NUVxFsTGKVOMJdsENYyETygpm92VpBWNIGTlkEQEx09Zl8UsU1Z8Yh?=
 =?us-ascii?Q?TVUdsqeqVax3J02ktM/J2FDA0gBWdvoMdSEheP8O8pTUxGPo91kzxuJ8ONPj?=
 =?us-ascii?Q?GA1LKzPUkX8zopsrnZXMbI1pGKURVT9kxi7ZDsYDfy7sQ+1SsQ2NWnqudDac?=
 =?us-ascii?Q?lmx+vTQHxF69Pw948LSVqRRwoLhiCtw37fyIxHkdAi9h+dOPuC6ZGnj8AzMQ?=
 =?us-ascii?Q?bxFu765W2s2d77B8WWl/D1Gh67xlaKzNkMtPhdH4cJOpcn+r7shm5YUyFnpO?=
 =?us-ascii?Q?e7CmeHz7S7WZJSaq4Y9r94PtR3GHWo/6mMskJEdALa6pMbX8hmvrtyrtEzal?=
 =?us-ascii?Q?a4nXZpsC/iZxfvZyTyxshmfVyuQm7U9Nhv/+MyA44lFNx+U579PNGfA6Zyuo?=
 =?us-ascii?Q?0T4FuyI0iyNJjOG3P6otKPOQtVqu+CXWqQSSlc3WKjgAiubxYdP120SL3+NL?=
 =?us-ascii?Q?h/EIm6fc04aLKD69kRbYZZLNls9rBIhufD1SErsIN2k4ekLlQv0WnmYB3b3U?=
 =?us-ascii?Q?bZ5XqYZQ7gDmgkJcXrG7A50YeoksltUwF01SCUadkhA713a1RWxpLafM5yx0?=
 =?us-ascii?Q?AtqvyTHoljdQ1uU5DWjbnouZZlRtVmXxf76UmlUNJFwpWQDhHVsgICZNdtdj?=
 =?us-ascii?Q?i2RWHhh8mx02ngO3a1XcXb2hjUicclylqKEBTLxYE0HiOdNfeDayKfrS4L95?=
 =?us-ascii?Q?ZRNeMnftmIdN7jInudDgC0b5cf8mabm35kar8whf8veLRvNz6dxD+D2uqC2O?=
 =?us-ascii?Q?lDE6+YRkBSakgI6EfDF9li//0Xazxac9HGfRTvHH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd2acbb-a4fb-4492-5bfc-08de06a5819f
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 20:01:45.2809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiGOQJxZes0RGRLCjYy6bb52m8iMqX0VDA9H9+HELFW4ylLzLNuvg/iSkYMEIdOXononclgDyI5UfWfYeoU6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849

On Wed, Oct 08, 2025 at 08:50:38PM +0300, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 8681dd193033..37e0670f98c5 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2492,8 +2492,6 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
>  	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>
>  	if (vb2_is_busy(vq)) {
>  		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
> @@ -2529,8 +2527,6 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
>  		return 0;
>
>  	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, cap_type);
> -	if (!dst_vq)
> -		return -EINVAL;
>
>  	if (vb2_is_busy(dst_vq))
>  		return 0;
> --
> Regards,
>
> Laurent Pinchart
>

