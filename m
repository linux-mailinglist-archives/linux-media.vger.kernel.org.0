Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D712F5DBB
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 10:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbhANJeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 04:34:44 -0500
Received: from mail-db8eur05on2073.outbound.protection.outlook.com ([40.107.20.73]:17830
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727778AbhANJem (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 04:34:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzga4Xhgaymg6drRoGZHaTA/6FY4Tc/c6hlzaBATf90Zo61MMzRmx5CbN3+CbLn/FJuM3pwm4w+6Vt+FuSV0pHZfP7l9EzCbD57Nx3vCMWmYpkKbv5odMvDhzRuYG/YAzCfErf/bXZ+/H7XsvR3yAJ91u41Qp6VTMaCIvZ14HkcIH9c7UxYKGEPodZFuYMDBiJiZvbjSg2ay6xeK7sNpKuqYp1zxr8IdQIJrlLs7BoGw6Eqeb8tDCT+OwUebZQJ1C0ueOUOrio+gunZIc1zJgEjM4KCy4qUMRLylh1klCLx+Av3v/WoUxHggQOqTU+Jn14ghspsEiN7GL9qzyjhrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTOzNP8NBExAJRfNou1dF7hyS83k/IpoZqyxOlBCWhc=;
 b=WEf5MiNeDUGtM6JMHC24tKIJygDPBHfPlJhoQ3U8xJpLIIImeNSbmn+BgxihlOgJ9gSgf6KoL4W0E0Z5oqXsmuLPg26KS5LB8BpItFME/CnyGWeQIR5HNrx7kfixqT4e1cCEV47cEEQz0P0NwO8zNTvaVESfe/1PvL1g+POOW9/zV7A6rdsTHFGQeNSqWFsecVBg7WChHt6EjH9y92+DRaf8goGKH1//SEznSk0wrqqkF86dN3vYYRv4Qot5yDbzZPkLEFpem0Js0fM70b/aWxxSc2k12wYC1b7I9Ek5XwAdxXYRT6fUp5hf5Q2PwEp+FvFBKl8/IUsXoVXrvy/JLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTOzNP8NBExAJRfNou1dF7hyS83k/IpoZqyxOlBCWhc=;
 b=plx973pv5Zkuc2YPmXQGBUYN0srfmkJ5c/nSznpQ8RGkgiwJ7vQit5zFtAPVEMjvo7NEKfveowIORt1bxvZgaONkE5pfleTGImglYqOP2hd97UFjly4LqRcAzEoatzgnB0QQKjZLidvoPw+mopPx9jUSfelNxUnPKtnzz2SB6YM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:17 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:17 +0000
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
Subject: [PATCH v2 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Thu, 14 Jan 2021 17:22:06 +0800
Message-Id: <1610616132-8220-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78001afa-c39e-466f-420c-08d8b86f6cac
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571033407E2D82439A738B2F98A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dAcbznybTU/XoNpgfJggpq3E0Dl+FoPI1KOPUbK4/SDV3+JjcHdc+mNsKUlmTQY49EOtIuKLIkGCEdvXN4CLg3Bd1XEb830m7eS8J1nXncwpDUjm6WcSNAVvuuNS64K0Y5vK+gBqFQdMpcAF4i25cNIPlvCZCcQxtway73EYoATBQkxmm4uCokfloNlQUIxnC5znMiuGPymcxbq4X2ll/l8wisd3i3iU2Q3DVcQ/6ppiWgrIFCd4b9Rt3CMzLvwQgHNYS9yu6XQoWN++527gfHXb292eA9mb+nvc1eSsBabPwXOrrmQEF0dhpUZV/f7ehJ6Y9ByAoQMYhbMgjj7kfrTsVfpjm28NJSBIm73TSrg6Dh2mcIUdS8dVll683z8Y/GRxaScAXs1q5kXP/P6T7bdCIBd9qWYDik4ZHaymEsbFI1xrSVPOkKbvolAwphyHPwm3yj9bA2ROXL28jyUuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(2616005)(7416002)(86362001)(4326008)(316002)(966005)(5660300002)(186003)(52116002)(2906002)(66946007)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlVKS2hNRnBZVUFWamZGQ1FtaVdIdTVQMlZISHRsMlR2U0Fia01IRW1YM1do?=
 =?utf-8?B?U0RtM21rKytyUURHYkJnTVdsdGdST3F2NHBrZXNkejRHeTFNenoyaUxVaUZH?=
 =?utf-8?B?L2FtZUhmTWxya3owSmMyZHlhYmhOVFBQKzFrck1SaGYwb0JTdkpZMm5xY1NC?=
 =?utf-8?B?eCtwZDBsSER4dTdyTkhCNVZpRzk4ZTdQTWxkWm91Nk51SEp1VFRIUWhnNUNY?=
 =?utf-8?B?RXFaYTJqWEFIQWRDUEY4a1p3NWZTNUNlYVJuSFRVU1p3RjJwS08rRStmQWJ2?=
 =?utf-8?B?RHViNldNUmd3dnREbFRHSE5WbjN2dVZRSnNXYTI0eTNEaW1GVGJHRjNiZ2lF?=
 =?utf-8?B?VmpJMVc3QVNIS1VZTDhFSGgwT1F2dy9xNFN5MVk2QmZiSlZCR1RBT0wzejV4?=
 =?utf-8?B?eWpjd2J4UDNqbTQzdDVCNXZkQnRRNnBrWnpKYmhBQlZvT2NrTC90Kzh3dUE0?=
 =?utf-8?B?UTRIcExRenVqNzNFNFdiYkpxN29JZkhCeElZa0hMUXE2emxlL0JpbjI4UmVp?=
 =?utf-8?B?VDRMdm4wdzJ2Z293dGxTcDlOaEdjWjNUcFRFTTF5QXh2UW85SVkvVm5qNld4?=
 =?utf-8?B?R1ZWazMyY1VZVklGeWlaTm5yM3NjeFhmZGZZYVVNU0VVeC8zdG95NmlTR0tH?=
 =?utf-8?B?R01iVGtiWjUwaXRXN1hobWIvTE5CSjhUOXZpSWljd0pyL003cnhydnZERHN1?=
 =?utf-8?B?bjV3Rm9oSFdSR0R5WHcvWlFDc0hHb1V2U21yNU5wUFFlWWh3SUYvL0VSVFZu?=
 =?utf-8?B?UEI4enZDM1pjV0NYYmpCS28wV1RNcFZRRlpRTnoxaHFhT1c3MzB5ZENaU2N6?=
 =?utf-8?B?blNsQlJpUjRTNDdCYkw2RWdIWitDOExMai9IamtXU0NtaFE1OHZWN3I0VU9m?=
 =?utf-8?B?OFRpTVJCaVE1N3pIYzdodVRNU2V3d2R3NmZSVk05c3AzOXhadUdzcmhVeFRQ?=
 =?utf-8?B?N1FEL0RWYUJhZXhlNGxDKzY4WDBpNTlrN2dRRGoydjJvRVVxSnVFdGtsOFVw?=
 =?utf-8?B?Ylg5bEEyTFNlOHN3TG1HU2VvRzVPSmdubWVOemI1ampLWmJtTXJ1MmprRHZi?=
 =?utf-8?B?OGJONUJlQWtpZkNjZ3owS1ZObzJQWEdPOWJuTklDeHpEbkVkbXFPTFhBSU5i?=
 =?utf-8?B?TzRSYnFVZ01udUZaVWt5ZVdLRktlenkzemg1STBuUnhUQis2NEhVT0tNSUJB?=
 =?utf-8?B?TXQxeFhQTlFqbnJYL2piNzBqNzh0MHZuZ0ZGNmU4ektEL0xVMXpZVCt0ZVZ4?=
 =?utf-8?B?YTlmNHZ6Z0hPdzdQeGNBK0RwVFlKYzlUMG1uRUtQQVQvRWgrU3ptaGI4WFJW?=
 =?utf-8?Q?iCHOL4goIZr4g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:17.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 78001afa-c39e-466f-420c-08d8b86f6cac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+gVc6I2CTiL7TIN5njHJXr98zQsuDw8tpKAFJbC5NETdS0QGz+m31XbSmALpIOpd194UfnV4oLFC1PIvvGGDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Use graph schema. (Laurent)

 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
new file mode 100644
index 00000000..187824e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
@@ -0,0 +1,105 @@
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

