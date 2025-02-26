Return-Path: <linux-media+bounces-27067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF485A464AC
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D136917FE25
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EE022CBFD;
	Wed, 26 Feb 2025 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FaY6kTb3"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B511E227EAC;
	Wed, 26 Feb 2025 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583576; cv=fail; b=TY5Mefo4iBnOrr78/81o+fTG50Kvg7q2neptGfsFI4goKs0VDMtafHaMbTS8WJK0a7B4Pm+AOV3u5gKj+p0JNpPtm5vLDrQJWH2bn8EnSlPhAplexAOmZak87VB2w+fUwdm6EMMR+xrnwh9MPC6WBsiDaC5XcHI8Js7xSlfxTdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583576; c=relaxed/simple;
	bh=Wxv2NR4SPtkJtjm2fNJJtWbbSLqgBpIGMVvzd44aQhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ahv8ZApQKKMvQaxV1G/CAeyRqTMmpXdBMjRJ51hXnb6yIUJ2wzAWfmEuorz41OZ4rsmVneA98RhEgCSysKQSdj9+BR4V3oImvrNLRZ/j/7MOD9I4aYU6Db65klJK0+ynCy/caTnku+7J2VzLHrRL8zsC40DnP4GsilTToc7tzmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FaY6kTb3; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0n1Gne7gkMW2h7c7XuxuwQ0xtc7yhxhsGqQZZYtiFijs6rXcwY0zUbw0Z32TkyHRJYIsgUejXUz2YcRn8UQyoIImI6Hmi0veIKXORYKVaW11aTuMRvuyqkrOximI79eKkturZn9+Q9RJ17HlvFljzFUOwbOq2XhQBRZXWCKIDBtixO+Z/6SqduFM5Wk4IbEWTrh4JgkKOvnxJg3PsDPT0dg7ld9nIao653e2RNJ9d1ybEGjRTRigT1ShwFnYhbJXmdY4qgHUx6pz2EXP9J+ek6lWSWT9w/yn2gu7xP3hgNLvgc3hjHxdsAWfWlfme4L9/38+2Rob9nrxeZncsDM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAL8gQrgsvYymQ2b+dNwJ33LYhY2L+OhBRxp3zEx8Qo=;
 b=t4OGuX6eoQ9G0VUwufc17ESz2fH7Ziz+oq3Lh05mopvljmxWg5UZQ3xsgtU7ZpPFgiiNKyqp6dcGQWoKXFaCNTrSH75dAXiyd/KEmnawn3vPCkCoj6O0qy2JYRnH5c245R6KeOwKuSe74thZBvOxvJHi73EFJjgaeMY5lNd8J9HdD9rD1/7IYF/fguxVOCeNBsXt20gU+kAFDLDrwVrZ4dvR5sL1ubjV87AUkq545DeAdYcLi5xX6pfj3hUIstK4rtCSGzCtpUXicv3zPAb+AzQe3Z7PDAkKgFBjLtNcVr0JAOl/ww5xcEI9+pCoPtx69a/+4FuUEO1w/P7DcPdlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAL8gQrgsvYymQ2b+dNwJ33LYhY2L+OhBRxp3zEx8Qo=;
 b=FaY6kTb3un6DOJwN5uiCmt4ASP3lfTrgI4SdxdOUmIC/2VYGyPW1+uMkvJfFPDxZBXq2JrTrcT63btwuQz/oYmH6U3XQulFP4jW/8ftr83ELA9UY2haEKly4t9g1BvGgteYNsdvcM5r+kP2Icq/xqFZOjZCPQoQM26X5IKiKb1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:26:12 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:26:12 +0000
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
Subject: [PATCH v3 08/17] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
Date: Wed, 26 Feb 2025 16:23:32 +0100
Message-ID: <20250226152418.1132337-9-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b8ea24f-0c55-4cbf-c38b-08dd5679e72a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TVrLlN5lj9yBgXTNiTVIxjTPzEPmGNENdmEWNUjBCndyzOKfhQ1MdazG4xwx?=
 =?us-ascii?Q?f93zGFJrhg4ExNop42ZS+4pla7LVODxn0rQqWYwfivhtahnuc8Uur73DaIRu?=
 =?us-ascii?Q?SM4u+I4HjgU6SouuXNW9JHMnANxrtcTG9LwIGuMORX/2jfNj6OX58r0jgSfH?=
 =?us-ascii?Q?kl375G3Yq5De5KZWYdccif0BDprNpDWD9c6EecDiHt7eIUzNJ1TUR9y3ofgZ?=
 =?us-ascii?Q?RDYE8BK5iXWELmOIH/nBO86ggLhfVaxpS/6+AGQsUrdSHJarW1ENHiCrGy0l?=
 =?us-ascii?Q?8ajOwIhklyIRv4RB2tzmuS4P08CKHpVk90+tR8DGecjiA3kdlTbGFcniobmu?=
 =?us-ascii?Q?8y7fF/LAYWutdpiyOexIaS7/rUs7iMX7rDo0np/tY2RL+PWzQ8a7ljwrPUsH?=
 =?us-ascii?Q?2Ps8toDVWCeLyP8O8xIKWaa0zWEwBF/RvBR2PfqKmT3NAELJ1tR3oQ3ldv2Z?=
 =?us-ascii?Q?qV63Vqt2pCudti+hjncTbK7SKHCtWvg5TR7V3vaa/42f2BV+0ICeInnT/1uQ?=
 =?us-ascii?Q?jK5Isda8UchTOmGoRmXKa6udg8NNtEyS57FBe83xXQczNUWcrwQDYHDUT6Fd?=
 =?us-ascii?Q?3CLt5/Cax9xAXftPuQYXuR8Frb4yeLQnPJiH8zf0TkoUEcLynxwCf0O5dLGp?=
 =?us-ascii?Q?ocZ5osVOMvi5ImNMeSuYPhMNN7gUwWXiOeU7cSbPm2uqI7VEZ88t3HwthxmK?=
 =?us-ascii?Q?nvIBT3J0DZTRRCXCgmkVerT9bB4ohDCmALPSkPeubTT7APt1cKzcrjwtrFcP?=
 =?us-ascii?Q?zbUeMfdKp1HlUdTfLWPOWbs2zJjo/FR2xdEntMNUfTITpLBRjyHXooQBzVlE?=
 =?us-ascii?Q?ut9IVH5he+RLaFt83+xCRdWRC9nZwgG50Yh2uoUe5mtxW5arJX8IaH2g2cle?=
 =?us-ascii?Q?JYA/slfx+uo0JiQrZFUVcSqiaLMlfWY/pylrzjAOnvy0jbql5vTq6bupvmX0?=
 =?us-ascii?Q?qVxq8GLGzvxwxyCzkpCa5d5s4Ff0gCGV4nKyDdpgrypR/Wb6GfRaGqPVX+xd?=
 =?us-ascii?Q?TfgLC56BviFl/JREPScM4X4nETJ3POboG9crq3SwW7ThGW5LD3rjVSc39z3B?=
 =?us-ascii?Q?0f65S5vlnzIstmm347d56a4z0ttm2jwnyWHXrjRkLC65T1mRPYvqs0i5Hxjz?=
 =?us-ascii?Q?KIyZuJWUJoqKns3VV4fu6adnuOOqRVbnvbzYKcuw5KVAD8riSZj4G4g5Xr53?=
 =?us-ascii?Q?faMOTNqkPDffMY5NgHjEzq8420ijo2HAoSjMi5kHU1Tn624ID6u3wV2OYDPj?=
 =?us-ascii?Q?usB7EDFEnEJT45n2rGE9Q6gzgfyH1QzYrMwANeneNBiwRAnFr+5POcLw+Z3L?=
 =?us-ascii?Q?EwPAqKgYQ7sL2pj9x/iL6P386Y5j6zW2+Wgpiow4mz3PuUxH3QmPXJM3qxrd?=
 =?us-ascii?Q?ZqjYovKQM7/IvtgdM9KfM378e5kOUJ+X9AK6gFOMW4MymGdA27CA7pM4GxUo?=
 =?us-ascii?Q?NPydIEyD0qqU1RXGkxWIsWkmBk/21aWw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BtEx7DjTb9cRC4FM3Av+K/nO5cK2yoRgD+rXDPJ07suGic4erij38kktqEyW?=
 =?us-ascii?Q?dhrPhhy6J8il264kkrbtg03lE+lwhp5qO0dwOErW4edbjaWqd+B0QIhFxoQ9?=
 =?us-ascii?Q?lQTysFvauzlRyX2MoY1Atly0hGvNYtHVBJ4cV/UFmnVsr2+v7o1o04lNAUvN?=
 =?us-ascii?Q?aGfaHUJ4sGtsw32HZPJKwsH+6OWAMDP98S6KEjQ79/Qf0DhsCstJ+D33p5e8?=
 =?us-ascii?Q?WQ0jctzdGz4Is9Z4tSTukXBhAuW6v0Mt1rBbXR8wyZk4hcRN+a7WalkykLlI?=
 =?us-ascii?Q?7SYQbS2QrSnp4oVtKB25oKlbk4CTxXmtZ+tCmGYCZqA42y8DKxFZFV2ypDS+?=
 =?us-ascii?Q?ggHCHZ3cCUt3FThE8ZPg9zdc+4m3c7bVDgQ+qySabiA0im14dRIFDFfhfO5Q?=
 =?us-ascii?Q?3Y6tmhAYPwDyjuOHpTXTIBrXyDBfZV8blCuqASLy9hE9xwCx1SLk9zjYA5Ja?=
 =?us-ascii?Q?bfGlkd9b+u4WwSCK4XeQPI2SoqF5etqLcgSuSRSq+J6ak9UFBatOye47UmuW?=
 =?us-ascii?Q?2MXY/oyNCOXjdLB3II4x/VtrU6C879VyYwUsuBWhhjRTcBWU9RsNuqp9Bj7g?=
 =?us-ascii?Q?D/pTufFiytLz2vcJ8Y1168oxadgSgzNBzkKuiSC3K6QfRkZNVM/C7BaE8oAm?=
 =?us-ascii?Q?7oPBHKdIg1uFctpx9GXZmFeFcjuVBrbudhYQpZGiNBTkSZtCzlHfKVxq6TUk?=
 =?us-ascii?Q?UxHcTZY8KkxDgvJ5PyT2wodQpt5YZDLe1myy3Oi7mOHH2io6zvA6RR8xtwg/?=
 =?us-ascii?Q?+vNLUy4TltF4uc0GaCo/iRPCRGWQTAVlNRGhn4BL+I1Am5OdV/g1ho0ZHFGQ?=
 =?us-ascii?Q?EnWHlHzveAT3aN5a4tKwJJYmvcG9n11TMpBurOLUz+K6NT/8/2qNbp5UxkMy?=
 =?us-ascii?Q?4mIItm++MJopWVDqF/n1hZa+RBuC1AcnKrj83pwCQ2den/9Hq6jWdMMOb6+j?=
 =?us-ascii?Q?6nTkrSZ88tNbj/51KoRtzXTFv/75dLvV7wtG7JaXHQ4cgIfc7oqcYyWmDbag?=
 =?us-ascii?Q?0j7n3TMKCh7NbPbFRX5h2TSPiokmSVO0obJ2dEFoPH4roI8+WCN/vRitugNm?=
 =?us-ascii?Q?g33BXvTF1pnHSXcBrHLystQHCZHhKiIuLqLezm/xAwrrSXIGuqeg6i6eiz6b?=
 =?us-ascii?Q?v+LQWz5iv/co6aiP+DbNVQt8RlayA+Hx6QmPHg765tS0QWU/IcCfwJqwSCDx?=
 =?us-ascii?Q?rmikdGguWSzOUlAynFQhG//uVkvK7NRXDAHkDqSv/AD5+DeBRz5cekknmX8Q?=
 =?us-ascii?Q?x5XNs6erlCuLJGfE/UItGABSK241oKcGJc0Bia7WPf2yBFsmi1vktFEA7+/4?=
 =?us-ascii?Q?lPde9nli7CdKaFoI80uPRD73B9lV++wfGvDmBokEuufAHWvTwxKM3UDVTyES?=
 =?us-ascii?Q?1JcKUaCgY8YQxZ27s7Mfn7F4wclwGEU8BBxurYFYrpOIRCOrRd1alY5Fmvcf?=
 =?us-ascii?Q?jskW4399M1lPELy9kzmQwoULF81t0LA0UEYtqyWwJfJ7EBPqBNGj7Ig4iLCn?=
 =?us-ascii?Q?xr/3eR1MwZXRfkePiVjWStPpywu7dvMDJdVVpLaPSx5uqeG7cEto62ThM7tE?=
 =?us-ascii?Q?S3+ttq7OpYTMUu5xeO/3leFM4fNPfdYOFTgB3S80wlPI2vEeGGBuc0flynIQ?=
 =?us-ascii?Q?7pV/Z63JCdQ+5GOEOl/+M7U=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8ea24f-0c55-4cbf-c38b-08dd5679e72a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:26:12.6757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRiq+4YERGMwiqKIqrNYobkj3frjbQpJDpzrbutSgxl+ANG3pOX2bQQrWnDFnP/zGZqBBVr3OJCutQexbeMCrTxAMPuJXZykOZ5ypToBtswRwLShv0mee0TZ9msVVqI5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
differs from the existing RZ/G2L implementation, introduce a new
rzg2l_csi2_info structure. This structure provides function pointers for
SoC-specific D-PHY enable and disable operations.

Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
Update the device match table to store the appropriate function pointers
for each compatible SoC.

This change prepares the driver for future extensions without affecting
the current functionality for RZ/G2L.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved rzg2l_csi2_info below the definition of the rzg2l_csi2_dphy_enable()
   function as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4ccf7c5ea58b..4aa5d58dde5b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -107,6 +107,7 @@ struct rzg2l_csi2 {
 	void __iomem *base;
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
+	const struct rzg2l_csi2_info *info;
 	struct clk *sysclk;
 	struct clk *vclk;
 	unsigned long vclk_rate;
@@ -123,6 +124,11 @@ struct rzg2l_csi2 {
 	bool dphy_enabled;
 };
 
+struct rzg2l_csi2_info {
+	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
+	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+};
+
 struct rzg2l_csi2_timings {
 	u32 t_init;
 	u32 tclk_miss;
@@ -355,14 +361,19 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 	return ret;
 }
 
+static const struct rzg2l_csi2_info rzg2l_csi2_info = {
+	.dphy_enable = rzg2l_csi2_dphy_enable,
+	.dphy_disable = rzg2l_csi2_dphy_disable,
+};
+
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
 	if (on)
-		return rzg2l_csi2_dphy_enable(csi2);
+		return csi2->info->dphy_enable(csi2);
 
-	return rzg2l_csi2_dphy_disable(csi2);
+	return csi2->info->dphy_disable(csi2);
 }
 
 static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
@@ -772,6 +783,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
+	csi2->info = of_device_get_match_data(dev);
+	if (!csi2->info)
+		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
+
 	csi2->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
@@ -891,7 +906,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-	{ .compatible = "renesas,rzg2l-csi2", },
+	{
+		.compatible = "renesas,rzg2l-csi2",
+		.data = &rzg2l_csi2_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
-- 
2.43.0


