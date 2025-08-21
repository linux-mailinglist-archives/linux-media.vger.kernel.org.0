Return-Path: <linux-media+bounces-40627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2FFB2FE0C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291E0A20BE6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E731C2DBF48;
	Thu, 21 Aug 2025 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="leFJ0YzM"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4AD2DF6EA;
	Thu, 21 Aug 2025 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789051; cv=fail; b=MxDrZiZCreVkVx6UmmdULNKayN7uXoaN3YkgpdUBl9BuEq0awiWWODQOiMasTlKULCVtD0qKQgwHTlgeaVNdnCzXqE9W7CbKHpW6O+hrcAVLa8gDb10UorcxIP4/AerCYX+cqCnEmBNPlm5bdcbfBcg1sNnxY5renntQf2NDDjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789051; c=relaxed/simple;
	bh=K71jpr6Axwtkvo68+dQha0Haid6+hyEuxMhLsl9/aBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SX1e7yadTefqYxktwxDBF5TMqG4UUrxrclAHBLSorqTqVjRsDlionlFsEpCo7IXVxO5dgc9s9Yh2ix06GfApGkydhg4r0eDIb/HWdIYCWOf7iSFCMpye9/0XyC3cSUL1Qs/XSCY5SdtIrmWFKZvhef6WOrwmL/XMIznX3vJr3KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=leFJ0YzM; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prO4qcOrPWCJrDPbMSGeanWAlPGN2W7CtQoaQ6vTodjwRXs1llgBwWz6QkR9eI+6PmCm47cfYIji5abyb201vGRzKEy4KUI/h+XApbYFDXtNo1UKBnW/BhAAOxDd74ZAfZ6jv9wkeUaU9lkYdBI/097d5W/1aGFJQtiDZq9xoemmGJS0s3jFFQImNhQ2pnzSytzfKcw3dKEHQr+Y4AaF01mm0EBOI66iWOfefsm6lS175e8a074qF8z6eXgByl3lNN2udiNpPbB8MM+BYHtKFUwLyrclJVrkxqHBBGuAoAuTMscJ/RoLifnVD8aESZrS901C1xIBseGY1/7ruSqS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvcCIkiBDmnfigo0DVGCbwtzVOGqHA9D492eYkILjdA=;
 b=mKTuSKzwhmfwkZycdU88INarf1VnCKS6JEUOQ7GpSh5XmFw9Plnb7ZJoMDrLBw29JFFCwEnI2H1Fp1GOl1FeMLZVzRqHrcxyeiWFIQpJPtF5n1cdiWAyBxglOzRksiltXh2MDmog+ARwQFIeSpTG3Er9u5XAj4WV7KMZFN6o9kTf4vHMUq5VXaE2fkOrdACxXlsLyeiNqWf9Dlq7JtjdxYVoQUoDYAx8SYk6qvwZQrTAKiFjCIQ55Mj9E6rcXQjV6qf48bJYcF8mrx7yG1Ka7ZhHoH8L0KOLBEIlIYFB3rrreyhBwl+4YKyDJTIQtEP+aHK1fCtl6wBG19ADRjoAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvcCIkiBDmnfigo0DVGCbwtzVOGqHA9D492eYkILjdA=;
 b=leFJ0YzMHl3ox4x9VmPRJm6yLMwkh79qPQ4oUizrG2yjRKuuWCzcGMIRqn50nIBn5bXMyDFAG+QVQbbVgjhB/YfA/QfL2hI2UXr6nLu2OR0VH4sFhtUmaqflWxRqOCTITz3R250lFobbFEPdNNpPdTkeUesqW+yYJLIOfe60mN5QmXhFx4cUiZBpOroZtwpCMbNtloD6b7HsCkUwkMzYUAwrvy4f8EVWAeDkPYas0P3xlKfz0yQwXQfexuRhGkkPxkwFZGLn6/Bqq8nXmN4eU/vGdp852t/EfdX7vi546mwBVW6dwvzTSPdPeV+WdqesYI4B5NjjkjfUSWgSriirqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA2PR04MB10373.eurprd04.prod.outlook.com (2603:10a6:102:416::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:10:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:10:45 +0000
Date: Thu, 21 Aug 2025 11:10:38 -0400
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
Subject: Re: [PATCH v2 02/12] media: imx-mipi-csis: Simplify access to source
 pad
Message-ID: <aKc27pzVlhPUW8bd@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-3-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: PH7P220CA0059.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::23) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA2PR04MB10373:EE_
X-MS-Office365-Filtering-Correlation-Id: aab8895d-002b-4426-c02e-08dde0c4e732
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?6ztGpywAlgr/ksV8Xk1Wo2xRT0gEOGh0bNuHwfAl7XERsi802LpHBSDaqpND?=
 =?us-ascii?Q?1vq19MLG12lY23BLEkMJGGVwvKIBDo3h31ndKZcfw33yq4sjjZuQ8jQqjV44?=
 =?us-ascii?Q?9c9eMLbdLJmkrSdE/8lNl6dYZeaxBFMwO/wv4LwH2nb6Cgrl6in/zT1TaZSy?=
 =?us-ascii?Q?z684iuYPNVtfeI03Z3knCe4z+1FL8k0SbOFbpOb2u20GPK0Wyqp+UaoZtcNZ?=
 =?us-ascii?Q?J3P98uXRNTCxgulAvzyLp7WmnxQqWZejwnHHcXjezTy+hHt4e93/zkJK0xH/?=
 =?us-ascii?Q?zuyvaMG7DtsOK3DVNTlRdwQWXl1ei9LWn5IvMg5TPxFQqawEInftzUoqBR8W?=
 =?us-ascii?Q?mMLSLP+L4aQwjfNwzakstiM7MkaS41z/u3TP0sySOruca3Bd3n4OhCweJHTs?=
 =?us-ascii?Q?om+vlNmjgW7ZzmJE/OnIjtDp6sImKQCru8SLaR4nFYeD4YQ+4D6DFJJBr8RH?=
 =?us-ascii?Q?jrk6AygKhGakm/BCCxYR90obT+C6GvcraPMCW2+kUJ5CcaJsob/Z7EZZUMi9?=
 =?us-ascii?Q?XmrmLBN+tfHrlZ7gEwnqHE+Sst2QGO5eP8i/co6iJ+DyZTWq/liIsLLDvdFQ?=
 =?us-ascii?Q?RbxM826GoggUqaKAO9HWw4v6YPYUxMzKMGA3LTvtNOxb+ax1jnrWM1dUF1M+?=
 =?us-ascii?Q?4hPOG+nPqxvTJJ+sUqQivs3bFA+yCuNqJR1cxgVPipG6Ops7lfjAFaK7GRcG?=
 =?us-ascii?Q?zDDL1tZ+6308w29uDYZ+rdlpWImMMCUfMisD/CI9R/2lqKI2hQtFJQrE+da5?=
 =?us-ascii?Q?YcQbIr+uEopDPjaJbqNL4qS8jZv8IJ/zPSx0tZTiiuWQIaeBaYD+lR+xmCMV?=
 =?us-ascii?Q?GOVWyFGJ9Mff6ncmV672J0/Zt7Hl1Q30fL+4HPbetfTWBfLmn0kK/R22YfxS?=
 =?us-ascii?Q?3NB6fKE8LRPUfn1LnSIxxhRF/buQg+o2o6KyBQ56rn+q2GaOWntkEugpdy56?=
 =?us-ascii?Q?6BddPriWViWwPfgyHLUB8iRiydGjE63huFZ1d/ib80apbXqzLXcBn/wpw/9L?=
 =?us-ascii?Q?nDEEywbCEjbW9tWLHLH+qeFrTZSC3X5e+bqcXlW2L7dwD2wt7XZBGqgMht7Q?=
 =?us-ascii?Q?pKsNfZ7GmPi5uiAYBe1t40PiJMzxImsSWoU5uIbQ5aljYPCLDwdYVxnORdN/?=
 =?us-ascii?Q?t/jSXVfwe4WZ0KWabGrhHLzQ2zb2pksqkhZRhgU7NbYikeqc/svGtBrZnoUH?=
 =?us-ascii?Q?L+7ZXXPQI7i6tG1B7zwPT+2JjGXFxMzeTitHAtaICuG6ylmZBOWUkRe5eq7Z?=
 =?us-ascii?Q?oRxREhC6e1mXlj/EqprgSD6LUNFESkPq+O9+ajyuIm7wkNoVdQ2Q5Js0quEW?=
 =?us-ascii?Q?/Hz5ZssT9VLPrvx7HkyWuSHC5BUSGzkq138zsTI5I5Wjne+uFpYzRctnbdPv?=
 =?us-ascii?Q?l2ur/lglCOx6zKa5rm/3KN+QuI2aPGNuC2oITBuxtx2KAMESH2EfUBrcBajc?=
 =?us-ascii?Q?kxvqPNhz42frX/EMy4QWo2cBmh/I0JtEkPFtKRR8awUjzXlvhPSRRw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FvaBfEk9QFtDZBPLdmjb9wdfibHXzHonz1FMok5K+XSP4hAKH8EfE7D70Tqu?=
 =?us-ascii?Q?ZfILPe4Gw3K7tmA2z77c030VeGeF/c1+i8YujjLAES2gQZw5BZjDlxZ9v3SZ?=
 =?us-ascii?Q?oRvcNNwMTpXZUjlUdFZY2EL+1kHRlXJb+XtWsXwnmWyCwZZRe7oYF/XlTGd1?=
 =?us-ascii?Q?JROqUNX0GT7xB1+KGRDU/V23q9+klh2z7TeJUaWaXhQcfpT+BFjto/KS3LCp?=
 =?us-ascii?Q?nTAi5zzTDKi/ukFrhrsh7yCbJuh3DQbrv/Zi/P8moc894Zfx3i2E27S6ZFHI?=
 =?us-ascii?Q?Udba4QLzYDKitNi9csZtler5OM+FhmXhXFpA6Gpid/XuzATHDQBLW5QQlACB?=
 =?us-ascii?Q?nzh4d0YGmMYyM8PmU5+zlHI1FpMTk2ZhYJpWYagxfszypddLf7B8uIud0BUU?=
 =?us-ascii?Q?EAYbSVoWVyfyUgglz9VpCVUIorjzzY/8HsFTtam1iGwNPdbFJ2aC9kXCnL5h?=
 =?us-ascii?Q?hRezhNGMKhC4uUrKeL+RKiFKWKniIgqNYgF4HG6RGof5y58Em21Ea+VdFHkY?=
 =?us-ascii?Q?5pu/hWvQLVNwuMAlPDm2/uESnnxWnqdzxUNQoRXEDOemUH+whxZXVpIN6El1?=
 =?us-ascii?Q?+UZdXnVFtCRwogGOsOI7bAe8CT+M39QXpmUDw5XAnMU7PJy+rwkXlRDYOhFx?=
 =?us-ascii?Q?PJED7GWvdsQBI1o147bkUCsvqX6Lvp3L8NAU89C6be0pikIaAAgO0pXimB8G?=
 =?us-ascii?Q?4tWF5CJhOeLW3QPjkrcAZEf9EtP7pnXufLZDw1wyFoSlseGp/qYUCKA1OVOu?=
 =?us-ascii?Q?0ZbuhBXxSfA12euYxbThydFr7UavgzE/4a/N8dnAzsyhy2FDW2S6IullC7J4?=
 =?us-ascii?Q?AkMlKRuyvhg78vDRIqUvjPFHATdhepMEL+i/Tflnvv8rIJuXMKtc5h9h9Ky2?=
 =?us-ascii?Q?aVciFC/bWV+d4aTKFCDXqvlGLalnasbYJ/4lefrZYRzNmlJru+UGRxkpdWKR?=
 =?us-ascii?Q?UqznTjuJTj2M8o2j6Xj/JGQ0GkHMHkShwUSojGX0XheB/aQXBTgWz/QNgj54?=
 =?us-ascii?Q?hHZlX56kwcBhww01AAn13knokVOsp8Cm/zwrd7SdD5QfcFG/eTJusVVWKx1r?=
 =?us-ascii?Q?FOFhyTT6cB/C5Ui55p0ubuSHFAp1MxNh02xA9rqLGjYw0akr+ZIrYMZvOhbV?=
 =?us-ascii?Q?tEt85sLoNCqDb/Sh2V40KCBUnZ3uJVtFz38uTJLfvGhIPwYgNGyQzK2tGKUj?=
 =?us-ascii?Q?fTd82NplBDh1fPgyeYNiOx1As/NH0oAGePzsEQ2bW3uCec9D0b3WN2Q9SsR6?=
 =?us-ascii?Q?PtL0Lfh+ZPCAdyRRSkz7TXBEjMwgJV4wqcKXMUUDVCJ4quuedwsfHhz3ZzCl?=
 =?us-ascii?Q?mct0UE9eT9eZpNkUv0fby9y/QucNaeaowBHor7++UsZTRl5imntG0wncSf6Y?=
 =?us-ascii?Q?JwgiuUy2crA973rsB8S96D+5u9suMQLD8haX7yhFLSkYzO0AJ/rkzj/uwF2Y?=
 =?us-ascii?Q?VCioB0d7dcYLkmPs8zaUWC7b5rCFAqRr+9t6cGtAJi6IhmBU/41S0MULF5CP?=
 =?us-ascii?Q?tesU3sEmguLgUlxWn+sXIPfqrdjXRW8drHWS0jwDAOsJDoKBb/UR/Rus5uYE?=
 =?us-ascii?Q?xyL1CMg/dSLDd65ap8X7Tytfz3JUsN5165lTxZbZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab8895d-002b-4426-c02e-08dde0c4e732
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:10:45.7975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Grv8DbbPTMCoXh/VUlEV6RG4NSEn0M89vNsAajN4942XiS3/GeVHaW8wMk3wNUPM6k4Hl5u1ovyOxuYZ1Ignww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10373

On Thu, Aug 21, 2025 at 03:09:34AM +0300, Laurent Pinchart wrote:
> The mipi_csis_calculate_params() function needs to access the pad of the
> connected source. The pad is already available in csis->source.pad, but
> the function takes a convoluted path by getting the pad index and
> indexing the source subdev's pads array. Simplify it.

Generally, I like add "No functionality change" in commit message to help
reviewer or developer direct skip this commit when bisect commit to
indentify problem.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank Li

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..46f93cd677e3 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -579,13 +579,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  				      const struct csis_pix_format *csis_fmt)
>  {
> -	struct media_pad *src_pad =
> -		&csis->source.sd->entity.pads[csis->source.pad->index];
>  	s64 link_freq;
>  	u32 lane_rate;
>
>  	/* Calculate the line rate from the pixel rate. */
> -	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> +	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
>  				       csis->bus.num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> --
> Regards,
>
> Laurent Pinchart
>

