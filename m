Return-Path: <linux-media+bounces-45269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7EBFCBBB
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8670A4EC97C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CA1348440;
	Wed, 22 Oct 2025 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TzK86C84"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E75347BC9;
	Wed, 22 Oct 2025 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145205; cv=fail; b=LadjG9O5VNzxMZsQmeD9Ksw6eEjhFm+p0RKLEwtdHjPyjc3jNr41vQkTcO2zD1lXlpzrahxEMKKAymZ53OXTAzN5BeUnejcxLEgbzOWnkjNguBQ8dq9YPU/T8A3osu9+CDKcEs7J06g++31kfAleRKS3IeoawNvUuZLl6xn0ylE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145205; c=relaxed/simple;
	bh=2zpwWBAbctkmG9DmysT5r9iPWnLXysmG1eG968tdmR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=poLUZ0kl/j5y1I40ipYAoRsPdOYBemUvs7//Llgw0Zf1VW5JpXyBlwVK4Kmfofhlt0Xz+zF8sx6laUg3S004gFjdbVcNUnkJgBhMDUL2lOP3SLLt7QW6MAlvSKhRPAx5OKW7G4C3o+n64SIIswB8QO+dAx9ox7lC8f1xdDPkxZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TzK86C84; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=norYVE520gmLlzA64Q/32A8314a23OxEcb0zCIxkxuHBmZqmO5nloA4uWdFOuAEp11pNyBPPpiGSpu3b1d9q3I5ib+HR6QBnnjbMcDPESQSOMmdE1GD7I2iGwc9GJ205xZmRV/qoibqJ8+6tFXgcK939yAYEdEFMiwhkm5o1EO0poIG7j0wxMvEM6xGYre3H5BS7Auj+n7dbQMED87CvMcG+5FSNAOE+EDOb4VlzESEoXjSHJd2YXDUEfLFZJF63ayDAsr8tVlXay85Ak4ZWQsTj8KBo7YSIWkwxh3dCRC8lSdywQbV6A5xw4CdSwAilXPmKWeCXpEmHrrfVSTU8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYi0eyksFfBlPTJhx+OQLxtjQIGOooxJfIeYlinU3oA=;
 b=uz8+o8thinI/R9or9/ELOJMJiisOh2Lmq1Wwwp/R3yH5mzd6auThFB9rEpLRubFel04cE5Lx1gK9sdH7JTRHfKB8pPf6X9fSgijb6XRSk6UZ3H6Z6ExW4p7icpjJySbLAMqCSYO3Pu5JFyrKDK1izAisPTt9yyxUlc4nwwdolU3syTcrDA3Gy5sfmqx8ZV9+mo6xwUO4Uv3WnCQvdjdgr+w+BBU4xse9saFM8h/2SQ3ys+U0zoeLlDnh/5Ygnzyfvw9cuA46GHE0p+LmGzUa7GKI3BjW/4BJ/2MEOEikwXr++IOg1KykKk3sTAg0wPPYEfKbLTCkX7LfiwtYNrjfZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYi0eyksFfBlPTJhx+OQLxtjQIGOooxJfIeYlinU3oA=;
 b=TzK86C843XSm2GorSC/y/sHOKjFtj6HSRO0aPF42LPw8RIY+xIto6z6xx6m9LW9CfyibgvkYKnoZo6JN85eXd7WkXhDhMQ2+oR15Yrq1ym9vErLXnwpbdVhHLCDVr9+ePFYaasO2uFp/gQpi34YUQCRzmkTzMcq3ieVNjQBBhIiRC42UId9zsTbSNcB/xuwHp4+3DXJOL3f0WbP4lkRciIpFD/+ayU499Hxdd5ZC2joI8deltDQlq/ofadsw85AvfETHV4eom/VoKD9XDyziQaHYQF4woEGfw0veStNkQdGHl8rVRSOlw4twe2oNAo+N9l/3CBOc98AjQqlRJaMpxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB11540.eurprd04.prod.outlook.com (2603:10a6:800:2c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 14:59:59 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 14:59:59 +0000
Date: Wed, 22 Oct 2025 10:59:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, kernel@puri.sm, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/4] media: imx-mipi-csis: Add num_data_lanes to
 mipi_csis_device
Message-ID: <aPjxZNIqDHHkZH+O@lizhi-Precision-Tower-5810>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-4-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-4-isaac.scott@ideasonboard.com>
X-ClientProxiedBy: BY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::25) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB11540:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ac43b1-c566-4263-674e-08de117babd6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?XnP5oHAZZBNtae/a9EmGr5oHPJBNxyt98Z+zFHCNsMnjc00Zd2e7mt+LLjhZ?=
 =?us-ascii?Q?GVuEx5hKMjJc7OqKXfeH8aF3Mnnhyml7mwjwgIXlF69bjc9RDKlYdGvKnOUT?=
 =?us-ascii?Q?olYrg9SOqtS3v90pcRhZTGabbm/e4i0Ea2uqMftambO5Qbevp6RJJSJneMSK?=
 =?us-ascii?Q?eltiTNl8Cnbz/oQpgfYedzfvjkBxUwq+QvRlW+KJlysxwGeF+NEo6uWJEvtg?=
 =?us-ascii?Q?zhTklYXxU8w7zSM/8/IwkmFNFY9lVLgcKXV0M1TuMUzRandH7MscOHJZYXv+?=
 =?us-ascii?Q?FfhGCBKsrlqYyj3N+KXn5Lr8bW88G8h6zWEfyHZZBH9jXa+njRkpW8MHfmLs?=
 =?us-ascii?Q?oaYsSj5EsT2m2oYodg6F4pX8RgUtOGkZ4FLerOmR0ZqpIlLlJBZbPphtCl7z?=
 =?us-ascii?Q?755q1calYrOqVdvZp3RxaigMEFzJN+MBYz8kOQZAG+1IcGaoUE1rfmaQjo+7?=
 =?us-ascii?Q?c74ZXJOFdi3yT/TWnQUbvguK7crV6+CivySa7qEhRKcfSJbgzLMppwxZtvvB?=
 =?us-ascii?Q?B2idpDjF5wlMAZkeF5THeAqRCgzBeCCa4RThArmQfBvQgcuz0LbrQx5vimKm?=
 =?us-ascii?Q?bD6h2yyxxQZxN4C/aqUcsjVrJ+Xu5b8BPopilpp0+YMl+9inVS5Yq4soW+Il?=
 =?us-ascii?Q?nMrTdYsOx7ta8yK4tvQzEZcG0tl4PfI5c5DywFWMiQ5lSPLIuPXO9qyxhaJd?=
 =?us-ascii?Q?/ja0sZcZRcnXp/s6wymwGwWB9GrzC8/Lts7HeXOgBpnX2uDnRia6XtFPM7pX?=
 =?us-ascii?Q?SkPSMRAk6+46Uspes1vdhwbHeFY6d5ZMCSqQt+v03BRNFJM7NeJ/0qYuqGZX?=
 =?us-ascii?Q?PiHUKLGUjsem3vwa+7y3OgBlmQ8/bjzxF4CvmSRIXVl3afHN763bLMp8yZG9?=
 =?us-ascii?Q?etzyvP7AHLr41ExLD0yFDhrrjKqHfC3Hd1jqR6W55uBrg6rMjvG7RYz+qgJy?=
 =?us-ascii?Q?NYzypq3pXdeEduajpiO7PHntq3YZTHyqOuSGKUwNqdXvuJLP72A7T1ERKdZp?=
 =?us-ascii?Q?w67pmMi/jpEccHjiVw1f8GGOArgB85PyAlFb7YEbKe8luHBLtrXfcRMtCP+p?=
 =?us-ascii?Q?CXMyfgJRKRt8JlFL3raH7SoorveYz0JnYtsu44xQQGs89mvf22Md4AwyLRQH?=
 =?us-ascii?Q?a50v7gm+eHsb9R7S71IlBSuMrAqwGjxPvp90EQu2ZUJQ1WBXcqNpIcmBAZGL?=
 =?us-ascii?Q?SwBno2JhT8r9+3Ys0K0W0bd84knTVi0ykvQ2KMQZTv9pKGoWDxgsbpMP8xN/?=
 =?us-ascii?Q?f4U4oZPu8zecAajOPUjCt1aRKbFwQTp5l3ljk5E+g9EMzLEat9wfyNmG67BO?=
 =?us-ascii?Q?UNmSG9dJQTsdbkM6gO/GuSo28tJ9cn9Tdw8Wo4Z73eouC9TGb3UiC/ZEHq6o?=
 =?us-ascii?Q?AdWs5IDFjCsHQF931YqGVz5ybvNuZ4vFbxo+qcBlcfuS8dD2z0bkU6IW53fa?=
 =?us-ascii?Q?7yvcjC2BvZHUO0dcTJDq1aRV5AXEC8+YlsQ65tNXuwvJXEvgb6/gTN4K6g5D?=
 =?us-ascii?Q?YTgLUz2FZQRU37iZYNEdeGZnDf8PkeGAgK2Q?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0veP51nBFa9ZgjRQo6hj5CtuXiEW40SP1ww+11VfjUfxrTl9lvpVMmhux9R0?=
 =?us-ascii?Q?L/JG1ScUNViHlHiJDe+yHzutDoL4/Ch40Y3qV6mG0b9C/5CgELlGhteva/Kj?=
 =?us-ascii?Q?K/34hMs3hZFTxwaPJMJT6RwhqO5VQZvLP7Neb7Kl0i+CoSN3s1I67fSclhLC?=
 =?us-ascii?Q?Yu4oDndl4oZ5IvCu3Y86MtEhLesJ/BAKkNC75u/fFgCq1OSgj6zYGOErnBZf?=
 =?us-ascii?Q?0rSy87iHuwcAOePo/b8xl4VcoVNrqdGzzEYEB9aklSLD67XDbghlEV1Himj4?=
 =?us-ascii?Q?3AsbClpMXFESeaNTIwc2KtKiYR/niPTKWv7wrg4nwFpudKJIvbUiYGVPrrzw?=
 =?us-ascii?Q?Rzox7/C8dcvu7HQtPXY6ddvmaqFg0GanVbKdRzB/BvqTZ3mKURZnkuMknQAo?=
 =?us-ascii?Q?wMSzVdkpOcUqRMC56vHCWM7/HSdJJ+4kRmUzLnq4PLhAhmjoBtaaXGi1lreZ?=
 =?us-ascii?Q?RSZ9f35x/J6sp0EH3xTKDoQJIqlUZ2NWxS0jDISjoP9QraegbZeyw6PEkqL6?=
 =?us-ascii?Q?z2R/xIUXfPJZm3sfXxXWQpRxUrlRoPudfFFp6K8YanBAtvjSTIAeuic6xHaK?=
 =?us-ascii?Q?k4ndTKpJyKzjIbDgUBbVfRHYKpnM1T9zQB0Q4Zebhr+13ICyaS9zN+Nno5Wo?=
 =?us-ascii?Q?Cn4CY0Nsko2tc6ITaZTKumXFsC5T83hteP6hLZKZwyS1hesRYxJ18JghUHGq?=
 =?us-ascii?Q?T1RSAxZEwbj9TLKU/VhTkjg4IbDXoEywdpdneLe1O5NfK+00xsZcUj1JDrfz?=
 =?us-ascii?Q?+nwXbj2rcJRYWRevJxpPCehWrJ9bJ7dAtX6//oTHLq6scEaTjJfjXezfLSSp?=
 =?us-ascii?Q?G1cfFsCZGw7wLw/+FLALP7AdttBWmwGk4MXXh/Nm2qjuXkCyiTOQIuHty4Fn?=
 =?us-ascii?Q?JM+9YQfeNBAcgNaJB73r5FLtNVesdEvRVAGCfATkaMgOnDpRcMouz75ksbCK?=
 =?us-ascii?Q?C3N2McmWCJ7JHklBvfRiBDP+bbJ2AeiWkC5e9ERCIcl/PW3jpQFnJHCMyszs?=
 =?us-ascii?Q?Hf7u5gbjxXzs1bWIHEeU/9FEu23LGrS93u9GupfZJUFrA1zmAhgwE+7NxwIC?=
 =?us-ascii?Q?aIldFQOlIqEOw12mXDoSofqKpblA4vKv+HH5VXnWE0Hsr/QGx/LvD9UxafpV?=
 =?us-ascii?Q?T6T4L5qE8BWnv8gVrwBdMmu0oqNiR+5qnS/8nZDD5rrwWIvveWdiVCvxZj1L?=
 =?us-ascii?Q?RE+4s0AtxE3TpU8enhMrtlxOaGkD8jZH79wHC2O16S289ABUQDZnD81wTLs6?=
 =?us-ascii?Q?RDuNDJU009Bgl2Q4Gk5n08yu1UD6e/t0fmA+D0oDh3zLTKUZimVfY0UPCycZ?=
 =?us-ascii?Q?K5+hG1rGb2p6zimNM6Ne1w0EEOTb0BhfrVr+EVMvxw2ZAlV7bWj13xbDjJr9?=
 =?us-ascii?Q?zS8D5mLMPwa2oZToNR/FkF4/k+SLRUrHSmDaGiQn/Fcv+rfzdXiGOsz9xgZY?=
 =?us-ascii?Q?rpS9L4c+uh/f6ChpofF9O1oGvd2O9ZbhkQjuL8TdkASY9sm9pXFIjGm8DVTh?=
 =?us-ascii?Q?Iots8AuVpkbizlzLh3r6gJdsIqm+fQRoyCJEos+TSV7t6Rcivk6Xc+R9ql2g?=
 =?us-ascii?Q?TqlmHX/KJrxf6LshaB0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ac43b1-c566-4263-674e-08de117babd6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 14:59:59.6496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq4THAx7xAY3WyH7soHYrvFmlKjBZk4pxSdu4eJmWDnDLk7+fXY+/r+A9cJH5RL9NudNfbr5hk5WtKBNkDPKRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11540

On Wed, Oct 22, 2025 at 11:22:27AM +0100, Isaac Scott wrote:
> Add the num_data_lanes field to the mipi_csis_device struct, and set it
> equal to csis->bus.num_data_lanes. This is in preparation to support
> cases when the data lanes actively used differs from the maximum
> supported data lanes.
>
> No functional changes intended by this commit.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 7c2a679dca2e..838a1ad123b5 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -351,6 +351,8 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>
> +	unsigned int num_data_lanes;
> +
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> @@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
>  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
>  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
>  	if (on) {
> -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> +		mask = (1 << (csis->num_data_lanes + 1)) - 1;
>  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
>  	}
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> @@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> -				       csis->bus.num_data_lanes * 2);
> +				       csis->num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
>  			(int)link_freq);
> @@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  				 const struct v4l2_mbus_framefmt *format,
>  				 const struct csis_pix_format *csis_fmt)
>  {
> -	int lanes = csis->bus.num_data_lanes;
> +	int lanes = csis->num_data_lanes;
>  	u32 val;
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> @@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	}
>
>  	csis->bus = vep.bus.mipi_csi2;
> +	csis->num_data_lanes = csis->bus.num_data_lanes;
>
> -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> +	dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lanes);
>  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
>
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> --
> 2.43.0
>

