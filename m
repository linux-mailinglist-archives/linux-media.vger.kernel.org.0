Return-Path: <linux-media+bounces-27385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B94A4C68A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAABC175B4E
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D4D238D2E;
	Mon,  3 Mar 2025 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FWnkLMdZ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BD2376F5;
	Mon,  3 Mar 2025 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018184; cv=fail; b=l5DT+j8ETC9glMD6dzJJn7stFp/fVlvS8p9v/OBuSbVd0YrR6qRByJEyohgBWkh0ry/1Y+fzw2MALDXYUEogVIbJJY/pkqCTpoUJUVArTvjflJJtyWbug7xjaQgRYZqWRQ6gac/rI3ki7j0L2sPLRDLoebh5ugrJoaScSj/zfsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018184; c=relaxed/simple;
	bh=OImP8N868sA9svr2gZKEzGmfQNaho8sk6AxuzXYzlMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EzkcxY9CnTOYqi08MhuoAMSYC17olqnsYQp0dZ5ospYcdnsB+yI9TvkwO8rX5r/c+JpLPlgZD6VxC4WC+Aw/nIwGNKJQI+3uPhxzlixi0uHDkOoYV7iMSCo30Dz1JZysH2ikhFT6QebV7YHuthrGjrbLRUW9stZcfZojDRyhKOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FWnkLMdZ; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5Qa51hJnUvRa8RWlAR/TIptCqSitEC3YzkSSaeutfqbEEyfesMt/3AKmnx75lUQVXQiCY+OsJx6SUMdX6NwWRTEbeKI+TtKKEY275EQK6wLnuqGoTkcTAO1nDKTce3X/FOv5c2gSe0NV96NgzTl47xY4qXLvXsin7acwfriE6my3TkXZhacRy9o4gYdprp885PKKmXVZnHGyu1CP4XExELOrVoLnBlXgEncKCF7uYkIrVESkp0P20PIEtChJKV/bypr+KvQEe4HvpqFnKLuzmaBZF51rsQojcd1nKyPA2z05Ko+JaIsUpDcBUME/yKICVGqxv4G4TIXw19g9YQl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PePgfD4GrURJ0pUGRT4e7YSpUFXsAzxMurwfw5TYoNE=;
 b=jpZPtFvLKAmAJiy3erODceub8pH8vaHGBIlxvjokJEXHQpfIUl+i5TtzkelP/xgZGN3IfGjmBa3RMi4iy2wHNkN/vK4LUsCAcZ57C5FUgkqOmOFpDpPyoJ9L41X+otU/z+djeOOQIKJD9L3WR20pADyHXqvTvn3sTo8AKWupqn67lQyt6OBDthSORew2QD8w8KnMs1Wa404hW3nUnvvPDT39ryY17i1dKWnwXzdCOW/ur1uYyM0a39o+qlv7Tqlbkm0mMb0vYF9K822gxH5Y5LyQAyx54Zf7KM7ecsXcOQkd3hJoqdrDMy6ots1ETaIRDC4xm1RUfheV1n/lY7JXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PePgfD4GrURJ0pUGRT4e7YSpUFXsAzxMurwfw5TYoNE=;
 b=FWnkLMdZFq7IJCwLvWrM34VbGKckLQdq1ZLgwwhBTDv2rq78D2iw1YRVJTx0TaDn/fhmPtM2J2bdGsUC6j9MX2a1zwo2HExzMK4rFoyLGhHOu1HeJOy/I9gdnGIe26EKVT0irBRHmKlAjZ/i6NccpCObt+wQOcud1211BmRj7KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:40 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:40 +0000
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
Subject: [PATCH v4 04/17] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
Date: Mon,  3 Mar 2025 17:07:44 +0100
Message-ID: <20250303160834.3493507-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 72398079-1646-4313-4f7f-08dd5a6dcd49
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Dva97SE5Np+YLUVodrlvzABuQLyGmLsR3ibpwb+xr9YDimwlzAR3mlTtxhk?=
 =?us-ascii?Q?VYeg7ToY34aX8gbFD7ayohfj4Aa4cP7eFflxQPzzrl30swJSD3rCPW/nfzlu?=
 =?us-ascii?Q?V55Iwu2HdQEVXUIG3oBKE02IwSd4zTaqfrkfeh80251LJ6oEUIlsvNx2C+ml?=
 =?us-ascii?Q?09FCKr4eBCKZf2G/66xdkgzeRPlFc15Aewm4r25vCo+CefiQYWSOG5fsHHSq?=
 =?us-ascii?Q?AtFFxt1vzJLHcFn4ReAOIwlKdBmQ8rgM1qExi+07EbLBa573LKPRCQ6TP8Qp?=
 =?us-ascii?Q?ITJ3LTBQIThbOxoI91JHa/ZAyMOUprPKwCi1ljdkccfFwsQo8upmTo+SBy1U?=
 =?us-ascii?Q?hLDQpz2Z4Rk17Yad3rW1HDAE5we41L2se5+pdIEJ7j1hl4LcIMyTo4hBiZSk?=
 =?us-ascii?Q?P5Z7VbENVwlmZJaDxTntOYff91dv1/4KNMt6mV684zRMikKvzzZkk9IvCF0s?=
 =?us-ascii?Q?LGeBCyC8Kc8XhwKLNqzLP05sERAvWwKh9Sbwjkq136fLipcP/o/pEKD4wFiz?=
 =?us-ascii?Q?Hg0DQU6ye2GcSJm2QWpStJzUuvNg52Qdj1tVLNcf3Y8BNUbHthQYNU4f4/Ha?=
 =?us-ascii?Q?79NeWjV3XhEUmI3P+g3+NbC29A9J+cfD4bIXhFTeL8C9md7otRDfZsoFXz1D?=
 =?us-ascii?Q?rjpJ/Aoli27SpHY0hFuNmh1yAtQdYdsc0dh4/FCo28Rykp8temOPq0ycItuI?=
 =?us-ascii?Q?ReoZhsM4mn/zTobXOCCM3M6ylRg3znorq0q4P/M/jZqksXdJD2ZnwxHQzpuK?=
 =?us-ascii?Q?LI5pu33O8NMuyfoAnb2k0WJge58lnamw2Tdhfb+XrqNmrqVqLeBVaDpxte+R?=
 =?us-ascii?Q?Kz6/nLGdOQU4Yk8fKF3tS+uKM6nRMAaYaUO2gvUFGCTOnxvTT9r+VfILPF7M?=
 =?us-ascii?Q?VkGi84imSNews8In3Zsxrk4Axy4fMY+s0w/guMrmSucBGBxLEGrd2EEfFyyt?=
 =?us-ascii?Q?VgIIP15xgOmRJL+WPDL7Z9RYosJgTMDHNx0V46OQ2qzBEQk5guvCpNT1b3Rk?=
 =?us-ascii?Q?WZQ/DhVeMe7AEJecsULZRAOMac22R3FyISUz1o7NSW4UBy1qKDRl8cAUuOWg?=
 =?us-ascii?Q?EveyskAi258pX3sVAUuC/oBEHEOz5AzsADmHYLaxeZkvHSZ8XvusmgvsKEG6?=
 =?us-ascii?Q?XT3OmRcaJceGMyD//0WQo+VcYZuNf8H/rm+O7gU2iLxMgejUzILpFtdUXu1Y?=
 =?us-ascii?Q?hLjsoTT3ZtMOBB7dIjYYr9qh8hxw+zdaMNKyThjM67B+LoORxiK7PXcT93az?=
 =?us-ascii?Q?WPU7VQiWv/vylDxEdgsJWjFY3Tp53C71RsRZfDTq0+JjmDjkVvvIjQshrEFb?=
 =?us-ascii?Q?0/YZ4Zu+kMcr5q+x9D7ESRRqLHSN7w8n/klpARlFCGx6kP7D5i8DJ+xYnd0j?=
 =?us-ascii?Q?YX5WoLwbn+Zos7UWT4n3XmVnz4aLKhyrHxRanqc+/bvo7FeO/NbUNH75kDwA?=
 =?us-ascii?Q?RxF1ZZCcU8uRLq6hnBqFXrW4wUwwIXHD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sSjVaV3L5zSSwifezb+CemgLWE5VFbBpHHMBJXfdci0kT0rGtRKlICiF/Erm?=
 =?us-ascii?Q?5Hnsqud8bURq1mx040Qp1vrum0wUAEc4gVVluxvwBNlS+qwJ2ltX07TxY1mk?=
 =?us-ascii?Q?BpuekIJ46LnSyvQ+Hy0yRgycTvI4/7hCzVz92PsUQObe2lXTDYvO0vrUVSIL?=
 =?us-ascii?Q?ube+bRpXRgmOeQDGnoE/3C79gFvxDd4EQ8awZjNZnuFye0/lcnDhHaZhs4a1?=
 =?us-ascii?Q?hBBytZ2tQv259jCkPhH6aEoTKR6pD5Ce8yrT30HITLykYa8uRX14jVz779qa?=
 =?us-ascii?Q?NF2MdVBI7u+vU08cZpZ5us3sp9qHi7THgQpzOlyTcCmxBl8Z2MkzumVDZUgY?=
 =?us-ascii?Q?8cG2ec4nOUZtzqttz8+0M+ZgsQNCmrrjJF0Kcmz5oFQKG9ruA8hCwlhDSXVm?=
 =?us-ascii?Q?VFTy5nAfBa3nu8W62q5LXPAgNPhSdq2t+cVPuctbxNpfgI0tSYblNDFBE+8P?=
 =?us-ascii?Q?RCNx2ZBe/3QnUBpK0pHCcJKaboAzpFrg+FOezvpiQmDXWjld2sv32nOvf3E2?=
 =?us-ascii?Q?8KlQ4BMKHQH2SbM6GTE5SSFiv2qe6xZokS8mBZh4zj4PhLjIbfx8f0EWTB84?=
 =?us-ascii?Q?07T8qOrYcjEmaqHcquox5Ri2qrOKTgzjRYCdoY710TtzPgSJ9DinqZ3ElaVG?=
 =?us-ascii?Q?/i/7e3LStE4e3i78ZCpq0KLKRh8Tc2PxPZErpiPtNJDadRYS2O8Mxm04L340?=
 =?us-ascii?Q?QVlxzVDCTg4Ak4D3UqnpXA9V5DGtlsiNKLg1pscWijVSDPOjvV1gpcKL94kK?=
 =?us-ascii?Q?Dveta4Kt2NXABRvvQ1bTXbN71jY7qZk80OvY3+/3M/7NmdQRhk3v4G8uwkeD?=
 =?us-ascii?Q?8OeGQRNzk/9pW6wKPzxdL3lE82xnKLz4odQkKcszS25no8ws0luOjVbmrQOV?=
 =?us-ascii?Q?E385WhK6KTG7gKtpDbVASLQQDvXYo9DlmfBm4PjMrSUxbq1F5EgG89Ul37VL?=
 =?us-ascii?Q?DIBCKOBBxj1DZW0O2lHKRAaFJPtAn/vUSR1P5MrMshFY1W6uymsY/y/oxh0t?=
 =?us-ascii?Q?JOgkdglOu3Ztpdh9NxpGCHKYcTY+9tOPqj0V2mMD9lBXCQ9OETl/f1/HjBCC?=
 =?us-ascii?Q?6X3OfDz+uMhQIExyXkQuIxmJhvEaFAxxttawFM/TWbMQHVtNJD8bh9mM6L8q?=
 =?us-ascii?Q?8UqeJx2PS7p0Yq5Yw6bhIE2REwvoVTpFdM0E7eyfJwpNZ91fbS/Zd+1AKkS0?=
 =?us-ascii?Q?KujIu96MX0K+IIblbiWD+pg5WbuGCKKt50SvyninCO6lodwpjekUEJmET3dq?=
 =?us-ascii?Q?2xRoxoxFk81r0efuiKyhXIvtXkpJOyQ/K2aWn+zyv+s9mEuRomYUbkb7Gnpc?=
 =?us-ascii?Q?JQVBPVtHQAAKuqT8YxhxKz6PNo1mS40bgkTogQpUx1nyqDW2Q81AgDXeyIUK?=
 =?us-ascii?Q?nCft1dUAdJDPdYN3nhhPrKX+kVGEwUrMVhRJRaHayPsB3GK2xK5/hLnCOYbI?=
 =?us-ascii?Q?JQ0OrwmOiv2627dfbAZRPL9QCuJ4SWq2r3itpbWF3BvdPRafMUxWbTyQr3XP?=
 =?us-ascii?Q?h9CAPNBPGj14jtNt8ZFeqLNp29h/6J7KeM36K+6QKkoDmL1dp1yjrL6VGNW4?=
 =?us-ascii?Q?mIw4dv4UNleG6xVUnY9+7ixwzjgDnUGwzf3UiZZ8CgZ8IMxQw4fFRThdcYz5?=
 =?us-ascii?Q?H3Ryl1Z+1x+HsyNSuM5Yy/I=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72398079-1646-4313-4f7f-08dd5a6dcd49
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:40.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMPu912k1sPslSwnWVQ+WXdqXJH5AhgoUsIFH1CZPR7T4qPYgSNbMyDMwT9ZvA6QzDkzsWy6O5sptJkEerNHgUIR6t7QnWewFDUkajZ6DG4oDNB2MmENeId8yHptoOni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

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
index 881e910dce02..948f1917b830 100644
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


