Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DA234F925
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 08:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbhCaGti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 02:49:38 -0400
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:7919
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233888AbhCaGt0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 02:49:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOFBBsx93Nr5lKrGAmM5Vd0RSs621s0hq0PAAJ01xG7kav62mJcUhao6wpQ9lBZFFG7R2UlXj2Pux/+gsPup04YsMrunyNU4n+c3wKkDGcU4+Q7WOaOFMDwxqwImwYr9kUcXRFH1WU28PoMieFDqcwr62cxSFD/alH3UJFJEWw1VW/n6r2m06EduHD48RUcCGEOwVRy8xDeZXHV+4XH1nSmA6l9X6X1aJ6IUOgyfG1upaYnUNAen/SDQOJ78Z9CmlQSrc5xrUV8szh/oDa2h4d+KLrhYoU+nYiB1YVlz/x0fkM87pTWrOCtWxO3W8lmP04jEY6MPExpqX4nSSTVl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLTGvSsFUIGytzOZ+vKY3syhSDxCzbKula7lrr7jotQ=;
 b=mrTu04HBI5LmT7XgY4Apwe47+fHvQAqTZF/WDvRjRwlN2roQeYgaVx3ZJtoqDFoOv66zZEiA3lcl0EOi1ZTrX8u9DZu3laZvEtj2DWyksm+BpKfpPh+cSX1xfS/PVrSUZ1KqOtsSZMGHdImrTO6gECG/GkbrIg4Bmes0LOmAV+7+Cv7xVKteNkn55U/sdAgFi/Ub5P4um3v4Coj4inaZnuKwiojOiXczyVEQMzFgw8BnpKEypMwrw/VA7xxgeyyNGFS9bsHh6zpscbdwoRqST3YA33NuGr1obrhlpsexB7X3jWhUsqDFzuF+UZYsUEnase7ydQGijh2sSqGGVIFj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLTGvSsFUIGytzOZ+vKY3syhSDxCzbKula7lrr7jotQ=;
 b=jbWPJZraLroZ9ZOX+4lwCHPk5h7PfiDdZAxI+VG/YjNR2eCtOxG2yRy5ma950CVSPZt+i7zHFvQ/zC1jzh8ZVOc73VWdmE8ePvFmRnJb5oyVVstOOhmM3xaVI2DwEtdK5HN8oEsMjuAuz6Gw4CrDpI7ffFF/+L1G8n/2hhOLXPY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:49:22 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:22 +0000
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
        robert.foss@linaro.org, lee.jones@linaro.org,
        marcel.ziswiler@toradex.com
Subject: [PATCH v7 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Wed, 31 Mar 2021 14:33:19 +0800
Message-Id: <1617172405-12962-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 651f3b43-1337-427b-ee25-08d8f4111d9b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB63494941CE4A17171306F574987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PATS8ObErPAmE8B6HY8WWIzBsUTADSGsotIwo0PSjHvJw0zgsW4anwgU4S1cSm6pNJl1GHlRJ6E3Pxpn48jgTl5kO30zUSC7kJOb9IqFpcmzAvHSUi7KsbDkOfJ21/FQJLlB8WpzdT6qG848EDnibKgXnk06zYdOtPvGHwJHHXdMgWyN+d3EgHqUR5xuf5mNkDbeBc1iCWilsal4/ganU2v1/mhJXnUUdZIBJ5ZC9+XWzHa4QGqkigdobdoIxKO/zA8kwxDoCAvSaid8SkAyxiRgSyaTAQ8KDW4VE7XbBVmNFa1mbWQTneOZCob1k/fFFlwXAqkO5vxOtelH2fJ3/SvUfemLKLXpxo34GH0wgfsisgNBKCCAP0R/JORmj3MQ3RgajvfMnlW1gwV7guM07NpZ3o8Tmqe/KA+W4/tWYc3NRinoSOL2MUzII1ey7h8Er76vTYhKsZ/bshS8HW1Bqma54eL3XwXCWGN+sNVDK5/Kktz8/4TC8ddpcHmYVuBa2IBZ4MI5wl0D8zdmABuClpEfx35yW3kmKY+YtyOHdRW1vQr/wZ2YJZXWVAi+5F5TIWHiVW0zfe9CjEmWzq/MlFLnMugCdsdGsVkIn6g8uriQnRqBYVa7cN7BVEUq+y8RWOvyL26FGlKnBbUh6y6JQe+2M7B/+TLAjSqtGyFl7tFXhORXp8Xn0c1XCwE3AAb9WEEI76BpX7bLJYkf8z0+fzQnuTxEs/dN1GyIMpHlEYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16526019)(7416002)(52116002)(966005)(86362001)(6512007)(8676002)(6506007)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(36756003)(2906002)(8936002)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHBGM0V2SFlJQmpDUDl6K0IrRXpFa1RVLyt6UEJJdS9pQXQxYWNPR3gyTjM5?=
 =?utf-8?B?cE1tU3JVYjg2UmFUUXlUSUw4MkhTbTNTOEtaTGkzcldzK0w0TC8xR1ZWS0dz?=
 =?utf-8?B?dCtPK3dYVTNublgyd3JQOUQzVmxSd0VYR0FleUZ1dERlWlV4TEorL0RNdzBN?=
 =?utf-8?B?QlRVUlFSWHJrdDQyeURzOGh4S2M4V1dBVFBmRTNqV04rWHRmSmx4MWpZdnU5?=
 =?utf-8?B?TDhacWUvRTRUQnZmT3QwYmtOSnRMN2ZNcUJjWDdUK1dvZ3Q3U3Buakluc0h0?=
 =?utf-8?B?QjZFWm4zaVhSRG5ZaTM1TE5RN1BYWmgxcXJOVTlvaVFxTDJsMHVwRjgyempB?=
 =?utf-8?B?UTZZcnpFNkJMdlNPZjJvbWlqcmxPbkY1V1BhM1BkTzlJNWorQ01jMUF6Q3FL?=
 =?utf-8?B?VFkwT0cvM0RDVVRuUmp2aGpsblV3aG1vcVFjeEJjcWFsMWtCUTVUZVA3Q3Zi?=
 =?utf-8?B?UXpXbGV4cUlnZHViMFM3Yzkya1pSTVgxNWdCci93TkF2ODgwWCtWVkpEc3JS?=
 =?utf-8?B?azlEa2ZmWWxFRnRoNUljaElXdEVrT0xzUG1ZVi92RkI4dE5XdFVrc0JmdmJN?=
 =?utf-8?B?MDl5TXE1WE5VelBZRFI0TFBHbGdXTlZmUXdsMGwxbk42L00wd25qTldpdEgr?=
 =?utf-8?B?b3laQ0J4Z09ZMzRlKzRkdzlXN2Q0NGhjM1VndXNxanhKNXBBQzRUclR6VHVu?=
 =?utf-8?B?ZHAra24rTjE4Slk5RlhLejlVUWN5TkRiVkFkRlp2SDhFWTdod1Z2bHNEMHBX?=
 =?utf-8?B?QWF0OExvclZhQ0FQT3ZBUk83bDBCdGhhUEs1TUNXaSthRE9hWmY0cE9wamZO?=
 =?utf-8?B?TjZKRlZNcFlibHJQczVrb0Y3UVZPcTMvbm1yTk1SK0ZQR0dTc2JDdlZIZHkv?=
 =?utf-8?B?dVRJZW5uelk3WnF6MzdmSXZOTE1xeGc3MGtGUlZIaHkyd1dvQVBpaFNuZnlS?=
 =?utf-8?B?WC9UZG1oZk02QWM1SWhLeUpFN0JwNDV4L2ZHOGl0YXhhYVQ5TWllYlhYWDJT?=
 =?utf-8?B?OWc1am40YUxWTXA0cFI3eERZLzZWL3RSMC8rbTV6bmV1NkY2Mm5zQ2ZjcC9y?=
 =?utf-8?B?TW4wUm5EeUVobXo1WTRUL2hHOVpYOG9lKzdSQjNzK0ROT0thZENaam9OeDNo?=
 =?utf-8?B?bE43Q2RkUnlvdi9Ib08rQmE4UUFpbFFBZHRCTzVxL21nd2hWY1dpa2RCTHhG?=
 =?utf-8?B?dE5xeVh3bERCbUt2eWZhYm9Zc2U0aHZkajRLelI2dVNlazA5cVFPaGFmUHBK?=
 =?utf-8?B?RjlTaUFtSDJHTXNLcHBPNllYTkZnZkF1aVN1M3cvMlQyNkdkMTRlVWJoK1JY?=
 =?utf-8?B?R3c0YnZ4T2lCQzhtOEFqWlRWOE5IekRaK3BBZXBDa2lzNWJoOUwxM1MxcVBk?=
 =?utf-8?B?WVNISGpMVHFyeU1RS2pyRkhzc0hJNXZ6QURpMW9pYy8ySXVQWmFmUHFsWHda?=
 =?utf-8?B?bEg1dWJLaHJtYi8rWndZVlR4TWpCRmNVeENqYWw3dmk5V3dTRzlaaVVKOVhY?=
 =?utf-8?B?K0J6VXNDd1k3cFFKYThSRWlva3BMZU9EZ2EyQTVFR3NQM2d0ams3cndEV014?=
 =?utf-8?B?NEJ2NWxZVStSNVgyYlE1cmhzVXVwc1o5RFlxZFBlSE9iWHFWUytTanJoTzRE?=
 =?utf-8?B?RFZ1WkowTFZtUmFoMk1sR21MTkswajhialBrdHJickg0N2pmSzBFaWs3V0xP?=
 =?utf-8?B?akRyb0trODBSTVYvRU9ncU5rWDZ0ZTFISnEzdkloMjUrOFVIa1VIN2x1Y09j?=
 =?utf-8?Q?ed0d840rWywyf0amXmGus912zfAkDdnjB3UAhPw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651f3b43-1337-427b-ee25-08d8f4111d9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:22.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78kMQYt902XTwaqUEYmZFVz1uMP9Dzy3z+X8/k6f0eS+usJXex3FcOkfL7PRio0miCqjUiHqjXJtvkN+hilADQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v7:
* No change.

v5->v6:
* Add Rob's R-b tag.

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

