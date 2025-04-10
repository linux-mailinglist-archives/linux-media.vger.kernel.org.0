Return-Path: <linux-media+bounces-29885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B7A83C78
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B3789E4719
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED33A20E703;
	Thu, 10 Apr 2025 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IpW09UIx"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549720E032;
	Thu, 10 Apr 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272869; cv=fail; b=DWfJ1YFK07WJSvu7xiwqYNSn5dMX+kjLP0j3kusZuQ+JvaJhFY8ZyZQNF0i7xL1Forn748r6W48TuRw0YQMEbpWGAPdLfn0h5H9GBygQG9/md5kmUSGVpGTVZf+beS7fuKyE+v7ZMIHqYlzOHcN1p8bbBcKjrf00tlcLJJQqYow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272869; c=relaxed/simple;
	bh=gk2f5O3tX4SENV+cB0k7xa34lZ1ZnngCnzzMe/PyGo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Djjcb/CozJCqGB6T0ITg3IFZh0n1z3HG7gIcRFTnlXj7hRnNCPnvVCT8u6x9jiWc1Be7ka5s6KwP/efJFgrslwW99FWCCgd2Vujr6l+mjhH3v8/NtmDnxTUkwnbXTWmElqPJACDMCVuK4BlJf6+kLoluywtjxI2IgC4qdpClvQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IpW09UIx; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnR0qgCsy/l8IsEwxiOC8Bz01Md+4gpKN2MTFuhKL7WpVO79IklwDCfOJ+3RefGS8Atg7W9h8+0JVsHomt7irHPzis7uM38BYuwb+C8TwSA3JYw+XpuE9PnLoCnTMyz7lg+XdnMCvKjy7bwlUOlhqKrpCaTfyuziyLhjKTnxuVc/mwXsKo2QRRBZsrxeMY4dWw/rcIRWZpXANA6rzLoFQVxgZjIVJJIKQIvko/bbvvgdAL0yq25cHnk1czdHPDIIK0Oz5eL7q+6LXwDDARKWJH7Ts2eN9caPvxYwxxXdJlm1VVpVk/2JDfXlzT2mG/XBtNog413UbxiHxNVXbb/N1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O80LhtIrIy/abMehTBvd3FaXj5QPLwAUb4l2HqwPAFM=;
 b=KZ6m7BgZULiTDe2G3cKJwigW6bUp9875E7RfN9CImVtxbrGl7GRPY+aQQLqoqOhv/TBM+aHALJR2cpWLKXfop4z6YFUbyETjyIeQxuzAIcb+QrDNNasbZTLJaV9SRyIRPGVL66oT/tX8rXsqP64GddCfxcQEN+JW9avAyv6qewbc9RHdDVLBukgUilFPeYpS1OfqYz5lznJDlwc7ZrFGYEWmlVMQjbwYfK2e4qbzBMv/W0Xa8l8MF088USRubOYkGhfZn/L6b2yjC9MKPU3YRHRCmfbSOzW65v83ohhpBLQbSrstXCYmnD9nOeBW+oWTYs5YLzBwQXS+lXT4ae33pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O80LhtIrIy/abMehTBvd3FaXj5QPLwAUb4l2HqwPAFM=;
 b=IpW09UIxLQtBCVezroTHpMBrBf2qMUAt0GFeiKaW0V7KX8Jp639P5e7URjG6SE83DbT46qjAFKQyK8phtQtJ/SaNh7Y2rAJmT9WXX2mr/1hg5yYKNQcg9zEROWVKzPx8lBeG3e1NJVkrsMXb0VCWfvmL/MZY9F5xGAFjP6Sni7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:14:21 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: [PATCH v6 07/17] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Thu, 10 Apr 2025 10:12:11 +0200
Message-ID: <20250410081300.3133959-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 610146dd-6f63-4af6-95a5-08dd7807b252
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HJqprEwv68gHmB+3AXFkoL6wPEMgWsB6BJBXdeT2WMuprFrFKOeYbGCsmv+9?=
 =?us-ascii?Q?5HgAZ4bY5xbxiVimZWhat76jFjPgqvMIO0zxzcBWhR1Srxzazj6kXPDwWKyA?=
 =?us-ascii?Q?9frUm3T21YnMH3nCSdqjTkHsjMRuYXbUU+wSOYLk+N3QBC6zjYXriptm0zG2?=
 =?us-ascii?Q?QCqIbeo0KNMVlshAi3eTw+FjYJpmPU30Y7Hf1oDxJhmfeK5dKq1h5kv8pRw4?=
 =?us-ascii?Q?JJoLAveZfZ5b8cr1mQ2I+4TLxocYFGfGz/AR4h8PEcdxjFwmUTVao/GBKYUU?=
 =?us-ascii?Q?XdxRw112CMFOI3lwJCcsKLFvTokMEaEbpFpiJd69KXLxyKNtk3RDDy2MrDSj?=
 =?us-ascii?Q?QLpgCkiuVMq0TiGX7LHQhFcMf3sjkOpehlPKJCwJ+2rdq4ohQKfw7CCfLn3f?=
 =?us-ascii?Q?TXaR589c3CwZk2btbRrdGU0l17uMsOQ0PfUjiKGi8eYce8j3Q3XIzmrFNB0A?=
 =?us-ascii?Q?WDATqMiHAjBvFpamJRbNSZBZ5IThvqzErCEykFjW9PjA/FkTTeo23SatGhzo?=
 =?us-ascii?Q?P6MOeHwa2vvI8WHE4BjPZ76rx0tmNHU4zd04Laz+cBTdNgIAmdW0fJdbEZ1j?=
 =?us-ascii?Q?8/BsAV9Q9TYRnmWfWcJVbKNuDhujTD7czErikbANqzyiycIcaEwGRgo7VmBL?=
 =?us-ascii?Q?wk7fwGF6Cf0geSJau+74uXKaVcuM68t0bdmIDJpoWqY51Y7UoOyFAhogjfIS?=
 =?us-ascii?Q?SCSFRPEsmJot6QFCdQZDaLPhT/KXfmypXUEYk6eYZXE34h737FirUppcjwen?=
 =?us-ascii?Q?4++643M4cfNVkDNLj5hAZZ5hkM3Cobp72DfwyZlMkA+v2Wq32ljJNQbclOmh?=
 =?us-ascii?Q?f6K5NpT7r3qXcwheJwBIKst7OQLu30yK9XGWvq5Dqo+9hdnBfyJ3SUZEimVk?=
 =?us-ascii?Q?e01yLC4s/bk9bqKD2ViuD6OSmsnsljaiTvroPXLJ3RIivKcPjkLTkwRiCiTP?=
 =?us-ascii?Q?jQBa9jeMsZUmHUAP9HeSP8i0SInoTQ+f0TeNdS2HhYt2ezyTsgX1eRVuEYDe?=
 =?us-ascii?Q?qfhufjByaI08bdZGWgRrza7wzHwsFL3HHTzR8No7uUzW2LQWpBrKGqHKFzHu?=
 =?us-ascii?Q?c7WHzdlTRc57yHxSuhJHGfMcPjopYlkoR6Jtnox+6MbUwBbAyvk5HB7jZTD4?=
 =?us-ascii?Q?Jbhz+eS0scEt+FAMJ8dVpzJSKIzixq3AnsRfvB2nXY+kEA88JLVrq0zzevGI?=
 =?us-ascii?Q?uMNFgLsnPcguIoyNp9kEfqYJIfEVxsZyvZP5TCbsukO0X4lg6A9k+ErQpNyN?=
 =?us-ascii?Q?ARKF1uAI0+rVuoEJ71NU0NvbaFRVnNREPqIPtozGwvP1IKG3af4yYQnuE0Uy?=
 =?us-ascii?Q?tAuOiygxZxz3l1uhWA7Qlr6Q6WJGqnB0QOKiksYFt2m6fiDH+XdrHZGP3mW6?=
 =?us-ascii?Q?mFJAHcTNtaasc9tiLOtq5JlCY7tbtw1fA00UxLiQcBsx9bUXyGP2EVCazJgT?=
 =?us-ascii?Q?NE31CALzWZlMuqLLoF5yt4xnulI1PfdMEMJX7KmsUY9ZKmjxEB3jeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p1AhaDWbkP61f2wPYFWmt9sPe7fib2pcgjSQ0EnxIQhB/solPES3KV/JYOdm?=
 =?us-ascii?Q?NGnoBTlrfCpFIqbLl307LYCFQmvvLLh7wO1BUxTrmYY6AzodP2J9/dp+CWLW?=
 =?us-ascii?Q?y+Nw7QHAxJQ5nTy5OcpXEJh8Ub5tysqvLBJWvLNh6si9lTfGDDD9DVdtBAT/?=
 =?us-ascii?Q?e+qWVNH4ou9ETk/d8bnPiBkryeuwSDq6MV/r8XHBllL3nJIeIqm2fs9jKj5m?=
 =?us-ascii?Q?kbmY+UFwla7LVdW9tNPkx/nW4eW8qvb5slfvFtFjpR0S6yPXjgIdKzvDuYzg?=
 =?us-ascii?Q?RscSIKV1Ox9SgRwtGncTQ7j6b8TOHUaLXd7BhAnbga65YdVrDu0+8pOQHOWo?=
 =?us-ascii?Q?U8aZGDIz5tIa9D4Le0c2mOO/LeVarZ2vbAjnYBYIkIxgGM7kS8gbKkI2+GTt?=
 =?us-ascii?Q?CaSSl7ezoKqsHUp3xrqIvG5Vv67Zkji6YSviCVKaDh/W2Epacb28wBOxeCJS?=
 =?us-ascii?Q?nLxzbFKAOwk5ieY5NNlwGPumYXmGLhkcjchydUPDl1IN8K8cdjObCSKUyEh7?=
 =?us-ascii?Q?QuPvGjFKGz8pMzA5+dLBU8Frn2wy61uw+psl9wxFoXWK0ffed/aRji6MTPiS?=
 =?us-ascii?Q?5k75Qy6cwx+jZqY9EzhF8eafjWi9m+8LoPMv2TeX1YNgHq84BzVfMCMSWUxI?=
 =?us-ascii?Q?p+SaZBQN3juIbWl92DVUrs7ycPLrMbcwfCLixE3DXKsbIjyzgoknKCuW+8x5?=
 =?us-ascii?Q?UhWFBxZDp5YOYm5tvLQwQstZg+lvgouGZcNjewba+7bcyPYiMUhFehecnJhM?=
 =?us-ascii?Q?rr+qiRuVwQXnMieO2Acu0LILu0o/ZemJPkEuQAgb4TSCD+Svt/gFeGzqViSD?=
 =?us-ascii?Q?Y77oRX7Gn05IqUBe5qc7WBtuDVPwpeJy4YMxI99kOo9MAT3OIk4buLteW4E5?=
 =?us-ascii?Q?rrCqWjM7hgvx8+OVuIjeX1NaA3SEqAQDDuOJ24vikGaWzTiLXOawau+zcPuM?=
 =?us-ascii?Q?8gP+B0yds8om0tJ2aTDT7YOcMdtf6J5x9/bBx85XRH6JD5xA8YyDqAmre98o?=
 =?us-ascii?Q?Bw5XvfjE9Ae6KybfObqS5eWzlIIVY5Cu8gMD8nQ6NsZaqDhTQJcX3PWYY94Y?=
 =?us-ascii?Q?3Iay1kdneYKQVqDFNozENRDEbE6p6/RQ/ytIWVMw9ButxzvqdnQ+fEu/eunv?=
 =?us-ascii?Q?6YDo5A7mN5NXS61dQk4hZMxkroeud1NzRov8PIuANh4g4jkbNvJAe1UcffSR?=
 =?us-ascii?Q?qez2xEXb+gZJu1EdDLVqMxb+twdvgnT0Ze6YkFZuYacYhokX/LYoMJ7YaP32?=
 =?us-ascii?Q?1w2xdC7gy7VxJOmKV285GLRAhy6RPB5HJcC7eKluGNBcZiJFnyB44QHtzNba?=
 =?us-ascii?Q?XdlFYEQtP0J7GlMuSC98BhkWtPYhClTYqEitWbY1RhbNkKjxuARvtVL+cgHo?=
 =?us-ascii?Q?+BbSckqY9b0RtIgzyb85J7pPxLBjjEXJZADJTmsSD/P0tWWkm9zyQl8iNdzI?=
 =?us-ascii?Q?+QenhOCMkeCiK0j4F3OLGuPVxcz2GZ637JkyuRspj39AJ9efcjPT5pFYZ59a?=
 =?us-ascii?Q?MhLySqww4bSp38omw6qx8f+a6BpL6nFsA08dxxQT7z/j10yXMMadmSV8/WlA?=
 =?us-ascii?Q?t8eO0CSzLf255YmmwxtSW57AEeUvCCw8Vectl5cRLoxM3sDMeggS8IzJcg2V?=
 =?us-ascii?Q?jeLzGanG8RA0ja4xBQ32Ndg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610146dd-6f63-4af6-95a5-08dd7807b252
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:21.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdY+1MrYE2pq1njY8JnJPLmMB3LVh6fxk0tNR0bRkBvdgQI9cA3plW54o7A4leH8cr2Y8nRz52roxEAT1C2CjyYc8M0X4Ou3sNaNpIbYppwvXjjZq1nACIbTf71qQeE6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed DMA leak as suggested by LPinchart
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea0..eed9d2bd08414 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto error_dma_unregister;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.43.0


