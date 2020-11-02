Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893572A235E
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgKBDKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:15 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727470AbgKBDKN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6QmSJP7n8wTgbY/yuwnBLqlOaXP8J5wzrEV89kqFFEDfCmMMC4gm8FadQxxQSKq9nDeTfFHYSex5M/qwYa+2PaCTVEiu/dgqZi/0thDU8vJOhyYJKnY0zus4WzIyK2quGx0felH25n6JHyhjtVYfKppbrq4TUTfsNZj2O1B+E9LvfhMuvUk/nlHa3wNMeXQk8c9Q9IpNoQBZcj+6a/NTkavmu+N7YL4d6S28Ygy8VIeWk7NXj0NdQSHTm4QduMLrwozUpJCyhZERUqjVI7CB5SKMGbeoyhu2dbGdPQbziMVu9f9vGQ06hQ3Q04/1r/VdkgIzUJR/oR9WPPeg3ExXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rBjIeMCPNcEwuZBeBkYxRtK5wxM+d9HcCOTsddZ0n8=;
 b=AfhZ3QKgaS3OPJtqONlvklp6oqYm0LttH7CVrtuXavXPqGfGReSyvr8aY+WSSHcY8ji9qtspykG9MYJXzDN3Se7E/Dxv8I4dB/A/HjHU5Xg6Xadx29Mghxrd0xtdyI0xPNwPXD1RMq4X6aLqFL2Ui+VV426MoJlEOUiKNmexP9NXGhbNb2RNlFFRu3qx9fT1A/1gmvsWn0YQ4XjJIwwKz4AMEVjVEWuiOmwpqpRO2VqDu7aD64/LeBWWkdrc8QlXM4GIgCmKOCTXNMqWTzJ6WMtVNBOcjS6k8s7J1Og50uKuKBYMs904m9uiGUTlKxjLkpEqGJjsHL/I2To9LdFX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rBjIeMCPNcEwuZBeBkYxRtK5wxM+d9HcCOTsddZ0n8=;
 b=atqZBY+gfcg0LUWQeA+k+Sa9MWnIBGTHd880DQN9S+37r1KXfa6Gr8egPQRSmXyWr2yHthyYuweozYflrVEQJMG8k/IyKvCcPuY6fSmv4kSm99i4EwPl0PolZrc7fNzH6Yjl1RDMcsxIjfE7MF7B9bHGjFKA2M3DDQJ9aoBLJzo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:00 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:00 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 03/11] media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
Date:   Mon,  2 Nov 2020 05:08:13 +0200
Message-Id: <20201102030821.3049-4-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bddaabbe-6cfa-4239-dc5d-08d87edcc935
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51735DEA5C864CFCC8211B4CCE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtqTOlc8wKrDZWotUqQzXNBb7bkmzJe43HV6S7DgXycs4MG1Pp0+xZjXpEpUtHCjGk41uKJCf8y7Gm45u/U4rmF77c0qd+5WLd84LMaAtiSWHrPNkuAdk7zkJbFCTcpus5pEao2+05owUBYecHLyN2uwN+BWAHMPnqZtdvc60Fc0OVKZ2E47ctc1DR9w1TW4Q4plWOCYKaaBqsHJIj6Rdc8IOgrTHDpaiEDmCHIch404SkJXAh2fLMfR/s0689fx330it1xocugk0bX1VoXM3PpN85ca+48s0g4ufhO5X8+mum238bYXSJHyYioT1dVZPykkmz+2/DWnxrEtz4T8tduBpNl+y7k5I0Qw80cKYEcqPXeHM/QUE6DF4dqZrk1Egx06MSr/0GSdAwi6cam4Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(966005)(86362001)(16526019)(186003)(8936002)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FDvyr0tmfTmAaSAE3klLsGvuCrr8uKkBIx+qYPXaeFMZ/DWz6qoowF8TI1gOg5aSRh2DMqrhcUNYmQ2vcKzlEGaYlyaRoM8uQ2s+RHVYOkkEpOz8FOHuE9Ntah4YThgiih6jIp3I2CLFLEbmM1EYvhFhBTYuDsls3xgOfZhawJHbxBr0aOfzQObYEl86tmSvM/kSpTLu/z8An6qLhZgBdyTSopLtXY3oe0JL2v/3toDMxfeFjV3e4qbfC9TXS44gSxQIJ8JLDEpKMij1/lbi1BMi/v3LMNI69i9gvhPqsasLKaxKP4NHf0ICu4LrWWlHGX4ZNLSmLwc4Gqr6IA/VrtwiTNoHv8XPfw6K2sY3dnUj/5wRwvsQynVbUjllC6HZdyqQoNdKp2hhTOQL9WmjwOMwh5UgsBETA5ZpS3CUMBS43wguzcl2QFw8HRwKTNR+XxcpDPbnsuOcftmr4OsVOWCm3mOaDvAsSsyX9IzW2MiYDYClJTmRyyiLuhvnlHkZ7McTVNRl1Sz0kOnxb/nfr5cYn0ydmga4+KwSLNrDMSM8fFZAcQ1gzwdFTNP8ON0Rtw4vfznpmzcjF7L55o68ey0/mFYlK0RQXdkclrBbgI5q0HTIOa+096tJKLXM8BYsL1E92rgD9AHJUCu9ci4Z5Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddaabbe-6cfa-4239-dc5d-08d87edcc935
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:00.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUyl0/K91dW6albP7JfxJsSUYLj0vpWWGk7uLtQIHquk3gWn7xHeO9+VfBKroRohiyL94vyfvUamLEk0wF1RGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../devicetree/bindings/media/imx8-jpeg.yaml  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml

diff --git a/Documentation/devicetree/bindings/media/imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/imx8-jpeg.yaml
new file mode 100644
index 000000000000..2df538d87bfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/imx8-jpeg.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/imx8-jpeg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QXP/QM JPEG decoder/encoder Device Tree Bindings
+
+maintainers:
+  - Mirela Rabulea <mirela.rabulea@nxp.com>
+
+description: |-
+  The JPEG decoder/encoder present in.MXQXP/QM SoC is an
+  ISO/IEC 10918-1 JPEG standard compliant decoder/encoder, for Baseline
+  and Extended Sequential DCT modes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # JPEG decoder
+          - fsl,imx8-jpgdec
+            # JPEG encoder
+          - fsl,imx8-jpgenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      There are 4 slots available in the IP
+      If a certain slot is used, it should have an associated interrupt
+    minItems: 1               # At least one slot should be available
+    maxItems: 4               # The IP has 4 slots available for use
+
+  power-domains:
+    description:
+      List of phandle and PM domain specifier as documented in
+      Documentation/devicetree/bindings/power/power_domain.txt
+    minItems: 2               # Wrapper and 1 slot
+    maxItems: 5               # Wrapper and 4 slots
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    jpegdec: jpegdec@58400000 {
+        compatible = "fsl,imx8-jpgdec";
+        reg = <0x58400000 0x00050000 >;
+        interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
+                        <&pd IMX_SC_R_MJPEG_DEC_S0>,
+                        <&pd IMX_SC_R_MJPEG_DEC_S1>,
+                        <&pd IMX_SC_R_MJPEG_DEC_S2>,
+                        <&pd IMX_SC_R_MJPEG_DEC_S3>;
+    };
+
+    jpegenc: jpegenc@58450000 {
+        compatible = "fsl,imx8-jpgenc";
+        reg = <0x58450000 0x00050000 >;
+        interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
+                        <&pd IMX_SC_R_MJPEG_ENC_S0>,
+                        <&pd IMX_SC_R_MJPEG_ENC_S1>,
+                        <&pd IMX_SC_R_MJPEG_ENC_S2>,
+                        <&pd IMX_SC_R_MJPEG_ENC_S3>;
+    };
+...
-- 
2.17.1

