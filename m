Return-Path: <linux-media+bounces-37240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248FAFF707
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 04:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B30344A6B2C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 02:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833CE280022;
	Thu, 10 Jul 2025 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YFJYK5XA"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813D1FDD;
	Thu, 10 Jul 2025 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752115707; cv=fail; b=Yns1JhMBe4aNV7DOcoudqpe0l9Dd2gg08esPzdZg3n9Cs/uNli6u/hYXEJtKLx80+qUiu1C07yMB56VUGPocJ0bHT/Gbx2I0s7DWFHNHl6YzzksnjMiwxUvAJqdioVuAMgX4B6dMOD1pI4kyDi0r6vua5RtvyHD7PqTU4O2tkKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752115707; c=relaxed/simple;
	bh=6SeoQGvVnVHD4+ahJ6FznSX+E10d7bRyJeEdu66Iudo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q/UAH4rtB0qCkIu8vs5pJDunz00HGXK5qlcnpUqe93rIt7ryD+ptLGUE/WkeF5NoJHHl5YEK9K45XELczlcfKB/42MFC0rimi41CdN2SoLIXeEhGgVenjZ7qcBLvoUDBavXWgeG3pXxmdnD+nQQccJILwqcRRq/+ySpN5yMGZgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YFJYK5XA; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnIdvCN0A2mw6MuNWQIPW7xR9oIWvaeh/EUQJ6/sWMAhSiYaBBsnZtvPiAMt2zMo8WQuD62XZ1fhexgFTDXufqP4FoGmxNFvViVNXMBsDHMaSEXrHl/4E1mwwWuM9CRSiHAraP/dzhSv8qWkYiiwj3QbXRfJuWVqgBWAYJSL3cq6YYQIkpVVRGNOqRtprWv6WzpcsGMwA9rpUliksaHCho0aYhATu+m+SBW3UH/n2olGHi8wPFvksrVkY8iPtNHllWBTIsUGTVwXNE1pIVQWH8ua3I3rbRfd+uRIeRqPIt55OLoGylSBUHSdsPKYe3z1/X/VTXZgPQWXiOjwLksn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2IEFx7lb3L0njPu7B1u7iI7YrMg8UIeTKMQ7itbG6s=;
 b=cen0pa0ZiVCN07nECFsqGrkpiMqhgyG1BrI+zdXt1nbgBG1vZh86LldDvfO4IhprgcOtG0HHxDNGo4AZiQHJhgLj7EKK1xs9khskRrcmqHC+4/l62SUeafR3z+zkeFFuY8H2uPf8ZRH0ynIIVEoiA328pqK8P2BC5xrpU84oMRQto0yM+Nt/Ig5O5UmN9v0/l5+pCiRVvm+WKVNagKPr3L+zIeQZdAoDMvLiq1wQKvtZEl2NCiFQnHt3aQewYZroOesV0hb2LFf16bnsgGJyrnOyjtR4UPZr0m/J2pzuI1wmWmqN5ryZlUjzUi5VRwWjYPRMmdG9b906/+dHKANWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2IEFx7lb3L0njPu7B1u7iI7YrMg8UIeTKMQ7itbG6s=;
 b=YFJYK5XAx7TKVAVfM+R4fBWsKyQEhDSUZl3wyjJ2kQnLBhN5WqZuCChoYtr/GzTGhd0n10PjQe0cmQBZKia+e3GmHXy2GPEW6fep8uN2Id0v/5OjIsHeISSlGVJRUUcnJn/vnjfSOAH21i51qYWXdDg6xXcYEU2zJvcDhgKzKz+CHvfwCcRyuq+0Jlhtq+IzmY4fepLYbYw1wXkqpfXmCaxYrOj0s8tShiFxHVUhOoKfYd9u05XvfYRspIazJi9qardcTJ/g3H6NgAYcd5cfOiyZ/+1+pmQe7Q5OIkEVOIXl0yR8C5v4KUgc9K53CnsKLi/5NBksALPiupjnvVHuww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9713.eurprd04.prod.outlook.com (2603:10a6:20b:4f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 02:48:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 02:48:20 +0000
Date: Wed, 9 Jul 2025 22:48:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode
 nodes
Message-ID: <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521173444.310641-2-Frank.Li@nxp.com>
X-ClientProxiedBy: AS4P189CA0045.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9713:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a155aa-6989-4eeb-97b9-08ddbf5c3b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hJHFFX+qR1/nFFTOnKs8cA360Wdr1foGgRqjPkJI6dXLT+IiGzOcGA0WvhDV?=
 =?us-ascii?Q?keWlsyurDtkXaHaelR4gYDgGtHhF2oaXVtmi6wPGEFh+wZM0jx+3NF9CzPIw?=
 =?us-ascii?Q?AXNNmCxr8Y3y8ntghNae2LxzJK5YeGknow0htU2ukAsW65QwiU2EmlF4kUEP?=
 =?us-ascii?Q?WpyZuk5yN6146pWyyLvjEj+bosZddYhk3n/F6GV3jDXdSv4Le7x6xQipuX4s?=
 =?us-ascii?Q?y9S7ZmMJMS6MBl8ixH97/MTTtIB36plynK4+FnbQs/JDpSdLtVjLqo2ZQ45E?=
 =?us-ascii?Q?UFAMXY9sPkboZL5F4nV+Ri7h04CkLOp7jg0lY7e0p/KXezUSXCPTxx8cbhL4?=
 =?us-ascii?Q?4vUoyb2stZJ3TWwDPDmzL6t9RcZHOlVrSlfrz9OmCG2Z/tKFcE/0IR33I7mC?=
 =?us-ascii?Q?ed1KgO/gku0+IlqrtVlvD2oTiAF7MJeeQjXnfZicdMabA9hXPvoVRpO7ThJS?=
 =?us-ascii?Q?M/aPRFyAd4YTX4jjxxHnJPDvNwg6BKn09n0HtDY8qZDslM9fyF9PnYiiIfUj?=
 =?us-ascii?Q?/c8lvqXy+ZKBewx2LPZLhalQGfuwgfYqhtof724d+su/kZiDUdMkztazzc8n?=
 =?us-ascii?Q?/Kmqw3rc8BEq+L9pqJwjPKeWKzYr/sKuFSmhvnIJCX1c95RqFMpv0Hvv/oIj?=
 =?us-ascii?Q?qkIKxpZHYs2MADz0QB1ZG/UljqLGj25GUdA+c6vLN1+wAtXxKRWuU1zRyQML?=
 =?us-ascii?Q?03B2i+usin2uHC3RQcgdj2A1wl3/AO3Iu3ZY8zWbxQjCq8JeZ7kv8Jyo0wrB?=
 =?us-ascii?Q?cJeMr4nZmeWeSq+DdinDdS+eowXa+RfY0mPkEE2SM9cYSB7r1NPxcx9k8lho?=
 =?us-ascii?Q?MahysJHbpNCKoNiyFvtSg139d4l8HndH+QzsVtwhSmRz6uZwB0x7bn5UwCnS?=
 =?us-ascii?Q?SJHocBl6pw8zvtFPSm+F7/R0hdaUe4tqodu8eVH7y6oOGUfmvkxDpOstmvGd?=
 =?us-ascii?Q?6uPbjOC4II3pcKoEgEVdMBKtnHj5/TevWTVNkxnZfyYm59F22AE1l2znDVXZ?=
 =?us-ascii?Q?KAPByXVU/9Q86VhBfVXqeSVEv4DUzLHEn9fwllJlHIhg/nPC5j8etuLzUoZr?=
 =?us-ascii?Q?VnBLwztAf7wHFBAf9l0WAUcfqOPzZUguu3EvBF88lQpeR8IxaJPAxaQkQFq8?=
 =?us-ascii?Q?hMufG7Rwxi9rjfrTaFP58cxKJVHnolYQ1dOWfsgHwfR1IdOpE5ce3gep0SWg?=
 =?us-ascii?Q?uZE79i+2j7aOwMcmzWxcCEoKbeNcX1XmIWKndLZRGeRKfua6PmkWVO8RNrAt?=
 =?us-ascii?Q?3wrabUmCjkELfxt7m2Av+dGG84GbjfgZPLL+D4aykwmZFZ0MQmQfZjzkcrRL?=
 =?us-ascii?Q?Sy8WPBBra5/mXCcgJVnbudcL82gwaihICKmFMllcyYQFB3SwM7CkpEbZLfTE?=
 =?us-ascii?Q?3jJUwNWryvPsMA99ss2g171hmjjIBkr7NZ+jL+m/Q2rxN7p/welae/uf73n3?=
 =?us-ascii?Q?E6GqxMhVL3Q3NeGT+5NPlHxlAnhypgQXGbszB3TRUzeD6rZRyLedeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ErjEYqja3w3nuqLiGCtK6nBAIfhnxQBNtE3xkDnvBPhmZe3qsYgLUm9FRQQ/?=
 =?us-ascii?Q?H/v88spq2fIMMEd6kFG/zhax1JWNNAJmk6Ha88LGEe5l8FRIL/TSwS0GxQOq?=
 =?us-ascii?Q?vVGJV9w5tSpoMMdRjskV6bm3+AuPm4k6X0DNrXhiyeoqigQlm6dKaTRlJLuh?=
 =?us-ascii?Q?H8pZKynRI63JZ3XOJRE6jL3Jq/E+vX8vuCDUSnZ06HCUT+WeioFtz6J/Ru7p?=
 =?us-ascii?Q?Jw6toru3fq0H0G50z+7jJuw0OI8RPYKd+jak23HNRSNWuNDpKq9c2mR2+3eq?=
 =?us-ascii?Q?moad/jyL/UgsYR2WoI1KhANyi8IPUdxHIBpORDgC4wiH583pIpxWjqRTLXyA?=
 =?us-ascii?Q?rMTRywmkXFcy5oBytgYppKWT1RqCMoABSqwo1FxqAK9XOuPFXkerWv/J5uBJ?=
 =?us-ascii?Q?LzbAdc9KHqhSugOXLR0jh5+eW1bUcwUOhLsJ9UNcT/Son6Le9qM/XbAhWpHn?=
 =?us-ascii?Q?iq2vb8gVHlGIbJ7WW9o5cOcHzQyoYxPnjeP/PALtx0Atjahp7WdwdvNdroId?=
 =?us-ascii?Q?TGum8hwK72XmZ1oVJXPnRDCg/46s7/KU5gP9dDcYYF5d0wXZKje5XicYLQZZ?=
 =?us-ascii?Q?yHHWVe9TpaSVVCAHnqAosj6iQp5m/nfDCv/8chxxIOU2wQj4khVaxt9zBEff?=
 =?us-ascii?Q?mIHe9uEhZJWiWpPyvZKuAN6hJk6+x2pRiKzNC0ED58CQrpNkiF3CqcYgBqzL?=
 =?us-ascii?Q?uDcORQW/U1dxDkUCdQUl7Cp3up/udHvc5OYbS+/bCiRsDKEqWx78O6eZ2Pbf?=
 =?us-ascii?Q?YfFVcYyOxVog2j5xNfgHf3vRMqGXm66voUfo9TOriofdiZTxj2w/azALuSCy?=
 =?us-ascii?Q?WZiCPsM+kElOLO9n3fnteew2kK7DvzB0p1uqxVUE0JWbtZBXcuUHp2liQ0VW?=
 =?us-ascii?Q?xwdukR5W0bjdMRlu63zjFgQ8w2vbqv/Br8+hubOQRetr0ts9fCRCurlHMfh5?=
 =?us-ascii?Q?v0Qj0v45g+09rPv7GWL2XkETYxyQYGlosIi70Ad+ERvHhZjgrwKEhsZEwXBI?=
 =?us-ascii?Q?XyLPHGQD6ZmoMzr+TidYkOBLEjNffxQN8cgWsQ7J+tovYtC6KHRMALX0jrIm?=
 =?us-ascii?Q?DHuHniKrpvRgFFO3CMbYAn7SUtdMcp4wPBIhv4xeebRMnW86wpI0uecgLu7P?=
 =?us-ascii?Q?8L0BK7e8gIUxb83vIfv3lpu3+w1Msc8UM5A7ixves4B4TaanERmmqUWt5Pjg?=
 =?us-ascii?Q?RSRlu1KNSGIwQ60uzY2SZxM2Ov+D6OCglTBR7e1dFxBZqxkCPrY9f5bp1kU3?=
 =?us-ascii?Q?IkMGU3OUmIF6aiJlVR/ocYgG7o2jsMUTsVh47D7p6wWWHYt1ABRbtp2vtBvt?=
 =?us-ascii?Q?dHEHYxVF5HDugZyHjvROQA7Ik9BmimReMmvxyfTLIZjBboiHeO0wu5SQzJNP?=
 =?us-ascii?Q?qsXAhDZQA7VWLgTVXd5tRdMzwMk57/I5VbwT4vioR1HbCss223JGcTsQ4c3L?=
 =?us-ascii?Q?mDPHvhn8tGd+7F2VU/0CqDf9iTCD/xH90lFmUkld071pul06oNMfa4FD0pPE?=
 =?us-ascii?Q?Kl7Lh6EkBL2He85vv51p+OMF0KWl10D4rNIIp+evsP+Avix225BK0mqX52R1?=
 =?us-ascii?Q?CeUh7gNFFDWvhJXse1o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a155aa-6989-4eeb-97b9-08ddbf5c3b1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 02:48:20.8814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czaNB6iD1GG7vEVYC++O2gVp5UA89GqLlicQ/3U30F9b5GlJC38AXudsEEminv/xWQkvVI7TWyB8O2ZObZqFfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9713

On Wed, May 21, 2025 at 01:34:04PM -0400, Frank Li wrote:
> Add jpeg encode\decode and related nodes for i.MX95.

shawn:
	can you help check this?

Frank

>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 44 ++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 632631a291122..d38bbe8b16d7e 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright 2024 NXP
>   */
>
> +#include <dt-bindings/clock/nxp,imx95-clock.h>
>  #include <dt-bindings/dma/fsl-edma.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> @@ -1801,6 +1802,49 @@ pcie1_ep: pcie-ep@4c380000 {
>  			status = "disabled";
>  		};
>
> +		vpu_blk_ctrl: clock-controller@4c410000 {
> +			compatible = "nxp,imx95-vpu-csr", "syscon";
> +			reg = <0x0 0x4c410000 0x0 0x10000>;
> +			#clock-cells = <1>;
> +			clocks = <&scmi_clk IMX95_CLK_VPUAPB>;
> +			power-domains = <&scmi_devpd IMX95_PD_VPU>;
> +			assigned-clocks = <&scmi_clk IMX95_CLK_VPUAPB>,
> +					  <&scmi_clk IMX95_CLK_VPU>,
> +					  <&scmi_clk IMX95_CLK_VPUJPEG>;
> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>,
> +						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
> +						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
> +			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
> +		};
> +
> +		jpegdec: jpegdec@4c500000 {
> +			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
> +			reg = <0x0 0x4C500000 0x0 0x00050000>;
> +			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX95_CLK_VPU>,
> +				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
> +			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
> +			power-domains = <&scmi_devpd IMX95_PD_VPU>;
> +		};
> +
> +		jpegenc: jpegenc@4c550000 {
> +			compatible = "nxp,imx95-jpgenc", "nxp,imx8qxp-jpgenc";
> +			reg = <0x0 0x4C550000 0x0 0x00050000>;
> +			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX95_CLK_VPU>,
> +				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
> +			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
> +			power-domains = <&scmi_devpd IMX95_PD_VPU>;
> +		};
> +
>  		netcmix_blk_ctrl: syscon@4c810000 {
>  			compatible = "nxp,imx95-netcmix-blk-ctrl", "syscon";
>  			reg = <0x0 0x4c810000 0x0 0x8>;
> --
> 2.34.1
>

