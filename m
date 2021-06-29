Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503143B6F2F
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhF2IYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:24:13 -0400
Received: from mail-eopbgr70053.outbound.protection.outlook.com ([40.107.7.53]:42838
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232433AbhF2IYL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOPrlGmg7zTzCHfYOOTIJGIOwpGcSbGcKOysqtCz0IWOqKsKU/QYFeUbEw9M+qZpuSOjtwNzJ5hSvgomHZmsPjcqUjjnRylOUYhitPwMPFmO6UHzHPcc1CGwNwsktW7mOmV5CHoVAaYLEDkqSeHDdfbRVwhgBfgOk1p8nQjCJEJB1R1IPIN7ywQ0bexyLMVBkyJvjGQ0t5Jl2RtMFKWqBcHXxLl6rHDjqVi0fGlSZ846XxNpsbodhzV/H9qU3DOOe88UN4ZrjM2sy/oOl5vLuzsyx5laMQbTi4KutBcpeqChGw9F0H+BP6uIGjCf2kWtq/28vracwhuq8FkroWPGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOhD1zyMUvFesy7Xv1UTG6va0+MaZ2ssasiq7KjvJ5w=;
 b=JVf4Lr4plihYhKMPHdia6nBGyNtUXzr9qyJ+gIDyYSWsD9R1BlW8EtkBGYvpDH0EJ91p/x9pOE/PPmZuj+VInguqm4z+MK46VZe2eEzJ2y3iX3j05/tagFUU+vFtz22mRFeSGdMsoS0g4LPFkzdU6V9EfaOJi9gSO1ijANPlhrEL7Au3pLYytUzQYE3iZBHUiJYe0PxfyhuxYUw+VBWCWTd9VWnuxMG6vGJz5cQwAoT1kcc9Xysa2yv+ii0Drb2dyNZdgdM6XzuYnS8APGc0vfr6IWj17S96m94CXjc3Ru/NMegRUrVCYXjr73K1Pvg51j/gVqLT3mju2IFkQE27wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOhD1zyMUvFesy7Xv1UTG6va0+MaZ2ssasiq7KjvJ5w=;
 b=senCoV8YWDkUzcmkb9OQn9ZzEyBXTyYlm2pib+/7sMJkasBYw+hDEXVB2fNPd27fY/xcHkwN4DoyYlPGbEQSfwrcQY+C3AGoKBr06nQt5iajrRXS7ppLN7bxG5RVXYul8gkuqI96HMadeY0CR56vBfR2z+Y8H3MuBmeRA0F1WjI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4583.eurprd04.prod.outlook.com (2603:10a6:20b:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 08:21:42 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:21:42 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/13] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Tue, 29 Jun 2021 16:21:02 +0800
Message-Id: <201c608e24da92498fde48708afa2dedde5c8f0b.1624954576.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624954576.git.ming.qian@nxp.com>
References: <cover.1624954576.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0160.apcprd06.prod.outlook.com
 (2603:1096:1:1e::14) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:21:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a693a588-3f21-468b-39b5-08d93ad6ed10
X-MS-TrafficTypeDiagnostic: AM6PR04MB4583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB458342A3C66487CB4A1C931AE7029@AM6PR04MB4583.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RwXlQkqNceudtz3tJj7+sSvOQZBFpyHn5Hs7LYaG6sIWggqpX3qp9E9ehQO50Ywhzp3lN0sbJW97kDz22X3rUnPIagByzv9TCu2hvY3m8mSpxm5Ag/K/0r7/KGDgoUbOrDr6bDSF8F6Fns0Ad/ab55MjokhPpJ4XZUhXlmEjrg17V11jRM+sh0ZiXvyjsUoCERnGpaz4NsI+ARUiB4NK48yIgfYOymEul6G7xuYnnuZPaEi3NshTtGcQejzGgJCeSO+b8XdNIUNLr/lFFCBIwAqvGEhUaHJFmRYVFo/vhOAZwFjKCtHBqeCDpXvOGwauxf86Jnk3tjPRbj9clHQqIVIQOlCK/UDDDDwgv6Lbo24ppD5oQJ5DQcB0m68yk7a/e2rHE0Kr7mteUd7bHzIg9t5QteDgZh/rfZq35cj7ybhGU4bLytukXuMEAhCBbkgMnrmFX3NxpfQ4dzX0pqgpaNEP19byrUvuGTad406MM4T474s2rMKmijMBfCV9ubPgRBhfg3RRwh7UIKSGPK5PCLGhTvleed01usL9iRAct7PjLOIgQnCfzLjsIexjBwufq10P/XJzFzfqvBg0u5L2nihQcMpQYCDuJMypDKFfJBgj7m1fGfgEY8HDsSGxYHXiJ6XHCjRVU4u0wMXDTUDUYcGXO4Jxh1bK3AAU1h5XucMbwKoMABqZ/eyRPaKkxW+pbub7cNpdphmIUV+8D6EWf+IbbkSczLTwVirVNZ2wrS1jOYc4iB1APdIVS/mDNzoA2Ykp3Tjq02VZsmet3k434oFP01DMA80yPTMyk2ZIvC4DkTd8QntoA9ftmnruuUu4clExPJUoZGL4/nOcGVftHL7d8kPMh6fY5iwSxOsJlZtD2s0bSVanQ+v9YEcp0SZT+aXx6P1IkR/JuOidIwz9vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(2906002)(7696005)(52116002)(86362001)(66556008)(5660300002)(966005)(478600001)(38350700002)(8936002)(38100700002)(66946007)(316002)(66476007)(186003)(6666004)(956004)(44832011)(16526019)(6486002)(83380400001)(2616005)(8676002)(4326008)(7416002)(26005)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YKQ7thX7CHMMQ1ctMhx+S/n2zZZUxvM0LbipE6aVXOQTzhsB3vPTsZxkTTet?=
 =?us-ascii?Q?VeowxE/FxQ5NGbQcjR/WEPokONGb++BUcRdHo2jPLGMb8TO536wGQUxw1uLl?=
 =?us-ascii?Q?FxUGJ9Zj1Yrwy8RWAI/uu7RfZuXBBqn9QYV0CMKOK7tpQ2ln69uOIT5O7u88?=
 =?us-ascii?Q?+wqFxB0jMYekNeQSK5aUrZI4wJs7eOnVLgAuqnebhbF26F5FyPMYHfuv1V3z?=
 =?us-ascii?Q?FJi9MYL2mYLmwRW+lIwPI1VGZK770aRJLF2vBxcFiLPPKGDN/VSHhfNL5Zdw?=
 =?us-ascii?Q?twy/diTpa7PY2tZWYZA7224R9hAMyzNw7jv3C7MXgNaPNF1PnZ4ORAR7QqJs?=
 =?us-ascii?Q?Yxwar9i1EAv/vLECpMEGDCtmhooxazm+lq2CqulYhMtlG+qLkOlJ9EStuV4x?=
 =?us-ascii?Q?M0P+v26llhVDuTVcT35aJA6VyIGk7AMxRf5+2u6XdSCJSgikgLp6T5ypb803?=
 =?us-ascii?Q?OJgIXqAQwqFwmogw0hEj32azTu2ztAGdME9j5wC/5WVOhub+CgV+K0jFn19H?=
 =?us-ascii?Q?2JmwtwjqB1fwarNwx18cLEoDCcbBGvJ4nLPWj9MPgtRzqDe15uuVOVaepKox?=
 =?us-ascii?Q?rXaWhljVOEf2j1rEnbjprez/jX6PAm2/lxI+lVBRLtBKsLxDw7UO7SoIIOEs?=
 =?us-ascii?Q?DLSmCnXgZQrQdOiTxQbXH3yslGl2op5X85L1LeVcM+5aIA3l68MVisB81Yvx?=
 =?us-ascii?Q?a8v0glbKViobw2qIPZGlKZKEtx4D5XWexcBAbl6bGo/tIZrx8R0r4BQEQEZf?=
 =?us-ascii?Q?JdHLiiu8vcK1sIl4/y3VFNMjSKRyd+vc3jiDC37jhlEfJbXFjUYUrwHmVwlG?=
 =?us-ascii?Q?LfdjI/0raXuPuY5TXIhMX2rmJ6+Dll0MXYBStQRn5zP53OuKM9pBDc1+3pSj?=
 =?us-ascii?Q?1mAOpuRgvy2iVQxnkhP5/ghqWl10uxzxoSd5krCJFJ/4l+UoNmzkc1hN/veZ?=
 =?us-ascii?Q?7fgk3nKVxIuVorK6K3Bt7HnZQtAOqlPYrIFMaw+W+en6qhmzqUe4MlatGjxd?=
 =?us-ascii?Q?xG6+Fw5Mq1cCdpKPlU++zmXOmduCJDrGaBgtqugbOTX/0zLdHZ3Nrq8+r0/P?=
 =?us-ascii?Q?n3lHhwwmjp1MvzV+fYT2cckaUCbRaPGWRHHCSquLlj4NKo5t8Us7TDJwZQdr?=
 =?us-ascii?Q?r3n1QG/FTtBmb636kPzxFaq2lQd0MllgT4qvxjp8XVfEsLLDPt8XWN/E4QHq?=
 =?us-ascii?Q?tPa0ErdJOCKrlSDxX4qvGoDOQ8q0EDCqC9ZShtmSOWGuKf87hsJK9AM3xUC6?=
 =?us-ascii?Q?6jN0xeXzuz+mS3499372XvcsUFIEwkGnL3v51NlE2N4PoW2uJxBGPdhEcDei?=
 =?us-ascii?Q?5qR7ZwtmDxHOriPOS8Movzgk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a693a588-3f21-468b-39b5-08d93ad6ed10
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:21:42.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HafASjxCzhvMt+2+T8IZ8yOZryGj/a3TOGJ740eoS9xUWjszN3bqi2btv+FAyVNxlb5QexoWmJ7J10eFm/c3Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4583
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for IMX8Q Video Processing Unit IP

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8q-vpu.yaml         | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
new file mode 100644
index 000000000000..b9e38caf3d10
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
@@ -0,0 +1,191 @@
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
+  memory-region:
+    description:
+      Phandle to a node describing reserved memory used by VPU.
+      (see bindings/reserved-memory/reserved-memory.txt)
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
+        maxItems: 1
+
+      nxp,boot-region:
+        description:
+          Phandle to a node describing reserved memory used by firmware
+          loading.
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      nxp,rpc-region:
+        description:
+          Phandle to a node describing reserved memory used by RPC shared
+          memory between firmware and driver.
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      nxp,print-offset:
+        description:
+          The memory offset from RPC address, used by reserve firmware log.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - compatible
+      - reg
+      - power-domains
+      - mbox-names
+      - mboxes
+      - nxp,boot-region
+      - nxp,rpc-region
+      - nxp,print-offset
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - memory-region
+
+additionalProperties: true
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
+      memory-region = <&vpu_reserved>;
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
+        mboxes = <&mu_m0 0 0
+                  &mu_m0 0 1
+                  &mu_m0 1 0>;
+        nxp,boot-region = <&decoder_boot>;
+        nxp,rpc-region = <&decoder_rpc>;
+        nxp,print-offset = <0x180000>;
+      };
+
+      vpu_core1: vpu_core@2d090000 {
+        compatible = "nxp,imx8q-vpu-encoder";
+        reg = <0x2d090000 0x10000>;
+        power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu1_m0 0 0
+                  &mu1_m0 0 1
+                  &mu1_m0 1 0>;
+        nxp,boot-region = <&encoder1_boot>;
+        nxp,rpc-region = <&encoder1_rpc>;
+        nxp,print-offset = <0x80000>;
+      };
+
+      vpu_core2: vpu_core@2d0a0000 {
+        reg = <0x2d0a0000 0x10000>;
+        compatible = "nxp,imx8q-vpu-encoder";
+        power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu2_m0 0 0
+                  &mu2_m0 0 1
+                  &mu2_m0 1 0>;
+        nxp,boot-region = <&encoder2_boot>;
+        nxp,rpc-region = <&encoder2_rpc>;
+        nxp,print-offset = <0x80000>;
+      };
+    };
+
+...
-- 
2.31.1

