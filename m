Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC32585B21
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbiG3PtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235170AbiG3PtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:12 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF5715A0C;
        Sat, 30 Jul 2022 08:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtGRhNHKgk4NAaPhIwJlEvKGEuDhwUGYiJfJuVJVoF+J+NL25K+GmfnDFQGCL+t9WHJ3dLBGpUr6eO/Ql2U7prZApLABC8CPX0fgOvyxgDy0IRUvdKcWNvyCDdPOnLECb0/hXa2q+iM8W4m73drCMaG52bn3bEs0lF3b48j09fyutI4CumH9aZz/OMxCs+MgBJVkqx77pxunKgM0hgQbMmjXs4ovnI5TsnvpQ1jV/tjnHmUNVB93mbdmWMdmTDL2qlTIIsFVm3mjqF9apyw1//7JOEQDJGf6WBBJtk1BkMfVpMQnvdUEuuZvNbIPvMX3OGOTkkJzD6wa1pNuiwLe9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FnXg9WgfK6jD46+KNdYNCPgkVYf5pSHdRNAeKQzj+A=;
 b=RXVl7Bvc+XC9sjvu0E6oTGW8LjwAAkNEcnF9VhNC3t1EKnRKaumg0Tp5Chfn8FezeRTsofJ14ym+7YU8rRw//ppStvtWM9UVusYcc0fkDPJ4QjyDAi4emtybSATiMVKoIzsc0g6R/8Ta3HKgqFv0S+h5XjUkErBB0Ye289Leo6BkV5eJZgcFXohI5P1KEaRU2Z8Cy8s5cSh27b9DpHE0o0tQyQOFX44sf0GnJ2MNw2/3DBAY64DZrYFO8B4XUWppwCd0dJLH4AhqGSr43xBwtcKBhhRflmXSLfUW4lgVruGgsWaLKLL6estieotRx5PDYcyiURhrfYeyxVk/zVvolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FnXg9WgfK6jD46+KNdYNCPgkVYf5pSHdRNAeKQzj+A=;
 b=dhdJ3qgvaurkP0KxFsVhHdLd9Rq/4PW/2vbAMVL2nV+6mkdgfjPsXguclOpBZLX3wjV2efCbPR8H6tRvoDUMITgUVQmo3uIS0zNnwQIfQCWiudkeJso25jW+uYOdDw3GDGyvIaJKD+nG5dpvsfxd9daF3FWvMza87z7rscYfGfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:05 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:05 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 6/8] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Sat, 30 Jul 2022 17:48:41 +0200
Message-Id: <20220730154843.791378-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
References: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0082.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f72f6dba-5b4f-4667-e083-08da72430846
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZeJ0Uqp39oKOw0fFRHf1fLpAKdpcH/y5KQ3QZ/0fP7b33OA6InKXRrCtp2GziULXA2JyDyRM9XmBArWst9nYVvqggdt1rjLEmKtytiVo5korf6UfAj47d73vtm+ooR/YPlyuVzJpQR6fyvy0tR5oO2P0Pw1bnthOtdzX/ditNWInVr2MMpZjcSgElk6/FQU0wOY2ARaa3M4OO7esj603cuZlknYq1p2G6BpIpuBkMnjZ1tPIweMxvv4YEBmBNIJu9bc/FxVWBMnldQoO7XgND0sGDeAOz8qRa3u8CZol/0AH0cAM4jexGi4R0BRSwfPPouPlulQU8XEkn/c5E014wXbQfFxFlY1WeXLCHn82eoUhwxwQh0c8Pjy7WpyPixUADoNu2DhwMMOcTyJBwWGpadPle6R1b7fjlDX1stgEMuiucNLNOZPBrMAqmMpkArrj7UOWj7m2RVCXmBwz2hCLBNPqQujWc/1/ZA/eo1Pu9CcTw0IXCiSTUeDKIjg9Uip8lU44zQEinBySjjDRVR+1kBD22hr0zPFvwiMQt46QsFUWINiUGyBvkZHujXo2b8KIEwzWgqAsXIFSGluSyo1eyzR4iyeR+6uyfCCLp2mCzJeUrsc24IuXN/1LmVsBgzjDWnb+0EElNiLQpMO072QhDMW1/AtGPwA5nwqHGqRlD4mpHOp6EYUjK0PtZFuEtxOyE6Aakl7u1IxRqH1u7fg59T6qUBu3j08fYpnVnAdzx8NtYgURIIr7F4GoEEd3pgeu68ZKCH8vkiXeuQiHgnJsgR6o96SguCHGE6oHR05Lua6aJlQjvs0Eke/2EOrSwof
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(54906003)(6506007)(83380400001)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(966005)(8676002)(7416002)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HPs5x5BTHiEzlt2hXLSujHVNAZ2BArpxNa8Q1uLfRXlyIMVgjqcMp1okaoa7?=
 =?us-ascii?Q?qNcmyTjv/tH1YI2LvCS4cC5KAT4zgEt6aac8+PoDCfZ2FNcgA15qkIzjqmIl?=
 =?us-ascii?Q?2rx/1jv6B1Pjo/Rcn+Jebw7NNxZzwMU5kyTZ0r52w1/jaNLYW/uP3AV3XMMJ?=
 =?us-ascii?Q?Iybg01DV+5QnY04liiWOwPgonM58EE+H8Ufk5JDEEFwa3XOQSD3EbEhUw7EY?=
 =?us-ascii?Q?aj5HaA8tHYEC5shai/2QK0WbTm5JBBMM1TNUeNcSla47/nKUy/ilw9Cvkj0P?=
 =?us-ascii?Q?5GtEzcsxSJvHFEPtS1DBzJHHY0P1lSNt+0VjKFTooezT47Rr9w1D6zNN06do?=
 =?us-ascii?Q?k4/BddpJ1zgbrOnDAJcJdI3BVXytD1dn7tWE29QU+MQRsMVYZeDVtkG4Cs6U?=
 =?us-ascii?Q?yco25YhZUCFi4Q7VDm3Y0n19U961y8qOB7x08kWag4596YogzwlRvaTKrVgW?=
 =?us-ascii?Q?8o+novr4xxF0sq6tLpRiY0J991grQiE9ELdQNpCK/NbwzbCfeGX/pG0cKuNL?=
 =?us-ascii?Q?RAYy/gf8eKMgguq6DxixCfqTnkhFj6cbRXhXsBPngG2iU80QwbhfzHW1S06q?=
 =?us-ascii?Q?m28SW92wstANcbx0Gz5aV0dS9aMOFne/g3I8Pr1HI6w34S1id4/zpeNCn1tx?=
 =?us-ascii?Q?1OAmImoMAtTh8OgUUU5O3k6vQ3QxkAslr6GMlFvf1APYAyOl1zGacgdAUVbG?=
 =?us-ascii?Q?bt8JqyEBikVTlCEXFFB+FqTMWt7WXGq9Bcrx0sRl0dfxFT7Swf8q+tpJyQK8?=
 =?us-ascii?Q?I/8ut6RxZcsz/hzNH5KiskPfEJ+wCR5F6J8KXh0omJ5EmLl9zOrnegtb0lRE?=
 =?us-ascii?Q?r7s1ykr13k0utdXmavca/dGqVpCtdPSSHtdcTeGlmMNvl7DP5Lx7gXAL3/rH?=
 =?us-ascii?Q?84lc1UOUcSkZZ4xDYYvCguquKAqU209jfRWshr+KLmn2nuqY8vphpOav//gh?=
 =?us-ascii?Q?s5yZ7N9Ic5K/yY5zMjgn8DD7WYbzjtJnJoHtx1QF625US5y4D6Yb45dyAJR4?=
 =?us-ascii?Q?Cj5IYzub3L7kNBiKzj2Krg5u0pfL23NW3ygWfdB6BNO8ZTypB5iI+5xOwph5?=
 =?us-ascii?Q?n0a97yMh600LbF5j6JMtjgczVwFcaPQGZciZ1RmyKg96K+X+RuJaYeNZa+Rj?=
 =?us-ascii?Q?OvbeakdMmxkJyOUTVduF21rYMFDPfGaZN5vMku6NgEzEsLyM8QIROQzIFjls?=
 =?us-ascii?Q?yQIyXPzJZnXsbBDPQQKtXx2rXSsbI5vwkr+mnEFa/crYmMShTAjTyBpaSZAU?=
 =?us-ascii?Q?j03SiWI8uFvR9Tqw6nq3sRRgq1qQri2zG4NamzY8n3lxwuhjSSiWxNTsyE9Z?=
 =?us-ascii?Q?ZHRdDy0vEK/p4ZVhivwpw56H3IXSUxttiFr+ep5yG+GIUq28aCYKoUb5wfjs?=
 =?us-ascii?Q?GikhVRXqYaervRYss/5H5KBqV+WZBf1EE4gifnnpYsd6tzHUOjKeGPxVJo5B?=
 =?us-ascii?Q?rdGZaHN9fOJTiLVvUoXOHb53pQXWQE3U5qaQQyuLnCfc0PaQtOAuK6lEtcuV?=
 =?us-ascii?Q?TLjAqUMLqV+7Eb3HkrlNHTccZQHFejbyCoNUWlX2QOjUugTBcWqunBDs5oxC?=
 =?us-ascii?Q?VLute1edBSe3AF5262KkYx1t8Hn0OBhIunHv22/Wac5Elv1awtgNOHaniS0F?=
 =?us-ascii?Q?CqN4/SNCyr5CE3NBhLVUl0PFaFccFvhjqnG5FhHgizyoZ1UT0XAcg6JlEut+?=
 =?us-ascii?Q?GObccA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72f6dba-5b4f-4667-e083-08da72430846
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:05.5135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8HBZQO3lLUUJjPGGItrJXe3GHKXn3UthSVTaotG2W2jjhkMPODlrgn5dziRSe9tqGqz9C0k7eeTtB6t/Gng9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
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

