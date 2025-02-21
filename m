Return-Path: <linux-media+bounces-26610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B233DA3FA3B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7089188FAAA
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6441E2236FC;
	Fri, 21 Feb 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CzkdD7CU"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D128A2236E0;
	Fri, 21 Feb 2025 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153502; cv=fail; b=U2vBRjrpVf92S8lo9F2uEdk0vnwIWDQXC6poBGllCfROOgwKFp3Kx03NXrYQTuIRlfI4Kzvu+EvfbUUM4bAmBoQEqAd0rwsAS2J3XiAwV4/QWPNOl9G1wRGu13mNUjwbsDOW/FjnjORmC6lj1JN+cP2F/SQ1cUe12vDlzjZ/eqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153502; c=relaxed/simple;
	bh=F6dWHq0rVZkyfY063JrpCYZBQDx3hm60IJXDxWt8o7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MUb/tonu9X7l+i2NvAdyZRdSv1HLAuV2jWbhCGvQNpPadfaSmszXGhAE96GDpx5EEqK6RsXGLtKIyVzEp789H1y53O7O8CyDWP4hXdIXhHBeK7ZWbwa7dDzWK3iVmnNTJxaPbz5Yfphj7SQ0GDHC9jgb44GvJtHsXxxIplW7HbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CzkdD7CU; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZcljm6EhZpOKkwgJ4XBNhQnrRy0UC8QQzgOVl9nRrB2QopEgirW/xkN0VZYmndYJ5jvOp2SLVHH/4USsSCsRdbFzlvsYt29obfQB9Eorv2bXFHfFHTS2K086dKWGtAjjD8sX72phVw5bS+oHGGsMeF3i8l0UJuQVb6714SXY02Nq+rSozfrT2Ki5rXOrCrZ+AJucne9Gu3v/2E2qR3z9RJOUceHVB3N1mrF0l8FxCkiUq7li0jjj+45nCRj65bNKzNVY1/bWixbjufjvRtG5oSVhRKKTFHltqzvmLVtJ7dYmE2qAu86vfU1I6Y7cHpCduuMXjVkDJZjomL5UI0E+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sloMBBhdkpnsJw+lfTO0V6K2slOG2MsKd7C4Hlza99s=;
 b=CtKn3VjrbahM8COulQko4R32X51xgmnSzdCL5V3dOXyU8rXWNrGxzwqw8FFf/T8/JOYdRhSywkRprm5KF2HqWsTBTliVPHdnF2gtNnPWQ+gY40D4uf0ZgrRDGPHcBsViF7lI1x973EnNI3uRcZe4A75heA5yXpRlqPbqZtXIbMX/2cw/pwxbbgBSWJbmdkMzsgoZwkOjRfToXsqWF4puSDaAaWGz77IshSnYWl8lx/oMhgrk9qmID2HUa9Ge8yYjWcyJ+MavcK1miZJqEj6cLABvWKsw4UZRL3ug0tI2XXt37m28aRMdnRIj9kjRngNsLsFkRxx6otVGkd01cuSkXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sloMBBhdkpnsJw+lfTO0V6K2slOG2MsKd7C4Hlza99s=;
 b=CzkdD7CU76kFhAkfw0UhEHKQeh1ocVDXTFUmRiQFzCKJoqcVmZhmwzLpq+M5nwc4H3ir+VBOkmTz5980PlPUEMwgP6QrxnFCe3ELheEPPFYJ1y/bFBJ8RiK/PKKLMq/TcbnEEXurppmxkrGmgeutA6UhBd9RzS5rvAUpD2DR8bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:58:19 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:58:19 +0000
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
Subject: [PATCH v2 17/18] media: rzg2l-cru: Add function pointer to configure CSI
Date: Fri, 21 Feb 2025 16:55:31 +0100
Message-Id: <20250221155532.576759-18-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: ed83e93d-710a-410d-a31d-08dd52908f34
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0RPX4kqaKdszOU3edmrUopzEt5lUEX3Boqol53nB2SZzC4q4q/+2tLEhpqsA?=
 =?us-ascii?Q?BMccxZqaH7XAGVr/M3QAruqtuHC2chp/USXR43ltdT9wEMn+HBDKx17UscBk?=
 =?us-ascii?Q?zX/u8OoazQr9LAFo3BKtYgtg4lvgscWVrdeLh3hy/gI2gLQ91MQZXrVeBg29?=
 =?us-ascii?Q?AodaeAyUGfq/gmm0PIoEqy0Tjm21sG17Iqoj58To19FTGCtEWssIA6kS4Fxy?=
 =?us-ascii?Q?tAXLcirAI0QE9E4rHq/vM8wy002u4PmmzEDOvmBpGcHnFeEvZh7j6UzHWmCn?=
 =?us-ascii?Q?5M7HathvrXR1XHtL/fzjiwzdnjYbPaSWT6+NjcR/Zbo4tACSL70ErCuQaQHD?=
 =?us-ascii?Q?kCGveUTM7CGBN8iSGSO3KESz0slA24ef/vFfhIdvsrPaT7R7jTNmDRGGO3nV?=
 =?us-ascii?Q?lexGtCp6hgSeL/aTVuvvyazjECP3FJwWw1cBolrXpkCd8+VJDHJ6jmies8HB?=
 =?us-ascii?Q?GjTTOyGN1C+H2td6Gr+CBRqhAriOkPPZKVtMTLybgDWmk4cAhbkIv8Jnss0J?=
 =?us-ascii?Q?46eupqtLNEdDJ+aFVZtl2VrLWjRKNXNr475bF9QsDIoqQEjTibtrMcLwEnlR?=
 =?us-ascii?Q?7806sT//FNADGFAHiQqs8E92LTD6aIenWYgL4J7K2vtxOtm+QZ7AAcznLich?=
 =?us-ascii?Q?hLfSbDUg2ppMadT8+ZmlP5FXKKRmpT4u+mkEtcd+uYK6Zc9/6JOny725l6sX?=
 =?us-ascii?Q?G8Ev2PivlzmFckMpSQRHSsxjDO1p/wxJ/7UuU6f67LGtFo4eSbCmFgbql219?=
 =?us-ascii?Q?j5NM/IpG32xa58lZcS1JRBg9/ICg7aW029YfV2jDZNBhbTb4iNbsoc3S3yRP?=
 =?us-ascii?Q?1dvsXP/07ownMqMuzn6GEZ4BGVvfHU1LB/XODvwMDDNRKjvN/81Hovfghp4W?=
 =?us-ascii?Q?XowomwszT/5I2KIawfiDdKsx3v8N/senRagnJWv+rp1ibUPaJcfmSDjjPzoV?=
 =?us-ascii?Q?RZADF1uVJFVAAcvmt3grfIsB2en7LvhPE9gs/tGtlaT9QxggWHQdWdNg5Yx4?=
 =?us-ascii?Q?3Jwv5yq8MXT9KfMl9nPOiekLocoPJOZsrnP1L4MCg8s3Tgsoq6QSSt4QUnWV?=
 =?us-ascii?Q?h607AiA1rHwDvqUvIa1eP7r02J3EoXLujtPswU0WPujsm6ZlOGstdPdplpqe?=
 =?us-ascii?Q?e1/lN12BeGfxXW/NVQ/fYmsxDXCPXQcgptVF9BrrzW8cfRtoLTBYNKiAQQOU?=
 =?us-ascii?Q?ClciXSGpSFbyWqg5+cxLx7oIgHsF2+IwFuPZX8Dqr0KGe2KU4gXbE5fudT+M?=
 =?us-ascii?Q?XS6CsFxa20CyAj01ThPGEc6QJ1H8wN4t2baltcJPnEMGJjTQRz0YujpHQEf1?=
 =?us-ascii?Q?IB7+oIVKwAJjzqP/U1SGMTIbmn0RGhz4qpWP4bi9ST4Iich8rI7aN63bkW+M?=
 =?us-ascii?Q?bmpzhfxLbqg/8ecyX4LDX6+yK4Ey6czdV6gbJ2e8NAejgF9LLmS/tNjxnfJ1?=
 =?us-ascii?Q?PS0ptk4CxCMtxZCsynLz9VUQGsGFU74g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zu6ov/6ju/q1u1VxOtrBIzCKWcLS4IrQtr3crtJmbywbmZabP/nEqo7pIUll?=
 =?us-ascii?Q?a6M8ECvsgDAIoLRMTIfqC5Q73fbM7J8m74lswaUH2riijhYSpetlKmmSJI/1?=
 =?us-ascii?Q?JGpd9O4E7fPO1k3mwd0zddE4aam7IT7EZM+GUgFjly9UrTLXAktv7qT2Xe8n?=
 =?us-ascii?Q?Myn6egwvpSgcH9SAxoxnpMqCEjTJo7/oprH+XWvs9Sp1F4dw+XXu69AWKLMF?=
 =?us-ascii?Q?9t8xyPmV2xgIaWXrR6xMoIGu0FiY7Q9zsLsqUQP7x4CCgCR6pv6wvuPSjik3?=
 =?us-ascii?Q?SuVFC8bYMSyOIa2NOuo+udHrDwIpwIBB3VO/zD+xaRRxeSKfljw0SIfhqZoa?=
 =?us-ascii?Q?Ys6V57ardvaZhokUfqKFkiCHldGsLsBYfxrpmdxC5htZdRI0AcmjaUMVVSmN?=
 =?us-ascii?Q?HIkerkUXRD7L+hTYdsW4EPMc8S/+N4/2nSbfUBqPynjzIOrRrppGPljGHq5w?=
 =?us-ascii?Q?sjINHVvd5Haf3bNQO/c/bWGj71dKhRkpoIZ2VhEWG5eXxIBQHVyfIClzfFqT?=
 =?us-ascii?Q?sOvGZVRPTy3D/bVJRWl09oQZ3pjy0CNGLa7hOCAZtYb2qr0E1gfoPjz4ZxyC?=
 =?us-ascii?Q?EzB5ssWOR/sHVZnGMGfDBbTZCllwkdC6WjFzKNryo5ev6MA1QEyC0PRUcGVP?=
 =?us-ascii?Q?hT2gl2szQlbLCe5uJ/xNjuNsj3cwoDwR/ZsgAlO5qO0ovbIiT+Rn3Q0u2OoT?=
 =?us-ascii?Q?F+5r9Gkk9LodtDK2A0gaUhpCzJCj+I0GuqzAkXFONqwgI1uaDIUsjQaF5LOj?=
 =?us-ascii?Q?JgrDkbasT1cxss1t5m+wV9kxXzBw/g8d39zEa0XO1vb+jjXvxsofHh+8pu3n?=
 =?us-ascii?Q?rqepzaqE+Q+F5zT1uzPKkJaB0GzFfGBZ9E7wPpAx35dtX3N6GxX0qHUqe68O?=
 =?us-ascii?Q?4zumdiQ24uD9wHPgDoDMk76ibGw5mMhOy/bX+/LULIVHp/VZe0I0ZLmBPLxC?=
 =?us-ascii?Q?1cORG6yWwaC4LQzN8BjvC7iAGSgk7ebEtQS7pLmrlGi3e1W6StlQHWVxZoxu?=
 =?us-ascii?Q?Al4fLUJq+nslIswqOUorZptD5Y2UWYi29HFc6DMemyqPTaqpRx2VLjUXehFB?=
 =?us-ascii?Q?E7L0nTGwINFitzhBkB+STDDYj+kxnkPzNs/RwC4WRc1SfKIcSLesswVCTVDI?=
 =?us-ascii?Q?qDY6nA5hE+E+/xKpJdtHONiYAm6TN3yDKz5UyINqU9+Ic8uDkiek6MBjupSC?=
 =?us-ascii?Q?dIjPFXxoHNuN3r1d3AGnWvkOGKSZtUdtgvR9sgeAgVTsiyc0jS4ZKDiyY5XY?=
 =?us-ascii?Q?Cexat6VmxtJEZjv+xLRsCaymSpaHQF7vrnQ8jrEISixYfyPFGIFmVwN0svn0?=
 =?us-ascii?Q?80BrgpqoKGROiVYkhmCtUGDtHBiOfv8HI/MzvLwhfIyon+qRfBVsFA3+axbG?=
 =?us-ascii?Q?xCw9Uz9i/CZTbimicFtl9Vh532u8Y1lF16s11JegWegqX3c4N4HqHDoRHVHN?=
 =?us-ascii?Q?I/kiIRnojOBKhvdEAlyDFHjky0+rjUntcelOcXKdKVBPrACyHXBPE5+8ox1x?=
 =?us-ascii?Q?fmJNvSBmmOm88kgJnjc0hrm3ghkfhUOlOYBXWQQfHZmJI+KQPen7iEyLhHna?=
 =?us-ascii?Q?Pzba1DhTK51P0hAZauOMIji4GP4n5b1q+N1/kFO36v6ea0P9wYqFBmt6qR++?=
 =?us-ascii?Q?jC9cw3nQtwyetqpNfTKO5+I=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed83e93d-710a-410d-a31d-08dd52908f34
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:58:18.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3i0oC0YGojjt3pPBRp4dyoo+Y9FPffdmn4H4SmYCVAmx1tupFrzWAQIDhVSoAehkFWP1xHlwX2JAtpr6f4f5TsGWS3RIoRRUyBGhCsCTsqL8yxHTkIGNQwTiKXzLmCW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
register configurations are required compared to the RZ/G2L SoC.

Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
pointer and update the code to use it accordingly.

This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e4fb3e12d6bf..3ae0cd83af16 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -363,6 +363,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
+	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2e17bfef43ce..ccaba5220f1c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -89,6 +89,9 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
+	void (*csi_setup)(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 };
 
 /**
@@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 7cc83486ce03..637c9c9f9ba8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -196,9 +196,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-				 const struct rzg2l_cru_ip_format *ip_fmt,
-				 u8 csi_vc)
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
@@ -220,7 +220,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
+	info->csi_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.34.1


