Return-Path: <linux-media+bounces-29880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CCA83C37
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0623E7AB767
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524E220AF9B;
	Thu, 10 Apr 2025 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v8Eo56T0"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6955E13C695;
	Thu, 10 Apr 2025 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272834; cv=fail; b=i5NLGpePWyjZKd1fOBNjBizEDJ6YbXZ2r03cnZKhi5wp7ksefF77FQXZCbPbvo8K/eEO0SOotNDY2iZXC7HfKUZ8ZoJROsL2yV4s6r1igGBa69tv1n6fbp2424rOlaFa7YooCv1CkSeqPrFNFNe3oGp9jA9AHQYdJklwRInJ0nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272834; c=relaxed/simple;
	bh=WB0gky+PvyKTq9GLo3NZzCeLeTxen0u7m3GVboV+bxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iy5AElii/gUenCiZ2yasLfiBO+XCcd8yJ5ykno2w3X8nHy40Fr/mKlSpXG51i17c8WS5nPhzxdSZI/u4zhCXRskPtR3Q6vU5sm7F4eRPEvm5xvT5/RTrTOAQJZ15fKHCdAQbkcON4xpHUs7bAdRIAWqtTXRi/JWpZyKEXSKEXqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v8Eo56T0; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBb0jKKc/wnu6Jq8McRi98HmmS819n1CrRjV1Kph9YKqVZxWiwFW64vcamGnVyyg7I5fkeoaT+Vv0RqoCRXwwnw1y6AylHP9cN2dbJsl4sx6qbRKp7CmuhBHcuQ4cWb4ITSdGGh/BxeUbSSntsQ0AJ9/K2iY0tFW/KpQPhDc97O50Vs1TmMrYR3qPLUuGzP2/e6jUayzF/EWwen7c7rMj/MK1Z4G/IYsR+6JeMg0UTj5BlQCkS47R34VkvlIRjPOaN0/1G35c6Xpa5jH38wCr6ltvzE77coWNyfn7e4T2Ovq98yZwjsv8AwxBkVw2ZFo0/+9IZNao306oVUkJ861Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aYkYpLNwH4DvxRbvPmdoz+LCX596HB0t9+usGAwlmI=;
 b=XREf6oX3dto61eZHbLYX41tOCIEuLFGYRy6ePf0hyreeNgwctXPrlCLP1ZxSbBwT9l2StOUI5GpUa7KUdogSq5EHFe63k7QNPTU00h6mbD/+dlRc6TYAQOKEBNf/5gyAaOnHJIGTc4zinhgdmnOZh86Syy7LnX/ueRdil4wWJTfTClSaHIWVuPEN27PZhy8eM1EkPKPJYALZgcbY1uRLXh7SRbrV04SfyheKsAAnDH2KJ+WJ7I+Gq/ZGtKvX7N38m+I5JlNoqZX5HPwKbshHPafkciRNK/Zo+Y5UEBui84tage8lebhzheGrJgpydtqkLFIGB8he0XsTXjOtndQz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aYkYpLNwH4DvxRbvPmdoz+LCX596HB0t9+usGAwlmI=;
 b=v8Eo56T07swLQYq+puYr21a0s8Y8vgc1z/7CqIGnBUkkDEipfcoX9W85lrdA/CLxxXfLRAtl0xrcZE4gStQPL6f8nG4m34riGcGRkswGsRt2fg3DKdVd630W+S6lBE6JSnjIWfyrplPW5wczW0PiD+QRMwUiU0bRC/Yca5TRFr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10119.jpnprd01.prod.outlook.com (2603:1096:400:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 08:13:43 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:13:43 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Thu, 10 Apr 2025 10:12:06 +0200
Message-ID: <20250410081300.3133959-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b59f2aff-9d3f-4f6e-5787-08dd78079be3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JmeDwOWTyNq1fg0pXPetlIG8p/S9sC+CSlq92vyJwwJRL8dSzPQlYzvcTGQm?=
 =?us-ascii?Q?KuYJOg+2QYypPThSNEjRfR79JxnbkU4FYtwT0/NMCXw+OdpoO5njUCfatFM0?=
 =?us-ascii?Q?R0Ou+I8XN3guMaIXUlUKDDXteTmsVDmrqGzm1vwlDmMEKO5Sd/k6+XN1c9C9?=
 =?us-ascii?Q?KddE5OnOEIUVdK0aJ+fuvyciQXcckMOMSM2dzvi443SdJIRH3Se7dIbx3b8s?=
 =?us-ascii?Q?uRL4zFjfqErCnYuQQAog1ldkV+C+5/FYhX6qZQbxum16Hyhp66H+hQ/2+GfP?=
 =?us-ascii?Q?yXiReG5sES2sUdygeMao3tiEbwVokM/jmYvNfKnqtL1RX0UorGfoD/h/fKaJ?=
 =?us-ascii?Q?O8OOtHqsbY+0Ix0EdxOqHVK6d1cZ74l/5Fd7HlqGfw0M7QHYF4//rB9vSzCi?=
 =?us-ascii?Q?SpNYvalU2E5k3ATklyzwqzeco3GY+2zjqpZ/6sownWZKIry/KApwUSaBDTyH?=
 =?us-ascii?Q?aQA05V4lB7fNae6onw3BIXfZRrmLH+2aQJceBH07rOUJAri6/1yr1RZS1Qtk?=
 =?us-ascii?Q?AbeZroOfchIrg0iOLpjnCcbr+H4rDqhnoVzf0iWMwW6ainaRakueTAYWCNo2?=
 =?us-ascii?Q?L1yX9aE70HeOXTnqBztSnCioLKcm8OZTOItnsLYjfsOK0PWz2HIhpvlTnETA?=
 =?us-ascii?Q?CtwtJTuIHGeS+9kH5R2UhBTp0vXJwCLl6v6qStzdgq/CdNBO3BRNlqDAtXUd?=
 =?us-ascii?Q?pbGsGD620AOvTgutBV8MNoYuw38PYM3togBgj4MwUaeQvY6w6VQCwsb1FNyE?=
 =?us-ascii?Q?q45jWoamzTo5yTzBTbpOgEvIwbP9kur8UcRDW+NgkrMKPtrCktGCRH6rjqfR?=
 =?us-ascii?Q?SMGyu2lN9RZsofBDwip8PS1qjgiotJw5sTPiPq8ub+Mg2FfdNA+7A7Dq8BRG?=
 =?us-ascii?Q?rkec+HMYw2BVPLIxDPoRvglj2tVnbK7t+zBm9j4N4v9YIe7XmjH0/F0oyr8H?=
 =?us-ascii?Q?WOWgqudMCNhZnwcpf3l7BfXuI1m9GR/yx/K9gEjJ1tKv+RXcXzgbtniah/LP?=
 =?us-ascii?Q?Nhnw/elVJpC4gc42A3agfVFyYrCThO7wqJtNEdkx0RrIWhb64Ua3hbZQpUGE?=
 =?us-ascii?Q?mN5OQ4DjOXmmz/43P1bXGA8aLz11RUtS6olaj4p5dVE8oRI8h2JHm/z2VJkC?=
 =?us-ascii?Q?A0OoYCA4hekbjtgacaDp7Zt0gD96W34SeOrkRbE3HE+A4uHuH12p3Fd77+LT?=
 =?us-ascii?Q?RM9gc0WEouFfhMrbC6Es7YEZsOWiL1+7VPuEwqcB4IJrEjPKq5M/jZ/vM1vk?=
 =?us-ascii?Q?NGk/ueGbCS0S9qgfNLyINF5kOl4OGNw3GGY/ok08OnTF3MdrCyKWxEHCaeg8?=
 =?us-ascii?Q?vn2iXDhpqwFnqj0ZdN6nWpXEznmW+Sv+JMq3OCSWJQu+sW/2+odQ/Q7Ce0Id?=
 =?us-ascii?Q?1KoOgLtWuTSeMmF8kQ7Y0qZgvKW/srUBxK1wxcGqCZn6aosHAIGxFeUX/0WU?=
 =?us-ascii?Q?4EBxMKcNjR00fcUnIHlLoz62ncgNT7KYUcODEphRTywb1AQC4TZj2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vSn15UpapO6antYt28SkvuiGvfU7+86VWNMw49h78zrWDoHlNYIQORHLligX?=
 =?us-ascii?Q?Qi09pLgBTXSzJE38BLQdTUmyFi31ef2bayxKlSrbnnyIbY51EROZgU3AdGhY?=
 =?us-ascii?Q?llN7W3XO6OtzJOvj5l2SM0xwasDWLJzOLnzmo+z3Qrcr3Ad7gEl7JVy984Rb?=
 =?us-ascii?Q?0r+5WU8RPIS55QO5DBOBGrsOJh3UA0DPGSzx8zimJ14+RjYNXd9g6PTmf+ZH?=
 =?us-ascii?Q?cSUZYK1okqPeF8UX4RQCPZcbWsLX4N8e3ASFdRhgAB9X2p4oY63AEyq4mDTg?=
 =?us-ascii?Q?s75AGgL2+ov0aJ/BaNCl/E3V3tjdYwolG2LrBW2c8DoAFoUs744M8JmFHg2U?=
 =?us-ascii?Q?PzbhuY1avtjko569KQDi0F4dWn7cG7/vxsnSkD5gHuWkI9znuBx+QH4hTrWE?=
 =?us-ascii?Q?7IwCIt+Mp+enV5FF0PspV7AbmHQYP53iD9ezECpxd8sfhGC/TIHgCscpc/fV?=
 =?us-ascii?Q?YY9uMiZylQ1+ETVwCMB+ye4YZCwJv9lCNN/4T4DdyVL5CgBylzWW1+Y4Ldyg?=
 =?us-ascii?Q?AuxjLC2URIpSCqYlHXwxnPlp+D/dFftR7vP/VohyujWw8uw8Hw+zjs0G1oR6?=
 =?us-ascii?Q?DU4alpXG9E7sj3OKfGjK40OKVyBAZx7sJ452W/hgJV3o1hOgOBiCQvVwtaaz?=
 =?us-ascii?Q?1MaEWayZ7My5NO4Eg1AnJMNq0jOsj/KaUDnz1P1CVbJIG1iK9yxA4PRi9acA?=
 =?us-ascii?Q?xbVOUz5oSWvCbbTd8qDXXSbo2wiNkPqzq+X4wf963JB2Qc4ArEH3szKlyswc?=
 =?us-ascii?Q?PRljJDGlVgq199wecjHf+GCvDBxl0ZaqT1ErSh2Uf1GvB2FPDvBh2MDacmlJ?=
 =?us-ascii?Q?1Mzzf2Mo53J1kYxbD+F98vpmOLgBNP6DYYK6prQSFqMnH6E4Yb2NuBvNP18B?=
 =?us-ascii?Q?XN0uqhZFqJnh1dC7fD4gEINxc1QlvDgqCIPHbBDeD553l74X7hxMNYoZV1Az?=
 =?us-ascii?Q?moASmN0MZzkVu8DA3fSGowYh2TfcgxxNgnZMGNJeIVFJaYe41GsrFzDUAXmQ?=
 =?us-ascii?Q?2CQp0CV2fC6xMLbzWEb1rxXtAFfXqwft3n3FW1UPzGKTPx6QYZcvdlKXeN3a?=
 =?us-ascii?Q?3urdgcdy3mK06NFs+jS68AJjWiSXI8q6Zoh0LzOHkqXkL5n/ZIDCthRFEgcr?=
 =?us-ascii?Q?X2KDKTpeX5zVnH8yhgEeLsMSawYJEZ+C13bohtWoWBS9fCT6qcc/PQ5w4/Kg?=
 =?us-ascii?Q?U96A8Mp7ahiDSGbhXM7fFOEdRBtVUoQJ6GXz8uvGkmK/f7eCKn9wGSET6XgA?=
 =?us-ascii?Q?w8i/Jsmbw4tboagnZkHEquocekdgY42oflCKzFpa3AqWC4AVAAaox57W5QQC?=
 =?us-ascii?Q?5d43pgkt/Zb/ilrEsHOePDhURF0SjLjr30g7cFz2wpgb3GP00U7oiCoql5Ua?=
 =?us-ascii?Q?Sozdm/fUtIXhi8cuEe7eF5GPBjUw41mCmPo5uai/IiKUxZ+7kBTs3m+B1TBS?=
 =?us-ascii?Q?T32HJqCfEZViePTf9vWZwDl0Euj0ogjv4EYlsXtTwzGJYPaFmO8H+mDPBO37?=
 =?us-ascii?Q?RbCeQY1S89t41qcI2/OWiz4JH3GATrHk0E2rzMrRN4oDWeC1dIMWcBerRp9A?=
 =?us-ascii?Q?qgydWjh2XWY6rkipXWCC1+oc49+PQG23veXMAeajeLVbtX55S7uu+yPt+Yft?=
 =?us-ascii?Q?oBwNue0FVt3nCXyWfEAgVWk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59f2aff-9d3f-4f6e-5787-08dd78079be3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:13:43.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbp01YM+1gr2NdcSsoVlU+FVHDpa2DTqe48UZVe1q4UcC1nJXJxlFUBaAnJqogQB/a1RZlM8uqnoNxJbP74ukG1GLSHjQL7CdPA/54mZkRZ0f2OeJrfOfSbQ24Ds+yKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10119

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed CRU_CMN_RSTB as suggested by LPinchart
 - Collected tags.

Changes since v3:
 - Collected tag.

 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 1f9ee37584b34..c5c511c9f0db2 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -24,6 +24,9 @@ properties:
               - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
               - renesas,r9a07g054-csi2 # RZ/V2L
           - const: renesas,rzg2l-csi2
+      - items:
+          - const: renesas,r9a09g047-csi2 # RZ/G3E
+          - const: renesas,r9a09g057-csi2
       - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
-- 
2.43.0


