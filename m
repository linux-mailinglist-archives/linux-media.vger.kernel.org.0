Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820A72F1F71
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403938AbhAKTb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:31:28 -0500
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:23264
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390699AbhAKTb1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:31:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC1FDaOyZtxWsjvxRGvvBmMsEiI+3Ddx/HMj8ocIATFw34ykwauOQ7UFaERC9gCOmIxExv8A75Q3OhP9DaYzFJXGvOltM5TX/K+jPZvt6Dzo2ThllmmVzoXSve8rtLTx20IXl7khjlzLUgc178C5IamTVUVYiS3xfVNHmWJQ7GhuU6atK8SL20fnvey/nJZbLE0GE54HBkNLBu9skszL/sDVQHuLobt71pThW2dMcJUhqygBPcPFv81qLuIgesnOdhhk/jkm9pn1HS5bDENZn3RZ59sIzqXYjoE4jw1gxgQz2DmSltxGeWNF6bd0iBYeZ6QS4TqUc5TYNEUIwEFK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN5luF9ZtgbdLA8mY1E5iHEwQSlQkGbok19fuSO7Gbg=;
 b=PISgrolyd3ivOZSubem48DXjY1roKNhMzz0AGOxLKE/8EaQWIFmAS3ljVVepBO+IBRL20C3/FA3MnmW3TD1DIN2A8U09cE5OycU/0Z2LoEaDca1W75x0qpJY4/4QSIuevFCo4zo0thtLavC6m9e0hYuMY440UttPZGJSn+/0B1UKZAsAeTuYm2b15fPwWUKSwl/kn8NYwhlSt2sgl0vZCEgIt+wdMJ8MrlNTiqWTq2BGP/2iP7eMO90HQjLnvPx4RK6/o7nykMTZGINWBl8dTxGJ0n5t7Q6wRUDI1IEFLmn42pnN82VoTf29K1NxVGNAS1R1mJCKmc9TWAO02/lJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN5luF9ZtgbdLA8mY1E5iHEwQSlQkGbok19fuSO7Gbg=;
 b=EO8JhsjHeq0IIYcH99Q25n1o99ReyXodgEW+Nvjnlw5mMDGCjj4C1CPn7lT8bmQahw5Cmm1LmDRK8k4Lh5Voxfn+3rRrjQ7xb9axqyORcSZbHimpMZYDms3kTRDYB9jNObXEDz3DaoajKmRZQjLcFPf8KBiFz/ZsYsvjcXj9fm8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:28:43 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:28:43 +0000
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
Subject: [PATCH v7 2/9] media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
Date:   Mon, 11 Jan 2021 21:28:15 +0200
Message-Id: <20210111192822.12178-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [178.138.194.64]
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7531e38a-6b53-490d-95bd-08d8b6671bdd
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB442460F0FCABAE9021C82CC3CEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oo5TCVt9e/tevFyDt7qBbusV1ZMvqFaQxqlrRKSwCNx57HBY3OQMk7fTc8UXHJ3mj8UvwTGfeF4zJxLdUJt/oclw7FFIMITpRc2TJxIilCasW/zJPBtShtSXvPzGJavmPHmd/AF54MA2XaXnlnuGB06s3habumlxfHPvtQvhscxkGnZV1W/E7YNqqMGd5ArLU5yOrVetraltCjvSsa47xlQjLQRbFaY+yuz/CB26+Eg9d7kUqVKt4BGOWf7EuyAW/MFOP6fHRZ/A0QSL6ij2WjrTOGXfL24VJy3006bNP8u84F2AhoW//vxzZig+wKIQ54fwhu41BixSkjQpjRSS/ajPRQb3khebjMzexrbgBP+Kv3lvEcdzIUXCayJRwHXo8ks4l0drt2XzgJUS6PP3VpNBSRR/Rwgn8oLdw7q7qDzj7asmBbQBGeuo1KaMoj1vSgqvxnwrhw5R5jnR+KidFv1HkzVHs9i8seUny3LILePwwQZNqqkBaHoc21rTMifde0yQXxoHTDmY1SawaRmn2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(966005)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iIe9jvktrTtCVOEq1b8IAkRBrg0U3In9G4o5xUvDMXIuRLJgzPkwRZKvbNM6?=
 =?us-ascii?Q?Jzmh+5FN6hLOfAsjbaC8NgXTXvYB0C+hYKyYdh3SHNt2ky4Ho2oTg4Frpwkr?=
 =?us-ascii?Q?TadsWyCqt3CCkTUqZ5E4/wtBIzjDMkOIkKd6fRyQV2PXeyTGItJbNiMUCp62?=
 =?us-ascii?Q?TcXo/ZLEaRcxTUQMosLtD/5o5tx8lDPDarMbxswJZdecUudvf0WZcF+/j9fk?=
 =?us-ascii?Q?Q1hGrF/ijJlcpuwQV9Oy9uMo+noS+HNg3wawRVru7kxzC6XENkh8Dph7gA7w?=
 =?us-ascii?Q?+0VKO0cCco+SKU0Z1IA0Vf4hgCB4bML/wXBhJone0u2RZybaI/WxqFw7tHXb?=
 =?us-ascii?Q?OOO0aycoJOPjwz+AdklDqH5KxXHEP1AklJ1w+1NUybdgLavi9VVYN2tg3sKW?=
 =?us-ascii?Q?R0RQ2DQmW7kQeeDddyL9B/VA4dLQuDVempyOsmv5Av9OmSo4Iz1gSQueXQFW?=
 =?us-ascii?Q?MfjiAMym2g4vfQ/WTuMvR/f1u6k5I/vVVZnbBkxrCxvyL6YdFdU0ydYZCwBu?=
 =?us-ascii?Q?h3AVmrCoo+jCtrHDopWZcZZzaX/2IBzZr5SU1WGos5sHjkh/mhXuIHyOePHr?=
 =?us-ascii?Q?F2cGCkRFcrSO23zHIzMrSuk1eens8xxQaw0+CisY31422CGTLrJy26v9Jy/O?=
 =?us-ascii?Q?7sd4/TAIDYjX1PT5sSFeH6ECTisjPbPCRpabel9yC31oxSBVUw/RXfJapNpM?=
 =?us-ascii?Q?W/ybgCcY/XmyB3BufOC1ChkurPkTPZOS4RU0qCfWD/SWrJpDgOBix3GSLN2u?=
 =?us-ascii?Q?jZH/kgvRZaLoVEZtWWZCmPqA4e1AWPgEtZmLQlHmtZ+k5lO6btOLOA6QKv1x?=
 =?us-ascii?Q?+ESOQFdQtL26ocM24KuB3S13OYcEEzi0y5dZXcNZcbu2AR7SPlHRi8m68k0h?=
 =?us-ascii?Q?eC7pTRX8h46/6S7zVnPUtPET40zd4U0q5EigS6XyDalbxH70x27HfHSWkELX?=
 =?us-ascii?Q?QQhBu0GjwGv0Mv0BzL1+rx2vhpWx8k1Y6iz3xtI68iV1P74M1/aBdu9CLud/?=
 =?us-ascii?Q?P2q8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:28:43.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 7531e38a-6b53-490d-95bd-08d8b6671bdd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZG0QSapMd0ZhAyIVUOUJaaSSOAwtKvd8DD8slkredX1+KQWZsIovrhU/sLnhEVBI2SuCYstx5tsTbvYopUJBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
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
2.17.1

