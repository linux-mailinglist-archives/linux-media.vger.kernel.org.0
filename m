Return-Path: <linux-media+bounces-58990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAHrFrQE4mmQ0gAAu9opvQ
	(envelope-from <linux-media+bounces-58990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:00:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC9419D36
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12547305BDE3
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936E236E497;
	Fri, 17 Apr 2026 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nS5fWp8J"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB682369219;
	Fri, 17 Apr 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419139; cv=fail; b=YD0HX/Mp9hxwnFusO4LwxekZkTbaFyKK47OPFNYAHsEEhsbMqCma1Sbl1/YDs7K1NAjQ+B/vYk6ynkWNisuS3zUf1bgO/fewH8xsIxDEUDmi1xKLXeOpkMhndln3sjMXsCLacr/5LDyUYpqqNpU0FfkC0HxTLpqaouQbsXznYHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419139; c=relaxed/simple;
	bh=N7AQy0LH0lNtc0iUHjUBehVZwmRMd0jTw1142kYq5Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GFIjE+NCIsmBisMN4qAbxTtlC7/TdI4Uf2iXeAw3yAVJFx4G/KZ3B1QI6581jyP32m99ezygRGoHHI4iYsn/zh/wfHYPO2R9DuHkLOaoXIaEt9oGygbS6+Hlrh9GM4SUI097aynfzmQgdtdYOnVCJHcD5ZKe86Q6ELU8QJ6ioYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nS5fWp8J; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0m+KZRyPd41YtImi1iMY8WW1qR8/Rr35gaRnyvwhZZSsEFG/AcEIHAo9U962brXJrLaqe1xbNTrkoUPsearxQqDfj/ZxXnU8TLK4t4ZcMkv5FBMUW9vQmf3ifITtYyowkojwvwssAK/Swd7B39B5Kwqa/lpJpxBu5Po4eVvbkNv+jH6+HllQXnZm/HpJhHp/HlmQ9EcZJ3pvz9LN/Kloz8A8qZ0yURxUPUJITxclQ+EcpYWrXZTH8bQ3hqRIH6FSWEpRODsdKAV5kszqrGjo7VGOjzZeEh9yG9NALlrDKn3rXgZ8zM/eKViu+BBDtg9uXqHrcbfixLDmIOBLyfqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIcCuMZMtP7NnNb1CPgt8rirHGz7U8usKLgTyihFD+8=;
 b=gR3bS9DX/wAJRlya9TI62XLrpJyMFziRkDw0AESsl65CRZqmrQULlGh9r9WTlPteqqiLY/ilv03YOrf4yIBP7iWtqXw5N1ZUQUA5tOilYZLj0pyVt8oWNC0iaopEVR9d3xW0mxBbJbJSLzHevALvk7GYdPTraqTIOVg/ZmMUhNVqodPWrACMYjgfE72H8ZPXC+bw5+HmajzECF5yuu+1W5/89YAIFBSvhcdXSSfdEWJUXwNwiU5Ltw1vyiGcXucxB/sE835JWgm8UvCxjKA2OmBFrAMyFnCbJq7SA/LtixUlFbZdDB6YV2D2bBo8rIBWJ4B26lmqo2JwA8DsuC9kGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIcCuMZMtP7NnNb1CPgt8rirHGz7U8usKLgTyihFD+8=;
 b=nS5fWp8Jm4NDvOFAS1qlO873CG9xn2XytcIqJn3TX6P6GGWkjqeYfJCY6ug3Cy1+aR0fVPFwCGK4dklsfZzMTP4g07VSxIMVw4j9vL9GpiZ/Bz5VoM3ZyTc/KhhQo05s/Is+uHV5DpdGNdMXedrV2IRdmTz5qDhCGaeqWRhyMg1oe92iR2RIRqLETWrpeOcOmII5O6xzfEIP2Bi5f/NkgVNu/8Z7ayjaBToArdiYm1maQ5Rtexc461A+hC/DBpqlT0rv+iPrBUDWK8ZYQ4WqEybsEPBzOg8c0lSxDZ4yJ/+5O8i+Y/mLoSCkH4TThgAKPj9mA0MaBYyi3XvZNGY0gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:45:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 09:45:34 +0000
Date: Fri, 17 Apr 2026 05:45:27 -0400
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
Subject: Re: [PATCH 5/5] media: synopsys: Add support for i.MX95
Message-ID: <aeIBN_sPsX4ydonk@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-5-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-5-7d63f3508719@oss.nxp.com>
X-ClientProxiedBy: SA9PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:6e::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5e3606-ba74-4277-5007-08de9c661273
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 B7heXnLqfsfdSbhdEf+UNUh17OSqvtyUTKSQj9lOHa+9UFtavv1VE/UtXmhLQqBNnnsgplcGOuC/4Hts2VW+M+TosZLxEcMxVI6yvaRFkuuy7Am6RN2EDjvi+SxReJQERhwu1X9weKEcBiKulXzEPqRrmPqZMUZC3YiOtoED5Gb+FYZyVI9R1wQGOjQva2+r9WrwEBXk0rdFoXXYtrpBnoa3jeuTY4Dl4CbtayVzqvuZVu0NAvWyUQIDfB/IT72LmQm1vPzZfqkCXOZFAxCKYtPLdGZ4G0rk+ylWX9ddChUc2fxCJOq6jB/fjmz4+Irt/W7VUOWGxCnN3+2iz64fcgGpxor3hnaAQUoIEqDkAqTmzkDlRhV7GmTGTmKjioVcvp7MjSV5VTHVqU43vL+l+frraIZuHgJ835RKCi+3jzyOBCwzh9TtfQwlEfGKrVajt4TKWTvCltzrOg5NbAaSS5vM6tJMcPg8UV4FKDLK1g84Q+CxsMp6VxMQiMEmkaDpmAjWLeYNGsx83Y5CZ9ajM6OWrM4alC9w9MtKkLKrJOVSTwCOnAIjAEjNT4UvOLiuGOQJv24J+HD39qJYkJ185VnJBTvOIOtio32dWp2JatbQVN+IBPx1ZtjbTKeavBjuM9rF7R1sQt3apv26o9bRNpXVJi66nk8+wph+Ihrpp86d+wnZ9fUOdGB0XBiNX/+KdD3MB3OQVArFKkpSt1wJpRvp+l+r6zrYtyZcOMhQlhOq5zZj1tt13ZO9Xm0/UJfVz2v61z1Xke8nq1qDQ1NNat0d+LKWr730YxeouBbhrPw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?vTKHxdu560SjqHkzAAdpieVkKfmUY3hBQiBhXbWJxUct4AQN6AVzE+NwNOo5?=
 =?us-ascii?Q?aaHsTopyGy+b3VrbbBqSY5bEEOJrqotAn3EbSazD8dDEyOZYSfgxfGpnyJBd?=
 =?us-ascii?Q?TULBL8DGZKtBMlw/5KkspcT9aTqEshWAPRyi8mXtgcuMm7DuyOEfX6tc6XPm?=
 =?us-ascii?Q?E21ROMWdNn47VSclDD79Yto2bJ/Hg38ygZmr/GzDKMhY81nk7dFLXMsoUebc?=
 =?us-ascii?Q?VhCVK1RFVe29XlpYOH74pd1H8BVdhZzRIvdmzfK+xZK+GGXk34W8Rx1fBiFv?=
 =?us-ascii?Q?O97W2MgcpTsmpEsW2HqDeWmST4SPSl9ZMRKRh2LkOseUAdtI9SRjRJV6/Pnb?=
 =?us-ascii?Q?aHpoSC9R5Pygc9GGjY95+IrculE+89ZtC0dFhMyw74ZAJiWKPLWoyxNdlN92?=
 =?us-ascii?Q?vZpekFUPQm5yH64tfcF8/yQKxVfsCvw7/DF0hi0wSy/QNnv3VzuMD8sGlfl1?=
 =?us-ascii?Q?oeQ+BCZCB0kbSPEiYrgjglX4dVFVdflOWYRCjMok+E/Ppn+IU1AlFGpc2NIc?=
 =?us-ascii?Q?vJjjJBozABaQRao83oZUtnDEJ8LyKca6d1mqfD59hjSQQBG4qelqRu3ubf/k?=
 =?us-ascii?Q?5Z3ZFedZicQKOcSVXBR2lbC/WT+HrssAO/EllC4d0yM3doipOiPPXaUrfy/4?=
 =?us-ascii?Q?y/bLCTJM2LnQbUrSLMQEZmknGXD8P2Bp4R1q/JAaIbAkVsqCVRayK3k86HXw?=
 =?us-ascii?Q?9dGe4MDUS7c3Sr3vTKLa+zSLXrSS/8fKEQrPKQwTL3l4xuaVKkE70dIt+0gC?=
 =?us-ascii?Q?JqbG8AV4BSkrWRq5CnzttxLxtsCYg1GJ1DyhUrDvoelcgW42cRCsBTJ9Qq4+?=
 =?us-ascii?Q?iW6KWvpDYYHen+pL7zTu91UEsNw6R+Xzy00vyrImMm6UM7bbJI87ufjF+wCn?=
 =?us-ascii?Q?xgzp4LsTL6H9K21QTxkMiroFsvVmE3cHnWG5kYYDurmyfnjAzpuLtygx/B4Z?=
 =?us-ascii?Q?80qGF0qMT4BliysDYqg46I+S2dv+wcmp3grpnf73bAuBhoyHxaX+745g4ncX?=
 =?us-ascii?Q?NOUFVXEJ0kZa93etORm1AhbBbevhk+6vbXIXMRj4WzTeEObl5vLhXSGYH09B?=
 =?us-ascii?Q?tEf/rNO3CYpEp+szDemXrbT1ixjhRcTbbOgLBxD9KzPoivwv3mngDV91EdTC?=
 =?us-ascii?Q?e6NSCT2MvkX8u4VnPE0HuNki8gVh6lSndxda2VN2DJGwbvmlnoG7cUqGyEv7?=
 =?us-ascii?Q?1sfUI+OYxdvVERjOacckJkmPzk+mHsDB3xb18xngya75Q41XIGKFT4mmcLGg?=
 =?us-ascii?Q?OYtUyGgRZAfYUl+ZZ3vvBF8zhJvsp3INqyysoLCjv5KCdkEDib2O9E8UI4AC?=
 =?us-ascii?Q?QjEmz8HqNEI0596F6+7lyEbKPQoFWhaxa2IZ+Om9amkbj5I61yN2b/xFDFEP?=
 =?us-ascii?Q?j8y1pBATt/4EcGGs0dP1J/gb9ocUIkDYHqEYN6zZwaYSg6hvV07lT/sWskL4?=
 =?us-ascii?Q?sJxRrjatzMazr/BA9Ld/jQCH1sRaLtb3mFGYoToQt01c8jrWaxEjwMyCl5Qu?=
 =?us-ascii?Q?qMNQT5NDGy0oCFQpvdJZgPF0qy9mzh/JcPVUFQl3gCslFpg1CwZBtEpiHxap?=
 =?us-ascii?Q?Yub8JNL2IfKN++t/SIoad79YjN8D0Ky1Ishoq6kIvY+I5fSiofj9i2w/CAw9?=
 =?us-ascii?Q?vwFri61AZLnMn6Wqssl9woHbOimb2jx+ewc2pLJjuAgwYMA4/mnPFnhvi+Aa?=
 =?us-ascii?Q?yrHamnLrsGasMKscDXeFO8wyXZU399rWnZ3pDuN/aiANdDLrUcHsZzPg0aD/?=
 =?us-ascii?Q?ZV0WAHFD0A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5e3606-ba74-4277-5007-08de9c661273
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:45:34.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lKMgM1hrNKZuTOozcxYEsDxy92DYC/autgJj6ShOrgU5/F/VI+cmRCqvdwPItk+IQTxS3ru8+03y2GQj5VAQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680
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
	TAGGED_FROM(0.00)[bounces-58990-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52CC9419D36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:46:56AM +0800, Guoniu Zhou wrote:
> Add support for the i.MX95 MIPI CSI-2 receiver. The i.MX95 variant is
> nearly identical to i.MX93, with the main difference being the use of
> IDI (Image Data Interface) instead of IPI (Image Pixel Interface).
> However, the IDI interface is transparent to software, requiring only
> a different register map definition while sharing the same PHY control
> functions with i.MX93.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 27e4c1027816..bbb41baf789e 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -154,6 +154,17 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
>  	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
>  };
>
> +static const u32 imx95_regs[DW_MIPI_CSI2RX_MAX] = {
> +	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
> +	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
> +	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
> +	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
> +	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
> +	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
> +	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
> +	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
> +};
> +
>  static const struct v4l2_mbus_framefmt default_format = {
>  	.width = 3840,
>  	.height = 2160,
> @@ -901,11 +912,22 @@ static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
>  	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
>  };
>
> +static const struct dw_mipi_csi2rx_drvdata imx95_drvdata = {
> +	.regs = imx95_regs,
> +	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
> +	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
> +	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
> +};
> +
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
>  		.compatible = "fsl,imx93-mipi-csi2",
>  		.data = &imx93_drvdata,
>  	},
> +	{
> +		.compatible = "fsl,imx95-mipi-csi2",
> +		.data = &imx95_drvdata,
> +	},
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
>  		.data = &rk3568_drvdata,
>
> --
> 2.34.1
>

