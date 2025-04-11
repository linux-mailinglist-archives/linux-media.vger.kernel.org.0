Return-Path: <linux-media+bounces-30054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A8A86443
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0684C1623F4
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C933D22E3E3;
	Fri, 11 Apr 2025 17:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M/K8jpKk"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13D2236EB;
	Fri, 11 Apr 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391306; cv=fail; b=Gt4ZursIT7SJbX1oBN5DS60bFq9KPGA3PlKAY+zpXitRjlUaDxIdRdJEvDDmcGiIHPemvNgJI7vXmzbBBwq4kWFWVJrA1lIGolcpjgznZpTZecr/JQ1CuHoVqnnyf1i1t5md/w8tY5tmx2N6UgW8t3n5GJ1V/fKLTUVdH//KW9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391306; c=relaxed/simple;
	bh=9yn3KjmMo7xoB9d6B+pEXqHh7gyJAtUjaghpmhvvRrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sy6QHDU1GMZ2OX9nHziMLwIqIFvD3BD07ijsXtP1PbDaaYaocXFuLJXReJqEtembwTdSZrozVgnZIqjVvTXcHx8DbXX8MNpJiuNQwaKuv/ECyGms7tHjrUdLOw9fzH9HUUEJ3+Ag7wlIi0DtjxHNNJ0TllS5ilYvGrxXha9GVC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M/K8jpKk; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl0pZb1Q6Tg3k0dvpImoGd76C7clcH+P/kOx0ewf5Y2tbk/ajAX5sc4ZC6prET4SPMYAS0wuxeSfk7d7oPvsnvw1iUe+ZAERFJRAjw5TekjhjvgNRB1ZN+f/MEo756TKyF0LT3DcaPuD/2xvkAkQJL/LbAEecqibVG5/dOrp1SX57JiSzo8O09N9+8+UHgawkQ0xot9dqXhnCZH1QonYfvjf8nce4NpGN5igkd6lqtpN2GAu3BBhaihUAF+df9ULQTfOcFApQ7RyWnSui2mmiVYl2AfVV+Hj3d75nvsdNM833zdGIY2I+/CYPUKmUKuEfwF3LoytS+lXaMc0bvWCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+sICBkurKZLMxEntqlHszZ8vnGManGQe2KXc2krSiI=;
 b=PgvIXHQiPK3bWTY8z2BExNo/1UnpxqKfm2QwFHfy+DM19g/dh7dZ3ouRYQXba2e4MVp0j0devnL51QGiIAl+0MpzZP/i+znq44CuFzJQ0Hyqlvx22/vjKsr6BYi2SOMUNIYsGM2tmNBxjUEcirYTmGvGUDChmO1r1k1piRyCW7ddrk+QhXKb5eopKepqlHfy+0/+RJpGvc/6//5jolooYgdGsPIA4HbGgRMP9tZHNg3KHGjPnYzKyhqQ+TWlN7Y5YboKs5z1CRszb5Y20BdUDgSYqDuQh/5h995SI8QrsxUakzvSrbz6M738pojY2gn4v8KJ/JA/XE1ito/cOlbK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+sICBkurKZLMxEntqlHszZ8vnGManGQe2KXc2krSiI=;
 b=M/K8jpKkmkP1A+lyOatXFpLJzDVS/9qlGTJuFRtoOEEsKoNgoTL3q91B7CmzE9qfYng4DCZgvIKfD2w2wo0xFM4lvk6mu7E4+kiIoeopPK9hC2e1kDYdKqk8d3yrKwpiYhF3yglV6Nlnuol/8CTlhMzgJeAecUETnzkdCw/v5p8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12643.jpnprd01.prod.outlook.com (2603:1096:604:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:08:17 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:08:17 +0000
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
Subject: [PATCH v7 12/17] media: rzg2l-cru: Pass resolution limits via OF data
Date: Fri, 11 Apr 2025 19:05:40 +0200
Message-ID: <20250411170624.472257-13-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12643:EE_
X-MS-Office365-Filtering-Correlation-Id: d78913e7-c403-4baa-d995-08dd791b73ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zd2pph4SXfHgu6KaGv3h97jCaM9UPqfTrLbUB94s2tQLFGWbN7UPQ2Q/EjN7?=
 =?us-ascii?Q?piYsjwH/pTtZV3ACmIsySt9Ldk1Nmz0voj1f7cYxye3Imhzfkr2QW8hN+ufN?=
 =?us-ascii?Q?CmgqoIe8BOPMLWsESjiVAJ+QjEIVuNPMUliD5XFikwpuzCh1zPXTQsRuj/UF?=
 =?us-ascii?Q?mQNTrQZudJKBoU65TifxFsSrNJ3GK6x8+RQE+WU5jBtwEAO3h5vOCQebPd4o?=
 =?us-ascii?Q?WWztRa/hEM2I4J5xZTjmZYPwewbc/g1KprS9n8epp1EAkTjDNAEcUzcAcNaX?=
 =?us-ascii?Q?h1GUnc+3Rlo8T/qoyYu0sE+4JTcwZDCR7KwQHfxbKfscGpY6r2OXMyfGJWKY?=
 =?us-ascii?Q?yZNAPJuNNq+vLIIMfPR2l87arpV0cW8RQU5qN/wKVWPyC81AOGmz1mR9mRWF?=
 =?us-ascii?Q?ggIJvx0PVd04w0iPnmGmR0fsEh/d+v8/pa2+NFmkuUCqZSr3yVmgLA8cQVSw?=
 =?us-ascii?Q?oZE2iCl9rl+GlKi9CRcEozkYRl4KE7EtKQljFt5LuO00PJIqc7dXUsFSsj4d?=
 =?us-ascii?Q?nefPy55BRA+SKngan8fL7bgDNi4Thz0kC4qW0i+4C5//ks5So+nNVRKgTfo7?=
 =?us-ascii?Q?GU0jZbSxSczCp/N1LEnNxQZXLqwmP0YHEEigjFSFne2Y3CaiIcU3F2FwXoHd?=
 =?us-ascii?Q?aQypWAd1DAqOryU2ukrfi4d7TsgKkybPcgHBADKq79c5rgZ4aKYrTl3h7w8h?=
 =?us-ascii?Q?N+ELgCYlqHPBtyF5X4KscfXLJsYCIImz0/fKUtJSyZ94TD8Wdhy3TSA1urrH?=
 =?us-ascii?Q?Kd3lOaBwBswecdtMmiDQFn8XufTGU5nSZiIaeEbNyYILskRDdqc8LjbEUOOF?=
 =?us-ascii?Q?kzooAYAfokpf9H7IjUX7PvADllAGj3ZJD2UKshiPUopC2y/kKS6Oygv8C3ha?=
 =?us-ascii?Q?gXYpz8uBd7trU479j+kx5wEc7P5XEO3wdOK2aH4+QqysI+L6RpYhHVYXV/ZG?=
 =?us-ascii?Q?ltxSGYxa1eIxstlfygJtnY7wK1XZQs7XvLQKYRd9HFwSrwkZcYgCONtwtnpy?=
 =?us-ascii?Q?5vnUwhWkEYCgfaE2EhKoeOKAn/vzT+ciYF+tKTYatyw7D4Ls7CXLmMi0fOD2?=
 =?us-ascii?Q?lHkGyEqLekmoU/+aODGibXE1UbbUrE1n5PFN93ruDByOAGq5aSOy6XjqQNN8?=
 =?us-ascii?Q?jBjm2VH0aMuXDzSLjiY0izfNe6Lh1TmcQpL1YGxdaorRSpSQhvLEiXMhOnBL?=
 =?us-ascii?Q?XDrKPu7jZUq5IldMW35pM4dYwDgqlK5KnJTYNk+Fsfm8BILhPc5td6QDoI6I?=
 =?us-ascii?Q?WxKCifGMnhLINqD2s07bPeqATPmVGY6dqj9QgWRUcEw3WcSOczDRlVkzbWV/?=
 =?us-ascii?Q?XAkH8/KbV0JNiwQ0qYLOJRlM1KlEQ0Zm2bCsB/UZV7j0f4gtuH98tUFzsEih?=
 =?us-ascii?Q?NoqCZoyPGqNk9vqmHNpaJwCLRxNaGJGfE1deKFBt9kkz1IV8PQBVV28lMbkI?=
 =?us-ascii?Q?zEF8DNTsOBewBEaX7EuclwW3u4uRGjUwIg0gFgYywaggHJr1urcWlA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cNZxYrI2QhnUa+MsiA0y5NR1GWmW5xHukiFrpePPxIp+KI3Y1h2Q0FOsDjuW?=
 =?us-ascii?Q?r5e6mXixM7dMagrYNTFqgWs1TbLemg9RDIks7go0eJZi0Gw27s2AtiB/Fbfn?=
 =?us-ascii?Q?go6PM/KBt7V0wb0tU9MJk7QwmwUGtdIXiPIYXWdT9G8xpX5lCoyPsTg8NToF?=
 =?us-ascii?Q?SA75Llj8qKW8fHsIXk71w82E3TfqOwnEIqtXirJ3tr4szKddwCrUGm7sKU56?=
 =?us-ascii?Q?rWkkyZrmeERQaxDmWvNmD2SAYaIThuwpOKS7yNZ3L+tne+GoHb7eQNMQUCfD?=
 =?us-ascii?Q?Lpa/S+vOQhT1yrcvrZkhMZ1CGQ0+gPyV8RFEuRB+IUYUxcgOAhc6Bsqnl8pt?=
 =?us-ascii?Q?Se8fPZRV2b8b/E1Uo7aXuioweFTC3Ql4YF/4EUnbpZmD9H0nRnScHZDyGr5H?=
 =?us-ascii?Q?GpGB9ftMbkCu2SkGDkp1M7NVF8DG9VNqzS1L5Hs8Q/0oDi3lRCAAp90DohWx?=
 =?us-ascii?Q?LvukGrRbj1I8Ye8XZca1LmYHx89CwbJk5rB9W/pu+voWSQ4/dEv1qkGMtHMh?=
 =?us-ascii?Q?bKYT8RVTVQLv9NYPMeOkoOURC9z1OeJVZzY1Uj1E092f5FnKidvpfXmtqm7b?=
 =?us-ascii?Q?oR7VIPmiSNJWXK1BK3cMMvlmtsARPGIgV1mV2lztd6R4Gm9rMWWWo6uEbYtO?=
 =?us-ascii?Q?f3SqBL7CDo2clcA/qcVNCgnMf/5N1HLIbMiV7K4yEUZq8/TTAsj0elo9ddnX?=
 =?us-ascii?Q?vYLjhdveO9/bjsmRlyOfLF5UGpeEOKN8uUdjarkpsEskfM5mwoqpnHg4SyIV?=
 =?us-ascii?Q?y3LJOiqiSXe28n203R6ucOnPuDTU/3/LKo/KQ31cjb7d+972IuKS8vARmM0l?=
 =?us-ascii?Q?YmpJ7AGhkEhWt1wNmxrW4/FQYxzvkqyqatsM5iQvMQd6lei8BYa8gNbC47xh?=
 =?us-ascii?Q?e9C/MLvjdYHEbWFojjusYCCVM+4BmiRsoo7N4+se/jls2yhVaHYoNeAMInpU?=
 =?us-ascii?Q?W/sTpaJ0Wx8h/IOwrekgZhzD/en4DtSOKnwRhS81RsrYnYoLCyZfHC381z9Y?=
 =?us-ascii?Q?NkU5KvqEFBjs+Aa1y4golyIDohCwqvX0gbO8EvXTMhxa85jmluSpMlM45UBy?=
 =?us-ascii?Q?E73J0sKK7Zfu8DQ7SksKPffj2UYzN9XZdAvRhWOQ1kP11zVnnXTqQxYCWip7?=
 =?us-ascii?Q?exMKEFd6SeS0YgQUxi8XucuHzPW8nm87ucMINpLPhM+FuGR7mtFocJKuJSw1?=
 =?us-ascii?Q?r82AZSwu1AObgwoCP2tdeJfMYdZNyTemq/OCNLUn0fQE1u5JUSGEI7h11BoV?=
 =?us-ascii?Q?1b0Zv2ww5IU5+Wu5ncB2aaMHyb+zxJ7mLSiwl8cBT5gzBEYMauetnf8kME2Z?=
 =?us-ascii?Q?JwBg4TLcUKYwgOXfI3i6Xvwf7Y/DeywkJ+dx87M0GfpwTo0zVDT7c0y1QZkg?=
 =?us-ascii?Q?O0KgLhcd3poEGV9oHuy6VxlAgQ4l5MF9dCjMlye5IRVnwRzMfORKRbpHWZks?=
 =?us-ascii?Q?LL7TgrVYvHvHw4XqNNjw4JH8XaIVcCRLiDS19DXf+Z0XI3WPzMdamz8uUDMg?=
 =?us-ascii?Q?QPQqVDLCJ3kbCnJ+TUmEJ0211nykQJ04oF25RaP/1FoG7J4bITZTvi7Q5tCx?=
 =?us-ascii?Q?WX1PvyUoapQSTH6OJVfyu0sujasiXmPvsX3AZWfh1vnSakWSuzNP//Z3+OhW?=
 =?us-ascii?Q?kJ4SPfeaJuCiDIQlU63YWwI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78913e7-c403-4baa-d995-08dd791b73ad
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:08:16.9227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u5/RI630R/5aWclHx3IbrpBaigUn+4H7Oy5zMZxDu2WY4u6FvX8fjMa03YURbm/oyybLtDg2zSrXzaYo5tmVVoEWC3u73OvDJRIQkCSlFL2bR/CWZX6mBLBhDw0xQ/G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12643

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass `max_width` and `max_height` as part of the OF data to facilitate the
addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
This change prepares the driver for easier integration of these SoCs by
defining the resolution limits in the `rzg2l_cru_info` structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag.

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 2da416f914490..e179f8d29038f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -352,6 +352,8 @@ static const u16 rzg2l_cru_regs[] = {
 };
 
 static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.max_width = 2800,
+	.max_height = 4095,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 00c3f7458e20a..6a621073948aa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -27,9 +27,7 @@
 #define RZG2L_CRU_CSI2_VCHANNEL		4
 
 #define RZG2L_CRU_MIN_INPUT_WIDTH	320
-#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
-#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
@@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
 };
 
 struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 76a2b451f1daf..7836c7cd53dc3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
+				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
+				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
 
 	fmt->format = *sink_format;
 
@@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
 	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
-	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
-	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
+	fse->max_width = info->max_width;
+	fse->max_height = info->max_height;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c82db80c33552..395c4d3d0f0fa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -736,6 +736,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
@@ -758,8 +759,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	}
 
 	/* Limit to CRU capabilities */
-	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
-			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
+	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
+			      &pix->height, 240, info->max_height, 2, 0);
 
 	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
-- 
2.43.0


