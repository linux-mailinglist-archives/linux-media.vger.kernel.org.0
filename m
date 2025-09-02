Return-Path: <linux-media+bounces-41564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72BB3FEE2
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F4C2C74DF
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F3C3043BC;
	Tue,  2 Sep 2025 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dTDBhcWt"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D801C1F0D;
	Tue,  2 Sep 2025 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813993; cv=fail; b=flFivBLWNVdS8vuU49ToVoWKxOVkfQkMjZ4YYX+DpYPQBBdixPua+v+BBPTq8WWja8SiJLAmfF/xIFz+ysIfmpzJn6Qzf1gACJl0NURN4iQh/MmTnhbE4FZeThroh9jqJ1YOgMCtCPfMUsNbJs52vxnuMKa3jX3I2mroKH8Whm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813993; c=relaxed/simple;
	bh=+aAaSCC1ny1cDzzl4eepfwlCrgfb4AffBr9BOmPDMD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NiBCn/ueQqScSohJEcuFwOjim7uLrjDFn5e0YEGUFUUPxmvuKa+c/eFpfzZXG9Kb0IfdfqWs40ftRUXM5hYp7skuQknB++6AyoJTwKmdvB4L2QcLxlKMlvcGJayk8OXKOKmDrkzaBuvJ57OJht+crBSmA3XpGY7YmPqpHshek7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dTDBhcWt; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4xZf5NRYqvCpo5OUC4E2Aqs1m9U7ZURVCgGwtxwnkcMeCl5Jkm5ltbd3TDePzZN+6Y+zg5REDYlNZzTLvc47d1/s+E93auNiSeIw2Iyh6Mzat47duxeGCBVSrKVuS+xDlfaOUp1cJruOwyu5ralkRPKVEVYpHa5oRyynMdJqzFVCn5FfVFA5AsFb8GwLZcoA7S0YJGSp9mskHRSVq+AruZ2F6BLvuoGi0ZNCEUe27fsG7wkeqFAfq6lRb65/0yRLc4kJhpVajdhyUo3L4Z1Eb0KK2sgLbBGe5YDEcl5/OJnivT7eb9GyS6uZpRDBvnzTKbooNDeeq4YAAmAB2FR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjzlvtO1UQjeg6Bgq6AGJjbNP3Tz7YfKPpeQxSbhE/s=;
 b=peP33hnhpg/Q/GEleR9rvrO62ZVJksZRIvyh6kSXeFTpkFqWXsOmrknztWiljvVbOg5sJzlgniFFW8k3majgOWPgfHaKzI3TQjp0f11slF5B8wv024P3HYqpYO/ZWfv2A4YjAO6rI2t1p0Xqjzuh5pN0Q3RP58/x6ZuKa9avod57wNWeovmbEmjm50doUwB1WRcMbyt1p+cxfz7xBcWvM18bFRHsEfPgMoSWs54dm+OfJ+fqmu5vmIZIo11krfVpG6fisuR034pN4mAgFUDQmwRyDCk267qI+cKDr3b77F2z6eWgSpqXMdcOeC4/ciTAeOL06Ef87yv7T5FguBRvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjzlvtO1UQjeg6Bgq6AGJjbNP3Tz7YfKPpeQxSbhE/s=;
 b=dTDBhcWt+iQ1f83tUs99L29O1Ymvtn1E8wsgKq7GnWyJk2a8eVllBWPOI+t7xly2ZkAEeqAUlxFnp393erFmP0QaoG9buwFOEOloQh5t0pNPaDolvnHWZe6K070kEXW+ds8qNTIpgI+Hr06XHNuY1CCX9S4pFfqUl1PKPaHeKFcuj5M3ZTW2rTMLp/ymWNDcXnJIs2xtENdvdnBH8rGr0a57K+lcEveUA/mCSQ3B3fsJeZpdMrByjBUo/BhJfz0RSd6f2cw39ZulnvSzqEv3aR3eigWpxa6w27xEXed7KSq28yt3o+O/m5iME/o2I4feFNEbOZbiWs6W5NzCJs6GXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 11:53:08 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 11:53:08 +0000
Date: Tue, 2 Sep 2025 07:52:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aLbamjurAc1VAklH@lizhi-Precision-Tower-5810>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902083554.GD13448@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH8PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e77f0f-1995-4dca-901d-08ddea1748b7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?3vegNCmIWb6NOwegkt8OddCgWSohRgjnnIK7/V42fDLRp7Xv3B0u83tB1Xfc?=
 =?us-ascii?Q?/WBxn/UVw40TJWGByM7ri/e5YqceegJA/4CXzFqOurwO64eVlU+Dbzd+tvcR?=
 =?us-ascii?Q?M6NNtrrVDuRX+CGr27Su44A6Na2EymyE6a9Ldn1Q7Qnt5c7pJk3dvC7N41j3?=
 =?us-ascii?Q?9gUXQOGBYiwO41exE1bHyoadJMdD4LwkN/88quOqd4F59VzMI2RH3A2DfALA?=
 =?us-ascii?Q?5oZO72cZ0L67raOZQwq+TsLmW7R5neMsbmWkiwzj7HGsfasfPbm7tMyx0TXg?=
 =?us-ascii?Q?+M/PC+vFcyVoO5fliQmKW2UDx0aSUDZE5Ke0n82njSORqKhx/6UuirSANNEp?=
 =?us-ascii?Q?XZgUEYwQElIQmMdA9npi45FrnWSMM0/X+2KuVf2rQynC1hOmv0dzIqz3ieTm?=
 =?us-ascii?Q?wQjuXY++v/V7IN1jben//uUoh5CYWy1SCB81TeXWYUos/bYffffBiVKBceqx?=
 =?us-ascii?Q?stHBvMYFCFdfuTv+tPPpdMsowLKHr0hHUO+XvlIeJYNlnRacESacXZTso/vH?=
 =?us-ascii?Q?M+VWYqMdklEmRCyO+yUsKHPQLtlIYBHg5TU3+TCbtr4fJsnpfRSPMv3Cxxml?=
 =?us-ascii?Q?qkCREPZeKBCAGPR9e3mfiObuBcFGilMOMOk09ygdKVub0O8W8hI2uHVQ/k6a?=
 =?us-ascii?Q?Udh0uod88il73YYyP9sFdbAUjVRJkJ2MAtczSsIrWv/fgLl/S5kGCiZOXRT1?=
 =?us-ascii?Q?enfZ6ejXOceBaSoMDtvOKcAGls1w3Tr4xs3xNVt13E5I+wDYMsF7yNH3C6ip?=
 =?us-ascii?Q?mwwvSNToezbTxTewZOZe6dac36m6RdBrOk/gM3CAGz5oVk2qGbPTw41bQSsS?=
 =?us-ascii?Q?Ku4IujJAMQ3DwOpHkFZReaNxMX/RlmG/LUyz+8kDACsSPJtJ+0SHwRevUx08?=
 =?us-ascii?Q?Oq9/qyZMCb6c59iKIihVGiUpfDw8Pgj7GJ3VnLTnmXgpoWwe+rWAcO5J+RKr?=
 =?us-ascii?Q?Qwor72f5VU1/nE9SviD4rV3Vk590GPQw/ZKIxFxOWdwYVk67naXkdn8tyuV+?=
 =?us-ascii?Q?zFlDqaDUTKkZez94YzOlZJT7WgUu7YacK51ivXHRhiXOV52cVoXr1wWexu7b?=
 =?us-ascii?Q?s1d9AxWIu9R6KPPZQU0efoisV2XUK/Qo2v5RqP3fqc97qW0A/NI6Dzs76Zks?=
 =?us-ascii?Q?axuYJ1cIgmgwksNP0Ea4RVgc/5nMG48+wrcFk8LN4TgtDYs7BLC/H8oUbEEb?=
 =?us-ascii?Q?6TmY5xzYi6SQWS/nMjgJud3jDml2VaUqVXYX3G52zTL7PmuUijbMAFUlBjx5?=
 =?us-ascii?Q?NDUC+c+bCjEqQAqpLZ8pnr/K3TGNWb+o6wSNZW0LdY5DYqGd+4PkwSAjeHTw?=
 =?us-ascii?Q?1l6ZUKapEPVBe1a0XDnD3bjENaaH3/XJXVEQJZkFuepkkL6JSw3xP7i9oTOM?=
 =?us-ascii?Q?5+pe6UzxWADt0FLb1Jm2sfd6KCOUS8QkKga5L9hhBJnN2p6nLD2pwWIxPSbc?=
 =?us-ascii?Q?PbRc1PXR87XDBQvZiWoZFnxbM6oTrMEXFP1+Wqg2zMgUtoBxw/5f8w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7uttVfFloNm9mhXFiVU37tFKr0dojhhqnatwPQCI/yDVnF+TE3HSWZ2Kj1ew?=
 =?us-ascii?Q?nbyTaIXKgHTKfVBxxCChA4l4zOG4bxDyy1dOH54Ziq6PioqMmDt/NxVT5vDZ?=
 =?us-ascii?Q?QlXE1H4M5o9Q+Y1RK/KiZtnpaMyu/GfYpCMeE4RohZffrnlHpqC9HJiNluxo?=
 =?us-ascii?Q?jIRM1t+udIpv2wW/qxaWdbSOgEiMucTTMVS8oc0Dvp7zFo4SsFf3p+JWscSy?=
 =?us-ascii?Q?BrvIgvnJ8dGDjjCnEUisWGuluKQQJtGtI+7T/QrAubbIavHvToYfHkmevbNA?=
 =?us-ascii?Q?n0AyqMjimM0B3NELWGdf+jPTHHGIUNBRhOeJP3p4ehk6E8RGaKEtviRtvkEQ?=
 =?us-ascii?Q?NgTMuLqOOUa6LjnhvJk0M6HWbyodqscTmryuV8zm75qvVJ3HN5eImkxGMA4y?=
 =?us-ascii?Q?Z7VTOlyeocCGfgU9n/ag5iRzttoDaWEMBm31YF+PNN6UT5GqZIeJ4lAVbh4R?=
 =?us-ascii?Q?GHPHf71oi9ZCWn7V5bqoAJdQT5hHBOFLcZANW/fWDibhP74K8slbDAz8dO1E?=
 =?us-ascii?Q?+mCqOhldOkxOYubZ5uRACfH4OMAVHgVSUweGQccyyREfGeWpEABnp0bFx5nP?=
 =?us-ascii?Q?srSVghnrb8FenjHAAUp9w2ttA2LWdShhRfcCbCFzOYbWl2oNhLtOVnpbNr8R?=
 =?us-ascii?Q?BNbPkZCaAkoh9qO26FGpwM0x1tjfuyYHz8BgVqEqQzOW47oDfrZKxZ+kETzf?=
 =?us-ascii?Q?UFiRLWypgv1krbE9n7V8ja6YnVlAC1vmQ/KvDJBSzNe+nckSu0acaLulJv8B?=
 =?us-ascii?Q?pj2Uz0EshZ6TLbZnOH9tv6BZM3LbcVYq0AvFUenkix4V9exD1T03Dnc3vKoK?=
 =?us-ascii?Q?f0CeN9RFu5+0orJdd5fqgB2bv+5K7mw3NUJnWs4MDp4yRyI/Zkbjag6Kx+fL?=
 =?us-ascii?Q?IMHHxpjFP484wI5KNMe4r2ZZJX9I7FvsmD2Rl0Vee8Jcv0x3LUrwYafWnh1t?=
 =?us-ascii?Q?1XQ7CgJgjPaWNu+DfaiNIB+Yk1kjpoUZ4ziWdKhKhRwB9MNkYWy9FFhWyKMS?=
 =?us-ascii?Q?h0pSN9XHo6SxYL3tUeIUUJ/xXFdaNT4eyn/PEox1AqW9/gdLcuplow9JQJsp?=
 =?us-ascii?Q?Q7EkBN1GpHgWp4vQYx0IiHdOh260A05HPpQ/9cBushTdLusRQC2f4xST9L/0?=
 =?us-ascii?Q?k7aLRbDUcKhfVQn16PHRjAUi2HHqAdERA0yIjjB8VpITOpUsgwZDFUdtF8hN?=
 =?us-ascii?Q?agEpd16FIaWPMP/MbVRDHoh6aB8FFFBwu9ixo9Cwqc2Hy7UzcG9qkb6KBPC8?=
 =?us-ascii?Q?FBUXD28h8Krflk8bNdCp4buTzNnLg4WxEUh0AOubUb2nC1ZF/YXyx5vVLCl/?=
 =?us-ascii?Q?cfzfBzjMcfSbVnozHA10zaVM1fiFNpekFGf/R1M6kl+CvxiiTS8HWimiz0bp?=
 =?us-ascii?Q?rj7ws3KGtRsfNBvTI1QBsy/I4UzVnjIDnjjN29xcna68l0D3TA3xg0hZShEw?=
 =?us-ascii?Q?5QIMl00roS0yWSbIoZcO5lBzTJ3HIcaW7QFkli0ybaxZfN5+ix/08letMhyu?=
 =?us-ascii?Q?0hrvw8nglsLG1B0WiJhgrRjOBMN5WJxWCtg9xinDIQIX6UBVxVyRf441lbuV?=
 =?us-ascii?Q?NaD/gapBIk6X1I80FJ4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e77f0f-1995-4dca-901d-08ddea1748b7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 11:53:08.3665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gqHRFM/ZQzA2Q8EGZdMRy0ABW1knT04U7Bps4zUjUCjjVI/eDpx1gG4YTechVIL1RwPFOQxtX2NBRqFvffd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On Tue, Sep 02, 2025 at 10:35:54AM +0200, Laurent Pinchart wrote:
> On Mon, Sep 01, 2025 at 09:45:39PM -0400, Frank Li wrote:
> > On Mon, Sep 01, 2025 at 05:46:10PM +0200, Laurent Pinchart wrote:
> > > On Mon, Sep 01, 2025 at 02:25:29PM +0800, Guoniu Zhou wrote:
> > > > The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> > > > present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> > > > clock as the input clock for its APB interface of Control and Status
> > > > register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> > > > increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> > > > same restriction for existed compatible.
> > >
> > > s/existed/existing/
> > >
> > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > ---
> > > >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
> > > >  1 file changed, 43 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > > index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
> > > > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > > @@ -21,7 +21,9 @@ properties:
> > > >            - fsl,imx8mq-mipi-csi2
> > > >            - fsl,imx8qxp-mipi-csi2
> > > >        - items:
> > > > -          - const: fsl,imx8qm-mipi-csi2
> > > > +          - enum:
> > > > +              - fsl,imx8qm-mipi-csi2
> > > > +              - fsl,imx8ulp-mipi-csi2
> > > >            - const: fsl,imx8qxp-mipi-csi2
> > >
> > > According to this, the ULP version is compatible with the QXP version.
> > >
> > > >
> > > >    reg:
> > > > @@ -39,12 +41,16 @@ properties:
> > > >                       clock that the RX DPHY receives.
> > > >        - description: ui is the pixel clock (phy_ref up to 333Mhz).
> > > >                       See the reference manual for details.
> > > > +      - description: pclk is clock for csr APB interface.
> > > > +    minItems: 3
> > > >
> > > >    clock-names:
> > > >      items:
> > > >        - const: core
> > > >        - const: esc
> > > >        - const: ui
> > > > +      - const: pclk
> > > > +    minItems: 3
> > > >
> > > >    power-domains:
> > > >      maxItems: 1
> > > > @@ -130,19 +136,53 @@ allOf:
> > > >          compatible:
> > > >            contains:
> > > >              enum:
> > > > -              - fsl,imx8qxp-mipi-csi2
> > > > +              - fsl,imx8ulp-mipi-csi2
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          minItems: 2
> > > > +        resets:
> > > > +          minItems: 2
> > > > +          maxItems: 2
> > > > +        clocks:
> > > > +          minItems: 4
> > > > +        clock-names:
> > > > +          minItems: 4
> > >
> > > But according to this, the ULP version requires more clocks than the QXP
> > > version.
> >
> > If only clock number difference, generally, it is still compatible and can
> > be fallback, especialy driver use devm_bulk_clk_get_all().
>
> That's a driver-specific implementation decision, so I don't think it
> should be taken into account to decide on compatibility.

It is easy to follow to decide if fallback to existing compatible string.
If driver can work with fallback string for new compatible string, we can
add it as fallback string.

Use fallback string don't affect ABI if we find new feature or bugs need
handle specific in drivers.

Anyways, at other binding review, most only clk number difference can treat
as back compatible string.

Frank
>
> > If driver have not sperated drvdata for it, we can fallback to it. It is
> > quite common.
> >
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - fsl,imx8qm-mipi-csi2
> > >
> > > QM is compatible with the QXP, so you don't need to list it here.
> > >
> > >           contains:
> > >             const: fsl,imx8qxp-mipi-csi2
> > >
> > > is enough to cover both.
> > >
> > > > +            const: fsl,imx8qxp-mipi-csi2
> > > >      then:
> > > >        properties:
> > > >          reg:
> > > >            minItems: 2
> > > >          resets:
> > > >            maxItems: 1
> > > > -    else:
> > > > +        clocks:
> > > > +          maxItems: 3
> > > > +        clock-names:
> > > > +          maxItems: 3
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - fsl,imx8mq-mipi-csi2
> > > > +    then:
> > > >        properties:
> > > >          reg:
> > > >            maxItems: 1
> > > >          resets:
> > > >            minItems: 3
> > > > +        clocks:
> > > > +          maxItems: 3
> > > > +        clock-names:
> > > > +          maxItems: 3
> > > >        required:
> > > >          - fsl,mipi-phy-gpr
> > > >
>
> --
> Regards,
>
> Laurent Pinchart

