Return-Path: <linux-media+bounces-28930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54FA74CB2
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 15:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C63F3AD5AA
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B0A1E04BB;
	Fri, 28 Mar 2025 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JXoPdMPB"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B6188596;
	Fri, 28 Mar 2025 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172152; cv=fail; b=sUMMc5VGD9cp2eTqYBM3e7tRJAqlhmRqXmpMTDRzDh+s5ozVmd0vPIAALxB3ihJIy4zst35r8cLx73Dd7SaWIXRSr1hKuaDseATDSS+usXDVcjLXVYXOdR+wvKAp40X74FBKN56etwHhianN/dgRIF31uYn7yOJmkhvMzKQyfpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172152; c=relaxed/simple;
	bh=01kDeITrWffKJ7ZiHudD95qYlkDiEkF8bDSuvgO7nTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=peckBB65w0bauZe+XeysBAMilnJsVRoES4Z0b06j0mSesb1s61JsKtEX2IsPrzUtlLQSkvNqMl2HRQwUC1Luy1wuGR59fR+FAj9Co9T6iN8P0GtCvP92eqb6WIBYCK+h4Nth7i0z/nKtu5rNOorwns6wGr0xgUkxIJD9FZvfXlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JXoPdMPB; arc=fail smtp.client-ip=40.107.21.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDxH6NUqn1vMwkV1ELhnSSzzeUbul0xFE6UVjy4dVWTC98xfpZzkgA4q7dMgcWr90u80jLX+l4b72OEqyWtiUFWQ/G4xwM0ovQwsyiHze/jlHIE/ZsIhfU2unilMX5k55AkbEQ2498cXkBMxAkx46GIySK3yMqsJoa0SL8bGIUYTLkbQmg4JVqxUpuMXxnNa1FzGtKq9fwIrGrQaWxqPy4KupKuOiZ653uqSxGdY2SKW+9cqQeJx/fJRCfoXOwhT/sxN/8hF0EyvIoMCo5kNbJa1JXfUqyqNJFOOBxeg4BsZ5vzul9qYLsJJzxrYUUL462vCdsrkljHJ8JmibInC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCKyeqEe9pvWxReQTskGH+j83Eh+gBbkPfgVdm6wHUU=;
 b=N1G1UPdD/5RTH5kIh+uek3Im/yV547gYJ02Ki2wjB3utS1OVp1qDGGkQ25e211drXafiXv+3Ygk+hWQu9KBADD6avjBKOuAKRJgaELabCtIquFkwvvFu0Dnpk/A0abYw8k4RCP8i1/vPo4il/4ULuJmoBZwoYvJgeXmRGhPMrsZcGE3YUhI9NkxJyWz6OjAKUrKrvYmyrpNZNCzYd5uq5nSzRz33fvpeRhG5ZoOzgDQdiYWC7fYiZLTxMWc/bFE06eOkCiZOdXAKysBiF2UU+ez6Is3WiLFPhhsEtWoutuOjjT980H8aYtw7dZtioa4Mvf/ZoUWX+lWFjMUxGP049w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCKyeqEe9pvWxReQTskGH+j83Eh+gBbkPfgVdm6wHUU=;
 b=JXoPdMPBYuH6IhdMVbYyet8VmKc+dOXazk8LYlvao+Vhj1I/lexYqatluNZ56Cf00RRcOrn4mOwkKk35TCyTBp7EgyL2OmKzJUVJNw5QLXdlHducua6xqynCHOgB4ou4h0FE2MI5CHax5TKa8A2Y3KY7T7cJbSaCpkXWdjyPp2hoY9pN0No2fyX1/pAgudeDnc3IrSl7OkJ0J37Vslvy1a4xfz/XMr9gQ1nAKg0gZ+zM1cnFk98yWXR4K/NdE9y/4fo1R3ag11dGw6qBLUcvuzJeyza//G6JvQviNgpl6HHwRs3CO33pfbYJpjlEJOvJmkZbPENR3rKWCC7+gb8G1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:29:07 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:29:06 +0000
Date: Fri, 28 Mar 2025 10:28:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] media: imx-jpeg: Change the pattern size to 128x64
Message-ID: <Z+ayKvoPYcc3Wkt3@lizhi-Precision-Tower-5810>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328063056.762-3-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2b80ee-24c8-411a-20fe-08dd6e04e4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EYCMv/xUDceRtPoNqKSPS9h/RAqE54orFM1/XpnyB6Fr1upZbQWZaBXr1LbV?=
 =?us-ascii?Q?ekZ6mTk8DHzHPWQgUS4wAYjkm9leglSjOHhRqOhfE8/BtGVd2DaPJYNw3Tn/?=
 =?us-ascii?Q?m69Cvhu+4of43AWytbmV/JYLttHEehmiB5sTw/z2vMVtJzNoE3Lk4WNpERyb?=
 =?us-ascii?Q?7PD9V0eUbSZZDbgWbPms4pfczL8L0NF6zNPaRvkWCYL5YUPRJOpWqE78A3Sd?=
 =?us-ascii?Q?kUvkcDbynQK2RUt0il/PtlGANvV6zwrewCimUeA3+B1IlfWtIWE4xt0q8x54?=
 =?us-ascii?Q?MTEqTUwZlr3s2rDvnIl1iTkeU5kYor5sc6sO2I7OCaw5+xPduBgBmhszjSY6?=
 =?us-ascii?Q?O+ZiegMpyOsfFdDihvBBrjal3BAIB5+GYlPsZHthBqPGsWuTsdDEMVRQ+b2g?=
 =?us-ascii?Q?w2VzcCUzUDNdbSMNm0lIFpfxAQY4ZaOfSClLIQMrzLwJkIRiGrS11U9ql3U4?=
 =?us-ascii?Q?3lEKcpk4vM64keQZPL+aNRkKu0P5k7VDXS5yNx5xcNJOsCaY7KR11KUg32U8?=
 =?us-ascii?Q?bpPmMTMdAFRU1pdaztr1o8pb4czDCbG2SK4bYKjH1nmDJImFz8HiwVhbgZor?=
 =?us-ascii?Q?qHw5jIuahlcmO1rk6w+5ZuSnQUEdJRd0dhv1Otkf44PXMbE4tnSSA1YPV00R?=
 =?us-ascii?Q?oIZPl5AmUCZaPQMCyU4iGbvGBCf4XvrwqtpyuP3Pua5vMMp5OaQttXebYCqQ?=
 =?us-ascii?Q?Vmq3OAe9PMlHH0rfbhgfqlSaWDH28Jwc+TiaGhJrlDxGHJKIpsTMICTVxUqL?=
 =?us-ascii?Q?O8VEnYkAqkeMzrirhmrDT/uqmWJLGrorRp2kN0FHHLYNJMMgAmlfbo79rOKz?=
 =?us-ascii?Q?sqvbzyhbEOsK96ip3Gldh7M7K2g/2o7s0H15et4Htb4cywa22YK5/wfF81fS?=
 =?us-ascii?Q?QmSFNolV3FGBY8KUip+VkYvyZrMhrHDWO02r0oS2gqmqD1Zlz6qzdJFJb2vf?=
 =?us-ascii?Q?+feHHBRx2a7GMi4wKzButWxjESAvh6+wbfoGX32Xc4MI9lJLLYnN/QJLfvBA?=
 =?us-ascii?Q?1P6FG8lKOAFvrunHJ/f48DOUsMTtkn05lvJ7XAP+qX5MsdZx8oPffN7K//rO?=
 =?us-ascii?Q?a8D1Dx4rTA6ms/yFRxbZ6DIjzaELUuqRd7/V0L0p50JRqEu/yciyRvDM7z3U?=
 =?us-ascii?Q?7JUpRkNoAijdoXbCLeWn2gYON6/zMUrJ8M41vVZY7nTiQlwNNepxYOVsWwUD?=
 =?us-ascii?Q?qgxk2tQjEdBnhmGYCs8FgxGXLsv+pL5itjxylpAPFor7OojCJ9tS2efxqKgQ?=
 =?us-ascii?Q?xfCkPrUhvmj5uvdprpV2MC+T+JIRA2hcQ6ZyZ6HCkRbjFixe6Jdn5j9R7591?=
 =?us-ascii?Q?J8iAyWvhew/nMkC7VqmLJyf9zQ1TxHwH/lHt6ljDvi4kzKOArREiJ+Un56lM?=
 =?us-ascii?Q?9CZzJcf+NtfwGnXTcyPATTVR67d52byfpEE6JZ9WPSu+63r1bQfaSyvuQPum?=
 =?us-ascii?Q?dStOV2ry8L5hth5GTTp59Cf6Xf0d5q0H4zYhWJgzU8RKKgq59vUEjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cfk7JJoC1dxaVxECHMy5ra5dVYUqTrHboEMk2d7v914s8kqriz9J/eyBVK3O?=
 =?us-ascii?Q?RleBtWF2HsJJMQGl9Jq2jb77dW3hcYEo4hKRWqNEIq2j/J61HBaA/7ECTV9z?=
 =?us-ascii?Q?GVuWpkPG1069lfz3OEDgiyXVXucmxnotXqufZk/pWrRYZTtNFXpJsG5ARr7E?=
 =?us-ascii?Q?6Uxz2nKAnuWSUvkW1fP2JCiNU9u0yqFGpdjYfQ3LT6OBquHmzQH8OLIZ810Z?=
 =?us-ascii?Q?Oj+kKvmYc2ndTeDhWDlgVs8A+VTcyylUbTLaE8KZkOcL0VihkTT/sNdYjMVD?=
 =?us-ascii?Q?tPjOfoUojc/wVLRfUEJIJje4kKFGvhcK8ZR55PKPlOnpgmcVUEjB6WDoEI9k?=
 =?us-ascii?Q?k+R3zmoy7vO8qK8x9IalgqRJ3JIZPWPgmlzB9KLktLVkYnNVLRaOLDvAlReJ?=
 =?us-ascii?Q?gwcd7KczD2pn5SvR4t07yMUXYXPW4Tqy5/14VTLJ1V3juPf4EN0dfDpZmiWi?=
 =?us-ascii?Q?xE4cBFrpIvmvC+kEayxX+Ub9HWDD2mzx6YxyhWXq9QriVgdSJ6mmtVjsfD7v?=
 =?us-ascii?Q?rPovLT8Y62+x4SMVjNBLIgwZfVcySX48+PZ8RGg0zaG2lk0n1ScOxgnXPYzo?=
 =?us-ascii?Q?96BK8udfmGZrKj9brJAI5VSSmMZPv4GGiCUZOfSkLFfZ2EXm8uYRH6ldFmve?=
 =?us-ascii?Q?2tQlZi1+C2UxWjvoK6dIcAYypN/mp8HIYmf63s9QOedHzrKJlwKRw8VY4lX6?=
 =?us-ascii?Q?/4kiXN2TcZ6nfwA9kiQPPmqmliUc8Y4tjwUKM9JqveZCjxs6jhYCugy+KO2W?=
 =?us-ascii?Q?zCPGxYGwhnL9HWhI946iAEVRAGvTr825SP2xGHTrz202vgukpvx+ORgRY2oW?=
 =?us-ascii?Q?Ed5ApkKzf5h5evZ5sX4Y8ms0h9FFonkmoFWjAYfRodbgrzC75RXBbrLk/Q2b?=
 =?us-ascii?Q?fDLVFsEWs5+JvaZC7qWNruAYWInnwIxb8KUbkNnrK7/86/IyRH6XxCIn06Rd?=
 =?us-ascii?Q?S/Lc50QROczRv7Pb+z3N/Or8JnDic399KzTxpRjO5e3x91VV/6OOGEAt7U5p?=
 =?us-ascii?Q?7TVnL0oE0CzkjNe/xnZCNkd2s6S/IrBnHQJdGWsC2fzzjdrE4KQEmfgorJzh?=
 =?us-ascii?Q?EE8zqQe/Yt1Tq1Kr/iP9SvSFeTvDU2Nc/ZYT7JTCSm4wPzRcAfnnOyJ/yE4K?=
 =?us-ascii?Q?uZgz+lcuvdADWIxukShDpR5O1klvurPitaBCHy6QYumT2zy9Yh33LsL2kA/s?=
 =?us-ascii?Q?eLJ9WX0wgPO4KV+o4NFJywumFGWpDY6ebhFcRI4Wj0DR9NCOY5WYXVbPSTJ+?=
 =?us-ascii?Q?78hDZLWl2uWTfbxJ02hzKMKtLck6TqiuUlVMwsbB6AplkdQ7nNPR0xe7rt/I?=
 =?us-ascii?Q?GQyFDZAZHW4DBHGwY61yneYe7vkdHOhwIpqmXrCw3bNRDQ2DbNleabG5dGT1?=
 =?us-ascii?Q?EOoCUf+wxfQYLeXS80W+rBelIT4irNOBkNwX4r/f8Ihht7OGPHgpR0dJzK4V?=
 =?us-ascii?Q?0XGgqiA19YCa7V/5x9Czm4HeyKLA2tXfe2oqqwxEhPQx8qCYlZfvNJ940Jr2?=
 =?us-ascii?Q?q9E0CW61D5Xr2TXgfBcroxDIZUTs48R6w4PcuyMDh/7AX0ba1Sx/ihNBdeds?=
 =?us-ascii?Q?9RuRJbrx+76d6lPcERLqI7KSp1el5IlwkiLjh+Jv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2b80ee-24c8-411a-20fe-08dd6e04e4f9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:29:06.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nxDRTgC86NTM0gf3u4oyPzyTTLZOfIW7z5JAjV5dah49wds+ivFnwrJed76ZKW5TFavoS1ERyw3zF/h6Vo4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

On Fri, Mar 28, 2025 at 02:30:51PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>
> To avoid performance loss, use the smallest supported resolution 64x64
> as the pattern jpeg size.
>
> But there is a hardware issue: when the JPEG decoded frame with a
> resolution that is no larger than 64x64 and it is followed by a next
> decoded frame with a larger resolution but not 64 aligned, then this
> next decoded frame may be corrupted.
>
> To avoid corruption of the decoded image, we change the pattern jpeg
> size to 128x64, as we confirmed with the hardware designer that this is
> a safe size.
>
> Besides, we also need to allocate a dma buffer to store the decoded
> picture for the pattern image.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
>  2 files changed, 39 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 12661c177f5a..45705c606769 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
>  };
>
>  static const unsigned char jpeg_image_red[] = {
> -	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
> +	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
> +	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
> +	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
> +	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
> +	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
> +	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
> +	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
> +	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
> +	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
> +	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
> +	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
> +	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
>  	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>  	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>  	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
> @@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
>  	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>  	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>  	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
> -	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
> +	0x00, 0x28, 0xA0, 0x0F
>  };
>
>  static const unsigned char jpeg_eoi[] = {
> @@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>  	jpeg->slot_data.cfg_stream_vaddr = NULL;
>  	jpeg->slot_data.cfg_stream_handle = 0;
>
> +	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
> +			  jpeg->slot_data.cfg_dec_vaddr,
> +			  jpeg->slot_data.cfg_dec_daddr);
> +	jpeg->slot_data.cfg_dec_size = 0;
> +	jpeg->slot_data.cfg_dec_vaddr = NULL;
> +	jpeg->slot_data.cfg_dec_daddr = 0;
> +
>  	jpeg->slot_data.used = false;
>  }
>
> @@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  		goto err;
>  	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
>
> +	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
> +	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
> +							   jpeg->slot_data.cfg_dec_size,
> +							   &jpeg->slot_data.cfg_dec_daddr,
> +							   GFP_ATOMIC);
> +	if (!jpeg->slot_data.cfg_dec_vaddr)
> +		goto err;
> +
>  skip_alloc:
>  	jpeg->slot_data.used = true;
>
> @@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>  	 */
>  	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>  					      V4L2_PIX_FMT_YUYV,
> -					      MXC_JPEG_MIN_WIDTH,
> -					      MXC_JPEG_MIN_HEIGHT);
> +					      MXC_JPEG_PATTERN_WIDTH,
> +					      MXC_JPEG_PATTERN_HEIGHT);
>  	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
> -	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
>  	cfg_desc->buf_base1 = 0;
> -	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
> -	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
> -	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
> +	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
> +	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
> +	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
>  	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
>  	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>  	cfg_desc->stm_bufbase = cfg_stream_handle;
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 86e324b21aed..fdde45f7e163 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -28,6 +28,8 @@
>  #define MXC_JPEG_W_ALIGN		3
>  #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
>  #define MXC_JPEG_MAX_PLANES		2
> +#define MXC_JPEG_PATTERN_WIDTH		128
> +#define MXC_JPEG_PATTERN_HEIGHT		64
>
>  enum mxc_jpeg_enc_state {
>  	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
> @@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
>  	dma_addr_t desc_handle;
>  	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
>  	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
> +	dma_addr_t cfg_dec_size;
> +	void *cfg_dec_vaddr;
> +	dma_addr_t cfg_dec_daddr;
>  };
>
>  struct mxc_jpeg_dev {
> --
> 2.43.0-rc1
>

