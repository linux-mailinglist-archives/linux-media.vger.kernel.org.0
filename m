Return-Path: <linux-media+bounces-51423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFsjCZyEc2kDxAAAu9opvQ
	(envelope-from <linux-media+bounces-51423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:24:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2B76FD6
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4373027684
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E17322A0A;
	Fri, 23 Jan 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BRJR1qgy"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D483126BD;
	Fri, 23 Jan 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178111; cv=fail; b=l4X1axV+NilDebmPVglaeTOOlSrIk7UndBcb2B0t9Wahrr8dEU+HQwqB7fKaTiYkGHQDjsUD0lQ5P0xrtCh89D6mrWXcpJM1REiGuLnZOueVoyRldxnO7GOO+AzKwkJSGMfp+SdxMoidpqIE4LYJxh1mcrvBAgins+FNGtCMLPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178111; c=relaxed/simple;
	bh=fDdoq6uqo8mYOiTwB5uB8sy4be0/lqMdCgvxxH3g5f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qQ+U5NL1McWyv/9CwP1D+sirgUJEM7lZ9Z5Xag4tqgXM/M1qHkQkZCE4iKqea9G6DGiVU6PkPE71jD7LA0u2pv3wqYwpwlsOJW7i6QiiLpKB/PcH9AW6fs4swG40d+qC8PJlzDv+9kWcj/gEB6QmedBjOw3uhqQQeYwCMmFX3GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BRJR1qgy; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOxbf2CnbTtVAXI8j+hl3xBnbM3Z8VvOS1+GiqWB0rDw5jYCruhWF/ku+nheVOr04oXR2W4kjtqOMUcRxydh//Pe2aXfyZsKScaRxupDk6bZ9iB16bpP/BBt2iUuJIvCDtv0yuc0YnNLPLRKeuTIQ6Hms7MZ1QWqlvfhr8jenZ8xXoMsPF86wHFHENK6UnYdXsRhdpHWhiwLpAxHUByFEe7YJBJb1Ox0iMSv/yZsRp5B0ZK41Q5IQoydE8rInt4osbFJV+YSUKpP3eaZhsh3UBgw0t13RsaWC409FO3RHNRp9jV66nwq96E67xtyKWSUOS40vt+Wd8GNeUfLzPdRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0znYzDIJeubZ8Rq91erQsdfVqehlDe/vcyhx78hSFGc=;
 b=NZtelT5bF5IO7R5rstuskc2IUv0GEfA4VZ5GqBXEsV2fOoc7rFaeuDcW2S0+0ieyzrwHwYQ/UbBlZ80EuzV7VVhgLM6Y0RLM5o9lTxAOi6PYsf3YzQNByhBmTdBOAGgAfnXgSYAf3U8S54+r/aKVFYPo9c+HroWLFrWkpQ7jsIvZz4oM+XF5EVz1/g9C28NmBPO3JtYTIm4XplU6v01gwMPrQ0uhdLuVWWz4rvFXfhBo8t+enrZL+0BSP7daORGeyPkw8OK28jB2/aKRw24KsIzHPyBeujK5kIylUyxFWt6WKVhWiooSj0ahS6lZvUTIaWbXATkbnFq0yYp6LWyyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0znYzDIJeubZ8Rq91erQsdfVqehlDe/vcyhx78hSFGc=;
 b=BRJR1qgytdxVOiuE5lgQOig1qbReHuJBqI84qGuBsIw18okJvWvral8OwbcsSQTY7IC+9zIsD1JjpyaV6Nf8g4QgCvUWZKKh4mugHyQR9fx426wefwVmAOEAMZwru7sd3t4GvpERhYjYN9xRPariLn/M/4CZsXIOW8U3tFxeVzTIP/zid0PphSVIjUo8EEfZiisLn3HA+NY+tL54M7bLbuddQuYV9yzrrTwUBXcO1Mk4xUO4Kf9UuciKg4QBN2C5+Ex7Y5AkmjUOBcROxrKSvF3Qk1y0M7onB25vGxhcWL5oB+2OiDp7OGHjhUm2S4FEtlqC0E20IUVvOZiVuAkhMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:21:46 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 14:21:46 +0000
Date: Fri, 23 Jan 2026 09:21:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] media: nxp: Add dev_err_probe() to all error paths in
 *async_register() helpers
Message-ID: <aXOD8VHX3BQLlt8t@lizhi-Precision-Tower-5810>
References: <20260121-cam_cleanup-v5-1-01d1ab38db9d@nxp.com>
 <20260123000047.GG215800@killaraus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123000047.GG215800@killaraus>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: a54c639e-07e9-489d-efcb-08de5a8abd56
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?me0DhdVwV7p3G9lDdMIKQAJI9HQgA6wW9d5aobRw/ieganbzKfp4mKGPT7WL?=
 =?us-ascii?Q?PUX9rPhP5yMi345jg64+nxwtK0/kyO1LTTacZCNW9uoE/wdiE4c0itnVXnrB?=
 =?us-ascii?Q?YfvKBT+Zntoi9aQ1/wkYYDrPcT/DMg1pbTqUXe+yQcwIH/y2OcPrYoeOkUfU?=
 =?us-ascii?Q?zMPCRmrX5g6JqaW1h3HrPwOaniXdNt28UVEJR+K9/220yb1wTr7qPcPT1EAd?=
 =?us-ascii?Q?jRtgF0ROrf/HI4jVIfJ+AMDj6zcCl1jVTawVsK5TrPuhaOaaQq877FMss//0?=
 =?us-ascii?Q?njBLo0m3YVaTZhlPCMFqa/Tduq/8fHd0gl7njSO8cMyTGXWE5bG8fZX4JFhr?=
 =?us-ascii?Q?FFiNkIrKmt2c0F0COmGTtzt8PTgTp0rHBxvPiFL+nwCSmpdC+sRIRqP1vvX7?=
 =?us-ascii?Q?fFanvEmnTVON6M3Vs6Fv5H4AyU4IIGuIYgDGM62bh3qWHkB4LvzEaNPaEBPl?=
 =?us-ascii?Q?nBPIem25GzXx6R3weQcYvjRn4hd9LXwH8AhwCbwKedrNgOGidEd6z0Y2d1qT?=
 =?us-ascii?Q?TsWpGdpQXBt9E54nKOzOv5gh08OV1yFTgf6CXmahnj43rtqD+TaUXNYVk2m3?=
 =?us-ascii?Q?Y1AVFF017x5W/sIaDxKgi+ntm/zcGo1iX48ECtt7hyd+//5Ks8stYciBZoBK?=
 =?us-ascii?Q?GQgURPvcyUHTCZLnLLS0ReXtxfyvqfnlet24cuFbTbzmOiqEPLFyjzD8DBfe?=
 =?us-ascii?Q?UnFsx4MOAMyaGNtF6Ar1vjbQ8D8CIgsUuyDCcG6m1WFP31AYG+wkenbdwwl8?=
 =?us-ascii?Q?iqoBTdOVJkBazoy3nH/IhBUYWghBrF6hP9TMyhhQQtX4oA8JovcCzOiYlPam?=
 =?us-ascii?Q?UsefZUSXFCTCqyBronr7wqexKthQbv1wD4pp3zVgk+6ZSK0CnWdiTpv9TXBZ?=
 =?us-ascii?Q?ekL7XiVo6Rr9AnFnTb+lcQ9ewhFfLfeSgIF97YFc0MOCjLO2BWv3B8yja7Wb?=
 =?us-ascii?Q?oH6AbV2HjYA/HWouR97w91wYnqlM/F7T7j5/+8EKZMyWl5jQRoedXHTY7JDg?=
 =?us-ascii?Q?eB+g3D7Mi3Sewi24D3ghkdz4ls0p3SJQUOI8EhBzfR9ljx6YWr2Zz0mwDi6Y?=
 =?us-ascii?Q?ThuDsEw759BNZ2twogNGgjoTp+jxcNcjhr94tD8aIs/vzElU0KMCimObCXh6?=
 =?us-ascii?Q?xqWTDrPolGnTQYL+VK+WWTCGn4Z/hphBa7nOMHzmzIhC4+2NOi0t6HIeL6Xr?=
 =?us-ascii?Q?B7MKZZshwhNw8iJ7fejCkDYEwjluUsqzGncSsCqzFISiVP1gYTWAN98cHH95?=
 =?us-ascii?Q?TgEqV/OUfXJGeHc6pq8Y6H6wTHz8E/Gwa6fFef1UGdDQWKecbE0ZKCMq2wwg?=
 =?us-ascii?Q?YZ/hXgeQUYGGIqRwVWsMCUP5J0Cz28M/NYsT94RSUngn0/8AtCUl3gR7HR4v?=
 =?us-ascii?Q?ILmM+q0W7gcJsUhD77JcfMZsO0i+bTaJwJXcg/KV3Hol4WfdcWPCRrOQQN49?=
 =?us-ascii?Q?zNgOuV+bUk6a1iB8kSP0qnn5yI+LEA/GyaWesknKjf7+baKwXjFvo5k5wDJR?=
 =?us-ascii?Q?/vNGCODcPk+5g+hYG9Wm5zcSPIqi3ehNmSplbKJKm6S/LNJMLmMnw0HVb0U+?=
 =?us-ascii?Q?I/uXcf4MvITaSZqj8ek=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Rciu8/vGFpkDtZ4o+tmq7Hy81VcfLneLW/7baEGcfUs04mLFCrbnhL8zW10M?=
 =?us-ascii?Q?j02vtUzxfCLNSt2Kco6MADkqT7rAf6kCaWa3TAqlSJregToezzoZiq7CIIuK?=
 =?us-ascii?Q?3xv1WB/J1jhjuzZBH3NKNuv5zXRnICPOOesxGkhiFNb+oXRuy+Ph0QxNTq3M?=
 =?us-ascii?Q?6g1cZ96vT1+Fzv0mMABnXkhZeQa6/WUYICM78gi/SN2VkOuWrCKNfW4P5ICt?=
 =?us-ascii?Q?WNYaEjJTY+2zSZsTTomU92Se58eqXOcT2M1f3oBWInxEMw+SBiYdAYpUWxRy?=
 =?us-ascii?Q?/s9/rdDMatlxwVdLwXAW/25pIBo0tHn1FuvkOgnQdoMI3DqmVI0mSbrgvmq0?=
 =?us-ascii?Q?8kTSmiFgRpM8fg7yYU1Sxyw9da74Ib597lnE3eLndHdfAGKjEXVPWyYTyl5z?=
 =?us-ascii?Q?aHQcamSFi2kDf5dLkBOfO4/HAtaM0G0I7GOKntHOO2GXHyFaPxRnO5g6Nl4h?=
 =?us-ascii?Q?0CKMXM8Xa5CAALls8o7dG2MeOy8GgGDRA/OpSYyJiy15ROM6KI1BWdLXDV4h?=
 =?us-ascii?Q?QlzuTNQU3EaDg/O7wjsmD4cKLCXd0OUFtqLM7jtWRi/Fl63GKN+FtRnWHEWr?=
 =?us-ascii?Q?BMBkG0dTaTEuiU2xV01q80DKTHbCu5m28hB5hXyibugr6f+Q+hb2DvZ1nOSC?=
 =?us-ascii?Q?Fzx98/X0MwpnBkLZAuxpxECitp68EN+wPyTaupgoXBNhBoHGjPlkjJcOPa4X?=
 =?us-ascii?Q?qJpG31bamLUUaPmlIkvAmsrHci/o/SiPFkkqMeVRBKq6Enxad90tvppTN8mZ?=
 =?us-ascii?Q?8F+dO3Gid6CGJEJOjJzoT+0gPihn9kahngtz6o3EXuhRDuA1U48nh8dhUePA?=
 =?us-ascii?Q?Nuen9OL3Dxoaod8qj36Lg08REBgqHOxjKBV17GAfAFXv4kYunFrEKuUAP9bC?=
 =?us-ascii?Q?lKSEQUCMYgMfIGt+V6LpOR+a4fTveL8IoIjdSEV6kKiH4/UmzWhF6HO2ZnTQ?=
 =?us-ascii?Q?UarIDYSradan8T68eAtQtOi2c2alzmC0ZykT2PWspw590qjwyQPl3whfTE5I?=
 =?us-ascii?Q?ph4Ul5A2eP0x4sQWv9Ty8Itg7dSeX4+9SrBHCIOTexusFyXh3HiTXbrBsRwr?=
 =?us-ascii?Q?5+Esiea3eMYK7xCYCd4+BdF6aHhIi10L+x0KqHPVp0RpVqS7/XDnnmMeqsXV?=
 =?us-ascii?Q?fIt2RrElotn5AE2n1ajLthCqDZDx9GVWOqZYAjOLlRfZH2i6wVijARXqqo0E?=
 =?us-ascii?Q?mJFWR5/aEixcIA09SOfKYmlLCShKlRnk6Y8d4y+pcRjjZG7LrTDjffBopK/W?=
 =?us-ascii?Q?BoL0fKOBUwmNHl4xH5WB/qTfjkEo0AzNLiKqIL2eAXn8xB01ZNR+W7pbu5uC?=
 =?us-ascii?Q?FkvPUY6LUfCsgOcvgNdwCX7B0SGEsp7vs7OoIbeuzCKd/tf8viYPZd6fNG0s?=
 =?us-ascii?Q?a9lBI1a+hsIL7x9G8wpEQGYWwIot9nnwOlY+ajS7chGYqUlLja8UOw2prtxJ?=
 =?us-ascii?Q?BJJA7fGiAwKpD9M2pFqZL30fk/ICyCNMGhVlIvsGn12Qg0gRomVj5zp3b0a6?=
 =?us-ascii?Q?X4mXCAt+ItuMda1oNKl2+BaTRGHf33Y+7tPd2iWr/VZavEj0jG8+WkozFdmB?=
 =?us-ascii?Q?yxJI0Fd49LXbNwQxfUImI2BJmOendjXvUS8kgUMJeT9Vuo6UbFqfE77LwgVP?=
 =?us-ascii?Q?H44S8E9C4ec38AtVlfO5M2ixPOigUiQ7YKh3aX8VOzT7kUnk2+75nR35Jg+/?=
 =?us-ascii?Q?LoespMuteLNcGcV7RUcUsiLraagtLqibYa3kwOtSV8LR4IYrO8AeEcK9//Ti?=
 =?us-ascii?Q?50OD1QVmLg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54c639e-07e9-489d-efcb-08de5a8abd56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:21:46.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsWyRK3KcfAhOVTgixnmO0zlm1P4ZfJI9bcPJhJwCDfPgqz5gEYc4uFLMve4jYnyEH2y/DQAOmUOhoHRvwu9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51423-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,posteo.de,puri.sm,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.980];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 63D2B76FD6
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:00:47AM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Wed, Jan 21, 2026 at 03:42:03PM -0500, Frank Li wrote:
> > Add dev_err_probe() to all error branches in the *async_register() helpers
> > to provide clearer diagnostic information when device registration fails.
> >
> > Drop the explicit error message after returning from
> > mipi_csis_async_register(), as the error is already reported by this
> > helper.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Some trivial patch to reduce goto at probe functions.
> > ---
> > Changes in v5:
> > - rebase to https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20260120
> > - Link to v4: https://lore.kernel.org/r/20260116-cam_cleanup-v4-0-29ce01640443@nxp.com
> >
> > Changes in v4:
> > - collect alex's review tag
> > - fix grammer in error message
> > - Link to v3: https://lore.kernel.org/r/20251215-cam_cleanup-v3-0-a61995068f38@nxp.com
> >
> > Changes in v3:
> > - rebase to v6.19-rc1
> > - avoid use __free() == NULL according to cleanup.h
> > - Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com
> >
> > Changes in v2:
> > - add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
> > - detail change see each patch's change log.
> > - Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com
> > ---
> > Change in v5
> > - remove "no functional change" in commit message
> > - fix error message.
> >
> > change in v2
> > - new patch
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
> >  2 files changed, 35 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..06ea96b8eaf61058d6979b7be747496480c4bc69 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> >  						FWNODE_GRAPH_ENDPOINT_NEXT);
> >  	if (!ep)
> > -		return -ENOTCONN;
> > +		return dev_err_probe(csis->dev, -ENOTCONN,
> > +				     "failed to get local endpoint\n");
> >
> >  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  	if (ret)
> > -		return ret;
> > +		return dev_err_probe(csis->dev, ret,
> > +				     "failed to parse endpoint\n");
> >
> >  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> > -			dev_err(csis->dev,
> > -				"data lanes reordering is not supported");
> > -			return -EINVAL;
> > -		}
> > +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> > +			return dev_err_probe(csis->dev, -EINVAL,
> > +					     "data lanes reordering is not supported\n");
> >  	}
> >
> >  	csis->bus = vep.bus.mipi_csi2;
> > @@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> >  					      struct v4l2_async_connection);
> >  	if (IS_ERR(asd))
> > -		return PTR_ERR(asd);
> > +		return dev_err_probe(csis->dev, PTR_ERR(asd),
> > +				     "failed to add remote fnnode to notifier\n");
>
> s/fnnode/fwnode/
>
> >
> >  	csis->notifier.ops = &mipi_csis_notify_ops;
> >
> >  	ret = v4l2_async_nf_register(&csis->notifier);
> >  	if (ret)
> > -		return ret;
> > +		return dev_err_probe(csis->dev, ret,
> > +				     "failed to register notifier\n");
> >
> > -	return v4l2_async_register_subdev(&csis->sd);
> > +	ret = v4l2_async_register_subdev(&csis->sd);
> > +	if (ret)
> > +		return dev_err_probe(csis->dev, ret,
> > +				     "failed to register subdev\n");
> > +
> > +	return 0;
> >  }
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, &csis->sd);
> >
> >  	ret = mipi_csis_async_register(csis);
> > -	if (ret < 0) {
> > -		dev_err(dev, "async register failed: %d\n", ret);
> > +	if (ret < 0)
> >  		goto err_cleanup;
> > -	}
> >
> >  	/* Initialize debugfs. */
> >  	mipi_csis_debugfs_init(csis);
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 9d946b68cf59d9f4fb3413fc90219efd380d9d95..8304b3d3a338394d6325929d28aa69d865ac8a92 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> >  		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> >  						FWNODE_GRAPH_ENDPOINT_NEXT);
> >  	if (!ep)
> > -		return -ENOTCONN;
> > +		return dev_err_probe(state->dev, -ENOTCONN,
> > +				     "failed to get remote endpoint fwnode\n");
>
> s/remote/local/
>
> >
> >  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  	if (ret)
> > -		return ret;
> > +		return dev_err_probe(state->dev, ret,
> > +				     "failed to parse endpoint fwnode\n");
>
> s/ fwnode//
>
> to match the message above.
>
> With that,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I'll apply the changes locally, no need to submit a v6.

Sorry for typo.

Thanks

Frank
>
> >
> >  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> > -			dev_err(state->dev,
> > -				"data lanes reordering is not supported");
> > -			return -EINVAL;
> > -		}
> > +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> > +			return dev_err_probe(state->dev, -EINVAL,
> > +					     "data lanes reordering is not supported");
> >  	}
> >
> >  	state->bus = vep.bus.mipi_csi2;
> > @@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> >  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
> >  					      struct v4l2_async_connection);
> >  	if (IS_ERR(asd))
> > -		return PTR_ERR(asd);
> > +		return dev_err_probe(state->dev, PTR_ERR(asd),
> > +				     "failed to add fwnode to notifier\n");
> >
> >  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
> >
> >  	ret = v4l2_async_nf_register(&state->notifier);
> >  	if (ret)
> > -		return ret;
> > +		return dev_err_probe(state->dev, ret,
> > +				     "failed to register notifier\n");
> >
> > -	return v4l2_async_register_subdev(&state->sd);
> > +	ret = v4l2_async_register_subdev(&state->sd);
> > +	if (ret)
> > +		return dev_err_probe(state->dev, ret,
> > +				     "failed to register subdev\n");
> > +
> > +	return 0;
> >  }
> >
> >  /* -----------------------------------------------------------------------------
> >
> > ---
> > base-commit: b7af7c950e1076a9e3d855045571be2de4ce9f2c
> > change-id: 20250807-cam_cleanup-b6d90ba9dac3
>
> --
> Regards,
>
> Laurent Pinchart

