Return-Path: <linux-media+bounces-28950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047EA74F8C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0AEE3B0EEA
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024721E1E0F;
	Fri, 28 Mar 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HdASgHos"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FD8248C;
	Fri, 28 Mar 2025 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183197; cv=fail; b=DYNIEJDdFVFlx1rNrzZQOqkfzEIuHOrtX8Wc/t7cgXletCeEmfKqzFn6oYaotkHo7u9Agb03lqaTrQ8pH21C0ag++Uqa8Gjgn96wt16qepOQl3CyKtzTBDB/NJfSBxvPtt0IcUeSAi7m/iMlOF0V4Df6eZJ93gRno3rYEnVmAZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183197; c=relaxed/simple;
	bh=BejLPEl5rWU73gfBi7d7xG98Zvdrnk5y09LYgN0SnXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hdX83AJ9P8oS6kMjB1M//UMpR/DbGObmmBz6GzclroEPMZbQ9J2c6mvFQGn3BSwjIuGY/pyT8i6kHlZ+1LIW49bYW/YCebjQZvxTTN67ujbGoLCRxi3CgmlXZKDiAq7JoJmK1g257Sfw246mvqsRPCh4Czml+0gPPyUS/InHT9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HdASgHos; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4Be5E+QGYRLXiIa9n1bvq7X5P8uR+JKheWY43HiaTPtkBgqWpcjigG7QskBwRGxHR0mTzYCaT4Q/13qgN0nCTEJgOgveN9jMpmuYaA81afEw8RvL84eN7AuOtHZ/cx82fq3Chia3vpUZwSlqT9tQcXAfL1NOCzBAfmwu++z2PTqhG2AsbTJ9FVxDdxz2xmT8QWhZMyqhoebe1/A/bY52emjw4VXJxB5/QShtM3t6eIeXRdQNV+KQoDiY6ELhSbyFxT8gq+XImcKI3ynYeXtja/JDswx7s6UCG1CKDXup0eHcVSWH5GFO6uNKjDh9vZMCg/nd8P5rXq3gKjZE8H2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNb/KsPy9pTJcv6D76EKF7LPY7Mbj1mWJqvKwliBegM=;
 b=QW+Y6NhyDJ9hrGlu9Vkn+W8UBIyKhJJApp2jyGSjF2UwOB2WTlN3nUv7x342vg4LETD+fd53ffwap4E1lofPYGMg2TfQccSF+HzzypAHixHpeMJs522EHOqDbS2X+kaGFKcnbOmYkBaJLTzYJi54xNJHzZ26Ye0FdrzvAdbusSBxMRyYaprPpGD2FINIs7ftR4tsTuejnwyz6BxXar2VokeqG4TIPhBfHVOvu7PXMTlMXW0JOFUkW5LL9+C+xn9uucMFaU0cvnY3tt462YThrnMRubw5JYKjsqhGmIBuUK5PD0IyljosxMhKx/pJefiRyJL1R0AHd3r2Kx/KsLB92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNb/KsPy9pTJcv6D76EKF7LPY7Mbj1mWJqvKwliBegM=;
 b=HdASgHos2xWjOpw1h0FHr351MDU14+ZDo0FgltbBhKJnksTfgF2YYwFVH+GGAcpt2chOEg9g/PkgB92iLVgW0OKg895jlejSqqeZjGDjv29/ulpyDlnBjR8cXD4Cyl26VKA/+98speOttMAcxvYeIZPezj2vUXYmjS9S2AymmNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:33:12 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:33:12 +0000
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/17] media: rzg2l-cru: Add function pointer to check if FIFO is empty
Date: Fri, 28 Mar 2025 18:29:51 +0100
Message-ID: <20250328173032.423322-16-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df378ef-d9b0-48df-577d-08dd6e1e9d23
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TqbCI3glMW7DGvEkj6J17RJocilGn6ROuMafMC0KmgRyBWf5e+Tw8nsFzTge?=
 =?us-ascii?Q?waB9mHTY36m8mDdUD97Fbp5mGZY7SKbnJq3cc8ht7IRJUPNE2QU9u6ywxR9D?=
 =?us-ascii?Q?9emLrdOPMx5DANiD/e2aexEEv/TP9DuiGvXWOKmGQqv5oubS+ZCfY2T9N0OK?=
 =?us-ascii?Q?bX8nQoQ7dUfEkoLDKhl49M0hGDpD+2ZAXJaocoWt62fVqXt9ZROFqis/HmNL?=
 =?us-ascii?Q?rPw0dXfKnOTRdmZEwAUk1rW10RzgfEPlWDPvqv6TGCDFMPCBZXvVHG7DlppS?=
 =?us-ascii?Q?c1zu9voygf8lMrvsJV1Ler7giGVj5ebIQraDZph8dIwswoOLeUVaM8ICP5m6?=
 =?us-ascii?Q?U6jrsMRxtzJEn+Cn93FGtoi2PeVLJ6JO+0rdmYrPDLlx5ffsbSGC2fIo+VdT?=
 =?us-ascii?Q?9fYrpOesUz9S7fq8ZKftqz4c849rffL4Qlr+uzXbjis6NXgsWlBkJBC8Q7CH?=
 =?us-ascii?Q?0bI5cFJh4uXY98fhpL539M/Lz6Km5Rr43BWFuq/YLRpTyZb7//GmR6mGXXqp?=
 =?us-ascii?Q?waUz30G0Ynxuw97VM2UsYWukc0MjhHCLLdiEnph7QdsYLGvpxyMOsJWvBBh0?=
 =?us-ascii?Q?75dQzBEsTix/6vHs4GxhMpJosy6KAyROIv5vKitjAj0RkK5OAGjv/vtu+NfI?=
 =?us-ascii?Q?ORNQH87+lHs78hBY9g8azDK760qiLKG0okZ1w3/iLeVHiTKnAFGzBMzGS5lU?=
 =?us-ascii?Q?17TXecX7yxtBrYblI6NiuSsFfrTW1MgS4zTCa5Z6YrC40moRgOPoQHsL7R7j?=
 =?us-ascii?Q?3ZP/Gtl8fJAQZIr8CDM+XGKp7WcI+fsaNCLVYkunvMEq0NG7je9uYXVd3vnV?=
 =?us-ascii?Q?7gtcVcdeRQNcYvp9qQcC+f6B/XaWaB+p94MJ4Z7qEFn588OBQGMZeaexwehF?=
 =?us-ascii?Q?x6vkpxHqUPUtjwHsm9daTmBD0ZuzwX5Gx/abD+hrvPETQCAdCbCvDSKU4SKO?=
 =?us-ascii?Q?1x3+TgOwxLMvtBOsLU9Dq0d9XdvXaCkgXH/LtmoceJBLpB8FkF0vWGRkuYQb?=
 =?us-ascii?Q?YdcVXUO2U/mSvkIsIxX+nLzwJWwC8bSk6ldt9wOuLNqQQ93UXDtcRhLKk6j/?=
 =?us-ascii?Q?an2bQXA53ofGKCuXyLem3oFrEqBDYTrzUdF8Qg+ncMHQMzlEHf/MpkaVCmUC?=
 =?us-ascii?Q?aIp84b8uqR+jGTkC1pKUJ0g2TFjJuDdQACeM9longSfJP94whSmox/TtAC1P?=
 =?us-ascii?Q?I/dW9riGmNlA2DWsrxTpTBEZoMYuqZP9u6TjyT++xMVo/sXIb387VbfnwFAt?=
 =?us-ascii?Q?C5P8ZUXBKXVXw+HyR8yAu8jsj1LVuSTOhYRamz9qPn6XSOFM3QuBlh+znu7A?=
 =?us-ascii?Q?Nf5NnOJ3NPk5gQhFIGA8+UXUu8lPmV0heHYaYra7TRz6/hH+oiK6V8lPRdGf?=
 =?us-ascii?Q?txeUUa8yaCDwEZimtwmDF3mGz8TQFl1GfaGH5qmAsQpL+2kAk0s5tqJ9GsI9?=
 =?us-ascii?Q?V/CXsfrKwZQzCBTfTcR47FBN1b5aJubSCuXcAWs/3drDpSHcW2G/oQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NVjKwXCOEIFw5YoZaGER70JrhbNhxmKkr5QnIe7z5qWNKkKRkgcK85kKNIhw?=
 =?us-ascii?Q?IBZ1kRWAbEuJh3wvoX6rKxy94DpmlQXQwhjiUvXLajxVd9jK502VkLqKD8jX?=
 =?us-ascii?Q?wQjWAV0ZXYEwYbQmy5w+JfGNkVBETWzJpgiowCuZOe4UqImOJHM8JPWJVZvK?=
 =?us-ascii?Q?fUF15xWbSXSNxsBWqle9NaA341RfKy5D2BmnRRSeyLBt8FB7Fx+m0yLCFQnU?=
 =?us-ascii?Q?IsuzR8lf+eiHbo3Kqp6aY46s6m/y6XBPQGZK16WDDVfqHMkrRdm8VelrR5bb?=
 =?us-ascii?Q?oJKJ/8W5BoZjpThsFj3VFbnhYy38ywkKa4utMiWR+EOlVX/ZxLTu/5SprD7q?=
 =?us-ascii?Q?/OhUhoKtx7ky8RcIetQvX8RgPR6B6/1PtW5Wa6ujX3+BJlFhx9Z4dm2W57w0?=
 =?us-ascii?Q?tCtBrNppMLWNSmGvifyx/ulgzcpiFftYZUF73L0WEBJD8llHH5aaJUTOZsvK?=
 =?us-ascii?Q?GLQYHi61YwsglhZQdOp6/m7ctWHPAnCm2Zebaa0NhArKJOEK9zf4S++RxgNc?=
 =?us-ascii?Q?2fYJupzRvF3732VNv4rFu28I9tmnycLtkk9ugP04PrNu36SJ6djeiu7yZjJb?=
 =?us-ascii?Q?YDyk5c6EN/Y3PxmLum55DqRWsGv9Wf3fNv+aWut3SLz1E99F7gdpli59HQtF?=
 =?us-ascii?Q?MkBceQnXSJLvcjVf6ObE7Kx9a8MWDAB17LFbT0N0Ndq85RjdzBvOXap/sZTD?=
 =?us-ascii?Q?Q13/ejNHbznkra09ATNeMLqBkQ5ome7Ag3lYTpwH2WGV6XFKuWIz6laKw/zS?=
 =?us-ascii?Q?hsJoHGOc56xGYQUkzey9Uw6U4RZ2B0JQGpzVGKkWx1tbmwx3QimGkDe0+Cl5?=
 =?us-ascii?Q?5PDveF91+exK5O7ZHyPfv+tCUg8XQxEvGA8JHeQtPRoF3YspZlzIxyRa55wB?=
 =?us-ascii?Q?YYRZwzxk5l1eQVcdrOZTVFm6Q4wuqPWmJlT2z+EuS7DJxQEuNRHef2rgTxW1?=
 =?us-ascii?Q?lVnCKA1k6bjtostJLULSPFjpLUawtE40tEpb1Cv0wCqQnfJlPTlE7i7zXkpu?=
 =?us-ascii?Q?fdR88xnF4gQ4J17JUya46I0x9jHJmApXruGG2EBU9E8gH54gl3umycBNpdzJ?=
 =?us-ascii?Q?goI0NkEQCFh13RhZYMc3qybdccyIz4AETPMKb6s+I9mPgjvZkSmi4uEpTfYp?=
 =?us-ascii?Q?X5BjrTHwhx5gbfjwkXpiBch1KVuHn2mxVKpNPVMjukR36DwK27dhGk2eZy4A?=
 =?us-ascii?Q?lUFHXSDoqc8d85OVCkXETEn9VoUiAy5tIADjbK0hy43MXAfuCHaESkclohYr?=
 =?us-ascii?Q?5jWfJReiPw3tSaXFYuyYSaRmWiD6tSmgTxINdAvlkROeP5V2U9cTJn3XIG1p?=
 =?us-ascii?Q?BnQ4tf5S0+iXHU5uVI3vktGkziM38e5AYXqxqvRa4EARJWTTy00o+CewUONJ?=
 =?us-ascii?Q?KA0EAO6+vu4jjCy0spQu5CTLZI3D9GJGavRNtgqh4rE50VNFMiHPGCzfdUF4?=
 =?us-ascii?Q?wkd80ROvRQ0Y775iWDdhFretcbLorosJ3cbQ5pPbSNDwpSJVHUNDUypctVAO?=
 =?us-ascii?Q?zT/FBFxW0EEr9NwB8anh18EecECy/K1mFU4L/D9KH9TXoJnu7dL6D0Ln/Cpi?=
 =?us-ascii?Q?vXw52MjsJL7pxTpg5oNHAXOeKJmMFN6bdHDZx6PSCmMhZ+fyCc0FMpfd9t4o?=
 =?us-ascii?Q?4APQf1ZBkd6p0YR+3UD6ar0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df378ef-d9b0-48df-577d-08dd6e1e9d23
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:33:12.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+4/M0fY6vIj7aN6K3Cf8rQsg24uhpXqBJ/DIL0PNWvXaMFQKthpaMeuYCFJg30y0alReEQNLTFDxtLH+CC/8MxECNjrrVwcI3cwX2GZhgT/V+DpdHIVDuquIHKciyRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `fifo_empty` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, checking if
the FIFO is empty requires a different register configuration.

Implement `rzg2l_fifo_empty()` and update the code to use it from the
function pointer.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed return of rzg2l_fifo_empty() as suggested by LPinchart
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  1 +
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 +++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 +++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 302f792cb4159..e4fb3e12d6bfc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -362,6 +362,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.irq_handler = rzg2l_cru_irq,
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
+	.fifo_empty = rzg2l_fifo_empty,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3f694044d8cd1..2e17bfef43ce6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -88,6 +88,7 @@ struct rzg2l_cru_info {
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
+	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -185,4 +186,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 3bfb30a61d9b4..31848dc463381 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -290,9 +290,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
-void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
+
+	amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
+	amnfifopntr_r_y =
+		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
+	if (amnfifopntr_w == amnfifopntr_r_y)
+		return true;
+
+	return amnfifopntr_w == amnfifopntr_r_y;
+}
+
+void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+{
 	unsigned int retries = 0;
 	unsigned long flags;
 	u32 icnms;
@@ -320,12 +334,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
-		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
-
-		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
-		amnfifopntr_r_y =
-			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-		if (amnfifopntr_w == amnfifopntr_r_y)
+		if (cru->info->fifo_empty(cru))
 			break;
 
 		usleep_range(10, 20);
-- 
2.43.0


