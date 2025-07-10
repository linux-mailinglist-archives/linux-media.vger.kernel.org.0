Return-Path: <linux-media+bounces-37421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A9B00CE8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C87D1C2517D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 20:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ECF2FD586;
	Thu, 10 Jul 2025 20:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jbfUFct1"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D9270ECD;
	Thu, 10 Jul 2025 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752178730; cv=fail; b=U7T0EegDpp7HaHkmTN7+LC1MDSXKSJ/3zzZZY2gLd3R/9LZJ7qpNtWiGMxhYoH1EY03uG5ZIvHsm4QOHDYI5Wi99HCqmh5ttjHSptaCFhf7QwHOFq5WEo9KvICk6yvMjfN86v9d6p4Ca2UBuAzgBFcfbn4hb3L19oNGO5fnuBek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752178730; c=relaxed/simple;
	bh=IidHTbikO82/pWv0KFUieZyNWDJ0ht2tVIfVtW3WqN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C0pDZAAuNitv+mHSUdAbcQCcB2ZYJlnBE+JhdPZu5nD801/3hjyv2rU/Dyh5Yc9kSNIvS6MAZD9Z+V1fKtwZRJKirbljQJZ8qqodlO7M109D2yQrrEPqFzW0r9P0yqP1aWV5CtIlfsufp9+TwGIfx/isRcyVkSv48+jnde2jEGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jbfUFct1; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emVDN7kapTtoFeTJLUJ/kjZP1WMzscAtgqUVsoWERN3CnZx1s9go7gVOeHzvhRmNWVkMF2pzPix+KMg3+Igl1Z7KK6VppN7PbYFneWIjhoC36RUixTgQUDIw6QwdkWFXuIeUenHJfMSx429mg5KoKvR8kgOjuStNdA2OOBevUGfV0EoW34KKBIMV3296qVwBuM78CrU2xbGmGq2i/mBJcAo7X8IQDdP3wxNTdDue/zlNMMV8N8boisQV3V+ctRxiJXxj7A1YECiz2EA25k+xZR4JOGVq9SWP2Ll1L98J/UkZR9mDlHay+thWFXr5adSEPjBg0KLpRHQCXkHfDiGNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIKd40IUXI/r9ZqSbNnkU/yqImINFpW3+OnPGlNZvYU=;
 b=OV/25PzlPS26l9jYBKjQkF//B2/tdSuXypq9Otkp7tblhyqSe0JaFOIjxiRkMOra9mJdcqfrQSl5aG7wW2qBRMUt84i0FxLRIIWYyp802epzJv8qp8JTmRrYt/uVNIijmvRIxlllJb7BxBFrDchiECOVrVjPwnuCnUza1cw5kbw6ci9iEPRL7roJ38ylXCjNLODX3lpvPyZsyR2O2wjUZxYEHUqiuK+CeCarSfl4TccH3kHiMAOdgj+f/QitQ5qMhr/v4Q2j0XLHbTx6ROlLgcQX2PGEU9N6xyMyjIdCiPSoq75lXdQieM9Hnjmlmgn7J2b7LKDPW9xs3nkuEe4agQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIKd40IUXI/r9ZqSbNnkU/yqImINFpW3+OnPGlNZvYU=;
 b=jbfUFct1jv3wQblQ/7M2zWLVi/wfz/BxQvLL0fPmgLDiNBUqbUHYWYx4nKbiX66+D01+Glrn5jNRo9Sn6eneBVyGMaiaOiLQDxpsvhW284Kj1RApT3SSk/WRJGXJzD7IObe97rFqPVy6o02+UvkI03iRJhDsu7wmgSSXmm9Sg8JIRWmvSx//Db+8EF++1SoLFdL2U1FxyLcxHsLmEZrkjjTuyhP1Gi5cXtgnIkVLt9ANaNMz29V6VnBfB+/CpDfhzZy+H0z6HAVxrHZfD852tqiejEhUpaepYrkQ8gATLIMWMlqowVUatSCMmpU4DEFFjQQF+rGuhFnumrXEdCcDNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 20:18:46 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 20:18:45 +0000
Date: Thu, 10 Jul 2025 16:18:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace
 clock-frequency in camera sensor node
Message-ID: <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: eb00ff95-794b-4d9a-d6ca-08ddbfeef88b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?+fs6/cmtn2IWVGFnu82RkVd/XjI8uy3fQ5XNWR4VkCGQxs9MlLys8Yg1WMMg?=
 =?us-ascii?Q?ty29tD5u1mLBANaWm1F1X5rk+oBgloeibAKlVRVtaLdusRY6uhyJzVo1CkUU?=
 =?us-ascii?Q?R0vanX5MXs5kiQzpMTore0AVDV0HwMpZQ44x5b+x4ILSOcT2/53ErY1P3XFp?=
 =?us-ascii?Q?FZzurQW0MHsjjRpkJF7FE9TQ8hGYcPLHfA1sYZtUmtdPuLwXhkt5bW6ui9Dp?=
 =?us-ascii?Q?uI7QK5i6maGG/VzXg/Nq+1j3j3TTgymJiba+FgtCSdWB9cPaDIaiRgI9CV42?=
 =?us-ascii?Q?yjIO3l3msluciKYrE7evK8l2kcZ2ZwAzN4evG9phbfYYdc3b3jrzGOk0Q04a?=
 =?us-ascii?Q?Ow8wg9NFe47+6WL8POWbvVkTT9ZsLHn8gAKJCXb3Sb9mCHn1Bx1PdzShXG+p?=
 =?us-ascii?Q?iXEq0/vDvdUKiwuDrJHrm9UNO6iqtFIRH5NvKKRsV5OJmqPf85JyGVl9c6JM?=
 =?us-ascii?Q?M68G8+akJ9bMqVp8v2jMScwTzPbsfRa0DEyEfv0HzNGanbAMnrx3hvU5v27c?=
 =?us-ascii?Q?IcEX3ovIfkTXM6oATLWO9ikohOgiQdGf79OhcjsieFRtCr59sQCvb8GIjAHZ?=
 =?us-ascii?Q?kZZDMqEdLBd3gDa5osh95esjPWvAF6EwgBHkCyxnSdUEqDZE+ELZJ7EmDyuT?=
 =?us-ascii?Q?rIWc/q30qH9e/xxx6oYsx7Nrs7Oc6TMVZD8UZkSmlxyZWbpfi/A6zSjER3PM?=
 =?us-ascii?Q?CPXwk18rTwQTGP6h6pSdMx5IvntVtS3Fb2jP//yQOOPv1dXjO4ibO27tLSpR?=
 =?us-ascii?Q?jQAcbhTY4dP0dgzx2OOaEtEO+t2pQIyPl6nmkfYDjG9dnLhB3nkII0OMqbnt?=
 =?us-ascii?Q?riixVAm+ifxRC+xM91PXR0fBJA0nHVRRT9/tGUM8RGyd3MB43Tjx6DLakhcG?=
 =?us-ascii?Q?rVf/r7J1xcawQJ3tvyl3ZV191CsOiKsnVJa658HQlNvErWp/5AM4KHxqJA5x?=
 =?us-ascii?Q?Zh9DC1ZHCn6bkJaBCgqQ9rYgmkIYeOX17UdLaZis3SK9aOt3rhWCkiLlggYu?=
 =?us-ascii?Q?lE4eRtAyoZKQmox1KAd8XCzydLf7RIrogHHSvJcFtHIqWDOQPz0nZtIlDs2+?=
 =?us-ascii?Q?fhebxu+tB4hPlB7vWzWqirAWqgJJa/AyFRj/qHWYne83ajMwLT1CzVcqovT2?=
 =?us-ascii?Q?7h7M5WhpPv4LfBPi6oVjFuDe1GcTz0wtPEQcTLmc/7gU+B7bbpFTCV6+OzSE?=
 =?us-ascii?Q?cceAC1/Iohe1q1Z74I+2BpjhSZSHJRElJiGEnyszSkhmanwiQ+N9OPJWomHD?=
 =?us-ascii?Q?0gx3vw0QhXiQjhQhacd5Igl8OZCy/zBRoaBZqWkUrFwcgvTWd+mP0zbqTBi5?=
 =?us-ascii?Q?ryRYvehuql6p9dWx4yRIWN9l1IZJo1sCEfdJcyW+vGiGSlem40a+NnmcorJS?=
 =?us-ascii?Q?MpG/VkrzA+kdXT1Bsx60Tc253iBI7QxhY0zrLO6l83IetrrAWuaFJb2LPBlV?=
 =?us-ascii?Q?TTOGo1x89QMOy2YPftOkMQ+NOGwxsU+jTrCur+exfzqIcQSfruyVeA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yrG8NXf2RC6ROCyCEwQZfhL5BSKSWZ8iIcXq8qtzhNqW+VCG6G+RZ8tfoxm4?=
 =?us-ascii?Q?2EgWtKi60c1nXoDLpOOSYbQac9FEWP+zJqoNonWEFbVt+MfgCKEJSa8DOsTC?=
 =?us-ascii?Q?VS/DGIbNCaVMzYIHdaUcbhY6iJpzFHDNRlQffm9m3HVFtsYMHb05DgIPxKpI?=
 =?us-ascii?Q?pFhn3x0hz2UlpMmTwt8/0Nq++NOwbivofq22AWfZ4+9ixGwNUgCvatitnFHh?=
 =?us-ascii?Q?s+8T6/Oifzn05tK31M7M6EAi27B8qG9tmduDCI1zeoz4fN1WJWeohJuD2PBr?=
 =?us-ascii?Q?RyXwNcB/rb9lq7TiFSu+7ysCU4B4bkg+oePbi+T/FqpmuU7OxbP3slvITkgO?=
 =?us-ascii?Q?V5KMBsMhTLwBjwVuHFnVA1rSoYr7umLltIMwSywX0T5tRiMU9jBByWhbnzdU?=
 =?us-ascii?Q?CkI5I7Dndz18mAw2+rQSEpDTsoZojfidMiMt3/E2ewIDYTgv/aDJW/sjhdEX?=
 =?us-ascii?Q?K3YeOufHhLNRqOAohlS6v2pq3A/5Wd0cirIomrmU8HAx8R10RYrRHeWNJFf+?=
 =?us-ascii?Q?4Pa5Fy9yISV4Xv5jvyFwOEkg89NGlsNCtqFr5sr2gaKgP67OPYemh9wLdlSt?=
 =?us-ascii?Q?moY+8ni8kFqAe0nvx6Zdp80eS9hevTtlpiFinaTiBvG4ral3p3fJWguHy21B?=
 =?us-ascii?Q?LLNDSWgWTCF12f2RHvAqHl48S/XqfSpOxa3WQmXg3H66xgiu7wYaalMrdlCB?=
 =?us-ascii?Q?KmdXqXEMOI3hW5SfNlqMcRE2DDxploRCsx/yiZYNGuSa2f24cGFCS6cf0rnR?=
 =?us-ascii?Q?EZ19Li5mqUUFyagj6+Mi+iSZ4wfg8ZpO9Nj4E19Psb3PqZp5xAVmWlYbi+z8?=
 =?us-ascii?Q?nUdMylEiPErHUxsdc1pZpN4h7ZGZujspU3QqDz7ZC1gZqkY//KH1IatngZfV?=
 =?us-ascii?Q?k7x0BzPyHhEKiRh/M9f0Elw/TqCnjZbup85goCJm2rUulbp8gVtI0ESoUfE7?=
 =?us-ascii?Q?Xm86uz5cVMiTDAqaMTnPVKDthBc7J3ri7EPP+nOl2czlddin4mpSD7gFmhS/?=
 =?us-ascii?Q?FBe96bRXqIQvE7wEbaIzsrhK4n4SQPAny5E9ALZj/rvGTLJs+jMOTY1Moyv5?=
 =?us-ascii?Q?xODrXdA07UdcQQOzFEZBEvL8P8x58uJxxicO++ievIJorCj4VbiyQwy76sSx?=
 =?us-ascii?Q?VfW5YN+ELoio5SvHEDb30+oyU/ajYb8nCaBmooJOkUzzEaslWCp4MtMQk56Z?=
 =?us-ascii?Q?oDPh+I2pRbvxf1PtD7aSBL+7IBrz2Ufds5HMvd3O9fxgcmavgih//ENhYf7t?=
 =?us-ascii?Q?hB3+NavTfVxfFoB/+56+WvyBVVeNyZNXW4kDKHVqMXAqiCZS7phhjLaDT4ER?=
 =?us-ascii?Q?41fWQIOPZ2Y8s7h+SjdqZ+LVvi22D3Xz7h4y3EN47vyF0we6dnP7lxhAg8oc?=
 =?us-ascii?Q?uuniRiHMYDnqnBLdecikI3R7PvQJg70+HqWgZ7gWeVFQLOYrAEBtu5+CzM5Q?=
 =?us-ascii?Q?8r3xpZupT1n2VdTq9vqx1AiNXufGXJwlol4VQvlE8LeX4r0Ve6tgdRUgb4qG?=
 =?us-ascii?Q?RwfPM8G1Eob26jf8r1NzEcXOvsbmv1kkLjZb7+Sg7yZ/89FbHRwL2otwRDy/?=
 =?us-ascii?Q?PluWb0Lx8Q2F5a3adqG74EqHO2M5coXn2D4B7Nad?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb00ff95-794b-4d9a-d6ca-08ddbfeef88b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:18:45.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAwzdgg4/Rz/H8q73DorQPfWCs14erOtUYNtiEV60tYu8sRAtWVfkcRBNdp+6pwS6CkeVKrL1AkkjtbsJF1AxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

On Thu, Jul 10, 2025 at 08:47:02PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> index 26489eccd5fb..e5ac78ffb31c 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> @@ -136,8 +136,11 @@ camera@3c {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_ov5645>;
>  		reg = <0x3c>;
> +

unnecessary empty line here

Frank Li

>  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> -		clock-frequency = <24000000>;
> +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> +		assigned-clock-rates = <24000000>;
> +
>  		vdddo-supply = <&reg_1p8v>;
>  		vdda-supply = <&reg_2p8v>;
>  		vddd-supply = <&reg_1p5v>;
> --
> Regards,
>
> Laurent Pinchart
>

