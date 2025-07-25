Return-Path: <linux-media+bounces-38478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D06B12107
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 17:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9044E2E73
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 15:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4282EE978;
	Fri, 25 Jul 2025 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LnwMyhsz"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1011A23ABBB;
	Fri, 25 Jul 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457925; cv=fail; b=Av4bHxcmhlRiSsyqky1rtaSWJJV5rDbJXl14wW7PIJ/W/bpo41/2Pr6hK8iYS4SaH1zUK4bAoOiGq/QGSVv4GHj6VKHMSjyQ5q2XcJplY1XCksVHd5BKTwIVJt6kzWmz/NkZuuU1Eh5SO78KFQTcEADcGfN/F0UpriVT6aOti0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457925; c=relaxed/simple;
	bh=hBBXFLWNHVPO77z97wt4NUQD2LRLvlMY3ehWeK3SY2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RQsrpvaMaV5mTgeppCF79v/3BXHKnzqSYDkwbvD992uDlIPqt/L2iaNtb1ZTE4aSHt9F9vhm/rjZio+OvC2dzuqhsMVlDBDBQ0GDJrLAeILX/LRNS5pZRAvP/nPCgbOoOIiZtcGMnNlJluVu6NzOOFdEakOXpEazgf5gTN3bYew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LnwMyhsz; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvkkEBGgPZny/hHjjGD32MxWfv8SrkcIx1Zc7q55kqrIwkld1+3cvFqoOarCht5rw5RdZIVF+6Sq0wnCbODuYLVwEg8j9S6wTpDoi99zGV9SyY/Y/joKxt3tHsZ6z+DlsL0g/HXIZLW1pb1HXgKBXVIgQLQloWAJmpIbifjTBGAzmSiS1MmT4L9nRD4fuLwnOcQJN9WltxbI1OfbalsjuFbTsfAaFK+uIo/erDRWbHrDXjqwPryRYxMO9tIJiDmVzrpkTTRhLRhESASuGgrnH0moO4bPyn867twwI6maRUiwY9+T0fC2jVxiEMnhDY8hte73rlxtaH5VfKmRFIN+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tffwFuBuwiNACFi+DFNKBu/FSc8NNY0p9Trxpd7Gli8=;
 b=clyjxwi6plBDU51iOROddeg1SgGneJp7QuEX1rsIx2fO7PEj4jvhLjBJ5OCqxPKmlXrZR7bLh7pgtd02vM1QNe2zlqgpIXkusiOLEySVzPiv4KGFpBB0A8jx5SncERWPRmJ/EPOi/s+u4lIEnTGLStH+n1zf2T7YWgfPgdvt70DVskIsNm+wMMPMJP0eyflaxIspbU8jAe8eLvKawXILnpIG4XXecD9o02H2rRzts2Winlk48RqDVGjLXoH2N70d08oaT51CAxmh2kxr5d1plZjQaPNkDb2yr/dNq9hOmmeoeaHMxgtm1pT5BdWOfWd/MI0XbFnMRr3L3AlUF036NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tffwFuBuwiNACFi+DFNKBu/FSc8NNY0p9Trxpd7Gli8=;
 b=LnwMyhszNV4Hjk7ZRuSZYZIGwDuCU4tXfRFcCb34TZ3PEo3OeNn3RxDqcr7fwSiuxvuEkiX+ypfzAzka2AK6E0H34vBRCUK44XUA9klB1JsJcHufv919R7FXXTHgVRDDZVS43q0NNBxQf+iVA1wqJnykjkA8T3YTPhIMhKm40NQdNin5DvphuqgyLnh43s2Nzq5+JY7WQV5d2xdBxTFasvc/oPnj23onTeUUlySvmlbv6uFPkvXFfOpyx0QPZvjy0Ox4rDdhcdH1up/T7+w/tmX2hUHSKkETxpS58tXU0Xq6zFuJFP5G9U+0cAqjeUlFXZKMX2OnIGYqf2TrLeQWYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9523.eurprd04.prod.outlook.com (2603:10a6:10:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 15:38:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 15:38:39 +0000
Date: Fri, 25 Jul 2025 11:38:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v3 2/4] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Message-ID: <aIOk9W/RBKmS8uVQ@lizhi-Precision-Tower-5810>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-2-c8533e405df1@nxp.com>
 <20250725000404.GW11202@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725000404.GW11202@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: a449b6b6-cc56-4d89-71a8-08ddcb9153ca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?mFsdXBqP94b0D2i3YgcDwpO6ozDAyuc7mpYEbS4AwoHqj5OWu0DeP+QhGCyP?=
 =?us-ascii?Q?WgPAVZ6sAaOf8BmaobGd0BRzzJ2hhvLs1eaZw8pIc/85UE9C4cuXYzx+JUJZ?=
 =?us-ascii?Q?5h/AaLQ80F9l+8i2h9b4db3a0aMeid5v1LgKEegBRAFIMVULNesYRijVLt1m?=
 =?us-ascii?Q?MQEmFdSfUQI/Yot3Uf3u8g/wyYb5RB8sgkej2qi40YeUABETT65wzNrdG34V?=
 =?us-ascii?Q?DpdGsYJs7RrYM/38jdOG2x/+keFZNqJmVKtzJqIumq2obOsUnQsBOmPTOjJV?=
 =?us-ascii?Q?9Q32BHVVjc8/3E9CqmKmaK+PRRRrwC02AXy2sOVEJ5p4xD6sxB0+JGrpetoR?=
 =?us-ascii?Q?pJ6YUNJ1urZqQVIdTCJrdMIzvlVHhG4nKQRzflPawabxKw3lyTd9jZF0CbTJ?=
 =?us-ascii?Q?GSp51NZOdmBGLtBQS+p/Et2dg61MKthIMnQzNOmAHG61CgA8tPguwU8S/Baj?=
 =?us-ascii?Q?8h1XPtrV5DOlFw/Dy0e0HB0DQqmyjs25AtR3NQvT4FHWemXgf+kJ8pFgLvmD?=
 =?us-ascii?Q?FwqDAiDCQhCGnfxSgD+16AEY6/Be0UoF3FkvNFsTg/ChHl8uaSgY9KLxa6Jn?=
 =?us-ascii?Q?6eYZTGKaxCiAfTRVHCXlmRY8OXzQc2khuQh3SKpoCawbAdLn4LSlBhQMdTee?=
 =?us-ascii?Q?J4Rsc01OSnBkblP4pusXX89VcRTLb4RtGBJkWGro59uMgjWjOVL8JrYHJhIC?=
 =?us-ascii?Q?g9CTTVLWTs5S+VK5C9ViVJuVT3kOkCtKsv56OC1vqgeDAoWb7ufqnM1Nr/+n?=
 =?us-ascii?Q?ELxQEtC5dfaBj3P7YIZf0GxP3uKw7sYA3+JmYu8vrNd7n2RsLMLpQ0QYlrGc?=
 =?us-ascii?Q?LdDEl33dftrtFqE6i80qLAXChD9D0TeGqF/dH8ICEeQAUbsiZzrUVp3LU4Hu?=
 =?us-ascii?Q?BwlbgwgsWDeC0fxQaoc7TIpF4UA44lCPkXjGva6vuE92FvnxwZr6OZhDcQ5L?=
 =?us-ascii?Q?P+Pm6ctQ2bAiJfDbAQSRqGtCGJh27COnfmovzJAd8nbu7a6rcjOqdttK/+BY?=
 =?us-ascii?Q?31rgYfELdn3gCnRsF5HSs7fCDCe1iV+6ohmYwDj6rIlXu5Hmw82SZ/KMEuct?=
 =?us-ascii?Q?EIssKoBWhXHGfnnPwMoYECMMOkixgEhSaEucRjrV5QU6+i3acm9CG772wG8e?=
 =?us-ascii?Q?kqy3HvK136PdoaWi0Xf8gPSRtTILxVmlkIUD2xwh91KIJ3/mb2BkGX0FGjR1?=
 =?us-ascii?Q?nIdyX90WInKmK61NNR4Hcbx3wpWBq5vRD2l1rGPL7kz7EZF2vnOoLeamg7Oo?=
 =?us-ascii?Q?U+HNxMzNDO/MzQrTPN/nXDn2DJO7AZYAnU1DCc4ps0xtn8+Td4vPEjRRg5Ys?=
 =?us-ascii?Q?uR32BwbaVSpBXIBWo1MbNkE7oABPL/O6GvUM1oTkGdDpVGaq0/afYMjd8VHS?=
 =?us-ascii?Q?czZ5CqGEKp8Po/z1xdSM3cMImQywPYt1dUwuw9F9zVC62mfQfocWALWlcXza?=
 =?us-ascii?Q?Eh1IJ57GHLMM4xvS2eqzgJuyjgXaGxFHllkGxILZ9dhcKQAaWPbphQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Hc8stD6NGZfjQHiXGzaVu5dHVrPh1jmwKE2xsQh0ikdh41kf27SCiNQHux4O?=
 =?us-ascii?Q?IHeV+9mGQCu8GpKUY5DVM80aV89tjSnxpyO0oFCAjBCZs4E0Mg2cSgkkVffS?=
 =?us-ascii?Q?UT8xYJNBWCh8ohmADFvjuNIpYwZrdJlieB64vN8BwPneFR2uBOU70MzCNh1E?=
 =?us-ascii?Q?ZsgBF0IASNKHUlkJ1470nzNZnmCbzkpnb63fMsvRt88RrvNxhiulligt4/Yw?=
 =?us-ascii?Q?hg/AXyd1bkZ5LbG2+Ru8cfxrhJwBHYfl3QKWPPUon2OcHtP42d+4bLRyNAkY?=
 =?us-ascii?Q?6pJSpXKkJsxxJnx+KA1CLIdVOZkuC5IvOFkMm5Fq3jY1HQDJpyKDGEvW9KsH?=
 =?us-ascii?Q?gyqkW877OhaEO/Sw19tNHkIrOJkXMW/LvllB+O427yI/2buZW38D/Q49NkNl?=
 =?us-ascii?Q?6ukM7WCbwtyYQB+bk0kvgo6mWdjAYN2eZ3kBiU0ZSj+ANlTGkb+ufz7Rp0bX?=
 =?us-ascii?Q?dZkSkiOo9yTi18PLuZCzYILXyZ1ZRsVpqJSfa55SKGTedKcdkctmc/AnH8Nr?=
 =?us-ascii?Q?XYgstMlHOrDoqkscBe75gGaf2foJeca94CPL3esSvQJ6pujtyEx3zZvrfxoW?=
 =?us-ascii?Q?UpyJkTGEWlbQNygpJWmCPoy7P174uYtfdNkhEGMQkP+jd/ymgTgvILG4sKnW?=
 =?us-ascii?Q?0AWeNRm6wv0tpRJHU4UTQ9bmWG12C5saf4wErALlvLbjDejewufKeQjppU62?=
 =?us-ascii?Q?rU4VQxwzBp3bc1QYpYlT5lwaun7FW5nvnc1GpHaiM1UONnGyjCigoJlbsJhI?=
 =?us-ascii?Q?fK1nJ4J3PCtognZ2WZ2dnFlULnqryDYvzRkj1+Tci8vBxW+NTeKUjcklendr?=
 =?us-ascii?Q?mhHGBKtQm+eAEWlaNhZyvszKNtz7j1DybmDb9jRDLSoVi6xCKb1vU+G+2xLj?=
 =?us-ascii?Q?N+ECoFXuF02Io7rIvcljqag0O7bJK6L0+1h8BIZw5rMvMxkozHIYBEoeaimY?=
 =?us-ascii?Q?bbZ6E1fD+iRzre0MoPkZhBhSHyF97aKrIIpUvQ5EhV4sMZB8EVgEJPHJWAgT?=
 =?us-ascii?Q?v7ag6tKiCFknEF6rtxDIrjXZV4DMomzWTiq8WG+dOMzkwZY34BKhn7HgjFRs?=
 =?us-ascii?Q?r3TndDAmHj5SHvjylYrOB83yNa3kIdx8paTyqqylDkXCU+NNLOL3d7rOZO2a?=
 =?us-ascii?Q?yZiwLpVcvMzjRQ2NPyuhiPMjPu/jR9V45SjYNJXaHrJgjtYVTs4YeQO1Hj/u?=
 =?us-ascii?Q?O91dNG7PEJNElX4MUQitrrZdJtl7l7zHWzREdbzPTTGGjtqNO37NSfkbd31/?=
 =?us-ascii?Q?Z9/sLn4FQKurXpETsJotseKIDwaxewYL5KANuyijvLijEotby7pT6hwjdzEq?=
 =?us-ascii?Q?Ogw/0vC5tEns99euzqtnAcIPo2POQGgfe/GA05gGlyQJbeYA6pFC2UsZMflm?=
 =?us-ascii?Q?b3GzXQ8PIrHRsiemqqZ29dZzn5F9j0mx2LjaQyHt52UbUzTQT1Lu4/lAtntW?=
 =?us-ascii?Q?BAjXgLiDXjiZkSGnqVQajST7dRIrgY/R951PeC3ViDoMvfMr/XbYWwM9jdvN?=
 =?us-ascii?Q?AC4mgd5UZm5GaUmYd2jxAOhQ1IzQC9QQVarpzXfSqdAHRiZqdFwoZhHmvbNf?=
 =?us-ascii?Q?qYaqiq1+U3KkvOgJLRUElQoEcsTait2Pglbce99M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a449b6b6-cc56-4d89-71a8-08ddcb9153ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:38:39.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cou3gvipT//1YAs+OclNTL+6CpHtfH9XFl/4z+i0LFUTF5d4ssxYHFUxvWuhpHufevfMogi7Bw6EctivQmd/bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9523

On Fri, Jul 25, 2025 at 03:04:04AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Tue, Jul 08, 2025 at 01:48:43PM -0400, Frank Li via B4 Relay wrote:
> > From: Alice Yuan <alice.yuan@nxp.com>
> >
> > Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
> > i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
> > and enables image data capture through a parallel interface.
> >
> > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v3
> > - replace csi with cpi
> > - use __free(fwnode_handle) to simpilfy code
> > - remove imx91 driver data, which is the same as imx93
> >
> > change in v2
> > - remove MODULE_ALIAS
> > - use devm_pm_runtime_enable() and cleanup remove function
> > - change output format to 1x16. controller convert 2x8 to 1x16 format
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/media/platform/nxp/Kconfig            |  11 +
> >  drivers/media/platform/nxp/Makefile           |   1 +
> >  drivers/media/platform/nxp/imx-parallel-cpi.c | 920 ++++++++++++++++++++++++++
> >  4 files changed, 933 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303..14842a3b860a6f23846f12a684eedcbb9eb69e19 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15112,6 +15112,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> >  F:	drivers/media/platform/nxp/imx-mipi-csis.c
> > +F:	drivers/media/platform/nxp/imx-parallel-cpi.c
> >  F:	drivers/media/platform/nxp/imx7-media-csi.c
> >  F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> >
> > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> > index 40e3436669e213fdc5da70821dc0b420e1821f4f..504ae1c6494f331c16124a224421ac7acd433ba5 100644
> > --- a/drivers/media/platform/nxp/Kconfig
> > +++ b/drivers/media/platform/nxp/Kconfig
> > @@ -39,6 +39,17 @@ config VIDEO_IMX_MIPI_CSIS
> >  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> >  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> >
> > +config VIDEO_IMX_PARALLEL_CPI
> > +	tristate "NXP i.MX9/i.MX8 Parallel CPI Driver"
>
> I'd write it in numerical order, "i.MX8/i.MX9"
>
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	depends on VIDEO_DEV
> > +	select MEDIA_CONTROLLER
> > +	select V4L2_FWNODE
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	help
> > +	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
> > +	  on some iMX8 and iMX9 SoCs.
> > +
> >  source "drivers/media/platform/nxp/imx8-isi/Kconfig"
> >
> >  # mem2mem drivers
> > diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> > index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..5346919d2f1083b51ec99b66981c5d38b3df960c 100644
> > --- a/drivers/media/platform/nxp/Makefile
> > +++ b/drivers/media/platform/nxp/Makefile
> > @@ -7,5 +7,6 @@ obj-y += imx8-isi/
> >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> >  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> > +obj-$(CONFIG_VIDEO_IMX_PARALLEL_CPI) += imx-parallel-cpi.o
> >  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
> >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> > diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..718f02bf70c4d0ae74ecf842c1ecb1a1afbcdd45
> > --- /dev/null
> > +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> > @@ -0,0 +1,920 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * i.MX Parallel CPI receiver driver.
> > + *
> > + * Copyright 2019-2025 NXP
> > + *
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/debugfs.h>
>
> I don't think you use this.
>
> > +#include <linux/delay.h>
> > +#include <linux/errno.h>
> > +#include <linux/interrupt.h>
>
> I don't think you use this either.
>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/mfd/syscon.h>
>
> Alphabetical order please.
>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
>
> This doesn't seem needed.
>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/reset.h>
>
> Same here.
>
> > +#include <linux/spinlock.h>
>
> And here. Please verify all headers, drop the ones you don't need, and
> add any you may have forgotten. That includes the media/ headers.

Do you have good method to check it?

>
> > +
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mc.h>
> > +#include <media/v4l2-subdev.h>

...

> > +
> > +	/* Software Reset */
> > +	imx_cpi_sw_reset(pcpidev);
> > +
> > +	/* Config PL Data Type */
> > +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> > +	val |= IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);
>
> Don't you need to clear the field first ? Same everywhere else where
> applicable.

imx_cpi_sw_reset() clean all register.

Frank

>
> > +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> > +
> > +	/* Enable sync Force */
> > +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> > +	val |= (CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
> > +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);

....

> --
> Regards,
>
> Laurent Pinchart

