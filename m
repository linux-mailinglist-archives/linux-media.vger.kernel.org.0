Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1669C3E8C18
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhHKIo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:44:27 -0400
Received: from mail-am6eur05on2060.outbound.protection.outlook.com ([40.107.22.60]:57888
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235282AbhHKIo0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:44:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BO+MTJcxBuAxCodYJpBlmH/h4TnCU+SRxmdFeWsjnURwxmpXn25qXklcjmlIDXBE9Y8YnYoHU15bso1gc3ZarXs1PwwqZzHu9fmsJf+x/HQ+ibWvOWPHdOoZuNl2Y1gJMp962Bkrrg0MtScsi5nlbrOTicrHKloQppDnz/K4GJpaEhwmeJn/y14p7cjg8TSvIvLO0/HkKRKa07wCmCflKimsHAAz+gDzGS5kfoK4V3oWNr51Y949H/mJpHWmTyLD6oTRqLWXsF21lzxqeZBg58G2L7yE1/K0eF7EpTYJRXPOe3s8GFA23ebygPLeYU4519CWVY1FzrVvmspPeHRu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3jpB7DdHmmFt71WplG37Ho65HeyNyanqan0uuBVEYg=;
 b=d/w5i0gey920/mjabvx8vO0WQqCa4Cc/U3gdmDkk93rXdlEXwbiMtQhvE+mEqoSjIv68NXR5a8+VxjugdTjXoLZGKhlb0LvSgCiTUOpTu2jxT4X5rLJ6egmuk43xau3WnebDXz5dzyVkkjJ09hDy+u09XDahiQP70PiyjixxgTG0R6xYyAgI+RZynNBuITbYPfbCJyLGdE9r1PrYkHcqT19DM1rEVF+/7hvBEQ7rEwt7cJvBsZqnD7NXBdj8wQQuoEvRJ77GW69/26J2J47x7xuT+6Q/J61rWBmFr6DhSI4YJdxkt+SMETs558u3Z1tzjSTL91niumrIA4YxuYea0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3jpB7DdHmmFt71WplG37Ho65HeyNyanqan0uuBVEYg=;
 b=clHHDD/GkYgHyx5eGY52/Y25v06Iyao7rwuYuEA/HhWWjpSOFaoopJvA4WB8zSs1z+YwabYc/vtrCnWQ6hp9PoNcoHZ+LF5HlSXvlXwRkvHexPfGvv1Ir+2LRIss6Mw7JSKq1WlPKFBoU+cjFNpxTwavJabsdNmHeNVCX7+KuOI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5126.eurprd04.prod.outlook.com (2603:10a6:20b:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 08:44:01 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:01 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 01/14] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Wed, 11 Aug 2021 16:42:57 +0800
Message-Id: <74899fe01678641839be0eea7e3fd35214aad84c.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:43:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6566735-bd16-4906-d52f-08d95ca42a87
X-MS-TrafficTypeDiagnostic: AM6PR04MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51267D59AF2BADBF0D808986E7F89@AM6PR04MB5126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nsA4LjtTUjSimsZe5JmEW4CZhgcm1hfbPeXGTftDxCg/JYXZ5s0koKFTFgDV4RiO1VXCCdCMuxOMj8hIJZ/63sjZRrCLbaRtxa6dT0EcJ89hsNkTOkGlm3Ux7plFoO1XctQlnbD8g0C73qlcHiuJISWM2wyyTq2fvSSmYclAutEHTDBvEnpqKXviDs77Tikk5KOnSHBJxr9I/twiY1tq6FTrgB186dttwFJimKbuxpJoMH7ZijO/LGg0A0Cb9N7y1cJUd/+QUCUfbcBlVuYCDZJg49GfD+IP6A4GE1IokYm6/MSf1BxCCD+zfQOOn6udKI8e+wxwE8ilnqPoOcs7ZFlUpukny0JX9gbl5nYJVB+ALkD6QPVYWBjUzo/SGzZ+SBqex2ncNgXfPKS967JypdoiPpE1OBMU1cU60xpFGh50Aj88gykfMO8/qRYiidSIsmV7isHHKUweF0mBs8V760/JDZZiJSRwS6V8GB5BS9ubkv0lv53zuko23/WC9kW2t0VaNJUIJGC2w2guGtLqSE/ImroMcjTOgfYgzNOtjtEwyYshpCMhXksiwtQ/UdTttBQiS9sVEhhJjbYs7ITpx/yQv/Mk/ddmzlDEQWPl7ebtSZAhWRWMfzVLkRf0nmiS8gTV0a2zsJiloisfeOP5zfNMCaExHHKxY8pbw+zJP3LpDEjJTVIX+QciSq3KD8bmVjV4vdAnvr+xRNSeOS2hEC4KTbf+STIZHGEXpuSafKR9Z0A7BrmFZBMDb18SVzlxU790iWBw2INUGIcK0a5pBi6CJP9FfQhvfcFABNOUWc3mcFAmiKGSSFZfcPD4BzIVKJeiAsWaTwgjPVVBB9k14Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(8676002)(4326008)(38100700002)(2906002)(6486002)(966005)(86362001)(38350700002)(8936002)(478600001)(186003)(36756003)(316002)(66476007)(26005)(44832011)(2616005)(66946007)(7696005)(66556008)(5660300002)(83380400001)(7416002)(52116002)(956004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?syb96K5xT6n0PhyqKVVxBnQDX0pIxJng2my2466gJt006vENzAlS+ZfVIssM?=
 =?us-ascii?Q?ZutTp3LQvr4KVa+cS0KFnnvBcjY23/Isra63akdyz1Ontw/JI+O0m6XNZ+oB?=
 =?us-ascii?Q?f0e3OWU+hJweHDFQHTNPtzkbcaAajtyLELA74z27tbAVXE/bhREQ2mVlFfVM?=
 =?us-ascii?Q?75DDzBAQcLgzOWjYhv6vmAjLqhudfGZvItZXB7lnyMbkip/yqP72MXaAoAFr?=
 =?us-ascii?Q?+gl5RloaffmwfL9c2UuYChW6ohoi7m8nsN+TCGYS++nuMvPWBUlRENKuBEgD?=
 =?us-ascii?Q?HT2i6IEYEmJP9ASvVIQHFW9IrjRwCcW4j/090a10we2gJrA+c9jpdnrWXm9d?=
 =?us-ascii?Q?U5EmEegUDU3936gWG1gGXse/NO375tlCzh1+SzdeMSOr78wiYvZI04Eljona?=
 =?us-ascii?Q?rGKYlGLPOS3ZFzNH77/0J4RBbQSRVqobJb7k1KLjUw0TLTf88QS9JEFDfKED?=
 =?us-ascii?Q?XzmH/BpnT7bpyZKEuL27zRveAAWjLNZMn0Y/c1NZDFOPU4rY5ZZow4AHTKpm?=
 =?us-ascii?Q?ys0rM+LvMpknLFf7y8Vraf+4/xPP2ufL+yEm6O96rqIpkDHhGIzWxo1/i7i4?=
 =?us-ascii?Q?DWxwy6dLKYgEG9VpxTRoOXxebeNIeRxeRGy/mZSK/v6Dm+CzFqY9q2ecN9sD?=
 =?us-ascii?Q?xdmvLgtoVO/N3V+31s5rZ1850SmkU0PVIfDzZqd3/yKggrCMawOg4Q75trGv?=
 =?us-ascii?Q?GMu+c3MmDuQtNczs+4T5CuuojJS/nJpSZD3OgTMmMtZUPRBxQ+2/J1lmJUcj?=
 =?us-ascii?Q?6LXo/JEsqunQHv7BOQOeKxDXOIn3Iuues23TbdvuuenI0cxDLugt33PpTFns?=
 =?us-ascii?Q?KOsVWLSZ51jlqZFgAcTHKa4pJIRkp5+d4EVyl9azDVn8WjgrQq6vblmIG1cz?=
 =?us-ascii?Q?7JTliTTr53lnU2O+tjEENkBmfNn+9orWwjgHqRUjyjvu0r3X/TeV54hWIdBs?=
 =?us-ascii?Q?bXFgHw15pYEUjV1sbCf6Y4lJgOKWp+BbZ2QzBi3n8LRL0gR3G1UQTFjK/MTK?=
 =?us-ascii?Q?IEnD40k0FmL8Tz6aRoPHW3ctsuDEjO14OHR9GyDG5DlhoVbs+DN9xvrqsEGT?=
 =?us-ascii?Q?mwCLSenXhtEAk5rCCgw3jQcaa6ptLJdDxXSV9MPWLSLOgSPODVDJaKYON+EH?=
 =?us-ascii?Q?HB0vIMBxX3pYIpMBFtPx5fnR7fqPJPSdCNJqfcv6xSQmMOg0kAZYZSKNyWXx?=
 =?us-ascii?Q?rERHudA8po+8GK3pNLKMwk9yWPfBYkHPIh7yuvSE2DasEzWdumkbl2B6DS7s?=
 =?us-ascii?Q?GOFoV/qH5QgJ1ti3cVgQKSZs1N1GYOI87G0CHI6kVkhTyhp5jD0dd/46YU/S?=
 =?us-ascii?Q?t6neyMZqLyqmK0N/bQIwjCec?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6566735-bd16-4906-d52f-08d95ca42a87
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:00.9501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rBZOQBFfVynf1/FERS9V4uAURUtgYvRUBFfY0LYXpvXqM3Vzw3T31qQggwXdN95dxPKFWjGwJO2wrk1OIxNPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5126
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

