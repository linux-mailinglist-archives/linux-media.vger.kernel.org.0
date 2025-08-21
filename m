Return-Path: <linux-media+bounces-40629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1DB2FE34
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04C917B4F0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE19B26E71E;
	Thu, 21 Aug 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mU7eVO2C"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198424466C;
	Thu, 21 Aug 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789461; cv=fail; b=jbIGbHr7daEUNyUxLSkFpeiHj0sduEe2o0003iVk0foO6xv08wdqJ4FgruB9PIvFCXJ+pf4lRihmBSQZ8RI1yGRsKUfhNwUvi0mGWBIKYiV9ngE47CkVLdqo7GS+BKeXGcGY+fO3DzO4cwvDFsK3p7R1XTF8vbPmi3FryUowVLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789461; c=relaxed/simple;
	bh=Bp/7Yl9W3i1VyTnrtJqVwGMXNZqmBp3vGmpCBIEWnjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eF2Ys5fCGTpZP2hJm8+xRJI82SyCIDl6zuC3pf7Iah86yXyDqgFk+z5tXtzSQ6qjQ4FdgAFWiG6CpEo6hscJ1zeV12IlTrDgNcND3qFQk380tWIccnJsNT4CJXoUreYmqhxIl9x2+DWw0GmcPKwGTyNNCKTxfSL6/tfOgzwpqfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mU7eVO2C; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZxXaS+8wxjCRFLQEZDZOlcMHj8Z3QA4a9K8l0yme6NuMBH/RqnXl16juSE62m4hmctZDBVZz8DxVYe8IYVYqCThkxJ5jnojTkdQthSSFcW9gvflhEVEvaU7TZFSi24deb1ROpGuhPxJ3EZJDbzxHnX1ms9dXqBvJlfTVV7RqRbNjsgAoQrQm4K2PWBcuR1yPMpXEXBQwWCopmsjz248iHvlXMW5KpDWGpLgRKJWGxFOzzbBDHc/eYDb09H0Fnrb9SXYXKDpdL5Mne59aLaBiw4+I+pF6g3QqyLc1PBk62OHw4gG1N5kmzhOGaSHj+QMvdlijD3Z4WP523gNvdDEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9A5r3pAPRE4RAEw49RJijJBWD4fj7aG831Fv2dBq0c=;
 b=KPKt1G5OlBpDM0Jd55pBDqiXjdWAayW07pJWY986aCjs1aspUg7F7rNzfiDKtaIPcb4eT8cEK/AHOnmJkD/0zortXbibVh553ZZ6f12vQqZ0f5wS/kp2cGZjGxQHu+602H8kFlHVuhxehbn6ShKbs6Z+2q5B1EGTqzsFlD524X9U/weqqtIisK/d3bzjCydIP62L7NZKPmrSnDmoPP/mJImJNKybyZlwBQyEu2wnb/T8GZVOhTDxLFQ+YItHFuftf9Ijh80uX7ma6jTchxNqtMiIx7F94nP61vMM1sgjAnGotJzCPu02k50NXcuHqOuqYzkE9qIyJbB0YexYvKztbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9A5r3pAPRE4RAEw49RJijJBWD4fj7aG831Fv2dBq0c=;
 b=mU7eVO2CmQ19qD5shRFXEXHFGJnKKhXaAiH16zr/EAYiqfci7G0kgJI0Rrc+XH4fnfHPS4CPFCYarCynYLa8xIROjSoSqAOgJHuTVxekd6elHEvxrusijtabKaMpcTR+IKpmIlFLoyiS2meK7hfEzqTTywsMYalVRNgRbXsXTK2L/4+dxSQyVs8N0gOpJhap7eJvw67ilWwlXO2MS1ihybXsw1OpplKUfP6GPZNKUc+T2XRhpo0T6K7bZsQ7pHTjQSm6qOJCJLFdsdZL5FhPS4i5bP2eTcTW85SEcEmnu10gPSmrvoRZh/38A9vsCNEOJ5JRtBBz8tHQ3m0SF4AI5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8699.eurprd04.prod.outlook.com (2603:10a6:20b:43e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 15:17:35 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:17:35 +0000
Date: Thu, 21 Aug 2025 11:17:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 04/12] media: imx-mipi-csis: Shorten name of subdev
 state variables
Message-ID: <aKc4iQ+BQjn6vGGO@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: AS4P189CA0034.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e510d6-c01b-41c0-a37b-08dde0c5db4d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|366016|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?1yuvDJd2n18UfEy3LkHRNsUXULmq5ZaDaxWi1eaoJE8TOF1umGJCkzP8Qcdr?=
 =?us-ascii?Q?D72nfUY5oOKrM3GtILFTgsgUqMHAtubaMrazHxCjPy1YQh47SB+J2t3PQhHy?=
 =?us-ascii?Q?Ip+R7vvtZT8tAZwSF1OS74GcyqrzKWDRZ8Y6HA+0oZRJrBKh1KC/TDzqJt8R?=
 =?us-ascii?Q?2lm7S7DPftMoxS+7ekMfkRuwpPimtSpx3bABugSuWgCZhHRTa2fuFo1EfH3D?=
 =?us-ascii?Q?YM54CIHwPwOVmv0SzRhnqLxf0byRApJWNSqBfh4eQeN9omD24HivbPY1prgC?=
 =?us-ascii?Q?5pjFkj4Ts6FX9z7dm0AVmJ2vJy8NNBmrzOb8CdHWj3HmT5xW4YcQaagL4594?=
 =?us-ascii?Q?jHGYMC8eK4pkXRCQGMEAtwQGGd5rccZCub/lPDyWtMzivVxGZ2Av3NXJn1vb?=
 =?us-ascii?Q?VFIzf8TBpE9iP3tswqtHuaAWyALDuaV9fyFKvwPiooqD2TACwMnQqlzzjy3H?=
 =?us-ascii?Q?yuwxlk1Vu1wuqT6R8uoX31gjgZRyXfRDmC1I+2LkOrVmF5QPr+J+hJfaTKOw?=
 =?us-ascii?Q?zu3uaNTnxdA0LhH2DAzLDyrDpln1+h0mv7qYCAUj7N1ZJWh6nMk24N6a3WQF?=
 =?us-ascii?Q?f2g+n9MZUhQe2MZ2xGjTuXFYhswVhKBH9DKOFBbGtZcXrHBrJXy9Xrh+rKX5?=
 =?us-ascii?Q?yWlyRdwxCUsSn5Q/qobvqB/3j5QqOdvdWnByn3bAtxQ83+wZnJmmzmA2Bp+O?=
 =?us-ascii?Q?y3bcRwtz1AvquqBqIAYp16Zb3IEU/AVNhxOQpuRjOcOBA+W4epC09BvIHXyC?=
 =?us-ascii?Q?KlhQoNrGKF1/nvcfu/D/mf4hnL4k4Qi5KGlsvtGdonmJjaLMj5fwmEQ0bF2j?=
 =?us-ascii?Q?ygq/2+xuyB6ImD6OQx4CKMfUB7quoeBy+mc9Z8LgSIFn8ST+3niNsOwrNoPF?=
 =?us-ascii?Q?IvzkVYU8Y9uUiBFo4yp9gYujXKP+UNpuRLGn3kPlWIZjcat67TWBrqSKLkAq?=
 =?us-ascii?Q?Y5a4pefe4WfXQl8QPPhvbv5AV8BWVz0Po9mwrjTRSxwpdnEV/4bYYEOAT46p?=
 =?us-ascii?Q?MgNhC+g1Hdw0ha04waXBmh54CyFlcitE9GnSStO8L87M0xjKFYCaztkXlFCp?=
 =?us-ascii?Q?IrKKNZuMjDU2m6aDmZoD+Vm2I4sqbyb0GLy6zr82wCsGyIlZiT3v04v0aXBT?=
 =?us-ascii?Q?cuuEdwHcsWU/TxSVB/hMtvh69CKzlycST4R2o9ASsT21z0MbmVDc2DmvwZnV?=
 =?us-ascii?Q?8aV6ps+emS7NCuprG731lyCZtpvKPNIxYcJDd4b23Pu1HLrVmQnALT9lIGlJ?=
 =?us-ascii?Q?Wd9pU2vgNdE+dZjXE1FX/6KLPz/kFiBSequBu58ULgHuDFy7R3x8+WtgjcPx?=
 =?us-ascii?Q?09lZvn4hJZbP5vcTW1GMRMk/xAKF5LLw71Q+vTFGmoHEoMHhOQjnSFUnDz1y?=
 =?us-ascii?Q?ouOUBqnPjgg/VmcAdD0MboEZBeCMpNKRKAi9iBLJ3Gs1OHX7q6S6qsMZCbPY?=
 =?us-ascii?Q?7AlcnYRtkdYugCQHzNz5P5DCtudDU8/EP/+KU6tWtx+VHQDfq+Md9g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?40g68149cGQcok2vHeIInbu3/0ZuwbOEEMIcBv2V9+NaLzpsD3Gc5bPk7WsH?=
 =?us-ascii?Q?1zArh7IVLvLChMq5gflf7BkRw2RDQt50CELHT/liboyOb6YlCf82OxEkz3J0?=
 =?us-ascii?Q?Tg0J+ZPodbDc/Dc8d8tFgbR3PHYHkI5BNZ+nT7ATFZ+3je07AMO5sb4QvO89?=
 =?us-ascii?Q?9x6kjUDAz2sH1s4OTBvPYqFZwMWcS9hfNpFcEMdVrksWe4aSBXmQRGgC9J59?=
 =?us-ascii?Q?oYhuwx7x7+I/VZH4YdljWPXy0wU7XQCqJ3BiVRv95IVhXHNYttrb7cj3EbtF?=
 =?us-ascii?Q?0KELXVeAiFswDVQt4AmYY7SZIM8f1WKvd5a2GY2kLgT7ljZxm1Fz8/weDOXL?=
 =?us-ascii?Q?ieEXVT9s55MzVWb9tMeEo/Eg4Dobm5WjhdpNkiE/bEIap9RnLouW8YeB4rR2?=
 =?us-ascii?Q?Y6LmFtrQvicX9CdxK5I+MzuIuoLeZHvvB4HtGrgYWyaGL9gN/8k4iWBWmTT1?=
 =?us-ascii?Q?O7sk4uwTF+p+CkHAB/KFgZ5+atBQH+Z5l4UtlCVrkxmvVtrhrVjI866JWwua?=
 =?us-ascii?Q?bdAyz2G8wgIt1lQf/UMtzZn1wu3d7CxY2h7IjFHGLgMIZTsnrEARjwt/jH/B?=
 =?us-ascii?Q?ZqzEXb+X4ipCCiZ5w3LcXrwUH5OqSQ+k1tcW/80H75KK39ww4Q40UizQw2SW?=
 =?us-ascii?Q?uWTFyGp7I2dg8+qIp1D4HiRX4M4rLrB6s1ff2nLAEj3xExNSIk21vma3V2/3?=
 =?us-ascii?Q?z0FhYzOZYXy7dQf/EVy2ZavukgQtQXuvyOifr2XAZtd//66Pwts/4Au/Mp/2?=
 =?us-ascii?Q?2bd/idwVQoq4Z+/GwMbC7+1My/lh32z+Z3QaxI1Kc0nS9cC+C133AJLVPBQr?=
 =?us-ascii?Q?/0GMtAMwT3ifOeJjFwdbLRuld75ZbVz1K/MSNR4emzy65/NW3DWtmQz+hypW?=
 =?us-ascii?Q?hs+Xa93lqwoF5TJjmx5FtwI+5Gl87hTC99PtY99LFK+oNO5oWycDhxKPPPDw?=
 =?us-ascii?Q?uL6XuR22+U3bUhsZ0oFHTp2q/gIpzgQXG/6RqKv5wYe/xCWWZHA2y7PMQ+j8?=
 =?us-ascii?Q?vPAV0JSHdYHfkWgrKRkyRyhpd7V1JFRVtyibZYDvgDLUhBDy4IVTIpLFY6Jt?=
 =?us-ascii?Q?jN7Orlb7f0MRvhXbDVE9G4sG8A+d+b3UONn6pleELiBPWWN/yUM2QyhG/C3i?=
 =?us-ascii?Q?n92dDwyEKq/AVNZ24j0XbAucot8ZkVjuUGlx1Fh0yU19+wsw78jNBgfZ7TC/?=
 =?us-ascii?Q?euotHl1lYMFEeP/UBZb0dWIbYXNRz8aqol6m/xmvxrP7OCz4QManMpndia64?=
 =?us-ascii?Q?84zxIlvER8Mt+4CUeUwH+ndeqfrrCIOK0+Awwvqo+w9r09dgusidHHmA88aa?=
 =?us-ascii?Q?D0TLB690aWBW0BK/pui3ZFZTQTWcdsxKyFT6MD7LHQQ+pANIgjyGoQV33qZj?=
 =?us-ascii?Q?pOi1Wpg/3ouC7zYYvF/iO9Q8OZQjbbNGVzMqlsJXKNM5lmalbQk9xmFaGlF6?=
 =?us-ascii?Q?HF2ENrjC0i6Q1BoTvGtRvQzJOYMQIU/pL7ffGS9gg36G9UjjdMtf7qeByfcG?=
 =?us-ascii?Q?zA0dBcSmtCfGWQ+t45XXNw0WSJW/75ErJLroVklnoLob4OnKCAFMonJipB0t?=
 =?us-ascii?Q?BI6lygTqifFaX3j02vejfAQFNhVX+4Ne5YIf9g9p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e510d6-c01b-41c0-a37b-08dde0c5db4d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:17:35.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIrqiC5gWHr7c6u0Jd+SoAOPDu0ND/rJypXUF7SW1dNnzRQuPXHeJLUcKTt9RJRPjMdXcV3ZpPNpur0B2aM44Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8699

On Thu, Aug 21, 2025 at 03:09:36AM +0300, Laurent Pinchart wrote:
> Rename subdev state parameters passed to subdev operations from sd_state
> to state. This standardizes the naming of the subdev state variables
> through the driver, and helps shortening lines.

Nit: I like simple sentence.

Rename sd_state to state to standardize the naming of the subdev state
variables and help shortening lines.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 0f0863011230..894d12fef519 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -996,7 +996,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  }
>
>  static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
> -				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	/*
> @@ -1009,7 +1009,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
>  		if (code->index > 0)
>  			return -EINVAL;
>
> -		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
> +		fmt = v4l2_subdev_state_get_format(state, code->pad);
>  		code->code = fmt->code;
>  		return 0;
>  	}
> @@ -1026,7 +1026,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
>  }
>
>  static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_format *sdformat)
>  {
>  	const struct csis_pix_format *csis_fmt;
> @@ -1038,7 +1038,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	 * modified.
>  	 */
>  	if (sdformat->pad == CSIS_PAD_SOURCE)
> -		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +		return v4l2_subdev_get_fmt(sd, state, sdformat);
>
>  	if (sdformat->pad != CSIS_PAD_SINK)
>  		return -EINVAL;
> @@ -1076,7 +1076,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  			      &sdformat->format.height, 1,
>  			      CSIS_MAX_PIX_HEIGHT, 0, 0);
>
> -	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> +	fmt = v4l2_subdev_state_get_format(state, sdformat->pad);
>
>  	fmt->code = csis_fmt->code;
>  	fmt->width = sdformat->format.width;
> @@ -1090,7 +1090,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	sdformat->format = *fmt;
>
>  	/* Propagate the format from sink to source. */
> -	fmt = v4l2_subdev_state_get_format(sd_state, CSIS_PAD_SOURCE);
> +	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
>  	*fmt = sdformat->format;
>
>  	/* The format on the source pad might change due to unpacking. */
> @@ -1130,7 +1130,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  }
>
>  static int mipi_csis_init_state(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state)
> +				struct v4l2_subdev_state *state)
>  {
>  	struct v4l2_subdev_format fmt = {
>  		.pad = CSIS_PAD_SINK,
> @@ -1147,7 +1147,7 @@ static int mipi_csis_init_state(struct v4l2_subdev *sd,
>  		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
>  					      fmt.format.ycbcr_enc);
>
> -	return mipi_csis_set_fmt(sd, sd_state, &fmt);
> +	return mipi_csis_set_fmt(sd, state, &fmt);
>  }
>
>  static int mipi_csis_log_status(struct v4l2_subdev *sd)
> --
> Regards,
>
> Laurent Pinchart
>

