Return-Path: <linux-media+bounces-34263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B8AD0599
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00F17A79C5
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5CC28A71B;
	Fri,  6 Jun 2025 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WZypkg/J"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112A28A1F8
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224562; cv=fail; b=P5GslwSZa/E5+c5aWDH/VQiN5sDb1bm9H4VKWKSyEUei5lhQaNx110op+Z7i/rgOXdh8kgg3BPljUeHCVm79hAIYganxrnMBZSmWClLD0W1ay84wvh/GWJqUgUfC9/4U0wi4PT8T180bjtQBv/xDNRX0/vZaISqwMZ3OHW5RJ+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224562; c=relaxed/simple;
	bh=FDkudxqJy7lV2l/+ND4PpR4l3Cu3VS8wwMsGxWiInlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cceB92+2gtrkQiS4PrT1Q6MGM9YhFBMx7wirqvNUW4UH7zOFto/GS1lvPH91hy1IBSB9BltctJxpNTq5nEmQT+pXORD2Z5dVO1QPr/GI74wFhjoJJLXS5fj+YPYOh0vxQR2/kLgyJglXc96B+CBMPvx9ZlPwtfIEvg2/2EG7Dzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WZypkg/J; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMz5eh0JHJNLB4KizYZbERNJ5rmw0YsjAu8e9BUDojrA0+/Z8/oQEEszr6ScbzyehJ7ZP/QAiKtDbri23oyPYUk6NKCGeOJP0iWtv3VD0LuV6ErwQ2s4LYmJxG5HdTxmzF4v0AzTuWCYEv3Ag8OViX3gvlGSgf9dSEu6/XN2BaZqtf1zNd6iPQ3ABiYqk6/JRjk3dihplnlXRC7T+7NrA6IK/QXQxVIKxvAzMfdO/E4U0X81UF/GNceN3EK/uPv8Jq+7gVPzZAXy1nUuWokDF171dlDujq3i6ZP9VVaRa44A32922Ltmh9As/C0oFqxbs2fUULJD6nBDoplO+lV3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuUGP+pxYomwLwfrqx+qqYlJoMzejn0OxMaqyaEnPps=;
 b=FMaUcjC6Yy3sIJpFy9hGdQXps5Ak+fVufAbj1fazm4IXgH+sHxGXEEhfHTanc1hvn5kFQ6xOKWCGsX68Kvgt+9KayoeKx4Be8+SVmIW+i6hTQGjsO5isSxmXT1NVzNUpHTZxyshqUxpXr3+ILSRYH0RoECEzPO+TQcDPyt4rpSh2VqX+vFKlFTSg5JLdM+EFzQUecLU5sqZdRhR4GM9lrgOJ0K7x8gMroRhMIxvvBtPbLBrHLBFgVrbUCleZkItCWj3PRZF9449dGfpvC9sOuuUiTDdWYFjpLH+IfXZSUGMTMBdAhPwfw/9q/J0HiUKVJOxv/VwKfjZB8WWKppy3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuUGP+pxYomwLwfrqx+qqYlJoMzejn0OxMaqyaEnPps=;
 b=WZypkg/Jgva6JpJsNcuxT75+Gl1k1OgiBurHvJcImfqjI0uPjXJdhsZ7mwTgIPXsaj3OMG+RNv6Gw4aCYZ1ipcV+GVt8blvFo1Dyar88D+kCf3zMA6p882o76od83zUvwYh7F+dOOI9sMaLRpvELULRAmVKWKPoUGSbfa5MEHJCT4EsMAKldDIrfJYTZrcDJKwVRp9n53zHOBoSGxQI4XCmaLiJhcxOY2/7eJ/F8NmaZ2smNB7YeEo/3TKubviFbmU4+uiWomjAkdTZ/Ph6F+RrxArd1md/xMOY4wnE0qSlmuLBCwiXjclQ0+3MiiQk0pMdl1/NwKVYlI60r5XaJXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 15:42:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 15:42:37 +0000
Date: Fri, 6 Jun 2025 11:42:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Stefan Klug <stefan.klug@ideasonboard.com>, imx@lists.linux.dev
Subject: Re: [PATCH] media: imx-mipi-csis: Use CSI-2 data type macros from
 mipi-csi2.h
Message-ID: <aEMMZ7vZqPi7acx0@lizhi-Precision-Tower-5810>
References: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: PH7P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 9496d11f-91c6-4dfe-05bc-08dda510c362
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?g7nWhFys+xpRY/BNlD77LeBHnIcEQF7E7hByJ0WardC8+B0s7Lw1h3H0V3V5?=
 =?us-ascii?Q?B2mEiW7Q0YhV0Cg30fl4EaF64Ufnqc95DV5ltZ9PqpOtCeIIDxBYCqrhBkfa?=
 =?us-ascii?Q?ejCNHDqDJv7Z3IjBu9Hh5yDw8q9pmB6VDP/DQFaCv2L7Ex5PXc2IWkDtfLuV?=
 =?us-ascii?Q?nGToM1mm7wZGV5Tk1eNLtumY+47UM1hjOVjugwjpwvxukJa5clVpGA1r/+Ej?=
 =?us-ascii?Q?J3KdNCwXS0zrCqG6R2EWEM5tEf5bze1XBnE6Y4hHbqShQhi+8jSweHxJRbGp?=
 =?us-ascii?Q?ebUciJRJeoOP3btTduNQ8JxUr8scibkV/IXvDaWbR4fekpfVu/0S/z7EIbPo?=
 =?us-ascii?Q?Aii1IfZIqTY1xDCG5OTPuj52hqyDq+C/mWrz/XuQiKz3o1dDykgAQ0tHg0v2?=
 =?us-ascii?Q?dMPYZAnwkPTX2hl+9ioN0FvleuNchlYy4aYxn/nH1G2cZ4p369w4dIwDQ7KN?=
 =?us-ascii?Q?mJz4T5L8kQZwmKASzhT6J8hTEjnHsmOl+pLX9r81/v5ZFlOaQu8PUmJ8qkBM?=
 =?us-ascii?Q?Du3NVTcFrmqx6txTz8zR4tg+NGdhJWJhjzC07G61mbh+a3+Jx+CpM1IT/AeK?=
 =?us-ascii?Q?yQ9HN1LMwWs6I85lyOGcwVKOLTO/Y0HBdcC3vteyHr73/Q6xEX3gZhkrQE3e?=
 =?us-ascii?Q?774lscRj/hFlLTn9hfbsSJvNkaklPQkqnPYmvLG7jN9FuTh2nHwKIqNFPJ0e?=
 =?us-ascii?Q?g0efxcWLd/5VUhWNsNWKW7p0Dz9aghiNTyHdiDZteGQyTaJABiw1wZYBMd/Z?=
 =?us-ascii?Q?8hWPwMLOWyyRffflmC7zij7j4QHCzcPMNV+mO+Qk3JwaAK0UrNIxruEaMdkg?=
 =?us-ascii?Q?4vveFKdtNfNUtUcfzNv3JG1kHq9tJDSZDSxgBg52n5IcEPSUvzTIPeakhh3b?=
 =?us-ascii?Q?4+nJjAVZF4a4oFxsAK0AY23+CVRKmLF8jN6Dyou26C+Euq1uEc1HkylMgPaP?=
 =?us-ascii?Q?I5j/vf8iMsqfTZtwvlCLMhdV3pB769TFDbAvmfILMHKWrN7qmb4dY9ZuH0rp?=
 =?us-ascii?Q?YiRHH7zyziQSf086h2j0LepuhT3s6OJpcxQ3WnksdbxDqTuT6J3z77hjFdTf?=
 =?us-ascii?Q?vZUEI9Udo1P0hEg2iA0s1VRxhoQ6uViG92TQQ0JNRm9zsrvQAQEjmCO8AAmw?=
 =?us-ascii?Q?BG3eQ9f9BVQRNAJl83gElXXY942wrReVkvcOJs9ffOxqjIk9xiZi3ynDMapD?=
 =?us-ascii?Q?qFH5E84hQCzE3kb4s/9UvRyQwHsqV2WuMAL1cq/5hAEXCgBK2R+V8+zQ1llW?=
 =?us-ascii?Q?wLa48/CJnKZEF1++SKtAMhPwNcl/UhLYbPAiwfH0mQgTucmC+y8XUtyMroAV?=
 =?us-ascii?Q?kGxIU+tOPwHD4f7ZGu9XwsEBtLJ80G87EC0A4vivxGTbyB4JVyPnON/Rpj+0?=
 =?us-ascii?Q?tYVBSN53ZNlZ5JCx+ZF8u3ZFWzWTPGLEAr+JjlkuTmzVKAXOrqSyl3T9own+?=
 =?us-ascii?Q?vxiybW4Pda4K6PF+QVm5WnaRRkStKhhI9rnOMCuLNXeRS7yZG46skPOGXY+J?=
 =?us-ascii?Q?KhazRqWkycb657g=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uo7+cJAp6+Xz2Ke+sfhkFvPYIMEn8McRsUhag/xsK3QpVFb8O0aZ93xg7wjf?=
 =?us-ascii?Q?3nnXGg1gUaKm/+nbRku5TYdGazf4JBog1qbb7K7bgc3zRLLIR20inrJrxyN4?=
 =?us-ascii?Q?mkqOItzzmB6ouWYjXV3ffyBBxdw9B6vT4Dle0Nz8I8YxLxOwIA6QQSdIOPl3?=
 =?us-ascii?Q?5dmsliCGYk9xbf08xetZarrmJkSILDodf0MOoqgm/Sg+Yxrx0HVs6jHly319?=
 =?us-ascii?Q?6yZrTDpbXLqAOWMh/zH2bXnFc3QKEptkTYY8Fc08qH+wFnpt6beGpDLEO5mt?=
 =?us-ascii?Q?qBKS54VjE9yzbIhe7WEu/WP+pFRQNw/kELyj2fwlNBG/fywCqfmhdHmMPkdG?=
 =?us-ascii?Q?+90KWYXm4hRA1Sef0cZMUqCAF8xu5DYmx42H4zPTqPL/jJX4LGUHMfz6c8CD?=
 =?us-ascii?Q?j/rhfV4Q1EcSh5oIzn11a+IN2Lb8B8YBgH/QA5TEBlCRatlFl+6vFhJ2d/33?=
 =?us-ascii?Q?3TX6Vdx4Pui9/IKdXijZPnoNNEFIzvWtaobkdDqSes/T9SxtF16EV4q2TfvG?=
 =?us-ascii?Q?Dtc/P6UvBW09nzoe7BdXfV17bcL5Xv+T0L4hYABn9K1FFGL4o3E8POthKIaB?=
 =?us-ascii?Q?Epo/UXosBGWhcQX48Jl5KEoEWyRn03+gqvFB5o8zWdW8TdOFpERPe12afENv?=
 =?us-ascii?Q?lsmcM/yvOq2q914XOVzR9kAEYpFGVbfgSP1fGOnkiaYeN/czyMCttFmhmo2s?=
 =?us-ascii?Q?4nHpkaHQ8LRruxPQ6TMzKqThvIMQ7f5NWKCKI3vQxNNhwGQoEO+x2ux7+2Iw?=
 =?us-ascii?Q?aCjK8dlcX17eNKT42O7W8yn6Da5Am4EGpNtSWDnjkf11oGUGwj5Apz0kjp+c?=
 =?us-ascii?Q?22O/7WQ/XaclHlRZDZXFJNINP0Gakda0qxROxrcJlH0nEYKm+2EqQdVMy7k8?=
 =?us-ascii?Q?VdWqtgdpFu/3HN6qmMwgJs5Nbuz9ZjHov6FJZabF4DjhG5ge8nlODoOQ/odT?=
 =?us-ascii?Q?Jxqc+j6Eja7V2DcO3GXLjPiaym+782UNhvW+TIK4oDzx3LOZ3W+1BiY3ILb9?=
 =?us-ascii?Q?1wfXm6AaOfluPwRolQ2gU7ossKCP1rp9f+nKTuc05GNAYRAboi1+9b0HmYwi?=
 =?us-ascii?Q?Ybz0o95VKdTN6aYPuLVUpiBh6NksguOUYvhA4B0EaUQwBYtGNh0Pvp7RTUu5?=
 =?us-ascii?Q?b1y0kL1sIlS2tkj1sSRlZOeRXcV/Lc1Bjn240qzu5ox0KLgtXztFTEZ28vmo?=
 =?us-ascii?Q?KI7cpckpjBT9WFQ5irMLLbNBOYo43rlbnVjvbjywLkfRL1m8MixNjXJfi4kU?=
 =?us-ascii?Q?AbFHoIW9UnDOA+aiafejFujNMTPCU54ekgSs2qUFUI8BtDjrMDfQe56Q6SR5?=
 =?us-ascii?Q?zaYR4dWfLpj2M2LhxDLrfJ+pUz8TOXxBgzDU0/zyXtKF0ni1JupSXlnRieFv?=
 =?us-ascii?Q?/4zBp28ctzGDWTEJRDD4jZl0wfFVGtlYhsS9L/C+I6yBL3sYwOTa7qcU5+mU?=
 =?us-ascii?Q?vNIpMDhwlIac8YYIqOgm1Lf3t53xfYL3bJD5YkcU8usdnZq/CyPWaquyKeel?=
 =?us-ascii?Q?QNkXiW4aTOSUv+kqfuGnArLkQFzFULUNG3xtG99YfdHR/qOByeqrhHyXeN/B?=
 =?us-ascii?Q?9vxtnm7BVIrgMmZ6MBaR7v+mRPCvmrNM2tJitbvM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9496d11f-91c6-4dfe-05bc-08dda510c362
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:42:37.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3y+LbG1uNvkL+mmyOxqj+z/WfCM3Lq/yBe91/uAJF14B5kro/Lp3IFUaGSupIQmYi+WAcDy5hoW5WcCMq4KXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140

On Fri, Jun 06, 2025 at 12:05:33PM +0300, Laurent Pinchart wrote:
> The imx-mipi-csis defines custom macros for the CSI-2 data types,
> duplicating the centralized macros defines in mipi-csi2.h. Replace them
> with the latter.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 68 ++++++++--------------
>  1 file changed, 25 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d060eadebc7a..2beb5f43c2c0 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -28,6 +28,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -229,25 +230,6 @@
>
>  #define DEFAULT_SCLK_CSIS_FREQ			166000000UL
>
> -/* MIPI CSI-2 Data Types */
> -#define MIPI_CSI2_DATA_TYPE_YUV420_8		0x18
> -#define MIPI_CSI2_DATA_TYPE_YUV420_10		0x19
> -#define MIPI_CSI2_DATA_TYPE_LE_YUV420_8		0x1a
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_8		0x1c
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_10	0x1d
> -#define MIPI_CSI2_DATA_TYPE_YUV422_8		0x1e
> -#define MIPI_CSI2_DATA_TYPE_YUV422_10		0x1f
> -#define MIPI_CSI2_DATA_TYPE_RGB565		0x22
> -#define MIPI_CSI2_DATA_TYPE_RGB666		0x23
> -#define MIPI_CSI2_DATA_TYPE_RGB888		0x24
> -#define MIPI_CSI2_DATA_TYPE_RAW6		0x28
> -#define MIPI_CSI2_DATA_TYPE_RAW7		0x29
> -#define MIPI_CSI2_DATA_TYPE_RAW8		0x2a
> -#define MIPI_CSI2_DATA_TYPE_RAW10		0x2b
> -#define MIPI_CSI2_DATA_TYPE_RAW12		0x2c
> -#define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
> -#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> -
>  struct mipi_csis_event {
>  	bool debug;
>  	u32 mask;
> @@ -357,116 +339,116 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.output = MEDIA_BUS_FMT_UYVY8_1X16,
> -		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
>  	},
>  	/* RGB formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_RGB565_1X16,
>  		.output = MEDIA_BUS_FMT_RGB565_1X16,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
> +		.data_type = MIPI_CSI2_DT_RGB565,
>  		.width = 16,
>  	}, {
>  		.code = MEDIA_BUS_FMT_BGR888_1X24,
>  		.output = MEDIA_BUS_FMT_RGB888_1X24,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
> +		.data_type = MIPI_CSI2_DT_RGB888,
>  		.width = 24,
>  	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y8_1X8,
>  		.output = MEDIA_BUS_FMT_Y8_1X8,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y10_1X10,
>  		.output = MEDIA_BUS_FMT_Y10_1X10,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y12_1X12,
>  		.output = MEDIA_BUS_FMT_Y12_1X12,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	},
>  	/* JPEG */
> @@ -494,7 +476,7 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		 * SoC that can support quad pixel mode, this will have to be
>  		 * revisited.
>  		 */
> -		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}
>  };
> @@ -583,7 +565,7 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  	 *
>  	 * TODO: Verify which other formats require DUAL (or QUAD) modes.
>  	 */
> -	if (csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
> +	if (csis_fmt->data_type == MIPI_CSI2_DT_YUV422_8B)
>  		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
>
>  	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
>
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> --
> Regards,
>
> Laurent Pinchart
>

