Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D61745B2E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 13:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjGCLdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 07:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjGCLdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 07:33:10 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ECEE3;
        Mon,  3 Jul 2023 04:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/xKZpqp/7P2NXmaLVQ1f7dJ+/mhQr9yih/9IdlfR7gXehWcLiT4mz4FeusXNEjf3oRG14xiaQzQr1kkAS2C9gVE9Guq81P+NY7kEZGa7l7aQlISWCBdacWDkifbs//aG76lIr0Fy+ezj4/xosU65AdWHd/He9xcuEWqTFsryxc5QmIiBdxnJ5u1rtfzq8kdzSQ2oPJJZ33+Fupglc0U1W17u8P499WfCrzZeaDvSjY8yJmx4WFO4F7Q5c4x2crkMwnqpzfV7YBFw/3TGRlsPOi8zISyhAjuEAAwWceJe+nF33SlhBhFypb/eqV5nAT19+/252ALHkiWx++l9wFvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xgyMPVsrUNmCUnqnyfm4nRUP7AIHR6xg2R6FvJ0vew=;
 b=NlgTr1T2mwmehjyj3MXE+t+QnmsyJr8iX6gfukl/Vl2Dxgz+CrLiPSNyhl9PHZ7UNC7N4SGstVU4jAaeziJAn9sob0FL5+ETNlbQcSBGMTw0SIKyeN9HE3nhxbv1UVD45mG0dbbzThxyj51ra2NWk3e2X8bUHsYuvShv+Yq8e52nXh63+VZEs/yswnxvonSG3LkpwHtd7eLPtn80Ld9Wc/iQTaDqKgLCxAd3BE9myKa1ezxlMLdPKsGBqFrOYrssRVVNqKP1AqETF7O7Ka6pebhu40LPvvG+FCdeJ/Ur2xGMw+IKYe5KOgsK67Sz3rD7xjoseIsR4i3SlmKyuY6EZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xgyMPVsrUNmCUnqnyfm4nRUP7AIHR6xg2R6FvJ0vew=;
 b=kQVtWxM+m8mriXpmbvOduhSl5Fy2aBm4jZYMeAscNtEuq1ssoFItq+nJBqjnQA5hXthAaRFfUfYKCTAHnlXimlI0mCvXLi9YiWacns0xiBKNlNY2V4J717Bkmr+IxT02wOixDIEF0roPTNxMDXwz6EdXIGxqUzFBjoB/fjJ/PZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:33:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 11:33:04 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jacopo.mondi@ideasonboard.com
Subject: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI CSI-2
Date:   Mon,  3 Jul 2023 19:37:33 +0800
Message-Id: <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 87849eb3-f91d-495a-db9c-08db7bb9439f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ee5b1VzZAJufoo3BVXlSA0mu/RAbA3J0LEI+2hTREOWr2et7Kh6nb4eUsxmUOwB0ujpens5UK/C3tUmbEqRxhqaYg4SmR4/r0h0UTB6j8xBjzzciGXKuI3e6vGGQstXr9JihKnOAFCNscD3e1uUlUSKamUiQgN/w3zcV9zFL+oC72Tk/89w04ogOam6IRqHtz8vv9z6elZ9z8CeSajbWnxMftDKAKX0fuWS6Ht3CRVDcrtSIEk8IwWhI/pBs5MLMvw9v3CUQDZnfqoz0OHG8TsnrDwptpDnYJI1m/et/JY/xEeVvGrXhGcRbsfp7wYfpN+8jzFS44p2tzE8TNxvav4JJAawx5zIPrZfxL8LivsUxkgwtAtLQ17KdweDdGx2V5zOy0eNVPLlHhWIfJYBI/tGYd6f2d4KhZ/YPzvktbQOXD0E7hhvfVgzCFKCJNhEwOTFxOnFHr9HvBf+kE0vQpIovE0C6Q2bUwPXkJTlD4etXoCjPsj/cwE5s+RLRQdQ09+D2+WdK46g+llV0AJEXzDPEPtbO8I/RHn9b1ozBniPIdPOs3bmUFcUJ+i3FniQWN/6ocr2bfJtQ0GRvRtN39ila5oLEmBD0duG7SMV7Gac=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(26005)(478600001)(1076003)(9686003)(6666004)(6512007)(966005)(6506007)(86362001)(2616005)(186003)(38350700002)(38100700002)(66556008)(66946007)(66476007)(4326008)(83380400001)(52116002)(6486002)(316002)(5660300002)(8676002)(8936002)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pczmHIb2r9P8zwF4n23W7+4Govme/R8HONZIW68jG7yFQLr949zuforUnD+g?=
 =?us-ascii?Q?TOC7/uNMULfixReBpzrvGlDebBJxTigOeBvnhU7on0QjY8zIaTHra1kAlDjM?=
 =?us-ascii?Q?f6aAG8UpIZ9aPFkyOw4KKcyU15e19gF5TdJ27q0cug3GJaPs/0efE/R+f9C+?=
 =?us-ascii?Q?nynrij82xJsJZ9BSCmcaz4OUUHBxTUEiGk3uOQgoisgxUT3125L47OKzYUUf?=
 =?us-ascii?Q?DIiytLhvWNscLdZIa4YMDlso2wPsxAI2ehHgegriXFs3ft0H28r0/KA/ZdBQ?=
 =?us-ascii?Q?GVWKBGrAQopLRzAgBwh7390s7hOxN36+E34bEolBgsia5MF/yMJ9slZ+pfmS?=
 =?us-ascii?Q?73PwNH0mLIbGu19r5iuynDn7a/Fi22Q71WHegHzW0IuCtekdTc9B0cssaKq6?=
 =?us-ascii?Q?MRvYv9KmMJlqA1ROqrBlyW8uLWpIiQQgSsAmYwSMfzHOULz2G4671bU4cX6L?=
 =?us-ascii?Q?vGCGC1Rll2zAkOgPd7jwaOAp99wTq9IcbaPT7k6MdOPYzXIXyCh+UNsAe8Sv?=
 =?us-ascii?Q?86Ppb2SFF9+LtOt2A388gpu2R6e2FfCxLLowt8X0o6x0M9C7kd/mxL1RTYR+?=
 =?us-ascii?Q?u7PYfCPbFZ2+txvEfO8EPc2sDYGl5Nb4Fd+IpoZhOChxRvALd07n95ZJmq/6?=
 =?us-ascii?Q?oK/Kr+Qu6+3c4/ns92vfxBPf6+Z8UFJGCSfPqjhaNu1eb1DgzrmwHOe42gGz?=
 =?us-ascii?Q?7pf2ylM40Rj9jv46HnNmsDU0+Oc5WbNVOR+4yhdj+EIsud1aM3BkjpgJkzQP?=
 =?us-ascii?Q?0GrxUuYk7WGGdejohr+DQJyMhDiWdDJifTX956cMGAldq3YRmd5moiCh3WMR?=
 =?us-ascii?Q?nIsvc3vKwB0w1etKEwkG1X0TVTnrCLOxayY0giAl/Ugd0JeO5u+d5mdRF7mN?=
 =?us-ascii?Q?XKe2OpiszcgFmPK2U+sodUuKv4zUSstSNrmtLob4t5FAAJ2kAMMV1TBvopRk?=
 =?us-ascii?Q?PI6dzGLLHGi0OdD1lTsZ4BJ5iowLaqe8p8uqzXxEgqSxpeN/13ULrV788EKw?=
 =?us-ascii?Q?ADsfXlVnQSX/1VMD8JZ3MiMszTz2cxCFTxoGa1TNZ50RYbAEsutkrxNUVoLy?=
 =?us-ascii?Q?QXFRi11zwRL/Mq3UFDrvD+UShX1lMNW4WnPuCp5FQBHW5J5F+DGDOQNPTXa+?=
 =?us-ascii?Q?NWi1vO2iY4ZtvQPZVPZeXmGmHP8UJR1lZYIVqlidfX4wfhW/PGvjl+vyJ9+K?=
 =?us-ascii?Q?FUE9KbFoNe/vw6rVklvKRSHAGMN7EWm27FOEhA2XscW67WIYXHXoQPsB3IP3?=
 =?us-ascii?Q?Bxw3CAmyqkzW5/ceWIpzeIQacOhxWfxZ42JfF6GwrqY+4LDfJvcN9ox2zR22?=
 =?us-ascii?Q?3sTG79PEnptk45/ITJxk/pJ6BzI4R4O4OcPRg7NVYe0GeFEhannMw/XTG2Hf?=
 =?us-ascii?Q?gN/mdZ/s1mzlYl2S9D4c5nWTo3hgJToCXCoMm9qWcXI1KOPdYuW25AiC/Y9Q?=
 =?us-ascii?Q?diTXOkH0iUEESSO8bxaUfA+cJMbpiY20nkI/JdbgNq7EZVD4qROhk7fEb/us?=
 =?us-ascii?Q?kk7qm1bdR59Re2Bbfl1ab2x8xeA8lyXxzwWoQNf20MTZSYMga93whz8XVNWq?=
 =?us-ascii?Q?BoyhnswHYaIUH3ZYXhTgCh/Lq176jV7l9dJi5Qbj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87849eb3-f91d-495a-db9c-08db7bb9439f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:33:03.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi3B2DbAGJFy1F1J6VLvf9zsv+dehoa4Tb/g2KRcNJhS6TUfCVs1v3fD+jA6u+7zEi5NUfhVFXtSOlz9rzY22w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add new binding documentation for DesignWare Core MIPI CSI-2 receiver
and DPHY found on NXP i.MX93.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,dwc-mipi-csi2.yaml     | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
new file mode 100644
index 000000000000..ece6fb8991d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,dwc-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX93 MIPI CSI-2 Host Controller receiver
+
+maintainers:
+  - G.N. Zhou <guoniu.zhou@nxp.com>
+
+description: |-
+  The MIPI CSI-2 receiver found on i.MX93 originates from Synopsys
+  DesignWare Core and it implements the CSI-2 protocol on the host
+  side and a DPHY configured as a Slave acts as the physical layer.
+  Two data lanes are supported on i.MX93 family devices and the data
+  rate of each lane support up to 1.5Gbps.
+
+  While the CSI-2 receiver is separate from the MIPI D-PHY IP core,
+  the PHY is completely wrapped by the CSI-2 controller and expose
+  a control interface which only can communicate with CSI-2 controller
+  This binding thus covers both IP cores.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx93-mipi-csi2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The peripheral clock (a.k.a. APB clock)
+      - description: The pixel clock
+      - description: The MIPI D-PHY clock
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+      - const: phy_cfg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the CSI-2 transmitter.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+
+              fsl,hsfreqrange:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                description:
+                  Used to select the desired high speed frequency range
+                  according to data lane bit rate. Please refer to i.MX93
+                  reference manual MIPI CSI-2 DPHY chapter to get a valid
+                  value.
+
+            required:
+              - data-lanes
+              - fsl,hsfreqrange
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    mipi-csi@4ae00000 {
+        compatible = "fsl,imx93-mipi-csi2";
+        reg = <0x4ae00000 0x10000>;
+        interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clks IMX93_CLK_CAM_PIX>,
+                 <&clks IMX93_CLK_MIPI_PHY_CFG>;
+        clock-names = "per", "pixel", "phy_cfg";
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mipi_from_sensor: endpoint {
+                    remote-endpoint = <&ap1302_to_mipi>;
+                    data-lanes = <1 2>;
+                    fsl,hsfreqrange = <0x2c>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mipi_to_isi: endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.37.1

