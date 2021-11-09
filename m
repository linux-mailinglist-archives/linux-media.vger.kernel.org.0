Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A665A44AA2D
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244715AbhKIJMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:12:38 -0500
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:19969
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244701AbhKIJMh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:12:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1z03SJzgsWfBQaHT7/yNFnZ2ne/h6KXe0ad3rvopQiwGBsbsfGH76oZfkk2srZG6AFhlizOJMWQ/3nNC6qd056Wj+PokH6SiSjKXFy3Hy+q89ks6nmwaqQ9ejzL1c6IG8V4Zykwp1xleUYx3reQIeCiHxg2S33rU3DKxF0GiPMqC/GJvhUemP/Q0OKMyt498RvBh03Fe+Q48JiqwWqcUxSTSpsAfs4FAlofinc6wrmOLnLgUJ1drmWzXmDs6beEV7CpJLapHZD0G33M78ndtpqCl+WJ5zpvVENkFje7wq6POk19SztZK8YqqrFn3tXi/JdHwvMM7yYyMuiTox5MIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hya/3bWzj54cTNXLhUWYF9C9ssgciYXjOVJTTdcei+0=;
 b=SnHXI1WZ/9RJwOrSaZPJswHis18u77TdmUHS5mHmAGoyhndCcWzUdZrXnIJ2gr6YXazkvkC3Jc9rUsb+dyP/c1lBpXy+ZzqFCH+B6sd4R2e8oZIMG4HnYUNkGVhRUHEP1Jp8sVLzUayeP+c2WTJCuNlZfZEUtoICB53M1QnJZQ+aiEWjBY3OaQRosLorgIoc2Crrf0ZT2YMZH06bI3fmS5fgd5Wg76TOuZFBFAToNjnzYq5TWdVgkasxJEqFTW9oZROeKKS5/UMriHj5waf99DVzb7oN4ebH6cXTJy4j5gVRXHVUfQMFLbCTsnQzGE+rOQaNC9UEHnimcDLhJVudqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hya/3bWzj54cTNXLhUWYF9C9ssgciYXjOVJTTdcei+0=;
 b=Bncc2tjynvvkIi7rjAa5FOfnOxVAZWWRP2cHHsv4ak9wJ5Q/LLoK9FX/T6QrjkBSryhUZNzQa9VMLtn7aXuJPb9gGv8KRbdEKJVAg1uK8ypp5xlRm/XOn3TWEJ27wsleq0vRxKarCzxMo2SSmqsVhyPp1HWPq9Pn/uQRpjY8q5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:09:49 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:09:49 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 01/13] dt-bindings: media: amphion: add amphion video codec bindings
Date:   Tue,  9 Nov 2021 17:09:00 +0800
Message-Id: <f5457a9c768c8d04090f3140bd5c71bc4f497dd5.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:09:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26117ed8-e7f9-486f-2132-08d9a360ae62
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB827852194D26F0C879AA9D9AE7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Ln+QHfvuGyVA/plgn7437y15tC5uiP3KWExcfvHmvyKN+eDVTEB2glz2ms+h99GIfsd4sV+1FYRmaxsjYEPr2hE0rp6GlZfcv4px1wR0TuInmOSC6weXPQ+YFVyL6E6qqHfvcsTdMHnJYd6CgJKq6i/LMPqAzCPTEMe3xuqpGY/PdA1W1ULAUWmxx08o4a91XEQ92llzP6hsE0csDbsCvcd9kNeIQVCB3hlkqCntTyG9fbi1wLJch/hX3yu1CYGtQEXj8y4u+sNEaBWNY44XbfWzFDkHb8+iylnhcF5O6e7PyhZAQLIGIql6F2DrJr3g+yubhMEk7QmJFoeL5oJKtW4Rq8iLJYmZouVuSYTYTLKK40hsxUG2ejXBOIeR5+o310bkbxs1s+N8JZyBvTdz6fFsg53hNwa9KUAkqYJ+3NAfXddrka7n3hvbwZXnglWvl3JaHuW6/rVfzALrjHDUvVDi00eN0c75G9UKzhjMbi803IwE+ETwbBmBW/9Gx1goZkrLF/oK5Ti+IKoju9iBazt1xrYd8fcq6HHNPytybADPuQDYQIcjVFn78zKj923UpIob4ipOm0hh1oxWqceqYuvD0CAzxK7vrmNfmHxN0k6y8s/IWZjJvZb4UDpuyFU9d9/VcIjGB3ZMJGC2n0zd1uYiqqTrRF2OfnqC8L1MMkyclxrNbZnzo9/7lDnZFF4hZpASW0vREbjqSM6wQnHxpMi2wSj8CnwyQAEBSH4Pi0HtyI9rlRfOZ8fpdbKpecNoa34Co6Th3njZLn175uFrZrnhO9boutE41uCZ2PO++f7icRt21//qjxw14wJQhci0j3Nra9s0ivgtAxARMzj/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(38100700002)(6486002)(956004)(4326008)(966005)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(66556008)(8676002)(7416002)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MiZykztUjpiMXmaVshY4iXMQC0OTVJzs3b/9JkpYhVEYuV02uFxccJM0PilA?=
 =?us-ascii?Q?rP5a/84m3fsCkEp278tLey1MGAUr4KX4ocfSm9TeSqmw57ponIyAqJ36vrlu?=
 =?us-ascii?Q?XaklEzBnUF5CLxxzX8h1eNgPGcLr3mZsgVh7lVJgwvY1qsepEv+G/1Uv8jlj?=
 =?us-ascii?Q?xq5On0GPZIt0pGEQ7pUENGzmkQ6WeapQJSfv5pLUv6cPtjKDlal1DmHYtxDY?=
 =?us-ascii?Q?jWMxUVsAVqN7+en9a5mSBLwzvF3c/fsx46ZaMktfaJdTMb7cK1Jku4btGOSA?=
 =?us-ascii?Q?HIxRWbdOQISxL3/wROJIOyrg15faPlR3yYiYyKa8CTOMjRi1eJumO3bz0mEw?=
 =?us-ascii?Q?HwlIeFzNbdMhjWUMUGSU+ej4nXDaBK2KJkafz26ZWlp2yjpyDf2tuJs57U7f?=
 =?us-ascii?Q?P+UdFgMn1saFGrioYlwbqrVbu9sWhWYAucdSzDbP91ebM+QuVNgYlHsvv2Nr?=
 =?us-ascii?Q?d6xFz1sspgUbR4tTkgxCxNifONXrtZ+w6YCtEv6CTmbWokcWOoJ1T/TEpEYF?=
 =?us-ascii?Q?8LS4NvOZPjj/fa81L987w9DbP4qVA9YTxVpxLFW8jD3IvHqQzKj2Zc6mTWxF?=
 =?us-ascii?Q?0bnIrkBFTxlLQ1YzVp40rT3g6KCn0uV7zAuO7Ldwj8EYkFk57KC3iMJlpjgQ?=
 =?us-ascii?Q?09NkVqA03th/rL8cghRX07NESYXvaFeHbvaUTmDQvILbQvzLU0AYTTjvGUKS?=
 =?us-ascii?Q?cS1MO0KzjoAQCGDXAGg6+2wZ5MTH5mR9HIY6PrAT9arNb5UlQ+DIoUnh44zL?=
 =?us-ascii?Q?l/BcLnwXDQuHk1idzVmpUt+UaDWrhiKX6+SOqzFZCCqMti2eQkZrgx3gEniR?=
 =?us-ascii?Q?pJmuVlvr2OIwCOndmViSfBUNsQjH/PtHW/eeDu2DIXhGr9/gfSXqNFHXqo3V?=
 =?us-ascii?Q?zpFxxPTkN6RHS4Qn7LyVK3+wH4eUrCWzFr0mzwtxc6S5BZ7AjH/X3wSOiSys?=
 =?us-ascii?Q?StIfkDWHX02OsNnQHhIp7LtDnqHDtqkyZ+Vu4otOWEteJ5JMszIj9FrYOtJ7?=
 =?us-ascii?Q?tI/HaCFc9QrKgL5/T3Tsf1oC7wcLB4xuj3X6Pap30lKsgj64yqrsZvsC0XAd?=
 =?us-ascii?Q?cKEv6s93kOeD+k1vZmDS8+V9i9wF/v23mXd5NijZazki2VjEbjsQiV2Htgn6?=
 =?us-ascii?Q?+vQE3apQMXY8WNz+OIG0X5C/oNB6Uhbbzdy3NACZqZD3wQmKw2lspKR7x+za?=
 =?us-ascii?Q?IkNpV/0r0zdWxmvo7I8pklF4w6QCjnXCoKUxht/AiVSxPm9sDXfo7p3E/cSU?=
 =?us-ascii?Q?ok5hiJsvFleAlknpMbzuldP8WspqYnrOPxClI+LCccPsyJP3LhLpDqknuDEq?=
 =?us-ascii?Q?sklAH4Yy4TcSkK/NSQAU/ZRikNPkJtuyNSiMtXTu8vZ7WrK7rptJGQnYswha?=
 =?us-ascii?Q?HokDPbMtCS7CDBEXZL2aU4lPvLsub08BcW5R3a9SHG2456ll9wciBMcaO9LM?=
 =?us-ascii?Q?r16y88FsLYsRiAjflyS1iHhfnW6dNrt96jwOfhfZXDqPWgeZZtQFKfQA+PGx?=
 =?us-ascii?Q?H26fp7nRI60bdvxWN8g3euMpvW2sy7ZxnHFQ/mx0oOHQqF8igyEVfltFEImw?=
 =?us-ascii?Q?PZRnuQwdJN3egcFoFmlPKW5ewJJbzuFajDdpFRwjHnuYYMcO1JQ0ulVyLQjj?=
 =?us-ascii?Q?GzaN9X/Kloe0t74bzWVZSfI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26117ed8-e7f9-486f-2132-08d9a360ae62
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:09:48.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGgvhPxLPXAd12iKR/yV5WvPMJoq7WZaBeD4ZQiEk0LkeCXmURqlw5d3F7Io1NtlYlao/WXwht0/C9g1STAw6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
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
 .../bindings/media/amphion,vpu.yaml           | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
new file mode 100644
index 000000000000..a9d80eaeeeb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -0,0 +1,180 @@
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
+    items:
+      - enum:
+          - nxp,imx8qm-vpu
+          - nxp,imx8qxp-vpu
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
+        items:
+          - enum:
+              - nxp,imx8q-vpu-decoder
+              - nxp,imx8q-vpu-encoder
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

