Return-Path: <linux-media+bounces-51360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJlBG3dEcmnpfAAAu9opvQ
	(envelope-from <linux-media+bounces-51360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:38:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9F6905B
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98FFA9A7E7C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5069D35A956;
	Thu, 22 Jan 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YTSZq7tP"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23134DB57;
	Thu, 22 Jan 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093892; cv=fail; b=sgQRJA/xhXH+nsB9DSPakFb29MecG4Tn8Ek2xnvG4+HhJzIu/nJL5v/KrHSuh6zJ72+Jc0c0SDXNDkJZK81qn0nCChY95uPCU1s6NegELaQlQhuOytoJ+ufN2V1nxr164H1P90BQBlLO0HRDkUbcVJmAEYkipSb4zrGm9cZulXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093892; c=relaxed/simple;
	bh=eVaPNuN2wdRcTz4blV65EGJDsXZm/2X7D2GYe33h1L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E8Dirow+b9Zwsd63p1gnnNX1LofTHRjpMpjN76F49MI+nvF3AEHsZBcXqBSU93mG5owxLFv6VVwIFuNx/0X3tHTwbNQMhybPv/wJdqxTUJshPC/6vrr0TpepUL9lHSW8UXIVFvjBFMpn/a7GGr2wBk3XqOcuia/cdImQhM4Wfl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YTSZq7tP; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4DSafw7UBKNHN4CEntBIJA+mSZCdaFp/aFt51JSeAP50REt5jSmDgkj3chamV1FJw8QV3pG1NTzmksTsoyy5tmN0InNoQ5KyXkQSugsgVRiSCAy05nWBkRA6r/0OpTs/Xt6bBywdHF+wDlIssE/7sWW49+X0MLXm8kpc6fTJpaaDB8QfiegZWBgAH2Xf08z2GcHHsBmhz6ABuYMFI/l76R7Pitv22ZLrZtQ5509BefDfTARSM61TunNP1BuSmQoMkwQFB61f+GEDVxf8q/jJqQcw/Bt1zXghybl51NB5faCz/Jl6P5ykzXa/mhrGXMdu3QnEgpz2sji0L6BsTi5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXeG7K/qbT0Mxokb4ehoXfWQAzoNL/M5nQC1h0Uv5Ow=;
 b=B6Lgfw+LvBQ66BqH+CXqW+UJOcPWxkGxetCGfk3scVCfTa0uGZ1pmNZpQxI71HBSlqafc9nFpa33wNMpkdQwlSjX4y46q+nLsR0+wXdm8neheJrMbwiW7VJf4TwHZ10EFoWaFgPzS4FdHp+9GFH1FTi4V3EkaM5vQ0qIV5AciIGGNW3OYVRrxZBZJP9OymRVkjpesYAiQvOBwNK6Aaqm8sMK++Y2+Mifpio1w5XPCt7sK33GpBMTA+Vt0TbgaLzicVr/ZVIgGbep8l3+wgtwZvjN9F9I1Flll7xLpuD8epSSYt6ylDVuj5ueV6w7c34QAMcjBSmCGCQE9oAZsKmYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXeG7K/qbT0Mxokb4ehoXfWQAzoNL/M5nQC1h0Uv5Ow=;
 b=YTSZq7tPutn0aFXfoinzOSGpwrk/jucJc318BWOwqXPH1h7mRnShwTjrkvIN2lip5qeOHJMxoyX9mo0Sp81qpY5wCwCPkQ9V5VuDBvJyYqm03wgv2CxrSl1XMAASVomULczkdkPCxq8J7Z/jJHIK2jUcnOSuB6UiRM6yV3Vx9/LsMaNrALQGfSPF7CX55hR8R13mPv6B+r0M3oSe4f3TSW0TAZDU0kS6ygAFQ7wcL59zqpUbywq+KtcrPYpk1bjG8sozh45wr3FdOMpJM2ODCOYn8YZoQ/qnk6QnzBm8EUG7BMpb6AWoMN0cN8i0krSu3wEAh1Q93tsaoAeyO02YXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AMDPR04MB11702.eurprd04.prod.outlook.com (2603:10a6:20b:719::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:58:06 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 14:58:06 +0000
Date: Thu, 22 Jan 2026 09:57:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Fix potential out-of-bounds issues
Message-ID: <aXI69+y6O0kdaAfE@lizhi-Precision-Tower-5810>
References: <20260122-isi-v1-1-c3ec6e264f13@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-isi-v1-1-c3ec6e264f13@nxp.com>
X-ClientProxiedBy: SN7PR18CA0025.namprd18.prod.outlook.com
 (2603:10b6:806:f3::29) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AMDPR04MB11702:EE_
X-MS-Office365-Filtering-Correlation-Id: b8341334-a406-48b4-4da9-08de59c6a66a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BFQuGTY6czxjAZDjtQf/u+vWfeTVFKTndELh95Dx3uuk+bITbvofkXDnkyiw?=
 =?us-ascii?Q?h/qxXOqnjhHx6AryFGnLpPZ/KoQtbZvYWnbVdHE6fesV5epaNYtBgAE3QZ5n?=
 =?us-ascii?Q?2NtVHG42JmeW9KQ3mfPn+7Uii1RL5Z1PCf8DkFtpMZPvLq1cEUFgbMPaRoPf?=
 =?us-ascii?Q?5oekFeZGkKnCP/tsRaREo6QVzlfj53H2llSZ1x1P4hzBYzpN7mmjiTKI4AAy?=
 =?us-ascii?Q?YS7lK5ejYWvQKrfN7BtE11uLdtpfCWUw7MHxrOF6Z1YTOQYyxwBf+hVniBA6?=
 =?us-ascii?Q?7iy3uvCcvaBDl4PLagp9NM4snFP/wOJjMomYOEjNh99Dcni4LOaHkORIvV/7?=
 =?us-ascii?Q?Cme7nz8sP3BLMN2Pls94TrYSm2u9LXzqKFEykN8wAt05VeMy7JefEofUY63L?=
 =?us-ascii?Q?k/VZXbqHcfa/s1LXMRAIP/Af5l/oICLBWKfNuoyFjzW01ZPik6YPCUUvyRV4?=
 =?us-ascii?Q?UFoWMkAE9u6lECe2zL/t44KczHm9paqZn3I9AoruBDBkYB3DW2kmPS5ECoel?=
 =?us-ascii?Q?LYTrKoE184lnq20/9EV6XWsFhATncDzuuQv49vDRLAEDLgvjo7aMYj11GT3h?=
 =?us-ascii?Q?wuavSkWZUH0v/lLwJWai8oiDGUCeD69bjnK4y5ytybsPpAz91WL56neErvV0?=
 =?us-ascii?Q?NxgQV5jXSuQkuZdxgr7HwvJKqVg457H+Pl9+3NE4L4JGY93rxJ2ldOxJDgkV?=
 =?us-ascii?Q?NpRNseiYN2Ou9zf5ycuhKR0UEGif1KsD6q4KDSY3puljf1M/kALmAIWbhl/b?=
 =?us-ascii?Q?GfuOtucrAqvU4LYf49QQ706pOAzUsIc5l3zqkb80xLF7XmhHsV9OMkRLIszG?=
 =?us-ascii?Q?BqmScQgHvDwqyU65dELyym5ymKftoqYjw2Uu0LaHzQu1LlM0uYyoMMSWT1o5?=
 =?us-ascii?Q?ixdEJ5quQU6QUt8aV8BJ5jcBNBh3d18crUOR4ZNWhlus7QLZoYL/3Osp/9Vr?=
 =?us-ascii?Q?2ofse1eDnDZdDQTC8GXVIaLfZL7i/AqPtZYKZDYeEXGgOPxjzHtXCPMG35F/?=
 =?us-ascii?Q?G+wg9rPfVpEITqbmJERrWvsZNeJJyUIM6PhdWIYsgfFk+LbNceTSnL5IBWRc?=
 =?us-ascii?Q?hKnO+l4GjK02AaTq666NFia+3q9sIgX5Vpey+Gbo0z6FrZPPmXEYe3ND3Mkg?=
 =?us-ascii?Q?Qm6TBIHHxeGX4CZZY9amicCCumVrOMrSq5f/r9NsaCY5sHH7J9hyaxtUElvv?=
 =?us-ascii?Q?TQcItXcoEqTDHx5Ote/5f8cGqW7oHOKED8zWiY2twyM3UQQc3B+1YvgtBMgm?=
 =?us-ascii?Q?z0AyQvfpitt0CZXTzFc14X8JUEnmLmDxDZY+XgcYWFFeVpIxAZ7/c1vu3XAH?=
 =?us-ascii?Q?lqkZLDEhvC+cCaXS5MQ7nGByUXarNrA0ZyXtZnq2GDy8fLfja06E0hpIMDtD?=
 =?us-ascii?Q?pJ1M3a2sHhIKulr+zQ2tWQGIuBd+CJGcU/gm/lCk+x8p8U7aRBl/vcCa23uA?=
 =?us-ascii?Q?TfImnFa8hgpiLmeUanRnV7OYjrYRrW/cUiT65qXGGsHLLhuh/vQTNlJg+MIz?=
 =?us-ascii?Q?bp3PEPgikGB9exfhwd8doZ/TKyKvXeTR6O2Q+4RIPqs8BINmpFoRBcuZ16p+?=
 =?us-ascii?Q?pWgeO49+Nb0pmwyuCobygjOfI+TsQreS6ujlGCCci+XI8nZm0Dyp67IM6KAq?=
 =?us-ascii?Q?cV7LevhPaKE0Tdm+KHnElO8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Yh4vTl3em1GR04kIw1Mi8/N7YgfpNhyNRuJIlgV1EHpYlwJv5hYqy8/u0dKq?=
 =?us-ascii?Q?Sbn32RewA6FU22rqfIWMft9bN0iLQM1UbncCUaXH47BnKL8khDq+TLpsBuUX?=
 =?us-ascii?Q?9+0S6waAgBjCb/AU6vLHhozEJkn071qQ1gUKAM1s0bZjX9MKzGhbehogLuy0?=
 =?us-ascii?Q?dRdcUksdJNGuyR5c3vst6V78UuOQ2GDuVtn94CEiS2ZSOgmMsoQ3ueDnwvAL?=
 =?us-ascii?Q?sM86wSAWOgSTRcJQiD/ogj9D2c+wR9ZLXhFRcpPJUWcmzXVB5lT0Lq4x/+Xd?=
 =?us-ascii?Q?C/gCd297OZjqCTzE19k0x7D4ms7lclFK+4FUTiseNoMFycWqXASwWA8RtVA5?=
 =?us-ascii?Q?WXWS0hG6eqjRNGisBVuBAW3cZQdj2eelnyAMoeaJ7nq/POZe5lL7p9YC6NzA?=
 =?us-ascii?Q?XTfE5NoUDPGaUy6g6QJe6QyQkXQwOL4kpGLWuYkDaDp96xnctnnHli37PkPb?=
 =?us-ascii?Q?48ZkFS2ZLeiD7pe+arsb0ul5nU5y7XU5YF/5QcxdnJJCdxPJEXuRStCzWwDH?=
 =?us-ascii?Q?b50sR+Gxt5e0v+GCJC6l/kKDV4304Smtzu/dICTwGR5fADIvMyw1FK+/rKPX?=
 =?us-ascii?Q?V3Dly9Bpv3j1wd9NR6tB3Lo2wXssHdoaw+0MZndzn0PQAxhcmWfUw/d++ZmY?=
 =?us-ascii?Q?sVYwFEARho2lpRoT2LQUU5ttfrW4GaN49v8r4D6F+hTvTIBBmTtFOF9UV6Ye?=
 =?us-ascii?Q?l9tj1tgrwLsCjTD3y2+ZHpQwcDqYUq56xHVwBIzuEpnC7Kk9sM7wR5Tttqkf?=
 =?us-ascii?Q?R+niAQqt+mgq2QbtY0usrOCUPFSdZa60c4n9GpNGRtG8DqxY8xcIfI/ymTf4?=
 =?us-ascii?Q?4vv/MywbvPPM+Q4XSSLNh4w7gvaW/gpcbtXXR1moyY8qs4tA6+FFFlmAiKW7?=
 =?us-ascii?Q?AWEYVUistXfdO9XG5JtmyyyTdMvcYLUKO1Dum70NIpl0Ojg3+JYyauXzpjGx?=
 =?us-ascii?Q?eAvN+leD4JqaKDljRL4Tk4w65SaSgrQAQfzFdKPiJgh0PtOchJP9YljXH8qA?=
 =?us-ascii?Q?pPnz1pKuKBzLvOZXw0yOFKN4rpeHeeKxKOjlpxEnBjHLnYTUlbmAc2Ag2nFt?=
 =?us-ascii?Q?PQ1UKkdHoFHx1I8EjzOBtpZxWl3XSD0xanYnXLKTKmRNaL7jgbnp00uGpw4a?=
 =?us-ascii?Q?mgRe829noAiHqRQcq11FGfOMcoJVb4GYaTwPI2hEp0a85ds4ST/F04SXhoSk?=
 =?us-ascii?Q?ck60QUWOaJ40Iby+kVnoNbNo5YUz9dQhZR8rycobPNu52ntVlFSYShmH5Ioo?=
 =?us-ascii?Q?RUzjL7AEkwnmC6RtzksE6iVkbB2RMxeU6VaXvVU583VTvmkhEw3MeWC1wWBR?=
 =?us-ascii?Q?mz0XX8YN85jRizMTDIRsGROj/QLwlAtlOoq/gMKIe6Dvs5LfYa/AQXHzfQqJ?=
 =?us-ascii?Q?VZW00zAlVrDT0Vmtx9dF4lEFpm8rvG9Ua890VA1oILACKWlnPyxZ42p4DReA?=
 =?us-ascii?Q?JR7TfiA6xzAo5cOhwtNBL8OzjUJYInUryYYEaCyn2FDxNZZfOvAs/yDwe71i?=
 =?us-ascii?Q?JMZhPE52TyXFnGnJKFMffaFeiGV6W4k1CnWWGckP5PM+4+3+K6qrfIUTLZMD?=
 =?us-ascii?Q?h21gBzo6fbMWidRi5+CPxYznplnmSOAD8OJv71HA/vJJkpcjpl7mwuknDy7w?=
 =?us-ascii?Q?757Xs4iC5f+z9YmFsOf7GMQmTu0m7FRsy8J4bUtiBM1hXAMPyBaT8EpWwsYc?=
 =?us-ascii?Q?nl7gd8LNsDjJE0mO6tQy/7kpToYk9nY8Od3Ou5NQOEDVTWSw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8341334-a406-48b4-4da9-08de59c6a66a
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:58:06.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxvD/20s3A1nHxOfddxqVOmtNNm3rCoBOvAIx4YSEPAJiEV0neDqYp54LqnsneGEWIO5zmB7pNi3maBFqlFFeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11702
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51360-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E7B9F6905B
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 03:18:18PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>

Subject: media: nxp: imx8-isi: Add maximum downscaling check to fix out-of-bounds issue

> The maximum downscaling factor supported by ISI can be up to 16. Add
> minimum value constraint before applying the setting to hardware.
> Otherwise, the process will not respond even when Ctrl+C is executed.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 11 +++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  |  6 +++---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  6 ++----
>  3 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..cf87f1da6b83d398e4433c4c62395e2fdb7c8d3a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -59,6 +59,17 @@ struct v4l2_m2m_dev;
>  #define MXC_ISI_M2M			"mxc-isi-m2m"
>  #define MXC_MAX_PLANES			3
>
> +/*
> + * ISI scaling engine works in two parts: it performs pre-decimation of
> + * the image followed by bilinear filtering to achieve the desired
> + * downscaling factor.

Nit: need space line between two paragraph.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> + * The decimation filter provides a maximum downscaling factor of 8, and
> + * the subsequent bilinear filter provides a maximum downscaling factor
> + * of 2. Combined, the maximum scaling factor can be up to 16.
> + */
> +#define CLAMP_DOWNSCALE_16(val, max_val) \
> +	clamp((val), max(1U, (max_val) >> 4), (max_val))
> +
>  struct mxc_isi_dev;
>  struct mxc_isi_m2m_ctx;
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index f425ac7868547da401e86ce5a9b70a9890e72541..8860d89713667d06abc94e6024526fabac46feb7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -509,9 +509,9 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
>  			  const enum mxc_isi_video_type type)
>  {
>  	if (type == MXC_ISI_VIDEO_M2M_CAP) {
> -		/* Downscaling only  */
> -		pix->width = min(pix->width, ctx->queues.out.format.width);
> -		pix->height = min(pix->height, ctx->queues.out.format.height);
> +		/* Downscaling one-sixteenth only  */
> +		pix->width = CLAMP_DOWNSCALE_16(pix->width, ctx->queues.out.format.width);
> +		pix->height = CLAMP_DOWNSCALE_16(pix->height, ctx->queues.out.format.height);
>  	}
>
>  	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..c3ffc8a38d1269c0a4e6493b4d75690f01cc87bb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -647,10 +647,8 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
>
>  		sel->r.left = 0;
>  		sel->r.top = 0;
> -		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
> -				     format->width);
> -		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
> -				      format->height);
> +		sel->r.width = CLAMP_DOWNSCALE_16(sel->r.width, format->width);
> +		sel->r.height = CLAMP_DOWNSCALE_16(sel->r.height, format->height);
>
>  		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
>  						    MXC_ISI_PIPE_PAD_SINK);
>
> ---
> base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
> change-id: 20260122-isi-74f87fbb9a6f
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@nxp.com>
>

