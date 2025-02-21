Return-Path: <linux-media+bounces-26608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13187A3FA32
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1789819E481B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CDD222565;
	Fri, 21 Feb 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QJiM8a+C"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC2210F65;
	Fri, 21 Feb 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153485; cv=fail; b=QgfKNMvJnT58pZd+9DCQ2pbU0GU7s972DlFZMFHSu4AgXtPS7MCeEvd5n4lS3t/4fGuAhjEwB+2pA+lSWVOnC0V5dv1YVQugpVTvObU06LrTdrvrda1yJHLkcOXPAjDU7URWWny53RU/X9JLiyYk4vmPNiC4LzB8lSF6rBgYtzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153485; c=relaxed/simple;
	bh=5qr+to9uEOnZD0TGjUHiU0Nfc4v0kj9BIUcOmOusIuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nQ/ooDfN78SVxc8Wve/zM6ccRsyenFr/kSw8nFsxRFyMzKKVPFiJanM4A0H0JdZBwEFcCMOEMaKuHadgDQlXglmy3Y4midtGKDdhI4m6SBAWHnsDvHAro+Ioyff4Ob+jc4GMR1XzPEfbhkpF0pgQNLEHCTw3Grf+dzfgbrVoeNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QJiM8a+C; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZRWeRKaa3UR9U6HLVpFoGyEHH/eWgNRRlIE1syIzKXzh5eI6yK7/yWfdEgspbN70iYdlJN7fle48czc8hiommKh+IoFe2UYFTL095O+pOMnu/vFhLJZPT94zRQjzOkWs7gnGSQGNx2H/KyICCab5Khlq42m35FYCvxnuPOQ5/mTWCWKx9i8pcjHjIa+3WAsWLuoSbkCudrbXmNfUtrkAVYAu/3YV2uvn0wb5btwz6HCzx3lNpMgS6h/0/jtHL+Y83NkqTvMcPiNSKPb05Wsx4Zx5IyqY3Vo+jjzVaL4o7TF0ahC1znxNnjbK1KXKX/RX1zgIY8Rw0pOeSLKu6HlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcYRYkLA9DHGPBbZgq7Y2D1G9k35c5xh5CIE8wYbkgw=;
 b=D9l/RZbJ9BiUPZS9SZmHXaSQYeFT4GN2+wuOWw0m19oucMABvqCxkEG7oXR8/ip/khRnuecP4KJ67mThGI7tvl4fty2OyU5cPABmb/xsg9boDqKvRPNNW4AuQERgMda+hiUak+uirCopfo7N58ERE3HhuDC10QBt6BDwl0fvQ38AtoMMjxIaMfKKMj0cTG+h+uUzmUq78jBGoqYBj509Ybi/4pyN66fFuN5p9UGDmhCEjrTqJVVfm3A3Xdze+pXbyctORbCoK/5xvl5VZJ1jGNAkwz5E5w2zDkoK/93E/2McLekUmd99lTeugVAlCGhY2wmXl2h0dDSZFKxI9JMelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcYRYkLA9DHGPBbZgq7Y2D1G9k35c5xh5CIE8wYbkgw=;
 b=QJiM8a+CdXdJxvOLd4Jv16iMFUI6h9LxvJ0qpfm8emJ1OF+egXk/G+VU9pMDRumqeoVLUSztNKkVpSXp6GTjtj4l0z0BuRGjIpx1kbMx8qW3cA+VL4TmXbetPbsjs/h/idvOxtyMV/aWaf8tyn+oDz16qw8tNwBngxH2LYVl1B8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:58:01 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:58:01 +0000
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/18] media: rzg2l-cru: Add function pointers to enable and disable interrupts
Date: Fri, 21 Feb 2025 16:55:29 +0100
Message-Id: <20250221155532.576759-16-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 768fe6aa-cad1-456c-806a-08dd5290847b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HTRoluBbrIAXRqNUXX3Tb06CN7WR1UVRqOgezhrbTESttLDzSO7YL9k3svYI?=
 =?us-ascii?Q?k9Gd8aE7FM8zzvY+1I2B9WKXvcEaMZa+VzaaupgRuhr6uP8yoQfSeCqg8E5R?=
 =?us-ascii?Q?b7TYkOdggrz5bYWiSDZPvz5M/p8R2x2cbXJ+eM+CvabyLUrCp+zGFtg+nOSK?=
 =?us-ascii?Q?9BWJpaGGEVQ8HjgcBaA7pyx3zkh55OpKNwA/kyRBA50DiNez8tvmVMTW9QNK?=
 =?us-ascii?Q?BX9xgqpHGGCvsvHB4qpRf7gdeXzGfbu83cfcJeL2rAZ6s23+CY9glyqCyfgS?=
 =?us-ascii?Q?20RUKF/nWmmefVOv+worbQ6Ijtz8w8riL+BbpuSNDvsLKZuQ/bcmSR0PkKeM?=
 =?us-ascii?Q?cqQQ2bsV2W4WprVCEpUinDTDePfu+QVhxLgE2vz81m+KvdQcNdSgLKkWxnFs?=
 =?us-ascii?Q?D1M/pN1n63wohzh42tlJ3p77OEF5FTCyF29M5ONJPQ4JelxvnOxeBd/r5Uqo?=
 =?us-ascii?Q?IjE+/UTQp8tx7bvQKQ/iw80GDPj+x/SWnZ0Y1RMs5Csl7YxJv7No9tc3Z9HN?=
 =?us-ascii?Q?BZWeg0B5nEKBHqTHT0MNqrBUP+oV8vvCV3/AvKRh66v5UgdFtPPrVZoTruLp?=
 =?us-ascii?Q?MCzXrgUyjDsCOimrBiA4cKBcDv9jfxfQlE5eJTOrcforQa0NyC/Pcy4CS+v/?=
 =?us-ascii?Q?fyomCOxeQJC9qEGw+ewTSKukUP66DmHORhpP+zoEra1LhKLDOe1Lgo+bvXZA?=
 =?us-ascii?Q?6ewjDyW1XznAufuBSXTK5y8Iu1mykt+ECWSe5Eu3GzDXeBEukl0oF9CZVFlS?=
 =?us-ascii?Q?bdr/hu37BLPDjChne/V0gNKrB7W5OOMLnv3y2SKIzjiClTdL0X9mNLpvE42+?=
 =?us-ascii?Q?sZvyGTX0OM/RmmUc+/rSxBE3ERyMa1CiHKOmb5fgy+oez5Dp2RiM+7WdU+2X?=
 =?us-ascii?Q?sbihYu8jHB94tOXIaaOULdwRiMllukhAUO0gYbEzjN2VemuWpHJ2z7t/ZNX6?=
 =?us-ascii?Q?2mpHMfAsvgTCSMlJ4+b64SwaplptxyQrGKtWlg3PgR0iFKcYiyyunNsKqVKi?=
 =?us-ascii?Q?3Y9gFMEUyBvlYnsgg0y57ZmQgv4nRl9huzREBSAq0KZ+pc4KaU95dDUDD/Q+?=
 =?us-ascii?Q?a3xajMJHyUvkyByUTYPUNM6ZOXsF8UVyP8HbO7sqbQ/cYZKGvtl8uUFNLO8N?=
 =?us-ascii?Q?ORtcyzUl9qHLQovd3abZXWhYwwEzX0oNuvhDLIJGs4oRarer0PN+UAicYoet?=
 =?us-ascii?Q?eAW3nR5KL9Ln1gWq8cL7I5wzPLDtZzY8LqmwZTRz9KKIuDaOZEoO0PTgEfP+?=
 =?us-ascii?Q?tVAsMQwky9cMZjvq2MXufeEWWPtL8x94e3WO+l1cnmcSqbNO9sV8O7/H523/?=
 =?us-ascii?Q?N7afkhfno8PreUbXrZBl4G3/VRU0vQbI9TcWbSdiag03jteUaLSF32Ksf/E8?=
 =?us-ascii?Q?99SnU3O8O/LFtcrtglaGsDEUc2XVfXDVqKdQ3ekmdhWSXMaGdlgFEGhtrdF5?=
 =?us-ascii?Q?DNF3CSHzAynJ1YCuc7UnblZjQIbiNIhy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IqW7FPSPHmIkge05Rit0eZsgCvXyyUP3w/7oL4weH8DuIvPBKJcB5FWOCI9x?=
 =?us-ascii?Q?MzOcAM8PgR7Ap+xD+JDnXlkoocQqtlO2DFM1PemUPn/gzRa6LrazOw1Xqul6?=
 =?us-ascii?Q?ZztusyU2SylHaQTLTDQvuogZBIDbIwMfLINlfs7x+CS4IHBGl9T7oXwpuMxP?=
 =?us-ascii?Q?4hfUsiP4LyDz5chonUY04P/fpz5TITht2DRl0kf4/3OVhXSIBxlKI2l+2938?=
 =?us-ascii?Q?FA0nl4lGJpACfHXo13EQ8lO8SGV8VKNi368SEUnJQwkEIjMNRLmmYJBQ/Slu?=
 =?us-ascii?Q?3DJDtJ2yZsEDADS66MX4OnvJgpyIkGPdcAPhUsV2V7xooPIVZNDTr3WyTISe?=
 =?us-ascii?Q?7+cZz4t3AGcdep5pEvFhvh1SD5M42kng2VSv6TFTWZXFLgsFJVdIb+PyFLL7?=
 =?us-ascii?Q?PDR4Df85H43ONMAbrqgATehrUbSctVTCEXd4iqkqVTYURgqFZWf6mkNxFsKV?=
 =?us-ascii?Q?OGl1Ws0a/uipF5ATEG4MCu1+oKcZBbpIj4hEDNEYNm/MFkF5qhILz//4RS+2?=
 =?us-ascii?Q?w15+hwT3PAgp6deSm7qwBlOKmDTOvk2j5fnziiqPfj2WSEB+qR7y/ieXXVsl?=
 =?us-ascii?Q?d7q8qrlg2DIXlNnyZPqkCam0dCKFEArGvIMoOjRVjQy27F+o2ezKY7x9GslH?=
 =?us-ascii?Q?e6hNkSkw2CSV3rnLNuPHApe+wo2J9V+P8kB9F4AvMtPODif8RSSly0d3qORz?=
 =?us-ascii?Q?MVwgSbeM8/+DC3ryI6MHDY5dAR6g8LgaVV+1YrYNn0YCCQFYmI8Ko/7RyC2S?=
 =?us-ascii?Q?KnwNRfrZ+nJ8iSaNtQsG7MVjMSL1NnMsbUTS961fyBuRVQ1CX5mIOGM3XNtV?=
 =?us-ascii?Q?N2IbCyl7fXSpwtj1dMdTyEgiF+Mz7Uumf3caFKw0orJljizg6wk9wjK3rvHs?=
 =?us-ascii?Q?cdaIebs9qyOkmB0UkySOB/UUmPz4eWY8UcyQs4RXM5IOsr/fk4O6nzvleOAy?=
 =?us-ascii?Q?8Ib1vgmh4Tt52f5T2LhGFC5NLyYWOKiC5Gghj3qQsA3crRQojXWfJ+jwx2nq?=
 =?us-ascii?Q?HrIdptuQK4TdyKVFdcXRDfuWaA1t2/GGvzerI2UDwyxkmweZFchsl7k+bcEF?=
 =?us-ascii?Q?NLrjCmDnVuaCzbNoyqJMUNkEO6wCsCuAK8jBisq01U3EL6rmD44gpNUIxcbU?=
 =?us-ascii?Q?Zfk2dFqH+TY1wMa4WgtJBxwiXLZWouDawun844ICstRc8mFoQJFpxIsx7/7z?=
 =?us-ascii?Q?BYqDpAeOdYc+I/1L5mqt+TPhtps1cThDcbijPf+4bAruVst8buVSOEVZTHB8?=
 =?us-ascii?Q?1rlCoG7yacWD3cphd9sqLm1ODadI5Mo4Ssba0IyhH4j6Mu2hpils5MsNoeB2?=
 =?us-ascii?Q?fplaAKfobV3L/bZZXgAcs9nYaGtYyAmMxKtBE5c6ddMghZ6aj70CLfVX5DC0?=
 =?us-ascii?Q?429IKTEyo2fu2UOdkUgFmIDpLChdgrNsbNQgXJxdfiMiCmc1BodYl7MsB9MW?=
 =?us-ascii?Q?hYklCjnvjIRY6RFowx4ZMUUchEzOhFU5YUV+lFrqckl6doliCjV0RMaOOi/2?=
 =?us-ascii?Q?2O/j6Wt8H5cKqb7HTmGSxIM5BtSK86P6E1U3E2KSDyccJaLM3zVXDtcpbAxn?=
 =?us-ascii?Q?pfVP5Hyx4vbJwmy8e3/YXHLxHKNgXVM2EXbBoDrFXHbcO+Nsexdz/sb4vxYi?=
 =?us-ascii?Q?uMk5PZk+Rq/JEuRJbcPShPc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768fe6aa-cad1-456c-806a-08dd5290847b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:58:01.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8q9TvNA0DFs1C8ANwbl4gCPf4OjILKeeajcVqKEt4IsDeZxFEmyRoxGi/TxfG176GmNgInoOqmfRdhSxdbYQgbUpYaUy3PYF5sZoPkJ1L5oMUmFSIGHifIHQTkRwEqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `enable_interrupts` and `disable_interrupts` function pointers to the
`rzg2l_cru_info` structure and pass them as part of the OF data. This
prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
interrupt configurations.

Implement `rzg2l_cru_enable_interrupts()` and
`rzg2l_cru_disable_interrupts()` functions and update the code to use them
instead of directly writing to interrupt registers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  7 +++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 510e55496e8e..302f792cb415 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -360,6 +360,8 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 	.irq_handler = rzg2l_cru_irq,
+	.enable_interrupts = rzg2l_cru_enable_interrupts,
+	.disable_interrupts = rzg2l_cru_disable_interrupts,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 32bea35c8c1f..3f694044d8cd 100644
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
@@ -84,6 +86,8 @@ struct rzg2l_cru_info {
 	u16 image_conv;
 	const u16 *regs;
 	irqreturn_t (*irq_handler)(int irq, void *data);
+	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
+	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -178,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 022da19dd88a..5ffa3173af62 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -254,8 +254,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Disable and clear the interrupt */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+	cru->info->disable_interrupts(cru);
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
@@ -347,6 +346,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
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
@@ -368,8 +378,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
 
 	/* Disable and clear the interrupt before using */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
@@ -382,7 +391,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	}
 
 	/* Enable interrupt */
-	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+	cru->info->enable_interrupts(cru);
 
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
-- 
2.34.1


