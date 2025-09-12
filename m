Return-Path: <linux-media+bounces-42468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EADB55634
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 20:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C136B3B12CA
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 18:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004423314AC;
	Fri, 12 Sep 2025 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="inga6zAl"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1D26A1BE;
	Fri, 12 Sep 2025 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757701824; cv=fail; b=QEjkBZ2E973MaW9hCScf7OSYqHnlp+tlpJlZvjxZlYQfEHnCIlnyBuKibPHaGBhFLJBgUtWfnONOtxdOkcFTJvYh1A9b2+nuKwXhu0Oo+OmOxaBVaECCUdHgT1VcLoxo4aMeAjxM/azbu9IAnyUUeMQZPf0qzB42SFApDECksNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757701824; c=relaxed/simple;
	bh=AuS/x4hYKde+1y0Two9kGFkBmf48BPzZNnQFfgNaeXE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LytvJ2eZuVCmhEyUva3aJvH5lF/ywKnx6U20FCptI+bsf3vRw8knhWfoHGb0kj3zJ8ftqjOj/E8x1MxQp4bkXcNqEoPlUGfV8xv21sm+lG0kaTpMhW9LxYpC+KbQgEWvd2besMtv3z1GVYkOA7FefPyEEruD1P+HM8MR9+cgw+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=inga6zAl; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA5V6N7bNyqQ5HBS37JG14llkTJ06ax73AbhWTYSzUl4xlsD1+M6NAy6SkyCDq9mmrDQZDBRR9e+XvcfawJBQJNTX5Rkiu+uKkOtWZxxdoyFwsF2VYiLT8epGnNP6RcE5kq5980blwsl5+S2v08jpXXunlTHy5+VJOMv8zBX2V0NTLaJFseE9phcHSU6q7GMa0QpEC5tFlYoreJ7cLeFDxc6qO8YCy9VfGLTSCPFQgqfstiXsYNsNXvz/lemocDv+ln09Qa6r5uq8aqpxFthO8QZQJeE+6uXdrBugUPq1qEfFco8O4vwyTFjGpCfStptP0zHdAh0nE+0pozWht6iAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7LaJLztPy3xIv6ebfnil85jjcdc09bF8oxP9wdGqs4=;
 b=a+4eyQwYT2sHB2KL0oduOU8JlAfMCgCHoGBM39jV0Lfoh6ZckuHLB0/MkPaWEGlyTIO49n5oeGG4UBxgswMPyVOBvF/I8tsRGhbatLcxhHdzIRsnnU1r1BOVFAkUUE9UGWLDMpC150+dgIs0GJ6iTMXkcZNUeqdqFEG+Dx/hztXKoDo8AzqAYpJo5MYUaL9shBWyX24XtwiXgVD4lid3iUk6He+fVPPryyv8v98IslJPbhTbeC7OUBjBi2NLiw7/6JSf1g0W3zInpzsELSsK4UJvQa95VT/c++xu4Z0Z+aT7ygZusD5ZwrCNx0LKK23nudcDbLdowbNkqr5JhqekJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7LaJLztPy3xIv6ebfnil85jjcdc09bF8oxP9wdGqs4=;
 b=inga6zAl5x+bt9vXcZzUwP/yVafEw9AiMvwW00TqTW1iufL9Ap0XVlu7EPbnDSuDLvkZSVzXAzCOH95ZzgrtFukdloRUjqCTGS2hPDM9uSLcWQa7xq8cxE8zqWrns+UfAoi2qHYYv/sMmfi6nYMZ01WheWapuB7smu0TM0HflkU5YPkfc42tEC3C9y9+yOS1Bq55YjcwN0rlkl2tcLR61TSfvf+BSKeLdcohLN41Nnr8jnSUmmHVHzJExrf9UV8ULVXtByQrd6twCCHe1Y909b6wbZmkRo4sWCWp2OdYtKoT3N9HCSrBT/1zok8/G6pz6fD2PclRY1xvLnKezN6a/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB11671.eurprd04.prod.outlook.com (2603:10a6:800:302::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Fri, 12 Sep
 2025 18:30:17 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 18:30:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	linux-media@vger.kernel.org (open list:OV2659 OMNIVISION SENSOR DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] media: dt-bindings: move ovti,ov2659.txt into ovti,ov8858.yaml
Date: Fri, 12 Sep 2025 14:30:02 -0400
Message-Id: <20250912183003.1115957-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB11671:EE_
X-MS-Office365-Filtering-Correlation-Id: 1415aa3a-33ff-4ea2-3bd6-08ddf22a6c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eRukSslwEFo4SzWP+E0u7DNi0miLZ7Hj9RFPTMsrQ9lMjFgLEx5KgIaDbv1t?=
 =?us-ascii?Q?+UG4g2tUGbQ5M+fnGeE3psJZzK/WaqWRWpaI/VHPaLpvC8saQE1Rt6ZFQ3sP?=
 =?us-ascii?Q?M8foLS/bQEJjcdtIuAug8T7LbA/kz7g7tKvqCY6XxBfHiRp74AhsNUwtEPVu?=
 =?us-ascii?Q?G6giT87LC62Hq/qZeYJraP6Uz7Iq9BE1GrhY39+A1SGJdS6kTCV77xwL1UG6?=
 =?us-ascii?Q?lB/G104SGn2A3+5PE4b3rT4pTrOON7rOHzYxQiZUMALoc5caUy0FZH51io9j?=
 =?us-ascii?Q?W7TAaX+ruZSgo2G2Zmnp3azFKbWzSPQ13vePv5gX6SAt1ihI9hnlxx08X5xh?=
 =?us-ascii?Q?jaZdEgaVLbgEosLcEylxKxXteNVh+vUymSIvYVZtKlrSMY5Sw0a54PCG0WeU?=
 =?us-ascii?Q?udM6W+WjdiiGAdELFke+bCiFJ5cR7WzjO2o9zqNhZuQQQ+I7Nrt6XGmfHP9U?=
 =?us-ascii?Q?yFuWkXzmnZztmZEP/1NVc2qnYA5VtDdP3EdBfOqGB+xYotIGYCFdJ/vVg0k9?=
 =?us-ascii?Q?is+GYodTMWfwJ3ZKVc5q2MbIPK6lHf0KHMN0mHUmnajwxhwajBEjKLsBJz14?=
 =?us-ascii?Q?l4JEbAzC7JC5yd4tqVEt8xBm25VLde1spAcFje3qTbZHJR4KeKzBUZ/XquWP?=
 =?us-ascii?Q?tGn4jeQRKjwYQO+geZwXGWb5sC95MhEVc2mXafxcVadklbd8r2ZQ4JGrCeDD?=
 =?us-ascii?Q?yvHApbxp0+vKvveG/+JyA3NfweM0qdbD01TTCmvZ+OUNLDBIEgeBc1cxdCqq?=
 =?us-ascii?Q?qZj63wv601LNWrep+iRz2Fw4A4ftwatHv4iK5cuJkwpy8+phTLJ7z88p0gPq?=
 =?us-ascii?Q?XbnI/xcZH2o91UwdR6w0YdLi9p4UUpypGXTqIQJGyd9+8CsvJYqI97qMQFb9?=
 =?us-ascii?Q?DJGBchi2gBOcXQdslD06HnslY67U3vC1bSwzl2E/Zniy3OrulDkuJaPzDY/L?=
 =?us-ascii?Q?wsUvkljXGRr2f7Kckx8wxRiU0cnnfF/ya2Jzod4ZZykhcAiT1JyCICEgYFNY?=
 =?us-ascii?Q?RS52opUgLGqR6yult5ueyj/laVHICsYJ1RDPl5u1RUoVS4iLd9X+o5AluCjx?=
 =?us-ascii?Q?v+cqF0uWHOXuf8cczXETnXf+AeoFXXSpC2lsFB6OAXS22hXk4cgNBwuOnZAT?=
 =?us-ascii?Q?uNMAMEa9rIYiEUma2WkPIh+0Bt6ETBw0WlJwwYOT1EkgbEDwGz9W2CWxgPmq?=
 =?us-ascii?Q?zS/cqg99e25hpDPof3yPIBImeYjI1YXue+JlfCixYaJ60YVmdqi4t6F4V16m?=
 =?us-ascii?Q?q6hCx75EMoNQm3DzadJuCqASfBVw8wiBVLj++xQcJnKsv8/GOjI+CzTorK2n?=
 =?us-ascii?Q?H/3NQYA4g/YYdIEWZS/R++Sbco5ldgdpKvkce9lgeushfG6lmv1oL1z3jfju?=
 =?us-ascii?Q?JynY2ZH/HwESBTOUeKHBkv4GIa8IQPlNqAlLBDA1+5BGIezSJkOp+rr/KXtO?=
 =?us-ascii?Q?OPCRB5Drdb6dWo66+OPHZbH6hN6Xs76+9e/fDyJPwtfjW/dtkA86wP0ZgQQv?=
 =?us-ascii?Q?xaLaFICeJqsG7w8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hsBTEw86ue76STvy/2paLURSi3yQelpx+ZYnRJTEF+blGDD4c/7I/+nSUU1f?=
 =?us-ascii?Q?3yOVSgw0cSsbJNK1BvWjeKR6QeD1WS2nT53xd/ffiwPM+38DWxIL9xQlRlso?=
 =?us-ascii?Q?/rDCmCi+kbZfE/oJ4gHS+kLDTBHK0YK6vdnbXWxiNKZMi1uygBT/i9QaxrnU?=
 =?us-ascii?Q?owpEst8kJiOrW6ODtFjw5qFIHsYzVNVggM1zocHjmlttVg2qRmhDQ3LlgVbd?=
 =?us-ascii?Q?OBFeL1GA+gtLTY67H/MQug9LalPnOHG4D36iuG5hrJT/ppRJHgxQDmXfWA8y?=
 =?us-ascii?Q?steKs3I4tIAsUMuhCzblUyzTD06SQgNkABdSnVvXcEV5MgIvijiboEzAJTmQ?=
 =?us-ascii?Q?2s8PruhSHzApG+JiEgRBtERbQMPhObADt58b7yNc5kyDskv6PG7wWKIpbFfr?=
 =?us-ascii?Q?alChl5OnPsKU0dmUdabt8Rj4+i1ricgV1fwSpg08vB9c5lQhPzo1muwRpkvQ?=
 =?us-ascii?Q?iPRq2JIHZ017ufnd5FXiiItWGHCbr6EBnLZJOHWIZcHlocP1WquvcGPukNwp?=
 =?us-ascii?Q?C2Zbvu7D7gNXJeHSYRC9bx6MJOxgSlfK0W1Dly1+Smt5A6mg+QBzwcgN4Zwq?=
 =?us-ascii?Q?TowYaWgmCvpdFc/GFaCf12jymGGdSZRwtGMzBtdrEATFMUARZ1L0r+i8bO5A?=
 =?us-ascii?Q?vj4ivyz7mOvawDu1TuxpQCKtFF/d0jsBpCIYWniwEdNz9xLHcmTdW5UleiYF?=
 =?us-ascii?Q?OgH1Akrro2esEit+eQwr3rmXf5JAJyW/1K5POkPIqKem8/4Vb0oR0G+F+S3W?=
 =?us-ascii?Q?OQVNXiUilZZ6sNONO/k9Ay9bahGW647ent5BUxZInV8vCVFosgYlCC2x0XrJ?=
 =?us-ascii?Q?uQ7sXwL7vYssYK7i/wPnQMTLIpI5TpMAlv0sZ38Dt+o/23rH0Ce5WIRvQE1E?=
 =?us-ascii?Q?MKg6RGbdr/ibh+p3qeeubrawxLq4iHU+hnZq/C2YItRcThUS3PGToaaAcFEr?=
 =?us-ascii?Q?FFlPhg1KHQtY/5zwAOqMcYuz1Ld9C0j1vIrc3UoEgXfkiC4Nn6yJ2bhUvRYt?=
 =?us-ascii?Q?Hbhq9lYdD33ZH0fHQLNFncZaPgM+eLwSEX8hEAiGf/wX+V+Vsp1KcmxqSDiv?=
 =?us-ascii?Q?iu3EYwVfGsjJWbzMbGFVft8yxSyTRpCx+Zx/veTI4+99z8FCt7a3zSQZmIW6?=
 =?us-ascii?Q?4EF226Cbp+Isigkq/hDCpJ0K+uc38nGkklrFwgH2wMyR9GLzUdwc1ziDXiGf?=
 =?us-ascii?Q?9mw5sANB8mlESxa9zAFfEXogNORkdIz7OX39xtgHtAmUbrebkMDYO62vLsD+?=
 =?us-ascii?Q?ub+TVI0Kb9IOWaiAPO4tUYPx8MhBzddCEangxD2zGB4FxbR0GxCbaR6yUeW/?=
 =?us-ascii?Q?6jhtxQ9QyzCeVGBbL4knOMQQGejeewDtfmCDamEmaLbXGQ1zIXFR4SrXsiwH?=
 =?us-ascii?Q?eELu2JQoiPSU0sN3xtPQvUwbTJjikWdzG0N3pcVH1JDvfcOVjDt77lm7/lmc?=
 =?us-ascii?Q?e2cTzuegrwkdb2NuPHIDwqBB/62bbCSsIN9h4MS2ROcf9RPq0VIhRMXeuEoe?=
 =?us-ascii?Q?zok+lWhQt63v/YOrhNotLVliOr1+KIVHxv8ca5j7DEGH7qn9FIDKcEI0y18P?=
 =?us-ascii?Q?aP+q7EJv7S8CE0GI8LGhutrULq48ADQ0/Q2Xi2kE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1415aa3a-33ff-4ea2-3bd6-08ddf22a6c3a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 18:30:17.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd8EXtIhfEdfVfa3UX05vTF5zE0onc4VDrWz6jC2/6NahA3d+px8SgZvuNc9gmBlXMwKWxE2pmUbAMv6na66JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11671

The properties in ovti,ov2659.txt are the same as ovti,ov8858. So move it
to this yaml file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/i2c/ovti,ov2659.txt        | 47 -------------------
 .../bindings/media/i2c/ovti,ov8858.yaml       |  4 +-
 2 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
deleted file mode 100644
index 92989a619f292..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* OV2659 1/5-Inch 2Mp SOC Camera
-
-The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array size of
-1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supports
-multiple resolutions output, such as UXGA, SVGA, 720p. It also can support
-YUV422, RGB565/555 or raw RGB output formats.
-
-Required Properties:
-- compatible: Must be "ovti,ov2659"
-- reg: I2C slave address
-- clocks: reference to the xvclk input clock.
-- clock-names: should be "xvclk".
-- link-frequencies: target pixel clock frequency.
-
-Optional Properties:
-- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
-  Active high with internal pull down resistor.
-- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
-  Active low with internal pull up resistor.
-
-For further reading on port node refer to
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	i2c0@1c22000 {
-		...
-		...
-		 ov2659@30 {
-			compatible = "ovti,ov2659";
-			reg = <0x30>;
-
-			clocks = <&clk_ov2659 0>;
-			clock-names = "xvclk";
-
-			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
-
-			port {
-				ov2659_0: endpoint {
-					remote-endpoint = <&vpfe_ep>;
-					link-frequencies = /bits/ 64 <70000000>;
-				};
-			};
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
index 491f2931e6bcd..d7059dbee7fca 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -19,7 +19,9 @@ $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    const: ovti,ov8858
+    enum:
+      - ovti,ov2659
+      - ovti,ov8858
 
   reg:
     maxItems: 1
-- 
2.34.1


