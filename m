Return-Path: <linux-media+bounces-29883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E7A83C68
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FBE9E1FF1
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A79F20C481;
	Thu, 10 Apr 2025 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CfKS8+lo"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0920B810;
	Thu, 10 Apr 2025 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272853; cv=fail; b=hXvjyt5/29IrHymA5Cty44gYLlz93eUg6bRKisUyTaVMLWtgJbgpDfxXXQ9EGlpGRZNKayBmIGXIlCKtXrA1u1Kc7RgES3ZhMPBQNJCtPjA4JSX3j7pnIPs58qU8KuumNWDshLFfV8I1p4XUnPLFxS3cSlAVpFGkKHXUs46oWlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272853; c=relaxed/simple;
	bh=5lU1IvTR+ixEA6Izj8BDp2/LBTXT2y5oWx7TE4PSwZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=htWFpk2vZwWCUXnaVMq8vYxnxfJCpOW/cT9XBhgNLg/E57NutaUo9weeW/DfNQuIvU96MncCKjl0vS+Zrc5l+ojOzwwhB7fPsenHo2+Bf6DwbIElklHPl4JH2cf9pw7ln+nVuFkB1YCT4svQ2bohPY8GzJNxuLaeNupovjUtYxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CfKS8+lo; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvndJCr35+SPszFRi8X2ooJAJFsmhcreXP2V8YBgrnLTEi71f2H66qC6Mbnk40Iz9yZVgY0WZ0ItAlqjUxeI+GU5uT4yReu258AwsiEgE2QLo8bmp7CaQ9rZJd7wYzjFbe6cHhFpyhUgk3HarKaZpyl8Lo8QmpO4g/NlFXMMMIhNu2DKw8gld/V57af+lyPS9NNqt/DHASaPIOI71Ro8tOMEw1AzQCKXUFhFgsqG/O9QxE6Uu1TsgjuhcVfYYHrPPVDqmGq0UkE/ZfTUP+Iu9Y/DOVOoqI/gtxsv8XEq4YPJRnk6nMRAi/dHk1UTQFlOz0Vovubekh2OASs+VOjN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ7qeoVJqzp6w/iMh3vKTUOEltiFLLKEaA7xGug46xw=;
 b=js60xwU2Ns6JJ/VJJzzpT8khzamW9oZEiR6GRrx4XF2Qr3wBppVIwrUg3NQzaOGrYKPnQmYZN+e0rzxtt5yn/kxzbvi541ZdjhhEeaKwvz8IX1F+NHA9uzjOXiYfs1/4OOsoLQbB5n4rq70PtDwPrN7X6W7gE3pmvpuYufJvnX+AfzJSKaC81fWsTaiIOZgAalgmUnabRIAwWcDEXWQOuUxQ320j8JRShxMAYn7m0VNaQpB2+v438EdB6fnyKvE3ix3kwy4kPZQdZYE4dUg5M2P8S1AaLKxx8lVMAKxM5kpW7kjrohC5SezRMmGc1EUbyzxeTIueP/7u0d5gqDPd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ7qeoVJqzp6w/iMh3vKTUOEltiFLLKEaA7xGug46xw=;
 b=CfKS8+lovq5GojnOgDmGNeP6LwXP+1/ePR3PfMXJ5aw9ggGg3AVJVIZ+JRN9L9hdUh7LRowZtfqd3VwWTOb+kA+zaxcv26h6jTOSabQ6/NMYPOGIoGS/sd4hIi4aKTWJpm9fWSY7XK5uUcAR5Pv7JbwdEStX52Uc47jA61HfFss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10119.jpnprd01.prod.outlook.com (2603:1096:400:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 08:14:05 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:05 +0000
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
Subject: [PATCH v6 05/17] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Date: Thu, 10 Apr 2025 10:12:09 +0200
Message-ID: <20250410081300.3133959-6-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbe64d0-ce7f-4f00-4c29-08dd7807a8d7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mar1dHaBs6+80C2Sn4syglSJIoWBLgHxRlKW4XJGN9r6Xw/j3/ADmOruoYSt?=
 =?us-ascii?Q?sL4J/lIYWXlGMqfqG4MPdGj3NMWFPiuSCt7tj9eu0bFB38ZbiiZ7/1+jS1S+?=
 =?us-ascii?Q?OHjSdfr9QSOvYE3bbLQnEpLm9x92oUzMbaFxyuHXO3pU+mzhJCJPnzMWAjrt?=
 =?us-ascii?Q?ySF3UMbiIBYfpo3fUC1y6PhrTcbsgXI/InYqQNhCJQi9qBK8xKugx4W+h4UV?=
 =?us-ascii?Q?tpVWYT81EkRKcpvVoQSeJxFljBeihT7NABiytI3sRnN77yWee46iL65Oeejf?=
 =?us-ascii?Q?m5Cb5E4Bd6n7Hs29/oDacdf92B0T0sMa5ZGrSEGmhPqglpldmitweBe4nhzc?=
 =?us-ascii?Q?wOR9szDK8Di1FEMoJh9FZQLfYztWdBKkWFRSd/gcAYikHe0Q9aYiu9DLr+4Z?=
 =?us-ascii?Q?gUu+tSqeR5HukpgNIN1xUxdl9bJ3rwVtTrxZm241OVQUUGNfoBP+kYfsSizy?=
 =?us-ascii?Q?k3aK5s/mJUpFQxSqVoy2LkLV+/iNuvwLEsLH422L3bmsjrcQxqgg1cIGCAUT?=
 =?us-ascii?Q?0XSZkpnwS+BnMvWd4shL5iO8PWyL9CF05Q/0llS6ULTKAxCZZNJ+MBfVFM2f?=
 =?us-ascii?Q?BUeJyWa6W/yahcqB9fDQk6Z8s4EC6KMdICtpbZZUEjHc8aq6a+AxT6uZeNPz?=
 =?us-ascii?Q?XEMYYUcOlbami1mr2H7UfA1B0xPHj6TAoq7OMTjfBQrj+gw3hB9nlidccK4S?=
 =?us-ascii?Q?Nkapo5ldCUOOzpL1klvyn17s/c1diQL3XUvix9kL+snAF9Nt9jhH7GdfJikE?=
 =?us-ascii?Q?CpYDX2FGAEK7AyNAJATPnzv0GCcUJ8NtNBjnk/PifZTGs5SmZ5nCugT6stSV?=
 =?us-ascii?Q?Iq5vwQfx8Tq2ndreg+VGfrrxVbl+WrDMg7/9qgX/L68mN21KK+KHrrEeSz3l?=
 =?us-ascii?Q?Z56g9LPyL8oSD7jfh3X/0ENk5m2y39YTm8QcPjCFKbxjiipJI5aTAiNLTpFZ?=
 =?us-ascii?Q?SiMDxOjqcLe9We3ixkikk+i2Xo8W/ZfCIXdhF5YLTVrfixSaWw3Mkid//0zm?=
 =?us-ascii?Q?4Nj3XANa06CrtxVPQCF1DDjt2D06zBqprhgDm4ONjz1piCicpqyrD+Nau2Jp?=
 =?us-ascii?Q?zQHHhg0O/vG+kWLRZkW+Tmw91Rhzx98mXVj6IeiGCuiKluFXjVeZt1YkIW9W?=
 =?us-ascii?Q?vK8jlyt3Tj6KHI+yY/oXp+/zkZ5lyu5ms8mEfvghcOP7PlI6TrSeqKIfxK9N?=
 =?us-ascii?Q?xtrLYKZ/KsUgE5Oz+VdC5l7Bmj1VuS7dfgfxnIw+Mk76WK/TYlRmQfC8ScCN?=
 =?us-ascii?Q?22EVkyMv7vx8UAB6oXz/DgIoUGWoCdYbVOD4mMKx5qik7H9H9m8RGmPdEHdt?=
 =?us-ascii?Q?ECW/InImA05vvxob0KclNyi96RDsiJ4cYzRcsdCMgoRdZscP4TDxdHYXw+A2?=
 =?us-ascii?Q?EpsvJbJKr3y12QR2zT9ujwA5LIz5gQJWbCTCJxaEYWrlcTxYVAGWGproEFQa?=
 =?us-ascii?Q?B/A/uZ8EsJXqIBcZAZB7dHIYr52naO29+qDVpPm6A+EX9LjFWPO4mg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWDH2zMvTk48LxHBcOnFxmwP3waH384OSqRCJvixQjN/FLKWDC6y4Mz/BOUs?=
 =?us-ascii?Q?BjaM86lWwvphfacVfmV4X14SYJiGOZngbJWaD6Bc5oP+RWDOE/4MYLjwZWc0?=
 =?us-ascii?Q?XQ0Qh5EeoOrhM/PPoGOUFN7dzUu/nf1BnT2gj6UcigJnrxfEFcjolzbDOvn5?=
 =?us-ascii?Q?oV83I7X4X55VPYpklX1RGAVHQTniPMCXxe3egFtQa5kaezt68CTaBTQvOif6?=
 =?us-ascii?Q?ChBOfjD54FBgzUwFv+fiP3PDHBeChln4bV/UqcWk+9lJhrT5mI7mxpjDLOC0?=
 =?us-ascii?Q?rGqA6mC0OxMS9UVE5Y5rUreipBGP5XMezdYkm3pXmAkOt9DiTXgOUoKzJr8P?=
 =?us-ascii?Q?DJYZmJt0S9G1b/viUwWVeOFsX6HRRF+icx15oGnJIYyksL2WUVo4CaXZ2Q8v?=
 =?us-ascii?Q?yE6jK2abkP2jUVLqfvtKTT/bgXkfYK4Bdasmg4kL8cvS8y43f1f6atvwc3S4?=
 =?us-ascii?Q?M0WNuzXBGRq4Ba4s7yJTA6bhkFE15vpE7s09xx2vj1ZP9WYcSakSRAafnk35?=
 =?us-ascii?Q?8y9FTBQ7ajdZn/GwNjBWFLspuh6vjj9/02N5MehjJRJHUZHiLdt3o4I7DoLM?=
 =?us-ascii?Q?LhUUr1FX6LTcqFKhM73rRokxayHS37pFR5TPrcbYEW3J1GJZ9gDCOWbWexfK?=
 =?us-ascii?Q?6Dj8XNKdGPCk1SOmnsbeGSZktiIs/YAvmH1Aklb0sD9DIUaF9yq/+2A+kbI7?=
 =?us-ascii?Q?RPwFst1psjt77A+rZ5t1f6mAmQXe9r3uIrURgWpSjlR8aShlY6oVsZvVfeqb?=
 =?us-ascii?Q?xRCS3nV3Y8bNVXuNi+0rsTPKinTUhbiyjiRdXiI2TDxGjkeyRG4J4ERmIsTt?=
 =?us-ascii?Q?KttvVHwjDcpOp/QDNHQEapVUXkHA/DOdPFdO5kuBOmou4pjgu63WvDVd6JNL?=
 =?us-ascii?Q?Bx2wmnPfSKRt3VgBspEDgOJzfOrSuTUe/rywGBp0qJHlYfFub12smcZVt3L3?=
 =?us-ascii?Q?2wn8OMkEj3Oo0+4pPSnkFLcld0r8c8y631lCQyR6NCLpZRIow5fReRlHpeUS?=
 =?us-ascii?Q?FJQMQIPZKlGi09EYPtCf6KNunD1tfzQhYhYKGGNBv88UxUl20RXu0Z7PEOXs?=
 =?us-ascii?Q?K2jcToxzpDW/li3QROADTU+9WVKYkJtRF/Z9fSCwyEN8Z/cO4FiBGSDCIJ+C?=
 =?us-ascii?Q?bpZDLDRgK4pc9DVNWKqILvJku+GsJouwVaT/4AnEzbMA/xBSZY+RrHPC8phA?=
 =?us-ascii?Q?DlrjT6xuxYZl+Qeuk4yVBbx0MefW9tLfajBAnWvIF14WHpjPOcvpY4vHKXSn?=
 =?us-ascii?Q?GGo3rHPuRjXZERQj9MQrJ4aCf2zPn7a2L+b80LdTQAS5u1g+0PnbPuBNi5Ks?=
 =?us-ascii?Q?HdMeScRBH7oZhzz3srXVUmUBUbRoPPXHx/ZxjRcs4CNXdE09vdz26qEJuNPZ?=
 =?us-ascii?Q?snddogtK1WOnudXDAL33dBWm1ZMO1sxQMyu+5nHfh9Nt8smkh/MTdiuwVH0T?=
 =?us-ascii?Q?u9gW2Rqo9SdoJeEtCzQU+My13lbQrIygCuW1NgfGNutArwzsvQEY87SjyJAN?=
 =?us-ascii?Q?ocwK2UaWwDuDk6RpZgsU01l3zWNYasJlNIhZgbIN2lsm4sF1k8dvreiWPAqe?=
 =?us-ascii?Q?/jUEABRp+RclfleOWEqADkL3F9uE2/i0kioFgALL0nlqbvVQQ0NbY/vBfToq?=
 =?us-ascii?Q?B8Xj99bLFlDzyK4WWCoCyGM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbe64d0-ce7f-4f00-4c29-08dd7807a8d7
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:05.2728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ysi91PGAcIf8iTLVv1h2stp08EUHAkibrBsZj7jgbQBkJn3XLC+lc0qmcmmKB3L+V9+d2tbsae58greLbaBmb7oX7TjQAZJh3jF8X5eB5rednPT+baYTY0P0gRNLuDeX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10119

Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
drop error path accordingly. Drop also unnecessary pm_runtime_disable()
from rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 948f1917b830d..4ccf7c5ea58b0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
@@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
 				     csi2->pads);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(&csi2->subdev);
 	if (ret < 0)
@@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
-error_pm:
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2->subdev);
 	v4l2_subdev_cleanup(&csi2->subdev);
 	media_entity_cleanup(&csi2->subdev.entity);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
-- 
2.43.0


