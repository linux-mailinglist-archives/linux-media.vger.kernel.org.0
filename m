Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6E72DABD5
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgLOLU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:20:56 -0500
Received: from mail-eopbgr130072.outbound.protection.outlook.com ([40.107.13.72]:15078
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728750AbgLOLUx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:20:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6WAwM7gTnVqo2GYHpUsG99DFDnYsqWYXM1s30zcyYYVfIwc6OCBc/ph9Op4t7oD36BVMwXlga2vUdA10/AW3SEybjRqW/GtoFxcx5YZg6+dHDnR8N8KMhdwuHNDfeSHxvZ5pXjgjn2epwWDYGU189H59ioPAebNJy/W00npeTEk9VLil3Uxt1UNES+brf7A8QQKcC+RRFQyeQ8jHhDpPPJ+PYiM10UMKf9mqhVrIPm5oTZ9tQflfp3pNgDPgGetq8/sg0ATKZkOUiMijYtYqMXxuF2Jxloxp4kUrdKt9PLJB0scbJlovFALyU/YSKQCblVH9G+rmcY3HC5VlrMqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0V1zdrLbvgQAGNAXomG7Gqu/+o5i3YRd9YCbapA6M4=;
 b=dqbxT5eqnqLOmjGWMo9TLo5Qw7XK1+dzO7OT8+4fSy2/RZ8cQGLrtw01vs9dgSHGrh09qrVq47GHvv7pSKEHbByYX0vHbsEy7wN0dEhEfzFjRGkdUfOYzbNqPVMXWlwiBoU+5VWsfZoooCUgQnRPqn8XCxxd1J6xEgkf8ist/z9dSDOh6CzBSgqdrogEAJIEpoUGDzH0ijmAfo9uN8JL3nZOuL+I3yrHez90g3zFap/PavceXlO78BY02Rl+VkzlVT8y0Y3zGcBEZ/rX5rDYE2W5UdJ2JpRV0Oqlt+aRBy+RbA50/AHIQ6hJknf8SSQAUocLvJYThEoIoUYwKV71Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0V1zdrLbvgQAGNAXomG7Gqu/+o5i3YRd9YCbapA6M4=;
 b=aD7cZSeXPsgF0No1b5EFqent36JG0v5bN6a7fHpP4MygXI/XN4wN8aRoEjBetVHa/1C1Q0YV7D3gdXSjUmwMuJ4y4rQFfqTsY9sSG9UfXDiulY+pVeWsesXc2+m20Un3FUWS75JpoEEcRKJrLUYcdIgysmXnLx7fqikVmCsBJ4c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:14 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:14 +0000
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
Subject: [PATCH v6 2/9] media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
Date:   Tue, 15 Dec 2020 13:18:36 +0200
Message-Id: <20201215111843.30269-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
References: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [79.115.51.151]
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23ce50d4-97ae-4819-c1b2-08d8a0eb417a
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB273796DB336F237EB0BEDA7ACEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3wax5oOTegX16Zut6uiEvUDSZKGRlPA+fDahOeEYxZrlE5WoRD+p4wTijP1rBde0YObgCMqwsV4UlREK9jpuOLghCE/2SW76S8GSHAy5N553NwNTkA9PZ9X/aS1spEiGTAiuxzqPEaVWQ7eQQx8DtW+D1r6hkryPdEt8GrpOn4b90sd9KNOpwzQLmHuhqSMmzTl8XnMQ59EEWCzQImii2RimKpEYXcZG7vwU2dMXaU20pih4uoNzH4J4hj23WZB1Cd6O3NLl5Z8zjpZ6pbkNE/kFbzDk2C8UYVvGSNfFIh7lPRaFajXT0p4GRo3ssI41/9G1heVofqLvsT0EC+sPOSJIyxiE6SWLVV9KVAJ6toF7uP0CYc1Z0Nugo2E9kI8l8Rk5n1XhmtoN+G1wuzsBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(966005)(8676002)(7416002)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ICJDwJb1VhuUNiobpnKrJL7mW4cv3AogdTn7X39+t2gxRq2oPrxsG5yZhqKr?=
 =?us-ascii?Q?VHHdCEyUd3pc/7R7YNpmUvS5xtaNIZa3NEFMH24B/z8Ltz8Uj5nWTWDQaHLH?=
 =?us-ascii?Q?t0Ve4xMomkh2KJV5G2rqwjF3gfHPee6Tylaxb8wHqhyWSANh9E/4/hrcZwcW?=
 =?us-ascii?Q?KEeCuNKAxYWGFl2NlWtlwsaNDU2Koq50OoHeEaIM+PfO6IX5qB0+8/ZIyuO0?=
 =?us-ascii?Q?xEi7z/O8OIERRxvW5syd4LxpyAFSNSzkwkA4/E8G1ek7MBHA4UMV545k338n?=
 =?us-ascii?Q?Z9RZMgDdQ0UBnGOljOFb4NTDX9MDw5FBNBFZbIZlRclUSGHR3NwkusD0nSVL?=
 =?us-ascii?Q?3hsJzWjLzlg922G3ZHw6673EPKk8VDnSXZSr06ZwWLXdp0GMU39jlJfoCXw4?=
 =?us-ascii?Q?JLhS5k5C4jaVty4tYZlWKXgVhKTNPii0drnMFBwIbBpPlnMibYWrwjQlaUcF?=
 =?us-ascii?Q?YHekSlrDdzpRe85wJIIZ2slzxRCfZS9ABFZo+zFfqEVn9Sr960owY0WOaH5d?=
 =?us-ascii?Q?PL/6W5+XOhSNM7Xvl1ilJkEW9LPR+i29I7Slgscmkwpt+3+rKG/SHxEVMpai?=
 =?us-ascii?Q?aohQ8ZyrU7+9WMLlguYxpjAoPsVS+k3rF/jgJ28MJ5emdWqkYVOgYSq//Idb?=
 =?us-ascii?Q?5V+YTGuZ2uvv5/VUIwRPxRkxepcIgRCcEes5bqWx7alWWwzNwyw6wv9KQSP1?=
 =?us-ascii?Q?PwJ+6+NxIomK+vZ6QgcRIx0xHgJ9ELsDmSyvQABHDUYfqFipS0SOnH+dMhxS?=
 =?us-ascii?Q?NwqP1Q1t2K2dZqUyfITJ9odYBG4oI2YvKNOfD3XSG4YN+RIXtUPx/m/VN+3B?=
 =?us-ascii?Q?cmXiY3UfcBzHhrtX1eiFoW1w19X1la+89ijusS8kmGokawcOB553a9OMk8NW?=
 =?us-ascii?Q?lOnVMRzLKyh2VRIpB+XDCY4VFW6nycguUDLegxav8zyGbQCxFtMxylfEL7jT?=
 =?us-ascii?Q?Tw1aRZGcqrLbGD8fK6pxxcqhYXQW+eBM0Qr7JvVTgbpmcISmpCjhx+NH1vd6?=
 =?us-ascii?Q?ujEz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:14.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ce50d4-97ae-4819-c1b2-08d8a0eb417a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLNRCs/rsO3pnhJOws6ulLvUY5Efv6rwul1jaWeIgtfqH60UkDL/Lr2MYxLWjvSPEjh5YHRw3SNPxuJj/xjYbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v6:
  Reviewed-by: Rob Herring <robh@kernel.org>

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

