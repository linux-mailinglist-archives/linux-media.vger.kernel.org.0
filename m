Return-Path: <linux-media+bounces-29881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F838A83C49
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A6417AF92
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8855220B803;
	Thu, 10 Apr 2025 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BtueWe0l"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857F1F03FB;
	Thu, 10 Apr 2025 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272840; cv=fail; b=Fm2oDwiqmvJaCHoPBj354h0A4wpVfrXP5kyOr1Uglc03Zp+4vY1j2vIbXLRpGi0lykg0+7Y/JcZwm7cmJBNVmFfUGqyeloIh1Ctr8JwJYBGr4XfyLtUKSbCz6kvCZ5hGo1mOlAXluDfgj42UIPqQOEUnql+XmNJmoencz5UkQ6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272840; c=relaxed/simple;
	bh=5lZh7HN+FhdMMBUEgU0P/qwv/7pYJNB9JrQ4K7QqGKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CHHWaCYzkQJHGSkz/R/bgVIW6p6ieXFmjXWXC/EL40/C5FazpGYATVvhnon+STumbRKxha+HlyeL+gDg1qVh54Mamxuc3xW484bMPa02/mSeAWOvfsQcVG7e7OVKseM7a8gjGTbvDYvFv8+y5RukT2I5NQ1mXx1nKpht2wMAr60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BtueWe0l; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGTmboG7bJVDAxBN/g3crdthPnWtAbHbgPjBO/ZLsvulpf3R+dI4hTzgtwzhpMgSmz+Em+FNaHIsdO/ScXFD4urEULkTJDsBGqFQyzv1JV7lyO0dpvq6dgHkALMC7COlDhzM+lAsSQ3nxPzOX/6vc1z4SpiqQySyvTdGjG3unULaf5aduvHVRKLaZJki4Z5YX3RuFtgfaC3OVvRrd6EW/9xwpC2MctGglWitwXuwflORPfQ1AKvafoj6UuZSQbm4/AUmL1Od2XyJfn0cT6v+E0cBa1LQHArS5aJZeEybnZtSYB5zPE6U8a9oyP848pQeqVOHAxfszOAUHoBlrmI6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKusPT3wHBmXFoee0MVMf1m+kJjTUL3CN92mSEDV6z4=;
 b=TyoeSpVzzy6xy+yh9YozGVl8TfOiHlDjPcjfqTWg0UZ7DFXZ2ern3h5tpf2/oyFJyOhvj7RyTm9zKhYQ8wSr4eVFhEpAAzh1YZzk+VzY0GqzjJlmq5EycwK2YitGuabAqCzJbLRfIMTMEQHlo05c4gOfbCp3DsqszEq9LhPFpuDdiJCXIV6MbF+CT4ViMNWOiYFF6bITYzq/rh3Bs3LiowF4M0i2s5tL7euXx5kKMqz4GlJBt3ZrXvpRrJ+p/eGVc+jFIXtXJ/AyLsFvIhey+MpXcDs7/6csvQgPq6NaZeTPrk+0WjTt9cgRYV70gWSVfpwDvwX9TCYYDCviRzLPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKusPT3wHBmXFoee0MVMf1m+kJjTUL3CN92mSEDV6z4=;
 b=BtueWe0lc76QM5em+heNukVONLafV/qgnblXxezp/PSKG7eBryniwPGZX8tfCfChSPsJihM3zFoPeChSltMm+QNVJo+y/bCAkLASAuGlsULopu0oZvvU6B3tgzbESqbDvEE8ZoA8XU3oPHib0auR19N0oGA72H0VR8g06Z3X5yg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10119.jpnprd01.prod.outlook.com (2603:1096:400:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 08:13:49 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:13:49 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/17] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Thu, 10 Apr 2025 10:12:07 +0200
Message-ID: <20250410081300.3133959-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: 56839725-3e7d-4eab-b28a-08dd78079f7f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7b180/INp+sc2FkRsAXtKcsHXY7pF6OApAfdiIw90g+z0LZuCFz+Boq6KWq6?=
 =?us-ascii?Q?zjA6XBULXnYCoHkre2kZRswYeX2bKWMZ8Sko0jjKds5GzbXLB+cRdSJqOfTo?=
 =?us-ascii?Q?5+EvCxY+U59f2yWoFSAytbPPslrcluYRjhd2fL8ZcHCwHchhAx7LY7TAfxwX?=
 =?us-ascii?Q?GLfKGZE/kU/+vKcGTjE53LBu8HOR6Us6oMW6ezmddwsQP5uAHmsPbnBqT1v4?=
 =?us-ascii?Q?vkwtQ+lwH3SMCoA4eGKf6L71mtBKzEUBxnI9khLu3fpNJd2PmiH6nsq8kYOK?=
 =?us-ascii?Q?qdIFxPElqUIET+umvMCNkGlj3VzhV+/ZEl64B2TJG8K687ZrOg2a5oBOC9xB?=
 =?us-ascii?Q?mfKoSr37VlxAfGlnoen6S/ugp76e0oEbjEEQseEIxcoQIqIEgKyx+uOd6Bm1?=
 =?us-ascii?Q?kfJhZv6NGugKy6bhvkPr4sW4DQc8K+qF+xRkD/Bnl3ns4loiQBH1OjAOkOMv?=
 =?us-ascii?Q?kat4udKoZrXK/iNTAEeXD6vKJtnWXZ123NfkAn5kp0VDN7AUhbjYRMgN5AoJ?=
 =?us-ascii?Q?Lkyy2eVYP7oGY7PmrgJAM3h5NTFQPPtcHT7jZ7S4EHLf2Uo57fd4+ZcldrSw?=
 =?us-ascii?Q?b6785u8K9zYKnf7M83MXzPIx4WpyCOisCA8PrSAsDpNig6++OT3VDLy1r2h/?=
 =?us-ascii?Q?Rdb7M+sMp3ovNkBR8EWKLqFexAocCw/u7kZqqAF5+aCCMrBRBlQWnHD8CRAz?=
 =?us-ascii?Q?cBWt7BwI/mhqzlHk8rMI6pM0+9Yw0duUqroz6eXIzWIgyC6v37Y5vf4cnj3D?=
 =?us-ascii?Q?C/i2YfcWlqr+bNcEEyAr6CPwD/QUUAxzOWmYjCXejhnFFwUyw4rMwYI7E/tx?=
 =?us-ascii?Q?uR4ULFSdHXBXwlFlRQ1Tj+cotZTGD53Poouc8kYuMEO2/aZDtxUH3kLLY2zi?=
 =?us-ascii?Q?oiEQHYkeIvjh5B1YsRzEewcCXINS7mWoYrUUXMxNap6DOph9X8mgo08HdvgU?=
 =?us-ascii?Q?3V/qINXDMj6o2z4KS1tRX53tGnyQGvPSYTy6jeU2GoqFQC/nwo80bhiG+TF9?=
 =?us-ascii?Q?QX4VsMtjhEO5ItpyxViJi+4/RyMPM+NCgAmf+ZMwPmwpU+/tzj6LR06zdv8a?=
 =?us-ascii?Q?KeIbZ8qxa6n3D0al7n9w6NWZEv5U9/lkSZtHAr3bJ/+dVfUOoDh8ssohIO+9?=
 =?us-ascii?Q?1n2XOioYF6zkORMJWiJvefey16qAZ64IHbNLb3XTTKeeyuZdhyq2hHNlt3/m?=
 =?us-ascii?Q?MIOo96pAN43GFJCHGsQGqisFyNJrFJUlVoWqIp1lgeeJFX9GbJDWVjn5LM4l?=
 =?us-ascii?Q?IqqLk9p3gQdWGAxD25PqVhPmDT5+2ftbyzao3FZvtcO0guv8A/IWe+Zj0T1L?=
 =?us-ascii?Q?OTRNDRdbqHArL6L15/7mw2AZk8Yel3FLYX6jl9oafiQIFHuFLo1Vl2Bwk/Fc?=
 =?us-ascii?Q?P6IwKOustkCm9IqGx9WEOSUYbkRaPyA8ee164w6iUEIBhGzhC26K3LQQHzwF?=
 =?us-ascii?Q?Ruu9Y4LwEah4b7TbXuyYevsC4n8GT+9rdj9TVUnKaJGRAqX9zZImXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CTy/W9LZQ5spB5ZNUXPeQ0+fEGXCtMFmL9IYXMvGCda3Mw7nCoOE2lMIv/jT?=
 =?us-ascii?Q?72J0V9E3A/mmkt5+o4sXaVpM+VmRVdpK950z0Lz3Psh3YCoD6SxSanEfeqIm?=
 =?us-ascii?Q?K703nieNbpbOobEAuAv1aAUgzFGf4ejEU8W+1wB6Kw90PAudFhOOxhiWEpkL?=
 =?us-ascii?Q?8s+5nyhDzNV3mAPC9N4sUtqSbGqRrIe1TJUfRkBCw3YDYCN1gohg7El4I92z?=
 =?us-ascii?Q?n//Hxz6mARBfZUF27wM7oS/k+sZR8ijJbsWPzdILLimEVliOA+QWUAi7znoh?=
 =?us-ascii?Q?M12JtYrGVCdHNVhTL/acFHZ4iWqRmlESEL9Y2bN7ZKlUUcpFPAZEYFjJ7jrB?=
 =?us-ascii?Q?5lpVd5LYAxdjnGYxblfY6uHVUxMsVp2BY3uH93h0FRj1WDvnffXpDxT1s5AR?=
 =?us-ascii?Q?stL+6HR+SfLblM9N1tzfOVEbWCRHOUHG161mdHR//PXXi1KpakpYK9Xx953Y?=
 =?us-ascii?Q?431o3P/fjGfFyWDQsPgA3L/sx+bdOO0e/zGbx+Xzk+sv4v28mih7KrYwe+BK?=
 =?us-ascii?Q?UUA5OhFkh4rjzPwESG3qV3qBXKjdgJcAPMbgL79eV5i1uZKYuKvrQ8J+ANYC?=
 =?us-ascii?Q?LfIzsIRU7x43zQ/TD5aXO/89/L8bvtIK9cp1W+T5UEp25gRKpJvfQVsA5Xyk?=
 =?us-ascii?Q?OPXEZU1KhO1HW2F3pCssYf5u93e6Y+Wmt4FUT8H+xKi7+MJLw/jz+TMRTJn2?=
 =?us-ascii?Q?0GwPDaAsTiRK+25fdUNP+VEiqv33H2jmyACjPxz6Niy8cX3QOYtx8uwnWCGy?=
 =?us-ascii?Q?FGbmay0XtNmdcVt5A3vEfgSygxqT8Ovr+rtMJWFQX/XOJVsAgmBNOmjeqk7v?=
 =?us-ascii?Q?WKGS2TjYnMYI2IztUVt6m7LPSoaI9wuCfdUKhphNyUi32xJYY/4jX7d64E6I?=
 =?us-ascii?Q?XjuKsfAx+pbS7q4dQ8GVWKq0MqzYDR8O3/ZrS84mZN2GL6huEwxD7QmgsllV?=
 =?us-ascii?Q?wPvo/Dg09bucjJ69s+9V2k/BRmC6Su6x++DjnFwg0keupMJ2WUZxDHBfg4IC?=
 =?us-ascii?Q?/mCdNmY0gOkcc9j8T4MvL4eIe+Ppazc98+1ECOSauBl5sDJ7nlxaHtfoJWZD?=
 =?us-ascii?Q?oqQnQc6ACVaoLQLDPp39/lYOwjm0825Y1rLQqRCQz79YhCGSfyv6OvS6jM4X?=
 =?us-ascii?Q?6zoXUCz/t2gtMebGgk+SufNT90429wuXClRWbreRUhGEV/20MVFoBv/dlp5z?=
 =?us-ascii?Q?iqZTvwc5saDWFdZY/FLRujPOI85GmSitSCaLG0062EM+kIk1zKfK2oSLYffp?=
 =?us-ascii?Q?m9PHBt0oRDbribEKxxgaYz4T/BtxaNdG8lI+c4CecJRkW+4f6YVE+9BJHh0U?=
 =?us-ascii?Q?cqomef0q2DfTOAdJkaVbgDt0UixfJ4gVVyL2JJ5ejCzZxzPBUhjNSTuxj2vQ?=
 =?us-ascii?Q?6iJUfftBbAxO0wwXb1FY70K+EXyn48ezBFSAPZgC1b/N44oO/wKtTpLUtONh?=
 =?us-ascii?Q?OeAPTep1nVru004YexKov+ghHq7Ft8dtBCChwKr2SGoScb0izXIG2KeSz/IR?=
 =?us-ascii?Q?b+WDdOrViVot32xC/CqVT6DejYU4rrkyz82mwd4He2fRtpsP9K88SGleyH9F?=
 =?us-ascii?Q?g7n5S7KZp31nTi86jyW2fplRL7w8T6ksvnWEFpXEe7evyYrNbMYLoWO5QwAr?=
 =?us-ascii?Q?xUeFjFLtC55XgUSqe2rNL98=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56839725-3e7d-4eab-b28a-08dd78079f7f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:13:49.5854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4l9zrrhc8b6HaiITYzT/3GSvOBqR3J7QHJVYyEn3QuM+LTHquFkwFVQPQpKB0ajfpQyeqRI6zCUkt3McwGs2VgwuyvrMUdIIRBUcYMy/QeiGcR7YZjRd/LWlXC5Z+rCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10119

The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
interrupts:

 - image_conv:    image_conv irq
 - axi_mst_err:   AXI master error level irq
 - vd_addr_wend:  Video data AXI master addr 0 write end irq
 - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
 - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq

This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.

Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Use oneOf for interrupts and interrupt-names
 - Handle interrupts and interrupt names base on soc variants

Changes since v2:
 - Collected tag.

 .../bindings/media/renesas,rzg2l-cru.yaml     | 65 +++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025e..47e18690fa570 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -17,24 +17,43 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-cru       # RZ/G2UL
-          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
-          - renesas,r9a07g054-cru       # RZ/V2L
-      - const: renesas,rzg2l-cru
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-cru       # RZ/G2UL
+              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
+              - renesas,r9a07g054-cru       # RZ/V2L
+          - const: renesas,rzg2l-cru
+      - const: renesas,r9a09g047-cru        # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 3
+    oneOf:
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU Interrupt for image_conv_err
+          - description: CRU AXI master error interrupt
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU AXI master error interrupt
+          - description: CRU Video Data AXI Master Address 0 Write End interrupt
+          - description: CRU Statistics data AXI master addr 0 write end interrupt
+          - description: CRU Video statistics data AXI master addr 0 write end interrupt
 
   interrupt-names:
-    items:
-      - const: image_conv
-      - const: image_conv_err
-      - const: axi_mst_err
+    oneOf:
+      - items:
+          - const: image_conv
+          - const: image_conv_err
+          - const: axi_mst_err
+      - items:
+          - const: image_conv
+          - const: axi_mst_err
+          - const: vd_addr_wend
+          - const: sd_addr_wend
+          - const: vsd_addr_wend
 
   clocks:
     items:
@@ -109,6 +128,10 @@ allOf:
               - renesas,r9a07g054-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           required:
             - port@0
@@ -122,10 +145,30 @@ allOf:
               - renesas,r9a07g043-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           properties:
             port@0: false
+          required:
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-cru
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+        ports:
+          properties:
+            port@0: false
           required:
             - port@1
 
-- 
2.43.0


