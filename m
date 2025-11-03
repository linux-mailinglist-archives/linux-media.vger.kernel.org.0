Return-Path: <linux-media+bounces-46222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4080C2CB5B
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 16:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B762E18963D8
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 15:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AEC320A1A;
	Mon,  3 Nov 2025 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YOwIouaU"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B27320393
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182707; cv=fail; b=ic9uu4IJ1FOmm/Gs0zYnKlyqDCSkwmlc7nu7L8bc5Hk4fimxkhfeaXEuFZWsSvm46ajk34iysYjBhalj2G6MDECORB38H8uZyGk+9HdSmYakdKdQauOX3FYrNJST+ruLPs72eey40Y/YuwkL/GTq4IR3uIKjCQvVfXDliEhu+dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182707; c=relaxed/simple;
	bh=3CGXMAz2MMouc9/JwXqlzzmuNYGC/94LGNCLEsN5maE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OIP4vAq94vScESiVlSMoZm9/5qfhmvNWUyTnOHT4M9pLQhrC+HWIBUeYHFJVyNaeSe4ds+ip+FM850rq+q/khsas/Q4b5JvBDka+Aw3mafDjqlCZdshv9muAejFiEB2FHWGEmQw4ltuoxQQxXxdHCkZrxoW2Irp6YZdICynwqyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YOwIouaU; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHxbAOhjAoQ2gudaG4zEhvSiGYv5X5brj47fLlv1H9tb7SWLjnRb6AZ3P3/Qs2oN+YM5RfoocSJwvZCqHZMldezfdOhA5YlvZgOH4lCzhLkl9F3ExERFlNWvYOX2mvtms2SMOk4UZYPg1mMZP5IRGe+5oq0LVdn3Af/kFrYp8XyMf8oMM/yVk2tiVeftG3WXIx6MlKi+ayRlNYGy5Voqx+08/G/ghJQq8zs5OTugN+sxIPqhWpq8myqCrH6uUOsAD7K65bm+2XvPePktWDsfbwrX4MFvSJehvDCDBFZQDuOQZ2uWoqofyRFFD44EJ9jC/PIxSVA8qZUKIK8iL6bKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rQI53v6INU/7ptbMLmkubRjeuLWlnMcjvTebqfFFHc=;
 b=kq6WGWFZlBcIq+eQ6oojFcR/KzLONIp3MkY07qNodjqkBfFI5DA4Yugot/tsvvcAUPYr98Bje7g3Tg4OSxOM1BCUfbY9I0d1zQm4yg56RkXR2vUm/7Y/XbIL+8sb0jn6dmHOnTQf2H7ighCCLEu1LNFhdJVbFbhgNQJCa80FIzMLqZpbUowB6pGKK0y8q4HVpLayVwGQBIzqxyOmPUSigw/xHDo9EwQJ4JwDURODdTuhVYms+EHoXdCr5Khu3pIcHPG1a9PTCbDKkRtlKUTXY+LQBL4pde1ioPt8jzPNcB4Bin6tYSsF9B13+NKB3UONkgHTx/UON9N7YJOOth0rAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rQI53v6INU/7ptbMLmkubRjeuLWlnMcjvTebqfFFHc=;
 b=YOwIouaU1MTHoBsaiJcUj+ENCoGH5TTrjaB8wpODXu0da338ng51tlnzNCnl5SiEdm3+00a0JjGCD5HpdagXDDZ+IkQDv2c0WddZnZUhSa+ZL1s4yeA/59ui2THkYno7ose8/akxBva51Odxx2TxHOE4yRlcR+exuEOhcmr+FxoTWCBQRD8asZtI3QOlPjgnCT56HcUjwxqEH3CWFJbOwuebqfTmYzTT3/iAKCv8c7WggObEDHuhGEIkFbU/TNP+J1qaje3G7RLTmP96DHcl90EBapAajZ4RXg5fEjP7ELWo3npOOAnotJlaaCv6SnOkMzXI7+mp/XaPdXaz3x3EKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:11:28 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:11:27 +0000
Date: Mon, 3 Nov 2025 10:11:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx8-isi: Drop unused module alias
Message-ID: <aQjGFpmdcgsMwbs8@lizhi-Precision-Tower-5810>
References: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fe8606-410e-485d-bf48-08de1aeb42fb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?zOR52VorvbyGIgLzSjd4FIwhWK2T7EDVkRERmjjMx7BYC1jQL7hQ62HMA0iz?=
 =?us-ascii?Q?SgYomeOhVRurwSns5W2c3qdeI/suBFkqepBCDnFTO+QRnQREj4Hqwso12XnO?=
 =?us-ascii?Q?0XtN/fy1R0Hao82en5TO40hz71xYgR8QdWPxUV4LDa3d2+unGHGvB+GDh8IX?=
 =?us-ascii?Q?0S4apeWkGgdqQkkvbVjZUqqUPgsfcugreKjPfhDOOu3h1+napGdKbLZHw6vL?=
 =?us-ascii?Q?M6IqlmGd3343q4N6DD93T3jgiRib1Kac0iJoNu1BXnBOxv33iRwcEQdKbKFx?=
 =?us-ascii?Q?G4zO07rI3DAcQRBdVkF4mXe0ZpOFCUbFuKcLc6Qyy9j1rDkAQbbNLrRz1PCy?=
 =?us-ascii?Q?gi0UeaEzib1vAWhzyu3Jp1EClxd/VOSeIx3thum846J2uVpuwS/L2uXglU2/?=
 =?us-ascii?Q?Np0XrZDPhthvUOSIpEypYOd0fjmpcRCoAe79AQ7foudNsZsTwhYN8oQKxQ8I?=
 =?us-ascii?Q?d5eKNkcA7Cf8qv0uBttefN1qKMhrqidpKfo6qqY5rBnjrLX+x0DfNt9VQqYk?=
 =?us-ascii?Q?5Bj7yPHVmes8JCG6fg+sVuuI2jy9nvVD3EaWKCxsiZZE9TT8IzliU3wfRcTp?=
 =?us-ascii?Q?e15Xh83raHvBW0IPj7hnBwcBY97w6dS8Q3ApYWEbztBUI2PjV/KN+lUWoCEk?=
 =?us-ascii?Q?7efh9h5l7kmcno3XF//SeXvnmcoi6kZMfjg4YFgItj3yvzwENgpefKQFUjVa?=
 =?us-ascii?Q?01C/fprWOClXQnvxssYAkzGERdyNfq4jyPRW8SBAnCTfmRnZKxChAQT9Ffqs?=
 =?us-ascii?Q?jCFalsYcJwme5amZUmItZFTIfZkOC4sFzrwP7MQAKpYGXwfQK3ub0//90vHZ?=
 =?us-ascii?Q?Yx2xMguAC1dfbURmTXhUFufAw+BLb+qT+aRgZEuji7Eqk5GMqn9eqyQwh2Yi?=
 =?us-ascii?Q?zYSd+XVKsFn0XQmaAkWC8Oq4SUfy42dKBrTAsGCbj95hxH3BL7E414vp56Qb?=
 =?us-ascii?Q?rjseU+BiWexCPdtX6QP0q74TjworFX64Fv7uDHJZGf4x/84/jXQyykJqha6h?=
 =?us-ascii?Q?NeoRQhCzdV+HXFV3zslkwUvzxmoMhI22XE4N3wnOkHfa3aSduE0CqYYknEvz?=
 =?us-ascii?Q?BDr6b7+ywG0iokWfGCfcX8eaJnWz4m5wxF89acAtaDb25Qiz9Fy0/H8XgxQT?=
 =?us-ascii?Q?j3k37nfM9PvKanriZ4kc5edmDpAbXyX7YhcATt/3JuPibQcwJ0BP1XU+mHg2?=
 =?us-ascii?Q?NUBjepRDdE1lza60XV4VyrbLDKG6CvCaLnFzScnYb+hfKnFQC2E5E+xmSTyU?=
 =?us-ascii?Q?XDqgPsQ2YmnunU+Eot+rNfEb7MWdz9sJJ17uPzyLkczKbkHqyQpSrZGruxxW?=
 =?us-ascii?Q?+c/N9ZxnlEDJvgfPinHaC57N5M1gzOxJgp0jm8sIxA1Dxmq/MdYlXy0dyZj6?=
 =?us-ascii?Q?u2vEjeFS1TG7wvSm43Ky0qEgDlfzBg/Xqdte7NknxTMNQFOAnXyxCjdfTL7p?=
 =?us-ascii?Q?WgAX9xpQRfsL/rDyNGqNUg4f4tpSHXBCmX+/kUe7M1DPZzYnmhCXEaDxaEUq?=
 =?us-ascii?Q?O6xbbTJszmQbC/+nGYTCayMLzJzWJ04PK/Fr?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sLEjzT4cY5MoiyQRJlW9hLiLLpIigMnU2T8grum3yc7K+Hpv2z28rUa3vvh0?=
 =?us-ascii?Q?r+rBax2EjyydCTI8+vXiNM/2J0Nfj6GellarSUC2OjrMyDoNsaTmFAgyVFJ5?=
 =?us-ascii?Q?pDlIRq3NJoYb2kgaeQhrtKdM19CG/pG9PdMBufM13RzWnCu2oNYrgNYIn1WU?=
 =?us-ascii?Q?YjmYisNBy2y3q9jTo9dMG0C90kf+fRi7id8bD5DJd7uxpltOCA2vL7Zsm9FX?=
 =?us-ascii?Q?f5KVksNvinXWOALUMBCowAtigH/+QT3jrOWawyeiiAx2rZInlh5yGr3hDHzH?=
 =?us-ascii?Q?P/xMD5LINHEe0DA+3Pde/5ppgTZEFD2JZrsOJ+6ejEwzAqS3EKIues/xppXK?=
 =?us-ascii?Q?ZOxvR3Oi3WU2jQ1no+i9CMcB5MzHH1ZS445JbmT+QGUf/IraZm3CKrMhiDAD?=
 =?us-ascii?Q?JNk6g3Omfi/ulidfrk7hVTcycIe5hMANv9vhPuDLip+n4cbHWMh1C/+59T32?=
 =?us-ascii?Q?EmsNllbEP49zXYu134RYGm+BqnkIy5XYvKZ1dEn4RQsoH07uByk7trxHJKDh?=
 =?us-ascii?Q?aPA2gvZ9aXnnW5erovxQi7VvPQABmOxQScMCOk5Nzw8keJlKcd0Di1DxImbs?=
 =?us-ascii?Q?9sMIroBCTQOfHheVfxHUsP91WIvg/EEyf0o1XXeH7Ch2NvHd1YEWV2Mve7Nn?=
 =?us-ascii?Q?4SsWdTxUnSHBjky4hE4inmFC5GcEsaXQenTaN7/abC19r25BVCMrlTlNN0Cz?=
 =?us-ascii?Q?naMsbma4evL79L3gaw86lsewtC8t2YOc3EvT9b8IXokI2i6PPvFNrilEBalM?=
 =?us-ascii?Q?9dY+EGKsstbCbaNUIMIxRhYXnFjb8QURCmIyUNTlEmLVvxqn02UJg+XdO2i9?=
 =?us-ascii?Q?qQ8hrDLY4vAVLUNMPNm2oFdJTT4JlSYx7VASFYbSiqYpRnlo5VcyFsmCZRbY?=
 =?us-ascii?Q?uxieWSJGfriqrhNJotNDTSi67+ZUAkOOkEEIuq8sr8m6Rgt2Fd+aEoQmIrZD?=
 =?us-ascii?Q?uvMsno1wWiUE2sk4SYL9pGpfgWjUcYnPGavBkzEMl5fEKXQ1evUa0kETNqEO?=
 =?us-ascii?Q?f7rkoI6vX0ZmLukxFLbpOcityiccnrUAK1OHByTOsBWz1xOPdUl9DntXGFdg?=
 =?us-ascii?Q?e4CKw+qpxnoYdOOb7tAaL0UlGH5ycVCTfBD6+UAeVi5Y+VSrYW1Xgt5D/VVu?=
 =?us-ascii?Q?fhgZ69HqX+mZDkfMfDKuZnHzqo1bRn08HfBSD8u4B7KgEn91I6j2kVuH/mrD?=
 =?us-ascii?Q?brM2oJgSJAlmkT2TlZfMnLMAKY8zJzwvcui9bE3dtJQVf8j/qz8U5cQF1jtQ?=
 =?us-ascii?Q?yYRHDerCUcOgOoiI6rHKaShER2UNVnr6JgHqpB2A7qz+r/5+SWD0lkjPJu8+?=
 =?us-ascii?Q?8h/3mU8Qhmyys+RDv4Kga3+H6g+YpsBmKGgOo+sYS0l5xjS42DD650nmHt2q?=
 =?us-ascii?Q?g7ckDAlii972sEq+pOxw1vmndxodVNOA4HDqPDZS1evLneS8vUFwYYgqFpX7?=
 =?us-ascii?Q?c8/hcjyPGRqkWXrD1m3kN7J3mD2PymHS4ngY1dickxJE6/nhOnot8gfn2Xh2?=
 =?us-ascii?Q?jtHuEFP/ksMH+F1CfHbhoJBb7pD0dal/acs0rwjss12OK8wI5rGvyOdtOVjy?=
 =?us-ascii?Q?Jzk88qpFdyb/r8GDvpc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fe8606-410e-485d-bf48-08de1aeb42fb
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:11:27.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3casHQhGZD5/LWu4Zjl3aLFR+9b1BZKqrMuVs6XPyRZllI9qh0B3dgVjHDbTTwhwRxb6RMuj7S5iTN1sMA0gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068

On Mon, Nov 03, 2025 at 01:44:38AM +0200, Laurent Pinchart wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
>
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Johan, I've got the idea from similar patches you submitted for other
> NXP media drivers, hence the Suggested-by tag. Please let me know if I
> can keep it.
>
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c3d411ddf492..0f000582a1de 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -575,7 +575,6 @@ static struct platform_driver mxc_isi_driver = {
>  };
>  module_platform_driver(mxc_isi_driver);
>
> -MODULE_ALIAS("ISI");
>  MODULE_AUTHOR("Freescale Semiconductor, Inc.");
>  MODULE_DESCRIPTION("IMX8 Image Sensing Interface driver");
>  MODULE_LICENSE("GPL");
>
> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
> --
> Regards,
>
> Laurent Pinchart
>

