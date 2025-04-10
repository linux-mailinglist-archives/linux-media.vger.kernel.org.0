Return-Path: <linux-media+bounces-29894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD3A83CA6
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09CA29E41B8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B99221D596;
	Thu, 10 Apr 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="USrtVbK2"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB420D4F8;
	Thu, 10 Apr 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272958; cv=fail; b=sbu7tBGJ3TIMp6ooVBqgx0T0Of4wzThsn0W6VwuTqt0wB75U11lxdm3Ftz49xkoNuWNJVdvMoh63H2bMnYmZQ1GDj7MB6D4dRVzY+szZPQmW4lVmY4NHHS2vkQ87tcRFMLfVmOCA66u74t/A48HabfI0cLnB0XC4dtRylkQMZlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272958; c=relaxed/simple;
	bh=Av9BRWigFHtRTltIu/hVRl2BH3mFBLzj3koMaw+3R98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BcqmDJgIRoc0ij/GhNSs9yJiW1Wclf1kPa8Yhe5Ya9vtK5WepxS894yc9y+6m6UruXwd/xU70ySoeu/ewjRJm2tiHhsT9fEgCjQDlO8yd/pLjucvp4HPd/fpbdZUge3+svi+plvw/cghZe7bvIzRg9iImrZmdumxYvXEkF1hOg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=USrtVbK2; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/uWW0NshFJP0fGLmDawOATA57npCIpjKsk11sU440mtTWEuwdm/sH0sWHcGqohNukmZcr4UPTwCliukEkCKFW+NaRkIjnpe6WOAf12VkiP7G/xoi04PuYtcSr+68zdIx/lkcN/9DWZofZAVV2ND4NfLQMyFg0PfKSol5Fv+bmHJ5WZyUr+DaNK86tCu1iLNS+9hPgcMRPDBF1MDYrsWiq/3DqPUsRNyziNiwMowbo5NgbzjtpPrat2+UNuPhDA6PfBQ21kQpNxLcxh8Bn+a7oJG32YWJBI2nxALiqRUD9NutWEACQda4N9onZk6n9gjSQDfFzx5OWoPC9Qo8X5zHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30UvmCAQSni2NJOhkwjL0dQS1z4mP5FLAE2+NBwZKFM=;
 b=D6GjqguPvnShAj0HSSjSlxsHvOnxAckSiInQ0SJFwpKJMMs/MwQYAYkA4fbn9SDQtdFKw8H2Dt6GYJCNBJsVj3tbifmDe5xaDRq4MDMTwiTmeLKnojUQtR7XU2JZieCj0tFq+Zc108RYaSc1G8xRnqi0y0GXMNPfVsZKSNU3mCs936JneS+nHN3tXraRKyWVjMbTiv+dKFyrV048k6E3t97UYM72yy2o3gx4Hm95VCv8kifQ3Hp4hvaMoEeiWSWfJ9tJ0o7u/QJtBRkMLUTVQNF+K8uz8n2b1H5GGjs3QpJkGYB3gHbpmgMvs2/Za8WIL0YwJeDOo/HV7J76ugjbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30UvmCAQSni2NJOhkwjL0dQS1z4mP5FLAE2+NBwZKFM=;
 b=USrtVbK2rqvOyZb67Em8Ah9oy3PoCqRuBSsAvfc1G4ZqZv8tirtoDEmWunV3vfvPWeSKVvZ4LWS8DO7u7m8dV4Ig0XcmNxDVoO56lEZ2HaXTb8tPrVRf+u9H5QbKTcaPg+T16M1Q9eaZ8wlWqR9MnNEsw3eBvwBcVQJicBiStJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:15:50 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:15:50 +0000
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/17] media: rzg2l-cru: Add function pointer to configure CSI
Date: Thu, 10 Apr 2025 10:12:20 +0200
Message-ID: <20250410081300.3133959-17-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1d3fc1a5-0134-4d00-4343-08dd7807e777
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a36TsxBhQ7k4dkfLodaiJ9E/0DsrhhcWxjMXnSsAxJZFvEpZDzJ4MDnOJaPb?=
 =?us-ascii?Q?SnAb71Q9gPOvvku2b2ulUSm5TaE+FCOKbnsBxuoNLzDhqZnduINqPNuKuHVz?=
 =?us-ascii?Q?oML2ymy7EshcnJmxEfkdKkSdS0UfTjdCo1sBRl23tAFIdQPqQc0m3hOwAHxl?=
 =?us-ascii?Q?RWu46rVf4TQGoweXWLYJ1Od9Ugo2tppBJdQDhK30vN7dlfNG7DAWNj+fY6gR?=
 =?us-ascii?Q?8oE3BR5whvJ884aMKrGyTb0pyxJRI2eupNKAK7yYoZ28Wc6J8TrfW/s1VSGH?=
 =?us-ascii?Q?VB+cPxTy1Vmr0iW+LT4ok862tqDK7Y39FcTRNWxj6C5Bjycyugb0+Jfv1Hcc?=
 =?us-ascii?Q?lJQJq4E73TF1EvTihsv7vCrcJW5CGF7vutxrGr1O8/++4AqQJO8sb6mcK5ER?=
 =?us-ascii?Q?dKz96clV7yCG13qCiBKjcnt2CLwtrpl76rO3Dc1a0GiVuyK3iY/yFXBhelmc?=
 =?us-ascii?Q?QkE9EfhcHudTnu89WkDNu2raX6dU2fwufv1mG14Gs4LxGo9e2VshUbq2zklM?=
 =?us-ascii?Q?CAfwuT1ZZKATnvCBwtPbR9244E0TG9/wgT411hhH5UqCmdfSKZB3XxwIFRE7?=
 =?us-ascii?Q?86xx364idUsbIHFHcvoU51qrWc50eNcpUcuCegYHmV4hep5HaRcHbjHAFPlb?=
 =?us-ascii?Q?oouK9/8GmVLqkiRM9YRncfCBzso5KKLvZrraJ7F5JiPwCXZwUIUJZCUUNxJN?=
 =?us-ascii?Q?94BrWV+19vvQcWCKJ3cZHd51s6bh/hlrFCUmyI6WPsioie7Wy+DWZ14Mmofj?=
 =?us-ascii?Q?d3uDgloKDrh7hXFgQRh/4myfCN7Y6R/B2QlVCcTVuHs060lXvF4DTFFpzooZ?=
 =?us-ascii?Q?3ekVCk+bJG0sNDOAn5Tu04MfoaJWd0Ls1qX5jg4zgCltYlwUVxlMWpUalxok?=
 =?us-ascii?Q?m5vEvczx6627VHdOkszUInWk1f3Y3yROxucyY7cLW/H7aWXGscaF1W3oQj3F?=
 =?us-ascii?Q?owBQYbxJtNEakx664/BASnkCpEaHVrfK2P7lew4DhxVqYyYEZPLYjUqzKkcO?=
 =?us-ascii?Q?80KeKwSgRXkpYDUAf8e+BRTWYw/+IUA1TgjkgEx32fRPivNxxGiRQBB17UYq?=
 =?us-ascii?Q?y22nW7kuzskV83DhRWKY8KsJbqvDXwdsfBRX1xZopqfJZwdCh2K/Qxk+1jo6?=
 =?us-ascii?Q?yODWjw0wRgqLPAngcQtRXFldvQYq1rxrwmDpqz5Z5626mY8docjWef2POBzN?=
 =?us-ascii?Q?kNSlWaAvVFlQUGuqtVPOHIemSJatAJBlwdz3WtKZoYlwOKwA90l7pnAitwuL?=
 =?us-ascii?Q?mKnYqC4vsLsVQ6Nr+epZsPQJmQl34r1dnchRdee78icTpLOa2GAkHd8ugXfA?=
 =?us-ascii?Q?RxaItiSZ84Tgu8uQxZXcG1G92aA4A5Pr1+J+PGIG0H4XrBhASOD+2U6CDYwg?=
 =?us-ascii?Q?xYgU/erSvKHNy4tshlUfaGnbSKPGdH3xea0kDGq31aSOHhuX5i9gTAenbleJ?=
 =?us-ascii?Q?1TFXN+OGy8uZLiruBbPJbeJZaWWmdzLV/9ZeiixRsNG62NkFXddnyg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b0m+jBnrE0dkZ3zk4GnxRQNL65wRktvyQjk6PRI1Z/eJLLQj42PhaZYhdsio?=
 =?us-ascii?Q?wKUx/j8xXf+bwTpm91m2P6sdvAtSixYjhG2dfZYoAQCIzhM+G3ytXZy8+gFL?=
 =?us-ascii?Q?NGQczwYO+Fl59vJJVgCD3VnuA2k3hKAOPWAyXGHhrCsWzOHm9NlK+CosVsfZ?=
 =?us-ascii?Q?TFPyOFFNU+Q8mOCDvTm2OwEv3VeP7pBy9AYAqMAPaTNGqFYqBaxyTdrASFPL?=
 =?us-ascii?Q?LTUIuxiSBIlZN4+kXmSKRLinyPmLEakhdfHNLeRhh33RDU61Jxf1wyABCrO7?=
 =?us-ascii?Q?prxMVh/slNi7chPyQE1PPMLstSprbEnOgf3mbnJ1YI1o1yphsOWSzN+XEmhO?=
 =?us-ascii?Q?h65K9vZyX3sirGXsVXm4Y+wfafsQFvfZEhCdYmfR7sWmMyTTO2zM8E2tRY9m?=
 =?us-ascii?Q?XHzx/roZ8ppzBthqpcygvJFI3HqN4q2JXDBjzFP3wb5/mT0MnVoPUTZ6iIjK?=
 =?us-ascii?Q?iZ+YftFmfCmSpX9UQKwhNwVLbWdUt7whsS8ANbpKBHzwpBZlpc+i0tkFv580?=
 =?us-ascii?Q?/rwmKAl5tGZv6dmaY1fmGV3l7TKqlfvAnEyy3YwGlZvrLZuKsg7e49CD/lYf?=
 =?us-ascii?Q?rN/Uyxpt/F9c2gUl8fYNJDP24QsnjSDap6ps15yBTPYaSAP4uIzeHIltfaRK?=
 =?us-ascii?Q?dNb54WPc3/qNqWPoI2Een3yXZI8seQrnfsgsyj8171gyfprFyKEMxHdIEB9p?=
 =?us-ascii?Q?gQU6iqx6JeNToZqzCUcYkD/l9xAV+ZyII1XiPrIykOABdkDMqez1KP3ziIri?=
 =?us-ascii?Q?2cBuI2krP4h9ZDqRVbnRm5KII0aduKCWjfmpAVgCLRW2OPPChrMweoPlJaB8?=
 =?us-ascii?Q?gCPz/86wMdfqFRfeyIxcKC5wtqcsMeUyaQHGdxJ95ansjBH2yJsNpgLj1ZTC?=
 =?us-ascii?Q?y/g/WI4HD2+yFVzyofGp1xJAKUxOa3RXD+JKXpgbwQpd02H8jCR+F2tD7CJT?=
 =?us-ascii?Q?6tHoUknDmL0URsCUqwFHu0VvtRes0hmdQ8mES6Xkkboq2U+Gidqise/g8Cbu?=
 =?us-ascii?Q?uaa1/40HuwkVPPEXlTQkjPjbRzUd244d6QIee43liYU3n0PLdLxpoHN96z3A?=
 =?us-ascii?Q?WPwQaO9BJVBgkgpeoA6NGY0nu8DDsih9NYIf92+jn25cRyCbMFKtxoAxKLe8?=
 =?us-ascii?Q?eKCk6SSZK1SEGAneyTLZo8vlRuHAy1oBQQWsAR8u1weCqKEuDjdL6OtGxUGh?=
 =?us-ascii?Q?xwhNKjqGar4Ue3319rahePgbsmYMCuuPWXkIryWVUyVjahymCSb8fY+IBfUk?=
 =?us-ascii?Q?jl7KzLitiIiRR71OFcdsjm3CF8EzXfk46FcVzMIap5fF8ZFhHzOeHkU9tBKi?=
 =?us-ascii?Q?mLF3d2wsbawlMl0+UQ/tw6miujNwnVfarSJAqWWEAudGbWl1/oXaMCVtV5n9?=
 =?us-ascii?Q?i8FmHdXoHUkWCvvYlaM6w+Stlu7aHXDp6WmlzSI9Ie+ZlBiurSax/62vA+14?=
 =?us-ascii?Q?AcQrytD3O5hd2XoZ7MyIovg1lx2HoKQK0sSC+QbBWtQKtJ+LLrChuYERZp3W?=
 =?us-ascii?Q?LT+hWdXhIcnsKloOtqG8NsSMWPo5kXLsF33p4zDkRz57f8j0VbiYRTr1+jLY?=
 =?us-ascii?Q?ZKqvakVzHOi7XU/UEzJtBPIo7YN8mAl0W2W2PxT+0IUUNo4+QSM8nwCpmdy2?=
 =?us-ascii?Q?WzkAorkfdwShX1TDKbdbuOI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3fc1a5-0134-4d00-4343-08dd7807e777
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:15:50.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG7ZDLzdSnCMS66eOWEtXhEfFfL+t0uEcWzCy48zcjZ11CGWfDZ2tPg8gSjKpaSbwnZOonHeXYD5oCkAaK/owljxLevdqEbOMGdl+ezvF53c72c4zlLkhHf3NLnl+39q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
register configurations are required compared to the RZ/G2L SoC.

Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
pointer and update the code to use it accordingly.

This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e4fb3e12d6bfc..3ae0cd83af164 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -363,6 +363,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
+	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2e17bfef43ce6..ccaba5220f1c8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -89,6 +89,9 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
+	void (*csi_setup)(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 };
 
 /**
@@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index d35e9b2074937..809c43d686e26 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -242,9 +242,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-				 const struct rzg2l_cru_ip_format *ip_fmt,
-				 u8 csi_vc)
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
@@ -266,7 +266,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
+	info->csi_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.43.0


