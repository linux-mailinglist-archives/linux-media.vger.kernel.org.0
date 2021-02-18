Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7217331E4C3
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 04:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhBRD5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 22:57:00 -0500
Received: from mail-vi1eur05on2068.outbound.protection.outlook.com ([40.107.21.68]:49249
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230310AbhBRD4v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 22:56:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGtqkyBA/uNVD6ojXSj/XV22CRzjbA94byL+r4oLb79jhPK/QT6ayIPx8v5a8nspgPsx2u2bxx9zgZT0nsMxfZoOtANat5nA+NJjqfx0a42qUZLekw2f7b5VXKQlAoHOi779dsscAqdlLAEkQVfGUIMBGuT9y28/zj/XZ04bREIT9CJdmmyDMILOmCqgAOkBgLPwnZlJWBeuT0Ll5+EWPNgJBjiQwOtAXz99j1qOVqK9a2tNnPk5uI7CisSqakVQiiJ2b14bm2f+dcdLMdhIsm3oaBfDzMmDooJhZHNAcoMaGtGZvKvR4onjxtv8blXQaIOg8hblYU4+4VKMpGRWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5uVWVH6Z6t73/1mhIW228y8iiZYig0nvPY/B2Ajp8E=;
 b=DNPH4U4qF0yj4DMF5hRlVkpivhSyePS952IhwgPE5FJm6f8LtOa4DacKBFMMfNolPSkSdKn48+Og15XLHLeoUZa0lINYa/TBtOGUT94d3Y61izgB9TxP/WUufB4u3EJwGJij/jBv/q+6uEvXNxFs3yEpr9b6c9aCALuuKlK4KAopuhtf7OKagRU5tuP2oWqe5BVjMzHsDXoyXq8qn4Mj3i46IFw1wW3dHBS4/fxeindY5bfLSBgq1rMWNWatO2t04nMyKs3r/84HhIsaSgiDM7mVyxhSXRlnA0s3vrt+No8WysCK9WFzKqEyfmFQ7ZJVyli4xJ/ziEkpz6m+QBTtlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5uVWVH6Z6t73/1mhIW228y8iiZYig0nvPY/B2Ajp8E=;
 b=W1kr7bVN2bOKFQjANSWMi2145SWxAFEp8FcqspldA+Tg6vfeWUHmzdYhYfo0xeV327dSV3Uu6/6GHwHcgTaqku+WQ7XRyDswBRkIz4TD8nq5tczP8356b3u/+zWBInqUeEju6CjFGEmLs28JkDanKoAaOAXbO/FrSvWvAPSDndw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:55 +0000
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
Subject: [PATCH v4 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Thu, 18 Feb 2021 11:41:49 +0800
Message-Id: <1613619715-28785-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bda27f97-e68b-419a-b537-08d8d3c0f3b0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421DB44EEB51F42CE6E444D98859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K2K21gH9kGfQdEOAGar4W9jfCK3eeMq6WkJ/LXsNggylotUlvC1T7itxraJNjwV1WQIXWd1hGU/2QWqW/a8yEQCHXLbs/KiWR0vOs9bIWj1HQsXl2A4bDWdrgsDlY0mq60M0FpSbrUt981rcNlRnDD4YkeTP4ynUvhT9vnFI+0TtgXjHpnUJZUjahd0O5+YLLan3fO7yMTgCyUXUOFkdOGcdXuMqhptTih4zd4uUQnbI9tMv2Dm8pZZFfHSA9/HqqdKnMqxkSwGqXYJzu5RsfxcYqaUtkTtmf3+/BKyVNkcJeanzXhdHRCbCS3nhExGX7z6JzkGL1AIa1DhUlUzwZrDoPfrurEuzQTlGzlLnkEoiIhCjlsu/PPgzxvYzP3dAcOjQZEp7YwZntt5QXMM4ws7oYHtB8xABQT93JQTX+E/Tw71xoArKLr27FXMWxOOCO91YlsMmjusbwndMaV56327P3YWztnsWesd+qLcA64QYaomO0cQ1kQYVBso7zXvuNXy1uiGFKQO6aYq09f0dKGrv+G298dJlI1AV8IZyyJC/hirVHEhzbR6mbCuKvaaUFNr+Mrzii/3PBeyGjedN7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(52116002)(478600001)(86362001)(5660300002)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(966005)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDVTM3R5OEdVZk9KNnVneXhsV3hFRWU2WjV6RjJkemZTays3ZG9lMFhWS3dM?=
 =?utf-8?B?Y2hVOHpvNkNNS2U5Nk9LdDBaV29iNGMzOHFnbmRTKzN4OVB3eTdKVXdIL05x?=
 =?utf-8?B?dFY3cXlrM2JENVhGVjAxcnVyVXlQSmtDQlBxNnBTTk1QaGxrbE56M01DUUVT?=
 =?utf-8?B?a1JkeWpIWnA4QlYzTncrNnBsdDFZbWJScXV4bmZQcUNscGk3RktvcWZTblV4?=
 =?utf-8?B?SXpaY0hZS3RWa2dQOUo3RENLL2hSV0tDT2JEZVFESWt3dkVBZUcxNzdLeGd3?=
 =?utf-8?B?bG9mYk00SmJRZStvK0VML0JrdDE2YitmeDR6STRPY29BU3p6dW1VTEw0Qlc5?=
 =?utf-8?B?dkNSMkhnNnZoTUhaZURoRmRLTXZKa2pRdHNKODBnRE9jQ1ZOWHRaUk1YMmVI?=
 =?utf-8?B?MmpPYUVnS2VLQ245TEtOM1lXbmtZcXRKZ1l3VmpJVndMamhSUTBkaE1LY3dw?=
 =?utf-8?B?OUdkT3ZaVnprZmdqQXFWa3prcC9GSW1uSjBTQ1pLNGxaL0RWWmNlQ1pRNHRv?=
 =?utf-8?B?dytDUG5XOTFBdEdoakpOZitFTTh5THlwRmhkSW93bTg3MUowaTRnM3ZSOHdD?=
 =?utf-8?B?dHVLWVNmUVN4RUVReDFralpxejhVVWNnT3JaR0FPVkJQNFc1aFNHOStnczN5?=
 =?utf-8?B?cE03T1kzSFh6ZkEvTUJGdVQvYWxUeWhBdUx5YUNoekJGdFlQZThWeUN1VUZv?=
 =?utf-8?B?ajBqZFBUL1RQT1BYaURNZ09LUHlFQmg3V0RKbDV1OXk0czgrTlhLOGViMHBj?=
 =?utf-8?B?M3NFVmkyMHJYcldFUmUvRk5Lek16azM0SlhqUUlKYWJNV2FPQ2kwZHVFZ083?=
 =?utf-8?B?RG9BVWg3MWYrSGJVQVBnb3ZqMEZUeVd1RmVoVTJlU2RLVXR6ck5MUTY2RXpG?=
 =?utf-8?B?Y0lkSGNsZjRlN1FkV1FpUnFsUGV0TkJob2tzcVl0c2twcDI4eERoNkkzamNp?=
 =?utf-8?B?Z3Q3SU13cWQ5ZXdwbHB1RFNmbW5DQkFRZ1dxaXAwcHBCUGVDUXlNOTMweFB1?=
 =?utf-8?B?NzUxK0w0VUpFMEgyZFlyYkNld3EvY2R0Q29ydVpPQThYWmFJYTh5STZhdGE4?=
 =?utf-8?B?dGtpeW9vRVdjYzJINU53S0JIVEJrT2lWdVd2QXlJQkVUdmt4UnVCT2piT1lG?=
 =?utf-8?B?SlpPdzdLZnE4MTZxdFRQUVVydlVERnJWV2p4UWZoVlh4YlZrQnhldGxmU0FU?=
 =?utf-8?B?NFI3bFBpVzIyNGpILytxdnZ5dEdnRHBFQlJaQ1IrYjE5WkdNMmthVGFRaDFQ?=
 =?utf-8?B?YXh0N2N6aVMvR1FkWnBuNGdvbHptL3BrNnNtS2RjbFpVUDFvU3d4c0JGRnRh?=
 =?utf-8?B?NDAzUFBQTWRhQ1NsY2RMNVFlU3FqUGQrOWhWeFc1TDFNT3NJT0RIbHpZQmdx?=
 =?utf-8?B?YXNXVDFRc2NSYUVVRjJiVEdFRG1VTldyOVhIaXJmbjZYcVRxUnBOWWpGTmow?=
 =?utf-8?B?Tnh5RmdLTFZNY1UvcFNaNmRKSkxFWUh4bWk0a2x6U3dkSWtyZmY0K0NMZDlq?=
 =?utf-8?B?M0xTaHNjeEhhaFp4clVzcmFaOWw5WEtBbm5xRHJPZ0dnRXpKQTFueG9UcllO?=
 =?utf-8?B?Y0pFSjhkU0JTaGgxY1BuMCtLTzlHMEpzejFYRXRvZGFQYnJJRm5sbjVKc29W?=
 =?utf-8?B?WlduaEY1RGYvR2h6N2N1d001ZkJ5TmYxSEFMcDQ5S3F2WmRhdGw5NFVyYUlm?=
 =?utf-8?B?cnlTVmRFMk5Mc3Fpd0FmRWRsVHRJaGVodG1CUWRYcXQxeXlJOEhQUXhRa1pQ?=
 =?utf-8?Q?SDqYS5gXQAvQ+P84xJlJPq7x4mP+twTNGhawc2l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda27f97-e68b-419a-b537-08d8d3c0f3b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:55.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIVOokAddse2j2hgAnbn52YnykUrahxdr76syd9VlQDQ0o6/Zoozk3MuQqQ7WS6WfLZGLmItIrIaifNP43Q5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

