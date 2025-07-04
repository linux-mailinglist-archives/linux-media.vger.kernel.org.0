Return-Path: <linux-media+bounces-36758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56210AF856F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 04:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24BE1C8590E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 02:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC7E1DDC0B;
	Fri,  4 Jul 2025 02:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oBD2R29W"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F262869E;
	Fri,  4 Jul 2025 02:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594706; cv=fail; b=gltgyytu2WeTcDTpFF09+S/zgNQeMyMswGrqRPiPqvoU3dbvC3hd9e9Y2Rpp0v1nM2crIIISHhYtFh7wSnXdPhTUpjbiaGs2mO20h4mThnfNjRXHhGwvH5QlOpE5wgmMO5lU6vRHKou0Fk8BNQKIEfcgJ8aFSXDemjsfvkX0lEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594706; c=relaxed/simple;
	bh=24VU9zJXdsmVRF4pqwGZ1ePavAzgCzbAAHUlrLKjFyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hthrIM5uqaK4zlfceBBHddSRs81ttHtpBkZzlxQLrmFUq+2J/O82uBSOc3ZZeGTwYFh7qhCHOaNtQ78xWD4j7CaE3NDozfc+Z4+VpwaEq4fLc2BX+KtbqA6mV8ofzHseGrBgiaCB22TrFyBeQpJZdvDJqnGUNCNZSj6xLTh+8W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oBD2R29W; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsRi1N9W2WyCuYXRWMtMG5Lej60MpP6fWtWObn4qwPOpcwVlyiPSHD+vfStAm1T0O1njn8XxQ0OJsw3kUvv5/rKfnEcJiABpe0gaVFdG+PWb47YSF6KKo4R5wsfhx6PTpeuZesDjCixU0mUTHhlD79FdM/OREKyB+YZ6fTKVFkjtjEwcwg4H6geimNlncXGih+8pMYcYBJjU6IuHCLDigGnyjN6TZCAFxLo4EKwOXVpcDuWFPmwBVlI6UPSGjYWQm8ajns7BKQCZzbovHJ/KR7y2WfrpP5Vl4ao6y2/45pGMl5MlYR6DlcKGz9TP5kO5r6uJFLvHKwzr6IUVerNu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAEIWLyERDW3c6a20WLkXZpwUKiX9PAax7IA/zHL3cQ=;
 b=BVp2liqKcX1Q9kbmAEraT9C5O04ipctGYVPcP0w8RAX2s0wIyM5ZQVjoyXnFWYnjpU25Drk19VlL+c7ed/FpsVsvG8SyXr4DQVKZKt0PDUTYEJ0BAV+WjW8mIaWbYfptaMq0b6dS5GLpArjwfVKrPVxOe308qIK7PZjOBI+9HFSvdwM3gobaWMBDCPc8GGFVjY50npARmCzEoAfJxPI/8O4UwA5qfv826KkfMKcmjtSZHXlFthcNQ7xy+1o2rN4NtaL0RABZ9AgPgdB6u6v5DTQHszuHlOL1XFkapCJE1sxMUapohVdMJfe6/EXIKeh+P4SacxuCWlk5q+8RmcqjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAEIWLyERDW3c6a20WLkXZpwUKiX9PAax7IA/zHL3cQ=;
 b=oBD2R29WfQO8euXf7W7XCHfRj9zPct20eRghzBd4g/OllBge9FmGXUAKeK77mu5FBoVHxx6utsplWplHcEoUypKDZeRK0MnFgWQUNPy4T/U+0oNZ3OLWHNC7fQn6yvwA8rHZuR0WjiNJ8I8QKxrMTab+lSoDNnUTRuk/J7P4aiaahlqJ0MuxWugFo1CgwHsNtLd8u6dQCoVdsLflOfxpWY2hPUgH+C3sMEC8UIHtp5eH/O7bZsKptupTwhLQj0pdtAi9CYF9fLl6T/z70cQUgVhgG3sAtHPW41cu2GvmNb0xpGDVR/NZXvmB2DroCVKhcwu5ATJxbjykFEavlexxDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 02:05:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 02:05:00 +0000
Date: Thu, 3 Jul 2025 22:04:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
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
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 5/7] media: nxp: add DesignWare MIPI CSI2 controller
 driver
Message-ID: <aGcOj4/0umfWaaTP@lizhi-Precision-Tower-5810>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-5-c5172bab387b@nxp.com>
 <20250702093806.GF16835@pendragon.ideasonboard.com>
 <aGVWd/bo22pPeKVS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGVWd/bo22pPeKVS@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: ba742618-74d6-4d1c-3335-08ddba9f2e3f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?mIJxHrdziC44w6OVeOh0c4W++2zZdgSHd6Ll8pqJC0v4s0smC0mgFSd40reF?=
 =?us-ascii?Q?Nzsx0h41WUTHi0xcXumfXZ5Yn486XApsy7xBfI/kDK2XrKSI9xaL8ykaHU7+?=
 =?us-ascii?Q?Bx/mNbdi/fXg9EZpRLluaDkM8jlbgkhBME2kf5OpE+PYjQNPIRal0+dFE/Bj?=
 =?us-ascii?Q?8IdPkkxJXEK696os5IjDTCf3g6DU8TnZxH31RcwrFTs0Il0qHJ7DLxTX+ctO?=
 =?us-ascii?Q?AX3Z/e3z1XJpSdLM0l3OMl31U0lTrP2EebF/cAzaRWHOYklYGaAJB7cZOMuj?=
 =?us-ascii?Q?CAAfHaKlfrWgBfZh3q3rJmJIk2TOdMSkY3bvKWSfqI0kZkTTuO0QSQ9w9FWP?=
 =?us-ascii?Q?yxtFXxEFTTCdD4vQUtp9mvacdyh1DL3tmDysPwxvcQLJHAvmGsz//Tgar0E6?=
 =?us-ascii?Q?uUiaekP+x6tdmVuq+NH4giPrdVfNY/N7fp4m+BjdV7hOZDjqnLtW2pESakRu?=
 =?us-ascii?Q?a/iDmWZOHrk9bt45xZB4r9dDncmFt6guTi6/NgkLyjDYvq23sbt0eGuKoMIT?=
 =?us-ascii?Q?useKnUUpIspgjYHVWNxujtDfU0PHWq97Lwv1bQ/cfQqnAQEwEzNSz6DQawWJ?=
 =?us-ascii?Q?UdUiLE60pRv1Szw2WXfPEmLZU8VM7ksporTAjiyh55d4pSf6sJZikDpB8pZL?=
 =?us-ascii?Q?ARdFKyB7rMc32jxw6dmlo31ZPdElcw11OvoXvP3i7MMwjlXfG61oAtEdC3Zf?=
 =?us-ascii?Q?5K+/DbktDMdNgLUYJMxmOKxFsEUPYMx8oM6L6Bd1fkKjuMsPc5u4f9PDtPjI?=
 =?us-ascii?Q?aTgCMENfdWpjvD8KQAhTWOUnJSVbjkhfXPH+/uvQ0DfCyQALLmU3TuNDXTjc?=
 =?us-ascii?Q?PFFEPcNDD7lC/wiPGcthVgknZCqLh3PrnG7LK8TwVkkk2dTgXZkxo6jysFq1?=
 =?us-ascii?Q?v/w+AUBNTloxHUhGjxg3kE16Pd7SvkEjbvCCq1dZqyPd6HOyTi8OKZy1c66p?=
 =?us-ascii?Q?JXNuaxCP3uWuFpH2Y4v1LKq43YHW2YhDlzDBhWp97JXCKcNyaksGpG96JjUr?=
 =?us-ascii?Q?eRtkEVDCtC/bMKdR0I5xfXMzbc3jpwyauiesbqqt+Y3sV45Vmki2iYeSGgXV?=
 =?us-ascii?Q?1uOhVb2O1R7/FY6ujcl89HVBCrlVaYpF/QOFkREBUZBxYFra6lOzC2AoSaG1?=
 =?us-ascii?Q?000whPxJF2mar3mqobjffdHLIgETxH7NZmm95dvXJmFPo/T2Xh0ffOsMUEeB?=
 =?us-ascii?Q?Nch2BnnBfoLCLsf7L/Z6bg559m+XN50FjTBuweLW0LMVaDNMoJLjJjHpEgor?=
 =?us-ascii?Q?y0SEYAnvl9GFDe+YRXnKmDNtu7psgbwXVw+79pbanNsJ3eisgLjR4uvn7+bw?=
 =?us-ascii?Q?Br56Wh/98/TxkGkOSa7GI6qdituPW3nKgecsqHbX3PE2M6oBd8SMbON4h9xJ?=
 =?us-ascii?Q?1ju3376K36Ub2RKnCAk6+xrlpyG00+ut40y+HQh4E+1onhCmDoeXSA3pMBfV?=
 =?us-ascii?Q?1Ju0mwbF3XjLwzPtchoNOG5qyK1aoWxQgzsNDK2wPzMX1JsDUvxY3g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XlZfurh5x3P2vFAUZguvnCNTtYwbQjSaCi9gF+SldPdJzbMAOt+eK/j4KY6c?=
 =?us-ascii?Q?3ekPmk2dt58a34+22ONxGfnFmY5zbJiKXGnSsujnqc7uFdwHEArRxkz8z4Kk?=
 =?us-ascii?Q?gNWOXW/Lq/deoeuddyQU/xhXVCRXEgKVgyurgBt3eaDysr52Z5MfBv43Oth8?=
 =?us-ascii?Q?tUUViUiTK2PC5ufTRFo/YkHrKFwOCAzf1IamrdxpNRWpE44TXS+kfWjIUGkU?=
 =?us-ascii?Q?F/F813uE3cBPYGLJtpSokmnKfXITaP0qxsFIkM8lKkE2o608BGfXPSvmueBr?=
 =?us-ascii?Q?SHLDftS/465ZOV0S/naIniAk7pC5muSF/g+Fx1LJ4jroJKMUsRvC5QTx1ANx?=
 =?us-ascii?Q?0c3K4wDBETFk4AQqkTpZ62VwB4lGCdvoBlToOVzTx/KdNrNGJ17TSrvzG0vk?=
 =?us-ascii?Q?yJfDmUyYc5y0KPryTtxMPxbOrz1g53VC9fklSjmnCrQb/2umZwdZj1TRB2c2?=
 =?us-ascii?Q?4tZifzw1N/NSN+XSxvEXkZj31qBlor1F59l8na6qfAIDjxVq4NwlfYEu0USr?=
 =?us-ascii?Q?xUEAlJFUN32X9JEs/sgUJ78fX81sAXTpcJPpyNy7VnkD7Gzt2j6MeEvis57g?=
 =?us-ascii?Q?pL4n8HERFBmEsPs2fe10nD0fKk5Q8SU7tX1fMQLOx5NBt78yGAEukftFY+pY?=
 =?us-ascii?Q?KfUvtahkF/iy5ETHJXQgRjhHbztJwOOpd9g4qrakbuVQkCfF6WwIaUWXlAOU?=
 =?us-ascii?Q?chxClYBMlWFUCTAxZanL/Q0ZsgEA9wwwpIVMXIusKP9NcxOUxI4z+f7TvMo+?=
 =?us-ascii?Q?7adRtAJu/e+90B5sQZKWwY/kSSfwt7bq2iFJ2fhgwzAiv0EKY90864Jrh6DP?=
 =?us-ascii?Q?w8moz7tispsumig9fBKJgsA0NFuEGUJAtaerGyyGliuOKD9712deNi4nBjQA?=
 =?us-ascii?Q?ocCaBh7cgX32bQISeJbG+f2DbXfKam5JOgG+JLkMrP3PhlVrKMreOqn8r7EK?=
 =?us-ascii?Q?UUeATIA9hlzOBVHTHsIaqE8WGpJH1oYzSNewfQjVt+IJqhlt/ttYymehR6h9?=
 =?us-ascii?Q?XVER0J0hORE0kC8ePaXfsm92D0WepJVU92phDjNJUG4Isi3IAjTau//B5xBn?=
 =?us-ascii?Q?oJ9/IYE1Fn2ibwQ0ZUFf+6sSvO+Tg7WfStJNnbK5QvwN6lBIF4PfqssxiVmi?=
 =?us-ascii?Q?/V2ZOkkYfBudfv3K/p5Bspjuj+1z9Luee7H46SyPy2/FssHUbnMI77bMpyQy?=
 =?us-ascii?Q?Sf5Txf5Xd0GAaadNDlBrsOIkQIZexFCZKtE6Kipl9ZO+n9L2yF/7ixuLZ2zv?=
 =?us-ascii?Q?LDj2B2eE+ymm/XCOyHfvS3yquuva2Q3MSOKPsxMs7GFm05WCnJdOjunsY4pe?=
 =?us-ascii?Q?temR1OEBnSuYsOmx/CmVYWGgQJIXhhKCcybKWFzpj8iYIostk4QB3NKvbeLw?=
 =?us-ascii?Q?B3G63w8Ver8+7NQNIduL0/OqOib1p5vq7tFIaxmYL1BOyODOxVAqqT2Rx9oW?=
 =?us-ascii?Q?QA/OV40jJCkgxRAuMwqMRGDieivlFHcl3knj8oEdLuqy67lsC8XBy77PC/71?=
 =?us-ascii?Q?0Q1cjdngduQq2dQSZfgifkKMs7LqBWpO/9GOW7ly4PAT3hOGllocntAU0bNn?=
 =?us-ascii?Q?42mLGQQLHNPev5fbjsg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba742618-74d6-4d1c-3335-08ddba9f2e3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:05:00.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkZTzGVJJypkQGo0YJ8mjHrtVZLmcljOWnv3V+uWHYRVaEA9aUA+qFUrOlkPWCT5VvxDDMDL6prgpawHyW5ZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

On Wed, Jul 02, 2025 at 11:55:35AM -0400, Frank Li wrote:
> On Wed, Jul 02, 2025 at 12:38:06PM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Thank you for the patch.
> >
> > On Tue, Jul 01, 2025 at 06:06:10PM -0400, Frank Li wrote:
> > > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> > >
> > > Add V4L2 subdev driver for DesignWare MIPI CSI2 controller.
> >
> > This seems to be at least the third instance of a driver for the CSI-2
> > receiver, the first two being
>
> when I read spec, I known it should be used at other SoC. But I just jump
> to into this area, not easy to find who use it easily.
>
> > drivers/media/platform/raspberrypi/rp1-cfe/dphy.c and the second one
>
> I think this one is not good abstraction. it should be phy driver, which
> use "test" interface to community MIPI phy. I think it'd better create
> a bus driver, like test_if, DPHY should be child devices of this test_if.
>
> like
> 	csi2@000 {
> 		...
> 		phys = <&dphy>;
>
> 		dphy: dphy {
> 			compatible = "...";
> 		}
> 	}
>
> 	The tough problem is that dwc phy have one kind of combo phy, which
> 	under both dsi and csi controller's test_if.
>
> 	CSI need config such combophy by DSI test_if. I still have not idea
> 	how to descript this type hardware yet.
>
> > drivers/media/platform/renesas/rcar-csi2.c (the latter seems to support
> > multiple CSI-2 receivers).
>

Are you sure it is use dwc IP? I check regiser layout only few is the same

#define V4H_N_LANES_REG                                 0x0004
#define V4H_CSI2_RESETN_REG                             0x0008

#define V4H_PHY_MODE_REG                                0x001c
#define V4H_PHY_MODE_DPHY                               0
#define V4H_PHY_MODE_CPHY                               1

#define V4H_PHY_SHUTDOWNZ_REG                           0x0040
#define V4H_DPHY_RSTZ_REG                               0x0044

Anything I missed?

Frank

> This is one mixed PHY and controller to one drivers, which is not problem
> when use one big MMIO space.
>
> We can create dwc mipi csi common library, let each vendor driver to link
> it (dwc pci/usb did this). The issue is that I have not their hardware to
> test it.
>
> > drivers/staging/media/imx/imx6-mipi-csi2.c
> > seem related too, likely for an old version of the IP.
>
> After we create common dw mipi csi library, we can move this to there.
>
> Frank
>
> >
> > Could we please try to avoid code duplication ?
> >
> > > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  MAINTAINERS                                |    1 +
> > >  drivers/media/platform/nxp/Kconfig         |   11 +
> > >  drivers/media/platform/nxp/Makefile        |    1 +
> > >  drivers/media/platform/nxp/dwc-mipi-csi2.c | 1675 ++++++++++++++++++++++++++++
> >
> > This should go to drivers/media/platform/synopsys/
> >
> > >  4 files changed, 1688 insertions(+)
> >
> > [snip]
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

