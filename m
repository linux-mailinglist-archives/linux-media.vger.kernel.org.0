Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD1C4D2085
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349690AbiCHSuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349661AbiCHSuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:12 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EB2532DF;
        Tue,  8 Mar 2022 10:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxuHxdhY1AZ+REkedeKHZUS1m+HzBzR7K8huaCG9ChtajyLRTWw4sJYlEteu39Wif/tfl8xCrqQHxrxPVQFQaTLhyA5umEjO5KLFSqq8aZcY3HzK9Qcvq/zoilSUN//Igu8uuiNk/jRHV4zXFrNo42XTLH/txjJ1wHYdr8a31Oq6+K4srfdSlu9U1NpWQwu30nctHF7MVkg5h4vLjnMedYKFMWiiNM49xjvNWCjl2hz9Gi0xS6IqA5AOdzsyKeZiQvI5aAcZ9opXfV/SB/VisrtBkaLxlbx0Ik7P83Qn5OjcPakoRWjrpQY8IqJRF6kGpIEotsnjwJDBM1A/R6XYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euecBA5KU4JfTB107Tutxzr54jP8p/8G0c6Kiv5g+cQ=;
 b=C/vVJB6N7gbH4HiYae0QVuOvClurV8PnzWBqR7pfHT+bur1DTtY1yP94ggBWyuiiXODFXXJlo3TcHMMJXwCEuxzXifokE4/JggQrBVlvh5ka+n2cfEuZ52/rAIAHjBrwLwKSye78s6q6nOmbh7e4tUjnK/lb1PWIWImPeB5MzxbF3oVyOAENBWTDp6MgaBQA8Xrlq51H3RDblX7zuRCD4pFZFbLlcDpwxfzrbqnyNmlafCrPXeaGuI3XBSXl+Q1JFei36ej0v0SYy4WRxC78+4JbMgjcCdJFDEWm3zwEHg2s/PC2Orz7BolsRd1qRn2Xr6QSAU6w7iiVSmBjjjnrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euecBA5KU4JfTB107Tutxzr54jP8p/8G0c6Kiv5g+cQ=;
 b=H7UNBd5wdfeC4oOyYvh0Tv0tBJiLdgfDhIlTCp0tkV10wQ0muXSWlYEcpPI8zSlcpc+H3LAexjlM9K6BiODbRuQ+TiArzxRNH/F6iGxR2nqMGB6JAJxFiVzgJgZtSHewKdXgJ+/chfQgd77ca8/N89+YNaep4Z5vQsyf/e9Zt5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:06 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:05 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Tue,  8 Mar 2022 19:48:27 +0100
Message-Id: <20220308184829.38242-8-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d409398-1465-4320-8cf3-08da01345245
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB431132D6E06FABE7479C22FCBA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Poe3uRoRYLTOd5EmumeoatREmU+Dn5rACszGsd83j8SevZiiPQ9qNSQgSIIFmOSKwXC+71YkjOI9C2Ugf6xrG93p9alf6vVffu/IsGzxnAp5J3G4Ajnn68VLwCJT3MQWeHryzZR2t0qr+7Jg+TNmXt9VM4R9VBOGi7lJDHKmrynbzpckyiLRdDOJfyS3X63UobUtHbJB+qGzRA1v2SBtdNsshjEvhGQzzRhSVLFXzFr8OrHTCcw5QbR2aYJcH5lNK1QyqHrBjFy1QZXDNAA6vynqZDzglKfR4CrUufSdl2RldRjvv4gP6qiA/spAp8yVTeqaTC30O/3KQYSG2Gz7IG1jRKxTCUxN3Vk9HS6IfbWuVzmmTOWFXezVHGoItbMHdK2t6AUmq6hV4mvdVNctpImqj2xdITTb1I1V1WSC26e18ObceueGEibY609mrfAixlGrZi+fC7tBHu2y5DX8YicI3FPmO0eX19EAtZlMerbLuYNt6Urb9WzvygYDkq4+TlVsIvL8vOe2nBq8Iv285OFymiKqsW+N0qpKJFgNJd2QVgroqm+HeVuN19qyJnJDukw0zSwsE3zX2i27YOsbk8gacwyH6XcpmoUshPwf4PulcJvjtOfwRsCUaIKiyG1OxZfXjqWu8vjqW1RuE5KxE9xK8Jwfoi1bxBb4HEOUUd2IhEDSYQZi2uz4+AxeazirWE95N3KWeSqFaVy4weBTGixQ+qOYP27u6chJ9MSF8fw8fqwJ4iHYHh0xHZAYQ0xLnbx/U2uf8mepjVjWK/HNHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(83380400001)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(966005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yFeMQjcCkrEM4Uw9uQF99uyzCOYTU0+drJI50KHMhvFt3mMlf3s+p5oiNewC?=
 =?us-ascii?Q?vMmsZFMgNrOXRiuvDN4TdzL+Bhl1fwU6l403wi347S5aBpbWxcRBjXbP3LPH?=
 =?us-ascii?Q?eVLcLKivcZtH3cfRlTxXfkbhVBCGaU3pLfdi3pJDoaqHhK9vqztMlsHmiVxT?=
 =?us-ascii?Q?BHnaPMTizZdUXirm+Jh1JO8kr5YdxFg3uhcpmOAk73PJXj05TZCojyFW0IC5?=
 =?us-ascii?Q?ZrZ5oHEHFbfxTBDpQK54EEaiHjJ/bg9Q68zLHpR3MykS+NRKvKAG068+SJnx?=
 =?us-ascii?Q?5sBKeDpciVUMNLb3fxfqk4A2jvo9Pezmb1Nce6T+8HbYTg1xpql37ANO/3A4?=
 =?us-ascii?Q?QsNAl4bXOrgk0UgnkWjJRGIwF90WjPswN1oW93lIMZhm4lkV8VgClpNFUe0F?=
 =?us-ascii?Q?sWRzZpZd4mIjJKk3ir+grTCBa/7B8/mgB6JVI4GzI+v9o31JG8Xr2Q4vzrDr?=
 =?us-ascii?Q?RSsg6v/dX0kkl2GeXGKo1/Meu0S7cJmM2DLPLEC0kDlhz17TJOMJ9GLa3TGi?=
 =?us-ascii?Q?ziCUpdSoElRYNn3zYRhfM1ohvhZmSskHVsHnP8qzBLkJA5XMAvasS09ICfj/?=
 =?us-ascii?Q?+dYTXnhyhLlq6sxMFCZyO5rypC+DxuH5hcOl/YWukcZoRZJ7HORsqWG1uN2z?=
 =?us-ascii?Q?YDa3lDGffGG6Wf8LGXjCKFPoxz4mwH+XVDwN0wVupkgnzMQD9hu+nivUEJwe?=
 =?us-ascii?Q?wJi2dWR3qx5r/btzZ1d0Ol5xL6tZ0UYssSpVeLDDf/zCNDMg9OCQ+qPolMLF?=
 =?us-ascii?Q?W48kZAxKNy2sUXptDfCXhohVjVnMjNWPebFWGAEmOV882wPJ9VXeSAuZyjVn?=
 =?us-ascii?Q?RgGEsF/blvMCS1v75B7ijpwlo/zsmIdYmENEIuM9wPTpoaLIe5523m02GuWy?=
 =?us-ascii?Q?3bTgdqIlUYkVe3SJEDAcTsGOj9SbNISmnAb9iNc+yNdK83p7SHcz0/oppRYt?=
 =?us-ascii?Q?3y/6KtMvXxttpJw8hDzndYc+x/PLAHieJgslF0sTJvA4qDtbhkqGKasxZwfU?=
 =?us-ascii?Q?z8+TljhTscpxm/VOFD7UX+6/27l/5EUCSOcd6MRMgm3KQ5XM60YXKxEAKdAI?=
 =?us-ascii?Q?iYjWUESXz9RM0wGWDwEWDLihW2waGOZrsgRV0MsYyFJMDEc0x+uKAO+Wmnjd?=
 =?us-ascii?Q?GcwCyF0TvcQEhr15pw6DWtJz8IQLd4jUf8h/REIrLZc2DPko/wRZUs/fEIQ7?=
 =?us-ascii?Q?ItkhL14RAH6kz64YjKl0mdyUdgL7rObMu/GvZAH9C6N1isX+602oU90Yx2BP?=
 =?us-ascii?Q?me1PtBHXzYrV+kdrm+ezG2R+MZe3PU7noXnX383kCWx5C+0wNx7hUQ51yy2O?=
 =?us-ascii?Q?peOgJGu6voVMnOa0mfQciIrIhQNoq7g6bQvM7GfnK6r/XDiehtqCkamRBaXh?=
 =?us-ascii?Q?HHjycMJjpVD9f3SBtqtWhZCYQuwM3r8pScgm7o0UuUJjpM2dAz3mMue619Ag?=
 =?us-ascii?Q?/22fmPDB68RW8+OV4IwqOBis1Bk5dI4NFFRp6TElC5r/3jZuSIdOu9+P7/W9?=
 =?us-ascii?Q?57XH7inWFH1qpPNFNfQPuFMhrqbsCO8idZ+wQ4V5RuOzuC8/tPGJfPVXyWDr?=
 =?us-ascii?Q?I873zbCdZLsS7y8FjjxHxngfSVv9ppamjYUYQd/Jt6q/Gt24WaXHUCioi1gZ?=
 =?us-ascii?Q?vS7otyNhZGZ3OdpaXEvfybqqfd+vzxyfILG73nA2GRdi+qPEC2ijdV6eeFWS?=
 =?us-ascii?Q?ZF+xNwUQU2o4l1qOAzpNMqKT/5o=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d409398-1465-4320-8cf3-08da01345245
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:05.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxYzZOVfRIdeKfL6/X6ean0Dox2d2lAVrCh7Z88EGCvrCsSwMZJqNtmMwP9f6Dpxomvy2BYKNgcC94JgC99IIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
new file mode 100644
index 000000000000..2c3b82be0b74
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
@@ -0,0 +1,69 @@
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
+    items:
+      - description: The AXI clock
+      - description: The AHB clock
+
+  clock-names:
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
+                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            clock-names = "axi", "ahb";
+            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+    };
-- 
2.35.1

