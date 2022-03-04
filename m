Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EB14CDF6E
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 22:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiCDU3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 15:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiCDU3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 15:29:48 -0500
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40049.outbound.protection.outlook.com [40.107.4.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3E81400E;
        Fri,  4 Mar 2022 12:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXUFkux/vxPxfM2WIRfH1InCy+CuNOu9bvjsYGchVYRqKLmPSka1ylJR2sCHHbKJBoBKP7xzQLjW7eSuTVFhG8xpl72QrIgsfaXBC4Cbsl2A8wjUFesyKODUOhTA12t+5EwM7DG0jaxyEzlMFYl49UITikuH1gT0HijnRBt9RBXXRGl2PVw6Zv2krY/LQ3T/ObBNAPfC1mv4H+UW/VCMAxXt6LuQFYJivgTIW9R/M97588sTiZFJ8XdKk02ftA4xS3UMsOXgSUY1TRtu25bJDs58CLl6o81l6qOMQTEgb4nMwjso6Nu1dJ27dz9cWMxBVHv8/XH/Iz4UkJbbYRjuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KitOMtJQaT0DFxOwixtXGyidL5NissuQdsBDE70UbEI=;
 b=Ue9LBSQACEBZVp37Epmhv78VQpONJQ9nxTiD8RuBkEQAdEZDqIWt7wIOJlCC3e/vtnr67gV+sGpVVcrsM/aWT3wo7948+6NMAPsnclg7OQDojVFjV57DYdNw+rmTrkE0MNdNfM69HC7NR8+SI2ZHernU0uFfyrGSLPLkh+TYKrJrk5Q9X3WZn+DCOBBDOSmI0rAClwdcn0q3YLN6HCCbOLEPuVwusYaIs6+xc+GHnugF2cBwveU4yy5+bIP5Jl77bZCzXJsMN8pfLXPkUQhznxrz1cxobv4XrkhSruAiqNNEyxJL49+YZnxkwovBZsw9cjotywbkyKR8mcamY7jpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KitOMtJQaT0DFxOwixtXGyidL5NissuQdsBDE70UbEI=;
 b=XYUP3zvmxqJQCtoNVatPouh0xT2xspqVCZpYyM11+07Q/JgKXliAn0+DFz1+emwCe10U15Oklp1zI93bKU+UcRO289KuyEDKIs7xyEflbK7JvdE9jf6ksR7WWoWLoF6MNXBX86ZwTN7eCEygX8bnzkdauJgAxabNorUItRuOqFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by HE1PR0402MB3498.eurprd04.prod.outlook.com (2603:10a6:7:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 20:28:48 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 20:28:48 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Fri,  4 Mar 2022 21:28:11 +0100
Message-Id: <20220304202813.2560202-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
References: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ca9d4c2-d465-4701-bdb0-08d9fe1d9635
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3498:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <HE1PR0402MB3498FD73B9206428FB28D722BA059@HE1PR0402MB3498.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3E6RsSZbPmnPC3XdjpXS6DG7dzT0JInuquniat0qsUbIIaoImdyqlh89E6CKvVx9S3IXoxReBYGE9DZBcvPMtq+vL4DwLop9ssJ5hyKUW6pVKPx4YYmP7+df8ZHYOnv2m8xyuPlhtDmAVqRet/dJK45QBhYk4Ai8hwzTVzArRwvBsM41T9q+g9O3TODedkYdWZGJJjh9hpvbU/dEduwiEQmfwSOaPqnP4lJT8L3yXxcVpUuUbuRSylQxJE5cDytjQCT4YicGaQFPTA9gIgq8Ztsz268/aIH07KPQ9/Y529L5W8DivlK+3Ww+ub3Vop7QwAVhw9yd4IfOXlhMa8C8pMpwDQ3ioJiAiB7ATX3CWbcZyFsVE6IsqBpXozAr9LZmdC0gaDLy1mkgABXNQHM69z8UYORjEdsx3w4IyMeQ7TfrMGxYj/jhJjKfFnAMJakiFe3zVUZfNUVqvdAlWk9fMqpsFzp9ykCyMv/vHXOwZT2lX+53PKfehAtfRvN2EeLBBpKHnQRwRWb/M0v9+JaAaw6Tcfiw710sNeKw4dyKK6COpKTf0rg1ByXPPioQDUFdJB56Rws/EVySldLkZ8oIT0e+Ael2vgoV3DvkwNl2jOfP0ZEXUYHxSFanVBz3RrG0kazdWNwyl5oHblPAiT5MwWWwsw/Ks+zrNZtGDmjOiOPcgPcguBNx//K73DD2DTJrls0ljAbbiFFZ9N+sQPaTj45e9xHWWufEYitGNfPenqVpYLLGemgFK5qyNQwtFcVlrrh/ZPAjnpqivVKQDlVaqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(966005)(6486002)(1076003)(8936002)(38100700002)(86362001)(5660300002)(44832011)(498600001)(66476007)(66556008)(66946007)(83380400001)(6506007)(6666004)(6512007)(52116002)(2906002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LhLT/JTwDWEG/OTAnKHarq+O/H+xH0YIK5d9lNckwhw3D3X5iAAS9NFQN2fm?=
 =?us-ascii?Q?sR0m83HinJXWADltuU32w4n14Q/M/+8TO5bTPCj66/3tmL0wXrwnW6z2IyvR?=
 =?us-ascii?Q?Wod6AU/XpWSAeYhz7h+XhJM5HleSUwkNtb8mRPK3iJOYCgcVfikYT31QQ7GE?=
 =?us-ascii?Q?wrAy+pl1HM268LHxE0v+vWx4El6F70p3M7QcgO/y3iyQxMpQGxh5+HpGP8G2?=
 =?us-ascii?Q?6XYux3ybuzn3I9P0vxRhtYE58xwtCD2Yq6IrhBntE8+azP+V4jkyzHXgAE8+?=
 =?us-ascii?Q?JHgcpxo0fKE1tUg7An6/fovbKqB9fOyT2hY4HD9UQmXjrYh6YxYmXbSfCE+z?=
 =?us-ascii?Q?9CG5QlOXfPUoSCC9TjChlupBrPCgEDcnpSGWqdqi9xp/8sN2qbmFEEpBSiEj?=
 =?us-ascii?Q?QMWdV4y8oKC1m+yzmElM1z2bN3jVThhPWBYA02yQInAASFt7skEqXK45WArV?=
 =?us-ascii?Q?eVK90zgJRmepriVhTWnprDPA8s4tkaaTxAcNhj92P3HuMeSAdYJ/6YKQ+59U?=
 =?us-ascii?Q?ogX8OpMMcVLYbExv0vS3wLCeP83S267sKIZBvrz+ILPPFp53AojB+Em64XvJ?=
 =?us-ascii?Q?2plWQSaH0rXn3O6LGXiNs3wv2n2DmBvY8vb0UQUpgVTorDutD0Q2JaAjVur2?=
 =?us-ascii?Q?qAgXLrERwS/E3vVH0M8QHIy1ZmPATfnYgM4qdoVaS3qeJPGWktYWVJM0/VD/?=
 =?us-ascii?Q?QtdXbOFONcADKqI6UdI+hlUWn+SJChQifU1fzS3Oezmh1cDm6wIq9+zVZ0ru?=
 =?us-ascii?Q?v1jCoSyiW50ZGH3p6HEpu6mfbZ6NTnq4zKSNI0/t25HZPe3mxxf6zd3YaFXk?=
 =?us-ascii?Q?DABF950UkQ8SsrYNLix3+jToNz2tgX0PkaX51FE+ZkNBlYOFcnhYAilR6A9m?=
 =?us-ascii?Q?5ZIipE+fgzNdKvCbkffSeM7DOHyIm2fAdINhux0yxh9Dnn0L8bPrxImMNcoq?=
 =?us-ascii?Q?BUbz6Ewh2+S1ULkJj7HprdXlKZ3q+o9pHiE3+onVz9oavm12AJPFtkPyv52z?=
 =?us-ascii?Q?FJjYmO9Q9H04UwhnBN6yB0i8QBEQx5nho54WF1emUzz7MQ1tAGQyjKFN+bur?=
 =?us-ascii?Q?O11o0vxBNt4pLiGHlSmr2lkQHKHzyoSZfC+e5ngdQAlgfyd71ajAaYuTu8zO?=
 =?us-ascii?Q?uCv7eSlwN/Yeibm97+wLghScmC3g5gPz43VZnE0KWcqEkYxQpociHg2KKsz7?=
 =?us-ascii?Q?OJvdsJm8GCMwjLJQmL/KVuOgnWb9D2SMaKMllDV6SNhrI+scgo5LzW8oiyQC?=
 =?us-ascii?Q?sc/jfYqERysz9EY4rVGVQ9YUxBx9+UGwESA2AirQoFLo7WkOvcKdO7i/1vtd?=
 =?us-ascii?Q?/PMKbf04E2D7YUzsqVEVENJyhzKHfuVwqE71Z1e8TdBg61J4Gtyhb15H25V+?=
 =?us-ascii?Q?PR+AFQkXUQ+NXEhl09G/5f1lckM5b1dEI3NFC8GERdeIlwSdCXXtKIuf2Vfs?=
 =?us-ascii?Q?5ZGCeBq3N/soChMQzZgsn/wRd9tEymUnQO298XD+3Y0m/c45AnikVcdfqPuH?=
 =?us-ascii?Q?+nEAwb4AMQ8lqNIMUzkzZs7LtXMqhIY+b2i+oVMJ06p9TZXZruvvjoDBb8DP?=
 =?us-ascii?Q?lJNzeHOCd+RSAOIWFbCElIU0e7/HmPtECUQypPEx7GWW9XhJfB5iOQKm/169?=
 =?us-ascii?Q?ZLr30UZ1L6pvtGE2AQS/J8BProDAV93ymNz9gurb+wh4x4sa3yvSppaMWuNo?=
 =?us-ascii?Q?YC/dOrYkCyDpVVHO5bKXlvBFF/M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca9d4c2-d465-4701-bdb0-08d9fe1d9635
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 20:28:47.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6k/MFk6ndW6UOtzaPRbS4nH2wz3KFq8JZwC+Ht3CHX3iktXzzQxoanzyjnbVpIv4f7htDfhcETqJD43fOWykQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3498
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT binding documentation for the Vivante DW100 dewarper engine found
on NXP i.MX8MP SoC

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 .../devicetree/bindings/media/nxp,dw100.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
new file mode 100644
index 000000000000..0cea4bb03c5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,dw100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MP DW100 Dewarper core
+
+maintainers:
+  - Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+
+description: |-
+  The Dewarp Engine provides high-performance dewarp processing for the
+  correction of the distortion that is introduced in images produced by fisheye
+  and wide angle lenses. It is implemented with a line/tile-cache based
+  architecture. With configurable address mapping look up tables and per tile
+  processing, it successfully generates a corrected output image.
+  The engine can be used to perform scaling, cropping and pixel format
+  conversion.
+
+properties:
+  compatible:
+    enum:
+      - nxp,dw100
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: The AXI clock
+      - description: The AHB clock
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    dewarp: dwe@32e30000 {
+            compatible = "nxp,dw100";
+            reg = <0x32e30000 0x10000>;
+            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            clock-names = "axi", "ahb";
+            assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            assigned-clock-rates = <500000000>, <200000000>;
+            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+    };
-- 
2.35.1

