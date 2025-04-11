Return-Path: <linux-media+bounces-30072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA924A86862
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 23:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39A7175CEA
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 21:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028B290BC8;
	Fri, 11 Apr 2025 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RwSGvrxe"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4E221ABD1;
	Fri, 11 Apr 2025 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407382; cv=fail; b=qBC+E0yVOZtvfYaHaVitOpNR0xNfwxfyNNkxZG09VS8fJkseOUu/SsQUNlLzBpOpNPAM2R81GNES61ixlyHYxwaSiQxA9Q2etiABL3aooqqleWxaelPMn2VCFY2FYGK1TS6806qn1jgEU6QMipAuPP0aNTsoQp18jokyQKAe21o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407382; c=relaxed/simple;
	bh=DdjVnv6ESa+NACKMre0bmuM4BDRoh0W9FwcFcY5Npak=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=miK5BcdpZxIbSUAudCadMfxk5MINoGSzXep+p6d/td67DFRfGsF6++QF5OjFJH0+gYfv24WAsqZ3mb6OrM/nhEZOxMleK4tkYZq3U6XoWFBJrfsKo9RhGj7brYM08AkYcPofeAw/TTpIVz8z4zYHPv4p4BsrRQkpt4xLl2PXtXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RwSGvrxe; arc=fail smtp.client-ip=52.101.67.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naIAvLSDTdtNCis9uIq2MbmxDhJF0dgMaHayOd0+AsLu2Y74EF2qXe1cszLVb3ZFLvOenhV3sSp5KLijD62viPCCTo2SFQuG5q9Xfwr98SvgjBXeTFXh11iHQP9Xaic/L0EgHNvUlI0pmmUlLXP97CmJ4+hAaG9ZC7DvO5wLTfdaxkkgmIDS6CjpLC2dace/+Vggq8njIR/wuir5RPmjDZK1YRvlesqXku+UBQUmR+2ECR8dJvlCFtxwuRbaWOTA04pNkm5rw9sN5UZuafoauhjS56c83/YNUB3Qqiyi3FTADWWwqWgYnbVzVAFyiiCqUDuPBEv15kwwdFWpFV5fVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhvEVlID57PMz15q3na8AUJj5YQAgwuVDNrsB621/Z8=;
 b=JpJFkzJwTDcAeLRWJqFbrf/ZNRRoAlBiy3H9NAQ7E3Tn4/0+lzGnh7MELKOGB2zmkcyvR+LNEwZgoWARqcU0E87suaoiDgBCrD8h3P5JslZVGUBMReSm13K0LteMxzQPVbEqE4GjFNJJFNTEtcw6+9zKTL56U5/ravRd/ki1zVv3YYVaRT2BPOaJueWqhXmwZ8xkBylUnkmkuyUMD67aBUF41CTquMtJuMJQ11qa6N68n2/WqdtMG3gicw77DqmID93hYVtE08d1GFNNapnJxogEhaAk6B+e9SeGH2T4z5xK25o7LjEybFwF4BdnIvYOGtDKA208f5kriqlINeXNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhvEVlID57PMz15q3na8AUJj5YQAgwuVDNrsB621/Z8=;
 b=RwSGvrxeOM8b/Cle3K+YoFFwLZGLGC59EyZZwqXVLQcEULTCuCr5WklN0PgNqI8dRdnbtIfb4yp5WQky8f7Ur1B9hC3wEcj5bLN5s2a4P8Fjabma6oX2px2WA8Pk7NmhdYFxzvWnXRJ8eNm0S7mUzGww2nD1RKpWjwtvYyJHykjpklQYDcS2+XQl2OoLKTKyak4AQ9Pc2DxdRsjKoLG0kYyxh35UzbubwGK5nC7f5bm+UrFh3FSUds+4VkUiOo2f0Rx78Yo8vqawrRcGX+MaeAI5uLI2gAPe9vDO0EFP56adbad+qv78koO0buL4VqAjlBLRREXUMJBlIcYp9AkALg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9490.eurprd04.prod.outlook.com (2603:10a6:102:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 21:36:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:36:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml format
Date: Fri, 11 Apr 2025 17:36:00 -0400
Message-Id: <20250411213601.3273670-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 391698fd-38c0-4034-ac76-08dd7940e43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6QgLXieShhppWXq76xWEqZsTUDs8uB7Lf0p9JUs7O4moc2zKaszFUq2fHXJz?=
 =?us-ascii?Q?2rUnKphMVgzUAkJJcX9ef91rx1Jp2scGABHmqn2G0lEtFoXX4Sgqn8TpWuJq?=
 =?us-ascii?Q?YNYanVr/iv25TUwkJOpZW8x0rFey5kupzuW+sxlqiL4zD4i4430JjG3LlYMz?=
 =?us-ascii?Q?TCLF+IV5E9O1fexhfz9jnFMHeaKxU55Uy5IFbTSuA5ezijhp7CkgTPyFsGuV?=
 =?us-ascii?Q?b6TLJuUqezdi1ZS8X797zfLlIG81fgqunEbT7KnJEkGUptUUySLITAnB9abw?=
 =?us-ascii?Q?ChNgQpLoq3z0/aXnk4lmN8GtnZ0d/+2AtwdKGhxCtUlzBe9A38tPLurpBhVf?=
 =?us-ascii?Q?rZMWgm32qVOtKw1Yk9aaDvwIXmCWNjIzsRf4O3EMb7b9/Y0tCjAH8VbnV4i/?=
 =?us-ascii?Q?7ukP9LXjygGuUa+6vOVJUnln7Hz6xCMvzxea9AVi/ulZPsHqfGlE8pabSEO8?=
 =?us-ascii?Q?OyMJOrzkarA1kZKiYmnLZlRYH2wZXLSiHftTU4OMhhp0qNNKCr3SKJyAKWuu?=
 =?us-ascii?Q?uIFbLoSgfoxToyn0OB93MtKOE0PCDp9wmPRGUCAcH98NaFODUpZaM949wUDW?=
 =?us-ascii?Q?B9nwA8CSSbnxDopuXkZDdaZJuw2c8GrIFv2LVaq2liwILh9ugYyP4oVTJmCp?=
 =?us-ascii?Q?kjQ7PwhkVKqyfZfxExZTK5q80FfvVCkB+9NxEWwdApzlNHMx6SVoAAU6fM6f?=
 =?us-ascii?Q?exHwye0XL2j8IKX7D1/BBWyEtP3wUvMAYTq2BQieCxl+SRpBewpL3+S72/re?=
 =?us-ascii?Q?I204dgul+S2wlgxysaun1y8knjJ/OYnyLc4C9jh1d2noy6tZqYJpTdj+8Rah?=
 =?us-ascii?Q?oaQkE/GXuXhKemQMFWoIQZEQ9PrZk0cXh8gXUJMHommTQ3EWjf0gH708ly93?=
 =?us-ascii?Q?j2EaTDwIDF2EJjEyhuLForneS5dBGG8N0lJ6a2TaF8yhDhkb5g+k9qily8cQ?=
 =?us-ascii?Q?QjHrLHpAP8JUqN6OzrFWpZxVxUMokVWWF1S4pEYACR6KiVtvWNZxQY6jLMxu?=
 =?us-ascii?Q?XF4BGWn4pR3cK0alCgTdXodu3doZXa15+d3JO7VLsJnJIpymMEZAVtKAUbas?=
 =?us-ascii?Q?Ye2to9dtb9SbjgCY8ViBnTvVP/wzXkZLJ5fSYTs1OoBCBXuwuPWmk7HypZr4?=
 =?us-ascii?Q?+26y/oy85UoTkn7V1WKVLt8PLj7+j2AIUQq5pQ2KGzTjG6j4BNcLXgnEu4GE?=
 =?us-ascii?Q?WiOpH1aWvCJb8FiXrgmd328YAtFsaPjZG507oTdZakKm+AjPjvIcmX+9EYZH?=
 =?us-ascii?Q?CPvgRAGR0HyvPwocvP/CiBK9tJ2/+AgVRL3GtdzBT6jFgZ6WXA9DgfTiO1A5?=
 =?us-ascii?Q?6nYo3cZL4RdRftvFKW86U7/IfmQ1ugV9qAwM/q+ENkUBUToh89Dq4eB5OEM7?=
 =?us-ascii?Q?Nncpxk4plxbk3qCYpTD4jiNdw3bqPoJadlqq5hwzchob2MyvvbTxUOR3pdgc?=
 =?us-ascii?Q?5DP+nzl+TjYUnudJ+tWIWAi/hrKkg4kc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EPn9ZVTbdD5i8+gIgAImh1NLH7BGEv5QNmJtE3CmvAuO5L0uGrps0iGPjplk?=
 =?us-ascii?Q?ArqAtHtmwglIFxhI6Kid8nsow9S4+03VfDmmZImYMUfzteFQsrFoJWyo5Tz9?=
 =?us-ascii?Q?JmHJE8mHQqpbEpqNVjfuWL6E4fWGKDLdU3KApVpaOUMlQ2aTsvt4Im5xXwAe?=
 =?us-ascii?Q?nzDk+yY8vh4BkOYC0r9VPzz5HTZC+MBiVABPPRw1GbVd3CTHpiRaH+H7R6V/?=
 =?us-ascii?Q?iaH9n3WfEiImODj1q4uizPheoNKDwDmuQ1k+ngJi4RzrzvkSvgQvwBnvML3O?=
 =?us-ascii?Q?5MzL2PVbHzGgGOTLHK1MYvMsKfA0fqd2Cp6S3/J2mYS4NxfJP3N4lwka9jKP?=
 =?us-ascii?Q?66m55Dp6Uab1UrHhls7FQCmqH5tNb+GKXZm5jaHA++43SCZaJxu440qw/P/3?=
 =?us-ascii?Q?bsNCM3wIBYaMhl5MVa3Wxit+e8yaM/1SUhAccvX21HNNPPSzRqXWNWrxLWaE?=
 =?us-ascii?Q?O4FzblZ7cr2r8QJcxbRE/gaBLMRZJNqsBoOuSrsQ3qN17MWffXGbKGR82PQs?=
 =?us-ascii?Q?sSeKlDGY/jCmr0IDMpXdMqgd71Jd1w7Kz+7b+CKewajb9SkaVqfX3PeDhbzE?=
 =?us-ascii?Q?oxFVcuqF9fFmL6KO3V//l6IstfjURIDhkxuzV6ucXpVkldTw6p9A5mW0pKAY?=
 =?us-ascii?Q?3JXV+25aEEvw904iKDBsCJbuZFHSHXXHlxntKbWKzLsv1LxWC8ptxr7SY9Ia?=
 =?us-ascii?Q?hu7SZN4MGndvkZWM7iQfdyUthkCNCHc0SwgEezrAD3X0V+tJs00XKtnHo7nf?=
 =?us-ascii?Q?eTS48vGilveBgVCruINmgtf3RVS/0ykqu/JK+lmnZHW8rTJ/KV+zzYBoq2Sv?=
 =?us-ascii?Q?G1ud1UktR7UiRj0fVPztvgZorml6DS7zV/bf0e7yDeunBHoSJSg38TYc7kjs?=
 =?us-ascii?Q?pcmb/s3fjbBIr2lrJNSb2BPiDxo6mECBtjK822CxJ6Qpm3kxbRS4/z5rDmbB?=
 =?us-ascii?Q?FQRCvC8OzJWSjdg+oX8oh2ur/Uyi5SxQUglI9Lt8xelYJ4p3XmSEcouUffs2?=
 =?us-ascii?Q?QplRunt2l3sIqV+xO2+CCyf0bl69bgZz9mPfyKZ8pX94pAm03ib0X0VhEFqp?=
 =?us-ascii?Q?XAEUEBj5AgThPByWlTA7WUTVJJi8btNRJi8hnAPRViPfiaLc3yl3xeQJ261R?=
 =?us-ascii?Q?TsHPSfjDkXMCYIx8j+Pv2caq21Qy5y89sL5riVpeGkKw1l0Xm8hEhMvyWlBT?=
 =?us-ascii?Q?ykKWNEn48W4P0A24iNYwxgIFPS3LkgnWP9TEvw1iy7s5fdFqkkM+olwaT8XS?=
 =?us-ascii?Q?BcTZk4dxfyeizGBrPeCpxx1a3vfwAR7jN5ddvKck8F0TY52w6jjFBaMYmceD?=
 =?us-ascii?Q?YWpu6QVFECEOWvaX6UvVGAnd6AD/IfnnmjruEDgp3FzC5h5rC8CdrZQpLrBM?=
 =?us-ascii?Q?+BqmJ55EkChYboL2MVegWvdZ76FEce0SpGjtJL71WmEyASaRFDspHLSsNWSy?=
 =?us-ascii?Q?uX9pRRSL9isl+Eryzw70dotEOl3ZRM4dJ8EQovCk21+QHIGVRNxfCQ1CZpzg?=
 =?us-ascii?Q?UQa4Jv+XhtxPK0SYwWeaDFhpp3HvAgjRlDH0bfbNbBZ+40pN3S9lTtF0FH/7?=
 =?us-ascii?Q?/R/+RjzrvNlhRFPrcjzVdKwdkAu5nzEOAbF188Xl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391698fd-38c0-4034-ac76-08dd7940e43a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:36:17.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojpXmX5yY+oabpCjQHFG1/+looTxBogzEvW7dGxi7IhaU8bA4qgFfvp/G8sC/iSGjInMMUeicj6oVOxhr7i42g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9490

Convert fsl-vdoa.txt to yaml format.

Additional changes:
- Add irq.h and imx6qdl-clock.h in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/fsl,imx6q-vdoa.yaml        | 42 +++++++++++++++++++
 .../devicetree/bindings/media/fsl-vdoa.txt    | 21 ----------
 2 files changed, 42 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
new file mode 100644
index 0000000000000..511ac0d67a7f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx6q-vdoa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Video Data Order Adapter
+
+description:
+  The Video Data Order Adapter (VDOA) is present on the i.MX6q. Its sole purpose
+  is to reorder video data from the macroblock tiled order produced by the CODA
+  960 VPU to the conventional raster-scan order for scanout.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: "fsl,imx6q-vdoa"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    vdoa@21e4000 {
+        compatible = "fsl,imx6q-vdoa";
+        reg = <0x021e4000 0x4000>;
+        interrupts = <0 18 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX6QDL_CLK_VDOA>;
+    };
diff --git a/Documentation/devicetree/bindings/media/fsl-vdoa.txt b/Documentation/devicetree/bindings/media/fsl-vdoa.txt
deleted file mode 100644
index 6c5628530bb7b..0000000000000
--- a/Documentation/devicetree/bindings/media/fsl-vdoa.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Freescale Video Data Order Adapter
-==================================
-
-The Video Data Order Adapter (VDOA) is present on the i.MX6q. Its sole purpose
-is to reorder video data from the macroblock tiled order produced by the CODA
-960 VPU to the conventional raster-scan order for scanout.
-
-Required properties:
-- compatible: must be "fsl,imx6q-vdoa"
-- reg: the register base and size for the device registers
-- interrupts: the VDOA interrupt
-- clocks: the vdoa clock
-
-Example:
-
-vdoa@21e4000 {
-        compatible = "fsl,imx6q-vdoa";
-        reg = <0x021e4000 0x4000>;
-        interrupts = <0 18 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&clks IMX6QDL_CLK_VDOA>;
-};
-- 
2.34.1


