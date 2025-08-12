Return-Path: <linux-media+bounces-39613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59904B22DDC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0947E16AD95
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BEC2F8BDE;
	Tue, 12 Aug 2025 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QntEh5/D"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7CF2F2900;
	Tue, 12 Aug 2025 16:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016323; cv=fail; b=thL7p7g4uF2wdo8/wLLw78HTVGijiqCiv2X9pIt7z40a6f013JMvXIsk0OFWVvuM+oN4c+T1NcLTXVFCestPmF3Tqe97cI3TGj6g8fcWGPpKOyPghrCIPXMCHzI76Xn15n5qVzu8isKf1zw0RyGLeLEYaQDN/xIBckO8NRREodU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016323; c=relaxed/simple;
	bh=ei168s2yNjDxydF2SNVmmQoXPZ9x4iTyhZ3OISlsaZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z1lskH1QDTbJK8azHBEZiyiOGfQs8PcPiE+NC443Dr5lqF7+qxHw0ZHwqJuZCCHiGe41bEJPwRBHYfLi54d1Iaj+JZMXkxO0WRBDi2hflVqvC0MpClPI8jxc2PyumBfygM5c222sEOJjsXMGoWq6omyscgkjKBEU/3xjXgc5VCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QntEh5/D; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doAwARCAFgDTaO/uOBEdz6Uq/tJCVq4n+vnk200AkyLtpiIJo6V9FV50JNK8nK275FPZAYRtks+yJFCEmH/q4YRUas2LFPQZ3LX9S28tbtKzReqwABDlIXVOIbf9vBaLVy1KlO1941EteJ/B8vcRKaf8IiwlvmqAtPB+MmhuTaRn+qbc8ga+Cxh4Ii63W6k/IiIvRv1kyQoZ/p2bFLrFio+Z4disNmaIWMeRltkUCYERz7YMjFoznTZQOqAgqMHKJa4pfY7cFk0UFZeYWmnLXUj+DlRng29OKrP4z8BDD3euTBJR8YfYnv9/+FKoe1ur26NX23dxImpRheNCK24Bdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/sEGqUj87/lWXEYll6BgeV5Yifd8u2j53QFLVMq8FM=;
 b=IUSByfz7dM5APaS0ziNkAaKAv3wndtbwBTX5Sa3ux+irrnfgmxPz/T5mLA5ruwbWvDK/10XXsNZjrh6ms3O7nfIpf8DV4dcHdtW35uQmH2lwwQhem2uQCD5Ql4AQjMTwpf8Vtn14tm11N7k9oNBW+QS6ESVmO02tz2kP9WGrtnhTQoV3uuQy6wUJ1e3/INfTY5TuXjAIWLqx6sCCzM2EG3LDR97wKjVM9ZvuEsio5VXEQ8nco8LIHbu3eSFeGb1DVuqi4PhuxzHj1zCivaIs9gt6jpT1y8WXQin7fIgKWi5J7jNiFeCfPA01VRVmVVvP93dFiOMb0D3lA0hgC+9xiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/sEGqUj87/lWXEYll6BgeV5Yifd8u2j53QFLVMq8FM=;
 b=QntEh5/DX0lcmRb3HYEHNB3CKfgndyFu5sdYcPewCgzjv3bea3GgIOjNeVa01QC6iJXFE5srFlYItMpY5S61d/+ZgQMppmJoTDdRXR4gbp+BkXkYedXMPQ0e27VoNIrhJDwqAAnEmMKoWV3wNioEnzYRxYylg5sRah562mVo4NFIJyg5Hj5h3F1CJ8jn4I8uR+Inm/c09iqMBB1NxDpDfSn+mj/OSlPs38tMZXKSJZu52+O8yK0Q0U7xsH/Ze4aDmTGNmid92k3HAJ9WmWJ8+fyVjoXr+ayEzOCI/+4AihfT8F4tX+kDQo/LVNe9Z5PgZnY/I45nbsoou/q5gwO0JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB5PR04MB11253.eurprd04.prod.outlook.com (2603:10a6:10:5e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 16:31:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 16:31:59 +0000
Date: Tue, 12 Aug 2025 12:31:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH 3/5] media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all()
 to fetch clocks
Message-ID: <aJtsearbkc52vzAV@lizhi-Precision-Tower-5810>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
 <20250812081923.1019345-4-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812081923.1019345-4-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: AS4P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB5PR04MB11253:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ee9bc1-943c-4d26-ea10-08ddd9bdc267
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?F/OO8iIxC7zl9jSle+zQvxQ8+Pt1oJXCPAi2fLHzSCYc/3xrDcQpAej1vg0k?=
 =?us-ascii?Q?zKscVfpqvMEQ5Kjf7wmw3KyDB0d6G7LnO4Jgn97L1DggkLBKgDGlRFy7POaq?=
 =?us-ascii?Q?WuBtczTMDliJu9wL/j0zSa1UjoqBIW6/YNEtsX+572wyhpsR0l6ITtDiRKWY?=
 =?us-ascii?Q?NQlerxTsNWyPcNJcX5lmf7ynzg8kK///8x+OpFKpX1WkSwBTY/J167flutNI?=
 =?us-ascii?Q?Z5X2xFu89YiIHgsUiynZxwp2vpBa+39eSza8VOPfJycCstywb6XfnWsfgLen?=
 =?us-ascii?Q?wdpHZAM4YYEFk3l+bRp2yX8IMharkpHqzcHBhapTLb0iWBtI4Yer1CW644ea?=
 =?us-ascii?Q?bXVEvyf0CTmfFWVzipOsS6YxX8uhxXB5ho7t+oAc/dhTrJ9ds9h+mHYsBfgr?=
 =?us-ascii?Q?HUhOwK61w2Rizg0FTT3UTWiI2/2m/LtTryTFiXZrYzuJmb26Ze3pe886gtg6?=
 =?us-ascii?Q?kpyQAjiZJaINVnlXFqAx4jtlzf0t97UcG3r3B3iQlnYJsSN4KkTTEziYd+I5?=
 =?us-ascii?Q?S+ystG/6K0QPgK1KAPciG75j6ZeR851auhiuRXWJxRZPryryyHMrS1V0ecH5?=
 =?us-ascii?Q?zByYaMa1ylIIUZfSIxQmD9yFs8KnrsKw3t9Pt0riYOWTnYXZJAZVMuarexBW?=
 =?us-ascii?Q?Zd+qChZAxSNhZpyC3NzAUEHK4iKFZV4CfzEKP3iBIyxMj5KFWlHlk4K/48Gn?=
 =?us-ascii?Q?w5CKY1mm5sqCnmURcgEMBjrXV/77PuUGMZzLm5dbxhd6Ncvkm7uBC8OfTfIO?=
 =?us-ascii?Q?loWji2Lm391Z+wjwjnOSVge9KHy7leh6cGHIr9SvPf++t9SDjNtrPgowbxAz?=
 =?us-ascii?Q?1JUj88cqReLBFva3BneeEMuWRDflhz7P1tQHeg1/sy5uUN93/N0vvbMTlf03?=
 =?us-ascii?Q?H0w2EzBiHI0Y0rR9y3RdNFiVZvwZVpewPnvApHPYzMKFpj3V1Do0ptSSRr7J?=
 =?us-ascii?Q?QPnVGj+ASREvuRBFW0XjI+wKKpaWJb50W8WQjOQNg0QGNUPqxBQsjgJkVmDB?=
 =?us-ascii?Q?QWw/aUTiJNUALvIRsoyz0ihoNXWYNXHwQHghvv5YCTva/QDMRkEGTD7GZ9XK?=
 =?us-ascii?Q?4j2rM4nxj6Muqyh2WQv+e/ZNVSVfTGT7OpNIUBvnLQSdg9CjR6cSvxpIZZNH?=
 =?us-ascii?Q?bftAc6xm8xZFGkBX0Swb+hvChWMN2t0hxWD7WG9FPE4ankdEDzXb4cGj05fr?=
 =?us-ascii?Q?F5DLaxYHPhhbsy2b7d+QtNWdBtgGi/Fs7HRmKz9Bf3wkOTuaelgFYL7WDxtw?=
 =?us-ascii?Q?qQGG39/gh3JP6ZpBADMSiaEVdEEb7a9N/w0d05ynQ9tnPcrdI24NT6mkdK5d?=
 =?us-ascii?Q?rG3b1iGI/dyJzO/cXbE6IbrqoaccrpWdW9/K4JXiUnDrDpy+0X7CLjkGkMEA?=
 =?us-ascii?Q?LHwr55rS33y4BmEWvDQIRydVe7exgFhlRECVO5WyAUWhjV13V5w0C0X02m5n?=
 =?us-ascii?Q?FztaD/3x3IsPs9+PDso436a6YdPE3oBp+0jI4yjcRaZSyXY3Rf53MQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BrgXPwC3nrEdVz9wjJB6Lrk4xsFRqcHOc7U5hlcIO19vlfqTlDsHeA8T/67a?=
 =?us-ascii?Q?lJrErAc84KILx424l7l1u/e+UuYP7gaXu6rDW2Umq7EjvqncvRTE9Agyn3ub?=
 =?us-ascii?Q?VDHbJUJO3bYJ3hQU12FT+F9siUO65OQBmeB3RysVNpgaqGC/U8LVYHHeNt5u?=
 =?us-ascii?Q?EAqsOeA+Pr4BVM8gsisQumj+BhtyVqo6PmxtcMdXVHIHIghlI7YL64wt9j3R?=
 =?us-ascii?Q?0SYyCD8u7hveLKmAT9swUVOWKKyBjPCkeXBdOf8rFKA0+IzcLweZAsdH4mnw?=
 =?us-ascii?Q?pbYad8QZ/Y50iNTeOm/V6tAmPUg1de9eQi6b74SwmWhK51ozJkUt8vfzlTZP?=
 =?us-ascii?Q?NMh+kr17lP6zUoD/vaCa8LaR93DLs77NlB6m+xlJ6vzaMYVwK/+QIQYLWY6r?=
 =?us-ascii?Q?cQvU0O4WgIV9zxlZ/B/Xpb9tkPTx3/un988hdm7Lk31VH/K5VK2M1MrmAhjF?=
 =?us-ascii?Q?NKU19dzj19funCzZMOWQLrPPxzqyYIcY7294UAgY+ldxATpMn4nv8ghSxTq+?=
 =?us-ascii?Q?oJJFHjuegbp6FAUNPgPUqAEXqhCT48XuygXvtdoptKsBzrglHu+1X7rS0+av?=
 =?us-ascii?Q?Y3uUbsdIFE6UUuV9wNwmh+RayRDBF3hWqcWv6zAAdANgVsHBa84NLrQZ52JA?=
 =?us-ascii?Q?R5sN6iyjO/OCHoBepFN0dUSLtB4zQzXcpQ4IHDic+b7nGHU4RNVEaFNo80h/?=
 =?us-ascii?Q?ky9Bksk39aJL9sjrtIkyycSE+v0qQ7+m9mP2DCWD5a2eqwIlp+PSayNWofhk?=
 =?us-ascii?Q?/oY9MZwr4UlYZ7w9qFXArFaHcAq2RhGYsJGdbqaB2SDtsaAfXYTvSuWa7bf8?=
 =?us-ascii?Q?gSs8m3a7PpFscLVaYfgZFdoaTjhGkfzLvyObd73eZ+Hn5ybIrYmtpNllpNdQ?=
 =?us-ascii?Q?27P/7ePcsizXh9GpeHVQtKUfdR5vPM8/TnX57Q+844ZFABKbiIklhV7YwkNi?=
 =?us-ascii?Q?02M0QAO0rrR/y2QjX6cZobMvtzeghD+TD6dRRCzMvWxb9C32/s5eObTHzBQI?=
 =?us-ascii?Q?PMU69NUbiEe+SZfhAJzwS6c5++TEjA3wLYn1o7UAUXhdOO627cIwtYIghlzz?=
 =?us-ascii?Q?QTB8y8vshtKm2RBx0MyyBgShappuSKXO85DblPuFatWn06gDe0xHMvvd7HMd?=
 =?us-ascii?Q?MM6gOLWB+zt5RjBOVURWcxA8XVzn/UbVkPz8QvP8WAjx3u4jILU7j0CoPVzO?=
 =?us-ascii?Q?qdbBtnw4jPH+WoI7M+eU78mJMDZQvt+yKyl8YC0zjop1HLyfD1KsljdnFQor?=
 =?us-ascii?Q?hgD3emGcxcUiOx2cAnTxotrau7s5b45RYtKnCCq4jhpV5qucWx1SSz3T0a96?=
 =?us-ascii?Q?sByLxqw0/npSItO5COuspwkiJjy5sMKRbLpsMvQIyiQ2Dmol40LnTfWY/OEZ?=
 =?us-ascii?Q?fV2Z9Qb9y5Sw8b+Xy2Di5d2FvmJrpQcWT4gmxTGiCsFw17SEgtnISgL8jLHM?=
 =?us-ascii?Q?k38DWiC46hxjfWIERYOLtjfVsSgrO7T3whdoGeBSOm1J/EoC3chy0J9uEdah?=
 =?us-ascii?Q?olbWKecKIvlK0uCDGLgCssA0COthha8LNtWiH5y0DASJ8aZP471MWMGp92hL?=
 =?us-ascii?Q?DaYy+WpWUSbRj8phOyuFWIcetHfmqwzlI/1586cc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ee9bc1-943c-4d26-ea10-08ddd9bdc267
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:31:59.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6d83esnmpc7wpNhVNWvzkUc73z0hW+jsRqm57OwpU0RWXWHPua2WJeCUVJpfXt6H6x4i57SPu21503cdd8zOWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB11253

On Tue, Aug 12, 2025 at 04:19:24PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Use devm_clk_bulk_get_all() helper to simplify clock handle code.
>
> No functional changes intended.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++-------------
>  1 file changed, 15 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index ed6578f7f0f9..be07ff27071f 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -72,21 +72,6 @@ enum {
>  	ST_SUSPENDED	= 4,
>  };
>
> -enum imx8mq_mipi_csi_clk {
> -	CSI2_CLK_CORE,
> -	CSI2_CLK_ESC,
> -	CSI2_CLK_UI,
> -	CSI2_NUM_CLKS,
> -};
> -
> -static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> -	[CSI2_CLK_CORE] = "core",
> -	[CSI2_CLK_ESC] = "esc",
> -	[CSI2_CLK_UI] = "ui",
> -};
> -
> -#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> -
>  struct imx8mq_plat_data {
>  	int (*enable)(struct csi_state *state, u32 hs_settle);
>  	void (*disable)(struct csi_state *state);
> @@ -112,7 +97,8 @@ struct csi_state {
>  	struct device *dev;
>  	const struct imx8mq_plat_data *pdata;
>  	void __iomem *regs;
> -	struct clk_bulk_data clks[CSI2_NUM_CLKS];
> +	struct clk_bulk_data *clks;
> +	int num_clks;
>  	struct reset_control *rst;
>  	struct regulator *mipi_phy_regulator;
>
> @@ -417,24 +403,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
>  			      CSI2RX_SEND_LEVEL);
>  }
>
> -static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
> -{
> -	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
> -}
> -
> -static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
> +static struct clk *find_esc_clk(struct csi_state *state)
>  {
> -	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
> -}
> -
> -static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
> -{
> -	unsigned int i;
> +	int i;
>
> -	for (i = 0; i < CSI2_NUM_CLKS; i++)
> -		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
> +	for (i = 0; i < state->num_clks; i++) {
> +		if (!strcmp(state->clks[i].id, "esc"))
> +			return state->clks[i].clk;
> +	}
>
> -	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
> +	return NULL;
>  }
>
>  static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
> @@ -489,7 +467,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
>  	 * documentation recommends picking a value away from the boundaries.
>  	 * Let's pick the average.
>  	 */
> -	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
> +	esc_clk_rate = clk_get_rate(find_esc_clk(state));
>  	if (!esc_clk_rate) {
>  		dev_err(state->dev, "Could not get esc clock rate.\n");
>  		return -EINVAL;
> @@ -848,7 +826,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
>
>  	if (state->state & ST_POWERED) {
>  		imx8mq_mipi_csi_stop_stream(state);
> -		imx8mq_mipi_csi_clk_disable(state);
> +		clk_bulk_disable_unprepare(state->num_clks, state->clks);
>  		state->state &= ~ST_POWERED;
>  	}
>
> @@ -866,7 +844,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
>
>  	if (!(state->state & ST_POWERED)) {
>  		state->state |= ST_POWERED;
> -		ret = imx8mq_mipi_csi_clk_enable(state);
> +		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
>  	}
>  	if (state->state & ST_STREAMING) {
>  		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> @@ -1092,9 +1070,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
>  	if (IS_ERR(state->regs))
>  		return PTR_ERR(state->regs);
>
> -	ret = imx8mq_mipi_csi_clk_get(state);
> -	if (ret < 0)
> -		return ret;
> +	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
> +	if (state->num_clks < 0)
> +		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
>
>  	platform_set_drvdata(pdev, &state->sd);
>
> --
> 2.34.1
>

