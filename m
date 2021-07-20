Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C3A3CF1CD
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbhGTBYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:24:35 -0400
Received: from mail-am6eur05on2071.outbound.protection.outlook.com ([40.107.22.71]:27941
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242837AbhGTBDs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:03:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grie0PPQd0u5+2cuEEJNomfafwAB9QG31/NaynFXRdi0DZR1gqVk+MKmqcqzn+lCenA3zveHPB9N3304Du/35wI2StKJv5Ez4jtGjLAgVMTgMUq/i6+4fyJvQlMHvJfpJAGZuQLBAEa5DCRZoMY3RvbK8bpOjDtT15OsFXwhJn/0opc+Jh0gmQFTphbQNV444iqfYnP63T2y++LzLl9Lae4dZwseMUg46v7f4TVabJpQdoYZewTLkwNVDm2AppIJdclp/pWj3rhWNq36rArZy1U4NoRX4RIBx6RLzlonYsHGpXcxrWl0DPMfj4Q46Ecph6GNsRopXPiTX0qM15lDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaRvTed0pYePY1JTRWBs7iJdPZA+VpJrhYoO9b08GGc=;
 b=KSKYoYgHYwx5L+3IK+g4EYNI9/T7gTs4yC/e+TMG/MDtH9l0Qz7Yvz+rM/xt3OT49cUr2BnTSBQ1J3X70fdT8H6Fw6CzI9btcAr71eojzhs/TR8mVFc7c70iT4QZw9kN/OkEnrn6kJrSzQuzjJG0xgLxyfZiceOhWxejKceY3pWsGvj9/gugFtkw64WUspTeiM96bKnyvPDUJqDX3djMoWkfO6+tQdzaJHSrWWqeBt4j2Zc/UPaKARErIpHtDEiFKKJxGc7y0HoieuxWwqgcSfh2GN+28ww/RGinPlxY/D3w4LzTvPd4BAgOonvhEOwZmdRrPJ9I6V2BusGDoGw7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaRvTed0pYePY1JTRWBs7iJdPZA+VpJrhYoO9b08GGc=;
 b=TRaxIwgWRvuF4QoxPMcCZAAMTfP6h8pG6Z3MyIf8pkENJ9Ib5mz9Wzx34rckGiTgxAq866y0cy59bzc0WcETot8vaENpmEpLeLJc8Ak4gnuxJkugJ5J2lOT7uyhMLyKvkuCmlw6/zBBk/f11S8Q3Bi5NzqFS3WwFq2Pv4MGt1jc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:44:00 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:44:00 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 01/13] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Tue, 20 Jul 2021 09:43:20 +0800
Message-Id: <5032168eca16a277cc8ba9e951073a37089c0eec.1626743758.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626743758.git.ming.qian@nxp.com>
References: <cover.1626743758.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:43:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ebb41e1-6279-4db3-3fc3-08d94b1fd8fd
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3813F7A2D249F23DE731B056E7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPgWq5gL0le5pvEkgARrX+KEEbnxU+ekzNbldbTejSPBscYQL8SbrE1/t1cFNqYSxFZEdA9/jz9nn/LKhsoupNk+7wyVCXIr0ci7/zlaz19R5xZYpuuM3Kz0sIwaYozXuYHBTOatRlq+gkfnzoZ1W+G2gSy7v05iCMVWxhwP6w/gm+1bE5b2x3zgrijN8wsgvh/1X9uNwJnrDQHMkD41QKKgY7CEnqk+p1F15fWCl7I1Ox6bjoEOPLWmrZWIooQ1zde27gk2ah7e76BWrtqe26xuXSC5AARwumzWX3lYig5kL/yMM5E+d2yA3fbyqWAHHAU1R01W8GL2d7qjLpcDkO8dBDqMcgUb0xf0FERwF8QGho9UN+EmVh/7EGXRYnAP98GG+YjITFAroPEv+z4GJhJuRRoyaVw0IHfX1xMSNkdFXvyP1YN6nscFJbbNF8h3BHR/JpZejYzPWRuUA01oghtBZbhHwIhFT0rjsLvLCl3jLXQp+LM2fkZ/UYEwQAD/QidFYOdtZqczok+r8tHddwOb7BB8He5xXrkmUgfI4ZG6XPYkgNFkcv5BhGv8/cVyIzpKLpzS2UIAEdpyLsQS85Znb4dV+UB9SbjJlRvsUq5nwsGilLibdn0UVIKlSWGqllXcXHmHO+FuLgtv6omudKX/QO5MVFMwxuq5dLhC6eiUtbB8Fx8cHJQaIPEdudDKpRH28IV9CbkFulEZ/4JPGlRX7EDoNKOuHcjrmEDCDQwy6Tfi4ca2WKbtpyyf9QRRT9MtlCJujdnc9/RzeHs8iYr5HyWt6C9p7R1ipGgV1ymcu449MyuAit1b29nH2IQe5BrdGKmuIYRWqrP3Mifi4FNtxjKIMaHb+LGuIM80Y1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(966005)(26005)(38350700002)(6486002)(83380400001)(508600001)(44832011)(5660300002)(956004)(2906002)(2616005)(8936002)(7696005)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOuWIGDzmKOd376f5H9ZersSNhVthAzZ+H6Xz2NjtTYOJs5sm4QnGQ3c+j+p?=
 =?us-ascii?Q?tQVY6c/UBZEmWyyaiIGSwoUXbw6V60NDlwCnFja+wjYjmDCtSIrKT4PpB6n0?=
 =?us-ascii?Q?/wdMZ8fUnbXovuVVWn16XP+Ezlhb1VeuvIyw5aAuX0UTOzV5Mep1lYyBUDX1?=
 =?us-ascii?Q?uWpa6GzawrUrd66ITgiamuIwW6PLKOHEQKJo3MonLBXSf0xiwb58CjrNX+O8?=
 =?us-ascii?Q?M7nvKbH27i9Ko8dhW2qQA1czmc6IQCgaTTMYbWpn3XSqdqLOnzNXdNVrdaye?=
 =?us-ascii?Q?68PQ1Oq6tYSb6/3ufBU8EXZYjrlf1A2ZQjk9wMWrQGDKfCtXQY+ihFWSsC+I?=
 =?us-ascii?Q?kE+nCLcrCpU3SgfX1f7cXsr7MfpVZtaVdgheI900dHLS1QHuWFwa+Batyufq?=
 =?us-ascii?Q?B2MtFm2ycpyamkSXBa6fcyIFN825ZQ0uOGJ6licRRG6KvAV4vNT7cKcKuFW3?=
 =?us-ascii?Q?6XTYNo+4X0nwOgY9riOCyPZbKRBeM0AK45CxU+yQuJLgHnzcvLEvR2PW42JT?=
 =?us-ascii?Q?HywjKT4q2pzrIEpDr8p2g/6ZPFOUWEz6qu15W/C/++yqAJ7VreNt6a64m4LP?=
 =?us-ascii?Q?VfDIBWjoIzU+1Lfn2ZDC6dWpuSnSZWu58nS2FM1ujD5qpjnhV+ypNf5XY40W?=
 =?us-ascii?Q?+KMlcJOyaB+j6wj3fqdY97jReAehQvF14Hgov4aFtRMQfAm6WRXVfgf5wbuY?=
 =?us-ascii?Q?jlKer5vSELVknjUdHuZYc6/WE8ZJOtg66q7MvxK/iYpgj8kaNfq5fmNDl9Nx?=
 =?us-ascii?Q?FGPlF6y9I/p3BDpqJ1iTX75zv68mEg0o8alkcZxo3+zj8LWVe5a9QVIHHzDK?=
 =?us-ascii?Q?eVQeSk37MkQQ/SoQU8pGq5J0Ft9k5FYY+Gdq1ZLVq/NE4UeVuGx+aCXXJ4eU?=
 =?us-ascii?Q?l+OR8zrHO2eA83Rib3AcOG4LG2oc3UA82zIBY70heoFmUBjiSgvY2U1rvIgB?=
 =?us-ascii?Q?gA/gyGJtp3MYBvosolH/2HLq8brDmX10k41Bl4omBrCsb98q2V2NSbtACv5o?=
 =?us-ascii?Q?pCRC3pyBeROD4nJCpEiBOFaZ+36HlJw1W61oE9E6/SSclowpgUc6DmhKssRt?=
 =?us-ascii?Q?aoNuLBLf2Ukmu1ljZ5xQ7916UvB7ZH3kLOHAV/KFCDzVWeI6tFTQXwLL4lGP?=
 =?us-ascii?Q?a8uloDKGiFRxKWG4RfqctI40NLy4W4aOzOR0LRR2gHKPymkrXfHHBHsQMZ+Y?=
 =?us-ascii?Q?ZM77Uajtw8IocVCGTD89tECmdXYnhvJH+APozlpk3GwS1z0+c1ie6nYJzfjl?=
 =?us-ascii?Q?ae8lwe3QbzSiug2qVhDXyXB0OdJeC7+W+0HI6D71WYyPr6vXnyBkYa3DhMMg?=
 =?us-ascii?Q?Od2xPludiyKtegxpHZAR0vao?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebb41e1-6279-4db3-3fc3-08d94b1fd8fd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:44:00.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVM01SgF+yqpP3RTH4GgTyM0vLEjhZ6FzAA47owVBJnprX94USPG+fpHnRGVV2NHcGP+DuYI5DJa1iumXKhPLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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
index 000000000000..337c9bf2395f
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
+        maxItems: 1
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
+        mboxes = <&mu_m0 0 0
+                  &mu_m0 0 1
+                  &mu_m0 1 0>;
+        memory-region = <&decoder_boot>, <&decoder_rpc>;
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
+        memory-region = <&encoder1_boot>, <&encoder1_rpc>;
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
+        memory-region = <&encoder2_boot>, <&encoder2_rpc>;
+      };
+    };
+
+...
-- 
2.32.0

