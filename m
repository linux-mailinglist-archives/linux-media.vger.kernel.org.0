Return-Path: <linux-media+bounces-27068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD3A464A8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E75189EA17
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFEB21D3FC;
	Wed, 26 Feb 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EYeyCd+H"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318722157E;
	Wed, 26 Feb 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583584; cv=fail; b=Ritn1JPEt2RyC42MCgCbq8X8Ga8donk+MSJU7WXtNbQfmd4XdAWPl+S0SYel8y2N06cyOLoPmcep5TB02v1jBVs1MCp3oDja5utq/Djy+rN8hqJxyKWtzvO9sichsaZS9UpEYQ8VgJd7gxGM7Aw3kCBSwoAC9GKy+nxdYJ0p10w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583584; c=relaxed/simple;
	bh=64UM6fkOuHAU7eNNKixZni2Q8U8k9E1uHxCnW7dmHTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DupRsLt7Xd5rtCUqLRLXScf0c8oxgng2FrR0fj3MCx+i8W0AuCEq9XuxBCrAoPFQ5/+JiJfut1gQBWoQhIVB6DT+p3/Cr/BKLbJv//h+UV82Nq+UxGIALjqZcjjYY2S6FmHZ+Jbud+Ne9kon7euzc3xI/vmNcBzKqjeJTIlOxc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EYeyCd+H; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2xWpweifgIsguF/fiIFHPH+rL8qNr/CJHF3r+X+9el225qOHeBI9rYINjGdOLXk7qZu8L0nts+b+4uzhKq0FrutizOZLp+DjRtVOpK841MaSGBXxW1SBaO7vCoLHqTY0AakUkBFJzDMWJDWK4LRG9nNOxv3z4EaWyy6q6t7+/hthAXe3Qw37YwKaChQopy+oRPTVXQhXS1eWKehfg61V5h8rCjiuO81j8QOA6E2HGbjDWyFsxYW61ynlN8O/ZddwL9MxpMSz8/YcgV2tV4GjG7PwTOfZECLjq3LpQZpyYLNJtA+aqrsZiwR7XkcSoAEKsoLFzneKS6ri5dV5hYDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy7n4PKBO6cWSpSVqQV7RaACCwuH//pMEbcPtRekwd4=;
 b=rsKf5kHcu+LlH+9rqlxUwMHmMcGr/cwiSWI/nJVa1A8YG+lr1TDg0IpzbFkLTWgrNM+CttOuObzY6hSqureu55TQ6o2Q46bDvgwhaGcJ7Lp4Xmw3J8RuDCMGQINT4E3lviOO69d473qlhmUYBwwgXtsXI8WKiP0CXCo1oOpqUS1Y+soq41VdZce39jDgEQuFmWbIokUmfRko3vBx0zWVO0yF6jEGRFehZAmRSLvY+XcwT+0opealbAi7iYIjYUx1vWRghCiNmw0iyxa6ETgy3oOCEhS6WCBpPEagrm+uz4v/dEHGTUtWypIBg0ijjMwRPsMzEilK6UCgx9pKYWp4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy7n4PKBO6cWSpSVqQV7RaACCwuH//pMEbcPtRekwd4=;
 b=EYeyCd+HjmZE2+dwK4MozKuy1ZEqVviiibXoWkIbHE9O0qeTTIFXS7FkZPtuxlJ+BJ6pOX0jlBtLbgJ7oOHybi63YVLqQEUjP5P9KbMwY8eZ2xtCwmHJ51nN0bBWyyy1Y7Kybc2PLMrzcLu/Yvhbxahkel3juUdgLLnJ3Tc3pDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:26:20 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:26:20 +0000
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
Subject: [PATCH v3 09/17] media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
Date: Wed, 26 Feb 2025 16:23:33 +0100
Message-ID: <20250226152418.1132337-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 244b874d-a5dd-4beb-666a-08dd5679ebb0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QgPX2giBjI9N3IIgyW4G9HITv7Y6G5VPHhGFy6Vp8nGKIkv9R//wwnx12aVc?=
 =?us-ascii?Q?KZPPcULQChFN3L4PFsjEr8B2milcdv0oCapHe0v4+UKPNI3FCTLh1s80rL0h?=
 =?us-ascii?Q?1ZhkclCzBYu83n7qS2+ACfIBPvZq74f3yopsrZA6ybWaSUayUBrO7qWnFcdf?=
 =?us-ascii?Q?1yNdtDGrWhRtlw7x0p7SdMMfQ5aM2yscDUEyWFKZQaex9PHJ0V81AlVahRu+?=
 =?us-ascii?Q?/ZLzDH5EHEQP+sry4rfjiVaoFcStO0bE4vv+G3YshjtY+KTBKDOUpbKcl4d6?=
 =?us-ascii?Q?GDoEbcdQu0XEcTXWXBuwdue5uVuEC6E4zpv2IrFudDhwLCQrSQLxbbTwKAF/?=
 =?us-ascii?Q?tYYLhCAoSC2s7G6N5qF2XreEci4KrsNDX3bN37tobUz8E8iT107F2tecYQKK?=
 =?us-ascii?Q?xrmKOJx94miYjlgl2ILqZrAQLKYYqVo3nxLRQHpkgkeJI99FaWgqqZkDUkf1?=
 =?us-ascii?Q?fG9lJz4dv/nYS9AxwH2Ziogfz+MrZML5VfO6V216YD7A9Co5Vy7Wc7RaEAIq?=
 =?us-ascii?Q?zK6YB0+ElSB6YfabYHOWCDW5r2dMWSk+RP0Vf20Ti5MUSIXmYVrdNKvJaRhM?=
 =?us-ascii?Q?iQrp2QiHT/DoHQT2azF7yiG7GV/w8hTml/d4O1aQYh9Nwwyu3c8iavJ6T+7R?=
 =?us-ascii?Q?OMCZzI75KuvPOaz2T1OVpalX07m53ZB4aOfjgj3ghEHHsrQPTpDqSRbOlDh4?=
 =?us-ascii?Q?eFgN3OTIvdfPRct0dFWoDtaOlLbYJVd0+NzedNzEHkiOGJ1d4ieNiuMbZ94E?=
 =?us-ascii?Q?wx+JBtwBa37fx7HxeIb2SgitFHr3kLOM0O6Z13OQrCEwLFA/AVRcaKq0w+u4?=
 =?us-ascii?Q?Szlhf569BHdtlw/A/xPMQF9M0AP3o7TAif4DpK6R3e8eUYMKnyb1xZJuK36y?=
 =?us-ascii?Q?xeO2UeZVpHOo1tyfL5WccD/WIvLq+6hak9dFA2MyxZ0mNCVuQ4xcuSs4dn9a?=
 =?us-ascii?Q?DQav2EuhZ1M4Sd0vJx0od31p+ydHp9t4NxmB2Ca5A7cHG6sGYhClPBj8JurK?=
 =?us-ascii?Q?FH0onASY/KMYew7xQ7OnL7eOuvFwJBIjLzY4nPJyhyY9c8h326TIBt/YMVZz?=
 =?us-ascii?Q?a5s3pDSplllGbTUPFu+Zu48STo00zpAFdK8NzwyZyKO/nu5z3y5QsQPbiICY?=
 =?us-ascii?Q?Z1gpizQD5JbTiq1/xbAhnm92v7nFr8sYCzySkJj3GiTagOP2R4hbgpMCEAhb?=
 =?us-ascii?Q?3cShJ5FygOT/e45BAI3FsMZPGzJNjeLQum3E6vOIzqcr6X5ogCjniuyT2uC2?=
 =?us-ascii?Q?012cUIms0a1oI8YZUWJpCIQzWIPHOkeui3PY1rJcr08uvA9Uop1zTlQF275E?=
 =?us-ascii?Q?ITuFLPKMfuGdE4pSdxgB2n/XoQ+4DBpJUS4ZKBVtBafX0Q9HqNo8IbOyYyHu?=
 =?us-ascii?Q?6zby9Uz+MGaSPu4eFrxfVIKiv/OZ747WCItWL6hL7vG4BnJpZhlSuw4x0Kd9?=
 =?us-ascii?Q?RWebN1qRka6TxU0PTiXhjZ9VKyhw7uu2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H92LdeRIH5mXvmEE9kb0zGq+CmcWF6iG5PZviCFbbjCzHiHoIvmMgyrW/2YY?=
 =?us-ascii?Q?EscLl6CfaVrgZFw+9Y06VrpOq+RSDT5NYBY2IEaMkV3zulzn5qmqQjrMhN+Q?=
 =?us-ascii?Q?3z+U7oqknMEk/rkTCuSEz3uUUQuDhIT0qSqZVK2kaM2pz8RGZHwrw0GbCdwr?=
 =?us-ascii?Q?VMvkF9S+Rw8lOAzHrzI/K+O2xDCoyaN+NJe+zaaX7uUZ4hZwAVcOUee/OzoQ?=
 =?us-ascii?Q?n8MACXgKGgzaQakSX0RSMpfRoUijWiO7VXoCbrEk+OBjZcb0QWlgGCOGCps5?=
 =?us-ascii?Q?mneNGr8Hii0xPBNuGXVH9fg+8TZLsQ+yEhZucZ1MddMC7bh2Ns9BuYOgg069?=
 =?us-ascii?Q?E1/XKDdTMAwJIjHwTbEYxh9PQ+4d76eeQ9vbBZn5z0uGAYK+60pCrS4Vh1wM?=
 =?us-ascii?Q?U41M0bp2KEQiIVKHkQOdYt7ZFnil/XBVG29+iYVxsokS7QNCMk71x3FMjDAB?=
 =?us-ascii?Q?OEYGjs5SrLrn55+2m9nquDDDESvNBMDLfSOfvvxyY5yNLCTFobU9M+i7hQTh?=
 =?us-ascii?Q?Pfvoq/N+gwFpJYlF+vPtS2HhvXu9UtCmPzCD1ff/UcJuE7JOfBjhekX7hB1L?=
 =?us-ascii?Q?bZemZGNVSgVq2nyJm/pJ91BYyoHFesO6v/SwzEGf+qI1x3m1ro0LkqDNr1je?=
 =?us-ascii?Q?ojLWmXia6IVpbgfEh/oW2whRIWixUyIzACtp6Eu55hWjTKsXU8S5FqDPZLov?=
 =?us-ascii?Q?enDD/6cB1DIQMTbzzDwK2cjMwtl0lwGtR9qCaBdHMUnnYYcLhWPw+0ubiWYR?=
 =?us-ascii?Q?dxZtMes8xGHrDmGySCPlQBiL9qEouYIeOl0A5UDGbi1Tm9vlpTcVKo+gHOew?=
 =?us-ascii?Q?3AL7HOe20bHDcfjZucv47gf0j4Ca3ABqTtTyPjLhZwCLOPIHQfRdnMyyRTP6?=
 =?us-ascii?Q?ZDnXYa11p74yiRo24aS2mEDGBe1XjXjBeLVyk34Ek7Q9N8XnLMXRTSyeoSpM?=
 =?us-ascii?Q?19kcZ+lGI2f0AFIvstLOOT0VgP6urzwsTkRK+jmF7FG/B2qt6/+FSdu3P/TP?=
 =?us-ascii?Q?tzNXveH5Z9oYNGeH8Q3102xAj5hK6GeTgrABf2Q9bW/px5M4G7l7UaiBm88f?=
 =?us-ascii?Q?NgNrGvJ7TlnZa8DTd0cTbNZYztSUwWEesqoyxuX6MhdQh+qEXoIElqkzvgYc?=
 =?us-ascii?Q?6mSD5R4wZeAd1kLzQ5l7cqfznuU3+KRRFZ2Ma7JcTYGKgAvhovCvSEDNv5WU?=
 =?us-ascii?Q?N/tb5mqlJoBK1Ho00woiZzCvYq0a6SGGygwBWID+V3lrpj4hvBBD5LhhUmyb?=
 =?us-ascii?Q?/mx03InZ+1NDmLj9LkXANmHR7LkhlRbGSNR2HxxlDGDogr1JpoHvLJfFgCzQ?=
 =?us-ascii?Q?0y0R40ck2Tth4vjYCm3ZBixW6rFfdxl+1ZGtnG1mWAIVzqv19OD4CsRAg3mV?=
 =?us-ascii?Q?K1kpo7SmRZLJbzluqcYrLzJ4EnBuYtaHRpz4F+SPYkIfJ+5byY20gcJ/2d7d?=
 =?us-ascii?Q?yDB27FRMYxbHpV7u1gZLU6RCm9feMYzjOZIBogFpUNzrJeZMUMaKjJpOtB77?=
 =?us-ascii?Q?+E2ezqfmh3W/jh4Q7F1mfH9Om4+0zv+PRAITOoBa39vnOklCvRm8O5sOALX1?=
 =?us-ascii?Q?0er1aGL8LKOVMnb1GaPHtGaBxsb0/CzfDxZawh0nwqK150ccCYYV2VmbRpGk?=
 =?us-ascii?Q?G8bHXg2fnLMYxxgB0htObf0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244b874d-a5dd-4beb-666a-08dd5679ebb0
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:26:20.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qF1SeyMOn1ZRqik/MB8yDlAne7N10Y0mh77KK1+WUsBWQGRr52lvjiURLBrJGHG7NyEfie6aPIt+cmp2Cq8AaQOsXpaCQINgKAusnKk17Co5OtUe4Fppokbic3KfwhqJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

The RZ/V2H(P) SoC does not require a `system` clock for the CSI-2
interface. To accommodate this, introduce a `has_system_clk` bool flag
in the `rzg2l_csi2_info` structure and update the rzg2l_csi2_probe() to
conditionally request the clock only when needed.

This patch is in preparation for adding support for RZ/V2H(P) SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Added has_system_clk bool flag to the rzg2l_csi2_info structure to handle
   case where system clock is not required as suggested by LPinchart.
 - Fixed commit body and msg

 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4aa5d58dde5b..e4781105eadc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -127,6 +127,7 @@ struct rzg2l_csi2 {
 struct rzg2l_csi2_info {
 	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
 	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+	bool has_system_clk;
 };
 
 struct rzg2l_csi2_timings {
@@ -364,6 +365,7 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
+	.has_system_clk = true,
 };
 
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
@@ -801,10 +803,12 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(dev, "system");
-	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
-				     "Failed to get system clk\n");
+	if (csi2->info->has_system_clk) {
+		csi2->sysclk = devm_clk_get(dev, "system");
+		if (IS_ERR(csi2->sysclk))
+			return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
+					     "Failed to get system clk\n");
+	}
 
 	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-- 
2.43.0


