Return-Path: <linux-media+bounces-45270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96789BFCBC7
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB410188B50C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5D7347BD4;
	Wed, 22 Oct 2025 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RM2T7Rcp"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D97335BDC8;
	Wed, 22 Oct 2025 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145262; cv=fail; b=fWNGMqf54cCpwMD5DGJytYrXJ3wn6j2xKxPE9oVpK2Zv3Hu90hJvL8tzVKYTYeAC6dCVaaAvEzVcNsfNKqfkhs8ka3E+fwdjZZbabO6eFbQOfN+pDIInSMcYRIf3IUvIrZUhDw5AXzWRnmHJFj1gW8ewDB5nL38hED4IFVbKEoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145262; c=relaxed/simple;
	bh=kWyrpmiIZbyXFLjc8yIhFvc2hBsmEGNfEUMItyjfGj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r/1mxuvyGbXY+rDS4BkmGZqJT1zDgv8vjYsZTrMWwURTY+0J2X7dJ9QaandZOlECGLKbEF9dPxAUcnugvPuLt5j/YnDODEvf8LURu/KHhjq7Erh2uS6O2oM/aOXX2o4BpbBi+o/XDcLvZvLwtnwU+rpum6VknhDt5yJAqoc519g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RM2T7Rcp; arc=fail smtp.client-ip=52.101.69.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgOvBYBq3YMx6z3xSCtM4gMczfTkrIAi0gsxi2UgGdW/BS6pffgoCvRYAXC9YYQ6cqipN6h5P9JlcJFLQHeLhKxpihXB/cAP2CgTL/jEIjETrKbe2ApMSGjgihL3gO4AMtrrwvaPTLdABBagC6qi9qiTIAZzE5Gs6XWAo4rCsFgXPwUopqhR1IlGy+/KKCXzFz7chW3TQRx0Sj8L+7IZbDSol7eDopX31r99AXgK7tNOfb8Iq+J6W71Rj/mDNwpMmtF+LJKwIuNyaZLIG1rtazcTMbEoN6sePZ9FmhXBx9gdJ8Cixjcr3kjuxgENTvmNoP7qjXIZOaqp9mMyc4RD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zYgOtEj84sK2mj8xk6F4ETVBitf2cz+JRG9Lb4WgtE=;
 b=cEXIjq1YKnz5su05iS9CUhZjgvLnYHx/Mhujt35d5fSGMtaKrVhMKdslzUTAP1r5TYU0kfgJhHvxKhsk0HERuDdENdfQbSDGSxFVdJeJcnkH96E4t+gOI/O8+nmzeSnYIDJSSOdhEJ4v/yttFQnHSrc0kw+CaAoWVPTPYvH5+q6RFxT0DR9y6PlDflzNvzHEhgr42HjuzlvnPP+eqanW45zamXhZ+ZBak8Sz68Q/mhR4sZm2oI8gjJ0OaiIa3E3jHQ/FML6lwKl8AxmLw9maWP2ef5ubCzWuuIYyQrDinGMKV46uKL/QOp7wvXvee20KbSyynID08S/0LtQSACHfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zYgOtEj84sK2mj8xk6F4ETVBitf2cz+JRG9Lb4WgtE=;
 b=RM2T7RcprOFvw8BnLEronLku1lBHFGQrb0cJfR4HpbB/jQ2vdsf0TbLfq8aqyvgeeRPX6AMDSXAoEnZf1oI7+oAGJL6lpMeaokYT6mm/UXg4/RJZJmJkKg7zIsVu6U+KM5zo+gLY014ysu9UOzoeNo0K8btGKFBHEeYeXN/AES/tuUSwJ0PXtZQdtWU1olkazYycIxOzfWStc5bLxjlvTmE+/ClBhqXMuVdrfi0dgafXy439bm1ygmr5XAhS9txOgK0a9281t7+E2ChZ8bVIfbDa/emt4AVHVbDheZsUFg53JSMf6fvJ+KyAcf/R5qOQrCQD/+BmDdkJsunklmQBpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB11540.eurprd04.prod.outlook.com (2603:10a6:800:2c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 15:00:53 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 15:00:53 +0000
Date: Wed, 22 Oct 2025 11:00:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, kernel@puri.sm, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
Message-ID: <aPjxnNyObapdFyVh@lizhi-Precision-Tower-5810>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB11540:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab709da-22b8-423c-22e1-08de117bcc1f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?zaYGFZDdRMF8g8peK2Q4yn3OGSO74KN4umfveJceOQtumOL4OLs2KB28KMXi?=
 =?us-ascii?Q?CXrwWeOl2rJkSw5XQ9MtUJe41EWlhszz0I2luDa1JzND8YJpQhiSZ1IfZhE6?=
 =?us-ascii?Q?lmHLWhfFOlZUDNvFH7ifTYPgxEi73v1zWAU7DKFI/OjKa87FLcDZuGfhwG24?=
 =?us-ascii?Q?BwJDwFBVbK4HxBO7oiD115W2U0Vw+QNoNPiAGBm3AdCoQwssI6Mk/MfBLb85?=
 =?us-ascii?Q?/P+mCjBZ9m0RPD0QV9KkAGibJPSGE5KGrc04EEmHqJC71dtxkdymVQl5bwyn?=
 =?us-ascii?Q?7EG5iq+kXQZBCtTYPffz9+ek/mVpfZb7vcPd4V5oRx2V6Fn8Ton7OfTkh+i1?=
 =?us-ascii?Q?XExd7MeZegNbJdsa7t39EmhULsM/r9noMOoD2z30XXjx8iFPQOUJW8hX7ze/?=
 =?us-ascii?Q?5BpELxgG1XnXaa/f7ce6Qx4eheAWLDQFqdcXZ8qDQwhxOFQkE5GGIrS9HMey?=
 =?us-ascii?Q?nXAHfrwnoPnbbNxhGcvwOncXnJ3fj23mhCuWohHA0SAxLnGy58pi/w4JtdUp?=
 =?us-ascii?Q?+MTk/pqW9ru0ut0+Jx2heiv9DVNuo4x1bYOBaFndKixJRCoapiACQAIhmKQb?=
 =?us-ascii?Q?XCAPs8hK8pxSMKJTb1RiOZHuUbknjUZOCY1lIq/lG6oZOlb0ig89PlJ4ilJ0?=
 =?us-ascii?Q?kd5t9yjNhbkEyc1RetAsIwj4fw3Z2GyVXCrILTf7FPiI6kE4PF6WVivgvWiz?=
 =?us-ascii?Q?cFjaU7nQflxLfW3ytiPJFdgo586b4KRuVwxiVQywFRnpkxcn/GXGDu5oTAY1?=
 =?us-ascii?Q?h5XjgLuJ60mKkEgXMCgJby5qOM1Qb8mEWEQ0PJT7JH79gXgEIuUrRWTb9wCa?=
 =?us-ascii?Q?hoR2hTd10FGgUva266Ek4anprHphtCac1yArVOEAoqOJ30MuRqjt5L/322AT?=
 =?us-ascii?Q?/Ecw4qwLVGxHUaZLins0aTVm56dRNzxkiDXLdSnSf3Ah2k3l959FozR9Afwt?=
 =?us-ascii?Q?DtcgCFAdwRGCllq51o9DyIefN7KJt73FXXTpimI+TgCCgDfl9ofW9/4eBIcm?=
 =?us-ascii?Q?5tCFGJRWi1cmRwcoFQnkPdmHbrWF+OojOr1fSma2thhTlchEwPKaz9kNbFQh?=
 =?us-ascii?Q?xYAMF6eZooEyguWbO322qbIF3VYUgL+afgeVKw1mVONgRlVrBmlWnj3bMs2+?=
 =?us-ascii?Q?djRF/Zsxskr1jIZqJTLLgf+wYhWC3wUzQTvsqle8zE6TYPrC7Hic2DchyC9L?=
 =?us-ascii?Q?IxBsQC+5QV1jA0Y6zJHIkj7F4DM3L1P8HzcywwqLdb/ShmMdWEv+pk9QbMWj?=
 =?us-ascii?Q?hVDaE2J0a5qS2C+d5lCBEIzpB4divXEEWRL+XiszoCJQTGt/yRdSSkkc9VJy?=
 =?us-ascii?Q?BnpjY8Gbca8qsZ09C63jvGO6ICOGWRRG4mGeGpg0e9G7LuJr/CtKbKOhH5Yx?=
 =?us-ascii?Q?It/+HkI5GXZ0peO3SEq2kSN7kQfHYRCHaX7KYv7+bGS3lYBRROW14nlPUdlj?=
 =?us-ascii?Q?59H0gyxpYHlDi63kulqg/VESjeCqjeJIJBU5lt3Cy1Sulo7E7KnfO4OVcIwm?=
 =?us-ascii?Q?ufjmNjxrDMYm/CbzX0n8w2jx/RQFkT1bsT+2?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Y7JFCdgdPs37ZXQP3rzfaW0TbS2Duw5ljXcxiWpUDElR2Y2J+RfQfKLu3tSw?=
 =?us-ascii?Q?S7l186uXMz2H+H78Nu/zRXQYjMyNCo8aD4sPFzmwFF6wvc37qAoZJuduxJWj?=
 =?us-ascii?Q?FRIldctADN+vWQpWVDxzw1W0OclCeyOyy6YlleT3BuQUav3soInI5rah7Y1x?=
 =?us-ascii?Q?ilLx1iOXHoxYNLrpAAVxVuE4gvF9zFelzh14P4QM5s/R2czyMdm+kBmRaVa0?=
 =?us-ascii?Q?LjAngpElleVKyvXkpDvjVqyU2Hlp4aL8JyXcg4JkTt927Wx7yNFjWfq+pFLR?=
 =?us-ascii?Q?8rG72dJndT3WcbmM3zBtE8hHPLCmk/d56C3rLsvBV7is9a+f/HMGsbYilmNd?=
 =?us-ascii?Q?LYrpNp2inA0s63fWWvWVDuIpxIMh4F/z/htmKcFL/YieVGYiUMyupSoibcfG?=
 =?us-ascii?Q?jq6CNICdslbVt5pafF+kJ/t0uoWKGWvLojDX8e3AGBgqRBXeuAdBdavxKcWc?=
 =?us-ascii?Q?P55dQ4/bPrjzCvic5AYKgOEP7388bfXNT/U7AmXGRCvaZ6bSfu7ScsDcSb7+?=
 =?us-ascii?Q?HgIFlz11WXCil5vRC41jPe1/OG8FGdlvQjC+f32WWGARPGK2p+5nbEHukYcg?=
 =?us-ascii?Q?7ETSpGwpsKK76Ts84Sk5PNXj3NRSv7HHPWj90dgKKOFzGNwYxGW+FGUupuRd?=
 =?us-ascii?Q?ZCWLSujIKoAz3Yhx7CyRbRkVxRMcHVCSrnPOTnaNg9brn5FNWR9B7sWZ3+vC?=
 =?us-ascii?Q?zj/Zwb50R8Qe2RshcFnGbYQ/lNdNK0RZvGbxRfcgZmLBrZUuIwDhR+plFvvG?=
 =?us-ascii?Q?zKyCihZSazAzweOkYwwocPLyfb1DQX1Nrgy7pf9h+l6VZ1zD3GWoe3+kLhog?=
 =?us-ascii?Q?6jxurrAuI5p1HD9jtqm/yWs22MffsikIbB0mM6aTrvCueNQy55ZJYPsQReIR?=
 =?us-ascii?Q?fRaWKlLnbRVQJ2nN7JO7inQ+UW3Rq+MuRYlL5ybop3cT4Nv6xoVp4xEkht6+?=
 =?us-ascii?Q?uKEnZWq0Eb/dfZqVrvIP4ExPSd+g1AQMFfuWtbvSToTWqe3mI94vQdF29S06?=
 =?us-ascii?Q?ZbFHJmWkGzRiqy6awl802JILMbdH6gAn2wIzwyB7oD1UJ/rUcJP5BG3vogai?=
 =?us-ascii?Q?9aFNGObgcxypc34r5ffbDQxC0bQKxCyWsBvA7C8HvbfxnnHVX7f81jNm+Pz9?=
 =?us-ascii?Q?hG4/LMjhKWGqm9IkJw1IJTVdMkDfbqS4cHkmDn0YReWhEZUV6XsNcIAjYcZP?=
 =?us-ascii?Q?5Kp5Yb8K7SUeqm/oPwDIjtmIAa4XaWjJZi+WkBn6H9zVmsMJOsoCXn+Fqyw5?=
 =?us-ascii?Q?My95qLCQ82Rp5/WhwfXS4h8GhRvj00PuPkueD5Mej32nA7R0dZgAkx39Kpo6?=
 =?us-ascii?Q?FvHz1J8N13GZ3zj+NnSb8HHSD1Hfc8pON4+Ee7wKaIWaPeVRlju7kMKcHCta?=
 =?us-ascii?Q?13zqmzlA3JgMZXpKk8ULPIDHcdzEzjhNqvUSS/5cRXtELXoK3x6zJqSkI4VH?=
 =?us-ascii?Q?XS7fOgM+mMm2QJYeZwmYgHRQZQ06/Bi6DhanfhDnzk5RiVt/eeHMm6/LHSDQ?=
 =?us-ascii?Q?ahFR9EjwAQWetL0aeRxBZGVW+UWt5CYzaBE337vYuCwYT5CghjNWKmo8VRkN?=
 =?us-ascii?Q?RjRUV4VME2zsQPtKdX0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab709da-22b8-423c-22e1-08de117bcc1f
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:00:53.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3jeQPT5Yy1TcazPOwLjk778u13RM1VfCcibYACf5l/B8M/cQEKY1OL1LJ5qm6oeDvCUjL1Vk9cc5TDyzwKOfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11540

On Wed, Oct 22, 2025 at 11:22:28AM +0100, Isaac Scott wrote:
> Call on v4l2_get_active_data_lanes() to check if the driver reports that
> the number of lanes actively used by the MIPI CSI transmitter differs to
> the maximum defined in device tree.
>
> If the number of active data lanes reported by the driver is invalid, or
> the operation is not supported, fall back to the number of allowed data
> lanes.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;
> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;
> --
> 2.43.0
>

