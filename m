Return-Path: <linux-media+bounces-40432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C697B2DF43
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D163C4E4A61
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDA426E17F;
	Wed, 20 Aug 2025 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eMBm/pJp"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487BD27510E;
	Wed, 20 Aug 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700043; cv=fail; b=kcbbpJX9ExtRFHoru3ZKvewUSYOGoRKctAHxv90eh/nYKQacPnTAc1fqxpuewBnxp/CbWoFSzQ3PWpSqH8pMhrLmzJFB+AOOANbAZwnEWYCMwV/tVX1tCfwrbkgzBOJkX16y4vjzvjrXTDgSAE4hBZR73VqSeqRuPaSt1JfIpYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700043; c=relaxed/simple;
	bh=ZwCjQpnaiQKDn/T8TRawJaTHFeu19Mo73z26YR/me1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=moHDm2keqbenPiVwPiag3BuTjp9ysDX9f+vq1nChJ2r/fRWnAkMHRlUM0IgODTQBk5sJqe2Fp9Vrfq0kbf1KDAT/X0Io3LHstOG3VQtZ/8SiHkIvLMd8Np/MOOR13T3ddAiW4+OnP4ktfLq3j8bli3CEHQsovYNvnYJp7Nmok3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eMBm/pJp; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqFFU81RfNVvtSzCTVaOrbg+R7Q8OwjuSafePmEEgcSjnRnT3RN9y5/MigVIMG/zDr7CM4FHuDh+B0ajvvh2K1jJ8+eld3XyUXL+JheZYiW33yF6NwPAAJdm8SofOQN70Ea6x1QDEp/BAqZcvZwWpC5YtgbubqEkaX6khZ7pf3oy092c7QFJe8o6aiggSrbqkGJAD5HizAlY282CR01667U9v1aVJMPSdf60WsysGdKSK2fvZ3eQWyzZ3jtfwWA44olt4G2CZrF2jj3JzZiGm/dDDC8/MnrR05SHj/4SM8A416wH7uQ4bOnDJ1xQi2Fw8MpB7lbTb+a938rVB/UvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0y9+S+0/oGs/jRLQ8Wbum1MkKzM8lvngx2r14lP66Y=;
 b=sGpAj1ZOk4oRfWxJdBaesJx5WyZJMStx3H86xk9QzSf4XUqGSA2arLz+fyKgUFnunNJlwY7h5k8Q+gDS8GntSP8Uh+WeyYVmODaTHvGz5NSLXSp8TmKKw5S9HF3YpbTvDzDnCXuZRJRW9lOjog/kcM/6aNmEHCwXsYK0jog4nB2sgruD8IrqVncgpdcspvTQJv6rSag96XEjvCL3Wm8C32blFgeGR0RREpzIxdOAmzlkH3aot+6f0mae6jeElCPs90R7mtNy39vwyNwidWrriNh5r94zjM/9YpODaNfxwsgfP3FYVrk+FtzcnKgjJ2lw9WKOHcUftqcyjL0WfQkFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0y9+S+0/oGs/jRLQ8Wbum1MkKzM8lvngx2r14lP66Y=;
 b=eMBm/pJpTHxcRevH1xjyjd2WVx6q10z8945MWVC1YDYPFoDfAKfrtGuTCbFn70VBgdhsZt/c0aVVr+b9aEooYW0/yfknyUbbQZ9HnHYODexjWvu/esrrmLJ3oMkOxNWvhmkuxYOJwfj54C9jRdShlEvmYWHpM9QQ9QqkENGIc0UdPrHqWBeU3OM7oqSv0TXYdhBKK3/09IGnWd87mtT+4ciby1W4WFk4hbUP4jH2RZGIehz6vDtzUuyXUe1JJ9Kgvl+UEK4WjdVX6JZR7ThvKFQVcKmHcjLHohEUmIZ4EyG+l8l+Hj/TVKxNIw4AHgUSTo8aVC00Ydz75yDkMFsHiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 14:27:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:27:18 +0000
Date: Wed, 20 Aug 2025 10:27:07 -0400
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
Subject: Re: [PATCH v5 1/4] media: imx8mq-mipi-csi2: Remove width field in
 csi2_pix_format
Message-ID: <aKXbO+P1az2HiB8i@lizhi-Precision-Tower-5810>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-1-e04a6fc593bd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-1-e04a6fc593bd@nxp.com>
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6368639f-7a0c-4efb-6464-08dddff5aa93
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?QsKOWynkCc7rPtEsmwajHgPd45PZdLcTsV1qOE2iTg/P4WMm3VM+0vtLCoZb?=
 =?us-ascii?Q?udC9Mr7CkrWhaU4C9U/BLAUKGG3K/bEBnl571EcZjkZ6dV82FoILKuP+m031?=
 =?us-ascii?Q?5sxalbfWM1MEFsu1AovwpHJDg8qFO47V7Yc//2pDjoT8AGNKHBZ8fiQ3iKnN?=
 =?us-ascii?Q?/jdDDhCpGsylfZWC8kZlNPU65MMvZEnVjLUgeOYD55y264qtbmCkh5NXLxO6?=
 =?us-ascii?Q?Bbv8HhnD9g1y6JWYc+pf+vIFY3ap7VNQvo1+u1ybECpDsTbWAtAEK4IROg8y?=
 =?us-ascii?Q?A8IAIuJT9OcS39ZQxN2kxvLYAM0lUIv88tC6QvdjhssD3JQW07/uqwbZeaZ2?=
 =?us-ascii?Q?JrkpZ9CswqxIiqyw64uXv+NKq2fIz7CYx+19FobvX62DcjQgS1bmgfFUgjBZ?=
 =?us-ascii?Q?5RvxCKyNF0Uq8MxG773+tMmBLDJ2aJHfn9Kiq0BUelnK38gl4QApw7F0HlIv?=
 =?us-ascii?Q?AnSidXqCVDIRLd3Bf7z7zXX9bex0+GcBIuAqK7hTi2oS0a3q+YdEVXbGtLt7?=
 =?us-ascii?Q?mkfCnV0a6J6xCFMl3rFQRjl0bO9SuLekayXMejAUDU38GwJK+KcvO0NgaA11?=
 =?us-ascii?Q?XxtpxY5gc0AfZPUIFPhjy376tHIN7FqJBReiEXYWlD6onfPH5T0cNYNMrap5?=
 =?us-ascii?Q?KdLl91QSrejSXaoOeVN/3JopyH5fFKUl/B613BGVFElm8/OXWq1Uzy/xl8uf?=
 =?us-ascii?Q?2ADmI8fHh0JtFUUp4XY6+fbmLoNGSO2yzUUvFaYFwhkHmFuCV71EXvy9NFGq?=
 =?us-ascii?Q?EjLHGkX/Z3SFXK76VzafSK+BYjwfauDDmLnvGPMyzyyix9bcVLROzxPZ7Ecq?=
 =?us-ascii?Q?LXBHMq0dMAEIeWGP9Sn+kqEGCFupx+VfuJ6/JhieOTcP/ZD26r395oRDSbYE?=
 =?us-ascii?Q?KNUa4n92JZmQCD5vBTryXIE/1418YaMfOF8RRoVymVuBFv6i5fGb9c/CIb0t?=
 =?us-ascii?Q?8lDHIH9ooNmB9CGUw2GxUXRUNs2t+K95le2ESjAkavy9qt/gn0Vpe9fDiXQm?=
 =?us-ascii?Q?o9CT844BReUu7S7Le3ABM+j4FGDzV7tgfknpotz/VNe3efiXQ2cjITBbmDZT?=
 =?us-ascii?Q?rgHx9AgvBaZwB8i8WnrEYpqXTXWPTQkytXuQdDbGPVbCowGD+0mNTk05RHRL?=
 =?us-ascii?Q?fL3JI4QOUKtKwjNXjcOMwmIWzDd2s4r/e3sGwyrSGNvQEvM1/VweAliRrSPu?=
 =?us-ascii?Q?6k1/bh7xS15pUtdmxtmWN6yYCcBouYmJsUoidkLAKgq7jg32B+eu5SVaeaeP?=
 =?us-ascii?Q?mnJ9O6DGw07tB2emBDratxDqpE4jEpDTjII9+J8faWlccGNahZghRDOW2ejY?=
 =?us-ascii?Q?whn9rzJMcqN5tXl8PwaUhivvBp2bdMEoKeYYBLbl9VJE1V1RWeWZxkGMuBxv?=
 =?us-ascii?Q?nm7d9FWRPp+r9KeZnJLf8mtQZ+0DkHcjxUSuII+ecwj/YD0XwsCajfaxcnTk?=
 =?us-ascii?Q?81M2kCmBdRoKq/xu+/qcLiV1s+xLLw5KRN5lXdggY8+Kfe4PNvGkLA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4jHiaUyvYySAlJitFro4hFE18v1qqm5UhONBCESKDNmHBkqiEIBU4ElwcWPG?=
 =?us-ascii?Q?qXmfB7n6D5UOlcfOGqbdnSRn7yel35IUdXqS5tZ3KOBNCpfvLypTAf96iNJU?=
 =?us-ascii?Q?9iIxWZNvgh1tuJly6YNVtMN6F9+qZW7gMrMNpMW1bFwwQmgGQ8Gt258bhiFf?=
 =?us-ascii?Q?h3hrt+JmnNsk4z3kx4YFFstonvB4mkzG2GN4MMNkhjfKuoIgu6J/F/U4T5CU?=
 =?us-ascii?Q?u0KSB5z0p/WhvrI2KybtokBFIcSpZV/Y4aOcZDBHPAE2BkVWLZqFwWlLP12D?=
 =?us-ascii?Q?IEBW//Wu45aYKj7n5PJpILvXkv4cZEKEO9v/Yjvc+tuKFCxvRunpPKusjhZ/?=
 =?us-ascii?Q?yieKbAIz03KW0u5kM9BT8eaSrZaKPgqQ7aVH2hCGJfEwHJND1WbjhPo4tI9q?=
 =?us-ascii?Q?Lcg3i9th6aMwhnLKJSBqYxqcFo5vd9VY0LpMp8viLclLEwT2fUitbUnxo+/B?=
 =?us-ascii?Q?E+1AHcezKdAUQ1an5XsjDF+d6pIYO+5HG6Kw3UaADRR/k5jEyqQMyZ/eTFv2?=
 =?us-ascii?Q?x35FRCGzt0GFBdIGcGqA+mExAV+vllBdamcFif6PRiG5D9t6BFJ59U4XyGTa?=
 =?us-ascii?Q?J7Eta9/oY6Wund+NAV9cBh4io/FwoEMcDf5weEJ4F6bCWK/ulQWR5xHTS6md?=
 =?us-ascii?Q?X4F9ao3jO98Y4ZZiK1aTIkHkoaDem2A1DsD0Ai25iHa2k/HU1s9opRyvWyPV?=
 =?us-ascii?Q?altIyf70AJ5BaY1n1H9kYmxIn87vkwADpeKowjhfCT+1XRgQI/Pt1bCe/ZM7?=
 =?us-ascii?Q?t30APtBGl5kPEqwUBSOfo3KQ08qM6rluBnlyvksSvpKDwv1Ejo/WYwlaRtGX?=
 =?us-ascii?Q?8cipD6ifTHBaE8VEQXDXV4xzUmHdrUngfRz2tf9LVv6pfOL68DlSDKpzCEaU?=
 =?us-ascii?Q?F5EzshcyEb1DNTnWA66wmUQBdZegbm7vxJ9J/Ro2ZSWIjjoyBmujRVehBcpX?=
 =?us-ascii?Q?pw0nc7+a8VJn9NMXiClM+G5lCYQxJUQ/K68cj84bwqxdhHU49uovZYrll46r?=
 =?us-ascii?Q?UDEytAEG8aZiCRtAOLZDoC8dxapFlpDvqrZdSTzSPu1S2XmDgQXFloOatq6K?=
 =?us-ascii?Q?lVs0pUDQ6wHIo7ZQFG/0if2JZZ2COHcMfSVCNWP1VqF5tn1llFl0OdzTgtsS?=
 =?us-ascii?Q?APtozlc9dw2mo26rxNoaZa7I/rarA0SdS17aqDoBpV/el1HH0kfY0gRibSnX?=
 =?us-ascii?Q?nULb+ilG7IPjD3eMEmGnY74TtpBwxuC6ygCmDYwEmP7R+evkk7o2okZvW+46?=
 =?us-ascii?Q?7zESVBelqosgKVwjs05A1d6muyaMjK+s+txXR+ufeNeWnwgkpRXbOOV4wb3R?=
 =?us-ascii?Q?sdjGA4itzOM75qOoglKoAEbT5bcsitNNHRVh0fokO+pVaZ7zZnrH7bUAD/kp?=
 =?us-ascii?Q?W/beEIfuMmdu3n2exTB/VdzAngweYWZGSdopJIzbXGqcIui39/x4EELE6gNZ?=
 =?us-ascii?Q?arAULHTyZKU0dv6WzWh4Gv3Aa5Qf13e5U1x1sLoyje4yY8z98+MHXxSjpE9P?=
 =?us-ascii?Q?s2RMfx9axzUt4T3fOUWaqZIpf10+7Wfeyx+ohG+XrIKY7K/dHxPPMRwm6WNm?=
 =?us-ascii?Q?sDQ4r0d7hmZZkrVqWJnSGE86Oa+J6E8zQd4IZhJy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6368639f-7a0c-4efb-6464-08dddff5aa93
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:27:18.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnymbaxKWsAFweJrrm8moKpkfuyoJaSkflrICnLSRIrP0DVgznzc8UVoHu9kz7weshEm7GspLIOznLHrcdM9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069

On Wed, Aug 20, 2025 at 07:04:56PM +0800, Guoniu Zhou wrote:
> Simplify the code by using helper function media_bus_fmt_to_csi2_bpp()
> to get width for supported format.
>
> No functions changed.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 29 +++++----------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
>
...
>
> --
> 2.34.1
>

