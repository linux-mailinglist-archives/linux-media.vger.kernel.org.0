Return-Path: <linux-media+bounces-26594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EDA3F9FB
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E5FF42540E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A0F214A8A;
	Fri, 21 Feb 2025 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HP2Nnc0e"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DFA213E89;
	Fri, 21 Feb 2025 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153374; cv=fail; b=pSsVLr+9RLKayBa6bw836bqGTUn7+i5Wss1nBOxLzEn3+3sLcKvZrDQvcOTQx0PTGhf/5kTetDNMWDa3A6iCY0UP6Grb/mNL3f6a3jmmAoOYd6SuXYr8Rx5neOzprankRxU1B4knX60+eCZJZKbRgWaC7UMKCwNlur98XYGZ63k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153374; c=relaxed/simple;
	bh=86bwgMDoG9Ug5xvt62xPhaw9tjo74NQXOLRtluot2cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a2W8DllTIJcDyQ/CKzH01+zsYkMjpgBR+Ac+H77YhGNjXLhyZHqDcdNKTAbjcE07ge35LzPYeuxNAz5/oftps9JbKwJ0YTA0khC8dJF0q3ABqw/TBAxFh8iskwfOWA78j/WKCtcIK2SNw6+oPA82L7UX4KgTgY6rFITX+qfuj6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HP2Nnc0e; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnXUeyZc1V+oJwgPla20HmZ68aBEHeTmgvERP/yLohdMvWKjjIKhyIMtAQwKwo70XH3V98fkjjoMi6LfdnVkFIRdM5D5oO+GP+vl76a3fmQcRQeEB0MdpOz2lIW8Bfk38aaoyby3LPrrpJTC3MtMbiRPYSHdIrzawgSogzXsUXadiP5uPJ/Ov4WA/1vS3ebUiobkCIxbHw+VqO7BGzUjWIMynvyrtMkMhpgCc+iwaOU3qCXQbMTYUBlYratqHZgu9rJ197qnvil3XdV5DinGK28sjI3tx/4nbJJNnCT0xxI4RkmViYlk6tKetLnqOPlFQc3YpXoVjOySdIpjmqadgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+R9oYvcBSHRfr28Wv4dGw22J/KPypkzShv7Y6k0CfI=;
 b=M7VkE33Z8Fi6fSVx6glMkJamWychjH18F4r3PeqD+idzcc51sX+ov0EDDilzMNYwwJe5r+UBFzhmrSIvbcHizOP84pJ4uVMXky68VuIR/8dIE36soGNbjouFFsa5rsfDPvZbyTz9X3e6ak1ND5RdnakdTJv8DHV/L45EE96gVeso7B/cKj6v3yvo2c+9gWe2K9VFwg2mJSz4LKoZRyvzqUzS6nXt64i+KqyJ7e0CK5/5bZuQX/ChaE8BIdMWco9QH8tBu8jmYx/8jiSMciSB0Ez820YcIfSPuh9NeFcHik/qQzNEopeyNDpIhHEvs8C50QI83CfAB5daZjVa0QMpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+R9oYvcBSHRfr28Wv4dGw22J/KPypkzShv7Y6k0CfI=;
 b=HP2Nnc0e6TrnodZ5TocnUqQ+6cSs322YL0GUFkQA4eoqxGdCzJO10e9pmH0BjQ6uuW9kU9v1AQVtvE5wgeqxgu/rUy00z00OOHdtoQ8i6/7D+y9m+IpMxl+1JRL8UP1PPaIz41IZLFw7u088vsOAYm1pL6CFj01uEoI8J0sNE7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:10 +0000
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Fri, 21 Feb 2025 16:55:15 +0100
Message-Id: <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e6bd2cd5-0ad9-457d-a069-08dd5290424d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ixV0sbDeM41x4KfoZ96V2aAJZTuq4xCOo9M/a4oylUamYz0xXgb7SaINbn/u?=
 =?us-ascii?Q?tHk2FaPAWXbeEDcvMW7KAqphhNZopqhM60BuRBlmFIceHc8aUwctMSzUiE37?=
 =?us-ascii?Q?boYnldPh4KKWFINArwiV89r9ifE4kHZBSp0f6FoGPjDmkRPTa2BmBQjdFglr?=
 =?us-ascii?Q?94Ry/c1TWflkPB4FTxsfe31FV8ViCCTGi7FiatCf+ZIAnQ2rHwJnpTokg1PQ?=
 =?us-ascii?Q?s4p6LjutGMVakGFyMLnmRIHKAng2FRmMs+/IoQwVF5Xgu4Hk7IjRUJChdtTK?=
 =?us-ascii?Q?Eg4t7G4Ujz9nqrl4wffkTfCSsvfI1mTQGhRbD5dvsuXXxEg4nvm32w3zoI0o?=
 =?us-ascii?Q?/uEtGazVxZzbE0eWaT+kXw9V4O7j1L6Prc+WBLa7fD6DPcPnlDdaZxzN3Fl+?=
 =?us-ascii?Q?O+FcBcS0PZSI3wTvxy0GAdwvFKqpmq5hHkjyWIQz7CF3KTfBA7S5q5KZCf86?=
 =?us-ascii?Q?BRMPUZs1lLf/w2BM9MVeQkihQ4moFff+qEFFfQfUFhZfop1h7U+D9ScT01sp?=
 =?us-ascii?Q?OnXBQnpD8Mu2KvqaHyd2B4FQLzXD3YQ0V8yWasYo/06qqhzTemugLG72Qu+R?=
 =?us-ascii?Q?NwiFTrhMdZW+tggOW5erm9wvH3GDngu0BcSkzn0JQEPWjg8cVn/zhp1scj6v?=
 =?us-ascii?Q?xq42KqAY1CE2PjKGzoeALuVIuxy5mGxKs0fwyEvvGSmS/nZMnuVPlv5Tf44Y?=
 =?us-ascii?Q?KLch+L6nsOv0DPzqGzGWeoDDNGrngiM502WZ3oH4UB2aqql3R2xC9yYgA2xf?=
 =?us-ascii?Q?EvfvPtVOOhessamxanlWQGPR8owvWchz2R0R+P0OnzEqYyE9JOIijN8P1oVJ?=
 =?us-ascii?Q?yhEqU6AzP4fHiNsMtpItxZutBA1vQmt9uRF6Ib9+ABC2XOOZPI1IcZLCt0c6?=
 =?us-ascii?Q?VU5cCI6Hsf47rDOGDM5gGo6prZJag/TvI8DY8L8JSvRfIgQYJ/hHlRi8fh2C?=
 =?us-ascii?Q?I7K7uInMPP3pAI0Wqx057NmKu1lY//yxPw3P6MqgoSsRt7kM0MB1zI3/Qbi5?=
 =?us-ascii?Q?udA7lv75wHCy/W3bGrImRynZRw6aKdEurEPLCA82ngHEJXbE9L6k5z3Uu6UC?=
 =?us-ascii?Q?0T9Iim8cymrzNlrb/5HFEOG6aNddt6DsLSs7GyrsmIcuo66jRduVGmoMDrEj?=
 =?us-ascii?Q?0G0RlLeE1zmEdfPccdZhi6aNKl2ctwlPYDKJzPmDDBPrgJIDW3sl6yNwZOj/?=
 =?us-ascii?Q?nXZ7jL2ix01a6QG9HFYESxd63gGJ1wAy7uUA5I7udE1HL4iFylrOgVU5l0JN?=
 =?us-ascii?Q?470BJdDtSifXeNebe/HasRfK5K7PWfmwaFJUQtKPYwjAUGLOCnrLVip9Y8xq?=
 =?us-ascii?Q?tvW2ICl8dKiJkgt71HLSo2JOuk07PCAMRDgANPyP3/6/i8abVjmX5IwWLDYx?=
 =?us-ascii?Q?oAwZKu+WTYiU83tLUoyMbzZgP77z5AgxmUwSMq7aix5wAabY3YOPZ7+5cpRS?=
 =?us-ascii?Q?/rOpzzk8AiQGKa+XDJf/K93ZfG7AOleY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?clqN1dCtFqtCoQSTu/B5xFzAtNK1oX7HPrHqtW+tW+gcWkC8GF0MDEvPXk1T?=
 =?us-ascii?Q?0drvqXo5UjfcvSDW8vDuQtAXQlCsT/1HOPBypHfmWnHoxLKhX6diS9npMixh?=
 =?us-ascii?Q?7MXrDIe9Zp/XxJGwHfjd+fuCrAvUtV1XdLMf7LtZ/PxWyx4iMmiPSn0xoAb4?=
 =?us-ascii?Q?3rxXITZbxvWOx1LrtmYe3E40CdQbVZ5EJrmebKnZ40Aeb2qZHc1TPKGPaaae?=
 =?us-ascii?Q?aivcHDa0PN+FbGhMXD6IKPdWHrpFhAyT2idl9u+ZZ8A+OmqUXx36u0/gwBkG?=
 =?us-ascii?Q?hfp99xGkjGihZxv24qDZIL0KyfjaCy6YILEfsns9D3M5BRvjamo9D1fJVcGS?=
 =?us-ascii?Q?hsnYTY3CJljvkYQ9HNFEAbRi+gnNz3J32d02UVMrZAmX9RvXq8Gw+gHsLrMX?=
 =?us-ascii?Q?RQKE7Ds8lbT6/hbuL01iN2DxpiPSp+rHeeUBu75phX0KpGedw73qbg/2wwVT?=
 =?us-ascii?Q?dPALInTa6Cptig12X9NcVfdOtvKqgWp3GfqDjyBo5HDTqV1epPI1W9xhJT7q?=
 =?us-ascii?Q?16/L9pY58815cDyomPrwsTDnAWertdbcfMhXa4qZVIEjN6nU8webxQ+39TGw?=
 =?us-ascii?Q?4vUsCgPZ0rjRfNngALFE7bRwwLnspoQeoJ+SbW3RSPbMY5cDi8HYgua0RkzL?=
 =?us-ascii?Q?vsXEzh9WW31l3rGuBPST5TcoI8KeduaSbmYQQef3m7yIjnJJWrx88qKfEUrt?=
 =?us-ascii?Q?kNiyOW4HDR5Jko/EJU3qXZ5t8gIHtgiAynsZOnLmkcknuffxgzED/IsNhfI1?=
 =?us-ascii?Q?lgPs2Sev6APeBndUj5k8a6hUKHVB7hZ3c3KmRYY6bTli/5z0nYD9Kc/PEaAm?=
 =?us-ascii?Q?6D2e3anh1td6/csKYrkREm+/TOlsi9+kOdLZ3QqQrCn231ADgkdnX2+qXo6E?=
 =?us-ascii?Q?AHOvbcVN6ks+N53Bn6XxALyidKAwHMc4fLkPNhIh59WiFulad0ra8NadiP0G?=
 =?us-ascii?Q?PPVWqpbaC2qy4d9bLFFhfk3vMf71z4SqDArDp1UYjU354GYKPW/lb9HPlpCQ?=
 =?us-ascii?Q?cx4uKMMmNIT+hFwRzzdcJgkaxcumdmtJuUfPhxtnKAV49GIQSJp9ITo5wa7M?=
 =?us-ascii?Q?4W62EM079+YWvjpS9w+ToUJiUu09i5G8WAysQqaE/HFDhHg6kBGp2voyIR2P?=
 =?us-ascii?Q?0LLwV9Wi8HRIV/W0dHYxWyId50V58TTu7iqP++/c/KCi8tjTwPO8+9/BFaPW?=
 =?us-ascii?Q?Njk6pK3TvSH4kPaO84WFvGHxvYCx2PoTnIZQM0nQnsl4XYnH+mK0D564aB9Y?=
 =?us-ascii?Q?ruiCrO9TRetlU1vJCXWESK1GthTXugbkbXVLcbYfOfiK1xBpRhKMNZZK7AwS?=
 =?us-ascii?Q?t7epwdxHPAhQcPapc5IaijcLBLbEHyrzom0I0YkPKMXGs2BpvSTQWeD76wri?=
 =?us-ascii?Q?Fehoy7aP8D4nSK6zmweGew+uzcpHmtylURgeqZL1EdkMnE1fsm8J6JpLsSwL?=
 =?us-ascii?Q?1F/RQ8t445t2IMALuteFA8H5kh1w+NcOoTC70DJ1r7ciKqCV0ZR19zC1GZJ1?=
 =?us-ascii?Q?SMMn8WXq8opr235QLtqTQtDNiAwRZB/bHHSqZuUdt9kTt+wLobh5mnvAZPmh?=
 =?us-ascii?Q?KLXnV9A/puHE2sOYXPgul/5AVMRn+ZvHPX18oeUM2PIXooOmAwgnqWAZytto?=
 =?us-ascii?Q?6YoPHL46E+LGk65bTBa9TGQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bd2cd5-0ad9-457d-a069-08dd5290424d
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:10.0837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8QH6r0uuwQbGz6oRHfDYbLiEwmp0qhmb1bMbuZVQh3w54apS4CtW0W0rSIrwEj0sCCjiAoC4lgqp6m40nHIIvN4/sQwVInPSfP5iEBbPPcLQ7Du2IDPtZlLCLHYL7Qf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
found on the Renesas RZ/G2L SoC, with the following differences:
- A different D-PHY
- Additional registers for the MIPI CSI-2 link
- Only two clocks

Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Dropped empty line as suggested by LPinchart
 - Fixed minItems into else conditional block as suggested by RHerring

 .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5b..1d7784e8af16 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -17,12 +17,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-csi2       # RZ/G2UL
-          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
-          - renesas,r9a07g054-csi2       # RZ/V2L
-      - const: renesas,rzg2l-csi2
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-csi2 # RZ/G2UL
+              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
+              - renesas,r9a07g054-csi2 # RZ/V2L
+          - const: renesas,rzg2l-csi2
+      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -31,16 +33,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Internal clock for connecting CRU and MIPI
-      - description: CRU Main clock
-      - description: CRU Register access clock
+    oneOf:
+      - items:
+          - description: Internal clock for connecting CRU and MIPI
+          - description: CRU Main clock
+          - description: CRU Register access clock
+      - items:
+          - description: CRU Main clock
+          - description: CRU Register access clock
 
   clock-names:
-    items:
-      - const: system
-      - const: video
-      - const: apb
+    oneOf:
+      - items:
+          - const: system
+          - const: video
+          - const: apb
+      - items:
+          - const: video
+          - const: apb
 
   power-domains:
     maxItems: 1
@@ -48,7 +58,7 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
 
   reset-names:
     items:
@@ -101,6 +111,25 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-csi2
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


