Return-Path: <linux-media+bounces-45691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C713C0F6EA
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0125D4825A9
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B093314D0E;
	Mon, 27 Oct 2025 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K/l88JqT"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50538313546;
	Mon, 27 Oct 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583071; cv=fail; b=korficWbLuQF74XKms4XRPZeOF/i4pAe0iFCX16BjR/mGpfPhe7FwNzgqO5m+EouFhdlt7rkSFZzpFjldXyPAFQp6gP7f6s4z/Dqy67dVvplriokZj/61UL9hWtblnmi8PAQY06VzzPjmu/Mfd6w+LzCNkBFFDdWp15zij6S1W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583071; c=relaxed/simple;
	bh=3srIsHAyO+KZPbYzjJMQk8rWcocJJvoNd5RVTR0VcBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nIP8ytHZ5auj2SyZ7Avzd6q6Ap9fyg5PVi3cdrwMGb2NOllrkPEK0KfECUZz3qHiV+JCmrMloxNcXQ6jm2BQ8JbJPvMUCMle6StkVzvL1OWgspj27sLZAnqiEaUjDCWgjdvPU66oONrLjllKAJxOIN8LGgX97OVU8XWGrxIC+vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K/l88JqT; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH7HMQzKiOAdFgAu1M7+laSWIjlb37RPlVOePpjNkQRiMMOvSOytXbHj6j8UDbKs3hIf5CfyhYJUjP6radUSsj/DgV6nHgqwTlP1xFHiNuMQ3FSELdUIsFtV4mxJtg09TMQtAVR234+bVc3TBVbBmfu/akmANzVu3mEADkKQPiWi2leCQsd/FD7ZZ3ZOWBQX0gLJkIkLjrnVCsPHWOnv5FFBGgGKtU1RwvKFCJWb/mYw5Jnmbn3lnwx3rdXBcLN1tvePNTOfWs4f9kODG61+iJnHu468KUW73BsT/R6EnHbcQH0fkpW8b37Nx66WK6mLm3fd3vg0tEHME8Ee5KMiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZVqj13zf9rjeanEVKbBUp5jMM/9jeTt8chrpQDbxqY=;
 b=QE1v4A2XfAGAMgXkQiL6Q1Gb1bFW9YnXEtQHvKu33xwriqjpfPC+oS2WT9W8BYyDfgYVftQkS1yslREvrRNirlp+xjeoQMUF+UuMBKOtGc3vmxblkGtFtQEoAGOIQbfiGWQugZbWZ0EzGlnfC7gdjvH2OQ3lOX19A2d1frkJf5mjg35JAJBOB0yQPSciTRaXgLf9hUMyrYqX7P2Uevlv8MJZlCR+TKspgZuMOdtxIXwOWGs3mVQLFIe7dEA96zVm/gvCgRLTqcP54fu2N2D+WQSJg6uJGQJcexSudDPBSgal4DkqihcxfX4VD4GTjqfbHuApEHECAIw/XNXdq1wwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZVqj13zf9rjeanEVKbBUp5jMM/9jeTt8chrpQDbxqY=;
 b=K/l88JqTaqaVYE/oklQdlWVo//rkxSNP1FvcuoEooQdluwsXyHjkEjvGyIAWPa/+EpGVxL7W276Q70Ds/Wl4K+Gz4hmyLRtjWJDCgyWuJfKZpV/w0aLPbRoJr6aapJigy4hTflThKqq3I6KnDeSpKRUF/eHU25LkUyvlVA9RIJT4zBaGW3LTeWUgGJGJZe8A+epM0UOPGuCdsj0/iyuZJVZ+1c6a4tpbC53gvl04NZ+pDtzug/e1n3onZCOsHeWpWC9ZKPH2nYtFukJdkUQ2urqZg/2T/rkfndpPs3zFCuKIVpa78wsDXWL2BZD97bSP9KeB3FXbhkvyZy7Km6Wk/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8248.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:37:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:37:45 +0000
Date: Mon, 27 Oct 2025 12:37:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 17/31] media: synopsys: move imx6-mipi-csi2.c to
 synopsys/mipi-csi2.c
Message-ID: <aP+fztk12FK4IWYK@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-17-c9286fbb34b9@nxp.com>
 <aP83D-ndmlv5Jns8@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP83D-ndmlv5Jns8@valkosipuli.retiisi.eu>
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d8439f-7843-4ea4-785f-08de15772857
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?62gtCPB855U9mxWi0uFL8sv3M0vtyeoxX7gfQJibz+85jJ11xvdHQcp2OLZX?=
 =?us-ascii?Q?prLWVjFtEBs6sT78sdWnR8OZM0I2UrZSmIaTyWSOlCF8itDqZKZQvCjyLk8H?=
 =?us-ascii?Q?V2Oqm4grXos2MwGbjS6O5arWeaQAK8Adkxu1OFX4PdpR5f8LyaQXj8kRwhri?=
 =?us-ascii?Q?75/w3eaAHe3Yt3rnG5tnjDU1r/GOaDHkarP17bV1i8s2AD6vW3xnj2Ou75po?=
 =?us-ascii?Q?2ik2YOlkVWQdxSa2kI8avN/lS3fGPtmMcRrcpATYhhiHkSE4O4KVbBFIoEzp?=
 =?us-ascii?Q?iCBc0UHo3hy7gIb22X3sIO5wusrKPlZqLWyggN8DEu5mNZd9YUR+V/FyzM3/?=
 =?us-ascii?Q?LAlcP1zdxyv2d4n4XjZmhnKrynHzDVC4Zp3Q0JGbCOAnK4uOD9kBSgl0jGrS?=
 =?us-ascii?Q?Dye1kWzoC20AIp4Nh6DlZHQzF9NPz4u0HUg3TUtKbJiGhWiL1gK9Ca9DY4sq?=
 =?us-ascii?Q?rI6EyeSQOTQenRValfnmwtZFVdOg2Ev51LvkaUJUwTqXSguSw5R8pvrLGAsu?=
 =?us-ascii?Q?QoNBkYEbwKTvFgyQJ7oeUXJ8q70d7gHUQ+mKeLu0RSMA4UPz65N4xj1Cf8VO?=
 =?us-ascii?Q?Gb9sUtQH9Ekwzq8iIYr5yZaaX43gZ3fEIznkmFoB/C8X+tIJwAL14lzhdT+i?=
 =?us-ascii?Q?nk2nONIJAGO6tmyqhac1iTUrjBlOS356A5IeHjfxWiLOErA+zpU77iL8qbJ0?=
 =?us-ascii?Q?r0KnA6BRXs6l6+sFiMiC/HmHsFL0opF7B8wXFHDVfkLOESLm8w4iWBIG6E9K?=
 =?us-ascii?Q?5OlwqUuwaz3aK5P6784RJ6J5mGUN081sGfee27IhE/JQ5JTAxuKQluJTfG1s?=
 =?us-ascii?Q?4SDeyjQMEEXOlyDQI08roIz+T4/ACrgcBbfvd+NUPkjnlvRVLpHmyUcdqheP?=
 =?us-ascii?Q?U9l9LrZmPtcek/qZFu3cJ6nNPeNH3+1U77Ti/6I96VPjnA4X26JXAHtqIfJF?=
 =?us-ascii?Q?gu6JKNnsW4BE2+FGM2MaUiDFAibE1E0CQU5nk7CiAPDuSgAAqTtdogPDJOau?=
 =?us-ascii?Q?XSdr3F+P6VLIEotW5GbEmK4pmpMz84xEg4j0IDyQKMEGWDf29gq4nMrfverN?=
 =?us-ascii?Q?V87izuvC8ldJUH2+AxLQHiWsfSI6a076LgM7uLYvkSRRhgbq2QnMpCo3P7q+?=
 =?us-ascii?Q?BNv9bDN439aCpNreo0tBHAj5u9VAMJHSXbZjdMx8WYcEhKflhqmSxEAKGOZi?=
 =?us-ascii?Q?Bgv95OiS61EXoFGEc85s2cWbyVyOT+COtrrs8A0Qgc1XhO+1LNLFH1LrmIdR?=
 =?us-ascii?Q?STlrhzAtCZX92dK26zvnHvj2fKcw1sDMtYEdA6WSyaE4VeYpVYrEk/VlAkZz?=
 =?us-ascii?Q?lemIo7q4xmIn9XeGapmhswNJs9TFLaWZUuNbv4CaKpcSSZFCjs1SC3jZjVkX?=
 =?us-ascii?Q?7Eg+IT1Saek69IVwFv0qYIGHKGAEDqPX/fgV5stviQGwOnFdfo17Scfue3DM?=
 =?us-ascii?Q?Pb05NNMVjM5niBf0LCDolkkhYg4Iycu+EwVhT/UXjLZVLThebN9mM/fCcqol?=
 =?us-ascii?Q?649ymwnc+Bs5uwH5bv06Y03Zo3uDfu81O6sM?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7NgYE6YUL/xJhKSftIFReVNHyIxBR7syOVWe96yRf1cUnuRPLUfsO03mGssv?=
 =?us-ascii?Q?tZKC6uBcBCZyADkZqWdzCO7PRE9A9YR/+G7KrYENP6VILH0IyaEb6r0gGQ8M?=
 =?us-ascii?Q?mLlOsi3vBl/bhSmXXJnb2XAPr5zOOBjpoaem58JLRQfISTumIiP7amfxZ+5R?=
 =?us-ascii?Q?rSpKayl4uTNIPa5lnGQTqjh7WKL2b+4Fq9i4E/Jz8wyGCw4qkFSSco7+DJRw?=
 =?us-ascii?Q?VCKzqE/OGjmqU1Mp11AfZ8o2vyXUXq+J1kyMGR3QqnO0rHq2VmQO47/rR23X?=
 =?us-ascii?Q?btkGbbwY9Vza7/vPPcgqAr8QMS9iGiX8xTYdJxgo6sVxUxMqKn+a4NTLmuM1?=
 =?us-ascii?Q?0gGw3Om49dJVjlYbZalXSHqTXBTp/DKEA3sDgghvZJNQ2rlaSwtbw6UE49NK?=
 =?us-ascii?Q?qgQxO2MLp6jhfRhModcaCGCx1NoQpkLFC/jIa7SD/IgXjxO8EMLNyz/xjCdu?=
 =?us-ascii?Q?H785dpKXYtjBzVESQlL6XyMBDGZTEvwzDuB47ncH+/zZ7qirh9EHBUICtgNx?=
 =?us-ascii?Q?riqYX1if0pdkug++VHgH/alscC/WSeL2D8MswPtw2Rt1ACu9s0btytAER/2+?=
 =?us-ascii?Q?Q72Vc/q0BmhMgpJrTxWFJMTvJBDYLfCXIFB8CcOu9sI7W05SLcQmRyPLLe5M?=
 =?us-ascii?Q?fd2j+hLcFW3TQ/49c+leKtr/WqnpKtUVZp758qmVShy0Q18hdbQqVBwIlz/n?=
 =?us-ascii?Q?qaxUMaIkj62cNu9/KRo3VemhCL3jlpkhgChBbHX7J9OeCyq4CWy3d99GFbhj?=
 =?us-ascii?Q?bHKVLGzRp5laMsq5AHXWIxgt0RyPwWEkaa3ELV2IsVtOGAkR4y9Jn0893ddR?=
 =?us-ascii?Q?XC4Qa5lzDzrBznu1YzkfHJ1wWtaDCzTWLSjuVGp5he5IEnbz2qR4j5ehKcB4?=
 =?us-ascii?Q?J7J8vAm52yczLJUR/oaUirxyVGPR9o24grgCDGShgRc8yavYpQo4v2PKG4NI?=
 =?us-ascii?Q?x+ajESZeyG4cL0nvvvNdSZmRvJ8/0U9U4gldZnsTazwoFjyP8dZVEJU6dZFG?=
 =?us-ascii?Q?Wh2PXjXQwnzQx4+W3K5yl8uTJWhru3TEEa7H9jrYv5kqW45mRp+ihbSipikQ?=
 =?us-ascii?Q?ox2IAjg/DVyWkxTYxA7jONeT/hz3DGhh9CflrLv8FsCvvliS0J28Z+4fi4a9?=
 =?us-ascii?Q?HIs2FtE+c0NXXlO+RJgxiRpjSLH/WqRE4BxIzCe65u2CUJz4Lw6C3XtTuD7r?=
 =?us-ascii?Q?TFgv8AFYoaSpEqaj1WKQzme+8yrZbMSCC0cGsdNVUwiE4zAGrNK6IE06A6vt?=
 =?us-ascii?Q?hhIo29m4A+639D38Xq7pw3OnhHX5tgkouZ8ZJZCezgzMig/FSnCcj6VRcayh?=
 =?us-ascii?Q?fkGjF6BAd66SJLrsF3zz1fDLXdxpzEozh8TinK4NY9r21MqOkQGXlzW7tO6/?=
 =?us-ascii?Q?AfGXNiejTvacdz6ciJVYkbpCald9ntSPiXXo4xrDtkI+06GCJAtso2ol4waA?=
 =?us-ascii?Q?rPa47Otaeq30c2MHzqYOp51gTZL7Ie3TgroCAeSlX2nRaGvfdUrqRz5xVYjC?=
 =?us-ascii?Q?ohPMvqYIAn22hYSI97ReVzcXPVakR8QVWNOqxH5ivI477dcS+AO9ofgW+8mQ?=
 =?us-ascii?Q?QZXaVOgFeHV8ySIDubxacvVcwAzHBFVRw9O0DWJ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d8439f-7843-4ea4-785f-08de15772857
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:37:45.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NR7cin2a+GE5exN/GYm/eBdDt0+5dM0E36m9dQ+dUSu3UrQJovEfx7fxjdd1Rn1KQYhDyUXToXXctFXW5dYpYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8248

On Mon, Oct 27, 2025 at 11:10:39AM +0200, Sakari Ailus wrote:
> Hi Frank,
>
> On Thu, Aug 21, 2025 at 04:15:52PM -0400, Frank Li wrote:
> > Move dw MIPI CSI2 common part drivers/staging/media/imx/imx6-mipi-csi2.c
> > under synopsys to let more SoC can reuse it.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/media/platform/synopsys/Kconfig                      | 12 ++++++++++++
> >  drivers/media/platform/synopsys/Makefile                     |  2 ++
> >  .../imx6-mipi-csi2.c => media/platform/synopsys/mipi-csi2.c} |  0
> >  drivers/staging/media/imx/Kconfig                            |  1 +
> >  drivers/staging/media/imx/Makefile                           |  2 +-
> >  5 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> > index 4fd521f78425a96985fa3b6b017deef36631d1a9..e54dad835349d420dead6d5313c0623567c28c0b 100644
> > --- a/drivers/media/platform/synopsys/Kconfig
> > +++ b/drivers/media/platform/synopsys/Kconfig
> > @@ -1,3 +1,15 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > +config VIDEO_SYNOPSYS_MIPI_CSI2
> > +        tristate "Synopsys DesignWare MIPI CSI2 Receiver common library"
> > +        depends on VIDEO_DEV
> > +        select MEDIA_CONTROLLER
> > +        select VIDEO_V4L2_SUBDEV_API
> > +        select VIDEOBUF2_DMA_CONTIG
> > +        help
> > +          Common library for MIPI CSI2 Controller.
> > +
> > +          To compile this driver as a module, choose M here. The module
> > +          will be called synopsys_hdmirx
> > +
> >  source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> > diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
> > index 3b12c574dd67c072901108d88cad64ca3a723938..045ed3177738e6d28aa223804b79e6774e141dc8 100644
> > --- a/drivers/media/platform/synopsys/Makefile
> > +++ b/drivers/media/platform/synopsys/Makefile
> > @@ -1,2 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-y += hdmirx/
> > +
> > +obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o
>
> Please give the module a more specific name.

How about dw-mipi-csi2.o? but it is already under synopsys. Our spec only
show synopsys mipi csi2, and have not code naming for it.

Or mipi-csi2-v150.o (but it also supports more versions).

which one do you prefer?

Frank

>
> > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
> > similarity index 100%
> > rename from drivers/staging/media/imx/imx6-mipi-csi2.c
> > rename to drivers/media/platform/synopsys/mipi-csi2.c
> > diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> > index 1cd48028b6416ae16ed69c68186281b6c6bcbec8..53e5c1546ac53e4942974a9acdcf078de1cb6073 100644
> > --- a/drivers/staging/media/imx/Kconfig
> > +++ b/drivers/staging/media/imx/Kconfig
> > @@ -10,6 +10,7 @@ config VIDEO_IMX_MEDIA
> >  	select V4L2_MEM2MEM_DEV
> >  	select VIDEOBUF2_DMA_CONTIG
> >  	select VIDEO_V4L2_SUBDEV_API
> > +	select VIDEO_SYNOPSYS_MIPI_CSI2
> >  	help
> >  	  Say yes here to enable support for video4linux media controller
> >  	  drivers for the i.MX5/6 SOC.
> > diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> > index 064a6c6c069aa440c72a483080cbedf89d370193..1978b82fd1876566acbb952a4d14cf9aca35e996 100644
> > --- a/drivers/staging/media/imx/Makefile
> > +++ b/drivers/staging/media/imx/Makefile
> > @@ -11,4 +11,4 @@ imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
> >  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
> >  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
> >  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media-csi.o
> > -obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o imx6-csi2.o
> > +obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-csi2.o
> >
>
> --
> Regards,
>
> Sakari Ailus

