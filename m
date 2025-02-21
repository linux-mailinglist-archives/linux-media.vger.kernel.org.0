Return-Path: <linux-media+bounces-26607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB94A3FA30
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2EA19E45E7
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58179221DA3;
	Fri, 21 Feb 2025 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rdJqsdXS"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE51367;
	Fri, 21 Feb 2025 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153475; cv=fail; b=XVk8d7WH4rUJuIxROQsNT7CXB2NCvAyVWBiLS0PI/iw4ke2ypU3tXWAtpIetuR2BPTZH6lYg1Npjcvls0l/EtUzS0k/K0qGKCg99i/c9XfgTdTDo2tBdvSSWUo/RYBD1c5W15yLpW7AVhrPkyurCXg6YQq0LlrupkaJUhbdnIxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153475; c=relaxed/simple;
	bh=7vVzaqF02CFOnOLGFRPQm8Cx+MRMFpdPG+oL+x0CL7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CIh+4OecWqBruSpHQXB2uGuEEopoqqQXaEMmLQvoYE9DEt83UWXzIPVnUGMM0LRo/2YhOQIP9dyZkAwqY02KYfKofjtN0SeDV5XZ5OvHy7RMu0SsS6n05oCOpFn0xXltE0Pt9kcl6mYipBzImtnmEjaNPy2hoIR7qXviJuqScDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rdJqsdXS; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYT84+wU/Ii0LVpo+R7AL8OzvD6ZtTrQ1pVmCuxOV9eTT4IHRKQjYbY+yylA+n09twWXRxnGsMmxnBjBayw8wKhE1JpqDAKINsZrB/eoolx5OQ95wDhh+cQgr8/WYUPJxqFzdcTHp5DMl3yT0XLTuaa0GYSvj9izFaLwX9Nl/pZtr9dQ5eimm4qGptVFbwTRhMjP+KmiQdQrv1PFh01hgKKEjlQDLhOwjqtRnKGvpJVW7qbl80qLwKOoZBLPh3NUnfG5MVxEpo+KpLYlmpQtDuz7zX1Ie939gjaH2goSK+CBqZO85VnnT3rfEKVjb0xbZwNWORro0JNx//lgCXrhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duLs9zN+ItDmJlrF/eAUjdoJV8oTAEWWh1bx9evYqtI=;
 b=JZUWZI75SFkLhB9uSk1gJOy2lNI3wg83FQTVGD0JgJn5m9SXkEOq8Xp2X6VNZTwv/VJ1k4+POLWV3plGc6fZOw7SfedYEcAKtmFgNj3bgqBUQQgudvMjZvvqGa9T/RNHxVfx2mO+Rw5TiaH90Ii9eywIR6SYc2q5q9PHTMg+rC3oXLeDrhA1Kopk4Quj50FyX7bQzlRHOqbeHwO/mtZPzIw1dN+J02mU5D4dGv0FaX9epSEyOez9hFbEuO5x5TuWG9dwGVqlj0SLVMggtzyJqzvf9OlIlRM8hOznGyFFBef8LgSoX19qSN9QCXLTiAMmj99fYBpQ1uizlfhqWGnl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duLs9zN+ItDmJlrF/eAUjdoJV8oTAEWWh1bx9evYqtI=;
 b=rdJqsdXSdqmMqq+mCXky9k6uy1yom9/nJPOC3q9NiGi+Fkab/P+/dBmnRKg/ODtgAVTFbYL8/DK/3GZHFunZw2OlgD1jc+XsWIR0wyO4WwgKgDOx43tii+gfqDUJZeo/hbxRXwNQ3j4vfg3inDykKtUiL+G+6Cuu2IMC5aayCQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:57:51 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:57:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/18] media: rzg2l-cru: Add IRQ handler to OF data
Date: Fri, 21 Feb 2025 16:55:28 +0100
Message-Id: <20250221155532.576759-15-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d614f05-c119-4b96-6e21-08dd52907ef1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LXsU+axnlxFk98yvKieYXjlVtfmOmGq96knO2pNJVmr522B7Mdqqt6DSfIiz?=
 =?us-ascii?Q?pIuvj5lVzdRPEqo4HRdeYHV256NrtT2UWALH255stZAIwtsT4SxjCJCkDC2e?=
 =?us-ascii?Q?SJU6iYSzW5uHnNQUxxQ9zR2iTOrDocFdHlSEKD14I/woySGFgL69k2qhiL+m?=
 =?us-ascii?Q?oXvV32U68ggMR1BbVZZB61p50JeUda9vFWGDLAWXe/2Go4UZ4b0rvR4DFSAh?=
 =?us-ascii?Q?vuyte7yANg2E+HQ69V1LvFSwtBghl5J2osQIhEp6z9Nec9SkEDGdSIu2lOzQ?=
 =?us-ascii?Q?TD0izddT+x2JjeV+KiMyUSl6b+bNz0ZlS5VrU2qicZOR0gIiu1YzFUdvKnBw?=
 =?us-ascii?Q?qklCvgH9cLbL0dHlzGx7Ibnn08yv4T/enzviOifQptv3xkm/vGsaA4Kg1HEO?=
 =?us-ascii?Q?aeiVD8NdNvv1qkM7lggsIZwA1ULESorMPdciASJFdLTt2+zA6VnzU6i6/5Og?=
 =?us-ascii?Q?wqJWeGmwpC4H6CyGABIVjzci1H9s5mjxk+4uOCpaOmF93sxNZbVkwQVBsX8k?=
 =?us-ascii?Q?qY+dL2jYZVUHa/eMbvgR5JY9DXLja9LBywUlu4xj9S8B6MmgbHiPgU44LpMj?=
 =?us-ascii?Q?whA//JOghUulwru92s9or/mv9oBc5ITKzXi2hde9dldw/Tpma206Ck0pdZp2?=
 =?us-ascii?Q?UMu1KS61b0kwj+MQkcmnvwDfKtmItU7J7l1c5jRgAXGD3sZ4rjKu43fu0GCq?=
 =?us-ascii?Q?/4FACK9+A4Ts4M91CmuXpnw1Q4rJ4Yv+VgNlWve5evq0sfkBCO0L8ufEXagp?=
 =?us-ascii?Q?W/2UmqvnfNJTgYqX8zMCn95uh+mkAo/Xg7ab4g0levTSNwTILfYQJEhVgsCM?=
 =?us-ascii?Q?WSw96Z9AoZ7gFCxgzEXggftK1IgJTRFgmZDi/Dp5I5D+QA6m+kDEzgYsS0aG?=
 =?us-ascii?Q?NX5EcElUZzWqtL3+s9x/+5vXLz3MmE0IPjFe3E+QfTYyZXOL8nippi+T4/7u?=
 =?us-ascii?Q?4KQdLco9y3pBoHPNDNbNs86hFmQYSeEjaibGIA0wxwctRgpY3ZvnMlqBu0dI?=
 =?us-ascii?Q?K11PXVn5XHMPeAmDDzaMdO33IG1afTUuud1kYY2Ennik2Z+RZRd+0bt2UCOT?=
 =?us-ascii?Q?4ZMz6fbviajTD+RIUbSe4tq+qeOUmp+U30XQ9AjcInfX75ESg2TFAwJhMS/b?=
 =?us-ascii?Q?tJPvgVe79CN6oCcupevrxso3MwDNUPg0HiK2slzghq92DreorxsAVrvJovJ2?=
 =?us-ascii?Q?wHxzPB+pn1Y/R8Z4i5+bsZzdBCr7E90LlbW9wpjBhnVb3BMOkAI29MnMbbWk?=
 =?us-ascii?Q?+gGCN839v9y4Y/5jmpAssvU+yhqpIg8nR40KNzA7f4j0U5aKAW7oxtNCZqPS?=
 =?us-ascii?Q?8eNRA1IvlO2DOX7y3NbgDlPrj7nUhZyv0LylbRrRd/TNo2Zk4qwzUswYu32f?=
 =?us-ascii?Q?2QMsY6CeirbRtyHDia7+ty7dzU6SA6TVgzWYh84URtCpK4MYZkUb+XfLAR0z?=
 =?us-ascii?Q?nd1nBUegO5QytqfBz57nHTwRWfarcHNq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fPU0A10Z14+r2PBbTPEIGq2kPuTqCRiySTioHoH9vR8Ru10nOb2USpdDvpO1?=
 =?us-ascii?Q?QeMvlEgY94WfG5OJep4XBk+6xJ9kOyL15imDDRsR2ftA3V6FcNWGImDXNIDb?=
 =?us-ascii?Q?nXWmyt0q6zZieDhp1FTOxcvZj69Z1/mlpLOcvpjLNKUBRLwHKleRDjIrLF9c?=
 =?us-ascii?Q?fCYQ+EoOzzXjv5XFNPY6n8dSd57QnsT5al/Eqzmtbl6DMbyIXeZi6/CZxsSj?=
 =?us-ascii?Q?yikfyZOMgcpgLPQWiimoL9sbS0bTPs/zI6UB7V0Uwj/ihLzOEUvjmK4hr/kC?=
 =?us-ascii?Q?vBejzPuHx/sxFsM11CPAQEFwtcDI1uZ45hnkbmHBmmVp9CtZyq3LS77qM/3E?=
 =?us-ascii?Q?zsqfEfLop1ltngiV830453bU5UtCRYRDFocHwnnF/WTgv1nFs/S4IX4DF43l?=
 =?us-ascii?Q?TtNbAOAZJJNtQh+ET8H3LlacoUBpYuzqZcgCtR6cytjcyaBYVmXF0nVa82iC?=
 =?us-ascii?Q?3C73GHcy6Xv7WVSPZAZPFreIOSdXIdfsfpXmF69fu6LuXqLDlC/yiqs079LU?=
 =?us-ascii?Q?0I19y/guuZjotUhCi/TbdPr8iHsvYLGVUYq7x4jcCuoc9FTAagoMkHD0SvL+?=
 =?us-ascii?Q?Hi7cl7c9JdLLzut7Un2r7//FjMkx4xCvJVklBCLtp9oJJrLhaTSgr3fHKNUf?=
 =?us-ascii?Q?/pDUBCVnX4rM+dexxdpnuwKsG+DhxLM8pKH4JRNWY7QB60zKTYMi1Lplo6nN?=
 =?us-ascii?Q?4Dk/kJ/pEekBYUCRnjm5+DPp/iWMPXCllPaoPMN5MGV8lrQUlRwzyqL6M2VZ?=
 =?us-ascii?Q?tzWUhIf3Vx0gfJaV4MWJUBgi2eb5tU6/cI6AisLEsFzfJwbSWvAGLhF+GdgC?=
 =?us-ascii?Q?77BT6eyY9OmfE4hi3JIPneptpIVdkpNrya35BGsJwpWnbIPfyYvZWYX45O3v?=
 =?us-ascii?Q?4Y2p68cKcRwXVZ0P5kxBzD/0+FwVbxwiN1erWnNPDFYkGD8jwieTPKmaDe6s?=
 =?us-ascii?Q?P4XG77Z9RjE1q9Fp+uPCZbenxKFvoOpabLuYbk+3rnHGIyJ9Rk73nYPtwUtR?=
 =?us-ascii?Q?EeHKKoNvfBlOZIxwalLs7s3FtgE34x75wQRFldhxv+ezBtePCqS4bY5hWyGk?=
 =?us-ascii?Q?JUD6Oj21U8f5xW1NSsiTrS4dGEslNrnzLbXJpRqhTTnUzKX94y6U2+uimIpv?=
 =?us-ascii?Q?IA1WbaCvY/P84UPxfH3VDqEG/FISzNFIKm2VNgZ01LzM5uBM/NwI0BsdggmA?=
 =?us-ascii?Q?DeU1JsEu6MvBs/r0zaWlDNjj2qi6M5vs9YDuEn+ze3nUDzV+aIFRYg8eJzjK?=
 =?us-ascii?Q?UPvmm8AYAbtm4uq2NwugvnsOjZkfc/C6gFiUeOkFmAWD5AB7UomoJP0sF/4h?=
 =?us-ascii?Q?KMZu4VGmC20kNLS5XqsOy8o95O7sBJ25NQgrcIKONWnTFA/JQh22aG/rGuNw?=
 =?us-ascii?Q?2VGNScoVLCWVYGMya5lHjFgfKGe0NnA3zCWXG8OBXOoeoxHefj85YV2sJ3+R?=
 =?us-ascii?Q?WYe5Qj2zc04UF/QdOxgKRnMkAfnxIxjG1BRo/tywlpez0/mvLJb1G3jgSQOc?=
 =?us-ascii?Q?AZR8/mlHJkOmt/CEaBzAjq1wed0ilm5hTwoC4mEf6om9wd0+FZZDuFqG2vkM?=
 =?us-ascii?Q?QNAWnTg10xbDQRgSZ7Pl4D0RlUaopU4BQmKA4puhzcWU41rv2kD1ws7EDmPv?=
 =?us-ascii?Q?R018bYTKLIjo6yH3B+0ucxE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d614f05-c119-4b96-6e21-08dd52907ef1
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:57:51.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtnjuJQ9wsXUMQ+LtnCJG2khv8iOgVM6m+4KYahXxeRQNRUHdULImHI/6EoPRLI0FtTjNS6YLFJi45bhkQlkVnx9M8iLVZaCiavDoG/PrNicp+MpdZU3JeCh+0MTzHtW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
require a different IRQ handler. Update the IRQ request code to use the
handler from the OF data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 3 ++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7e94ae803967..510e55496e8e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -278,7 +278,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, cru->info->irq_handler, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq\n");
@@ -359,6 +359,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_height = 4095,
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
+	.irq_handler = rzg2l_cru_irq,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ca156772b949..32bea35c8c1f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -83,6 +83,7 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	irqreturn_t (*irq_handler)(int irq, void *data);
 };
 
 /**
-- 
2.34.1


