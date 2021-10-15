Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931DF42EC0E
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhJOIZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 04:25:46 -0400
Received: from mail-eopbgr10081.outbound.protection.outlook.com ([40.107.1.81]:53721
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237013AbhJOIZU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 04:25:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnOOzIYDgJ7aR6zIW7dN5kcd5AzxlPpdAgj7fNSewXZYaRQy/YnG0cXbzT2p7qUMEVLU9jiUkG3ARnE8p3BkcSfGhADjkV+/Ts8cYIrWuZWgLx14jFBZzV0Rv+xVxm3Cn6re8vVVM5iQ/LkLUfgYsH1wVS1PIR0s37hE0y+6Wo/DCLWrefUvCLKV7GPNz1GL58Wg3HqyAnmwrRQcRAATDJndtFLruY3GZtCGyz5XQwglIIg6/e6hybRf6sC/jUpCv8W4lWL/GGOZkxUOiAEZpcK3e/sscjlRrYwjkJNNtc4A76s/WDBbvj8JnjLlHKai8tVJuxAY+FzgIoBpNOV+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hya/3bWzj54cTNXLhUWYF9C9ssgciYXjOVJTTdcei+0=;
 b=VfPNrWngPbNqr5h1Dy8CvWaEmlGacZV5p5eJ7AHTpT8yfWIpmKw5yMrikLpnlEpVyBtWnod+RcIexmEJPvDIOm7PluIOVLjOIwFAPlS7BcU6dqmlV95k6jzOTKzNP/hznfQ6TsQTFnqRYq+tymvmJ+Uku/cbaHtTtE0yQuK60KpP+uSw3dwnwOYkA6K3aqAyvIfPDPQXhCohKIrckn5n/2COpmtdYTwxTbTLnYD/+nR8C9HLZD1Swsn08ujcFiiaOuBiMjFQcEvY7ivAehRUABtWD6bZCNw7NcRdViCLNqRJwe6K9b4gTcyhc9F9YTQ/AnIE9jzJu8D0oB3gXsndXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hya/3bWzj54cTNXLhUWYF9C9ssgciYXjOVJTTdcei+0=;
 b=SY+LxAcy+o9V/egPe7Vbwxrbz9vXaV1DaL6lXmlEVv36ciJGt+pitqGtUh1lyY05fqUQCDVMGOLnHKmiy8KYYFUhURSrCc4dYHDPogTuAGzjmXujEBCHGopICdqMpBne/8OkOf/VCCKVureXLoDgFfjWiCcsm3lHofkPiyQFbng=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5750.eurprd04.prod.outlook.com (2603:10a6:20b:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 08:22:53 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:22:53 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 01/13] dt-bindings: media: amphion: add amphion video codec bindings
Date:   Fri, 15 Oct 2021 16:21:50 +0800
Message-Id: <74554b65b3776c1dffb738e37e3fc15d17b37b6a.1634282966.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634282966.git.ming.qian@nxp.com>
References: <cover.1634282966.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:22:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaaaa159-24aa-43b9-e347-08d98fb4fbbe
X-MS-TrafficTypeDiagnostic: AM6PR04MB5750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB57504E0F274D7253DCB18680E7B99@AM6PR04MB5750.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3k5dT9D3Tb+4oEVKWp9MmluEBnJSdk+UX73OJ3TnReK4jeThFYekmh2WmkHX4OvKoskNwZhzhsz35aOd8rJGVUuH0V9tJTVDnPrENUJnOQLKQqZUZT21ti8VdgHLdA7N6RfME9VtWrJ96Jry8Kzo4vuKSVt3pMlYnlWextXhhaEr6+u2ZITjp8ujUltQnK8tj/oEWdxqnRfKsGwl3GnLG1hBOcKH4rt9t9oUS+OrZ5PYTLDfOSjwCZq6zOnZmm2GbyIfw9+YRxbXrJ/BDUtgTwfqKceqXiKfWlYnPy9gRnPrxfdSDaG++oBUm1OQr4tJQu4ANrZv7Tb8fcEv60wBZCys28LbxzhlnpEKCMW4gwzuM8a4PXSl8DdeCWR5moRO3367xDB/4G1VRh5hb12NdWp59qb/bqjCNOySoFSChQrmpqpKsywQjAyqBLu90wZjZ05z2kvYY2OtfX9zczr6DKNBe0bZYcIZuIIIrHtPxEi58MqR2rZRU2BWUTcMrvTcKU41zEwEL2LP/vT+LCZM/YODfCPsY6tylcAyY9DkB2MEXFxEjB9RFsfKFh4W0p04X+LslrtA1J08ndU+Er2dQmHOcvGg26GkCpNyRzlLuNq3ztc0DxCd1CQmDAJdD+nEGhHAVdYXrRl3ND5+BKuH/w9hxKy1ywPMmUE+zdLqcoNJTpIQQHFs4gXBpNTV6PEaixyvS3c2Wqku+8JMDyhmRw835M1rdEVsoIgoXWts3a5lVyk4wT5DAtOWpyLHqYVk6aobKZGKRLf9uKt2LCKtBDzrnHoQfqRKtErLBxSNBOsecOTGDYRyKxQbbQy4VUxYAC5dfeLA/CPb3aapSFCuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(66476007)(6666004)(7696005)(316002)(26005)(66946007)(2906002)(4326008)(508600001)(966005)(8936002)(2616005)(38100700002)(5660300002)(44832011)(36756003)(956004)(83380400001)(7416002)(86362001)(52116002)(38350700002)(8676002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yApiFLoGCWcoNy7z/bAr++vEUURS8bDE4T4HdNhB7ZKuASwADLRYN8pMnvaD?=
 =?us-ascii?Q?UvET0L8X6IhkL0QzXlES1yRV2l+4G+xufBCeB+51Uk8wV2NfAJCyDdy9JrFd?=
 =?us-ascii?Q?hwpH6IMJB7g6ONeKr3umIgHnWwYQoTXxwXr5h3oPIkoUz+4GV2bmAg47XBHd?=
 =?us-ascii?Q?SzjPKAce3Yo6PJzoTpRlkx2pc0CAldEXfsyxEC7R/NIb8PnXKkzlblGYop4x?=
 =?us-ascii?Q?XHEujA1inWiHVD5eWCGUa2BZtTngUZQhv7+b+FwPKtzFRVQDx4qsuv5Xsg09?=
 =?us-ascii?Q?0e11GO9CBvTplm2UVywV98AMLvxlGn3x8qfezV31N+Sv5q2HFu44UWkFMe0u?=
 =?us-ascii?Q?Xlj5MKl9nGdaP+zMHT9/z07pjJhXgw+P1U/tHGmjEiMYNyZSUh/yKpUK1jgu?=
 =?us-ascii?Q?e0FFgHX6MzM6pkBnKz4QqktBTFoFStF7Dxzh6tmt4AOaOLnEIKoUpFbWNdTX?=
 =?us-ascii?Q?HUpusfgW9DnjWz83biML0hB67d6sp0RtaD8AmGBNsECk9kNf3TloytsHUs+d?=
 =?us-ascii?Q?yw7yK1er7snJ3fmvb3+9hw+IQJMVIcUAHp8lVBj4KXGnvxSXCDWaz6ADQyUa?=
 =?us-ascii?Q?vFgwYJOlUeTGOPucvvagQD1uI1EtcTY8mHSq9+XadBC4PlW8UwIqBD1UKeUV?=
 =?us-ascii?Q?sm3DGWPT8RaRMVQsRAbNjwGyo8ZGc1vGG5y9hX6h315hG5myRtclJo59DH47?=
 =?us-ascii?Q?LFDjb49sZel9TZHw8iuNE6GtgVfdak/rdC4lg8UjiRqjlxgLWd9iXMxZbIQv?=
 =?us-ascii?Q?r58i3MEyKWQ/NwRVM0jVg3/gseDciwl2Wke7R665+/dpVGOIqJpe60ew2ec3?=
 =?us-ascii?Q?VEVWdVqmBoI+XP5zGV4FFPz3X+iTkQn/xdILGc8/thtUYs1jXPfXd/KKKapz?=
 =?us-ascii?Q?ho6tOCd8uBxM1GqcmP1IK7QTw8MunCUNfy5B9e2QRdYk9c624M67ikhafX07?=
 =?us-ascii?Q?6rkHghZGgwfIyZ3j5QO8djA4e3W/ZtvTrSqFSME7+GxuSrIcYwohZeqP1E6I?=
 =?us-ascii?Q?h1jWcYyFrM5jYDoW1SLVb8+Z9PitPvkcD3FrGl+InXZACNVu5ay+vgPmeexh?=
 =?us-ascii?Q?LiIXLvoPTY2lLJZ4LVZYsFwtX4lpnGDkn297FMevQxp8Lm2N0yLSVOIj6tAR?=
 =?us-ascii?Q?xO5MqAa4kmmpEWee+tVU77nE4s9akQtAqR3FA5+PE+oIcI8NINaDZwRnZk8E?=
 =?us-ascii?Q?5zm1g4JS3BN467lAAOZ5RQwSNy22sIzivrgg1sTRQOQ3jZ2C5fB+qtnNxjHn?=
 =?us-ascii?Q?VHNo7uqXWuQe+d8fpnBb13Pq/p3KjHTH7HTeUYuoCahbG6J4H/Tu+kh7F81o?=
 =?us-ascii?Q?64vSRZ+EsDqX8e6kzS23wNHD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaaaa159-24aa-43b9-e347-08d98fb4fbbe
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:22:53.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjeqKcrQZjDitbBy4TjCGPFty8Pt5VytFAEYttJbUCoFHKql5dtiXOxDSVAzE2SQdMQvI5BmgbTV+B0fZ/320A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5750
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for amphion
Video Processing Unit IP presents on NXP i.MX8Q

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amphion,vpu.yaml           | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
new file mode 100644
index 000000000000..a9d80eaeeeb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amphion VPU codec IP
+
+maintainers:
+  - Ming Qian <ming.qian@nxp.com>
+  - Shijie Qin <shijie.qin@nxp.com>
+
+description: |-
+  The Amphion MXC video encoder(Windsor) and decoder(Malone) accelerators present
+  on NXP i.MX8Q SoCs.
+
+properties:
+  $nodename:
+    pattern: "^vpu@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - nxp,imx8qm-vpu
+          - nxp,imx8qxp-vpu
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^mailbox@[0-9a-f]+$":
+    description:
+      Each vpu encoder or decoder correspond a MU, which used for communication
+      between driver and firmware. Implement via mailbox on driver.
+    $ref: ../mailbox/fsl,mu.yaml#
+
+
+  "^vpu_core@[0-9a-f]+$":
+    description:
+      Each core correspond a decoder or encoder, need to configure them
+      separately. NXP i.MX8QM SoC has one decoder and two encoder, i.MX8QXP SoC
+      has one decoder and one encoder.
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nxp,imx8q-vpu-decoder
+              - nxp,imx8q-vpu-encoder
+
+      reg:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      mbox-names:
+        items:
+          - const: tx0
+          - const: tx1
+          - const: rx
+
+      mboxes:
+        description:
+          List of phandle of 2 MU channels for tx, 1 MU channel for rx.
+        maxItems: 3
+
+      memory-region:
+        description:
+          Phandle to the reserved memory nodes to be associated with the
+          remoteproc device. The reserved memory nodes should be carveout nodes,
+          and should be defined as per the bindings in
+          Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+        items:
+          - description: region reserved for firmware image sections.
+          - description: region used for RPC shared memory between firmware and
+                         driver.
+
+    required:
+      - compatible
+      - reg
+      - power-domains
+      - mbox-names
+      - mboxes
+      - memory-region
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  # Device node example for i.MX8QM platform:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    vpu: vpu@2c000000 {
+      compatible = "nxp,imx8qm-vpu";
+      ranges = <0x2c000000 0x2c000000 0x2000000>;
+      reg = <0x2c000000 0x1000000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      power-domains = <&pd IMX_SC_R_VPU>;
+
+      mu_m0: mailbox@2d000000 {
+        compatible = "fsl,imx6sx-mu";
+        reg = <0x2d000000 0x20000>;
+        interrupts = <0 472 4>;
+        #mbox-cells = <2>;
+        power-domains = <&pd IMX_SC_R_VPU_MU_0>;
+      };
+
+      mu1_m0: mailbox@2d020000 {
+        compatible = "fsl,imx6sx-mu";
+        reg = <0x2d020000 0x20000>;
+        interrupts = <0 473 4>;
+        #mbox-cells = <2>;
+        power-domains = <&pd IMX_SC_R_VPU_MU_1>;
+      };
+
+      mu2_m0: mailbox@2d040000 {
+        compatible = "fsl,imx6sx-mu";
+        reg = <0x2d040000 0x20000>;
+        interrupts = <0 474 4>;
+        #mbox-cells = <2>;
+        power-domains = <&pd IMX_SC_R_VPU_MU_2>;
+      };
+
+      vpu_core0: vpu_core@2d080000 {
+        compatible = "nxp,imx8q-vpu-decoder";
+        reg = <0x2d080000 0x10000>;
+        power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu_m0 0 0>,
+                 <&mu_m0 0 1>,
+                 <&mu_m0 1 0>;
+        memory-region = <&decoder_boot>, <&decoder_rpc>;
+      };
+
+      vpu_core1: vpu_core@2d090000 {
+        compatible = "nxp,imx8q-vpu-encoder";
+        reg = <0x2d090000 0x10000>;
+        power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu1_m0 0 0>,
+                 <&mu1_m0 0 1>,
+                 <&mu1_m0 1 0>;
+        memory-region = <&encoder1_boot>, <&encoder1_rpc>;
+      };
+
+      vpu_core2: vpu_core@2d0a0000 {
+        reg = <0x2d0a0000 0x10000>;
+        compatible = "nxp,imx8q-vpu-encoder";
+        power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu2_m0 0 0>,
+                 <&mu2_m0 0 1>,
+                 <&mu2_m0 1 0>;
+        memory-region = <&encoder2_boot>, <&encoder2_rpc>;
+      };
+    };
+
+...
-- 
2.33.0

