Return-Path: <linux-media+bounces-44750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868DBE42A3
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 17:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8FA15E469C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C9234572E;
	Thu, 16 Oct 2025 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mjcK6Ruw"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548323375BE
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627657; cv=fail; b=TF37xa/A8SCP8i/lW+PZScoyhmQ4hLMA7AJs5ppDHqnpEmJyQ3dq35NLsrd4XqyDpMTc9M3DF2e7raSOiYthvHGGHi2WavxzsUFS8n3jL/JNqpues9OrWHwxAgVRYGOcDXUWPkLbiq7CICAiWwfr6mgprw2UY7HeMkpeBa4LN4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627657; c=relaxed/simple;
	bh=wFECzprweeBoXU8whxxq5gV2TBM6liJVj5qfRzmBzIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nFDESTALBPv/W46jRxTKU/ZeG3W9XQ9g0ptODlrKkC2ZXRuQWuaFZV7WWXVyO6XNQkY4o6L1kYyZI8zb+f03qxu6TEusg9IxsDlRh1cUHIGOb+vJQT0ZZfKAn3Ia0sTC125hjL2ISlzYFRaVBtYoPNbZDGM/Y9bCDASWS6ETBPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mjcK6Ruw; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfLXtolNqX1WerFmoqXiRLqgF2HrWqtmcVnVcxT2P55/RCq2sa/iq1ci0zYcO3Ek8UQLkwD5NOyV+geF9xCgZTjwvbPOYmTtjSssBQCzCVssTuD9vDOn3/rXeyZe16j6jmdSsqDqS7gCWKRuPnWoGjkwfGwW2biYj3q4l9X67Flfq1UmDUSf3OD+W2g2C11tZbNJfXw9ZcflfY9imXGfATWqm2Jxjyo65EWnKc57zv/xH1v7C6nfbx+K7RvuhlhsNCx7dUM5XWvgkFdTZY+mREUblXU/JJRiq40AyhGYQxR8l/oTrd2pzuJY8DW3hqRkiZFTO4QanNPkAdUSo0gR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xZUtppHsT/cW3NlDOoDPlYSvxOdavUISY4Kguvbybo=;
 b=WqoTvMVqq6LUJlZSzcQNXADNR491BwP5Z0gJ/scvjBCkZxmObKQtICq/isKzsk8c8wF7/tGHNgOx2tVhICSI1/qGAIP5X8A0WFbwMM0abwz00rQQcDGpwaHsffFxfYCdI2QFLela2QMJ6yjIPg47YW/qGUikplOKVAiTL/QsptmRI+FCZR83gptgTr8vYhccsQIw8m96wSbjAJpu1Iv/tHqZNM52zduJ8Mp9FCQCWHEpqKGlVy2vbIUf1tpOD3fWV2NhfSrCYBk7bpc4VOuvHG7Cle0Mnaj5+yZd90Wzj0W2H+ZGEutUJSTSyFwrGPL+6NaPcroQTlMKBoQhiQwb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xZUtppHsT/cW3NlDOoDPlYSvxOdavUISY4Kguvbybo=;
 b=mjcK6Ruw6ha/+iiEk4JXimWBMcwLviZbAdImY46PH/rCuTzRze/gcPXOXJLok4QB6+F6djXil23Yb1y+DtNpkTSTDpI4sMoMXV1zukDaH9cORAc+uYzuhJItQZ8WGnTnR0jSijCfSSyGp52HLh6eWpoXr9P/Qjy32l0FpVS5VROqknXYAQDV82BI4fgMODywRTnLojrQXSQ1RjwH8IBTXmgc3ucrlXnLDhwEOliCQLbC41JSGtqsSPz3/1t4WeAIxW6vXPXCQtTTd6czrGZUdCoMUHkl+3cynbaaO053oUqonY/d4El8PCNEJOcIZwOweoUGOKFevhMdYqQrB04srg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAWPR04MB9960.eurprd04.prod.outlook.com (2603:10a6:102:38b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 15:14:11 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:14:11 +0000
Date: Thu, 16 Oct 2025 11:14:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: nxp,imx8-jpeg: Document
 optional SRAM support
Message-ID: <aPELu8y9jw2U8bp3@lizhi-Precision-Tower-5810>
References: <20251011183306.163564-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011183306.163564-1-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAWPR04MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 1915cddf-ac11-499b-14af-08de0cc6a923
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?QCNvrwPVg1gTXBz2KSOvNmox2qgTQ2EX5XcY4E0FHdly3kIGmFkjw4YQVoEJ?=
 =?us-ascii?Q?BNobUWNfqOlUrgaCdlRTxRQM9fu3nmh7KWQYMrHTX9rLL2I/MJFU9Xnpmq80?=
 =?us-ascii?Q?Efqf2h3Ti5PzPL5v3qNu65/bYs9tAzYiAGsSEFHKtaQCibKH0zmEdhzkHu55?=
 =?us-ascii?Q?gQjANVafVx5VfYdsIKMeb4Y1yffg1Nc05yPtfyC0D28+L23x51H6xhM4CRJj?=
 =?us-ascii?Q?grdlJrK2sJaJR1SbmXNt102Xy+ACTapnf/qMRrQuIFKZZz8oVOSljBKdUlxX?=
 =?us-ascii?Q?DA3Ywn9zQWwmb52kNjiv4kT4IrZ3SfIxwj7k6zYKo5McgbANXX6AqMntZSJ1?=
 =?us-ascii?Q?1wqoNpa2Dx8BVv+zljvon3dTSZoT2dFy+sf5kVnm5dwPvNWQvGCxDBFvRQef?=
 =?us-ascii?Q?I/paDNepGUOm28MhZ456HTWV9tVbhPJAQ7CV2wdbf9Cym0D5RvPdrXyWWg7p?=
 =?us-ascii?Q?D3NYHJkrWICUR2qpyDcFiMNhgEY0ddRYCij83Ou0b6z9bc88QzFJP725Qn2k?=
 =?us-ascii?Q?WC29PKyNUMUWYwkzdXOKgkHhJCV/qltNMFc1icUBd5Yt61p1TdR0YZFTv0JB?=
 =?us-ascii?Q?OTsQr8G3FtxZtfP012hqcblsoRcpqLeCDxECxHgyCySH+Zx5R6B3fQUYkxlr?=
 =?us-ascii?Q?CFfH/PClU6ReTTkVsFPjSTNQkitYaAuEhsCG65wxATrF+2po4L4Aa2oEc4Q1?=
 =?us-ascii?Q?IrRZ6kBav4BIn+iG/7wklBf8W6DU+LWSDz1TyiNJkz2agR24/2KZjHD47fkP?=
 =?us-ascii?Q?FXHNSmDc/sLOMCYTSs0PofS9rWTXNdBsdGA+gugJ58WT6OQbvWFafs7WpuVB?=
 =?us-ascii?Q?9Anz2QGIxtzWFNUYeBLyN7zer3e+WwbijIF/hID78mptRrWp2mbSGBduh/vN?=
 =?us-ascii?Q?0geIwVif3QejeIhNia+I0cKPz4PnzlGQy9XFoRY+bBXvm5DA0YQwmAGAxO+D?=
 =?us-ascii?Q?O3eBlm2P8M1FlXI1mtYBQ1f4ATz7XWfGaO3Sq+xUzCE72og5mYzWd5zfuhBx?=
 =?us-ascii?Q?mYpBnnVmMjlYEC1UNETRdmhZxknT3a8nH2+L+YA5oKAd2o874hlA8dtOB3Pe?=
 =?us-ascii?Q?rli/eaDPXzriRcvHn+BdpRXX+2i8SEi48fWEGGwKBcS/R9yXgqyCt9QKfh+I?=
 =?us-ascii?Q?YiseLyLdwbZAb9iI3kqCdJqipXTNLFT7rNFxkCJdFyPw9W/nNo1tTNu2wrXe?=
 =?us-ascii?Q?2RK0s1kyykTxLluFucvBu4hPzZBHfs6WeJRsbi1u5rsFH2PMtL5+ihVgBO4G?=
 =?us-ascii?Q?u+GjU2Y8KMP7knptNkNxnTAYuDAPSQqyoXx/fj+8hd1uNDLPbpeuh+UsLNqc?=
 =?us-ascii?Q?+LxfLvo5yI3OsEQHLtGB5Le7z+Rf90M7pa+cTFILcyhKp9BXsf1NUwTYLFxV?=
 =?us-ascii?Q?41VVdXmYNWo2ZziDM5aKR/GL8FN86I0yklrxSRBlmIUkxCEQ7wtMTk2dYBvn?=
 =?us-ascii?Q?48ugbgMFxhXzo59enO4tzRLBcFyXjEasFc4U1L8niZ7Vx/Z7MhHAJNLl3X36?=
 =?us-ascii?Q?3vGAW62Ciw6Gof6d8YdI40fhxcJTEgaPxn4E?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3/+N4s0pPwfs7AARCB1k53Sy6cg6iaOH3xPcDpOQvc1ak/PDjI5vcn9lNVZ4?=
 =?us-ascii?Q?Mz1avMK8udwFGkBKjMMZTTCRY07MnbOZsO8B7TwAqGl865p8+6a5gdRkIyNM?=
 =?us-ascii?Q?17owOs+9T4Pq4OS+lrk+cIqLcJrmxEuVXFwpCZ1tiJ5bRsuEG4iwIBaEs3NR?=
 =?us-ascii?Q?gfWJCF/vA2zLw6zwk1ffjFriO5AEUF9mUdTuKZxLrl9Cz9mZtn5YmpRit9wQ?=
 =?us-ascii?Q?676qvwsQ6CS8BJ7bgEwUzzI4SxUAOrKRZ7AiiT4Bxt3SGUAbPUh34+orXy7i?=
 =?us-ascii?Q?fr0cokgkZPt6f6jbMwpiYbX5RczPRZUo41i2UA3l8S2JdYgDAZlKoIL164VM?=
 =?us-ascii?Q?6WL8Q5VeH1DcU6GX/35HtQDiLhzR6cVIB/mYTVB2RazUxKkpaXayZ7lWZaLs?=
 =?us-ascii?Q?lOL9mM/Fz+rZ973cRfWE9sFcbZT2081oQ10NCw3jgu8AIokz1NrVFyINSE9R?=
 =?us-ascii?Q?kq4tWKNl+AOnBXR6B1u2hFHoxqtKJeQyMB0IjjMaHrryoPiGQklTiDLLT1IO?=
 =?us-ascii?Q?exp1FwrOb2SC8jP5Qh8aXb+Fw3+q1ZHZCXQEKLuE6bHErvVQedICKV8eFKVm?=
 =?us-ascii?Q?OgMQmG9Eg3c8u9eEi/R9qaD/XIyup98+jBNeVqjqL5/jSecFL5yfN93S3ju+?=
 =?us-ascii?Q?Yyf/8K/QXcvGL16EpYFzPLVOJBFJxHsyTX6/3xVahS2TkqFlvuCRLc9sfbCS?=
 =?us-ascii?Q?YZJJneL2cdScmQv+20FFAq8V5rZyDhShlBt+ygC3nbk+j+c/wIKfYGTJDn6Y?=
 =?us-ascii?Q?N6nfZ2JwzO9HmFeUEp9sjdC2BwyjJ8j03yJvCjuFWChDWp9gmWtzN5yOoqcL?=
 =?us-ascii?Q?aUqMKybat+QqKs1Np+s91WCpvLcINPMajSicSImqFpUtnDwxcqVN7aChhGQT?=
 =?us-ascii?Q?L43pJqQITB6f3i48xG8E2+GTqgx3YoAbRSmp1pcaL9Y4IhoPcl9yWBzj6AaF?=
 =?us-ascii?Q?dbDFn429hbot3JuSZ6HMeAg8x1hoJ970NPmx/ClshD+WPO5sBev+blAQTUB/?=
 =?us-ascii?Q?5ED40nIsjHiN+Ua/F9jrumLQXxcKohdZD920cHaDScVZ8nE2/32zhtgQICYh?=
 =?us-ascii?Q?fG9C0PzgyZnufAtrO29ww9jvbfGEcJIVH3eYYkVr8NXkaVFDizoJUH/S20ma?=
 =?us-ascii?Q?4v/9svDDP2Y2GrPNVusspSmq01kzBrOBfi2jI9eZ7nXUKwwCsSjOiCamUxsV?=
 =?us-ascii?Q?9CgIL5HsiCNjykuQkROWGD/6vPUHfz72D/1Gc8QNQkOmo5ERxZ/NJJGayX9c?=
 =?us-ascii?Q?N5H84t97RZ0/QYi7vF2Qy+3e9ZlJfycUse73HUEO2KeGWUZGgQFCwDgUs4+s?=
 =?us-ascii?Q?4Ucqn3TMfwDepYNHy+SuPe9VE/z/0gFeD/D0OBC0SKQTal3Gb5Nu6u10yvCA?=
 =?us-ascii?Q?6xhkfJDVEn2dyDWwXA2/lu60ijKnZ6C5CVx2iJElcyrmqQdD/vQW+ts71ve0?=
 =?us-ascii?Q?3AQ5yiZHf8TfFxaq3MiVCB9Z2jK/axLvob3OONOfQ0Iab+5lu8xfyuz54MpH?=
 =?us-ascii?Q?QbNJ05ud6JrYpUktPYIO7WWoEgqNPySUlqX6XZdG/OGuWa3RaDv7Qf5VQoAx?=
 =?us-ascii?Q?BxmTR25Knbgz6rVmT4aKfsZ0e7rZgAc9WDada4eN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1915cddf-ac11-499b-14af-08de0cc6a923
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:14:11.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44fR4q8AVaEoE+8j0eaBZFMoARrCfqa0OI7hSubeeYD6Ibmyk5ZAr/rzXwczcBSxJthsPxceAGUQ3n2V91qAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9960

On Sat, Oct 11, 2025 at 08:32:25PM +0200, Marek Vasut wrote:
> Document optional phandle to mmio-sram, which can describe an SRAM
> region used for descriptor storage instead of regular DRAM region.
> Use of SRAM instead of DRAM for descriptor storage may improve bus
> access pattern and performance.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Ming Qian <ming.qian@oss.nxp.com>
> Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
> V2: - New patch
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> index 4cba42ba7cf72..e3170647f44db 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> @@ -55,6 +55,12 @@ properties:
>      minItems: 1               # Wrapper and all slots
>      maxItems: 5               # Wrapper and 4 slots
>
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Needn't |

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
> +      be used for descriptor storage, which may improve bus utilization.
> +
>  required:
>    - compatible
>    - reg
> --
> 2.51.0
>

