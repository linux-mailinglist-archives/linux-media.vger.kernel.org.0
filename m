Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C4D74CC7E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 07:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjGJF73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 01:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGJF71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 01:59:27 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681E6F9;
        Sun,  9 Jul 2023 22:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY4vi/brJ11ZcbOCVjgZzwD20vgVrgh8KULWLmUYtnKuTC2UzdwBxjWwUqZuXMvXsC83H94GXxuA0sY6P3BnWuykIRp98eBTY1DXm3lpFTd7K7CnHWnt46zaKhwsU14akTknSPtatC0q74M3x6mEGrTm0qEPhsOeHoLP/vWtvE2g9CyTFLDujY4Kxt/MkE5wuURalYbMiWlysmwShpgIR0yeOyKX58n6fdd2sbn/+7oT46eZBvEgzQD4mKSb8Aa2HWyE+uoziGODhbdQt10+MEhaSrINmaWARY3jiQgWMSDe23S+QU2JX7dqOHiv3BEfFLSv0bd6OkYPN7KAtYw6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWFnKYYTy1y+Qc612vf+Cqce2/xEyOymyGGbphevdoc=;
 b=d5he1L7XINBT8YCqc4R1c+j3IMN8zyRYRkCMo9VTnE8nTm06cMlNSfC+CuiNaC5958c8Pp++d06G/KNLoUHwXI9P3ZE1Eeha0yi7qkijduLqC2sjLMe9E+GrpMk5Do7W81yOHnCi9jgXFrScLvCIPtg/JKCZgeQ++Z5ammE8K+En+DYTJibLrjXaxymPJELE5rGKeePCzOF6sVx5Ow3pXmz1xtMOZKnusct07xLPxYiyyTQev3f2ig2pBEztQ0GGZ1wMo5JaUuiUXr/x3Rkd3V8Wb51Bw8UH7Q8AA8KoAPG8M1nIAYHVcDzx3dhL/wxG3fityvPkWxlC04sxA0804w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWFnKYYTy1y+Qc612vf+Cqce2/xEyOymyGGbphevdoc=;
 b=dFg3ibv3zzd3vLgjSnk71cqa5xRSk+nPo5GBupyo3YlVUirVHtHmS5aZwMd0st/Vi6KzGfhTiEBuGDXAPXZvdR6BzynyxAeDPknX6rkbkqEXmx7k7sHWuIC1Ht2TO+CBBo8RzuLI2tElfUR/DaJM4rANSNVM+j3KrxGybI5gAIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 05:59:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6811:d7ba:d425:1d70]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6811:d7ba:d425:1d70%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 05:59:24 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        alexander.stein@ew.tq-group.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI CSI-2
Date:   Mon, 10 Jul 2023 14:03:51 +0800
Message-Id: <20230710060352.584286-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
References: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 010d8f07-bf10-458e-da81-08db810acfc2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFB0GXYcRyQI8ZaGSHg3+KuRi8jJ3MnI5cUDquPiP8HSGiWQv2borugc7umjShs3OSZMkYeizk14lMCLNL6sqzFxQWLbXbvWxd3z5OGddtal6EaFFHlT9PbyBIFm66Lt5LpBXiq1BvK3g66tLFt+VIBLFwCzpHOA2xchP2QYrxMiqpV/lSQ1/Rnc/ZcRujnlyxa1mwCQnAOVr5SySgA2nV8g9NOaljUHMUk2Dw4iVWF5KIgUyJc/FKAr3fwjBk35GEjzhJduYGDlz5eIHEImkOW2IdWi64WHwiSXXtDVpvzcb/ACbMHP17+XhuG3wTObcPz27Ujc+fwO//4xq4jG0OuDlOzvVMxXggNa4OxH3Da9bebTAkDsGxmlYYjdt+QP/N1X0+CZgtjMU59ih24wdlp+6Hs69iV1w5WrjUeVv80Br/hzjx0ZgRAjnxcSgCU9QvmviiEYszAKiiECCZzO5BLGiOs1P64Ru0uLdmmSfOosQN56c58/Netw/0dwZxvmFdh6Bca1hFb04p/F+flH02X8qYKMXKc/8TLakaLZBqkDvNgxtzL1kkqk5VkD9n/Ef1/vEz2f789fFqHDq/3Ln/kqFenNePjzRHO5CmrJvZtMeTk8xLJA9hWO3fBBFO50meXTcU/uRUaI8YzwnI69hQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(26005)(186003)(9686003)(6506007)(1076003)(2616005)(966005)(6512007)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(66476007)(5660300002)(8676002)(8936002)(478600001)(66946007)(6486002)(52116002)(6666004)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HNfldaXVGfD5ptnz4vPIGEv7XztC+uFG+QmnlsDOhRFQ+YQaW09xDTKo2oZ7?=
 =?us-ascii?Q?fpuUQUfsZ9GPbUEGBRz5kyWVBsISP089Nt2+Vq8r6zqSixsrmBY5xy9L9BiT?=
 =?us-ascii?Q?vR6eYoEgoZMNZWVfE3m9wTvHKD0ZaxXrzrc79bC8eA/6rEOE2u3yENeJC7Dm?=
 =?us-ascii?Q?szhyEmy689W/7NUAR1r+u+JRRW/n1HCJgq6AOqvKcg4/LTUkEl/eqqjLI8JI?=
 =?us-ascii?Q?V4IefOpEWDHn6aF8QsMhD9I/JjMKiG+DIgj0a748s3VJJDvDZCOkTEhEPAPi?=
 =?us-ascii?Q?cuZbCEnWPGzvLnb22hiEXUdsMK034XXjUxs4LQr8RKZQyd6/MKnx9admy56j?=
 =?us-ascii?Q?w1k+QACZyll01LWJ7gBR6SsKB78+Is35saO1Q0vdBZYCPWvXevllFXxAea0k?=
 =?us-ascii?Q?htdRGzTFfpBGC4ujpAGKQ+kcFimxT44owpUiPhF/wtXULTqbMsvaEci45sR1?=
 =?us-ascii?Q?RN/qTB38RKP9fCqXgSB28w7Od76hIZ8SORhHTBBuN8vlTGruepcZsi+44ioN?=
 =?us-ascii?Q?J+VO0XP8PCOqqXRYLYz6KBV2Gzs7g+4fxT2w0trwh34Dy5Kj/jHdLnD/DV09?=
 =?us-ascii?Q?ygakeUrTQUPt66+lh/z0HmY5nSp1mbo6gN3Cw7+753T0N3kMQFuBhsEb33T0?=
 =?us-ascii?Q?ch0YJOr2h9IGzFU4M9SPRQAz8PkgsOC0M+sqv6OlRUdGt3ikB1OHmvg4seud?=
 =?us-ascii?Q?BlpB3snagKjj7Fy8vEiDQ/GgdKQkGHF417ot961UxQVC3e19zLSX96ToqNff?=
 =?us-ascii?Q?UdmhJoDULICH3amIiZg7K9AHgRscoD8d3MzOjVBHHElh0nxRdNNL9VnpCkPu?=
 =?us-ascii?Q?AWuQhluXKhXSkE8LwwBkHx4dPA4hN7SKs1TaklkLSXO/bc7bRfP82wB22qHF?=
 =?us-ascii?Q?dFZU8bZgmPT4OJy91bWIDJU4UbLE6jYdjpOtm8dqFul5zHHc17Bs+xDi2MK8?=
 =?us-ascii?Q?eSo1W8mvpToelv/AUKHVSPSkZuM5qvRgbQfPreAjMYzjJq3RfROKLLz/ciCD?=
 =?us-ascii?Q?6eQnqq05ymWSMGTu4uT5PP5WMsINlV0/nR31J0JpE+hFNKV/p52WoQAoTY3J?=
 =?us-ascii?Q?9N7uqNGbmPKzntu6tRnoQ6Bw2rPLHAtwepZSNzORUf3MWuhLMOBukIeFkJKF?=
 =?us-ascii?Q?/T8OXJgnUTXxA+eYJI9GoNBec6GCLPyLk0fVlpaiLcamARV19vwoMZ1ckp3f?=
 =?us-ascii?Q?mrNPEubd+ZFK4eVCA/L6/fKcu0BbmrAtwrh6aukXhpt6Z0IiAP9+HAN7j7Fy?=
 =?us-ascii?Q?4tp9nVk3f6/g6YIPkZ/ekwwQlCiMXsfUhELIdSfIZjrYkJ2Mn4lZOvvNhh6X?=
 =?us-ascii?Q?bQkgbrkVxKH0tKjlmhBvHEkNnqlpuNgt0dROAUkLlVHDSOcNMqGsLOuzfDIF?=
 =?us-ascii?Q?VG0iKHyu3Ay36vMqtRLctrx1HDpj+FC5NIEpUSgorDO0DX6IgNdlYggz87WU?=
 =?us-ascii?Q?Q+rXno7HD9rWJGZZzo10inMMnMf4SDOZOfWW+xTEuYTaKlS995ek03Lobunu?=
 =?us-ascii?Q?b+0y24cu5r1074gCOSSEY34c8nnCLe+hQT+wHQq/fti9/WAbSW5+qywClBsM?=
 =?us-ascii?Q?fEGF1NBiZ4mTgw034Kng6nXp+DGBClsSsmO3UFp8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010d8f07-bf10-458e-da81-08db810acfc2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 05:59:24.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaqCrHIDodPcXMO9t1GVNCfZ7AUXWN3g78Pky6rVEdp8wXOAFXHk8l626TlBnyXRHBu6WjRgpWrT1ifKxBE8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
 .../bindings/media/nxp,dwc-mipi-csi2.yaml     | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
new file mode 100644
index 000000000000..aa5d79ada9b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
@@ -0,0 +1,130 @@
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
+            required:
+              - data-lanes
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

