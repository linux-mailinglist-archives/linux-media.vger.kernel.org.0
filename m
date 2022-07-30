Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4D3585A05
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiG3KZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbiG3KZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:30 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50049.outbound.protection.outlook.com [40.107.5.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F2A15A33;
        Sat, 30 Jul 2022 03:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbnqQpvn82FAKHNAjLsN/HLhRTNK3mUVFU1eaC6lojnWDL8BhONuBde6Igg6G/ub+PvGQUe/rkQNyBi2SNCtdjkR9lMs5C9PyIrdmULUnLqNUCK2mrZxEoUI+h1WG+XkdoCN3AGDa+XJTy80zLiqEGab2LK0SKRKrcBKrrOD0fWzZ1DYQGapPjq/G/Thzp7V60RZ4gU4VOXeg0HSyDcMRKdwYkv2Jxvwy3dP+nGwtTUNMcDABd7xj4v2azrn3vG1PzzqF/U/NrIwwPYk+dQZGYjSkDeDsNbqkqo02Y6NsEHe0OA29hBUo3t27N1BcOI/pyyNaAc0QQI9BPgYU6rPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FnXg9WgfK6jD46+KNdYNCPgkVYf5pSHdRNAeKQzj+A=;
 b=fRzlkv5JM/EbU9AZ0mM95g17oEsnboVkTwLWl9LdUqAE+ZpmriaLxU6ay9e9p5pSfRNoLKEeYi4pFWHYXkF479vLV2SkEo6DC026NTDNWwVZr94wAi0iy9St+C0hM2YOvNk0dFu+yCqUZaa98qH+dEYZsoUfX5ZTAK2ZawVGrrCjrNJvas3P3X1pPMRqplK9CUMXYVPLCWTZ3npi6dG0rA9DnAzmqEPuF6nZVpvxaoWvVtbgK1YqI5gXcHeIhOpXUs3W/p370eoza0JBQ8tmzdNPp9KixxAIbb1nIsoImVidhL45c99be67zt9BUlieGmqgUPnffg1JfBrGPbZUhSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FnXg9WgfK6jD46+KNdYNCPgkVYf5pSHdRNAeKQzj+A=;
 b=YIvtYlqOWWh5DVIGuYhOrvThYdLP34GunBogMeZ+gaHonj6gfK5RFdAMqNhalxMkY40y1c11UKSJ0Bm/tH1JNx3fmYlnrpJHA21HUlRNU7SA4heQrBGrzykFCu3+jYOcCWu6g9ta7xAoCW0mxWyJuSoCVFmSJ81zYsaglvLidi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:26 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:25 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 6/8] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Sat, 30 Jul 2022 12:24:11 +0200
Message-Id: <20220730102413.547698-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e7a6b7-139c-4e53-715b-08da7215cacc
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nTF9LL7gZgDQCTzoLHiMWncV9KbDPN0l43JcIoS85GGwO4fy1YP/3pY65+E4z5aLC4/kpCS3CdjXdrw+UNmnTIfZvF0LPC8sNQd6WUtlnmki2XQX6KdPiqERIYVZqc9Tffz4rIwY3bOy2JBMQjHMyLlmBRHYfmmzPqsooomIXaaD/DbXvQCaoIZ2L92NYkR62C6+HDXU516wrBs/5iBHSQePqi4IzGiLp0BhXe6eTzYgdxjvXcochurQcb4FuBmd45YSvAfM/H5d25bgmRJF+r5txEtRtg4++vuvrf11vH3EI6RxfPIVYoAJZs/YfKX4OAEE/sWSVTgKzcMiUEYWjj1eiBhLw12+2RC8ymOUy33qixwoIvqZ4NEEhQWV5hd9vajSbUQ/gBuc6mCQiuOA6lUINd1TYrq2BYsoFLhONzEa4Vf7a5vNe7qYwxdHplhXAkVumrS89g8XbZe6IflCCeJYJ44n5Mzi7goo/wcRmi/JzX5d/38aq4JKCU7HYjJyRQx6ejsXYt/2aDE8i77k1pRmqw160mmVd8rJqRKEasEOrcBASsz7X6esM80xwUbdpE0aaJB8KyNYruNHyxf2N3BcvW9wLSQjl5ddtB5k+Mu3IUHu6DPBKX6TaqoKIWvqZpCfrC35gEgO7rDUnP9MIRqTPo7RSdwpHYn4KOnjSZrwkYG4wV+PgQq4tKKpvPhN/qnK/jwFgVk3pb1hi/Z2KphIRVR9CJvOYuwUcZOOEyVAH9cEAW9hXt2jMoqTwvlossy8pbcDvATXqx8NuGKs/WJR8fKK4Mi+Ul2Lt36loE9VMJKFOk1ufjQKaBm+KUW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(83380400001)(52116002)(66556008)(6506007)(38100700002)(6666004)(66476007)(66946007)(2906002)(86362001)(54906003)(8936002)(41300700001)(5660300002)(478600001)(1076003)(966005)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UTXeRzewbFEacrBvpIWg5pXVAjUJawY43+YmGooymBlJIjpi2eYRlwcgE+Z0?=
 =?us-ascii?Q?cjYJu7jP+NziuW6VeVWkMZYhUNfG2qYarhpm2nq9P3VLrtT2I8sIc854LS62?=
 =?us-ascii?Q?YlJwAc5DvTRuuesSo/7felDci3gSDEJQ9qKZGhkFHlc/Pku80nT/a/yQR5+6?=
 =?us-ascii?Q?odqw8kfo2zWDeBCcdb8EhISsmUFevhAYmrGqylj3q7AwaGHTg10QY5hY5R0r?=
 =?us-ascii?Q?FGvZnfrjcPV+EqPjbL2cCqXfTA7HJlZJkKeelJAYvP0aWIpw3qVqLnEijrO7?=
 =?us-ascii?Q?vKRuhg5YSfAvZjan3LaorwHehWYuf4PGOPRYkp7oS5Ux0Ts6C8NMtd8H5K6U?=
 =?us-ascii?Q?/EUOO41rDEkTt0+Y3az/oC8TePwU32iEySMu+4k5+o6+NntkKAo68Xikvfr3?=
 =?us-ascii?Q?qiFYaizsSF+H4Jgra1TwSvgwQXDVkawWpBKZGNk4sQ1O0f894eYi9oqqXGk1?=
 =?us-ascii?Q?2NnzRvTD8G/HFBO7x/i8BG3CXPMfEsmP1hPmWLjQ/OsQmhMdnii4P6e58Mjt?=
 =?us-ascii?Q?NkvO3pcAKGdymugG6Qv8wtCdQi8xFLI4r6S/AVqyMn0PgIcH3p/pA+xBHFeS?=
 =?us-ascii?Q?bYgAwR27MK26t54auuuA4mRTjeWXwFJEl5JtQewE2ksXNN80+kk2sSNrOi2y?=
 =?us-ascii?Q?iILbq9laBx2WiMV2M7kodfvulrZPfK9KW6yYkYYtXl4nUFhYz3wRbz1kAngV?=
 =?us-ascii?Q?P0Q0+vxq7BHHrFr5OlRSrAY8qtxmBg9++S6Kf628Som6pMOdJ4aKZ4tEIHO2?=
 =?us-ascii?Q?GFZ3H9k/lK2qwP1iVG7bvptiAdM8L1FsygC0jLVTkLnAZ8N2O++7GDxbsDgk?=
 =?us-ascii?Q?OhFKHAjFsjokN8zAtt2jW7ls/LbOyZuokqoG4a7vorRfuzzIEHV+MK9mrxc9?=
 =?us-ascii?Q?ec8F5qDrwNiQ9eA4OM8tUy1E4/yZ6WETonvRbZ5MRw1HGThb9ztKlDnBz/X7?=
 =?us-ascii?Q?M1wX6lkzGRJjFLm+4L1phdrO32pYvtl7bKYYo4rizVwY0x5oeqU6ziL0dKWp?=
 =?us-ascii?Q?zoVBI/1kraQKW2hh/HQ2i9gmJTEsrkdPUReH2WWEnMuCscp3Ygtds0iHrGpD?=
 =?us-ascii?Q?rz58Wy3pdcbqDUfDBrIirP7bTgAjW1yxDWkJl9HddFx+CTY1IU6Ik7kNQcQL?=
 =?us-ascii?Q?4pcCdSxX1KBLc5CSrTXqtjYJT/+xxk9LR/+foYMyHFvftV8/QF1+tJJHXGjz?=
 =?us-ascii?Q?RBVtZn0bSjWn0U9/JZsvoAZcXSmVLD+8W9+cb9TkCnoppzXuJLXNK90FCIx/?=
 =?us-ascii?Q?pOiCpfJ2DKcstq20vzEXPPQkJ8Lg3vOKI2yS+vhTs0KqMMxLvYk7neOTSpcl?=
 =?us-ascii?Q?z57V3YnG1Z6JxFyzIhYih1+86bH92lv/rj1xweDYRYbqqyxPagLEmdJazDvq?=
 =?us-ascii?Q?F19IVu7oD9sHOFx6w77Y6QHYC0hieooBYLTSyd9d6NdX7Qax7mcw4qeeLaGe?=
 =?us-ascii?Q?lpQdxM1phDFdFmO/uWJy8glvRpXhrycUT0FqYZ6fqG2x2eyRt84ArOj0nqQJ?=
 =?us-ascii?Q?1lQclB54PMaI7re/mo5pkbc27T0msZZ0adurgcq1V5orHadEkoZv3IA59B2t?=
 =?us-ascii?Q?N2j4oejL2gMYeLvlHN8fiIuGgpvWIdtQ/zjUxKFmK4aV6Bv+ePzM1/61BGgB?=
 =?us-ascii?Q?p0YKo6jkaUPaA2YFd2jMiEAdAcuEfoPI6VZKL5Fon5/Lfi47QtNLfbviLyIw?=
 =?us-ascii?Q?W8PJiA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e7a6b7-139c-4e53-715b-08da7215cacc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:15.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvseqEmXWriuRSxyaDg3uDbnPlRGbLZ+f8QNnOSAiBVND6OxeYc0U+pICRAal4+SkZ/95tAQ2hd2gyU26mbq8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
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
index 0000000000000..21910ff0e1c37
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
2.37.1

