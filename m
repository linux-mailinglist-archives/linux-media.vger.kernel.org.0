Return-Path: <linux-media+bounces-40435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF9B2DF7A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 244F31644B2
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30AC26CE0F;
	Wed, 20 Aug 2025 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ARk48Bv3"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C535334E;
	Wed, 20 Aug 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700537; cv=fail; b=NV7ednn0dLtBkMPAuw2bV9JctVzYvNO+iL1NR2BoPsIEknerJpqp7O8Z++tqtyzRHLYT46Z3VXBujijB0TN9KJuWKUUd6t/P9ec6c1SARBZEtSZ/QCFuB2dU3dWvpe3WVH+gikJnEi7Z8GycNfkLQi/nrQ2mb7bPPVZC3Nu+67o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700537; c=relaxed/simple;
	bh=eIqyxhkTdL00dl2sVjEtF7jrxI5bPCw3+ellmu9jPLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u0lm7dveIbP0iVeCNPxvwLss6cro+RZyj70XcMmvKz0ar3x+ev2EOjXEjK9JR/0uzgAtNzjAm3CvWdHp3In9w+eU8lbrgbOtv2AqK1OjXnfqphotK9vY2pDyq08b9eNnMi+ssvOE74ppKeIlwCgnxCUUfdDqPt5LltCCMrhFPHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ARk48Bv3; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLR5yDei/xyRCXC6LmIkG+ilYwwgJJ8LkQDEWXkkXo/IIwQavPGyPutuBVNTX2LiO9EauEmzB5KgeOijKOXpPOQTzMf+qMoCByOx6YOi/wk/U/XDCziygbM0DUB8kYgCoJ/aO7E+0+v6tJUU0oe0aHzxyZhFbRk5HxERwtqtNMud3hRvVjx1Mx5rJxqctQu/mq8HfiePa0zsAVTQDfiO98gUBfOBMmp5IoW+/eZc3XCIwFZ2euvmgTLdWkK00y1J81243LR/Ge15uTHDKqni5I3zpjfRWyeeezov1OEmh8gYP/jm2jtsEBPJ2R+jXe2tnCQdMjKPos0wXI+hlv6bLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb0bAAnPxRXpBQWpgcgKKuSuw52FHuO7DAGM1VqsDfw=;
 b=vmQ7/bfzNSFnfxytzrcGL0CVdVcbPUBHI8qkrEXIcMT8UGAtfNtawTS/Kr09G5zyD+ne6TTY6UEyFH5Rr/AWq+zRkx0DhrcbKenehVqazs71rPiZ32x+4Cw3hyPMlO2xipYPiW9z+uuTRpUHEn1MhSJsrJ0QiiD9DYeD22qTTPDC3tJX+m6cIyr3729Y9Jfg6eyI3QzQTqXNG35Zy1hOHSQFJ13CS6QKJE3lPsodOPE/PvqgISJ/VlhwzfWuWLByw8u7jEliccog2LoTxOLvkZj2U+QXHm9fJFiGC31tD7feGH8VzuP+mivLkujv9JOzxyT7BRs+sAmxETNg2nPaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb0bAAnPxRXpBQWpgcgKKuSuw52FHuO7DAGM1VqsDfw=;
 b=ARk48Bv39P5Of9rjAQB9h1jYEJLC3mCFYC3bdXAYqHiwPKAovx8KyO/EuOc1zG6r1dBESlmXeYmUvzEqo3EFY6u62PTwdG+7UGgMYNlKdsng1OuVbCTRvjIpZxiGTYIHcRcLLpc/5etOTuo6OHYY0R7sci8Uls1R+3/xWeem/c3JzaJWWTQg6UHbtJeYzqjSRJKp5nTf1ffCuCzpCb/x1j+9GtYIVLJwCBZLxRtA6wXLMO40jcq5svKDIAVxZBHhY7jiW6wyHWn8iFcwlQu3GNFR95k5CzaI8J9ZuPHGp0so8FkcYYgcO/p/reNfmBY1wnk6di20hb9w0o3klFpxpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:35:32 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:35:32 +0000
Date: Wed, 20 Aug 2025 10:35:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] media: imx8mq-mipi-csi2: Implement
 .get_frame_desc subdev callback
Message-ID: <aKXdLAdWxPfwhDx0@lizhi-Precision-Tower-5810>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fc651e-0353-42f6-c581-08dddff6d153
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?UI4bGFs6JIz/dB8iqJ/QIAmvF1glJn4AJSqoqssQoatAOMhUucEUDaHbA7J4?=
 =?us-ascii?Q?8hJt9VqfmVN75S25prd2Qbc7u3OlPvcBXiHzPeodHzac0aKYnyRdG9RYE6l5?=
 =?us-ascii?Q?4WrNt284wcZZvMunInMjQTLm5FaNLegUwtiXUSEQufBSAzsgGEZbOJC6sVyi?=
 =?us-ascii?Q?inNB9x0u9c/wAZzuyMmPUFRm36oWzF7wng09q/iqE/kk9MfCWCqIUX2P28AP?=
 =?us-ascii?Q?HDXhIYGbvw62Kwq+6q81lD7YWpdaObpXWhqgHTbQmin0JiDoB8Dx434SxYRI?=
 =?us-ascii?Q?vjgznn5vrlxgnrDXqT8ZQoOFLYejPcH1vHFUjYv2KhfCzUy/HE75MNYbnIG7?=
 =?us-ascii?Q?9pYMRTkkwHhRfWvGcaGt6BZTInID1QvVsveqYtN6WvrPby3afWn+T+w3nk/Q?=
 =?us-ascii?Q?XVrFVO+cgGaGB9DkzrQ4ALx1eHaOzqnCV9hNDgvyDC/cVFuEvVEvJIFuhOZY?=
 =?us-ascii?Q?nRL2axu6O7ijfmXntBIgKMSLRn7rq4Jr1VowMFgbhz8PxYjKCBbuTVRMZiLp?=
 =?us-ascii?Q?WVxM3vBlx+S13NCK1kq6HZAfcDKyWcYZOPPfTfUib0uSlaYlK4qdzWVj70yC?=
 =?us-ascii?Q?x27adnEbKJhjzuusUZgCspUpocpIBDkwqu+CTcUrzzjDF4rzPk7bHW66VsdF?=
 =?us-ascii?Q?Qo8SaUlRonk7TBJ2Ic0w9kMsDZ3X6MW774W3mE4BoAORo1Mrx1SeMxlTS67r?=
 =?us-ascii?Q?8QihnSlquJxxWqltlp5Bx+d8LVJXlW6jhVadwyTlzrQFuuxveTO/0ZrryNVe?=
 =?us-ascii?Q?LIta74kvaYRAEzJI7vffQI1MID+ngUf9jVmp/zCZnW3LZkb3ePTWva/zQyGW?=
 =?us-ascii?Q?UVezYz1R14EktCrKdkT8ipU24mBxJKp2mlGKUYWT9k4XvC5oVzELGMOp9iSt?=
 =?us-ascii?Q?iw3DkHKJJP31Pe+w3sSBkypMZzKrke3OMRCDLYYXtMgFzAo91KxNFW4H1jjH?=
 =?us-ascii?Q?Y22J1YgdjTzgWARGYYsYHcE/H/SBRqBgBaIIA4XuDhuKQo29b9zkOJytKa6F?=
 =?us-ascii?Q?rgmHAdO/qj0Uvp3wZPWYEtljfm+jsI8GxbxACcyOOsODH03oCWx6PUXbPPjd?=
 =?us-ascii?Q?43XAX+o019Rz/ifYIOL3UFc2QOpdq+gghE0elwoQ6RvBJRX5vozkmiFCIsQn?=
 =?us-ascii?Q?ayXf9IKhRhkBRXFQOp6fr8UoKepbMmdUyAANN3XVzJEDBDzBkbmUxbR/5+6U?=
 =?us-ascii?Q?eCvOdzNBN6DqVlrQSioUamXzG00ZrdHgNsaoSz6ac/SgYWrJO8e0Z+c/dpc7?=
 =?us-ascii?Q?m5ZuqQo93Bg3iZD9G+aoczaEQr49XKmHdIpTg6m1In8J4fm2saLW2v5LZvnW?=
 =?us-ascii?Q?NNpv+DZJdlwcwFsZw8Lr6g2CFOZIxxPkgjlU1eq2g4cTXdbGk6J+Y+A1FYQz?=
 =?us-ascii?Q?uPM+VgvTgNRin9Uv2DqA1Utc3Ohj+sxXrT3X3MNvz0sFCwhBisMvVbkzoLuU?=
 =?us-ascii?Q?Vz4dIFgvMJcuRRjMVN6vXY9zZOTP7k0zqvxla9kiilQEMoqKw1bF9A=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?p6C1FFWuEeGtVuw6lezbR6M+jDd3H137QeO94ZlawR938t8Rctp2t1ecQdj5?=
 =?us-ascii?Q?LdGGxdDpAFCAMssOPnNQgp1YAUKBfajO7sc682M7LFwp8mOBohFjmqN6uI5c?=
 =?us-ascii?Q?k2fsaioVu0JSeSjG1oyIvLLXDep3zBzacD+YwFdZAAxFvrJ3GQgZn0KKxwwZ?=
 =?us-ascii?Q?AAhX3AhOKlAnaMp1RFu6ShsXRMYRB9V3krqEu2Tl8rZMwtvVigGld0ZEVyTt?=
 =?us-ascii?Q?0dcMeRYIF+UW1RhMokIn4hOX3dnaYeVZcQC32XhymBUzjGtCAwOjDlbqTD/F?=
 =?us-ascii?Q?bK1cIvXvBfq1tVEhcrR1MR+Q9U8ynwi0vd5GTt/vjb9qakMb4JwEi8OR3RGZ?=
 =?us-ascii?Q?6hAwk2x5NWpPyNQWvrDhggT/zjoIYfS1PCDRhlNTbg0XMw+0YiPlgZkxql6n?=
 =?us-ascii?Q?p4T6HOABKP50XgASybp1AEcBz7vAeDSSZrBFvm0XNRVBmOPxYsxavCxqe8NE?=
 =?us-ascii?Q?9zzXqmOKLXTA8ZWYHPgoQxKx3xE8j3juJ5WDzF5qACzcqaYr9n+3Om31qF56?=
 =?us-ascii?Q?fN0AUJZnHWaqB304I5CpKSCrljHvsnQAAdPbeCmLx+GfCEfsNUNw8knFPWlO?=
 =?us-ascii?Q?+/LlBZ5YhVAylmhvye6+wIUteDhGpt1th3Pxb3Viz+aVLj0D2Bw0Xuxpiuo6?=
 =?us-ascii?Q?Letju8a6pPYWqY0ewb7hyeBI29jMBwvUFtEWIo1R45vbhj2GI2vRifg06Y5P?=
 =?us-ascii?Q?5U/Esx/XdrEBGbwoU14DPamFOcOb3xCUH7Wbz1/ZhiW/jads4/b3MqVP7hUo?=
 =?us-ascii?Q?SL+1IiUVp3D+LK+UMyzVsZfXIk8KTzlronKIgNlBXpUAxjVcj7ht9cbgqcpr?=
 =?us-ascii?Q?e323Gio38z1gS0Z9amjUAYWIqD6KDky1EeHUWRshGLztVO1M2tEjvRtZc0Gc?=
 =?us-ascii?Q?T/J3vrUzBjtdUL2SOIKXWHMQe4KG2GRZ0xPEuL6RqTivqrmZO21S9kMTu+78?=
 =?us-ascii?Q?eNGoKjeLXqDnJ43EgLfFn3/nKVCpWf3EOFhawr8EbPvYLuyks4srmOjBHV2i?=
 =?us-ascii?Q?inN8ZbBm5FklpnQQzRgEPYFfEWRpmwIZLLvQHOgO3QVT+jl8cwOP4IPE0m5+?=
 =?us-ascii?Q?XAasNPOcEh+9zvwz8QFq7NWPgzsx3ZwSOlQ25HtR7OXVecLB3Kc7JolPfvvQ?=
 =?us-ascii?Q?kA22gn/bE8iYUGnRqIfW0QLFl2r5EyNF6X9glx7QcAtJvcSnUxrh8dxVRfxH?=
 =?us-ascii?Q?Ua8UGMCyqIt9lAW1oQbtYGEzaZulmtZ4i/nHMrF3MLkR0765He4k0TzIuBum?=
 =?us-ascii?Q?dUWLi8JT+sxW9L/mPaSB+5LYr5XNOZrq6mr7/f9as6Inx/s6pt4t2ZrByQH7?=
 =?us-ascii?Q?KQftBNAOGSmYo7Tyme4bduUqPfQ5GRIo98MGprwT+Lh2f6AAeeBa2SdpUsXM?=
 =?us-ascii?Q?za+IWMuSqq5ux7KJK+c/aIuSMk5BeGE3Wzi8UP9k1ywiRYrIHn0wcemaYgzW?=
 =?us-ascii?Q?kmxHVMCn6EUC7+zut5Wd6eRpFR8nXz8iUCWPad2SBEJVO3YhqOAgp1KWfD2D?=
 =?us-ascii?Q?JbZt6WSCTNMEMBngzfamitzV8GkBqc7UChYarPLH49q9XSNhbH1trrVRrIx+?=
 =?us-ascii?Q?877WWMVJbmyheHTy5mUrOUyAZ+p+sUlbyFHwIq9d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fc651e-0353-42f6-c581-08dddff6d153
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:35:32.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7ZokLcSQAjXMuLKI+UtAR7hNwkU/oT/cHMWxf3yode9vX/tfUd5jj8ol6NjHnjc32N/XsQbXVK+09YOPFwL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

On Wed, Aug 20, 2025 at 07:04:59PM +0800, Guoniu Zhou wrote:
> Implement .get_frame_desc subdev callback since downstream subdev
> need to get frame description.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 529928b94a193e02177f8773a0e68375b59b0a08..a28ccdeef8521c0e00d13b1860eadef5f2118651 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -648,6 +648,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
> +					  unsigned int pad,
> +					  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> +	const struct csi2_pix_format *csi2_fmt;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +
> +	if (pad != MIPI_CSI2_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
> +	csi2_fmt = find_csi2_format(fmt->code);
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (!csi2_fmt)
> +		return -EPIPE;
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	entry->flags = 0;
> +	entry->pixelcode = csi2_fmt->code;
> +	entry->bus.csi2.vc = 0;
> +	entry->bus.csi2.dt = media_bus_fmt_to_csi2_dt(csi2_fmt->code);
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
>  	.s_stream	= imx8mq_mipi_csi_s_stream,
>  };
> @@ -656,6 +687,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
>  	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
>  	.get_fmt		= v4l2_subdev_get_fmt,
>  	.set_fmt		= imx8mq_mipi_csi_set_fmt,
> +	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
>  };
>
>  static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {
>
> --
> 2.34.1
>

