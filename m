Return-Path: <linux-media+bounces-45086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1CBF3721
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0EA3B4FDDDF
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560952E718F;
	Mon, 20 Oct 2025 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WYU404hS"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD0E2E6CD9
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991863; cv=fail; b=rHhG95pKS1sqDWZLPkVKQd9BW0EPrMdU8pnhCVpREw/zC4YTd+Ws8kAp3d667hbni2RXf+NSTMQL9t2vmkqocP87Bkzt+mt6i/bYybKDg0pon3Xa4XCXHukOuFlFbnkM7q1bE7YV8ULP6kGFvNlf2FfEVS6gOqsmFDtwTSpR6Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991863; c=relaxed/simple;
	bh=NSbOzmhJgWKMHvk3TGDLUK7KmODxHVE+gbhwD2NGsdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cGs52KF2x9IDSALkHU1ncG3tKclnAammNxcGXjs39GZfb74mnuesm71mmBiEFrM1STod5lQ1It099wFSDtEeWDIUjBIpppk5W2+mybv4kPMwlbpO8w0KC9LkBLZh/n8eqn1kq3A6RVBC/9UntDg76wF0rmcqRqpe3up4RV1EEyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WYU404hS; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZQbyvzHzG7OIj66rm2+HH0k4Aq3BwGzTNs+nItL/nhF1psvYUyHVF4aDNxQUwm+QKHIeqp4mC8zZYGCvErDPEryA8vlng8iyHMaCFYgcC7qBBFHMdcVy+tkZwG+Ujspjuagr5h3OkObeRjUllTQYUyBCmubTolAmeJPzhsAhfqbukvumDvQqpHhumdhRtDQcEeRLBP+MKgjQErCQ33VgJTrDWbyFfnMDraNwxZYC1+LwDwEKIG9c2reYepIgRAZPGiqiT/hpsnHBB/woCmKpzQYqpHaRrB1aTRHc12RnQZrOccr9PCah8m7N8XlQLmqoNqhsjtDiNnSEZ4ajKiGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zLdpvBtwOKYe9XYoNzotwq07cw/YaO9Ptxh7r6kneI=;
 b=jGBFXdP/8dR7Cjb8YVDygq5QifUBu8HRIhLQIaeooRORDY51mN4PIxOJd5ZqhZHRcbdZz8pI+TjKtPMZkOZvAucgao2DkUsyImrKPQUZffGKxIFeTCvN5FhIn7KR/7K31t1Owy87jGaAVG1GFGefMR8SKSG1m0i5DBYtkIR+LyQkZWdyBIKMG1kgAs/8VkcKlqItfLDZwPm4xyFXOyZyossFM0i6oReRni4oc9A6za8bZp7jFfOfKS/mR/xuKBSlLk+jwUydip2+ZuZbl2ocaq1VELYvAMkxovUCqn92a5W+baM2YAZH+/rxoW0YhPYL5MmC4EM+LJjC8IA34Nwb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zLdpvBtwOKYe9XYoNzotwq07cw/YaO9Ptxh7r6kneI=;
 b=WYU404hStNrarUHJAvB8rwEkaM+wh9edc8ofQJDV49ZYHP/JUjf5WYf9cG4w+BC+QcfSoBNxGD0HtymOFbJy2ocWbVMWbgoMg9yQ5rcKQAW/RPL4ZNnerj75isOq6jtqmC3jip4q0WlmFXiGTRTxElYUh35dYvL9bM/sSKFIG9RCt2wTASvF1Rt9miF5N52OF0x6jHRwl9O3pDxLP93n9jmzcD/qIinhz30xo/KWJ9VhlJF8Ry5YGVeJvAMn7TlCrRl5dJ8RCYYy+mzBxAHj3AJUZBW95yjDgoQYMXq5Jr76C5cuWf0VjSSxHY4UNKI8OvptbIlF3CTmT22b08Khsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VE1PR04MB7391.eurprd04.prod.outlook.com (2603:10a6:800:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 20:24:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 20:24:17 +0000
Date: Mon, 20 Oct 2025 16:24:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx-mipi-csis: drop unused module alias
Message-ID: <aPaaazVGEVuoCY8I@lizhi-Precision-Tower-5810>
References: <20251017060051.8204-1-johan@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017060051.8204-1-johan@kernel.org>
X-ClientProxiedBy: PH8P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::19) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VE1PR04MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 5987047a-b3d2-4443-e2b7-08de1016a4d4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?U5t3j6m23nhOQ+xHZMN2Mv5Cmn2IO44EEHg/BOyve6RBCO6KnGjBSqm2zyaE?=
 =?us-ascii?Q?WYsz0yDJ1KH6st8AiX+ypqyXJhlPiBHxasl7cJmJ+eINAnJwDSxZ4BSbCvuS?=
 =?us-ascii?Q?1csahCNtVkBGNGLrG0gZ0AolT2gtUv+O1BH7Fx7tsomy0piCjDv9sa4sRb7b?=
 =?us-ascii?Q?A9PHls0WC88ngmHQ32kHiDLlyzqj6cv3hKXAuUhG+wQgaBUYEQ1QwowlojOh?=
 =?us-ascii?Q?yxzyYlq0iw7EPPHJ0Kd95sO9G7iLEB+/P60/yA/gCXEH9N6NS7JJ8WIQ0oXl?=
 =?us-ascii?Q?V7vYFxo1dguXFHp1Dn+T1uixgkQwU8Bl4NrPGCxArYdYJTE9N/tb/Lz9Bi0t?=
 =?us-ascii?Q?edKxB6kxZSJd1k7m+SETSBab8ZVtUSovlKVtpHTTr161rzHEPUsOg7icaR0Q?=
 =?us-ascii?Q?f0laT9pZa0LmtW8UIGGqMs+lhVZAeD18IzdjINCoocj8HAKU+STrBDoyDn8s?=
 =?us-ascii?Q?SSEQw+27RG/Wc09omw6ieODz2rAnMQ3zTu/qEJivNoS1bMJlLGap6blyFOkO?=
 =?us-ascii?Q?DguRQOVuPb0hOru2woYjqE29UMm4ppnOV7d9jCOBDy03cWbt5jouPiNSx3hr?=
 =?us-ascii?Q?k8gxWdCwo49pNHhKJB4+Tw2aTkqstLNSVscDwWfKuqLtVGvKJmKcQNkfAZIB?=
 =?us-ascii?Q?t8y/NCNF9272Bi1fvHwI0wFjUllAr3kkV2cyTak09iT3nAvrckW93AbBxu1V?=
 =?us-ascii?Q?5fDy9ddUfqMPPZylWuvQXYIIN9ItCfuTO8wUD9RS97WvbnYFIIkxKCk6Rub7?=
 =?us-ascii?Q?ZFIZLk8EE9IxCuWYSfV2N6k1CBbeD6L+73XJLjr1cpxPkiwnkEV6v50RfEhP?=
 =?us-ascii?Q?2Jy1QzghE8WcKShHJHMrmsyWFoX6qJlqnkUElkN5H7ACm9rfLVo5GiiAIK14?=
 =?us-ascii?Q?6hOFATsvaUgtLN82If3XFzVko7Zx87juGuxDbJzFebrTpXcoe4moWlmdmUXm?=
 =?us-ascii?Q?dsN8tqDau1BE1ytDTmBfCDDPZf4pz10P1YyJyYqvPcp+EIeTXrGe9tFC19oM?=
 =?us-ascii?Q?83M44MuI2SFhnkQLfViM/rcse9TESWtlLhVSuAqci9hmnyp7Ef1/9qgcTvEW?=
 =?us-ascii?Q?hQyoqRh6nVn0STRrYeeJ9fzFLu2amZU2lj0vHGmr2HFhvRBRmfX54ku72Vif?=
 =?us-ascii?Q?tZrvOFvQ0GDJS4+DdxQA/hab06C9wAOFpERXur9BQGcQAIN2oJY+ZXHbzitE?=
 =?us-ascii?Q?VbSTMyPzs4I6byu+6UXrPA95j/0I35qlU8Sp6igWraqcwm6pV+q2Bg6i4paQ?=
 =?us-ascii?Q?OMpR+6jGB4X7YoxoMygKw+LioIPcL42j92FXeGFw0T1hFAjK9cxxlEaFAue4?=
 =?us-ascii?Q?1a1AQFa50U5birs/sDBRY9Nu5mGir26KZifaqQ8OPLAvbejU0P0hit1cLqQk?=
 =?us-ascii?Q?EDRNiSJ1SQZpzHpOwuHLJebzGLXOGWEIJ8Qe0lJjpO/CSQVFJpy+RpeFpurs?=
 =?us-ascii?Q?NW8IgtdEgxIXBzzuHJLHnP4XnicXdRjaWe7mrNTDeBU3iIfICh2UyBB5Af/L?=
 =?us-ascii?Q?Oh3oThA/5apmxF3ISIfSl+0p5LpIpCLA6xOY?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?PUjvXY4J8g6yhA4It+EYIaF8ON+/G/HyS2TpmDtla9idUMUg08IITIwNq9/z?=
 =?us-ascii?Q?+gnN78p7iryJWU+GHePhrYG56Jx2YRcxHlJ7SQObkxfdU66mtUh4BqgisKIL?=
 =?us-ascii?Q?lnunh2o7Z+TOpRlogR+aZu+l0tCSiU2LuxcYKC5wGXbFSc7mAyFKfKP2wDLZ?=
 =?us-ascii?Q?avsl5nUswBpLIY8lWj9M69g6JmXU+JPI2X70iKuCABXEeKax+3Gm+T2RjxnU?=
 =?us-ascii?Q?zaj64GhMgN71axFmJTk767w4FOcecYXt6u+yD3hX219f7nnALJY5fwD8jEfO?=
 =?us-ascii?Q?FdfESNjKc2eplsNd94+GXWuLg8QOFSa5dIukn51Jbwc6yulT5mkECsCQ4vTG?=
 =?us-ascii?Q?5fpUsdQZlvKW4HL/CBDU6PILpP9LBfh+OnHZXiP/5ZMgclh9FpJU2NjEYS3T?=
 =?us-ascii?Q?+2nuFgjBi02f+bygg1tcL5rO3HjReAO4G0TE3rCoR1OdUKY7PSt49dVLnvDu?=
 =?us-ascii?Q?YudrFy6o/mmsQvLmjGsOPTckQKSAM5SSrAvSTMQxOT4+jHFsxEu/viIfxIHZ?=
 =?us-ascii?Q?Ye9jnwk86TlyCuzfmwCpu4lLeaQfIQUwsh3KsU69Gso3h1wlp8Ypz09smDuI?=
 =?us-ascii?Q?KOAEs216pG8noBTT2RdMYhvhvYsPkSk1RKCwnu3VsE6fgxFV07dFfXQSXgBb?=
 =?us-ascii?Q?yRXtbOS4yuJ0AEBXPKlOOX2WtdWpp93ZIk52N6y4Myp/1a2sZw5gjWl3eLP9?=
 =?us-ascii?Q?zO8Ak8hMjZyZMi0KVDm2Af71Bq/43yiysOfC2hF3qODMzciPThaHrEkTjcJZ?=
 =?us-ascii?Q?GcJl6gkLKn+BKqJbmwVD2J4vmtXXXOc1PUlkzlDpVBPjVqyTzEyLMlZYDDq0?=
 =?us-ascii?Q?wbundXWNwmIGq0fbSmJFv/wcGOGMLriFI2Hws5O6ucEG/F3KismFmpgpHbo7?=
 =?us-ascii?Q?LHHYM1SGX0xDqqtwyqvTVrlKeOZW5QoNPsgei+YthiEg3Qkz0cDlaPJEZndE?=
 =?us-ascii?Q?izJf4nj3gKf21czX0qGitnnLwra2wS3AiWS8/PLsx2HSa0C23l05sNt51De7?=
 =?us-ascii?Q?o6n9/c9CkB9YD02XsCt0bo1tNcPrN9Ou6JAdhJyKn6FhB5eDH/d8W2S/ghgQ?=
 =?us-ascii?Q?ZSPaYD66paZ0zlogXOdlzGza95aPKhnI4Np1FvfzNuYrfOY1yHEOEEQEsQbH?=
 =?us-ascii?Q?HIls8kMkwinVWbBAY2yDrw49rX7mdiJg0JkSHnQaObe6EV3WEmX2RtdsgUoe?=
 =?us-ascii?Q?GCsApFwbszcse3rMZdwjYkO0C0V0gvo/oMMLTN5nbJQ8km24cNRgxz1i8mVT?=
 =?us-ascii?Q?HrotNPGXWoSFDEHGNZ/pZ/446eIBAjN9PJ6LWbUr/iTPKTjbbcEgydxOhr8e?=
 =?us-ascii?Q?OReVh/MEnulubkpZ1b5xjyY39J9owzxVPyTeFaaYd36C2cn/G7hxgw4ahRcx?=
 =?us-ascii?Q?BEKtrceva1kiz2gvQOEZqAcdq41jwT5x6aosx/dtUhAKZbKO3mt02nGlgqVw?=
 =?us-ascii?Q?CLzwJxpgmYuRp5Yo5k9ZmJC/nCAYfE672uHXPPlUYT40xImQHL5animdoaOU?=
 =?us-ascii?Q?PqGNQ1Mtmc85BXXHWMJ6t1fSi4hZcDuHqQvDu1/DA3BZcGmK3uDTphbWnjPq?=
 =?us-ascii?Q?ChYu5ZU8hljlToPUcdnVAqOwLRWolbVIZypRfjGD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5987047a-b3d2-4443-e2b7-08de1016a4d4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:24:17.6438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahBcZn0p7cviGGtSto7a6JB90liHwtGI1PvHFK4VdMkd2h54k8BzdyKMJ2AfMo8Mvkgtgul+uKkS7PxpxYSClQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7391

On Fri, Oct 17, 2025 at 08:00:49AM +0200, Johan Hovold wrote:
> The driver does not support anything but OF probe since commit
> f0e7cfbb43f1 ("media: imx: imx7_mipi_csis: Add i.MX8MM support") so
> drop the unused platform module alias.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx-mipi-csis.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d5de7854f579..fd399af56e0c 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1634,4 +1634,3 @@ module_platform_driver(mipi_csis_driver);
>
>  MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx-mipi-csi2");
> --
> 2.49.1
>

