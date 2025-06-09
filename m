Return-Path: <linux-media+bounces-34363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3095AD22A1
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 17:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69421169A37
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF30220B1FC;
	Mon,  9 Jun 2025 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="biLZ9BT2"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228CCA5A;
	Mon,  9 Jun 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483607; cv=fail; b=sX9oEeGX4mJmnykqcutcz7o2TinyWpzuutYdBpxv69nqdbSr4LkYKOiCI47pw9UzxHlM5wru26qI0z9xSAR9BkQP9dh1OwC8jYpY97icaoc4qMPX/xyMMyt91oIO2dIm2/jjddN9u5Ibyl1SVJ7RxG2Pf6I3sVCaZOc7PJyjZp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483607; c=relaxed/simple;
	bh=ZgZ3aIBGZOMsklUqBAPtz99GOuxIlrABj+SRKRbfGsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uNmFztXkHhY++tfP10x3X592rPkPaDWwxDXCwLuv2FyIl7cbOfudJBuqAe2KC0WFiRw4j7vZmhB2qVyKyicGii8Mrnf6b0yuwZFY4AiG2VpE2IpmUJo7uapwyZ1AWdJJoF2nrGDgED3qYdMJLI4k0Za6Rla7TNqj2B1oSZ/393M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=biLZ9BT2; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGqufyrzmQYfJ14fdBUH3W+B1M0ol1Nv6WxWlP01qmqA6/r65ViXfS9jnmbpojTW92IWU1rbvm7Q02cGTIWs1ed1UuFhedSehLnAjkaQU19Y+iSKHlIxRiedGmZcMEJWpUMlSrxRiitW71zMpNzQW6A5IQbghg5vQ9li3kmiLcoUB0CJO6f5tJ3QUUOKMbjYoIEu6OGRiY/nAnKngLyPsY4gzggkM1UmFiaetDjODb21FPt1zzH4kc2QL+G6LIgps0AqtBGQ4H0nGXBDqLCUFDx4hRgNwwha9Oye5oadaxmq3pR/P6k+vP+4xv7cTtlhDViH63iXwwmnl3P6OwVSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSP6GgBSQQLJsEz3JtiCHa6oarQpkTga4CEk/H7ekS8=;
 b=aRkoxv9kPEVCFC6RB55xJqgI5FVLi7mkuuHJ1Iqbr7e3sdMAJ/M6lKUwpBZNkcTax0WH7tnPfkbq5PO3/YDBfUOmy8BwmA3M+87tVnwRcooKWWUlIQKzniJFqLPG435YmzXckFHuNSrkjICZTvfZHDUd1SyZPYHGWBbsHg5PDYioQi7SVWAAkJiZx8fW4NoInUDg6BhaUmdRcPzD9dHsVsp91Kqwnik+XwuN4IHiCmPhF9DmoPPRsjFVl8sUZmPwFmVHKoAGbXlboWy/xvLsYpHWQ4sOqbX8gAW++LGxTU1Wb/QSedVxH6jMoDHhr5vwblvuRUdEwMygP9Kjl+NDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSP6GgBSQQLJsEz3JtiCHa6oarQpkTga4CEk/H7ekS8=;
 b=biLZ9BT2bPJexn0ducaSQtsytS0qY30gEfBK7CB3h4EQ4bWXrkdv5M3I3HPYeDN9buaOCsO9/toGA3EGzgjb+GKB796uH+6OVvlsjtMCEuj2ra9CiSWX4L/gQtrc3NQfPlbCdfEtdxVRX3FpWsHXpIko7RSqbgmlEJqGepAafVtpwwRPwlahPZUJYiwS071XJnAcVcgGSIFbV877A3rZ70Q8sUhX0zWXHhTy5KRrZyCblv4AMYs2edHBGNYWBPb9DFsIj+9yIzNH5pT/xwxvPQJwIPx1rE5i06rpZBIV+UZUVXhyhzC92w+VuMkv/74NTZizHQTPq+nbSmFXZMNK9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 15:40:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:40:01 +0000
Date: Mon, 9 Jun 2025 11:39:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] media: imx-mipi-csis: Initial support for multiple
 output channels
Message-ID: <aEcASWJSRagWp23C@lizhi-Precision-Tower-5810>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-9-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608235840.23871-9-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f07eb6b-e06f-4d99-62a3-08dda76be5ab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?6MfnbfxCbgfK3N1y2dvzoxfjnMmhW4FZlnBdXNGJtM/D+5Qh6z7UgLGXwyBS?=
 =?us-ascii?Q?yGbuv7vGDKIUUJSHevIJoR73n0DoBB+y1TzmcuKJzcN6L/A0Nr45NBDRhmIx?=
 =?us-ascii?Q?uqNnD37SzCNkpQJGOxIUYMwK4g8bhyaxPZt3dC9RI+M1Cg4XUU0uuKl2+KEe?=
 =?us-ascii?Q?+YLBI2TmsifshvWdL6FBrH8CrvnNZ3eCQgrQkuDIrweDyNWVhNK/mLqOpUJY?=
 =?us-ascii?Q?2l3XWb+6Zelc52E84dHH3/DTQbci6yxDV+YfP8sbT907tMFqmeAytkOJdwNJ?=
 =?us-ascii?Q?9RA+xjqkUwcjfYpxNKnw0O3UXkaLcjM99WSqbrwPXIp0FO55fSRaI4j4MQAE?=
 =?us-ascii?Q?b82JGvkt1+4Ec4yYKqPoP+9XHcEglE5uKAseFeWn7POGmrO7xKOkw+++lTss?=
 =?us-ascii?Q?NwgBox0fc0oIXXJRR6mNR+14oIdPUvZ2PQut+q2MFPkALVV2MgS1N5HKk2xs?=
 =?us-ascii?Q?OxFqN8OjPp5ZsBg4vNmJdUWGzNwe84yAcjyTpQe9ag7E4/GafV/36mXyD7YB?=
 =?us-ascii?Q?B9mvihYzSqHOVH2khSQR2vs+WXJviLTdlSo1JhVGiBdJKOW6CRuLJatQLa/g?=
 =?us-ascii?Q?x53G8Wn7ii+JkxpM7xPJdY5wPYGYWksFOrDymCXzj1e/CY0Ltu2meuH5WjXL?=
 =?us-ascii?Q?dY5jSi+IK0KN/SOGnrT5f55hxA+k5j2X/5qO62Kl6o3Kz7CqY2Se36r26gue?=
 =?us-ascii?Q?Eb10mtXw2/fiLS7jL5tmiTrBRM5JfCK4DIDHQQC7dQs+xqO0+Jnt/qAerWzk?=
 =?us-ascii?Q?J51Pn2Su+p0cwqXQT26rzZVWWVlAy10EgU/8QwUhf90v2sahvKLtxhnYzd6d?=
 =?us-ascii?Q?RNi6HQTbzpIIVjL8CgJUbnvc4sFYsbXNWttneEIPnffCa8Ya18MHgvCr1+4U?=
 =?us-ascii?Q?aCikrYTNIqBt36tMY/WiO7QktaxmzkWad4zj/iE/tIkVnwbwc9bY9KPIH7Ub?=
 =?us-ascii?Q?E0VlKuAk6fVsPjWmrvupZz27T3Reu46CO7oTncKUUSFq8owU4eeq+XIoKyd/?=
 =?us-ascii?Q?xyQWAf+o16XfoEPprE4QIaGyYJi21LgA+SGBRrf0JW5yg/6h21JZsUaTyM5k?=
 =?us-ascii?Q?e5FdsKJxf3HAll1vbnnDwaKufEVlRpk+NmgC/ie2m2+VjS/N13WQpSBX95SA?=
 =?us-ascii?Q?k6oOvRlYDjSosSVRzDzgFRuWSG6PlyD7dsreY168m2kZ+Lw6HKIMLZghs25P?=
 =?us-ascii?Q?XynJkkJ2KrviFefwEdY/7cV9cCFK4yvyV1z7641ium+0jOJ70n6/DclbzpWY?=
 =?us-ascii?Q?iVP4KQEohmv3+b+g3xLGRSBfOVGm885DZUhQPwpOczVQNTCgj11Zd/HphN8E?=
 =?us-ascii?Q?lfQi0FT0+DNiJ8/x8eHQT6c5+zBotyykKXMIOP7QyC2Odg4eXB2zprlnE8Od?=
 =?us-ascii?Q?v3v/1cxbhn+X+euYvT1aDpaLgS6hqG6D9uDG4yjHN3i1pIL7O8ux0TUcD77j?=
 =?us-ascii?Q?m33mctFQF5nk0LFd60d6ofRNB9tcFPWbNsZpVH7KCqStjhXZMdUYxQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?b4QVPVllIcERlI1GadFENJViI+g3VCfuQkyeMwuyxZBfuxe62ZejRgrHbdgH?=
 =?us-ascii?Q?gAsyXk/CVmHnERKNpF4ojP5XncqmErSwvk+abu7822JCj4AH8cMurUdd3zf7?=
 =?us-ascii?Q?p58cWIBV3rF5+aQbkBcn5QqbAgZiqH0fW6QdG/DAd7Sb3FcoDAd7g7dABoqe?=
 =?us-ascii?Q?0XV/u97mNo4vMfkt7OvwIRkWjuDzuSF6CUwYbPAS1UNjCsb+pWyaUS1Bqplk?=
 =?us-ascii?Q?6gzmaWfUK7WbOwnMtkmBlpD2oZ+UDX0wvwOZnJJIEnmaWMGBVzXmCMuKdoJh?=
 =?us-ascii?Q?qUj2ZG/f8SyOvjtwmup+pbQGS75jUit8CCUGAwUkP+HvvwxYAW6GbUExz07z?=
 =?us-ascii?Q?f4eWgTh4tpX1uBEdHIkfLwpIjcaKsZjtxXkFyFWzWfNdcJuE2QfAevG3vyrm?=
 =?us-ascii?Q?Hhdh7L1rqG2PbcrOxO0+PfdQi6YHQmiZdry4b2kvHm30Vlm2Pq6bpVoor1Gr?=
 =?us-ascii?Q?zbbp9YeeMuD2N/NJROS3mMMk1uijGTR6EUlq/bz1KyqdP1fnbH7SE7/xjyPC?=
 =?us-ascii?Q?7CeyKSa9f5ware9fJZkaJ1SfrLhhfV1Mk/sUkar08Tflc9nCwJSl+OhBK5UL?=
 =?us-ascii?Q?rdDsWuwEUcRCQGF85fzQfzje25Ea3/6lfmg/FfSeN5uAKu+ZOj5q4R0FB0/b?=
 =?us-ascii?Q?jKZ2c7IF4AeGWv1nW6aBk+o1s+MvrgJSx0RE66PettvRF3MByXE6tNLoA39G?=
 =?us-ascii?Q?1WN6ZSbXK0bC+GYz0JxE+cMcyonDc+XcAgLb6cVax5rTnwygjls+txSzhfqN?=
 =?us-ascii?Q?4MPbJQHU22UEa6P7JrYCY8zDf3img5uXcHF9dr0cU47sEEMREL7L+yNrjSy2?=
 =?us-ascii?Q?YvY4dpfMnkiZGFsg8C31aQ+D20q9IoTok3YstsVM2OHEIpveY/F8P3KWlkEf?=
 =?us-ascii?Q?omHZ3n/maduMQKTZBR0kzkGn9xDRVWCaUdpLKcLnB4CqTtX1KGIq0RM6nkpT?=
 =?us-ascii?Q?BVr429GZBxa/ztlTtBZNSPgNLC4+c5eWRnAV/LNcJF8q4cMbgQvGsICzol8k?=
 =?us-ascii?Q?gvsyEFfLP33GYSZuiigciC/KbqnvhtAM6Lpt2xTFB9i4q86qu073EH39XY3A?=
 =?us-ascii?Q?G2wjujdp7TSCi2Nae9rNWwT2czWE6p09WRy11Hv7/tl6uoZl4Z6JXz7E3Qek?=
 =?us-ascii?Q?V7FHB3GUcir7kLbZnYDBDNIy4+kFJloiLpljsXiKhX/H9cu0xQUg2OMDeOjT?=
 =?us-ascii?Q?javKJO91C89AJxAbDNpJ1oT6k/9ZzZ2+hAtvMWtObr2K/fPfclY/cXc27ZH/?=
 =?us-ascii?Q?i7yXbh3+VysysT+l//K0EctTV4BOgbAgBzpELks1vcggJiaiBQCOvm2z0tXf?=
 =?us-ascii?Q?8019WuzowFMFg2VkS8uqFratYQeUw4PfzOsnN08g9UA0iujKmYLWkeMh21Gn?=
 =?us-ascii?Q?UeOBJoWBn38XD6tQYLC0blWsih2h3JhWndey69fnQdSzRqr2OMM2ySQ08oTR?=
 =?us-ascii?Q?VsF0rW0JwptJkNnE7cvDTPOjiNiv1kHwo87mCxwkCLP372Cwtvzp99K25naR?=
 =?us-ascii?Q?Y51N9rKdkJmYwp5mnpSvh2mzG5bIGNGLhiyulqIxTEOXxZFdnPng6jca5hq3?=
 =?us-ascii?Q?uBLBbLMVLHQ3jnYbhM3fKKHE0uz+hhrTS3FxizFd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f07eb6b-e06f-4d99-62a3-08dda76be5ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:40:01.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22EyqoqSscBACaYRmp5hAwplRROHJKN/8p3H+FjxFXkN7uTs0QkD4I8jPK2V5DwJ0bJ1ynCHO8t5cCVpWmYMZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

On Mon, Jun 09, 2025 at 02:58:40AM +0300, Laurent Pinchart wrote:
> Some CSIS instances feature more than one output channel. Parse the
> number of channels from the device tree, and update register dumps and
> event counters accordingly. Support for routing virtual channels and
> data types to output channels through the subdev internal routing API
> will come later.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 224 ++++++++++++++-------
>  1 file changed, 146 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 080e40837463..4cc358d93187 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -98,12 +98,12 @@
>  #define MIPI_CSIS_INT_SRC_ODD_AFTER		BIT(28)
>  #define MIPI_CSIS_INT_SRC_ODD			(0x3 << 28)
>  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
> -#define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
> -#define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> +#define MIPI_CSIS_INT_SRC_FRAME_START(n)	BIT((n) + 24)
> +#define MIPI_CSIS_INT_SRC_FRAME_END(n)		BIT((n) + 20)
>  #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
> -#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
> -#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
> -#define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> +#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)	BIT((n) + 12)
> +#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)	BIT((n) + 8)
> +#define MIPI_CSIS_INT_SRC_ERR_OVER(n)		BIT((n) + 4)
>  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
>  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
>  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> @@ -205,23 +205,23 @@
>  /* Debug control register */
>  #define MIPI_CSIS_DBG_CTRL			0xc0
>  #define MIPI_CSIS_DBG_INTR_MSK			0xc4
> -#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
> -#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
> -#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
> -#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
> -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
> -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
> -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
> -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT		BIT(25)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE		BIT(24)

not sure why cause above two line changes.

> +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)	BIT((n) + 16)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)		BIT((n) + 12)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)		BIT((n) + 8)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)	BIT((n) + 0)
>  #define MIPI_CSIS_DBG_INTR_SRC			0xc8
> -#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
> -#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
> -#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
> -#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
> -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
> -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
> -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
> -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT		BIT(25)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE		BIT(24)

the same here.

> +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)	BIT((n) + 16)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)		BIT((n) + 12)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)		BIT((n) + 8)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)	BIT((n) + 0)
>
>  #define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
>
> @@ -230,8 +230,11 @@
>  #define MIPI_CSIS_PKTDATA_EVEN			0x3000
>  #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
>
> +#define MIPI_CSIS_MAX_CHANNELS			4
> +
>  struct mipi_csis_event {
>  	bool debug;
> +	unsigned int channel;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -239,36 +242,70 @@ struct mipi_csis_event {
>
>  static const struct mipi_csis_event mipi_csis_events[] = {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ID,		"Unknown ID Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),		"SOT 0 Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),		"SOT 1 Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),		"SOT 2 Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),		"SOT 3 Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS(0),		"Lost Frame Start Error 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FS(1),		"Lost Frame Start Error 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FS(2),		"Lost Frame Start Error 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FS(3),		"Lost Frame Start Error 3" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE(0),		"Lost Frame End Error 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FE(1),		"Lost Frame End Error 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FE(2),		"Lost Frame End Error 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FE(3),		"Lost Frame End Error 3" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_OVER(0),		"FIFO Overflow Error 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_ERR_OVER(1),		"FIFO Overflow Error 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_ERR_OVER(2),		"FIFO Overflow Error 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_ERR_OVER(3),		"FIFO Overflow Error 3" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ERR_ID,			"Unknown ID Error" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(0),	"Frame Size Error 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(1),	"Frame Size Error 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(2),	"Frame Size Error 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(3),	"Frame Size Error 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(0),	"Truncated Frame 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(1),	"Truncated Frame 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(2),	"Truncated Frame 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(3),	"Truncated Frame 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(0),		"Early Frame End 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(1),		"Early Frame End 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(2),		"Early Frame End 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(3),		"Early Frame End 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(0),		"Early Frame Start 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(1),		"Early Frame Start 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(2),		"Early Frame Start 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(3),		"Early Frame Start 3" },
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),		"Frame Start 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),		"Frame Start 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),		"Frame Start 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),		"Frame Start 3" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),		"Frame End 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),		"Frame End 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),		"Frame End 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),		"Frame End 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),	"VSYNC Falling Edge 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),	"VSYNC Falling Edge 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),	"VSYNC Falling Edge 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),	"VSYNC Falling Edge 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),	"VSYNC Rising Edge 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),	"VSYNC Rising Edge 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),	"VSYNC Rising Edge 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),	"VSYNC Rising Edge 3" },
>  };
>
> -#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> +#define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)
> +#define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
>
>  enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_PCLK,
> @@ -300,7 +337,9 @@ struct mipi_csis_device {
>  	struct clk_bulk_data *clks;
>  	struct reset_control *mrst;
>  	struct regulator *mipi_phy_regulator;
> +
>  	const struct mipi_csis_info *info;
> +	unsigned int num_channels;
>
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
> @@ -766,16 +805,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>
>  	/* Update the event/error counters */
>  	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> -		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> +		for (i = 0; i < ARRAY_SIZE(csis->events); i++) {
>  			struct mipi_csis_event *event = &csis->events[i];
>
> +			if (event->channel >= csis->num_channels)
> +				continue;
> +
>  			if ((!event->debug && (status & event->mask)) ||
>  			    (event->debug && (dbg_status & event->mask)))
>  				event->counter++;
>  		}
>  	}
>
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
>  		mipi_csis_queue_event_sof(csis);
>
>  	spin_unlock_irqrestore(&csis->slock, flags);
> @@ -852,7 +894,7 @@ static void mipi_csis_clear_counters(struct mipi_csis_device *csis)
>  static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_errors)
>  {
>  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> -				: MIPI_CSIS_NUM_EVENTS - 8;
> +				: MIPI_CSIS_NUM_ERROR_EVENTS;
>  	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>  	unsigned long flags;
>  	unsigned int i;
> @@ -863,45 +905,67 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
>  	spin_unlock_irqrestore(&csis->slock, flags);
>
>  	for (i = 0; i < num_events; ++i) {
> +		const struct mipi_csis_event *event = &csis->events[i];
> +
> +		if (event->channel >= csis->num_channels)
> +			continue;
> +
>  		if (counters[i] > 0 || csis->debug.enable)
>  			dev_info(csis->dev, "%s events: %d\n",
> -				 csis->events[i].name,
> -				 counters[i]);
> +				 event->name, counters[i]);
>  	}
>  }
>
> +struct mipi_csis_reg_info {
> +	u32 addr;
> +	unsigned int offset;
> +	const char * const name;
> +};
> +
> +static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
> +				       const struct mipi_csis_reg_info *reg,
> +				       unsigned int channel)
> +{
> +	dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
> +		 mipi_csis_read(csis, reg->addr + channel * reg->offset));
> +}
> +
>  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  {
> -	static const struct {
> -		u32 offset;
> -		const char * const name;
> -	} registers[] = {
> -		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
> -		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
> -		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
> -		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
> -		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
> -		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
> -		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
> -		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> -		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> -		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> -		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> -		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> -		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> +	static const struct mipi_csis_reg_info common_registers[] = {
> +		{ MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
> +		{ MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
> +		{ MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
> +		{ MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
> +		{ MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
> +		{ MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
> +		{ MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
> +		{ MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
> +	};
> +	static const struct mipi_csis_reg_info channel_registers[] = {
> +		{ MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH" },
>  	};
> -
> -	unsigned int i;
> -	u32 cfg;
>
>  	if (!pm_runtime_get_if_in_use(csis->dev))
>  		return 0;
>
>  	dev_info(csis->dev, "--- REGISTERS ---\n");
>
> -	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> -		cfg = mipi_csis_read(csis, registers[i].offset);
> -		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
> +	for (unsigned int i = 0; i < ARRAY_SIZE(common_registers); i++) {
> +		const struct mipi_csis_reg_info *reg = &common_registers[i];
> +
> +		dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
> +			 mipi_csis_read(csis, reg->addr));
> +	}
> +
> +	for (unsigned int chan = 0; chan < csis->num_channels; chan++) {
> +		for (unsigned int i = 0; i < ARRAY_SIZE(channel_registers); ++i)
> +			mipi_csis_dump_channel_reg(csis, &channel_registers[i],
> +						   chan);
>  	}
>
>  	pm_runtime_put(csis->dev);
> @@ -1424,6 +1488,12 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
>
>  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
>
> +	csis->num_channels = 1;
> +	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);

Wait for dt team comments, most likely they do not agree add fsl,num-channels.

Frank

> +	if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_MAX_CHANNELS)
> +		return dev_err_probe(csis->dev, -EINVAL,
> +				     "Invalid fsl,num-channels value\n");
> +
>  	return 0;
>  }
>
> @@ -1447,10 +1517,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>
>  	/* Parse DT properties. */
>  	ret = mipi_csis_parse_dt(csis);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}
>
>  	/* Acquire resources. */
>  	csis->regs = devm_platform_ioremap_resource(pdev, 0);
> --
> Regards,
>
> Laurent Pinchart
>

