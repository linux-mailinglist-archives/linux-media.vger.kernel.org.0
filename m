Return-Path: <linux-media+bounces-40632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E828B2FEA2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C9101CC7C85
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19B531AF38;
	Thu, 21 Aug 2025 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gz2gIuCn"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390F1B85FD;
	Thu, 21 Aug 2025 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790018; cv=fail; b=uCBCt6VFoqbKxXBGHy/gqIf/DP1sbGEdpOTQE1wWl/d/vVOd1jI6EdqDhlg4SNLU4st0D+RxQqdUtY2JeIylNGqF3Jj4atBr1zBjmkAjaVRLeIT+P35dw2mtQdCBmIzV58c7p4G9wBcBqVEqzJUF5t8qWJndzZsfFwBB1ssYSzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790018; c=relaxed/simple;
	bh=9asBU7JhKKGiKg7BAx2s/VwVho426RqNEs4/gxC+UGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PIClC/MfHGgx9Riattiss9UKnHy3hMG48doYIVeoSlSU6pPbUCNj0+khFFV0j/OUFgL/xZtIIh9mQpJ1jS748ipGFl7KvQTJuWZBMRZf3Dw/FIx11oEoHWGzgoVHLr22m4fGDQygM10Fk9n+snz7uf0or052KqCWtXM4yRghKj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gz2gIuCn; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKvg2XnxbYfj20cqvlUfgXU05le+hC8ESqlMRy7v8bwx4rdKi8IW4iJRgbd/kiKpHcf7zvoo5n3JKDLso8K2tTcyVNt6NjDlViH6NiPscf7SgegZnFlVQJ+bk5tHc2rqrbZ6BJ+v/OTVUT9T3XVQx5LXn2Dsr6ORvH/8yE/m2quNNT21Hvws6UpgEdZ1q4UzxQGBgp2H3iXCzwzSxHlmbIVsFGAQhrd7y7bG+nXQH6Nnmr4+Im9yK0yVK0bjbeovoLY7QWysK2LOnMBjwtOnmLKfNVVIA7OpwJIN+LsC6sAhr2wW5agZwwxSwxt1/yGtGkeA4YU7YynVxHyNWuBb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5kPFgXkRttJJVVvpwtIyF32w04muA/uRh6Su2R8Mt8=;
 b=ZcX7AxAZ27m9LH6nu5hHNMRsqrhFgU+3kWEs50ndOhjhOwk8F+zTXr0p25bKymi5RAoXLPwEUxNo83cgjNFE+/cFwc7XeUdF44ovAGdYuFzrpefLgby/vWPb/q7CFUrbor08KpDrvvRDmzKAst9Dfc7lP2FKpK3bSHQgtwLL3L7IhK5R7AcfuwHsntbRK6dMxApwTCoJ8glwLwHKzOD0OHLlL/ibi8EWRVEy9/eyJcnafYrf/bmkqMCYke18OWAjzaOKRoK460oHqTyctf/XwMRW1viGoSNzjMgeUzsAUsuJ1OPeUN372mmiWrIAg92nVoNT5Ayr374yG9GcSrANcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5kPFgXkRttJJVVvpwtIyF32w04muA/uRh6Su2R8Mt8=;
 b=gz2gIuCntIW1GMqG5vQHp/M49HwSIq5zrkbtQEHF4ppxUC4H/oC7GDxytcRGgZdXG9gDix1+7HYhO9WWdEUw6whM46uzAMgNzNi+X33Lhw7bvRj+EtW5LuK/cwfidcLmJVP+mK1f8/xxPc5/yeQYH6w3YC1Z5ROWHhSCpEloWdHXGfCbEL9kSztJXaYlEcQwU/LkNEoWhPJ0mNQ4MCuvDGQ9HZ01SKZts/SGMk/SCewaHRnDdHBKFOZN8C2qqm9iNdkV+DuGbT9hqr/3rcQ8/k2TSZzqWmq+bKm/piSiphJz9x6uAhxaARtBD+nWXRqr3bhGYK3SBODeGVnXaiM3KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 15:26:53 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:26:53 +0000
Date: Thu, 21 Aug 2025 11:26:44 -0400
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
Subject: Re: [PATCH v2 06/12] media: imx-mipi-csis: Fix field alignment in
 register dump
Message-ID: <aKc6tHen3DewaNMe@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1729e315-027a-40a7-510e-08dde0c727d4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?UUTNScmMz4KK70Nrup0ypNxaqQJuWlqTqwrGd1cXwz0z2dsQs9GmoPvDydJ4?=
 =?us-ascii?Q?WVTkmgos30xmFKmOo5n8p4HVgIcwl52aGXvjlqGPrc17O27FgzbdTytdHrc9?=
 =?us-ascii?Q?yYr/g5c11/7oevXXy+TwrHeO5UGb4cYLFRKitSM5IQv29F3PClxwbY9Gp2+o?=
 =?us-ascii?Q?qLcRxyWcqrzRftwB12KsEGVPLDYn0Dko3lnsQDICErE/vPm221tS2h9a11lG?=
 =?us-ascii?Q?hMBFLXrtM+lzTQ660GLsJDZBqtKWWJop9zAH7vgBVVO5UX6O1Y7skQtskTjb?=
 =?us-ascii?Q?x7EiOIV4b5gW/fPcKerFuFFW0U1S+Tkjml92nQgQYcVIrEHs2MpMgAxZf5vn?=
 =?us-ascii?Q?A63NUTvqvBrvHBcS+kbtvF86F+UY+A5cIX9NniMTizf7hkTM++7zyNBZYA0u?=
 =?us-ascii?Q?orfOmaRFVQBYpbZkWDT+5wYOqxDqcdynaKdJt+62ChRgCc6BRd5Qw3tBnbF9?=
 =?us-ascii?Q?5mPer0nW0LaKSnZEF/H3AN0+ZJpZ8ek9M/zTp4YGPiud61Uxt6Zf7YEu1dhg?=
 =?us-ascii?Q?oeh9H10SMujOT4T/8unn66HaPFiQoYSem3xios/+77yteE7QYXNY57HX4D2A?=
 =?us-ascii?Q?GhhYLbOiysCcUmt/JuZSECNAfc7CwN+yN71HWKYurxLJxSzzCh5y2QuAzvpa?=
 =?us-ascii?Q?lGRdjPXOI0zSGBsBC2xNzp244bJqw5DsvURZcL/Q7bFsaYauOen4sEP9vnOc?=
 =?us-ascii?Q?IRc5ObWuJ/IpGsKcwjgmdWe8OCLRDDpro4XNDG//yNVSojQEx8k+bFWKxHoq?=
 =?us-ascii?Q?Uh6EUEhEGPuGkLPsQLgiBmM2gpTdE70AQUnhBpvcvZwYFIhFE1Yt5VGOtb5S?=
 =?us-ascii?Q?C+4jVcT9iWG7sjoGuQdHl/XpciLEcsBDXIVF+eTm3i9Df+90R0CHLInG7gwU?=
 =?us-ascii?Q?q35MHwOrxwF3l7w8HUUKKQzPOneXuBfGRUL9eL5j5u1Igo5QRJNsdgPPFpcv?=
 =?us-ascii?Q?zZ60iIfpNiP2IWiEBktuDhcxvqm/QLC1BK7uqRu3qrABBIfzXoDHaaTIQMDm?=
 =?us-ascii?Q?YDKwzk2HrDZBuLg04yzYf4lhvEQcZFnwSgz3Tbi1DkfFtiTagFuWwMs6eyp3?=
 =?us-ascii?Q?dmygltGaj7JNQ51uEvuT/9s7LjhsMsDv0PgkbOGaXx268ikAHP4KtKrPQaBa?=
 =?us-ascii?Q?X9Vwa9aDSkuP/fUmfgJ1poNo35h9zLbiqHNjtP5+KKJ445LWIWW6eHVrJZN7?=
 =?us-ascii?Q?NaHHgiMRHfZ5z/8uk+YlK6jbahcqdJKthPpUfBKrlOCYqsnPGXbnwfZ4I5w3?=
 =?us-ascii?Q?L19Ruq2YLD/hNMY0ZBKqrBfBrMwL6/RIr0dlZc2XrYmMNJUBEJD0m0XWY6I3?=
 =?us-ascii?Q?3arIIoQULZ1hEyxHdAdzsaySBXdBTVP7+ikuZnvNgTr1lRuG4IUqD6T6UJG9?=
 =?us-ascii?Q?3sGae8KgerNMaBY5yxrqFKjRnLab+jzzxKgPWWQJbcHJOWtBa5gAfVpj1cw3?=
 =?us-ascii?Q?a9+bYfH6uW2uqJcBxXNAdIDSGB0GDGGhHCe2/IIIJrfjoUhN0q1Nxw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Y635cv4YgRt911EyrkKpAbKkvuSf9sd8c5iN1rSl7oQ1Q7Lq+/FnZVenv67O?=
 =?us-ascii?Q?lqxYWnWOmkX/9D6D8AJcLuAv/SZN9oAqVEL2t/iU3UWunIzncCIdX6IAEL0c?=
 =?us-ascii?Q?UcdOJBIeWSrneBPu5InaTxradq8P1KmVrbAHsg0LfT4xl5rBgUB9Pg6vDDTK?=
 =?us-ascii?Q?oDC7bOZFCQmQKvkNkk+IgCQi7GOSR+IjPEoE8jyNgLjYrxcT9uI5Vr/k06+P?=
 =?us-ascii?Q?lRaZmEWoe38s53mHZJ6FZirdGTTpC+ufwnzqKtYPs/jjooUPWScOsy28gnhl?=
 =?us-ascii?Q?nn/y+omy6RzVNd04xHzKXqATxxXc+kjfTom7+XtMOeArXif3CzDbw4+fotqR?=
 =?us-ascii?Q?HO20XuoxbWsOr7XwmWrmKtuYfu+iVLJCXAPv4eRHT9rh/P+VOZJ7BZIfuK+m?=
 =?us-ascii?Q?joROeFoUb99lMoEypl1u0z9e2cm+DMDf4vMN7aYJS3Sjuz275GFzRWaY63aX?=
 =?us-ascii?Q?kuvQJ8v4VyXtl9PJ1tpcU5jahqa3N9+vq2z5imqPEgm/J/eCHpuOWQQjLtHD?=
 =?us-ascii?Q?/uOQ29GBDEEoVOFNFSrp3koRkGqWbrf37pmuWmLdoHzEeIAz+rTXB1bog9w1?=
 =?us-ascii?Q?5q19ji/gI754uc5K08kgDapEjRsDhW8n4KuAocUjokbwPXg9Uf7bRtZ6FMPy?=
 =?us-ascii?Q?m2RBv7rp8Bmtsd67sE4VoSxHuRfcK6aWQq4wuLsvI/UpovkuwijHIJIV637P?=
 =?us-ascii?Q?Z2VhIKk0DJMyM8dM22Oq3xssbG5wRRvxLcb8wc2AFIKQEAQf8HEnnbo68pVk?=
 =?us-ascii?Q?D24nETTfbaWKSXTvblGr9xoL4qGkXLRtoDB5HXlcJatSwF6DdkJkTkbwMvVz?=
 =?us-ascii?Q?YQPnvBkXSt136XZCDRVXTC+i9ZsBH1MIyYTkbTWJCcWHETsBRvs4ZUu+NN/r?=
 =?us-ascii?Q?41k/R6IBLJ90lK2kr1KPFiIRwKrzU7iuzplltp5jeI0qkM4lzbmFOrqUFdoW?=
 =?us-ascii?Q?tCc/XEyR/NXvowKGJYuXSaOXwh45gO3516wRxwaxwW1s0XaBO5MlncvkOD/V?=
 =?us-ascii?Q?/B+nZ+F7Qc5zW4MSx8vJeh4DoZQf8QvLawk8pcA0ozG2Nm4kbxNXWdhz5o9s?=
 =?us-ascii?Q?ArQ9xzaQO86UgHhuVHRis3fk6G5gTlpnqvaC0i2Tbiy03j70X/NiW0hgfWgF?=
 =?us-ascii?Q?1rEOYVzOqVx0W0iCwJBswHXJz7eZeFzadx6OKySbSwuPDwssIVnOMUcjGyru?=
 =?us-ascii?Q?Kp4LVJ2/19feEy7kFSQyftJ+s0oeTUirrvD1GQsKiScsycnKbdXNZ8RlCf7W?=
 =?us-ascii?Q?Iajr7PEbxB60scJh0frl6pA0Ch41sPO1uEHJoq/XmJpd1LFD3sN/hJL43rVu?=
 =?us-ascii?Q?1LAOqOrxKb8Ok1P4B70G6kZLGjySiybF3oS1eJrbHJAGd6ouz2QOmKxbLnn+?=
 =?us-ascii?Q?j7An7FdfOA7YIiiO+7PQ0MOQD8u9gl7yEgDn8Sy6AhPjgCFLOfEml38L5xuE?=
 =?us-ascii?Q?JPACNI0Y9McuzxDYA03/AeLSj5kiMsv1IF9/rdx1/hPezE8VHgSR+xbdOtJk?=
 =?us-ascii?Q?ILdwlJEPTOM0RQh4Sf2x2nG05L+MMrLL3b8Zn4/lu4vR7Azru8QHZ7l5gvvr?=
 =?us-ascii?Q?9w8bvEGQkwT2GtIbn0xkV4iswX/C2F42PVyKFb67?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1729e315-027a-40a7-510e-08dde0c727d4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:26:52.9713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwhQ1K5A1142z4r5uT6JH8UXlpkcroW+7xi6uMkUY0BtvM+6Y+Owdr2hV1vZGeI+y/pFhcUuhMy8hbkTMcPmHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

On Thu, Aug 21, 2025 at 03:09:38AM +0300, Laurent Pinchart wrote:
> Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
> MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
> register name length, resulting in misalignment of names printed in the
> kernel log. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 1ca327e6be00..35c8d5309424 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -893,7 +893,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>
>  	for (i = 0; i < ARRAY_SIZE(registers); i++) {
>  		cfg = mipi_csis_read(csis, registers[i].offset);
> -		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
> +		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
>  	}
>
>  	pm_runtime_put(csis->dev);
> --
> Regards,
>
> Laurent Pinchart
>

