Return-Path: <linux-media+bounces-43208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5A6BA08D5
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 18:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1EC316779A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0D630594F;
	Thu, 25 Sep 2025 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YXQT20cQ"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31130255240;
	Thu, 25 Sep 2025 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758816549; cv=fail; b=oCPKYJgtChVFJdCjI1OQyWs95PJ9S1GNgKrfd/DqjVlsyMhh7/hQvtSTZqoMuc83prUOf1y02bjqEb+PhRipw42r+GMWWFqM4SQloHIIzA0GjGqo8RzL1MupMfAn7MewBk7iWfeg9kJqcmSN+Ac67lpplj0qW+d2HbFaMz4+PqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758816549; c=relaxed/simple;
	bh=Bcll15jk2IaLkAXvqFgP1MC6K2I/BtHG4nCDRpGA1lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MrCPOpzvqzbs4oFW89xwpdihGZkDsxsMFgeyhGHoEtCpKjYmjZdyhlSW7QW8t0IpG62PbbgXg+c7qVx4E9LiwcG05/PpzpCadAY6r+b4okt2cXIQRB4xPFI5r6zoyFy2KYzuQ5lRVtC/FbU7PZO/iDwvIh2gk7Zq9Z7zUKy5P6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YXQT20cQ; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP6a+oWEcVfdPIsL0+J7VcXtMEG8SnSXFbRZtcX3Bdjr4rK9gtMNCRa85ciGl9HmZq0jE9Du5Sy6MeaPqI1X+XjlhhTOoaPTid4UeOXjA2NRR3SZZwKgBK7Dtzp2E7VEauIzH/d+rerBhpGigll9PH8+6OnnoUcpr9WWQtr3LNPv1q2NU5wwcgWutwNwaLLjLkeWOxpWef/TV8IH0w1y9iP8IKCOwMAfcnkISfVE5diHkf0AvObcdHD7Ut1Ev7NVYUrVYYOT2nTiMNjFVwH78HaJOuxe7GIQhsp25l/ZsONvagCcQR1KpMJkKjwzjFD0sTkvotVpAcQOMOUrHEszsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ2q15VpJLLjtHLdUl39VRiYwTQLeM4uOKWOiZeOGPU=;
 b=h+TW0ia5wBaIqR5I9GUqVP4+2gEAbpTtjAbYdEDhSkNubL7x9UIImTVcP7gwuDyEBYtYpx2ltNDxL8ZxVUsomP3O6YLOfJ+77t/y2YGofdwbTFgb70kAbcJez/0DoBIGkWmePYIvyfBiw2Cc3VNu94gu/JBrY4pmYJK45KnNqKZrxYBIVNZcq1eggRWvUfhiXr4/BXJyXNnxIWP4Lp+XvEmzcB86D0RtkX20WR0rxkz0ayTvVmp0uV+K5gcmQzAqVNk/NeVFSHdkZn4Ig4lH/IqTS17gURdu61Vv4ONwZX/KgiboX/1G0w+AI1DP4Ze/PeN60Eh5XTdcIs30S2jTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ2q15VpJLLjtHLdUl39VRiYwTQLeM4uOKWOiZeOGPU=;
 b=YXQT20cQqZeSiT4TIXnau8QuEvp/xh/PA8zKooVJ6gR01DEi98YBjhv9EgbYOgaTmQkX0nLt2d+copXZ05pcjsay/QL+8tzzv3Tn3cLx/urT8miPSDwv4UOkliZngOLGDVlqNfWw5VIMqT3U3U1x+dgbNvFvr8lb3SOyP1SQSDgiGlWTWcIrjAGlsjYMs6Pa0MdQRg7N/s5JsZvuTF49MwhZLk9pcWO7y45ep6xHUkwkS8kFkSSgcFMWciQMso8IP+KwFX2txhjJzUd7LYg7DQs0SWmb13mpRv2zffVqIasCz8q50E3/x08wTCtk8fwUvH8fjguqPAeVhWDL4K1VgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 16:09:04 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 16:09:04 +0000
Date: Thu, 25 Sep 2025 12:08:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 00/31] media: add imx93 mipi/controller csi support
Message-ID: <aNVpFuCAcr9CCPNU@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <aMLvhdJRGHM+8yIH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMLvhdJRGHM+8yIH@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH7PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:510:33d::12) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e32957f-dd95-4fc8-2a14-08ddfc4dd8db
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|19092799006|1800799024|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?cSugv1w1FS2zck7NZV3/IiUVDVo+4i25iMWj6PQ25O04vcdr/cxg5lxE8dvy?=
 =?us-ascii?Q?OenKEHEGbjoMQGLSuND6Q4Hs7nCRXHmaYt5GmnejXCatE8fgVjiZZrIm4Vd9?=
 =?us-ascii?Q?DJTtTZNZbGK+LPsIBP0QHW2K7ww8lYpVrOxUnr5P+mVcSUQGCGu+YNlZ1eHP?=
 =?us-ascii?Q?Q7Gh8LziXcaUrgjcTlTbiYigLtzA6x9pWyq4FCMP7QcsP7dPMgrrz7KhU8RP?=
 =?us-ascii?Q?W0FjdBsiHZZq6Up6Cxm4cdLmNjO77YCazwDvPRiwgYT4ppwHrvlcxMqqGs/k?=
 =?us-ascii?Q?xAWByxaCpRvcBGXtiWIsIRbWVIJft+qQkPK7xVbGNks+igvnADek3+sHdyRj?=
 =?us-ascii?Q?JeSOkUiwHMOA25DIWTRFXgm/DssXy2RGMwkEFgVsYV5bk0UJGXSEyLzcmgBC?=
 =?us-ascii?Q?U2z4zmvngr3H5yni+UvXZ7KRntkVLmWC/Fccl16ennpGbCZoc+SSLQUWHcL8?=
 =?us-ascii?Q?69Rf8Yz+nHCr+8ZWLYkSLtZXCec2jR2C8G3UFkgkS4NLWjj/TvX52JKBRZcg?=
 =?us-ascii?Q?yFFq+HcxXQouk7CGWTnwDghPIhS/OA5ERliGXNDhg4oRSa37sva28Et8N4Ov?=
 =?us-ascii?Q?LFVM08aKOL+nHiUzG+OXAYkk3NZgS5P/Dh4gze9KOKQkeAWuQMIaw7GFHp5z?=
 =?us-ascii?Q?HyU7wtxsg45ntoXPOcjwLE2+qbz0u/Cbz4PyRK+xu1Y0Ym9JTMCuVISpAZv0?=
 =?us-ascii?Q?v7Q3x/SkpivoPkOivdWvT3ryfKQp7LAlGG50xLffXDfaa41sQu+XfBBORMze?=
 =?us-ascii?Q?fCdMO4cbNN23eKTCpG3Tx6WgzbioqzmjqjZQr4no/EyJJrH/63VvZOoQmP8p?=
 =?us-ascii?Q?5Ioyb2U/g96DnjsVkM92zA9zQ3SOTD+FzpmyPtaOiZ0BQ+Pl1BhRLzFXQvs/?=
 =?us-ascii?Q?TyHXSA49EpfB9YPAlxUpZzaYpuURTCU2ZJ53nt2JDHXO4y+Xl/Clksfj7+KQ?=
 =?us-ascii?Q?UdTtGVi+CVrcm1K4oXNA6+Tc52WXsLsVP+/MnCDmn+9EedEcYwf6rhEauEdf?=
 =?us-ascii?Q?hvs+QT9g5VtNNcJ6VzSR3TO198iarAXaSfLtUltE3t99UwdzynOrYcvy9UKi?=
 =?us-ascii?Q?BMX8FDbcGlFKR0jwfvaHR/+UtCRnOr3Z0h33H6XfKQCHCiH3NUtXu0JQySD7?=
 =?us-ascii?Q?gq7g3aHKTIj4ynWp2IfpOlcFO93sWdTeUqIu9WDzdSsG2MrT1jrJwiPqAiGo?=
 =?us-ascii?Q?IcZVXwuNpTBS4kTBa6SkSRpZrWnyIlufoVp8R5CHJaAhNSN/aKsSPr2Aen+e?=
 =?us-ascii?Q?FCoTB62QPEXAX3K2Qm9t97sfQCdN7o9mhSpyar6Vu4JPr13DXqlq9EbopZ2D?=
 =?us-ascii?Q?e25k4MndZh2QNR8O1o4nsliLFh8ltLbPUHmpi3cg86q+AlTe1AVZn48Htleq?=
 =?us-ascii?Q?oJN1RGv2bXg+b9dUolWmfDX4+NQLXa+FFA/I48tyFaByW1US7wxJ54Npjn0P?=
 =?us-ascii?Q?bVbVBeabgI2EH1GxRjpPAV3ruf0Jn3dD?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(1800799024)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JqniFAIIde5OASFiCQ8PMD1HQDMC0lbKbvoOoHu1zJRmKgHrUQPFEADuPMbD?=
 =?us-ascii?Q?XqH+iKCMDbt/5Ztpb5cw3HUMvoVaTAO698y8+hm0zBFH4v5A2ZEHSZVWDdMV?=
 =?us-ascii?Q?jyDNRyxpT7eIqx94MuA1Hl3TcUum9s2z0bL7zVailBUIGawMty3KlVLJZNHN?=
 =?us-ascii?Q?v7FWrBQ9/z90bPhwUwexceLzDIunidqWrVseTM+J9bcaZFcLGe1Qv3NbWvYl?=
 =?us-ascii?Q?v7DlVN+0ew+FvL2qh/Dj0MjxsFAL02TxK1p5JISWy1iPbd2Jx8J3zue4gUk+?=
 =?us-ascii?Q?vX2iEr5alluq1EgRQfeT9m6DYLBYVvJoD20GrQDQW1Hg89tQbzyFt1rrPCvm?=
 =?us-ascii?Q?oEvf2tywIIq9S/zNJ7Xc/VF7mFLg/XVxI/fG/OJP3eRXO56If36OqvpTebvt?=
 =?us-ascii?Q?P/SuGcGPsuw+yZrm0gHRlebYc9Ye2z8jpqdAAxe7MYE1t1hVcCaDyAlhTWZ0?=
 =?us-ascii?Q?DKYifFx3UI+bwyHVJ83xqM4zAZV/HYzpII4mfWxIH1A+04pQlFLo7AXt1HRZ?=
 =?us-ascii?Q?LKFq+Cz4030w4PtUpWp7N99NnRWn9B5T66/v3GiYgDaMvOx19pm85VPoK9q5?=
 =?us-ascii?Q?va1Dv9Mb7uR1SL6kLtLXGEyP1btqG6SBQ6M6dmM79pH0Q5HGjunGlsWkgdQA?=
 =?us-ascii?Q?h2NsSP7u8v/xBNLTF6elwJCPadOMjb/Unz+R+gTCwmqUoO7wnESq+vMe7zaQ?=
 =?us-ascii?Q?7lx5RaktP6KouNs4TyS1sv5+BDvo4bkFrX6fD2xKN6/fr1ByknwKNJUmCka7?=
 =?us-ascii?Q?nMXMC+o+RRBlK1mFu9C8jZhiBVwTLR8JZGCck3hx63gIyzYTZjucm0V8vPL+?=
 =?us-ascii?Q?3SqkG4tMqgMTD0q9HxsiSjGvnxxEDxcH9k+0ygqaDj/BCXmCWerJprbOkRr4?=
 =?us-ascii?Q?veWD7paVxSThwZHF3rawGaKu22Twt/lQZg3xyczYo/DmIvc6pshLLpdvIJSf?=
 =?us-ascii?Q?7FOp8Jcyi7BZSCrV/frObLo+WZp6Gi/my65+h8l4u+DKdVJhoBaswOgAEZqt?=
 =?us-ascii?Q?GPFi23RVEdIP8ny1adhd6kDw3vAupId/SrcJ6cBT8a/qR3gXrWg1mMnbkbTb?=
 =?us-ascii?Q?hn9iRKTh3XSkM6IGylVjl6A0Nzg4M5vcHWxYYXGxcMAWB6dC8pa8xzfnl8RP?=
 =?us-ascii?Q?mXGCInvwo0PTTg09p5GK14EMH4xeBY2kjskWZ/bpLKcDbFwrYkzRCfSuaRkE?=
 =?us-ascii?Q?cfBaNT2eNlVzm7obJnsb37E6McQRICOi/VQ9NL3PxM44O+1qMmaSS9i8d7Ab?=
 =?us-ascii?Q?S+foA9GJypl/LBrPGg5PEJRwcwzyLP+jRGBtSL6SS8a0obTexlvgvUWhFgLp?=
 =?us-ascii?Q?TH6WmgCygjJJEbg5gMVe8djRhmCauB7oZNvutf3d3zYsQtjkCOxZQgO6/nda?=
 =?us-ascii?Q?9N0HSSVqEuXum5XTsPUABjU8xnfcgsndGtzOwcqGZuqTpVrNu/28+c4bw85U?=
 =?us-ascii?Q?eSi/Nq1Ruhm+SlR7ozRprVvqGklAUluzHO9wwqy+QRjWkyFc2t49WPk/5eFj?=
 =?us-ascii?Q?W323DpZdp7fzTsQ2KSWVpNc7JRWyk4OGX1pZtV2chPXBk0AGqWuBwXLoRfQ1?=
 =?us-ascii?Q?sp8u4Rash2P7gJmtnSBKwXXHH8eOucqqIs7/nLF5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e32957f-dd95-4fc8-2a14-08ddfc4dd8db
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 16:09:04.1162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E6zN+toeu8gzbR3c6ORqdXqPytG5udOfAD2y962hc34iRhTRXYQehzacBBr+YjJx7XpmuygaOnm9yKagBQRgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

On Thu, Sep 11, 2025 at 11:49:25AM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 04:15:35PM -0400, Frank Li wrote:
> > Totally rewrite CSI part driver compared to V1.
>
> Laurent Pinchart:
>
> 	can you help review these patches? especial first two patches
>
> media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
>
> After that, I can start do more code clean up work.
>
> 	all of "media: staging: media: imx6-mipi-csi2 *" are trivial cleanup
> patches.

Laurent Pinchart and Rui Miguel Silva

	Do you have chance check these? especially first two patches,

media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()

	After that, I can start do more code clean up work.

best regards
Frank Li

>
> Frank
>
> >
> > This only includes CSI related patches.
> >
> > DTS part: see https://lore.kernel.org/imx/20250701-95_cam-v1-6-c5172bab387b@nxp.com/
> > PHY part: see https://lore.kernel.org/imx/20250701-95_cam-v1-4-c5172bab387b@nxp.com/
> > AP1302 part: see https://lore.kernel.org/imx/20250701-95_cam-v1-7-c5172bab387b@nxp.com/
> > 	upstream: https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/
> >
> > First 3 patches add some common helper function to simple code and remove
> > duplicated code in difference CSI2 drivers.
> >
> > Clean up stage imx6 old version csi2 driver, and prepare create common
> > dw csi2 library for difference IP version.
> >
> > Move stage driver under driver/media/synosis.
> >
> > Create simple platform driver for common dw csi2 use case.
> >
> > TODO:
> > 	1. create bus, to probe phy driver under "test_if" interface for
> > specific phys under CSI2.
> > 	2. support to combine phy, (which connect to both dw CSI and DSI's
> > test_if). Need use DSI's test_if to config combo phy to switch to RX mode.
> > and also need config RX part's phy register by use CSI's testif.
> > 	3. move other vendor's csi driver to use this common DWC CSI
> > library.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Changes in v3:
> > - update binding doc
> > - combine two add helper function's patch to one. and use media_bus_fmt_info
> > data structure.
> > - Link to v2: https://lore.kernel.org/r/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com
> >
> > Changes in v2:
> > - totally rewrite, see above section
> > - Link to v1: https://lore.kernel.org/r/20250701-95_cam-v1-0-c5172bab387b@nxp.com
> >
> > ---
> > Eugen Hristev (1):
> >       dt-bindings: media: add DW MIPI CSI-2 Host support
> >
> > Frank Li (30):
> >       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> >       media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
> >       media: staging: media: imx6-mipi-csi2: replace space with tab for alignment
> >       media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
> >       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
> >       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
> >       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
> >       media: staging: media: imx6-mipi-csi2: use register structure to match hardware
> >       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
> >       media: staging: media: imx6-mipi-csi2: move probe part to imx6-csi2.c
> >       media: staging: media: imx6-mipi-csi2: move sd imx6's specific initialization into imx6-sci2.c
> >       media: staging: media: imx6-mipi-csi2: move csi2ipu_gasket_init() to imx6-csi2.c
> >       media: staging: media: imx6-mipi-csi2: move number pad macro define into imx6-csi2.c
> >       media: staging: media: imx6-mipi-csi2: move dphy init part to imx6-csi2.c
> >       media: staging: media: imx6-mipi-csi2: use runtime_pm frame to control clks
> >       media: synopsys: move imx6-mipi-csi2.c to synopsys/mipi-csi2.c
> >       media: synopsys: csi2: Remove deprecated s_stream and use v4l2_subdev_pad_ops
> >       media: synopsys: csi2: Add phy interface support
> >       media: synopsys: csi2: Add basic v150* version register
> >       media: synopsys: csi2: Add irq support to record error count
> >       media: synopsys: csi2: Handle alignment requirement for width
> >       media: synopsys: csi2: Add register prefix to register field definitions
> >       media: synopsys: csi2: Add need_dphy_reset in config
> >       media: synopsys: csi2: Add default simple dw_csi2_subdev_init_state
> >       media: synopsys: csi2: Add v150 lane stop state register bit define
> >       media: synopsys: csi2: use standard v4l2_subdev_get_fmt() function
> >       media: synopsys: csi2: Add customize get_frame_desc() callback
> >       media: synopsys: csi2: Add Image Pixel Interface (IPI) support for v150
> >       media: synopsys: csi2: Remove source pad connected check at dw_csi2_enable_streams()
> >       media: synopsys: csi2: Add simple synopsys platform driver
> >
> >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  151 +++
> >  MAINTAINERS                                        |    1 +
> >  drivers/media/platform/synopsys/Kconfig            |   20 +
> >  drivers/media/platform/synopsys/Makefile           |    3 +
> >  drivers/media/platform/synopsys/mipi-csi2-simple.c |   75 ++
> >  drivers/media/platform/synopsys/mipi-csi2.c        | 1260 ++++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c              |  149 +++
> >  drivers/staging/media/imx/Kconfig                  |    1 +
> >  drivers/staging/media/imx/Makefile                 |    2 +-
> >  drivers/staging/media/imx/imx6-csi2.c              |  181 +++
> >  drivers/staging/media/imx/imx6-mipi-csi2.c         |  846 -------------
> >  include/media/dw-mipi-csi2.h                       |  120 ++
> >  include/media/mipi-csi2.h                          |   30 +
> >  include/media/v4l2-common.h                        |   30 +
> >  14 files changed, 2022 insertions(+), 847 deletions(-)
> > ---
> > base-commit: ad0a162e543964443feec3a6a9395a64fe6c35c9
> > change-id: 20250606-95_cam-b74c094ad1fb
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>
> >

