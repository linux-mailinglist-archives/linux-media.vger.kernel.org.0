Return-Path: <linux-media+bounces-48184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC74CA08F4
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 18:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A3C30080C6
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 17:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776ED33DEDF;
	Wed,  3 Dec 2025 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dW2aO625"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA9330301;
	Wed,  3 Dec 2025 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783683; cv=fail; b=ki2cq0S/QASLtGm2fHpcsW7MJ+xLelZCfwtFj2yEC7+Tu5a/aKiJE1JTVfEAQDFnSozQlCtTHqVesQipwafAXQJ2ebwFVZJPyOj0J3GythLQrQJxoyT05pYztnHoXAKxux/eb2IOLo+/Xx1x2dzu1kNjAhAbgpyV8bXBPpfGMak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783683; c=relaxed/simple;
	bh=Jaf46T0I5EQfsvu7RP+NnCnMImE2UDJq/APYr+5XzAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MiGA4YqWHwOJHYfGywxFQdRpqzion904N7r/+G0jKoLEgWaj5Da3GAtyC7bwupdZXcBGq/qhMS8gobfqSHqy88d2435xn1hvKb1yL9nQg9qkD2SDPn/1EK9FdjhdAK7zE7652gkpXbDIFwggdVToKP5P8evIONL90rJtGBEAi+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dW2aO625; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJNlpC+Xn9qoJ5YHHkv5+fdTR1pjQ2JRMqWb60aXMXecGqVa+KutPVJTkpa8hSbkmryyob30gqdZihAbaeRZQW1u6ZFOWwNTsy8EXYEMmsu1Z9xY0wY1usXHLGlrT1rrM85uYxuUIo0WQ7sjaHxSh99Wh49vtkBEVrUutCHg40tBm61edy0s7SLGX2GnYGFlcVaFIxMHSGQkbTvuWJl61RHAJv+btERGQnsQxkmikUWcSeAzXs9PSbMMc1kxIhsLULutw0n1G6udA1YmGb/Qm5dtZtTN07X58r//lM76gy54ZeuKznC+QzFGt1r+0uOb2LAzqtFsiFVheq/vFdZLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcKgXp5GikF7yheaV9skCVkRXrs5FXY9OMOa7jPHghY=;
 b=E+2ECKJq0YKqv2BdKp2db/IrgJEVUyWGku4zmceqcFUyr6lJApW0oD2gOWP1pEq12V6y9orsdg5iYcrCRrQrG+WmUzCv1jm8nFOt/GQzppBVxKqZkxnBmZgHFkvVV4dazXL1ZX0/xClKvLb1T7sdlB9ABBboAHiR9nayluoE+Hc5rjIqIAeHNEHqNovcGuW24MJY+HdmRzS69A1/brQa6xSJm+abW7MxPhL365csh0A2Lk7lVp28tgzVt4H/BNnUyhEr1HxTI/iM1HTeSFEMkL/gydiZe3/4dCrnRGbG4hTp6l0FpVfFu6SfoFQFAjoPkLK7LhC/hJafDgA76Hphvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcKgXp5GikF7yheaV9skCVkRXrs5FXY9OMOa7jPHghY=;
 b=dW2aO625z2s+WsWiN/Z5zmG92xOAVWgOoc6sYm6HqvZxUzwg/m+4sSzfGK7fDUmIRyGikylYv9+w6U001YLqtls8dPduy9gaFXxgTb4jFKkFHhFce25WMnBRUveVzrggDASwGysTh415L205ByYx4sOkccI8NVrJClgR3OylICJ+NJUbk2kZU10iPpUKXDv6ujBm+Hgw16qbEeqdEJ3ae3YqSFFO9kCH+Yevv5ECh7DRDfuEzIMpqLd7E7g0jD94HN54zE86USBg91D12QbzSsfk/Zj0lbJF+VDW25cNJ9qADND+5Q20YwkN7KUDBDei9chHlGO0qdqkT1ePv4G2nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10625.eurprd04.prod.outlook.com (2603:10a6:102:48a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 17:41:18 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 17:41:18 +0000
Date: Wed, 3 Dec 2025 12:41:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 drivery
Message-ID: <aTB2NNYVSm6POk9y@lizhi-Precision-Tower-5810>
References: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
 <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10625:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c946d4-ecd3-43b6-25f0-08de329329d9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?WjqzpLHeAJFYLNA94NydhB3O1i6VOe6A0Coj5HBVdjlX0jJtiF1ltX6svsX/?=
 =?us-ascii?Q?xlsgQWVFAO3uMT/ukdVkVYGlaxGJYWAcUIv+vUHKe1PkI2X75AAppzGM5HB4?=
 =?us-ascii?Q?JnY3f9vvP58IirrKg2vFPQHPyWDexiFWpog69xcJk8YjtCKlibW3is3FIVNI?=
 =?us-ascii?Q?pellxec/bqUmr9H48YagSfpClbbjSyQQjnIzFJ/v5AhM88l0yAPk0NhVrJIT?=
 =?us-ascii?Q?TGVnkRfNYTGtAbvVhRhGrcE7rvehrWw/Nw4NsiQDFJHfo7TFHpfA32FJwsOh?=
 =?us-ascii?Q?HftWLzmuW/p9A7BwE4eN8vkYVS5TY///ilqvTkTJTeV8LmpuWA5HciPcbkTT?=
 =?us-ascii?Q?58qiYq9j7buOIcvXfRGZ/kgGTAnN2s4syvYPhkIbSVMm5WTmwZt4fY4/VTrq?=
 =?us-ascii?Q?ZR4Kn9FMbgqqF2LHFIBurWVBT1G78FNA34DhxAlIOfdNMuBF2X7w/MJRhXct?=
 =?us-ascii?Q?vKOurfZvCWgKHQLNZVXD/KMNU0SM1oxr+Usys/lG1yK00nUS2hLkHsY0H8S1?=
 =?us-ascii?Q?kNt0PmgrUwmjK/pQq0f+9pSGsQYcuPHWemZGXxWsta+P+ccSAudYDZghNiaN?=
 =?us-ascii?Q?Z4uS8k1VXge2k1KOXObpjOaPNZgpl/SCQF2MhJnfkImgeFgf5txhlBFv+uva?=
 =?us-ascii?Q?+NY/VAelWHkc7uHYxTqHKS0pTFUnB0xpb8z0M8jw50DQX5IZVqHy7WCIuFnh?=
 =?us-ascii?Q?ry9qZKXGWfP/G6Lg5x3QHIXDBAgg4Cesv3OFi5xhQKaOEzrGjPplkMTtP42y?=
 =?us-ascii?Q?XXckR3JV7lNx+EanugHCZv7uFNZvrBI7ePpEiIJMvkZDRrkC7OWpOwrAeUcp?=
 =?us-ascii?Q?ci0Zxue6epMQ7f6oknEZ0szElOmHoMOfa7Zt6F3rGSVEbeCoK23njbHNydDe?=
 =?us-ascii?Q?xPce9OLUXxbG8RmiEJ/dsO7x5WnxaTpERPaf74YV6SwaqBPAeeOmcTIq9VhO?=
 =?us-ascii?Q?lZF6+vJs9tAD6pXpNeYuGwk20thqbgfiKg+4UiOsi3C0dZA4UURhOLt/0eaC?=
 =?us-ascii?Q?JWZeTfo5Xss2tSIfE02tYrdoiE45jCfwYgltBR9r1/wivHjyXMCm9h5VYibn?=
 =?us-ascii?Q?jm2u94MehAQ4TFHxw/RDZOp5ok4bbPoOm5p3lhJD0e1TKQe9eMyxK0YJ4rw0?=
 =?us-ascii?Q?RoGMWAtbvnp5M04ZRBYPOPT7VMJ2zCAqJysCNq2J/WXOsmCdtyxExiVrhsSx?=
 =?us-ascii?Q?IlBoOmaDtI6DIC1OrLtPvhYGJ4huckSfXIqBbgTkDgd2+JNZKtZuWfVRJo5r?=
 =?us-ascii?Q?Qa30S8TjlAVu5Ji2fSAy26wt9l7aoKWBYQtbn6NkBCp3fnBNNJnrBiz5SCVP?=
 =?us-ascii?Q?4nvtTjK0Zl1m6YMtzNjr8q/AA3/3hpKzDnm/7AfmIL82hIiO7IVDONU+C2nz?=
 =?us-ascii?Q?+gZo9a7BG67DlGlP3PAxs6yVmtxvIlODVkWk/Jwz0eiObWePUvN7iVZHnal8?=
 =?us-ascii?Q?zwOYvH/519fzHfGJMYNSVbWvmyxclrCVJYUnItvJfZOSsSF6irg15FvmJA9Y?=
 =?us-ascii?Q?9Ro/PLAmBGcQGxCA+CloTVpN4b15yPdYRxMutdrGNdXUhfPDUFP61sXY/g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VdPh2UA1/orYu8MZTVeK578mUks6A3IhLW9kUAhVPE+Yyq2eqB27PrNUaJrk?=
 =?us-ascii?Q?3naX0qVCTE2k720sCBcF4cfpxn6Xm4Hex0oCCSDtMyv55sX+Pd3WvtiKiYNQ?=
 =?us-ascii?Q?sJDTs2PlrOBMhzSNRrq71JnULY5Wz4PmS7k+uZrfoAtwZ0vzZTppTgRrYkkk?=
 =?us-ascii?Q?qj1Fc7U8Bnn4WfngPcZuivPMnrrage1ki6ZY9TboW1pnajwuRdzBOkSSClTJ?=
 =?us-ascii?Q?c6V3e0PcL+Q531PI3zoiZDBNrGAQlsUUAxH1YN839i9x9OYWSDIW3+Znln7h?=
 =?us-ascii?Q?JlEWjkYrUjtoO6rG6E7UB4v8QJgprVrOJEL+iZQnVEb3P7STe8H9EhMYmSCe?=
 =?us-ascii?Q?QCUmCFtH1e0mB/ZdQs8CV6ZgIVJ2//SbCIvrrXqK/2BfhLC0MHJGISVl/sI5?=
 =?us-ascii?Q?Wjx/qCjffgQWLtpizrnKwDknDi8b9oDCxhObUI/OFxt5WD6emGlsVVoeEN2e?=
 =?us-ascii?Q?T+TOezmxSZwD7ZJVcGcKLG3yBLHVdLOTQVrRd4zEfZrsFWJ+ygV8BsT02TYv?=
 =?us-ascii?Q?KpPFCyHGAyGVcLYwZSvdmO9K3Tcx1Kg28OV3SsjnD3O4LE7qur/RyWfpSeeM?=
 =?us-ascii?Q?KW9YZclmZp2GyJow3yubCuXI1428pO+iP+nPqCQTwDqmGJjY2RpCE1ReGbUV?=
 =?us-ascii?Q?SFUznvZBYt4h84tnPtEY0tZ5igRuv1N6eBzVzju9xfrPFjg4wHOm9p5sr3dp?=
 =?us-ascii?Q?LplG7KPdC14/12tFL11ar/UCPMtuplscCCnjKtKB9tT5Bpo/Vis4YOVYqnsj?=
 =?us-ascii?Q?W6DbkmiSttES/8Hsh0QCb2V4HUJpYu0Ti2WSq5Bdjg7jF53C9QMUQe62qW55?=
 =?us-ascii?Q?eZ6HNfzKUX+LUWUEWEbGlEybBo4hw0nyCEY5i5uZWKgOGJI6XXJdbuilr87o?=
 =?us-ascii?Q?AWpkpyKjMdlvsGuGw3UwklFPEMT6cJ7wESRad7N74udhfKTPIaE9O+Qs6hW5?=
 =?us-ascii?Q?EmIRWzN9rNB/5PA5Md66dme/OQ6oHzVmzMoJiNtx/Jyu2hhmLAkX/SGGwh6/?=
 =?us-ascii?Q?mrIBfQJdf/R85iGVr892zdvxTwTouAxqx7aHYpvnHMuMI0auL4YMM0LtICQo?=
 =?us-ascii?Q?zU8aWWxbopiyDcG/opgdOt2MmiipPAEv9n0zUQGWYahjodfANRqCrxAeYKuS?=
 =?us-ascii?Q?/12G+byatQ9RtrfaSWZcHckIS6ofjBrs/zON5p570wuZ+HEL0kMKakagjjI2?=
 =?us-ascii?Q?NxAckjIC0CNvE6GBZ+Uwk6g3mGrQHS5q5YKUgkvgiIf7h65J2p/e3+TPZf9V?=
 =?us-ascii?Q?T9ezfyCkdx4cLrS5BIRvWicRuNiCNACQIWsN41V2VRBDbu3pZHVst1eSqbuH?=
 =?us-ascii?Q?yKLnQk3AZVLXtvgsZuzC6WioPx6+LxXJoZJ7dScdf0KFlRzH5bc+iGJ3o51D?=
 =?us-ascii?Q?JULguv0i9rW9yJwfSLK7XEQTF4CJmtTWTUS/qKCHWMULzd4hrdGvfmMYVQ5j?=
 =?us-ascii?Q?I1uqwmWukaHHR+v3wiAIY5kEvL99TJ52RfScMpK4sVadjYzDrs8LtD05x3eG?=
 =?us-ascii?Q?2nDIL6fNUMkwsAIOnsyl7fA47BjHldScMlFjjeJ/2VbYOCPsRokX0iGFfm+k?=
 =?us-ascii?Q?hHG7WxPQyaJz3m2Sy4cYM0WeSiU302FSF+Yls/oO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c946d4-ecd3-43b6-25f0-08de329329d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:41:17.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/ptdn4ZegAQotUrrkglA+OKgHPFyr7fFUc9vx8y9/An2gNrAyvCufTFCdl465M6fH2Y0Wl8XkC0c9eTH/7ZKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10625

On Wed, Dec 03, 2025 at 02:30:03PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> This driver adds its data formatting support.

Needn't words "this driver", just

   Add data formatting support.

>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  MAINTAINERS                                     |   8 +
>  drivers/media/platform/nxp/Kconfig              |  14 +
>  drivers/media/platform/nxp/Makefile             |   1 +
>  drivers/media/platform/nxp/imx9-csi-formatter.c | 894 ++++++++++++++++++++++++
>  4 files changed, 917 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4205ca007e076f869613032b51e8cc5bff06b98e..24681a787818c3e69f93dcc220ee9838cef99886 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18626,6 +18626,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
> +F:	drivers/media/platform/nxp/imx9-csi-formatter.c
> +

...
> +
> +#define CSI_FORMATTER_PAD_SINK			0
> +#define CSI_FORMATTER_PAD_SOURCE		1
> +#define CSI_FORMATTER_PAD_NUM			2
> +
> +#define CSI_FORMATTER_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_1X16
> +#define CSI_FORMATTER_DEF_PIX_WIDTH		1920U
> +#define CSI_FORMATTER_DEF_PIX_HEIGHT		1080U
> +#define CSI_FORMATTER_MAX_PIX_WIDTH		0xffff
> +#define CSI_FORMATTER_MAX_PIX_HEIGHT		0xffff

These macro only use once, you put value direct at formatter_default_fmt.

> +
> +#define CSI_FORMATTER_DRV_NAME			"csi-pixel-formatter"
> +#define CSI_FORMATTER_VC_MAX			8
> +
> +struct formatter_pix_format {
> +	u32 code;
> +	u32 data_type;
> +};
> +
...
> +
> +static int formatter_subdev_get_frame_desc(struct v4l2_subdev *sd,
> +					   unsigned int pad,
> +					   struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct v4l2_mbus_frame_desc csi_fd;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	if (pad != CSI_FORMATTER_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &csi_fd);
> +	if (ret)
> +		return ret;
> +
> +	if (csi_fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_err(formatter->dev,
> +			"Frame descriptor does not describe CSI-2 link\n");
> +		return -EINVAL;
> +	}
> +
> +	memset(fd, 0, sizeof(*fd));
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +		unsigned int i;
> +
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		for (i = 0; i < csi_fd.num_entries; ++i) {
> +			if (csi_fd.entry[i].stream == route->sink_stream) {
> +				entry = &csi_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!entry) {
> +			dev_err(formatter->dev,
> +				"Failed to find stream from source frames desc\n");
> +			ret = -EPIPE;
> +			goto out_unlock;

may 'break' here is better?

> +		}
> +
> +		fd->entry[fd->num_entries].stream = route->source_stream;
> +		fd->entry[fd->num_entries].flags = entry->flags;
> +		fd->entry[fd->num_entries].length = entry->length;
> +		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
> +		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
> +		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
> +
> +		fd->num_entries++;
> +	}
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
...
> +
> +static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct device *dev = formatter->dev;
> +	u64 sink_streams;
> +	int ret;
> +
> +	if (!formatter->csi_sd) {
> +		dev_err(dev, "CSI controller don't link with formatter\n");
> +		return -EPIPE;
> +	}
> +
> +	if (!formatter->enabled_streams) {
> +		ret = pm_runtime_resume_and_get(formatter->dev);
> +		if (ret < 0) {
> +			dev_err(dev, "Formatter runtime get fail\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = csi_formatter_start_stream(formatter, streams_mask);
> +	if (ret)
> +		goto runtime_put;

if enable_streams is not 0, and goto runtime_put, it will cause runtime
refer count miss match.

I think you can call runtime_get uncondtional.

	PM_RUNTIME_ACQUIRE(xspi->dev, pm);
	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
	if (ret)
		return ret;

PM_RUNTIME_ACQUIRE already in linux-next, it should be safe to use for
next version.


> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +
> +	dev_dbg(dev, "remote sd: %s pad: %u, sink_stream:0x%llx\n",
> +		formatter->csi_sd->name, formatter->remote_pad, sink_streams);
> +
> +	ret = v4l2_subdev_enable_streams(formatter->csi_sd, formatter->remote_pad,
> +					 sink_streams);
> +	if (ret)
> +		goto runtime_put;
> +
> +	formatter->enabled_streams |= streams_mask;
> +
> +	return 0;
> +
> +runtime_put:
> +	pm_runtime_put(formatter->dev);
> +	return ret;
> +}
> +
> +static int csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				     u64 stream_mask)
> +{
> +	unsigned int i;
> +	int vc;
> +
> +	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
> +		if (stream_mask & BIT(i))
> +			break;
> +	}
> +
> +	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
> +		dev_err(formatter->dev, "Stream ID out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	vc = get_vc(formatter, i);
> +
> +	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
> +		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
> +		return -EINVAL;
> +	}
> +
> +	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), 0);
> +
> +	return 0;
> +}
> +
> +static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +					    struct v4l2_subdev_state *state,
> +					    u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +
> +	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
> +					  sink_streams);
> +	if (ret)
> +		return ret;
> +
> +	ret = csi_formatter_stop_stream(formatter, streams_mask);
> +	if (ret)
> +		return ret;
> +
> +	formatter->enabled_streams &= ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
> +	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
> +	.get_fmt		= v4l2_subdev_get_fmt,
> +	.set_fmt		= formatter_subdev_set_fmt,
> +	.get_frame_desc		= formatter_subdev_get_frame_desc,
> +	.set_routing		= formatter_subdev_set_routing,
> +	.enable_streams		= formatter_subdev_enable_streams,
> +	.disable_streams	= formatter_subdev_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops formatter_subdev_ops = {
> +	.pad = &formatter_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
> +	.init_state = formatter_subdev_init_state,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static const struct media_entity_operations formatter_entity_ops = {
> +	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +	struct v4l2_subdev *sd = &formatter->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
> +	sd->internal_ops = &formatter_internal_ops;
> +
> +	sd->owner = THIS_MODULE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS |
> +		     V4L2_SUBDEV_FL_STREAMS;
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->entity.ops = &formatter_entity_ops;
> +	sd->dev = formatter->dev;
> +
> +	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
> +				     formatter->pads);
> +	if (ret) {
> +		dev_err(formatter->dev, "Failed to init pads\n");
> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
> +
> +static inline struct csi_formatter *
> +notifier_to_formatter(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_formatter, notifier);
> +}
> +
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{
> +	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
> +				      | MEDIA_LNK_FL_ENABLED;
> +	struct csi_formatter *formatter = notifier_to_formatter(notifier);
> +	struct v4l2_subdev *sdev = &formatter->sd;
> +	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	formatter->csi_sd = sd;
> +
> +	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	remote_pad = media_pad_remote_pad_first(sink);
> +	if (!remote_pad) {
> +		dev_err(formatter->dev, "Pipe not setup correctly\n");
> +		return -EPIPE;
> +	}
> +	formatter->remote_pad = remote_pad->index;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> +	.bound = csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +	struct device *dev = formatter->dev;
> +	struct v4l2_async_connection *asc;
> +	struct fwnode_handle *ep;

struct fwnode_handle *ep __free(fwnode_handle) = fwnode_graph_get_endpoint_by_id()

https://lore.kernel.org/all/CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com/

Laurent Pinchart:

	look like prefer this way, let me know if I am wrong.

> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc)) {
> +		fwnode_handle_put(ep);
> +		return PTR_ERR(asc);

missed fwnode_handle_put(ep);

> +	}
> +
> +	fwnode_handle_put(ep);
> +
> +	formatter->notifier.ops = &formatter_notify_ops;
> +
> +	ret = v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_async_register_subdev(&formatter->sd);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_system_suspend(struct device *dev)
> +{
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int csi_formatter_system_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	clk_disable_unprepare(formatter->clk);
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	return clk_prepare_enable(formatter->clk);
> +}
> +
> +static const struct dev_pm_ops csi_formatter_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(csi_formatter_system_suspend,
> +				csi_formatter_system_resume)
> +	SET_RUNTIME_PM_OPS(csi_formatter_runtime_suspend,
> +			   csi_formatter_runtime_resume,
> +			   NULL)


use modern:
SYSTEM_SLEEP_PM_OPS
RUNTIME_PM_OPS

ref
https://lore.kernel.org/imx/20250411085932.1902662-1-arnd@kernel.org/

> +};
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_formatter *formatter;
> +	u32 val;
> +	int ret;
> +
> +	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +	if (!formatter)
> +		return -ENOMEM;
> +
> +	formatter->dev = dev;
> +
> +	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(formatter->regs)) {
> +		dev_err(dev, "Failed to get csi formatter regmap\n");
> +		return -ENODEV;

return dev_err_probe(), check others

> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "reg", &val);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get csi formatter reg property\n");
> +		return ret;
> +	}
> +	formatter->reg_offset = val;
> +
> +	formatter->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(formatter->clk)) {
> +		dev_err(dev, "Failed to get pixel clock\n");
> +		return PTR_ERR(formatter->clk);
> +	}
> +
> +	ret = csi_formatter_subdev_init(formatter);
> +	if (ret < 0) {
> +		dev_err(dev, "formatter subdev init fail\n");
> +		return ret;
> +	}
> +
> +	/* Initialize formatter pixel format */
> +	formatter->fmt = find_csi_format(formatter_default_fmt.code);
> +
> +	ret = csi_formatter_async_register(formatter);
> +	if (ret < 0) {
> +		v4l2_subdev_cleanup(&formatter->sd);
> +		dev_err(dev, "Async register failed\n");
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, &formatter->sd);
> +
> +	/* Enable runtime PM. */
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	v4l2_async_unregister_subdev(&formatter->sd);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	media_entity_cleanup(&formatter->sd.entity);
> +	pm_runtime_set_suspended(&pdev->dev);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] = {
> +	{ .compatible = "fsl,imx9-csi-formatter" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver = {
> +	.driver = {
> +		.owner          = THIS_MODULE,
> +		.name           = CSI_FORMATTER_DRV_NAME,
> +		.of_match_table = csi_formatter_of_match,
> +		.pm             = &csi_formatter_pm_ops,

pm_ptr()

> +	},
> +	.probe  = csi_formatter_probe,
> +	.remove = csi_formatter_remove,
> +};
> +
> +module_platform_driver(csi_formatter_device_driver);
> +
> +MODULE_ALIAS("platform:" CSI_FORMATTER_DRV_NAME);

drop this one.

Frank
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
> +MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

