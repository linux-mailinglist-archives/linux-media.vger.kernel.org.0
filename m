Return-Path: <linux-media+bounces-27073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553AA464D2
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052BB17B10A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A3422A4FE;
	Wed, 26 Feb 2025 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wvuZI8td"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E632231A37;
	Wed, 26 Feb 2025 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583639; cv=fail; b=dhKq0ypG2g187pLxlhre9wmdOzvtwVN3euHttfxqZyikMUK4Olmjljoip0j3hD/bL+3+q3uK6WAwIfvMCZgWVa0M86wGPWQhK8irURO8WKINhFb+eIavalDLQiXlFmxfkz00i6A3hMCq9jLwYKVI18w16yLjNkmKwHChpABkOxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583639; c=relaxed/simple;
	bh=UKg1zHxKodbLnM5Z092xPJYbiyi9RVS9v5F4Nm3UE9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HiNbJy3VcfAsEbTTVS3hvOKgCuYPR8y2c278TMXOAxoGzQTDKBAGysPVLTNclu94zf2HNxIs2KA5mugmufRe9Oj5NVHftZ7125ocZSllYkcaN6p3GdCUrdiBPJNTZNhi9mIouUMb3zVAQiCdnR7VCaPl9Xd7jOPp8mYj1UQdm0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wvuZI8td; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXRu0KeF00JUhjWhRv8g93XSUmSKMlc/Y8GvzyKwOwpuR2WwRyooSpgtveKUqHvAxVcWKgBLfzTGkwXy9/E9zMpDyGDWBBSOIOuWq5HQzLXYrSZ4nwZJgZOKqRxuTsCRXHRkuKurbPUYdNijXVMm2KbWjlHTjEuIANLnA3jhz973GIfV6yDdz/30T5mB8SijBY5o3/a1CIXq7Gjftg+xnvo8a8W9ojSuK1oOrK19vamWLQu2e4LaYg0+gfCzLZ6foCFmLylqaaAgy665C1Kt/veMrZ2UNzodHFXuATij6eo6vpZXxOd/taLzc0jMv3w3g4Vh4b5ioJBltqMKB+/bCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1pltHDZfhSIrend9oly11YbV+aY6f95m/p4zfVuq1c=;
 b=LSMPbb3APCv44x6rpdciP1tglCSlgXuw3rQNeRpVyARnokWYrAXJLq27XcXRE9lUW8r4DqJKUjHrCAbjAFimNjTiNoZZ8978lx/Rvkg7o2UZQ6B/Sr8R2V+Cyu/xC0JcOoooaGVaZI6cs4cqXtQ5LtSqeTL0CkMEBtoBGjla/GJtk0HScsIdhKmo9ffVXmiPfLvvKrt0ItzUkDV5vtjj3Gn9RaTzthgDQxKvVOuE2W3GE0nQP6fHPKodVeeEsvccUmd2d+ID3cPm9sfQQ982Q/x3mF9F8g8QHQdAbduGCM6EcBEgXvNllircBIczQy9Pc6BXWr+ODb7iNmTlaN3G7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1pltHDZfhSIrend9oly11YbV+aY6f95m/p4zfVuq1c=;
 b=wvuZI8tdJTsdJgp+oPTNI2YCHWk506lNW+8g8fcM7TB2KUmZlIIYpZTiYsPsZgoZ8SXf4tOCjDI9ialkl+Gk1tyG0TNYxMJttMvvutcBWZWu2igOl3rjYYa8aEI7OSj6FtpXT7k+NVpY6SSFW5B8aQ4n/6zQHZr1uWcY6jWrtNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB9826.jpnprd01.prod.outlook.com (2603:1096:400:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:27:11 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:27:11 +0000
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
Subject: [PATCH v3 14/17] media: rzg2l-cru: Add IRQ handler to OF data
Date: Wed, 26 Feb 2025 16:23:38 +0100
Message-ID: <20250226152418.1132337-15-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: 9415820b-10c8-4c6c-d3a8-08dd567a0a1f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/GSBLyjXLOo9UQs/O3ebdRv48Ua7dPOKD5zZVnUmjeJWCOfs7U8Enx3iKCR/?=
 =?us-ascii?Q?IN5h5NhRKUZ2YG/s7SbYdE3qFkjwRS1ZLrVw1jLjP0CmK/uKk+4MMm3t7wc7?=
 =?us-ascii?Q?6YpqRZrCEXupHkaL6OjGzX2JhqvQIy1ARulna+vmCrfpkysxMvbtmZSY69nB?=
 =?us-ascii?Q?YNdCeLE1L6QFYq67/iB5tHy1RSOC2A1np68nBiPNJnKQlt3q6+iZF5E+uMIc?=
 =?us-ascii?Q?rFt9iuIbkOUpUmX9iDqoX0SiIOzWLOLmtKEfYUSpJLgeIYC/EPQsq0vE8f3o?=
 =?us-ascii?Q?TG8BAhNS0B0+WW8int3g6IHiS7/Nvc3Nx5U0lSYny+O3BhQJMdKNn81//9EV?=
 =?us-ascii?Q?VdMtOKfi97oKEAK5maH47dE4Vr7cm+LRVEQDfpPe/3KNuoWIkCPTjD1XX1Of?=
 =?us-ascii?Q?DIBB3Fn40Pf5fu2wNLf3bxoiOrP2pbbcdr0QwYkqh1TFpugYD6C6cop9XHKh?=
 =?us-ascii?Q?vRUMbBPXAxIozx9DqOeWzBXfNCfMh5TIVsm3+lyaj2CfcDCbaDsFM9u87k7C?=
 =?us-ascii?Q?W6xKK0qRgfH/xiviRo12AAUvkLkNldE20jc+bJdo5p2GOYLFfhVXWS54FoAA?=
 =?us-ascii?Q?47FYdXxkOs3kDfSiDy08sNIbgc4sdLKh226dOsnj3d12MWvHuC6MtsNEJuff?=
 =?us-ascii?Q?KYUEgi7gORhWiKi5p2+7B6UuG8lYkdLPqe/1a5SzMKZimOeeWGDG9XGBs0vm?=
 =?us-ascii?Q?0QUsKv9slAIL033OGZ8S2KYfHeqpF0SXpBB9E/9tjTaNgR5zeLV1SrElV2ml?=
 =?us-ascii?Q?WusSJXjJvpCqM5pYYcXr975JwweELSYRQY9MIEqgb5UwHJsoREiC9Yof9nCD?=
 =?us-ascii?Q?YbVsGvmH2Q8I0V0i3f0wjTxlnW6wiDeUw/pQvJnSxvT//ReKQfBs97LlWQyX?=
 =?us-ascii?Q?0F9uk2AYIR6pNH+XoDbIo3YtRnJb/0yByDoxp8tC6FDUE4K9wX3HyzEa3nVF?=
 =?us-ascii?Q?RtIt+w6U5R4orMWC59H/DncNFVYQjZFDspIUpPrzshq413Dyj7naaj91JLh3?=
 =?us-ascii?Q?DXQkjJGEXTjH94a5WFZtNh95sVc7KIz6AywWhduBGOZKRGsZifvgE+8IIGTA?=
 =?us-ascii?Q?651/vF0P0sKiSC8gUcyTV471YlVN+OPa0+sTjRC7y4jl2KQWwuasRaWLnKiq?=
 =?us-ascii?Q?WJq5IrhRYDzS9kk8rnCDw6WvXNcyAJwti/VIMNEQKE6voBhlhAda8v0x8j+z?=
 =?us-ascii?Q?iGPXR8kvfzw4UGYePTkYV7wlYpQNWW70+DuueFav0j5uFQMlLqIqxV18kLsm?=
 =?us-ascii?Q?l8NGsNwsormLR9z5dg5ZYa2GUwB2AZ+dK/i4yOWLFG/S08A0NIzS9zkgD4Tz?=
 =?us-ascii?Q?efKdbaseXi9y5x9ib6CPQRXB0uqSMNhwvzEpJeA3ljfuXwpSvZ6Wqp1JOv6g?=
 =?us-ascii?Q?MF66hWEWsRpQyyas0AsE80CzZuE8V5EshbNAk835OsWcfpAGOxskDgBDd1ln?=
 =?us-ascii?Q?NQ9cnlOYbmPh3FRQ3wjYPblgwhbljAZ8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MU1e60qt0digw0Fq0gyfbTT3xIdBk4ktlnHu65ZnuEmOw6z2GJ+CzEZnf0Ze?=
 =?us-ascii?Q?6OIBbniDWjumw4S0Wp1cgFbtAZSm2u1DzWdx0cZJziw347WqZc/LfVOeprcN?=
 =?us-ascii?Q?OZkAGAPayyNYDERnJxvr2Y4sbYsyIjceZ4Ga+zdaaTi5uOcYUqQDyBPJd2/1?=
 =?us-ascii?Q?fCBUyormC3I6B2A5lbaM+LaCccQlCRqZykXDXsNDtsvBJvdkFr6cyuAB2+XS?=
 =?us-ascii?Q?PpE1bafKkd5yBpiCF04/npQyAYKvPWxedInL3nkXMiaui+jN/hujkMzZycq8?=
 =?us-ascii?Q?Z0Ir3AE5MeHRzWBn2253XFZjlrGX7tdgm7WfJCf3cgnn46pVe2Rxz1TsyWWM?=
 =?us-ascii?Q?xB8Pbq+vj/CaFlADifCNcQ4d47NfRB8fJ2rgqvqBC7X4kLzw6MyO+/s8fzqn?=
 =?us-ascii?Q?BoBtfON5sNPD2yzuNuobdiYSfBgVx8KFyjUguUh5B4q4f2RHykQuBY3uCHBH?=
 =?us-ascii?Q?n+DpdsY7JLWeB01YL9wuRgBlXlphRcu02GlAuwaSQ3AcEoYkMiz+mJcE/FMW?=
 =?us-ascii?Q?jw2+AwsQrIckyrCDQXJSmwrprPkkpEr7FWsxoWqdIzUU01yR128LAaWMoN0+?=
 =?us-ascii?Q?S2aaHMt/DvQrxvvG3RHsfkoXH4UVEteWIcaS8XPmCo1NAhsTeXFdf00wNoz0?=
 =?us-ascii?Q?0QeV0SDbsghcjf2+YEOgb0P/xwAAaE8kzrgc68QbRjlUqOfzmM8b5IIgm1DY?=
 =?us-ascii?Q?4bPO5hte+h7z/MSGturYULhZv6vA4IBWETMwjFauZhhVW7fn17zzDggJtpSF?=
 =?us-ascii?Q?b9a0X+479+IsjGKDAXqVZ0apTzXwY0YqKX5RfiYtFV6R3KE9Lvet11ukBCUM?=
 =?us-ascii?Q?iG/a/LhWpk5OyjRjuziCnG3cakBUii+n0yZ3LGbLgBBp8T9hP1pOuq10O5Kz?=
 =?us-ascii?Q?391JiXvjHz3u3umpf1QO5sP2XrpZNXZ5Cmupwq0TwTR/0pGXochLBbiv8BCH?=
 =?us-ascii?Q?l3Nkr+8EuMIQoUhXux0L3XHxRhdmFR3jh8MJEV6GuD3wEIo37QJgg6/k1/HV?=
 =?us-ascii?Q?awb9g9Rat1uhnp0zIGXdAkFtGxbcbi9+bIoSTZifjvSBd9DBD0vC97jFfqrn?=
 =?us-ascii?Q?YOtwq8KXSDgXgOcoXP8CcsJ3PEqYGbyehwLEiMo//nFJ95rtKgQ6YvGJRXA7?=
 =?us-ascii?Q?xa6y2umhzAxbL6DrwrlQGTBcX+VsvdEXDrJHAhJcBYiwNpSdhVmhkd4349sK?=
 =?us-ascii?Q?JzOx/Lu5325MzwXHm10pP+AVGBtd3GYXgpxLXryh0rZ1ue3+PoDkWaKT1qJS?=
 =?us-ascii?Q?Ox4v05twoHXw/7xfKG672XhNEcf890dk8YZ/Lk1lJTw6qsZE4cwW1caYb9aE?=
 =?us-ascii?Q?V2m8Jgg8WPH+0UCzRWs1zCJDNXpdvxn13+jx5IKtClUha+oMXGZfmPTHqTGO?=
 =?us-ascii?Q?RbGQ/X+epk3GZe9z3zCYxsqP20WH/jOig1a/4NAfPMYueMv/MaUjxRnEXyaA?=
 =?us-ascii?Q?nAwONgQhxCE5gUKktUeMqH4T2OU7axj26XMwLs6lSEy0ow/cLeB0NT7M5yXu?=
 =?us-ascii?Q?0Cps+OnjHBiKikd6GZ1gVf0l9Xo60CFq3raCeN1wds5tokgLjY+Y4EBDsext?=
 =?us-ascii?Q?KZBzuCdy/YsLulOtpN5E0R3j6vy01OQQ0GkdALs14Xv9CPygy73Ipfn8SpBm?=
 =?us-ascii?Q?5DLZnji18eTVakG/3Gam83U=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9415820b-10c8-4c6c-d3a8-08dd567a0a1f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:27:11.5716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgnQUga+I0jayPVPovI9sOy8NRemVFnC2XHY9jJMf2fYWbN+hXCkENumC/ZHkLJkp7TBkrw1JBsam4n4tfGc2V7b7MvYE6y3PdvDwZMicdgfC5tyn0thrHb+4eSpsqCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9826

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
require a different IRQ handler. Update the IRQ request code to use the
handler from the OF data.

Add `enable_interrupts` and `disable_interrupts` function pointers to the
`rzg2l_cru_info` structure and pass them as part of the OF data. This
prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
interrupt configurations.

Implement `rzg2l_cru_enable_interrupts()` and
`rzg2l_cru_disable_interrupts()` functions and update the code to use them
instead of directly writing to interrupt registers.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Squashed patch 15 and 14
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  5 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7e94ae803967..302f792cb415 100644
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
@@ -359,6 +359,9 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_height = 4095,
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
+	.irq_handler = rzg2l_cru_irq,
+	.enable_interrupts = rzg2l_cru_enable_interrupts,
+	.disable_interrupts = rzg2l_cru_disable_interrupts,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ca156772b949..3f694044d8cd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -34,6 +34,8 @@ enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SOURCE,
 };
 
+struct rzg2l_cru_dev;
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
@@ -83,6 +85,9 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	irqreturn_t (*irq_handler)(int irq, void *data);
+	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
+	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -177,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5033c8d98639..8995aa254c17 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,8 +300,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Disable and clear the interrupt */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+	cru->info->disable_interrupts(cru);
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
@@ -393,6 +392,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+}
+
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
@@ -414,8 +424,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
 
 	/* Disable and clear the interrupt before using */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
@@ -428,7 +437,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	}
 
 	/* Enable interrupt */
-	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+	cru->info->enable_interrupts(cru);
 
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
-- 
2.43.0


