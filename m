Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2217D321FC0
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbhBVTMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:12:37 -0500
Received: from mail-eopbgr50048.outbound.protection.outlook.com ([40.107.5.48]:46215
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232702AbhBVTJk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:09:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IocNrLuDB8ZwBAj4yekOsokA1ZLpN2SAqBTpTRs/+TjqWgbAzB+O6jKfs9iKA4hEK+X7zH3qYykjQbUfA+pXpgT+id/AOhY6n7nf/SkvJGUajt/SqtY9jLbvuL4x/iMLxTKVRi4b0QNVzh3HnYWNE5La74Djxa8j0RoTjdP0c3W0UatoVaZuZNmzrWOKFPJuNeDeGt5UGYsggE6BAhXZy4FhZ00rTPtdps5ew0sb2AkILlp4ddr61QqPeebsbEjyn/SZ3RoVWFOSZHQzI8lz2ic1SM6zVDqcim0U+ysdkE3M9DCNvQYIdohF8aZnJFmra28q+Hz1HTgyGwVZ574zhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj1VPd+1MHpWEAhTg6aEoVSLhrHzw9uyT2URHulsN7o=;
 b=B4KB0EQYNHRF2bEFpzgHhu5LD8Z9rXhqoWEx5VpsK5PdoUy+iEChy6bzkoj9sOqRpeJTgi4rqi7dwFp6Gfib1/d4zVYVIbLDScfFHwfaoUU2k4P1gvFYDyGL9wYNI9vMB5PYl/o0eVv0L2g4uZ69BYFnk17nszXVgc0L1c3bJefINPaQ5A1JlSNIgxM7/zUULSiWR3iCmPifOuvcbToDb1SqcZaLfP3clkbafT92KUSaz0OMak3FeXxdbwoai/W2a01/PmoJGS7EXnVUtqNzrschJbpPBty1G99PMzIjQbpNcWfh8immfLjiqD8ZkATm87ecWqNkzcj54wwlETos5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj1VPd+1MHpWEAhTg6aEoVSLhrHzw9uyT2URHulsN7o=;
 b=cOUfBKY4+IxUNPHVHMRrvEvkDl7cw3cWOh/nH20L3qBtYCsQs7A4iaVeTge8+B0NEeEkO5tpuzAM0R8NazXTUpkpan7vBKZJuNWSgMc98RqMTecdVuorlNCbkPI/XvToG0KMxJ1i3LKFB7TNJ0jx8yTCHEjHhg8JkhaFzINttlU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:09 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:09 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
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
        dafna.hirschfeld@collabora.com
Subject: [PATCH v8 2/9] media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
Date:   Mon, 22 Feb 2021 21:07:31 +0200
Message-Id: <20210222190738.2346378-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
References: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d43e338-0928-46cd-6ea8-08d8d765319b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB75913B1824A8635373F1BA25CE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfJZui0kx6qhjK1xwH2YOM3AcNIEbv2cNpFQqz8TFx5RTqRcmxy6+0D+AfCbneNcxYcAUEyZZ5zl8Zh+KPYM2u8QG/T2fU4YwzLB3IJh1te3yIKY6mX2NDPOj4Ln4vWBumB5fr825g1C8nnL/q2kK2KPM5ZIeKOceN7rMym+H3mpEGj5/Thzr5QTFKSfaieYgM/+rwFiRQ3PWOWv/KszVDszlnxpNWGUuomzDS+MhiV1vsHdosu848tyBOCXjxaUUXvdtWAMsU0vvZox9JsnewbJ8/O9bt4tLinmvLgkqdxe+sakRjYdMhVty2grnWDEcagWfs1Hr8PgY3xV11fNNNwGtlgP/xR0E8yhC2x4K9o9SredgeOuUXDfemCFx04glpDHq7/N00BVw11BspvemOWX4N6YDNMNPY3uShZqTijYwQ4vBdDbTfmHPovvrjhckPFh0Ld/ZJOYPzgdy8JUUc5wircBr0N/sOD5tuc22Ua03Qtx9oX3m7tA9CqfWg+vrXDwovU8GcmtZSP/aAlt8flbsQZayc2ZwtTL/Pi5G2wX5u+HbMEKh05xxg2aqT3TkmQl/ZbdOB2I1ZzKGl1DHPvG/wp5Yimi/KwX3uELfFG410O7QbJvrTDwz3wn/5zGjOEtPtDLGKHa7qXvtQEn9lu8rVvIi5KwQs/0mjxDs8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(966005)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dYigkukjpn8C4G7sipTZQG7GxaqiI1TCRk2Hb9zq3DavUYSpQ1xOghcJP8IP?=
 =?us-ascii?Q?WwNCj+0xjcc5uWgEvb1GY6uVxwwHRdcEOWA+jvsRF/e6Gm/FQ0Kp0rtosHQR?=
 =?us-ascii?Q?CaEd68yzBTqbAUAC/QyOfi2mlzI3Dl2yIEoQYfHfUvruS3xwTtrlW1BlKj9Y?=
 =?us-ascii?Q?Vte8JoDkYsQxvOfRCjJJg5HGd/zuM741tCKHZAgALcgUxkSHBoG4nQHCmx1l?=
 =?us-ascii?Q?pO7aPTGBxs5QnR0gNyyl9OhEmDQhqXkWPevPgbqWYvJK3BfW5FNMG3h3eNt9?=
 =?us-ascii?Q?v9Lox0oxKwrmBbULVdpHbYW7e6jdG5R1p0ndEtQNrRHHNoYfg6VJjcAq6CHY?=
 =?us-ascii?Q?qwOHB3Nu2Po9xu1tdl3xAmCOSxA8NidvVRn8m940d3yBtjY7oaXjJEHiHbBa?=
 =?us-ascii?Q?o2kFtKt/wAdoc/suWPJycTKMuJj6sKDHHuwdlNRTcJ9NBPvHboYORqNeq8UX?=
 =?us-ascii?Q?1B2bBnZkq42qCaZS74eAqSWiV1bY/vu4/2We5rY+l5FPk3LfA97Sn4oaRqXG?=
 =?us-ascii?Q?QwKDj9BL8MlPNj3FtuXO1iBv6cOVM1rcDVXwH/7r7fGy59xqkC73QpGrcmlc?=
 =?us-ascii?Q?1PzbGRAu/YpfjsDpatd4VkDCcef2eS0VFxrosZl+g2TVTXBaU9jk+MbzA+J3?=
 =?us-ascii?Q?HW3hi4OTMg40KH6IJ29lMo/OcmRvRwIFivtOypghWN68CSSUIfeNeXTDN8+W?=
 =?us-ascii?Q?ZVZTmWEV+eqJLYVEH64NmqOR+7Pp0SmKmlBQPQckL+6DpAp5bjkBiV76yCrJ?=
 =?us-ascii?Q?siERFYKdTlz8ECoeD/xRJ/CJpt5jA5TLEdfpGUFTaYFaKTTmfl08lBfEvEUv?=
 =?us-ascii?Q?rMFOnZkX4qz96/QZKcKfCaoqYcPFql4sSpOskY4YivdcwEk8YazpYomuWevQ?=
 =?us-ascii?Q?E57QWBkmEpy/1aHaq6noHuM5dGdyufR9OdwOEMCfW70abtrR1EVAREbmlQoP?=
 =?us-ascii?Q?vjxh8imms+fWHkPS6BZO1mSKLODDA5hbMBx4a0x8tDm4y5UjnoxYCqMVIVzw?=
 =?us-ascii?Q?gn2rP4ViTJwt7uEtdXO2UywJNrPSHzmEqckG50shOTVKinjYoojcQ+otE++w?=
 =?us-ascii?Q?9u4SO6liR5CXYNYLSZdPvLnQRG3EdIL/upfKoVAusqvw8eIBhTzH43eN/cv6?=
 =?us-ascii?Q?NNDFMvr6lLF/+orgRXr/Xmhpq7UcnR7MzhknwyKlriDqpLgaW+OZbfcRHykI?=
 =?us-ascii?Q?FwVQwIu38mzCFOnFk79KuZC4cyzs+mWhxgh0RycSpt5OVDd+lKmOvsC+MlLj?=
 =?us-ascii?Q?OwbcZLXgmZHSrjLkLlfHT9wi1QqD8QSV5Nu+yRDJH6Ipa9QGEzxT+g1F9qAs?=
 =?us-ascii?Q?D60+tG2C5ypklDglppHq62Z2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d43e338-0928-46cd-6ea8-08d8d765319b
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:09.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YY6TJOwfAif52YyhnfDLliH9g7zf2B3/0CYCQSQ0J0drOL92oHpY01lK2+2SfuC70l9iyGOIs1SKTkUim6+/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
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
2.25.1

