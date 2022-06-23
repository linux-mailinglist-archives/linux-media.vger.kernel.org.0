Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39690557DD5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiFWOc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbiFWOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:47 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCA245ACB;
        Thu, 23 Jun 2022 07:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKJ/ul6Hgx/VhMVDoMPwvzVJIhRh2rQeaFjOMX1o9sEjKCKhSVtBYhogeRfzNPjOKahOGybFhW/zIqxa3sd9F9bU7xRzYGafF/9XwrEfzST7g8JNEwqs3Fh4iPTfgobhX31UTE0Z44SgbQfrtbVLvdRMO4/8NlwyJB9qEB0wrYfg3kWQfudGr4vQ/6B8MrukEUcJO1O9iD1oATTKEyaEma6kh55uvsb5G+PsVImAvgRdTjssnlj2rwiCeIel2eYN6VReq7SmWKZkvdvgQCwKTBQztMqhl5RN1679uuOOz+PwN32cR4HsbQJ9sgglTy/oaoQu80HwBx3hRwr41ifaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMZQNTG578mhTgxEphxMoQrirehhrdo2Ls4aTEttkIk=;
 b=N3sxZW6Seqy9qiBc/jgs3K+bZlG8qW78vISsGAiGKnKmZC/+THZMBlPeYycVOQJhhA2KIgiv8JdjyGQLHk2oW5PU0cT/oAjIun1l2u9jfv+vWRxFnXOPxSiWXVfhOhGWSY4X3MduJ1NyWDj336l0Mg0AOKsCcIdpbDpNLF4sl9y69r5xFget6Fltp62AVBoNfv4BUT23uN7cbRMWRtxvgz0YxFRI1AaS1lLsv+55qfbEmugoF2RZocpOljMpsCWcA2b5xqbB7600JY1L9GutxpP3Uw03WCBHLtoFcLHdJ20acjw5RrXu+K+uUKKaiALI18CiHtMzOOMB4PVX1sJy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMZQNTG578mhTgxEphxMoQrirehhrdo2Ls4aTEttkIk=;
 b=B/qZg/PI2ICKMOovf77Qrz0F8na4rL+q8MCP3x1cuQVwRHUA7FhX14irp5ItgRzCtsWRXdRejQHmeqSJ8RxNFktwKwCbpL6zC/diZ+dYGd53xYmGag+G3ApXhl1BwiNo1bUjGaIs6/mquie7F5oj/fv6fnSPfBuLHcFNX7qU55U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:37 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:37 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 12/14] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Thu, 23 Jun 2022 16:31:13 +0200
Message-Id: <20220623143115.3185297-13-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c1c786b-1256-437e-91ca-08da5525387e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22882FBF5FAC6981E391D54BBAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: doJIM7q7L2SQcV/FnmWPiY5NJKk3oT3jTxpPIOAs2zEqEeTi6lsWpd4K3iB7DpokDe6vkUWO8/f5WQpjccFxDp0HRhJVRluxHq83wpIdAKq7MN9bw4JRitDLF/DzbVwQk4H3ksWwd6hEWIdUUp2GXfgYGFGQ6KLX/+wTfI7CnowoCg2vXW8vJyP9KeWbW6FdJsQpG3V3d3emyfqjjJWj5bxUOOzW0JONGKqE6e29uvX5FVMvisxp3wfjia+TfCt94QU3AcY8vE1aQqVD56zNvWQOY5ltHIH+zduh5on60ZR5MKTGFlHFy1WJNlifTt9oO2b4HdMqp1D/Q+UkXURHZYKe4C1CkgXc461auITJDjX7SzqTf9bvgVj9decGhf8Vt/I+0F4hYW1krjum4/lZFz3g7TXXrYXNG53rSdW4qech6BS39JeawlRi90NKVXaIHMLzH2MAEs8qrofjVXasVCikbe0PQw5XatfG+1EESmXIDL/HF9j1BUFmYNo/iM6pUamn5bV6uGu7CM6GjWoQUFGYUcFfQS+Fx5T40+yhwCa1aJ5AVCtIQFCjgKfFBX1vPvH5U5LP+0lTXkV9EYuarybdqSiO53Q8bvgHvTQcOIfe8FN82d4kWH1TMdBeRiWjGlmkJAbanXgB9SWxIwaJP9ZP7hh7htjvsLN+G9mcrfoe5wgNQPmJoPk3FlgYNDUM3kyc/mJ/pu0csjnmd9R+etDEAPAGeM5CwMv0Nk8EoUatiU0mhfblw429NC2MvRKPrB9r7gcpoFniRF7x6yi6AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(966005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jx2BuWHoOJ/1EQPt6gmnzTNgzzh9Xh23WBJuKig/h3wmBQAEeA9rdSCbTLkM?=
 =?us-ascii?Q?y2FCUvz5cu6G2aXLGgIktGpk0McB09KA1tZQApC+Opg7+U9uSvFyHAD1GSdh?=
 =?us-ascii?Q?SlVGLUqWTwjRvewE1CR4WFR3ZHGdLgcdhQELqWahHDcgYJZKbr+FzwyJx5H1?=
 =?us-ascii?Q?7W0/BIu8Nr3G9w2eo1jtzhy/doJCUE72nTvF8PegUjOzgIs2MZIwpi+aygd7?=
 =?us-ascii?Q?AufinqohEd5bca2y4WPQN+iylo1JCWgORkar22fgIiYmib9Im7mudA1w4R9F?=
 =?us-ascii?Q?Fchw6j4b85whdj7Z1xO4Nbw8x2IN98ZbFmSj1Yxvrh5BFijzKySimYBAaIbO?=
 =?us-ascii?Q?N74nU2+ddiu2tOoddviH+AdzZfXNK8ZBg6MNZKxRofbrxeY6c1nBiFkJMq6j?=
 =?us-ascii?Q?lELEWkEDD0mRlSEor0j0RDR9T8/CMxxqmxnKOi5eHsF6pHjQo78lycg2q7RD?=
 =?us-ascii?Q?8AKzG/55oR3wJTSb5yM/dHBHv5BkZa8fUkw1xDxRMbGc6bVx5Te9uo9USpB7?=
 =?us-ascii?Q?nDSA4bJmKxsGqixY7Cb0fUtyBpOrSmbRMlDut6BvEUmwF3ThWV8jqxPPhxmB?=
 =?us-ascii?Q?fHA7OSMa3VOFJ5sIegLRf/QeNZzw90B7u5URWu305dgEnIm1VszxVqtaT6bO?=
 =?us-ascii?Q?/iD9ELbzKeB5EVDJrYyQLUCLPcvs9k1Y7hngiGxWChvHAK+bmRiuASiTa1PR?=
 =?us-ascii?Q?ODW114P3Cuda7baLEcGosjiWSDruqplwOzx/qANm2NtxBefeEsqoupnT/XMu?=
 =?us-ascii?Q?Ci8JeUPx98UC3MHsHoExSEHCxMA71VwtcE6hiSgxUp6pSysf6emYeEr0viHf?=
 =?us-ascii?Q?J9DGjJ/0lpju3mUbh4LXaCkn+aNGpTV7mC/PRzVOk7Q8k8sYn5P1OPb+CGeB?=
 =?us-ascii?Q?kNRLGs50x6YWcKye5aIjkyqqYwhU31G7QsiYdbj40/INHZmTDphSF5EhZgDr?=
 =?us-ascii?Q?iRLrNClukbgL0TvUT3lWH0kilVQ4zaiZiD8zTFY0kWqvjRQWjZ0kd32N0cq+?=
 =?us-ascii?Q?qTFEARyN9jWctHZZxOHnEL/ZcPOdy98UebsbvlLuvUovU955r/5+KMvdhQ78?=
 =?us-ascii?Q?klo1QhbB003U0BVvr2dzUfPWbIyRTMysM9DITLDDqe2Ekkrxf7BY2mKNqlME?=
 =?us-ascii?Q?joeiJHUZXgeUP+Sp5lqpC67rnbX9373QRhkzXWSaM1SNHJ2z1PSkJ/XkGoFm?=
 =?us-ascii?Q?vEd4F1tUK7qM8SNFsBawOZcTg7XgsdlTj71d6WpqOvZgK2AhP2zLI1duIgaM?=
 =?us-ascii?Q?3pf7VHCRQ9sKPiCtk1+F45BWJYv7RNknpqgUSMMKa7Ekg4evy1hI+/I1vds4?=
 =?us-ascii?Q?EVN2B1pI8OohMEIb/WVhqtODG3NillsGA8KTaxiKehKn76LxL0mzCnVqTJTU?=
 =?us-ascii?Q?inx6kqPD0X6BbuFHSdn6zPHmLccKRaDLPbxPYH9+2oDtEp2l1Awm6cHuWXvo?=
 =?us-ascii?Q?YmnFsGwxvFvxl59NxdvGp47jMa5Zx3H4bXDiHVexuqMZo6hu+rojnreTXawh?=
 =?us-ascii?Q?SJ1A/RlG2UMvCQHyV9EB02oYnl4xmmbouFMP593kzqEooM1wXw+QirA1mMNL?=
 =?us-ascii?Q?8wO2+C4Hw047YzyUM2T/Otec5kcm2S7CfRJraUn4vsiAzZtq+8V2AQ47JVvg?=
 =?us-ascii?Q?fjX4x5aOnPlWOvRvcaaOXs56qc4NG9R+uh4/HY37fuglvrQTNCh1XAa/aXMc?=
 =?us-ascii?Q?5/nfZp7fBhH42YXsl4DqDbyFly1gcc3HT8WVY7LfX4fjClgKE5rq0t6/5ajd?=
 =?us-ascii?Q?eDS1Yx2AW6oz8/Gp8c7OGj8Dicb0qGph4PhG49ivAGrPJ8GTyluD9MNHzFHO?=
X-MS-Exchange-AntiSpam-MessageData-1: JML+MtGrl13FD0Z+9IMAxABK0Vfd3XOjSX4=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1c786b-1256-437e-91ca-08da5525387e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:37.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwDmtFfA2fH/dzdI5LnQNDohoeFcSDoafmpI7cg2Y/eGSLqtT0rBGnmJ4OGpZD8HN5rpVtM1Xv283R75snw4wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
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

