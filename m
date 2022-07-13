Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA799573E9D
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 23:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237356AbiGMVME (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 17:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237347AbiGMVMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 17:12:00 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB5B33412;
        Wed, 13 Jul 2022 14:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdBpo7kxgVtlxlxf07c+5sFu6ydyRLckrfZ40dmwyEnA/uVxv2d7y8NpU/nRgdQQtVEoWbDVc4EyPckB1vrVeAnVcgOhuxjH0sIhwGsWY/2LvHwtMkE4Rf0I8po71ojftWZ/H1TZQMb3AbqPh5SfvSC+5Myo05TLB1xjqnit/VUTL4XHpwmHXRoCNJmo0QjCmeBPQTXRAdISJWzCdrxfoqMdA/U4jJsPLPAfi9HPeC7F11LXkVSQmCTnDDNevPzSoa9P+JuOk4OtnxH0j1ea2VjOGTAc0l0l3DjhuCYk/L7znIOAT89YwvczGAmaGdTJIxVqdZ6HiMXD5FEotcSfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMkngJh0bpkLUQJek7tkMX0t7mASgAcmSByCfPSzdF8=;
 b=ZJXlWtZ7Ol68J1fiiTbCZsfIxhOrHLzrFbB+KuGM400GHR8iCKgj1x077em0dzq/uIeaQguVNtKBzvPd/6oN3zpjXXVbGDNmfnU/ipvCoT29tkNqpLKHFtckIpd6BCS5kBRqkclppYV+kPL3kw3QG9Jr3dntjWcyhhjeBc2g37cFlW+RilBIMiDVefbRDanWGcLgZ5OwVcRIZBTcMWitD2CQ9iY+lOcBYwng3UX6lV/iSXL1fHjlBmB05LtyW1NfsNT0N/MIdlaj1hLj1w8UiT6TIqEiHw225FuF81qExtEFa2E/SAa/rTGj7wnQTTAXCVSdshYcPgl+KVdjosBkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMkngJh0bpkLUQJek7tkMX0t7mASgAcmSByCfPSzdF8=;
 b=UnUwZtZKTk27WvQ7296FgRAdWzX6e2KrAufDUN5OP8WVj19UMBRPxcAA+8NI5s/wQFtBOR/euky2HaPPk0Lg5fGIo7vUrMle0CK4CAZfaFAo9zo5OX5NcOYqlV0jUCBvL2IlEAW3AW6mk2SUfDVkbFL8dOHGCMWVJia2jZvWrN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:11:56 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 21:11:56 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 4/6] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Wed, 13 Jul 2022 23:11:22 +0200
Message-Id: <20220713211124.2677275-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
References: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71e90b25-f7cf-4169-aad3-08da65145112
X-MS-TrafficTypeDiagnostic: AM9PR04MB8874:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4a51LlZnFdC8YB8vB5+sK7ISfB0a6rSdQYaA6aecHnDoUIujXPaiXhsz8vmTWG1HoUGnv3K/tDq5hdUydoN07b0JRbcvJtCAw0hL15IjVelWW29X4B+L3X+ZMqNHjMLTy/8kbHAvG8hucFuCmd7mBQIRHDp+7Sy+gzpj7qzwg5yPy422m+vTSXAMX19FC02LIYT3YUBrhRSdEU2g+aub7pMjANUSsjEAkza0ZN3hVLfj+gve/RHu1kxbu0jNPx+q7muGmPt007d7xtYbb7R/59aGnBvE2u7wLurd+vCvjbaVEz/ZFW0G7I3HcsfeQqCBHeKTa0jtdTjmZ7OUA7oTuogVc5ENrGiiqum4CQ2E4EeaEVyhHMrJe69Xow77PnTi0zUy8dyggfo7zUQ5oM77KXVQHLUWdTe3i65ec2W3rccbUx7/UsnlrUAwnOdYTYnW7UeAW5yG5OMLywKCjvgaQVdSkA4pht1ad7jE4WGev+EJZ01XECMQ8+AzjH3oYyDqhWNF4yxfO1yVG+jZmhNSqj2TOxM3cGwFmaskoBsnYVSh035XwCdHK3RAJYVNr9NOdQUHhFFlo6Ifdqj1AvBvK6lQS+JvXDA1KQVPLfoUEYMIHcdTjnCEw3op/s5w0yESNbnArZu1HoFF9mihEL21cSA/FJcgOuk53paJeYEyScz6UH69Sa2QV0jljvryd+HWQNVf/Ha6JXnZV4kjI53aRouDM8pc+hhe6kaRh9/807u4ZVKns+kKyvkiaIvD0W+wVfACSuSa/EZ3OysvlF3qn2Br1oLlVqz0ZMo58Wm1LU1x1imfnJjKuxzq3qsXXRFGEfCXgNfqkk0LcMVg8ODy2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(41300700001)(8936002)(44832011)(7416002)(186003)(83380400001)(5660300002)(2906002)(6486002)(6666004)(966005)(38100700002)(4326008)(478600001)(316002)(52116002)(66556008)(66476007)(54906003)(8676002)(6506007)(66946007)(2616005)(6512007)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvkS/dIeaoKSmJYV78RanV832BL9RjVuDbbypVip+Qldufa8s3+V/kCri2nL?=
 =?us-ascii?Q?gTU/8rpF+bBYDfLZCwU4FTICwxaJ9R34zurrkkNfg/0A5g6UqJjHRhlbEyOG?=
 =?us-ascii?Q?EgukA2te8ww/Eoc1/6YU5hpsps60zomaWavzh48BGsLjLAW+S8EtN29/yJ6k?=
 =?us-ascii?Q?37WvkX6NTrh/fkboLUxiXerqk/TSm9k3tYkKKnI/XVqASDur1R5rfEwqf6u/?=
 =?us-ascii?Q?I6ObAttHhQqkXdmh4VG3laxDIk86vYwKED5qZalARI2lm7JoGIthrez0wa4D?=
 =?us-ascii?Q?8umvSlJICVuYHdi22FfY7sW0xRVd0pmPlm6qxMbW5O2TThED5fbBDZv4dQaO?=
 =?us-ascii?Q?f96O9JMI3HmlVCN77bGEOCOz6fFM72p1z318/C4ulkpUyDGMK6EEDndSe/KS?=
 =?us-ascii?Q?QG1Vb1pqe7L69LkETbeGBPnzUWG5RbtxjyxNcAMbGs97o6lPg7rpD8KdfKye?=
 =?us-ascii?Q?9+5kGsIxkstqMZzve1rvVVeeLUY2XnLfQvBGdujDKi28pQPePFouQgHkE1sW?=
 =?us-ascii?Q?i6l/ILdN2TSV7zjRGJ03hwHYNxp0MZIdE0iBytihUSmgIvldvvIiSwaBzk/E?=
 =?us-ascii?Q?kv/Fwz+SfsGCzZ8TyUA2KYdpl1B5fpOmZ9YjEEl8JbQtJc7PBNKcmXvViV4N?=
 =?us-ascii?Q?4+odS485hmdSfGOAvAzGUBC1xq9IcXn6g4+uxD3LGEiHM8ydAdJKbcogVP0Y?=
 =?us-ascii?Q?Y+TXwMp7eF6XZ829Yq1AKkDFR5yI8m/lReaNEgQJmkODoRU55jqWDxyZshvf?=
 =?us-ascii?Q?lh8ZOkyHbeM5LrZOkKXADpXK7W2d8RG0arClD+CMkNn9O1VSQf9j2EbhQMG1?=
 =?us-ascii?Q?sB8jwaLF57MsLihzqG5A485tAdAt/qmVub7qO5emfhks8OJTkpp2UPzCH9ja?=
 =?us-ascii?Q?SS90ekBVgsl+AcW1vyw8jVpQjB5GSnMfC/tS7VbnDJ/BZcGcT6O+XsbcPZyg?=
 =?us-ascii?Q?1KxKkFsmjouJcp9ejDVJYNErkicuEl4hKUaX6cCIhz/6sksfv0uiVZXv7Rkc?=
 =?us-ascii?Q?HokQ7/CWefwdPiQkYh35BKNrjzP3YcQW2g2r4xca1TH/GrjPGXYkUF+I3VvY?=
 =?us-ascii?Q?sdnzuQM0t4YXg+9ZZl9ZgTiDrlD/250bZ6sw0wdFvjS4hQ1RCWRveaD3q209?=
 =?us-ascii?Q?3UBUA6McBT20uOwnvwzgGBHQVpuzkPkHU9q4Ja8TEZxnlrbu3BaF28RtqrLb?=
 =?us-ascii?Q?zeH2+s36QYx1Rrfj6FMurQpQxogedD/5kULY2p/iSbPVwh7nwGIDW8drz71I?=
 =?us-ascii?Q?0XO4f39iBT4RMNmdH/WEXIGCXUtyU3fZ+UmcZY396FgYvRE3lM3HkzMkdqXs?=
 =?us-ascii?Q?X+Eso/vLNbtzyqCxLssKbj5puLJCj2ULqThlQGqWTrWZKVoUQmtElJsHBRKM?=
 =?us-ascii?Q?Vr+2HLQutSEUKRif8ml30vpzfQEDzUb9ccBIXfqfES5IJ3BVlnnNvhKdtl61?=
 =?us-ascii?Q?gUMK70Cd9Mlp1SN7evP/YP0COiHn0RmzsmpwHjnoLL68+K3hf1ts98KPFqDL?=
 =?us-ascii?Q?8QQD5OvUpU7RctvdUVvD3G2UbjEP30W+YB0PU7j9AHHIqZKaDqI4eOk0ORmM?=
 =?us-ascii?Q?2/pokdwUcVTXhsUXRJCCmgOMCBFKqqk4l0y8l0iYIgt83b1hK4+Hh5a55R87?=
 =?us-ascii?Q?M3nVTeWLTGQpOI7OKfM0GXrzwgCssU6GALdJaOIgYzah93+Edz7nvyNkWUjf?=
 =?us-ascii?Q?yjP/jw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e90b25-f7cf-4169-aad3-08da65145112
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:11:56.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mcxIIKbGwqZkmpsB1h2JImgR7B3LKtwXpSwScLL2E/Odlwz4sWkxeJCGOhtxIbPesVBDVyr3utB3Wnm7Dd+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
new file mode 100644
index 000000000000..21910ff0e1c3
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
+      - nxp,imx8mp-dw100
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
+            compatible = "nxp,imx8mp-dw100";
+            reg = <0x32e30000 0x10000>;
+            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            clock-names = "axi", "ahb";
+            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+    };
-- 
2.36.1

