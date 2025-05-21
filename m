Return-Path: <linux-media+bounces-33051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58929ABFC58
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4F34A4909
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B42289837;
	Wed, 21 May 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TeSHdOoj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3A28ECE4;
	Wed, 21 May 2025 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848896; cv=fail; b=lbSatmvEZQsbOr0FJGWNuWkZS5g582vd0FM0O82NtFzTJFlnTWnuks6P1MJXiJERSWUWv6KL1m/3xQjFomcw17QaYohlJtOM3WJoWtjS/nJJRlULkSyMk1pXY+2IPaMKy4rlQtvPSTi74A0EjP/5DySI4X329CUNr7+xwGQ/DR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848896; c=relaxed/simple;
	bh=K6nst15mV282GDBWP3tjC5eFtXDBFtTmsvQjMfYQMMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOZnHnlWAg2E+y+kc+C4Uewa3jMHLXNYaL0EIO93RWQQ+X9NTMxBVv0v9F1IDnBaD9rDIwPXs3uudLOb5qMpYbR0EC7X2W8pxoCYnKXhfPpb0hvJEMPvG7/ublWmpRh8TZZb1OvI3UUwVYBAQS5NKWwWdiqcGAHcAAL5C17ZeRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TeSHdOoj; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIc3FfRRKiU+un1V8e3/bwnyGOaQXUeSdTQqbMegfhhlYruwKbJ99J8SWD73lnWeeP3BRCspmqY8YglAUMMvQY8J3/xgXIfitpn1VzDwA5ZYJLOL38NSN9AI2SYxZkx2wY5mL9VoYy1T7FzMYOFm1Ez3J9CTsFeQS9JRmF2xnPviyXHYXTe7J2lpj0C2TF8t0X1IZHGEwtH9rW8d0IPE0rkD5w0WQA4nT3L3jLqRRHFcfM+JBzIomjDf0G1M5lBo41DM2kFOfzlRIOBpp5+hMPM8BRNXz8X70l+oOYpxCc5tALrf+H+q2iFmwJRgQnsVD37n3fYvNDe6rtPWNXqKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN+OoEWxf46UqFRSXFVkIJv4b4zVS7JR/Amkb9kE4Ig=;
 b=CktfmbyJnfQR2YaFa336sGzLUyNPZJcKUVMH2jpKnbws1C/K3tyAlHKXe2/R/NQaxjrOwysp+rTGaKkp34XqljXel4cm2FMojOmJWmjSRlkfjwQ2pW2RX6DytEi6fszbx3y6i/D+DLpFtqtGQX+biX12+mknUU4VHljgGXYu4ht5NGP7h12iwCP1KF4yHWwhdC990a/NvNbfbv2WlxOBGR319OaU/DwY3mNKelipfDWdXhN8C1ai5AXghThZJdrPT3jYwUJndcICej64T99C6rZmc0Oh7HplSVrgmk1sc+O/D2esCQj030RjCrtneSahdZSThgx+awM6KHIjkdh/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN+OoEWxf46UqFRSXFVkIJv4b4zVS7JR/Amkb9kE4Ig=;
 b=TeSHdOojNMESKjSdzfqyIpqsYkM5M9mKcSx18YFcV+wYP2cHEvQM/CqrAHF6wCL5X7QutZmwz0tnFyyHuGn8E2TQL0kdPRJRIvC6mIg6ir9kHO/caCOZMYaPr7fVlTuW4fLkvJKTJlA2TP0VqyiHqcn4UBKOSH2MgutR9P2bc6thh/b7PT12s9VYVcloP7Hi3KOK3l8FhXf8WjuTGV7E7OMhxaikOSvedq8160HyQsoHbdV+rk2Nu5cxFfsmHwQ109xd6gCOqfFRzefGjfQa9CgUiKh3NRoDAWPKRFQb5kmxrZ5T4wCteduuZj8k3N8ngnwomwfRf9NiQDq5lUjJ2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7389.eurprd04.prod.outlook.com (2603:10a6:800:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 17:34:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 17:34:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ming.qian@nxp.com
Subject: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode nodes
Date: Wed, 21 May 2025 13:34:04 -0400
Message-Id: <20250521173444.310641-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fc054e-4173-4d24-bc40-08dd988dcad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yvjm+XNi7NErvCryQ4adLqTETc/sCgz2ktZ7MpfjyQwHwVu9+a2INcpK7Fwo?=
 =?us-ascii?Q?zYa7UyvSXkjx5iR3mk7aenBHiO+iR0JxO91NjRDiIOWghfmkTjosp8M+1Mu+?=
 =?us-ascii?Q?YJ6oOPN3YjEFEYkZN62UMt967Dm13jCgoqlStJuj0Jg80uvnqtEQketjGiAn?=
 =?us-ascii?Q?r1R6/rbGbjt5wYfr39GNmNZSKbe3YypzClqVfbIpQk4QhNFtF7+25LuZszV5?=
 =?us-ascii?Q?qrB5NYoV9UkEJYUWP6NEI1prMDt4QYBm7SAP/LUDvG8BDGPlH7FPNbQhysvr?=
 =?us-ascii?Q?Z5mOtHNn5BAJ5LpCmYA7ErTL0YDYGnH3KstyDP0c9ULiAgVw8gAlN2ORsBA5?=
 =?us-ascii?Q?hXbMLiQgB4s3wuANyhbKvy/mgl9jUeI8t3SCImWbuxfwskJsucUbYDeoiY8Y?=
 =?us-ascii?Q?/ncIB3wz01iNGwKut1ckycZ8nqum2r08RdypWV/oczMEGcJPD1NPQ/0x2DRB?=
 =?us-ascii?Q?aEeLdPiR+SJ5qXg3qsiC1K0Fafp4rEHUonYzCP11BMy52850e/Tg+0x9TEnE?=
 =?us-ascii?Q?Nm5qc9DpGRGD9BE4RmeR+mbhdW3JKBJkP1IYwQ+1EjzEG3ajG/vAEG6dQwi6?=
 =?us-ascii?Q?d5tuMG1YScrBo2UmBO6XvW/k1C9nMSU+Hx6/j5T6y3wtEskPwDmy6p7mgO1m?=
 =?us-ascii?Q?kuSAe911R+eaMtCEXWewzs0ESeB4WEnuLesploIbmU2FifurK/82qM0q6AT3?=
 =?us-ascii?Q?reAj64PKETgj+CPuCwEolc0NOAwL8MSDdtdRqmYsyzGKi7I3UyKUnsR9bXQX?=
 =?us-ascii?Q?Qd4uz+SbgDXS90ceq+pQ2/n/HCa9eaBtGbtqSTmU6CwSkzp1373fZvozmrXn?=
 =?us-ascii?Q?USIAlp6HFx9xIc95MNqs1rheQOQpvwlIQMEoVOFicqryDhMWSysS/KORnMbz?=
 =?us-ascii?Q?7uCUoG7P5GGLBBJR36YaYlsI56nUPtykCftGADu6Cf4/iBy+4OJB25Sch7sp?=
 =?us-ascii?Q?cEyHU+yASz1PFqr0NEI8XSGmWfeNvTrC6nCyc7tYDzdzpVU2raX8aj1pQZoE?=
 =?us-ascii?Q?7Q0wYgsjiCHjGDBrkIEceTcA2tHj88TvvPdVbIO2WdF3swmUuKB2BPkECuHv?=
 =?us-ascii?Q?7HC6Dsr7og87vJj49iqk6oltQBc7sWYXTS5AY4VAEzj/pX+2ZEBo9pD5Zw2N?=
 =?us-ascii?Q?APdW0fdSStoGA1aZ/UXod3G2Jq6FMRiQSIospvUqAuM1nRTJcrgm3phOJdxy?=
 =?us-ascii?Q?I3SAKx7TTc+Nz1Vujbt5q9Q7qbk5ouG4+y7j4ZHC+1nsw90VBtLqHfsIgE4v?=
 =?us-ascii?Q?41azeB0wv2RL1vfdMVAkoNLx+AShT3WGv94NzB6fZHDYNkOE2qA5AT7HB74B?=
 =?us-ascii?Q?UCqqhVcu5eLS1wcniGkuUXD8uFuJ0mbiJr+bF6SkkSU8qGRuGTEK2tBc4c6X?=
 =?us-ascii?Q?hxFod1YydmLGXSV5rTQ17d19weniySaColjN1gRM+JH21AHrYAqoy5o2wggm?=
 =?us-ascii?Q?Glj3kAm62cLp752rZU9xNVd3kkVcx7GMDLse3PmCNmC1E4Cb5zF7wQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kyQ1oRiOZrG4lzRkx4k4ZxSi7Q3KKyzATxpfSu5bAh0Wn0HDMXa5udby+Aoz?=
 =?us-ascii?Q?Dr3SStnKiiJhAqvFlAp/uD0bBLyhBLNEMKiywfwUb8iqUSdcx7zEsFVnGeT4?=
 =?us-ascii?Q?kLdJAGfTurFrnqWvVhEbEB88OUilDCSXqHY1/450qv83l1GiAow/w8e9RSp6?=
 =?us-ascii?Q?ySO5AUQr1M/hqEJ4KLSAFoA9Tcn19oFH3phREX7xGpz3Ufq4aCM4/g/kmRbW?=
 =?us-ascii?Q?AAhtXpXxf+lRSoaWTuAX6tOdvgJN7L/vt9Z6OfYaJWiEOJUBRefJmOl5q4fF?=
 =?us-ascii?Q?qhO8NCSQcMmLjkveclLcZnaQUb0LSfmvIdH6aYlgX1y9uB8z2Q4iLto9QNqr?=
 =?us-ascii?Q?d7MRy1HvGALIbciwEhCMRtH2MkE7aFLz1AuGG4CXOwrkZaQUMoEzCMoVDFI/?=
 =?us-ascii?Q?1Rzp27kRApI+abUd7R3PmrReIeSdPFrwuyrOTlQ2SmaHJBLdtGRVRC0vrYzA?=
 =?us-ascii?Q?n5xAn3KwLA6nMw/WaILNuYjIH2HqLbBSgs657i63YsyJz7zrYST2sBswBSh3?=
 =?us-ascii?Q?BFXiSh9sZpIHa0QAKqDh53qzcbbG3TGrMPZT06UkBk4L22wfimR0W0EbOeWr?=
 =?us-ascii?Q?N479YV89y0RKhC7gcgqpY5E4VZHYPQMKEV93uiFVf6rs4ZcVIaUnsItJ+g16?=
 =?us-ascii?Q?wNxIeqRWuoiBDjDK8wkjjKLwGV+OGnDX50MpRk1UgYSz5Y7zxbEYACMS6DLr?=
 =?us-ascii?Q?VlagJsjhwCJbZnffz+WxrLdFm6jtzvRtDfDDE2ZD/wBy8i/ya80HCzSYD53S?=
 =?us-ascii?Q?oxihAjbMzbUe5zHH7TbTP3a32hLbr43gqP2+hmotLZZjroLND/Z3QNEGZCjM?=
 =?us-ascii?Q?y6FnyzKVbTKtcigQoq3ocIyneYVP/JJsyGdy2bMzh20yFyl3G7lmEpPw330w?=
 =?us-ascii?Q?BgOHUDWbXDrhwKKN4TsLJUzHlronqBziBZd/HCXJ9cs/LRwxaYP3ZrCmyC78?=
 =?us-ascii?Q?f54ZVthN5wlGtNM/RE0BGp3kwO0Tu5FukSnQomKKV+TWjO88xzOTRXW+/rZm?=
 =?us-ascii?Q?PZ+PS2uoTR2ctaa5Fazro2XCZUGORI80QDUZaTU0BODSizmZPpBioMlY8hzi?=
 =?us-ascii?Q?j1fKZyfiAZ5Epv/Lm5QeSC+6pJoi3bT0CYVp2gt2WeT+cfdAm6NL0iEdcAdY?=
 =?us-ascii?Q?a2OumkMYpPV/wxMT9QY/a7vnbuGuoSr+UGuL0fadEtXeIX1klLDoT47SamXr?=
 =?us-ascii?Q?jZY+RnntYnrMxrEF/20REGgqHwSx5DxBnQSSq0UCxAxA4aCp5lnh6qYNv+rM?=
 =?us-ascii?Q?EarSewR1XUnbw2knLNamO8mKYuiuwhBHtnIZpvrg4AaNmyWvOuznIz8hfl8o?=
 =?us-ascii?Q?GRgBfkzplxql6c2vBwZ3EbHDc57NCYoL0fr2A7L0KXdWlCEnjcNuBJCTnMxK?=
 =?us-ascii?Q?hWUIeW/yAS8WEmKKDFkewsqlFasW5AndivYcpGhkrb8G2kPcmjbgM6j+Vn9N?=
 =?us-ascii?Q?xVwGzqLeGAePSzbr/lrg8vs/EeigQ3AYmlWLd1Ll+ypzp8dOaQHoTnRFtNQ3?=
 =?us-ascii?Q?P22p5ahdS/4Ik1Ap9hbd39a1gyQCvf2r1KHWAZWBzHGBQRsWSRFaDgUoWyk/?=
 =?us-ascii?Q?T1V94LrcydWXEe5mHVm+OLTXBP0s4I2S3RkI9F7+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fc054e-4173-4d24-bc40-08dd988dcad7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:34:51.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gniTEGxjc8AgQuYhCWmxXwZiR+H3fLwwyVY8b4FYCnIbQZoJtiRM5d1n8ndapgnjXnP6/MnLkODr4vXubT5CkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7389

Add jpeg encode\decode and related nodes for i.MX95.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 632631a291122..d38bbe8b16d7e 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx95-clock.h>
 #include <dt-bindings/dma/fsl-edma.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -1801,6 +1802,49 @@ pcie1_ep: pcie-ep@4c380000 {
 			status = "disabled";
 		};
 
+		vpu_blk_ctrl: clock-controller@4c410000 {
+			compatible = "nxp,imx95-vpu-csr", "syscon";
+			reg = <0x0 0x4c410000 0x0 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&scmi_clk IMX95_CLK_VPUAPB>;
+			power-domains = <&scmi_devpd IMX95_PD_VPU>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_VPUAPB>,
+					  <&scmi_clk IMX95_CLK_VPU>,
+					  <&scmi_clk IMX95_CLK_VPUJPEG>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
+			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
+		};
+
+		jpegdec: jpegdec@4c500000 {
+			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
+			reg = <0x0 0x4C500000 0x0 0x00050000>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
+			power-domains = <&scmi_devpd IMX95_PD_VPU>;
+		};
+
+		jpegenc: jpegenc@4c550000 {
+			compatible = "nxp,imx95-jpgenc", "nxp,imx8qxp-jpgenc";
+			reg = <0x0 0x4C550000 0x0 0x00050000>;
+			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
+			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
+			power-domains = <&scmi_devpd IMX95_PD_VPU>;
+		};
+
 		netcmix_blk_ctrl: syscon@4c810000 {
 			compatible = "nxp,imx95-netcmix-blk-ctrl", "syscon";
 			reg = <0x0 0x4c810000 0x0 0x8>;
-- 
2.34.1


