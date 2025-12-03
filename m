Return-Path: <linux-media+bounces-48190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE79CA19C5
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 22:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98BB2301BE8B
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 21:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA75F2C11FE;
	Wed,  3 Dec 2025 21:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ItByLIDe"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641329AB1D;
	Wed,  3 Dec 2025 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764795699; cv=fail; b=p9QbD8wSX4UBpQeLkiU6sFW/J8K7fRz9JWvkLkDwvzAjG6J3O6OXUqZ1Gvs1gDVcj13qL9pojxkp/xTlY5ZO+YPoxYtbaHWziZoNlM0gFnZQCu5jgmdyVtMXWQs34imAtmi8VYh8ZRv3l2bL8FwUd8vTUzKTR8MWSfmKHpj13Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764795699; c=relaxed/simple;
	bh=XlBBaIsZx1r3ZNqa2vBjhO9Hx1QIpx4iKeGm8TgQ5qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X/mNcxKTzazjowHLsHIJITBu+bYpqDlkuu3mWZiHRBC1djiA+9rkrDDwFgI0Lr6LKS/GaeK6ge5HAN21FI/03jX1rheq3L9eYO1pkMViLF0YE1H1jF3TCzZhPiMhopi+GYuFP/bOLSngD7RT9E3iN9dAfNkN/2J8TSSQLOFOWGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ItByLIDe; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksccDQbR9K8LR0dxJ1pxCkm9s7Z9pxMeVpnpDrO4YjZsV+Cqj3jggvxAIkPpf26F4Mbec9LihVKIZE6qS5hbMgNRSsjXoUdrcuE9PplJajqopYIx/5G215QMVqv4Ilk+i+b7aatwtzqN/ZYRNSIWTafj86e7ddyrfZfueCpDqKpOl0xw87lmJjWlJp8kUyNdw2XFcwf2nCdNVTXawN9+lGPx/iyau3QeHXlIEM9GZt43CIV5XEDTp7ERv8nc3qaIV1d2npeD2wRGc/iUCURFQL5zpJqHkz/rQ8BJKGlVsCXCkQ4UXHAtTNl2WDEHc3UjfV7J9twzgmuLwwzEqnUkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qcO17Tkhwb3oaLB9IMR8+HTFDTCz1sKPrhtIEfTPY4=;
 b=BgUP2fO0HoagpRINmBU1khjW7+fXsktu7FM5iFoNjrEZqKUNSi3pN0gg0Ql8RF045e412L/BI+LfIUYlhnsgi4vogitfZ5TrYA7B7F4BIWfGgweobi8V3CTHQ9X4CKT5/HJEf6xhDhPodcJt8fhHSoOrDO90VVgfckR7nhP55yM88HsGK3EmQI8wiOiLkQL0RLSsAP/ofCeUdBHknc+cYxl/x5jv0ngIAhY1oFoKNhWuVDubMcS4Hi/8cyCwV2+2fYUR51IoDIq+lQOlClhcEJbIxuZ9SVmcbgxN0a30KpN/et4dWnrRSS/eyvb+7U921IHKpaeW8Mni8Euqbtk0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qcO17Tkhwb3oaLB9IMR8+HTFDTCz1sKPrhtIEfTPY4=;
 b=ItByLIDekaWp6PFEut0ElwKTUmQ71eTcaE0jcuJnuc7/jQ7z7xH28H7+wFV2b9KR2DrDE/UYaiykCMwjrrZvtwTu45QmJcroG0fGJWX8ZiCQbgRuJxBBCghXjKQdcO/d2l14lDuHXTQ++ftuO5di0A0itDnhNXJCM3sgMo/fGlEOHVU3B+DoyXreThhtR1FjgJY4TIdia1c6b0IHRt82ozqm8bTiLprFTVGfaK/Lz6gVtrUpiRqlrKeBx7U07oMrkkF+/4g5RDBsC0yFvii9gJEY096pIKOBi5JakqyHR5HWPiwbZxkRwIV6/XPniResIZxhcv0MmiOFaNSN2AiiZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI1PR04MB9954.eurprd04.prod.outlook.com (2603:10a6:800:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 21:01:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 21:01:30 +0000
Date: Wed, 3 Dec 2025 16:01:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
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
	Zhipeng Wang <zhipeng.wang_1@nxp.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Message-ID: <aTClH5RSpXpXfxXx@lizhi-Precision-Tower-5810>
References: <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
 <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
 <aQuDSROHLGHIhtlh@lizhi-Precision-Tower-5810>
 <20251105171928.GB6046@pendragon.ideasonboard.com>
 <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
 <DE1JMG95RZME.2YSV10RI9AME4@gmail.com>
 <aQzFiEOQvtZjHIsr@lizhi-Precision-Tower-5810>
 <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>
 <DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com>
X-ClientProxiedBy: BYAPR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:74::37) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI1PR04MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2a4a66-0c66-425f-d541-08de32af21dd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Jm0i73s1ROezt4Pf1LaLrCl8Dr2OJQ5YUfj9Q3I6ZAvUKphmzLfwydgkIOEm?=
 =?us-ascii?Q?BJdmpvribJ3YV2d4i+iLwTRjZ8mTyF0nH7sMOgRPP9b6y5zefwwKOD/jIYWE?=
 =?us-ascii?Q?jbcjnVlUswBt8Gkz+koWElfZTW5furKl08cpL2V6nJjsHyrIkPlzRtqASIch?=
 =?us-ascii?Q?vrABYbDVHlkfzMaGIkHxZEtj7cQAAJeNCakTk1pwOceVFoV9J9MjlsF71QWF?=
 =?us-ascii?Q?XhFJOCim9hSG7sDMTicTmJlU8fMZBKFmL+jpoV2FnEcjsXU4A0FO50M3zvp1?=
 =?us-ascii?Q?kCcmFIHqVu/JAl8FFC3+uy7FVJGmd17JM7/xpfnN95tkQJFj8sZs1G6Yrkd8?=
 =?us-ascii?Q?2JM8hGvNFPVEwm9eDNXEb9fisGJKGOCjIv6Lpml538jqMXSq6q9AK0L1+rvW?=
 =?us-ascii?Q?j9IMiWDhbQoiKPXEqq/FGLaSBI6WFhPtyIv5FuLEHq/QXF8PdKZuWqGr1uuE?=
 =?us-ascii?Q?0sRmCD+ZeYM7GkJvEIdjxBUzu7xxZ7Wj0iuqmQkvOXt8U98PmRsM1LmYn6w+?=
 =?us-ascii?Q?Oqfhwau1QJrk6UV6Pi+xFhkJ8nIiJfVkkyH5kBqR15X7zqj0UHHwBd3PrfB2?=
 =?us-ascii?Q?2xc0Sdl8myhlK4DsgR+jfED+BTW0xY3b3tsmFpE1kczVUkNI8kvQXo4qdeE6?=
 =?us-ascii?Q?wv3iKi1kd8uQoVaI+GpL3CS4N0lEkXyOqpPZR34eIm7OrKgZ+qe55G4Of5Tg?=
 =?us-ascii?Q?13zNsZwMjznDqw+zPdPHoPoFJmBJzyqublbn5xFOc9T+n7BesOkU2ZAiIbBf?=
 =?us-ascii?Q?sFaxn4EelR2CdVg9J1A32kEEg6RYvhgUI1xYKsmHW57/WGFATS9NyLNxiZL4?=
 =?us-ascii?Q?/yX06qOtbWASRGVqu7qinnjBZunQBwuY77Bic6Sw1brpYh9OgnEAGALNQZAc?=
 =?us-ascii?Q?D0x399DZGQrA3/fmmrEtdHgLKSI9ER6N2G5Ves6v5do0OTMTzojOHrEMVGFM?=
 =?us-ascii?Q?Z1WhLNp3MDXGHe5RHcmhm5IZSU9XMC7KaIK5oRWQlVAWZem7QHtIpk0elwr4?=
 =?us-ascii?Q?sNxOSJRYqRWov/VZMrij9P/mVuexKG6LLxLvmnCBeghXqQWoOmEAM9Prnh38?=
 =?us-ascii?Q?ozBxlgbawTr0N+KRcsbXEfE5nLD7cCuBCHZDHUlV6gGbii7iI7gn/WyVQatx?=
 =?us-ascii?Q?OArXx8eBM/+U51DsqlS4SXNJroDcYzAVUIlg81C/I/HhxXdLKEqq+R/AjTEz?=
 =?us-ascii?Q?+p1DOFU9xHgz1sWF7kbD0NovblU9b6CNrYJqyJx25k+pMuJ3B3YHEiTJmK1j?=
 =?us-ascii?Q?s9YcFy4E1FzCRYAC0C4XjGGil5jcv+YDDBM2K59g+l7vxvwi3zbGr5WOjLuL?=
 =?us-ascii?Q?h+hIAXCi40iFCC2UaFWAlaQdQeku/uRZ1uVmBtP5WpXlkELyAFtZszrfL3i8?=
 =?us-ascii?Q?jOvgBoKJZF+gXVN6NdNL2UWHCQy/vDw5V1gUBKMY4xtGmeq4TrVVc7O3KvmF?=
 =?us-ascii?Q?9Ef4ckniJe26u7gigIEVnfxMEA7Kbx5HFd05tg0LnHKPmeeEOqI/tqI2C35e?=
 =?us-ascii?Q?pLqmWilFrs63tIDCu03oeW9lpJxnooMSELA46k14CH0gimlg2+vagSTvzw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Bi4uLtUE0qna1uoFXDzPqcQVitgyhrr0bQLqilfeaOomdD1wk7OiUU15Fq5U?=
 =?us-ascii?Q?sw301u7Nx3WdOe2DIgpnTjMwHDpUtZSUACjCzM+nSVp3LKQm6zOZ+Inf9tft?=
 =?us-ascii?Q?uU8HabIw0NYRoFd1uCKBLo6/YDlddiPjo93PIJiS+fgZxnc9aBfE0XU/xFvd?=
 =?us-ascii?Q?vA6Sd6KPPyNvcN5aa+yFG/bqhibzfuAtety2fT/uKTquR9ss1t+sRgYv3k7W?=
 =?us-ascii?Q?S3GCU84HUI1nWCPoIT7/TsTS9hEaBSk34zMcsJN9vtDe4caJ+CZP2hZPiZb/?=
 =?us-ascii?Q?vwsKJ2SkjAvTbPQFQ5ygDrVv9EUS/UJw2qx6JOospzijYHAxo/Lr9dg9WTDa?=
 =?us-ascii?Q?zbm93zcOngX4VRP4TjGlxfa9Pm5ceUMNQxRRj7IEvX4PAn74krhiLEBOi1XB?=
 =?us-ascii?Q?znpIVpRCs7elJRbJXtdM8N3O5xCjSgK7ZpQzuGvVJFNXVDgzEMuDYRdgApgR?=
 =?us-ascii?Q?wFf8h89G/tu7gG6hOVKeQSSnsBvxQE9dD/42xwokJmQVEEvPEMDLBUq5BXUl?=
 =?us-ascii?Q?Dinveidd8Q2OxW5+MmYfYMQEC3bXGRr8RK2+SvHLx8dmwSsoDgiyfkbTj8Qm?=
 =?us-ascii?Q?30jk1aXZ+nu/+dcXQ2tPwk+vmcH0Lkyi6R7suaN7iv0LeZovP1vEQCtjZQzK?=
 =?us-ascii?Q?WhlOKX//2LQG06DfUk8hhskLyeErtCKkkjFcmFxyhGa8bGZp7QPILK7ZrCBe?=
 =?us-ascii?Q?GU20Nl0fgV/uK/fA5xzN4/xOOpEUdRLkTuRCrXDV43UJYk2FCf/XX6IGbDLc?=
 =?us-ascii?Q?Vx+yVgH53dgS7S4IoSaqjjBYZzeVVHNUoRy3zu9Npdey2MLGevNcaLA8JDnF?=
 =?us-ascii?Q?kt+KprkWW1znNdCPsW+ueeeSmbbwT6p2nScPlUddpGDLILy3ad4RoWbIKhqP?=
 =?us-ascii?Q?ajFb7+YDkmrUdlT018rahSM8tA4NwzWVCw++H22bdzekY+D25mqhUUN2gOTo?=
 =?us-ascii?Q?QCA+Al37B2AGq5fZEAbDMi7AwVjnq2z9gnHWq/F58i8oiQ8gi37QawsErVdq?=
 =?us-ascii?Q?LZcJLx2CG8AbWu7QOIcgVOCWo4TZzDIHEoIi+JLAJJP7lM+05NjL98S8tlri?=
 =?us-ascii?Q?SuV5hYmJRTzNhKPfEzlVK6++5Shnuice+EZatbv7LGu6TgsP2HUyXDDLu5Bd?=
 =?us-ascii?Q?miw+5vcMAzeDFs4G8y0usBvI57vWdNgeOUJjQ3k31TQSVE4oRqBwJ6d1td8M?=
 =?us-ascii?Q?MoIGYjNV7p3z0xph3FXN/y7o5iK3n7HibuJBx1HFSTZPhJr6P6OmxOQoAbBe?=
 =?us-ascii?Q?tzyDlMGumD9d5tV7lFA/1NJMaZ23rfp/yoNSbuTZyVETklWrmPhKYt5j8QIR?=
 =?us-ascii?Q?lAyCOHYrv9sfuL8+gzfcZup4TKFFxegRKCTKEznwx+Z66GqP6NYSphmiwnT4?=
 =?us-ascii?Q?8yYIGfcO6vcKkV31ZcA5k0UEV63HlTP3tPnIEu2MHHzt8QdxsjpuKSLNrPIt?=
 =?us-ascii?Q?4qZXGhDtLGPtPlNEdUdA5896t5S8n4xDnAhdzI3OSGCn9sfhS/FQiHMqPRda?=
 =?us-ascii?Q?Y1KNhO55i5cae0erwOj0sLvm/yxFogINWy2bihmBpapN4lGKqKpPnOJXE8xt?=
 =?us-ascii?Q?UkiB0Bs4EZBsyVRt8YrnLhSkPVbhBNGs6EpM08I/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2a4a66-0c66-425f-d541-08de32af21dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:01:30.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPukUfKVefYh6hdS5a3UANGuUb/qPbnk1290OsVu7SK+r/conCZaHzmCQ9IFwjLxUYBCfS7ZJb4hQEvPLSwnpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9954

On Wed, Dec 03, 2025 at 12:19:04PM +0000, Rui Miguel Silva wrote:
> Hey Frank,
> On Tue Dec 2, 2025 at 8:36 PM WET, Frank Li wrote:
>
> > On Thu, Nov 06, 2025 at 10:58:00AM -0500, Frank Li wrote:
> >> On Thu, Nov 06, 2025 at 10:34:48AM +0000, Rui Miguel Silva wrote:
> >> > On Wed Nov 5, 2025 at 7:31 PM WET, Frank Li wrote:
> >> >
> >> > > On Wed, Nov 05, 2025 at 07:19:28PM +0200, Laurent Pinchart wrote:
> >> > >> Hi Frank,
> >> > >>
> >> > >> On Wed, Nov 05, 2025 at 12:03:05PM -0500, Frank Li wrote:
> >> > >> > On Wed, Sep 03, 2025 at 09:56:29AM -0400, Frank Li wrote:
> >> > >> > > On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrote:
> >> > >> > > > On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
> >> > >> > > > > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> >> > >> > > > > > Hi Frank,
> >> > >> > > > > >
> >> > >> > > > > > Thank you for the patches.
> >> > >> > > > > >
> >> > >> > > > > > I've quite busy these days, and I don't believe I will have time to
> >> > >> > > > > > review this series before coming back from OSS Europe at the beginning
> >> > >> > > > > > of September. Let's see if anyone on CC could volunteer.
> >> > >> > > > >
> >> > >> > > > > Laurent Pincha
> >> > >> > > > > 	I hope you have good time at OSS.
> >> > >> > > > >
> >> > >> > > > > 	Do you have chance to review this patch?
> >> > >> > > >
> >> > >> > > > I'm going through my mail backlog, which is really big at the moment.
> >> > >> > >
> >> > >> > > Understand.
> >> > >> > >
> >> > >> > > > I'd like someone else to volunteer to review this series. It won't scale
> >> > >> > > > if I have to review all NXP media patches in my spare time :-/
> >> > >> > >
> >> > >> > > Yes, but none volunteer review this in passed months. Expecially key
> >> > >> > > reviewer. I am reviewing i3c patches. but Not familiar v4l system yet. It
> >> > >> > > need scalable solution. I can help filter some common and simple problem
> >> > >> > > from beginning.
> >> > >> >
> >> > >> > Laurent Pinchart:
> >> > >> >
> >> > >> > 	Do you have chance to check this serise? this one should be related simple.
> >> > >> > 	This one sent at 7/29. Still not any volunteer to review it.
> >> > >>
> >> > >> I'm afraid I won't have time to review this for the time being. My spare
> >> > >> time is already exhausted by all the other drivers I maintain upstream.
> >> > >>
> >> > >> > 	How do we move forward?
> >> > >>
> >> > >> I think this is a question for the subsystem maintainers. Hans, Mauro ?
> >> > >
> >> > > Mauro Carvalho Chehab and Hans Verkuil:
> >> > >
> >> > > 	Laurent provided great help about review and land i.MX related
> >> > > patches in past, who are quite famillar with i.MX chips. But he is quite
> >> > > busy. So the whole reviews cycles takes quite long time and offten cross
> >> > > some merge windows.
> >> > >
> >> > > 	In pull requests for 6.19:
> >> > > https://lore.kernel.org/all/4989c563-47f4-478c-80c4-41f7e98597e4@kernel.org/
> >> > > only 10 patches, and 4 patches is trivial clean up.
> >> > >
> >> > > 	In reviewing patch queue, there are
> >> > > 	1: media: nxp: imx8-isi: Add ISI support for i.MX95
> >> > > 	   https://lore.kernel.org/imx/20251105-isi_imx95-v3-0-3987533cca1c@nxp.com/T/#t
> >> > > 	   This one already review, but I am not sure if it capture 6.19 cycle because
> >> > > PULL-request already sent.
> >> > >
> >> > > 	2: Add MIPI CSI-2 support for i.MX8ULP
> >> > > 	   https://lore.kernel.org/imx/20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com/
> >> > >
> >> > > 	3: media: add imx93 mipi/controller csi support
> >> > > 	   https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
> >> > > 	   This one is quite big, but first 10 patches is simple trivial cleanup patches.
> >> > > 	   I post at 8/27, but get first feedback around 10/27, I am not
> >> > > 	   sure if missing somethings.
> >> > >
> >> > > 	4: This series, laurent already said no time review it.
> >> > >
> >> > > 	5: ap1302 sensor patches
> >> > >            https://lore.kernel.org/imx/20250811-ap1302-v4-0-80cc41b91662@nxp.com/
> >> > >            binding already ACK, most maintainer want to pick binding with
> >> > > 	   driver together, but not an feedback since 8/11.
> >> > >
> >> > > 	I jump into and help do some review.
> >> > >
> >> > > 	The questions is how to move forward pending patches, like [3], [4],
> >> > > [5]. How to keep good community channel to avoid long time pending?
> >> >
> >> > Sorry, but like Laurent I am really without spare cycles to go over the
> >> > patch series that have arrived in media (also I do not have any hw anymore).
> >> > So, Frank or maybe Laurent knows someone that would like to be add also as
> >> > maintainer of this drivers for me would be great, that would also help to
> >> > avoid such bottlenecks.
> >>
> >> If there are not other candidate, I can help maintain it although I am more
> >> familar with dt binding, i3c and dmaengine. I can start from simple patches
> >> and we have test team to help cover testing on the real hardware.
> >
> > Rui:
> > 	Any update? How to move forward? It was already passed more than 3
> > month!
>
> Sorry, I did not realise something was blocked because of me, specially imx8
> related. I thought you have sent the update to MAINTAINERS.

I just marked me as reviewer in prevous's patch.

>
> For me it is fine, it makes perfect sense since you have access to hardware
> and documentation, for you to be the maintainer and steer the features and
> improvements in the imx media. you can move me to Reviewer, since there are
> already other 2 persons (and Laurent already handle the pulls, thanks for that)
> much more active in the IMX media subsystem.

Laruent Pinchart:

	If I will remove common file change in patch
"media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()"

	Are you okay to pick up this patches? Or what's way to get it
merged? Or anyone else can pickup and send pull if you have not time.

Frank

>
> Thanks again and Cheers,
>     Rui

