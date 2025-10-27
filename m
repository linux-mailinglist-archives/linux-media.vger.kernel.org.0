Return-Path: <linux-media+bounces-45695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFC8C0F8DE
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 18:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E2DC4EDFDB
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E19314D21;
	Mon, 27 Oct 2025 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X4J5JQJX"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21931314D2D;
	Mon, 27 Oct 2025 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585042; cv=fail; b=jFUHwqQjyMdD4EpnQJsOb8EjBRGh+3Ud8/3CqbGs+EdMEfMJ8DMPiZVwoj4Ycd9m3UUV8WZATDUsgJIyCqBf34B7bJFRlXOgb+CtvJlhX+bh6ALz3IhAb2+kOfGpAE28fq1eVsL3GaYxZavSUguoa8uc9QCDgwWWcfAyJKmQW9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585042; c=relaxed/simple;
	bh=YObeFY/O8vOGlFRWLkKbBP23HZvMGibxKcUKnijqcVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rdKg5T54FO8sn9tHjQlPS5wFvsoUY0q+ZVg+Pz0SuQsnMKSSivjArAh93ogqZsdpN2taTFfslOKsssg0+MpM2n4TbYAFQO8iro5bIHxs00jbZcMglJTxpvXHzJVEYgvFU8qPcJ7JfWdIbS4hCL3y6Fe3/wh2uORHqpVasHRAg2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X4J5JQJX; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZLuzk8xMy0bez18bCWkp+j4GX4SLad30kVe2x+p8oGcOKohi2KGTaBafsnmrJkqQxL3T1qLQWVa66uk8pkCydkjB0AuZ9b/76R7pv603rtrAERsG01y2Td8xelvfjAdI/HQ3WWEldxpP2e1yG47bjMMGrPVKsjl6S7cwA4rkj2fP3gKkwlniAWqJUf68PoHFbhIazxq/5idXb/1qhJVREuC+DTGZ9wEQ8Pw7NO8c5BtxpfVTiqNWSDTRhLpCj9H94FN+OM5YbF1x97RF1uUyc+IGsFy5OJ3cNRACiRtOe83L/084pdHreAJShBrB+O0PoAAIgtP3JEaYzLq03xWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmY3Y63ygZbKYxN8hDvRmfLLfX1KiCJc9JiOCWlEe0w=;
 b=OWOLZ9vENiVc9Tphkgkq83cx1l5o3OexfbFzIrCe0KZb2xjtqtwt7fe9Ne0sYWtt3K+bZZaDlBpsyFvTDKGbjjtF15Bje4tFSoWV8T9jidAUXT6A2sGIbOEzfwX2MwZUiOjGH5MrBgDJn9AOnb0Yn75lWeJlSAFof1H0jp0qx5R2MeIrWNFXowL3g0Te86wWXsfXRx7j6gnrtiZLnJ8Gdlx/pDtemPQ/JR1ptHRNTzBA6TpHSTKZgaZuN2vph3I12HH0+QDZjxu2W6XjyXHuAzhYHNoQN1sPghfWkiYR1+0Dt7+/2JkPR7N2EK8ESe8fd5ZGv5kY7Pzjgrb1mMRJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmY3Y63ygZbKYxN8hDvRmfLLfX1KiCJc9JiOCWlEe0w=;
 b=X4J5JQJXweMSa2Xu2cqRqESmyTEi0+LMTb8oxGB1BFKmB2j4EiT3Z8pNIQX11eFVxUpntcAVxdlWB4kXCwZV/6H1HVDIhQLh1dQBQwQbXTg3Ghbb3ZZDWrh+QWQCIMBccZSb7ere0zXYkUOlhrg9OZIHLKzf5gNZgsN0RMqWF+fn5vOCtRRparHEjjRT1kCXzvvty7mjA29koO/SAVdZLbJOyG3XYJa7QYkQa3mouygxzT4HwdGpQ1FUXN7EXuHr3AQ8VYrGmXjPrnFmvUQhk6pm/Ek7STiHmvzCzlKldYhrALEa+xHyDo5PEVPNAyyuqpy9EJujwdxnejwxn4ANEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 17:10:35 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:10:35 +0000
Date: Mon, 27 Oct 2025 13:10:23 -0400
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 02/31] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Message-ID: <aP+nf1hpvkafxHrF@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>
 <20251027011927.GS13023@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027011927.GS13023@pendragon.ideasonboard.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 501169b8-b6cb-4e01-c8b9-08de157bbe5e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?5jB5BbNH2UY+wtiyoCZ/jl4eJYkUfsTWK5LSoPMEDMCSf/4X90zEnw4HGTl0?=
 =?us-ascii?Q?mT2G+Wvcvbc34HGztjQ1NtyuTXNgxC7V2rh7s5t3gO2eqaOb3DNzjZ++X2oP?=
 =?us-ascii?Q?NETan8QtPR25uHPvBcbm4oByXDvIxuLFqfr2rMHz4CoUwklZtkL4UXIJvRPs?=
 =?us-ascii?Q?EZZGXzDNHl5waKS3G6/IYodKEzHTZLWathweotArRWw9nquOvCZkBfxdk2Rf?=
 =?us-ascii?Q?ufnOZm9+dGYhwFK7NquY3Y8TlGn7dlI9Dh53gBT3zBrfjCsqxnJL9hP6/mFX?=
 =?us-ascii?Q?vClUf/NnQbe4xvWNP5EhHzTFrYtNwrNFmxInCSZ00k/xUtSNZVVZA5YMGY3r?=
 =?us-ascii?Q?jIL8FZnjZIz8MtMGFME0GBRVyLypIQRzfPLRCgTlvkXc1b7EM2s4wRG7WW0E?=
 =?us-ascii?Q?R+xL6LbW5Fpe8tMQ7frpvxk4/8xyHJlJSGAsJ8Vs1/uBRGP3HMZk5VhoiGci?=
 =?us-ascii?Q?r/mKQHnQYvaiJqc1tB00ePjRKDd1JUgVFF82HxmHOS8d+ldASTPzsDRPQMU9?=
 =?us-ascii?Q?x7WZAhJT0pU7gwNgZ2vbRcWQpjxqf8Rjy+R4yErCAFbjgJ/B1a5KKQoJLp12?=
 =?us-ascii?Q?bEflGU90FxggZUBcumG5Eg9aG73HxIxYXcvU1ShWDMYleH3TnIOMp988LjGZ?=
 =?us-ascii?Q?Wehlbl4rLzrwzaSkr3Sx3Man15ru2jtUT71FwUwClmQ4Rw+MIB9V97Jpdr0b?=
 =?us-ascii?Q?QSJG2mPGXo7UtVZuw9GVr3dZfe/HNngcXNSJhdChDT4qpcR2NiIR77C3M+2U?=
 =?us-ascii?Q?j3DHQhWUr2hbjvCH4Lj4dBxT4lMehCofCDRWMtj7KzCgbvMNFLsNujP33kIb?=
 =?us-ascii?Q?mZHjgKjzWKuAqlUC2nCBrGp4HI3+Sf/CSyuu+pnJd0sdzON2V4+5tgvLhhVH?=
 =?us-ascii?Q?9zo4h80CTnBE8PQavJzO2xeeTiE9dwyI44U9qyKRRlWWkHHLa/1sDTfFLa9q?=
 =?us-ascii?Q?fNGkke9E34PjjJQ4+IiJjAzJrCqrjqmtVTYg4lswIrGidinUKI8nNnHiNcIq?=
 =?us-ascii?Q?z7g1zEpC/+uK9qeP8o2jAMXy4oXXCjQxtC0iMhwWAOlGoPSl4nOnDYC2Gt1i?=
 =?us-ascii?Q?jDueYik8tslI+nrJW/jEcXDPa/8hVGNBhLSEgh+kfiaQrRln11QFzKgEIy1b?=
 =?us-ascii?Q?OImLBK5j0mD04J4wlaehgWZlCqDDGDmLoBudiWVyYS7ji3hSywPMjzM2+cgf?=
 =?us-ascii?Q?OSna7jN8vTDkJDb5mR2nE95nxLsEOXD1BtTtc04eq7VlU52gnPN+o1IaIXjL?=
 =?us-ascii?Q?kQ4Un/U3vLqUQHdak5Woaj+QZ54VbuvqemR0KDe/g+DZMqH2ZP2hnTa01Pfy?=
 =?us-ascii?Q?XH17q8FLaWxkP0ARKA80h0cNSh3lgHxibhGFzUPHxTUBe1ACJh3FfGarUNcA?=
 =?us-ascii?Q?b34UtuqOXiC6xuj4dfZYF6OBJvGhZ31F9/B45WuAjtxlvkzw5Q6zlFgvU4vT?=
 =?us-ascii?Q?hIj/aYjkUmzhc625xaFm/B769IAiHTIHMECz7Yis+KGgrzUb7eXVc3ZLQQDw?=
 =?us-ascii?Q?aEZUxUNBXrWgaifBrLLB4qgKPtkP9LlS5I3Q?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bacKZ7FGru35UXdDO4LU0o20zjdghaje+z72IP21qfKLt9NxB9YilErB2z/O?=
 =?us-ascii?Q?TK8cNz4w8NTjshTaeTksnN8/f4TJtXr51SPCRqrVrYDuK6TuCIRirUBCV7H1?=
 =?us-ascii?Q?J73XopqyYqUwUefja+i5ZnEneCmvDnpeyzsHWGpc/LbaVWXDAfQ/KbSu6ZVz?=
 =?us-ascii?Q?m2yt6pA/4YG+iTeIlcuJ9XcIIlIHwgi02mDfrjoOqVDDLwDqFn/1/AlQgewE?=
 =?us-ascii?Q?7j2im0qkJ9m3WDzrYG6WTqPl3KweuMkXhZoyis+ZhSjV9I3hvI0+/jPxkaL3?=
 =?us-ascii?Q?qM5i4tvoixlOR4Iz7W2SRzK2TbCL1EVnJU1KX8goTt0eA7DeNK2zCpj+c49D?=
 =?us-ascii?Q?Zg819hgxO2mz4dtVd8de2lzoI4mJmVJTHeu02zJgd3X1tPjV00OookSkPk+S?=
 =?us-ascii?Q?0Uy53CtDfhUh6WBhk+G6ir/HVCNDbnPa4qKc+Ivuu10pBxwEkg6lkHPjgzEX?=
 =?us-ascii?Q?iTuMIKztaSt8MHQltm9L/wuhGHBKaHWGCv5LmxNv9MdjEyWur3YUGdFLcfwQ?=
 =?us-ascii?Q?PadYmS+eHzvedZZgYddlbA0QOxTLqHVJO3nf/DONQ/CoJDxGRrBLNQ/TCjMW?=
 =?us-ascii?Q?hec2mxqaABoxkqminxQNeEjqm5swMeCpvbBsaxlPI3J0JXdmEMMQjlEVyp61?=
 =?us-ascii?Q?8CyMRtXYIP45AQpfnuZt8BAEJ73cJptk4L/Cnvaj9WpRxYPNDBPs6JcjI+M4?=
 =?us-ascii?Q?C89IUyTlb1IgiiVsQ4L9KIw2zBFkezDJKm1F1xfLSPIhPc8/h66+UdRwVh/M?=
 =?us-ascii?Q?EVeQp4qkB78GmGwk7UUnXIY/bPMd7APS0xMI4B5zbwKXnesH3om5YPXdpCwG?=
 =?us-ascii?Q?Un5Vr5sXg2itG4gNiZk4sOqXrFXjjCnkcZXgOEoWDoh3S3D+8YsfeSMl3lfO?=
 =?us-ascii?Q?896vYCF5RXZ/vrVi2a4sLDTEjK3yi9ht1cqXwzaqNwnny45qxgoLZ5qu2eLN?=
 =?us-ascii?Q?Nkdp2rH/rcV5Emq+LGesu46BpT2DoxOL1Ti7YO7xSglPNaIN9E9YrbtnJ9Sm?=
 =?us-ascii?Q?IIFuie51IlfiICEWfStXwDgyViWcq2hcRArgFyKs0QUjR6co7+zbAF3UQ2ew?=
 =?us-ascii?Q?GrF0qwa28/ZDcDFQgbmMki2tLRLPxGhSrxPg+eHAGR9+Yt/1q95CkRKTx0mR?=
 =?us-ascii?Q?jMsvdlOtoUb2vTlHDP9Yv4BHAB1oKM3nL0Ly6HfVmPT8UhZb/Zp2ynH/IzFv?=
 =?us-ascii?Q?OeHpvwtZaUBBSVwyXdCHwuPWP7aLwvFz1ZmeKDvkiAqnC3JjwZOuFoJkzWHB?=
 =?us-ascii?Q?xul7h5GJg7cv4lLfBNZeHUdPIr8v3hWCjlCXiJbulOzqORD8ISy3ItNA28WS?=
 =?us-ascii?Q?Z2Pl1bFjUSn6Tf02wQFi8wdRYNE4tQkR+GwSn3rfTqgpd+TA+UFUF6IazZIi?=
 =?us-ascii?Q?Y7Z/kleXGe2SbEKmBTy9o87bGcG4YofQNViySSAnKxHYM188pE7BSMbKl1wQ?=
 =?us-ascii?Q?tk99lNcV0jXar5L5ntcnZ3NDNHo5UgPOeSfmMZTqZsrDuzval3lfPsVgnpVL?=
 =?us-ascii?Q?MnLmQmkUgIZcSJY1CJfslTE6DHcF4ivfqpS92pR9CUdZXExtncHT7cpAVcla?=
 =?us-ascii?Q?s2uifa4JxRmoxK42uLQ0Q+NgkrHDd/LyY6CZ8cM0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501169b8-b6cb-4e01-c8b9-08de157bbe5e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:10:35.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMwr15IL4Tsv4CXYPERhySiEvw9SJWUc1p2+fFpn32FSsAKiKl9z6KnJ+LA5bIM9gULdlNDGrT4WBaRYelCSqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

On Mon, Oct 27, 2025 at 03:19:27AM +0200, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 04:15:37PM -0400, Frank Li wrote:
> > Add helper v4l_get_required_align_by_bpp() to help get width alignment
> > requirement. Basic replace below logic and enhance to any 2^[0..31] in
> > drivers/media/platform/nxp/imx-mipi-csis.c
> >
> > mipi_csis_set_fmt(
> > {
> >         ...
> >
> >         switch (csis_fmt->width % 8) {
> >         case 0:
> >                 align = 0;
> >                 break;
> >         case 4:
> >                 align = 1;
> >                 break;
> >         case 2:
> >         case 6:
> >                 align = 2;
> >                 break;
> >         default:
> >                 /* 1, 3, 5, 7 */
> >                 align = 3;
> >                 break;
> >         }
> > 	...
> > }
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > The same patch will be see at https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com/
> > dw csi2 patch also this
> > ---
> >  include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 39dd0c78d70f7b935c2e10f9767646d2cedd3079..0a9da5e8daaddf26903d9ff4bed08b283dcd38b2 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -704,4 +704,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
> >  	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
> >  }
> >
> > +/**
> > + * v4l_get_required_align_by_bpp - get align requirement for
> > + *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
> > + *	given number bpp, get width's alignment requirement. For example,
> > + *	if align is 3, means require bpp * width must be multiples of 8.
> > + *	    bpp     return  width's requirememnt
> > + *	    0       0       none
> > + *	    1       3       8 (need 3 zero bits)
> > + *	    2       2       4
> > + *	    3       3       8
> > + *	    4       1       2
> > + *	    5       3       8
> > + *	    6       2       4
> > + *	    7       3       8
>
> This is supposed to be a brief one-line description. The rest of the
> documentation goes after the argument.
>
> Also, have checked the formatting of the generated documentation ?
>
> > + * @bpp: input bpp
>
> I have no idea if this is a bits per pixel or bytes per pixel value. I'm
> actually not sure what the function is even supposed to do. It feels
> it's really a ad-hoc helper, I would like to see it being used in
> multiple drivers to see if it makes sense.

drivers/media/platform/nxp/imx-mipi-csis.c
imx_cpi_set_fmt() in
https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-3-4dfca4ed2f87@nxp.com/

I am not sure if userspace to pass down a old width to driver, like 1033.

Frank

>
> > + * @align: expected alignment, 2^(align).
> > + *
> > + * return: required alignment.
> > + */
> > +static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
> > +{
> > +	int pos;
> > +
> > +	if (bpp == 0)
> > +		return 0;
> > +
> > +	pos = ffs(bpp) - 1;
> > +	return pos > align ? 0 : align - pos;
> > +}
> > +
> >  #endif /* V4L2_COMMON_H_ */
> >
>
> --
> Regards,
>
> Laurent Pinchart

