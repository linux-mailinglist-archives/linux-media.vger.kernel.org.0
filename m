Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092874087CA
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238480AbhIMJNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:13:09 -0400
Received: from mail-eopbgr50060.outbound.protection.outlook.com ([40.107.5.60]:29525
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238415AbhIMJNG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:13:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5LugU41N02lwvjm/Mmbz/m3qto32k8BwIyOQaWhCZNi8/2bWnmcVT/7vkzPfgk/RVVejLXaRCbzi37IS+T3p6BsMqviJENVwPVnn6+tPktY6sBiLKGim0SHGV/ztRIwSNZ8nOGhdjTUrhwK5og9f+L5q/fnKPTdOTUjq9jjK69qfkNsiI6sJx5EjqyDWG25+wcCvCRIFWiExL72SHNts+f836osPOafvRJi3ZFfECtEzTzuhwHZvSvSOpivBRHNQUQblAbrgIHrT03AO2BF2LNLK0R9ITWAVXWmhy7QxdkNTt2DlQMkZfyJiyjBeZC5qV3/b68/+Dy75o66W7hqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lCsLyNx8KxNDa53eOKDWrQuPJ0XhRG1kLKTAdMUIF/4=;
 b=lDQ2LxW97VVnEYjaDJm1OP4Wt1IMseelbOBQrHFreU/aYP0f1TfOnVa9IqyAO1P4YK75EncFj/4c1l+JukauLzY5thL7oGCkk+AVjfdSn+rF/uVl0LbAJJg3OFlbAHBgFqqLCX52yHo0LsKVTv5Pevn2o/XMRdI/ckR05cmg3WnazoIIlCVF6Et5mYHje8vCw5mF7Z46VMG8Kn/zGRxrpE1NiBbIv6GmUe/CUcf1n1xxiYNFTqLqz63u9C9JPOcjGjQGO4m1QcplZFEuLcXWKTpSG/WzkHPw9eij7HdCTwxwvgoGazKYUMkroCtpD22HCENcsMTvFpEZR8ULjRkd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCsLyNx8KxNDa53eOKDWrQuPJ0XhRG1kLKTAdMUIF/4=;
 b=lmulyp0O/MDj5dt9iaCC3RJn0iFp4B443l8JqojP7s2z1n7MuypAuO+dj7dza0ocDy3ybOJ9VxeyFdv735e83E9VTojSgwYPnOH+umQTMuJQV3hZ9EXbK2zWsIkD/LKKx5lv65uvN9U+lo9HmxvZZiWYFlIkRFPms9XgXI9+YBA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6134.eurprd04.prod.outlook.com (2603:10a6:20b:b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:11:48 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:11:48 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 01/13] dt-bindings: media: amphion: add amphion video codec bindings
Date:   Mon, 13 Sep 2021 17:11:03 +0800
Message-Id: <40ecffa8bcb7197b7bf0212ccf04e0698345596f.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:11:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6daed78-c085-45f8-9bbb-08d9769683d3
X-MS-TrafficTypeDiagnostic: AM6PR04MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB61341C1610395BF22FFF3035E7D99@AM6PR04MB6134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fS03Wju/T5ibdE0wjYirSwmq2W/HXKVmnQ5uK0SfnofQN3lX0Rk/R7aR32sC0ub1Z7EeScrRq523XzipH/L3ArxhZ1TQamm83QgXYstI5xtgdmUA2XTE5lTIYXltV2+7E/yUExZsi1girP1SCXQo3HkUHelsKa2NUFPr9lD6hUO8ewzZCZioOL90rFFGA0KbaGHd7tcMSs81hzvnsSt6uUXJfzdRTiX+UYPllRfNlS5E/hk75elCELKZBMtSweHCQS+QXcznG0KJY6FZLQ8YK0G55rC66aZdK8MpV0hx0aeX8b0dCkbz7gLbWg0eSkq43idrmbEpBr5Vp9bieWUC0s8sZH9tkrOf46Ii50KCvV+T7bxBJ7RndZIdnFxYZLuz4dZT9QXfoZS0VWfmcvs3dyHsZrgXKXvRZfrnA43oG3IavUEncmddKwkbVPJw/vSLIkXXS5GBmF/H7aGsJCMTX4tu3VdV6WJwk310Ta4kimqSea31vXz1uGuIz69Ed/tbzXtRsvtKbZakN5H6FPdjylgBCP31pCIoYjFLgHtq4PkWg48au0CDQ8X9iRmYllq1fMhrqTIx9x998rRZuG1XEsXAodm4T0pQSEbb/rFSWtaHn+kuUxeF0qsM5yzacjrMhZGPm9X8++1R2ifwokOCEcFN9y4BRZ58OJ62Yc90ayUthjidOkX4lR8W4Hs9iQLTB2bF4iDshDiRPP+49DBYjAVF5p3NgV5ju0MaRxe6crkmGQqR6LAAtoWwgTPc5gOHtmx8wcbbzBFyXRkMsfRqEZNH9STZgoFyg0hOuADGeTIfSjyW/Cxl0PcJpR1kaODeGrDCfvP6gWgAGccy4wCkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(38350700002)(36756003)(7696005)(52116002)(44832011)(86362001)(66476007)(66946007)(2616005)(7416002)(186003)(2906002)(956004)(478600001)(4326008)(8676002)(26005)(8936002)(83380400001)(966005)(6486002)(5660300002)(66556008)(316002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eZZB2Ti7PEwBW2OmGBLPS/SgOTk8KVrvNWNpGtObK3ryNnA72IDLgtoGQBfR?=
 =?us-ascii?Q?06lruDbK/FfGoTpStuZQGJSsYlArS+6iRRQ/an1siGMU6NCSR6p6Q4aJ8BDS?=
 =?us-ascii?Q?OmYVw/TpTvBx3bHYUUDdZVy5rPj+NR5A0tPbOvQMJUAmP8VQGl90wHERr/gr?=
 =?us-ascii?Q?y7Kg3HzYJCoXMpA/8cIJXZbbhK9dhdAXK29A7VmFgTSYnF96iZfUlfjwtwCR?=
 =?us-ascii?Q?/vPHbWmOhqEwSrk21Llm/0uDXNpRUp8u+jPcnhAKd/+F4KeQUhG4jjnhVAXA?=
 =?us-ascii?Q?svT9fkBIbBgZ63zfpZd3S7Bbhi2cWX16bMtFPpbv00UxWf5IbsSVEUTzAMbe?=
 =?us-ascii?Q?wHPKCLQ4c5Zc7fV2IwVZNJ1+AOqNf8TZyCCIgKNeBJGO4kGbDemueMURZo9o?=
 =?us-ascii?Q?85HlUT2ezWkF/X73xGJs0RDAruyDsClfqLLcuE+V2ndndKdGnNUVG+LBnh44?=
 =?us-ascii?Q?NU01YaRPIKy5OyPZuzscAmav68ioib1VxjC8/jXEURFp3vaQfwtWgUt1+guO?=
 =?us-ascii?Q?A3nWU5hb5WJtzEBEbLkhM7QZZ2xHGT1N3KrSyFrCnJZsMEjs1O0+Kg5Ehynp?=
 =?us-ascii?Q?KUtYvi2oAFDiSPaEntDmT0P635gzfSUGfMyVu279IvJNnR+xuIEWDD+ScWNM?=
 =?us-ascii?Q?TYUOesVc2f2iqa2o70oUnQQke46qiI+JR+teDheUuf2umT4gWGaqkvtQZ953?=
 =?us-ascii?Q?UjsdPW5h4REKbtH5iUH02K5EaG+VWiQzMhEntxhqwU7Ah8hy25Tmo18vMuIf?=
 =?us-ascii?Q?Wh5JjvYZCI2BaJTm7CJ9rmV1tiF9P1Arycyup8yLGEIPiQQj9qaZK53gyvuV?=
 =?us-ascii?Q?1uvLhzFj5BXV89LNe8UbpWXyDCR5R2KqcDwkUDyP+Q1S+lUHbF9NHRFrELZR?=
 =?us-ascii?Q?qDc7WNb/8pLRRM1rCFqNpvFCeK4BCOo23TRUOKbK6LwTybOS6E2tJCZHIIpy?=
 =?us-ascii?Q?utsdPLElNy6ldj0QNWw5xla7p9jAQaTaXOq6XtBhAmfm53DKHMMKzvpGUMNh?=
 =?us-ascii?Q?h24qOrlb4RTLFo870Fcxm3yWfCWz5yruiObdi9PxMxSfFag1D/JuTud/rnU3?=
 =?us-ascii?Q?OEUbl4LsoRjqoATjrYCJaHIFfdoQM6/cZr//S9ciBsq3AMlGt6wy3oKh1E2F?=
 =?us-ascii?Q?Fxt138AktSSzJsPsXKYVwXOuO7Lle7O7cKwEkcSVtmBumfCHz9T8mmk/UM4J?=
 =?us-ascii?Q?r0NkR8K4UNe8C00kcuYMz++kw9lWnfyOCeYWFtTupOOPKTk0RJhcmLnOQ5Lg?=
 =?us-ascii?Q?9GiD4WyQRIkoKGJ3bvpuahygffUY2lUzqo2AUZI+ATS0qOgQG/m4IAniEvVS?=
 =?us-ascii?Q?FQklcNen2weU1aAm3OPgV1Lc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6daed78-c085-45f8-9bbb-08d9769683d3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:11:48.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6rxV1bGlsTt8BOWHNjyF6poVwqh3UWyIwnMnozmqu5QK9ww6UU4nCVxfBx6vl5Ge++F1Y2clwLhU0xPNPdy6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6134
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

