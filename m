Return-Path: <linux-media+bounces-45694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CAC0F7F6
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 18:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A2D819A4B04
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB107314D21;
	Mon, 27 Oct 2025 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jlu22S9I"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8343931353E;
	Mon, 27 Oct 2025 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761584406; cv=fail; b=Zv7n6jOYGyy5ggWtCAQTUrxsXzVKPmoB+4nJ3mWC76dppuVGBw8Br0+XITDKPsgGwNsNAXyAzIQe83lT9rADdbX6y8HvOWCV5vX2Acf+/4zYVJetthhv3TAeK2KX9REn5K4svIN7gkWdlewVUD8UBCSAk7WAAJfA5HacSYQPWFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761584406; c=relaxed/simple;
	bh=MUrTFOpVDweEm1RvuG8oZA7SKjm4drbY4Or/4J6Xe8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SYAnfQTvgU1VuR1KKfEnDI3Vv5LRw7fvSBRMWB3Wg6Y5v4QOV/nWS3oa/IfTLpndpOEQgdpnnp+dIIRXmhD1KPcmWW+PQHnYlEzVXVDBGVTruG5owPgSYnINV4FjVGfgebiWkyN531KHMSg84mAxNQBnpZCi8X6ZGUOe/AXWHTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jlu22S9I; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhdBBqS5jLXyj00/je/pX4rMWCJjC594AEjA+D4KeVKHCLjsDNJTFQIngAyOWgq8eQACcWPOG0QRY2JA1pZ2Cx14TGsLqVezgc2i0U8JaxIrwaInqe5VzXXhW5ikle3t0R7OhkavGy6VEQGu6mu8YBEUe3huUKA9kROU0YEDASCYzqe+VEip2azoz7pNcgY0bAL6ZvYHAZaGqUZtb6fp6gcAoAjxzN9DtYXpAik0Yht1SyBuj1hoVk7RyvR99a42sTRBQDHbIzA1MR01uv0SiHl4MalReBgT8Og1ESamVsPsyqiEpwscIITnwoDnaV/p5ql7gqHFkW9IawO3P30luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne5scznSDfh9PROaO7VW2LLdYAzDhH0exePZjp/CCm8=;
 b=kvRhLgECDSlhyOzO5l78V/1HutJG3moaDrmYdmv2zqKFfbO3ZCmXLhZ9Yjvpk96KWbNKEA2DyvYzUZeDiYMWRj0mz6xDjdRScau+RAWspwFYqZf0X5NKJO2iSyQQpK7cKRk76xbXmJy8n1tDBCF9GtuTfmyYerY5Z7GF+PA47rOPPLYE4pI/ZK5v1MGpVegnAzfYsDs591Hgf6CVcldHZ+2jdBAGCQ3R8MZzMnBWlnAanLgQVzmCxShFY5/Jw97R6JD4SGJLzStslm0f8qnMYcdyCu6F5HtumwpsXYO4DJNEeHOxdK79Yo1HNPi9jyLh9rRaH2ASg/EuHNbrmICHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne5scznSDfh9PROaO7VW2LLdYAzDhH0exePZjp/CCm8=;
 b=Jlu22S9I9g2G3F7DevYhBcIku4zbcUtZ2VzQt44a4NItIWP474xoRV1+N8J7APblYk7+RoW94I1tGQgHZNndh2K3+ZQcbWTZ3ckD56S3ASTNRN5kc7g8kphmWdKL++e+rADzY2tlhN3IvfFuWust/wcitQiPoiAoVjMe7UngMLSlSo7UFD3Zw/HOAVqx1pijEH53MiGxrRwPs4c4I/kYS7fPWo7yNkjSJjmv+zF/4x2VMS0ru1YqQ0nIwLoe8Fns7AIWWOcZK+zDpLK14L9m0xRZUD+i0OCrqrSyePW40sKoEgGoPImH1hC3Or1D9ACHMWYyFNUA1UbqzOPFv0qptw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 16:59:59 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:59:59 +0000
Date: Mon, 27 Oct 2025 12:59:46 -0400
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
Subject: Re: [PATCH v3 03/31] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <aP+lAoHwQ5L3qmt2@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
 <20251027013204.GT13023@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027013204.GT13023@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 796df5e2-ae1c-41aa-6e7e-08de157a425a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BJS2mBL5I80q/Vacvw3988nV3Zn7prVapwnIkCdXG+8UdQMx0CewNWOCAhX7?=
 =?us-ascii?Q?3pUh/hNvU3+5qduf9WzEwDtu8qKDC8UTSWlo/V7Qgk3FUmekg2z2Pi7b91ju?=
 =?us-ascii?Q?VQSxNOQeSwtAS6ujsU9pEylT2bw2hQuw4dlDMwaBriVx057RIdfxhfmQjZ9A?=
 =?us-ascii?Q?pQlwrIA4S2DxhwZwu5Vo/GX5vIR3OGubpPe2VZW0M9rVyBcTbXd5EFcPE7N4?=
 =?us-ascii?Q?ul6fnu4eT72cL8YN0eSTks4xyYd8YVwxrChY3NabBHd/05uLT2bXqS35/J4W?=
 =?us-ascii?Q?Qhe6ZB6HdhZ/UY++nNg4CvRAtZKuXLVPkIVXeH9tJ/Zv1X5N9tRx5UDXDljA?=
 =?us-ascii?Q?6haK4T6UVWtOMig/tFLipHumZ2sgNfzzCJMuCFu3mYkQVJ2Zrl/ienDsjak1?=
 =?us-ascii?Q?p7ZKm2st5fwJMd1/L75IBZNrasQPZKZuHyuilyCKPm+sg9sHy2MLg461Xa8r?=
 =?us-ascii?Q?/5zd5At+Wiyawt9+1sOyP0/jR3545ZmoTxDaPXNdVxuuIC2JES5aKOlTO004?=
 =?us-ascii?Q?TdTrZkSxHcFlkUx/7s1eU/FqtAhhTPiMR60eVuyxQ3tJcVIzSs+IKczco0KH?=
 =?us-ascii?Q?Vlx7y/q925yCTJWDnAnECmqTprNQI42WmVFwBzUcd6zCqKjCfC8sLdMBNSi/?=
 =?us-ascii?Q?3xLZuU3DiRyGnxY8aTn2PTAKAcESVwWj8/L7A1TQw9Ec1WSnu7pwbfF5XNlH?=
 =?us-ascii?Q?TxKIItPDmWPDV4g9h344ly/irXWfmQ/ajls2J6mJa4wLXP/tco/n/kkwjxJC?=
 =?us-ascii?Q?PymJM3/q6C/rZaj9S7olUlgbUBueoe0NldHJjzCYXbgoyyw3Zduc4Z/ZyMoT?=
 =?us-ascii?Q?T2nT83jbE1Ooxa9vZS7ey2v0FYFueVwdDZk9p3zP3ofWtgEHMGxZER1vd5vF?=
 =?us-ascii?Q?SAT7WD8OgScDL6Cf6BHITrGrB72ZPd0ECAZ/qk4LnER/TbL08JGrO4IDud5l?=
 =?us-ascii?Q?TZQfxGM/W22bVGr6zuYFH9r2lxpPNCc+0H6wqeIqb/LFYZCueufAXyOhmkW1?=
 =?us-ascii?Q?Y57ZK1ciJkpIu8bHrzFfjfMpLX30dWu5OJdTQlDk+lUm6CrDlMSdBVuoxYCz?=
 =?us-ascii?Q?q5d4n9xlX6+zkSTqMM8K4YWpBwEvRr+/YyqZiqOWCyYOFcrdZ00x64t89FCr?=
 =?us-ascii?Q?BfFgHeI/23ydIvwMWidZUVYgIfmW30ZmD2I55CRN4CZb/d5yRVaHzz5ZAEU9?=
 =?us-ascii?Q?P46qJVMwXoDO/OzG5qeOaH9cNufxt3ONxuu8M2G+YD+og9rlqkbRDI3D4q9Z?=
 =?us-ascii?Q?Zq786qV7c6iWIrTAVZfqke82t3pta0AKZsDoZ2aaJVtD9h1M0vY/9w+reaDu?=
 =?us-ascii?Q?svvwxp8GcnlnBRenEAzKJSRwhY+tqa+cDlw0V6GE/fuitBkxCkkCxYipuQc/?=
 =?us-ascii?Q?dXHYW1suoeHqnSQ+flpK7G1laclWLcUtLzAD2gqtJhoFB1Y/DFwXxtioREkW?=
 =?us-ascii?Q?lRchiX96O1fVYfhmtTvGBnNsvbaHQJzU8X+p6BjQgPePSkfg9ahCsg6rf2ok?=
 =?us-ascii?Q?ApqoKwPhF2p5FAUaJUI+XnNoYQloo+mVTa18?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?w6y0m7dju72yyns50Dtvvjf+s+EKqKijWNTvWMy+bWxt+kETG0GqY/tiUCSW?=
 =?us-ascii?Q?bVH0h4NRZyPKbhQiYVo8Gvq/Rt5RGpTV2mEn30hQFmST5UGStRw0bNkUIyJI?=
 =?us-ascii?Q?IeoLs7FWIR4yeFTyb6C0+Evb84mnAPrL86t+3WMphvnIKsAlquruFkys6uwA?=
 =?us-ascii?Q?uRth7bHTTJfH8314RRoh0g0bRCtG/qT1O5RVB3YE9KfFSk19/mxBa0rlHO+G?=
 =?us-ascii?Q?/F7lVRz09rU8tBDL9kDK9/+l4mfj7TgNEfO9GmEyN7qqZIglRLxmvhgvNMG5?=
 =?us-ascii?Q?r5TkdtU8qRwFhThBM5Y/gSeF8dFiQy48X8rFjZSPacEOoO8Vnd3JOjQ8ITHv?=
 =?us-ascii?Q?WS2Lsmwer+0g6uqzZBfCTrSfF8wozaUlHALEYeZXfGSIFjBiNtQbLyKGvr0y?=
 =?us-ascii?Q?JrqWg/m9qHElw16FcbfZYsXo9Syq/LzBm6IyrDsbYS9o6icvlGW91h2Cp0at?=
 =?us-ascii?Q?3UQtSUvxnWrqjJyLtEYS/WSe5vDp0/vssioCHvQdLwy0vx0553USGE7eqKF8?=
 =?us-ascii?Q?8EvYVAFvpxxoJwL9FZyYolaFg3ILG1ynZ5KWKXxVeVbXVsr49ueyIXy5lTKX?=
 =?us-ascii?Q?85uB70xFoHI+QZXhsGirXKjaSur/IJZptxyfZj/9RsXEOiDKmYhiPqcS40O1?=
 =?us-ascii?Q?g7izQQ8mc/gGGawvEPTRR3tr2TDU2mhF17n64vtR2MDSlBHJHrMBpin+sYM2?=
 =?us-ascii?Q?vui8mt2Akg7DGQPgVH4qLFt4+veBw0wc2EEHp+/FpOsNR2lrxiODfOz5RL9T?=
 =?us-ascii?Q?88p4XxLTK6FN7ZDwwrzbTMX7Jv/7MOpViXQyzmS1zWjXLnG9DDpNR4w98Udy?=
 =?us-ascii?Q?sa0zlVlFyOZHL7pjtUcfBQAYZowHUGzctX9SIoiWS/ifo9YZSABG4zu0x7F9?=
 =?us-ascii?Q?W7+d/QB3wg9KcOCohvSCQ93kt1+ihpZ3r487RXzfAp3UqYfz013vYVBd7rnd?=
 =?us-ascii?Q?aRzAYPY3/bloJDBXh291KGCOM61rIpysCkMIWOWghvFAKL7tAxlISj0TkEiJ?=
 =?us-ascii?Q?7KZSyssX264XRPRXOBEQTd06D1s2bBqiTzky4dQBfVSGxbWCBdTnOM9fvIlQ?=
 =?us-ascii?Q?PmAfzauummB84R9RcLHaeY6oa3mraPUEyoV3qk+xAcPY7hARrRSko/s0f8QT?=
 =?us-ascii?Q?sis5l74fr04h0mHOgutH/ojkwpY+18nbMF7AX3VCz83gheJmPI2eV3oqkG93?=
 =?us-ascii?Q?FtkPRfiCpExduP1x5uNEmqeNRTqZa++yZkdz9djLYmG8Pjr9/o/KGW5bDxaG?=
 =?us-ascii?Q?i58aq33RC93BDdk48n0ZORLWVoMP1Qt3Q67qufZofichRJ02sYeILSoAIz2r?=
 =?us-ascii?Q?YDMY0pGyBO9Q8VpxQl2SCzETDIX5q5MKJNWYF4CmLpBgimZEE8ORBl2qoMX6?=
 =?us-ascii?Q?srNmcGYnayAgXoeMvPwksM9amC+mh5LPlNcap/Azyjh3IxT+J/fN4oy8XYla?=
 =?us-ascii?Q?jaeq1HsbKX9hDu8CnHnQwjMMjIc/31fOZmL0hf/QMZhp2cBYXDshXoi+Jwqn?=
 =?us-ascii?Q?znfJVotMay5xZu3bGXwbCmcTTtEUg2YwkavDKvMHgB+t36Dy8s4Tq0Eoia7H?=
 =?us-ascii?Q?4OzKSAYxzYFKOO+NxH8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796df5e2-ae1c-41aa-6e7e-08de157a425a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:59:58.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfI4FyirQvQro/iQ5wIJAn2lhSIBFMYUw4PE5j43WRFYbRkLEqYREaWwKwiCbVM2LC3bO136M60pv4eTD6RFZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On Mon, Oct 27, 2025 at 03:32:04AM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Thu, Aug 21, 2025 at 04:15:38PM -0400, Frank Li wrote:
> > Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
> > to reduce codes such as
> >
> > 	static const struct imx7_csi_pixfmt pixel_formats[] = {
> >         {
> >                 .fourcc = V4L2_PIX_FMT_UYVY,
> >                 .codes  = IMX_BUS_FMTS(
> >                         MEDIA_BUS_FMT_UYVY8_2X8,
> >                         MEDIA_BUS_FMT_UYVY8_1X16
> >                 ),
> >                 .yuv    = true,
> >                 .bpp    = 16,
> >         },
> > 	....
> >
> > .bpp can be removed from pixel_formats with this helper function.
> >
> > CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> > See section 9.4.
> >
> > Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> > MIPI defined data type and avoid below duplicated static array in each CSI2
> > drivers.
> >
> > 	{
> > 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> > 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> > 	}
> >
> > Only add known map for dt type. Need update media_bus_fmt_info when new
> > mapping used.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change in v3:
> > - squash two help function patch to one.
> > - use media_bus_fmt_info to do map.
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 149 ++++++++++++++++++++++++++++++++++
> >  include/media/mipi-csi2.h             |  30 +++++++
> >  2 files changed, 179 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index a5334aa35992e5f57fb228c33d40c51fdafdc135..a75987aa5fc69d6368709b7d521bede666da9513 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -46,6 +46,7 @@
> >  #include <linux/uaccess.h>
> >  #include <asm/io.h>
> >  #include <asm/div64.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-common.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -757,3 +758,151 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> >  	return clk_hw->clk;
> >  }
> >  EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > +
> > +static const struct media_bus_fmt_info media_bus_fmt_info[] = {
> > +	{ .fmt = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12},
>
> Missing space before }.
>
> > +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
>
> Let's not specify .dt for formats that must not be used with CSI-2
> buses.

Do you know which not used CSI-2 bus, or where I can get such information?

>
> > +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18},
> > +	{ .fmt = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 40},
>
> This doesn't seem correct.

I add by surfix <m>X<n>, Is my understand about <m>X<n> wrong?  or
MEDIA_BUS_FMT_UYVY8_1_5X8 itself is wrong?

>
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 120},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 150},
> > +	{ .fmt = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 180},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 240},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_META_8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_META_10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_META_12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_META_14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_META_16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_META_20, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_META_24, .bpp = 24},
> > +};
> > +
> > +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> > +{
> > +	int i;
>
> unsigned
>
> > +
> > +	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++)
> > +		if (media_bus_fmt_info[i].fmt == bus_fmt)
> > +			return &media_bus_fmt_info[i];
>
> Add curly braces for the "for" statement.
>
> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(media_bus_fmt_info_get);
> > diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> > index 40fc0264250d779ab5dfa7d2fe16e6f1382c07d4..3227d28224b7c32ef2745548391da9e792cfa559 100644
> > --- a/include/media/mipi-csi2.h
> > +++ b/include/media/mipi-csi2.h
> > @@ -8,6 +8,8 @@
> >  #ifndef _MEDIA_MIPI_CSI2_H
> >  #define _MEDIA_MIPI_CSI2_H
> >
> > +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
> > +
> >  /* Short packet data types */
> >  #define MIPI_CSI2_DT_FS			0x00
> >  #define MIPI_CSI2_DT_FE			0x01
> > @@ -44,4 +46,32 @@
> >  #define MIPI_CSI2_DT_RAW20		0x2f
> >  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
> >
> > +/**
> > + * struct media_bus_fmt_info - information about a media bus format
> > + * @fmt: media bus format identifier (MEDIA_BUS_FMT_*)
>
> We usually name this "code".
>
> > + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> > + * @bpp: bit width per pixel
>
> You will need to define this much more precisely. In particular, how is
> padding handled ? How about compressed formats such as JPEG ? How about
> the LVDS formats, how are the control bits accounted for ?
>
> I understand you're trying to share code between two drivers, but I'm
> not sure we will be able to come up with a standard definition of bpp
> that will match the needs of all drivers. It feels that this information
> would be better stored in driver-specific tables.

80% is duplicated codes if stored in driver-specific tables. If driver use
difference defination, they can create customerized table. This one at
least cover more than 80% case.

Frank
>
> > + */
> > +struct media_bus_fmt_info {
> > +	u32 fmt;
> > +	u32 dt;
> > +	u8 bpp;
> > +};
> > +
> > +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt);
> > +
> > +static inline int media_bus_fmt_to_csi2_dt(int bus_fmt)
> > +{
> > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > +
> > +	return info ? info->dt : 0;
> > +}
> > +
> > +static inline int media_bus_fmt_to_csi2_bpp(int bus_fmt)
> > +{
> > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > +
> > +	return info ? info->bpp : 0;
> > +}
> > +
>
> These are not specific to CSI-2, they belong to a different header.
> v4l2-common.h is an option, given that the implementation goes to
> v4l2-common.c.
>
> >  #endif /* _MEDIA_MIPI_CSI2_H */
> >
> >
>
> --
> Regards,
>
> Laurent Pinchart

