Return-Path: <linux-media+bounces-43223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A90BA1AC5
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 23:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE0B62299D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A08279358;
	Thu, 25 Sep 2025 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E2Po8KIC"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59981DBB13;
	Thu, 25 Sep 2025 21:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836953; cv=fail; b=KHLss/+wIdkvPjh2F8COMJ2ArYKkbAvHXi4IvCx5ewLgEnjomrN2J7RyaeqTCTYq0X11xp6WIW91h35Ilcy9J6lsunEpCfLzsq+uQqNGf7WJgXxnB2i6VoTSQPxsBu4jnPwZJZQqm50UHesDQovCFfO7JjWaxEIBigMqosg6+Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836953; c=relaxed/simple;
	bh=TxHyxvKpwYGy2MpVk87LlN6iurkri7teIUkFQPWg1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hgBYtn2MJaGNKSKm9IO7ncM7t16MNW+KLqWr17XSNvte20aVvMg4fga8Mg65H3QJk0HZvxq1rWrMNhHX6P8f7rdAOI28TPhR4dnJ9Unylp12njUOJpcUI9PO1Wt9E8HjDIp0XMKe1qNx4/y9KJn0fwYnh+dlsxqGaE64UdiChnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E2Po8KIC; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvvH7ntCl34EDM4p2QmYEwSmbkLjPlgGv06OZmqhXT/TAWQSDiGKzzb7uWT9V7ILDJ9eq6W8klVTefhlgG6eGDPtUa8PIIk9ZA8putpv4Z+9DqDsQDI+s9AHqiDZNkHfOKtbHj4qd9moUDCdakO8qF+H49ZNIB93ciS/GtDgaT2O5XDTj/XmAj8H0R5ADQqCR/KxLKga2a0t7TyJ3Eyo/ZtnnTGG7mL2DMn9HqqmmrtuN1Vc5o55LQbZaiPpYQjGW/lNtvXQ03cdvn6jmVIxSxQE6EcdSrSgpH+Xbr6kaxDk/K4cS+49uKkFEbpimFBa9SvZiWwZfyxYIL6pLjBJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cN+i2WUSYxz7GNUUun4G/Ih7xC8DvNnlV5TS/GggXY=;
 b=rp6F3Y2G8Z62hFvh8xu2Z0qJ9R7u0kE/lI2sluqbSJ9apMOBB90X0TsOGm3tI/3lpnxTT4tBMXDakWMjKC3DibkB4SPZxCYPzAw1NDJoI4u+vOuu3cQgA9w6mgaBz2KE0pFoJCa1hmzQDxV0H/ESpMs2TammHPIi7BCnkmW2vdTOZkf4eppduGhieHhGSyBjH73y3jcgxH3Ohe0MQ+GbAu/BneZRo6Bdkvk/coOKb6OFF/+K4wRiM8BdDnb5xiNvxm4zIOTTCkz4fRJr3kP5rEL0uifI6yt8aj0vIRSFyT65bkl6uxaZvGi6lFkO+DIN5PxCwrWqh1LhUmjRD/yCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cN+i2WUSYxz7GNUUun4G/Ih7xC8DvNnlV5TS/GggXY=;
 b=E2Po8KICgnW0TOzXXNwIN/dYxr5PnrCa60ZLmm9xqKi0OSxZ2lLiqXhtfdGdqjXSSlRmMz2BvhDYTJpFhxlvMXGtL5GGpGzyCauEjInOLECM24OZO6szZB74aLZ4SKfXPxS8YgZ4V+Icr7QJZ91DNBx4gd/KFLoHbfiB8lsKNAmf9UAlpS9f3AqSxaxP2QfkM8+DG5dUR+I6kmXXNxvUvC2D9mPJaFFudbDbUZXcFMwM+pyagnTOIcHpq1w2MSGYaf35X1JzT7cHnjfzUMW3bjEaKmMGDXDQpUv15n2hx6djHr6U6lfR13+NKP2/PtrnPyko2253NdlRhLF5zZV4kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA2PR04MB10409.eurprd04.prod.outlook.com (2603:10a6:102:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 21:49:08 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 21:49:07 +0000
Date: Thu, 25 Sep 2025 17:49:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/4] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <aNW4zDRAREUZ7v8k@lizhi-Precision-Tower-5810>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
 <20250925-active-data-lanes-v4-3-8b54e3d5af6c@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-active-data-lanes-v4-3-8b54e3d5af6c@ideasonboard.com>
X-ClientProxiedBy: PH0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::8) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA2PR04MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 9141508b-f45a-4f8b-8e8f-08ddfc7d5a93
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?TgCJS9u4diqEzLYK6JtlANL6LWOr9XsalQY9+JBliNfwcFxHJ7dxrjpx3lIE?=
 =?us-ascii?Q?EqRypjREzK8wrBf2DtBdYGID+YpSmQ1Q1Z9VH4hi62EW93HaFE/KshGGg7Me?=
 =?us-ascii?Q?lmqzx+VFDAfuaC8T3QkKBU9G72Jl/1tgPFmHhosYODgDPSh94GaCMw17SZ7+?=
 =?us-ascii?Q?Bm/AeyMK0/g7T1J/asf24M+U0Qm2LyQqt+c+sR7lRKfdhSzg+M2nWtbbVPQs?=
 =?us-ascii?Q?CrS7WzDrgMIZydOfPj7GVF+tnbX5zgDq8t6MrH3wLHPoXnlm4027dUpLVBUL?=
 =?us-ascii?Q?afTGaVUT5HTl2CWhOBzTUutHNxk3a0NfPmp5PreN0OAgBTEvke/9p15bkNTo?=
 =?us-ascii?Q?N1/51KqcKvMk4LJyym5KHIQ08fl5SSINotzhRnfFFMxlYcd4gIV7y98l2r6u?=
 =?us-ascii?Q?ZE+DucQ0k2TkyvIpYYohcGA0otwSDwJa1rM2I6NsX2YTWEba+YqLMDOZcuyx?=
 =?us-ascii?Q?EXJQNvqr4DspxeLX+8GTroQPck8wCxKTm30aKqyeBInIp+PFdLaV1MzzdQRS?=
 =?us-ascii?Q?qrDuW47B4Mew1Z7TcCKLr238ZyqIF0L4GpSqMqJA2t8sbqON08QojhRlbk0E?=
 =?us-ascii?Q?31KrzOQRqvcedFc4uzHzWFYxhVqQ5Fl3k5gArpwcn17Tt7jGrRtLYSG2Ynw4?=
 =?us-ascii?Q?uM2e65X+hZzfG+GwH1Yq1h2+tjP18xAOP2cDXFJZI61Er0LMDFmbXYKkfR11?=
 =?us-ascii?Q?DDsKO84Q2tvy3JofQ16vIcZAJnlK7Bf5RqcmHlWvio640+OpgB7I/N2GugbK?=
 =?us-ascii?Q?hN761QMdjoYnll8+lJmYJoYnSA3j+ZVQ0Xt0QPf+cy0i5NOJqrI5I2b+IasO?=
 =?us-ascii?Q?29mZfEzCGZ/k8G1MN4dsppdQ/+IRprkCBTnA19ZjYPQVItsga1ZD2zIr/QSO?=
 =?us-ascii?Q?Rc3a/Po1OYo+yYFiMI5i9HYWPPS9nfEBwbu0o04bHw7O9J1JxcKAdVAhbzRm?=
 =?us-ascii?Q?8iVKUZmur0ARZeTIebyYuz9B+Bzv34VOyyU8gH+11ckyt13wZLdtN5TCmGtu?=
 =?us-ascii?Q?5WSvubT/jv/w0Ak9+V6qRQVJgBewFAFj6BGatCXoK00h4GJXxv4UrhQIdiyR?=
 =?us-ascii?Q?4dK2B6IjjAOy3wS68dD3uxBgG6ykOw5j0kwUgREmQVksrFHBu8h+yY1TvNeF?=
 =?us-ascii?Q?098elCucz5I5Bhgi98sx0LK05sgTi9xJFBai6s6WDEgAmQfxVnP3XF4eiIHn?=
 =?us-ascii?Q?Jrw3UQjOnQVIDOci453xwOCSd1gLTFe5Fpqg1wC76l4xWeZ+1RoYzuvlRMfW?=
 =?us-ascii?Q?kFvsZbtlQZoVShlZjlXe2FcWI/Jw8byV/+F6AU5DDN41rRMH2TcVRbm0h5Cf?=
 =?us-ascii?Q?Bs8Ol7ofMmJQtnmIlUFEPbNLL6QB6qcVNd0YfBx0Qx8Mfph4CCZTGnT2ik9E?=
 =?us-ascii?Q?iG3YjS1RXkhcO8LqqdWmMptXxGfQcUOYH8TmjlGwsF1kOhGBzCmWf7qy9rVc?=
 =?us-ascii?Q?uBmBQ2sWUi6h5stNBzP93xlpzXMFfst7FBl25Jzy95M2DjGx3ulP+mdhGd8m?=
 =?us-ascii?Q?6J8hu2l8u3sApDnZ1ZViDcRklXlX52fF5OLq?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?NTpdwSSjg76pEFQ5cffjXYachqzm8D2bVEwszPX9h6e0j6nPFz7fCi1jaXZe?=
 =?us-ascii?Q?Syt90bh0Yx0C2tOLJhReQHGmMmD94cB2GIrZi2TdgWHCIOZ3JLh4YDVlC2vr?=
 =?us-ascii?Q?wtR/auep1MMXo3fKBzERSRBXXhau0YPyQa2wgrXgVtEOKsY00EEb2JtnfONF?=
 =?us-ascii?Q?3LCwGGbcoHnaj9zoGDwXBkVJqN3eX3hPEvAYrTJbDJ5NhFnMVS+yJ5rGGV36?=
 =?us-ascii?Q?GuHpXvdhtyBkvHz5z+I91rOKReHz6xT8KWScUuSapwCDTPHf31ulW/OLEIH1?=
 =?us-ascii?Q?HKg5jRnHgsOinr5c7Xs0XB1/B2Bl7ALyM3APCUlCRbeJQMx/WAqDiiYFvO0O?=
 =?us-ascii?Q?k4zs1f3KezFPfQrcP1ttxgwDn3QumkgiHx/XgW/Pnj+n9ejWiENIfC1/n5+C?=
 =?us-ascii?Q?WY861ejgcVY+OnmzKGc9f2G00Rhtu17W72mjR3YXw32Tnipsz1IqVLFlJKY+?=
 =?us-ascii?Q?LaKSycpG3b8E3g9UU0oGQp0nTemglI9MimXIYFe9FNXisQ6wRqoGlrtbK/4P?=
 =?us-ascii?Q?JueBeHQ70KFvRUw9QydT3kq1IcaMcCwaytrfpiqHZPwfDyF65vrjV0iVuGc6?=
 =?us-ascii?Q?JFmudMp+hnVuzbcpcQkDxrhWfmfFjvS3p4N/d4CZBWZ3QVQgxNXOMir6y9SB?=
 =?us-ascii?Q?fiY2iVYSGU/pmlizrUF3HX2vdPqtYRgT0Wbyj0xDKxYMcOpX9OIa9kbjOhIK?=
 =?us-ascii?Q?/gMO+awmDGs6CMh0ei+VpACrXZ62YrMgx7L5eQgMtmlg1wjjTg0sebsIQngg?=
 =?us-ascii?Q?ZFRBVDkjmfqvXZbd2Hutah+YK6gIsWQAT4JOFduKo3al7tDRuOclQqtBunJD?=
 =?us-ascii?Q?/rIsxCcORKD+T+1E30bl/9RbSSc5u4/OLHFtw0Kq2YFYiVtniTf7Sgtj766W?=
 =?us-ascii?Q?S90NoUFkclVyldIWboGvr/tQQWmdzWFyQzLvRlmm2to63KaAKL0RjEc5Nc/4?=
 =?us-ascii?Q?/Uk4cPsEl3wkvDJjR5OuBtmdEgula+7w9qEl0FekGzxxaErBeEe4ieTw20N6?=
 =?us-ascii?Q?N2JgWrurtX5pnLOLrgvJitmarpzURX2uZRTAGTC+AL2S5kaf2h5WPzfcBBjX?=
 =?us-ascii?Q?64tykFxynP1eUE5KPqFK3KRGKFvUIf3vS6fIqHuC5AvO5JeuaVQfS+RelFgS?=
 =?us-ascii?Q?MWvbsHc6VlYCd1HARJwdDR2I5z3x/0NOL5HX7jboLzi4R3WX5207TUdzbBOX?=
 =?us-ascii?Q?sIeGtUe5bj+CdGHMG0thxDyh18XOzyQ1Y0g0zmPWaRuDEX63QCrfkr+d42qZ?=
 =?us-ascii?Q?HYENcDPcTG2RqG+mzH5KhnKgjTpe/tybNZsGmpjrjZTqgBqJwOU8SH/t2dNf?=
 =?us-ascii?Q?jtfHC3WM67KNelxcKlS6rZD4HodXmHZrvGt3257IjFnxDyqe0pHA7VFu64ao?=
 =?us-ascii?Q?oKha5yAhhOOtwXoMFqfzER9GR2Axm9qPF4sOj76VtY0Ksn7cDUnxlJaOAZWq?=
 =?us-ascii?Q?2I0f6RYToTRz/xpp7FU9itgCvyyZ6Nwy3KTxwfWm0HqwCVdk1qqk+oFWZQXH?=
 =?us-ascii?Q?Ji8Fq1CSQa5Gelj9v8bxQfqWgVKiEXsYxxit1IzFuC2tUKtA2H3wa8aPrt3c?=
 =?us-ascii?Q?95J54ZXvJTEMcsNbT3o1BU94pd23MlDhjcGAxqTj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9141508b-f45a-4f8b-8e8f-08ddfc7d5a93
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:49:07.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+tsjDE6LbIJiBslursBLpMMoG4j94KugguE9D09riuQTMyNZCCzIt2WPNeiWmCUC4KyMvhaSwx73aI592bnMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10409

On Thu, Sep 25, 2025 at 04:54:28PM +0100, Isaac Scott wrote:
> The number of active data lanes in use on a MIPI CSI2 bus is not
> necessarily always the maximum. To allow us to configure the number of
> data lanes actively in use, store the maximum to ensure we can configure
> a number of data lanes that is supported.
>

This patch just add num_data_lanes, and use csis->num_data_lanes instead
of bus.num_data_lanes.

So commit message not reflect what you did

"
media: imx-mipi-csis: Add num_data_lanes in mipi_csis_device

Add num_data_lanes field in mipi_csis_device, set equal to
csis->bus.num_data_lanes. Prepare to support cases where the number of
active data lanes differs from the maximum supported lanes.

No functional changes.
"

Frank

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 7c2a679dca2e..838a1ad123b5 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -351,6 +351,8 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>
> +	unsigned int num_data_lanes;
> +
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> @@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
>  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
>  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
>  	if (on) {
> -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> +		mask = (1 << (csis->num_data_lanes + 1)) - 1;
>  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
>  	}
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> @@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> -				       csis->bus.num_data_lanes * 2);
> +				       csis->num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
>  			(int)link_freq);
> @@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  				 const struct v4l2_mbus_framefmt *format,
>  				 const struct csis_pix_format *csis_fmt)
>  {
> -	int lanes = csis->bus.num_data_lanes;
> +	int lanes = csis->num_data_lanes;
>  	u32 val;
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> @@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	}
>
>  	csis->bus = vep.bus.mipi_csi2;
> +	csis->num_data_lanes = csis->bus.num_data_lanes;
>
> -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> +	dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lanes);
>  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
>
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>
> --
> 2.43.0
>

