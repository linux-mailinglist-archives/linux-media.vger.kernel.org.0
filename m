Return-Path: <linux-media+bounces-29893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33763A83CA3
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D9A3B18A1
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B56E21CFFF;
	Thu, 10 Apr 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gSi4wSSk"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF121CA12;
	Thu, 10 Apr 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272949; cv=fail; b=TMTltt3QQ+dJNhJLjt2OkOdhGlmA2N4X0Lcul1s/W2gzhVPSZiVVxG+x6CaJoO2We/XBG5pQLAXREuwMohDKE9KuWAKfYcpAN3eh/N8TNvXT90InSB2uJ0cK4CFaaf6gN3mpOxjlF3phYshlHRhgN78a6MxTUkvGszTO+DI5ac0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272949; c=relaxed/simple;
	bh=CKIfA+CaYrGgB1nNgH/oKRqJxiDl0tjKYvkqrZcxC9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yfki5yheTwLs9xzTqXMF/eGd2Xr78TTUfeD6UShlxt9Js+IzMohJqqfjbK+y/S3eBMRyVQNk+2SSytEnX3L15g+igztoVpHPH2Z1I8qxDZUx9UxeN0jfhsHXkaJ7bUNpo4x5XjWDPS7SLQeTFsn/7g+7vxNgB33M1HJsiE44CEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gSi4wSSk; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NA+uHl1UmxnXB30YjanzrPsjx3gWDkT6w61uHTdbWT5cjPTUtj5yPFgQ94HnGKyeLzgxasILI96rW5v7AR58j1n9RmDqaxap/LFE9LC8Hby1liM5MS43CdQjqmfiMlCR/2Hr51E/bwoeQ5nH4P5mFzOOCSDSlT9GLWyU0JmSHFC1X4UecBwo1phRObNf8zUlKPHh5VNcnb7LnrYrkGahG1EnbPNSLaa+HVQAtTrpM7G4AGWVc1nfJC0oRmZVeL4iPQiq6ifseBWjujl9pFDb0tevm4LgckB9Hles2NLsO8qLCd0v9lBtEfiwSAL6vXgE1QAR8DZ/mrDSJHc/9t2skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvxxmwfF9H8yke9tg3WJkX0S7wdEGfPIx23gqr2kgXA=;
 b=odwFsmjdVp6gU5rbQ8deOvXxHmvD6YNtwzWmgOEq01geCsJ/I6y3yAn8rIWm7CztrYIarRQKi9PG5GWuGPg0o4yAOXFnLoJFMqq/WHRpN/j3Xnl185Emvzd+g7akmxV3DNHkBgc59ejaTlKkO1NpkEP3HucoLQY4Tg9DZSf531aUARvsVv7QFlpGaQVJSB3UuDqfuvRshqyNmoX8omOaczboCvrJYKQAt4YtYn+6k6lwLTk3IaFLgBEQ6az0MZNlvJBbTWQ/Z1bc5HCJKSzPc7S0dIhl2VoK62J0EyhDPyDi4mdaAGJSMobJMdYhowKvJLqYl/K1H5hnFqiY8UMjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvxxmwfF9H8yke9tg3WJkX0S7wdEGfPIx23gqr2kgXA=;
 b=gSi4wSSkAd4cgX6V5Gj3v9Uvp1s+XPgbpYFLU6moX3dR3/TcG8R98kpEk5tY/rg7nIh0EIVhDvCT7NOrujgP45sFWGhnmuM8jNhpBQq8AD0sORBM/muivCypVdLydz/Lkn/wB3/qYDURv2aZkBYi41DL8NWOEABwDZ7PGZGpZGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:15:40 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:15:40 +0000
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
Subject: [PATCH v6 15/17] media: rzg2l-cru: Add function pointer to check if FIFO is empty
Date: Thu, 10 Apr 2025 10:12:19 +0200
Message-ID: <20250410081300.3133959-16-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1dd76a42-576d-40c6-f70e-08dd7807e1d0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DsN1Hu0a8ijjcGDU8eSjCibQTSQV7rvuOd5K8bkWZd7nERDpSBACUiIH1PVM?=
 =?us-ascii?Q?0L1uPZ3uBNSf2Wk8JCqIxFI/t8x05SGkBm7bDcF5Dd9c7214axTS4ef54tVQ?=
 =?us-ascii?Q?sNxQqkWPN02L4TTQovWORC+Ul2vz+B2DulVxsFbn/VBr+EJnFErCvduGi1jM?=
 =?us-ascii?Q?8p9b24QJT5tSXjcldK/usQf+z5w0AgHQzDpOppJIitNm4ZrJ9IE/DD4hTo2S?=
 =?us-ascii?Q?3eGHsQkMqq3dRxm8q9s4TocOo16nZCTl1xcQFXuf1hiQH8K6AV9jDTLVHq6w?=
 =?us-ascii?Q?mJpvkH3pprhPUFI3mk0+82nZmdu8mBmF/8cSGQKkTeQw3Wi1q9VdDiWiwO4j?=
 =?us-ascii?Q?Ke8fOps9Qdv1vJ4OAgRYjcpd8wGPu2GFiNEAqcoLsRlYk+GF6/rFqpaCZvwn?=
 =?us-ascii?Q?AVyvWqultXxNCOZbYQ+Ht4JmWYmjAyaqQV5VMnE3vuOaO0sPa/mYLDfgv4ES?=
 =?us-ascii?Q?KHG6/cKJmmfzFbCNTof0HAfN8Q0huNe0hFialDzjeyeYgHLMF99U9wlxBDFf?=
 =?us-ascii?Q?bWS+GjelQFz9sv1HUFZZ1wlLgTlcTnG8MpVaPvbMXWAT9EUqz8OfgSXZ3HZj?=
 =?us-ascii?Q?mGawlSP+SVRnyOf0AiJMY7qTsxISMZH32kdwoNYmtR+OvKjG/Vaz3I/em2KH?=
 =?us-ascii?Q?sUDdhCmppVBMzlzhI64t26ElbAl3P0b7YA3NLPJ2jgjkB/4ZHutnf/0J+sNi?=
 =?us-ascii?Q?pNLknHCe5QB6rdD0NPGevpYpgO1MFb+lEMf4f9nZjecmVkYBx5tWAwAR1O/b?=
 =?us-ascii?Q?rJ+zraqbZpynSLkElIPkms6wUyyUErELnQkK72zWvRmRL0OFQPKe3FQjiF1N?=
 =?us-ascii?Q?ecGUR3zqUqf6Yz/Vp7lpxKoKR5VzdrAejHNLZocqhRbDl+Io0ZJNzyfonOa9?=
 =?us-ascii?Q?QfnyYQvY3E/uFNfjg4exxnSofXPEk7K1GvMFX90AyXOqJ5L8wwt7WQC901Xo?=
 =?us-ascii?Q?i7bipoyyr+LE6c9YNA8lQgNGkH1I1N2m6aNCpO3hRs56JWHrMXZ4VysEFG33?=
 =?us-ascii?Q?0mYktm2QKMOjOh3CyDMblwxCKh4XES9wCc2bFPc+5Wos8J7iSBjy7D5qPoGc?=
 =?us-ascii?Q?EvaytACESXH6V93P0Il+wjjliND3xnToxliuR7ue5bnZX5TjUrdlsrjEP28i?=
 =?us-ascii?Q?AZCtz7H2bt5mricOIh4IsMHskBabtF8VO/9Rm0JLocZEoJ95fiw+LkqZaVHN?=
 =?us-ascii?Q?/uz/3vrEjSgUGwEdTuiXvOiLtZknyLsHaxgor0rHs855NzVe1kAlTFBc4bLt?=
 =?us-ascii?Q?fAOxXZ7CWBGYqkOAp3Hb1AIsL/5ZaxgdeBRqxVtcPKZu5haD/WjzNiaOOrDs?=
 =?us-ascii?Q?cVpqv2b89Rtp0Nr9hzuwXcwWNPytuAdEi5AnvNC47n2HZ8LE2hXXP8u5/YDa?=
 =?us-ascii?Q?DXYnQEsyQfKjHxy8NZPp/X0HLiztKQzdQqacLeGO5h/sOrqF7VE1OGz1jWNh?=
 =?us-ascii?Q?h9519r08ELQ2nQHDS1QiJzyH7OAmRDOYjymTXe2G5l+Ns2yrJP1XPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cUeJn8tcawt5mW9jwecSTfIexdvLTxy90SkZrhTY03Jw0YgbWQNcptLIjdUt?=
 =?us-ascii?Q?OC08EspVid7a2muzc2LOVWNqdWisOs12IcyArblUTe459F0aGGCjMDCigaQt?=
 =?us-ascii?Q?IPCLDKW6GArJ0Vx7ojmjakBjW5Gswn+M25sjVCPiL6hkavVTWwf1TB1gdxct?=
 =?us-ascii?Q?3aXyXNxXeUUORdmgCbBBDPuxcPSgIIVNRgr67iWvRngCxnxZW+idS9mz30tO?=
 =?us-ascii?Q?UOtgH50eStWyQTjOxXNX3XQpR+sCJAnH3wBQpY2Mm4jVlBXcL2xgX42jxmKt?=
 =?us-ascii?Q?wAJeMNtZzxHF1A4DpKtWdr4ofiX/YXiPX1sf2d8BNEm+KnvNEKgv6/kDLeN2?=
 =?us-ascii?Q?CMBXYNZuubRPnOUwuiVlx6pxde+9qHlmPeKHmjs5LJOMmx5jlXZvONEHaVhY?=
 =?us-ascii?Q?msYq3l4DDIRhQFyrifNrqE5WcCm0DHfB1DybJH+kV988GwxriygQu8tGwHRD?=
 =?us-ascii?Q?77Ps1lFU8s9B9YAj9umrmf1lBTY0EOshSNPmZ0lbJ1feYYEdFkuojFC701M2?=
 =?us-ascii?Q?YCHQVzY2Si7T6gTdHdBz1j6OlcVe5AqiNpBsPS6wAu8pL+Dx2nRyVPloecnk?=
 =?us-ascii?Q?jWRhu8orA1+4y8RBVei4xbqjkqGeNoXy74T2io1GIgiycnwFuk8jBSjJ6bRn?=
 =?us-ascii?Q?hN9dA2wN342mLrO19gveeky+ukSlVYqgLTVuDlF0IYImt7Es0SoCpe+Rqbz1?=
 =?us-ascii?Q?76V2HtdRR1pCwxwAQ5kgi7GUr7ZE3iRFwciR96qPAq45httz8nAWAH4s9Y3M?=
 =?us-ascii?Q?Imr3cwyezbq8umS5dLnyMhfsgKssgLbXT+i73EzjGRqIWavJvriIZGGBmCrA?=
 =?us-ascii?Q?8UQb1Uby1CVPaKUKYSx0EnX1NHjdC4Eveq6y6xLjMtg6rE80cZzHxD9rnZdk?=
 =?us-ascii?Q?ms8EBMerMxWDzUGueUWnhqFHyNRCD9wHMFPr6JxUvg3hlOIE3BgHFg0yQ9lS?=
 =?us-ascii?Q?qsstTObH+4TlbRDYHqxTAcHnv1RcAncwKimvK5oVuMmD+eQng3C1XqlaZb+1?=
 =?us-ascii?Q?JO+Wx9k8BMP4Y8TzvlS+BYaamDJIDYkOBcvkxy7XrUHkEqRmkZ3beJAqi58o?=
 =?us-ascii?Q?SVoUKRZoUcf6DE0UbWKx8avOJRBrLP/NooM7J3oamt2mDmY2MoDRFOgh9yZe?=
 =?us-ascii?Q?jUNjvNySYEjHf5MLtAq4mG9tjBQOy/PRu1km7+gmYPk+eTomTu3SeePJUZ98?=
 =?us-ascii?Q?qRdvdKku855xHIYPrX/FaW9QQF8RIY9lJfRpH8MPqAdz4Wv6Cqc1nmEmpI5q?=
 =?us-ascii?Q?v9bBt9XVsH2DdHDx8JpUXZd0QXsbMHsaLpdMjVHJeKX4MXMekN7kCPN8kQbW?=
 =?us-ascii?Q?Je2QAziatyieTHPDWbzQ9TvwA2PDXnSpRks62biBLQx8nTfj1/UY311/W4/j?=
 =?us-ascii?Q?UhOd7uMp6thOOTbLJ/QnKjVGZg2LnxKlPfc6U9OU7mfuSithukf30eTdEu3Z?=
 =?us-ascii?Q?50KmuYdCLH7SZnsdSKhBZMfwXO6PidkZ8h5FBBlK/zFmV6KMOhzdAjEPZmSS?=
 =?us-ascii?Q?Kbqa6pgo0Yt9qwA1ruOfEynNs7az8iTglQn/NO6ACP+zt+1cQd3XcYKyGtCx?=
 =?us-ascii?Q?QN3Ar2R3YuHTzxkeqG/f7JUFk8k/TiuYx+WnWKEhdQseMbOpg63wxMnomDgH?=
 =?us-ascii?Q?oUYOfnELExSj53XVcJreOPU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd76a42-576d-40c6-f70e-08dd7807e1d0
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:15:40.8337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kja4tN2VfwnNayDc0+GIeVDJ6Qrx8ZXdhbd0A96fzYHxVEFJUcUtRKPrtvfnE6rDa2nMWCQbSdTRgucKyjJ+Xj7TxYsYoNkLxiZPptKuhNzd3xmvP392Yf5hnJt/v51q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

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
index a104821d823f9..d35e9b2074937 100644
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


