Return-Path: <linux-media+bounces-42697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA19B80CC8
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C4744E339C
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FCD321281;
	Wed, 17 Sep 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nqbFCLqO"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8927875C;
	Wed, 17 Sep 2025 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758124546; cv=fail; b=eztB3MMiStJvtg/2VXcc33JbFONUOJOp3CtgYcF0Kb6RyAGAsgnoxw46gUoGnhjLkkqoPadGQ4XTiM9CmpmEQnXWxUhVR7cATuH5mNQQwHBQS8k/5pfTMuWBzEcOxvAbTeynfde1i5ZMYLyis5hAVh4GV8R8i6WgMYaHfi+AhjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758124546; c=relaxed/simple;
	bh=ewfmvRx55tYxAvwfDCLDo18pi5aRiVj2CH6MKI1lykM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aMsxekazdTehcs5QPVY3ERU/1PhprruMPhpg5hkVdPX6zye/OO3l84vWcCSpUtRDuWWE7YHinVZcFZYdS8LAWKTAtQGJFT2vKNfJ9WmBoz15dz/nhjS90YAR4HJ8dlRD96vC+IjVaM9t0MPjQXKON0fLjaAjqtbg73ThVVFQXm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nqbFCLqO; arc=fail smtp.client-ip=52.101.72.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=indK6yRHUj+j7tA+AHG8ssQufAduRKjTeeUjx4KJBo20Vb8pw/40IteWSO3yc0q47+7KQ0QOlBpZ1UrkzW5GEKmb5ND20JXh7XSIzO/CmYkadB5AsmaUu6E6o17Qm4xye/K28wC5dMP/Jxb+DJHhdDWE9TOAHb7cRqiwbUVZRSAQ9rVtxrz1hHPJu5P6le+4OAAPlVy9Oz2PK/YepeeDu0TNmD68FSjxOxk+nx02xSfHQZRCTzFkkl+zRWXr1KmrPK3dP7SlFR5Xu4cPlxLG2FCi0sgJYp1A5lifmNAq1/UJOS+XimLImpw4GlHjnO0QoVYIowr8P3IQhrY7GPZGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhh7j3aGsTOP09p/rnpZ6Ftf5+uco1umP/RKU+EnK9c=;
 b=YT/X37VoIpqtHVJ/BXSg2wEBXt4H0mxVqXfPRdUbVPpkhzHAd8CK1jvH4noXoMH/KB6+P5jHVzIj1WXgSctu7T8CBqRb4a3ef8obhMNsNv9myxcl1mVbLQzxz/93nBbL/7Du5+wPCsS8AKF9mEEF68l5Ki+BAYW1oJQVmUu5u4CbIseXw6xvr6wcZkvNSs3U3KOS/vOnknXq+xB4uMc/cGY3NnKzX4MXCsq9X1bjlgwPGRHosVx5WS7wmQSHVEHAGg/pg+76K7IQhx1ECcOz6SXdrkS8fR5HCu7QqAt5MpuMWuOpuQz5I3rdVEOmyTXKOelb2YCkDSOE3Ll+I4Wdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhh7j3aGsTOP09p/rnpZ6Ftf5+uco1umP/RKU+EnK9c=;
 b=nqbFCLqO1qxw1I3cieL2XgqeLCXfV2RTIyS8F+zvws648UcdG25GOUrvgRxlg9Yh35dPgMKDaJfmbid4xsA6aXkvCB0Lail3jSVOmJFRkgBzLYIDX3IS8DR03nFzrhRCiKHccanCEq8dskn5VMRQ1+pwveqX1SQsU2lrUPnoculimmLspF2YNHPNXeq6Us8h7lUWZtlwCWF6yHbFJ9ezfDvbVOtvPzbkcviQhGpsQk3WFX9fm9KPdbDSwbF0QSC37L23BbF7SlacY+2FVyEixSFFOOc4H4NPbd51q/AuwuX897KCL9F3HXdEk+XzAybwox4mUaUS83gsege0pjgIXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11291.eurprd04.prod.outlook.com (2603:10a6:150:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 15:55:41 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 15:55:41 +0000
Date: Wed, 17 Sep 2025 11:55:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v6 2/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Message-ID: <aMrZ9X0cRIGQS0yt@lizhi-Precision-Tower-5810>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
 <20250917-csi2_imx8ulp-v6-2-23a355982eff@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-csi2_imx8ulp-v6-2-23a355982eff@nxp.com>
X-ClientProxiedBy: PH7PR17CA0004.namprd17.prod.outlook.com
 (2603:10b6:510:324::15) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV4PR04MB11291:EE_
X-MS-Office365-Filtering-Correlation-Id: d962989b-2eed-439b-ee8f-08ddf602a75d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?olBktnINbJNMXdjAxlrHPiz+lfg/yFoaGCIm96BnXKZ8PoR3YXz3+2UaUgoj?=
 =?us-ascii?Q?pm5ShSZ+ATLtKDCBb8vHfyctWxQHnmmAojz8rTyMVoOuKvZq+mg1HQjB/00m?=
 =?us-ascii?Q?o/JLnA4v0O8TnPR4uq8Thaeu/uU6qOMt6CWpwp0IJh9sp8/At1PzsM3iq6cA?=
 =?us-ascii?Q?4vFhMMOe6Fr/b6iWnXXmzEvk06BqbRb8WWAlZN8cR6St+vwy6K9Lq+JhL5Vw?=
 =?us-ascii?Q?+laqRbo2BtGJB37D7Km1XVnBVmqIHi1gg5uAnEDqDTPCgPa9WriS12jM3lBw?=
 =?us-ascii?Q?Up8RMJIuLoZPWgN0Puo+f0R80njjQr+AKdi5Ae9QWo8R4mNJTRFnWrUfTunH?=
 =?us-ascii?Q?HDqi85Y1mLH6opnSnZDqZJN7om6bJ0Tqr9Ygb2AZRGSg3lGTmJ5xtw12tphd?=
 =?us-ascii?Q?TtUCPfPofIP9Cmjx144yqKChWGfC7haw8TCXxpS2xTFqeYrK7wlKK1BdsupV?=
 =?us-ascii?Q?IKS8gXyiFQ9RbSBmCAb4a6/FeUpw07O/9QQtKhfgTfB3t83/MbZREIwCcSPO?=
 =?us-ascii?Q?mjce2SUoanrPZyPNnxaKfJpVlbAEv/Rc2b518HQeOuMgq1Jo24fSbFZGk09N?=
 =?us-ascii?Q?GWYrco0FYaCHiqLmXKHL3A9r/bBO6G6JdHkXE7/3Err90AlLt96STCzJQNcY?=
 =?us-ascii?Q?4yIzAaHhL7sJcAwZ8CzMHR7kM8QR0zss2DWDJI5HlFHvEHbiE7IYnS5Q5X2v?=
 =?us-ascii?Q?P0oFDgsOOHNkKK3MRuFovRRTMfH/nMkiPUtArRRQJSEAHTksa6j8VenUL0uc?=
 =?us-ascii?Q?6OXbqfggQsv+IrnFkRuC/TF/ed6l5fKqZ0J1hwBpcWnq94uGZhSfhdqNwRye?=
 =?us-ascii?Q?qp0NWYj3ObVJkXZhomQixercUyx2gChfstSY3H1b4y0h3EoZealHcNvA0DJ3?=
 =?us-ascii?Q?4WEraE/mVRSjGZFFKMoQ9egIbsMJB4d3ek3nL+6KFLPF/aGNzRtyMLXT1Hbj?=
 =?us-ascii?Q?/8bdUCrc38+X2Rxaehg8g9saIEmFCyF43n7VOhaO9Drjlqx3Tnt1EoCBEt58?=
 =?us-ascii?Q?A89Rl042pJjOSva3Mf4QTXhp0zCxnRQSsmaogcwFB2y08CcqgeZHRAXq5ny/?=
 =?us-ascii?Q?al6GBvcU78pOgZ4N9ZT4zZx47zJIjMu7hTr7/Oktcp4jj5c7lbtsKRARbRlj?=
 =?us-ascii?Q?/2/s/NR2kjT7TPyQHrc91Wnd/cvE84nlVrk+RSjowrYhppZbWKPnmwVsQw8K?=
 =?us-ascii?Q?vizjtE+ED5KqhegG5aQfHSD5PM4FgH71yX7Kc6Z4asf8oFvOd8fsP4qdZw34?=
 =?us-ascii?Q?P9ArAyH/+BKY6PtrHzR7ukFAfUIo3s2Z8dEwxj/poJ13LsIzAKZwcnEdAzN3?=
 =?us-ascii?Q?AMOUVIsfTBPrgtakQMfqg8VgmxS1rW20y/tv/yN9hVpMX6YxaIWiv7675oh+?=
 =?us-ascii?Q?dOP/LbMdKJ60gFlDc92FlxSRTjoEYbb7XOxHIjOzMFeUxxPevugJhi6Mriww?=
 =?us-ascii?Q?FKNTto56FSIJj7Z5u/B6Pf3liqJk+v7f7i4O1ioFAIOLT3ezScAp7w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AOoxrw8QpXDxcodAp0Zgw2oySplmJeXuyqICsIIw4fu4KWg2QarpNeingpqa?=
 =?us-ascii?Q?C9Yu6V8yEtqafng5vtyL8Px7sUxRweKkfTltLbmBP5e/BkmVXxkA2Y4fG60O?=
 =?us-ascii?Q?+k+vzYFeQ7RtlRrktC2UCjm+h4usYigcTbnyVwT7Mju5ca2spAhsPGBd1HtN?=
 =?us-ascii?Q?4Ospyb9To/dWf3HpridZjfn5fX+qW1BibWDYgxvErFwSSO+BBRDe4ldwgRrT?=
 =?us-ascii?Q?KTSTjHW5RluSPR6rFlfzNo9x/T0usrg9PkIzc2Dxwzxg8YaG9Fn3GQ6MC6uJ?=
 =?us-ascii?Q?S11sv8fw+cghzbj129GfRplsMjPmaS7X8K4KnhUmegTPbrsj94e7Pb3BH+MQ?=
 =?us-ascii?Q?WYUUf/TfY+NfyOjO2Oa54zYRywbEHigkyaBnXXa0gpd6vgF26cpNls+HC/wO?=
 =?us-ascii?Q?RYJmC/3ArmPXfOO1E4iWdLjY+k5yukr8j5cgNFPG8g4m0KSyvuKj5DDr0cBX?=
 =?us-ascii?Q?ltmxNOBzi+OG5NwTUcD3fpMMlD15mbqTpA+UBjpon5vtx6+RXZYph12M4unJ?=
 =?us-ascii?Q?ze0Uj7q66e9o1xb5vcMXf6Cfph4kBuqtey8dPTGWrt/II4d37TkpGgvyLQy3?=
 =?us-ascii?Q?hbbqjO4wfNwyA92N2BrMwzDFYI19pRf8pAeSHto6b/6x/30Ny4CzkyNSP4xH?=
 =?us-ascii?Q?BhEQu277yJS+Rbx/VTWfjl9egRUSBEbmdj/fOiQ6RQ0JPqoALCq2IATRlF6c?=
 =?us-ascii?Q?qh8rK+4TO9ZvzAt7V2CGJKBUYXrQDw0apPK0h3AK1EkLGXB6hY0wT7U32bf0?=
 =?us-ascii?Q?JfCzJZTYHRpTibILNmEprlVgtpvobwZj9SiUk1n4ILWTlVJIieyxODn+VSIb?=
 =?us-ascii?Q?cr7sEQPT66ybpCulzSBSSbMEvdfQj48XLRRAuWWF3jN5jRLBkpIxIufhPjuy?=
 =?us-ascii?Q?MsrOeV/GV6GE9JCsvSYDhgO9YQWCMwaOg4pCymlPurzzphOcMrbuQmcrkn1s?=
 =?us-ascii?Q?r1Fza3lptKPFeceGOVDQSElAoE3sxC/0fZ3qlF+1ZSz+1FZQeEhZSuDmDjeZ?=
 =?us-ascii?Q?lKuVYA2a+b9pmnHAxMrwvun9nGQEwf6qE4PihTq5MzJ4+/IL9v/rxzJqoFhu?=
 =?us-ascii?Q?lk4eBltSL8cdhqUXdu9VBXBoImQFkHPfsOftIZRvsR+ZYao9bu8ORA/Po8iP?=
 =?us-ascii?Q?ccBfuCM4iZpepFdHQigh2tDtFz+AHWJhPeDTXSaS7XdjTGxwEowUp/lVknU+?=
 =?us-ascii?Q?pjb8+Dl4D8uvIZlOFjmPpwg9cvSg01qQlpqINeZNmkrPJXimSdhw01cvJGp3?=
 =?us-ascii?Q?Fvd0aryeVCnNw9PMzzrCAa7UKLb6huT6KAl+q2hSX+5It49v3+JsGqUCHKmm?=
 =?us-ascii?Q?2r+vIPVM86/x9zR+aPupdiTskFw4mOQj6HxUU2ApTAwdtVTzRnRgdoxiP4LL?=
 =?us-ascii?Q?KTx6USTLFjH/sX4/vgSiSLOHe9+ifyAK8olcy2cuxuw/+LMTwssyrgEIFvlE?=
 =?us-ascii?Q?2NiYHlVCmDj/6aA/stPcFO6kZnr7+d7+0bfrKgrq7vd6jTz9o/rFwCCAE6C/?=
 =?us-ascii?Q?on7zrGZwTeJSYuMOm43OOdSXzyxN+tbYKYE8W8u2GQfYVZhoHp4vSuYEhpXQ?=
 =?us-ascii?Q?khFidMlg5y+4nLxDg/HlVRGAHFKlT1EKO9N6LncU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d962989b-2eed-439b-ee8f-08ddf602a75d
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:55:41.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9eDMzuYUg5bljxFtOoSj/6fFK4JMSXJicANrP3vv/2xec7gVFEMToy+o3/v5GIykDZAOe6ez+j6UyF+qZSYFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11291

On Wed, Sep 17, 2025 at 04:14:51PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
> clocks and resets, so add compatible string for i.MX8ULP to handle
> the difference and reuse platform data of i.MX8QXP/QM.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

This one should be last patch because 8ulp dependent on patch 3 and 4.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..f46ed7a291c9afbccad90e8498a6c99900922e2f 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1095,6 +1095,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
>  	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
> +	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);
>
> --
> 2.34.1
>

