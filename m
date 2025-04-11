Return-Path: <linux-media+bounces-30045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F2A86420
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA02B4C3350
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36A322ACDA;
	Fri, 11 Apr 2025 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wbLgc7Os"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84022A7F1;
	Fri, 11 Apr 2025 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391235; cv=fail; b=ldby9SLfog9LHrrt1CPLwoJTOdkCYvw8oXBXmDUt+aMJp/TEhhlRe7YS/+jbS0KSgnrI3g4OQpODukvs0FYLsGuVojn3kc7AISzPPvpeBUqKSdL/enF+4M4e3Lr7OHOS854hkgXtUm0y2w9ZPvfRXYPoLd6XGT8RbzfIPcja8GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391235; c=relaxed/simple;
	bh=5lZh7HN+FhdMMBUEgU0P/qwv/7pYJNB9JrQ4K7QqGKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SVe8LnPBbuuj6S5a8PRf0L9lbhXaJYiukAvqYe01HQcURmYm0UbNshO/H8XHAYHFrFsJfvreO6FEuchWOUqvrddDN9NUTJbs0GejAY4NJEHRmFwjR830hyAbDrJymkgabfi1XjFdOvyyyCfp080ZHqJM6mwlCDowKLfo2hzeOyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wbLgc7Os; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdbzolxvEKHqSTkbH8smYZsSD8DXr+2Ry5zEgHwtFdpd+WdT9xcBH+mS7uJQux+6kedvltP3Av2gCzN7KsyocDGxHSAKfwtZmMX4m4Y3vh2kFqMuyyf0VAsfz0CE1bHtNKyScwFf4J9ggZnTf/3BVEmSgrf2WEElycCFSV3Q1TOGq/pywx7ku9NAm4fjzTx61iI28UiGDlCpFLcKqw4RXhTwT0xHFUQIpDeDLotZ0bpDZD1qKeb0VOKeAwBWqiDnqawKc3L+lrxWP5rUwJCOCz+AoMrrg1bXKvkRSiPHw/QYQE9gKwrnFpmh8nKJSWwlTLvFtO7mFDPBHMVlHgtqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKusPT3wHBmXFoee0MVMf1m+kJjTUL3CN92mSEDV6z4=;
 b=YWs39os3Q7vzSFtGqT3wPqy/OQO//IjXJcJi+3IWe6reECF6rwiEF3ZpaoMwD5CZ4Wf85GqHQ3GHpK7TTLnMyed//DHCkIk739W/EifaQr9GXkV4ZDfzsvp8YIGyGWjfoHtmKdAUhJMwUdGZP97i6p7OsEd5LfrBzvk4qP1lzpRht4kiyOgmVwTPjowiXzyWJ9hDZ7C9LWoPgqgyrPxkgU8PMWgSJmO09Nq6e6txAh72BSVFDGYs3EYYTGsmTzraK/Q1qEILMbt0GlMsD3m35ahnqSW/zHsX4ZRgIZ969cgBym93ONleZ0noDxJweXjI+o5gQgPpiinJLk7MdK7qsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKusPT3wHBmXFoee0MVMf1m+kJjTUL3CN92mSEDV6z4=;
 b=wbLgc7OsbFEtmkbPEkyYWobwItBQ8BUNBmeCo59zbdAg92RcF5n9N9SYN3sgi6o+9Rj+3p3IFVPT9ENkNlYntGjyGUnywvx3T3wpwstNmc5R5Gun42jvi4zkIP057vg9MltR/ZuvYPp2mdHP058ehlTqPqptdM4uJOFaDNGC/g8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:05 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:05 +0000
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
Subject: [PATCH v7 03/17] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Fri, 11 Apr 2025 19:05:31 +0200
Message-ID: <20250411170624.472257-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6675f17f-c62b-4340-b96b-08dd791b48ba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5BehwX8NdmtNx+j7zg8a/c1HpuhwMtELKV60tr+cjNYC5HJNXN4J3CAZG194?=
 =?us-ascii?Q?TDdHcFVfgvk95BV2R98qRBQYrdXD6A1IpLvfn2j9HfSHVuMpiA62uTD5dwfp?=
 =?us-ascii?Q?OIv7Dl0q+PB755fyCYm03SdWMbOLt87OTEjd3rtHqfywTzHDBS/yFkgVryvY?=
 =?us-ascii?Q?tgI2YYFtpleCSnvmL0Isc6YVgedkIGvlkkIldedAYaweb8Vm0X918IDFqDvT?=
 =?us-ascii?Q?2pwRKd0k6SukU3yh/CNFCrC2XlSZ5mqKQFszOTJ5R0jkYvOBCTYePK/8gc5k?=
 =?us-ascii?Q?jElyz6upfoqzIQZMevi3h/TTbQzOBYM5TdL334JE+pH+7UlKzisPhkeIW9Ur?=
 =?us-ascii?Q?4mdfzBsxSmORPFKksNkfmrdG2jP27gT2IxRaQeDS9Rn8MXp1vwTuHr0u4BDR?=
 =?us-ascii?Q?kJAQaImqsTmxtK9ClpgA2D4lDe6TlSgHv5Bm89X1jqrzijGqELcg9elSOd8n?=
 =?us-ascii?Q?++6T4bhQd1oBvDsNcvwiB/M8dncuCPSn+8Tb2mRb7is14X+k6q40M8k6AIIa?=
 =?us-ascii?Q?o+9JLTT0Lok1A4aEpOAMGEpuMh/RtXWikAvMgSW1yHp16Oda+zKk2Zhsj44m?=
 =?us-ascii?Q?MbJR1okE+niu+nlnFluilnHxSW+ytL6yHAlzPlaT0SKYNNq2gIqN8A/h65Nl?=
 =?us-ascii?Q?ScCn0e/lQJ/2QSpZQoICStilk9wZe28sc65BprHlw6UJ919YpTGEJ6eEy4J3?=
 =?us-ascii?Q?OSWYldwFMST9iqOmJNe8fDEF0D2vjSE02+JLZNCH8OlFTe/fd+2xhvmykpq4?=
 =?us-ascii?Q?OFb11h0eWYI75j01jxnsOtASk5VCGr7eSn6cKWZP6Fk9i+1+dTyTjh5d5CE3?=
 =?us-ascii?Q?7LiWBe4zOc2cU8ncELGWyxKmYEv1NVpSBOo8dpZKLuYtvYd3ZbfiTi4Si62s?=
 =?us-ascii?Q?83IXzbY972ZOkHAyRAd2UiJIh/yC0153foKHT6l2jMZhCigJ6GXGOfJSJBdU?=
 =?us-ascii?Q?6kIg4p8YMTPZwfxrSocpuKdR3fG8hrfnQsyPNFB3FPAnyWVZgFLAbS9A5zlo?=
 =?us-ascii?Q?HbxNBEAuUj1gVbCaC5KZ/XhkUubyjCj9tyKQsA3vV7fUCwYGmWk4TNp/1RV2?=
 =?us-ascii?Q?TKi9i8bIoQN+7GbsWD7dzhu352wDxPPBO/zKQY0sI4u61GwOmCR2qW/xSOIL?=
 =?us-ascii?Q?cHDAcOLUA9wcbjMrSepFD/1+OJiIDgMDwDlpiolBhaOGcwkY+TdXcG6O+l+F?=
 =?us-ascii?Q?AGYGICQuXHRDvcO52W776kLDy8exlv3A2/r53VWrMFw0y6zLDCwJxgJbmJnl?=
 =?us-ascii?Q?og+/YrvQDbND9GZBSWDiAiFTZsJZVSeYgiu2Lu1xoObsz6sxgniSfMVT35LA?=
 =?us-ascii?Q?mHeoZNUFzgaaB8eHmadDSG6gLE92nv0TRoxbPtLQG9ns1kkpS+0LIY+wPfC3?=
 =?us-ascii?Q?45xQ159Nt2/XdMqUMxU8TZjwePXVvB46yPriVjdG+7cT63fkY1yI29iECUc1?=
 =?us-ascii?Q?ZgmdilsX9cz+Km0IogkGbdfJnBM4inqDfF5h/4eVaVL77wlkax89fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DBn+G4o8xIFtrdhkgA0sXvWoul9Nb2/VKFwKqUgS5VY6BGyCMvOGpNKiP1Bq?=
 =?us-ascii?Q?aII4+lh3pvgHge87AS0jZKeBv9ACzNiRJD3d1r0pI3wvu4dxYgBkwEYJP1uc?=
 =?us-ascii?Q?rdTD/9dnW61YcbIwwzyZmUmNKAI3KK/EAVav7MbztCjIPplj7O1qqiU6fCf4?=
 =?us-ascii?Q?EYvwtRfoSBJxBXG+12J/Oacl68uWF1qNFMGWl4kqEPycAiTcP1vP/QAhneKr?=
 =?us-ascii?Q?xNKmAG+X3CB47ZAFoctlHnKPIB9eWrLQZjlOImlo1bsgHVXSfD4TwH9pGhEj?=
 =?us-ascii?Q?/f1/XjI6GfaN2m3XjQ/nRnoGG8BtsGSgiNqd9JUkSxkAx8AGXDKIZ+mhaYT9?=
 =?us-ascii?Q?1mthXxuPGsDFfj+bXnzV3DZiIt8AVqRQXqdfpGz4icFIz0qEnmzT2S3Kf2g5?=
 =?us-ascii?Q?cYxed04QLtDn8NRpFJmlXIeGuAiY6q7US7722EJrY4QM0xUethcBl3FjqmcP?=
 =?us-ascii?Q?wouoGi47o1QbSvuIfmtQyohZg94fsPac1Nzfafx4iNvQrxLCB6eDRb+KlTKA?=
 =?us-ascii?Q?sMYsVvdhLs9XjNYudu4HJN6asmTihtNSAaxVjvpyR+61phtNG5Y2yUB/B5ms?=
 =?us-ascii?Q?hpzUYYi5kY9yNJgGJby9vWiEGy1Sf4/tlYER6/Roexd6EMWWhDHQwLmTY87P?=
 =?us-ascii?Q?0pIicWeKAm/3ePqMMgt9DhiJC8qLpuGLPHsGXrGoKe39MFnX1UlQf1vgAVD0?=
 =?us-ascii?Q?qzlRTVZn3Sva798O4jATpfIAt85qeLEj7G+outUzHOTmIWRS5SLe0HuW2vto?=
 =?us-ascii?Q?FP8FKmimF2KpxFX07jaW6vfDlFLaEE0a77ZoHOFHtP0BYm3om6GrNj6i6WzM?=
 =?us-ascii?Q?tEVpYF1M8HB6KhtY7fH57vEBqJ9XHE8EumP6Ab1Ckn9xpJs7QdqQHaqXImPW?=
 =?us-ascii?Q?BWUcuxGwTPpH3f6NL0rpsO5RBuIsaW1yg2whyXq3gDtYHVmCMQMPjarOTPBD?=
 =?us-ascii?Q?QiXjiDL6ACgfNEahQZl/leqTXFrCNQhW8AQc/vhG9RRqDi+BI/wy0tq8E2K6?=
 =?us-ascii?Q?vHDWmxs15FebgyIhqEvRukyKK4ouO2/f8kMcdM3ZOPXRI1n/cAfMMd4sM137?=
 =?us-ascii?Q?o9faWlg5Votb3mEfdXIYRUNKPTm6u3BCXKc5DfBahByqDSE2WOY3hGu57NYc?=
 =?us-ascii?Q?U/UNGti3Gaqjbjn75AH4wf+WmSUTEcUU1ne9ghBbY0SLcCNZduNBhrU1qAM6?=
 =?us-ascii?Q?xdB5fuPvhjEZcAACcYsjNwx2VXXgmtUEN3qdMj4KPe2X8hM4qU4byuXdkCOU?=
 =?us-ascii?Q?NupckTXrFcJks/6XPl+brTeHjxyuEmTUl+rpTJuZ4YFWoN0/wZSNmERTiuom?=
 =?us-ascii?Q?YfUXOef5zvT4uI9bhk/+XKzcc48cEid+biPwKhqs68tPl4r6ZRgmsUeIptzb?=
 =?us-ascii?Q?hPRWt7vjGwe3dx1v03L1eu7w8bj0tcmCyJzN0o4lGvtMH+Z4wWGByXcOTQKi?=
 =?us-ascii?Q?hH5GrSHoaMnqMptkG+tgOuiKjoEDNFt47wwIdGKMVEB5QviBReqeib5ul0VX?=
 =?us-ascii?Q?xLSR3xGU8u6ZkreuVk9vFDTc/540wT39U21Y59roA3Qt7tNL/iU+bH/ZgWVl?=
 =?us-ascii?Q?8dpuATQZ51WCtvuTh7X44sorguGA3xpQz7PnleTZmRgCl/wdo/EShmCfb8Xd?=
 =?us-ascii?Q?qP2TQjBbRgNUlfeQuHT/Iuc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6675f17f-c62b-4340-b96b-08dd791b48ba
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:05.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7eFJcjC2iHy6F5i2zHskMPpNo7fDG0yJUuiLlJ521cG2OCrZRlibjRnPPNY62jwchoHewh9rCNwNH/ZvXuGes3FJjuG8F2yP/rkj92LFEn9PWzIxvrFOcBippoMhQ6o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

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


