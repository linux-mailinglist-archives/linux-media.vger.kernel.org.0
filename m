Return-Path: <linux-media+bounces-45142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20827BF780A
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401B518846B9
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C8D346764;
	Tue, 21 Oct 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V0okEMR3"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570C345CC2;
	Tue, 21 Oct 2025 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061782; cv=fail; b=Gxd4mDZ2vK2SUf2erPw9s6PF4ho7mg1fVcZRzcwARucYsgSE0Yzm4hsxSumiI6Nsm33lviM8TBC/81uZUSn7MhgNosQARHMcW9P6f8T0oBgXy6UrSdLh8D0Sm7hXfCPiyTeZeVwNwZFLVKrF/uMD9TD+zHscPIMiIOnzNxfQutE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061782; c=relaxed/simple;
	bh=0h9zHsYS9gxMIIOY1eFfnTbzP1c0JRt+j0AeSuZV1IQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cGBulaHhygY4TrH5Z5N6AnHx65AofLW89XEctc1o/O7WSbXpF4eNK0Ba8lV9DQvYqN7ZnudWbFqhxdiJbeFjOXIzEj30lHnG/gNdK5VlzYJ4BEuKs17abFZXgYC9w7N33JrSfEK3N9U1XfDJaAMhyLiJKxLv7LLymQPPRji+6uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V0okEMR3; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pv8VI7a2sjPnFWXUJsAkWRZE8wbpmKGVu7+ogFsxJOIeBvWlEaNCsGEX34x0rIWzCbEWBYGP3mjPz1RQhtzM2rYlcGhnETAxmdUenFnsermRVSAPaIpDuf1M9Vp51FPv4oXigqeOr3c2rUY0kpjoNGvuz/8YljJgDA67w5JCBb4Ot34FXN8B1k5+OQmwfso80xnVgYqeHQ79wuaeK+wbH2Sy/XvVNiSTMvpalUzczcXBSaiGjqAbxA70Aov66kFfgS5I6b8wcY+RGQF4RgJjdingvnFZBH3ucXVXxYp/BsGrsrb+PURVwCK94BstzPUO/gdLFT0Hkzd+B1aZ822ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMFlpjk8pvUUMXLby9pCl6MCuI4MzdeYAktjVqMPacM=;
 b=XQPtD/GK8gvT/klpJ9/CkiE2B7VqrOUlxBz/CClYaET1Ux2EwwcMUJzlRDZRFazgFYoTCzfWAbZbkGsAdfDnNhytYx42n9UkpOKdSVr6UicJ2U4q6GxYlkRabcOylJZpMOxB9wuui/EiVdTaSX0zV70Ya1vn4oe6xNakzBRkRuDtt2wSwMvs9bPBLcvZ1bcxqeZcESdNXTpxbD+UTi0qLJH2XbZvjrIwL6y5K48z1cQUr4kDZqFcdLciTOhnf3U9EQsLtxKgBVxc+b5HgsNhuTUNaJCnVd4jpmYPQHmQBDeJmLQFdad721+fwWcqKv5EcfEPWgfvcx153EkHxD3MSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMFlpjk8pvUUMXLby9pCl6MCuI4MzdeYAktjVqMPacM=;
 b=V0okEMR3kCTJEn4XhtIb/i1gjS5ffyp2KZO3RdAuE86AUYocZI73qF8bLp5m87KnCVYOvoO7eVNnl2p1A/jURav0xEcT6MLuzqLz4Erap2v+vsZl0Fp3Gk2/sXfxrQimjuZEbFnPcwZ3YpizPReIZxGTiJV7+qbfcRpGdLrSBAdk10Rp3ms9Y6ClcXuhOUg4sdj/9jla06FEaQJqi/Jd2Ir5khTxe4LWdT2fWIBVbSctQK5+6RUJMmzowL/5hpPf3OzoX0FX2+PJkOQa67WKJqVEbgiSpA5zI+sFUVPgG6d1uHe4nmvXxlCh4qLfj31HgcCuJTJqS6Vs2QDdwVF40A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU4PR04MB11385.eurprd04.prod.outlook.com (2603:10a6:10:5d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 15:49:38 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:49:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] media: dt-bindings: video-interfaces: add video-interfaces.h information
Date: Tue, 21 Oct 2025 11:49:22 -0400
Message-Id: <20251021154922.2874390-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU4PR04MB11385:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c4df6b-2f39-47fd-7833-08de10b970e6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dstzjHYMQweRJz55QkOn0yEKIevDNJSA7cbVgz9g3MgcRZcRfYhztDISagpg?=
 =?us-ascii?Q?Rnmk5uEX5z0nwwp4KWbXLwSiFvXSYVjCuLAVb8D5b/2ZyF7zcUGdk8LFbfEf?=
 =?us-ascii?Q?Orla5ekL0ko9/4bUruFEw77cq7NqqpobbuWv9xZ7OqH5Fls9XyS/f/BUp1KE?=
 =?us-ascii?Q?FK+CDSACnnj4DbASo9hYKEWT84oEFrJKhPfwtQoFd+hcvU0AZiLVbot6r85m?=
 =?us-ascii?Q?ts+gDTBrQKdVa1Oc7jRANZZbx9eWXhS5Qa2lR4OLrOhyiKRflgF6d+sUvEgd?=
 =?us-ascii?Q?hhg/8lvtCqDKOsvG4pI8ophCNZoSn5WiC2msIGB2oiMEXM+oOcar6tqexafa?=
 =?us-ascii?Q?MWvroLHi7TqWNbpHgqpj1hr3XwLaAe83ayOuC7pPONrJ6VRPkeexoeg9YqZQ?=
 =?us-ascii?Q?GE/h7yTrKVAo9KGEyaCJ0bK3yUCRqVlYyyS/rXEOriWoy+HHUDWqOy/GrSPv?=
 =?us-ascii?Q?FmumSH3WVhLaIYoc+6ZCK074cSVoNasS4N9JJyFCk72+sDnhPqsqwC01P5lF?=
 =?us-ascii?Q?hM6+28JsAD2VmNNgx4obSXIfHXmoY1/GewUniUWOaujtjsaRbrJ7Ka17LI6W?=
 =?us-ascii?Q?Me8L7WTJ+rdHvYOnxA8sUhMd0jGMKOULQLcNrLSEFohuS5rThYab8GH8eY2y?=
 =?us-ascii?Q?IHlNnu4QeLSHQy3HNEGFbYZHNuUDOLRJoEIZb319izVh4DyFIxUaR8FX0voJ?=
 =?us-ascii?Q?yGjYuGJ+fIneQoBTAPIgfqyLQwGZsHBdxEZmdig3puz4d6VvDW5WTsDDGP8O?=
 =?us-ascii?Q?OOze4Q1h1nE3WbvKNujI9wxGow0IGfToXKq0rOKwCaPDTrm1tGbEgguUeoIw?=
 =?us-ascii?Q?RU1nwvJClpVKvgcbC889wUA5BfSb5GUDHwUm9B6Y72Fw5jiUHothBaKLRu+/?=
 =?us-ascii?Q?sb/7zg8ciIawiwb+71I5gK/Sw+ksnJblFdMlrjAuCEvh2GMHXJjD9XrmvNyN?=
 =?us-ascii?Q?alsX3S1/VfOTNba9e8CBle0Q7zK8JGudXBZjpOjIZW7xz06I5JQTd3+N8kG2?=
 =?us-ascii?Q?Zqqsz6MV/t7pRmmBnF7003lkOvDm6FIVVe2YRVsQzobVszJZzpoiGmsLtX3a?=
 =?us-ascii?Q?rHtxllcvo2lh90aEvGkAXT5f4MbKluphHWAl3Vrg5pESSO3RNvXwi9txRQBT?=
 =?us-ascii?Q?oIZ8KSUZfeN9ayx/2QqnbwQuDoHQbj1QP0lOMyxchvdquwXZp7+7Kr1cLKpd?=
 =?us-ascii?Q?tIWowELQmE0RHxBxNu/eWuQ3a5h2VJbdGP5twv4kbY0KAVU8wHiiIew6BP8y?=
 =?us-ascii?Q?TWrdokjheT2uR7CHTOtXmm2NaNH7eRbyOcuSzz3Swf6nl5Q5DZeQrXOl20yC?=
 =?us-ascii?Q?VLCMVtUBLWq2kAvcu3fMhkex8W68GUJkl03tmuN1KByLsQ5ZTOCzmk1P6rsO?=
 =?us-ascii?Q?EkWxAU6UA2jqZmmD97l0raj/nkHCqk5Mc7K8lyzV/JvE8p6eCUe6Izj+hTFO?=
 =?us-ascii?Q?g6ROnpBMvqBENI8LMhPYTQw8TOb75cGeeV0N2jurV/vGA5MyUvo84gUMEZTi?=
 =?us-ascii?Q?TyvgobxL9BTJ62JEXxoIUU2sApc8vXvPx4TV?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mHzsEIFhrvyVLBU2OR6/RgUf9FT2wPXGDIB2EzKjfalmPY6mgnoMmfvxSBGh?=
 =?us-ascii?Q?PsXgWZdaUF5+ADqQ5m8uR1c0Xk9wMymh20iurSM9IeaCyktDRGGDD3kOC4cH?=
 =?us-ascii?Q?CFMgqlxp/eLD/f1JxnjtQYjSjL4ze8U8ygAHxkLSEH2SqEDp604HPlAvtbq+?=
 =?us-ascii?Q?DfwLsS9vxCSp8hhZ3XRy92lNde6FGLih5VBBNDZZLMWrVXcYxgs5qW+qVUTK?=
 =?us-ascii?Q?WErWfUnLQGRuRPOYz3ZuUQ2jCQ+X5q+2Iza8OF0BwMWwzz3a3uomoGDtsyW9?=
 =?us-ascii?Q?k2QFffuRPl/FQbssxOyHRaXqrNX/ohO1XJQkylQhPHRI0xYqyS5aJnemtKeB?=
 =?us-ascii?Q?T0YvU4oEgcbdNQcBA5jdRwiWH/moUbtfnv45SEAPlG8W7FhYvURfN2nOx/zw?=
 =?us-ascii?Q?7yQeUvi5FFeksFr5dUOQ423DVbT7MGJKC3ySFO/lAz8uTRUuEK37NHJhWYZR?=
 =?us-ascii?Q?kD4Xty9mOhOPYJUCEdCiiQ9YFzdPnMhJLf1NnwOf74vWeeouZe8mfVUVxtuS?=
 =?us-ascii?Q?xgIGB4VADt2yvFkuyMD8N4vcjXCxoq9UaErsAccUIYjqDx1g2tHy/FK8LQVc?=
 =?us-ascii?Q?QghaRc4t5wOpMPohlOu8PF/4IUrYDHG0Q7WNiBOWXY/Cq52hlTN3Xa/Q98eO?=
 =?us-ascii?Q?9AYB9BjkpUvBq7pY1GlKJpXPvqYr4SEiRwx+y0e3f0hHfpTfbLI5ltUbbjvc?=
 =?us-ascii?Q?8cJHYlhHH+J0OkYr0ZNoQOP9OewOs9c/CTPy7nuplmtRKSEd2S/yiSTskto8?=
 =?us-ascii?Q?h0tM77okwaw9SM6rbi1GRpUngXt7OhUUMKOHusroJM7dxXucL2Z3d1Dosy3e?=
 =?us-ascii?Q?gJbiEBxE+MajnwGFstQ+UaivJlASar+/gQaLkQW/bDmP9dw18FY/muoKUi/L?=
 =?us-ascii?Q?Uwl7Ox2IGPtVr/LzcQekPGC4IUdlBzMBbbCHkqUQ6DXGHEUXb3huh6fozFgX?=
 =?us-ascii?Q?GM1V1vZfCOvcLUMlSXBrq4uYU3niQYFRRO3LcG91lcgW7nU1aAaqrVsH86VT?=
 =?us-ascii?Q?QfgzMgPuUoXafgYfG1b9oAm5/323/A/0LIsF8p4uIlEUuwhhqNdJcFPwOwCq?=
 =?us-ascii?Q?TDVV8t3WDaLoh+bxdrp2xdr5+CY6hAKgi9QjQssMFKjLVE8tazO2F0osKGh8?=
 =?us-ascii?Q?Le7++FLrJ642LyVfHq4pqPXR40OOjtIL32HNRBgtnFr9fc/OwemocTDhHANa?=
 =?us-ascii?Q?tMUZbvhQuTh5Mf68MRWIpnL7aprf5oNaJQ4Tcy+6ylpTvrH9dccdibytriRS?=
 =?us-ascii?Q?1oK5gfEdaY3nBQubHN8zZPMPm9ZaQ7IGOm/LC46qmriKmxo7aulTW536N0lB?=
 =?us-ascii?Q?nIosJvrT1zuy6oVzlfz73wBI8Yp66T//gCTXm9m5Ea0dVm32TT6kgCIIetgG?=
 =?us-ascii?Q?VjsZ9QxPwHTmOdUvvtuD5WiMY+1OmXSPdAFBXxR29w/Bw+Z+Ysg0FqIshXev?=
 =?us-ascii?Q?7e+jpS+3TajC12SOh4G6eQv7UW95pcNkegEy4ddM7MzuypYOzOWJLVn/6q67?=
 =?us-ascii?Q?ghS4Xkc5lI/2HfrqweArlW6q+vidE2JcKtYh3PvddYKYSEDle4sgD34Be5Ua?=
 =?us-ascii?Q?Fh4xc+KwsMEOr4Fxl0BqFRA15XIvuMwN13fGia4q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c4df6b-2f39-47fd-7833-08de10b970e6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:49:38.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qqEuC76/qMSuswyDu/PakSRuYt7MEXACG3oQa6jDuvSubyFvcWa86xnrLFD0uvyZxOUVx1R80x4Vu6+BFavJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11385

Mention include/dt-bindings/media/video-interfaces.h in descriptions to
help avoid use hardcode in dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- update commit message "mention ..."
- use full path include/dt-bindings/media/video-interfaces.h
---
 Documentation/devicetree/bindings/media/video-interfaces.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 038e85b45befa..6ed4695cacf7e 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -95,7 +95,7 @@ properties:
       - 6 # BT.656
       - 7 # DPI
     description:
-      Data bus type.
+      Data bus type. See include/dt-bindings/media/video-interfaces.h.
 
   bus-width:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -229,7 +229,7 @@ properties:
       Imaging. The length of the array must be the same length as the
       data-lanes property. If the line-orders property is omitted, the value
       shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
-      busses only.
+      busses only. See include/dt-bindings/media/video-interfaces.h.
 
   strobe:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.34.1


