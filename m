Return-Path: <linux-media+bounces-41565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C7B3FFBF
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0C95E1104
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3EF2FB994;
	Tue,  2 Sep 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZJkc4idO"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4D15E8B;
	Tue,  2 Sep 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814520; cv=fail; b=hPDDijhxBRW04xDu0vLUaYaJ0zne7HZ7bQ8DVW0QR8vJfizqcPn2OkmPO1M8ujKE4JkNfBZ/0ZvBfAPeI7vF/Dsw5pPv0RIeYMBUDFSgKj66QXkgqn6otpIrm7jhVqAudaEeoOX4yZNZ+ubupsTCtP8PoaFedfQUW/EVxz2RlC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814520; c=relaxed/simple;
	bh=IV5pkaE8AveNqwVwccgsrYUQhxIAsJuTY4rf5R8LxvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MORco8I0h5y4oa523kWV0Suimc1lOpve5cLxaT4GqLBdaN3KP6Ne1gg/iEWxZuaIV8/TrTUbzCrMKlN9TPLHiQT6toSyA5BPg3C9eqbEpjbPc7T4CEios2D5UzR5zyEUyHmNhxjWGTn1JTLYoPxaXanFPWND70XCmBK08R2VERI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZJkc4idO; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtRYMdvbs99FcmeFtJi66JlqTtdj+6hq7OQ7i5HFuFWNjBVVITwkMvchydWao8bGQ2OwFLarsZfiBWF//qfAahwkJezKw6mLq8Ph3DoLOUEmSMgiIKjhfXp9wn58DobALkB26d20z+X5AIS28g7PTv6PojIBupKML+zeghc1Jp+qILeBhQ+z8m486sLIm7Na043RQSyW64BaSyumBG57v/sX6ZnVsnb+PRMvpvhEAWuWyvhqMiOVeDuyg7xWpKYyh/q5aRSnaV9pNzPhAgJwed2iTzyUaDHnof3PdysDAMn9nSuoK+hRSopTNUweFbV6eo6z3YuOaiMagphA63R0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cGqZH8W27g1IHfeYxxXo6Yv3X07v8GtNJ48ngZiX58=;
 b=DN2UIjEGYIy9V4PUGE2ouliaAibn4vLLqJqmR06YZfzqGHvb67D0cYjx/7XvsAfgP27nprPGb2wtDyqonXHViDrxn+lospnYVc6RypfaKAnw+fxc/F8Qzz0519hz3W5ViWw3quJGkCJSUdDiGMt/S8x60myOQu2qZx/xXZ3TSGlNxbqqRnq6eT7nn0YNs79KKTWkDxnzD22jWe9PoAHJ9vLsJQfc1BPISRnQLzZZSL8gOyg/46nUcNpXAL3saI9H1vq2CpUoAdqMXGqzZfsrKfkL4eYZspUl8pQAOwuQRwHRfWlGufoUg0cCaC1tgaVVWmBgcFL1Y12zGjmCbYxp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cGqZH8W27g1IHfeYxxXo6Yv3X07v8GtNJ48ngZiX58=;
 b=ZJkc4idO7xh9/VX4e7u1Bxv6tdnmA1PZPytL76G7LAGkDWiCk0KZP36m4i1jWEKCSeGzRCSZ0B2flfX3VdOTgowDwGa7zGWsSoDS+win5OOoA88W/eAV0Z6OJbctKQHLUbWAtuhZTqbn805Cw4f9TA0WLdFmdz5FzjyBWxkKJr2TfNARObeMG/4MhoD8Ilt4G9cjGXBnwh+hY2l+xM/uT8HjZKTk+5jubrK8OWB3+fdwQdco63nhce/KWbLKGe8hNbbJwE/YdLtpskiXQAwddLOdz1QtugI7Jf145goVwYjpmNAbLQ29zKWS07hPJhlOOmJHBO63kqpYhp6Znw+Pfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Tue, 2 Sep
 2025 12:01:52 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 12:01:50 +0000
Date: Tue, 2 Sep 2025 08:01:40 -0400
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
Message-ID: <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805010822.GC24627@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH8PR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::9) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI2PR04MB11276:EE_
X-MS-Office365-Filtering-Correlation-Id: dc410721-89f2-4949-25d3-08ddea187fc8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ZkVqkTF8gSNaE+LzT9VuCdvEvazKTxbmQkENJtv6YNRoWB+toLojLrB1GRrU?=
 =?us-ascii?Q?5fL3VZHVnLKF0LM673vlIwqt/3nj+mT2Ym5Rg6CwSNPjeedfKYHz7g9dTayj?=
 =?us-ascii?Q?t40ji8KUMvFk2HZ5hOYNSJFU6vtU9viHNxB+FmWmLz/whkBAE99djHTXnf9S?=
 =?us-ascii?Q?ndPW9MhwyG9xpfjpfCCGWHcDj/XK7dKguphwupu2NZuo6ZgX76QIEtLMyauw?=
 =?us-ascii?Q?j/R2uEUk9E5CIz1noJaCtIr1oXSRBvJCIdC8wWQjf0WzSIRmuvEHrwhOzsnk?=
 =?us-ascii?Q?QySb/jzfjUDs8a/55O7tpTCXKRxhnoy4Agh3M/M4Oy8AjxacJ9MbKeo4kjp1?=
 =?us-ascii?Q?1yaegT9PYd05UW1yUwnGvkbegVhILkhU7s1biUbeIfmffHBBFAfuAeUYJw7g?=
 =?us-ascii?Q?h/2RVLuu+TBGDAtfRJGQMXb4qNJmA5PZz6oksXP4+JQ/YJY66/4ODJpUfu3d?=
 =?us-ascii?Q?dsRwkw3QwnACgY4rR1Jtngce/DwcADusETnTcp8kEzdD3Dinj3+evDd6KN0l?=
 =?us-ascii?Q?1COcNgG5nyW/se5jgwbTZUUi3zAMWA6lBrChJo5LmOae6WrNU+pyBwDrhMdi?=
 =?us-ascii?Q?gf9KEWUn8r2Fd7h/UGxevWMHnxnUY7tk90gQR5Hlq+GGRmXb1tx8eB19DW3M?=
 =?us-ascii?Q?l0yGaK+xGREuhxeW6ygsyrxbXYj4ok0gX2JSFyIXpA45GOAZFMUzRE3lSah4?=
 =?us-ascii?Q?tqC54lZi0vdHNhtxqnaNqXZfQ9PrcndxvnnQRxWG4lCR9nwQoNWBgKB8mOtI?=
 =?us-ascii?Q?5Ie9H/AG+inqxKSSdg16q7BGbGYcbt1tlycuRQ/V1QbPGhlEbRHSPDPuKX+w?=
 =?us-ascii?Q?MIVnOae7QyqtWGFfz3aKImIO8tVC7znouNrgATMemzr/sqSOymWjCRxy5CrD?=
 =?us-ascii?Q?itni2PVQ4qcMAG8jC+wmrsaZ/3KOYHgrVVoYzeAQNGBSq7lQhcT7OqtD+izZ?=
 =?us-ascii?Q?mwqktRgTuDyD0z7fBQAQr8tPIVMvFqLa6YT3se6IyqRtLUreG8adkBCqGvlY?=
 =?us-ascii?Q?mX8iOWXgHC0FnvTjrWVX5a2nuOg7yoZ/qMWTBnZt/IS7i6daF60TjEGQGD0S?=
 =?us-ascii?Q?hhJnN6UqNoXgkrbdDXi5M4VMIceBKoqP8E0P/09aBuRRqMFKlzPs9noekVQW?=
 =?us-ascii?Q?ydAWzoV73jcRy5/XwCN8p4d2ZdaHzVX9cApo6n1J9zDtlaSYx27HbJ+Kmi7m?=
 =?us-ascii?Q?nfckqF4RkBb8xWl2blfZlobfRn9MsAcjdeNlw02VqvLwQcQzxKrWR26RJqjK?=
 =?us-ascii?Q?/05c9ewPT9V0Pj/8ztSBloD3SDx11vYykEKIoeImd3CPvMmMpxzL697iwggE?=
 =?us-ascii?Q?uOTr0zuTWGcqTMLHtwRIbfpR5lBThv5Fbgl2BbQc7LvlUPTzX5/lKhPzpQr1?=
 =?us-ascii?Q?aLhh+WDa3tfsC+DfkFl05E75vAEdy1G+HOovVESmrnuQ9J8cvdtQwLkKz/+y?=
 =?us-ascii?Q?F94gktxuWAbISqCFH7BVWW24ADwuNLOa?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BzeUIrZptyY0l0y++CinsMbvxQi+We9VpbtFt/16QGZWf4OfK+D+sC4lZIkF?=
 =?us-ascii?Q?upOyHiSk7KwBYho7JxtLpuClljaFEvbSBatHjCZ6hw9Ay2qNXFWI19+LLA/U?=
 =?us-ascii?Q?EXduOS7ftkY2b4D2GN+4WJrDwuWYW1LtQnEFQtwZmH2K8tLSb5HEbFZkJkQv?=
 =?us-ascii?Q?/FMR37AptKGc8LLQSwYcuuMyxayYf5wUtoDiJcpmiYu5QFIzWP+WoT7Ke228?=
 =?us-ascii?Q?Xap2EWE0WSglgXYxrdHjNBC0OFlNKUNTfx/zcK6rhDSlzN8p7BJHxthIE2iu?=
 =?us-ascii?Q?XPc07n4r7M4zSL8GTigpvh8bsbPQDsTjcIzViAtGzeZWsiGvPWTj+81CXWOf?=
 =?us-ascii?Q?xNp5Aqz0+QCDYsS7K2IQbps4obALHWoNBGXiHxtI9OmcTE0Qxhr/JSvUZ5hN?=
 =?us-ascii?Q?BOCPQoM28a4Td31KmYbBPaBo5WUWtAA/lWjBvS9jEuTdcBhUTSTzW7v/hnZZ?=
 =?us-ascii?Q?PJ81FBcg7b1E1FCINfDKjOy+yG0+ejv3lSYMGMCDoVD+qMGy+N8SsVLZBQ3d?=
 =?us-ascii?Q?WV+5cD0S1Erkuuq/0cK5sPenvApLV97+5TDR93TCzW/sUfVxrZwhvF1ZzI53?=
 =?us-ascii?Q?fAleeP7nPoE08DfwSvl/ItDLKEbyGZr/t0D/hg/IN1XLW7ApuDBgQE4qg8Fu?=
 =?us-ascii?Q?+SEdesunIPxGcRWrZgKKNVBNIMinR8aOO2UN+DQeZwaaOxqzS5klZhnbyBVN?=
 =?us-ascii?Q?/zLDbp9e4J3E7EfuieaGMipGq5Kw+9vWfFAN4DvCUc0CnYPzCc4le2qEcFQ7?=
 =?us-ascii?Q?OY0Y5ticnWekpAhCKO3hebuwzzbYNjoGJmtQpmtzE9j/jhUk2e0FFKDj9hZj?=
 =?us-ascii?Q?kJYHuRZsitqOCSH4yO+D2A/DD9fMyclAmMXj6qF8YJ0UJCJoLemAf/saJZUQ?=
 =?us-ascii?Q?oMwCCWH4DnncUHEKvQeonDFCPwqMQiy3zTSiqnjb74277DOu4EPmx1i6nitS?=
 =?us-ascii?Q?kH4AfmNTYXs91noaJsYwdwn4Qbe6Bj3w2SxYmYsymg3syu9O+mh5nnbLSkRX?=
 =?us-ascii?Q?/39yiO6Fb0Gz/JGxZDAQJknG0J3BP1u/REuoGzTZ9LxJlVUMCGONbX+sY1BQ?=
 =?us-ascii?Q?1moonRxF7Ux2HKDjug7xrGw+2EOOJcQKGffsT6D7aw5LyEKH1OF6iets41tE?=
 =?us-ascii?Q?WcDYRjOx2qzZL96ld2sX2mUvEffS+EcKnHGhiF49eFcINKB4yc4Olj2N+3vC?=
 =?us-ascii?Q?PUN3u2tUlDgw2m9bXI1EexO9iaOQAVto6BvqpE11kwsWHuMJUjUUUQe0LeNN?=
 =?us-ascii?Q?p5mVc0it+FyykrPnpBA26Kd/Ep0fWShCrbhJsmTrt2l8gPcssmLnqP2Hun7f?=
 =?us-ascii?Q?TtdVYIW21JqZZSanTbB9gfNpVTjcMuDJqJXr1fwIYXxgkpLhXoDBf1ia99YE?=
 =?us-ascii?Q?Clnzr5wQjT7rA+k22cGAIwOh0JbK8KlyIJ8on8A8ex/FVGo2CMjElk8Ay6n4?=
 =?us-ascii?Q?5l8S3haiYJGkeKJ6H+Zb2G0maRDiBJlHAShU7A9/lDDEq5U355BBhN6lR+tQ?=
 =?us-ascii?Q?bo1oXEA7uGTvo8QRu+4hfxZa51sh/BOH3z2Pn2qTvGVBxa2VdTUc72hBjDDX?=
 =?us-ascii?Q?bX3RuxPek17KBGbo9jQWC572zDk83ks2AKGP+fdF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc410721-89f2-4949-25d3-08ddea187fc8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:01:50.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWkbF+k7P1LVZRZc3l/nc7TBp5RGoMpbpKiWbfuaWqxM2dyNZd1UwhLVqRixSQtvZGcHtNzqpod527MJdT5nuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11276

On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patches.
>
> I've quite busy these days, and I don't believe I will have time to
> review this series before coming back from OSS Europe at the beginning
> of September. Let's see if anyone on CC could volunteer.

Laurent Pincha
	I hope you have good time at OSS.

	Do you have chance to review this patch?

Frank

>
> On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> > Add parallel camera support for i.MX8 chips.
> >
> > The below patch to add new format support to test ov5640 sensor
> >    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> >
> > The bindings and driver for parallel CSI
> >    dt-bindings: media: add i.MX parallel csi support
> >    media: nxp: add V4L2 subdev driver for parallel CSI
> >
> > DTS part need depend on previous MIPI CSI patches.
> >   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> >
> >   arm64: dts: imx8: add parellel csi nodes
> >   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Changes in v4:
> > - remove imx93 driver support since have not camera sensor module to do test now.
> >   Add it later
> > - Add new patch
> >   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > - See each patche's change log for detail.
> > - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> >
> > Changes in v3:
> > - replace CSI with CPI.
> > - detail change see each patch's change logs
> > - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> >
> > Changes in v2:
> > - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> >   because pcif controller convert 2x8 to 1x16 to match isi's input
> > - rename comaptible string to fsl,imx8qxp-pcif
> > - See each patches's change log for detail
> > - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> >
> > ---
> > Alice Yuan (2):
> >       dt-bindings: media: add i.MX parallel CPI support
> >       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> >
> > Frank Li (3):
> >       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> >       arm64: dts: imx8: add camera parallel interface (CPI) node
> >       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> >
> >  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
> >  MAINTAINERS                                        |   2 +
> >  arch/arm64/boot/dts/freescale/Makefile             |   3 +
> >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
> >  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
> >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
> >  drivers/media/platform/nxp/Kconfig                 |  11 +
> >  drivers/media/platform/nxp/Makefile                |   1 +
> >  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
> >  include/media/v4l2-common.h                        |  30 +
> >  10 files changed, 1024 insertions(+)
> > ---
> > base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> > change-id: 20250626-imx8qxp_pcam-d851238343c3
>
> --
> Regards,
>
> Laurent Pinchart

