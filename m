Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2962AFF51
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgKLFcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:07 -0500
Received: from mail-eopbgr00050.outbound.protection.outlook.com ([40.107.0.50]:15463
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728054AbgKLDIL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:08:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2j6Ppr7OMf7JahC7emsewEKqvRmO+6GufG/Tcddr8IRwIT9zbGW3AQaQdgwQw5ngD8btVTq6Nf2PArkoBtzGeJYGNHfiCVxJNRj1XMD6BvsJGArmZLaTmGZp2WhPz+vZl0kc5tAxsvxoUyktZx+nDvNLWrV76sYIyoYy+98cvRD19V2x5KvosmFcdS3LZj28irh2VfRy1HnK5ryJYZVGydec2PTIH8fpDWgGWvtZkGSsLYcEF8rgkMc3ZfLDFCasTseF3205IDg4XZ9ysAagX1GRt4H7OH4P7o6KWcljRytkYQUFcREq0CEnSMlAuSX1XfVAWvLGO/rS7oA/jCD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26egK6P+wl9vfsqP/x5Slg5cVWyMpOTs6B5danH/Mx4=;
 b=A61GpCoF/4txVyytY43Av9PQOhIfAY3Z2Wa8+epnr1UiJX1PHG8ZxeguQHyfsIA+efS66ALY7+sZUCKtDJIQXDWfG6U2J5vW1hqjOIwiROsV069pkUnvTEP4thpQfIfguimbjqePfWusKVUY853P7roZ3MKcBhJ0E5kC5OJ/NqZ+2c102dcGviwxbKdqbhXXkpS5bGrjtOVNNIyvU3N1qfBcldRhtBXuX0B4Bu4WsUyIS4duu1sT+I3KBA17u5EHPmzuq12MS2b6vm59XQulvRo2t6UfMdavl2UHoyadA7kVwbjTSwfk+2rdEwOkSBVGPWvxdMtQFqP0GyKdzkpv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26egK6P+wl9vfsqP/x5Slg5cVWyMpOTs6B5danH/Mx4=;
 b=dxp1BWurlI4pwl7BGbkhRWE55VuwUCvUFC3givdIn4ed+KQB3yjVHKSAjpYYB9AVR2mnFN+wEP7Yv7qk9YVi1zSFfwJMfZu+o7lpM+lms0xMNVwJEUqo8/c8GZb4nnbPPdcpv5ZeGnE5Embrm6Qf3ELwfFjkZS3gRvjRjnNV8q8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:06:52 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:06:52 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v5 03/10] media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
Date:   Thu, 12 Nov 2020 05:05:50 +0200
Message-Id: <20201112030557.8540-4-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.138]
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:06:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4d954af-26eb-454f-fbaf-08d886b800b6
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6997F66D34D598ACE5C70460CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWNaHivWDx8tqXB5vnGy4mRPGlgtuZby5xYvguRpYAZZPuskvZYoF8eMYN2408w08M6Xw3yBrfnc4qm8n56JZKA+tyjM2+43F2XvKyouWd9EZ9FlMJ6wTzykU5B6JKiUtR4ciQZ5tFQBmoLDC+W4/Js732Ka+oMB1U5fvfQQORVkhjoEgmXYi+wfmGqQpxjAo98UAcotkSu1YYpvA5b6FhdEMqPfZhmKf85xkfWijevyinD3PFvU4Kwqgdu4+ltBWtqUQUEXf5IcboP9QYdM83WxmqSgIUMW2KYv1dPq6mNP8bE47GHf2LCo3TOwyM3SzMeDiFVnfEF37e2nYDI0uVYLvSWopvoXadhtbyW1XY/MIFxgKIhl7rfqVw1YQ45iZREvh0QEcWSoGoqAmPO4Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(1076003)(316002)(26005)(478600001)(6506007)(966005)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: b0ceqtJKEc5+FN668BLfLnFgEeQGPtIFO9L72LvG7cZ3Mjze+QjdrautcN6ZB3BqZ2NQqLXlNr21ul5G4xWMXUCdYSdjWXkYMFHxpI3j8FFCFhASMx0QrE1TkdtYN4InfLiDMxpJcz51o5YXXQgIrW5mlfUFePYLUlORKoGJ8Uco5D97q8QdDxaI3g/bCdIACoVe0oUCgm5Z0GVzCMWOlLH5Zad6NylZh9EukXnnL7HQxG+HcGEQJ9bvFe4nrJyGp3l5XApD0PrQyDqaEIOXlrMuRfovMc4Anrq0E+kfAq+8sHx6abN+PolkHAhvA0WX+RQd+b2N1Wr7xSI5V/+aE/jbAzZNP3Ce7t2lMSYMpgWxkGzq+02tG5iCJAl304d5/6ccHgw+ruV78tKskRccGr8B3gxnl5mK5HeFM0Xeca3l9m0K/JwRE1m3TaurkKnCBqca88g7cdWHV2hpzWW7jNRIgkgI7LL3eeUeShTdGBbXOoOAAG+fRRfVmWbuJ2v9kWG0BlGpQmwlwAUnFz+fFdPkQWOTijyks8tuAyH2Zwsd+f5CtUspoqaTiMeK99g4O/bFUJSQdPuYLlUO81rnrEdWA8IU92063VJ3TQqkllvujWBKK0lW600kZOLFCrb9CcYNlRbsg0bAtuxrWzxhkGfqxEfEsm993PiE1MuvrgbDzKzFmY62EXjL2n3l/mBmsy4LxqfWdXBcUdXCs6EE84UjfNTJphtP46xa8p0QDJ853EwdLrzTUFsTmii8+xXrtfANQDleycoDeQSx/mq4rGr4N1dlVlNWUutflOCROqneYsXLZ0Y2q7nunFSGdZeS2x5U8xBZiiTQjbsg+HG2hKhvG5iLWX1Y5Rid7d9nlZ/NEFEiMjTYNahYLI7nj8jMSz1aXn5RsybeyJFOhlUt0Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d954af-26eb-454f-fbaf-08d886b800b6
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:06:51.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zN96xjawGpNFXgfoavQI1WoV4pd4qUE7V+zx3OyOQf2oV0uN51R5m5DCnILc7EWBKUx+b2HgCvpu2k7npb2pRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v5:
changed compatible name to be SOC specific
changed fsl->nxp
rephrased a bit the interrupts description

 .../bindings/media/nxp,imx8-jpeg.yaml         | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
new file mode 100644
index 000000000000..5d13cbb5251b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QXP/QM JPEG decoder/encoder Device Tree Bindings
+
+maintainers:
+  - Mirela Rabulea <mirela.rabulea@nxp.com>
+
+description: |-
+  The JPEG decoder/encoder present in iMX8QXP and iMX8QM SoCs is an
+  ISO/IEC 10918-1 JPEG standard compliant decoder/encoder, for Baseline
+  and Extended Sequential DCT modes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # JPEG decoder
+          - nxp,imx8qxp-jpgdec
+            # JPEG encoder
+          - nxp,imx8qxp-jpgenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      There are 4 slots available in the IP, which the driver may use
+      If a certain slot is used, it should have an associated interrupt
+      The interrupt with index i is assumed to be for slot i
+    minItems: 1               # At least one slot is needed by the driver
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
+        compatible = "nxp,imx8qxp-jpgdec";
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
+        compatible = "nxp,imx8qxp-jpgenc";
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

