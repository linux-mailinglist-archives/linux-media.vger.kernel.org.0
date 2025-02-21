Return-Path: <linux-media+bounces-26611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7EA3FA5E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2BF17DB5E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423AE223714;
	Fri, 21 Feb 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RTN9IlGq"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7201EE00F;
	Fri, 21 Feb 2025 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153514; cv=fail; b=rxMu2K0fUWjkpw1oQ3YNbpUAtGHtLoFhyTSiNz/66Hwl70Uy43Kcbw27me75jwdPbpSJfv2CBGcozh+wA1H3z1FXvacffOeiCzavwILIh1DFdyroLPrhybHuwebcWc0lxPze6ysgzAdL4+6UARK3h5Y7UyQo34B5+fzT70/gY94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153514; c=relaxed/simple;
	bh=xm0AWk27Hxy3Kzr0ZDgZweB03EaI1UF2iJk6X0XJl1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/iNNPZhCTB33brajJpEmcRUdJRpW9aIrKq+NPoXMWrG1yTLiQhPuAwUAX1Wfd5L2awEQIMecFkVfNZVkwbUHuJp83OnRHK3CvSODzm1ZN9onsQCASoz19O4i7BfoFYVm7QUl5EMJwY9GZD7FNrrldc/He40wujbrDB1geo6tk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RTN9IlGq; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igGsAWTGDIkJV142SJwPiZ31rqG3D5J8ML8dYwIkTkBRIwvgw2j6zGFbADh1sHzj6FEiiVGuZibXu2tG9N9AwIcM2CLpYjF1INdF7t3wHLxuUAm/f1L30PZW6fH/GEFTdRui477k/dQel6pZpf2F9FMQfe5AIIH8/5gliViNAzbK29Y2DjtB8IT+M+25noUh1UgH9o95/bCl1gToklAQ/Wp8mofBPDobQ25cihNceGJTYP3nS+N/Hic+s6DOaYx+MtA800pQRhaJPNZ370D+KGrt4uFfe4GtX/09ZmqMxP424/5byXOLHczd/sOnX9xkpoX6jQFB03ZehGek+55cQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bXJv7hTJAADpXNsJl93H+ct1hXv51n/WFZlIjOJCR0=;
 b=FxWVwvs81in6St6m6XayYUkycLsjZ1MLifQrIkt1Ji95bhz21v1Ly1UgmGedUqxu5mSDT14l/aarjnffM6j2x9Ne4Idd5TNbkh5dC8anIKOcodQKz/qkaRj82iWNYZ2VeQ5wPLAap0Ol0QwrX9p7gaqn6trNAnnT/wk335wCUrl+ob0YV1NJg78Vj+aR4OfNbFvxuw18q5E1q79vD1yM8lAnp61IO3NJob9WymzOiMpvdPVXD2jBOq+pWg8zPVEIkuZUEwe7trZQGMZrI8xn9jji+OvJ6ge8MUU9qT99YYuOD+SEzEPrf+GtKaUOiEChpYhZoxjl/lPaGzx/YwqIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bXJv7hTJAADpXNsJl93H+ct1hXv51n/WFZlIjOJCR0=;
 b=RTN9IlGqG2eVwBB2v9UnOb+WMunZj4DlakPO42Kzcxz8YIzkbVh2/kXcbdaMKdW9uQQAsFSPtRkf5fls2mIQTQhVYaxoPIrpy0xJv8HkJR3LlFCWKPVOpfM3CdLRhXHTPgWRFoN1ijje2fR9hQc36843E8BodnqwmI0r5Kipr5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:58:30 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:58:30 +0000
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
Subject: [PATCH v2 18/18] media: rzg2l-cru: Add support for RZ/G3E SoC
Date: Fri, 21 Feb 2025 16:55:32 +0100
Message-Id: <20250221155532.576759-19-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 856e5bb7-6eb9-46d5-a766-08dd529095e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tL/ZzCL/oFn5iLbtJjGKWN2MND1WkbbaH/kkEiE78z2NBr1XI2uuWYuEu7GN?=
 =?us-ascii?Q?ZSU+Nxz7UrbWknAaGC3X0Q62CeiDQcd9DKS2KpimM0/bOF9ZUnOQoUhQRqLq?=
 =?us-ascii?Q?srI0St7qqNgkU9766tsgyRTE2+Ah0ca4UGCedpmHVKdpRqFc5mFHzk46I+1+?=
 =?us-ascii?Q?8wXN09sRDvyYMuGA9eef37MQgOcIdbR1xI8/cdEQvwZ1SbFgL8qZYb3YWOQ/?=
 =?us-ascii?Q?1Im4pg+md16f+UQ41YVRrFRXih6VKadGBt5wdkQcRluRF5lBYOUZo0bDN8nr?=
 =?us-ascii?Q?7wyC7NMAc8g+sdIZPFY69c5qQRA9ij6s8aUE891y24QQGvMCz/x48+G0IUZX?=
 =?us-ascii?Q?+I2HhD+g73oMxUGeFr3e2ZaiTIqFeWNMaCrd2ZZNKB4I/XgwtCVW3hhHbLoq?=
 =?us-ascii?Q?T0dhW3nR9lVtI50ZYKhgKkRvw4wJd3Lx4ThavX26EvUj/uRd2GN5ggyytUwt?=
 =?us-ascii?Q?/wMtm8DY98L5wdit1nZf2JydL6OeHh7lGKVvreFz5+j37XSB1CfZvUUf2cB4?=
 =?us-ascii?Q?0fz97Ag+KSiZFvXsIYj63Bx3N/ZmQz9zfiNgoeF98SCN3g1sYiMrsPntQU06?=
 =?us-ascii?Q?UwEWj4K7J+ofudqwRj26xBgTwtr0vHiJ7Aa6qqw8uLXeWp0egADoqVuggl7m?=
 =?us-ascii?Q?23NWu4v2Xp6VuwKYHVEHoH8dJVsRIY4nvQHS1AMvL5U02HwEqp7qxNQuqChh?=
 =?us-ascii?Q?EbE7UXsKY5WHuYxJNZfWvZQBqm+aoVwHk9q1bumKNrjbVcAyhbNEfWAVmcPW?=
 =?us-ascii?Q?r77vw2iJBU3V9ltmVDbF6UzxYnOWyxRmxdRtncC5jchVTSLA1Kma16BfgUUl?=
 =?us-ascii?Q?4BYT+rOKsxbTQpH5DtG/4hR1mhgRGu0EGuOs6kPF8NTQFlXKxW703xgDI1EA?=
 =?us-ascii?Q?IemmmEM9qByJBO9datg+W4LfnjIhP4dvtq46H9nuJv1whu7t0ZL8ruZY2KWv?=
 =?us-ascii?Q?ZQPLxF9kxSzYEh0BFkHQZBNZtq6Kc35A8t7mJ/h57dw1kDhR/0R8oa10L7TH?=
 =?us-ascii?Q?tfEZoFjDUPOaJilQnIzDerUyv24iQSzgASuJuQcLeq2+DfEDOWPPhkdfSiYr?=
 =?us-ascii?Q?1TXzNZZOmomJDk7pWFwVlFhm1vddkKBj/7va5Y9upvvgh2pzpXX9YEhOfbIf?=
 =?us-ascii?Q?1vx6wMAX69LqBnDRQB2FTz2PWgJhpCk/j8okhl6mXNwSoS+uIaAjSTa82Qao?=
 =?us-ascii?Q?QkFrj0F6ynJ4YFeeg+Dqw6rCncBMmIjFIMSkCkpTynugWVbRwIrmOQRkb+C+?=
 =?us-ascii?Q?k1tRjhIuo5ekvBF5kNr15SOoKEtXuK+kx6ogT+cQMdhhV+GoTki02RwegfOX?=
 =?us-ascii?Q?insqgWmUS+/cUXa3T3GlAGtIfYF10rFhwyGmEvDZv24aGnWh9r6Axb3RAveX?=
 =?us-ascii?Q?qU0qTQcfTHhxLgZoIKMf9h9kE8qMlE1oYtJO0Wc33TKEM6CH35iQsvlbTm3u?=
 =?us-ascii?Q?J01+oaD9TidPSj4UmSx0o7HBQlWqwrmx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rPAoLRIAhgPsqz/9XnKRo/MtC7sc7fttfEFpyPE4wtu+uUB3c5Fxhy98FFHr?=
 =?us-ascii?Q?kpwswu3iniyMhG+QbfSKC94oIvztC0rcdcnlxULWkvqkR6JThPlJLSTYp6/v?=
 =?us-ascii?Q?VDZCotmfkzIz8kdn18d6SXEIHkuk+5UfY57iOQTC/FQE29dXeYamqFtVyBEn?=
 =?us-ascii?Q?AnV2KO2ydMSFahn6e89XzuRNZtFw87sqAgn4fTneEPyaHEWNQYbin+g/0oXp?=
 =?us-ascii?Q?rVY32zma5l2uJwEiW8eAymiirpUqK893rnvaPTj2pXKxo++p1MefA8r+2IN4?=
 =?us-ascii?Q?6JGxj3cBdBS0CXFHPgazq0NWqIKrd4K/RB0ZSMXuWx2SRJvtZFXQ313+a6a9?=
 =?us-ascii?Q?s4nL1HbBuF1y1VkKxPz0cPylk/ruOOvbmIgXnp8hyKhq+vTB+VakZMP6GarU?=
 =?us-ascii?Q?HqMW5SVr3BeqXB4dy5rN/riehVLiTEARZSfO583QDWdYR/u08tRNuxI6VdGq?=
 =?us-ascii?Q?GMkUydwH/zm0GeEVmQl0gT4qFchKIkAd7B0NDYdGfPFJy3ZQudUXntGduE6t?=
 =?us-ascii?Q?CtpbobkIZ69Bw6Q/LPtOFXq4NAihNmuoL0w1NplpBlHjJGlwU4sF0jtNR5DF?=
 =?us-ascii?Q?0t8oR3/2aAE4TfLJUeZqoWEDQ1hsGwYEw2cj36huzflT0r6JKX7Y9LYQQyy8?=
 =?us-ascii?Q?kkc47kgxUypM37uP9EaX+herqjckDACv/WmMW9iTZWBcmu03iKoIyJl7ok7p?=
 =?us-ascii?Q?xQICdZ7gBTdfnntaWu3cFN+/eV3s8Hrg1fL+jdwxE6snmKuwRxMN9e4wf9VZ?=
 =?us-ascii?Q?pSou8vNKcrQD/fdpgyLZ6U5rAmp/xw/MIvBwe25IXId3LbtaXDbs6kJGYopl?=
 =?us-ascii?Q?wzxeTQynaDxT0CmnKhsoedVgJeKqwk/UREhgLFj9Oq4R4T27JEEfv36B2I5+?=
 =?us-ascii?Q?LlrjZjiPqv+nGlJf8v87FvlO51+wJGGkh0G0mCKBXhwIDfLwh2xWWzAtJo2b?=
 =?us-ascii?Q?sux+6Z+uiQ6eqbb+zLxuoTLXbs/ON7ZYN6kgBciKOef9IAeXjA+pEGz4zFwE?=
 =?us-ascii?Q?egUTy61tMvTuaXPci6lFhHDA3US6UWD+heCO8p329JAUbaLYNniPfAwfmZEz?=
 =?us-ascii?Q?NK+64LISOIjC6UBbfanXW9abaG4fl2FhsJSjo8CqvCLVQQmqgT5ZzOkDsn/e?=
 =?us-ascii?Q?SIzNlcICvSoLyJv8dCFcUZU2MIs5ZMmGMvBIPoPENGEt3tvHxLDRTPXH3hHP?=
 =?us-ascii?Q?REDzmvjWdfoTKYPYUHu7ma4AB+cdVlub8AlVBZpSdrWZZvESYJVsiVHM+eyk?=
 =?us-ascii?Q?h6EscjdBlx/2VMWgVPliHJRHuBbHpBR3z4n5zQi3AjAM6WjxOpqWenI5TCTY?=
 =?us-ascii?Q?oT3avAhXZnp0KWt0zn7pvujdFJ0Tp76OURwc3AN/vTP9WSYJCiYtpPCNCWqo?=
 =?us-ascii?Q?JNPCOaQToc+uWKNbNTxZV/p0lZOjUToAxKeRkP6RC+ppP3DTMhdut/7/eIcJ?=
 =?us-ascii?Q?LsNfeizFi40X7U0RFwuOUhSfBPc0LZDjvN7br/7A7pXu6hhETTd5tTFhNtIP?=
 =?us-ascii?Q?b3h/aFZEinSGnMRzMbugpxP2U71ML15DneasUoFjWnxRbFooNVjH0prb/It4?=
 =?us-ascii?Q?PMsLENai+my24uGOgV8lQq5Rc9t0EjfHBlp66/FjRoyL4BXMT7rqMCvb585i?=
 =?us-ascii?Q?GRH92+oohjnRtuDdFr03qT4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856e5bb7-6eb9-46d5-a766-08dd529095e3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:58:30.1235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZF9pEBl+9LEyDuJJGSa8WKV8vArDqbUkBGlsKFGqNoxiGdkYaSyS5VspISb+nfov4bztt4pklUFU5yHd+uuTLgm8mBm9T8FmksIVHzmtfkpdTrtXJVyoY6heviTBd7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
the Renesas RZ/G2L SoC, with the following differences:

- Additional registers rzg3e_cru_regs.
- A different irq handler rzg3e_cru_irq.
- A different rzg3e_cru_csi2_setup.
- A different max input width.

Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
and RZ/G3E and related RZ/G3E functions:

 - rzg3e_cru_enable_interrupts()
 - rzg3e_cru_enable_interrupts()
 - rz3e_fifo_empty()
 - rzg3e_cru_csi2_setup()
 - rzg3e_cru_get_current_slot()

Add then support for the RZ/G3E SoC CRU block with the new compatible
string "renesas,r9a09g047-cru".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  63 +++++++
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  18 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 178 +++++++++++++++++-
 4 files changed, 282 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3ae0cd83af16..075a3aa8af29 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -290,6 +290,13 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
+	cru->mem_banks = devm_kmalloc_array(dev, cru->num_buf,
+					    sizeof(struct rzg2l_cru_mem_bank),
+					    GFP_KERNEL);
+	if (!cru->mem_banks)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to init mem banks\n");
+
 	pm_suspend_ignore_children(dev, true);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -321,6 +328,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg3e_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnIE2] = 0x8,
+	[CRUnINTS] = 0xc,
+	[CRUnINTS2] = 0x10,
+	[CRUnRST] = 0x18,
+	[AMnMB1ADDRL] = 0x40,
+	[AMnMB1ADDRH] = 0x44,
+	[AMnMB2ADDRL] = 0x48,
+	[AMnMB2ADDRH] = 0x4c,
+	[AMnMB3ADDRL] = 0x50,
+	[AMnMB3ADDRH] = 0x54,
+	[AMnMB4ADDRL] = 0x58,
+	[AMnMB4ADDRH] = 0x5c,
+	[AMnMB5ADDRL] = 0x60,
+	[AMnMB5ADDRH] = 0x64,
+	[AMnMB6ADDRL] = 0x68,
+	[AMnMB6ADDRH] = 0x6c,
+	[AMnMB7ADDRL] = 0x70,
+	[AMnMB7ADDRH] = 0x74,
+	[AMnMB8ADDRL] = 0x78,
+	[AMnMB8ADDRH] = 0x7c,
+	[AMnMBVALID] = 0x88,
+	[AMnMADRSL] = 0x8c,
+	[AMnMADRSH] = 0x90,
+	[AMnAXIATTR] = 0xec,
+	[AMnFIFOPNTR] = 0xf8,
+	[AMnAXISTP] = 0x110,
+	[AMnAXISTPACK] = 0x114,
+	[AMnIS] = 0x128,
+	[ICnEN] = 0x1f0,
+	[ICnSVCNUM] = 0x1f8,
+	[ICnSVC] = 0x1fc,
+	[ICnIPMC_C0] = 0x200,
+	[ICnMS] = 0x2d8,
+	[ICnDMR] = 0x304,
+};
+
+static const struct rzg2l_cru_info rzg3e_cru_info = {
+	.max_width = 4095,
+	.max_height = 4095,
+	.image_conv = ICnIPMC_C0,
+	.stride = 128,
+	.regs = rzg3e_cru_regs,
+	.irq_handler = rzg3e_cru_irq,
+	.enable_interrupts = rzg3e_cru_enable_interrupts,
+	.disable_interrupts = rzg3e_cru_disable_interrupts,
+	.fifo_empty = rz3e_fifo_empty,
+	.csi_setup = rzg3e_cru_csi2_setup,
+};
+
 static const u16 rzg2l_cru_regs[] = {
 	[CRUnCTRL] = 0x0,
 	[CRUnIE] = 0x4,
@@ -367,6 +426,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
+	{
+		.compatible = "renesas,r9a09g047-cru",
+		.data = &rzg3e_cru_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-cru",
 		.data = &rzgl2_cru_info,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 82920db7134e..1646d1e2953c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -14,8 +14,13 @@
 
 #define CRUnIE_EFE			BIT(17)
 
+#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
+#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
+
 #define CRUnINTS_SFS			BIT(16)
 
+#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
+
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
@@ -32,7 +37,14 @@
 #define AMnAXIATTR_AXILEN		(0xf)
 
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
+#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
+#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
+#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
+#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
+
+#define AMnIS_IS_MASK			GENMASK(14, 7)
+#define AMnIS_IS(x)			((x) << 7)
 
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
@@ -40,6 +52,11 @@
 
 #define ICnEN_ICEN			BIT(0)
 
+#define ICnSVC_SVC0(x)			(x)
+#define ICnSVC_SVC1(x)			((x) << 4)
+#define ICnSVC_SVC2(x)			((x) << 8)
+#define ICnSVC_SVC3(x)			((x) << 12)
+
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
@@ -52,7 +69,9 @@
 enum rzg2l_cru_common_regs {
 	CRUnCTRL,	/* CRU Control */
 	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnIE2,	/* CRU Interrupt Enable(2) */
 	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnINTS2,	/* CRU Interrupt Status(2) */
 	CRUnRST, 	/* CRU Reset */
 	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
 	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
@@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
 	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
 	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
 	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnMADRSL,	/* VD Memory Address Lower Status Register */
+	AMnMADRSH,	/* VD Memory Address Higher Status Register */
 	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
 	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
 	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
 	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	AMnIS,		/* Image Stride Setting Register */
 	ICnEN,		/* CRU Image Processing Enable */
+	ICnSVCNUM,	/* CRU SVC Number Register */
+	ICnSVC,		/* CRU VC Select Register */
 	ICnMC,		/* CRU Image Processing Main Control */
+	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
 	ICnMS,		/* CRU Module Status */
 	ICnDMR,		/* CRU Data Output Mode */
 };
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ccaba5220f1c..3301379c132c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -84,6 +84,7 @@ struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
 	u16 image_conv;
+	u16 stride;
 	const u16 *regs;
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
@@ -94,6 +95,11 @@ struct rzg2l_cru_info {
 			  u8 csi_vc);
 };
 
+struct rzg2l_cru_mem_bank {
+	dma_addr_t addrl;
+	dma_addr_t addrh;
+};
+
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
@@ -108,6 +114,8 @@ struct rzg2l_cru_info {
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
+ * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
+ * @mem_banks:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -144,6 +152,9 @@ struct rzg2l_cru_dev {
 	struct v4l2_device v4l2_dev;
 	u8 num_buf;
 
+	u8 svc_channel;
+	struct rzg2l_cru_mem_bank *mem_banks;
+
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -175,6 +186,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
 irqreturn_t rzg2l_cru_irq(int irq, void *data);
+irqreturn_t rzg3e_cru_irq(int irq, void *data);
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
 
@@ -188,10 +200,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc);
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 637c9c9f9ba8..efd70c13704e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -138,6 +138,9 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 	/* Currently, we just use the buffer in 32 bits address */
 	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
 	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
+
+	cru->mem_banks[slot].addrl = lower_32_bits(addr);
+	cru->mem_banks[slot].addrh = upper_32_bits(addr);
 }
 
 /*
@@ -176,7 +179,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
 }
 
-static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
+static int rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
 	unsigned int slot;
 	u32 amnaxiattr;
@@ -190,10 +193,45 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	for (slot = 0; slot < cru->num_buf; slot++)
 		rzg2l_cru_fill_hw_slot(cru, slot);
 
+	if (cru->info->stride) {
+		u32 stride = cru->format.bytesperline;
+		u32 amnis;
+
+		if (stride % cru->info->stride) {
+			dev_err(cru->dev,
+				"Bytesperline must be multiple of %u bytes\n",
+				cru->info->stride);
+			return -EINVAL;
+		}
+		stride = stride / cru->info->stride;
+		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
+		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
+	}
+
 	/* Set AXI burst max length to recommended setting */
 	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
 	amnaxiattr |= AMnAXIATTR_AXILEN;
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
+
+	return 0;
+}
+
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
+{
+	const struct rzg2l_cru_info *info = cru->info;
+	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
+
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
+
+	/* Set virtual channel CSI2 */
+	icnmc |= ICnMC_VCSEL(csi_vc);
+
+	rzg2l_cru_write(cru, ICnSVCNUM, cru->svc_channel);
+	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
+			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
@@ -244,6 +282,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
+{
+	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
+	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
+	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
+	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
+		return true;
+
+	return false;
+}
+
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
@@ -355,6 +406,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
+}
+
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnIE2, 0);
+	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+}
+
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
 {
 	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
@@ -377,6 +442,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	if (ret < 0)
 		return ret;
 	csi_vc = ret;
+	cru->svc_channel = csi_vc;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -390,7 +456,11 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
-	rzg2l_cru_initialize_axi(cru);
+	ret = rzg2l_cru_initialize_axi(cru);
+	if (ret) {
+		spin_unlock_irqrestore(&cru->qlock, flags);
+		return ret;
+	}
 
 	/* Initialize image convert */
 	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
@@ -555,6 +625,110 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
+static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
+{
+	dma_addr_t amnmadrs;
+	unsigned int slot;
+
+	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
+	amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
+
+	for (slot = 0; slot < cru->num_buf; slot++) {
+		dma_addr_t buf_addr;
+
+		buf_addr = cru->mem_banks[slot].addrh << 32 |
+			cru->mem_banks[slot].addrl;
+
+		/* Ensure amnmadrs is within this buffer range */
+		if (amnmadrs >= buf_addr &&
+		    amnmadrs < buf_addr + cru->format.sizeimage) {
+			return slot;
+		}
+	}
+
+	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
+	return -EINVAL;
+}
+
+irqreturn_t rzg3e_cru_irq(int irq, void *data)
+{
+	struct rzg2l_cru_dev *cru = data;
+	unsigned int handled = 0;
+	unsigned long flags;
+	unsigned int slot;
+	u32 irq_status;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
+	if (!(irq_status))
+		goto done;
+
+	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
+
+	handled = 1;
+
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+
+	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
+	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
+		dev_dbg(cru->dev, "IRQ while state stopped\n");
+		goto done;
+	}
+
+	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
+		if (irq_status & CRUnINTS2_FSxS(0) ||
+		    irq_status & CRUnINTS2_FSxS(1) ||
+		    irq_status & CRUnINTS2_FSxS(2) ||
+		    irq_status & CRUnINTS2_FSxS(3))
+			dev_dbg(cru->dev, "IRQ while state stopping\n");
+		goto done;
+	}
+
+	slot = rzg3e_cru_get_current_slot(cru);
+	if (slot < 0)
+		goto done;
+
+	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
+
+	cru->mem_banks[slot].addrl = 0;
+	cru->mem_banks[slot].addrh = 0;
+
+	/*
+	 * To hand buffers back in a known order to userspace start
+	 * to capture first from slot 0.
+	 */
+	if (cru->state == RZG2L_CRU_DMA_STARTING) {
+		if (slot != 0) {
+			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
+			goto done;
+		}
+		dev_dbg(cru->dev, "Capture start synced!\n");
+		cru->state = RZG2L_CRU_DMA_RUNNING;
+	}
+
+	/* Capture frame */
+	if (cru->queue_buf[slot]) {
+		cru->queue_buf[slot]->field = cru->format.field;
+		cru->queue_buf[slot]->sequence = cru->sequence;
+		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
+				VB2_BUF_STATE_DONE);
+		cru->queue_buf[slot] = NULL;
+	} else {
+		/* Scratch buffer was used, dropping frame. */
+		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
+	}
+
+	cru->sequence++;
+
+	/* Prepare for next frame */
+	rzg2l_cru_fill_hw_slot(cru, slot);
+
+done:
+	spin_unlock_irqrestore(&cru->qlock, flags);
+	return IRQ_RETVAL(handled);
+}
+
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
-- 
2.34.1


