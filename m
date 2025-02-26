Return-Path: <linux-media+bounces-27076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05669A464E3
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362703B797A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244D722ACD4;
	Wed, 26 Feb 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hMfE7Z9E"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082182236FC;
	Wed, 26 Feb 2025 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583668; cv=fail; b=SyJG4iYRHOB+eOR9UA/uasIBqN6nrjpoA6sSM2ZmJ0u0WkssX9gyEUVu1qzq9iJoI/iHZEcso2U8DfCvA6FMmRybixXkl/x5MlZIgmcCVWD7uYj7asrsmlzlOD/RF5K12HesszDRuJh0UzgulcztxNiJwEzzEvXB2QW/0SLgcIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583668; c=relaxed/simple;
	bh=7MvvoOZmcpDsCsSBky0hGYZcpLG3QrQgnJTGWagAN0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D4lYkPgA/pQs/oMMHrrWsJVmROEsUz4TzL64peUODM2pfloRt1m16313RqkhXnVIHHvCoAMQBoWBzpmLdaO8hegjMtc8fwP9/betb+v350DVXrVijtojXJKrM3R5fL4qjKr15D0VHO80qK5PxMxSCIuDjeM8U+8YpHn7djiTKmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hMfE7Z9E; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDFEexMOVpY/w0sUZueL9AQGUYHv7YxKQWmkYs5fl6EURt1EEmTGTILTj0KXW8Y5GAbMITn3Il1DlJbOxOkW76MQdzs2rXnQiSJ48poA+GGYW9oYKIxb96x+NhLXevWE3Us1wbHX0Cv5Vym2ogD5d2GsSDYMH5xb3LWiCmZpQZgsm+nJ5GZBIP21yU2gpR5Xcavlcm1Wcc0ggOXkHepZ0xulvw4wPvKmu+/gfwkWbJxogXGgFNVNJf+Q3v2troMjpuW8u2O875i44AsZcb6Oc8TEhp31d0a9eFrvgUOK9uxBVPOOPqle7I519/dITrE8WC4INyv8/MImoq4XT+ZF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGbaTDnGlo25yynLYOBDidCUu7kfID91i8lf7RvecRY=;
 b=e9JGeTt+94vXlLCiAJiOwiMf6Lz7GPG/5w/cfC0w1QzJCI2Fmyu6TC5hsZby5sIlRf20MbZ54Woyu4omV1fkofUgeRWmK+L1TbZDp4VWAbHjvhQdVu0MFQSddhQbVG3t82AfPVtCupco9V53P4xmK6RfThWsjN5AWVEZzGuM14csCWSY/Q7jT2TkD48eke1YxtPq76oj0eSGAyCO+kMUey5366P46XcRa1O/H/HdPGSWG1v5W5kGTsNxZiSEDVhUu2nTEA9KEwvLQ0Cjc6VKArdIUVKYh1zmCLgcS03x59z+1SOq6vM1GErqa2qM2zrQIw624IKjqwWVhpgHLi894Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGbaTDnGlo25yynLYOBDidCUu7kfID91i8lf7RvecRY=;
 b=hMfE7Z9EhVYMuRiuQmj5B8IpZva4aQm0olqjYsMxBNBc3d0RqqdEsqcMKfncO140vdHtrlPLZoYJx72ZxKK8q2RNqd3oKthKvlMZuP1rvjx7mQbgIGW+PkeYrsl4FBjo83qpZs9xAhNoYd+LIxlH8MsJlBb6687t9ey+j3QG+9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB9826.jpnprd01.prod.outlook.com (2603:1096:400:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:27:43 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:27:43 +0000
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
Subject: [PATCH v3 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Date: Wed, 26 Feb 2025 16:23:41 +0100
Message-ID: <20250226152418.1132337-18-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 686fa478-4dc7-4143-4be2-08dd567a1d1f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l6bl3PlCUeV0GsXX0lnOjcWyHsq3HYalNruVE1zHIv9uNkhLI9MG/7OGuh/e?=
 =?us-ascii?Q?kt/R7z+50rph+NW96je68o5j5sHjg1hXtHcz+gMX1KbhN8aR055WvSU1NSSF?=
 =?us-ascii?Q?0aP8Qkv+UyH66aoeXQis5M9mrSIA4VPSrwdrcqnILgti0mP8g4uj1kfbt/WO?=
 =?us-ascii?Q?1bHNAfr+pna5li1rikvKBEzy4AnsxtD6K042uo+vQZ2uwobEGEsRUxjLeIEa?=
 =?us-ascii?Q?5GWY67kb79uuFbHfObUSR8LdXZ5/DL1Jk3FVkjFXP3bJWR2mVcZGkmHYKH6f?=
 =?us-ascii?Q?olQ02BQo2qyMdVJbgwQ71etAt2xMqGWyC0gbAxlOdqo4vWv7EUcaeKOSSA5r?=
 =?us-ascii?Q?0sbS99qcrPR7f3T+kh4nLE7nOGczp2Fwf6vRLcprhkFHfTdnA+egZes4Tixf?=
 =?us-ascii?Q?27ejHmtnBRPxvRzkvilFXJV2Ry3JEYCPb20/lTWM+nZvvBezuhFFT5kd5J2a?=
 =?us-ascii?Q?Ny6e0dBkqMDJj2SC5kNwGfWh6KiguCI/iP7LGjusfHfWY8CU1x5s5gfn7RRo?=
 =?us-ascii?Q?9/k3Qj6kKo4FeoDdpLXiyWBbC941GQRxjUV1GPnNM0/pgdVQUHv4Lk3HfR+M?=
 =?us-ascii?Q?Dsv2nQMvP5S8s4sxV/5NvnzY2DWutqc9Jl9R+SNu5txZjPEouxJl5xy+rcv7?=
 =?us-ascii?Q?ljmY4s0uroytqMqCyV4t0KLlSqwsJlFrhj4N/co4/4j4uBaVUP8nN6h8deof?=
 =?us-ascii?Q?HOjiHF2k0HlQ0rmaBI0zuTrnNHMlxB1Py2XgrnlfQmbEJWT/rHFTRD8tMavV?=
 =?us-ascii?Q?maY6c1zB5UUNppBzlFWMkEJF6NzuQ7LyYpZZ8IJaRPXpG577XcdmovaerrmJ?=
 =?us-ascii?Q?JsQ9FWTRGzDAeUqbotON4KSwwg9zxnLkwEwiLgDArHCjtBt4WeHQKnqyt/eS?=
 =?us-ascii?Q?p5Ud/+W3z5Vg7RWO4a9HYH9aOS50u21uzcybr+kMCdQd7/sGvXAUBO5aW30+?=
 =?us-ascii?Q?6swBOLfef9+5zWahlkCHjlCCiaZimZUFnjTH7B/2Ur/AanD4HZiUC3d1IoO4?=
 =?us-ascii?Q?H86xPJeFEnQcYqy2ZkCDqkV/LJLjh23yaDFg0RbNU6Grw2TnY6F4lnYFZMk2?=
 =?us-ascii?Q?1tAK5ZgySbJb6OD89ELErHoM49bEVpWl3QhYWWyeVu6Af5LhGE9bKyuE259W?=
 =?us-ascii?Q?3/rmlmyDStFm7/XoicHTF9bPL6oLAfkxW/cYu/l/4tqEKD2qbm/d9adY296D?=
 =?us-ascii?Q?bmPbINzwolNoIJJytwkxoCCa7lrSPoD4ME2yHEHPnW0J/EdbD2r3SE4n/UXf?=
 =?us-ascii?Q?cEO5ASU0hp4orYY+40imTX+CbGiHC+wJXgwbtciTt2voDYUTefWareZYvJpM?=
 =?us-ascii?Q?N8aLZ8D7wStyFkoSFdzJQvn8AmpXTLWTl1ETzkJc4pYnb/fI3AgMdix7CL8M?=
 =?us-ascii?Q?nMu+qaKunSGMYUGc0Uyjwe7KEh+27J4dAQT+4yD/wVxKCaKg94ISGXK1TMjA?=
 =?us-ascii?Q?dh7waJugi3gcvgYhCMDZbXrlVlMl4YY1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7RY6icO58W14GfWkhaOT6eobj/MTrl7iMZqKt92KD4FB7YVNBXe9hSuc20gS?=
 =?us-ascii?Q?pZBqmoTjS0SKOTSF0rOMr97JGTPrbt8D8fmXZy1nSNl6FMuUwwZFwsThHTMm?=
 =?us-ascii?Q?iYoA6xyCQ/Es6hNW5MrWD34tO4Rm1tG/7n3vqLMEpAtYE2KyRjtcUSDumLPz?=
 =?us-ascii?Q?YJGccvE0N4pntjWaAyMTwHgc5nAG5J8EmL1yZEwW6XKl3j75eXoSp3IHOFD7?=
 =?us-ascii?Q?I3MVohv0KeMNx70rTjsmodPH9GLwhTX5gPs4lsqTzzh4WEe7cd6q2tHyoK8m?=
 =?us-ascii?Q?sk3/RZKaySyR7acvWimX6u9Z32St9dewOUtw0kvwbasgwrtmr/iqQP6fMzqY?=
 =?us-ascii?Q?NY24s3M6TWXHNlOtR7C+LR3edw5SjpKVQvzaHyINbO0tuJADgLK/bvljPr35?=
 =?us-ascii?Q?bGw/Ti7/LDEBZG+SOChL885ANweCQ3gTylrW3pQGE1qma60RVFfHna1v+556?=
 =?us-ascii?Q?VwO9Mls+w970arx4Fb5VfYgqrwBZrZ4uVDcT9maVfdjKAQS5TExw/quXP++w?=
 =?us-ascii?Q?iu4KP7WDyEoJVts3y9eI3uPWxMnfQgitJjk7tg0HCVHTjFdQdzwOYjaa1fZo?=
 =?us-ascii?Q?LKgOIIj0WAlD8gWLsweNHVqsI2NyqHpX6w8TUe69IHPqwigqzT1e/78X4os9?=
 =?us-ascii?Q?wAT4tcIrtnv31QLTGYD/c/WNGkE77i0UST7CcDEetB7UxvByjuliu8GqYo2a?=
 =?us-ascii?Q?I62b3RY9qAlQai/zSBakmrsgohyc+KWZbkW2R2WZHfKRJc0nHFvaaJqrZwI6?=
 =?us-ascii?Q?upM7KJmxKAe8NoyHj7/G9HRXQZAKn1WaU+HhWJYQBGj0/QHnvAkzxERD60Pj?=
 =?us-ascii?Q?OUAM7R31YAOig45kKfO2tBM/lhOFkxPZN+BEbc+m4Rwygw20Iy6bZEzFHczM?=
 =?us-ascii?Q?Z06REdgpPawu+JbMChF7wWMPl82r8WwLDtQ3ajLw6gYsu59zZjZsIKoF5Ugq?=
 =?us-ascii?Q?gh0JhVvXlwvkWCNcKxwn1b8jc8Qe4pzzTh/IVqdw0mjkVO90BlIun8bGBzhh?=
 =?us-ascii?Q?hIhPMsS1n7hIU0eH+OZhLxGxJVS5aMfS68mpzmZjYoSVSlpMoBd9T0ixvl2P?=
 =?us-ascii?Q?MJo8+nLeohmj6r7mA3F6h7J3pb9FYRDMcC5bfxrr25HMjbh5EcN4PgrIN7hF?=
 =?us-ascii?Q?2cGsUOoDLysZnBqFFi38fm7WX9PhWp2ITHeIvn0g6P0BqGyQb58qzbLczJ/6?=
 =?us-ascii?Q?vE7cR6DlaT+W+ATmyUDlbgxSdhP5K19W1BSvBvPL6oTeahs2WXS8RHnoafbI?=
 =?us-ascii?Q?plhbtYhkC0bCLJCmx7PHHeuOfkCTtZK1kLxZxO4Ah+aOZeVEiDaipUhFVZ4N?=
 =?us-ascii?Q?gD1Pe/T5kemUfqo01nYbnmW749XkSjPgXc9yVWJ72xBhgePwyqxrdcBrYauC?=
 =?us-ascii?Q?IOeebtX2EtNvTscAfMb5NFDEUvcIiB+xbIwVzoSKPOOp1LyVuiNZxPMqxz27?=
 =?us-ascii?Q?FIlsb9tP75QfX2MbDTqas2QtvlVHfk9QzFj7xOYWtHuwghafHZy71fGRzTiC?=
 =?us-ascii?Q?zosCRjT4BcC/FrtsooN3BXox2NzGSuNZxG4gZYe3BbravC+5oZQsFxJdWVwQ?=
 =?us-ascii?Q?9zTWjYCi7/I6Rpl2vUngcL6cc9uTK6NtjWRGZg86mR9Fgzsw51D8oe4EvY+g?=
 =?us-ascii?Q?gijpTGyeFP2sAk5aELFQxcw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686fa478-4dc7-4143-4be2-08dd567a1d1f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:27:43.2297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3hpDwLbPLp+89frt46gyAqguSPPEZCyrYX2lz77s6g26j8qDdprzYJoxlAmm0jMmPHbE+BA1792Zjsr6dsRzxsjZGXamLQkf/Pq2o2Rl+lpoZvqIxVusumwNwkJewfb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9826

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
the Renesas RZ/G2L SoC, with the following differences:

- Additional registers rzg3e_cru_regs.
- A different irq handler rzg3e_cru_irq.
- A different rzg3e_cru_csi2_setup.
- A different max input width.
- Additional stride register.

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
Changes since v2:
 - Use dma_addr_t with buf_addr directly instead of splitting that into
   cru->mem_banks (high and low address) as suggested by LPinchart.
 - Moved and improved stride adjustment into rzg2l_cru_format_align()
   as suggested by LPinchart.
 - Use csi_vc into rzg3e_cru_csi2_setup() instead of cru->svc_channel as
   suggested by LPinchart
 - Added has_stride field to handle soc differences as suggested by LPinchart.

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  62 +++++++
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  13 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 171 +++++++++++++++++-
 4 files changed, 270 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3ae0cd83af16..1356be14eda8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -290,6 +290,12 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
+	cru->buf_addr = devm_kmalloc_array(dev, cru->num_buf,
+					   sizeof(dma_addr_t), GFP_KERNEL);
+	if (!cru->buf_addr)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to init buf addr\n");
+
 	pm_suspend_ignore_children(dev, true);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -321,6 +327,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
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
+	.has_stride = true,
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
@@ -367,6 +425,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
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
index 86c320286246..52324b076674 100644
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
 	RZG2L_CRU_MAX_REG,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ccaba5220f1c..d68d83340686 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -85,6 +85,7 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	bool has_stride;
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
@@ -108,6 +109,8 @@ struct rzg2l_cru_info {
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
+ * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
+ * @buf_addr:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -144,6 +147,9 @@ struct rzg2l_cru_dev {
 	struct v4l2_device v4l2_dev;
 	u8 num_buf;
 
+	u8 svc_channel;
+	dma_addr_t *buf_addr;
+
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -175,6 +181,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
 irqreturn_t rzg2l_cru_irq(int irq, void *data);
+irqreturn_t rzg3e_cru_irq(int irq, void *data);
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
 
@@ -188,10 +195,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
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
index a3c4e2a0bef6..506079af1528 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -31,6 +31,9 @@
 #define RZG2L_CRU_DEFAULT_FIELD		V4L2_FIELD_NONE
 #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
 
+#define RZG2L_CRU_STRIDE_MAX		32640
+#define RZG2L_CRU_STRIDE_ALIGN		128
+
 struct rzg2l_cru_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -184,6 +187,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 	/* Currently, we just use the buffer in 32 bits address */
 	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
 	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
+
+	cru->buf_addr[slot] = addr;
 }
 
 /*
@@ -224,6 +229,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 
 static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	unsigned int slot;
 	u32 amnaxiattr;
 
@@ -236,12 +242,39 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	for (slot = 0; slot < cru->num_buf; slot++)
 		rzg2l_cru_fill_hw_slot(cru, slot);
 
+	if (info->has_stride) {
+		u32 stride = cru->format.bytesperline;
+		u32 amnis;
+
+		stride /= RZG2L_CRU_STRIDE_ALIGN;
+		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
+		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
+	}
+
 	/* Set AXI burst max length to recommended setting */
 	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
 	amnaxiattr |= AMnAXIATTR_AXILEN;
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
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
+	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
+	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
+			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
+}
+
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc)
@@ -290,6 +323,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
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
@@ -401,6 +447,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
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
@@ -423,6 +483,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	if (ret < 0)
 		return ret;
 	csi_vc = ret;
+	cru->svc_channel = csi_vc;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -601,6 +662,107 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
+static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
+{
+	dma_addr_t amnmadrs;
+	unsigned int slot;
+
+	/*
+	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
+	 * address also latches the address.
+	 *
+	 * AMnMADRSH must be read after AMnMADRSL has been read.
+	 */
+	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
+	amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
+
+	/* Ensure amnmadrs is within this buffer range */
+	for (slot = 0; slot < cru->num_buf; slot++)
+		if (amnmadrs >= cru->buf_addr[slot] &&
+		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
+			return slot;
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
+	cru->buf_addr[slot] = 0;
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
@@ -782,7 +944,14 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	pix->bytesperline = pix->width * fmt->bpp;
+	if (info->has_stride) {
+		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
+				   RZG2L_CRU_STRIDE_MAX);
+		pix->bytesperline = round_up(stride, RZG2L_CRU_STRIDE_ALIGN);
+	} else {
+		pix->bytesperline = pix->width * fmt->bpp;
+	}
+
 	pix->sizeimage = pix->bytesperline * pix->height;
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
-- 
2.43.0


