Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94BD3D6C7C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbhG0ClK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:41:10 -0400
Received: from mail-eopbgr50075.outbound.protection.outlook.com ([40.107.5.75]:46830
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234797AbhG0ClF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:41:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0Smtg5D6vKZr2ZK50t5l22G1xAefSKnb8xbL/HJ8QeIAq3jQIeXaz4R8BHnlpC+XdB9OMNG6JPExhNiUFioP9b8E6hvimVGU9xoiyEej2pey39y1kEMQc+jgmXw/A3I5y2camMcTZWdyw8RYBfa+DlKUeRei1zeGaG/wT/hj7W86RojVWX5kv7aZoQ/CskdVS5MOINa+GPOEaIWODOOJ8NQHRiOzxsPlETrKBYqCWka0UtpdoiCvsrrdM0NlIh5uOwJ3/CX39QBjpR3wHhanU4iqEC0WCdvl/si/FxuinNieUgRqh4kP/eyRp7mp28GRSJ0wDf2Ls2+nNlNIPvj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu4zpa9IdHvGb+/an1xw2n3e4I6eYyG3bHDl+Ru0DNE=;
 b=QQdljPhc62iZuNUu3p+douCTlw3WBAfswGHaQPkFiQod/hTc8QbBoHt/dR7mcmI79Avcw0f6qCocA3ya4AN19gSjMg/WYzk9i1bYGrAzoxrnoQJckqBcgD3NekDO5hOwKl3MEDMX6u6qsyKEFZnt1y2vKEHS1FYrt9yJo4ilg3kFEsaCc8oYush2GBQE76bTJasLlzp28wTpjBDpwUKS8tlsOL7owBQuDmrVW8Oxp5wE9ir4TFqzb6Lx8a0piiZK+WMNd9IjvFfT99kZqei55LrZgjI+e1SrWytSK69UVaDwdsgHNy/IeiS504GkSzm73/eXH+SjuqtTVGgmIwY8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu4zpa9IdHvGb+/an1xw2n3e4I6eYyG3bHDl+Ru0DNE=;
 b=UV/mbU+InvwxK4cOFi5cU9IhPVj78Z81TlzeA6esbZ0gjZzK1rx8sg5EQb3BbTBsRgi1aC9Xu+N9tQkg8n6cabdnpADs3WKVjNrZ6BL2eFKA/1z8WqJhguiSY1ywfdrksvfYaRixzYoTXMVOe1M+IPoilLu4eRcptYN5yxNlT7A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 03:21:30 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:21:30 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 01/14] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Tue, 27 Jul 2021 11:20:44 +0800
Message-Id: <6ec97ccf157fcad84be33501f0e8f1c90f7e21c6.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627353315.git.ming.qian@nxp.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:21:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 731bc42b-5a9d-4c3f-cd47-08d950ada080
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB26606BB892934A707F50948EE7E99@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/hvJeiFyn65BCx/8k/sou6mqfxWhfMoD//CbJDTMnk0DisD9byu/WfvqejgpoFYFKcxV0GoChtqDCPVgCwaZkHfD0LlUias95ZUUYkvmk2x96tOR26Fv5vREHR5RPell7DUl0ecWqFnYPqDRAQecU7d6OEBeLEBHopHRckc78CoL2HBHH7K5osaI917wD15pcQ/YgROPqs9xTJogXvgAb5j4Z1sEWpVGM1QcBBX1DarZOptkoOGuC+AcOI3Woz5RFula/5mIqFH4LDylFXv1Niw1CBXGrufR/31GYa6+oirdCAxQkh0j1xuwmkHrr5hBrjDHxhYP9IBMOulrSn9FV9wVoINIipVauVGY3i1yf2J5ML99vOulDJ+7FRoGij8kLSkQtWb9cCQgmrQDfud8k1vlp2Ch2HSIUXRx8fXvgYl5i4It6YWueANwTRBOZ/37TWf8njlDtrUMtlinnG0lRQ9Go1G0hJnHD3hKVnDM9cVQin3tzWg42JxLlbjQqCaW/DRK2QqgSBTlHeLLE4ApYplejodhKVdp2U9E0SKe+xEajgDSfl1tR42ymWjgKNOVLxqJMpsLLRdrxxbuiIMWwn6h20uBpQbwiws80oeYtZX9gExXFvSuBwRzdsOMuuEBviJyUiYWCAavfZ+dHTY6CimM4UvWqjVtpPrWaIweRcq+XtO6kxpoPXCr9pmz9g/uLmyYxJKEDye+Fcm6iB7Dt2/U73g3/dmd00+US1yUEcXcOaKjriRTVqssc41lVAOomA9gKe73acj+FM0/OSKJp6rtW/gQz8wff3MhzbZADsjns1LUSOm5sNp6IVmbNTMrMwkcTfGNI5TBpXhq7H0Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(38100700002)(4326008)(7416002)(66556008)(38350700002)(6486002)(8676002)(956004)(186003)(2616005)(66476007)(52116002)(478600001)(7696005)(8936002)(44832011)(86362001)(5660300002)(316002)(6666004)(36756003)(966005)(2906002)(66946007)(26005)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6OxnSYSCh5h3mza9ci95qnNPcPohZ/rE1blGKU/lFfCInjjZGvOzF9SexgmP?=
 =?us-ascii?Q?xvdxKnOxB2BREKFXBb1zlu4hu3/TMQwW7Hl9AcBvo7s79MmYk8MOKgXKRzxs?=
 =?us-ascii?Q?Ke7BlrSk4axzhGDy70h6nkBevRBNf4LsHCAIc0Q9NkkVxoQl4R8L6Fw0P7W6?=
 =?us-ascii?Q?GOTQBaLaIBA4cWkHnGkBv+Q3QOBEoYy3GwIQjZQjNpa6cjorQUcOee2owEOL?=
 =?us-ascii?Q?m3w+/dZLUujGOBJVApHjJjqJ0vofe/XMvpWb+QlQv7sRXPEFjEB4hlJVYTb/?=
 =?us-ascii?Q?Z8CkcvINYUKqMg2AH1XPt1dRekKUz9oaAwVmpr4KQeEbLdSEAWJkFZksPVH8?=
 =?us-ascii?Q?wAZWGVkip7RME6qtkQ7WdCv4pslD4xX/8SyRQYDyldsxOxW43/TcNCKSuX/p?=
 =?us-ascii?Q?ntSZn/uM3gw5d2ect0oPQC1ecOz+/BKW30OLgXBrCDqGTv8MsiIaI6DLsa/F?=
 =?us-ascii?Q?VEZSl5Z2PpyxDBowUbb7QYn43kdxAg1XxZcPumzNNu6XHxRvY/xiihK8Vz3V?=
 =?us-ascii?Q?L4Qa3EqOfvu7Le7+LfcmJzk1LfXC0WxjM8BzD4p97/V/3ezLnpIypi5F6z9m?=
 =?us-ascii?Q?W3YksJnBHzGyiOp0qarkHofo7hOc6ugSY0a+Y99q6eWJg6w1Ok932n4+wmEJ?=
 =?us-ascii?Q?lL+pcAbYFKw4Zv+lNlR7bNDLyAgMdACqrgIQg8XmPgCgD4GnabtmQctK/gxK?=
 =?us-ascii?Q?WNoJmL6LGBWK4xW5xXdu8Hhb+F445eN3L0au95LrOLUN0b5jUrQNy/7O9aVg?=
 =?us-ascii?Q?Q5ogwaRqHSrV+sjevSdkTo9tNUJa2tzMs9bK/9CdjNjxfGqejT81OrFXMDrO?=
 =?us-ascii?Q?glbF54jRP0f61/F9a6xy6fklEAxqrgVKa4/ihaWY3mb+1nWxFyBPu9L8ybz2?=
 =?us-ascii?Q?tI9Vg469kIOemlUL0Zek7K5cYDg/zOrDVaVjZGnH48RM9mh0uBU1Am02m7m4?=
 =?us-ascii?Q?GO8S/wUo/AZuQxYFf8yNYWOiA2ZHpsNGiUggNyi7OOtAZKPqTkp3vtFiu8Ep?=
 =?us-ascii?Q?EYnP62OIKEcDcZg2KtUfaGSpurjEVV7VYDXcFuqTza/aavZmqrNmHzbcG1YZ?=
 =?us-ascii?Q?KX0vu0PvWmSxOV1MAGyRKMRp5qS23OnvqODpQSceAm9pix/Jye2EQ9G7RRhu?=
 =?us-ascii?Q?0yA5RGb+PE55tTmkuBOr2GBfrknzoUHmgA3hnZMpBTpGMaeqLhdsLuwgo2UE?=
 =?us-ascii?Q?C9v4cnbDnD9EUrpQlhk1o1UIpPq5TWNf2oww1qxE3AuQ60Zs0yGdUKWVuhTE?=
 =?us-ascii?Q?2/8nxdxybr0C4QDFzbbLXdq4LNWnRKb2BkMe55SkPkszaDYzl0G4ezBgWr/k?=
 =?us-ascii?Q?ljJ9Uq2aVxV8YmmAl6wRYLit?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731bc42b-5a9d-4c3f-cd47-08d950ada080
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:21:30.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5r2ze7x9MbyeQV1FliqoZ5Y3i1JDRROUWMmjWX75nfWAnZz9+FLRnuRKg/HajJy6iNVvUbSlThYodiqnJoSWPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for IMX8Q Video Processing Unit IP

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8q-vpu.yaml         | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
new file mode 100644
index 000000000000..04a040e5a9d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx8q-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8Q video encode and decode accelerators
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
+    oneOf:
+      - const: nxp,imx8qm-vpu
+      - const: nxp,imx8qxp-vpu
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
+        oneOf:
+          - const: nxp,imx8q-vpu-decoder
+          - const: nxp,imx8q-vpu-encoder
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
2.32.0

