Return-Path: <linux-media+bounces-27072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9348AA464C8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A623B7D43
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DAD230997;
	Wed, 26 Feb 2025 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MV26heHc"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1813227BA4;
	Wed, 26 Feb 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583625; cv=fail; b=m1K7fYABR/x/l8bHx5H07ZBOe4HIgoTZp+lch4fZ8lISRumJLb9I5C6sUo7tnxYQ0UmcXUhovmjBNJIBZisfJpEgcEruyj957enpiep1y4UCdRRfimbQoRmhHshNpjv7etlvC5Vj/Fvy4qT60CTKP+CwoQXUZerT9eOJrnVeRFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583625; c=relaxed/simple;
	bh=5uvchA5nH03kiGbMXqq3m8CbWhBlFahJRNj26wjaNJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GE5e86kBqll4rOVXFllTCk8JbpiSGDcAhOX9brhjgv2lGCFincrDX0dROse8QtRVyjUm4gEOI8kWNdpI2m84N5XEfgc47pIP83EU4nkQLIfKwv66QoUSh2kJvd9DAM4dPzdjIu7KcAsXUrAwfwzN9ERYge3FOYmkmt62Di3aniQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MV26heHc; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcI2IEczp46c3/913PuzdP85lrASfj9iJLcixCSfAVsGwpfqK/4ljy2vesn8LGR/Sf7jRejXjkWtvh9BJ2NwfamuTP4Bbb8IeNWfGKsFTrPNX/4OawnDDXr5VAqs8jw58H7H/qAb3+HQxZTMLWnkgNw8QUif6sbIezc4VKmKRy706/SPn2LFk0D1adQpML709VZHBfTdPBuGJXUeLfcDD3LVAQtnimM+AuQAm6e7ezQ7mJfYAJWKyExO6woIYMjWFu+OQa0Hrk1DHQc4+Pb4rlgp7mM6jQpAd/kQCWh1SrhkxbnbdxS8qYDObbOTbGTc4x72tlaUZVMpDg5YA6H/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MiP5/sRjKZ1lKqYtzwX6HFn7IU/Os8AGNJYk9K2eF0=;
 b=yV7f6/xxhwJ5UXeCg5RjH1HxVgHAhwD3cFG42CFyRqVxrYLeg+axvXA5rLmG4CGPCgxhq1B4bIaahDRuEcxBGeFLp1aW9NavzDHYrIUxWDZL5WDNW2QiiIK+vpeGpucfOhHxwoV1L7fWhWXLut+xdBJX7XJKk5OUyDyiTcOC++UnSRTMPHtbH2yTK8cG4PDaY7GO5QUQFU7lbhBQ+0/mMz0B64JmKkviIQG80GyllfT0RmedXu8Fj/MHy4KP1ilHi1fOljDMcvJTOtPkn3LcFEWed/ub8QjPiupQ5N3swbl3LWzIVC5ixLyDDv/kzspHoK6cUhgwrA+MFq0cveMvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MiP5/sRjKZ1lKqYtzwX6HFn7IU/Os8AGNJYk9K2eF0=;
 b=MV26heHcZMpiHbqxTlfjVFGqSO/emNNCXPEkWD4j/12D1xi4Bn3IjnIdcOCFamaBuPATuw6QaQDSP8/7Cet4S3n6fyWQ5BaRAOJxh70qi8PtXaf+pnThewGyloRfLe2f6ma8rEXa7mb6zSZv8DjJIApgZd81AfnWDmccCKZcSog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:27:01 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:27:01 +0000
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
Subject: [PATCH v3 13/17] media: rzg2l-cru: Add image_conv offset to OF data
Date: Wed, 26 Feb 2025 16:23:37 +0100
Message-ID: <20250226152418.1132337-14-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2bc7195f-e8d8-4266-1d05-08dd567a0436
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BKWiO2j6DyKLQ/h8xI8dKq9nixPVnnMmqsPWh4PftiO+sTBfdp6Rhtc8Gr1U?=
 =?us-ascii?Q?oHBaiEkJCXPyXbHBhNwbdehuxiaTN1hQDFENpcJvjPuJ9PV8+Npojjy+Xpg6?=
 =?us-ascii?Q?tkfgo2QornizldsIzzw7oYk5kO5ksBT4MRgQOBb3RYAEiXZSDCC1Yk9gp0mo?=
 =?us-ascii?Q?N9u2/c5v7/Vm3XxhXWFUq22mGt573nlhmpyaPFm6P187sQVI5nx9j5cikOYh?=
 =?us-ascii?Q?LARb4UNiREAm//Fp3+DLKIMIUuIAuveeUnMrLS8J+y+AhVlntyzPa7xbOUP5?=
 =?us-ascii?Q?5JEy7PpylyIoBTHiaS4P1/h77nJ9GybxDBBzu73cBTIazohLocRTcNKmYpgK?=
 =?us-ascii?Q?WAeI1LfUCfFCfLzeQVbaKZSjYmds/t52sHSR4sgSCMq6eGwcwrUKBL562Y40?=
 =?us-ascii?Q?7v0wh9hUyY2Jvg0WHZ5LbYw62Xl0j0XvZLoY5Q8tKsDsdCYqKbchv/uW+R70?=
 =?us-ascii?Q?UXP4a3I2TQuX7DqDr1Y6muoW/X75TT5XefaIO+hvCHNgmbwcaXOZ6eb2W+R0?=
 =?us-ascii?Q?iF/SZjKVoUDd+BuINdBhKbz3cZaECdXMITLlcS5Zw7yf+5LEsx5RUIL5wbGg?=
 =?us-ascii?Q?MdgY4h5OukrVKBsNS0+tO/lp609MmPCnkgwfAaR4ulDBl9TBZxZ0BP5ZTRI1?=
 =?us-ascii?Q?/xRitIC7oZTs9SoD7eC0omrg/erV0jgCr5nuQX1pBimr94MhgUkYRJfz2lYJ?=
 =?us-ascii?Q?t3vgatmboIRkpcqDZL9NwyfK44FJERHF+NGBw+LOY6LRrylz6vGAMukVJ6bQ?=
 =?us-ascii?Q?5hX/64mUqn0pljgjA8Mo8fgdNNlcX4Ksl/qCaAAL1y8N7nNkaZ00tmQxIpcu?=
 =?us-ascii?Q?Jy8MmJSP+YASZM+PwU4JmLkOePOwdrIn/5D1JW2wOpqj8yBXOzBQh+aSPcZU?=
 =?us-ascii?Q?KA+w+0QXTukz4V2HuMIZblAoDlUdsvVBMGqmrK6lKjdqPiJVr4/Ndk+kUU8x?=
 =?us-ascii?Q?GidFwwhH1AM65so8LPvOIbqsRM63KWOgZSbC0MiC8nWLbpGsq6uD8M5gfq/P?=
 =?us-ascii?Q?HX1kUVVCNsnW+efIoJh8KO/NKPKoDWBK55o/O352fz0eNUbsvDTarfbQpXkI?=
 =?us-ascii?Q?5GNOTl7ieG6Fxwh9RhZf833ss2E759zkRbuBA7RJShMkyQy51NZsT7W5Kvuk?=
 =?us-ascii?Q?WXVL4qnym0RRBM9txZWBPqGF/vPEB9L9tWtTZXc8ZJXAH0RSB0aCfmLw9Fq/?=
 =?us-ascii?Q?13xJcYPtNWGzpsAspz+1y6SeS8/zKK/XM1ReKgsghQmdOT4u8Rn3W3wWea+R?=
 =?us-ascii?Q?/6RVktqcBo9Mw1/MTRH5c2frErM8PTRNNGMQg/TPyci2iUvtkclXEsdRGpSA?=
 =?us-ascii?Q?vK6pSjKw6Agns/pT4iPAGlQ134M+A6+3sH6Kb6pzU8GaAV0yLCcxvhaIcdiU?=
 =?us-ascii?Q?+KZmbNKAAXQKCkwKa7+tK9kSsBw/52aLuc791ytvv9c7oF3xFeakeC99GS8x?=
 =?us-ascii?Q?ky/1vECLFOxyf/aQv8KVsArn1NJ0WKdm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?81gZLaoGhGSCg+PS14Wn0pqZVJULs5tViuxN4GN9rUup0DrPZ9Ikc2a5W0nF?=
 =?us-ascii?Q?2eZZCEuBp/uCGeRjJFyAAU54dCDy2TsNn+TEZzPxrD3+Bj5+P842PUSWyODR?=
 =?us-ascii?Q?eKEd4m6IgZKjaFRP0RPyyOtxUOeVt2PnA/QvAsLWhiI+N7i4hhyDpI3rJlqN?=
 =?us-ascii?Q?L1G9EpbP9lLukBwzKQXLxjYmD696NqFOemJV/GoE7Cfgl/nakC86CxkJrWTl?=
 =?us-ascii?Q?AfksCJu+SrKnPQuNc/P1afb0I3eUO3qP737S+RA6qtXzhMktkVhI9ZTrQL0S?=
 =?us-ascii?Q?Bx/tOBxldziRbgJpnFLfS9zSBaxpRrVzu7xMOeH8ppuh6WMbnmWmiswb9ugn?=
 =?us-ascii?Q?FC2Pp63UEvIDbOX9arwEWe97hQDrA3w2TF72c4EMil9GNvn703M+hebw6c+v?=
 =?us-ascii?Q?CqnnOYQzBbvhiDsF7voJMpiBOy3ORR9CywoUGAyv95O5+TinHDrMu4b2DqhY?=
 =?us-ascii?Q?WBDRJuY4iOf75pq+aXc6BxdaAmMlLdYinU+sKl93foM75h28dPR8NTPaPbQT?=
 =?us-ascii?Q?94My0zPM7UEytJ6MQJkeeVzQ3C6Z3KrczMkWegmypDxa/y38YA5kPxOlRucj?=
 =?us-ascii?Q?8t7Yv/q9EPvZzdJ3WaGCXE6MJ7ezJsB5zntY1esN8ZHD8MToCNGtq+3k1piC?=
 =?us-ascii?Q?rupWbcpkA5pAPxgquTesgfpDNAv06AFGRJWdEYL35zZpHC1bvtlWhgmU0Q+b?=
 =?us-ascii?Q?uZFIl4oV1JtzgAgYXe1NKY8KkWTXCIz4aA35Ppx58tyglRvDnexys9SfPbfq?=
 =?us-ascii?Q?O7spTmlRJ6zeZ12FxcKQsbmHEqH/eFotb14ue8JCazvnYrJeG3rwzeCh6GMp?=
 =?us-ascii?Q?EFlkxR8a7SsfqfGFWxU3EcGrNDg5ChnurDNW5ygg2NDM/MiAv9U6eovY7BQb?=
 =?us-ascii?Q?9i0ydl8IwozXK5yNuM6h39TqiO9e/NTXO2+PAQIs5BcJ3+1cdQB6OwXB2L/Y?=
 =?us-ascii?Q?U1Gbqn18PiD08a2wk+i5VpHE3mBVShH3g7oPUm2v5lW+c30AHYN8ODBSizOi?=
 =?us-ascii?Q?WetGkVQt2yVwjZB731uL6ONDHwsM5aO0Crkqdyqa3/bAtg9TVPoBeATvFw8P?=
 =?us-ascii?Q?ChuWL/SLZt+GC+pKmESNwRwZ3BOuPknRcV4qt2caL+y/owLL5xiy5RKnCCq0?=
 =?us-ascii?Q?8ZdYj+cLPIIpGIEC+tCHQxFSDb4ITHoB+cMJsbrrrPWXQX3ReMSLBisGtzCG?=
 =?us-ascii?Q?HUBfPJXVN6RVhZrTxxCoQ4AoHtg/YOBg3GVDAX1DwUa+5IzqkJEXgtQUkGwM?=
 =?us-ascii?Q?XgUMvVj338ai6TWpAaqMYWDTqY05BtrmOtMFWmR4eNyArC+v62rEwzMsJvwM?=
 =?us-ascii?Q?Rc5MVAU9eMt/RxAwfwqh1q7c+Q3vTdP6CzcI5MfdxoC6kDzzb4tjYEFAkTFn?=
 =?us-ascii?Q?e99lG9MkwYJjfzSU9E1z/rCSFimVdubimRlC8ZKsftVYnTGOJ5tykI9NNaiG?=
 =?us-ascii?Q?Ez9MR2GKMx+9xT8WeMCJNFWOtyZ1okXczJE1YzVuWSaOoU8oP2GT5JJx0de5?=
 =?us-ascii?Q?Rssww34nXf6xcAxK5B8pLU6vZyngGhikXAaOpWoim+awheM1tjvJzy86eBJA?=
 =?us-ascii?Q?SqQUArz7h3k0MmXtfOcxDbkcIkbyNcGO1GslZAOMjFumKjNESprFCQN4G5a8?=
 =?us-ascii?Q?rQbg1dSliYu23Z2gr2z2b2E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc7195f-e8d8-4266-1d05-08dd567a0436
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:27:01.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGfv77J5gakC/BFBdOE22+k5J80rTlBzQW3qzh+PEiUVI9Li3dElVn7djEMtsHaJywEw/QQHR/IKfnyYhLAcJ0D2D4kaLh/QemuamjKFT+iffyYDRvsx/UquKmL/y5eP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `image_conv` field to the `rzg2l_cru_info` structure to store the
register offset for image conversion control. RZ/G2L uses `ICnMC`, while
RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.

Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
to use this `image_conv` offset from the OF data, facilitating future
support for RZ/G3E and RZ/V2H(P) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 19f93b7fe6fb..7e94ae803967 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -357,6 +357,7 @@ static const u16 rzg2l_cru_regs[] = {
 static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
+	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 6a621073948a..ca156772b949 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
 struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
+	u16 image_conv;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 93a105dec8f1..5033c8d98639 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -246,20 +246,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
 	icnmc |= ICnMC_VCSEL(csi_vc);
 
-	rzg2l_cru_write(cru, ICnMC, icnmc);
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -276,11 +278,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
 	else
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) & (~ICnMC_CSCTHR));
 
 	/* Set output data format */
 	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
-- 
2.43.0


