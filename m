Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6864E33E818
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 05:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhCQD5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 23:57:19 -0400
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:58360
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230171AbhCQD5J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 23:57:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0DTVu+UazcDzQMpZk3MGxiwU5NF0LMr5p1M3wvueNeH3H74eLUYuv9wlrhOXRARgxd0HVEZhrclydhi2DCkP3LJ4B16duyuK5mpV9uhGsNyBhIW1qo1SLm48CftNiTkmd+NFKHgRx5wEJom2SNLGugdtuPakmVhP9hjJ1Bg3HSHH0cl0RHNwVhE2MhaJ0oDb4uEeEqHf6D8PuM8cQW8Lklbkvv8ZpXLoOsi04ppDWCD1zjfLmwHEDqOa7xzFA/HFsyroa1W3WBb8qE2nGSGjUwgO/k4ecDTg4OANTytQwkB5A4pHSSmmVBGhMS4DybkFNM87M1jgbK3lPK/Zqdc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTFc8QR234I5rNEHOIn61/RV3xcv8F9EqsBbIWWUCGE=;
 b=mqOK9DMBoyxXN7qOLC4aEA/vemqWlYfF/4Ihp18+CqGxpfg2pHC+5KOitFFgCvP1uJLxnPL5elLmq8ivZMPz9UKWuNvIa2hUSTIp3ThRHh5j0detviSHCFkf4mDVIx/YjPh8bpJknpIreBjsCAj3f9kEomkJJ2CVhQxwI2FQd1YwCuLEbMg9Y+OcycxzsttXxetC9Fdp4Uti8mhvxG+fBoFP5lgx6xbAqSVZf9QFclKubBxW6Hl9WcJIyFhsuEeqeVGE0o66ex8U3d5jvFAG4AUaxioZNGXuOVy7YfBfrEPLiis33HaHfCsp6wCAybvRew051QmRnQEcMuu3bBqkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTFc8QR234I5rNEHOIn61/RV3xcv8F9EqsBbIWWUCGE=;
 b=VRcggj/RxTjfX70aphYsX2WU7SxMf9nYyJxULwbg6O4QM1foVCb2JaTLFU3lDcr6AekqcHy6pDbFL+fhEQC+Vtr1tdglpWBNqAbtry9L3ZPVwlmPpTo+/OxDlZUYBNNRQSdtqu5hJZcI6fQqE+mtSCYVt0w/sL1bFJqiQeM0LWI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:57:07 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:57:07 +0000
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
Subject: [PATCH v6 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
Date:   Wed, 17 Mar 2021 11:42:43 +0800
Message-Id: <1615952569-4711-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d01ddfbf-714c-46f4-e449-08d8e8f8bbb9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6141BDE06B2C7B28819E3EB4986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LT4L8HLRfqybUTU8UknpujOyojcPo1oclpSQiVHYVo0eZHBlzhQ/1X+Qyxq+c6G3eBJSSKKwWMZl5JqZ7WI25MuDgmyY4UtWm9Rxfl7bOlyXkcXfwcShF3xi6SpS4KJ8QTegj29jcL9DPI0ptbOZzdCFHOtdxdl7AyH+bGlFFOd0EMSKXDKUyt+T01M7Qxi1/6k4YCERqbspUSI/gB7iN3Jv42sSBd1A4Dsk4ZSCvpW8xcxELTSFLCHv2mpgCVdZg9t/lXCRrBGusFkPd8QRNREhfIKVDZn1KL+WURqTPgMxRJkXRgyq1+Jutg/WWDG5InUb8n5sv3y2atfX52n6GYe1bQQfeC9tUK1m5HG0PntJhh9fuBb2sWvOM+qepUd1Lois2/xSFoPYlPnKnUgUl9knfrTmM0C5wJk5laTVSK7pTWVQkDFqbiqvn4QBNAUyIeF9bDYNYuRqbB4/p0XDVXujc1a/cIGxI/5J77Em675pToT9rOCesjfQQs58ipZysF2ck91ZhSdfajD9u/T/OGSTwmUCwum37hnpJIiB1gzsoiddnEWTGYDg8gP7XEAjxvNV5KC+enwjkTKT/ZiWgBBWuGrK6xnjKd8rkFucdBVNfET4GNJgOTafIUA04Veo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(966005)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2pSeFRVMS96RE1icDlDTkRLcms3TkVjNVBRWG5LWXRPdHhHTHJVVHFQWXoz?=
 =?utf-8?B?cEttbmdJai9LSURPU29aQ2c4ZURPQ05BR2JZL29kbEFFdmVhdTBLNEMwc0NM?=
 =?utf-8?B?Nk1XbU1TdG56aHNZeVhPR01WMXgvQUNlU3Q0VGdacWxhMW5DR2dncCt0T2pr?=
 =?utf-8?B?Tms2OVBiMy8rVW9hNDR6NzVNSkJneXRCUXY2VTFqUThjWHdqYnBraXZ2NFRE?=
 =?utf-8?B?RlVqK3VZd3RPWDR1VUNBMS9uQjlyYThFU1R2Snp2VDdPbi84NDZLOUFhRjdz?=
 =?utf-8?B?R242eFh0cUxDTHE3Zmg1L2JMVVVsVjBZVFcrMGhGVjVJVkg2MmtGd3NiN0JU?=
 =?utf-8?B?SEVSaGZKR3NNc0RESkRFN08ydVgrZUNweHBsdmxCSE9MbEpDcURCYVdYb09T?=
 =?utf-8?B?enRqT0luZllBM0x2VSs5ZWRFMkp0SHNQT0djd0wwTDJacWVoblhjOFZaMUJy?=
 =?utf-8?B?VG1uek52U1lkN2dIZGowN3V4L1NmRTRsdHVKWm5nbFpZWHE4N052dTVDOEdh?=
 =?utf-8?B?QUJoRjhvUUUyOE1FVW5ndHhXeDZldjFnRC9JbDZwR0tiR3NtV0NudExZNDk1?=
 =?utf-8?B?SWpaMUtIcVhuYmljbGhLTllTL3BxaUkxaElRb3dISlhuVWpaeHdZcFpJUW91?=
 =?utf-8?B?VWI0LzFTeEYwZ080Nk01YXNSKzV4MnVMRkpHdlBlckV1aWtteWNyWHdTZk51?=
 =?utf-8?B?M1FWWDkzWVd6TTUwQWhvTDZiQ3lzZytHWUdYWlEzdHU1K3pKQ3hPU2RNMGc3?=
 =?utf-8?B?UVJIanJPNXFhck1NSnExMXEvakJuTUlWY2ptQ3czWGhBeXN4bUlvbHFva3dl?=
 =?utf-8?B?V0ZQa082U3ZocUgwNEF2ajBEU3RKT2dXckxWT2xNSVNKdENDYWRTUXQ4YTBS?=
 =?utf-8?B?YkszUEI1SWhBQ25mZnRGQ0xYU0s0MEc5NHZUb0liMWhUZ0dKeUxoSXlUUEVP?=
 =?utf-8?B?Ujl0SVllMENJYU9tWURXQmZpRHVPb0NtR2w5a21xMlVQM1N0aTJwdWIvQnJx?=
 =?utf-8?B?YldyZXNWTjQ2MmpvNmwxRmpnUXNkQVFQajhGcm0yVUcvSC9JS3lNeVZlQXlB?=
 =?utf-8?B?U1ZjN3pGTGhXR2YrU2JjL2hUdy9NbktQcFR1MlR2Y0VrM0U4dDZ1UDh5YTQr?=
 =?utf-8?B?aFcrbjlZV3dMTEZpUmQzRFJ5QXg0V2kvNlROdkNFR2JYZHZYV2UrMWZyTjhN?=
 =?utf-8?B?aTJXcmRJalIrSXRZS2xtQU03RXprTlV1RndMZmxLYXNkOHArTGIxbE9lc3h4?=
 =?utf-8?B?UmMzYjBWTzFzaEhBc1dHaVZORjl5NlZLZEtXY0FLcW1wazdPSE1ucnRaVmJl?=
 =?utf-8?B?enFqeUo1M0V6d3RVejY3REVJQWMvREFYYmRGMFE3QUEzK0ZpL0x2amRvNWpo?=
 =?utf-8?B?TmhUd0xwR1p2VzloT3c4dyswcm5DeCtwYXJTV2prMU0wNDl0Y3JQalBFY1RE?=
 =?utf-8?B?a2xIYmttdWR2a1N3VjlBd201Y21kS1FiMzFBVzVyQVhwT0xRc3VBclgzWXN5?=
 =?utf-8?B?TWdtaWI0SSs0c293UC9kR09MU0lIUmFGZFhmTm9aZ0ZHeHI3U3pnVjBJbkFB?=
 =?utf-8?B?dzRkNWlpajYwdk5mQ2pLY3VQamZVSGRqb0wrL1FNOVZTM0pIMHNKa3QzTDd5?=
 =?utf-8?B?NkJkNVVZa1RDdWRUbUU2VWhmeDI5US9Kb0RicVJkdDNyOFFIMC8zblltK3Fa?=
 =?utf-8?B?Q1Y0UEJsNlBkSkR0NHB2SjRSZG41aThMaDNraDlzcE5Sb0doUGNNOC82Q1F0?=
 =?utf-8?Q?FT4TZgUGJWRlAWdkTo/L60yxreKMnNBVA6LmEOp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01ddfbf-714c-46f4-e449-08d8e8f8bbb9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:57:07.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3R8egXubhupK0HD06S40MoIrQLDa3lEXaA173HNbcz6Tz7+GY6B/fm9gqYOtwxx0ORW+PxzO5gFX+P7omDNNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

