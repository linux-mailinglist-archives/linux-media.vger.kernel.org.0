Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDF43FC0F8
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239558AbhHaDBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:01:01 -0400
Received: from mail-eopbgr00056.outbound.protection.outlook.com ([40.107.0.56]:15430
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhHaDA7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:00:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQ4B4yBEq+jOpDfw8/HbdFZh/mwwH9mCeSVPKmJGXT7uH5x4DbI2yH7mn54WMFeCfyW0QfAYbXS5gPSvADzh9Ou2Z/cieMnLD4EYTV3fBeLb1FbtDlYH7X5haHiM8ChkKD9vZhDIjnzwb/A61wr8uiqL1rBXABv3KnSvs/jmj9imCdQzSIwjt+PCqCprcqJJqDpd4HrNsqY+POMCUMnc4tsjm8XPbbd8qpwm/BoT5VQmXvG4Pw0VV5j5N2+tGZhGYr/9coX++KPtKwlFsOuFzTfopTBeeXmb2pW0wIdIYKCy3XPe+ShQ3Y/zePnvlK5usr2aqwFaiEGmsvYDQUxbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3jpB7DdHmmFt71WplG37Ho65HeyNyanqan0uuBVEYg=;
 b=SQRlTiInpIpczRF3/RlTkZtSuM98Xb/6DbFlgB19siDJ678ZAnUmDLqzxy4HGDQT1ro8QKs+7c3PKN0tiaEJkMAEP7D+x+Ge32xlvw2+/4ZUAFv9hcI8pbr7fo0JVqkymvD0ebuhM1P85PZODVewJ9p6ZBLqIBde060lev+rqehrZ/TGd7XVoT7UtStild9GEQD6jUzTeoyI8eU6tuFqKlyWS56jb9jwZcTyiOiFpE46621yToSrUhSe1/YsTiXETW6osCuOMW+9TEjQLMR7rcSAxlvR6GM1YOPKxqMCsxdEh+g5nfF+YwS6Eh/GPWE1VXhc5bdk0REg+4nr/a0Zwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3jpB7DdHmmFt71WplG37Ho65HeyNyanqan0uuBVEYg=;
 b=BZzt0kfxzlScg8eGCFMz1vS+iaJpJd54TOKRw8LJrjzijCKBuArClPZGkVTAGwvVtx0ApUAGEEw2fG9fVeY5a9hJ+QBN407sk7twzvTUxnqg1M/6YiHpNxnUx3foTpo078tyj2RfuSpsoY1NKPVBOuc+20TaAwQ3543qwNp9V4Q=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 03:00:00 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:00:00 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 01/14] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Tue, 31 Aug 2021 10:59:02 +0800
Message-Id: <74899fe01678641839be0eea7e3fd35214aad84c.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 02:59:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1297c20-101f-46ab-e039-08d96c2b6be7
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4888B42C8245BE99CE1DD998E7CC9@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQZTwXPZcbjSAP6hmpHbeId869MNsfr5jv/3d07P38AccfrrtM3h/jWxuizupnLRNMc2tlDm8kG2iCjge1zbtxHKELCUtvv6wJOICz2ddpHZcoSiUXwSU34Rq764q0zjb4VawWTKS1tKdUpgAloxgfu40BoP82rPr+Q1T4ultS+K8PP25E/d9XduOva5Jszm4/dDKzqnd74+VOH7ZUp1MJR3ru8NQisYXxIJL65Lsza169EVTDSaA8wshnPx8ZQRSL/9LHGB6dMPfyLsuHn5ooLqsrT64VQ5Xlh4yvMkzsy6Jd5XfL5SehLbchzv11qiUKdbDJXFVTmD9wlSMkZN/54XMdr8PP9Vj6QZvh/pQsZRE/nf0Ox1YUqlljlWggg49NyOClK9Y86JGxEcABjtTHcGEA44KaIokKC6fFo3m46gLhxsqgXhrGcyjwGi9Qw8RV/SaSN2z+Lo44rxW9IeypIrYbu4zsYS+PvwAVxOGRtOvTJ/YKB4oKLcEEW1pUz31Ya3P0elTgzBNCuhvWN7VJZS3Jm/c3gz+xPrmxHcIgvB7vt+lr/2vHcJzN3lZ7CxQLRnYCda+Kf8g9X70h5xURp1bK0v+cX2zQuVuTLHkxD2GS0rBTccNNgIL12mmg24TNDFnk1zZxcV99ltNqpxB+uHdTPJLcD2NP0O41FuXitI4aNUC267vABvjjjDkl1Ip6why2+xo7mXawF00Cm8GkuJpnxb4eTN5CKGYnREWp1+kyQueOXV2Ca4+x6TCNYR9nIVVx1aeUnB6+l/9HigCh0rFTEnpP2swc/FVGdhYgFYjljICm8WKjRO0kdxmIZWnSt4ZFpQHodMk7iw6I/2+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6486002)(36756003)(8676002)(2616005)(186003)(38350700002)(966005)(38100700002)(2906002)(5660300002)(8936002)(44832011)(6666004)(478600001)(956004)(26005)(7696005)(83380400001)(316002)(7416002)(66556008)(66476007)(66946007)(52116002)(86362001)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yk9Wj1hoDzXZ9uLAtHIjqDFPhIWEDnqQj7b6xA9GM4sVkQ818BaXLH7ILhaO?=
 =?us-ascii?Q?T6xro5q2fMI+jnCJubTGg3oKxKIf3C+O93ZzIaz2ddvkH+QDgX9f8dC1yPxC?=
 =?us-ascii?Q?vV8kX61gSSVLJEQJ7a65eMRRw5c19vgPCoH2len9u1YIxy4AK4GCvsygmr/l?=
 =?us-ascii?Q?Kf6SeeGmrwAPEYibGQ9Odh1hlR6zeeGBPnSzasWxuVw6TjxPH8d9Qw418+xi?=
 =?us-ascii?Q?/rlNe/1NdvkvzuMkCKbbg8G8z/9fysXnoKA4gjthI+hktCpxeH2lgWGU4DzU?=
 =?us-ascii?Q?TlnL0Ut3gmEXq4MTNNRHEop0OQFdtnkJqAWf+sc00ViH8YcfMMFQEHN6PleR?=
 =?us-ascii?Q?u0bXd6HR52Vjt7YpcNVuU7ncHDSAI1DrYQm6z7HjZtDA2pWBoWMDhYxYfy+P?=
 =?us-ascii?Q?4EH7msAGnX7BQKjsfvBEFZOiPHIy+NSfKb/3c5nKc8ujq3cMM7wlbvuttboL?=
 =?us-ascii?Q?CgRRBoCLncgaU5VT2+YNcFAavkf5ScfGoMAdj8QTiuwO4spyy7iPpYEaIEhR?=
 =?us-ascii?Q?V3vBmOH/BwRLaC1SESsSoO7LK7A6bdSeoMbTGj5bFtzq5lAM+kSaeEqBeEMR?=
 =?us-ascii?Q?ss2ewxZKuG4sjgFb7Pargq1XtFbWXWoO/P3Rc1sS6AgYstNDV1f1wt15YkUm?=
 =?us-ascii?Q?g2EBcaNFU3DcTkuNvJ625FDG9NApbk74VSxM7A5uLAr/6u76X8XHS8WhHmE1?=
 =?us-ascii?Q?y/mhnUodNmmaxGKBr/+Z9+7GPh1SIqfY7XKKkYhUrZb70Ps6c763LRwwc24j?=
 =?us-ascii?Q?aT6cL17TIYw2xU1Z0mVpWHXV7Z4xO2PwS9dAfSirkw5F4na8+LtwB7RbNvWQ?=
 =?us-ascii?Q?TMgLfEdoKuJD+pZEdp9Eoob9T20bCpjyKeMRb5T1rhUgH/eP5EgC9nZXQQUi?=
 =?us-ascii?Q?2HMO8rzdOzidfqi4mXRe6jgzQVO1eZSzG3E4d5lvKlb8rTE1S32o9IHiXle3?=
 =?us-ascii?Q?JYiZivWeVJQbMWPx+xZTK33WuwBiUwNRMPOj+e2QpDZl1Dly88bbt0vJGe2m?=
 =?us-ascii?Q?9gbDCZEza3vf1StkxrT0UHrsw2EMLU1k4f6DY1B6lRtR3Ck+GYJgLJgdQc6U?=
 =?us-ascii?Q?3Iu5pOB0jtSjFtiXm7Bq7/OBYTpePM5pWMBvW0IpWA3ZlcXwMJ51cfBPvidq?=
 =?us-ascii?Q?XA+dhkAMJopC6FXU90giU1gGpbOqgN/t4hdlrvIG0uIpwhWs+EHWITOToaa9?=
 =?us-ascii?Q?shB1QETXgbRir1KOhjzEXIPbXJix3Uk/k+VLE70yuAP1H4g9WhYQkj2ehv5B?=
 =?us-ascii?Q?o8MKrLtTPDH3uRENNDKbxltMuQyn1fcyLspjx/lyljr7F1Q/gpmXp+lyXFFF?=
 =?us-ascii?Q?9vAHYjnyI8v5EHlVIvRk2FCH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1297c20-101f-46ab-e039-08d96c2b6be7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:00:00.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsdoEifrK36gM1dldWSZQ/N1zykS0bM4g6yTnVPT7WlR+wI6gBnJVuafLgXL/ItivcuGtOHPdCjmLEUscAlAYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for IMX8Q Video Processing Unit IP

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

