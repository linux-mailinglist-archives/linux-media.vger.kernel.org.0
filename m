Return-Path: <linux-media+bounces-40773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A6B31B5A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08411B243C3
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD383074B0;
	Fri, 22 Aug 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="anm8UUv1"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044C3074A0;
	Fri, 22 Aug 2025 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872321; cv=fail; b=NILD8zp8AV2c6sMUhNWj3h+bBkjm+tWz0DdGKx1b/j6CJQp3lKM+oMDN1NKK5KgAHBuCmuLn8gv+A9mqqJoefRBJqWOC9Y6uP7GJVlxAninGgZ1FHFlwZvn6C/fBfzl6kc9PUuKS+wZOn6StzStbckzztxeNTu+DnNM0MdBarzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872321; c=relaxed/simple;
	bh=L+yMf5ond4SaxXeuQtTWrSWNCeuLlpBg/Swl1B/KoXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KVOdQJ2DldGIpKdbx/DdfyJHZHjkJTg1A3YM6kqktjknxGLujdGe5ubI1YF77Y4fj906AFomM22v7ol20lSllzaaNUymfkP/HB/dt84zetROOJ9O0DZLiH0YXQOraOxSmIagozHCfyux32Og7GjAmjyHhTw2J9AW+B8YURcBcYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=anm8UUv1; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgFPDutr9WtFBPCj4nobjMW/z7+CMp6/NqPXikaM73YJvhimyie2KinScgoRn/7Bv2lRJYFDJATwBX5bCLC0FavTJ6CGyPpOitxHsSK6GHIUVpvmjc0hJ9je/PFETZ0kp+Wgw1m6llhVFzvpmAovIccovtDM3MaF17xXx6WHh+KtM9fV6gbG08fpEsGfLJS5R1T2DPBPCnl/YLvgmB9qCGamZ0PclDm90enn2nW72ZWyeArG1ueFv2EOuFyFlpl5jWWJKlJrW9UN3ShVZ7CIGS4D3tUVSzOxE65b/+HYzOvsZRUaxsCITuvOXNQ6VnSuHDs9b8d7miPTt9n8KG5lVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boZdHyLKv9fHHp8DsjCZqFA4XJWGGGF5nTK+IyCz5Is=;
 b=kT/1lvdJEXMRqZhhI58sABgAGu0VOBV7wmWC1PRapfQL1eS2D/R0ytORoTVUHptc5MaRR/cwXEwmCGHkfBkneV0/RqWJiTFon5CY74ApK7Pz1EkQ2Mjggu3+5bsS8zALPgcg61C+mgBMGl2SmXzNdt+qxM03kiCA+3lJyBvNG8G8HkP9WDw/yI9+0KOM8YLN1zkhqQxA+7XGAzCV81LOpPqmnovtyYSWC7jf+rI4nKa9wY2WzK+5l1b7/ayLji9StJc5aZ+SsvIZaJiukRUdJipIo0uwNRTUyrRoWE7KPheo4baTggVk3XdzWb2+f8wVj/F/IbpDlHp7IDsDuIeXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boZdHyLKv9fHHp8DsjCZqFA4XJWGGGF5nTK+IyCz5Is=;
 b=anm8UUv1Cewm+KWzSN7npOMjccZ+1Quq3NrafVu0B96iQLDv5rUUUoZCK1TfFi7tnXI1zVPYm27EbkGm/iwuEex5hlLVNBTlT6vwWTqbRDN8F+/k87jyPU74SOfSZCpLXc4n5PyuDYlww6CPg30AHFjyjWt7fKJFEDojUkfM8EG50Yqd3YCwAbyg6AQVAQ1qllFpp5pO9iCFynERlaaRM/WthdP8pSZKopa/reLMhe9CSfBs8Uj0hHghjd+REqnzKFzekeAg1pp4ybLGzMKZjOyEPP8/2tzGFG2YCuKP/3Ba5c2PUUcx0r5GANRoqQVI+jNO85UZKAQEAp2olga6EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 14:18:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:18:37 +0000
Date: Fri, 22 Aug 2025 10:18:28 -0400
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
Subject: Re: [PATCH v3 12/13] media: imx-mipi-csis: Initial support for
 multiple output channels
Message-ID: <aKh8NG1lHKyAEoct@lizhi-Precision-Tower-5810>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 860cfaa5-9e21-49b5-a1bb-08dde186c8d6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MRpCXMMU+UbfIqGv+2THhig92K1PWWiubakNTrvC3GT2P1F5KQRSLGql7fCx?=
 =?us-ascii?Q?czz7JqFo5mbzJXvN2ppsW2I+IfdVd54uzZu5qA9H/ffyOpRBwtsBi1lf3Fuz?=
 =?us-ascii?Q?bJWdGl/QI/VNmxw/tWfb4ZZbYUtZww51/645KzbOp/CXGts8Sq7oq5gVXQvz?=
 =?us-ascii?Q?o4e0icvOE+U4yceG8aNp7uk/jG7oEI3vXJgF2lkhVYSJcIOSxKpdx16LdIDN?=
 =?us-ascii?Q?f74eNDFAJGMcYHXIelUfFYIYgvTQetMiwJRtvjISt4ixkKl+yhqCxztIyBn5?=
 =?us-ascii?Q?Oitnz9GJYbx9XedHB44g3PYClRdaycfF6jvO8pl+uU8URCOb5N+fsHHX21aZ?=
 =?us-ascii?Q?DIy0cYjHicfMaTVhbEGVeUkTSvd9Dmwd1we+wXnp6A+B7F9TPlX34Cofx2/K?=
 =?us-ascii?Q?KjXC8G/GR6s+asDdcFw742xD3WOegpSOBfxqOdIHchXosB4MEZkM1kf62Vbs?=
 =?us-ascii?Q?pMneszOKKa4II9vUxMFpXtOCLWqJtM9SvVlldYi6O7DiDDOQUG6W3ElWOx9C?=
 =?us-ascii?Q?mdUAJ8XNfian9o3023OjJOlVuB2uJFE9thWvxo4XqVvNx+KOEwFXcH1WYz9e?=
 =?us-ascii?Q?nccxfm8I8fH74VZpXq7wDK5Dr2EdVUHihZ7mqmlcnpCtEXqVeaaMKP8WDzIc?=
 =?us-ascii?Q?mrHAHzTuPjpHRbMmqKEsNqLEb1Sw6BnXgbRFDYp00fBfLu+iEDgOdJO8uueb?=
 =?us-ascii?Q?/85ckd38GvZ/E4FJDze/IVVip2w5uX3Gif+fv8F04U4GDcinbUnpBb8Wbfxz?=
 =?us-ascii?Q?loVskgffbk4FtIepAVRo9GjbymjfycU93Ghh3NCeTk4C8EbOSENn77Rnt0JS?=
 =?us-ascii?Q?Y2dDmJf/IfhJxm6eGl6IUX0OddxCMXtwZ807lYf8GtzQtm9oI1WvQREks4Ms?=
 =?us-ascii?Q?/ulluIdNdErkdd6aSZZzdqXQj92WNBwr7rN5dgN6QpcPzrPFUb4lQMjP4Mhc?=
 =?us-ascii?Q?38/oG1qqULbawa6GwfAHAWJQ3Vejn+Q3g/Jlo2f+g4HD14q4AbSX6KpY30Kd?=
 =?us-ascii?Q?NRdqMhzfYbikeAlK+8+9Wv9C439TgZUnXjNU8VPrM9XlhA/tqVUfdraz0Zqx?=
 =?us-ascii?Q?M7d3EnVG0VqMSR144ZB55TkzkWeAl0v7puZBQH2i7IFxFYl03rz1UVrqHAy+?=
 =?us-ascii?Q?+Qft+RpVqRQmy6rPWbRSnNYsBbC/YYE349WndsVXxFLpQwYlv2l8T4AeJQm3?=
 =?us-ascii?Q?p0zDwfIuxN7TuXpUpWMSuPr0XJpL8s0nFyCjShayul4br9QYo47MEIpMdO54?=
 =?us-ascii?Q?od+KzoA6pVFI/fvIRCeJU4zDwPX7IOTN23cFKNA8VYPqdMTKXCVTXgwcVCMp?=
 =?us-ascii?Q?QzCsSDEdtON31ZHMwS+yU4iEJ4n4GQWiLCuCtK9mFsW/IUgwDlQI2WugnzL0?=
 =?us-ascii?Q?lNIt+i+VgGrry2FoD7O36k1wjWliT3kyZkz15KCAdNd0aC+MQ6OhDOsJUvzk?=
 =?us-ascii?Q?JruMflugFbebSg52Xv/aVUU8W3nOGUNHlzQsO05CCFt5IKg5Tkp1iw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?01Sp6Myfv+4u9JcpDu/0CQsHthrt1oYAS+uewhha9hKgDWg++WzpwLUS0glI?=
 =?us-ascii?Q?FlCUYxI87Ie9t/TyG70ToPl8ZRA6TPKMT0d2eKwb+5PIFuO8g/1qsPI4AFSo?=
 =?us-ascii?Q?7MPnnEEHsxI1Pv7Q+OYyORZXLZBgY85NFmA8A+qJEdAGi6wI60lLAfWqpibG?=
 =?us-ascii?Q?zRRQtg325bKx+S/5gYmgkWlSEmuNIVwkVZ8l9Kj3nw0TIQXU+D+0nqscG7/k?=
 =?us-ascii?Q?3feB3qxP8RTBpez3WHnEaelKlLGmg4bre46GlhJ2yonbGiP6Lr3hfn4ICW1Q?=
 =?us-ascii?Q?26ke9qWg3xMjRh8HPIXcinyme99VvGmoCt3OAJjAKOwVBWg9tOq0tMl0Re6H?=
 =?us-ascii?Q?9nbeagGuMNsj9hLQknGsHVeUZt6VScbyq/OF35UDlBv9gkx8qT2rkduVl0Y2?=
 =?us-ascii?Q?v8IvJ5OYHWFpXFPdqj1XvCfIyfIkOIr1niOb9c943tR9Czq3YOx9E5hZ/lBu?=
 =?us-ascii?Q?6ce+tAJ6hjn3mGdxR5Qxy3218V4NIxHj1YIg0WiuWCFWjcWjFIS/J/FkLzFv?=
 =?us-ascii?Q?WtELPEnHMJvszh204++pnl05siQ3w4mw5Ocvb6oHJjLOTt+Sk3qx3ktS4Vqb?=
 =?us-ascii?Q?Ngc4gjlqg+D6o79JvrHrhyDj56afEt4Ljc9GNUedpyLGzC/+Trqp+YppviIE?=
 =?us-ascii?Q?avmb5BuKH4aDDKX25pLfVaQdOQk53Jh4O3OyDb8wKpibq4kFRm0ucDdSiDQW?=
 =?us-ascii?Q?cnWkKpSkkddFfxvUDW0InqKPVX8xrSENxL9iwaQh3GjBGepVIlF9Bw6qeDtL?=
 =?us-ascii?Q?kHejsSdRFMnMFcfo1PSzsgSMnWoUY9J65NKPtl1CORfxGlb1sr8lSSM0lAj5?=
 =?us-ascii?Q?C6vsvAzRScbqRkfYmd/YMT50kT/IiSRZu+ncvB0KfkibxIt42JrBL0HVRMAA?=
 =?us-ascii?Q?PFSodscY4udjXcoDHtkCIvfFBr6NnzizVQ23qoyifLgjzOlt7+8LLfQ7XrYJ?=
 =?us-ascii?Q?rfiHQjN3A3yZIItMgPl/nu8N5YHbXAYGXgMXGbSXUa1dhoUGbyGydBhc0yog?=
 =?us-ascii?Q?36vLiDnWnyWIUjpvXmjoofNhVe8sfCNUcOuc/x8whlehQDg25xF/TuoVwSFN?=
 =?us-ascii?Q?pqgVIU4FFxZh7OKcyJtV66M47p1aOSIT3uDSU0TO16wGjF1fphSBf9P0Qlof?=
 =?us-ascii?Q?cWOvvP67IKeefAl7mIHdBTHr1pLiSThEK09CEUpgXnraUckNXF5TD8zkRdUj?=
 =?us-ascii?Q?q0H7jq+S0X/+WCQBXMZDx9JE0GtZmiBMuxlp343h9YWXQ+MQPZlnbu1yUblZ?=
 =?us-ascii?Q?uXixBLZEVgML+EtanpOiXVDm9lrZOOcI3wKEwRCZcny2D4t8uNgUamuuF3Z/?=
 =?us-ascii?Q?u/IOuQ+1lQDKmR2wfD5pP9JPoiJEiPuedb5wsYJGxSLfU1ZIHQbQQW+Jla1K?=
 =?us-ascii?Q?/ksIUXBOy96Mq8w69I5iUgP3IPA41wI3CVxfhBBF0u2m1ciZRBotLmYBEUu5?=
 =?us-ascii?Q?lOVMbe5qLwngHPHKnSUoG8C5sqMfGJWgYCS8Q04fZvF75O1fSuB+RefRDWD5?=
 =?us-ascii?Q?Qh+vrZkBPP5+/JmfagzuyVdhSP4qsKTYtEG3tPxMcbg9XZ4/7XRKmsofX+GY?=
 =?us-ascii?Q?5yqq5hiuptNRHTsiVxiIIQFQlC82scWNjysvgN2S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860cfaa5-9e21-49b5-a1bb-08dde186c8d6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:18:36.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxIPFZaBNCksNWGNRegtybuChI4GxzxjD/BXzYCFzg9cmq8GE42Y80S/1X9GfFR82SifdeCF/iCq4pa8nxKWGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On Fri, Aug 22, 2025 at 03:27:32AM +0300, Laurent Pinchart wrote:
> Some CSIS instances feature more than one output channel. Update
> register macros accordingly, parse the number of channels from the
> device tree, and update register dumps and event counters to log
> per-channel data.
>
> Support for routing virtual channels and data types to output channels
> through the subdev internal routing API will come later.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - Update more per-channel registers
> - Update commit message
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
>  1 file changed, 152 insertions(+), 87 deletions(-)
...
> +		return dev_err_probe(csis->dev, -EINVAL,
> +				     "Invalid fsl,num-channels value\n");
> +
>  	return 0;
>  }
>
> @@ -1444,10 +1511,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>
>  	/* Parse DT properties. */
>  	ret = mipi_csis_parse_dt(csis);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}

I think this change is not belong to this patch.

Frank
>
>  	/* Acquire resources. */
>  	csis->regs = devm_platform_ioremap_resource(pdev, 0);
> --
> Regards,
>
> Laurent Pinchart
>

