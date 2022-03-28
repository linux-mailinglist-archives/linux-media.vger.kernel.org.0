Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478524E991E
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236954AbiC1OP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243700AbiC1OPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:48 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EF79FFB;
        Mon, 28 Mar 2022 07:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DctxPPfkyqs2Q/a0+tli0oa9x4laYBVWVLHKpRMamBUyTSseYp+ZNfNOYLbc5BOjNiXTxvSyKvZzZlR30JEsUnEyh3QhieNowAo/e/fBQGrcoskmdFhMdUwFmXN2HEeDs5xGUgsFZz93bP4+dHXgxDVpl4EUtQpEXfhNPz+5gNYEdRazBqOWSXbGwnTJa7XU4PDCXdlr1BtTsCoUtCfilh+RGVGpEEPw084ZmbrRmziURnk6b/5bRshJ7T6SLyMVtLrBU0jIqqMYVCZO8Hc2ibb7mvilRfIL9VoWE62jFQWs5Z+zp8k0d1YpDzU+NcgtXFsoRTXklt71xGReh4gKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/NMxiuvers4CUp3LTTdzKubv7y9Onyr7UrDUHinEZ8=;
 b=lHHrZ+siSQqYV4FfcDxPy29myh0C9hhjkEEpjCuVxlLTakoPR5sNz6yOUTUhR7MCuTqALVDM/DvyozxRG+BbIdmeFCwf1Stuau+5bdg3uQELYR7/i8jum//WxCefIDvDNLxBpfnjk8M2Kkhs6AZCRvZF5yqRcRPMt7EcwyWs3mMw1stxBkdIkp/11TC27HTEuHsW7kkDv7P0kNWfcANovwIP55bhntoPCghnH44y0t6recVTqjkXFglY83duKQqb2gV6tcnu97ABSwICCdRrICP8/4IGpPJnLmDycWYqEInoRe/dUOAI2bjr/U//CV2eIHKywmeagc1jlMP/DJnH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/NMxiuvers4CUp3LTTdzKubv7y9Onyr7UrDUHinEZ8=;
 b=ZXfMMw87dyaAmN16I08bWYyqlYVaHxSi+mP5xBICNI69Q6EDw/Cz0XSzhfBOVO6A2MTgO36omyBZuOEZjnY75w05khpOcdUOQZddbKsWM0Widmz65k8lG9Fe7Q7w7KYxFMxqsMR8KkDOFsYyKDTiGVIukBzrLlfp3QW1XfUmq+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:14:02 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:14:02 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Mon, 28 Mar 2022 16:13:07 +0200
Message-Id: <20220328141309.177611-8-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0032.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99df2a12-eabf-4f87-3bf9-08da10c53552
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB44188AF419D9D9B34A61DE00BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vhMvwoqPf8KlSblPrT4+WGXc/tEbpB/nJqF/8u3H3MMjf34y0epJCdQ1jkaZgK2herPLNkJtLqCiiWT3DpIT6VNFA8IyqJ61MeKt5a9q1EEOFUH6G8615H4acgBt6iXHMPUpJJOzSilC66idbVggBRiUXnU7FO474GyV/xrIIZSufyktxodth4APCIytrg2I3VhKWHQ6K9bxIm4A2Ou6j/He7Mn1Bi6l5PPDGEwGFjmn5sL/pIuj3ipO+9O2PoKyRKNTCc+1xPw79CPGtiXiNlMAiVzOqRgzaXiGZahsj458raFcGh5q9tH6wKUmHJ7MDJYdlB7WHJDIGJ2oIUwef4ccWkHEhzcxWGDtxFIK+rAcs6NbGxBHsu0hoQpE8HaqEHqbz/Io7SZUcrilKOBIA4l1kYbJ3yZcu0rCg5mu5rSgbaxdAv0VJntUY5QEnxT0sqrilGRVmxuZL6h/iMHF3Rj5fVngg5CBimVm4Pv/KenpUB4v2WrXm3pf1BTOwXMCx7M1HwUqdSqBdxfWVSLVnIMGyLCGn6mJJY6CHg53NBlY74uIN2Pt6DhA/blBFZQY3b5M4hNnaD8BTn2xwRYicmAIMdxbk9Lru1eazK1Mv0mqV0+dNk7f6vR85iP4AbvIguxieqFjudh86Nqs+eKHihC8OlJNnMIZHb+HGBXYK0AqpYeAQNBI6PMHTRBBv8rqoBs4gN4NRzgKY2YMJWsFld8DBDEjJS2J2EbIDUi+BLHM4rca5TGkygBfAKS6U+jUD/fo0uH4PD3eom7x3NMuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(966005)(6506007)(38100700002)(66476007)(83380400001)(8676002)(6486002)(1076003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0YZrpUcC6wxPFzoQBAcQYFSTCb4/yMJ2bzfyKP30+LlMzcc2u1V10bPDfZRn?=
 =?us-ascii?Q?I62pwHFWIKnqdjUDnunfiox14QqnCqvyEMdM2d71VWAhdbY/1OaZnyV2tzSY?=
 =?us-ascii?Q?MsoFmHDwmDz2rFVjuAiDy18IUtiVHtYLbyqJiQbsv/XNKpu6KUhRJx9S0Fax?=
 =?us-ascii?Q?AwJ8tbSywJZJvhocmlnrV1rjCGGMxuP1rvWgsSahyjLwd/yI+vokd/E/tH1W?=
 =?us-ascii?Q?zQls7ljdieAiB9O4KqKuLnvJP54GB7vEBVJhSbnHP33xpHlyjfGcD1LiexEs?=
 =?us-ascii?Q?LEmkftbOuUclerjC0pjHszTpRJ+JYHpbATqsWnJVgJW6PHu8UMuJWizOmthY?=
 =?us-ascii?Q?z4X+WtW1jhmwsbLB5irW504VXmnDA+2dO+m7rl2Mw3Cs46lSXuhLDqJdeS4y?=
 =?us-ascii?Q?dGyBLYTk3K9JWhR6BLtpp8uoIiCfrCMwgIrspolVpm/iu1GPQD2LHvx73+q/?=
 =?us-ascii?Q?hNd+NSK8fM45sKDloG2P/ODCOXfbw8ASYUxeII3IEk2lM5p9f4jXlc53HzPR?=
 =?us-ascii?Q?sn9cOnuPja6tmXRoSMUbSmxp5I2MqCfDc9Nq6rUaYwLRLrafmn6dYjt12LdW?=
 =?us-ascii?Q?nn5LImdAWvpAFjRoqK45QTFwMkpG69mC02z6nn3tgsT9GxBnj2fhONlTBBCM?=
 =?us-ascii?Q?LAGbUpmu/gT+666maoZBtsVJCmyz0QWd/LrT+n3bfV7LkWe5TPXcqiCjk9tD?=
 =?us-ascii?Q?x3XXtpUE15yFOo9tjrShjKANo8vO01x/WOU0NcjAqtBQrUq/IPvnF94E9je+?=
 =?us-ascii?Q?cbFdqFrBQqSqGNeykWkpGloNv59MW8iUjNq/0QIsFYLQ1bDPb2eAYVfxEJHA?=
 =?us-ascii?Q?8Xeze/MBeo32SR+A2fSVyjZCM98ccviMSFEYfHWqH3kWNi0qGJEzXZO17pM/?=
 =?us-ascii?Q?oAySTsTUdzSijM4HQhuAS0QKnSMRdhTwpt9EZmkapPbN5XdC1jXItHS06NqW?=
 =?us-ascii?Q?KZ9T4ksND1OneKgpYUDWaPwaSWUnRvdIy2WX734AdoSpl84AaVUa98wUX+jf?=
 =?us-ascii?Q?CYVY5t+rQIQ+O6gzKQG8HMss2LXFL3F3UYa502C5suSIb2iD/oCoVa+jJm6l?=
 =?us-ascii?Q?m/0LdCeR9z6UuIlnbsyVkqVyoxxbowTXdB5KwEPvn6RnKbLRscmogvEE/TIL?=
 =?us-ascii?Q?ZCCwn6lTKRIy3e6/tvGLxMQC7WB6/Hs4Bjp4KH2W9vCPLk+WFkKCKSV0leev?=
 =?us-ascii?Q?u41gEjEv0NFJeugb1tdVIrORhWUvQ/paU2mR2k3dZs06eOguVFH2ilNnDtyf?=
 =?us-ascii?Q?nQ4ReKoG+ddVJ1UTNlN1vj1g9PhvNHIHQsNtAIkKECUWe/oOqzKqXio9+TM1?=
 =?us-ascii?Q?sHaYz+xXoR5d7pZDiCgiMMV4bNOCWqsBg5APSAT0jGJ92oRkZCHBV/bWHq5x?=
 =?us-ascii?Q?Nz/ZDoKaOb+nM+xmFVHP7xEPVUXdY3sYOOEsThEHCPk56mb7ZxoxP8xI1Ivo?=
 =?us-ascii?Q?8oTinWty4/nDLsbruh3qE/UbzTPfxtwGou5ccGqEEJmJGY5XeT3Ouw+a2PO5?=
 =?us-ascii?Q?tZwXrQ/DAL9c2sXeMltPCx1RcAEfOS0qEBL4xr/+DfzKmgBob6NSHdbdk8iG?=
 =?us-ascii?Q?Iu7phTWUqt1jCbmovYAyf1SeBWl9ZikBpZ3F+Jn569wiHWnYKzvW7W8zMYgc?=
 =?us-ascii?Q?katkHSZuGIwcRcWfzSaW7VRXLT+TduIOSc6fXlHBKilfN4P6jWG34MI6kpc6?=
 =?us-ascii?Q?pSTgEb9oprL2S7vdfgI9XOtlTS5rDdcyqvhx3PeGR7Mg86CH+F/yYyzQtcM0?=
 =?us-ascii?Q?tZjti6Dcpa3FtquHZWbomShzMoR5VxI4wqlEjMKBXNV+M2OfHgYdjOtbvmYu?=
X-MS-Exchange-AntiSpam-MessageData-1: sKSzSg3IrMpl+hZpZ9rZ3zHdCUXyWXzYDwo=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99df2a12-eabf-4f87-3bf9-08da10c53552
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:14:01.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VD40haEesfS0RYZrT6BMcdfSkCJ2f+cZLcThThDwhb5hTji7hZUsKmp6ZcKYgS2YwFBgiWEkLeSvy5+OxWNhZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
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
2.35.1

