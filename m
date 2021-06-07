Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED0939D7A4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhFGIp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:45:29 -0400
Received: from mail-eopbgr80075.outbound.protection.outlook.com ([40.107.8.75]:34947
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229545AbhFGIp1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:45:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj/EZmvrVTLtWJWXdo1RePI/bsGrkn3B2jYl3noZA+uHGqjxPdfunh16zPr5oRsmEBa/TOHUwxgPMGEiOUHNcDk0KIwH4CnC1O3FS1UJEEecrD9LIArYRiJgu5KPoXOoKm5B5rvWjxjP3XUVg1BVvoLV02I9oeUsKinmk/Lwjnp09MEYCEx94TIHnwwS+syx05raMFxeJhNW/PpqnqXLqjwjhPJzSahTuVnX7YxY7HOXmVX4zRhDZru2lN51zUFtzSCAu+Ey9dxwvCp5LmGLCMdy7P7+bO1g3IR1rJAyZe+rWHbvoofgIEZFEGxzr0VrM+JFMriqsYbkCEhJCOwLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtYBrH4Lx8jQkY0aQhzrgIvAUEa/vfxws1mpN6pqJt8=;
 b=eVE8wCjA/ztmJ1eh32JNXI57BZIaiTN7dP9bOsm+jjwvlFjO2vOKDlBEUqZEmwqyS6sjibFO5xQ9XBpZq7U2e4vmPm99Pv+y74tSx9kSA90Z3GaegkXEElCg3WoFpQFF9CMpXaKFV1wHnnM7XOINzaQaut15g/H46ygV7CgbQe5fxs6zzskE8wIY8EArdMHe6tHmQLwgA1sg1cUjPdNXj+/xcyO3wrRbCW9SfdG0lhQqGQKMZluLr0GnI+DjxVWdtQ52PaaLPa9nwH8FODIFClFoHT27m72tvGUDeUgC5JQg5ivrjdphtDwKsskBhyNPubZt9knb2XJ0e9pUYQLg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtYBrH4Lx8jQkY0aQhzrgIvAUEa/vfxws1mpN6pqJt8=;
 b=ZLTzHPiKfeFdiSNOqGyeqRa9SDXYik+Kl8uV6zEoPosZuwT6iDceFXPwsZHV/dLWr5UG4G9aCcXEivqcYEJQBeSPs8cxH4cZQfPQl52KST5jFtQaplSL5L44GSCpbbhJuPmSHVoNjPVYbDasrynn+Kf9NL8oeLG9glSMbyKCrpI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR04MB2977.eurprd04.prod.outlook.com (2603:10a6:206:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 08:43:32 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:43:32 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/13] dt-bindings: media: imx8q: add imx video codec bindings
Date:   Mon,  7 Jun 2021 16:42:48 +0800
Message-Id: <7cd02157f9a9cc7a773bd02137a92a04077638e5.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623054584.git.ming.qian@nxp.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:43:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3371c5e8-e16e-4d30-144c-08d9299054d3
X-MS-TrafficTypeDiagnostic: AM5PR04MB2977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB2977A69142E8DCA86DB67F15E7389@AM5PR04MB2977.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x52NQChW7Y/FJIfdAEWM38OZUpRH80/MVR//87+WOURfjJvy7NeV2c8iAtDMeWtoo8E/gujUgUPyU6v2+s8ZfAD9faXJBBTrc6yuUsmOHjod9k6N667BFvHvQM3qzuf9+Id4T6v88LoCT5mKwOC9u0XzElJ7vroUiAGpe0dvK5YJESNvsck2AzgEcn60TD5r93htaWrXH9FHC7QZlj/mcqpHu+zy91uwJHHx1go8eR0/MLO8OLQNUBrpqdFYqxGBawZwqB4Yy7Yke7petbl3bfj0PN8qk9QsjneC9q6u8XoUe8Oy0Kh41Ida6IQM6TNmpNddWFoUqbXsU5ru9scgqxNvEnGkPntEoQewduLDeLCjmUymlq4cP86/r+5lNFg9QAPy6mRTHTNd0FwlyfkcJEbr4EINXVyGgAuJIHcAf/68nwtvuIeZwndwD45psHJG547PPxDIGNBYo55Q7SJzm8/DDE5clvODMtVhTAb9jzAiOvI2SCv0VvIVEiofHShOvI97wN0WILHOhRFDHqO+TUn8yviMYKqI44MQWKyt3clRSxiuXXLr/G41xMn4wK6ixldWpOwPht6DTGsWl88E8S2wt1zmiUUuxVg+sVoLFLVWZeFGEvC91Xp+zsBTpbLluUDYG87opcqbOWzLcdgSRlK8WmbSqEE1MHHzn2P5L827Su8PkMyzGW59TMKqdAVEUnWjoTWN5joHR1oSso30VqkqTOd5a6a0N6ynPlFPA2iCQfs1PFe6g2X3L1T0718I1yaTNzWId/qklRWPz5THRdUr3+nt5HkjWn7EMpudMsBK6vyJv4a2cjuVjS2IOF+Qg0R/irS5FLy4oYtjVOqIaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(956004)(2616005)(316002)(26005)(5660300002)(2906002)(6486002)(66556008)(4326008)(66476007)(186003)(7416002)(6666004)(38100700002)(16526019)(66946007)(44832011)(52116002)(7696005)(83380400001)(478600001)(966005)(36756003)(8676002)(38350700002)(86362001)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6a1ja0yjnwjsqiE0KPnCZtXYqIzckR+1N6/gSGm53027WSRwOxFapQBu/rKt?=
 =?us-ascii?Q?LO12VjD38kHwoJJmsu6LSm+c/di/8s/ydVejLlYKfT4uIhld0ujHcHemQfQ7?=
 =?us-ascii?Q?mQVOH3/1Hgxu6Z5YOscgmr49AdJG4yyj7MKDNTyJpk++EhOF/nJJszCWeV7c?=
 =?us-ascii?Q?XxN2nYINbHVCWf0tx7CpLaRRQ/tsrskExIFSBFi6d9znLwINUMRm35TRvGom?=
 =?us-ascii?Q?UWhXRbX+AuuWTtCX1QRxXUt3MEDxGgNuHRDCrL2JrR9yfUiceGko/bKgSO6H?=
 =?us-ascii?Q?3k4G4LkeapgGSwFO9grA8pll8TanX18/HlKpe2KMn1+fG5R2Hubg2QyQxZSl?=
 =?us-ascii?Q?U7thbfMos4li/afbuN/DU/qftLg2PlFejmzM3W9/Zy2LlslRgp5po+f6S02y?=
 =?us-ascii?Q?kH1tYfWJmhjN3IoDwRRZUlMTuiwsXQXUMA/qMnNi8JRISnI+2MKmTYNulH94?=
 =?us-ascii?Q?j3zGdJhXgCG4PgQK3apdbyAJirG3ZML0Pthgtr7u22UkHVSPxaydsk8KkVnX?=
 =?us-ascii?Q?lA/imWAZPYIVg9KamgZiZHaSBDSKaQPdhJQzALpWcnykLYF0xZpV+q67TtA8?=
 =?us-ascii?Q?OaYu94UPJfsx6sjdec+rNIF6Im36oU0lmNMS+FOTmjivr6LErc2zBAfn3nlw?=
 =?us-ascii?Q?NABaKVerUkiwxXBb05khD84u61pkbl5YKaamgYAPYe/EsVnx4gJPq4PF2wK+?=
 =?us-ascii?Q?Ue7WwAUc0h3/6mSwtehbD4jlxAEEWTGJLX/2eoK2EPmtqc3Ys8io0DN4ChV6?=
 =?us-ascii?Q?Rxm3Zdud0UXqg/4RIlV6DxSbKXc3+gslMD1HKJtD2pEmSNkC91HsoN2JXs6y?=
 =?us-ascii?Q?2jA0Qadu9lB8950TVt9SXa73whuHuKRUfv+oKZdf6aySwOhUuR0eI5eI3pJS?=
 =?us-ascii?Q?KvqRisxVZa1oDsDm/fqITRI1rLtWo5wxmmO8KBAHa2T+yHqXWRXtBz5cfLV5?=
 =?us-ascii?Q?lK7c2faIxZ+NHJDYP0ZAl4TabIloW9tZsibCyJrhVNw0v7FyB3sMjXITUv6w?=
 =?us-ascii?Q?+7hIRU4ox5uASnQA0kqjcbykrB9ubb2MYhyi5cD7eYPopIwJr9pZemQWXdbI?=
 =?us-ascii?Q?7EodJlsPxMKIGryTCWofyR1kwfjDgqtkwUZRDDlfg4iv77ZORLz4vrGPF8tN?=
 =?us-ascii?Q?JDpCh8ji9OtGJgD2QejAvifzWV0dkvwZf6U0mki71v3SETEcIvxidvh8xbOv?=
 =?us-ascii?Q?0zK0plY/4GOAQPxKDxQ/8i8lzDleCaYArOK8q2LKAr3su5R3r2sXDtrOYUpv?=
 =?us-ascii?Q?G4yb62zjZyMbJulL2u/QQbjpzJh63MPwD0jgiSNXXb5yKop1t+O3EuqDpsUr?=
 =?us-ascii?Q?cLKBtZ9URFee5d1hdgrPaJ9U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3371c5e8-e16e-4d30-144c-08d9299054d3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:43:32.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jrm9z5NeYvGAgsk54Q64AMDhWbWvD1TQp0iQ29cVMBcAKnFwYxMH0cZlKZcnfftCY1KeYf86ZX5+qQ8grIiJuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2977
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for IMX8Q Video Processing Unit IP

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8q-vpu.yaml         | 198 ++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
new file mode 100644
index 000000000000..058ca69c107a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
@@ -0,0 +1,198 @@
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
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  $nodename:
+    pattern: "^vpu-bus@[0-9a-f]+$"
+
+  compatible:
+    contains:
+      items:
+        - enum:
+            - nxp,imx8qm-vpu
+            - nxp,imx8qxp-vpu
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
+  mailbox:
+    description:
+      Each vpu encoder or decoder correspond a MU, which used for communication
+      between driver and firmware. Implement via mailbox on driver.
+      (see bindings/mailbox/fsl,mu.yaml)
+
+patternProperties:
+  "^vpu_[en, de]coder@[0-9a-f]+$":
+    type: object
+    description:
+      Each core correspond a decoder or encoder, need to configure them
+      separately. NXP i.MX8QM SoC has one decoder and two encoder, i.MX8QXP SoC
+      has one decoder and one encoder.
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
+
+      boot-region:
+        description:
+          Phandle to a node describing reserved memory used by firmware
+          loading.
+
+      rpc-region:
+        description:
+          Phandle to a node describing reserved memory used by RPC shared
+          memory between firmware and driver.
+
+      print-offset:
+        description:
+          The memory offset from RPC address, used by reserve firmware log.
+
+      id:
+        description: Index of vpu core.
+
+    required:
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
+    vpu: vpu-bus@2c000000 {
+      compatible = "nxp,imx8qm-vpu", "simple-bus";
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
+        print-offset = <0x80000>;
+        id = <2>;
+      };
+    };
+
+...
-- 
2.31.1

