Return-Path: <linux-media+bounces-40770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 744FCB31ADE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09BD8B6515D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1E33054F8;
	Fri, 22 Aug 2025 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nO9UJgj4"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A623054DE;
	Fri, 22 Aug 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871853; cv=fail; b=CRUjpbrqivPVT/AmSo1BHrbzE+s0/hobxTzLQdhtsC3kj9E6ht9DVsqR1mlpNR5IHihYwdNEv8aArQXu/tC8neQPS7vbLuYHPdGzVlb5NtJxmf1rse9RsFG5xSAFfjJxDOhAU7YWw0KayYZVRgoQzhSTMNtxG+By+CELgL01cQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871853; c=relaxed/simple;
	bh=nhHboQ1q/trUKgRm8GZJ+Y00dWhIAsZYXu8PPwJ3n30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o5hYbmTWkyI8M/N+ipxi+VXMNtFWFMJD7x55pzlp2tMVB8WCiMMh+6GEwn3bk5Cdzo2uQfksBu/xLHO9NbyUzpc+a7lkaRWbQqobK8CDDeIqKdWuEnc+qU288UxFp4DDYZTc0WKmIohcgdGyzP6tM0mGOHo6w9KEoJ7c7tBE9H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nO9UJgj4; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIWr0rJ8GCQWAo47gzRmFhoK6BW4f33EtFaQ/9MCx4UpFNy0oxGLwi7HwU4w1krnne16Oe8SX9lomgTMm2+4pwaLlgvoYmkAmkrgDdUZJKfvIB3tCnSqovGrX53DTB7Rn/1+uAquFn0Ho8nlAVjf3RmTnVp2EZmes1Rk03ouNyIUCPWJ869rjZrsOsl/qckfv3dfPQEvlSzOiCtcwjq4IzFixUPC7X/dU95xj4z5wahtBEv4L4yTPG4bDRpeYClBVxiqt8lhVCiu8LQ9Lj+mOj1XbrqqPNAZTItauk4nTlcQ7vsbXibcD93417fLquNllbR3cQuVDTPTCiRap40tJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW7WmMLmT/NE6gQVk4Ap5KDrKo2B8JVQ039X57gunxA=;
 b=Xt40E4B5A9kChINHF2nmiRYX3ecsDNd/VK7S2rp9FUAQ+damcvi3scqYquQtUDBZRWT1Vxl9j+JZFoqRylcID6RJqQijZYk018PtICOcqG/5L6CHg3D0JlNmEr5s+6oIGVg4KGiJHr5BL7g3sU5RdnpwlqMo62nDqosBgvweOhD1Om7BrrYrrA8wnSBZYwcbUBxicwVkMqDb6hZVzJIdRsBKjf3o8Nvb4Z7xbPLm8j5Yq0F4TLhvn+rdeU2JcWCJg9BRjuAPj+1Lj5lzyPgcudz0aCXZ74HFLSxTTIqOmfg30LFc+aCr/ip2kbNbJOTlZ0WWCvmsA145wdiahHUIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW7WmMLmT/NE6gQVk4Ap5KDrKo2B8JVQ039X57gunxA=;
 b=nO9UJgj4wdRacceIawAxwna4nQy0PqZ2Zba7wGiMglUBciKyaSzA6IeB5zLhi3B7MDRCrjNccTDh+GXKJOOK2oYo7n0kxQZwztfZXv10s3KqUir9Hr7ARJribRG8p7IiyMZnO2fdF9HFlOdzIzmALe3fbO1bKET4nes1efXrZQXiDSMixqRHljhMkVKs0DCJTRBT8zzJU2GxPNpo0e3GrauVqxCDXojK2S5T6uBRpfVwI8JTVZLrpFyaV4xqY51IMW/D/b3hhnFRNqEieN88MG06yXemenomCgr/UwjIX+wxBcblwJulR1R9Be2H2E7p6ODWdTlVGG+K9as552OnBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 14:10:48 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:10:48 +0000
Date: Fri, 22 Aug 2025 10:10:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 05/13] media: imx-mipi-csis: Rename register macros to
 match reference manual
Message-ID: <aKh6X2vLWT68rVAb@lizhi-Precision-Tower-5810>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822002734.23516-6-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BYAPR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1064e2d4-36ef-4a25-57d5-08dde185b166
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|19092799006|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?+TaJUTTjURaCGH9bIJVCOnpZIcy5ug/0QRhmShN1yRIx9URLSyr+c/lMMlNr?=
 =?us-ascii?Q?x+1sNIAA8PSm3/+oiGsdRmzzxOC4zIqt9ntWy8FXGbk5dvZnoUwdflmf/Cb6?=
 =?us-ascii?Q?UyHQdkOnqVBiXnkDMFQRdxbROkCWFeZa9eSrOEVq9b2bkGHtS+W8nMiBZqwx?=
 =?us-ascii?Q?U+IXUCaCCUgqeYYYf75h9VtYgGIUvYQZOkSK+y0IutcKv0V6nDMEkgG4FXZ8?=
 =?us-ascii?Q?1qeyP0mJMD2vUTHYfCBZWDietLRTRUDmbvBTiSsUru4equBSDiQXQV/fCVlV?=
 =?us-ascii?Q?KbWQV86XheHqiIFjuYQDeOv866iHuwuovpVkUO8ZAdeO3jMm3Q4iExgiZ7be?=
 =?us-ascii?Q?8nPM6WkaHYtiKNnrBF5/19TDHrEsByn2V9cQS2Zz9b+dt9Uy+eT6Q5oo2QK7?=
 =?us-ascii?Q?skywKRi3p/89vi14Gt+lNMXPnn6egPAqnwhA8XqWs0GCH9PVfk+Wtevuslin?=
 =?us-ascii?Q?oZMSYBXcqmt50ZpTQcWlFr+2NMKxzijbjYbBmcEOaIGpcT5LCHI6G8WG60vc?=
 =?us-ascii?Q?a7X7K2j5eQUmrzwPEeK0Ng4h16n/gI5V5YxYm0XFiPrhJ6BRxmaZz61nJmYK?=
 =?us-ascii?Q?/StGG+YR+pGvu/0fphfJlXIZZMzm3SKHkOB2r1KdaPbp3JUQrpx448IfNH4Y?=
 =?us-ascii?Q?Kw5fbY0pNozBvOqYu905/k0lX5qToTUWHXSr6t9gipAyCON7dwtded+CueLm?=
 =?us-ascii?Q?59KB3VxALH9fRCgYzbGBjCMPG3gshv80x1qkP6esaglcK6J+Dv5/9E0knvLj?=
 =?us-ascii?Q?Y687yttsccC50Wffndj63nShucPXGYQKVSXEdY40xxOPUhG/RZ/l7OEGTIMa?=
 =?us-ascii?Q?d9XeG8yuJlJZSSvGXo7PJyRXhSjiWOI+s7V3pXZ4iXBUkL/cE78bcjaZl0GB?=
 =?us-ascii?Q?sjSOq77TqRGBOjQLgP41gmS+UTEcyY/2fiv9rewRrnA1vommdAGom8ZDzg75?=
 =?us-ascii?Q?92hBpia6DqkHNXo3w/+Pms6V2qoD4eOrvqAUab67Ts5X4VJP+1W7s9gAuJLs?=
 =?us-ascii?Q?4llsvgBps8mH3fVxU9r6Q51V2jmIZmim9R60hayM8m3dB+pLp+ausSaknaZs?=
 =?us-ascii?Q?mPelREvkhmjwN+efC+HOpgpU2uWpkviSm7TX6rbWC/3wAR+ZQZn61EnpoAVP?=
 =?us-ascii?Q?rijDgE/yTo8UZPia18u7rra0G7RGLg4gMQs7sfo06SfzJlmhVLwBh/6Hf/0A?=
 =?us-ascii?Q?2osFLo3BaEsMTFRxKh5jAb4s1MOH037tLPoDkFLO8vUC5EyZuGHMdLX0o4si?=
 =?us-ascii?Q?TJxl57sRlFFk4S18H5XSs3PI6mXGzDk2m0MPC7iOOyUbnIm75qoJkNPx3tJH?=
 =?us-ascii?Q?zuYRpsAAmtNER/UxHs6qWkuAajnnjZfGMVwwM6DXkmqvpr/O3ZtOBWn6GCue?=
 =?us-ascii?Q?akgnfuMoXxuXbcttuqF8iLrhUkFXlD35FjNJKSCF2VBz65XEHTVJxsBpMCvX?=
 =?us-ascii?Q?XKFj673/+djciU8rT2V0BsyeGhFzcPBbnj87THATd4T0G+jm2h7nTQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6EusVjjgU1vvcfmPxvGWBxRgAr78+E6BzJHvaz5JIND4ucNzDEr4BP+U4AfO?=
 =?us-ascii?Q?qjWMEv5PmS0hMQzlFOjgDabp6b6Tl4P3jH1mv3beg2Tso695zaD672h3hpdO?=
 =?us-ascii?Q?Tbz2buSi0qcxIkexTO+yzpifhTpQe8bhMe/q0wLG7BzkYyVcBUZH42lESH1p?=
 =?us-ascii?Q?W7r842V3p91vWEzDenBVrBrSw77rrJtyp9IODSYQxiiZEX6U/Jequnx/36Da?=
 =?us-ascii?Q?CuwWUv2sJdybq9rnCIehgVoVFHyNFKLfXh3DHGYPVGxsyq3PBN4KfTHTgivt?=
 =?us-ascii?Q?xF7ShmqDqu24Vqe1wqqM2jD/7fF2NOuJCO2BkJimzK0MB3ly/Ahecd896dV8?=
 =?us-ascii?Q?BFT5Bqz1StN4rhCRxT4ehG7NbPv8TyWLhGvitkprVVoJclh3F1Bpz1rlVla/?=
 =?us-ascii?Q?As/LH7oT4ZSF52cWn7rFa0fJHgyS0IAjbIfRW6CoT1H2u7MRu9YS7tC45cts?=
 =?us-ascii?Q?h9VXcRd4euXEGT1K+w3qnUhuXYN1Mp+Z0s0LEjiG2HIsDsek9KA+8xurezIr?=
 =?us-ascii?Q?q4VHeILlcQNuUKgIRTjtaEQ87Dig2nZobaD4XX9dGXx9fQIKn56URZb4wXk/?=
 =?us-ascii?Q?qAWDt9av8P3iE+DHVi192KwIoJM4f2Q5wqlygSiPQBGtQiXkPUlzJMMAdUNd?=
 =?us-ascii?Q?TweVbSQ/TpPpbk21WjehBTwX2WDe9OCnraguv81jgKelNNcQK6fyy6xJh3B2?=
 =?us-ascii?Q?6sLgt5Qo4KIyUQf5ogXTYFJuFNrg/GeY+nkaCERj3gO4SEb4SNoka2r1kxMg?=
 =?us-ascii?Q?4nUXM+p2nIV+7rSgA/LGgUoe+kBczde5o4N/qSqDsEKn06dU+/pFhFh77Xgj?=
 =?us-ascii?Q?kPVYX33g/NFJS1zBqxIprb6ON3+aieB33+CVTMR1lqrABasqZb0/SB1eWXOq?=
 =?us-ascii?Q?YnFylTJcRYengERHqzDtXeQ0gEZFXAGWk+8A/v/HCCm148uIATADVAzkON/f?=
 =?us-ascii?Q?yQAviQfIw7Xg+ax2zhIBuuIwDX7Uy+4rqUb0g6MXLAZYVOi666LvRDzcO1PD?=
 =?us-ascii?Q?IIUgqfs3D2H0Gc+vrZKAeLLP54O1DSy1qlMy/wLUfd//BA2NgNCobYr1wMzx?=
 =?us-ascii?Q?T322D91aBQhUgZDcrMkvBDrs0Sp7PM0Qd65nFpb27xHdOTCuqg+vcnKNCXMt?=
 =?us-ascii?Q?HDJrTZaw5EQVV6BfpMpnYD66eM6Z+dvHJAe8H4TobnzydkRNTef5+4xaO3ky?=
 =?us-ascii?Q?gp0Ra9CJ8PtchObPGbIelaMbHzHv87N6IkICwpTNE+7jRXPvStWhekzH7dgv?=
 =?us-ascii?Q?R6tYkwUUPrZrH7pFKbYUIieFGvhDlxWIGMTpcbiE148tdleVoXIPmalvnepY?=
 =?us-ascii?Q?DQSh/GrquP72/P9BJe04UKUeAPF6Gw36BMiPUeIkvNt6UVu/knh+RsLl+B2+?=
 =?us-ascii?Q?/pryhkwYASMf0VMeXFuLofn82RJvpFPCp3AG7fADVZvs5j7FNboRtLdtPi2o?=
 =?us-ascii?Q?FS70FurRuUZ7v24WN/O5FAiQkcQL3ykzb3BnlbtCVXWgzBvRH5MIBqVb0Ay7?=
 =?us-ascii?Q?RNdj4ikAJ0yc+QkhV+f+S8xEGt4Hh5qRL+tPNmvr58wjE99ZWd4eoA07zPU7?=
 =?us-ascii?Q?KswvbSJoAspYAszEozDtfYY6/uc/Uu/4Uy7XKBRX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1064e2d4-36ef-4a25-57d5-08dde185b166
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:10:48.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A/IRa0DmDFmb8+dIgZxhVw4JadtUfBuAiZtGG7isIyE9n85T0RwKXkPQYl4JT4Ds5TfqVgZiabHlgjvYBBnSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993

On Fri, Aug 22, 2025 at 03:27:25AM +0300, Laurent Pinchart wrote:
> The CSIS driver uses register macro names that do not match the
> reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
> is integrated. Rename them to match the documentation, making the code
> easier to read alongside the reference manuals.
>
> One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
> which led to the corresponding event being logged as "Unknown Error".
> The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
> as "Unknown ID error". Update the event description accordingly.
>
> While at it, also replace a few *_OFFSET macros with parametric macros
> for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
> MIPI_CSIS_ISP_RESOL_HRESOL register field macros.
>
> No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
>
> - Drop MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE
> - Restore usage of BIT() for MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 68 +++++++++++-----------
>  1 file changed, 35 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 894d12fef519..ce889c436cb1 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -55,13 +55,12 @@
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL			0x04
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> -#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
> +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	BIT(10)
> +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
> +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
> -#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> -#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
> -
> -#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
> -#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
> +#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
> +#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
>
>  /* CSIS clock control */
>  #define MIPI_CSIS_CLK_CTRL			0x08
> @@ -87,7 +86,7 @@
>  #define MIPI_CSIS_INT_MSK_ERR_WRONG_CFG		BIT(3)
>  #define MIPI_CSIS_INT_MSK_ERR_ECC		BIT(2)
>  #define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
> -#define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
> +#define MIPI_CSIS_INT_MSK_ERR_ID		BIT(0)
>
>  /* CSIS Interrupt source */
>  #define MIPI_CSIS_INT_SRC			0x14
> @@ -107,7 +106,7 @@
>  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
>  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
>  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> -#define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
> +#define MIPI_CSIS_INT_SRC_ERR_ID		BIT(0)
>  #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
>
>  /* D-PHY status control */
> @@ -123,8 +122,8 @@
>  #define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
> -#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
> -#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
> +#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_CLK	BIT(6)
> +#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_DAT	BIT(5)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_CLK	BIT(0)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE		(0x1f << 0)
> @@ -179,21 +178,23 @@
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
> -#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
> -#define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
> -#define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
> -#define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
> +#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	(3 << 12)
> +#define MIPI_CSIS_ISPCFG_PARALLEL		BIT(11)
> +#define MIPI_CSIS_ISPCFG_DATAFORMAT(fmt)	((fmt) << 2)
> +#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	(0x3f << 2)
>
>  /* ISP Image Resolution register */
>  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> +#define MIPI_CSIS_ISP_RESOL_VRESOL(n)		((n) << 16)
> +#define MIPI_CSIS_ISP_RESOL_HRESOL(n)		((n) << 0)
>  #define CSIS_MAX_PIX_WIDTH			0xffff
>  #define CSIS_MAX_PIX_HEIGHT			0xffff
>
>  /* ISP SYNC register */
>  #define MIPI_CSIS_ISP_SYNC_CH(n)		(0x48 + (n) * 0x10)
> -#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET	18
> -#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
> -#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
> +#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(n)	((n) << 18)
> +#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(n)	((n) << 12)
> +#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(n)	((n) << 0)
>
>  /* ISP shadow registers */
>  #define MIPI_CSIS_SDW_CONFIG_CH(n)		(0x80 + (n) * 0x10)
> @@ -246,7 +247,7 @@ static const struct mipi_csis_event mipi_csis_events[] = {
>  	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_ID,		"Unknown ID Error" },
>  	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
>  	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
>  	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> @@ -517,7 +518,7 @@ static void mipi_csis_sw_reset(struct mipi_csis_device *csis)
>  	u32 val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> -			val | MIPI_CSIS_CMN_CTRL_RESET);
> +			val | MIPI_CSIS_CMN_CTRL_SW_RESET);
>  	usleep_range(10, 20);
>  }
>
> @@ -527,9 +528,9 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	if (on)
> -		val |= MIPI_CSIS_CMN_CTRL_ENABLE;
> +		val |= MIPI_CSIS_CMN_CTRL_CSI_EN;
>  	else
> -		val &= ~MIPI_CSIS_CMN_CTRL_ENABLE;
> +		val &= ~MIPI_CSIS_CMN_CTRL_CSI_EN;
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> @@ -549,8 +550,8 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>
>  	/* Color format */
>  	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
> -	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
> -		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
> +	val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK |
> +		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
>
>  	/*
>  	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
> @@ -568,12 +569,13 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  	if (csis_fmt->data_type == MIPI_CSI2_DT_YUV422_8B)
>  		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
>
> -	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
> +	val |= MIPI_CSIS_ISPCFG_DATAFORMAT(csis_fmt->data_type);
>  	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
>
>  	/* Pixel resolution */
> -	val = format->width | (format->height << 16);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0),
> +			MIPI_CSIS_ISP_RESOL_VRESOL(format->height) |
> +			MIPI_CSIS_ISP_RESOL_HRESOL(format->width));
>  }
>
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> @@ -633,10 +635,10 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	u32 val;
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> -	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> -	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> +	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK;
> +	val |= MIPI_CSIS_CMN_CTRL_LANE_NUMBER(lanes - 1);
>  	if (csis->info->version == MIPI_CSIS_V3_3)
> -		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> +		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
>
>  	__mipi_csis_set_format(csis, format, csis_fmt);
> @@ -645,10 +647,10 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
>  			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
>
> -	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
> -	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
> -	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0),
> +			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
> +			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
> +			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
>  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> --
> Regards,
>
> Laurent Pinchart
>

