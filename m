Return-Path: <linux-media+bounces-41722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D209FB4259A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6682E7B21FE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776D267F59;
	Wed,  3 Sep 2025 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHQh0vHF"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18124679F;
	Wed,  3 Sep 2025 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913735; cv=fail; b=trralkMRk08RRHDLyKqikAz7XcIvBb8Yv6VED4gfRPFbwtcl8HxGAWaEHfokFLed9+TaXkZPzRaNZw0MKB+oenSIbF954YnyxcXf37J92AQJF0sKrq0qLa4VcYt0TrUUCByrdDxBE+4KIs9uxFNql3xtTWvyhjLYkV1glZrVHIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913735; c=relaxed/simple;
	bh=Mjqdv2xzBVL7g2MF/ZT09Xk4gfpwlAVkZMr7IOJI7oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uNRznWza0yF73xKxD6mW7Drgbldt2OoMFVqHCxsp5ziJs39G+2MxwVW0DC8sqSYef8NN9POLG8olef8qhMizXGHDOy1uf37jPcOONPFkqQTiws+CsfzzE8Gloiqz8sG215SNX/WLKj5FkRtfirP1KdZDTLrBRYDQZ2RtzpfKCO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHQh0vHF; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j65pxKBDVvlaWdjqQVBvYx9ty8yc3tWsImKRqNBCN2QiHJtwAH5GcCYsWdwb7lV/+b8xaW8OcwaW8kyuVYWvmAy/vq34kl3QEG00+MdSjuIvZFDUbf9f5drdHLStnhpvcBBTPJR0spRKpuX6NRFSbpXnq9cTdNvEqUcdL08nvNzgn11HfUc2nfrPd/oHPbHaVN/r+WMiVpMMzuLosmi9d2OTwiJCdWR3jHWlHDmoXEhVEU6qGlN3Y4H709hPHCBgGUiJWMnNmphHaUx0Plf5idLBl0IjJsQcSsSxLCWpQugn7ZZ6nZuxZzRT+QETdGKOsUt2xAwrtb3szlb5kJhF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVbR9f1dZw8WxJlB7rT3Bc5mxjMvHLbvFtUDyPqZMFs=;
 b=FTAZUM1ITDUotoXBNVsKxTg6S2ZMiKJ6cMXDRP8770IupX1AM+ZYVrxlPvVsms5TdjVKP6nZ+xolvVhrvZEC02ZDis925db6b7Q4OdaatoGeAL+pRUmpOdc/9LE/U5ky10vAdHRA6TOcygrQ0lwSyOEJdErupiVI2yqn5aljeFZJ34CLuwZOu6M6bJ1dvsZTYP18k8fkUBn03bgX/Lai+pxzxbIhNIXOrO/z3Z+dHgcYxcU5v2pbSg71plTJNcwv2cfeLzQNrvRuFWyvRnYCxe7xVWrrO7sGC3gPN+yrPkGuQyS5VEwOJJ+UI+PM9JH5Xnrybk7jtx6PHl59oLGFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVbR9f1dZw8WxJlB7rT3Bc5mxjMvHLbvFtUDyPqZMFs=;
 b=hHQh0vHFToaiCZ6NXl5K0GJBIlTqfVjuw/IWSuf4ZwfHuFbxVkhwIm3sgsABLazplwLVo+GFn/a33bHk48Ctfhn1tkuIW5f8+ALqn4Kej9kHosVlI4BhYVvALnG+xer4x8WVpCe+dS7OfiCLcC+Lm5juzZ7/dHDdW6lAjvS/R9v+u558VwTsAFN3CjC026bqRTKUHzSsU+8hgxXZk/xvlpvP7DMTmqM1DZYDqhTuJs2Sa1ndmgegeFovf7XZ2GMiLKlTZyfVdTD8oGb6UmcIr3slZpBcHQvQ3tq92aSXNuo8OW35iaylWcxMRW6P9aYOw7OFkSlcQzpicbmA0mdXtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9520.eurprd04.prod.outlook.com (2603:10a6:102:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 15:35:27 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 15:35:27 +0000
Date: Wed, 3 Sep 2025 11:35:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com, mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 3/3] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
Message-ID: <aLhgNP0UMAj3Cpzi@lizhi-Precision-Tower-5810>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-4-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102243.1563527-4-isaac.scott@ideasonboard.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 003c7b50-9f58-42de-870b-08ddeaff81e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?01mGEFiaMYHG0yNhJXA07So/C2jLTilNIfB3leyxhpmp8UnHi0lTNMw8eCOs?=
 =?us-ascii?Q?egXcCyzgdGDkRdl7TlRrrnuUUV/1wGDWXeN+fbNXLLZphgOX8iPwyTkXDOkx?=
 =?us-ascii?Q?yOUF5vRs/maBF+Isnx7h9x3Ue5/HH7ZgQ/HPDJhI/2xX61tpez2GbvH46S6I?=
 =?us-ascii?Q?JOYEcJRq3LfwCeC1HAL3HQqLViSz8x1Zy6a1L6Sh0OU6itZ4NDQit7Czf9zj?=
 =?us-ascii?Q?ZXVLbguWZSp6l9Rtv12DVHx9iJHaO07XI48Yj4laoxJCdY7wdolLz5mympC2?=
 =?us-ascii?Q?33HMj7NArwPtwu/lEKEBOxNShgftaMIJJclea14/vaNNz9cC1r64sFJ9IGBH?=
 =?us-ascii?Q?L/3BrDtcHXdtRvWvRfC2a3W5CzfL6kgTaak3lVlbL60wd4bMGcnGgEHzgnA8?=
 =?us-ascii?Q?7OsytaFrQjleMVoSNufL+uyZHLi9L9j6f1GUaZOc52f1m8GFbqPZFYvFF812?=
 =?us-ascii?Q?eBRuR2kOh9NsxnWgGJKicU3Ce7boTU2xR5b1KdKZPBbX+snbl5XzaLwlueN4?=
 =?us-ascii?Q?HR8svVoCnHtn2sZVY6CRGZmd/RUHgSqQWfn3TUb1SmjrZi471oemXBqZWjsf?=
 =?us-ascii?Q?X6QkWlO2YR2twiQVASFTjOQ8ooms+XhnvW7YRMeCod4YpZJ3MP76s87XIjSA?=
 =?us-ascii?Q?Ppq+MQ6HW+86VzJs8L6o2YIU27IwPYcMTm62Hz/6Hnr8X6zWntQrK2doIZ5I?=
 =?us-ascii?Q?9BDPLNoWqedM4dVEdkrvPvUHue+0p6iTyQSCT4xJ8MQWaWT6YDU9IC+Bb1BE?=
 =?us-ascii?Q?jENrTfwHDTjjtX6iK9IDM3I5YmIiUSfXeOWHbUlri7ypFiBE+CVXKUBaN5xU?=
 =?us-ascii?Q?RZoC8GSaXGIK6uWJoGIrT63r2VnvaUXJSCgtneqFeH6XK5Bm2Wfoy/wTYnhd?=
 =?us-ascii?Q?MIOskJvnFQvVIldeUr85ofINnJH6i71gBndFxcZ3nn2nCuwQLk7jVgKN5iTb?=
 =?us-ascii?Q?E7HdQwg6CIOPYyZAUPD1AmekVGJtWHI0cAiKY4lFkVDdjDn2qZlrXNCqzV8Y?=
 =?us-ascii?Q?V/tsQcmx/zHdIix5MGfFJv7yjh+qnB1isVW9TsRnmawqanPsxoUrh3+uSKiu?=
 =?us-ascii?Q?JVrXKfHf7kS1QrRYLBnY60pOPPiISNyeITdYbX1unfVU904+oJ8ZaIvMvxde?=
 =?us-ascii?Q?kG5b5lUo4QViVYr2Xinq62Ryjgn+UWNPE+Dm9+fHJ0NygKJo2jeyrrH+2yfl?=
 =?us-ascii?Q?NRWoWy95/8bI+Y2Bm7Zkne2XTavNBHN3BELNBjkEZ7hiBoP7uaZdsvUyV4X0?=
 =?us-ascii?Q?gxLJiDjV1+DXgsfmOPRSve+WJZT9ncKyq+WjGDhxnYzny4qr1nvpBhUp/5T6?=
 =?us-ascii?Q?ev8NZ3j6v6Bhv3qe3ESrLwyTvin4I5PVRrEa3mTOqfS2r60ctl3xvZg2yXT5?=
 =?us-ascii?Q?O38/zi+SaMnhD6Ss7yh9n9dWS2ltH2fJ6ZfcYFnNFVzu6fNsHBvFTNw5VyZs?=
 =?us-ascii?Q?/HcUkc5S/JU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pYBoWlAZPVWACTgkogUK27B2xzlT11FtHjI9qUOEnEhJm71sQgS7ahGRp7La?=
 =?us-ascii?Q?+0o7f+INQGBDlLIcktUQ6GKEHEPm86hMjocOoW5tORydsEG+FqFBLLjCBUwj?=
 =?us-ascii?Q?ZK6AjN1FP3d9l19dlmoZu/DAkOZpsJIuGLOPjaiv8n1U3B7FtV3Gw3w1PyXA?=
 =?us-ascii?Q?fZJZIArk+s/Qc6FQkD2EWakRuf6NZatJeCqd89TL8KvT4qaGYHvrRGDy8r9E?=
 =?us-ascii?Q?4UN5oZjdNQUVHTNRrxWWIT/dG0LBN2noHy1cW2XVd+WbyhBQceu9caR1gyzO?=
 =?us-ascii?Q?2tGxvGZoYLa/VUMXkzlA0z3bLbP41YD+91hEHOq92T0mNQxugidcguIe+4YJ?=
 =?us-ascii?Q?atuytOfFL4BRNmGEJcSoleSOM0AJpFnsfiTrehcTbTJRMu9Tm2gj4ksWsQtf?=
 =?us-ascii?Q?uPbnnxRKihtwlZqIoGzuRJO5RdRWpwgJ0D2skEeA+015IgoDauwi4h66k8df?=
 =?us-ascii?Q?kPr+4PG7IFnOa2YJKMjWT4oEWh48EPw8E/HhwgFFm37Y56i+dLTnghO59eJU?=
 =?us-ascii?Q?M1DWteib9ikHcB26FTKz99Oy8jJ6fPKxr/PUcFL4p3pQqEEtGtufnLC0qTTv?=
 =?us-ascii?Q?sbQm+1dfltzi0VMQ1xKxu1NH61Egp5uiTmOVyspdQWpWiuCadWVPG4w6rBD0?=
 =?us-ascii?Q?fOFQRoSRjmMw6tcWXI66Pped71/XrkSx5kQM6npLquO0xyGNcQdOulXPyTqD?=
 =?us-ascii?Q?ZdIlJe2bZvlykAv8REu2KdPMqmA1OZtaIJbn0NqCL+eqhQ9jM7cy5G+h50sP?=
 =?us-ascii?Q?R7wV7XhFZCuY8tDIVln5Mnn0uu1AaqdcHLsg5rz8NEMS41RIFfMRV6IU40TU?=
 =?us-ascii?Q?LDooROv4pIxepafg2qXIvW9lac6ECoQAnGS2d/jLyfkK2HXQID18JA6hEhuF?=
 =?us-ascii?Q?RogOKy3WrJ1e/l3PzOHflA/6o/tvypIe2uMjQ8RYNmGttWlj11OJnZIuqB6L?=
 =?us-ascii?Q?296PPvai7pG1U1pYHvJrS0QqC5Ml/XHeJVcidzctrTT6sCINCzq3VL0ZhYcC?=
 =?us-ascii?Q?STTdzBnKYjWYNYPb76XgOmrHOyYJOWDPrltAEWi+Rbwj9KwHZZsTEX5X39ss?=
 =?us-ascii?Q?1TJi8W+uzC9WQbUu0XEdPz6G30J6nSrPhk5CiyCnlpCLPYvDeXAlBA+uP/Od?=
 =?us-ascii?Q?cmhyEV1GzNNvTMEnSFv3lowmCZDipAMecaGB4hzigS8X2blwsZ9/UU6eWL/W?=
 =?us-ascii?Q?czcMGUm0x6mgVDh0DYpFidH27yCMwQFRO3VYenKQgNKjyHxqYEPqqI1tsuCS?=
 =?us-ascii?Q?iAl7NcMXb1u9JBWHoaxlgGe37w6X0eYZ3oHllUeS/uXgILBkFYBMR6I0Vr97?=
 =?us-ascii?Q?wltrp0otaew9de7zihPCaoXbhiwP4wsShVVgub6RHLdEDahaOVBKrx3OGwHG?=
 =?us-ascii?Q?sdx9Qw4rffJg10DLqn2Iip7nIwFtUw3ea5swq+HyCCO6o2cmCgIsZmx8mf6v?=
 =?us-ascii?Q?6fHQORQuAneGbiwhHn8s09ofuwV4dxYpxvcy99kX+6IlAgOGT4LSF84y1dHP?=
 =?us-ascii?Q?AsdnB1uN37pY5jeazj9fcccJaoZUIMjuaul7vjcpQfEs6VJwhwpmPLa76JJT?=
 =?us-ascii?Q?3s2Q28Mp3xRD0+lXSV4ONv1N8V3qrHRdTYtLUASxFm6zVzY3PEUl5OQDkB6e?=
 =?us-ascii?Q?wMpd/nSmArPyI3CeTRUmi+VnQKyYUgIAHMfUU4GXESEV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003c7b50-9f58-42de-870b-08ddeaff81e4
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:35:27.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbNUcWD7sMC///YaxdxLfC0Dj+cf8g3JuDCHOrjLcXykDWwveIkjl9s77CL/XakO4y9hop3YyQV9shXoylneRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9520

On Wed, Sep 03, 2025 at 11:22:42AM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree. As such, call on
> v4l2_get_active_data_lanes to check if the driver reports a

function need (), v4l2_get_active_data_lanes()

> differing number of lanes to device tree, and use that number of active
> lanes.
>
> If the number of active data lanes is invalid, or the op is not
> supported, it will use the number of lanes defined in device tree.

remove "it will" to keep simple.

Frank
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index fc89325f2f94..985be511bcd0 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>
> +	csis->bus.num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
> +							      csis->max_data_lanes);
> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;
> --
> 2.43.0
>

