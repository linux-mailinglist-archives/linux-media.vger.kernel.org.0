Return-Path: <linux-media+bounces-33351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40157AC3AED
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9C567AA8FE
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649671E3DE5;
	Mon, 26 May 2025 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oXfcehJ+"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC131876;
	Mon, 26 May 2025 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245990; cv=fail; b=MG7cRNmsS8eawvu64PsYqkn8tHtxmbVZNBUU3hFp8Meza/et12DHeQhmIiHbeqo8tmk9WaTKfj/ewUKeptz7ZEn1EIKvFeVGzFZoVpMD519wQlvNkyFFjCrqu2YwXKYS3yzNgtpa71PbKwBVWvRRhJKFoQrJ4aNmCLkCOeW2WgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245990; c=relaxed/simple;
	bh=qMuVJm39Kmxy2HT+wSNcjw8rcvMaCJX5igr7TqNe+ig=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=paYXMEVvJroPHIcn5Zc6CoSFASAsgDNLQIzCxlU29n+hAuuQVxkD0iTsR+w2ZTKxWizYgv6iOYHLIExTmEKNpzQb6wYy97XVL+vpQtDn0d14yM3FhEBQrOeF+ozAPvGCIlG0SGmXHcGV7ZHPHw1I52r8oclTjSVi57YONCzwDOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oXfcehJ+; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uj6gOQuak1UGehaaBmw42j5EFhwwMrV4oSPL78vUXeoVDQ9Xpu6h8Sc/1naY8a65bZRDbZNpnQTvnlN9owGU/e/QH6slFIBVSvJHGbtzn6fAC1UrLz52QVKicALJ0TDz8WqjFAIjWRG7mrgb7r501mj5wxMShBmFQpA7LqS9UkqrYrrkJRryHL6hTOPOxt5D558HMRuhy/Onp6Vj7GsF3lNdApB9XwqP8LThbtFJWJAGonj2Xl5VTScJCgEDIoGVrITI8/mCjh84lDWPk5sz2hG5sGzqh443vhhOuFgJejqzXk7LicjZtqVDePJd2bauM/fJ8pTG0zk5O3ht3Z0aNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/yKaMuK9jlizY1CiXqNNDSAKZ9yrg4iR5bHr+IyuW0=;
 b=HrAvwtWSOprgYpeFluK2RRwqrSyDjQI3ZHsJLN05upbN/BujGcyW5egUvmKfSidOAOHzM/lqoTQ+nvLCewBc90yI1PY7OOUSkBZEQQ9Zterhou9ciUHe9YaFbDlNtrLPvqBj5wSZ3/IFb4Wp6NC4+gmtudW6YO78uHk0zCLTsbG2pnyXnjK6JB0djNR1gDp9mGwZkSw2jt4pYVg+EfF81iKYMwFUJeQpb3X8VqNiSTZYECeTr1U/+9cpCStMNDF3dvzusBNE1B17jZz+qYW2P3G893fjNSAPcl99WneFv3upWqPTH6WTMG3oryVLh03B3MV64CaJyHvDaBBDzk2mYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/yKaMuK9jlizY1CiXqNNDSAKZ9yrg4iR5bHr+IyuW0=;
 b=oXfcehJ+N0FmWwwzLm1sp+DpmbFhH2obxDbUpaHXcELVDrhsPacmg2evvdVkSVNw+lEPZl4nXQDExpQW8jBjugWP/iaCcpU6RRPKWaNI2tKKk3tOvOZivHvvJiiO+kg763KZo3DqMlZxDuYmv/RFbCHVIcgzVRBpE+g9l/huyxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB9330.jpnprd01.prod.outlook.com (2603:1096:604:1d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 07:53:04 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 07:53:04 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rzg2l-cru: Fix typo in rzg2l_cru_of_id_table struct
Date: Mon, 26 May 2025 09:52:33 +0200
Message-ID: <20250526075236.13489-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: c9674748-6648-4283-ad27-08dd9c2a585f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VAKbsw7Wry9kZsuhzwCBMk+bqpx8djRo0fKkdWDUqOVeeUG2YOyKeoLjl79p?=
 =?us-ascii?Q?T5IBZusxH8bav1tMSf2228bXavP0WUKxsqasQfD3pvoEPJbqKc6YEhzwsy7X?=
 =?us-ascii?Q?DTMDu7QRpdD8/eTPM8l+cY3MlI7gSP4TKhq4tBb4q7CNwYOK16Ph4AHmAB7E?=
 =?us-ascii?Q?YYciKvHEniqyRfhFW/Jzpah0N7IfbdYrlcSFt+cedNGHJd2xu932WHA8s51p?=
 =?us-ascii?Q?ZPMdMvO8dLSfllCN4jM399jQzpom8kehmrEVQ8Vm4mZyaI3rChXbnF6yxKpa?=
 =?us-ascii?Q?1B+a0NICrUMR6/I/bzO7PXR9vvRaT9X3ALzGnGw5jp8FG22Hk7r0FMrCPwXB?=
 =?us-ascii?Q?AkABJSlg473ETAa/gIvGMfaOdmp2rZy83cEtMdIBSzvbsjMql171SErifJRF?=
 =?us-ascii?Q?dCIEYbuT/S90+IMeKG8N0a7HxlfkPMnJ8Qiqfe4Hhevhp9K+fMQ+ljvqVyWD?=
 =?us-ascii?Q?4W4O2pMuy29AVBjGDQu606Ry+doDQBa83Q9Eexf3K0DdVzMpw+ie/1GqQ7R3?=
 =?us-ascii?Q?/9G3V2yiWtM2sPsda8G9M9lYY3AJE6a09EL0GmCVcfc0adUDrtQtrMbbLStM?=
 =?us-ascii?Q?XOWRM0/zkXBEkvhYnN4o836ErjL17GlZskw8nzrGOe/pFre16TqzpxFnCfQy?=
 =?us-ascii?Q?oHSTgvhjD3HOT048g4EpZibapcltA2bSIM8Fyy3LATR5vFOtYlACRAmwj3by?=
 =?us-ascii?Q?vUkqknypwUFNjaEo+yVq3KskBi7TE4Okh/F++tgw5O50eCd+DVzNWF4P7mC+?=
 =?us-ascii?Q?U0yh/C5PzZUMzRMvD39xP7pCw2toH3ULPX6ITszDLpaEMeb1VcqNJaywwVpO?=
 =?us-ascii?Q?+O3/AQdnUMl5igoN6aK95pepxiPkCqrYp9wPNQLeO/CQ96ie89dSXg8gAtaM?=
 =?us-ascii?Q?4fxFxxU0oZRnQVvPN+BhkrA6zYon8/m0tHwvWxAH1miVv9G//N/EWEuCXj31?=
 =?us-ascii?Q?IPpD9TxJAtfUPEvLss8ig9zuTwxNYFn9BdicfxFPMZJanxgqYDiZnpTyNDZ9?=
 =?us-ascii?Q?N8vyr3lVgs030KhGR3v1MTnu2X31le+QM3I5v/kAC72X7JJOG2zfzbbUnEed?=
 =?us-ascii?Q?kYNOwRBzUxMP7iX8YJRONBrb425FieupRhurBJfH4/ReoKhPymeUs1tbW5ri?=
 =?us-ascii?Q?p9ciDKcFA+lHYODsepGHhgk7DRxdM5NXhpkPfC27kF+726OZrInCernMhzsy?=
 =?us-ascii?Q?6LwVUc5z5jNQ/2ZCu47G3RSqKRHPpgGKVAoU8KVTZPIz6jCJD/fwKEez5L0G?=
 =?us-ascii?Q?JbCQLcphXP1oKk8R2xqvyElqZiBfcgSqxIBzyHQeYee2IA/2kOtWSvVsuDwn?=
 =?us-ascii?Q?AF8NL+o1raMYSriQFicQERw+3aIWhj+L+dW2K/88lge746ibrjV3mbe3c/WI?=
 =?us-ascii?Q?nXsIsFZKXaKfFyLTUWdQx5Pm6uUj+xGgO7jRdrcdRq5uYCjaiF2Z3Stmxxd1?=
 =?us-ascii?Q?FqV1vHOASvDCWI0n0EuyvYZZj4wdE8/FG0V4aYcJoXz9PzxWh5ah3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vKJvaVdfNsiMcPB9GPGRMrYzKKVz9kcz++iASpWXGJF0TBgalV2AqTEG+U0g?=
 =?us-ascii?Q?QclViG23yc1Zl6uLzSX/pFCFGx1uIi7ZLU9ALr6ag3CkQ6NeUc+63avg8RwS?=
 =?us-ascii?Q?FISBQl+9/8phHUg0oswqj3RXG7CSeQXsvoZXntgIHhrAfATJbwBuTjOuge0V?=
 =?us-ascii?Q?pWX2/y+74BcJpu8Tm7u9VS6cd0bWp51bMJjKgxLilCahCOxUGvTbyrGSbF5c?=
 =?us-ascii?Q?spj4cQlQGySa7CNRVUgh4GgG5RBS1i/hLTcV7p5axY1bP9wLJkbBfFRZi2CQ?=
 =?us-ascii?Q?tKV5UZsxsrna9ZJRK+nulpJTXkvvFwtl2ZhUNPHbCyrbHNh+6cqwsEBIViZT?=
 =?us-ascii?Q?ocP0npjLIVeJJfDoZDWuY/mDlk2Fv0Hxkzd3s/CBXTiRCaQpInYewzw2r43H?=
 =?us-ascii?Q?8/Zspc2xSz6ZPJbEKTEmUwJrp84m/K7JyYVRYnfUn9ANvuK3+W576IF4GG+U?=
 =?us-ascii?Q?TNWEDnBR4ji/Ik0r3q8+SBvKPn4sJ4yMRP9rqT5u8MYeeEy4f3/+nsJUFC5t?=
 =?us-ascii?Q?Scnb45oGkCuP+Y4N0L+F8jcpZLRzSwFvSXxxbBD7NAcKmIPFCrvt/4J5NIFP?=
 =?us-ascii?Q?mhuaOEnOta5ywlQEyXjh1QHyJrWs2IJkThSUwFF8+SCHgfuAwvtGS0LNJnJM?=
 =?us-ascii?Q?T5zNtCJsSo2Iec3yif98HInCivBS776PnUgK92dKwZxsYGjg1IRTpphxt+8/?=
 =?us-ascii?Q?0W9Hw6Fg58EZPY/y6VXfq3WbUhSrztzaVXwkGF/HguGJA9ybe6SUURBpoOYS?=
 =?us-ascii?Q?Rwd2Psv1nFE3mMAc6q6tF67eoquFZ958ZbbHSh3+U1sbqWyeL5uQVSXO1kDh?=
 =?us-ascii?Q?sCNdthZZ9gjWVhF848GFV9AvkPYx7QTKIwsgDAnJ/ieLeURZxQmgSEI+p/xh?=
 =?us-ascii?Q?b8/6Ua1qLAGKAcdes9FMLNiDgeZ7x+GTYgGUiHTaoNpMSrk+6VDka0lp6lGf?=
 =?us-ascii?Q?FwYXFwWIgwTDYbhKYbClLc/UQTdhu3LG9jeTFKeKqql0UKZOydWofwO1E+JE?=
 =?us-ascii?Q?Yo68873ci/wpxih0S0qinxGNMfh1MxPYlI2IY5QNzexeiQh5dEkYYqiFOBG9?=
 =?us-ascii?Q?CJ4/ArOqE4lAGgEsNpRf/GFgj4zrqBzGWzjahxe9aufp2a1P0t1WxEMNb5je?=
 =?us-ascii?Q?zGRYjbYW3+i++meOmRdncy9McMC6k9JrT2ygNVP90NjidFUxCRy9SGWN7Y/Q?=
 =?us-ascii?Q?ne1w7ZageNdxTrncalIeNCCpXjO31t/1uAZ5riSXpIihUTkcVCFwcmHLe0Th?=
 =?us-ascii?Q?t6Xt9aNJ7fdbNh11qzF7Cs5uIlyKYDS2EDDKcBHcQTitQoJrlglyTqK+hl1Y?=
 =?us-ascii?Q?20zch8W83GdlXvApmUd47tgj2nxHURO5YkWL2g7EUrPw0rvyCCIehfhz42TO?=
 =?us-ascii?Q?jsG41XWpVzzlkXrShOVzqbHbfQLS5yU5etlFPvPjaW4sQTMZ0heVZOiwPsQ1?=
 =?us-ascii?Q?ExraR/N9dI2FQOIJLuAohODi9PyCo36PPyFX8enCJXmiH7F9kVhljDjkANgK?=
 =?us-ascii?Q?RwUbHJLixAb+Ii7FGZD9g1yj9RwYpaFKH7wc0Bha/KtTErMGA4FN34THrpAE?=
 =?us-ascii?Q?/XsMBQ3+JHr8QTe6Wkx27O7/w0e5C9qzY7bIxaL88Ttmy2DWwMqvzESi2M7f?=
 =?us-ascii?Q?mUxgyo45erCHkEalBwuDMNk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9674748-6648-4283-ad27-08dd9c2a585f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:53:04.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZk5teYKjzdFvnki1h2a7nar2VOWrPr/+LCnQiAiKrq9eOU8L5uyKICtIFdTMtq+5N8g78vFXrzQof+K4afJ+3XEEkYZsAk0avS4J+4V0M6N67PnUysIrbsrKFOHNWWE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9330

Correct the misnamed .data member for the RZ/G2L CRU. Rename
`rzgl2_cru_info` to `rzg2l_cru_info` to match the intended
naming convention.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index c2528cb3ba4f..a1ae662b2ec6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -421,7 +421,7 @@ static const u16 rzg2l_cru_regs[] = {
 	[ICnDMR] = 0x26c,
 };
 
-static const struct rzg2l_cru_info rzgl2_cru_info = {
+static const struct rzg2l_cru_info rzg2l_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
 	.image_conv = ICnMC,
@@ -440,7 +440,7 @@ static const struct of_device_id rzg2l_cru_of_id_table[] = {
 	},
 	{
 		.compatible = "renesas,rzg2l-cru",
-		.data = &rzgl2_cru_info,
+		.data = &rzg2l_cru_info,
 	},
 	{ /* sentinel */ }
 };
-- 
2.43.0


