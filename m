Return-Path: <linux-media+bounces-45526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369BC06922
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47AB3BCD77
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EC631D366;
	Fri, 24 Oct 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H0FLbrDg"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F91322B8BD;
	Fri, 24 Oct 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761313822; cv=fail; b=a3T6KEHb9/oreosV8xToMkhsn1yj10c6m5bymEjdMvPrWv5wJ1poqlNxKMdpJEPLIg/G24M+4aLPXH5rziwba0nSBipKUczI1/zRy/NZyTkRjnywJ42mu08RSABuRJDoxd0fb7FSUOLXOXgN/InJFZ9YhyyrDWthONKG04GJWJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761313822; c=relaxed/simple;
	bh=gUuhFoJW6HAj7ZX77ANimlueIMizL8WPSXwvlsLmcSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gJ2M1rB3MihfM4YlNmEV4yMwf65xsqmt7T8dO5cPDUTFbGzKr8l4OVjPlM9wjdHKhTtMblj4EF6Ufz5zqcquePbyYaDa5A5rnoukMJ3Mo0depfL0LGchlrshnDTLGKVkmTTvhwDTv75WaatQAmLp5EyjhEtmMFw0ekVN1rMqChY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H0FLbrDg; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqruG0ZerFAMAS/jxyMsdw5YaoC3beCikGK9mPO+rL4TakYSMqDP9T39qqkueoIKN+KvTNfIlT4yd7P3iIQE9okrPvoFpFa7ItOaBtDf+x6C7NP4eeFMFG/tfWHg5ww4b+me22+1+l27VXZ7jb3ZwQmoDtvHf8KdGTMK/Y6GtmxaNJwJiKEFqnd1MWxj6RqCES9nGp9YQrw+RJ6d0EDJQd9WTCckXqcobCMZiq1snRJ5oIUetyJsnaOTALIeCNi2EPR9PfevAxUvun4VkZ5nX9VvJ+z0uk00O1op+k6pmWJRm/1ACaU/aC+uOttdTlZsgrUtXlUdttqyLKYCEnvJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY3YoXk+K+bmQYq37JOK9tlsrt4HXSc/QsJ8DOrxTkU=;
 b=MViVa0yYp6/0PArS8KudKJVa+KuyAAlReVBNd4DLHUI2wRWxKXkDS2/C/fP5tBrKdQA0IVU7lHqhGINohYP8rm5LiYg1Eo9tuZWsWluiH9lAddhyVxAc1uZa6QYNx4Rlqi90hwbOoMTcvPlrSrUEejRkgEFWrhNB0BlCk6S9s/5Zb27Y2cg0jK63KMrEiiu3ong0SJUZRBTHSLbaZlHNP7t6G+T1szncFWN6qj5F0cmoz00fOnILFMClYc+bt7sG8+g7z4404iUdXfsHGN//PaSc0CZ4y6mYiAcXnyweVWfsSuJ+WIfYy6NhAR4CQBvjHRP0Bw2fECsmZmvn/BGcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY3YoXk+K+bmQYq37JOK9tlsrt4HXSc/QsJ8DOrxTkU=;
 b=H0FLbrDgpym76+PMe6LovzOTC/uMdlwUQ/VSEyF0xfo0bBfSEqUTaFFmeTlekKUDtBnoRUXyrUzYUPBypq0x8LhzFxkUidSBdFplAujeGM/OCUO+DTPIdhuEcO8wmhqSlVMF++VFNhsbf2qe6z6vvnG6Csycavoa9iyPeikcWGZhlqXjhm/4gbs69PMJ0vg1cpASoBZFkicxQf3sQZF0VeFDHFi8nn2QT5w+9fjBeJuEOCQxjZB0aP0GlYlQMb4+uhaZZdT9DyNGbUruLw0Rvs3eMDi3ohYpPI1jMAICffNqWDeE5qEEjDEqF7UEPNAehP1a+z/FQTBgp80njTbE2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Fri, 24 Oct
 2025 13:50:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:50:17 +0000
Date: Fri, 24 Oct 2025 09:50:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 3/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Message-ID: <aPuEEDzY3FoeM9tQ@lizhi-Precision-Tower-5810>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-3-3ad1af7c3d61@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-isi_imx95-v1-3-3ad1af7c3d61@nxp.com>
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: e89f9775-7408-4757-7a07-08de13044392
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Ysjm8iCvzjaYVfyyk7J77DpIGFxXRDqrsPUvWzNR0EyJlXhbWFgyUnYvFQ9p?=
 =?us-ascii?Q?CSgqc2NWMc/x/hHwZlkq93jZXgby6Pktl2xvLXT+pCBJWEY+KyHSqJFweZhn?=
 =?us-ascii?Q?3uvFx0O++YgHcJ9aU2fKyJO/XKkdFe4LJMAwBggTB6ZZFqBlkwRBRwalfe9o?=
 =?us-ascii?Q?phhUKEtFl97l7OajpCrrGdF7btrEqas/wKtQvmabvA5htaIIfxPU6C1V2N2h?=
 =?us-ascii?Q?lmqWLfG1qvJqkrSdpeRF663lPC+niUt9zomudF54uIaa121s+MFoiZ1Uq36r?=
 =?us-ascii?Q?eYPcuvYiLJ6b0tfPRcu9HwM+D2ywJiRSq8EEioZexErMK6h+P2XStoNZzGZj?=
 =?us-ascii?Q?K94rTcVD0JbmJWN8MK3lQwYQdeYbCiiq3el36h8VGZAkOyrV4Pqtxw3Ef9au?=
 =?us-ascii?Q?b/+g4MH9jHCS5LlkOzE/RbdUk2AV1lEmofx5ph4s5xA4Mm35Lw8Co31kTgTc?=
 =?us-ascii?Q?s3bPVmdFm0K25CQ8acY5bR0H3Xb4aD2KljAsxRLSzcVT3G0XdiWguZa+jL8r?=
 =?us-ascii?Q?E50DnXD9oznKkTPi6UD2qd28+jrHZLpakDlMtlteC6/hik+LjVUXv8riwIMB?=
 =?us-ascii?Q?0FDGcSsJjN8bbgeyiItpG5/niI3dshRNxcrmdDI615nRecrJ7Ony64uZGrgK?=
 =?us-ascii?Q?7CtiBPgA7KTmNAsohh4b1NPbKAuKTZDIzV5Fjeb1Yjk4fSL8rOx/NxytOWrW?=
 =?us-ascii?Q?E0VDCXgoBPB20khKjkSLJ1Ny4wFxIvULS9qzz0gCwbjRDrHZAESOpWSiWfNd?=
 =?us-ascii?Q?9EJnGu4TYNn8dV01Xd+e454DNrq87e795Zem6ha+OTwSbCg31zkqepWh9dnx?=
 =?us-ascii?Q?AkOLxzXCiKJ6mcgrnFoxHsjNXJ9FiHB4xMr7XDLu4JZJSNF4aEkeWGg2xUsj?=
 =?us-ascii?Q?zFwfawLwc5c2ZSGlOemCVd0LBcHExY18bWQaN9QQJ+Gib0be1FAz2I4cTg5y?=
 =?us-ascii?Q?jX12oxdd/A5s/bYXIiAT9dRJ0xbE1tWg+GaozdIl9aTK/i1mMgzIym8DsA7f?=
 =?us-ascii?Q?afII1cgtIdpN0GzpnkrQN9U1QNLvbfV0Kw8NByRLlF7RLBWRotNO/GKGMgM2?=
 =?us-ascii?Q?IiiCI5zTtSYYeivRGi6hKCxXFTtB0KW/bXll1QbQ/3ETJ0WDmu1yl9mt9rsj?=
 =?us-ascii?Q?P6PLLsnRWAmTaTqe9pj9BsO/+ol4sWSuUSxaPVon3e+UscLuWbbuHLSn/zEO?=
 =?us-ascii?Q?Ho61dN9Yn6DBRE3L3VElLe7YSYzLznrwQXEpQT9RAvrY3MWi4/5BWUgoXHYV?=
 =?us-ascii?Q?VEoz+1Fw/woY01D0JPcQJyzQFLVlPeFCzwJPe/zvHRl1/n6PLnAAXxAbWxh7?=
 =?us-ascii?Q?6NX6EmWKGUW8Kyv2zi0IsxkvRGNrEIrSKDmiagY767KGerSEQnPy81n8yuJz?=
 =?us-ascii?Q?hZ/rFreEjddiALzV1/iXrdjwl5DSEVUtMoIXaEWF2Hp4tIOgzsuH+DJ+T3jW?=
 =?us-ascii?Q?tKt6cEKLZNs8SC9jAKAsBRhdRAW1MplpDPyZ2ZpxUlD7d9dqsRGmVg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WFZ5POqCDbfLSVc/5/s5iTyOpMf+RXSdVkzOPlBH9pdeTXLMZNC9o8CkS35J?=
 =?us-ascii?Q?QgavUKCKUG4PvLKKBd6UOUYWdPWECc8vNVMCc8KmONLdFor3RhGXIng/y08v?=
 =?us-ascii?Q?Bt5UBhGfKmTBCrilEjJiiSY5UOo8WoKFU9Mqp+Pr0XzgxjzaaP4edUNRP783?=
 =?us-ascii?Q?4j1+LL/mIXAlE4ZD0arJQFXh7uux/Ui5XbHTgeD7YRlcRjlFElLLZfl/OdnX?=
 =?us-ascii?Q?0CafUcHXiggwGcQwaDvMWNxz8ovflxz9Jq4GPHWTmiltfNshmwme0e5psLXH?=
 =?us-ascii?Q?Ln1DFVRMTsh/erZt5MD0ToVr0UnTn2uXhIq1w7tZYenHm74NMPJKejJLirRd?=
 =?us-ascii?Q?4D+2Xe+zU99HFFIzaHQ1EimtpI+ZP5jK3IxeLMENxvHOEINzQzJFKCEI/O5L?=
 =?us-ascii?Q?5oZpNd0x8a4kBZIi94fxWjWm/oPMWoWh+iurJYZxf80Sx6fQGuqSt4eRkVCv?=
 =?us-ascii?Q?ivmwNecLOwRSTe6DGcuhXqaUwcLymUzFLq0sVPXz+F26mrC4fM8meZTswvCy?=
 =?us-ascii?Q?xTOXvUgjJDe16pcTcnu0+c8GKAAGfpPsrSzFpSgOgzvRpF8mySbETWDuvALp?=
 =?us-ascii?Q?2S1fBCyeNYq4Qn7qnRox+Y4bmviN8N2RwUjyfp+UP5zvXxAFLDtDXb6u9NIo?=
 =?us-ascii?Q?Pbs2kFl6GFYb4kVAHONP1rf7LPY/B9JPM73JUSCAXWyagaU6ttgkNyeZObHR?=
 =?us-ascii?Q?+8a8jLKHeP3mwxVImDMUpgMU8ro59rRoinUNWPeqdnHgJ7sXwDydEftqqpzn?=
 =?us-ascii?Q?u+7+DkHn18G+MQZEkEaJw1UT0AZ+jgaEKU4UNHJGKZVTetrW90MpkA6uOxI3?=
 =?us-ascii?Q?ExVEiUEEWvQAsQmjqORN9sAMM3lhZSkdbMU1AMVlhZQfi5AGAh0j5YJulWou?=
 =?us-ascii?Q?k5CjVbhkp9S+a5HjYbYjseCSL/5nU14lzntAOOlcOfuT+U7baEP7nibEBmF7?=
 =?us-ascii?Q?E3OKZv2qfYDg6HgE50ZTh/B5iKr7T0W6YmCWLVmPZmoZNIYXt71nh72KZG7c?=
 =?us-ascii?Q?Tbdy6odyfoLB13kR8wn98gbropBwitDSm+9INUwqWPQAWNd+0ththzAoyiD/?=
 =?us-ascii?Q?Yfv12pcj4EckWSm5ZWzFR7jToiCQomgfGfSJAgsNp9LLtQit6UyGu0wvsyQh?=
 =?us-ascii?Q?XmQQ7fx/G9SnGCVTjnVo5ZEFQVMstQtah74ASMHVIuw8CwgoRbYp47CE4wR+?=
 =?us-ascii?Q?Cm3ibk8Z27kj7sU9oGP/JXCMZ/9KL++sUjd+bFBguZpLNQqNu8eL7vc78HPD?=
 =?us-ascii?Q?Da9KimR+HvG/u8TdlnrktnIbBLefC+cwHfvO0A9c9yCiRbCIgjECSnTFUM3x?=
 =?us-ascii?Q?S7QrlGjVTRwSTi5h+JHmKEu8P3Eu0sAzFUyiuYRSyjymY6zhQF9pEvbNgKtv?=
 =?us-ascii?Q?itRrFWfvG5VdRVXCHnAd4uoy6XAtSHcimE3RMSBzUuTgtYwbd+pUJaHe6H09?=
 =?us-ascii?Q?A6WJ0efHP/vjeNhXYVipzhuAj8idJx2kHn18dzN85CyGgZ0w1bgGatajOaOh?=
 =?us-ascii?Q?a/sAreb65iV03omXQ4lbDgy5VTsf+9AqedW6yt0L/vouiYxbD7akh+pj7z4w?=
 =?us-ascii?Q?k8pjR3U6JXVmEJGyaLJ+4y6u5qzMRGuPHE+6oJlv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89f9775-7408-4757-7a07-08de13044392
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:50:16.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQtdQhxNO/9OA/asDOT4iaaw4Dj2YUGFBrfK49Krlx6xixyutX7o9z/FN5DXt5WMlv8w8YdE9m/hd8H7T1Z1MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

On Fri, Oct 24, 2025 at 05:46:54PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The ISI module on i.MX95 supports up to eight channels and four link
> sources to obtain the image data for processing in its pipelines. It
> can process up to eight image sources at the same time.
>
> In i.MX95, the gasket callbacks set ISI QoS which decide the priority
> to access system memory when there are multiple masters access memory
> simultaneously in camera domain.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 13 +++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 44 ++++++++++++++++++++++
>  3 files changed, 59 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..ea9cc6d72bd4605000c6cbac2fa8cb9806e3cd3b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -337,6 +337,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx95_data = {
> +	.model			= MXC_ISI_IMX95,
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.gasket_ops		= &mxc_imx95_gasket_ops,
> +	.has_36bit_dma		= true,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
> @@ -548,6 +560,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
> +	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..d1297ac26c56bdd97e4dd325b2a7394430a7adb9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -161,6 +161,7 @@ enum model {
>  	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
> +	MXC_ISI_IMX95,
>  };
>
>  struct mxc_isi_plat_data {
> @@ -297,6 +298,7 @@ struct mxc_isi_dev {
>
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>  extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
> +extern const struct mxc_gasket_ops mxc_imx95_gasket_ops;
>
>  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index f69c3b5d478209c083738477edf380e3f280c471..6418ee1aabdad3cb92e84f2ef6406c5503987401 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -3,6 +3,7 @@
>   * Copyright 2019-2023 NXP
>   */
>
> +#include <linux/bits.h>
>  #include <linux/regmap.h>
>
>  #include <media/mipi-csi2.h>
> @@ -83,3 +84,46 @@ const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
>  	.enable = mxc_imx93_gasket_enable,
>  	.disable = mxc_imx93_gasket_disable,
>  };
> +
> +/* -----------------------------------------------------------------------------
> + * i.MX95 gasket
> + */
> +#define ISI_QOS						0x10
> +#define ISI_QOS_AWQOS(x)				FIELD_PREP(GENMASK(2, 0), (x))
> +
> +#define ISI_PANIC_QOS					0x14
> +#define ISI_PANIC_QOS_HURRY_AWQOS(x)			FIELD_PREP(GENMASK(2, 0), (x))
> +
> +static void mxc_imx95_set_qos(struct mxc_isi_dev *isi, unsigned int val)
> +{
> +	/* Config QoS */
> +	regmap_write(isi->gasket, ISI_QOS, ISI_QOS_AWQOS(val));
> +
> +	/* Config Panic QoS */
> +	regmap_write(isi->gasket, ISI_PANIC_QOS, ISI_PANIC_QOS_HURRY_AWQOS(val));
> +}
> +
> +static void mxc_imx95_clear_qos(struct mxc_isi_dev *isi)
> +{
> +	regmap_write(isi->gasket, ISI_QOS, 0x0);
> +	regmap_write(isi->gasket, ISI_PANIC_QOS, 0x0);
> +}
> +
> +static void mxc_imx95_gasket_enable(struct mxc_isi_dev *isi,
> +				    const struct v4l2_mbus_frame_desc *fd,
> +				    const struct v4l2_mbus_framefmt *fmt,
> +				    const unsigned int port)
> +{
> +	mxc_imx95_set_qos(isi, 0x3);
> +}

can we use standard interconnects standard interface to config Qos stuff.
https://elixir.bootlin.com/linux/v6.17.4/source/include/linux/interconnect.h

Frank Li
> +
> +static void mxc_imx95_gasket_disable(struct mxc_isi_dev *isi,
> +				     unsigned int port)
> +{
> +	mxc_imx95_clear_qos(isi);
> +}
> +
> +const struct mxc_gasket_ops mxc_imx95_gasket_ops = {
> +	.enable = mxc_imx95_gasket_enable,
> +	.disable = mxc_imx95_gasket_disable,
> +};
>
> --
> 2.34.1
>

