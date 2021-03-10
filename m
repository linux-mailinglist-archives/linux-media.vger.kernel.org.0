Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C54233399C
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 11:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbhCJKKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 05:10:15 -0500
Received: from mail-eopbgr30063.outbound.protection.outlook.com ([40.107.3.63]:14054
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232611AbhCJKJw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 05:09:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1BkNUsJHgy360PU8luNxuZUbMZFU9puSIYz1CgMOPdPZG9HyefQbjdDHK+ZXZhQjYGPpqjidoiXVRTvK8pgswXXll08iPco7hk1mZPu1OfFub9TBRi4hSZl0spiS0gd2AWMI1XS9zaInu6cJx9WG9EFgOW9atk+/8DFh9kuk6jbyMelsDi0rooeUDXh2pB2hLPnAaAQZRg95jbemVQm1rifpWU2Q81DPhiJFNxuHqQqoHyMsDeGds7qIate+pFyVYiHNzrHc3nfbQ+OMKecm5pVfjkovkC7DOMiL10XJdyQQ9l8f7sSzI0RpyECdqi995e0OD2eSbhOe9WIcfd8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdKhDbmlg5Za0j6h1Gnm33l4N/AIyHSMNJq5P72b+jo=;
 b=kR2uqAZs92/1L+d9ABwwBeZQnqqve1R1ElXIWhSwY0nw82alMxxNBDxRkM6Qaa3uJXBXVyfZQyLxH/gYj3kRwJuCNiJAerDJlwrsmcthvZ2wM86pn8GWWYRcbG0DIIwbJ9x/Pa5TpFN5dBXdIPP0WW8P7O6M3HxIknHVcR62YADfchWFNghmQ/aLbIHP2IrgJocjspy7kUEhURChDcM4IioUJxmXVpzZvcnQmdld+zMa7FF7esyedR7PJaCthfyPKSFQuCxMx0sLZ3DYd3dN4saHNKm9c2NZB/EbPoxUoiecw5Q7rE3+kOpX6jgJkh8gDfB7+8MfXdquoHsaSR515Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdKhDbmlg5Za0j6h1Gnm33l4N/AIyHSMNJq5P72b+jo=;
 b=iFP8D2k0iHt2BVu63QpCDep2V7dQmeTAeQjxTseqtAdXBbc9Ni3+UeNnt1HKyjmD5usWU/n5pqBwDDxYGAec/MiDmz/1vUGHOsnKed8ay0hj/Hj4oqxSAWbqlcsu25UQd4SCKzlUzTiSCW3b94dPKPeYKO9O2fDIGIpxpqwGql8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2813.eurprd04.prod.outlook.com (2603:10a6:800:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 10:09:49 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:49 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org,
        robert.foss@linaro.org, lee.jones@linaro.org
Subject: [PATCH v5 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Wed, 10 Mar 2021 17:55:32 +0800
Message-Id: <1615370138-5673-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e19c7a1-646f-467d-6e4f-08d8e3aca3b3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB281348D86F8790F831D3FC1198919@VI1PR0402MB2813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fX+QTWDAthLxY9Zk8HxACuRx148niDOVy3CJIHY4gvnr+3j9hkbiyQB9bRkUWW+NW0j5p/VvObCgzxAXKA3S7uw4e5XGCO/b4XR/11/STfyQpDOnKRpA+bZUiDqsTNGTpr8bWM8frZPvXVgA554d2wpqhx7dO7IOB/WvwEI2EWdNW2FqDL05Ru+hhNmN11l9mrFgI8pjnM5W6LGPaXLz9iXrPmcE/bR7GW/UX7We1WrBbn4QVPIvkfz358LrbtoROkCZEMWDC9frXNepVioEiObZugFY/243vz8Xv6qETxleJmOU5WMmC+djG+UXsEXCufqJHDudBc7w+ieDUogZqVW0Ji+F8g5SsIf0tsNQm4BaHlnB0MzcR9RAwZ/gPMU2v9lKh+fkRAMEbuNGZ3L8Pl8h0aX8m0LCQiES30XvSYYYsvVQTdl4fKYjyuD0GM4eC6ZG1L6liC9zSYrR8P97AdgTzymkt5xUGREYBHt0J6j+R5Mfb429/JMyqOTARirc+wwxStfQfZ77NQWwlWvwL4Stm7kRu6J60QxUF9f493B6N4wY+i8iDd25cIxQMEZcV5YIAU9SQwtHh27M25zRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(8936002)(6512007)(6666004)(26005)(36756003)(6506007)(956004)(8676002)(2616005)(5660300002)(52116002)(6486002)(316002)(7416002)(478600001)(966005)(186003)(66946007)(2906002)(66476007)(66556008)(16526019)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3oxcDhhV2tYa01pYXVFM0VOOUtYRjlaZmYvNzAwSEs4Um93d3I5UlJYZTg1?=
 =?utf-8?B?alJKUW1hd1hjMWptSlJ6NHl2MHZpQ2hDVCt1OUNnUlh1RkJQOUpXNEQ5anJ4?=
 =?utf-8?B?Y01mRXplZmV1VW1UUWk3eCtLK3R0VDZCOER6NUZiT0RlaCtuNUwwT2pXUWty?=
 =?utf-8?B?NlVaayt1eDNpd2pMUE9PYXcyVVZOb3BmQTNCY2dMR0FvdlJBVTNVdTRkdjUy?=
 =?utf-8?B?NFpOZFA1SnFRK3JVbVM0cFdWSEtNbU5lYlRiT2EzNXpUTkI1K3MyTk5hN2ZL?=
 =?utf-8?B?bGVpSDIzZE9KMUY3clkvSXpyZ0ppcFJrbUxtdUIwcnNxOWUxNnFaRER0eGM5?=
 =?utf-8?B?YUpaMVY1akVlRHZ0K0hmWFZKYUhYZ2gxeTJVUTd6anIveUZQR2JoTis4WnFH?=
 =?utf-8?B?TzhnL0tKTkJNaHJBd3p3cjcxY1J2VW9POThWbnN3UE5aOGJSYjNoMi8rcVBr?=
 =?utf-8?B?THc0SUJKSDVmS2FsaGoyd0tvNXNabUgyTDI4Nm12L3ZlbWNqNDc1Q2hTZXB3?=
 =?utf-8?B?U240SExOQWhGOWcrSnhHd1Z1aC9sU3I0SW1NQVIzZlVGTDdCTmJFWmpFQ1Q1?=
 =?utf-8?B?MTcyQ0RtcHJxaUxLOC9tVTJtSnE2MlJFb3E3WStQOWNTWkxXQlFRNmJPUVkx?=
 =?utf-8?B?bGZYZjdwNWYxbDFyd25vd0pLM1lYMzhYNUhieEVsQjUyMkNZTjEyMXZTNHBq?=
 =?utf-8?B?N3hrRHVPdFVYamhldFBOL2JkS1lMQ01hYnB6S3ZGaGR5bXEwc0xtK0tVRkZ6?=
 =?utf-8?B?bHRFampraXRRQUhjU0xteDNxaGQrTG9KR0NaeGtmWU03RTY4U21CZmRDNFJL?=
 =?utf-8?B?UHlzeG8xVEtiMmp5NDgzZzJhcXlsQmo5K3hmaXlCcWxGbEQ5bk1yR0NZZzQx?=
 =?utf-8?B?ZmN3VjJ1eWV0NnZLZHIxL0NQTk81Sm9yRmR2RGk2MHI4M1pnR2VZUUc2eTBp?=
 =?utf-8?B?NTZ4Z201R3B2VGhOYmNZbGwwa1pja1VuS3lqamRhWE5RU2Rkb1RLVG9rSlpP?=
 =?utf-8?B?MWRmcG1Ta2dhMWMwTHE1Nm5UTGhWcWxra0pId0lGSEJUSFJyZW1Ld0NOVHdS?=
 =?utf-8?B?OFh5bk82RWgxNmtMM0Y2c2pPVWdiVFhPam5QVGRGRnhVOUNzK1RGUnVpZkNa?=
 =?utf-8?B?UjQxam81K01yRzJDZytLNXh6WDQ1blloT0N5YXRaam44SFIrb1lleHJESytu?=
 =?utf-8?B?T0FWN1hTRy92Y1dRNHdEWElBTys2SGdYZzhKNzhNV3I4YTVEMDBBZ3VTTndR?=
 =?utf-8?B?RjhLMS9XcnhZQTI2OGlWMU8wRWlrR0pZeDRKZkZvL0dJMnBXbDgxVXB0ZWZn?=
 =?utf-8?B?WUEyRFpuMHorMTIvSzVEWHdtWWJNb1hETEJZemU1NEdhQU9HbE01OTkrbXBx?=
 =?utf-8?B?Y0d5UjVWd3R2NmdHNTZlWDBMSW5JSkphQXR6b1lsWWdQTTM5VFhxWHdEamtY?=
 =?utf-8?B?UEplbVZhK1RmcSthNW9tSmJIdjF4c0tjbW1ha1NoRGVrQVFSMTluMGJVUnBF?=
 =?utf-8?B?NitlRE9ndXVUUGdGSXdZYW14RTA2U2JvVFJvS2lHeVliejZGOUpqRkVWVUR4?=
 =?utf-8?B?ZEZtRWFqQWlQRS9ZSEVBOVZxRUhMRDVpQzFJWE1saWNia1V5TEtFc0RXU3d0?=
 =?utf-8?B?Ky92cVppZlExR2R6ZWd2eDBYZmU0Z3ZRMzZJd1lkUkhZNTIwblk1bWRVYlpQ?=
 =?utf-8?B?cmZZQlJubGNHODRpV3F0RmVWNmViVjhsbWhyNWVNTkxsU2dseU10RThIbUlE?=
 =?utf-8?Q?5v1qwuCk49fzASxzOowR2c2mMn7skQah4YeQFkc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e19c7a1-646f-467d-6e4f-08d8e3aca3b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:49.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVZ+ESb6F/tG2Wtl5Eb2Naqjl5+N3xgrhQiLsSJazq+Jq6/b3csYAKTV1kKCDuCSmGl5eRjLDDWRFPqb7pHeVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* No change.

v3->v4:
* Add 'fsl,sc-resource' property. (Rob)

v2->v3:
* Drop 'fsl,syscon' property. (Rob)
* Mention the CSR module controls PXL2DPI.

v1->v2:
* Use graph schema. (Laurent)

 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
new file mode 100644
index 00000000..e4e77fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pxl2dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Pixel Link to Display Pixel Interface
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qxp Pixel Link to Display Pixel Interface(PXL2DPI)
+  interfaces the pixel link 36-bit data output and the DSI controller’s
+  MIPI-DPI 24-bit data input, and inputs of LVDS Display Bridge(LDB) module
+  used in LVDS mode, to remap the pixel color codings between those modules.
+  This module is purely combinatorial.
+
+  The i.MX8qxp PXL2DPI is controlled by Control and Status Registers(CSR) module.
+  The CSR module, as a system controller, contains the PXL2DPI's configuration
+  register.
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-pxl2dpi
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this PXL2DPI instance.
+
+  power-domains:
+    maxItems: 1
+
+  fsl,companion-pxl2dpi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to companion PXL2DPI which is used by downstream
+      LVDS Display Bridge(LDB) in split mode.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The PXL2DPI input port node from pixel link.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The PXL2DPI output port node to downstream bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - fsl,sc-resource
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    pxl2dpi {
+        compatible = "fsl,imx8qxp-pxl2dpi";
+        fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+        power-domains = <&pd IMX_SC_R_MIPI_0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                mipi_lvds_0_pxl2dpi_dc_pixel_link0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&dc_pixel_link0_mipi_lvds_0_pxl2dpi>;
+                };
+
+                mipi_lvds_0_pxl2dpi_dc_pixel_link1: endpoint@1 {
+                     reg = <1>;
+                     remote-endpoint = <&dc_pixel_link1_mipi_lvds_0_pxl2dpi>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+                };
+
+                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+                };
+            };
+        };
+    };
-- 
2.7.4

