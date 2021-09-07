Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11814402659
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242706AbhIGJvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:51:03 -0400
Received: from mail-eopbgr30048.outbound.protection.outlook.com ([40.107.3.48]:10118
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242579AbhIGJvA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:51:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D27jMK18wpMl2+aKMIRtg77AoOZxuZqKFTb3ll47tgwpcGrfIf9CThCuUz+TaDSQc+iKXgEESAMUkn9hITuqfTd+4t3cf87fs4QGmvniezlguBnTrSjbRLWkkABK3Akp0oI8RkNHrhjY3krXdoE8IUWH8MXa31WTeG7joaTz3d/eXvkMdwR6RVbbxSu//7vgIBOGLbjQcAkppNnSEHruSq2mBnrRqw70c2v84DcfEc+KKFIpby1YPIzw3N5CGQKrbYCOMw+pfPuMWMh5u1g+fQTjLrSB9fqFmAcuclNHaG7r3vCAXCGwKDb8UJiObyeDR6rtfu9BSPc0lhmdOWk+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lCsLyNx8KxNDa53eOKDWrQuPJ0XhRG1kLKTAdMUIF/4=;
 b=bZefYs4TH9DlM9H2K1IpICegxK0ReXFetToWF/I7Xt/SO90L7oDxzI19S+5H0BCpmJXwkBtdmdZMx23w9pmSjMbC4zCBvj3oWhNExhabegcP8aioT/S5wN2jmKBnGxVb2HEQDxCUezUe4XzDNfAu7k+ON8pNSfHElug1poN/O5vU1bEMImkY88AzeoiCL22cjEBrPslsyVGqz4y3zGsn2G2dzYPm8a+pQ8fYMOU2hP8tOeZLPXr/aAYIXccpJGl5pplxzwaOrxdTuPiF4JF9EcoGwTETPHlyGaspVzGMH8vCGtXX5psHLtheJQ/tqQaDp798EngD1XNord+J1x0kGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCsLyNx8KxNDa53eOKDWrQuPJ0XhRG1kLKTAdMUIF/4=;
 b=ljEjBIWfCDO487yr5h6dCXbmcFnUTUm9IBtFxuROcvlamzq2ndEFFeZ0jfyYnttKiY8Ig46djP++rmkm3OWetNitpFzcRe+311NgbV9s4GILys2m2bMWprTMUfYvbkmIc0mJJAX0NCMBKDo0MNrzIDiSeOCk9Y3GRNNmi6c4/yI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 09:49:52 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:49:52 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 01/15] dt-bindings: media: amphion: add amphion video codec bindings
Date:   Tue,  7 Sep 2021 17:49:08 +0800
Message-Id: <40ecffa8bcb7197b7bf0212ccf04e0698345596f.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:49:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c37f08d-45b3-4911-01af-08d971e4d6b6
X-MS-TrafficTypeDiagnostic: AS8PR04MB7767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7767C98C1347CD2B081099CDE7D39@AS8PR04MB7767.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDhfPLWgMAVuA+EmUWq4iZmVzonpq3U48iucrYjvuYWclCXGJw9jy3OeCnVCjb11m1g19Qy9uMabP6WI3w1syhESmPadzPWEB4btmstOidPwo14gIF0zcjVcPlao4U0amMvhbwzw6IbLC+yy9iTgtSgTn5nA94FQSYvV6TtxzbN4v9mzcONweDBrtVw3QB2aikjRNup5E9urIBqPvaLrEATVxY1U1BWOY8AK1orJZbIjeEVdknjOJ/68NLh2S6FNl6NilIty1jJDfdlRT3fyL/wGbBodyuQGi7Fcqw+ghu3Uj3Yu8Kd9UnXMYUmGHPCT9kuOqWuDVpUTeA+H5LhXp9UyidFuytiEc4OAhfJ4vsR/KkLwqtbIuRrrGcV49QKMRai6bUF28U/FY/2ZruH/8+PNfCZdwI7/oyAm/OPfalOTDWitN3fiHLFiABErFU4rVcrvf8QZE8/AwVqy49/n15CpOJAGyuKj88/WIzgD0yiV8SqOsNHmUXvEdy0UfsDjC05/nsbcZwZdS9VMEArrJiMdEBiSrSFBUmkJ4Ppvnk5lGLyU9dwmpigWZ6uzw/QFpyYncqn4Gp8tHhymNm9vUtqb7InFyCsEMB42vQ2J8aSir66hEM9034zm7HzL1TBa8XTCd/LCWqM/PFaErGKrY03YoOCt4sMRm7YyoEipZrjykOchsZsM5/vs4LK9jne2UjQ/85y8VF3ChEemlwLJuux5ijQzcX6yvmDRAfF1X9IQt6VBTGyitgvEngkmCYDR1yibB0CrHpY+sDHrwo9Z6R8g25jRgnt6JEuUNj7dlW+Uet0nYUeSYermnYh4qsoGeIW1/7uKoMX/XZd8C0aYuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(4326008)(186003)(86362001)(7416002)(316002)(8936002)(478600001)(8676002)(6666004)(36756003)(966005)(44832011)(83380400001)(2616005)(956004)(38100700002)(2906002)(38350700002)(26005)(52116002)(66476007)(66556008)(6486002)(5660300002)(7696005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+OsAUvKXUSwDrAx8O86S9e9P/T/SceKssypJNW+km0mggW2tAUDrVVEBZ4HS?=
 =?us-ascii?Q?MGKV/3+DameBTxXaTdlT1ZFYQ3kQ8j3CXJwLFw2QLFny3alzCPEmD/CWyxTW?=
 =?us-ascii?Q?NT5QQGdcXoPU6YhX4Qql0W173hX7Mmy0LOwPhen2vJTsXZRHfIilgc+cCDMp?=
 =?us-ascii?Q?ZPJZ4hAj8ltCs/TjikpoRxnxiBzjxFUKc8jK0Lf28X8yg+OGQ550uJDo28BT?=
 =?us-ascii?Q?EPIP7F4qTnFPMd3okOCgiLUmA/7fzzpI4quHY6Dt7nH9l+BqtzwFH60FyRTx?=
 =?us-ascii?Q?5hWh1wfJV8ITmFpzOfDUBk/jswTMt9WA2UdnA9tUbsN6977og8BVsF+49iBF?=
 =?us-ascii?Q?shsbpLjdo/zK7VNv5Fc8KMyvAS40OI8z1RjraTKzNkInitsRzm0uO4iKwd8r?=
 =?us-ascii?Q?2Tfp3Q/AoBv/uFm7scnfYMB5LPSigjPq0MjoO62uxlFFe1ksvhIwfM+JIeny?=
 =?us-ascii?Q?0mgbSZQsn8SGcLA3/NkQ51RkMn3EJC5W3eKLTgm5SAVUiopWU/tT3IJiKw+u?=
 =?us-ascii?Q?22EU9ZCZsAF00rr/1jsi+9vdN6Xw3TuiicgRY69HFKmmZbHpcIiiIeGFlhqH?=
 =?us-ascii?Q?vELy/Y7N/QIM0lDszbtlnXq6EeMblAVW/zybPfTrzekkhV6APojXP2gkjR3+?=
 =?us-ascii?Q?xlyHrPHxlAnPuh3KomxyeYgTwh21NpFpyOZSJ6T1XRYQqPWPGtB4HpyJXvc4?=
 =?us-ascii?Q?4VD3CqlWn+h/P1p3j8Y1WVWG9nqEywzNC+xHHHj/bVQqhK+Ra+O2jObElnMq?=
 =?us-ascii?Q?mNk1SHaXkxRWOIoIhdJoQ216PnrEbds8oc+VBTaO3DRptNaT0zmWAU7Znp+u?=
 =?us-ascii?Q?vDbe7bDTR5iL8NTdm7PH60siptpfC3zUklryEZ28kAiwyeN4QqdNn6LXE3e6?=
 =?us-ascii?Q?QtlV24DfkSWjMCMrTsUUaOcCAXfvbteNrMlSPHODOoAlmsMRtAOWCdq+QsZt?=
 =?us-ascii?Q?QibNwlOQjk5ru6EyxFnCo86v215+K0mrG1oJb8j7c36w1VdMGDYvMt0BGXgj?=
 =?us-ascii?Q?p9lgNy0LvopxOc53NsY12VVuOFIQEXeB1BYgjebWse1tqNtbR3cdBrImfXU8?=
 =?us-ascii?Q?VXpLuDUH27T05zAFyaYRsh19SzhpwcTQqHYyKGZPee4+Z+pd34ErN6yhDlBu?=
 =?us-ascii?Q?oKNslco3ARccNYqwFgK0TZgDh+mZhHhZaKAEpbXSlcuueSr//vFl7dv0dYOG?=
 =?us-ascii?Q?KayFLg8JxgsOaK+b9t83jnM3H0tR07WDDjHGxJ9dFRs/Lgyy+yx2tFYqpuKK?=
 =?us-ascii?Q?uqdKYzHT9JmsEfW6AScYh34WRGc1SoqqtzgVlC64IgROTudgOS7E8678uzqD?=
 =?us-ascii?Q?HsLwX58UX6zVGeo5NVZvB+sS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c37f08d-45b3-4911-01af-08d971e4d6b6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:49:52.0079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SL7ib70wS3MjoIn5zr1/tfonEcdbk+O6c+YYxwHn/JleOFMtqwjHmRO0XsXT0J1aZwwLO9QDlHVLK1y9Yyh9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
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
2.32.0

