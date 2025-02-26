Return-Path: <linux-media+bounces-27069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B41A464A9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54BF57AAD0A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C1522DF9C;
	Wed, 26 Feb 2025 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cxagoxV9"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014A22157E;
	Wed, 26 Feb 2025 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583592; cv=fail; b=mNTF3rucmRcoZbzicE8XBzFkEHXN0vbjHgQDxx5ecRefjLrLLveLimVzzga489j9y5uTjARCrJ3TrvVA+/Y1XtMgCpKUBrmA0FSkXYT6mDQIZfvxTiv/+mmHb2JxS3lxZDiA5Z+hbtrYkRBC35CC9LG4Jxo0aJFvxiDt0D0PCs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583592; c=relaxed/simple;
	bh=s0LbwMd+yNOrDuaI69BkfWNoj6IZMmF36hfugARTaZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BwEC6qI1e2yXiPd83zBxbO7LltTXJU94gRJ4vgKTRZHSWcMGBr8cXEiDpq6kqxM16KtsokzpZpAuoU49+Uak9wCiSv/taUyW2YAgT8AqjQ7s8IwGL8OGOuvYBrF0/7kuCcOiSpgBvxsx7CtNZtqswnfK9Yif2tYFTVO1goyXWRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cxagoxV9; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hnzq6pBDSlMxZKBDtOdKqJ4m7Ww9DHSKGB5tFuD7MIYz3ezk6XKLcmisKk3/FRRpQ2aPdxWWcwjeFwrk1myv2OG5lUtQ8YbwEqQY2lJV5JHLRdlzHJBcm+eX0X18gvSU+eLrDNS+zg9sgPn/dxLFeoJCZxSP60A2yf85CL1dDuFcGLiZ+qGD1NlNlqWsGaCSoS7KISQAaf1wFsdqw6mnZscJ7zJacW7bMTMBU+22AV9J+qZBaQwLVzcFcekgZzr4EUVtfKq359EPq4T3TIvjxQOPhffqIO6tJ1E17oh+kFjkahW0nD+US6/DfHGjNlReAFzt3GoNqNKEa8ULln0W/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfJa5bXaEV/JpIyOlesXVZosJEKUGMLaFI88fiQ4fw=;
 b=rkTb58u5UxZpfgTl5Vv8tk6VT6Wc1mfI7y3O3db24FfoXcdBw0anQKN+N834AKO08jK06Xuc6xamRznZiElkCwIHMpGigacEOHXqeSouJ7jG9DPZRMIqdExS5V3gDp+rZgPg58pyO9y0uIPGdw+6ebKl8ujRiD2fxTo0LxWxhvP6QUCKh1GSy1SkrPCiOmb2N0bEMn67CRKqdYICZ8LiPzFp8QDDjI3ZCq7Ue2UZeA91T8rLSmg0s92QxiAF0f8hWRfB8y/L2Ri2FwqDNBqvc6pxwXRzyHwQbfaBgA2GxGe60yOWBgiJvbvha7wBOel0uxdaGnHzEpIbulXz/WPGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfJa5bXaEV/JpIyOlesXVZosJEKUGMLaFI88fiQ4fw=;
 b=cxagoxV98jfWT7yE6z1OztgPFCPd+OnE/s5H0QuEdM3HvQ5Pv+BGn2Jxe/mKGafIgZ3AyJrHvuhso2CEpNjNoupjGkATsHIq/eqSK6rI3JuOUDH0cS4WCdrzjPU7Jy/fcoAn2IIVJdLs8QfEjzB6cC0eKW8sniWJxmxA+N8/UOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:26:28 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:26:28 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/17] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
Date: Wed, 26 Feb 2025 16:23:34 +0100
Message-ID: <20250226152418.1132337-11-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e904416-9cd9-4b93-2b0c-08dd5679f09d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?28HxLzqac9GKwDrnXxIA3DMddAuuPiW+t+DL/bCSeQuJIh0+YKQtwjGw0hZX?=
 =?us-ascii?Q?0NzEIKw/ul7fh7UZ9Jk1/zIalP5Ih5wMrDQGgiQx7sYrrE7rRjDKE3vjQF3E?=
 =?us-ascii?Q?8VqowV9rb3Wit3IvKeGZzHPI+/GSDujxWeYZZLDY/mDNMKoBH9shGP2HL/h8?=
 =?us-ascii?Q?dO/msnhrwBBpQ7g8NCbhAjJd0FgH3MNNZjEIONXSLMXFFRIgVjjfik80WPRj?=
 =?us-ascii?Q?Bsbl4KAZhMJcFoHYXNnBz8oV5gTPLPLCgkcL0Qgcbj35LUwcFWFdaThSvPRL?=
 =?us-ascii?Q?thF0wTLdED4MIi3CVhrTs/MGAleT8Wb/Gmpa3ffeS/YRnwbpHpVo+fBK97ww?=
 =?us-ascii?Q?4Kk1hK5D0zxy3Y6vZgzLSZZAICZqvRE92QSUoFjOyV3p8gEMgjr01lk+Lwm8?=
 =?us-ascii?Q?jJNVHIwGymC4rBISlToOP17DJ+iQ1RUNIkrfhEl5W6FqzHy9sTI7mplyfkz/?=
 =?us-ascii?Q?IyMKm3fL/D/2GG4DKRqCOffomYd8rVV5rm0tEneW4zPMDaEdDS4qd+Nqw5x0?=
 =?us-ascii?Q?3YQo1AMjRTMWlw9cL4MBMjw6bLm+qFG/e4kH/3Tg7g1tu8jJzjaIuyjpLcUs?=
 =?us-ascii?Q?4mmWWubC2I1pQtBR785If0ou3pICFNN6HT0OOc0MUKdAU2x+8dsX3Lt/bEZo?=
 =?us-ascii?Q?piKGtwnGVGhM3Tmez25RhwKZYKMFqckuOXR3rFMUxz27sVGosZBd7nsI7BhJ?=
 =?us-ascii?Q?pdfdfoj4bO/slgufPYTR2koYOYLdJNO+4Kqv0QPrFi9tnSfqUeo0QKsO2v1+?=
 =?us-ascii?Q?2P2QtU0nZ5qkmqKix7IEnUIjL5QahMuQzBC9ihdNVibDBtM1tsMvGuJd8nnb?=
 =?us-ascii?Q?SECWPguMCO8E/uFUBqDurv3Kg6mDCJaognV+/h/pGsOAwuEQSHwJSL0Mxnus?=
 =?us-ascii?Q?5e5PuziwUHlA5bfeeIpnBgGXg07xAWJANYaG08p7ckSxENX96FxzcoJAQgOt?=
 =?us-ascii?Q?mjeGQsnuZKL5FohTtIAz5vkXE4vDLVagQFUrQbbc9+D3V5NoqRdm57YHQ94S?=
 =?us-ascii?Q?ar6/u1QF4svAxifq5NAIb4IbedLaTq5ZL5/56wQELoqFyAfZsDicIvDGoe5P?=
 =?us-ascii?Q?uheb71ZNkgSaJi8NdnLEVNG4+13ZwoQmcllHFwrJg2nTMdq0eye0IbzeyscI?=
 =?us-ascii?Q?RStdyJpix/V61c+KE0DGlVGAawCpH8LBNZ4iS8Qa87lnZxIBBHhhbEezv7Y2?=
 =?us-ascii?Q?UERY8C3MUrd9xuWkzgwe/MdQPhuqR92HAurBHJklHHPiPMyIDH0NiNTZcg0r?=
 =?us-ascii?Q?e32+5+4VfTXlfbkQbsw/UbrF5lU2FoVnc+JuBooK8eGJ6YF0EogR23fbFKIL?=
 =?us-ascii?Q?XdcZhRnvvO52LY6holIfsxXR2lTo68TIpx0+lw1V0Ya4DqGCUYhmXMNfXfwZ?=
 =?us-ascii?Q?RdZb3TNbvuNNDIpJPz9JNkEb4hppRuVjL8swOMhJLIN6GTIneQSS7sMFim5z?=
 =?us-ascii?Q?JF11SlmGmPjRo8bhEPLOrdM/uNqM4h3E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRt/p3u9wd1W+vWPOy9/7LGaL6erjv1Ii597oZ04Av/2TqFNjXSqPdtCXvI4?=
 =?us-ascii?Q?7achFzkziM4zETIKcX0ZezpHotmnqZ5IUKSgXDg6YXj+Gq1Tda0Y4O6Y13u4?=
 =?us-ascii?Q?p5oucIOAraCv26+Lr0o7qbpMHqp/6iZTKVPUtzP5ebbP5q+olLrkQM6j/r8n?=
 =?us-ascii?Q?kJS/0sn8sk1tMwpIrGHA/odEk4UyrzGSaOVKvg/f/OwWjOtzuREFau8pxEDn?=
 =?us-ascii?Q?yTl1AhBeWQIzDyC0BdWvCUadT53VzDpM/n0FAdHIVELzxmQa8vQ3ahrELG62?=
 =?us-ascii?Q?sFK7u+Ow+LVsvys1lvyb2Gch7bsI9WI5KQBhp4mZeHOoP6FafevABvLEakP4?=
 =?us-ascii?Q?orTTeUlJ5xKHmXpfJKn1eeutfED6207tQ1xVcOL3Rk0GoIsCJ+GuJ0GlI8kH?=
 =?us-ascii?Q?5TomhswGybd9yrR3D5+8Bm/zOAeEdSKi71KkaWCGDn459ghDRpHQJ6TT6CJ2?=
 =?us-ascii?Q?PGI2u5ZPZZd5gEyuMnC+c7LCM/GTZUvIBlNC8x0TfBFVn+j19l6dZGxiUTpp?=
 =?us-ascii?Q?iFzU5vrhFYyEqUHR+rOsZXbuyuhS3ir8/oO28OvaSeExbdS9gycvLP8Ao2nl?=
 =?us-ascii?Q?3pTtRhS149RlotbRr4kQtw/CfFYICy6s7gsly5HE5brWs71ZggO7Vqf1TGwF?=
 =?us-ascii?Q?3uhwtsO98j8M+jRmhBpTNUUpdosb+NqU2MVnurV/4sPd4QLCDRzAREGH61zk?=
 =?us-ascii?Q?5BCneL9ub8Xv/7WMlth58AYFrA/VXxB3BWZzKqrYvs9yfmDVZNbB+CdN+nkR?=
 =?us-ascii?Q?Ng/bQSjS97PyEu9Hc+rBH1PJagfEu8l5uE7OJDI5qGDlwlRix1uenxJf9pFd?=
 =?us-ascii?Q?vfEFvGMh78jX1ZMMvNV6owMJhfcmEif5Y+FPdXm2zNmDqzPv9/H3geKrmke7?=
 =?us-ascii?Q?D0IIBtdFXPE/SROjzK/mzf7y4rdCqJTxLPTe6s6ZQlJX8luzupdPsfr1VnhS?=
 =?us-ascii?Q?YUqeQWcvjZHF/98Bu5LCbGpWkoZCSSCbjtK3Po0r6JVgIR5vh/XSrJRkXnTM?=
 =?us-ascii?Q?o1ZZp1uVyCDPw2dXDxa3j3LvmZlPw+R2umfnZxcyFWQUEjYVflaQqm9MGrgq?=
 =?us-ascii?Q?vsI87VcQ3v2xdteHcbekrdkXXLmshAwfBWCT3gys6wT8CA3rsh53dR6NdRyb?=
 =?us-ascii?Q?LdUSWviTK0cYMvIc3ApAlGZ9I6u05AHfq50CCKPry83qYGibdVtbVRrwyV6u?=
 =?us-ascii?Q?nqPB1FL8IKe3TY46x56x/GMr2Jxgc5yzPWcCpdQUlARaHVxK8G7DJS+iJMX8?=
 =?us-ascii?Q?1Q1Ph+WmrCHLL6ynvPiwPVVvHWP7WA35i1yHD98HqEUCDWRFUrL3wo5czDni?=
 =?us-ascii?Q?bvOL5Wc6O+crC4FjAi/rLadVBSeCeMYMDKLP/DCTKggKaCyJlCdgCpyGYZp1?=
 =?us-ascii?Q?ugK47FMUXI/lv6PnRYhSJoIoMwtI6EaBmHU5QOKo2sZUI12UBG8nIoUG6wNs?=
 =?us-ascii?Q?9T7qFIGTaW2KHB7yKmNFz9ZJcZANFBdXvEXzljyJ6NB3KHWZ1jngoNyGLVO+?=
 =?us-ascii?Q?gSuS96u6ToLZtqpmPX3e4BEIhBkIkN6osVfc3/I4nnwno544FKjvoseIatNC?=
 =?us-ascii?Q?CmVvu//lIi/SKhFtJZu4llXEQkTA7QUsW6sH1AhVvgK3XVcMPrDvMVQrHnmE?=
 =?us-ascii?Q?5CBjSLFbkisDwvoIu2kR36I=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e904416-9cd9-4b93-2b0c-08dd5679f09d
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:26:28.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3GgfXbKeQYDtzSu3ZAhAEoORNAv4+Bkwe8nZatHD3YmTmasnCZQW5BIz6w3+guFwAQO1MkGvIwErNBf7N/nclPL6TjUzQPGXMIWfmks+i/LdcMBgScT0Es99EqFoKvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The D-PHY on the RZ/V2H(P) SoC is different from the D-PHY on the RZ/G2L
SoC. To handle this difference, function pointers for D-PHY enable/disable
have been added, and the `struct rzg2l_csi2_info` pointer is passed as OF
data.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved CRUm_SWAPCTL write of rzv2h_csi2_dphy_enable function under the error
   check as suggested by LPinchart.
 - Moved rzv2h_csi2_info after rzv2h_csi2_dphy_enable() as suggested by LPinchart
 - Collected tag.

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e4781105eadc..9243306e2aa9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -85,6 +85,15 @@
 					 CSIDPHYSKW0_UTIL_DL2_SKW_ADJ(1) | \
 					 CSIDPHYSKW0_UTIL_DL3_SKW_ADJ(1))
 
+/* DPHY registers on RZ/V2H(P) SoC */
+#define CRUm_S_TIMCTL			0x41c
+#define CRUm_S_TIMCTL_S_HSSETTLECTL(x)	((x) << 8)
+
+#define CRUm_S_DPHYCTL_MSB		0x434
+#define CRUm_S_DPHYCTL_MSB_DESKEW	BIT(1)
+
+#define CRUm_SWAPCTL			0x438
+
 #define VSRSTS_RETRIES			20
 
 #define RZG2L_CSI2_MIN_WIDTH		320
@@ -140,6 +149,30 @@ struct rzg2l_csi2_timings {
 	u32 max_hsfreq;
 };
 
+struct rzv2h_csi2_s_hssettlectl {
+	unsigned int hsfreq;
+	u16 s_hssettlectl;
+};
+
+static const struct rzv2h_csi2_s_hssettlectl rzv2h_s_hssettlectl[] = {
+	{   90,  1 }, {  130,  2 }, {  180,  3 },
+	{  220,  4 }, {  270,  5 }, {  310,  6 },
+	{  360,  7 }, {  400,  8 }, {  450,  9 },
+	{  490, 10 }, {  540, 11 }, {  580, 12 },
+	{  630, 13 }, {  670, 14 }, {  720, 15 },
+	{  760, 16 }, {  810, 17 }, {  850, 18 },
+	{  900, 19 }, {  940, 20 }, {  990, 21 },
+	{ 1030, 22 }, { 1080, 23 }, { 1120, 24 },
+	{ 1170, 25 }, { 1220, 26 }, { 1260, 27 },
+	{ 1310, 28 }, { 1350, 29 }, { 1400, 30 },
+	{ 1440, 31 }, { 1490, 32 }, { 1530, 33 },
+	{ 1580, 34 }, { 1620, 35 }, { 1670, 36 },
+	{ 1710, 37 }, { 1760, 38 }, { 1800, 39 },
+	{ 1850, 40 }, { 1890, 41 }, { 1940, 42 },
+	{ 1980, 43 }, { 2030, 44 }, { 2070, 45 },
+	{ 2100, 46 },
+};
+
 static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 	{
 		.max_hsfreq = 80,
@@ -434,6 +467,64 @@ static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 	return 0;
 }
 
+static int rzv2h_csi2_dphy_disable(struct rzg2l_csi2 *csi2)
+{
+	int ret;
+
+	/* Reset the CRU (D-PHY) */
+	ret = reset_control_assert(csi2->cmn_rstb);
+	if (ret)
+		return ret;
+
+	csi2->dphy_enabled = false;
+
+	return 0;
+}
+
+static int rzv2h_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
+{
+	unsigned int i;
+	u16 hssettle;
+	int mbps;
+
+	mbps = rzg2l_csi2_calc_mbps(csi2);
+	if (mbps < 0)
+		return mbps;
+
+	csi2->hsfreq = mbps;
+
+	for (i = 0; i < ARRAY_SIZE(rzv2h_s_hssettlectl); i++) {
+		if (csi2->hsfreq <= rzv2h_s_hssettlectl[i].hsfreq)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(rzv2h_s_hssettlectl))
+		return -EINVAL;
+
+	rzg2l_csi2_write(csi2, CRUm_SWAPCTL, 0);
+
+	hssettle = rzv2h_s_hssettlectl[i].s_hssettlectl;
+	rzg2l_csi2_write(csi2, CRUm_S_TIMCTL,
+			 CRUm_S_TIMCTL_S_HSSETTLECTL(hssettle));
+
+	if (csi2->hsfreq > 1500)
+		rzg2l_csi2_set(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+	else
+		rzg2l_csi2_clr(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+
+	csi2->dphy_enabled = true;
+
+	return 0;
+}
+
+static const struct rzg2l_csi2_info rzv2h_csi2_info = {
+	.dphy_enable = rzv2h_csi2_dphy_enable,
+	.dphy_disable = rzv2h_csi2_dphy_disable,
+	.has_system_clk = false,
+};
+
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
@@ -910,6 +1001,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
+	{
+		.compatible = "renesas,r9a09g057-csi2",
+		.data = &rzv2h_csi2_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-csi2",
 		.data = &rzg2l_csi2_info,
-- 
2.43.0


