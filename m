Return-Path: <linux-media+bounces-50157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E41CFE6D3
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 244C930248A0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F303469E2;
	Wed,  7 Jan 2026 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SwS1iWOK"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A3337692;
	Wed,  7 Jan 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797186; cv=fail; b=aOVdOyM7RER/vpN9N/cxlaYCmG4CNDuuqjEzybN5OVKqEkGA5j/VrNGw8ehAf+ndnaKlgPBtUmM6L82ua5+H1ggAIJ32nd/dSJBdg5sbgAY70N3HxBmIkD4w5SaZclyTUhJ8wmFywdPOdYPPNchh34YZaD9J8uKLutDi32qI+KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797186; c=relaxed/simple;
	bh=SI6FrSicDGBG50T5jfD1EXkEUvcivk7YzgGLkAd9IF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tpUb6uag+68xeregvvyyJ99+s1xf3NKwJsoB2DZf7Zqz9kBkjK5z8S17dt47GEKoU5HBRi73yGJr5ncLz9yBw+7ekLOdg0U52DNH7S2aO0b4eWtLiv4B0uzqHb0ImUpHs0jH9uaenooSVepaxrzDCUwxAhcFQl71b0FQ4r5f4FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SwS1iWOK; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vn92ZKh2agNADNB0F+JG4cDfSxpcRRfow+QLldYkmCD0Uj+439vEB/5w9uXBhs5nelf6S6q7FXn/TmkxhzCRFRxO2DNfKX/UV/EhO6Ebwm/oieN1kkJZ9rCR40JtS6Q3tv9Nrjz6VGYirw4v6X46NCAUfqlbTbQi7fqcED6cxvS17OImcu6V3IN8Xgu308GmJUY4nDBPV2pHmRaAqS3fhfvz6aDLZ8Pdw7/GqWk7ODDF5O7ga1G0bwyTOCzJyIO58dluJXj+PRgQ84H1P3DU43kTlPpOyd0Tuol2l3xtyUYDQfhaZQ6t/r2MWdPjTkSbTLDBXB19cEAIyG1lZovJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQm7U1kx/ZUzfdC4T2bkmnBkO2UuUsqRlU0hwPRdcmw=;
 b=Ah0ScCGn68e01ixT3HOPQ3BWAvt99BU4P/uQ2K59t1DvSboUcglOFOwiIiDJkgLPmX5LyNfwMvKG6UHOhkvg6NEKgWH27DU71JssIhYG8gu+MLi9Rt7Wp+JhT9BxOsJw8mhW0u31vihyBlbE1EWGrO5NnWu8OBfjSZFkjg5ZlrRDPnvzgoC4UV5Ov1kNum/5PVDIpQPTGZmI8CjNavvDbD3F05s6b3WbtWRETKBF3Ajmfa0PWF4bwQn0g7Jc9cUyWDNj4bjdidAJJJkhJ0qGDmEyr82mft+xZDwu2ot25Mt7B/lKJgIMKhY6aX6GvXUQK5Qe2qeZDmua2I5ZeQL6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQm7U1kx/ZUzfdC4T2bkmnBkO2UuUsqRlU0hwPRdcmw=;
 b=SwS1iWOKqUhdszDO5jPwYEX+3i8zoTpIa3hhUNmMgKp3hf7UrBRaShq73AypDwhA7Rw0zlOJermMv2FdnmTPzma4jXyaaS9aNPtgy6aDYusYya57C1XydEc+teGuWhlApcge5Ren6SZvoeKIRFnlFmVJs9hntAKcGBBVeiIXVdP14rEUGX8iAehvn5X6eiI1lcYkxq6sEgZV9Ezgqb8TaEbG2D8P+hjY6yp+qmwih8+kfHR9W2giTedHlrnkNl3DsgnVI3FEP5N2vWTkA8LWShOwwCwetLMeXNCL8cCZNwMqJGxHUHXgxY3Qgb5u5awdmESlNQ7Hwj/ddqTTFpnQbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 14:46:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 14:46:19 +0000
Date: Wed, 7 Jan 2026 09:46:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: amphion: Use kmalloc instead of vmalloc
Message-ID: <aV5xshJ3ryfi36l5@lizhi-Precision-Tower-5810>
References: <20251222084912.747-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222084912.747-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 46796669-08d3-4c60-e3ba-08de4dfb84be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9xQJ7y3Cq2kfRuiLBYBpyGe2R4wTdXciVxasO07qzASdxrAujXvJyIQZPrzS?=
 =?us-ascii?Q?+1C8a+bemHIc4BRpBg2PgSjZH76f6/1ra07aAagjrNwpIa/UFoV+XB0jGnJT?=
 =?us-ascii?Q?kKxpbY4qSSj+H7Pcu9xE+ILYfh0Vdt3GCOa/r8/Llpeq7NB6BSdiI4ud9PgA?=
 =?us-ascii?Q?X7hduL61Kane6KVtrBY8PvjPEsAxR5iefCcTrKKhz0HsAiDVJJhfGZthMoSe?=
 =?us-ascii?Q?qO/FJw5nGNzaWv5R8SNGNmChHBsoiMD9WSYR4YqwvYCn1b5rhk6r4Cl2KMAO?=
 =?us-ascii?Q?zDyhQKeRa4/zkElaZW0Qge6YvhClvVDqNTfA5I0yAKTm78YqElBZGvduCidj?=
 =?us-ascii?Q?8E66Z1qOc2odD/RjX9eiahOeU3WYS1W9x6/HgfNlScSysCX+ON6SCjr21Ggu?=
 =?us-ascii?Q?uLRu/JhYFrk114Ck/kW1DTtGNMprbl7rqxah5tEWHRe7OWYiiarOnZEpCCJs?=
 =?us-ascii?Q?Rg5yI5CxFzAzUZesiCfbI2OUq8D0BFWBJAfuapC381LK5F3+5hMEKXlNV1JG?=
 =?us-ascii?Q?RfOxcPgX8UiWF7MPABPjoFc/bP6m0g0pTJc8kiWvp2DyTq9T/6yDgwQNIX0Y?=
 =?us-ascii?Q?PVRHkNH5v8SbC/nG3OA5DRR3OmJsFfWnkDRmu4UkC3bCi0Ks3WmAEl/crVbU?=
 =?us-ascii?Q?1CdwtpBRiG3JDKomXxb88qoq3xVpXU5v8/lWg1APt/mw7mur7ZKH98xkUNZP?=
 =?us-ascii?Q?dBCaQLFxSRpYwvcafOhQrGn/8GuaFs8drTLebmh1lYgDDEF63DiRVbLUqJrt?=
 =?us-ascii?Q?g89SD60l3+B6c//A3ZVYggd7AxfAi4b0iV45Gl60UMo+Gvs2ouyWN/HNKINQ?=
 =?us-ascii?Q?Hf+ggLUw7H8RHL8cso4nYp0vHfAWezeZm+yrEoSsJ28wU+qnvsz3OQFnRLe0?=
 =?us-ascii?Q?g4AY/BovK5Gg3gQZoDR6c8nVp1eJ0yie7Yha9Kp0ZfriNyVe4k4ar4qcyg87?=
 =?us-ascii?Q?gdolIfvlZnPa6lYtcfJGD9R3exbhLDd7Z7M12qd4XFUlkNpXzTKf1acPxZeJ?=
 =?us-ascii?Q?h6sdgMMPJ8ztGlSvUQ+bcUQLNOViN/0zxEZZu+nQspoi/gCkI7ZiLkbi5sgw?=
 =?us-ascii?Q?6K2FfJKcqyyY4vVDxfK5LG6/BP+H6pqnKiyB+4BNk4eOXCyM3Zw0za88UwLB?=
 =?us-ascii?Q?9pZSO/IFan1P9sqvlSg4wVuYk8jiZGbzyuQYS/i0ExksD/6fG19BIZEvK7Cp?=
 =?us-ascii?Q?poVD5KhZs5CeuRIq+CicxmntYE0X+nZW3cTiNgvYVUqTV2OV/cSFhsUDg901?=
 =?us-ascii?Q?MjE+XeBZdE3tuP/2+BYAg/UkxuwZAPl4w1yXqba1Uf+Q0BCK2YAA5wUkYnLT?=
 =?us-ascii?Q?xQtgO8LRVKxQR++MGNRumrG4Yl/f6bk5JirizCjJA4yntIy6f9ezAhlM0ss0?=
 =?us-ascii?Q?pQ5mOKKitDyMpZKckhgGWS7FHNLdszSza2fgjzkBlFvm7gakXzZfPvIaLuOf?=
 =?us-ascii?Q?3U27XR0O9cCRbUaONd87vXwGDOnt+gB/4jXsmUZPjbICj9owZ6tCvrqKs38u?=
 =?us-ascii?Q?H8i5puNxKvWMj8tbd5tOe+5wO5oWX9YchrD5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vyUmSL+JSRzng04MR7XGjh6M8ZqHfqO4/oh5kZTL450xDq8zWr90lP3Ia77j?=
 =?us-ascii?Q?1bpFFhzhbxt38yD7zSVsKaP3qMUOEGaR/QgXV5aYKyE4dF59NlQQX+WntgaI?=
 =?us-ascii?Q?DCPe7KZdzCdGMrUdsHjnf+s/fR/JRmJOq7oGpJWfVWYe5DrBm6KIUs8TVWq+?=
 =?us-ascii?Q?sVC2lwjC1+biDnwRO3qaysl/XmELIz6YMiYPTYxPpAXWEVT1iWfcIlOyM3lf?=
 =?us-ascii?Q?9+gNHAj9FZLLLD5mULDD8BK89P13abBspB5jLCzNNdL0u0wJGYLLXob8F2K6?=
 =?us-ascii?Q?Psn1WjTLcPGu8DIA8LoPZH/Wq1PubqKWsJvQSYY9mcU3teJZRUYDrPQGzguw?=
 =?us-ascii?Q?8nApTVBEEjedxHYcVA4NWsAbFp+Q36twiiDwl/aUE5ugQHkWGNKF7ILKiYfc?=
 =?us-ascii?Q?gck0FY+8eiRSZYyLfqnDSjgLF5RozNImkU1cMcK3QneSGyFyWvqKikoU8y50?=
 =?us-ascii?Q?D/mOl8QFc+kDhkDFcHPhn1899c0ILwJlFPs8UEEYUPpzhHaJ1LA5gYUq3mcS?=
 =?us-ascii?Q?XFco/4m+D1jWpbSYu8Quj8Gyl49xFSTxz49J0IhVmhfqRmfQ38T+YVBPVRFY?=
 =?us-ascii?Q?GrV4a57Dpw0PcJsxHP2CAHG2c38XkMZBTxFpXIa+M94ea8SBwf/DfLJWf0mX?=
 =?us-ascii?Q?MX2Xl5J/4VTm8yh4LvYHq+Fq9REhxiyeNCycbpxaCqWFks3HMcKJe/D+uv6K?=
 =?us-ascii?Q?4akkDJJhEKyThnh85zXeB1dGWP6JCL2GxUEViVCIEs8pLnA2BkU2NZmEAqG/?=
 =?us-ascii?Q?FtcNMM9jAnFhg9AMfSLOgJJkmh1I/7nwPrVLLQYJ1DB+NrLESwADENTt7Nh6?=
 =?us-ascii?Q?4jmwYmHuyorgZpVc03No5Mb8/ifCeVklkyb0lFs4ijci8nlsWmM6iDUcfG1R?=
 =?us-ascii?Q?0RRqNJ7Wug3ezmjfRu6f/iFLQXLV9R9x0QdXHkDInDNcGe2ZUw+s1okFjEPw?=
 =?us-ascii?Q?xSz+srhMhvp3uhlzruV1fBd0kDf1WLBgshwsMbMbmP+g7abK6aiUfcCAydHa?=
 =?us-ascii?Q?WKSdj3jYiCPVMhUItH3qP8Pr5aje8RWd41H1d388gRms4INIUtlt3oR8MfBl?=
 =?us-ascii?Q?QxLYJ5a9WCZPisBumGfM70mJQyurC/QtTMXUEsa5kWgcgd5pSFedwKNZ8U/s?=
 =?us-ascii?Q?G2sGOCbqnGqvxpHu2zm5S9M6E5yfEfWcrR4SkfPjSEFxJ0LZVwqQHZFBNPHQ?=
 =?us-ascii?Q?0YqsoiFoan5vA+9LWOGY56Kh27ctavfOjAKKASR/QhqeNGdoWSC3nru0TvsS?=
 =?us-ascii?Q?9eEXaD7O9ECg85Ti/TbevxBGJ2hlQOCxi3V4Q3vav8vj4wgH6J1B63P4r97y?=
 =?us-ascii?Q?yYraNYzQw/4liTuJpJbuH502P6x3fG87jA9SaYPZHl9Deh1TLZamfsHR7l3w?=
 =?us-ascii?Q?v4Va2K0WSl+ZE9Qv7aVnBJsmgHA/fzzqIXpARWRacJSYyQykFFf85fZXaiU2?=
 =?us-ascii?Q?On8/nSlxO0mgRtD/DT2pjB2/jcYs4FEPapN8yG3VdDQ9lzoN7SKQEBSrHnUT?=
 =?us-ascii?Q?O2tVCZHjQKHbw08RXgV9ynD7B0TnorclOR9Gk8TrOx52GKRVpAHmepswqukO?=
 =?us-ascii?Q?6FwFOp8wBYjVPKNQpBUZmBYATK30YmFUZpL9KqA0hPl3ud886HSNXZZm4OY9?=
 =?us-ascii?Q?wT+lOoUFawAmQDHdjgpncgKvMKMP+jO+UkXGh7N+NN4YUMQ+v0liHTLG+8Dr?=
 =?us-ascii?Q?P8e7IHiy6+fTuygctO7Alv580h3M+5No6JCt+1Yu0fsd8Tbv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46796669-08d3-4c60-e3ba-08de4dfb84be
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:46:19.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mfaz8opCbjdx93fjFl428sdNqdCBOx8mTeA5eGogwRSfyvIOA34YDy6tKGj/9dBW9QhUsL55t+JKGAKgZ9jsGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

On Mon, Dec 22, 2025 at 04:49:10PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Replace vmalloc/vfree with kmalloc/kfree for allocating small
> driver structures (vpu_inst, vdec_t, venc_t, vpu_cmd_t, and
> frame objects).
>
> vmalloc() is designed for large memory allocations and incurs
> unnecessary overhead for small objects due to virtual memory
> mapping. kmalloc() is more appropriate as it allocates physically
> contiguous memory with lower overhead.
>
> ftrace measurements of vpu_alloc_cmd() show significant improvement:
>
>   Before (vmalloc):  35-72 us   (avg ~45.7 us)
>   After (kmalloc):   11-26 us   (avg ~16.8 us)
>
> This reduces allocation time by approximately 63%.
>
> No functional changes are intended.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/amphion/vdec.c     | 16 +++++++---------
>  drivers/media/platform/amphion/venc.c     | 20 +++++++++-----------
>  drivers/media/platform/amphion/vpu_cmds.c | 15 +++++++--------
>  drivers/media/platform/amphion/vpu_core.c | 11 ++++-------
>  4 files changed, 27 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
> index c0d2aabb9e0e..7a1c58cac02d 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -9,7 +9,6 @@
>  #include <linux/list.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/vmalloc.h>
>  #include <linux/videodev2.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -17,7 +16,6 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
>  #include "vpu.h"
>  #include "vpu_defs.h"
>  #include "vpu_core.h"
> @@ -1642,9 +1640,9 @@ static void vdec_cleanup(struct vpu_inst *inst)
>  		vdec->slots = NULL;
>  		vdec->slot_count = 0;
>  	}
> -	vfree(vdec);
> +	kfree(vdec);
>  	inst->priv = NULL;
> -	vfree(inst);
> +	kfree(inst);
>  }
>
>  static void vdec_init_params(struct vdec_t *vdec)
> @@ -1909,13 +1907,13 @@ static int vdec_open(struct file *file)
>  	struct vdec_t *vdec;
>  	int ret;
>
> -	inst = vzalloc(sizeof(*inst));
> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>  	if (!inst)
>  		return -ENOMEM;
>
> -	vdec = vzalloc(sizeof(*vdec));
> +	vdec = kzalloc(sizeof(*vdec), GFP_KERNEL);
>  	if (!vdec) {
> -		vfree(inst);
> +		kfree(inst);
>  		return -ENOMEM;
>  	}
>
> @@ -1923,8 +1921,8 @@ static int vdec_open(struct file *file)
>  				    sizeof(*vdec->slots),
>  				    GFP_KERNEL | __GFP_ZERO);
>  	if (!vdec->slots) {
> -		vfree(vdec);
> -		vfree(inst);
> +		kfree(vdec);
> +		kfree(inst);
>  		return -ENOMEM;
>  	}
>  	vdec->slot_count = VDEC_SLOT_CNT_DFT;
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
> index aced76401b69..9e5cbc2b0d3f 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -13,14 +13,12 @@
>  #include <linux/videodev2.h>
>  #include <linux/ktime.h>
>  #include <linux/rational.h>
> -#include <linux/vmalloc.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
>  #include "vpu.h"
>  #include "vpu_defs.h"
>  #include "vpu_core.h"
> @@ -844,7 +842,7 @@ static int venc_get_encoded_frames(struct vpu_inst *inst)
>  					       v4l2_m2m_dst_buf_remove(inst->fh.m2m_ctx)))
>  			break;
>  		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
>  	}
>
>  	return 0;
> @@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, void *arg)
>  	if (!info)
>  		return -EINVAL;
>  	venc = inst->priv;
> -	frame = vzalloc(sizeof(*frame));
> +	frame = kzalloc(sizeof(*frame), GFP_KERNEL);
>  	if (!frame)
>  		return -ENOMEM;
>
> @@ -912,9 +910,9 @@ static void venc_cleanup(struct vpu_inst *inst)
>  		return;
>
>  	venc = inst->priv;
> -	vfree(venc);
> +	kfree(venc);
>  	inst->priv = NULL;
> -	vfree(inst);
> +	kfree(inst);
>  }
>
>  static int venc_start_session(struct vpu_inst *inst, u32 type)
> @@ -1067,7 +1065,7 @@ static void venc_cleanup_frames(struct venc_t *venc)
>
>  	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
>  		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
>  	}
>  }
>
> @@ -1151,7 +1149,7 @@ static int venc_process_capture(struct vpu_inst *inst, struct vb2_buffer *vb)
>  		return ret;
>
>  	list_del_init(&frame->list);
> -	vfree(frame);
> +	kfree(frame);
>  	return 0;
>  }
>
> @@ -1309,13 +1307,13 @@ static int venc_open(struct file *file)
>  	struct venc_t *venc;
>  	int ret;
>
> -	inst = vzalloc(sizeof(*inst));
> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>  	if (!inst)
>  		return -ENOMEM;
>
> -	venc = vzalloc(sizeof(*venc));
> +	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
>  	if (!venc) {
> -		vfree(inst);
> +		kfree(inst);
>  		return -ENOMEM;
>  	}
>
> diff --git a/drivers/media/platform/amphion/vpu_cmds.c b/drivers/media/platform/amphion/vpu_cmds.c
> index 5695f5c1cb3e..ab69412e0aa7 100644
> --- a/drivers/media/platform/amphion/vpu_cmds.c
> +++ b/drivers/media/platform/amphion/vpu_cmds.c
> @@ -13,7 +13,6 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/delay.h>
> -#include <linux/vmalloc.h>
>  #include "vpu.h"
>  #include "vpu_defs.h"
>  #include "vpu_cmds.h"
> @@ -84,13 +83,13 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data
>  	int i;
>  	int ret;
>
> -	cmd = vzalloc(sizeof(*cmd));
> +	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
>  	if (!cmd)
>  		return NULL;
>
> -	cmd->pkt = vzalloc(sizeof(*cmd->pkt));
> +	cmd->pkt = kzalloc(sizeof(*cmd->pkt), GFP_KERNEL);
>  	if (!cmd->pkt) {
> -		vfree(cmd);
> +		kfree(cmd);
>  		return NULL;
>  	}
>
> @@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data
>  	ret = vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, data);
>  	if (ret) {
>  		dev_err(inst->dev, "iface pack cmd %s fail\n", vpu_id_name(id));
> -		vfree(cmd->pkt);
> -		vfree(cmd);
> +		kfree(cmd->pkt);
> +		kfree(cmd);
>  		return NULL;
>  	}
>  	for (i = 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
> @@ -118,8 +117,8 @@ static void vpu_free_cmd(struct vpu_cmd_t *cmd)
>  		return;
>  	if (cmd->last_response_cmd)
>  		atomic_long_set(cmd->last_response_cmd, cmd->key);
> -	vfree(cmd->pkt);
> -	vfree(cmd);
> +	kfree(cmd->pkt);
> +	kfree(cmd);
>  }
>
>  static int vpu_session_process_cmd(struct vpu_inst *inst, struct vpu_cmd_t *cmd)
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
> index 168f0514851e..85cc4a14f8ed 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -17,7 +17,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/firmware.h>
> -#include <linux/vmalloc.h>
>  #include "vpu.h"
>  #include "vpu_defs.h"
>  #include "vpu_core.h"
> @@ -265,7 +264,7 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
>  	INIT_WORK(&core->msg_work, vpu_msg_run_work);
>  	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
>  	buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer = vzalloc(buffer_size);
> +	core->msg_buffer = kzalloc(buffer_size, GFP_KERNEL);
>  	if (!core->msg_buffer) {
>  		dev_err(core->dev, "failed allocate buffer for fifo\n");
>  		ret = -ENOMEM;
> @@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
>
>  	return 0;
>  error:
> -	if (core->msg_buffer) {
> -		vfree(core->msg_buffer);
> -		core->msg_buffer = NULL;
> -	}
> +	kfree(core->msg_buffer);
> +	core->msg_buffer = NULL;
>  	if (core->workqueue) {
>  		destroy_workqueue(core->workqueue);
>  		core->workqueue = NULL;
> @@ -308,7 +305,7 @@ static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
>
>  	vpu_core_put_vpu(core);
>  	core->vpu = NULL;
> -	vfree(core->msg_buffer);
> +	kfree(core->msg_buffer);
>  	core->msg_buffer = NULL;
>
>  	if (core->workqueue) {
>
> base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
> --
> 2.52.0
>

