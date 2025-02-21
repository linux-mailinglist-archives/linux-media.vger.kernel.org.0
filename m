Return-Path: <linux-media+bounces-26605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590CA3FA31
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA2927A7BDE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7BA21E0BC;
	Fri, 21 Feb 2025 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R7Ea5daK"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2435207E1E;
	Fri, 21 Feb 2025 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153458; cv=fail; b=Hzi5Ha18K1TMmOl1SAR6vQKdDR7U98QsiY8REZtqZOjx1NwjQk4yRH5CHAmNfaQsgsWOQMXjoS0gB3g4wKXO4X2POu8di25CDvk2b1uQ7b8fBc8r020ZB6tBpAkOLbQog3MvhcrGP2Duf5rHVTobPd5OZng85je1q9C3mcCKuE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153458; c=relaxed/simple;
	bh=V5Stixy/6BaO4rcAxriztSbKXy3ECeZV2E4p/8Qzlio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbeRrLkreZNyrDuUqyTC5BRusDIf0kLbS4vvNLswZMi6U8JCiqvRwiLsuYYV5dlXDSTmArN+l6EqcGAgYc5itkCtQ/tyMViMaHCPTE+tcpxH7U5C6avNHwpmCDROFPq/tZ7jzgxQLbcXgO4keLB6eDzAb05xwjaEckbyq/EEB70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R7Ea5daK; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb5Lw98d7yPtObDUp0BDgtGuHYa5kUClXKJ1Sk9WAa6sWAO3Ty70D9TFAtRgNl1drHy5qR+deaRERLzMfsFxyFj0Q+gu28AXY09igr99Odv2rHyjFDCuGIMpKPFxxeA46KPMm3npPnJ0GCBRIccAHBCulIrEzKn7jM+QPIbhkY+aqTcswR49WgDs/KNdAWUBrMIcn8LIjr550mOu0YlAtSIbk21TOucPwxN1t2C92X4z8DZYpY3F+b25fxORSq7s0ugO40kpVszU5eueUuZlis46vgnhfp6wxLWvIonXSV4ReyvHYcmCYa3a0chSw85MvscgBVcgSTnZL1IdfzyR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU9UktduBZik6EBYwmN35/IeILz4SStfRNLsCqnu+ms=;
 b=J+f3hwi1MCaNZ6vFaNNAcyuh44SkLOLejbFRhMQQZAR6Li5MxFAYTJ/7ceZj9ftURcxEtzsjxPP074Tiq3X6yqSm6bJhSTuZxBE66ueaJQpON2q7KPi6Dtd4ZVZaef7aAJo4UGv/p+xlVLyLb8y+m90FQxUZTsqzLOPSu8bpkoOMytluD1hgbXsEdlPTZ2t8+bozM6W/ITMv4G8mh+b5HF6UohxDo3SuE8rxeB2r5dVvaZIJ+yilq+yGVvct/5p3sKZddTx2y577GlM38EF3EtRMTvBJJenbYsmbXLgnRS+QrEtHL4T81vjKzYkJeAfny820SV2ZF2Ce/WydQqFxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU9UktduBZik6EBYwmN35/IeILz4SStfRNLsCqnu+ms=;
 b=R7Ea5daKRClRl0S0Hwwbj1wGuiESwpttSmZwm/UluoR5IrOAMTfY+48jvJxb+xuIl0kVPE/SV1Gkm1c7P8eJuNNadjFxOFrk40XFoqAQhfLX2vPqzZisypfj1FJn3EiHExV2icrOm+PZyrLntACM3I4D78T4SHxzlseF+K6ayH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:57:34 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:57:34 +0000
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
Subject: [PATCH v2 12/18] media: rzg2l-cru: Pass resolution limits via OF data
Date: Fri, 21 Feb 2025 16:55:26 +0100
Message-Id: <20250221155532.576759-13-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae191571-398a-4b56-ecef-08dd529074d2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?evyxKuW33syIGBF6Ncnyl3cGEcfAm4B5sXiFwgDjHTayuyuTMlEFuzdpMBn1?=
 =?us-ascii?Q?cOhtkSz/mhK94NHQlh+es8x6MvwI7SbCDgKwZMgay0b20E556s8aeCQgoMqF?=
 =?us-ascii?Q?+EKiYpQSj7LJJ5drt8meuVdJkUhsduBWguF8EKS62ExcK+072OIbQ3qJnxCd?=
 =?us-ascii?Q?CLQokcWeq1inG54f0+/NWE60ygcY6tkfDdLvZX0b40uAsPv7awuxkeh/hcNc?=
 =?us-ascii?Q?t8ZskCaHgeTj9yj6kiOaBKxxWaKoDmLKT4ZWnEtY6IAN2wml+p6U3SRRK2n4?=
 =?us-ascii?Q?hS08i1hnx0v6CW+9aSGVvsl87UjMOVB46vT2tqUEsiSLbCvGFm7I75QnNPDw?=
 =?us-ascii?Q?oLl9IBzO0M59zUPriIbDt3gaMHkLzJB8Wf/pwGpVuMD6yhfezwepzS/l6vMv?=
 =?us-ascii?Q?TSEYwTH0ZgZDtPAhwxawxikPTxsJDWGHl8UXRS8zBk34TtqCnU88WjK1UW1n?=
 =?us-ascii?Q?bVto/PRVJvKHZsreJ19C8H3DJECMBcZwiJip/FnLVzd2elVYMmghYsGs7php?=
 =?us-ascii?Q?K1w2TCgIH6q3c0OeTw3aKYkKnS8TN5JKGXaR1CmJHGweGKneNeNsqhB7Ul1t?=
 =?us-ascii?Q?af0q0BdpMnZ7rFX6Y5jUlMuo0I5dkykBoG2vHST+3PrNkxAhdKkM8S13d0uU?=
 =?us-ascii?Q?Z/bUMbNzsWAUfKYPzWis3mg4ptApWfVkWOT/vzNKnxBKWq4HoSJXQDnwOHYH?=
 =?us-ascii?Q?Y68qcIHm5Qzjg8IRwQm9eS/D56HMkw4+tGsTGYbFfLyXjepl0GT/qNuVvD96?=
 =?us-ascii?Q?BzMKtKoRDKA1Qc4XhBOBbKyraN0JLwQjjWIR0GRS51YHRgoqzlSB/2XdnSJ6?=
 =?us-ascii?Q?mqHpJrcGrgEEeUbQVAoI4U9iXXIEiiVNRlGqXJILuG4+w4WJvXo0/8aHp22H?=
 =?us-ascii?Q?zZbhBdwkPVMVoEOgoYY+otimyDWfrNJp+7fDZXNjRhkxjoCk/aq1BE5C3nR9?=
 =?us-ascii?Q?TWd3biWZIcVKKgCY1isZkF0TYDLS5rF6HFpWKHxzOoxNvlg+QItB+VasgeZJ?=
 =?us-ascii?Q?LoFCmAk6V8o3QJDCoYy3pOnNJg1QCpxhGsTZReIcBfJayELHffiPLcXMz6LT?=
 =?us-ascii?Q?U+wTqrPTFQPQnE8FZlOVdBOEF/0IivQlXjHaYsZE6zbr095TIebFx1kh16ba?=
 =?us-ascii?Q?D/UvyrQmoRrU6b7BVxNbjnnyY15RaDxP+rD6JVMATv7h+/QsJEGFZy5ro4YR?=
 =?us-ascii?Q?bWopoLAlDwTrlF5gprWraK3Kk3i0YGEuiAvDRV1s56usTFhJOpp9KCtPoag+?=
 =?us-ascii?Q?+pVa/343mntjfCgh1qqENrS1cyz8+uQlz33yL03vuLuGM5gZf8iRBCAqVmKw?=
 =?us-ascii?Q?gpUZe6CDiLQ4mANImSLfosrbyQv/AzQEXBkVBUBq1xrBaL/uBAYvAnTEavhK?=
 =?us-ascii?Q?F0CrnJtX73J9owqWmmb7p7rMpVm4wBv/USgQIhGQGZo7hHBYvRV/CHOo+SM2?=
 =?us-ascii?Q?S8LpgkhKZe1i0cz+gQPRbjOK57a+1oB1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JrRBxB/4K0FUI+0o2J0I+ZWc99ogchZI8807F9+11vDKTGJi4evg4RDOhBI/?=
 =?us-ascii?Q?H2KXoRFF94aNlfD5DKgKugoVfZ8EpDN0iyx670bGIeuGFjXm0mVtocqIdiAv?=
 =?us-ascii?Q?q/+Lyde7QW3492PynNabXluUPr9PVemDCC0yha10nqjyeoMIKsdypfoq0odN?=
 =?us-ascii?Q?kPkh1xqu3rCBKbGVOU32hI8kpGL897iDWdUmcXOgY/NUSz0BpiWqnb/UW9+5?=
 =?us-ascii?Q?UUbiVEmVmJcTyBkn5e4eoVkFwaNHHO0qDnvan3MIAjxFmxMZgsezZaYkFQSF?=
 =?us-ascii?Q?2PrazaBLdTS5SOJK+8iRmc0NHRGhVuBj5jCOV55Guggic1NTWThNl2J805kW?=
 =?us-ascii?Q?ndfBgulGvVz8ZNYFbQbNgKyv7IyLrDdcnQKj98oTe6KcFtgN/kzxy4HpSlmD?=
 =?us-ascii?Q?oEjN5KmL4X0Eo6n7bbB2M7Cpcdx7hrJ5rM1iw5hYJhKT4S5n4ouOOuShVri8?=
 =?us-ascii?Q?ju4m68FOs423bwHeJO3cHoNw5EifKehyeTt1uCjVoMZ3Or9S+mVEGx0b2WgR?=
 =?us-ascii?Q?L3UZWkej3DO9gyJW2Nb5NAdiRa4FqabGHIzB3E2QOp6tjVYPql3bjpQFExt/?=
 =?us-ascii?Q?UgW9vqzzHqOGBNEOOPWD61yBzDeSSoOxweLG2MZ8hmDVt9Vi2WMOqTAgSxA3?=
 =?us-ascii?Q?cjQOSHYPK9dfggmxKNKAOMo+Yp2rhnCs4tbG6AioTViYNnGcBL7jEOwTjGsD?=
 =?us-ascii?Q?hkGivtWP7ziOmgXHUGGYGHttC9iBrmnNTrVfZzIcDj3W9MwokGk4fshyCw8k?=
 =?us-ascii?Q?ViMDbZTiIQijqUDMizsWk/uq4eYisqOwfkojDp750X/vsyQaMiIN5NbSqb5j?=
 =?us-ascii?Q?a3rqKwHDAZILCySk4SzH2gn0+yQzut+S7Wf1XS06lvy7c+ru9r/GGLcdihQq?=
 =?us-ascii?Q?f/AgoN7yxuP0z8FZDXsF/OonKjN5kNKKhJNKpRGCdsKyMet+hBEBp4/cj9A8?=
 =?us-ascii?Q?LL/L6zDUyb/Ye4wMJqdHyD4e+xrMJk+GK7L8b2Q4zA22HSUL6bl/sPBh4CHM?=
 =?us-ascii?Q?6oH6Q4sP3qFJTiJbGVKSJapbF+XRUD+fhh0fY8qLhc9QU5IAkPLsOuVY+Zfg?=
 =?us-ascii?Q?ggEcTANN5N8YILPfha9sPZWcRRsrORfL4+RLhGP4Y6+GLkTm8odkecFHuSAg?=
 =?us-ascii?Q?QH3kMjGpGIEUGgR1edGo89gXHPtg/JpgLSyFy1LIBHYGAZPAPlCUXIiHR/GT?=
 =?us-ascii?Q?1QhjhybkVbkaQ/o3bGBqvVXwr9Z6c70VNqX3a0NUBvB0BmNAxdqZDJyO4FDu?=
 =?us-ascii?Q?z14wJHQossCDFx6hmzJ3hihn+CzxkVhX0Eu4whdOUUFsf3kAZr/AdqDjdP/J?=
 =?us-ascii?Q?b+LzUGwyqPmzoLIEZQAsrZ7wCKZeGGK4ytHD0pXUmLF3TH7kJG79RZD6QqcG?=
 =?us-ascii?Q?HQ1tu+Q1VQcATPnqhM9eAzkbzJL3RZ9waomd6dRbwh2Mq5Rfp38D0LO/dK+5?=
 =?us-ascii?Q?psxTJPfFRNYiLfdL/sSrY9FnD5AoLMYZkhvsQVUzAGLSVGhPnSBqLN62JKd9?=
 =?us-ascii?Q?JSyTWAzGPV8h0WhyB7PiSw2bpeoj/J7tjztZ+GpX97nmklANQQhXoBWjMKaY?=
 =?us-ascii?Q?6VRZFdgTNAXF+geLMXMmx9T0kVMWkN1HElC0KFjcJX0gyufKK+K/+lwrrum0?=
 =?us-ascii?Q?1KjKqPwg+QZ8MQhQck+BruQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae191571-398a-4b56-ecef-08dd529074d2
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:57:34.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSkFFVokyzdKtLjkqedGqhcUkAbbuhsa84hMSUChGrleS68LI58mn0u83rsCaJxwfh2jvmpDFhReiBSFc28aNsmsk6r97auvCGrl7ZW1crkXP6JR/t2i0XzdpIgv6+Yv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass `max_width` and `max_height` as part of the OF data to facilitate the
addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
This change prepares the driver for easier integration of these SoCs by
defining the resolution limits in the `rzg2l_cru_info` structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index abc2a979833a..19f93b7fe6fb 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -355,6 +355,8 @@ static const u16 rzg2l_cru_regs[] = {
 };
 
 static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.max_width = 2800,
+	.max_height = 4095,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 00c3f7458e20..6a621073948a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -27,9 +27,7 @@
 #define RZG2L_CRU_CSI2_VCHANNEL		4
 
 #define RZG2L_CRU_MIN_INPUT_WIDTH	320
-#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
-#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
@@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
 };
 
 struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 76a2b451f1da..7836c7cd53dc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
+				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
+				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
 
 	fmt->format = *sink_format;
 
@@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
 	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
-	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
-	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
+	fse->max_width = info->max_width;
+	fse->max_height = info->max_height;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index f25fd9b35c55..9e5e79c6ca98 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -690,6 +690,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
@@ -712,8 +713,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	}
 
 	/* Limit to CRU capabilities */
-	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
-			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
+	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
+			      &pix->height, 240, info->max_height, 2, 0);
 
 	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
-- 
2.34.1


