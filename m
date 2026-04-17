Return-Path: <linux-media+bounces-58980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJKLF5T04WnT0AAAu9opvQ
	(envelope-from <linux-media+bounces-58980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:51:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26E418F67
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B10930072B3
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322003AEF3A;
	Fri, 17 Apr 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VRDjgrGw"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C330EF9A;
	Fri, 17 Apr 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415877; cv=fail; b=mm8ufc7P4+gx38YbzRcie/PnDOpzYD8PlJx136fDO+wQ7t9oPGwAl6dzJAJ4ichcQ0MnWpb9FjekWNpJZ+Kj2ofe5dK2omXGEueGLwVDVjWz9oX7rvpjNvgGmWp4GQji6vxsy1LOccbXccGzd5yRRxozBHEFzYwjQBiSqV6siuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415877; c=relaxed/simple;
	bh=S6AGejIyAPyGsmPaYwbHhs2dpw9YKEVjHaxDHn2/ME0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kYWXLn891wiIZ0MaPcRzGJYNmIa2CqcpSlZdJ8i6WKUxSzgCKRENokgZlF6cQY56dVEAtZ4yigLucpObO/v89DCIKdSPYhT1rMK1t10/Syzx8RV/gDQhx2svlR2eKRfaeVuKB6qvOg9wE4TeCToU9oKgn97WPj/sWPvvcHfncVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VRDjgrGw; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt2R9QCjhl5dkgaEQkaL1OcDOIN73AI2QaNUm2OgwLUOP7SMOLCk9AGhngPeHD+irYZLQxnj8uv+0vygOSeJROEeeUH87vh45XIIwtlVW9fcWB3b1nedjszc9tzGMFXF+E0+DdRlSri3LvthaVOAXrYGL+rXNkNx3P3c3XcsE4oJDg5m2dKc9dJp9eDmUDmDcVI8JcB8XGr3aecOcWGx/zTq35s+okXjRC3OIoppmLYP+1Jltp1l8+XxLLlDEg8rfoP209I/zxMs4o60LrVHAIs4K8GTfQAsaQyqbDQ/HSwpn5faxHtu6qWV9+crs4x/WUdOEpGbyHwHNQ16XvEY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6QdxBH/xsptjqYlM3MwBE0o6/mgvXC8pddkUQpu7uE=;
 b=FqoF3Qd3ViEuQrAsGq1RVMRQ5X5KbuRfPQhauyMkY5E3ljGjglbYbxW+NxB6asDDInOQAKjK4tPLUxpLbEmd8u8lH38ZUF8w25LHDkyI567opEMZP7UGXaQIWv+HxkYLeb4TT/4f/2Ff1JRAHrlYdg++YE5PwUb6/Y1uEIG8PPS9WDn1BBuNxjxefOnfirdNUqK5FuE/nfBpLIXiCrcvq426beM1GSA3EcAp9hZR4AxUncIpuhX+qypb89qH4ktAnkkRfcZFvOQVSiIGKR+LaTFw2aGU+OM+925cZaVe7kpNQptaWBV3sj5u/SE4ousoJ/EOpofzEqDC0vV5LeYzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6QdxBH/xsptjqYlM3MwBE0o6/mgvXC8pddkUQpu7uE=;
 b=VRDjgrGwqYHlHtB5h6WMogY0L5N5GicpPe1+fxlkB8l4CuHU4ehaalHwC8lntywEScb5AKzHKfKa19jzJVARiNcYYlNKY/DGES99gW1yvmE5AC07wna93X/94fK8TsZYvhub/JkPQbZDTDVpn3lngvab0KihdjJjh4zPX/EH+lWXGPAQ5eTysXAdFnMWrAi54PFXUyKwvjmVJ2kA0F9W0Z/GYZoxuMuQ0TkZNSnB5uCTwum3BwvCL2jjhAePsInzInq7EKUYmz7y1pLDsq0yLQfpMHHEpnxEz416NuW7RVwrLtHBg4GT5Ghj4fFEW70Jp/MXf+6lLhL2ZdNmflRSEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10949.eurprd04.prod.outlook.com (2603:10a6:800:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:51:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:51:11 +0000
Date: Fri, 17 Apr 2026 04:51:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/5] media: synopsys: Add PHY stopstate wait for i.MX93
Message-ID: <aeH0d1Bbp0agLPto@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-3-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-3-7d63f3508719@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10949:EE_
X-MS-Office365-Filtering-Correlation-Id: abc7a9ec-e39e-42db-061c-08de9c5e799a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 j6lXNfU+/o4BcfQ0nyOL4RgICoeGL7k5XkEAkGZPtApgHkA3FX5cDV5QEs9qRIrnxKyuKG+MeujvcUg0OJ6sKsvf6Na7V/4rgBzXRNI/XNXGpEz38Jn0P4r+AZUuL0q9lgXns2WcrKLk8PYdtn3yIRancT+J99mc9xvZI2tYEtWvqV+L2RePqTbqfgbPMX8yQz9cxytX7kEVJASysfEkdGhoa7bi8PHTWHYp9e3SNjKC/s6lluqMm8J8CrvZIONkXZ/6xI2dND57kLfWovzP1BLqoN0wUi+KKwTxRTQ1K8jfCHolchiECX/ddR2sASqF1OyJ7r10+IhD0yix27CXB7DagOZPBBIvoIaIFnInK20MnHCZ8xj8dLwMm4zctI4xlqo6rIDILU8fmQMbMtzb98FsPYhfmNgpxy2kRH3xL24Lwf1fpoBhepfdfA38/Gs1+/Q/MTr2FQJuYS+xNxFWqOwQGJgFHuQlVd2mJm4EeS3Fag9yOU+h4MGtK8d1LpFR9XtDHXVkjP62fhyqI2sDjqorTFlor6gQXKHvhm0OxQq9Bnv+lMdpJUwD3HHTR1KwCvYrsLD3/oLPrfOjJLo89EReSlsfe2lTZ9YxVmfPSIWuAK/BiWAITuOfBU3zRZRSwHaivqnpA6uXEqfNka5toBGKOGHv0X++ZAoEFjnZmfrWrsk0lGL9QKRroiymZCdJZhsZ/omECamJyCixyPoxsKe6ItSxTHrzQ2LwPr8rD1AD9WRbUNHAvW/5VE7bOWtf+piRRUEB1REmRskrNpbYmw5SIqjIH/h8ufafXDYRfUs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?UMW+rB9m7JYFZXLZXlZysIssOy53VD+3nsPDKI9cQ6G0o3W/jTUfUX0DQnph?=
 =?us-ascii?Q?yP59GNYCRoHZhqvJTf9uM2HROW5pu08FmI77dYfAc/X6lerxy0o8WGQLlh7k?=
 =?us-ascii?Q?raEqdLi9+i+M0BJbN+Z1ibtJiR4nTS4AauWhrdxYfffB1Ojhmvr2CNevpAIQ?=
 =?us-ascii?Q?J8eFX/TKpBj1c39zS4RhW9GA522osi8Npmqxq5Nxb7ut8AikfjIeKZEevXOP?=
 =?us-ascii?Q?pVvK1MM9sP/7hO+2TecAJ1Px3GVI9ddGL/Ipo+sYvkY94udpkX3SO5Zkzt6c?=
 =?us-ascii?Q?OfBAY08alPVhCcgad5JiePltXX9E3qvuml5KK3R6Rawu0NwNkXipUDH8zd16?=
 =?us-ascii?Q?so9kVkKEbsG7pmYErfHPYpGoIjPOOPuHWd6xP1DvkQfDb1V7dt62tlqHZtxc?=
 =?us-ascii?Q?59acGFYvCmiVauB8MXlVRj9XphbDMu2ncPQiNaXroAXO3SGftzUlMn8DDbBl?=
 =?us-ascii?Q?w51+Q9c88mXgBUUO777UATQ0a1cN7Cl5/vcNG0JmEHGmfjDA9elBmRoqDkPq?=
 =?us-ascii?Q?ZVhs/auAlMhkw+oVZOFs+SxSLlodfNtRg/Fkhh6GRkXRARz+AvWz2oJ01xIx?=
 =?us-ascii?Q?cRZK17Pd9vB4etSB1nwDPINFfbeMjLUAc5xIkDkH8mygLcUPYfKu181udowz?=
 =?us-ascii?Q?YIyHEtbc0fvV9yRIfEwu8+slxgVxlBHh1YnvUOpTR4WcofF+J2DfzTSFgIvK?=
 =?us-ascii?Q?dft6ZHUj0CBXnl46UHSb7zC9D/XD8TB106rngramUhaPftKMjxcJiUMcNw2u?=
 =?us-ascii?Q?P4t8i16O+PrRX1g1IbVEZRCkgJlw4I8kHxzhwHsQTDWMXJcttoc/9gaPrwp9?=
 =?us-ascii?Q?z277zyPCTkKK/rByc5996rV4acYsh7udtkZOYJFHqCyQLz2qkhFz16YUWqQq?=
 =?us-ascii?Q?JWEuhfEMokLbnqEcnYj7bfK0RGPYajzOwkSltRvqQxg7Ry6BxeYhSTu7CLFW?=
 =?us-ascii?Q?thKPr237cdjccgDiMekIqoyw4oIUilF0S55k9LJcCduCEbPXOtOptgJ0eUyM?=
 =?us-ascii?Q?uV9BfVACw9I1GwkhgD41PYBtlwWEtaDpmOgB/mkvC8L2pjhjoF8gbz690K7a?=
 =?us-ascii?Q?BV8yQW0yEAhl5Gi7zzvtO8MSRb4IXnuyNuLat0nKl3C6APawkaD3+MhlSlMJ?=
 =?us-ascii?Q?1QTjVl+1k2rHVQc/M8KBfxWaDFI6YAg/l5Xsu2Js2ODxEfuSYLRfynQkM0Fb?=
 =?us-ascii?Q?yFCU3BBoGAT+lJXg7cYOmMheoroYVvwQ6sFenu2Sz6veQU5Hws5iRWvvVcM9?=
 =?us-ascii?Q?QxELsGF2229cUeexvhIsVoJPxAqgWMY3S7ZgBAq0bICVYN0jZz7a82EHTF9i?=
 =?us-ascii?Q?lm/atI/iRR4uOmDCdQL9jgJcnuQcrglnifyDyN5uTi8KpwPraVZXiGJIk7O6?=
 =?us-ascii?Q?HsSju2uemR8FfypJc7vyViXtkowaDb68NiKQBwSMghmTvs5P/Q/4JLEODAiZ?=
 =?us-ascii?Q?/edLUJTcLGYewTlcdZFavBwbWLoteje2wKxMFuSy9qO/cYXUf9MdfwnE2zAZ?=
 =?us-ascii?Q?eE4fGM9ZzXlml9P8F6Pzi3QfPCL1u8Xdlk8UvEZIrhPOOr12ycoQhby4iKAA?=
 =?us-ascii?Q?qstOk9JosK83lLdBj5CKVs8R60jaTu8YzFsD11nGgpNI8UWX0zc/gsx2MteH?=
 =?us-ascii?Q?bdcHrv94nR1xJDdFL/ubGS7EUCVAvAaEoJmnfX+OkbM2l7lvHk3MesAgDf+4?=
 =?us-ascii?Q?Odkzdw0rCAxncv63e3XIaVEh2kKjpvhjgYQ8GTja+LW1Q8Du7UWsu7LeFcuP?=
 =?us-ascii?Q?5cHIEuOouw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc7a9ec-e39e-42db-061c-08de9c5e799a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:51:11.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3tLXKNtCRcxD/EpTx8sEPFi9gjD/uqroTD7K7GXctqfkT6GboFVen2lb2+jpf0TC4u7pxT6IWM+U9bhzioh6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10949
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58980-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F26E418F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:46:54AM +0800, Guoniu Zhou wrote:
> Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
> ensures proper PHY initialization by verifying that the clock lane and
> all active data lanes have entered the stop state before proceeding with
> further operations.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
...
>
> +static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct device *dev = csi2->dev;
> +	void __iomem *addr;
> +	u32 stopstate_mask;
> +	u32 val;
> +	int ret;
> +
> +	if (!dw_mipi_csi2rx_has_reg(csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE)) {
> +		dev_err(dev, "phy_stopstate register not available\n");
> +		return -ENXIO;
> +	}

Needn't this check, you just implment this specfic callback for imx93, so
DW_MIPI_CSI2RX_PHY_STOPSTATE must be there.


> +
> +	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
> +	addr = dw_mipi_csi2rx_get_regaddr(csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
> +
> +	ret = readl_poll_timeout(addr, val, (val & stopstate_mask) != stopstate_mask,
> +				 1000, 2000000);

There are dw_mipi_csi2rx_read() helper function. So you already use

read_poll_timeout(dw_mipi_csi2rx_read, ...)

Frank

