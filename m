Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9EF3368A9
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhCKAav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:30:51 -0500
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:41273
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229810AbhCKAaa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bU6WdX7C1lhCidF0WsIqo+HqsUU0xTyUwDZNeM/C0i6JSz+JWcf2y8N5ndR07wGxSZ1YA360iq/qBX9U/KOQCtE3anbPfoW2umZPd2H08u9TA0QrZq/nnn9Fv9IV7LtOt8LNAfnMsPQCqZ15mRqNP6ENmZVQYu1PsED3wO7REmUaPxF62J6DqiA20glncnCzzXMIaV3bTiQ+VGLPVMAMXsI/QdHD27nc2rdmbg8QbimE2zMCN0mviSYgv6Ei6kWcJ2e+0bHljKw60XsHCNBo0o7mNS4p5YOSGjTs5A2WSjRbReKBuwG0cRXOIVNxlVXX0jf+g+qXwH/edxRBMgVJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN5luF9ZtgbdLA8mY1E5iHEwQSlQkGbok19fuSO7Gbg=;
 b=JXosMvVQJWzB71V/fT2clLia4hwwXo0lZk1loaumlFM4nzblBhVw5yGcqJ4DsaYMWl8ixbDatf3hWOhz6xt3owe+14ePfxDe3UcZsoejdeY/YYZfmueG6iHAHajtyYL/9WQkvzUp5rnnkRFCcQpBiGa3DmQrUrffXKmyN2AXjB2R/PIsnQ7Dkh+a6ExiwLhkvMJ1E0fUXXYHMx0T1xDUZCjSi0i0qniT+oDdcq5xYZPKTcsVc/J20XSRoENTr7ER5mN9e1/cN4wdPygfmhZGhjOMQK+vaFQCihprnSYJEnUFIf+ShmKRqn+auTmevv86uGKdWQAsm2scomB880HuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN5luF9ZtgbdLA8mY1E5iHEwQSlQkGbok19fuSO7Gbg=;
 b=R3DYsRdkPU+PCwGUaOU0lV5eONpYIpKQYb3oFpwbrapcC0fAIVGzmHV6WE1gEO8tXJOuBkdcAVa9Jv9wpqP2d0QRxwOJ/9m04PhrGjPwOlfW6yNU7TTVPwH7OYalF2CR+JwgH3GEDYA789ADuRZNpyx/aV6gKh6djlJiomBO1GA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 11 Mar
 2021 00:30:28 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:28 +0000
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
Subject: [PATCH v9 2/8] media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
Date:   Thu, 11 Mar 2021 02:28:48 +0200
Message-Id: <20210311002854.13687-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0209d74e-4a83-4f43-90e3-08d8e424dec8
X-MS-TrafficTypeDiagnostic: AS8PR04MB7959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7959A6262B8C4A1F4E1385C9CE909@AS8PR04MB7959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gv3zQyNnIy/uBz4uXYsvCQD9fUg3ZRSV9l3QmELuHwDLS6jVHO3OtFfVLY7qfid1pm1SUjijSo8UaDhmhzwmbpnsnxaI/DwuAJBBWd30FGkDKBrurqi/9wg32LM6XL89Jpx/7Zye8Fwp/EZt5SjhkWdvgINuzTl0PGSyW/C6xEkotMsqiS9L5YhJXqrpZqVnLL0ecPJImZd0Dzz4xv0oZGaLMOka/Hb/1cw8Sgl/iCZ474zF+Jhe1di+EmzCmAnBQkENbDus+C3T2tnDeqbCwSn+TW/vKLrBm7XF2KI6ZUAjxhTjub/Th01FhfIJELFmjtV+tZhnvLFPSVOakSlpt2cW3D2Y3LWva7WAUL6bRD/GSsVyyukU/sg0UNhzJQkZXSqEKGJ+M2RIwsZRBFuqxxUQUU+C6F8lZA5LsB54DeFtwA8SMIsSlROvnurYnrsuO6qBzm5oSayxjno43dSN0ZVKCt9B6OBFDu5Avl5mJZhQTUe21zCQ6zhFdTvbdKQ+Ji2oX464615uavSkYwgdcVoBXiC2TKWbIsNQOvunakTmDd80sUbMtbqMRkh66lPxgIEKSKchj/Z3ZPHPmcVkwFNSkyjJET8u3ioctIeOWDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(1076003)(316002)(7416002)(4326008)(966005)(478600001)(52116002)(6486002)(6512007)(186003)(26005)(16526019)(86362001)(6666004)(5660300002)(8676002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tX4lsPD2ePoegpPRaWNZSjW8kuLN2mpHpfKSP/VY4bn7Y9WVaef+LLe1UzgF?=
 =?us-ascii?Q?cO46xHZH1PkBoaY7HKmI3w9d/wnSm5daQTmO10R+6cOja3599m47+ISePLch?=
 =?us-ascii?Q?0dP0Hs9Zr0r72ib2MVEOUpvWcdvCGTFa5R+/tihW0fDGGliNd5F++bSneXVR?=
 =?us-ascii?Q?xh/Ds2BKiMgYVtbT0vxBUvk4GR/02t2xUQnKstBk+uibJv275Dhur6rIryf4?=
 =?us-ascii?Q?DnvYVfegei0cRsGARMx+xCgp3l9l2tUK/8G29AVKUvheYjPv44a/XnTTd5dB?=
 =?us-ascii?Q?+JKP6OZyMAMPm2wDH0mZ9TIOI9rusU1g8l6YGosO2fPUuD+3uPQpSCWV0242?=
 =?us-ascii?Q?RsvKgtl736EN6hQWIx3UpoTzh4Uwvw1jhlYZr3C+JczodzX+6cGprzVYy3VP?=
 =?us-ascii?Q?r9GdYl4nOmU9Pz6tBceHky9/N3CDL0k/s97hMmf2eHd6uqjb5K7NQRVsqq6h?=
 =?us-ascii?Q?f8/RvDtEFYWrV88NXxpVx3E0yCLTiQVyJR1uRBWqQlrDdEotWbED2I4CNmYc?=
 =?us-ascii?Q?U9+tFVluKk5jprOKRgULbOcDh0OwuA/kxVAlVFK4fc8b05TkiPVPzDBUeC13?=
 =?us-ascii?Q?CGK3dvnYpwL+Fxb/ud2xoq+mVwGtuqQFhdBP0/mCM2A05oK6ta+WJDmBORms?=
 =?us-ascii?Q?wztLEmhbWTKDYfEyRV8UXAvbkokoxiw5axy+FDaZ2bGrfrSsTATLvZPMz431?=
 =?us-ascii?Q?i12dpgT76evnWJfJ7nFGEzCDLYR6cMKfEIk1Tr+DHyB0dM1EV/ZzNzMC/WH7?=
 =?us-ascii?Q?HbDNQzgw85LULblnGnJs1cCTlyaxcKlY+LeXfOwFxl8bwheVGyJeXlBqQeEh?=
 =?us-ascii?Q?PCGls8d7qTPys75BjMB0aKgmdebHiQfnPg5MyMMzqc04Fr69jZXzrHM00H4n?=
 =?us-ascii?Q?jkzAqkNnb/AcDxfx440ESX8yyoPkzL3AG2lpWDttUGUcRdOowJiW1UlinGUO?=
 =?us-ascii?Q?h1AxV4HWo/cL6lyk256y6Uyt3w6ydx2nklv7np+l1+ItC/h2j7QVbdXVDKwE?=
 =?us-ascii?Q?gUpYyioW/W6fUs7jw6Y8etNJNkxgcVrU3yDm0Y8uepswiJu643JsrpgIyIKq?=
 =?us-ascii?Q?atkrsUXhjyn+zasGr4rTxai2PIaekM+haseanYS3x1sOpxN9ZoH0+bv/hCKp?=
 =?us-ascii?Q?LvKIumBwORCFqZfMEZK/BSp5JG7PUfcpRkuQ8zCSbvoAmFSQHvm0Iv6amUUP?=
 =?us-ascii?Q?q+NNXIy1Xhzt/oKbhxJxaHrgLQpIos2QLxb2FlJcIWXeKnU+5rF/eTBVqxfh?=
 =?us-ascii?Q?whlpOFqHcgMSO+NV25pD/LZuPpWT1L/qpulfGAgcqkjzN1GVCQq3Xi49CtqU?=
 =?us-ascii?Q?8TUWXmc/O0EgzZNoFHq7XGgC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0209d74e-4a83-4f43-90e3-08d8e424dec8
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:28.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12Q9+i6Z8KDipnKQ4wMVJYgv3G8PqmQ7OK19fGC5amI1Hegg5t5oW4Oymif5zWiTVz3J/2OIzLZNlfBlGI84kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
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

