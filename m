Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213CD305687
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 10:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbhA0JJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 04:09:25 -0500
Received: from mail-vi1eur05on2089.outbound.protection.outlook.com ([40.107.21.89]:35681
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231326AbhA0JGi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 04:06:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsA5SxkuE+VkKhQTVJVHYYLIH0W9QPTn3Tbx+mK9gs9s+I8SZ6fyIlXsbYA/YiDjg++L5I5n6dbegTVZAvQMfJkDGU3pquVXHEaBEEu4Ih6onQmuysfnFGU5he/yBtfrEyO5JAnLf79HALDwdGv5ZdTo5Fniyxg7LGsqSnrNx9R3KuCu6eKVUsRnf+bMqrKnN+TRCWNRB9HoXarnARHvxilmZ/p4yRD4G+yZ15SLAdN/xyiV0DL4t1ehPpuD5QdB54UHhpsKClv3wGrYvZf5PmyKS/2jIXTY/BEgKcPJ7vNR9CQeU6uWfNpQ7LJtv6uHx/pZxFsYm/9HodY8Q0JEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hct4ijw9X88b6E0jStJEhqwk4xp8hiy+XmdL7nSEPUk=;
 b=FcudkcGNhR3SDWtyFHbb04T4DTVCjdAU+h33ydV5L2cVEEJ7j3HDKlKEZjvBe+rTU5bCFKEs1nvGQi23h+NL7qNAgBUu+nCusqAkd8cvhKYzs/UXEa2gZ0UxRcjse4C2nPJZLlUL0EOQ/aPf8it+QpcjNkVqicC6gQu+8H1VPKLrmdeSydzFfsfAcB510uOuO1BgJY8/Hd95/eOLD54BdEddcOwJ0OB7OJZgpflvhQdjgVFRmb0/IudQKOMMDggs3PZNPrhHXy1c/pywOzUjdXGyyw9eKDSKQeO7jZfxPWMYyeQMJ3t8GoOv2err0rOEjxTLJM+lBlOvSiJehTa8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hct4ijw9X88b6E0jStJEhqwk4xp8hiy+XmdL7nSEPUk=;
 b=YxHY0NLIKYZDEdhnodaxdwHssm9Rwyz9ZJNAKi8mFSWX26NXMpGkIonMV9p4eiQpW+MDVqoONw000pZ14mY0XIPatOck/zWZDUxEIjzRyZuW2+1WMeQBdBY+IZTE3khk84hxbu1V61zR4HcBDYSQWnf3jjN1UjWp42sC8f5BHpA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:09 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:09 +0000
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
Subject: [PATCH v3 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Wed, 27 Jan 2021 16:51:22 +0800
Message-Id: <1611737488-2791-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4601a30-c0e9-4966-5021-08d8c2a25dc2
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297543142274D45D6B191C6A98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaN351EA1uIDhLKGNZVYSS4BoB3nU19IwIhLBK7f3mf46bj/ugGXI6pERQcD6LZDIR/bNmHOdkct6Dbb28iuWRyBqkvXC/HSXMxwAC7WKLUwmc0+sQAVFnJfmvjFr0Xn0psVh7D2729shlb9NRKZY8c751Djs8BmG0UTjSZ+HJ6zN56NDqtH78gN7aJ/8/tBptFdyKGfogRX1bOl3NMb9wB/1J1dXKmZjOk7TpAnYLXuo/cKxRvKSfkRv3rm/1SkFAKryvarCYo/be53OKQy7Aa0i1ieYsdHA0kgzgtD6BKO2DEDBcpKP9moBvrytcSVxcJWtJWB8A2Ya4Bj/2ikJjwRMPgZxUWDjeIEoxD36WPB62pbcwMCN8vJVAeweYWz1adOEHFTF9QdvxniUHDVods6NAXXCoG4jSBBn9qLcLYp6QsN5eHd6RFmSv7+eNi51rkhYKSNBbQDGQEqLMnF0ZaJXhLp4V/1I5L6MMBczmYzd/8Oazs/bt15SUiqn4i+LlMoSlKGZICP8aT876Pcs03wSfhOSm6PgjTgUEdVEZGGy5HDtP9x483+cioOmLlYfHiBXQUDicJ0TsswSe+y8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(66556008)(966005)(26005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUJMRisrVUxFR1p2cmk3MDVCd1UrbENOdVBpU0RZTEFhU2ozcmpJSUpnN0Fa?=
 =?utf-8?B?Qmx3OXN5THVjdjlNR1VLbDB5Y2FMUWtkU0lmSFRRMDFKSlJrMGFIcDFORHJS?=
 =?utf-8?B?ZWt4c3JkL3dnM0VnWkRPNVpaSFhiRll3eTQ1MHRyNFFNbkNWcE1WMzM4Tk1Z?=
 =?utf-8?B?QjN6aHBpZlF6K0tWRXRhOE1oQ3U1MGxJUk5LNFBOb3RjZ1htVVFzVUpJVzJn?=
 =?utf-8?B?ZVh2Wjl0aFBHUXl3c3JpUlE1dmJMK291UHdMVzRUekJMbTRiTEI3aWdZQjBR?=
 =?utf-8?B?SGJqMjlkRGU5ZEpoRXJqdUUyNW5KZHVRcHFBSVkzRUFWOEtzQUtNK3F5TFRi?=
 =?utf-8?B?Z21yM25QVXB0US9rRnBQK2l3ZVdqOGUwMUx4c0RVT1FYTlRVRFFOMEl4NnJP?=
 =?utf-8?B?aDdQVDhnbUZvbVNweU5ROXU5Yk5WZk4zdEt1SUVYSDFNZVdzQkN6NG1vWlhO?=
 =?utf-8?B?SlFBRXptZVZDOVQxTlIvUVV3WldjajhUcUU3aDI3aXl5blFTTnU0UDBnaC9W?=
 =?utf-8?B?SXRxSEdNTzF6RTBRU2pvQjlwTm5xVHNSWEhicU5ibklSbnM0L1RXOFdQQXhD?=
 =?utf-8?B?Zmp6QWlRYjU5bWtIek82YWJDWjFiVTJYd2VIdTFMMjgwdFprRXdVR1p6blVE?=
 =?utf-8?B?bTcrdDB0MUxGSUdZQllxVHFlZ1YyZ21paEdDaHBzT04xZ25QNFF3MktFYjgz?=
 =?utf-8?B?THphWlpreGtOVG1sVlYxYVp2RUt3aDZOOU1LTUVndldBa2lKMnBaZnBTM2xx?=
 =?utf-8?B?dm1ibWhxZVFtK1Z3VDM3dXpzN0RJK3U5dVNyZmNRQmJTWitaZldFNVFQYjFF?=
 =?utf-8?B?Z0dnMWNLZDA5YmtsMVpSSzlEbzFLY2tKT2JtU2FlRFZQT0NaZjZFdnc1Qkgv?=
 =?utf-8?B?WXpzN2VuejI2L1BMVWw1Zlc1SGRCWUJMWWwyZ3Z5eWNqcW9CSVhUcVhlcC8z?=
 =?utf-8?B?YkpnY054TWJUeDkwQUlHaVlQZmpTb1VMQnRPd09KUys5aWlDTXBybURhTExh?=
 =?utf-8?B?UEgveUsvWHEzMUsybm5yZ2FvYUhhWnU0ektxZTdtcHA2OEo2Y1BsUSsxeHh3?=
 =?utf-8?B?amVxN3ZoN1o4RkR6c0tJdzV1YThOajJiNTRianJUMVUxYVBCZExDWnBNU3pn?=
 =?utf-8?B?SVRnc1gyQWkxbHkzbU1wSmpWT0tlc1QzMVEySFoxL2NlaVYxUG82d2VKLzhw?=
 =?utf-8?B?SkllSEtHREo1QWdidys2V0dnUWVvaXc3RWdncDJoeW8wY0ZtRjNUbCtWZTdx?=
 =?utf-8?B?LzZqbkw5bWFOaXkreUgyYzFQdUZ3YVNKL0hMMUxlY1JjSDVBTUh2ektLclJt?=
 =?utf-8?B?NGlSdlBmY2daTXdwcDhwMjdUMG9MeEtQbzZtdEVkM0E4Nmx4aVdJakFwdEpq?=
 =?utf-8?B?MkM4eHYycm5GRXJic1d4NksvcHRxd2Z3RTJNVnZid255YnNsWHpFQnp4Ujlu?=
 =?utf-8?Q?Zk8bX6Zv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4601a30-c0e9-4966-5021-08d8c2a25dc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:09.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYr5X6dObeUtS7+y0BHXLB6+3evJYQaD4ybs6FiekQf18qhu9QfG9y5ZrHgqTEJ6pxcJT2Z6rgjSBnQsS2iPNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Drop 'fsl,syscon' property. (Rob)
* Mention the CSR module controls PXL2DPI.

v1->v2:
* Use graph schema. (Laurent)

 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
new file mode 100644
index 00000000..6112095
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
@@ -0,0 +1,102 @@
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

