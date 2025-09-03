Return-Path: <linux-media+bounces-41694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC70B4229C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B0F3BFC60
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB6E30F542;
	Wed,  3 Sep 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TDW52rYP"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A7D1459F7;
	Wed,  3 Sep 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907807; cv=fail; b=Syf33O1TMVmZ7Mu1yDrxykEoqgtdyYC7GihoTmTz0TKfVT+L8mkjd0GjM5YD4KwwbKgJ7Xbo0YXMytVZ17BESSjs3yqNrxu1dJCmSFpS1NUg4qiJrfUKx+3rp+AMapmlk4ghXpuzwXbvfuQF+LE+MkQj/9s+ZROIlEDFg0AV7zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907807; c=relaxed/simple;
	bh=9xqR1JO0Cj3akvUJHhD3bki46hhlRKFvku91NLOMFHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S2NP/zfA+vNwOQdrea1vU4ju2KlpzjookNRfwwddoV5B+C8Fl3sA7NzvZcQpyxDpQbu+yYa0lg0MQVL02uaYqpWSjySmH3pdwKIMs22MBxOYwp1dh4eAXoA9kU1qk/xEGyYx2I+nXsAtGdbk2t+1PWqd5L8DgQ0H4XX9xfg/RQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TDW52rYP; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFzEp1WLbrtZUWbOlDsgN3BpJNStZy2h7rbDp+6+EQknN9vLRYR/reg8lZwdTbhlf8rmkmJFO5d7DNuJxjQcG+0tPy2131ijW+WwlidTeCWxZWexE2DMkGBvC4QpRMG6L2cM9y9281f6hF+/TCh+kOXYBSUdu323b1bjEGAz8KxIi/2wCKCrlppD+1fvtPqV2t+F3RpVgBLEn2Yid0wrzDKUgeOIqLlzJCdE5oFyRHRlY8yp4dZ6C4diyE/zRtBmMJPW4i/BnI4TB4P/Z1+JRbe6J8toDf4FpeN/wZMxUz4/IqofPqbMwRGHvfwV7hSBJgiP0Flc5qHA6JpoO7a9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNSwCTSE7ZJmDSnP0F1lFjJxCwM0PTlvzf5gVPH3t6w=;
 b=JT/nR//D/wG+3mp5KTZWSc7Gp7y92ZOyIA9eDWpHoNheYOS6Gstx6MGcaf84dmzUk1MCLHwrR4k8kXDC0Dkzd+u9CE5ntEubftdkeOaRGmMHhdycOYmObg1ZAQQBzrEJ3Z/axuxaw3rZfWTWllUyLG+jyTZHFxT2vrOWQxu78tUCV0fbBDaTtl7/pUhNjXgny+4rNgitgQVJ9lWu3BjxmnbI7KveW6KBIX81ZXOG+tGKEDE+a4cNuJ+3h3gAwsNZ6kpvlJARgX6ueXTF471DRcH6cZ45pvAHQDTGiWbkguTliyL0G/D1TSONt63kigQm985ysMRUHDdajsEukc3PIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNSwCTSE7ZJmDSnP0F1lFjJxCwM0PTlvzf5gVPH3t6w=;
 b=TDW52rYPyEapf64KTucpD9Sse2GuRP/um0qwMaY/r8Bgi1teftbboiWesTP2JzijgDvzv7wlwGA2iMXTV408ZzPt/W02O07yD6wOqsSsnz/KHQt1DblZkKP21ZozrfigdB8z17r7zuqYPZvd610dmveJlFZ5JOEV59e+gg6fcC9hY4aozKRgFXx7WG+weTJ8IG6db4MNsN7Mj0CvAEMf0Zh6waNxCdVax1FHBdEvmqOTN06k2LZ/VcTDJDQ3A3fTXCVuSo+v8qy2xbVw/+bGawGnGWrKqXrntmVPYcXydzLJ1HKIn/Bdswl32w9WFnU2ntdij9X9MmxC16RSsRAdwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 13:56:41 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 13:56:41 +0000
Date: Wed, 3 Sep 2025 09:56:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Message-ID: <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902123920.GM13448@pendragon.ideasonboard.com>
X-ClientProxiedBy: BYAPR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10914:EE_
X-MS-Office365-Filtering-Correlation-Id: 285dd11f-dd27-476e-0d47-08ddeaf1b569
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MjlVgE1fozt6yuMDBU61NHU2pWshbqQTkHXsthT8xQVv5D5nEyWrUj42uaQX?=
 =?us-ascii?Q?nl+M5TRzv8UvE0UFP/2cIBOCPTmMoYhVj/T1UvLI+r/knXXt4agcVxinVQWV?=
 =?us-ascii?Q?FclB2J3uvNNzSMt8JXW4Ek7HMgXgt34kvds6Xefh5la5otoNB4Sf9yV/TwHw?=
 =?us-ascii?Q?kBrV9qg0OFW2EIglgt+JkLTTn1Rz6y7N57IeID4D3FMvC1YdCp86LMJED1Ky?=
 =?us-ascii?Q?zLmPqae38nKFqoqcIXS5Z0Qyuq/NUBzWP9zrV14hKVcv5xumvciy7e2HX020?=
 =?us-ascii?Q?2qPknN0g7a2WGh1k3ZGTykSvW6yEjilWvRU2M3EGWnALXw5FPNjnP5aCM6ni?=
 =?us-ascii?Q?KH9wea2vqj8vBixjGzVPz8vBQzaldkGGPMJ9B3FhSlZjRkGf4AjQj7d9XHUw?=
 =?us-ascii?Q?hEj98aUFFS8fZKLN0bH+uQExKwZpVIzPi7tCqzWWDzd5JBeCpbYQl0eE4Syp?=
 =?us-ascii?Q?fJ2ijeSp66PY6vD7HQpW7lrxnaBEg8MW6pM7Lq4NWvoiivI6ggnO3QesreaP?=
 =?us-ascii?Q?iKe+7nUpXazxQtp+yapXrDUvwYM/lkOsKFnyZzS5ZIlggZgv1DeIdx2G7Dmy?=
 =?us-ascii?Q?s2QK+uj+Pmd1f+MTk8zD+fs+vAY4GCa76YNqBK7YEB7acTd9ETQ1kclvFtYb?=
 =?us-ascii?Q?mHWdOnvxNmoMOetzu6W8fc0r/oMnO5EI8C1Wv41IkQd+VsyoXP4lq/ZjUnAA?=
 =?us-ascii?Q?6yR0zcKDYqWKsV52of0Mp06JJdxT2SBA1Zj79+cg5FCYdOwxCa2yQ3nV4dJg?=
 =?us-ascii?Q?6r3Orh2norAWPm0Lbh7pzM4KOz2ewMJN2rVx99grFIG9FshSLX1Xq2PphrkT?=
 =?us-ascii?Q?Z5Jv0zTObOI+4450ry5z9T+iUtCg+bpWTdF79CObIXxFrCvwLGtTXOaFuCSy?=
 =?us-ascii?Q?AsVqQJ7hZrXxHSu7YzSCfAkmUZJzsZ0P0CeH5fzFZ6tUdfn1PzNVkAij/DDb?=
 =?us-ascii?Q?vouqnr7/zCn0HV9rGWnSB3vAG03s09PTdY+wtwVla9yEGJbli7x96QBr0J40?=
 =?us-ascii?Q?xqwuG0+x8ujLQbGykUI9C2igUmm3gdYtM6L/Splyq4D7YFSC8k9dwaSv5TvA?=
 =?us-ascii?Q?CcYT6hBBJFcAMqznLJB/xZAoDCAn+JOBPexw0v9g5smJuRObWeUNbleeiIda?=
 =?us-ascii?Q?ZWDp1CgZireeGVF7TDB0Mb+YN6s3ilwDGSzImCNYQRZsUBofImXgVm1pBDeM?=
 =?us-ascii?Q?0j7Y/xkbQFXaxYJ55Mu3ylMgdnIDZCqlZwy1lzacj/Hz1CHAMRJb5M29ANcL?=
 =?us-ascii?Q?xpAhqzZEJ6vuYsVx2Yqn3CCgNVK+9SIMBKqHYx8DApKeNqvp26Pi0Pl8pUkk?=
 =?us-ascii?Q?UrFVW/P06x7VTQmhqzGgbr8345eGYc1y6j/F5eTRVhUzV+MEP6hKEhtNnQze?=
 =?us-ascii?Q?1OPnADQUmddFCiPbF/9wkGlHMUvAJagLD9hJvvVK1gjg7af5jE+dmw0QkPyh?=
 =?us-ascii?Q?rNlw81Gn1xta8fP8/W1jw3q8+emd8N0ESS3xNWJ+cTUCYJ9+CJhbRN/Wdaww?=
 =?us-ascii?Q?w6I/5UO6YK5yYbM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?DmRqAn/FdNhSzHQGqaSlnXic32zTRSyG9+BXE5NWg81IM/ryzcXcXkUErbg8?=
 =?us-ascii?Q?brbP7tvuIcJlA/qaDdnjC3BljkwxmM8ESHSNBKcAITS70g/mu7uQtTg6gNO/?=
 =?us-ascii?Q?c8PYRBrKuxbuMuxPw91pLOQVk6YCE7ETmmmzeWyx0t1DQAzZQeUHvQWETrwd?=
 =?us-ascii?Q?/D/TgROZ8xDtqZNBwLqUNw+OESjDnBDWk2QmIz+5q1LnLD93psYWQTo8tmLu?=
 =?us-ascii?Q?1x52+14a5jjD59umomdmP5oamCI7bL9nyTObKnpE6YNxAGfjzfmoclhUdjNr?=
 =?us-ascii?Q?d9Gqz/zieqEUVtL4bO5j5nrvr6KcJJ+5lK2u5hKTR+N+An/AwOgQsy+S99JZ?=
 =?us-ascii?Q?P4ELhqk27VqxXKnTDXjVF63UfNJT+9OPUuC7B5YYCinqMK0HyPLLxm4KoaN2?=
 =?us-ascii?Q?UQE4a2hNJRXftl5L+Iidqmo6WTRn3ys8Ao3J2Vt5Ju6Dudl73bhCzQpvRfxW?=
 =?us-ascii?Q?q4EjUccbjuNagNE+LfFTCL/e7W4qXmZ6LtQHPiGN8R98AljTSKABqfX9qaA5?=
 =?us-ascii?Q?NJ6k7snHH4fjUhv8ETk15TU0/co4G9cvOyuKqwf3z15bBZ++tMC39M/Ve+hx?=
 =?us-ascii?Q?9Lw7Kk/Y2B32dmaGuhgzXy4/IubAf4IVw5IMi+XTIFFkeV5MvOqiJQlwGMfF?=
 =?us-ascii?Q?lYa5U0JzrsZFW8Tt/hSSDl5RiOA5oBClMkO9ji7bqB1zp5jWzCKDpr3GBQLt?=
 =?us-ascii?Q?ZXCYq+1/MlmxfJmSLSfpiCpoCMrVF1Mahk301j6VfhQQg8MNLBTEC/IUucaf?=
 =?us-ascii?Q?Hu1sGdQhykTn/EXQSjNKouw9l4xLVdcN2RsLS0gUcTPeu6cJX7TPFc9JCXpf?=
 =?us-ascii?Q?vDXBDcgnSyT0aQexVfr2RkPjWBqL3mr9YAGaEer/V2SdwRFTRc1RYy6z+Acj?=
 =?us-ascii?Q?U86Y6P9HsZgQ2/hJI0av8Gk19YKeTlPfJjkxUPO9mStbJlUZ9BRPzAavKNKy?=
 =?us-ascii?Q?iiQOX3NPu3iBRhFHvjTEWswdFAUwYFaUFj8D6xG4y/0O+DDDQQzSm9pKpY33?=
 =?us-ascii?Q?caZXRrMBLIwSgLbGQYvacy2JJdoa8+vHxeRSW2drM0wfdutzgZNFPpL7GAtA?=
 =?us-ascii?Q?m84LeOoIcjH/hDaZQqahUoqi43AdqsBq4Rl0Dfx3uHfHF6jC54s21DvuOw5x?=
 =?us-ascii?Q?mpTqPHHpXeE4K+nT7AdeyErR6r6QGJMNTG5OaRX5zvVnis3m1VROPfwled7m?=
 =?us-ascii?Q?onfpdOqsTWOlTg0cIRjAVZ1pXCLLTSIjBJKbyc5aViTU+Kxqq5hAB2cAPBtN?=
 =?us-ascii?Q?Cow5HDiCwQzr3JKP5fEgfYlSVqzz1Z/hrtQJguvaklpfMW6iTrI5d/adK8Ep?=
 =?us-ascii?Q?Qyupzx7CPKTOdjauvw2icPc8BTJQ9LZca3AxPOXKxT33aDpLiEYYppE555u1?=
 =?us-ascii?Q?hXkfS963yB2Mj5rn8ksggD/ouSeCMJ3/HIuRkg+k8ZQp5sloepuIsX8rx7fi?=
 =?us-ascii?Q?zZkCg3uUZyUG8xytSRe/VDwu+D2cmF3YdbPTNfFFZbJIpRJVFRA/2fDFRL3s?=
 =?us-ascii?Q?5Mrgt+9VW3iVNrlhKcHNhacaDTX5K3L7XHq667L8xK/PkqfVagBxFHpXCUbe?=
 =?us-ascii?Q?tZ4x6KK1vedDf0iLsh0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285dd11f-dd27-476e-0d47-08ddeaf1b569
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:56:41.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JU/kf0EaeZOY1QW3t+stlt9oauGq/+7VD5LFiIUGuKtjrcn0NKDTUxJqDXsRYhXTMvWYGbazGn2NaCnqqu2wIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
> > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> > > Hi Frank,
> > >
> > > Thank you for the patches.
> > >
> > > I've quite busy these days, and I don't believe I will have time to
> > > review this series before coming back from OSS Europe at the beginning
> > > of September. Let's see if anyone on CC could volunteer.
> >
> > Laurent Pincha
> > 	I hope you have good time at OSS.
> >
> > 	Do you have chance to review this patch?
>
> I'm going through my mail backlog, which is really big at the moment.

Understand.

> I'd like someone else to volunteer to review this series. It won't scale
> if I have to review all NXP media patches in my spare time :-/

Yes, but none volunteer review this in passed months. Expecially key
reviewer. I am reviewing i3c patches. but Not familiar v4l system yet. It
need scalable solution. I can help filter some common and simple problem
from beginning.

Frank

>
> > > On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> > > > Add parallel camera support for i.MX8 chips.
> > > >
> > > > The below patch to add new format support to test ov5640 sensor
> > > >    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > > >
> > > > The bindings and driver for parallel CSI
> > > >    dt-bindings: media: add i.MX parallel csi support
> > > >    media: nxp: add V4L2 subdev driver for parallel CSI
> > > >
> > > > DTS part need depend on previous MIPI CSI patches.
> > > >   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> > > >
> > > >   arm64: dts: imx8: add parellel csi nodes
> > > >   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Changes in v4:
> > > > - remove imx93 driver support since have not camera sensor module to do test now.
> > > >   Add it later
> > > > - Add new patch
> > > >   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > > > - See each patche's change log for detail.
> > > > - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> > > >
> > > > Changes in v3:
> > > > - replace CSI with CPI.
> > > > - detail change see each patch's change logs
> > > > - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> > > >
> > > > Changes in v2:
> > > > - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > > >   because pcif controller convert 2x8 to 1x16 to match isi's input
> > > > - rename comaptible string to fsl,imx8qxp-pcif
> > > > - See each patches's change log for detail
> > > > - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> > > >
> > > > ---
> > > > Alice Yuan (2):
> > > >       dt-bindings: media: add i.MX parallel CPI support
> > > >       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> > > >
> > > > Frank Li (3):
> > > >       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > > >       arm64: dts: imx8: add camera parallel interface (CPI) node
> > > >       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > > >
> > > >  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
> > > >  MAINTAINERS                                        |   2 +
> > > >  arch/arm64/boot/dts/freescale/Makefile             |   3 +
> > > >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
> > > >  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
> > > >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
> > > >  drivers/media/platform/nxp/Kconfig                 |  11 +
> > > >  drivers/media/platform/nxp/Makefile                |   1 +
> > > >  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
> > > >  include/media/v4l2-common.h                        |  30 +
> > > >  10 files changed, 1024 insertions(+)
> > > > ---
> > > > base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> > > > change-id: 20250626-imx8qxp_pcam-d851238343c3
>
> --
> Regards,
>
> Laurent Pinchart

