Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35689395401
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 04:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhEaCxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 22:53:37 -0400
Received: from mail-vi1eur05on2070.outbound.protection.outlook.com ([40.107.21.70]:14000
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230052AbhEaCxg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 22:53:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frWr3JPi5Ro3yTQ/i/pmEjRGiCUy5ddYYY9+azSAzEJ14I5mLN0bLfWGdEpmV8sicbCGnpBTLst8ZXTd3xXA/ZvSbKiMUNchDUTOHJW4XH8UtqD2UkTL65QBmTCUOTia/0HeeiHpLBjUCMGSWEGWSSAE76Ivncx59OXuM1XQIXHGRjmkm3OkNdkedeZ0MpKPmDqDj2NEZAGlzrIdltU9KpR62Ni/TgMP9GiC+KHdSAeXEEf+rnNVTxA2EouojMleooWQpF8z8hbgNxe4yXpVJmNbykF+oD6I7whX3gDoGSWaST/x0EmX97C7ODxKYjX0qI9fIOFpG3AhSwaswaddKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzwnFucpAPTlVewRCMgLU81k74K6NkA4iWDR4xehk+4=;
 b=KvIkzCihZOpfUNZlwxMcGG0ysmD0+ZfmCHX22H/fHlbt+zhXIuandh1J9hFDnBo3cNtXW+7BgNXe4T5bUn+Nj9JRCHfv/dIDThTxHsncrRs96mousZ5TD1ftevY0oJTi0R9TNbvZVgysfILeeWshL/D3BLJxfQJoM5R+elrT1xhObFd/Rtm/yoMtkYJGltprBfcvcWO3ZLqPC+75cxOP2Jpz/7kFPKN64ERg4wz5Ru7eC2qpk1GvmmHOmqU2E3bGE4sZKEEA25hDDqd7In963D3k9aXTKvSsLpgJkwSK91MncJtwuGpmOj0NmtCyT5WhVqlMTW8gH33qsbj7CXe56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzwnFucpAPTlVewRCMgLU81k74K6NkA4iWDR4xehk+4=;
 b=egt60YhEGmryoKS3Ev/dYxENV09jtT0Lvc8mub1Cx+PdFM9sXcR4v4/CH+if+SZzTaCbdWxsA9alu3MqG0cXfR2IvJ1+dkOHz5t+fHVBmjBS0A+niQq/5rpqn4jdsOClFe2nqpNey2phiaV6/hXPxQerGOVFcb049Qa3FCOoe0g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2546.eurprd04.prod.outlook.com (2603:10a6:203:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 02:51:55 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 02:51:54 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Mon, 31 May 2021 10:51:09 +0800
Message-Id: <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622429025.git.ming.qian@nxp.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 02:51:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38b97f81-2809-4008-1b9d-08d923df0c5f
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2546C932B8C0794B73DB8DF5E73F9@AM5PR0401MB2546.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: egun2SaEHsrCfDYrte85/apMHt0io210WXUSfV+w1XY6jB53vqk08pI4fiq+wNhEMBKItDYFhopOvnfgoCTdSD2SdRgtD5l3x8lfrUnHwKfixjQOBtAIpeyF6MXjwlaqj7t/3/Z4yaPQdfFwVu1mXdbIDhRsbGeAa9NKUdd9KXsr0+eVZcO/8W5ijczMhAGsMuJD5Iw3GWqTxzX5nob/XV3nHDE1XGhFn9gfOabsbMa1VUnCg1yoyAipAoHDviO2jgndOKuFfxA4M+VZOa7S8mw5YivVSzPwAEcVHjLmKJdR1DBQNg4nJkV/vHPx0mjq0r61v7sXaOvPvoNsdDg92g5hJzbcY35DFjbZREQdZGVOYbiwTmUdrBQL4FlK4CNZaVG1+7rqBdJTqj8V5FbUSrKv3fZvzY5jJHIGgxWcWjfNR+gRfFHd9E0YhApSckEctXwFJb6zfqp62P5SjfdFrgCdlyhR3k8005vx4LxyWYWzgozq364eh2kIIkUBHJISrPnIh6njWyeL0XW2PaJ3LUDwLIcjevmRfUJ2Z+ERPFf0872v6sfy5LdbYxXIwUJNBaQ/+R8r5AiO76IV0oT8E2rmP0uwsMdpFLn444BU7iHchRIGLoEwrkq24ofdq+akf0BfPjR2wSyzTnkoLlzqgaIHMKcHxO57xdPJz6JukwStqibcNbnJ14iPOrDFLHIGFTrYP1IxXnPaQi3zJQ7n0lGYIcYMuX0ZoVfWktbUtAuzPLBdWxOD3ZB6vv3fDV0BbBW965Jggi9p3z77lYlzLrutCMsL1W5rHugibtN4Mo6NkeY7d6bLykWtV68cdUbf8ftcBItpdieIaZlvtoX9Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(5660300002)(4326008)(83380400001)(6666004)(966005)(36756003)(16526019)(66946007)(66476007)(66556008)(38350700002)(86362001)(38100700002)(44832011)(186003)(7696005)(2616005)(478600001)(8676002)(6486002)(316002)(956004)(2906002)(26005)(7416002)(8936002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+se/4jMQypB4kzZRhQap/DSl4xLrqHCX6SC01EnrBvX2pCXDRJEZQVJYW1XI?=
 =?us-ascii?Q?DfP6Dj2+AvcK4aq4joNMf7bQALzjkCDNNtKfVSK1JG+0/g8WPArrcIsGTS+T?=
 =?us-ascii?Q?VZdPQt/Ntotqvs8r19KQkGxY6PV8KKo0NsfnvxZtuZbYsxZxI66vMAljVeo3?=
 =?us-ascii?Q?11XYrTvf0NLA9GsIVBnCFEU7hD2HdnOeOpVWXj/Zuqdd8IMkhb/edxIonGJi?=
 =?us-ascii?Q?Ua58y+TJvpgDawwJg9ULasf+RnFz15rmonIxE650oeEGugjGZfZ2ATgKgGxs?=
 =?us-ascii?Q?3ZkrMySr9ylZIpAjXcCQo5lSdnkwrDZ/zp2nat7lAOC7cNFocPc4PUQSkZR9?=
 =?us-ascii?Q?Ojhd5GBQd7utAv4axoD6PVFuw6dZe2ETL4IOAhalji1BUDWcWlM/LI6pMX0z?=
 =?us-ascii?Q?T2bD3GH5uBvwNkQ4BWYHk+Ilt8dVuGdHdrqp7gcsGo9NKrcERXwYlTguEue1?=
 =?us-ascii?Q?mouVA79YVqFBbAiaeAwY1+QojP73gdAR+ZO2Sid6oIm+sQG7ciBKz/WMoOtk?=
 =?us-ascii?Q?4SfPF32gizp29HtppNl5wy/GY9hRY202oMVLS1xF+Wha+GxkqlX03lrnsfhf?=
 =?us-ascii?Q?705FY6X61wLnI9Ls5fL2FU/tRSCRvEbPXwGCqEHcdmOvKBlXZBp9Jy01nHdO?=
 =?us-ascii?Q?w4WG7khHovR4Q/Cbt/sP30qNLR2T0XhxQc/2dE9peA8Ah/XB6cszpi//7L29?=
 =?us-ascii?Q?BzEEyu95oLRkSVdmDFlMIOS9yI/yhEc0CQC3CpU1TKoExiIOtiLk9tTvQSGk?=
 =?us-ascii?Q?W51Ep5JVMh21qVCi114gl5TKHiksUmHonB/XwKR58GUL0AGdXIeAZOiP+wJv?=
 =?us-ascii?Q?1Mx0kP3KS+/ocFyzOJhsmlbU+Yf5IFnwN+rg8u/QbWAMXTXsfBn4/pFnaxGd?=
 =?us-ascii?Q?FmHtqZ7MD+AfCR4acrX21kvZuco2txdht2b/KzCdAEx6rYETYr19Qv3VS1Tt?=
 =?us-ascii?Q?ZJTJ1WS0VxHuWMYnDq4dCYT9UF3JMSkSVd5/fBOTMAGmgAFZTBabofIlxDiV?=
 =?us-ascii?Q?uC3OUCaOzbWyfbsFt+aEyVnie3wUsjwIb2DSRydfMOIdZjJVuZG1tsb2H7bT?=
 =?us-ascii?Q?3YcptE3yxdbOfP0h7v38Z6e8olWaitOU8Do5Zo+xyUysDwLSboDn0/J/WejG?=
 =?us-ascii?Q?E/hu0UcXwdjtob/N8Dq17JIfMTHAXDn79UqcfBgIVLsIJP8CduXWD8mJ2aVo?=
 =?us-ascii?Q?vfdrzfKyHtqck21Aqhiw+CkIeWw+6tWQ6rJoR+UqOWaX4Vg5TZ0Ac+zp2HEI?=
 =?us-ascii?Q?pgDzAcZhIFMHZGNU9srCbHPdT2VgTFYqh98sHiVMXdZ0ByZXn+I+1LBSwQhb?=
 =?us-ascii?Q?wtwI4kUL2DuVFw8sQ5S4fj7X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b97f81-2809-4008-1b9d-08d923df0c5f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 02:51:54.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T83xKe9HOlf+VwkIEYLGuYmgV5kVVe0i1HCEHQiE2wQ7zhNVNpAwsGJcvFPimFH3tw2P1OFkWKlOegTGu50j2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for IMX8Q Video Processing Unit IP

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8q-vpu.yaml         | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
new file mode 100644
index 000000000000..97e428dbfdbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
@@ -0,0 +1,201 @@
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
+  - ming_qian <ming.qian@nxp.com>
+  - Shijie Qin <shijie.qin@nxp.com>
+
+description: |-
+  The Amphion MXC video encode and decode accelerators present on NXP i.MX8Q SoCs.
+
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - nxp,imx8qxp-vpu
+        - nxp,imx8qm-vpu
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
+  vpu_lpcg:
+    description:
+      This is vpu Low-Power Clock Gate (LPCG) module.
+
+  mu_m0:
+    description:
+      Each vpu core correspond a MU node, which used for communication between
+      driver and firmware. Implement via mailbox on driver.
+
+    vpu_core:
+      type: object
+      additionalProperties: false
+      description:
+        Each core correspond a decoder or encoder, need to configure them
+        separately.
+
+      properties:
+        compatible:
+          oneOf:
+            - const: nxp,imx8q-vpu-decoder
+            - const: nxp,imx8q-vpu-encoder
+
+        reg:
+          maxItems: 1
+
+        power-domains:
+          maxItems: 1
+
+        mbox-names:
+            - const: tx0
+            - const: tx1
+            - const: rx
+
+        mboxes:
+          maxItems: 3
+          description:
+            List of phandle of 2 MU channels for tx, 1 MU channel for rx.
+
+        boot-region:
+          description:
+            Phandle to a node describing reserved memory used by firmware
+            loading.
+
+        rpc-region:
+          description:
+            Phandle to a node describing reserved memory used by RPC shared
+            memory between firmware and driver.
+
+        print-offset:
+          description:
+            The memory offset from RPC address, used by reserve firmware log.
+
+        id:
+          description: Index of vpu core.
+
+      required:
+      - compatible
+      - reg
+      - power-domains
+      - mbox-names
+      - mboxes
+      - boot-region
+      - rpc-region
+      - print-offset
+      - id
+
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - memory-region
+  - vpu_lpcg
+  - mu_m0
+  - vpu_core
+
+examples:
+  # Device node example for i.MX8QM platform:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    vpu: vpu-bus@2c000000 {
+      compatible = "nxp,imx8qm-vpu", "simple-bus";
+      ranges = <0x2c000000 0x2c000000 0x2000000>;
+      reg = <0x2c000000 0x1000000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      power-domains = <&pd IMX_SC_R_VPU>;
+      memory-region = <&vpu_reserved>;
+
+      vpu_lpcg: clock-controller@2c000000 {
+        compatible = "fsl,imx8qxp-lpcg-vpu";
+        reg = <0x2c000000 0x2000000>;
+        #clock-cells = <1>;
+        status = "disabled";
+      };
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
+      vpu_core0: vpu_decoder@2d080000 {
+        compatible = "nxp,imx8q-vpu-decoder";
+        reg = <0x2d080000 0x10000>;
+        power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu_m0 0 0
+                  &mu_m0 0 1
+                  &mu_m0 1 0>;
+        boot-region = <&decoder_boot>;
+        rpc-region = <&decoder_rpc>;
+        print-offset = <0x180000>;
+        id = <0>;
+      };
+
+      vpu_core1: vpu_encoder@2d090000 {
+        compatible = "nxp,imx8q-vpu-encoder";
+        reg = <0x2d090000 0x10000>;
+        power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu1_m0 0 0
+                  &mu1_m0 0 1
+                  &mu1_m0 1 0>;
+        boot-region = <&encoder1_boot>;
+        rpc-region = <&encoder1_rpc>;
+        print-offset = <0x80000>;
+        id = <1>;
+      };
+
+      vpu_core2: vpu_encoder@2d0a0000 {
+        reg = <0x2d0a0000 0x10000>;
+        compatible = "nxp,imx8q-vpu-encoder";
+        power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+        mbox-names = "tx0", "tx1", "rx";
+        mboxes = <&mu2_m0 0 0
+                  &mu2_m0 0 1
+                  &mu2_m0 1 0>;
+        boot-region = <&encoder2_boot>;
+        rpc-region = <&encoder2_rpc>;
+        id = <2>;
+      };
+    };
+
+...
-- 
2.31.1

