Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62652DCF32
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 11:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgLQKK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 05:10:57 -0500
Received: from mail-eopbgr150083.outbound.protection.outlook.com ([40.107.15.83]:17125
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727416AbgLQKK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 05:10:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKGskBHPUbuFnz3PFdZCpdaq1wxeIlgMHIcz22SyOnu7fIQYO5W7YTY4KJE/8z+fL3HSIIVTABGap8ysZqPH+OZmm3w+hA5Y/zRuG5zz3h3vH2X1vpHC66lX74W2hA8h3fiW60lLgr0sYRBNo6OGtcEtHRWrHKXSwyHT09wVRZr8VmxoZinL+fIZCBGH6szrpglmiOITgNAs1VvHdWzafAovSaGTsVE89YDu7MX6U2j3TtXL7COwj+jvPkdEOHKltLCcPf+M4x1/zihCom3accVXq0G+HRyn+F/96lFN6E8Ov3fDIt9dTyBfgFaSsX789qg8PQxjFWfT/tmLIc03Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO88+r3w5wQcNVeJAOyeWfVCPvoyyC9zE3uIT7B2XzI=;
 b=eqPLCOjpyK/+eGrpq1Lu6DpELhpy3Du+S8FWsX8xiUD2kuj+w+lNa+BsBQ828EAJ0ptviBpgW3ErRR6PrJlYzIEm37DeyLpfkVoE8aPgFaoU/gvaiN7n+rsvDAmwjMj8UslRfWLfaYY5ZjBzAHWai/U5rrF3ku4juuP2nEKY8aGeEMWzOS8+kSRsXNWM5azwcCH8jKHK2vCzwWIeyHZ3bk2RRt3jyBFkD9XjOAT6JaiPBupOOpHqwlkh0+24wgmXtEZCzwwEbKiTg7yn+dDneRN6HbkssdnX7+jZqgHK9Sq69OJ2kIXVpMImuCHPuDFrRgmofWbtpdqxxmxOoQ1RWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO88+r3w5wQcNVeJAOyeWfVCPvoyyC9zE3uIT7B2XzI=;
 b=UrjZ4b0I5AVlI1E7xvP/gJ6n+PUCrognUzKo8zvcOR0TLxrlhmJFCK5ODqrPa8nkSdVvoBjFN3eu7AkbPMAb2m9fFS0vCY2xn1bdEHmMJDBuLFFKfv5N8zTl8M1+DIrIKRBVrxodYh6Ks+LsPnX1N4C26VmfkpO2L7KJ149vd2c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:09:09 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:09:09 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org
Subject: [PATCH 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Thu, 17 Dec 2020 17:59:27 +0800
Message-Id: <1608199173-28760-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:09:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d68a29b-3f97-4bf7-e180-08d8a273cbad
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB731233099914E707D019A2D098C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ccfAcUWFo+gkBO+0jT7L7KsnN4gs6NVl4ZkzEGL5g2mWyd7utIOaWm7D/2yp1+iDcHItCnFBIFD9mSiI/B8VKjT4f6WyRtkNp0qKrmFUEbNSE9Bv0xfU5Ze8o6oxfiW6cJ3pvyIki3rayly3QvSNqzFXLXLlUL0ffQmp/ZTheL+fOPhY9suoyuCftYEEoGcOwPOJd15rbv/xzrgzF12Zn/5a0zRbV/bAQuwdc5JEDv+4Fx/hICEjLkdUGYYqUX6dv8KgvhcF2fVKAiPNJ1ULgCk2rrCNbtZWLUPAIWqiIw4He1JqOUUZg6n3JNz74vfzJxZFteLW85HYWPlCmhGOVWdNLigaT0vhGaHXB6UL3+LFjT5b6oPF8/A/fehuezMcbi7nClTtvICJNLEVNF8IMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(966005)(66946007)(5660300002)(6512007)(66476007)(36756003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0pMWEFOeFpYUEYwZGlMV2ZXUEVLeGpoT3JmeEp6bjFqN1V2Um5IUEJRYlpo?=
 =?utf-8?B?b3FsNS9aT0JPQlBOcmFwUUtXY3pKS2pPU3FaeVRwaEZOWGUxM296L01OMTJm?=
 =?utf-8?B?cFBCRGRhNUd5UmxkS1preE5iK3VabmJ3Nm92U0lzSFluT3ljbE1yMDNYNG1K?=
 =?utf-8?B?TnJ0YklHS2tjVjFWc0FQNDVMWGJxTTRFejUwd25aa0pDam5yZUlyd1p6bmJz?=
 =?utf-8?B?aGtScEZlVmNtS0drUjEwRnRRWldCU2RnVjBzbENTNzhUQmt6T3F0ZC9ucTdP?=
 =?utf-8?B?cXBTTjU5SWVoYTVIL1ExMm5vZGNubWExSy83L2IxWlpNRVp0TUQyV1ZCWFNr?=
 =?utf-8?B?Q0Z6MDY2VVdvUVVOSEY0ekpieVNxR0RydjBZM1g4OThPV0hRVDZRUEZZR29R?=
 =?utf-8?B?L1puQnZ0Um9HOVN5WVFocFpTb25TY2RZZFVXaUFudGo2NERYUmJiUzllSWs0?=
 =?utf-8?B?YUJNbzQwT1d5VDRwOTErSlp4MTliSVFhMDdhVlUyV2drUUdBSnl6QURYZzRT?=
 =?utf-8?B?R08ybjloOCtnNW5FYlhHekZsUjlLVElndW1oYjBveUJjNXVXdlFOdWpYY1pZ?=
 =?utf-8?B?V3VsaFlNd2ZiUU1rRWM1c0FxUjZNRkk2ZmkwdzVXdG1LamtPRDd2bGk4T0N3?=
 =?utf-8?B?cXRsRURlV2FQNW5OWElIUXZEdEdGNmVKUVBtTHMvb1NwVGgwWm1wQy9RNVhM?=
 =?utf-8?B?SjUzUVJaMFM3YW1UMG9XeWxwZ3BnMW9YRldJR3QwQ2VtaXFQeWN1TndUM1Ns?=
 =?utf-8?B?aEFyR1U2MFpNNWw4cUFWSFRuY1oxblI3RUVFa0YybVlIa09MRUlPMk5HUlBE?=
 =?utf-8?B?enR4UUdMRGN2RnNERXUraVY3dVJIUmtnZkM0UHVkQXpvUnkzQ1VQTFM4MHNF?=
 =?utf-8?B?NlNteXFjckpBSncvUnNLRXFHUG5JYkpVYnBINHJBeWVhMmhJVXMvVjQ5RnZ2?=
 =?utf-8?B?U1hiSGVtdTREa2VTTldvL2tUcmxwdU12eFI5cURzZkVLSmRXMlphMUFpNTZO?=
 =?utf-8?B?MzVCY1BBWFhiMjVMbGdYcGJOcldsNTFnSzhYNi9odDFEbUVzbjJTUFRSWUxp?=
 =?utf-8?B?S1EzSVR6WUZZZWdOVW80ODZiT3NvaDY0Q3hkVFo5emc5NEU5MEwyQ2tDT3dL?=
 =?utf-8?B?bnJlbThtOExVNjV3bEpzdEc2VFdGQ2pEbkhDbmxCMXhwdExKaGRENEVBcmND?=
 =?utf-8?B?eHN4MEg2OUprUFd2NEUvUnJuL1ZGQ0lFakFkUTJuVCs3RDM2VFhIc3pvZ2pi?=
 =?utf-8?B?T08rM1Rwb2xOQTBaVThGYXZEazFBakE5VzZUbUdtNzlXQmlMcGZCVXFpTndL?=
 =?utf-8?Q?VGQ70BdGxSCUAWZKRlCW+EKXt3Bpe/q59L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:09:09.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d68a29b-3f97-4bf7-e180-08d8a273cbad
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szXd8oXmIyDwGRVwriGQ+l1toeDguwbtiZ3lVWYvyI4KXHKGKX5KJ1rt3Oc7HjzPUmyoybyilXaa67uOK3+I8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
new file mode 100644
index 00000000..1649622
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
@@ -0,0 +1,134 @@
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
+properties:
+  compatible:
+    const: fsl,imx8qxp-pxl2dpi
+
+  power-domains:
+    maxItems: 1
+
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers(CSR) module.
+
+  fsl,companion-pxl2dpi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to companion PXL2DPI which is used by downstream
+      LVDS Display Bridge(LDB) in split mode.
+
+  ports:
+    type: object
+    description: |
+      A node containing PXL2DPI input & output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: The PXL2DPI input port node from pixel link.
+
+        properties:
+          reg:
+            const: 0
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        description: The PXL2DPI output port node to downstream bridge.
+
+        properties:
+          reg:
+            const: 1
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domains
+  - fsl,syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    pxl2dpi {
+        compatible = "fsl,imx8qxp-pxl2dpi";
+        power-domains = <&pd IMX_SC_R_MIPI_0>;
+        fsl,syscon = <&mipi_lvds_0_csr>;
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

