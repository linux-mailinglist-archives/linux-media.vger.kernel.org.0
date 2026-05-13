Return-Path: <linux-media+bounces-61549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMO7JGLuBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:34:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D653B137
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBB8B302F256
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7955D3B9943;
	Wed, 13 May 2026 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U/lND9Ty"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31B1B4224
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707941; cv=fail; b=uhBE/KcIneCFJ2dlrdAnueHgaagyHiBoQsb6148X763dJjkdSeBFbez68+DI2oRda5H+NvmTa6IVooLCbIn34dSfH09dT2yVHLuv3YZxxgtOOyksua2Lw9eRKcFFjsp5ezURUSWgS6Sx/BAeLnYqpr+f+qQLEWOOTL0RXl/qh/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707941; c=relaxed/simple;
	bh=8A9BIUQaylhYPojfq72f6YaBqbz/NAmZLM/zDJDgktU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bJX7bFnOq7u3sIYB+Rj5JJJvLkutvnrRU1iP9Xfb6hnD72uHE0zYMZ77x8aJGCBxRK2SNEDyuIpOAOsv4g3rb6Vo7U2e5MXV5ssjXrrGQhCj9BBxevlQ3NDZef+QOYqFeZG6Yokg95cX8FotpNHhMPelGcnA4Fj4FFJ4LQsc4z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U/lND9Ty; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6i+XWmTeomDS+hJbjuhNxXpaB8Ic+jxJl6oIZqTRy5Mtz3t4L/X+PRLvS5ANoFTn1Zmxv0Kq5wZBAJoqadFsTEEMA/7X+NRbpO4efB5Br75N0MU/S/bWua99c5kIzom7G8bHKFuKFPGBb9aNW1xoj5s4Lb18Gpmdx0dx8/i/buBsFrDroSX1CiCnstPlWAZZXYjDjLs2wojbFK/9IjmjuQd4yYaETtC++V0DOxYFHd9qNFyVOaN3pP7qyPe7b5tqSS0y1oC4s8hC5xPeWuVE/HvyYFy1M+Hmoa1mxyR2r3heH0GCzhKPJiKdGzeeXtYBvK/bvjEoKHv8hfbNBFK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqO9Jh4OL2QAQA3moV0H6r+9xt+nvmEQwjeMSJ22n2I=;
 b=rXziwkQ7AoNXkUr7065RuQ1vp6l6KCSV42l3vGffJwGk+c0+INeA73oY7LLvaJ1gzxWoFjk2xwZduarTOO1D0IEck3KY/sejSQrZ8EW+dA35LyrRDT/qM57N2OxnyRkt284OUd0emma6on1/lpUNcJMYYS0/Zoah4Fd7anQWFjDoGJ24/5lteW1WFuxDaBbZo0a0zFWK25jgdPABZln2sjVpY+xy2ot12jtCxJXk0IDEPpSqpiSQRJ0RovRvcsTQtKv475axr8xdqU/5TRbKmCTHXAsrjHDy9hzswosCiDyWqdVxj54WpKg/wBI2jK6JikC3yuitCY7tfcWiMziU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqO9Jh4OL2QAQA3moV0H6r+9xt+nvmEQwjeMSJ22n2I=;
 b=U/lND9Tyop4MDocL/gqWV8b71Ln5rzuPYYshNi4hcJaqiYRryKYTBbQKwi8T0le75sZGheuU6y6tT+lEhSY5bKdBvAnvZb9xYIclDcB27Pt3OhZY+sF0V0aKPq5Xa2HY+nTotKoNMxP3hnG0EsP8BCZOXZ6f7lfzSCRgyq0ffxSuYO8edfAqeFjAjCep+57B2rtOg5jgfzvZsADkNaQY9ijDHhHzvQXoBLP7HAhlMsQDtKfGq84j+x9fBwvEpGnWvsIlk3dS4+ibgXtgRLpcskIlwIi687e9u2g2p+eDAAxJ9mEUhtetQgJHBdHsrfBsoo5psD3BkZbvsAnqwuqRJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8065.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 13 May
 2026 21:32:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 21:32:16 +0000
Date: Wed, 13 May 2026 17:32:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 03/17] media: v4l2-subdev: Prepare for changes in getting
 frame descriptors
Message-ID: <agTt2mx4AeypX7tA@lizhi-Precision-Tower-5810>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA0PR11CA0142.namprd11.prod.outlook.com
 (2603:10b6:806:131::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: f491bcad-2ff7-4e52-21a7-08deb1371ac7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|19092799006|38350700014|56012099003|4143699003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 ObSCpnloRiVuUtdobTV5GwcH/1nZm3wujnt9pT7ShKiwEUE+2dHAMixmF6JhiJZpY/satxalBmRCHxttrpj8FcvfcIJwubI98HMo6pflPTv3NFkiQUuVMEcAKoEs6rvnlF+KFLo+5e8QNLmfLKTFKlMyuOOnrWEhqprOBNTHY4IlZr/5ZirsvIFNYn47hUjcJzSyv6MQPe0h4ZWaGdCmfbOC61fmkb/DLiyuaZJJd9n8voimVZjwuBTwMhalivbc0KhlCr9PtqyFRY5PIfS5I9ETkB28reO6uh5fQuoQ0QLQ0l2l8AU4ppCeNyQit3H7bo5shBG6LAWd/7hGbURIZUj/kTdn3fX7aKXzChHp2FqSFFFGWsm/1L9Reo8FcmHSy8HIGnLtDI/Sno84b4VAhRIthZHRhnlDxNQWdg3PIxAYUr7AidBUkI/A/GNpKcpokFVroU2TSLncGyzbSQVZPgtakrnxaoF+urbLSpFBdbwOD8tYMDHYD+7zXm8LUONMVJz7e95EJ/FRs6E3dG6sIQcv+O4yNhkQPhiSwzn+qStMeVQeQRd2F89tdOIQBmC6OO9vXGlIQAH27KD9JUzZ1o01DA1Qhw10vdg73BzMrHgsoUAFF/HF8QLM55OYQIaQuTfmFDO5UNMhghz5Q38MbB9g6ByK4tfnb9t/qFgq6chwk20U1RWj2cUbpB4jMYMjoC8K2B5BTJecRK3OcWnWNm9qTjj59ge4Rj3TwZ7KZTA/bfzIasTobfNw95ubxnUf
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(19092799006)(38350700014)(56012099003)(4143699003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rDhiAmqCNVRYmDvcbGSiPnqZa1LN8HBfHeqFYUSG+88MmUEbMhvquo5mtXQu?=
 =?us-ascii?Q?xaPmg51xvYkcTV1iqaru6yEI9ESlEOwDveNDc78q/OeyotpxF5UXZlQ+Wz+k?=
 =?us-ascii?Q?ht3uXxrm+XeFvNFSycnGZFJ7BStgSCGhHIxi2E3no8X8inVYEWNIQY4vih+i?=
 =?us-ascii?Q?X5r7swg/DvxV13FxFq7EeFhcAzSUDhTsn2dbhle8rjo+DxeShwvU6FqB7v8F?=
 =?us-ascii?Q?MMJe1NHGha7QzSvJGMsrJy1Oq//bRbxI9mGJQIkNp7GdfAjTfhhTbczVk2wM?=
 =?us-ascii?Q?JiMO7eGQH9RoZQueDEdUyz9hFpV/g3hfU4zdUt2IzdJB3BTXHXHdgpCcWVMn?=
 =?us-ascii?Q?G+d9tmmACQPye8xWkjy2jbiKS0wpRJ47Tb9Fesk1UFErgnA2Fg4cJ4mnRe7W?=
 =?us-ascii?Q?6gS3YtAA82IuV9BsdXSY7oL4nTQHZXC5+m7MvZJi5PLFq4+ktQnbmw6HC6rU?=
 =?us-ascii?Q?6EP+6ZNVCfgY3RTJ8eZbzx5s5TIOK4HG8IeqpqUAWmeKQq20NgVrBUVQ2htj?=
 =?us-ascii?Q?Z1XpuiKt+RU4CoGpAxUfxEmZllRHK+d38IbA/zV3r7aTaxPcniuaOlSdUbVN?=
 =?us-ascii?Q?mz/JBH434CB81AO8nHWJCEnIfzIuumoWgqu/Rbmwvyh28x66A5jzviPOEGcD?=
 =?us-ascii?Q?c/yKK8ryrYTxgPt1XUX3lSFa/fDmbiZrNYIdw1k0bM2gtcrT4T9EJsQVVa57?=
 =?us-ascii?Q?H1KWqNn/nokvLo+UBKuv9petfF9IPIacjSqvhElYWlHsGrO/xc2ZL926ve1I?=
 =?us-ascii?Q?puHxI/xujqJK4AFKhvNgF6JZ9dSaaTzz/ME9zh/YcKAt+wOHAFxc/yJVJLmT?=
 =?us-ascii?Q?FR1BEaJ4kCbGZlTOVNoQl2PmCzUwbCrRlstDMOjvaigVZrIUPTqIwZ2mIJxy?=
 =?us-ascii?Q?GFefptzZSc71PQ3XiLs2eX0+sLeXTs1FfF8RNPhW9QYM4OB7WU3grxcUXrTs?=
 =?us-ascii?Q?bsZNLkCufcnNHpy0ktlnNOJ577vBnbDJIIfymCPPeG2CuhDeqzI3Iaj+XemU?=
 =?us-ascii?Q?n0VF0rZ3mtU0oXTS3iJYRRdyfyvRm1TfNXKfCsswfJuJVZpvRUgaMG4bynbT?=
 =?us-ascii?Q?lcn2BXFYycCTL2EDJBrWYODHRVx/tjxt6Yg4WGxL8bZAxEAFtVspa1T9hRPS?=
 =?us-ascii?Q?aljSmMgiaoh5qq/4NfhItPEZICFtUVA2dw+YKzu2ZyOhY6REwVcAOQYmqEzu?=
 =?us-ascii?Q?8VqH17rxL42RMiEFXgvCuIeG5ZvTQ50WN0dn8eHi3CtYqX0tyjPYHiwIewEl?=
 =?us-ascii?Q?W26UOxu4w3Hwww/p3xL4CZLsaKCUbURf7YVQrUD5zf9RawD/XAH5iJ5tswh3?=
 =?us-ascii?Q?bvuFMBMMA4gRaUd1onMchWMVkGyB60qvwtIfc1F36X5IQQ9+CI2AAEPejfpt?=
 =?us-ascii?Q?hjzCzokkgb2GL5NbzUm2PqwtcGlejKSBGq6lcbCodk+O51rTR/gwf8IF1OhP?=
 =?us-ascii?Q?dkWI99/JNEtz47ydsp9fExwN7dkEbu253cfAfxBiTIKKy11KW095Estr+/cx?=
 =?us-ascii?Q?nJtYy0QgwXBJ+S0HaDPjCN8MV8d1TSfAU9iqPTo40vWCWrqXf/dDlLs1b84b?=
 =?us-ascii?Q?VwyLOTXKqlkCAhfa2NcON0wtVtFUXrml9LxEwPTotLqqZA/yNa6SsE88IqJN?=
 =?us-ascii?Q?E544sZi5+pmrhh47hPfZK49UFTz8+oOpeFSI5kuly6rlR9tAHx7T8BygbcAD?=
 =?us-ascii?Q?E0YdhvzHThQqqXWMYupWuiQ6AOhtPwW2eGmABQvhcseNyOKxw4FhRGBjyERx?=
 =?us-ascii?Q?AhFxX6P5Yw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f491bcad-2ff7-4e52-21a7-08deb1371ac7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:32:16.5074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWuQKcwb43HAOhAA/FXdjPWwlEr7k5KUd4NyWtPyT9IMSVf9SgjJ+RWxfdRBsaTxYo19nJyzCz8Komet8ErT1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8065
X-Rspamd-Queue-Id: F22D653B137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61549-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:43:44PM +0300, Sakari Ailus wrote:
> Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
> to both facilitate implementing drivers that need frame descriptors as
> well as prepare for having a larger number of frame descriptors.
> If the remote sub-device does not support frame descriptors,
> v4l2_subdev_get_frame_desc() creates one (with a single entry)
> opportunistically, thus avoiding the need to add frame descriptor support
> to sensor drivers the device for which only generates a single stream, or
> managing the situation on the caller side.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 20 +++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d93ed50255ed..b8acce8f9c33 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -2671,6 +2672,64 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
>
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct v4l2_subdev_format subdev_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = pad,
> +	};
> +	int ret;
> +
> +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> +		unsigned int type = desc->type;
> +
> +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> +		if (ret)
> +			return ret;
> +
> +		if (desc->type != type) {
> +			dev_dbg(sd->dev,
> +				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
> +				pad, desc->type, type);
> +			return -EINVAL;
> +		}
> +
> +		return ret;
> +	}
> +
> +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_lock_and_get_active_state(sd);
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> +	v4l2_subdev_unlock_state(state);
> +	if (ret)
> +		return ret;
> +
> +	struct v4l2_mbus_frame_desc_entry entry = {
> +		.pixelcode = subdev_fmt.format.code,
> +	};
> +
> +	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		int dt;
> +
> +		dt = mipi_csi2_dt_for_mbus(subdev_fmt.format.code);
> +		if (dt < 0)
> +			return dt;
> +
> +		entry.bus.csi2.dt = dt;
> +	}
> +
> +	desc->entry[0] = entry;
> +	desc->num_entries = 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f84..c9e74566c85a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1778,6 +1778,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					   unsigned int pad,
>  					   struct v4l2_mbus_frame_desc *fd);
>
> +/**
> + * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
> + * @sd: The sub-device
> + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> + * @desc: A pointer to a frame descriptor, with its type field set
> + *
> + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> + * get_frame_desc pad operation, its result is returned, just like calling it
> + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> + * it, then a frame descriptor containing a single entry is created using the
> + * information from the sub-device format for types
> + * V4L2_MBUS_FRAME_DESC_TYPE_CSI2 and V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL.
> + *
> + * The caller is required to set @desc->type to the expected bus type.
> + *
> + * Return: %0 on success or negative error code on failure.
> + */
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> --
> 2.47.3
>

