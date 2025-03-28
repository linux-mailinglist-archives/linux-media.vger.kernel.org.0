Return-Path: <linux-media+bounces-28939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63DA74F50
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C9E117390B
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADE31DE3C5;
	Fri, 28 Mar 2025 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="i3sqpgAt"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F81DE3DF;
	Fri, 28 Mar 2025 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183092; cv=fail; b=tc6Uvc7eUxUYVJe0bv7/Ouq22NPl98Zqp1G0wE0xVKvGEMynzCtvYWRyQxOA6Ya5YBRMEyeAwGOmxbO9MBTQWJQE5ZyhIix6UAGGHauT8bPfXnhvQD7YduyLstsMgYQ4ZtGhUbiOyKgpocO5j6qX6hrQTc9Ac5ygEEbfVKfSDu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183092; c=relaxed/simple;
	bh=66xXUnrKZNA3NU6Ssqm6z65XlrTcnHLH1W3SnVeC/48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oXNXIM2fvQMOG4GBK4e9b4T7KeceLi3nQOVxVFrkI3doxHuOH+6Wd4Se19fRw0+fwn29el6CiiEGKeBTB3VrIZU69tDzRJ0Rz0j+twT5fRzlaLaH7BoOoX4Jp0p/b/RkbB9yLLxCqAeX8lPHkq9fjd5RQ1R41xDKJWr95dxx7hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i3sqpgAt; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypYQp2b4bSJNb82nlQfbQI75Hhv42V0re4ELaaD8i99pNRMB3D1I2lpoOH+BQMcfGea0bnu579ae3+npMxFiMFi2qBep+k1PTJbPbGjyW5ltDwejPGVdZCzHZ3edqAtIEUrOrzRrOQpkbrIO5j7yxM1hCrbrcoJJ9oikHPu3frj8FhEdCeq0PNwU4eEFFKvdRvpShUZ/c8IisBKNNI0XElLzF5kJrw7LN9Fq6aNU/wXXaQuN6ufTIv5OjAc/1uDgFbzZ2f3U9tcOr29iCiPYJEOKmIPvbb7cpkvpH/sUmkBoGpRlNVj8QgJ4NImgqkxtzzs46nyFxj1cpRXEizyMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omc5F4uisa8utpUKhjmd6yIlHr37k/GjyLMcJmSW1zI=;
 b=VyUBfa666zFHgp6hj6sTsLtEdzA0iRrxvaAa7Lv5BbCAjr05XYiiIQngF+jXOHwWVbOl+ToW6OAciF2UN9iXVJju7tma4GZzUAL9tUpUky3SBrAqPXWb/OQJpZZ38CkFRPIiwHTYBmpueWbsHk/51vJ+4Oyyo6+Vrda0HEUMh85TyMwkGttZMPHvLRlxInNV9KKLWH1LCuw8DUwZMNd7jNJsxajr8PTcVJyNthuJgTsySH7r1Rc4ZU2PNQDlfTPpKdvhbRxjfEz8GSR+uSZivXZeoPj044QB8JGm+OWZPBj57iH1JBAt1q/bUSYrLKvBkYzqcgu9WMhqvwP47emjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omc5F4uisa8utpUKhjmd6yIlHr37k/GjyLMcJmSW1zI=;
 b=i3sqpgAtHlRxoESH4IXJxX9MbqTkAKba0cWdwuzj7TN2NCTJDpWDZUpoI7hlSWeWIwzjCttXinOQYcf3DkY1gAl7Zjv8iKvo3yUuNUWSpaKxe2s84PKNmUOwuOvVJk/e/KIClMF8ci7n+CgY4laoL1FJJSeFrtDX4O08TdNTCsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:27 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:27 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/17] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
Date: Fri, 28 Mar 2025 18:29:40 +0100
Message-ID: <20250328173032.423322-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a84845-14a3-4cde-47eb-08dd6e1e5eae
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VQ6ZAgJeHME4CbeBIYSX+MbwHz+321Ks+LNoY9b1R2i7wjwWJzTj0Uv/osjY?=
 =?us-ascii?Q?W8gCd4k5iRli30Ksw4Eill2Qvsexp1VSD72GltVAGgX3CyshxVs57KuKtyx4?=
 =?us-ascii?Q?tVAs37em6STSGSTzPafO1t1NXHd24R0mG4gGcq4bhBPikqWWWpxBviaT5JZ8?=
 =?us-ascii?Q?wDMMQh7dMIHVJty1gWa9hlEZ4lX+NaJJRi6ad5GMK5RRe0Xbu4qTnqwJUB2X?=
 =?us-ascii?Q?jOPsKbWNQPoaHApJPpxaoAiRqYAr1LR783Xff1yi+vswj+CFyrmdaJc5RnuN?=
 =?us-ascii?Q?v4DhUs8xXDpm4QNLitoWvo4y2AT++qX3F8P4/vV3xgfEtmvQJhr/e4WTVIKr?=
 =?us-ascii?Q?be6hCmLq/EB4rMpCFDWy08OjNuIEjtNo/HW5PsYryFBMg5DPWbZTsRzjlscX?=
 =?us-ascii?Q?5veEBQoE0PoFSp8W24NpdAKSgKlb4UdS8Rtsu50s1UrZKeZxXXlfui0/yyxx?=
 =?us-ascii?Q?m7ieMyTIkxHZvMp5Jfjm6VhaOlBQVHU8kSZDiGAW/tTD0PMqkY0bfkP9Kxit?=
 =?us-ascii?Q?upphULUm9wvWmrCoN2xstceC/+9HCuSiwqxtRrUVAZkk21jHeLVm0Uv3yjeK?=
 =?us-ascii?Q?YibsUr/TayQP/3CinKu3UFqMOqqfIbplp4x4fWjcJRgxdnDG1h7sK3UvO0b7?=
 =?us-ascii?Q?YtFa0tnTQoWhdP5inrYNOTYLY6DjBfLwuXthasqwmrFP99bw92RrKekyy1Sd?=
 =?us-ascii?Q?6GDHzzz+LbcLcTp4+K4WAUhkaB0Pa/Wq+NlvgOhi50pKnWEkrVTIyoVZZ6Bw?=
 =?us-ascii?Q?IXB8tS87oyCfxpYRKRknKryRQ0lHyuvLas+wi0QQGMd/KPJNlcgj9SwzWO1h?=
 =?us-ascii?Q?YJKGhFi3UdtkNva5VujasDy1nKxVin6SobAuKoV/8jWGSZa0MTOVbomot4GT?=
 =?us-ascii?Q?lM5z9xGCZKp7ROzcC5tqdgpe9Wb5ViaTjqFqz7CgkcMDUcHQDcV734PsA61r?=
 =?us-ascii?Q?TUrSWnIBDo5N7dQhNk/5sW5Rlm4W8wPCSZlYAavTWM92X3FdgthkGzDiJ7q/?=
 =?us-ascii?Q?APGyk5j/kbVud9Gz6ATdI/xoc4oFXAXkYPw3ijQzBUcGqzQ4wUbpR7fJeFCH?=
 =?us-ascii?Q?ejPrFBngY1Ip5TRe2AuQoR6Sob/eF39AmSquP1dLu/EctJM1vQGOrsvGfX8g?=
 =?us-ascii?Q?GMWgVaIY7zjVWuihfZbzivdHcDH/WCCjaNQE+CL4vdvKBGI4dzx2KB1KcUqq?=
 =?us-ascii?Q?5VKjqyfD2HosEsO789/nNODkN2Ehi7+mqfL7kH5XLBPgorm6559HZwfoRveq?=
 =?us-ascii?Q?ZDXwcnGd0QpzFKgKqze4rp7nLmp4IV66k/TnVmDzQ3FOS3+fIfzg3ca+tCgk?=
 =?us-ascii?Q?huZEa3OTlL1N3p5D+/zJ7VghES3KZHgJoikfDQwxUkY54srs/lLuXzp4zE80?=
 =?us-ascii?Q?+gxCdD4K0NXKvWTLBbfomQpvRGcD+rej1P8RAHbmevnuIHcXXoa8jmLE3Uhj?=
 =?us-ascii?Q?m8KwCNYSxeI2nPjCwm+UFHvouAUrlzy6kwypsANtTP60LuiYtfC6ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYeDGoEMeDkZuPrftIUMEeFlfS2M3Oppm0tiJw9tg02e4CTc6q7LH8wdxlZU?=
 =?us-ascii?Q?LdDs02Er7+0gdI5wYjs0nbZ2irtCcxv7tx0HFJivZhizAJ3lHOZidhYSjiFR?=
 =?us-ascii?Q?UZ9dkV2spa7P09HuJIeESKKOUBDhpkefrsjD87zYqp68RyEy5c0erLd4KF7d?=
 =?us-ascii?Q?mxfIf/UkA4c/DzfQ3RLuGC9/+0SQ2mmtiabrOdllWJ79pdzyQOxfacXDBFlU?=
 =?us-ascii?Q?qAsmHmOyr42ucOxWQUqlP8gJRd9JyMAHuDsz78FNFTinauO1m8W7E+6Jeziz?=
 =?us-ascii?Q?JzXzyACL3h/H4nbDBOcR25br2XoXvz8awkrnPVHzz5KOFRC+66in6Mu5w1iw?=
 =?us-ascii?Q?6l5F/JUIkjJZjfHPrPPfhaGNgjFwkpTgpk7PbVG8lJ5UXn0ldI4+BVsTOEdw?=
 =?us-ascii?Q?TX9nUXnap5TlN3RMCqTf7D8QdqbKuAuUVwph9qBrpEelyvgl78SYdn62b/Fe?=
 =?us-ascii?Q?MSW0l8VeS+P9cBYFhxXjziuJKjxCAAn7Y7wzJ9VBaoOIZE7pgqfG6HGKi+Yj?=
 =?us-ascii?Q?V7iisAwLB8c+53J6TBNSVTveJ/aliBUqPon1HHpszWNDG1Bto1qXQH1FGt1N?=
 =?us-ascii?Q?UUt3mURc3n3aiX40xUtjuXV6Rdb86DblKZbDacgCmMIFDdAEeWOm5FERMVZ3?=
 =?us-ascii?Q?oiJc9O/GneVVXhNaV7V/5+9BIVENOzhO3FMGcrotLHhDRz0qX5dH1YErQV+z?=
 =?us-ascii?Q?v1j4ORR7O9KcnGRB4d8IDt5p1EFo3CXJQQvhSSxkj5s02dB4abLwvLE86pL7?=
 =?us-ascii?Q?82PN3qNlmlKRvkUrywII3Hs9jTLNuF10L9s8DuLd8jzNPW1tlOoKCARFYvtB?=
 =?us-ascii?Q?8/O7MTrIkFcm6aSWcue8w8natrraoJsaFDjd1rc03k6cL3g1NKK5Gz+GskVs?=
 =?us-ascii?Q?L1mBqa9hxWbjUfBsbXUZPVoD0YnfjLbdUeRzdEOiTGlT7xW3CGzff2C6OOMJ?=
 =?us-ascii?Q?TEvYFmbGevFu+4cmDvw9b0DuEkxyslW8fknZ+LOR7CxwFkZOoor+62fsjcNe?=
 =?us-ascii?Q?TtRBz68FOUetXKxa+UUpo74ybDtImTNtjCA5TdT79I3VCuLrfbKpKZl148ix?=
 =?us-ascii?Q?f5gju+03fyNV6vVUx7+lfQh5asydcA9si+GAQ2fEVqKN+z2MHpBPBo0KuyWR?=
 =?us-ascii?Q?Oo10zprVfCk9GLYdiMZ2iPK6cWA+m2epfeCwNRdvtmkn9cke5/pRhPBIWba2?=
 =?us-ascii?Q?MjcydALqBbbnVAB4sd/TKU/JDdeKAHhDakvcIr8d6QqquAQVvLvZJ7N1O3Bp?=
 =?us-ascii?Q?bT0y5wFRkNPu/nEgWkqcu2aZXSkrjsx9p8TCCC9zb+yHCVfNvdR6Mmp/WxSA?=
 =?us-ascii?Q?mNaj1OVUOb7jOl0zSu4AacIjv1FjBEzs2HqQ932Mga6lqeWjn+E/I/Am+fZ5?=
 =?us-ascii?Q?ZuEvChp1yw0d/AIOSTIlZ0QJV3HrmNBITnroJYP+O4HvGDikLHfP7BGoILLf?=
 =?us-ascii?Q?P56sEGOL3cWvamxB3qTHnKRy6pATODUz3G9fgP4xUpdsoMBmDPGX8pslnSKL?=
 =?us-ascii?Q?fTrVE8lsvxGWLTTAjyDAvxGIF+52d6GhaJDjOv+ZA2me2ohxnrOI4F5fm4tn?=
 =?us-ascii?Q?5xdIZT8fB1B9YWpbh7F4XKqHPax5OFEgHwzdrbFN3CTSVpGnt1y8T2DzmoAz?=
 =?us-ascii?Q?EfgRqtjSbVxI9xnNa3bkLOc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a84845-14a3-4cde-47eb-08dd6e1e5eae
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:27.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy5uBPqFB9OH3I4k5WkFNqVkTd9u15IUEwIqsjPOJh1mIVy1sMQag24Z9PcsOR+4TQP7EqF2HraSoe9gdbiKuP5TiHOGGZv5/9ZNGOlElsPYtZQpM16oSJ8mqCrVSkDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce023..948f1917b830d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_csi2 *csi2;
 	int ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
 	if (!csi2)
 		return -ENOMEM;
 
@@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
 
-	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
+	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
 	if (IS_ERR(csi2->cmn_rstb))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
+		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
 				     "Failed to get cpg cmn-rstb\n");
 
-	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(csi2->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
+		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
+	csi2->sysclk = devm_clk_get(dev, "system");
 	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
 	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
-	csi2->dev = &pdev->dev;
+	csi2->dev = dev;
 
 	platform_set_drvdata(pdev, csi2);
 
@@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
 		goto error_pm;
 
-	csi2->subdev.dev = &pdev->dev;
+	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
 	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
-	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
+	v4l2_set_subdevdata(&csi2->subdev, dev);
 	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
-		 "csi-%s", dev_name(&pdev->dev));
+		 "csi-%s", dev_name(dev));
 	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
 error_pm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


