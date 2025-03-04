Return-Path: <linux-media+bounces-27452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D550FA4DB0F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C01CF3ABDBB
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA82204C0D;
	Tue,  4 Mar 2025 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="AZy+ytJp"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012028.outbound.protection.outlook.com [52.101.71.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC45204C0A;
	Tue,  4 Mar 2025 10:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084665; cv=fail; b=W+R8BGAvHqRyWUcm/4WA0UDQq5xcBrvqZpG4OyTzICA7KhKo+j7q72IyST7NIBLmIu2fZQaGyJpk/KpJtmqnFNv5891cWGeVzqedthvPTgfvMzB4dEgYP1eRvv0hx5uQgKpAdEkIPrdek4//372bamdK4znah2OF107ujROYPio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084665; c=relaxed/simple;
	bh=IGHMTxpMcWNbjNlh8KFOUGytflfIRG9LjjoqquL6S5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MoIHV5BtGgU17WRGcBQEMLxQZ00pqBJoPuWFssPxP0xNYVy6fiVtKn3lTcHN74P4Wuy8gVTr6YdbKbIzdgVdMyA/WTMidjZmV5AGeqWm4aGF4ZhBZnFHC4Ay4gdL3q8WndcSaUDN25gUhiPJlcR02aqBMk7i6P3vaNZAXUTlhb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=AZy+ytJp; arc=fail smtp.client-ip=52.101.71.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnb84ceT1bz+1cNZAFC1W+qW62yH4Xln0ZVvsy6QGzRr6v5JY2zREnrkz/gc6GEtiBqbjMazlw5JCKWhK6eWdX7auEfo1D6eIovX9Hm5pVO/pYBr7YMKZouDJh2G/VLJ0BQlZoXgi6xkMT2BDERWV7Xb83iqSbvHmm4JjYR+wZrkFXnUkK2CuoYif/Y2qugP7wxqjOCK9gAvr3bN91zvtV95KRcc29YOmZg/29aTqVX8FJv8X9dIXGmwlWvzlAhxwezrbLF/A1DV7ZyHt6Fp+BnQPxREj+lO34cBHJva0nvHXhgOpVoXaR6B9JIcH8WfL9Xmskk/l6W1gSTdvzJFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHK+Tm/ZyZ7fE1hNoI+q5HmCVDz2wLbUTvCo6nIFL4I=;
 b=gIiYGeh+bL4Qz5nPwmiRc32JCUoLusAcTqK1MN1sVu0GXNpdsbbcFjseyexk6e2ClLekqROxdKwv/PazOpWfJQ0c7UHWbq5lTgVs8dvVaWF8lVtICoByJeQO2VjXKxNz8ZBWWiLf+8igNjV9n3RrSh+ypg6TxTeQ+GbV0Ck9Hs5Hw/FybcDHT7P3G/O/jXwIlQJcYa8we9O2mnfIb5qhN4MHQy6TrhMsW2+0zqa60W2JipUhRKC3AX+P/lRss1eXSuZXi+cgPkTlu4rnu2ZkxcHhFnOPsYuj5dgrEZUy/Z3q/n0hFcDJcm78xKRLaQ6XnMCPLQbc9I2d+LXSp/VB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHK+Tm/ZyZ7fE1hNoI+q5HmCVDz2wLbUTvCo6nIFL4I=;
 b=AZy+ytJpGDVtM9/SbLLcslwRP4WyZzCBr3O5UK0FVuuU2G+Als6h2pTY1AYM3UzjvCXJ2Yrai8rKyySjwI3bv14dKxfMS7Udf1enrcntIDGevPzJq2iIrgyBzqcTR5bN5GxQKJu52PjyM5d/i48tNpa6AUJQVuAoNwa++iBXxHkHanHSUw4gQ0tgp3Y3GsPrATDeBU75BJFyCsOBMUbXBgTS2l9pY2BmcmcxVQrMh37e526cAZc0nkrZ/s4q0CWO9EBv/QtP6kP4JzFRyomgpMc3XJed8XdlzV0JD/Y8dSzMV2EORCprCM8xYIojHh44eelKJALSqwsmMoc0F2msKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by GV1PR03MB10575.eurprd03.prod.outlook.com
 (2603:10a6:150:16e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:37:37 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:37:37 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 1/7] media: dt-bindings: mt9m114: Add pad-slew-rate DT-binding
Date: Tue,  4 Mar 2025 11:36:41 +0100
Message-Id: <20250304103647.34235-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::8) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|GV1PR03MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 00aa1de3-a2ee-4736-841a-08dd5b089506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/qsHRx2MwP5PRu/eo0clq+nHi0y8lcxz08AUuxbZ0evMkik/T3mKzjDHsJCQ?=
 =?us-ascii?Q?38MGU1NIDJs0WZ3WeiJ7hpvBJzddpba8X6+DdoilY5mDBftc44hDiLmUPFS7?=
 =?us-ascii?Q?vRtMQiE5dhOl9uIcWfQ8lq9U6nFYIc0M3PjcVNywwUW+bj7i2pWXm/iMvo2i?=
 =?us-ascii?Q?WJIRKbtVpY3bxJUGGY1XyXkTEZMC4ljsaNthsWMuXSEKNgV8UKxGxEk5ZVVA?=
 =?us-ascii?Q?kk8JgJ2oVeC2Oo9iqsec4skgJpsJFZGWwv44u3akDLtThXGHzCTDB5NSpLjq?=
 =?us-ascii?Q?zyzAK7fO6czU4101XFq/KTRH+4hWltuNGYq341gFEzd1hemnDwNXx/8A1mM1?=
 =?us-ascii?Q?/Ij1Th8pqHYd0efj6sW6R4btkFVc9fC4oWdPF1HjaNUfFl8LMhz7jfki1Ugu?=
 =?us-ascii?Q?MJgbo+2qmgDai0o4sVPBfXHhCSCLDOi70aQJOROwVuQVyytWQf36KlarPY2C?=
 =?us-ascii?Q?rGmbZmQwAoFXQSiu8eQCj+Kd09OtR2eyoZAeeqgnTsFtpQPOskU6zI3wIXV7?=
 =?us-ascii?Q?DDV5w3R2mRUW6c5in0ike7kcSzdJ4BVAuRbZWGLE21mf9585YRqFwpkGeLwE?=
 =?us-ascii?Q?S9h7gyFtSKgR9QOmH5CHP5begqTXamw5qK857zNDqrfQwIF66esW3l0OzjCD?=
 =?us-ascii?Q?b+Iu2oHAhxSqER8tqnHPZbh5OYm7uB5V7OgKnvt7oegOgDppNH3SBwy6o+DL?=
 =?us-ascii?Q?Umh6AOFOUGq4bLr3vB4odTz38MjJ/TNw9GOIUCDRaawBJJSX3jkT7OXsbs+X?=
 =?us-ascii?Q?WReTlm+F/HCsskc259SuJSepvbR63ZRw+WYQVb47NaHdLVkkZfI5UXk/4DjD?=
 =?us-ascii?Q?bM4lqICJ9oJE24nsvN3NgrCZ6ZbfR/giFUwrJXk9s86lmCoR5UMLD69/gtRb?=
 =?us-ascii?Q?JKPu0eOfvDJiT+HwJN2G+VBoUj4/fsQJt4geXu2jS/VAfR3wA1+58R7HFT9p?=
 =?us-ascii?Q?5tbtUPgkLsVM2Le62xdgfUnSG1yS/f7wd/MYL20Lh2S3Rax8WjuJU55mO5Bt?=
 =?us-ascii?Q?AAQq9ZaOBw4VTKlwfwmki7XXDrVZFlmC9dXp4zYpa0ZEE728mowo2xuFUVvf?=
 =?us-ascii?Q?cVy+6M+d6onzFnoqQuLQbMe+v/WIAvD2V1rOZ2xtTj2d5G5IdW2U5wvcNwug?=
 =?us-ascii?Q?zeQ2qFdxVcMdSGa0qV2vYBB3QunYAciuXErIEFrO6JK3DhYO9z51FoMvtZD4?=
 =?us-ascii?Q?m6TfDZWBu/PeuBzhS9EyHJuI5Kyj8NYzgJS2V+9Mf1sD87IYzXaH+nrVxj9L?=
 =?us-ascii?Q?qOQVdvk4UNs10p/mgGaoNBYLh0uT0AkmnTb01mxZWhH7oagGpzQ7X6cCjB8l?=
 =?us-ascii?Q?ZJnQj5noyJnz3IQPcSZpRxL795SkEiX9rsVfJnbYBhCttyNrropFsKBMK2m5?=
 =?us-ascii?Q?TI7LYcS9IkMjpdk7uiQl87IPTByzD0X6SphGStVgQoLVz6WmHTIzktFJWaXP?=
 =?us-ascii?Q?BygkphFtvrkoyotn5Ed4u8zlS2UDQgeO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WX9xMBa/bmM2ubOtRdTkrK9ibNRpwBiQU+uf9ZbLSX9mTm4NkFDgRoOIBc8Y?=
 =?us-ascii?Q?zOB4YYEvl2wHegMW5BAzioHdaeucD3UVHbyyFhfL/fFNARIOXWB3XeAsScb4?=
 =?us-ascii?Q?wplwQjvs/XWhrxGGif9P3a/q72fRHRRw6myO7umo6/PPoeYbKJmqJFwiene0?=
 =?us-ascii?Q?j6vMXdAHRonE3jUiIyGcQOMuc6h3Ybdvam0QxxJRgIZI50UszLaCmCnIZfN6?=
 =?us-ascii?Q?F/3cPEXEcuLszEzzMg3+U0SR/1LaGscNvvy0VwYHTp+uNXbIqRBT9KSURrXt?=
 =?us-ascii?Q?KSar2w2dQ5nmcljdQ3zjvKOiVuT5q81xAdh2aUE6IwpufnaYp1t0Ju6NV8o0?=
 =?us-ascii?Q?FSjdp8ugrBdrBYih1mL110wyNVq+2idXudytHmGfzzkPxTFdvBKOWm8Nuq7G?=
 =?us-ascii?Q?EJn9k76b0aN28TUmk8HL5Bh9HIFlQ5oIr1Pn+sKvLcMs5182qtbPg50b/5H9?=
 =?us-ascii?Q?/IjfOdLg2vmEJRFuib1qubO41jZpybQwyaNls2nYOR7my/ZVWrrUJV26tDDr?=
 =?us-ascii?Q?lTN5iAx5nYZgrQ9R/IyTBZEbNk1gyf691hPaW54/dfPUEdS8Gln5hVH5dinp?=
 =?us-ascii?Q?m3Ay7+Yr7jCiM1P/NIT+hVObu0mTdhBY9LrnnX9kEWRoHGbzBivau/GP1kRM?=
 =?us-ascii?Q?dznqTm9arcVpuCK4/bNNEFIm0DT64N5YEvj7cdbFWRwteGggY1pnmP2zEgCD?=
 =?us-ascii?Q?cfjkrgE0CLBn99YN7//rDpCjMrufjJVEhlyK3fxY/6tJ1WgmHISUvc9d3ADE?=
 =?us-ascii?Q?iPyGc1mAkbT3aO3MFJ6iuEpMgZpAQolEz7LgUedJHGzzqTBNCLtBDbk2bGPN?=
 =?us-ascii?Q?p8ATlGcMqCaeIBk4DfHIYl4pE7wSIF0wg5JIrbVvT0ZM1/lCx2RJUtvex/UN?=
 =?us-ascii?Q?tlRwv5OSK6+aLgtsE+Z2HR8rdWnl607oizsxRaB9M7hkAP9nErHZndhcaQ8a?=
 =?us-ascii?Q?AtfFyhg+KBIb1L7EHltTmzaJ7MduOovBMy7ZFz6WjQQitAXxroMvJYNHLYvF?=
 =?us-ascii?Q?pPNWUNVscfu6Be6lUKzrQZYWDNsdOz0aUl5yL1LHH4aXII6dOUGnaOehD2qg?=
 =?us-ascii?Q?S80f7b6GVZ6zGm+VT4hlT8Nya16ONjz38gYEqqzXHgPpXRKpi718nRTjEQCU?=
 =?us-ascii?Q?mAD2EnyUgIgP7fv5quby0ys0AGDXoNw27BDxgZ6qhMjP0GyNgL/LeNhivNyW?=
 =?us-ascii?Q?0FV9AlgXT66fBxi+rAr+V6C3TqhPJCXRkBClQbkmjwvl7gEgoWL24WmB0scj?=
 =?us-ascii?Q?2Vi7y0TLB0/B9niU0aJod5gFvsA4n+J+kBkzUyWat4FxnBTKfTU8cSXynHfE?=
 =?us-ascii?Q?24jE4IvFw5xbEF+0o2eEecSWFk7LevCDV5jUnXSqOsgZG/vhgOkrp1jwaHP5?=
 =?us-ascii?Q?Gn3+3vxX+s3HZ5LUpwTqPRryK3wcj3y2WpcbLM40pAoO72ROLpERB63wRWkl?=
 =?us-ascii?Q?c+O9dzXTPvsErKjvKBXyLoE7raDsbztGcAJJ0jdtSeHEp8gHw1dvJ8MaXm/O?=
 =?us-ascii?Q?Rw6COTh4OPtbuHcyhY/OmwMBvw6I19hVPBIt+4N2vpLncK1Pur4YgHX4gNYB?=
 =?us-ascii?Q?ZfEI8rKNiGJaF6pE5ZM8X9fViTbMx7d1p9cpBuE6?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00aa1de3-a2ee-4736-841a-08dd5b089506
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:37:37.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh5OO0hxeOhFIveQQALrKnqjyieQqk7+kRrPBpQl1q9QTkjxeh53TtWiNoKHE2xbWYnKlX9irnUQ8J+mXoOhXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10575

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecting
the desired slew rate.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index f6b87892068a..c184bc04b743 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -70,6 +70,15 @@ properties:
           - bus-type
           - link-frequencies
 
+  onnn,slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and
+      PIXCLK. Higher values imply steeper voltage-flanks on the pads.
+    minimum: 0
+    maximum: 7
+    default: 7
+
 required:
   - compatible
   - reg
-- 
2.34.1


