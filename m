Return-Path: <linux-media+bounces-20452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39D9B3A12
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF2C2831A5
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E331EE00C;
	Mon, 28 Oct 2024 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Od0uIII9"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04B1E9068;
	Mon, 28 Oct 2024 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142414; cv=fail; b=EHyJVfiTFxvJmZstlaRFqtNXVQOuewAZU2m883hS5fimC02gt99gKONyZ5oO/QK21Fq6Ow+kM3nUv3KPMHKt3UaUtXle7Qb10ovoD9wE/Z6vYXaX2BmKs5cBx4Insp5Vi1XxEHMYbgHyj/wdAadG1An+OjwFQKTYNvzWM/ECIqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142414; c=relaxed/simple;
	bh=UISQP8yumYvB5+bRb+kOpouFzkbzGGRDCVsOdhDDmMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VjQks+zCLFPdIObZCbcFCGQof4AIvNuE7xuGWcLMuQPgBxlkBECMdwgnumjbFYtVEmKLxFgergPIDPLi/yCeACdFeN55l21mQfVCQHGzXWyGr5RrRaHg+E253T03WqEhlRLWEC4FSIbPAccgZ6TjfGS3VRY/cqedlwlnFR2FLZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Od0uIII9; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBfQpBlaZgOXNuaE3Z2kM4RFn0YHMVFzTFrK/3irONl+l9ekQKahzFXREyh6s+dPFcsC59TsTWyfKDigqvI999rocjEr0DFOdp7d09zQVr45VODP3kJbLYnh0HuAUFgPqEHceN/WXYzB+HBdySkr+ieYFDagQlfSLYO9Bl9lSuHhRb8b7KH1GdC52Nh0moEtxMZdicyum+EQy/0UW87nonv4p/l3daW5cjtZYry1vocF84C7svRbdENqFPy/HSaQhHeS9DIzknu9CLwdK6N8JzgtNCKSVWxbxC4NaNgtbRpyX5NemwuOYX4XU6GUtBrsjtaqB8jCxZ3VjRVoID6fNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yg8IAEZto8WeS5WhidXrVtaOc2yd7vKlTESHcHp8Zuk=;
 b=qQqbsrMsg+zbZHOoQAGndw5fvNTiDpKlUUveSRfXLcOPp78AcLNUyc6ZPsOGp8laURtCHeKGYgQ+KOqvf0nUbpAnimhi1hupvwDll2qp1mU7Cfv4hF62077D1UmzlFJ/gVHCWdyka02Fxbw3zqY7a9ehENic+apeyhcrYAto5+bBlZNp6O0WO8Sp3ASU6/XovjGAMghSrsuozMOKc/g7dw3+6f77PgucUyN5kp65E1mGUOtQrIKo3XFruB0jSXEmiTjOacDUy2uqnsebqNLL8kjdhhU/Esxkugu6Hgc9SdttFsUHkwQvcql+SuZDz2NnJYPhoKcccrQlfHk/KwPnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg8IAEZto8WeS5WhidXrVtaOc2yd7vKlTESHcHp8Zuk=;
 b=Od0uIII9/9PRPNPsiVFh2Q572CZxlVCgKqyv9vt4WVqR3hPTDudsLFL1r5U4VHRCCsEk06D5McSWDSxa7oPVJoRPwEeWNupjBITikLQCWc80gA0apVyBgaPHaYIBAW+6kAjubhwsqZrHSjev+mnDTvIAcU1LyutZHmtfL49SuB1cQiQcZ4Si8WVn4SjjGtZgpKEYUqYSL53PG7TPFeBV6j0RIHQcPBbJ+DfhKNCFCUkB8EKawYNDdJkdejHfQ7EAzIaxFC+ostPcae3rPX+pop0YsAy4oA4XWquMiy4wyozbWG5UPy3laQzL9xmZACntyIGEjRh4Jb8hx3Ik/s/h7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU0PR04MB9441.eurprd04.prod.outlook.com (2603:10a6:10:359::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 19:06:46 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 19:06:46 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S sensor driver
Date: Mon, 28 Oct 2024 21:06:24 +0200
Message-Id: <20241028190628.257249-2-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028190628.257249-1-mirela.rabulea@nxp.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0289.eurprd07.prod.outlook.com
 (2603:10a6:800:130::17) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU0PR04MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 755320c5-7f64-418a-7aa6-08dcf783aad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hx+gp2PtTKicc2nKqPc0FTdQAY0v5TeO/+eiUGfqrfDmKs/yVkLm2HBvhZW4?=
 =?us-ascii?Q?0gX1ty0QtsWEn2ghy2nC7FZ1kTJfNTcdxIl8xvtQyfLKZFNUTLZAQxmzJA3C?=
 =?us-ascii?Q?4ZQZjFZ/wyvYdpGDXIQZHR4LbX76WuQoZPqDb34j+k8+NwJ7vHzzEO3WrfV7?=
 =?us-ascii?Q?bv+CmhLyJI+bcL6p3yOefUHyTcJl9DCgWW/ieHC13uD7SU9VX22WacgIop4l?=
 =?us-ascii?Q?SD8J5UU1eY9TFbZvbBaRp/S8zCt6D+3QQJbuB3mzy9xpS95lexdmFHeqYJ30?=
 =?us-ascii?Q?+7ilt9H8GSQPzwasDAyBYHP5xTU3OSrG/QZnks8uaRfZvrKsdL+Baz/d9gDp?=
 =?us-ascii?Q?aJHB/08m20mWe+9OLUobSB6wESvzIIR0KJtF/VuWwKA8QOWrEMGLhJp0GBdb?=
 =?us-ascii?Q?c4qy53D/UBDMcZrDFU7/ePc/ax84NMzkhc8mchGgpFjqXc9x2u4IxzfSsI7O?=
 =?us-ascii?Q?H8pK/N3b9kZtjGHaDaduFnPNMA6IYzquAe67pl8N7rlv3G7svrlJs1gW9hH1?=
 =?us-ascii?Q?zMNSNFyW668f9ClPCaTqiBugxrO5wzlexf3Yzj+DDXDjAzfATIHjXnku6DHr?=
 =?us-ascii?Q?FbASNqjpJKT89Bgvg2kPXzPYDMX/bOUJpEpCr46ahYu6pqkPhvusEui6WjnI?=
 =?us-ascii?Q?CTAamCOY9hEx1KC9wDWMsBR/hOjq+PXpgugDh2Z6hCGKYtS21rOZpGisC5wb?=
 =?us-ascii?Q?dJve8cJE3MpnFkX3DvTfeXElb0ILvn1zfZ6dIjKQHFFNvuyA3ea4aDuxbIcx?=
 =?us-ascii?Q?DrS+cZmDqeCT8gepFdC3UewC7UOBWAJx7gibSjmc0SnEeAoZsamKVyxIdcez?=
 =?us-ascii?Q?sRrSTp4sK2U93jxxp91DAvY2B/PLGErAeZhgSQq8UBZwE8g4rGwGX71Nyfld?=
 =?us-ascii?Q?4/uD6Aqvd63uKok6Fpjo+lwplNr6FRRcB7AplvBVUtUoO6cJmqOMQk+w7Was?=
 =?us-ascii?Q?SPOcs7D52hGHKR3ZN0Bx/mEi8Rg/RKnk49zUdP/mS+ua8Kk+ZSAcVVSd1BSZ?=
 =?us-ascii?Q?FQ1ezuFfEgqul0MnQjLzlHb0A54nMod7g6Ke2BvHWSpYeINq6JbuIvAbNpUl?=
 =?us-ascii?Q?bysgSw87i/XLkJoqOyf4jkm0dklMPUwJLQA1+bsuvyQZ9QHLAE59fCEfdp5H?=
 =?us-ascii?Q?pmRpGA98R7eYJHCzQeowkDO69WrCkTi5OJE3e7H21EYcUsz7k0UOjDCGZUsk?=
 =?us-ascii?Q?1oio/8Z2OKzOeXiuvxl0JGw+/ygsRPgAFnMLwCAxG/pGbWPPcbXE142FDTqN?=
 =?us-ascii?Q?ThjRsDy2tfrMUKE3UZzlzumVVaYCWZp4CK7GR2EWbRfUchljwpXco+4KUmCy?=
 =?us-ascii?Q?G43ht5L4CC7SkGpIRil/zCwR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qyTm6Pcmx2LU7xeEg8nMFg7BN6msSfQZdvP8FjORg8zO7EtgFrK0KerclPss?=
 =?us-ascii?Q?iS/7+TeHZ+m8RdMRv95H6crvrlIp8MeGKh12aeBkJE92PGx67DN5MF6rwqrB?=
 =?us-ascii?Q?nDOILLCavfOwa9CLlTVOKHLg+fXxhbHCDKAy2YQibm1Uc/A0UocFYzYVL/nH?=
 =?us-ascii?Q?R//gFKqy6VT9yGUXGK2kY2cormqMO+oGEfe7gf3v4xO4T9j85Mk5OtZ41PIQ?=
 =?us-ascii?Q?kLk7nZxCbEVSYqA5gcCq8PUZoLVuiGJubLILxmHJNDRFaw9p9Qqx3WctlI+S?=
 =?us-ascii?Q?oTGBq/usRE44+9C5oUug8QzcVC4Q6Ga34zMwgKl4UJqsShNLI40WfyOkYaTX?=
 =?us-ascii?Q?0OSc6LxyezoGJhH2RRmXd07uU6bEI8BBCRWsaQL6LcOujOT4jO1VxEI0+Gzx?=
 =?us-ascii?Q?HfBVZm5vzEQCdB9yB7SX10LLT1k2SqMwedbV185AEu5S0D1XDu3ol1HU++t2?=
 =?us-ascii?Q?mcXXtGBTlEFeVZLC1QLWzemLurv72CD7/VkKEveyQopC6+aI65aPnYKveCZf?=
 =?us-ascii?Q?1fDlKp4PKvHF24klyue7cypap4VSw7QLLAGgl2yM4RjAPKF6gc5N86J3dZPs?=
 =?us-ascii?Q?hR7pCgskPfof0jiAxjXVewkX9lKAOZeej5F6vpKg12OaYYJvKTm1sz8fEYtD?=
 =?us-ascii?Q?M9D8tCaMHbFAPIMkWKAEKLQQ1cbvLXmmgePfocJRDnbbOIenCzd/RXTANcAg?=
 =?us-ascii?Q?Yr0xac/FTRnivu9mzS2djIBF01uwdDKV2KbSlNH2RglKnuJ4n2tAL3UZkNw7?=
 =?us-ascii?Q?oR8w5iSNC3Hn0ih41OhDvUE7NZoPI2SJgmMjda2LH2vJESjyp88GgDuDXWXJ?=
 =?us-ascii?Q?VVIZihEcNWIqKywCWpAOk0hUpPIGRuUWJE2GFWDbTt2D3GGuIKDPeh6O2GG4?=
 =?us-ascii?Q?cCpnuR/Y/wS6zjleN4ITrvdSLGQ/GQ/SuAVJP8It4DZO4z93OvSgUuMNwXVU?=
 =?us-ascii?Q?pOdFERjC1YVi1IzBpnlGlZ5doORZ9lrrZt/WO/E+utDTmkc1iruL+svvB2Y3?=
 =?us-ascii?Q?yciFD3AK0bl0iPQxbTQSpNUSp9JDPA07AaH3VCnwbDTgaOLbtyJyy3R4Howt?=
 =?us-ascii?Q?6pgyV07HNOC9t2bjR3qKI/eozfOeJP5tYBsqG6JStZNGumTHXgHzwUnbvdqk?=
 =?us-ascii?Q?MO3fYWpXN5qIH+OGBTBNrSfrdCUZmgw1OKdRFo058SHBQJnAUsrIV6+gJc95?=
 =?us-ascii?Q?A5Cs3TbXCA27pmZmSG5a/a6BMcEJSSIoaIa9X7kZ2h+QVP11g88Iv1aEIT10?=
 =?us-ascii?Q?DW8/RfGoqnzNQUsMTpUM60ykQPXU+JqUgMlo0n91VXcWG62TRDFmXicKbipo?=
 =?us-ascii?Q?3fosAb4YbfhFMX0N/ZtzqE7Y4ho9tJwdsiZbb5zj4xclBmYz7Id5vqyeHbC0?=
 =?us-ascii?Q?3VXrcAfLdGHq/d8aSph6WDQHOE6XI2bEfvUI1Ji7DeetfNN7wu28Ti+sVQdf?=
 =?us-ascii?Q?uEn70PI1PK8HMHIJMcdHoR/f4duG9IzJucvNjPZ5IJn83D3+V6ubhJKEgtvd?=
 =?us-ascii?Q?T9tSQ2yqq7TTDnxBTXB+1uGSvzDcXPXBK2kYdlB+n6ajAp4wsSbEO9hh6Rr5?=
 =?us-ascii?Q?dAhowvW0F5rxvz6S5bqpR9z8ydr6l7lOUbBNxSxL9PZ9e0YhXcs5qqh6X5TI?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755320c5-7f64-418a-7aa6-08dcf783aad2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:06:45.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 299zluce7szu4WFnDOeROcMbzaXGHLwUYYEt4Z5qn701XgFCbj93J2tpCkzS2zdUo0+L30crmiFCTisrPyNoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441

Add bindings for OX05B1S sensor driver

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../bindings/media/i2c/ovti,ox05b1s.yaml      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
new file mode 100644
index 000000000000..d47e1950f24d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2024, NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OX05B1S Image Sensor
+
+maintainers:
+  - Mirela Rabulea <mirela.rabulea@nxp.com>
+
+description: |-
+  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size
+  of 2592 x 1944. It is programmable through I2C interface.
+  The sensor output is available via CSI-2 serial data output.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ovti,ox05b1s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: Input clock (24 MHz)
+    items:
+      - const: csi_mclk
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  orientation: true
+  rotation: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: MIPI CSI-2 transmitter port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+        required:
+          - data-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ox05b1s: ox05b1s@36 {
+            compatible = "ovti,ox05b1s";
+            reg = <0x36>;
+            reset-gpios = <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW>;
+            orientation = <2>;
+            rotation = <0>;
+            status = "okay";
+
+            port {
+                ox05b1s_mipi_0_ep: endpoint {
+                    remote-endpoint = <&mipi_csi0_ep>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+        };
+    };
+...
-- 
2.25.1


