Return-Path: <linux-media+bounces-45839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF1C159D6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A013AF98C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 15:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4152D34A3AA;
	Tue, 28 Oct 2025 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EfpIkGUy"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2913451D5;
	Tue, 28 Oct 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666372; cv=fail; b=SujLlXEmWj0//ZM+4iSSZn9kY6LoUXwQqxQ8dX0gfRLtANJ5gCml2ts1O5nrmdrIi3gefcLe8R2gXxE4qkMIN5kV4QNYENyb/c1c+tkYXLLJyEZveATyWOAglXdxQveDg/aqtlzcYAvIi+s1vSvqPv6qpKnf6WWpsCOyBEweKfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666372; c=relaxed/simple;
	bh=JlQeDQyi7CAGFuM3N8BKgarX63agsaPzvpD7X3iMgss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q2TpSPe2KpIjHN29G6PDW2mlGYgW2U/yOrvI++8MKhc+HVTYnIgfR+fzchrNpj+op/KrGbb5HtW27NrOFZBAthFl5ejucynVZ5T8QkePRDj5Vc9jWdDy043cP2C8OOMniUoJEKl7JznXh+zITTpkDoC88aISrg2JNLcXwvh04L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EfpIkGUy; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpL9G94NQFPm5sgd42r1W3a3QBjP6VgIcJoUYIYUDWM32uCBboZ8oZmWTATTb940kDWf3KXeXIFd+ojEkn1hy0ZvYFtzB3XJOu+vgv7hNFYPmup8SQ9DR1vBDwpClWfHp+7YlVLuM3CnXVT49YJg2JheQtukZxfZL8BzM3ayjlkkK8kB6f5DKNqWCqpXjV41ryZ3LFcRy95tGUCM2TTcJH/jkFU7GxPhhDkqkYP5hXassSLegilqLLGLO2IpzsgI3R/LIS7vD04oLcgwwkut9s7p5Jm6Rj8ZP7q8oR69rn07PjcMN9lpUyxgKBGOiLzsGW1zuDLXhGjuJCTdJhhFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iLXANqp5GLRVSl9BAqSbFY/ygfcL5MH5h+BFeV7LU0=;
 b=k2f3kbHtRb02bR4TjQFOUD3bzyXeWkjwoAYM+xapdIeVRccHzTWLpIZxh9bxTRA8WK6Zffi9dXJkKUXjLeC4xIKCB8UFoJ1DBhQfi6qedpHI39FrPoD7BtCEXVdWfgU+BBj/bwrmyPNuRDpneFY04OEMb9vFIXVk50t5D+A8yf8ZT+HFNTGb3Nz9u5lt7VsoFhSN6Ue1F/F+vKaYDmGL6ZvDnaBGc/KdEoDYOtTF0WkGo0dDVA6ARCzsSM5bhVUR6Y/qRhwdx09VR8pggD3t0PPi1OHllBjf1jllsy3v7I3F/8iAxfZ/uDK5Hn0Q42jeYTZFGseHtELCmxXUaTj3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iLXANqp5GLRVSl9BAqSbFY/ygfcL5MH5h+BFeV7LU0=;
 b=EfpIkGUyJBgWAdw7m/CgvvoOgWlmr8l5mvINB0LkvSF6xUbuzebvR5GkR8dWyPvqWNngvpxgbNUd9tckRAaD6VT8Kxe3QKMKBsHdk09wN55ufnUGJRnB0bFjEd2j/REyOlAk5iI/j1N4c4IFqF/IrP00ri6ezqDSQkRbKO7ncWEcOQar5twpoo+uc5NpOh4WfvfLWABHunSqizf9XYaO8/i3j5aBmolNQ+sfy6J+YBeG60LA2YGFEnjJofpR8I/edjCHNuvZlsoTy7CAzodDcvXFMW0eqy1rBNYyJJtAWG0pnxTPe6XJX/77noMVrPIidMAwbOTAWJfXVi3+5VDF3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 15:46:06 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 15:46:06 +0000
Date: Tue, 28 Oct 2025 11:45:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <aQDlMpKgRkeSIx0y@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
 <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
 <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
 <aP_bSQUIle_9-L-7@valkosipuli.retiisi.eu>
 <aP/ehdkppeVr5G6H@lizhi-Precision-Tower-5810>
 <20251028082753.GZ13023@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028082753.GZ13023@pendragon.ideasonboard.com>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: b6268eb5-935a-4739-4c40-08de16391b7f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?9jsCGDRgqJHodEj/bKwa+HqwkBGnOUydEnefeQyZi8OKThAZJF26tilwzIBd?=
 =?us-ascii?Q?7C/B9y0X7FhL573SyP5276UBauHmIv2UFdb6HuTCUqr+maRY4Arbwn727j8p?=
 =?us-ascii?Q?6vCvyvMRr9y4r0aa677PUQHJ9NBaR0oqYnYDrUHQsDP34gSKDWN3KyONmpVu?=
 =?us-ascii?Q?MRUFFahMF4maF2o4MRP8ZEylrHJDBtEwLLHUZbrqYStslUxqFGisahGElayu?=
 =?us-ascii?Q?vS47Dpk+ToCj/vh19KfSynaAEj995YUxpbYAzcUumFxQchccGB3Po+86dT1n?=
 =?us-ascii?Q?ZLy8D61D40HkJnQ9Q9qp+8C1ZHOCju67uqOP5okB91GdhKxTIM/dvKcL0P9P?=
 =?us-ascii?Q?3kYcUWdC5DByidH0I57xtXKc9Z2A+oFGdtTVU/xw3c4cIQCPPH+Kq+flskE7?=
 =?us-ascii?Q?KN73xSqS5Asu8RWrLmdVrYAFBWYbvnxhzEgLILejgNcuoVKAujT/qndWfuCT?=
 =?us-ascii?Q?/ugp+fHRF6wcxtF1AdCTs8di1c4jZQZadjDsYkDRHlqp2t7HiHNh032tN9f5?=
 =?us-ascii?Q?QCEmPhYcUlLxRef80u4yQ9OLEehpr76wAI5wrBjzvyVxtWKSapO6AGvShQVQ?=
 =?us-ascii?Q?D32eTyDn7lqN9ancOLQ+ekc7w16VmoudEG7NzuJ+qZsBcWPDdKK65AP8gnc1?=
 =?us-ascii?Q?zT8evGX+oS1xSv/xlSEJtzsOgDk4giYbscfYpDzWHEEot31lxK9KOpd9DzPt?=
 =?us-ascii?Q?Z5lbJJ0SgYZe9/UibaxkZPgMX6Y1P34tXjjCHglQmR87xLf6ofaBC0v4KqPS?=
 =?us-ascii?Q?CkTLtO+1ejzLQn7m+1dCupMUpXLOTnvnHywVKl0wuMYVC+Q8qR41umONSWH0?=
 =?us-ascii?Q?px8f5D9KGRhlAkVCTjJNUg/NfZtNtz5/A5FC944FqBFTUNGzwtS3R6qjVReQ?=
 =?us-ascii?Q?dPsq5yi9hLEoAIvxVusiL0LjA1vFu6ItgAgCqHckGeVX1kgqRntMtbfsPOYy?=
 =?us-ascii?Q?XDoa8V8lmk+1M7oDOWZz48LwP3jobG+iH9PDDfuaWBXB/cplHsQCgE8zTNBh?=
 =?us-ascii?Q?F+kLZRyQ4v32jkwD11cMIKVbYU3BT10ECMerUoiO90mnt3OHOHw9rr6+eW5T?=
 =?us-ascii?Q?vfLr1jrl3d2p8OkRJ7fKaT/cSGO0uGF+bUQaW0LwCJW7Dr+l4ISL6uJ+u6Sl?=
 =?us-ascii?Q?3YUcAq5ZWTvhLE9Lkl4PtIp9+pTTCyeLohAudWdpJpkr99LEqe8/V2SeeAQN?=
 =?us-ascii?Q?hMG6AXiPD2lFv4WGJJjhItgsJKtVbiRu3jKXzTtfpNICVHRAEp14m9j9YRgf?=
 =?us-ascii?Q?ksciI9ZNQaJQTmN4WjqRDetUCWEukxRxOYDC6OCadNvCayt0dqHPbpUCPHdd?=
 =?us-ascii?Q?T/Ic7PYxv8b2dvDICg5WwErYk8DCzBse+xRg5DnbmsoGNnl3WHvXUSFuciTO?=
 =?us-ascii?Q?fIsb/YErz/hWYRkVSIOmlAfYzX6WKPmGibeJxzjQiJyaXpighECKSVzcw9pn?=
 =?us-ascii?Q?KQaSbnEvPwniojw44QYhDJRUYKdFo5r/4/QIbX1BnYa4W4kb6yc42w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?O5j522nm/9kSQ4nT0squtWAP+05jH2J9D4m9g2NmuJFrbvvQJMax8IT8FYKC?=
 =?us-ascii?Q?mgzjqI6jZkBT8K6UW/gsZulSyvIapJguZZH6LIdu/aHTFsxo6cJ3NS7cgYpK?=
 =?us-ascii?Q?0XvuOVpT10baQaHAnxNw6mbEsLJx6UhXLZ7xf9bXKK3NaBmmO766oWw5Bqa2?=
 =?us-ascii?Q?mz4enPCkE9YaivfzizV31NF8ZNOSVgcc8FDEzgKIB6ibwguoecOrjE068A8Q?=
 =?us-ascii?Q?arihS0lrictePFU+ogX+2zGCyC8oGtIdGk/cbeLmGgfnW2WW8DWNRB7h6YWv?=
 =?us-ascii?Q?A+vvEyyzS5ABjvgsN9AO1oMC2lUShzYppbMEnKHQsdz2VbW7AzXwkDw/ELs8?=
 =?us-ascii?Q?yvvd0qGXmrquaT9CKwI27Ahk1RQAp3VBjoxyGlwaKX5QaVBgVpNQwIS8x/1Y?=
 =?us-ascii?Q?wH6kb8aB8xNyXOdS/LeU73PC7IDSirblDzrmdWq1010PKqK3lwbNzqcHxSgv?=
 =?us-ascii?Q?r5M8wav9DbwDPeYHNBuJNLCyy9J3n5T6x7i7m5IUkjrzwmMi2Yd6SyscF9PM?=
 =?us-ascii?Q?ayNXCp7jtBH3/lTmvPWpV04GG7poVbjwmnm5YEOe/6x1lJ7QIHtCXgoFuqsE?=
 =?us-ascii?Q?DbF8PwNNXonEos1McD3zVhw83/wKPKgbfOzvcORul/ZUogIWuyHVGWBhRu1T?=
 =?us-ascii?Q?yM6ghyL8hUhUKIxjE9tfKtuAHEaBU9zcC6XqWnS+6M9SnRVnPyDvwhyqeG9W?=
 =?us-ascii?Q?IOLXYrsUq/x3tn187EJlKkVRc/mR9ZbIV1YSbm9r8WUqkR8zXPQmuUTCD1vQ?=
 =?us-ascii?Q?Ey3ctygJDTkU21j5E9W4gHzBhyybsr9q54Vx4gT3WaTEFwBIyJJz0tRAfc6t?=
 =?us-ascii?Q?KG/xsl/Jf7faSQ+d7Ri9OhTa7MaLat5cg7Bvs9BhZ/4OGNfsVqoNkI1kHuWQ?=
 =?us-ascii?Q?2stdTfrUetL6qG9RSnD58xJxt5jbim/q/k03FRsgwGeuXBZGL1rSF4eXLvW/?=
 =?us-ascii?Q?k5sAKwb4wbwT8LB8EerM1MY067RNNKEVC1c780iWmbKrlYM4FOZXM0Q4rFS4?=
 =?us-ascii?Q?NJ9B1zbaRHEGpDt8ad++CJd5FfufOgOzvwHOzaqL/UIy0Ggc0xJGNjJR8O68?=
 =?us-ascii?Q?p05QReRViB+hMwxbUmsQRaxS4rS4CO85hRTY5W+QgGM8O53CNII5XLN0vxa0?=
 =?us-ascii?Q?DPItr+t9yvh7tbl6GOI6+u+IyzAZDpqxswOtblOMAvezJPJ7v1bmp76uUOSm?=
 =?us-ascii?Q?w9VJgGBDOE/eiEJ8CAI1V6baihf/yBaQRb6SXYskjN5YJj2y5/FhbnH3DYST?=
 =?us-ascii?Q?47yIvfQDgr2w/WFxgcv7wcfmYy4wnf2Zua3vS1Mj5QuRTECob1zrTffD62vL?=
 =?us-ascii?Q?AGxYx/yX8Ouvp8TU2QqAS9egC/Are2COOTaKDL9ZQ2UY+L8EfmqwoS71r99o?=
 =?us-ascii?Q?b0TDSzSApOwr4xYhjPBHSvgMa89WyGeNAu4f/xOo5+HntIx9OeayLTLlhuwK?=
 =?us-ascii?Q?/ezWxiFyfOmsu6VZpSCWfyebwkHuFIPQbSCFDf45dVku1TyMem/s63/kyN1p?=
 =?us-ascii?Q?G2Q3Kx/W4fElw2wOHgJQSNZeH0TlNrnNYwZIPOriW1+IhaWpFDpXE5s5ZUOA?=
 =?us-ascii?Q?/W56W9dpir6kqfU7ow4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6268eb5-935a-4739-4c40-08de16391b7f
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:46:06.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlDLsZW3iZzUIT893GQG18JegW7e2NfAe4SxswNVno3NGMtPRhZy3rRLpQm1Chp/UUk5ksFOOV6C+QENWN6d0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970

On Tue, Oct 28, 2025 at 10:27:53AM +0200, Laurent Pinchart wrote:
> On Mon, Oct 27, 2025 at 05:05:09PM -0400, Frank Li wrote:
> > On Mon, Oct 27, 2025 at 10:51:21PM +0200, Sakari Ailus wrote:
> > > On Mon, Oct 27, 2025 at 12:32:28PM -0400, Frank Li wrote:
> > > > On Mon, Oct 27, 2025 at 10:31:25AM +0200, Sakari Ailus wrote:
> > > > > On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> > > > > > From: Eugen Hristev <eugen.hristev@linaro.org>
> > > > > >
> > > > > > Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> > > > > > and i.MX95 platform.
> > > > > >
> > > > > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > > > > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > > Change in v3
> > > > > > - drop remote-endpoint: true
> > > > > > - drop clock-lanes
> > > > > >
> > > > > > Change in v2
> > > > > > - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> > > > > > - update ugen Hristev's s-o-b tag to align original author's email address
> > > > > > - remove single snps,dw-mipi-csi2-v150 compatible string
> > > > > > - move additionalProperties after required
> > > > > > ---
> > > > > >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
> > > > > >  MAINTAINERS                                        |   1 +
> > > > > >  2 files changed, 152 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > > > > @@ -0,0 +1,151 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Frank Li <Frank.Li@nxp.com>
> > > > > > +
> > > > > > +description:
> > > > > > +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> > > > > > +  camera. It will convert the incoming CSI-2 stream into a dedicated
> > > > > > +  interface called the Synopsys IDI (Image Data Interface).
> > > > > > +  This interface is a 32-bit SoC internal only, and can be assimilated
> > > > > > +  with a CSI-2 interface.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - enum:
> > > > > > +          - fsl,imx93-mipi-csi2
> > > > > > +      - const: snps,dw-mipi-csi2-v150
> > > > > > +
> > > > > > +  reg:
> > > > > > +    items:
> > > > > > +      - description: MIPI CSI-2 core register
> > > > > > +
> > > > > > +  reg-names:
> > > > > > +    items:
> > > > > > +      - const: core
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    maxItems: 2
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: per
> > > > > > +      - const: pixel
> > > > > > +
> > > > > > +  phys:
> > > > > > +    maxItems: 1
> > > > > > +    description: MIPI D-PHY
> > > > > > +
> > > > > > +  phy-names:
> > > > > > +    items:
> > > > > > +      - const: rx
> > > > > > +
> > > > > > +  resets:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  interrupts:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  power-domains:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  ports:
> > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > +
> > > > > > +    properties:
> > > > > > +      port@0:
> > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > +        unevaluatedProperties: false
> > > > > > +        description:
> > > > > > +          Input port node, single endpoint describing the input port.
> > > > > > +
> > > > > > +        properties:
> > > > > > +          endpoint:
> > > > > > +            $ref: video-interfaces.yaml#
> > > > > > +            unevaluatedProperties: false
> > > > > > +            description: Endpoint connected to input device
> > > > > > +
> > > > > > +            properties:
> > > > > > +              bus-type:
> > > > > > +                const: 4
> > > > >
> > > > > If 4 is the only value supported, you can drop the property altogether.
> > > >
> > > > Sorry, What's your means here? There are more options in video-interfaces.yaml.
> > > > here just add restriction for bus-type. otherwise other value can be
> > > > provide in dts file.
> > >
> > > It could, but wouldn't any other value be incorrect?
> >
> > at least that 5 # Parallel doesn't make sense for CSI2's input.
>
> The point is that, if the only valid value is CSI-2 DPHY (4), then
> there's no need to specify it in DT. The driver would know the input bus
> is CSI-2 DPHY, so there's no need to convey that information in the
> device tree.

Make sense.

Frank
>
> > > In other words, this property is redundant and should be dropped.
> > >
> > > > > > +
> > > > > > +              data-lanes:
> > > > > > +                minItems: 1
> > > > > > +                maxItems: 4
> > > > > > +                items:
> > > > > > +                  maximum: 4
> > > > > > +
> > > > > > +      port@1:
> > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > +        unevaluatedProperties: false
> > > > > > +        description:
> > > > > > +          Output port node, single endpoint describing the output port.
> > > > > > +
> > > > > > +        properties:
> > > > > > +          endpoint:
> > > > > > +            unevaluatedProperties: false
> > > > > > +            $ref: video-interfaces.yaml#
> > > > > > +            description: Endpoint connected to output device
> > > > > > +
> > > > > > +            properties:
> > > > > > +              bus-type:
> > > > > > +                const: 4
> > > > >
> > > > > Are both input and output of this block CSI-2 with D-PHY?
> > > >
> > > > Yes, input from camera sensor, output to others image processors to do data
> > > > transfer or format convert.
> > >
> > > The description appears to be saying this is "Synopsys IDI", not CSI-2 with
> > > D-PHY. We don't have a bus-type for IDI. Couldn't you simply drop it?
>
> --
> Regards,
>
> Laurent Pinchart

