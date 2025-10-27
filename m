Return-Path: <linux-media+bounces-45690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEBC0F5A5
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 49F1634F558
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5E23161A8;
	Mon, 27 Oct 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AP3zRfjk"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4731195A;
	Mon, 27 Oct 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582767; cv=fail; b=THVPEdqKcY1vZcIZqPludzFHRnSUQWWxe653gOAyEBJchiaAluB5cIwQzJXAWUnt95Z7zPczFHobhJG8XSlopan/irdAziAxwbNMKsSbmQCv48dCeblHVy0LPwFb3mqgAgJ9n/wBRcxkrPvzrmhgMNHzXwZP9kw7LpHDM8ZK2s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582767; c=relaxed/simple;
	bh=e8nyBZUrs1MkfEdaAIaZrCdOcfAFvGF75z/Z1ZSpSeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FKbip4r6PwNika11TGbT8/XCy48CGdQQI9HcPdTTy27zNvqfRqydRBCUOrQ5/fPiaQkMPtIVb5knEa42es+b6USn/NT+yJyjvc+n+fj60kgMM8k793898j2wvj/dpE9PJ/T/wkVZqUcattwqx8VkFA0TFAuhy89K/H9S4K9a3A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AP3zRfjk; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/ZjoZtNkwOO+mpLcdy2MVU01EL3OkXykjCwwf/tO1VHBQizvO8b2Ym0ZG+aPRMv/n3SvgUUmQhBk7m+POK2byWSpoBa1lOm11G8AgZYFKVUYT0SJo0+ZcJEGpdGL5IcFZloYE+13ANI2phjTIEwLqK3ze+ZwVPRvlFXy/YwqzkO7PvkxdMxGjSANvu0zDnjgQ2pcEgcwjSbwWOYW66YIjU+R/TXvMEtCZiwQQansfjyTZpspkTBZNsNATznYv4u/GMFHkwDMib041711/IJHossW+pFuvSAs2TgVIcP4g17SjqvN45dLAyb0u9gDCcNoQLKQKnIrjxqLSAZ4qmlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEDRKcr7TZ5RXVQdKs7htv4ABew/ZtEr9s0rt8ytp+E=;
 b=Un0jKaA0dzOZkYvUxv4Vcqguf2xR88BW3yOEPv1MT/X9UqXC9w3o0LySDRXGYhyrF3a0h53o2Rv8ggY/gEyz8gM939LmSXY6JU6Zd2K+9qseLc50FIsDyQz9asQdxcvxp+Q5ewIKza6uMQkTHXDMgFnRrrMqib72x7UT1kB5rcprUuBnrlKLIPxN5MIXeNqlI5sBWcA4wVrFCZZm70BbQeOIZ9yqGUsdo+c+XTgs17KIr+2WombilaOqjsfN/f8OZkdXtja9RVtNhczK4HNVtdoSVr96MbRl8QKgBa2F1bpFhc4KaCh6y9pKYB5EnpEHp4ERvDekSZKxDAEGmzCuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEDRKcr7TZ5RXVQdKs7htv4ABew/ZtEr9s0rt8ytp+E=;
 b=AP3zRfjkktfGLMYmMh9V03nZBe0VdgL9kguo0JK+O2ViOt70IVjRfPWuHLyhA6mwjuRDeCodA+lrSOp5nIGl+IBp4yizJClkHKCqDwEyXnVJhFL2OqREep5qH0SYC2EQCMprFsTUodW2mkKuI0QZHfTwlRGnz4BnVYMEt+EmNXNHMrA0Q2fCPu0KvospR+W+jn2n1f1qP0jYb8sTCUR6VlQ1PguwMD68ahG+khSy0Chy2wBLvLNiWXdsiMRHbqcmnZIJne12Hrp3YzHQ+rHlzXsA3TjFEa9i5KynS3f/nvQ3itgIamfMqciTLIqgr7iaykZdBVob9dCiaj0CBrYHcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 16:32:40 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:32:40 +0000
Date: Mon, 27 Oct 2025 12:32:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
 <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
X-ClientProxiedBy: PH0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::21) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: f8df48ae-33b5-4bfa-77e6-08de15767224
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?iUCj/ph9n+KIxM4dMrhsL4btHNNOB7g5dJ59dAgQzuHfefHox24Kowomvowe?=
 =?us-ascii?Q?g/ZP4cjjpfPqVvJ/b0mn0gn3EdOI//CVPa3AYTr/Ma+17vdgZiqmNmJIDVH7?=
 =?us-ascii?Q?SR14zlp8QOFDcra3fOCWMlCegJdEyzE6AVRAcap6mDZjTmJM4iIBSu8dkrU8?=
 =?us-ascii?Q?v8sxi0S1+i2UMx5PJHJ8/+iv1dkQthT6vHrRtujMNfDab6J2ozZnm6q0YJVX?=
 =?us-ascii?Q?l1nFuX5VoG9mF7LSwpw6RrufGHbizmujGYcbTb6mXRu0FAA2pxn5NbRwg2vy?=
 =?us-ascii?Q?8w7IkYM6+anCW2sQGGbg0DWuty1UlQONj/XqnlQE1riJSkx/Arjtza+MReLx?=
 =?us-ascii?Q?FECUQbCkrttTzIhQHmlDpIK6gCT5Ed38KNBh2ZM2pZZXA6LM8IQI6o3YNUfO?=
 =?us-ascii?Q?/LrMU8TYGZiYLkUjRa4yWaFsBbUDd1GBqUZKDbYe4ilkvR4f5Ug7gTaCvQg+?=
 =?us-ascii?Q?mhdSPoIdwoTjDUQ1HCdjnjQF+QONRQ+4mPVk16PsZ7prX+Zm9l2grt4Qm4b5?=
 =?us-ascii?Q?MXxMSnG9fSeiZf9bylo6IpoJiY1CUNkT+S/uvxSDpUskTMw6I908SaRpR1aI?=
 =?us-ascii?Q?uxVxSdiXQeR+HYgxe87/jDfnpJuUfd1spbIYrk6kfI+MhUN+ekVcRRFZ3RfN?=
 =?us-ascii?Q?THEOnrR2V/n4Jgo6oQxqmCL7+bsR4F3tScyIY/uZRJjBbjj4x6fhqiB/fb7j?=
 =?us-ascii?Q?/PuOZyLVFnn7VK0LM7+vG2z/mW3gk1HwqM1++VSoVW4rIlgLfhz9+u3Td8X0?=
 =?us-ascii?Q?cyX3xd90bdwngE0akrznvZQhCZ1nHC+jF6j2/pTMsadTObOhH+Aoa7M6/yT0?=
 =?us-ascii?Q?Sr+EigfAp/QUghuVAIRUzsYmp8RrRtxfbbMg1bFwiLbbATpRsu85/zHRKMNV?=
 =?us-ascii?Q?9KJzdTE9Sb21vlYte7DvU6gh410BEIfT8MILl0rENhLJhBbsN9SNkkf9Op/5?=
 =?us-ascii?Q?EMLrcJsmLhxH8IkzFx3GIp/yZvyqsuhWk7/4QCiil4WEYe5NXUq3WVX6/RF9?=
 =?us-ascii?Q?42aXmoOlAEO1UeYCFjLaD0QrfqUvxyKYv/JzdmRluKPbceXvW7O7GeMF76vG?=
 =?us-ascii?Q?AgwtZlncX7PL0eUCrb94LjNzPrT3ia0yHd2knqUSphc+bd8GWW5haBLDHxK6?=
 =?us-ascii?Q?+zQKQ1qiAO8jURgYN5OOIa4brPslFwS7qzDF+3hn6uAVxG+FbNeCwQn98Fr0?=
 =?us-ascii?Q?rQaRE4FQqGtXAmewc+/FYcE/XbRVwW14aqPcYSCsIfjkNYxiy68GwE0BDgH8?=
 =?us-ascii?Q?bgmZJxV2SRaRqY7LwMqG9po8fGb3m9N/RZXTusI4aTTxtj6ckT9mmY9Vb+0w?=
 =?us-ascii?Q?sNPytEabFjKR5I723TFrW22G6oKqG4JsHpgwVGzjalMVgwzUgeSWt53XaTUx?=
 =?us-ascii?Q?2bTMa8rq8qitOZyJRiDSu6L+SusankHBsfekPh7A2H3yNVOXqScIUeaVwjsq?=
 =?us-ascii?Q?rljHA4TLrL0XRXZ1JHmIBZxTqRMaocRppomyEPoKrsDq6099pLPEjw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7ruaXgxWBfgkdXW+/GhBmvhBgWSvXSIyjIdXRattE8vxl6AlvZLnc0SeHpZw?=
 =?us-ascii?Q?zsSrjNFSxQoSwhPPAxTfLLUs0pbJLMK1KE8/ziK1xhQORydK9AacNCIrKpTt?=
 =?us-ascii?Q?nNkqjhvNdCuQ25a8sQp6YGUbZr6yOTdKG9lsUtOcH0qlnQlx5qXDTsJPXw32?=
 =?us-ascii?Q?vG0ENx7iBnICe4bQeL6a0yaeLz1siiVK5czzy/am0jvyFPlcnbn53hEteVVa?=
 =?us-ascii?Q?017gBMa6Hngw2Utn1cukKL87mtjVaVXXLTB7Ooa+SLrWNkdWHtNxlxt36fbt?=
 =?us-ascii?Q?LPtp4VL3Rcg6fjbDHDOVj8IG6ibiAFZOml1bDjNjRPnmT/JXZqCQvaMC1uH/?=
 =?us-ascii?Q?3OPA5iwrCJ4zybXwIBxOBOeP+UW8ZH2odDpelEAqD4JNCyXH5S8h+3O5t5o2?=
 =?us-ascii?Q?aw1IcH0FAI3x03bZUmyLhHDW836AvdB9ymFvPwkyhscJARwYOyWs1rgjWvh7?=
 =?us-ascii?Q?2SBR5VJVh0txmo2v7IDuRzwtLN3SkDAawWmIEO2XqkCWzOJLHSCNVZF0E+Ip?=
 =?us-ascii?Q?SVOX0pX3+VHc3Mljk7UmPKEAwbDXqtycIFu2Wsm2pmzPX4h8qnppm01zrkWw?=
 =?us-ascii?Q?vE6OKC5YvxPJ4V5RSKOKeUHwP7s9NbwFcKwPRhF/52VeMUOnkAV6FIkrB611?=
 =?us-ascii?Q?YuucIj0LbOO9MuVRe4QCADXt4YV7wM77EWkcYfsHeyFCOeGRyH0cY4OJNv3D?=
 =?us-ascii?Q?2Wv+UUhBKFV7lvjEfMqjWZP0wyOZlyUShRHKSbaL3jpi5r3q0huSxfSn20ry?=
 =?us-ascii?Q?mcUb9mvAujU1IuGMAugjhI9XTw1EGhlKXlWQilBt0X3fcghs8hPZ1uiiHW7L?=
 =?us-ascii?Q?Oc18NolMXYfaqUJyInAkpTQ/SaOoqyEGpJR6ryK7Mz6NA1/aAr1KtyGYEsIb?=
 =?us-ascii?Q?fnlDGDi2pGu64KxtdVsAAxbjmH4G2cT/dA+/zvSS4j6440nkJ7ZKRjeRPFfp?=
 =?us-ascii?Q?/xHmkl93ockjtj82w38FIfkUKrU3LvLJuD+GTF6CYNiUz/0JgjxkE/DJAyrC?=
 =?us-ascii?Q?A2Ro+89ES3ziueEP16LZpF/vpEQzJyhzr80Jm/qjfwM6NWEzXs/Ro8fCB/8T?=
 =?us-ascii?Q?RYaFhXwRmEki2PcLfHpqj/Mq7KVVhPB5Pco5Ouv4clct/NI1R2/fCsPbYSJN?=
 =?us-ascii?Q?8s+ktuC/Ahf1Y6xyiUMDI2e/JhgqI+igmuu5lC55SimTlha2X/4HujMDw6nN?=
 =?us-ascii?Q?N+1fvM6Oklw24GI1naA2wg18APUSFhB0GNro76XB0zNedB1Hzhm+fOdlnyML?=
 =?us-ascii?Q?Dz7qSLzxa81pEcfIwUPTMFJvghhPwOksxhT2wYplPwBmYxcoc3l1FVNYNysj?=
 =?us-ascii?Q?BrTVy4MsLsyfmPeOsWCVexu15LBUUhkwbhbLVlrccoOjfg2TaMVwfgORQNFm?=
 =?us-ascii?Q?NdiaGErfKAVGUsRmPUwqpHeq4W6lh/FHeiN0/Sp85mTis7J8wMqbgkF2RZHW?=
 =?us-ascii?Q?xn0K/zRjJuhqbXpXbUtHEOYZkPtuKq5JFlWvLEOcj2B9NeLyRkojFVRFBkRB?=
 =?us-ascii?Q?0TBTO63sXPpkBXC/L8GoJllA84SfyXvcvmBX5fe75SM1onv7dxC72Nmc8PwG?=
 =?us-ascii?Q?Iyy9ImOk5RIdEPP61wvSZ+FPqYzH1AMRK0fysdjX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8df48ae-33b5-4bfa-77e6-08de15767224
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:32:40.3164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNHjsC7HUl2uZcqdavZSC7ru7hoJQU+f11bOEmUKf4426yldzm8CwlmQMYHHFFbbJnGSVAnhU01j/ek2FH7O9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575

On Mon, Oct 27, 2025 at 10:31:25AM +0200, Sakari Ailus wrote:
> Hei Eugen,
>
> On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> > From: Eugen Hristev <eugen.hristev@linaro.org>
> >
> > Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> > and i.MX95 platform.
> >
> > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change in v3
> > - drop remote-endpoint: true
> > - drop clock-lanes
> >
> > Change in v2
> > - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> > - update ugen Hristev's s-o-b tag to align original author's email address
> > - remove single snps,dw-mipi-csi2-v150 compatible string
> > - move additionalProperties after required
> > ---
> >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > @@ -0,0 +1,151 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +description:
> > +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> > +  camera. It will convert the incoming CSI-2 stream into a dedicated
> > +  interface called the Synopsys IDI (Image Data Interface).
> > +  This interface is a 32-bit SoC internal only, and can be assimilated
> > +  with a CSI-2 interface.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,imx93-mipi-csi2
> > +      - const: snps,dw-mipi-csi2-v150
> > +
> > +  reg:
> > +    items:
> > +      - description: MIPI CSI-2 core register
> > +
> > +  reg-names:
> > +    items:
> > +      - const: core
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: per
> > +      - const: pixel
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: MIPI D-PHY
> > +
> > +  phy-names:
> > +    items:
> > +      - const: rx
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port node, single endpoint describing the input port.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +            description: Endpoint connected to input device
> > +
> > +            properties:
> > +              bus-type:
> > +                const: 4
>
> If 4 is the only value supported, you can drop the property altogether.

Sorry, What's your means here? There are more options in video-interfaces.yaml.
here just add restriction for bus-type. otherwise other value can be
provide in dts file.

>
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +                items:
> > +                  maximum: 4
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node, single endpoint describing the output port.
> > +
> > +        properties:
> > +          endpoint:
> > +            unevaluatedProperties: false
> > +            $ref: video-interfaces.yaml#
> > +            description: Endpoint connected to output device
> > +
> > +            properties:
> > +              bus-type:
> > +                const: 4
>
> Are both input and output of this block CSI-2 with D-PHY?

Yes, input from camera sensor, output to others image processors to do data
transfer or format convert.

Frank
>
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    csi@3000 {
> > +        compatible = "fsl,imx93-mipi-csi2", "snps,dw-mipi-csi2-v150";
> > +        reg = <0x03000 0x1000>;
> > +        reg-names = "core";
> > +        phys = <&mipi_dphy_rx 0>;
> > +        phy-names = "rx";
> > +        resets = <&dw_rst 1>;
> > +        interrupts = <2>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                endpoint {
> > +                    bus-type = <4>; /* MIPI CSI2 D-PHY */
> > +                    remote-endpoint = <&camera_1>;
> > +                    data-lanes = <1 2>;
> > +                    clock-lanes = <0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                endpoint {
> > +                    remote-endpoint = <&idi_receiver>;
> > +                    bus-type = <4>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9d9d2be7be8037dfa96f1c9edd24a0cf997b9393..ecb7bc7cc8ad797f43173075ca8973804bf335f7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15334,6 +15334,7 @@ F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > +F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> >  F:	drivers/media/platform/nxp/imx-mipi-csis.c
> >  F:	drivers/media/platform/nxp/imx-parallel-csi.c
> >  F:	drivers/media/platform/nxp/imx7-media-csi.c
> >
>
> --
> Regards,
>
> Sakari Ailus

