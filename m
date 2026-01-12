Return-Path: <linux-media+bounces-50478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4AD13C5C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 16:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA92A3036AEE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 15:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F71134677D;
	Mon, 12 Jan 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HouA+kTW"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328035F8AD;
	Mon, 12 Jan 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232389; cv=fail; b=F4MSmxsDe+FHZippS9uialHxvR8Z9euAQXAiedmZMzl4WuKl+7cQIaY+jMC4uUtRFAmCmL5TfUiIvTIVxGMcfpxBC5A0igaVUj9CU4Bc8zwI7K07iLSwcbjPXnyMNtDEq0Zz7RGf2teD47RXCCiefhnGIALIseMJVo0xJabjYS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232389; c=relaxed/simple;
	bh=49Bdv8dYLcPbrZbDJQhFOsdMCoDMJve2G0dnsP9QsRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qYmvdTuIJcI2BoAJZnMm8xqs7/d2W8yj1dlfWG1IWMQ8DuYgHPFB5YYTsoyHz9i5pTHc3clF3yUHzVNl2DmpamPYol3dhVKr7pgCOAh+GtA121uo7VMap15IWyw+ixyAYMpYEXD3KknLIdXP1oGHgaW3QxKbSNcUDKUIdCE4DBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HouA+kTW; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1kKzfahFFFJ7gijB8FNIosJKB0RtJMaTg3jfIkOZHoPcwi4s608fIpbUcekhIAz8oudFCphze8DjUkJnHI0QKY6yAtFD+8FNGJ0lXLh1YSKhjnuMFJyFJLTbUOtIc1dlKv5sG7lgTOEFF/yrduaOmn4+lwLlxD1dBptER8zCa1l1X4ol35UAgBbjqe4VRQ2DiOMNWgbDmXZjIftzquXe+EGQCdZqSuUXYhdY1kJTwGLQaQsEXfZ8S4/8i42LGzzGeAAPd9Ojgmji9XBxvqocaVGQTItAeCMIJZKaEgV2mxGGFSiFU7uqKpbdalN63VXM5pm49ilyoox2PUW8NFA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7fcF57GqioqQX+LBbgs8bcCayJ2nykGSU0TCEhsdZg=;
 b=nqowrVYCA0h6r0868ZT9T/MeJKFmWbaP9w8JVzJ02MVQSUFg1kbg/2zF+Hyf379EEpSZnTcuBb0XJIKgC9NwHe2zTxQPrni6uY4lklCKO9IfAS5Qaqbobe+0p+p0EbEglK9jFuTT6pBUdVtzj9CAK4MhPVJywJktNy2OpPZYFNiQwwltGCN4j1VzTck0YfVuBQPL6tovNHRjQL9IUlTpfelKSQMndjreV1IEZJZQdskedSk/DSYVBWvkWEEuaOylNE/r2c9wsD8v4LesZHACCih4x09+xxu9SNyhROzKUSoQc0EadRovYF/uAf3thAOJyYKg5fLJN3lePZVPtOiUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7fcF57GqioqQX+LBbgs8bcCayJ2nykGSU0TCEhsdZg=;
 b=HouA+kTW2V3Wm4gpmGrSUcCizG7o5Qq0kWtlgGO1JQZgQdeBFam8RzIAFg8Q4nzHO0uSAbyJ4yqcFQXJiYw3iMwWzafnNuC/FdbiSZLPe9YyXFzWWpyZn4o2M7dG1P7YCD3A/1O0kWsJ/ncjHBi768jTS/cJL1HeAc0SYYgqJoWlgvqsl+2HUoBYZWp4pBRB75KMYD1OGM5Xs4a/KuJ1xIHh7p3SVsbzgJEtggSpxoiHkFt2drfLDxyqhzr8l9XxZ+s+TJBV2E6raX7Oy6wZd9djHISjJp1QlrP7ncGnUfG+d0KPpvNoQHPf089ItWpq5dvf+8EgNKC0KHOIoq1uCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB7137.eurprd04.prod.outlook.com (2603:10a6:208:19c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:39:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 15:39:44 +0000
Date: Mon, 12 Jan 2026 10:39:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/5] media: staging: media: imx6-mipi-csi2: trivial
 cleanup to prepare convert to common dw mipi csi2
Message-ID: <aWUVuIzV8pukuCLz@lizhi-Precision-Tower-5810>
References: <20251111-stage-csi2-cleanup-v2-0-371bb951776f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-stage-csi2-cleanup-v2-0-371bb951776f@nxp.com>
X-ClientProxiedBy: PH8P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::24) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3c9a09-fcf7-4385-e5fb-08de51f0ceeb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|19092799006|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?LhIWTNvDhbiOCIdoJcwYBB3rzYHAXh8GT1+3MbGjab9nCelVhPqodKz+z7Go?=
 =?us-ascii?Q?7g1gIB8e8BhPLtGo4WigZ22ySCV/3kfw45knFiTapncHLeOwvHROAWIK4nrO?=
 =?us-ascii?Q?R/1FmwdRgd6l3k6cSLCsU2wOEgDEEC/mVG1p1tMZzt9GqpsEuq9HTtSyh1R8?=
 =?us-ascii?Q?GbpgIM4pqdkd4leu+TJgFfVLbcjN1VDR6zcRnds7obKTmY6bE/soW+tM9Dgl?=
 =?us-ascii?Q?RjNkJJMvDeezj5HrrfvaIlrYaQOSb0zmCTul9S8qMIUMKbCRbwA1Tamy6XYh?=
 =?us-ascii?Q?hQ3KB/M4G1/J0NpGsvLHYjBwyLY06Bm9j1ZOZBHsWWtdcv/0pORxagM+Q7QH?=
 =?us-ascii?Q?LWnL/PTE11nex8p7HlqHqdLth4Lo6Cs2I8vvNqZoTbByV8zr98VFIXYXesN3?=
 =?us-ascii?Q?kWAVu8DzJHNAl+qyp8od5X6lSe+CJbzbnXyPdAf4ZIYDhvwJe0MDwwwBAwRk?=
 =?us-ascii?Q?RrmkxfF9k4/NaALrvGZUJ+eqXj4cHiy5SUIrB1wi7koSshm6TjqcoiumwvY7?=
 =?us-ascii?Q?lpXaIP4+1K9xg/QHjXeZZiuq6f9MbbP/Jy2QJxgO2P3ZR+X4kD95Y+G3+Rhs?=
 =?us-ascii?Q?eEsWEMSkJahKDPblCYyyGnpIXuQT79tgKTyL2nJ53swPfUt/JNcF/h749Xow?=
 =?us-ascii?Q?sI8b1CHnkQGV/s/08vz93Bq26OxE80GRxLAMQzzRAikRPRgTpR9bJnMKhSjX?=
 =?us-ascii?Q?VTshOw/BVJ/qRL0V3D69iFpWsp7+WzI657v/Ya0rVT217fPb/tJ3HPpZyCiX?=
 =?us-ascii?Q?o459tJJj8GKmUfsD2MSBf74djlb66zgwi02S5o4WXxqqhrDJcnt/dWsjXyM+?=
 =?us-ascii?Q?zXKiv34SpaDGEEMLe3SKfNMGtaqSG3kXHIahXs47T2FXhZFWAnSP4ypmI5l1?=
 =?us-ascii?Q?EI8ICgLx2UlUwzgPP6WEechieokJCK/Tlrwcl5wuLKBIxgVG69GmkmBuC9pK?=
 =?us-ascii?Q?2Q/CDP0bF1Y40c1rB50lS2l1pYf8yewcw3YEos1eBFAxfDUqWXo9+tAs9o+0?=
 =?us-ascii?Q?DqA3uHHIetyDaB9vKpAuQ/48oA7c5aVwA4niXciBkwpyT7DMYOg8Nsu4+ueY?=
 =?us-ascii?Q?Q/q1JTuLc5Tz0vlhDnQzMfvuX4O2esboneNDra/ekekPQn3/FLrBsreSl6I1?=
 =?us-ascii?Q?NSpZ/HGfyeEumLpL1H8s7jxfUi7jFkWSO5INHEF+ryqq9VtVz56mQH2Jk1Na?=
 =?us-ascii?Q?LLlTKBX0mGzYrTXWFH2ITmu4GqTyg4ROwHDnDblzfInW3gEwaz9iKeoj5tQ2?=
 =?us-ascii?Q?e8c9OnC7uEyGEsGtNtUn0bkMnYEFk5xGxIPaumpWRBpOZEGY080K3e7tIlQl?=
 =?us-ascii?Q?UUr4wCx/HPGzG2MzXF0yfgyTud9V/IKVguCEtEkGlRTDhgoNi7zZyH5Sd2Wm?=
 =?us-ascii?Q?KmddomQz7YI05eion3ycdjWA+dxcxd9qyEuqSUUYgDt+l2WnMZ1jWVQxXKDs?=
 =?us-ascii?Q?A/dyrHaGVUMRXcRgN3UYQcPyPY5ziJh6WsS4XLHGc5shOJZeSMxOnOPltGO1?=
 =?us-ascii?Q?hcZCkwRRBD+LiZNfDIT5NQZMfZRqYLPoQJ3lkoh/HdKyQUNKEoMnbtfFRA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xb/SEcRPQEMhkjB8JX6qMDF7Ap/4lJAV5y/nTiThoKVcsOI88oULaXJ8IROl?=
 =?us-ascii?Q?VK4BQEGUvq4tkLRZvXn2FlzfAI3Si51PHXIB450ogoCYPsv3s2nc2WTioxOM?=
 =?us-ascii?Q?X5AGzOcTpAkJTyrURbLaYcG+9/nbyxwb7E/omLcS275aH363fiBzO5L2HJPU?=
 =?us-ascii?Q?N/zdq9TMsIUNGMOcRr9JS5/6HJJ6P/Cme0VW4Kezpbri/YHfIgJsbLuiOj5e?=
 =?us-ascii?Q?5X9zzamEtDl34XQKAnix1Vn6dihZsV7HNLGUZE1c/nBmDqMP0l98JCEDrlqk?=
 =?us-ascii?Q?XmYmj7b/1E1d0v3SNx2oRiBduuEGQ2J0Of69tRB+NX+CwuR9ZZw9jPfhdYXj?=
 =?us-ascii?Q?27wMV/Sm/1htBvthUdiziOILqB5Py4NqwhJYqrUCo+cT7AKjCC1WdnJADvaR?=
 =?us-ascii?Q?sWXnMHs+XfJAtTt61BOPwnZD0Pn3cH70cR33Zu6/wGaDGiDDBsokzoHz/VSm?=
 =?us-ascii?Q?SG535wq1dXGd2zFxIatRGHhwpScycxFoGV9e1e+h91W7/RMB89AzJtD20t1F?=
 =?us-ascii?Q?zWbuEKpS1sDSTg7M8GiPosRo/6ndTCF5SWjRtC+QfefJjdl50fmDq5Hndx8x?=
 =?us-ascii?Q?2ZaxcO3486xF1A+4dAlL/nL6GRUvovTok0FMMmr7webQrBA7TiSk9gYNZOvy?=
 =?us-ascii?Q?hCJwypfrjAqqvssBMbknOlqhY/Hj3aswuMa28aA9sYwN2Jf3cio1++sib7M3?=
 =?us-ascii?Q?YYOWClryV9o5wRYcqMDs1o9jCf25yFbZQJPgPTYltItTAp3P92IT75ZWBMR8?=
 =?us-ascii?Q?+XczdTdEk6Sx7sATs07xrYxXmum0JrlvnW2ouUekY9N7PviIvlPjh/k7Qxuo?=
 =?us-ascii?Q?7ArtjlHyBg97VwBE0MJ1YOPwopEKllYiOqABZ0dyVlUFt5c0vyOOGl9L/Nur?=
 =?us-ascii?Q?diD6DcX2H+pVdi2CumN2Zl9Py06ErBZ/YKO18YH+ZvIRXr80vX2kpLC2fw8Z?=
 =?us-ascii?Q?q8cNc+TYWjeI48GqJNNVp4tXJol7Zmlp308NFeqdBIU4AyEiuU3gwPdV6oEW?=
 =?us-ascii?Q?F34BSzy2saMauxwOMOX70WUZpqqSHOSQB9Jd6isIsYMS0Tdg93SLuYTReR1u?=
 =?us-ascii?Q?qjhfziBaH+R9gILBR8pAoqmvn7WsOWow7P16rU5OPXeM/5HuJohvKxN5fzdo?=
 =?us-ascii?Q?IqWiuGKueZh4OQMCOs5b5Nfv96Kp/bfT09UGS51LGYhD94UObR9wBGnPsi3m?=
 =?us-ascii?Q?ywLkYkzvIR2lwKxK1VgKMD+Crq1yZ8j7HYfmxrlx7grbcp0UcLmsAdvmBnKi?=
 =?us-ascii?Q?iBFUo9aRCyAAylYynRmjvWVDgYPRI+KzTYSOAsWeS2cCBU+IN8iYhtfBA0PR?=
 =?us-ascii?Q?eVhIVUaMAcsk/bZdSXseTCGeaVR+KFQc6dQHKI2na2MP1y1beCTBPSk85+3E?=
 =?us-ascii?Q?qXEsvpJorMsNE+VRTF9HBBkXD2BvrNeO00ekIwxaei7fjXqwbL0RBexWv83P?=
 =?us-ascii?Q?SH9Q9ZiBlBOuzFc7MVIVDfSq/B7Ls7k0ytnngifR3weBlLLnELR9Hcv1HYtY?=
 =?us-ascii?Q?P1Jds3pzDvSZsXYj22nQQVEMyuNOoV35T9SlLBogNjzFGCfUUomehu3Kc4B/?=
 =?us-ascii?Q?IkXJsjjuawbmeUo00LqMD0vTX9vYPurLMylZoH4BbDwRf40bGZz94oS6QCeU?=
 =?us-ascii?Q?i9Fag/qhmPKAW7MrVR7LeycGyAMOAGCi/RRyixR9ECPH11l3YXWmOl0oAmUe?=
 =?us-ascii?Q?7HU/uBe/zGT+6biEi9lbhHbxiEELVp0gFfZ8g2184LesbQpt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3c9a09-fcf7-4385-e5fb-08de51f0ceeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:39:44.0358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1q92xbkPqUkVD9Cm+rUc0IK/Exez3fMZb45cnEIC+SiC8n3ZO/1pH96TgZFbgA6P9eqlW3dMCR7+fmXV9NHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7137

On Tue, Nov 11, 2025 at 04:42:12PM -0500, Frank Li wrote:
> Previous https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
> There are too much patches (32) in above thread.
>
> Just extract first 6 cleanup patches to review easily. The overall road
> map see above 32 patch serise.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Anyone take care these patches?

Frank

> Changes in v2:
> - collect review by tags
> - drop media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
>   need more time to understand nf_unregister() and subdev_unregister()'s relationship.
> - detail change see each patch's change log
> - move devm_mutex_init() patch to second one
> - Link to v1: https://lore.kernel.org/r/20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com
>
> ---
> Frank Li (5):
>       media: staging: media: imx6-mipi-csi2: replace spaces with tabs for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
>       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
>
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 209 +++++++++++------------------
>  1 file changed, 80 insertions(+), 129 deletions(-)
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-stage-csi2-cleanup-6db1715fd187
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

