Return-Path: <linux-media+bounces-58973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLOhCAzx4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:36:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF8418BF8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 677C63152A66
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D83AEF36;
	Fri, 17 Apr 2026 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iELL1UAz"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611824677B;
	Fri, 17 Apr 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414698; cv=fail; b=cv5Cgfw4vr3zEfm14ZONqV01PVU2K77JH0h4/hDNrTrBYkeP7zCDS1nKbjnxlo8R6rH2ZzTVSy+grqM0JpKz7Gdi2GEof6aKLc5FMpsOjhR+dQc+tOlShNuMxH7nOCLJ4r8sRdGc9Uo3PZGZZpgxsB1t5tG+a5xTBGwDKFBQq/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414698; c=relaxed/simple;
	bh=qUrnLGV8XmnzJf2BUC3wTIO7wRjAE4+IE6AYxmDl4Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BnywGTs+oW7O3pDrlxHlxxnxp7tim8NAugH3UQrSl1jV/squ+9TkLZ3lL34U+LAPWPuh8DEzdaERiQvToemKeD03VG7W1UXhD1FPiekjn8zYlBd24bU2kuY/UatrHElVgn94z6pAU3fLzbxQikzmwGvqu0K9HAYzItkpdkz7FmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iELL1UAz; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7ScVjN206kqzeJsizzfDtILdk7g4GLQWRnpPKixt2AFdDciOCn5F/D5MJ91QQ4bEjwambooTAG9ykTkTw+EOx9e7yGrLQiEtB1xVfHqY0K4RAZtXDaTbOAavO2eyl+cn3nnbwkTty5KsxEE5qu9lSNIqeGmt1yuDg6/QeCNx4YqF57uY7ZLYwXefc6E55wzago7L6lQpSI+iSVUPcFBnxFic3No/ASLx8aSgiyVuwwrgbPDTNKBBVaV45nqxx92g0ftadRHo8wimaRCP4BsYItk64nsV6g6ngW51fnclkpHQF3XOGO8Q3lWxIpdnslu7JXXvnRkJM9q6OjSP4AJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjfXj6InpPkRn1FsOvgJmjTaCSScbcVVl437tH4xr2U=;
 b=ke+tfCT+OTQHUZGQa3uzAtHenA5SBN9as+eyIJB3kST3dyvVLZJsjyl2sTfNjrkIXjrmSM1hQjgRGpx69SEA5pI+GbwfclCi//YQt83Gs334za9hBdpYrFTXEgfthjI2N4WD4AqWyoxXc7mJXvu9wxl4T7e+2B6Z7TZoRAL7wx7x80tLSgor9dHAK/GNKikizkJnI52ePJwQD3xAPUwGuc8BzWwteHY1Wca6vbHn5izVA2Mmb1/rCoUo5uOXCBt4hcx4qSqIhE387MNHl9dejSo1/zqlEcPIYSLFd2OuGnseTcWVq9AMaBwJwvBeJyFVaz2QWakElaGrb9ZPxxkUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjfXj6InpPkRn1FsOvgJmjTaCSScbcVVl437tH4xr2U=;
 b=iELL1UAz9RLVmNekBOPJT93Ly3Wu4/MTbjmajGIPkzv/XItw7tOmVzMIKoigeu6Iz/CuwMI5sONGO1kWUanSOH3v93t9KK2LoVn0rbNP9PxHTa0/OHfTLWaPHOw0pPfCsLm5GEXujhcuzo4nLuMdwBnNutFXcJqdAibOY3e+TAcvcQCCrW81II1J0qJY7HmpOo0vhvEJ/uImzoXhhwbG1L3YT1RGd8XrQEssIj4iRQPagqXRyN6vN8LMyh2oINdoyYLgWm6dQ+4iyz8VrR1uouzBZdgr9VdQob+suh3uwTJxHteR6SCwTCEmCxusJ3ymh6UBdeJNdJHo1BrSgfeF9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11262.eurprd04.prod.outlook.com (2603:10a6:102:4eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:31:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:31:29 +0000
Date: Fri, 17 Apr 2026 04:31:23 -0400
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
Subject: Re: [PATCH 1/5] media: synopsys: Add support for RAW16 Bayer formats
Message-ID: <aeHv20exJWWktk1w@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-1-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-1-7d63f3508719@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11262:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdc4fd5-1782-4bed-8fdb-08de9c5bb92c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 owIA0oJYMx00ONhLwBI/wM3tUFYIVJj2HiOgQCfB1Xi4hh4/C2JLAAU6SsZNt3s7V2MJ89H/K6Hx5eLUQB1P66VsnTTR4G0Qv6GxI9IYRLzHYh04tbJ28Shp4fyD/siaqqjoNvbprISwsfiBQps9YP4HIwAy/s98VTZhopNrEwg5pG7qpVgdqNEi2rkanEZBaGU9yP+epCRzWGQQj5RJVFgwVA/AVvMgx2BWM9e1CJJHIyA2Z5ATpXvXXILg/eesn4oh9lu0waFLhbYe40H3VkkR1qw3QcPaADmgwysn3EGu7fhc7y2Q3Wll+DoEUjx++q4hXP3ifxmcV/CQOZsUhI7iFB9Sw5uHfx4Pz7HjfqdqA2UAKitd1HYeTE1qz/r+JfTxlBrJmml8xDdE0GPydkouDvnhyK2p1WboPp45E9UCJRApVMS549PB424WTy5Bz3j2w4OZrmkFQFSk3XsaA3E1MgKaRRaDPPLKd/3nv4ADLm7QRLl5Vu3wtY44OhfkDVsP0V4+0q6KiIUdQCEjLq46iosp9o06kIpUb19TsEq7mJWHJ7jOK2jSsE0SRk85g+jPJTFpUeCPwH3fWptYiPRuxUg1xhVSZJI/k1cc6tBwOcTL1Ss2uGTmejzx0/Fa8HG9fO9LuKmzEp0jHiZuA6VmLmAnz/6s+YrfuhsGjPfuoaOYXYZ6MShCyX37BUBjw9NJD4sXS+YS8amNabMMdGlKCGFJerp0s24UKCoZXDfxpPYeWlXd0gRf8oYaGxrt3VccoqLYYXtibb0dXTLV6w0k4iNrqMjbnEktRlNeF3o=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?8CciB13Rkr8q2QU/TwRAvasgNKhuzwh08J6kgpEvjy3UY7yyMvNAltkfq31w?=
 =?us-ascii?Q?gUX8AVYoIhHv1RKC+XBRLAhKNBASV+UFgSafoxHdW8v9JXLdJmTzAcoz3VTo?=
 =?us-ascii?Q?xznLOtVf3EUZ3WMAncbysBIs2fqYt78hWk/NO3ieXADit17YMT7UBWhYC2Rs?=
 =?us-ascii?Q?nKfO/M94zboDn44I7VfDkXpTgurhoUdiOSLTy83/euLqro9Eg5OrhnwLxRHw?=
 =?us-ascii?Q?B3rSpwABeRrhSRx+T29h/WyD2mdxF3bQ+2g+y7DAX/8MjBQ9oOunh7XjfIHk?=
 =?us-ascii?Q?VgkkUG8b/kQeisbL/Bf7lYiBTeNKLl8roYzb4GueFkuA/gRhywVwJcBq41No?=
 =?us-ascii?Q?S3U6ss4aUyVts58XBaP31kWMf7lJCAq2M5ID4YR6zECIj6VDi9e2mJnQDeqi?=
 =?us-ascii?Q?RkBObSXbIyCHImfk1YcvcPHfmadyQaXVOVRHz5dNuYbaFy+i1HEsuCsbOVAk?=
 =?us-ascii?Q?WK5jYILf+VN1/7aOffcNz5KQQgms8BlU0Oo3h6g2AheUaW2J+GYDjqhTYYdZ?=
 =?us-ascii?Q?7u7tvF8hd4RfqYrafqb09VzS8ewrGqVi+4cJsoVhb6qxxuUbIq3Mk49wl7hC?=
 =?us-ascii?Q?7MdhkfCkQQrNIkhmOk41h1xA0wM00SdAMBzSo+bm9kXJBSkByoyTN4UCrTJZ?=
 =?us-ascii?Q?4nU0babyn2Gg6YqPCZYBDIyihZDhZ8Up2zOqS007Wf+ko+cSRO+T05Vmc6gp?=
 =?us-ascii?Q?DVh+ZOTnbagb+CH4QGR6SjCkhgVSTb3MvV/n7yeMN1fTETsoLnN7Ql1cJJ4w?=
 =?us-ascii?Q?yZRV1sVh/EwBkaNNk1pwcsUUVFdO/KReLaUPT0L97kPEvD97QhqXnq5upF90?=
 =?us-ascii?Q?67v9NqeSfPZPxw98neq1gdlhkvZ9on1hN19qoXTnagkITfrRGiu9MUepjUM1?=
 =?us-ascii?Q?ITAirNzbvjf0gJqjH0ddyW4HIh2SYU71IdOTXSNSzgD0pgMJmWhBgFX93GdL?=
 =?us-ascii?Q?z/93nA5zCdi3dtZ/2JwbKSJh885vA/0ywvp3o7wXrrQHikTV4f63naBYsJ+p?=
 =?us-ascii?Q?chcbBTXqru5J1t6NoBXBxfC5mp94t0Mf0uuRq8NseTyplBY9Mdi9O3gvUUVd?=
 =?us-ascii?Q?y09IF5GZ/3tjsc9SmHt4TF1Z0MW7bRim0N4mD2AXlZUpuKqLRvwBz/ZQRdrG?=
 =?us-ascii?Q?uAxOxJt+rk+pK7Di9BJ2x+rITyLV3Yrx+TvCdaCYGCCpdJ5dWd05qMSZB7Ju?=
 =?us-ascii?Q?AUbEmXK1Ali+uCxtwup0YjBzOjgmnCu8Yfa87Lpi7OeYYLok32SLVMgRQ/EN?=
 =?us-ascii?Q?vZnAfrLVAIcQ/A3eqksOWJXQiA+0W+vC8SAp5mRv2oBtX4viPnx9aLFjblqr?=
 =?us-ascii?Q?m+KzJ1tnA5d5ebAo+JMfM/rddOXLbq0g5uTAPJwkb3MDFFHSj5EDmTYnWJm2?=
 =?us-ascii?Q?IZJfu0dL36nh+eTAgs86GK8bcgor+5chXuBI8wHlr4vAbX9xzXspsSCdU6l8?=
 =?us-ascii?Q?kJvzZ1Pxfb4pDwTj58nZp/Vi21n8jX/xXsSCyyDOjG+mCL7maHPLPIuYZdwI?=
 =?us-ascii?Q?EmqlbhwDsJq1edigwzs0sK/atcSggEL6nz2ZI/WREnvRUfmbjMUKRsECZVxd?=
 =?us-ascii?Q?n/UWLDpKGvpjSMX4jkgEc2sj7GMBlWjYPrSULkxX7tv8sbooLLPyIgPZCEgd?=
 =?us-ascii?Q?qIaR+qHpStXMs0zj9oseImTpJ/O7O0mq9GqbBDDEmSnjnsI9gYso7ah/2ocf?=
 =?us-ascii?Q?R3Ij+8Vzmm9+Dh0BvCS+2abi3PhO1+2Xjr8mv9KWTdALyLe0arNI4D94cphF?=
 =?us-ascii?Q?jhr0dPNSkw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdc4fd5-1782-4bed-8fdb-08de9c5bb92c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:31:29.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPDEVoUjbMW0p58hG0U5G8aOBfVDN6ypt0A6VBi2H2mH29nwr8f08T53hADX84EZvhhmJj8aT5XHYrKm4tkx4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11262
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58973-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66BF8418BF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:46:52AM +0800, Guoniu Zhou wrote:
> This enables the driver to handle higher bit-depth raw image data
> from image sensors that support 16-bit output.

wrap at 75 char,

Add higher bit-depth raw image data support for the sensors, which supports
16-bit output.

Frank
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index ce17f986279e..46e2a4315ac2 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -252,6 +252,26 @@ static const struct dw_mipi_csi2rx_format formats[] = {
>  		.depth = 12,
>  		.csi_dt = MIPI_CSI2_DT_RAW12,
>  	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
>  };
>
>  static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
>
> --
> 2.34.1
>

