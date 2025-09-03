Return-Path: <linux-media+bounces-41724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD6B42678
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 18:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930B83A63F1
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3092C0288;
	Wed,  3 Sep 2025 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QNc1W652"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E42BF005;
	Wed,  3 Sep 2025 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916218; cv=fail; b=BSHbyYi8R+IRPq55MbgsbqeYtyHWhARzmy1craPBmeGx+T5KJDt5JG1+vlkq+T3UIBamzOcVyVJKVX0bSQGL2vdV2IovqpwoEIlbLOLkSC+bs5rqKw8uVdCeX4S1ctP4OfJDDcbT3k1keTnpZmgn4L5d+DEgk98FOWveUDsTN2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916218; c=relaxed/simple;
	bh=2zYnQ7GqIcIynrJhdhScC8U8zfDtgOY6Kki6p3kHnNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nCs74s3FXsmt0p0Kej/1kRr05Tchvrr4HWkvQunG3opy42DSriKVgiauVz2NKX8CcXRByFztAXsbJ9I4iU5IFPYfpmcKAo8TuCquTh5yJdJ6gPxh32tjZcbS4jFZXop7cLpMRbz53Slvt5qlq4MFXVTz4IrTrRVAaZE7psq375M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QNc1W652; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5SjH1uPV3gCJgWf6VUNFAovMTarHCsCoNxhkPsirA1qjO1dYxnxI5MP+CEu+JoIuzzSaQwk5SpitOys4oSeUAQYU4/Ax4O+bVv9kN06TJS9Pnf5TefbqpghI2WarM0YKQss9JRu+YFee3BeJQ+goC78qEmebzMLMSfkvgTZUjavdRn3dChH9psMDvJqcy3FkNdVj9utBFkBxVfYWepnaVtJbf4XJeGoFAQsQumpUO8WCzrAlc2Pr74Z6Dpe+H2BY/swkN69vCiiYo7Ggkd1B3UxdaHJEVd8XpA58hPMtSuq4SXvcuPijQK4iYQYUcYqCKgNQkl5D2f5Jl6bTl2veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGAbVVoCB/myKVsFsCmZ/RXtZWg4XKET30Muzuywiqs=;
 b=KaIcREEvSQUW6lmokiaZllhGsTHSnheuHltNIHIMMRXcWIVqEOZ4lQxfHP8uDwUn20CH4LlEU4cJbKREEp+9c4zyBqD8WD83hP+0a1mjxQD7216j27xMFuZYDI0BIgoSiuOi9wuPUii4HTMyqsHdUwY98PBim6fRbXFlJCzY9F3UYTIRl7BRuZ+JSZ2ZNsAkGJp3qdfj3EpURhpAMk0diIY7EyOD/imz4AkP47qv1xPrH9+iUpKATb6xl4T3k57GMOLfjS1sjbjHzAU/Ujy7SDKMxeu93uJ+UPXhthWYFM7OcS2Oe2KsRuwpa5ndMpRhK2rVxFqHbc3ZI9LKGz2UQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGAbVVoCB/myKVsFsCmZ/RXtZWg4XKET30Muzuywiqs=;
 b=QNc1W6522g0e+AX573tnxfJMKo+zOkXM7CPmLWElhL5cslaBko+0Bs5PqFS0wCPP2hrZqX5MFfdh7kRpT1nkw1KyYjabHJ9c3YMh/6wHaQnb/JF5PaROV5op0gwuXfH58Pn/B8X7GkiMvPyVmjUoUpAFPSLHZa3p/VwuQ8Pl0Zr1KatGrg0Xo5cHupB5eibOzmqRnfDhB/xdYrxe/zSJ5mr8zzEePLEQb2Fb4Q6wA0U1zoHlHV0dK5UnwSvpZi2e5DHgf2XfwJDMuXDH7pfZoO63lSffMbHO7gfx9VsqD6oKRPEsQumZw2FD5POVfEf92/XpjoH98KGgzZyv7KoVIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU4PR04MB10483.eurprd04.prod.outlook.com (2603:10a6:10:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 16:16:53 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 16:16:52 +0000
Date: Wed, 3 Sep 2025 12:16:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aLhp6ui9b/OpOUyX@lizhi-Precision-Tower-5810>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
 <20250902123524.GK13448@pendragon.ideasonboard.com>
 <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
X-ClientProxiedBy: PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::13) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU4PR04MB10483:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dd9f8b-94c2-4cf9-96ed-08ddeb054b02
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|10070799003|7416014|1800799024|376014|52116014|19092799006|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Ea9awQaga6rVfgruFQMyuCu9Vr4drVASO44cz+lIkYY52TIOY0/5QWTOOVHF?=
 =?us-ascii?Q?cK0nmVpekPNNgYtfVniOI0bBc83skecgtFsdNU/rZLW3dcKZms5yiEBrQGl1?=
 =?us-ascii?Q?Z9ZsNa9ajzR9RQnBFrja+nrN9z3sSe9Q68h63VxUl9I9+NharNCXU+Yc3T2E?=
 =?us-ascii?Q?gOzyrSK0vjez8GK51dh7U9jFKnSNavNsMkU/L+RPxL/jDh2yD63itAVK5Qlb?=
 =?us-ascii?Q?F5oftA72vf/mr9GYkk/3ppEym28Me2aovVXur7BQTfJQZ5EZudZepEdaH7pQ?=
 =?us-ascii?Q?4/ZW1nrovgB2GpWruQb2JaEGZenuQfrH0D5mn9Q7zobTUqXkQxeuUX6eXPFU?=
 =?us-ascii?Q?En6lP3BHE0+smc+p2P8P/whAj56ftGluaZUrpPUboclHVbhoe+i5Jt3yA7gd?=
 =?us-ascii?Q?Uw4Vgf6r/h3hLFADtOTzlQz1mLssDZuYClaLTHnpHfrbbSG4xB+LnBM7f0RE?=
 =?us-ascii?Q?hypDTB5uJAGzvqnxHVY9kunzDq1+IcYQJK9q9RxETpm3BsoR8ZPpYFqEiz7M?=
 =?us-ascii?Q?BiZ2ZVx9p6HKinxwzv3MaqV0vXtJyoe4FgFIIWWFryaGbI90A6jKV+VK5cqg?=
 =?us-ascii?Q?cQJIF9h122GYNHwL0vOhrBbRyXBhjHoPIAEkK9JiK0dFmXQZp+wW4v5z51Mk?=
 =?us-ascii?Q?D9T2yesrMi6fgrY/QYetLViLBh1/FLQ7qySGTmOYN3C8of8ytmJ4dqYziJwF?=
 =?us-ascii?Q?vWk18ms12WoLFPvFYqBitCdUed6Gwj3gHGuTvxjiNjANHLu49OzRUZjg3EXI?=
 =?us-ascii?Q?HCC0keTxch0st9uSTNNm/629cCo9IpQQ01v2I83C5CFsIaApnU8orBOkQQI0?=
 =?us-ascii?Q?tICRv6vy/aqfbJ41heIO0WRVfjYo/fqvEB8V9SsDDEt3sCnl76lT2248ikjn?=
 =?us-ascii?Q?xIIEi+natrYDCibKje4XiUktZRf+JSGLYNvA5KKdMX5d0kZGCGp4NeKve7yM?=
 =?us-ascii?Q?cLrKIFXX8Ch78IjVS5wxB3Jhepsufj6Z1yyPlHDCvKbS1dUiumFWPHU9BiGJ?=
 =?us-ascii?Q?5meuKDtm6rWMtisVYDecSlu5K9OH3m3DnpZ5BD7KHCMCMhWgI/G3BaaUXGsu?=
 =?us-ascii?Q?HTSXOShAtB5T74a48lWImr/yBXMQA8vlM9OgS02OWHVFrkhbUv3D7+pyu28h?=
 =?us-ascii?Q?nwN3EMqtpPIHUwHX+1lp8IrWQvuB8JIRlxS2hktosCx9XvU36jNOuC+6RUhx?=
 =?us-ascii?Q?Eck40pGr3mp2Jdkcw4W1q6QQKL6K+g7MUtOh9SKYlN3FrVCHXCZ1udwEEIPU?=
 =?us-ascii?Q?o1Tt7DA9xVNhEg+E8GyP+8l6wesuTB8oMI5z2y2QdGxWfwhYAVfl2b0Vh9An?=
 =?us-ascii?Q?njwKxCWS0MLLzjEgTXxek1DQ5tOpS1fLfcPh+rEoXjvQaO/3bO0nZjOWpmkS?=
 =?us-ascii?Q?p9hE+Jw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(1800799024)(376014)(52116014)(19092799006)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WbYonPNLuGoErbKmB/VbifBv6szYstC8tlxj7//dYvtpm/mppacMWNan2jzn?=
 =?us-ascii?Q?ZvpoD/5G0AFROWvPDIcQ5wX/oFMbu5nm/ySfJ/wfiiXUcxsXsJ9Ocu0isGEh?=
 =?us-ascii?Q?h5G7Se32phO/pTY8NJnvRqDlz2jrqk+ZE047fwb1tZ0cbbv8a476AVGm3+nn?=
 =?us-ascii?Q?STujIfHR+vbxSKZW9Pf9Tkdn5DNVImrWDqJmJ+eahjygdNgkafGOmyHAfxVt?=
 =?us-ascii?Q?/pDn2e0uy/Hp04cy4MLBzDBxjBFYY7kOVmzi5YO/2G5429t5cbMRH15OhuwY?=
 =?us-ascii?Q?Aiqy7Wg4lQo3PqWtOzZFxf2URevPrVq3FNzpG4nXfCaWTv6IpW0goWe5ZIjM?=
 =?us-ascii?Q?wCOdqkMHO1kCWFWXnY8iwnQY71nR2axIyQXV8mT2A0J3frGzj2bnPUp+XRqw?=
 =?us-ascii?Q?uVKg4A4TUj0va1r5aoBU3napU0yVXysvvXCTZKL3sh2y8cYMQHg5zJcu7b52?=
 =?us-ascii?Q?mie3h3VYAlOAJF/itwd61nf2zZDXDK59Rb9ofMXQYsOmn73QWk7upraDnBBv?=
 =?us-ascii?Q?8F7UnRpCXMjGd69lAfEgcnL01LnCUMxMoUzxndz4bCBJjD3Zs5jx0/rJscOc?=
 =?us-ascii?Q?fz+WszU85RgFym7RVlYZXwyTLO2CHu/sMzRene+BZXL8GoeJ/BkAGCoSAeCp?=
 =?us-ascii?Q?h7NNwGCiHhR6sKc/ly0HpFLpduqytrBrAOKpmsVOcsF/5fP7xuXHD6LGkUQa?=
 =?us-ascii?Q?4Px4asu3LcSuWLWmChQnmIrKkUCB7oxz7UhsK9FtlvmPnlNCQayXzU7xg6kw?=
 =?us-ascii?Q?yHlDmouU4zNAsbc8I4HQhWwp9LmnMTwv5TIZtEsXoPLEN9ofc/WDMYvF5o+4?=
 =?us-ascii?Q?s9s/FjolwXFjUtcRSbbfj2d/Vhs9ZBC1UxZwfksfrkSw1zG2XSC2yX1/k4CW?=
 =?us-ascii?Q?q8bjh++iARlkgWrpFXO1IcKRw/irqA5rCaSsKVqaP+ko+4dFknhn0N+uuWjL?=
 =?us-ascii?Q?PT/0xNeihUg3TbfdyOjN30X2mKTMhgnnbwb5MudiJ4vK19otvo/ONOo7XClQ?=
 =?us-ascii?Q?56WXTCz1WHwfwq4++Axh41vPSZDmmjh14feXEI9BQ+KtAGKdFGjhXPu/OkZb?=
 =?us-ascii?Q?T4RUC72ZWBf923PgGZ/RKSOW9ts75LraZavLN+u48i1nijt3A55NFhpqKGXD?=
 =?us-ascii?Q?q1IYs4VCIuV2/L6PDWHVx78I4FMQKAY9Plb0TEj0Wg5UNkDo21uddfZkZb82?=
 =?us-ascii?Q?xxDC/beLpMzTTuWMOxwaKlbhO2QIJv99ZYRCWIfVDAH4y30H9sDeak13UHLj?=
 =?us-ascii?Q?XE8kVY+X+sAwdCpQsbs17NQfw2NaZPDFhxzYWkS+PH6mo9bOP9t9Eva+VOTG?=
 =?us-ascii?Q?HT1Soa5bn3rY7iiNFi8eeicafpZhFjDCi6sUrhID0eSJ/wGoPaJ2ae7bzATc?=
 =?us-ascii?Q?i3WW+WjgcbSdVDB+GyhkFSXq1aVUL6dyqsOJ5h6mNaxxVOBRloVJvLh/RJVp?=
 =?us-ascii?Q?S7WRRLOslJzLnkp8/PpfsVp9GBe0fC6kxl9koCVFM96pRYKiY0SBFUdeFRZs?=
 =?us-ascii?Q?YDamTTJFOsxmn6CCFdTJpdG77k8rVcDTkDlpRd2kz16c03bEaCyqgbYuF+yK?=
 =?us-ascii?Q?bPpCXlMqOWOBRbKzy/MxUDSb1duDlIc1Om5UAM6OuhV0UboEzNPzmy0UE29u?=
 =?us-ascii?Q?WC7ML0Zmbom9hZ/nthVmWvnvPMuvvEEVWKwYoGCkB8+E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dd9f8b-94c2-4cf9-96ed-08ddeb054b02
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 16:16:52.4669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k//nBjiq8zE0PAA6A8COrfKV50Oi9ey0IYR1B6TxRacmhc7np3zLxTiA+3ovv3OTntSzsL90OJ/xTRFyqP/v2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10483

On Tue, Sep 02, 2025 at 05:53:39PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 14:35, Laurent Pinchart wrote:
> > On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
> >> On 02/09/2025 10:35, Laurent Pinchart wrote:
> >>>>>>          compatible:
> >>>>>>            contains:
> >>>>>>              enum:
> >>>>>> -              - fsl,imx8qxp-mipi-csi2
> >>>>>> +              - fsl,imx8ulp-mipi-csi2
> >>>>>> +    then:
> >>>>>> +      properties:
> >>>>>> +        reg:
> >>>>>> +          minItems: 2
> >>>>>> +        resets:
> >>>>>> +          minItems: 2
> >>>>>> +          maxItems: 2
> >>>>>> +        clocks:
> >>>>>> +          minItems: 4
> >>>>>> +        clock-names:
> >>>>>> +          minItems: 4
> >>>>>
> >>>>> But according to this, the ULP version requires more clocks than the QXP
> >>>>> version.
> >>>>
> >>>> If only clock number difference, generally, it is still compatible and can
> >>>> be fallback, especialy driver use devm_bulk_clk_get_all().
> >>>
> >>> That's a driver-specific implementation decision, so I don't think it
> >>> should be taken into account to decide on compatibility.
> >>
> >> The clock inputs do not restrict compatibility. If Linux can use
> >> fallback to bind and operate properly, then it's a strong indication
> >> devices are compatible.
> >>
> >> Imagine exactly the same registers, so same programming interface, but
> >> one device takes one more clock which just needs to be enabled through
> >> its lifetime. Such devices are fully compatible, even though clock
> >> inputs differ.
> >
> > That's only the case if someone enables the clock, isn't it ? From a DT
> > binding point of view, how can we know that the extra clock will be
>
> We talk about software using the binding in this particular case. Can
> the software use fallback? Yes, it can.
>
> > enabled by a component separate from the driver (in this case by the
> > fact that the devm_bulk_clk_get_all() function gets all clocks) ?
>
> If you go that way, only 100% identical devices are compatible.
>
> >
> >> I also wanted to express exactly that case on my slides from OSSE -
> >> slide 28:
> >> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro
> >
> > Quoting that slide, you wrote
> >
> > "Two devices are compatible when the new device works with Linux drivers
> > bound via fallback (old) compatible".
> >
> > That is clearly the case here for the existing *Linux* driver. But what
> > if the driver called devm_bulkd_clk_get() with a device-specific list of
> > clocks ? Or what if the same DT bindings are used on an OS that has no
> > clk_get_all() equivalent ? This is my concern with declaring those two
> > devices as compatible: they may be from the point of view of the current
> > implementation of the corresponding Linux kernel driver, but DT bindings
> > are not Linux-specific.
>
> It seems you think of compatibility as new device is compatible with old
> kernel, e.g. one not requesting that clock. We don't talk about such case.
>
> >
> > Or do DT bindings assume that drivers have to always enable all clocks
> > declared in DT, even if they don't know what those clocks are ? That
> > seems error-prone, in quite a few cases drivers need to handle separate
> > clocks in a device-specific way, with for instance a particular
> > ordering, preventing them from using devm_bulk_clk_get_all(). If all
> > drivers are required to manage all clocks declared in DT, this would get
> > messy quite quickly.
> >
> I don't really want to dive into such specifics, because it is
> impossible to create a generic rule of out. We decide here about
> programming interface mostly. Can Linux use the one from fallback-device
> to properly operate the new one? Can the same driver bind to fallback
> and operate the new device?

So my understand is correct. we should use fallback string if driver can
work with it.

Frank

>
> If you enable clock by clock for whatever reason, e.g. very specific
> programming power up sequence, then answer would be: no, Linux cannot
> use fallback because handling clocks differ.
>
> Best regards,
> Krzysztof

