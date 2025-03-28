Return-Path: <linux-media+bounces-28941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DFA74F58
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74F1E175619
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593E51E1DED;
	Fri, 28 Mar 2025 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MDK2n6oR"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932E1DE88D;
	Fri, 28 Mar 2025 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183107; cv=fail; b=QFb96gcNOw5INSbyXlTz1Z3vXV/lA4Qji+xIZfIbNVzJGkT8WfCWok0XRD/EV2sylOKLKch5H/BzVB3WdGYIYF3aFBLB8Ihotwnd0W78OZWSFvspySaeH66/ZwmDa3ZqkmL4t/DIEryj8S7IYTr+IBxGYLX09IpceRPCpTiF72s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183107; c=relaxed/simple;
	bh=+itG+lsmYTQWPhloQpRkN/MtqYNEE1GiS4/fCACV2Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CsDWovvfkap8N2djyFy3Oz73xOhNI1ziB0Oaj2Y867K/tWSVkpWuUBCwfbNUCtQ0oLhPQySGE96l5r9IJkeuNzufUwpFxWbGfMhYQ2utWPrh/3ZZfM1TlhUd7ySgWdHrBYKHZCsQ/2KKF6hGGIqZ2fFGAGwcEV0v55w2nugOO14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MDK2n6oR; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1yoVogilgb58Px7CyJCutkhDpg/H/4WaC8mPvIVyhrWEz5mML1qwtKDxLDAvuoKaJabLVRqePRB6/lbKcqLfRuq5XY2miVtFiaP5DXqy4nDHgkhsjoMr8PIQ+uBWkoSVY9w244IFN8rY/XbzEKDfb6jcZ2or4RGLwxGXnIc1SSIDAuH2v/uMAR1SDEe9NzWy5TFCEXZSx6jGBQCFdaHj4rIWfdIW/GDBC/qAdocK24IQRTrZt/6P+l3IKOSq19FvByliP8K7Xum/GirixETwo7ohhFLgiwN6ENlWri/UgxwAUrqpnKlVGFF2JDowpPx3Xu6vOgBKrvB1WyntyNyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9n1Jn/LuzaoqA08KS5D9g3uz8mHrNSl6RXD3nCLm00=;
 b=sa1nKXVA6b/xw88RSwz5YiczKcq64XcokEzyrxzpGymAWUvU4qiKdXA+JhFW8frMO/hOzB+ThIePQBAKyasAemD7TIUvCQ7DsoYktC/dvoQoGCmN/dp5AqXL4u9mlDS2uOUdw+xUf49vB/C9YLLTju18nDygNAzUZs4ucCdAZIraHhDuXUjWRo3PUzIoDUGlndddWk9q+nl8t3agj0P+cZ7kW9iIL1eqiqiBz9Mw6YpnvHB3NYXSf66/lX/MykNAadV9Poq1b0Qg/l6pl9Iq338BHvB8giwRWsjJd+80ml4AoQJrBb9BoB6o7RoxKzyVHaldqky0zRIETPM7YKf85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9n1Jn/LuzaoqA08KS5D9g3uz8mHrNSl6RXD3nCLm00=;
 b=MDK2n6oR4ytDuPTOfrGULy6f/lGWcdqP9mGCpGIsZjs4GvPu9ZGEgRJEn6lo5XyP5iQtK6esf3k4PArcVxiH2PoSAGURaLHViJ0BIere/iN+JOU0gGoKFtZ2hVeUDJVoMzQk7rDNUyPYirxKS7f6gqdgOfDXpZSHUmpgAYlrB2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:43 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:43 +0000
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
Subject: [PATCH v5 06/17] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
Date: Fri, 28 Mar 2025 18:29:42 +0100
Message-ID: <20250328173032.423322-7-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 89dbc642-4098-4e2a-e810-08dd6e1e6851
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wJXKh2RaP1fMaBI6Pj2SFXKqYZsVf7RfRhr9X+KaleJpX8z/Q45j/kUvepYq?=
 =?us-ascii?Q?RhndTo1AuDxQuv+m0sTra6fbpxxZun7wzMjiynxR6jySe3QEBxXpBAUpTzZA?=
 =?us-ascii?Q?BchYvR/F790Vrqq4sPSIW/sWjRatyir/JR5bLGRCU9zIK550kNQqACwUP40W?=
 =?us-ascii?Q?vE2cw93KfxMc324Q7uB/sUletz9Z533tfxt37MJcGJ/vEmArYqaGhnb+t/p9?=
 =?us-ascii?Q?Ob2DCaaRDxI0te2PeXEPmL8sNVQ/RGrCmJUKOx2m19zG+dfE2/vjfsdUiSEG?=
 =?us-ascii?Q?Ym4JNCkpd5NrBXt9Ta6jWZ8RoszP/XMJL3tX9qwX0jHxQYYwO6trS+4ft1yK?=
 =?us-ascii?Q?VlOOS3R2+VMnuQzyur307foT9U4DALac0NF0EFyuJR58O/294utlzqcDhAgR?=
 =?us-ascii?Q?JF7MEeUSf2mj5q98riF+x1+i4tHGtndlr/TYZw39MaZxzJrRUcyrqy/pxT4D?=
 =?us-ascii?Q?zOv0ylF8tm+sKk5ft9jAN9YuIx2K9roIETBXi3Hj9fvSKlNPA/+NBYct/SOM?=
 =?us-ascii?Q?3k1kKa+PPF+KrppWF3mE5gCdNbL6iRQr/J87jQ4+8gqJ2yagGw3kjW+5BlxA?=
 =?us-ascii?Q?zYqKSynyzvQrcu76fi3y77w5q9H6BPPcuIyz1qc9kU95sX8Mb5md+yeC0NVz?=
 =?us-ascii?Q?bRiNqxNVqntV0qX0xzDE+SKu1PMFy8jdkUg5AOnTNiU9H5DEsQmE4Hjad2/p?=
 =?us-ascii?Q?kk6FuOjy9G+yaRu2lC2NUR7FhMrgIMHCiE70YlJUR+Ap3I3Ujr7qWvcZl/cN?=
 =?us-ascii?Q?hsTuEoHEky/t12sz18+NuIybfAUqC/eZ3iFKO8/zYBdxuhpedVHmG7GExkiA?=
 =?us-ascii?Q?1qSgCSGaLm3M5z73nQjvI5z/kN2xokMoEAtpMaivxoZZ/CMQf9ztzW0cl43O?=
 =?us-ascii?Q?lVCFfbt41SzymHsVm+jUSIGjWuJgGjg1RrZM7cGKK7zBJ5oLKjBKrT/EA1YG?=
 =?us-ascii?Q?nTh+r/NHm6HJw/dQc/RHvYBnNLZEMTmfh/PxaUMNn3mFFMFTQX+ZsCxLG0+a?=
 =?us-ascii?Q?OGewNtNBBuPOMj74fuUDw2uFpIS4oFfTalc18YwHCRUljtyjXtcSYyV669u0?=
 =?us-ascii?Q?80x5ekx26Yl22UJqEgy0E2juPBJgJoV0dJPVgDHlMXiLvp8zA6zHS2jAir9P?=
 =?us-ascii?Q?tZg8X1h1BJydSgEs1XrvKQu+PirBuEyHe6jduefVcMfHQHq3B+0fAPr/IPkL?=
 =?us-ascii?Q?O1X6UGMQflN2MbEy9s+AM0FhAXoVP9dlV595HWa/XrJ7dhSFWm2qUsUefZ2/?=
 =?us-ascii?Q?2MX81FZa0o1Xge82dKtW/J8qRppI8i3V/15C9qX2QUFJ4UFuANYu8ukkopyu?=
 =?us-ascii?Q?QLIHBUiGE71vCJRuFqTIu7Ks8ypn6d5O+jkJfuYU0WoQ5BIpcpWbwCoL3iKW?=
 =?us-ascii?Q?tPEjmsVf+1vJ3ShnLW9JcFJv4+l1d14JoZU+5d3/f+yKJwcwHK1hhkfmKQsq?=
 =?us-ascii?Q?LwB8es1K5WPr6yMkohaObjX8lfzXPqomvKAa8zNUBisKkDcwWG+pjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ezsX+CuvTd1kZz1S6B70XQJX2cGWaKKEcmAmn+XisV7hyxBjfUn7gPdVQea?=
 =?us-ascii?Q?Cxg3g/yeDsYTZGO5QBirCayvE/BgeKPSkNqOcdIDpxGfM9Ht+0/bnsDanisU?=
 =?us-ascii?Q?/bm207YHpXV7iVBwfFDz5w2srMq/X5pHd4ZGVb0798zBeZyns870h2njqSJK?=
 =?us-ascii?Q?2cnYJhZ+lMFjPG4Zfk5PLi76gtZ50TNI626OoImXRn7PKU1XoHoygol9LLu7?=
 =?us-ascii?Q?KkqJD5RAeiWCW0HyjopDp/aUpD0CrFjdpRJun1H8Ie6C5odqEGGePyYpj1LN?=
 =?us-ascii?Q?jf/bHbCd4Z4ZbbCqB3Lt4kGnKwgNvfgiL+XCmYvMkIOxfw+OAANeR1mdMnSt?=
 =?us-ascii?Q?PuNA6iOijoCgL9ui6RT0DknrGGlVJMFjD2fZUcmbqgQtjFmlBOUhk4hQRrId?=
 =?us-ascii?Q?TbeuWOMHPGKaOtT9oZIr/yQu+EGIcTufdv5S+Y1skVD7UW83Y+rGu44X6azb?=
 =?us-ascii?Q?YPEQNyL0ffVo8n8e9rUjCJUbUjAJg5ejB+gpnZBtgRdNX4jSXF0WH+VefRH8?=
 =?us-ascii?Q?4msKJ7sztSfu8rte7aI2qMY+5uiAOfLFQUSNsukcKEpAhTmfJDFsLTelnhEz?=
 =?us-ascii?Q?hM+VglFCBq0WRHP4aNmh3TRMKTB4oqVqCEx1Qufl5Yb7CXXmTSi7DLzzFOQL?=
 =?us-ascii?Q?loJWYqwSYDRw1V5YM7cI+PddwjCKyRdhQtEG0JVre4bFitAXtz6GFoag+74p?=
 =?us-ascii?Q?zeL1O2QEtKxZzVeBXZf6hIJiy4SmmBOQ1z3lRfsxbdUJakUwz8f5u1a//hWY?=
 =?us-ascii?Q?ebxAnYCKjh3NCKt1CstXyIEMy6sqK0Gm/QoEKRPvlYgNSD6Bv2NBRiwa5OIx?=
 =?us-ascii?Q?VQJ9C+U7tbNVT7aBBNz+4ePPcDnvNQQ8nWTAj5I7qqiJMOnwtdlv4fAkGy5w?=
 =?us-ascii?Q?b79dZdVGo4942ipHANk+3TdTVZM1NIIPfNwoIK5e4lvzwFPnN1nfs0Ar80v3?=
 =?us-ascii?Q?dzPWuulnx/goszj0/i9k/xPX9d4uX44TYe11o76wPNcYdLKxD2/kH52MRYyi?=
 =?us-ascii?Q?6H88wQhrKD6pyK6DrH/X3sIsY7pRmWkr4N4x4FBv1JOhHCrRnUQGDT66nhd0?=
 =?us-ascii?Q?Uhd5t/V2NIGhRcJrA/1GueqsFZWt005GHcD7GpFx+GmYcietD1BrFy/BHKJT?=
 =?us-ascii?Q?JHrdauw8Pwk2Yfoxn1nfSjhnUPZLntzqPbxPvnyBUeg/0e4GwFXBCigjIG+p?=
 =?us-ascii?Q?Y3N7zegv8F64nT6PGCa/gbTUognh0oOZ1bKelScaMwbRdD7dy1k4aAsnm1oF?=
 =?us-ascii?Q?DHszqIGotG/BObeP6zHRVFVJqAz+8FY7GMVE9pc29H57qsD/C6LcLMVGnuIb?=
 =?us-ascii?Q?4fq0ClEhrC0vAiVxwd/Z8k6Fw5ZUUSlcLNEa/0FyI3dr3ikoYNJQ5OtPDpSb?=
 =?us-ascii?Q?Ee9uk4c6y4StU1DDfRlZEz3J/c9gYAklCoCRFksf9gUBr/YFKGH1TE/JdikP?=
 =?us-ascii?Q?FXm1A46VKgKsQmNYypoKQyFewTS4W/b+5KDVMjUYfEGbZGP01sRIZbhAQ1Ks?=
 =?us-ascii?Q?8LAp3aTSlqVcgL/N12ZjVAopax6DyOu18t8o0xhT0AF1J78oT8StZSPzko0I?=
 =?us-ascii?Q?D3rrPapDsPsdctLWZUjBSX1n3Mtlp8z2kr8/C+z28n/3SbPyWvcKmgO9yRgV?=
 =?us-ascii?Q?/0iMBhUYHDWXParUwwKC5og=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dbc642-4098-4e2a-e810-08dd6e1e6851
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:43.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fycB4yP5IewikN73YUxON0GcmgzpZSBlHmGyvTcD44zDN574HT0pqHPhLqnmUnBdCDKqUJxvXLxHl0njABgbHMZ1CvX9LByYRqp9LOtPPVp7Uu3fr0Qqj+d0kW6mKB/B
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

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a49885..70fed0ce45ea0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


