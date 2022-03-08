Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39D24D2248
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350168AbiCHUMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348277AbiCHUML (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:11 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137794833D;
        Tue,  8 Mar 2022 12:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8Ef03IwM1TD2L19YYO1zHZFDilnJOl649k/AhLOaDzQTGcNCQdvmon18QcpoBeZuGCAZ1Yyge38DS7mdeuEUFaeNC0XXQMoTcYyhR3G2kAQ+VJDTDEGM3e9max8hxLlKqrdNn1MUs2ZZtIH3InGtZP3FNpqabVUZdrynAcoIak5SYA6gt4WfoG+jU/NhHF5Ji8YqsFsMfRYyvST3phzaBTdK4oAoYNyJxt5tfpF2aTViAwkD+DeaEo7XqiFIeqp4mwAOglEyuJVUiCdmiTDGL08d3YRqp1PBUv2Ls0ke1eABVGHv81OikouH3+vnmkGteD2fO3qp/vi1xEhZo99Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euecBA5KU4JfTB107Tutxzr54jP8p/8G0c6Kiv5g+cQ=;
 b=L1b9iu0zUnAJu1utB8qZydruUYdxb5ZZsc6RqW3sqwLS8zkKi1Pz/Z07VmRR94+lLfa39QOUNZ1OjR+SjRxgsFZfaOESynOyFC+wcEfs+znCuGrFaqBcsEh9agKNk+aFrze/owJvOs8DsRXOaddKuViMjyYVVLsAx2STHZrqWFiXYKEEn5hDa2MMuXR9Kq9fYpoSvKP7mGWeXj2At2sgSJAHfMU+5fhKCU+hC+2C43AFzi7rEzjjNQBwNNOaQvHr7PCCaA7IT/gfoqbJxGxRbqltZjsJplH5L12rx/dNSozeozRwPxAVj6LJPOfKShrJ8XAug2+XOREX9yVjrfvWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euecBA5KU4JfTB107Tutxzr54jP8p/8G0c6Kiv5g+cQ=;
 b=QBoLbi7KlDCRRAX7XezzcMdZaOgX4/PLY1E1IDkpDMJw8Ff67ZQpgdiNewmuSqsv6xpqYq2Nc6xFk6u6oZuGrsRVdcmyMYGnYknn1wH0srRKbKanQI+3e6d9+27O6RY72pL58zuoncEkcUxbr0KfDHjCn3tAzIYbLOCzJP5HtTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:07 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:07 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Tue,  8 Mar 2022 21:10:36 +0100
Message-Id: <20220308201038.48386-8-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b4d83c9-a95d-4b5c-c896-08da013fc7c0
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4588D8E80159D4231AA89A4BBA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mUy7cCQMB+18pFDcP41tu0m6UwR6f+GinENuLkka7tz7LSX/iUPO/+ZBKaUCd/swjObbEvfO+mBT7RC05zyL8z2HddKXdUQbI+0vGaFnzRfxQqTCJzeDqVLAKLUJbXlvyEIGn37bqz3PMrc4Zqc/0thEjAm8d5EQBy6TvgUCLjnHV9NkbLL0shLb10Ls8moIj7+kIPbzor4lck50VDjsXVMPz0pVcbem4UNOZOAImot9PtPZrtCfueMSYwDhhAwSV1GObxld2qdN2RjkqPpU8xZUYiYq1/9uti8kRqRTH9rydictqNnsUlEm7UH7inpVrE5p9GTZ9tZr26qz1oexRr9D+q957Ajq0YhwDHMsrx1e8xe5yYvPBSceWFdiw+vYix70CHp4E298xMzgSBYA/JmKTUbs0c9X6ILshAhvxkYVkGjEhNg+3N9Gj2TqZRD9mM342fMlsuN3eB4Ttez4q4/IfpzP3NGngEII5n4pmfyg5kmEGB8u63ix4aASwpTodtkZG4jFOvw+a90eg3yCo4SUoTbJiRDXaUXPXqktqoH+aIWvPstWhYF1pUfyHSk/tS+cnHEg1k/RmLmfwrCHPaK//QY/A37lnnB/YGmg5ozta24ZShizQcfFPFBZ6hFNMpl84IyG+fyzvxYpLc3fLJ5CtPQxlu0ZkSiQ09UlS+ah1y7mcfAVJ+ZuG4Wmu9HthO4uWQiElsbViMRHlqEuixydUn/Hyn+vmv3GiZNokDMzwX2ltQTkKGAtS9crWxTCbljTbV/g0ydACDft+k7exg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(1076003)(186003)(2616005)(86362001)(83380400001)(38100700002)(966005)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?41S42n+Z5TnvjAvehzE9SUI/YBkq8sodhKK+EWKZN1kibNUxzBMdX74wv2g3?=
 =?us-ascii?Q?AYWS225dL8F6yaD2CcMEGfBGaqEBeRImjYqdXpbvRsOoAE6c28ow21xZd2iI?=
 =?us-ascii?Q?zsiiRc/j7eQxoyZs98CFEWmBBzn/wqyF8NpI9ZW/PTbF38MdeXCuHciqlMcn?=
 =?us-ascii?Q?eIudpWRgwITkc3T/YfpfW/1ppIbIj4JvEiE0CPhmA4JrZ6O838gYHyk3Vn4r?=
 =?us-ascii?Q?JP2XOCsQVJM78nUY09lYxN9E0Bu7n/ToDCQslehLh02dZOQx/vDocU7hrMWH?=
 =?us-ascii?Q?AJIYlKnDl7CDLgj3OEPwRyrRo6JMh5AY46GeJ9BCBgD8ola1cu1DXrsmRSfX?=
 =?us-ascii?Q?HZnq+/IWc2GBPGek9odODSjEHTuBDHA5W4CJU4MPvBdc/zcJvzSLrHejP6QU?=
 =?us-ascii?Q?BRCXWrs45mEIFqxIO70GpdYphvv4mIcZZ5YQLj5wWBUtjABqbJzWgnGptSAC?=
 =?us-ascii?Q?iXk5zv3P28YaxdVoOYHiiUc7/MfYNyKd+/VGgSE4fJCyysn0hd8XYmPdxig8?=
 =?us-ascii?Q?k1MNrX7QLdud85xveAeqSHMs9ki7kjVGoFNe6Py1b6YBZfsa1NJcg7Zedrxn?=
 =?us-ascii?Q?uyhhtPimrwJeV5XK8txw4LEaIPQpOQQCsFe1cGcGg/vUIjxtNJ3e7yssj8e+?=
 =?us-ascii?Q?3BY2LwrzYjo0CnPjeJI8y69Vin9GJhcKr3oXzORRH6GLcB3siaBAthBnWe5Z?=
 =?us-ascii?Q?Qm9cn/lwtPGYZIk8ai0md/oRnhFM7xRQUmmmvfCjPnufhohqrhrKk+1W5rum?=
 =?us-ascii?Q?MzbU6QXEJjbPdZNR8k+FCvzK0tVqo4RM0vW07dfutp+iFWIKEkdL0kCJLeC2?=
 =?us-ascii?Q?AqirIkbcsF1j5g5E98zL4LbpTHejpQ2U/axK6bhZPeSQMP31cQzFWqILQ+PY?=
 =?us-ascii?Q?b4ua7fnnrhBpO0E8g41X8XtAjyrFytItXK3BMvYIMYxjmK3ss2Yt1QfrHqx2?=
 =?us-ascii?Q?XlPB0hqwQAOTOAVieul1xJ9soQ3rsenW6oq5gINDd45KAPoiUEWgYRmVagv0?=
 =?us-ascii?Q?6pjkJMgqo/6JjYKT7rumGaevaw3NYW1E1+9wovco/aVC1od++wI3wWTYWfJz?=
 =?us-ascii?Q?wZ6bHjLSTHq5p192sOHrIcyYc2yFbhmoDm6NAtR9R5+kHKXcLrdy5g9gFUlu?=
 =?us-ascii?Q?+UYKuxncKdJ54f0Ee7H9laxVi43sIAcS3ERgECSMfJzWaCbawrXVcz1Vx7ej?=
 =?us-ascii?Q?CwkFCeRhgit9a/1o1PGHkJwjDqmSGQPcZEsjaLg0Nma842CfyKoW9p/lvklr?=
 =?us-ascii?Q?wRu/uYgy7+gKD/b9SjzRfbJfBhVjbsx127GJFQelqNT25zckS9+6ErVuekzW?=
 =?us-ascii?Q?DI8YF/IH/361XVCgof7vXLAnrx+bEynn5g0gwMlxSEn+t3Luy4PYdErielmr?=
 =?us-ascii?Q?15o3yOUdlIsxAy+xVHT/8TTcJ0mGPa6VQ9Alkof7XrS+CUH5sSC9jUbaR/56?=
 =?us-ascii?Q?Iaz9RMeiHewve4rskpWdpBe7Mac59XKjiYrM9l4uv8UkoFDFAbz+K1TndvkW?=
 =?us-ascii?Q?PSQILdGvvlSrEi1hjhlQ8MV34OwLUO9VA10DzVvTRauIlIO1hwS4AG6MY8jy?=
 =?us-ascii?Q?IHKdiAXbte2tjL9/h8jKmbvNv0GV5duiB0RySn/ezH8/GwfV2BwLovxpDF0D?=
 =?us-ascii?Q?OIroWgQrm0XMiPODHM2b2BKpR6M6YRSk8jDncgohNNfI+BgznNLL1ffVi5d7?=
 =?us-ascii?Q?PGzCuwcyF/FInCNb1dM0iGjy2hc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4d83c9-a95d-4b5c-c896-08da013fc7c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:07.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6THOHZ+0lg4s1CRExOG/+ce8pohRTQgqD7kMJRaE/7HF4tx29azh9QbQLMXtjBLRHOWQQgWnP4Q6S87X1O87w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT binding documentation for the Vivante DW100 dewarper engine found
on NXP i.MX8MP SoC

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
new file mode 100644
index 000000000000..2c3b82be0b74
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
+      - nxp,dw100
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
+            compatible = "nxp,dw100";
+            reg = <0x32e30000 0x10000>;
+            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            clock-names = "axi", "ahb";
+            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+    };
-- 
2.35.1

