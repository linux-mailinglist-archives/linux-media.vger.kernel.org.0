Return-Path: <linux-media+bounces-37422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D7AB00CE9
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C718587ECA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 20:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEE22FD5B6;
	Thu, 10 Jul 2025 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NnN9aDKd"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F09270ECD;
	Thu, 10 Jul 2025 20:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752178769; cv=fail; b=Zf6MrZ7kBTK0wpJPQHqEEZHbY3xsg0ohXIyWBtrM0MlY3q3FfjAeMxWAUdJatK2Xr/LtLQAGUSEcN4uwLotkQewNCk7DQwl/PGjirghhzDOu5cl9h2x3+Bi8nRJGd8wOZtSc9L7Ua/G52hNy3WoQmtLG20i7BP2zXxSaFmX+oro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752178769; c=relaxed/simple;
	bh=6IDerpm1KKohwNfwFDR4u957vD2UIfDuIiMlMyvLYVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sImXxM23KklCz+5dh0DQKLO23Xl4H06eCNC8uG1mrjnM/mlPVGqfP9/LoKq+5Y3UuPqzLySIAUfpDcQb1xXXPEBgBTCutrFEBvmLeSvdymjgI+/AAkgtnBOWyetuXvmJrPPasALEpfHyAeFj32G9iy8rOTSqjG2gx23NfoKwDus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NnN9aDKd; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1j+GEpIziphma0XbPaiduVMbOCFCHTJH22V9hwPXKASDyVwUAqzC2GaiehK4FmxSotdmbTElsj8tZgMp/h6JU9vL+3khseDwoDZgEmfvYFp/jImmjg8RCC4PERXQR7Ld8zgZAJhZBFUHbVKxDEqAz9zZF0sOxEvn/4B/eETc2cLfCcHIcz2nGUaHn/vjm1aJjGsyU6HVDIMvaNa26wVABuBioeui6G0tpEIBthMF3XTJsIAuiOBUVrLJBUNU+aiw17MOcabGbh3QXAYFNfesMjR+/qlBJDkE/RF/G/3UI1Ojv+Ukmve52SLN7JL7G64U6xknzAMqMFp6HYIEjK6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7Evy9ZwwFcjlAebSYEUbjTc9QPpqcjRD1nSefmiGG4=;
 b=TDiBDXFPn1wGrUs+1qS3nXdegSbv5BpNgH1jEHABK7Eim7xTeAP9SXNQ8sTtn/w4YV+WkTCTnHPnawRSyVNU7fnnEwn5VvN5F/0ST9UQnf5XmcHlIoL5bIVDQt2hGyECpH8ZscO/pjxSN8AGRD5yo7qkPB0HilZAOnhG1m6iPzGjJb3oQzREt5wZ2BpFQEHNOxooLQIv1XH+qLFCLTtD0sPiGRF+a2gkNXjyjL+WKKaofc/0Fj8zZogdsF3JZF8UO/J4o7/2CQZQrE6r3+BzKIXzUgTp8UsuDhG69Sdq0mrx6L62sBYhVWMMZVmJMTbswo4yiRAwnYgXfjC2CkGisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7Evy9ZwwFcjlAebSYEUbjTc9QPpqcjRD1nSefmiGG4=;
 b=NnN9aDKdHj3wtSWijcgMZ936ZW6hAhdN5c6roA+kJvqqY7Y1Znh21gTJPUeUsHSKSIf4ttBJ3wCyb6B6j+qPohuhdRJivrp1gi2rLH/+HS3HeVKSMWMFwZcMfTYM3P3RvbkcQX+2jrKUGDEuucCQJtgFIpkGAcYDZMOyM4Lv+NAOnqM4FqJToSethA4FOaK9ek4wmY5bfaqF+FGY0mC75srcjTgGiptLrQg1p6V5tW1QqJ+4nV/dkNaamdXNXc6XXhvm5XyqbeNAGO8ojLpeVNxH5/6G75PLMzZ+ZgRbXkgoMne+bk9+M8FjpyKFhN0rXWADuRmf/DNdekYKAbcaPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 20:19:25 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 20:19:25 +0000
Date: Thu, 10 Jul 2025 16:19:20 -0400
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
Subject: Re: [PATCH 05/72] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Message-ID: <aHAgSJrO5/26duD8@lizhi-Precision-Tower-5810>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-6-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: AM0PR10CA0010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aabded6-b515-430e-4b3f-08ddbfef108f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?I+isMN/ofFLJW+L6ep10WPWPz3ZZAFJZmDAgzdqeM028ZdXC+ujGEbc8YfCf?=
 =?us-ascii?Q?J8X8BSwQJBPcdbCJnwJIfcSZI6LWoMNRWLOe45hkbAs4QQK3ZgF1/2GoQEjl?=
 =?us-ascii?Q?5YLAKirYVMwSBrdpC3ph5pkuTQ+JAWhrgytrhh7Mq7lxg2QMP/txRuGBGkP4?=
 =?us-ascii?Q?M9L3psRrBV12rmV3dOD3JNTvtvHCrrmwfgX4oF1Kg6wRQtRdiZIwPUKeJfXY?=
 =?us-ascii?Q?TTIdgLbDLLKVuHY/uZyZz+hkBohivAnM9jC8KD0sSQ7rH19vp0fnVzTfRqkc?=
 =?us-ascii?Q?5p2ecRjToVCBiTRfCQfKS+YiK7tjOFby8c1hiAdvhWfY4EpjwpHrKbSvgiSU?=
 =?us-ascii?Q?DumVidD02wi7Sn8Jl85+oSfdk8zdfM5NUDD9W4EHm0ktpPx0qSY2kGQUmiuC?=
 =?us-ascii?Q?To3Ar4BRfoTMJIeweU/Ei77tRmRQHOflbHpSX5Eys9J5s9MYkPmueN7ZhQ/W?=
 =?us-ascii?Q?sZO16v21Y3l9nDzJ8t63ctBcnAX0Y1buPwUgaL5VdO5MXjBIUBg3yhUMlR3h?=
 =?us-ascii?Q?/4xl/mEQrafTBNXaEaoU301PVc6cjeKoM0DErWyGImCDsR6uqkXmKBBdJNRG?=
 =?us-ascii?Q?LVl4d/Yy/80//PV7daaVY08XGthYgAFK1zde6CYt8wNp5WXU3fvOlcJSXeJA?=
 =?us-ascii?Q?YdCdEbyM+Ojhi1UMI/cuSXyE1jackGOekSES4T4+NgGfE9Q6p4A4ioxplSvy?=
 =?us-ascii?Q?hjRQBIqKT+RH972kYfFk2ps3sEZm5svua6rp0ZTIl6lP+f13lzcOW0QMJx9g?=
 =?us-ascii?Q?fKFaX7YweYhULi5nzcyhUbTfiwpVjNvz2I2hWu56GmqvOEn9CEUlt797FLns?=
 =?us-ascii?Q?G97rCTjEpLKvzU7fbpSUcVa5252dOf7G1SNor/wK3htzJjz6VfBJQfvDyxfc?=
 =?us-ascii?Q?6GiYgODEmMtVPWGW4AJA9Y9/53u6xT1V0MUxTgvkKbE2L1+1pQ6R3sE2WYoz?=
 =?us-ascii?Q?jUpxWPgZy2IJZVQ6mkUOWkx4vlc4E2MuAnVbx9laRazzXB4Zxdz6ulzC5FT/?=
 =?us-ascii?Q?nf8PF1bbZ/R/XyUs5BMsEf3eoYWzBLveK2mm/VntwUu/PCNLrRsf+eJfClqR?=
 =?us-ascii?Q?E3qfvG2asDy4yM+3HH7SUAHUSVdezVLacL9NYbGd5R5tlX+Fm/zCurNxB+Vx?=
 =?us-ascii?Q?esDBwvaRrNJ1FRVBEAxTlG+arWkgllKh/o+snA0dAdIN8m+5u8rP+08KgaPa?=
 =?us-ascii?Q?+s5vwS0U/i+objyFJIPS/n5SRn61sCO/8z01Mtom4J8lfJlapDZgvH5yVjZ/?=
 =?us-ascii?Q?iroaNTboYetxFVgpqZUe4AG/DoO5GalTTKHXOAkcwuzzFKoeA6ITg+7xFLPH?=
 =?us-ascii?Q?Hch4aJANkuaTKMpfzXGuD2k3Z5peoB2ByLseJyXldbu0d4sX/TezsowOCWeh?=
 =?us-ascii?Q?3bz3EvjsFAKG/2WDf621Lb8ZXxiy/Z37zlhHzWEPAoWUEPfNcBUPHl3UzrwY?=
 =?us-ascii?Q?+NUSDEvKtR1mu2UUns3Bw7FZlDcXlAO1Ix0y8J73roTVObI5swm6Lw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ft6EoWtsukrox56FA2O7DpUmoS/lIZX2COzV0+Mpa+N2DDNapaiF8KeEiS4m?=
 =?us-ascii?Q?1UCvwVb6e+NL5eKHsMMKsyORijcMm+j2IJKjeroXb6jxRNo2vXO+BJZ8ir+r?=
 =?us-ascii?Q?7FFaWSYHcSLB+STEIbqypHm/wZ9vax/QK6V9pjRpgLgwH+JpBSraOClCz6ac?=
 =?us-ascii?Q?VowuAA7VKgnNboFWl+Z3awMuLtWq9Hzw1giOdX+eoXl43DkpRdt8GP5w4r9t?=
 =?us-ascii?Q?Y4KvIhQpdx3tKrFP2L7rqu5UFRx2ytgHlGJ4TqvG79dLrXL9e91+DxUfPcq+?=
 =?us-ascii?Q?fwv3TG8XLnc2o5hMtHzKWPe2xKiEudb5lxXJSbhB0IKevf8W7dV6DlDYJFTI?=
 =?us-ascii?Q?jP4NU96VxqZrwu4N1EfPEUPWk4Wz3SWKRMlFQakPfmmnFSnMLH0oe3nSOH2k?=
 =?us-ascii?Q?TsdzaHN8FNNOruh9mGKlJkrfdXWtSihTIvUaKiAzcoT32f33oCUoaz5yFIFS?=
 =?us-ascii?Q?FBYlq/gLXBi9JiMZRX8OnJmVFqxS4RemmTc6CQBFnRVIxfzVctLP6pVnlDho?=
 =?us-ascii?Q?mfCFv+A81MhxovteH0WmAAEaV6VL+U1vUs+VhOKW/1puKuForhDljXUsKVmF?=
 =?us-ascii?Q?tuCrUj0q7flj42yvdh7mISAGV3CDZ7qALpsacs8yWEmkg/7qyQpZmP4tsqq1?=
 =?us-ascii?Q?HSYONbtkECVbljcY8nQCO1c1h5O2doviX6ko2jg0C7Y1WB38AW1j7KivQVup?=
 =?us-ascii?Q?vviplJnLI+FeMFpH+qQ9QkDcj7wKWfHB2zipSWK9Fllfa7BfnlYrzg0CMybb?=
 =?us-ascii?Q?HP54K1Hc4Yc9M3AoTPRjY6S2j9J7tY3ChSxsxpYPtDD9kGDW0Tk2TQsDXwOc?=
 =?us-ascii?Q?C1DXUsIEaugikf+qi3jv9vHdwXqjjVX9X4puda7dfFDVq6S6EKX+YiTQ23tL?=
 =?us-ascii?Q?3gn/XmuQ5+Unpba03uoB/xwQHsWGbKLr0K7RR9WLC42YjdqeUR/LpyKG4yCS?=
 =?us-ascii?Q?SefDaNmJBvJ0+QiupZRnqY0iVMuke7xCkfkSYoZX5ABUFeFLuIQWeimDPLzB?=
 =?us-ascii?Q?C40qgqdvBt1ySgHrxVFzkK+CM5p4p8SZyMfZkArYOQvY3yH96Oel9hPwNbL9?=
 =?us-ascii?Q?SmtAkGaSaHrrD6FFWsJ9O3aWB0lzDQZyAZoOfAZL5RwYvMYPHnozQ/zK3SaS?=
 =?us-ascii?Q?zktFKdQic/GcqITyqfpQAKBBF5bY5Okf+1DXvNu7D9IgTnZ1Vy31G/sheAk0?=
 =?us-ascii?Q?Q7MzD2fvRi9Ie9vp8Dqo1c6c/e7yoqV5rEU9FJ2UwGn71uVvAZ79lExvoR3P?=
 =?us-ascii?Q?4pUJO073lazlqAHYvNd4FvbBVbTkwJaySHKxeyes88hzu6Eg/o0EmEzVntyJ?=
 =?us-ascii?Q?cJZqrTbdRpFIv4dfabjS26EJqO/3zyOEP6yWlFd8eNIc0w47BGOh6HpID/7W?=
 =?us-ascii?Q?tO76ULQFPnQiLOuouc6KsQNPQA4HwgNpkat7jwiA4ZLh5/hxydA0y2zJzWyW?=
 =?us-ascii?Q?HWHYRfkZokqsCzozvr56Nm9y/MhHhGOEAGg8yFOyJ6yCDP06Crn6sG+Nxh7g?=
 =?us-ascii?Q?brjiBWMYQDRKQhka/LLEyp4W5QPNPSUVxTsO1a7c0a60ClR2Pdl5AR860BTc?=
 =?us-ascii?Q?+gkqmesCGkPcN8vHlvmujbkQIqJ2RdvbWZhPpJF2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aabded6-b515-430e-4b3f-08ddbfef108f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:19:25.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoIuItE+3rb0+EX/KU637/N+ftzkI+hyLyv+DWvrBcubj3GlfWk5ugoBQNAkqp714CM1TYTsTcv+iphtS4PWkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

On Thu, Jul 10, 2025 at 08:47:01PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> index c39a9ebdaba1..7821404687f4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> @@ -232,8 +232,11 @@ camera@3c {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_ov5645>;
>  		reg = <0x3c>;
> +

unnecessary empty line here

Frank

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

