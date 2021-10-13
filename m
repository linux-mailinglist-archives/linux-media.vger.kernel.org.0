Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9917A42BA40
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238431AbhJMIae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:30:34 -0400
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:9455
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232147AbhJMIac (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:30:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFpK4vpln9vszAuXTN2I2kawjMkoeD20KAgsJndRfv2KyG83Je9dM0TsM3++9j8+J9okX0A22SlMgwLaEdG3pzmHnXpolAZE8fpI1azIJZCann3Uaoot4X7C3/TtgQB8ujgvf91vg3v+JhFDzeVtKlemoEXXKjwb9cCq+fVMjlSv737/L8zxXzBmOSAUKDz04r8qYSz/lDO84zUdLc0NmyohyC370SzsVnzPjDdl38zS2xORTau3+8zvr14KITQ1vLeUxZjGDEhM3GcLC7DE/mHq9hoQGW3CpdE7+tMX7W3UWEkNXcyOztgWAOgvAr8/IWzDRKhpKtOxc0TgQxcxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSQQHTDUrRT6+l/nJvyhfFoNud0yX4rUxscM/7XMGzY=;
 b=KlTun6kexZjYg0Iyy5D0KOZHUAowK6CmqM5d3ZkOBIF61GzPaQ2kWXZfyMKpsd3GzXgbvrXz8+d8P7MDXOEp9H4htiCcvtJn7P9m/i9CApmZVc8VdttRUbuYwSQCYD7wExfuG+rR798q+xhqkDHtA8WGpD6hMR0mLp07r92pw3IxGbluW+R3m9BmESGxsrPw1CpEWhHKG2+1wFnWiBJBGy+bCR7Vl3nFOGhl5CqtU1/qEMk34zLYOUJ7BvS4gVus11AjGjvyNB58Lv63xakIYuDRAHQ7OfDVVZZyd4E6yGaGmBriYM4ET3geCNy5GTreYHAbCHiR3ojmaq/Te20XSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSQQHTDUrRT6+l/nJvyhfFoNud0yX4rUxscM/7XMGzY=;
 b=GlqEFMUz/zkD1hBHShFJpG+qPSsuvRCt+GBl41d82LSfQTFkMio71PmR1oUD2aB0/9F/qDLSRbcY0iiRMeLGSgmrTGn5qyDW31BpG4DJeLdgDJ69nx/A2JzQ3IQckMrket1PfYnn5v9QW+t7ELyaEKLSciSh4r9mnacppe6XbCM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 08:28:27 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:28:27 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 01/13] dt-bindings: media: amphion: add amphion video codec bindings
Date:   Wed, 13 Oct 2021 16:27:17 +0800
Message-Id: <4d5e00bda369a823c55ffcc10863f29179426557.1634095309.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634095309.git.ming.qian@nxp.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR03CA0121.apcprd03.prod.outlook.com (2603:1096:4:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12 via Frontend Transport; Wed, 13 Oct 2021 08:28:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a90857d-dc3c-457a-c81d-08d98e236e1d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB47898E50CF177D99823BF6F4E7B79@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BreZ+7NRkT6OusYsgicSXGmc2H7G7pKjR963K3PRxUueMsucut3sIT/RaAdXPCFbwJvdGDWGm1Q0l42CZKM2EiF3pQIeNDa2OUmp0mprggxr2Xlq0oooJ04507VWlvAOTMOkhuQQw7a3Gm4ycRWVylqagZWsov7yXZou4uvrKDkfD29ZAhYfy7JRe63tiT4c/6cGf3Tzv2Im+GiiNNZdpStJowXRdf1JupVKjOHweRE0awBIvsm426IpzbHiwukYQCdhCSTbhlDoX/yZjCzfoko6Dbjscco/yJM0JEcYFcrMCmtinTAk/r55YT/hNtWMdHTaSK1DyZaregj9rdnHhob+kSZ8xcNj05AhGHzjMJeYz9ffIg8g1hBwuQNMUPTtd4uEoqj5T+QgrsuJFPag8ecdx00B080lrC11ACorosU+kafMmva9UVmUKMENa1INM1nsj6VQc+RVj3n2cgIeAvKBQSwjPAIBwftQ/EIiqceJMnE7uOc2EuQzVRU/svwvUr18PqLN6To+PUZqn3yTElOxOdLJApuhRl9e1cVOxsM6Tt5sDcsJwQ9+/1ODRKq1yBihpgXhg+pX63kf7tIs0Un8oMoKiFnBLltj2TvZ4VWKQrlE1yVh7NRxtNkQX97PcxpzKh3wNdvKMZRv5tGqyjdD4m+eyfeo3brjhf5aMGTumISMJaN1Fwy1NwTMMuZ0tB2pgqz/86AE2OPVssyYEv8enXuoDRqx3zvBS3rEAp2r70hOjX5mFIoJz8Ot3A6JROtT3/xt2sQgAbYlIKic+BikkF6bWCm2LHRYA9qAdjI4yA+B7Tpbq808ytO2UZo53TFDgmbmONoZtK49VuxmUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(83380400001)(186003)(966005)(2616005)(66556008)(66946007)(26005)(956004)(66476007)(6486002)(44832011)(316002)(7696005)(86362001)(6666004)(508600001)(52116002)(8676002)(4326008)(38100700002)(5660300002)(7416002)(38350700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wp0pMe7bZ8IhwzpLq6Fi2Q23KjZDZso//AfKBzkhn2sIR9a4dlUSF0XPVsjk?=
 =?us-ascii?Q?xJvutFgZo57VM1LtbxdtgEV/2DUmUTAC+FZ5pzEHJJdHs02sQNIrRiQZU90p?=
 =?us-ascii?Q?BLf/wxBWSXGvP7+HjL/8dtfXCfJODCkNYLe1gvLgXNL4n9mj0zBXyyUR3W5I?=
 =?us-ascii?Q?IbGro5cHfBoGH68u90O2RcXfVoh577gI3F8mVNcGMeFs56xUOPeTgvMa1kTg?=
 =?us-ascii?Q?q+bbQ/1veozkSslB7z6oVjHsgHnvIJIyWkEgFxPrFqXmx7tJhaGqXwoYo9L/?=
 =?us-ascii?Q?LT0L3BHwdWa1prk2CGA4yPJ4Ivdgj4MIQi1bJ9GGZa4e/c/7bQZ8RUsddGwu?=
 =?us-ascii?Q?l6kBlA9mbj4S4hyNoqiuI9ALCuxql4hdWDP8Y3qGjoWcN/iJHF7KIzjWXiwO?=
 =?us-ascii?Q?v2iV5ZZgV7Kqlu2eNiQn5Trz/CNdEdhjVtlodrXjpwgX8lvzD9yMbvdfxsk2?=
 =?us-ascii?Q?XXBHVmuXluwdVQCM7xedDR8DsF8aRhwv9csx3Ch/nYfkwtnItgcNy6bj9TK4?=
 =?us-ascii?Q?H7ZfybsTT3WoJ+xhjqrlJtlemy5kBBZXCj096jGY4pvNbzeeZ/qeyoxx5bt6?=
 =?us-ascii?Q?uBMFv61l5h6rzmG8NiBsNWmYzakG7fpwx9kTSXNtHzbuPH35aFHo1pwFTTu6?=
 =?us-ascii?Q?qGeRDRqIqVcmDw07U2eQAekWf4kbN2kvRpVQvf/T+Es0+yH2IrgtOF2FELJN?=
 =?us-ascii?Q?fMR7+e/Vcarh5v5qnKwgAym6UsROr47wDKWUTq/poev2hQnGh3ptVLL8+49y?=
 =?us-ascii?Q?Q2K1pIvne1znYelv3Jt8PWlRR+65sGNkrBixbeZn7QakxPl5SsSJjZYDnBIt?=
 =?us-ascii?Q?AErEb0T/ETE7sxZDIlaHLTfqeB7oQrm6buZF6kEMmsiksjFSzdtfvT5qFYyo?=
 =?us-ascii?Q?6fyqmgML4MQZTDIRjt7Qx/quECfySJec1XmOTkQQFm8dmha+jpooPZcpdC8o?=
 =?us-ascii?Q?AbZnP9+enq5UTxiBcjs2naF8Zk7xQkMA2alMw7FikfydSXo4mud3l2u0TEa1?=
 =?us-ascii?Q?LhgLfzTh89Aj5i4rOfvud16Req3mhcfxFuzxVQsmlZ1aSdGU4bfbajIxNvBb?=
 =?us-ascii?Q?MHsnhOtDnVycb/n2oXP8lrIm9jvI++8WcL73MTm9dFGiEFfxY+EC5ObpDl4b?=
 =?us-ascii?Q?mDTNa8+5mXZMCqLw7bbU5tl+kqvbPaIhYVVCMVr+I5/O3jfUmMP8OAc17P2U?=
 =?us-ascii?Q?mfj/vSKY6O6nEhrD7SzRrzG/7k5at8YyzEp/z3UpaXtWsfh7Exemf9lV+d7Z?=
 =?us-ascii?Q?obRh1tzDsCRh0HXX++Tn5yMZaRo0aiaqeILn/5Yy8dG1M4MW2OztenPdTRx+?=
 =?us-ascii?Q?+V8YQtm7FZ1iAFVyHJDl1+5f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a90857d-dc3c-457a-c81d-08d98e236e1d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:28:27.4039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFZVfDzdbSzc58xzCXR6G49exaltaaPT9Mai6JTvW/4AgIvBbBrZs+oUSRkManqjBW4Eb5FvZwSseHytBCntBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789
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
 .../bindings/media/amphion,vpu.yaml           | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
new file mode 100644
index 000000000000..6d06b945bc8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -0,0 +1,178 @@
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
2.33.0

