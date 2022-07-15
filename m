Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33EAA576326
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 15:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbiGONyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 09:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234025AbiGONyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 09:54:01 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5768C1ADA4;
        Fri, 15 Jul 2022 06:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dx44Z44RSvgQVys4ikYqVEBBhu4SlWzjEhH8BXf3GVFtJz9j66QHVXqqoW4XxS5wGwDlPxUcbYuIsAfMLibj4x1XIzD6FXWN8Oo9UdVA8rSwNuY5JboEyQKRB7Screy05MG7Bl737hi9KgMDKUyD+SwaMRYYFJlyW7fQ8trp+7dDbkwfBjBob5oFRPLJg1oBhw9toIcvNF7nO29hWOUqcqJoWHnxQ0expmNl5gieArbENUAtTMwo1tZ49cAspPMVViDCB+VUPtKuPbHw+Ubcw+M16m5uqV62Pu98RlK3L2XyvPL00atesI9qQzdgPTlF/JbPgLTgGQn2cqh2wU0xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMkngJh0bpkLUQJek7tkMX0t7mASgAcmSByCfPSzdF8=;
 b=AzxdIBCzJw3Z9jmd3vYyUACAOTQeJ3LVVpTiuvkhAwqO0hKExl3NVQhV2VIiSUngOUm0pMOmka4sqVISzI03T20xgs3dsc5UvToc7UgmaAsRHu5J+gf8IxCtE8VC060OQTXp2h/Z6R3CwQ1KWLqTL4J+wZyvdzpoBwzgHURBREm2ZSosQDXnr+u2VMQG62K2AXNRXhrTjPunbiRpL5FQ8IvlaHQ9RkpCQ/pzI9ZtUEYyveKwnpL1lC4V7hvHiU5FKbeRFGUgvmMoZkge0OVfqvC/GwfIVhWFuausPHNpCpKUzwf1A3U/uN+EG3OG1s5pgn4C9MyK6x4NIRm/Mxj13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMkngJh0bpkLUQJek7tkMX0t7mASgAcmSByCfPSzdF8=;
 b=cgBTSjcMBNTfKunC1mqYig6aPdHQQDzJlGRcpvFoQQYua7xSK1r54rs4Ztbz9DhZFC8aIq1sWNl+UOfv7U9OHaVauR+RuENueR6f9XDSafYUw/TPYGSr6S4snaNGl7vRSpDr+uh+M89M3KrSKKnddv5409sKunCyOgoGL4A2dik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:53:50 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 13:53:50 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 4/6] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Fri, 15 Jul 2022 15:53:27 +0200
Message-Id: <20220715135329.975400-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
References: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::15) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e169d7-30ff-4169-e9fb-08da666971c1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LE2Q76e6WJeA/DqN51tgse7As5z2djC64LfGcrYi/kIHp7uyCLJ3tTe+fREiQPHkJmUCb6YaKx5qpsa5qkzYJvtzUdNH22yYTd+Uf7Gj0TMMcS3qxnc6Ym7j0UtXUh9ubSa+4l+Iae+Be5kPuOXFzNs3KBVuHcJoQzjhnyyxs2SYBsjTnkjBb323S+le0tO5uWznK+OPv1wfAcuKD+zIjuOFn+mp+skFX1w2SYTlIpRH3VD8hHGogh9T4Xf7N44VYTc4cPcT7hBCZpAaSmpzfnlK3Nl050w8f3cz140dkfGBi2q7xO8/IdtPk007HuEPsuNfIeC73bvGUKq4dWdNq6+UrMwhSi/zV5EK31DF+jfvQmgE4+NdXOIZBgLhQd5b0Xv97s58Fyfim2UAQ7Gq4FfsxxTxz//i4YzRME+ZmmAm/KteQAI3gaWT7u6nOrGSupygvkylQBzYNK+Bn/VIyr0uoQ3MBHV1LSBov/6chOIyNHf01OafICXEcH2cjuP6UH+UcaPFpZawDt5MGcCOC8DDPEdOQPsbvEO7m2hVI240LU8Wgfy5CSLQGrQhpa4Ujr/AFWGVO8U3C6fr2kfS7XrWFzzpNaQ1mZUKYViCibmFf7nLaZ/O68YPl64JquI7Nh13BTPEaUI9EoMEA213NaPWRpxHoARV+sum2rrAN4bbQeDkqQuMd/FhDCGY/gycWB33xBr/8eNwOSf6F35UJxnbVCTCTF2fU6qAd9hxwB4wRwVza5EdcgLYuXjUExAX5FRy/G3qiOaRvxNH0wQoigliaTmSAa0LegrwHy+CKbuXwcRyju1sLVSIQGAvc56KX61d56DGFouqtuTIezxlZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(52116002)(54906003)(6486002)(86362001)(478600001)(966005)(6512007)(66556008)(66476007)(6666004)(5660300002)(41300700001)(38100700002)(66946007)(316002)(2616005)(1076003)(83380400001)(8676002)(2906002)(8936002)(44832011)(7416002)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cph35du7wMUXS0vEgAP6CSq6QXsRVfd5fJPPgteLL7QKiq1pWdop7xcaouI2?=
 =?us-ascii?Q?w0xxx3jiqtH8jLquxKn2zlgwfF4BMHIzBKfy5utPK/NpC+z6XmnT9iOzRiAj?=
 =?us-ascii?Q?zUwiDqa1ZRn9hykooRoz6UKywf3TRabqPfT6QLl7Rd4AWb0MTxNkEziSmpNv?=
 =?us-ascii?Q?xlfu5W4Ir7zsRRCCalrFGr/oDfVxFXlmQrJudhir+oiPPGCBha4iXq0tuPwY?=
 =?us-ascii?Q?gj/Dh0hbBLKZ+x1FHj+bSiSNSkhN4a47aRAkO2hLLCZqzj0ne8R1GqAYovYZ?=
 =?us-ascii?Q?7c0e6erw6ZgQIX8tNk+qyyGLFYBhqAFPHRITdTgxKNHdT3p4uQks0RLp0Y3H?=
 =?us-ascii?Q?jVeBxdFs6ggl9mJg6FZkfdlN0aF+rqeqJ4irK0Ej1JRgm+jU9YxdT68huLw/?=
 =?us-ascii?Q?eIKnZiSiID/I1oLKNTnyWyJ40Rmg/8asEMKPCB1KMR6mnSS/dNjo3I+rAgeB?=
 =?us-ascii?Q?vctKJGyt4pl35wEhhy226msEp9/8jFfCv/psDGGMJIwqUrNrDHN6Ke+LtMpZ?=
 =?us-ascii?Q?agddm9IiwjqgEyqqUq1l/4WLC4/WEwLFZIBJbkcnZA41NklxzKrUZB9uo3JK?=
 =?us-ascii?Q?Na5iCsoRQE6MdDTnIgkgN8UE2uHogztTCe1TTel+7Ru312OH+SBlpMbYdHA7?=
 =?us-ascii?Q?9vk5SIe8mMoySCkuvvZJIGf9VVMyufTlK7NGzRkMv4ez+NuqSpsMRPeKMQh6?=
 =?us-ascii?Q?nxGm+g8ehjr2ZkkuVzK5NkKTXwhgUnbqBkoqkI8hX0BN4adWrI5Hj9CFDbEx?=
 =?us-ascii?Q?OL2j1w9WZt8v3H+LaW27/KmSafZj6IzKkAOLhJSDTx20ZJMYGY2WvbJUS1To?=
 =?us-ascii?Q?/C5au++SorYZURq27Avk+Xw6DUsEQYLfAJlMG8GkHqJbM104/9eY+VCon1Cc?=
 =?us-ascii?Q?0DK+d1FPaXIAgR9SrKB6O+HhX6MEqI2Awb0FdfYf86xuPoM2lNEhWCAcwt0z?=
 =?us-ascii?Q?t5R9g5LQjPT3dV8pfw9WsumavO8kmgb6ZQfsuoqza9toF/IIfHdoC0/fVRfN?=
 =?us-ascii?Q?sceEo0Tpjzq+THxLOyfkP9JRxvFgCWH1OeXdiUk0HLETqK63zEnufLDhjHT0?=
 =?us-ascii?Q?9XXWdNokn4cnKo0fLR4r6Po/O4ArXkMXdG/k0o0SPzRYWY9W1rLLOnf3gRR1?=
 =?us-ascii?Q?lEV5W4/Ph6S7e/oWc1+DxdjrZ0t2ynPjnPkgjON/onTpNdrrhLtyr8APhbOA?=
 =?us-ascii?Q?7W/4VBo75ghBga6BOM6dkHdhOFH/hI/KuXsNIXPn5OxxYTd0XdhzlK7y8rtc?=
 =?us-ascii?Q?baY08+VHkitPdiaLQWKygO78lcNiIoU5yExT7Wk1Kk5LjSaf7vO5WhR59yDp?=
 =?us-ascii?Q?5utkxejCezUXT5KSqtgi8PiJNVklfwwxlYUUynezB2pVZFsawCYQMvY7PrTv?=
 =?us-ascii?Q?k0FZCyjAuFhLPUkdHpZP9OL3b/eyrgB3I92nNT4yS5Ye+l/S/EASB6mzDf4u?=
 =?us-ascii?Q?toTHIOsLmXRkcUfR2TVyL9oe3G6Oo+k7+cPVL2vrauGjLvDwUCRRDBGJk6i3?=
 =?us-ascii?Q?fEDAJnDVnQZ/6c6hh9AoJ9j9axeM4q89KBBweI2n8/Bk6KuMoroG1ZBe30x3?=
 =?us-ascii?Q?kt3wSfQM60ydJEM8rDH2wo+1T/jzuqDQs8i6jUHba5tbH4MfdDRWw1tu/awC?=
 =?us-ascii?Q?qrXSHOmPyWdEix+rJbxFyfIKcz0L2zvjBaMVVLi2u/sGmRovhqZtL6MDtNBf?=
 =?us-ascii?Q?fmI3sQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e169d7-30ff-4169-e9fb-08da666971c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:53:49.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9trCLfVMN/VtG26afEkUSFrlhQFkameQcnnM3r9BIKmlTdSwN4Qfc52LyX+G4NoCH/LgvyvD6WDd9GM1k+kE4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT binding documentation for the Vivante DW100 dewarper engine found
on NXP i.MX8MP SoC

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
new file mode 100644
index 000000000000..21910ff0e1c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,dw100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MP DW100 Dewarper core
+
+maintainers:
+  - Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+
+description: |-
+  The Dewarp Engine provides high-performance dewarp processing for the
+  correction of the distortion that is introduced in images produced by fisheye
+  and wide angle lenses. It is implemented with a line/tile-cache based
+  architecture. With configurable address mapping look up tables and per tile
+  processing, it successfully generates a corrected output image.
+  The engine can be used to perform scaling, cropping and pixel format
+  conversion.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx8mp-dw100
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The AXI clock
+      - description: The AHB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    dewarp: dwe@32e30000 {
+            compatible = "nxp,imx8mp-dw100";
+            reg = <0x32e30000 0x10000>;
+            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            clock-names = "axi", "ahb";
+            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+    };
-- 
2.36.1

